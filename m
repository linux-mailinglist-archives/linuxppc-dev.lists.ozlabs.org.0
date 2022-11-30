Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77E63E1E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 21:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMrLy2GDVz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDHU4y3D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDHU4y3D;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMrJw1K6Wz3bXG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 07:24:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUJABSr011530;
	Wed, 30 Nov 2022 20:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w1peTonDZuxenXexGE4C0Bx6s+Dx3567tMu20D0uLq4=;
 b=RDHU4y3DrNm3x86yFl1N9rajTabd8T9oTa4bgpidtb6l1WGLmGTSesTfBpPEycn79arD
 YkkXPB6iUhPxj7WcT/G3TER/j0X/LUX1+DP4+TgSr0omzq6Qt98wZj0H3ua1rdbiwvMu
 l+VFFibfjry11q0KvqeUrPP0Cbh3fFjpOqSRA2xlXkv+QY9xEKV1DpiUoWaS+Vnp2QQu
 YQ1B5zhCvivHQ6EarToTkcvcSPSk8hH15a72rGKSQiRYSv+UWm8/eQHAVGOeZsziZIW2
 4+tTJeJ1jJ/UoymGuKLFPPtQpzW+nPBCIJOtBs9cQCMOfSQxFkw/FjtU6/rDjq8xm14A Uw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6bednhy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:06 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUKLWDt009268;
	Wed, 30 Nov 2022 20:24:05 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01dal.us.ibm.com with ESMTP id 3m3aeae0y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:05 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AUKO4gu38142252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Nov 2022 20:24:04 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2804058059;
	Wed, 30 Nov 2022 20:24:04 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12D0158058;
	Wed, 30 Nov 2022 20:24:03 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Nov 2022 20:24:02 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v5 2/3] powerpc/pseries: PLPKS SED Opal keystore support
Date: Wed, 30 Nov 2022 14:23:57 -0600
Message-Id: <20221130202358.18034-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221130202358.18034-1-gjoyce@linux.vnet.ibm.com>
References: <20221130202358.18034-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WQVGc5sBIZT3cez3D_f-UwHPMq8aeway
X-Proofpoint-GUID: WQVGc5sBIZT3cez3D_f-UwHPMq8aeway
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300141
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Define operations for SED Opal to read/write keys
from POWER LPAR Platform KeyStore(PLPKS). This allows
for non-volatile storage of SED Opal keys.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 92310202bdd7..5bedc06ee2cc 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 obj-$(CONFIG_PSERIES_PLPKS) += plpks.o
+obj-$(CONFIG_PSERIES_PLPKS) += plpks_sed_ops.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
new file mode 100644
index 000000000000..cd1084d07716
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
@@ -0,0 +1,129 @@
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
+#include "plpks.h"
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
+#define PLPKS_PLATVAR_POLICY            WORLDREADABLE
+#define PLPKS_PLATVAR_OS_COMMON         4
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
+void plpks_init_var(struct plpks_var *var, char *keyname)
+{
+	var->name = keyname;
+	var->namelen = strlen(keyname);
+	if (strcmp(PLPKS_SED_KEY, keyname) == 0) {
+		var->name = PLPKS_SED_MANGLED_LABEL;
+		var->namelen = strlen(keyname);
+	}
+	var->policy = PLPKS_PLATVAR_POLICY;
+	var->os = PLPKS_PLATVAR_OS_COMMON;
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
+	struct plpks_sed_object_data *data;
+	u_int offset;
+	int ret;
+	u_int len;
+
+	plpks_init_var(&var, keyname);
+
+	ret = plpks_read_os_var(&var);
+	if (ret != 0)
+		return ret;
+
+	offset = offsetof(struct plpks_sed_object_data, key);
+	if (offset > var.datalen) {
+		kfree(var.data);
+		return -EINVAL;
+	}
+
+	data = (struct plpks_sed_object_data *)var.data;
+	len = min(be32_to_cpu(data->key_len), *keylen);
+
+	if (var.data) {
+		memcpy(key, data->key, len);
+		kfree(var.data);
+	} else
+		len = 0;
+
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
-- 
gjoyce@linux.vnet.ibm.com

