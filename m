Return-Path: <linuxppc-dev+bounces-3231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E169C8E50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44n3yMrz30RN;
	Fri, 15 Nov 2024 02:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598585;
	cv=none; b=McPmb0X83nTSSDQvN6pHfn5pUxEZH9WqxsSE8agzOasu/Tl+YJh3DBE65gtU1hWasW4aXxCQE+fwSbT/ALuXkunvuScT63uSK2YEQnDC9TzKxR46U4PcxWZbbTzSNMkfu8vsK63pxlZawC6NFc4cThpeMC5F3OVg8XUX1Ks2ShctWAcmkrX4VlSpfVthjBVwi8A4UjkLwyWp82K80zBHQRNKjROYqoZl3zXxLw33/WcL0/r+XLVnE/GbaeP7N6gHUZqDE4982vQKZfG9tZgL3cMO7EUTSTaygVx+ReIufjnWmxXXP4AAd+Z8Rn/Ow7nPDVUFu4PwzL7OD+4NgMO1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598585; c=relaxed/relaxed;
	bh=GX711hqSGvX8B43wBtgMdev5PFTCzhCgQ+es8CQApoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX2FtxDVjAf8TNlRdqrrlCVoSvmOACDlpi8StKlSp2vIWA6qk84SIqDP8K6ax0XeXkboBaUoLWiFq9adxhe13FCfNN630BwkhnoSzQTsfMncqX1BuwGpRHR7vxNnmZCvXXK6vWhVIY3a09X2G99jgrIOj5BCeskdFzplQPSgpkAqCwOm4+3MAQ7B1ijK22jRqHLWQJl6OXNTsE/3vQEym1uFyaHbs/ufMesWKXRUAW7StYUaVW9aPeUXC/iO1eWqsvi/vm45mIcxlLwwIQPVAoKpQXkvFjToiMMZLI3WhF9fR7ulE9xTR6CA9jcux/rnoNLt0IFjBd4a56P9xE/kjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QYahOLiF; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QYahOLiF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6rr8z306x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8831D1BF20B;
	Thu, 14 Nov 2024 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GX711hqSGvX8B43wBtgMdev5PFTCzhCgQ+es8CQApoM=;
	b=QYahOLiFcVLSUhzjgCAI1G1Nyic5CJH+jyEQOacbF/zwOwRNJwTmk6BiywGOyNptPyp0XB
	HL9bskRPwMaPJFqHvvyR8d4ZWfJAxRN+bEx/Ihsf5h2QjKlcPlFxEYcXdfb3yQtXXxvttw
	/sQy7i0zLdf2AIRLGKidrsiApliygkWFL8uDsy34cZ2a5APN7sq+9S/RemVjH6uPXHUodk
	hcCtMMNJ7PTerj4mCUzhkEgNIqMhBsHBlCoUuh84yvRqsbxo2f9Zn7ISf7Nk3KToGHo3a4
	OLeG2K4xIkZOalQTXG6kYHLxgvU+xUUhtLdTGVHLCpF8IhvP6Lst69AQ5TBSHg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 05/10] net: freescale: ucc_geth: Use the correct type to store WoL opts
Date: Thu, 14 Nov 2024 16:35:56 +0100
Message-ID: <20241114153603.307872-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
References: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The WoL opts are represented through a bitmask stored in a u32. As this
mask is copied as-is in the driver, make sure we use the exact same type
to store them internally.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: New patch

 drivers/net/ethernet/freescale/ucc_geth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index e08cfc8d8904..60fd804a616a 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -1216,7 +1216,7 @@ struct ucc_geth_private {
 	int oldspeed;
 	int oldduplex;
 	int oldlink;
-	int wol_en;
+	u32 wol_en;
 	u32 phy_wol_en;
 
 	struct device_node *node;
-- 
2.47.0


