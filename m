Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F205EC694
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:37:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMfL0dMbz3fhj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMZc1xnTz3f2R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:34:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4McMYs130Mz9sp6;
	Tue, 27 Sep 2022 16:33:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlFbt5b2Qkph; Tue, 27 Sep 2022 16:33:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4McMYm3B2hz9sp9;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DF038B779;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 18QqowAJcPzi; Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.35])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF0C48B77B;
	Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28REXRE7351172
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 16:33:27 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28REXRR8351169;
	Tue, 27 Sep 2022 16:33:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 3/6] powerpc/feature-fixups: Refactor entry fixups patching
Date: Tue, 27 Sep 2022 16:33:07 +0200
Message-Id: <8a4f97928f302aaf327107e51826e380e77226c8.1664289176.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
References: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664289185; l=4747; s=20211009; h=from:subject:message-id; bh=vG27o998ObLSW9+dA62VNCyKj5WTMt8ILk8ZvjQJ9LE=; b=MN2SlDW0LILpywfR5f5ga+Z9OIx+JKBYRAKfKGWqvwaHOFi9cb/03QFJmBVqAM71lK6mRgkLcSJK tLkMa3iPCKNQ3HG5ITvPkwJigdKOkGZlJXN4ZSjSAo4KpSnQh3DW
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
index 993d3f31832a..6767a6c3106f 100644
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
2.37.1

