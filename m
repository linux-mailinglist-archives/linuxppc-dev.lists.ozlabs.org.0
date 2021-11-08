Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2F448154
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:20:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HntYp58gWz305K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 01:20:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NjbpMEoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NjbpMEoT; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HntY51MYXz2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 01:19:52 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b11so2664912pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 06:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lxOLnw55jcbumTKsmu1x2ntRWkZQGTk6t2+RDuaQxWo=;
 b=NjbpMEoT6zBYZU68anU0AOQcQJdRXdVLeM8TyaUra9jdv2J1byJ428tHgCLKsjT62y
 u5WSuI8UjDHOm+Q/MaGu08PboA2rHuPul/DfZnXBTO3PIUze39zLpAIBAQ/I14LiNTlp
 c+fubpUsxOrWOHw6+c0QXrwCMQLBScaPaWmvGI3JeZAElfRAddxuyWEs5+NmbEnJZixp
 S4NqwNIpgzGG1tqsryu7Nb3s8uKMvsItl79P6JPigqaT53W+GUTsFAI8A/OvUPnScyAa
 vWFakUlD6Un6vmyN8gM9b0cKUB4aoWvJJUzgUwuVk8j8bALsAx1vKwY1GodcwZnRjXhR
 0EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lxOLnw55jcbumTKsmu1x2ntRWkZQGTk6t2+RDuaQxWo=;
 b=myvAHjZ7nM4+3ndcxPyDV6k2nFmSN514F0QMJXCjx2qsIXqHAkcDIKHVf68l43wqdi
 PaEVeqS0UbPUZstjuDHFR3hTCR9tOrkQF7OeHFnEZFHxVAnZeIH3DK1hmI+rcbQmbrKN
 wKMUU4PMzLNPV7EVZABvMayEzT1JxW5m2YNre5YdVMt0al1t0zHlzIBxEJx1zFxAT3on
 4sbiirhV0OyvWJp9MXESy7lCaE25pc1OQ/tyclYN7n9HfqudhFKTPD1u8KUU0sYFN5fk
 fldGh5Vrf9407Zvn4KBrlufLIU3EbOqVFGtPPrG6eT4R11MFXNh+ljVETacmuxSCnplY
 fnLQ==
X-Gm-Message-State: AOAM5329rJXh2QX37z4ZwyYlV3XNUnR4BZhCTXGCUiAgt2BG3FABM4o5
 dO5e8rOUHJpOyFo1K+Zs62w=
X-Google-Smtp-Source: ABdhPJzYvcRZdZZVqk+H1LmeBE7UU8eCvNSXCC6VGTlriRJgjTn7SLCBCyLu27PKvXNKR12ntpE7/A==
X-Received: by 2002:a17:903:32d1:b0:142:1ce1:30c9 with SMTP id
 i17-20020a17090332d100b001421ce130c9mr130913plr.0.1636381189115; 
 Mon, 08 Nov 2021 06:19:49 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id d8sm2186267pfl.176.2021.11.08.06.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:19:48 -0800 (PST)
Date: Tue, 09 Nov 2021 00:19:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/mce: Avoid using irq_work_queue() in realmode
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636380442.sna3yrbwu3.astroid@bobo.none>
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of November 8, 2021 6:38 pm:
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
> index 764f2732a821..c89cc03c0f97 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -103,6 +103,8 @@ struct machdep_calls {
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
> index 331d944280b8..187810f13669 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct ma=
chine_check_event *evt,
>  unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>  extern void mce_common_process_ue(struct pt_regs *regs,
>  				  struct mce_error_info *mce_err);
> +extern void machine_check_raise_dec_intr(void);

No new externs on function declarations, they tell me.

>  int mce_register_notifier(struct notifier_block *nb);
>  int mce_unregister_notifier(struct notifier_block *nb);
> +void mce_run_late_handlers(void);
>  #ifdef CONFIG_PPC_BOOK3S_64
>  void flush_and_reload_slb(void);
>  void flush_erat(void);
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index dc05a862e72a..f49180f8c9be 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -280,6 +280,7 @@ struct paca_struct {
>  #endif
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	struct mce_info *mce_info;
> +	atomic_t mces_to_process;
>  #endif /* CONFIG_PPC_BOOK3S_64 */
>  } ____cacheline_aligned;
> =20
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index fd829f7f25a4..45baa062ebc0 100644
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
> +	set_dec(1);
> +}

The problem here is a timer can be scheduled (e.g., by an external=20
interrupt if it gets taken before the decrementer, then uses a
timer) and that set decr > 1. See logic in decrementer_set_next_event.

I _think_ the way to get around this would be to have the machine check
just use arch_irq_work_raise.

Then you could also only call the mce handler inside the
test_irq_work_pending() check and avoid the added function call on every=20
timer. That test should also be marked unlikely come to think of it, but
that's a side patchlet.

> +
>  /*
>   * Decode and save high level MCE information into per cpu buffer which
>   * is an array of machine_check_event structure.
> @@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handle=
d,
>  	if (mce->error_type =3D=3D MCE_ERROR_TYPE_UE)
>  		mce->u.ue_error.ignore_event =3D mce_err->ignore_event;
> =20
> +	atomic_inc(&local_paca->mces_to_process);
> +
>  	if (!addr)
>  		return;
> =20
> @@ -217,7 +215,7 @@ void release_mce_event(void)
>  	get_mce_event(NULL, true);
>  }
> =20
> -static void machine_check_ue_irq_work(struct irq_work *work)
> +static void machine_check_ue_work(void)
>  {
>  	schedule_work(&mce_ue_event_work);
>  }
> @@ -239,7 +237,7 @@ static void machine_check_ue_event(struct machine_che=
ck_event *evt)
>  	       evt, sizeof(*evt));
> =20
>  	/* Queue work to process this event later. */
> -	irq_work_queue(&mce_ue_event_irq_work);
> +	machine_check_raise_dec_intr();
>  }
> =20
>  /*
> @@ -249,7 +247,6 @@ void machine_check_queue_event(void)
>  {
>  	int index;
>  	struct machine_check_event evt;
> -	unsigned long msr;
> =20
>  	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
>  		return;
> @@ -263,20 +260,7 @@ void machine_check_queue_event(void)
>  	memcpy(&local_paca->mce_info->mce_event_queue[index],
>  	       &evt, sizeof(evt));
> =20
> -	/*
> -	 * Queue irq work to process this event later. Before
> -	 * queuing the work enable translation for non radix LPAR,
> -	 * as irq_work_queue may try to access memory outside RMO
> -	 * region.
> -	 */
> -	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
> -		msr =3D mfmsr();
> -		mtmsr(msr | MSR_IR | MSR_DR);
> -		irq_work_queue(&mce_event_process_work);
> -		mtmsr(msr);
> -	} else {
> -		irq_work_queue(&mce_event_process_work);
> -	}

Getting rid of these things would be very nice.

> +	machine_check_raise_dec_intr();
>  }
> =20
>  void mce_common_process_ue(struct pt_regs *regs,
> @@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_stru=
ct *work)
>   * process pending MCE event from the mce event queue. This function wil=
l be
>   * called during syscall exit.
>   */
> -static void machine_check_process_queued_event(struct irq_work *work)
> +static void machine_check_process_queued_event(void)
>  {
>  	int index;
>  	struct machine_check_event *evt;
> @@ -363,6 +347,17 @@ static void machine_check_process_queued_event(struc=
t irq_work *work)
>  	}
>  }
> =20
> +void mce_run_late_handlers(void)
> +{
> +	if (unlikely(atomic_read(&local_paca->mces_to_process))) {
> +		if (ppc_md.machine_check_log_err)
> +			ppc_md.machine_check_log_err();
> +		machine_check_process_queued_event();
> +		machine_check_ue_work();
> +		atomic_dec(&local_paca->mces_to_process);
> +	}
> +}
> +
>  void machine_check_print_event_info(struct machine_check_event *evt,
>  				    bool user_mode, bool in_guest)
>  {
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 934d8ae66cc6..2dc09d75d77c 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -597,6 +597,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>  		irq_work_run();
>  	}
> =20
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	mce_run_late_handlers();
> +#endif

It looks like if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) should work here?

>  	now =3D get_tb();
>  	if (now >=3D *next_tb) {
>  		*next_tb =3D ~(u64)0;
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 3544778e06d0..0dc4f1027b30 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -21,6 +21,7 @@ struct pt_regs;
>  extern int pSeries_system_reset_exception(struct pt_regs *regs);
>  extern int pSeries_machine_check_exception(struct pt_regs *regs);
>  extern long pseries_machine_check_realmode(struct pt_regs *regs);
> +extern void pSeries_machine_check_log_err(void);

extern can be removed.

Thanks,
Nick

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
> index f79126f16258..54bd7bdb7e92 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -1085,6 +1085,7 @@ define_machine(pseries) {
>  	.system_reset_exception =3D pSeries_system_reset_exception,
>  	.machine_check_early	=3D pseries_machine_check_realmode,
>  	.machine_check_exception =3D pSeries_machine_check_exception,
> +	.machine_check_log_err	=3D pSeries_machine_check_log_err,
>  #ifdef CONFIG_KEXEC_CORE
>  	.machine_kexec          =3D pSeries_machine_kexec,
>  	.kexec_cpu_down         =3D pseries_kexec_cpu_down,
> --=20
> 2.26.2
>=20
>=20
