Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE81508ACC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 16:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk32P3JxHz3bdg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 00:29:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pUsJH+kO;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6ShhutQF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pUsJH+kO; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6ShhutQF; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk31k41Lvz2yNF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 00:28:26 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7957F210EB;
 Wed, 20 Apr 2022 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650464902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OrVkb7HfzeMWqMTSQRuccpxaC6+0XiaP2m2iL/FpSc=;
 b=pUsJH+kOal23/dQyD1A6AAIJ1Ffz6FH7J7oA68vOQZ4saiPzSzq7Eps3FYpYkw+GVwRz0V
 8U6MLJKExfDkgPdTECybG44dm/rbxUC259xvHhanIHUgHoH+yu3SmLcgo36TQB9YYymu3P
 MyjZrzJljmB9RS29QsS6tRJIcIDXwk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650464902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OrVkb7HfzeMWqMTSQRuccpxaC6+0XiaP2m2iL/FpSc=;
 b=6ShhutQFXoD09vNKxr+rvxvzlt2eKlApV4eIngCk2PA0VZWf+nqi5CX1BfVVj2TmbkxsgP
 EwVIDAwkJi3CDADg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5CB282C14B;
 Wed, 20 Apr 2022 14:28:22 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:28:21 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
Message-ID: <20220420142821.GR163591@kunlun.suse.cz>
References: <20220420141657.771442-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420141657.771442-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: miguel.ojeda.sandonis@gmail.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Apr 21, 2022 at 12:16:57AM +1000, Michael Ellerman wrote:
> This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrupt:
> Don't enable MSR[EE] in irq handlers unless perf is in use").
> 
> Prior to that commit, we always set the decrementer in
> timer_interrupt(), to clear the timer interrupt. Otherwise we could end
> up continuously taking timer interrupts.
> 
> When high res timers are enabled there is no problem seen with leaving
> the decrementer untouched in timer_interrupt(), because it will be
> programmed via hrtimer_interrupt() -> tick_program_event() ->
> clockevents_program_event() -> decrementer_set_next_event().
> 
> However with CONFIG_HIGH_RES_TIMERS=n or booting with highres=off, we

How difficult is it to detect this condition?

Maybe detecting this could be just added?

Thanks

Michal

> see a stall/lockup, because tick_nohz_handler() does not cause a
> reprogram of the decrementer, leading to endless timer interrupts.
> Example trace:
> 
>   [    1.898617][    T7] Freeing initrd memory: 2624K^M
>   [   22.680919][    C1] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:^M
>   [   22.682281][    C1] rcu:     0-....: (25 ticks this GP) idle=073/0/0x1 softirq=10/16 fqs=1050 ^M
>   [   22.682851][    C1]  (detected by 1, t=2102 jiffies, g=-1179, q=476)^M
>   [   22.683649][    C1] Sending NMI from CPU 1 to CPUs 0:^M
>   [   22.685252][    C0] NMI backtrace for cpu 0^M
>   [   22.685649][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc2-00185-g0faf20a1ad16 #145^M
>   [   22.686393][    C0] NIP:  c000000000016d64 LR: c000000000f6cca4 CTR: c00000000019c6e0^M
>   [   22.686774][    C0] REGS: c000000002833590 TRAP: 0500   Not tainted  (5.16.0-rc2-00185-g0faf20a1ad16)^M
>   [   22.687222][    C0] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24000222  XER: 00000000^M
>   [   22.688297][    C0] CFAR: c00000000000c854 IRQMASK: 0 ^M
>   ...
>   [   22.692637][    C0] NIP [c000000000016d64] arch_local_irq_restore+0x174/0x250^M
>   [   22.694443][    C0] LR [c000000000f6cca4] __do_softirq+0xe4/0x3dc^M
>   [   22.695762][    C0] Call Trace:^M
>   [   22.696050][    C0] [c000000002833830] [c000000000f6cc80] __do_softirq+0xc0/0x3dc (unreliable)^M
>   [   22.697377][    C0] [c000000002833920] [c000000000151508] __irq_exit_rcu+0xd8/0x130^M
>   [   22.698739][    C0] [c000000002833950] [c000000000151730] irq_exit+0x20/0x40^M
>   [   22.699938][    C0] [c000000002833970] [c000000000027f40] timer_interrupt+0x270/0x460^M
>   [   22.701119][    C0] [c0000000028339d0] [c0000000000099a8] decrementer_common_virt+0x208/0x210^M
> 
> Possibly this should be fixed in the lowres timing code, but that would
> be a generic change and could take some time and may not backport
> easily, so for now make the programming of the decrementer unconditional
> again in timer_interrupt() to avoid the stall/lockup.
> 
> Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless perf is in use")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/time.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index f5cbfe5efd25..f80cce0e3899 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -615,23 +615,22 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>  		return;
>  	}
>  
> -	/* Conditionally hard-enable interrupts. */
> -	if (should_hard_irq_enable()) {
> -		/*
> -		 * Ensure a positive value is written to the decrementer, or
> -		 * else some CPUs will continue to take decrementer exceptions.
> -		 * When the PPC_WATCHDOG (decrementer based) is configured,
> -		 * keep this at most 31 bits, which is about 4 seconds on most
> -		 * systems, which gives the watchdog a chance of catching timer
> -		 * interrupt hard lockups.
> -		 */
> -		if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
> -			set_dec(0x7fffffff);
> -		else
> -			set_dec(decrementer_max);
> +	/*
> +	 * Ensure a positive value is written to the decrementer, or
> +	 * else some CPUs will continue to take decrementer exceptions.
> +	 * When the PPC_WATCHDOG (decrementer based) is configured,
> +	 * keep this at most 31 bits, which is about 4 seconds on most
> +	 * systems, which gives the watchdog a chance of catching timer
> +	 * interrupt hard lockups.
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
> +		set_dec(0x7fffffff);
> +	else
> +		set_dec(decrementer_max);
>  
> +	/* Conditionally hard-enable interrupts. */
> +	if (should_hard_irq_enable())
>  		do_hard_irq_enable();
> -	}
>  
>  #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
>  	if (atomic_read(&ppc_n_lost_interrupts) != 0)
> -- 
> 2.34.1
> 
