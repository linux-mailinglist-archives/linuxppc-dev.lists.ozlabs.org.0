Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A329D267
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:20:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1hP6kWxzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=deny=ed=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=loooxR5X; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM1Cf74xNzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:59:26 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net
 [50.39.104.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F04F624827;
 Wed, 28 Oct 2020 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603918763;
 bh=uhOhRHxQVfGw7MyAyAJTdGF3H9kCy/1BltY5AjTtSN0=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=loooxR5XyCI1oAjmIJHBwJpYv3LJvTxBzAr3RNF9wwefMD6/PYs7CotHJqnLyHWfP
 iJWhdiBHD8kIx56QNV6L8kXzavPKJe0TMhRs3XZhpvdyH+xqG7bUw64lnu5IOM7ejT
 MMYu3qltUG0hDSkGZwhklk03zwVcULaE3bL3uyxI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id A1C2935229CE; Wed, 28 Oct 2020 13:59:22 -0700 (PDT)
Date: Wed, 28 Oct 2020 13:59:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Qian Cai <cai@redhat.com>
Subject: Re: [PATCH] powerpc/smp: Move rcu_cpu_starting() earlier
Message-ID: <20201028205922.GF3249@paulmck-ThinkPad-P72>
References: <20201028182334.13466-1-cai@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028182334.13466-1-cai@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 02:23:34PM -0400, Qian Cai wrote:
> The call to rcu_cpu_starting() in start_secondary() is not early enough
> in the CPU-hotplug onlining process, which results in lockdep splats as
> follows:
> 
>  WARNING: suspicious RCU usage
>  -----------------------------
>  kernel/locking/lockdep.c:3497 RCU-list traversed in non-reader section!!
> 
>  other info that might help us debug this:
> 
>  RCU used illegally from offline CPU!
>  rcu_scheduler_active = 1, debug_locks = 1
>  no locks held by swapper/1/0.
> 
>  Call Trace:
>  dump_stack+0xec/0x144 (unreliable)
>  lockdep_rcu_suspicious+0x128/0x14c
>  __lock_acquire+0x1060/0x1c60
>  lock_acquire+0x140/0x5f0
>  _raw_spin_lock_irqsave+0x64/0xb0
>  clockevents_register_device+0x74/0x270
>  register_decrementer_clockevent+0x94/0x110
>  start_secondary+0x134/0x800
>  start_secondary_prolog+0x10/0x14
> 
> This is avoided by moving the call to rcu_cpu_starting up near the
> beginning of the start_secondary() function. Note that the
> raw_smp_processor_id() is required in order to avoid calling into
> lockdep before RCU has declared the CPU to be watched for readers.
> 
> Link: https://lore.kernel.org/lkml/160223032121.7002.1269740091547117869.tip-bot2@tip-bot2/
> Signed-off-by: Qian Cai <cai@redhat.com>

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  arch/powerpc/kernel/smp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 3c6b9822f978..8c2857cbd960 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1393,13 +1393,14 @@ static void add_cpu_to_masks(int cpu)
>  /* Activate a secondary processor. */
>  void start_secondary(void *unused)
>  {
> -	unsigned int cpu = smp_processor_id();
> +	unsigned int cpu = raw_smp_processor_id();
>  
>  	mmgrab(&init_mm);
>  	current->active_mm = &init_mm;
>  
>  	smp_store_cpu_info(cpu);
>  	set_dec(tb_ticks_per_jiffy);
> +	rcu_cpu_starting(cpu);
>  	preempt_disable();
>  	cpu_callin_map[cpu] = 1;
>  
> -- 
> 2.28.0
> 
