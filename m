Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA34C10EA49
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 14:01:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RQGs6fXKzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 00:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="uYyRYGLk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RQ8g0mHVzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 23:55:59 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RQ8Q6LnNz9v1HJ;
 Mon,  2 Dec 2019 13:55:50 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=uYyRYGLk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j1lbP863FWaw; Mon,  2 Dec 2019 13:55:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RQ8Q5G9vz9v1H7;
 Mon,  2 Dec 2019 13:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575291350; bh=0PiER+iG4dOV5r1TXBRVB852IzwzoLmssACM3pBfACM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uYyRYGLkiczFw0RaGmyLshMwx1P7HPT7g3g4PqeF6S+EIO1OaJE+o8E2Q6jN4wNVa
 CHdz6+PF/KjYn3b3vJ7pa2Qq/m2YeblD/s4NFB1NgKnDT5TEG4EMyQFXzkx3EMdBr0
 0cpnzsGPuGKjxO7gRQyzBPmDsyhw/18S0VYW2Gvw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B2D278B7AD;
 Mon,  2 Dec 2019 13:55:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JCEDdLM1Ls41; Mon,  2 Dec 2019 13:55:55 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B0358B770;
 Mon,  2 Dec 2019 13:55:55 +0100 (CET)
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
To: Arnd Bergmann <arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
 <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
 <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
 <20191121172529.Horde.0uDMS4xQ-xexjp4a2mIoXQ5@messagerie.si.c-s.fr>
 <CAK8P3a1UmAYTx=Vv06xP=O-oYD8_HzNqMG0-p7GPP2xgzs+75w@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <85ba697d-1a09-f1b0-b6b6-a511a2920f93@c-s.fr>
Date: Mon, 2 Dec 2019 13:55:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1UmAYTx=Vv06xP=O-oYD8_HzNqMG0-p7GPP2xgzs+75w@mail.gmail.com>
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2019 à 12:03, Arnd Bergmann a écrit :
> On Thu, Nov 21, 2019 at 5:25 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>> Arnd Bergmann <arnd@arndb.de> a écrit :
>>> On Wed, Nov 20, 2019 at 11:43 PM Ben Hutchings
>>> <ben.hutchings@codethink.co.uk> wrote:
>>>>
>>>> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
>>>>> @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>>>>>        bl      __get_datapage@local
>>>>>        mr      r9, r3                  /* datapage ptr in r9 */
>>>>>
>>>>> -     lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
>>>>> +     lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
>>>>
>>>> "LOWPART" should be "LOPART".
>>>>
>>>
>>> Thanks, fixed both instances in a patch on top now. I considered folding
>>> it into the original patch, but as it's close to the merge window I'd
>>> rather not rebase it, and this way I also give you credit for
>>> finding the bug.
>>
>> Take care, might conflict with
>> https://github.com/linuxppc/linux/commit/5e381d727fe8834ca5a126f510194a7a4ac6dd3a
> 
> Sorry for my late reply. I see this commit and no other variant of it has
> made it into linux-next by now, so I assume this is not getting sent for v5.5
> and it's not stopping me from sending my own pull request.
> 
> Please let me know if I missed something and this will cause problems.
> 
> On a related note: are you still working on the generic lib/vdso support for
> powerpc? Without that, future libc implementations that use 64-bit time_t
> will have to use the slow clock_gettime64 syscall instead of the vdso,
> which has a significant performance impact.

I have left this generic lib/vdso subject aside for the moment, because 
performance is disappointing and its architecture doesn't real fit with 
powerpc ABI.

 From a performance point of view, it is manipulating 64 bits vars where 
is could use 32 bits vars. Of course I understand that y2038 will anyway 
force the use of 64 bits for seconds, but at the time being powerpc32 
VDSO is using 32 bits vars for both secs and ns, it make the difference. 
Also, the generic VDSO is playing too much with data on stacks and 
associated memory read/write/copies, which kills performance on RISC 
processors like powerpc. Inlining do_hres() for instance significantly 
improves that as it allow handling the 'struct __kernel_timespec ts' on 
registers instead of using stack.

Regarding powerpc ABI, the issue is that errors shall be reported by 
setting the SO bit in CR register, and this cannot be done in C.
This means:
- The VDSO entry point must be in ASM and the generic VDSO C function 
must be called from there, it cannot be the VDSO entry point.
- The VDSO fallback (ie the system call) cannot be done from the generic 
VDSO C function, it must be called from the ASM as well.

Last point/question, what's the point in using 64 bits for nanoseconds 
on 32 bits arches ?

Christophe
