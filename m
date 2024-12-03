Return-Path: <linuxppc-dev+bounces-3713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F89E1C75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLj0fpvz30Bk;
	Tue,  3 Dec 2024 23:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229821;
	cv=none; b=DTErNRSDkP82A0SUnFFztbTMLSjToH4ELTSJVu2mnoCE2XEjg7BWpZoX/cPTTkalPAnVe9JZ3nFj+2qhr5ik+5+Btz9ZXaRuKN729N7MuhiB+oDK3Bofh+3GRkYNwoPuFZPadxQQw7EuIRMBZR0ZhCRGFHrzlTxqB2ik6baPUXELAmcePFRtNpMKN0f9Zrg/bKORDiFmPTlBDHFU5K6ytPkGUzqmxUbg6rJHSpQ8g4eEWbcHEH5kMIH/fbNtrtnidDGIGWMvNwwt+Zdqwk8S/LH++0+uiWyH3diS8qw+bfpbciEVWBJY6v/miOVu1M140LLhev5JmbFCM614Y+H1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229821; c=relaxed/relaxed;
	bh=Y48dg3gXGpgzyZF5ZkvFdVhp7VJIaTg4ag661mUvv8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c89+ngE5RKXqgc6zvOPBRZ9x41edOetr1bcekLRPkFJlyI6ykEhZPszf13AkTlyl6jDw/24LYPFTQtg4qjoNbyGNidejr9kio4OMs66b3DGh7LnmdoFHdg5L2AL71+fcwQRD3OT9RNZCuwGNTBxgBs4NvZEz9towTTZOA9w+C40BiDEaqbLIK2iyFBnPJzdNzPujLkNAcO0sjaCSqL78DblSi6jK9DjDfadrO+4XbiwXA5jCZoznSDv1CnqJDC/fzsSFXqiHRco45Y2QNXMWW5ABnk2aOY/bXVyZtiMUV+DjtSVmFZ6PHqmgZmIIvMsZgqTtakdt44Rt46U05bT1Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BYanB+no; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BYanB+no;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLc2Rctz302f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:35 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1A57E000A;
	Tue,  3 Dec 2024 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y48dg3gXGpgzyZF5ZkvFdVhp7VJIaTg4ag661mUvv8g=;
	b=BYanB+noQx9zX34A/WMxd5icmD/vBasvKlUR86GUNpSXBGEMnMp0mSVHL8zBUb3WtcRJ5s
	XkGvhv/sDdUFMPOOFys4ibMFapn88OGMq2nnU9nZIXjt9/wV2BR29wlXbXjLTqKPiFyUrX
	rTcwNmID0cuCcYgBJPOgShZ31NI59525FJarHO3ytagYJgQYQCHSYXgjgYTWq7bWwk+3tf
	NwUfd4DzVI2WLs7S8sn/e9LtMSM94496eYT4MmJKoVR5gwG8PQHJ944TzVKMAatxXEvVBC
	06/N78lTx+wkqAp6gHmmLcHUph0qKVTnyYropTRlaCcLSsJNAPMfZ54PANGFNA==
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
	Simon Horman <horms@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 05/10] net: freescale: ucc_geth: Use the correct type to store WoL opts
Date: Tue,  3 Dec 2024 13:43:16 +0100
Message-ID: <20241203124323.155866-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
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
V3: No changes

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


