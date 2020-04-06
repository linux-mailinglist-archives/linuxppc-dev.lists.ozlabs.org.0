Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595019EF9B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:55:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wcBc2Gg6zDqgb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wc456NnyzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:49:41 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0363msZH022893
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 5 Apr 2020 23:49:38 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306p7snqd8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 23:49:38 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 6 Apr 2020 04:49:15 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Apr 2020 04:49:12 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0363nW2D53084336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 03:49:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3553B11C04C;
 Mon,  6 Apr 2020 03:49:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250E611C052;
 Mon,  6 Apr 2020 03:49:31 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.79.179.162])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 03:49:30 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 2/5] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
Date: Mon,  6 Apr 2020 09:19:22 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200406034925.22586-1-bharata@linux.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040603-0016-0000-0000-000002FF197D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040603-0017-0000-0000-00003362EE1F
Message-Id: <20200406034925.22586-3-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-05_11:2020-04-03,
 2020-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060025
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Memory that gets hot-plugged _during_ boot (and not the memory
that gets plugged in after boot), is mapped with 1G mappings
and will undergo splitting when it is unplugged. The splitting
code has a few issues:

1. Recursive locking
--------------------
Memory unplug path takes cpu_hotplug_lock and calls stop_machine()
for splitting the mappings. However stop_machine() takes
cpu_hotplug_lock again causing deadlock.

2. BUG: sleeping function called from in_atomic() context
---------------------------------------------------------
Memory unplug path (remove_pagetable) takes init_mm.page_table_lock
spinlock and later calls stop_machine() which does wait_for_completion()

3. Bad unlock unbalance
-----------------------
Memory unplug path takes init_mm.page_table_lock spinlock and calls
stop_machine(). The stop_machine thread function runs in a different
thread context (migration thread) which tries to release and reaquire
ptl. Releasing ptl from a different thread than which acquired it
causes bad unlock unbalance.

These problems can be avoided if we avoid mapping hot-plugged memory
with 1G mapping, thereby removing the need for splitting them during
unplug. During radix init, identify(*) the hot-plugged memory region
and create separate mappings for each LMB so that they don't get mapped
with 1G mappings.

To create separate mappings for every LMB in the hot-plugged
region, we need lmb-size. I am currently using memory_block_size_bytes()
API to get the lmb-size. Since this is early init time code, the
machine type isn't probed yet and hence memory_block_size_bytes()
would return the default LMB size as 16MB. Hence we end up creating
separate mappings at much lower granularity than what we can ideally
do for pseries machine.

(*) Identifying and differentiating hot-plugged memory from the
boot time memory is now possible with PAPR extension to LMB flags.
(Ref: https://lore.kernel.org/linuxppc-dev/f55a7b65a43cc9dc7b22385cf9960f8b11d5ce2e.camel@linux.ibm.com/T/#t)

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index dd1bea45325c..4a4fb30f6c3d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -16,6 +16,7 @@
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/stop_machine.h>
+#include <linux/memory.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -313,6 +314,8 @@ static void __init radix_init_pgtable(void)
 {
 	unsigned long rts_field;
 	struct memblock_region *reg;
+	phys_addr_t addr;
+	u64 lmb_size = memory_block_size_bytes();
 
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
@@ -331,9 +334,15 @@ static void __init radix_init_pgtable(void)
 			continue;
 		}
 
-		WARN_ON(create_physical_mapping(reg->base,
-						reg->base + reg->size,
-						-1));
+		if (memblock_is_hotpluggable(reg)) {
+			for (addr = reg->base; addr < (reg->base + reg->size);
+				addr += lmb_size)
+				WARN_ON(create_physical_mapping(addr,
+				addr + lmb_size, -1));
+		} else
+			WARN_ON(create_physical_mapping(reg->base,
+							reg->base + reg->size,
+							-1));
 	}
 
 	/* Find out how many PID bits are supported */
-- 
2.21.0

