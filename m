Return-Path: <linuxppc-dev+bounces-2992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C242B9C0C88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV349BWz3bqM;
	Fri,  8 Nov 2024 04:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999403;
	cv=none; b=A4yeyH018T41UHpRHt+qOd0MTN+D1tZ96xWN57fBfXmDkWxzGit7JiIDZIINDfsaw87HNAbz9aDVcbaEqgI8oPep/kVC1wyzWAczwUiBRUsIeS274hPE/rOClt21QNxcgsOnlNINggq3CQK/4seUBfHy4Ef0ZFcrgpFRGbomrlfLN9N+3+zc+tuPgl00CE1G4pJkeA4NwKV9xkZAnDe+h3YS7foUU1pn6rr5TOGWZ5h4HPH2zj9H5/SERfBs7/Quawo3NLiJMOTw0EUnqooH9KJpQJBe1DSa9+itqg7Xk9G4uoOrxv2zXg3NizQ/IM3n8qi6k1fdEhJGOyj9PumBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999403; c=relaxed/relaxed;
	bh=Cp1IlwuXxuG3hVq1umEFzCMyS7Q+bM6rBW7jwZeMmgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZ3IkxSL5+iM/UMiKp/6tZs5V9soPHnjDgQqf5LwlMda4p+qI/PNim4yG5kA1CV2RbsFIy9KOGfvKL+8EMH1ZyfeebQQJG/41qXi7jMOC0Ia8fgR3OrjURv6PsYpGMzG4fl1qiIWwgg0/olBFR1OCwsG+f0pIa9GjGxzpJUJdrX0lv1Vps+dTPlY7l87f9RoMQH8vB13uUZH4X+7GNIrSDZkih5rKjuQ+yKfadOAUJg/DWTlBh6LA8pRgF4Xei8Fzd6gp61GUzBfzvA3WJnA6Lz2ayVNUnWwmtPDmXIhFyrMlnVHVB6d4C0ypzUa0uB02/91QJjwBrajwVc1EBJ2pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hCMAkpqu; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hCMAkpqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpTz02HKz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:09:57 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0D744C38F2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBB50240007;
	Thu,  7 Nov 2024 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp1IlwuXxuG3hVq1umEFzCMyS7Q+bM6rBW7jwZeMmgI=;
	b=hCMAkpqulm8WFtwNz9p/rJ6c5xyIR6Yt5pwkQVIQEvKoehCjYKLmaI2KMeC5YScXVkGK/Y
	4NYd/fMztQeBdkO9mv4nrEkULHwWlneZWnGmb9PGpDJ0GHxm/vRqIhCaYN6QTTjBG+X0Oj
	scxVELlEWOUEAsaalcEBe20LsxUW+gEceXA/+6bUFog+C/GZ1AiewiiZc8AsktcgIKll/L
	p9GURarjdeovSV44Sa/tJSDkksKWsLZNh4ZOZ+nghk9jhMxs2if4hbS9Z22nEoZX55hBYn
	Sb2Ksun51D0DOfrVf2l7vp9dd/Zru8vA/krrQP8IK2yKFc8pJimj03R/QqWHIQ==
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
Subject: [PATCH net-next 0/7] net: freescale: ucc_geth: Phylink conversion
Date: Thu,  7 Nov 2024 18:02:47 +0100
Message-ID: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
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

This series aims at converting ucc_geth to phylink, one one part for
better SFP handling, and on the other hand as a preparation for complex
topology support with multiple PHYs being attached, which could involve
phylink. Even without considering the multi-phy case, this series brings
proper SFP support for that driver.

This driver is pretty old, which shows in the coding style. I did not
include a cleanup pass to get checkpatch happy, so a few patches will
complain about the CamelCase used in some internal structure
attrubutes...

The first 6 patches are preparation for the phylink conversion that's
done in patch 7.

The first patch removes support for the "interface" DT property which
has been deprecated for 17 years, allowing to simplify the phy mode
parsing.

The second patch splits the adjust_link function, as advised in the
phylink porting guide. This makes patch 7 easier to process.

Patches 3, 5 and 6 perform some cleanup on unsued or leftover constructs
to again make patch 7 easier to process.

Patch 5 addresses the WoL configuration in that driver.

Finally, patch 7 does the phylink conversion.

Note that there are some things that I wasn't able to test, namely the
TBI/RTBI handling. I did my best to replicate the existing logic, but I
don't have the hardware to test it.

Thanks,

Maxime

Maxime Chevallier (7):
  net: freescale: ucc_geth: Drop support for the "interface" DT property
  net: freescale: ucc_geth: split adjust_link for phylink conversion
  net: freescale: ucc_geth: Use netdev->phydev to access the PHY
  net: freescale: ucc_geth: Fix WOL configuration
  net: freescale: ucc_geth: Simplify frame length check
  net: freescale: ucc_geth: Hardcode the preamble length to 7 bytes
  net: freescale: ucc_geth: phylink conversion

 drivers/net/ethernet/freescale/Kconfig        |   3 +-
 drivers/net/ethernet/freescale/ucc_geth.c     | 600 +++++++-----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  19 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  57 +-
 4 files changed, 247 insertions(+), 432 deletions(-)

-- 
2.47.0


