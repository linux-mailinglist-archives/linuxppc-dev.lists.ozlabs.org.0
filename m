Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16435B8D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 05:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJYc752bzz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:09:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Kavtj3wt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kavtj3wt; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJYbf6jc9z30BD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 13:08:45 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6278077pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=TbNEvfV3HG4tvDyC6gjgBIRyW/7acgY9eJKUyI6hZ+c=;
 b=Kavtj3wtg/GTTiAEadgUSFj2btmKZodbAVhC+GEwkrLPSCwmdrk/I+OIDFENrH62Is
 FWkihfGRb3eMPepvXn3CmwbY6uLZvPUryzJRX2Mi0/Ctu51NKxFWiTH4NI9MXhSnWxJr
 hc1ZcxklOiohMkHN/3Uwkoxx86yVs65dqO5K66PPUmD0gVtLPyKzuagII6u6LE2Zb4Bx
 bYplp3PT6JEYRynZqS2mcUQWwLLn84WU8DmaF948eRhaGmm2oawJ1DWbJTPOt1swvvZN
 8tPuiXbKwNwpB67UE/KgqQvFBXh7YoYiFtJ3vXTH0zPAmoqcaDTR3KfZzGQZBaFG5bXC
 nReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=TbNEvfV3HG4tvDyC6gjgBIRyW/7acgY9eJKUyI6hZ+c=;
 b=MP6U+Ym+BE2xw9VeiZT4euFt+wrIvlEvcIr9lNzpwBkh2kS//FVR2/rxJRKVYz12V1
 hcZsu+Pu7Wq7QtowBgtsMrVL+bl44N7wHqP0tQ2d842ugTSuAmWtxomX3OhJgVYdQwfD
 WZEsobUUjsgL+ZaNsDuxn69DJ8N7uhyDfSoC0g7O7cU+gE6ii6Dv8p5woLcP5j/CYIjj
 s7PDVIYJC6S4BpbgJAJ2S+k+1C/XdRmBurIWM8haTKswUpsjhzkKrWi6kU6+Qca50Ty8
 R/J2hQlR8W8tUfQwhBXORieD7JlPveplRwN9rH4ZhQfw7EuYCXCx6ZWfGr23qy3IIGCm
 C13Q==
X-Gm-Message-State: AOAM53325cpA9ofjOmmCUdPtb6l3SojhwqkFlTlQASW/AXp8Z5/4UrBw
 z+saUpUvBrXAkcpk+7VCGfE=
X-Google-Smtp-Source: ABdhPJw007wQAi5HUcywDM8a6lKt5omdnoZR5ikQxKbCJkuYJqS6e5VTjvXX6goiH82ZAvc968Up4g==
X-Received: by 2002:a17:90b:120e:: with SMTP id
 gl14mr21072238pjb.196.1618196921907; 
 Sun, 11 Apr 2021 20:08:41 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id mv13sm1949507pjb.29.2021.04.11.20.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 20:08:41 -0700 (PDT)
Date: Mon, 12 Apr 2021 13:08:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617927471.vhjclnvhj3.astroid@bobo.none>
 <6F7D0CD6-EA13-4D6F-9592-98CCC4537133@linux.vnet.ibm.com>
In-Reply-To: <6F7D0CD6-EA13-4D6F-9592-98CCC4537133@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1618195598.pijmcbmr3o.astroid@bobo.none>
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
Cc: "nasastry@in.ibm.com" <nasastry@in.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of April 9, 2021 10:53 pm:
>=20
>=20
>> On 09-Apr-2021, at 6:38 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
> Hi Nick,
>=20
> Thanks for checking the patch and sharing review comments.
>=20
>> I was going to nitpick "overflown" here as something birds do, but some
>> sources says overflown is okay for past tense.
>>=20
>> You could use "overflowed" for that, but I understand the issue with the=
=20
>> word: you are talking about counters that are currently in an "overflow"=
=20
>> state, but the overflow occurred in the past and is not still happening
>> so you "overflowing" doesn't exactly fit either.
>>=20
>> overflown kind of works for some reason you can kind of use it for
>> present tense!
>=20
> Ok sure, Yes counter is currently in an =E2=80=9Coverflow=E2=80=9D state.
>=20
>>=20
>> Excerpts from Athira Rajeev's message of April 7, 2021 12:47 am:
>>> Running perf fuzzer showed below in dmesg logs:
>>> "Can't find PMC that caused IRQ"
>>>=20
>>> This means a PMU exception happened, but none of the PMC's (Performance
>>> Monitor Counter) were found to be overflown. There are some corner case=
s
>>> that clears the PMCs after PMI gets masked. In such cases, the perf
>>> interrupt handler will not find the active PMC values that had caused
>>> the overflow and thus leads to this message while replaying.
>>>=20
>>> Case 1: PMU Interrupt happens during replay of other interrupts and
>>> counter values gets cleared by PMU callbacks before replay:
>>>=20
>>> During replay of interrupts like timer, __do_irq and doorbell exception=
, we
>>> conditionally enable interrupts via may_hard_irq_enable(). This could
>>> potentially create a window to generate a PMI. Since irq soft mask is s=
et
>>> to ALL_DISABLED, the PMI will get masked here.
>>=20
>> I wonder if may_hard_irq_enable shouldn't enable if PMI is soft
>> disabled. And also maybe replay should not set ALL_DISABLED if
>> there are no PMI interrupts pending.
>>=20
>> Still, I think those are a bit more tricky and might take a while
>> to get right or just not be worth while, so I think your patch is
>> fine.
>=20
> Ok Nick.
>>=20
>>> We could get IPIs run before
>>> perf interrupt is replayed and the PMU events could deleted or stopped.
>>> This will change the PMU SPR values and resets the counters. Snippet of
>>> ftrace log showing PMU callbacks invoked in "__do_irq":
>>>=20
>>> <idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
>>> <idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
>>> <idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
>>> <idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
>>> <<>>
>>> <idle>-0 [051] dnH. 132025441307770: generic_smp_call_function_single_i=
nterrupt <-smp_ipi_demux_relaxed
>>> <idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue <-sm=
p_ipi_demux_relaxed
>>> <idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
>>> <idle>-0 [051] dnH. 132025441308206: power_pmu_disable <-perf_pmu_disab=
le
>>> <idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
>>> <idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
>>> <idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
>>> <idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc <-power_pmu_del
>>> <idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
>>> <idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx <-perf_event_u=
pdate_userpage
>>> <idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict <-perf_even=
t_update_userpage
>>> <idle>-0 [051] dnH. 132025441308975: power_pmu_enable <-perf_pmu_enable
>>> <<>>
>>> <idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
>>> <idle>-0 [051] dns. 132025441311319: performance_monitor_exception <-re=
play_soft_interrupts
>>>=20
>>> Case 2: PMI's masked during local_* operations, example local_add.
>>> If the local_add operation happens within a local_irq_save, replay of
>>> PMI will be during local_irq_restore. Similar to case 1, this could
>>> also create a window before replay where PMU events gets deleted or
>>> stopped.
>>=20
>> Here as well perhaps PMIs should be replayed if they are unmasked
>> even if other interrupts are still masked. Again that might be more
>> complexity than it's worth.
> Ok..
>=20
>>=20
>>>=20
>>> Patch adds a fix to update the PMU callback functions (del,stop,enable)=
 to
>>> check for pending perf interrupt. If there is an overflown PMC and pend=
ing
>>> perf interrupt indicated in Paca, clear the PMI bit in paca to drop tha=
t
>>> sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit which
>>> otherwise could lead to spurious interrupts in some corner cases. Examp=
le,
>>> a timer after power_pmu_del which will re-enable interrupts since PMI i=
s
>>> cleared and triggers a PMI again since PMAO bit is still set.
>>>=20
>>> We can't just replay PMI any time. Hence this approach is preferred rat=
her
>>> than replaying PMI before resetting overflown PMC. Patch also documents
>>> core-book3s on a race condition which can trigger these PMC messages du=
ring
>>> idle path in PowerNV.
>>>=20
>>> Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts =
and replay them")
>>> Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
>>> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
>>> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> arch/powerpc/include/asm/pmc.h  | 11 +++++++++
>>> arch/powerpc/perf/core-book3s.c | 55 ++++++++++++++++++++++++++++++++++=
+++++++
>>> 2 files changed, 66 insertions(+)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/pmc.h b/arch/powerpc/include/asm/=
pmc.h
>>> index c6bbe9778d3c..97b4bd8de25b 100644
>>> --- a/arch/powerpc/include/asm/pmc.h
>>> +++ b/arch/powerpc/include/asm/pmc.h
>>> @@ -34,11 +34,22 @@ static inline void ppc_set_pmu_inuse(int inuse)
>>> #endif
>>> }
>>>=20
>>> +static inline int clear_paca_irq_pmi(void)
>>> +{
>>> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
>>> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
>>> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
>>> +		return 1;
>>> +	}
>>> +	return 0;
>>> +}
>>=20
>> Could you put this in arch/powerpc/include/asm/hw_irq.h and
>> rather than paca_irq, call it irq_pending perhaps
>>=20
>>  clear_pmi_irq_pending()
>>=20
>>  get_clear_pmi_irq_pending() if you're also testing it.
>=20
> Sure,  I will use =E2=80=9Cget_clear_pmi_irq_pending()=E2=80=9D and try w=
ith moving this to arch/powerpc/include/asm/hw_irq.h
>=20
>>=20
>> Could you add a little comment about the corner cases above it too?
>> The root cause seem to be interrupt replay while a masked PMI is
>> pending can result in other interrupts arriving which clear the PMU
>> overflow so the pending PMI must be cleared.
>=20
> Ok, I will add comment and fix this in next version.
>=20
>>=20
>>> +
>>> extern void power4_enable_pmcs(void);
>>>=20
>>> #else /* CONFIG_PPC64 */
>>>=20
>>> static inline void ppc_set_pmu_inuse(int inuse) { }
>>> +static inline int clear_paca_irq_pmi(void) { return 0; }
>>>=20
>>> #endif
>>>=20
>>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-b=
ook3s.c
>>> index 766f064f00fb..18ca3c90f866 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -847,6 +847,20 @@ static void write_pmc(int idx, unsigned long val)
>>> 	}
>>> }
>>>=20
>>> +static int pmc_overflown(int idx)
>>> +{
>>> +	unsigned long val[8];
>>> +	int i;
>>> +
>>> +	for (i =3D 0; i < ppmu->n_counter; i++)
>>> +		val[i] =3D read_pmc(i + 1);
>>> +
>>> +	if ((int)val[idx-1] < 0)
>>> +		return 1;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> /* Called from sysrq_handle_showregs() */
>>> void perf_event_print_debug(void)
>>> {
>>> @@ -1438,6 +1452,15 @@ static void power_pmu_enable(struct pmu *pmu)
>>> 		event =3D cpuhw->event[i];
>>> 		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + 1) {
>>> 			power_pmu_read(event);
>>> +			/*
>>> +			 * if the PMC corresponding to event->hw.idx is
>>> +			 * overflown, check if there is any pending perf
>>> +			 * interrupt set in paca. If so, disable the interrupt
>>> +			 * by clearing the paca bit for PMI since we are going
>>> +			 * to reset the PMC.
>>> +			 */
>>> +			if (pmc_overflown(event->hw.idx))
>>> +				clear_paca_irq_pmi();
>>=20
>> If the pmc is not overflown, could there still be a PMI pending?
>=20
> I didn=E2=80=99t hit that scenario where PMI is pending without an overfl=
own PMC.
> Also I believe if such a case happens, we will need an investigation ther=
e. It could be a different case to be handled.

Okay, so a PMI will not occur without an overflown PMC, and the=20
overflown PMC will only be cleared in places where you also clear a=20
possible pending PMI?

>=20
> I actually considered below two points for adding this PMC check instead =
of just clearing the PMI.
>=20
> 1. Make sure we are not masking any bug here by just clearing PACA_IRQ_PM=
I.
> Ideally if PMI is set in irq_happened, it means there was a counter overf=
low.
> 2. If there is more than one PMU event, say two events. Make sure we are =
clearing PMI only for the
> event whose counter is overflown.

Those are good points. Would you consider also adding a warning for the=20
case of no PMCs overflown but PMI is pending? That way you might have more=20
information about such a problem if it ever happens.

We try to add a good deal of warnings around the soft-mask code because=20
it's very tricky to change without causing more bugs, so even for future
changes to the code this would probably be useful.

>>> @@ -1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event *eve=
nt, int ef_flags)
>>> 			--cpuhw->n_events;
>>> 			ppmu->disable_pmc(event->hw.idx - 1, &cpuhw->mmcr);
>>> 			if (event->hw.idx) {
>>> +				/*
>>> +				 * if the PMC corresponding to event->hw.idx is
>>> +				 * overflown, check if there is any pending perf
>>> +				 * interrupt set in paca. If so, disable the interrupt
>>> +				 * and clear the MMCR0 PMAO bit since we are going
>>> +				 * to reset the PMC and delete the event.
>>> +				 */
>>> +				if (pmc_overflown(event->hw.idx)) {
>>> +					if (clear_paca_irq_pmi()) {
>>> +						val_mmcr0 =3D mfspr(SPRN_MMCR0);
>>> +						val_mmcr0 &=3D ~MMCR0_PMAO;
>>> +						write_mmcr0(cpuhw, val_mmcr0);
>>> +						mb();
>>> +						isync();
>>=20
>> I don't know the perf subsystem, but just out of curiosity why does
>> MMCR0 need to be cleared only in this case?
>=20
> I got a corner case in power_pmu_del, with only clearing PACA_IRQ_PMI and=
 without resetting MMCR0 PMAO bit.
> Here is the flow:
>=20
> 1. We clear the PMI bit Paca, but MMCR0 has the PMAO bit still set. PMAO =
bit indicates a PMI has occurred.
> 2. A timer interrupt is replayed after power_pmu_del which does a =E2=80=
=9Cmay_hard_irq_enable=E2=80=9D.
> This will re-enable interrupts and triggers a PMI again since PMAO bit is=
 still set.
>=20
> So clear PMAO bit to avoid such spurious interrupts.
> Ftrace logs showing the same with some debug trace_printks :
>=20
>      <idle>-0    [134] d.h. 327287888478: power_pmu_del <-event_sched_out=
.isra.126
>      <<>>    Here we cleared the PMI
>      <idle>-0    [134] d.h. 327287889272: write_pmc <-power_pmu_del
>      <idle>-0    [134] d.h. 327287889346: rcu_read_unlock_strict <-perf_e=
vent_update_userpage
>      <idle>-0    [134] d.h. 327287889711: power_pmu_del: In power_pmu_del=
 MMCR0 is 82004090, local_paca->irq_happened is 9
>      <idle>-0    [134] d.h. 327287889811: power_pmu_enable <-perf_pmu_ena=
ble
>      <idle>-0    [134] d.h. 327287889982: irq_exit <-doorbell_exception
>      <idle>-0    [134] d... 327287890053: idle_cpu <-irq_exit
>      <idle>-0    [134] d... 327287890158: tick_nohz_irq_exit <-irq_exit
>      <idle>-0    [134] d... 327287890219: ktime_get <-tick_nohz_irq_exit
>      <idle>-0    [134] d... 327287890328: replay_soft_interrupts <-interr=
upt_exit_kernel_prepare
>      <idle>-0    [134] d... 327287890399: irq_enter <-timer_interrupt
>      <<>>
>      <idle>-0    [134] d.h. 327287891163: timer_interrupt: Before may_har=
d_irq_enable MMCR0 is 82004090, local_paca->irq_happened is 1
>      <<>>
>      <idle>-0    [134] d.h. 327287894310: timer_interrupt: After may_hard=
_irq_enable MMCR0 is 82004090, local_paca->irq_happened is 21
>=20
> In case of other callbacks like pmu enable, we are programming MMCR0. But=
 in case of event getting deleted, there is no
> way we clear PMAO unless an event gets scheduled again in that cpu. Hence=
 added this check only in pmu_del callback.
> =20
>=20
>> What if we disabled MSR[EE]
>> right before a perf interrupt came in, so we don't get a pending PMI
>> but the condition is still close to the same.
>=20
> Nick, I didn=E2=80=99t get this question exactly. Can you please help exp=
lain a bit ?
> From my understanding, consider that we disabled MSR[EE] before perf inte=
rrupt came in.
> So once the interrupts are re-enabled:
>=20
> 1. If soft mask is set to IRQS_DISABLED, perf interrupt will be triggered=
 as NMI.
> 2. In case of ALL_DISABLED, it will be masked for replay. If PMU callback=
s are invoked before replay,
> our present patch will take care of clearing PMI in corner cases.

Well I'm wondering about the same PMAO bug. Above you said:

  1. We clear the PMI bit Paca, but MMCR0 has the PMAO bit still set. PMAO =
bit indicates a PMI has occurred.
  2. A timer interrupt is replayed after power_pmu_del which does a =E2=80=
=9Cmay_hard_irq_enable=E2=80=9D.
  This will re-enable interrupts and triggers a PMI again since PMAO bit is=
 still set.

So in this situation, what if we had disabled interrupts and that had=20
caused MSR[EE] to be cleared (let's say due to a PCI interrupt=20
arriving), and then a PMC overflows and causes PMAO to be set.

Then you run this code:

+				/*
+				 * if the PMC corresponding to event->hw.idx is
+				 * overflown, check if there is any pending perf
+				 * interrupt set in paca. If so, disable the interrupt
+				 * and clear the MMCR0 PMAO bit since we are going
+				 * to reset the PMC and delete the event.
+				 */
+				if (pmc_overflown(event->hw.idx)) {
+					if (clear_paca_irq_pmi()) {
+						val_mmcr0 =3D mfspr(SPRN_MMCR0);
+						val_mmcr0 &=3D ~MMCR0_PMAO;
+						write_mmcr0(cpuhw, val_mmcr0);
+						mb();
+						isync();

And this does not clear PMAO because we had no pending PMI, but we still=20
have the pending PMAO exception.

The only difference was that MSR[EE] happened to be disabled when the=20
PMC overflowed so no pending PMI was recorded, but otherwise everything=20
is the same so I wonder why it's not subject to the same problem?

Thanks,
Nick
