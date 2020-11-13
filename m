Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1D2B1F33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 16:51:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXjdH1zsMzDr9W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 02:51:47 +1100 (AEDT)
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
 header.s=pp1 header.b=QCVYvCFF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXjbB633PzDr3l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 02:49:57 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADFVanR081509
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 10:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=UzX/eeS+tUh+IfQbuY48Zy2eWNJHMczLaI9jxIwuvSg=;
 b=QCVYvCFF0PqiQVfD+a74Y0Ww3RaV8TR6UEaSOEkrqkTZJo+MmOypb0brmIjimcx2bg2k
 t/h1LtzIqqQtMxaZp9cbqcKBw9DGGcAZcN6W67u35RmbkibTfDEvFC0ZKQgjYfycENej
 c+7mhiRXKsJ8hT7Fn/QL14F+c1FFbrdmrugQx6aXeFqMMRVBiK4mYJNk9FQ/dteOziD4
 omj/XOLBplwhJj6lURfzKUQ4hQWG6NztcQYn/Ip8tO0XvpwpZeSfNqskIC0PHLE765ck
 Ny/xPpXPuE097coqPNGlPcm2XHLe/iCDdWAyQrVOz8joabNouXb0jjk2wSBjeTVNIyXs UQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34sve1s20u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 10:33:37 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ADFW3uQ003232
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 15:33:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34njuh6u9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 15:33:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0ADFXXxi58655080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 15:33:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DBC452051;
 Fri, 13 Nov 2020 15:33:33 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.145.169.234])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 72B825204F;
 Fri, 13 Nov 2020 15:33:33 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com
Subject: [PATCH] ocxl: Mmio invalidation support
Date: Fri, 13 Nov 2020 16:33:33 +0100
Message-Id: <20201113153333.290505-1-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_10:2020-11-13,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130096
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

OpenCAPI 4.0/5.0 with TLBI/SLBI Snooping, is not used due to performance
problems caused by the PAU having to process all incoming TLBI/SLBI
commands which will cause them to back up on the PowerBus.

When the Address Translation Mode requires TLB and SLB Invalidate
operations to be initiated using MMIO registers, a set of registers like
the following is used:
• XTS MMIO ATSD0 LPARID register
• XTS MMIO ATSD0 AVA register
• XTS MMIO ATSD0 launch register, write access initiates a shoot down
• XTS MMIO ATSD0 status register

The MMIO based mechanism also blocks the NPU/PAU from snooping TLBIE
commands from the PowerBus.

The Shootdown commands (ATSD) will be generated using MMIO registers
in the NPU/PAU and sent to the device.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h   |   2 +
 arch/powerpc/platforms/powernv/ocxl.c |  19 +++
 drivers/misc/ocxl/link.c              | 180 ++++++++++++++++++++++----
 drivers/misc/ocxl/ocxl_internal.h     |  46 ++++++-
 drivers/misc/ocxl/trace.h             | 125 ++++++++++++++++++
 5 files changed, 348 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index d37ededca3ee..4a23abcc347b 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -28,4 +28,6 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **p
 void pnv_ocxl_spa_release(void *platform_data);
 int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
 
+extern int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
+			     uint64_t lpcr);
 #endif /* _ASM_PNV_OCXL_H */
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index ecdad219d704..100546ea635f 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -483,3 +483,22 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
 	return rc;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
+
+int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
+		      uint64_t lpcr)
+{
+	struct pci_controller *hose = pci_bus_to_host(dev->bus);
+	struct pnv_phb *phb = hose->private_data;
+	u32 bdfn;
+	int rc;
+
+	bdfn = (dev->bus->number << 8) | dev->devfn;
+	rc = opal_npu_map_lpar(phb->opal_id, bdfn, lparid, lpcr);
+	if (rc) {
+		dev_err(&dev->dev, "Error mapping device to LPAR: %d\n", rc);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pnv_ocxl_map_lpar);
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index fd73d3bc0eb6..9b5b77d40734 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -4,6 +4,8 @@
 #include <linux/mutex.h>
 #include <linux/mm_types.h>
 #include <linux/mmu_context.h>
+#include <linux/mm.h>
+#include <linux/mmu_notifier.h>
 #include <asm/copro.h>
 #include <asm/pnv-ocxl.h>
 #include <asm/xive.h>
@@ -33,6 +35,31 @@
 
 #define SPA_PE_VALID		0x80000000
 
+struct spa;
+
+/*
+ * A opencapi link can be used be by several PCI functions. We have
+ * one link per device slot.
+ *
+ * A linked list of opencapi links should suffice, as there's a
+ * limited number of opencapi slots on a system and lookup is only
+ * done when the device is probed
+ */
+struct ocxl_link {
+	struct list_head list;
+	struct kref ref;
+	int domain;
+	int bus;
+	int dev;
+	u64 mmio_atsd; /* ATSD physical address */
+	void __iomem *base;    /* ATSD register virtual address */
+	spinlock_t atsd_lock; // to serialize shootdowns
+	atomic_t irq_available;
+	struct spa *spa;
+	void *platform_data;
+};
+static struct list_head links_list = LIST_HEAD_INIT(links_list);
+static DEFINE_MUTEX(links_list_lock);
 
 struct pe_data {
 	struct mm_struct *mm;
@@ -41,6 +68,8 @@ struct pe_data {
 	/* opaque pointer to be passed to the above callback */
 	void *xsl_err_data;
 	struct rcu_head rcu;
+	struct ocxl_link *link;
+	struct mmu_notifier mmu_notifier;
 };
 
 struct spa {
@@ -69,27 +98,6 @@ struct spa {
 	} xsl_fault;
 };
 
-/*
- * A opencapi link can be used be by several PCI functions. We have
- * one link per device slot.
- *
- * A linked list of opencapi links should suffice, as there's a
- * limited number of opencapi slots on a system and lookup is only
- * done when the device is probed
- */
-struct ocxl_link {
-	struct list_head list;
-	struct kref ref;
-	int domain;
-	int bus;
-	int dev;
-	atomic_t irq_available;
-	struct spa *spa;
-	void *platform_data;
-};
-static struct list_head links_list = LIST_HEAD_INIT(links_list);
-static DEFINE_MUTEX(links_list_lock);
-
 enum xsl_response {
 	CONTINUE,
 	ADDRESS_ERROR,
@@ -126,6 +134,8 @@ static void ack_irq(struct spa *spa, enum xsl_response r)
 	}
 }
 
+static const struct mmu_notifier_ops ocxl_mmu_notifier_ops;
+
 static void xsl_fault_handler_bh(struct work_struct *fault_work)
 {
 	vm_fault_t flt = 0;
@@ -376,6 +386,7 @@ static void free_spa(struct ocxl_link *link)
 
 static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_link)
 {
+	struct pci_controller *hose = pci_bus_to_host(dev->bus);
 	struct ocxl_link *link;
 	int rc;
 
@@ -403,6 +414,22 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	if (rc)
 		goto err_xsl_irq;
 
+	/* Since OpenCAPI 5.0, Address Translation Mode requires TLB
+	 * and SLB Invalidate operations to be initiated using MMIO
+	 * registers
+	 */
+	if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
+				       0, &link->mmio_atsd)) {
+		dev_info(&dev->dev, "No available ATSD found\n");
+	}
+	if (link->mmio_atsd) {
+		link->base = ioremap(link->mmio_atsd, 24);
+		if (!link->base)
+			dev_warn(&dev->dev, "ioremap failed - mmio_atsd: %#llx\n", link->mmio_atsd);
+		else
+			pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0);
+	}
+
 	*out_link = link;
 	return 0;
 
@@ -464,12 +491,101 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
 
+	if (link->base) {
+		iounmap(link->base);
+		link->base = NULL;
+	}
 	mutex_lock(&links_list_lock);
 	kref_put(&link->ref, release_xsl);
 	mutex_unlock(&links_list_lock);
 }
 EXPORT_SYMBOL_GPL(ocxl_link_release);
 
+static void tlb_invalidate(struct ocxl_link *link,
+			   unsigned long pid,
+			   unsigned long addr)
+{
+	unsigned long timeout = jiffies + (HZ * OCXL_ATSD_TIMEOUT);
+	uint64_t val;
+	int pend;
+
+	if (!link->base)
+		return;
+
+	spin_lock(&link->atsd_lock);
+	if (addr) {
+		/* load Abbreviated Virtual Address register with
+		 * the necessary value
+		 */
+		val = SETFIELD(XTS_ATSD_AVA_AVA, 0ull, addr >> (63-51));
+		out_be64(link->base + XTS_ATSD_AVA, val);
+		eieio();
+		trace_ocxl_mmu_notifier_mmio_atsd_ava(val, pid);
+	}
+
+	/* Write access initiates a shoot down to initiate the
+	 * TLB Invalidate command
+	 */
+	val = XTS_ATSD_LNCH_R;
+	if (addr) {
+		val = SETFIELD(XTS_ATSD_LNCH_RIC, val, 0b00);
+		val = SETFIELD(XTS_ATSD_LNCH_IS, val, 0b00);
+	} else {
+		val = SETFIELD(XTS_ATSD_LNCH_RIC, val, 0b10);
+		val = SETFIELD(XTS_ATSD_LNCH_IS, val, 0b01);
+		val |= XTS_ATSD_LNCH_OCAPI_SINGLETON;
+	}
+	val |= XTS_ATSD_LNCH_PRS;
+	val = SETFIELD(XTS_ATSD_LNCH_AP, val, 0b101);
+	val = SETFIELD(XTS_ATSD_LNCH_PID, val, pid);
+	out_be64(link->base + XTS_ATSD_LNCH, val);
+	trace_ocxl_mmu_notifier_mmio_atsd_lnch(val, addr, pid);
+
+	/* Poll the ATSD status register to determine when the
+	* TLB Invalidate has been completed.
+	*/
+	val = in_be64(link->base + XTS_ATSD_STAT);
+	pend = val >> 63;
+	trace_ocxl_mmu_notifier_mmio_atsd_stat(val, addr, pid);
+
+	while (pend) {
+		if (time_after_eq(jiffies, timeout)) {
+			pr_err("%s - Timeout while reading XTS MMIO ATSD status register (val=%#llx, pidr=0x%lx)\n",
+			       __func__, val, pid);
+			spin_unlock(&link->atsd_lock);
+			return;
+		}
+		cpu_relax();
+		val = in_be64(link->base + XTS_ATSD_STAT);
+		pend = val >> 63;
+	}
+	spin_unlock(&link->atsd_lock);
+	trace_ocxl_mmu_notifier_mmio_atsd_stat(val, addr, pid);
+}
+
+static void invalidate_range_end(struct mmu_notifier *mn,
+				 const struct mmu_notifier_range *range)
+{
+	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
+	struct ocxl_link *link = pe_data->link;
+	struct mm_struct *mm = mn->mm;
+	unsigned long addr, pid, page_size = PAGE_SIZE;
+
+	pid = mm->context.id;
+	trace_ocxl_mmu_notifier_range(range->start, range->end, pid);
+
+	for (addr = range->start; addr < range->end; addr += page_size)
+		tlb_invalidate(link, pid, addr);
+}
+
+static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
+	/* invalidate_range_end() is called when all pages in the
+	 * range have been unmapped and the pages have been freed by
+	 * the VM
+	 */
+	.invalidate_range_end = invalidate_range_end,
+};
+
 static u64 calculate_cfg_state(bool kernel)
 {
 	u64 state;
@@ -517,7 +633,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 		goto unlock;
 	}
 
-	pe_data = kmalloc(sizeof(*pe_data), GFP_KERNEL);
+	pe_data = kzalloc(sizeof(*pe_data), GFP_KERNEL);
 	if (!pe_data) {
 		rc = -ENOMEM;
 		goto unlock;
@@ -526,9 +642,13 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	pe_data->mm = mm;
 	pe_data->xsl_err_cb = xsl_err_cb;
 	pe_data->xsl_err_data = xsl_err_data;
+	pe_data->link = link;
+	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
+	pe->pasid = cpu_to_be32(pasid << (31 - 19));
+	pe->bdf = cpu_to_be32(1 << (31 - 15));
 	pe->lpid = cpu_to_be32(mfspr(SPRN_LPID));
 	pe->pid = cpu_to_be32(pidr);
 	pe->tid = cpu_to_be32(tidr);
@@ -540,8 +660,17 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	 * by the nest MMU. If we have a kernel context, TLBIs are
 	 * already global.
 	 */
-	if (mm)
+	if (mm) {
 		mm_context_add_copro(mm);
+		if (link->base) {
+			/* Use MMIO registers for the TLB and SLB
+			 * Invalidate operations.
+			 */
+			trace_init_mmu_notifier(pasid, mm->context.id);
+			mmu_notifier_register(&pe_data->mmu_notifier, mm);
+		}
+	}
+
 	/*
 	 * Barrier is to make sure PE is visible in the SPA before it
 	 * is used by the device. It also helps with the global TLBI
@@ -672,6 +801,11 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 		WARN(1, "Couldn't find pe data when removing PE\n");
 	} else {
 		if (pe_data->mm) {
+			if (link->base) {
+				trace_release_mmu_notifier(pasid, pe_data->mm->context.id);
+				mmu_notifier_unregister(&pe_data->mmu_notifier, pe_data->mm);
+				tlb_invalidate(link, pe_data->mm->context.id, 0ull);
+			}
 			mm_context_remove_copro(pe_data->mm);
 			mmdrop(pe_data->mm);
 		}
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 0bad0a123af6..35d8be3cd270 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -8,6 +8,48 @@
 #include <linux/list.h>
 #include <misc/ocxl.h>
 
+/* Find left shift from first set bit in mask */
+#define MASK_TO_LSH(m)		(__builtin_ffsl(m) - 1)
+
+/* Set field fname of oval to fval
+ * NOTE: oval isn't modified, the combined result is returned
+ */
+#define SETFIELD(m, v, val)				\
+	(((v) & ~(m)) |	((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
+
+#define OCXL_ATSD_TIMEOUT		1
+
+/* 5.9.3.3 TLB Management Instructions - PowerISA tags workbook */
+#define XTS_ATSD_LNCH		0x00
+#define   XTS_ATSD_LNCH_R	PPC_BIT(0)		/* Radix Invalidate */
+#define   XTS_ATSD_LNCH_RIC	PPC_BITMASK(1,2)	/* Radix Invalidation Control
+							 * 0b00 Just invalidate TLB.
+							 * 0b01 Invalidate just Page Walk Cache.
+							 * 0b10 Invalidate TLB, Page Walk Cache, and any
+							 * caching of Partition and Process Table Entries.
+							 */
+#define   XTS_ATSD_LNCH_LP	PPC_BITMASK(3, 10)	/* Number and Page Size of translations to be invalidated (HPT only ?) */
+#define   XTS_ATSD_LNCH_IS	PPC_BITMASK(11, 12)	/* Invalidation Criteria
+							 * 0b00 Invalidate just the target VA.
+							 * 0b01 Invalidate matching PID.
+							 */
+#define   XTS_ATSD_LNCH_PRS	PPC_BIT(13)		/* 0b1: Process Scope, 0b0: Partition Scope */
+#define   XTS_ATSD_LNCH_B	PPC_BIT(14)		/* Invalidation Flag */
+#define   XTS_ATSD_LNCH_AP	PPC_BITMASK(15, 17)	/* Actual Page Size to be invalidated
+							 * 000 4KB
+							 * 101 64KB
+							 * 001 2MB
+							 * 010 1GB
+							 */
+#define   XTS_ATSD_LNCH_L	PPC_BIT(18)		/* Defines the large page select (L=0b0 for 4KB pages, L=0b1 for large pages) */
+#define   XTS_ATSD_LNCH_PID	PPC_BITMASK(19, 38)	/* Process ID */
+#define   XTS_ATSD_LNCH_F	PPC_BIT(39)		/* NoFlush – Assumed to be 0b0 */
+#define   XTS_ATSD_LNCH_OCAPI_SLBI	PPC_BIT(40)
+#define   XTS_ATSD_LNCH_OCAPI_SINGLETON	PPC_BIT(41)
+#define XTS_ATSD_AVA		0x08
+#define   XTS_ATSD_AVA_AVA	PPC_BITMASK(0, 51) /* au lieu de 35*/
+#define XTS_ATSD_STAT		0x10
+
 #define MAX_IRQ_PER_LINK	2000
 #define MAX_IRQ_PER_CONTEXT	MAX_IRQ_PER_LINK
 
@@ -84,7 +126,9 @@ struct ocxl_context {
 
 struct ocxl_process_element {
 	__be64 config_state;
-	__be32 reserved1[11];
+	__be32 pasid;
+	__be32 bdf;
+	__be32 reserved1[9];
 	__be32 lpid;
 	__be32 tid;
 	__be32 pid;
diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
index 17e21cb2addd..6171069d071a 100644
--- a/drivers/misc/ocxl/trace.h
+++ b/drivers/misc/ocxl/trace.h
@@ -8,6 +8,131 @@
 
 #include <linux/tracepoint.h>
 
+
+TRACE_EVENT(ocxl_mmu_notifier_range,
+	TP_PROTO(unsigned long start, unsigned long end, unsigned long pidr),
+	TP_ARGS(start, end, pidr),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, start)
+		__field(unsigned long, end)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->end = end;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("start=0x%lx end=0x%lx pidr=0x%lx",
+		__entry->start,
+		__entry->end,
+		__entry->pidr
+	)
+);
+
+TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_ava,
+	TP_PROTO(u64 val, unsigned long pidr),
+	TP_ARGS(val, pidr),
+
+	TP_STRUCT__entry(
+		__field(u64, val)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->val = val;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("ATSD AVA: 0x%llx pidr=0x%lx",
+		__entry->val, __entry->pidr
+	)
+);
+
+TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_lnch,
+	TP_PROTO(u64 val, unsigned long addr, unsigned long pidr),
+	TP_ARGS(val, addr, pidr),
+
+	TP_STRUCT__entry(
+		__field(u64, val)
+		__field(unsigned long, addr)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->val = val;
+		__entry->addr = addr;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("ATSD LNCH: 0x%llx addr=0x%lx pidr=0x%lx",
+		__entry->val, __entry->addr, __entry->pidr
+	)
+);
+
+TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_stat,
+	TP_PROTO(u64 val, unsigned long addr, unsigned long pidr),
+	TP_ARGS(val, addr, pidr),
+
+	TP_STRUCT__entry(
+		__field(u64, val)
+		__field(unsigned long, addr)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->val = val;
+		__entry->addr = addr;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("ATSD STAT: 0x%llx addr=0x%lx pidr=0x%lx",
+		__entry->val, __entry->addr, __entry->pidr
+	)
+);
+
+TRACE_EVENT(init_mmu_notifier,
+	TP_PROTO(int pasid, unsigned long pidr),
+	TP_ARGS(pasid, pidr),
+
+	TP_STRUCT__entry(
+		__field(int, pasid)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->pasid = pasid;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("pasid=%d, pidr=0x%lx",
+		__entry->pasid,
+		__entry->pidr
+	)
+);
+
+TRACE_EVENT(release_mmu_notifier,
+	TP_PROTO(int pasid, unsigned long pidr),
+	TP_ARGS(pasid, pidr),
+
+	TP_STRUCT__entry(
+		__field(int, pasid)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->pasid = pasid;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("pasid=%d, pidr=0x%lx",
+		__entry->pasid,
+		__entry->pidr
+	)
+);
+
 DECLARE_EVENT_CLASS(ocxl_context,
 	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
 	TP_ARGS(pid, spa, pasid, pidr, tidr),
-- 
2.28.0

