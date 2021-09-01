Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C56673FE476
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 23:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0GjM5FGtz2yV5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QJ5f7z+O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=QJ5f7z+O; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Gh44y9fz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 07:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IGHq/zn5r0bFrYNjymK6TXitnBNWw/sSmMius/3bC28=; b=QJ5f7z+OE61XbaAFEq2U1l3Fy5
 isECM2X2glqEsQygexTtwsU+FK7Kt84fO215nlhGmSeWEI8dkR2nsYBSiGZK08xLI2twc3NKJqT2G
 tlfuVts2g2QyCw4NnqeKp/wOFcfV+Sz4Bzi6gXdFivWnL6aMy8353RHitW8wCEkycmFh75epy6Ctt
 LfGR8Kp9UwI6AWO1+faElk5/zNZd/vZs+DO1PKNj7uUoUZxeHW6hF6BRT2gQ+UJ6qtXOslVC5o42W
 bmXviV3Vo/btQqMLp60lRhz4FjceTB0NZAeSA90keRnPgHRwEBix15hO9W5kToBJRw7Ig9IqkrXZQ
 mxVoHhMg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLXLR-007LW7-Bq; Wed, 01 Sep 2021 21:00:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH 03/10] ps3disk: add error handling support for add_disk()
Date: Wed,  1 Sep 2021 14:00:21 -0700
Message-Id: <20210901210028.1750956-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901210028.1750956-1-mcgrof@kernel.org>
References: <20210901210028.1750956-1-mcgrof@kernel.org>
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/ps3disk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index 8d51efbe045d..3054adf77460 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -467,9 +467,13 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 		 gendisk->disk_name, priv->model, priv->raw_capacity >> 11,
 		 get_capacity(gendisk) >> 11);
 
-	device_add_disk(&dev->sbd.core, gendisk, NULL);
-	return 0;
+	error = device_add_disk(&dev->sbd.core, gendisk, NULL);
+	if (error)
+		goto fail_cleanup_disk;
 
+	return 0;
+fail_cleanup_disk:
+	blk_cleanup_disk(gendisk);
 fail_free_tag_set:
 	blk_mq_free_tag_set(&priv->tag_set);
 fail_teardown:
-- 
2.30.2

