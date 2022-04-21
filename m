Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC45094EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 04:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkLVL0mk8z3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 12:05:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o3LT8+mQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o3LT8+mQ; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkLTj1ZhFz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 12:05:11 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id r83so3414394pgr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 19:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IX8XN8KM9dnzGFmxEkBIyOJ3RPt5XbxbwKjcGpc4uTQ=;
 b=o3LT8+mQ10agDAYAfEq6YykbH/JrRTnYXj1lU/LgLgtSMLaZawhwAg7E/Zlwkl37Zi
 v0iqHxi+eU+SAA3zwggi+DY6qf4TidqVpCE/wo4BqoZYxVL4wYE3zN0AZwf49jh6/3/U
 Sq98p3pvwrvM7Q6y7PMH9FgY4GS8jbsdJMV1m0wAUZUxDzEEJQ4BIbe9CcpeLaGzioGo
 xbp1VdZkva2AHL8LeU95MHl7jeD5VNMVKHOOZCqgyhSg1DhfBzbGM/r7eCMfolYpbUkk
 AAxXSzItlGpER9tmswopLqkBaWHeovwWUd4BdoNQmH6bVEo/rDBioxULwEaVmhGFdQTY
 VmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IX8XN8KM9dnzGFmxEkBIyOJ3RPt5XbxbwKjcGpc4uTQ=;
 b=PWxsgGZMzpKysKWIrzH1vHhMVdlEHgTcw8sgVld6wQ3wt3WHeBvxRNAJd0MXFeSra1
 OM1+LY/9cSYAMg6sV8ZZurquTDujrYmRapd2gEVovbdCLmWhGKWnWFYb8WzmLuxLL4dj
 4L7NSCafFcnuep+NEyIbwsLxtZXL5YkMBXWI/rPgfGjOqrnCzU/S6v32zvTDZuInqzk/
 xcNP138nzBwLMJ2LK+Nv9Lj1sKx3SEXjxOFULq1TFfL5uLd0Xay7PR40FtWZ/vrt/cnP
 0zNa6TwoKws6LqrVNo9zJgSLr49fKJ/0Qjp3nDJiW14OmphRGEQxdfIM7dfiQkP47Hbe
 bgNg==
X-Gm-Message-State: AOAM530WpAXLQYE+6fDL4gpaCT1DnsJRONtupvo9KoUz0Qc0NBUbRxEz
 d9MR19iNFEJcCSlfsHFGVt8VrD6pumY=
X-Google-Smtp-Source: ABdhPJwQmg8A8LtG6MVb8AMnhxEXfRlN79NMO2i6+bvO3vb8yEwwPSbxIl7qdMkx0W8IBoB2993qCw==
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr26737671pfv.65.1650506706035; 
 Wed, 20 Apr 2022 19:05:06 -0700 (PDT)
Received: from localhost ([203.221.203.144]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090ad70300b001cd4989feeasm492151pju.54.2022.04.20.19.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 19:05:05 -0700 (PDT)
Date: Thu, 21 Apr 2022 12:04:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220420141657.771442-1-mpe@ellerman.id.au>
In-Reply-To: <20220420141657.771442-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1650506675.x639gwg7n0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: miguel.ojeda.sandonis@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of April 21, 2022 12:16 am:
> This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrupt:
> Don't enable MSR[EE] in irq handlers unless perf is in use").
>=20
> Prior to that commit, we always set the decrementer in
> timer_interrupt(), to clear the timer interrupt. Otherwise we could end
> up continuously taking timer interrupts.
>=20
> When high res timers are enabled there is no problem seen with leaving
> the decrementer untouched in timer_interrupt(), because it will be
> programmed via hrtimer_interrupt() -> tick_program_event() ->
> clockevents_program_event() -> decrementer_set_next_event().
>=20
> However with CONFIG_HIGH_RES_TIMERS=3Dn or booting with highres=3Doff, we
> see a stall/lockup, because tick_nohz_handler() does not cause a
> reprogram of the decrementer, leading to endless timer interrupts.
> Example trace:
>=20
>   [    1.898617][    T7] Freeing initrd memory: 2624K^M
>   [   22.680919][    C1] rcu: INFO: rcu_sched detected stalls on CPUs/tas=
ks:^M
>   [   22.682281][    C1] rcu:     0-....: (25 ticks this GP) idle=3D073/0=
/0x1 softirq=3D10/16 fqs=3D1050 ^M
>   [   22.682851][    C1]  (detected by 1, t=3D2102 jiffies, g=3D-1179, q=
=3D476)^M
>   [   22.683649][    C1] Sending NMI from CPU 1 to CPUs 0:^M
>   [   22.685252][    C0] NMI backtrace for cpu 0^M
>   [   22.685649][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0=
-rc2-00185-g0faf20a1ad16 #145^M
>   [   22.686393][    C0] NIP:  c000000000016d64 LR: c000000000f6cca4 CTR:=
 c00000000019c6e0^M
>   [   22.686774][    C0] REGS: c000000002833590 TRAP: 0500   Not tainted =
 (5.16.0-rc2-00185-g0faf20a1ad16)^M
>   [   22.687222][    C0] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  C=
R: 24000222  XER: 00000000^M
>   [   22.688297][    C0] CFAR: c00000000000c854 IRQMASK: 0 ^M
>   ...
>   [   22.692637][    C0] NIP [c000000000016d64] arch_local_irq_restore+0x=
174/0x250^M
>   [   22.694443][    C0] LR [c000000000f6cca4] __do_softirq+0xe4/0x3dc^M
>   [   22.695762][    C0] Call Trace:^M
>   [   22.696050][    C0] [c000000002833830] [c000000000f6cc80] __do_softi=
rq+0xc0/0x3dc (unreliable)^M
>   [   22.697377][    C0] [c000000002833920] [c000000000151508] __irq_exit=
_rcu+0xd8/0x130^M
>   [   22.698739][    C0] [c000000002833950] [c000000000151730] irq_exit+0=
x20/0x40^M
>   [   22.699938][    C0] [c000000002833970] [c000000000027f40] timer_inte=
rrupt+0x270/0x460^M
>   [   22.701119][    C0] [c0000000028339d0] [c0000000000099a8] decremente=
r_common_virt+0x208/0x210^M
>=20
> Possibly this should be fixed in the lowres timing code, but that would
> be a generic change and could take some time and may not backport
> easily, so for now make the programming of the decrementer unconditional
> again in timer_interrupt() to avoid the stall/lockup.
>=20
> Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq =
handlers unless perf is in use")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/time.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index f5cbfe5efd25..f80cce0e3899 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -615,23 +615,22 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>  		return;
>  	}
> =20
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
> =20
> +	/* Conditionally hard-enable interrupts. */
> +	if (should_hard_irq_enable())
>  		do_hard_irq_enable();
> -	}
> =20
>  #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
>  	if (atomic_read(&ppc_n_lost_interrupts) !=3D 0)
> --=20
> 2.34.1
>=20
>=20
