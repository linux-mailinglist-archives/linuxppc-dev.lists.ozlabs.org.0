Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5622404
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 18:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455qlT0nkyzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 02:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=git.icu
 (client-ip=163.172.180.134; helo=git.icu; envelope-from=shawn@git.icu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=git.icu
Received: from git.icu (git.icu [163.172.180.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455qk01vryzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 02:04:55 +1000 (AEST)
Received: from localhost.localdomain (minicloud.parqtec.unicamp.br
 [143.106.167.126]) by git.icu (Postfix) with ESMTPSA id C3D2A220850;
 Sat, 18 May 2019 16:04:47 +0000 (UTC)
From: Shawn Landden <shawn@git.icu>
To: 
Subject: [RESEND v4 PATCH 1/2] [PowerPC] Add simd.h implementation
Date: Sat, 18 May 2019 13:04:40 -0300
Message-Id: <20190518160441.25008-1-shawn@git.icu>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a
In-Reply-To: <20190515013725.2198-1-shawn@git.icu>
References: <20190515013725.2198-1-shawn@git.icu>
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
Cc: Paul Mackerras <paulus@samba.org>, Shawn Landden <shawn@git.icu>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based off the x86 one.

WireGuard really wants to be able to do SIMD in interrupts,
so it can accelerate its in-bound path.

v4: allow using the may_use_simd symbol even when it always
    returns false (via include guards)
Signed-off-by: Shawn Landden <shawn@git.icu>
---
 arch/powerpc/include/asm/simd.h | 17 +++++++++++++++++
 arch/powerpc/kernel/process.c   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/powerpc/include/asm/simd.h

diff --git a/arch/powerpc/include/asm/simd.h b/arch/powerpc/include/asm/simd.h
new file mode 100644
index 000000000..2fe26f258
--- /dev/null
+++ b/arch/powerpc/include/asm/simd.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * may_use_simd - whether it is allowable at this time to issue SIMD
+ *                instructions or access the SIMD register file
+ *
+ * It's always ok in process context (ie "not interrupt")
+ * but it is sometimes ok even from an irq.
+ */
+#ifdef CONFIG_PPC_FPU
+extern bool may_use_simd(void);
+#else
+static inline bool may_use_simd(void)
+{
+	return false;
+}
+#endif
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index dd9e0d538..ef534831f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -345,6 +345,36 @@ static int restore_altivec(struct task_struct *tsk)
 	}
 	return 0;
 }
+
+/*
+ * Were we in user mode when we were
+ * interrupted?
+ *
+ * Doing kernel_altivec/vsx_begin/end() is ok if we are running
+ * in an interrupt context from user mode - we'll just
+ * save the FPU state as required.
+ */
+static bool interrupted_user_mode(void)
+{
+	struct pt_regs *regs = get_irq_regs();
+
+	return regs && user_mode(regs);
+}
+
+/*
+ * Can we use FPU in kernel mode with the
+ * whole "kernel_fpu/altivec/vsx_begin/end()" sequence?
+ *
+ * It's always ok in process context (ie "not interrupt")
+ * but it is sometimes ok even from an irq.
+ */
+bool may_use_simd(void)
+{
+	return !in_interrupt() ||
+		interrupted_user_mode();
+}
+EXPORT_SYMBOL(may_use_simd);
+
 #else
 #define loadvec(thr) 0
 static inline int restore_altivec(struct task_struct *tsk) { return 0; }
-- 
2.21.0.1020.gf2820cf01a

