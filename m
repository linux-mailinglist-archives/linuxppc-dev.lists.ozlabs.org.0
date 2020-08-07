Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5CE23F584
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:33:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjqt51nTzDqst
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:32:58 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=Cd0dPLXi;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxT5rxdzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm6dviwwAf2PjOB+mj1d9s6J1T86JrwHmg9/mC8lNdxFIvh+L9YOAght/wlNtDiWzHRutdlGoQKi9kheE7s12hdv+JNRRhnTVUPv2DzRPqn4kErCS573HRK8/9Od7CNswrucK7/TPjDQibiddOnhQw/ENdyKYansUHmCf85LDMyM78c9SXcw32PLaT7WLTZSRq1sEFVzP3iIvoeOZNEZ7SaAVyZuARMUyA4/aYEzGRIL8qlELaV+3d/LCnBPRV7m6pmcp7cCLRhbO82Rw4kvr1kWWeA0y/3TYCL/iDeeAb4roWZ07BklEZEq1KCQRx5DTBURQnYyiRLJKS4oSq7OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7FjjUWWehnnDflGEiGda3DXaSAdif7NU6dr7Lr/AJk=;
 b=BggAoPc1XhHVXPOWhS/DXxmbWZLWRZewKNFM7crWGdxOU0kSvt9VEoSXhBL2WBOU4dyZfHNRBCNgbVQhcvM+owrnlj2f57ImhyJBLYcl4L6Zm42uX1J18jo5B0MHblUjOREIaDivl3vyh7kQVwzatTrgWULgjzun/4DfYwnit/kdO2NbUAyR/eWVINqN3cNNC59wh8XLNAil/4pxCDuABtxgg3ys1M7uJW7sVf7OfhvMWbp0oKIIFu0LU70zLVo0y34iwDpn4PwcTXN30F8+Uu5E4ikU2FgeyHnfZWLMy90+aZ0WS0sdU/Ez6MHsGvDYgKUes1PFZeRm2uhIHGwasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7FjjUWWehnnDflGEiGda3DXaSAdif7NU6dr7Lr/AJk=;
 b=Cd0dPLXigtW0eK7CVynIeYSAV5ePimIL3dnWJ6ICBpKffXbkmfoj3H3zZMnBMpt5Wn5B/UUm9FgqRjkHkSkYxv80AsT3ibK2flWZT2cuLLH9vjKgJOA7AgKkG41IfEy4EKPhRIB+h/7JeHrM5bLyy9LCvteHSDSR3YO2Ct0V8wU=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:04 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:04 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 12/22] crypto: bcm - add check for xts input length equal to
 zero
Date: Fri,  7 Aug 2020 19:20:00 +0300
Message-Id: <20200807162010.18979-13-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcd8064f-e894-43b4-82e5-08d83aee05ae
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73590394A82B5584AE01BA4AB4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYKwBFf/wr0EZZ4HND7bVGK/8n88Ut2NxifFN3OIzcItBnreE3+9t3JML2rJfvX477CHf/l0Z4rsojXnfBmOh0V8xYaSpJZyNMvAI96lXfhkBQMBHJ7GWueWs5nN9XE5uEGafByn7tSalgnq97M4CkcSBvlUC3ksbpgpdDlG4X/sP6U8vAvSR5p1N/Vl8CNN9+kJUslKE+g1WUjpHReUnAsOM/RJ09vzq4BlwYSVCl9EM/mbUKm0fPjRkvZa+w/Bk1jW5jf1pwmxmcH0l2TlPgRKiA6cYqP5F/cmrzjyU4DKk3Cs8rsVwYV++qSvlWSKibbfP28xxTP+R7IzC//3SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hdHLo9wY47r5JM2hO7BQ4IakkKwJxVz8OsWlwFyjcMwE9euD8IN8jQSckfVi9S/vxU0G9vKujh+3YaOC9Q3I0wDb7+7eC/U4t6eh5I5s0Hu4JHUU6fAYiRDutsd0rsbwPIflf6M6qOyuDqQL/RTZ0J80xTd8tyapvTQA8/6rXIQ8SoNxYNz1v/SXtxX5UY7RCKhvSAuuSCgW7ngrrRhfhzKLLEL3M5q9w5UrePlnz0yyd9MpKOnCwQN3zQ3cMEhg6S5sE8Htxsp3tDoiuN4nlW2AIzG0meWjslgRSdu4bBYLAriGzaxSVzNNFD317uvFtjd50Ja8RQ7rI+XgDa5RtDrXH1ia4qPMS+eclYQNubsbsQMiAwtsfLHAHyVovzYntPIyPTpttdr0a0NyJm4OgWK4YH7tTWFdKkD5ljR3U6EFR7DxCSHp9em6Eji9Bm97qSaKJ15PliU1O6GK4LbLLT71mZIfN3c4gXahtXVqBMRvGieKaDfe73Fw+6MSxbzw+zs9g10ZT8mkfPBbfdS1T9q0ewSh9h9qij+UgSVcSQFNP2qhxf7XA3IijdfmFbsQfTs1RoYnT1F2MY9XqyNwyYbIHdKCsP+rlif+Ha0m8Ca0WirXsTi/Hai9as7V7kfOeaTaUxe8oO1RrTmpsBfnAQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd8064f-e894-43b4-82e5-08d83aee05ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:04.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5IyhQrkTWoKKjiYoM0xUQxeYOlUNCmuVcwXU6x1yA7JJ+M0X6hWnRA5vN/idIYliipCPuA8GsGJydlVWIspVQ==
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
 Tang Bin <tangbin@cmss.chinamobile.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/bcm/cipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/bcm/cipher.c b/drivers/crypto/bcm/cipher.c
index 8a7fa1ae1ade..8a6f225f4db7 100644
--- a/drivers/crypto/bcm/cipher.c
+++ b/drivers/crypto/bcm/cipher.c
@@ -1754,6 +1754,9 @@ static int skcipher_enqueue(struct skcipher_request *req, bool encrypt)
 	    crypto_skcipher_ctx(crypto_skcipher_reqtfm(req));
 	int err;
 
+	if (!req->cryptlen && ctx->cipher.mode == CIPHER_MODE_XTS)
+		return 0;
+
 	flow_log("%s() enc:%u\n", __func__, encrypt);
 
 	rctx->gfp = (req->base.flags & (CRYPTO_TFM_REQ_MAY_BACKLOG |
-- 
2.17.1

