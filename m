Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799E1B1BE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:29:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495nZZ1Mb7zDr2j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Svz/wWYz; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495nQ71F04zDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:22:07 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n16so6062047pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 19:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/jiVGsshrty7XTx7vG39FeKpKzItjmFmBuvDmuyRCI=;
 b=Svz/wWYzpKuyQss62FL5urJKyzudK6qLz6QwW7CWdADuvc05Ity3FNvBERkE9F5BTE
 HUSThf3SJY+44kQyVoI7ATsE20jFVEriNA5BZKy65bvJQcmuHh3PcyY6W00LwGc9EayH
 HwMBYXxj0Z4L6bJE3lrpEnx1QV6bcRDdqbnkOZb9UZ2hhC4s4Bfw05pPEekvU8RTQ4J3
 XX7p0dDnJmjbgijZcITd3KESTbHOAPMnY/bXBfZOsvckgMU6nO/xPTQznQRoizmaE6xD
 YNrSR5/xOWgfluQ3YTdpmMAiFhejE64XHhWEHdl3UEAh9JN/3hXL6+6tRd4k2gnWiKUD
 TGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/jiVGsshrty7XTx7vG39FeKpKzItjmFmBuvDmuyRCI=;
 b=TyXAsrR42+2PvvsRP/AhO0sDEJn3avo85xlmRtUQko5g1tzhXRHF2bN45mwPrSPZxN
 8sSP9M0t5BYpMPmmcr54ju+xjoV62LgKV9fHBinUhQRnDZC4owTKhvGUU41Yh+7Wr1tx
 s6lvoFgtbjc1kzcNXixxshzbKQczfc0N19TyE3SjwsQaMTFa/nK/ObgaxwrPpdah3YzQ
 msBTDonQ2WwwE6+JGc1bMf/eL35ujpMdBM8864OTgyCHVghGkSPN/EeEh6UzpYY3I3cl
 lvE0nI4Bx3A0irT5qZMhSzEkaWfPqWGo8y+TimgUMT/1On5LkI1XiWPESQR1/Keq3LN6
 PfwQ==
X-Gm-Message-State: AGi0PubQHz2Ai2ZoXDHpIs4ty8FFvFhJp7R1QXV1XdbNuKmM4JwOXI1P
 Pl4itrcsE9J2yi+8SCD8wCab4CCa
X-Google-Smtp-Source: APiQypJccw0qZHhSCSM53swzv+N2ZgQZ70zzzpxUdmracXUMsoj1suG4FfzY2lqR707zVUy7qwXlyw==
X-Received: by 2002:a65:688c:: with SMTP id e12mr18544683pgt.194.1587435724347; 
 Mon, 20 Apr 2020 19:22:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id w3sm829397pfn.115.2020.04.20.19.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 19:22:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc: TRAP_IS_SYSCALL helper to hide syscall trap
 number
Date: Tue, 21 Apr 2020 12:19:54 +1000
Message-Id: <20200421021955.772023-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200421021955.772023-1-npiggin@gmail.com>
References: <20200421021955.772023-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A new system call interrupt will be added with a new trap number.
Hide the explicit 0xc00 test behind an accessor to reduce churn
in callers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h  | 2 ++
 arch/powerpc/include/asm/syscall.h | 5 ++++-
 arch/powerpc/kernel/process.c      | 2 +-
 arch/powerpc/kernel/signal.c       | 2 +-
 arch/powerpc/xmon/xmon.c           | 2 +-
 5 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 7eaa2ecfd0b7..5eb249c725bd 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -180,6 +180,8 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 #define current_pt_regs() \
 	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
 
+#define TRAP_IS_SYSCALL(regs)	(TRAP(regs) == 0xc00)
+
 #ifdef __powerpc64__
 #ifdef CONFIG_PPC_BOOK3S
 #define TRAP(regs)		((regs)->trap)
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 38d62acfdce7..1e0446d6ba45 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -26,7 +26,10 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	 * This is important for seccomp so that compat tasks can set r0 = -1
 	 * to reject the syscall.
 	 */
-	return TRAP(regs) == 0xc00 ? regs->gpr[0] : -1;
+	if (TRAP_IS_SYSCALL(regs))
+		return regs->gpr[0];
+	else
+		return -1;
 }
 
 static inline void syscall_rollback(struct task_struct *task,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 6599a3099d10..0dce642ca39d 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1412,7 +1412,7 @@ void show_regs(struct pt_regs * regs)
 	print_msr_bits(regs->msr);
 	pr_cont("  CR: %08lx  XER: %08lx\n", regs->ccr, regs->xer);
 	trap = TRAP(regs);
-	if ((TRAP(regs) != 0xc00) && cpu_has_feature(CPU_FTR_CFAR))
+	if (!TRAP_IS_SYSCALL(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
 	if (trap == 0x200 || trap == 0x300 || trap == 0x600)
 #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index a264989626fd..4b74eef1d881 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -198,7 +198,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 	int restart = 1;
 
 	/* syscall ? */
-	if (TRAP(regs) != 0x0C00)
+	if (!TRAP_IS_SYSCALL(regs))
 		return;
 
 	/* error signalled ? */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 20c1fc08819b..8da771e025fa 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1776,7 +1776,7 @@ static void prregs(struct pt_regs *fp)
 #endif
 	printf("pc  = ");
 	xmon_print_symbol(fp->nip, " ", "\n");
-	if (TRAP(fp) != 0xc00 && cpu_has_feature(CPU_FTR_CFAR)) {
+	if (!TRAP_IS_SYSCALL(fp) && cpu_has_feature(CPU_FTR_CFAR)) {
 		printf("cfar= ");
 		xmon_print_symbol(fp->orig_gpr3, " ", "\n");
 	}
-- 
2.23.0

