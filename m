Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8B2C1265
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 18:56:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfvwH38VmzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 04:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jfjzkP72; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfvt537Y1zDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 04:54:19 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANHW41N058255
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 12:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=yO2yVUusSoq0HIkpK2GVNs9O1x8xE8yLpDeU5K7/SqM=;
 b=jfjzkP72y7hg9T+/DAT2KO9IzByBh3oMfIITa37esTH6PUBtbsKEoDGcLbNp4ygFrmhB
 ZAYsy97ietHJbjiJeWX8XaPJQSbideZxDp/ybmraQyEXktShJlMpmNZ9G3yc/YkG+AdM
 ruVTnxhhknvRZfuOiavdzgfAXy6BNYPlmZkS02ufPfRH5ROIGlAsD09hNspgUTIJL9ZV
 +AJDQifEAtmXNXerhLGWlnOuUxqkUbEI+idE4wacMRKso/W5O/mPCUpN1vBCNfXC53bT
 lXYpPm0z1Cc86W1SbAiX6E+8bAHUg5x6ozjXPMkEYSCOYjkwsc9eC+pmWvKHWX9W2H+8 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fnm4x8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 12:54:15 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0ANHXHNW061787
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 12:54:14 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fnm4x6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 12:54:14 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANHg7On004568;
 Mon, 23 Nov 2020 17:54:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 34xth8jpvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 17:54:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANHs7ph41222440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 17:54:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21BE34C052;
 Mon, 23 Nov 2020 17:54:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD5BD4C040;
 Mon, 23 Nov 2020 17:54:05 +0000 (GMT)
Received: from [9.79.228.11] (unknown [9.79.228.11])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 23 Nov 2020 17:54:05 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v2 04/19] powerpc/perf: move perf irq/nmi handling details
 into traps.c
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20201111094410.3038123-5-npiggin@gmail.com>
Date: Mon, 23 Nov 2020 23:24:03 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8C9CB7C-C225-46AC-A690-0260BD857182@linux.vnet.ibm.com>
References: <20201111094410.3038123-1-npiggin@gmail.com>
 <20201111094410.3038123-5-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230114
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Nov-2020, at 3:13 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> This is required in order to allow more significant differences =
between
> NMI type interrupt handlers and regular asynchronous handlers.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/kernel/traps.c      | 31 +++++++++++++++++++++++++++-
> arch/powerpc/perf/core-book3s.c  | 35 ++------------------------------
> arch/powerpc/perf/core-fsl-emb.c | 25 -----------------------
> 3 files changed, 32 insertions(+), 59 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 902fcbd1a778..7dda72eb97cc 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1919,11 +1919,40 @@ void vsx_unavailable_tm(struct pt_regs *regs)
> }
> #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>=20
> -void performance_monitor_exception(struct pt_regs *regs)
> +static void performance_monitor_exception_nmi(struct pt_regs *regs)
> +{
> +	nmi_enter();
> +
> +	__this_cpu_inc(irq_stat.pmu_irqs);
> +
> +	perf_irq(regs);
> +
> +	nmi_exit();
> +}
> +
> +static void performance_monitor_exception_async(struct pt_regs *regs)
> {
> +	irq_enter();
> +
> 	__this_cpu_inc(irq_stat.pmu_irqs);
>=20
> 	perf_irq(regs);
> +
> +	irq_exit();
> +}
> +
> +void performance_monitor_exception(struct pt_regs *regs)
> +{
> +	/*
> +	 * On 64-bit, if perf interrupts hit in a local_irq_disable
> +	 * (soft-masked) region, we consider them as NMIs. This is =
required to
> +	 * prevent hash faults on user addresses when reading callchains =
(and
> +	 * looks better from an irq tracing perspective).
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC64) && =
unlikely(arch_irq_disabled_regs(regs)))
> +		performance_monitor_exception_nmi(regs);
> +	else
> +		performance_monitor_exception_async(regs);
> }
>=20
> #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 08643cba1494..9fd8cae09218 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -109,10 +109,6 @@ static inline void perf_read_regs(struct pt_regs =
*regs)
> {
> 	regs->result =3D 0;
> }
> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
> -{
> -	return 0;
> -}
>=20
> static inline int siar_valid(struct pt_regs *regs)
> {
> @@ -328,15 +324,6 @@ static inline void perf_read_regs(struct pt_regs =
*regs)
> 	regs->result =3D use_siar;
> }
>=20
> -/*
> - * If interrupts were soft-disabled when a PMU interrupt occurs, =
treat
> - * it as an NMI.
> - */
> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
> -{
> -	return (regs->softe & IRQS_DISABLED);
> -}
> -

Hi Nick,

arch_irq_disabled_regs checks the regs->softe value, if it has =
IRQS_DISABLED set.
Core-book3s is also using same logic in perf_intr_is_nmi to check if it =
is an NMI. With the
changes in this patch, if I understood correctly, we will do the irq/nmi =
handling in traps.c=20
rather than doing it in the PMI interrupt handler.  But can you please =
help to understand
better on what is the perf weirdness (sometimes NMI, sometimes not) =
mentioned in the cover
letter that we are fixing with this change ?

Thanks
Athira

> /*
>  * On processors like P7+ that have the SIAR-Valid bit, marked =
instructions
>  * must be sampled only if the SIAR-valid bit is set.
> @@ -2224,7 +2211,6 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
> 	struct perf_event *event;
> 	unsigned long val[8];
> 	int found, active;
> -	int nmi;
>=20
> 	if (cpuhw->n_limited)
> 		freeze_limited_counters(cpuhw, mfspr(SPRN_PMC5),
> @@ -2232,18 +2218,6 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
>=20
> 	perf_read_regs(regs);
>=20
> -	/*
> -	 * If perf interrupts hit in a local_irq_disable (soft-masked) =
region,
> -	 * we consider them as NMIs. This is required to prevent hash =
faults on
> -	 * user addresses when reading callchains. See the NMI test in
> -	 * do_hash_page.
> -	 */
> -	nmi =3D perf_intr_is_nmi(regs);
> -	if (nmi)
> -		nmi_enter();
> -	else
> -		irq_enter();
> -
> 	/* Read all the PMCs since we'll need them a bunch of times */
> 	for (i =3D 0; i < ppmu->n_counter; ++i)
> 		val[i] =3D read_pmc(i + 1);
> @@ -2289,8 +2263,8 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
> 			}
> 		}
> 	}
> -	if (!found && !nmi && printk_ratelimit())
> -		printk(KERN_WARNING "Can't find PMC that caused IRQ\n");
> +	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
> +		printk_ratelimited(KERN_WARNING "Can't find PMC that =
caused IRQ\n");
>=20
> 	/*
> 	 * Reset MMCR0 to its normal value.  This will set PMXE and
> @@ -2300,11 +2274,6 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
> 	 * we get back out of this interrupt.
> 	 */
> 	write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
> -
> -	if (nmi)
> -		nmi_exit();
> -	else
> -		irq_exit();
> }
>=20
> static void perf_event_interrupt(struct pt_regs *regs)
> diff --git a/arch/powerpc/perf/core-fsl-emb.c =
b/arch/powerpc/perf/core-fsl-emb.c
> index e0e7e276bfd2..ee721f420a7b 100644
> --- a/arch/powerpc/perf/core-fsl-emb.c
> +++ b/arch/powerpc/perf/core-fsl-emb.c
> @@ -31,19 +31,6 @@ static atomic_t num_events;
> /* Used to avoid races in calling reserve/release_pmc_hardware */
> static DEFINE_MUTEX(pmc_reserve_mutex);
>=20
> -/*
> - * If interrupts were soft-disabled when a PMU interrupt occurs, =
treat
> - * it as an NMI.
> - */
> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
> -{
> -#ifdef __powerpc64__
> -	return (regs->softe & IRQS_DISABLED);
> -#else
> -	return 0;
> -#endif
> -}
> -
> static void perf_event_interrupt(struct pt_regs *regs);
>=20
> /*
> @@ -659,13 +646,6 @@ static void perf_event_interrupt(struct pt_regs =
*regs)
> 	struct perf_event *event;
> 	unsigned long val;
> 	int found =3D 0;
> -	int nmi;
> -
> -	nmi =3D perf_intr_is_nmi(regs);
> -	if (nmi)
> -		nmi_enter();
> -	else
> -		irq_enter();
>=20
> 	for (i =3D 0; i < ppmu->n_counter; ++i) {
> 		event =3D cpuhw->event[i];
> @@ -690,11 +670,6 @@ static void perf_event_interrupt(struct pt_regs =
*regs)
> 	mtmsr(mfmsr() | MSR_PMM);
> 	mtpmr(PMRN_PMGC0, PMGC0_PMIE | PMGC0_FCECE);
> 	isync();
> -
> -	if (nmi)
> -		nmi_exit();
> -	else
> -		irq_exit();
> }
>=20
> void hw_perf_event_setup(int cpu)
> --=20
> 2.23.0
>=20

