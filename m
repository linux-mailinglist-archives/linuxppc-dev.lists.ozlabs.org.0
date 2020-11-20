Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 553472BB190
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:40:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3hz6VRPzDr4Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 04:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KMRcXA6k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd3Xf2x4MzDqyZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:32:49 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKHVZMY172895
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8DFRyATPSW6vWaqABjvMIBbT+B5hDnzsVjsjfp0FY8M=;
 b=KMRcXA6kqRUbGdCkMBWdIDhGZKdPGLnegOLeUVnvQLIBfRKoW35hZGmk2XK/ZSD6EM10
 XMdlClSRvJtoSannfGX3qwZkL47AZDWrwngBDNZ7kRu93HCsQsLoEnDUzRdLwCJKsEVj
 FHHqelytPyO0JwgFdRv2ws9cPTxgrZKBayRv1qe9SZfZqD/tzQ3d5IVeNUWJD4GSsOML
 XmsRpbSZQUZAA2/0CO6n7H8JjpMX/YpUsJcoCaoOnVIkEcwGHNpITulE2lmV0/hQWFz+
 LWwGsVpTfbWnJA7IWvl2OsgRmfbufSUrGVdrgcoj1xUXTJFddjDVz4Qql78UBilk3siE pA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34xhk81kjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKHWODd027427
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 34t6v8cx46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHWgrV10355272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:32:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC270A4040;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1133A404D;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.3.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V2 4/5] ocxl: Add mmu notifier
Date: Fri, 20 Nov 2020 18:32:40 +0100
Message-Id: <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011200116
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

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/link.c | 58 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 20444db8a2bb..100bdfe9ec37 100644
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
@@ -403,6 +410,11 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	if (rc)
 		goto err_xsl_irq;
 
+	rc = pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0,
+					  &link->arva);
+	if (!rc)
+		spin_lock_init(&link->atsd_lock);
+
 	*out_link = link;
 	return 0;
 
@@ -454,6 +466,11 @@ static void release_xsl(struct kref *ref)
 {
 	struct ocxl_link *link = container_of(ref, struct ocxl_link, ref);
 
+	if (link->arva) {
+		pnv_ocxl_unmap_lpar(&link->arva);
+		link->arva = NULL;
+	}
+
 	list_del(&link->list);
 	/* call platform code before releasing data */
 	pnv_ocxl_spa_release(link->platform_data);
@@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
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
+		pnv_ocxl_tlb_invalidate(&link->arva, pid, addr);
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
@@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	pe_data->mm = mm;
 	pe_data->xsl_err_cb = xsl_err_cb;
 	pe_data->xsl_err_data = xsl_err_data;
+	pe_data->link = link;
+	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
@@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
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
@@ -674,6 +721,15 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 		WARN(1, "Couldn't find pe data when removing PE\n");
 	} else {
 		if (pe_data->mm) {
+			if (link->arva) {
+				mmu_notifier_unregister(&pe_data->mmu_notifier,
+							pe_data->mm);
+				spin_lock(&link->atsd_lock);
+				pnv_ocxl_tlb_invalidate(&link->arva,
+							pe_data->mm->context.id,
+							0ull);
+				spin_unlock(&link->atsd_lock);
+			}
 			mm_context_remove_copro(pe_data->mm);
 			mmdrop(pe_data->mm);
 		}
-- 
2.28.0

