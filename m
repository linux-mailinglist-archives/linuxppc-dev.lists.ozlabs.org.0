Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E0923EEA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:27:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDQg/cO3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD3bm49ctz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:27:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDQg/cO3;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD3b32TvVz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:26:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719926780;
	bh=UGTwS/DKg+8pMXk0DI9KdA5PsJ49u27dDjQ27xdvrOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aDQg/cO3ChtGupOyDrsKCvhp3Wj5I2zvRwE5aNcedmdk8tx+t0nZ35mD2Sgfglk6c
	 wHyzUcEsUkk2oK/1dwxn4IPMeJRBlIItgOXUp2hIKqm72RVwTLM6EtDPKhn+hgM0IE
	 77bDh5Dfs5fDf2kMOHjqXSGuyyHMM2ZTDZmTzx/XS4oatFogUOUQCqA29oc6sCaUss
	 zVteowZUNrEuQv3HVz2TIIwaVqJIw5szCFxnN6EWj4TXxb2GIWb+zDlw2i7ovRVWnP
	 rIpmwVkonUgH1purEDe7D8IcnUQrGitkCcRUSWpcbf27m/JpC4Ax1XIp0shJHPFvD1
	 +aJKCunhITUCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD3Zz5DnTz4wny;
	Tue,  2 Jul 2024 23:26:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v6 21/23] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
In-Reply-To: <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
 <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu>
Date: Tue, 02 Jul 2024 23:26:19 +1000
Message-ID: <87plrwj56s.fsf@mail.lhotse>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> On book3s/64, the only user of hugepd is hash in 4k mode.
>
> All other setups (hash-64, radix-4, radix-64) use leaf PMD/PUD.
>
> Rework hash-4k to use contiguous PMD and PUD instead.
>
> In that setup there are only two huge page sizes: 16M and 16G.
>
> 16M sits at PMD level and 16G at PUD level.
>
> pte_update doesn't know page size, lets use the same trick as
> hpte_need_flush() to get page size from segment properties. That's
> not the most efficient way but let's do that until callers of
> pte_update() provide page size instead of just a huge flag.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3:
> - Add missing pmd_leaf_size() and pud_leaf_size()
> - More cleanup in hugetlbpage_init()
> - Take a page fault when DIRTY or ACCESSED is missing on hash-4 hugepage
>
> v4: Rebased on v6.10-rc1
>
> v6: Added a WARN_ON_ONCE() in hash__pte_update() in case the pagesize is unexpected.
> ---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  | 15 ------
>  arch/powerpc/include/asm/book3s/64/hash.h     | 40 +++++++++++++---
>  arch/powerpc/include/asm/book3s/64/hugetlb.h  | 38 ---------------
>  .../include/asm/book3s/64/pgtable-4k.h        | 47 -------------------
>  .../include/asm/book3s/64/pgtable-64k.h       | 20 --------
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 22 +++++++--
>  arch/powerpc/include/asm/hugetlb.h            |  4 ++
>  .../powerpc/include/asm/nohash/hugetlb-e500.h |  4 --
>  arch/powerpc/include/asm/page.h               |  8 ----
>  arch/powerpc/mm/book3s64/hash_utils.c         | 11 +++--
>  arch/powerpc/mm/book3s64/hugetlbpage.c        | 10 ++++
>  arch/powerpc/mm/book3s64/pgtable.c            | 12 -----
>  arch/powerpc/mm/hugetlbpage.c                 | 26 ----------
>  arch/powerpc/mm/pgtable.c                     |  2 +-
>  arch/powerpc/platforms/Kconfig.cputype        |  1 -
>  15 files changed, 74 insertions(+), 186 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/book3s/64/pgtable-4k.h

This looks good to me. I've run a few tests on it and haven't seen any
issues.

I also dumped the page tables of a test program and checked they looked
sensible. And I checked that the hash insert path is actually inserting
a huge page entry (of course it is, but just to be sure).

On mainline using a hugepd page hits the first warning in
try_grab_folio() (via gup_hugepd()) and hangs the process. I haven't
seen that reported (it goes back to v6.5), so my impression is hugepd on
hash-4k is essentially unused these days.

This series is an improvement on that, so let's get it into mm-unstable
for some wider testing.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
