Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E60872EE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:30:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfRhLri6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqMx75fBfz3vYL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:30:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfRhLri6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqMwR71Xrz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 17:29:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5F2A61939;
	Wed,  6 Mar 2024 06:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D312C433C7;
	Wed,  6 Mar 2024 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709706565;
	bh=t2prn8NVfSlgCXr/ufwWnITjShOYjafeq9mcR4kzmvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfRhLri6MiYJ+a8DZTv59cV8JbopCdO+KDu2/kDALeTLRDcDbQZ5ZzxMVRIcB3XOw
	 XlhEmGG9FfA6RXiMK9HLhrOPMl5cKnjJyKaugvmVK6bGJNJROchNsH6FCmqyya9bfQ
	 15JjE4TxrrT+5tTqK1PZWtU608MrBxqvqp0UJA1XM6iRTcLwq802/IkeuleIBe4TFn
	 l+PmZrxvAxpr/z/RDBNSS2VYyrl4WK5hjLt2TTB7qpA4mx58o3Dqj5qV3eAi9w+ABv
	 V2ABDFP8hCc6yI7H4X0n05yHnyO0tBKRobIdXY7hDbwwKsxl8dAUxu/nkXoi9umx1q
	 w76VXD6hrSSfg==
Date: Wed, 6 Mar 2024 08:28:30 +0200
From: Mike Rapoport <rppt@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 06/10] mm/kasan: Use pXd_leaf() in shadow_mapped()
Message-ID: <ZegNDhbFjPHTC3Pp@kernel.org>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-7-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-7-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:46PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> There is an old trick in shadow_mapped() to use pXd_bad() to detect huge
> pages.  After commit 93fab1b22ef7 ("mm: add generic p?d_leaf() macros") we
> have a global API for huge mappings.  Use that to replace the trick.
> 
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/kasan/shadow.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 9ef84f31833f..d6210ca48dda 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -199,19 +199,12 @@ static bool shadow_mapped(unsigned long addr)
>  	pud = pud_offset(p4d, addr);
>  	if (pud_none(*pud))
>  		return false;
> -
> -	/*
> -	 * We can't use pud_large() or pud_huge(), the first one is
> -	 * arch-specific, the last one depends on HUGETLB_PAGE.  So let's abuse
> -	 * pud_bad(), if pud is bad then it's bad because it's huge.
> -	 */
> -	if (pud_bad(*pud))
> +	if (pud_leaf(*pud))
>  		return true;
>  	pmd = pmd_offset(pud, addr);
>  	if (pmd_none(*pmd))
>  		return false;
> -
> -	if (pmd_bad(*pmd))
> +	if (pmd_leaf(*pmd))
>  		return true;
>  	pte = pte_offset_kernel(pmd, addr);
>  	return !pte_none(ptep_get(pte));
> -- 
> 2.44.0
> 
> 

-- 
Sincerely yours,
Mike.
