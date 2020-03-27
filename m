Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD219742A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:59:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMHc4ZL2zDqcm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:59:56 +1100 (AEDT)
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
 header.s=201810a header.b=QzIshqlF; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7h39yPzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:53:04 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 1A36B2DC685C;
 Mon, 30 Mar 2020 16:52:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547571;
 bh=7micxHdia2GvvQ4mY81c4jBHOqLOZ0TeAcVaPQleunM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QzIshqlFp53qA4DB8IAUutZabSbcugvEaXNKxzsAZpWDALJWJPENQ0mvFoELV93rV
 xBDyaQhfw6Fw/7rbXS8HW2uZrWtaFnR2MvhNnl6jlQdn02p7u/PmP6ztacNKbuPyu9
 85tmlez/p2Zxt6TIwBFgAqzZRWTRiMnUh4iIZthtCkmm6j6qHrQe0olItNDpyXKcuu
 yrr563UM5DgGMo6LV7xzIIBif4ulFgC+/HkkjRqErrlhMI7zkwkMcxgPJBNiKUJris
 O3eIA6Pue08VWVHyK7Rqs/DxlrIVWcyA5LmzmtJO8eECSw88MVxEtfzv905BcPf3kH
 cMJ/o5fgzi/txiWRyh4RECCqzSOxZASTGF+B4aKQY9yDgE8tWr1RSDdkAgN9l5T7gK
 XufI3qOWi3HWntScxvoGIljl4WlGsy2jHNnAP16md7cjStgYPxE+MIOngRuFz9G+ot
 B0ZpigPUtr4kS4a5Zk/lekbvhIphRoTyFEEg27ngbAd4+R0Pdpi/03ray/974q6DRP
 oj9yVUBjNPWt7kNYNnilPCHMODV6tOeY6nPwnd/5fUVYpIYO/0G0qRYicw3MoB+cMo
 WNBBCFdNMn/eXciPsYoJgPiHCgAWonEXwlOPPECDtSKn/8ZevQqjdlygOvDl330WrX
 giiKa7eoY/kFQHdeCMxIcNVE=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Ax045934;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 24/25] nvdimm/ocxl: Expose the serial number & firmware
 version in sysfs
Date: Fri, 27 Mar 2020 18:12:01 +1100
Message-Id: <20200327071202.2159885-25-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
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

This patch exposes the serial number & firmware version in sysfs,
which will be used by ndctl in userspace to help users identify
the device.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/main.c | 42 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index 92b4389e8cbb..1f422f0d51ef 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -235,6 +235,43 @@ static int reserve_metadata(struct ocxlpmem *ocxlpmem,
 	return 0;
 }
 
+static ssize_t serial_show(struct device *device, struct device_attribute *attr,
+			   char *buf)
+{
+	struct nvdimm *nvdimm = to_nvdimm(device);
+	struct ocxlpmem *ocxlpmem = nvdimm_provider_data(nvdimm);
+	const struct ocxl_fn_config *fn_config = ocxl_function_config(ocxlpmem->ocxl_fn);
+
+	return scnprintf(buf, PAGE_SIZE, "%llu\n", fn_config->serial);
+}
+static DEVICE_ATTR_RO(serial);
+
+static ssize_t fw_version_show(struct device *device,
+			       struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *nvdimm = to_nvdimm(device);
+	struct ocxlpmem *ocxlpmem = nvdimm_provider_data(nvdimm);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", ocxlpmem->fw_version);
+}
+static DEVICE_ATTR_RO(fw_version);
+
+static struct attribute *ocxl_pmem_attrs[] = {
+	&dev_attr_serial.attr,
+	&dev_attr_fw_version.attr,
+	NULL,
+};
+
+static const struct attribute_group ocxl_pmem_attribute_group = {
+	.name = "ocxlpmem",
+	.attrs = ocxl_pmem_attrs,
+};
+
+static const struct attribute_group *ocxl_pmem_dimm_attribute_groups[] = {
+	&ocxl_pmem_attribute_group,
+	NULL,
+};
+
 /**
  * register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
  * @ocxlpmem: the device metadata
@@ -291,8 +328,9 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
 
 	snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
 	nd_mapping_desc.nvdimm = nvdimm_create(ocxlpmem->nvdimm_bus, ocxlpmem,
-					       NULL, nvdimm_flags,
-					       nvdimm_cmd_mask, 0, NULL);
+					       ocxl_pmem_dimm_attribute_groups,
+					       nvdimm_flags, nvdimm_cmd_mask, 0,
+					       NULL);
 	if (!nd_mapping_desc.nvdimm)
 		return -ENOMEM;
 
-- 
2.24.1

