Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85225A43B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:06:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh9N7703zzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:05:59 +1000 (AEST)
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
 header.s=pp1 header.b=iVKbenO8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh9H93FYhzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 14:01:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08240iV8183679; Wed, 2 Sep 2020 00:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CnzQ4+5jWPUw8wT4aFpo3p9+hSlVzAYgt2GZmkBQUh0=;
 b=iVKbenO8ZFBV6f+1d5WHd4/3aw11EupDaFZMsom1Zc939783HD+v6ZRguyFnANvxqSOm
 4KS1Wz54pqDBhD3mNNT9Gib20ZN/qmqLeVlMIuj1VAFi6bMTiE2LbihwFHiK5oou1QDA
 Z0AmeU1Ww0iwTtkYGDq16NY8w4PoI2htZf0Rrv/HMCkViFfqo+9+9L8Lq1jixE/9BMc0
 fawNHf/twrvsJYgGSQcAm0n1V/r7FB2h+GtDPzXF5ru3JW5MiirJj0sr42+3qO99cBCn
 JfW2wkzNwfiMdx1ms70wiVSJal7A8ScoFgjdN9X5EMaOWhcc4sQfNaU+gQPLDNbQjafi Aw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33a39xgtdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:01:28 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0823vQho015085;
 Wed, 2 Sep 2020 04:01:28 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 337en951wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:01:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08241Riv40239606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 04:01:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6C88112064;
 Wed,  2 Sep 2020 04:01:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97BE8112062;
 Wed,  2 Sep 2020 04:01:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 04:01:25 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc
Date: Wed,  2 Sep 2020 09:31:22 +0530
Message-Id: <20200902040122.136414-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=775 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020031
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
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test is broken w.r.t page table update rules and results in kernel
crash as below. Disable the support until we get the tests updated.

[   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
    pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
    lr: c0000000005eeeec: pte_update+0x11c/0x190
    sp: c000000c6d1e7950
   msr: 8000000002029033
  current = 0xc000000c6d172c80
  paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
    pid   = 1, comm = swapper/0
kernel BUG at arch/powerpc/mm/pgtable.c:304!
[link register   ] c0000000005eeeec pte_update+0x11c/0x190
[c000000c6d1e7950] 0000000000000001 (unreliable)
[c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
[c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
[c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
[c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
[c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
[c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
[c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c

With DEBUG_VM disabled

[   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
[   20.530183] Faulting instruction address: 0xc0000000000df330
cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
    pc: c0000000000df330: memset+0x68/0x104
    lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
    sp: c000000c6d19f990
   msr: 8000000002009033
   dar: 0
  current = 0xc000000c6d177480
  paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
    pid   = 1, comm = swapper/0
[link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
[c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
[c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
[c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
[c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
[c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
[c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
[c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
33:mon>

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
 arch/powerpc/Kconfig                                           | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
index 53da483c8326..1c49723e7534 100644
--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: |  ok  |
+    |     powerpc: | TODO |
     |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 65bed1fdeaad..787e829b6f25 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -116,7 +116,6 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_HAS_DEBUG_VIRTUAL
-	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
-- 
2.26.2

