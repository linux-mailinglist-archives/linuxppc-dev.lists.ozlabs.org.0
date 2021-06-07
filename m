Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60839D484
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:54:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2cT3kDMz3bwn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:54:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nR4p9Cu5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nR4p9Cu5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2Zc0wDtz308j
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:23 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575cXmr057775; Mon, 7 Jun 2021 01:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YRDMzV02my49qyhMM/hqSkCOurBRGSnHwvapcri+ACg=;
 b=nR4p9Cu5bKKeh8aR4IVUCxvHMBb5nQaVTRbkcPLvBG9JlJL/l/lKqeFP3v8sdp27g/T2
 5Zc7VU50iryx8YSeiODJPoa/Jf7mCFbp+Y0JOolsMJLYgQun5s1scl/PJGtDzYsjVG+V
 SKxSfmUyTvJfV0247CMqQFSP7k4OQd8pwI005V659mSLDEodPBmc4ovpmVl0ilPYBqRa
 MXfRLgw7H/ABh4eeXeQxZMzjAiVQW8yl5y0o4wzlPzAcnsdE4tJyw+Ac86rIBzLCYXnB
 CClUJ+By5Nb1X2dtRVEnQwv9KhKdNaEwJGR8jOr5iII3AvonxS0aF+n9GQ0WMMPPqslt og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391bt7ta8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:09 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575eeXf065601;
 Mon, 7 Jun 2021 01:52:09 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391bt7ta8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:09 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575hVJh032557;
 Mon, 7 Jun 2021 05:52:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3900w8yr5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:52:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575q76n20906434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:52:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A317C2805C;
 Mon,  7 Jun 2021 05:52:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71D4828058;
 Mon,  7 Jun 2021 05:52:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:52:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 03/11] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
Date: Mon,  7 Jun 2021 11:21:23 +0530
Message-Id: <20210607055131.156184-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ja0DVf-bO8lni9z-zA_jFWZJ-pBUmhjd
X-Proofpoint-ORIG-GUID: qVeSDoEuGDMz2z-5mAPhg2IRcZtFFJtc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070042
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
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
2.31.1

