Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B0652BB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 04:15:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcJVf4skvz3c71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 14:15:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nEnpH5yK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcJTl4VBWz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 14:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nEnpH5yK;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NcJTg0Mtbz4x3w;
	Wed, 21 Dec 2022 14:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671592506;
	bh=eqAIBLUmcICy3LgEU8+CzGPHy97CiqYlcBozr88VRgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nEnpH5yKCXg49RR2P2OgASyKUTK1v/Cpt25ZodcDuYQhuzTY4bfmiopmNdXaSJcxG
	 aT2giTer1CXp4QrKyb0L3iEMExYYi45d6YNdHP/hsCuZ0ooVSZAHVP+TaH2VeP+mV0
	 m7KqD7FQGyuOV2IM8pdQBoAydfWwg9TXYyD/1MwjCHXsflSyAQ9fUUg4pbm6i1ouBK
	 SZjj31OHTFa/rSnU4LNO/R3FzH6Cmo/n1VbDuQf7YV3yJoyt+M/z7P9wZUe0G0LDmb
	 GVN8E+MF/N6Cs5RWhwq5KdcguwthwmMBOOWoIsEsuVPmDTrbRkQpUSO0ShmLK7R0zK
	 zzORrsjT0jX2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
Date: Wed, 21 Dec 2022 14:15:02 +1100
Message-ID: <87tu1pih1l.fsf@mpe.ellerman.id.au>
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
Cc: Christian Brauner <brauner@kernel.org>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>, Rik van Riel <riel@surriel.com>, Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Eric Dumazet <edumazet@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Nadav Amit <nadav.amit@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Kravetz <mike.kravetz@oracle.com> writes:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
>
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
>
> Also, change madvise_dontneed_single_vma to use this new routine.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/kernel/vdso.c                |  4 ++--
>  arch/powerpc/kernel/vdso.c              |  2 +-
>  arch/powerpc/platforms/book3s/vas-api.c |  2 +-
>  arch/powerpc/platforms/pseries/vas.c    |  2 +-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
