Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B7D1245
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 17:19:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pHvB6M00zDqXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 02:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clombard@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pHjm0t36zDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 02:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x99Ew5U1117352
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 9 Oct 2019 11:11:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhh8msy6j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2019 11:11:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Wed, 9 Oct 2019 16:11:18 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 9 Oct 2019 16:11:17 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x99FBFhs60227686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2019 15:11:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3782D11C04C;
 Wed,  9 Oct 2019 15:11:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7E4F11C050;
 Wed,  9 Oct 2019 15:11:13 +0000 (GMT)
Received: from lombard-w541.ibmuc.com (unknown [9.145.13.197])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Oct 2019 15:11:13 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH 2/2] powerpc/powernv: ocxl move TL definition
Date: Wed,  9 Oct 2019 17:11:09 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
References: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100915-0012-0000-0000-0000035687D1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100915-0013-0000-0000-000021918D9E
Message-Id: <20191009151109.13752-3-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910090142
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Specifies the templates in the Transaction Layer that the OpenCAPI device/host
support when transmitting/receiving DL/DLX frames to or from the OpenCAPI
device/host.
Update, rename and create new few platform-specific calls which can be used by
drivers.

No functional change.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h   |   5 +-
 arch/powerpc/platforms/powernv/ocxl.c | 103 ++++++++++++++++++++++++--
 drivers/misc/ocxl/config.c            |  89 +---------------------
 3 files changed, 99 insertions(+), 98 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index 8e516e339e6c..b8c68878b4ba 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -13,10 +13,7 @@ extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 			u16 *supported);
 extern int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
 
-extern int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
-			char *rate_buf, int rate_buf_size);
-extern int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
-			uint64_t rate_buf_phys, int rate_buf_size);
+extern int pnv_ocxl_set_TL(struct pci_dev *dev, int tl_dvsec);
 
 extern int pnv_ocxl_platform_setup(struct pci_dev *dev,
 				   int PE_mask, int *hwirq,
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 4d26cba12b63..351324cffc2b 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -369,8 +369,8 @@ static void set_templ_rate(unsigned int templ, unsigned int rate, char *buf)
 	buf[idx] |= rate << shift;
 }
 
-int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
-			char *rate_buf, int rate_buf_size)
+static int get_tl_cap(struct pci_dev *dev, long *cap,
+		      char *rate_buf, int rate_buf_size)
 {
 	if (rate_buf_size != PNV_OCXL_TL_RATE_BUF_SIZE)
 		return -EINVAL;
@@ -390,10 +390,9 @@ int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
 	*cap = PNV_OCXL_TL_P9_RECV_CAP;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pnv_ocxl_get_tl_cap);
 
-int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
-			uint64_t rate_buf_phys, int rate_buf_size)
+static int set_tl_conf(struct pci_dev *dev, long cap,
+		       uint64_t rate_buf_phys, int rate_buf_size)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
 	struct pnv_phb *phb = hose->private_data;
@@ -410,7 +409,99 @@ int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pnv_ocxl_set_tl_conf);
+
+int pnv_ocxl_set_TL(struct pci_dev *dev, int tl_dvsec)
+{
+	u32 val;
+	__be32 *be32ptr;
+	u8 timers;
+	int i, rc;
+	long recv_cap;
+	char *recv_rate;
+
+	recv_rate = kzalloc(PNV_OCXL_TL_RATE_BUF_SIZE, GFP_KERNEL);
+	if (!recv_rate)
+		return -ENOMEM;
+	/*
+	 * The spec defines 64 templates for messages in the
+	 * Transaction Layer (TL).
+	 *
+	 * The host and device each support a subset, so we need to
+	 * configure the transmitters on each side to send only
+	 * templates the receiver understands, at a rate the receiver
+	 * can process.  Per the spec, template 0 must be supported by
+	 * everybody. That's the template which has been used by the
+	 * host and device so far.
+	 *
+	 * The sending rate limit must be set before the template is
+	 * enabled.
+	 */
+
+	/*
+	 * Device -> host
+	 */
+	rc = get_tl_cap(dev, &recv_cap, recv_rate,
+			PNV_OCXL_TL_RATE_BUF_SIZE);
+	if (rc)
+		goto out;
+
+	for (i = 0; i < PNV_OCXL_TL_RATE_BUF_SIZE; i += 4) {
+		be32ptr = (__be32 *) &recv_rate[i];
+		pci_write_config_dword(dev,
+				tl_dvsec + OCXL_DVSEC_TL_SEND_RATE + i,
+				be32_to_cpu(*be32ptr));
+	}
+	val = recv_cap >> 32;
+	pci_write_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_SEND_CAP, val);
+	val = recv_cap & GENMASK(31, 0);
+	pci_write_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_SEND_CAP + 4, val);
+
+	/*
+	 * Host -> device
+	 */
+	for (i = 0; i < PNV_OCXL_TL_RATE_BUF_SIZE; i += 4) {
+		pci_read_config_dword(dev,
+				tl_dvsec + OCXL_DVSEC_TL_RECV_RATE + i,
+				&val);
+		be32ptr = (__be32 *) &recv_rate[i];
+		*be32ptr = cpu_to_be32(val);
+	}
+	pci_read_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_RECV_CAP, &val);
+	recv_cap = (long) val << 32;
+	pci_read_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_RECV_CAP + 4, &val);
+	recv_cap |= val;
+
+	rc = set_tl_conf(dev, recv_cap, __pa(recv_rate),
+			 PNV_OCXL_TL_RATE_BUF_SIZE);
+	if (rc)
+		goto out;
+
+	/*
+	 * Opencapi commands needing to be retried are classified per
+	 * the TL in 2 groups: short and long commands.
+	 *
+	 * The short back off timer it not used for now. It will be
+	 * for opencapi 4.0.
+	 *
+	 * The long back off timer is typically used when an AFU hits
+	 * a page fault but the NPU is already processing one. So the
+	 * AFU needs to wait before it can resubmit. Having a value
+	 * too low doesn't break anything, but can generate extra
+	 * traffic on the link.
+	 * We set it to 1.6 us for now. It's shorter than, but in the
+	 * same order of magnitude as the time spent to process a page
+	 * fault.
+	 */
+	timers = 0x2 << 4; /* long timer = 1.6 us */
+	pci_write_config_byte(dev, tl_dvsec + OCXL_DVSEC_TL_BACKOFF_TIMERS,
+			timers);
+
+	rc = 0;
+out:
+	kfree(recv_rate);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(pnv_ocxl_set_TL);
 
 static int get_xsl_irq(struct pci_dev *dev, int *hwirq)
 {
diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index c8e19bfb5ef9..7ca0f6744125 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -709,100 +709,13 @@ EXPORT_SYMBOL_GPL(ocxl_config_set_afu_state);
 
 int ocxl_config_set_TL(struct pci_dev *dev, int tl_dvsec)
 {
-	u32 val;
-	__be32 *be32ptr;
-	u8 timers;
-	int i, rc;
-	long recv_cap;
-	char *recv_rate;
-
 	/*
 	 * Skip on function != 0, as the TL can only be defined on 0
 	 */
 	if (PCI_FUNC(dev->devfn) != 0)
 		return 0;
 
-	recv_rate = kzalloc(PNV_OCXL_TL_RATE_BUF_SIZE, GFP_KERNEL);
-	if (!recv_rate)
-		return -ENOMEM;
-	/*
-	 * The spec defines 64 templates for messages in the
-	 * Transaction Layer (TL).
-	 *
-	 * The host and device each support a subset, so we need to
-	 * configure the transmitters on each side to send only
-	 * templates the receiver understands, at a rate the receiver
-	 * can process.  Per the spec, template 0 must be supported by
-	 * everybody. That's the template which has been used by the
-	 * host and device so far.
-	 *
-	 * The sending rate limit must be set before the template is
-	 * enabled.
-	 */
-
-	/*
-	 * Device -> host
-	 */
-	rc = pnv_ocxl_get_tl_cap(dev, &recv_cap, recv_rate,
-				PNV_OCXL_TL_RATE_BUF_SIZE);
-	if (rc)
-		goto out;
-
-	for (i = 0; i < PNV_OCXL_TL_RATE_BUF_SIZE; i += 4) {
-		be32ptr = (__be32 *) &recv_rate[i];
-		pci_write_config_dword(dev,
-				tl_dvsec + OCXL_DVSEC_TL_SEND_RATE + i,
-				be32_to_cpu(*be32ptr));
-	}
-	val = recv_cap >> 32;
-	pci_write_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_SEND_CAP, val);
-	val = recv_cap & GENMASK(31, 0);
-	pci_write_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_SEND_CAP + 4, val);
-
-	/*
-	 * Host -> device
-	 */
-	for (i = 0; i < PNV_OCXL_TL_RATE_BUF_SIZE; i += 4) {
-		pci_read_config_dword(dev,
-				tl_dvsec + OCXL_DVSEC_TL_RECV_RATE + i,
-				&val);
-		be32ptr = (__be32 *) &recv_rate[i];
-		*be32ptr = cpu_to_be32(val);
-	}
-	pci_read_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_RECV_CAP, &val);
-	recv_cap = (long) val << 32;
-	pci_read_config_dword(dev, tl_dvsec + OCXL_DVSEC_TL_RECV_CAP + 4, &val);
-	recv_cap |= val;
-
-	rc = pnv_ocxl_set_tl_conf(dev, recv_cap, __pa(recv_rate),
-				PNV_OCXL_TL_RATE_BUF_SIZE);
-	if (rc)
-		goto out;
-
-	/*
-	 * Opencapi commands needing to be retried are classified per
-	 * the TL in 2 groups: short and long commands.
-	 *
-	 * The short back off timer it not used for now. It will be
-	 * for opencapi 4.0.
-	 *
-	 * The long back off timer is typically used when an AFU hits
-	 * a page fault but the NPU is already processing one. So the
-	 * AFU needs to wait before it can resubmit. Having a value
-	 * too low doesn't break anything, but can generate extra
-	 * traffic on the link.
-	 * We set it to 1.6 us for now. It's shorter than, but in the
-	 * same order of magnitude as the time spent to process a page
-	 * fault.
-	 */
-	timers = 0x2 << 4; /* long timer = 1.6 us */
-	pci_write_config_byte(dev, tl_dvsec + OCXL_DVSEC_TL_BACKOFF_TIMERS,
-			timers);
-
-	rc = 0;
-out:
-	kfree(recv_rate);
-	return rc;
+	return pnv_ocxl_set_TL(dev, tl_dvsec);
 }
 EXPORT_SYMBOL_GPL(ocxl_config_set_TL);
 
-- 
2.21.0

