Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D057B8DF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:22:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q58AG2Aa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S15hM5fRMz3dfr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:22:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q58AG2Aa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S15fD48Ctz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 07:20:20 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394JwtdM011832;
	Wed, 4 Oct 2023 20:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VdzXcTF3dO6FARX9XyhfG3E7w8qzAUWreLSfwZoc/t4=;
 b=q58AG2AaZUZgxjBjEJfDZx42FiXGKEB8v8i7sBoHEzqseCCs+KE4MkCpYxQRtL+mjf+z
 tu4Yywr6SGgv3bAH/cqSf59867k26tF90Jd0GgyP1xV6jXNOK2xH3aEmJcjZaMNgHxKl
 N3iPQaw8YXTgfIc7MayOKimXfRs5U6YOaHyNbto+mGjA9hwZXeD6MxcFtZUwLRgEeTio
 Yl/WEKkl7yABwMlQSyELgQLhbiUAg3B09Zc4zCaFVdno5P60Mi5t6ADwUtsLDrW+N/OI
 lC2Glti4rITZuMhMc707XA4zH049lo30kegHZUAh+NTUM8nauR7ku3+ajqTFnpz7YHG4 Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thej4ru1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:20:02 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 394K6BBv029921;
	Wed, 4 Oct 2023 20:20:02 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thej4ru14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:20:02 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 394K6KnS007512;
	Wed, 4 Oct 2023 20:20:01 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygkuefm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:20:01 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 394KK1ZZ60752342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Oct 2023 20:20:01 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 127DC5804B;
	Wed,  4 Oct 2023 20:20:01 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60D8658055;
	Wed,  4 Oct 2023 20:20:00 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.54.52])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Oct 2023 20:20:00 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org, axboe@kernel.dk
Subject: [PATCH v8 3/3] powerpc/pseries: PLPKS SED Opal keystore support
Date: Wed,  4 Oct 2023 15:19:57 -0500
Message-Id: <20231004201957.1451669-4-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
References: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0D2Dz0CYPU9O2UMP1ZQy5ZUFtsYlKVtc
X-Proofpoint-GUID: 5TPkwO-hCOuqnTpfUZB8QG6PfepYUc1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310040148
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
Cc: gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, ndesaulniers@google.com, nathan@kernel.org, okozina@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Define operations for SED Opal to read/write keys
from POWER LPAR Platform KeyStore(PLPKS). This allows
non-volatile storage of SED Opal keys.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 arch/powerpc/platforms/pseries/Kconfig        |   6 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 131 ++++++++++++++++++
 block/Kconfig                                 |   1 +
 4 files changed, 139 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 4ebf2ef2845d..afc0f6a61337 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -164,6 +164,12 @@ config PSERIES_PLPKS
 	# This option is selected by in-kernel consumers that require
 	# access to the PKS.
 
+config PSERIES_PLPKS_SED
+	depends on PPC_PSERIES
+	bool
+	# This option is selected by in-kernel consumers that require
+	# access to the SED PKS keystore.
+
 config PAPR_SCM
 	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
 	tristate "Support for the PAPR Storage Class Memory interface"
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 53c3b91af2f7..1476c5e4433c 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o
 obj-$(CONFIG_PPC_SECURE_BOOT)	+= plpks-secvar.o
+obj-$(CONFIG_PSERIES_PLPKS_SED)	+= plpks_sed_ops.o
 obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
 
diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
new file mode 100644
index 000000000000..7c873c9589ef
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER Platform specific code for non-volatile SED key access
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * Define operations for SED Opal to read/write keys
+ * from POWER LPAR Platform KeyStore(PLPKS).
+ *
+ * Self Encrypting Drives(SED) key storage using PLPKS
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/ioctl.h>
+#include <linux/sed-opal-key.h>
+#include <asm/plpks.h>
+
+static bool plpks_sed_initialized = false;
+static bool plpks_sed_available = false;
+
+/*
+ * structure that contains all SED data
+ */
+struct plpks_sed_object_data {
+	u_char version;
+	u_char pad1[7];
+	u_long authority;
+	u_long range;
+	u_int  key_len;
+	u_char key[32];
+};
+
+#define PLPKS_SED_OBJECT_DATA_V0        0
+#define PLPKS_SED_MANGLED_LABEL         "/default/pri"
+#define PLPKS_SED_COMPONENT             "sed-opal"
+#define PLPKS_SED_KEY                   "opal-boot-pin"
+
+/*
+ * authority is admin1 and range is global
+ */
+#define PLPKS_SED_AUTHORITY  0x0000000900010001
+#define PLPKS_SED_RANGE      0x0000080200000001
+
+static void plpks_init_var(struct plpks_var *var, char *keyname)
+{
+	if (!plpks_sed_initialized) {
+		plpks_sed_initialized = true;
+		plpks_sed_available = plpks_is_available();
+		if (!plpks_sed_available)
+			pr_err("SED: plpks not available\n");
+	}
+
+	var->name = keyname;
+	var->namelen = strlen(keyname);
+	if (strcmp(PLPKS_SED_KEY, keyname) == 0) {
+		var->name = PLPKS_SED_MANGLED_LABEL;
+		var->namelen = strlen(keyname);
+	}
+	var->policy = PLPKS_WORLDREADABLE;
+	var->os = PLPKS_VAR_COMMON;
+	var->data = NULL;
+	var->datalen = 0;
+	var->component = PLPKS_SED_COMPONENT;
+}
+
+/*
+ * Read the SED Opal key from PLPKS given the label
+ */
+int sed_read_key(char *keyname, char *key, u_int *keylen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data data;
+	int ret;
+	u_int len;
+
+	plpks_init_var(&var, keyname);
+
+	if (!plpks_sed_available)
+		return -EOPNOTSUPP;
+
+	var.data = (u8 *)&data;
+	var.datalen = sizeof(data);
+
+	ret = plpks_read_os_var(&var);
+	if (ret != 0)
+		return ret;
+
+	len = min_t(u16, be32_to_cpu(data.key_len), var.datalen);
+	memcpy(key, data.key, len);
+	key[len] = '\0';
+	*keylen = len;
+
+	return 0;
+}
+
+/*
+ * Write the SED Opal key to PLPKS given the label
+ */
+int sed_write_key(char *keyname, char *key, u_int keylen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data data;
+	struct plpks_var_name vname;
+
+	plpks_init_var(&var, keyname);
+
+	if (!plpks_sed_available)
+		return -EOPNOTSUPP;
+
+	var.datalen = sizeof(struct plpks_sed_object_data);
+	var.data = (u8 *)&data;
+
+	/* initialize SED object */
+	data.version = PLPKS_SED_OBJECT_DATA_V0;
+	data.authority = cpu_to_be64(PLPKS_SED_AUTHORITY);
+	data.range = cpu_to_be64(PLPKS_SED_RANGE);
+	memset(&data.pad1, '\0', sizeof(data.pad1));
+	data.key_len = cpu_to_be32(keylen);
+	memcpy(data.key, (char *)key, keylen);
+
+	/*
+	 * Key update requires remove first. The return value
+	 * is ignored since it's okay if the key doesn't exist.
+	 */
+	vname.namelen = var.namelen;
+	vname.name = var.name;
+	plpks_remove_var(var.component, var.os, vname);
+
+	return plpks_write_var(var);
+}
diff --git a/block/Kconfig b/block/Kconfig
index f1364d1c0d93..55ae2286a4de 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -186,6 +186,7 @@ config BLK_SED_OPAL
 	bool "Logic for interfacing with Opal enabled SEDs"
 	depends on KEYS
 	select PSERIES_PLPKS if PPC_PSERIES
+	select PSERIES_PLPKS_SED if PPC_PSERIES
 	help
 	Builds Logic for interfacing with Opal enabled controllers.
 	Enabling this option enables users to setup/unlock/lock
-- 
gjoyce@linux.vnet.ibm.com

