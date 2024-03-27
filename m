Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6188E7C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sEXhPEfA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VMH52G5z3vlF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:04:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sEXhPEfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VLQ2Zrrz3vgZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:03:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B910CE26D9;
	Wed, 27 Mar 2024 15:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAA5C433F1;
	Wed, 27 Mar 2024 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711551835;
	bh=hrWUIu1S4DXcjUN8so6lC+qmnHu3MFuX+fS4XcrdbO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEXhPEfA8uvevGFpChDpATF2dMUKGWLnO5+bt+v7isVd7EjxTKF99rLKMlCoCY2Jk
	 LuBNcgxFXvcAgzKgdn7vsNZjHWI/5Sxa9eaRM8pqyajO+AVM0tR5DZkT4hNHK6CO2A
	 w6S39o/WjUkgG+q0WSK5KMJFjhLU7SRfEIgObn/GsY8ta+z1NArzQzAOYHOeZnYnjW
	 e38vh+dRtIDDS4AosbPwEtJyLKxcC3Cc6m+WHoxDCOw+3s9xMFHxTRa22EtgGEEj/f
	 8i2TtvEZt8J0HLpsg/flQsmKDxLTLrVkjOuog3osUis787HulTYqsgEXHQXq6rhSio
	 WTScQfYfAJsMw==
Date: Wed, 27 Mar 2024 17:03:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 3/3] mm: use "GUP-fast" instead "fast GUP" in
 remaining comments
Message-ID: <ZgQ1LtMUiaj5maDO@kernel.org>
References: <20240327130538.680256-1-david@redhat.com>
 <20240327130538.680256-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327130538.680256-4-david@redhat.com>
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:05:38PM +0100, David Hildenbrand wrote:
> Let's fixup the remaining comments to consistently call that thing
> "GUP-fast". With this change, we consistently call it "GUP-fast".
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/filemap.c    | 2 +-
>  mm/khugepaged.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 387b394754fa..c668e11cd6ef 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1810,7 +1810,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
>   * C. Return the page to the page allocator
>   *
>   * This means that any page may have its reference count temporarily
> - * increased by a speculative page cache (or fast GUP) lookup as it can
> + * increased by a speculative page cache (or GUP-fast) lookup as it can
>   * be allocated by another user before the RCU grace period expires.
>   * Because the refcount temporarily acquired here may end up being the
>   * last refcount on the page, any page allocation must be freeable by
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 38830174608f..6972fa05132e 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1169,7 +1169,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
>  	 * huge and small TLB entries for the same virtual address to
>  	 * avoid the risk of CPU bugs in that area.
>  	 *
> -	 * Parallel fast GUP is fine since fast GUP will back off when
> +	 * Parallel GUP-fast is fine since GUP-fast will back off when
>  	 * it detects PMD is changed.
>  	 */
>  	_pmd = pmdp_collapse_flush(vma, address, pmd);
> -- 
> 2.43.2
> 

-- 
Sincerely yours,
Mike.
