Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F01BB426
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5gN5tQXzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:48:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HDldQlPg; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4dS2ZZxzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:48 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id p8so9559517pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0NNRG23Jls7cvR0v0xkQiXS4RU2XVw/tF3QZ83PtUCg=;
 b=HDldQlPgl64rRsXh49FYX4O4RgjXjj2Sm8kqz01Uu2e5Mcsro0idNOIKkBOvuqA+Zq
 pJP8zDl99hH5K9E0JxGLQJ4vHSVAwsBiLQ10FSrs0fM0wVKruWMC14/s+euZFK8F2ZnM
 6hDnvZ/Y+EgD4NtJzrgKFjOyNznmisI2UWZexSO4I1RXB5XT/p0d/v9/INMpWRVWVo+1
 F6J5b3SX8TG2yXFc6rWv1ohLikN75YcFihMji8BjUU3FTWsvGPB2kbau2iaq5hljoZ8L
 YiOFKAhWxni8QDMHDlW95Ux/nhnYY5gAc1OLJCE4Y9evTwrpF/GXZh+srj41R+SuiHfu
 Vbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0NNRG23Jls7cvR0v0xkQiXS4RU2XVw/tF3QZ83PtUCg=;
 b=fGwUL4kBn/JiRt2kbZRqjyf7DHirl7Z3n+dwEjMnORnHbw329EptI5mGXqFsyQe60+
 Wfb1iX06qD9k2JbQOVzT60FgEoGu+C0VibGu8Iur4Tarh9W2kZTiSQUqIYWRKhGAks85
 4a9Y8N2DfLXE7jQUINTpOxBcsR5/XMgEhNg5dp5QsXUOu0aXE8iczGKO1hTemFo530dR
 OvDkLuDORq+AmIWMFR5fRuFcS2x4zxewXji9HY0jqJxFVb9X13ggK8JSyLapf3yC9Mv+
 oWLMS9Qx0UXISjcng2idO6wDbIFQuMkjP7UXnZaDLMnWoMkz2hJjYlSXNfTLoixtMMpA
 6n0Q==
X-Gm-Message-State: AGi0PubsTpbRm4i7YbU1buThuEa94PcF54yzUJVClj8g4Va8W4ZpvbEZ
 VqtxcJFei4X3nSMfPHsmS/JFGnYsyz4=
X-Google-Smtp-Source: APiQypLa2BsJultXX86k6fUAoMlDEMTh7eoevCeBjIHvApli5MN8pgGYDoVYKtu4AAehiM6SgwVO4w==
X-Received: by 2002:a63:f91f:: with SMTP id h31mr25870012pgi.218.1588039304326; 
 Mon, 27 Apr 2020 19:01:44 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:43 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 24/28] powerpc: Test prefixed code patching
Date: Tue, 28 Apr 2020 11:58:10 +1000
Message-Id: <20200428015814.15380-25-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

Expand the code-patching self-tests to includes tests for patching
prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series
---
 arch/powerpc/lib/Makefile             |  2 +-
 arch/powerpc/lib/code-patching.c      | 21 +++++++++++++++++++++
 arch/powerpc/lib/test_code-patching.S | 19 +++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/lib/test_code-patching.S

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 546591848219..5e994cda8e40 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
 endif
 
-obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
+obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o test_code-patching.o
 
 ifndef CONFIG_KASAN
 obj-y	+=	string.o memcmp_$(BITS).o
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index dd2f982bb29e..ad5754c5f007 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -700,6 +700,24 @@ static void __init test_translate_branch(void)
 	vfree(buf);
 }
 
+#ifdef __powerpc64__
+static void __init test_prefixed_patching(void)
+{
+	extern unsigned int code_patching_test1[];
+	extern unsigned int code_patching_test1_expected[];
+	extern unsigned int end_code_patching_test1[];
+
+	__patch_instruction((struct ppc_inst *)code_patching_test1,
+			    ppc_inst_prefix(1 << 26, 0x00000000),
+			    (struct ppc_inst *)code_patching_test1);
+
+	check(!memcmp(code_patching_test1,
+		      code_patching_test1_expected,
+		      sizeof(unsigned int) *
+		      (end_code_patching_test1 - code_patching_test1)));
+}
+#endif
+
 static int __init test_code_patching(void)
 {
 	printk(KERN_DEBUG "Running code patching self-tests ...\n");
@@ -708,6 +726,9 @@ static int __init test_code_patching(void)
 	test_branch_bform();
 	test_create_function_call();
 	test_translate_branch();
+#ifdef __powerpc64__
+	test_prefixed_patching();
+#endif
 
 	return 0;
 }
diff --git a/arch/powerpc/lib/test_code-patching.S b/arch/powerpc/lib/test_code-patching.S
new file mode 100644
index 000000000000..91aab208a804
--- /dev/null
+++ b/arch/powerpc/lib/test_code-patching.S
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 IBM Corporation
+ */
+
+	.text
+
+#define globl(x)		\
+	.globl x;	\
+x:
+
+globl(code_patching_test1)
+	nop
+	nop
+globl(end_code_patching_test1)
+
+globl(code_patching_test1_expected)
+	.long 1 << 26
+	.long 0x0000000
-- 
2.17.1

