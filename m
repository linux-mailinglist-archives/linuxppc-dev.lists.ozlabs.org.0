Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D21C66A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:15:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3D36pWNzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g7JGGLX7; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Zm2FZJzDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:46:40 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id t40so211007pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I/EjlzqKE6L1apFEiOrYINaFoHMHcKirQ2VoPWGY1PA=;
 b=g7JGGLX7r2PAjPQYtiHQtIJ1fc0UiFqmGVM0sRrp7ZSLNJWjry5ktmu1NazYtarRvn
 /xXms3Prth/fJiD5nuwlQtoE6lHbdClrkCUbwzhhcIZfa0QtLgjNU9h9gqakNgK3DTnC
 o87CRCesChfPe4Eoks75H/M39yWCQFD2Qy2c8/msSWPP5xn3ANlANXyWQgLe1h4PwmGV
 IMgs0ajoZFdiuaALYETxdFokDoxHnvwde2sCLybPSo3f/LzLsg0ZQ3oURBnT7/6DBOEL
 xM1nH/gvbuL7HV/MgbdmjXSiD80LVIXWksM0q3+7Q7b/dZWO/0/qpDOjelkE3uKQy2i/
 u9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I/EjlzqKE6L1apFEiOrYINaFoHMHcKirQ2VoPWGY1PA=;
 b=dZup4AzSGYv2JDD8pCMeUDtaPRbk0lCATm5HDrOpudEAAUhwEs3+HyQifmXTxQix+p
 miaW6a/S9UTtVAPfMPlXe97pOD8X9mJ2hHeQ0/6faGFQ/l6R88u+DxvtaLg7wsNb6Skn
 aF+nVRoevLf03Nse9NjOJJr2AnMQ0hVTtlWMjL0pSPPvKCgeGmknKUTg5+LOvjv4trCV
 LwIO5b06+4hsUD87jFdjIt/Jb/Y7kI2mBNServgl22VdjikXI268OyCE14Q1fnvAw8Ed
 Zsxam24kP2AEN/0e+CQ1rmGlF8Q7hkJh0DbnRxo0X5c/U0xc1h0JZQCrvSfee/VYZAoX
 X8CQ==
X-Gm-Message-State: AGi0PubGt1Q52+cthdBordsnhzpUqNtnOSRMVEWDuYjtBvDkzF0Dz7mB
 uBsNDl/wfr3b2OCRMf/T2fispqJuwv7ogg==
X-Google-Smtp-Source: APiQypLwKXyjHU81wbkVvaObsmIv9Vh+J6IWTX7fwKBpIP4CflR2NWHATWt38+CNx1beyh4e2ZP4SQ==
X-Received: by 2002:a17:90a:328f:: with SMTP id
 l15mr7313108pjb.77.1588736797853; 
 Tue, 05 May 2020 20:46:37 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:46:37 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 17/30] powerpc: Introduce a function for reporting
 instruction length
Date: Wed,  6 May 2020 13:40:37 +1000
Message-Id: <20200506034050.24806-18-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently all instructions have the same length, but in preparation for
prefixed instructions introduce a function for returning instruction
length.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - feature-fixups.c: do_final_fixups(): use here
    - ppc_inst_len(): change return type from bool to int
    - uprobes: Use ppc_inst_read() before calling ppc_inst_len()
---
 arch/powerpc/include/asm/inst.h   |  5 +++++
 arch/powerpc/kernel/kprobes.c     |  6 ++++--
 arch/powerpc/kernel/uprobes.c     |  2 +-
 arch/powerpc/lib/feature-fixups.c | 14 +++++++-------
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 0d581b332c20..2f3c9d5bcf7c 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
 	return x.val;
 }
 
+static inline int ppc_inst_len(struct ppc_inst x)
+{
+	return sizeof(struct ppc_inst);
+}
+
 static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 {
 	return ppc_inst_val(x) >> 26;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index a72c8e1a42ad..33d54b091c70 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -462,14 +462,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
  */
 int kprobe_post_handler(struct pt_regs *regs)
 {
+	int len;
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
 
 	if (!cur || user_mode(regs))
 		return 0;
 
+	len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
 	/* make sure we got here for instruction we have a kprobe on */
-	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
+	if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
 		return 0;
 
 	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
@@ -478,7 +480,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + 4;
+	regs->nip = (unsigned long)cur->addr + len;
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 6893d40a48c5..83e883e1a42d 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
 
 	user_disable_single_step(current);
 	return 0;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index c0d3ed4efb7e..2bd2b752de4f 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -392,20 +392,20 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 static void do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
-	struct ppc_inst *src, *dest;
-	unsigned long length;
+	struct ppc_inst inst, *src, *dest, *end;
 
 	if (PHYSICAL_START == 0)
 		return;
 
 	src = (struct ppc_inst *)(KERNELBASE + PHYSICAL_START);
 	dest = (struct ppc_inst *)KERNELBASE;
-	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
+	end = (void *)src + (__end_interrupts - _stext);
 
-	while (length--) {
-		raw_patch_instruction(dest, ppc_inst_read(src));
-		src++;
-		dest++;
+	while (src < end) {
+		inst = ppc_inst_read(src);
+		raw_patch_instruction(dest, inst);
+		src = (void *)src + ppc_inst_len(inst);
+		dest = (void *)dest + ppc_inst_len(inst);
 	}
 #endif
 }
-- 
2.17.1

