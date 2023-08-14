Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8377C417
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:57:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j7i3m2yk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPrtd5llVz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j7i3m2yk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 14 Aug 2023 10:45:54 AEST
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPG0f16mKz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 10:45:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691973954; x=1723509954;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nMU49OuQhjBlkIzqgMW98CVzYEzF72LYsmoFN/6bUfs=;
  b=j7i3m2yk0E06OP5OdiZ6m3Y96Ux32BzET9xtxHXmET6b46btAo8bY+QD
   O2NNqj4h8QROnb7QoOI5l+odFBwoGHk1ARKspEQyjC7dEMYe+2kf60SSj
   Wc7/9k8xSlRaqF6yrAOylfaPZiZ8jermjbho0GdbHZJCowMwcOsD92nZU
   9By68U82Bay+X/xQ0WGAWiZa3LJeN3SagRrzAazxeDgE98XotL9AC4tS0
   8GnPADGYrYF+Yza/wETiH0ImCGvOvFce7dfXgMe/LaWIJFlFs5iJS0byE
   4wmbpUdN2kg+ZNluumqX//Z0IafkkPtWa/L9JF5sP0S0D4+plqiBfpz1g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356899070"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="356899070"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 17:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="710134766"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="710134766"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.93.8.79]) ([10.93.8.79])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 17:44:30 -0700
Message-ID: <02239d95-0253-a223-28c2-016cca3ab4d2@linux.intel.com>
Date: Mon, 14 Aug 2023 08:44:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230718234512.1690985-9-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 15 Aug 2023 09:57:02 +1000
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-se
 curity-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> In confidential computing usages, whether a page is private or shared is
> necessary information for KVM to perform operations like page fault
> handling, page zapping etc. There are other potential use cases for
> per-page memory attributes, e.g. to make memory read-only (or no-exec,
> or exec-only, etc.) without having to modify memslots.
>
> Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> userspace to operate on the per-page memory attributes.
>    - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
>      a guest memory range.
>    - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
>      memory attributes.
>
> Use an xarray to store the per-page attributes internally, with a naive,
> not fully optimized implementation, i.e. prioritize correctness over
> performance for the initial implementation.
>
> Because setting memory attributes is roughly analogous to mprotect() on
> memory that is mapped into the guest, zap existing mappings prior to
> updating the memory attributes.  Opportunistically provide an arch hook
> for the post-set path (needed to complete invalidation anyways) in
s/anyways/anyway

> anticipation of x86 needing the hook to update metadata related to
> determining whether or not a given gfn can be backed with various sizes
> of hugepages.
>
> It's possible that future usages may not require an invalidation, e.g.
> if KVM ends up supporting RWX protections and userspace grants _more_
> protections, but again opt for simplicity and punt optimizations to
> if/when they are needed.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> Cc: Fuad Tabba <tabba@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   Documentation/virt/kvm/api.rst |  60 ++++++++++++
>   include/linux/kvm_host.h       |  14 +++
>   include/uapi/linux/kvm.h       |  14 +++
>   virt/kvm/Kconfig               |   4 +
>   virt/kvm/kvm_main.c            | 170 +++++++++++++++++++++++++++++++++
>   5 files changed, 262 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 34d4ce66e0c8..0ca8561775ac 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6068,6 +6068,56 @@ writes to the CNTVCT_EL0 and CNTPCT_EL0 registers using the SET_ONE_REG
>   interface. No error will be returned, but the resulting offset will not be
>   applied.
>   
> +4.139 KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES
> +-----------------------------------------
> +
> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> +:Architectures: x86
> +:Type: vm ioctl
> +:Parameters: u64 memory attributes bitmask(out)
> +:Returns: 0 on success, <0 on error
> +
> +Returns supported memory attributes bitmask. Supported memory attributes will
> +have the corresponding bits set in u64 memory attributes bitmask.
> +
> +The following memory attributes are defined::
> +
> +  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
> +4.140 KVM_SET_MEMORY_ATTRIBUTES
> +-----------------------------------------
> +
> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> +:Architectures: x86
> +:Type: vm ioctl
> +:Parameters: struct kvm_memory_attributes(in/out)
> +:Returns: 0 on success, <0 on error
> +
> +Sets memory attributes for pages in a guest memory range. Parameters are
> +specified via the following structure::
> +
> +  struct kvm_memory_attributes {
> +	__u64 address;
> +	__u64 size;
> +	__u64 attributes;
> +	__u64 flags;
> +  };
> +
> +The user sets the per-page memory attributes to a guest memory range indicated
> +by address/size, and in return KVM adjusts address and size to reflect the
> +actual pages of the memory range have been successfully set to the attributes.
> +If the call returns 0, "address" is updated to the last successful address + 1
> +and "size" is updated to the remaining address size that has not been set
> +successfully. The user should check the return value as well as the size to
> +decide if the operation succeeded for the whole range or not. The user may want
> +to retry the operation with the returned address/size if the previous range was
> +partially successful.
> +
> +Both address and size should be page aligned and the supported attributes can be
> +retrieved with KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES.
> +
> +The "flags" field may be used for future extensions and should be set to 0s.
> +
>   5. The kvm_run structure
>   ========================
>   
> @@ -8494,6 +8544,16 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
>   64-bit bitmap (each bit describing a block size). The default value is
>   0, to disable the eager page splitting.
>   
> +8.41 KVM_CAP_MEMORY_ATTRIBUTES
> +------------------------------
> +
> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> +:Architectures: x86
> +:Type: vm
> +
> +This capability indicates KVM supports per-page memory attributes and ioctls
> +KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES are available.
> +
>   9. Known KVM API problems
>   =========================
>   
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e9ca49d451f3..97db63da6227 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -264,6 +264,7 @@ struct kvm_gfn_range {
>   	gfn_t end;
>   	union {
>   		pte_t pte;
> +		unsigned long attributes;
>   		u64 raw;
>   	} arg;
>   	bool may_block;
> @@ -809,6 +810,9 @@ struct kvm {
>   
>   #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>   	struct notifier_block pm_notifier;
> +#endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	struct xarray mem_attr_array;
>   #endif
>   	char stats_id[KVM_STATS_NAME_SIZE];
>   };
> @@ -2301,4 +2305,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
>   /* Max number of entries allowed for each kvm dirty ring */
>   #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>   
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +{
> +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> +}
> +
> +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> +					 struct kvm_gfn_range *range);
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>   #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 6c6ed214b6ac..f065c57db327 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1211,6 +1211,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>   #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>   #define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> @@ -2270,4 +2271,17 @@ struct kvm_s390_zpci_op {
>   /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
>   #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
>   
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> +
> +struct kvm_memory_attributes {
> +	__u64 address;
> +	__u64 size;
> +	__u64 attributes;
> +	__u64 flags;
> +};
> +
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
>   #endif /* __LINUX_KVM_H */
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 2fa11bd26cfc..8375bc49f97d 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -99,3 +99,7 @@ config KVM_GENERIC_HARDWARE_ENABLING
>   config KVM_GENERIC_MMU_NOTIFIER
>          select MMU_NOTIFIER
>          bool
> +
> +config KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_GENERIC_MMU_NOTIFIER
> +       bool
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index c14adf93daec..1a31bfa025b0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -530,6 +530,7 @@ struct kvm_mmu_notifier_range {
>   	u64 end;
>   	union {
>   		pte_t pte;
> +		unsigned long attributes;
>   		u64 raw;
>   	} arg;
>   	gfn_handler_t handler;
> @@ -1175,6 +1176,9 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>   	spin_lock_init(&kvm->mn_invalidate_lock);
>   	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>   	xa_init(&kvm->vcpu_array);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_init(&kvm->mem_attr_array);
> +#endif
>   
>   	INIT_LIST_HEAD(&kvm->gpc_list);
>   	spin_lock_init(&kvm->gpc_lock);
> @@ -1346,6 +1350,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
>   		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
>   		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
>   	}
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_destroy(&kvm->mem_attr_array);
> +#endif
>   	cleanup_srcu_struct(&kvm->irq_srcu);
>   	cleanup_srcu_struct(&kvm->srcu);
>   	kvm_arch_free_vm(kvm);
> @@ -2346,6 +2353,145 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>   }
>   #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>   
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +{
> +	return 0;
> +}
> +
> +static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
> +						 struct kvm_mmu_notifier_range *range)
> +{
> +	struct kvm_gfn_range gfn_range;
> +	struct kvm_memory_slot *slot;
> +	struct kvm_memslots *slots;
> +	struct kvm_memslot_iter iter;
> +	bool locked = false;
> +	bool ret = false;
> +	int i;
> +
> +	gfn_range.arg.raw = range->arg.raw;
> +	gfn_range.may_block = range->may_block;
> +
> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		slots = __kvm_memslots(kvm, i);
> +
> +		kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
> +			slot = iter.slot;
> +			gfn_range.slot = slot;
> +
> +			gfn_range.start = max(range->start, slot->base_gfn);
> +			gfn_range.end = min(range->end, slot->base_gfn + slot->npages);
> +			if (gfn_range.start >= gfn_range.end)
> +				continue;
> +
> +			if (!locked) {
> +				locked = true;
> +				KVM_MMU_LOCK(kvm);
> +				if (!IS_KVM_NULL_FN(range->on_lock))
> +					range->on_lock(kvm);
> +			}
> +
> +			ret |= range->handler(kvm, &gfn_range);
> +		}
> +	}
> +
> +	if (range->flush_on_ret && ret)
> +		kvm_flush_remote_tlbs(kvm);
> +
> +	if (locked) {
> +		KVM_MMU_UNLOCK(kvm);
> +		if (!IS_KVM_NULL_FN(range->on_unlock))
> +			range->on_unlock(kvm);
> +	}
> +}
> +
> +static int kvm_vm_set_mem_attributes(struct kvm *kvm, unsigned long attributes,
> +				     gfn_t start, gfn_t end)
> +{
> +	struct kvm_mmu_notifier_range unmap_range = {
> +		.start = start,
> +		.end = end,
> +		.handler = kvm_mmu_unmap_gfn_range,
> +		.on_lock = kvm_mmu_invalidate_begin,
> +		.on_unlock = (void *)kvm_null_fn,
> +		.flush_on_ret = true,
> +		.may_block = true,
> +	};
> +	struct kvm_mmu_notifier_range post_set_range = {
> +		.start = start,
> +		.end = end,
> +		.arg.attributes = attributes,
> +		.handler = kvm_arch_post_set_memory_attributes,
> +		.on_lock = (void *)kvm_null_fn,
> +		.on_unlock = kvm_mmu_invalidate_end,
> +		.may_block = true,
> +	};
> +	unsigned long i;
> +	void *entry;
> +	int r;
> +
> +	entry = attributes ? xa_mk_value(attributes) : NULL;
Why attributes of value 0 is considered not a value? Is it because 0 is 
not a valid value when RWX is considered in the future?

> +
> +	mutex_lock(&kvm->slots_lock);
> +
> +	/*
> +	 * Reserve memory ahead of time to avoid having to deal with failures
> +	 * partway through setting the new attributes.
> +	 */
> +	for (i = start; i < end; i++) {
> +		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
> +		if (r)
> +			goto out_unlock;
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &unmap_range);
> +
> +	for (i = start; i < end; i++) {
> +		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +				    GFP_KERNEL_ACCOUNT));
> +		KVM_BUG_ON(r, kvm);
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &post_set_range);
> +
> +out_unlock:
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	return r;
> +}
> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +					   struct kvm_memory_attributes *attrs)
> +{
> +	gfn_t start, end;
> +
> +	/* flags is currently not used. */
> +	if (attrs->flags)
> +		return -EINVAL;
> +	if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> +		return -EINVAL;
> +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +		return -EINVAL;
> +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +		return -EINVAL;
> +
> +	start = attrs->address >> PAGE_SHIFT;
> +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
No need to handle the alignment again since both address and size are 
page aligned.

> +
> +	if (WARN_ON_ONCE(start == end))
> +		return -EINVAL;
> +
> +	/*
> +	 * xarray tracks data using "unsigned long", and as a result so does
> +	 * KVM.  For simplicity, supports generic attributes only on 64-bit
> +	 * architectures.
> +	 */
> +	BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
> +
> +	return kvm_vm_set_mem_attributes(kvm, attrs->attributes, start, end);
> +}
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>   struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>   {
>   	return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> @@ -4521,6 +4667,9 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>   #ifdef CONFIG_HAVE_KVM_MSI
>   	case KVM_CAP_SIGNAL_MSI:
>   #endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	case KVM_CAP_MEMORY_ATTRIBUTES:
> +#endif
>   #ifdef CONFIG_HAVE_KVM_IRQFD
>   	case KVM_CAP_IRQFD:
>   #endif
> @@ -4937,6 +5086,27 @@ static long kvm_vm_ioctl(struct file *filp,
>   		break;
>   	}
>   #endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	case KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES: {
> +		u64 attrs = kvm_supported_mem_attributes(kvm);
> +
> +		r = -EFAULT;
> +		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> +			goto out;
> +		r = 0;
> +		break;
> +	}
> +	case KVM_SET_MEMORY_ATTRIBUTES: {
> +		struct kvm_memory_attributes attrs;
> +
> +		r = -EFAULT;
> +		if (copy_from_user(&attrs, argp, sizeof(attrs)))
> +			goto out;
> +
> +		r = kvm_vm_ioctl_set_mem_attributes(kvm, &attrs);
> +		break;
Both the changelog and the document added mention that the address and 
size of attrs will be updated to
"reflect the actual pages of the memory range have been successfully set 
to the attributes", but it doesn't.

> +	}
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
>   	case KVM_CREATE_DEVICE: {
>   		struct kvm_create_device cd;
>   

