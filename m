Return-Path: <linuxppc-dev+bounces-673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE39624CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0sP4q4Bz2yLT;
	Wed, 28 Aug 2024 20:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839689;
	cv=none; b=JbTgHgJw0RQG/p+W7co/llecEbUyYK3r2f/fn+gYewn9zFUSckmB/nxv3FXN8KmYgI+MoLzhrowXtB8zwsjN0qAx1N12P6UIaBfs+gFVCCjcDO6p5h6J3gMHc/1mi9MHDDDQa7S4U9NPe8w71aRHzmudfoGCukJK5/1+ClNZaZjrys/XJHFljgHpjG24GlqSdCcAel7acJQI9Yq7TGt4RH3XVG9MzkcLMsZs+y49ih7CNScpk3eNBWrY6yJWgwZ7dW6GIHLACycuaU6N9FXSihdfTKhv9c/EXnbsin8OAbl9WsW8GRJPn2EEDlQhIgQ61uAh3X1OxsQ6ieljoI75qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839689; c=relaxed/relaxed;
	bh=NMcd5krJpu4QF1dh3WskwIyNsu7j6t8kCT18xYrFnZ8=;
	h=X-Greylist:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-GND-Sasl; b=E03AxG4l8fRq6NcB5o2Xr6GSpxdsbhTaIMgrEDphIXLDVhsmOhTYN0AwFtqP/mg6frzL3RDuG8s19HtuR+mK2shh5ozrrBrr7qAX/wW6TAbFu2EWRkoK4XhV2qL/9SrSUxPFK/G+l7sjhTD9YR1hwHyqgLRZwHDf8/d3JV107op+6JgtnFdDuFz+k8Lx8TYB6Y7f61+hKysCnWDFe63VPl7neXOULhY/HH9LWvZ8ajnpXFQ+tB6KbMoV/O/sJMYcn1AFxP0BE8dUplbid9M4CfPKz44RGJ0lt5LGO/fPF3b518+JSv247dQ8utw1LRlbQQfRWF4yVrL9zX+/nUt7kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UJQUHEN6; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UJQUHEN6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1004 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 20:08:08 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0V03k3pz2xsN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:08:06 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 1E626C807B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A93E31C0006;
	Wed, 28 Aug 2024 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NMcd5krJpu4QF1dh3WskwIyNsu7j6t8kCT18xYrFnZ8=;
	b=UJQUHEN6WjzuygPF/gNH6m6xV66KuChGtnbdjHjNy/mO6EoX5nlf3A4CUz4i+QCGya7YsB
	PR2IICydmOpbTI9fTNk9wx5mM+3e0rMfOyySAan9GzJTPGi4ZziXlhw89MN/ET54A1zwnz
	YWsVUP27SRojnn1xoeGozJbz5fwgU8CoNX5inPgjGPUPY7ZVgd8VJhOqvQd9pKjqfqfhrF
	rsfdIuybAHLJXXYxKu+66BdJ39p/6JRnVTvgCbdCNlxoJW1GuJ3EGNJUBL6S08IhzdvnCZ
	makAnbdtqH0BfWWbA84V3k8oYErKeZpFHA3uaIddZ+PxlChvZXDkfWJlyQd2Iw==
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
Subject: [PATCH net-next 0/6] net: ethernet: fs_enet: Cleanup and phylink conversion
Date: Wed, 28 Aug 2024 11:50:56 +0200
Message-ID: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
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

This series aims at improving the fs_enet code and port it's PHY
handling from direct phylib access to using phylink instead.

Although this driver is quite old, there are still some users out there,
running an upstream kernel. The development I'm doing is on an MPC885
device, which uses fs_enet, as well as a MPC866-based device.

The main motivation for that work is to eventually support ethernet interfaces
that have more than one PHY attached to the MAC upstream, for which
phylink might be a pre-requisite. That work isn't submitted yet, and the
final solution might not even require phylink.

Regardless, I do believe that this series is relevant, as it does some
cleanup to the driver, and having it use phylink brings some nice
improvements as it simplifies the DT parsing, fixed-link handling and
removes code in that driver that predates even phylib itself.

The series is structured in the following way :

- Patches 1 and 2 are cosmetic changes. The former converts the source
  to SPDX, while the latter has fs_enet-main.c pass checkpatch. Patch 2 is
  really not mandatory in this series, and I understand that this isn't
  the easiest or most pleasant patch to review. OTOH, this allows
  getting a clean checkpatch output for the main part of the driver.

- Patches 3, 4 and 5 drop some leftovers from back when the driver didn't
  use phylib, and brings the use of phylib macros.

- Patch 6 is the actual phylink port, which also cleans the bits of code
  that become irrelevant when using phylink.

Testing was done on an MPC866 and MPC885, any test on other platforms
that use fs_enet are more than welcome.

Thanks,

Maxime

Maxime Chevallier (6):
  net: ethernet: fs_enet: convert to SPDX
  net: ethernet: fs_enet: cosmetic cleanups
  net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
  net: ethernet: fs_enet: drop unused phy_info and mii_if_info
  net: ethernet: fs_enet: fcc: use macros for speed and duplex values
  net: ethernet: fs_enet: phylink conversion

 .../net/ethernet/freescale/fs_enet/Kconfig    |   2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 421 ++++++++----------
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  24 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  16 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  14 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  10 +-
 .../ethernet/freescale/fs_enet/mii-bitbang.c  |   5 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |   5 +-
 8 files changed, 209 insertions(+), 288 deletions(-)

-- 
2.45.2


