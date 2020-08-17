Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D0246224
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:10:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSvN1z8yzDqLX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XNx3Kz/k; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRw40wlqzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:28 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so7455083pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Df7yxK//cmVxvAkf6cXduXiAsh32H2X5cVsb6K8GHGM=;
 b=XNx3Kz/kSLSRc7VTJus4z7RYdORZ86+CFl9HXiWO+FTTDyVpTDjj3setW6Q8pT38mh
 NmOs1/ct0cRXsbBeRTwvx4W1afRcRX6p+G7YG0U9cG5hRYgnLqPpAHCICNeXp8/3MONy
 Xb3t+Azgude6qcZ6sxW9JZsKZzsk9pUn+LymdgQuENerjmXXr6xtfYbelZuiw41dEIdz
 P0wXQ2PtBLxCES+dmV6SBamPReFvL3SyU1HWQp3U4mxHPklRPF+So6pXcy8/wvv8Fb3R
 /UdfL3Ca2orJ4GrTPiExKanCPWj2W3yP+gt/KsqbHMJLz7Lpae2Pp5SYue11557317bf
 LDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Df7yxK//cmVxvAkf6cXduXiAsh32H2X5cVsb6K8GHGM=;
 b=e9zkYkWQmrfpxgJAWYotXvwk2NoHV0tm3GDhFQuCCBuFRB/A/zGq4aKaLWZrHwU7+Q
 QFkhGqTc3NKTh52bjwDiryPEQ1Jkf+TNmiIBjihk2Dbp/oeOiUdm/zSsO6ave2adUCbz
 YDX5fldR4d4b+1fXxLmrNVb/ock2NsTew9SXTyKMwukeSwT0CVPRBB4Q2ISywvn6uwfc
 j5OCH5SvMWc/hade4m6V8XXZqJQ7JHDPJtGbXTatQf9ldSH1U1hmh5/9ubA+nEMQnIW9
 rjjO7TvwpdcvrlntqQtT4n3MUXd7m3DZvuVcQWzDJWjKfJR56bEwLQ6XQGZgJ8kpOGGZ
 31ag==
X-Gm-Message-State: AOAM532MbgMJ0u3DTtqPsWPON94e1EH3sfiJL6BshQGXBj1bp2PtDRDk
 kDfSLX8PsQsdCrfmiHeb9R4=
X-Google-Smtp-Source: ABdhPJy25qZkwLdPxae9MaYOKgL9LadrOvMoVqZOA4GCkZihBoxS6mmIhsQz13i9lJFXT11QTvGjjQ==
X-Received: by 2002:a17:902:264:: with SMTP id
 91mr10638591plc.88.1597652785215; 
 Mon, 17 Aug 2020 01:26:25 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:26:24 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 15/20] ethernet: natsemi: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:29 +0530
Message-Id: <20200817082434.21176-17-allen.lkml@gmail.com>
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
 drivers/net/ethernet/natsemi/ns83820.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 8e24c7acf79b..9157c1bffc79 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -923,10 +923,10 @@ static void rx_irq(struct net_device *ndev)
 	spin_unlock_irqrestore(&info->lock, flags);
 }
 
-static void rx_action(unsigned long _dev)
+static void rx_action(struct tasklet_struct *t)
 {
-	struct net_device *ndev = (void *)_dev;
-	struct ns83820 *dev = PRIV(ndev);
+	struct ns83820 *dev = from_tasklet(dev, t, rx_tasklet);
+	struct net_device *ndev = dev->ndev;
 	rx_irq(ndev);
 	writel(ihr, dev->base + IHR);
 
@@ -1927,7 +1927,7 @@ static int ns83820_init_one(struct pci_dev *pci_dev,
 	SET_NETDEV_DEV(ndev, &pci_dev->dev);
 
 	INIT_WORK(&dev->tq_refill, queue_refill);
-	tasklet_init(&dev->rx_tasklet, rx_action, (unsigned long)ndev);
+	tasklet_setup(&dev->rx_tasklet, rx_action);
 
 	err = pci_enable_device(pci_dev);
 	if (err) {
-- 
2.17.1

