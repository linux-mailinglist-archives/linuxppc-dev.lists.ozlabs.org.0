Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA477DBE58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 17:54:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YwXN9Ix2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJzs30002z3cR8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 03:54:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YwXN9Ix2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJzr71bl3z3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 03:53:57 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc316ccc38so11015545ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698684835; x=1699289635; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2Qy05fJV7O/T/e2KrUkQigx6UtJsi8HFmlOQKzP0uU=;
        b=YwXN9Ix2w2O77AoQVztotyxNuitT4PisQmL3dh8zNxBz+Oj5wFp4qPB+7LyhhWnixX
         FITjkavM2xGxHmV08dRjXpGzY+zjQ1NzVd7cOFA9WZElv+Or5KHZcTPkG+nnI2InDAwI
         GurdK3QcU9FUB/0E9xLtGnL5zvpXLhfBGJ6ZkLFhd80qdnsBbjh/tFKexPQlk0r9tIAR
         Sjfm2tseffpJulCQXEusjm3MEy3/OskmEAFQuUX+Ghk98b2d59ASsb4ctzyu2v0pIPeU
         5HamFfEuVG7FoY+5LheF6uQVEZBScgP0IzaKZrh8TTOWWwNE72NTsNmqoZ99UXCOi9uV
         vrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698684835; x=1699289635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Qy05fJV7O/T/e2KrUkQigx6UtJsi8HFmlOQKzP0uU=;
        b=CMAvFYT9zO46EbHnPz8rqlYFYrR+mw8FclhzdPmistuXQb1l5E+EL+SvRoTLuQZLZ8
         rzeavEKEvIIcymsTU9fahkJeG5qkBlafh0j3MZi5lu0wk8v155URGJMBNa/iGPjCulyo
         I+Z1UfOVHFh0ODzbxNkUrWXOVhUIYlI3zfkX5fAfriODz7/cEp8CHoYusB3l2TKiS6UI
         QJ/T/Y87D3ckhoskPFMxDNIH/jKfqOVhX66D+MFWygb6PLs0hju+JHRqI/OlDrbHBaOM
         OYZGofjWeU7ayLN492bDszJhwp8iK/BVsFIKKfnhCLtg69352N4DEwf/YUildam3kjuN
         TUsw==
X-Gm-Message-State: AOJu0Ywt9RkAeiOHQ5cHOtKcNkNAcg0M2hbo0museMvkbYh8/DbVVL7a
	KLXQhekuhuTZ0+mKSnqqNxcjOQ==
X-Google-Smtp-Source: AGHT+IELyEzMPCZIK1jGGqzZjOjX483WaD7ycdUy6EWhivpECGBZ90269Yo9hhrNGYoSLvPayW0Jww==
X-Received: by 2002:a17:902:d581:b0:1cc:32ce:bd9 with SMTP id k1-20020a170902d58100b001cc32ce0bd9mr5679200plh.69.1698684834654;
        Mon, 30 Oct 2023 09:53:54 -0700 (PDT)
Received: from google.com (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d90500b001cc32f46757sm4438158plz.107.2023.10.30.09.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 09:53:53 -0700 (PDT)
Date: Mon, 30 Oct 2023 09:53:48 -0700
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <ZT_fnAcDAvuPCwws@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-4-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Li
 am Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Currently in mmu_notifier invalidate path, hva range is recorded and
> then checked against by mmu_notifier_retry_hva() in the page fault
> handling path. However, for the to be introduced private memory, a page
                          ^^^^^^^^^^^^^^^^^^^^^^^^

Is there a missing word here?

> fault may not have a hva associated, checking gfn(gpa) makes more sense.
> 
> For existing hva based shared memory, gfn is expected to also work. The
> only downside is when aliasing multiple gfns to a single hva, the
> current algorithm of checking multiple ranges could result in a much
> larger range being rejected. Such aliasing should be uncommon, so the
> impact is expected small.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Cc: Xu Yilun <yilun.xu@intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> [sean: convert vmx_set_apic_access_page_addr() to gfn-based API]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c   | 10 ++++++----
>  arch/x86/kvm/vmx/vmx.c   | 11 +++++------
>  include/linux/kvm_host.h | 33 ++++++++++++++++++++------------
>  virt/kvm/kvm_main.c      | 41 +++++++++++++++++++++++++++++++---------
>  4 files changed, 64 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index f7901cb4d2fa..d33657d61d80 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3056,7 +3056,7 @@ static void direct_pte_prefetch(struct kvm_vcpu *vcpu, u64 *sptep)
>   *
>   * There are several ways to safely use this helper:
>   *
> - * - Check mmu_invalidate_retry_hva() after grabbing the mapping level, before
> + * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, before
>   *   consuming it.  In this case, mmu_lock doesn't need to be held during the
>   *   lookup, but it does need to be held while checking the MMU notifier.
>   *
> @@ -4358,7 +4358,7 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
>  		return true;
>  
>  	return fault->slot &&
> -	       mmu_invalidate_retry_hva(vcpu->kvm, fault->mmu_seq, fault->hva);
> +	       mmu_invalidate_retry_gfn(vcpu->kvm, fault->mmu_seq, fault->gfn);
>  }
>  
>  static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> @@ -6245,7 +6245,9 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
>  
>  	write_lock(&kvm->mmu_lock);
>  
> -	kvm_mmu_invalidate_begin(kvm, 0, -1ul);
> +	kvm_mmu_invalidate_begin(kvm);
> +
> +	kvm_mmu_invalidate_range_add(kvm, gfn_start, gfn_end);
>  
>  	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
>  
> @@ -6255,7 +6257,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
>  	if (flush)
>  		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
>  
> -	kvm_mmu_invalidate_end(kvm, 0, -1ul);
> +	kvm_mmu_invalidate_end(kvm);
>  
>  	write_unlock(&kvm->mmu_lock);
>  }
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 72e3943f3693..6e502ba93141 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6757,10 +6757,10 @@ static void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  		return;
>  
>  	/*
> -	 * Grab the memslot so that the hva lookup for the mmu_notifier retry
> -	 * is guaranteed to use the same memslot as the pfn lookup, i.e. rely
> -	 * on the pfn lookup's validation of the memslot to ensure a valid hva
> -	 * is used for the retry check.
> +	 * Explicitly grab the memslot using KVM's internal slot ID to ensure
> +	 * KVM doesn't unintentionally grab a userspace memslot.  It _should_
> +	 * be impossible for userspace to create a memslot for the APIC when
> +	 * APICv is enabled, but paranoia won't hurt in this case.
>  	 */
>  	slot = id_to_memslot(slots, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT);
>  	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
> @@ -6785,8 +6785,7 @@ static void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  		return;
>  
>  	read_lock(&vcpu->kvm->mmu_lock);
> -	if (mmu_invalidate_retry_hva(kvm, mmu_seq,
> -				     gfn_to_hva_memslot(slot, gfn))) {
> +	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
>  		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  		goto out;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index fb6c6109fdca..11d091688346 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -787,8 +787,8 @@ struct kvm {
>  	struct mmu_notifier mmu_notifier;
>  	unsigned long mmu_invalidate_seq;
>  	long mmu_invalidate_in_progress;
> -	unsigned long mmu_invalidate_range_start;
> -	unsigned long mmu_invalidate_range_end;
> +	gfn_t mmu_invalidate_range_start;
> +	gfn_t mmu_invalidate_range_end;
>  #endif
>  	struct list_head devices;
>  	u64 manual_dirty_log_protect;
> @@ -1392,10 +1392,9 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
>  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
>  #endif
>  
> -void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
> -			      unsigned long end);
> -void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> -			    unsigned long end);
> +void kvm_mmu_invalidate_begin(struct kvm *kvm);
> +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end);

What is the reason to separate range_add() from begin()?

> +void kvm_mmu_invalidate_end(struct kvm *kvm);
>  
>  long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg);
> @@ -1970,9 +1969,9 @@ static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
>  	return 0;
>  }
>  
> -static inline int mmu_invalidate_retry_hva(struct kvm *kvm,
> +static inline int mmu_invalidate_retry_gfn(struct kvm *kvm,
>  					   unsigned long mmu_seq,
> -					   unsigned long hva)
> +					   gfn_t gfn)
>  {
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	/*
> @@ -1981,10 +1980,20 @@ static inline int mmu_invalidate_retry_hva(struct kvm *kvm,
>  	 * that might be being invalidated. Note that it may include some false
>  	 * positives, due to shortcuts when handing concurrent invalidations.
>  	 */
> -	if (unlikely(kvm->mmu_invalidate_in_progress) &&
> -	    hva >= kvm->mmu_invalidate_range_start &&
> -	    hva < kvm->mmu_invalidate_range_end)
> -		return 1;
> +	if (unlikely(kvm->mmu_invalidate_in_progress)) {
> +		/*
> +		 * Dropping mmu_lock after bumping mmu_invalidate_in_progress
> +		 * but before updating the range is a KVM bug.
> +		 */
> +		if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
> +				 kvm->mmu_invalidate_range_end == INVALID_GPA))
> +			return 1;
> +
> +		if (gfn >= kvm->mmu_invalidate_range_start &&
> +		    gfn < kvm->mmu_invalidate_range_end)
> +			return 1;
> +	}
> +
>  	if (kvm->mmu_invalidate_seq != mmu_seq)
>  		return 1;
>  	return 0;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5a97e6c7d9c2..1a577a25de47 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -543,9 +543,7 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
>  
>  typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
>  
> -typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
> -			     unsigned long end);
> -
> +typedef void (*on_lock_fn_t)(struct kvm *kvm);
>  typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>  
>  struct kvm_mmu_notifier_range {
> @@ -637,7 +635,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
>  				locked = true;
>  				KVM_MMU_LOCK(kvm);
>  				if (!IS_KVM_NULL_FN(range->on_lock))
> -					range->on_lock(kvm, range->start, range->end);
> +					range->on_lock(kvm);
> +
>  				if (IS_KVM_NULL_FN(range->handler))
>  					break;
>  			}
> @@ -742,16 +741,29 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
>  	kvm_handle_hva_range(mn, address, address + 1, arg, kvm_change_spte_gfn);
>  }
>  
> -void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
> -			      unsigned long end)
> +void kvm_mmu_invalidate_begin(struct kvm *kvm)
>  {
> +	lockdep_assert_held_write(&kvm->mmu_lock);
>  	/*
>  	 * The count increase must become visible at unlock time as no
>  	 * spte can be established without taking the mmu_lock and
>  	 * count is also read inside the mmu_lock critical section.
>  	 */
>  	kvm->mmu_invalidate_in_progress++;
> +
>  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> +		kvm->mmu_invalidate_range_start = INVALID_GPA;
> +		kvm->mmu_invalidate_range_end = INVALID_GPA;

I don't think this is incorrect, but I was a little suprised to see this
here rather than in end() when mmu_invalidate_in_progress decrements to
0.

> +	}
> +}
> +
> +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> +{
> +	lockdep_assert_held_write(&kvm->mmu_lock);

Does this compile/function on KVM architectures with
!KVM_HAVE_MMU_RWLOCK? I assumed we would get an email from the buildbot
if it didn't compile but I don't know if buildbot builds with lockdep
enabled.

On this topic, I wonder if we should just bit the bullet and convert all
architectures to a rwlock_t.

> +
> +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> +
> +	if (likely(kvm->mmu_invalidate_range_start == INVALID_GPA)) {
>  		kvm->mmu_invalidate_range_start = start;
>  		kvm->mmu_invalidate_range_end = end;
>  	} else {
> @@ -771,6 +783,12 @@ void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
>  	}
>  }
>  
> +static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> +	return kvm_unmap_gfn_range(kvm, range);
> +}
> +
>  static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>  					const struct mmu_notifier_range *range)
>  {
> @@ -778,7 +796,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>  	const struct kvm_mmu_notifier_range hva_range = {
>  		.start		= range->start,
>  		.end		= range->end,
> -		.handler	= kvm_unmap_gfn_range,
> +		.handler	= kvm_mmu_unmap_gfn_range,
>  		.on_lock	= kvm_mmu_invalidate_begin,
>  		.on_unlock	= kvm_arch_guest_memory_reclaimed,
>  		.flush_on_ret	= true,
> @@ -817,8 +835,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>  	return 0;
>  }
>  
> -void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> -			    unsigned long end)
> +void kvm_mmu_invalidate_end(struct kvm *kvm)
>  {
>  	/*
>  	 * This sequence increase will notify the kvm page fault that
> @@ -834,6 +851,12 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,

Let's add a lockdep_assert_held_write(&kvm->mmu_lock) here too while
we're at it?

>  	 */
>  	kvm->mmu_invalidate_in_progress--;
>  	KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
> +
> +	/*
> +	 * Assert that at least one range was added between start() and end().
> +	 * Not adding a range isn't fatal, but it is a KVM bug.
> +	 */
> +	WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA);
>  }
>  
>  static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
> -- 
> 2.42.0.820.g83a721a137-goog
> 
