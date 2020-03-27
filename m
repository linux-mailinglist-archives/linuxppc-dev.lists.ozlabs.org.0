Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A268196AAE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 04:33:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qflP6zQ7zDqHj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 13:33:05 +1100 (AEDT)
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
 header.s=201810a header.b=fvbnSejt; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48qfdY2gNmzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 13:27:59 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id EB3472DC6834;
 Fri, 27 Mar 2020 18:12:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585293142;
 bh=inrMR42ADZy1WNP4o1RXdEGSTOHSv7zVqzMowRo0hwA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fvbnSejt9QKrOXK21Vhhf5qPVmU6c3uisBfNLm1Wj2yoYsJBcgk7zYHbmCuRoR46v
 argMRyl7VugKyct1EIjELvdNG5xLWmVf6kmXgg9UXhZFOu+tDwmuAjb6U9id4WwXrG
 hIuujDU9qh3YYuhXSU7NMD9YnQVSxc4fzKG5p6OVh+70ri7BwAOPVuj6weise2ZEi4
 fGbNI78NO99yV0ijEoDCM0bMQpygNkk80e1TMqrEByDMe6w8RS8LAkFQh26KkH7mkj
 8rV6cyjxk2kTynoAKMJyS2DempRxkb90KiKmPbUOWZjpmM9PWG3P8u8Orcu3J4jSPm
 lvsb5bbKlztRdCpYRw4FiY0vAQcLK+nWt96vvQlzeTZ5Y76IKAsGsmv+H1zaz5dJqH
 x3gbKZc7MEPS9176j7um/5VUdJZv+Jo1QPFpGsBduhbY/6dcl6n+wH1vQSFIsRblQF
 lf4L3ROfB4VKVKiS0n4ethjH2kn42F2uD24Go9+NxOGT1jo2VRyl1EzWDyRIhcWSCw
 OGDXteEqG1a9F+E9jAz5YpAa7Y132/6QZJYkK94wmmFsezphVL1uGMU1vQf4O9QwyY
 D+Gif/x4De7Rx5zTgpz946jJHSr9MAwSOckxaVoLJSTo5mcW66RpJhFRaKJAqihjow
 B0cAcJITzqr7CiapV6y/2kOI=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Am045934;
 Fri, 27 Mar 2020 18:12:17 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 13/25] nvdimm/ocxl: Read the capability registers & wait
 for device ready
Date: Fri, 27 Mar 2020 18:11:50 +1100
Message-Id: <20200327071202.2159885-14-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:17 +1100 (AEDT)
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

This patch reads timeouts & firmware version from the controller, and
uses those timeouts to wait for the controller to report that it is ready
before handing the memory over to libnvdimm.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/Makefile            |  2 +-
 drivers/nvdimm/ocxl/main.c              | 85 +++++++++++++++++++++++++
 drivers/nvdimm/ocxl/ocxlpmem.h          | 29 +++++++++
 drivers/nvdimm/ocxl/ocxlpmem_internal.c | 19 ++++++
 4 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nvdimm/ocxl/ocxlpmem_internal.c

diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
index e0e8ade1987a..bab97082e062 100644
--- a/drivers/nvdimm/ocxl/Makefile
+++ b/drivers/nvdimm/ocxl/Makefile
@@ -4,4 +4,4 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
 
 obj-$(CONFIG_OCXL_PMEM) += ocxlpmem.o
 
-ocxlpmem-y := main.o
\ No newline at end of file
+ocxlpmem-y := main.o ocxlpmem_internal.o
diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index c0066fedf9cc..be76acd33d74 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <misc/ocxl.h>
+#include <linux/delay.h>
 #include <linux/ndctl.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
@@ -327,6 +328,50 @@ static void remove(struct pci_dev *pdev)
 	}
 }
 
+/**
+ * read_device_metadata() - Retrieve config information from the AFU and save it for future use
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+static int read_device_metadata(struct ocxlpmem *ocxlpmem)
+{
+	u64 val;
+	int rc;
+
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CCAP0,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	ocxlpmem->scm_revision = val & 0xFFFF;
+	ocxlpmem->read_latency = (val >> 32) & 0xFFFF;
+	ocxlpmem->readiness_timeout = (val >> 48) & 0x0F;
+	ocxlpmem->memory_available_timeout = val >> 52;
+
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CCAP1,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	ocxlpmem->max_controller_dump_size = val & 0xFFFFFFFF;
+
+	// Extract firmware version text
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_FWVER,
+				     OCXL_HOST_ENDIAN,
+				     (u64 *)ocxlpmem->fw_version);
+	if (rc)
+		return rc;
+
+	ocxlpmem->fw_version[8] = '\0';
+
+	dev_info(&ocxlpmem->dev,
+		 "Firmware version '%s' SCM revision %d:%d\n",
+		 ocxlpmem->fw_version, ocxlpmem->scm_revision >> 4,
+		 ocxlpmem->scm_revision & 0x0F);
+
+	return 0;
+}
+
 /**
  * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
  * This is important as it enables templates higher than 0 across all other
@@ -359,6 +404,9 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct ocxlpmem *ocxlpmem;
 	int rc;
+	u64 chi;
+	u16 elapsed, timeout;
+	bool ready = false;
 
 	if (PCI_FUNC(pdev->devfn) == 0)
 		return probe_function0(pdev);
@@ -413,6 +461,43 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	rc = read_device_metadata(ocxlpmem);
+	if (rc) {
+		dev_err(&pdev->dev, "Could not read metadata\n");
+		goto err;
+	}
+
+	elapsed = 0;
+	timeout = ocxlpmem->readiness_timeout +
+		  ocxlpmem->memory_available_timeout;
+
+	while (true) {
+		rc = ocxlpmem_chi(ocxlpmem, &chi);
+		ready = (chi & (GLOBAL_MMIO_CHI_CRDY | GLOBAL_MMIO_CHI_MA)) ==
+			(GLOBAL_MMIO_CHI_CRDY | GLOBAL_MMIO_CHI_MA);
+
+		if (ready)
+			break;
+
+		if (elapsed++ > timeout) {
+			dev_err(&ocxlpmem->dev,
+				"OpenCAPI Persistent Memory ready timeout.\n");
+
+			if (!(chi & GLOBAL_MMIO_CHI_CRDY))
+				dev_err(&ocxlpmem->dev,
+					"controller is not ready.\n");
+
+			if (!(chi & GLOBAL_MMIO_CHI_MA))
+				dev_err(&ocxlpmem->dev,
+					"controller does not have memory available.\n");
+
+			rc = -ENXIO;
+			goto err;
+		}
+
+		msleep(1000);
+	}
+
 	rc = register_lpc_mem(ocxlpmem);
 	if (rc) {
 		dev_err(&pdev->dev,
diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index 322387873b4b..3eadbe19f6d0 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -93,4 +93,33 @@ struct ocxlpmem {
 	void *metadata_addr;
 	struct resource pmem_res;
 	struct nd_region *nd_region;
+	char fw_version[8 + 1];
+
+	u32 max_controller_dump_size;
+	u16 scm_revision; // major/minor
+	u8 readiness_timeout;  /* The worst case time (in seconds) that the host
+				* shall wait for the controller to become
+				* operational following a reset (CHI.CRDY).
+				*/
+	u8 memory_available_timeout;  /* The worst case time (in seconds) that
+				       * the host shall wait for memory to
+				       * become available following a reset
+				       * (CHI.MA).
+				       */
+
+	u16 read_latency; /* The nominal measure of latency (in nanoseconds)
+			   * associated with an unassisted read of a memory
+			   * block.
+			   * This represents the capability of the raw media
+			   * technology without assistance
+			   */
 };
+
+/**
+ * ocxlpmem_chi() - Get the value of the CHI register
+ * @ocxlpmem: the device metadata
+ * @chi: returns the CHI value
+ *
+ * Returns 0 on success, negative on error
+ */
+int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi);
diff --git a/drivers/nvdimm/ocxl/ocxlpmem_internal.c b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
new file mode 100644
index 000000000000..5578169b7515
--- /dev/null
+++ b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2020 IBM Corp.
+
+#include <misc/ocxl.h>
+#include <linux/delay.h>
+#include "ocxlpmem.h"
+
+int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi)
+{
+	u64 val;
+	int rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHI,
+					 OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	*chi = val;
+
+	return 0;
+}
-- 
2.24.1

