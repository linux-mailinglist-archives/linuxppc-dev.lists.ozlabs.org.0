Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0057EF0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 13:33:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqkhw29V8z3dwb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 21:33:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXu5vgJC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXu5vgJC;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqkf22hxbz2xkc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 21:31:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26NAjrj6015343;
	Sat, 23 Jul 2022 11:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YYDzzxGlvHiEkk6tDfT9X2rByem+CUpHaIeMJhBEYJI=;
 b=ZXu5vgJCOz8sRS1GCfUL1zfhQUBzlm2P/hWBOVKjv6cMXtGthK4TW9WAnWKTjnEu9Sju
 j/tIeNJyCJFYqnXRQY7H3uWJO1S+1eVNAxKU2gIJYak49ftG+AK9VsBsT3UDENH6gS65
 s0tpJxOSV8xShgVOrPOXV+Eh0ID1P3fSN7KLOYu5GTOIfSIoRgyzdPR8d3Jc+WdejbYo
 QY4/1LWZBuhF+F9uujjqKGUbkvXBrrxAFatgXKWoDUk/c3LhI9PiZGN/VrrI4JpGAjYz
 8UESV6ArmiCrDYLyZ0fVIvzKOT+LFNsh5sn6DAtdWk2fcgqvwucdNqn93O3UgJyo5U/1 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgfh78mp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26NBTG20023561;
	Sat, 23 Jul 2022 11:31:14 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgfh78mnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26NBKrQI026891;
	Sat, 23 Jul 2022 11:31:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3hg97t8apb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26NBV9aa16777598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 Jul 2022 11:31:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61E35A4051;
	Sat, 23 Jul 2022 11:31:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCAB8A4040;
	Sat, 23 Jul 2022 11:31:06 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.163.18.137])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 23 Jul 2022 11:31:06 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/pseries: Override lib/arch_vars.c with PowerPC architecture specific version
Date: Sat, 23 Jul 2022 07:30:48 -0400
Message-Id: <20220723113048.521744-4-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220723113048.521744-1-nayna@linux.ibm.com>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -quiEvKEdSPiiJg65gQ222jZx5q88Iyw
X-Proofpoint-GUID: sFhsjucUjR5IRSs_XGNH3qscI-tZTnm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207230049
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
Cc: gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Self Encrypting Drives(SED) make use of POWER LPAR Platform KeyStore for
storing its variables. Thus the block subsystem needs to access
PowerPC specific functions to read/write objects in PLPKS.

Override the default implementations in lib/arch_vars.c file with
PowerPC specific versions.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../platforms/pseries/plpks_arch_ops.c        | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+)
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
index 000000000000..48fa19f0c9c5
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks_arch_ops.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER Platform arch specific code for SED
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * Define operations for generic kernel subsystems to read/write keys from
+ * POWER LPAR Platform KeyStore(PLPKS).
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
+ *	00        no extension exists
+ *	01-1F     common
+ *	20-3F     AIX
+ *	40-5F     Linux
+ *	60-7F     IBMi
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
+#define PLPKS_SED_POLICY                WORLDREADABLE
+#define PLPKS_SED_OS_COMMON             4
+
+#ifndef CONFIG_BLK_SED_OPAL
+#define	OPAL_AUTH_KEY                   ""
+#endif
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
+	var.policy = PLPKS_SED_POLICY;
+	var.os = PLPKS_SED_OS_COMMON;
+	var.data = NULL;
+	var.datalen = 0;
+
+	switch (type) {
+	case ARCH_VAR_OPAL_KEY:
+		var.component = PLPKS_SED_COMPONENT;
+		if (strcmp(OPAL_AUTH_KEY, varname) == 0) {
+			var.name = PKS_SED_MANGLED_LABEL;
+			var.namelen = strlen(varname);
+		}
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
+	var.policy = PLPKS_SED_POLICY;
+	var.os = PLPKS_SED_OS_COMMON;
+	var.datalen = varlen;
+	var.data = varbuf;
+
+	switch (type) {
+	case ARCH_VAR_OPAL_KEY:
+		var.component = PLPKS_SED_COMPONENT;
+		if (strcmp(OPAL_AUTH_KEY, varname) == 0) {
+			var.name = PKS_SED_MANGLED_LABEL;
+			var.namelen = strlen(varname);
+		}
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
+	(void)plpks_remove_var(PLPKS_SED_COMPONENT, PLPKS_SED_OS_COMMON, vname);
+
+	return plpks_write_var(var);
+}
-- 
2.27.0

