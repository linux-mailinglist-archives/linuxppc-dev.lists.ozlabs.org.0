Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81914172F37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:13:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TF3P49fpzDrHj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 14:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t8gVKHYG; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TF1S06sNzDrC5;
 Fri, 28 Feb 2020 14:11:23 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id b22so635140pls.12;
 Thu, 27 Feb 2020 19:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eB1vvqIqQQMx5GjUi6UwwjoWmVq67cb1g3NN4JBn8/A=;
 b=t8gVKHYG8CqkBzOoYKVBon4w2SJ1FgqUO5ln+3z0ycf60e3zDIY6YeCb9l0VW4KICA
 JwSo8+JLhXk7n7nsqit8M1iy08/5wbhVm8cJTrYwNRNMJmN2edkiKshAzEgLUB5+MpyO
 HaDJ7iiBfMY0CwHTdEoEQcR9OzMg7h72Ds2DT0mHbXWn1I+P7M90TOYxsSQLreMr7s2n
 Kbut/NUjjhX6+9rN+vfuJT3Zpp+jY7r4zwy9eUtzllhxiLrqKvuIQB8kJcEiNEl4jwzr
 PqKhsfn1gtRP5pYkvaMJ8JZteMmrjzaeE2ju2of2o/WP9u8ZV8/2G9BkttcUzt1IQ/SJ
 1d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eB1vvqIqQQMx5GjUi6UwwjoWmVq67cb1g3NN4JBn8/A=;
 b=roCFdBTcUsQO2AUOw5RKnqxvxdI2yRYdr1xlqgrMHbBaQfBOU8WMsXQpbFaVdE4a75
 YEsLfY5MMHkT9dFlMeX6QoROX0auO/PoG6jAWXHGlTlkEp4C3j9xaZ5GFj2JbqlKWDdQ
 lcbxOG3awr0QXW056DDBskK4fm7bp6v1lKRU0lMB7N5VsAiZHzkGasgfFUlDSKU6WW15
 Y+/iP8ExorsMHpFzg33lJjenEQ5qJBClV5YNdKdIKQCD9lmtf4qkNwOXIDVAkoamJtGU
 eZn6FQ9HWjmkfLIpxKgVvYhneN1Vb79HiVowQdJt3nIVgR7BUd6PJt0IgIP2o799bv1U
 a/IA==
X-Gm-Message-State: APjAAAXfDjgeGTLCtG6kNo62//PdmlBoqpFf3Igy4yB0llbUE9XgyIur
 Bulny2lWElgmaNFua8HLH6xKvveZ
X-Google-Smtp-Source: APXvYqwgewphAFbQqViCJyfFArIgtR+B+xkBHqyxL/JO2XHNqZ3UfhfcGrT/0mLGXrhO4oQihbNHrw==
X-Received: by 2002:a17:902:8d94:: with SMTP id
 v20mr2016678plo.259.1582859479289; 
 Thu, 27 Feb 2020 19:11:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-109-34.tpgi.com.au.
 [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id a17sm8132185pgv.11.2020.02.27.19.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 19:11:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] kallsyms: architecture specific symbol lookups
Date: Fri, 28 Feb 2020 13:10:26 +1000
Message-Id: <20200228031027.271510-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-arch@vger.kernel.org, skiboot@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide CONFIG_ARCH_HAS_ADDRESS_LOOKUP which allows architectures to
do their own symbol/address lookup if kernel and module lookups miss.

powerpc will use this to deal with firmware symbols.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/kallsyms.h | 20 ++++++++++++++++++++
 kernel/kallsyms.c        | 13 ++++++++++++-
 lib/Kconfig              |  3 +++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 657a83b943f0..8fdd44873373 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -83,6 +83,26 @@ extern int kallsyms_lookup_size_offset(unsigned long addr,
 				  unsigned long *symbolsize,
 				  unsigned long *offset);
 
+#ifdef CONFIG_ARCH_HAS_ADDRESS_LOOKUP
+const char *arch_address_lookup(unsigned long addr,
+			    unsigned long *symbolsize,
+			    unsigned long *offset,
+			    char **modname, char *namebuf);
+unsigned long arch_address_lookup_name(const char *name);
+#else
+static inline const char *arch_address_lookup(unsigned long addr,
+			    unsigned long *symbolsize,
+			    unsigned long *offset,
+			    char **modname, char *namebuf)
+{
+	return NULL;
+}
+static inline unsigned long arch_address_lookup_name(const char *name)
+{
+	return 0;
+}
+#endif
+
 /* Lookup an address.  modname is set to NULL if it's in the kernel. */
 const char *kallsyms_lookup(unsigned long addr,
 			    unsigned long *symbolsize,
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index a9b3f660dee7..580c762fadd8 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -164,6 +164,7 @@ static unsigned long kallsyms_sym_address(int idx)
 unsigned long kallsyms_lookup_name(const char *name)
 {
 	char namebuf[KSYM_NAME_LEN];
+	unsigned long ret;
 	unsigned long i;
 	unsigned int off;
 
@@ -173,7 +174,12 @@ unsigned long kallsyms_lookup_name(const char *name)
 		if (strcmp(namebuf, name) == 0)
 			return kallsyms_sym_address(i);
 	}
-	return module_kallsyms_lookup_name(name);
+
+	ret = module_kallsyms_lookup_name(name);
+	if (ret)
+		return ret;
+
+	return arch_address_lookup_name(name);
 }
 EXPORT_SYMBOL_GPL(kallsyms_lookup_name);
 
@@ -311,6 +317,11 @@ const char *kallsyms_lookup(unsigned long addr,
 	if (!ret)
 		ret = ftrace_mod_address_lookup(addr, symbolsize,
 						offset, modname, namebuf);
+
+	if (!ret)
+		ret = arch_address_lookup(addr, symbolsize,
+						offset, modname, namebuf);
+
 	return ret;
 }
 
diff --git a/lib/Kconfig b/lib/Kconfig
index bc7e56370129..16d3b8dbcadf 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -80,6 +80,9 @@ config ARCH_USE_CMPXCHG_LOCKREF
 config ARCH_HAS_FAST_MULTIPLIER
 	bool
 
+config ARCH_HAS_ADDRESS_LOOKUP
+	bool
+
 config INDIRECT_PIO
 	bool "Access I/O in non-MMIO mode"
 	depends on ARM64
-- 
2.23.0

