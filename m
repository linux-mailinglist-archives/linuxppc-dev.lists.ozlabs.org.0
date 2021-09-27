Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FA41A235
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 00:04:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJGrR1RlGz2yx9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 08:04:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVxD3MPj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=NVxD3MPj; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJGpM56Syz2xtN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/A8e3Exryf4rtAKubPoSRx9wLwUWPXr7luyCqYD7TXw=; b=NVxD3MPjpa4aY2uSH+ULAlbmYg
 993HhkfEKXhQxHad1WhE1EGBovwbh/SSumqunkuEBuxraHGz6PwfxGrqZGsb3wSzDFOStCeUu5hI1
 jq/eUaHteXK72R8AY7dr+Gk3FMdgCm6DHaityKUOTZxVgIg2CYL2J5weTOCk8nzowdtTwATQWLaz8
 ShfH3PUPfdZSPhzidZfzomCoz6HYhK+PPvd6qqOjjHfzGO39fVGA4NKqWXpV0A6D09NUraWkjJrZt
 QWp+Od6UBE8exAHPbFVCLO4bc/2zoOTSE+RKt1Qa7JdEzsw1V29/IkZWuS44WaPJxpVHfWsP2T6mL
 RYC22D4A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhC-004UJT-HL; Mon, 27 Sep 2021 22:01:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH v2 05/10] rnbd: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:01:52 -0700
Message-Id: <20210927220157.1069658-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220157.1069658-1-mcgrof@kernel.org>
References: <20210927220157.1069658-1-mcgrof@kernel.org>
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

Acked-by: Jack Wang <jinpu.wang@ionos.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/rnbd/rnbd-clt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index bd4a41afbbfc..1ba1c868535a 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1384,8 +1384,10 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
 	blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
 }
 
-static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
+static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 {
+	int err;
+
 	dev->gd->major		= rnbd_client_major;
 	dev->gd->first_minor	= idx << RNBD_PART_BITS;
 	dev->gd->minors		= 1 << RNBD_PART_BITS;
@@ -1410,7 +1412,11 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 
 	if (!dev->rotational)
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, dev->queue);
-	add_disk(dev->gd);
+	err = add_disk(dev->gd);
+	if (err)
+		blk_cleanup_disk(dev->gd);
+
+	return err;
 }
 
 static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
@@ -1426,8 +1432,7 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
 	rnbd_init_mq_hw_queues(dev);
 
 	setup_request_queue(dev);
-	rnbd_clt_setup_gen_disk(dev, idx);
-	return 0;
+	return rnbd_clt_setup_gen_disk(dev, idx);
 }
 
 static struct rnbd_clt_dev *init_dev(struct rnbd_clt_session *sess,
-- 
2.30.2

