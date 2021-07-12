Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048A3C4140
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 04:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNSc72Bmmz3bPN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 12:37:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rjHPyQKz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rjHPyQKz; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNSbg1Jd9z2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 12:37:34 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so9561918pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=r3ceEGtyV8CM+3ovLxgQjRD296BVQe2hhoR1fBnHG/g=;
 b=rjHPyQKz1ruRyQUtwQ/w/m/Z9swda5yB8eaZJf1p4dT970Nx8LmsZRN0wgKihPFv+e
 xU03no3E8czqa2Op8BB78BXiCBVHRHSq/x0mW5idxhDEKkwMi6gz1mWLEvJmoRh28ZBw
 CyAoTViyWm0mulEmh8BfnrLHjtVd9A1vHih5mLoU3PX2nKIJz0MxiX5+DquLssCV40yC
 dKApDggWUh/R4df0MAQUexh1ejgznz8FJLspT6GlptwMKtlYvJ92/i9NjD3WOWQOK9k4
 hvUnaQ1ahqKc4hrwlaN/hKSAjvo7ZnLGQFlfVZ4Fg84OxmBh2rulNBPgIvo66Souo5+4
 Pccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=r3ceEGtyV8CM+3ovLxgQjRD296BVQe2hhoR1fBnHG/g=;
 b=NzRsPj78ocv1ImZfgVk3G8ZcLG4du1Z2SnbWAVNPy9p9Bh5umPK7mhJqkfpHKdPylL
 3wB0UkPNI1njDY6c4LfXjVUhhXLvvzJb4jMKg+9MAYscpzXkdDOAbwfXY1EPodTQgpNy
 DJaGBObogkoY56FOG7b+oDYgtpmzuSmAoM6iKCKXKCpxRxNo64A6u/cwWhX6tAPb0KU2
 ahFBJt9FpRvZ6yHGyXmsho7Nir1BJ9VY4P0hIiFOkZUAwwxudlY9sPCzNXZL1xrKUyTa
 oELf830O5djKWSEpPn4Vi1h7MjzjTz3TMqeB+Sn6WJQSCQqSpN8z8o1zoPQgg6EYlOYq
 P7vg==
X-Gm-Message-State: AOAM531ujjkJcqcVx1aC9Tz/PIeyWD4yNaU9B/U6N+2gTLCqZ6BkQ172
 1dQ2Etx92plDpfifzemq7pk=
X-Google-Smtp-Source: ABdhPJxAx3rlXNJzFoW1oTRr1CIysbKZjpoX7Ci6oePeBcu4NZFtYPhuW1oUNXpem1+izI/fq90sNg==
X-Received: by 2002:a17:90a:a511:: with SMTP id
 a17mr12144061pjq.69.1626057450501; 
 Sun, 11 Jul 2021 19:37:30 -0700 (PDT)
Received: from localhost (203-219-181-43.static.tpgi.com.au. [203.219.181.43])
 by smtp.gmail.com with ESMTPSA id
 u13sm13093466pfi.54.2021.07.11.19.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 19:37:30 -0700 (PDT)
Date: Mon, 12 Jul 2021 12:37:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V3 1/1] powerpc/perf: Fix PMU callbacks to clear pending
 PMI before resetting an overflown PMC
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1625932694-1525-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1625932694-1525-2-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1625932694-1525-2-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1626057060.c4ymz1d9vf.astroid@bobo.none>
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of July 11, 2021 1:58 am:
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
> Patch adds a fix to update the PMU callback function 'power_pmu_disable' =
to
> check for pending perf interrupt. If there is an overflown PMC and pendin=
g
> perf interrupt indicated in Paca, clear the PMI bit in paca to drop that
> sample. Clearing of PMI bit is done in 'power_pmu_disable' since disable =
is
> invoked before any event gets deleted/stopped. With this fix, if there ar=
e
> more than one event running in the PMU, there is a chance that we clear t=
he
> PMI bit for the event which is not getting deleted/stopped. The other
> events may still remain active. Hence to make sure we don't drop valid
> sample in such cases, another check is added in power_pmu_enable. This
> checks if there is an overflown PMC found among the active events and if
> so enable back the PMI bit. Two new helper functions are introduced to
> clear/set the PMI, ie 'clear_pmi_irq_pending' and 'set_pmi_irq_pending'.
>=20
> Also there are corner cases which results in performance monitor interrup=
ts
> getting triggered during power_pmu_disable. This happens since PMXE bit i=
s
> not cleared along with disabling of other MMCR0 bits in the pmu_disable.
> Such PMI's could leave the PMU running and could trigger PMI again which
> will set MMCR0 PMAO bit. This could lead to spurious interrupts in some
> corner cases. Example, a timer after power_pmu_del which will re-enable
> interrupts and triggers a PMI again since PMAO bit is still set. But fail=
s
> to find valid overflow since PMC get cleared in power_pmu_del. Patch
> fixes this by disabling PMXE along with disabling of other MMCR0 bits
> in power_pmu_disable.
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
> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 31 +++++++++++++++++++++++++
>  arch/powerpc/perf/core-book3s.c   | 49 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 21cc571..0a067bb 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -224,6 +224,34 @@ static inline bool arch_irqs_disabled(void)
>  	return arch_irqs_disabled_flags(arch_local_save_flags());
>  }
> =20
> +static inline void set_pmi_irq_pending(void)
> +{
> +	/*
> +	 * Invoked currently from PMU callback functions
> +	 * to set PMI bit in Paca. This has to be called
> +	 * with irq's disabled ( via hard_irq_disable ).
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +	get_paca()->irq_happened |=3D PACA_IRQ_PMI;
> +}
> +
> +static inline void clear_pmi_irq_pending(void)
> +{
> +	/*
> +	 * Some corner cases could clear the PMU counter overflow
> +	 * while a masked PMI is pending. One of such case is
> +	 * when a PMI happens during interrupt replay and perf
> +	 * counter values gets cleared by PMU callbacks before
> +	 * replay. So the pending PMI must be cleared here.
> +	 */
> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +			WARN_ON_ONCE(mfmsr() & MSR_EE);
> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;

I think you could just make this match set_pmi_irq_pending, that
is, always do the debug test, and remove the branch entirely.

> +	}
> +}
> +
>  #ifdef CONFIG_PPC_BOOK3S
>  /*
>   * To support disabling and enabling of irq with PMI, set of
> @@ -408,6 +436,9 @@ static inline void do_hard_irq_enable(void)
>  	BUILD_BUG();
>  }
> =20
> +static inline void clear_pmi_irq_pending(void) { }
> +static inline void set_pmi_irq_pending(void) { }
> +
>  static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, un=
signed long val)
>  {
>  }
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index bb0ee71..17463b2 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -848,6 +848,19 @@ static void write_pmc(int idx, unsigned long val)
>  	}
>  }
> =20
> +static int any_pmc_overflown(struct cpu_hw_events *cpuhw)
> +{
> +	int i, idx;
> +
> +	for (i =3D 0; i < cpuhw->n_events; i++) {
> +		idx =3D cpuhw->event[i]->hw.idx;
> +		if ((idx) && ((int)read_pmc(idx) < 0))
> +			return idx;
> +	}
> +
> +	return 0;
> +}
> +
>  /* Called from sysrq_handle_showregs() */
>  void perf_event_print_debug(void)
>  {
> @@ -1276,7 +1289,7 @@ static void power_pmu_disable(struct pmu *pmu)
>  		val  =3D mmcr0 =3D mfspr(SPRN_MMCR0);
>  		val |=3D MMCR0_FC;
>  		val &=3D ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | MMCR0_PMAO |
> -			 MMCR0_FC56);
> +			 MMCR0_PMXE | MMCR0_FC56);

Maybe a comment to say why you clear PMXE?

>  		/* Set mmcr0 PMCCEXT for p10 */
>  		if (ppmu->flags & PPMU_ARCH_31)
>  			val |=3D MMCR0_PMCCEXT;
> @@ -1290,6 +1303,16 @@ static void power_pmu_disable(struct pmu *pmu)
>  		mb();
>  		isync();
> =20
> +		/*
> +		 * If any of PMC corresponding to the active PMU
> +		 * events is overflown, check if there is any pending
> +		 * perf interrupt set in paca. If so, disable the interrupt
> +		 * by clearing the paca bit for PMI since we are disabling
> +		 * the PMU now.
> +		 */
> +		if (any_pmc_overflown(cpuhw))
> +			clear_pmi_irq_pending();

Is there a need for the any_pmc_overflown() check here? Could you just=20
clear unconditionally? Would it be a bug if no pmc was overflown but we
had a PMI pending?

> +
>  		val =3D mmcra =3D cpuhw->mmcr.mmcra;
> =20
>  		/*
> @@ -1381,6 +1404,15 @@ static void power_pmu_enable(struct pmu *pmu)
>  	 * (possibly updated for removal of events).
>  	 */
>  	if (!cpuhw->n_added) {
> +		/*
> +		 * If there is any active event with an overflown PMC
> +		 * value, Set back PACA_IRQ_PMI which would have got
> +		 * cleared in power_pmu_disable.
> +		 */
> +		hard_irq_disable();
> +		if (any_pmc_overflown(cpuhw))
> +			set_pmi_irq_pending();
> +
>  		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>  		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>  		if (ppmu->flags & PPMU_ARCH_31)
> @@ -2336,6 +2368,12 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)
>  				break;
>  			}
>  		}
> +		/*
> +		 * Check if PACA_IRQ_PMI is set any chance
> +		 * by set_pmi_irq_pending() when PMU was enabled
> +		 * after accounting for interrupts.

"Clear PACA_IRQ_PMI in case it was set by..." ?

Aside from those minor things,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> +		 */
> +		clear_pmi_irq_pending();
>  		if (!active)
>  			/* reset non active counters that have overflowed */
>  			write_pmc(i + 1, 0);
> @@ -2355,6 +2393,15 @@ static void __perf_event_interrupt(struct pt_regs =
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
> 1.8.3.1
>=20
>=20
