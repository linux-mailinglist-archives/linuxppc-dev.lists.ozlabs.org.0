Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5935F4F85
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 07:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj3Jr3G8Lz3bkP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRJFBVi3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRJFBVi3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj3Bh74qjz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 16:33:16 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2952ZHfp007436;
	Wed, 5 Oct 2022 05:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wgJraBJ+kv/+5owNk0qxCkcHzpcCwUxWWIO56cKRbk4=;
 b=BRJFBVi3vAFT1FmrltP9yUA8CpJe6iQLbds9OxoZrTv4TVFiTdpInpBUx9hnlc90Ca9S
 kR3QumRWYryS7zMb4EyJNs3X10IpwRLqrmuQqJJowIkYP26QhK4LtLh5918NSom5SOc5
 no0qHcdb/7zbIDV6+NuITqorqfilbeeN8OVuW2y2CbtJFhjoYfbeaRigIn1AWRxPp7qd
 DaoNarIX+wM/HJn2un9sScwIiRDg6DoFUHlqKMxnxIYiiyyZ3RQXjasggDYQ01AsFICP
 JXqlA5PcVi/1TKANHiEow4bnkei3SrrTJiqSsYNJwAsNFqP4ks9mXklNz9ZHjW0B2/pI vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0bdt8hhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:56 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2955ShZY018076;
	Wed, 5 Oct 2022 05:32:55 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0bdt8hgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2955LQiL016281;
	Wed, 5 Oct 2022 05:32:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3jxd68uqmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2955Wpfq62456314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Oct 2022 05:32:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA2111C04A;
	Wed,  5 Oct 2022 05:32:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C112B11C050;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 94854605AB;
	Wed,  5 Oct 2022 16:32:49 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/6] static_call: Move static call selftest to static_call_selftest.c
Date: Wed,  5 Oct 2022 16:32:32 +1100
Message-Id: <20221005053234.29312-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005053234.29312-1-bgray@linux.ibm.com>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OUYJlhZgaFP1MvLcAAsw28cE3xbmIs0L
X-Proofpoint-GUID: 5934yXvFD-01wm9fjh43s1YTNChxzHGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050034
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These tests are out-of-line only, so moving them to the
their own file allows them to be run when an arch does
not implement inline static calls.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 kernel/Makefile               |  1 +
 kernel/static_call_inline.c   | 43 -----------------------------------
 kernel/static_call_selftest.c | 41 +++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 43 deletions(-)
 create mode 100644 kernel/static_call_selftest.c

diff --git a/kernel/Makefile b/kernel/Makefile
index 318789c728d3..8ce8beaa3cc0 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_KCSAN) += kcsan/
 obj-$(CONFIG_SHADOW_CALL_STACK) += scs.o
 obj-$(CONFIG_HAVE_STATIC_CALL) += static_call.o
 obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call_inline.o
+obj-$(CONFIG_STATIC_CALL_SELFTEST) += static_call_selftest.o
 obj-$(CONFIG_CFI_CLANG) += cfi.o
 
 obj-$(CONFIG_PERF_EVENTS) += events/
diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
index dc5665b62814..64d04d054698 100644
--- a/kernel/static_call_inline.c
+++ b/kernel/static_call_inline.c
@@ -498,46 +498,3 @@ int __init static_call_init(void)
 	return 0;
 }
 early_initcall(static_call_init);
-
-#ifdef CONFIG_STATIC_CALL_SELFTEST
-
-static int func_a(int x)
-{
-	return x+1;
-}
-
-static int func_b(int x)
-{
-	return x+2;
-}
-
-DEFINE_STATIC_CALL(sc_selftest, func_a);
-
-static struct static_call_data {
-      int (*func)(int);
-      int val;
-      int expect;
-} static_call_data [] __initdata = {
-      { NULL,   2, 3 },
-      { func_b, 2, 4 },
-      { func_a, 2, 3 }
-};
-
-static int __init test_static_call_init(void)
-{
-      int i;
-
-      for (i = 0; i < ARRAY_SIZE(static_call_data); i++ ) {
-	      struct static_call_data *scd = &static_call_data[i];
-
-              if (scd->func)
-                      static_call_update(sc_selftest, scd->func);
-
-              WARN_ON(static_call(sc_selftest)(scd->val) != scd->expect);
-      }
-
-      return 0;
-}
-early_initcall(test_static_call_init);
-
-#endif /* CONFIG_STATIC_CALL_SELFTEST */
diff --git a/kernel/static_call_selftest.c b/kernel/static_call_selftest.c
new file mode 100644
index 000000000000..246ad89f64eb
--- /dev/null
+++ b/kernel/static_call_selftest.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/static_call.h>
+
+static int func_a(int x)
+{
+	return x+1;
+}
+
+static int func_b(int x)
+{
+	return x+2;
+}
+
+DEFINE_STATIC_CALL(sc_selftest, func_a);
+
+static struct static_call_data {
+	int (*func)(int);
+	int val;
+	int expect;
+} static_call_data [] __initdata = {
+	{ NULL,   2, 3 },
+	{ func_b, 2, 4 },
+	{ func_a, 2, 3 }
+};
+
+static int __init test_static_call_init(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(static_call_data); i++ ) {
+		struct static_call_data *scd = &static_call_data[i];
+
+		if (scd->func)
+			static_call_update(sc_selftest, scd->func);
+
+		WARN_ON(static_call(sc_selftest)(scd->val) != scd->expect);
+	}
+
+	return 0;
+}
+early_initcall(test_static_call_init);
-- 
2.37.3

