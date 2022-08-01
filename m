Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A5586AE7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 14:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxHgF0Ctyz3c7r
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 22:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nq9rIgl2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nq9rIgl2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxHd64XYyz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 22:34:50 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271BRdIn013318;
	Mon, 1 Aug 2022 12:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4vO33KM9Kg2lQ/XR0IrQu6Dhh3R1NiWTNIKnWvbRKBI=;
 b=nq9rIgl2tw5p5Zd1V/FcIntqJXJgzVumx3qzuqVK5BloPgG52L6JUGSvLsaqwrUPwnE9
 45qNy/Ltz++BgpO6ThJFew//zYfuDaVyouj02OJMe/MvQ2Xzd33zg4oK5YigzpH8R5gR
 hQRDYss3Ov0lVOJsJpadGF2p4Bx/h/K9YX0hgQyTwbe04L43kZOO918TK1SwvGXJiR9u
 8yeRuSwnTNa3Fyj5TJYccaLa/4L7i9lUaxRwrP737pKKF/f1C+277LlTza8hSktlKcsh
 9R5Z6xcMpYeuUMntjPLG3SBbGXbVxr6k8b8CO4XerdhdYiH/yoXaOZI0TuuX4CBJcC5l 4g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp9y31p0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 12:34:44 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271CMgYf017422;
	Mon, 1 Aug 2022 12:34:43 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma04wdc.us.ibm.com with ESMTP id 3hmv99bujm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 12:34:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271CYg2232899524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 12:34:42 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FF11136065;
	Mon,  1 Aug 2022 12:34:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AE7C136053;
	Mon,  1 Aug 2022 12:34:41 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.77.138.167])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 12:34:41 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3 2/2] powerpc/pseries: Override lib/arch_vars.c functions
Date: Mon,  1 Aug 2022 07:34:26 -0500
Message-Id: <20220801123426.585801-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G3TPLUp4pRsPMsXsPxoWnQb-pdxOu5TZ
X-Proofpoint-GUID: G3TPLUp4pRsPMsXsPxoWnQb-pdxOu5TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010062
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Self Encrypting Drives(SED) make use of POWER LPAR Platform KeyStore
for storing its variables. Thus the block subsystem needs to access
PowerPC specific functions to read/write objects in PLPKS.

Override the default implementations in lib/arch_vars.c file with
PowerPC specific versions.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../platforms/pseries/plpks_arch_ops.c        | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_arch_ops.c

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 14e143b946a3..3a545422eae5 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 obj-$(CONFIG_PSERIES_PLPKS) += plpks.o
+obj-$(CONFIG_PSERIES_PLPKS) += plpks_arch_ops.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
diff --git a/arch/powerpc/platforms/pseries/plpks_arch_ops.c b/arch/powerpc/platforms/pseries/plpks_arch_ops.c
new file mode 100644
index 000000000000..fdea3322f696
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks_arch_ops.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER Platform arch specific code for SED
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * Define operations for generic kernel subsystems to read/write keys
+ * from POWER LPAR Platform KeyStore(PLPKS).
+ *
+ * List of subsystems/usecase using PLPKS:
+ * - Self Encrypting Drives(SED)
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/ioctl.h>
+#include <uapi/linux/sed-opal.h>
+#include <linux/sed-opal.h>
+#include <linux/arch_vars.h>
+#include "plpks.h"
+
+/*
+ * variable structure that contains all SED data
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
+/*
+ * ext_type values
+ *     00        no extension exists
+ *     01-1F     common
+ *     20-3F     AIX
+ *     40-5F     Linux
+ *     60-7F     IBMi
+ */
+
+/*
+ * This extension is optional for version 1 sed_object_data
+ */
+struct sed_object_extension {
+	u8 ext_type;
+	u8 rsvd[3];
+	u8 ext_data[64];
+};
+
+#define PKS_SED_OBJECT_DATA_V1          1
+#define PKS_SED_MANGLED_LABEL           "/default/pri"
+#define PLPKS_SED_COMPONENT             "sed-opal"
+
+#define PLPKS_ARCHVAR_POLICY            WORLDREADABLE
+#define PLPKS_ARCHVAR_OS_COMMON         4
+
+/*
+ * Read the variable data from PKS given the label
+ */
+int arch_read_variable(enum arch_variable_type type, char *varname,
+		       void *varbuf, u_int *varlen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data *data;
+	u_int offset = 0;
+	char *buf = (char *)varbuf;
+	int ret;
+
+	var.name = varname;
+	var.namelen = strlen(varname);
+	var.policy = PLPKS_ARCHVAR_POLICY;
+	var.os = PLPKS_ARCHVAR_OS_COMMON;
+	var.data = NULL;
+	var.datalen = 0;
+
+	switch (type) {
+	case ARCH_VAR_OPAL_KEY:
+		var.component = PLPKS_SED_COMPONENT;
+#ifdef OPAL_AUTH_KEY
+		if (strcmp(OPAL_AUTH_KEY, varname) == 0) {
+			var.name = PKS_SED_MANGLED_LABEL;
+			var.namelen = strlen(varname);
+		}
+#endif
+		offset = offsetof(struct plpks_sed_object_data, key);
+		break;
+	case ARCH_VAR_OTHER:
+		var.component = "";
+		break;
+	}
+
+	ret = plpks_read_os_var(&var);
+	if (ret != 0)
+		return ret;
+
+	if (offset > var.datalen)
+		offset = 0;
+
+	switch (type) {
+	case ARCH_VAR_OPAL_KEY:
+		data = (struct plpks_sed_object_data *)var.data;
+		*varlen = data->key_len;
+		break;
+	case ARCH_VAR_OTHER:
+		*varlen = var.datalen;
+		break;
+	}
+
+	if (var.data) {
+		memcpy(varbuf, var.data + offset, var.datalen - offset);
+		buf[*varlen] = '\0';
+		kfree(var.data);
+	}
+
+	return 0;
+}
+
+/*
+ * Write the variable data to PKS given the label
+ */
+int arch_write_variable(enum arch_variable_type type, char *varname,
+			void *varbuf, u_int varlen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data data;
+	struct plpks_var_name vname;
+
+	var.name = varname;
+	var.namelen = strlen(varname);
+	var.policy = PLPKS_ARCHVAR_POLICY;
+	var.os = PLPKS_ARCHVAR_OS_COMMON;
+	var.datalen = varlen;
+	var.data = varbuf;
+
+	switch (type) {
+	case ARCH_VAR_OPAL_KEY:
+		var.component = PLPKS_SED_COMPONENT;
+#ifdef OPAL_AUTH_KEY
+		if (strcmp(OPAL_AUTH_KEY, varname) == 0) {
+			var.name = PKS_SED_MANGLED_LABEL;
+			var.namelen = strlen(varname);
+		}
+#endif
+		var.datalen = sizeof(struct plpks_sed_object_data);
+		var.data = (u8 *)&data;
+
+		/* initialize SED object */
+		data.version = PKS_SED_OBJECT_DATA_V1;
+		data.authority = 0;
+		data.range = 0;
+		data.key_len = varlen;
+		memcpy(data.key, varbuf, varlen);
+		break;
+	case ARCH_VAR_OTHER:
+		var.component = "";
+		break;
+	}
+
+	/* variable update requires delete first */
+	vname.namelen = var.namelen;
+	vname.name = var.name;
+	(void)plpks_remove_var(var.component, var.os, vname);
+
+	return plpks_write_var(var);
+}
-- 
2.27.0

