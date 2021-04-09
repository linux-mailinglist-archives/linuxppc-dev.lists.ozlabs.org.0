Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC33359122
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 03:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGg4q0TPJz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=biXKcIU3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=biXKcIU3; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGg4M4CR8z303x
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 11:08:34 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d8so1919382plh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Pvfn97Y2e4FYKrZhzRB7ICJByDSrNEmC7Ce6vJy0Y/k=;
 b=biXKcIU3CPivAJXA1y7G2xr9FEZhmvDsSRyNqI4XAQ93T55L2Tv7S/NmXhlRjhgJgR
 MFbcVGc2DG6bDzYWE0urTAV1JH0igVmS9bgnpR9e1vai/76wjY4MnQJyp2COjjYE3fAs
 erfezsSW4bZTy4/wqPMsJc6d1Swpkqe/PN1+gF4DnrLdHRFu4ILiZFUan77l97vzX8Hd
 Xd59u68XWeZ8J7Fi76Mkjg5CW/5LlOSjEK5whWGQRVdxy43ELOS3TbweeBYabMOB/iAD
 2wmP71GeBK4zzalK6eQsBOrom0JurlsazQR9DcL1PvkmYJUMQ4/u3qcAvFaLcpKBSjLx
 54qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Pvfn97Y2e4FYKrZhzRB7ICJByDSrNEmC7Ce6vJy0Y/k=;
 b=m4hQSzBqysqYnzqzjZeIIaluoeb+VTmyvipY/IaY7RTZ55oINVeca2RbLate6pK0mb
 rxwcD+uGVNYQcl+v6cWoj7lgPjQHsUwan/gQrS/kuO0lFFYUCKhxaxqOJCy2MqE53u7S
 wb8VM0Ne7IE1sikWqVSHGgHYgTeBVm0kFfTDoR6ku2NJG8NSHvrAAP4IXgDU55Un5l+x
 eacjzeo+eSElNJPQyhX7wMn4Fi2YjDwLRKQ0KDvsec3/RdiJRcWIzEhxjdGxd+044rrX
 2BpurAVO0jFXugO4MnW7NA80O0seCeuxCccQ5BuTR/tIHrCWtl0LiP/Yg5v1JzRS0nRU
 adOQ==
X-Gm-Message-State: AOAM5320FpJi0LmfjsWy2ufsZzJHpRiEh4NLNvR4PcQZv3xmISGHqTsv
 XHRCksJXk8q0M1B+KEQZ4Jk=
X-Google-Smtp-Source: ABdhPJxoigvBLWGDISzXe+D2Mf7RjBUsbUEeoof12uyRJ62vNBFnQKTuDMGVmsnw/fID9HTcogtxrw==
X-Received: by 2002:a17:90b:315:: with SMTP id
 ay21mr10996670pjb.72.1617930509996; 
 Thu, 08 Apr 2021 18:08:29 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id y7sm536832pfq.70.2021.04.08.18.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 18:08:29 -0700 (PDT)
Date: Fri, 09 Apr 2021 11:08:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1617927471.vhjclnvhj3.astroid@bobo.none>
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

I was going to nitpick "overflown" here as something birds do, but some
sources says overflown is okay for past tense.

You could use "overflowed" for that, but I understand the issue with the=20
word: you are talking about counters that are currently in an "overflow"=20
state, but the overflow occurred in the past and is not still happening
so you "overflowing" doesn't exactly fit either.

overflown kind of works for some reason you can kind of use it for
present tense!

Excerpts from Athira Rajeev's message of April 7, 2021 12:47 am:
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
> to ALL_DISABLED, the PMI will get masked here.

I wonder if may_hard_irq_enable shouldn't enable if PMI is soft
disabled. And also maybe replay should not set ALL_DISABLED if
there are no PMI interrupts pending.

Still, I think those are a bit more tricky and might take a while
to get right or just not be worth while, so I think your patch is
fine.

> We could get IPIs run before
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

Here as well perhaps PMIs should be replayed if they are unmasked
even if other interrupts are still masked. Again that might be more
complexity than it's worth.

>=20
> Patch adds a fix to update the PMU callback functions (del,stop,enable) t=
o
> check for pending perf interrupt. If there is an overflown PMC and pendin=
g
> perf interrupt indicated in Paca, clear the PMI bit in paca to drop that
> sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit which
> otherwise could lead to spurious interrupts in some corner cases. Example=
,
> a timer after power_pmu_del which will re-enable interrupts since PMI is
> cleared and triggers a PMI again since PMAO bit is still set.
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
>  arch/powerpc/include/asm/pmc.h  | 11 +++++++++
>  arch/powerpc/perf/core-book3s.c | 55 +++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/pmc.h b/arch/powerpc/include/asm/pm=
c.h
> index c6bbe9778d3c..97b4bd8de25b 100644
> --- a/arch/powerpc/include/asm/pmc.h
> +++ b/arch/powerpc/include/asm/pmc.h
> @@ -34,11 +34,22 @@ static inline void ppc_set_pmu_inuse(int inuse)
>  #endif
>  }
> =20
> +static inline int clear_paca_irq_pmi(void)
> +{
> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
> +		return 1;
> +	}
> +	return 0;
> +}

Could you put this in arch/powerpc/include/asm/hw_irq.h and
rather than paca_irq, call it irq_pending perhaps

  clear_pmi_irq_pending()

  get_clear_pmi_irq_pending() if you're also testing it.

Could you add a little comment about the corner cases above it too?
The root cause seem to be interrupt replay while a masked PMI is
pending can result in other interrupts arriving which clear the PMU
overflow so the pending PMI must be cleared.

> +
>  extern void power4_enable_pmcs(void);
> =20
>  #else /* CONFIG_PPC64 */
> =20
>  static inline void ppc_set_pmu_inuse(int inuse) { }
> +static inline int clear_paca_irq_pmi(void) { return 0; }
> =20
>  #endif
> =20
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index 766f064f00fb..18ca3c90f866 100644
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
> +}
> +
>  /* Called from sysrq_handle_showregs() */
>  void perf_event_print_debug(void)
>  {
> @@ -1438,6 +1452,15 @@ static void power_pmu_enable(struct pmu *pmu)
>  		event =3D cpuhw->event[i];
>  		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + 1) {
>  			power_pmu_read(event);
> +			/*
> +			 * if the PMC corresponding to event->hw.idx is
> +			 * overflown, check if there is any pending perf
> +			 * interrupt set in paca. If so, disable the interrupt
> +			 * by clearing the paca bit for PMI since we are going
> +			 * to reset the PMC.
> +			 */
> +			if (pmc_overflown(event->hw.idx))
> +				clear_paca_irq_pmi();

If the pmc is not overflown, could there still be a PMI pending?

>  			write_pmc(event->hw.idx, 0);
>  			event->hw.idx =3D 0;
>  		}
> @@ -1474,6 +1497,10 @@ static void power_pmu_enable(struct pmu *pmu)
>  		event->hw.idx =3D idx;
>  		if (event->hw.state & PERF_HES_STOPPED)
>  			val =3D 0;
> +
> +		/* See above for clear_paca_irq_pmi */
> +		if (pmc_overflown(event->hw.idx))
> +			clear_paca_irq_pmi();
>  		write_pmc(idx, val);
> =20
>  		perf_event_update_userpage(event);
> @@ -1619,6 +1646,7 @@ static void power_pmu_del(struct perf_event *event,=
 int ef_flags)
>  	struct cpu_hw_events *cpuhw;
>  	long i;
>  	unsigned long flags;
> +	unsigned long val_mmcr0;
> =20
>  	local_irq_save(flags);
>  	perf_pmu_disable(event->pmu);
> @@ -1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event *event=
, int ef_flags)
>  			--cpuhw->n_events;
>  			ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
>  			if (event->hw.idx) {
> +				/*
> +				 * if the PMC corresponding to event->hw.idx is
> +				 * overflown, check if there is any pending perf
> +				 * interrupt set in paca. If so, disable the interrupt
> +				 * and clear the MMCR0 PMAO bit since we are going
> +				 * to reset the PMC and delete the event.
> +				 */
> +				if (pmc_overflown(event->hw.idx)) {
> +					if (clear_paca_irq_pmi()) {
> +						val_mmcr0 =3D mfspr(SPRN_MMCR0);
> +						val_mmcr0 &=3D ~MMCR0_PMAO;
> +						write_mmcr0(cpuhw, val_mmcr0);
> +						mb();
> +						isync();

I don't know the perf subsystem, but just out of curiosity why does
MMCR0 need to be cleared only in this case? What if we disabled MSR[EE]
right before a perf interrupt came in, so we don't get a pending PMI
but the condition is still close to the same.

> +				}
>  				write_pmc(event->hw.idx, 0);
>  				event->hw.idx =3D 0;
>  			}
> @@ -1714,6 +1758,8 @@ static void power_pmu_stop(struct perf_event *event=
, int ef_flags)
> =20
>  	local_irq_save(flags);
>  	perf_pmu_disable(event->pmu);
> +	if (pmc_overflown(event->hw.idx))
> +		clear_paca_irq_pmi();
> =20
>  	power_pmu_read(event);
>  	event->hw.state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
> @@ -2343,6 +2389,15 @@ static void __perf_event_interrupt(struct pt_regs =
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
