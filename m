Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B645E013
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 18:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0QXq1WNJz3dnG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0QVF3MBPz3cD3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 04:53:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0QTt2PNZz9sSx;
 Thu, 25 Nov 2021 18:53:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPQHkHushite; Thu, 25 Nov 2021 18:53:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0QTm73X0z9sT3;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E03648B763;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sjDGrJXyZpbo; Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C0968B786;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1APHrLZR385543
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 18:53:21 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1APHrLos385542;
 Thu, 25 Nov 2021 18:53:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v2 rebased 8/9] powerpc/mm: Properly randomise mmap with slices
Date: Thu, 25 Nov 2021 18:52:57 +0100
Message-Id: <31a66d870133f44c30ce5dc19a72de1730fe8ec1.1637862579.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637862579.git.christophe.leroy@csgroup.eu>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637862777; l=3498; s=20211009;
 h=from:subject:message-id; bh=ngfeg/2tmEpq6TE0+FDDvF+lIoivpzUM2irZRsGVREQ=;
 b=9Pe0efXJOltbYJ82HdElYsMUvhI0Nr68/09R0u1WqH+n0DchFPoEhiBUvFf9Y1DtfxuQgZCRRrpi
 S6RvOmDVDBMjXPDRTKWXafuYsO4DZ+gIC3zR33dzsY0Op9o5Jd1n
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that powerpc switched to default topdown mmap layout,
mm->mmap_base is properly randomised.  However
slice_find_area_bottomup() doesn't use mm->mmap_base but
uses the fixed TASK_UNMAPPED_BASE instead.

slice_find_area_bottomup() being used as a fallback to
slice_find_area_topdown(), it can't use mm->mmap_base
directly.

Instead of always using TASK_UNMAPPED_BASE as base address, leave
it to the caller. When called from slice_find_area_topdown()
TASK_UNMAPPED_BASE is used. Otherwise mm->mmap_base is used.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s64/slice.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index 99742dde811c..997f40184e97 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -276,20 +276,18 @@ static bool slice_scan_available(unsigned long addr,
 }
 
 static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
-					      unsigned long len,
+					      unsigned long addr, unsigned long len,
 					      const struct slice_mask *available,
 					      int psize, unsigned long high_limit)
 {
 	int pshift = max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, next_end;
+	unsigned long found, next_end;
 	struct vm_unmapped_area_info info;
 
 	info.flags = 0;
 	info.length = len;
 	info.align_mask = PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset = 0;
-
-	addr = TASK_UNMAPPED_BASE;
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -322,12 +320,12 @@ static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
 }
 
 static unsigned long slice_find_area_topdown(struct mm_struct *mm,
-					     unsigned long len,
+					     unsigned long addr, unsigned long len,
 					     const struct slice_mask *available,
 					     int psize, unsigned long high_limit)
 {
 	int pshift = max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, prev;
+	unsigned long found, prev;
 	struct vm_unmapped_area_info info;
 	unsigned long min_addr = max(PAGE_SIZE, mmap_min_addr);
 
@@ -335,8 +333,6 @@ static unsigned long slice_find_area_topdown(struct mm_struct *mm,
 	info.length = len;
 	info.align_mask = PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset = 0;
-
-	addr = mm->mmap_base;
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
@@ -377,7 +373,7 @@ static unsigned long slice_find_area_topdown(struct mm_struct *mm,
 	 * can happen with large stack limits and large mmap()
 	 * allocations.
 	 */
-	return slice_find_area_bottomup(mm, len, available, psize, high_limit);
+	return slice_find_area_bottomup(mm, TASK_UNMAPPED_BASE, len, available, psize, high_limit);
 }
 
 
@@ -386,9 +382,9 @@ static unsigned long slice_find_area(struct mm_struct *mm, unsigned long len,
 				     int topdown, unsigned long high_limit)
 {
 	if (topdown)
-		return slice_find_area_topdown(mm, len, mask, psize, high_limit);
+		return slice_find_area_topdown(mm, mm->mmap_base, len, mask, psize, high_limit);
 	else
-		return slice_find_area_bottomup(mm, len, mask, psize, high_limit);
+		return slice_find_area_bottomup(mm, mm->mmap_base, len, mask, psize, high_limit);
 }
 
 static inline void slice_copy_mask(struct slice_mask *dst,
-- 
2.33.1

