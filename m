Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434B51F3F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:40:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVQ52pgkz3fHr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:40:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVL74fhBz3cDT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:37:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKQ0ljwz9sTj;
 Mon,  9 May 2022 07:36:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQX5uZIXMjlY; Mon,  9 May 2022 07:36:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5lZdz9sVj;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF53D8B770;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iMMbcD48-7Aj; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DC918B77A;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVM41591279
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVeI1591278;
 Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 18/25] powerpc/ftrace: Simplify expected_nop_sequence()
Date: Mon,  9 May 2022 07:36:16 +0200
Message-Id: <305d22472f1f92127fba09692df6bb5d079a8cd0.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074582; l=1521; s=20211009;
 h=from:subject:message-id; bh=4BswpVslfmWCofUljaPxo8plPyhnTwi3LkFniY9lZ38=;
 b=ifRvh8SNQExUvpvzJCaMJ/av7HVnvA3GRiAwu93w7a92OhGYkGDDEAxPy9qJCsZW811LXP/TR9VE
 SauAAWqKCGDYLV9srrglNiA68jExZsDJVQk52GOwizdOK0BYavRn
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid ifdefs around expected_nop_sequence().

While at it make it a bool.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 346b5485e7ef..c34cb394f8a8 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -390,24 +390,14 @@ int ftrace_make_nop(struct module *mod,
  * They should effectively be a NOP, and follow formal constraints,
  * depending on the ABI. Return false if they don't.
  */
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-static int
-expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
-{
-	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
-	    !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))
-		return 0;
-	return 1;
-}
-#else
-static int
-expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
+static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
-		return 0;
-	return 1;
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) &&
+		       ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
+	else
+		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
 }
-#endif
 
 static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
-- 
2.35.1

