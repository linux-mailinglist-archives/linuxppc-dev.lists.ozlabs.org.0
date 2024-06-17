Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FC90A428
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:08:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oscIs4jc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fZw0Tqlz3d24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oscIs4jc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fWn6vFnz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:05:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cnf/orgh7i7JukB+LIEJmlRlmvoKMDy94ZJrgGiWZn4=; b=oscIs4jcLQ/H/pIAIEcWRH1UuJ
	5LK/eSZ6W2JZDMCo6nnFviBb4mblJSzVsLNO6B8HAOMmp+qeHzTjN84X8LIW4TpX/7W7LZvbQP5qY
	KZx1IFTMn4rG9QGAEP/ThwOA5gLnIpjk10jpqIzyjW2xAxk1Q75bvwh2qR37kybtmDDuOl9LWL/2L
	5iBEGRVoKvGz072Rd8EEYyPo/8bJMPddmN9YCXh6tUKUU6wy9u20KOoHYnVdWP+UVcDmz9hWB2YH9
	5G7EkdlW/vrVtcRRBnJu/EV4+SB6/p1HGwYyTkPiwfojrOSi/XCbUhunIOn419hT1qlQ33GLsMNSm
	jEJV60cA==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Uw-00000009IFz-1jkT;
	Mon, 17 Jun 2024 06:05:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/26] loop: stop using loop_reconfigure_limits in __loop_clr_fd
Date: Mon, 17 Jun 2024 08:04:31 +0200
Message-ID: <20240617060532.127975-5-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__loop_clr_fd wants to clear all settings on the device.  Prepare for
moving more settings into the block limits by open coding
loop_reconfigure_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/block/loop.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 93780f41646b75..fd671028fa8554 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1133,6 +1133,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 
 static void __loop_clr_fd(struct loop_device *lo, bool release)
 {
+	struct queue_limits lim;
 	struct file *filp;
 	gfp_t gfp = lo->old_gfp_mask;
 
@@ -1156,7 +1157,14 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	lo->lo_offset = 0;
 	lo->lo_sizelimit = 0;
 	memset(lo->lo_file_name, 0, LO_NAME_SIZE);
-	loop_reconfigure_limits(lo, 512, false);
+
+	/* reset the block size to the default */
+	lim = queue_limits_start_update(lo->lo_queue);
+	lim.logical_block_size = SECTOR_SIZE;
+	lim.physical_block_size = SECTOR_SIZE;
+	lim.io_min = SECTOR_SIZE;
+	queue_limits_commit_update(lo->lo_queue, &lim);
+
 	invalidate_disk(lo->lo_disk);
 	loop_sysfs_exit(lo);
 	/* let user-space know about this change */
-- 
2.43.0

