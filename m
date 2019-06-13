Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C84347D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:09:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PdGK264qzDqCk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.45; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
X-Greylist: delayed 450 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Jun 2019 19:07:41 AEST
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdDY4dwNzDrFS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:07:40 +1000 (AEST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 45Pd3j69cczMrsly
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:00:01 +0200 (CEST)
Received: from ramsan ([84.194.111.163])
 by baptiste.telenet-ops.be with bizsmtp
 id Q8zU2000G3XaVaC018zV7m; Thu, 13 Jun 2019 10:59:55 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hbLZw-0000Wz-Fs; Thu, 13 Jun 2019 10:59:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hbKBT-0003Vp-Fd; Thu, 13 Jun 2019 09:30:07 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jim Paris <jim@jtan.com>, Geoff Levand <geoff@infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH] block/ps3vram: Use %llu to format sector_t after LBDAF removal
Date: Thu, 13 Jun 2019 09:30:06 +0200
Message-Id: <20190613073006.13459-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The removal of CONFIG_LBDAF changed the type of sector_t from "unsigned
long" to "u64" aka "unsigned long long" on 64-bit platforms, leading to
a compiler warning regression:

    drivers/block/ps3vram.c: In function ‘ps3vram_probe’:
    drivers/block/ps3vram.c:770:23: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘sector_t {aka long long unsigned int}’ [-Wformat=]

Fix this by using "%llu" instead.

Fixes: 72deb455b5ec619f ("block: remove CONFIG_LBDAF")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/block/ps3vram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 4c7f51b1eda94727..4628e1a27a2b7133 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -767,7 +767,7 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 	strlcpy(gendisk->disk_name, DEVICE_NAME, sizeof(gendisk->disk_name));
 	set_capacity(gendisk, priv->size >> 9);
 
-	dev_info(&dev->core, "%s: Using %lu MiB of GPU memory\n",
+	dev_info(&dev->core, "%s: Using %llu MiB of GPU memory\n",
 		 gendisk->disk_name, get_capacity(gendisk) >> 11);
 
 	device_add_disk(&dev->core, gendisk, NULL);
-- 
2.17.1

