Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7A10F629
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 05:12:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RpTt6kW0zDqQr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 15:12:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RnyS6hxczDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 14:48:32 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB33kcFp118297
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 22:48:29 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wkrj553j5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 22:48:29 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Dec 2019 03:48:25 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 03:48:18 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB33mHRK51839012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 03:48:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABAABAE057;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1561FAE053;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 03:48:17 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2E613A03E0;
 Tue,  3 Dec 2019 14:48:13 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 14/27] nvdimm/ocxl: Add support for near storage commands
Date: Tue,  3 Dec 2019 14:46:42 +1100
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203034655.51561-1-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120303-0028-0000-0000-000003C3CC74
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120303-0029-0000-0000-00002486E433
Message-Id: <20191203034655.51561-15-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=1 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Similar to the previous patch, this adds support for near storage commands.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/scm.c          |  6 +++++
 drivers/nvdimm/ocxl/scm_internal.c | 41 ++++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/scm_internal.h | 38 +++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
index 1e175f3c3cf2..6c16ca7fabfa 100644
--- a/drivers/nvdimm/ocxl/scm.c
+++ b/drivers/nvdimm/ocxl/scm.c
@@ -310,12 +310,18 @@ static int scm_setup_command_metadata(struct scm_data *scm_data)
 	int rc;
 
 	mutex_init(&scm_data->admin_command.lock);
+	mutex_init(&scm_data->ns_command.lock);
 
 	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_ACMA_CREQO,
 					  &scm_data->admin_command);
 	if (rc)
 		return rc;
 
+	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_NSCMA_CREQO,
+					  &scm_data->ns_command);
+	if (rc)
+		return rc;
+
 	return 0;
 }
 
diff --git a/drivers/nvdimm/ocxl/scm_internal.c b/drivers/nvdimm/ocxl/scm_internal.c
index 7b11b56863fb..c405f1d8afb8 100644
--- a/drivers/nvdimm/ocxl/scm_internal.c
+++ b/drivers/nvdimm/ocxl/scm_internal.c
@@ -132,6 +132,47 @@ int scm_admin_response_handled(const struct scm_data *scm_data)
 				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_ACRA);
 }
 
+int scm_ns_command_request(struct scm_data *scm_data, u8 op_code)
+{
+	u64 val;
+	int rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CHI,
+					 OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	if (!(val & GLOBAL_MMIO_CHI_NSCRA))
+		return -EBUSY;
+
+	return scm_command_request(scm_data, &scm_data->ns_command, op_code);
+}
+
+int scm_ns_response(const struct scm_data *scm_data)
+{
+	return scm_command_response(scm_data, &scm_data->ns_command);
+}
+
+int scm_ns_command_execute(const struct scm_data *scm_data)
+{
+	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
+				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_NSCRW);
+}
+
+bool scm_ns_command_complete(const struct scm_data *scm_data)
+{
+	u64 val = 0;
+	int rc = scm_chi(scm_data, &val);
+
+	WARN_ON(rc);
+
+	return (val & GLOBAL_MMIO_CHI_NSCRA) != 0;
+}
+
+int scm_ns_response_handled(const struct scm_data *scm_data)
+{
+	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIC,
+				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_NSCRA);
+}
+
 void scm_warn_status(const struct scm_data *scm_data, const char *message,
 		     u8 status)
 {
diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
index 9bff684cd069..9575996a89e7 100644
--- a/drivers/nvdimm/ocxl/scm_internal.h
+++ b/drivers/nvdimm/ocxl/scm_internal.h
@@ -108,6 +108,7 @@ struct scm_data {
 	struct ocxl_context *ocxl_context;
 	void *metadata_addr;
 	struct command_metadata admin_command;
+	struct command_metadata ns_command;
 	struct resource scm_res;
 	struct nd_region *nd_region;
 	char fw_version[8+1];
@@ -176,6 +177,42 @@ int scm_admin_command_complete_timeout(const struct scm_data *scm_data,
  */
 int scm_admin_response_handled(const struct scm_data *scm_data);
 
+/**
+ * scm_ns_command_request() - Issue a near storage command request
+ * @scm_data: a pointer to the SCM device data
+ * @op_code: The op-code for the command
+ * Returns an identifier for the command, or negative on error
+ */
+int scm_ns_command_request(struct scm_data *scm_data, u8 op_code);
+
+/**
+ * scm_ns_response() - Validate a near storage response
+ * @scm_data: a pointer to the SCM device data
+ * Returns the status code of the command, or negative on error
+ */
+int scm_ns_response(const struct scm_data *scm_data);
+
+/**
+ * scm_ns_command_execute() - Notify the controller to start processing a pending near storage command
+ * @scm_data: a pointer to the SCM device data
+ * Returns 0 on success, negative on error
+ */
+int scm_ns_command_execute(const struct scm_data *scm_data);
+
+/**
+ * scm_ns_command_complete() - Is a near storage command executing
+ * scm_data: a pointer to the SCM device data
+ * Returns true if the previous admin command has completed
+ */
+bool scm_ns_command_complete(const struct scm_data *scm_data);
+
+/**
+ * scm_ns_response_handled() - Notify the controller that the near storage response has been handled
+ * scm_data: a pointer to the SCM device data
+ * Returns 0 on success, negative on failure
+ */
+int scm_ns_response_handled(const struct scm_data *scm_data);
+
 /**
  * scm_warn_status() - Emit a kernel warning showing a command status.
  * @scm_data: a pointer to the SCM device data
@@ -184,3 +221,4 @@ int scm_admin_response_handled(const struct scm_data *scm_data);
  */
 void scm_warn_status(const struct scm_data *scm_data, const char *message,
 		     u8 status);
+
-- 
2.23.0

