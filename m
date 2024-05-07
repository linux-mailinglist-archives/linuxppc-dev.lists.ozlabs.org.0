Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EF8BDBBE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 08:41:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kHRNj7nI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYTFM1NsLz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 16:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kHRNj7nI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYTDb3dtTz30gp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 16:40:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C67660BAD;
	Tue,  7 May 2024 06:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90084C4AF18;
	Tue,  7 May 2024 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715064029;
	bh=lRji6tTDCLCRRf3ujzewsDMDsH2PzV2Eu2B51lXry4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHRNj7nIPewkXNrvTtYtB1Ut+pfqG96EG0ihcYqcQf04GXFLQ02EKvyMdYtY7caRK
	 K+w7/DFMyguWiRaPYDYvcX0zi940X9fskGL9nV7sCYBLbrgB28RtTBouKMvwy+BS8C
	 yt7qjuekm0En1EiIJTELzxUNQS8SW/IrfNBYiKD0nrFVO4oHz9HmptCtqPdFSMSClH
	 Bqc+2bwsExrESWIRsFJTN3q1uM5AoV4ZZAmG5TmJCuvg05BoeMEDKr1Mx0+2UMIvuV
	 n4cdOmrcv/FP7JnqfTg7dKWiIGX4DOq3OgAjGGAuEyTEaLqUopOTrHfz4FBQDZR7C4
	 ZJgz8ouXbEx8A==
Date: Tue, 7 May 2024 12:05:51 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v6] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
Message-ID: <bk4zdqrzthsxzd5p5ppai4pociac2ww2lsuto5zk7w6snlotuc@2ut5owudosz6>
References: <20240506145605.73794-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506145605.73794-1-gautam@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 06, 2024 at 08:26:03PM GMT, Gautam Menghani wrote:
> PAPR hypervisor has introduced three new counters in the VPA area of
> LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> for context switches from host to guest and vice versa, and 1 counter
> for getting the total time spent inside the KVM guest. Add a tracepoint
> that enables reading the counters for use by ftrace/perf. Note that this
> tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
> 
> [1] Terminology:
> a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
> b. L2 refers to the KVM guest booted on top of L1.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v5 -> v6:
> 1. Use TRACE_EVENT_FN to enable/disable counters only once.
> 2. Remove the agg. counters from vcpu->arch.
> 3. Use PACA to maintain old counter values instead of zeroing on every
> entry.
> 4. Simplify variable names
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
>  arch/powerpc/include/asm/lppaca.h | 11 +++++--
>  arch/powerpc/include/asm/paca.h   |  5 +++
>  arch/powerpc/kvm/book3s_hv.c      | 52 +++++++++++++++++++++++++++++++
>  arch/powerpc/kvm/trace_hv.h       | 27 ++++++++++++++++
>  4 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
> index 61ec2447dabf..f40a646bee3c 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>  	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>  	u8	fpregs_in_use;
>  	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_counters_enable;  /* Enable usage of counters for KVM guest */
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
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
> index 1d58da946739..f20ac7a6efa4 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -278,6 +278,11 @@ struct paca_struct {
>  	struct mce_info *mce_info;
>  	u8 mce_pending_irq_work;
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	u64 l1_to_l2_cs;
> +	u64 l2_to_l1_cs;
> +	u64 l2_runtime_agg;
> +#endif
>  } ____cacheline_aligned;
>  
>  extern void copy_mm_to_paca(struct mm_struct *mm);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577eb8..ed69ad58bd02 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,54 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> +static inline int kvmhv_get_l2_counters_status(void)
> +{
> +	return get_lppaca()->l2_counters_enable;
> +}
> +
> +static inline void kvmhv_set_l2_counters_status(int cpu, bool status)
> +{
> +	if (status)
> +		lppaca_of(cpu).l2_counters_enable = 1;
> +	else
> +		lppaca_of(cpu).l2_counters_enable = 0;
> +}
> +
> +int kmvhv_counters_tracepoint_regfunc(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		kvmhv_set_l2_counters_status(cpu, true);
> +	}
> +	return 0;
> +}
> +
> +void kmvhv_counters_tracepoint_unregfunc(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		kvmhv_set_l2_counters_status(cpu, false);
> +	}
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
> +	trace_kvmppc_vcpu_stats(vcpu, l1_to_l2_ns - local_paca->l1_to_l2_cs,
> +					l2_to_l1_ns - local_paca->l2_to_l1_cs,
> +					l2_runtime_ns - local_paca->l2_runtime_agg);

Depending on how the hypervisor works, if the vcpu was in l2 when the 
tracepoint is enabled, the counters may not be updated on exit and we 
may emit a trace with all values zero. If that is possible, it might be 
a good idea to only emit the trace if any of the counters are non-zero.

Otherwise, this looks good to me.
Acked-by: Naveen N Rao <naveen@kernel.org>


- Naveen

> +	local_paca->l1_to_l2_cs = l1_to_l2_ns;
> +	local_paca->l2_to_l1_cs = l2_to_l1_ns;
> +	local_paca->l2_runtime_agg = l2_runtime_ns;
> +}
> +
>  static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  				     unsigned long lpcr, u64 *tb)
>  {
> @@ -4156,6 +4204,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  
>  	timer_rearm_host_dec(*tb);
>  
> +	/* Record context switch and guest_run_time data */
> +	if (kvmhv_get_l2_counters_status())
> +		do_trace_nested_cs_time(vcpu);
> +
>  	return trap;
>  }
>  
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 8d57c8428531..dc118ab88f23 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -238,6 +238,9 @@
>  	{H_MULTI_THREADS_ACTIVE,	"H_MULTI_THREADS_ACTIVE"}, \
>  	{H_OUTSTANDING_COP_OPS,		"H_OUTSTANDING_COP_OPS"}
>  
> +int kmvhv_counters_tracepoint_regfunc(void);
> +void kmvhv_counters_tracepoint_unregfunc(void);
> +
>  TRACE_EVENT(kvm_guest_enter,
>  	TP_PROTO(struct kvm_vcpu *vcpu),
>  	TP_ARGS(vcpu),
> @@ -512,6 +515,30 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
>  			__entry->vcpu_id, __entry->exit, __entry->ret)
>  );
>  
> +TRACE_EVENT_FN(kvmppc_vcpu_stats,
> +	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs, u64 l2_runtime),
> +
> +	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		vcpu_id)
> +		__field(u64,		l1_to_l2_cs)
> +		__field(u64,		l2_to_l1_cs)
> +		__field(u64,		l2_runtime)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->vcpu_id  = vcpu->vcpu_id;
> +		__entry->l1_to_l2_cs = l1_to_l2_cs;
> +		__entry->l2_to_l1_cs = l2_to_l1_cs;
> +		__entry->l2_runtime = l2_runtime;
> +	),
> +
> +	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu ns l2_to_l1_cs_time=%llu ns l2_runtime=%llu ns",
> +		__entry->vcpu_id,  __entry->l1_to_l2_cs,
> +		__entry->l2_to_l1_cs, __entry->l2_runtime),
> +	kmvhv_counters_tracepoint_regfunc, kmvhv_counters_tracepoint_unregfunc
> +);
>  #endif /* _TRACE_KVM_HV_H */
>  
>  /* This part must be outside protection */
> -- 
> 2.44.0
> 
