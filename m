Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9A16F67E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:34:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2xr1J7szDqlm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:34:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RxRbtT8A; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2Ng3g0SzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:51 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id f2so1739454pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HdTC15qPwLQv9AxCNN/SYEkh9wTiDByux50RRaxZw3M=;
 b=RxRbtT8A/4XuP3hBPjnHR1al8nY1guCm1slViZF2l15ujm3fkKi9S2J6QD2IIY9FAP
 EJT6apFK9nOR9+Z+Z/ksxUnAnm/2uhvXKbFWYfF8elfjeGt0715YeAkRBKOJNdKrPn6d
 aJ0MyGlT3+KpLiUregGDSW5GH8d8ghxfWQSewztR92L/m2y75EZf8bmnHfmqeHGZd3+V
 sj1t1WJeOWVBDiIjO3GD9YLJteBCXyQPOIwY7LSl6GbqLng5tocpyM18bKk5XT6XkEtw
 RMmQ1Ezr7sb9ApV+QDl6KzeGDxJslDmomvfYDUaEFq+5SaR8FZGnX+tQSuW7tZsIaDTL
 StZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HdTC15qPwLQv9AxCNN/SYEkh9wTiDByux50RRaxZw3M=;
 b=rknOLlzKNYfsqONKBem4+k6JwTq+ptjCmRDwBukskBdMXvi3U6vsqkFdrlYV5gsdDr
 8+eJ163tzmvzZR8FgHFm/ULFiWO3mRqYsCiVwA87R7kHKl3hWVqb+8dOLsluMSWhOjgD
 zV58OoOVwxJO99RsbR1rnUdam7NLZ1Y0355kenNrSElGMsPOwIKwf7WbMWF+Z011lH0y
 dPAdg4S2WDGgiQPOoVwGfmgFbhM1X2vlykFhPMpM6vW5c9EwDM1JHv+MY2LlwwNUEuKi
 M8RjQ7TAf7SxEG8st9EWNxHjTIM7knH/DG7tlCf3lG7I/bBZRYSQcXKrVA6nFbeJsz29
 hi3Q==
X-Gm-Message-State: APjAAAUdf3Cux64jAv9i3xnbU4tMKLmniHnSI2eddiv4j14QGjVWPRn7
 0otS9kKu1/tAP6L1q4aklkod9hLxSHU=
X-Google-Smtp-Source: APXvYqy+z2+lEG0tTEFv+mFNM4gfKOPC4+T2ue4L/i6N3VCPywQQ1T63yEVE18uE0I1pnJrEd/2VCw==
X-Received: by 2002:a17:90a:cf11:: with SMTP id
 h17mr2844362pju.103.1582690128679; 
 Tue, 25 Feb 2020 20:08:48 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:48 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/14] powerpc/uprobes: Add support for prefixed
 instructions
Date: Wed, 26 Feb 2020 15:07:14 +1100
Message-Id: <20200226040716.32395-13-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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

