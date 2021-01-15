Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0272F8668
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 21:14:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHXTb0Wz3zDvYB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 07:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r4oAoo9y; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHXMV4F9DzDvXL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 07:09:26 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id c124so8462806wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qXCFwBbPWtbGR33uyQvB+16QfHJsg8zQueyUlEuj0c=;
 b=r4oAoo9yjHlPOAHenr5g1EEQfCJWwxaNTfc1ja5O6o5T1ZICU4yaeYLTltJ1ZwhWt1
 hYVV2trVas9eLp1262M7RtfrYIEz7l+5afdXAZLDAVgmpGypz488LOz8xh5YUONIahkt
 eE1JpBPouAfU6ZbgapMKocnQObleFyJlMh17sdT9uSaDfAJK1H4RLL3fR/jf1vPbZSl2
 3ZXGy84XFr6wdgvBhg4tUDvEZEEb9HvFdLNJXx4pfxdQa+bod0l65TCpu6pNojaqfRmz
 GZBTnODZc6DO9w3kWfCa8POUDB0h8esIyL2gH/Yx7pqneNMukxKM+5ngce4TNsbAFuly
 uH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qXCFwBbPWtbGR33uyQvB+16QfHJsg8zQueyUlEuj0c=;
 b=oKJ95DTyznrFl7dxYLZHJ+roTzcdVcE2FzfU6YrrZQi8OMF+dk8UW/tHCg9aE5Zox7
 LAHhw04LtC0P3BLcvKVlW4nN2KUlV1kOmJ3Yx4oPCsJckr/aeNXm5eXb+PrkDhSm3xnD
 6lmExGEgXjbFmR3oBxYfK9fnp/pDFLlXfmXTXBdLbuh2LMDc2G0WRvlvUT9bwI0EhE+J
 nNifcd7AUkQcK1YOMV2/f4xfNwsBm0oQtZMtToUt1jjOlsEJD+iY+dEDfQ3Hj1BWLOwj
 lyVBu6z53Gr1zdimRTUCClLYoeNjLoF8X12ekNgCfcrBAbyza7RcQ2mykuQi/pUuUUTr
 6Xsw==
X-Gm-Message-State: AOAM532kbfNTzWVvmHJcIOlxTQprYTLgCLe5NZUt7lH2NWUC23n9bnU9
 iYvunzHQpVt9AHskZ6GHHw5Xyg==
X-Google-Smtp-Source: ABdhPJxGn2F+giS73DFxVcuMgHRX52afEr2GWeLUY9WVozvsYAH2KsUVC7lFq4bGhVvc5fGD15RuMQ==
X-Received: by 2002:a1c:1f86:: with SMTP id
 f128mr10246918wmf.174.1610741363617; 
 Fri, 15 Jan 2021 12:09:23 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id d85sm9187863wmd.2.2021.01.15.12.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:09:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 6/7] net: ethernet: toshiba: ps3_gelic_net: Fix some
 kernel-doc misdemeanours
Date: Fri, 15 Jan 2021 20:09:04 +0000
Message-Id: <20210115200905.3470941-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200905.3470941-1-lee.jones@linaro.org>
References: <20210115200905.3470941-1-lee.jones@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geoff Levand <geoff@infradead.org>,
 linux-kernel@vger.kernel.org, Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Utz Bacher <utz.bacher@de.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 3d1fc8d2ca667..55e652624bd76 100644
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
@@ -1787,7 +1789,7 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *dev)
 	return result;
 }
 
-/**
+/*
  * ps3_gelic_driver_remove - remove a device from the control of this driver
  */
 
-- 
2.25.1

