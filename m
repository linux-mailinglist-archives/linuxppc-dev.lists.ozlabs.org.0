Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AE1C66F3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:28:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3VX34WRzDqmb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hprqesGJ; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2ck4DqSzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:48:22 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id v63so326763pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=az73bVUj4TzJa4zEf24RwatXz+fbcLxNLe3v4O3Cl2s=;
 b=hprqesGJZnC9u6LgYaXNaf4kaHivhnMM+qZs4fdY4gt0PVUI/0rBF6RX9ycYhI0IHR
 iihKstuOz4VnYZP9NM1J+a/cWytkI/tyXS5Fq+wm7Ne4jwZlBhSbnLqhGqW5OcNQCkQg
 iHot0+MxK6EF1TmR9e2yEhuvdNsLJp1sH3DKZsYtIHjWC7xXtrFTQc3p9t7o7Khu6OL4
 MlGvHZEVMb7iLZ0qOhsJZyIMHcDkzhrGSV1PiATAga0IpebmzT3MzAJGXhQS0f6daclh
 kr25M0P+KV0sHzhUlJeI8UezM1Dk0fTdEpr7qRGTdz9Lxjjbhg6w4eH53w5/6fpkuqtK
 VmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=az73bVUj4TzJa4zEf24RwatXz+fbcLxNLe3v4O3Cl2s=;
 b=Vp1gbnlpuL6JJE0N4xMjUzEs0cmfwGavhNPC1a/CVDB96jDDjQkK3SzVjn+MJ4wvln
 7nz+YtOcVNlpvDXr6rLUr9Uc3j4u34EquRzkh4Bp1Rb8NE3qcdWCi9yq0gs/ra3LxgjY
 FwsiDXzA8yb5XcUrvm4jE3vF1tIPfQ1DQyYUQ0yRRY8LxiNK9N0iP1Z8LrmPEx7iMpSI
 mo/pRW3zS3Bj+BGsNm5WnqOC1W0WL7YMrVASYoBFOyjSbMMptqKi9CJQTmgd0jWk/VGY
 r0RGt0+74BnblmkqWpbRza1+EPGGqzjdeuy6e/p57k3hGQY0sZ2vyVGnSx+WcP7jgWZ5
 18KA==
X-Gm-Message-State: AGi0PuZLbrYVWrlNdWWrQz4ydzICc0q4tNoqKv9+s7OfrO2r3uXf9GhF
 iAt0RWCtiHUrctWnX+kyMAr6UtuYx4av3A==
X-Google-Smtp-Source: APiQypKpW0dIOxjGG0s3osfvdtOSj+d6jxur+YDi1igSYyeN0iVzblqWBhTqAk1LaLbQ4bScCpLyNw==
X-Received: by 2002:aa7:961a:: with SMTP id q26mr6274465pfg.210.1588736900390; 
 Tue, 05 May 2020 20:48:20 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:48:19 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 24/30] powerpc: Test prefixed code patching
Date: Wed,  6 May 2020 13:40:44 +1000
Message-Id: <20200506034050.24806-25-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Expand the code-patching self-tests to includes tests for patching
prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series
v8: Use OP_PREFIX
---
 arch/powerpc/lib/Makefile             |  2 +-
 arch/powerpc/lib/code-patching.c      | 21 +++++++++++++++++++++
 arch/powerpc/lib/test_code-patching.S | 20 ++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
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
index 58b67b62d5d3..aa51a44bc138 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -708,6 +708,24 @@ static void __init test_translate_branch(void)
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
+			    ppc_inst_prefix(OP_PREFIX << 26, 0x00000000),
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
@@ -716,6 +734,9 @@ static int __init test_code_patching(void)
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
index 000000000000..a9be6107844e
--- /dev/null
+++ b/arch/powerpc/lib/test_code-patching.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 IBM Corporation
+ */
+#include <asm/ppc-opcode.h>
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
+	.long OP_PREFIX << 26
+	.long 0x0000000
-- 
2.17.1

