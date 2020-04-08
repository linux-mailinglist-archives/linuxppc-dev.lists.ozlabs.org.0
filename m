Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 117301A2BF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:41:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yK4f63DfzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yJyw0Mq2zDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 08:36:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038MXY1p128994; Wed, 8 Apr 2020 18:35:57 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30921h3sy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:35:57 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038MUoZd004425;
 Wed, 8 Apr 2020 22:35:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3091me0hfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 22:35:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038MZtTk57344408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 22:35:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2727805C;
 Wed,  8 Apr 2020 22:35:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A31797805E;
 Wed,  8 Apr 2020 22:35:53 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.85.206.148])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 22:35:53 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH, RESEND,
 1/3] selftests/powerpc: Use write_pmc instead of count_pmc to reset
 PMCs on ebb tests
Date: Wed,  8 Apr 2020 19:35:41 -0300
Message-Id: <20200408223543.21168-2-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200408223543.21168-1-desnesn@linux.ibm.com>
References: <20200408223543.21168-1-desnesn@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-08_09:2020-04-07,
 2020-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=1 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080156
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
Cc: desnesn@linux.ibm.com, shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By using count_pmc() to reset PMCs instead of write_pmc(), an extra count
is performed on ebb_state.stats.pmc_count[PMC_INDEX(pmc)]. This extra
pmc_count can occasionally invalidate results, such as the ones from
cycles_test shown hereafter. The ebb_check_count() failed with an above
the upper limit error due to the extra ebb_state.stats.pmc_count.

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

[desnesn: reflow of original comment]
Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 .../powerpc/pmu/ebb/back_to_back_ebbs_test.c         |  2 +-
 .../testing/selftests/powerpc/pmu/ebb/cycles_test.c  |  2 +-
 .../powerpc/pmu/ebb/cycles_with_freeze_test.c        |  2 +-
 .../powerpc/pmu/ebb/cycles_with_mmcr2_test.c         |  2 +-
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c        |  2 +-
 .../powerpc/pmu/ebb/ebb_on_willing_child_test.c      |  2 +-
 .../selftests/powerpc/pmu/ebb/lost_exception_test.c  |  2 +-
 .../selftests/powerpc/pmu/ebb/multi_counter_test.c   | 12 ++++++------
 .../selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c |  2 +-
 .../selftests/powerpc/pmu/ebb/pmae_handling_test.c   |  2 +-
 .../selftests/powerpc/pmu/ebb/pmc56_overflow_test.c  |  2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
index a2d7b0e3dca9..f133ab425f10 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
@@ -91,7 +91,7 @@ int back_to_back_ebbs(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
index bc893813483e..14a399a64729 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
@@ -42,7 +42,7 @@ int cycles(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
index dcd351d20328..0f2089f6f82c 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
@@ -99,7 +99,7 @@ int cycles_with_freeze(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
index 94c99c12c0f2..a8f3bee04cd8 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
@@ -71,7 +71,7 @@ int cycles_with_mmcr2(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index dfbc5c3ad52d..bf6f25dfcf7b 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -396,7 +396,7 @@ int ebb_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
index ca2f7d729155..513812cdcca1 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
@@ -38,7 +38,7 @@ static int victim_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
index ac3e6e182614..5979606c41dc 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
@@ -75,7 +75,7 @@ static int test_body(void)
 	ebb_freeze_pmcs();
 	ebb_global_disable();
 
-	count_pmc(4, sample_period);
+	write_pmc(4, pmc_sample_period(sample_period));
 	mtspr(SPRN_PMC4, 0xdead);
 
 	dump_summary_ebb_state();
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
index b8242e9d97d2..227827b665d5 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
@@ -70,12 +70,12 @@ int multi_counter(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-	count_pmc(2, sample_period);
-	count_pmc(3, sample_period);
-	count_pmc(4, sample_period);
-	count_pmc(5, sample_period);
-	count_pmc(6, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
+	write_pmc(2, pmc_sample_period(sample_period));
+	write_pmc(3, pmc_sample_period(sample_period));
+	write_pmc(4, pmc_sample_period(sample_period));
+	write_pmc(5, pmc_sample_period(sample_period));
+	write_pmc(6, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
index a05c0e18ded6..ade70bed0499 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
@@ -61,7 +61,7 @@ static int cycles_child(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_summary_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
index 153ebc92234f..7b4bf4ed12cb 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
@@ -82,7 +82,7 @@ static int test_body(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
+	write_pmc(1, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
index eadad75ed7e6..bb55af71404d 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
@@ -76,7 +76,7 @@ int pmc56_overflow(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(2, sample_period);
+	write_pmc(2, pmc_sample_period(sample_period));
 
 	dump_ebb_state();
 
-- 
2.21.1

