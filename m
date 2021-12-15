Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF2476B7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:11:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4Zj6kTfz3cDy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:11:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PkyFdlxI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PkyFdlxI; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgJw67r3z2ynx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:19 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id q14so22270994qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=berXQEiNZDpChIYjHSBUWDsDhQcbMSsPLpjhS199ggM=;
 b=PkyFdlxIN2rEwOShkIM4X7qGEOwNHIdeRznBNo0hXVOhynqWf5DV6DBxT6rK36hO+v
 QBCY+/FW1rbOYD2A1hP+2bPJLeRrkGGG5PUhczNsQojpYVK1NRAJQO1wj65k9pxhugqB
 qrAu9xaocimURa8EhOxaFQk3xjCCMmHTcgLSRw7eTtuOaolZd4xrnFMqx4TTEKQVMyp4
 czTAoNHtnhcsvol8aSINNl3wUXuK0dfdN7JYjUO7nk1NRJQrkQGlULGZPu0V71n3uuBc
 IHBoEdkMCV9ZsR6Z892z4PwFZKJYH+uNPt1eN/H3apNaCVhmXTgH+N01ESD2ZQ/damie
 7+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=berXQEiNZDpChIYjHSBUWDsDhQcbMSsPLpjhS199ggM=;
 b=JMHhXVA7F6sYT1tXI0Hx2PuX/NxUw63HQwdTGfyooHjZ2GMos8NBa7S5Ah2v/CGK/1
 T7i/2lP45QHpJNrliYVpNliDTTmi7UPATujwWzR7QjxuwbWKinQHc50GxyeVpLXO8XnD
 l2QNOWBTRuaN62Ab9/WL0T973SN0DLfXSly+U7HycVskWwUjq3wte89VtDtrSU39ngcl
 TRf/+Vy+gvhUscGuPZWuWa2dwan0LxUAZnvxk9P9Ph4cOE/U/RBUK//jp9HIUOt8Oob/
 0THzQpDuWayGD2nbn4dRZM4fypHUMxiUa5lM5iCpmqmAmkB9JmKhODhxWjxV2pxhJteB
 WZAw==
X-Gm-Message-State: AOAM530VzqxDGNjDwcEAdot6L9oAQz3BgKS8pEt6LM/RUWzfWcom4uhJ
 /hPJLfp3IRySAOl3petLDFQLFdhivJc=
X-Google-Smtp-Source: ABdhPJwHSETViHs93mOYva+N7Fppxdq+NCtq7cFtMzOd0HKim/PHGHWaUg/SOKJpQjYFeyhhM37s0g==
X-Received: by 2002:a05:622a:1444:: with SMTP id
 v4mr12412590qtx.343.1639584796511; 
 Wed, 15 Dec 2021 08:13:16 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:15 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/20] powerpc/lib: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:25 -0500
Message-Id: <20211215161243.16396-3-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
index 99b59bdb6aa6..fb2de1b1c266 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -75,7 +75,7 @@ void setup_spectre_v2(void) __init;
 #else
 static inline void setup_spectre_v2(void) {}
 #endif
-void do_btb_flush_fixups(void);
+void do_btb_flush_fixups(void) __init;
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c5ed98823835..921278f07f56 100644
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
index c3e06922468b..b771f059e762 100644
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
 	struct ppc_inst inst;
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

