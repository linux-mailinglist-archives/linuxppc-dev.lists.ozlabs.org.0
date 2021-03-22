Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43D343A94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 08:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3mPf6jLHz30C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 18:30:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=DUXBOG2e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DUXBOG2e; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3mPC3XKWz2xg7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:30:21 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id g1so6075389plg.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=44uLXf9fUq01jayoIUqnJ2o6Rdu+SmU1YK9yqOQ5VFc=;
 b=DUXBOG2e3DViYXLeEmheH4wdlkVYNOV6CyRCYEXW+O8RGODGVyKzBt9mzE4dTjQiWp
 K0Qy/wnV/x1nluJanpLkHg52L6W4qSzM8jplOhwBfAswzkLuAi8pfIc+HgMS+Y9RpLdg
 G98oGgkVHG4rDBu6Bu0go49vGFTiyACNGgHnVfDfjV5K2yiDqiOR+WsxONPFZxB8y3DJ
 6U2lRj3jZw/K8q6zdQfXabk+y7UjZnEIDc7fNc5njvD/MFJub0u0qT2HpnWRT747XEye
 WMYLdz/2SJhHKOoWIoKrlZndMuMl8GAJhmFmdfnFwmVgpDUNAEmGI9pjXRfsolWeharP
 l2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=44uLXf9fUq01jayoIUqnJ2o6Rdu+SmU1YK9yqOQ5VFc=;
 b=GsH7jQ43hgZZPvGIOdLzp3/mwuhknrypRVDB54VgNXq+M+8Tp+uY9ei+rKR4RkMUmw
 lkMCfYA1cO62JNP92j7tZVGtFPwVRtcsCo2W0zCCQ7l+IvLBr+C8dTK7N9ZXNdl1VU4X
 Zk4587SlF/o3FUK87iHnZniybHn9KXrelvthoraGgzn2gRDF+lbmx+bl+3vDB+hmfu3g
 5V+jQt+YVv+EQDVDe2h0FKTLcKuweljJonWFMR4Sm+Sw8vhd0UB+MgDTHtjYpxHOvSfX
 CIrOik+F8Fx8reZBdjXjvdpBdEdBCefsvyhdnD+GYvGWdPFDu8Y4HFASqRRtscYVn1CU
 F3OQ==
X-Gm-Message-State: AOAM5314qtFlK7yb6SFuvUVHm7VdLrDAv0it9Hwq12HWcnyH6+djY+fS
 tkcAkK2NuxCmbhdyTeFR3H5ouAFp3243KSWI
X-Google-Smtp-Source: ABdhPJyjrCP6FHICL+Zro5pGQfN1u1tGoi+yH6etRgEKOfq3JUVoYS7lFyy7VGUw8ZwzpSfZy50Hwg==
X-Received: by 2002:a17:902:aa0c:b029:e5:da5f:5f66 with SMTP id
 be12-20020a170902aa0cb02900e5da5f5f66mr25599992plb.81.1616398216222; 
 Mon, 22 Mar 2021 00:30:16 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id d13sm11373422pgb.6.2021.03.22.00.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 00:30:15 -0700 (PDT)
Message-ID: <b06ebe14-a714-c882-8bdf-ac41de9a8523@ozlabs.ru>
Date: Mon, 22 Mar 2021 18:30:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-20-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 06/03/2021 02:06, Nicholas Piggin wrote:
> In the interest of minimising the amount of code that is run in
> "real-mode", don't handle hcalls in real mode in the P9 path.
> 
> POWER8 and earlier are much more expensive to exit from HV real mode
> and switch to host mode, because on those processors HV interrupts get
> to the hypervisor with the MMU off, and the other threads in the core
> need to be pulled out of the guest, and SLBs all need to be saved,
> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
> in host mode. Hash guests also require a lot of hcalls to run. The
> XICS interrupt controller requires hcalls to run.
> 
> By contrast, POWER9 has independent thread switching, and in radix mode
> the hypervisor is already in a host virtual memory mode when the HV
> interrupt is taken. Radix + xive guests don't need hcalls to handle
> interrupts or manage translations.
> 
> So it's much less important to handle hcalls in real mode in P9.

So acde25726bc6034b (which added if(kvm_is_radix(vcpu->kvm))return 
H_TOO_HARD) can be reverted, pretty much?



> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/kvm_ppc.h      |  5 +++
>   arch/powerpc/kvm/book3s_hv.c            | 46 +++++++++++++++----
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 +++
>   arch/powerpc/kvm/book3s_xive.c          | 60 +++++++++++++++++++++++++
>   4 files changed, 108 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 73b1ca5a6471..db6646c2ade2 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>   extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>   extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>   extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>   extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>   extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>   extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
>   static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>   static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>   	{ return 0; }
> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +	{ return 0; }
>   #endif
>   
>   #ifdef CONFIG_KVM_XIVE
> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>   			       int level, bool line_status);
>   extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>   extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);
>   
>   static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>   {
> @@ -714,6 +718,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>   				      int level, bool line_status) { return -ENODEV; }
>   static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>   static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
> +static inline void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu) { }
>   
>   static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>   	{ return 0; }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 497f216ad724..1f2ba8955c6a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1147,7 +1147,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>    * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>    * that the cede logic in kvmppc_run_single_vcpu() works properly.
>    */
> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>   {
>   	vcpu->arch.shregs.msr |= MSR_EE;
>   	vcpu->arch.ceded = 1;
> @@ -1403,9 +1403,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>   		/* hcall - punt to userspace */
>   		int i;
>   
> -		/* hypercall with MSR_PR has already been handled in rmode,
> -		 * and never reaches here.
> -		 */
> +		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
> +			/*
> +			 * Guest userspace executed sc 1, reflect it back as a
> +			 * privileged program check interrupt.
> +			 */
> +			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
> +			r = RESUME_GUEST;
> +			break;
> +		}
>   
>   		run->papr_hcall.nr = kvmppc_get_gpr(vcpu, 3);
>   		for (i = 0; i < 9; ++i)
> @@ -3740,15 +3746,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   		/* H_CEDE has to be handled now, not later */
>   		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>   		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
> -			kvmppc_nested_cede(vcpu);
> +			kvmppc_cede(vcpu);
>   			kvmppc_set_gpr(vcpu, 3, 0);
>   			trap = 0;
>   		}
>   	} else {
>   		kvmppc_xive_push_vcpu(vcpu);
>   		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
> -		kvmppc_xive_pull_vcpu(vcpu);
> +		/* H_CEDE has to be handled now, not later */
> +		/* XICS hcalls must be handled before xive is pulled */
> +		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>   
> +			if (req == H_CEDE) {
> +				kvmppc_cede(vcpu);
> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
> +				kvmppc_set_gpr(vcpu, 3, 0);
> +				trap = 0;
> +			}
> +			if (req == H_EOI || req == H_CPPR ||

else if (req == H_EOI ... ?

> +			    req == H_IPI || req == H_IPOLL ||
> +			    req == H_XIRR || req == H_XIRR_X) {
> +				unsigned long ret;
> +
> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
> +				kvmppc_set_gpr(vcpu, 3, ret);
> +				trap = 0;
> +			}
> +		}
> +		kvmppc_xive_pull_vcpu(vcpu);
>   	}
>   
>   	vcpu->arch.slb_max = 0;
> @@ -4408,8 +4435,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>   		else
>   			r = kvmppc_run_vcpu(vcpu);
>   
> -		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> +		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
> +			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
> +				r = RESUME_GUEST;
> +				continue;
> +			}
>   			trace_kvm_hcall_enter(vcpu);
>   			r = kvmppc_pseries_do_hcall(vcpu);
>   			trace_kvm_hcall_exit(vcpu, r);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index c11597f815e4..2d0d14ed1d92 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   	mr	r4,r9
>   	bge	fast_guest_return
>   2:
> +	/* If we came in through the P9 short path, no real mode hcalls */
> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
> +	cmpwi	r0, 0
> +	bne	no_try_real
>   	/* See if this is an hcall we can handle in real mode */
>   	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
>   	beq	hcall_try_real_mode
> +no_try_real:
>   
>   	/* Hypervisor doorbell - exit only if host IPI flag set */
>   	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 52cdb9e2660a..1e4871bbcad4 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -158,6 +158,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>   }
>   EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>   
> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
> +{
> +	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
> +
> +	if (!esc_vaddr)
> +		return;
> +
> +	/* we are using XIVE with single escalation */
> +
> +	if (vcpu->arch.xive_esc_on) {
> +		/*
> +		 * If we still have a pending escalation, abort the cede,
> +		 * and we must set PQ to 10 rather than 00 so that we don't
> +		 * potentially end up with two entries for the escalation
> +		 * interrupt in the XIVE interrupt queue.  In that case
> +		 * we also don't want to set xive_esc_on to 1 here in
> +		 * case we race with xive_esc_irq().
> +		 */
> +		vcpu->arch.ceded = 0;
> +		/*
> +		 * The escalation interrupts are special as we don't EOI them.
> +		 * There is no need to use the load-after-store ordering offset
> +		 * to set PQ to 10 as we won't use StoreEOI.
> +		 */
> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
> +	} else {
> +		vcpu->arch.xive_esc_on = true;
> +		mb();
> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
> +	}
> +	mb();


Uff. Thanks for cut-n-pasting the comments, helped a lot to match this c 
to that asm!


> +}
> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
> +
>   /*
>    * This is a simple trigger for a generic XIVE IRQ. This must
>    * only be called for interrupts that support a trigger page
> @@ -2106,6 +2140,32 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>   	return 0;
>   }
>   
> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;


Can a XIVE enabled guest issue these hcalls? Don't we want if 
(!kvmppc_xics_enabled(vcpu)) and
  if (xics_on_xive()) here, as kvmppc_rm_h_xirr() have? Some of these 
hcalls do write to XIVE registers but some seem to change 
kvmppc_xive_vcpu. Thanks,




> +
> +	switch (req) {
> +	case H_XIRR:
> +		return xive_vm_h_xirr(vcpu);
> +	case H_CPPR:
> +		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_EOI:
> +		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_IPI:
> +		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
> +					  kvmppc_get_gpr(vcpu, 5));
> +	case H_IPOLL:
> +		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_XIRR_X:
> +		xive_vm_h_xirr(vcpu);
> +		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
> +		return H_SUCCESS;
> +	}
> +
> +	return H_UNSUPPORTED;
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
> +
>   int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
>   {
>   	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
> 

-- 
Alexey
