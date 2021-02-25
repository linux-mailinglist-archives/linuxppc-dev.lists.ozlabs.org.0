Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D43251DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 16:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmbZv0hTnz3cjS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 02:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 515 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 02:00:51 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmbZW6Vxdz3cYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 02:00:51 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3C0278AC7F32;
 Thu, 25 Feb 2021 15:51:59 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Feb
 2021 15:51:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067f0c05ec-7bd6-48b8-a28b-f687f0b86e07,
 9C9DEF3F79489C38EF11C1F544F43890D267D965) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH v2 16/37] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Nicholas Piggin <npiggin@gmail.com>, <kvm-ppc@vger.kernel.org>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-17-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <47ae7b2f-9356-6cff-da38-142eaea773ca@kaod.org>
Date: Thu, 25 Feb 2021 15:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225134652.2127648-17-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7ddd68c-9d33-4a7f-a9f5-ba04aee97243
X-Ovh-Tracer-Id: 13370905819791133661
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejieffveetveefieevhfdugfejjeelteegfffgjedtjefguddvjeevkeevuedukeenucffohhmrghinheprhhmhhgrnhgulhgvrhhsrdhssgenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
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

On 2/25/21 2:46 PM, Nicholas Piggin wrote:
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
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_ppc.h      |  5 +++++
>  arch/powerpc/kvm/book3s_hv.c            | 25 ++++++++++++++++++++++---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 +++++
>  arch/powerpc/kvm/book3s_xive.c          | 25 +++++++++++++++++++++++++
>  4 files changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 73b1ca5a6471..db6646c2ade2 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>  extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>  extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>  extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>  extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>  extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>  extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
>  static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>  static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>  	{ return 0; }
> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +	{ return 0; }
>  #endif
>  
>  #ifdef CONFIG_KVM_XIVE
> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>  			       int level, bool line_status);
>  extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>  extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);

I can not find this routine. Is it missing or coming later in the patchset ? 

C. 
 
>  
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  {
> @@ -714,6 +718,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>  				      int level, bool line_status) { return -ENODEV; }
>  static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>  static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
> +static inline void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu) { }
>  
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  	{ return 0; }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 7e23838b7f9b..d4770b222d7e 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1144,7 +1144,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>   */
> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.shregs.msr |= MSR_EE;
>  	vcpu->arch.ceded = 1;
> @@ -3731,15 +3731,34 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		/* H_CEDE has to be handled now, not later */
>  		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>  		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
> -			kvmppc_nested_cede(vcpu);
> +			kvmppc_cede(vcpu);
>  			kvmppc_set_gpr(vcpu, 3, 0);
>  			trap = 0;
>  		}
>  	} else {
>  		kvmppc_xive_push_vcpu(vcpu);
>  		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
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
> +			if (req == H_EOI || req == H_CPPR || req == H_IPI ||
> +			    req == H_IPOLL || req == H_XIRR || req == H_XIRR_X) {
> +				unsigned long ret;
> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
> +				kvmppc_set_gpr(vcpu, 3, ret);
> +				trap = 0;
> +			}
> +		}
> +		kvmppc_xive_pull_vcpu(vcpu);
>  	}
>  
>  	vcpu->arch.slb_max = 0;
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index c11597f815e4..2d0d14ed1d92 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	mr	r4,r9
>  	bge	fast_guest_return
>  2:
> +	/* If we came in through the P9 short path, no real mode hcalls */
> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
> +	cmpwi	r0, 0
> +	bne	no_try_real
>  	/* See if this is an hcall we can handle in real mode */
>  	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
>  	beq	hcall_try_real_mode
> +no_try_real:
>  
>  	/* Hypervisor doorbell - exit only if host IPI flag set */
>  	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 8632fb998a55..d2266d36a7c7 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2109,6 +2109,31 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  	return 0;
>  }
>  
> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
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
> +
>  int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
>  {
>  	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
> 

