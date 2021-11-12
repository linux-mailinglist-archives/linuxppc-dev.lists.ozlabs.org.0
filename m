Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29344E1C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 07:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hr7Tf69tVz302G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 17:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=oFYaDxOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=oFYaDxOJ; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hr7Sx144Rz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 17:09:02 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id v23so5890878pjr.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 22:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5OSg2nyxJQJhzN2gFuKfHBnH3HqkRk28fxZ0qksOH+o=;
 b=oFYaDxOJJPP3bn4wxTovlTzvtzRR6U6lrc7s9PR2Howlc+4uDs+9/gLhkoGgsY7L8b
 8qeEV2HGBBVLC69TyLLQ92JI/qzPLOVsUC5OHn6jaM9nolw63fUOxwYHvqNMlbgDK2/G
 2dxK3d/CgRyUWqvYevSN6LnLUbGY7rHkB1wfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5OSg2nyxJQJhzN2gFuKfHBnH3HqkRk28fxZ0qksOH+o=;
 b=HAUpvlpXd5RzVlJXBeR+O8S/BDKm2UxWafXpQReHxiJB58b2VZ3RXPZ8Vx1AGz1Has
 0S9nVZShVyP3O0oov+qQjLslEqsJrveDp8ID+ajDxvN9UoxQ6kUoDBw+4lOrfow2GjH7
 1LmWasCc+3RYIAZThPmoMVWuE6In5CntXR1vGqKvCRB6BbYUVF0jeVz2MEhohRTBzdaE
 ByFcAD2jnb+aiYSQIV8SapZ+prYGtXhvoexzqdJCRnuS9HYdWJbr+eEFXAkhcHWs7Lwg
 rRAKFUoTU0xGVfZpgDExKiuigokpX1t0ZqLCNKXofGGfCUO8QCfwKkxoUygmUNjU5qQk
 Rg4g==
X-Gm-Message-State: AOAM533VXYjhaUHOTW62XfbSZScMJJ4TRdUQ0OE+Jdp3FXZE+XSCFpll
 e/ApPOKCbO8jHHrKUnvpTzVqZg==
X-Google-Smtp-Source: ABdhPJwCttRDC8GuCuXWczifvlAY1MSnqIWSkeKLBXRERMg5tVpjjMbsn5eA0HtBhFsdBlhuWlvdkw==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr28082471pjb.89.1636697336110; 
 Thu, 11 Nov 2021 22:08:56 -0800 (PST)
Received: from localhost ([2001:4479:e000:e400:7477:6312:96f6:a639])
 by smtp.gmail.com with ESMTPSA id i6sm4852210pfu.173.2021.11.11.22.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 22:08:55 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1] powerpc/watchdog: help remote CPUs to flush NMI printk
 output
In-Reply-To: <20211110030416.2085103-1-npiggin@gmail.com>
References: <20211110030416.2085103-1-npiggin@gmail.com>
Date: Fri, 12 Nov 2021 17:08:52 +1100
Message-ID: <87o86p3nyj.fsf@linkitivity.dja.id.au>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> The printk layer at the moment does not seem to have a good way to force
> flush printk messages that are created in NMI context, except in the
> panic path.
>
> NMI-context printk messages normally get to the console with irq_work,
> but that won't help if the CPU is stuck with irqs disabled, as can be
> the case for hard lockup watchdog messages.
>
> The watchdog currently flushes the printk buffers after detecting a
> lockup on remote CPUs, but they may not have processed their NMI IPI
> yet by that stage, or they may have self-detected a lockup in which
> case they won't go via this NMI IPI path.
>
> Improve the situation by having NMI-context mark a flag if it called
> printk, and have watchdog timer interrupts check if that flag was set
> and try to flush if it was. Latency is not a big problem because we
> were already stuck for a while, just need to try to make sure the
> messages eventually make it out.

Initially I was surprised that this doesn't affect the printk code
itself, just the powerpc code...

>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This patch is actually based on top of this one which is planned to go
> upstream in rc1/2. https://marc.info/?l=linux-kernel&m=163626070312052&w=2
>
> Prior to commit 93d102f094be that is fixed by the above, we had a printk
> flush function with a different name but basically does the same job, so
> this patch can be backported, just needs some care. I'm posting it for
> review now for feedback so it's ready to go when the printk patch is
> upstream.
>
> Thanks,
> Nick
>
>  arch/powerpc/kernel/watchdog.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index b6533539386b..a7b6b0691203 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -86,6 +86,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
>  /* SMP checker bits */
>  static unsigned long __wd_smp_lock;
>  static unsigned long __wd_reporting;
> +static unsigned long __wd_nmi_output;
>  static cpumask_t wd_smp_cpus_pending;
>  static cpumask_t wd_smp_cpus_stuck;
>  static u64 wd_smp_last_reset_tb;
> @@ -154,6 +155,18 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>  	else
>  		dump_stack();
>  
> +	/*
> +	 * We printk()ed from NMI context, the contents may not get flushed
> +	 * if we return to a context with interrupts disabled because
> +	 * printk uses irq_work to schedule flushes of NMI output.
> +	 * __wd_nmi_output says there has been output from NMI context, so
> +	 * other CPUs are recruited to help flush it.
> +	 *
> +	 * xchg is not needed here (it could be a simple atomic store), but
> +	 * it gives the memory ordering and atomicity required.
> +	 */
> +	xchg(&__wd_nmi_output, 1);
> +
>  	/* Do not panic from here because that can recurse into NMI IPI layer */
>  }

I think, looking at this and the other site where __wd_nmi_output is
set, that this works because you set the flag only when you are done
printing from the non-panic lockup context on this CPU. I was initially
worried that you set this flag part way through printing, and then it
might get cleared by another CPU while you're still trying to print.
However, in this function it's right at the end - there's nothing else
left to do, and ...

>  DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
> @@ -386,6 +401,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>  		print_irqtrace_events(current);
>  		show_regs(regs);
>  
> +		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
> +
>  		if (sysctl_hardlockup_all_cpu_backtrace)
>  			trigger_allbutself_cpu_backtrace();

in this one, the only things that can happen afterwards are
 - a panic, which does its own flushing, and

- trigger_allbutself_cpu_backtrace(), which seems to just send IPIs, not
 do any printing of its own.

All of which is fine, but I wonder if we need a more descriptive
variable name or if the comment needs to specify that the flag should
only be set at certain times.

Kind regards,
Daniel
