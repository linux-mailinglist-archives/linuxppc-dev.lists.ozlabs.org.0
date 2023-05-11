Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673396FF0A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 13:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH95G2Wvrz3fPg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 21:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UWCQbaUk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH94M5qfQz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 21:42:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UWCQbaUk;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QH94C4P2rz4x4N;
	Thu, 11 May 2023 21:42:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683805356;
	bh=RV3P4xIa1KW4Cd/eChkOkHzb+5sl2d1xyMZVAnBdBJI=;
	h=From:To:Cc:Subject:Date:From;
	b=UWCQbaUknKo8LRT5GH1AKoAez+feAWMcx0tA9zGwe1gO4D+8rZ7GGNsNMgCPfFYyq
	 sdzPp0M1C9d7g17aN7O9IESVgsAZ+3AvBKYrvsbRmLdSxEXlMREh+E2gw3N2PFHABl
	 nz2h+un60N9+l5I9O3iXqTnLbrMFP9zSwsj6Rn8LjZUx/QFBHesEt0nbj6enC4JBtp
	 ijBdW5GHbBH0psrQM1uYqR3p/zM6Ozkg01niLSANFgobT41jt6D6nMIvxiEU+6Dvse
	 m+SDY6gU0DHvq0PW+10iIj3Bxy/FF0IJx/8K/Ir/gmZn6K3IOT6dn/DpL+TpcoC1Df
	 ub66KbMRGIslA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s/radix: Fix soft dirty tracking
Date: Thu, 11 May 2023 21:42:24 +1000
Message-Id: <20230511114224.977423-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dan@danny.cz, aneesh.kumar@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It was reported that soft dirty tracking doesn't work when using the
Radix MMU.

The tracking is supposed to work by clearing the soft dirty bit for a
mapping and then write protecting the PTE. If/when the page is written
to, a page fault occurs and the soft dirty bit is added back via
pte_mkdirty(). For example in wp_page_reuse():

	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
	if (ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1))
		update_mmu_cache(vma, vmf->address, vmf->pte);

Unfortunately on radix _PAGE_SOFTDIRTY is being dropped by
radix__ptep_set_access_flags(), called from ptep_set_access_flags(),
meaning the soft dirty bit is not set even though the page has been
written to.

Fix it by adding _PAGE_SOFTDIRTY to the set of bits that are able to be
changed in radix__ptep_set_access_flags().

Fixes: b0b5e9b13047 ("powerpc/mm/radix: Add radix pte #defines")
Cc: stable@vger.kernel.org # v4.7+
Reported-by: Dan Horák <dan@danny.cz>
Link: https://lore.kernel.org/r/20230511095558.56663a50f86bdc4cd97700b7@danny.cz
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 26245aaf12b8..2297aa764ecd 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1040,8 +1040,8 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 				  pte_t entry, unsigned long address, int psize)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED |
-					      _PAGE_RW | _PAGE_EXEC);
+	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY |
+					      _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
 
 	unsigned long change = pte_val(entry) ^ pte_val(*ptep);
 	/*
-- 
2.40.1

