Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6571F620
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLfL1FGtz3ffC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qUilQuIZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qUilQuIZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLbd14rtz3f0Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:37:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351MDfFT024682;
	Thu, 1 Jun 2023 22:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O0ouo6HIsouvjAJpKT4TYrxv/VbC3AvuViTvaEZgOBw=;
 b=qUilQuIZL2a7VlBVfZ7/7LhaaNaJ/eqIeLLiOIIag5f+BkBuY+7Hgd1Y2i+vMWpvA50r
 K2gt58jKqJSN1WYALz4wRTvm5kDWEr/YWd55Afg4U47oiHntLs8qAr6djl1XpWfU9ZbC
 j+5XmH9R9nAGXTO2xLE8BYbA1KuL5Eyy0H6DVQRrlfMNhV482I5+PwZFT/qWftqJsP53
 4cQZxdjMVq77XKFObAV+S/Brfhqtw5As/QRs8jeT2UqpahNPWhcmDtaXzw5ySRX6ZWqS
 bK1GfuFA3qO7bOHXcVVK0O1ApAjIs+78qWkqRXcr8+KsYXuIGTjdfz/1alOR3OZUn6Sp Tw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qy3xf0dd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:34 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351IVaX7012669;
	Thu, 1 Jun 2023 22:36:33 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g6452t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:33 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351MaWeR19726780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 22:36:33 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB42F58062;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2638958056;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v6 1/3] block:sed-opal: SED Opal keystore
Date: Thu,  1 Jun 2023 17:36:28 -0500
Message-Id: <20230601223630.2136006-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230601223630.2136006-1-gjoyce@linux.vnet.ibm.com>
References: <20230601223630.2136006-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RFiaf9sIPQMHvgEZSsWUZKlR5FGkzgRF
X-Proofpoint-GUID: RFiaf9sIPQMHvgEZSsWUZKlR5FGkzgRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=816 priorityscore=1501
 mlxscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010194
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

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

Add read and write functions that allow SED Opal authentication keys
to be stored in a permanent keystore.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/Makefile               |  2 +-
 block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
 include/linux/sed-opal-key.h | 15 +++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 block/sed-opal-key.c
 create mode 100644 include/linux/sed-opal-key.h

diff --git a/block/Makefile b/block/Makefile
index 4e01bb71ad6e..464a9f209552 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
 obj-$(CONFIG_BLK_WBT)		+= blk-wbt.o
 obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
-obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
+obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o sed-opal-key.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
new file mode 100644
index 000000000000..16f380164c44
--- /dev/null
+++ b/block/sed-opal-key.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SED key operations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for SED Opal
+ * keys. Specific keystores can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/sed-opal-key.h>
+
+int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
+{
+	return -EOPNOTSUPP;
+}
+
+int __weak sed_write_key(char *keyname, char *key, u_int keylen)
+{
+	return -EOPNOTSUPP;
+}
diff --git a/include/linux/sed-opal-key.h b/include/linux/sed-opal-key.h
new file mode 100644
index 000000000000..c9b1447986d8
--- /dev/null
+++ b/include/linux/sed-opal-key.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SED key operations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for SED Opal
+ * keys. Specific keystores can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+
+int sed_read_key(char *keyname, char *key, u_int *keylen);
+int sed_write_key(char *keyname, char *key, u_int keylen);
-- 
gjoyce@linux.vnet.ibm.com

