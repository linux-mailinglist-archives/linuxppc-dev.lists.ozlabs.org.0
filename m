Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BD63E1E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 21:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMrKx1pBVz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEO1p93u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEO1p93u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMrJw0lKRz3bWX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 07:24:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUJCeRN011520;
	Wed, 30 Nov 2022 20:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O7nuDdT3BHM9Rrkwe/m8KPLCCsBsTZzLvZjXej86CYA=;
 b=hEO1p93up5smIH+O/YBaeinkrl77hrNMV9r2wNQHgDa6JwhutgAhdO+n/rnOvUC707VW
 h2fBkCF8l5MTy+wz/KKLHFCoNEs21TxN0PiYd20L51KymJ6bb7eUO65lCmcvMLqzgieL
 iMbE7gw1O++uUPfljdmqywwWEa9zeruR9lcci/rDPNSgndnsxmfcfw2kUATjZRr7qIsz
 imOMu0J8wNrYcsGiRVnwFCFF3nbH4MiebO+MrdnS9y8dnOOSQnBoJGdOe/DTTxzV6plL
 rLYpniRBA24/v/ZAgDmlipqnrU4xd7kVLrUSQoDDhatgzCFMc2YwF7fgAHryeXO/God8 2Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6bednhxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUKLWDs009268;
	Wed, 30 Nov 2022 20:24:04 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com with ESMTP id 3m3aeae0xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 20:24:04 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AUKO2bA18809248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Nov 2022 20:24:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E08FD58057;
	Wed, 30 Nov 2022 20:24:02 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D376A5805D;
	Wed, 30 Nov 2022 20:24:01 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Nov 2022 20:24:01 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v5 1/3] block: sed-opal: SED Opal keystore
Date: Wed, 30 Nov 2022 14:23:56 -0600
Message-Id: <20221130202358.18034-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221130202358.18034-1-gjoyce@linux.vnet.ibm.com>
References: <20221130202358.18034-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kp5VP5INL-gVFANvRbsVQmm5jfZc80CX
X-Proofpoint-GUID: kp5VP5INL-gVFANvRbsVQmm5jfZc80CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=835 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
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

Add read and write functions that allow SED Opal keys to stored
in a permanent keystore.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/Makefile               |  2 +-
 block/sed-opal-key.c         | 23 +++++++++++++++++++++++
 include/linux/sed-opal-key.h | 15 +++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
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
index 000000000000..32ef988cd53b
--- /dev/null
+++ b/block/sed-opal-key.c
@@ -0,0 +1,23 @@
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

