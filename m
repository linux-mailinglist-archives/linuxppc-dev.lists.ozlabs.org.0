Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D09640238
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 09:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNmSf6Qrfz3fJB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 19:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNmQT6YY1z3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 19:32:17 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NNmQH6M39z9sYf;
	Fri,  2 Dec 2022 09:32:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVgNSwg7kOmR; Fri,  2 Dec 2022 09:32:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NNmQF3QQxz9sYh;
	Fri,  2 Dec 2022 09:32:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6602B8B788;
	Fri,  2 Dec 2022 09:32:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tZ6QrS-w4Q90; Fri,  2 Dec 2022 09:32:05 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.19])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 09C9C8B783;
	Fri,  2 Dec 2022 09:32:04 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2B28VpmX273723
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 2 Dec 2022 09:31:51 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2B28VpIn273720;
	Fri, 2 Dec 2022 09:31:51 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        bgray@linux.ibm.com
Subject: [PATCH v2 2/5] powerpc/feature-fixups: Refactor entry fixups patching
Date: Fri,  2 Dec 2022 09:31:40 +0100
Message-Id: <79eeff7b20a98f7136da5f79b1f7c436928f27f3.1669969781.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <f67d2a109404d03e8fdf1ea15388c8778337a76b.1669969781.git.christophe.leroy@csgroup.eu>
References: <f67d2a109404d03e8fdf1ea15388c8778337a76b.1669969781.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669969790; l=4747; s=20211009; h=from:subject:message-id; bh=CJpnjR+AEapVMyNEd2CpZQP0Io0al/gOy2y0/ILAL7Y=; b=wk32eRXonD5FN+zOFbUo1yGQW7mPw+C8DmWe1ld8jh8VOHTY+RwqQv8lrib+moLwGIShXcdW4A3b zz3EFKYNBADIdqV9n6y6BVI+Vx7wOMmsqUDgOlZHxMkdwrqdTh3f
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several fonctions have the same loop for patching instructions.

Introduce function do_patch_entry_fixups() to refactor those loops.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/feature-fixups.c | 84 ++++++++++++-------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 31f40f544de5..93b3f8ea38aa 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -118,9 +118,33 @@ void do_feature_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
+static int do_patch_entry_fixups(long *start, long *end, unsigned int *instrs,
+				 bool do_fallback, void *fallback)
+{
+	int i;
+
+	for (i = 0; start < end; start++, i++) {
+		unsigned int *dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		// See comment in do_entry_flush_fixups() RE order of patching
+		if (do_fallback) {
+			patch_instruction(dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_branch(dest + 1, (unsigned long)fallback, BRANCH_SET_LINK);
+		} else {
+			patch_instruction(dest + 1, ppc_inst(instrs[1]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_instruction(dest, ppc_inst(instrs[0]));
+		}
+	}
+	return i;
+}
+
 static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 {
-	unsigned int instrs[3], *dest;
+	unsigned int instrs[3];
 	long *start, *end;
 	int i;
 
@@ -144,23 +168,8 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 	}
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		// See comment in do_entry_flush_fixups() RE order of patching
-		if (types & STF_BARRIER_FALLBACK) {
-			patch_instruction(dest, ppc_inst(instrs[0]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_branch(dest + 1,
-				     (unsigned long)&stf_barrier_fallback, BRANCH_SET_LINK);
-		} else {
-			patch_instruction(dest + 1, ppc_inst(instrs[1]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_instruction(dest, ppc_inst(instrs[0]));
-		}
-	}
+	i = do_patch_entry_fixups(start, end, instrs, types & STF_BARRIER_FALLBACK,
+				  &stf_barrier_fallback);
 
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
@@ -325,7 +334,7 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 static int __do_entry_flush_fixups(void *data)
 {
 	enum l1d_flush_type types = *(enum l1d_flush_type *)data;
-	unsigned int instrs[3], *dest;
+	unsigned int instrs[3];
 	long *start, *end;
 	int i;
 
@@ -375,42 +384,13 @@ static int __do_entry_flush_fixups(void *data)
 
 	start = PTRRELOC(&__start___entry_flush_fixup);
 	end = PTRRELOC(&__stop___entry_flush_fixup);
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		if (types == L1D_FLUSH_FALLBACK) {
-			patch_instruction(dest, ppc_inst(instrs[0]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_branch(dest + 1,
-				     (unsigned long)&entry_flush_fallback, BRANCH_SET_LINK);
-		} else {
-			patch_instruction(dest + 1, ppc_inst(instrs[1]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_instruction(dest, ppc_inst(instrs[0]));
-		}
-	}
+	i = do_patch_entry_fixups(start, end, instrs, types == L1D_FLUSH_FALLBACK,
+				  &entry_flush_fallback);
 
 	start = PTRRELOC(&__start___scv_entry_flush_fixup);
 	end = PTRRELOC(&__stop___scv_entry_flush_fixup);
-	for (; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		if (types == L1D_FLUSH_FALLBACK) {
-			patch_instruction(dest, ppc_inst(instrs[0]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_branch(dest + 1,
-				     (unsigned long)&scv_entry_flush_fallback, BRANCH_SET_LINK);
-		} else {
-			patch_instruction(dest + 1, ppc_inst(instrs[1]));
-			patch_instruction(dest + 2, ppc_inst(instrs[2]));
-			patch_instruction(dest, ppc_inst(instrs[0]));
-		}
-	}
-
+	i += do_patch_entry_fixups(start, end, instrs, types == L1D_FLUSH_FALLBACK,
+				   &scv_entry_flush_fallback);
 
 	printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
-- 
2.38.1

