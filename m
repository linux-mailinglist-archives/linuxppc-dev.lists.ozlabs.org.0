Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241F749322
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 03:35:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iZ/PBanT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxJxb6LXRz3byl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iZ/PBanT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxJwk2hwQz3031
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 11:34:29 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6686708c986so250243b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 18:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688607266; x=1691199266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2z8PnN8KkyatR/iExIdxTC6Q1MI9UWQ7DGb3pnOB+0w=;
        b=iZ/PBanTWLJ6hbGVmIyAfv510opDHOsuxJTIQLbHPBgNBe19Mw5X9SMWjCbgYygnnI
         l/1Nx7eu2yqlIUo1ZxDojlJ1DjuOB37OiiZXXxnmDopdOU5Dt1DkymMSHEgprQnsUGNv
         ozm+ZGERGk2HGchcyqGhxbPe5hI9zH1qwMpmgoadAYUvZA1iyCTUNBWCXjK3Uo4+WC+E
         aGG2JipUgVCYl3ha6exz0hGh4bJqBBzLvIsjJtVflX+p9LsD7py3GBzIi00BBwY5xOEW
         mZZre7BCgwaHzhOn9tYvk3WAEGtbEV0pMYYuLtZHVvZl4jEowrJFyj8Cg4TCNiOyaSgA
         8kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688607266; x=1691199266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2z8PnN8KkyatR/iExIdxTC6Q1MI9UWQ7DGb3pnOB+0w=;
        b=MifJ0l+ArxFlue3r6rg4NCvVBmjFDQdoDZ8zw8SVuENbcmSyw6te/9UJHrdn36mUNj
         x0+w3tlnqhqiFqD1qE9sxQF/GoV/R6wZVHX3DNqa9CyMlc5BpmMa+pqg6N7xxIP0wN6c
         ns9tt788SbFBAM0aQz8o1CDZQZ+Gzg0uI+SaF3gFAPviNxhNrcHQu4DbOevBPcdbB1/e
         oKa4V6fRK58ISw3340IQYyJ5bDb6kBoAacNb4aoHZvaiMv/stRkLSp4IlM0DA5A8WR0X
         Eo1RW/uehCUnQMKURNR8mxe84203lPSZnitXMi57d1bCPQquGQD40H4zPBcRI/Nrrcqc
         j2Dg==
X-Gm-Message-State: ABy/qLZHcmgRluxKT/qHwSDwAvAII9RRC8G2zO9CqkCXrWSL6MeGk0NW
	0l/huQ/PDN6jityxbNZbKa4=
X-Google-Smtp-Source: APBJJlE2fLWVc5FBU1iez9G6bx8tNEAnPtmPjPbUG15dSkIAwuTIm53BpyqLXGkirGpFpCP1WuBetw==
X-Received: by 2002:a05:6a20:8408:b0:12d:39c6:9f94 with SMTP id c8-20020a056a20840800b0012d39c69f94mr558590pzd.47.1688607265581;
        Wed, 05 Jul 2023 18:34:25 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id ji11-20020a170903324b00b001ab01598f40sm108150plb.173.2023.07.05.18.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 18:34:25 -0700 (PDT)
Date: Wed, 5 Jul 2023 18:34:23 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
Message-ID: <20230706013423.GA3894444@ls.amr.corp.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-3-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-3-stevensd@google.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, isaku.yamahata@gmail.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023 at 04:50:47PM +0900,
David Stevens <stevensd@chromium.org> wrote:

> From: David Stevens <stevensd@chromium.org>
> 
> Introduce __kvm_follow_pfn, which will replace __gfn_to_pfn_memslot.
> __kvm_follow_pfn refactors the old API's arguments into a struct and,
> where possible, combines the boolean arguments into a single flags
> argument.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  include/linux/kvm_host.h |  16 ++++
>  virt/kvm/kvm_main.c      | 171 ++++++++++++++++++++++-----------------
>  virt/kvm/kvm_mm.h        |   3 +-
>  virt/kvm/pfncache.c      |   8 +-
>  4 files changed, 122 insertions(+), 76 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 9d3ac7720da9..ef2763c2b12e 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -97,6 +97,7 @@
>  #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
>  #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
>  #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
> +#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
>  
>  /*
>   * error pfns indicate that the gfn is in slot but faild to
> @@ -1156,6 +1157,21 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
>  void kvm_release_page_clean(struct page *page);
>  void kvm_release_page_dirty(struct page *page);
>  
> +struct kvm_follow_pfn {
> +	const struct kvm_memory_slot *slot;
> +	gfn_t gfn;
> +	unsigned int flags;
> +	bool atomic;
> +	/* Allow a read fault to create a writeable mapping. */
> +	bool allow_write_mapping;

Maybe, make them const for input arguments?


> +
> +	/* Outputs of __kvm_follow_pfn */
> +	hva_t hva;
> +	bool writable;
> +};
> +
> +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll);
> +
>  kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
>  kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
>  		      bool *writable);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 371bd783ff2b..b13f22861d2f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2486,24 +2486,22 @@ static inline int check_user_page_hwpoison(unsigned long addr)
>   * true indicates success, otherwise false is returned.  It's also the
>   * only part that runs if we can in atomic context.
>   */
> -static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> -			    bool *writable, kvm_pfn_t *pfn)
> +static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
>  {
>  	struct page *page[1];
> +	bool write_fault = foll->flags & FOLL_WRITE;
>  
>  	/*
>  	 * Fast pin a writable pfn only if it is a write fault request
>  	 * or the caller allows to map a writable pfn for a read fault
>  	 * request.
>  	 */
> -	if (!(write_fault || writable))
> +	if (!(write_fault || foll->allow_write_mapping))
>  		return false;
>  
> -	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
> +	if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
>  		*pfn = page_to_pfn(page[0]);
> -
> -		if (writable)
> -			*writable = true;
> +		foll->writable = foll->allow_write_mapping;
>  		return true;
>  	}
>  
> @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
>   * The slow path to get the pfn of the specified host virtual address,
>   * 1 indicates success, -errno is returned if error is detected.
>   */
> -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
> -			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
> +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
>  {
> -	unsigned int flags = FOLL_HWPOISON;
> +	unsigned int flags = FOLL_HWPOISON | FOLL_GET | foll->flags;

Although adding FOLL_GET doesn't affect the behavior of
get_user_pages_unlocked(), I wondered how this affects the next change
It's better to mention it in the commit message.
get_user_pages_*() called by hva_to_pfn_{fast, slot} imply FOLL_GET,
but __kvm_follow_pfn() doesn't imply FOLL_GET.


>  	struct page *page;
>  	int npages;
>  
>  	might_sleep();
>  
> -	if (writable)
> -		*writable = write_fault;
> -
> -	if (write_fault)
> -		flags |= FOLL_WRITE;
> -	if (async)
> -		flags |= FOLL_NOWAIT;
> -	if (interruptible)
> -		flags |= FOLL_INTERRUPTIBLE;
> -
> -	npages = get_user_pages_unlocked(addr, 1, &page, flags);
> +	npages = get_user_pages_unlocked(foll->hva, 1, &page, flags);
>  	if (npages != 1)
>  		return npages;
>  
> +	foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
> +
>  	/* map read fault as writable if possible */
> -	if (unlikely(!write_fault) && writable) {
> +	if (unlikely(!foll->writable) && foll->allow_write_mapping) {
>  		struct page *wpage;
>  
> -		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
> -			*writable = true;
> +		if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage)) {
> +			foll->writable = true;
>  			put_page(page);
>  			page = wpage;
>  		}
> @@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
>  	return get_page_unless_zero(page);
>  }
>  
> -static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> -			       unsigned long addr, bool write_fault,
> -			       bool *writable, kvm_pfn_t *p_pfn)
> +static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_follow_pfn *foll,
> +			       kvm_pfn_t *p_pfn)
>  {
>  	kvm_pfn_t pfn;
>  	pte_t *ptep;
>  	spinlock_t *ptl;
> +	bool write_fault = foll->flags & FOLL_WRITE;
>  	int r;
>  
> -	r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> +	r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
>  	if (r) {
>  		/*
>  		 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
>  		 * not call the fault handler, so do it here.
>  		 */
>  		bool unlocked = false;
> -		r = fixup_user_fault(current->mm, addr,
> +		r = fixup_user_fault(current->mm, foll->hva,
>  				     (write_fault ? FAULT_FLAG_WRITE : 0),
>  				     &unlocked);
>  		if (unlocked)
> @@ -2596,7 +2585,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>  		if (r)
>  			return r;
>  
> -		r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> +		r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
>  		if (r)
>  			return r;
>  	}
> @@ -2606,8 +2595,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	if (writable)
> -		*writable = pte_write(*ptep);
> +	foll->writable = pte_write(*ptep) && foll->allow_write_mapping;
>  	pfn = pte_pfn(*ptep);
>  
>  	/*
> @@ -2652,24 +2640,22 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>   * 2): @write_fault = false && @writable, @writable will tell the caller
>   *     whether the mapping is writable.
>   */
> -kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
> -		     bool *async, bool write_fault, bool *writable)
> +kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll)
>  {
>  	struct vm_area_struct *vma;
>  	kvm_pfn_t pfn;
>  	int npages, r;
>  
>  	/* we can do it either atomically or asynchronously, not both */
> -	BUG_ON(atomic && async);
> +	BUG_ON(foll->atomic && (foll->flags & FOLL_NOWAIT));
>  
> -	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
> +	if (hva_to_pfn_fast(foll, &pfn))
>  		return pfn;
>  
> -	if (atomic)
> +	if (foll->atomic)
>  		return KVM_PFN_ERR_FAULT;
>  
> -	npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
> -				 writable, &pfn);
> +	npages = hva_to_pfn_slow(foll, &pfn);
>  	if (npages == 1)
>  		return pfn;
>  	if (npages == -EINTR)
> @@ -2677,83 +2663,122 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
>  
>  	mmap_read_lock(current->mm);
>  	if (npages == -EHWPOISON ||
> -	      (!async && check_user_page_hwpoison(addr))) {
> +	      (!(foll->flags & FOLL_NOWAIT) && check_user_page_hwpoison(foll->hva))) {
>  		pfn = KVM_PFN_ERR_HWPOISON;
>  		goto exit;
>  	}
>  
>  retry:
> -	vma = vma_lookup(current->mm, addr);
> +	vma = vma_lookup(current->mm, foll->hva);
>  
>  	if (vma == NULL)
>  		pfn = KVM_PFN_ERR_FAULT;
>  	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
> -		r = hva_to_pfn_remapped(vma, addr, write_fault, writable, &pfn);
> +		r = hva_to_pfn_remapped(vma, foll, &pfn);
>  		if (r == -EAGAIN)
>  			goto retry;
>  		if (r < 0)
>  			pfn = KVM_PFN_ERR_FAULT;
>  	} else {
> -		if (async && vma_is_valid(vma, write_fault))
> -			*async = true;
> -		pfn = KVM_PFN_ERR_FAULT;
> +		if ((foll->flags & FOLL_NOWAIT) &&
> +		    vma_is_valid(vma, foll->flags & FOLL_WRITE))
> +			pfn = KVM_PFN_ERR_NEEDS_IO;
> +		else
> +			pfn = KVM_PFN_ERR_FAULT;
>  	}
>  exit:
>  	mmap_read_unlock(current->mm);
>  	return pfn;
>  }
>  
> -kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
> -			       bool atomic, bool interruptible, bool *async,
> -			       bool write_fault, bool *writable, hva_t *hva)
> +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
>  {
> -	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
> -
> -	if (hva)
> -		*hva = addr;
> +	foll->hva = __gfn_to_hva_many(foll->slot, foll->gfn, NULL,
> +				      foll->flags & FOLL_WRITE);
>  
> -	if (addr == KVM_HVA_ERR_RO_BAD) {
> -		if (writable)
> -			*writable = false;
> +	if (foll->hva == KVM_HVA_ERR_RO_BAD)
>  		return KVM_PFN_ERR_RO_FAULT;
> -	}
>  
> -	if (kvm_is_error_hva(addr)) {
> -		if (writable)
> -			*writable = false;
> +	if (kvm_is_error_hva(foll->hva))
>  		return KVM_PFN_NOSLOT;
> -	}
>  
> -	/* Do not map writable pfn in the readonly memslot. */
> -	if (writable && memslot_is_readonly(slot)) {
> -		*writable = false;
> -		writable = NULL;
> -	}
> +	if (memslot_is_readonly(foll->slot))
> +		foll->allow_write_mapping = false;
> +
> +	return hva_to_pfn(foll);
> +}
> +EXPORT_SYMBOL_GPL(__kvm_follow_pfn);
>  
> -	return hva_to_pfn(addr, atomic, interruptible, async, write_fault,
> -			  writable);
> +kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
> +			       bool atomic, bool interruptible, bool *async,
> +			       bool write_fault, bool *writable, hva_t *hva)
> +{
> +	kvm_pfn_t pfn;
> +	struct kvm_follow_pfn foll = {
> +		.slot = slot,
> +		.gfn = gfn,
> +		.flags = 0,
> +		.atomic = atomic,
> +		.allow_write_mapping = !!writable,
> +	};
> +
> +	if (write_fault)
> +		foll.flags |= FOLL_WRITE;
> +	if (async)
> +		foll.flags |= FOLL_NOWAIT;
> +	if (interruptible)
> +		foll.flags |= FOLL_INTERRUPTIBLE;
> +
> +	pfn = __kvm_follow_pfn(&foll);
> +	if (pfn == KVM_PFN_ERR_NEEDS_IO) {
> +		*async = true;
> +		pfn = KVM_PFN_ERR_FAULT;
> +	}
> +	if (hva)
> +		*hva = foll.hva;
> +	if (writable)
> +		*writable = foll.writable;
> +	return pfn;
>  }
>  EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
>  
>  kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
>  		      bool *writable)
>  {
> -	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
> -				    NULL, write_fault, writable, NULL);
> +	kvm_pfn_t pfn;
> +	struct kvm_follow_pfn foll = {
> +		.slot = gfn_to_memslot(kvm, gfn),
> +		.gfn = gfn,
> +		.flags = write_fault ? FOLL_WRITE : 0,
> +		.allow_write_mapping = !!writable,
> +	};
> +	pfn = __kvm_follow_pfn(&foll);
> +	if (writable)
> +		*writable = foll.writable;
> +	return pfn;
>  }
>  EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
>  
>  kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
>  {
> -	return __gfn_to_pfn_memslot(slot, gfn, false, false, NULL, true,
> -				    NULL, NULL);
> +	struct kvm_follow_pfn foll = {
> +		.slot = slot,
> +		.gfn = gfn,
> +		.flags = FOLL_WRITE,
> +	};
> +	return __kvm_follow_pfn(&foll);
>  }
>  EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
>  
>  kvm_pfn_t gfn_to_pfn_memslot_atomic(const struct kvm_memory_slot *slot, gfn_t gfn)
>  {
> -	return __gfn_to_pfn_memslot(slot, gfn, true, false, NULL, true,
> -				    NULL, NULL);
> +	struct kvm_follow_pfn foll = {
> +		.slot = slot,
> +		.gfn = gfn,
> +		.flags = FOLL_WRITE,
> +		.atomic = true,
> +	};
> +	return __kvm_follow_pfn(&foll);
>  }
>  EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot_atomic);
>  
> diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
> index 180f1a09e6ba..ed896aee5396 100644
> --- a/virt/kvm/kvm_mm.h
> +++ b/virt/kvm/kvm_mm.h
> @@ -20,8 +20,7 @@
>  #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
>  #endif /* KVM_HAVE_MMU_RWLOCK */
>  
> -kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
> -		     bool *async, bool write_fault, bool *writable);
> +kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll);
>  
>  #ifdef CONFIG_HAVE_KVM_PFNCACHE
>  void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
> diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
> index 2d6aba677830..e3fefa753a51 100644
> --- a/virt/kvm/pfncache.c
> +++ b/virt/kvm/pfncache.c
> @@ -144,6 +144,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
>  	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
>  	void *new_khva = NULL;
>  	unsigned long mmu_seq;
> +	struct kvm_follow_pfn foll = {
> +		.slot = gpc->memslot,
> +		.gfn = gpa_to_gfn(gpc->gpa),
> +		.flags = FOLL_WRITE,
> +		.hva = gpc->uhva,
> +	};
>  
>  	lockdep_assert_held(&gpc->refresh_lock);
>  
> @@ -183,7 +189,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
>  		}
>  
>  		/* We always request a writeable mapping */
> -		new_pfn = hva_to_pfn(gpc->uhva, false, false, NULL, true, NULL);
> +		new_pfn = hva_to_pfn(&foll);
>  		if (is_error_noslot_pfn(new_pfn))
>  			goto out_error;
>  
> -- 
> 2.41.0.255.g8b1d071c50-goog
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
