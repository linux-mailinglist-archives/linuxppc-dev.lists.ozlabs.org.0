Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5BB22C20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:33:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456py10bczzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="gju99Yrl"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pnY6yRCzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:26:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id n19so6706339pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RcwbVYwdq48sfOp6PGv07uva9wEB1qXU03ldISHqIjY=;
 b=gju99YrlA8WbvZBOLxa6NIR55Tz+k0zo57RMStRaczF+jVg2evldO1MixGeAkRO7fu
 +G8hluymiFZ0Ptf82vc5n2ioZZspWH+bbhnnsDfon8ZxTgrOqYiyBx8xhzoatN98qGwA
 NLc8rdELsVvTox/YHAnAwaqzmF4XmpCPA7RAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RcwbVYwdq48sfOp6PGv07uva9wEB1qXU03ldISHqIjY=;
 b=sAuEhmC0Avliw5qIg+aMwL4QualQhffCMa7t+o4HES66Tq4tVsGbrOmYcWI4zO/rLA
 VhyJM4UsjbvDFSqTRSiFnlD7g1/1MV3B7I1IMj7YweOXRPiPRf4PHpkSYgVkBkfp10+M
 Wco1rILrES9ilSDWJrKNPuphiahCeddLxH3RRBunuLAtm4aCdef+Vzf4mUQv/6QdDhoD
 oLSNsSlT/utzFaCKbQr7CEtrvUL6VBXpiv63C0a4TTH5MKUIbcpRnRD/hiUNIyZ5L6sY
 m2IquGxvDrSD7MUeQrWvuGYVTPMxk0dm7FifDxc2k3UE4oNxZrqntgqygpsLCUHJsFKv
 ftKw==
X-Gm-Message-State: APjAAAUi2V4+MPTW0VKCyjPh4y1d/UcShgCkjYVhNU69xt2/VYvT1oBa
 xA8lKsYTeMmDISPjthrIfgylAQ==
X-Google-Smtp-Source: APXvYqyvHrWHKtpCcMdTTtU4rHUlvDogyixu4xu4e+BkMO2Z2Bja3aXeuOOSyyKd6f4Z1VcJY8ptgg==
X-Received: by 2002:a63:144e:: with SMTP id 14mr56194249pgu.304.1558333583617; 
 Sun, 19 May 2019 23:26:23 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id s137sm25511420pfc.119.2019.05.19.23.26.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 May 2019 23:26:23 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: nayna@linux.ibm.com, cclaudio@linux.ibm.com, linux-fsdevel@vger.kernel.org,
 greg@kroah.com, linuxppc-dev@lists.ozlabs.org
Subject: [WIP RFC PATCH 5/6] powerpc/powernv: Remove EFI support for OPAL
 secure variables
Date: Mon, 20 May 2019 16:25:52 +1000
Message-Id: <20190520062553.14947-6-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520062553.14947-1-dja@axtens.net>
References: <20190520062553.14947-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace it with a generic API.

Compile tested only.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/opal-secvar.h       |  58 +++++++++++
 arch/powerpc/platforms/Kconfig               |   3 -
 arch/powerpc/platforms/powernv/Kconfig       |   5 +-
 arch/powerpc/platforms/powernv/opal-secvar.c | 104 ++++---------------
 4 files changed, 83 insertions(+), 87 deletions(-)
 create mode 100644 arch/powerpc/include/asm/opal-secvar.h

diff --git a/arch/powerpc/include/asm/opal-secvar.h b/arch/powerpc/include/asm/opal-secvar.h
new file mode 100644
index 000000000000..ba9bd52138d9
--- /dev/null
+++ b/arch/powerpc/include/asm/opal-secvar.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PowerNV code for secure variables
+ *
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Claudio Carvalho <cclaudio@linux.ibm.com>
+ * Author: Daniel Axtens <dja@axtens.net>
+ *
+ */
+
+#ifndef __OPAL_SECVAR_H
+#define __OPAL_SECVAR_H
+
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#ifdef CONFIG_OPAL_SECVAR
+int opal_get_secure_variable(u16 *name, guid_t *vendor, u32 *attr,
+			     unsigned long *data_size, void *data);
+
+int opal_get_next_secure_variable(unsigned long *name_size, u16 *name,
+				  guid_t *vendor);
+
+int opal_set_secure_variable(u16 *name, guid_t *vendor, u32 attr,
+			     unsigned long data_size, void *data);
+
+int opal_query_secure_variable_info(u32 attr, u64 *storage_space,
+				    u64 *remaining_space,
+				    u64 *max_variable_size);
+#else
+
+static inline int opal_get_secure_variable(u16 *name, guid_t *vendor,
+			u32 *attr, unsigned long *data_size, void *data)
+{
+	return OPAL_UNSUPPORTED;
+}
+
+static inline int opal_get_next_secure_variable(unsigned long *name_size,
+			u16 *name, guid_t *vendor)
+{
+	return OPAL_UNSUPPORTED;
+}
+
+static inline int opal_set_secure_variable(u16 *name, guid_t *vendor,
+			u32 attr, unsigned long data_size, void *data)
+{
+	return OPAL_UNSUPPORTED;
+}
+
+static inline int opal_query_secure_variable_info(u32 attr,
+			u64 *storage_space, u64 *remaining_space,
+			u64 *max_variable_size)
+{
+	return OPAL_UNSUPPORTED;
+}
+
+#endif
+#endif
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 8e30510bc0c1..f3fb79fccc72 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -326,7 +326,4 @@ config XILINX_PCI
 	bool "Xilinx PCI host bridge support"
 	depends on PCI && XILINX_VIRTEX
 
-config EFI
-	bool
-
 endmenu
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 879f8e766098..a71fc5daa60a 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -52,7 +52,6 @@ config OPAL_SECVAR
 	bool "OPAL Secure Variables"
 	depends on PPC_POWERNV && !CPU_BIG_ENDIAN
 	select UCS2_STRING
-	select EFI
 	help
-	  This enables the kernel to access OPAL secure variables via EFI
-	  runtime variable services.
+	  This enables the kernel to access OPAL secure variables via
+	  an API.
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index e333828bd0bc..af753b94cceb 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -8,62 +8,20 @@
  */
 #define pr_fmt(fmt) "secvar: "fmt
 
-#include <linux/efi.h>
 #include <asm/machdep.h>
 #include <asm/opal.h>
+#include <asm/opal-secvar.h>
+#include <linux/uuid.h>
 
 static bool opal_secvar_supported;
 
-static efi_status_t opal_to_efi_status_log(int rc, const char *func_name)
-{
-	efi_status_t status;
-
-	switch (rc) {
-	case OPAL_EMPTY:
-		status = EFI_NOT_FOUND;
-		break;
-	case OPAL_HARDWARE:
-		status = EFI_DEVICE_ERROR;
-		break;
-	case OPAL_NO_MEM:
-		pr_err("%s: No space in the volatile storage\n", func_name);
-		status = EFI_OUT_OF_RESOURCES;
-		break;
-	case OPAL_PARAMETER:
-		status = EFI_INVALID_PARAMETER;
-		break;
-	case OPAL_PARTIAL:
-		status = EFI_BUFFER_TOO_SMALL;
-		break;
-	case OPAL_PERMISSION:
-		status = EFI_WRITE_PROTECTED;
-		break;
-	case OPAL_RESOURCE:
-		pr_err("%s: No space in the non-volatile storage\n", func_name);
-		status = EFI_OUT_OF_RESOURCES;
-		break;
-	case OPAL_SUCCESS:
-		status = EFI_SUCCESS;
-		break;
-	default:
-		pr_err("%s: Unknown OPAL error %d\n", func_name, rc);
-		status = EFI_DEVICE_ERROR;
-		break;
-	}
-
-	return status;
-}
-
-#define opal_to_efi_status(rc) opal_to_efi_status_log(rc, __func__)
-
-static efi_status_t
-opal_get_variable(efi_char16_t *name, efi_guid_t *vendor, u32 *attr,
-		  unsigned long *data_size, void *data)
+int opal_get_secure_variable(u16 *name, guid_t *vendor, u32 *attr,
+			     unsigned long *data_size, void *data)
 {
 	int rc;
 
 	if (!opal_secvar_supported)
-		return EFI_UNSUPPORTED;
+		return OPAL_UNSUPPORTED;
 
 	*data_size = cpu_to_be64(*data_size);
 
@@ -77,17 +35,16 @@ opal_get_variable(efi_char16_t *name, efi_guid_t *vendor, u32 *attr,
 		*attr = be32_to_cpup(attr);
 	*data_size = be64_to_cpu(*data_size);
 
-	return opal_to_efi_status(rc);
+	return rc;
 }
 
-static efi_status_t
-opal_get_next_variable(unsigned long *name_size, efi_char16_t *name,
-		       efi_guid_t *vendor)
+int opal_get_next_secure_variable(unsigned long *name_size, u16 *name,
+				  guid_t *vendor)
 {
 	int rc;
 
 	if (!opal_secvar_supported)
-		return EFI_UNSUPPORTED;
+		return OPAL_UNSUPPORTED;
 
 	*name_size = cpu_to_be64(*name_size);
 
@@ -96,17 +53,16 @@ opal_get_next_variable(unsigned long *name_size, efi_char16_t *name,
 
 	*name_size = be64_to_cpu(*name_size);
 
-	return opal_to_efi_status(rc);
+	return rc;
 }
 
-static efi_status_t
-opal_set_variable(efi_char16_t *name, efi_guid_t *vendor, u32 attr,
-		  unsigned long data_size, void *data)
+int opal_set_secure_variable(u16 *name, guid_t *vendor, u32 attr,
+			     unsigned long data_size, void *data)
 {
 	int rc;
 
 	if (!opal_secvar_supported)
-		return EFI_UNSUPPORTED;
+		return OPAL_UNSUPPORTED;
 	/*
 	 * The secure variable update must be enqueued in order to be processed
 	 * in the next boot by firmware. The secure variable storage is write
@@ -114,17 +70,17 @@ opal_set_variable(efi_char16_t *name, efi_guid_t *vendor, u32 attr,
 	 */
 	rc = opal_secvar_enqueue(__pa(name), __pa(vendor), attr,
 				 data_size, __pa(data));
-	return opal_to_efi_status(rc);
+	return rc;
 }
 
-static efi_status_t
-opal_query_variable_info(u32 attr, u64 *storage_space, u64 *remaining_space,
-			 u64 *max_variable_size)
+int opal_query_secure_variable_info(u32 attr, u64 *storage_space,
+				    u64 *remaining_space,
+				    u64 *max_variable_size)
 {
 	int rc;
 
 	if (!opal_secvar_supported)
-		return EFI_UNSUPPORTED;
+		return OPAL_UNSUPPORTED;
 
 	*storage_space = cpu_to_be64p(storage_space);
 	*remaining_space = cpu_to_be64p(remaining_space);
@@ -137,22 +93,18 @@ opal_query_variable_info(u32 attr, u64 *storage_space, u64 *remaining_space,
 	*remaining_space = be64_to_cpup(remaining_space);
 	*max_variable_size = be64_to_cpup(max_variable_size);
 
-	return opal_to_efi_status(rc);
+	return rc;
 }
 
-static void pnv_efi_runtime_setup(void)
+static int __init pnv_opal_secvar_init(void)
 {
 	/*
 	 * The opal wrappers below treat the @name, @vendor, and @data
-	 * parameters as little endian blobs.
+	 * parameters as opaque blobs.
 	 * @name is a ucs2 string
-	 * @vendor is the vendor GUID. It is converted to LE in the kernel
+	 * @vendor is the vendor GUID in EFI format
 	 * @data variable data, which layout may be different for each variable
 	 */
-	efi.get_variable = opal_get_variable;
-	efi.get_next_variable = opal_get_next_variable;
-	efi.set_variable = opal_set_variable;
-	efi.query_variable_info = opal_query_variable_info;
 
 	if (!opal_check_token(OPAL_SECVAR_GET) ||
 	    !opal_check_token(OPAL_SECVAR_GET_NEXT) ||
@@ -163,17 +115,7 @@ static void pnv_efi_runtime_setup(void)
 	} else {
 		opal_secvar_supported = true;
 	}
-}
-
-static int __init pnv_efi_init(void)
-{
-	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-	set_bit(EFI_BOOT, &efi.flags);
-
-	if (IS_ENABLED(CONFIG_64BIT))
-		set_bit(EFI_64BIT, &efi.flags);
 
-	pnv_efi_runtime_setup();
 	return 0;
 }
-machine_arch_initcall(powernv, pnv_efi_init);
+machine_arch_initcall(powernv, pnv_opal_secvar_init);
-- 
2.19.1

