Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206785E99D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYGx4r35z3c8c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLJYLPl3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLJYLPl3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYCM1TXjz2xvJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZRB6020407;
	Mon, 26 Sep 2022 06:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9zEaH0k5pQzIL+oDYeijzfgTk3gU9Gj6CrTIUIx03i4=;
 b=ZLJYLPl3zJB23cd1erCUMH25CU6LvDRylhM0oGFW/Bl9ODtgQJwINCzDU+FDwQIxpJ0t
 Y4uyqUmXbYL0EWQknG+Y+3mPe37LbjzFAr3kx3AWXUwW7Teplsteb0Puxi4l1j7icknl
 WTHnUxAgMOgjTQjDaRqDgsws9ONptSB98h4A1Lm5VEg7iyuUwcaOwhxUorJR7uhfZiYr
 +4EOhpauQoWcwSM5ujWx0XKk7Enf16BLn/M+I0HWt3ocGjlxurd9c78FKI1b8WmzZTNR
 UEqUbF9NVFVrWw6IwYDgZE8e180NF23F2OXbAwRmVqdAdqEJqI5oPDo+DQWdTEPkLvx4 Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbvf4h8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q5RbNf026269;
	Mon, 26 Sep 2022 06:44:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbvf4h7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZM8O023324;
	Mon, 26 Sep 2022 06:43:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3jss5j20fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6huRw63373708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:43:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E49A8AE045;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32426AE04D;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 044DB60593;
	Mon, 26 Sep 2022 16:43:54 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] static_call: Move static call selftest to static_call_selftest.c
Date: Mon, 26 Sep 2022 16:43:14 +1000
Message-Id: <20220926064316.765967-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xqs2FmEPUG_Yi7NBEHAbXobE34nGPyGp
X-Proofpoint-ORIG-GUID: -A5bfWcKz4E1ADS6one7XUcKc2rELFp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260039
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These tests are out-of-line only, so moving them to the
their own file allows them to be run when an arch does
not implement inline static calls.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
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

