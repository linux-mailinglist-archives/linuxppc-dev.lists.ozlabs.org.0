Return-Path: <linuxppc-dev+bounces-4621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF34A0065E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:01:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPcxq4Pdlz305X;
	Fri,  3 Jan 2025 20:01:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:1800:120:4::f00:11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735894879;
	cv=none; b=f6jevg3kSHHODEnKD2DGJ9r93UBROG3/Eu+jEvdOr9NtftHpKU7NhdxaiNwTuw8J0P/olw0JyAWemfFea1nLYBato4YKjMIf2xokTLYxvGCvmQa5NsrcUqz/wpEOybjeBe+TC12WPLzGmj1eA903MVhcbBz4yd6OMNQgTw27M/FT1wYWkq28y7mPOGSp5kkfrpL8VpMcPWMLmtoQrIWdVzR6DdFDXgEZx4P67xeXt30H1J+FZCCGG5QmohrigSovCS8Gwif5QBp+8CGmrimCSWWnjIYNSTdzRid8jxl7qzXazYfu8BqivkJmbr5l5iUpJH0Wtl+8UKnOeZM5R5/BgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735894879; c=relaxed/relaxed;
	bh=SKL4idae1g5ol4k6Oxap66nNQJ2+KtIReKFnmO50W2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feK5/FZ+mUnAlx0V5vJjGJlb31CW1ZPdT1GmZK5H0ShpP4KMqg1cyI+HG71Js23uJJXAVWQbMuRd7d+2b/mr26CcjYAk01vwtOarsJQr2Qq4NBlqdFyP0/Q5gDkwAOcgH7LPBborsgAct7mgEgYmybaaJv/kTFwrXsTI4bOk95tku2T0TvMkumZvxKjFxuzJ8UAGWo7P5kCQCPKDIAJxESIXTz5Z+sGRG/UkDLG9awGJ57PjqTxuoLedHcv5bJ/6mtM6XzpIfTu2YiCYZZPMX86kSVAVT4kEe/0HODnL1KRJrUfmZFiTxg8C/5LdPoyxnJGJOEaI0VW9dssbIUly+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 567 seconds by postgrey-1.37 at boromir; Fri, 03 Jan 2025 20:01:17 AEDT
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPcxn4ytwz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:01:16 +1100 (AEDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4YPckW6P2xz4x4j0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 09:51:31 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:f66e:bd3:be87:168a])
	by baptiste.telenet-ops.be with cmsmtp
	id wYrW2D0070t5JgF01YrW6B; Fri, 03 Jan 2025 09:51:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tTdOy-00000001dmc-20mH;
	Fri, 03 Jan 2025 09:51:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tTdP0-0000000CaCA-1Cum;
	Fri, 03 Jan 2025 09:51:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Christoph Hellwig <hch@lst.de>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Geoff Levand <geoff@infradead.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ps3disk: Do not use dev->bounce_size before it is set
Date: Fri,  3 Jan 2025 09:51:25 +0100
Message-ID: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

dev->bounce_size is only initialized after it is used to set the queue
limits.  Fix this by using BOUNCE_SIZE instead.

Fixes: a7f18b74dbe17162 ("ps3disk: pass queue_limits to blk_mq_alloc_disk")
Reported-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Closes: https://lore.kernel.org/39256db9-3d73-4e86-a49b-300dfd670212@gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Guessed based on the reported bad commit ID.
Compile-tested only.
---
 drivers/block/ps3disk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index 68fed46c463e5aa9..dc9e4a14b8854587 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -384,9 +384,9 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	unsigned int devidx;
 	struct queue_limits lim = {
 		.logical_block_size	= dev->blk_size,
-		.max_hw_sectors		= dev->bounce_size >> 9,
+		.max_hw_sectors		= BOUNCE_SIZE >> 9,
 		.max_segments		= -1,
-		.max_segment_size	= dev->bounce_size,
+		.max_segment_size	= BOUNCE_SIZE,
 		.dma_alignment		= dev->blk_size - 1,
 		.features		= BLK_FEAT_WRITE_CACHE |
 					  BLK_FEAT_ROTATIONAL,
-- 
2.43.0


