Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E742FF4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:59:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWNY02pTJz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0i4mMLZD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=0i4mMLZD; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWNPX1mg7z306l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 10:53:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OEudjQURI1tjI6DN2XbbpoNvfS6WRIGCcJ/ZL9K/jW0=; b=0i4mMLZDva/pK7opYP5oiPP3fv
 rQ5uBC0tGPAZX1/i/6SCFM7QhjhhhwAbuLFbiv/1f5wb0lapDOFHvxZvxtSMncixscY8/BqQSkmHR
 bKufKXpomn+5Yt6hm7SI2U9JkzvsrqfhY87yB6+iGoFmOvdJBFKy++RKFa2jbpnEvtU/qeCq8RCeX
 E1A3LHGJOU8cUFmZUHPIFWQtnl8JnCheJuo9YAIxyhYZ8WZAAsNq9omJMDUKNdlNj8ckazv7XBMVp
 mh+OlppW3pioNclIkbHstsm1EwaGp1IDGWQEb8jm1JZqdCFS8tbGBnG1UoMmly0+bewl7yE/bHwXJ
 s5LUHtJQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWzt-009C3L-EQ; Fri, 15 Oct 2021 23:52:21 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, geoff@infradead.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jim@jtan.com,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me
Subject: [PATCH 13/13] mtd/ubi/block: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:52:19 -0700
Message-Id: <20211015235219.2191207-14-mcgrof@kernel.org>
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
 drivers/mtd/ubi/block.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index e003b4b44ffa..062e6c2c45f5 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -447,12 +447,18 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	list_add_tail(&dev->list, &ubiblock_devices);
 
 	/* Must be the last step: anyone can call file ops from now on */
-	add_disk(dev->gd);
+	ret = add_disk(dev->gd);
+	if (ret)
+		goto out_destroy_wq;
+
 	dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
 		 dev->ubi_num, dev->vol_id, vi->name);
 	mutex_unlock(&devices_mutex);
 	return 0;
 
+out_destroy_wq:
+	list_del(&dev->list);
+	destroy_workqueue(dev->wq);
 out_remove_minor:
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
 out_cleanup_disk:
-- 
2.30.2

