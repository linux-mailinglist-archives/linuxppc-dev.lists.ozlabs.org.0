Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3797E4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 17:13:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DB4c0YfWzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 01:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D9zP1mMKzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46D9zN6qSTz8wMf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:08:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46D9zN6Lfxz9sN6; Thu, 22 Aug 2019 01:08:48 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46D9zN2pnFz9sN1
 for <linuxppc-dev@ozlabs.org>; Thu, 22 Aug 2019 01:08:48 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LF13R2027041
 for <linuxppc-dev@ozlabs.org>; Wed, 21 Aug 2019 11:08:45 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uh87kgj3h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 21 Aug 2019 11:08:45 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Wed, 21 Aug 2019 16:08:42 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 16:08:37 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LF8aOk58523674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 15:08:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07AB1A4053;
 Wed, 21 Aug 2019 15:08:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AD55A4055;
 Wed, 21 Aug 2019 15:08:33 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.158.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 15:08:33 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v2 1/4] powerpc/powernv: Add OPAL API interface to access
 secure variable
Date: Wed, 21 Aug 2019 11:08:20 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082115-0012-0000-0000-000003412613
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082115-0013-0000-0000-0000217B4E3B
Message-Id: <1566400103-18201-2-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210160
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
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The X.509 certificates trusted by the platform and required to secure boot
the OS kernel are wrapped in secure variables, which are controlled by
OPAL.

This patch adds firmware/kernel interface to read and write OPAL secure
variables based on the unique key.

This support can be enabled using CONFIG_OPAL_SECVAR.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h          |   5 +-
 arch/powerpc/include/asm/opal.h              |   6 ++
 arch/powerpc/include/asm/secvar.h            |  55 ++++++++++
 arch/powerpc/kernel/Makefile                 |   2 +-
 arch/powerpc/kernel/secvar-ops.c             |  25 +++++
 arch/powerpc/platforms/powernv/Kconfig       |   6 ++
 arch/powerpc/platforms/powernv/Makefile      |   1 +
 arch/powerpc/platforms/powernv/opal-call.c   |   3 +
 arch/powerpc/platforms/powernv/opal-secvar.c | 102 +++++++++++++++++++
 arch/powerpc/platforms/powernv/opal.c        |   5 +
 10 files changed, 208 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/secvar.h
 create mode 100644 arch/powerpc/kernel/secvar-ops.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 383242eb0dea..b238b4f26c5b 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -208,7 +208,10 @@
 #define OPAL_HANDLE_HMI2			166
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
-#define OPAL_LAST				170
+#define OPAL_SECVAR_GET                         173
+#define OPAL_SECVAR_GET_NEXT                    174
+#define OPAL_SECVAR_ENQUEUE_UPDATE              175
+#define OPAL_LAST                               175
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57bd029c715e..247adec2375f 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -388,6 +388,12 @@ void opal_powercap_init(void);
 void opal_psr_init(void);
 void opal_sensor_groups_init(void);
 
+extern int opal_secvar_get(uint64_t k_key, uint64_t k_key_len,
+			   uint64_t k_data, uint64_t k_data_size);
+extern int opal_secvar_get_next(uint64_t k_key, uint64_t k_key_len,
+				uint64_t k_key_size);
+extern int opal_secvar_enqueue_update(uint64_t k_key, uint64_t k_key_len,
+				      uint64_t k_data, uint64_t k_data_size);
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_OPAL_H */
diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
new file mode 100644
index 000000000000..645654456265
--- /dev/null
+++ b/arch/powerpc/include/asm/secvar.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PowerPC secure variable operations.
+ *
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain <nayna@linux.ibm.com>
+ *
+ */
+#ifndef SECVAR_OPS_H
+#define SECVAR_OPS_H
+
+#include<linux/types.h>
+#include<linux/errno.h>
+
+struct secvar_operations {
+	int (*get_variable)(const char *key, unsigned long key_len, u8 *data,
+			    unsigned long *data_size);
+	int (*get_next_variable)(const char *key, unsigned long *key_len,
+				 unsigned long keysize);
+	int (*set_variable)(const char *key, unsigned long key_len, u8 *data,
+			    unsigned long data_size);
+};
+
+#ifdef CONFIG_PPC_SECURE_BOOT
+
+extern void set_secvar_ops(struct secvar_operations *ops);
+extern struct secvar_operations *get_secvar_ops(void);
+
+#else
+
+static inline void set_secvar_ops(struct secvar_operations *ops)
+{
+}
+
+static inline struct secvar_operations *get_secvar_ops(void)
+{
+	return NULL;
+}
+
+#endif
+
+#ifdef CONFIG_OPAL_SECVAR
+
+extern int secvar_init(void);
+
+#else
+
+static inline int secvar_init(void)
+{
+	return -EINVAL;
+}
+
+#endif
+
+#endif
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 520b1c814197..9041563f1c74 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -157,7 +157,7 @@ endif
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
 
-obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o secvar-ops.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secvar-ops.c
new file mode 100644
index 000000000000..198222499848
--- /dev/null
+++ b/arch/powerpc/kernel/secvar-ops.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain <nayna@linux.ibm.com>
+ *
+ * secvar-ops.c
+ *      - initialize secvar operations for PowerPC Secureboot
+ */
+
+#include<stddef.h>
+#include<asm/secvar.h>
+
+static struct secvar_operations *secvars_ops;
+
+void set_secvar_ops(struct secvar_operations *ops)
+{
+	if (!ops)
+		secvars_ops = NULL;
+	secvars_ops = ops;
+}
+
+struct secvar_operations *get_secvar_ops(void)
+{
+	return secvars_ops;
+}
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 850eee860cf2..65b060539b5c 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -47,3 +47,9 @@ config PPC_VAS
 	  VAS adapters are found in POWER9 based systems.
 
 	  If unsure, say N.
+
+config OPAL_SECVAR
+	bool "OPAL Secure Variables"
+	depends on PPC_POWERNV
+	help
+	  This enables the kernel to access OPAL secure variables.
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index da2e99efbd04..6651c742e530 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
 obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
+obj-$(CONFIG_OPAL_SECVAR) += opal-secvar.o
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 29ca523c1c79..93106e867924 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -287,3 +287,6 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
 OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
 OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
 OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
+OPAL_CALL(opal_secvar_get,                     OPAL_SECVAR_GET);
+OPAL_CALL(opal_secvar_get_next,                 OPAL_SECVAR_GET_NEXT);
+OPAL_CALL(opal_secvar_enqueue_update,           OPAL_SECVAR_ENQUEUE_UPDATE);
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
new file mode 100644
index 000000000000..b0f97cea7675
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PowerNV code for secure variables
+ *
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Claudio Carvalho <cclaudio@linux.ibm.com>
+ *
+ * APIs to access secure variables managed by OPAL.
+ *
+ */
+
+#define pr_fmt(fmt) "secvar: "fmt
+
+#include <linux/types.h>
+#include <asm/opal.h>
+#include <asm/secvar.h>
+
+static bool is_opal_secvar_supported(void)
+{
+	static bool opal_secvar_supported;
+	static bool initialized;
+
+	if (initialized)
+		return opal_secvar_supported;
+
+	if (!opal_check_token(OPAL_SECVAR_GET)
+			|| !opal_check_token(OPAL_SECVAR_GET_NEXT)
+			|| !opal_check_token(OPAL_SECVAR_ENQUEUE_UPDATE)) {
+		pr_err("OPAL doesn't support secure variables\n");
+		opal_secvar_supported = false;
+	} else {
+		opal_secvar_supported = true;
+	}
+
+	initialized = true;
+
+	return opal_secvar_supported;
+}
+
+static int opal_get_variable(const char *key, unsigned long ksize,
+			     u8 *data, unsigned long *dsize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	if (dsize)
+		*dsize = cpu_to_be64(*dsize);
+
+	rc = opal_secvar_get(__pa(key), ksize,
+			__pa(data), __pa(dsize));
+
+	if (dsize)
+		*dsize = be64_to_cpu(*dsize);
+
+	return rc;
+}
+
+static int opal_get_next_variable(const char *key, unsigned long *keylen,
+				  unsigned long keysize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	if (keylen)
+		*keylen = cpu_to_be64(*keylen);
+
+	rc = opal_secvar_get_next(__pa(key), __pa(keylen), keysize);
+
+	if (keylen)
+		*keylen = be64_to_cpu(*keylen);
+
+	return rc;
+}
+
+static int opal_set_variable(const char *key, unsigned long ksize, u8 *data,
+			     unsigned long dsize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	rc = opal_secvar_enqueue_update(__pa(key), ksize, __pa(data), dsize);
+
+	return rc;
+}
+
+static struct secvar_operations secvar_ops = {
+	.get_variable = opal_get_variable,
+	.get_next_variable = opal_get_next_variable,
+	.set_variable = opal_set_variable,
+};
+
+int secvar_init(void)
+{
+	set_secvar_ops(&secvar_ops);
+	return 0;
+}
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index aba443be7daa..ffe6f1cf0830 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -32,6 +32,8 @@
 #include <asm/mce.h>
 #include <asm/imc-pmu.h>
 #include <asm/bug.h>
+#include <asm/secvar.h>
+#include <asm/secboot.h>
 
 #include "powernv.h"
 
@@ -988,6 +990,9 @@ static int __init opal_init(void)
 	/* Initialise OPAL Power control interface */
 	opal_power_control_init();
 
+	if (is_powerpc_secvar_supported())
+		secvar_init();
+
 	return 0;
 }
 machine_subsys_initcall(powernv, opal_init);
-- 
2.20.1

