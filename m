Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271B24909C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:13:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWQDF4NlgzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sGIsWT+S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWQB25rLxzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 08:11:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07IM2e6M117975; Tue, 18 Aug 2020 18:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UtNXnoPsOjscFTkbhxjmseTZ2dxM8ncEn7IWYIO6opA=;
 b=sGIsWT+SExHnhfEnQnakW67QRlkpHGIfcjEMPTTVOXyEMXSIEADQ/GmXm9WqSnHBE3ma
 125fHGQJW34u+Hq2LJxWvejczl2IEbrljzRuFt7/VNKn4Xw4m8tk3OA9L0Xk7AZlj4Im
 TA7j1aZZDcXiAaYidNxlsDsQnNGZGcR3/yIYmh2PkDW6Ur+qhPrrYJd5cLAHEGqlsU0B
 UbjRdIQRD1RknQVJoPN56lXxy8uPuWwcyCXtWDMzFQWWcVLeh+kpodhnUWpeT+Uvr2ku
 IV67nkX4Z+BOKnJxFsiKEhtWDlEX794yZqzkohsCPa7TQKdaEE1s5+DHnn5EXyXTSbki yA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3304t20phf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 18:11:43 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07IM9Yue019412;
 Tue, 18 Aug 2020 22:11:43 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3304cch4sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 22:11:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07IMBbJa19398974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 22:11:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69A38C607D;
 Tue, 18 Aug 2020 22:11:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E94C7C6087;
 Tue, 18 Aug 2020 22:11:37 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Aug 2020 22:11:37 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in
 memory
Date: Tue, 18 Aug 2020 19:11:26 -0300
Message-Id: <20200818221126.391073-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-18_14:2020-08-18,
 2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 suspectscore=3 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180154
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER secure guests (i.e., guests which use the Protection Execution
Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
they don't need the SWIOTLB memory to be in low addresses since the
hypervisor doesn't have any addressing limitation.

This solves a SWIOTLB initialization problem we are seeing in secure guests
with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
memory, which leaves no space for SWIOTLB in low addresses.

To do this, we use mostly the same code as swiotlb_init(), but allocate the
buffer using memblock_alloc() instead of memblock_alloc_low().

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/svm.h       |  4 ++++
 arch/powerpc/mm/mem.c                |  6 +++++-
 arch/powerpc/platforms/pseries/svm.c | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

Changes from v2:
- Panic if unable to allocate buffer, as suggested by Christoph.

Changes from v1:
- Open-code swiotlb_init() in arch-specific code, as suggested by
  Christoph.

diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
index 85580b30aba4..7546402d796a 100644
--- a/arch/powerpc/include/asm/svm.h
+++ b/arch/powerpc/include/asm/svm.h
@@ -15,6 +15,8 @@ static inline bool is_secure_guest(void)
 	return mfmsr() & MSR_S;
 }
 
+void __init svm_swiotlb_init(void);
+
 void dtl_cache_ctor(void *addr);
 #define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
 
@@ -25,6 +27,8 @@ static inline bool is_secure_guest(void)
 	return false;
 }
 
+static inline void svm_swiotlb_init(void) {}
+
 #define get_dtl_cache_ctor() NULL
 
 #endif /* CONFIG_PPC_SVM */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..0f21bcb16405 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -50,6 +50,7 @@
 #include <asm/swiotlb.h>
 #include <asm/rtas.h>
 #include <asm/kasan.h>
+#include <asm/svm.h>
 
 #include <mm/mmu_decl.h>
 
@@ -290,7 +291,10 @@ void __init mem_init(void)
 	 * back to to-down.
 	 */
 	memblock_set_bottom_up(true);
-	swiotlb_init(0);
+	if (is_secure_guest())
+		svm_swiotlb_init();
+	else
+		swiotlb_init(0);
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 40c0637203d5..81085eb8f225 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/mm.h>
+#include <linux/memblock.h>
 #include <asm/machdep.h>
 #include <asm/svm.h>
 #include <asm/swiotlb.h>
@@ -34,6 +35,31 @@ static int __init init_svm(void)
 }
 machine_early_initcall(pseries, init_svm);
 
+/*
+ * Initialize SWIOTLB. Essentially the same as swiotlb_init(), except that it
+ * can allocate the buffer anywhere in memory. Since the hypervisor doesn't have
+ * any addressing limitation, we don't need to allocate it in low addresses.
+ */
+void __init svm_swiotlb_init(void)
+{
+	unsigned char *vstart;
+	unsigned long bytes, io_tlb_nslabs;
+
+	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
+	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+
+	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+
+	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
+		return;
+
+	if (io_tlb_start)
+		memblock_free_early(io_tlb_start,
+				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	panic("SVM: Cannot allocate SWIOTLB buffer");
+}
+
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
 	if (!PAGE_ALIGNED(addr))
