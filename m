Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E959319F1A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:35:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkPN0MKhzDr7d
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:35:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DuynBZgW; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjsG1tHzzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:42 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id h11so5609702plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DXNzMPwci7EEbWi/8fBpV7ohyH0qtN8BELbJzoFTGT0=;
 b=DuynBZgWJShCWuEyZII03J1rmXKoFpdZEOvCbMYk/o88Fb4Lo4+JWeUwBMk8wy3Xbm
 oreiCJ5DvW0EQaWMjY2YdF6eOozvoaPh+yMLB3OrAbVqjT0/YnePqh48t1nmXEp5pu4S
 CbTiM0YlLFeaWIR31tnZt0+G2hMtJ5x3RyM1j/psarwllZrZ+z/gl18qj74z/yElmSJk
 6VWu64PUVrw/Is70zVZBbzdT3gi1ODX1lZ1HLcTBzrpo0PCO+hC8ZXJm2y+PG5S8+n77
 uV8mqwfQddr6wXCq1U6EybHvmNRZbFWvttV0uG0F5uwicW5acVYOiuJ4nYmb+ItkHzVR
 KGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DXNzMPwci7EEbWi/8fBpV7ohyH0qtN8BELbJzoFTGT0=;
 b=J8UHEHsAafQ9VYFWQ168JnM8FefasRVkS9PFo/UbjS5G0V+I5yyTcnwF7Zm2a5ErdY
 ulF/AJeoGPgw4nbUbHI7PtQAfUlUs8VVdQask1BaWfXtR94xhrmhiZv9rwqujVk1JOxu
 VFxwrXIYGBAvoD8wv/5bXekvS1jRRUHqZAsndfy0uJdTzxMIdd63NjjrJtkpH7o9yWfZ
 QQvnvIxMlZCkZNLTIiQFF3y/be6TvFqI2H43tk13BgRtRDtyGKDo5JUyl8Zh3OjWTD8G
 LPtl7uo+Q7h2TKhEMalS02cLABqq5zIOp3xxEkdVb7PQZyvKJJrxSe8V/ZAoUD7xq2+p
 FgLQ==
X-Gm-Message-State: AGi0PuZTa4EUN6jvPjHR4gqL3VeZyEqOwjAbRNebussk3dKL0QAFnqKy
 pA4lI7z3X6YIXU2G2WrylsTYUfKeTDI=
X-Google-Smtp-Source: APiQypLfl7HHCXtp157jhlgQt39MLVMV6WvXLPbm6JXnsoKdAHOtdUTJZkvkRcQU+QcY76MTgbpt1w==
X-Received: by 2002:a17:902:868d:: with SMTP id
 g13mr18736961plo.317.1586160638749; 
 Mon, 06 Apr 2020 01:10:38 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:38 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 12/21] powerpc: Introduce a function for reporting
 instruction length
Date: Mon,  6 Apr 2020 18:09:27 +1000
Message-Id: <20200406080936.7180-13-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently all instructions have the same length, but in preparation for
prefixed instructions introduce a function for returning instruction
length.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/inst.h | 5 +++++
 arch/powerpc/kernel/kprobes.c   | 6 ++++--
 arch/powerpc/kernel/uprobes.c   | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 369b35ce964c..70b37a35a91a 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
 	return x.val;
 }
 
+static inline bool ppc_inst_len(struct ppc_inst x)
+{
+	return sizeof(struct ppc_inst);
+}
+
 static inline int ppc_inst_opcode(struct ppc_inst x)
 {
 	return x.val >> 26;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index ff53e5ef7e40..8d17cfdcdc54 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -474,14 +474,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
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
@@ -490,7 +492,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + 4;
+	regs->nip = (unsigned long)cur->addr + len;
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 31c870287f2b..8e63afa012ba 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + ppc_inst_len(auprobe->insn);
 
 	user_disable_single_step(current);
 	return 0;
-- 
2.17.1

