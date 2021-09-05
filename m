Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C07CB400DCC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Sep 2021 04:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2Fn76mFlz2yPM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Sep 2021 12:27:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=X4CxIdEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=X4CxIdEJ; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2FmP38cPz2xsQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Sep 2021 12:27:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso2263936pjq.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Sep 2021 19:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sTx/blmdXkyFW4cdD5Xgc1D3BKuYTREessMByUS2XKI=;
 b=X4CxIdEJgBYOz6QRbrYpIyQHqzTCL9s7+Fv44VFnh/ayKPzqDNuEJD3PAU+sfIjYUC
 yjdCwAji2c1Urqmd0fqWzjgvVMJ2KPtitB6JMwHjulqgv4i/H5LJXx/PUTsC0xZu/jXI
 mc2ev7w8Bw+wFdWtq7v7LKcicV+r+D7gUTWjJpFm19PxFC5euqEXOc6FD+t//YYHso7d
 uZC4s49OozynBMcDaFQlrkGzf2WhHJ2arinnecbn3RBgESo2Xk5lcBIzSKFpdetK0aI+
 KFgxtYnvWlDNk1u1y5AlXypjqWi4vNAUD9xpUXch15vVcwinRspiz1V1vG8ThHeA6Zv3
 UpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sTx/blmdXkyFW4cdD5Xgc1D3BKuYTREessMByUS2XKI=;
 b=FpZoq3NgjifrN39UWMeWgEDQqOT9A6ANWT91LR+VNowkQcbbfG/jh58RA9PYbIRzcL
 5YVua3UYeftCC+IEqwKIGRIKp70KpRIbFAWl5BF+J9GrMJhaMASBwgOdV3hobtZVevze
 JlWMLqEqmSHYGXfdrfvh59XLYVeL2G1JszgHg5YyS5/GQsMQ481xlVM3Spc43zpp/ulh
 j0HXs1EPxICOAPtpIwkg91dLTL1RxJEz1/OW6NKyGJkOulHS5licHXYKM/GQVBjDuqtR
 fvEcNsF5SNM6VYD5PbtWBRhwPjCURpRGiv4U+NwZSCV+Fnj6vhNFKB3Ew+nlKVcLVPpc
 5jdA==
X-Gm-Message-State: AOAM531WwCioO/7VBy2YhN5a6qCTGmfYynzGh78n3iblbHYxhj/4IfNT
 e/Z2YfdJrKH3FTXn2T59u9yCZWRaSlAdmg==
X-Google-Smtp-Source: ABdhPJy1kvbAYTOLHfMLvNJIxAhvFuLg+EimjTIgcaZeONjvLC8epxaTAJyrEtdehEhk0wIZ4/IgsQ==
X-Received: by 2002:a17:90b:250e:: with SMTP id
 ns14mr6869743pjb.84.1630808830462; 
 Sat, 04 Sep 2021 19:27:10 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id q21sm3966525pgk.71.2021.09.04.19.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 19:27:09 -0700 (PDT)
Message-ID: <872d75a4-08e2-f597-0bee-6be9fdce0ac1@ozlabs.ru>
Date: Sun, 5 Sep 2021 12:27:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Subject: Re: [PATCH kernel v2] KVM: PPC: Merge powerpc's debugfs entry content
 into generic entry
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20210904133532.2871562-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210904133532.2871562-1-aik@ozlabs.ru>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please ignore this one, v3 is coming.

After I posted this, I suddenly realized that the vcpu debugfs entry 
remain until the VM exists and this does not handle vcpu 
hotunplug+hotplug (the ppc book3e did handle this). Thanks,


On 04/09/2021 23:35, Alexey Kardashevskiy wrote:
> At the moment the generic KVM code creates an "%pid-%fd" entry per a KVM
> instance; and the PPC HV KVM creates its own at "vm%pid". The Book3E KVM
> creates its own entry for timings.
> 
> The problems with the PPC entries are:
> 1. they do not allow multiple VMs in the same process (which is extremely
> rare case mostly used by syzkaller fuzzer);
> 2. prone to race bugs like the generic KVM code had fixed in
> commit 85cd39af14f4 ("KVM: Do not leak memory for duplicate debugfs
> directories").
> 
> This defines kvm_arch_create_kvm_debugfs() similar to one for vcpus.
> 
> This defines 2 hooks in kvmppc_ops for allowing specific KVM
> implementations to add necessary entries. This defines handlers
> for HV KVM and defines the Book3E debugfs vcpu helper as a handler.
> 
> This makes use of already existing kvm_arch_create_vcpu_debugfs
> on PPC.
> 
> This removes no more used debugfs_dir pointers from PPC kvm_arch structs.
> 
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * handled powerpc-booke
> * s/kvm/vm/ in arch hooks
> ---
>   arch/powerpc/include/asm/kvm_host.h    |  7 +++---
>   arch/powerpc/include/asm/kvm_ppc.h     |  2 ++
>   arch/powerpc/kvm/timing.h              |  7 +++---
>   include/linux/kvm_host.h               |  3 +++
>   arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
>   arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
>   arch/powerpc/kvm/book3s_hv.c           | 30 +++++++++-----------------
>   arch/powerpc/kvm/e500.c                |  1 +
>   arch/powerpc/kvm/e500mc.c              |  1 +
>   arch/powerpc/kvm/powerpc.c             | 15 ++++++++++---
>   arch/powerpc/kvm/timing.c              | 20 ++++-------------
>   virt/kvm/kvm_main.c                    |  3 +++
>   12 files changed, 44 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 2bcac6da0a4b..f29b66cc2163 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -296,7 +296,6 @@ struct kvm_arch {
>   	bool dawr1_enabled;
>   	pgd_t *pgtable;
>   	u64 process_table;
> -	struct dentry *debugfs_dir;
>   	struct kvm_resize_hpt *resize_hpt; /* protected by kvm->lock */
>   #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> @@ -672,7 +671,6 @@ struct kvm_vcpu_arch {
>   	u64 timing_min_duration[__NUMBER_OF_KVM_EXIT_TYPES];
>   	u64 timing_max_duration[__NUMBER_OF_KVM_EXIT_TYPES];
>   	u64 timing_last_exit;
> -	struct dentry *debugfs_exit_timing;
>   #endif
>   
>   #ifdef CONFIG_PPC_BOOK3S
> @@ -828,8 +826,6 @@ struct kvm_vcpu_arch {
>   	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
>   	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
>   	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
> -
> -	struct dentry *debugfs_dir;
>   #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
>   };
>   
> @@ -868,4 +864,7 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
>   
> +#define __KVM_HAVE_ARCH_VCPU_DEBUGFS
> +#define __KVM_HAVE_ARCH_KVM_DEBUGFS
> +
>   #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 6355a6980ccf..fd841e844b90 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -316,6 +316,8 @@ struct kvmppc_ops {
>   	int (*svm_off)(struct kvm *kvm);
>   	int (*enable_dawr1)(struct kvm *kvm);
>   	bool (*hash_v3_possible)(void);
> +	void (*create_vm_debugfs)(struct kvm *kvm);
> +	void (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
>   };
>   
>   extern struct kvmppc_ops *kvmppc_hv_ops;
> diff --git a/arch/powerpc/kvm/timing.h b/arch/powerpc/kvm/timing.h
> index feef7885ba82..36f7c201c6f1 100644
> --- a/arch/powerpc/kvm/timing.h
> +++ b/arch/powerpc/kvm/timing.h
> @@ -14,8 +14,8 @@
>   #ifdef CONFIG_KVM_EXIT_TIMING
>   void kvmppc_init_timing_stats(struct kvm_vcpu *vcpu);
>   void kvmppc_update_timing_stats(struct kvm_vcpu *vcpu);
> -void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id);
> -void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu);
> +void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
> +				struct dentry *debugfs_dentry);
>   
>   static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type)
>   {
> @@ -27,8 +27,7 @@ static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type)
>   static inline void kvmppc_init_timing_stats(struct kvm_vcpu *vcpu) {}
>   static inline void kvmppc_update_timing_stats(struct kvm_vcpu *vcpu) {}
>   static inline void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
> -						unsigned int id) {}
> -static inline void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
> +					      struct dentry *debugfs_dentry) {}
>   static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type) {}
>   #endif /* CONFIG_KVM_EXIT_TIMING */
>   
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index ae7735b490b4..4f22b1201a0d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1021,6 +1021,9 @@ int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state);
>   #ifdef __KVM_HAVE_ARCH_VCPU_DEBUGFS
>   void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
>   #endif
> +#ifdef __KVM_HAVE_ARCH_KVM_DEBUGFS
> +void kvm_arch_create_vm_debugfs(struct kvm *kvm);
> +#endif
>   
>   int kvm_arch_hardware_enable(void);
>   void kvm_arch_hardware_disable(void);
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index c63e263312a4..33dae253a0ac 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -2112,7 +2112,7 @@ static const struct file_operations debugfs_htab_fops = {
>   
>   void kvmppc_mmu_debugfs_init(struct kvm *kvm)
>   {
> -	debugfs_create_file("htab", 0400, kvm->arch.debugfs_dir, kvm,
> +	debugfs_create_file("htab", 0400, kvm->debugfs_dentry, kvm,
>   			    &debugfs_htab_fops);
>   }
>   
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index c5508744e14c..f4e083c20872 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -1452,7 +1452,7 @@ static const struct file_operations debugfs_radix_fops = {
>   
>   void kvmhv_radix_debugfs_init(struct kvm *kvm)
>   {
> -	debugfs_create_file("radix", 0400, kvm->arch.debugfs_dir, kvm,
> +	debugfs_create_file("radix", 0400, kvm->debugfs_dentry, kvm,
>   			    &debugfs_radix_fops);
>   }
>   
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index c8f12b056968..046df9e0d462 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2771,19 +2771,14 @@ static const struct file_operations debugfs_timings_ops = {
>   };
>   
>   /* Create a debugfs directory for the vcpu */
> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
> +static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>   {
> -	char buf[16];
> -	struct kvm *kvm = vcpu->kvm;
> -
> -	snprintf(buf, sizeof(buf), "vcpu%u", id);
> -	vcpu->arch.debugfs_dir = debugfs_create_dir(buf, kvm->arch.debugfs_dir);
> -	debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir, vcpu,
> +	debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
>   			    &debugfs_timings_ops);
>   }
>   
>   #else /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
> +static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>   {
>   }
>   #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
> @@ -2907,8 +2902,6 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>   	vcpu->arch.cpu_type = KVM_CPU_3S_64;
>   	kvmppc_sanity_check(vcpu);
>   
> -	debugfs_vcpu_init(vcpu, id);
> -
>   	return 0;
>   }
>   
> @@ -5186,7 +5179,6 @@ void kvmppc_free_host_rm_ops(void)
>   static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>   {
>   	unsigned long lpcr, lpid;
> -	char buf[32];
>   	int ret;
>   
>   	mutex_init(&kvm->arch.uvmem_lock);
> @@ -5319,16 +5311,14 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>   		kvm->arch.smt_mode = 1;
>   	kvm->arch.emul_smt_mode = 1;
>   
> -	/*
> -	 * Create a debugfs directory for the VM
> -	 */
> -	snprintf(buf, sizeof(buf), "vm%d", current->pid);
> -	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
> +	return 0;
> +}
> +
> +static void kvmppc_arch_create_vm_debugfs_hv(struct kvm *kvm)
> +{
>   	kvmppc_mmu_debugfs_init(kvm);
>   	if (radix_enabled())
>   		kvmhv_radix_debugfs_init(kvm);
> -
> -	return 0;
>   }
>   
>   static void kvmppc_free_vcores(struct kvm *kvm)
> @@ -5342,8 +5332,6 @@ static void kvmppc_free_vcores(struct kvm *kvm)
>   
>   static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>   {
> -	debugfs_remove_recursive(kvm->arch.debugfs_dir);
> -
>   	if (!cpu_has_feature(CPU_FTR_ARCH_300))
>   		kvm_hv_vm_deactivated();
>   
> @@ -5996,6 +5984,8 @@ static struct kvmppc_ops kvm_ops_hv = {
>   	.svm_off = kvmhv_svm_off,
>   	.enable_dawr1 = kvmhv_enable_dawr1,
>   	.hash_v3_possible = kvmppc_hash_v3_possible,
> +	.create_vcpu_debugfs = kvmppc_arch_create_vcpu_debugfs_hv,
> +	.create_vm_debugfs = kvmppc_arch_create_vm_debugfs_hv,
>   };
>   
>   static int kvm_init_subcore_bitmap(void)
> diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
> index 7e8b69015d20..d82e70c3e0a9 100644
> --- a/arch/powerpc/kvm/e500.c
> +++ b/arch/powerpc/kvm/e500.c
> @@ -495,6 +495,7 @@ static struct kvmppc_ops kvm_ops_e500 = {
>   	.emulate_op = kvmppc_core_emulate_op_e500,
>   	.emulate_mtspr = kvmppc_core_emulate_mtspr_e500,
>   	.emulate_mfspr = kvmppc_core_emulate_mfspr_e500,
> +	.create_vcpu_debugfs = kvmppc_create_vcpu_debugfs,
>   };
>   
>   static int __init kvmppc_e500_init(void)
> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> index 1c189b5aadcc..45eacd949f4b 100644
> --- a/arch/powerpc/kvm/e500mc.c
> +++ b/arch/powerpc/kvm/e500mc.c
> @@ -381,6 +381,7 @@ static struct kvmppc_ops kvm_ops_e500mc = {
>   	.emulate_op = kvmppc_core_emulate_op_e500,
>   	.emulate_mtspr = kvmppc_core_emulate_mtspr_e500,
>   	.emulate_mfspr = kvmppc_core_emulate_mfspr_e500,
> +	.create_vcpu_debugfs = kvmppc_create_vcpu_debugfs,
>   };
>   
>   static int __init kvmppc_e500mc_init(void)
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index c248d6d8b9e3..c895521ac6e9 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -763,7 +763,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   		goto out_vcpu_uninit;
>   
>   	vcpu->arch.waitp = &vcpu->wait;
> -	kvmppc_create_vcpu_debugfs(vcpu, vcpu->vcpu_id);
>   	return 0;
>   
>   out_vcpu_uninit:
> @@ -780,8 +779,6 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>   	/* Make sure we're not using the vcpu anymore */
>   	hrtimer_cancel(&vcpu->arch.dec_timer);
>   
> -	kvmppc_remove_vcpu_debugfs(vcpu);
> -
>   	switch (vcpu->arch.irq_type) {
>   	case KVMPPC_IRQ_MPIC:
>   		kvmppc_mpic_disconnect_vcpu(vcpu->arch.mpic, vcpu);
> @@ -2505,3 +2502,15 @@ int kvm_arch_init(void *opaque)
>   }
>   
>   EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
> +
> +void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
> +{
> +	if (vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs)
> +		vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs(vcpu, debugfs_dentry);
> +}
> +
> +void kvm_arch_create_vm_debugfs(struct kvm *kvm)
> +{
> +	if (kvm->arch.kvm_ops->create_vm_debugfs)
> +		kvm->arch.kvm_ops->create_vm_debugfs(kvm);
> +}
> diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
> index ba56a5cbba97..e1c17afc714d 100644
> --- a/arch/powerpc/kvm/timing.c
> +++ b/arch/powerpc/kvm/timing.c
> @@ -204,21 +204,9 @@ static const struct file_operations kvmppc_exit_timing_fops = {
>   	.release = single_release,
>   };
>   
> -void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id)
> +void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
> +				struct dentry *debugfs_dentry)
>   {
> -	static char dbg_fname[50];
> -	struct dentry *debugfs_file;
> -
> -	snprintf(dbg_fname, sizeof(dbg_fname), "vm%u_vcpu%u_timing",
> -		 current->pid, id);
> -	debugfs_file = debugfs_create_file(dbg_fname, 0666, kvm_debugfs_dir,
> -						vcpu, &kvmppc_exit_timing_fops);
> -
> -	vcpu->arch.debugfs_exit_timing = debugfs_file;
> -}
> -
> -void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
> -{
> -	debugfs_remove(vcpu->arch.debugfs_exit_timing);
> -	vcpu->arch.debugfs_exit_timing = NULL;
> +	debugfs_create_file("timing", 0666, debugfs_dentry,
> +			    vcpu, &kvmppc_exit_timing_fops);
>   }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index b50dbe269f4b..85b2550e18e7 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -954,6 +954,9 @@ static int kvm_create_vm_debugfs(struct kvm *kvm, int fd)
>   				    kvm->debugfs_dentry, stat_data,
>   				    &stat_fops_per_vm);
>   	}
> +#ifdef __KVM_HAVE_ARCH_KVM_DEBUGFS
> +	kvm_arch_create_vm_debugfs(kvm);
> +#endif
>   	return 0;
>   }
>   
> 

-- 
Alexey
