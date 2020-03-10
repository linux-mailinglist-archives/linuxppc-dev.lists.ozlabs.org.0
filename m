Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CEC18092E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 21:30:19 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cRXw3j7szDql2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 07:30:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cRTm5NVkzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48cRTm512sz8t94
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:27:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48cRTm4dDbz9sPR; Wed, 11 Mar 2020 07:27:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48cRTl6mHfz9sPJ
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Mar 2020 07:27:23 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AKO83w096224
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Mar 2020 16:27:21 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ynrat4awa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Mar 2020 16:27:20 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 10 Mar 2020 20:27:17 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Mar 2020 20:27:15 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02AKRErn52101142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 20:27:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41936A405F;
 Tue, 10 Mar 2020 20:27:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA8D8A405C;
 Tue, 10 Mar 2020 20:27:11 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.199.40.189])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 20:27:11 +0000 (GMT)
Subject: [PATCH 2/2] powerpc/fadump: consider reserved ranges while
 reserving memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Mar 2020 01:57:10 +0530
In-Reply-To: <158387202020.17176.15258122288090851051.stgit@hbathini.in.ibm.com>
References: <158387202020.17176.15258122288090851051.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031020-0008-0000-0000-0000035B4994
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031020-0009-0000-0000-00004A7C8DEA
Message-Id: <158387202999.17176.116917127748245682.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_13:2020-03-10,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=2 clxscore=1015 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100120
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
Cc: Vasant Hegde <hegdevasant@linux.ibm.com>, stable@vger.kernel.org#v5.4+,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
memory reservations") enabled support to parse reserved-ranges DT
node and reserve kernel memory falling in these ranges for F/W
purposes. Memory reserved for FADump should not overlap with these
ranges as it could corrupt memory meant for F/W or crash'ed kernel
memory to be exported as vmcore.

But since commit 579ca1a27675 ("powerpc/fadump: make use of memblock's
bottom up allocation mode"), memblock_find_in_range() is being used to
find the appropriate area to reserve memory for FADump, which can't
account for reserved-ranges as these ranges are reserved only after
FADump memory reservation.

With reserved-ranges now being populated during early boot, look out
for these memory ranges while reserving memory for FADump. Without
this change, MPIPL on PowerNV systems aborts with hostboot failure,
when memory reserved for FADump is less than 4096MB.

Fixes: 579ca1a27675 ("powerpc/fadump: make use of memblock's bottom up allocation mode")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c |   76 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 7fcf4a8f..ab83be9 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -443,10 +443,70 @@ static int __init fadump_get_boot_mem_regions(void)
 	return ret;
 }
 
+/*
+ * Returns true, if the given range overlaps with reserved memory ranges
+ * starting at idx. Also, updates idx to index of overlapping memory range
+ * with the given memory range.
+ * False, otherwise.
+ */
+static bool overlaps_reserved_ranges(u64 base, u64 end, int *idx)
+{
+	bool ret = false;
+	int i;
+
+	for (i = *idx; i < reserved_mrange_info.mem_range_cnt; i++) {
+		u64 rbase = reserved_mrange_info.mem_ranges[i].base;
+		u64 rend = rbase + reserved_mrange_info.mem_ranges[i].size;
+
+		if (end <= rbase)
+			break;
+
+		if ((end > rbase) &&  (base < rend)) {
+			*idx = i;
+			ret = true;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Locate a suitable memory area to reserve memory for FADump. While at it,
+ * lookup reserved-ranges & avoid overlap with them, as they are used by F/W.
+ */
+static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
+{
+	struct fadump_memory_range *mrngs;
+	phys_addr_t mstart, mend;
+	int idx = 0;
+	u64 i;
+
+	mrngs = reserved_mrange_info.mem_ranges;
+	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
+				&mstart, &mend, NULL) {
+		pr_debug("%llu) mstart: %llx, mend: %llx, base: %llx\n",
+			 i, mstart, mend, base);
+
+		if (mstart > base)
+			base = PAGE_ALIGN(mstart);
+
+		while ((mend > base) && ((mend - base) >= size)) {
+			if (!overlaps_reserved_ranges(base, base + size, &idx))
+				goto out;
+
+			base = mrngs[idx].base + mrngs[idx].size;
+			base = PAGE_ALIGN(base);
+		}
+	}
+
+out:
+	return base;
+}
+
 int __init fadump_reserve_mem(void)
 {
-	u64 base, size, mem_boundary, bootmem_min, align = PAGE_SIZE;
-	bool is_memblock_bottom_up = memblock_bottom_up();
+	u64 base, size, mem_boundary, bootmem_min;
 	int ret = 1;
 
 	if (!fw_dump.fadump_enabled)
@@ -467,9 +527,9 @@ int __init fadump_reserve_mem(void)
 			PAGE_ALIGN(fadump_calculate_reserve_size());
 #ifdef CONFIG_CMA
 		if (!fw_dump.nocma) {
-			align = FADUMP_CMA_ALIGNMENT;
 			fw_dump.boot_memory_size =
-				ALIGN(fw_dump.boot_memory_size, align);
+				ALIGN(fw_dump.boot_memory_size,
+				      FADUMP_CMA_ALIGNMENT);
 		}
 #endif
 
@@ -537,13 +597,9 @@ int __init fadump_reserve_mem(void)
 		 * Reserve memory at an offset closer to bottom of the RAM to
 		 * minimize the impact of memory hot-remove operation.
 		 */
-		memblock_set_bottom_up(true);
-		base = memblock_find_in_range(base, mem_boundary, size, align);
-
-		/* Restore the previous allocation mode */
-		memblock_set_bottom_up(is_memblock_bottom_up);
+		base = fadump_locate_reserve_mem(base, size);
 
-		if (!base) {
+		if (base > (mem_boundary - size)) {
 			pr_err("Failed to find memory chunk for reservation!\n");
 			goto error_out;
 		}

