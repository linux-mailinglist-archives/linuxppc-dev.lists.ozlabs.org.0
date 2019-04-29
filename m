Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBEE1A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:54:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t3413Wp8zDqSL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+3f5cf76c63215fb3955b+5727+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="k6XXwcfv"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t32S53JYzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 21:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IENXPLnoXusqcRveMX69IYLx+6Bv7CG1f5ec/sjff1M=; b=k6XXwcfvJKs14QwpAHSnhoBW1
 aGO/aRuD5TOGfyMDr8h4Gz3KEDQSvMqK5Ou5K7tbhNbbm3Fu8Gw8ReZKCvFO+T5GkW6pxcc8Xsvzq
 oJDgGrUwFKgqhnnvQnYtZ6XYZWqLPriWNF2duXpV9kKGaTMIBgL4DGcT4g7ubCt3/36Mu9ARTJD3u
 5TVaTYYoY2PYA/6sOnpqcX0hrs9x4dfGDO+HjAy96Qh24Oz5EDZ5P8F+qKoQtRM9TFqPzkhAMmA3Y
 YVbE90qYMrBuE+IZGRIuO2J0scJaDnpWY7e52ma0NV7iSUpghZp906mXESIg118fB+0t6CMv4hwY4
 pgnNHxB2g==;
Received: from 65-114-90-19.dia.static.qwest.net ([65.114.90.19]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL4qS-0008Fg-NM; Mon, 29 Apr 2019 11:53:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: remove the __kernel_io_end export
Date: Mon, 29 Apr 2019 06:52:41 -0500
Message-Id: <20190429115241.12621-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This export was added in this merge window, but without any actual
user, or justification for a modular user.

Fixes: a35a3c6f6065 ("powerpc/mm/hash64: Add a variable to track the end of IO mapping")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/mm/pgtable_64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 72f58c076e26..1fddc81cc682 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -96,7 +96,6 @@ unsigned long __vmalloc_end;
 EXPORT_SYMBOL(__vmalloc_end);
 unsigned long __kernel_io_start;
 EXPORT_SYMBOL(__kernel_io_start);
-unsigned long __kernel_io_end;
 EXPORT_SYMBOL(__kernel_io_end);
 struct page *vmemmap;
 EXPORT_SYMBOL(vmemmap);
-- 
2.20.1

