Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD01C0D27
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:19:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzYJ697BzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:19:48 +1000 (AEST)
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
 header.s=20161025 header.b=bUEPmuQq; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CyrT6s61zDrL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:47:53 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a32so1859702pje.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GglahPuDIDNYvnqv+Ien9geCHOYyIVjEW6vAFBrV9jY=;
 b=bUEPmuQq8T1HOI0+RbTmWnwDqS4QV5ds2827hhYXSEXIA9jBMIT3gMXTXXdJk+QnmZ
 luLzcH/WWidvD1aB3eOAhj66s2vR9jQk4tq9k1OY6gaLRk9frH7wrQU4EH/B4JRA8GfD
 XsQD97Ag4YfdfkaedGU8ODtxfGKq6TC1SIiWVanjW0/8KN16orJwohwnqVoj3YZc0Uj3
 MOZZKIaNMZvall+CktaHkNNO3O1JjCbLhr63sPDGDhN6qE1dY/Ps4gIxNwWLodFgeiAa
 vwudxc+ODNmwgSSOqbhyVhYhfeW+Fgw5ptHZbyxgSMjfKT3EAcUWutPhSUO+ZUBdm2W7
 7p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GglahPuDIDNYvnqv+Ien9geCHOYyIVjEW6vAFBrV9jY=;
 b=ETHtkJRWMPUzJPSl0YGHU1SMIVtrMci/Mwx+1GzejppEUQA/l4p7H7mxbqaHHJuabq
 hhFawzF6Mkh5AwCiiswWZEt/NPlkJuWaNnpN3BRstUHZthWqv/m+rPjR3x25FbOxZEmN
 Z+jk5uECMrGKFEDn0dCwt16Lar07QgaRnXWCU8Gi6HetjJE4Bt0yKTZ1c6MNMA3nB6PA
 2P20uNXEy04R8xb98+vbM83ALlUivJxH4/dYSpeD7p5SBPJHvWGemHKO3Gztabuh6tZj
 6aymocJv3ULsMJp8ImSEsIy6iz5ok1DfTOpSILRnR3caTy/Z4gwSr3KhvFn3cOcR5EtA
 XoQw==
X-Gm-Message-State: AGi0PuZe524ZoD496rcru1pJMNLn5e4NTavGW+TFkKSBc/3nBlkztIcE
 nXz3GFVGE9KGdTHHKIAT49b4jy78tNS9xg==
X-Google-Smtp-Source: APiQypKyE4MPz/T6Q262rI/7Z0t6VnfwLWFQyOc7L/kO+O9/1Tok6iqjQPUGq5BRRURlzNeGwaf1tA==
X-Received: by 2002:a17:902:d203:: with SMTP id
 t3mr2425012ply.136.1588304871499; 
 Thu, 30 Apr 2020 20:47:51 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:47:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 17/28] powerpc: Introduce a function for reporting
 instruction length
Date: Fri,  1 May 2020 13:42:09 +1000
Message-Id: <20200501034220.8982-18-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
index 13ec3264a565..f4845e740338 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -390,20 +390,20 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
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

