Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EEE3E27EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 11:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1CV6XxQz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 19:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1C86SrGz3bnj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 19:58:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gh1C25SlJz9sV1;
 Fri,  6 Aug 2021 11:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Wlf5KJBDKma; Fri,  6 Aug 2021 11:58:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gh1C24GDvz9sTp;
 Fri,  6 Aug 2021 11:58:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BB118B827;
 Fri,  6 Aug 2021 11:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id epD-3ISpIfz2; Fri,  6 Aug 2021 11:58:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE04A8B822;
 Fri,  6 Aug 2021 11:58:37 +0200 (CEST)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Finn Thain <fthain@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
 <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
 <c535cc2b-3f45-2415-1e81-32ea24b4ec@linux-m68k.org>
 <b8ae2ca4-56e8-e39a-27a0-f0ee2fea1511@csgroup.eu>
 <f6a3746e-80ef-a6b3-925a-69aed01ba98c@linux-m68k.org>
 <b6fe0c8e-8af5-e0e9-629b-fce61750ec2e@yahoo.com>
 <4ac28304-4519-fb8a-a868-e8c79cb5f9e4@yahoo.com>
 <7532219a-4fd0-416-6365-304033fa6abd@linux-m68k.org>
 <9659419d-da9e-5aa6-ffbb-758748e2d6e9@linux-m68k.org>
 <2eb2b452-51d5-c495-3ffe-896c62a1633f@yahoo.com>
 <da9c16b4-70bc-6fe0-ad5c-8b226ca08b23@yahoo.com>
 <cc5a203f-9df5-a0b-a4d7-bcaddde777d5@linux-m68k.org>
 <6ea50cd7-84d3-5180-0430-1211aaf0e308@yahoo.com>
 <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
 <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
 <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
Date: Fri, 6 Aug 2021 11:58:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org,
 Stan Johnson <userm57@yahoo.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/08/2021 à 11:43, Finn Thain a écrit :
> On Fri, 6 Aug 2021, Christophe Leroy wrote:
> 
>>>>>>
>>>>>> Can you check if they DO NOT happen at preceding commit c16728835~
>>>>>>
>>>>
>>>> $ git checkout c16728835~
>>>> Previous HEAD position was c16728835eec powerpc/32: Manage KUAP in C
>>>> HEAD is now at 0b45359aa2df powerpc/8xx: Create C version of kuap
>>>> save/restore/check helpers
>>>> $ git am ../message.mbox
>>>> warning: Patch sent with format=flowed; space at the end of lines might be
>>>> lost.
>>>> Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
>>>> $ cp ../dot-config-powermac-5.13 .config
>>>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
>>>> olddefconfig vmlinux
>>>>
>>>> Linux version 5.12.0-rc3-pmac-00077-gc9f6e8dd045
>>>>
>>>> 3) PB 3400c
>>>> Hangs at boot (Mac OS screen)
>>>>
>>>> 4) Wallstreet
>>>> X fails, errors in console log (different than test 2), see
>>>> Wallstreet_console-2.txt.
>>>>
>>>
>>> This log shows that the errors "xfce4-session[1775]: bus error (7)" and
>>> "kernel BUG at arch/powerpc/kernel/interrupt.c:49!" happen prior to commit
>>> c16728835eec ("powerpc/32: Manage KUAP in C").
>>
>> As mentionned by Nic, this is due to r11 being cloberred. For the time being
>> the only r11 clobber identified is the one I have provided a fix for. I'm
>> wondering whether it was applied for all further tests or not.
>>
> 
> Your fix was applied to this build with "git am ../message.mbox".

Ok good.

> 
>> ...
>>>>
>>>>>
>>>>>> Could you test with CONFIG_PPC_KUAP and CONFIG_PPC_KUAP_DEBUG
>>>> ...
>>>>
>>>> $scripts/config -e CONFIG_PPC_KUAP
>>>> $ scripts/config -e CONFIG_PPC_KUAP_DEBUG
>>>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
>>>> olddefconfig vmlinux
>>>> $ grep CONFIG_PPC_KUAP .config
>>>> CONFIG_PPC_KUAP=y
>>>> CONFIG_PPC_KUAP_DEBUG=y
>>>>
>>>> Linux version 5.12.0-rc3-pmac-00078-g5cac2bc3752
>>>>
>>>> 9) PB 3400c
>>>> Hangs at boot (Mac OS screen)
>>>>
>>>> 10) Wallstreet
>>>> X failed at first login, worked at second login, one error in console
>>>> log ("BUG: Unable to handle kernel instruction fetch"), see
>>>> Wallstreet_console-5.txt.
>>>>
>>>
>>> One might expect to see "Kernel attempted to write user page (b3399774) -
>>> exploit attempt?" again here (see c16728835eec build above) but instead
>>> this log says "Oops: Kernel access of bad area, sig: 11".
>>
>> Maybe the test should be done a second time. As r11 is garbage it may or
>> may not be a user address. If it is a user address the we get "Kernel
>> attempted to write user page". If it is a random kernel address, we
>> likely get "Kernel access of bad area" instead.
>>
> 
> Your fix was applied here also.
> 

Anyway, it would be worth trying to boot a few times more with the same kernel, because as I said 
the value is random, so it may or may not hit userspace, hence the possible difference of message, 
either "Kernel attempted to write user page" or "Kernel access of bad area" depending on whether the 
address is a user address or not.

I have cooked a tentative fix for that KUAP stuff.
Could you try the branch 'bugtest' at https://github.com/chleroy/linux.git

Thanks
Christophe
