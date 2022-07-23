Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C168457EF0A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 13:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqkh948y1z3drw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 21:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n0u0lAXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n0u0lAXC;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqkf04ccKz2xkc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 21:31:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26NBMWel006481;
	Sat, 23 Jul 2022 11:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vCkjYYMr8qi+Dx9V5Urxb8UXElS0dbRq92qE6ZnPnaE=;
 b=n0u0lAXCx2sjNtXjtpOhDBKBGwfmB0lH3OnLdhj6fQ9ETUtiPd5rK3Pbiul4H3khYU6O
 8gCa8IJFssju4MLDpOTwboafd/Pz6/9C8D3ZSPsPMS/1cgk2UCaJh/G67znhh+99+Lbs
 wuGVDK87aLm8VUdtqSCE14xHNTdB2Jj0eRHPvRIMRD1U9moDzvoskQKVD1/aCRMwJUfq
 +g/O2gLZj3iCpuA/jHNsXThZxr4HFXAgdn9+cAdsYnx56V32obd5YGP5FAaxOgl6npjo
 pLpMh36NtREgYF8dzPpYKmPuhtn/fOz8/UjvltPtnI8mtH0Hhh+GuBo2lyX28zWPCJsa tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgg2d0337-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:11 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26NBVBNb001529;
	Sat, 23 Jul 2022 11:31:11 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgg2d032m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:11 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26NBJoAj007070;
	Sat, 23 Jul 2022 11:31:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3hg95y887d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26NBV64n25428432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 Jul 2022 11:31:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52597A4051;
	Sat, 23 Jul 2022 11:31:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33FD5A4040;
	Sat, 23 Jul 2022 11:31:04 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.163.18.137])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 23 Jul 2022 11:31:03 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] lib: define generic accessor functions for arch specific keystore
Date: Sat, 23 Jul 2022 07:30:47 -0400
Message-Id: <20220723113048.521744-3-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220723113048.521744-1-nayna@linux.ibm.com>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WXxENLjhMPQ7U5GOqzSXA7jX1pjFnW9X
X-Proofpoint-ORIG-GUID: KpZUjcPKEleQC_EdXdS4tMN1Sr3g5H_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207230049
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

Generic kernel subsystems may rely on platform specific persistent
KeyStore to store objects containing sensitive key material. In such case,
they need to access architecture specific functions to perform read/write
operations on these variables.

Define the generic variable read/write prototypes to be implemented by
architecture specific versions. The default(weak) implementations of
these prototypes return -EOPNOTSUPP unless overridden by architecture
versions.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 include/linux/arch_vars.h | 23 +++++++++++++++++++++++
 lib/Makefile              |  2 +-
 lib/arch_vars.c           | 25 +++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c

diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
new file mode 100644
index 000000000000..9c280ff9432e
--- /dev/null
+++ b/include/linux/arch_vars.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Platform variable opearations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for architecture specific
+ * variables. Specific architectures can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+
+enum arch_variable_type {
+	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
+	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
+	ARCH_VAR_MAX           = 1,     /* Maximum type value */
+};
+
+int arch_read_variable(enum arch_variable_type type, char *varname,
+		       void *varbuf, u_int *varlen);
+int arch_write_variable(enum arch_variable_type type, char *varname,
+			void *varbuf, u_int varlen);
diff --git a/lib/Makefile b/lib/Makefile
index f99bf61f8bbc..b90c4cb0dbbb 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o \
 	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o
+	 generic-radix-tree.o arch_vars.o
 obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
diff --git a/lib/arch_vars.c b/lib/arch_vars.c
new file mode 100644
index 000000000000..e6f16d7d09c1
--- /dev/null
+++ b/lib/arch_vars.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform variable operations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for architecture specific
+ * variables. Specific architectures can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/arch_vars.h>
+
+int __weak arch_read_variable(enum arch_variable_type type, char *varname,
+			      void *varbuf, u_int *varlen)
+{
+	return -EOPNOTSUPP;
+}
+
+int __weak arch_write_variable(enum arch_variable_type type, char *varname,
+			       void *varbuf, u_int varlen)
+{
+	return -EOPNOTSUPP;
+}
-- 
2.27.0

