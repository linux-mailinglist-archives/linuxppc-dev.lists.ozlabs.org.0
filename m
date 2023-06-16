Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182E73260D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:58:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqHxAse+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj53r5lT8z3cTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqHxAse+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4t72W0Wz30gs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:51 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3lfV6020467;
	Fri, 16 Jun 2023 03:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IzTFR0pBvx+W9Vosoam3gUtu6oVaqzJFXeir+Vwh9IE=;
 b=tqHxAse+wjg58E3PpSYnq9OJDGIs9yiwOn1LHyzyjySc8+THYBzfn65PtasjnvqcL2o7
 n9vhEgg6XmnoX4SXmz01YQa2YoDyYVky0zJehiiooNBDM8to2ZKhG1qHom2g0vYzQM2l
 9pAQGxm1Gx1i321rJWzt1UU7Vp4iFGKcxgboulYwzC48QdWDMx+++s1qcCqf5nGgu2Ag
 tgKA91R+vbHLG8f96IGYSM96cWswItHPRzaRyHOOzCMEFq3f3zsO2UxIgM2F4NCG+cGY
 0NNc1/AdWsvffog6e074JDR81uqzOtYTs2E5YyNt6Bl3l0v8N7YS6RW0LvB8NQ4y8bEU AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g4yr0r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:47 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3nkWT026004;
	Fri, 16 Jun 2023 03:49:46 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g4yr0qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:46 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3d79q021607;
	Fri, 16 Jun 2023 03:49:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r4gedu1mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nf9d63701474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB29520043;
	Fri, 16 Jun 2023 03:49:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 654AE20040;
	Fri, 16 Jun 2023 03:49:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:41 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6227160125;
	Fri, 16 Jun 2023 13:49:37 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/11] selftests/powerpc: Add more utility macros
Date: Fri, 16 Jun 2023 13:48:44 +1000
Message-Id: <20230616034846.311705-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RQzq_gWVObcl2TNYtBmhTccG5uEsdqtl
X-Proofpoint-GUID: hf9H1D7epo_zYw65SXopbt7hse6VzBTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds _MSG assertion variants to provide more context behind why a
failure occurred. Also include unistd.h for _exit() and stdio.h for
fprintf(), and move ARRAY_SIZE macro to utils.h.

The _MSG variants and ARRAY_SIZE will be used by the following
DEXCR selftests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Reword commit message
	* Add ruscur reviewed-by
v1:	* Remove the signal handler variants
	* Describe why headers are included
---
 .../testing/selftests/powerpc/include/utils.h | 27 ++++++++++++++++++-
 .../powerpc/pmu/sampling_tests/misc.h         |  2 --
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 44bfd48b93d6..9dc53c4fbfe3 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -9,11 +9,17 @@
 #define __cacheline_aligned __attribute__((aligned(128)))
 
 #include <stdint.h>
+#include <stdio.h>
 #include <stdbool.h>
 #include <linux/auxvec.h>
 #include <linux/perf_event.h>
 #include <asm/cputable.h>
 #include "reg.h"
+#include <unistd.h>
+
+#ifndef ARRAY_SIZE
+# define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+#endif
 
 /* Avoid headaches with PRI?64 - just use %ll? always */
 typedef unsigned long long u64;
@@ -67,7 +73,6 @@ struct perf_event_read {
 };
 
 #if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 30)
-#include <unistd.h>
 #include <sys/syscall.h>
 
 static inline pid_t gettid(void)
@@ -116,6 +121,16 @@ do {								\
 	}							\
 } while (0)
 
+#define FAIL_IF_MSG(x, msg)					\
+do {								\
+	if ((x)) {						\
+		fprintf(stderr,					\
+		"[FAIL] Test FAILED on line %d: %s\n", 		\
+		__LINE__, msg);					\
+		return 1;					\
+	}							\
+} while (0)
+
 #define FAIL_IF_EXIT(x)						\
 do {								\
 	if ((x)) {						\
@@ -125,6 +140,16 @@ do {								\
 	}							\
 } while (0)
 
+#define FAIL_IF_EXIT_MSG(x, msg)				\
+do {								\
+	if ((x)) {						\
+		fprintf(stderr,					\
+		"[FAIL] Test FAILED on line %d: %s\n", 		\
+		__LINE__, msg);					\
+		_exit(1);					\
+	}							\
+} while (0)
+
 /* The test harness uses this, yes it's gross */
 #define MAGIC_SKIP_RETURN_VALUE	99
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 4181755cf5a0..64e25cce1435 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -18,8 +18,6 @@
 #define MMCR1_RSQ       0x200000000000ULL /* radix scope qual field */
 #define BHRB_DISABLE    0x2000000000ULL /* MMCRA BHRB DISABLE bit */
 
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-
 extern int ev_mask_pmcxsel, ev_shift_pmcxsel;
 extern int ev_mask_marked, ev_shift_marked;
 extern int ev_mask_comb, ev_shift_comb;
-- 
2.40.1

