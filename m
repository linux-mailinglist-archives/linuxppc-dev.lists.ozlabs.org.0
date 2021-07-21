Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 901733D0888
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 07:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV4SQ428Cz3brJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 15:50:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EC3BS145;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EC3BS145; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV4Rt312Wz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 15:50:18 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L5bpU9152613; Wed, 21 Jul 2021 01:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hAjdFzPI6bkH9AuKjhWqymGcjuxkQ94ksUdAfuA1n+o=;
 b=EC3BS145nWMfIMD8jV0CpKr7ehVCIYCznLgg/2t+r+1YOBpVqTgx3WihpDNtvCQyE96g
 QhZ/pCpKlLigX2731/DXNg3/Ba1kBfyHpv7N1voLN0A9FE+AJZ63TjO70zMu1JEz6o6B
 7s4rpEZD8UwpFuQw/omkeYYX3ECb5lsrl9S5spdB6PkjfVEtpolsWp213h7iGHGKNfCv
 fqGR4Id78GO41LNSc4QezllqtXUgHdjxQakwN5SjWgyO/JCrTvhMFjI4uB9EbGvns6Y8
 3gWmcYFlVjNDhmujgJqRuaClYF50DFydv0oRG+tPUwYpUfuc9GEq0/sergsDX7e0syeY EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xchqhgun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 01:50:13 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16L5di9k165947;
 Wed, 21 Jul 2021 01:50:13 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xchqhgu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 01:50:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16L5o6eB006292;
 Wed, 21 Jul 2021 05:50:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu89pda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 05:50:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16L5lh9O28246272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 05:47:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D75EF4C052;
 Wed, 21 Jul 2021 05:50:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18F5A4C058;
 Wed, 21 Jul 2021 05:50:07 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.43.8.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Jul 2021 05:50:06 +0000 (GMT)
Subject: Re: [PATCH V4 1/1] powerpc/perf: Fix PMU callbacks to clear pending
 PMI before resetting an overflown PMC
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1626846509-1350-2-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <e3a4167d-0465-b4d5-fdcd-e1dfd0522f66@linux.ibm.com>
Date: Wed, 21 Jul 2021 11:20:04 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626846509-1350-2-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bCudhcYm1KgKr_IcRXLw1T_FnTn3fU5K
X-Proofpoint-GUID: VyYpO42TZ6zs_35_LqCsk0x9Kg_6nI3c
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_02:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210027
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/07/21 11:18 am, Athira Rajeev wrote:
> Running perf fuzzer showed below in dmesg logs:
> "Can't find PMC that caused IRQ"
> 
> This means a PMU exception happened, but none of the PMC's (Performance
> Monitor Counter) were found to be overflown. There are some corner cases
> that clears the PMCs after PMI gets masked. In such cases, the perf
> interrupt handler will not find the active PMC values that had caused
> the overflow and thus leads to this message while replaying.
> 
> Case 1: PMU Interrupt happens during replay of other interrupts and
> counter values gets cleared by PMU callbacks before replay:
> 
> During replay of interrupts like timer, __do_irq and doorbell exception, we
> conditionally enable interrupts via may_hard_irq_enable(). This could
> potentially create a window to generate a PMI. Since irq soft mask is set
> to ALL_DISABLED, the PMI will get masked here. We could get IPIs run before
> perf interrupt is replayed and the PMU events could deleted or stopped.
> This will change the PMU SPR values and resets the counters. Snippet of
> ftrace log showing PMU callbacks invoked in "__do_irq":
> 
> <idle>-0 [051] dns. 132025441306354: __do_irq <-call_do_irq
> <idle>-0 [051] dns. 132025441306430: irq_enter <-__do_irq
> <idle>-0 [051] dns. 132025441306503: irq_enter_rcu <-__do_irq
> <idle>-0 [051] dnH. 132025441306599: xive_get_irq <-__do_irq
> <<>>
> <idle>-0 [051] dnH. 132025441307770: generic_smp_call_function_single_interrupt <-smp_ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441307839: flush_smp_call_function_queue <-smp_ipi_demux_relaxed
> <idle>-0 [051] dnH. 132025441308057: _raw_spin_lock <-event_function
> <idle>-0 [051] dnH. 132025441308206: power_pmu_disable <-perf_pmu_disable
> <idle>-0 [051] dnH. 132025441308337: power_pmu_del <-event_sched_out
> <idle>-0 [051] dnH. 132025441308407: power_pmu_read <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308477: read_pmc <-power_pmu_read
> <idle>-0 [051] dnH. 132025441308590: isa207_disable_pmc <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308663: write_pmc <-power_pmu_del
> <idle>-0 [051] dnH. 132025441308787: power_pmu_event_idx <-perf_event_update_userpage
> <idle>-0 [051] dnH. 132025441308859: rcu_read_unlock_strict <-perf_event_update_userpage
> <idle>-0 [051] dnH. 132025441308975: power_pmu_enable <-perf_pmu_enable
> <<>>
> <idle>-0 [051] dnH. 132025441311108: irq_exit <-__do_irq
> <idle>-0 [051] dns. 132025441311319: performance_monitor_exception <-replay_soft_interrupts
> 
> Case 2: PMI's masked during local_* operations, example local_add.
> If the local_add operation happens within a local_irq_save, replay of
> PMI will be during local_irq_restore. Similar to case 1, this could
> also create a window before replay where PMU events gets deleted or
> stopped.
> 
> Patch adds a fix to update the PMU callback function 'power_pmu_disable' to
> check for pending perf interrupt. If there is an overflown PMC and pending
> perf interrupt indicated in Paca, clear the PMI bit in paca to drop that
> sample. Clearing of PMI bit is done in 'power_pmu_disable' since disable is
> invoked before any event gets deleted/stopped. With this fix, if there are
> more than one event running in the PMU, there is a chance that we clear the
> PMI bit for the event which is not getting deleted/stopped. The other
> events may still remain active. Hence to make sure we don't drop valid
> sample in such cases, another check is added in power_pmu_enable. This
> checks if there is an overflown PMC found among the active events and if
> so enable back the PMI bit. Two new helper functions are introduced to
> clear/set the PMI, ie 'clear_pmi_irq_pending' and 'set_pmi_irq_pending'.
> Helper function 'pmi_irq_pending' is introduced to give a warning if
> there is pending PMI bit in paca, but no PMC is overflown.
> 
> Also there are corner cases which results in performance monitor interrupts
> getting triggered during power_pmu_disable. This happens since PMXE bit is
> not cleared along with disabling of other MMCR0 bits in the pmu_disable.
> Such PMI's could leave the PMU running and could trigger PMI again which
> will set MMCR0 PMAO bit. This could lead to spurious interrupts in some
> corner cases. Example, a timer after power_pmu_del which will re-enable
> interrupts and triggers a PMI again since PMAO bit is still set. But fails
> to find valid overflow since PMC get cleared in power_pmu_del. Patch
> fixes this by disabling PMXE along with disabling of other MMCR0 bits
> in power_pmu_disable.
> 
> We can't just replay PMI any time. Hence this approach is preferred rather
> than replaying PMI before resetting overflown PMC. Patch also documents
> core-book3s on a race condition which can trigger these PMC messages during
> idle path in PowerNV.
> 
> Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts and replay them")
> Reported-by: Nageswara R Sastry <nasastry@in.ibm.com>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   arch/powerpc/include/asm/hw_irq.h | 38 +++++++++++++++++++++++++
>   arch/powerpc/perf/core-book3s.c   | 59 ++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 21cc571..d4e2d74 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -224,6 +224,40 @@ static inline bool arch_irqs_disabled(void)
>   	return arch_irqs_disabled_flags(arch_local_save_flags());
>   }
>   
> +static inline void set_pmi_irq_pending(void)
> +{
> +	/*
> +	 * Invoked from PMU callback functions to set
> +	 * PMI bit in Paca. This has to be called with
> +	 * irq's disabled ( via hard_irq_disable ).
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +	get_paca()->irq_happened |= PACA_IRQ_PMI;
> +}
> +
> +static inline void clear_pmi_irq_pending(void)
> +{
> +	/*
> +	 * Invoked from PMU callback functions to clear
> +	 * the pending PMI bit in Paca.
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		WARN_ON_ONCE(mfmsr() & MSR_EE);
> +	get_paca()->irq_happened &= ~PACA_IRQ_PMI;
> +}
> +
> +static inline int pmi_irq_pending(void)
> +{
> +	/*
> +	 * Invoked from PMU callback functions to check
> +	 * if there is a pending PMI bit in Paca.
> +	 */
> +	if (get_paca()->irq_happened & PACA_IRQ_PMI)
> +		return 1;
> +	return 0;
> +}
> +
>   #ifdef CONFIG_PPC_BOOK3S
>   /*
>    * To support disabling and enabling of irq with PMI, set of
> @@ -408,6 +442,10 @@ static inline void do_hard_irq_enable(void)
>   	BUILD_BUG();
>   }
>   
> +static inline void clear_pmi_irq_pending(void) { }
> +static inline void set_pmi_irq_pending(void) { }
> +static inline int pmi_irq_pending(void) { return 0; }
> +
>   static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
>   {
>   }
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index bb0ee71..ad29220 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -848,6 +848,19 @@ static void write_pmc(int idx, unsigned long val)
>   	}
>   }
>   
> +static int any_pmc_overflown(struct cpu_hw_events *cpuhw)
> +{
> +	int i, idx;
> +
> +	for (i = 0; i < cpuhw->n_events; i++) {
> +		idx = cpuhw->event[i]->hw.idx;
> +		if ((idx) && ((int)read_pmc(idx) < 0))
> +			return idx;
> +	}
> +
> +	return 0;
> +}
> +
>   /* Called from sysrq_handle_showregs() */
>   void perf_event_print_debug(void)
>   {
> @@ -1272,11 +1285,13 @@ static void power_pmu_disable(struct pmu *pmu)
>   
>   		/*
>   		 * Set the 'freeze counters' bit, clear EBE/BHRBA/PMCC/PMAO/FC56
> +		 * Also clear PMXE to disable PMI's getting triggered in some
> +		 * corner cases during PMU disable.
>   		 */
>   		val  = mmcr0 = mfspr(SPRN_MMCR0);
>   		val |= MMCR0_FC;
>   		val &= ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | MMCR0_PMAO |
> -			 MMCR0_FC56);
> +			 MMCR0_PMXE | MMCR0_FC56);
>   		/* Set mmcr0 PMCCEXT for p10 */
>   		if (ppmu->flags & PPMU_ARCH_31)
>   			val |= MMCR0_PMCCEXT;
> @@ -1290,6 +1305,24 @@ static void power_pmu_disable(struct pmu *pmu)
>   		mb();
>   		isync();
>   
> +		/*
> +		 * Some corner cases could clear the PMU counter overflow
> +		 * while a masked PMI is pending. One of such case is
> +		 * when a PMI happens during interrupt replay and perf
> +		 * counter values gets cleared by PMU callbacks before
> +		 * replay.
> +		 *
> +		 * If any of PMC corresponding to the active PMU events is
> +		 * overflown, disable the interrupt by clearing the paca
> +		 * bit for PMI since we are disabling the PMU now.
> +		 * Otherwise provide a warning if there is PMI pending, but
> +		 * no counter is found overflown.
> +		 */
> +		if (any_pmc_overflown(cpuhw))
> +			clear_pmi_irq_pending();
> +		else
> +			WARN_ON(pmi_irq_pending());
> +
>   		val = mmcra = cpuhw->mmcr.mmcra;
>   
>   		/*
> @@ -1381,6 +1414,15 @@ static void power_pmu_enable(struct pmu *pmu)
>   	 * (possibly updated for removal of events).
>   	 */
>   	if (!cpuhw->n_added) {
> +		/*
> +		 * If there is any active event with an overflown PMC
> +		 * value, Set back PACA_IRQ_PMI which would have got
> +		 * cleared in power_pmu_disable.
> +		 */
> +		hard_irq_disable();
> +		if (any_pmc_overflown(cpuhw))
> +			set_pmi_irq_pending();
> +
>   		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>   		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>   		if (ppmu->flags & PPMU_ARCH_31)
> @@ -2336,6 +2378,12 @@ static void __perf_event_interrupt(struct pt_regs *regs)
>   				break;
>   			}
>   		}
> +		/*
> +		 * Clear PACA_IRQ_PMI in case it was set by
> +		 * set_pmi_irq_pending() when PMU was enabled
> +		 * after accounting for interrupts.
> +		 */
> +		clear_pmi_irq_pending();
>   		if (!active)
>   			/* reset non active counters that have overflowed */
>   			write_pmc(i + 1, 0);
> @@ -2355,6 +2403,15 @@ static void __perf_event_interrupt(struct pt_regs *regs)
>   			}
>   		}
>   	}
> +
> +	/*
> +	 * During system wide profling or while specific CPU
> +	 * is monitored for an event, some corner cases could
> +	 * cause PMC to overflow in idle path. This will trigger
> +	 * a PMI after waking up from idle. Since counter values
> +	 * are _not_ saved/restored in idle path, can lead to
> +	 * below "Can't find PMC" message.
> +	 */
>   	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
>   		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
>   
> 

-- 
Thanks and Regards
R.Nageswara Sastry
