Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D46295ABEFF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 14:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKZ7d5d76z3bfC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 22:38:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=riS7bYBz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKZ6D6KSLz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 22:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=riS7bYBz;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MKZ685YDkz4x7X;
	Sat,  3 Sep 2022 22:36:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662208609;
	bh=rHeuTgRrfGrBjFMjzmbML7a6c4An5Ak6UxSM4uRunIA=;
	h=From:To:Cc:Subject:Date:From;
	b=riS7bYBzgt85ZaCWylfzNimFqojj6+HFsVy85MbLXItJyjmuTiUBl0d/Vnjp86uAq
	 DGSpZJbbe0iS20c6trcJpPHjQDA/FDB7CrLzAhPuNzf6YfjRgF6pb4XFo0FHdWfYkH
	 HC4DNqRTD+qN8HrGmFQX3Vo6mOf5aFRGe7z4ZOF+4Rq84e/87zc1iTJH82opCF9mZO
	 gWuX5RIvnFgiIGY4rO00fX83IstGR8HbWC3Xkc6afiDXWolNW++vdS3jEHDa6KgfUa
	 /dpn5j1wo8FyOIef9Ydzu8ZhyA21cgz5rgh+yY5HGIBTvQI8VhwOJo57CrDjUhOYOF
	 rfofZxj40Hx/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
Date: Sat,  3 Sep 2022 22:36:39 +1000
Message-Id: <20220903123640.719846-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, aneesh.kumar@linux.ibm.com, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc there are two ways for huge pages to be represented in the
top level page table, aka PGD (Page Global Directory).

If the address space mapped by an individual PGD entry does not
correspond to a given huge page size, then the PGD entry points to a
non-standard page table, known as a "hugepd" (Huge Page Directory).
The hugepd contains some number of huge page PTEs sufficient to map the
address space with the given huge page size.

On the other hand, if the address space mapped by an individual PGD
entry does correspond exactly to a given huge page size, that PGD entry
is used to directly encode the huge page PTE in place. In this case the
pgd_huge() wrapper indicates to generic code that the PGD entry is
actually a huge page PTE.

This commit deals with the pgd_huge() case only, it does nothing with
respect to the hugepd case.

Over time the size of the virtual address space supported on powerpc has
increased several times, which means the location at which huge pages
can sit in the tree has also changed. There have also been new huge page
sizes added, with the introduction of the Radix MMU.

On Power9 and later with the Radix MMU, the largest huge page size in
any implementation is 1GB.

Since the introduction of Radix, 1GB entries have been supported at the
PUD level, with both 4K and 64K base page size. Radix has never had a
supported huge page size at the PGD level.

On Power8 or earlier, which uses the Hash MMU, or Power9 or later with
the Hash MMU enabled, the largest huge page size is 16GB.

Using the Hash MMU and a base page size of 4K, 16GB has never been a
supported huge page size at the PGD level, due to the geometry being
incompatible. The two supported huge page sizes (16M & 16GB) both use
the hugepd format.

Using the Hash MMU and a base page size of 64K, 16GB pages were
supported in the past at the PGD level.

However in commit ba95b5d03596 ("powerpc/mm/book3s/64: Rework page table
geometry for lower memory usage") the page table layout was reworked to
shrink the size of the PGD.

As a result the 16GB page size now fits at the PUD level when using 64K
base page size.

Therefore there are no longer any supported configurations where
pgd_huge() can be true, so drop the definitions for pgd_huge(), and
fallback to the generic definition which is always false.

Fixes: ba95b5d03596 ("powerpc/mm/book3s/64: Rework page table geometry for lower memory usage")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 10 ----------
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 4e697bc2f4cd..48f21820afe2 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -26,16 +26,6 @@ static inline int pud_huge(pud_t pud)
 	return 0;
 }
 
-static inline int pgd_huge(pgd_t pgd)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	if (radix_enabled())
-		return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
-	return 0;
-}
-#define pgd_huge pgd_huge
 /*
  * With radix , we have hugepage ptes in the pud and pmd entries. We don't
  * need to setup hugepage directory for them. Our pte and page directory format
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index 34d1018896b3..2fce3498b000 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -30,15 +30,6 @@ static inline int pud_huge(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
 
-static inline int pgd_huge(pgd_t pgd)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
-}
-#define pgd_huge pgd_huge
-
 /*
  * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't
  * need to setup hugepage directory for them. Our pte and page directory format
-- 
2.37.2

