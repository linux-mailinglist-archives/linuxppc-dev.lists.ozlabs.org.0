Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF13D419F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWh0Z4W10z3f1m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:35:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=Bcd3IcSe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=Bcd3IcSe; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgwM69d7z30G9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:31:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3Y/EBek/77bRSOMW6NKmiwAy53SikS7N9aTgrNx2rSI=; b=Bcd3IcSel4pjzciAYNv4/5UtBY
 ZShpwYodIgs6PYfDdLeIkXw5glr9AlHEbfemMRYBLobcYhGF0Sp08Sat7ScpPYYZjx8MJiLk4IdfL
 w4ym7AOYCODRQOWkdFPj1Euz3kcnvwieWbyuLUd+8HgaC+JYacT1BZayn9bxsKDiy4Kjbf2aIvYmc
 eQb2us4+p5Q0Za00pTeAFHo4z4bn/RJCUxg8rdL077Gr5j3ZlaKCKXNPetSgb9F2tp9OE6HIUbTWY
 5E4IhxNH0dzI3/ogQixzgw0kwG3/fjOIWCD0I+pMQghdn5B7f1G8BvJDy5PvWapEAkUfPSW8AnPDQ
 jpVQQ9Fg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m71pk-009Bix-1m; Fri, 23 Jul 2021 20:31:48 +0000
Message-Id: <5634f7c76a67345c9735e05b68228ea899a8bf9d.1627068552.git.geoff@infradead.org>
In-Reply-To: <cover.1627068552.git.geoff@infradead.org>
References: <cover.1627068552.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 24 Jul 2021 13:02:14 -0700
Subject: [PATCH v4 09/10] net/ps3_gelic: Add new routine gelic_work_to_card
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 23 Jul 2021 20:31:48 +0000
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new helper routine gelic_work_to_card that converts a work_struct
to a gelic_card.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 60fcca5d20dd..42f4de9ad5fe 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -1420,6 +1420,11 @@ static const struct ethtool_ops gelic_ether_ethtool_ops = {
 	.set_link_ksettings = gelic_ether_set_link_ksettings,
 };
 
+static struct gelic_card *gelic_work_to_card(struct work_struct *work)
+{
+	return container_of(work, struct gelic_card, tx_timeout_task);
+}
+
 /**
  * gelic_net_tx_timeout_task - task scheduled by the watchdog timeout
  * function (to be called not under interrupt status)
@@ -1429,8 +1434,7 @@ static const struct ethtool_ops gelic_ether_ethtool_ops = {
  */
 static void gelic_net_tx_timeout_task(struct work_struct *work)
 {
-	struct gelic_card *card =
-		container_of(work, struct gelic_card, tx_timeout_task);
+	struct gelic_card *card = gelic_work_to_card(work);
 	struct net_device *netdev = card->netdev[GELIC_PORT_ETHERNET_0];
 	struct device *dev = ctodev(card);
 
-- 
2.25.1


