Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419E47B99B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 06:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ4z63jsRz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 16:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=x7D+XTyL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=x7D+XTyL; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJ4yL6D2wz2xsZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:39:03 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id p14so3408450plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 21:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=//tQJT8oPwyYXKj/Jh3y32bl9GiOsptU80K/yLiDTJY=;
 b=x7D+XTyLtqIRTUtO3VhupZdKQCI6srghSqBL/dhra1jRrdEOfym2GtG5MUkR+PiTS9
 823adxTTvH+hSvHMtGEasfawIFt/YWSS0/f+SvLSv04lwdvRZu4J9hyLrNb50sgY1CKC
 3qFGNDBycnj/xMkymiVhDQvNlCMxrlGnrsfpxt686xZUcmW7iq+4YmW73jRxjRXTJEYL
 84f9YUJ/+aa7haHVw5qsHeIN+nynz0LC0rA1Yy2UG3y0xDRCN0R6MRJnFJdMfOqzjDoc
 faByVuDPfr9ZhIz/vbkf9WcZ8eDHpMak2SN3YKgqBDClmd47SAXVp5pXSyV9LbnB77wX
 pL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=//tQJT8oPwyYXKj/Jh3y32bl9GiOsptU80K/yLiDTJY=;
 b=JgVF8bhWyLfrWotCxSEQI3edBi1JkAuyWx1yqZJIoWheFpN4l2WiXvQAzRFk2k6ynE
 yJF8qQ+oFd06j0wHQAQim7jmRawqvQlxP2gGD7NAJNgHpMr8Xw0iAu2W7QheWlHXAEV8
 Fl0F+5wVcnE4jTryF2awP1caup+ZW1PVhiO7kdr9bQIEHzZSk0oyS7+dmUeEUx39RN07
 g+gTW4s8j82CFmFoS/arzG0aEn1skCfaTOS8Na9mmC3EPsUNehuui1a97bKEGEm0SEDj
 vN2NPlN8HAEK1yNPXs8HH+SOQ1HpvCZQP7227dGKt6XHQWMbFCbAQimqGxUXgSWWAMgy
 gIfw==
X-Gm-Message-State: AOAM530txsDEN6W4RURbYIy7jBjCJejQ4MMNZMo7/pb7yxZm86iN0h9f
 8Kry0yxZK0PWNUGAjVg8Z6DW9w==
X-Google-Smtp-Source: ABdhPJyMOemwZfKqq6yULi+gYTczFjoDwGjCptyIrTFMewyYGZB5ybC53ILgV0mBuMGez06PsM2NhA==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr2013103pjb.134.1640065141036; 
 Mon, 20 Dec 2021 21:39:01 -0800 (PST)
Received: from [192.168.10.24] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id lp6sm1231986pjb.55.2021.12.20.21.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 21:39:00 -0800 (PST)
Message-ID: <b63e0570-934e-522f-8567-c9c4c438a55e@ozlabs.ru>
Date: Tue, 21 Dec 2021 16:38:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH kernel v4] KVM: PPC: Merge powerpc's debugfs entry content
 into generic entry
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20211220012351.2719879-1-aik@ozlabs.ru>
 <6111f49a-6ab9-2aba-92b1-ae02db3859b2@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <6111f49a-6ab9-2aba-92b1-ae02db3859b2@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/20/21 18:29, Cédric Le Goater wrote:
> On 12/20/21 02:23, Alexey Kardashevskiy wrote:
>> At the moment KVM on PPC creates 4 types of entries under the kvm debugfs:
>> 1) "%pid-%fd" per a KVM instance (for all platforms);
>> 2) "vm%pid" (for PPC Book3s HV KVM);
>> 3) "vm%u_vcpu%u_timing" (for PPC Book3e KVM);
>> 4) "kvm-xive-%p" (for XIVE PPC Book3s KVM, the same for XICS);
>>
>> The problem with this is that multiple VMs per process is not allowed for
>> 2) and 3) which makes it possible for userspace to trigger errors when
>> creating duplicated debugfs entries.
>>
>> This merges all these into 1).
>>
>> This defines kvm_arch_create_kvm_debugfs() similar to
>> kvm_arch_create_vcpu_debugfs().
>>
>> This defines 2 hooks in kvmppc_ops that allow specific KVM implementations
>> add necessary entries, this adds the _e500 suffix to
>> kvmppc_create_vcpu_debugfs_e500() to make it clear what platform it is for.
>>
>> This makes use of already existing kvm_arch_create_vcpu_debugfs() on PPC.
>>
>> This removes no more used debugfs_dir pointers from PPC kvm_arch structs.
>>
>> This stops removing vcpu entries as once created vcpus stay around
>> for the entire life of a VM and removed when the KVM instance is closed,
>> see commit d56f5136b010 ("KVM: let kvm_destroy_vm_debugfs clean up vCPU
>> debugfs directories").
>>
>> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> One comment below.
> 
>> ---
>> Changes:
>> v4:
>> * added "kvm-xive-%p"
>>
>> v3:
>> * reworked commit log, especially, the bit about removing vcpus
>>
>> v2:
>> * handled powerpc-booke
>> * s/kvm/vm/ in arch hooks
>> ---
>>   arch/powerpc/include/asm/kvm_host.h    |  6 ++---
>>   arch/powerpc/include/asm/kvm_ppc.h     |  2 ++
>>   arch/powerpc/kvm/timing.h              |  9 ++++----
>>   arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
>>   arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
>>   arch/powerpc/kvm/book3s_hv.c           | 31 ++++++++++----------------
>>   arch/powerpc/kvm/book3s_xics.c         | 13 ++---------
>>   arch/powerpc/kvm/book3s_xive.c         | 13 ++---------
>>   arch/powerpc/kvm/book3s_xive_native.c  | 13 ++---------
>>   arch/powerpc/kvm/e500.c                |  1 +
>>   arch/powerpc/kvm/e500mc.c              |  1 +
>>   arch/powerpc/kvm/powerpc.c             | 16 ++++++++++---
>>   arch/powerpc/kvm/timing.c              | 20 ++++-------------
>>   13 files changed, 47 insertions(+), 82 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
>> index 17263276189e..f5e14fa683f4 100644
>> --- a/arch/powerpc/include/asm/kvm_host.h
>> +++ b/arch/powerpc/include/asm/kvm_host.h
>> @@ -26,6 +26,8 @@
>>   #include <asm/hvcall.h>
>>   #include <asm/mce.h>
>>   
>> +#define __KVM_HAVE_ARCH_VCPU_DEBUGFS
>> +
>>   #define KVM_MAX_VCPUS		NR_CPUS
>>   #define KVM_MAX_VCORES		NR_CPUS
>>   
>> @@ -295,7 +297,6 @@ struct kvm_arch {
>>   	bool dawr1_enabled;
>>   	pgd_t *pgtable;
>>   	u64 process_table;
>> -	struct dentry *debugfs_dir;
>>   	struct kvm_resize_hpt *resize_hpt; /* protected by kvm->lock */
>>   #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
>>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>> @@ -673,7 +674,6 @@ struct kvm_vcpu_arch {
>>   	u64 timing_min_duration[__NUMBER_OF_KVM_EXIT_TYPES];
>>   	u64 timing_max_duration[__NUMBER_OF_KVM_EXIT_TYPES];
>>   	u64 timing_last_exit;
>> -	struct dentry *debugfs_exit_timing;
>>   #endif
>>   
>>   #ifdef CONFIG_PPC_BOOK3S
>> @@ -829,8 +829,6 @@ struct kvm_vcpu_arch {
>>   	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
>>   	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
>>   	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
>> -
>> -	struct dentry *debugfs_dir;
>>   #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
>>   };
>>   
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
>> index 33db83b82fbd..d2b192dea0d2 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -316,6 +316,8 @@ struct kvmppc_ops {
>>   	int (*svm_off)(struct kvm *kvm);
>>   	int (*enable_dawr1)(struct kvm *kvm);
>>   	bool (*hash_v3_possible)(void);
>> +	int (*create_vm_debugfs)(struct kvm *kvm);
>> +	int (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
>>   };
>>   
>>   extern struct kvmppc_ops *kvmppc_hv_ops;
>> diff --git a/arch/powerpc/kvm/timing.h b/arch/powerpc/kvm/timing.h
>> index feef7885ba82..493a7d510fd5 100644
>> --- a/arch/powerpc/kvm/timing.h
>> +++ b/arch/powerpc/kvm/timing.h
>> @@ -14,8 +14,8 @@
>>   #ifdef CONFIG_KVM_EXIT_TIMING
>>   void kvmppc_init_timing_stats(struct kvm_vcpu *vcpu);
>>   void kvmppc_update_timing_stats(struct kvm_vcpu *vcpu);
>> -void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id);
>> -void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu);
>> +void kvmppc_create_vcpu_debugfs_e500(struct kvm_vcpu *vcpu,
>> +				     struct dentry *debugfs_dentry);
>>   
>>   static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type)
>>   {
>> @@ -26,9 +26,8 @@ static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type)
>>   /* if exit timing is not configured there is no need to build the c file */
>>   static inline void kvmppc_init_timing_stats(struct kvm_vcpu *vcpu) {}
>>   static inline void kvmppc_update_timing_stats(struct kvm_vcpu *vcpu) {}
>> -static inline void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
>> -						unsigned int id) {}
>> -static inline void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
>> +static inline void kvmppc_create_vcpu_debugfs_e500(struct kvm_vcpu *vcpu,
>> +						   struct dentry *debugfs_dentry) {}
>>   static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type) {}
>>   #endif /* CONFIG_KVM_EXIT_TIMING */
>>   
>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> index c63e263312a4..33dae253a0ac 100644
>> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> @@ -2112,7 +2112,7 @@ static const struct file_operations debugfs_htab_fops = {
>>   
>>   void kvmppc_mmu_debugfs_init(struct kvm *kvm)
>>   {
>> -	debugfs_create_file("htab", 0400, kvm->arch.debugfs_dir, kvm,
>> +	debugfs_create_file("htab", 0400, kvm->debugfs_dentry, kvm,
>>   			    &debugfs_htab_fops);
>>   }
>>   
>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> index 8cebe5542256..e4ce2a35483f 100644
>> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> @@ -1454,7 +1454,7 @@ static const struct file_operations debugfs_radix_fops = {
>>   
>>   void kvmhv_radix_debugfs_init(struct kvm *kvm)
>>   {
>> -	debugfs_create_file("radix", 0400, kvm->arch.debugfs_dir, kvm,
>> +	debugfs_create_file("radix", 0400, kvm->debugfs_dentry, kvm,
>>   			    &debugfs_radix_fops);
>>   }
>>   
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index bf1eb1160ae2..4c52541b6f37 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -2768,20 +2768,17 @@ static const struct file_operations debugfs_timings_ops = {
>>   };
>>   
>>   /* Create a debugfs directory for the vcpu */
>> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
>> +static int kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>>   {
>> -	char buf[16];
>> -	struct kvm *kvm = vcpu->kvm;
>> -
>> -	snprintf(buf, sizeof(buf), "vcpu%u", id);
>> -	vcpu->arch.debugfs_dir = debugfs_create_dir(buf, kvm->arch.debugfs_dir);
>> -	debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir, vcpu,
>> +	debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
>>   			    &debugfs_timings_ops);
>> +	return 0;
>>   }
>>   
>>   #else /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
>> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
>> +static int kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>>   {
>> +	return 0;
>>   }
>>   #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
>>   
>> @@ -2904,8 +2901,6 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>>   	vcpu->arch.cpu_type = KVM_CPU_3S_64;
>>   	kvmppc_sanity_check(vcpu);
>>   
>> -	debugfs_vcpu_init(vcpu, id);
>> -
>>   	return 0;
>>   }
>>   
>> @@ -5226,7 +5221,6 @@ void kvmppc_free_host_rm_ops(void)
>>   static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>>   {
>>   	unsigned long lpcr, lpid;
>> -	char buf[32];
>>   	int ret;
>>   
>>   	mutex_init(&kvm->arch.uvmem_lock);
>> @@ -5359,15 +5353,14 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>>   		kvm->arch.smt_mode = 1;
>>   	kvm->arch.emul_smt_mode = 1;
>>   
>> -	/*
>> -	 * Create a debugfs directory for the VM
>> -	 */
>> -	snprintf(buf, sizeof(buf), "vm%d", current->pid);
>> -	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
>> +	return 0;
>> +}
>> +
>> +static int kvmppc_arch_create_vm_debugfs_hv(struct kvm *kvm)
>> +{
>>   	kvmppc_mmu_debugfs_init(kvm);
>>   	if (radix_enabled())
>>   		kvmhv_radix_debugfs_init(kvm);
>> -
>>   	return 0;
>>   }
>>   
>> @@ -5382,8 +5375,6 @@ static void kvmppc_free_vcores(struct kvm *kvm)
>>   
>>   static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>>   {
>> -	debugfs_remove_recursive(kvm->arch.debugfs_dir);
>> -
>>   	if (!cpu_has_feature(CPU_FTR_ARCH_300))
>>   		kvm_hv_vm_deactivated();
>>   
>> @@ -6044,6 +6035,8 @@ static struct kvmppc_ops kvm_ops_hv = {
>>   	.svm_off = kvmhv_svm_off,
>>   	.enable_dawr1 = kvmhv_enable_dawr1,
>>   	.hash_v3_possible = kvmppc_hash_v3_possible,
>> +	.create_vcpu_debugfs = kvmppc_arch_create_vcpu_debugfs_hv,
>> +	.create_vm_debugfs = kvmppc_arch_create_vm_debugfs_hv,
>>   };
>>   
>>   static int kvm_init_subcore_bitmap(void)
>> diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
>> index ebd5d920de8c..3dfa9285e4a4 100644
>> --- a/arch/powerpc/kvm/book3s_xics.c
>> +++ b/arch/powerpc/kvm/book3s_xics.c
>> @@ -1016,19 +1016,10 @@ DEFINE_SHOW_ATTRIBUTE(xics_debug);
>>   
>>   static void xics_debugfs_init(struct kvmppc_xics *xics)
>>   {
>> -	char *name;
>> -
>> -	name = kasprintf(GFP_KERNEL, "kvm-xics-%p", xics);
>> -	if (!name) {
>> -		pr_err("%s: no memory for name\n", __func__);
>> -		return;
>> -	}
>> -
>> -	xics->dentry = debugfs_create_file(name, 0444, arch_debugfs_dir,
>> +	xics->dentry = debugfs_create_file("xics", 0444, xics->kvm->debugfs_dentry,
>>   					   xics, &xics_debug_fops);
>>   
>> -	pr_debug("%s: created %s\n", __func__, name);
>> -	kfree(name);
>> +	pr_debug("%s: created\n", __func__);
>>   }
>>   
>>   static struct kvmppc_ics *kvmppc_xics_create_ics(struct kvm *kvm,
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>> index 225008882958..bb41afbb68fc 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -2351,19 +2351,10 @@ DEFINE_SHOW_ATTRIBUTE(xive_debug);
>>   
>>   static void xive_debugfs_init(struct kvmppc_xive *xive)
>>   {
>> -	char *name;
>> -
>> -	name = kasprintf(GFP_KERNEL, "kvm-xive-%p", xive);
>> -	if (!name) {
>> -		pr_err("%s: no memory for name\n", __func__);
>> -		return;
>> -	}
>> -
>> -	xive->dentry = debugfs_create_file(name, S_IRUGO, arch_debugfs_dir,
>> +	xive->dentry = debugfs_create_file("xive", S_IRUGO, xive->kvm->debugfs_dentry,
>>   					   xive, &xive_debug_fops);
> 
> The KVM XIVE device implements a "xics-on-xive" interface, the XICS hcalls
> on top of the XIVE native PowerNV (OPAL) interface, and ...
> 
>> -	pr_debug("%s: created %s\n", __func__, name);
>> -	kfree(name);
>> +	pr_debug("%s: created\n", __func__);
>>   }
>>   
>>   static void kvmppc_xive_init(struct kvm_device *dev)
>> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
>> index 99db9ac49901..e86f5b6c2ae1 100644
>> --- a/arch/powerpc/kvm/book3s_xive_native.c
>> +++ b/arch/powerpc/kvm/book3s_xive_native.c
>> @@ -1259,19 +1259,10 @@ DEFINE_SHOW_ATTRIBUTE(xive_native_debug);
>>   
>>   static void xive_native_debugfs_init(struct kvmppc_xive *xive)
>>   {
>> -	char *name;
>> -
>> -	name = kasprintf(GFP_KERNEL, "kvm-xive-%p", xive);
>> -	if (!name) {
>> -		pr_err("%s: no memory for name\n", __func__);
>> -		return;
>> -	}
>> -
>> -	xive->dentry = debugfs_create_file(name, 0444, arch_debugfs_dir,
>> +	xive->dentry = debugfs_create_file("xive", 0444, xive->kvm->debugfs_dentry,
>>   					   xive, &xive_native_debug_fops);
> 
> ... the KVM XIVE *native* device implements a "xive" interface", the one
> using MMIOs for interrupt management.
> 
> May be it's worth making the difference in the user interface ?


The content of these xive files is quite different so I kept the same
name as before, I can change if you think it is worth it, should I? You
are probably the only person who looked at it recently (or ever?) :) Thanks,



> 
> Thanks,
> 
> C.
> 
>>   
>> -	pr_debug("%s: created %s\n", __func__, name);
>> -	kfree(name);
>> +	pr_debug("%s: created\n", __func__);
>>   }
>>   
>>   static void kvmppc_xive_native_init(struct kvm_device *dev)
>> diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
>> index 7e8b69015d20..c8b2b4478545 100644
>> --- a/arch/powerpc/kvm/e500.c
>> +++ b/arch/powerpc/kvm/e500.c
>> @@ -495,6 +495,7 @@ static struct kvmppc_ops kvm_ops_e500 = {
>>   	.emulate_op = kvmppc_core_emulate_op_e500,
>>   	.emulate_mtspr = kvmppc_core_emulate_mtspr_e500,
>>   	.emulate_mfspr = kvmppc_core_emulate_mfspr_e500,
>> +	.create_vcpu_debugfs = kvmppc_create_vcpu_debugfs_e500,
>>   };
>>   
>>   static int __init kvmppc_e500_init(void)
>> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
>> index 1c189b5aadcc..fa0d8dbbe484 100644
>> --- a/arch/powerpc/kvm/e500mc.c
>> +++ b/arch/powerpc/kvm/e500mc.c
>> @@ -381,6 +381,7 @@ static struct kvmppc_ops kvm_ops_e500mc = {
>>   	.emulate_op = kvmppc_core_emulate_op_e500,
>>   	.emulate_mtspr = kvmppc_core_emulate_mtspr_e500,
>>   	.emulate_mfspr = kvmppc_core_emulate_mfspr_e500,
>> +	.create_vcpu_debugfs = kvmppc_create_vcpu_debugfs_e500,
>>   };
>>   
>>   static int __init kvmppc_e500mc_init(void)
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index a72920f4f221..2ea73dfcebb2 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -763,7 +763,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>>   		goto out_vcpu_uninit;
>>   
>>   	vcpu->arch.waitp = &vcpu->wait;
>> -	kvmppc_create_vcpu_debugfs(vcpu, vcpu->vcpu_id);
>>   	return 0;
>>   
>>   out_vcpu_uninit:
>> @@ -780,8 +779,6 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>>   	/* Make sure we're not using the vcpu anymore */
>>   	hrtimer_cancel(&vcpu->arch.dec_timer);
>>   
>> -	kvmppc_remove_vcpu_debugfs(vcpu);
>> -
>>   	switch (vcpu->arch.irq_type) {
>>   	case KVMPPC_IRQ_MPIC:
>>   		kvmppc_mpic_disconnect_vcpu(vcpu->arch.mpic, vcpu);
>> @@ -2505,3 +2502,16 @@ int kvm_arch_init(void *opaque)
>>   }
>>   
>>   EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
>> +
>> +void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>> +{
>> +	if (vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs)
>> +		vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs(vcpu, debugfs_dentry);
>> +}
>> +
>> +int kvm_arch_create_vm_debugfs(struct kvm *kvm)
>> +{
>> +	if (kvm->arch.kvm_ops->create_vm_debugfs)
>> +		kvm->arch.kvm_ops->create_vm_debugfs(kvm);
>> +	return 0;
>> +}
>> diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
>> index ba56a5cbba97..f6d472874c85 100644
>> --- a/arch/powerpc/kvm/timing.c
>> +++ b/arch/powerpc/kvm/timing.c
>> @@ -204,21 +204,9 @@ static const struct file_operations kvmppc_exit_timing_fops = {
>>   	.release = single_release,
>>   };
>>   
>> -void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id)
>> +void kvmppc_create_vcpu_debugfs_e500(struct kvm_vcpu *vcpu,
>> +				     struct dentry *debugfs_dentry)
>>   {
>> -	static char dbg_fname[50];
>> -	struct dentry *debugfs_file;
>> -
>> -	snprintf(dbg_fname, sizeof(dbg_fname), "vm%u_vcpu%u_timing",
>> -		 current->pid, id);
>> -	debugfs_file = debugfs_create_file(dbg_fname, 0666, kvm_debugfs_dir,
>> -						vcpu, &kvmppc_exit_timing_fops);
>> -
>> -	vcpu->arch.debugfs_exit_timing = debugfs_file;
>> -}
>> -
>> -void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
>> -{
>> -	debugfs_remove(vcpu->arch.debugfs_exit_timing);
>> -	vcpu->arch.debugfs_exit_timing = NULL;
>> +	debugfs_create_file("timing", 0666, debugfs_dentry,
>> +			    vcpu, &kvmppc_exit_timing_fops);
>>   }
>>
> 

-- 
Alexey
