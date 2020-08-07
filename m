Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359B23F59C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:45:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNk6L0xGdzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:45:30 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=ZTc3MDFZ;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxl2qxFzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W36QpI/+2ZXtO9riIOCehxsfxzj1ccwVhpviUNedvdvufrcxHRLlYh44IugRrZhrMIJsVX3sWLKY89P/KW+v9FZWrmHh/j6HjCBqcCvePRyTRp9eyqxikkBTR7OSifB32cYWvPlsl2PYUCT2jmexbj5XFP3FLL2+BD/4k7vfpk/TH7oUAmuOx+ZUxr50LP5gc5hhIVeb/tecTKdjdxDketNtO3iuavzXVKPh4PPm7ygn+6RKhkYWDYlpWjTEBPUt3If1sWQO+q+QRGcLQlAX8Gzytj8Utbwaj2PY2smIqKQla7Y9GB0hZrQjrmhmSx2oQleiRtRwXt4CMrxysh/bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82qY2d00RvXDAh5ohn0RHR2E3SsQwIYACpLSJwzgKxg=;
 b=l0qeEv7n5Z1mOr+1IupB9FsKrOE5QXalH+lcwZxXl/LbwQ16dumVEdl6v3jlZO8Xqoz8PHE+dRFQnLBWPAvxIQ4dEjeKocv1D1bKOESvFepUkhMWMa2nnMvXfExPqS3lrZoHH3yNWOg5V2jSe9IsANpFvSnyzm5NFWlqKVmIduXwJZM9+tsO+CH7q3F9LX2tKfWfjKCyvGroc5HlmJzHqLtLC6iX5t9S3uwjUvCXjCEH0GCHuvGJVnBFnpkZvGBfUCa0mw2Cpev5QARkjNEOCNskLvB9qTpRQ5Z03r3qNBD6PvBYWNcYeT60/dr0EiR0hPR+pGUjCsQ8MIkEbBBDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82qY2d00RvXDAh5ohn0RHR2E3SsQwIYACpLSJwzgKxg=;
 b=ZTc3MDFZ0nT3HkbXQL7y3AO1DGLDb7QSqTbOZYEl1hz2Rowb2lmb1p4hY03ZbXxtnZBlDIvM42cBHvPo6DXcF0JDTva3e9q50QaIetI8oYFMHgXq2d/lxPzlsZwVUXfCvloJLecgr/xP5aDqoaIRIEkOVQUXwNNE+IAgK08jRjc=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:17 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:17 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 18/22] crypto: hisilicon/sec - add check for xts input length
 equal to zero
Date: Fri,  7 Aug 2020 19:20:06 +0300
Message-Id: <20200807162010.18979-19-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c92cabd4-f26d-4967-8b8b-08d83aee0d63
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735998A6A24429DA60312118B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PSGAs9lp7PJCKh3MADvF0nhZkrX38D+yILfGP5XBeuscTYG3PaBVcpc0980En7ypYH+fpq1WqpPz/v2vVucKw7+qg/IKmx30C5MabRc7b8WdmKsqUmwtNl5AsM/MMooUH4LJ3ZSZGpAMU8KC5bmSQcPcSL0VLe4eGvph8GMVqoLhLKO+58ed8XmrlDnnug0ZXa9BT8PxN5OnIy58g0NA40dUXhcXlqMOpsVz20ckbB0APbgjSBePDhx1J3MYh99i13gs1W6ZUX4EA694krVSKdIs40rIp4AMiXkvH2sMtBpwp9JZOzZKBMmS86e9WWs7JPAYjgWhEJP24ZMBlq7WVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0VeR+p+kLa+tRpi4V32BAc97ii6PbCqu5fEo5kNd1WbA3lFTn/v8+eS8nGeGbVeJEvCepYT5izGxZXNg+OQk23Vl2cL/37YtBILZ0nlPw7KiXG1s/c2i4U8uUaL2GIklGWgCpHkOvGrj7lrlWZDa4ORTNb9L21hd7YvaT836yc6kKgky0EjFTMoqEvEzOdB4HyMjX65Jqly2Ioyy2E/zbCpPxGIjR+KIB7emtQEew7U4T9bMje2POT4mGIxD7SFZkjcSuvnYiOmkpCeF87yJ99VfO4fSp+gKoiIgSYzcQ2DNyXwHe85h8bmeOA8akGgnnNp4EaFZ+sm8tYRzS3yuqnV2nbaSvE3e9B3MPH6mUqzAtOru4H7BRpWlM0/A2YrhSl7c/VzrxM0u+jvAz3YdAq4gOgU8dPD+5oOOPMfDsqqTK950uI3xgI1jBkUZ0mvi1M0H2o4AC5p75W9YDZqsat86xTEDlDfNtbEwesqCBOQmJSDasE024Iboryw3DMXSXTR1qMpdMTjF9GFzYSZNERSlj9ozSOd4u684QitkUkq4GNX9PA3Vtz+LNVsZeJqP7Z7sd8CYQUdm20ptqJbb5iBgsL3ipyugjlFeJjpWOiXgHuwMPmZZBCOI4jcCGrhwDBxyBZjau8lfu5+xCz5EbQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92cabd4-f26d-4967-8b8b-08d83aee0d63
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:17.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YcZ2+4mD4xFfVnlxOhMhVLg8PFcTdQe6TALO5lNQbsp8dDJ5LuzQOZbIIo7GeoLIrqHzW2Ty2uF+IvEcy6W6A==
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
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/hisilicon/sec/sec_algs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/hisilicon/sec/sec_algs.c b/drivers/crypto/hisilicon/sec/sec_algs.c
index 8ca945ac297e..419ec4f23164 100644
--- a/drivers/crypto/hisilicon/sec/sec_algs.c
+++ b/drivers/crypto/hisilicon/sec/sec_algs.c
@@ -723,6 +723,10 @@ static int sec_alg_skcipher_crypto(struct skcipher_request *skreq,
 	bool split = skreq->src != skreq->dst;
 	gfp_t gfp = skreq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL : GFP_ATOMIC;
 
+	if (!skreq->cryptlen && (ctx->cipher_alg == SEC_C_AES_XTS_128 ||
+				 ctx->cipher_alg == SEC_C_AES_XTS_256))
+		return 0;
+
 	mutex_init(&sec_req->lock);
 	sec_req->req_base = &skreq->base;
 	sec_req->err = 0;
-- 
2.17.1

