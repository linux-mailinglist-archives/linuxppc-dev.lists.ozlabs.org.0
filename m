Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6085E3D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 17:57:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G6y2XApx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg2Ww4sPyz3dVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 03:57:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G6y2XApx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg2W42pVBz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 03:57:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A19F6144B;
	Wed, 21 Feb 2024 16:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2284BC433F1;
	Wed, 21 Feb 2024 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708534620;
	bh=fKXceB0Gk5Qi2BTh8FnrZ+MT+hE3FOYlCf2QUIU2XXQ=;
	h=From:Date:Subject:To:Cc:From;
	b=G6y2XApxOSs9SZl79EQohPRj/X5MpyJELyXCc2UtgTxkX488zdh7HWdDR+lyX0unX
	 CUJ3F7ZZbY3Vx2bdoT0jpYzMKE1H9IUANbSkmtC/wtbJFE8gw5IkjPu/GucJ+ibf6Y
	 88tDFcattShPJ7M6gdeISV3hDqCuzLs2iKAmubTOYAxlgjmAHL/Ure//BNYZT+JXVD
	 ugZUI3LvAbt5KssDhcPEKqu2br9DI5l/QW1EVY8L8rhcEEHlMg48HzlCALNApQfYyt
	 gpH+W9lLfViXuIrXKtO70sqLRd5E8bI/RFu4RbsPzbktT1Gd1Ec0M0V2ZPWQjOfv8F
	 NCve65P6JPhpA==
From: Simon Horman <horms@kernel.org>
Date: Wed, 21 Feb 2024 16:56:47 +0000
Subject: [PATCH RFC net] ps3/gelic: Fix possible NULL pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE4r1mUC/x2MQQqDMBQFrxL+2g9JWkTcCh7ArXRhk6d+CFESW
 wri3RtczsDMSRlJkKlVJyV8JcsWC5hKkVunuIDFFyar7VNba3jPD14QxHH8hMAeCTM32ji42jS
 Tf1NJ9yLld29HGvpORRz0uq4/qOxVpW8AAAA=
To: Geoff Levand <geoff@infradead.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.3
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
Cc: Jeff Garzik <jeff@garzik.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix possible NULL pointer dereference in gelic_card_release_tx_chain()

The cited commit introduced a netdev variable to
gelic_card_release_tx_chain() which is set unconditionally on each
iteration of a for loop.

It is set to the value of tx_chain->tail->skb->dev.  However, in some
cases it is assumed that tx_chain->tail->skb may be NULL. And if that
occurs, setting netdev will cause a NULl pointer dereference.

Given the age of this code I do wonder if this can occur in practice.
But to be on the safe side this patch assumes that it can and aims to
avoid the dereference in the case where tx_chain->tail->skb may be NULL.

Flagged by Smatch.
Compile tested only.

Fixes: 589866f9f1cb ("PS3: gelic: Add support for dual network interface")
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index d5b75af163d3..f03489799f5d 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -549,14 +549,13 @@ static void gelic_card_release_tx_chain(struct gelic_card *card, int stop)
 {
 	struct gelic_descr_chain *tx_chain;
 	enum gelic_descr_dma_status status;
-	struct net_device *netdev;
 	int release = 0;
 
 	for (tx_chain = &card->tx_chain;
 	     tx_chain->head != tx_chain->tail && tx_chain->tail;
 	     tx_chain->tail = tx_chain->tail->next) {
 		status = gelic_descr_get_status(tx_chain->tail);
-		netdev = tx_chain->tail->skb->dev;
+
 		switch (status) {
 		case GELIC_DESCR_DMA_RESPONSE_ERROR:
 		case GELIC_DESCR_DMA_PROTECTION_ERROR:
@@ -566,11 +565,14 @@ static void gelic_card_release_tx_chain(struct gelic_card *card, int stop)
 					 "%s: forcing end of tx descriptor " \
 					 "with status %x\n",
 					 __func__, status);
-			netdev->stats.tx_dropped++;
+			tx_chain->tail->skb->dev->stats.tx_dropped++;
 			break;
 
 		case GELIC_DESCR_DMA_COMPLETE:
 			if (tx_chain->tail->skb) {
+				struct net_device *netdev;
+
+				netdev = tx_chain->tail->skb->dev;
 				netdev->stats.tx_packets++;
 				netdev->stats.tx_bytes +=
 					tx_chain->tail->skb->len;

