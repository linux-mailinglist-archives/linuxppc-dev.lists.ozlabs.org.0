Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157B8AD13A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 17:48:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eqzijObR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNV6D4wh5z3dD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 01:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eqzijObR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNV5V3g06z3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 01:48:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FC41CE0BA9;
	Mon, 22 Apr 2024 15:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14060C113CC;
	Mon, 22 Apr 2024 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713800888;
	bh=TGkCC1wb/ipHHm0xz1HjzQqToV5Sfv84Bet9nt2x64E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqzijObRUsJ59JAHcqlBP0SQl5L5rx9qT/7vnci9gVpigjDM4nbbwfpOoOTHizdQt
	 eNvZISlygM5uYM0hosK0Vmom9czSy3J7P3Pj72vY1r5dZDVzppKwqbB0t9rvG78wPo
	 Ocoo829L6rUzqT/8+eIU//ta/cAI+1pPrlUlaAL6EWoweY32E7S8ewcipGnVSRinCv
	 R6zXwDoAC1cYV36MYmO0IOQq2YdqHhvWhNpyprxnUWCeCcIyjvZ/ngRRGD2rFMfqeW
	 AkvrVN+vANtrmgGHLXyChEiTTbxac62koeGlwjWSDiCP/K34jP6KFMzL/GsMF3z+Z6
	 3uSrzXaBvZQrA==
Date: Mon, 22 Apr 2024 21:15:02 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v5 RESEND] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
Message-ID: <aauzmvtbpgxbr4aa3s4k33cdi7fljs5q4ifn5x2swncz7dtvam@gclohylavkpl>
References: <20240402070656.28441-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402070656.28441-1-gautam@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 12:36:54PM +0530, Gautam Menghani wrote:
> PAPR hypervisor has introduced three new counters in the VPA area of
> LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> for context switches from host to guest and vice versa, and 1 counter
> for getting the total time spent inside the KVM guest. Add a tracepoint
> that enables reading the counters for use by ftrace/perf. Note that this
> tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
> 
> Also maintain an aggregation of the context switch times in vcpu->arch.
> This will be useful in getting the aggregate times with a pmu driver
> which will be upstreamed in the near future.

It would be better to add code to maintain aggregate times as part of 
that pmu driver.

> 
> [1] Terminology:
> a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
> b. L2 refers to the KVM guest booted on top of L1.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v5 RESEND: 
> 1. Add the changelog
> 
> v4 -> v5:
> 1. Define helper functions for getting/setting the accumulation counter
> in L2's VPA
> 
> v3 -> v4:
> 1. After vcpu_run, check the VPA flag instead of checking for tracepoint
> being enabled for disabling the cs time accumulation.
> 
> v2 -> v3:
> 1. Move the counter disabling and zeroing code to a different function.
> 2. Move the get_lppaca() inside the tracepoint_enabled() branch.
> 3. Add the aggregation logic to maintain total context switch time.
> 
> v1 -> v2:
> 1. Fix the build error due to invalid struct member reference.
> 
>  arch/powerpc/include/asm/kvm_host.h |  5 ++++
>  arch/powerpc/include/asm/lppaca.h   | 11 +++++---
>  arch/powerpc/kvm/book3s_hv.c        | 40 +++++++++++++++++++++++++++++
>  arch/powerpc/kvm/trace_hv.h         | 25 ++++++++++++++++++
>  4 files changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 8abac532146e..d953b32dd68a 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -847,6 +847,11 @@ struct kvm_vcpu_arch {
>  	gpa_t nested_io_gpr;
>  	/* For nested APIv2 guests*/
>  	struct kvmhv_nestedv2_io nestedv2_io;
> +
> +	/* Aggregate context switch and guest run time info (in ns) */
> +	u64 l1_to_l2_cs_agg;
> +	u64 l2_to_l1_cs_agg;
> +	u64 l2_runtime_agg;

Can be dropped from this patch.

>  #endif
>  
>  #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
> index 61ec2447dabf..bda6b86b9f13 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>  	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>  	u8	fpregs_in_use;
>  	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_accumul_cntrs_enable;  /* Enable usage of counters for KVM guest */

A simpler name - l2_counters_enable or such?

> +	u8	reserved8[27];
>  	__be64	wait_state_cycles;	/* Wait cycles for this proc */
>  	u8	reserved9[28];
>  	__be16	slb_count;		/* # of SLBs to maintain */
> @@ -92,9 +93,13 @@ struct lppaca {
>  	/* cacheline 4-5 */
>  
>  	__be32	page_ins;		/* CMO Hint - # page ins by OS */
> -	u8	reserved12[148];
> +	u8	reserved12[28];
> +	volatile __be64 l1_to_l2_cs_tb;
> +	volatile __be64 l2_to_l1_cs_tb;
> +	volatile __be64 l2_runtime_tb;
> +	u8 reserved13[96];
>  	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
> -	u8	reserved13[96];
> +	u8	reserved14[96];
>  } ____cacheline_aligned;
>  
>  #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577eb8..fea1c1429975 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,37 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> +static inline int kvmhv_get_l2_accumul(void)
> +{
> +	return get_lppaca()->l2_accumul_cntrs_enable;
> +}
> +
> +static inline void kvmhv_set_l2_accumul(int val)
					   ^^^
					   bool?

> +{
> +	get_lppaca()->l2_accumul_cntrs_enable = val;
> +}
> +
> +static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp = get_lppaca();
> +	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
> +
> +	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
> +	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
> +	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
> +	trace_kvmppc_vcpu_exit_cs_time(vcpu, l1_to_l2_ns, l2_to_l1_ns,
> +					l2_runtime_ns);
> +	lp->l1_to_l2_cs_tb = 0;
> +	lp->l2_to_l1_cs_tb = 0;
> +	lp->l2_runtime_tb = 0;
> +	kvmhv_set_l2_accumul(0);
> +
> +	// Maintain an aggregate of context switch times
> +	vcpu->arch.l1_to_l2_cs_agg += l1_to_l2_ns;
> +	vcpu->arch.l2_to_l1_cs_agg += l2_to_l1_ns;
> +	vcpu->arch.l2_runtime_agg += l2_runtime_ns;
> +}
> +
>  static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  				     unsigned long lpcr, u64 *tb)
>  {
> @@ -4130,6 +4161,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  	kvmppc_gse_put_u64(io->vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
>  
>  	accumulate_time(vcpu, &vcpu->arch.in_guest);
> +
> +	/* Enable the guest host context switch time tracking */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
> +		kvmhv_set_l2_accumul(1);
> +
>  	rc = plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
>  				  &trap, &i);
>  
> @@ -4156,6 +4192,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  
>  	timer_rearm_host_dec(*tb);
>  
> +	/* Record context switch and guest_run_time data */
> +	if (kvmhv_get_l2_accumul())
> +		do_trace_nested_cs_time(vcpu);
> +
>  	return trap;
>  }

I'm assuming the counters in VPA are cumulative, since you are zero'ing 
them out on exit. If so, I think a better way to implement this is to 
use TRACE_EVENT_FN() and provide tracepoint registration and 
unregistration functions. You can then enable the counters once during 
registration and avoid repeated writes to the VPA area. With that, you 
also won't need to do anything before vcpu entry. If you maintain 
previous values, you can calculate the delta and emit the trace on vcpu 
exit. The values in VPA area can then serve as the cumulative values.

>  
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 8d57c8428531..ab19977c91b4 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -491,6 +491,31 @@ TRACE_EVENT(kvmppc_run_vcpu_enter,
>  	TP_printk("VCPU %d: tgid=%d", __entry->vcpu_id, __entry->tgid)
>  );
>  
> +TRACE_EVENT(kvmppc_vcpu_exit_cs_time,

Not sure what "exit" signifies in the tracepoint name. Can this be 
simplified to kvmppc_vcpu_cs_time? Perhaps kvmppc_vcpu_stats, which will 
allow more vcpu stats to be exposed in future as necessary?

> +	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs,
> +		u64 l2_runtime),

Can be on a single line, we no longer restrict lines to 80 columns. 100 
or so is fine.

> +
> +	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		vcpu_id)
> +		__field(__u64,		l1_to_l2_cs_ns)
> +		__field(__u64,		l2_to_l1_cs_ns)
> +		__field(__u64,		l2_runtime_ns)

Not sure there is a reason to use __u64 - just u64 should work.

> +	),
> +
> +	TP_fast_assign(
> +		__entry->vcpu_id  = vcpu->vcpu_id;
> +		__entry->l1_to_l2_cs_ns = l1_to_l2_cs;
> +		__entry->l2_to_l1_cs_ns = l2_to_l1_cs;
> +		__entry->l2_runtime_ns = l2_runtime;
> +	),
> +
> +	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu-ns l2_to_l1_cs_time=%llu-ns l2_runtime=%llu-ns",
						 ^^^
You can drop the hyphen before "ns". Just put a space there.

> +		__entry->vcpu_id,  __entry->l1_to_l2_cs_ns,
> +		__entry->l2_to_l1_cs_ns, __entry->l2_runtime_ns)

There is l1_to_l2_cs, l1_to_l2_cs_ns and l1_to_l2_cs_time - can you use 
a single name for that?

> +);
> +

As a minor nit, it will be good to put the new tracepoint after the 
below vcpu exit tracepoint just so the entry/exit tracepoints are 
together in the file.

>  TRACE_EVENT(kvmppc_run_vcpu_exit,
>  	TP_PROTO(struct kvm_vcpu *vcpu),
>  
> -- 
> 2.43.2
> 


- Naveen
