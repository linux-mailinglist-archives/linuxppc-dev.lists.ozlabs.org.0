Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B31923F98
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4Cd4pKpz3vgB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD48b5Wq3z3fRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:51:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD4841fp7z9v6W;
	Tue,  2 Jul 2024 15:51:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9od68sRy3VN; Tue,  2 Jul 2024 15:51:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD4805RNyz9v4J;
	Tue,  2 Jul 2024 15:51:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B678D8B774;
	Tue,  2 Jul 2024 15:51:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BGNhRIrkHoLm; Tue,  2 Jul 2024 15:51:28 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4106F8B764;
	Tue,  2 Jul 2024 15:51:28 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 07/23] mm: Define __pte_leaf_size() to also take a PMD entry
Date: Tue,  2 Jul 2024 15:51:19 +0200
Message-ID: <c7c008f0a314bf8029ad7288fdc908db1ec7e449.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928274; l=1803; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NqqR+DBf4uYbt5gP7om6e3QFNLkHAAKdU42xGKHVcEo=; b=yV33hLP9H4xcUhyFxDXIt5LnxJgWqrCn1V5Xykpxq478yOcZTAZhwgAiteylu27VRD9Xbv6er iD0lsuBP5qqBVXJsr9LvPuLb4J+Nh0P8vxx5LpDXoG49QzJ3MzMfoS4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc 8xx, when a page is 8M size, the information is in the PMD
entry. So allow architectures to provide __pte_leaf_size() instead of
pte_leaf_size() and provide the PMD entry to that function.

When __pte_leaf_size() is not defined, define it as a pte_leaf_size()
so that architectures not interested in the PMD arguments are not
impacted.

Only define a default pte_leaf_size() when __pte_leaf_size() is not
defined to make sure nobody adds new calls to pte_leaf_size() in the
core.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
v3: Don't change pte_leaf_size() to not impact other architectures
---
 include/linux/pgtable.h | 3 +++
 kernel/events/core.c    | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2f32eaccf0b9..2a6a3cccfc36 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1907,9 +1907,12 @@ typedef unsigned int pgtbl_mod_mask;
 #ifndef pmd_leaf_size
 #define pmd_leaf_size(x) PMD_SIZE
 #endif
+#ifndef __pte_leaf_size
 #ifndef pte_leaf_size
 #define pte_leaf_size(x) PAGE_SIZE
 #endif
+#define __pte_leaf_size(x,y) pte_leaf_size(y)
+#endif
 
 /*
  * We always define pmd_pfn for all archs as it's used in lots of generic
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8f908f077935..b2ca11bdc11e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7609,7 +7609,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 
 	pte = ptep_get_lockless(ptep);
 	if (pte_present(pte))
-		size = pte_leaf_size(pte);
+		size = __pte_leaf_size(pmd, pte);
 	pte_unmap(ptep);
 #endif /* CONFIG_HAVE_GUP_FAST */
 
-- 
2.44.0

