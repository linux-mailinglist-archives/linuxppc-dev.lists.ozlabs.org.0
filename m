Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29257367AFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQplZ1Qknz3bvh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:22:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhiKI19L;
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
 header.s=bombadil.20210309 header.b=nhiKI19L; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQphm1z0pz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:19:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uecr72uR4S7RBlQH3PaVDyORw5/pv2frUuL1UFgzCPE=; b=nhiKI19LhclhWHaCMD71/Cry2I
 ad6ySo/VVhMQiMubBTbcXCyyZlDNjzYbPA+tZk8BiT5hw3n0w6mKDxom0sj0rvkAgg0i1yyn8o7oo
 1WIEdVXIC6LTk0UxAy1ehak/xKXq6XQPbaGVDUPwPborS1UiEulB3qS7UESlVagzJt4QCZaO9CtEI
 fcQs+SXYcRWhy5a8sDZTyC08Ri/E79nWiQSVrG4ZiR8v9uKg/DTl1oamETbfl6gUflJKqvh2ddxOi
 BdTobsRp+kpB65cIWtJVMzOi3UY9DmsWvx7DOMlmgKmk3irvAqkEQdojJ/k//Qspi8SEXYbVYNPNh
 pTGVPpvQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTck-00DRlu-Sv; Thu, 22 Apr 2021 07:19:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 7/7] swiotlb: don't override the command line in
 swiotlb_adjust_size
Date: Thu, 22 Apr 2021 09:19:21 +0200
Message-Id: <20210422071921.1428607-8-hch@lst.de>
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

When the user specified an explicit swiotlb size on the command line,
the achitecture code should not override it.

Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87d06ddf4753f3..aef02a3825b494 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -106,7 +106,9 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return swiotlb_default_size;
+	if (swiotlb_default_size)
+		return swiotlb_default_size;
+	return IO_TLB_DEFAULT_SIZE;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
+	if (swiotlb_default_size)
+		return;
 	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
 		swiotlb_default_size >> 20);
-- 
2.30.1

