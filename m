Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A054359F68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGynW6wjrz3bTm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 22:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aE8MyzoC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aE8MyzoC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGyn275N1z2yjP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 22:56:22 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139CXxjA102803; Fri, 9 Apr 2021 08:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=0P509MmLBlh98oicNoIESiOrgt6diqDBw+dExix6snU=;
 b=aE8MyzoCLf85iU01ybv124KZTCk+atrB4J/Xh0dbOwBKGcBLOgsbT4G+b5grXRMted1m
 eqx4zV8CDMvCT+HjCDzyE/6LA4aAIQ9Wg2pP/O6Ic2kQJ7S6gbNR43/X0muKDgMkjx3u
 H2eFUx4tQp2CNQkEQnZcyDB8ncl0XXDu8KX7RXWQWN9SyyniusGlnXWZC86rgLYk6v0N
 /ldrVqoP/dnSbKsphKUlqCcDyrJmsmO9BJTEZYV6uf6LqiQNc+J5aFGAcMtAvdkFPVOw
 3MIRBvvB2OxOWF/i6X6bNSaGrln32yr5IlG3it9UiAknwGinc600/MWmq3Z2baiRW4Yw Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpj7ekw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 08:56:14 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 139CcWYx127568;
 Fri, 9 Apr 2021 08:56:14 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpj7ekc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 08:56:13 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139ClDNM027359;
 Fri, 9 Apr 2021 12:56:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 37rvmq9aps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 12:56:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 139CtkSh37028162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 12:55:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AFAE4204F;
 Fri,  9 Apr 2021 12:56:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F5B04204B;
 Fri,  9 Apr 2021 12:56:05 +0000 (GMT)
Received: from [9.124.213.196] (unknown [9.124.213.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  9 Apr 2021 12:56:05 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1617927471.vhjclnvhj3.astroid@bobo.none>
Date: Fri, 9 Apr 2021 18:23:51 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F7D0CD6-EA13-4D6F-9592-98CCC4537133@linux.vnet.ibm.com>
References: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617720464-1651-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1617927471.vhjclnvhj3.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -KvXytqKST9SE4s_w0qxRNwYL62tops4
X-Proofpoint-GUID: tJVYrmlL3Pl6lhr001uwgEPVV8Dm49yj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
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



> On 09-Apr-2021, at 6:38 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
Hi Nick,

Thanks for checking the patch and sharing review comments.

> I was going to nitpick "overflown" here as something birds do, but =
some
> sources says overflown is okay for past tense.
>=20
> You could use "overflowed" for that, but I understand the issue with =
the=20
> word: you are talking about counters that are currently in an =
"overflow"=20
> state, but the overflow occurred in the past and is not still =
happening
> so you "overflowing" doesn't exactly fit either.
>=20
> overflown kind of works for some reason you can kind of use it for
> present tense!

Ok sure, Yes counter is currently in an =E2=80=9Coverflow=E2=80=9D =
state.

>=20
> Excerpts from Athira Rajeev's message of April 7, 2021 12:47 am:
>> Running perf fuzzer showed below in dmesg logs:
>> "Can't find PMC that caused IRQ"
>>=20
>> This means a PMU exception happened, but none of the PMC's =
(Performance
>> Monitor Counter) were found to be overflown. There are some corner =
cases
>> that clears the PMCs after PMI gets masked. In such cases, the perf
>> interrupt handler will not find the active PMC values that had caused
>> the overflow and thus leads to this message while replaying.
>>=20
>> Case 1: PMU Interrupt happens during replay of other interrupts and
>> counter values gets cleared by PMU callbacks before replay:
>>=20
>> During replay of interrupts like timer, __do_irq and doorbell =
exception, we
>> conditionally enable interrupts via may_hard_irq_enable(). This could
>> potentially create a window to generate a PMI. Since irq soft mask is =
set
>> to ALL_DISABLED, the PMI will get masked here.
>=20
> I wonder if may_hard_irq_enable shouldn't enable if PMI is soft
> disabled. And also maybe replay should not set ALL_DISABLED if
> there are no PMI interrupts pending.
>=20
> Still, I think those are a bit more tricky and might take a while
> to get right or just not be worth while, so I think your patch is
> fine.

Ok Nick.
>=20
>> We could get IPIs run before
>> perf interrupt is replayed and the PMU events could deleted or =
stopped.
>> This will change the PMU SPR values and resets the counters. Snippet =
of
>> ftrace log showing PMU callbacks invoked in "__do_irq":
>>=20
>> <idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
>> <idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
>> <idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
>> <idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
>> <<>>
>> <idle>-0 [051] dnH. 132025441307770: =
generic_smp_call_function_single_interrupt <-smp_ipi_demux_relaxed
>> <idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue =
<-smp_ipi_demux_relaxed
>> <idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
>> <idle>-0 [051] dnH. 132025441308206: power_pmu_disable =
<-perf_pmu_disable
>> <idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
>> <idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
>> <idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
>> <idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc =
<-power_pmu_del
>> <idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
>> <idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx =
<-perf_event_update_userpage
>> <idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict =
<-perf_event_update_userpage
>> <idle>-0 [051] dnH. 132025441308975: power_pmu_enable =
<-perf_pmu_enable
>> <<>>
>> <idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
>> <idle>-0 [051] dns. 132025441311319: performance_monitor_exception =
<-replay_soft_interrupts
>>=20
>> Case 2: PMI's masked during local_* operations, example local_add.
>> If the local_add operation happens within a local_irq_save, replay of
>> PMI will be during local_irq_restore. Similar to case 1, this could
>> also create a window before replay where PMU events gets deleted or
>> stopped.
>=20
> Here as well perhaps PMIs should be replayed if they are unmasked
> even if other interrupts are still masked. Again that might be more
> complexity than it's worth.
Ok..

>=20
>>=20
>> Patch adds a fix to update the PMU callback functions =
(del,stop,enable) to
>> check for pending perf interrupt. If there is an overflown PMC and =
pending
>> perf interrupt indicated in Paca, clear the PMI bit in paca to drop =
that
>> sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit which
>> otherwise could lead to spurious interrupts in some corner cases. =
Example,
>> a timer after power_pmu_del which will re-enable interrupts since PMI =
is
>> cleared and triggers a PMI again since PMAO bit is still set.
>>=20
>> We can't just replay PMI any time. Hence this approach is preferred =
rather
>> than replaying PMI before resetting overflown PMC. Patch also =
documents
>> core-book3s on a race condition which can trigger these PMC messages =
during
>> idle path in PowerNV.
>>=20
>> Fixes: f442d004806e ("powerpc/64s: Add support to mask perf =
interrupts and replay them")
>> Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
>> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
>> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/include/asm/pmc.h  | 11 +++++++++
>> arch/powerpc/perf/core-book3s.c | 55 =
+++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 66 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/pmc.h =
b/arch/powerpc/include/asm/pmc.h
>> index c6bbe9778d3c..97b4bd8de25b 100644
>> --- a/arch/powerpc/include/asm/pmc.h
>> +++ b/arch/powerpc/include/asm/pmc.h
>> @@ -34,11 +34,22 @@ static inline void ppc_set_pmu_inuse(int inuse)
>> #endif
>> }
>>=20
>> +static inline int clear_paca_irq_pmi(void)
>> +{
>> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
>> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
>> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
>> +		return 1;
>> +	}
>> +	return 0;
>> +}
>=20
> Could you put this in arch/powerpc/include/asm/hw_irq.h and
> rather than paca_irq, call it irq_pending perhaps
>=20
>  clear_pmi_irq_pending()
>=20
>  get_clear_pmi_irq_pending() if you're also testing it.

Sure,  I will use =E2=80=9Cget_clear_pmi_irq_pending()=E2=80=9D and try =
with moving this to arch/powerpc/include/asm/hw_irq.h

>=20
> Could you add a little comment about the corner cases above it too?
> The root cause seem to be interrupt replay while a masked PMI is
> pending can result in other interrupts arriving which clear the PMU
> overflow so the pending PMI must be cleared.

Ok, I will add comment and fix this in next version.

>=20
>> +
>> extern void power4_enable_pmcs(void);
>>=20
>> #else /* CONFIG_PPC64 */
>>=20
>> static inline void ppc_set_pmu_inuse(int inuse) { }
>> +static inline int clear_paca_irq_pmi(void) { return 0; }
>>=20
>> #endif
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 766f064f00fb..18ca3c90f866 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -847,6 +847,20 @@ static void write_pmc(int idx, unsigned long =
val)
>> 	}
>> }
>>=20
>> +static int pmc_overflown(int idx)
>> +{
>> +	unsigned long val[8];
>> +	int i;
>> +
>> +	for (i =3D 0; i < ppmu->n_counter; i++)
>> +		val[i] =3D read_pmc(i + 1);
>> +
>> +	if ((int)val[idx-1] < 0)
>> +		return 1;
>> +
>> +	return 0;
>> +}
>> +
>> /* Called from sysrq_handle_showregs() */
>> void perf_event_print_debug(void)
>> {
>> @@ -1438,6 +1452,15 @@ static void power_pmu_enable(struct pmu *pmu)
>> 		event =3D cpuhw->event[i];
>> 		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + =
1) {
>> 			power_pmu_read(event);
>> +			/*
>> +			 * if the PMC corresponding to event->hw.idx is
>> +			 * overflown, check if there is any pending perf
>> +			 * interrupt set in paca. If so, disable the =
interrupt
>> +			 * by clearing the paca bit for PMI since we are =
going
>> +			 * to reset the PMC.
>> +			 */
>> +			if (pmc_overflown(event->hw.idx))
>> +				clear_paca_irq_pmi();
>=20
> If the pmc is not overflown, could there still be a PMI pending?

I didn=E2=80=99t hit that scenario where PMI is pending without an =
overflown PMC.
Also I believe if such a case happens, we will need an investigation =
there. It could be a different case to be handled.

I actually considered below two points for adding this PMC check instead =
of just clearing the PMI.

1. Make sure we are not masking any bug here by just clearing =
PACA_IRQ_PMI.
Ideally if PMI is set in irq_happened, it means there was a counter =
overflow.
2. If there is more than one PMU event, say two events. Make sure we are =
clearing PMI only for the
event whose counter is overflown.
=20
>=20
>> 			write_pmc(event->hw.idx, 0);
>> 			event->hw.idx =3D 0;
>> 		}
>> @@ -1474,6 +1497,10 @@ static void power_pmu_enable(struct pmu *pmu)
>> 		event->hw.idx =3D idx;
>> 		if (event->hw.state & PERF_HES_STOPPED)
>> 			val =3D 0;
>> +
>> +		/* See above for clear_paca_irq_pmi */
>> +		if (pmc_overflown(event->hw.idx))
>> +			clear_paca_irq_pmi();
>> 		write_pmc(idx, val);
>>=20
>> 		perf_event_update_userpage(event);
>> @@ -1619,6 +1646,7 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
>> 	struct cpu_hw_events *cpuhw;
>> 	long i;
>> 	unsigned long flags;
>> +	unsigned long val_mmcr0;
>>=20
>> 	local_irq_save(flags);
>> 	perf_pmu_disable(event->pmu);
>> @@ -1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
>> 			--cpuhw->n_events;
>> 			ppmu->disable_pmc(event->hw.idx - 1, =
&cpuhw->mmcr);
>> 			if (event->hw.idx) {
>> +				/*
>> +				 * if the PMC corresponding to =
event->hw.idx is
>> +				 * overflown, check if there is any =
pending perf
>> +				 * interrupt set in paca. If so, disable =
the interrupt
>> +				 * and clear the MMCR0 PMAO bit since we =
are going
>> +				 * to reset the PMC and delete the =
event.
>> +				 */
>> +				if (pmc_overflown(event->hw.idx)) {
>> +					if (clear_paca_irq_pmi()) {
>> +						val_mmcr0 =3D =
mfspr(SPRN_MMCR0);
>> +						val_mmcr0 &=3D =
~MMCR0_PMAO;
>> +						write_mmcr0(cpuhw, =
val_mmcr0);
>> +						mb();
>> +						isync();
>=20
> I don't know the perf subsystem, but just out of curiosity why does
> MMCR0 need to be cleared only in this case?

I got a corner case in power_pmu_del, with only clearing PACA_IRQ_PMI =
and without resetting MMCR0 PMAO bit.
Here is the flow:

1. We clear the PMI bit Paca, but MMCR0 has the PMAO bit still set. PMAO =
bit indicates a PMI has occurred.
2. A timer interrupt is replayed after power_pmu_del which does a =
=E2=80=9Cmay_hard_irq_enable=E2=80=9D.
This will re-enable interrupts and triggers a PMI again since PMAO bit =
is still set.

So clear PMAO bit to avoid such spurious interrupts.
Ftrace logs showing the same with some debug trace_printks :

     <idle>-0    [134] d.h. 327287888478: power_pmu_del =
<-event_sched_out.isra.126
     <<>>    Here we cleared the PMI
     <idle>-0    [134] d.h. 327287889272: write_pmc <-power_pmu_del
     <idle>-0    [134] d.h. 327287889346: rcu_read_unlock_strict =
<-perf_event_update_userpage
     <idle>-0    [134] d.h. 327287889711: power_pmu_del: In =
power_pmu_del MMCR0 is 82004090, local_paca->irq_happened is 9
     <idle>-0    [134] d.h. 327287889811: power_pmu_enable =
<-perf_pmu_enable
     <idle>-0    [134] d.h. 327287889982: irq_exit <-doorbell_exception
     <idle>-0    [134] d... 327287890053: idle_cpu <-irq_exit
     <idle>-0    [134] d... 327287890158: tick_nohz_irq_exit <-irq_exit
     <idle>-0    [134] d... 327287890219: ktime_get <-tick_nohz_irq_exit
     <idle>-0    [134] d... 327287890328: replay_soft_interrupts =
<-interrupt_exit_kernel_prepare
     <idle>-0    [134] d... 327287890399: irq_enter <-timer_interrupt
     <<>>
     <idle>-0    [134] d.h. 327287891163: timer_interrupt: Before =
may_hard_irq_enable MMCR0 is 82004090, local_paca->irq_happened is 1
     <<>>
     <idle>-0    [134] d.h. 327287894310: timer_interrupt: After =
may_hard_irq_enable MMCR0 is 82004090, local_paca->irq_happened is 21

In case of other callbacks like pmu enable, we are programming MMCR0. =
But in case of event getting deleted, there is no
way we clear PMAO unless an event gets scheduled again in that cpu. =
Hence added this check only in pmu_del callback.
=20

> What if we disabled MSR[EE]
> right before a perf interrupt came in, so we don't get a pending PMI
> but the condition is still close to the same.

Nick, I didn=E2=80=99t get this question exactly. Can you please help =
explain a bit ?
=46rom my understanding, consider that we disabled MSR[EE] before perf =
interrupt came in.
So once the interrupts are re-enabled:

1. If soft mask is set to IRQS_DISABLED, perf interrupt will be =
triggered as NMI.
2. In case of ALL_DISABLED, it will be masked for replay. If PMU =
callbacks are invoked before replay,
our present patch will take care of clearing PMI in corner cases.

Thanks
Athira.
>=20
>> +				}
>> 				write_pmc(event->hw.idx, 0);
>> 				event->hw.idx =3D 0;
>> 			}
>> @@ -1714,6 +1758,8 @@ static void power_pmu_stop(struct perf_event =
*event, int ef_flags)
>>=20
>> 	local_irq_save(flags);
>> 	perf_pmu_disable(event->pmu);
>> +	if (pmc_overflown(event->hw.idx))
>> +		clear_paca_irq_pmi();
>>=20
>> 	power_pmu_read(event);
>> 	event->hw.state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
>> @@ -2343,6 +2389,15 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
>> 			}
>> 		}
>> 	}
>> +
>> +	/*
>> +	 * During system wide profling or while specific CPU
>> +	 * is monitored for an event, some corner cases could
>> +	 * cause PMC to overflow in idle path. This will trigger
>> +	 * a PMI after waking up from idle. Since counter values
>> +	 * are _not_ saved/restored in idle path, can lead to
>> +	 * below "Can't find PMC" message.
>> +	 */
>> 	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
>> 		printk_ratelimited(KERN_WARNING "Can't find PMC that =
caused IRQ\n");
>>=20
>> --=20
>> 1.8.3.1

