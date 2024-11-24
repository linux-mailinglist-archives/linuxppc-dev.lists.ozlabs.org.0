Return-Path: <linuxppc-dev+bounces-3534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE49D7201
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2024 14:57:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xx9Pt50V7z2yGY;
	Mon, 25 Nov 2024 00:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732456642;
	cv=none; b=fE2+bAS4d8JDjpqjod9S1/yzNCkzU67I4U6R7+gwlhSLDsx9VhsT9c7uN0oTOa1yY/f4GRfz3pfEFZzSgaDubrRahpGWf0E9vjtKigecrwOXrp2uxVfaUXiBwzcHCW1B58LFfMu/pylxTwHawGGTCCGuu3SOeLyYLkm0wT/jwkMkAzMGO/qUwW5YHXQEv8/z3iRKsAF1kDyVCXMJ3nFP+TssAsgNrx14Xbz44wABc3wAb9XLpF2eH9e1Y9iKnqHEiZPzuLhKH48RzQ+CIgnKigoLQfnBt6MY/xQiwJQWZu7qBBNAoVPfcLcklEDEmlARa28zDiry93GPXhs3zW4Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732456642; c=relaxed/relaxed;
	bh=ctsLpoVO0HkiQMiEO29DzVJibaXZwkyBtNsvebcaHls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ/0UwRXoqwEaKbPhbR5n1iF3o+1yp+O4ZTaHjFqYBA8x40CKyswP0zOUNqhTPGbsB4wJApR05seI3293Wbml4aOhnsYFkG7r0Y6Bqy5F/fDMws9m6Eu/nhb/mZY9z6+7WaAqqA9yGAQQeLnK/Qi/FPpoZcMTpbQ9wy+b0r+TM6hhq0+zBsfgV5dtKeNLFdWxJwM2pf7dJQwmws+lVexP5t042OS71M3YPb4p4tiJQWo/csuBRrqlElWF5630ryLkX3eSKz4I1+vGQZ3AJYUaiqy/W9FayqcYourqeoZhLBftHo5VGpFQ1/XE2KCNnn5mk0PJOn6Vg6es2XyiSMogw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0EUxG8p; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0EUxG8p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xx9Ps4Lr1z2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 00:57:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1092A5C4ABA;
	Sun, 24 Nov 2024 13:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7169C4CECC;
	Sun, 24 Nov 2024 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732456639;
	bh=7kJxGYpq5B6gkcecesOBUZjReUx4nZbMinW6ZwXQQO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0EUxG8piPrclZWVAoqpmjpjhiHP20D+D2R+LHeQZcCKs9Z0sYTGCPyG8li0rAvKu
	 A99XLr/oD69Qtu7HutwdZ7OSxQ2BjiIpcxgYOYSXxtA3uDxajh7wtXSwoJdNoRKg03
	 gC+8in/knjT8NXBwyI+mu6EHTa2z5P/JxbeMJ5ab8yYHRcb8EqF1M+feYCy5VHQo69
	 BjmciJ8sPrcfySTWh/XD+yXYAM4iBiez0KzYhhVCf6um/5Y6AxA4gwubxMEPsDstSZ
	 kMas5arQqK0QVHuUrtqZLb6zM8uVYzWD4YDMMjVf37SgTrn9cGjm2kDiVFMXeWgGrA
	 PWS34ESYL5fLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Simon Horman <horms@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pantelis.antoniou@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 04/21] net: ethernet: fs_enet: Use %pa to format resource_size_t
Date: Sun, 24 Nov 2024 08:56:37 -0500
Message-ID: <20241124135709.3351371-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124135709.3351371-1-sashal@kernel.org>
References: <20241124135709.3351371-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.324
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Simon Horman <horms@kernel.org>

[ Upstream commit 45fe45fada261e1e83fce2a07fa22835aec1cf0a ]

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
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Link: https://patch.msgid.link/20241014-net-pa-fmt-v1-2-dcc9afb8858b@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index 21de56345503f..f743112730194 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -126,7 +126,7 @@ static int fs_mii_bitbang_init(struct mii_bus *bus, struct device_node *np)
 	 * we get is an int, and the odds of multiple bitbang mdio buses
 	 * is low enough that it's not worth going too crazy.
 	 */
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
 
 	data = of_get_property(np, "fsl,mdio-pin", &len);
 	if (!data || len != 4)
-- 
2.43.0


