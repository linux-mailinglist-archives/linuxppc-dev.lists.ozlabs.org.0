Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E62968D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 05:35:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHVH61W65zDr3V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 14:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHVFR0hTGzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 14:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D10j4BBw; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CHVFR0CCRz9sSW; Fri, 23 Oct 2020 14:33:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CHVFQ6MvJz9sSs; Fri, 23 Oct 2020 14:33:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603424026;
 bh=AwOSiExI8NbntUvUtGVI5OP3bq4Ymzz/W7ahgDUbvLY=;
 h=From:To:Cc:Subject:Date:From;
 b=D10j4BBwWTAKb5ZBcmye4YTVu192Aio1PIHlJoc0gPDo1/RvtnE1CjJxnTlMmw2vO
 xfA1Bq8AAl1zIdzdgkBYgQ1Y4Rt5hze4WKVymcV6nG8fCbcxCUnriJzp4fIyed2YtV
 maOOINbUB9y6sFyMXE6F14y5/zM6/il5Nu4ekBJGZTe0StrL0CfONe65QPTWh0wTL+
 as7pwNnbt2PSuYUECVqGmrXI6836PRw9UzyyYKjorsNTHJWV72CUEi0szipbRUeLMF
 dE8KYBp2hnkkJVXzQIJn3z2y40L0XxN8TXgd/TdsbUtQhXzo2cYLn0D8fMZtK+5gaB
 JiN5R9azn9MPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: ucc_geth: Drop extraneous parentheses in comparison
Date: Fri, 23 Oct 2020 14:32:36 +1100
Message-Id: <20201023033236.3296988-1-mpe@ellerman.id.au>
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
Cc: kuba@kernel.org, leoyang.li@nxp.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns about the extra parentheses in this comparison:

  drivers/net/ethernet/freescale/ucc_geth.c:1361:28:
  warning: equality comparison with extraneous parentheses
    if ((ugeth->phy_interface == PHY_INTERFACE_MODE_SGMII))
         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

It seems clear the intent here is to do a comparison not an
assignment, so drop the extra parentheses to avoid any confusion.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index db791f60b884..d8ad478a0a13 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1358,7 +1358,7 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
 		upsmr |= UCC_GETH_UPSMR_TBIM;
 	}
-	if ((ugeth->phy_interface == PHY_INTERFACE_MODE_SGMII))
+	if (ugeth->phy_interface == PHY_INTERFACE_MODE_SGMII)
 		upsmr |= UCC_GETH_UPSMR_SGMM;
 
 	out_be32(&uf_regs->upsmr, upsmr);
-- 
2.25.1

