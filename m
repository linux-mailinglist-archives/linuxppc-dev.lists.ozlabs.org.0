Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D726235B13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:17:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JmTj2Y8LzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JmSF2yD1zDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:15:55 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55B1etW103529
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 07:15:52 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sxb4aky2n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 07:15:51 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 5 Jun 2019 12:15:50 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 12:15:48 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55BFkEd42139746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 11:15:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C907A4078;
 Wed,  5 Jun 2019 11:15:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE07A4059;
 Wed,  5 Jun 2019 11:15:45 +0000 (GMT)
Received: from pic2.home (unknown [9.145.4.183])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 11:15:45 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, alastair@au1.ibm.com, ajd@linux.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH] ocxl: Update for AFU descriptor template version 1.1
Date: Wed,  5 Jun 2019 13:15:45 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060511-0012-0000-0000-0000032435FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060511-0013-0000-0000-0000215D18FE
Message-Id: <20190605111545.19762-1-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050070
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

The OpenCAPI discovery and configuration specification has been
updated and introduces version 1.1 of the AFU descriptor template,
with new fields to better define the memory layout of an OpenCAPI
adapter.

The ocxl driver doesn't do much yet to support LPC memory but as we
start seeing (non-LPC) AFU images using the new template, this patch
updates the config space parsing code to avoid spitting a warning.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---

mpe: this patch is originally from Alastair. I added some minor
tweaking, I hope he won't mind. He has better things to do right now,
and I'd like to see this hit the next merge window.


 drivers/misc/ocxl/config.c | 181 +++++++++++++++++++++++++++++++++----
 include/misc/ocxl.h        |   5 +-
 2 files changed, 165 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index 5e65acb8e134..c8e19bfb5ef9 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -20,11 +20,14 @@
 #define OCXL_DVSEC_TEMPL_MMIO_GLOBAL_SZ  0x28
 #define OCXL_DVSEC_TEMPL_MMIO_PP         0x30
 #define OCXL_DVSEC_TEMPL_MMIO_PP_SZ      0x38
-#define OCXL_DVSEC_TEMPL_MEM_SZ          0x3C
-#define OCXL_DVSEC_TEMPL_WWID            0x40
+#define OCXL_DVSEC_TEMPL_ALL_MEM_SZ      0x3C
+#define OCXL_DVSEC_TEMPL_LPC_MEM_START   0x40
+#define OCXL_DVSEC_TEMPL_WWID            0x48
+#define OCXL_DVSEC_TEMPL_LPC_MEM_SZ      0x58
 
 #define OCXL_MAX_AFU_PER_FUNCTION 64
-#define OCXL_TEMPL_LEN            0x58
+#define OCXL_TEMPL_LEN_1_0        0x58
+#define OCXL_TEMPL_LEN_1_1        0x60
 #define OCXL_TEMPL_NAME_LEN       24
 #define OCXL_CFG_TIMEOUT     3
 
@@ -269,34 +272,72 @@ static int read_afu_info(struct pci_dev *dev, struct ocxl_fn_config *fn,
 	return 0;
 }
 
+/**
+ * Read the template version from the AFU
+ * dev: the device for the AFU
+ * fn: the AFU offsets
+ * len: outputs the template length
+ * version: outputs the major<<8,minor version
+ *
+ * Returns 0 on success, negative on failure
+ */
+static int read_template_version(struct pci_dev *dev, struct ocxl_fn_config *fn,
+		u16 *len, u16 *version)
+{
+	u32 val32;
+	u8 major, minor;
+	int rc;
+
+	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_VERSION, &val32);
+	if (rc)
+		return rc;
+
+	*len = EXTRACT_BITS(val32, 16, 31);
+	major = EXTRACT_BITS(val32, 8, 15);
+	minor = EXTRACT_BITS(val32, 0, 7);
+	*version = (major << 8) + minor;
+	return 0;
+}
+
 int ocxl_config_check_afu_index(struct pci_dev *dev,
 				struct ocxl_fn_config *fn, int afu_idx)
 {
-	u32 val;
-	int rc, templ_major, templ_minor, len;
+	int rc;
+	u16 templ_version;
+	u16 len, expected_len;
 
 	pci_write_config_byte(dev,
 			fn->dvsec_afu_info_pos + OCXL_DVSEC_AFU_INFO_AFU_IDX,
 			afu_idx);
-	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_VERSION, &val);
+
+	rc = read_template_version(dev, fn, &len, &templ_version);
 	if (rc)
 		return rc;
 
-	/* AFU index map can have holes */
-	if (!val)
+	/* AFU index map can have holes, in which case we read all 0's */
+	if (!templ_version && !len)
 		return 0;
 
-	templ_major = EXTRACT_BITS(val, 8, 15);
-	templ_minor = EXTRACT_BITS(val, 0, 7);
 	dev_dbg(&dev->dev, "AFU descriptor template version %d.%d\n",
-		templ_major, templ_minor);
-
-	len = EXTRACT_BITS(val, 16, 31);
-	if (len != OCXL_TEMPL_LEN) {
-		dev_warn(&dev->dev,
-			"Unexpected template length in AFU information (%#x)\n",
-			len);
+		templ_version >> 8, templ_version & 0xFF);
+
+	switch (templ_version) {
+	case 0x0005: // v0.5 was used prior to the spec approval
+	case 0x0100:
+		expected_len = OCXL_TEMPL_LEN_1_0;
+		break;
+	case 0x0101:
+		expected_len = OCXL_TEMPL_LEN_1_1;
+		break;
+	default:
+		dev_warn(&dev->dev, "Unknown AFU template version %#x\n",
+			templ_version);
+		expected_len = len;
 	}
+	if (len != expected_len)
+		dev_warn(&dev->dev,
+			"Unexpected template length %#x in AFU information, expected %#x for version %#x\n",
+			len, expected_len, templ_version);
 	return 1;
 }
 
@@ -434,6 +475,102 @@ static int validate_afu(struct pci_dev *dev, struct ocxl_afu_config *afu)
 	return 0;
 }
 
+/**
+ * Populate AFU metadata regarding LPC memory
+ * dev: the device for the AFU
+ * fn: the AFU offsets
+ * afu: the AFU struct to populate the LPC metadata into
+ *
+ * Returns 0 on success, negative on failure
+ */
+static int read_afu_lpc_memory_info(struct pci_dev *dev,
+				struct ocxl_fn_config *fn,
+				struct ocxl_afu_config *afu)
+{
+	int rc;
+	u32 val32;
+	u16 templ_version;
+	u16 templ_len;
+	u64 total_mem_size = 0;
+	u64 lpc_mem_size = 0;
+
+	afu->lpc_mem_offset = 0;
+	afu->lpc_mem_size = 0;
+	afu->special_purpose_mem_offset = 0;
+	afu->special_purpose_mem_size = 0;
+	/*
+	 * For AFUs following template v1.0, the LPC memory covers the
+	 * total memory. Its size is a power of 2.
+	 *
+	 * For AFUs with template >= v1.01, the total memory size is
+	 * still a power of 2, but it is split in 2 parts:
+	 * - the LPC memory, whose size can now be anything
+	 * - the remainder memory is a special purpose memory, whose
+	 *   definition is AFU-dependent. It is not accessible through
+	 *   the usual commands for LPC memory
+	 */
+	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_ALL_MEM_SZ, &val32);
+	if (rc)
+		return rc;
+
+	val32 = EXTRACT_BITS(val32, 0, 7);
+	if (!val32)
+		return 0; /* No LPC memory */
+
+	/*
+	 * The configuration space spec allows for a memory size of up
+	 * to 2^255 bytes.
+	 *
+	 * Current generation hardware uses 56-bit physical addresses,
+	 * but we won't be able to get near close to that, as we won't
+	 * have a hole big enough in the memory map.  Let it pass in
+	 * the driver for now. We'll get an error from the firmware
+	 * when trying to configure something too big.
+	 */
+	total_mem_size = 1ull << val32;
+
+	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_LPC_MEM_START, &val32);
+	if (rc)
+		return rc;
+
+	afu->lpc_mem_offset = val32;
+
+	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_LPC_MEM_START + 4, &val32);
+	if (rc)
+		return rc;
+
+	afu->lpc_mem_offset |= (u64) val32 << 32;
+
+	rc = read_template_version(dev, fn, &templ_len, &templ_version);
+	if (rc)
+		return rc;
+
+	if (templ_version >= 0x0101) {
+		rc = read_afu_info(dev, fn,
+				OCXL_DVSEC_TEMPL_LPC_MEM_SZ, &val32);
+		if (rc)
+			return rc;
+		lpc_mem_size = val32;
+
+		rc = read_afu_info(dev, fn,
+				OCXL_DVSEC_TEMPL_LPC_MEM_SZ + 4, &val32);
+		if (rc)
+			return rc;
+		lpc_mem_size |= (u64) val32 << 32;
+	} else {
+		lpc_mem_size = total_mem_size;
+	}
+	afu->lpc_mem_size = lpc_mem_size;
+
+	if (lpc_mem_size < total_mem_size) {
+		afu->special_purpose_mem_offset =
+			afu->lpc_mem_offset + lpc_mem_size;
+		afu->special_purpose_mem_size =
+			total_mem_size - lpc_mem_size;
+	}
+	return 0;
+}
+
 int ocxl_config_read_afu(struct pci_dev *dev, struct ocxl_fn_config *fn,
 			struct ocxl_afu_config *afu, u8 afu_idx)
 {
@@ -467,10 +604,9 @@ int ocxl_config_read_afu(struct pci_dev *dev, struct ocxl_fn_config *fn,
 	if (rc)
 		return rc;
 
-	rc = read_afu_info(dev, fn, OCXL_DVSEC_TEMPL_MEM_SZ, &val32);
+	rc = read_afu_lpc_memory_info(dev, fn, afu);
 	if (rc)
 		return rc;
-	afu->log_mem_size = EXTRACT_BITS(val32, 0, 7);
 
 	rc = read_afu_control(dev, afu);
 	if (rc)
@@ -487,7 +623,12 @@ int ocxl_config_read_afu(struct pci_dev *dev, struct ocxl_fn_config *fn,
 	dev_dbg(&dev->dev, "  pp mmio bar = %hhu\n", afu->pp_mmio_bar);
 	dev_dbg(&dev->dev, "  pp mmio offset = %#llx\n", afu->pp_mmio_offset);
 	dev_dbg(&dev->dev, "  pp mmio stride = %#x\n", afu->pp_mmio_stride);
-	dev_dbg(&dev->dev, "  mem size (log) = %hhu\n", afu->log_mem_size);
+	dev_dbg(&dev->dev, "  lpc_mem offset = %#llx\n", afu->lpc_mem_offset);
+	dev_dbg(&dev->dev, "  lpc_mem size = %#llx\n", afu->lpc_mem_size);
+	dev_dbg(&dev->dev, "  special purpose mem offset = %#llx\n",
+		afu->special_purpose_mem_offset);
+	dev_dbg(&dev->dev, "  special purpose mem size = %#llx\n",
+		afu->special_purpose_mem_size);
 	dev_dbg(&dev->dev, "  pasid supported (log) = %u\n",
 		afu->pasid_supported_log);
 	dev_dbg(&dev->dev, "  actag supported = %u\n",
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 5c4b4916e6be..06dd5839e438 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -32,7 +32,10 @@ struct ocxl_afu_config {
 	u8 pp_mmio_bar;         /* per-process MMIO area */
 	u64 pp_mmio_offset;
 	u32 pp_mmio_stride;
-	u8 log_mem_size;
+	u64 lpc_mem_offset;
+	u64 lpc_mem_size;
+	u64 special_purpose_mem_offset;
+	u64 special_purpose_mem_size;
 	u8 pasid_supported_log;
 	u16 actag_supported;
 };
-- 
2.21.0

