Return-Path: <linuxppc-dev+bounces-17805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUnGbvGqmnVWwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:21:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6722071A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS59M0Hycz3c5f;
	Fri, 06 Mar 2026 23:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772795265;
	cv=none; b=ovcHPijJuoWGxLOB/Z87BlSPw5XhJSv4/qoX/DInBlRdKHKhPKhsmsqb1vi1SfI/PFq07ABvrU4Hzihi6vBWRvQNS3ubq3/OQpIZpiXzT8TmHq8rtSPEzfQuywfY3/b3es2DrU+vRudxyO5DhYSvPkXxIGEA19HBuN4fkaEVLcITK1drf8Eo4KLBfCnAUS3+fSwsx0NatdIPJUW81Zqjt+iMHbAbL1b+KbL+uiNzzLosAkc8MrL8wPazqtdULlF7IAI0TLHEIVJVmy2hi6TTU8c+wGnALLy9m5UayiAFwgp9pRCK7O6IDtWZiNoBJe4rHttWUbkiq2FXD9Lk6zuq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772795265; c=relaxed/relaxed;
	bh=pNkRqhf2OEYfDr/sk/mw7yv47Dg5A+NNPlMn4giuCwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRCJ5H/FVeuANNMphq6Qo16asP1VsOgKkiembcFkYnjimVVnSWa+MkZyBtQnozf0aJG885Iu0CxWmVy+E2V7tKceUivH7KwzYN7oW7uz6I7qzhOlZvXWIubJfesHOX1LKCNAK9BLSdRm9oQtLSpSxHyCbBPUHeyKFL4qosVKxkl03j8N8RCtqgw0gIlMYA+577eRws+aXclBSxQMWPS+3I7K620jo6u/MEyW7wWjmiTrqcHS/K3Ro0514yMZGTtZqA45ASzFwqebZNQRIsomTsknEeQGzwkksKFLjcrete2Bpdx6dSUdZcvMBFaV5eDQN4IAQTpW2vC5fqzMD+HLug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LfXrGnQj; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LfXrGnQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS3Xc4JFyz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 22:07:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB1E60130;
	Fri,  6 Mar 2026 11:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD42C4CEF7;
	Fri,  6 Mar 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795262;
	bh=xHA3xv8H6bWtNG4YWuzx0gTRR1QZaKIgnv1aEOMe/sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfXrGnQjHWNBBCETU/U4oSl/XQLAxUW5IW4VzDgbJuqr8rMv2CC9tqLHt++rzGNHE
	 t0r7h92NQurOz8dlsIXe9stMOQlmA9ZH6uLf2rKEazE2DmsuCUq0OtForVaXI/uXVW
	 xtlO4A6wks/mXhKXFf8pRc21P5Mj4x0jcKTcGp5pDBK5Rz7C8/7ojyk95zx5cNCewp
	 1u29pZldqh+4VOJ/ZgmA75LILHILbY+xmhXnvOKJTsfxC6LVYIr2RXdmffQ1gmyK+q
	 OgN6lcJBXIMNxzWGvz7oM3X3rkkwdktXnGjssSHgVBLcvQYAK7mQTpIC3PR4xxKLyg
	 qnM/YAedK++bQ==
Date: Fri, 6 Mar 2026 11:07:38 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/4] mm: move vma_kernel_pagesize() from hugetlb to
 mm.h
Message-ID: <833950ef-e01d-4914-b5f9-bc1f6261b184@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <20260306101600.57355-2-david@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306101600.57355-2-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: EEC6722071A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17805-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:15:57AM +0100, David Hildenbrand (Arm) wrote:
> In the past, only hugetlb had special "vma_kernel_pagesize()"
> requirements, so it provided its own implementation.
>
> In commit 05ea88608d4e ("mm, hugetlbfs: introduce ->pagesize() to
> vm_operations_struct") we generalized that approach by providing a
> vm_ops->pagesize() callback to be used by device-dax.
>
> Once device-dax started using that callback in commit c1d53b92b95c
> ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> it was missed that CONFIG_DEV_DAX does not depend on hugetlb support.
>
> So building a kernel with CONFIG_DEV_DAX but without CONFIG_HUGETLBFS
> would not pick up that value.
>
> Fix it by moving vma_kernel_pagesize() to mm.h, providing only a single
> implementation. While at it, improve the kerneldoc a bit.
>
> Ideally, we'd move vma_mmu_pagesize() as well to the header. However,
> its __weak symbol might be overwritten by a PPC variant in hugetlb code.
> So let's leave it in there for now, as it really only matters for some
> hugetlb oddities.
>
> This was found by code inspection.
>
> Fixes: c1d53b92b95c ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, but you need to fix up VMA tests, I attach a patch below to do this. Will
this resolved:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  include/linux/hugetlb.h |  7 -------
>  include/linux/mm.h      | 20 ++++++++++++++++++++
>  mm/hugetlb.c            | 17 -----------------
>  3 files changed, 20 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 65910437be1c..44c1848a2c21 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -777,8 +777,6 @@ static inline unsigned long huge_page_size(const struct hstate *h)
>  	return (unsigned long)PAGE_SIZE << h->order;
>  }
>
> -extern unsigned long vma_kernel_pagesize(struct vm_area_struct *vma);
> -
>  extern unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
>
>  static inline unsigned long huge_page_mask(struct hstate *h)
> @@ -1177,11 +1175,6 @@ static inline unsigned long huge_page_mask(struct hstate *h)
>  	return PAGE_MASK;
>  }
>
> -static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
> -{
> -	return PAGE_SIZE;
> -}
> -
>  static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>  {
>  	return PAGE_SIZE;
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 44e04a42fe77..227809790f1a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1307,6 +1307,26 @@ static inline bool vma_is_shared_maywrite(const struct vm_area_struct *vma)
>  	return is_shared_maywrite(&vma->flags);
>  }
>
> +/**
> + * vma_kernel_pagesize - Default page size granularity for this VMA.
> + * @vma: The user mapping.
> + *
> + * The kernel page size specifies in which granularity VMA modifications
> + * can be performed. Folios in this VMA will be aligned to, and at least
> + * the size of the number of bytes returned by this function.
> + *
> + * The default kernel page size is not affected by Transparent Huge Pages
> + * being in effect.
> + *
> + * Return: The default page size granularity for this VMA.
> + */
> +static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
> +{
> +	if (unlikely(vma->vm_ops && vma->vm_ops->pagesize))
> +		return vma->vm_ops->pagesize(vma);
> +	return PAGE_SIZE;
> +}
> +
>  static inline
>  struct vm_area_struct *vma_find(struct vma_iterator *vmi, unsigned long max)
>  {
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1d41fa3dd43e..66eadfa9e958 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1017,23 +1017,6 @@ static pgoff_t vma_hugecache_offset(struct hstate *h,
>  			(vma->vm_pgoff >> huge_page_order(h));
>  }
>
> -/**
> - * vma_kernel_pagesize - Page size granularity for this VMA.
> - * @vma: The user mapping.
> - *
> - * Folios in this VMA will be aligned to, and at least the size of the
> - * number of bytes returned by this function.
> - *
> - * Return: The default size of the folios allocated when backing a VMA.
> - */
> -unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
> -{
> -	if (vma->vm_ops && vma->vm_ops->pagesize)
> -		return vma->vm_ops->pagesize(vma);
> -	return PAGE_SIZE;
> -}
> -EXPORT_SYMBOL_GPL(vma_kernel_pagesize);
> -
>  /*
>   * Return the page size being used by the MMU to back a VMA. In the majority
>   * of cases, the page size used by the kernel matches the MMU size. On
> --
> 2.43.0
>

----8<----
This breaks the VMA tests when patch 2/4 removes the references in other
headers. So this patch should also update them, I enclose a simple fix for
convenience:

From bec84895cbdbe28e3495c4d90e097074598419e5 Mon Sep 17 00:00:00 2001
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Date: Fri, 6 Mar 2026 11:05:12 +0000
Subject: [PATCH] fix

---
 tools/testing/vma/include/dup.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 3078ff1487d3..65b1030a7fdf 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1318,3 +1318,10 @@ static inline void vma_set_file(struct vm_area_struct *vma, struct file *file)
 	swap(vma->vm_file, file);
 	fput(file);
 }
+
+static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
+{
+	if (unlikely(vma->vm_ops && vma->vm_ops->pagesize))
+		return vma->vm_ops->pagesize(vma);
+	return PAGE_SIZE;
+}
--
2.53.0

