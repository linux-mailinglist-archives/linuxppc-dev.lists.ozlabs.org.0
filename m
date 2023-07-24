Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5175EAA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 06:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZcodHfZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8SMn1h8Bz30gC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 14:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZcodHfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=yilun.xu@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 24 Jul 2023 14:47:15 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8SLq6BVNz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 14:47:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690174036; x=1721710036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9qzwcL7N7viHeki30qyeMCUuWnJ87fuGcM4hbUg7Mg=;
  b=nZcodHfZMqpcmA/aCcqi6rm1gE+LWxOwrpS9kLmW7KEsvcQ0zseoYBzZ
   620m55VmSgWy+rqqjly2hlMP9xv6bimOjuUQKLr531aSoUJwZkV7WHWPk
   1ec71QsNSDbH345WbB8trYJqsCUpCsHIb8AWW6Spat09Y61UEQyc/AowH
   ntEoNQB68CZrRKMa9WdboDfSM3+m1po2Rugln6IOR6DrlPL3JQgKOMmLl
   OypcW+tLCA3M0dwCL7pwWn48XpKSiueLEjq3YuLi6UhO6wH7pEzlOJlYA
   wNyx9ad4F639wdS6SD94hgxq4ox6TEz+ywFLLq4qqq1Gi3qWZKZFkha3W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352240361"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352240361"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 21:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972119310"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972119310"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2023 21:45:40 -0700
Date: Mon, 24 Jul 2023 12:43:53 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
Message-ID: <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-9-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
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
>   - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
>     a guest memory range.
>   - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
>     memory attributes.
> 
> Use an xarray to store the per-page attributes internally, with a naive,
> not fully optimized implementation, i.e. prioritize correctness over
> performance for the initial implementation.
> 
> Because setting memory attributes is roughly analogous to mprotect() on
> memory that is mapped into the guest, zap existing mappings prior to
> updating the memory attributes.  Opportunistically provide an arch hook
> for the post-set path (needed to complete invalidation anyways) in
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
>  Documentation/virt/kvm/api.rst |  60 ++++++++++++
>  include/linux/kvm_host.h       |  14 +++
>  include/uapi/linux/kvm.h       |  14 +++
>  virt/kvm/Kconfig               |   4 +
>  virt/kvm/kvm_main.c            | 170 +++++++++++++++++++++++++++++++++
>  5 files changed, 262 insertions(+)
>

Only some trivial concerns below.

[...]
 
> @@ -1175,6 +1176,9 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  	spin_lock_init(&kvm->mn_invalidate_lock);
>  	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>  	xa_init(&kvm->vcpu_array);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_init(&kvm->mem_attr_array);
> +#endif
>  
>  	INIT_LIST_HEAD(&kvm->gpc_list);
>  	spin_lock_init(&kvm->gpc_lock);
> @@ -1346,6 +1350,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
>  		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
>  		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
>  	}
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_destroy(&kvm->mem_attr_array);
> +#endif

Is it better to make the destruction in reverse order from the creation?
To put xa_destroy(&kvm->mem_attr_array) after cleanup_srcu_struct(&kvm->srcu),
or put xa_init(&kvm->mem_attr_array) after init_srcu_struct(&kvm->irq_srcu).

>  	cleanup_srcu_struct(&kvm->irq_srcu);
>  	cleanup_srcu_struct(&kvm->srcu);
>  	kvm_arch_free_vm(kvm);
> @@ -2346,6 +2353,145 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */

[...]

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

As the attrs->address/size are both garanteed to be non-zero, non-wrap
and page aligned in prevous check. Is it OK to simplify the calculation,
like:

  end = (attrs->address + attrs->size) >> PAGE_SHIFT;

> +
> +	if (WARN_ON_ONCE(start == end))
> +		return -EINVAL;

Also, is this check possible to be hit? Maybe remove it?

Thanks,
Yilun

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
