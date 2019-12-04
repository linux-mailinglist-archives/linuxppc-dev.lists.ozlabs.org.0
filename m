Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9511221B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 05:34:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SQxD1VgBzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 15:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="iH/GkB/i"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SQvL0Z5RzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 15:32:59 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47SQvB1X8Wz9v3nv;
 Wed,  4 Dec 2019 05:32:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iH/GkB/i; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rjy7c9LzwKGl; Wed,  4 Dec 2019 05:32:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47SQvB0NRVz9v3nt;
 Wed,  4 Dec 2019 05:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575433974; bh=JpFN3Nh7EoLxvzsnF7qnjZOmLclHkS0vKsPmhr9E1rY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iH/GkB/irOi2Glg4L74cAldoyoVItS8ctviRTvxAZRFX+JtQxGP2s8VqMePMeuWkh
 yLOXAen36+IZLAyTa0ypzL/6w1cGK+w5tZBtoyIvVMQv4jf2Bfu4bStE5R4rz3FTet
 Vg9585kYP6cFkfhf/qdplxHaO7voIqLyJruy1YDY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAF1A8B838;
 Wed,  4 Dec 2019 05:32:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mxoDTfKPwG7V; Wed,  4 Dec 2019 05:32:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D6298B815;
 Wed,  4 Dec 2019 05:32:54 +0100 (CET)
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <f12fb9a6cc52d83ee9ddf15a36ee12ac77e6379f.1570684298.git.christophe.leroy@c-s.fr>
 <5ca6639b7c1c21ee4b4138b7cfb31d6245c4195c.1570684298.git.christophe.leroy@c-s.fr>
 <877e3tbvsa.fsf@mpe.ellerman.id.au>
 <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
 <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
 <20191129184658.GR9491@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ebc67964-e5a9-acd0-0011-61ba23692f7e@c-s.fr>
Date: Wed, 4 Dec 2019 05:32:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129184658.GR9491@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 29/11/2019 à 19:46, Segher Boessenkool a écrit :
> Hi!
> 
> On Wed, Nov 27, 2019 at 04:15:15PM +0100, Christophe Leroy wrote:
>> Le 27/11/2019 à 15:59, Segher Boessenkool a écrit :
>>> On Wed, Nov 27, 2019 at 02:50:30PM +0100, Christophe Leroy wrote:
>>>> So what do we do ? We just drop the "r2" clobber ?
>>>
>>> You have to make sure your asm code works for all ABIs.  This is quite
>>> involved if you do a call to an external function.  The compiler does
>>> *not* see this call, so you will have to make sure that all that the
>>> compiler and linker do will work, or prevent some of those things (say,
>>> inlining of the function containing the call).
>>
>> But the whole purpose of the patch is to inline the call to __do_irq()
>> in order to avoid the trampoline function.
> 
> Yes, so you call __do_irq.  You have to make sure that what you tell the
> compiler -- and what you *don't tell the compiler -- works with what the
> ABIs require, and what the called function expects and provides.
> 
>>> That does not fix everything.  The called function requires a specific
>>> value in r2 on entry.
>>
>> Euh ... but there is nothing like that when using existing
>> call_do_irq().
> 
>> How does GCC know that call_do_irq() has same TOC as __do_irq() ?
> 
> The existing call_do_irq isn't C code.  It doesn't do anything with r2,
> as far as I can see; __do_irq just gets whatever the caller of call_do_irq
> has.
> 
> So I guess all the callers of call_do_irq have the correct r2 value always
> already?  In that case everything Just Works.

Indeed, there is only one caller for call_do_irq() which is do_IRQ().
And do_IRQ() is also calling __do_irq() directly (when the stack pointer 
is already set to IRQ stack). do_IRQ() and __do_irq() are both in 
arch/powerpc/kernel/irq.c

As far as I can see when replacing the call to call_do_irq() by a call 
to __do_irq(), the compiler doesn't do anything special with r2, and 
doesn't add any nop after the bl either, whereas for all calls outside 
irq.c, there is a nop added. So I guess that's ok ?

Now that call_do_irq() is inlined, we can even define __do_irq() as static.

And that's the same for do_softirq_own_stack(), it is only called from 
do_softirq() which is defined in the same file as __do_softirq() 
(kernel/softirq.c)

Christophe
