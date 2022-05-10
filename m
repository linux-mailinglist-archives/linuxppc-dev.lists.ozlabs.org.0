Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C674052102A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 11:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyBrG4KR6z3cDL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 19:02:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n5QLH6oJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n5QLH6oJ; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyBqb1bY0z3bcv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 19:01:46 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1487779pjv.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=OQcMcWaoZkWjan5mqZCuBivd7Ytklw76aRoAuYiwt+k=;
 b=n5QLH6oJJoBNbHS8bBZWkpd/jB/Se/6DJvyTrgtHQ0Kn8UEZJzhDs44sRUeRY8CXy4
 MnPVzUP3rroILjNgHj57O49GfrcJWlXKdMRLwic/zbuWzuy/KjqbCpZsgmSeWgQlxyeR
 yEDyEJaVOVLrCmUXw+tyF49TSnWNsNekXvsCQSlGkedBgkHa8+MgNMkZ0I1DaZDZ/LAg
 r7YaySQPwIDqDDu9fmbx6x853KjjgUemS3mdT70f0sXJwIECseMOAW1hTHN87bL+yLgo
 /Fh4N7dIpXPD9HXFufHJXue5EbwtOfmagJMH23ck7vkUutbyC9LtIeUQQQrokazuTk1P
 l4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=OQcMcWaoZkWjan5mqZCuBivd7Ytklw76aRoAuYiwt+k=;
 b=dPxC7t6uhvFDUS+gmsTTe+wfw7W5Qhm+oTDD4dYVj3SuYYTuDivv6DgIdQo36H0cLn
 efCeMRT4i8NBb1VFECh7nOeavPep6R+jmCgOCXI32Qrpq8apE7K1FexDHg5SZhmcagQX
 BnN97rBFOtev2bVUOsTZh1Yz0jW1FV/M3VqQAcAoUzY/824nzMVePUh1wZQmOfUNRYAs
 DIpQOFM2i1yYohKXAMeEqB3YeCQQVxsK67TtaLaQS8uga/c3S/JopwHLm1/hVX+NX2Yt
 BOMOgXzL6GNoaGnBKz3G3+GGX3IpTwodsqBGqzHMj4DorTsMATIov7RCGJ0Zv0+HKRHM
 LOPw==
X-Gm-Message-State: AOAM532koMNob42msnGoGy6ZB1wfF9Znfs7Up8p5G8o3peE4xtCQ90md
 RgAZxFYEkfVrk2XEAUARdZ0=
X-Google-Smtp-Source: ABdhPJxSJRzc79pqsMCYyV2xXDa/w/KxqCjIGjPY3vxuB3OFAWGbX1/VmuBcjFJyuqcoqUH8+ohYmA==
X-Received: by 2002:a17:902:9345:b0:15f:186b:e478 with SMTP id
 g5-20020a170902934500b0015f186be478mr6617353plp.117.1652173303060; 
 Tue, 10 May 2022 02:01:43 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170902d41300b0015e8d4eb220sm1408459ple.106.2022.05.10.02.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:01:42 -0700 (PDT)
Date: Tue, 10 May 2022 19:01:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/crash: save cpu register data in
 crash_smp_send_stop()
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
References: <20220506163933.391981-1-hbathini@linux.ibm.com>
In-Reply-To: <20220506163933.391981-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1652171381.tcl5f5aq9f.astroid@bobo.none>
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Hari Bathini's message of May 7, 2022 2:39 am:
> Capture register data for secondary CPUs in crash_smp_send_stop()
> instead of doing it much later in crash_kexec_prepare_cpus() function
> with another set of NMI IPIs to secondary CPUs. This change avoids
> unnecessarily tricky post processing of data to get the right
> backtrace for these CPUs.

Is the tricky post processing done in crash tools? Is it buggy in
some situations or just fragile code you want to deprecate? Seems
like a good goal either way

I assume the desire to stop secondaries ASAP is not just to get
register data but also to limit the amount of damage they might
cause to the crash process. Can they take interrupts or trigger
the hard lockup watchdog, for example?

> -void crash_smp_send_stop(void)
> -{
> -	static bool stopped =3D false;
> -
> -	/*
> -	 * In case of fadump, register data for all CPUs is captured by f/w
> -	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
> -	 * this rtas call to avoid tricky post processing of those CPUs'
> -	 * backtraces.
> -	 */
> -	if (should_fadump_crash())
> -		return;

This is not actually code you changed, but I wonder if it's wrong,
if fadump is enabled then panic runs without stopping secondaries?
Doesn't seem quite right.

> -
> -	if (stopped)
> -		return;
> -
> -	stopped =3D true;
> -
> -#ifdef CONFIG_NMI_IPI
> -	smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, crash_stop_this_cpu, 1000000);
> -#else
> -	smp_call_function(crash_stop_this_cpu, NULL, 0);
> -#endif /* CONFIG_NMI_IPI */
> -}

Now if kexec is not configured do we lose our crash_smp_send_stop
function, or is it only ever called if kexec is enabled?

> -
>  #ifdef CONFIG_NMI_IPI
>  static void nmi_stop_this_cpu(struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 22ceeeb705ab..f06dfe71caca 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -25,6 +25,7 @@
>  #include <asm/setjmp.h>
>  #include <asm/debug.h>
>  #include <asm/interrupt.h>
> +#include <asm/fadump.h>
> =20
>  /*
>   * The primary CPU waits a while for all secondary CPUs to enter. This i=
s to
> @@ -102,7 +103,7 @@ void crash_ipi_callback(struct pt_regs *regs)
>  	/* NOTREACHED */
>  }
> =20
> -static void crash_kexec_prepare_cpus(int cpu)
> +static void crash_kexec_prepare_cpus(void)
>  {
>  	unsigned int msecs;
>  	volatile unsigned int ncpus =3D num_online_cpus() - 1;/* Excluding the =
panic cpu */
> @@ -203,7 +204,7 @@ void crash_kexec_secondary(struct pt_regs *regs)
> =20
>  #else	/* ! CONFIG_SMP */
> =20
> -static void crash_kexec_prepare_cpus(int cpu)
> +static void crash_kexec_prepare_cpus(void)
>  {
>  	/*
>  	 * move the secondaries to us so that we can copy
> @@ -249,6 +250,42 @@ static void __maybe_unused crash_kexec_wait_realmode=
(int cpu)
>  static inline void crash_kexec_wait_realmode(int cpu) {}
>  #endif	/* CONFIG_SMP && CONFIG_PPC64 */
> =20
> +void crash_smp_send_stop(void)
> +{
> +	static int cpus_stopped;
> +
> +	/*
> +	 * In case of fadump, register data for all CPUs is captured by f/w
> +	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
> +	 * this rtas call to avoid tricky post processing of those CPUs'
> +	 * backtraces.
> +	 */
> +	if (should_fadump_crash())
> +		return;
> +
> +	if (cpus_stopped)
> +		return;
> +
> +	cpus_stopped =3D 1;
> +
> +	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
> +	printk_deferred_enter();
> +
> +	/*
> +	 * This function is only called after the system
> +	 * has panicked or is otherwise in a critical state.
> +	 * The minimum amount of code to allow a kexec'd kernel
> +	 * to run successfully needs to happen here.
> +	 *
> +	 * In practice this means stopping other cpus in
> +	 * an SMP system.
> +	 * The kernel is broken so disable interrupts.
> +	 */
> +	hard_irq_disable();
> +
> +	crash_kexec_prepare_cpus();

This seems to move a bit of the kexec code around so this runs=20
before notifiers in the panic path now. Maybe that's okay, I don't
know this code too well, but how feasible would it be to have
crash_stop_this_cpu() call crash_save_cpu()? And keeping the
second IPI.

I do like the idea of removing the second IPI if possible, but
that could be done later by moving the logic into crash_save_cpu()
(it could just poll on a flag until the primary releases it to
the next phase, rather than have the primary send another IPI).

Thanks,
Nick


> +}
> +
>  /*
>   * Register a function to be called on shutdown.  Only use this if you
>   * can't reset your device in the second kernel.
> @@ -312,21 +349,6 @@ void default_machine_crash_shutdown(struct pt_regs *=
regs)
>  	unsigned int i;
>  	int (*old_handler)(struct pt_regs *regs);
> =20
> -	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
> -	printk_deferred_enter();
> -
> -	/*
> -	 * This function is only called after the system
> -	 * has panicked or is otherwise in a critical state.
> -	 * The minimum amount of code to allow a kexec'd kernel
> -	 * to run successfully needs to happen here.
> -	 *
> -	 * In practice this means stopping other cpus in
> -	 * an SMP system.
> -	 * The kernel is broken so disable interrupts.
> -	 */
> -	hard_irq_disable();
> -
>  	/*
>  	 * Make a note of crashing cpu. Will be used in machine_kexec
>  	 * such that another IPI will not be sent.
> @@ -340,7 +362,7 @@ void default_machine_crash_shutdown(struct pt_regs *r=
egs)
>  	if (TRAP(regs) =3D=3D INTERRUPT_SYSTEM_RESET)
>  		mdelay(PRIMARY_TIMEOUT);
> =20
> -	crash_kexec_prepare_cpus(crashing_cpu);
> +	crash_smp_send_stop();
> =20
>  	crash_save_cpu(regs, crashing_cpu);
> =20
> --=20
> 2.35.1
>=20
>=20
