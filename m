Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E24246324
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:20:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVT6s5GhTzDq8x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mVxdCAml; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRwW26PHzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:51 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r11so7851353pfl.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3SmzZTvbfXannYWzT1vvdfD+eue2ti3PQmFQt1sGqfI=;
 b=mVxdCAmlrwsYQJZWYKoyLuTHqKET9xgnJHVg1b42wEWATRvgN28vjs+9yxPGjjBj3q
 +BiTp1jESGn24Bvj7NdntB1gnuMTn62rZA4PSbpZd50xaRScVHCvIcGK1CGMN+NYrofh
 Zekg7tIE6a7JaiyzGOp+nzfFogg3zuhdg4c42EsDm26wgB0apPiElsclleFZiMioqKfD
 VwjM710zSNPJtu0FfHP/jI89WSWw0coLa+WZmZoA8uVe7Mwp7bvOcum3capp11m8AWJb
 3/0K3H9ZhgQY1g0rj9s7ZxkyHWX3iaCNd+wsx8X4cWxiC8OJPL7q43XkcFApldAcZDcZ
 9mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3SmzZTvbfXannYWzT1vvdfD+eue2ti3PQmFQt1sGqfI=;
 b=FQXIYjHlcbpJF5TlmHgg0/qIwbPFpR/GuoDZqyNRT6FGHdxgmIbOejEk1UKUhBGL/y
 B3mtbeqiplVa96CWhdncnP122fnhJsgwK/M3NAc9NrGC4WKZQLJ6yTQ/xLDlXJamWZR0
 ERnofsJ+NCVvu10frmXjiOcXjbjjOUPWW6Sme2TiY6apFd2McOTCrimq4no+Uua7A0HN
 9Firw8LeuAc5+d6dT7fXgFWZ6X67o1uzaKRMWg50daHcyjZjTY78LIdhAYN/TaJh1aFQ
 +y0mWZO04cFIBvIIyYcyA62+NDADJHxFZl8Y4n7uCq3yVpkwrEnjMc6CGjaCmAOx8K+Y
 3fgA==
X-Gm-Message-State: AOAM530RqJ/jLyMeLbl39t19lqJuMQWZHN1f5tw+Bt1Wf02NmS7CFuMb
 cb6Hg0h45rlTWxtU1WHNyd4=
X-Google-Smtp-Source: ABdhPJye0HaIKIHr1tF33YyLaOR04c2pC3AzFAUznRzYhHDdY6IPyjwJWo+RevYkvnDPWaqS7Tie5A==
X-Received: by 2002:aa7:9d04:: with SMTP id k4mr10414244pfp.256.1597652808813; 
 Mon, 17 Aug 2020 01:26:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:26:48 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 19/20] ethernet: silan: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:33 +0530
Message-Id: <20200817082434.21176-21-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817082434.21176-1-allen.lkml@gmail.com>
References: <20200817082434.21176-1-allen.lkml@gmail.com>
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
Cc: keescook@chromium.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 oss-drivers@netronome.com, Romain Perier <romain.perier@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-acenic@sunsite.dk,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/silan/sc92031.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/silan/sc92031.c b/drivers/net/ethernet/silan/sc92031.c
index f94078f8ebe5..8d56eca5be17 100644
--- a/drivers/net/ethernet/silan/sc92031.c
+++ b/drivers/net/ethernet/silan/sc92031.c
@@ -829,10 +829,11 @@ static void _sc92031_link_tasklet(struct net_device *dev)
 	}
 }
 
-static void sc92031_tasklet(unsigned long data)
+static void sc92031_tasklet(struct tasklet_struct *t)
 {
-	struct net_device *dev = (struct net_device *)data;
-	struct sc92031_priv *priv = netdev_priv(dev);
+	struct  sc92031_priv *priv = from_tasklet(priv, t, tasklet);
+	struct net_device *dev = (struct net_device *)((char *)priv -
+				ALIGN(sizeof(struct net_device), NETDEV_ALIGN));
 	void __iomem *port_base = priv->port_base;
 	u32 intr_status, intr_mask;
 
@@ -1108,7 +1109,7 @@ static void sc92031_poll_controller(struct net_device *dev)
 
 	disable_irq(irq);
 	if (sc92031_interrupt(irq, dev) != IRQ_NONE)
-		sc92031_tasklet((unsigned long)dev);
+		sc92031_tasklet(&priv->tasklet);
 	enable_irq(irq);
 }
 #endif
@@ -1446,7 +1447,7 @@ static int sc92031_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	spin_lock_init(&priv->lock);
 	priv->port_base = port_base;
 	priv->pdev = pdev;
-	tasklet_init(&priv->tasklet, sc92031_tasklet, (unsigned long)dev);
+	tasklet_setup(&priv->tasklet, sc92031_tasklet);
 	/* Fudge tasklet count so the call to sc92031_enable_interrupts at
 	 * sc92031_open will work correctly */
 	tasklet_disable_nosync(&priv->tasklet);
-- 
2.17.1

