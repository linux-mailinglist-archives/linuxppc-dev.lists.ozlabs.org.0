Return-Path: <linuxppc-dev+bounces-9798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E53AE9405
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 04:24:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSMvb6NjJz309v;
	Thu, 26 Jun 2025 12:24:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750904667;
	cv=none; b=aTRtkxQOV4Koo1CW60EVBTCr0QdQmdqvM5av7CXiFPIVkywur2tFOFRI0wejk7Z6vDWvm5/0DJ7+aoHB3l0A/Lc1zisIUsCngMZJoY8gVvYiiKT9K2kXzj/4cZJV7CavRaB/6TpHiTJie+qqugTjn6RVJpvlKp0MkYjEhPJ4ZHEuAi4+hHRFd1dGizkB7dS8OfsNgEb2OAeg1H03RoPE0iExANomZoJC0Az56pFf7AyNYeNf6hQEWgSgmgO1uvtHIdoSD9+sjKMN5hRsK3+671Cne1xUzvDL4DnJCbYKM1o9OC4xPNaTUXwwb+058DCHxQ3uXJS19kBjPm6t7ucXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750904667; c=relaxed/relaxed;
	bh=sbB79F3I31v/N/Ro9DhW+ri4NxlSEDB/6kHhIjNKQQU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fRX6Z57o8OwGwE+ubYgdctT/sFc2NLEpT3sTgycRj9ZHM/lIjNUwmNcgrN3mmVW9SwjhF7OdiqM8e8vefF3GBIxEWZh9hPe2XxiFYNIwgWa8snLyF/1I98cvfnIH/LRMhUG9Wsdl3TYgq0bqeekzE7zroivoDotL57ndZGJ5R23tc3rY8XlqjxpMOlFaZOnJWVwdEr1Y6s0CY+KlonBQ5R98GPdqzlWt4241Q5aDGUiVgKmlARF87n43BuU4tAmobCiW4DguCBIng9ZIoJAsWb/dezkY4YazNR6D8oK5VaUlz89hKvN+MTBxU78ky2/jWNxtSuj+j0AQE8Dtw+CRdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 238 seconds by postgrey-1.37 at boromir; Thu, 26 Jun 2025 12:24:26 AEST
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSMvZ1sRHz306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 12:24:26 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bSMrf0sY6z1W3Vj;
	Thu, 26 Jun 2025 10:21:54 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C4471400E8;
	Thu, 26 Jun 2025 10:24:22 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Jun
 2025 10:24:21 +0800
From: GONG Ruiqi <gongruiqi1@huawei.com>
To: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
	<roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>
CC: Eric Snowberg <eric.snowberg@oracle.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	"Lee, Chun-Yi" <jlee@suse.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, Lu Jialin
	<lujialin4@huawei.com>, <gongruiqi1@huawei.com>
Subject: [PATCH RESEND] integrity: Extract secure boot enquiry function out of IMA
Date: Thu, 26 Jun 2025 10:36:17 +0800
Message-ID: <20250626023617.3885806-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 92ad19559ea9 ("integrity: Do not load MOK and MOKx when secure
boot be disabled") utilizes arch_ima_get_secureboot() to perform a
secure boot status check before loading the Machine Owner Key (MOK).
However, only when CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y can this
function be functional, while this config has nothing to do with secure
boot or MOK loading.

Given that arch_ima_get_secureboot() is just a helper to retrieve info
about secure boot via EFI and doesn't necessarily be a part of IMA,
rename it to arch_integrity_get_secureboot(), decouple its functionality
from IMA and extract it to be a integrity subsystem helper, so that both
certificate loading and IMA can make use of it.

Compile-tested for powerpc, s390 and x86, all with allmodconfig.

Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
---

RESEND: Remove duplicated paragraph in commit message. Apology for the
mistake.

 arch/powerpc/kernel/ima_arch.c                |  3 +-
 arch/s390/kernel/ima_arch.c                   |  3 +-
 include/linux/ima.h                           |  6 ---
 include/linux/integrity.h                     |  1 +
 security/integrity/Makefile                   |  3 +-
 security/integrity/ima/Makefile               |  2 +-
 security/integrity/ima/ima_appraise.c         |  2 +-
 security/integrity/ima/ima_efi.c              | 47 +-----------------
 security/integrity/ima/ima_main.c             |  2 +-
 security/integrity/platform_certs/load_uefi.c |  2 +-
 security/integrity/secureboot.c               | 48 +++++++++++++++++++
 11 files changed, 61 insertions(+), 58 deletions(-)
 create mode 100644 security/integrity/secureboot.c

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index b7029beed847..4ceda3f534bd 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -5,9 +5,10 @@
  */
 
 #include <linux/ima.h>
+#include <linux/integrity.h>
 #include <asm/secure_boot.h>
 
-bool arch_ima_get_secureboot(void)
+bool arch_integrity_get_secureboot(void)
 {
 	return is_ppc_secureboot_enabled();
 }
diff --git a/arch/s390/kernel/ima_arch.c b/arch/s390/kernel/ima_arch.c
index f3c3e6e1c5d3..6fb2d551e2c2 100644
--- a/arch/s390/kernel/ima_arch.c
+++ b/arch/s390/kernel/ima_arch.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/ima.h>
+#include <linux/integrity.h>
 #include <asm/boot_data.h>
 
-bool arch_ima_get_secureboot(void)
+bool arch_integrity_get_secureboot(void)
 {
 	return ipl_secure_flag;
 }
diff --git a/include/linux/ima.h b/include/linux/ima.h
index 8e29cb4e6a01..9faf3b964314 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -72,14 +72,8 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size);
 #endif
 
 #ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
-extern bool arch_ima_get_secureboot(void);
 extern const char * const *arch_get_ima_policy(void);
 #else
-static inline bool arch_ima_get_secureboot(void)
-{
-	return false;
-}
-
 static inline const char * const *arch_get_ima_policy(void)
 {
 	return NULL;
diff --git a/include/linux/integrity.h b/include/linux/integrity.h
index f5842372359b..4bc81fe4253e 100644
--- a/include/linux/integrity.h
+++ b/include/linux/integrity.h
@@ -61,5 +61,6 @@ integrity_inode_attrs_changed(const struct integrity_inode_attributes *attrs,
 		!inode_eq_iversion(inode, attrs->version));
 }
 
+extern bool arch_integrity_get_secureboot(void);
 
 #endif /* _LINUX_INTEGRITY_H */
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 92b63039c654..0770c6554a8f 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -11,7 +11,8 @@ integrity-$(CONFIG_INTEGRITY_SIGNATURE) += digsig.o
 integrity-$(CONFIG_INTEGRITY_ASYMMETRIC_KEYS) += digsig_asymmetric.o
 integrity-$(CONFIG_INTEGRITY_PLATFORM_KEYRING) += platform_certs/platform_keyring.o
 integrity-$(CONFIG_INTEGRITY_MACHINE_KEYRING) += platform_certs/machine_keyring.o
-integrity-$(CONFIG_LOAD_UEFI_KEYS) += platform_certs/efi_parser.o \
+integrity-$(CONFIG_LOAD_UEFI_KEYS) += secureboot.o \
+				      platform_certs/efi_parser.o \
 				      platform_certs/load_uefi.o \
 				      platform_certs/keyring_handler.o
 integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
diff --git a/security/integrity/ima/Makefile b/security/integrity/ima/Makefile
index b376d38b4ee6..f81be17e25a8 100644
--- a/security/integrity/ima/Makefile
+++ b/security/integrity/ima/Makefile
@@ -16,5 +16,5 @@ ima-$(CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS) += ima_asymmetric_keys.o
 ima-$(CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS) += ima_queue_keys.o
 
 ifeq ($(CONFIG_EFI),y)
-ima-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT) += ima_efi.o
+ima-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT) += ima_efi.o ../secureboot.o
 endif
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index f435eff4667f..41bece645348 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -27,7 +27,7 @@ core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
 void __init ima_appraise_parse_cmdline(void)
 {
 	const char *str = ima_appraise_cmdline_default;
-	bool sb_state = arch_ima_get_secureboot();
+	bool sb_state = arch_integrity_get_secureboot();
 	int appraisal_state = ima_appraise;
 
 	if (!str)
diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/ima_efi.c
index 138029bfcce1..fcbc0727469e 100644
--- a/security/integrity/ima/ima_efi.c
+++ b/security/integrity/ima/ima_efi.c
@@ -2,52 +2,9 @@
 /*
  * Copyright (C) 2018 IBM Corporation
  */
-#include <linux/efi.h>
 #include <linux/module.h>
 #include <linux/ima.h>
-#include <asm/efi.h>
-
-#ifndef arch_ima_efi_boot_mode
-#define arch_ima_efi_boot_mode efi_secureboot_mode_unset
-#endif
-
-static enum efi_secureboot_mode get_sb_mode(void)
-{
-	enum efi_secureboot_mode mode;
-
-	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
-		pr_info("ima: secureboot mode unknown, no efi\n");
-		return efi_secureboot_mode_unknown;
-	}
-
-	mode = efi_get_secureboot_mode(efi.get_variable);
-	if (mode == efi_secureboot_mode_disabled)
-		pr_info("ima: secureboot mode disabled\n");
-	else if (mode == efi_secureboot_mode_unknown)
-		pr_info("ima: secureboot mode unknown\n");
-	else
-		pr_info("ima: secureboot mode enabled\n");
-	return mode;
-}
-
-bool arch_ima_get_secureboot(void)
-{
-	static enum efi_secureboot_mode sb_mode;
-	static bool initialized;
-
-	if (!initialized && efi_enabled(EFI_BOOT)) {
-		sb_mode = arch_ima_efi_boot_mode;
-
-		if (sb_mode == efi_secureboot_mode_unset)
-			sb_mode = get_sb_mode();
-		initialized = true;
-	}
-
-	if (sb_mode == efi_secureboot_mode_enabled)
-		return true;
-	else
-		return false;
-}
+#include <linux/integrity.h>
 
 /* secureboot arch rules */
 static const char * const sb_arch_rules[] = {
@@ -67,7 +24,7 @@ static const char * const sb_arch_rules[] = {
 
 const char * const *arch_get_ima_policy(void)
 {
-	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
+	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_integrity_get_secureboot()) {
 		if (IS_ENABLED(CONFIG_MODULE_SIG))
 			set_module_sig_enforced();
 		if (IS_ENABLED(CONFIG_KEXEC_SIG))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index f99ab1a3b0f0..9974d89f3eca 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -899,7 +899,7 @@ static int ima_load_data(enum kernel_load_data_id id, bool contents)
 	switch (id) {
 	case LOADING_KEXEC_IMAGE:
 		if (IS_ENABLED(CONFIG_KEXEC_SIG)
-		    && arch_ima_get_secureboot()) {
+		    && arch_integrity_get_secureboot()) {
 			pr_err("impossible to appraise a kernel image without a file descriptor; try using kexec_file_load syscall.\n");
 			return -EACCES;
 		}
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index d1fdd113450a..3042a0c536d6 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -212,7 +212,7 @@ static int __init load_uefi_certs(void)
 	}
 
 	/* the MOK/MOKx can not be trusted when secure boot is disabled */
-	if (!arch_ima_get_secureboot())
+	if (!arch_integrity_get_secureboot())
 		return 0;
 
 	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
diff --git a/security/integrity/secureboot.c b/security/integrity/secureboot.c
new file mode 100644
index 000000000000..5c50f8be6053
--- /dev/null
+++ b/security/integrity/secureboot.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Huawei Technologies Co., Ltd
+ */
+#include <linux/module.h>
+#include <linux/efi.h>
+#include <linux/integrity.h>
+
+#include <asm/efi.h>
+
+#ifndef arch_integrity_efi_boot_mode
+#define arch_integrity_efi_boot_mode efi_secureboot_mode_unset
+#endif
+
+static enum efi_secureboot_mode get_sb_mode(void)
+{
+	enum efi_secureboot_mode mode;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
+		pr_info("integrity: secureboot mode unknown, no efi\n");
+		return efi_secureboot_mode_unknown;
+	}
+
+	mode = efi_get_secureboot_mode(efi.get_variable);
+	if (mode == efi_secureboot_mode_disabled)
+		pr_info("integrity: secureboot mode disabled\n");
+	else if (mode == efi_secureboot_mode_unknown)
+		pr_info("integrity: secureboot mode unknown\n");
+	else
+		pr_info("integrity: secureboot mode enabled\n");
+	return mode;
+}
+
+bool __weak arch_integrity_get_secureboot(void)
+{
+	static enum efi_secureboot_mode sb_mode;
+	static bool initialized;
+
+	if (!initialized && efi_enabled(EFI_BOOT)) {
+		sb_mode = arch_integrity_efi_boot_mode;
+
+		if (sb_mode == efi_secureboot_mode_unset)
+			sb_mode = get_sb_mode();
+		initialized = true;
+	}
+
+	return sb_mode == efi_secureboot_mode_enabled;
+}
-- 
2.25.1


