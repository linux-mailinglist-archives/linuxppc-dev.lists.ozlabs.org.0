Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2903166E10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 04:49:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NyBL62tfzDq8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 14:49:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NxkJ7042zDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:28:24 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3KPVO091353
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:22 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8uc09tgx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:28:22 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:28:19 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:28:11 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L3SAf252232290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3A552051;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 31D4E5204F;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 06839A03E7;
 Fri, 21 Feb 2020 14:28:04 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 24/27] powerpc/powernv/pmem: Expose SMART data via ndctl
Date: Fri, 21 Feb 2020 14:27:17 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-4275-0000-0000-000003A3FE65
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-4276-0000-0000-000038B80C7B
Message-Id: <20200221032720.33893-25-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=857
 spamscore=0 suspectscore=1 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210020
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

This patch retrieves proprietary formatted SMART data and makes it
available via ndctl. A later contribution will be made to ndctl to
parse this data.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/platforms/powernv/pmem/ocxl.c    | 128 ++++++++++++++++++
 .../platforms/powernv/pmem/ocxl_internal.h    |  18 +++
 include/uapi/linux/ndctl.h                    |   1 +
 3 files changed, 147 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
index d4ce5e9e0521..5cd1b6d78dd6 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
@@ -81,6 +81,129 @@ static int ndctl_config_size(struct nd_cmd_get_config_size *command)
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
+			"Bad data identifier for smart data, expected 'SM', got '%-.*s'\n",
+			2, (char *)&data_identifier);
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
+	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_SMART);
+	if (rc)
+		goto out;
+
+	rc = admin_command_execute(ocxlpmem);
+	if (rc)
+		goto out;
+
+	rc = admin_command_complete_timeout(ocxlpmem, ADMIN_COMMAND_SMART);
+	if (rc < 0) {
+		dev_err(&ocxlpmem->dev, "SMART timeout\n");
+		goto out;
+	}
+
+	rc = admin_response(ocxlpmem);
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
+	pkg->nd_fw_size = length;
+
+	length = min(length, pkg->nd_size_out); // bytes
+	out = (struct nd_ocxl_smart *)pkg->nd_payload;
+	// Each SMART attribute is 2 * 64 bits
+	out->count = length / (2 * sizeof(u64)); // attributes
+
+	for (i = 0; i < length; i += sizeof(u64)) {
+		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+					     ocxlpmem->admin_command.data_offset + sizeof(u64) + i,
+					     OCXL_LITTLE_ENDIAN,
+					     &out->attribs[i/sizeof(u64)]);
+		if (rc)
+			goto out;
+	}
+
+	rc = admin_response_handled(ocxlpmem);
+	if (rc)
+		goto out;
+
+	rc = 0;
+	goto out;
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
+static int ndctl_call(struct ocxlpmem *ocxlpmem, void *buf, unsigned int buf_len)
+{
+	struct nd_cmd_pkg *pkg = buf;
+
+	if (buf_len < sizeof(struct nd_cmd_pkg)) {
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL size=%u\n", buf_len);
+		return -EINVAL;
+	}
+
+	if (pkg->nd_family != NVDIMM_FAMILY_OCXL) {
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL family=0x%llx\n", pkg->nd_family);
+		return -EINVAL;
+	}
+
+	switch (pkg->nd_command) {
+	case ND_CMD_OCXL_SMART:
+		ndctl_smart(ocxlpmem, pkg);
+		break;
+
+	default:
+		dev_err(&ocxlpmem->dev, "Invalid ND_CALL command=0x%llx\n", pkg->nd_command);
+		return -EINVAL;
+	}
+
+
+	return 0;
+}
+
 static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		 struct nvdimm *nvdimm,
 		 unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
@@ -88,6 +211,10 @@ static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	struct ocxlpmem *ocxlpmem = container_of(nd_desc, struct ocxlpmem, bus_desc);
 
 	switch (cmd) {
+	case ND_CMD_CALL:
+		*cmd_rc = ndctl_call(ocxlpmem, buf, buf_len);
+		return 0;
+
 	case ND_CMD_GET_CONFIG_SIZE:
 		*cmd_rc = ndctl_config_size(buf);
 		return 0;
@@ -171,6 +298,7 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
 	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
+	set_bit(ND_CMD_CALL, &nvdimm_cmd_mask);
 
 	set_bit(NDD_ALIASING, &nvdimm_flags);
 
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
index 927690f4888f..0eb7a35d24ae 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
@@ -7,6 +7,7 @@
 #include <linux/libnvdimm.h>
 #include <uapi/nvdimm/ocxl-pmem.h>
 #include <linux/mm.h>
+#include <linux/ndctl.h>
 
 #define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
 #define DEFAULT_TIMEOUT 100
@@ -98,6 +99,23 @@ struct ocxlpmem_function0 {
 	struct ocxl_fn *ocxl_fn;
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

