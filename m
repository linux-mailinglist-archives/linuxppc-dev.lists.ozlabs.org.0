Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBF279EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:00:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lPW3qSxzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:00:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QUR8ndAR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458lN31gsHzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 19:59:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458lMy3fZlz9v2C5;
 Thu, 23 May 2019 11:59:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QUR8ndAR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3ON27jVSfbvM; Thu, 23 May 2019 11:59:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458lMy2Z55z9v2By;
 Thu, 23 May 2019 11:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558605566; bh=CDcU+eU8/kzcFeBn/rOA4EtrB9MwuTs0L6KGZEj+NGY=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=QUR8ndARuQZ0AQxHLtp19rgdTIOQqUj0m28J++/vV6IZvZidDXqjmgn4RsxCMwP2T
 1sOhvhlI4y9fQNuRn3zTZMqCng5XQG5dQiC1gF5C4zz8lk2BitTzCH7nWqBAdxmzTI
 tdxde2VT6I5N2cGu1EjF8RLojOoAW6wlFsmHY5W8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8285D8B85C;
 Thu, 23 May 2019 11:59:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TfkjX_1ckiN0; Thu, 23 May 2019 11:59:27 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 38A288B858;
 Thu, 23 May 2019 11:59:27 +0200 (CEST)
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Mathieu Malaterre <malat@debian.org>
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
Message-ID: <ba3a1c25-72ce-cfb4-67ac-df07584f57f5@c-s.fr>
Date: Thu, 23 May 2019 09:59:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 05/23/2019 09:45 AM, Christophe Leroy wrote:
> 
> 
> Le 23/05/2019 à 10:53, Mathieu Malaterre a écrit :
>>> Commit id is:
>>>
>>> e93c9c99a629 (tag: v5.1) Linux 5.1
>>>
>>>> Did you try latest powerpc/merge branch ?
>>>
>>> Will try that next.
>>
>> I confirm powerpc/merge does not boot for me (same config). Commit id:
>>
>> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
>> 'next' and 'fixes' into merge
> 
> I see in the config you sent me that you have selected CONFIG_KASAN, 
> which is a big new stuff.
> 
> Can you try without it ?

While building with your config, I get a huge amount of:

ppc-linux-ld: warning: orphan section `.data..LASANLOC10' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC10'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC11' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC11'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC12' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC12'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC13' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC13'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC14' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC14'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC15' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC15'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC16' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC16'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC1' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC1'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC2' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC2'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC3' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC3'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC4' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC4'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC5' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC5'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC6' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC6'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC7' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC7'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC8' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC8'.
ppc-linux-ld: warning: orphan section `.data..LASANLOC9' from 
`lib/vsprintf.o' being placed in section `.data..LASANLOC9'.
ppc-linux-ld: warning: orphan section `.data..LASAN0' from 
`lib/xarray.o' being placed in section `.data..LASAN0'.
   SORTEX  vmlinux



I see you have also selected CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y

I guess nobody have never tried both this and CONFIG_KASAN together on 
ppc32. I'll give it a try.

Christophe

> 
> Christophe
> 
>>
>>
>>>> Can you send your full .config ?
>>>
>>> Config is attached.
>>>
>>> Thanks,
>>>
>>>> Christophe
>>>>
>>>>>
>>>>> done
>>>>> Setting btext !
>>>>> W=640 H=488 LB=768 addr=0x9c008000
>>>>> copying OF device tree...
>>>>> starting device tree allocs at 01300000
>>>>> alloc_up(00100000, 0013d948)
>>>>>     trying: 0x01300000
>>>>>     trying: 0x01400000
>>>>>    -› 01400000
>>>>>     alloc_bottom : 01500000
>>>>>     alloc_top    : 20000000
>>>>>     alloc_top_hi : 20000000
>>>>>     nmo_top      : 20000000
>>>>>     ram_top      : 20000000
>>>>> Building dt strings...
>>>>> Building dt structure...
>>>>> reserved memory map:
>>>>>     00c40000 - 006c0000
>>>>> Device tree strings 0x01401000 -> 0x00000007
>>>>> Device tree struct 0x01402000 -> 0x00000007
>>>>> Quiescing Open Firmware ...
>>>>> Booting Linux via __start() @ 0x001400000
>>>>> ->dt_headr_start=0x01400000
>>>>>
>>>>> Thanks anyway,
>>>>>
