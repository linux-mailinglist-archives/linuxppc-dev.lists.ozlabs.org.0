Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571B461455
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:54:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2kK91NShz3ckY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kJN5WRtz3bc4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:53:24 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2kJD5nqkz9sSP;
 Mon, 29 Nov 2021 12:53:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1G2EHDhl_Ctp; Mon, 29 Nov 2021 12:53:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2kJC3xndz9sSc;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 706A18B776;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yjNuv0bKq_MX; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7078B763;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATBr7UQ895121
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 12:53:07 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATBr7qm895120;
 Mon, 29 Nov 2021 12:53:07 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 3/5] powerpc/inst: Define ppc_inst_t as u32 on PPC32
Date: Mon, 29 Nov 2021 12:53:03 +0100
Message-Id: <4cdbfb2a8cad727ea94be1ba45c185a99b4c2a83.1638186774.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
References: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638186784; l=2480; s=20211009;
 h=from:subject:message-id; bh=CeGP1uCMsgj54dqNTjeQuOLUnlIpjBJ4Krl2Tx40VRE=;
 b=Yw8S6dPywxnpJIEzYNcuhqfWsXZs2VIAy4XVzI48jPz6D9+Vce7f5noVCcQ/BuU3ncYvqf9BLDae
 3Zi3i9yEAb5iwhzzzUgAQ7KXXfnXutMShdqhFAFzfHRUAReneYCq
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

Unlike PPC64 ABI, PPC32 uses the stack to pass a parameter defined
as a struct, even when the struct has a single simple element.

To avoid that, define ppc_inst_t as u32 on PPC32.

Keep it as 'struct ppc_inst' when __CHECKER__ is defined so that
sparse can perform type checking.

Also revert commit 511eea5e2ccd ("powerpc/kprobes: Fix Oops by passing
ppc_inst as a pointer to emulate_step() on ppc32") as now the
instruction to be emulated is passed as a register to emulate_step().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make it work with kprobes
---
 arch/powerpc/include/asm/inst.h | 15 +++++++++++++--
 arch/powerpc/kernel/optprobes.c |  8 ++------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 055de1fa5d46..5c503816ebc0 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -34,6 +34,7 @@
  * Instruction data type for POWER
  */
 
+#if defined(CONFIG_PPC64) || defined(__CHECKER__)
 typedef struct {
 	u32 val;
 #ifdef CONFIG_PPC64
@@ -46,13 +47,23 @@ static inline u32 ppc_inst_val(ppc_inst_t x)
 	return x.val;
 }
 
+#define ppc_inst(x) ((ppc_inst_t){ .val = (x) })
+
+#else
+typedef u32 ppc_inst_t;
+
+static inline u32 ppc_inst_val(ppc_inst_t x)
+{
+	return x;
+}
+#define ppc_inst(x) (x)
+#endif
+
 static inline int ppc_inst_primary_opcode(ppc_inst_t x)
 {
 	return ppc_inst_val(x) >> 26;
 }
 
-#define ppc_inst(x) ((ppc_inst_t){ .val = (x) })
-
 #ifdef CONFIG_PPC64
 #define ppc_inst_prefix(x, y) ((ppc_inst_t){ .val = (x), .suffix = (y) })
 
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 378db980ded3..3b1c2236cbee 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -228,12 +228,8 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	if (IS_ENABLED(CONFIG_PPC64)) {
-		temp = ppc_inst_read(p->ainsn.insn);
-		patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
-	} else {
-		patch_imm_load_insns((unsigned long)p->ainsn.insn, 4, buff + TMPL_INSN_IDX);
-	}
+	temp = ppc_inst_read(p->ainsn.insn);
+	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
-- 
2.33.1

