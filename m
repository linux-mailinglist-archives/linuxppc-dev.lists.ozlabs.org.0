Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD99C07BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 16:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fvZX0SLLzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 00:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fvHq577qzDqxg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46fvHp1NRWz8swt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46fvHn5dGfz9sQm; Sat, 28 Sep 2019 00:26:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46fvHn15pnz9sN1
 for <linuxppc-dev@ozlabs.org>; Sat, 28 Sep 2019 00:26:44 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8REMLJa070718
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:41 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9juquhq8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:41 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Fri, 27 Sep 2019 15:26:38 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 15:26:33 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8REQVXA35717202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 14:26:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CDA8A4060;
 Fri, 27 Sep 2019 14:26:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B43CA405C;
 Fri, 27 Sep 2019 14:26:27 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.207.173])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 14:26:27 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
Date: Fri, 27 Sep 2019 10:25:54 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19092714-0020-0000-0000-000003725415
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092714-0021-0000-0000-000021C82579
Message-Id: <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270134
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerNV systems uses kernel based bootloader, thus its secure boot
implementation uses kernel IMA security subsystem to verify the kernel
before kexec. Since the verification policy might differ based on the
secure boot mode of the system, the policies are defined at runtime.

This patch implements the arch-specific support to define the IMA policy
rules based on the runtime secure boot mode of the system.

This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
config is enabled.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/Kconfig           |  2 ++
 arch/powerpc/kernel/Makefile   |  2 +-
 arch/powerpc/kernel/ima_arch.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/ima.h            |  3 ++-
 4 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/kernel/ima_arch.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2c54beb29f1a..54eda07c74e5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -916,6 +916,8 @@ config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
 	depends on PPC_POWERNV
+	depends on IMA
+	depends on IMA_ARCH_POLICY
 	help
 	  Systems with firmware secure boot enabled needs to define security
 	  policies to extend secure boot to the OS. This config allows user
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 875b0785a20e..7156ac1fc956 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -157,7 +157,7 @@ endif
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
 
-obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
new file mode 100644
index 000000000000..39401b67f19e
--- /dev/null
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ */
+
+#include <linux/ima.h>
+#include <asm/secure_boot.h>
+
+bool arch_ima_get_secureboot(void)
+{
+	return is_powerpc_os_secureboot_enabled();
+}
+
+/* Defines IMA appraise rules for secureboot */
+static const char *const arch_rules[] = {
+	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
+#if !IS_ENABLED(CONFIG_MODULE_SIG)
+	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
+#endif
+	NULL
+};
+
+/*
+ * Returns the relevant IMA arch policies based on the system secureboot state.
+ */
+const char *const *arch_get_ima_policy(void)
+{
+	if (is_powerpc_os_secureboot_enabled())
+		return arch_rules;
+
+	return NULL;
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

