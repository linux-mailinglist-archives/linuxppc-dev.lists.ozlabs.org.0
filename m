Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8010F601
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 05:00:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RpCm71R5zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 15:00:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RnyS2CGWzDqP8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 14:48:31 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB33kk3x006781
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 22:48:29 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6cy9sdd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 22:48:29 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Dec 2019 03:48:25 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 03:48:18 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB33mHb640894600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 03:48:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF9F14C04A;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14F4D4C04E;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 02A3AA03DE;
 Tue,  3 Dec 2019 14:48:13 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 12/27] nvdimm/ocxl: Read the capability registers & wait
 for device ready
Date: Tue,  3 Dec 2019 14:46:40 +1100
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203034655.51561-1-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120303-0008-0000-0000-0000033C0FDD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120303-0009-0000-0000-00004A5B289B
Message-Id: <20191203034655.51561-13-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=1 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030032
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
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
 drivers/nvdimm/ocxl/Makefile       |  2 +-
 drivers/nvdimm/ocxl/scm.c          | 84 ++++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/scm_internal.c | 19 +++++++
 drivers/nvdimm/ocxl/scm_internal.h | 24 +++++++++
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nvdimm/ocxl/scm_internal.c

diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
index 74a1bd98848e..9b6e31f0eb3e 100644
--- a/drivers/nvdimm/ocxl/Makefile
+++ b/drivers/nvdimm/ocxl/Makefile
@@ -4,4 +4,4 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
 
 obj-$(CONFIG_OCXL_SCM) += ocxlscm.o
 
-ocxlscm-y := scm.o
+ocxlscm-y := scm.o scm_internal.o
diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
index 571058a9e7b8..8088f65c289e 100644
--- a/drivers/nvdimm/ocxl/scm.c
+++ b/drivers/nvdimm/ocxl/scm.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <misc/ocxl.h>
+#include <linux/delay.h>
 #include <linux/ndctl.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
@@ -266,6 +267,30 @@ static int scm_register_lpc_mem(struct scm_data *scm_data)
 	return 0;
 }
 
+/**
+ * scm_is_usable() - Is a controller usable?
+ * @scm_data: a pointer to the SCM device data
+ * Return: true if the controller is usable
+ */
+static bool scm_is_usable(const struct scm_data *scm_data)
+{
+	u64 chi = 0;
+	int rc = scm_chi(scm_data, &chi);
+
+	if (!(chi & GLOBAL_MMIO_CHI_CRDY)) {
+		dev_err(&scm_data->dev, "SCM controller is not ready.\n");
+		return false;
+	}
+
+	if (!(chi & GLOBAL_MMIO_CHI_MA)) {
+		dev_err(&scm_data->dev,
+			"SCM controller does not have memory available.\n");
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * allocate_scm_minor() - Allocate a minor number to use for an SCM device
  * @scm_data: The SCM device to associate the minor with
@@ -380,6 +405,48 @@ static void scm_remove(struct pci_dev *pdev)
 	}
 }
 
+/**
+ * read_device_metadata() - Retrieve config information from the AFU and save it for future use
+ * @scm_data: the SCM metadata
+ * Return: 0 on success, negative on failure
+ */
+static int read_device_metadata(struct scm_data *scm_data)
+{
+	u64 val;
+	int rc;
+
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP0,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	scm_data->scm_revision = val & 0xFFFF;
+	scm_data->read_latency = (val >> 32) & 0xFF;
+	scm_data->readiness_timeout = (val >> 48) & 0xff;
+	scm_data->memory_available_timeout = val >> 52;
+
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP1,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	scm_data->max_controller_dump_size = val & 0xFFFFFFFF;
+
+	// Extract firmware version text
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_FWVER,
+				     OCXL_HOST_ENDIAN, (u64 *)scm_data->fw_version);
+	if (rc)
+		return rc;
+
+	scm_data->fw_version[8] = '\0';
+
+	dev_info(&scm_data->dev,
+		 "Firmware version '%s' SCM revision %d:%d\n", scm_data->fw_version,
+		 scm_data->scm_revision >> 4, scm_data->scm_revision & 0x0F);
+
+	return 0;
+}
+
 /**
  * scm_probe_function_0 - Set up function 0 for an OpenCAPI Storage Class Memory device
  * This is important as it enables templates higher than 0 across all other functions,
@@ -420,6 +487,8 @@ static int scm_probe_function_0(struct pci_dev *pdev)
 static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct scm_data *scm_data = NULL;
+	int elapsed;
+	u16 timeout;
 
 	if (PCI_FUNC(pdev->devfn) == 0)
 		return scm_probe_function_0(pdev);
@@ -469,6 +538,21 @@ static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	if (read_device_metadata(scm_data)) {
+		dev_err(&pdev->dev, "Could not read SCM device metadata\n");
+		goto err;
+	}
+
+	elapsed = 0;
+	timeout = scm_data->readiness_timeout + scm_data->memory_available_timeout;
+	while (!scm_is_usable(scm_data)) {
+		if (elapsed++ > timeout) {
+			dev_warn(&scm_data->dev, "SCM ready timeout.\n");
+			goto err;
+		}
+
+		msleep(1000);
+	}
 	if (scm_register_lpc_mem(scm_data)) {
 		dev_err(&pdev->dev, "Could not register OCXL SCM memory with libnvdimm\n");
 		goto err;
diff --git a/drivers/nvdimm/ocxl/scm_internal.c b/drivers/nvdimm/ocxl/scm_internal.c
new file mode 100644
index 000000000000..72d3c0e7d846
--- /dev/null
+++ b/drivers/nvdimm/ocxl/scm_internal.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2019 IBM Corp.
+
+#include <misc/ocxl.h>
+#include <linux/delay.h>
+#include "scm_internal.h"
+
+int scm_chi(const struct scm_data *scm_data, u64 *chi)
+{
+	u64 val;
+	int rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CHI,
+					 OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	*chi = val;
+
+	return 0;
+}
diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
index d6ab361f5de9..584450f55e30 100644
--- a/drivers/nvdimm/ocxl/scm_internal.h
+++ b/drivers/nvdimm/ocxl/scm_internal.h
@@ -97,4 +97,28 @@ struct scm_data {
 	void *metadata_addr;
 	struct resource scm_res;
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
+ * scm_chi() - Get the value of the CHI register
+ * @scm_data: The SCM metadata
+ * @chi: returns the CHI value
+ *
+ * Returns 0 on success, negative on error
+ */
+int scm_chi(const struct scm_data *scm_data, u64 *chi);
-- 
2.23.0

