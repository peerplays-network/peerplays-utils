#!/usr/bin/expect -f

set timeout -1

system "touch ./after; /bin/rm ./after*"
system "touch ./before; /bin/rm ./before*"
system "touch ./wallet.json; /bin/rm ./wallet.json"

spawn ./cli_wallet -s ws://localhost:28090


expect "new >>> "
send "set_password password\r"

expect "locked >>> "
send "unlock password\r"

expect "unlocked >>> "
send "import_key 5JNHfZYKGaomSFvd4NUdQ9qMcEAC43kujbfjueTHpVapX1Kzq2n\r"



expect "unlocked >>> "
send "create_account_with_keys initminer son-account null TST8kLKo9seYaJvuQSdwFd2YAi29VRdCVeLgd3E8A7PUFaKosYRGL TST6wibhLBtEz6tmYhWu3aQh9PMCfqbdqozs7fbSc7ESottim7QB4 TST6aEkVuFwiZB8Fz3fDSH5pLuJxmMHbnVW8t6wc2oGMkjsFRTyVx TST8Awh2THVMy44jS4daKQmVSeTHjW66Zey87wyZCiTx8NrTd2KLr true \r"
expect "unlocked >>> "
send "import_key 5KTrh53ufxqzy8srfpPePAE2KooM3qnvExTPiLHDz6DXBfut29e\r"
expect "unlocked >>> "
send "import_key 5Kh2g1W9mbeBix6wWdNi5nRJoZjit13FKSaAq9YpXxVVCxWc4WS\r"
expect "unlocked >>> "
send "import_key 5JgKuFmmBujK3VfFg2uqH71EvLV3rsDUYD56Vvpe6VW8LRcBTTv\r"
expect "unlocked >>> "
send "import_key 5KQzm63jBfbUJ5A8Nr4owzNMDkwuhEPz34UEBgvyizuvbvLGAG3\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount01 null TST6WnsoE2Qrf4W6GEwUHjgt8yjFPVBtU41AZNEPqzQHXhUY31hBm TST7uyCVRCLgqEpVkGRn1MsZhYDyYprAbrDXWsMYTWfbVqpJrdpJi TST5YaJZkXYQMjFQ2WhrVrkErjJvcRX2BiWQkSsKgfam9AtyWq9oA TST5pYaJTJJAdDHG3UGTsqZ8EWTqku1ouVd2tirmAsiQ7t5Uf1aP6 true \r"
expect "unlocked >>> "
send "import_key 5K2tTPmxrLwyRgE3wGK6jbvaQ83N5iuXbf1BPTcqq5yBW7xdAKP\r"
expect "unlocked >>> "
send "import_key 5Kd8pf6UsKLUEMetiGTSqRZApLbwFat2KQ2UCuUYdD3hPyMwkfy\r"
expect "unlocked >>> "
send "import_key 5KQJRi2Aq4zw6sghq4cePAfXVC5MhjDYqJX48NH7jVGqBasWFiU\r"
expect "unlocked >>> "
send "import_key 5HwoF96mX2iS2Z8t1oCGWthDsAD7f2B2Tkj8gAWX8TpsF5dWWSt\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount02 null TST6kqsQhm8J9FGYm1EXZjihX6tM5PTqma1Ai1o4nD42mkMuZbSMC TST8GzNvxaQ1RJG6VZGMkxCdMvw8pLF5vkFz3rBXjMWgJPMhaxAFd TST5MPEwWY5NuvborHNBjvKAe7tMM97xPPrKHCWTxD2AL2JGA2h37 TST5jUvN4ftf6aoY8ZJWB4u7BWRjuLjdor9wXqpBHfccv5frjdwAB true \r"
expect "unlocked >>> "
send "import_key 5HtXTr4e1nxgTwniqeaszTs8JzbfLPVqWJh2BDkrBi1JYXLxyHF\r"
expect "unlocked >>> "
send "import_key 5K7XvqqVkL4RVGJQKaqz8M1CQKr6HEx8FNVotDLJeWuV8uPo1WG\r"
expect "unlocked >>> "
send "import_key 5J4xUaeuPmyeeDcfnyezDJKsmgnpm9iuLVShnmHXL21yKpsMdwE\r"
expect "unlocked >>> "
send "import_key 5JmQGnC4yNzhBADi2Z3dyEr9wR2LfZt7dcHD8DoRPmLjciDdiiU\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount03 null TST7DtV5iFSByP46ry3bG3JWfiaBAwKg4h8WhZZA6khRBte9jH1wW TST5CxPN7ch35taHVKxW9oWHLQmgD1nnvAx88vG3pWPVh2PmNYpXY TST6Zp6GZJn7ZeaQpcCcpACmYcxsv5KyH7h1C9QVF5q7va2k9REB6 TST5b3sfRNsTUmugZV6rxcMknb2c7fnfggYvEi349WkHx98DGuKrX true \r"
expect "unlocked >>> "
send "import_key 5KbGoLXVLBEYohEE2USoiqKFByebNQUzoB2SE7CtAbJzphv8RMG\r"
expect "unlocked >>> "
send "import_key 5Kf244A6oSEGLfzgQc2hpA262iWFs8SB87Mj2GWtY7Qf1Pf6VsT\r"
expect "unlocked >>> "
send "import_key 5Hw5oWNoRX1tPvcYRv3J3UbK4pV9hMyYSVqCjFDxGy4NQWkVUvH\r"
expect "unlocked >>> "
send "import_key 5Jj819ysPF3rE7o2KdHyXdWQ8vvJ6s9nVSW6K7TG1wGByNMHXvA\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount04 null TST7SxtGE4h3yZgFduddigZYDqPq16yhtJs1V4MMPBPrYcpMZ2SgS TST7scw25VCknZ43EF1bMCCMnYen7dCJA2TvHdUCpTbnXudWoHM4K TST7ZKjxwwPcFij99zi8tzVkpYqGkn24XTe1TDFr3tyk13fJ8KZ1P TST6UicZa59KvHq3T8Km4QYspWJDqYdvEYXYpXqj5bvsEfCtrYSzE true \r"
expect "unlocked >>> "
send "import_key 5Hued9SbkrT74GBWdxsLSRCh2k8QPMJ6oX9ZFcJfpPoL1by29id\r"
expect "unlocked >>> "
send "import_key 5JEcPBXivmwztUZec87mfmQ24ptDvLAexsScrebMjPQ2ChVs8wM\r"
expect "unlocked >>> "
send "import_key 5KFjzeqGaFdSp4v5ND8dMj6iKbVXUdfcnci5AQhKoShGgHwSPvB\r"
expect "unlocked >>> "
send "import_key 5KLQMb7JBnGNbGoZXnqNxJBPT3HEA8TtoewbtXq985LFWtGmmbL\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount05 null TST7dqpgQyZg4fe48E5jRSBdBnfisbn97ozEuDLA6R6QHd81LZXxj TST6VY6Y9xnsbBTYApHi3m4HABH89HiVNeCDDBVKU9tKTm2MMaD7T TST65X8egkeg1GMUaFJArS1U3EhY5BkKjcXFPeasHo2U4KUoW2ubS TST8LFnYnhMVhgcXEd69MwLPm4Xkq5HSznkWtUVZ8R86vBgZYjCiv true \r"
expect "unlocked >>> "
send "import_key 5JTCu3JzkBUtupUdTZEXD84VeFguTPtEAGcZziAgL3Z7L1GBBLA\r"
expect "unlocked >>> "
send "import_key 5JwSYRh9Zs81A8KBAteMcf7w4VFay8p4qXGnDEKG9fMwRp916Sj\r"
expect "unlocked >>> "
send "import_key 5KcuafecEyXqyYAR4zCcdeqyLYQfyQ9xhPwFrs3FCk1whxMCNX9\r"
expect "unlocked >>> "
send "import_key 5KfZccveDXh7BNEqbNV4ykqPoECpdDizEnuWwCG7e7hTfVQoRH7\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount06 null TST6sedEqxmJPVYioKTHfKBuRPwiGpgddRCpPGmkSKWgN2FuSr4r7 TST6oSKBoy9JdJ9gDoZfXptWmWn7PiZcFgwe3a4bpLcAcfQwVEUCd TST5s5qEaMwZuY9EdbXysHNj2fBMuZgc5CHc3w3o9uHuCvrvRANHf TST5PiPzoQX1qLRJhy93xeSRbP9Cu1oSXRATAbP4hurAsXsdGo4Gt true \r"
expect "unlocked >>> "
send "import_key 5HyG8GGYf7hbUJKtHBE51HPPKfeZHEV3goktaYq7GuYr6ZzjyjW\r"
expect "unlocked >>> "
send "import_key 5Jo179AhDpeQVXzF3Cdy9DFXQdbrA5a6vv45Sa7J1doHy3Rfo1V\r"
expect "unlocked >>> "
send "import_key 5KjZZpZWDsk2Vw1fAHHbsvxFUHBrJmU2LxaYafKgjna5mgbV5ib\r"
expect "unlocked >>> "
send "import_key 5Hr5sifZZgvcYkoS95vJ9Nr85PtyfGu4mntsxi6k5fMGDGm4MX8\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount07 null TST7wXuapYhEgJp5HfKQAnjKmu8c7FucFoBC5rgVtsNwNpXoSoyHu TST8RUFXzLYDHTh1wKvEMmJD3Kncu6ArTyQenF8gy64MPmixPYpPD TST8Nh912LWDxZSo7ZgwjyMDzih9Dz5YKBLhXEgLY5N4KsULHGxRq TST5Ec28sNGhRQ1s7HCDj9U7yvgBPmj4HApBAbCAxfWiDNzZde7yR true \r"
expect "unlocked >>> "
send "import_key 5KLWSxddEvVrwrFgKTJRuZdf57Z3ZN5kQBK6gZeqeDYJoWJDG3Q\r"
expect "unlocked >>> "
send "import_key 5JUinAReyzPmvSyzkGu4GtRtbntHcNb8WHfFtDpKeVzdKwu2ZSC\r"
expect "unlocked >>> "
send "import_key 5JtvYznWDkSGrK5S1aweQ8ChLLvJBpPWndzrLZc2RwDJ4voZyiY\r"
expect "unlocked >>> "
send "import_key 5KEbxVTzVNoB88XsetLinqMTjXqQE36fqa3nQbrmDUEURvEGME9\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount08 null TST4ynqPaQDW2NNMmouV2JKzgHKwNV3hsSSBmMDrxT9E3kbjyStha TST77o2oGz18GDWQKFENdEMuicaNuwhMtnvL1GryePTJRCneo7zzc TST7zi8sdjWnaKjVYg9d5KXvDzNxDBfm9a2pbDGHiN6csExyJ3NcJ TST8Sv4a2r8Rfb3oMRUHFP9mgcAKjkDny6J9tMxZRZQ3EksJRR4AS true \r"
expect "unlocked >>> "
send "import_key 5JXUy8mGSWoGjm4Ly9zwwXzC4XDoPzQzPH4Kew59J1s5XnkvAid\r"
expect "unlocked >>> "
send "import_key 5JNZS66xfpEk6SxzarUYjzh2rTi2J3jwg9S5U5AtE5LVJXqeLiy\r"
expect "unlocked >>> "
send "import_key 5JW91QirWsZGLcwPM3nZNp6gDj9gNRvsMz8qu4o49QSvAdHzkbx\r"
expect "unlocked >>> "
send "import_key 5J1EsUfEU22Rnr7cW19HHuhwRzdxEk6EmPmxVSh2r554SKb2R5S\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount09 null TST5XmDK1uqc1KA9YYFwbL1pNQ4HZVrk9sUM5RuyjDtJcL6Rkk3Tt TST8jo7i6UWSJvZzHR3YbMkMsqqSTXUNkDEXs9rd4ZBbyRSw8KA1a TST6xN443MfADsgRCHQyjWqiMyUoUaKv83V2sonhBZjJ6ktLwTeJc TST8TvstKiENNo9PcFWFS2jNM9NNSRqmtiWzgVGtR7T3PP9FCo8cm true \r"
expect "unlocked >>> "
send "import_key 5KY9u36j5ttvqbTm8XqyHKB1acFMxbuBGSnj5UANKA45VXuYjTF\r"
expect "unlocked >>> "
send "import_key 5Jfxt7ptKX9UbiGRQWz4sCkVGGRL7K7Yv9g33AostkSuwHqWVip\r"
expect "unlocked >>> "
send "import_key 5Kb2Gk5CKRKWg4t2CdKcHwvMg3XyUfrdPKANzafKYxbboQcakPk\r"
expect "unlocked >>> "
send "import_key 5JQf4ZSuPBysCNvKmmMb5h12koCkePxBTa9ZtgLSRCX9jFebzEu\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount10 null TST7R6bWwLtJKQ3WndqSMA73eSEYyLik3NUEYuCLAqSu5YJynUzmB TST5T1htbXnDDm7JFq7PTUb2ZdVY3LQrHBvoVWYLGDynp5vAWkdgJ TST7fQBjbgiW8nfKrUaa6JqQiG3ooQu4VAAFRA1BSMPqLZhV3aLnH TST7EJWsgfWCgDqsgEAFUTjWhUkwY6myhsgR8ozoqsxmAvm3Zw2pm true \r"
expect "unlocked >>> "
send "import_key 5KCfMcrGwsnHv3jVRcRNLzaokunoxLMPqN3JfvQv2Wn5sF1qPsA\r"
expect "unlocked >>> "
send "import_key 5JXL5h1mdw17qB33MsQ66wvWnVJcTcno4NUukfLHCAc3p9nfsUr\r"
expect "unlocked >>> "
send "import_key 5Jah136UQeHHAuQyQYWUhMRVen4bKW9haGQssUPSRnDc9KjSDEU\r"
expect "unlocked >>> "
send "import_key 5JJ6y2i9G8hpk7BMqR6PwUx18WSr2PJSbE3Ws9JhhBT4gqCmzkE\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount11 null TST7goNvGe13ywayvx75hofawzfi6611w8CcnoqxVYKu8NHzaJSfn TST6KukRgQu7uWtFzUta2g2F7sMnga3fDfARGZAaUbD7phREasm6D TST5n84duhzSutLs8FNrfrtyX5ZCJCnGMrbp4f9qEMQM28LgybHqv TST8bv4PwgVGXfsRCxfAaU4denSq4cEDSRM6mNXyrX7N71XELGioB true \r"
expect "unlocked >>> "
send "import_key 5JMfUfXPdmTbmgueAsU6gU31GoQyFxyEYWNqc2e6QTF7T4PrWWy\r"
expect "unlocked >>> "
send "import_key 5HtBULc1Rcu4rBVdpkCezuSZXkMKhyMa1oqQSLchB1iDSnN8jQH\r"
expect "unlocked >>> "
send "import_key 5J1XxJXEFpjoS6z97UfnuQVHG1QfNdRceXrQTUaWc1CxQ81XpuT\r"
expect "unlocked >>> "
send "import_key 5Jye4AgW2kcvf9f3bhhpoHiVgaGUcqGJXq4TbJxDZJ97UVkeAtQ\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount12 null TST7MwS7pJ2D2ULP4YjLxmWzzDQLc2iHRPqM7kJRavr7nruGYz7Pr TST5RZNGxBvZF46WPVtEhp3fuh6ue2fX6WGYWm1W7pfZNUDhvuJzy TST8f1hatTeRKuT6FocNBXxFmZtxsuh9eh3x8n56LNNiDZQTyH4ZU TST7v68bQH6XJYBEHETKNmjXxgrpNo469x2HE5umxL7au1jQnEmEc true \r"
expect "unlocked >>> "
send "import_key 5J6ymxPzE4NUzoKFZC2o2nd3Shcbixe5puyLNY7V8c2dBvUeJv7\r"
expect "unlocked >>> "
send "import_key 5JmChyzg5RNpHPfszq4GZNWvagF4vG9aZXid7DppSra5dCzY7Xu\r"
expect "unlocked >>> "
send "import_key 5JtVE4E1jrBjM3vdi4wa84Z6mYT6FC8KqmXoZALXrkg2ufn4S46\r"
expect "unlocked >>> "
send "import_key 5K7TQMJ66AtRD1CBT164Rvd9FAQ9EN4rao4r1bz6LdADL3xMEWf\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount13 null TST52bHKT8dvYukfHuXRhtZ3zi3vTBXu6xBv7jv9e4UPt7YSNi57o TST7LwhFRrfZ6KBuAoou9N1nBX9Gm95MnUFFjHciJEiwWag166X9C TST7E57kf46BoVmASBHr8V1Neo7WA4qStYe2KMKPsofmKqQpbAUmC TST6qbt7KDkicj2QvTvixwkd2oe9YdzMhrq5GJMLz9o8x7FGy1cV9 true \r"
expect "unlocked >>> "
send "import_key 5K33zzRcdkUL3ZoEBNUB7JTV4ygeSZvVSWXnbF2LjhEh69fdgcA\r"
expect "unlocked >>> "
send "import_key 5K2WL3xCfbuHYhKKwr7M57RZAz8beyA4DwwxuKXMuA6Q84aqtd1\r"
expect "unlocked >>> "
send "import_key 5HuzLwLhzsnbv7QX9BZC5r5dS2FufzVpDKqu1m2XPms4jvyp6CE\r"
expect "unlocked >>> "
send "import_key 5Husxks5X11AE2NhxBtqCDQu22VCjaSRvcUxK6BiAPZWsQZocQD\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount14 null TST7PX8oKrKBA9Pjg4x8NAVf92RtJho1yEHbHy9ytxKaATjptmcac TST76Acw6eSrJ4cpg54oiSJoR16zBSYL5MMvxGiSFww6LgKidnazc TST7hwmxgyUJmwEiScaJhkkvgpZ3bfiTYkz2V5brBoir72JL7QtF3 TST7ZehGpVWC6kEvSiUpkgfZjqu1S31NkRGJquP72fZ57eH9rGY9S true \r"
expect "unlocked >>> "
send "import_key 5JnQgUdXaHJGHAgLgLAqB5FuZ4Y5fT7i1Lrgp1wzH2b3KJ35WMe\r"
expect "unlocked >>> "
send "import_key 5JCfufW8Lji8zbJKiMG9vPYLZu9U212tpwoU6dHQZnZH5Abo2tm\r"
expect "unlocked >>> "
send "import_key 5JpF2K7VE61ju8aeuSmvSDWJWZQXPuaEz7vvUwonNG5aHCGkQZG\r"
expect "unlocked >>> "
send "import_key 5KYcDY2A5vh3YLJe3SAjQBaZ7UirS3yCSsWS7FjybvJkAcwswa1\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount15 null TST6oAkXPP7A6ecExcXHgLukR6asqZ2vkYR84HQQhpvHSpMNyBvHo TST8mTBCDLDbiRJjyRfu8h8BrnmyaSzFezvhd1rB7ByMYLQwiMWAE TST8W2DixcgX9WdSRM9mUrGKan8A9T71w5Lg3UUXR4B5qfF5dNfVc TST6JEyTs4wifY99Ky4ZUDBKW7var7LDVBwvqDZzyGmg32P5WTx43 true \r"
expect "unlocked >>> "
send "import_key 5KYFoZ5U3hMWDNQmyHa7NwBwkz6DzW7jLS3naZYCjRqCHX4QQwK\r"
expect "unlocked >>> "
send "import_key 5KUYLe1pPeqxRQgqDuEvDFAkpZNDbqHpKVW5rwbPxhXCESNFxLj\r"
expect "unlocked >>> "
send "import_key 5JUH3gttL41X3GQhwuBTao6u6fmYbcCDWE3JB2RpUoksvZTbQMD\r"
expect "unlocked >>> "
send "import_key 5Ja9LUYvP8hc6zvL32VzRvoe5DPsruFJUtSSJmbB6M67vrZSCJ3\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer sonaccount16 null TST5BwrZ8PQKj8Se5pCcY8T7fEaJo8bo7bN29yY2a5Up2sWjd3ekS TST8eSA8vvV5NvszqRcbm7fkmL7kuteosNudRaSyU7PhFmMdK3icG TST5drpReiwDWnzc6PqdTpN1GgVqoxDeRby2rnS1hhTP963eMwK2h TST5TFmG7kn2jQvrRvmiN6UJk38wWc2QyKZ4i2bShbLxXQYzUednu true \r"
expect "unlocked >>> "
send "import_key 5KApTnGVrxKR2smnL8EANqQvcxmcJxJ7UjvQQPD1bD2n1cway3P\r"
expect "unlocked >>> "
send "import_key 5KArRrrF7uYQTaihrAZTmVVwbpFG4VHPPdMev7zwBu5svhnH49E\r"
expect "unlocked >>> "
send "import_key 5J542fGDdTCGv4dwhrqBjAy7uF11s8npGhiZGgP9KMEwRmfYZHx\r"
expect "unlocked >>> "
send "import_key 5JfuC44emVHzRqxD9YyF7jq635As3q1DVzQcoyECQVEqcge1TqH\r"



sleep 0.2



expect "unlocked >>> "
send "create_account_with_keys initminer account01 null TST8CKQDx9eMJMP6Z52Ln63FMJVZrFULDPhXxA4YT55yyquUVyMaY TST5quk5Brh16v9RhdK6uCFxy4j3T9Dsz7krCUPwuAgvTzghQBG7s TST6akXLyQPVmGfNBBrBwQTn7SJffFenG2BFXfcaeecXEbTHmeGbF TST71TKNU3dvLs8giQp6YYrckB1JZ6duxVTRv1U6P57LQ2T9RbDwm true \r"
expect "unlocked >>> "
send "import_key 5KEPaAzMg5KXajYNeyL2GbM6ESDv1x4v1ApnYUzuuaXwY4RQFH9\r"
expect "unlocked >>> "
send "import_key 5JXfohLCmj1aciPymm2isBFTqQcjKhMWTzywsS8ptnqrNusi3FB\r"
expect "unlocked >>> "
send "import_key 5JNDJQDpWWhR4HpWqhcW7rmJJPamCK5nVD7nwUsJu6DEMC2isGk\r"
expect "unlocked >>> "
send "import_key 5JSQqV4xpt73mZLUTBCJhQdiSD6tktDCEFm8sKpDkV27GsEfwr1\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account02 null TST6nKFyuSYAwA2GRY1o3dpGc8n8VTCbiG9dwzek6kcEwMEZb2PAj TST7wbT9MNNRcpv9QD6N4NhKxbrC2yhD39t9wDSis3nJjh9nDdA6w TST5mgxPYinBgeh2kXQoqowKVrKvVrPss9KuCbqH4iJmaf89mcN1H TST5397jCAnogZDQdKJBJdsj36WSqNNDhupMY1Rdv4mZUoKsk9yFZ true \r"
expect "unlocked >>> "
send "import_key 5KEra6MHojHwoi3J389GG2hAoR8pKgAMhC1811hQK4kb1XT571F\r"
expect "unlocked >>> "
send "import_key 5KF1f8FyhuLkDiN6gXuqcwy4ztfEbRp1v24hdx65621aG2rqJJ3\r"
expect "unlocked >>> "
send "import_key 5J5hwVbGw1mNdjXfLR3Md6CDLyDpugx3dqRF7PznbuPjnJEGmLF\r"
expect "unlocked >>> "
send "import_key 5JUVrQnrQ7auge1v6EnbZxf2DUqQBq4uJX8dQYHNxp3474otGLk\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account03 null TST6GqeMkGyysEU7RfgadQvLVYeJSdvGXCao96Z6gDzmrLqDD8Qjy TST6zv44ESLXujSiiZP5MfJQrfi2aKS3cGQXfPSkr3EwG3zABRYL9 TST6tVnAuaq1n2tcr5RPbdB4gfuWwk4ZDNsazjgTksyDh6zRYSvqF TST7ow29nYwYvt6zYxPYwZrXaURE122S6GekoTeS5nBqrZmQHqBWd true \r"
expect "unlocked >>> "
send "import_key 5HrknkSwNYFT5dmVX9BSbubB9Q1qBDPXB9tN2AbNfbtVWyUUHw8\r"
expect "unlocked >>> "
send "import_key 5JW7u6B2yu148BrRZ37EJTTA59isozH8imvrWiVtC3yknTYTfS8\r"
expect "unlocked >>> "
send "import_key 5KNcRPk59DCTerL9NZ9zKw1Grk46XWzzRAcfDtiVsD1HMy1pBBs\r"
expect "unlocked >>> "
send "import_key 5J6zn1GDaZdmkL5WkdVnyFhptPx82yuQ6FPQof6neqoWnyUmzYy\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account04 null TST6r74msom4WfxUkn4FhfyrJUoN6crobuLHNr6fr5oYUDLcmKFQA TST8AGnBvd2BAfpS6T8bVogAbvucpUtYbc9BJVAYJbAYHLZyRzm4e TST69b7fREMpkpocmpxY1uVpjpqwdet3kgH3q8nfCqvsUwos5nWz4 TST59c1hHyE6tgECdkQczJuF8Exz35j4N1vKLGFVnLD97V1r2fRxK true \r"
expect "unlocked >>> "
send "import_key 5JgSc7mKVtZCZA5ebx2TRcYkoKNNywBUC79MFVdYZ3KMQe9KEng\r"
expect "unlocked >>> "
send "import_key 5JDUcL7khXzPmasAquGUHSeosrWzQ1nmcKmABKWpT4xTZVjkCGP\r"
expect "unlocked >>> "
send "import_key 5J1R2Bb9b77kX48SDXMHbHsiZpDKoYbN1P9nMeKS5rGpYe57wot\r"
expect "unlocked >>> "
send "import_key 5K7pXRb7MxwrJH55sN7FDAejHBXaaN6dcMQuWRYKN9ETeTDXDeZ\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account05 null TST7kSX3sEgT9NknjvTE5jEqSuHLFjLeMagfcGLvBC9mUCCKprmEa TST7y33ssbgFfCZinfT5B7wWXiKK3E259MiXiKRUef22b3ijCbmPn TST6p2fHT6ZbRMEX8eKtHtGRJ4orBPw6qRcGkqmxRownjfrKyv6N2 TST4zSyjrkM6ti2WV4kQk1fh3w6CjmdQHpabn9ZbMk5CkSGwLVv9s true \r"
expect "unlocked >>> "
send "import_key 5KcQ1jzY5zJ1DG8UHsSbQvVWx57664btakCY1iuWDkBdfPtkRwu\r"
expect "unlocked >>> "
send "import_key 5HtVFNjpVXUxmzByrgNgSNxQm6rsRQnL4ksCzZZVoPvD9Jhuqiw\r"
expect "unlocked >>> "
send "import_key 5J9AoHifomJKUgpibeehr3rh5fbTuCZLyD3dsqViSGxWbuyrL6f\r"
expect "unlocked >>> "
send "import_key 5KCzRABttocNKJ97CEBv4HNVaDM6Vc66EgGZiGkyg3XuS3KvFN9\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account06 null TST5JyNViwDuULxnEt43LmPEExc7zBNqYrvJ4GLT1udHjUsWkTmG3 TST6BvdjGHVS6pbWBgo2aHy7zeHySvsdEcKCFNpGLT9dmQJUS2xLA TST7emJUACyBHgJjmJ8qpZGUVHtMCY1kvPmidxdJnZQeDALguAZ2z TST8dkWTdcZpko6ECek1MMaFhHnTM8o1eMNcuuLhp8EDR2q5mR9ib true \r"
expect "unlocked >>> "
send "import_key 5KV3R7pnwjYADL2RxFY2WTAaxebpvijmcMdRhdm8srJygMAsFYk\r"
expect "unlocked >>> "
send "import_key 5J8TGy3KaTdU6qF7uAWoFaAKP7qFqCAgakWN3pDJE4gkAttq7w3\r"
expect "unlocked >>> "
send "import_key 5KdvuqLnoBTJEEmj6x6oM3dVDKWrjVBi7fqp4Bt7z5gT1wek164\r"
expect "unlocked >>> "
send "import_key 5KgCsSYa6KdhwUTGoKShURQFZzP69b1XBH559nB646dhw7qALWA\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account07 null TST7JNpAuX5mFoUTuTjPt25bsfBaienz4jujSbQQcWPekLH4PKwQT TST8UdKL5WSQnHzaobqJhXhraJ6iT85EeezQKnHeRhdvNyyCVTELJ TST6QNCZRMagxhxAaPr7jBw6aZnGwnvcwy1MoiEmgDyZT5qBrnb58 TST5QGyn69TtAHev4JbG7QmFhx4iLjRVWjFcmDFxiiyLkmeTsqMjk true \r"
expect "unlocked >>> "
send "import_key 5J4Bq1gr5yWjdPPnr17PUhgdnNqN4j73EZECA3PLCSesL43P9rW\r"
expect "unlocked >>> "
send "import_key 5JZm6oZ8se8fQsUYTZJRC5ZfbFcKVfKUey73wNhpZLTT2eTFrHN\r"
expect "unlocked >>> "
send "import_key 5JkciGNYgJkURBLLCdeW7NDQeVfQvmZRP9oQEJVxprf5J7pk2TY\r"
expect "unlocked >>> "
send "import_key 5KP2P3hJmeCUetwA5JEQK9qQAu4HRAcXwCXdhALnFur2QEAJ8cW\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account08 null TST8R3wE887WSdqd7MzsFmEPVLiL45tMrJSr6U1UUsdCavWtxA88Z TST8jsAJEoUExDboAdtZErZXSfsW2tqd7JbRN9FUBDQHyGWKEHDMh TST85nxfBL7Q8mCdkDV7SFpr2ruh8VZ5CiUf49F2aZcH5KWaXWgmd TST5dvKVrxX5LwErCedKikqyQrhJpCny4Z47nByhj8WpiYu7RsvN2 true \r"
expect "unlocked >>> "
send "import_key 5KRUutiuKtZP4qFvsTLsy5iDC6FhFetHpCrPxVq8vRmYiyEqS5q\r"
expect "unlocked >>> "
send "import_key 5JdhS7gSkin2iv2XNHMoch1bx3NChJfkwLjtK6enrTXnKsFVkcN\r"
expect "unlocked >>> "
send "import_key 5HrdBXyZnqCwbQk4mKWK5LVf7kWi3o3coFHabn7sQaGy19pqrjo\r"
expect "unlocked >>> "
send "import_key 5JyGEsqppUt5uFHVGrzAJu3iPswpYtPBqJngxLvtMPq6X7ScYLs\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account09 null TST84eiB7JTxxPARqeeJuZLxvJwZLwVUhopKk7PhiUf7AAp9KffdH TST62i1AyZ6r85SjMzUNS8ebUh5qBv3jPp6TcYPTpeAwh1VXtHTjT TST6vJdd6ve4U9jiWkJsetZGSSYPmGSJBviQqDL3BLT9aw8qwXuxd TST7oQFSmaZYLf8fghHJrEkXEuoVL1FnsoNPridr7VD361eLovNhY true \r"
expect "unlocked >>> "
send "import_key 5JNLENMwi39YGxSfLmMA598JDpouL7efoSeVFWJUqHqv7hFZ4sS\r"
expect "unlocked >>> "
send "import_key 5JsWGb4QdYgktXfGK8Tz9rtwvNxMit3nSbpRnyHisVAGXyQzJjk\r"
expect "unlocked >>> "
send "import_key 5JKmzvmn5Fy3DNnRGEmNGPZGAN4KJ5Sb3UyZi6WFaP8QBRCofYQ\r"
expect "unlocked >>> "
send "import_key 5KasuyUXd1QoB7S95c7cKS6WF68BGyaEK75HZkjRGThTJvCXyDh\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account10 null TST7q15D74y7aUtTetyMRazZ9cGZCxnzF1TkAh4gZds8ur5J3vab1 TST6kgKMwMqLcM8K13p6oVMxkJzgATPtCJH6bvHpeTkfyApDnUdGx TST89D8BbciKgr4yvsWLnmiQj41qwucGqj38kGF2rpR5FwcTft9gk TST5U8DtNJWpgNn7rRVPdhgCHEp7EmeNtuPdvG4dMgwH3dEgozSyC true \r"
expect "unlocked >>> "
send "import_key 5J3CTWeHQ2SeFWxnmn5abfShCEFPwz7Um28ZJDfL7Te7UhqzokN\r"
expect "unlocked >>> "
send "import_key 5JdqmpcZVG8tkP8ZyT6uAuxcjZ5uqrpw2nu1FHBupuq7Gorybad\r"
expect "unlocked >>> "
send "import_key 5Ji7P8axFQQXFqMwot1KVLMN1UUbUdheJ1Wdfao4tqNkGAzBUjw\r"
expect "unlocked >>> "
send "import_key 5K8fW4rEP9aVC6H7ZtaWkBYLzhJ8RjQP2rdwjmADkDxFZYmA5sj\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account11 null TST5qSiuyf8QxdRcFcKVC9pu1aHV2CG1chi3N1S9Dxbnodus7kSJL TST7grfQgocddnpjFiHA4yJCBSuYCvdQAoicKz7qMsbWwwx3hfNB7 TST6S5gG1wAoK6axKXCbSoy4JHJCFR9eR5e1R51omwC6b1UY5dsAG TST7yFiBTXcjqBHsxLdxFLg8SxCnPHqkuC2irwF3sUhJvXxAMVh6k true \r"
expect "unlocked >>> "
send "import_key 5KGgZ6JdUL86Xp1vwEd4dtazAVjnAXjzaXcSUy5khTFEWrzH19e\r"
expect "unlocked >>> "
send "import_key 5JAQC45zf9gar9HssgPKMsxXcCMrzCHLMehhUNZFEeSaVvHtc6q\r"
expect "unlocked >>> "
send "import_key 5Jw51pwrfFqYE7shHbym7w5mwDAy9RsTfAzA5p3EQchWdb7nsZG\r"
expect "unlocked >>> "
send "import_key 5JeHTc3EgsqUZUyvmbvMGivoKMzJYvhCjWrgJnnaDr24K9B7jzv\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account12 null TST6Mq2Fnar9B2AfXkNTMn6W7fAHaeJKYnrXgs4837bpfczHV4MAM TST6heQE5oNYwDVqkkJJucNPWXULEJggZmeU6muTyXErzz42Te83g TST7cUj91v8hGxKMmTgScfrcBmj6HKaHKxuBDvKRwBEvsjVkqwQcA TST7VX1UtR756rtTGctC4UUc1rkmjKj7empmfAE5fCPhqwNwhYvi6 true \r"
expect "unlocked >>> "
send "import_key 5HxgNq8AFe5nHUGAWRgovQaxYn2Z3dddZcacTQxHHoXNhpuQ2ES\r"
expect "unlocked >>> "
send "import_key 5JxhygLQzApnyWPPgEpxTA6g9mVQxb5peS6ypGSEofiYPFEFTuZ\r"
expect "unlocked >>> "
send "import_key 5JU8wRj4Ehkq45Sr8CSNzLHZcYm7azRG9akdphAdbNV18dF4Zun\r"
expect "unlocked >>> "
send "import_key 5HpnJ1d3ib2hRKT1TDQtNTZ7gQRnVUaLH7BzS4FN53wh99jUL8r\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account13 null TST8dXkTgpGsY9FF4gog9yRVrCGCvwPJZDfcxgz5xUCJpaed5jH94 TST56ZbuF7KzTwNaXo8Tsjr2KgdMzMGtxgkyyKKLac4gkcnQM3Kvd TST6nru2ZxNDHftKg7ozVzUiLAvFR7XXgvXiG1WqR6pPZHh5ENRZL TST6bi8f2iQ2Mmg8WACLLWX3eB9QVZ55fmovkqTM9z1HAC7NJoD8i true \r"
expect "unlocked >>> "
send "import_key 5KjYjZF3PahqhSSrMHW3JSKn4ukpSvKHnU66VkDxqjipoLaRNHG\r"
expect "unlocked >>> "
send "import_key 5JCNdmNcxYu71fEmA539G68A3UYrmzkgx1pCBVc3GvpVSfYY9nN\r"
expect "unlocked >>> "
send "import_key 5J7AsWaJmYAXeSXoU5WKgw6xf5McHRCyHNgxykJK6ZtQa1vYygM\r"
expect "unlocked >>> "
send "import_key 5KLufuWj9ZdtxbCFybvbyNMLW6an5fN2Z3VWMKn5WAf6DH8kqCX\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account14 null TST7MugRWLALi1z37hhT1kiWrQDbe5wFJbZ54mkug5dEPcxKBTG5T TST5rZKvsKvbLuj8RAEkKeDPTUH4UFkBX77Xd9DLTGvn5P5gTm88g TST8gpzFCK9dxpg2C3VGYLeJnaDV3jDd43aoQ1c5tRYgfoiY91ag7 TST59R3inpzRLeKhE229oZwEFQEH79UMs2JE8yF6iCDJ2MxUT63dZ true \r"
expect "unlocked >>> "
send "import_key 5Hx1eYsreQPsCX3bhroEphjcq7gYQdA29FEHNPjimjzmp7H4yV9\r"
expect "unlocked >>> "
send "import_key 5KB64hc7Dii34z9cfkWt4ttHUmMeiumECcoDLAqXAMZvZxV4844\r"
expect "unlocked >>> "
send "import_key 5J42BgVLJAfhREr7RDchPFSgLMyiamGc1QyDewdxbKg43KeqFq4\r"
expect "unlocked >>> "
send "import_key 5JHNXKDXGwwD1TQ9aPkb3EprjRRorY3KRbA4y4egeFfEZGL3TEw\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account15 null TST5x4BJy4byhwPK1LK9xCM3PjyK23k2ULaTUfQ4nLdie5zYo6R2K TST7As5gquuBDFe1Amh4Xc1W5WzxbATfqUnMvnYpRPfNSRZNPhat5 TST6QwHxxGL498mUhZpwBWFdNCCgERENw2uDHmuxU1siH7DL77UBG TST6TR2m2ishL9MAuFhEN9c1xBCFCVpRWAWMNfwK7w1aMXipsQza3 true \r"
expect "unlocked >>> "
send "import_key 5HxBoTdHvx8DQhAUSypQc2ivhqD6ShczdStAJCGKLg94rN6VsPN\r"
expect "unlocked >>> "
send "import_key 5KCpteHFXKmptSxJMWDoYng72kAZZyfN2Aby6KYxYFg7B3sk3xj\r"
expect "unlocked >>> "
send "import_key 5JATT6P4wVLUd64W2gFVooAVmYgNDSAr4XvaQ5rCdoCNMGpumVi\r"
expect "unlocked >>> "
send "import_key 5KH9ShvFoDxrjLm4V8D3aujbX8jVdX3XoShs2rQgkrJPSuk83x9\r"

sleep 0.2

expect "unlocked >>> "
send "create_account_with_keys initminer account16 null TST8WELnGYiJrs23q43E3ESJ9667kPXZ9Q9SxPbKo8GAbATzVBFoG TST8Gm7Bmna2Hkcep3j6uc1G6jAkSwWEr6NeCBYx7jy7C4SobGUy4 TST6vpXuXzQqm9KUd6mPzWvVqr1tdhjpJ6Qq5bEaWbj5yxb21PETF TST5kkSdfm23Tr71YBTKLJgdV6fr289Ksbr8yw8ZeFnGtr2mJQiYV true \r"
expect "unlocked >>> "
send "import_key 5JzHMVRmfcCDeWoQY94dCXhf7pSCZ7oXkJqbxqxre5t4HMDvEA1\r"
expect "unlocked >>> "
send "import_key 5HymQDGGoJps9bE3LsMk6MHQcxsczWjWRvCbLLEekhPGT5kfNXk\r"
expect "unlocked >>> "
send "import_key 5KXBA73tTboArNmP7PDixFsiYvrKWNzFAudmcjPC6g5y1qtfLms\r"
expect "unlocked >>> "
send "import_key 5JpQNCqTotjxopdPZg54RH3KQswLXm2J4KHhSxSyHVYhdFBaqdb\r"



sleep 5



expect "unlocked >>> "
send "transfer initminer son-account \"200000.000 TBD\" null true\r"


expect "unlocked >>> "
send "transfer initminer sonaccount01 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount02 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount03 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount04 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount05 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount06 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount07 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount08 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount09 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount10 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount11 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount12 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount13 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount14 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount15 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount16 \"200000.000 TBD\" null true\r"


expect "unlocked >>> "
send "transfer initminer account01 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account02 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account03 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account04 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account05 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account06 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account07 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account08 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account09 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account10 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account11 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account12 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account13 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account14 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account15 \"200000.000 TBD\" null true\r"

expect "unlocked >>> "
send "transfer initminer account16 \"200000.000 TBD\" null true\r"



expect "unlocked >>> "
send "transfer initminer son-account \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount01 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount02 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount03 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount04 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount05 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount06 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount07 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount08 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount09 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount10 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount11 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount12 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount13 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount14 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount15 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer sonaccount16 \"5000000.000 TESTS\" null true\r"


expect "unlocked >>> "
send "transfer initminer account01 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account02 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account03 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account04 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account05 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account06 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account07 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account08 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account09 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account10 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account11 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account12 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account13 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account14 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account15 \"5000000.000 TESTS\" null true\r"

expect "unlocked >>> "
send "transfer initminer account16 \"5000000.000 TESTS\" null true\r"



sleep 5



expect "unlocked >>> "
send "transfer_to_vesting son-account son-account \"1000000.000 TESTS\" true\r"


expect "unlocked >>> "
send "transfer_to_vesting sonaccount01 sonaccount01 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount02 sonaccount02 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount03 sonaccount03 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount04 sonaccount04 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount05 sonaccount05 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount06 sonaccount06 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount07 sonaccount07 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount08 sonaccount08 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount09 sonaccount09 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount10 sonaccount10 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount11 sonaccount11 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount12 sonaccount12 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount13 sonaccount13 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount14 sonaccount14 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount15 sonaccount15 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting sonaccount16 sonaccount16 \"1000000.000 TESTS\" true\r"


expect "unlocked >>> "
send "transfer_to_vesting account01 account01 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account02 account02 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account03 account03 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account04 account04 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account05 account05 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account06 account06 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account07 account07 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account08 account08 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account09 account09 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account10 account10 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account11 account11 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account12 account12 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account13 account13 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account14 account14 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account15 account15 \"1000000.000 TESTS\" true\r"

expect "unlocked >>> "
send "transfer_to_vesting account16 account16 \"1000000.000 TESTS\" true\r"



sleep 1



expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount01 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount02 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount03 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount04 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount05 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount06 1 true\r"

expect "unlocked >>> "
send "update_account_auth_account son-account active sonaccount07 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount08 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount09 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount10 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount11 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount12 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount13 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount14 1 true\r"

#expect "unlocked >>> "
#send "update_account_auth_account son-account active sonaccount15 1 true\r"



expect "unlocked >>> "
send "update_account_auth_key son-account active TST6wibhLBtEz6tmYhWu3aQh9PMCfqbdqozs7fbSc7ESottim7QB4 99 true\r"

expect "unlocked >>> "
send "update_account_auth_threshold son-account active 5 true\r"

#expect "unlocked >>> "
#send "update_account_auth_key son-account active TST6wibhLBtEz6tmYhWu3aQh9PMCfqbdqozs7fbSc7ESottim7QB4 0 true\r"



expect "unlocked >>> "
close

