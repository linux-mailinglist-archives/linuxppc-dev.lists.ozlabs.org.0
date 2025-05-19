Return-Path: <linuxppc-dev+bounces-8663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D959ABBC31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1FbF0Wzcz2xHp;
	Mon, 19 May 2025 21:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747653608;
	cv=none; b=icKj0dzs/uauZWPHsZAI4hB7hOINIlB148Yz7wmRclGmmPns/rB19h4UDehW8Lb58XbD8y0HIn7UpL9all0skn7yIzF05cl1JlC5ZKBmaQJTnjF6uNb8pXNVjjBZlDeTPpBEGt51qz26wHRRDEuHnSNQRWZ/nDPznR6guq7QTSPcEilgUTzrUZnIByvN3MowYPJiE6rqqtkOEDdkDSebYnk2jhtssg2zfe03wZV56lwcflgVqMvx0j3bX2RINzzsAp0AFNEUmU0u3Ej1lhoGv49zR6OAld640fUr51jwfWsjyH6WkA+eo/p2BjA1wb1tpTPzF6+sAnb5h0k/RDNTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747653608; c=relaxed/relaxed;
	bh=u4FUECbzDmIe3Lq56KAKS2ibAoxZD68pfZmiEnSX4r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DA0eRbk+JDjh7VD/Hr65S7Te1dku5lYkMKffUUTOFf76aTqkxpC/kvsGN4dakT+lgP1IJff19U+ynmLW8Tcl0qL0J+MIXf9KYzOwhqVYA/AIJuRtMWjarH0jtVYTUtg7+Cep4Yy55bO5TOmeskOJYvvMyE3kM6g0hDYqc4+7XS5K2Da6Xmfx/m6xG0NI40id9V6xtSyOv6wEOG2WX18hJtH+EQnXUHON1Awgi7e6EF04V2XEQvC75eiT1OMCKve2t36Sbx2i+MCt6fMGU/NOMnmD9OPxzyr2EWhOGo78iKLicF2BoeCgewT1W73Uk+emp0p6rogcmnIatvXnd2V6vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iG4cuQcs; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iG4cuQcs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 396 seconds by postgrey-1.37 at boromir; Mon, 19 May 2025 21:20:04 AEST
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Fb82cZSz2ygm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:20:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=u4FUECbzDmIe3L
	q56KAKS2ibAoxZD68pfZmiEnSX4r0=; b=iG4cuQcs/I++nbDfxXwAzfpGjjFXGA
	uhCiMjXr3CYo9ts4yINOQj+6nQm/KRk1FZguZgapMNitxoEaPKIWqHWMJ6GqKyGp
	6sS0/klxjzaRdeIx2uBjE5KGrbeofS4VY6TG192G70o45wbdQqKihQxXr4qXciNX
	3MQEpVoxleIDUYMeSittfiV+Anb8Ge9yJ0PnXWddXB5P7mCkVDkte41gGR9mxYjS
	ZUakxFp4gJhwY7rwdwGUHFfMi969sojBirEmxcvSYvZoEs0A9ZZgz6H3UhbJHAMx
	0R1zF2iTWmbBmgw9b0cJRfu4SqcDWFs1Pwg3ndrAm9uN2wJ9ji3wiMRg==
Received: (qmail 2453668 invoked from network); 19 May 2025 13:13:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:20 +0200
X-UD-Smtp-Session: l3s3148p1@qUchOHs1dstZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Date: Mon, 19 May 2025 13:13:11 +0200
Message-ID: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I promised Andy to support him in his cleanup efforts, and here is the
outcome for tidying up i2c_board_info. It seems it was easier than
anticipated. But my scanning scripts (awk, coccinelle) didn't find any
more occurences and the build bots are happy, too. It really seems this
is all that is left to do. No complaint, though.

Wolfram Sang (3):
  i2c: powermac: convert of_node usage to fwnode
  i2c: use only 'fwnode' for client devices
  i2c: remove 'of_node' member from i2c_boardinfo

 drivers/i2c/busses/i2c-powermac.c | 2 +-
 drivers/i2c/i2c-core-base.c       | 3 +--
 include/linux/i2c.h               | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.47.2


