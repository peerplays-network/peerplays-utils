import csv
from getpass import getpass
from datetime import datetime
from pprint import pprint
from peerplays import PeerPlays

ppy = PeerPlays(
    # this account creates the proposal
    proposer="nathan",
    # Proposal needs to be approve within 24 hour,
    proposal_expiration=60 * 60 * 24,
    # For testing, set this to true
    nobroadcast=False,
    # We want to bundle many operations into a single transaction
    bundle=True,
)

ppy.wallet.unlock(getpass())

result = {}
relative_id_counter = 0
sport_relative_id_dict = {} # key is sport_name
event_group_relative_id_dict = {} # key is event_group_name
event_relative_id_dict = {} # key is event_name
rules_relative_id_dict = {} # key is rules_name
bmg_relative_id_dict = {} # key is "event_name bmg_name" since bmg_name itself is not unique
bm_relative_id_dict = {} # key is "event_name bm_name" since bm_name itself is not unique

with open("./peerplays-proposal-creation-source.csv", "rt") as csvfile:
    reader = csv.DictReader(csvfile)
    prev_row = {}
    for row in reader:
        # fill empty cell
        for key, value in row.items():
            if (value == ""):
                row[key] = prev_row.get(key)
        print(row)
        for key, value in row.items():
            if (key == "sport_name" and sport_relative_id_dict.get(value) == None ):
                # create sport
                ppy.sport_create(
                    names = [["en", value]],
                    account = "witness-account"
                )
                print("create sport " + value)
                # note down the id and increase relative id counter
                sport_relative_id_dict[value] = "0.0." + str(relative_id_counter)
                relative_id_counter += 1
            if (key == "event_group_name" and event_group_relative_id_dict.get(value) == None):
                # create event_group
                sport_relative_id = sport_relative_id_dict.get(row.get("sport_name"))
                ppy.event_group_create(
                    names = [["en", value]],
                    sport_id = sport_relative_id,
                    account = "witness-account"
                )
                print("create event_group " + value)
                # note down the id and increase relative id counter
                event_group_relative_id_dict[value] = "0.0." + str(relative_id_counter)
                relative_id_counter += 1
            if (key == "event_name" and event_relative_id_dict.get(value) == None):
                # create event
                season = row.get("event_season")
                event_time = datetime.fromtimestamp(int(row.get("event_time")))
                event_group_relative_id = event_group_relative_id_dict.get(row.get("event_group_name"))
                ppy.event_create(
                    name = [["en", value]],
                    season = [["en", season]],  # season
                    start_time = event_time,  # start_time
                    event_group_id = event_group_relative_id,  # event group
                    account = "witness-account"
                )
                print("create event " + value)
                # note down the id and increase relative id counter
                event_relative_id_dict[value] = "0.0." + str(relative_id_counter)
                relative_id_counter += 1
            if (key == "rules_name" and rules_relative_id_dict.get(value) == None ):
                # create rules
                rules_desc = row.get("rules_desc")
                ppy.betting_market_rules_create(
                    names = [["en", value]],
                    descriptions = [["en", rules_desc]],
                    account = "witness-account"
                )
                print("create rules " + value)
                # note down the id and increase relative id counter
                rules_relative_id_dict[value] = "0.0." + str(relative_id_counter)
                relative_id_counter += 1
            if (key == "bmg_name"):
                event_name = row.get("event_name")
                if (bmg_relative_id_dict.get(event_name + " " + value) == None):
                    # create bmg
                    desc = row.get("rules_desc")
                    event_relative_id = event_relative_id_dict.get(event_name)
                    rules_relative_id = rules_relative_id_dict.get(row.get("rules_name"))
                    ppy.betting_market_group_create(
                        description = [["en", value]],
                        event_id = event_relative_id,
                        rules_id = rules_relative_id,
                        account="witness-account"
                    )
                    print("create bmg " + value)
                    # note down the id and increase relative id counter,
                    bmg_relative_id_dict[event_name + " " + value] = "0.0." + str(relative_id_counter)
                    relative_id_counter += 1
            if (key == "bm_name"):
                event_name = row.get("event_name")
                if (bm_relative_id_dict.get(event_name + " " + value) == None):
                    # create bm
                    desc = row.get("rules_desc")
                    event_name = row.get("event_name")
                    bmg_relative_id = bmg_relative_id_dict.get(event_name + " " + row.get("bmg_name"))
                    ppy.betting_market_create(
                        payout_condition=[["en", value]],
                        description=[["en", value]],
                        group_id=bmg_relative_id,
                        account="witness-account"
                    )
                    print("create bm " + value)
                    # note down the id and increase relative id counter
                    bm_relative_id_dict[event_name + " " + value] = "0.0." + str(relative_id_counter)
                    relative_id_counter += 1
        prev_row = row

pprint(ppy.txbuffer.broadcast())
