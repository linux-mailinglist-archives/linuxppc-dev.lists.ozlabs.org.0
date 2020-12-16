Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611A2DC48D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 17:47:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cx1JN3H81zDqTb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 03:47:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cx1Gf5crWzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 03:46:01 +1100 (AEDT)
Received: from [192.168.1.155] ([95.114.81.192]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MuV3i-1jyRGU2hXe-00rXEZ; Wed, 16 Dec 2020 17:42:32 +0100
Subject: Re: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
To: Thomas Gleixner <tglx@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201207143146.30021-1-info@metux.net>
 <877dptt5av.fsf@mpe.ellerman.id.au> <87y2i7298s.fsf@nanos.tec.linutronix.de>
 <33001e60-cbfc-f114-55bf-f347f21fee9b@metux.net>
 <87a6ueu3af.fsf@nanos.tec.linutronix.de>
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <7cee04bd-b962-c6cd-19d7-b1f63926f570@metux.net>
Date: Wed, 16 Dec 2020 17:42:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87a6ueu3af.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9QidD+UOA3aQi22640zZ/omWcJwb9FdXzbOn1+rph3fp70+BAEy
 xiHMss2Z38gUE+IeS5tIoSSjstWL3MM0hiXjHEXqQiN33u9305dgjBtGQGQ9R0jw9jl3BXw
 3haty8Z/ZIT578dbL2gr1uXSSptrO7tgSaDczmwRur8kNQrMTQCDAhfPIvtpvW5xdrNcE6l
 /3ipd/qGBjEmcqF+JVADw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1c3FXG1AarQ=:uENEIXu+5B78KhBw8odEAh
 t2n63aeaR6l+oZZpBcUolFIx68WUSwq80Kjla3XzmpU+7LEqKYqk5DJ8Cpuc3xqMuzS+/hKG8
 ZcUo+KcwsrSBANuPbsel/wjt3MFHRZYJHA4IdMEYalu69edBJuPr7Hje829QYjpHvzdMrxUlH
 nLoCidRT/7wStm53pXjfxwWqsXzWzidAalC3VjRoEkBvoQXdYws86NMtuPYqfJ9eLMI1PdHKl
 ym9AZiKnjiwqeojoHz69Z1XJZyDZO7HRLTJuv2eWfJeJwepHjfGNWpKOcPB/9cKUp4F3s3qTx
 Nc1Boc7wMF6QjHO6bW9fUsIFnMTWT8wm4dEVJURsCTv4kosjTDc9aQ02UfU99Bl51tUn2iHsq
 lademp5fXFsFmUatD5hx0Klk4xdb6UX8KKn/iNWalz41fKV68HlE5Amwo5NVF
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
Cc: linux-s390@vger.kernel.org, hpa@zytor.com, linux-parisc@vger.kernel.org,
 deller@gmx.de, x86@kernel.org, linux-um@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, mingo@redhat.com, paulus@samba.org,
 richard@nod.at, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, jdike@addtoit.com,
 anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.12.20 23:12, Thomas Gleixner wrote:
> On Tue, Dec 15 2020 at 21:12, Enrico Weigelt wrote:
>> On 09.12.20 00:01, Thomas Gleixner wrote:
>>>   3) It's invoked from __handle_domain_irq() when the 'hwirq' which is
>>>      handed in by the caller does not resolve to a mapped Linux
>>>      interrupt which is pretty much the same as the x86 situation above
>>>      in #1, but it prints useless data.
>>>
>>>      It prints 'irq' which is invalid but it does not print the really
>>>      interesting 'hwirq' which was handed in by the caller and did
>>>      not resolve.
>>
>> I wouldn't say the irq-nr isn't interesting. In my particular case it
>> was quite what I've been looking for. But you're right, hwirq should
>> also be printed.
> 
> The number is _not_ interesting in this case. It's useless because the
> function does:

Oh, I've mixed up the cases - I only had the other one, down below.

>     irq = hwirq;
> 
>     if (lookup)
>         irq = find_mapping(hwirq);
> 
>     if (!irq || irq >= nr_irqs)
>        -> BAD

When exactly can that happen ? Only when some hardware sending an IRQ,
but no driver listening to it, or are there other cases ?

By the way: who's supposed to call that function ? Only irqchip's
(and the few soc specific 1st-level irq handlers) ? I'm asking, because
we have lots of gpio drivers, which have their own irq domain, but go
the generic_handle_irq() route. Same for some SOC-specific irqchips.

Should they also call handle_domain_irq() instead ?

> In both cases the only interesting information is that hwirq does not
> resolve to a valid Linux interrupt number and which hwirq number caused
> that.

Don't we also need know which irqchip the hwirq number belongs to ?

> If you look really then you find out that there is exactly _ONE_
> architecture which does anything else than incrementing a counter and/or
> printing stuff: X86, which has a big fat comment explaining why. The
> only way to ack an interrupt on X86 is to issue EOI on the local APIC,
> i.e. it does _not_ need any further information.

Yeah, found it :)

At this point I wonder whether the ack_APIC_irq() call could be done
somewhere further up in the call chain, eg. handle_irq() or
common_interrupt() ?

If that works, we IMHO could drop ack_bad_irq() completely (except for
the counter and printk, which we could consolidate elsewhere anyways)

>> ... rethinking this further ... shouldn't we also pass in even more data
>> (eg. irq_desc, irqchip, ...), so this function can check which hw to
>> actually talk to ?
> 
> There are 3 ways to get there:
> 
>       1) via dummy chip which obviously has no hardware associated

... which also calls print_irq_desc() ..

>       2) via handle_bad_irq() which prints the info already

print_irq_desc() doesn't seem to print the hwirq ... shall we fix this ?

>       3) __handle_domain_irq() which cannot print anything and obviously
>          cannot figure out the hw to talk to because there is no irq
>          descriptor associated.

Okay, what's the conclusion ? Drop printouts in the ack_bad_irq()'s ?

>>>   4) It's invoked from the dummy irq chip which is installed for a
>>>      couple of truly virtual interrupts where the invocation of
>>>      dummy_irq_chip::irq_ack() is indicating wreckage.
>>>
>>>      In that case the Linux irq number is the thing which is printed.
>>>
>>> So no. It's not just inconsistent it's in some places outright
>>> wrong. What we really want is:
>>>
>>> ack_bad_irq(int hwirq, int virq)
>>
>> is 'int' correct here ?
> 
> This was just for illustration.

Okay, thanks. Just discovered already have an irq_hw_number_t, which
doesn't seem to be used everywhere ... shall we fix that ?

>> OTOH: since both callers (dummychip.c, handle.c) already dump out before
>> ack_bad_irq(), do we need to print out anything at all ?
> 
> Not all callers print something, but yes this could do with some general
> cleanup.

I've found three callers, only one (__handle_domain_irq() in irqdesc.c)
doesn't print out anything. I belive, adding a pr_warn() here and drop
all the printouts in ack_bad_irq()'s makes sense.

> The error counter is independent of that, but yes there is room for
> consolidation.

Ok, I've already started hacking a bit here: adding an atomic_t counter
in kernel/irq/handle.c and inline'd accessor functions in
include/asm-generic/irq.h (just feeling that accessors are a bit cleaner
than direct access). Would that be okay ?

By the way: I still wonder whether my case should have ever reached
ack_bad_irq().

The irqdescs had been allocated via devm_irq_alloc_descs(), and the
driver just called generic_handle_irq() with base irq + gpio nr.
So, IMHO it was a valid linux irq number, but no (explicit) handler.

I wonder whether ack'ing those virtual irqs onto hw could be harmful.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
