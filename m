Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B63881430A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 18:10:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481dTT3LVxzDqhn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 04:10:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=mcD/ZnPp; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481dRL3N1MzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 04:08:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 481dR74f1Jz9txwZ;
 Mon, 20 Jan 2020 18:08:19 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mcD/ZnPp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PB6Od9Chvw6v; Mon, 20 Jan 2020 18:08:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 481dR73Lf3z9txwY;
 Mon, 20 Jan 2020 18:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579540099; bh=yzfJ9FjkQyCVlK+cgsOTuMQ4XbfRfoKvMNM6nb5r3UI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mcD/ZnPpMb3Gvs1Fu8ShcsW/tjiI8vxX1spQWPagvARRgwMyLCX57drTZw4IIlWTT
 7Eth0yTjCJCPdeskFUImvSrga71e/3E6dNmtljCIVLukdQbR9DnwBYxaBmMNs9f2yF
 MQDPuMtMbdR8t0a+nujkuIfoduw1FWTj9Hb24lhc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEDC08B7D2;
 Mon, 20 Jan 2020 18:08:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nJxXjRrAsRPz; Mon, 20 Jan 2020 18:08:24 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85F838B7CC;
 Mon, 20 Jan 2020 18:08:23 +0100 (CET)
Subject: Re: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <20200117085851.GS3191@gate.crashing.org>
 <3027b6d2-47a9-a871-7c52-050a5f9c6ab7@c-s.fr>
 <20200120151936.GB3191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4b0e5941-c37e-3c85-3809-45f33ce35657@c-s.fr>
Date: Mon, 20 Jan 2020 18:08:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120151936.GB3191@gate.crashing.org>
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
Cc: nathanl@linux.ibm.com, arnd@arndb.de, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/01/2020 à 16:19, Segher Boessenkool a écrit :
> On Mon, Jan 20, 2020 at 02:56:00PM +0000, Christophe Leroy wrote:
>>> Nice!  Much better.
>>>
>>> It should be tested on more representative hardware, too, but this looks
>>> promising alright :-)
>>
>> mpc832x (e300c2 core) at 333 MHz:
>>
>> Before:
>>
>> gettimeofday:    vdso: 235 nsec/call
>> clock-gettime-realtime:    vdso: 244 nsec/call
>>
>> With the series:
>>
>> gettimeofday:    vdso: 271 nsec/call
>> clock-gettime-realtime:    vdso: 281 nsec/call
> 
> Those are important, and degrade ~15%.  That is acceptable IMO, but do
> you see a way to optimise this (later)?

Not easy I think.

First we have the unavoidable ASM entry function that can't be dropped 
because of the CR[SO] bit the set on error or clear on no error and that 
can't be done in C.

In our ASM VDSO, fixed shifts are used, while in generic C VDSO, shifts 
are generic and read from the VDSO data.

And there is still some funny code generated by GCC (8.1), like:

  620:	7d 29 3c 30 	srw     r9,r9,r7
  624:	21 87 00 20 	subfic  r12,r7,32
  628:	7d 07 3c 31 	srw.    r7,r8,r7
  62c:	7d 08 60 30 	slw     r8,r8,r12
  630:	7d 0b 4b 78 	or      r11,r8,r9
  634:	39 40 00 00 	li      r10,0
  638:	40 82 00 84 	bne     6bc <__c_kernel_clock_gettime+0x114>
  63c:	81 23 00 24 	lwz     r9,36(r3)
  640:	81 05 00 00 	lwz     r8,0(r5)
...
  6bc:	7d 69 5b 78 	mr      r9,r11
  6c0:	7c ea 3b 78 	mr      r10,r7
  6c4:	7d 2b 4b 78 	mr      r11,r9
  6c8:	4b ff ff 74 	b       63c <__c_kernel_clock_gettime+0x94>

This branch to 6bc is totally useless:
- copying r11 into r9 is pointless as r9 is overwritten in 63c
- copying back r9 into r11 is pointless as r11 has not been modified 
inbetween.
- loading r10 with 0 then overwritting r10 with r7 when r7 is not 0 is 
pointless as well, could have directly put the result of srw. in r10.

Christophe
