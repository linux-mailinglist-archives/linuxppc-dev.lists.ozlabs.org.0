Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67710F650
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 05:31:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RpwS6jY3zDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 15:31:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RnyV4F8JzDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 14:48:34 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB33kmXj083969
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 22:48:30 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6xb0p19-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 22:48:30 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Dec 2019 03:48:27 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 03:48:19 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB33mIIj24707220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 03:48:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC467AE051;
 Tue,  3 Dec 2019 03:48:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F3AEAE053;
 Tue,  3 Dec 2019 03:48:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 03:48:18 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A91CAA03EF;
 Tue,  3 Dec 2019 14:48:13 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 25/27] nvdimm/ocxl: Expose SMART data via ndctl
Date: Tue,  3 Dec 2019 14:46:53 +1100
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203034655.51561-1-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120303-0028-0000-0000-000003C3CC76
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120303-0029-0000-0000-00002486E434
Message-Id: <20191203034655.51561-26-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=1 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This patch retrieves proprietary formatted SMART data and makes it
available via ndctl. A later contribution will be made to ndctl to
parse this data.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/scm.c          | 156 +++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/scm_internal.h |  21 ++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
index 8deb7862793c..77b9e68870a3 100644
--- a/drivers/nvdimm/ocxl/scm.c
+++ b/drivers/nvdimm/ocxl/scm.c
@@ -94,6 +94,157 @@ static int scm_ndctl_config_size(struct nd_cmd_get_config_size *command)
 	return 0;
 }
 
+static int read_smart_attrib(struct scm_data *scm_data, u16 offset,
+			     struct scm_smart_attribs *attribs)
+{
+	u64 val;
+	int rc;
+	struct scm_smart_attrib *attrib;
+	u8 attrib_id;
+
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset, OCXL_LITTLE_ENDIAN,
+				     &val);
+	if (rc)
+		return rc;
+
+	attrib_id = (val >> 56) & 0xff;
+	switch (attrib_id) {
+	case SCM_SMART_ATTR_POWER_ON_HOURS:
+		attrib = &attribs->power_on_hours;
+		break;
+
+	case SCM_SMART_ATTR_TEMPERATURE:
+		attrib = &attribs->temperature;
+		break;
+
+	case SCM_SMART_ATTR_LIFE_REMAINING:
+		attrib = &attribs->life_remaining;
+		break;
+
+	default:
+		dev_warn(&scm_data->dev, "Unknown smart attrib '%d'", attrib_id);
+		return -ENOENT;
+	}
+
+	attrib->id = attrib_id;
+	attrib->attribute_flags = (val >> 40) & 0xffff;
+	attrib->current_val = (val >> 32) & 0xff;
+	attrib->threshold_val = (val >> 24) & 0xff;
+	attrib->worst_val = (val >> 16) & 0xff;
+
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset + 0x08,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	attrib->raw_val = val;
+
+	return 0;
+}
+
+/**
+ * scm_smart_header_parse() - Parse the first 64 bits of the SMART admin command response
+ * @scm_data: the SCM metadata
+ * @length: out, returns the number of bytes in the response (excluding the 64 bit header)
+ */
+static int scm_smart_header_parse(struct scm_data *scm_data, u32 *length)
+{
+	int rc;
+	u64 val;
+
+	u16 data_identifier;
+	u32 data_length;
+
+	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
+				     scm_data->admin_command.data_offset,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	data_identifier = val >> 48;
+	data_length = val & 0xFFFFFFFF;
+
+	if (data_identifier != 0x534D) {
+		dev_err(&scm_data->dev,
+			"Bad data identifier for smart data, expected 'SM', got '%-.*s'\n",
+			2, (char *)&data_identifier);
+		return -EINVAL;
+	}
+
+	*length = data_length;
+	return 0;
+}
+
+static int scm_smart_update(struct scm_data *scm_data)
+{
+	u32 length, i;
+	int rc;
+
+	mutex_lock(&scm_data->admin_command.lock);
+
+	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_SMART);
+	if (rc)
+		goto out;
+
+	rc = scm_admin_command_execute(scm_data);
+	if (rc)
+		goto out;
+
+	rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_SMART);
+	if (rc < 0) {
+		dev_err(&scm_data->dev, "SMART timeout\n");
+		goto out;
+	}
+
+	rc = scm_admin_response(scm_data);
+	if (rc < 0)
+		goto out;
+	if (rc != STATUS_SUCCESS) {
+		scm_warn_status(scm_data, "Unexpected status from SMART", rc);
+		goto out;
+	}
+
+	rc = scm_smart_header_parse(scm_data, &length);
+	if (rc)
+		goto out;
+
+	length /= 0x10; // Length now contains the number of attributes
+
+	for (i = 0; i < length; i++)
+		read_smart_attrib(scm_data,
+				  scm_data->admin_command.data_offset + 0x08 + i * 0x10,
+				  &scm_data->smart);
+
+	rc = scm_admin_response_handled(scm_data);
+	if (rc)
+		goto out;
+
+	rc = 0;
+	goto out;
+
+out:
+	mutex_unlock(&scm_data->admin_command.lock);
+	return rc;
+}
+
+static int scm_ndctl_smart(struct scm_data *scm_data, void *buf,
+			   unsigned int buf_len)
+{
+	int rc;
+
+	if (buf_len != sizeof(scm_data->smart))
+		return -EINVAL;
+
+	rc = scm_smart_update(scm_data);
+	if (rc)
+		return rc;
+
+	memcpy(buf, &scm_data->smart, buf_len);
+
+	return 0;
+}
+
+
 static int scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		     struct nvdimm *nvdimm,
 		     unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
@@ -101,6 +252,10 @@ static int scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	struct scm_data *scm_data = container_of(nd_desc, struct scm_data, bus_desc);
 
 	switch (cmd) {
+	case ND_CMD_SMART:
+		*cmd_rc = scm_ndctl_smart(scm_data, buf, buf_len);
+		return 0;
+
 	case ND_CMD_GET_CONFIG_SIZE:
 		*cmd_rc = scm_ndctl_config_size(buf);
 		return 0;
@@ -300,6 +455,7 @@ static int scm_register_lpc_mem(struct scm_data *scm_data)
 	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
 	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
+	set_bit(ND_CMD_SMART, &nvdimm_cmd_mask);
 
 	set_bit(NDD_ALIASING, &nvdimm_flags);
 
diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
index 4a29088612a9..d593fefe38d5 100644
--- a/drivers/nvdimm/ocxl/scm_internal.h
+++ b/drivers/nvdimm/ocxl/scm_internal.h
@@ -115,6 +115,26 @@ enum overwrite_state {
 	SCM_OVERWRITE_FAILED
 };
 
+#define SCM_SMART_ATTR_POWER_ON_HOURS	0x09
+#define SCM_SMART_ATTR_TEMPERATURE	0xC2
+#define SCM_SMART_ATTR_LIFE_REMAINING	0xCA
+
+struct scm_smart_attrib {
+	__u8 id; /* See defines above */
+	__u16 attribute_flags;
+	__u8 current_val;
+	__u8 threshold_val;
+	__u8 worst_val;
+	__u8 reserved;
+	__u64 raw_val;
+};
+
+struct scm_smart_attribs {
+	struct scm_smart_attrib power_on_hours;
+	struct scm_smart_attrib temperature;
+	struct scm_smart_attrib life_remaining;
+};
+
 struct scm_data {
 	struct device dev;
 	struct pci_dev *pdev;
@@ -136,6 +156,7 @@ struct scm_data {
 	struct resource scm_res;
 	struct nd_region *nd_region;
 	struct eventfd_ctx *ev_ctx;
+	struct scm_smart_attribs smart;
 	char fw_version[8+1];
 	u32 timeouts[ADMIN_COMMAND_MAX+1];
 
-- 
2.23.0

