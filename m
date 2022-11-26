Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5E639757
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 18:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKJ5y6Tjmz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 04:05:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a1vG6WIH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dam0KkoH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a1vG6WIH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dam0KkoH;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKJ534Tbcz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:05:11 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669482305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5Ts30MespxUKzsUT1l7gvsIpD/wCNbmSDwi0rq7pWo=;
	b=a1vG6WIHLX8A8l4bbess8p3ebtC0MNf7n88bWD/3PqTxJ1uhpyZ9s4hHJK5DzlNe5lhmJq
	DaD7vanZVw80QrUdkx4pDbIeUFASYcJ0R8qUmJKJKu5LlvELuECNSOvYLnguyeU/rNhBr9
	jBdZbt1LJfYwVinnQYZHUTrz9PU0VAWM7s21Ns7DrDdaYEr14ZjT3l+3b8CsXbWhoJOxeF
	3fDxV9pGenyolZ3GybsEdHv4BUst2bFjEGi5oGzmFOgveySWzE3JrjCSOORfUHqxnkBrc0
	LDumya6APS4Pev3plwpVgtQ3GfSLVFWVVa1d8+r+nE3Wp/I+lxxKTgnQxz4nJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669482305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5Ts30MespxUKzsUT1l7gvsIpD/wCNbmSDwi0rq7pWo=;
	b=dam0KkoHF7cMdxbvjVFLp64t7BNxpbeugIF7gW3X6Ip03wY3HHGZ0SDANtDVhfQCIenvje
	LRzxWKBGTevPKMCw==
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, fweisbec@gmail.com,
 mingo@kernel.org, dave@stgolabs.net, paulmck@kernel.org,
 josh@joshtriplett.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
In-Reply-To: <20221121035140.118651-1-zhouzhouyi@gmail.com>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
Date: Sat, 26 Nov 2022 18:05:05 +0100
Message-ID: <87y1rxwsse.ffs@tglx>
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21 2022 at 11:51, Zhouyi Zhou wrote:
> During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> offline tick_do_timer_cpu, the operation will fail because in
> function tick_nohz_cpu_down:
> ```
> if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
>       return -EBUSY;
> ```
> Above bug was first discovered in torture tests performed in PPC VM

How is this a bug?

> of Open Source Lab of Oregon State University, and reproducable in RISC-V
> and X86-64 (with additional kernel commandline cpu0_hotplug).
>
> In this patch, we avoid offline tick_do_timer_cpu by distribute
> the offlining cpu among remaining cpus.

Please read Documentation/process. Search for 'this patch'...

>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
>  include/linux/tick.h        |  1 +
>  kernel/time/tick-common.c   |  1 +
>  kernel/time/tick-internal.h |  1 -
>  kernel/torture.c            | 10 ++++++++++
>  4 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index bfd571f18cfd..23cc0b205853 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -14,6 +14,7 @@
>  #include <linux/rcupdate.h>
>  
>  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> +extern int tick_do_timer_cpu __read_mostly;
>  extern void __init tick_init(void);
>  /* Should be core only, but ARM BL switcher requires it */
>  extern void tick_suspend_local(void);
> diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> index 46789356f856..87b9b9afa320 100644
> --- a/kernel/time/tick-common.c
> +++ b/kernel/time/tick-common.c
> @@ -48,6 +48,7 @@ ktime_t tick_next_period;
>   *    procedure also covers cpu hotplug.
>   */
>  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);

No. We are not exporting this just to make a bogus test case happy.

Fix the torture code to handle -EBUSY correctly.

Thanks,

        tglx
