Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC638B083
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB4d08q4z3cDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB344drRz3btL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:50:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB2t15v4z9sTf;
 Thu, 20 May 2021 15:50:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21_5S86CRXlc; Thu, 20 May 2021 15:50:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2n5yy8z9sTW;
 Thu, 20 May 2021 15:50:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C4B88B814;
 Thu, 20 May 2021 15:50:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j0dMyGrBYeQj; Thu, 20 May 2021 15:50:41 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 693A98B808;
 Thu, 20 May 2021 15:50:41 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 332F764C40; Thu, 20 May 2021 13:50:41 +0000 (UTC)
Message-Id: <d8b155e930b7a9708ca110e8ff0ace6713a7af75.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 04/12] powerpc/inst: Avoid pointer dereferencing in
 ppc_inst_equal()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:41 +0000 (UTC)
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

Avoid casting/dereferencing ppc_inst() as u64* , check each member
of the struct when relevant.

And remove the 0xff initialisation of the suffix for non
prefixed instruction. An instruction with 0xff as a suffix
might be invalid, but still is a prefixed instruction and
has to be considered as this.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index fc6adef528a5..5a0740ebf132 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -61,7 +61,7 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 }
 
 #ifdef CONFIG_PPC64
-#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
+#define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
 
 #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
 
@@ -72,7 +72,7 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
 
 static inline bool ppc_inst_prefixed(struct ppc_inst x)
 {
-	return ppc_inst_primary_opcode(x) == OP_PREFIX && ppc_inst_suffix(x) != 0xff;
+	return ppc_inst_primary_opcode(x) == OP_PREFIX;
 }
 
 static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
@@ -93,11 +93,6 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
 	}
 }
 
-static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
-{
-	return *(u64 *)&x == *(u64 *)&y;
-}
-
 #else
 
 #define ppc_inst(x) ((struct ppc_inst){ .val = x })
@@ -124,13 +119,17 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
 	return *ptr;
 }
 
+#endif /* CONFIG_PPC64 */
+
 static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 {
-	return ppc_inst_val(x) == ppc_inst_val(y);
+	if (ppc_inst_val(x) != ppc_inst_val(y))
+		return false;
+	if (!ppc_inst_prefixed(x))
+		return true;
+	return ppc_inst_suffix(x) == ppc_inst_suffix(y);
 }
 
-#endif /* CONFIG_PPC64 */
-
 static inline int ppc_inst_len(struct ppc_inst x)
 {
 	return ppc_inst_prefixed(x) ? 8 : 4;
-- 
2.25.0

