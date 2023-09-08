Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0D798A06
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 17:32:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b1oUiUMx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj0TX66ZZz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 01:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b1oUiUMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj0Sf6b0gz3c2n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 01:31:14 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388FO618013570;
	Fri, 8 Sep 2023 15:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l6VGKnMpb7HcR/ids8pl2nLjXlvBvwc5u/3q+Et+C3M=;
 b=b1oUiUMxW5reQbd274axviXkRkzGh3D0/iCh4EZXN8W0cJKm0cvsbVHdwkR6AM0DxbjS
 wnUAqMunimMXWQTUVWez/4icZp9G9c54yf/DErinQDVZNwf6aH+fRe1gyuCbkjPeYxzE
 xGHSEO7FZlJKFm3ieMKPdLIYRdi5NiN+6TGpQdQSEe0AQzmweCYtFbPf6q58ehB+RmDT
 iUepNkPh2h+r7lWBbWkkUR/9pDBMxkhaV9R9r5W4+b61vILibk49tz0tmqhmCkrs6xH3
 BsanJvmkJSDVi/O2Kv78yF86/x8ft46pqLJNAVYb9x3cjOtwvZl6rQX7REtZc4+q5vbc XA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t067n06bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 15:31:00 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388EuAsv001603;
	Fri, 8 Sep 2023 15:30:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfctcya2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 15:30:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388FUxwl40370706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 15:30:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFF7B5806A;
	Fri,  8 Sep 2023 15:30:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BE5D5805F;
	Fri,  8 Sep 2023 15:30:57 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.45.202])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 15:30:57 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org, axboe@kernel.dk, jarkko@kernel.org
Subject: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
Date: Fri,  8 Sep 2023 10:30:54 -0500
Message-Id: <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ysYyZ0SFwqSDvruc3yRw4or0yYl8d6x0
X-Proofpoint-ORIG-GUID: ysYyZ0SFwqSDvruc3yRw4or0yYl8d6x0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=673 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080139
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
Cc: gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Add read and write functions that allow SED Opal keys to stored
in a permanent keystore.

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
index 46ada9dc8bbf..ea07d80402a6 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
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

