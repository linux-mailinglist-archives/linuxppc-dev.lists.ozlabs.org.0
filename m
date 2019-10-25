Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F6E42BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:01:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zsQG5yKMzDqfF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:01:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zs9M0HG7zDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 15:49:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9P4nWkE068965
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:49:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vutah81bu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:49:56 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 25 Oct 2019 05:49:53 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 25 Oct 2019 05:49:44 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9P4nhfj51445940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 04:49:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74B7A405C;
 Fri, 25 Oct 2019 04:49:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B699A405B;
 Fri, 25 Oct 2019 04:49:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Oct 2019 04:49:43 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6FFF6A0147;
 Fri, 25 Oct 2019 15:49:41 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH 05/10] ocxl: Tally up the LPC memory on a link & allow it to
 be mapped
Date: Fri, 25 Oct 2019 15:47:00 +1100
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025044721.16617-1-alastair@au1.ibm.com>
References: <20191025044721.16617-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102504-0020-0000-0000-0000037E3ED5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102504-0021-0000-0000-000021D488F3
Message-Id: <20191025044721.16617-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910250045
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
Cc: Oscar Salvador <osalvador@suse.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

Tally up the LPC memory on an OpenCAPI link & allow it to be mapped

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/misc/ocxl/core.c          | 10 ++++++
 drivers/misc/ocxl/link.c          | 60 +++++++++++++++++++++++++++++++
 drivers/misc/ocxl/ocxl_internal.h | 33 +++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
index b7a09b21ab36..2531c6cf19a0 100644
--- a/drivers/misc/ocxl/core.c
+++ b/drivers/misc/ocxl/core.c
@@ -230,8 +230,18 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
 	if (rc)
 		goto err_free_pasid;
 
+	if (afu->config.lpc_mem_size || afu->config.special_purpose_mem_size) {
+		rc = ocxl_link_add_lpc_mem(afu->fn->link, afu->config.lpc_mem_offset,
+					   afu->config.lpc_mem_size +
+					   afu->config.special_purpose_mem_size);
+		if (rc)
+			goto err_free_mmio;
+	}
+
 	return 0;
 
+err_free_mmio:
+	unmap_mmio_areas(afu);
 err_free_pasid:
 	reclaim_afu_pasid(afu);
 err_free_actag:
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 58d111afd9f6..1d350d0bb860 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -84,6 +84,11 @@ struct ocxl_link {
 	int dev;
 	atomic_t irq_available;
 	struct spa *spa;
+	struct mutex lpc_mem_lock;
+	u64 lpc_mem_sz; /* Total amount of LPC memory presented on the link */
+	u64 lpc_mem;
+	int lpc_consumers;
+
 	void *platform_data;
 };
 static struct list_head links_list = LIST_HEAD_INIT(links_list);
@@ -396,6 +401,8 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
 	if (rc)
 		goto err_spa;
 
+	mutex_init(&link->lpc_mem_lock);
+
 	/* platform specific hook */
 	rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
 				&link->platform_data);
@@ -711,3 +718,56 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
 	atomic_inc(&link->irq_available);
 }
 EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
+
+int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size)
+{
+	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+
+	// Check for overflow
+	if (offset > (offset + size))
+		return -EINVAL;
+
+	mutex_lock(&link->lpc_mem_lock);
+	link->lpc_mem_sz = max(link->lpc_mem_sz, offset + size);
+
+	mutex_unlock(&link->lpc_mem_lock);
+
+	return 0;
+}
+
+u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
+{
+	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	u64 lpc_mem;
+
+	mutex_lock(&link->lpc_mem_lock);
+	if (link->lpc_mem) {
+		lpc_mem = link->lpc_mem;
+
+		link->lpc_consumers++;
+		mutex_unlock(&link->lpc_mem_lock);
+		return lpc_mem;
+	}
+
+	link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link->lpc_mem_sz);
+	if (link->lpc_mem)
+		link->lpc_consumers++;
+	lpc_mem = link->lpc_mem;
+	mutex_unlock(&link->lpc_mem_lock);
+
+	return lpc_mem;
+}
+
+void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
+{
+	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+
+	mutex_lock(&link->lpc_mem_lock);
+	link->lpc_consumers--;
+	if (link->lpc_consumers == 0) {
+		pnv_ocxl_platform_lpc_release(pdev);
+		link->lpc_mem = 0;
+	}
+
+	mutex_unlock(&link->lpc_mem_lock);
+}
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 97415afd79f3..20b417e00949 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -141,4 +141,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context *ctx, u64 offset);
 u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
 void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
 
+/**
+ * ocxl_link_add_lpc_mem() - Increment the amount of memory required by an OpenCAPI link
+ *
+ * @link_handle: The OpenCAPI link handle
+ * @offset: The offset of the memory to add
+ * @size: The amount of memory to increment by
+ *
+ * Return 0 on success, negative on overflow
+ */
+int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size);
+
+/**
+ * ocxl_link_lpc_map() - Map the LPC memory for an OpenCAPI device
+ *
+ * Since LPC memory belongs to a link, the whole LPC memory available
+ * on the link bust be mapped in order to make it accessible to a device.
+ *
+ * @link_handle: The OpenCAPI link handle
+ * @pdev: A device that is on the link
+ */
+u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
+
+/**
+ * ocxl_link_lpc_release() - Release the LPC memory device for an OpenCAPI device
+ *
+ * Offlines LPC memory on an OpenCAPI link for a device. If this is the
+ * last device on the link to release the memory, unmap it from the link.
+ *
+ * @link_handle: The OpenCAPI link handle
+ * @pdev: A device that is on the link
+ */
+void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
+
 #endif /* _OCXL_INTERNAL_H_ */
-- 
2.21.0

