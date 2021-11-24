Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 567FB45C057
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzh6W1kRsz3bvH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:04:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YN73oKTO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YN73oKTO; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzh5l5bhTz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:03:37 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id z6so2550331pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QJ9pl8yieznyJqhjXHAtPu/eMSKpzw8Ag0IY0vuUq3U=;
 b=YN73oKTO4joPpTLxAKNoG9wNo7jzU70DLuIqnQXTiXQ4Y3qvcOY/xMLbt7A+7l/S3T
 ijn+nXELKq/Icng5U6rwllfSeOZfLTcnsDFuffqad4LatKm7/uELJsese1v0JKVzwTrG
 fiN3JPRXYIc0W+E5YRxfYna0l4t6fgvc5Y3z4n/GV89EpJNIjK/p1CuiSN259wJ03Nkf
 0eCZ87vfZylriVpiiX7wIAnkZKVEfKJrBJNsRbegJ/yaNvF8LdMKwaT530OyQy5PrYBl
 7JW06L26mZxD23vF8jJvW5QFHAZv5UOW8C440/kmvFJQV8gClJ0fZbgT7Fm2i+Onv0A1
 BrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QJ9pl8yieznyJqhjXHAtPu/eMSKpzw8Ag0IY0vuUq3U=;
 b=5hcTfNbHgV3V+NoxcWpn3nyVbpGhNF4YXVJIhHu30Gl54C81Yv+l3aYltU3p4mrk3c
 c23GY4b/1qCp4OmJtTQ/4Twi+rmAtyswfJ51WukdW3+OYfeHgHl//zqQSlGUvoJLTPhP
 9SE5ju9JAbmW3a7yvC0TMtxclY+X7IC/DFcgj8aJzuD++YYNae7IQbRFIwFAdltdOnyU
 m/eMn+c4oQCxxCSBbaL3GwFixwpC49Vbxlw7yZmz6332QMPKdz72u3pvYtNZ6YpX7z2t
 rAWgQAniVW/kRT/HEQsg3VyMp+AowgiaTcUY3IzPwFFCmDKrYFS54oDl55HOCu8jljlc
 3mQA==
X-Gm-Message-State: AOAM533TT5hyBhvq5JCiun4fjSnLyHNFADqF3L768oOq8YDGRfBX7c33
 KZzdbg6bZeF9PpUqDLqQQzI=
X-Google-Smtp-Source: ABdhPJwUyzskWKcZJrC2QLscQDFWtbm/9gK87sAh9Xb9tyiiYzVWd1sxSOgV8t4T2Qp71gi5Yn2FHw==
X-Received: by 2002:aa7:8b14:0:b0:4a3:a714:30ed with SMTP id
 f20-20020aa78b14000000b004a3a71430edmr5660544pfd.2.1637759013779; 
 Wed, 24 Nov 2021 05:03:33 -0800 (PST)
Received: from localhost ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id y4sm17775438pfi.178.2021.11.24.05.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 05:03:33 -0800 (PST)
Date: Wed, 24 Nov 2021 23:03:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] powerpc/mce: Avoid using irq_work_queue() in
 realmode
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1637757546.z3bufxuoab.astroid@bobo.none>
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
Cc: mahesh@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of November 24, 2021 7:54 pm:
> In realmode mce handler we use irq_work_queue() to defer
> the processing of mce events, irq_work_queue() can only
> be called when translation is enabled because it touches
> memory outside RMA, hence we enable translation before
> calling irq_work_queue and disable on return, though it
> is not safe to do in realmode.
>=20
> To avoid this, program the decrementer and call the event
> processing functions from timer handler.
>=20
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> V2:
> * Use arch_irq_work_raise to raise decrementer interrupt.
> * Avoid having atomic variable.
>=20
> V3:
> * Fix build error.
>   Reported by kernel test bot.
> ---
>  arch/powerpc/include/asm/machdep.h       |  2 +
>  arch/powerpc/include/asm/mce.h           |  2 +
>  arch/powerpc/include/asm/paca.h          |  1 +
>  arch/powerpc/kernel/mce.c                | 51 +++++++++++-------------
>  arch/powerpc/kernel/time.c               |  3 ++
>  arch/powerpc/platforms/pseries/pseries.h |  1 +
>  arch/powerpc/platforms/pseries/ras.c     | 31 +-------------
>  arch/powerpc/platforms/pseries/setup.c   |  1 +
>  8 files changed, 34 insertions(+), 58 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/as=
m/machdep.h
> index 9c3c9f04129f..d22b222ba471 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -99,6 +99,8 @@ struct machdep_calls {
>  	/* Called during machine check exception to retrive fixup address. */
>  	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
> =20
> +	void            (*machine_check_log_err)(void);
> +
>  	/* Motherboard/chipset features. This is a kind of general purpose
>  	 * hook used to control some machine specific features (like reset
>  	 * lines, chip power control, etc...).
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mc=
e.h
> index 331d944280b8..6e306aaf58aa 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct ma=
chine_check_event *evt,
>  unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>  extern void mce_common_process_ue(struct pt_regs *regs,
>  				  struct mce_error_info *mce_err);
> +void machine_check_raise_dec_intr(void);
>  int mce_register_notifier(struct notifier_block *nb);
>  int mce_unregister_notifier(struct notifier_block *nb);
> +void mce_run_late_handlers(void);
>  #ifdef CONFIG_PPC_BOOK3S_64
>  void flush_and_reload_slb(void);
>  void flush_erat(void);
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index dc05a862e72a..d463c796f7fa 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -280,6 +280,7 @@ struct paca_struct {
>  #endif
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	struct mce_info *mce_info;
> +	u32 mces_to_process;
>  #endif /* CONFIG_PPC_BOOK3S_64 */
>  } ____cacheline_aligned;
> =20
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index fd829f7f25a4..8e17f29472a0 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -28,19 +28,9 @@
> =20
>  #include "setup.h"
> =20
> -static void machine_check_process_queued_event(struct irq_work *work);
> -static void machine_check_ue_irq_work(struct irq_work *work);
>  static void machine_check_ue_event(struct machine_check_event *evt);
>  static void machine_process_ue_event(struct work_struct *work);
> =20
> -static struct irq_work mce_event_process_work =3D {
> -        .func =3D machine_check_process_queued_event,
> -};
> -
> -static struct irq_work mce_ue_event_irq_work =3D {
> -	.func =3D machine_check_ue_irq_work,
> -};
> -
>  static DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
> =20
>  static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
> @@ -89,6 +79,12 @@ static void mce_set_error_info(struct machine_check_ev=
ent *mce,
>  	}
>  }
> =20
> +/* Raise decrementer interrupt */
> +void machine_check_raise_dec_intr(void)
> +{
> +	arch_irq_work_raise();
> +}

It would be better if the name specifically related to irq work, which=20
is more than just dec interrupt. It might be good to set mces_to_process
here as well.

I would name it something like mce_irq_work_queue, and the paca variable
to mce_pending_irq_work...


> +void mce_run_late_handlers(void)
> +{
> +	if (unlikely(local_paca->mces_to_process)) {
> +		if (ppc_md.machine_check_log_err)
> +			ppc_md.machine_check_log_err();
> +		machine_check_process_queued_event();
> +		machine_check_ue_work();
> +		local_paca->mces_to_process--;
> +	}
> +}

The problem with a counter is that you're clearing the irq work pending
in the timer interrupt, so you'll never call in here again to clear that
(until something else sets irq work).

But as far as I can see it does not need to be a counter, just a flag.
The machine check calls will process multiple events, right? (and the
current irq_work queue does not queue the same work multiple times).

Oh. That's actually bad, isn't it? Our irq work should be per-CPU
because the callbacks are mainly only operating on the local paca
queued events, so we have a longstanding bug there AFAIKS. Your patch
will solve it if everything is converted over.

> +
>  void machine_check_print_event_info(struct machine_check_event *evt,
>  				    bool user_mode, bool in_guest)
>  {
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index cae8f03a44fe..94c591b6f9d2 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -594,6 +594,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
> =20
>  	if (test_irq_work_pending()) {
>  		clear_irq_work_pending();
> +#ifdef CONFIG_PPC_BOOK3S_64
> +		mce_run_late_handlers();
> +#endif

Maybe create a no-op inline function for others and call unconditionally=20
here. I wonder if the name could be better, we have lots of handlers, of
varying earliness. real-mode, then virt mode NMI context, then IRQ=20
context, then workqueue context.

mce_run_irq_context_handlers() might not be much better though.

>  		irq_work_run();
>  	}
> =20
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 3544778e06d0..9cf0d33dfbf5 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -21,6 +21,7 @@ struct pt_regs;
>  extern int pSeries_system_reset_exception(struct pt_regs *regs);
>  extern int pSeries_machine_check_exception(struct pt_regs *regs);
>  extern long pseries_machine_check_realmode(struct pt_regs *regs);
> +void pSeries_machine_check_log_err(void);
> =20
>  #ifdef CONFIG_SMP
>  extern void smp_init_pseries(void);
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platform=
s/pseries/ras.c
> index 56092dccfdb8..8613f9cc5798 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -23,11 +23,6 @@ static DEFINE_SPINLOCK(ras_log_buf_lock);
> =20
>  static int ras_check_exception_token;
> =20
> -static void mce_process_errlog_event(struct irq_work *work);
> -static struct irq_work mce_errlog_process_work =3D {
> -	.func =3D mce_process_errlog_event,
> -};
> -
>  #define EPOW_SENSOR_TOKEN	9
>  #define EPOW_SENSOR_INDEX	0
> =20
> @@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, s=
truct rtas_error_log *errp)
>  	error_type =3D mce_log->error_type;
> =20
>  	disposition =3D mce_handle_err_realmode(disposition, error_type);
> -
> -	/*
> -	 * Enable translation as we will be accessing per-cpu variables
> -	 * in save_mce_event() which may fall outside RMO region, also
> -	 * leave it enabled because subsequently we will be queuing work
> -	 * to workqueues where again per-cpu variables accessed, besides
> -	 * fwnmi_release_errinfo() crashes when called in realmode on
> -	 * pseries.
> -	 * Note: All the realmode handling like flushing SLB entries for
> -	 *       SLB multihit is done by now.
> -	 */
>  out:
> -	msr =3D mfmsr();
> -	mtmsr(msr | MSR_IR | MSR_DR);
> -
>  	disposition =3D mce_handle_err_virtmode(regs, errp, mce_log,
>  					      disposition);
> -
> -	/*
> -	 * Queue irq work to log this rtas event later.
> -	 * irq_work_queue uses per-cpu variables, so do this in virt
> -	 * mode as well.
> -	 */
> -	irq_work_queue(&mce_errlog_process_work);
> -
> -	mtmsr(msr);
> -
>  	return disposition;
>  }
> =20
>  /*
>   * Process MCE rtas errlog event.
>   */
> -static void mce_process_errlog_event(struct irq_work *work)
> +void pSeries_machine_check_log_err(void)
>  {
>  	struct rtas_error_log *err;
> =20
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platfo=
rms/pseries/setup.c
> index 8a62af5b9c24..9bdc487b8e35 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -1084,6 +1084,7 @@ define_machine(pseries) {
>  	.system_reset_exception =3D pSeries_system_reset_exception,
>  	.machine_check_early	=3D pseries_machine_check_realmode,
>  	.machine_check_exception =3D pSeries_machine_check_exception,
> +	.machine_check_log_err	=3D pSeries_machine_check_log_err,
>  #ifdef CONFIG_KEXEC_CORE
>  	.machine_kexec          =3D pSeries_machine_kexec,
>  	.kexec_cpu_down         =3D pseries_kexec_cpu_down,
> --=20
> 2.31.1
>=20
>=20
