Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 786613891C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 16:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlbJC1hpXz3cGV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:45:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlbGf5PnNz30DG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:43:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FlbGD1vfGz9sWY;
 Wed, 19 May 2021 16:43:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU-yWx7ZBIuV; Wed, 19 May 2021 16:43:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FlbGD10blz9sWQ;
 Wed, 19 May 2021 16:43:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F02BC8B7F5;
 Wed, 19 May 2021 16:43:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6Ysovq5ve9o7; Wed, 19 May 2021 16:43:31 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4EC58B7E0;
 Wed, 19 May 2021 16:43:31 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8B78364C3A; Wed, 19 May 2021 14:43:31 +0000 (UTC)
Message-Id: <11041e7529ab4268f961e83ccf92040a0da961bf.1621435024.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621435024.git.christophe.leroy@csgroup.eu>
References: <cover.1621435024.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 04/12] powerpc/inst: Avoid pointer dereferencing in
 ppc_inst_equal()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Wed, 19 May 2021 14:43:31 +0000 (UTC)
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
index 17f74429d5d6..b49f11c69ed5 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -62,7 +62,7 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 }
 
 #ifdef CONFIG_PPC64
-#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
+#define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
 
 #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
 
@@ -73,7 +73,7 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
 
 static inline bool ppc_inst_prefixed(struct ppc_inst x)
 {
-	return ppc_inst_primary_opcode(x) == OP_PREFIX && ppc_inst_suffix(x) != 0xff;
+	return ppc_inst_primary_opcode(x) == OP_PREFIX;
 }
 
 static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
@@ -94,11 +94,6 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
 	}
 }
 
-static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
-{
-	return *(u64 *)&x == *(u64 *)&y;
-}
-
 #else
 
 #define ppc_inst(x) ((struct ppc_inst){ .val = x })
@@ -125,13 +120,17 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
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

