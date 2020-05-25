Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A91E0502
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 05:01:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VhhF20YHzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 13:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kekmMvQV; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VhfN5xHmzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 13:00:12 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id q9so7927182pjm.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 20:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2ob8zAVshYXzRrWFqMTC/LyxQZ8860X4JmtV7wC3nsE=;
 b=kekmMvQVpEpXO7v6UZneAgr2hXoFlk9ojjIFXLVz9vu7EMmSu7Y3DTFLTGtK5/Kx5U
 mJx5B5kHByFz9QbG/GMOJSPqsZ3o02soYM8BO15l4W9jXgHGoRHeTTtIodMiFihkG8aR
 3XvBY2fJSoweqFsLYwLCe6R+cpcH+cWZ4DkUd2+yxtZuM1osQ5uMtRftm5N0KkC3Wzb1
 ab+ZquesFKwbGWAoaUArGwuuMLQUy3S1gst1ZNwjyIvMQJ+glgxXlitWTpV2mH54NDL5
 91RmlZ3xP6HIR4+RnO8eXLAKrH/UlZjvHZErYUSH0FNP8ULKYBZ5qRGsLaAMxr8Xmbik
 w7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2ob8zAVshYXzRrWFqMTC/LyxQZ8860X4JmtV7wC3nsE=;
 b=MVZQxavjDsNsvwrkiOOg5egYVNIuWYZS9JK9xuOWWDwCom2uw1tyOElZEt0scG9/ZL
 AtrFe5HcxLJGnmhEDfBbVxX/Mc2uaGP7YPROCgJaaQr3rlmQG4T0MrEYNyznnPcyraht
 4684Gr2BGKuB4WuuiZJiT9yBSs8cD0emMtNWX8a7NbgTX5KhnjZM8C+WTD7Bzq6QwSwZ
 s59FBPOD+JuJEQ0q2NJvCKo7XToFeq2WBXw7DVsI19dM6L6dT0P0JwkYAb9vnkYYxt9R
 zNaMQs0Y6TS5Z1QwFVFfhjLrd17GnQHS2HoHfDwABI1daYc8B9nJS9vFx8qgZH4dKmse
 QyNw==
X-Gm-Message-State: AOAM531Z8L+seW9HmG+syeuxHHBN3y0t6MRAyu7wCyZAf8C/Jv6dYtBY
 OAgAu+w2sl4Olxn/wiXfRw+wx5+VV+8=
X-Google-Smtp-Source: ABdhPJwvXes73bsJe38sOlacKY8qtnR9NmFBnrrMNQDL+NMJr+BJe6W1A1mnn31vP7tX75LOY3yu8Q==
X-Received: by 2002:a17:902:7d85:: with SMTP id
 a5mr26576392plm.106.1590375608231; 
 Sun, 24 May 2020 20:00:08 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id p8sm10790452pgm.73.2020.05.24.19.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:00:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc sstep: Add tests for prefixed integer load/stores
Date: Mon, 25 May 2020 12:59:19 +1000
Message-Id: <20200525025923.19843-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>,
 bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add tests for the prefixed versions of the integer load/stores that are
currently tested. This includes the following instructions:
  * Prefixed Load Doubleword (pld)
  * Prefixed Load Word and Zero (plwz)
  * Prefixed Store Doubleword (pstd)

Skip the new tests if ISA v3.1 is unsupported.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  9 +++
 arch/powerpc/lib/test_emulate_step.c  | 95 +++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2a39c716c343..9e3ecb42597e 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -380,6 +380,14 @@
 #define PPC_INST_VCMPEQUD		0x100000c7
 #define PPC_INST_VCMPEQUB		0x10000006
 
+/* Prefixes */
+#define PPC_PREFIX_MLS			0x06000000
+#define PPC_PREFIX_8LS			0x04000000
+
+/* Prefixed instructions */
+#define PPC_INST_PLD			0xe4000000
+#define PPC_INST_PSTD			0xf4000000
+
 /* macros to insert fields into opcodes */
 #define ___PPC_RA(a)	(((a) & 0x1f) << 16)
 #define ___PPC_RB(b)	(((b) & 0x1f) << 11)
@@ -411,6 +419,7 @@
 #define __PPC_CT(t)	(((t) & 0x0f) << 21)
 #define __PPC_SPR(r)	((((r) & 0x1f) << 16) | ((((r) >> 5) & 0x1f) << 11))
 #define __PPC_RC21	(0x1 << 10)
+#define __PPC_PRFX_R(r)	(((r) & 0x1) << 20)
 
 /*
  * Both low and high 16 bits are added as SIGNED additions, so if low 16 bits
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 46af80279ebc..8d8953b5fe90 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -15,6 +15,7 @@
 
 #define IMM_L(i)		((uintptr_t)(i) & 0xffff)
 #define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
+#define IMM_H(i)		(((uintptr_t)(i) >> 16) & 0x3ffff)
 
 /*
  * Defined with TEST_ prefix so it does not conflict with other
@@ -22,12 +23,33 @@
  */
 #define TEST_LD(r, base, i)	ppc_inst(PPC_INST_LD | ___PPC_RT(r) |		\
 					___PPC_RA(base) | IMM_DS(i))
+#define TEST_PLD(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_8LS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_PLD |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_LWZ(r, base, i)	ppc_inst(PPC_INST_LWZ | ___PPC_RT(r) |		\
 					___PPC_RA(base) | IMM_L(i))
+#define TEST_PLWZ(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_MLS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_LWZ |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_LWZX(t, a, b)	ppc_inst(PPC_INST_LWZX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_STD(r, base, i)	ppc_inst(PPC_INST_STD | ___PPC_RS(r) |		\
 					___PPC_RA(base) | IMM_DS(i))
+#define TEST_PSTD(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_8LS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_PSTD |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_LDARX(t, a, b, eh)	ppc_inst(PPC_INST_LDARX | ___PPC_RT(t) |	\
 					___PPC_RA(a) | ___PPC_RB(b) |	\
 					__PPC_EH(eh))
@@ -113,6 +135,29 @@ static void __init test_ld(void)
 		show_result("ld", "FAIL");
 }
 
+static void __init test_pld(void)
+{
+	struct pt_regs regs;
+	unsigned long a = 0x23;
+	int stepped = -1;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("pld", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	init_pt_regs(&regs);
+	regs.gpr[3] = (unsigned long)&a;
+
+	/* pld r5, 0(r3), 0 */
+	stepped = emulate_step(&regs, TEST_PLD(5, 3, 0, 0));
+
+	if (stepped == 1 && regs.gpr[5] == a)
+		show_result("pld", "PASS");
+	else
+		show_result("pld", "FAIL");
+}
+
 static void __init test_lwz(void)
 {
 	struct pt_regs regs;
@@ -131,6 +176,30 @@ static void __init test_lwz(void)
 		show_result("lwz", "FAIL");
 }
 
+static void __init test_plwz(void)
+{
+	struct pt_regs regs;
+	unsigned int a = 0x4545;
+	int stepped = -1;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("plwz", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	init_pt_regs(&regs);
+	regs.gpr[3] = (unsigned long)&a;
+
+	/* plwz r5, 0(r3), 0 */
+
+	stepped = emulate_step(&regs, TEST_PLWZ(5, 3, 0, 0));
+
+	if (stepped == 1 && regs.gpr[5] == a)
+		show_result("plwz", "PASS");
+	else
+		show_result("plwz", "FAIL");
+}
+
 static void __init test_lwzx(void)
 {
 	struct pt_regs regs;
@@ -168,6 +237,29 @@ static void __init test_std(void)
 		show_result("std", "FAIL");
 }
 
+static void __init test_pstd(void)
+{
+	struct pt_regs regs;
+	unsigned long a = 0x1234;
+	int stepped = -1;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("pstd", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	init_pt_regs(&regs);
+	regs.gpr[3] = (unsigned long)&a;
+	regs.gpr[5] = 0x5678;
+
+	/* pstd r5, 0(r3), 0 */
+	stepped = emulate_step(&regs, TEST_PSTD(5, 3, 0, 0));
+	if (stepped == 1 || regs.gpr[5] == a)
+		show_result("pstd", "PASS");
+	else
+		show_result("pstd", "FAIL");
+}
+
 static void __init test_ldarx_stdcx(void)
 {
 	struct pt_regs regs;
@@ -447,9 +539,12 @@ static void __init test_lxvd2x_stxvd2x(void)
 static void __init run_tests_load_store(void)
 {
 	test_ld();
+	test_pld();
 	test_lwz();
+	test_plwz();
 	test_lwzx();
 	test_std();
+	test_pstd();
 	test_ldarx_stdcx();
 	test_lfsx_stfsx();
 	test_lfdx_stfdx();
-- 
2.17.1

