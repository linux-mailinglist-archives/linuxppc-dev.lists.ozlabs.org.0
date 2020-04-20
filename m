Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 059871B0532
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 11:04:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495LPD3z6MzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:04:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495LCk0XdRzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:56:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 495LCj1Pb2z9BWQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:56:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 495LCh6FJ6z9sSg; Mon, 20 Apr 2020 18:56:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 495LCh1YYLz9sR4
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 18:56:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K8WoTB022244
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 04:56:30 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gg26c2ec-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 04:56:29 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 20 Apr 2020 09:55:46 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 09:55:44 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K8uOB055705726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 08:56:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE9E052054;
 Mon, 20 Apr 2020 08:56:24 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.25.223])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2825752050;
 Mon, 20 Apr 2020 08:56:22 +0000 (GMT)
Subject: [PATCH v3 2/2] powerpc/fadump: consider reserved ranges while
 reserving memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 20 Apr 2020 14:26:22 +0530
In-Reply-To: <158737294432.26700.4830263187856221314.stgit@hbathini.in.ibm.com>
References: <158737294432.26700.4830263187856221314.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20042008-4275-0000-0000-000003C32A8E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042008-4276-0000-0000-000038D8AB98
Message-Id: <158737297693.26700.16193820746269425424.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=2 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200072
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
Cc: stable@vger.kernel.org, Vasant Hegde <hegdevasant@linux.ibm.com>,
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
Cc: stable@vger.kernel.org
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---

Changes in v3:
* Updated fadump_locate_reserve_mem() to use return '0' instead of an out parameter
  as suggested by Mahesh and added his 'Reviewed-by' tag with that change.


 arch/powerpc/kernel/fadump.c |   76 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 679277b..63aac8b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -445,10 +445,72 @@ static int __init fadump_get_boot_mem_regions(void)
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
+	u64 i, ret = 0;
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
+			if (!overlaps_reserved_ranges(base, base+size, &idx)) {
+				ret = base;
+				goto out;
+			}
+
+			base = mrngs[idx].base + mrngs[idx].size;
+			base = PAGE_ALIGN(base);
+		}
+	}
+
+out:
+	return ret;
+}
+
 int __init fadump_reserve_mem(void)
 {
-	u64 base, size, mem_boundary, bootmem_min, align = PAGE_SIZE;
-	bool is_memblock_bottom_up = memblock_bottom_up();
+	u64 base, size, mem_boundary, bootmem_min;
 	int ret = 1;
 
 	if (!fw_dump.fadump_enabled)
@@ -469,9 +531,9 @@ int __init fadump_reserve_mem(void)
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
 
@@ -539,11 +601,7 @@ int __init fadump_reserve_mem(void)
 		 * Reserve memory at an offset closer to bottom of the RAM to
 		 * minimize the impact of memory hot-remove operation.
 		 */
-		memblock_set_bottom_up(true);
-		base = memblock_find_in_range(base, mem_boundary, size, align);
-
-		/* Restore the previous allocation mode */
-		memblock_set_bottom_up(is_memblock_bottom_up);
+		base = fadump_locate_reserve_mem(base, size);
 
 		if (!base) {
 			pr_err("Failed to find memory chunk for reservation!\n");

