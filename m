Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF57399CE9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfZ20gwwz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:43:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfXF0sqtz3bpH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:42:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWn41qwzBC5V;
 Thu,  3 Jun 2021 10:41:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StS8y4DhYIag; Thu,  3 Jun 2021 10:41:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWn38j4zBC5Z;
 Thu,  3 Jun 2021 10:41:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 59A6A8B848;
 Thu,  3 Jun 2021 10:41:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3aiEZgVuAnGW; Thu,  3 Jun 2021 10:41:41 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F20738B767;
 Thu,  3 Jun 2021 10:41:40 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CBE4264BD2; Thu,  3 Jun 2021 08:41:40 +0000 (UTC)
Message-Id: <ddc1cfd2ec8f3b2395c6a4d7f2b0c1aa1b1e64fb.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 05/12] powerpc/32s: Simplify calculation of segment
 register content
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:40 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

segment register has VSID on bits 8-31.
Bits 4-7 are reserved, there is no requirement to set them to 0.

VSIDs are calculated from VSID of SR0 by adding 0x111.

Even with highest possible VSID which would be 0xFFFFF0,
adding 16 times 0x111 results in 0x1001100.

So, the reserved bits are never overflowed, no need to clear
the reserved bits after each calculation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index 583388399b1b..f5be185cbdf8 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -115,28 +115,32 @@ extern s32 patch__flush_hash_B;
 #include <asm/reg.h>
 #include <asm/task_size_32.h>
 
-#define UPDATE_TWO_USER_SEGMENTS(n) do {		\
-	if (TASK_SIZE > ((n) << 28))			\
-		mtsr(val1, (n) << 28);			\
-	if (TASK_SIZE > (((n) + 1) << 28))		\
-		mtsr(val2, ((n) + 1) << 28);		\
-	val1 = (val1 + 0x222) & 0xf0ffffff;		\
-	val2 = (val2 + 0x222) & 0xf0ffffff;		\
-} while (0)
+static __always_inline void update_user_segment(u32 n, u32 val)
+{
+	if (n << 28 < TASK_SIZE)
+		mtsr(val + n * 0x111, n << 28);
+}
 
 static __always_inline void update_user_segments(u32 val)
 {
-	int val1 = val;
-	int val2 = (val + 0x111) & 0xf0ffffff;
-
-	UPDATE_TWO_USER_SEGMENTS(0);
-	UPDATE_TWO_USER_SEGMENTS(2);
-	UPDATE_TWO_USER_SEGMENTS(4);
-	UPDATE_TWO_USER_SEGMENTS(6);
-	UPDATE_TWO_USER_SEGMENTS(8);
-	UPDATE_TWO_USER_SEGMENTS(10);
-	UPDATE_TWO_USER_SEGMENTS(12);
-	UPDATE_TWO_USER_SEGMENTS(14);
+	val &= 0xf0ffffff;
+
+	update_user_segment(0, val);
+	update_user_segment(1, val);
+	update_user_segment(2, val);
+	update_user_segment(3, val);
+	update_user_segment(4, val);
+	update_user_segment(5, val);
+	update_user_segment(6, val);
+	update_user_segment(7, val);
+	update_user_segment(8, val);
+	update_user_segment(9, val);
+	update_user_segment(10, val);
+	update_user_segment(11, val);
+	update_user_segment(12, val);
+	update_user_segment(13, val);
+	update_user_segment(14, val);
+	update_user_segment(15, val);
 }
 
 #endif /* !__ASSEMBLY__ */
-- 
2.25.0

