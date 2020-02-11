Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2251589D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:58:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsX04W8pzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LCQ2JdDx; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs3D596DzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:36:56 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id y5so4893291pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HdTC15qPwLQv9AxCNN/SYEkh9wTiDByux50RRaxZw3M=;
 b=LCQ2JdDxQLYp2GzDPYeYgMboeGf7mUvVE7aedtGjrK/9twMSxaBnTt/ecIw8W02tBI
 XX8NRVDhiYyJW2o4aozL+14AklJu46E3+Rik5wtpQpdUowRwrt7r+tipr6rjtkmGUP0P
 tlJhg5/YXLL8/2TdEZs9b0558FMTETZs2B9Y7nevYxuNoeqUXyC50HzJnsPcOdFdgK8o
 +RxwRw4+cJ6XJyC/LtDZrnjskv+HC8zrJfiMMPrqJuVF1XS9nwb4BFYbVP90qPTvumWM
 QsbYfM5GRb4Wzy6XPzlBJ3AFGUJzBQ9BRVGfLcfCL/bJNXoTk6rtG6dWiE5rL2YHuHH2
 1Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HdTC15qPwLQv9AxCNN/SYEkh9wTiDByux50RRaxZw3M=;
 b=PTDBH5uSQR/M6FLeRUD67jKrCCDT7TajMoCL7//ItsWQrMnL4mugopO6Y/p0pak3rA
 I6+TVenFWZNAFt0MRkMCmGD1unwOkqGlSiNe3Eb+1BMf1FI+oivrUgIkrBhGD4JvBsNS
 grVye4dA0dUP3E55htlibnHDWTg5QuXegmoPrUb+V3fUaAPSdAg1nzDuOURKRKQ+KwwW
 E/rO2HDBPGKcVTAjaBXxF6w8WMuhnRyPPuPmRXZoMmDaKhEaP645Z9sGWgDXgAVvU0P5
 RdXYXPCyhh0eLT/ZinbtuqGfdM3hjrYChPwMYjLer1VLmaOibby8nHoH3Yvxz4bWduzJ
 4jMQ==
X-Gm-Message-State: APjAAAXT7G6mhBq5qnUyiOagcrzCn78ztKLFt+daKjKU4hViobLL8Jxq
 /+N6rnOr8f0f1X5kqEdA/JLSeE69y94UvQ==
X-Google-Smtp-Source: APXvYqzSstf+wNeqRpi0pAdismAxiQoFaUszGmtjJ+lfqFR3mkcj9Q3VmZi/mxutgk22HsAwxZPqfg==
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr1619007pfn.168.1581399414282; 
 Mon, 10 Feb 2020 21:36:54 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:36:53 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/13] powerpc/uprobes: Add support for prefixed
 instructions
Date: Tue, 11 Feb 2020 16:33:53 +1100
Message-Id: <20200211053355.21574-12-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uprobes can execute instructions out of line. Increase the size of the
buffer used  for this so that this works for prefixed instructions. Take
into account the length of prefixed instructions when fixing up the nip.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Fix typo
    - Use macro for instruction length
---
 arch/powerpc/include/asm/uprobes.h | 16 ++++++++++++----
 arch/powerpc/kernel/uprobes.c      |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 2bbdf27d09b5..5516ab27db47 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -14,18 +14,26 @@
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
+/*
+ * Ensure we have enough space for prefixed instructions, which
+ * are double the size of a word instruction, i.e. 8 bytes.
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
index 4ab40c4b576f..7e0334ad5cfe 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + PPC_INST_LENGTH(auprobe->insn[0]);
 
 	user_disable_single_step(current);
 	return 0;
@@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, auprobe->insn, PPC_NO_SUFFIX);
+	ret = emulate_step(regs, auprobe->insn[0], auprobe->insn[1]);
 	if (ret > 0)
 		return true;
 
-- 
2.17.1

