Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D504B10E371
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 21:27:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R0CZ09VSzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 07:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e5+HC7eJ"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47R09L3g7YzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 07:25:08 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id i4so2313418otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Dec 2019 12:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=I2Yj7WZ2eIVwURYWTRsAO1/HJqcoGDPFFh90G05uVz8=;
 b=e5+HC7eJOsGBzcln7aLNMNBn17SkFrz5U9QjsFhZ/57uKHwF8+/NkDgMV2dr/dMgOl
 dDY/fiuGIgvmp6dkQv06uTLpteR5VrkWQNcPheAlBG21Q8GM+bScfbvqr8fs1WrGVvpU
 oeWLf0C3LwK1s3EyNDjXWVQU3jZV3lAUKoG6qxtXFs/75KuVHD3cifSDN7qAndu7z2EK
 1OwET0lv1W7gwZfcIkej0uPqPF2jTL3ofI+AqzSWpj8EL1bj78Udp7delfgCuOFkA+VY
 Nz17I4oZ3/NYbd9EtcjOBzWliSBtrj/wC+M20ld5u+zHJY0oarKARDGcH+ui5wTnHV3F
 tvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=I2Yj7WZ2eIVwURYWTRsAO1/HJqcoGDPFFh90G05uVz8=;
 b=Orky7W7IAmy6k4iFd0dBXJGVE9HHZ0HLNns1Sf3tp40e1tkeZ3qpkLfjR0/DjDEzpp
 12FMGkSz2jjns6j2Wot9DUL484mbJSv4GkrTzuX+QN7JfBrCuMgEmpciyvWfH1L+nagP
 bZvvCOnETh0q+mQhlG5TguKOKJdoA8FXSnD9YqePZXPI6wdzJ4skGA4rz8hmGMtdTkTY
 MaYVOf9bNs58XADoMhtDbnHEsff/hn3187oUJ4ilW7N1qQfCj7TGzdpDKm7uJXJ1IC9C
 E9+zh0HEuyOPAgf7ogAGZbKv/3NhDcNPNhysAVuOz9fuYBlq0gXCxfAZh0pDUN7BoKy4
 jkEA==
X-Gm-Message-State: APjAAAXmUGNhyTS59oo4fcRWJZOmDGeZsdjaIegRJY/03ti9t4ynPM7I
 6VDg7nrT+xkBOQofXefe3VFJQ2ROTgQ=
X-Google-Smtp-Source: APXvYqy3gEoj/BYRE+hfQFJKRq+lli+tF2ElHGDIgZhyLlcZAp823TGVvFyHVeUl1QExPaJaAGDOaA==
X-Received: by 2002:a05:6830:20cf:: with SMTP id
 z15mr1710826otq.277.1575231904769; 
 Sun, 01 Dec 2019 12:25:04 -0800 (PST)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id l12sm10004554oth.76.2019.12.01.12.25.02
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 01 Dec 2019 12:25:03 -0800 (PST)
Date: Sun, 1 Dec 2019 12:24:50 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v11 0/7] KVM: PPC: Driver to manage pages of secure guest
In-Reply-To: <20191128050411.GF23438@in.ibm.com>
Message-ID: <alpine.LSU.2.11.1912011214180.1410@eggly.anvils>
References: <20191125030631.7716-1-bharata@linux.ibm.com>
 <20191128050411.GF23438@in.ibm.com>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
Cc: Hugh Dickins <hughd@google.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Nov 2019, Bharata B Rao wrote:
> On Mon, Nov 25, 2019 at 08:36:24AM +0530, Bharata B Rao wrote:
> > Hi,
> > 
> > This is the next version of the patchset that adds required support
> > in the KVM hypervisor to run secure guests on PEF-enabled POWER platforms.
> > 
> 
> Here is a fix for the issue Hugh identified with the usage of ksm_madvise()
> in this patchset. It applies on top of this patchset.

It looks correct to me, and I hope will not spoil your performance in any
way that matters.  But I have to say, the patch would be so much clearer,
if you just named your bool "downgraded" instead of "downgrade".

Hugh

> ----
> 
> From 8a4d769bf4c61f921c79ce68923be3c403bd5862 Mon Sep 17 00:00:00 2001
> From: Bharata B Rao <bharata@linux.ibm.com>
> Date: Thu, 28 Nov 2019 09:31:54 +0530
> Subject: [PATCH 1/1] KVM: PPC: Book3S HV: Take write mmap_sem when calling
>  ksm_madvise
> 
> In order to prevent the device private pages (that correspond to
> pages of secure guest) from participating in KSM merging, H_SVM_PAGE_IN
> calls ksm_madvise() under read version of mmap_sem. However ksm_madvise()
> needs to be under write lock, fix this.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index f24ac3cfb34c..2de264fc3156 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -46,11 +46,10 @@
>   *
>   * Locking order
>   *
> - * 1. srcu_read_lock(&kvm->srcu) - Protects KVM memslots
> - * 2. down_read(&kvm->mm->mmap_sem) - find_vma, migrate_vma_pages and helpers
> - * 3. mutex_lock(&kvm->arch.uvmem_lock) - protects read/writes to uvmem slots
> - *					  thus acting as sync-points
> - *					  for page-in/out
> + * 1. kvm->srcu - Protects KVM memslots
> + * 2. kvm->mm->mmap_sem - find_vma, migrate_vma_pages and helpers, ksm_madvise
> + * 3. kvm->arch.uvmem_lock - protects read/writes to uvmem slots thus acting
> + *			     as sync-points for page-in/out
>   */
>  
>  /*
> @@ -344,7 +343,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  static int
>  kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  		   unsigned long end, unsigned long gpa, struct kvm *kvm,
> -		   unsigned long page_shift)
> +		   unsigned long page_shift, bool *downgrade)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
>  	struct migrate_vma mig;
> @@ -360,8 +359,15 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  	mig.src = &src_pfn;
>  	mig.dst = &dst_pfn;
>  
> +	/*
> +	 * We come here with mmap_sem write lock held just for
> +	 * ksm_madvise(), otherwise we only need read mmap_sem.
> +	 * Hence downgrade to read lock once ksm_madvise() is done.
> +	 */
>  	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
>  			  MADV_UNMERGEABLE, &vma->vm_flags);
> +	downgrade_write(&kvm->mm->mmap_sem);
> +	*downgrade = true;
>  	if (ret)
>  		return ret;
>  
> @@ -456,6 +462,7 @@ unsigned long
>  kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
>  		     unsigned long flags, unsigned long page_shift)
>  {
> +	bool downgrade = false;
>  	unsigned long start, end;
>  	struct vm_area_struct *vma;
>  	int srcu_idx;
> @@ -476,7 +483,7 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
>  
>  	ret = H_PARAMETER;
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
> -	down_read(&kvm->mm->mmap_sem);
> +	down_write(&kvm->mm->mmap_sem);
>  
>  	start = gfn_to_hva(kvm, gfn);
>  	if (kvm_is_error_hva(start))
> @@ -492,12 +499,16 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
>  	if (!vma || vma->vm_start > start || vma->vm_end < end)
>  		goto out_unlock;
>  
> -	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift))
> +	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
> +				&downgrade))
>  		ret = H_SUCCESS;
>  out_unlock:
>  	mutex_unlock(&kvm->arch.uvmem_lock);
>  out:
> -	up_read(&kvm->mm->mmap_sem);
> +	if (downgrade)
> +		up_read(&kvm->mm->mmap_sem);
> +	else
> +		up_write(&kvm->mm->mmap_sem);
>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  	return ret;
>  }
> -- 
> 2.21.0
