Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7F770BCD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:14:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QEA045j9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHg404bzKz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QEA045j9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3cxjnzaykdfwm84hd6aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHg320WTrz2yZV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:13:32 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bb962ada0dso22213065ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691187210; x=1691792010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLXEZoOUsnNHXqyjOtZVO1kviAvs7+VEh7RjIbw2pVY=;
        b=QEA045j9ncvCvkgqC3o9sq3RFy1mLzRW3xRJu3UlqnaUkYuNn/3YZEWEQHcIvp4xcJ
         gOH4/VzJNzJ+9wbk9L6NcrtSuztz/0ltAHWF3BvHZQUyp0CErbjzkNrIfdo5/JbvU1eR
         zPN0Apcw+bDra/pT9VOZYUjffB5mEINtZX0sk6x/agWRO+ZgGg0HWIm2d5XDHXTkWK2n
         ZV/0NfuO2YuAd51hG8mmtBDDETS3G+wAyuulBlQi5xsDSKufzeHemycximN1xLniBbjc
         Uylz/puYuH+O3RbN2PcLK+mKelRsf+ONdJXOGcEkrVqG16mz9t4jZlsS58ipQD7to1Ke
         oeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691187210; x=1691792010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLXEZoOUsnNHXqyjOtZVO1kviAvs7+VEh7RjIbw2pVY=;
        b=SRfXV5rKZTApG/0wpyYXGDhByzJbbR2lZQSxUKm/YW0qetTwdGaHW/C7X96UeaeKmk
         R3zOhPhDznSPNBtcMydTsSZf+TwNdD7aKcr1vv1808yqOexnZjl4m29JyE+msNLlb3XG
         flIKktmuH3Sw8LD06xZeMhHJzaBNYgjbH22unw9+Ki8RoBcZD442ToVmvTyt9xPUh29l
         dcAfMn2zCaqBsI93vrIlpPYar2otRB0Twoyet2rrODMIwcKuP70bDqQjsJ8MPrhGzQS6
         tQwF5EejnZk45hrv2k1r1/stx44EtexWDoLBdY3NX6VbhRUUzVUZfW6cJsspIFs4cWoA
         mWCg==
X-Gm-Message-State: AOJu0YxL4dT64v+uyIZ3PHIeecOWF4jU1FfvBB9vhAS2LbMBM3wtLj9X
	RpvJhq6oap4auQ9cPM0F5Q9sq+5OabY=
X-Google-Smtp-Source: AGHT+IFFa6OQWPgXCVghPOvFrLXoLg027dv5kKy0zEJuMmkaxG1AU5Kgm6Ipp0dVxLufrqFjcx7hU8Umd6E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2448:b0:1b8:3c5e:2289 with SMTP id
 l8-20020a170903244800b001b83c5e2289mr9543pls.2.1691187209565; Fri, 04 Aug
 2023 15:13:29 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:13:28 -0700
In-Reply-To: <20230704075054.3344915-3-stevensd@google.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
Message-ID: <ZM14CHeY4DvjAlqG@google.com>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023, David Stevens wrote:
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

Hmm, ideally KVM_PFN_ERR_NEEDS_IO would be introduced in a separate prep patch,
e.g. by changing "bool *async" to "bool no_wait".  At a glance, I can't tell if
that's feasible though, so consider it more of a "wish" than a request.

> @@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
>  	return get_page_unless_zero(page);
>  }
>  
> -static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> -			       unsigned long addr, bool write_fault,
> -			       bool *writable, kvm_pfn_t *p_pfn)
> +static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_follow_pfn *foll,
> +			       kvm_pfn_t *p_pfn)

Please wrap.  KVM still honors the 80 char soft limit unless there's a reason not
to, and in this case it's already wrapping

static int hva_to_pfn_remapped(struct vm_area_struct *vma,
			       struct kvm_follow_pfn *foll, kvm_pfn_t *p_pfn)

> @@ -2606,8 +2595,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	if (writable)
> -		*writable = pte_write(*ptep);
> +	foll->writable = pte_write(*ptep) && foll->allow_write_mapping;

Similar to feedback in my other response, don't condition this on try_map_writable,
i.e. just do:

	foll->writable = pte_write(...);

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

Opportunistically align the indentation, as an added bonus that makes the line
length a few chars shorter, i.e.

	if (npages == -EHWPOISON ||
	    (!(foll->flags & FOLL_NOWAIT) && check_user_page_hwpoison(foll->hva))) {
		pfn = KVM_PFN_ERR_HWPOISON;
		goto exit;
	}
