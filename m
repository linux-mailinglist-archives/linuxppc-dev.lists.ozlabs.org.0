Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CE23F594
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:41:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNk1S2fj0zDqch
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:41:16 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=NMIiw8Qs;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxh4JRlzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6VV9adG7OG5XmenVcK2+QMCOxpwrqceRBjhbo/bwfBp18ImDp87KljFnU30VnGcyNC4qo4S6kJ4cgdVDrq/vh0fxD6uD2AUp1slzFKfmgpJ51xvzncAblidyHKOoZdTGmG09qUseVB5DgvtSDG+05Z8yEe/jUn20QfqV7uxmceDLirJU0j7oKBDyXLH8TXPZSAJgiXp89xusmxZ0oIG+T2ZFbWusC4KkSNJ1Qj3Fzjsede/iooRNScRJlm2GOmhhVcapdnzxSdHse2aAAUBwQ99riWZID9Hs4hNta0u0i5Je8O8IEsAAeahM1Hjd1u+lCxGMqtZM8ZAkzMg/PQ3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ3ZDCBgSVsJI0JDqY88ayzFFjlNBfrKFO6cSXTsXF4=;
 b=QV95tgfp37O2Rxn4ujyxliCy5jUDXJtuQLeh3nsLzvqmexBbQpVZsC7QN9pvCHKlnmceKJ5txGVvviKtpp3oDrL4nNkdoMCK+o4uOLGspV9YDB5tUqgchSLKUC4EJFEQUmJzp1geBve+3UT2PmoBquRmnHZMN+Ay5SV2obUEm09XoviuybGNhr+TrJPWlJCnWWSWOAbTrTE6hF2TazTpHbp25U62vjjzJ9RELSyXyATI+oqmLC83RnIwFJ3sI47ZzUD7sRzLOTS7cFLYIaREt240Cn0oFutNVr5755fdWDR6/YNSQ7+TeB9SNMmj/qYHvSmlnxNulnImVS62reMKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ3ZDCBgSVsJI0JDqY88ayzFFjlNBfrKFO6cSXTsXF4=;
 b=NMIiw8QslRG2OmklIbK1+3v1X5J6DtavEUZjE1D1f+gkjbj4sS35YiFWyuLTgux3jdzMrWnQgsBE0zgeAXtJvHsekotgGWYQ/fVBuunlMN9kIEPr+FE9YgvfsNWmfGw3lDDjRLpwfXOwgGjvTQKD3s5X8XEn0KHza8XbBsuRrF0=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:13 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:13 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 16/22] crypto: ccree - add check for xts input length equal to
 zero
Date: Fri,  7 Aug 2020 19:20:04 +0300
Message-Id: <20200807162010.18979-17-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99b176c6-0428-4cd1-a9eb-08d83aee0ad1
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73597E6C1F17B52B42D7C341B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixNqRZSK4QN+sfYUbv6XiexCApbcaIdXcqQAobZy9cXHXuL2syRwt0aJ+DsenlWQJJL+e+lOH/oVs0gcL3r5XstwkiC16km6fH/9tQXYO/U5vs63/GYOAf1UqqJOyq43PfNbFOq/TAB6eCOvQ3YLW2x4u0a8DXR85URzT8J+5xdbGbwxNwu5kkRMLeCyE+CDRhiu7QTwLHw59ZLrzhPwVzjJrkZprdGmywtTZvqQUd8+1L55cEYA8mASSWsglHKKuMBW/Eb2uj5xOalvHZa7tcR6j13T/2vqtO1bhda3hhJV8ttCq0w40yyY0ew1FCYXyamzT+/fuWkRVGZsl+YnsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8DnA2Z9Se0k0eZNaFIAUoxRr+kC20wDvBK7yi5Jb5VSE/CxcBm/A/HANo4z/mw4lFLfWWla8IbB7JH9oH5C1EDgRp23RBoA6hvIMlGtpRhCt1sL4vPwodAq9zjXvmRmk2nmWu1sekjyBc+XKe4moPCbOqpVVB+Ty8B1YoLv8wHMVLnykpy08V1ztT/Iu5a1uavM/S/5C7BwVortV66NieTK7oHr9PC45QSu/sMbfo/Rcoh8/LhdDxcZm+7F0Wa1As+hzxf9sI1jnbJm0llXUG3rAkQ5uJMZcW1RUZv15VlSlZA19PLp0zYkmJEq5jm8IratFAi0WaQdYwh/AJNm705+DejXbim9SfWMLgKNaQ9wnSK9nph1xCYBeH4HxoaqO7Ffy0QUE5QCGUJdIbdAEC5X19WRmEJNBZT1NoWZuw/e+zUCkJWP6ro0lPLe9AQPljn4ZD6OZd/d0syggt4FiiMe87LRa7xOopXyZIyubFPlP3l2O4RkOXRX9uZ8auxcBUrBJlb+wQ13vOhfqIj3UpZitZEekzxAp7aRAmtYJ5oLR9dkZDwtTbRy4Dd4I5i9Khdgca6sWMRaz+kuedipLD4fMli6GegGU8/WawfG8WouD1El9LM1QaHnzqCxCSuSPWcNBri5BVHxh9S/MQReGWg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b176c6-0428-4cd1-a9eb-08d83aee0ad1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:13.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvCACcrqPgUXZJJAaN447+0qSCBO1ch5ByD/fkXrSO+yjsXOXzV1bytAMRBZUigrkKgnhEJsEAQEJ0soFPS6VQ==
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
 Gilad Ben-Yossef <gilad@benyossef.com>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.
This change has implications not only for xts(aes) but also for cts(cbc(aes))
and cts(cbc(paes)).

Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/ccree/cc_cipher.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 076669dc1035..112bb8b4dce6 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -912,17 +912,18 @@ static int cc_cipher_process(struct skcipher_request *req,
 
 	/* STAT_PHASE_0: Init and sanity checks */
 
-	if (validate_data_size(ctx_p, nbytes)) {
-		dev_dbg(dev, "Unsupported data size %d.\n", nbytes);
-		rc = -EINVAL;
-		goto exit_process;
-	}
 	if (nbytes == 0) {
 		/* No data to process is valid */
 		rc = 0;
 		goto exit_process;
 	}
 
+	if (validate_data_size(ctx_p, nbytes)) {
+		dev_dbg(dev, "Unsupported data size %d.\n", nbytes);
+		rc = -EINVAL;
+		goto exit_process;
+	}
+
 	if (ctx_p->fallback_on) {
 		struct skcipher_request *subreq = skcipher_request_ctx(req);
 
-- 
2.17.1

