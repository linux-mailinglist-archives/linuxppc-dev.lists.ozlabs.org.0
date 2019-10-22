Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED7DFEDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 10:00:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y5X86q4NzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 19:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y5My40JXzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:53:01 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M7qu9N003642
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:52:59 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vsw33ha37-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:52:58 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Tue, 22 Oct 2019 08:52:52 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 Oct 2019 08:52:49 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9M7qm3D61603974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 07:52:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C7CE11C058;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2742111C04C;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
Received: from lombard-w541.nice-meridia.fr.ibm.com (unknown [9.134.167.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, groug@kaod.org
Subject: [PATCH 1/3] ocxl: Introduce implementation-specific API
Date: Tue, 22 Oct 2019 09:52:45 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
References: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102207-0008-0000-0000-000003255184
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102207-0009-0000-0000-00004A447BF3
Message-Id: <20191022075247.16266-2-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220075
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

The backend API (in ocxl.h) lists some low-level functions whose
implementation is different on bare-metal and in a guest. Each
environment implements its own functions, and the common code uses
them through function pointers, defined in ocxl_backend_ops

A new powernv.c file is created to call the pnv_ocxl_ API for the
bare-metal environment.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/Makefile        |  2 +
 drivers/misc/ocxl/config.c        |  7 ++-
 drivers/misc/ocxl/link.c          | 31 +++++------
 drivers/misc/ocxl/main.c          |  5 ++
 drivers/misc/ocxl/ocxl_internal.h | 24 +++++++++
 drivers/misc/ocxl/powernv.c       | 88 +++++++++++++++++++++++++++++++
 6 files changed, 138 insertions(+), 19 deletions(-)
 create mode 100644 drivers/misc/ocxl/powernv.c

diff --git a/drivers/misc/ocxl/Makefile b/drivers/misc/ocxl/Makefile
index d07d1bb8e8d4..bfdaeb232b83 100644
--- a/drivers/misc/ocxl/Makefile
+++ b/drivers/misc/ocxl/Makefile
@@ -4,6 +4,8 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
 ocxl-y				+= main.o pci.o config.o file.o pasid.o mmio.o
 ocxl-y				+= link.o context.o afu_irq.o sysfs.o trace.o
 ocxl-y				+= core.o
+ocxl-$(CONFIG_PPC_POWERNV)	+= powernv.o
+
 obj-$(CONFIG_OCXL)		+= ocxl.o
 
 # For tracepoints to include our trace.h from tracepoint infrastructure:
diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index 7ca0f6744125..981a3bcfe742 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2017 IBM Corp.
 #include <linux/pci.h>
-#include <asm/pnv-ocxl.h>
 #include <misc/ocxl-config.h>
 #include "ocxl_internal.h"
 
@@ -649,7 +648,7 @@ int ocxl_config_get_actag_info(struct pci_dev *dev, u16 *base, u16 *enabled,
 	 * avoid an external driver using ocxl as a library to call
 	 * platform-dependent code
 	 */
-	rc = pnv_ocxl_get_actag(dev, base, enabled, supported);
+	rc = ocxl_ops->get_actag(dev, base, enabled, supported);
 	if (rc) {
 		dev_err(&dev->dev, "Can't get actag for device: %d\n", rc);
 		return rc;
@@ -673,7 +672,7 @@ EXPORT_SYMBOL_GPL(ocxl_config_set_afu_actag);
 
 int ocxl_config_get_pasid_info(struct pci_dev *dev, int *count)
 {
-	return pnv_ocxl_get_pasid_count(dev, count);
+	return ocxl_ops->get_pasid_count(dev, count);
 }
 
 void ocxl_config_set_afu_pasid(struct pci_dev *dev, int pos, int pasid_base,
@@ -715,7 +714,7 @@ int ocxl_config_set_TL(struct pci_dev *dev, int tl_dvsec)
 	if (PCI_FUNC(dev->devfn) != 0)
 		return 0;
 
-	return pnv_ocxl_set_TL(dev, tl_dvsec);
+	return ocxl_ops->set_tl(dev, tl_dvsec);
 }
 EXPORT_SYMBOL_GPL(ocxl_config_set_TL);
 
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index e936a3bd5957..9f4d164180a7 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -5,7 +5,6 @@
 #include <linux/mm_types.h>
 #include <linux/mmu_context.h>
 #include <asm/copro.h>
-#include <asm/pnv-ocxl.h>
 #include <misc/ocxl.h>
 #include "ocxl_internal.h"
 #include "trace.h"
@@ -83,7 +82,7 @@ static void ack_irq(struct ocxl_link *link, enum xsl_response r)
 				     link->xsl_fault.dsisr,
 				     link->xsl_fault.dar,
 				     reg);
-		pnv_ocxl_handle_fault(link->platform_data, reg);
+		ocxl_ops->ack_irq(link->platform_data, reg);
 	}
 }
 
@@ -146,8 +145,8 @@ static irqreturn_t xsl_fault_handler(int irq, void *data)
 	int pid;
 	bool schedule = false;
 
-	pnv_ocxl_get_fault_state(link->platform_data, &dsisr, &dar,
-				 &pe_handle, &pid);
+	ocxl_ops->get_fault_state(link->platform_data, &dsisr, &dar,
+				  &pe_handle, &pid);
 	trace_ocxl_fault(pe_handle, dsisr, dar, -1);
 
 	/* We could be reading all null values here if the PE is being
@@ -282,8 +281,8 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	INIT_WORK(&link->xsl_fault.fault_work, xsl_fault_handler_bh);
 
 	/* platform specific hook */
-	rc = pnv_ocxl_platform_setup(dev, PE_mask, &xsl_irq,
-				     &link->platform_data);
+	rc = ocxl_ops->platform_setup(dev, PE_mask, &xsl_irq,
+				      &link->platform_data);
 	if (rc)
 		goto err_free;
 
@@ -298,7 +297,7 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	return 0;
 
 err_xsl_irq:
-	pnv_ocxl_platform_release(link->platform_data);
+	ocxl_ops->platform_release(link->platform_data);
 err_free:
 	kfree(link);
 	return rc;
@@ -344,7 +343,7 @@ static void release_xsl(struct kref *ref)
 
 	list_del(&link->list);
 	/* call platform code before releasing data */
-	pnv_ocxl_platform_release(link->platform_data);
+	ocxl_ops->platform_release(link->platform_data);
 	free_link(link);
 }
 
@@ -378,8 +377,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	pe_data->xsl_err_cb = xsl_err_cb;
 	pe_data->xsl_err_data = xsl_err_data;
 
-	rc = pnv_ocxl_set_pe(link->platform_data, mfspr(SPRN_LPID),
-			     pasid, pidr, tidr, amr, &pe_handle);
+	rc = ocxl_ops->set_pe(link->platform_data, pasid, pidr, tidr,
+			      amr, &pe_handle);
 	if (rc) {
 		kfree(pe_data);
 		goto unlock;
@@ -429,7 +428,9 @@ int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
 	int rc;
 
 	mutex_lock(&link->pe_lock);
-	rc = pnv_ocxl_update_pe(link->platform_data, pasid, tid);
+
+	rc = ocxl_ops->update_pe(link->platform_data, pasid, tid);
+
 	mutex_unlock(&link->pe_lock);
 
 	return rc;
@@ -462,8 +463,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 	 */
 	mutex_lock(&link->pe_lock);
 
-	rc = pnv_ocxl_remove_pe(link->platform_data, pasid, &pid, &tid,
-				&pe_handle);
+	rc = ocxl_ops->remove_pe(link->platform_data, pasid, &pid, &tid,
+				 &pe_handle);
 	if (rc)
 		goto unlock;
 
@@ -494,7 +495,7 @@ int ocxl_link_irq_alloc(void *link_handle, int *hw_irq, u64 *trigger_addr)
 	if (atomic_dec_if_positive(&link->irq_available) < 0)
 		return -ENOSPC;
 
-	rc = pnv_ocxl_alloc_xive_irq(&irq, &addr);
+	rc = ocxl_ops->alloc_xive_irq(link->platform_data, &irq, &addr);
 	if (rc) {
 		atomic_inc(&link->irq_available);
 		return rc;
@@ -510,7 +511,7 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
 
-	pnv_ocxl_free_xive_irq(hw_irq);
+	ocxl_ops->free_xive_irq(link->platform_data, hw_irq);
 	atomic_inc(&link->irq_available);
 }
 EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
diff --git a/drivers/misc/ocxl/main.c b/drivers/misc/ocxl/main.c
index 7210d9e059be..95df2ba4d473 100644
--- a/drivers/misc/ocxl/main.c
+++ b/drivers/misc/ocxl/main.c
@@ -4,6 +4,8 @@
 #include <linux/pci.h>
 #include "ocxl_internal.h"
 
+const struct ocxl_backend_ops *ocxl_ops;
+
 static int __init init_ocxl(void)
 {
 	int rc = 0;
@@ -12,6 +14,9 @@ static int __init init_ocxl(void)
 	if (rc)
 		return rc;
 
+	if (cpu_has_feature(CPU_FTR_HVMODE))
+		ocxl_ops = &ocxl_powernv_ops;
+
 	rc = pci_register_driver(&ocxl_pci_driver);
 	if (rc) {
 		ocxl_file_exit();
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 6e1e9cd315c0..2bdea279bdc6 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -82,6 +82,30 @@ struct ocxl_context {
 	u16 tidr; // Thread ID used for P9 wait implementation
 };
 
+struct ocxl_backend_ops {
+	struct module *module;
+	void (*ack_irq)(void *data, u64 tfc);
+	int (*alloc_xive_irq)(void *data, u32 *irq, u64 *trigger_addr);
+	void (*free_xive_irq)(void *data, u32 irq);
+	int (*get_actag)(struct pci_dev *dev, u16 *base, u16 *enabled,
+			 u16 *supported);
+	void (*get_fault_state)(void *data, u64 *dsisr, u64 *dar,
+				u64 *pe_handle, int *pid);
+	int (*get_pasid_count)(struct pci_dev *dev, int *count);
+	void (*platform_release)(void *data);
+	int (*platform_setup)(struct pci_dev *dev, int PE_mask,
+			      int *hwirq, void **data);
+	int (*remove_pe)(void *data, int pasid, u32 *pid, u32 *tid,
+			 int *pe_handle);
+	int (*set_pe)(void *data, int pasid, u32 pidr, u32 tidr,
+		      u64 amr, int *pe_handle);
+	int (*set_tl)(struct pci_dev *dev, int tl_dvsec);
+	int (*update_pe)(void *data, int pasid, __u16 tid);
+};
+
+extern const struct ocxl_backend_ops ocxl_powernv_ops;
+extern const struct ocxl_backend_ops *ocxl_ops;
+
 int ocxl_create_cdev(struct ocxl_afu *afu);
 void ocxl_destroy_cdev(struct ocxl_afu *afu);
 int ocxl_file_register_afu(struct ocxl_afu *afu);
diff --git a/drivers/misc/ocxl/powernv.c b/drivers/misc/ocxl/powernv.c
new file mode 100644
index 000000000000..13c98fcf7fc7
--- /dev/null
+++ b/drivers/misc/ocxl/powernv.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corp.
+#include <asm/pnv-ocxl.h>
+#include <misc/ocxl-config.h>
+#include "ocxl_internal.h"
+
+static void ack_irq(void *data, u64 tfc)
+{
+	pnv_ocxl_handle_fault(data, tfc);
+}
+
+static int alloc_xive_irq(void *unused, u32 *irq,
+			  u64 *trigger_addr)
+{
+	return pnv_ocxl_alloc_xive_irq(irq, trigger_addr);
+}
+
+static void free_xive_irq(void *unused, u32 irq)
+{
+	pnv_ocxl_free_xive_irq(irq);
+}
+
+static int get_actag(struct pci_dev *dev, u16 *base,
+		     u16 *enabled, u16 *supported)
+{
+	return pnv_ocxl_get_actag(dev, base, enabled, supported);
+}
+
+static void get_fault_state(void *data, u64 *dsisr, u64 *dar,
+			    u64 *pe_handle, int *pid)
+{
+	pnv_ocxl_get_fault_state(data, dsisr, dar, pe_handle, pid);
+}
+
+static int get_pasid_count(struct pci_dev *dev, int *count)
+{
+	return pnv_ocxl_get_pasid_count(dev, count);
+}
+
+static void platform_release(void *data)
+{
+	return pnv_ocxl_platform_release(data);
+}
+
+static int platform_setup(struct pci_dev *dev, int PE_mask, int *hwirq,
+			  void **data)
+{
+	return pnv_ocxl_platform_setup(dev, PE_mask, hwirq, data);
+}
+
+static int remove_pe(void *data, int pasid, u32 *pid,
+		     u32 *tid, int *pe_handle)
+{
+	return pnv_ocxl_remove_pe(data, pasid, pid, tid, pe_handle);
+}
+
+static int set_pe(void *data, int pasid, u32 pidr, u32 tidr,
+		  u64 amr, int *pe_handle)
+{
+	return pnv_ocxl_set_pe(data, mfspr(SPRN_LPID), pasid,
+			       pidr, tidr, amr, pe_handle);
+}
+
+static int set_tl(struct pci_dev *dev, int tl_dvsec)
+{
+	return pnv_ocxl_set_TL(dev, tl_dvsec);
+}
+
+static int update_pe(void *data, int pasid, __u16 tid)
+{
+	return pnv_ocxl_update_pe(data, pasid, tid);
+}
+
+const struct ocxl_backend_ops ocxl_powernv_ops = {
+	.module = THIS_MODULE,
+	.ack_irq = ack_irq,
+	.alloc_xive_irq = alloc_xive_irq,
+	.free_xive_irq = free_xive_irq,
+	.get_actag = get_actag,
+	.get_fault_state = get_fault_state,
+	.get_pasid_count = get_pasid_count,
+	.platform_release = platform_release,
+	.platform_setup = platform_setup,
+	.remove_pe = remove_pe,
+	.set_pe = set_pe,
+	.set_tl = set_tl,
+	.update_pe = update_pe,
+};
-- 
2.21.0

