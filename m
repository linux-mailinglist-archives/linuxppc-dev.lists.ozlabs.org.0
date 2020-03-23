Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FE818F8DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:43:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJYt4PyVzDrHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:43:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJRl4Nd4zDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:37:55 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NFYWI0079016; Mon, 23 Mar 2020 11:37:45 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywbtfmy26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 11:37:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02NFZICG013506;
 Mon, 23 Mar 2020 15:37:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 2ywaw95t6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 15:37:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02NFbhPO50725358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 15:37:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A33AB112063;
 Mon, 23 Mar 2020 15:37:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AEEE112065;
 Mon, 23 Mar 2020 15:37:41 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.116.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 15:37:40 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
In-Reply-To: <20200323085059.GA32528@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
 <20200323083705.GA31245@lst.de> <20200323085059.GA32528@lst.de>
Date: Mon, 23 Mar 2020 21:07:38 +0530
Message-ID: <87sghz2ibh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_05:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=48 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230086
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:

> On Mon, Mar 23, 2020 at 09:37:05AM +0100, Christoph Hellwig wrote:
>> > > +	/*
>> > > +	 * Allows IOMMU drivers to bypass dynamic translations if the DMA mask
>> > > +	 * is large enough.
>> > > +	 */
>> > > +	if (dev->dma_ops_bypass) {
>> > > +		if (min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit) >=
>> > > +				dma_direct_get_required_mask(dev))
>> > > +			return true;
>> > > +	}
>> > 
>> > 
>> > Why not do this in dma_map_direct() as well?
>> 
>> Mostly beacuse it is a relatively expensive operation, including a
>> fls64.
>
> Which I guess isn't too bad compared to a dynamic IOMMU mapping.  Can
> you just send a draft patch for what you'd like to see for ppc?

This is what I was trying, but considering I am new to DMA subsystem, I
am not sure I got all the details correct. The idea is to look at the
cpu addr and see if that can be used in direct map fashion(is
bus_dma_limit the right restriction here?) if not fallback to dynamic
IOMMU mapping.

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index e486d1d78de2..bc7e6a8b2caa 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -31,6 +31,87 @@ static inline bool dma_iommu_map_bypass(struct device *dev,
 		(!iommu_fixed_is_weak || (attrs & DMA_ATTR_WEAK_ORDERING));
 }
 
+static inline bool __dma_direct_map_capable(struct device *dev, struct page *page,
+					    unsigned long offset, size_t size)
+{
+	phys_addr_t phys = page_to_phys(page) + offset;
+	dma_addr_t dma_addr = phys_to_dma(dev, phys);
+	dma_addr_t end = dma_addr + size - 1;
+
+	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
+}
+
+static inline bool dma_direct_map_capable(struct device *dev, struct page *page,
+					  unsigned long offset, size_t size,
+					  unsigned long attrs)
+{
+	if (!dma_iommu_map_bypass(dev, attrs))
+		return false;
+
+	if (!dev->dma_mask)
+		return false;
+
+	return __dma_direct_map_capable(dev, page, offset, size);
+}
+
+
+static inline bool dma_direct_unmap_capable(struct device *dev, dma_addr_t addr, size_t size,
+					    unsigned long attrs)
+{
+	dma_addr_t end = addr + size - 1;
+
+	if (!dma_iommu_map_bypass(dev, attrs))
+		return false;
+
+	if (!dev->dma_mask)
+		return false;
+
+	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
+}
+
+static inline bool dma_direct_sg_map_capable(struct device *dev, struct scatterlist *sglist,
+					     int nelems, unsigned long attrs)
+{
+	int i;
+	struct scatterlist *sg;
+
+	if (!dma_iommu_map_bypass(dev, attrs))
+		return false;
+
+	if (!dev->dma_mask)
+		return false;
+
+	for_each_sg(sglist, sg, nelems, i) {
+		if (!__dma_direct_map_capable(dev, sg_page(sg),
+					      sg->offset, sg->length))
+			return false;
+	}
+	return true;
+}
+
+static inline bool dma_direct_sg_unmap_capable(struct device *dev, struct scatterlist *sglist,
+					       int nelems, unsigned long attrs)
+{
+	int i;
+	dma_addr_t end;
+	struct scatterlist *sg;
+
+	if (!dma_iommu_map_bypass(dev, attrs))
+		return false;
+
+	if (!dev->dma_mask)
+		return false;
+
+	for_each_sg(sglist, sg, nelems, i) {
+		end = sg->dma_address + sg_dma_len(sg);
+
+		if (end > min_not_zero(*dev->dma_mask, dev->bus_dma_limit))
+			return false;
+	}
+	return true;
+}
+
+
 /* Allocates a contiguous real buffer and creates mappings over it.
  * Returns the virtual address of the buffer and sets dma_handle
  * to the dma address (mapping) of the first page.
@@ -67,7 +148,7 @@ static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
+	if (dma_direct_map_capable(dev, page, offset, size, attrs))
 		return dma_direct_map_page(dev, page, offset, size, direction,
 				attrs);
 	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
@@ -79,7 +160,7 @@ static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
+	if (!dma_direct_unmap_capable(dev, dma_handle, size, attrs))
 		iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size,
 				direction,  attrs);
 	else
@@ -91,7 +172,7 @@ static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
+	if (dma_direct_sg_map_capable(dev, sglist, nelems, attrs))
 		return dma_direct_map_sg(dev, sglist, nelems, direction, attrs);
 	return ppc_iommu_map_sg(dev, get_iommu_table_base(dev), sglist, nelems,
 				dma_get_mask(dev), direction, attrs);
@@ -101,7 +182,7 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nelems, enum dma_data_direction direction,
 		unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
+	if (!dma_direct_sg_unmap_capable(dev, sglist, nelems, attrs))
 		ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
 			   direction, attrs);
 	else
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 99f72162dd85..702a680f5766 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1119,6 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	spin_unlock(&direct_window_list_lock);
 
 	dma_addr = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.bus_dma_limit = dma_addr + query.largest_available_block;
 	goto out_unlock;
 
 out_free_window:
