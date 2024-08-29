Return-Path: <linuxppc-dev+bounces-756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11141964B40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:15:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbf0NXRz2ytp;
	Fri, 30 Aug 2024 02:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948141;
	cv=none; b=M/TZ9DSjVv+SdgRwiZ8s1G873NBGMTloQ9f/OZj1Of/QK17aU/iQkEbjccocEUlQOHLKjU0LOvSexOgUOMRTJZK1oP9c73CiPwoqiFLbdVl/B6/r6JUP1gSqZo3YHaBbKeGFwEYB+oVV/Ctau8IjkQyzNlL1F6QT8SGTfGi459VKkvtzmyZoKFKzxntGBtKiXSmmPxaWCiXkpl5gw3QQOF4S+ODBI2xpgAPMttslbO5vYd4/Oq0LQILmgNmXQq2jG1+24fYhOLbo1xuYLsEhhfZXVaHUpBn2q57bZKNO9M4KsrJi4zL51clNjMRe0smwZKiDV7cPC25kciFTCbQKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948141; c=relaxed/relaxed;
	bh=fAR7srL4v3bw18EUN9RLJmZwLTb+oDsz1Nnj3gW1ymc=;
	h=X-Greylist:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-GND-Sasl; b=VBOgxNxPluUVrNy8TjrdIAc6meifli52yuDgQcqAXHKGDMxMQvgvKtECil7kJePprJdE+osrcYWNqHsR8qf9y+bIK6bFoRpkv9hU5rEsivVpTu+Rb9YOa/TFcScvM6ZqXLFZC3KDQ+zD6OlY5nFcLn7aGlSnGyuU7aTKWhQLEW06iCt7pnk466zrxBg3nKTmyMWOr2amWhGxY6qkewtwbfKNOwZ3IILFYV6dwbcQ1/KAcYXKEP/WWIVTn6o9byYj3/nrQtpJY0OigbQqxQyAJecF4rbegmJkc80qBi4JR7EwH4uTopTR5VaPpTBURSrgCvH3rKybB1+mYWfRRW5Zkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZahHLt/h; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZahHLt/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 109467 seconds by postgrey-1.37 at boromir; Fri, 30 Aug 2024 02:15:41 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbd0DDvz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:38 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24B5EE0007;
	Thu, 29 Aug 2024 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fAR7srL4v3bw18EUN9RLJmZwLTb+oDsz1Nnj3gW1ymc=;
	b=ZahHLt/hMMvB70eolNrnzQfCt60xp/OVIN+BPDRNyq56Fu9cIeA5JHT7KnwsBalT7zHkTC
	qlDFyue9rT9Qz52/2LFduHvbjQ0lsK83GWHy6OiqGJnngjRLAzMAuvTVDRfs6iVBpItlC1
	lOVLOLp+H2ZfJkrWvjc8/UIPK3sif9fj2e0ORwfZtsKCwQY1kpBlay5RzzOld4mK6azHYs
	RhQHvX+PtHtlXA/bGAnAij8NCwc5qkDL0aeohgm1KLCUP4nNJwr9WzxzIOKnE0MjmNF+A/
	GXCc6AgzqxPFGBTPzrUEYi+DzJjSGPKbq8UfsZC0DXza1oikCOg3plIjrbAGfw==
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
	Simon Horman <horms@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 0/7] net: ethernet: fs_enet: Cleanup and phylink conversion
Date: Thu, 29 Aug 2024 18:15:23 +0200
Message-ID: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.45.2
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

This is V2 of the fs_enet cleanup and phylink conversion series. The
main difference from V1 is the introduction of patch 6, that uses
devm_get_clk_enabled to manage the register clock, a cleanup of the
probe error sequence, and the removal of the netif_running checks.

I also gathered Christophe's reviews and Acks (except on patch 6 that is
new).

This series is made of some cosmetic and cleanup patches to FS enet, the
last patch converts it to phylink for the PHY handling.

Link to V1: https://lore.kernel.org/netdev/20240828095103.132625-1-maxime.chevallier@bootlin.com/

Thanks,

Maxime

Maxime Chevallier (7):
  net: ethernet: fs_enet: convert to SPDX
  net: ethernet: fs_enet: cosmetic cleanups
  net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
  net: ethernet: fs_enet: drop unused phy_info and mii_if_info
  net: ethernet: fs_enet: fcc: use macros for speed and duplex values
  net: ethernet: fs_enet: simplify clock handling with devm accessors
  net: ethernet: fs_enet: phylink conversion

 .../net/ethernet/freescale/fs_enet/Kconfig    |   2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 434 ++++++++----------
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  26 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  16 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  14 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  10 +-
 .../ethernet/freescale/fs_enet/mii-bitbang.c  |   5 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |   5 +-
 8 files changed, 210 insertions(+), 302 deletions(-)

-- 
2.45.2


