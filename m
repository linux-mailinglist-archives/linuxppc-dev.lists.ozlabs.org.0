Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4021F134D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gPYw5hBQzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:11:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gPWm5TlnzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:09:40 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05872uXc069572; Mon, 8 Jun 2020 03:09:36 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7n7kchg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:09:35 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05875pHS002966;
 Mon, 8 Jun 2020 07:09:34 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb38spb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:09:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05879YSK54591964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 07:09:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FB012805A;
 Mon,  8 Jun 2020 07:09:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A25428058;
 Mon,  8 Jun 2020 07:09:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.88.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 07:09:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/4] powerpc/64/mm: implement page mapping percpu first
 chunk allocator
Date: Mon,  8 Jun 2020 12:39:02 +0530
Message-Id: <20200608070904.387440-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
References: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_03:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 suspectscore=2 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080049
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
Cc: cam@neo-zeon.de, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement page mapping percpu first chunk allocator as a fallback to
the embedding allocator. With 4K hash translation we limit our page
table range to 64TB and commit: 0034d395f89d ("powerpc/mm/hash64: Map all the
kernel regions in the same 0xc range") moved all kernel mapping to
that 64TB range. In-order to support sparse memory layout we need
to increase our linear mapping space and reduce other mappings.

With such a layout percpu embedded first chunk allocator will fail
because of small vmalloc range. Add a fallback to page mapping
percpu first chunk allocator for such failures.

The below dmesg output can be observed in such case.

 percpu: max_distance=0x1ffffef00000 too large for vmalloc space 0x10000000000
 PERCPU: auto allocator failed (-22), falling back to page size
 percpu: 40 4K pages/cpu s148816 r0 d15024

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig           |  5 ++-
 arch/powerpc/kernel/setup_64.c | 62 ++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..820365c42065 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -59,7 +59,10 @@ config HAVE_SETUP_PER_CPU_AREA
 	def_bool PPC64
 
 config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool PPC64
+	def_bool y if PPC64
+
+config NEED_PER_CPU_PAGE_FIRST_CHUNK
+	def_bool y if PPC64
 
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index eaddd53a0e13..6090d8290561 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -66,6 +66,7 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 #include <asm/early_ioremap.h>
+#include <asm/pgalloc.h>
 
 #include "setup.h"
 
@@ -808,13 +809,58 @@ static int pcpu_cpu_distance(unsigned int from, unsigned int to)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
+static void __init pcpu_populate_pte(unsigned long addr)
+{
+	pgd_t *pgd = pgd_offset_k(addr);
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d)) {
+		pud_t *new;
+
+		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		p4d_populate(&init_mm, p4d, new);
+	}
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud)) {
+		pmd_t *new;
+
+		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pud_populate(&init_mm, pud, new);
+	}
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd)) {
+		pte_t *new;
+
+		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pmd_populate_kernel(&init_mm, pmd, new);
+	}
+
+	return;
+
+err_alloc:
+	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
+	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
+}
+
+
 void __init setup_per_cpu_areas(void)
 {
 	const size_t dyn_size = PERCPU_MODULE_RESERVE + PERCPU_DYNAMIC_RESERVE;
 	size_t atom_size;
 	unsigned long delta;
 	unsigned int cpu;
-	int rc;
+	int rc = -EINVAL;
 
 	/*
 	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
@@ -826,8 +872,18 @@ void __init setup_per_cpu_areas(void)
 	else
 		atom_size = 1 << 20;
 
-	rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-				    pcpu_alloc_bootmem, pcpu_free_bootmem);
+	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
+		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
+					    pcpu_alloc_bootmem, pcpu_free_bootmem);
+		if (rc)
+			pr_warn("PERCPU: %s allocator failed (%d), "
+				"falling back to page size\n",
+				pcpu_fc_names[pcpu_chosen_fc], rc);
+	}
+
+	if (rc < 0)
+		rc = pcpu_page_first_chunk(0, pcpu_alloc_bootmem, pcpu_free_bootmem,
+					   pcpu_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
-- 
2.26.2

