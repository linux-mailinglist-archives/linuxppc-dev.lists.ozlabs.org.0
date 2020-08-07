Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8723F597
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:43:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNk4B3GZ2zDqst
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:43:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.14.42;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=andrei.botila@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=mrWLRnUX;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxj6qKQzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg95exFM9j4y9d3P/BoHQwM6CIYRDikzRHVsgiEgTuAu7xe3gKQ+bQG1Ihwa3KFvywaCXMIOyim6tVMvMdBEL0b6VcRTxhDJ+UmQQATN11CzDv+Sg1E3P53YXG0f4cV/HOrBqbjmVvkciOpx6aSSgC+cyujDG3w7wrDDE5E+fuoHFaj6IDhL0ZQOjmeDaYg9XLiTx3yBjJpla7PQyvxUfhEvzd006G24Oo3/YRxh+LB0hJn4mMeG2WqESGmolofazT4DJZnqmQC9ym0M/OA60wDOVxvby/xZLnIpmCoJoW4SU+ILII1gZi0R4+/04zqd+FcHO5M3dYNODi6CzvHT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpg8Nx28v9Y3qiGKaO61tWq46U1TYFDx1EYMYEMkVd8=;
 b=Vd3Xh75SlOvyWdziEpCeMOlFQawXq4JYxPRNzDTAQcI5zlmR0Y2HzU0rxW1ZA9EZvlRiOL2cnIduxDW+ZSh1Vrudan+NAWImrZZTZ5RQltG/qd2HXN7RF7qZvLPxVVV+Zui2ATS5zup5wCk2M1fYPGo+9jKKXU5lkF5+6PndJfbprHFcu/rqOI9Oz96eme7MpaPRvQ05md4S42F+SHQDw6Lasw+vO7XTBnkG2xMhlV9H23ViKCkWyTIcnvDJLH6V5xVX6f8CcxawcmYfbrdSCHxpEZhEA/6ZsowwbnCcFzPTNIyeoWUW1VYjK5HYZb7U8Qt7OGsYhuFOkQsg60u42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpg8Nx28v9Y3qiGKaO61tWq46U1TYFDx1EYMYEMkVd8=;
 b=mrWLRnUXAfXV/a8vp9wMOjTvlwpS3PalS0YXoBCI0XmueoZu6pmyrKXiYKK4ka0B4wxaq+x2dCgBX1aQjm5JH2rx5DBQ3YozAjQ32kPa4mgNt12lUMnY+G8sb0Wo4zsnjcuEXjhY/r5q9Y1WKgB+/0bsbHsK8EExG9w+TIB6Vco=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:15 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:15 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 17/22] crypto: chelsio - add check for xts input length equal
 to zero
Date: Fri,  7 Aug 2020 19:20:05 +0300
Message-Id: <20200807162010.18979-18-andrei.botila@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:208:be::16) To VE1PR04MB6608.eurprd04.prod.outlook.com
 (2603:10a6:803:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv15007.swis.ro-buh01.nxp.com (83.217.231.2) by
 AM0PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:208:be::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc83552f-7752-45e9-9073-08d83aee0c30
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73595514471C39861A1D65BFB4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lT4qwYOPsRK0wiJNrfhOFFc3vQG0oLtlI/cQC1UI6Nq4ogXm8T7sCUwuNk/f79obl3TpzR0cKvYmDOuOBuEaDWHkYEHbw6Tss6LXcbfjUJA+KCbSpBQDT9s1HfL8wPTbf2zQLvhz/ewmZo2jiF6pH2OsFrU2wYBHu2pQBg0CEF+U5Qwp6jG47I3cZGl65s2EXikREsCmkvlA36f0ZHPNmQyLVofplrjt9jpZGnrLf0150sUsPXh5kKxdj+G82hVHBLAFsLOquBxvQeK7hUQP/vMytXfL197Yag2NSVysSbrSbuRUEN6kW4FoQ24sq/Fv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: AyX5k+2lft2zwCHIxKPeJhcKk7RPzkFE+7ZwHxxePGS2A9Z13+kDBYb07GqNO3iYgT4g0POcVUsN0ggGaspgWmuLFTEQ5185R/b8Q53QZAjQcmEA/JvF4CoJtvXtRPsB+57XtdJ/Aoxhxtx2uZsVaPeSXYzEnDw0q1uzpWuc9j7DpREqrH1OkuPhv3BsicsrqFUDoQE0aZIWaQ1tGGnJE/ve0hBnPMu3NFXyvluNdMPGs21qn3bP6JXVh07XM0pjHHcup+arl7epLM5U0hMpR3e+l9+/c1zI8UkRsobcH1UbsfzDS5W7s8wABVOquLBZkHP59cyzjWaGkxsFgQIKyWEMubaQaX6sOamX5Mhr3T75kksaiDYyGRPsOW8EnAOQVksvCovdVqqUzABXzVZiYE5L+GFgRhhVOI/4D2xVof1mgU+Cvx9QHwVivvWoV7qITpBZ5KT37E1mlnwCM/jcFq7pO8q9FYeag8CcdXjH+dk9hrD5mDi1mxGL54WOk0HV3jifFbcj+G+8Mvr+HsjA49+x7ERjuAhRpT+ng/9eHrHYLvMRJtZcdNwxl8iRXdLsq8RKeXPa3PbM2iLIxGeP2h3PdJmW2t4OhGH/5kyLvl0JPP6w43z4/RuzMR83k0EQy9GJjrPMvTgY8xKc9TIm9g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc83552f-7752-45e9-9073-08d83aee0c30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:15.6070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYXUab5J43/7qrkSpUyFpfurjXneyMgiAc1R7jP5nitm+PBtnRZIVMo9PNX0w9W5Gu5myUt3wTP5IsaUu2Ejmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:30 +1000
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
Cc: linux-s390@vger.kernel.org, Andrei Botila <andrei.botila@nxp.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/chelsio/chcr_algo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 13b908ea4873..e9746580870a 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1372,8 +1372,12 @@ static int chcr_aes_encrypt(struct skcipher_request *req)
 	int err;
 	struct uld_ctx *u_ctx = ULD_CTX(c_ctx(tfm));
 	struct chcr_context *ctx = c_ctx(tfm);
+	int subtype = get_cryptoalg_subtype(tfm);
 	unsigned int cpu;
 
+	if (!req->cryptlen && subtype == CRYPTO_ALG_SUB_TYPE_XTS)
+		return 0;
+
 	cpu = get_cpu();
 	reqctx->txqidx = cpu % ctx->ntxq;
 	reqctx->rxqidx = cpu % ctx->nrxq;
-- 
2.17.1

