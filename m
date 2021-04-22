Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CC367AF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpkf6d9zz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OYuuEeJv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=OYuuEeJv; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQphk72Fxz3bp8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:19:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dYyH/8K4Q8sCxeRfrx+sXZtnFZXl8dFeAAsbGjqR53E=; b=OYuuEeJvdRaOhc/KxZZh+gdgIc
 Pp/EPZXmB/fYLLqsRz/c0KwUZj/GOo1pdbdH6soycjs2KejEXIVJNZ7tQ+lf9O/LsH+jTFSSDOzZd
 t+gxtZRNuq7rxDeh6ySTt1AVSqrH2MQViV22MbxnRmy068+lzX+O0JLxqXQH/5IrHfRCI5qY6KpdA
 kaiQpAzWqDtiwzjkobuFUj9pclIHoEBzbD+b8LiqZ2sMabrUaOwnYHY7zIP1d8+0eoimCFxhiNNI9
 fJTUcQe8yUYVqIZp8UrHTvtUKr17zjKQySXJ4neE19YZy4WQ85r+8TPO/CfTvbmt0vZI1mUJDDUES
 tQclwPXQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcd-00DRlK-3P; Thu, 22 Apr 2021 07:19:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 4/7] powerpc/pseries: simplify svm_swiotlb_init
Date: Thu, 22 Apr 2021 09:19:18 +0200
Message-Id: <20210422071921.1428607-5-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The value returned by swiotlb_size_or_default is always properly
aligned now, so don't duplicate the work.

Signed-off-by: Christoph Hellwig <hch@lst.de>dddd
---
 arch/powerpc/platforms/pseries/svm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 4d281ff56ce96f..9187d2a1ed568d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -43,20 +43,14 @@ machine_early_initcall(pseries, init_svm);
  */
 void __init svm_swiotlb_init(void)
 {
+	unsigned long bytes = swiotlb_size_or_default();
 	unsigned char *vstart;
-	unsigned long bytes, io_tlb_nslabs;
-
-	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
-
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (vstart && !swiotlb_init_with_tbl(vstart, bytes, false))
 		return;
 
-	memblock_free_early(__pa(vstart),
-			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	memblock_free_early(__pa(vstart), PAGE_ALIGN(bytes));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.30.1

