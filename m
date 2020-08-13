Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B6243BC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 16:44:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS8Tq0y4GzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 00:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS8NB1Gj8zDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 00:39:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BS8Mx079nzB09ZC;
 Thu, 13 Aug 2020 16:39:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wl3HWTVpgapq; Thu, 13 Aug 2020 16:39:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BS8Mw5d2Rz9vD3t;
 Thu, 13 Aug 2020 16:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7148A8B7A4;
 Thu, 13 Aug 2020 16:39:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hlroaEI3dq4H; Thu, 13 Aug 2020 16:39:10 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E8EB8B7A1;
 Thu, 13 Aug 2020 16:39:10 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 36A1C65C8D; Thu, 13 Aug 2020 14:39:10 +0000 (UTC)
Message-Id: <44e26ec6a1bc01b5b138c29b623c83d5846718b2.1597329390.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] sfc_ef100: Fix build failure on powerpc
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
 Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 13 Aug 2020 14:39:10 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc6xx_defconfig fails building sfc.ko module, complaining
about the lack of _umoddi3 symbol.

This is due to the following test

 		if (EFX_MIN_DMAQ_SIZE % reader->value) {

Because reader->value is u64.

As EFX_MIN_DMAQ_SIZE value is 512, reader->value is obviously small
enough for an u32 calculation, so cast it as (u32) for the test, to
avoid the need for _umoddi3.

Fixes: adcfc3482fff ("sfc_ef100: read Design Parameters at probe time")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/ethernet/sfc/ef100_nic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/ef100_nic.c b/drivers/net/ethernet/sfc/ef100_nic.c
index 36598d0542ed..234400b69b07 100644
--- a/drivers/net/ethernet/sfc/ef100_nic.c
+++ b/drivers/net/ethernet/sfc/ef100_nic.c
@@ -979,7 +979,7 @@ static int ef100_process_design_param(struct efx_nic *efx,
 		 * EFX_MIN_DMAQ_SIZE is divisible by GRANULARITY.
 		 * This is very unlikely to fail.
 		 */
-		if (EFX_MIN_DMAQ_SIZE % reader->value) {
+		if (EFX_MIN_DMAQ_SIZE % (u32)reader->value) {
 			netif_err(efx, probe, efx->net_dev,
 				  "%s size granularity is %llu, can't guarantee safety\n",
 				  reader->type == ESE_EF100_DP_GZ_RXQ_SIZE_GRANULARITY ? "RXQ" : "TXQ",
-- 
2.25.0

