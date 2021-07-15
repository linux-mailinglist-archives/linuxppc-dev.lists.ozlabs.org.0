Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CB3CA3E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 19:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQh5b2DQMz3fGp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 03:22:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=KzXoc+Ot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256
 header.s=20200525 header.b=KzXoc+Ot; dkim-atps=neutral
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQgyc6pGDz3bkd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 03:16:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=/xaVvtLmcUu039UJFO4qpFCPm3zd9EnehJHJPiaD5YM=; b=KzXoc+OtScf0621cHsW4WWgNxm
 fJdT7eA9gu/baq43jxlDEiH+QFgAMcxJbOu3wtSaqm3t75K5msuzsg0yK0lvmMVWdraR40zRMSB87
 0X7dc45GYYR5ZFeJXvD+jkJYz+EvbL4HMMu3vF3m0fT7jINcVjylE6EkjkYl7RL7xjjOd/wuP8lzX
 tuCEZP9WlcW3KD+U3f0nIsWR7LWNV6jVltjf/DNG/ZVMboqq3syyyRqLyfOYUsmrqS4ABA6oxc0oC
 ArmBf9hip05QY900Fjwm2mqUEg9SEROhiC7VtjusI8PWGqZk2iyi/QtTfSfwoFcxm26TSdPTuQAvh
 MAVgQUdw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44Ur-0001ye-Fb; Thu, 15 Jul 2021 10:46:02 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Un-0001nE-VU; Thu, 15 Jul 2021 10:45:58 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 15 Jul 2021 10:45:31 -0600
Message-Id: <20210715164544.6827-4-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com,
 martin.oliveira@eideticom.com, logang@deltatee.com, joro@8bytes.org,
 will@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 03/16] iommu: Return full error code from
 iommu_map_sg[_atomic]()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert to ssize_t return code so the return code from __iommu_map()
can be returned all the way down through dma_iommu_map_sg().

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
---
 drivers/iommu/iommu.c | 15 +++++++--------
 include/linux/iommu.h | 22 +++++++++++-----------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5419c4b9f27a..bf971b4e34aa 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2567,9 +2567,9 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
-static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
-			     struct scatterlist *sg, unsigned int nents, int prot,
-			     gfp_t gfp)
+static ssize_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+		struct scatterlist *sg, unsigned int nents, int prot,
+		gfp_t gfp)
 {
 	const struct iommu_ops *ops = domain->ops;
 	size_t len = 0, mapped = 0;
@@ -2610,19 +2610,18 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 	/* undo mappings already done */
 	iommu_unmap(domain, iova, mapped);
 
-	return 0;
-
+	return ret;
 }
 
-size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
-		    struct scatterlist *sg, unsigned int nents, int prot)
+ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+		     struct scatterlist *sg, unsigned int nents, int prot)
 {
 	might_sleep();
 	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_KERNEL);
 }
 EXPORT_SYMBOL_GPL(iommu_map_sg);
 
-size_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long iova,
+ssize_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long iova,
 		    struct scatterlist *sg, unsigned int nents, int prot)
 {
 	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_ATOMIC);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d448050bf7..9369458ba1bd 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -414,11 +414,11 @@ extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 extern size_t iommu_unmap_fast(struct iommu_domain *domain,
 			       unsigned long iova, size_t size,
 			       struct iommu_iotlb_gather *iotlb_gather);
-extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
-			   struct scatterlist *sg,unsigned int nents, int prot);
-extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
-				  unsigned long iova, struct scatterlist *sg,
-				  unsigned int nents, int prot);
+extern ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+		struct scatterlist *sg, unsigned int nents, int prot);
+extern ssize_t iommu_map_sg_atomic(struct iommu_domain *domain,
+				   unsigned long iova, struct scatterlist *sg,
+				   unsigned int nents, int prot);
 extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova);
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
@@ -679,18 +679,18 @@ static inline size_t iommu_unmap_fast(struct iommu_domain *domain,
 	return 0;
 }
 
-static inline size_t iommu_map_sg(struct iommu_domain *domain,
-				  unsigned long iova, struct scatterlist *sg,
-				  unsigned int nents, int prot)
+static inline ssize_t iommu_map_sg(struct iommu_domain *domain,
+				   unsigned long iova, struct scatterlist *sg,
+				   unsigned int nents, int prot)
 {
-	return 0;
+	return -ENODEV;
 }
 
-static inline size_t iommu_map_sg_atomic(struct iommu_domain *domain,
+static inline ssize_t iommu_map_sg_atomic(struct iommu_domain *domain,
 				  unsigned long iova, struct scatterlist *sg,
 				  unsigned int nents, int prot)
 {
-	return 0;
+	return -ENODEV;
 }
 
 static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
-- 
2.20.1

