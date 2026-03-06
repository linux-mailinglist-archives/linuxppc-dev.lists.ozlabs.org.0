Return-Path: <linuxppc-dev+bounces-17806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBtTEM3GqmnVWwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:21:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFED220731
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS59h2XYXz3c9x;
	Fri, 06 Mar 2026 23:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772795491;
	cv=none; b=DjUheXaY6MwDtnVQzz/fbjKF0AFaj/CQZhI1L2IuwzzzrE8dcHyUEnoeKowc/BlkrbGX2f5UwojQaIxVGLNHbbiEpA+6CLsq0oxskCrz1TRJoZ7AJdX94fnDRSZyDbyBVRnhk9wuHYTr3Wjmx/NsTJnCjl+4+7p12FIzWJhOL1oEYYLxMsxrTISAuUf88WvH18JcCYtUD0yIDOD4PU0Tj2+qiNDFYkl/RCVKK0QR5aCmRlNySRCCN0HKB4YD1ZL3RCrGqHgQVmoNsrG+UABzdI8H4SzER+Q9KziG1v1xLMdp953vYS4pNFprKhQ1EfNHzHAjlNUC2wVVvoGisljDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772795491; c=relaxed/relaxed;
	bh=PumA3EBaEMAeDzqDrpITFSV9O0HJ5n9l26R6Sjhk7P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpi7W8htnnpVEvwcM+cP8bbQFH+VM5K22UjJrGeqEN2mSXxnvcmAub9MbuMO7ttyquodkp4loOM1OZt0WF3TFuzqa/xQAGwg+UXhfrgd5A2Xrj+6VApQ2LXAi6gUok4PjhTbJ6c0S9WjJr1+xIE9jW2Pcc13s0EDyyfmjDzZyUgdO6L/utclO1N4Q1vUbTZqeCd9ZNmd2p9x8h7RRwMXkOeMnNBUPkgsoeQnkNU/9kvncaVIh+af+WD+2z+xG6DN/s4YIcARNbRIS9lmcbrsOYqgmFyhNjxNNSFamgLIMR4ZvDK5aa23j12hJ+0gMHbuLORE/aydjq+/BMxth2ljGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdHvIeL/; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdHvIeL/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS3cy2ky5z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 22:11:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C43144454;
	Fri,  6 Mar 2026 11:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B593EC4CEF7;
	Fri,  6 Mar 2026 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795488;
	bh=XPnWJ/zcW6bcNJfU50q7o2JeLb8fNCmjYqceT7SznhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdHvIeL/wlKDg0FcHc0VzSvms6Qw1rJu3w5LF8u/FdPD9nAOxopFjS63ed7LiZtQn
	 UkSZl8EQ/mSVlZMpC43C6W86wNCXOoApnPfV/pfMb9E6n3qbpoNGB1qIVoLon3ASbH
	 nPcp27j5jCCwpmNUZMuAZX5MlN/ZRYDxiZ7xcKGfVHH++DqHgOeNE36bRq48VMLtNw
	 0liKlv8hMf/KQ/gdlYvpGQNcZQluXf/jHE6RmlecqumS3+3cBxXFlidPpilxI+l56B
	 mcSNfvgEx7MbN3meiAgJb3tkUpCw3KI3eicxkTPgCB2KGUdzChTV5da5pFQkzP0CDk
	 hRbRCxTW1/N/w==
Date: Fri, 6 Mar 2026 11:11:25 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Subject: Re: [PATCH v1 2/4] mm: move vma_mmu_pagesize() from hugetlb to vma.c
Message-ID: <8ed76150-9e06-45c9-a061-1a1bd1d4c0fa@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <20260306101600.57355-3-david@kernel.org>
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
In-Reply-To: <20260306101600.57355-3-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4DFED220731
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17806-lists,linuxppc-dev=lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:15:58AM +0100, David Hildenbrand (Arm) wrote:
> vma_mmu_pagesize() is also queried on non-hugetlb VMAs and does not
> really belong into hugetlb.c.
>
> PPC64 provides a custom overwrite with CONFIG_HUGETLB_PAGE, see
> arch/powerpc/mm/book3s64/slice.c, so we cannot easily make this a
> static inline function.
>
> So let's move it to vma.c and add some proper kerneldoc.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  include/linux/hugetlb.h |  7 -------
>  include/linux/mm.h      |  2 ++
>  mm/hugetlb.c            | 11 -----------
>  mm/vma.c                | 21 +++++++++++++++++++++
>  4 files changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 44c1848a2c21..aaf3d472e6b5 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -777,8 +777,6 @@ static inline unsigned long huge_page_size(const struct hstate *h)
>  	return (unsigned long)PAGE_SIZE << h->order;
>  }
>
> -extern unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
> -
>  static inline unsigned long huge_page_mask(struct hstate *h)
>  {
>  	return h->mask;
> @@ -1175,11 +1173,6 @@ static inline unsigned long huge_page_mask(struct hstate *h)
>  	return PAGE_MASK;
>  }
>
> -static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> -{
> -	return PAGE_SIZE;
> -}
> -
>  static inline unsigned int huge_page_order(struct hstate *h)
>  {
>  	return 0;
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 227809790f1a..22d338933c84 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1327,6 +1327,8 @@ static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
>  	return PAGE_SIZE;
>  }
>
> +unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
> +
>  static inline
>  struct vm_area_struct *vma_find(struct vma_iterator *vmi, unsigned long max)
>  {
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 66eadfa9e958..f6ecca9aae01 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1017,17 +1017,6 @@ static pgoff_t vma_hugecache_offset(struct hstate *h,
>  			(vma->vm_pgoff >> huge_page_order(h));
>  }
>
> -/*
> - * Return the page size being used by the MMU to back a VMA. In the majority
> - * of cases, the page size used by the kernel matches the MMU size. On
> - * architectures where it differs, an architecture-specific 'strong'
> - * version of this symbol is required.
> - */
> -__weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> -{
> -	return vma_kernel_pagesize(vma);
> -}
> -
>  /*
>   * Flags for MAP_PRIVATE reservations.  These are stored in the bottom
>   * bits of the reservation map pointer, which are always clear due to
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..e95fd5a5fe5c 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -3300,3 +3300,24 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
>
>  	return 0;
>  }
> +
> +/**
> + * vma_mmu_pagesize - Default MMU page size granularity for this VMA.
> + * @vma: The user mapping.
> + *
> + * In the common case, the default page size used by the MMU matches the
> + * default page size used by the kernel (see vma_kernel_pagesize()). On
> + * architectures where it differs, an architecture-specific 'strong' version
> + * of this symbol is required.
> + *
> + * The default MMU page size is not affected by Transparent Huge Pages
> + * being in effect, or any usage of larger MMU page sizes (either through
> + * architectural huge-page mappings or other explicit/implicit coalescing of
> + * virtual ranges performed by the MMU).
> + *
> + * Return: The default MMU page size granularity for this VMA.
> + */
> +__weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> +{
> +	return vma_kernel_pagesize(vma);
> +}
> --
> 2.43.0
>

