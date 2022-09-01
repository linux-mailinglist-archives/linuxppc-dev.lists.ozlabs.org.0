Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568C5A8E98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBS02Gb8z3dQt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:47:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i48Nyria;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i48Nyria;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ9Mk6scRz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 15:58:42 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815KkiG013254;
	Thu, 1 Sep 2022 05:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=owaUQuuOjkD4sGAwPAWhoYDbmGg7zVh4iCrv+cHZOd4=;
 b=i48Nyria+0lseNhk9quiKa2Tho5lbmX9xPgtzxb6ri+zPaZmp3Ym2v91RaA/jcwPy4f/
 aHwcr9PCSR36B9GZeYS4iQEZ2D6ZkzsNn156P2PEY1cjDtndlYvciuRO3H+xTngzf5A0
 aduIYkFLCn0aqIM/OdTs/jsbMTjyQUtoT5SzJDk3lpdt/FTmyyJay8x4oKLPRIJNxduY
 gTE7TgoAoaNiF6KdkLr/5pjg0PiEZT29TxH+1ytI4DPJkeLWAETLh3ZUHGqRzf3N6WDK
 Uv47zkbHXS3lyeZ0Zbf1BcU+Lnsd9PVLhQoJCA2Ca2HaE7U/+A38M6/ytYD/lfhDa0my Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japgu18bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2815KuXl013965;
	Thu, 1 Sep 2022 05:58:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japgu18ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:36 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2815oq22001937;
	Thu, 1 Sep 2022 05:58:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3j7aw8vhbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2815wVH237617988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 05:58:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A43F52050;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 255F25204F;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D36C460257;
	Thu,  1 Sep 2022 15:58:28 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/4] static_call: Move static call selftest to static_call.c
Date: Thu,  1 Sep 2022 15:58:21 +1000
Message-Id: <20220901055823.152983-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901055823.152983-1-bgray@linux.ibm.com>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7ePwlezPZ90PNkbl5y2UQDcD901QiciE
X-Proofpoint-ORIG-GUID: XNehHQZiANI7ULRyw7QiC_z4UToZJSka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_03,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=879 mlxscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010022
X-Mailman-Approved-At: Thu, 01 Sep 2022 16:45:35 +1000
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
Cc: christophe.leroy@c-s.fr, Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These tests are out-of-line only, so moving them to the
out-of-line file allows them to be run when an arch does
not implement inline static calls.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 kernel/static_call.c        | 43 +++++++++++++++++++++++++++++++++++++
 kernel/static_call_inline.c | 43 -------------------------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/kernel/static_call.c b/kernel/static_call.c
index e9c3e69f3837..953ec46e5691 100644
--- a/kernel/static_call.c
+++ b/kernel/static_call.c
@@ -6,3 +6,46 @@ long __static_call_return0(void)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__static_call_return0);
+
+#ifdef CONFIG_STATIC_CALL_SELFTEST
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
+
+#endif /* CONFIG_STATIC_CALL_SELFTEST */
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
-- 
2.37.2

