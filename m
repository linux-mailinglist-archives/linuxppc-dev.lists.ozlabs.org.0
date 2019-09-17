Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D527B4565
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:57:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XR8D4sG8zF3rV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:57:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XQwc2F53zF3mF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:47:44 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H1leIr062056
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:47:40 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2h81rfkj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:47:40 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 17 Sep 2019 02:47:38 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:47:32 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H1lW2q44695694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:47:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB58A52052;
 Tue, 17 Sep 2019 01:47:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 556AB5204E;
 Tue, 17 Sep 2019 01:47:31 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0CCBFA019A;
 Tue, 17 Sep 2019 11:47:30 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH 4/5] ocxl: Add functions to map/unmap LPC memory
Date: Tue, 17 Sep 2019 11:43:00 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917014307.30485-1-alastair@au1.ibm.com>
References: <20190917014307.30485-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091701-4275-0000-0000-000003675A5A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-4276-0000-0000-00003879BDE5
Message-Id: <20190917014307.30485-5-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=932 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170019
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

Add functions to map/unmap LPC memory

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/misc/ocxl/config.c        |  4 +++
 drivers/misc/ocxl/core.c          | 50 +++++++++++++++++++++++++++++++
 drivers/misc/ocxl/link.c          |  4 +--
 drivers/misc/ocxl/ocxl_internal.h | 10 +++++--
 include/misc/ocxl.h               | 18 +++++++++++
 5 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index c8e19bfb5ef9..fb0c3b6f8312 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -568,6 +568,10 @@ static int read_afu_lpc_memory_info(struct pci_dev *dev,
 		afu->special_purpose_mem_size =
 			total_mem_size - lpc_mem_size;
 	}
+
+	dev_info(&dev->dev, "Probed LPC memory of %#llx bytes and special purpose memory of %#llx bytes\n",
+		afu->lpc_mem_size, afu->special_purpose_mem_size);
+
 	return 0;
 }
 
diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
index fdfe4e0a34e1..eb24bb9d655f 100644
--- a/drivers/misc/ocxl/core.c
+++ b/drivers/misc/ocxl/core.c
@@ -210,6 +210,55 @@ static void unmap_mmio_areas(struct ocxl_afu *afu)
 	release_fn_bar(afu->fn, afu->config.global_mmio_bar);
 }
 
+int ocxl_map_lpc_mem(struct ocxl_afu *afu)
+{
+	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
+
+	if ((afu->config.lpc_mem_size + afu->config.special_purpose_mem_size) == 0)
+		return 0;
+
+	afu->lpc_base_addr = ocxl_link_lpc_online(afu->fn->link, dev);
+	if (afu->lpc_base_addr == 0)
+		return -EINVAL;
+
+	if (afu->config.lpc_mem_size) {
+		afu->lpc_res.start = afu->lpc_base_addr + afu->config.lpc_mem_offset;
+		afu->lpc_res.end = afu->lpc_res.start + afu->config.lpc_mem_size - 1;
+	}
+
+	if (afu->config.special_purpose_mem_size) {
+		afu->special_purpose_res.start = afu->lpc_base_addr +
+						 afu->config.special_purpose_mem_offset;
+		afu->special_purpose_res.end = afu->special_purpose_res.start +
+					       afu->config.special_purpose_mem_size - 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ocxl_map_lpc_mem);
+
+struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu)
+{
+	return &afu->lpc_res;
+}
+EXPORT_SYMBOL(ocxl_afu_lpc_mem);
+
+static void unmap_lpc_mem(struct ocxl_afu *afu)
+{
+	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
+
+	if (afu->lpc_res.start || afu->special_purpose_res.start) {
+		void *link = afu->fn->link;
+
+		ocxl_link_lpc_offline(link, dev);
+
+		afu->lpc_res.start = 0;
+		afu->lpc_res.end = 0;
+		afu->special_purpose_res.start = 0;
+		afu->special_purpose_res.end = 0;
+	}
+}
+
 static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
 {
 	int rc;
@@ -250,6 +299,7 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
 
 static void deconfigure_afu(struct ocxl_afu *afu)
 {
+	unmap_lpc_mem(afu);
 	unmap_mmio_areas(afu);
 	reclaim_afu_pasid(afu);
 	reclaim_afu_actag(afu);
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 2874811a4398..9e303a5f4d85 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -738,7 +738,7 @@ int ocxl_link_add_lpc_mem(void *link_handle, u64 size)
 }
 EXPORT_SYMBOL_GPL(ocxl_link_add_lpc_mem);
 
-u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
+u64 ocxl_link_lpc_online(void *link_handle, struct pci_dev *pdev)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
 
@@ -759,7 +759,7 @@ u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
 	return link->lpc_mem;
 }
 
-void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
+void ocxl_link_lpc_offline(void *link_handle, struct pci_dev *pdev)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
 
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index db2647a90fc8..5656a4aab5b7 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -52,6 +52,12 @@ struct ocxl_afu {
 	void __iomem *global_mmio_ptr;
 	u64 pp_mmio_start;
 	void *private;
+	u64 lpc_base_addr; /* Covers both LPC & special purpose memory */
+	struct bin_attribute attr_global_mmio;
+	struct bin_attribute attr_lpc_mem;
+	struct resource lpc_res;
+	struct bin_attribute attr_special_purpose_mem;
+	struct resource special_purpose_res;
 };
 
 enum ocxl_context_status {
@@ -170,7 +176,7 @@ extern u64 ocxl_link_get_lpc_mem_sz(void *link_handle);
  * @link_handle: The OpenCAPI link handle
  * @pdev: A device that is on the link
  */
-u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
+u64 ocxl_link_lpc_online(void *link_handle, struct pci_dev *pdev);
 
 /**
  * Release the LPC memory device for an OpenCAPI device
@@ -181,6 +187,6 @@ u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
  * @link_handle: The OpenCAPI link handle
  * @pdev: A device that is on the link
  */
-void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
+void ocxl_link_lpc_offline(void *link_handle, struct pci_dev *pdev);
 
 #endif /* _OCXL_INTERNAL_H_ */
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 06dd5839e438..a1897737908d 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -212,6 +212,24 @@ int ocxl_irq_set_handler(struct ocxl_context *ctx, int irq_id,
 
 // AFU Metadata
 
+/**
+ * Map the LPC system & special purpose memory for an AFU
+ *
+ * Do not call this during device discovery, as there may me multiple
+ * devices on a link, and the memory is mapped for the whole link, not
+ * just one device. It should only be called after all devices have
+ * registered their memory on the link.
+ *
+ * afu: The AFU that has the LPC memory to map
+ */
+extern int ocxl_map_lpc_mem(struct ocxl_afu *afu);
+
+/**
+ * Get the physical address range of LPC memory for an AFU
+ * afu: The AFU associated with the LPC memory
+ */
+extern struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
+
 /**
  * Get a pointer to the config for an AFU
  *
-- 
2.21.0

