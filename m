Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B821EE4E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 15:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d5WD26GFzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d5Pn5RhzzDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 22:56:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CWZS7004683; Thu, 4 Jun 2020 08:56:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ec65q2nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 08:56:21 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 054CXa7g008565;
 Thu, 4 Jun 2020 08:56:21 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ec65q2mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 08:56:21 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 054CalG7027512;
 Thu, 4 Jun 2020 12:56:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 31bf47v434-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 12:56:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 054CuGef59637878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 12:56:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 593B7AE045;
 Thu,  4 Jun 2020 12:56:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B872BAE055;
 Thu,  4 Jun 2020 12:56:14 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 12:56:14 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 2/3] selftests: powerpc: Move Hash MMU check to utilities
Date: Thu,  4 Jun 2020 18:26:09 +0530
Message-Id: <20200604125610.649668-3-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200604125610.649668-1-sandipan@linux.ibm.com>
References: <20200604125610.649668-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_07:2020-06-02,
 2020-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=1 adultscore=0 malwarescore=0 cotscore=-2147483648
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040085
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves a function to test if the MMU is in Hash mode
under the generic test utilities.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/utils.h |  1 +
 tools/testing/selftests/powerpc/mm/Makefile   |  2 +-
 .../selftests/powerpc/mm/bad_accesses.c       | 28 -------------------
 tools/testing/selftests/powerpc/utils.c       | 28 +++++++++++++++++++
 4 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index e089a0c30d9a..ad2728736ae5 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -60,6 +60,7 @@ static inline bool have_hwcap2(unsigned long ftr2)
 #endif
 
 bool is_ppc64le(void);
+int using_hash_mmu(bool *using_hash);
 
 /* Yes, this is evil */
 #define FAIL_IF(x)						\
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index b9103c4bb414..2389bf791fd6 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -10,7 +10,7 @@ TEST_GEN_FILES := tempfile
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-$(TEST_GEN_PROGS): ../harness.c
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
 
 $(OUTPUT)/prot_sao: ../utils.c
 
diff --git a/tools/testing/selftests/powerpc/mm/bad_accesses.c b/tools/testing/selftests/powerpc/mm/bad_accesses.c
index adc465f499ef..a864ed7e2008 100644
--- a/tools/testing/selftests/powerpc/mm/bad_accesses.c
+++ b/tools/testing/selftests/powerpc/mm/bad_accesses.c
@@ -64,34 +64,6 @@ int bad_access(char *p, bool write)
 	return 0;
 }
 
-static int using_hash_mmu(bool *using_hash)
-{
-	char line[128];
-	FILE *f;
-	int rc;
-
-	f = fopen("/proc/cpuinfo", "r");
-	FAIL_IF(!f);
-
-	rc = 0;
-	while (fgets(line, sizeof(line), f) != NULL) {
-		if (strcmp(line, "MMU		: Hash\n") == 0) {
-			*using_hash = true;
-			goto out;
-		}
-
-		if (strcmp(line, "MMU		: Radix\n") == 0) {
-			*using_hash = false;
-			goto out;
-		}
-	}
-
-	rc = -1;
-out:
-	fclose(f);
-	return rc;
-}
-
 static int test(void)
 {
 	unsigned long i, j, addr, region_shift, page_shift, page_size;
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 5ee0e98c4896..933678f1ed0a 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -293,3 +293,31 @@ void set_dscr(unsigned long val)
 
 	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
 }
+
+int using_hash_mmu(bool *using_hash)
+{
+	char line[128];
+	FILE *f;
+	int rc;
+
+	f = fopen("/proc/cpuinfo", "r");
+	FAIL_IF(!f);
+
+	rc = 0;
+	while (fgets(line, sizeof(line), f) != NULL) {
+		if (strcmp(line, "MMU		: Hash\n") == 0) {
+			*using_hash = true;
+			goto out;
+		}
+
+		if (strcmp(line, "MMU		: Radix\n") == 0) {
+			*using_hash = false;
+			goto out;
+		}
+	}
+
+	rc = -1;
+out:
+	fclose(f);
+	return rc;
+}
-- 
2.25.1

