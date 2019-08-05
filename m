Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655781570
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 11:27:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462C8w6D2wzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 19:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+eb0d39f7aff6b72dc178+5825+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="BnCU6qOa"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462BqY5rn6zDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 19:12:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MC0YAzXDv4UW9aVepSWPET61pXC/qRZc/Q3SPMyp+PQ=; b=BnCU6qOapxKxAiOYshoyO0Pn42
 xqlgYlEAswW2CCDXcDvEHUmDLhQqCFIi0ELw0LxvatqpGEl0+HtpTMhstvk64Klhas3C3RpR3GbAk
 p0Er1aGH/ojYTgIUNRrXmwx72gkxjm7RMwmzzAgppKLW8ExOnTd4fpidg3bXjozKpuPrBgHQMC3Iy
 mgrTFGLaU+oqCIKb+dP1XcMbBmewkR7ra/p6CUfZub0a/0/rOmi0OHjyzvoE/9oOiXk1ACJ6/Y84m
 Fb8ST6DCMzHeeEtysG9MTm0XswA0C3NrSu293IgfRJ+QVYPrtqQVmoM6HXC+UBf+cZfGTuR9r6eTU
 ZpksCIGg==;
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1huZ2P-00052F-37; Mon, 05 Aug 2019 09:12:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/7] m68knommu: add a pgprot_noncached stub
Date: Mon,  5 Aug 2019 12:11:57 +0300
Message-Id: <20190805091159.7826-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805091159.7826-1-hch@lst.de>
References: <20190805091159.7826-1-hch@lst.de>
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide a pgprot_noncached like all the other nommu ports so that
common code can rely on it being able to be present.  Note that this is
generally code that is not actually run on nommu, but at least we can
avoid nasty ifdefs by having a stub.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/pgtable_no.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index fc3a96c77bd8..06194c7ba151 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -29,6 +29,8 @@
 #define PAGE_READONLY	__pgprot(0)
 #define PAGE_KERNEL	__pgprot(0)
 
+#define pgprot_noncached(prot)   (prot)
+
 extern void paging_init(void);
 #define swapper_pg_dir ((pgd_t *) 0)
 
-- 
2.20.1

