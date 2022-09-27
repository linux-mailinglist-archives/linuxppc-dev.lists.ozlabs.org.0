Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D06335EC690
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMdt6lTGz3fd7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMZW6JMkz3cd9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:34:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4McMYr1NdQz9snq;
	Tue, 27 Sep 2022 16:33:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYpUuItRBcdF; Tue, 27 Sep 2022 16:33:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4McMYm32xSz9sp6;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 597E88B778;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SQD780WVuyXg; Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.35])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECE1E8B779;
	Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28REXSAi351180
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 16:33:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28REXS9k351179;
	Tue, 27 Sep 2022 16:33:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 4/6] powerpc/feature-fixups: Refactor other fixups patching
Date: Tue, 27 Sep 2022 16:33:09 +0200
Message-Id: <8014782ac10e9e2007a1bc39d07aeec246785042.1664289176.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
References: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664289185; l=5833; s=20211009; h=from:subject:message-id; bh=q8IEEq6ctYzy5w+FwCIl4gPzTI2R2UyVya6b6wF1ots=; b=4qmLLfln3Y0KBls/kNne+2ZSQqVKtwRqVeYZwodOqSg4/3iWY/SrrIyJ0vrJjB00awuP1Jzj2uwV uGuWL/17AzXtBW7nPOs/McWY2+IxXvFn1nFXvHHfII4TTlynKdgi
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

Introduce function do_patch_fixups() to refactor those loops.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/feature-fixups.c | 77 +++++++++++--------------------
 1 file changed, 28 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 6767a6c3106f..a03ed9931224 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -117,6 +117,24 @@ void do_feature_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 	}
 }
 
+#ifdef CONFIG_PPC_BARRIER_NOSPEC
+static int do_patch_fixups(long *start, long *end, unsigned int *instrs, int num)
+{
+	int i;
+
+	for (i = 0; start < end; start++, i++) {
+		int j;
+		unsigned int *dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		for (j = 0; j < num; j++)
+			patch_instruction(dest + j, ppc_inst(instrs[j]));
+	}
+	return i;
+}
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 static int do_patch_entry_fixups(long *start, long *end, unsigned int *instrs,
 				 bool do_fallback, void *fallback)
@@ -181,7 +199,7 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 
 static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 {
-	unsigned int instrs[6], *dest;
+	unsigned int instrs[6];
 	long *start, *end;
 	int i;
 
@@ -215,18 +233,8 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 		instrs[i++] = PPC_RAW_EIEIO() | 0x02000000; /* eieio + bit 6 hint */
 	}
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
+	i = do_patch_fixups(start, end, instrs, ARRAY_SIZE(instrs));
 
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		patch_instruction(dest, ppc_inst(instrs[0]));
-		patch_instruction(dest + 1, ppc_inst(instrs[1]));
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
-		patch_instruction(dest + 3, ppc_inst(instrs[3]));
-		patch_instruction(dest + 4, ppc_inst(instrs[4]));
-		patch_instruction(dest + 5, ppc_inst(instrs[5]));
-	}
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
 		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
@@ -283,7 +291,7 @@ void do_stf_barrier_fixups(enum stf_barrier_type types)
 
 void do_uaccess_flush_fixups(enum l1d_flush_type types)
 {
-	unsigned int instrs[4], *dest;
+	unsigned int instrs[4];
 	long *start, *end;
 	int i;
 
@@ -309,17 +317,7 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = PPC_RAW_MTSPR(SPRN_TRIG2, _R0);
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		patch_instruction(dest, ppc_inst(instrs[0]));
-
-		patch_instruction(dest + 1, ppc_inst(instrs[1]));
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
-		patch_instruction(dest + 3, ppc_inst(instrs[3]));
-	}
+	i = do_patch_fixups(start, end, instrs, ARRAY_SIZE(instrs));
 
 	printk(KERN_DEBUG "uaccess-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
@@ -418,7 +416,7 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 static int __do_rfi_flush_fixups(void *data)
 {
 	enum l1d_flush_type types = *(enum l1d_flush_type *)data;
-	unsigned int instrs[3], *dest;
+	unsigned int instrs[3];
 	long *start, *end;
 	int i;
 
@@ -442,15 +440,7 @@ static int __do_rfi_flush_fixups(void *data)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = PPC_RAW_MTSPR(SPRN_TRIG2, _R0);
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-
-		patch_instruction(dest, ppc_inst(instrs[0]));
-		patch_instruction(dest + 1, ppc_inst(instrs[1]));
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
-	}
+	i = do_patch_fixups(start, end, instrs, ARRAY_SIZE(instrs));
 
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
@@ -492,7 +482,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
 {
-	unsigned int instr, *dest;
+	unsigned int instr;
 	long *start, *end;
 	int i;
 
@@ -506,12 +496,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		instr = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 	}
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, ppc_inst(instr));
-	}
+	i = do_patch_fixups(start, end, &instr, 1);
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
@@ -533,7 +518,7 @@ void do_barrier_nospec_fixups(bool enable)
 #ifdef CONFIG_PPC_FSL_BOOK3E
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
 {
-	unsigned int instr[2], *dest;
+	unsigned int instr[2];
 	long *start, *end;
 	int i;
 
@@ -549,13 +534,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		instr[1] = PPC_RAW_SYNC();
 	}
 
-	for (i = 0; start < end; start++, i++) {
-		dest = (void *)start + *start;
-
-		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, ppc_inst(instr[0]));
-		patch_instruction(dest + 1, ppc_inst(instr[1]));
-	}
+	i = do_patch_fixups(start, end, instr, ARRAY_SIZE(instr));
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
-- 
2.37.1

