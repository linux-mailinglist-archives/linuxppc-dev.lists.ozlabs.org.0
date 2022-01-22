Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5524968FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgdCg1ft4z3bcl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:58:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GD9j/bc1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GD9j/bc1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgdB60YHtz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 11:57:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20M0lSZq017664; 
 Sat, 22 Jan 2022 00:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3bwuHZ4XHnmcVhhaVcnp4DW/rZ8JbBr6JPE/21wJ45A=;
 b=GD9j/bc1/EsVIICpPKaaKfaTk2GxynbH+AB/gbr5q/eMfeR5uD18qpIwKwSjiv3ajxbW
 cWjoRXRAOsWZS17JH94bE0l7EDh9BPnXlB4QqzgGxb9LptJr/lZCAEYsz+I9VVaRapTF
 Q8m+DZk+5uTSlD4nUmhi8KLVZegGWPs7mi1jzLHQpAmP2BDUxvlPIbyHv/xE8e6LRw8V
 qxfPYJJuq69KpHMrQDk2Iq4lJw27a1zW0TvOFMuFrWPMSIykq+TwmkEGFNaEVTeS/1qR
 KySIMJxWsg6ryapIAstn9c/ZIAA8D+2lHAN+nn8dUqVpLkS2+lKRG6c1kUbBmhiWZBNN og== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dr7pk8390-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20M0Y17I017144;
 Sat, 22 Jan 2022 00:56:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3dqjegg7aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20M0unZn38207746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jan 2022 00:56:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39ABAA4040;
 Sat, 22 Jan 2022 00:56:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5511A4053;
 Sat, 22 Jan 2022 00:56:46 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown
 [9.211.59.92]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 22 Jan 2022 00:56:46 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/2] pseries: define driver for Platform Keystore
Date: Fri, 21 Jan 2022 19:56:36 -0500
Message-Id: <20220122005637.28199-2-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220122005637.28199-1-nayna@linux.ibm.com>
References: <20220122005637.28199-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FPdFCN2jlW25FEfoC2SpbDjP_f0M9ejM
X-Proofpoint-GUID: FPdFCN2jlW25FEfoC2SpbDjP_f0M9ejM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201220001
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Douglas Miller <dougmill@linux.vnet.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>, George Wilson <gcwilson@linux.ibm.com>,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM provides an isolated Platform Keystore(PKS) storage allocation
for each partition with individually managed access controls to store
sensitive information securely. It provides a new set of hypervisor
calls for Linux kernel to access PKS storage.

Define PKS driver using H_CALL interface to access PKS storage.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h       |  13 +-
 arch/powerpc/include/asm/pks.h          |  84 ++++
 arch/powerpc/platforms/pseries/Kconfig  |  10 +
 arch/powerpc/platforms/pseries/Makefile |   1 +
 arch/powerpc/platforms/pseries/pks.c    | 494 ++++++++++++++++++++++++
 5 files changed, 601 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/pks.h
 create mode 100644 arch/powerpc/platforms/pseries/pks.c

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 9bcf345cb208..08108dcf8677 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -97,6 +97,7 @@
 #define H_OP_MODE	-73
 #define H_COP_HW	-74
 #define H_STATE		-75
+#define H_IN_USE	-77
 #define H_UNSUPPORTED_FLAG_START	-256
 #define H_UNSUPPORTED_FLAG_END		-511
 #define H_MULTI_THREADS_ACTIVE	-9005
@@ -321,9 +322,19 @@
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
+#define H_PKS_GET_CONFIG	0x41C
+#define H_PKS_SET_PASSWORD	0x420
+#define H_PKS_GEN_PASSWORD	0x424
+#define H_PKS_GET_OBJECT_LABELS 0x428
+#define H_PKS_WRITE_OBJECT	0x42C
+#define H_PKS_GEN_KEY		0x430
+#define H_PKS_READ_OBJECT	0x434
+#define H_PKS_REMOVE_OBJECT	0x438
+#define H_PKS_CONFIRM_OBJECT_FLUSHED	0x43C
 #define H_RPT_INVALIDATE	0x448
 #define H_SCM_FLUSH		0x44C
-#define MAX_HCALL_OPCODE	H_SCM_FLUSH
+#define H_PKS_SB_SIGNED_UPDATE	0x454
+#define MAX_HCALL_OPCODE	H_PKS_SB_SIGNED_UPDATE
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/include/asm/pks.h b/arch/powerpc/include/asm/pks.h
new file mode 100644
index 000000000000..ef6f541d75d3
--- /dev/null
+++ b/arch/powerpc/include/asm/pks.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 IBM Corporation
+ * Author: Nayna Jain
+ *
+ * Platform keystore for pseries.
+ */
+#ifndef _PSERIES_PKS_H
+#define _PSERIES_PKS_H
+
+
+#include <linux/types.h>
+#include <linux/list.h>
+
+struct pks_var {
+	char *prefix;
+	u8 *name;
+	u16 namelen;
+	u32 policy;
+	u16 datalen;
+	u8 *data;
+};
+
+struct pks_var_name {
+	u16 namelen;
+	u8  *name;
+};
+
+struct pks_var_name_list {
+	u32 varcount;
+	struct pks_var_name *varlist;
+};
+
+struct pks_config {
+	u8 version;
+	u8 flags;
+	u32 rsvd0;
+	u16 maxpwsize;
+	u16 maxobjlabelsize;
+	u16 maxobjsize;
+	u32 totalsize;
+	u32 usedspace;
+	u32 supportedpolicies;
+	u64 rsvd1;
+} __packed;
+
+/**
+ * Successful return from this API  implies PKS is available.
+ * This is used to initialize kernel driver and user interfaces.
+ */
+extern struct pks_config *pks_get_config(void);
+
+/**
+ * Returns all the var names for this prefix.
+ * This only returns name list. If the caller needs data, it has to specifically
+ * call read for the required var name.
+ */
+int pks_get_var_ids_for_type(char *prefix, struct pks_var_name_list *list);
+
+/**
+ * Writes the specified var and its data to PKS.
+ * Any caller of PKS driver should present a valid prefix type for their
+ * variable. This is an exception only for signed variables exposed via
+ * sysfs which do not have any prefixes.
+ * The prefix should always start with '/'. For eg. '/sysfs'.
+ */
+extern int pks_write_var(struct pks_var var);
+
+/**
+ * Writes the specified signed var and its data to PKS.
+ */
+extern int pks_update_signed_var(struct pks_var var);
+
+/**
+ * Removes the specified var and its data from PKS.
+ */
+extern int pks_remove_var(char *prefix, struct pks_var_name vname);
+
+/**
+ * Returns the data for the specified variable.
+ */
+extern int pks_read_var(struct pks_var *var);
+
+#endif
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 2e57391e0778..32d0df84e611 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -147,6 +147,16 @@ config IBMEBUS
 	help
 	  Bus device driver for GX bus based adapters.
 
+config PSERIES_PKS
+	depends on PPC_PSERIES
+	tristate "Support for the Platform Key Storage"
+	help
+	  PowerVM provides an isolated Platform Keystore(PKS) storage
+	  allocation for each partition with individually managed
+	  access controls to store sensitive information securely. Select
+	  this config to enable operating system interface to hypervisor to
+	  access this space.
+
 config PAPR_SCM
 	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
 	tristate "Support for the PAPR Storage Class Memory interface"
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 41d8aee98da4..83eb665a742f 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
+obj-$(CONFIG_PSERIES_PKS)      += pks.o
diff --git a/arch/powerpc/platforms/pseries/pks.c b/arch/powerpc/platforms/pseries/pks.c
new file mode 100644
index 000000000000..df9334a4fb89
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/pks.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER platform keystore
+ * Copyright (C) 2010 IBM Corporation
+ *
+ * This pseries platform device driver provides access to
+ * variables stored in platform keystore.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <asm/hvcall.h>
+#include <asm/firmware.h>
+#include <linux/slab.h>
+#include <asm/pks.h>
+#include <asm/unaligned.h>
+#include <asm/machdep.h>
+#include <linux/string.h>
+
+#define MODULE_VERS "1.0"
+#define MODULE_NAME "pseries-pks"
+
+static bool configset;
+static struct pks_config *config;
+
+struct pks_var_name_one {
+	struct pks_var_name var;
+	struct list_head link;
+};
+
+LIST_HEAD(pks_var_name_list);
+
+static u64 labelcount;
+
+struct pks_auth {
+	u8 version;
+	u8 consumer;
+	__be64 rsvd0;
+	__be32 rsvd1;
+	__be16 passwordlength;
+	u8 password[32];
+} __attribute__ ((packed, aligned(16)));
+
+static struct pks_auth auth;
+
+static int pseries_status_to_err(int rc)
+{
+	int err;
+
+	switch (rc) {
+	case H_SUCCESS:
+		err = 0;
+		break;
+	case H_FUNCTION:
+		err = -ENXIO;
+		break;
+	case H_P2:
+	case H_P3:
+	case H_P4:
+	case H_P5:
+	case H_P6:
+		err = -EINVAL;
+		break;
+	case H_NOT_FOUND:
+		err = -ENOENT;
+		break;
+	case H_BUSY:
+		err = -EBUSY;
+		break;
+	case H_AUTHORITY:
+		err = -EPERM;
+		break;
+	case H_NO_MEM:
+		err = -ENOMEM;
+		break;
+	case H_RESOURCE:
+		err = -EEXIST;
+		break;
+	case H_TOO_BIG:
+		err = -EFBIG;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static int pks_gen_password(u8 *password[])
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	u8 consumer = 0x3;
+	int rc;
+
+	rc = plpar_hcall(H_PKS_GEN_PASSWORD,
+			retbuf,
+			consumer,
+			0,
+			virt_to_phys(*password),
+			config->maxpwsize);
+
+	return pseries_status_to_err(rc);
+}
+
+static int construct_auth(void)
+{
+	int rc = 0;
+	u8 *password;
+
+	auth.version = 1;
+	auth.consumer = 0x3;
+	auth.rsvd0 = 0;
+	auth.rsvd1 = 0;
+	auth.passwordlength = cpu_to_be16(config->maxpwsize);
+	password = kzalloc(config->maxpwsize, GFP_KERNEL);
+	if (!password)
+		return -ENOMEM;
+
+	rc = pks_gen_password(&password);
+	if (rc) {
+		if (rc == H_IN_USE) {
+			rc = 0;
+		} else {
+			pr_err("Failed setting password\n");
+			rc = pseries_status_to_err(rc);
+			goto err;
+		}
+	}
+	memcpy(auth.password, password, config->maxpwsize);
+
+err:
+	kfree(password);
+	return rc;
+}
+
+static bool validate_name(char *name)
+{
+	int i = 0;
+
+	for (i = 0; i < strlen(name); i++) {
+		if (!isalnum(name[i]) && (name[i] != '-')
+				      && (name[i] != '_')) {
+			pr_err("invalid name, should only contain alphanumeric,hyphen(-) or underscore(_)\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static int construct_label(char *prefix, u8 *name, u16 namelen, u8 **label)
+{
+	int varlen;
+
+	if (!label)
+		return -EINVAL;
+
+	if (!prefix) {
+		*label = kzalloc(namelen, GFP_KERNEL);
+		if (!*label)
+			return -ENOMEM;
+		memcpy(*label, name, namelen);
+	} else {
+		varlen = strlen(prefix) + namelen + 1;
+		*label = kzalloc(varlen, GFP_KERNEL);
+		if (!*label)
+			return -ENOMEM;
+
+		memcpy(*label, prefix, strlen(prefix));
+		(*label)[strlen(prefix)] = '/';
+		memcpy(*label + strlen(prefix) + 1, name, namelen);
+	}
+
+	return 0;
+}
+
+static int _pks_get_config(void)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc;
+	size_t size = sizeof(struct pks_config);
+
+	config = kzalloc(size, GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	rc = plpar_hcall(H_PKS_GET_CONFIG,
+			retbuf,
+			virt_to_phys(config),
+			size);
+
+	if (rc != H_SUCCESS)
+		return pseries_status_to_err(rc);
+
+	config->rsvd0 = be32_to_cpu(config->rsvd0);
+	config->maxpwsize = be16_to_cpu(config->maxpwsize);
+	config->maxobjlabelsize = be16_to_cpu(config->maxobjlabelsize);
+	config->maxobjsize = be16_to_cpu(config->maxobjsize);
+	config->totalsize = be32_to_cpu(config->totalsize);
+	config->usedspace =  be32_to_cpu(config->usedspace);
+	config->supportedpolicies =  be32_to_cpu(config->supportedpolicies);
+	config->rsvd1 = be64_to_cpu(config->rsvd1);
+
+	configset = true;
+
+	return rc;
+}
+
+static int get_objectlabels(void)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc = 0;
+	u16 bufsize = 1024;
+	u8 buf[1024];
+	int i;
+	int index;
+	u16 labelsize = 0;
+	u64 continuetoken = 0;
+	u64 count;
+	struct pks_var_name_one *vname = NULL;
+
+	do {
+		rc = plpar_hcall(H_PKS_GET_OBJECT_LABELS,
+				retbuf,
+				virt_to_phys(&auth),
+				continuetoken,
+				virt_to_phys(buf),
+				bufsize);
+
+		if (rc) {
+			rc = pseries_status_to_err(rc);
+			goto err;
+		}
+
+		count =  retbuf[0];
+		continuetoken = retbuf[1];
+		index = 0;
+		for (i = 0; i < count; i++) {
+			labelsize = be16_to_cpu(*(__be16 *)(&buf[index]));
+			vname = kzalloc(sizeof(struct pks_var_name_one),
+					GFP_KERNEL);
+			vname->var.namelen = labelsize;
+			vname->var.name = kzalloc(labelsize, GFP_KERNEL);
+			if (!vname->var.name) {
+				rc = -ENOMEM;
+				goto err;
+			}
+			index = index + 2;
+			memcpy(vname->var.name, buf + index, labelsize);
+			list_add(&vname->link, &pks_var_name_list);
+			index =  index + labelsize;
+		}
+		labelcount = labelcount + count;
+		pr_info("Total number of variables are %llu\n", labelcount);
+	} while (continuetoken != 0);
+err:
+	return rc;
+}
+
+int pks_get_var_ids_for_type(char *prefix, struct pks_var_name_list *list)
+{
+	int count = 0;
+	int idx = 0;
+	struct pks_var_name_one *vname = NULL;
+	u8 *name;
+	u16 namelen;
+
+	list_for_each_entry(vname, &pks_var_name_list, link) {
+		name = vname->var.name;
+		if (((!prefix) && (name[0] == '/'))
+		   || (prefix && (strncmp(name, prefix, strlen(prefix)))))
+			continue;
+		count++;
+	}
+
+	list->varcount = count;
+	list->varlist = kcalloc(count, sizeof(list->varlist), GFP_KERNEL);
+	if (!list->varlist)
+		return -ENOMEM;
+
+	list_for_each_entry(vname, &pks_var_name_list, link) {
+		name = (char *)vname->var.name;
+		if (((!prefix) && (name[0] == '/'))
+		   || (prefix && (strncmp(name, prefix, strlen(prefix)))))
+			continue;
+
+		if (!prefix)
+			namelen = vname->var.namelen;
+		else {
+			name = name + strlen(prefix) + 1;
+			namelen = strlen(name) + 1;
+		}
+		pr_debug("var is %s of size %d\n", name, namelen);
+
+		list->varlist[idx].namelen = namelen;
+		list->varlist[idx].name = kzalloc(namelen, GFP_KERNEL);
+		memcpy(list->varlist[idx].name, name, namelen);
+		idx++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(pks_get_var_ids_for_type);
+
+int pks_update_signed_var(struct pks_var var)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc;
+	u8 *label;
+	u16 varlen;
+	u8 *data = var.data;
+
+	if (var.prefix)
+		return -EINVAL;
+
+	if (!validate_name(var.name))
+		return -EINVAL;
+
+	rc = construct_label(var.prefix, var.name, var.namelen, &label);
+	if (rc)
+		return rc;
+
+	pr_info("Label to be written is %s of size %d\n", label, varlen);
+	varlen = strlen(label) + 1;
+	rc = plpar_hcall(H_PKS_SB_SIGNED_UPDATE,
+			retbuf,
+			virt_to_phys(&auth),
+			virt_to_phys(label),
+			varlen,
+			var.policy,
+			virt_to_phys(data),
+			var.datalen);
+
+	kfree(label);
+
+	return pseries_status_to_err(rc);
+}
+EXPORT_SYMBOL(pks_update_signed_var);
+
+int pks_write_var(struct pks_var var)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc;
+	u8 *label;
+	u16 varlen;
+	u8 *data = var.data;
+
+	if ((!var.prefix) || (var.prefix[0] != '/'))
+		return -EINVAL;
+
+	if (!validate_name(var.name))
+		return -EINVAL;
+
+	rc = construct_label(var.prefix, var.name, var.namelen, &label);
+	if (rc)
+		return rc;
+
+	pr_info("Label to be written is %s of size %d\n", label, varlen);
+	varlen = strlen(label) + 1;
+	rc = plpar_hcall(H_PKS_WRITE_OBJECT,
+			retbuf,
+			virt_to_phys(&auth),
+			virt_to_phys(label),
+			varlen,
+			var.policy,
+			virt_to_phys(data),
+			var.datalen);
+
+	kfree(label);
+
+	return pseries_status_to_err(rc);
+}
+EXPORT_SYMBOL(pks_write_var);
+
+int pks_remove_var(char *prefix, struct pks_var_name vname)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc;
+	u8 *label;
+	u16 varlen;
+
+	rc = construct_label(prefix, vname.name, vname.namelen, &label);
+	if (rc)
+		return rc;
+
+	varlen = strlen(label) + 1;
+	pr_info("Label to be removed is %s of size %d\n", label, varlen);
+	rc = plpar_hcall(H_PKS_REMOVE_OBJECT,
+			retbuf,
+			virt_to_phys(&auth),
+			virt_to_phys(label),
+			varlen);
+
+	kfree(label);
+
+	return pseries_status_to_err(rc);
+}
+EXPORT_SYMBOL(pks_remove_var);
+
+
+int pks_read_var(struct pks_var *var)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
+	int rc;
+	u16 outlen = config->maxobjsize;
+	u8 *label;
+	u8 *out;
+	u16 varlen;
+
+	rc = construct_label(var->prefix, var->name, var->namelen, &label);
+	if (rc)
+		return rc;
+
+	varlen = strlen(label) + 1;
+	pr_info("Label to be read %s of size %d\n", label, varlen);
+	out = kzalloc(outlen, GFP_KERNEL);
+	if (!out)
+		return -ENOMEM;
+
+	rc = plpar_hcall(H_PKS_READ_OBJECT,
+			retbuf,
+			virt_to_phys(&auth),
+			virt_to_phys(label),
+			varlen,
+			virt_to_phys(out),
+			outlen);
+
+	if (rc != H_SUCCESS) {
+		pr_err("Failed to read %d\n", rc);
+		rc = pseries_status_to_err(rc);
+		goto err;
+	}
+
+	var->datalen = retbuf[0];
+	var->policy = retbuf[1];
+
+	var->data = kzalloc(var->datalen, GFP_KERNEL);
+	if (!var->data) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	memcpy(var->data, out, var->datalen);
+err:
+	kfree(out);
+	kfree(label);
+
+	return rc;
+}
+EXPORT_SYMBOL(pks_read_var);
+
+struct pks_config *pks_get_config(void)
+{
+
+	if (!configset) {
+		if (_pks_get_config())
+			return NULL;
+	}
+
+	return config;
+}
+EXPORT_SYMBOL(pks_get_config);
+
+int __init pseries_pks_init(void)
+{
+	int rc = 0;
+	struct pks_var_name_one *vname = NULL;
+
+	rc = _pks_get_config();
+
+	if (rc) {
+		pr_err("Error initializing pks\n");
+		return rc;
+	}
+
+	rc = construct_auth();
+	if (rc)
+		return rc;
+
+	rc = get_objectlabels();
+	if (rc) {
+		pr_err("Getting object labels failed. Error initializing pks\n");
+		return rc;
+	}
+
+	list_for_each_entry(vname, &pks_var_name_list, link)
+		pr_info("name is %s\n", vname->var.name);
+
+	return rc;
+}
+arch_initcall(pseries_pks_init);
-- 
2.27.0

