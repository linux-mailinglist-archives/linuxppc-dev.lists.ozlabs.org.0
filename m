Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8C923A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 14:40:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Btmt4lkDzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 22:40:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BtgX1qttzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:35:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46BtgX01mKz8wNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:35:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46BtgW6B3dz9sNk; Mon, 19 Aug 2019 22:35:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46BtgV4Y48z9sND
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 22:35:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JCYMPo042509
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 08:35:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ufufh95kk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 08:35:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Mon, 19 Aug 2019 13:35:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Aug 2019 13:35:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7JCZQoF61341756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 12:35:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1759011C054;
 Mon, 19 Aug 2019 12:35:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62AE11C04C;
 Mon, 19 Aug 2019 12:35:23 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.231.242])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Aug 2019 12:35:23 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] powerpc: Add support to initialize ima policy rules
Date: Mon, 19 Aug 2019 08:35:08 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
References: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19081912-0008-0000-0000-0000030AB4FA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081912-0009-0000-0000-00004A28D845
Message-Id: <1566218108-12705-3-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190142
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER secure boot relies on the kernel IMA security subsystem to
perform the OS kernel image signature verification. Since each secure
boot mode has different IMA policy requirements, dynamic definition of
the policy rules based on the runtime secure boot mode of the system is
required. On systems that support secure boot, but have it disabled,
only measurement policy rules of the kernel image and modules are
defined.

This patch defines the arch-specific implementation to retrieve the
secure boot mode of the system and accordingly configures the IMA policy
rules.

This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
config is enabled.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/Kconfig           |  2 ++
 arch/powerpc/kernel/Makefile   |  2 +-
 arch/powerpc/kernel/ima_arch.c | 50 ++++++++++++++++++++++++++++++++++
 include/linux/ima.h            |  3 +-
 4 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/kernel/ima_arch.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c902a39124dc..42109682b727 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -917,6 +917,8 @@ config PPC_SECURE_BOOT
 	bool
 	default n
 	depends on PPC64
+	depends on IMA
+	depends on IMA_ARCH_POLICY
 	help
 	  Linux on POWER with firmware secure boot enabled needs to define
 	  security policies to extend secure boot to the OS.This config
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index d310ebb4e526..520b1c814197 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -157,7 +157,7 @@ endif
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
 
-obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
new file mode 100644
index 000000000000..ac90fac83338
--- /dev/null
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain <nayna@linux.ibm.com>
+ *
+ * ima_arch.c
+ *      - initialize ima policies for PowerPC Secure Boot
+ */
+
+#include <linux/ima.h>
+#include <asm/secboot.h>
+
+bool arch_ima_get_secureboot(void)
+{
+	return get_powerpc_secureboot();
+}
+
+/*
+ * File signature verification is not needed, include only measurements
+ */
+static const char *const default_arch_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK",
+	"measure func=MODULE_CHECK",
+	NULL
+};
+
+/* Both file signature verification and measurements are needed */
+static const char *const sb_arch_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
+	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
+#if IS_ENABLED(CONFIG_MODULE_SIG)
+	"measure func=MODULE_CHECK",
+#else
+	"measure func=MODULE_CHECK template=ima-modsig",
+	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
+#endif
+	NULL
+};
+
+/*
+ * On PowerPC, file measurements are to be added to the IMA measurement list
+ * irrespective of the secure boot state of the system. Signature verification
+ * is conditionally enabled based on the secure boot state.
+ */
+const char *const *arch_get_ima_policy(void)
+{
+	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot())
+		return sb_arch_rules;
+	return default_arch_rules;
+}
diff --git a/include/linux/ima.h b/include/linux/ima.h
index a20ad398d260..10af09b5b478 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -29,7 +29,8 @@ extern void ima_kexec_cmdline(const void *buf, int size);
 extern void ima_add_kexec_buffer(struct kimage *image);
 #endif
 
-#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
+#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
+	|| defined(CONFIG_PPC_SECURE_BOOT)
 extern bool arch_ima_get_secureboot(void);
 extern const char * const *arch_get_ima_policy(void);
 #else
-- 
2.20.1

