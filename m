Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226A4CF156
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 06:45:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBnVs3Nphz3bZB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 16:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7bTCCDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o7bTCCDj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBnTN1S22z30BF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 16:44:23 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2272n17G020358; 
 Mon, 7 Mar 2022 05:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IirZ68LxSPilNverEaGdoctXYHMahMKHBGYBtGs/+fs=;
 b=o7bTCCDjR1m8CoNhGB4AAA3vi988MfdJgLV9vK+xReYhov8IO9LwnQMeDcU7Jp2Q1aKk
 lT0di6Cd/0v4ZkG/9+m1AhYhM53t30sqUALRgM0cYLLo7d8/c2TARHRi/gA8iPbwZafk
 RcT5zZj4jZ9knUSYaA1FK93hHhSrk6g14wu1dKR8t0PpTh9jaQ3LhCO8T7jKBKnhGcRV
 j+g3+2XfDvo1nBydjdULJQZuFYg63lyglqkef6hrHawVIp2Pkpcv+fUYVuGFsqXppPnq
 JO49SNd0eY83yWITxMkMdoPxZWsmn0CwHr9k3UjXv3B1W9d+sOxn7Kt/cwYtcCtTDxSt Ug== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emp5fqrbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 05:44:11 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2275eA5Y020770;
 Mon, 7 Mar 2022 05:44:10 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3ekyg93h4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 05:44:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2275iA2V46203168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 05:44:10 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B3E112405E;
 Mon,  7 Mar 2022 05:44:10 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 126CC124052;
 Mon,  7 Mar 2022 05:44:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.89.15])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Mar 2022 05:44:06 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 1/2] selftest/vm: Add util.h and and move helper functions
 there
Date: Mon,  7 Mar 2022 11:13:54 +0530
Message-Id: <20220307054355.149820-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XQFJ_-iJGVeU4lzcO47yMMDO4o6DK0tp
X-Proofpoint-GUID: XQFJ_-iJGVeU4lzcO47yMMDO4o6DK0tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070033
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
Changes from v3:
* rebased to linux-next-20220302

 tools/testing/selftests/vm/ksm_tests.c        | 38 +--------------
 tools/testing/selftests/vm/transhuge-stress.c | 41 ++--------------
 tools/testing/selftests/vm/util.h             | 48 +++++++++++++++++++
 3 files changed, 52 insertions(+), 75 deletions(-)
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
index a03cb3fce1f6..e3f00adb1b82 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -15,48 +15,12 @@
 #include <fcntl.h>
 #include <string.h>
 #include <sys/mman.h>
+#include "util.h"
 
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
 int backing_fd = -1;
 int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
 #define PROT_RW (PROT_READ | PROT_WRITE)
 
-int64_t allocate_transhuge(void *ptr)
-{
-	uint64_t ent[2];
-
-	/* drop pmd */
-	if (mmap(ptr, HPAGE_SIZE, PROT_RW, MAP_FIXED | mmap_flags,
-		 backing_fd, 0) != ptr)
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
 int main(int argc, char **argv)
 {
 	size_t ram, len;
@@ -67,6 +31,7 @@ int main(int argc, char **argv)
 	double s;
 	uint8_t *map;
 	size_t map_len;
+	int pagemap_fd;
 
 	ram = sysconf(_SC_PHYS_PAGES);
 	if (ram > SIZE_MAX / sysconf(_SC_PAGESIZE) / 4)
@@ -122,7 +87,7 @@ int main(int argc, char **argv)
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

