Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BF43C0C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 05:30:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfDhk4J4Yz2ym5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:29:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ocaWQhMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ocaWQhMq; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfDh11XF8z2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 14:29:20 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so3972750pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 20:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NXckBatBmWTSXNXn03oaE/p+PJTLMJ+R30YiT9U+OEM=;
 b=ocaWQhMqVkYOQcl3SA4dEewUp9B7B3qBGmhZQ9CoV5RuyRQi9pnVEyDXRZhG3YczZu
 nucYIzbE5pW58fspVIJQ5lmxCVn+aKqJgdup4DVBM8p2m7sfY5Q/QGgJTK/h4UUV3ghc
 9HfpqnFHCFIMz5UUkS4s/qkznW/NCRkl3b1rKxyBBifAyFmwbB+4UwpCsIzveQ3/5DT4
 +XidmvVDoyq4voUCUKz7IWXot8XO5eijDnppeZ43HQeby7j3e/CiO+z3Mm0mvgUlHjXu
 VtYj3rhgeMFZ4f80JnUAU/5Dz5tl48LlxXJnHPlusOr8zFcFtwqxsLAntOMgcmKlvIFn
 XTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NXckBatBmWTSXNXn03oaE/p+PJTLMJ+R30YiT9U+OEM=;
 b=ugpU4fh6+F+Podp5Y/24bpAeIxNBWRD+t6ifCn0bIiAgPaLKGK7Yv98sI6motBRa++
 +zMnit56TbmOr/FfJcaJMjlKIpC/e2g2u6gStU2+OuPx0erANz8q0ePHrhHDlUJelPcA
 2aRoyRC/+uKB24bTgZua1WZZiaWM99oAqZVS+BMaTh0oUbaypA1m1xuYOXKEkQoy7D58
 Rpp+h7L51/UPYAOQhWN+Gb+yQOo8DQ2J7gnrDX5xvsMzHMv0bf01Zy5ZMxCk0Nxx1lxZ
 ar0QehyMG2BEUij7NoitPqi6KoO+KX09I0t0+S2hLGNmDPqSPSXDeXrRha3jUgCfA+9E
 Q/nQ==
X-Gm-Message-State: AOAM531Q59wd4qVCvmXsgpRs3KOkarhUSNpsvg/dtWyAnn0p4wE4z6TI
 /C9pEK43lD3OAY1CNjdYm/4=
X-Google-Smtp-Source: ABdhPJwYvxE3YBrvq0yjV4xfpWcMLt9txmaD9H6pzbnOOqYTHOIALXW3GVtOoY0vZfPN8l/SQ+2sGw==
X-Received: by 2002:a17:90a:488d:: with SMTP id
 b13mr3133186pjh.152.1635305355452; 
 Tue, 26 Oct 2021 20:29:15 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id m2sm20384044pgd.70.2021.10.26.20.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 20:29:15 -0700 (PDT)
Date: Wed, 27 Oct 2021 13:29:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
To: benh@kernel.crashing.org, Laurent Dufour <ldufour@linux.ibm.com>,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-2-ldufour@linux.ibm.com>
In-Reply-To: <20211026162740.16283-2-ldufour@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1635303699.wgz87uxy4c.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
> When handling the Watchdog interrupt, long processing should not be done
> while holding the __wd_smp_lock. This prevents the other CPUs to grab it
> and to process Watchdog timer interrupts. Furhtermore, this could lead to
> the following situation:
>=20
> CPU x detect lockup on CPU y and grab the __wd_smp_lock
>       in watchdog_smp_panic()
> CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
>       in soft_nmi_interrupt()
> CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()

CPU y should get the IPI here if it's a NMI IPI (which will be true for=20
>=3D POWER9 64s).

That said, not all platforms support it and the console lock problem
seems real, so okay.

> CPU x will timeout and so has spent 1s waiting while holding the
>       __wd_smp_lock.
>=20
> A deadlock may also happen between the __wd_smp_lock and the console_owne=
r
> 'lock' this way:
> CPU x grab the console_owner
> CPU y grab the __wd_smp_lock
> CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_lock
> CPU y wants to print something and wait for console_owner
> -> deadlock
>=20
> Doing all the long processing without holding the _wd_smp_lock prevents
> these situations.

The intention was to avoid logs getting garbled e.g., if multiple=20
different CPUs fire at once.

I wonder if instead we could deal with that by protecting the IPI=20
sending and printing stuff with a trylock, and if you don't get the
trylock then just return, and you'll come back with the next timer
interrupt.

Thanks,
Nick

>=20
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/kernel/watchdog.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdo=
g.c
> index f9ea0e5357f9..bc7411327066 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -149,6 +149,8 @@ static void set_cpu_stuck(int cpu, u64 tb)
> =20
>  static void watchdog_smp_panic(int cpu, u64 tb)
>  {
> +	cpumask_t cpus_pending_copy;
> +	u64 last_reset_tb_copy;
>  	unsigned long flags;
>  	int c;
> =20
> @@ -161,29 +163,32 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>  	if (cpumask_weight(&wd_smp_cpus_pending) =3D=3D 0)
>  		goto out;
> =20
> +	cpumask_copy(&cpus_pending_copy, &wd_smp_cpus_pending);
> +	last_reset_tb_copy =3D wd_smp_last_reset_tb;
> +
> +	/* Take the stuck CPUs out of the watch group */
> +	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
> +
> +	wd_smp_unlock(&flags);
> +
>  	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
> -		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
> +		 cpu, cpumask_pr_args(&cpus_pending_copy));
>  	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
> -		 cpu, tb, wd_smp_last_reset_tb,
> -		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
> +		 cpu, tb, last_reset_tb_copy,
> +		 tb_to_ns(tb - last_reset_tb_copy) / 1000000);
> =20
>  	if (!sysctl_hardlockup_all_cpu_backtrace) {
>  		/*
>  		 * Try to trigger the stuck CPUs, unless we are going to
>  		 * get a backtrace on all of them anyway.
>  		 */
> -		for_each_cpu(c, &wd_smp_cpus_pending) {
> +		for_each_cpu(c, &cpus_pending_copy) {
>  			if (c =3D=3D cpu)
>  				continue;
>  			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
>  		}
>  	}
> =20
> -	/* Take the stuck CPUs out of the watch group */
> -	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
> -
> -	wd_smp_unlock(&flags);
> -
>  	if (sysctl_hardlockup_all_cpu_backtrace)
>  		trigger_allbutself_cpu_backtrace();
> =20
> @@ -204,6 +209,8 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>  			unsigned long flags;
> =20
>  			wd_smp_lock(&flags);
> +			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
> +			wd_smp_unlock(&flags);
> =20
>  			pr_emerg("CPU %d became unstuck TB:%lld\n",
>  				 cpu, tb);
> @@ -212,9 +219,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>  				show_regs(regs);
>  			else
>  				dump_stack();
> -
> -			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
> -			wd_smp_unlock(&flags);
>  		}
>  		return;
>  	}
> @@ -267,6 +271,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>  			return 0;
>  		}
>  		set_cpu_stuck(cpu, tb);
> +		wd_smp_unlock(&flags);
> =20
>  		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
>  			 cpu, (void *)regs->nip);
> @@ -277,8 +282,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>  		print_irqtrace_events(current);
>  		show_regs(regs);
> =20
> -		wd_smp_unlock(&flags);
> -
>  		if (sysctl_hardlockup_all_cpu_backtrace)
>  			trigger_allbutself_cpu_backtrace();
> =20
> --=20
> 2.33.1
>=20
>=20
