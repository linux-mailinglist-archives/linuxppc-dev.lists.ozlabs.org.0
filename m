Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E43C4623
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 10:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNcwh4tNhz3bVr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 18:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=izB9Ervc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=izB9Ervc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNcwD4YcGz2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 18:52:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C8WpbT070542; Mon, 12 Jul 2021 04:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=5+sgH2a3fYqUMAiPDO9tRQpTpFCa63lqldevQ34o/J4=;
 b=izB9ErvcovQYB7iJ3odAi5DqZsc3RX+Nj1JopTC0ODXVXGFUDDcLf/TIKRXkbPvaQ351
 1NYsZzMIgtEqD4jgP7pDBfF+2vzrj+o4Ep+7LL3bLGMqW9flknVr8kJ+FOtzTT9nu+QC
 56Topl899kq4F6ktH4XAt1vuZJ12zpmZD6/hc43tgbtwJfcHETmQ98KkzFrwhZq+Lu+W
 wTPKj2IMR1Pdbxwo+EN6WSuNqILfm/Ke5RSU9Y9xmcq2cXdhvPWT8+layjF5IgJ0ycxQ
 /8LdOxDYYmOVF5sPie57rX5t6jPHO2hyqWNfH4kIxZB9fokft398Xmrmyzg4NqA1uACL EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgk30tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 04:52:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C8XJAg072477;
 Mon, 12 Jul 2021 04:52:22 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgk30tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 04:52:22 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C8fjEP018195;
 Mon, 12 Jul 2021 08:52:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39q3688nm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 08:52:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16C8oENf34800010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 08:50:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56C8C11C077;
 Mon, 12 Jul 2021 08:52:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48C1811C075;
 Mon, 12 Jul 2021 08:52:15 +0000 (GMT)
Received: from [9.195.47.54] (unknown [9.195.47.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Jul 2021 08:52:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [PATCH V3 1/1] powerpc/perf: Fix PMU callbacks to clear pending
 PMI before resetting an overflown PMC
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1626057060.c4ymz1d9vf.astroid@bobo.none>
Date: Mon, 12 Jul 2021 14:22:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <113AB01F-1567-4E63-A891-F6E717EF644E@linux.vnet.ibm.com>
References: <1625932694-1525-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1625932694-1525-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1626057060.c4ymz1d9vf.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kCj4ELktH4n-r9qBoD_LF1Q3ocum_qkV
X-Proofpoint-GUID: GABXIDay6UiGQ7xbq4uCuuekyYEYv6cX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_04:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120067
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12-Jul-2021, at 8:07 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of July 11, 2021 1:58 am:
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
>> to ALL_DISABLED, the PMI will get masked here. We could get IPIs run =
before
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
>>=20
>> Patch adds a fix to update the PMU callback function =
'power_pmu_disable' to
>> check for pending perf interrupt. If there is an overflown PMC and =
pending
>> perf interrupt indicated in Paca, clear the PMI bit in paca to drop =
that
>> sample. Clearing of PMI bit is done in 'power_pmu_disable' since =
disable is
>> invoked before any event gets deleted/stopped. With this fix, if =
there are
>> more than one event running in the PMU, there is a chance that we =
clear the
>> PMI bit for the event which is not getting deleted/stopped. The other
>> events may still remain active. Hence to make sure we don't drop =
valid
>> sample in such cases, another check is added in power_pmu_enable. =
This
>> checks if there is an overflown PMC found among the active events and =
if
>> so enable back the PMI bit. Two new helper functions are introduced =
to
>> clear/set the PMI, ie 'clear_pmi_irq_pending' and =
'set_pmi_irq_pending'.
>>=20
>> Also there are corner cases which results in performance monitor =
interrupts
>> getting triggered during power_pmu_disable. This happens since PMXE =
bit is
>> not cleared along with disabling of other MMCR0 bits in the =
pmu_disable.
>> Such PMI's could leave the PMU running and could trigger PMI again =
which
>> will set MMCR0 PMAO bit. This could lead to spurious interrupts in =
some
>> corner cases. Example, a timer after power_pmu_del which will =
re-enable
>> interrupts and triggers a PMI again since PMAO bit is still set. But =
fails
>> to find valid overflow since PMC get cleared in power_pmu_del. Patch
>> fixes this by disabling PMXE along with disabling of other MMCR0 bits
>> in power_pmu_disable.
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
>> arch/powerpc/include/asm/hw_irq.h | 31 +++++++++++++++++++++++++
>> arch/powerpc/perf/core-book3s.c   | 49 =
++++++++++++++++++++++++++++++++++++++-
>> 2 files changed, 79 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/hw_irq.h =
b/arch/powerpc/include/asm/hw_irq.h
>> index 21cc571..0a067bb 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -224,6 +224,34 @@ static inline bool arch_irqs_disabled(void)
>> 	return arch_irqs_disabled_flags(arch_local_save_flags());
>> }
>>=20
>> +static inline void set_pmi_irq_pending(void)
>> +{
>> +	/*
>> +	 * Invoked currently from PMU callback functions
>> +	 * to set PMI bit in Paca. This has to be called
>> +	 * with irq's disabled ( via hard_irq_disable ).
>> +	 */
>> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
>> +	get_paca()->irq_happened |=3D PACA_IRQ_PMI;
>> +}
>> +
>> +static inline void clear_pmi_irq_pending(void)
>> +{
>> +	/*
>> +	 * Some corner cases could clear the PMU counter overflow
>> +	 * while a masked PMI is pending. One of such case is
>> +	 * when a PMI happens during interrupt replay and perf
>> +	 * counter values gets cleared by PMU callbacks before
>> +	 * replay. So the pending PMI must be cleared here.
>> +	 */
>> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
>> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> +			WARN_ON_ONCE(mfmsr() & MSR_EE);
>> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
>=20
> I think you could just make this match set_pmi_irq_pending, that
> is, always do the debug test, and remove the branch entirely.


Ok Nick, Sure I will address this in next version.

>=20
>> +	}
>> +}
>> +
>> #ifdef CONFIG_PPC_BOOK3S
>> /*
>>  * To support disabling and enabling of irq with PMI, set of
>> @@ -408,6 +436,9 @@ static inline void do_hard_irq_enable(void)
>> 	BUILD_BUG();
>> }
>>=20
>> +static inline void clear_pmi_irq_pending(void) { }
>> +static inline void set_pmi_irq_pending(void) { }
>> +
>> static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, =
unsigned long val)
>> {
>> }
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index bb0ee71..17463b2 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -848,6 +848,19 @@ static void write_pmc(int idx, unsigned long =
val)
>> 	}
>> }
>>=20
>> +static int any_pmc_overflown(struct cpu_hw_events *cpuhw)
>> +{
>> +	int i, idx;
>> +
>> +	for (i =3D 0; i < cpuhw->n_events; i++) {
>> +		idx =3D cpuhw->event[i]->hw.idx;
>> +		if ((idx) && ((int)read_pmc(idx) < 0))
>> +			return idx;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> /* Called from sysrq_handle_showregs() */
>> void perf_event_print_debug(void)
>> {
>> @@ -1276,7 +1289,7 @@ static void power_pmu_disable(struct pmu *pmu)
>> 		val  =3D mmcr0 =3D mfspr(SPRN_MMCR0);
>> 		val |=3D MMCR0_FC;
>> 		val &=3D ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | =
MMCR0_PMAO |
>> -			 MMCR0_FC56);
>> +			 MMCR0_PMXE | MMCR0_FC56);
>=20
> Maybe a comment to say why you clear PMXE?

Sure, will add that.

>=20
>> 		/* Set mmcr0 PMCCEXT for p10 */
>> 		if (ppmu->flags & PPMU_ARCH_31)
>> 			val |=3D MMCR0_PMCCEXT;
>> @@ -1290,6 +1303,16 @@ static void power_pmu_disable(struct pmu *pmu)
>> 		mb();
>> 		isync();
>>=20
>> +		/*
>> +		 * If any of PMC corresponding to the active PMU
>> +		 * events is overflown, check if there is any pending
>> +		 * perf interrupt set in paca. If so, disable the =
interrupt
>> +		 * by clearing the paca bit for PMI since we are =
disabling
>> +		 * the PMU now.
>> +		 */
>> +		if (any_pmc_overflown(cpuhw))
>> +			clear_pmi_irq_pending();
>=20
> Is there a need for the any_pmc_overflown() check here? Could you just=20=

> clear unconditionally? Would it be a bug if no pmc was overflown but =
we
> had a PMI pending?

Hi Nick,

Thanks for reviewing.

This check will help to capture any similar corner cases in future.
Example, presently we got this bug since there was a PMI happened but no =
PMC
was found as overflown. So keeping this check will help us to capture
such kind of issues if any happens in future.

Thanks
Athira
>=20
>> +
>> 		val =3D mmcra =3D cpuhw->mmcr.mmcra;
>>=20
>> 		/*
>> @@ -1381,6 +1404,15 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	 * (possibly updated for removal of events).
>> 	 */
>> 	if (!cpuhw->n_added) {
>> +		/*
>> +		 * If there is any active event with an overflown PMC
>> +		 * value, Set back PACA_IRQ_PMI which would have got
>> +		 * cleared in power_pmu_disable.
>> +		 */
>> +		hard_irq_disable();
>> +		if (any_pmc_overflown(cpuhw))
>> +			set_pmi_irq_pending();
>> +
>> 		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & =
~MMCRA_SAMPLE_ENABLE);
>> 		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>> 		if (ppmu->flags & PPMU_ARCH_31)
>> @@ -2336,6 +2368,12 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
>> 				break;
>> 			}
>> 		}
>> +		/*
>> +		 * Check if PACA_IRQ_PMI is set any chance
>> +		 * by set_pmi_irq_pending() when PMU was enabled
>> +		 * after accounting for interrupts.
>=20
> "Clear PACA_IRQ_PMI in case it was set by..." ?

I will correct this comment in next version.

>=20
> Aside from those minor things,
>=20
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Thanks,
> Nick
>=20
>> +		 */
>> +		clear_pmi_irq_pending();
>> 		if (!active)
>> 			/* reset non active counters that have =
overflowed */
>> 			write_pmc(i + 1, 0);
>> @@ -2355,6 +2393,15 @@ static void __perf_event_interrupt(struct =
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

