Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD756166E0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 04:47:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ny7p6KT7zDqPn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 14:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NxkJ6SN1zDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:28:24 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3JmiV013306
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:22 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8uc21hjp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:22 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:28:18 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:28:10 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L3S9lD55246944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC3FD52052;
 Fri, 21 Feb 2020 03:28:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 213D552050;
 Fri, 21 Feb 2020 03:28:09 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 52EA8A03CF;
 Fri, 21 Feb 2020 14:28:03 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 13/27] powerpc/powernv/pmem: Read the capability registers
 & wait for device ready
Date: Fri, 21 Feb 2020 14:27:06 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-0020-0000-0000-000003AC2211
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-0021-0000-0000-000022042A33
Message-Id: <20200221032720.33893-14-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=1 malwarescore=0
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

This patch reads timeouts & firmware version from the controller, and
uses those timeouts to wait for the controller to report that it is ready
before handing the memory over to libnvdimm.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/platforms/powernv/pmem/Makefile  |  2 +-
 arch/powerpc/platforms/powernv/pmem/ocxl.c    | 92 +++++++++++++++++++
 .../platforms/powernv/pmem/ocxl_internal.c    | 19 ++++
 .../platforms/powernv/pmem/ocxl_internal.h    | 24 +++++
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/powernv/pmem/ocxl_internal.c

diff --git a/arch/powerpc/platforms/powernv/pmem/Makefile b/arch/powerpc/platforms/powernv/pmem/Makefile
index 1c55c4193175..4ceda25907d4 100644
--- a/arch/powerpc/platforms/powernv/pmem/Makefile
+++ b/arch/powerpc/platforms/powernv/pmem/Makefile
@@ -4,4 +4,4 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
 
 obj-$(CONFIG_OCXL_PMEM) += ocxlpmem.o
 
-ocxlpmem-y := ocxl.o
+ocxlpmem-y := ocxl.o ocxl_internal.o
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
index 3c4eeb5dcc0f..431212c9f0cc 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <misc/ocxl.h>
+#include <linux/delay.h>
 #include <linux/ndctl.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
@@ -215,6 +216,36 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
 	return 0;
 }
 
+/**
+ * is_usable() - Is a controller usable?
+ * @ocxlpmem: the device metadata
+ * @verbose: True to log errors
+ * Return: true if the controller is usable
+ */
+static bool is_usable(const struct ocxlpmem *ocxlpmem, bool verbose)
+{
+	u64 chi = 0;
+	int rc = ocxlpmem_chi(ocxlpmem, &chi);
+
+	if (rc < 0)
+		return false;
+
+	if (!(chi & GLOBAL_MMIO_CHI_CRDY)) {
+		if (verbose)
+			dev_err(&ocxlpmem->dev, "controller is not ready.\n");
+		return false;
+	}
+
+	if (!(chi & GLOBAL_MMIO_CHI_MA)) {
+		if (verbose)
+			dev_err(&ocxlpmem->dev,
+				"controller does not have memory available.\n");
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
  * @ocxlpmem: the device metadata
@@ -328,6 +359,48 @@ static void ocxlpmem_remove(struct pci_dev *pdev)
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
+	ocxlpmem->read_latency = (val >> 32) & 0xFF;
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
+				     OCXL_HOST_ENDIAN, (u64 *)ocxlpmem->fw_version);
+	if (rc)
+		return rc;
+
+	ocxlpmem->fw_version[8] = '\0';
+
+	dev_info(&ocxlpmem->dev,
+		 "Firmware version '%s' SCM revision %d:%d\n", ocxlpmem->fw_version,
+		 ocxlpmem->scm_revision >> 4, ocxlpmem->scm_revision & 0x0F);
+
+	return 0;
+}
+
 /**
  * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
  * This is important as it enables templates higher than 0 across all other functions,
@@ -368,6 +441,7 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct ocxlpmem *ocxlpmem;
 	int rc;
+	u16 elapsed, timeout;
 
 	if (PCI_FUNC(pdev->devfn) == 0)
 		return probe_function0(pdev);
@@ -422,6 +496,24 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	if (read_device_metadata(ocxlpmem)) {
+		dev_err(&pdev->dev, "Could not read metadata\n");
+		goto err;
+	}
+
+	elapsed = 0;
+	timeout = ocxlpmem->readiness_timeout + ocxlpmem->memory_available_timeout;
+	while (!is_usable(ocxlpmem, false)) {
+		if (elapsed++ > timeout) {
+			dev_warn(&ocxlpmem->dev, "OpenCAPI Persistent Memory ready timeout.\n");
+			(void)is_usable(ocxlpmem, true);
+			rc = -ENXIO;
+			goto err;
+		}
+
+		msleep(1000);
+	}
+
 	rc = register_lpc_mem(ocxlpmem);
 	if (rc) {
 		dev_err(&pdev->dev, "Could not register OpenCAPI persistent memory with libnvdimm\n");
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c
new file mode 100644
index 000000000000..617ca943b1b8
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2019 IBM Corp.
+
+#include <misc/ocxl.h>
+#include <linux/delay.h>
+#include "ocxl_internal.h"
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
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
index 9cf3e42750e7..ba0301533d00 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
@@ -97,4 +97,28 @@ struct ocxlpmem {
 	void *metadata_addr;
 	struct resource pmem_res;
 	struct nd_region *nd_region;
+	char fw_version[8+1];
+
+	u32 max_controller_dump_size;
+	u16 scm_revision; // major/minor
+	u8 readiness_timeout;  /* The worst case time (in seconds) that the host shall
+				* wait for the controller to become operational following a reset (CHI.CRDY).
+				*/
+	u8 memory_available_timeout;   /* The worst case time (in seconds) that the host shall
+					* wait for memory to become available following a reset (CHI.MA).
+					*/
+
+	u16 read_latency; /* The nominal measure of latency (in nanoseconds)
+			   * associated with an unassisted read of a memory block.
+			   * This represents the capability of the raw media technology without assistance
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
-- 
2.24.1

