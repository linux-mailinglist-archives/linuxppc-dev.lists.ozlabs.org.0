Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3EB00BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:02:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6B54DrGzF3c0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4h61fQ3zF2WW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4h60rS0z8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4h60Hlhz9sNF; Thu, 12 Sep 2019 00:55:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4h549rtz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:55:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgvrJ101559
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:16 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0uj5k9v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:15 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:55:13 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:55:10 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEt8CU47186090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:55:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 620CAA404D;
 Wed, 11 Sep 2019 14:55:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62D11A405D;
 Wed, 11 Sep 2019 14:55:06 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:55:06 +0000 (GMT)
Subject: [PATCH v6 26/36] powerpc/fadump: make crash memory ranges array
 allocation generic
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:25:05 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D84F
Message-Id: <156821369863.5656.4375667005352155892.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make allocate_crash_memory_ranges() and free_crash_memory_ranges()
functions generic to reuse them for memory management of all types of
dynamic memory range arrays. This change helps in memory management
of reserved ranges array to be added later.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Use kernel types where possible.


 arch/powerpc/include/asm/fadump-internal.h |   15 +++-
 arch/powerpc/kernel/fadump.c               |  113 +++++++++++++++-------------
 2 files changed, 72 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 2c72685..0f2ce85 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -72,9 +72,18 @@ struct fadump_crash_info_header {
 	struct cpumask	online_mask;
 };
 
-struct fad_crash_memory_ranges {
-	unsigned long long	base;
-	unsigned long long	size;
+struct fadump_memory_range {
+	u64	base;
+	u64	size;
+};
+
+/* fadump memory ranges info */
+struct fadump_mrange_info {
+	char				name[16];
+	struct fadump_memory_range	*mem_ranges;
+	u32				mem_ranges_sz;
+	u32				mem_range_cnt;
+	u32				max_mem_ranges;
 };
 
 /* Platform specific callback functions */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index da75140..f95ec1f 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -35,10 +35,7 @@
 static struct fw_dump fw_dump;
 
 static DEFINE_MUTEX(fadump_mutex);
-struct fad_crash_memory_ranges *crash_memory_ranges;
-int crash_memory_ranges_size;
-int crash_mem_ranges;
-int max_crash_mem_ranges;
+struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
 
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
@@ -629,46 +626,48 @@ void fadump_free_cpu_notes_buf(void)
 	fw_dump.cpu_notes_buf_size = 0;
 }
 
-static void free_crash_memory_ranges(void)
+static void fadump_free_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
-	kfree(crash_memory_ranges);
-	crash_memory_ranges = NULL;
-	crash_memory_ranges_size = 0;
-	max_crash_mem_ranges = 0;
+	kfree(mrange_info->mem_ranges);
+	mrange_info->mem_ranges = NULL;
+	mrange_info->mem_ranges_sz = 0;
+	mrange_info->max_mem_ranges = 0;
 }
 
 /*
- * Allocate or reallocate crash memory ranges array in incremental units
+ * Allocate or reallocate mem_ranges array in incremental units
  * of PAGE_SIZE.
  */
-static int allocate_crash_memory_ranges(void)
+static int fadump_alloc_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
-	struct fad_crash_memory_ranges *new_array;
+	struct fadump_memory_range *new_array;
 	u64 new_size;
 
-	new_size = crash_memory_ranges_size + PAGE_SIZE;
-	pr_debug("Allocating %llu bytes of memory for crash memory ranges\n",
-		 new_size);
+	new_size = mrange_info->mem_ranges_sz + PAGE_SIZE;
+	pr_debug("Allocating %llu bytes of memory for %s memory ranges\n",
+		 new_size, mrange_info->name);
 
-	new_array = krealloc(crash_memory_ranges, new_size, GFP_KERNEL);
+	new_array = krealloc(mrange_info->mem_ranges, new_size, GFP_KERNEL);
 	if (new_array == NULL) {
-		pr_err("Insufficient memory for setting up crash memory ranges\n");
-		free_crash_memory_ranges();
+		pr_err("Insufficient memory for setting up %s memory ranges\n",
+		       mrange_info->name);
+		fadump_free_mem_ranges(mrange_info);
 		return -ENOMEM;
 	}
 
-	crash_memory_ranges = new_array;
-	crash_memory_ranges_size = new_size;
-	max_crash_mem_ranges = (new_size /
-				sizeof(struct fad_crash_memory_ranges));
+	mrange_info->mem_ranges = new_array;
+	mrange_info->mem_ranges_sz = new_size;
+	mrange_info->max_mem_ranges = (new_size /
+				       sizeof(struct fadump_memory_range));
 	return 0;
 }
 
-static inline int fadump_add_crash_memory(unsigned long long base,
-					  unsigned long long end)
+static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
+				       u64 base, u64 end)
 {
-	u64  start, size;
+	struct fadump_memory_range *mem_ranges = mrange_info->mem_ranges;
 	bool is_adjacent = false;
+	u64 start, size;
 
 	if (base == end)
 		return 0;
@@ -677,38 +676,41 @@ static inline int fadump_add_crash_memory(unsigned long long base,
 	 * Fold adjacent memory ranges to bring down the memory ranges/
 	 * PT_LOAD segments count.
 	 */
-	if (crash_mem_ranges) {
-		start = crash_memory_ranges[crash_mem_ranges - 1].base;
-		size = crash_memory_ranges[crash_mem_ranges - 1].size;
+	if (mrange_info->mem_range_cnt) {
+		start = mem_ranges[mrange_info->mem_range_cnt - 1].base;
+		size  = mem_ranges[mrange_info->mem_range_cnt - 1].size;
 
 		if ((start + size) == base)
 			is_adjacent = true;
 	}
 	if (!is_adjacent) {
 		/* resize the array on reaching the limit */
-		if (crash_mem_ranges == max_crash_mem_ranges) {
+		if (mrange_info->mem_range_cnt == mrange_info->max_mem_ranges) {
 			int ret;
 
-			ret = allocate_crash_memory_ranges();
+			ret = fadump_alloc_mem_ranges(mrange_info);
 			if (ret)
 				return ret;
+
+			/* Update to the new resized array */
+			mem_ranges = mrange_info->mem_ranges;
 		}
 
 		start = base;
-		crash_memory_ranges[crash_mem_ranges].base = start;
-		crash_mem_ranges++;
+		mem_ranges[mrange_info->mem_range_cnt].base = start;
+		mrange_info->mem_range_cnt++;
 	}
 
-	crash_memory_ranges[crash_mem_ranges - 1].size = (end - start);
-	pr_debug("crash_memory_range[%d] [%#016llx-%#016llx], %#llx bytes\n",
-		(crash_mem_ranges - 1), start, end - 1, (end - start));
+	mem_ranges[mrange_info->mem_range_cnt - 1].size = (end - start);
+	pr_debug("%s_memory_range[%d] [%#016llx-%#016llx], %#llx bytes\n",
+		 mrange_info->name, (mrange_info->mem_range_cnt - 1),
+		 start, end - 1, (end - start));
 	return 0;
 }
 
-static int fadump_exclude_reserved_area(unsigned long long start,
-					unsigned long long end)
+static int fadump_exclude_reserved_area(u64 start, u64 end)
 {
-	unsigned long long ra_start, ra_end;
+	u64 ra_start, ra_end;
 	int ret = 0;
 
 	ra_start = fw_dump.reserve_dump_area_start;
@@ -716,18 +718,22 @@ static int fadump_exclude_reserved_area(unsigned long long start,
 
 	if ((ra_start < end) && (ra_end > start)) {
 		if ((start < ra_start) && (end > ra_end)) {
-			ret = fadump_add_crash_memory(start, ra_start);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   start, ra_start);
 			if (ret)
 				return ret;
 
-			ret = fadump_add_crash_memory(ra_end, end);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   ra_end, end);
 		} else if (start < ra_start) {
-			ret = fadump_add_crash_memory(start, ra_start);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   start, ra_start);
 		} else if (ra_end < end) {
-			ret = fadump_add_crash_memory(ra_end, end);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   ra_end, end);
 		}
 	} else
-		ret = fadump_add_crash_memory(start, end);
+		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
 
 	return ret;
 }
@@ -772,11 +778,11 @@ static int fadump_init_elfcore_header(char *bufp)
 static int fadump_setup_crash_memory_ranges(void)
 {
 	struct memblock_region *reg;
-	unsigned long long start, end;
+	u64 start, end;
 	int ret;
 
 	pr_debug("Setup crash memory ranges.\n");
-	crash_mem_ranges = 0;
+	crash_mrange_info.mem_range_cnt = 0;
 
 	/*
 	 * add the first memory chunk (RMA_START through boot_memory_size) as
@@ -785,13 +791,14 @@ static int fadump_setup_crash_memory_ranges(void)
 	 * specified during fadump registration. We need to create a separate
 	 * program header for this chunk with the correct offset.
 	 */
-	ret = fadump_add_crash_memory(RMA_START, fw_dump.boot_memory_size);
+	ret = fadump_add_mem_range(&crash_mrange_info,
+				   RMA_START, fw_dump.boot_memory_size);
 	if (ret)
 		return ret;
 
 	for_each_memblock(memory, reg) {
-		start = (unsigned long long)reg->base;
-		end = start + (unsigned long long)reg->size;
+		start = (u64)reg->base;
+		end = start + (u64)reg->size;
 
 		/*
 		 * skip the first memory chunk that is already added (RMA_START
@@ -876,11 +883,11 @@ static int fadump_create_elfcore_headers(char *bufp)
 
 	/* setup PT_LOAD sections. */
 
-	for (i = 0; i < crash_mem_ranges; i++) {
-		unsigned long long mbase, msize;
-		mbase = crash_memory_ranges[i].base;
-		msize = crash_memory_ranges[i].size;
+	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
+		u64 mbase, msize;
 
+		mbase = crash_mrange_info.mem_ranges[i].base;
+		msize = crash_mrange_info.mem_ranges[i].size;
 		if (!msize)
 			continue;
 
@@ -973,7 +980,7 @@ void fadump_cleanup(void)
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
 		fw_dump.ops->fadump_unregister(&fw_dump);
-		free_crash_memory_ranges();
+		fadump_free_mem_ranges(&crash_mrange_info);
 	}
 
 	if (fw_dump.ops->fadump_cleanup)

