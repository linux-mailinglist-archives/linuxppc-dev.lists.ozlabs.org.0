Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE83125F4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 17:19:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYZ9R4G76zDwtC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 03:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+661ee30cee4f8a507613+6377+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=fmNr0Ugb; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYYyW3GkKzDvVZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 03:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9exQlU2bM+z89vz4InpfIN+OgEoSYW+vKDhpQvUzWEc=; b=fmNr0UgbkUNuM/6xYoYIl1Rrvu
 NjXGGNO7rb6ADI6vT40u/zONLvuSngV72/jHsqgPSgPdAN+wEUDyiIdoRTVpEZmLqJSlRXchWUKGA
 eluKXm1mFdJJn++1DfZvR2YO+X0JUshTE3gzwf6gjtlHNPTzbVGePGmIGFxgBXOxNKJfI1KkyC2Pb
 nMwmcXMNzuG2JOFRxdZzeeKNS4HQwVd/0Q/gujMYFOHIZXrOk3w8PuAmWcqmAE1DUqnlU6d7QuM6s
 o+Kwv+YAPHNTcLEXNvfSe7Cnz+d04XyeVlR7knzJwEz+D3x/VVO20+JVl3mfPkAXYtMUG2hKTNqpL
 Zvtma1Pw==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md9-004tnJ-Fd; Sun, 07 Feb 2021 16:09:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 6/8] swiotlb: lift the double initialization protection from
 xen-swiotlb
Date: Sun,  7 Feb 2021 17:09:32 +0100
Message-Id: <20210207160934.2955931-7-hch@lst.de>
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

Lift the double initialization protection from xen-swiotlb to the core
code to avoid exposing too many swiotlb internals.  Also upgrade the
check to a warning as it should not happen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 -------
 kernel/dma/swiotlb.c      | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 6e0f2c5ecd1a2f..e6c8556e879ee6 100644
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
index adcc3c87e10078..a3737961ae5769 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -224,6 +224,10 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 	unsigned long i, bytes;
 	size_t alloc_size;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
@@ -355,6 +359,10 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
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

