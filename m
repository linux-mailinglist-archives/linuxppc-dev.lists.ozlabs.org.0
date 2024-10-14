Return-Path: <linuxppc-dev+bounces-2206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155B99C775
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRv8q3nPWz3bnK;
	Mon, 14 Oct 2024 21:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728902907;
	cv=none; b=burshhVOC3M2hRpHHchSdkSz1AuyHXGuZlLZbQSddTdttz1aL/cKiyLE3syvaIXoJO7pki7YWllncTBD966XWCRnfiprmc4fpa/t89YlC97ER5l0YW127m7m8PMOHrflBb26jfCrH7J4vAT0mCjCph0qNvknZtnsuwSfcQ3FsQOF0PgtA7njNcu28t/nUD/Y+oDszR6LbbGw92zoNAd/vjKXI3IvTpgOLsmX6O2ukY/qV3G4s10RgcGc5oNckOULi/A0QVO5DO4dhEsR/YhxBVtv8oaoHObazlBUd9vK7QWnnCF9suy8S6KL49ZxlFgXzPP9zTLJNdUfs08hlUw3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728902907; c=relaxed/relaxed;
	bh=9C6g7Ed9Tz5VafM3PzYV8kPI7hGqBVVAbjMKqSOhmsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iT5eP/tc36+ZIIjcMqopGJeh4QDziHbMpeLnPr1g1QCn/b1W6huUbIcqhjfPfAh8SX520DZ12BAUPJJc9hXdEDT7xpVvfezCphSRW2k2T60lin8FPfZ6hii3SccryIBcCNWDr4l40g/GdQNvV+NRoce7e5afScZuTnAcwVn4WESA1Quq/5pJs6HdOS4NecZBL+iwFvLWRCyUW5lPEs4ufu5wkvHIXESdhmRL4cHPNsU1w9BALl0lTTsz8jHwjCXOtsY1KjRh3EwtbUI/BgiYXmJU1VnGgFY8mreqka9Jmyk9T70r/0DfYUJyY47QVEEJ38iJx2wPyl9kAalAsA16eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOxdL/l6; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOxdL/l6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRv8p63dBz3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:48:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1039A419DF;
	Mon, 14 Oct 2024 10:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078D3C4CEC7;
	Mon, 14 Oct 2024 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728902904;
	bh=3hLRauEYwJEHZvSFb0NBFQDokIr/VyMCsk6KndYmcGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UOxdL/l6+O2m79yN4Mo15zkbT55iP9G4BYeazux6JHcS0srxQr8YKSiXgDl18+HrU
	 AvfZHqZn7lyMIABT6GAhK5JiXdf3OTBDM/m4WAdGT8uNcEFKG+z3H+q8EjoRY+wC1B
	 NJfSWO2i/EhaYtZ7HlHsLuNKZvdHrwcgp29Iu0YnFmXc6QPNgkgx3Zd3clG0M5He7s
	 lvmX3v/HX33pgX9vxIhhFHzAJ3eAx32gl8o0f3FWZ7ca/hlICnL1ByuOfuiJNegDWW
	 1YHJjQ9Rr89LffyjCfivU5RmG8lb0kqAoM6ZAw75YfGt54SpVyZDG3pA+/ekT3FYaA
	 kmyI8fEY4uPTg==
From: Simon Horman <horms@kernel.org>
Date: Mon, 14 Oct 2024 11:48:08 +0100
Subject: [PATCH 2/2] net: ethernet: fs_enet: Use %pa to format
 resource_size_t
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-net-pa-fmt-v1-2-dcc9afb8858b@kernel.org>
References: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
In-Reply-To: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.14.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The correct format string for resource_size_t is %pa which
acts on the address of the variable to be formatted [1].

[1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229

Introduced by commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")

Flagged by gcc-14 as:

drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: In function 'fs_mii_bitbang_init':
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:126:46: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  126 |         snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
      |                                             ~^   ~~~~~~~~~
      |                                              |      |
      |                                              |      resource_size_t {aka long long unsigned int}
      |                                              unsigned int
      |                                             %llx

No functional change intended.
Compile tested only.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index e6b2d7452fe7..66038e2a4ae3 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -123,7 +123,7 @@ static int fs_mii_bitbang_init(struct mii_bus *bus, struct device_node *np)
 	 * we get is an int, and the odds of multiple bitbang mdio buses
 	 * is low enough that it's not worth going too crazy.
 	 */
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
 
 	data = of_get_property(np, "fsl,mdio-pin", &len);
 	if (!data || len != 4)

-- 
2.45.2


