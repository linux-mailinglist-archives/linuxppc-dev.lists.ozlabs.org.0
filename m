Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52923F57E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:27:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjjZ5zWwzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:27:30 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=LXoLMKEX;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxP2HXHzDqfJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX7sryQlQO2e1hAbuttsLhTZKmCuz2t0aqYGwnGdNpSC43H+siTaFmqzb8rlks8NgeH+xurFIC0vALRNqDeo9UhFSwLtIsi5jl4kU9pQtjj+duIbRBcdcpL+VMt5EtnMNBMXryhnsORbWqN9w5MGvICfTEPaIvzmUxDLah8bFOn1Xn3FJZ539x1pZGOpF/FCQ4JRd8CVU3sGSlld07lwvxsTQXwzE7HE/wkA9glZcVGEQhdEYcIn4HeKbh85coi4O9owZg9S0J9NXv8u7oAn8yBBUUQFQzoCWe+/2C+vmgS4mI7pLka6z4XFLRVliyItvEzUL688ZoOyz7ytDjJ5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9jsp/YcTj0VhTgO0wBAaJOiNFq7VMGPAkrV1siP1WA=;
 b=CEkJbcjifxTbMC4bnZUEswB8SZ3BuNqqUK3UNiuVssquDpQOje9O22wSt3I1xYBa5qfyJbp2jEEC4EiGLGt1F90bZsT5/880PlyRpXcUWO5IDbg63ZpyBJ9d2ZXoWMCv8BBMcBfcEFx40oK0uOqlnqrUpdGo0JbSVnaHD8mxUhZOCCkPUEhSklpjWABxhAY62YEPZikEDwCvXknznVdZm40AFwR/5SozHJolRGSHJcKtXg4PbhXxxVDTnzRl/1m1lPTAsHlm1yjNHCQ0vj7g/JT9Gng8vXt4OaG4v2e3nRwlW3Cb44Fr9qsxSDwQsB5LllYrC9NMprLAWeNzGKXpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9jsp/YcTj0VhTgO0wBAaJOiNFq7VMGPAkrV1siP1WA=;
 b=LXoLMKEXVUc9rsGAChB7B0OYug5HQUupJ47KZ89QRhEwGXmN4LNDYIvBPJkDTlBYyjIDu1DyT34tjMekUMbZvCqSY49sNg+DvytL805gPQccf6q2TU1+PhchRn3i0XMRfMzXU9/qWGrDNriQ5AQwirWMpJMTzySpO9eurIE1zqc=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:58 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:58 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 09/22] crypto: xts - add check for block length equal to zero
Date: Fri,  7 Aug 2020 19:19:57 +0300
Message-Id: <20200807162010.18979-10-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ad53ed7-587f-40a5-45ad-08d83aee01bd
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73594F9175A3E0D172D15333B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rOh5w+s9PqbXc2jcZ1BQLHyncDirxVRD4jdekA7Syfswt/w/ROIwz/cJnzIzH4WUvJiZDv0QulE7Htc5MIKD602XM1VY8VMzU0g80LoPLGYHzt7/7UJVAFxNq5eIR5GcWId6Zb3M58Nca7paq3+lYFbCCFfNxd7vcU9NSI47TynJBU1d1DR7jgluWq3DOFc7pUyZ9H0briBJCZOHMoyzxDevONO8tskb9XLuh+i6ExZN1GEtzW4bQ+14PZZ2detPLy2CqGUuAA6DrTIHkaOiM+uXccbLMucwAWRh69r9e7LJ/iBmTZo+Zm5Tgu6L5rWlbZeVZ+MGCpIscCuREStLzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KaITC/4v2sf7hi3vwd2JC2khaf5a+VUGJVbtTSg1JvE+/UgxSV0teMtOWwpmFdj6PK4SsqmbfsrWQMoGStJCx5ciuBlGCOI6wfJqjVUfxOpYVLa+pXYuzuDrM3Y/R4eMsA80UUPvbMOK3MEb1hMo6Q11G6n65UOZ/bKt0QQLIEnDN6ps/gP8Jrxdyt6hefAddwhcrLnxqJEHIRipw9s0SfBMoLKUnAsXCE2h7KnuLwdddY5aqCDw7kgKaJ6A0D54YrhdzDY9YHfQcUCJzhiQnzW1r7Q3OEhjJwKkFyuc9DyKtg2U4g+T0cbxXUZuphI0RMXRz7dsbcKEYggaj/f6jvio15VSnw1nIV5Z5ay7I1LdmarIb+twu8m7sBVKhc9w4FrPZdcjPwpO9iDl3zx6C9724YEW/Mt664ZnGnYMdP6iuJ2Z4X9oPUlsUffm5bzdBNA4md4EMHFpEDpmJxBq/1zIJcMHKWfnZlkywYSrWvcth3d9N0RQCAA+nMQsEBpP2kXq0wa+kxfNlg7kZsYqXA/fp0xwGOz9cmfMQjUmbTrgU4Z3Xc3P80P1Z2q+p99Zq4dS7vAWHEj18/whPxfTTwHJk/6dW79jHXDLfNCT2XyC2NMPMKBrYv+oVvKD0puy3g5I16KT82UffZZsLWDvCw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad53ed7-587f-40a5-45ad-08d83aee01bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:58.0772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtzUDYpUxJDKeTHPmLQUJkyRjx+dqPhfHgSxMbe+Yb8h5Sh/MODD5fjBLixfwETkmiHrs/8IXe3CM5PEtXreTQ==
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
 crypto/xts.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/xts.c b/crypto/xts.c
index 3c3ed02c7663..7df68f52fddc 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -263,6 +263,9 @@ static int xts_encrypt(struct skcipher_request *req)
 	struct skcipher_request *subreq = &rctx->subreq;
 	int err;
 
+	if (!req->cryptlen)
+		return 0;
+
 	err = xts_init_crypt(req, xts_encrypt_done) ?:
 	      xts_xor_tweak_pre(req, true) ?:
 	      crypto_skcipher_encrypt(subreq) ?:
@@ -280,6 +283,9 @@ static int xts_decrypt(struct skcipher_request *req)
 	struct skcipher_request *subreq = &rctx->subreq;
 	int err;
 
+	if (!req->cryptlen)
+		return 0;
+
 	err = xts_init_crypt(req, xts_decrypt_done) ?:
 	      xts_xor_tweak_pre(req, false) ?:
 	      crypto_skcipher_decrypt(subreq) ?:
-- 
2.17.1

