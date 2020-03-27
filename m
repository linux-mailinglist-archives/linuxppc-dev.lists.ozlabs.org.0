Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B9198F58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:03:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s3JW5412zDqnR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=WFsUJw7F; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s3D53lFWzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:59:17 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 167402DC6865;
 Mon, 30 Mar 2020 16:53:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547581;
 bh=vRLE2b0DEucnyqflmU5elmtDiv/1IFmmCdakHAT0FxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFsUJw7F0hIvPb6ZSnt7GAZpXr/E2Z9FYSbulLN05P/O+C0TaVzvwKh5K8dIeXpiB
 1y8bnd3fGf1XVk3oXKsSI3fdeQmG2Me70bYNsdEBHoW8J42QpayBFlESBkFy7hhRgO
 1IqLDbk9/270vDZqLI04gDZnK4Zk7KL6KQgSKfRaDWPSQEL53mUKtqvNVX19talTTY
 5GQaF52LoakCZPynBwsvCdUq1XJovsBZLYme3hHOkaqo4pdalXmKJe8+4lLbuHvUMZ
 Y7X6oVZUKnMsZB4sbxShJLs6L/G/IAZ1MCptBoex4XCq0mx4W+x8nrgnfKDuSTbMDn
 fghqXsNGY5v14b0EDv0f+f9cfcMrCP/enxq03xCTHsDWAGRtNCbzS6nG4UR0xKQYyA
 /hNaj4Uy20cpBY5Y57b+0zCilg4+GOdZucdF3SA+TMPC9K0gq8ClMn8f1w/lp/Mn+h
 Jn7wjsWP505+/8Mn94Lb1USkIdTadhAnDQW+OrDzezfqlVWBThppZJKxi2C397wF2Q
 QzR6dAX2U3BPMQKNyjQoHMqnwmWm2ieepCeTAkAmErwjiwtz69TRaanTh+Xf61MbSy
 T8KOniORK8+jCPalfJasMUw6I1GNvWxqrhhlYo69FnhBtCnNWJTfrVf6ZW1N4+lYUi
 BpfFwmmdfaCKrHJ2RWcBpCE8=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4As045934;
 Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 19/25] nvdimm/ocxl: Forward events to userspace
Date: Fri, 27 Mar 2020 18:11:56 +1100
Message-Id: <20200327071202.2159885-20-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
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
 drivers/nvdimm/ocxl/main.c     | 220 +++++++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/ocxlpmem.h |   4 +
 include/uapi/nvdimm/ocxlpmem.h |  12 ++
 3 files changed, 236 insertions(+)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index 0040fc09cceb..cb6cdc9eb899 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -10,6 +10,7 @@
 #include <misc/ocxl.h>
 #include <linux/delay.h>
 #include <linux/ndctl.h>
+#include <linux/eventfd.h>
 #include <linux/fs.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
@@ -301,8 +302,19 @@ static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
 {
 	int rc;
 
+	// Disable doorbells
+	(void)ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIEC,
+				     OCXL_LITTLE_ENDIAN,
+				     GLOBAL_MMIO_CHI_ALL);
+
 	free_minor(ocxlpmem);
 
+	if (ocxlpmem->irq_addr[1])
+		iounmap(ocxlpmem->irq_addr[1]);
+
+	if (ocxlpmem->irq_addr[0])
+		iounmap(ocxlpmem->irq_addr[0]);
+
 	if (ocxlpmem->ocxl_context) {
 		rc = ocxl_context_detach(ocxlpmem->ocxl_context);
 		if (rc == -EBUSY)
@@ -398,6 +410,11 @@ static int file_release(struct inode *inode, struct file *file)
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
@@ -928,6 +945,52 @@ static int ioctl_controller_stats(struct ocxlpmem *ocxlpmem,
 	return rc;
 }
 
+static int ioctl_eventfd(struct ocxlpmem *ocxlpmem,
+			 struct ioctl_ocxlpmem_eventfd __user *uarg)
+{
+	struct ioctl_ocxlpmem_eventfd args;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	if (ocxlpmem->ev_ctx)
+		return -EBUSY;
+
+	ocxlpmem->ev_ctx = eventfd_ctx_fdget(args.eventfd);
+	if (IS_ERR(ocxlpmem->ev_ctx))
+		return PTR_ERR(ocxlpmem->ev_ctx);
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
+		val |= IOCTL_OCXLPMEM_EVENT_ERROR_LOG_AVAILABLE;
+
+	if (chi & GLOBAL_MMIO_CHI_CDA)
+		val |= IOCTL_OCXLPMEM_EVENT_CONTROLLER_DUMP_AVAILABLE;
+
+	if (chi & GLOBAL_MMIO_CHI_CFFS)
+		val |= IOCTL_OCXLPMEM_EVENT_FIRMWARE_FATAL;
+
+	if (chi & GLOBAL_MMIO_CHI_CHFS)
+		val |= IOCTL_OCXLPMEM_EVENT_HARDWARE_FATAL;
+
+	if (copy_to_user((u64 __user *)uarg, &val, sizeof(val)))
+		return -EFAULT;
+
+	return rc;
+}
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -956,6 +1019,15 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 		rc = ioctl_controller_stats(ocxlpmem,
 					    (struct ioctl_ocxlpmem_controller_stats __user *)args);
 		break;
+
+	case IOCTL_OCXLPMEM_EVENTFD:
+		rc = ioctl_eventfd(ocxlpmem,
+				   (struct ioctl_ocxlpmem_eventfd __user *)args);
+		break;
+
+	case IOCTL_OCXLPMEM_EVENT_CHECK:
+		rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
+		break;
 	}
 
 	return rc;
@@ -1109,6 +1181,148 @@ static void dump_error_log(struct ocxlpmem *ocxlpmem)
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
+			"Controller status is fatal, chi=0x%llx, going offline\n",
+			chi);
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
+/**
+ * ocxlpmem_setup_irq() - Set up the IRQs for the OpenCAPI Persistent Memory device
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+static int setup_irqs(struct ocxlpmem *ocxlpmem)
+{
+	int rc;
+	u64 irq_addr;
+
+	rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context,
+				&ocxlpmem->irq_id[0]);
+	if (rc)
+		return rc;
+
+	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0],
+				  imn0_handler, NULL, ocxlpmem);
+
+	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context,
+					 ocxlpmem->irq_id[0]);
+	if (!irq_addr)
+		return -EFAULT;
+
+	ocxlpmem->irq_addr[0] = ioremap(irq_addr, PAGE_SIZE);
+	if (!ocxlpmem->irq_addr[0])
+		return -ENODEV;
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
+	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1],
+				  imn1_handler, NULL, ocxlpmem);
+	if (rc)
+		goto out_irq0;
+
+	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context,
+					 ocxlpmem->irq_id[1]);
+	if (!irq_addr) {
+		rc = -EFAULT;
+		goto out_irq0;
+	}
+
+	ocxlpmem->irq_addr[1] = ioremap(irq_addr, PAGE_SIZE);
+	if (!ocxlpmem->irq_addr[1]) {
+		rc = -ENODEV;
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
+				    GLOBAL_MMIO_CHI_ELA |
+				    GLOBAL_MMIO_CHI_CDA |
+				    GLOBAL_MMIO_CHI_CFFS |
+				    GLOBAL_MMIO_CHI_CHFS);
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
  * This is important as it enables templates higher than 0 across all other
@@ -1212,6 +1426,12 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	rc = setup_irqs(ocxlpmem);
+	if (rc) {
+		dev_err(&pdev->dev, "Could not set up OCXL IRQs\n");
+		goto err;
+	}
+
 	rc = setup_command_metadata(ocxlpmem);
 	if (rc) {
 		dev_err(&pdev->dev, "Could not read command metadata\n");
diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index ee3bd651f254..01721596f982 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -106,6 +106,9 @@ struct ocxlpmem {
 	struct pci_dev *pdev;
 	struct cdev cdev;
 	struct ocxl_fn *ocxl_fn;
+#define SCM_IRQ_COUNT 2
+	int irq_id[SCM_IRQ_COUNT];
+	void __iomem *irq_addr[SCM_IRQ_COUNT];
 	struct nd_interleave_set nd_set;
 	struct nvdimm_bus_descriptor bus_desc;
 	struct nvdimm_bus *nvdimm_bus;
@@ -117,6 +120,7 @@ struct ocxlpmem {
 	struct nd_region *nd_region;
 	char fw_version[8 + 1];
 	u32 timeouts[ADMIN_COMMAND_MAX + 1];
+	struct eventfd_ctx *ev_ctx;
 	u32 max_controller_dump_size;
 	u16 scm_revision; // major/minor
 	u8 readiness_timeout;  /* The worst case time (in seconds) that the host
diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
index ca3a7098fa9d..d573bd307e35 100644
--- a/include/uapi/nvdimm/ocxlpmem.h
+++ b/include/uapi/nvdimm/ocxlpmem.h
@@ -71,6 +71,16 @@ struct ioctl_ocxlpmem_controller_stats {
 	__u64 fast_write_count;
 };
 
+struct ioctl_ocxlpmem_eventfd {
+	__s32 eventfd;
+	__u32 reserved;
+};
+
+#define IOCTL_OCXLPMEM_EVENT_CONTROLLER_DUMP_AVAILABLE	(1ULL << (0))
+#define IOCTL_OCXLPMEM_EVENT_ERROR_LOG_AVAILABLE	(1ULL << (1))
+#define IOCTL_OCXLPMEM_EVENT_HARDWARE_FATAL		(1ULL << (2))
+#define IOCTL_OCXLPMEM_EVENT_FIRMWARE_FATAL		(1ULL << (3))
+
 /* ioctl numbers */
 #define OCXLPMEM_MAGIC 0xCA
 /* OpenCAPI Persistent memory devices */
@@ -79,5 +89,7 @@ struct ioctl_ocxlpmem_controller_stats {
 #define IOCTL_OCXLPMEM_CONTROLLER_DUMP_DATA		_IOWR(OCXLPMEM_MAGIC, 0x32, struct ioctl_ocxlpmem_controller_dump_data)
 #define IOCTL_OCXLPMEM_CONTROLLER_DUMP_COMPLETE		_IO(OCXLPMEM_MAGIC, 0x33)
 #define IOCTL_OCXLPMEM_CONTROLLER_STATS			_IO(OCXLPMEM_MAGIC, 0x34)
+#define IOCTL_OCXLPMEM_EVENTFD				_IOW(OCXLPMEM_MAGIC, 0x35, struct ioctl_ocxlpmem_eventfd)
+#define IOCTL_OCXLPMEM_EVENT_CHECK			_IOR(OCXLPMEM_MAGIC, 0x36, __u64)
 
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

