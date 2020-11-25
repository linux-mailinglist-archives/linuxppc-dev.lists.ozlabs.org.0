Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24492C449E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 17:05:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch5Lz4pmlzDr3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P0JOSWVl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5554KkTzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:52:57 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APFW0E6086123
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2p95q3T+BZATlPz+wDI4zQ4VhsRGopBBue/3HYea89E=;
 b=P0JOSWVlB8Ms/H/CfCRIL0RgGtluHXoWZMMYl7Zbu5tDGDI/6xVuLWcKdXhcEAUHdOw/
 Awnjg2oaqZYzUVcA5x6L1uiZA+cxOS1KjTQzDI9Wdz+7wSfDBjazAmK/hleMCgINjHJP
 gjGrempPprVeYXXYjQ3FbYWRCAoNmHui1/lZjPom4wL9iViOegyszeO9doWVuTk9rWKa
 I8G+PVPpzrUu6oocnMik6S4IYqBlVe162TKQrBe9xpfm2OpJX0ZriWMSwOUzZgsybfZP
 CsVenkMO21sOrizwiNY3upKrY8/FGThbAofJIAReW1XF3p50AUrctnZJzGbtMMTf3y/U Ew== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351sue8ypa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:52:52 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APFqe8o003183
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:52:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r1r6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:52:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APFoG4l67043828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 15:50:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A839442064;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 780C94204B;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.47.8])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V4 4/5] ocxl: Add mmu notifier
Date: Wed, 25 Nov 2020 16:50:12 +0100
Message-Id: <20201125155013.39955-5-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
References: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250096
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add invalidate_range mmu notifier, when required (ATSD access of MMIO
registers is available), to initiate TLB invalidation commands.
For the time being, the ATSD0 set of registers is used by default.

The pasid and bdf values have to be configured in the Process Element
Entry.
The PEE must be set up to match the BDF/PASID of the AFU.

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/link.c | 62 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 77381dda2c45..129d4eddc4d2 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -2,8 +2,10 @@
 // Copyright 2017 IBM Corp.
 #include <linux/sched/mm.h>
 #include <linux/mutex.h>
+#include <linux/mm.h>
 #include <linux/mm_types.h>
 #include <linux/mmu_context.h>
+#include <linux/mmu_notifier.h>
 #include <asm/copro.h>
 #include <asm/pnv-ocxl.h>
 #include <asm/xive.h>
@@ -33,6 +35,7 @@
 
 #define SPA_PE_VALID		0x80000000
 
+struct ocxl_link;
 
 struct pe_data {
 	struct mm_struct *mm;
@@ -41,6 +44,8 @@ struct pe_data {
 	/* opaque pointer to be passed to the above callback */
 	void *xsl_err_data;
 	struct rcu_head rcu;
+	struct ocxl_link *link;
+	struct mmu_notifier mmu_notifier;
 };
 
 struct spa {
@@ -83,6 +88,8 @@ struct ocxl_link {
 	int domain;
 	int bus;
 	int dev;
+	void __iomem *arva;     /* ATSD register virtual address */
+	spinlock_t atsd_lock;   /* to serialize shootdowns */
 	atomic_t irq_available;
 	struct spa *spa;
 	void *platform_data;
@@ -388,6 +395,7 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	link->bus = dev->bus->number;
 	link->dev = PCI_SLOT(dev->devfn);
 	atomic_set(&link->irq_available, MAX_IRQ_PER_LINK);
+	spin_lock_init(&link->atsd_lock);
 
 	rc = alloc_spa(dev, link);
 	if (rc)
@@ -403,6 +411,13 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	if (rc)
 		goto err_xsl_irq;
 
+	/* if link->arva is not defeined, MMIO registers are not used to
+	 * generate TLB invalidate. PowerBus snooping is enabled.
+	 * Otherwise, PowerBus snooping is disabled. TLB Invalidates are
+	 * initiated using MMIO registers.
+	 */
+	pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0, &link->arva);
+
 	*out_link = link;
 	return 0;
 
@@ -454,6 +469,11 @@ static void release_xsl(struct kref *ref)
 {
 	struct ocxl_link *link = container_of(ref, struct ocxl_link, ref);
 
+	if (link->arva) {
+		pnv_ocxl_unmap_lpar(link->arva);
+		link->arva = NULL;
+	}
+
 	list_del(&link->list);
 	/* call platform code before releasing data */
 	pnv_ocxl_spa_release(link->platform_data);
@@ -470,6 +490,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
 }
 EXPORT_SYMBOL_GPL(ocxl_link_release);
 
+static void invalidate_range(struct mmu_notifier *mn,
+			     struct mm_struct *mm,
+			     unsigned long start, unsigned long end)
+{
+	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
+	struct ocxl_link *link = pe_data->link;
+	unsigned long addr, pid, page_size = PAGE_SIZE;
+
+	pid = mm->context.id;
+
+	spin_lock(&link->atsd_lock);
+	for (addr = start; addr < end; addr += page_size)
+		pnv_ocxl_tlb_invalidate(link->arva, pid, addr, page_size);
+	spin_unlock(&link->atsd_lock);
+}
+
+static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
+	.invalidate_range = invalidate_range,
+};
+
 static u64 calculate_cfg_state(bool kernel)
 {
 	u64 state;
@@ -526,6 +566,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	pe_data->mm = mm;
 	pe_data->xsl_err_cb = xsl_err_cb;
 	pe_data->xsl_err_data = xsl_err_data;
+	pe_data->link = link;
+	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
@@ -542,8 +584,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	 * by the nest MMU. If we have a kernel context, TLBIs are
 	 * already global.
 	 */
-	if (mm)
+	if (mm) {
 		mm_context_add_copro(mm);
+		if (link->arva) {
+			/* Use MMIO registers for the TLB Invalidate
+			 * operations.
+			 */
+			mmu_notifier_register(&pe_data->mmu_notifier, mm);
+		}
+	}
+
 	/*
 	 * Barrier is to make sure PE is visible in the SPA before it
 	 * is used by the device. It also helps with the global TLBI
@@ -674,6 +724,16 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 		WARN(1, "Couldn't find pe data when removing PE\n");
 	} else {
 		if (pe_data->mm) {
+			if (link->arva) {
+				mmu_notifier_unregister(&pe_data->mmu_notifier,
+							pe_data->mm);
+				spin_lock(&link->atsd_lock);
+				pnv_ocxl_tlb_invalidate(link->arva,
+							pe_data->mm->context.id,
+							0ull,
+							PAGE_SIZE);
+				spin_unlock(&link->atsd_lock);
+			}
 			mm_context_remove_copro(pe_data->mm);
 			mmdrop(pe_data->mm);
 		}
-- 
2.28.0

