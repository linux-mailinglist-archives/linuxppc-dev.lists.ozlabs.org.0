Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8A1E0503
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 05:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VhkB2MvvzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 13:03:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lVmHmyPJ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VhfW6p4GzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 13:00:19 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id a13so6953802pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IPHftr1A8mDOJYFiaLiAVvRh2Or8gbnBz0dnZRkWprk=;
 b=lVmHmyPJuT4BkgFvnrMnrFnFm6hoGgzIq2cSX1g+xC8F4NV3SOn0ra3h95B4/H+ZA7
 0wwAapdxqi2alDrl+rfxtEg+DSpqTCK6KC5Ym1i8NoiTAf6pNrrf8dpsIto0XukcsXLZ
 G7lt8KWXlj6IapnhsO5LkDXWWImmcsZFhqAF6E/heMon6POAY/6BBJtaBb3GegEIsAfn
 v/Smy2I89JJwMNqZV+6tEC6rWW3h0Yr5anr+3dGTXiQOQZFW0VeSDEeAEKPN2G9O0VG0
 OOxRIvPIg2s0ML4iIITcLuaOyOCrYhTl0WRp6OQ8HPb1maX0jiNQJdai5YXlDuGiHw/j
 bJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IPHftr1A8mDOJYFiaLiAVvRh2Or8gbnBz0dnZRkWprk=;
 b=AbT0q4rsCBGoHI3m+ZlT9AdKumvBwdtB57hDGiRdj6WcrcXZp4Xa3zgjZXhabqV31s
 yl+nkLYnRz8ULaLsQzIQY9+WU8eQoeIIaKhwrZtkYX0vnJ1xNXNBglgcpEHhLnIW4ruX
 ufgX4hnWuODeh2Y58x9wkBhS01avlWUD5dQ4KI+Fn0zKEd4IPH5LCR1hDl2KCJSqEqDm
 9/R79Fm0aAlXFx1iKn50wQud6SPlXNbUf0v8IPH3meNkAI2X0I2Tl2w8zNf8bGH/cgki
 iAe9ydsKnX7+vKP/1HRJpelr/UnHWi4IBsuEFh8rTXP+RrGwIi3wB9/ikbzkl10YZ+2l
 j8JQ==
X-Gm-Message-State: AOAM5331JzE0jvw1rFwUFWDlmTvWpHPYlWqd0ULJ8qOOmK8yQ9+kuHbk
 p25CDd7gGLd8FuSN5YyxybVQB+5NiiY=
X-Google-Smtp-Source: ABdhPJx7EFZ+FXx0tRpUSHdTFXZzVn/tniBpAxYXPVA7sk1hquUK8mehhA2vK2cWoyOSGFwdE2+gjA==
X-Received: by 2002:a17:90b:1045:: with SMTP id
 gq5mr18426796pjb.105.1590375617217; 
 Sun, 24 May 2020 20:00:17 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id p8sm10790452pgm.73.2020.05.24.20.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:00:16 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc sstep: Add tests for prefixed floating-point
 load/stores
Date: Mon, 25 May 2020 12:59:20 +1000
Message-Id: <20200525025923.19843-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525025923.19843-1-jniethe5@gmail.com>
References: <20200525025923.19843-1-jniethe5@gmail.com>
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

Add tests for the prefixed versions of the floating-point load/stores
that are currently tested. This includes the following instructions:
  * Prefixed Load Floating-Point Single (plfs)
  * Prefixed Load Floating-Point Double (plfd)
  * Prefixed Store Floating-Point Single (pstfs)
  * Prefixed Store Floating-Point Double (pstfd)

Skip the new tests if ISA v3.10 is unsupported.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |   4 +
 arch/powerpc/lib/test_emulate_step.c  | 136 ++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 9e3ecb42597e..6b5edec0e347 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -371,9 +371,13 @@
 #define PPC_INST_LBZCIX			0x7c0006aa
 #define PPC_INST_STBCIX			0x7c0007aa
 #define PPC_INST_LWZX			0x7c00002e
+#define PPC_INST_LFS			0xc0000000
 #define PPC_INST_LFSX			0x7c00042e
+#define PPC_INST_STFS			0xd0000000
 #define PPC_INST_STFSX			0x7c00052e
+#define PPC_INST_LFD			0xc8000000
 #define PPC_INST_LFDX			0x7c0004ae
+#define PPC_INST_STFD			0xd8000000
 #define PPC_INST_STFDX			0x7c0005ae
 #define PPC_INST_LVX			0x7c0000ce
 #define PPC_INST_STVX			0x7c0001ce
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 8d8953b5fe90..9599f3a03ca1 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -57,12 +57,40 @@
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_LFSX(t, a, b)	ppc_inst(PPC_INST_LFSX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_PLFS(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_MLS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_LFS |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_STFSX(s, a, b)	ppc_inst(PPC_INST_STFSX | ___PPC_RS(s) |	\
 					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_PSTFS(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_MLS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_STFS |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_LFDX(t, a, b)	ppc_inst(PPC_INST_LFDX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_PLFD(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_MLS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_LFD |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_STFDX(s, a, b)	ppc_inst(PPC_INST_STFDX | ___PPC_RS(s) |	\
 					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_PSTFD(r, base, i, pr)	ppc_inst_prefix(PPC_PREFIX_MLS |	\
+						__PPC_PRFX_R(pr) |	\
+						IMM_H(i),		\
+						PPC_INST_STFD |		\
+						___PPC_RT(r) |		\
+						___PPC_RA(base) |	\
+						IMM_L(i))
 #define TEST_LVX(t, a, b)	ppc_inst(PPC_INST_LVX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_STVX(s, a, b)	ppc_inst(PPC_INST_STVX | ___PPC_RS(s) |		\
@@ -357,6 +385,53 @@ static void __init test_lfsx_stfsx(void)
 		show_result("stfsx", "FAIL");
 }
 
+static void __init test_plfs_pstfs(void)
+{
+	struct pt_regs regs;
+	union {
+		float a;
+		int b;
+	} c;
+	int cached_b;
+	int stepped = -1;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("pld", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	init_pt_regs(&regs);
+
+
+	/*** plfs ***/
+
+	c.a = 123.45;
+	cached_b = c.b;
+
+	regs.gpr[3] = (unsigned long)&c.a;
+
+	/* plfs frt10, 0(r3), 0  */
+	stepped = emulate_step(&regs, TEST_PLFS(10, 3, 0, 0));
+
+	if (stepped == 1)
+		show_result("plfs", "PASS");
+	else
+		show_result("plfs", "FAIL");
+
+
+	/*** pstfs ***/
+
+	c.a = 678.91;
+
+	/* pstfs frs10, 0(r3), 0 */
+	stepped = emulate_step(&regs, TEST_PSTFS(10, 3, 0, 0));
+
+	if (stepped == 1 && c.b == cached_b)
+		show_result("pstfs", "PASS");
+	else
+		show_result("pstfs", "FAIL");
+}
+
 static void __init test_lfdx_stfdx(void)
 {
 	struct pt_regs regs;
@@ -399,6 +474,53 @@ static void __init test_lfdx_stfdx(void)
 	else
 		show_result("stfdx", "FAIL");
 }
+
+static void __init test_plfd_pstfd(void)
+{
+	struct pt_regs regs;
+	union {
+		double a;
+		long b;
+	} c;
+	long cached_b;
+	int stepped = -1;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("pld", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	init_pt_regs(&regs);
+
+
+	/*** plfd ***/
+
+	c.a = 123456.78;
+	cached_b = c.b;
+
+	regs.gpr[3] = (unsigned long)&c.a;
+
+	/* plfd frt10, 0(r3), 0 */
+	stepped = emulate_step(&regs, TEST_PLFD(10, 3, 0, 0));
+
+	if (stepped == 1)
+		show_result("plfd", "PASS");
+	else
+		show_result("plfd", "FAIL");
+
+
+	/*** pstfd ***/
+
+	c.a = 987654.32;
+
+	/* pstfd frs10, 0(r3), 0 */
+	stepped = emulate_step(&regs, TEST_PSTFD(10, 3, 0, 0));
+
+	if (stepped == 1 && c.b == cached_b)
+		show_result("pstfd", "PASS");
+	else
+		show_result("pstfd", "FAIL");
+}
 #else
 static void __init test_lfsx_stfsx(void)
 {
@@ -406,11 +528,23 @@ static void __init test_lfsx_stfsx(void)
 	show_result("stfsx", "SKIP (CONFIG_PPC_FPU is not set)");
 }
 
+static void __init test_plfs_pstfs(void)
+{
+	show_result("plfs", "SKIP (CONFIG_PPC_FPU is not set)");
+	show_result("pstfs", "SKIP (CONFIG_PPC_FPU is not set)");
+}
+
 static void __init test_lfdx_stfdx(void)
 {
 	show_result("lfdx", "SKIP (CONFIG_PPC_FPU is not set)");
 	show_result("stfdx", "SKIP (CONFIG_PPC_FPU is not set)");
 }
+
+static void __init test_plfd_pstfd(void)
+{
+	show_result("plfd", "SKIP (CONFIG_PPC_FPU is not set)");
+	show_result("pstfd", "SKIP (CONFIG_PPC_FPU is not set)");
+}
 #endif /* CONFIG_PPC_FPU */
 
 #ifdef CONFIG_ALTIVEC
@@ -547,7 +681,9 @@ static void __init run_tests_load_store(void)
 	test_pstd();
 	test_ldarx_stdcx();
 	test_lfsx_stfsx();
+	test_plfs_pstfs();
 	test_lfdx_stfdx();
+	test_plfd_pstfd();
 	test_lvx_stvx();
 	test_lxvd2x_stxvd2x();
 }
-- 
2.17.1

