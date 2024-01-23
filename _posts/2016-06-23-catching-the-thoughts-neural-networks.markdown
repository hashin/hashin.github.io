---
layout: post
title: 'Catching the thoughts : Neural Networks.'
image: https://lh3.googleusercontent.com/0iiVdAI47Pxqqg1PneQCO9PCVID7L9K46eNXpWnENxe8BSn0QhZyYN5yi6DgCPkpk7VPLhmFywrfAKGF1B61-YqObn8dhvstNdrJXTUgF6Sqz_wuJfDvtLz4yHI4H1VUJ673HQJ6cZx4Wd3Om2xMOWdaaDGJNHMQjBV8C2f8imuuzQgk-lCGNCHShA8UNYGlsldG4vMm9eXN2TnQp8DRYdORtOMPRHFr6rrw8751ulPIIQ7A1Q89ugLIrH0IS64P2VGREh68pszKo3cSnT2UrlEW4w5VBUnW37Wf9HkfR7w81dbtijB5we0prmznjX7DkZ_u8FkSbkgmk5vofIajGzvh-r5uQ0lQlUzxo9FuVC8Ca7gOZtdgJTm_O3Vbp6lDrypcCuqHzWw1KoSJctaCUL35zYXEnJtheAgF7w1fA9vXIjB2QmRqFB35sB60fVGoHuEhflEFlk-nHihH6GIPPUkZDPXl60kFfHpxQ6yUb4czyl5JoKA4xhQfeCoxltv3CwbtVBc8APRs29vTt3Orsavy9YiFH09qYOyI7hJMAp0aed4bCDhXSVYmRFy6f1mQgLbpeSqkb4ew5I1oQ4XccY4SurDWyCA=w1200-h800-no
date: '2016-06-23 18:49:09'
---

> ==Research that throws light into the way neural networks work might change our understanding on how human thought process work. Here is how.==


I have been following the [Google research blog](https://research.googleblog.com " target="_blank) for quiet sometime tuning on to the latest developments from the tech giant. 

And then I came across something interesting today. The folks at Google call it "Inceptionism" and it left me baffled.

Before I write about what it is, let me give a primer on what neural networks are.

We all know what Computer programs do - provide step by step instructions on how a particular task is completed. Depending upon the complexity of the task at hand, a computer program can be very simple or can get really really complex.

But one thing stays the same - the programmer instructs the computer what to do and it complies. Almost all the technological brilliance we see around us is built this way - by telling the computers what to do and making them do *exactly* that. 

The so called 'software' companies have invested billions of dollars into creating systems and processes that ultimately churn out the *code* that make systems tick.

Whatever it does, the workflow is the same - The code *knows* what to do. This *code* is again converted to simple arithmetic operations that a computer understand and the computer systematically executes these simple instructions (at insanely insane speeds) to do whatever we want it to do.

So an onlooker might be tempted to ask, 

"So if you wanna make a computer do difficult tasks, you might umm... well write a complex program to make it do that. Nothing is impossible, right!!!"

But it turns out some of the tasks we humans easily do are insanely difficult for computers to replicate. These include natural language processing (learning and understanding a human tongue), detecting objects from image (like a cat in a youtube video), logical thinking based on ontologies etcetera.

The reason being that the 'steps' that go behind these processes are very difficult to decipher. If you ask me how to make coffee, I will be able to give you a set of steps or [an algorithm](https://en.wikipedia.org/wiki/Algorithm " target="_blank)  that might help you to make it again.

But if you ask me to give a step by step description of how I detected a cat's face in that video, umm well... I can't!!

It turns out that it's insanely hard to decipher 'the small steps' involved in say learning a language or looking at a cat's image and *understand* that it's actually a cat.

So the computer scientists had to look for ways to make computers do such trivial tasks.

The traditional understanding of Computer Science wouldn't help us build the tech to do them easily. But what to do, we are a species that is never cowed down by obstacles.

Our people kept thinking on how to tackle this and build systems that will 'act like humans'.

So if we want a computer to mimic human brain, we should make them work like one. So people started looking up to a field of science that tried to understand the human decision making system.

We humans, despite being rational beings make some insanely foolish decisions at times. We seem to weigh in a lot of factors before taking a decision. 

If we weigh in the right parameters with the right amount of importance to each of them, we are more likely to end up with a better decision.

If we screw them up, we are not to be surprised when our final decision is screwed up like anything. 

So a lot of research went into this field trying to understand our decision making process and build systems that mimic our decision making. They all were researched and refined under the umbrella of [Artificial Neural Networks](https://en.wikipedia.org/wiki/Artificial_neural_network " target="_blank) (ANNs).

Here, I am presenting an over simplified view of what goes under them.

So these systems are networks that essentially contain nodes that make small decisions based on our inputs and the desired result for this inputs (an optimal or desired output).

So properties of this nodes are set such that outputs comes as close as possible to the desired results.

But how do we set these properties? 

This is very similar to asking ourselves on how do we make ourselves ready for an examination after a failed test.

What do we do?!!

##### ==We learn!!==

Yes, we make the network learn from its experience and reset the 'properties' so that the next time we give the same input, we get an output that is optimal.

So we keep training (teaching! ^_^) our networks with huge datasets so that our network gets better and better in what it does.

This is very similar to how we learned to walk. We tried and we failed. Then we tried again and we failed. The mistakes made us stronger, we learnt to walk at last!

The input was our desire to walk. The properties of our system (node) was the forces we applied on different point on our body. Output was if we were able to balance ourselves or not.

If we got our properties wrong, we fall. But we readjust them so that we are better off next time. Slowly we pick this up and at the end we know when and were the right amount of force is to be applied. Viola! We have our properties right, just like a neural network.

So after the laborious process of learning, practicing it comes quite easy. The same is true for neural networks as well. The entire literature in Neural Network is mostly around how to effectively make your Neural Network learn and how we design Neural Networks that give good results once they are 'trained'.

<hr>

So now we understand Neural Networks and how they make decisions and gets things done. We also know that they learn from their experiences rather than act on some rigid instructions like a trivial computer program.

But why did I go to these depths to talk about them all of a sudden? What made me think about them other than my occasional flirtations with [Tenserflow](https://www.tensorflow.org " target="_blank) and other neural networking toolboxes?

It's the Inceptionism!

So what is Inceptionism? It was an attempt to understand neural networks.

At this point, we know that neural networks learn from their 'experience' and take decisions based on that. If the neural network is trained a lot, we can check it's efficacy by testing it with a sample data set. 

If the neural network gets a lot of decisions correct we say that it's a good one. It means we got our design correct. If it fails a lot, we have to redesign them again. 

The problem is that in the process of designing a network, we have no idea about how the 'properties' of the end network will look like. These properties have to be picked up by the network during the 'learning' process. 

In short, the designing and refining of a neural network is a largely trial and error process with a lot of 'guidelines' we have from our past experience designing neural networks. We are still largely unclear about how to design them effectively and get them right every time.

A huge amount of research goes behind this and I found myself interested in finding out how they work. Then I stumble upon [this article](https://research.googleblog.com/2015/06/inceptionism-going-deeper-into-neural.html) at the Google research blog. 

It contains some really good images. You can have a look at them here:

<hr>

![The Pagoda.](https://lh3.googleusercontent.com/upk-lzoutJD8jqABXGYb_MQjgPbbnrh2Ghy25iYVkID5_K9RMklAz2Ue9Z8BOv5EWWpJWc-UW0s2CQI769jjShfTl88Ft-8jUjsuNvTokyp54xDjOgK1nZNHj7C8tpl8ny8z2t0yvhjAw4JQXzL4apu1iSVIDNKOb8Y3nOl4-pQNC2hwMfE2o-p-CLU4PEXpkFb0EY706IC4-LZzBctKK-gS5PmjRUwBtLKpBE5YQNgoBXz7M8a6iwtd5R--foosK0dN4y5tziPYvPrlMtVFE7VlXpCDUASacjUcXb87vORdWMjInj7wtMmAQ21MjZFMrbCTO-LMU6wpRC49s80bhDFomynROqmCWwYwzFEmwx5oCZfX1y7TkSFlqpcZ0fk29D5i9yiF5KuXTIlTBynhqWuUTgsxy49IhVEsRYhKPzJoSxKyJ2p21XZvDTjaCHHinOiw4yVJ15K604vspRn1vcBymHbDIijBTfA79Y9s3Qagnfz7ewtxkN1LktOk0BS8lTcCa3xvfYydflfBquzQ_H6Kngwa4umHJf_uGx5CxcvQFwrKtk6u54WrOUIUYjWEYs0jORuun6syGEgf2MdySdutZ3ZtnsE=w1200-h800-no)

![](https://lh3.googleusercontent.com/yAZRIajnseS5_kARyeGrtMfhq0ORP1wohs8McBY3B4i9yTKt9x4aI9zVSCi0UW1A2uFxOD5wBgeefZLttKbPRRFruF0jJOenoT9ACtuShJzuZE583fJ7xRcHjAGzNhRXe5YkNfMKe8rMKPb3yIAg-g5L1Lp7heKOWn-bYHMflLk2hYORtCK90KLcLF4NaFKOLJEUt2JcCmIouw235W8bosp4uF8xpnePwoBmtr8RZeVMfA5y3a_iUx1gVGhI2fVhgWYSLo3VazjTkl-kqcn1rP0jvG9M7g--ERyfHEq8l9HDzYK5Sy8QfY9tToZ27bIXnMYrQ2dhM9_ac9jZQY59fyiE1aPH73_QF9tdPEs-GLJCkpQV6EG3OGj2O63pq6TDvEmbWlxRaZ8zSTPwuoXByAdVaM_n9SR2lZRiQfPMSkjj6bbqGQNHkOSSe5uVwPkk4cBL1fAmaP47DCRYY18I1LiKrUSUbDTLPdd1R-fmg7RwtMysaRH9Eeee2bZX6y9MEevYAHqr3Vp8dDoKsNnH6-VSbq-MOdpHZffHAyE1Thf53uqTSQlbSA82eCFTvbs6c82SuZQPatHj6j-d90BixSp1HxnbmfA=w1200-h800-no)

![](https://lh3.googleusercontent.com/YpWcDU_Oyf_Y0PWhlY_tUKte4gpE5ipzis_aE3hc1C2JHOfGBX3yV0zCNAUlUEGOOO_tRsRO2gxW-QyamUIlz9PhNtKo8tiJhh4HZgDmZqNh4sCE97MqlsHZurEI21a53g-TVwVWjUUmuIAxr7EhbO4vsvkp8VWmbVWiFYScsDB2eyKGXaelxUpkbbaMyjqU1SWbJdEgx449XknNK3AynmkBNTcINBJmCiMEa2HouAnii-GDIW8knyluCYENWby2MfSSK0SW7VXiPTV4F-ttJYBmlgPU8MsL-nXS2t7H1MbXj9G7ePJgDc16Y0mssToqkQtb34zdnI_LL5X4ugFPUN2htC7RQW7ec6bdY7LGVMNfyOV4HEWGFUo8fOsEjVsIPVV3XbomuuhUP1rF9RwBYchPICdt7e4bwHYu5lifFXUP3-DcBfOI9yn6CI7-STo-kC1Z5GmzPgR6Nh0_V4f-HTDTeDFtHVmCry3e7Dbj644bilnekuRzp66CQw71GNAU4Yqu6TrSL4bEY4gxZXGJ_HCpngzRBGDY3ZyK3wyQE55lGNb62Noj_4r9vewC04CpLgbP6ejKMi8NTvEsQYhv98SVZr1w_Jo=w1200-h800-no)

![](https://lh3.googleusercontent.com/zllIBq5UnbZ4t3uq3vDqz4_OvJuS7zsFPJ80gojiu4inFt3mWJYr7mamiulUX26Lfh-T3sxSC1koYhdi9knLhihjYozHL4BkCvDAZmNaEbhugM-gU9KQhs2QPHQAFHX85K0PcIcxO6qmWIbGmqJV3D6cMzlOd8MXtCpBOk-cs0iXyiO0-epIElGtXefNrlK_qWZnocUfr4vkAIJfk2ItuFDADsYhe79LW9U4Q0W3PMA80RLMtPnzdHv0U7ceTWevGerxbsK6B_Yuhctl_3bxHwiRXn4f7ikrHezaI19sKd9te30ke0kSB-qd38gko8kMhVsOOpvzQhVl6sqJQ6QijabCTFnKXicB_GtK6WwA60kN3QGvA0uFhjKEqVYNGpwCFsu0tIr8TPy2I9wR7OMI7zmWz_UJk5f51RNMFYT6gEfil0qQ0XKnkKSE5VI2a9ptOKog2pSXjqVxgat0luFkf5xgIRysWzyI0I2rtj7T0Yj0JrmLlBP6SdWxXX4qmYqIDo6za0Ya7u9PbHmQDTrkbKZ0xAf8cVOnhk7OgnRLDF5R-pCmVJeq1L-6KTW5MFFHf8uEblpr4HHXOjl1K1Vm3q16DBrtfRE=w2788-h1678-no)


<hr>

Wait what?! Don't they look like some psychedelic imagery that we look into when we are high?

Or why do they have uncanny resemblance to the kind of patters we see when we are high?

N.B: Drugs kill people.

Coming back, what do these images represent?

As I have explained above, a Neural Network after training is a set of 'properties' based on which it outputs an optimal decision for a given input.

As we know, a big problem can be split into sets of small problems and solutions to these problems can be interlinked to solve the bigger problem. This approach is called 'divide and conquer' approach to problem solving.

Similarly, neural networks that do decision making for smaller problems are interconnected together to solve bigger problems. 

But at the end of the day, we don't really understand the 'properties' of this neural networks, all we can do is to test them against test databases and see if they are performing well.

When we look at these 'properties', all we see are some numbers. So how do we make sense of these numbers and aid ourselves in the meaningful design of Neural Networks? 

Another question that arises is, can we build Neural Networks good enough to replace the standard programming practices?

To probe in to all these,  folks at google came up with this 'inceptionist' approach. It works like this.

Suppose we have a neural network trained to detect sparrows in an image. If we give the image of a sparrow, it will most probably give us an astounding "YES" if it's a good neural network.

You might get a "NO" if you input the image of a crow, good enough. But does this process help us understand the working of a neural network? 

No!!!

So the idea is to start with a random image and make it pass the Neural Network as "positive" . For example take an image with [Gaussian Noise](https://en.wikipedia.org/wiki/Gaussian_noise " target="_blank) and enhance it so that the neural network gives a "YES" when you feed this enhanced image as an input.

For example, they took a random image and enhanced it so that the enhanced image will give a "YES" from a neural network trained to detect bananas. The result is interesting.

![](https://lh3.googleusercontent.com/jHAMUQxNPNCtKmRNX_0Va-sKb_VuemFflRLgo9g1orNXBoUMNXhiKAv89QXYumiEuP29inQgMcH7x4VYPz3Ty7CqtEL23fVJ_C1JK-nvOC0Ui6GMtEO1J39_N6gYuFlcK9qaJRjrHEyQK7MOmhUEPu2rSzl87NmJsd-F1N-iRU2aG3iP7NwoqiBF19LYZ81QJ86a0hGK3fHX73hN7XFCjjsbzWsDBZ2s7FI1lo-tS2krulApRBkDBXt7Y9cBaEDA8VABd1XrC19p7R3JWD1WemOwfVYXvnJZyE5bf4apEC2QpROPG4tUHpcH3fq_Juh-8EhEnpXM1MaLOyQSMUI5OW-KbAQFKX6JiUnL9tksZuwZBvyYA028bgGo9qlSzoktsxan8rFMi1gFPYcFR4z_NSg7ArNnriXQi_qLK8-YVIN-tjB3McQEsiZruQJnEXEicsBSAUzVnDvSTd7dTrWpaXQyF6f5fvD-FDNO1eknZDARJOA5mMQIKf6fzwGTj95PUsCIA9fJT_c5E0liWOJIXVDizb7b6gQQXAFA36v2rAJENkaEYEOClg3sE_ADpfwz-24eTDDwCcN-7eaYfheDtozdVL6KSPQ=w700-h283-no)

And all the images we saw above were results generated from random noise when they were enhanced to make them meet the 'expectations' of a neural network.

More images:
<hr>

![](https://lh3.googleusercontent.com/14wBmorZ1JvIvznMNP6POBJnfSrC4kmPorMPwKiYguKB8gdva4HDfdpBrlWfQ-qsaSuNliHf9_u4XiCLudAFfvunjR3rAN1UvETnC0-S3cUrxsLJ-kOUKSpGgmAUQEXrr16ztHURFAcjTN9QH58tkkSEf7QKk7OXl569If6mEThU87OOL9Pc_gwXkzfpUcxc7ixgzql8h7UHF-5j1GYCiQt9KLprXtUWT0V2keCpirG98BGIWchLFZ6VSY62S8plymK2z0I0hJ1rpD6hC-XFtrKA5fZIOu7qEHQ_dM_Bok7ChBn2O5C5QNRi3b2OH8ezi2ICU50VwTZB0y_R-Mv29Bc48Eb8JauvVfLzdG8jK471UlsLBxoSJ_b6VOnHQLYdiehlQkesE21nk6f9bHSc3_JpTGmMYgYmuBvCLPPHl5MZ_qxV80zuSyjx2t7NwftdNCvdA_uTcDbRy57gfWmMmElTlVnbjmLNisgj6_LbZZbQE1UlamZx7ZZV0-XN9jv_V5yAQhuo0gSBCV8uOQbkRiZI7Sbge0wotk9ATTFuwHqW8fK4-P3FmEG78yYqgcByYi3GPCXqFRRVhGpjfcpKwkP6q6MnLH0=w716-h448-no)

![](https://lh3.googleusercontent.com/wkk7jSHv8UEH0ywJrTkvU2SFCWY57ayTip4jnPIYE2XsUcA50S0NWQhqZWWt0tN1e-0uJQkRNsNFPKWq0tGkciiY1TWl2Epuym3hlQo4zrPap16qBOQ24RH7BeGArSpo6dBpaobabKbgzZ3xjf5xPLRRt-6Q5KL00oU3xuyaqt4kwndR9YKbbkkNCldVFciBkY-xCvh_EVCl9a-iqjui3Ti-9ZeJZwLUPu2R4H5tZ3B2QPKgG3SNddVIACt_9UDNTFfC49PN9_Cqz67kBkvcxqUhOLi6OfTplVDJ_nP2Cg8IFq8q_exWrgOwYiJ0RjIyPcYZs9xWvsrwbxFjdDFDdMxJx7L-7uT9F81MWOHzghRDaU8vkfA_tuaXXXnS_tl2G86wEzMNywMGE2k12fB9oQ0Qy5KiW4Mvq2Ac7EUsvG0YURQ-4_rJt-pOnSlNPCWqFanYQw7B2o8dyDNaYz7xswS_D7b9YmXSY5W_SOw55ZCBzsn4G3B9UvPc9_LtiZLPaM-WH4JZ-Qj6oXZgFWNUHdKR6jl18JFP0D9d6FLZOZzUS1sSRkWSROWF3o7Q75hYfJG7wCFWLra6sX61w0J9x6LXeNtCC60=w716-h448-no)

![](https://lh3.googleusercontent.com/PqHUqPavsoHzItRZRMmgW-vfRGcjaY-obtFYP8L32Op1tO6WzvSDyP8vuxWGu99K9-idQtXawghWDUIVEpqS5rbfyhB-NKu9mjVxL_0_3heEXG0PclVl0soywkF7BKRqaTdhdb6Lg1_5AD_AMkjM0AIlGJGcSIOfNOWMPS4M6L8MlubnEij6uP2tafWlWQluHIRPP5sk48ztx9MiQoofocwmFaVUECSS6l__bmCcXRkwc471ZCWhABzXI843cML6ZgOjwM3gDqasWJOtTDKAsEb4qV55t17RkLrgD8Bx0iZP43sjVZi2uRqpUEwEDSzmaBYKgvaN_0dd9VjEIHMkt4vnI8JXj6qKBmfRSLPwbjpgDvBHsUw0TEd3G0BldI4zpp2IBSQHVsLoIAclmREIG3_GT36r_3SZIxKsLuj5E58MZbXRKPMj9lBoHgSK_T4crtdUNfqql_NGGFNCrufinZpLqm7kStJcXTIxYSrMsc8w86UA6_bSnYy19TZx8dFoFNxMCIa0gSD6zrfPGVwsa5WhOF75qv1CeZe34NhecmhUnjvl00DJ2TrczDfRp4ItYzK0wDPN020q-OvooUu4N9xaLImtbSc=w1092-h616-no)

Now when we enhance the image of sky to pass a network for birds, animals or places, we get the following image:

![](https://lh3.googleusercontent.com/tQ-2EZULENqqy6-xiAEmxrmejaEA0BJRTAtj-3kfJlIkli1ChzUQZBEWVigqXuFDo9xQ9-JL4jDhfIgLp7M1nFgwu_lvRZ0hDuT_QN0l5eLi-WOI3zCOEBRQ95-0vu92XyPIWZLUiE4Udvtc3I2nbkBWEP_OLftRsBOThI1OzljCuajfwmhWMG5pldsZQr-d39d58NGGUW0uiJUgp4vpiTV_JWoIOpI1xs5SVkfEouNRrTN87wvfn4QdDx32DBwXLpAFxqT9fjGWVdpvuetBkmtza1t472BY19uIk1F9Nci1ZxHtB92ZAkCtk4aXzXL6hUOK3j-GIehUB1wUjGAZg5bAnhrai9dn7zEo6T9X8mjWH9XyEd68mSCtJqVI1eaoGZBej7wT_6TFvufTEF5JH4ak0oCxFJSQxhvh36NP-hUCC2rbO5F0w98brzKexFM81i4kU4ujWls4oZX_xI_ZUFPLQt51z88wkxsRNQ1n3sZlusMFBv9XhLC_b6r_xaiCdIw8gfkhGZ4jH_tRtaR_CE89j3PmrcB3Tu18x32o6mdGW3zq5Q4KGWgbcaxjib2ac20E-ub14O549YdnG649BASt9chGivs=w2160-h1214-no)

The image of sky used is:

![](https://lh3.googleusercontent.com/2V_rPhRQFGK2r_D0SucrYV8mlsdDEPtjJ-accDrA1Paf6DQd6O-Mzho5H_o3C6_6rR3kNRW2CPqEvLnVLIsxCyp1VskWubnuIgMQM15tAl3i8klu1Nx2cxzCz9tJlUbFFIL_LlecJwZUuEzbffUQhD200iw6LCBqLIQWUhKN4X1LnRcKxGKGtLQIkKgzXow8TwfURdcKl2SWZ6OLMRfBhPNjw23F6BzUhqSnkxyijYH4JVd-qfsjq_B-Dl0jIodkRIh2m_ez2qobYIUadIHG7QpdunMN9OruEY6bXcrlCmyvyjfkmK_0CiEgsnd8BLeiU1dGXGgapCHXpaXWV5G6z-KcBz80-V01b7WSGY5WTizk5ncDWtiOqNRa_KWXf-ePEuqOOZEAe_uszxap7RvG-Nj_d2o-lrX_H-7O1o6gCTBPUVkEw9n8VyG2Gv9G_5YMmbffQG6-oNMIYFCOKxbijK5m-MT0HUiZEofQNp-cj2sk1NKK8ku8M9zuYcFSP2PgR639n0CB9UCB1sw6NQOTfUQ-3-_TVoMPYk_FTkXk0AnJ14MeptVMIocBaV7w0bbkkkLy_eAwDx7XIvEdS9U192A2tCiUh7g=w2160-h1214-no)

A pristine forest:

![](https://lh3.googleusercontent.com/yuMhi-4_3T2OTJWphzGQUOWEM6fQBH99a_9wYmkVxdhM4P_KCI5JufXY36GmDMDsaG9LuDgOKGFJbl_zz05rWDLNN0XDwainveTh_tJ6PT4GPE9ZQPRwhX3dgUX7uwpcuojx_21UKg2CckClBw8vNCNyJPyGDsHW4C8E7DM9fZyQS3wRnr8AzLsNpu1iMZbEoGYXndljWgBhGGpPzy2-aA8lra72U3N7cwO1z21YKGvkHbsku_8vBvFxnwLYdWGNbplUcCm0XnN5s-_oNo2QBPXufIPIeRRWxj1AAGWdZaqvjwZXByxwkFenvfgmUI4ESH0TS24j54_LvQFWjf0W6eGKaEE3alqim4rMA4msJomYx8PVWDBIiK-i8-H-Dk05NPIyj7vS1r0jATX-GzsmBSPqiHSNGr81LMxPJR6ydEi8A1tv0wMHpVn9UehyzGXSKlgg3U2Dql3_CGUZgd8VOU2Xk1h-Lr5B31qZBvrc4XGPEJQcfP0IOZx1uZEs9RmJivzRDYVGkjsbzTi3xgyr5En_Ea63wV-ptMV0Xf_FN5MC5oplvv4ZEwl_ZTdLg-ssCox2tXqQ2Yn60Ot3NzF6v1UVCaX-NGI=w746-h995-no)

When made to pass the neural network for birds and animals looked like this:

![](https://lh3.googleusercontent.com/n-hEgkkqhrbrUC-R-gsezYc-DKiZC87P7bo1uGfl2Jz8k-SWGSUf1NfjeuHORJ2AnUxxsID35oDw0vvk_U5tRysCQQqzxhMTXYGDJPJMrBBcY4v_q6aRAzgE3wQ79BAXwEEVasH110ehq_xQUFzkC206erOaUx_ubUKeg6nSyWI5xNZ3oiUDL2m2Zk_Tj_IddJMguPUGCIISm-kbNWd0e8qQEcJ1nysChFWxlNdMhufYb3suLO-lwlYri4EoDOjPOwu6L3iJXi2MM2ZsegVOB4m66RgCAa5njYIUqWrYWzOntBcVaT_U3cnYCurDzVmnTV7DZCrWUQ-2N-9FWEFceogkX8M5fl6vEhXUI_a3Ep1n-og1F3VTADGM4e-OI64FY0BzSGHAhQpoj2rSsb1LUytbPnS_piKEKbTcnS_QGhItCRwuloxUmtoO4InmoCzPv9pXvWd2OynaBOzooiL2wCo5hGh_AgbrXtoc4OLOsE1_zMswUi4ufnB1GBlSI2KcKsNzYnS9I4UK8rNatYLXfxyZv9GjDKGzcaipPp6Tbl7_5eXv17qxYDdyJ_WOT8Hm1hPOvwVLDI2Ug0hYHvdio2Z0mcb0oqM=w749-h995-no)
<hr>

Isn't it simply amazing, that we can relate with the 'expectations' of a neural network? 

That these expectations are far removed from reality and mimics the psychedelic imagery we are familiar with?

So what if the psychedelic imagery we see when high (N.B: Drugs kill people) or deep in a creative thought is an expression of our inner longing to fulfil the neural networks that sit inside our heads?

True, it's just a rant at this point of time. But I have this strange feeling that these are some how connected. Who knows, the relation might be well established someday!

The distorted image of this world we see in our thoughts or when we are inebriated forms a large part of the fodder which all forms of art and literature feed upon.

By creative thoughts, I mean the kind of thoughts we have when we are alone thinking or when we travel to distant places or again, when we are high. (N.B Drugs kill people). 

When the 'expectations' are not met in real life, these nets might be casting an 'ideal' imagery that fulfils the requirements, Who knows?!!

All we can do is keep ourselves updated with the research from this field and try to form an understanding on our own. It sure helps to learn, about learning!

Addendum : In the preface to "One flew over the Cuckoos Nest", Ken Kesey talks about writing and creating art under the influence of psycho-active drugs, especially the LSD. He was certain that he received 'transmissions' from 'somewhere' but will never be able to say from where it was. A lot of people who use LSD claim the same thing. What might be the origin of these 'transmissions'...?


[Image Credits.](https://photos.google.com/share/AF1QipPX0SCl7OzWilt9LnuQliattX4OUCj_8EP65_cTVnBmS1jnYgsGQAieQUc1VQWdgQ?key=aVBxWjhwSzg2RjJWLWRuVFBBZEN1d205bUdEMnhB " target="_blank)




