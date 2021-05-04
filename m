Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3C372CD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZNl00DBRz30G7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 01:18:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZNkd41Z7z2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 01:17:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZNkV6mm7z9sWC;
 Tue,  4 May 2021 17:17:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2U51XEl42gmq; Tue,  4 May 2021 17:17:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZNkV5ldvz9sWB;
 Tue,  4 May 2021 17:17:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB8538B7AF;
 Tue,  4 May 2021 17:17:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zuFq165ruu97; Tue,  4 May 2021 17:17:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2274F8B78D;
 Tue,  4 May 2021 17:17:38 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
 <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
 <daace050-6233-77ea-4517-0fd3c4b21057@xenosoft.de>
 <30f559f4-b50a-de63-94e1-761022468684@csgroup.eu>
 <c9a692b4-0ac0-d595-10fa-c3213b1518fc@xenosoft.de>
 <3b7daea5-7b2b-a089-0427-3becb986b6f5@csgroup.eu>
 <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
 <6a322f04-a81e-ae31-1425-19fda9307b23@csgroup.eu>
 <f253fc33-daa1-e668-31b3-593991531ffb@xenosoft.de>
 <6d3ae417-48de-3b61-f6fe-da951d74fef3@xenosoft.de>
 <07541597-f309-0d33-2c29-6da8fcd10aa1@csgroup.eu>
 <c4914f77-f8c2-e869-d731-4d0882e12af0@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c103a1a5-4a22-1738-1d65-3314a4457a0d@csgroup.eu>
Date: Tue, 4 May 2021 17:17:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c4914f77-f8c2-e869-d731-4d0882e12af0@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/05/2021 à 16:59, Christian Zigotzky a écrit :
> Am 04.05.21 um 16:41 schrieb Christophe Leroy:
>>
>>
>> Le 04/05/2021 à 13:02, Christian Zigotzky a écrit :
>>> Am 04.05.21 um 12:07 schrieb Christian Zigotzky:
>>>> Am 04.05.21 um 11:49 schrieb Christophe Leroy:
>>>>>
>>>>>
>>>>> Le 04/05/2021 à 11:46, Christian Zigotzky a écrit :
>>>>>> Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>>>>>>>
>>>>>>>
>>>>>>> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>>>>>>>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>>>>>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>>>>>>>> Hi
>>>>>>>>>>>
>>>>>>>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>>>>>>>> Hi Christophe,
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks for your answer but I think I don't know how it works with the cherry-pick.
>>>>>>>>>>>>
>>>>>>>>>>>> $ git bisect start
>>>>>>>>>>>
>>>>>>>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>>>>>>>
>>>>>>>>>>> git bisect start -- arch/powerpc
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>>>>>
>>>>>>>>>>> You said that powerpc-5.13-1 is bad so you can narrow the search I think:
>>>>>>>>>>>
>>>>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>>>> git bisect good 887f3ceb51cd3~
>>>>>>>>>> I tried it but without any success.
>>>>>>>>>>
>>>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>>>
>>>>>>>>>> Output:
>>>>>>>>>> fatal: Needed a single revision
>>>>>>>>>> Bad rev input: powerpc-5.13-1
>>>>>>>>>
>>>>>>>>> I don't understand, on my side it works. Maybe a difference between your version of git and 
>>>>>>>>> mine.
>>>>>>>>>
>>>>>>>>> In that case, just use the SHA corresponding to the merge:
>>>>>>>>>
>>>>>>>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>>>
>>>>>>>>> Christophe
>>>>>>>> Do you use a BookE machine?
>>>>>>>
>>>>>>> No I don't unfortunately, and I have tried booting in QEMU a kernel built with your config, 
>>>>>>> but it freezes before any output.
>>>>>> You can use my kernels and distributions.
>>>>>>
>>>>>
>>>>> Ok, I'll see if I can do something with them.
>>>>>
>>>>> In the meantime, have you been able to bisect ?
>>>>>
>>>>> Thanks
>>>>> Christophe
>>>> I am bisecting currently.
>>>>
>>>> $ git bisect start -- arch/powerpc
>>>> $ git bisect good 887f3ceb51cd3~
>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>> OK, there is another issue after the second bisecting step. The boot stops after loading the dtb 
>>> and uImage file. I can't solve 2 issues with bisecting at the same time.
>>
>> In that case, you can use 'git bisect skip' to skip the one that is not booting at all.
> In my point of view 'git bisect skip' isn't a good idea because I will not find out if the skipped 
> commit is good or bad and maybe the first bad commit.

The second problem may be completely unrelated to the first one so it could work.

In any case, if 'git bisect' finds out that the bad commit is in the middle of a skipped area, it 
will tell you. So I think it is worth it.

The second solution could be to first focus on that 'boot stops after loading problem' and try to 
find out which commit introduces the bug, then which one fixes it. But it may not be necessary.

Other solution, as you were thinking that the conversion of 'booke' to C interrupt entry/exit, you 
can also try around that: See if d738ee8 has the problem and 2e2a441 doesn't have the problem.

If so, you can bisect between those two commits (There are 8 commits inbetween).
