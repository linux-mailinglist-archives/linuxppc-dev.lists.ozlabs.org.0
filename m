Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B016D243D2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSBgS3mc3zDqdh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 02:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NYTTemxb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSBdN5ds0zDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 02:20:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DG1NDk160772; Thu, 13 Aug 2020 12:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=31fuUZXzJumOExjBZ0NYB6dl8BOWMkTWGfwnHX9zUQk=;
 b=NYTTemxbx7Ns3pczbSX+FRB5K3GUS9Ne8LzRqy2rqMPWTSkvMGkGoB65IEMngBstrQzf
 c2C2CC8tvD6shMfudq3n39TPLgMyu/LT7NatKVFIhkz7qBqSJkeV8WwKlSVkkeIO9UMs
 fKiQ9AD5vQhsW3rTY0ozDQFJ41A7A3NQMafDYTCrn4eUuS9lCD9acciSRuj+rZto/6rM
 QcVgw3r86tl315m0Tp1NPDTKlthPkVuEWDf03RcOOiNXNSCIwWrE6bWncXD/okC6XIAX
 UeN/b10vNRgf5w0ZNNcRT3b9NA8oE7Dxdc/qOf6ZBW/T5mC4XRTEjJcIhJw4yRl9MK4f qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w4b9j5eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 12:20:49 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07DGJK4b038342;
 Thu, 13 Aug 2020 12:20:49 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w4b9j5e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 12:20:49 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07DGAVhN032508;
 Thu, 13 Aug 2020 16:20:49 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 32skp9k9xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 16:20:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07DGKlAs53739840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 16:20:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 808E2112062;
 Thu, 13 Aug 2020 16:20:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A9A2112061;
 Thu, 13 Aug 2020 16:20:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.219.81])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 16:20:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/radix: Fix boot failure with large amount of
 guest memory
Date: Thu, 13 Aug 2020 21:50:39 +0530
Message-Id: <20200813162039.608649-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_14:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130116
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Shirisha Ganta <shiganta@in.ibm.com>, Sandipan Das <sandipan@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the hypervisor doesn't support hugepages, the kernel ends up allocating a large
number of page table pages. The early page table allocation was wrongly
setting the max memblock limit to ppc64_rma_size with radix translation
which resulted in boot failure as shown below.

Kernel panic - not syncing:
early_alloc_pgtable: Failed to allocate 16777216 bytes align=0x1000000 nid=-1 from=0x0000000000000000 max_addr=0xffffffffffffffff
 CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-24.9-default+ #2
 Call Trace:
 [c0000000016f3d00] [c0000000007c6470] dump_stack+0xc4/0x114 (unreliable)
 [c0000000016f3d40] [c00000000014c78c] panic+0x164/0x418
 [c0000000016f3dd0] [c000000000098890] early_alloc_pgtable+0xe0/0xec
 [c0000000016f3e60] [c0000000010a5440] radix__early_init_mmu+0x360/0x4b4
 [c0000000016f3ef0] [c000000001099bac] early_init_mmu+0x1c/0x3c
 [c0000000016f3f10] [c00000000109a320] early_setup+0x134/0x170

This was because the kernel was checking for the radix feature before we enable the
feature via mmu_features. This resulted in the kernel using hash restrictions on
radix.

Rework the early init code such that the kernel boot with memblock restrictions
as imposed by hash. At that point, the kernel still hasn't finalized the
translation the kernel will end up using.

We have three different ways of detecting radix.

1. dt_cpu_ftrs_scan -> used only in case of PowerNV
2. ibm,pa-features -> Used when we don't use cpu_dt_ftr_scan
3. CAS -> Where we negotiate with hypervisor about the supported translation.

We look at 1 or 2 early in the boot and after that, we look at the CAS vector to
finalize the translation the kernel will use. We also support a kernel command
line option (disable_radix) to switch to hash.

Update the memblock limit after mmu_early_init_devtree() if the kernel is going
to use radix translation. This forces some of the memblock allocations we do before
mmu_early_init_devtree() to be within the RMA limit.

Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early init routines")
Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 8 +++++---
 arch/powerpc/kernel/prom.c               | 6 ++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 55442d45c597..4245f99453f5 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -244,9 +244,11 @@ extern void radix__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 					      phys_addr_t first_memblock_size)
 {
-	if (early_radix_enabled())
-		return radix__setup_initial_memory_limit(first_memblock_base,
-						   first_memblock_size);
+	/*
+	 * Hash has more strict restrictions. At this point we don't
+	 * know which translations we will pick. Hence got with hash
+	 * restrictions.
+	 */
 	return hash__setup_initial_memory_limit(first_memblock_base,
 					   first_memblock_size);
 }
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d8a2fb87ba0c..340900ae95a4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -811,6 +811,12 @@ void __init early_init_devtree(void *params)
 
 	mmu_early_init_devtree();
 
+	/*
+	 * Reset ppc64_rma_size and memblock memory limit
+	 */
+	if (early_radix_enabled())
+		radix__setup_initial_memory_limit(memstart_addr, first_memblock_size);
+
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
 	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 28c784976bed..094daf16acac 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -747,6 +747,8 @@ void radix__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 * Radix mode is not limited by RMA / VRMA addressing.
 	 */
 	ppc64_rma_size = ULONG_MAX;
+
+	memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-- 
2.26.2

