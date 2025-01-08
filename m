Return-Path: <linuxppc-dev+bounces-4834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF6A057F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkSR3MP7z306x;
	Wed,  8 Jan 2025 21:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331607;
	cv=none; b=f8EeUE50qWU9Yb+94ZJZVS5CMfbdZc9zwxkEC8PfKLKJcewvraOJq/l7xeWJ4894U3oGkUV2KDZHESkr90uXgBQ7++CQd9t71WKpW2yfe3Ls6lYgXKoqdZTo2LtPkYXrzruSJ5ZHrCpmn034Sv+bRi4f9Z4Vb/WX48+YcallrH+v8gqUAGL++jPibSzYo2JFNvt6hHd88INRUyN2d0nVW53lcVAAmiNpxCG68I5iCeZrhcuazANGFaSflPR2pO8k992KpSqasOuTFIQBYGniMBM8YNDCnKehd594tT3aTTtgCJInKiJXx3LIARCgfy5bNRu6nd4H+Tn87ZJRY4+Gug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331607; c=relaxed/relaxed;
	bh=0ZO0JF48PnE5OnMm9WQGhjRUKnlnOp2SDmpnezAvqrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVczIRn05T6lMNIRvo03FVJwQRU0fgb8WUx12C1bdvKiJGK7yIuOu92BVuBCYTBrA5W/r/GuO9Hn483c4W8H1QkkcwRUyykcgJO1YXrAJvoYSu8g8+4hdgWWEH6mNAjs9a94545cDhpm/XElllX3ERaPdaaOttGhXoprDAbVUkNnYq/IReIEvQf3ioSrUZNYHYPVkmskiKuo7acC1vzun3V6jmn1r7Bx2BRq0P8ovsorGUuUiIwX8cR6ktMpNZZ0QqDXHIDOGkrTtoeUm2XpZZfTdOXL+ONzI6t9o8oLETzE1uH2H92gh/ffOOT0WAYlp+sAtiAgCWGpwgUpEGUIzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkSQ2jT8z2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSkLJ1pJWz9sSC;
	Wed,  8 Jan 2025 11:14:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_mbmxUtfb9A; Wed,  8 Jan 2025 11:14:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSkLJ13Myz9sS7;
	Wed,  8 Jan 2025 11:14:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 11C018B768;
	Wed,  8 Jan 2025 11:14:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qMcQUhxvLles; Wed,  8 Jan 2025 11:14:48 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A1C9A8B767;
	Wed,  8 Jan 2025 11:14:47 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc/64s: Rewrite __real_pte() as a static inline
Date: Wed,  8 Jan 2025 11:14:46 +0100
Message-ID: <06750dbc7bf961e3ea7ef7a89d5c220972465ea5.1736331264.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736331286; l=1520; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=u99myE4//kaq9eHNSUvrma04lP4z4ee74yUnWsUBWcE=; b=Hd8TuFHwGMV72yXy2VT+umdz5+rIYpwocLoHRHicQU5ojGTPHYXCaZLFApRgKySJLWEAZ5K33 oEdLPAXyWH1BLLAYpA9tB2IhmLIPjUogjrgeuR5JBNOLsOXpIqFPKJn
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rewrite __real_pte() as a static inline in order to avoid
following warning/error when building with 4k page size:

	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
	   49 |         int i, offset;
	      |                ^~~~~~
	cc1: all warnings being treated as errors

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/
Fixes: ff31e105464d ("powerpc/mm/hash64: Store the slot information at the right offset for hugetlb")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index c3efacab4b94..a7a68ba9c71b 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -77,7 +77,10 @@
 /*
  * With 4K page size the real_pte machinery is all nops.
  */
-#define __real_pte(e, p, o)		((real_pte_t){(e)})
+static inline real_pte_t __real_pte(pte_t pte, pte_t *ptep, int offset)
+{
+	return (real_pte_t){pte};
+}
 #define __rpte_to_pte(r)	((r).pte)
 #define __rpte_to_hidx(r,index)	(pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
 
-- 
2.47.0


