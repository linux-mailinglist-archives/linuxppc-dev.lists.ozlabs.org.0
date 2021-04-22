Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FC367966
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQmb35Rp1z3bPN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:44:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XOyXgWJ4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XOyXgWJ4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQmZ35y3Wz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:43:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M5YLON099418; Thu, 22 Apr 2021 01:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=468r3InvqC+/ENiKz0ZI+9BCy5InogY3k5lm4WB+Acc=;
 b=XOyXgWJ46r8pgJzQNAp4w9oNL01/bQ2CFRbIzXEFtsjqTE4g0o72F637ZBuekLxh2ypv
 FaI1QhP1BpjR6DAV/g04RAFM14CAHzlFQODbMPIcGugfNN8rXfO8l0R9WeYtjhTo47Q5
 KzH7Zyg4ad1fOHyA3g9MmaxkZUMC3z560iPmvzK3cI/pwxL6mLmRLns3f5nz5nxVrSfQ
 kKyTNEbsVE2n1SJj7MWS60WWnYkp4GdIJtN+/sr85YcbZNGkrX9ZyCKJeN1PgOi5QFJ0
 ui4hxztJR46AcddEp775hYLOAN/TXfLlVq9NQT+wcph3iYsHGsZBjXpbTR1qq5rhXgkc bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382xvenkeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:43 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M5Yen7100281;
 Thu, 22 Apr 2021 01:43:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382xvenkeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M5fajk019078;
 Thu, 22 Apr 2021 05:43:42 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 37yqaase1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 05:43:42 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M5hfta14221638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 05:43:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 170AD7805C;
 Thu, 22 Apr 2021 05:43:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEFC77805F;
 Thu, 22 Apr 2021 05:43:37 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.37.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 05:43:37 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v5 1/9] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
Date: Thu, 22 Apr 2021 11:13:15 +0530
Message-Id: <20210422054323.150993-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6dTSWSdeJelSuqs_2ceIZwJPsdFAKs0q
X-Proofpoint-GUID: g2nYmNORpuAXKRmN2som1tqet9MRhEap
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104220047
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of hardcoding 4K page size fetch it using sysconf(). For the performance
measurements test still assume 2M and 1G are hugepage sizes.

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 tools/testing/selftests/vm/mremap_test.c | 113 ++++++++++++-----------
 1 file changed, 61 insertions(+), 52 deletions(-)

diff --git a/tools/testing/selftests/vm/mremap_test.c b/tools/testing/selftests/vm/mremap_test.c
index 9c391d016922..c9a5461eb786 100644
--- a/tools/testing/selftests/vm/mremap_test.c
+++ b/tools/testing/selftests/vm/mremap_test.c
@@ -45,14 +45,15 @@ enum {
 	_4MB = 4ULL << 20,
 	_1GB = 1ULL << 30,
 	_2GB = 2ULL << 30,
-	PTE = _4KB,
 	PMD = _2MB,
 	PUD = _1GB,
 };
 
+#define PTE page_size
+
 #define MAKE_TEST(source_align, destination_align, size,	\
 		  overlaps, should_fail, test_name)		\
-{								\
+(struct test){							\
 	.name = test_name,					\
 	.config = {						\
 		.src_alignment = source_align,			\
@@ -252,12 +253,17 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
 	return 0;
 }
 
+#define MAX_TEST 13
+#define MAX_PERF_TEST 3
 int main(int argc, char **argv)
 {
 	int failures = 0;
 	int i, run_perf_tests;
 	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
 	unsigned int pattern_seed;
+	struct test test_cases[MAX_TEST];
+	struct test perf_test_cases[MAX_PERF_TEST];
+	int page_size;
 	time_t t;
 
 	pattern_seed = (unsigned int) time(&t);
@@ -268,56 +274,59 @@ int main(int argc, char **argv)
 	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
 		       threshold_mb, pattern_seed);
 
-	struct test test_cases[] = {
-		/* Expected mremap failures */
-		MAKE_TEST(_4KB, _4KB, _4KB, OVERLAPPING, EXPECT_FAILURE,
-		  "mremap - Source and Destination Regions Overlapping"),
-		MAKE_TEST(_4KB, _1KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
-		  "mremap - Destination Address Misaligned (1KB-aligned)"),
-		MAKE_TEST(_1KB, _4KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
-		  "mremap - Source Address Misaligned (1KB-aligned)"),
-
-		/* Src addr PTE aligned */
-		MAKE_TEST(PTE, PTE, _8KB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "8KB mremap - Source PTE-aligned, Destination PTE-aligned"),
-
-		/* Src addr 1MB aligned */
-		MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned"),
-		MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned"),
-
-		/* Src addr PMD aligned */
-		MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "4MB mremap - Source PMD-aligned, Destination PTE-aligned"),
-		MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned"),
-		MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "4MB mremap - Source PMD-aligned, Destination PMD-aligned"),
-
-		/* Src addr PUD aligned */
-		MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2GB mremap - Source PUD-aligned, Destination PTE-aligned"),
-		MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2GB mremap - Source PUD-aligned, Destination 1MB-aligned"),
-		MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2GB mremap - Source PUD-aligned, Destination PMD-aligned"),
-		MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "2GB mremap - Source PUD-aligned, Destination PUD-aligned"),
-	};
-
-	struct test perf_test_cases[] = {
-		/*
-		 * mremap 1GB region - Page table level aligned time
-		 * comparison.
-		 */
-		MAKE_TEST(PTE, PTE, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "1GB mremap - Source PTE-aligned, Destination PTE-aligned"),
-		MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "1GB mremap - Source PMD-aligned, Destination PMD-aligned"),
-		MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-		  "1GB mremap - Source PUD-aligned, Destination PUD-aligned"),
-	};
+	page_size = sysconf(_SC_PAGESIZE);
+
+	/* Expected mremap failures */
+	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
+				  OVERLAPPING, EXPECT_FAILURE,
+				  "mremap - Source and Destination Regions Overlapping");
+
+	test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
+				  NON_OVERLAPPING, EXPECT_FAILURE,
+				  "mremap - Destination Address Misaligned (1KB-aligned)");
+	test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
+				  NON_OVERLAPPING, EXPECT_FAILURE,
+				  "mremap - Source Address Misaligned (1KB-aligned)");
+
+	/* Src addr PTE aligned */
+	test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
+				  NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
+
+	/* Src addr 1MB aligned */
+	test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
+	test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+	/* Src addr PMD aligned */
+	test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
+	test_cases[7] =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
+	test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
+
+	/* Src addr PUD aligned */
+	test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
+	test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
+	test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
+	test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
+	/*
+	 * mremap 1GB region - Page table level aligned time
+	 * comparison.
+	 */
+	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
+	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
+				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
 
 	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
 				(threshold_mb * _1MB >= _1GB);
-- 
2.30.2

