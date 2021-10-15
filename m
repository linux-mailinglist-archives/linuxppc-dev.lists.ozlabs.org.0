Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A99B42FF51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWNb86M0Bz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 11:01:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3DuD+nt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=d3DuD+nt; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWNPc6jv3z3c97
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 10:53:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=omBKsWTl8Q/WM0k3AiOvEAjN+m9JDz574ka/nFE6G1U=; b=d3DuD+ntkjsX5wdLWBQUee/Kd4
 Ka8WmB4Njz7ZuaQfe42890YC5Ei+XlqIQYf4otyg27DZOBzEGweA/XIOCjKPda0mlZIzkM7zD/S89
 iRhbQwv0j63NfvXxDgtGtbzvfUTCh27v8rZE+AF0P6syYrDRfKVk9jlkvpepJhtdx6+Jm1HCpnzga
 j2DB1Xq9POr6uTmUluGCTwaiWICaNRsoR0OOUh3SceEzWf+EyVjAqPcSSSigfoLZxnBoBvzU3+Qbq
 r8FvoHNO6DLtHVeHtR3K3mezUwJnnmY7WWf9Llyug1fVocMzeKBs7pTKHfPacFnLhenLwBhkZDZgh
 toPZ4UoQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWzt-009C3A-7r; Fri, 15 Oct 2021 23:52:21 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, geoff@infradead.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jim@jtan.com,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me
Subject: [PATCH 08/13] zram: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:52:14 -0700
Message-Id: <20211015235219.2191207-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/zram/zram_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 0a9309a2ef54..bdbded107e6b 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1983,7 +1983,9 @@ static int zram_add(void)
 		blk_queue_max_write_zeroes_sectors(zram->disk->queue, UINT_MAX);
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, zram->disk->queue);
-	device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
+	ret = device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
+	if (ret)
+		goto out_cleanup_disk;
 
 	strlcpy(zram->compressor, default_compressor, sizeof(zram->compressor));
 
@@ -1991,6 +1993,8 @@ static int zram_add(void)
 	pr_info("Added device: %s\n", zram->disk->disk_name);
 	return device_id;
 
+out_cleanup_disk:
+	blk_cleanup_disk(zram->disk);
 out_free_idr:
 	idr_remove(&zram_index_idr, device_id);
 out_free_dev:
-- 
2.30.2

