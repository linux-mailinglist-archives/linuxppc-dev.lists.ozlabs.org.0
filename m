Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C67E34FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 06:48:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WGxWpQti;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPchr4LMnz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 16:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WGxWpQti;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=yuan.yao@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPcgz2R7tz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 16:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699336080; x=1730872080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqZ5JQNUaGOSPFfGCcRkwAJc+NX/2BP9g4PZc+AIHn4=;
  b=WGxWpQtizUrobsjgrNzcg0bOjp9TRRpIjg3d8+mOTQpKDqG6u9VKtlvS
   v7/ijMi7gUVndYvaLXTPNZKv4/RRozXhIusezma8rumKeqSOUVzJgC/ls
   aGVCSYC2wLUFEe+GWJlFDZOKfezil0xPtdQSOLklg9cwwnG1njXD6cbRa
   124hnAl3TWlmHXCOqL10WHi7ICxrYTtLlblxjAZY4qLLskOW9nIQ0MoF9
   l9XWtXH+bttNBiqqBCAO0ugrbpRfaDQkpqG7EnF5xW09Jnn0dToTokS2F
   6c84AXp82d2WmQT6fESDG9fQ4Hpc/nRMHjVRx/HJ+d26JIODVBpxV0Ctm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10978178"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10978178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 21:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832964536"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="832964536"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2023 21:47:40 -0800
Date: Tue, 7 Nov 2023 13:47:40 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/34] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <20231107054739.pamcdd2z564c6xv3@yy-desk-7060>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105163040.14904-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20171215
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, S
 ean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 05, 2023 at 05:30:11PM +0100, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
>
> Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
> information can be supplied without setting userspace up to fail.  The
> padding in the new kvm_userspace_memory_region2 structure will be used to
> pass a file descriptor in addition to the userspace_addr, i.e. allow
> userspace to point at a file descriptor and map memory into a guest that
> is NOT mapped into host userspace.
>
> Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
> without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
> makes detection of bad flags a bit more robust, e.g. if the new fd field
> is guarded only by a flag and not a new ioctl(), then a userspace bug
> (setting a "bad" flag) would generate out-of-bounds access instead of an
> -EINVAL error.
>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-9-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Documentation/virt/kvm/api.rst | 22 +++++++++++++
>  arch/x86/kvm/x86.c             |  2 +-
>  include/linux/kvm_host.h       |  4 +--
>  include/uapi/linux/kvm.h       | 13 ++++++++
>  virt/kvm/kvm_main.c            | 57 +++++++++++++++++++++++++++++-----
>  5 files changed, 87 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7025b3751027..bdea1423c5f8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1340,6 +1340,7 @@ yet and must be cleared on entry.
>  	__u64 guest_phys_addr;
>  	__u64 memory_size; /* bytes */
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
> +	__u64 pad[16];

Looks incorrect to add padding part in kvm_userspace_memory_region,
only need to apply on kvm_userspace_memory_region2 below.

>    };
>
>    /* for kvm_userspace_memory_region::flags */
> @@ -6192,6 +6193,27 @@ to know what fields can be changed for the system register described by
>  ``op0, op1, crn, crm, op2``. KVM rejects ID register values that describe a
>  superset of the features supported by the system.
>
> +4.140 KVM_SET_USER_MEMORY_REGION2
> +---------------------------------
> +
> +:Capability: KVM_CAP_USER_MEMORY2
> +:Architectures: all
> +:Type: vm ioctl
> +:Parameters: struct kvm_userspace_memory_region2 (in)
> +:Returns: 0 on success, -1 on error
> +
> +::
> +
> +  struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size; /* bytes */
> +	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  };
> +
> +See KVM_SET_USER_MEMORY_REGION.
> +
>  5. The kvm_run structure
>  ========================
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2c924075f6f1..7b389f27dffc 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12576,7 +12576,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
>  	}
>
>  	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> -		struct kvm_userspace_memory_region m;
> +		struct kvm_userspace_memory_region2 m;
>
>  		m.slot = id | (i << 16);
>  		m.flags = 0;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5faba69403ac..4e741ff27af3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1146,9 +1146,9 @@ enum kvm_mr_change {
>  };
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem);
> +			  const struct kvm_userspace_memory_region2 *mem);
>  int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem);
> +			    const struct kvm_userspace_memory_region2 *mem);
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
>  void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
>  int kvm_arch_prepare_memory_region(struct kvm *kvm,
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 211b86de35ac..308cc70bd6ab 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];
> +};
> +
>  /*
>   * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
>   * userspace, other bits are reserved for kvm internal use which are defined
> @@ -1201,6 +1211,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>  #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
> +#define KVM_CAP_USER_MEMORY2 231
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1483,6 +1494,8 @@ struct kvm_vfio_spapr_tce {
>  					struct kvm_userspace_memory_region)
>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
>  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> +#define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
> +					 struct kvm_userspace_memory_region2)
>
>  /* enable ucontrol for s390 */
>  struct kvm_s390_ucas_mapping {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dc81279ea385..756b94ecd511 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1580,7 +1580,15 @@ static void kvm_replace_memslot(struct kvm *kvm,
>  	}
>  }
>
> -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> +/*
> + * Flags that do not access any of the extra space of struct
> + * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_V1_FLAGS
> + * only allows these.
> + */
> +#define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +
> +static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
>  {
>  	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>
> @@ -1982,7 +1990,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>   * Must be called holding kvm->slots_lock for write.
>   */
>  int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem)
> +			    const struct kvm_userspace_memory_region2 *mem)
>  {
>  	struct kvm_memory_slot *old, *new;
>  	struct kvm_memslots *slots;
> @@ -2086,7 +2094,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem)
> +			  const struct kvm_userspace_memory_region2 *mem)
>  {
>  	int r;
>
> @@ -2098,7 +2106,7 @@ int kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(kvm_set_memory_region);
>
>  static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
> -					  struct kvm_userspace_memory_region *mem)
> +					  struct kvm_userspace_memory_region2 *mem)
>  {
>  	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
>  		return -EINVAL;
> @@ -4568,6 +4576,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  {
>  	switch (arg) {
>  	case KVM_CAP_USER_MEMORY:
> +	case KVM_CAP_USER_MEMORY2:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
>  	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
>  	case KVM_CAP_INTERNAL_ERROR_DATA:
> @@ -4823,6 +4832,14 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>  	return fd;
>  }
>
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
> +do {										\
> +	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
> +		     offsetof(struct kvm_userspace_memory_region2, field));	\
> +	BUILD_BUG_ON(sizeof_field(struct kvm_userspace_memory_region, field) !=		\
> +		     sizeof_field(struct kvm_userspace_memory_region2, field));	\
> +} while (0)
> +
>  static long kvm_vm_ioctl(struct file *filp,
>  			   unsigned int ioctl, unsigned long arg)
>  {
> @@ -4845,15 +4862,39 @@ static long kvm_vm_ioctl(struct file *filp,
>  		r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
>  		break;
>  	}
> +	case KVM_SET_USER_MEMORY_REGION2:
>  	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_userspace_memory_region2 mem;
> +		unsigned long size;
> +
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
> +			/*
> +			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
> +			 * accessed, but avoid leaking kernel memory in case of a bug.
> +			 */
> +			memset(&mem, 0, sizeof(mem));
> +			size = sizeof(struct kvm_userspace_memory_region);
> +		} else {
> +			size = sizeof(struct kvm_userspace_memory_region2);
> +		}
> +
> +		/* Ensure the common parts of the two structs are identical. */
> +		SANITY_CHECK_MEM_REGION_FIELD(slot);
> +		SANITY_CHECK_MEM_REGION_FIELD(flags);
> +		SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +		SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +		SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
>
>  		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +		if (copy_from_user(&mem, argp, size))
>  			goto out;
>
> -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> +		r = -EINVAL;
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
> +		    (mem.flags & ~KVM_SET_USER_MEMORY_REGION_V1_FLAGS))
> +			goto out;
> +
> +		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
>  	case KVM_GET_DIRTY_LOG: {
> --
> 2.39.1
>
>
>
