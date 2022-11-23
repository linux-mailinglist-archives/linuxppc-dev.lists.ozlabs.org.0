Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943B636D43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 23:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHbcM3pFsz3dvF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 09:37:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZY/gsWR1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZY/gsWR1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHbbP6rBjz3010
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 09:37:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBE4761B47;
	Wed, 23 Nov 2022 22:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5433C433B5;
	Wed, 23 Nov 2022 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669243021;
	bh=pFxW3XhSD3d0Xg11g6vFFA+rrYHw+VJrUIpvO4P87Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZY/gsWR1+ftH5DmBc5HB7/AUYXKs0bWvfWJvgxns0MX4s3BWaWwpRfSIcHTKcEYmV
	 B0wnZtvhgasQ8QQHSG2F/yEhwaCYy/3vmu/4vnG8nq4qv5T9iXYwi7F1fpEvszTTcf
	 ggzhMUVag7f+38J1um0MBp9jS9hA1pPCgTK/Py9Hhy8u29ScfdMKm2uZyK+oUqtJd+
	 8rEbhdATPFXXMo7SgV5s6h3zBAoxoas3rl1taC6vt/YMWQMNG65L1l8Nz4+Xdr8qjM
	 ZZs5fdUge3U1dKHzUFe13npiakAyb0XB4nMjOnuJv8TFbIbPmDC24lB5vTHpfUXuW3
	 gWhmggu4Bmpxg==
Date: Wed, 23 Nov 2022 23:36:58 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221123223658.GC1395324@lothringen>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121035140.118651-1-zhouzhouyi@gmail.com>
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
Cc: dave@stgolabs.net, paulmck@kernel.org, fweisbec@gmail.com, josh@joshtriplett.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> offline tick_do_timer_cpu, the operation will fail because in
> function tick_nohz_cpu_down:
> ```
> if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
>       return -EBUSY;
> ```
> Above bug was first discovered in torture tests performed in PPC VM
> of Open Source Lab of Oregon State University, and reproducable in RISC-V
> and X86-64 (with additional kernel commandline cpu0_hotplug).
> 
> In this patch, we avoid offline tick_do_timer_cpu by distribute
> the offlining cpu among remaining cpus.
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

Please rather make a function for this. This is an internal value
that we don't want to expose to modules.

This can be:

     int tick_nohz_full_timekeeper(void)
     {
         if (tick_nohz_full_enabled() && tick_do_timer_cpu >= 0)
             return tick_do_timer_cpu;
         else
	     return nr_cpu_ids;
     }

And then just check if the value is below nr_cpu_ids.

Thanks.
