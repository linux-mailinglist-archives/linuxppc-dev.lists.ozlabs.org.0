Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E96C4266
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHgk73kbz3fJ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:52:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWb9JbKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWb9JbKW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXj4hfnz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:45 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M5Fcbl020721
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iL3ZCCVTMqVaoMh7hDKdFlmSMDWy/dXgATPReWyT/hE=;
 b=MWb9JbKW9xO9QckKYHF9bTICnOYQOYk6RIECwmoFE9YWpeq//SHq2EX9QWnogHShJ5C5
 NlnAgYYif0711PyqE/jiJ4psC3s6GvW0uzcM4Azqsnr7p88Ddrg+0Z09LashaaNFcgYJ
 J0ye07AA4m66E1Zh5Ss9gRU9wpOVrJEaPBEi+4kU+6mcQL9ovq+wKvZriORSNWaj0Tva
 mBPhRb/OUpsRbhZe8viV+qiO/fpTWvqji2HaehZyYAWY5QXuESpC5dZWLiOvaxx+QBQf
 ndssZELX0Mmx0f+wY15nMWGm4p/9fa7ZRzcsiXStbA2wdo9AbgXv0J+rtmB+C3l/4jb+ SA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfucb0f22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:43 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M298VC014687
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6cjra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kcfh48365846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FB102004F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94B6E20043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8BDF4606F4;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/9] selftests/powerpc: Add more utility macros
Date: Wed, 22 Mar 2023 16:46:10 +1100
Message-Id: <20230322054612.1340573-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8jn_KN1vhWHQJEJPTNvG9jK8yj3nbKuE
X-Proofpoint-GUID: 8jn_KN1vhWHQJEJPTNvG9jK8yj3nbKuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220039
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Include unistd.h for _exit()
* Include stdio.h for fprintf()
* Adds _MSG assertion variants to provide more context behind why a
  failure occurred.
* Move ARRAY_SIZE macro to utils.h

The _MSG variants and ARRAY_SIZE will be used by the following
DEXCR selftests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1:	* Remove the signal handler variants
	* Describe why headers are included
---
 .../testing/selftests/powerpc/include/utils.h | 27 ++++++++++++++++++-
 .../powerpc/pmu/sampling_tests/misc.h         |  2 --
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index eed7dd7582b2..65b242842ff5 100644
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
@@ -64,7 +70,6 @@ struct perf_event_read {
 };
 
 #if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 30)
-#include <unistd.h>
 #include <sys/syscall.h>
 
 static inline pid_t gettid(void)
@@ -113,6 +118,16 @@ do {								\
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
@@ -122,6 +137,16 @@ do {								\
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
2.39.2

