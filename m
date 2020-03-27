Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD592198FE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:07:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s3PQ2QSPzDqts
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:07:22 +1100 (AEDT)
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
 header.s=201810a header.b=NrRTkA2b; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s3D94dtrzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:59:21 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 23A0E2DC6861;
 Mon, 30 Mar 2020 16:52:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547576;
 bh=8s7da4KbOpaV4mqdxyxNi6aCXQRjcGL9fg5XH8aq39A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NrRTkA2bxZwFMeoCf0Wr6Odf6o65lo0QM+ThRM66hf/7Tb+pvtJVuQxJN394NTysC
 VgilHFKK5xR1f6lDBP0QlOXi2EJtvYeXpa6JFreVlZ03HY/0O6eVn0cvRH8pvqRpyo
 cdzWDRkWYXg1MPX4tN1fXYDXGdiYygmqECTUp+0YnDPD6LfGx+xx+gategBGRubdAL
 L0JRYtfskZ/D5Zw0QaK/Tz53JgYEGDdF037VYvOeTQp7vuawto13Te3Rm7pe7J0n3j
 H6iwZUTYry2yNKsgzOEM59Q5V7lk5UymbYbT6X5deJlY236MnLO6jpfeBIjPT8WeYG
 zbyXaR3DorudKtfRcOMCYngpMoCzEzYlFjON6mwdALYIvaxuWIpUi0eUv4wErujoca
 ev2YxG6LJtlTTbFLoAYDap+my1DyfAet2uXwgjOsEAogxT/DBD0646Y0yGqEn2L3J6
 hinFHFG49vIm36L/NCftTmxqx7+9UfvO5s+VkIilw2q9UHK+gBNkJiRQVDG1yFm5Rn
 co+eZdxegSRaD39VqYwEY+iKgvu/Jb1w0cb0ho+kiB03px14BmTNlQk4Tof0LqmFNk
 7tVG7Vgv/QEAcjH8bPZwH8sZw7WayGyD+FfKrWAwVv7XeAsc2mBHBKPSE++URXQ1Nz
 MdXl8DGDe8LMBnwkv+CQ57LQ=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Aw045934;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 23/25] nvdimm/ocxl: Expose SMART data via ndctl
Date: Fri, 27 Mar 2020 18:12:00 +1100
Message-Id: <20200327071202.2159885-24-alastair@d-silva.org>
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

This patch retrieves proprietary formatted SMART data and makes it
available via ndctl. A later contribution will be made to ndctl to
parse this data.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/main.c     | 113 +++++++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/ocxlpmem.h |  18 ++++++
 include/uapi/linux/ndctl.h     |   1 +
 3 files changed, 132 insertions(+)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index 2811bf7efbab..92b4389e8cbb 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -82,6 +82,114 @@ static int ndctl_config_size(struct nd_cmd_get_config_size *command)
 	return 0;
 }
 
+/**
+ * smart_header_parse() - Parse the first 64 bits of the SMART admin command response
+ * @ocxlpmem: the device metadata
+ * @length: out, returns the number of bytes in the response (excluding the 64 bit header)
+ */
+static int smart_header_parse(struct ocxlpmem *ocxlpmem, u32 *length)
+{
+	int rc;
+	u64 val;
+
+	u16 data_identifier;
+	u32 data_length;
+
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+				     ocxlpmem->admin_command.data_offset,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	data_identifier = val >> 48;
+	data_length = val & 0xFFFFFFFF;
+
+	if (data_identifier != 0x534D) { // 'SM'
+		dev_err(&ocxlpmem->dev,
+			"Bad data identifier for smart data, expected 'SM', got '%2s'\n",
+			(char *)&data_identifier);
+		return -EINVAL;
+	}
+
+	*length = data_length;
+	return 0;
+}
+
+static int ndctl_smart(struct ocxlpmem *ocxlpmem, struct nd_cmd_pkg *pkg)
+{
+	u32 length, i;
+	struct nd_ocxl_smart *out;
+	int rc;
+
+	mutex_lock(&ocxlpmem->admin_command.lock);
+
+	rc = admin_command_execute(ocxlpmem, ADMIN_COMMAND_SMART);
+	if (rc < 0)
+		goto out;
+	if (rc != STATUS_SUCCESS) {
+		warn_status(ocxlpmem, "Unexpected status from SMART", rc);
+		goto out;
+	}
+
+	rc = smart_header_parse(ocxlpmem, &length);
+	if (rc)
+		goto out;
+
+	pkg->nd_fw_size = length + offsetof(struct nd_ocxl_smart, attribs);
+
+	length = min(length, (u32)(pkg->nd_size_out -
+		     offsetof(struct nd_ocxl_smart, attribs))); // bytes
+	out = (struct nd_ocxl_smart *)pkg->nd_payload;
+	// Each SMART attribute is 2 * 64 bits
+	out->count = length / (2 * sizeof(u64)); // attributes
+
+	for (i = 0; i < length; i += sizeof(u64)) {
+		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+					     ocxlpmem->admin_command.data_offset +
+					     sizeof(u64) + i,
+					     OCXL_LITTLE_ENDIAN,
+					     &out->attribs[i / sizeof(u64)]);
+		if (rc)
+			goto out;
+	}
+
+	rc = admin_response_handled(ocxlpmem);
+	if (rc)
+		goto out;
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
+static int ndctl_call(struct ocxlpmem *ocxlpmem, void *buf,
+		      unsigned int buf_len)
+{
+	struct nd_cmd_pkg *pkg = buf;
+
+	if (buf_len < sizeof(struct nd_cmd_pkg)) {
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL size=%u\n", buf_len);
+		return -EINVAL;
+	}
+
+	if (pkg->nd_family != NVDIMM_FAMILY_OCXL) {
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL family=0x%llx\n",
+			pkg->nd_family);
+		return -EINVAL;
+	}
+
+	switch (pkg->nd_command) {
+	case ND_CMD_OCXL_SMART:
+		return ndctl_smart(ocxlpmem, pkg);
+	default:
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL command=0x%llx\n",
+			pkg->nd_command);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		 struct nvdimm *nvdimm,
 		 unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
@@ -90,6 +198,10 @@ static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
 						 struct ocxlpmem, bus_desc);
 
 	switch (cmd) {
+	case ND_CMD_CALL:
+		*cmd_rc = ndctl_call(ocxlpmem, buf, buf_len);
+		return 0;
+
 	case ND_CMD_GET_CONFIG_SIZE:
 		*cmd_rc = ndctl_config_size(buf);
 		return 0;
@@ -173,6 +285,7 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
 	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
+	set_bit(ND_CMD_CALL, &nvdimm_cmd_mask);
 
 	set_bit(NDD_ALIASING, &nvdimm_flags);
 
diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index c8794e7775ec..ebaf11692c09 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -6,6 +6,7 @@
 #include <misc/ocxl.h>
 #include <linux/libnvdimm.h>
 #include <linux/mm.h>
+#include <linux/ndctl.h>
 
 #define LABEL_AREA_SIZE	BIT_ULL(PA_SECTION_SHIFT)
 #define DEFAULT_TIMEOUT 100
@@ -101,6 +102,23 @@ struct command_metadata {
 	u8 op_code;
 };
 
+struct nd_ocxl_smart {
+	__u8 count;
+	__u8 reserved[7];
+	__u64 attribs[0];
+} __packed;
+
+struct nd_pkg_ocxl {
+	struct nd_cmd_pkg gen;
+	union {
+		struct nd_ocxl_smart smart;
+	};
+};
+
+enum nd_cmd_ocxl {
+	ND_CMD_OCXL_SMART = 1,
+};
+
 struct ocxlpmem {
 	struct device dev;
 	struct pci_dev *pdev;
diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
index de5d90212409..2885052e7f40 100644
--- a/include/uapi/linux/ndctl.h
+++ b/include/uapi/linux/ndctl.h
@@ -244,6 +244,7 @@ struct nd_cmd_pkg {
 #define NVDIMM_FAMILY_HPE2 2
 #define NVDIMM_FAMILY_MSFT 3
 #define NVDIMM_FAMILY_HYPERV 4
+#define NVDIMM_FAMILY_OCXL 6
 
 #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
 					struct nd_cmd_pkg)
-- 
2.24.1

