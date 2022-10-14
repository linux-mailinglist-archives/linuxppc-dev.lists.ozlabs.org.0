Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E915FF052
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppfD5gkjz3flS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:28:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b/sudfr7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b/sudfr7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpnv95lPvz3dxf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:54:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A0D5B8235F;
	Fri, 14 Oct 2022 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22344C43470;
	Fri, 14 Oct 2022 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755682;
	bh=PMz0CufZ9bdih+qExkPO59SYJaIe8RWTKNQFKRHypDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b/sudfr7rkkMu2etVDGvWY3xxrIz9V0XaoK0JqeJeGZb/P0DVatDgHFG72Os7srab
	 5L43GzClUqFoH5PgpBG9wxrZ/KPwAkbv3vnDbBR+xbODmb8XJNccEXNIBN2RuIWpdz
	 q9l5LpiIqVyMfg0kHH9h7vcQI6u9hCgtvy4jDzLNSDgEzbCh+In9xlVIiyorxrkrDJ
	 cr6MpOBsp9OxXSTubPCB7rXtRZy9XdC0eibtJuRVLd0PaYwAqQWkbEL9rFS8b/v+QD
	 IR6CqNEyK/e7WjzkJwYTk8irKUluflM/UhZIebuy8557K4rCYH2azgYrWxJJgyxXrB
	 7mtjj3lVareBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/5] powerpc/mm: Fix UBSAN warning reported on hugetlb
Date: Fri, 14 Oct 2022 09:54:27 -0400
Message-Id: <20221014135430.2110067-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135430.2110067-1-sashal@kernel.org>
References: <20221014135430.2110067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com, yaozhenguo1@gmail.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit 7dd3a7b90bca2c12e2146a47d63cf69a2f5d7e89 ]

Powerpc architecture supports 16GB hugetlb pages with hash translation.
For 4K page size, this is implemented as a hugepage directory entry at
PGD level and for 64K it is implemented as a huge page pte at PUD level

With 16GB hugetlb size, offset within a page is greater than 32 bits.
Hence switch to use unsigned long type when using hugepd_shift.

In order to keep things simpler, we make sure we always use unsigned
long type when using hugepd_shift() even though all the hugetlb page
size won't require that.

The hugetlb_free_p*d_range changes are all related to nohash usage where
we can have multiple pgd entries pointing to the same hugepd entries.
Hence on book3s64 where we can have > 4GB hugetlb page size we will
always find more < next even if we compute the value of more correctly.

Hence there is no functional change in this patch except that it fixes
the below warning.

  UBSAN: shift-out-of-bounds in arch/powerpc/mm/hugetlbpage.c:499:21
  shift exponent 34 is too large for 32-bit type 'int'
  CPU: 39 PID: 1673 Comm: a.out Not tainted 6.0.0-rc2-00327-gee88a56e8517-dirty #1
  Call Trace:
    dump_stack_lvl+0x98/0xe0 (unreliable)
    ubsan_epilogue+0x18/0x70
    __ubsan_handle_shift_out_of_bounds+0x1bc/0x390
    hugetlb_free_pgd_range+0x5d8/0x600
    free_pgtables+0x114/0x290
    exit_mmap+0x150/0x550
    mmput+0xcc/0x210
    do_exit+0x420/0xdd0
    do_group_exit+0x4c/0xd0
    sys_exit_group+0x24/0x30
    system_call_exception+0x250/0x600
    system_call_common+0xec/0x250

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Drop generic change to be sent separately, change 1ULL to 1UL]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220908072440.258301-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/hugetlbpage.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index cef0b7ee1024..a2e28e235fd8 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -371,7 +371,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 		 * single hugepage, but all of them point to
 		 * the same kmem cache that holds the hugepte.
 		 */
-		more = addr + (1 << hugepd_shift(*(hugepd_t *)pmd));
+		more = addr + (1UL << hugepd_shift(*(hugepd_t *)pmd));
 		if (more > next)
 			next = more;
 
@@ -421,7 +421,7 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, pgd_t *pgd,
 			 * single hugepage, but all of them point to
 			 * the same kmem cache that holds the hugepte.
 			 */
-			more = addr + (1 << hugepd_shift(*(hugepd_t *)pud));
+			more = addr + (1UL << hugepd_shift(*(hugepd_t *)pud));
 			if (more > next)
 				next = more;
 
@@ -489,7 +489,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			 * for a single hugepage, but all of them point to the
 			 * same kmem cache that holds the hugepte.
 			 */
-			more = addr + (1 << hugepd_shift(*(hugepd_t *)pgd));
+			more = addr + (1UL << hugepd_shift(*(hugepd_t *)pgd));
 			if (more > next)
 				next = more;
 
-- 
2.35.1

