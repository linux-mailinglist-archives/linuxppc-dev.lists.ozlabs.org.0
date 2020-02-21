Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FEF166E3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 05:06:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NyYp05PLzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 15:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NxkL6QXqzDqbF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:28:26 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3KQuq014695
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:24 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubxwp5h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:23 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:28:19 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:28:12 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01L3SBXr31981876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59E2A4C04A;
 Fri, 21 Feb 2020 03:28:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9B2E4C040;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B65B9A03E1;
 Fri, 21 Feb 2020 14:28:03 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 20/27] powerpc/powernv/pmem: Forward events to userspace
Date: Fri, 21 Feb 2020 14:27:13 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-0020-0000-0000-000003AC2213
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-0021-0000-0000-000022042A34
Message-Id: <20200221032720.33893-21-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=3 malwarescore=0 mlxlogscore=834 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210020
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

Some of the interrupts that the card generates are better handled
by the userspace daemon, in particular:
Controller Hardware/Firmware Fatal
Controller Dump Available
Error Log available

This patch allows a userspace application to register an eventfd with
the driver via SCM_IOCTL_EVENTFD to receive notifications of these
interrupts.

Userspace can then identify what events have occurred by calling
SCM_IOCTL_EVENT_CHECK and checking against the SCM_IOCTL_EVENT_FOO
masks.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/platforms/powernv/pmem/ocxl.c    | 216 ++++++++++++++++++
 .../platforms/powernv/pmem/ocxl_internal.h    |   5 +
 include/uapi/nvdimm/ocxl-pmem.h               |  16 ++
 3 files changed, 237 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
index 009d4fd29e7d..e46696d3cc36 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
@@ -10,6 +10,7 @@
 #include <misc/ocxl.h>
 #include <linux/delay.h>
 #include <linux/ndctl.h>
+#include <linux/eventfd.h>
 #include <linux/fs.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
@@ -335,11 +336,22 @@ static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
 {
 	int rc;
 
+	// Disable doorbells
+	(void)ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIEC,
+				     OCXL_LITTLE_ENDIAN,
+				     GLOBAL_MMIO_CHI_ALL);
+
 	if (ocxlpmem->nvdimm_bus)
 		nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
 
 	free_minor(ocxlpmem);
 
+	if (ocxlpmem->irq_addr[1])
+		iounmap(ocxlpmem->irq_addr[1]);
+
+	if (ocxlpmem->irq_addr[0])
+		iounmap(ocxlpmem->irq_addr[0]);
+
 	if (ocxlpmem->cdev.owner)
 		cdev_del(&ocxlpmem->cdev);
 
@@ -443,6 +455,11 @@ static int file_release(struct inode *inode, struct file *file)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
 
+	if (ocxlpmem->ev_ctx) {
+		eventfd_ctx_put(ocxlpmem->ev_ctx);
+		ocxlpmem->ev_ctx = NULL;
+	}
+
 	ocxlpmem_put(ocxlpmem);
 	return 0;
 }
@@ -938,6 +955,51 @@ static int ioctl_controller_stats(struct ocxlpmem *ocxlpmem,
 	return rc;
 }
 
+static int ioctl_eventfd(struct ocxlpmem *ocxlpmem,
+		 struct ioctl_ocxl_pmem_eventfd __user *uarg)
+{
+	struct ioctl_ocxl_pmem_eventfd args;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	if (ocxlpmem->ev_ctx)
+		return -EINVAL;
+
+	ocxlpmem->ev_ctx = eventfd_ctx_fdget(args.eventfd);
+	if (!ocxlpmem->ev_ctx)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int ioctl_event_check(struct ocxlpmem *ocxlpmem, u64 __user *uarg)
+{
+	u64 val = 0;
+	int rc;
+	u64 chi = 0;
+
+	rc = ocxlpmem_chi(ocxlpmem, &chi);
+	if (rc < 0)
+		return rc;
+
+	if (chi & GLOBAL_MMIO_CHI_ELA)
+		val |= IOCTL_OCXL_PMEM_EVENT_ERROR_LOG_AVAILABLE;
+
+	if (chi & GLOBAL_MMIO_CHI_CDA)
+		val |= IOCTL_OCXL_PMEM_EVENT_CONTROLLER_DUMP_AVAILABLE;
+
+	if (chi & GLOBAL_MMIO_CHI_CFFS)
+		val |= IOCTL_OCXL_PMEM_EVENT_FIRMWARE_FATAL;
+
+	if (chi & GLOBAL_MMIO_CHI_CHFS)
+		val |= IOCTL_OCXL_PMEM_EVENT_HARDWARE_FATAL;
+
+	rc = copy_to_user((u64 __user *) uarg, &val, sizeof(val));
+
+	return rc;
+}
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -966,6 +1028,15 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 		rc = ioctl_controller_stats(ocxlpmem,
 					    (struct ioctl_ocxl_pmem_controller_stats __user *)args);
 		break;
+
+	case IOCTL_OCXL_PMEM_EVENTFD:
+		rc = ioctl_eventfd(ocxlpmem,
+				   (struct ioctl_ocxl_pmem_eventfd __user *)args);
+		break;
+
+	case IOCTL_OCXL_PMEM_EVENT_CHECK:
+		rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
+		break;
 	}
 
 	return rc;
@@ -1107,6 +1178,146 @@ static void dump_error_log(struct ocxlpmem *ocxlpmem)
 	kfree(buf);
 }
 
+static irqreturn_t imn0_handler(void *private)
+{
+	struct ocxlpmem *ocxlpmem = private;
+	u64 chi = 0;
+
+	(void)ocxlpmem_chi(ocxlpmem, &chi);
+
+	if (chi & GLOBAL_MMIO_CHI_ELA) {
+		dev_warn(&ocxlpmem->dev, "Error log is available\n");
+
+		if (ocxlpmem->ev_ctx)
+			eventfd_signal(ocxlpmem->ev_ctx, 1);
+	}
+
+	if (chi & GLOBAL_MMIO_CHI_CDA) {
+		dev_warn(&ocxlpmem->dev, "Controller dump is available\n");
+
+		if (ocxlpmem->ev_ctx)
+			eventfd_signal(ocxlpmem->ev_ctx, 1);
+	}
+
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t imn1_handler(void *private)
+{
+	struct ocxlpmem *ocxlpmem = private;
+	u64 chi = 0;
+
+	(void)ocxlpmem_chi(ocxlpmem, &chi);
+
+	if (chi & (GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS)) {
+		dev_err(&ocxlpmem->dev,
+			"Controller status is fatal, chi=0x%llx, going offline\n", chi);
+
+		if (ocxlpmem->nvdimm_bus) {
+			nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
+			ocxlpmem->nvdimm_bus = NULL;
+		}
+
+		if (ocxlpmem->ev_ctx)
+			eventfd_signal(ocxlpmem->ev_ctx, 1);
+	}
+
+	return IRQ_HANDLED;
+}
+
+
+/**
+ * ocxlpmem_setup_irq() - Set up the IRQs for the OpenCAPI Persistent Memory device
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+static int ocxlpmem_setup_irq(struct ocxlpmem *ocxlpmem)
+{
+	int rc;
+	u64 irq_addr;
+
+	rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context, &ocxlpmem->irq_id[0]);
+	if (rc)
+		return rc;
+
+	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0],
+				  imn0_handler, NULL, ocxlpmem);
+
+	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0]);
+	if (!irq_addr)
+		return -EINVAL;
+
+	ocxlpmem->irq_addr[0] = ioremap(irq_addr, PAGE_SIZE);
+	if (!ocxlpmem->irq_addr[0])
+		return -EINVAL;
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_OHP,
+				      OCXL_LITTLE_ENDIAN,
+				      (u64)ocxlpmem->irq_addr[0]);
+	if (rc)
+		goto out_irq0;
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_CFP,
+				      OCXL_LITTLE_ENDIAN, 0);
+	if (rc)
+		goto out_irq0;
+
+	rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context, &ocxlpmem->irq_id[1]);
+	if (rc)
+		goto out_irq0;
+
+
+	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1],
+				  imn1_handler, NULL, ocxlpmem);
+	if (rc)
+		goto out_irq0;
+
+	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1]);
+	if (!irq_addr) {
+		rc = -EFAULT;
+		goto out_irq0;
+	}
+
+	ocxlpmem->irq_addr[1] = ioremap(irq_addr, PAGE_SIZE);
+	if (!ocxlpmem->irq_addr[1]) {
+		rc = -EINVAL;
+		goto out_irq0;
+	}
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_OHP,
+				      OCXL_LITTLE_ENDIAN,
+				      (u64)ocxlpmem->irq_addr[1]);
+	if (rc)
+		goto out_irq1;
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_CFP,
+				      OCXL_LITTLE_ENDIAN, 0);
+	if (rc)
+		goto out_irq1;
+
+	// Enable doorbells
+	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIE,
+				    OCXL_LITTLE_ENDIAN,
+				    GLOBAL_MMIO_CHI_ELA | GLOBAL_MMIO_CHI_CDA |
+				    GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS |
+				    GLOBAL_MMIO_CHI_NSCRA);
+	if (rc)
+		goto out_irq1;
+
+	return 0;
+
+out_irq1:
+	iounmap(ocxlpmem->irq_addr[1]);
+	ocxlpmem->irq_addr[1] = NULL;
+
+out_irq0:
+	iounmap(ocxlpmem->irq_addr[0]);
+	ocxlpmem->irq_addr[0] = NULL;
+
+	return rc;
+}
+
 /**
  * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
  * This is important as it enables templates higher than 0 across all other functions,
@@ -1216,6 +1427,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	if (ocxlpmem_setup_irq(ocxlpmem)) {
+		dev_err(&pdev->dev, "Could not set up OCXL IRQs\n");
+		goto err;
+	}
+
 	if (setup_command_metadata(ocxlpmem)) {
 		dev_err(&pdev->dev, "Could not read OCXL command matada\n");
 		goto err;
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
index b953ee522ed4..927690f4888f 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
@@ -103,6 +103,10 @@ struct ocxlpmem {
 	struct pci_dev *pdev;
 	struct cdev cdev;
 	struct ocxl_fn *ocxl_fn;
+#define SCM_IRQ_COUNT 2
+	int irq_id[SCM_IRQ_COUNT];
+	struct dev_pagemap irq_pgmap[SCM_IRQ_COUNT];
+	void *irq_addr[SCM_IRQ_COUNT];
 	struct nd_interleave_set nd_set;
 	struct nvdimm_bus_descriptor bus_desc;
 	struct nvdimm_bus *nvdimm_bus;
@@ -113,6 +117,7 @@ struct ocxlpmem {
 	struct command_metadata ns_command;
 	struct resource pmem_res;
 	struct nd_region *nd_region;
+	struct eventfd_ctx *ev_ctx;
 	char fw_version[8+1];
 	u32 timeouts[ADMIN_COMMAND_MAX+1];
 
diff --git a/include/uapi/nvdimm/ocxl-pmem.h b/include/uapi/nvdimm/ocxl-pmem.h
index add223aa2fdb..988eb0bc413d 100644
--- a/include/uapi/nvdimm/ocxl-pmem.h
+++ b/include/uapi/nvdimm/ocxl-pmem.h
@@ -66,6 +66,20 @@ struct ioctl_ocxl_pmem_controller_stats {
 	__u64 cache_write_latency; /* nanoseconds */
 };
 
+struct ioctl_ocxl_pmem_eventfd {
+	__s32 eventfd;
+	__u32 reserved;
+};
+
+#ifndef BIT_ULL
+#define BIT_ULL(nr)	(1ULL << (nr))
+#endif
+
+#define IOCTL_OCXL_PMEM_EVENT_CONTROLLER_DUMP_AVAILABLE	BIT_ULL(0)
+#define IOCTL_OCXL_PMEM_EVENT_ERROR_LOG_AVAILABLE	BIT_ULL(1)
+#define IOCTL_OCXL_PMEM_EVENT_HARDWARE_FATAL		BIT_ULL(2)
+#define IOCTL_OCXL_PMEM_EVENT_FIRMWARE_FATAL		BIT_ULL(3)
+
 /* ioctl numbers */
 #define OCXL_PMEM_MAGIC 0x5C
 /* SCM devices */
@@ -74,5 +88,7 @@ struct ioctl_ocxl_pmem_controller_stats {
 #define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_DATA		_IOWR(OCXL_PMEM_MAGIC, 0x03, struct ioctl_ocxl_pmem_controller_dump_data)
 #define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE	_IO(OCXL_PMEM_MAGIC, 0x04)
 #define IOCTL_OCXL_PMEM_CONTROLLER_STATS		_IO(OCXL_PMEM_MAGIC, 0x05)
+#define IOCTL_OCXL_PMEM_EVENTFD				_IOW(OCXL_PMEM_MAGIC, 0x06, struct ioctl_ocxl_pmem_eventfd)
+#define IOCTL_OCXL_PMEM_EVENT_CHECK			_IOR(OCXL_PMEM_MAGIC, 0x07, __u64)
 
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

