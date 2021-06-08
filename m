Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD839FC1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwGk299Bz3dnV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:11:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TR8lLAOI;
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
 header.s=bombadil.20210309 header.b=TR8lLAOI; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw9J2RnMz3070
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:07:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6el1Xjjuiwoh8C5GaeWua1PePuQ0zzIn1YY3WglnD2c=; b=TR8lLAOIS9zH3xVLWrYC1kGQrQ
 ROk7bhb2bZD5SH4f4/jWv+orQvUCu6O+IRXa+J1jUD/m3jLMXUaQRfWEpokNpQbnjhRiIwrZHPhX6
 mqTDg9EtUknw9+BRv3LMGaqTsoxZhj6anyleI8mez0H3rWdl6zeyQDKehV8SibcXYZxQqh1dJ45aP
 UrqbSNBFeSgMNn0L6wpo2G+b2mh2BiPBZpG7hA/S6gnshZkSIGD2I8luNyDg08Lb/CIZKzo9Cj3Uv
 twQB+yNrgflXuc4Ljp/nn/sL7L63WlwyhGpoeS7NAtisM+UES6NDhs5DFfhoHGgpwUw38okU/c+L4
 KtOKoViA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFa-009RjP-Qy; Tue, 08 Jun 2021 16:06:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/16] block: use memcpy_to_bvec in copy_to_high_bio_irq
Date: Tue,  8 Jun 2021 18:05:59 +0200
Message-Id: <20210608160603.1535935-13-hch@lst.de>
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

Use memcpy_to_bvec instead of opencoding the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bounce.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/block/bounce.c b/block/bounce.c
index 94081e013c58..a2fc6326b6c9 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -67,18 +67,6 @@ static __init int init_emergency_pool(void)
 
 __initcall(init_emergency_pool);
 
-/*
- * highmem version, map in to vec
- */
-static void bounce_copy_vec(struct bio_vec *to, unsigned char *vfrom)
-{
-	unsigned char *vto;
-
-	vto = kmap_atomic(to->bv_page);
-	memcpy(vto + to->bv_offset, vfrom, to->bv_len);
-	kunmap_atomic(vto);
-}
-
 /*
  * Simple bounce buffer support for highmem pages. Depending on the
  * queue gfp mask set, *to may or may not be a highmem page. kmap it
@@ -107,7 +95,7 @@ static void copy_to_high_bio_irq(struct bio *to, struct bio *from)
 			vfrom = page_address(fromvec.bv_page) +
 				tovec.bv_offset;
 
-			bounce_copy_vec(&tovec, vfrom);
+			memcpy_to_bvec(&tovec, vfrom);
 			flush_dcache_page(tovec.bv_page);
 		}
 		bio_advance_iter(from, &from_iter, tovec.bv_len);
-- 
2.30.2

