Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C162B2C7C12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 01:22:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkmBp5qQdzDrDY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 11:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=BVXwGbSx; 
 dkim-atps=neutral
X-Greylist: delayed 584 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Nov 2020 11:20:24 AEDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckm8m6Y8qzDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 11:20:24 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CD7B7891AD;
 Mon, 30 Nov 2020 13:10:21 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606695021;
 bh=UIqWYi9dJ/tmnYKWJprnq3EqMYZT/sDGMsS3orkktdo=;
 h=From:To:Cc:Subject:Date;
 b=BVXwGbSxxSE6NNiSC4BF9So9Y8VsGlyKL1PbiicB6DSYHHRWqUgWEPI6wpO4sOMnx
 zYZPoohLTv9sCOn5t7SJKxkdTA3nidQSu0PtYEIUfCeE+OkpHcwrpMuL2+661YoLMM
 P2K9Jd7fmDE6lkwUiJRO802vaOVXZ3MO+ZZtL+lK7YC0zCyfgsHxWIjVqPYZrf1uff
 Zk2NhVRmMHi89+Rkz97PtyBBtkcLEsb7l/g4KE39dondLRwhxVoneRtb2rO4S2scgS
 1oekPW8ZF6e1QPl6B2duOtsXeKMwYva1KsgyF9nH2jxZeubre1DGFKaC5miXlADICy
 dHLKzPcJaL1Fg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc438660000>; Mon, 30 Nov 2020 13:10:19 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id DD87913EF0D;
 Mon, 30 Nov 2020 13:10:15 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 966612800AA; Mon, 30 Nov 2020 13:10:16 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: leoyang.li@nxp.com,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [net-next PATCH] net: freescale: ucc_geth: remove unused
 SKB_ALLOC_TIMEOUT
Date: Mon, 30 Nov 2020 13:10:10 +1300
Message-Id: <20201130001010.28998-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: trivial@kernel.org, netdev@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was added in commit ce973b141dfa ("[PATCH] Freescale QE UCC gigabit
ethernet driver") but doesn't appear to have been used. Remove it now.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/net/ethernet/freescale/ucc_geth.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethe=
rnet/freescale/ucc_geth.h
index 3fe903972195..1a9bdf66a7d8 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -882,7 +882,6 @@ struct ucc_geth_hardware_statistics {
 							   addresses */
=20
 #define TX_TIMEOUT                              (1*HZ)
-#define SKB_ALLOC_TIMEOUT                       100000
 #define PHY_INIT_TIMEOUT                        100000
 #define PHY_CHANGE_TIME                         2
=20
--=20
2.29.2

