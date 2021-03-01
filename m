Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2378132788C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpspq0p2gz3dnR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NOzDrThX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=NOzDrThX; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DpslF48cnz30Qm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:46:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JFey0nQH0q27BLg8sKUeuXSyZDiQiQFLOD6BixvKeyU=; b=NOzDrThXk5sQLHtG3a7GXeBGS9
 H2XGITYrLulEacH0a8AvtD4GcR3a2s77sP1xJjnehH3ArsbGm+hD5Yg+R4px9hPi+g+Hqawj5XasA
 USCZkvxqssnycydmnC4rU9Kn3Dp7ojnB+xcinZ1+dr2f3ywKfxV6zOcD7Kwh/7lBlruP/9QUg21lZ
 FZB2z4KkS3r112xjPrzwRHn0SffHvc9LiSxaQmlgIEzvoxWUQ9A+bGnTQDUWoUtbAOlVvg3mcywgr
 5zo9Ej6FKEwbLIhTjZHYLebzvkQLYCHjA/PtqDXKiu7RlyNYJviJ7iXcpJ36kfbd/1Ijq+NNQpDOs
 QO9Tuoyw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFm-00FRDp-Lh; Mon, 01 Mar 2021 07:46:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 09/14] swiotlb: lift the double initialization protection from
 xen-swiotlb
Date: Mon,  1 Mar 2021 08:44:31 +0100
Message-Id: <20210301074436.919889-10-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
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

Lift the double initialization protection from xen-swiotlb to the core
code to avoid exposing too many swiotlb internals.  Also upgrade the
check to a warning as it should not happen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 -------
 kernel/dma/swiotlb.c      | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 1a31ddf7139799..060eeb056486f5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -172,12 +172,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
-	/*
-	 * IO TLB memory already allocated. Just use it.
-	 */
-	if (io_tlb_start != 0)
-		goto end;
-
 	/*
 	 * Get IO TLB memory from any location.
 	 */
@@ -232,7 +226,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	} else
 		rc = swiotlb_late_init_with_tbl(start, nslabs);
 
-end:
 	if (!rc)
 		swiotlb_set_max_segment(PAGE_SIZE);
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 388d9be35b5795..ebe7c123e27e52 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -229,6 +229,10 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 	unsigned long i, bytes;
 	size_t alloc_size;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
@@ -367,6 +371,10 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
 	unsigned long i, bytes;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
-- 
2.29.2

