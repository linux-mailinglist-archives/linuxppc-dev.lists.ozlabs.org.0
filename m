Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FE3125F6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 17:21:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYZCS2SDtzDwsB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 03:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+661ee30cee4f8a507613+6377+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=PzcY4sAI; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYYyT33StzDsSm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 03:09:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jFI2mi7dyRl0KQwCReup9amZMDdC7KVLA5/jiqTUJgc=; b=PzcY4sAIeTkV30mNeSR7f4zhev
 1l86naI/SQcUf0zOFqJq4KJw5/8N1oMJjS8yNc/Z8ehT98TCXfbqC0yQIJkU5+vzsX2EJcA7lqXnD
 inxtjszyQ9sK7lZOffjVlwnAIPOGvXzlMpup2gQRm/SVMpF6REFiaCeA3V36wmiPskUOOwbKs2f2/
 Bh9N0vS73XhuuqKUlQtGemY4mIiM6twaFuU0N84w1IvGRIOriBPhiyre+OW/45YumEnkat66MuvVP
 iZjwGsedAM5O6qFZcTy0pBe4gMYLXotX3BJJucUjweYhEXiYYk6TIHHM3R2KLkGXZDkHwdJsP3F08
 DtFINz5Q==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md1-004tmA-Lk; Sun, 07 Feb 2021 16:09:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 2/8] xen-swiotlb: use is_swiotlb_buffer in
 is_xen_swiotlb_buffer
Date: Sun,  7 Feb 2021 17:09:28 +0100
Message-Id: <20210207160934.2955931-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the is_swiotlb_buffer to check if a physical address is
a swiotlb buffer.  This works because xen-swiotlb does use the
same buffer as the main swiotlb code, and xen_io_tlb_{start,end}
are just the addresses for it that went through phys_to_virt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99cb..a4026822a889f7 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -111,10 +111,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * have the same virtual address as another address
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
-	if (pfn_valid(PFN_DOWN(paddr))) {
-		return paddr >= virt_to_phys(xen_io_tlb_start) &&
-		       paddr < virt_to_phys(xen_io_tlb_end);
-	}
+	if (pfn_valid(PFN_DOWN(paddr)))
+		return is_swiotlb_buffer(paddr);
 	return 0;
 }
 
-- 
2.29.2

