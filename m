Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539D345FD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 14:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4XXV1352z3bqS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 00:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.77.235; helo=10.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 10.mo51.mail-out.ovh.net (10.mo51.mail-out.ovh.net
 [46.105.77.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4XX84sZtz30FH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 00:39:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B0F49273504;
 Tue, 23 Mar 2021 14:38:56 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Mar
 2021 14:38:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00464be326d-43a9-421a-8253-ecaa85fd75eb,
 3463118FEE79F4041422E427733B80787D17A221) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 39/46] KVM: PPC: Book3S HV: Remove virt mode checks
 from real mode handlers
To: Nicholas Piggin <npiggin@gmail.com>, <kvm-ppc@vger.kernel.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-40-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e19767d1-d1a7-b3b1-fe4d-20a473f579e1@kaod.org>
Date: Tue, 23 Mar 2021 14:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210323010305.1045293-40-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4080ff06-d285-4031-9bd1-6073eaa0e0da
X-Ovh-Tracer-Id: 17253290174913612765
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegiedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephedtgfethfduhfduteeuhefffefhgfdtudevudevudfgtdfgjedukeffteelkeffnecuffhomhgrihhnpehrmhhhrghnughlvghrshdrshgsnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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

On 3/23/21 2:02 AM, Nicholas Piggin wrote:
> Now that the P7/8 path no longer supports radix, real-mode handlers
> do not need to deal with being called in virt mode.
> 
> This change effectively reverts commit acde25726bc6 ("KVM: PPC: Book3S
> HV: Add radix checks in real-mode hypercall handlers").
> 
> It removes a few more real-mode tests in rm hcall handlers, which also
> allows the indirect ops for the xive module to be removed from the
> built-in xics rm handlers.
> 
> kvmppc_h_random is renamed to kvmppc_rm_h_random to be a bit more
> descriptive of its function.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/powerpc/include/asm/kvm_ppc.h      | 10 +--
>  arch/powerpc/kvm/book3s.c               | 11 +--
>  arch/powerpc/kvm/book3s_64_vio_hv.c     | 12 ----
>  arch/powerpc/kvm/book3s_hv_builtin.c    | 91 ++++++-------------------
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S |  2 +-
>  arch/powerpc/kvm/book3s_xive.c          | 18 -----
>  arch/powerpc/kvm/book3s_xive.h          |  7 --
>  arch/powerpc/kvm/book3s_xive_native.c   | 10 ---
>  8 files changed, 23 insertions(+), 138 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index db6646c2ade2..5dfb3f167f2c 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -659,8 +659,6 @@ extern int kvmppc_xive_get_xive(struct kvm *kvm, u32 irq, u32 *server,
>  				u32 *priority);
>  extern int kvmppc_xive_int_on(struct kvm *kvm, u32 irq);
>  extern int kvmppc_xive_int_off(struct kvm *kvm, u32 irq);
> -extern void kvmppc_xive_init_module(void);
> -extern void kvmppc_xive_exit_module(void);
>  
>  extern int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  				    struct kvm_vcpu *vcpu, u32 cpu);
> @@ -686,8 +684,6 @@ static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  extern int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  					   struct kvm_vcpu *vcpu, u32 cpu);
>  extern void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu);
> -extern void kvmppc_xive_native_init_module(void);
> -extern void kvmppc_xive_native_exit_module(void);
>  extern int kvmppc_xive_native_get_vp(struct kvm_vcpu *vcpu,
>  				     union kvmppc_one_reg *val);
>  extern int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcpu,
> @@ -701,8 +697,6 @@ static inline int kvmppc_xive_get_xive(struct kvm *kvm, u32 irq, u32 *server,
>  				       u32 *priority) { return -1; }
>  static inline int kvmppc_xive_int_on(struct kvm *kvm, u32 irq) { return -1; }
>  static inline int kvmppc_xive_int_off(struct kvm *kvm, u32 irq) { return -1; }
> -static inline void kvmppc_xive_init_module(void) { }
> -static inline void kvmppc_xive_exit_module(void) { }
>  
>  static inline int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  					   struct kvm_vcpu *vcpu, u32 cpu) { return -EBUSY; }
> @@ -725,8 +719,6 @@ static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  static inline int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  			  struct kvm_vcpu *vcpu, u32 cpu) { return -EBUSY; }
>  static inline void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu) { }
> -static inline void kvmppc_xive_native_init_module(void) { }
> -static inline void kvmppc_xive_native_exit_module(void) { }
>  static inline int kvmppc_xive_native_get_vp(struct kvm_vcpu *vcpu,
>  					    union kvmppc_one_reg *val)
>  { return 0; }
> @@ -762,7 +754,7 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
>  			   unsigned long tce_value, unsigned long npages);
>  long int kvmppc_rm_h_confer(struct kvm_vcpu *vcpu, int target,
>                              unsigned int yield_count);
> -long kvmppc_h_random(struct kvm_vcpu *vcpu);
> +long kvmppc_rm_h_random(struct kvm_vcpu *vcpu);
>  void kvmhv_commence_exit(int trap);
>  void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu);
>  void kvmppc_subcore_enter_guest(void);
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 44bf567b6589..1888aedfd410 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -1046,13 +1046,10 @@ static int kvmppc_book3s_init(void)
>  #ifdef CONFIG_KVM_XICS
>  #ifdef CONFIG_KVM_XIVE
>  	if (xics_on_xive()) {
> -		kvmppc_xive_init_module();
>  		kvm_register_device_ops(&kvm_xive_ops, KVM_DEV_TYPE_XICS);
> -		if (kvmppc_xive_native_supported()) {
> -			kvmppc_xive_native_init_module();
> +		if (kvmppc_xive_native_supported())
>  			kvm_register_device_ops(&kvm_xive_native_ops,
>  						KVM_DEV_TYPE_XIVE);
> -		}
>  	} else
>  #endif
>  		kvm_register_device_ops(&kvm_xics_ops, KVM_DEV_TYPE_XICS);
> @@ -1062,12 +1059,6 @@ static int kvmppc_book3s_init(void)
>  
>  static void kvmppc_book3s_exit(void)
>  {
> -#ifdef CONFIG_KVM_XICS
> -	if (xics_on_xive()) {
> -		kvmppc_xive_exit_module();
> -		kvmppc_xive_native_exit_module();
> -	}
> -#endif
>  #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
>  	kvmppc_book3s_exit_pr();
>  #endif
> diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
> index 083a4e037718..dc6591548f0c 100644
> --- a/arch/powerpc/kvm/book3s_64_vio_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
> @@ -391,10 +391,6 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
>  	/* udbg_printf("H_PUT_TCE(): liobn=0x%lx ioba=0x%lx, tce=0x%lx\n", */
>  	/* 	    liobn, ioba, tce); */
>  
> -	/* For radix, we might be in virtual mode, so punt */
> -	if (kvm_is_radix(vcpu->kvm))
> -		return H_TOO_HARD;
> -
>  	stt = kvmppc_find_table(vcpu->kvm, liobn);
>  	if (!stt)
>  		return H_TOO_HARD;
> @@ -489,10 +485,6 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
>  	bool prereg = false;
>  	struct kvmppc_spapr_tce_iommu_table *stit;
>  
> -	/* For radix, we might be in virtual mode, so punt */
> -	if (kvm_is_radix(vcpu->kvm))
> -		return H_TOO_HARD;
> -
>  	/*
>  	 * used to check for invalidations in progress
>  	 */
> @@ -602,10 +594,6 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
>  	long i, ret;
>  	struct kvmppc_spapr_tce_iommu_table *stit;
>  
> -	/* For radix, we might be in virtual mode, so punt */
> -	if (kvm_is_radix(vcpu->kvm))
> -		return H_TOO_HARD;
> -
>  	stt = kvmppc_find_table(vcpu->kvm, liobn);
>  	if (!stt)
>  		return H_TOO_HARD;
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 7a0e33a9c980..8d669a0e15f8 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -34,21 +34,6 @@
>  #include "book3s_xics.h"
>  #include "book3s_xive.h"
>  
> -/*
> - * The XIVE module will populate these when it loads
> - */
> -unsigned long (*__xive_vm_h_xirr)(struct kvm_vcpu *vcpu);
> -unsigned long (*__xive_vm_h_ipoll)(struct kvm_vcpu *vcpu, unsigned long server);
> -int (*__xive_vm_h_ipi)(struct kvm_vcpu *vcpu, unsigned long server,
> -		       unsigned long mfrr);
> -int (*__xive_vm_h_cppr)(struct kvm_vcpu *vcpu, unsigned long cppr);
> -int (*__xive_vm_h_eoi)(struct kvm_vcpu *vcpu, unsigned long xirr);
> -EXPORT_SYMBOL_GPL(__xive_vm_h_xirr);
> -EXPORT_SYMBOL_GPL(__xive_vm_h_ipoll);
> -EXPORT_SYMBOL_GPL(__xive_vm_h_ipi);
> -EXPORT_SYMBOL_GPL(__xive_vm_h_cppr);
> -EXPORT_SYMBOL_GPL(__xive_vm_h_eoi);
> -
>  /*
>   * Hash page table alignment on newer cpus(CPU_FTR_ARCH_206)
>   * should be power of 2.
> @@ -196,16 +181,9 @@ int kvmppc_hwrng_present(void)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
>  
> -long kvmppc_h_random(struct kvm_vcpu *vcpu)
> +long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
>  {
> -	int r;
> -
> -	/* Only need to do the expensive mfmsr() on radix */
> -	if (kvm_is_radix(vcpu->kvm) && (mfmsr() & MSR_IR))
> -		r = powernv_get_random_long(&vcpu->arch.regs.gpr[4]);
> -	else
> -		r = powernv_get_random_real_mode(&vcpu->arch.regs.gpr[4]);
> -	if (r)
> +	if (powernv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
>  		return H_SUCCESS;
>  
>  	return H_HARDWARE;
> @@ -541,22 +519,13 @@ static long kvmppc_read_one_intr(bool *again)
>  }
>  
>  #ifdef CONFIG_KVM_XICS
> -static inline bool is_rm(void)
> -{
> -	return !(mfmsr() & MSR_DR);
> -}
> -
>  unsigned long kvmppc_rm_h_xirr(struct kvm_vcpu *vcpu)
>  {
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_xirr(vcpu);
> -		if (unlikely(!__xive_vm_h_xirr))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_xirr(vcpu);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_xirr(vcpu);
> +	else
>  		return xics_rm_h_xirr(vcpu);
>  }
>  
> @@ -565,13 +534,9 @@ unsigned long kvmppc_rm_h_xirr_x(struct kvm_vcpu *vcpu)
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
>  	vcpu->arch.regs.gpr[5] = get_tb();
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_xirr(vcpu);
> -		if (unlikely(!__xive_vm_h_xirr))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_xirr(vcpu);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_xirr(vcpu);
> +	else
>  		return xics_rm_h_xirr(vcpu);
>  }
>  
> @@ -579,13 +544,9 @@ unsigned long kvmppc_rm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server)
>  {
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_ipoll(vcpu, server);
> -		if (unlikely(!__xive_vm_h_ipoll))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_ipoll(vcpu, server);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_ipoll(vcpu, server);
> +	else
>  		return H_TOO_HARD;
>  }
>  
> @@ -594,13 +555,9 @@ int kvmppc_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>  {
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_ipi(vcpu, server, mfrr);
> -		if (unlikely(!__xive_vm_h_ipi))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_ipi(vcpu, server, mfrr);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_ipi(vcpu, server, mfrr);
> +	else
>  		return xics_rm_h_ipi(vcpu, server, mfrr);
>  }
>  
> @@ -608,13 +565,9 @@ int kvmppc_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr)
>  {
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_cppr(vcpu, cppr);
> -		if (unlikely(!__xive_vm_h_cppr))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_cppr(vcpu, cppr);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_cppr(vcpu, cppr);
> +	else
>  		return xics_rm_h_cppr(vcpu, cppr);
>  }
>  
> @@ -622,13 +575,9 @@ int kvmppc_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
>  {
>  	if (!kvmppc_xics_enabled(vcpu))
>  		return H_TOO_HARD;
> -	if (xics_on_xive()) {
> -		if (is_rm())
> -			return xive_rm_h_eoi(vcpu, xirr);
> -		if (unlikely(!__xive_vm_h_eoi))
> -			return H_NOT_AVAILABLE;
> -		return __xive_vm_h_eoi(vcpu, xirr);
> -	} else
> +	if (xics_on_xive())
> +		return xive_rm_h_eoi(vcpu, xirr);
> +	else
>  		return xics_rm_h_eoi(vcpu, xirr);
>  }
>  #endif /* CONFIG_KVM_XICS */
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index b1f3ee16fd84..564ca9feef35 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -2323,7 +2323,7 @@ hcall_real_table:
>  #else
>  	.long	0		/* 0x2fc - H_XIRR_X*/
>  #endif
> -	.long	DOTSYM(kvmppc_h_random) - hcall_real_table
> +	.long	DOTSYM(kvmppc_rm_h_random) - hcall_real_table
>  	.globl	hcall_real_table_end
>  hcall_real_table_end:
>  
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index dcc07ceaf5ca..80d32b4eb898 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2358,21 +2358,3 @@ struct kvm_device_ops kvm_xive_ops = {
>  	.get_attr = xive_get_attr,
>  	.has_attr = xive_has_attr,
>  };
> -
> -void kvmppc_xive_init_module(void)
> -{
> -	__xive_vm_h_xirr = xive_vm_h_xirr;
> -	__xive_vm_h_ipoll = xive_vm_h_ipoll;
> -	__xive_vm_h_ipi = xive_vm_h_ipi;
> -	__xive_vm_h_cppr = xive_vm_h_cppr;
> -	__xive_vm_h_eoi = xive_vm_h_eoi;
> -}
> -
> -void kvmppc_xive_exit_module(void)
> -{
> -	__xive_vm_h_xirr = NULL;
> -	__xive_vm_h_ipoll = NULL;
> -	__xive_vm_h_ipi = NULL;
> -	__xive_vm_h_cppr = NULL;
> -	__xive_vm_h_eoi = NULL;
> -}
> diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
> index 86c24a4ad809..afe9eeac6d56 100644
> --- a/arch/powerpc/kvm/book3s_xive.h
> +++ b/arch/powerpc/kvm/book3s_xive.h
> @@ -289,13 +289,6 @@ extern int xive_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>  extern int xive_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
>  extern int xive_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr);
>  
> -extern unsigned long (*__xive_vm_h_xirr)(struct kvm_vcpu *vcpu);
> -extern unsigned long (*__xive_vm_h_ipoll)(struct kvm_vcpu *vcpu, unsigned long server);
> -extern int (*__xive_vm_h_ipi)(struct kvm_vcpu *vcpu, unsigned long server,
> -			      unsigned long mfrr);
> -extern int (*__xive_vm_h_cppr)(struct kvm_vcpu *vcpu, unsigned long cppr);
> -extern int (*__xive_vm_h_eoi)(struct kvm_vcpu *vcpu, unsigned long xirr);
> -
>  /*
>   * Common Xive routines for XICS-over-XIVE and XIVE native
>   */
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 76800c84f2a3..1253666dd4d8 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1281,13 +1281,3 @@ struct kvm_device_ops kvm_xive_native_ops = {
>  	.has_attr = kvmppc_xive_native_has_attr,
>  	.mmap = kvmppc_xive_native_mmap,
>  };
> -
> -void kvmppc_xive_native_init_module(void)
> -{
> -	;
> -}
> -
> -void kvmppc_xive_native_exit_module(void)
> -{
> -	;
> -}
> 

