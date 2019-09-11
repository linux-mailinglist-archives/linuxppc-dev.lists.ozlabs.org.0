Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E5B00D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6F027wQzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4hh4JZzzF1Dt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4hh02z7z8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4hg3Hc1z9sNT; Thu, 12 Sep 2019 00:55:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4hf6Fn9z9sNF
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:55:46 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgcx6089097
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:44 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy2dpsvd6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:43 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:55:42 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:55:40 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEtdKK46792726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:55:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C42011C058;
 Wed, 11 Sep 2019 14:55:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C5A11C05C;
 Wed, 11 Sep 2019 14:55:37 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:55:36 +0000 (GMT)
Subject: [PATCH v6 27/36] powerpc/fadump: consider reserved ranges while
 releasing memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:25:36 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C2A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D85F
Message-Id: <156821371358.5656.6061214942558818661.stgit@hbathini.in.ibm.com>
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

Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
memory reservations") enabled support to parse 'reserved-ranges' DT
node to reserve kernel memory falling in these ranges for firmware
purposes. Along with the preserved area memory, ensure memory in
reserved ranges is not overlapped with memory released by capture
kernel aftering saving vmcore. Also, fix the off-by-one error in
fadump_release_reserved_area function while releasing memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Use kernel types where possible.


 arch/powerpc/kernel/fadump.c |  167 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index f95ec1f..502e49a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,6 +36,7 @@ static struct fw_dump fw_dump;
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
+struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
 
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
@@ -1009,49 +1010,173 @@ static void fadump_free_reserved_memory(unsigned long start_pfn,
 /*
  * Skip memory holes and free memory that was actually reserved.
  */
-static void fadump_release_reserved_area(unsigned long start, unsigned long end)
+static void fadump_release_reserved_area(u64 start, u64 end)
 {
+	u64 tstart, tend, spfn, epfn;
 	struct memblock_region *reg;
-	unsigned long tstart, tend;
-	unsigned long start_pfn = PHYS_PFN(start);
-	unsigned long end_pfn = PHYS_PFN(end);
 
+	spfn = PHYS_PFN(start);
+	epfn = PHYS_PFN(end);
 	for_each_memblock(memory, reg) {
-		tstart = max(start_pfn, memblock_region_memory_base_pfn(reg));
-		tend = min(end_pfn, memblock_region_memory_end_pfn(reg));
+		tstart = max_t(u64, spfn, memblock_region_memory_base_pfn(reg));
+		tend   = min_t(u64, epfn, memblock_region_memory_end_pfn(reg));
 		if (tstart < tend) {
 			fadump_free_reserved_memory(tstart, tend);
 
-			if (tend == end_pfn)
+			if (tend == epfn)
 				break;
 
-			start_pfn = tend + 1;
+			spfn = tend;
 		}
 	}
 }
 
 /*
- * Release the memory that was reserved in early boot to preserve the memory
- * contents. The released memory will be available for general use.
+ * Sort the mem ranges in-place and merge adjacent ranges
+ * to minimize the memory ranges count.
  */
-static void fadump_release_memory(unsigned long begin, unsigned long end)
+static void sort_and_merge_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
-	unsigned long ra_start, ra_end;
+	struct fadump_memory_range *mem_ranges;
+	struct fadump_memory_range tmp_range;
+	u64 base, size;
+	int i, j, idx;
+
+	if (!reserved_mrange_info.mem_range_cnt)
+		return;
+
+	/* Sort the memory ranges */
+	mem_ranges = mrange_info->mem_ranges;
+	for (i = 0; i < mrange_info->mem_range_cnt; i++) {
+		idx = i;
+		for (j = (i + 1); j < mrange_info->mem_range_cnt; j++) {
+			if (mem_ranges[idx].base > mem_ranges[j].base)
+				idx = j;
+		}
+		if (idx != i) {
+			tmp_range = mem_ranges[idx];
+			mem_ranges[idx] = mem_ranges[i];
+			mem_ranges[i] = tmp_range;
+		}
+	}
+
+	/* Merge adjacent reserved ranges */
+	idx = 0;
+	for (i = 1; i < mrange_info->mem_range_cnt; i++) {
+		base = mem_ranges[i-1].base;
+		size = mem_ranges[i-1].size;
+		if (mem_ranges[i].base == (base + size))
+			mem_ranges[idx].size += mem_ranges[i].size;
+		else {
+			idx++;
+			if (i == idx)
+				continue;
+
+			mem_ranges[idx] = mem_ranges[i];
+		}
+	}
+	mrange_info->mem_range_cnt = idx + 1;
+}
+
+/*
+ * Scan reserved-ranges to consider them while reserving/releasing
+ * memory for FADump.
+ */
+static inline int fadump_scan_reserved_mem_ranges(void)
+{
+	struct device_node *root;
+	const __be32 *prop;
+	int len, ret = -1;
+	unsigned long i;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return ret;
+
+	prop = of_get_property(root, "reserved-ranges", &len);
+	if (!prop)
+		return ret;
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
+			ret = fadump_add_mem_range(&reserved_mrange_info,
+						   base, base + size);
+			if (ret < 0) {
+				pr_warn("some reserved ranges are ignored!\n");
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Release the memory that was reserved during early boot to preserve the
+ * crash'ed kernel's memory contents except reserved dump area (permanent
+ * reservation) and reserved ranges used by F/W. The released memory will
+ * be available for general use.
+ */
+static void fadump_release_memory(u64 begin, u64 end)
+{
+	u64 ra_start, ra_end, tstart;
+	int i, ret;
+
+	fadump_scan_reserved_mem_ranges();
 
 	ra_start = fw_dump.reserve_dump_area_start;
 	ra_end = ra_start + fw_dump.reserve_dump_area_size;
 
 	/*
-	 * exclude the dump reserve area. Will reuse it for next
-	 * fadump registration.
+	 * Add reserved dump area to reserved ranges list
+	 * and exclude all these ranges while releasing memory.
 	 */
-	if (begin < ra_end && end > ra_start) {
-		if (begin < ra_start)
-			fadump_release_reserved_area(begin, ra_start);
-		if (end > ra_end)
-			fadump_release_reserved_area(ra_end, end);
-	} else
-		fadump_release_reserved_area(begin, end);
+	ret = fadump_add_mem_range(&reserved_mrange_info, ra_start, ra_end);
+	if (ret != 0) {
+		/*
+		 * Not enough memory to setup reserved ranges but the system is
+		 * running shortage of memory. So, release all the memory except
+		 * Reserved dump area (reused for next fadump registration).
+		 */
+		if (begin < ra_end && end > ra_start) {
+			if (begin < ra_start)
+				fadump_release_reserved_area(begin, ra_start);
+			if (end > ra_end)
+				fadump_release_reserved_area(ra_end, end);
+		} else
+			fadump_release_reserved_area(begin, end);
+
+		return;
+	}
+
+	/* Get the reserved ranges list in order first. */
+	sort_and_merge_mem_ranges(&reserved_mrange_info);
+
+	/* Exclude reserved ranges and release remaining memory */
+	tstart = begin;
+	for (i = 0; i < reserved_mrange_info.mem_range_cnt; i++) {
+		ra_start = reserved_mrange_info.mem_ranges[i].base;
+		ra_end = ra_start + reserved_mrange_info.mem_ranges[i].size;
+
+		if (tstart >= ra_end)
+			continue;
+
+		if (tstart < ra_start)
+			fadump_release_reserved_area(tstart, ra_start);
+		tstart = ra_end;
+	}
+
+	if (tstart < end)
+		fadump_release_reserved_area(tstart, end);
 }
 
 static void fadump_invalidate_release_mem(void)

