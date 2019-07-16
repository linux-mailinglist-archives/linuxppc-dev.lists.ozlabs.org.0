Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B43006A827
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 14:04:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzZy4DMRzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 22:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nywF2pKvzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nywD1WkLz8sxT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nywD0hNgz9sNC; Tue, 16 Jul 2019 21:34:04 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nywC3lKTz9s8m
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:34:03 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMbsQ080445
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:02 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsbp5dfwn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:01 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:59 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:57 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBXtUk50528334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B61F1AE058;
 Tue, 16 Jul 2019 11:33:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27A9DAE051;
 Tue, 16 Jul 2019 11:33:54 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:53 +0000 (GMT)
Subject: [PATCH v4 16/25] powerpc/fadump: consider reserved ranges while
 reserving memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:53 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0020-0000-0000-00000354053E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0021-0000-0000-000021A7D120
Message-Id: <156327683333.27462.16508019226700071.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
memory reservations") enabled support to parse reserved-ranges DT
node and reserve kernel memory falling in these ranges for F/W
purposes. Ensure memory in these ranges is not overlapped with
memory reserved for FADump.

Also, use a smaller offset, instead of the size of the memory to
be reserved, by which to skip memory before making another attempt
at reserving memory, after the previous attempt to reserve memory
for FADump failed due to memory holes and/or reserved ranges, to
reduce the likelihood of memory reservation failure.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h |   13 +++
 arch/powerpc/kernel/fadump.c        |  143 ++++++++++++++++++++++++++++++++++-
 2 files changed, 149 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 06d9ecf..968745a 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -86,7 +86,7 @@ struct fadump_crash_info_header {
 	struct cpumask	online_mask;
 };
 
-struct fad_crash_memory_ranges {
+struct fadump_memory_range {
 	unsigned long long	base;
 	unsigned long long	size;
 };
@@ -94,6 +94,17 @@ struct fad_crash_memory_ranges {
 /* Platform specific callback functions */
 struct fadump_ops;
 
+/*
+ * Amount of memory (1024MB) to skip before making another attempt at
+ * reserving memory (after the previous attempt to reserve memory for
+ * FADump failed due to memory holes and/or reserved ranges) to reduce
+ * the likelihood of memory reservation failure.
+ */
+#define FADUMP_OFFSET_SIZE			0x40000000U
+
+/* Maximum no. of reserved ranges supported for processing. */
+#define FADUMP_MAX_RESERVED_RANGES		128
+
 /* Maximum number of memory regions kernel supports */
 #define FADUMP_MAX_MEM_REGS			128
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index abf4f334..bface37 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,11 +36,14 @@
 static struct fw_dump fw_dump;
 
 static DEFINE_MUTEX(fadump_mutex);
-struct fad_crash_memory_ranges *crash_memory_ranges;
+struct fadump_memory_range *crash_memory_ranges;
 int crash_memory_ranges_size;
 int crash_mem_ranges;
 int max_crash_mem_ranges;
 
+struct fadump_memory_range reserved_ranges[FADUMP_MAX_RESERVED_RANGES];
+int reserved_ranges_cnt;
+
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
 
@@ -104,12 +107,116 @@ int __init fadump_cma_init(void)
 static int __init fadump_cma_init(void) { return 1; }
 #endif /* CONFIG_CMA */
 
+/*
+ * Sort the reserved ranges in-place and merge adjacent ranges
+ * to minimize the reserved ranges count.
+ */
+static void __init sort_and_merge_reserved_ranges(void)
+{
+	unsigned long long base, size;
+	struct fadump_memory_range tmp_range;
+	int i, j, idx;
+
+	if (!reserved_ranges_cnt)
+		return;
+
+	/* Sort the reserved ranges */
+	for (i = 0; i < reserved_ranges_cnt; i++) {
+		idx = i;
+		for (j = i + 1; j < reserved_ranges_cnt; j++) {
+			if (reserved_ranges[idx].base > reserved_ranges[j].base)
+				idx = j;
+		}
+		if (idx != i) {
+			tmp_range = reserved_ranges[idx];
+			reserved_ranges[idx] = reserved_ranges[i];
+			reserved_ranges[i] = tmp_range;
+		}
+	}
+
+	/* Merge adjacent reserved ranges */
+	idx = 0;
+	for (i = 1; i < reserved_ranges_cnt; i++) {
+		base = reserved_ranges[i-1].base;
+		size = reserved_ranges[i-1].size;
+		if (reserved_ranges[i].base == (base + size))
+			reserved_ranges[idx].size += reserved_ranges[i].size;
+		else {
+			idx++;
+			if (i == idx)
+				continue;
+
+			reserved_ranges[idx] = reserved_ranges[i];
+		}
+	}
+	reserved_ranges_cnt = idx + 1;
+}
+
+static int __init add_reserved_range(unsigned long base,
+				     unsigned long size)
+{
+	int i;
+
+	if (reserved_ranges_cnt == FADUMP_MAX_RESERVED_RANGES) {
+		/* Compact reserved ranges and try again. */
+		sort_and_merge_reserved_ranges();
+		if (reserved_ranges_cnt == FADUMP_MAX_RESERVED_RANGES)
+			return 0;
+	}
+
+	i = reserved_ranges_cnt++;
+	reserved_ranges[i].base = base;
+	reserved_ranges[i].size = size;
+	return 1;
+}
+
+/*
+ * Scan reserved-ranges to consider them while reserving/releasing
+ * memory for FADump.
+ */
+static void __init early_init_dt_scan_reserved_ranges(unsigned long node)
+{
+	int len, ret;
+	unsigned long i;
+	const __be32 *prop;
+
+	/* reserved-ranges already scanned */
+	if (reserved_ranges_cnt != 0)
+		return;
+
+	prop = of_get_flat_dt_prop(node, "reserved-ranges", &len);
+
+	if (!prop)
+		return;
+
+	/*
+	 * Each reserved range is an (address,size) pair, 2 cells each,
+	 * totalling 4 cells per range.
+	 */
+	for (i = 0; i < len / (sizeof(*prop) * 4); i++) {
+		u64 base, size;
+
+		base = of_read_number(prop + (i * 4) + 0, 2);
+		size = of_read_number(prop + (i * 4) + 2, 2);
+
+		if (size) {
+			ret = add_reserved_range(base, size);
+			if (ret == 0)
+				pr_warn("some reserved ranges are ignored!\n");
+		}
+	}
+}
+
 /* Scan the Firmware Assisted dump configuration details. */
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	if (depth != 1)
+	if (depth != 1) {
+		if (depth == 0)
+			early_init_dt_scan_reserved_ranges(node);
+
 		return 0;
+	}
 
 	if (strcmp(uname, "rtas") == 0)
 		return rtas_fadump_dt_scan(&fw_dump, node);
@@ -355,6 +462,26 @@ static int __init fadump_get_boot_mem_regions(void)
 	return ret;
 }
 
+static bool overlaps_with_reserved_ranges(ulong base, ulong end)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < reserved_ranges_cnt; i++) {
+		ulong rbase = (ulong)reserved_ranges[i].base;
+		ulong rend = rbase + (ulong)reserved_ranges[i].size;
+
+		if (end <= rbase)
+			break;
+
+		if ((end > rbase) &&  (base < rend)) {
+			ret = 1;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static void __init fadump_reserve_crash_area(unsigned long base,
 					     unsigned long size)
 {
@@ -388,6 +515,9 @@ int __init fadump_reserve_mem(void)
 		goto error_out;
 	}
 
+	/* Compact reserved ranges */
+	sort_and_merge_reserved_ranges();
+
 	/*
 	 * Initialize boot memory size
 	 * If dump is active then we have already calculated the size during
@@ -447,10 +577,11 @@ int __init fadump_reserve_mem(void)
 		 */
 		while (base <= (memory_boundary - size)) {
 			if (memblock_is_region_memory(base, size) &&
-			    !memblock_is_region_reserved(base, size))
+			    !memblock_is_region_reserved(base, size) &&
+			    !overlaps_with_reserved_ranges(base, (base+size)))
 				break;
 
-			base += size;
+			base += FADUMP_OFFSET_SIZE;
 		}
 
 		if (base > (memory_boundary - size)) {
@@ -579,7 +710,7 @@ static void free_crash_memory_ranges(void)
  */
 static int allocate_crash_memory_ranges(void)
 {
-	struct fad_crash_memory_ranges *new_array;
+	struct fadump_memory_range *new_array;
 	u64 new_size;
 
 	new_size = crash_memory_ranges_size + PAGE_SIZE;
@@ -596,7 +727,7 @@ static int allocate_crash_memory_ranges(void)
 	crash_memory_ranges = new_array;
 	crash_memory_ranges_size = new_size;
 	max_crash_mem_ranges = (new_size /
-				sizeof(struct fad_crash_memory_ranges));
+				sizeof(struct fadump_memory_range));
 	return 0;
 }
 

