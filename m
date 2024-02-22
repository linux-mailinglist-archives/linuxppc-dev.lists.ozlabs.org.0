Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F12D85F998
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 14:23:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xJ/aRi9G;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vZiRjwR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgYkc3742z2yN3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 00:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xJ/aRi9G;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vZiRjwR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgYjs3w9vz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 00:23:13 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708608179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vf5dvD6c9m5aF5XZpNNQqDW+xIF8f6dZ9wpf3QuuKjg=;
	b=xJ/aRi9Gob5dP6fvvpiv3zn7PZE9HFQr94NPdSMrY4AzE6pDg8n0L+2vR0M28Mo6inozlm
	XtuNX5M3axqYfryju9DgSEnvEXVE8HbWSCW/X4tdKvRzb6QEYoP8uqntJOm2OYc4HfJHtu
	xjt+aZhGw9XUSr9MHEphDXnvi+KLMBg7e+0iJUrQYVR2aOcGTuzr2WEcsU/7L8er0u1dzu
	/sHlTd81mVhPurNKGTm+yhiGi9F6qwX0XoJWzrrIsFRuAMb9Ij67/wYRJFJn10aOGH+kNc
	bybA7AJsephj7eHNyHWkHzGKRePVN8g7nRDE99IYCUJACRsns9er6rQ62nK7Bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708608179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vf5dvD6c9m5aF5XZpNNQqDW+xIF8f6dZ9wpf3QuuKjg=;
	b=vZiRjwR+O+KEUdSoAq9a5bC4DugVLuX4J9+mRlpoGBM0/Mb5+vfuYr4/7HNl5mbun2GsY7
	N0SXEJdk6CjzaIDw==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 akpm@linux-foundation.org, liusong@linux.alibaba.com, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv9 2/3] irq: use a struct for the kstat_irqs in the
 interrupt descriptor
In-Reply-To: <20240222093420.13956-3-yaoma@linux.alibaba.com>
References: <20240222093420.13956-1-yaoma@linux.alibaba.com>
 <20240222093420.13956-3-yaoma@linux.alibaba.com>
Date: Thu, 22 Feb 2024 14:22:59 +0100
Message-ID: <87jzmwfxak.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22 2024 at 17:34, Bitao Hu wrote:

First of all the subsystem prefix is 'genirq:'. 'git log kernel/irq/'
gives you a pretty good hint. It's documented....

Secondly the subject line does not match what this patch is about. It's
not about using a struct, it's about providing a snapshot mechanism, no?

> The current implementation uses an int for the kstat_irqs in the
> interrupt descriptor.
>
> However, we need to know the number of interrupts which happened
> since softlockup detection took a snapshot in order to analyze
> the problem caused by an interrupt storm.
>
> Replacing an int with a struct and providing sensible interfaces
> for the watchdog code can keep it self contained to the interrupt
> core code.

So something like this makes a useful change log for this:

 Subject: genirq: Provide a snapshot mechanism for interrupt statistics

 The soft lockup detector lacks a mechanism to identify interrupt storms
 as root cause of a lockup. To enable this the detector needs a
 mechanism to snapshot the interrupt count statistics on a CPU when the
 detector observes a potential lockup scenario and compare that against
 the interrupt count when it warns about the lockup later on. The number
 of interrupts in that period give a hint whether the lockup might be
 caused by an interrupt storm.

 Instead of having extra storage in the lockup detector and accessing
 the internals of the interrupt descriptor directly, convert the per CPU
 irq_desc::kstat_irq member to a data structure which contains the
 counter plus a snapshot member and provide interfaces to take a
 snapshot of all interrupts on the current CPU and to retrieve the delta
 of a specific interrupt later on.

Hmm?

> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>

Interesting. You fully authored the patch?

That's not how it works. You cannot take work from others and claim that
it is yours. The minimal courtesy is to add a 'Originally-by:' tag.

> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
> index 623b8136e9af..3ad40cf30c66 100644
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -488,18 +488,15 @@ int show_interrupts(struct seq_file *p, void *v)
>  	if (!desc || irq_settings_is_hidden(desc))
>  		goto outsparse;
>  
> -	if (desc->kstat_irqs) {
> -		for_each_online_cpu(j)
> -			any_count |= data_race(*per_cpu_ptr(desc->kstat_irqs, j));
> -	}
> +	if (desc->kstat_irqs)
> +		any_count = data_race(desc->tot_count);

This is an unrelated change and needs to be split out into a separate
patch with a proper changelog which explains why this is equivalent.
  
Thanks,

        tglx
