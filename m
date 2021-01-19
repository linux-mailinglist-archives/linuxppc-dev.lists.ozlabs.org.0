Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B52FB55B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 11:29:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKlHt4ZmHzDr1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 21:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eeKf7gmn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKlFg22nTzDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 21:27:02 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JA2Pgx036830
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 05:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=MToBEuIQTXFskaxEFVWdzUrrYgvewXdrkgcl3oMW2Ns=;
 b=eeKf7gmnCYLGPy5NH5HGaCc8WZTJ1yutBoUHyEiMv4oUMCtEt9ACKMhJy7Xxo+5q1HVd
 S7yr1YFKMIJcMVXB0WSKpCn2BtvQwX3XENxzc4ho/m/slZl1iMIladlEBI+mDj6pIoel
 DRzLtHnYFaZaWkkoCormQZ50CNI0ehsGRVe9rkWtn+yyxPz7KyunX90B4fgzR6kYFTu2
 WhM/ToKe7jDYaKkwoj6Y5qtz5+pfgXm7sWvfveb375buwvbpI5z+FXXAxU28ODopz41O
 0SWpV6/kiYouEi4QWRSbYND763NH/HfHcQhWvbuhYI3X1kPAA0h6jTyiP/dkwQ39WwFR Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 365tn7d67f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 05:26:59 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JA3Hn6041464
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 05:26:59 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 365tn7d66v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 05:26:59 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JAJrwC002583;
 Tue, 19 Jan 2021 10:26:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 363qdh9hf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 10:26:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JAQsbK29622566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 10:26:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3F0FAE04D;
 Tue, 19 Jan 2021 10:26:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB592AE053;
 Tue, 19 Jan 2021 10:26:53 +0000 (GMT)
Received: from [9.79.225.157] (unknown [9.79.225.157])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Jan 2021 10:26:53 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v6 14/39] powerpc/perf: move perf irq/nmi handling details
 into traps.c
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210115165012.1260253-15-npiggin@gmail.com>
Date: Tue, 19 Jan 2021 15:54:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB6E725D-225E-4FBD-B484-4C8FA627D096@linux.vnet.ibm.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-15-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_02:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190058
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



> On 15-Jan-2021, at 10:19 PM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
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

Hi Nick,

Reviewed this perf patch which moves the nmi_enter/irq_enter to traps.c =
and code-wise changes
for perf looks fine to me. Further, I was trying to test this by picking =
the whole Patch series on top
of 5.11.0-rc3 kernel and using below test scenario:

Intention of testcase is to check whether the perf nmi and asynchronous =
interrupts are getting
captured as expected. My test kernel module below tries to create one of =
performance monitor
counter ( PMC6 ) overflow between local_irq_save/local_irq_restore.
[ Here interrupts are disabled and has IRQS_DISABLED as regs->softe ].
I am expecting the PMI to come as an NMI in this case. I am also =
configuring ftrace so that I
can confirm whether it comes as an NMI or a replayed interrupt from the =
trace.

Environment :One CPU online
prerequisite for ftrace:
# cd /sys/kernel/debug/tracing
# echo 100 > buffer_percent
# echo 200000 > buffer_size_kb=20
# echo ppc-tb > trace_clock
# echo function > current_tracer

Part of sample kernel test module to trigger a PMI between=20
local_irq_save and local_irq_restore:

<<>>
static ulong delay =3D 1;
static void busy_wait(ulong time)
{
        udelay(delay);
}
static __always_inline void irq_test(void)
{
        unsigned long flags;
        local_irq_save(flags);
        trace_printk("IN IRQ TEST\n");
        mtspr(SPRN_MMCR0, 0x80000000);
        mtspr(SPRN_PMC6, 0x80000000 - 100);
        mtspr(SPRN_MMCR0, 0x6004000);
        busy_wait(delay);
        trace_printk("IN IRQ TEST DONE\n");
        local_irq_restore(flags);
        mtspr(SPRN_MMCR0, 0x80000000);
        mtspr(SPRN_PMC6, 0);
}
<<>>

But this resulted in soft lockup, Adding a snippet of call-trace below:

[  883.900762] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! =
[swapper/0:0]
[  883.901381] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE     =
5.11.0-rc3+ #34
--
[  883.901999] NIP [c0000000000168d0] replay_soft_interrupts+0x70/0x2f0
[  883.902032] LR [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240
[  883.902063] Call Trace:
[  883.902085] [c000000001c96f50] [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240 (unreliable)
[  883.902139] [c000000001c96fb0] [c00000000000fd88] =
interrupt_return+0x158/0x200
[  883.902185] --- interrupt: ea0 at __rb_reserve_next+0xc0/0x5b0
[  883.902224] NIP:  c0000000002d8980 LR: c0000000002d897c CTR: =
c0000000001aad90
[  883.902262] REGS: c000000001c97020 TRAP: 0ea0   Tainted: G           =
OE      (5.11.0-rc3+)
[  883.902301] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: =
28000484  XER: 20040000
[  883.902387] CFAR: c00000000000fe00 IRQMASK: 0=20
--
[  883.902757] NIP [c0000000002d8980] __rb_reserve_next+0xc0/0x5b0
[  883.902786] LR [c0000000002d897c] __rb_reserve_next+0xbc/0x5b0
[  883.902824] --- interrupt: ea0
[  883.902848] [c000000001c97360] [c0000000002d8fcc] =
ring_buffer_lock_reserve+0x15c/0x580
[  883.902894] [c000000001c973f0] [c0000000002e82fc] =
trace_function+0x4c/0x1c0
[  883.902930] [c000000001c97440] [c0000000002f6f50] =
function_trace_call+0x140/0x190
[  883.902976] [c000000001c97470] [c00000000007d6f8] =
ftrace_call+0x4/0x44
[  883.903021] [c000000001c97660] [c000000000dcf70c] =
__do_softirq+0x15c/0x3d4
[  883.903066] [c000000001c97750] [c00000000015fc68] =
irq_exit+0x198/0x1b0
[  883.903102] [c000000001c97780] [c000000000dc1790] =
timer_interrupt+0x170/0x3b0
[  883.903148] [c000000001c977e0] [c000000000016994] =
replay_soft_interrupts+0x134/0x2f0
[  883.903193] [c000000001c979d0] [c00000000003b2b8] =
interrupt_exit_kernel_prepare+0x1e8/0x240
[  883.903240] [c000000001c97a30] [c00000000000fd88] =
interrupt_return+0x158/0x200
[  883.903276] --- interrupt: ea0 at arch_local_irq_restore+0x70/0xc0

Thanks
Athira
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 738370519937..bd55f201115b 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1892,11 +1892,40 @@ void vsx_unavailable_tm(struct pt_regs *regs)
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
> index 28206b1fe172..9fd06010e8b6 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -110,10 +110,6 @@ static inline void perf_read_regs(struct pt_regs =
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
> @@ -353,15 +349,6 @@ static inline void perf_read_regs(struct pt_regs =
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
> /*
>  * On processors like P7+ that have the SIAR-Valid bit, marked =
instructions
>  * must be sampled only if the SIAR-valid bit is set.
> @@ -2279,7 +2266,6 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
> 	struct perf_event *event;
> 	unsigned long val[8];
> 	int found, active;
> -	int nmi;
>=20
> 	if (cpuhw->n_limited)
> 		freeze_limited_counters(cpuhw, mfspr(SPRN_PMC5),
> @@ -2287,18 +2273,6 @@ static void __perf_event_interrupt(struct =
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
> @@ -2344,8 +2318,8 @@ static void __perf_event_interrupt(struct =
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
> @@ -2355,11 +2329,6 @@ static void __perf_event_interrupt(struct =
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

