Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751B279A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 11:46:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458l5D3zQMzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 19:46:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="v8i1Fz8G"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458l3m57xjzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 19:45:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458l3d4hnbz9v2Bn;
 Thu, 23 May 2019 11:45:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=v8i1Fz8G; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j_P0PahczTj5; Thu, 23 May 2019 11:45:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458l3d39mbz9v2Bm;
 Thu, 23 May 2019 11:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558604717; bh=mr2FWbpCrI+YzKcbqtky92TVYEjQr1IyQKaTUfkwljY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=v8i1Fz8GSevDijZHONOdtHVF6MMG21MboiOnMNhesyXr4jsTFhd7TiQ/4NOr7cFps
 tAXKNc+960sxLeik8oyJ/DMnPFhfNNjWJlHqElEO+JmiTOgbBjkRpMNibhghnprkY0
 uRjMkWbwJWr6Ymu5B1giLt+cWoBdnI5EICfTtlss=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99CDC8B85A;
 Thu, 23 May 2019 11:45:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6U365yUrwiUt; Thu, 23 May 2019 11:45:18 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AC408B858;
 Thu, 23 May 2019 11:45:18 +0200 (CEST)
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
To: Mathieu Malaterre <malat@debian.org>
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
Date: Thu, 23 May 2019 11:45:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 10:53, Mathieu Malaterre a écrit :
> On Thu, May 23, 2019 at 10:29 AM Mathieu Malaterre <malat@debian.org> wrote:
>>
>> On Thu, May 23, 2019 at 8:39 AM Christophe Leroy
>> <christophe.leroy@c-s.fr> wrote:
>>>
>>> Salut Mathieu,
>>>
>>> Le 23/05/2019 à 08:24, Mathieu Malaterre a écrit :
>>>> Salut Christophe,
>>>>
>>>> On Wed, May 22, 2019 at 2:20 PM Christophe Leroy
>>>> <christophe.leroy@c-s.fr> wrote:
>>>>>
>>>>>
>>>>>
>>>>> Le 22/05/2019 à 14:15, Mathieu Malaterre a écrit :
>>>>>> Hi all,
>>>>>>
>>>>>> I have not boot my G4 in a while, today using master here is what I see:
>>>>>>
>>>>>> done
>>>>>> Setting btext !
>>>>>> W=640 H=488 LB=768 addr=0x9c008000
>>>>>> copying OF device tree...
>>>>>> starting device tree allocs at 01401000
>>>>>> otloc_up(00100000, 0013d948)
>>>>>>      trying: 0x01401000
>>>>>>      trying: 0x01501000
>>>>>>     -› 01501000
>>>>>>      alloc_bottom : 01601000
>>>>>>      alloc_top    : 20000000
>>>>>>      alloc_top_hi : 20000000
>>>>>>      nmo_top      : 20000000
>>>>>>      ram_top      : 20000000
>>>>>> Building dt strings...
>>>>>> Building dt structure...
>>>>>> reserved memory map:
>>>>>>      00d40000 - 006c1000
>>>>>> Device tree strings 0x01502000 -> 0x00000007
>>>>>> Device tree struct 0x01503000 -> 0x00000007
>>>>>> Quiescing Open Firmware ...
>>>>>> Booting Linux via __start() @ 0x001400000
>>>>>> ->dt_headr_start=0x01501000
>>>>>>
>>>>>> Any suggestions before I start a bisect ?
>>>>>>
>>>>>
>>>>> Have you tried without CONFIG_PPC_KUEP and CONFIG_PPC_KUAP ?
>>>>
>>>> Using locally:
>>>>
>>>> diff --git a/arch/powerpc/configs/g4_defconfig
>>>> b/arch/powerpc/configs/g4_defconfig
>>>> index 14d0376f637d..916bce8ce9c3 100644
>>>> --- a/arch/powerpc/configs/g4_defconfig
>>>> +++ b/arch/powerpc/configs/g4_defconfig
>>>> @@ -32,6 +32,8 @@ CONFIG_USERFAULTFD=y
>>>>    # CONFIG_COMPAT_BRK is not set
>>>>    CONFIG_PROFILING=y
>>>>    CONFIG_G4_CPU=y
>>>> +# CONFIG_PPC_KUEP is not set
>>>> +# CONFIG_PPC_KUAP is not set
>>>>    CONFIG_PANIC_TIMEOUT=0
>>>>    # CONFIG_PPC_CHRP is not set
>>>>    CONFIG_CPU_FREQ=y
>>>>
>>>>
>>>> Leads to almost the same error (some values have changed):
>>>
>>> Ok.
>>>
>>> When you say you are using 'master', what do you mean ? Can you give the
>>> commit Id ?
>>>
>>> Does it boots with Kernel 5.1.4 ?
>>
>> I was able to boot v5.1:
>>
>> $ dmesg | head
>> [    0.000000] printk: bootconsole [udbg0] enabled
>> [    0.000000] Total memory = 512MB; using 1024kB for hash table (at (ptrval))
>> [    0.000000] Linux version 5.1.0+ (malat@debian.org) (gcc version
>> 8.3.0 (Debian 8.3.0-7)) #8 Thu May 23 06:26:38 UTC 2019
>>
>> Commit id is:
>>
>> e93c9c99a629 (tag: v5.1) Linux 5.1
>>
>>> Did you try latest powerpc/merge branch ?
>>
>> Will try that next.
> 
> I confirm powerpc/merge does not boot for me (same config). Commit id:
> 
> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
> 'next' and 'fixes' into merge

I see in the config you sent me that you have selected CONFIG_KASAN, 
which is a big new stuff.

Can you try without it ?

Christophe

> 
> 
>>> Can you send your full .config ?
>>
>> Config is attached.
>>
>> Thanks,
>>
>>> Christophe
>>>
>>>>
>>>> done
>>>> Setting btext !
>>>> W=640 H=488 LB=768 addr=0x9c008000
>>>> copying OF device tree...
>>>> starting device tree allocs at 01300000
>>>> alloc_up(00100000, 0013d948)
>>>>     trying: 0x01300000
>>>>     trying: 0x01400000
>>>>    -› 01400000
>>>>     alloc_bottom : 01500000
>>>>     alloc_top    : 20000000
>>>>     alloc_top_hi : 20000000
>>>>     nmo_top      : 20000000
>>>>     ram_top      : 20000000
>>>> Building dt strings...
>>>> Building dt structure...
>>>> reserved memory map:
>>>>     00c40000 - 006c0000
>>>> Device tree strings 0x01401000 -> 0x00000007
>>>> Device tree struct 0x01402000 -> 0x00000007
>>>> Quiescing Open Firmware ...
>>>> Booting Linux via __start() @ 0x001400000
>>>> ->dt_headr_start=0x01400000
>>>>
>>>> Thanks anyway,
>>>>
