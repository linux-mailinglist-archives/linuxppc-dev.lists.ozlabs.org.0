Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C72141DB8C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 17:55:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ry5N0bcDzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 01:55:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=valentin.longchamp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=longchamp.me
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ry3W0JPmzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 01:53:55 +1000 (AEST)
Received: by mail-wm1-f66.google.com with SMTP id m185so3422523wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 08:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4G4wQvf4fPflZ6+ui8oysG+9GFvQgx6HsOsbxQDcOHY=;
 b=L6QKp/au/6Rzx+abXufRToMoif/KvwLGmlABlLTGzZvR0V8rwExzenWFK32eMj7CcL
 +YMW6Xn5ougKjuIonZqu50vYAUUL3IiW+0EZE2oNsVySqKvXEJVF97Wl/6RiVxwwIv77
 vk+2gcA00KgH+vvAzcN4fSROlGguV0vIkcq6i3uzVxmAjHyml9jyNptuSxTMThBA+w17
 m/po/UPEylKOTOPk9UGp2MXu4Al/29iE2ez+XFo8rxbotdZj26+WofwKdpF1MvVZCpmv
 GUx8eReLefzZoKvXTkk/+nxU/hx1fPWkLKcSqCLzhdTIEtQzaztIL4h5HRUimXoZofyO
 0hIw==
X-Gm-Message-State: AOAM530iZhCBW97J1gOb799/YucPFeyrKyNdnbyIPQ6RcQ09r+p1c5kP
 C02z/hByABZPWTPJj7ckO5e1XwmxluPnyg==
X-Google-Smtp-Source: ABdhPJxasqfC1GKUsFMB0a53nJfuYMEzDAknnYg3yuvkeIG8j9WG4srPVolnmuGumEjFDGfwuy4FKg==
X-Received: by 2002:a7b:cc92:: with SMTP id p18mr5409064wma.174.1589990031147; 
 Wed, 20 May 2020 08:53:51 -0700 (PDT)
Received: from zenbook-val.localdomain (bbcs-65-74.pub.wingo.ch. [144.2.65.74])
 by smtp.gmail.com with ESMTPSA id s11sm3216208wrp.79.2020.05.20.08.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 08:53:50 -0700 (PDT)
From: Valentin Longchamp <valentin@longchamp.me>
To: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, kuba@kernel.org,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: [PATCH] net/ethernet/freescale: rework quiesce/activate for ucc_geth
Date: Wed, 20 May 2020 17:53:50 +0200
Message-Id: <20200520155350.1372-1-valentin@longchamp.me>
X-Mailer: git-send-email 2.25.1
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
Cc: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>,
 Valentin Longchamp <valentin@longchamp.me>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ugeth_quiesce/activate are used to halt the controller when there is a
link change that requires to reconfigure the mac.

The previous implementation called netif_device_detach(). This however
causes the initial activation of the netdevice to fail precisely because
it's detached. For details, see [1].

A possible workaround was the revert of commit
net: linkwatch: add check for netdevice being present to linkwatch_do_dev
However, the check introduced in the above commit is correct and shall be
kept.

The netif_device_detach() is thus replaced with
netif_tx_stop_all_queues() that prevents any tranmission. This allows to
perform mac config change required by the link change, without detaching
the corresponding netdevice and thus not preventing its initial
activation.

[1] https://lists.openwall.net/netdev/2020/01/08/201

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
Acked-by: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6e5f6dd169b5..552e7554a9f8 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -42,6 +42,7 @@
 #include <soc/fsl/qe/ucc.h>
 #include <soc/fsl/qe/ucc_fast.h>
 #include <asm/machdep.h>
+#include <net/sch_generic.h>
 
 #include "ucc_geth.h"
 
@@ -1548,11 +1549,8 @@ static int ugeth_disable(struct ucc_geth_private *ugeth, enum comm_dir mode)
 
 static void ugeth_quiesce(struct ucc_geth_private *ugeth)
 {
-	/* Prevent any further xmits, plus detach the device. */
-	netif_device_detach(ugeth->ndev);
-
-	/* Wait for any current xmits to finish. */
-	netif_tx_disable(ugeth->ndev);
+	/* Prevent any further xmits */
+	netif_tx_stop_all_queues(ugeth->ndev);
 
 	/* Disable the interrupt to avoid NAPI rescheduling. */
 	disable_irq(ugeth->ug_info->uf_info.irq);
@@ -1565,7 +1563,10 @@ static void ugeth_activate(struct ucc_geth_private *ugeth)
 {
 	napi_enable(&ugeth->napi);
 	enable_irq(ugeth->ug_info->uf_info.irq);
-	netif_device_attach(ugeth->ndev);
+
+	/* allow to xmit again  */
+	netif_tx_wake_all_queues(ugeth->ndev);
+	__netdev_watchdog_up(ugeth->ndev);
 }
 
 /* Called every time the controller might need to be made
-- 
2.25.1

