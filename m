Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DEA477FC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:03:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR2C5jt1z3dd6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:03:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qm5fciFY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qm5fciFY; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzV1jrwz305W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:52 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id t83so333557qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGlxhpZofU0sZTJhq0pcfG1o3G8FhbhXguoAwLHafxA=;
 b=Qm5fciFY/QsX9EJZ41ddycEO9cY7L6HH94NFc2rVWHPTN35Xy0WCUgIg07B0zatJR/
 hbCi0TBic8GAHqVhJMl32WvdxwYEeY4jxPuNPoIyBA9nmSbAL9h4u8FyKZWhsf8oF0x1
 Cm43SokIUs9iivlmRzW2ZCF+BF9Vyt14HKrFiJE9rR7Rz5mNuhRdjG0VXPCgD3fUoyZv
 r7f7MXLb/QHonIVk4NrLLzZRk1jGVxi7RBThhwZ0/F4/kOpUdpfJChXVzdAaqJn1svMB
 YY+tCb2BTSZ/uqy39VSMG9dYksISFDmOOfXucC9HbIKXKNTD3PT20G6FE9JCUFVeA2pG
 17Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGlxhpZofU0sZTJhq0pcfG1o3G8FhbhXguoAwLHafxA=;
 b=Bx6dLUfjxgy+RtLH8a5UTFRGuKf2ijypj7a723JuJ/YDDNds/NK+BHEH5FxuT213uf
 Cs0pzP7YBfXEQP+lTT+0wQaL+Tut2Sd6gKyh9C+KvPDAJKRTFd11/YC8EzH77R2KSxuM
 i2rUQLNtnv5fSOC5699fBOJw4QP5qrmXKQTwOaiVo1ZtEVoYxjr3+xbaOjt/TXs3xaod
 kvsYU+GWvSLQFIh2GUs2gnlrwwfIdXQ4NLOxgkvQbMWVkmbw541bD+jcVlWBqwiv6CTR
 GCnPEibEwuyUb/RdovSntARmb19al67V1/IO99unxxUopykLgetuDczMrGSiyLuAZjJM
 UHtA==
X-Gm-Message-State: AOAM531HJEx2zfc8kW0zISdGlj/vaVNN1ThuJFpmkh8G4+G5O7rgmZdx
 MxgpyPQa2vA7RZ0yQUkwoBLXqdNA58M=
X-Google-Smtp-Source: ABdhPJw11CtbUwJD0uQUQ0XPtPafJPv5AEqLIgoNwgPxO5DV39UpZboZb83c/2PC99oQFcWN/4t4+g==
X-Received: by 2002:a05:620a:ce3:: with SMTP id c3mr71900qkj.306.1639692048724; 
 Thu, 16 Dec 2021 14:00:48 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:48 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/20] powerpc/lib: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:17 -0500
Message-Id: <20211216220035.605465-3-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/lib' are deserving of an `__init`
macro attribute. These functions are only called by other initialization
functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/setup.h  |  2 +-
 arch/powerpc/lib/code-patching.c  |  2 +-
 arch/powerpc/lib/feature-fixups.c | 26 +++++++++++++-------------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index cff58db6130f..607e42b8cbf0 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -75,7 +75,7 @@ void __init setup_spectre_v2(void);
 #else
 static inline void setup_spectre_v2(void) {}
 #endif
-void do_btb_flush_fixups(void);
+void __init do_btb_flush_fixups(void);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 312324a26df3..ee54cb447f80 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -397,7 +397,7 @@ void __patch_exception(int exc, unsigned long addr)
 
 #ifdef CONFIG_CODE_PATCHING_SELFTEST
 
-static int instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
+static int __init instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
 {
 	if (instr_is_branch_iform(ppc_inst_read(instr)) ||
 	    instr_is_branch_bform(ppc_inst_read(instr)))
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 57c6bb802f6c..343a78826035 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -580,7 +580,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
 
-static void patch_btb_flush_section(long *curr)
+static void __init patch_btb_flush_section(long *curr)
 {
 	unsigned int *start, *end;
 
@@ -592,7 +592,7 @@ static void patch_btb_flush_section(long *curr)
 	}
 }
 
-void do_btb_flush_fixups(void)
+void __init do_btb_flush_fixups(void)
 {
 	long *start, *end;
 
@@ -621,7 +621,7 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 	}
 }
 
-static void do_final_fixups(void)
+static void __init do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
 	ppc_inst_t inst;
@@ -715,12 +715,12 @@ late_initcall(check_features);
 /* This must be after the text it fixes up, vmlinux.lds.S enforces that atm */
 static struct fixup_entry fixup;
 
-static long calc_offset(struct fixup_entry *entry, unsigned int *p)
+static long __init calc_offset(struct fixup_entry *entry, unsigned int *p)
 {
 	return (unsigned long)p - (unsigned long)entry;
 }
 
-static void test_basic_patching(void)
+static void __init test_basic_patching(void)
 {
 	extern unsigned int ftr_fixup_test1[];
 	extern unsigned int end_ftr_fixup_test1[];
@@ -751,7 +751,7 @@ static void test_basic_patching(void)
 	check(memcmp(ftr_fixup_test1, ftr_fixup_test1_expected, size) == 0);
 }
 
-static void test_alternative_patching(void)
+static void __init test_alternative_patching(void)
 {
 	extern unsigned int ftr_fixup_test2[];
 	extern unsigned int end_ftr_fixup_test2[];
@@ -784,7 +784,7 @@ static void test_alternative_patching(void)
 	check(memcmp(ftr_fixup_test2, ftr_fixup_test2_expected, size) == 0);
 }
 
-static void test_alternative_case_too_big(void)
+static void __init test_alternative_case_too_big(void)
 {
 	extern unsigned int ftr_fixup_test3[];
 	extern unsigned int end_ftr_fixup_test3[];
@@ -810,7 +810,7 @@ static void test_alternative_case_too_big(void)
 	check(memcmp(ftr_fixup_test3, ftr_fixup_test3_orig, size) == 0);
 }
 
-static void test_alternative_case_too_small(void)
+static void __init test_alternative_case_too_small(void)
 {
 	extern unsigned int ftr_fixup_test4[];
 	extern unsigned int end_ftr_fixup_test4[];
@@ -856,7 +856,7 @@ static void test_alternative_case_with_branch(void)
 	check(memcmp(ftr_fixup_test5, ftr_fixup_test5_expected, size) == 0);
 }
 
-static void test_alternative_case_with_external_branch(void)
+static void __init test_alternative_case_with_external_branch(void)
 {
 	extern unsigned int ftr_fixup_test6[];
 	extern unsigned int end_ftr_fixup_test6[];
@@ -866,7 +866,7 @@ static void test_alternative_case_with_external_branch(void)
 	check(memcmp(ftr_fixup_test6, ftr_fixup_test6_expected, size) == 0);
 }
 
-static void test_alternative_case_with_branch_to_end(void)
+static void __init test_alternative_case_with_branch_to_end(void)
 {
 	extern unsigned int ftr_fixup_test7[];
 	extern unsigned int end_ftr_fixup_test7[];
@@ -876,7 +876,7 @@ static void test_alternative_case_with_branch_to_end(void)
 	check(memcmp(ftr_fixup_test7, ftr_fixup_test7_expected, size) == 0);
 }
 
-static void test_cpu_macros(void)
+static void __init test_cpu_macros(void)
 {
 	extern u8 ftr_fixup_test_FTR_macros[];
 	extern u8 ftr_fixup_test_FTR_macros_expected[];
@@ -888,7 +888,7 @@ static void test_cpu_macros(void)
 		     ftr_fixup_test_FTR_macros_expected, size) == 0);
 }
 
-static void test_fw_macros(void)
+static void __init test_fw_macros(void)
 {
 #ifdef CONFIG_PPC64
 	extern u8 ftr_fixup_test_FW_FTR_macros[];
@@ -902,7 +902,7 @@ static void test_fw_macros(void)
 #endif
 }
 
-static void test_lwsync_macros(void)
+static void __init test_lwsync_macros(void)
 {
 	extern u8 lwsync_fixup_test[];
 	extern u8 end_lwsync_fixup_test[];
-- 
2.25.1

