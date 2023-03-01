Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444CB6A71DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:11:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRgkd0Gprz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 04:11:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kX0OuRux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kX0OuRux;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRghn5qKCz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 04:10:01 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 321Fnhvr013114;
	Wed, 1 Mar 2023 17:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q3yISbL596Xf6C2+YeXvyQa2NArgF4/wQPTX5Ez7OyM=;
 b=kX0OuRux1nxRmWh/qoSXwlYLxdd0Kk2ruv/b+oq3V5Rwx1pLRv6uX53RTe6n0nuz17rT
 FfH+HNLM8gUiZFkiWt0PznSFcx3qKBkH5SO8kfRpKiR+LPupx94agKMa18BfWIUyPd2O
 9MK8w31Fqvj/6mejY1L/IGIfXbg/KpQ/OYTKeSWaS9rGBrUqJtzNHFWanFhhPKeX+pKN
 DYJj6/jD0Q4DeZZERjUToLSZXTE7N2c/OpiH1X7OiCHQnC9ZcbX1qDiXgK+yc7Q3axC6
 GkfCBCsU6Sd6ItanTKYPWpW6N9DNBUidxuG3o/AkWQwypsoUHpeChz8tsGQgqWxJkcAi QA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p29phjdbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 17:09:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31SM0j8p024684;
	Wed, 1 Mar 2023 17:09:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nybdfuf2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 17:09:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 321H9nYv66584890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Mar 2023 17:09:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2683C2004F;
	Wed,  1 Mar 2023 17:09:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C36920043;
	Wed,  1 Mar 2023 17:09:47 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.25.125])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Mar 2023 17:09:47 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] selftests/powerpc/pmu: fix including of utils.h when event.h is included
Date: Wed,  1 Mar 2023 22:39:18 +0530
Message-Id: <20230301170918.69176-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230301170918.69176-1-kjain@linux.ibm.com>
References: <20230301170918.69176-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zy103QF3_XzLh6WchTZCkie2x1sq2F3c
X-Proofpoint-GUID: Zy103QF3_XzLh6WchTZCkie2x1sq2F3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010141
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

event.h header already includes utlis.h. Avoid including
the same explicitly in the code when event.h included.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/count_instructions.c         | 1 -
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c            | 1 -
 .../powerpc/pmu/event_code_tests/group_constraint_cache_test.c   | 1 -
 .../pmu/event_code_tests/group_constraint_l2l3_sel_test.c        | 1 -
 .../pmu/event_code_tests/group_constraint_thresh_cmp_test.c      | 1 -
 .../pmu/event_code_tests/group_constraint_thresh_ctl_test.c      | 1 -
 .../pmu/event_code_tests/group_constraint_thresh_sel_test.c      | 1 -
 .../powerpc/pmu/event_code_tests/group_constraint_unit_test.c    | 1 -
 .../powerpc/pmu/event_code_tests/hw_cache_event_type_test.c      | 1 -
 tools/testing/selftests/powerpc/pmu/l3_bank_test.c               | 1 -
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c         | 1 -
 .../selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c  | 1 -
 .../powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c       | 1 -
 .../powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c  | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c    | 1 -
 .../powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c        | 1 -
 .../powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c          | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c    | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c     | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c       | 1 -
 .../powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c       | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c    | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c       | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c        | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c   | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c  | 1 -
 .../pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c       | 1 -
 .../powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c         | 1 -
 .../powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c        | 1 -
 .../selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c | 1 -
 .../powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c | 1 -
 32 files changed, 32 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/count_instructions.c b/tools/testing/selftests/powerpc/pmu/count_instructions.c
index a3984ef1e96a..a0f77065a1e0 100644
--- a/tools/testing/selftests/powerpc/pmu/count_instructions.c
+++ b/tools/testing/selftests/powerpc/pmu/count_instructions.c
@@ -11,7 +11,6 @@
 #include <sys/prctl.h>
 
 #include "event.h"
-#include "utils.h"
 #include "lib.h"
 
 extern void thirty_two_instruction_loop(u64 loops);
diff --git a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
index 2070a1e2b3a5..07ddac28d3cf 100644
--- a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
+++ b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
@@ -11,7 +11,6 @@
 #include <sys/prctl.h>
 
 #include "event.h"
-#include "utils.h"
 #include "lib.h"
 
 extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
index f4be05aa3a3d..ad529b8a03ba 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /* All L1 D cache load references counted at finish, gated by reject */
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
index 85a636886069..b2fa5fc54545 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /* All successful D-side store dispatches for this thread */
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
index 9f1197104e8c..d77a730e00df 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /*
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
index e0852ebc1671..f8b79953655a 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /*
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
index 50a8cd843ce7..05eb1cf6c5f9 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /*
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
index a2c18923dcec..151c0b1cff11 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /* All successful D-side store dispatches for this thread with PMC 2 */
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
index a45b1da5b568..8020be598d9d 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "../event.h"
-#include "utils.h"
 #include "../sampling_tests/misc.h"
 
 /*
diff --git a/tools/testing/selftests/powerpc/pmu/l3_bank_test.c b/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
index a5dfa9bf3b9f..29b3039f8fde 100644
--- a/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
+++ b/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 
 #include "event.h"
-#include "utils.h"
 
 #define MALLOC_SIZE     (0x10000 * 10)  /* Ought to be enough .. */
 
diff --git a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
index ad32a09a6540..5d00220b62ba 100644
--- a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
+++ b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
@@ -14,7 +14,6 @@
 
 #include "event.h"
 #include "lib.h"
-#include "utils.h"
 
 /*
  * Test that per-event excludes work.
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 3f43c315c666..6a639f255bfa 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /*
  * A perf sampling test to check bhrb filter
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
index 4644c6782974..a6deba5dea00 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /*
  * A perf sampling test for making sure
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
index 839d2d225da0..a8c1197a577d 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /*
  * A perf sampling test for making sure
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c
index ae4172f83817..c560073f0f2c 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
index 982aa56d2171..f10e5de08302 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
index 1c1813c182c0..02d32a5d81ef 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
index 332d24b5ab9c..918f72c90e20 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c
index dfd186cd8eec..26c5e3219d8b 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c
index fdd8ed9bf725..60584f64ed02 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c
index 5aea6499ee9a..0759a4efc050 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /* All successful D-side store dispatches for this thread that were L2 Miss */
 #define EventCode 0x46880
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
index f0c003282630..b1b34254018c 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 #define MALLOC_SIZE     (0x10000 * 10)  /* Ought to be enough .. */
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
index 4e242fd61b25..ac3ee2b236c2 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
@@ -10,7 +10,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
index ceca597016b2..dd4e99dcb6b7 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /* All successful D-side store dispatches for this thread */
 #define EventCode 0x010000046080
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c
index e154e2a4cc3a..b8792ee1004b 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c
index 14854694af62..e2d1c98602a3 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
index 3e08176eb7f8..f502d52c0f5a 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
index 488c865387e4..eae8634736c0 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
index 186a853c0f62..73d66306c010 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void thirty_two_instruction_loop(int loops);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
index f0706730c099..c5905303e657 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 extern void indirect_branch_loop(void);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
index 904362f172c9..ab2dc52766f6 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /*
  * Primary PMU event used here is PM_MRK_INST_CMPL (0x401e0)
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
index 75527876ad3c..6f47e2211163 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
@@ -8,7 +8,6 @@
 
 #include "../event.h"
 #include "misc.h"
-#include "utils.h"
 
 /*
  * Primary PMU event used here is PM_MRK_INST_CMPL (0x401e0)
-- 
2.39.1

