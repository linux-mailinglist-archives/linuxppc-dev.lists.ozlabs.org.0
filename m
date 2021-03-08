Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54B331B21
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 00:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvZtz3tNGz30Mt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=Qnv5tJ/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=Qnv5tJ/M; dkim-atps=neutral
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvZt33xHrz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 10:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=7347; q=dns/txt; s=iport;
 t=1615247612; x=1616457212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XrNTo1a6F2LZ2llgma+xxAVT0B9gHgAbCXKn/wcLOVE=;
 b=Qnv5tJ/MGaz7qQs8AYKvYfSN6CJZz756bKNf7weyVouiluHCSgHs0g0c
 U9hEsFojG4h4fWQX3967AFAtU71mqKDkj+hEEO/mI2xEdZJMxrQb4HEVE
 ZDJQcPmTFkL4ytYGpP/72oD/C8Ps4KHF4v5z5f23f8aZ68/4ve771Y0t0 s=;
X-IronPort-AV: E=Sophos;i="5.81,233,1610409600"; d="scan'208";a="698430710"
Received: from alln-core-5.cisco.com ([173.36.13.138])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 08 Mar 2021 23:53:22 +0000
Received: from zorba.cisco.com ([10.24.7.91])
 by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTP id 128NrKRi007218;
 Mon, 8 Mar 2021 23:53:22 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/7] CMDLINE: add generic builtin command line
Date: Mon,  8 Mar 2021 15:53:09 -0800
Message-Id: <20210308235319.2988609-2-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.91, [10.24.7.91]
X-Outbound-Node: alln-core-5.cisco.com
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
diverse. On x86 and mips they have pretty much the same code and the
code prepends the builtin command line onto the boot loader provided
one. On powerpc there is only a builtin override and nothing else.

The code in this commit unifies the code into a generic
header file under the CONFIG_GENERIC_CMDLINE option. When this
option is enabled the architecture can call the cmdline_add_builtin()
to add the builtin command line.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 include/linux/cmdline.h | 89 +++++++++++++++++++++++++++++++++++++++++
 init/Kconfig            | 68 +++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 include/linux/cmdline.h

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..00929b6e49e6
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,89 @@
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
index 29ad68325028..28363ab07cd4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2032,6 +2032,74 @@ config PROFILING
 config TRACEPOINTS
 	bool
 
+config GENERIC_CMDLINE
+	bool
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

