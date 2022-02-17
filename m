Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E788F4B9B30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 09:37:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzp922RkPz3cWS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 19:37:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwT0bUg4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BwT0bUg4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzp8J6JmCz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 19:36:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H8BBK0018233; 
 Thu, 17 Feb 2022 08:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=f6MLvq2x9So8n7JLekhFfEaaMo7WdloKisLE5/g8tjA=;
 b=BwT0bUg4eW6QsYbMI2VpPs3fmvEGxkUvYSL4Djc1O770Ubc3cWjOuUgkSP2om13Cb4AQ
 0MpZDi7mxhe5OVlBbQs2IL+9daCF04lfYXy8iB8zUfhI8ITXQNJ2lRCfCT8B0xAei8FM
 jvioNtxObDVXpSyFBKCA2DBsZBcRKkRr0EACGE9GNcH3sQI7TIkgQOHl+6TzzUMxjFDq
 605TXkU9Kwg2wr8BIk1pfBM1pqEeFTHAc7bTfLY3vBUYPRjtFmfkLYXaIs4ZSIZLNrY7
 MNrEEI60u3Rx+lqD5ifAG77nNAHn8HCQRbQ1rkJLdW7gl+LeyNKNuQdmbXYW/xZ1CrxK YA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9bpqg3qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 08:36:24 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21H8aN8U031131;
 Thu, 17 Feb 2022 08:36:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64hc20r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 08:36:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21H8aNVo15991512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 08:36:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6A107806A;
 Thu, 17 Feb 2022 08:36:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C85CB7806B;
 Thu, 17 Feb 2022 08:36:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.122.166])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 08:36:19 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 1/2] selftest/vm: Add util.h and and move helper functions
 there
Date: Thu, 17 Feb 2022 14:05:36 +0530
Message-Id: <20220217083537.374160-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e4qXobWHyJabB633N3r6UhUayFO-IVUZ
X-Proofpoint-ORIG-GUID: e4qXobWHyJabB633N3r6UhUayFO-IVUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_03,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170037
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid code duplication by adding util.h. No functional change
in this patch.

Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 tools/testing/selftests/vm/ksm_tests.c        | 38 +--------------
 tools/testing/selftests/vm/transhuge-stress.c | 42 ++--------------
 tools/testing/selftests/vm/util.h             | 48 +++++++++++++++++++
 3 files changed, 52 insertions(+), 76 deletions(-)
 create mode 100644 tools/testing/selftests/vm/util.h

diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
index 1436e1a9a3d3..fd85f15869d1 100644
--- a/tools/testing/selftests/vm/ksm_tests.c
+++ b/tools/testing/selftests/vm/ksm_tests.c
@@ -12,6 +12,7 @@
 
 #include "../kselftest.h"
 #include "../../../../include/vdso/time64.h"
+#include "util.h"
 
 #define KSM_SYSFS_PATH "/sys/kernel/mm/ksm/"
 #define KSM_FP(s) (KSM_SYSFS_PATH s)
@@ -22,15 +23,6 @@
 #define KSM_MERGE_ACROSS_NODES_DEFAULT true
 #define MB (1ul << 20)
 
-#define PAGE_SHIFT 12
-#define HPAGE_SHIFT 21
-
-#define PAGE_SIZE (1 << PAGE_SHIFT)
-#define HPAGE_SIZE (1 << HPAGE_SHIFT)
-
-#define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
-#define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
-
 struct ksm_sysfs {
 	unsigned long max_page_sharing;
 	unsigned long merge_across_nodes;
@@ -456,34 +448,6 @@ static int check_ksm_numa_merge(int mapping, int prot, int timeout, bool merge_a
 	return KSFT_FAIL;
 }
 
-int64_t allocate_transhuge(void *ptr, int pagemap_fd)
-{
-	uint64_t ent[2];
-
-	/* drop pmd */
-	if (mmap(ptr, HPAGE_SIZE, PROT_READ | PROT_WRITE,
-				MAP_FIXED | MAP_ANONYMOUS |
-				MAP_NORESERVE | MAP_PRIVATE, -1, 0) != ptr)
-		errx(2, "mmap transhuge");
-
-	if (madvise(ptr, HPAGE_SIZE, MADV_HUGEPAGE))
-		err(2, "MADV_HUGEPAGE");
-
-	/* allocate transparent huge page */
-	*(volatile void **)ptr = ptr;
-
-	if (pread(pagemap_fd, ent, sizeof(ent),
-			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
-		err(2, "read pagemap");
-
-	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
-	    PAGEMAP_PFN(ent[0]) + 1 == PAGEMAP_PFN(ent[1]) &&
-	    !(PAGEMAP_PFN(ent[0]) & ((1 << (HPAGE_SHIFT - PAGE_SHIFT)) - 1)))
-		return PAGEMAP_PFN(ent[0]);
-
-	return -1;
-}
-
 static int ksm_merge_hugepages_time(int mapping, int prot, int timeout, size_t map_size)
 {
 	void *map_ptr, *map_ptr_orig;
diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
index 5e4c036f6ad3..0da4aa10746a 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -16,44 +16,7 @@
 #include <string.h>
 #include <sys/mman.h>
 
-#define PAGE_SHIFT 12
-#define HPAGE_SHIFT 21
-
-#define PAGE_SIZE (1 << PAGE_SHIFT)
-#define HPAGE_SIZE (1 << HPAGE_SHIFT)
-
-#define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
-#define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
-
-int pagemap_fd;
-
-int64_t allocate_transhuge(void *ptr)
-{
-	uint64_t ent[2];
-
-	/* drop pmd */
-	if (mmap(ptr, HPAGE_SIZE, PROT_READ | PROT_WRITE,
-				MAP_FIXED | MAP_ANONYMOUS |
-				MAP_NORESERVE | MAP_PRIVATE, -1, 0) != ptr)
-		errx(2, "mmap transhuge");
-
-	if (madvise(ptr, HPAGE_SIZE, MADV_HUGEPAGE))
-		err(2, "MADV_HUGEPAGE");
-
-	/* allocate transparent huge page */
-	*(volatile void **)ptr = ptr;
-
-	if (pread(pagemap_fd, ent, sizeof(ent),
-			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
-		err(2, "read pagemap");
-
-	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
-	    PAGEMAP_PFN(ent[0]) + 1 == PAGEMAP_PFN(ent[1]) &&
-	    !(PAGEMAP_PFN(ent[0]) & ((1 << (HPAGE_SHIFT - PAGE_SHIFT)) - 1)))
-		return PAGEMAP_PFN(ent[0]);
-
-	return -1;
-}
+#include "util.h"
 
 int main(int argc, char **argv)
 {
@@ -63,6 +26,7 @@ int main(int argc, char **argv)
 	double s;
 	uint8_t *map;
 	size_t map_len;
+	int pagemap_fd;
 
 	ram = sysconf(_SC_PHYS_PAGES);
 	if (ram > SIZE_MAX / sysconf(_SC_PAGESIZE) / 4)
@@ -109,7 +73,7 @@ int main(int argc, char **argv)
 		for (p = ptr; p < ptr + len; p += HPAGE_SIZE) {
 			int64_t pfn;
 
-			pfn = allocate_transhuge(p);
+			pfn = allocate_transhuge(p, pagemap_fd);
 
 			if (pfn < 0) {
 				nr_failed++;
diff --git a/tools/testing/selftests/vm/util.h b/tools/testing/selftests/vm/util.h
new file mode 100644
index 000000000000..0f0a0f345d76
--- /dev/null
+++ b/tools/testing/selftests/vm/util.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __KSELFTEST_VM_UTIL_H
+#define __KSELFTEST_VM_UTIL_H
+
+#include <stdint.h>
+#include <sys/mman.h>
+#include <err.h>
+
+#define PAGE_SHIFT	12
+#define HPAGE_SHIFT	21
+
+#define PAGE_SIZE (1 << PAGE_SHIFT)
+#define HPAGE_SIZE (1 << HPAGE_SHIFT)
+
+#define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
+#define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
+
+
+static inline int64_t allocate_transhuge(void *ptr, int pagemap_fd)
+{
+	uint64_t ent[2];
+
+	/* drop pmd */
+	if (mmap(ptr, HPAGE_SIZE, PROT_READ | PROT_WRITE,
+		 MAP_FIXED | MAP_ANONYMOUS |
+		 MAP_NORESERVE | MAP_PRIVATE, -1, 0) != ptr)
+		errx(2, "mmap transhuge");
+
+	if (madvise(ptr, HPAGE_SIZE, MADV_HUGEPAGE))
+		err(2, "MADV_HUGEPAGE");
+
+	/* allocate transparent huge page */
+	*(volatile void **)ptr = ptr;
+
+	if (pread(pagemap_fd, ent, sizeof(ent),
+		  (uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
+		err(2, "read pagemap");
+
+	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
+	    PAGEMAP_PFN(ent[0]) + 1 == PAGEMAP_PFN(ent[1]) &&
+	    !(PAGEMAP_PFN(ent[0]) & ((1 << (HPAGE_SHIFT - PAGE_SHIFT)) - 1)))
+		return PAGEMAP_PFN(ent[0]);
+
+	return -1;
+}
+
+#endif
-- 
2.35.1

