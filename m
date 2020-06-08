Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD831F197C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 14:58:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gYGf19fnzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 22:58:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gY8G0q6hzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 22:53:17 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058CYcLA141723; Mon, 8 Jun 2020 08:53:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7a14y9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 08:53:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058Ciqkh024863;
 Mon, 8 Jun 2020 12:53:05 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 31g2s9ds47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 12:53:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058Cr4aq17695008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 12:53:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22CB26A058;
 Mon,  8 Jun 2020 12:53:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A66B96A047;
 Mon,  8 Jun 2020 12:53:01 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.88.17])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 12:53:01 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2] mm/debug_vm_pgtable: Fix kernel crash by checking for THP
 support
Date: Mon,  8 Jun 2020 18:22:52 +0530
Message-Id: <20200608125252.407659-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_12:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 mlxlogscore=856 spamscore=0 cotscore=-2147483648
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080094
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
Cc: anshuman.khandual@arm.com, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures can have CONFIG_TRANSPARENT_HUGEPAGE enabled but
no THP support enabled based on platforms. For ex: with 4K
PAGE_SIZE ppc64 supports THP only with radix translation.

This results in below crash when running with hash translation and
4K PAGE_SIZE.

kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:140!
cpu 0x61: Vector: 700 (Program Check) at [c000000ff948f860]
    pc: c0000000018810f8: debug_vm_pgtable+0x480/0x8b0
    lr: c0000000018810ec: debug_vm_pgtable+0x474/0x8b0
...
[c000000ff948faf0] c000000001880fec debug_vm_pgtable+0x374/0x8b0 (unreliable)
[c000000ff948fbf0] c000000000011648 do_one_initcall+0x98/0x4f0
[c000000ff948fcd0] c000000001843928 kernel_init_freeable+0x330/0x3fc
[c000000ff948fdb0] c0000000000122ac kernel_init+0x24/0x148
[c000000ff948fe20] c00000000000cc44 ret_from_kernel_thread+0x5c/0x78

Check for THP support correctly

Cc: anshuman.khandual@arm.com
Fixes: 399145f9eb6c ("mm/debug: add tests validating architecture page table helpers")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 188c18908964..df3a3a08f4f8 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -61,6 +61,9 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 {
 	pmd_t pmd = pfn_pmd(pfn, prot);
 
+	if (!has_transparent_hugepage())
+		return;
+
 	WARN_ON(!pmd_same(pmd, pmd));
 	WARN_ON(!pmd_young(pmd_mkyoung(pmd_mkold(pmd))));
 	WARN_ON(!pmd_dirty(pmd_mkdirty(pmd_mkclean(pmd))));
@@ -80,6 +83,9 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
 {
 	pud_t pud = pfn_pud(pfn, prot);
 
+	if (!has_transparent_hugepage())
+		return;
+
 	WARN_ON(!pud_same(pud, pud));
 	WARN_ON(!pud_young(pud_mkyoung(pud_mkold(pud))));
 	WARN_ON(!pud_write(pud_mkwrite(pud_wrprotect(pud))));
-- 
2.26.2

