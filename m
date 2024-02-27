Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4C869A96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:40:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v2SmpFKz;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IhZEy9ao;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkhWn5HYDz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:40:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v2SmpFKz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IhZEy9ao;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkhW55Fdnz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:39:45 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709048381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJMEmPknjHVafP7auP6NstYIZApeLwl7NpSBBPTsJRw=;
	b=v2SmpFKzyLlxe1n8O3ssVGgCw9zIymjESWdlflsdtoIpFV9ck8Gh8f5Z5p76E0Wov9JppI
	pUympLPPwSdDUxSpTfJZ7W94UZ3YgkntkZcy5VnTvCUWuvfFbRCCoxuQaBrBeBzjhuMh0A
	Rw7TvUa8M14b/KRF/9ToCMGjDVMZctCYp+iRh1bz3RsEcHGvsg2XigCu+1QMJGJ5PvfPUr
	sewGURBL9sdJJp9sgM9RUP1QN6zwl+2XAcqYzpn6j1nMn8nAHbM0iciZY0IbJn4z+SbLyQ
	mO557zUUhekJSYxGLyFzf0mNLWWa7aKV3evVDYSH5Dpnaw3H2Zo5o1ZNfYEYLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709048381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJMEmPknjHVafP7auP6NstYIZApeLwl7NpSBBPTsJRw=;
	b=IhZEy9ao54ToXTf1lT6k5ns9ArJc7ZXbJm66qT+o+NH7VygNsznWpxxr8KbIgROKCMTqGb
	NHYGdj3aYBjzzZAA==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
In-Reply-To: <e78357ae-7b00-446c-b010-3bd770892c9e@linux.alibaba.com>
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-4-yaoma@linux.alibaba.com> <87le769s0w.ffs@tglx>
 <e78357ae-7b00-446c-b010-3bd770892c9e@linux.alibaba.com>
Date: Tue, 27 Feb 2024 16:39:41 +0100
Message-ID: <87a5nlapc2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27 2024 at 19:20, Bitao Hu wrote:
> On 2024/2/27 17:26, Thomas Gleixner wrote:
>> 
>> and then let kstat_irqs() and show_interrupts() use it. See?
>
> I have a concern. kstat_irqs() uses for_each_possible_cpu() for
> summation. However, show_interrupts() uses for_each_online_cpu(),
> which means it only outputs interrupt statistics for online cpus.
> If we use for_each_possible_cpu() in show_interrupts() to calculate
> 'any_count', there could be a problem with the following scenario:
> If an interrupt has a count of zero on online cpus but a non-zero
> count on possible cpus, then 'any_count' would not be zero, and the
> statistics for that interrupt would be output, which is not the
> desired behavior for show_interrupts(). Therefore, I think it's not
> good to have kstat_irqs() and show_interrupts() both use the same
> logic. What do you think?

Good point. But you simply can have

unsigned int kstat_irq_desc(struct irq_desc *desc, const struct cpumask *mask)

and hand in the appropriate cpumask, which still shares the code, no?

Thanks,

        tglx
