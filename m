Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F4708F2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:08:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMvxw6sH1z3fhQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:08:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MO6nqOc0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MO6nqOc0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvqS2mbCz3f7F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:03:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4d94E030007;
	Fri, 19 May 2023 05:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IzTFR0pBvx+W9Vosoam3gUtu6oVaqzJFXeir+Vwh9IE=;
 b=MO6nqOc0cXerISDUVu54YmHFn2xZHMqChoP+wMHdvCWSV2bZFh3jhebVRwn7ZTjzsv4D
 lX23etDwYQHcBZIQvGViWYx0t/jjLOeG8E9XuP7cGUTm4sbRQg1O9kuRB08+bmPrv+I5
 y9j0uw1JadZJUDWqA1fyRvOnhi5beVdBB5fz3yXBmAAMIEBDTF8v4Hkk5H/64tWoW4LB
 adSrVaTu45qIYcukdwXJLcTOuKTuSjBjHeb0N5/ewNmCuBIPhk1gEmcKYBkEWLjCg5a8
 NrSO7D0hd7Oi46S/nbPh955wh33NZLRm0dggkF3th7a7WZ+GuNxmblQztQqDl12cAEzO 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp1ffsywv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:55 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J52tQR016488;
	Fri, 19 May 2023 05:02:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp1ffsyv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4btGn003922;
	Fri, 19 May 2023 05:02:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3qj264tfqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52oAP17433130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7555720040;
	Fri, 19 May 2023 05:02:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBB882004B;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 92DF760648;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/12] selftests/powerpc: Add more utility macros
Date: Fri, 19 May 2023 15:02:34 +1000
Message-Id: <20230519050236.144847-11-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WRcYam2BKzpJ8WtwxwcAQ_iJ-9XgKgUO
X-Proofpoint-GUID: IIk6Hg-SIqqlFX3WzxpT6J1w8vBjdZHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190038
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

