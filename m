Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6D223F582
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:31:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjnz2mJgzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.14.48;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=andrei.botila@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=gd6IPzId;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxS4yJhzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqOigEwgpG0rYl3UnxtkqMWeWQwTW/C8qUALHW0Vx1mfUEVFbSnxu34qxFOUnN+j6vVkxdnsfifqgPMSeVQdRQk+PgAK6tUgTrMLt+jJbD3XEImKyklNiTJYPNHB2K2hhDHbh7Uv+FSYeC5hW9NpE/4qLHegT941eWKnJybpwnCgzER3aCTA9gtIUFlAapKZuYytN+3l9TeRbwmsYAssf4YwwAPFZPYgviNUrNJGcPpoaHTttD2Ra7dPcVgX2Qckp5JH7a4xblxXRz9FgJm+xtBhchFEFOrqF33qs6oL7jgm9NQzGumoXZSWQkNJvwTgddurVOfdP6W2k/xNcio90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKUbz7IwokmTEaHfqLuPQ6Re62bDmfVBxGj27TTbExw=;
 b=IaGqoReGCJJV5rl3+yiwFX8W6/MOIjwJePJh7HRh6ZenRMfm2yxIF+xTNRme92tZcQYUeVfcU46JB9gMf/o4tkuMvlLgB+CKFjdRIoqvrNhoLELTl8m5/qomk8EUYcKUrOi2iJvKAHBlnyjgSTEiWedTPoIoz4RHhZ7xBJWQPRGyFQy16eDLOQ5iWJ3+Goy6nXk4Gw5V1pv0RaLvDQQrUj7dhX8+IWDg6hUBD2rCYoN3HoV1NFE6MBbYg9JUl/slH5CLyqoGqlBoDskg8xq19e7Z+2y1J3nB+5NLpJf83Ri7962o2WbbO5QN+bb5ZBYomDGP1NOoa2Z0O6DIc+u4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKUbz7IwokmTEaHfqLuPQ6Re62bDmfVBxGj27TTbExw=;
 b=gd6IPzId1uxHzMNgmsFcKJNDjlomAVSTW3dcjFz0lF1SBG0UuLxpAwNGtdHLUQyd5nlIQXZzk03VNA1bqyPPTMR8mhY/LLXMH1PhjKx3pZUYPKwK6a5T0rY6P2B4ZHcN2dYg5iLq8oAzPmcnn1whe/BlivMaWAKduRcMvGypPoE=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:02 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:02 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 11/22] crypto: artpec6 - add check for xts input length equal
 to zero
Date: Fri,  7 Aug 2020 19:19:59 +0300
Message-Id: <20200807162010.18979-12-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9736d86e-1695-47ec-dbad-08d83aee0467
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735946FFCB51EAD3597945DAB4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUTiw1FsFK5h8IO1jarwWN92L+W80dIsWjCYtxjGRz0X0CuvLOHEme7vCBYuSwnkl9rVlj1R3Ks61YYiTogtkiCqMFRZTvEBEIgINvPgZ9HrWcI+fhkzmMDZRdTMLp1OnZJla9iogD7OJ92D8SbPk64Qe0WaUW9kttIMtaFScWEg8XiUPqyTTheamehHykSa9bKzIpbUzIag6gwfxUn58i50XOutCq8dpN8ej9JCqjM5C6zXqFG3GyQG1zM6FlMvFAF9cu+17prDzpTPK+OZZlVlNmnW7kTscz9eaVfiHZABq9iiY6Ov9lbiLEohmw9Pi48RwxQEToSsdef1zre17Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(86362001)(5660300002)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: G6hI3qlLow7u3mB3XZA+7xFn5wI3dQwrMA8ZEMNV7+oC8Gf75ZQxCQLYetBdz9bDaGJPlN8PZly0H8plS+gwFlY1M/7q6qabZEn54celwp/rsqOOQSswYINdvPIXU0K53KbWu5v9tm93dWRA2sA4fxdLvTieU+jzIyngvdnyZsKG6Dj50uvn/yideCzlYp16lob1jruXku/mNgSBsmclE892KG17USdBjDL+h7blIN0z0RWAtlU01U8yRrn/61YbtrH5ZXokU+PoDWC/u8OnTwEN2F/d7vqSn+GBMM9i/WfY6uBGBPiY4HePx9w2TB1BKWf6CrPGy+kL8egG3vRJxAyNRw7pQl57bly8TUCZffjSGK6pWhRxaIURdUl8MjuPsiFAH9+fyJ9Ek60KAX45l/BfgUISgOKyTjWrv1KSaPysYzxPeQfmed0BpbxinfmP/T4jjJY0mFxJJ7rSPgZcCCpWy4LTkmL1XlO1Xcy5Sh0HvPlD02L30uC5NtV7yU8pO6gFnf7mdiEQAXpbPtXoaQItE6359Swn9ke8scKltWZ/pCU2CTEqXQVNyG91MjDoT4W5q4FFN7tpgqCRpji0/bB4qPTz+DX8wqUFUpbXFNVElbNVi/A1UFftRhddSWdtPnkkBJHthV4Zjvixmb1uDA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9736d86e-1695-47ec-dbad-08d83aee0467
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:02.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltQA+Aleb/fZ10gSG4RH2omcYxmBBjuR40NT49MsUI5l3yKmWaDLanAHV40uSD9Pqwl7T37fq0bPcmJsLUSzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:29 +1000
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
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lars Persson <lars.persson@axis.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/axis/artpec6_crypto.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 1a46eeddf082..243880c97629 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -1090,6 +1090,9 @@ static int artpec6_crypto_encrypt(struct skcipher_request *req)
 	void (*complete)(struct crypto_async_request *req);
 	int ret;
 
+	if (!req->cryptlen)
+		return 0;
+
 	req_ctx = skcipher_request_ctx(req);
 
 	switch (ctx->crypto_type) {
@@ -1135,6 +1138,9 @@ static int artpec6_crypto_decrypt(struct skcipher_request *req)
 	struct artpec6_crypto_request_context *req_ctx = NULL;
 	void (*complete)(struct crypto_async_request *req);
 
+	if (!req->cryptlen)
+		return 0;
+
 	req_ctx = skcipher_request_ctx(req);
 
 	switch (ctx->crypto_type) {
-- 
2.17.1

