Return-Path: <linuxppc-dev+bounces-1000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE696C51F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjM0C7fz2ygX;
	Thu,  5 Sep 2024 03:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470311;
	cv=none; b=ZIsNCI90X613enKLDtFKm0Q5IGSR6oly00eQGMiRK9h7K+Myekv6Xp4aiWvtSIMd5rYNcssruPeainqtFGmVCocEskt2qDhpREIgrm+hcxh9HQb0uUg7K4BS90MVKmpXjFIzfjLUF/Irgz4s1Zqa4exAvk1/j3Ruhmu5y4O5UZbhGRByFHD0B6CEfkY74e7rDeoUbbpf8MB3zIB93j90frjPY3tEevlVCuZ7lShdA/zQnChAagGfpZm8pQ/r98jxIau1tePPRWP9MpYE5hWqn1Mhf2+sA40eEMQG2Gw2DQ45yu4l8yGt9N71Eoqfn8I2QCBIJru3p0Vq2kwYGzJpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470311; c=relaxed/relaxed;
	bh=b5GPOiRWglxmB+1s+UM7/QwT5TJ9jmKJ77MFU2A6G9o=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=SwcCkcJ8YWUjeoVTD733OiVISuy9mG3E5ZGEfCCPB/2Mpue42UoTMzajgrZMt9ZmgC8QMnNN4x/T8T8/lhL5EIB4BX7DNO7SM++IUPHo2vnUUhgQom41/VwxUij4l/C54ad95FKHW4DLJtiGDCrDREQKJztYHlZ2ZeOtG7cShjC95UUDtifVINeyfRYSWYBWkiyNrwHiLC5vK96i9ygf5M9kMPT+N6hTmYMvEriJJttLI/mGpl9VhWeEFtQgVYbSAr/VGY8rQ56RM66KsLR8FhssG1amEroqkWYWhiPr+Kr832WsxSyqRIVnNppVSFzIxOzmLxlgNn84m63e9rIYqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kXoHkyYr; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kXoHkyYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjL3X6wz2yfl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:28 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EBB31BF207;
	Wed,  4 Sep 2024 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b5GPOiRWglxmB+1s+UM7/QwT5TJ9jmKJ77MFU2A6G9o=;
	b=kXoHkyYrjZc3bzBJ+Hy6K7klwuT/Yy3gwaBaKzoxSu8SEMgH3PI4RfnHb2Op3qodkVXA5I
	Gc8FGaposZQHUKPcfVXS+27HpKH9AxXdFWzjeLP+MZmuCK9kyBtNzt4dvxsPIzoCTAbzI5
	kyK7vc6GMRfH9q6gwAjyyoXCa+MCR/41W7h4qeJXTjBtd+JCuU6aEqC4l+zvJ1kujjHfu9
	eb4Qp4gP30/KZcsCHtwk/k783BscSQ41mu7GDpAICndx736DJD0o+oUgVSJDVVl9oomadk
	0sFVS0OomQxXutr91dQfPscDdjZaeFvFd3JtpJOH5ufW8eRQeE6vjsUFvWFv7Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 0/8] net: ethernet: fs_enet: Cleanup and phylink conversion
Date: Wed,  4 Sep 2024 19:18:13 +0200
Message-ID: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi everyone,

This is V3 of a series that cleans-up fs_enet, with the ultimate goal of
converting it to phylink (patch 8).

The main changes compared to V2 are :
 - Reviewed-by tags from Andrew were gathered
 - Patch 5 now includes the removal of now unused includes, thanks
   Andrew for spotting this
 - Patch 4 is new, it reworks the adjust_link to move the spinlock
   acquisition to a more suitable location. Although this dissapears in
   the actual phylink port, it makes the phylink conversion clearer on
   that point
 - Patch 8 includes fixes in the tx_timeout cancellation, to prevent
   taking rtnl twice when canceling a pending tx_timeout. Thanks Jakub
   for spotting this.

Link to V2: https://lore.kernel.org/netdev/20240829161531.610874-1-maxime.chevallier@bootlin.com/
Link to V1: https://lore.kernel.org/netdev/20240828095103.132625-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (8):
  net: ethernet: fs_enet: convert to SPDX
  net: ethernet: fs_enet: cosmetic cleanups
  net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
  net: ethernet: fs_enet: only protect the .restart() call in
    .adjust_link
  net: ethernet: fs_enet: drop unused phy_info and mii_if_info
  net: ethernet: fs_enet: use macros for speed and duplex values
  net: ethernet: fs_enet: simplify clock handling with devm accessors
  net: ethernet: fs_enet: phylink conversion

 .../net/ethernet/freescale/fs_enet/Kconfig    |   2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 444 ++++++++----------
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  27 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  17 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  15 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  11 +-
 .../ethernet/freescale/fs_enet/mii-bitbang.c  |   5 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |   5 +-
 8 files changed, 219 insertions(+), 307 deletions(-)

-- 
2.46.0


