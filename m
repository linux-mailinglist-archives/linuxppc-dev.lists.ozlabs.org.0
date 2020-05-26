Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086C1E1C47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 09:27:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WQXM3Pj0zDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 17:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WQVn6p6WzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 17:26:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Y9V4bQPt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49WQVn5dTyz9sRK; Tue, 26 May 2020 17:26:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49WQVn4nP1z9sSk; Tue, 26 May 2020 17:26:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590477969;
 bh=q5kOVoNq8xGlbbgq6E6BRFvnGz9m0w6ZRgc7nlsSO7c=;
 h=From:To:Cc:Subject:Date:From;
 b=Y9V4bQPtbkk+g/mSbtF8DaIG9ILA+DkZRzXJpHNsY7T21nZSbLhan5kLGCyaaGft0
 sn2yu1FBxTNlm/qpurLpGXMlvs4rOhCivNnSsJXh2jzrZft9y8myYMs17Ze90wsmjT
 l7+L2yoN4Z2G/g+9t9hNFvKRtB7b1TFLdtWxBlsPnkR/rzxZSnYLvVoeNBDmhRnx60
 Fei+6AhmuSNqSeuYOulS7m+T8zS1TXYFl1qzrUvOoKOmMNvqA6N4xcRv1JakBTRWTB
 oGIrQYBOLD/6N+PZCGvbm4YrFrUwj8jPyMo9fobrQCFOWpubw8YOcVh7D6WTIh8H6H
 2yIE+8UNhCqgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc: Add ppc_inst_as_u64()
Date: Tue, 26 May 2020 17:26:30 +1000
Message-Id: <20200526072630.2487363-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code patching code wants to get the value of a struct ppc_inst as
a u64 when the instruction is prefixed, so we can pass the u64 down to
__put_user_asm() and write it with a single store.

The optprobes code wants to load a struct ppc_inst as an immediate
into a register so it is useful to have it as a u64 to use the
existing helper function.

Currently this is a bit awkward because the value differs based on the
CPU endianness, so add a helper to do the conversion.

This fixes the usage in arch_prepare_optimized_kprobe() which was
previously incorrect on big endian.

Fixes: 650b55b707fd ("powerpc: Add prefixed instructions to instruction data type")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Jordan Niethe <jniethe5@gmail.com>
Link: https://lore.kernel.org/r/20200525055004.2182328-1-mpe@ellerman.id.au
---
 arch/powerpc/include/asm/inst.h  | 9 +++++++++
 arch/powerpc/kernel/optprobes.c  | 3 +--
 arch/powerpc/lib/code-patching.c | 8 +-------
 3 files changed, 11 insertions(+), 9 deletions(-)

v2: Update the commit message as noted by Jordan.
    Add a Fixes tag.

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 5b756ba77ed2..45f3ec868258 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -113,6 +113,15 @@ static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst *va
 	return location + ppc_inst_len(tmp);
 }
 
+static inline u64 ppc_inst_as_u64(struct ppc_inst x)
+{
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+	return (u64)ppc_inst_suffix(x) << 32 | ppc_inst_val(x);
+#else
+	return (u64)ppc_inst_val(x) << 32 | ppc_inst_suffix(x);
+#endif
+}
+
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst __user *nip);
 
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 3ac105e7faae..69bfe96884e2 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -283,8 +283,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
 	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-	patch_imm64_load_insns(ppc_inst_val(temp) | ((u64)ppc_inst_suffix(temp) << 32),
-			       4, buff + TMPL_INSN_IDX);
+	patch_imm64_load_insns(ppc_inst_as_u64(temp), 4, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 64cf621e5b00..5ecf0d635a8d 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -27,13 +27,7 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
 	if (!ppc_inst_prefixed(instr)) {
 		__put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
 	} else {
-#ifdef CONFIG_CPU_LITTLE_ENDIAN
-		__put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
-			       ppc_inst_val(instr), patch_addr, err, "std");
-#else
-		__put_user_asm((u64)ppc_inst_val(instr) << 32 |
-			       ppc_inst_suffix(instr), patch_addr, err, "std");
-#endif
+		__put_user_asm(ppc_inst_as_u64(instr), patch_addr, err, "std");
 	}
 
 	if (err)
-- 
2.25.1

