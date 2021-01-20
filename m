Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 463252FC87F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 04:11:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL9X70xMVzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 14:11:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RF5ZLfaV; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL9V64mL3zDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 14:09:18 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id j12so1243737pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 19:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mb808vv3zcVLCYUvZ07OLfxFt+ON5SlXWIpTwNbedac=;
 b=RF5ZLfaVNSZvGvhK85if2WK7H/gMfGp3DFd7ZiluTdzi9EeKUyzOkI917ZZEd71cAo
 8K5ZEatLhIEsZQhqd8/g7WW9qj8Z1Rk24JxuzjfhykErbbUoEn96pjaGDHMv6RxNND87
 OpZeKwkRmgE3B65Rlgem9Zf8v7f7xkCr3yP0koA+quh8r0dbWKXewlinHQ6UJxDu+kHU
 Qqrx+FDopMK1WD5a+o1rIOUnLYwDm1UuounghfmQ7li6xsqB2hT3NJ/O7Jxjc31GTdCT
 Kesl3Bwn2719B+QhreeA4Bpd5qkRChyYYyKs4+wUq32PI0GGCzIO4ujwuV1Oo5et9KfK
 kdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mb808vv3zcVLCYUvZ07OLfxFt+ON5SlXWIpTwNbedac=;
 b=fVbo+39KUpQrmshk0YF27Ft5bDj5zEjlx74+GmImbggJ0zX9qaNVY3EGUMf8Y8PK74
 mjuOnuGDfMLUT8bM/fvKrRaKRzr58jqTeeWztjnodX9q/VbrwwjSo17sSSkGvpbZzYwd
 UR8G0ZX2Sgjo0HYh04Hzx+oDE1t4IWkX06EGBnu65QgNj04+dbowRj4iLT8TmUdFv6bv
 wC4JMupCbWj8gr+PDqsbbwOkkM+I4CDpbVDf8aBFliFdFpfL+itA5/X009GHAElfQYX1
 d7EnGhdTImCdVmDBxx5gu916s0LDzT/ee/7WCeDBjVVVfiyR/iKIK+6nH6llrrc6f9sk
 1Udw==
X-Gm-Message-State: AOAM5322p7JOGlCYnZvccFpuXRZVkymbJGQyCGQS49nybd9V6o0iV5T8
 658P64Gz2h051a3sKpPWpm0=
X-Google-Smtp-Source: ABdhPJwspqC3ftXXBd3pOq/AWyKK7NARbKFnNM30YwFc78Vd3C5H3zLy2LdESvOI9ZdcrQBySmj80w==
X-Received: by 2002:a17:90b:1c0d:: with SMTP id
 oc13mr3227876pjb.156.1611112154066; 
 Tue, 19 Jan 2021 19:09:14 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id e16sm462766pfj.45.2021.01.19.19.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 19:09:13 -0800 (PST)
Date: Wed, 20 Jan 2021 13:09:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 14/39] powerpc/perf: move perf irq/nmi handling details
 into traps.c
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-15-npiggin@gmail.com>
 <AB6E725D-225E-4FBD-B484-4C8FA627D096@linux.vnet.ibm.com>
In-Reply-To: <AB6E725D-225E-4FBD-B484-4C8FA627D096@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1611108829.0isdl3z9na.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of January 19, 2021 8:24 pm:
>=20
>=20
>> On 15-Jan-2021, at 10:19 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> This is required in order to allow more significant differences between
>> NMI type interrupt handlers and regular asynchronous handlers.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> arch/powerpc/kernel/traps.c      | 31 +++++++++++++++++++++++++++-
>> arch/powerpc/perf/core-book3s.c  | 35 ++------------------------------
>> arch/powerpc/perf/core-fsl-emb.c | 25 -----------------------
>> 3 files changed, 32 insertions(+), 59 deletions(-)
>=20
> Hi Nick,
>=20
> Reviewed this perf patch which moves the nmi_enter/irq_enter to traps.c a=
nd code-wise changes
> for perf looks fine to me. Further, I was trying to test this by picking =
the whole Patch series on top
> of 5.11.0-rc3 kernel and using below test scenario:
>=20
> Intention of testcase is to check whether the perf nmi and asynchronous i=
nterrupts are getting
> captured as expected. My test kernel module below tries to create one of =
performance monitor
> counter ( PMC6 ) overflow between local_irq_save/local_irq_restore.
> [ Here interrupts are disabled and has IRQS_DISABLED as regs->softe ].
> I am expecting the PMI to come as an NMI in this case. I am also configur=
ing ftrace so that I
> can confirm whether it comes as an NMI or a replayed interrupt from the t=
race.
>=20
> Environment :One CPU online
> prerequisite for ftrace:
> # cd /sys/kernel/debug/tracing
> # echo 100 > buffer_percent
> # echo 200000 > buffer_size_kb=20
> # echo ppc-tb > trace_clock
> # echo function > current_tracer
>=20
> Part of sample kernel test module to trigger a PMI between=20
> local_irq_save and local_irq_restore:
>=20
> <<>>
> static ulong delay =3D 1;
> static void busy_wait(ulong time)
> {
>         udelay(delay);
> }
> static __always_inline void irq_test(void)
> {
>         unsigned long flags;
>         local_irq_save(flags);
>         trace_printk("IN IRQ TEST\n");
>         mtspr(SPRN_MMCR0, 0x80000000);
>         mtspr(SPRN_PMC6, 0x80000000 - 100);
>         mtspr(SPRN_MMCR0, 0x6004000);
>         busy_wait(delay);
>         trace_printk("IN IRQ TEST DONE\n");
>         local_irq_restore(flags);
>         mtspr(SPRN_MMCR0, 0x80000000);
>         mtspr(SPRN_PMC6, 0);
> }
> <<>>
>=20
> But this resulted in soft lockup, Adding a snippet of call-trace below:

I'm not getting problems with your test case, but I am testing in a VM=20
so may not be getting device interrupts so much (your 0xea0 interrupt).
I'll try test on bare metal next. Does it reproduce easily, and=20
unpatched kernel definitely does not have the problem?

A different issue, after my series, I don't see the perf "NMI" interrupt=20
in any traces under local_irq_disable, because it's disabling ftrace the
same as the other NMI interrupts, so your test wouldn't see them.

I don't know if this is exactly right. Can tracing cope with such NMIs
okay even if it's interrupted in the middle of the tracing code? Machine
check at least has to disable tracing because it's in real-mode, machine
check and sreset also want to disable tracing because something is going
wrong and we don't want to make it worse (e.g., to get a cleaner crash).
Should we still permit tracing of perf NMIs?

>=20
> [  883.900762] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper=
/0:0]
> [  883.901381] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE     =
5.11.0-rc3+ #34
> --
> [  883.901999] NIP [c0000000000168d0] replay_soft_interrupts+0x70/0x2f0
> [  883.902032] LR [c00000000003b2b8] interrupt_exit_kernel_prepare+0x1e8/=
0x240
> [  883.902063] Call Trace:
> [  883.902085] [c000000001c96f50] [c00000000003b2b8] interrupt_exit_kerne=
l_prepare+0x1e8/0x240 (unreliable)
> [  883.902139] [c000000001c96fb0] [c00000000000fd88] interrupt_return+0x1=
58/0x200
> [  883.902185] --- interrupt: ea0 at __rb_reserve_next+0xc0/0x5b0
> [  883.902224] NIP:  c0000000002d8980 LR: c0000000002d897c CTR: c00000000=
01aad90
> [  883.902262] REGS: c000000001c97020 TRAP: 0ea0   Tainted: G           O=
E      (5.11.0-rc3+)
> [  883.902301] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 2800=
0484  XER: 20040000
> [  883.902387] CFAR: c00000000000fe00 IRQMASK: 0=20
> --
> [  883.902757] NIP [c0000000002d8980] __rb_reserve_next+0xc0/0x5b0
> [  883.902786] LR [c0000000002d897c] __rb_reserve_next+0xbc/0x5b0
> [  883.902824] --- interrupt: ea0
> [  883.902848] [c000000001c97360] [c0000000002d8fcc] ring_buffer_lock_res=
erve+0x15c/0x580
> [  883.902894] [c000000001c973f0] [c0000000002e82fc] trace_function+0x4c/=
0x1c0
> [  883.902930] [c000000001c97440] [c0000000002f6f50] function_trace_call+=
0x140/0x190
> [  883.902976] [c000000001c97470] [c00000000007d6f8] ftrace_call+0x4/0x44
> [  883.903021] [c000000001c97660] [c000000000dcf70c] __do_softirq+0x15c/0=
x3d4
> [  883.903066] [c000000001c97750] [c00000000015fc68] irq_exit+0x198/0x1b0
> [  883.903102] [c000000001c97780] [c000000000dc1790] timer_interrupt+0x17=
0/0x3b0
> [  883.903148] [c000000001c977e0] [c000000000016994] replay_soft_interrup=
ts+0x134/0x2f0
> [  883.903193] [c000000001c979d0] [c00000000003b2b8] interrupt_exit_kerne=
l_prepare+0x1e8/0x240
> [  883.903240] [c000000001c97a30] [c00000000000fd88] interrupt_return+0x1=
58/0x200
> [  883.903276] --- interrupt: ea0 at arch_local_irq_restore+0x70/0xc0

You got a 0xea0 interrupt in the ftrace code. I wonder where it is=20
looping. Do you see more soft lockup messages?

Thanks,
Nick


>=20
> Thanks
> Athira
>>=20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 738370519937..bd55f201115b 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -1892,11 +1892,40 @@ void vsx_unavailable_tm(struct pt_regs *regs)
>> }
>> #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>>=20
>> -void performance_monitor_exception(struct pt_regs *regs)
>> +static void performance_monitor_exception_nmi(struct pt_regs *regs)
>> +{
>> +	nmi_enter();
>> +
>> +	__this_cpu_inc(irq_stat.pmu_irqs);
>> +
>> +	perf_irq(regs);
>> +
>> +	nmi_exit();
>> +}
>> +
>> +static void performance_monitor_exception_async(struct pt_regs *regs)
>> {
>> +	irq_enter();
>> +
>> 	__this_cpu_inc(irq_stat.pmu_irqs);
>>=20
>> 	perf_irq(regs);
>> +
>> +	irq_exit();
>> +}
>> +
>> +void performance_monitor_exception(struct pt_regs *regs)
>> +{
>> +	/*
>> +	 * On 64-bit, if perf interrupts hit in a local_irq_disable
>> +	 * (soft-masked) region, we consider them as NMIs. This is required to
>> +	 * prevent hash faults on user addresses when reading callchains (and
>> +	 * looks better from an irq tracing perspective).
>> +	 */
>> +	if (IS_ENABLED(CONFIG_PPC64) && unlikely(arch_irq_disabled_regs(regs))=
)
>> +		performance_monitor_exception_nmi(regs);
>> +	else
>> +		performance_monitor_exception_async(regs);
>> }
>>=20
>> #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-bo=
ok3s.c
>> index 28206b1fe172..9fd06010e8b6 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -110,10 +110,6 @@ static inline void perf_read_regs(struct pt_regs *r=
egs)
>> {
>> 	regs->result =3D 0;
>> }
>> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
>> -{
>> -	return 0;
>> -}
>>=20
>> static inline int siar_valid(struct pt_regs *regs)
>> {
>> @@ -353,15 +349,6 @@ static inline void perf_read_regs(struct pt_regs *r=
egs)
>> 	regs->result =3D use_siar;
>> }
>>=20
>> -/*
>> - * If interrupts were soft-disabled when a PMU interrupt occurs, treat
>> - * it as an NMI.
>> - */
>> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
>> -{
>> -	return (regs->softe & IRQS_DISABLED);
>> -}
>> -
>> /*
>>  * On processors like P7+ that have the SIAR-Valid bit, marked instructi=
ons
>>  * must be sampled only if the SIAR-valid bit is set.
>> @@ -2279,7 +2266,6 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)
>> 	struct perf_event *event;
>> 	unsigned long val[8];
>> 	int found, active;
>> -	int nmi;
>>=20
>> 	if (cpuhw->n_limited)
>> 		freeze_limited_counters(cpuhw, mfspr(SPRN_PMC5),
>> @@ -2287,18 +2273,6 @@ static void __perf_event_interrupt(struct pt_regs=
 *regs)
>>=20
>> 	perf_read_regs(regs);
>>=20
>> -	/*
>> -	 * If perf interrupts hit in a local_irq_disable (soft-masked) region,
>> -	 * we consider them as NMIs. This is required to prevent hash faults o=
n
>> -	 * user addresses when reading callchains. See the NMI test in
>> -	 * do_hash_page.
>> -	 */
>> -	nmi =3D perf_intr_is_nmi(regs);
>> -	if (nmi)
>> -		nmi_enter();
>> -	else
>> -		irq_enter();
>> -
>> 	/* Read all the PMCs since we'll need them a bunch of times */
>> 	for (i =3D 0; i < ppmu->n_counter; ++i)
>> 		val[i] =3D read_pmc(i + 1);
>> @@ -2344,8 +2318,8 @@ static void __perf_event_interrupt(struct pt_regs =
*regs)
>> 			}
>> 		}
>> 	}
>> -	if (!found && !nmi && printk_ratelimit())
>> -		printk(KERN_WARNING "Can't find PMC that caused IRQ\n");
>> +	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
>> +		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
>>=20
>> 	/*
>> 	 * Reset MMCR0 to its normal value.  This will set PMXE and
>> @@ -2355,11 +2329,6 @@ static void __perf_event_interrupt(struct pt_regs=
 *regs)
>> 	 * we get back out of this interrupt.
>> 	 */
>> 	write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
>> -
>> -	if (nmi)
>> -		nmi_exit();
>> -	else
>> -		irq_exit();
>> }
>>=20
>> static void perf_event_interrupt(struct pt_regs *regs)
>> diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-f=
sl-emb.c
>> index e0e7e276bfd2..ee721f420a7b 100644
>> --- a/arch/powerpc/perf/core-fsl-emb.c
>> +++ b/arch/powerpc/perf/core-fsl-emb.c
>> @@ -31,19 +31,6 @@ static atomic_t num_events;
>> /* Used to avoid races in calling reserve/release_pmc_hardware */
>> static DEFINE_MUTEX(pmc_reserve_mutex);
>>=20
>> -/*
>> - * If interrupts were soft-disabled when a PMU interrupt occurs, treat
>> - * it as an NMI.
>> - */
>> -static inline int perf_intr_is_nmi(struct pt_regs *regs)
>> -{
>> -#ifdef __powerpc64__
>> -	return (regs->softe & IRQS_DISABLED);
>> -#else
>> -	return 0;
>> -#endif
>> -}
>> -
>> static void perf_event_interrupt(struct pt_regs *regs);
>>=20
>> /*
>> @@ -659,13 +646,6 @@ static void perf_event_interrupt(struct pt_regs *re=
gs)
>> 	struct perf_event *event;
>> 	unsigned long val;
>> 	int found =3D 0;
>> -	int nmi;
>> -
>> -	nmi =3D perf_intr_is_nmi(regs);
>> -	if (nmi)
>> -		nmi_enter();
>> -	else
>> -		irq_enter();
>>=20
>> 	for (i =3D 0; i < ppmu->n_counter; ++i) {
>> 		event =3D cpuhw->event[i];
>> @@ -690,11 +670,6 @@ static void perf_event_interrupt(struct pt_regs *re=
gs)
>> 	mtmsr(mfmsr() | MSR_PMM);
>> 	mtpmr(PMRN_PMGC0, PMGC0_PMIE | PMGC0_FCECE);
>> 	isync();
>> -
>> -	if (nmi)
>> -		nmi_exit();
>> -	else
>> -		irq_exit();
>> }
>>=20
>> void hw_perf_event_setup(int cpu)
>> --=20
>> 2.23.0
>>=20
>=20
>=20
