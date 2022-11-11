//
//  PepePowerModel.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import Foundation

extension MultipleChoiceQuiz where ResponseType == [String : String]{
    static let pepeModel = MultipleChoiceQuiz(questions: [
        Question(
            question: "In 2012, a major event became the most watched Esports event ever up to that moment, by what major game?",
            answer: "League of Legends",
            responses: [
                "League of Legends" : "Correct! Fun Fact: The first League of Legends champion was crowned in 2011, but the 2012 finals were the true jumping off point for LoL esports. Instead of a prize of $100,000 like 2011, the prize was $2 million. At one point over 1 million people were watching the event, making it the most watched esports event of all time to that point.",
                "Super Smash Brothers" : "Good Guess but unfortunately, that’s incorrect! The correct answer was League of Legends. Better Luck Next Time!",
                "MTG Arena Open" : "Good Guess but unfortunately, that’s incorrect! The first MTG Arena Open wasn’t until 2020!",
                "COD - Modern Warfare" : "Good Guess but unfortunately, that’s incorrect! The correct answer was League of Legends. Better Luck Next Time!",
                "No answer because that’s when the world ended. (2012)" : "You chose this answer because you thought it was funny. You chose wrong."
            ]
        ),
        Question(
            question: "In what year did Twitch Launch 'Twitch Prime'?",
            answer: "2016",
            responses: [
                "2012" : "Unfortunately, that’s incorrect because that’s when the world ended, and also possibly because Twitch Prime was launched in 2016.",
                "2024" : "Unfortunately, that’s incorrect. Twitch Prime was launched in 2016.",
                "2013" : "Unfortunately, that’s incorrect. Twitch Prime was launched in 2016.",
                "2017" : "Unfortunately, that’s incorrect. Twitch Prime was launched in 2016.",
                "2016" : "Correct! Fun Fact: When Twitch rolled out Twitch Prime in accordance with Amazon Prime, the reach of the platform to Amazon’s overall business started to become more clear. All members of Amazon Prime received one subscription per month backed by Prime. That allowed a lot of streamers to receive a solid increase in subscriptions and helped serve as a bridge for people who weren’t spending money on Twitch to begin to understand the value of subscribing to a certain streamer.",
                "2105" : "Unfortunately, that’s incorrect. Also, how would this even be possible? That year hasn’t even happened yet, unless it’s been a century since this app was made, or it’s being booted up in an emulator. Hm.. Interesting."
            ]
        ),
        Question(
            question: " In 2017, what game created an explosion of popularity for a lesser known genre?",
            answer: "PUBG",
            responses: [
                "PUBG" : " That’s correct! Fun Fact: Previously, the top games on Twitch revolved around esports events. With battle royale, that started to change. The added chances for communication with the audience made the game mode super streamer-friendly and also addicting to play. PUBG released in March 2017, and in August it was the most watched game on Twitch, according to SullyGnome. It garnered even more viewers than Dota 2 that month, a month when many viewers watched Dota 2’s biggest event of the year: The International. That year, PUBG rose to No. 2 in most watched games by hours watched. In 2018, Fortnite became the first game besides League of Legends to be the most watched title on Twitch.",
                "Fortnite" : "Unfortunately, that’s incorrect. PUBG, or playerunknown's battlegrounds, was the correct answer.",
                "League Of Legends" : "Unfortunately, that’s incorrect. PUBG, or playerunknown's battlegrounds, was the correct answer.",
                "Astroneer" : "Unfortunately, that’s incorrect. PUBG, or playerunknown's battlegrounds, was the correct answer.",
                "2016 Ark Survival Evolved - Survival of the Fittest" : "Unfortunately, that’s incorrect. PUBG, or playerunknown's battlegrounds, was the correct answer.",
            ]
        ),
        Question(
            question: "In 2018, what streamer collaborated with popular music artist Drake on twitch, resulting in the most concurrent viewers of all time?",
            answer: "Ninja",
            responses: [
                "Ninja" : "That’s correct! Ninja (Tyler 'Fortnite' Blevins) collaborating with Drake made him even more so famous overnight! Fun fact, eventually the duo was joined by Travis Scott and NFL player Juju Smith-Schuster. The stream reached a peak of about 617,000 viewers. The record set that night has since been broken, but none of the following streams represented the same cultural milestone. This event might have been what catapulted Ninja into mainstream stardom, but he was already popular enough for Drake to come and stream with him, so he’d accomplished plenty before this stream as well. At the center of this cultural moment was Twitch, providing the vehicle for the interaction.",
                "Ludwig" : "Unfortunately, that’s incorrect, since Ludwig didn’t really become popular until March 14th, 2022 onward, since all he did was commentate on smash. The correct answer was Ninja (Tyler “Fortnite” Blevins).",
                "XQC" : "Unfortunately, that’s incorrect, since all XQC does is watch TV shows now.",
                "Dream" : "Unfortunately, that’s incorrect. Dream didn’t really become popular until around 2019-2020. The correct answer was Ninja (Tyler “Fortnite” Blevins).",
                "Eminem" : "Unfortunately, that’s incorrect. Eminem may be another popular artist, but not a streamer. The correct answer was Ninja (Tyler “Fortnite” Blevins).",
                "Michael Reeves" : "Unfortunately, that’s incorrect. Also, Michael Reeves isn’t known for streaming, mostly for his unhealthy obsession with tasers. The correct answer was Ninja (Tyler “Fortnite” Blevins)."
            ]
        ),
        Question(
            question: "In 2020, during the pandemic, what game did AOC play online with popular content creators such as Disguised Toast, Pokimane, and Hasan?",
            answer: "Among Us",
            responses: [
                "Among Us" : "That’s Correct! Fun Fact: The stream was one of the most watched ever on an individual’s channel with over 400,000 people tuning in at the peak. With Among Us driving tons of content and voting being a core mechanic of the game, it served as a vehicle to remind people to vote in the upcoming election. The actual calls to action were fairly sparse, but the stream represented once again Twitch going truly mainstream as other politicians also started carving out space on the platform.",
                "Fortnite" : "Unfortunately, that’s incorrect. The correct answer is Among Us, very sus.",
                "Fall guys" : "Unfortunately, that’s incorrect. The correct answer is Among Us, very sus.",
                "Memia!" : "Nice try! Unfortunately you still don’t get this question correct.",
                "Who cares?" : "Unfortunately for you, we do! That makes your answer incorrect.."
            ]
        ),
        Question(
            question: "In 2021, Popular creator, “The Grefg’s” record breaking stream showed the great potential for what streaming category?",
            answer: "Just Chatting",
            responses: [
                "Just Chatting" : "That’s Correct! Fun Fact: Just Chatting is also the most multilingual category on the platform. Spanish, Portuguese, German, Russian and French speaking streamers are all top channels on Just Chatting. It’s a unique mix of various cultures which is rare in individual game categories as different games are popular in different regions. Just Chatting is popular everywhere. In 2021, three of the top five most watched streamers on Twitch don’t primarily speak English on their streams. Twitch is going international and Just Chatting is leading the way.",
                "Hot Tubs" : "That’s incorrect, the correct answer was just chatting, Hot Tub streams weren’t that popular yet.",
                "IRL" : "That’s incorrect, the correct answer was just chatting, while IRL is similar, it’s not correct. Better luck next time!",
                "Music" : "That’s incorrect, the correct answer was just chatting.",
                "Cooking" : "That’s incorrect, the correct answer was just chatting.",
                "Gamers" : "That's incorrect, the correct answer was just chatting, and this isn't even a category! Come on!"
            ]
        ),
        Question(
            question: "When popular streamers begin to flock to a certain genre or activity, this can be called a “Meta”. In 2022, the (Most effective tactic available) meta was what?",
            answer: "282,000",
            responses: [
                "TV Shows" : "That’s Correct! Fun Fact: Essentially, this meta sees streamers watch television shows with their audiences… usually to the tune of thousands of viewers. Series like Gordon Ramsay’s Kitchen Nightmares and Nickelodeon’s Avatar were extremely popular choices for streamers like Disguised Toast and Pokimane, who both copped bans over DMCA issues stemming from watching copyrighted shows with their audiences.",
                "Among Us" : "Unfortunately that’s incorrect. The correct answer is TV Shows, Amoogus is dead.",
                "Hot Tubs" : "Unfortunately that’s incorrect. The correct answer is TV Shows, unless you’re Amouranth.",
                "Raging" : "Unfortunately that’s incorrect. The correct answer is TV Shows, although ask Tyler1 and you may get a different answer. (Or be maimed)",
                "Hate Raids" : "Unfortunately that’s incorrect. The correct answer is TV Shows.",
            ]
        ),
        Question(
            question: "What company bought Twitch.tv in 2014?",
            answer: "Amazon",
            responses: [
                "Google" : "Good Guess but unfortunately, that’s incorrect! The correct answer was Amazon. Better Luck Next Time!",
                "Amazon" : "Good Guess, that’s correct! Fun Fact: Now, Twitch might never have reached the heights it is at today without Amazon’s backing, and, if it wasn’t Amazon, Google likely would have bought it up to pair with YouTube. But the price of just under $1 billion dollars appears to be a massive value just seven years later.",
                "ABC" : "Good Guess but unfortunately, that’s incorrect! The correct answer was Amazon. Better Luck Next Time!",
                "Tesla" : "Good Guess but unfortunately, that’s incorrect! The correct answer was Amazon. Better Luck Next Time!",
                "Disney" : "Good Guess but unfortunately, that’s incorrect! The correct answer was Amazon. Better Luck Next Time!",
            ]
        ),
        Question(
            question: "In 2021 streamer “Ludwig” (Ludwig Ahgren) submitted himself to almost a month of constant streaming, in an event that would go down in history as one of the most subscribed streams of all time. How many subscribers did he gain?",
            answer: "282,000",
            responses: [
                "282,000" : "That’s correct! Fun fact: Ludwig Ahgren received 282,191 subscriptions during his subathon, breaking the previous record set in 2018 by Tyler 'Ninja' Blevins of the most concurrent subscribers on Twitch. The stream's content consisted of talking to his viewers or stream moderators, playing games, sleeping, among other various daily activities.",
                "369,000" : "Unfortunately, that’s incorrect. The correct answer was 282,000 subscriptions.",
                "234,000" : " Unfortunately, that’s incorrect. The correct answer was 282,000 subscriptions",
                "53" : "Unfortunately, that’s incorrect. The correct answer was 282,000 subscriptions",
                "1" : " Unfortunately, that’s incorrect. The correct answer was 282,000 subscriptions, also does the number “1” really seem logical? I mean seriously?!",
            ]
        ),
        Question(
            question: "In 2020, what company began to create a genuine competition for Twitch, only to shortly after shut down and become obsolete?",
            answer: "Mixer",
            responses: [
                "Mixer" : "That’s Correct! Mixer was the most high-profile challenger. The company signed two of the top three most followed streamers on Twitch at the time. It didn’t matter. Despite the celebrity of Ninja and the history of shroud, Mixer’s market share hardly moved. Less than a year after signing both streamers, Mixer shut down. Both shroud and Ninja moved back to Twitch where they’ve returned to their main audiences, with Mixer proving to be a momentary (and monetary) speed bump in their careers.",
                "StreamZone" : "Unfortunately, that’s incorrect. The correct answer was 282,000 subscriptions.",
                "Youtube" : " Unfortunately that’s incorrect, the correct answer was Mixer.",
                "Facebook Gaming" : "Unfortunately that’s incorrect, the correct answer was Mixer.",
                "Twitter" : "Unfortunately that’s incorrect, the correct answer was Mixer.",
            ]
        )
    ])
}
