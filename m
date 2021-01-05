Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C582EA34B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 03:24:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8xCB5DYyzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 13:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8x965Fb0zDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 13:22:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X0BQOYDY; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4D8x963x3Rz9sSC; Tue,  5 Jan 2021 13:22:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D8x962qVnz9sSs; Tue,  5 Jan 2021 13:22:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1609813354;
 bh=+JHifb6rnjYZKQkkEfYeRWl4cRAvJxzjXbwxzFCiS8k=;
 h=From:To:Cc:Subject:Date:From;
 b=X0BQOYDYrvBC/e22mHXnwJ8D7EdkFfuUuVPN2Q2X7EGecqHv3u1SYMln7ySR16u6+
 /nTeb78HHtoBQGZ2Xm9pvMU/CgM3Q+XSZeH9mQssD+7sA5sTwbVXguuIm6wNOdSW0k
 soY5YgJ7j0MuDE8mBgJaqEhsBSkXJRvUpnMwGs58hg1S+lLfmJdRPFF/pv974i/mU1
 SA333qQQ6jXxWX+hmJ8MF9aveY6vyhFmaYxA9q61VzgtiJ31r4pTbO+8GUMqBwg+bq
 KVkGUwtmYX+bO+QGb6EfGPrewCoLFN5caMbXhLItTckJRTD7AliN10/8zm8/Rpu+CT
 13PlX1VX/hJtw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH] net: ethernet: fs_enet: Add missing MODULE_LICENSE
Date: Tue,  5 Jan 2021 13:22:29 +1100
Message-Id: <20210105022229.54601-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: linuxppc-dev@ozlabs.org, kuba@kernel.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 1d6cd3929360 ("modpost: turn missing MODULE_LICENSE()
into error") the ppc32_allmodconfig build fails with:

  ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-fec.o
  ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-bitbang.o

Add the missing MODULE_LICENSEs to fix the build. Both files include a
copyright header indicating they are GPL v2.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 1 +
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index c8e5d889bd81..76ac1a9eab58 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -223,3 +223,4 @@ static struct platform_driver fs_enet_bb_mdio_driver = {
 };
 
 module_platform_driver(fs_enet_bb_mdio_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 8b51ee142fa3..407c330b432f 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -224,3 +224,4 @@ static struct platform_driver fs_enet_fec_mdio_driver = {
 };
 
 module_platform_driver(fs_enet_fec_mdio_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

