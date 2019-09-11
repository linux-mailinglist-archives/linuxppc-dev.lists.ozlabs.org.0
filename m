Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE49B0026
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:34:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5YV2HpfzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4b1509vzF3CS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4b12Yz6z8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4b10qSHz9sNF; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4b043sKz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:50:52 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgvnv101574
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:51 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0uj5eey-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:50 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:50:48 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:50:46 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEoi5v30343222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:50:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6C0F4C04E;
 Wed, 11 Sep 2019 14:50:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D044C040;
 Wed, 11 Sep 2019 14:50:42 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:50:42 +0000 (GMT)
Subject: [PATCH v6 15/36] powerpc/fadump: improve fadump_reserve_mem()
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:20:41 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0DD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B11
Message-Id: <156821343485.5656.10202857091553646948.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=970 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Some code clean-up like using minimal assignments and updating printk
messages. Also, add an 'error_out' label for handling error cleanup
at one place.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* New patch for code clean-up.


 arch/powerpc/kernel/fadump.c |   48 ++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b17673d..7d47d4bb 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -338,16 +338,15 @@ static void __init fadump_reserve_crash_area(unsigned long base,
 
 int __init fadump_reserve_mem(void)
 {
-	unsigned long base, size, memory_boundary;
+	u64 base, size, mem_boundary;
+	int ret = 1;
 
 	if (!fw_dump.fadump_enabled)
 		return 0;
 
 	if (!fw_dump.fadump_supported) {
-		printk(KERN_INFO "Firmware-assisted dump is not supported on"
-				" this hardware\n");
-		fw_dump.fadump_enabled = 0;
-		return 0;
+		pr_info("Firmware-Assisted Dump is not supported on this hardware\n");
+		goto error_out;
 	}
 	/*
 	 * Initialize boot memory size
@@ -355,7 +354,8 @@ int __init fadump_reserve_mem(void)
 	 * first kernel.
 	 */
 	if (!fw_dump.dump_active) {
-		fw_dump.boot_memory_size = fadump_calculate_reserve_size();
+		fw_dump.boot_memory_size =
+			PAGE_ALIGN(fadump_calculate_reserve_size());
 #ifdef CONFIG_CMA
 		if (!fw_dump.nocma)
 			fw_dump.boot_memory_size =
@@ -381,10 +381,11 @@ int __init fadump_reserve_mem(void)
 				" dump, now %#016llx\n", memory_limit);
 	}
 	if (memory_limit)
-		memory_boundary = memory_limit;
+		mem_boundary = memory_limit;
 	else
-		memory_boundary = memblock_end_of_DRAM();
+		mem_boundary = memblock_end_of_DRAM();
 
+	base = fw_dump.boot_memory_size;
 	size = get_fadump_area_size();
 	fw_dump.reserve_dump_area_size = size;
 	if (fw_dump.dump_active) {
@@ -404,8 +405,7 @@ int __init fadump_reserve_mem(void)
 		 * dump is written to disk by userspace tool. This memory
 		 * will be released for general use once the dump is saved.
 		 */
-		base = fw_dump.boot_memory_size;
-		size = memory_boundary - base;
+		size = mem_boundary - base;
 		fadump_reserve_crash_area(base, size);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
@@ -418,29 +418,31 @@ int __init fadump_reserve_mem(void)
 		 * use memblock_find_in_range() here since it doesn't allocate
 		 * from bottom to top.
 		 */
-		for (base = fw_dump.boot_memory_size;
-		     base <= (memory_boundary - size);
-		     base += size) {
+		while (base <= (mem_boundary - size)) {
 			if (memblock_is_region_memory(base, size) &&
 			    !memblock_is_region_reserved(base, size))
 				break;
+
+			base += size;
 		}
-		if ((base > (memory_boundary - size)) ||
+
+		if ((base > (mem_boundary - size)) ||
 		    memblock_reserve(base, size)) {
-			pr_err("Failed to reserve memory\n");
-			return 0;
+			pr_err("Failed to reserve memory!\n");
+			goto error_out;
 		}
 
-		pr_info("Reserved %ldMB of memory at %ldMB for firmware-"
-			"assisted dump (System RAM: %ldMB)\n",
-			(unsigned long)(size >> 20),
-			(unsigned long)(base >> 20),
-			(unsigned long)(memblock_phys_mem_size() >> 20));
+		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
+			(size >> 20), base, (memblock_phys_mem_size() >> 20));
 
 		fw_dump.reserve_dump_area_start = base;
-		return fadump_cma_init();
+		ret = fadump_cma_init();
 	}
-	return 1;
+
+	return ret;
+error_out:
+	fw_dump.fadump_enabled = 0;
+	return 0;
 }
 
 unsigned long __init arch_reserved_kernel_pages(void)

