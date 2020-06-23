Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64295204B49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:35:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rdN70N4tzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:35:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rdH82PCBzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:30:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05N78NYH052839; Tue, 23 Jun 2020 03:30:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31u5tvb7fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:30:34 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05N7A05Y057610;
 Tue, 23 Jun 2020 03:30:34 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31u5tvb7ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:30:33 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05N7U9DI012801;
 Tue, 23 Jun 2020 07:30:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 31sa381utm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 07:30:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05N7UTcL655790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 07:30:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3654EA405C;
 Tue, 23 Jun 2020 07:30:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFD0EA4054;
 Tue, 23 Jun 2020 07:30:25 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.54.229])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 07:30:25 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/3] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
Date: Tue, 23 Jun 2020 13:00:15 +0530
Message-Id: <20200623073017.1951-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623073017.1951-1-bharata@linux.ibm.com>
References: <20200623073017.1951-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_04:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 suspectscore=1 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 clxscore=1015 cotscore=-2147483648 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006230054
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
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
unplug. Hence, during radix init, identify the hot-plugged memory region
and create separate mappings for each LMB so that they don't get mapped
with 1G mappings. The identification of hot-plugged memory has become
possible after the commit b6eca183e23e ("powerpc/kernel: Enables memory
hot-remove after reboot on pseries guests").

To create separate mappings for every LMB in the hot-plugged
region, we need lmb-size for which we use memory_block_size_bytes().
Since this is early init time code, the machine type isn't probed yet
and hence memory_block_size_bytes() would return the default LMB size
as 16MB. Hence we end up issuing more number of mapping requests
than earlier.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 8acb96de0e48..ffccfe00ca2a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -16,6 +16,7 @@
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/stop_machine.h>
+#include <linux/memory.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -320,6 +321,8 @@ static void __init radix_init_pgtable(void)
 {
 	unsigned long rts_field;
 	struct memblock_region *reg;
+	phys_addr_t addr;
+	u64 lmb_size = memory_block_size_bytes();
 
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
@@ -338,9 +341,15 @@ static void __init radix_init_pgtable(void)
 			continue;
 		}
 
-		WARN_ON(create_physical_mapping(reg->base,
-						reg->base + reg->size,
-						-1, PAGE_KERNEL));
+		if (memblock_is_hotpluggable(reg)) {
+			for (addr = reg->base; addr < (reg->base + reg->size);
+			     addr += lmb_size)
+				WARN_ON(create_physical_mapping(addr,
+					addr + lmb_size, -1, PAGE_KERNEL));
+		} else
+			WARN_ON(create_physical_mapping(reg->base,
+							reg->base + reg->size,
+							-1, PAGE_KERNEL));
 	}
 
 	/* Find out how many PID bits are supported */
-- 
2.21.3

