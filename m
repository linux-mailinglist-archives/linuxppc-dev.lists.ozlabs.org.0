Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96820DCB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:21:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wf5Q4Q2dzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:21:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0d14f5278154a06d8b22+6154+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=nNXRBgZr; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBC53dgzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=N4V7c3aeDLuwhXVBAMVeI93XDU7dFLU/PzjjNBBA1go=; b=nNXRBgZrqUkYW06bN7kMVbhKQp
 BlmpXSCdMbqb/Ht5wWHvxJtfrr6svKWFTv8Tt4Ufg7qxppL3ei3dqO9x299z4vDWrKj32a6zAcqSL
 c4m4m8EqDQLV0obdwyzZum4rarDYDeASDBA573D5k0a3dJQxVCiz704FT+VKkYMJLXypm1xf73cB3
 AgGiAVOZh9k2lYQfWMzILfco++St1B3KjzFapwCHMQbwuELGSHYTtoro2+hJ5y8/MWUZ1ZK+LwL5b
 lBJH3BSbHoqbKdPThJr9UKdZ7VxtYLq5743jYblBgF7pRDOkMgWA5lO9m/s8jN+8qpJjWKBSVdf/p
 NcNA9Tjw==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzdP-0004KD-Bf; Mon, 29 Jun 2020 19:40:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/20] fs: remove a weird comment in submit_bh_wbc
Date: Mon, 29 Jun 2020 21:39:38 +0200
Message-Id: <20200629193947.2705954-12-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All bios can get remapped if submitted to partitions.  No need to
comment on that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 64fe82ec65ff1f..2725ebbcfdc246 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3040,12 +3040,7 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	if (test_set_buffer_req(bh) && (op == REQ_OP_WRITE))
 		clear_buffer_write_io_error(bh);
 
-	/*
-	 * from here on down, it's all bio -- do the initial mapping,
-	 * submit_bio -> generic_make_request may further map this bio around
-	 */
 	bio = bio_alloc(GFP_NOIO, 1);
-
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_write_hint = write_hint;
-- 
2.26.2

