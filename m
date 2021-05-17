Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B5382308
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:21:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4DG1pCcz306H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=u6yyrqPD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u6yyrqPD; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4Cj0thGz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:21:02 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso2883036pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=F5Hz0BLO5Ws32K3oTU32qDhdXWjnTew+kdexO5ZIK3s=;
 b=u6yyrqPDDU2LXoAA5gHff6vHOrrgtyZT644ukQnhphxqPDhbhrj6T6SzRXLMIrit7A
 Ay5CQx/GWRLVckcV5hsFjmxklULBofO1aB2ODSeFIkmay67akPuzeMhQD55qqkc0fTGU
 IwSmqb1SYQMfnKBC7k+cBhou8tG0MYkw4NgRaV0IcgMqHyZKhPf5WlrvCADYP5Pn2jJg
 zPz+tvru9qQGFuk88e8UZyLCWMkL1fhhpMlmi6iE72kZ3wfN7BXvGctKiOHwknhVnyJV
 JDblf3Al50ncG6YeOZCgFuV+nqqGclz1ukCiV5YspmacewtBfSrS2dpo8T0l39Yv8UDm
 zlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=F5Hz0BLO5Ws32K3oTU32qDhdXWjnTew+kdexO5ZIK3s=;
 b=Mp62jzEeV+84CaKp65hd3DFO+QABPlZaCQg5BdJ+NfsvmJ8gF9oNeeXNlPYc9Sh4DD
 9D/pPK8onMx/I/P+0Z65WEVtNc+8dwxR8DgkhsF4yCqjbobuF89IFgeIPUb49htmseQX
 SVQTPclKa2BPJAzoMYrOtN2wVuAfAFlncywW1VrilhEFpR8+ooNDEpEx/ZHEkM7CRfNL
 B/52p0YxewCMng2Y9iROPZIv8Fnf2xtXxsj7mL/Hv7WeB/R7eLM2lj8Psj/Wq/rlop0e
 9ta6lbZ1nN305x3O3ofYZFochPNnEpqMADGfkT2vfggfsUEJ0yYIILUhqTs4EDks3rN4
 d+lg==
X-Gm-Message-State: AOAM531R0pfVWW9ovTDYMg5tonAPJysZFvft8O47t5xCrgLy+Gfc0I+D
 lVh+xvsZXxHK0yPTVV0OpzI=
X-Google-Smtp-Source: ABdhPJwb/yTfsVC64ORLJrs6fmgHqrwa/RugurFUp56qod2dtE31FRsvWBXdoiba/p5fxnTjwuQGYA==
X-Received: by 2002:a17:90a:db02:: with SMTP id
 g2mr18915748pjv.2.1621221657428; 
 Sun, 16 May 2021 20:20:57 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id b6sm9090140pfb.27.2021.05.16.20.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:20:56 -0700 (PDT)
Date: Mon, 17 May 2021 13:20:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V2 1/1] powerpc/perf: Fix PMU callbacks to clear pending
 PMI before resetting an overflown PMC
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1618887697-1556-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1618887697-1556-2-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1618887697-1556-2-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1621220244.f3se5pssgj.astroid@bobo.none>
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
Cc: nasastry@in.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry I missed this :(

Excerpts from Athira Rajeev's message of April 20, 2021 1:01 pm:
> Running perf fuzzer showed below in dmesg logs:
> "Can't find PMC that caused IRQ"
>=20
> This means a PMU exception happened, but none of the PMC's (Performance
> Monitor Counter) were found to be overflown. There are some corner cases
> that clears the PMCs after PMI gets masked. In such cases, the perf
> interrupt handler will not find the active PMC values that had caused
> the overflow and thus leads to this message while replaying.
>=20
> Case 1: PMU Interrupt happens during replay of other interrupts and
> counter values gets cleared by PMU callbacks before replay:
>=20
> During replay of interrupts like timer, __do_irq and doorbell exception, =
we
> conditionally enable interrupts via may_hard_irq_enable(). This could
> potentially create a window to generate a PMI. Since irq soft mask is set
> to ALL_DISABLED, the PMI will get masked here. We could get IPIs run befo=
re
> perf interrupt is replayed and the PMU events could deleted or stopped.
> This will change the PMU SPR values and resets the counters. Snippet of
> ftrace log showing PMU callbacks invoked in "__do_irq":
>=20
> <idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
> <idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
> <idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
> <idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
> <<>>
> <idle>-0 [051] dnH. 132025441307770: generic_smp_call_function_single_int=
errupt <-smp_ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue <-smp_=
ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
> <idle>-0 [051] dnH. 132025441308206: power_pmu_disable <-perf_pmu_disable
> <idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
> <idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
> <idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx <-perf_event_upd=
ate_userpage
> <idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict <-perf_event_=
update_userpage
> <idle>-0 [051] dnH. 132025441308975: power_pmu_enable <-perf_pmu_enable
> <<>>
> <idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
> <idle>-0 [051] dns. 132025441311319: performance_monitor_exception <-repl=
ay_soft_interrupts
>=20
> Case 2: PMI's masked during local_* operations, example local_add.
> If the local_add operation happens within a local_irq_save, replay of
> PMI will be during local_irq_restore. Similar to case 1, this could
> also create a window before replay where PMU events gets deleted or
> stopped.
>=20
> Patch adds a fix to update the PMU callback functions (del,stop,enable) t=
o
> check for pending perf interrupt. If there is an overflown PMC and pendin=
g
> perf interrupt indicated in Paca or by PMAO bit set in MMCR0, clear the P=
MI
> bit in paca to drop that sample. Also clear the MMCR0 PMAO bit which
> otherwise could lead to spurious interrupts in some corner cases. Example=
,
> a timer after power_pmu_del which will re-enable interrupts since PMI is
> cleared and triggers a PMI again since PMAO bit is still set. Another
> condition occures if had disabled MSR[EE] right before perf interrupt
> came in. Re-enabling interrupt will trigger PMI since PMAO is still set.
> But fails to find valid overflow if PMC get cleared before enabling EE.
>=20
> We can't just replay PMI any time. Hence this approach is preferred rathe=
r
> than replaying PMI before resetting overflown PMC. Patch also documents
> core-book3s on a race condition which can trigger these PMC messages duri=
ng
> idle path in PowerNV.
>=20
> Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts an=
d replay them")
> Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>

I would say you can leave ^ this line out. You and Maddy did the hard=20
work of coming up with the fix, I just suggested a few minor changes.

> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 19 ++++++++
>  arch/powerpc/perf/core-book3s.c   | 77 +++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 56a98936a6a9..7e192bd8253b 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -215,6 +215,23 @@ static inline bool arch_irqs_disabled(void)
>  	return arch_irqs_disabled_flags(arch_local_save_flags());
>  }
> =20
> +static inline int get_clear_pmi_irq_pending(void)
> +{
> +	/*
> +	 * Some corner cases could clear the PMU counter overflow
> +	 * while a masked PMI is pending. One of such case is
> +	 * when a PMI happens during interrupt replay and perf
> +	 * counter values gets cleared by PMU callbacks before
> +	 * replay. So the pending PMI must be cleared here.
> +	 */
> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
> +		return 1;
> +	}
> +	return 0;
> +}

This is fine, if you respin it, you could make it return bool, and put=20
the warning under if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)).

> +
>  #ifdef CONFIG_PPC_BOOK3S
>  /*
>   * To support disabling and enabling of irq with PMI, set of
> @@ -391,6 +408,8 @@ static inline bool arch_irq_disabled_regs(struct pt_r=
egs *regs)
> =20
>  static inline void may_hard_irq_enable(void) { }
> =20
> +static inline int get_clear_pmi_irq_pending(void) { return 0; }
> +
>  static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, un=
signed long val)
>  {
>  }
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index 766f064f00fb..6ddac1b913fa 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -847,6 +847,20 @@ static void write_pmc(int idx, unsigned long val)
>  	}
>  }
> =20
> +static int pmc_overflown(int idx)
> +{
> +	unsigned long val[8];
> +	int i;
> +
> +	for (i =3D 0; i < ppmu->n_counter; i++)
> +		val[i] =3D read_pmc(i + 1);
> +
> +	if ((int)val[idx-1] < 0)
> +		return 1;
> +
> +	return 0;

I don't know the PMU very well -- do you have to read all counters, or=20
can you just read_pmc(idx)?

> +}
> +
>  /* Called from sysrq_handle_showregs() */
>  void perf_event_print_debug(void)
>  {
> @@ -1438,6 +1452,17 @@ static void power_pmu_enable(struct pmu *pmu)
>  		event =3D cpuhw->event[i];
>  		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + 1) {
>  			power_pmu_read(event);
> +			/*
> +			 * if the PMC corresponding to event->hw.idx is
> +			 * overflown, check if there is any pending perf
> +			 * interrupt set in paca. If so, disable the interrupt
> +			 * by clearing the paca bit for PMI since we are going
> +			 * to reset the PMC. power_pmu_enable will reset PMAO bit
> +			 * of MMCR0 while enabling the event. So PMAO check
> +			 * is not needed here (versus PMAO check done in del/stop).
> +			 */
> +			if (pmc_overflown(event->hw.idx))
> +				get_clear_pmi_irq_pending();

power_pmu_read(event) is already reading the PMC, so I wonder if you=20
could just take that value directly. It's in event->hw.prev_count, I=20
think?

>  			write_pmc(event->hw.idx, 0);
>  			event->hw.idx =3D 0;
>  		}
> @@ -1474,6 +1499,10 @@ static void power_pmu_enable(struct pmu *pmu)
>  		event->hw.idx =3D idx;
>  		if (event->hw.state & PERF_HES_STOPPED)
>  			val =3D 0;
> +
> +		/* See above for get_clear_pmi_irq_pending */
> +		if (pmc_overflown(event->hw.idx))
> +			get_clear_pmi_irq_pending();

Sorry, not sure of why this is done here. Wouldn't the PMC have already=20
been observed to be overflown and pending PMI cleared by the previous
check?

>  		write_pmc(idx, val);
> =20
>  		perf_event_update_userpage(event);
> @@ -1619,6 +1648,7 @@ static void power_pmu_del(struct perf_event *event,=
 int ef_flags)
>  	struct cpu_hw_events *cpuhw;
>  	long i;
>  	unsigned long flags;
> +	unsigned long val_mmcr0;
> =20
>  	local_irq_save(flags);
>  	perf_pmu_disable(event->pmu);
> @@ -1636,6 +1666,23 @@ static void power_pmu_del(struct perf_event *event=
, int ef_flags)
>  			--cpuhw->n_events;
>  			ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
>  			if (event->hw.idx) {
> +				/*
> +				 * if the PMC corresponding to event->hw.idx is
> +				 * overflown, check if there is any pending perf
> +				 * interrupt set in paca or indicated by PMAO bit
> +				 * in MMCR0. If so, disable the interrupt and clear
> +				 * the MMCR0 PMAO bit since we are going to reset
> +				 * the PMC and delete the event.
> +				 */
> +				if (pmc_overflown(event->hw.idx)) {
> +					if ((get_clear_pmi_irq_pending() | (mfspr(SPRN_MMCR0) & MMCR0_PMAO)=
)) {
> +						val_mmcr0 =3D mfspr(SPRN_MMCR0);
> +						val_mmcr0 &=3D ~MMCR0_PMAO;
> +						write_mmcr0(cpuhw, val_mmcr0);
> +						mb();
> +						isync();
> +					}
> +				}

Again showing my ignorance of PMU and powerpc/perf, power_pmu_disable=20
will have already cleared PMAO? How is it possible for it to become
set again here?

I can see how a PMI can be marked pending after local_irq_save and=20
before perf_pmu_disable call... I wonder if clearing that pending bit=20
should be done in power_pmu_disable (which matches the same place where=20
we clear PMAO)?


>  				write_pmc(event->hw.idx, 0);
>  				event->hw.idx =3D 0;
>  			}
> @@ -1705,6 +1752,8 @@ static void power_pmu_start(struct perf_event *even=
t, int ef_flags)
>  static void power_pmu_stop(struct perf_event *event, int ef_flags)
>  {
>  	unsigned long flags;
> +	unsigned long val_mmcr0;
> +	struct cpu_hw_events *cpuhw;
> =20
>  	if (!event->hw.idx || !event->hw.sample_period)
>  		return;
> @@ -1713,8 +1762,27 @@ static void power_pmu_stop(struct perf_event *even=
t, int ef_flags)
>  		return;
> =20
>  	local_irq_save(flags);
> +	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>  	perf_pmu_disable(event->pmu);
> =20
> +	/*
> +	 * if the PMC corresponding to event->hw.idx is
> +	 * overflown, check if there is any pending perf
> +	 * interrupt set in paca or indicated by PMAO bit
> +	 * in MMCR0. If so, disable the interrupt and clear
> +	 * the MMCR0 PMAO bit since we are going to reset
> +	 * the PMC.
> +	 */
> +	if (pmc_overflown(event->hw.idx)) {
> +		if ((get_clear_pmi_irq_pending() | (mfspr(SPRN_MMCR0) & MMCR0_PMAO))) =
{
> +			val_mmcr0 =3D mfspr(SPRN_MMCR0);
> +			val_mmcr0 &=3D ~MMCR0_PMAO;
> +			write_mmcr0(cpuhw, val_mmcr0);
> +			mb();
> +			isync();
> +		}
> +	}
> +
>  	power_pmu_read(event);
>  	event->hw.state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
>  	write_pmc(event->hw.idx, 0);

Same question for this one. Also would be good to put this pattern into=20
a helper function if it has to be duplicated.

Thanks,
Nick

> @@ -2343,6 +2411,15 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)
>  			}
>  		}
>  	}
> +
> +	/*
> +	 * During system wide profling or while specific CPU
> +	 * is monitored for an event, some corner cases could
> +	 * cause PMC to overflow in idle path. This will trigger
> +	 * a PMI after waking up from idle. Since counter values
> +	 * are _not_ saved/restored in idle path, can lead to
> +	 * below "Can't find PMC" message.
> +	 */
>  	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
>  		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
> =20
> --=20
> 2.26.2
>=20
>=20
