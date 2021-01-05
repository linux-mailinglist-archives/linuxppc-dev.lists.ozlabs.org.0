Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FE2EA728
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 10:17:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D96NN4rJ2zDqWN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 20:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D96KR1l7PzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 20:15:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZsDKHd/+; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4D96KQ3kkXz9sVw; Tue,  5 Jan 2021 20:15:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D96KQ1KJ5z9sWM; Tue,  5 Jan 2021 20:15:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1609838122;
 bh=EADqwwn7oD0FlfCscvnQrpY01N4uznyjB3jWIAXQL/g=;
 h=From:To:Cc:Subject:Date:From;
 b=ZsDKHd/+RTNrcjY1Wafc4Wbrdfvb0IYrSYzS9/jnoGOPbuBdY7hDjDBDlOwF3k+g8
 3rXOroz4sy6l5V3dDAl0aq1d3HgU3v82JX2FkwLpkzRK/hJbqyabv1A7IvI1cCJgfY
 i70rNbIeE/VMSOpf2/bbepwEAh4Y7exxfTj53tFUyVMn1XWstgo0Q3mkCfWspqiodt
 onJxdeAGJ8qaYnwWroEUW+aOIxbjFxszlDSAL2u97JgVF7uq6Zq00jMfbKDomAkQRt
 EYZWw1AoIdXb/wcTAdjf2EnVQSSZb68nJieW5zVCdWfHMS+6rqyNj9sMveDOrGxEFL
 XqzNymymkW9lg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH v2] net: ethernet: fs_enet: Add missing MODULE_LICENSE
Date: Tue,  5 Jan 2021 20:15:15 +1100
Message-Id: <20210105091515.87509-1-mpe@ellerman.id.au>
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
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
 kuba@kernel.org, davem@davemloft.net
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

v2: Use simply "GPL" as pointed out by Andrew:
    https://lore.kernel.org/lkml/X%2FPRX+RziaU3IJGi@lunn.ch/

diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index c8e5d889bd81..21de56345503 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -223,3 +223,4 @@ static struct platform_driver fs_enet_bb_mdio_driver = {
 };
 
 module_platform_driver(fs_enet_bb_mdio_driver);
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 8b51ee142fa3..152f4d83765a 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -224,3 +224,4 @@ static struct platform_driver fs_enet_fec_mdio_driver = {
 };
 
 module_platform_driver(fs_enet_fec_mdio_driver);
+MODULE_LICENSE("GPL");
-- 
2.25.1

