Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76009472CEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 14:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCMPC2ybQz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 00:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sr8mIM4f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCMNW6Mn1z2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:11:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Sr8mIM4f; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JCMNW0lkBz4xdH;
 Tue, 14 Dec 2021 00:11:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639401115;
 bh=jTc1Puw+2oIqpDYLVpQk5kYHh0M0my7/zFGIJ66DjiE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Sr8mIM4faoYbBwD5NOI7CSBv07C53ii6iQomoJVtKs8IQ4O8pYmJmKU5pLcfdKl2k
 +Q0eeIQuq23PV8froy6TJmhinPKwkIm++eeV2qDDW/34/pDr4p23VTeYAJQzSkOxxQ
 jvysenzLRCleqL9jSBkDOVLxSiZcc1pZTp/rVyG8EKUF9pbOXin25aREqFxJMWne6w
 zC9f87/geeMtnAEQOAwdo0/4HC5jFzVnwveetka2BYfcqTRdhG/QO5WCHNgSY2GJh5
 y+DwDJ39ncFcP9b0GQ53VjD+CPnE8BseABV9W7D58g82Z4h8xzJyGoL7VcDq04tex0
 ftif826ekzEog==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 "alex@ghiti.fr" <alex@ghiti.fr>
Subject: Re: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area()
 and call it from arch_get_unmapped_area()
In-Reply-To: <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
 f6795053dac8d4d2f90d4a98842dd6d2ccd544ad
Date: Tue, 14 Dec 2021 00:02:32 +1100
Message-ID: <87ee6gmzdj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Use the generic version of arch_get_unmapped_area() which
> is now available at all time instead of its copy
> radix__arch_get_unmapped_area()
>
> Instead of setting mm->get_unmapped_area() to either
> arch_get_unmapped_area() or generic_get_unmapped_area(),
> always set it to arch_get_unmapped_area() and call
> generic_get_unmapped_area() from there when radix is enabled.
>
> Do the same with radix__arch_get_unmapped_area_topdown()
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/mmap.c | 127 ++---------------------------------------
>  1 file changed, 6 insertions(+), 121 deletions(-)
>
> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
> index 9b0d6e395bc0..46781d0103d1 100644
> --- a/arch/powerpc/mm/mmap.c
> +++ b/arch/powerpc/mm/mmap.c
> @@ -81,115 +81,15 @@ static inline unsigned long mmap_base(unsigned long rnd,
>  }
>  
>  #ifdef HAVE_ARCH_UNMAPPED_AREA
> -#ifdef CONFIG_PPC_RADIX_MMU
> -/*
> - * Same function as generic code used only for radix, because we don't need to overload
> - * the generic one. But we will have to duplicate, because hash select
> - * HAVE_ARCH_UNMAPPED_AREA
> - */
> -static unsigned long
> -radix__arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -			     unsigned long len, unsigned long pgoff,
> -			     unsigned long flags)
> -{
> -	struct mm_struct *mm = current->mm;
> -	struct vm_area_struct *vma;
> -	int fixed = (flags & MAP_FIXED);
> -	unsigned long high_limit;
> -	struct vm_unmapped_area_info info;
> -
> -	high_limit = DEFAULT_MAP_WINDOW;
> -	if (addr >= high_limit || (fixed && (addr + len > high_limit)))
> -		high_limit = TASK_SIZE;
> -
> -	if (len > high_limit)
> -		return -ENOMEM;

There are some differences in the above vs the generic code, the generic
arch_get_unmapped_area_topdown() in mm/mmap.c does:

	const unsigned long mmap_end = arch_get_mmap_end(addr);

	if (len > mmap_end - mmap_min_addr)
		return -ENOMEM;

	if (flags & MAP_FIXED)
		return addr;


Our current code adjusts high_limit for fixed mappings that span above
the default map window. We added that logic in:

  35602f82d0c7 ("powerpc/64s/hash: Allow MAP_FIXED allocations to cross 128TB boundary")

That means a fixed mapping that crosses the 128T boundary will be
allowed by our code.

On the other hand the generic code will allow a fixed mapping to cross
the 128T boundary, but only if the size of the mapping is < ~128T.

(The actual size limit is (128T - mmap_min_addr), which is usually 4K or
64K, but is adjustable.)

It's unlikely that any apps are doing fixed mappings larger than 128T
that cross the 128T boundary, but I think we need to allow it. 128T
seems like a lot, but is not compared to the entire 4PB address space.

So I think we need to fix that in the generic code.

The easiest option is probably to pass flags to arch_get_mmap_end(), and
then the arches can decide whether to adjust the return value based on
flags.


Then there's also the extra check we have here:

> -	if (fixed) {
> -		if (addr > high_limit - len)
> -			return -ENOMEM;
> -		return addr;
> -	}

I think we can drop that when converting to the generic version, the
only case in which it matters is when high_limit == TASK_SIZE, and
get_unmapped_area() already does that check after calling us:

	if (addr > TASK_SIZE - len)
		return -ENOMEM;


cheers
