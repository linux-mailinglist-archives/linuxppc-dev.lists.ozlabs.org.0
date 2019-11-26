Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D301098FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:54:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MY4v2tmDzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:54:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaA15aob"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNk0rkYzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:23:01 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id m71so7688137pjb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7YWiEuagooo0tKSWswStiXInYIzuax8NfizCzsN2DXo=;
 b=HaA15aobgNVTYoPqkKSWTZ6lLR2im7FsOB+gLhsPvONl6XAYiK1CHF0l3fKpv7DfyD
 gifL+NJnEyWA/QZ+zDQQrBr66bb4aCRLIL02jvYIp3NvvW9bx0IfAD7Y9YW6rf2EES8S
 NzEDSLkPqdFy3Jcppqezv4LXTT2/BqwfCRRXiKekGx2CSREzlGVDFU9RQANAPL4mQGbk
 TBI8H+h9QfYJ0aXzbYXQOq4UTPjwQ4nTzPfV4llvf0RElmuDBqksBR370l+ooe+T7oGE
 56SFtbLvaLfbpGreAz7KdfmLWgtbLRQOD8JY5g6ruNqf6WUGdsGW1QKzld5UcZgXFrWI
 NFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7YWiEuagooo0tKSWswStiXInYIzuax8NfizCzsN2DXo=;
 b=LgVKbPwLvIhzaHmCHKTMhK50Vwx7enV36MxUAl392C55GVfzFhyN9Ci20Lc+rXtfvk
 aKidJZi8Hn6LVVdGumXc/L/sWIVcdhYNko+bK+vZfOARK66m54khJidyqSpszWYxu7GC
 TUQOT2hl+wTYWTBY7S2a0+yK7mZm4ptw8McIQrCCoLI7ncjYbSeIONnk4H3JQr5T93do
 l+QUz0rVn0j/4+WRY2UIhBlPDEkXm6c8JgTwpRzWQdZ2tdKsi0Den4MLmV/WnsE/6AqD
 Zd9t4VwrSFMZZX7gEUP0WoED1Vwthk1gy2HYBf/KGTY83iklGD57JVrqt/GRpR4XV7uR
 zMWg==
X-Gm-Message-State: APjAAAUvMWkzOlCRjDcm+V8RCzUcOHFKAuj989rGerQGeNbLdoo+NH0V
 XUgM8gaSR0SUZ7F78jqYd71Hv0Lr
X-Google-Smtp-Source: APXvYqxgGdGKn0EmFevgNBGenXXhJshdXBh1BvkNJ+2xT7mPGubLcNXvi/R9Z8STCJX26keJVg48jA==
X-Received: by 2002:a17:902:ba8c:: with SMTP id
 k12mr3261494pls.310.1574745779336; 
 Mon, 25 Nov 2019 21:22:59 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:58 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/18] powerpc/uprobes: Add support for prefixed instructions
Date: Tue, 26 Nov 2019 16:21:38 +1100
Message-Id: <20191126052141.28009-16-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uprobes can execute instructions out of line. Increase the size of the
buffer used  for this so that this works for prefixed instructions. Take
into account the length of prefixed instructions when fixing up the nip.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/uprobes.h | 18 ++++++++++++++----
 arch/powerpc/kernel/uprobes.c      |  4 ++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 2bbdf27d09b5..5b5e8a3d2f55 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -14,18 +14,28 @@
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
+/*
+ * We have to ensure we have enought space for prefixed instructions, which
+ * are double the size of a word instruction, i.e. 8 bytes. However,
+ * sometimes it is simpler to treat a prefixed instruction like 2 word
+ * instructions.
+ */
 #define MAX_UINSN_BYTES		4
-#define UPROBE_XOL_SLOT_BYTES	(MAX_UINSN_BYTES)
+#define UPROBE_XOL_SLOT_BYTES	(2 * MAX_UINSN_BYTES)
 
 /* The following alias is needed for reference from arch-agnostic code */
 #define UPROBE_SWBP_INSN	BREAKPOINT_INSTRUCTION
 #define UPROBE_SWBP_INSN_SIZE	4 /* swbp insn size in bytes */
 
 struct arch_uprobe {
+	 /*
+	  * Ensure there is enough space for prefixed instructions. Prefixed
+	  * instructions must not cross 64-byte boundaries.
+	  */
 	union {
-		u32	insn;
-		u32	ixol;
-	};
+		uprobe_opcode_t	insn[2];
+		uprobe_opcode_t	ixol[2];
+	} __aligned(64);
 };
 
 struct arch_uprobe_task {
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index ab1077dc6148..cfcea6946f8b 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + ((IS_PREFIX(auprobe->insn[0])) ? 8 : 4);
 
 	user_disable_single_step(current);
 	return 0;
@@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, auprobe->insn, 0);
+	ret = emulate_step(regs, auprobe->insn[0], auprobe->insn[1]);
 	if (ret > 0)
 		return true;
 
-- 
2.20.1

