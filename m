Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9A730DC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 05:53:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g/eeBySz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhT0j1G4Cz3bcS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 13:53:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g/eeBySz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhSzm4WrGz3bjV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:52:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1820562FD3;
	Thu, 15 Jun 2023 03:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8573EC433CA;
	Thu, 15 Jun 2023 03:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686801153;
	bh=eUMOaaa64vv4PEr+rHiwQ5XErXSIP/gyvXwLW+x4DIE=;
	h=From:To:Cc:Subject:Date:From;
	b=g/eeBySz8RkrHgqbCc6maIbvUP8+JWE1jWVuVwl8b2gorJu8s7PijZiGh1D7z/IiL
	 +1jDMvOLh4jHLzHZXjxnXIKgqjkZV0MLziB+4k0aUQlAdCxAspblBZzdPZxD1myw+q
	 Pbro0U9QV0o41yA2P7X0xSjfs75XfS5IqoGxx2+Vd0vkmcTmwur+hJRn0TWVuZA+HS
	 Y/cBIFfeM6OXEI6Scap0+oqbPgGKeHA8mca8jxYwxBbzs5cdi/h0skfW6OYgd0M1mA
	 I1BNbPKprnICjEVNwfN4Hiv2+M9ea62NRiI6cutq2VylWrzu41QEnMUOp/SC/MseTn
	 uRz2xIxAVr8Mw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Subject: [PATCH net-next] eth: fs_enet: fix print format for resource size
Date: Wed, 14 Jun 2023 20:52:31 -0700
Message-Id: <20230615035231.2184880-1-kuba@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, edumazet@google.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy forwarded report from Stephen that on PowerPC:

drivers/net/ethernet/freescale/fs_enet/mii-fec.c: In function 'fs_enet_mdio_probe':
drivers/net/ethernet/freescale/fs_enet/mii-fec.c:130:50: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  130 |         snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
      |                                                 ~^   ~~~~~~~~~
      |                                                  |      |
      |                                                  |      resource_size_t {aka long long unsigned int}
      |                                                  unsigned int
      |                                                 %llx

Use the right print format.

Untested, I can't repro this warning myself. With or without
the patch mpc512x_defconfig builds just fine.

Link: https://lore.kernel.org/all/8f9f8d38-d9c7-9f1b-feb0-103d76902d14@infradead.org/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: Randy Dunlap <rdunlap@infradead.org>
CC: pantelis.antoniou@gmail.com
CC: linuxppc-dev@lists.ozlabs.org

Targeting net-next as I can't repro this, and I don't
see recent changes which could cause this problem.
So maybe it's something in linux-next... ?
In any case res is a struct resource so patch shouldn't hurt.
---
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index d37d7a19a759..59a8f0bd0f5c 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -127,7 +127,7 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
 	if (ret)
 		goto out_res;
 
-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
+	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res.start);
 
 	fec->fecp = ioremap(res.start, resource_size(&res));
 	if (!fec->fecp) {
-- 
2.40.1

