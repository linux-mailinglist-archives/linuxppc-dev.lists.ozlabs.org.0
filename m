Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C632623CD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 08:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7DLX1B3jz3cMw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 18:41:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n9uROSFj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=robert.hu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n9uROSFj;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7D190f4jz3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 18:26:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668065213; x=1699601213;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pbTBjPz4IyVuY4zZ6WctFWouTkxuPa2wDTFr4cxuFDk=;
  b=n9uROSFjYxaN8wleUbAxR13J6FjQdTqTFo8xVXLAJzkapoUjS9gcOTYq
   AnOuboDephhzCsXA76tV6WVAwLuP5ww3eNR6hNlzi1yoH/On9jlLHsFLT
   r8067yz0H5qwlV80bQZofCVWg3ltbRCN6OTtxAA6QtrUArKX+yDOXR2/g
   yriFtwsVB27cGLQwSxv/an2AItPBkhdp7RRceJxTxrgidZkV3i4D/B5pk
   tT+lQgwqrKfXeaZVmwDmHBhwgyBi7vYhNYJvimqIQYsEWxH5SVrv/yMXH
   Z3kiX6/KwlfY+o9gYRI165BU49CNy5Zujs8MhBThWXAzFMfvN85FcVEH5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="290955929"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="290955929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 23:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700688553"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="700688553"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org) ([10.239.48.212])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2022 23:26:33 -0800
Message-ID: <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
Subject: Re: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
From: Robert Hoo <robert.hu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>
Date: Thu, 10 Nov 2022 15:26:32 +0800
In-Reply-To: <20221102231911.3107438-38-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-38-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 18:41:09 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 23:19 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
> The CPU STARTING section doesn't allow callbacks to fail. Move KVM's
> hotplug callback to ONLINE section so that it can abort onlining a
> CPU in
> certain cases to avoid potentially breaking VMs running on existing
> CPUs.
> For example, when KVM fails to enable hardware virtualization on the
> hotplugged CPU.
> 
> Place KVM's hotplug state before CPUHP_AP_SCHED_WAIT_EMPTY as it
> ensures
> when offlining a CPU, all user tasks and non-pinned kernel tasks have
> left
> the CPU, i.e. there cannot be a vCPU task around. So, it is safe for
> KVM's
> CPU offline callback to disable hardware virtualization at that
> point.
> Likewise, KVM's online callback can enable hardware virtualization
> before
> any vCPU task gets a chance to run on hotplugged CPUs.
> 
> Rename KVM's CPU hotplug callbacks accordingly.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/cpuhotplug.h |  2 +-
>  virt/kvm/kvm_main.c        | 30 ++++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 7337414e4947..de45be38dd27 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -185,7 +185,6 @@ enum cpuhp_state {
>  	CPUHP_AP_CSKY_TIMER_STARTING,
>  	CPUHP_AP_TI_GP_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,
> -	CPUHP_AP_KVM_STARTING,
>  	/* Must be the last timer callback */
>  	CPUHP_AP_DUMMY_TIMER_STARTING,
>  	CPUHP_AP_ARM_XEN_STARTING,
> @@ -200,6 +199,7 @@ enum cpuhp_state {
>  
>  	/* Online section invoked on the hotplugged CPU from the
> hotplug thread */
>  	CPUHP_AP_ONLINE_IDLE,
> +	CPUHP_AP_KVM_ONLINE,
>  	CPUHP_AP_SCHED_WAIT_EMPTY,
>  	CPUHP_AP_SMPBOOT_THREADS,
>  	CPUHP_AP_X86_VDSO_VMA_ONLINE,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dd13af9f06d5..fd9e39c85549 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5026,13 +5026,27 @@ static void hardware_enable_nolock(void
> *junk)
>  	}
>  }
>  
> -static int kvm_starting_cpu(unsigned int cpu)
> +static int kvm_online_cpu(unsigned int cpu)
>  {
> +	int ret = 0;
> +
>  	raw_spin_lock(&kvm_count_lock);
> -	if (kvm_usage_count)
> +	/*
> +	 * Abort the CPU online process if hardware virtualization
> cannot
> +	 * be enabled. Otherwise running VMs would encounter
> unrecoverable
> +	 * errors when scheduled to this CPU.
> +	 */
> +	if (kvm_usage_count) {
> +		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> +
>  		hardware_enable_nolock(NULL);
> +		if (atomic_read(&hardware_enable_failed)) {
> +			atomic_set(&hardware_enable_failed, 0);

I see other places using this hardware_enable_failed with atomic_inc(),
should here use atomic_dec() instead of straightly set to 0?
Though here is embraced by spin_lock, hardware_enable_nolock() can be
invoked in other places in parallel?

Fortunately in the end of this patch set, global hardware_enable_failed
is get rid of.

> +			ret = -EIO;
> +		}
> +	}
>  	raw_spin_unlock(&kvm_count_lock);
> -	return 0;
> +	return ret;
>  }
>  
>  static void hardware_disable_nolock(void *junk)
> @@ -5045,7 +5059,7 @@ static void hardware_disable_nolock(void *junk)
>  	kvm_arch_hardware_disable();
>  }
>  
> -static int kvm_dying_cpu(unsigned int cpu)
> +static int kvm_offline_cpu(unsigned int cpu)
>  {
>  	raw_spin_lock(&kvm_count_lock);
>  	if (kvm_usage_count)
> @@ -5822,8 +5836,8 @@ int kvm_init(unsigned vcpu_size, unsigned
> vcpu_align, struct module *module)
>  	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
>  		return -ENOMEM;
>  
> -	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_STARTING,
> "kvm/cpu:starting",
> -				      kvm_starting_cpu, kvm_dying_cpu);
> +	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE,
> "kvm/cpu:online",
> +				      kvm_online_cpu, kvm_offline_cpu);
>  	if (r)
>  		goto out_free_2;
>  	register_reboot_notifier(&kvm_reboot_notifier);
> @@ -5897,7 +5911,7 @@ int kvm_init(unsigned vcpu_size, unsigned
> vcpu_align, struct module *module)
>  	kmem_cache_destroy(kvm_vcpu_cache);
>  out_free_3:
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
> -	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
> +	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
>  out_free_2:
>  	free_cpumask_var(cpus_hardware_enabled);
>  	return r;
> @@ -5923,7 +5937,7 @@ void kvm_exit(void)
>  	kvm_async_pf_deinit();
>  	unregister_syscore_ops(&kvm_syscore_ops);
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
> -	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
> +	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
>  	on_each_cpu(hardware_disable_nolock, NULL, 1);
>  	kvm_irqfd_exit();
>  	free_cpumask_var(cpus_hardware_enabled);

