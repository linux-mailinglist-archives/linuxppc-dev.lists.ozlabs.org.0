Return-Path: <linuxppc-dev+bounces-3714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7189E1C77
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLj1NwCz30Bp;
	Tue,  3 Dec 2024 23:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229821;
	cv=none; b=DN1ZafqP6NdE/Oaa/OQPezMNaCnXaVvPQgIduQFmX51X3j+kLYf8OQ85+7HNbhYsCSlKJ7RNOB7L0TNbRO5C6GZM4kGfrHR9d2S4y/AJtIUdg25AZlD7vsiWbWd81Y0Kc29oXxhXwXiEba98Aqz15xk2TRZG446pX+lRZKdVQQ79iQePbVMI+z6CVgYuZKOwcKuwvyiwwyoYY2p0wYpkutIMWhTirnzeQRR6fv0YaeDh1NMBHiPu2/ZIlz2R0FEkSincyZ3lcJg/DBxTnqJeMXYSn78LChuKIWu8yGk1Y6WqfDcLZfHAkFqS/mtcaMxcfsggqOaRXIrxisMqArI0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229821; c=relaxed/relaxed;
	bh=W+I+80WOeNGElVcMFVionKAL8OOUIM1EboCBXK2lIoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZzMuuQORelAkKOAfB9UOSAZSm47wE5yyGFGr+8e3jF6tHA8lyi5Uunvw1z+4YJ+FbfhrPhpYFitbMiAvJyxs6HXSJce7Gv16o40gxZHPXuuZyc3pi65d/hbmrawZohl2VisxOeWPXykC9vQeDMBOlg0bKpuSmCwVF51L7r3mgOTZKZJPzh4xpt6ENZSFUMj5zu3dbZTvZEwpNQH1WCeYSyzrbp1dMn+Wju9Y0wio85K8ErdMUPcj9koixVTG944YPhIZzIJTjmBGXeFagB5aMZ4VHc6aXY/szsBv0QvAs9l29j1cfkYnUgbMV2oogsyNHRueEbGqamEWBPk8ji4BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AIvjtNo2; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AIvjtNo2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLc2PQ6z302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:35 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2787FE0004;
	Tue,  3 Dec 2024 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W+I+80WOeNGElVcMFVionKAL8OOUIM1EboCBXK2lIoY=;
	b=AIvjtNo2jOC+jd9gWK7fjVM6bQPL7bWgHmfn54Gx0ewm6x5dsqLrAK08xmE99z1v26+u4c
	19SRqSQW4a9QcVK5geiqgO6TKPWkeR0xUKS9Yt5OmNpeaPKfyGVGfo29kQXHcvnkEmuVGi
	mm1COr1V0zI1XQ99MWVZfrwY6hwU1CDZCaKr/nGSgSHW5ghzMJePJLy7Mf/dqZKDdDjfS6
	o0Lj38zBIGDhnz9oJGoUcM+P8pg6q5piJoBl6EfDgVTIKkCm579xigWuJp4C+2QBf9V1i/
	vv4mp1BW5BhKCfEDqvYL/ewQL1sTmB64kt9H/sq4bnkOMes/TutoOG4sFlvh5w==
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
Subject: [PATCH net-next v3 00/10] net: freescale: ucc_geth: Phylink conversion
Date: Tue,  3 Dec 2024 13:43:11 +0100
Message-ID: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
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

This is V3 of the phylink conversion for ucc_geth.

The main changes in this V3 are related to error handling in the patches
1 and 10 to report an error when the deprecated "interface" property is
found in DT. Doing so, I found and addressed some issues with the jump
labels in the error paths, impacting patches 1 and 10.

The rest of the changes are just a rebase on net-next.

Some of the V2 changes haven't been reviewed, so I stress out that I'm
still uncertain about the way WoL is handled is patches 4 and 10.

Thanks,

Maxime

Link to V1: https://lore.kernel.org/netdev/20241107170255.1058124-1-maxime.chevallier@bootlin.com/
Link to V2: https://lore.kernel.org/netdev/20241114153603.307872-1-maxime.chevallier@bootlin.com/

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
 drivers/net/ethernet/freescale/ucc_geth.c     | 602 +++++++-----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  22 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  74 +--
 4 files changed, 266 insertions(+), 435 deletions(-)

-- 
2.47.0


