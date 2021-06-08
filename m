Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F319E39FC16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwFr3GkSz3dh5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:10:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Txr96xyI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+20703f0a86d9058a1f86+6498+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=Txr96xyI; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw9B5TZSz3btf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:06:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=C48nWYMntBNCb294th9G4NnV3ael3h9v9Uxu/7DKsAQ=; b=Txr96xyI42l6bWgyhy/NfFLZ7p
 wI6xYLpds+hPhxaTrtgNxZnsiJneyFLimCdskXsnDubCkPriAk27NWsJax9LORtsrDWA2C3GA/6xN
 602wRe7RkZl1rmEzH+1/GncJAEJdfVch+jWMYDYmFMLh1ZGElSIhVT05QXchMevqH55gtDpet5Eez
 5bhhZtmLhLjFJt41xezRVJSCSlZDzbfRO3vmIyigiuRspPpiyPum814CZmYg1wFQdl8OGjwNlZB36
 YrsO9Ox/qF+JmneH2jgu1KoL2bAn/rnXh8B2EVk5sfns8NtGDYfL80iuCGjM/E/MPfGxkZGekLkLW
 evxV+uGg==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFU-009Rhp-30; Tue, 08 Jun 2021 16:06:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/16] block: remove bvec_kmap_irq and bvec_kunmap_irq
Date: Tue,  8 Jun 2021 18:05:57 +0200
Message-Id: <20210608160603.1535935-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These two helpers are entirely unused now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bio.h | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index a0b4cfdf62a4..169b14b10c16 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -5,7 +5,6 @@
 #ifndef __LINUX_BIO_H
 #define __LINUX_BIO_H
 
-#include <linux/highmem.h>
 #include <linux/mempool.h>
 #include <linux/ioprio.h>
 /* struct bio, bio_vec and BIO_* flags are defined in blk_types.h */
@@ -523,47 +522,6 @@ static inline void bio_clone_blkg_association(struct bio *dst,
 					      struct bio *src) { }
 #endif	/* CONFIG_BLK_CGROUP */
 
-#ifdef CONFIG_HIGHMEM
-/*
- * remember never ever reenable interrupts between a bvec_kmap_irq and
- * bvec_kunmap_irq!
- */
-static inline char *bvec_kmap_irq(struct bio_vec *bvec, unsigned long *flags)
-{
-	unsigned long addr;
-
-	/*
-	 * might not be a highmem page, but the preempt/irq count
-	 * balancing is a lot nicer this way
-	 */
-	local_irq_save(*flags);
-	addr = (unsigned long) kmap_atomic(bvec->bv_page);
-
-	BUG_ON(addr & ~PAGE_MASK);
-
-	return (char *) addr + bvec->bv_offset;
-}
-
-static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
-{
-	unsigned long ptr = (unsigned long) buffer & PAGE_MASK;
-
-	kunmap_atomic((void *) ptr);
-	local_irq_restore(*flags);
-}
-
-#else
-static inline char *bvec_kmap_irq(struct bio_vec *bvec, unsigned long *flags)
-{
-	return page_address(bvec->bv_page) + bvec->bv_offset;
-}
-
-static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
-{
-	*flags = 0;
-}
-#endif
-
 /*
  * BIO list management for use by remapping drivers (e.g. DM or MD) and loop.
  *
-- 
2.30.2

