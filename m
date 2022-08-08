Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9058CB7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 17:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1gXL1qCFz3drp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 01:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/zuB6j7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/zuB6j7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1gVC3HGSz2xn6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 01:44:02 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278EnZYQ024030;
	Mon, 8 Aug 2022 15:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vCkjYYMr8qi+Dx9V5Urxb8UXElS0dbRq92qE6ZnPnaE=;
 b=V/zuB6j7JbxrQX/EQlMfEBUCyYbhdRKQ3Oen+m3kKrnc2BP2VT63Kwi+CwOPVswnhvLC
 57ZKFRKdG0tzqW94IkgXCNvn69kmXhyyKV0rtPxm2gNM4tIzaMnF0bOxSWpf2ZY8o+Wa
 REc1/SffV1JZ7wiVKV8exEHtckG1NhJaHeVVpL84iziRCT53EQ3AozvGuAZVqKd2ewZa
 G7DxtgaxTtECnYaSr3EhYox7zQnCXVoCFVpo4kJm1+HHEvKpeweW4nxxPEwfTWRxhPwv
 gH8NuZxu2S064q/6VYcqIQfejk3EvxvLai4JUeSWKmsTbpQMsI9mPjkJk61VT/5Nv+ib qQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu4kf9t3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 15:43:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278FZqlK014644;
	Mon, 8 Aug 2022 15:43:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma04dal.us.ibm.com with ESMTP id 3hsfx98rgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 15:43:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278FhoqD15663370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 15:43:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CDD278063;
	Mon,  8 Aug 2022 15:43:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD42078060;
	Mon,  8 Aug 2022 15:43:48 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.34.213])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 15:43:48 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3a 1/2] lib: generic accessor functions for arch keystore
Date: Mon,  8 Aug 2022 10:43:44 -0500
Message-Id: <20220808154345.11240-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220808154345.11240-1-gjoyce@linux.vnet.ibm.com>
References: <20220808154345.11240-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3jKGgdTabMg7G_nunuX-UgB3NGt8eIGU
X-Proofpoint-GUID: 3jKGgdTabMg7G_nunuX-UgB3NGt8eIGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_10,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080075
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
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

