Return-Path: <linuxppc-dev+bounces-3225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924B9C8E48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44k44VTz2yxY;
	Fri, 15 Nov 2024 02:36:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598582;
	cv=none; b=hSQNeQYXt/UcnU39A9mCv3t6Y0nfBFnIHioWxAwhkidWevho02U+VUlRAE/QNbpnKRUHFciNAPsublv+e0fHOqPhzhPF4YiueLmJoRVIUVyItvOkSeKYoTNhahT3dIpWrVNDk1lNlvFP/xQRK0sAKLvQJ2IZ2EPsPTjSPUi+PDMfwwlosECgvZNN+sgzEqQKtmWub5HcBJX5vrHU+LagSHuwrLBQPJy/W9It5LZIdlvIQ0+IoZobnWx3xuoHD35c1gXHGpLg6xngQSZqDAdVoHM1/udp8Ys37tKJl9owW3GjBy4iZmb+h762CJqVIVViiQTYZMhS6SKhN5lmr/x50g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598582; c=relaxed/relaxed;
	bh=VlbPUfJTfjR4el0/XaLK036mk95ZItSTahQIOW8fAxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lp3RFwyo+m1aGkC3dkLQqd66SwGaL6EA0/kQHpDm/HERMG4O7FyujVZvYH+orgjWcqHV8eHci6iqYbD/CjD0RzofT3tFK4363CM44hYLO0r7jyFuE7c0p/SRklAkb6ngrsVW4eTJYRdiXFZjkvoQ7qhS4UyQsia0hUog6C7LV33W5CT40SAyBfUStn0RA3wjy6ih3RCfV3qOtkvDG01WP6SyG9+EwzBCHJ7Hz3xwHq1jXVHJLjxSI6vNgC2qlOtFq06l2IiXik4d8YiDGxXjzvQiWfGzGw7kvSBla6PmooPvZCAbknA9MzZMjKN/CTANWytiw270Zq8QnP6wb6g8uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PHgxnqys; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PHgxnqys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6CcJz304C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24C0B1BF203;
	Thu, 14 Nov 2024 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VlbPUfJTfjR4el0/XaLK036mk95ZItSTahQIOW8fAxM=;
	b=PHgxnqysattdywIh3LkhH4IdLjGjtYzbCWoX6xdldJ0v8MyWWWJMgIM2ruBo7MdD9V+DaF
	+uBJcnFSXJORpsWiUXXThqd0TVhJ/XWRNLxHq5kWlQfulJKy+eulflir2FhPVarvD+gjcl
	Y/WutCDBGl4NGwbUGgi6J9vzHmjOqTXpq7lyHE9Ifd25idaLfriMDmjepJEoMVtH1zVeLq
	fpWUjLfPG9ZCK3n0AfhDh7lFt0eXHuEsZkg0HSvFjCUU0RV6MeRqU1KFKvKx1lpfdyVlCL
	q/wze7B415Q4j0h1NoOuOQi3RJ8xinVrQ+j8UxIE57nG5ae8VFujlN1gv1SO3g==
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
Subject: [PATCH net-next v2 00/10] net: freescale: ucc_geth: Phylink conversion
Date: Thu, 14 Nov 2024 16:35:51 +0100
Message-ID: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
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

Hello everyone,

This is V2 of the ucc_geth phylink conversion.

There were two main reviews from the first iteration :

 - The WoL configuration was not accounting for most of the WoL flags.
   The Wol config was reworked (however, not tested unfortunately) to
   better account for what the PHY and MAC can deal with. However this
   is still a topic I'm not fully mastering... I think the modifications
   done to patch 4 addresses the shortcomings, but it does look a bit
   convoluted to me.

 - The last patch of the series, that does the phylink conversion, was
   hard to digest. To address that, I've split it up a bit more by
   introducing the phy_interface_mode_is_reduced() in a dedicated patch
   (patch 9), and by moving around some internal functions in a
   dedicated patch as well (patch 8).

Thanks Andrew and Russell for the reviews on V1.

Best regards,

Maxime

Link to V1: https://lore.kernel.org/netdev/20241107170255.1058124-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (10):
  net: freescale: ucc_geth: Drop support for the "interface" DT property
  net: freescale: ucc_geth: split adjust_link for phylink conversion
  net: freescale: ucc_geth: Use netdev->phydev to access the PHY
  net: freescale: ucc_geth: Fix WOL configuration
  net: freescale: ucc_geth: Use the correct type to store WoL opts
  net: freescale: ucc_geth: Simplify frame length check
  net: freescale: ucc_geth: Hardcode the preamble length to 7 bytes
  net: freescale: ucc_geth: Move the serdes configuration around
  net: freescale: ucc_geth: Introduce a helper to check Reduced modes
  net: freescale: ucc_geth: phylink conversion

 drivers/net/ethernet/freescale/Kconfig        |   3 +-
 drivers/net/ethernet/freescale/ucc_geth.c     | 601 +++++++-----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  22 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  74 +--
 4 files changed, 265 insertions(+), 435 deletions(-)

-- 
2.47.0


