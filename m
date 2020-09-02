Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E425AA78
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:45:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhMYy33nTzDqtG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 21:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X4SR6t6t; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhMW93J76zDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 21:42:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082BVopj172678; Wed, 2 Sep 2020 07:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=m2BpeGT+mCzblceY6q9JfhDnMkDuerV3XLHodipIXc0=;
 b=X4SR6t6tEdySGYVd2YFfdsBA7aYxjo4Wc+Hax1AGOCLp7BQAI4YBxNyRKWzrMQGZ2VWs
 SCgK+1sXTjnb8rd/MWRcGD6OY30fr6JpQSObPu5QowdGnLfpyYumwa87gFKpa9PiZ/7N
 830+JayX5Yv+icGKWne9nM6YLGVnvQyzOAhDeHPr8o5Y4VD35MFkouy18oNfG6oWYiGq
 wqktYWDwXp9Ht+MVjHrjh0aEqHcbbBjFRtjdCvq9GIZrbQ88OHqLwXS5pA9DVVrY/bfw
 ZKUJOxGoY1ZBciKIMpm6uFDvrG4ZGXKXVPcFZDLbYJOBdEWkl415ipJHQJKkoi7t86gX GA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a6t3yhm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 07:42:34 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082Bap9x002795;
 Wed, 2 Sep 2020 11:42:34 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 337en9fe97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:42:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082BgXXt48759182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 11:42:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92CC6B2064;
 Wed,  2 Sep 2020 11:42:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43ECCB205F;
 Wed,  2 Sep 2020 11:42:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 11:42:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Date: Wed,  2 Sep 2020 17:12:09 +0530
Message-Id: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=448 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020105
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series includes fixes for debug_vm_pgtable test code so that
they follow page table updates rules correctly. The first two patches introduce
changes w.r.t ppc64. The patches are included in this series for completeness. We can
merge them via ppc64 tree if required.

Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
page table update rules.

These tests are broken w.r.t page table update rules and results in kernel
crash as below. 

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

Changes from v3:
* Address review feedback
* Move page table depost and withdraw patch after adding pmdlock to avoid bisect failure.

Changes from v2:
* Fix build failure with different configs and architecture.

Changes from v1:
* Address review feedback
* drop test specific pfn_pte and pfn_pmd.
* Update ppc64 page table helper to add _PAGE_PTE 


Aneesh Kumar K.V (13):
  powerpc/mm: Add DEBUG_VM WARN for pmd_clear
  powerpc/mm: Move setting pte specific flags to pfn_pte
  mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
  mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
    vmap support.
  mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
    CONFIG_NUMA_BALANCING
  mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
    set_pmd/pud_at
  mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
    existing pte entry
  mm/debug_vm_pgtable/locks: Move non page table modifying test together
  mm/debug_vm_pgtable/locks: Take correct page table lock
  mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
  mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
  mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
  mm/debug_vm_pgtable: Avoid none pte in pte_clear_test

 arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
 arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
 arch/powerpc/mm/pgtable.c                    |   5 -
 mm/debug_vm_pgtable.c                        | 171 ++++++++++++-------
 4 files changed, 131 insertions(+), 79 deletions(-)

-- 
2.26.2

