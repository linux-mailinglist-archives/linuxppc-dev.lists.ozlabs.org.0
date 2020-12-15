Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3E2DB4E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:15:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwTyD4PfXzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 07:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwTwR0y7WzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 07:13:26 +1100 (AEDT)
Received: from [192.168.1.155] ([95.118.67.37]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2m3G-1k6PIA2t8m-0135ji; Tue, 15 Dec 2020 21:12:38 +0100
Subject: Re: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
To: Thomas Gleixner <tglx@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201207143146.30021-1-info@metux.net>
 <877dptt5av.fsf@mpe.ellerman.id.au> <87y2i7298s.fsf@nanos.tec.linutronix.de>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <33001e60-cbfc-f114-55bf-f347f21fee9b@metux.net>
Date: Tue, 15 Dec 2020 21:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87y2i7298s.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vl7DA5DWozggza0AGe8H6e41yurym69HzxKVA3K+3u52FZGda2V
 yDJQNig7DeC45rTFcMS5FadRETtKG/O/7MhMYuYasxHOl5xYRyXNyBPNDM2EaKLdIkOAfNe
 nkds2nvt1C2cP562/3jxOoBsHgbD43RMm7Yjg0u5MyqB6SfQQDamKlkr8nQrXXehVGWyZVz
 /jL5kTSmHjtdLY8YeL29Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Xt7NJGkmuE=:SIDPxFTbqBvPDzbk6vuQpC
 +cIJtbbsJKJJ0G03eKabWNWQYbCGqwdE7LWBPKXoOC+2XXKZ1RhTaCtYxqoiLeTUrpOlVZ0xb
 cGO6ZiI6066M3IgKwb1vWH2sVfVWzQGaF9VxSE4OX7QYer1S32fjNwWtk8H3JXOahGQsYOMoS
 VQxriE3SYMkAQr2RJ/YiqehS9FFJcIPhYcJbDLfk5YEZQZJ0jpadDHf31hFbPH4FMjztIaJBx
 AIHV1kXIwr8EZL+gCE3n3dBbD4PTFzd7v8iqFx4MdvItXgzcXWnL7V+EwB674sBcvmHMlA7/v
 u2T6Aan2zrxPYFPYWfZ9nPWY/Svpkzgd0WEfhwCH6LEqmID1k8PAcDyX+Chx8DtRp3vHI7Whu
 J2NawCRkIItfmOvNEfQzA/KBcyR/lnWEgs/1u+8QaBQGVccaH9hf5buwkyalX
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

On 09.12.20 00:01, Thomas Gleixner wrote:

> There are a few situations why it is invoked or not:
> 
>   1) The original x86 usage is not longer using it because it complains
>      rightfully about a vector being raised which has no interrupt
>      descriptor associated to it. So the original reason for naming it
>      vector is gone long ago. It emits:
> 
>      pr_emerg_ratelimited("%s: %d.%u No irq handler for vector\n",
>                           __func__, smp_processor_id(), vector);
> 
>      Directly from the x86 C entry point without ever invoking that
>      function.  Pretty popular error message due to some AMD BIOS
>      wreckage. :)

Of course, the term "vector" should be replaced by something like
"irqnr" or "virq", but I didn't have name changes within scope - just
wanted to fix the printing of that number, as i've stupled over it while
working on something different and wondered why the number differed from
what I had expected, until I seen that it prints hex instead of decimal.

But if you prefer a more complete cleanup, I'll be happy to do it.

>   3) It's invoked from __handle_domain_irq() when the 'hwirq' which is
>      handed in by the caller does not resolve to a mapped Linux
>      interrupt which is pretty much the same as the x86 situation above
>      in #1, but it prints useless data.
> 
>      It prints 'irq' which is invalid but it does not print the really
>      interesting 'hwirq' which was handed in by the caller and did
>      not resolve.

I wouldn't say the irq-nr isn't interesting. In my particular case it
was quite what I've been looking for. But you're right, hwirq should
also be printed.

>      In this case the Linux irq number is uninteresting as it is known
>      to be invalid and simply is not mapped and therefore does not
>      exist.

In my case it came in from generic_handle_irq(), and in this case this
irq number (IMHO) has been valid, but nobody handled it, so it went to
ack_bad_irq.

Of course, if this function is meant as a fallback to ack some not
otherwise handled IRQ on the hw, the linux irq number indeed isn't quite
helpful (unless we expect that code to do a lookup to the hw irq).

... rethinking this further ... shouldn't we also pass in even more data
(eg. irq_desc, irqchip, ...), so this function can check which hw to
actually talk to ?

>   4) It's invoked from the dummy irq chip which is installed for a
>      couple of truly virtual interrupts where the invocation of
>      dummy_irq_chip::irq_ack() is indicating wreckage.
> 
>      In that case the Linux irq number is the thing which is printed.
> 
> So no. It's not just inconsistent it's in some places outright
> wrong. What we really want is:
> 
> ack_bad_irq(int hwirq, int virq)

is 'int' correct here ?

BTW: I also wonder why the virq is unsigned int, while hwirq (eg. in
struct irq_data) is unsigned long. shouldn't the virtual number space
be at least as big (or even bigger) than the hw one ?

 {
>         if (hwirq >= 0)
>            print_useful_info(hwirq);
>         if (virq > 0)
>            print_useful_info(virq);
>         arch_try_to_ack(hwirq, virq);
> }
>     
> for this to make sense. Just fixing the existing printk() to be less
> wrong is not really an improvement.

Okay, makes sense.

OTOH: since both callers (dummychip.c, handle.c) already dump out before
ack_bad_irq(), do we need to print out anything at all ?

I've also seen that many archs increase a counter (some use long, others
atomic_t) - should we also consolidate this in an arch-independent way
in handle.c (or does kstat_incr_irqs_this_cpu already do this) ?

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
