Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE69030E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:28:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+Tee0si;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyxzC66jJz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+Tee0si;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxnx5sgxz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:20:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Lo072dU2QpGVh/xLHOL31dXMwicRfcSfRIC85i+l4AM=; b=L+Tee0sieKd6J7cvbELhlhVaks
	LPgpuWpIZFicteZRDgauMdYkEwQiZlmV5XX+JbDB3vC4m0KJjDG5bevXe1oDrF7Jlfr+LBmHklh7Z
	M40vIFh7OGGJJuWxvhSfZOjx5DnhPxo/8ZdarjapcrQwl0gEEF0aMgeR7GX/Vza1VeumjCpiApl3p
	PLelqO46Phs6ttgR0xqN2LNDZRODEhHCY/W5L7HCIbxlf4xUJx7pMbuzHT/BrilnMkwuSzhiCHprb
	3j9JgyMjfS6K9KPGvRSqyYB7cH/3qG08T81bWKh0w5UA9xhwkAnTEMljKkuADRwOj/NUqNEybtjm0
	nk5ysDdw==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvQ-00000007R5I-2gcI;
	Tue, 11 Jun 2024 05:20:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/26] block: freeze the queue in queue_attr_store
Date: Tue, 11 Jun 2024 07:19:11 +0200
Message-ID: <20240611051929.513387-12-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

queue_attr_store updates attributes used to control generating I/O, and
can cause malformed bios if changed with I/O in flight.  Freeze the queue
in common code instead of adding it to almost every attribute.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c    | 5 +++--
 block/blk-sysfs.c | 9 ++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 0d4cd39c3d25da..58b0d6c7cc34d6 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4631,13 +4631,15 @@ int blk_mq_update_nr_requests(struct request_queue *q, unsigned int nr)
 	int ret;
 	unsigned long i;
 
+	if (WARN_ON_ONCE(!q->mq_freeze_depth))
+		return -EINVAL;
+
 	if (!set)
 		return -EINVAL;
 
 	if (q->nr_requests == nr)
 		return 0;
 
-	blk_mq_freeze_queue(q);
 	blk_mq_quiesce_queue(q);
 
 	ret = 0;
@@ -4671,7 +4673,6 @@ int blk_mq_update_nr_requests(struct request_queue *q, unsigned int nr)
 	}
 
 	blk_mq_unquiesce_queue(q);
-	blk_mq_unfreeze_queue(q);
 
 	return ret;
 }
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index f0f9314ab65c61..5c787965b7d09e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -189,12 +189,9 @@ static ssize_t queue_discard_max_store(struct request_queue *q,
 	if ((max_discard_bytes >> SECTOR_SHIFT) > UINT_MAX)
 		return -EINVAL;
 
-	blk_mq_freeze_queue(q);
 	lim = queue_limits_start_update(q);
 	lim.max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
 	err = queue_limits_commit_update(q, &lim);
-	blk_mq_unfreeze_queue(q);
-
 	if (err)
 		return err;
 	return ret;
@@ -241,11 +238,9 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
 	if (ret < 0)
 		return ret;
 
-	blk_mq_freeze_queue(q);
 	lim = queue_limits_start_update(q);
 	lim.max_user_sectors = max_sectors_kb << 1;
 	err = queue_limits_commit_update(q, &lim);
-	blk_mq_unfreeze_queue(q);
 	if (err)
 		return err;
 	return ret;
@@ -585,13 +580,11 @@ static ssize_t queue_wb_lat_store(struct request_queue *q, const char *page,
 	 * ends up either enabling or disabling wbt completely. We can't
 	 * have IO inflight if that happens.
 	 */
-	blk_mq_freeze_queue(q);
 	blk_mq_quiesce_queue(q);
 
 	wbt_set_min_lat(q, val);
 
 	blk_mq_unquiesce_queue(q);
-	blk_mq_unfreeze_queue(q);
 
 	return count;
 }
@@ -722,9 +715,11 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (!entry->store)
 		return -EIO;
 
+	blk_mq_freeze_queue(q);
 	mutex_lock(&q->sysfs_lock);
 	res = entry->store(q, page, length);
 	mutex_unlock(&q->sysfs_lock);
+	blk_mq_unfreeze_queue(q);
 	return res;
 }
 
-- 
2.43.0

