Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D275234F040
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xxQ62lmz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:57:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=hTx7xGIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=hTx7xGIU; dkim-atps=neutral
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xwn061Dz3bvq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=7816; q=dns/txt; s=iport;
 t=1617127033; x=1618336633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PVYj4/JEMLiilwFZR8HYiGm4NMCrkVblgX2Uf1aFQnA=;
 b=hTx7xGIUPi049fDmk+KznjcQi9/OSmSpcLZU+v2kk4/cv0rJvdEOn4/v
 kMo/DxDcwhBvZDBYItQ5DcGVSkFrw+gad/9T6nhtkggWaNZr85s9aFUjQ
 tADa7qwH2Y3gfcPGfzT6/uabR73h8jbahBtTP0iCSKCvb6gYWnKAbRoJV 8=;
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="881996291"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:57:07 +0000
Received: from zorba.cisco.com ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CE024502;
 Tue, 30 Mar 2021 17:57:06 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] CMDLINE: add generic builtin command line
Date: Tue, 30 Mar 2021 10:56:56 -0700
Message-Id: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
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
Cc: Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This code allows architectures to use a generic builtin command line.
The state of the builtin command line options across architecture is
diverse. MIPS and X86 once has similar systems, then mips added some
options to allow extending the command line. Powerpc did something
simiar in adding the ability to extend. Even with mips and powerpc
enhancement the needs of Cisco are not met on these platforms.

The code in this commit unifies the code into a generic
header file under the CONFIG_GENERIC_CMDLINE option. When this
option is enabled the architecture can call the cmdline_add_builtin()
to add the builtin command line.

This unified implementation offers the same functionality needed by
Cisco on all platform which use it.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 include/linux/cmdline.h | 98 +++++++++++++++++++++++++++++++++++++++++
 init/Kconfig            | 72 ++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 include/linux/cmdline.h

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..439c4585feba
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CMDLINE_H
+#define _LINUX_CMDLINE_H
+
+/*
+ *
+ * Copyright (C) 2006,2021. Cisco Systems, Inc.
+ *
+ * Generic Append/Prepend cmdline support.
+ */
+
+#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_CMDLINE_BOOL)
+
+#ifndef CONFIG_CMDLINE_OVERRIDE
+#define GENERIC_CMDLINE_NEED_STRLCAT
+#define CMDLINE_PREPEND CONFIG_CMDLINE_PREPEND
+#define CMDLINE_APPEND CONFIG_CMDLINE_APPEND
+
+/*
+ * This function will append or prepend a builtin command line to the command
+ * line provided by the bootloader. Kconfig options can be used to alter
+ * the behavior of this builtin command line.
+ * @dest: The destination of the final appended/prepended string
+ * @src: The starting string or NULL if there isn't one.
+ * @tmp: temporary space used for prepending
+ * @length: the maximum length of the strings above.
+ * @cmdline_strlcpy: point to a compatible strlcpy
+ * @cmdline_strlcat: point to a compatible strlcat
+ */
+static inline void
+__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
+		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size),
+		size_t (*cmdline_strlcat)(char *dest, const char *src, size_t count))
+{
+	if (src != dest && src != NULL) {
+		cmdline_strlcpy(dest, " ", length);
+		cmdline_strlcat(dest, src, length);
+	}
+
+	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)
+		cmdline_strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
+
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {
+		cmdline_strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
+		cmdline_strlcat(tmp, dest, length);
+		cmdline_strlcpy(dest, tmp, length);
+	}
+}
+
+#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)			\
+{														\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {								\
+		static label char cmdline_tmp_space[length];							\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, cmdline_strlcpy, cmdline_strlcat);	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) {								\
+		__cmdline_add_builtin(dest, src, NULL, length, cmdline_strlcpy, cmdline_strlcat);		\
+	}													\
+}
+#define cmdline_add_builtin(dest, src, length)	\
+	cmdline_add_builtin_custom(dest, src, length, __initdata, strlcpy, strlcat)
+
+#else /* CONFIG_CMDLINE_OVERRIDE */
+
+#define CMDLINE_PREPEND CONFIG_CMDLINE_PREPEND
+#define CMDLINE_APPEND CONFIG_CMDLINE_APPEND
+
+static inline void
+__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
+		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))
+{
+	cmdline_strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND, length);
+}
+#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
+	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
+#define cmdline_add_builtin(dest, src, length)	\
+	__cmdline_add_builtin_custom(dest, src, length, strlcpy)
+#endif /* !CONFIG_CMDLINE_OVERRIDE */
+
+#else /* !CONFIG_GENERIC_CMDLINE || !CONFIG_CMDLINE_BOOL */
+
+#define CMDLINE_PREPEND ""
+#define CMDLINE_APPEND ""
+
+static inline void
+__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
+		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))
+{
+	if (src != NULL)
+		cmdline_strlcpy(dest, src, length);
+}
+#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
+	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
+#define cmdline_add_builtin(dest, src, length)	\
+	__cmdline_add_builtin_custom(dest, src, length, strlcpy)	\
+
+#endif /* CONFIG_GENERIC_CMDLINE */
+
+#endif /* _LINUX_CMDLINE_H */
diff --git a/init/Kconfig b/init/Kconfig
index 5f5c776ef192..84f06f62550a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2034,6 +2034,78 @@ config PROFILING
 config TRACEPOINTS
 	bool
 
+config GENERIC_CMDLINE
+	bool
+
+config GENERIC_CMDLINE_OF
+	bool
+
+
+if GENERIC_CMDLINE
+
+config CMDLINE_BOOL
+	bool "Built-in kernel command line"
+	help
+	  Allow for specifying boot arguments to the kernel at
+	  build time.  On some systems (e.g. embedded ones), it is
+	  necessary or convenient to provide some or all of the
+	  kernel boot arguments with the kernel itself (that is,
+	  to not rely on the boot loader to provide them.)
+
+	  To compile command line arguments into the kernel,
+	  set this option to 'Y', then fill in the
+	  the boot arguments in CONFIG_CMDLINE.
+
+	  Systems with fully functional boot loaders (i.e. non-embedded)
+	  should leave this option set to 'N'.
+
+config CMDLINE_APPEND
+	string "Built-in kernel command string append"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Enter arguments here that should be compiled into the kernel
+	  image and used at boot time.  If the boot loader provides a
+	  command line at boot time, this string is appended to it to
+	  form the full kernel command line, when the system boots.
+
+	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  change this behavior.
+
+	  In most cases, the command line (whether built-in or provided
+	  by the boot loader) should specify the device for the root
+	  file system.
+
+config CMDLINE_PREPEND
+	string "Built-in kernel command string prepend"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Enter arguments here that should be compiled into the kernel
+	  image and used at boot time.  If the boot loader provides a
+	  command line at boot time, this string is prepended to it to
+	  form the full kernel command line, when the system boots.
+
+	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  change this behavior.
+
+	  In most cases, the command line (whether built-in or provided
+	  by the boot loader) should specify the device for the root
+	  file system.
+
+config CMDLINE_OVERRIDE
+	bool "Built-in command line overrides boot loader arguments"
+	depends on CMDLINE_BOOL
+	help
+	  Set this option to 'Y' to have the kernel ignore the boot loader
+	  command line, and use ONLY the built-in command line. In this case
+	  append and prepend strings are concatenated to form the full
+	  command line.
+
+	  This is used to work around broken boot loaders.  This should
+	  be set to 'N' under normal conditions.
+endif
+
 endmenu		# General setup
 
 source "arch/Kconfig"
-- 
2.25.1

