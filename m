Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0735E436
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 18:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKWYp52NBz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 02:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKWYS2F7bz304D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 02:40:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKWYM4x19z9v4hH;
 Tue, 13 Apr 2021 18:40:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bCLaCQ1Kb3iD; Tue, 13 Apr 2021 18:40:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKWYM49gQz9v4h8;
 Tue, 13 Apr 2021 18:40:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3AFAB8B7AA;
 Tue, 13 Apr 2021 18:40:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oBY3L0VcztpY; Tue, 13 Apr 2021 18:40:09 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 071A98B75F;
 Tue, 13 Apr 2021 18:40:09 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C320D67A15; Tue, 13 Apr 2021 16:40:08 +0000 (UTC)
Message-Id: <13df05f03833b4ff9c413ce06b4a606043e0da72.1618331980.git.christophe.leroy@csgroup.eu>
In-Reply-To: <857ceb23b6a614aea2522e770b067593d5f9e906.1618331980.git.christophe.leroy@csgroup.eu>
References: <857ceb23b6a614aea2522e770b067593d5f9e906.1618331980.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/4] powerpc: Make probe_kernel_read_inst() common to PPC32
 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Tue, 13 Apr 2021 16:40:08 +0000 (UTC)
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

We have two independant versions of probe_kernel_read_inst(), one for
PPC32 and one for PPC64.

The PPC32 is identical to the first part of the PPC64 version.
The remaining part of PPC64 version is not relevant for PPC32, but
not contradictory, so we can easily have a common function with
the PPC64 part opted out via a IS_ENABLED(CONFIG_PPC64).

The only need is to add a version of ppc_inst_prefix() for PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h |  2 ++
 arch/powerpc/lib/inst.c         | 17 +----------------
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 2902d4e6a363..a40c3913a4a3 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -102,6 +102,8 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 
 #define ppc_inst(x) ((struct ppc_inst){ .val = x })
 
+#define ppc_inst_prefix(x, y) ppc_inst(x)
+
 static inline bool ppc_inst_prefixed(struct ppc_inst x)
 {
 	return false;
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index c57b3548de37..0dff3ac2d45f 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -8,7 +8,6 @@
 #include <asm/inst.h>
 #include <asm/ppc-opcode.h>
 
-#ifdef CONFIG_PPC64
 int probe_kernel_read_inst(struct ppc_inst *inst,
 			   struct ppc_inst *src)
 {
@@ -18,7 +17,7 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
 	err = copy_from_kernel_nofault(&val, src, sizeof(val));
 	if (err)
 		return err;
-	if (get_op(val) == OP_PREFIX) {
+	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
 		err = copy_from_kernel_nofault(&suffix, (void *)src + 4, 4);
 		*inst = ppc_inst_prefix(val, suffix);
 	} else {
@@ -26,17 +25,3 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
 	}
 	return err;
 }
-#else /* !CONFIG_PPC64 */
-int probe_kernel_read_inst(struct ppc_inst *inst,
-			   struct ppc_inst *src)
-{
-	unsigned int val;
-	int err;
-
-	err = copy_from_kernel_nofault(&val, src, sizeof(val));
-	if (!err)
-		*inst = ppc_inst(val);
-
-	return err;
-}
-#endif /* CONFIG_PPC64 */
-- 
2.25.0

