Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DEE5599F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:04:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJYd2X86zDqR0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJ9p2wlbzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJ9p0XSzz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJ9n5MXXz9s9h; Wed, 26 Jun 2019 06:46:53 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJ9n144rz9s5c
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:46:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKhtik023928
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:51 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbs8fv2xj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:50 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:46:48 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:46:46 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKkjxm48955420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:46:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18A124203F;
 Tue, 25 Jun 2019 20:46:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0716542049;
 Tue, 25 Jun 2019 20:46:43 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:46:42 +0000 (GMT)
Subject: [PATCH v3 07/16] powerpc/fadump: consider reserved ranges while
 reserving memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:16:41 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0012-0000-0000-0000032C5C07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0013-0000-0000-0000216592FC
Message-Id: <156149560188.9094.3510443117172003202.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250157
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
 arch/powerpc/kernel/fadump-common.h |   11 +++
 arch/powerpc/kernel/fadump.c        |  137 ++++++++++++++++++++++++++++++++++-
 2 files changed, 145 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 36f4d71..555230e 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -101,6 +101,17 @@ struct fadump_memory_range {
 	unsigned long long	size;
 };
 
+/*
+ * Amount of memory (1024MB) to skip before making another attempt at
+ * reserving memory (after the previous attempt to reserve memory for
+ * FADump failed due to memory holes and/or reserved ranges) to reduce
+ * the likelihood of memory reservation failure.
+ */
+#define OFFSET_SIZE			0x40000000U
+
+/* Maximum no. of reserved ranges supported for processing. */
+#define MAX_RESERVED_RANGES		128
+
 /* Maximum no. of real memory regions supported by the kernel */
 #define MAX_REAL_MEM_REGIONS		8
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index f2c2d4a..1b3df8b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -41,6 +41,9 @@ int crash_memory_ranges_size;
 int crash_mem_ranges;
 int max_crash_mem_ranges;
 
+struct fadump_memory_range reserved_ranges[MAX_RESERVED_RANGES];
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
+	if (reserved_ranges_cnt == MAX_RESERVED_RANGES) {
+		/* Compact reserved ranges and try again. */
+		sort_and_merge_reserved_ranges();
+		if (reserved_ranges_cnt == MAX_RESERVED_RANGES)
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
 		return pseries_dt_scan_fadump(&fw_dump, node);
@@ -354,6 +461,26 @@ static int __init fadump_get_rmr_regions(void)
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
 /* Preserve everything above the base address */
 static void __init fadump_reserve_crash_area(unsigned long base)
 {
@@ -390,6 +517,9 @@ int __init fadump_reserve_mem(void)
 		goto error_out;
 	}
 
+	/* Compact reserved ranges */
+	sort_and_merge_reserved_ranges();
+
 	/*
 	 * Initialize boot memory size
 	 * If dump is active then we have already calculated the size during
@@ -464,10 +594,11 @@ int __init fadump_reserve_mem(void)
 		 */
 		while (base <= (memory_boundary - size)) {
 			if (memblock_is_region_memory(base, size) &&
-			    !memblock_is_region_reserved(base, size))
+			    !memblock_is_region_reserved(base, size) &&
+			    !overlaps_with_reserved_ranges(base, (base+size)))
 				break;
 
-			base += size;
+			base += OFFSET_SIZE;
 		}
 
 		if (base > (memory_boundary - size)) {

