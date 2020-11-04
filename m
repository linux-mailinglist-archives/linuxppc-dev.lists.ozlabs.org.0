Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19B2A6059
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:12:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR1Bl5Cv7zDqbG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:12:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aFbXdi65; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR1403mh2zDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:06:40 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id k18so1581618wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 01:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTJOzm0gZUliIM1CJNEOWqPKlNYApXefDQfPPtC85HY=;
 b=aFbXdi65yd82soGVwLmvy7Zkj7puzP3tlWDEpJLWKc6c3ovAsCy4j2MSROqTyeZJ44
 K3tFlhh2YKybamQbocQs3KrJ1LfviUXKeMTiECQGyLQ2qHlSjksyYKaAoueAPNnV1IJC
 dQ2OE3GNaBV80sNaITRjXJxUEN5P5qIctgwgz90nTKDpYdqCvOqQlB8brj+HVoUtTKPh
 3FuLxpHRaeB7RsZwRtQV4LjCJNOGE5i7hPdqP5zg0aihpaepjdSj3RrJVrP8VpZce9o7
 c3qfZFbIGc0TuGqp/ukXo/pVH1VXuLEBY4pO2x+y2NNDZPyDXAJ+DqazP8r2s/pWe6tk
 5qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTJOzm0gZUliIM1CJNEOWqPKlNYApXefDQfPPtC85HY=;
 b=eLgRC3zXtQnbr0QgXRKoQHSCSPhlhzzDV28lv3sKIR5I/XqjELcdJqIVp2kSQibPrM
 XlCexWN3cBy+wNsIhqRJ9ZGQtmEWWqoc9t+wfFzsRbni489metyUJtvEb+z9otS+QYtr
 PACgxytuaQFdcwUOseHUKO5ea2R2ISncoFXa+pDmMmFq95hpptwu/OlSs396ArQR46Fg
 sf1tiXihjJjOQ3ff1Vj0rziRsNZC3Ro1YXfdLqDt8MQgAcV9rStw+jGR5f4IyuEPbQ9p
 C6LH6KEeMq2N//rH1kwqnUEVKF/hc78BZGoCXKdkGKdJEXqF2OvIc9AJKtp5YsbFKY7o
 dUmg==
X-Gm-Message-State: AOAM531UsHdk2cFW2crcuHzZBcV7t7uYp9VJud0S23KBp76FaHsvAyRm
 Axjf+jWFAxtJP/noP3osdfCAFg==
X-Google-Smtp-Source: ABdhPJxBaA6Bp7PvuVjNkKD5jYF3dYv7+JL6snqExRkG7etBcqIuE/SBL8AemuDBsSRPuujgMPj9kw==
X-Received: by 2002:a1c:1b85:: with SMTP id b127mr3591594wmb.163.1604480796423; 
 Wed, 04 Nov 2020 01:06:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 10/12] net: ethernet: toshiba: ps3_gelic_net: Fix some
 kernel-doc misdemeanours
Date: Wed,  4 Nov 2020 09:06:08 +0000
Message-Id: <20201104090610.1446616-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104090610.1446616-1-lee.jones@linaro.org>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
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
Cc: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Utz Bacher <utz.bacher@de.ibm.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1107: warning: Function parameter or member 'irq' not described in 'gelic_card_interrupt'
 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1107: warning: Function parameter or member 'ptr' not described in 'gelic_card_interrupt'
 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1407: warning: Function parameter or member 'txqueue' not described in 'gelic_net_tx_timeout'
 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1439: warning: Function parameter or member 'napi' not described in 'gelic_ether_setup_netdev_ops'
 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1639: warning: Function parameter or member 'dev' not described in 'ps3_gelic_driver_probe'
 drivers/net/ethernet/toshiba/ps3_gelic_net.c:1795: warning: Function parameter or member 'dev' not described in 'ps3_gelic_driver_remove'

Cc: Geoff Levand <geoff@infradead.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Utz Bacher <utz.bacher@de.ibm.com>
Cc: Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
Cc: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index d9a5722f561b5..f886e23f8ed0a 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -1100,7 +1100,7 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
 	return packets_done;
 }
 
-/**
+/*
  * gelic_card_interrupt - event handler for gelic_net
  */
 static irqreturn_t gelic_card_interrupt(int irq, void *ptr)
@@ -1400,6 +1400,7 @@ static void gelic_net_tx_timeout_task(struct work_struct *work)
 /**
  * gelic_net_tx_timeout - called when the tx timeout watchdog kicks in.
  * @netdev: interface device structure
+ * @txqueue: unused
  *
  * called, if tx hangs. Schedules a task that resets the interface
  */
@@ -1431,6 +1432,7 @@ static const struct net_device_ops gelic_netdevice_ops = {
 /**
  * gelic_ether_setup_netdev_ops - initialization of net_device operations
  * @netdev: net_device structure
+ * @napi: napi structure
  *
  * fills out function pointers in the net_device structure
  */
@@ -1632,7 +1634,7 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 	dev_info(ctodev(card), "internal vlan %s\n",
 		 card->vlan_required? "enabled" : "disabled");
 }
-/**
+/*
  * ps3_gelic_driver_probe - add a device to the control of this driver
  */
 static int ps3_gelic_driver_probe(struct ps3_system_bus_device *dev)
@@ -1787,10 +1789,9 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *dev)
 	return result;
 }
 
-/**
+/*
  * ps3_gelic_driver_remove - remove a device from the control of this driver
  */
-
 static int ps3_gelic_driver_remove(struct ps3_system_bus_device *dev)
 {
 	struct gelic_card *card = ps3_system_bus_get_drvdata(dev);
-- 
2.25.1

