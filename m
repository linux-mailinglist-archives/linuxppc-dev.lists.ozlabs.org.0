Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A3320B63D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 18:49:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tjXh0vjczDqsZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 02:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tjVs2hQKzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 02:48:01 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QGXamv064612; Fri, 26 Jun 2020 12:47:56 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vxqmed8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 12:47:56 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QGigZh024356;
 Fri, 26 Jun 2020 16:47:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 31uus458hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 16:47:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05QGlsU843844044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 16:47:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8655AE05C;
 Fri, 26 Jun 2020 16:47:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6826AE062;
 Fri, 26 Jun 2020 16:47:53 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.160.162.96])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 16:47:53 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Purge extra count_pmc() calls of ebb
 selftests
Date: Fri, 26 Jun 2020 13:47:37 -0300
Message-Id: <20200626164737.21943-1-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_09:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 cotscore=-2147483648
 spamscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260116
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
Cc: desnesn@linux.ibm.com, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An extra count on ebb_state.stats.pmc_count[PMC_INDEX(pmc)] is being per-
formed when count_pmc() is used to reset PMCs on a few selftests. This
extra pmc_count can occasionally invalidate results, such as the ones from
cycles_test shown hereafter. The ebb_check_count() failed with an above
the upper limit error due to the extra value on ebb_state.stats.pmc_count.

Furthermore, this extra count is also indicated by extra PMC1 trace_log on
the output of the cycle test (as well as on pmc56_overflow_test):

==========
   ...
   [21]: counter = 8
   [22]: register SPRN_MMCR0 = 0x0000000080000080
   [23]: register SPRN_PMC1  = 0x0000000080000004
   [24]: counter = 9
   [25]: register SPRN_MMCR0 = 0x0000000080000080
   [26]: register SPRN_PMC1  = 0x0000000080000004
   [27]: counter = 10
   [28]: register SPRN_MMCR0 = 0x0000000080000080
   [29]: register SPRN_PMC1  = 0x0000000080000004
>> [30]: register SPRN_PMC1  = 0x000000004000051e
PMC1 count (0x280000546) above upper limit 0x2800003e8 (+0x15e)
[FAIL] Test FAILED on line 52
failure: cycles
==========

Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 .../selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c     | 2 --
 tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c      | 2 --
 .../selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c    | 2 --
 .../selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c     | 2 --
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c              | 2 --
 .../selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c  | 2 --
 .../selftests/powerpc/pmu/ebb/lost_exception_test.c        | 1 -
 .../testing/selftests/powerpc/pmu/ebb/multi_counter_test.c | 7 -------
 .../selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c       | 2 --
 .../testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c | 2 --
 .../selftests/powerpc/pmu/ebb/pmc56_overflow_test.c        | 2 --
 11 files changed, 26 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
index a2d7b0e3dca9..a26ac122c759 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
@@ -91,8 +91,6 @@ int back_to_back_ebbs(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
index bc893813483e..bb9f587fa76e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
@@ -42,8 +42,6 @@ int cycles(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
index dcd351d20328..9ae795ce314e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
@@ -99,8 +99,6 @@ int cycles_with_freeze(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	printf("EBBs while frozen %d\n", ebbs_while_frozen);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
index 94c99c12c0f2..4b45a2e70f62 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
@@ -71,8 +71,6 @@ int cycles_with_mmcr2(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index dfbc5c3ad52d..21537d6eb6b7 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -396,8 +396,6 @@ int ebb_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
index ca2f7d729155..b208bf6ad58d 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
@@ -38,8 +38,6 @@ static int victim_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	FAIL_IF(ebb_state.stats.ebb_count == 0);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
index ac3e6e182614..ba2681a12cc7 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
@@ -75,7 +75,6 @@ static int test_body(void)
 	ebb_freeze_pmcs();
 	ebb_global_disable();
 
-	count_pmc(4, sample_period);
 	mtspr(SPRN_PMC4, 0xdead);
 
 	dump_summary_ebb_state();
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
index b8242e9d97d2..791d37ba327b 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
@@ -70,13 +70,6 @@ int multi_counter(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-	count_pmc(2, sample_period);
-	count_pmc(3, sample_period);
-	count_pmc(4, sample_period);
-	count_pmc(5, sample_period);
-	count_pmc(6, sample_period);
-
 	dump_ebb_state();
 
 	for (i = 0; i < 6; i++)
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
index a05c0e18ded6..9b0f70d59702 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
@@ -61,8 +61,6 @@ static int cycles_child(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_summary_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
index 153ebc92234f..2904c741e04e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
@@ -82,8 +82,6 @@ static int test_body(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	if (mmcr0_mismatch)
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
index eadad75ed7e6..b29f8ba22d1e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
@@ -76,8 +76,6 @@ int pmc56_overflow(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(2, sample_period);
-
 	dump_ebb_state();
 
 	printf("PMC5/6 overflow %d\n", pmc56_overflowed);
-- 
2.21.3

