Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CBE3467
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 15:38:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zSxT2GxFzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 00:38:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zSjt6HWDzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:28:17 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ODK4Dn028310
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:15 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vucef1jaq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:12 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Thu, 24 Oct 2019 14:28:10 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 Oct 2019 14:28:07 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ODS69017301514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 13:28:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B423011C04C;
 Thu, 24 Oct 2019 13:28:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B20A11C04A;
 Thu, 24 Oct 2019 13:28:06 +0000 (GMT)
Received: from lombard-w541.ibmuc.com (unknown [9.145.180.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 13:28:06 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org
Subject: [PATCH 2/2] vfio/pci: Introduce OpenCAPI devices support.
Date: Thu, 24 Oct 2019 15:28:05 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
References: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102413-0012-0000-0000-0000035CD76C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102413-0013-0000-0000-000021980A4B
Message-Id: <20191024132805.30701-3-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240128
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

This patch adds new IOCTL commands for VFIO PCI driver to support
configuration and management for OpenCAPI devices, which have been passed
through from host to QEMU VFIO.
OpenCAPI (Open Coherent Accelerator Processor Interface) is an interface
between processors and accelerators.

The main IOCTL command is:
 VFIO_DEVICE_OCXL_OP 	Handles devices, which supports the OpenCAPI
 			interface, using the ocxl pnv_* interface.

The following commands are supported, based on the hcalls defined
in ocxl/pseries.c that implements the guest-specific callbacks.
VFIO_DEVICE_OCXL_CONFIG_ADAPTER   Used to configure OpenCAPI adapter
			     	  characteristics.

VFIO_DEVICE_OCXL_CONFIG_SPA       Used to configure the schedule process
			     	  area (SPA) table for an OpenCAPI device.

VFIO_DEVICE_OCXL_GET_FAULT_STATE  Used to retrieve fault information
				  from an OpenCAPI device.

VFIO_DEVICE_OCXL_HANDLE_FAULT     Used to respond to an OpenCAPI fault.

The platform data is declared in the vfio_pci_ocxl_link which is common
for each devices sharing the same domain, same bus and same slot.

The lpid value, requested to configure the process element in the
Scheduled Process Area, is not available in the QEMU environment.
This implies getting it from the host through the iommu group.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/vfio/pci/Kconfig         |   7 +
 drivers/vfio/pci/Makefile        |   1 +
 drivers/vfio/pci/vfio_pci.c      |  19 ++
 drivers/vfio/pci/vfio_pci_ocxl.c | 287 +++++++++++++++++++++++++++++++
 drivers/vfio/vfio.c              |  25 +++
 include/linux/vfio.h             |  13 ++
 include/uapi/linux/vfio.h        |  22 +++
 7 files changed, 374 insertions(+)
 create mode 100644 drivers/vfio/pci/vfio_pci_ocxl.c

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index ac3c1dd3edef..fd3716d10ded 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -45,3 +45,10 @@ config VFIO_PCI_NVLINK2
 	depends on VFIO_PCI && PPC_POWERNV
 	help
 	  VFIO PCI support for P9 Witherspoon machine with NVIDIA V100 GPUs
+
+config VFIO_PCI_OCXL
+	depends on VFIO_PCI
+	def_bool y if OCXL_BASE
+	help
+	  VFIO PCI support for devices which handle the Open Coherent
+	  Accelerator Processor Interface.
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index f027f8a0e89c..6d55a5fee4b0 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -3,5 +3,6 @@
 vfio-pci-y := vfio_pci.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
 vfio-pci-$(CONFIG_VFIO_PCI_NVLINK2) += vfio_pci_nvlink2.o
+vfio-pci-$(CONFIG_VFIO_PCI_OCXL) += vfio_pci_ocxl.o
 
 obj-$(CONFIG_VFIO_PCI) += vfio-pci.o
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 703948c9fbe1..4f9741bbe790 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -1128,6 +1128,25 @@ static long vfio_pci_ioctl(void *device_data,
 
 		return vfio_pci_ioeventfd(vdev, ioeventfd.offset,
 					  ioeventfd.data, count, ioeventfd.fd);
+	} else if (cmd == VFIO_DEVICE_OCXL_OP) {
+		struct vfio_device_ocxl_op ocxl_op;
+		int ret = 0;
+
+		minsz = offsetofend(struct vfio_device_ocxl_op, data);
+
+		if (copy_from_user(&ocxl_op, (void __user *)arg, minsz))
+			return -EFAULT;
+
+		if (ocxl_op.argsz < minsz)
+			return -EINVAL;
+
+		ret = vfio_pci_ocxl_ioctl(vdev->pdev, &ocxl_op);
+
+		if (!ret) {
+			if (copy_to_user((void __user *)arg, &ocxl_op, minsz))
+				ret = -EFAULT;
+		}
+		return ret;
 	}
 
 	return -ENOTTY;
diff --git a/drivers/vfio/pci/vfio_pci_ocxl.c b/drivers/vfio/pci/vfio_pci_ocxl.c
new file mode 100644
index 000000000000..cb5cd4fb416d
--- /dev/null
+++ b/drivers/vfio/pci/vfio_pci_ocxl.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2019 IBM Corp.
+
+#include <asm/kvm_ppc.h>
+#include <asm/pnv-ocxl.h>
+#include <linux/vfio.h>
+#include <linux/slab.h>
+#include <linux/pci.h>
+#include <linux/kvm_host.h>
+
+struct vfio_device_ocxl_link {
+	struct list_head list;
+	int domain;
+	int bus;
+	int slot;
+	void *platform_data;
+};
+static struct list_head links_list = LIST_HEAD_INIT(links_list);
+static DEFINE_MUTEX(links_list_lock);
+
+#define VFIO_DEVICE_OCXL_CONFIG_ADAPTER		1
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SETUP		1
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_RELEASE	2
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_ACTAG	3
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_PASID	4
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SET_TL	5
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_ALLOC_IRQ	6
+#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_FREE_IRQ	7
+
+#define VFIO_DEVICE_OCXL_CONFIG_SPA		2
+#define   VFIO_DEVICE_OCXL_CONFIG_SPA_SET		1
+#define   VFIO_DEVICE_OCXL_CONFIG_SPA_UPDATE		2
+#define   VFIO_DEVICE_OCXL_CONFIG_SPA_REMOVE		3
+
+#define VFIO_DEVICE_OCXL_GET_FAULT_STATE	3
+#define VFIO_DEVICE_OCXL_HANDLE_FAULT		4
+
+static struct vfio_device_ocxl_link *find_link(struct pci_dev *pdev)
+{
+	struct vfio_device_ocxl_link *link;
+
+	list_for_each_entry(link, &links_list, list) {
+		/* The functions of a device all share the same link */
+		if (link->domain == pci_domain_nr(pdev->bus) &&
+			link->bus == pdev->bus->number &&
+			link->slot == PCI_SLOT(pdev->devfn)) {
+			return link;
+		}
+	}
+
+	/* link doesn't exist yet. Allocate one */
+	link = kzalloc(sizeof(struct vfio_device_ocxl_link), GFP_KERNEL);
+	if (!link)
+		return NULL;
+	link->domain = pci_domain_nr(pdev->bus);
+	link->bus = pdev->bus->number;
+	link->slot = PCI_SLOT(pdev->devfn);
+	list_add(&link->list, &links_list);
+	return link;
+}
+
+static long irq_mapped(struct pci_dev *pdev,
+		       int host_irq, int guest_irq, bool set)
+{
+	struct irq_desc *desc;
+	struct kvm *kvm;
+	int ret = 0, virq;
+
+	virq = irq_create_mapping(NULL, host_irq);
+	if (!virq) {
+		dev_err(&pdev->dev,
+			"irq_create_mapping failed for translation interrupt\n");
+		return -EINVAL;
+	}
+
+	desc = irq_to_desc(virq);
+	if (!desc) {
+		dev_err(&pdev->dev,
+			"irq_to_desc failed (host_irq: %d, virq: %d)\n",
+			host_irq, virq);
+		return -EIO;
+	}
+
+	kvm = vfio_dev_get_kvm(&pdev->dev);
+	if (!kvm)
+		return -ENODEV;
+
+	mutex_lock(&kvm->lock);
+	if (xics_on_xive()) {
+		if (set)
+			ret = kvmppc_xive_set_mapped(kvm, guest_irq, desc);
+		else
+			ret = kvmppc_xive_clr_mapped(kvm, guest_irq, desc);
+	} else {
+		if (set)
+			kvmppc_xics_set_mapped(kvm, guest_irq, host_irq);
+		else
+			kvmppc_xics_clr_mapped(kvm, guest_irq, host_irq);
+	}
+	mutex_unlock(&kvm->lock);
+	kvm_put_kvm(kvm);
+
+	return ret;
+}
+
+static long config_adapter(struct pci_dev *pdev,
+			   struct vfio_device_ocxl_op *ocxl_op,
+			   struct vfio_device_ocxl_link *link)
+{
+	int PE_mask, host_irq, guest_irq, count, tl_dvsec;
+	u16 base, enabled, supported;
+	u64 cmd;
+	int ret = 0;
+
+	cmd = ocxl_op->data[2];
+	switch (cmd) {
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SETUP:
+		PE_mask = ocxl_op->data[3];
+		ret = pnv_ocxl_platform_setup(pdev, PE_mask,
+					      &host_irq,
+					      &link->platform_data);
+		if (!ret) {
+			guest_irq = ocxl_op->data[4];
+			ret = irq_mapped(pdev, host_irq, guest_irq, true);
+			if (!ret)
+				ocxl_op->data[0] = host_irq;
+		}
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_RELEASE:
+		pnv_ocxl_platform_release(link->platform_data);
+
+		host_irq = ocxl_op->data[3];
+		guest_irq = ocxl_op->data[4];
+		if (host_irq && guest_irq)
+			ret = irq_mapped(pdev, host_irq, guest_irq, false);
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_ACTAG:
+		ret = pnv_ocxl_get_actag(pdev, &base, &enabled,
+					 &supported);
+		if (!ret) {
+			ocxl_op->data[0] = base;
+			ocxl_op->data[1] = enabled;
+			ocxl_op->data[2] = supported;
+		}
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_PASID:
+		ret = pnv_ocxl_get_pasid_count(pdev, &count);
+		if (!ret)
+			ocxl_op->data[0] = count;
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SET_TL:
+		tl_dvsec = ocxl_op->data[3];
+		ret = pnv_ocxl_set_TL(pdev, tl_dvsec);
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		dev_err(&pdev->dev, "Failed to configure the adapter "
+				    "(cmd: %#llx, ret: %d)\n",
+				    cmd, ret);
+
+	return ret;
+}
+
+static long config_spa(struct pci_dev *pdev,
+		       struct vfio_device_ocxl_op *ocxl_op,
+		       struct vfio_device_ocxl_link *link)
+{
+	int lpid, pid, tid, pasid;
+	int pe_handle, ret = 0;
+	u32 pidr, tidr, amr;
+	struct kvm *kvm;
+	u64 cmd;
+
+	cmd = ocxl_op->data[2];
+	switch (cmd) {
+	case VFIO_DEVICE_OCXL_CONFIG_SPA_SET:
+		kvm = vfio_dev_get_kvm(&pdev->dev);
+		if (!kvm)
+			return -ENODEV;
+		lpid = kvm->arch.lpid;
+		kvm_put_kvm(kvm);
+
+		pasid = ocxl_op->data[3];
+		pidr  = ocxl_op->data[4];
+		tidr  = ocxl_op->data[5];
+		amr   = ocxl_op->data[6];
+
+		ret = pnv_ocxl_set_pe(link->platform_data, lpid, pasid,
+				      pidr, tidr, amr, &pe_handle);
+		if (!ret)
+			ocxl_op->data[0] = pe_handle;
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_SPA_UPDATE:
+		pasid = ocxl_op->data[3];
+		tid   = ocxl_op->data[4];
+
+		pnv_ocxl_update_pe(link->platform_data, pasid, tid);
+		break;
+
+	case VFIO_DEVICE_OCXL_CONFIG_SPA_REMOVE:
+		pasid = ocxl_op->data[3];
+
+		ret = pnv_ocxl_remove_pe(link->platform_data, pasid,
+					 &pid, &tid, &pe_handle);
+		if (!ret) {
+			ocxl_op->data[0] = pid;
+			ocxl_op->data[1] = tid;
+			ocxl_op->data[2] = pe_handle;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		dev_err(&pdev->dev, "Failed to configure the SPA "
+				    "(cmd: %#llx, ret: %d)\n",
+				    cmd, ret);
+
+	return ret;
+}
+
+static void get_fault_state(struct vfio_device_ocxl_op *ocxl_op,
+			    struct vfio_device_ocxl_link *link)
+{
+	u64 dsisr, dar, pe_handle;
+	int pid;
+
+	pnv_ocxl_get_fault_state(link->platform_data, &dsisr, &dar,
+				 &pe_handle, &pid);
+
+	ocxl_op->data[0] = dsisr;
+	ocxl_op->data[1] = dar;
+	ocxl_op->data[2] = pe_handle;
+	ocxl_op->data[3] = pid;
+}
+
+static void handle_fault(struct vfio_device_ocxl_op *ocxl_op,
+			 struct vfio_device_ocxl_link *link)
+{
+	u64 tfc;
+
+	tfc = ocxl_op->data[2];
+	pnv_ocxl_handle_fault(link->platform_data, tfc);
+}
+
+long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
+			 struct vfio_device_ocxl_op *ocxl_op)
+{
+	struct vfio_device_ocxl_link *link;
+	int ret = 0;
+
+	/* The functions of a device all share the same link */
+	mutex_lock(&links_list_lock);
+	link = find_link(pdev);
+
+	switch (ocxl_op->op) {
+	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER:
+		ret = config_adapter(pdev, ocxl_op, link);
+		break;
+	case VFIO_DEVICE_OCXL_CONFIG_SPA:
+		ret = config_spa(pdev, ocxl_op, link);
+		break;
+	case VFIO_DEVICE_OCXL_GET_FAULT_STATE:
+		get_fault_state(ocxl_op, link);
+		break;
+	case VFIO_DEVICE_OCXL_HANDLE_FAULT:
+		handle_fault(ocxl_op, link);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&links_list_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vfio_pci_ocxl_ioctl);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 388597930b64..31d64ecac690 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
+#include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -2051,6 +2052,30 @@ void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(vfio_group_set_kvm);
 
+struct kvm *vfio_dev_get_kvm(struct device *dev)
+{
+	struct iommu_group *iommu_group;
+	struct vfio_group *group;
+	struct kvm *kvm;
+
+	iommu_group = iommu_group_get(dev);
+	if (!iommu_group)
+		return NULL;
+
+	group = vfio_group_get_from_iommu(iommu_group);
+	if (!group) {
+		iommu_group_put(iommu_group);
+		return NULL;
+	}
+
+	kvm_get_kvm(kvm = group->kvm);
+	iommu_group_put(iommu_group);
+	vfio_group_put(group);
+
+	return kvm;
+}
+EXPORT_SYMBOL_GPL(vfio_dev_get_kvm);
+
 static int vfio_register_group_notifier(struct vfio_group *group,
 					unsigned long *events,
 					struct notifier_block *nb)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e42a711a2800..22ee8d007353 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -129,6 +129,7 @@ extern int vfio_unregister_notifier(struct device *dev,
 
 struct kvm;
 extern void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
+extern struct kvm *vfio_dev_get_kvm(struct device *dev);
 
 /*
  * Sub-module helpers
@@ -195,4 +196,16 @@ extern int vfio_virqfd_enable(void *opaque,
 			      void *data, struct virqfd **pvirqfd, int fd);
 extern void vfio_virqfd_disable(struct virqfd **pvirqfd);
 
+/* OpenCAPI */
+#if IS_ENABLED(CONFIG_OCXL_BASE)
+extern long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
+				struct vfio_device_ocxl_op *ocxl_op);
+#else
+static inline long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
+				       struct vfio_device_ocxl_op *ocxl_op)
+{
+	return -ENOTTY;
+}
+#endif /* CONFIG_OCXL_BASE */
+
 #endif /* VFIO_H */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 8f10748dac79..4432593c2e65 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -912,6 +912,28 @@ struct vfio_iommu_spapr_tce_remove {
 };
 #define VFIO_IOMMU_SPAPR_TCE_REMOVE	_IO(VFIO_TYPE, VFIO_BASE + 20)
 
+/**
+ * VFIO_DEVICE_OCXL_OP - _IOW(VFIO_TYPE, VFIO_BASE + 22, struct vfio_device_ocxl_op)
+ *
+ * Handles devices, which supports the OpenCAPI interface, using the
+ * ocxl pnv_* interface.
+ */
+struct vfio_device_ocxl_op {
+	__u32 argsz;
+	__u32 flags;
+	__u32 op;
+	__u64 data[9];
+		/* data to be read and written
+		 * data[0] = buid
+		 * data[1] = config_addr
+		 * data[2] = cmd or data[2] = p1, data[3] = p2, ...
+		 * data[3] = p1, params[4] = p2, ...
+		 *
+		 * data[x] = outx ...
+		 */
+};
+#define VFIO_DEVICE_OCXL_OP		_IO(VFIO_TYPE, VFIO_BASE + 22)
+
 /* ***************************************************************** */
 
 #endif /* _UAPIVFIO_H */
-- 
2.21.0

