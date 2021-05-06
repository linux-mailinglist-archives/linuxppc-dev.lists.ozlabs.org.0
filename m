Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B5374F3D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 08:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbNYd2tZsz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 16:13:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbNYG71gfz2y6N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 16:13:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FbNY81Hj8z9sY3;
 Thu,  6 May 2021 08:13:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wU_4kwkdyDV9; Thu,  6 May 2021 08:13:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FbNY80HFzz9sY2;
 Thu,  6 May 2021 08:13:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4C0E8B7E9;
 Thu,  6 May 2021 08:12:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CDPr-ialga9T; Thu,  6 May 2021 08:12:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FCD28B7E8;
 Thu,  6 May 2021 08:12:59 +0200 (CEST)
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
 <c103a1a5-4a22-1738-1d65-3314a4457a0d@csgroup.eu>
 <9f150fb5-3034-f256-04f9-9c802e40f855@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b5a2b9b7-6f1e-8dcb-8466-053b8ff8241d@csgroup.eu>
Date: Thu, 6 May 2021 08:12:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9f150fb5-3034-f256-04f9-9c802e40f855@xenosoft.de>
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



Le 05/05/2021 à 14:43, Christian Zigotzky a écrit :
> On 04 May 2021 at 05:17pm, Christophe Leroy wrote:
>> Le 04/05/2021 à 16:59, Christian Zigotzky a écrit :
>>> On 04 May 2021 at 04:41pm Christophe Leroy wrote:
>>>> Le 04/05/2021 à 13:02, Christian Zigotzky a écrit :
>>>>> On 04 May 2021 at 12:07pm, Christian Zigotzky wrote:
>>>>>> On 04 May 2021 at 11:49am, Christophe Leroy wrote:
>>>>>>
>>>>>> I am bisecting currently.
>>>>>>
>>>>>> $ git bisect start -- arch/powerpc
>>>>>> $ git bisect good 887f3ceb51cd3~
>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>> OK, there is another issue after the second bisecting step. The boot stops after loading the 
>>>>> dtb and uImage file. I can't solve 2 issues with bisecting at the same time.
>>>>
>>>> In that case, you can use 'git bisect skip' to skip the one that is not booting at all.
>>> In my point of view 'git bisect skip' isn't a good idea because I will not find out if the 
>>> skipped commit is good or bad and maybe the first bad commit.
>>
>> The second problem may be completely unrelated to the first one so it could work.
>>
>> In any case, if 'git bisect' finds out that the bad commit is in the middle of a skipped area, it 
>> will tell you. So I think it is worth it.
>>
>> The second solution could be to first focus on that 'boot stops after loading problem' and try to 
>> find out which commit introduces the bug, then which one fixes it. But it may not be necessary.
>>
>> Other solution, as you were thinking that the conversion of 'booke' to C interrupt entry/exit, you 
>> can also try around that: See if d738ee8 has the problem and 2e2a441 doesn't have the problem.
>>
>> If so, you can bisect between those two commits (There are 8 commits inbetween).
> Hi Christophe,
> 
> I am bisecting with skipping the boot issue currently. Unfortunately it seems there is another bug. 
> I had to skip two times because the kernel didn't compile.
> 

> 
> Should I continue bisecting?
> 
> You can find the other steps (21 and higher) here: 
> https://forum.hyperion-entertainment.com/viewtopic.php?p=53103#p53103
> 

Ok, so let's summarise:

887f3ceb51cd = Xorg doesn't work
887f3ceb51cd is the "first bad commit" identified by your first "bisect"
887f3ceb51cd~ = 627b72bee84d works ok
c70a4be130de = Xorg doesn't work

Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg working ?

Can you provide 'git bisect log' ?

It seems there is some mismatch between the commit and the description. For instance, you say 
fd6db2892eba and 14b3c9d24a7a don't build. I see no reason for that, I agree there is that build 
failure but with dc6231821a14, 0c2472de23ae, 3db8aa10de9a and 097157e16cf8. That is fixed by 
ceff77efa4f8. Note that that build failure should not occur if you have CONFIG_CONTEXT_TRACKING, but 
it is not our problem for the time being.

Anyway, what I learn from your details is:

56bec2f9d4d0 is the first one you tested which stops after loading the dtb and uImage.

Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to identify first bad commit that 
stops after loading the dtb and uImage ?

Once that first bad commit is identified, can you check whether the preceeding commit with 
cherry-picked 525642624783 has Xorg working or not ?


ceff77efa4f8 is the last one you tested which stops after loading the dtb and uImage.
49c1d07fd04f is bad (Xorg not working)

Can you bisect between ceff77efa4f8[good] and 49c1d07fd04f[bad] to identify first commit that 
doesn't stop after loading the dtb and uImage ? (Here you have to make a mental exercice:
the ones that stop after loading dtb/uImage are the 'good' and the ones booting OK are the 'bad')

Once you have found out what breaks booting and what makes it work again, then we should be able to 
progress on the investigation.

Thanks
Christophe
