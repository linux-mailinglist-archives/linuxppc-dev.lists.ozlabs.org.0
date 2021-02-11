Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 284EC318CFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:11:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbz7l5lSLzDsgW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbyjd1jsvzDwmB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 00:52:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UHSZEZza; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dbyjc5Htrz9sVV; Fri, 12 Feb 2021 00:52:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613051524;
 bh=1f+rnppn/MsQAkfq0T/OdyA09UaDJHXbdJ52lRVyYUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UHSZEZzaNMHpNJ3F1+XTBhGxRu7ufwyyWTOTB2PxeNvtHSQMr52qH6qv8XNUw3VM3
 zt4QVCXNUh++50MrUeJ8hBPBkZeRKe/sE2OBjcIcYsfvraD8H4UlZ3N7C3vMUaS4WU
 mJp4PyQvwQN5n+5Lu4yZy6hxAPuLAaMY8cx8tcxyXpR7hd4Hwx+6elt4ivvFMo72wV
 gjNsSIGLnhSaGjra48DMdVpfV6ezG6jaX2FHZiNGWWk4LEs7O2JRYsrmRgaejYcXIz
 aLzC2hnqzMAeJAhLtiKTk/vE7PI4E3XWo3YHMJQvmlncqAjKuWJCxDd7s4XJF8Q+zD
 kU6J4vzs5ciww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
Date: Fri, 12 Feb 2021 00:51:28 +1100
Message-Id: <20210211135130.3474832-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211135130.3474832-1-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pull the loop calling hpte_updateboltedpp() out of
hash__change_memory_range() into a helper function. We need it to be a
separate function for the next patch.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 03819c259f0a..3663d3cdffac 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -400,10 +400,23 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+static void change_memory_range(unsigned long start, unsigned long end,
+				unsigned int step, unsigned long newpp)
+{
+	unsigned long idx;
+
+	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
+		 start, end, newpp, step);
+
+	for (idx = start; idx < end; idx += step)
+		/* Not sure if we can do much with the return value */
+		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
+							mmu_kernel_ssize);
+}
+
 static bool hash__change_memory_range(unsigned long start, unsigned long end,
 				      unsigned long newpp)
 {
-	unsigned long idx;
 	unsigned int step, shift;
 
 	shift = mmu_psize_defs[mmu_linear_psize].shift;
@@ -415,13 +428,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 	if (start >= end)
 		return false;
 
-	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
-		 start, end, newpp, step);
-
-	for (idx = start; idx < end; idx += step)
-		/* Not sure if we can do much with the return value */
-		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
-							mmu_kernel_ssize);
+	change_memory_range(start, end, step, newpp);
 
 	return true;
 }
-- 
2.25.1

