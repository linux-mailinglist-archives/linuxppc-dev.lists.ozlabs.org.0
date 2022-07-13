Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2162572A93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 03:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjK7k4fQZz3cfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 11:01:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ai7u0ZQb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ai7u0ZQb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjK6K2fDPz3086
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 11:00:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CM1ARt024486;
	Wed, 13 Jul 2022 01:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vNz4Ng64UtGMlrPtLAJBkSjq+JQSzITvhKRzJwxudzc=;
 b=ai7u0ZQbHvl8RaAOZIdlgd8ywlWBXjQ3PZIB9D6YCMBGFzvVHC6DXySgbqKIH5KtHNlM
 IDo8qFtesaYUUl8MbczfuGn96rOKBOHFQZYxfGwZiVb7yGz5jpfwCYSjRGx2C1ThcQb0
 KbTTIAs0KSg+SVpfLC/X72Gjbm2dNwvGz7fLpU9u2tcEzw+fvimEHQG3+ZdBZAFW2Cni
 WH2nmsTZUCXJ89lCJpFkvmQJCw5MwHiZaDmtyZTsLmGVeon7px5x5spWMOyvIG3VEPdb
 YF/hRW8Cz/Nf7KLck/dmhARaHxvEGJqpMhGaqGBjtVLOdTW1P5wC2Ig8U18MNf2BqjeH Vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h98jw21ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 01:00:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26D0pnpB013138;
	Wed, 13 Jul 2022 01:00:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn1sfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 01:00:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26D0xxkG19792278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 00:59:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9711A4055;
	Wed, 13 Jul 2022 00:59:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 354BCA4040;
	Wed, 13 Jul 2022 00:59:57 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.72.27])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 00:59:57 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries: kernel interfaces to PLPKS platform driver
Date: Tue, 12 Jul 2022 20:59:47 -0400
Message-Id: <20220713005947.459967-3-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220713005947.459967-1-nayna@linux.ibm.com>
References: <20220713005947.459967-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TlMT_2RqqRZgQRQfK0Op9l16q_S1BQyF
X-Proofpoint-ORIG-GUID: TlMT_2RqqRZgQRQfK0Op9l16q_S1BQyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130000
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
Cc: Greg Joyce <gjoyce@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, George Wilson <gcwilson@linux.ibm.com>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Add platform specific interfaces arch_read_variable() and
arch_variable() to allow platform agnostic access to platform
variable stores.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks/Makefile |   1 +
 .../platforms/pseries/plpks/plpks_arch_ops.c  | 163 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/plpks/plpks_arch_ops.c

diff --git a/arch/powerpc/platforms/pseries/plpks/Makefile b/arch/powerpc/platforms/pseries/plpks/Makefile
index e651ace920db..3e9ce6f16575 100644
--- a/arch/powerpc/platforms/pseries/plpks/Makefile
+++ b/arch/powerpc/platforms/pseries/plpks/Makefile
@@ -5,3 +5,4 @@
 #
 
 obj-$(CONFIG_PSERIES_PLPKS)  += plpks.o
+obj-$(CONFIG_PSERIES_PLPKS)  += plpks_arch_ops.o
diff --git a/arch/powerpc/platforms/pseries/plpks/plpks_arch_ops.c b/arch/powerpc/platforms/pseries/plpks/plpks_arch_ops.c
new file mode 100644
index 000000000000..11cd03da08b7
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks/plpks_arch_ops.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER platform keystore
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * This pseries platform device driver provides access to
+ * variables stored in platform keystore.
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/ioctl.h>
+#include <uapi/linux/sed-opal.h>
+#include <linux/sed-opal.h>
+#include <linux/arch_vars.h>
+#include <asm/plpks.h>
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

