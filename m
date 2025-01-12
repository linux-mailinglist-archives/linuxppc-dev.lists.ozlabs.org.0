Return-Path: <linuxppc-dev+bounces-5099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD6A0AB8D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 19:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWPb83lXgz30YT;
	Mon, 13 Jan 2025 05:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736707812;
	cv=none; b=WvBQcCVj3F0J9R91o58g1jgkoR+bJQtYRUehX/JBooS6hr42v1UVqDXgW+JB+XIyglXQI9uQ+8WhozpF6IkQkV0OjKIt+2aKs49rlahE0MNQi7kbSnqEEtm01zHlJ9zFMTJeYSTrFye8JsFwf76b+x5+St2rku845fKIcKqUSH6mIku97ZxY+5tkowLENs/blfw3BGDGrrjPQruiE/fdiQrMbN2WHjnYnDNXt8xSvMNjxBLMEoxaF2jvrAZVL7CQReqAb1r9DjXoAMyzh/5vUuFCSEglhDXH57UBJ0pmrCGS3aMT5kwGtKvVSkBJ/ahJkKphpqCo/XTpAU/iXJR4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736707812; c=relaxed/relaxed;
	bh=ZS3D37KsxlMxbUg7nOnlXx+xE6RRgLno2WktnT7Kkn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQvzF+mFP0klaaiHDgdfIq26Vh4tcOZG4NLy6oEWVPogZff+fzppcCEbK+7H40J2ZYm0YAkm8T9LWTk7OdgQrrVtSdnBEVcxNnnuPbcxHcQhsCN/y368Vwzc8xUicME3kYc8Z7zLVrU2UKXDurJRxYehR9WRyJmrLg02CqjIpNpeAE8dPxyz245TS/3pASdCmfWIdxy9F328EWWIVQF4NC2f4UK9LeOACO1ZRROExW1UsF0T9QpKJTdggvBF7Infx3dGQJz8dk/gG+tJhvjXu8YfhVh+9OE8fLFDb/ECnNxMYnzOkCVOXiM8ao75sV/oHuEQ2ouYQ7ThvgNw6IbtRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWPb768fWz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 05:50:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YWP216Q9pz9sPd;
	Sun, 12 Jan 2025 19:24:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCO98kkgqQfo; Sun, 12 Jan 2025 19:24:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YWP215KR8z9rvV;
	Sun, 12 Jan 2025 19:24:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B6A68B764;
	Sun, 12 Jan 2025 19:24:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MEc6TNQfKkRM; Sun, 12 Jan 2025 19:24:57 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD4658B763;
	Sun, 12 Jan 2025 19:24:56 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
Date: Sun, 12 Jan 2025 19:24:46 +0100
Message-ID: <e0d340a5b7bd478ecbf245d826e6ab2778b74e06.1736706263.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736706286; l=2193; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OtdjuQYF5cvXROXXZjm5jTcVXVT7DR3WsPE6iY4JKJY=; b=LJ+tM3q4Oo0nf5jzTmSnj6pd+WwJWWkhnGxgTUkYmk+bVmBQ9oqn2TwxVvc/ttOzT4idRGypq Ogq5D9JnOEmDCd5VfntIC2ZYxHDDn4/rAMaPXfOKVYg8Nkmo/17Wikm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rewrite __real_pte() and __rpte_to_hidx() as static inline in order to
avoid following warnings/errors when building with 4k page size:

	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
	   49 |         int i, offset;
	      |                ^~~~~~

	  CC      arch/powerpc/mm/book3s64/hash_native.o
	arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
	arch/powerpc/mm/book3s64/hash_native.c:782:29: error: variable 'index' set but not used [-Werror=unused-but-set-variable]
	  782 |         unsigned long hash, index, hidx, shift, slot;
	      |                             ^~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/
Fixes: ff31e105464d ("powerpc/mm/hash64: Store the slot information at the right offset for hugetlb")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Also inline __rpte_to_hidx() for the same reason
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index c3efacab4b94..aa90a048f319 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -77,9 +77,17 @@
 /*
  * With 4K page size the real_pte machinery is all nops.
  */
-#define __real_pte(e, p, o)		((real_pte_t){(e)})
+static inline real_pte_t __real_pte(pte_t pte, pte_t *ptep, int offset)
+{
+	return (real_pte_t){pte};
+}
+
 #define __rpte_to_pte(r)	((r).pte)
-#define __rpte_to_hidx(r,index)	(pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
+
+static inline unsigned long __rpte_to_hidx(real_pte_t rpte, unsigned long index)
+{
+	return pte_val(__rpte_to_pte(rpte)) >> H_PAGE_F_GIX_SHIFT;
+}
 
 #define pte_iterate_hashed_subpages(rpte, psize, va, index, shift)       \
 	do {							         \
-- 
2.47.0


