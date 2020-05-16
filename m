Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 191171D60A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 13:56:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PNzf2Dk9zDqLY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 21:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PNx82ZMTzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 21:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ce5wUvFh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49PNx66QFVz9sTC; Sat, 16 May 2020 21:54:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49PNx65ZW7z9sTT; Sat, 16 May 2020 21:54:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589630074;
 bh=vevET4Os73TIlcRpD64CUXMGI0ABajnpxU9jFjEHi5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ce5wUvFhD360UuqiLdEvEjUaYnld5xPwuqAvokpNL9UOmafNmtJBn/6Oi/hTuLOo5
 xL6g19g3yuEGveZI8DwNeVWhAxwoc2rPr/tZ8anvyxpLzqkn+Bd9huw+w70KDf4ioD
 LZ6/gKsWU3y9/HEqHnI5Wou9CVH13iQrDMUEK165hAB5pZaRv5kQnx4hGHYQ25Z8/V
 Ni8uzfsTl+OX8uL2n/3tTS7yw3FTrI5wr09icBxR/ZzNMceoK1dFRY2YRDtNOV0Qcz
 TE3WsM90/D3pXh3tzrXv19FYC94D8XUdNOVWhHJqp6R7VfWMKii+L9ACPwOSNKzoFf
 M9uKgkjbHjJqA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v8 22.5/30] powerpc/optprobes: Add register argument to
 patch_imm64_load_insns()
Date: Sat, 16 May 2020 21:54:49 +1000
Message-Id: <20200516115449.4168796-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506034050.24806-24-jniethe5@gmail.com>
References: <20200506034050.24806-24-jniethe5@gmail.com>
MIME-Version: 1.0
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

Currently patch_imm32_load_insns() is used to load an instruction to
r4 to be emulated by emulate_step(). For prefixed instructions we
would like to be able to load a 64bit immediate to r4. To prepare for
this make patch_imm64_load_insns() take an argument that decides which
register to load an immediate to - rather than hardcoding r3.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/optprobes.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

v8: Split out of patch 23.

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 52c1ab3f85aa..8eea8dbb93fa 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -162,38 +162,38 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 
 /*
  * Generate instructions to load provided immediate 64-bit value
- * to register 'r3' and patch these instructions at 'addr'.
+ * to register 'reg' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	/* lis r3,(op)@highest */
+	/* lis reg,(op)@highest */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
+			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
 				   ((val >> 48) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@higher */
+	/* ori reg,reg,(op)@higher */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-				   ___PPC_RS(3) | ((val >> 32) & 0xffff)));
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
 	addr++;
 
-	/* rldicr r3,r3,32,31 */
+	/* rldicr reg,reg,32,31 */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
-				   ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
+			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
-	/* oris r3,r3,(op)@h */
+	/* oris reg,reg,(op)@h */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
-				   ___PPC_RS(3) | ((val >> 16) & 0xffff)));
+			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@l */
+	/* ori reg,reg,(op)@l */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-				   ___PPC_RS(3) | (val & 0xffff)));
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
@@ -249,7 +249,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
-- 
2.25.1

