Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C085B4B0526
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 06:36:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvQTP3Gjtz3bb2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 16:36:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i7m1K37b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i7m1K37b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvQSf3L0zz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:35:29 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A3T9km001362; 
 Thu, 10 Feb 2022 05:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=6JhJ+OIpY47S9id4brcO4bQ00EziYT3HimTGAfKjZnM=;
 b=i7m1K37bks4NC3n8UpPa5MPLlr8NvyDHvC25fxxfI70GnIfPzCz99R7NjeBCrxklrwdj
 KEsPji3f7tpOX2PV3qETY3vNVbJMrlGpBTHiIbhMKKWDtY2sWsLIdH0u6PLdGRZl6cvI
 vnnkfYxXta1hYQkJjutd+IUk3eHoCDS9Zdk/hIAMZHzutCNVkv10XQTGDPHtbETf2SV9
 8D3596nJt44yEG+REp2ruZXxUT2na5HEv5lV/xgM6iTnCmBt+Kl9exgGN8zd2GdgWd4C
 Lbl3vEPqhRFquUgMdWyTVfIwxgLapFW3r+CAWFlqJfrkSJZQYrWxkfWkPJtrW1fZpExI xQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4tu71yx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 05:35:11 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21A5LjoC015952;
 Thu, 10 Feb 2022 05:35:10 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3e1gvc15eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 05:35:10 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21A5Z94243385320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 05:35:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7321112067;
 Thu, 10 Feb 2022 05:35:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B0A7112065;
 Thu, 10 Feb 2022 05:35:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.23.209])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 10 Feb 2022 05:35:06 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
In-Reply-To: <87zgmz9x7e.fsf@linux.ibm.com>
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
 <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
 <87zgmz9x7e.fsf@linux.ibm.com>
Date: Thu, 10 Feb 2022 11:05:03 +0530
Message-ID: <87wni39tdk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kw7vX98sZ9ffkh3lcqi_7a5p7UGyTRxa
X-Proofpoint-ORIG-GUID: kw7vX98sZ9ffkh3lcqi_7a5p7UGyTRxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_01,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202100031
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
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:

> Shuah Khan <skhan@linuxfoundation.org> writes:
>
>> On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>>> @@ -16,8 +16,16 @@
>>>   #include <string.h>
>>>   #include <sys/mman.h>
>>>   
>>> +#ifdef __powerpc64__
>>> +#define PAGE_SHIFT	16
>>> +/*
>>> + * This will only work with radix 2M hugepage size
>>> + */
>>> +#define HPAGE_SHIFT 21
>>
>> Why not have this is in common code?
>
> Can you suggest where I can move that. We also have helper functions
> like allocate_transhuge() duplicated between tests. I didn't find
> libutil.a or anything similar supported by the selftets build. 
>
>>
>>> +#else
>>>   #define PAGE_SHIFT 12
>>>   #define HPAGE_SHIFT 21
>>

I can do a util.h for vm related test as below. 

commit 378fa2d73f1255d3045023875dd00d5b8486440e
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Thu Feb 10 10:22:27 2022 +0530

    selftest/vm: Add util.h and and move helper functions there
    
    Avoid code duplication by adding util.h
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
index 8200328ff018..fd85f15869d1 100644
--- a/tools/testing/selftests/vm/ksm_tests.c
+++ b/tools/testing/selftests/vm/ksm_tests.c
@@ -12,6 +12,7 @@
 
 #include "../kselftest.h"
 #include "../../../../include/vdso/time64.h"
+#include "util.h"
 
 #define KSM_SYSFS_PATH "/sys/kernel/mm/ksm/"
 #define KSM_FP(s) (KSM_SYSFS_PATH s)
@@ -22,23 +23,6 @@
 #define KSM_MERGE_ACROSS_NODES_DEFAULT true
 #define MB (1ul << 20)
 
-#ifdef __powerpc64__
-#define PAGE_SHIFT	16
-/*
- * This will only work with radix 2M hugepage size
- */
-#define HPAGE_SHIFT 21
-#else
-#define PAGE_SHIFT 12
-#define HPAGE_SHIFT 21
-#endif
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
@@ -464,34 +448,6 @@ static int check_ksm_numa_merge(int mapping, int prot, int timeout, bool merge_a
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
index f04c8aa4bcf6..0da4aa10746a 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -16,52 +16,7 @@
 #include <string.h>
 #include <sys/mman.h>
 
-#ifdef __powerpc64__
-#define PAGE_SHIFT	16
-/*
- * This will only work with radix 2M hugepage size
- */
-#define HPAGE_SHIFT 21
-#else
-#define PAGE_SHIFT 12
-#define HPAGE_SHIFT 21
-#endif
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
@@ -71,6 +26,7 @@ int main(int argc, char **argv)
 	double s;
 	uint8_t *map;
 	size_t map_len;
+	int pagemap_fd;
 
 	ram = sysconf(_SC_PHYS_PAGES);
 	if (ram > SIZE_MAX / sysconf(_SC_PAGESIZE) / 4)
@@ -117,7 +73,7 @@ int main(int argc, char **argv)
 		for (p = ptr; p < ptr + len; p += HPAGE_SIZE) {
 			int64_t pfn;
 
-			pfn = allocate_transhuge(p);
+			pfn = allocate_transhuge(p, pagemap_fd);
 
 			if (pfn < 0) {
 				nr_failed++;
diff --git a/tools/testing/selftests/vm/util.h b/tools/testing/selftests/vm/util.h
new file mode 100644
index 000000000000..1461a96f0bc0
--- /dev/null
+++ b/tools/testing/selftests/vm/util.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __KSELFTEST_VM_UTIL_H
+#define __KSELFTEST_VM_UTIL_H
+
+#include <sys/mman.h>
+#include <err.h>
+
+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+/*
+ * This will only work with radix 2M hugepage size
+ */
+#define HPAGE_SHIFT 21
+#else
+#define PAGE_SHIFT 12
+#define HPAGE_SHIFT 21
+#endif
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
