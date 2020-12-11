Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FC2D7245
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 09:53:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csl206HvhzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 19:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.helo=cstnet.cn
 (client-ip=159.226.251.25; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Csl0K4THdzDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 19:52:17 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-05 (Coremail) with SMTP id zQCowAD39Hg+M9NfCkMDAA--.10772S2;
 Fri, 11 Dec 2020 16:52:15 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: pantelis.antoniou@gmail.com, davem@davemloft.net, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] net: ethernet: fs-enet: remove casting dma_alloc_coherent
Date: Fri, 11 Dec 2020 08:52:12 +0000
Message-Id: <20201211085212.85457-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAD39Hg+M9NfCkMDAA--.10772S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw15CFWrWFyUJry5KrWfZrb_yoWfZwc_ur
 srZFn7Ww4UJryFyw48KrW3Zr929FZ0va1rZF1vgayaqr9Fvrn5W34UZr1fXF13ur48uFZ8
 Zwnxtry3A345KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUxb4SUUUUU
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkHA10Te1Xx+wAAsh
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove casting the values returned by dma_alloc_coherent.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index 99fe2c210d0f..3ae345676e50 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -131,7 +131,7 @@ static int allocate_bd(struct net_device *dev)
 	struct fs_enet_private *fep = netdev_priv(dev);
 	const struct fs_platform_info *fpi = fep->fpi;
 
-	fep->ring_base = (void __force __iomem *)dma_alloc_coherent(fep->dev,
+	fep->ring_base = dma_alloc_coherent(fep->dev,
 					    (fpi->tx_ring + fpi->rx_ring) *
 					    sizeof(cbd_t), &fep->ring_mem_addr,
 					    GFP_KERNEL);
-- 
2.17.1

