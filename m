Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E23125FE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 17:24:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYZHY1hS6zDws7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 03:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+661ee30cee4f8a507613+6377+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=f8tMOfWQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYYyc3Lg7zDsqL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 03:10:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=II87lVlVi39N4h2hDH/RczH9V+xrUdtPsM3lWkdXNMw=; b=f8tMOfWQPN+aI2qzvJbaH14hPP
 zUj0n8mdP6winTuA7Ld5imaXHoukB6enEo6lpPJY+gbSl/jdcrgT44RWZQn/fvkyEITRM+o9or5eu
 42eQVAHxivLfAwJv+PiXGneSRGScJivDXMw3UpV/vAFaBWvOxesQIxEHKndOLafA+pwX+pN3A8fvZ
 kRU7PMlUyNuF99RbDyJsfWPFAbPrlpVxKVJHEDHbNnO4liTGTjj/Xg8BXtv5tSYchEQJT2//eY8SE
 PUZCpnQwbq8lfxC2xYn6xNbU/fxFrjtoq/ILQmud6M79thxiPQrjFHkq1boJ0lxkXWSaDjtq13XNN
 9tvDIyrQ==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mdD-004top-Qm; Sun, 07 Feb 2021 16:09:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 8/8] xen-swiotlb: remove the unused size argument from
 xen_swiotlb_fixup
Date: Sun,  7 Feb 2021 17:09:34 +0100
Message-Id: <20210207160934.2955931-9-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b2d9e77059bf5a..621a20c1143597 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,8 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int
-xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int i, rc;
 	int dma_bits;
@@ -195,7 +194,7 @@ int __ref xen_swiotlb_init(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
@@ -243,7 +242,7 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
 		if (repeat--) {
-- 
2.29.2

