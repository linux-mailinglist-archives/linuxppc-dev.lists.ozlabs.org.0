Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293C35168D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 18:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7Gg2wtNz2xZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 03:01:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yk7zp4/a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+78d50c468b85952dbb35+6430+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=yk7zp4/a; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB75p3VBSz3cMc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=g/lYlQLJmKIelbYGsJOMK8K3baqJu4KrHdTwHylUH98=; b=yk7zp4/a/VVy/qjNyBy+25HhKE
 M3MLuAAEGCHkhoP6K+6R5Jrd2o9QTpPa/n+D+jPbw8PfF0Hj+LlRVl4uxYQG9l3BZZ+4dc5I8r9e2
 IjqvjarJiebl1F9i4ul0iOVUIzj1oDsJXbYJ2qkBZ0gl0i5I6XA+OeaYxW2MRRFfMRRV32/ae8F5J
 dDH6vXR/maOTz6DfB53SyQcBbg8iRcUEK8qYomkv4uD4P3cJvtU6CBHm5BwRr30BFkiHIqeNzDoDA
 LbAzmQekckWvz0YH4pL5dkKd9Izu6Dwi1ld24zxZdieLRhcx6J9vWJ1Ig/OL/cF1UeinsSVUXpGco
 +Rs+TVvQ==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdr-00Ciee-IE; Thu, 01 Apr 2021 15:53:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 17/20] iommu: remove iommu_set_cmd_line_dma_api and
 iommu_cmd_line_dma_api
Date: Thu,  1 Apr 2021 17:52:53 +0200
Message-Id: <20210401155256.298656-18-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't obsfucate the trivial bit flag check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/iommu.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 58d1d11a8d5c10..052cef11ae30df 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -70,16 +70,6 @@ static const char * const iommu_group_resv_type_string[] = {
 
 #define IOMMU_CMD_LINE_DMA_API		BIT(0)
 
-static void iommu_set_cmd_line_dma_api(void)
-{
-	iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
-}
-
-static bool iommu_cmd_line_dma_api(void)
-{
-	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
-}
-
 static int iommu_alloc_default_domain(struct iommu_group *group,
 				      struct device *dev);
 static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
@@ -130,9 +120,7 @@ static const char *iommu_domain_type_str(unsigned int t)
 
 static int __init iommu_subsys_init(void)
 {
-	bool cmd_line = iommu_cmd_line_dma_api();
-
-	if (!cmd_line) {
+	if (!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API)) {
 		if (IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH))
 			iommu_set_default_passthrough(false);
 		else
@@ -146,7 +134,8 @@ static int __init iommu_subsys_init(void)
 
 	pr_info("Default domain type: %s %s\n",
 		iommu_domain_type_str(iommu_def_domain_type),
-		cmd_line ? "(set via kernel command line)" : "");
+		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
+			"(set via kernel command line)" : "");
 
 	return 0;
 }
@@ -2757,16 +2746,14 @@ EXPORT_SYMBOL_GPL(iommu_alloc_resv_region);
 void iommu_set_default_passthrough(bool cmd_line)
 {
 	if (cmd_line)
-		iommu_set_cmd_line_dma_api();
-
+		iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
 	iommu_def_domain_type = IOMMU_DOMAIN_IDENTITY;
 }
 
 void iommu_set_default_translated(bool cmd_line)
 {
 	if (cmd_line)
-		iommu_set_cmd_line_dma_api();
-
+		iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
 	iommu_def_domain_type = IOMMU_DOMAIN_DMA;
 }
 
-- 
2.30.1

