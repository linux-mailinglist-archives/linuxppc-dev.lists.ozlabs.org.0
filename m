Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F434E0FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 08:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8fCK1ntgz30HC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SxiBPdG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SxiBPdG+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8fBr42DNz302c
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 17:08:20 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U63n3q130385; Tue, 30 Mar 2021 02:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B9iM2DcuS08Wh+tMCYm74RU9UJaU0PTZ8EaGG4He4Co=;
 b=SxiBPdG+96D3jWbSnNG3+WpSzQZmJZGnrD/kalFd/HpMUWmN6JvSKnpZa7LmK9helphq
 oSlWl4sywwpj6Ewy2U92OqCMgIpb04D4P11e4QHcoLbMuLFCrsISf0FKgF1fVvLAqdBN
 P5SCEKuv17vf9FvjnEoHPKGURQl/B9ss6xDwjT5jGcCaHYio1QHmuLoN3msUxII51NAm
 iU0duVCjhzGFX5yUUdg3+MwE9M4g8+mHZ7zPmd8eqPzQC4uH/qMyr+XRhTRIrinIdq7k
 rYPuk/GP2GFhuya0LWxtR7FTBMGPxXgvCtthXzMRNvONALxxRPnLY0APl7HYFVn0y9Kp ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnm59p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:14 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U63o50130488;
 Tue, 30 Mar 2021 02:08:13 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnm59n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:13 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U620EK027464;
 Tue, 30 Mar 2021 06:08:12 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 37hvb98b11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 06:08:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U68BKC27787690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 06:08:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0130B78064;
 Tue, 30 Mar 2021 06:08:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26F827805F;
 Tue, 30 Mar 2021 06:08:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 06:08:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 1/9] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
Date: Tue, 30 Mar 2021 11:37:44 +0530
Message-Id: <20210330060752.592769-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _qGHz-oL-INvsVUlNTXhtQCk0awXZyMh
X-Proofpoint-ORIG-GUID: vy_QWtw-_hgY3v4N7IevYBJOnU88PK8u
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_01:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300043
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
Cc: kaleshsingh@google.com, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of hardcoding 4K page size fetch it using sysconf(). For the performance
measurements test still assume 2M and 1G are hugepage sizes.

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

