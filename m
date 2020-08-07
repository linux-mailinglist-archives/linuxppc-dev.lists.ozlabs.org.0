Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BF23F562
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:15:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjRg0D00zDqJS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:15:27 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=M7j75P4g;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVx76hyzzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:21:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlD7IQi0IhjTokZcdrfy89S4QeBpdwN80jIXAP6Fi1H9Em3bB/V5QwHnYLRq+Yq5dgikVCCYiffvaNLlyTijxB4OwsVq0T3CBg2YdqqTK+ZCm2PNRkvnr34NXm5nDNw11Mienu4a2fw0YJaisj7Sz249hvW20DgC96RScbkoHmiVCuTDGaELVmymdeHdcSU+GLiT/nOIGe/oDSQjI6IhaW1XRXz9CtmJukLZz6Gk1aH4Rt108wmCeNvUOJM1M0/Z7aDMLBI2wXJID2tDsI7EftU2GudxZf8UCg7t4SIOoaXrhdzCFKpv47A6kGiYFoHa4wEmJZ9V7pwJu946yOXoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/u++3Wb9TRY1KnAMaCmSPDyHn+bY++/LQen+EDNIYA=;
 b=Gi+ShSrb88dCJDCrNWgOrN13a0Z7qK9qXJDPQYX1HKN7/xnR8tWfP6D3ELO9Z3pz//8sv60w+KiETBPQ+kH4hOBOxlyXSY8ynddSXNlKus9u9O9rxgksFn/iWUyrna89nfRLR8Rm0To5NrcnwY5tKyUcV/fl2pGWLso7qhGCXVJ2L3TOc90V5WlBbldSoe1tK7dPhIMsHZ5HdH3ls7Hhe8Golec7Q3lh7jnMYKCaC3CkNs6+0dSFwc3QKfswpM7hr3QKPwwb5ZNuS6eUF+Qv2f9Jb09SUP7gvmRiQZM+7HMgLFDs7yPl6ehcgussyc0dhueKXsnm1PT67TGZovdN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/u++3Wb9TRY1KnAMaCmSPDyHn+bY++/LQen+EDNIYA=;
 b=M7j75P4gBWLvcLPAzmVOLTqtgQggGV/BkO+e17VAFL6FvOvTL+USw9I9BFufNCBTypoui9zTKqc1QZHAwvsXPa7VSuqmTxZ8HngbCGsnrHmeOVOLae2/gZRm8pMSh7TR50CEP9Wg+HP3ES0yPk/EBf6jCdnBLwQHvY/LTAHbfCA=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:44 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:44 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 03/22] crypto: arm64/aes - add check for xts input length
 equal to zero
Date: Fri,  7 Aug 2020 19:19:51 +0300
Message-Id: <20200807162010.18979-4-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83d861c4-7269-47f5-3654-08d83aedf977
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73592BEB33AAE4726B810092B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZwVRe6Vp60/RcZhOWUSU/C42BEFpyZs3tLpHMmMwX4MB+GpEVmPnnUcdwP2MBZGriMWLaGe0EPJxWagpHs9YranNO0aSVbO0xIavRNo8hrF+RpkhzIn0GnA7dIeA8fgBOgOgeexL1ouTtF3ak8AsERvCuRDQnQhLGENxd1oOfHc4Jbnijp5n829qTjf8Rmjej/PsAuDwUMShc6t7LqWznSnc1LRkrUapzywY89AdP+sUp7WKBIAXlxxo4wruJZ/Bp0+dUuWT8oolXTllSEOdxyBi9NDeiN0BVHe2VyGH5Ggd0Os91TQkzLHRIl9XttSATLAl1bHeuO5DFWtHLUl1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ORK9xEdDWq4NJJFv9Tcb9rAX4xH1P68efhSx6pcBNEyoCdXah21OvzfpxSeDihTs4j+oQQRCK5hqsmKTYxiN4y/dnaxXA+IqopSXEQQtUW11hBLtKwlVSSwyfxwMlGSXQtpT6MkYpdYYHj7L5giCISMrTDkQ6x2jU/M2MZcocHeH8TCODPWRPg0Yy70GzkifPYUYdLOg80zxnpW4ewZDUVdBkkhLKYpl+AfiPdtiCXQJqlusYY4OcIXFGp8l0LfNb56EurpmsDME0LdBg06z8+mC0H5KeejUKiZXky99KX20NEdE4/3P2/xGhkTZgk5jmT/S6/8lRDz1UXj2sKKZPrPbFUvWFB0Imr4dV8F+korpcnZ6A/nAxV74bvCAK3DF5B+/X/l3O//PRqTMVtmBu7fGZ86bBGuJxX3/1QlH5+cc7jQ4CQEAvPSpZ6CqMMMxYFh0y3ZCE/QQlnJwrMjW2s54ukN9nFDhvy4t1HRShcyunwrxcpTlaRULXeb6DVzEtUWKPnzc7SA73AW2kBciEqDWL+U8Cq2t+j7WhPXlJjJW2JWte1YS1cITGKK56HkjM9P6E53ebQN/5ebpCt6tbR01nAFCvhcdYs7nF1c4c6qgPMoKOj68Nx4u8dYVO07Y98ukjtBN5Sdk99cKuqgcHw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d861c4-7269-47f5-3654-08d83aedf977
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:44.1823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+v86ksYwg4bFY2635IOQvq4aaEdWZj5hajWWGyS5u5po8rmLreRQGVzcin2DeN/dECpKx0ANOOgiG9BiZ393Q==
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
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 arch/arm64/crypto/aes-glue.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index 395bbf64b2ab..44c9644c74b1 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -515,6 +515,9 @@ static int __maybe_unused xts_encrypt(struct skcipher_request *req)
 	struct scatterlist *src, *dst;
 	struct skcipher_walk walk;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
@@ -587,6 +590,9 @@ static int __maybe_unused xts_decrypt(struct skcipher_request *req)
 	struct scatterlist *src, *dst;
 	struct skcipher_walk walk;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
-- 
2.17.1

