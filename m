Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804916775C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 08:48:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0hzt32N2z3c8N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 18:48:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwTty7r5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+5f321fda403eaa454d38+7092+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwTty7r5;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0hys0Pnzz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 18:47:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bzz7JaksZDKcHo94Mdn5kYAvotNtBXiOtl7bTdgyn8s=; b=bwTty7r5OnHPaCKqAKUl3UjVx7
	+pkpYjcBDVigQXzRVHqVZrf5dxK0oD28Y8M5BDwqUypSvYFb8EMMD3DAFePOX5D0DE+CDtaPz0GQN
	grNYFIqMmYBZearBWaCMHLC6gRZgTCCWp2J1o09N54mAPg3RYZaxUolowTmggy2EoeKAfc0qqPkbw
	ux8mESha8aILcbFpDQ0kqX8KUI12+Na1zSUpuJgpUQcP1v2rezKif9qlMlsvt3nvlbuTTgEAyIf3u
	8uzt0F3wUoGuQzR9q114Vkgktq5W7lsiu/23T3i0zdMej6l0Ylf+H82Hj1Tc5c05r3wKUQ8Lks/Uo
	R4ZHjwCg==;
Received: from [2001:4bb8:19a:27af:cb3f:eabc:1c16:9756] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrY2-00GGmS-7s; Mon, 23 Jan 2023 07:47:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: jim@jtan.com,
	geoff@infradead.org
Subject: [PATCH] ps3vram: remove bio splitting
Date: Mon, 23 Jan 2023 08:47:18 +0100
Message-Id: <20230123074718.57951-1-hch@lst.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ps3vram iterates over the bio one segment, that is page aligned and max
page sized chunk, a time.  Because of that there is no point in
calling bio_split_to_limits, or explicitly setting the default limits
that are only used by bio_split_to_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3vram.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 574e470b220b09..38d42af01b2535 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -586,10 +586,6 @@ static void ps3vram_submit_bio(struct bio *bio)
 
 	dev_dbg(&dev->core, "%s\n", __func__);
 
-	bio = bio_split_to_limits(bio);
-	if (!bio)
-		return;
-
 	spin_lock_irq(&priv->lock);
 	busy = !bio_list_empty(&priv->list);
 	bio_list_add(&priv->list, bio);
@@ -749,9 +745,6 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 	gendisk->private_data = dev;
 	strscpy(gendisk->disk_name, DEVICE_NAME, sizeof(gendisk->disk_name));
 	set_capacity(gendisk, priv->size >> 9);
-	blk_queue_max_segments(gendisk->queue, BLK_MAX_SEGMENTS);
-	blk_queue_max_segment_size(gendisk->queue, BLK_MAX_SEGMENT_SIZE);
-	blk_queue_max_hw_sectors(gendisk->queue, BLK_SAFE_MAX_SECTORS);
 
 	dev_info(&dev->core, "%s: Using %llu MiB of GPU memory\n",
 		 gendisk->disk_name, get_capacity(gendisk) >> 11);
-- 
2.39.0

