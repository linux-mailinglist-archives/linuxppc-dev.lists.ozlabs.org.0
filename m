Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A40327889
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:48:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpsnp6MJXz3dcX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:48:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZdtJkSTQ;
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
 header.s=casper.20170209 header.b=ZdtJkSTQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpsl403gBz3d3G
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:46:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=n4a5R9+ylbvoibBv9Gp4RRSzd949UJhfH+kdgUzXMIA=; b=ZdtJkSTQoBpw/cdu0C97cG13/n
 hnkW6A3RrPzYaXlCcieHyhVXiP8MF2ep7TS+aJyf3GZe66+xpZWgToyCzgiH5ydTo5cY6SWeh6gSp
 eWAP2epI/P5SHOeCxT2yVEQus8aSEgI/HaWdf01Lw1tEj/ySKW/4yU6vt8dK7QexOzT/AK9BnwVJQ
 vkWA9I7c0R9uCfQWQvxfOa4meVFZhWV8w/VdbMi/iGnvdTMEwEiaN3spsgAGnkyV0mYLo6Wst8PQ4
 lqZEwHRsz0EIbqJE4HY4ZT1Oxo8rFdW+q5SvmOCXv0E3WMX1TpKxeP8ykm/dSx13AmIi0JJJusybs
 1oZ+I7pA==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFa-00FRD5-OZ; Mon, 01 Mar 2021 07:45:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 07/14] xen-swiotlb: remove xen_set_nslabs
Date: Mon,  1 Mar 2021 08:44:29 +0100
Message-Id: <20210301074436.919889-8-hch@lst.de>
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

The xen_set_nslabs function is a little weird, as it has just one
caller, that caller passes a global variable as the argument,
which is then overriden in the function and a derivative of it
returned.  Just add a cpp symbol for the default size using a readable
constant and open code the remaining three lines in the caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e99f0614dcb979..5352655432e724 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -138,16 +138,6 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 	} while (i < nslabs);
 	return 0;
 }
-static unsigned long xen_set_nslabs(unsigned long nr_tbl)
-{
-	if (!nr_tbl) {
-		xen_io_tlb_nslabs = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
-		xen_io_tlb_nslabs = ALIGN(xen_io_tlb_nslabs, IO_TLB_SEGSIZE);
-	} else
-		xen_io_tlb_nslabs = nr_tbl;
-
-	return xen_io_tlb_nslabs << IO_TLB_SHIFT;
-}
 
 enum xen_swiotlb_err {
 	XEN_SWIOTLB_UNKNOWN = 0,
@@ -170,6 +160,9 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 	}
 	return "";
 }
+
+#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
+
 int __ref xen_swiotlb_init(int verbose, bool early)
 {
 	unsigned long bytes, order;
@@ -179,8 +172,10 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 
 	xen_io_tlb_nslabs = swiotlb_nr_tbl();
 retry:
-	bytes = xen_set_nslabs(xen_io_tlb_nslabs);
-	order = get_order(xen_io_tlb_nslabs << IO_TLB_SHIFT);
+	if (!xen_io_tlb_nslabs)
+		xen_io_tlb_nslabs = DEFAULT_NSLABS;
+	bytes = xen_io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(bytes);
 
 	/*
 	 * IO TLB memory already allocated. Just use it.
-- 
2.29.2

