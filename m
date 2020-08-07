Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A223F59E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:49:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkBP3jg7zDqvn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:49:01 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=R1EeIne5;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxq4HLgzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG2/SCkDZtVpXLFZx20kxabDUKQ1hFvvt1k4A2afvgsJd+Yboeu9JK7rd2zN02I/kHhBNBBmiAZwXHE7c4USGYZ8LO0QbDaITH18AY91NA0vOhf4MnHHl4cmD4LAOVfFqeNwpBR37Lwoemw0dB4246zjCKyHzbhxxBV+SnPZTfDMiXDBb0+T1z4gXT6hqZuCpmfMgdEKDsa08xnXP5BkQ6Sdq0C+Hu7bzebT5uGSx7ZPjhkDfMScHFapJfVRmVIv6aJQogRcT2O1sPx+VNZpZiB3lNEe80C4af0jSM+0QWrFj3+c5cSeWxTdpkK8YDTa/skYzba7eTzrjVsJlU6Nkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC2ta3eGZeMUSqoWJidBs4SB3RZKyPZ2g/vOcr7fKjo=;
 b=UVmecRbzYlU160ptsU1P9CuiNoLTwcfBMM+MCKszh2Xg7ugxX88OOkrzOaJKq2dnRxXTfsvUm5gO73V1PMGsTihd3krvzmIZBJMAN2wAY++8DpNS1rjNaViA9iNfboEdMIt01B08t229Y1A4oaUgoMJXkH9gdjpjNxSTwJvfHLVdgUyLeDwQbshqwgOx/TfJtDxVXN1UjCCFqdxHO87ALpqf/e+qM7o7rNWIwDq3PwUEU+neeoPOMJ/4NtgTDzwcpCLot471C+yB66k3cvQuRqGiXIxMNuNu/qGp0CKppBTraLmZWotlXgt3PPEAPjURwtFgwV8fKe9xEfb0cAAGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC2ta3eGZeMUSqoWJidBs4SB3RZKyPZ2g/vOcr7fKjo=;
 b=R1EeIne575dqgbhUt+iy3P4sW7peXRfp7Esh/Szi3vMTuG6wdq474LepzoI2RdpsooHs0OPE9nTSExykYKkTQPjXTfqSI/g7VXs9uipN92vj0BzxQDygVykYGlkQtoruY4LFmD/TwfYVnzVH2K25tAApLjiAGbCve8B+s5w6aoM=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:21 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:21 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 20/22] crypto: octeontx - add check for xts input length equal
 to zero
Date: Fri,  7 Aug 2020 19:20:08 +0300
Message-Id: <20200807162010.18979-21-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1287ad0b-0a4e-44e4-910b-08d83aee0fe5
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7359F4235763E20F2478D7C8B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9HNqOhQEYHZCT5v71vf23mMKw79jb1iTZ1oMHqFRZ9HyVzs3d95mN7RkB0RID052oJDHOxfEJQWd8GuWJMHS310w+6mOpEemGt7ZZXQMWOGYpiaRhdy1Wne487FotzXdneQw0WCWOF/ekFpOYc91bi8wj8sWrDD+BlDmTPS6vAqnV8U+3ycSIvbDxY+rs7nJ/2r2/Q1CUHjTRXgNQ7rFs0CvMV5SBrX6hUda1ePTygfH13SAhQR5SZeKQc2lAhSEz4MpkKBg1Wk79OGz+Zqd1vxp0AlnJTqpjDNCdkoCJY/023MmhgLvwqeM00RVmSXACAkIkBf/8l/fDL//PPVxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: c/l7zYfx8lYpKAHXz/GGYkvExqNYmBea+2OKuw6MqcqYG458/qtgRMdWejOTfQdmTiPlNCE7IYCaalPgR739SIpo/1ZG+GrdpXb1pUMh506QViGIYEaReHSHrezXEPCWXuK02/b71qiiJ994gzxGLriqYrnXIBN806C0RJ2fa4zvfqTDc2MVN3MQmMsPHji7u3l9OjpNuj5o/UrcHAirc/KLz4mRuKO3dnjrYJgCPvxE9Am6YHse4BtNVhOYoIYbU4kax1IzOPOyr8ToTG5ctIpRooaH4sa6avMf/qvynPtxYsp3qdEIcX8Zh3s6jvon2NmxthtTdUrX0G5CArMVpgdoR0L7YC7HERlZPw3E/o0UYAEoi8UTBP3Wqx1CLp/7gAUsOUQjCBjCRVtNIS/oIp2Z6aKO7My4Uxozqc5Kzl9KvnAH6r3E0FOyHzvApYOUrGCWw238E6txDqC/eMa58zH4YJrlEquCsPCd8mJARcYyShxV1xiALidUQlfiYvbMysGSo4V8fOpaM0XWeokc0OKoZFLthQsJFKSYUBdVMqkChm+b7eN5EbIEIlUFz3HlRz52F1Aj+LH9pVv5MXDKhWWkBjVNEw6XqbSkG/KtJPuXoOXCGTzzy/N65xGgHJQnIi7FhQNPcn9BFaNZbsIx2g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1287ad0b-0a4e-44e4-910b-08d83aee0fe5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:21.7934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 428x598OqYPHChYVmg9rCDQWdrzNLPXJOKgXYnaSgwD1lvTIWj/xzipfbIuTB4qnwOcXSIBHEBW6mtIlrwf2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:31 +1000
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
 Arnaud Ebalard <arno@natisbad.org>, Boris Brezillon <bbrezillon@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 Srujana Challa <schalla@marvell.com>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Arnaud Ebalard <arno@natisbad.org>
Cc: Srujana Challa <schalla@marvell.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
index 90bb31329d4b..ec13bc3f1766 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
@@ -340,11 +340,16 @@ static inline int cpt_enc_dec(struct skcipher_request *req, u32 enc)
 {
 	struct crypto_skcipher *stfm = crypto_skcipher_reqtfm(req);
 	struct otx_cpt_req_ctx *rctx = skcipher_request_ctx(req);
+	struct crypto_tfm *tfm = crypto_skcipher_tfm(stfm);
+	struct otx_cpt_enc_ctx *ctx = crypto_tfm_ctx(tfm);
 	struct otx_cpt_req_info *req_info = &rctx->cpt_req;
 	u32 enc_iv_len = crypto_skcipher_ivsize(stfm);
 	struct pci_dev *pdev;
 	int status, cpu_num;
 
+	if (!req->cryptlen && ctx->cipher_type == OTX_CPT_AES_XTS)
+		return 0;
+
 	/* Validate that request doesn't exceed maximum CPT supported size */
 	if (req->cryptlen > OTX_CPT_MAX_REQ_SIZE)
 		return -E2BIG;
-- 
2.17.1

