Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD83891CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 16:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlbLC6q22z3dc3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:46:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlbH35x3Pz3bvk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:44:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FlbGL1wbPz9sWc;
 Wed, 19 May 2021 16:43:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZXD86HLABre; Wed, 19 May 2021 16:43:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FlbGK34tXz9sWf;
 Wed, 19 May 2021 16:43:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CA458B7FC;
 Wed, 19 May 2021 16:43:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 84IlX600yT9j; Wed, 19 May 2021 16:43:37 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E391B8B7E0;
 Wed, 19 May 2021 16:43:36 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BED6064C3A; Wed, 19 May 2021 14:43:36 +0000 (UTC)
Message-Id: <f395c2e790564d351a9829e84bc9c31fab75378c.1621435024.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621435024.git.christophe.leroy@csgroup.eu>
References: <cover.1621435024.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 09/12] powerpc/inst: Refactor PPC32 and PPC64 versions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Wed, 19 May 2021 14:43:36 +0000 (UTC)
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

ppc_inst() ppc_inst_prefixed() ppc_inst_swab() can easily
be made common to both PPC32 and PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 49 +++++++++------------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 9f3513621766..3d4286809cfd 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -61,9 +61,9 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 	return get_op(ppc_inst_val(x));
 }
 
-#ifdef CONFIG_PPC64
 #define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
 
+#ifdef CONFIG_PPC64
 #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
 
 static inline u32 ppc_inst_suffix(struct ppc_inst x)
@@ -71,57 +71,34 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
 	return x.suffix;
 }
 
-static inline bool ppc_inst_prefixed(struct ppc_inst x)
-{
-	return ppc_inst_primary_opcode(x) == OP_PREFIX;
-}
+#else
+#define ppc_inst_prefix(x, y) ppc_inst(x)
 
-static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
+static inline u32 ppc_inst_suffix(struct ppc_inst x)
 {
-	return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
+	return 0;
 }
 
+#endif /* CONFIG_PPC64 */
+
 static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
 {
-	u32 val, suffix;
-
-	val = *ptr;
-	if (get_op(val) == OP_PREFIX) {
-		suffix = *(ptr + 1);
-		return ppc_inst_prefix(val, suffix);
-	} else {
-		return ppc_inst(val);
-	}
+	if (IS_ENABLED(CONFIG_PPC64) && get_op(*ptr) == OP_PREFIX)
+		return ppc_inst_prefix(*ptr, *(ptr + 1));
+	else
+		return ppc_inst(*ptr);
 }
 
-#else
-
-#define ppc_inst(x) ((struct ppc_inst){ .val = x })
-
-#define ppc_inst_prefix(x, y) ppc_inst(x)
-
 static inline bool ppc_inst_prefixed(struct ppc_inst x)
 {
-	return false;
-}
-
-static inline u32 ppc_inst_suffix(struct ppc_inst x)
-{
-	return 0;
+	return IS_ENABLED(CONFIG_PPC64) && ppc_inst_primary_opcode(x) == OP_PREFIX;
 }
 
 static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 {
-	return ppc_inst(swab32(ppc_inst_val(x)));
-}
-
-static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
-{
-	return ppc_inst(*ptr);
+	return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
 }
 
-#endif /* CONFIG_PPC64 */
-
 static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 {
 	if (ppc_inst_val(x) != ppc_inst_val(y))
-- 
2.25.0

