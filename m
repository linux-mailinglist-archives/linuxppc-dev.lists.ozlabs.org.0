Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74301619566
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 12:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3dmy2YyYz3f5N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 22:33:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1zpeK/z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=yuan.yao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1zpeK/z;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3Vt23NZGz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 17:22:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667542970; x=1699078970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpPYB6O0Iym/jBFRwx8/3NauFKj5Z5IV2Uq06/9dUi0=;
  b=d1zpeK/zHzHvJxY2XdzzaAAhOjqxTDEiTtNRrtyXFzw3RkTx9lOrod3f
   3EluMLm2SxJdn26fptqfGHPeHt3W/UqLUr0ZwzdjjoZjjGJhTcpZaUAkk
   LImerQsF5AZYwels5dkV1V4XsDiHmRFRsAbYtemClebMDUmpRojVmrnZy
   kzNfpFU13xYl9OyrXLRLwd/wFA/MhNHhKOc/DnguJf/xEMoPmtBk7Ep5s
   bxFoZJSThJZtlsm2U6zUjqe5Xd0mToQTfvlkH7kenJoAcR3uPdpbu7eGZ
   r+apwvgOPzVAeMTq1DV0iYdba4Qx/YzOn5nKJtykhuOizc91bTmzvPZvz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290281060"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="290281060"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 23:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="698531026"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="698531026"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2022 23:22:23 -0700
Date: Fri, 4 Nov 2022 14:22:23 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 08/44] KVM: x86: Move hardware setup/unsetup to init/exit
Message-ID: <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-9-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-9-seanjc@google.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Fri, 04 Nov 2022 22:32:15 +1100
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 11:18:35PM +0000, Sean Christopherson wrote:
> Now that kvm_arch_hardware_setup() is called immediately after
> kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
> kvm_arch_{init,exit}() as a step towards dropping one of the hooks.
>
> To avoid having to unwind various setup, e.g registration of several
> notifiers, slot in the vendor hardware setup before the registration of
> said notifiers and callbacks.  Introducing a functional change while
> moving code is less than ideal, but the alternative is adding a pile of
> unwinding code, which is much more error prone, e.g. several attempts to
> move the setup code verbatim all introduced bugs.
>
> Add a comment to document that kvm_ops_update() is effectively the point
> of no return, e.g. it sets the kvm_x86_ops.hardware_enable canary and so
> needs to be unwound.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 121 +++++++++++++++++++++++----------------------
>  1 file changed, 63 insertions(+), 58 deletions(-)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9a7702b1c563..80ee580a9cd4 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9252,6 +9252,24 @@ static struct notifier_block pvclock_gtod_notifier = {
>  };
>  #endif
>
> +static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
> +{
> +	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
> +
> +#define __KVM_X86_OP(func) \
> +	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
> +#define KVM_X86_OP(func) \
> +	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
> +#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
> +#define KVM_X86_OP_OPTIONAL_RET0(func) \
> +	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
> +					   (void *)__static_call_return0);
> +#include <asm/kvm-x86-ops.h>
> +#undef __KVM_X86_OP
> +
> +	kvm_pmu_ops_update(ops->pmu_ops);
> +}
> +
>  int kvm_arch_init(void *opaque)
>  {
>  	struct kvm_x86_init_ops *ops = opaque;
> @@ -9325,6 +9343,24 @@ int kvm_arch_init(void *opaque)
>  		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
>  	}
>
> +	rdmsrl_safe(MSR_EFER, &host_efer);
> +
> +	if (boot_cpu_has(X86_FEATURE_XSAVES))
> +		rdmsrl(MSR_IA32_XSS, host_xss);
> +
> +	kvm_init_pmu_capability();
> +
> +	r = ops->hardware_setup();
> +	if (r != 0)
> +		goto out_mmu_exit;

The failure case of ops->hardware_setup() is unwound
by kvm_arch_exit() before this patch, do we need to
keep that old behavior ?

> +
> +	/*
> +	 * Point of no return!  DO NOT add error paths below this point unless
> +	 * absolutely necessary, as most operations from this point forward
> +	 * require unwinding.
> +	 */
> +	kvm_ops_update(ops);
> +
>  	kvm_timer_init();
>
>  	if (pi_inject_timer == -1)
> @@ -9336,8 +9372,32 @@ int kvm_arch_init(void *opaque)
>  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
>  #endif
>
> +	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> +
> +	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
> +		kvm_caps.supported_xss = 0;
> +
> +#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
> +	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
> +#undef __kvm_cpu_cap_has
> +
> +	if (kvm_caps.has_tsc_control) {
> +		/*
> +		 * Make sure the user can only configure tsc_khz values that
> +		 * fit into a signed integer.
> +		 * A min value is not calculated because it will always
> +		 * be 1 on all machines.
> +		 */
> +		u64 max = min(0x7fffffffULL,
> +			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
> +		kvm_caps.max_guest_tsc_khz = max;
> +	}
> +	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
> +	kvm_init_msr_list();
>  	return 0;
>
> +out_mmu_exit:
> +	kvm_mmu_vendor_module_exit();
>  out_free_percpu:
>  	free_percpu(user_return_msrs);
>  out_free_x86_emulator_cache:
> @@ -9347,6 +9407,8 @@ int kvm_arch_init(void *opaque)
>
>  void kvm_arch_exit(void)
>  {
> +	kvm_unregister_perf_callbacks();
> +
>  #ifdef CONFIG_X86_64
>  	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
>  		clear_hv_tscchange_cb();
> @@ -9362,6 +9424,7 @@ void kvm_arch_exit(void)
>  	irq_work_sync(&pvclock_irq_work);
>  	cancel_work_sync(&pvclock_gtod_work);
>  #endif
> +	static_call(kvm_x86_hardware_unsetup)();
>  	kvm_x86_ops.hardware_enable = NULL;
>  	kvm_mmu_vendor_module_exit();
>  	free_percpu(user_return_msrs);
> @@ -11922,72 +11985,14 @@ void kvm_arch_hardware_disable(void)
>  	drop_user_return_notifiers();
>  }
>
> -static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
> -{
> -	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
> -
> -#define __KVM_X86_OP(func) \
> -	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
> -#define KVM_X86_OP(func) \
> -	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
> -#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
> -#define KVM_X86_OP_OPTIONAL_RET0(func) \
> -	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
> -					   (void *)__static_call_return0);
> -#include <asm/kvm-x86-ops.h>
> -#undef __KVM_X86_OP
> -
> -	kvm_pmu_ops_update(ops->pmu_ops);
> -}
> -
>  int kvm_arch_hardware_setup(void *opaque)
>  {
> -	struct kvm_x86_init_ops *ops = opaque;
> -	int r;
> -
> -	rdmsrl_safe(MSR_EFER, &host_efer);
> -
> -	if (boot_cpu_has(X86_FEATURE_XSAVES))
> -		rdmsrl(MSR_IA32_XSS, host_xss);
> -
> -	kvm_init_pmu_capability();
> -
> -	r = ops->hardware_setup();
> -	if (r != 0)
> -		return r;
> -
> -	kvm_ops_update(ops);
> -
> -	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> -
> -	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
> -		kvm_caps.supported_xss = 0;
> -
> -#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
> -	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
> -#undef __kvm_cpu_cap_has
> -
> -	if (kvm_caps.has_tsc_control) {
> -		/*
> -		 * Make sure the user can only configure tsc_khz values that
> -		 * fit into a signed integer.
> -		 * A min value is not calculated because it will always
> -		 * be 1 on all machines.
> -		 */
> -		u64 max = min(0x7fffffffULL,
> -			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
> -		kvm_caps.max_guest_tsc_khz = max;
> -	}
> -	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
> -	kvm_init_msr_list();
>  	return 0;
>  }
>
>  void kvm_arch_hardware_unsetup(void)
>  {
> -	kvm_unregister_perf_callbacks();
>
> -	static_call(kvm_x86_hardware_unsetup)();
>  }
>
>  int kvm_arch_check_processor_compat(void *opaque)
> --
> 2.38.1.431.g37b22c650d-goog
>
