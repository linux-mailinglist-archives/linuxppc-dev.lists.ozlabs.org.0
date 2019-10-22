Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D280E003C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 11:03:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y6xd14jYzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 20:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aFiBDzx8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y6vN4wFBzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 20:01:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46y6vG0r0jz9v0Rt;
 Tue, 22 Oct 2019 11:01:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aFiBDzx8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id R_xcJFO0NgjM; Tue, 22 Oct 2019 11:01:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46y6vF6hhSz9v0Rs;
 Tue, 22 Oct 2019 11:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571734905; bh=nHY+vb8GjkX/ryDDQxMD9wvS8Jypk/lWmaBjduwAW2g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aFiBDzx8TYEsUwlqX8Mz/Bi9WApZqoufpPa5cIYrO9nsqAgJ/tKjk+Ew2Ju35NaM3
 Rt1OQt0zuWRCn7LaqdRdYm2MGd3m6uvdy/QkGWHSYghSVBcjdNGUapbQv8SQ8y8/K4
 Zf1wVTqAC+1Vio2vT/Xd24fgvR99CeXYE3lbbfhY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE5A48B91D;
 Tue, 22 Oct 2019 11:01:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jl5Y6p6W0Ic7; Tue, 22 Oct 2019 11:01:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F4CD8B919;
 Tue, 22 Oct 2019 11:01:46 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
To: Thomas Gleixner <tglx@linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
Date: Tue, 22 Oct 2019 11:01:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/10/2019 à 23:29, Thomas Gleixner a écrit :
> On Mon, 21 Oct 2019, Christophe Leroy wrote:
> 
>> This is a tentative to switch powerpc/32 vdso to generic C implementation.
>> It will likely not work on 64 bits or even build properly at the moment.
>>
>> powerpc is a bit special for VDSO as well as system calls in the
>> way that it requires setting CR SO bit which cannot be done in C.
>> Therefore, entry/exit and fallback needs to be performed in ASM.
>>
>> To allow that, C fallbacks just return -1 and the ASM entry point
>> performs the system call when the C function returns -1.
>>
>> The performance is rather disappoiting. That's most likely all
>> calculation in the C implementation are based on 64 bits math and
>> converted to 32 bits at the very end. I guess C implementation should
>> use 32 bits math like the assembly VDSO does as of today.
> 
>> gettimeofday:    vdso: 750 nsec/call
>>
>> gettimeofday:    vdso: 1533 nsec/call

Small improvement (3%) with the proposed change:

gettimeofday:    vdso: 1485 nsec/call

Though still some way to go.

Christophe

> 
> The only real 64bit math which can matter is the 64bit * 32bit multiply,
> i.e.
> 
> static __always_inline
> u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
> {
>          return ((cycles - last) & mask) * mult;
> }
> 
> Everything else is trivial add/sub/shift, which should be roughly the same
> in ASM.
> 
> Can you try to replace that with:
> 
> static __always_inline
> u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
> {
>          u64 ret, delta = ((cycles - last) & mask);
>          u32 dh, dl;
> 
>          dl = delta;
>          dh = delta >> 32;
> 
>          res = mul_u32_u32(al, mul);
>          if (ah)
>                  res += mul_u32_u32(ah, mul) << 32;
> 
>          return res;
> }
> 
> That's pretty much what __do_get_tspec does in ASM.
> 
> Thanks,
> 
> 	tglx
> 
