Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8173556D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 16:41:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF9FD5Q06z309y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:41:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lv4TFY8c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lv4TFY8c; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF9Dm1WvRz2y08
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:40:39 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136EXb6u141229; Tue, 6 Apr 2021 10:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=9oUKo3ZK5+xRc60z4laKude0xloS74ivw+rfCZekhNE=;
 b=lv4TFY8cxUmkj3lVyuDLrZzgy6TxFC+RvGGSfiopqy0gKzYufutdeC1blif0FkNTgzsr
 xeAubwnrIKqKFTR3hWSGc/UV4pw+SMu1IgjEtUtfQRwZA4tAf+WPYUsnwr3mASVEMcbb
 s/WZg4MQqV4pMcv83auDcaZ9ume1kIv4JpVToBk2vFiCkTYKp+rjrC6E0bZzGFQImyFV
 5/YCzjZT59pWx66fnhBAmSqs8idwxQGdJprQcvUPqi6QSlQ+QHLljqMKpUMfKXMUsCTS
 KkI5P72+f1Y9c82XiQgXuezRne+XnoNziODEwbONNwG9Bo48rkYypq4oBxa7r6nAQlde wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5eb544x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:40:33 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 136EXtia142950;
 Tue, 6 Apr 2021 10:40:33 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5eb543t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:40:33 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136ER0ud009265;
 Tue, 6 Apr 2021 14:40:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 37q2q5j82w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 14:40:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136EePfQ45810058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 14:40:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07EB0A4055;
 Tue,  6 Apr 2021 14:40:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70E22A4059;
 Tue,  6 Apr 2021 14:40:14 +0000 (GMT)
Received: from [9.124.212.190] (unknown [9.124.212.190])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Apr 2021 14:40:14 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: Fix PMU callbacks to clear pending PMI
 before resetting an overflown PMC
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1617718443-1422-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Tue, 6 Apr 2021 20:10:10 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <7EDC097E-2BCF-42CE-94C5-AEF83AAB9CBB@linux.vnet.ibm.com>
References: <1617718443-1422-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fd_WvGYIGQPCZVHnsGg5Cqchlt1W0pI5
X-Proofpoint-ORIG-GUID: uBF10tk8X_j0fdYZemZJg09LzY5frxn1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_03:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060102
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
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "nasastry@in.ibm.com" <nasastry@in.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Cover letter is missing in this patch. I will resent the patch along =
with cover letter.=20
Sorry for the noise.

Thanks,
Athira
> On 06-Apr-2021, at 7:44 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Running perf fuzzer showed below in dmesg logs:
> "Can't find PMC that caused IRQ"
>=20
> This means a PMU exception happened, but none of the PMC's =
(Performance
> Monitor Counter) were found to be overflown. There are some corner =
cases
> that clears the PMCs after PMI gets masked. In such cases, the perf
> interrupt handler will not find the active PMC values that had caused
> the overflow and thus leads to this message while replaying.
>=20
> Case 1: PMU Interrupt happens during replay of other interrupts and
> counter values gets cleared by PMU callbacks before replay:
>=20
> During replay of interrupts like timer, __do_irq and doorbell =
exception, we
> conditionally enable interrupts via may_hard_irq_enable(). This could
> potentially create a window to generate a PMI. Since irq soft mask is =
set
> to ALL_DISABLED, the PMI will get masked here. We could get IPIs run =
before
> perf interrupt is replayed and the PMU events could deleted or =
stopped.
> This will change the PMU SPR values and resets the counters. Snippet =
of
> ftrace log showing PMU callbacks invoked in "__do_irq":
>=20
> <idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
> <idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
> <idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
> <idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
> <<>>
> <idle>-0 [051] dnH. 132025441307770: =
generic_smp_call_function_single_interrupt <-smp_ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue =
<-smp_ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
> <idle>-0 [051] dnH. 132025441308206: power_pmu_disable =
<-perf_pmu_disable
> <idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
> <idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
> <idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc =
<-power_pmu_del
> <idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx =
<-perf_event_update_userpage
> <idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict =
<-perf_event_update_userpage
> <idle>-0 [051] dnH. 132025441308975: power_pmu_enable =
<-perf_pmu_enable
> <<>>
> <idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
> <idle>-0 [051] dns. 132025441311319: performance_monitor_exception =
<-replay_soft_interrupts
>=20
> Case 2: PMI's masked during local_* operations, example local_add.
> If the local_add operation happens within a local_irq_save, replay of
> PMI will be during local_irq_restore. Similar to case 1, this could
> also create a window before replay where PMU events gets deleted or
> stopped.
>=20
> Patch adds a fix to update the PMU callback functions =
(del,stop,enable) to
> check for pending perf interrupt. If there is an overflown PMC and =
pending
> perf interrupt indicated in Paca, clear the PMI bit in paca to drop =
that
> sample. In case of power_pmu_del, also clear the MMCR0 PMAO bit which
> otherwise could lead to spurious interrupts in some corner cases. =
Example,
> a timer after power_pmu_del which will re-enable interrupts since PMI =
is
> cleared and triggers a PMI again since PMAO bit is still set.
>=20
> We can't just replay PMI any time. Hence this approach is preferred =
rather
> than replaying PMI before resetting overflown PMC. Patch also =
documents
> core-book3s on a race condition which can trigger these PMC messages =
during
> idle path in PowerNV.
>=20
> Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts =
and replay them")
> Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> arch/powerpc/include/asm/pmc.h  | 11 +++++++++
> arch/powerpc/perf/core-book3s.c | 55 =
+++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 66 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/pmc.h =
b/arch/powerpc/include/asm/pmc.h
> index c6bbe9778d3c..97b4bd8de25b 100644
> --- a/arch/powerpc/include/asm/pmc.h
> +++ b/arch/powerpc/include/asm/pmc.h
> @@ -34,11 +34,22 @@ static inline void ppc_set_pmu_inuse(int inuse)
> #endif
> }
>=20
> +static inline int clear_paca_irq_pmi(void)
> +{
> +	if (get_paca()->irq_happened & PACA_IRQ_PMI) {
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +		get_paca()->irq_happened &=3D ~PACA_IRQ_PMI;
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> extern void power4_enable_pmcs(void);
>=20
> #else /* CONFIG_PPC64 */
>=20
> static inline void ppc_set_pmu_inuse(int inuse) { }
> +static inline int clear_paca_irq_pmi(void) { return 0; }
>=20
> #endif
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 766f064f00fb..18ca3c90f866 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -847,6 +847,20 @@ static void write_pmc(int idx, unsigned long val)
> 	}
> }
>=20
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
> /* Called from sysrq_handle_showregs() */
> void perf_event_print_debug(void)
> {
> @@ -1438,6 +1452,15 @@ static void power_pmu_enable(struct pmu *pmu)
> 		event =3D cpuhw->event[i];
> 		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + =
1) {
> 			power_pmu_read(event);
> +			/*
> +			 * if the PMC corresponding to event->hw.idx is
> +			 * overflown, check if there is any pending perf
> +			 * interrupt set in paca. If so, disable the =
interrupt
> +			 * by clearing the paca bit for PMI since we are =
going
> +			 * to reset the PMC.
> +			 */
> +			if (pmc_overflown(event->hw.idx))
> +				clear_paca_irq_pmi();
> 			write_pmc(event->hw.idx, 0);
> 			event->hw.idx =3D 0;
> 		}
> @@ -1474,6 +1497,10 @@ static void power_pmu_enable(struct pmu *pmu)
> 		event->hw.idx =3D idx;
> 		if (event->hw.state & PERF_HES_STOPPED)
> 			val =3D 0;
> +
> +		/* See above for clear_paca_irq_pmi */
> +		if (pmc_overflown(event->hw.idx))
> +			clear_paca_irq_pmi();
> 		write_pmc(idx, val);
>=20
> 		perf_event_update_userpage(event);
> @@ -1619,6 +1646,7 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
> 	struct cpu_hw_events *cpuhw;
> 	long i;
> 	unsigned long flags;
> +	unsigned long val_mmcr0;
>=20
> 	local_irq_save(flags);
> 	perf_pmu_disable(event->pmu);
> @@ -1636,6 +1664,22 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
> 			--cpuhw->n_events;
> 			ppmu->disable_pmc(event->hw.idx - 1, =
&cpuhw->mmcr);
> 			if (event->hw.idx) {
> +				/*
> +				 * if the PMC corresponding to =
event->hw.idx is
> +				 * overflown, check if there is any =
pending perf
> +				 * interrupt set in paca. If so, disable =
the interrupt
> +				 * and clear the MMCR0 PMAO bit since we =
are going
> +				 * to reset the PMC and delete the =
event.
> +				 */
> +				if (pmc_overflown(event->hw.idx)) {
> +					if (clear_paca_irq_pmi()) {
> +						val_mmcr0 =3D =
mfspr(SPRN_MMCR0);
> +						val_mmcr0 &=3D =
~MMCR0_PMAO;
> +						write_mmcr0(cpuhw, =
val_mmcr0);
> +						mb();
> +						isync();
> +					}
> +				}
> 				write_pmc(event->hw.idx, 0);
> 				event->hw.idx =3D 0;
> 			}
> @@ -1714,6 +1758,8 @@ static void power_pmu_stop(struct perf_event =
*event, int ef_flags)
>=20
> 	local_irq_save(flags);
> 	perf_pmu_disable(event->pmu);
> +	if (pmc_overflown(event->hw.idx))
> +		clear_paca_irq_pmi();
>=20
> 	power_pmu_read(event);
> 	event->hw.state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
> @@ -2343,6 +2389,15 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
> 			}
> 		}
> 	}
> +
> +	/*
> +	 * During system wide profling or while specific CPU
> +	 * is monitored for an event, some corner cases could
> +	 * cause PMC to overflow in idle path. This will trigger
> +	 * a PMI after waking up from idle. Since counter values
> +	 * are _not_ saved/restored in idle path, can lead to
> +	 * below "Can't find PMC" message.
> +	 */
> 	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
> 		printk_ratelimited(KERN_WARNING "Can't find PMC that =
caused IRQ\n");
>=20
> --=20
> 1.8.3.1
>=20

