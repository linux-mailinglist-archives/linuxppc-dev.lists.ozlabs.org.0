Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B339823F57F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:29:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjld6NDWzDqnl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:29:17 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=EVCVRKrb;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxR03JdzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3RGTk09ygxSQ80DGG+dOz0w/SsPCuRYWB0FuDWDm+UBkQyx/ldJT+NdwTd7JMdqUnY+SEP9IQ6lItMEULEHH0GyFNK2kXre7umfNrXHkWHurozcGi2UjBQPPOSpbtIRoVVJ7Z6rX1+l6V5lUE1OxryeIhacBtf2OdMpC5SSSAl/lu8id2aMNqGjLtJM2/FGqtzPiYsl7aAqe6oqmSsQrt0NCaILYl/NSO1Ybj7gW/dOdvgHK5V4eeyQhuyMwoRwNhfUb9AeCY/rKcOzTkXefq86IatU3Kcfqcy7WmpXkay1N1FrjQeUQxp/TiM8jBTzB1B/V882Szuzk3AHBA55Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGAI0FSQtGa1W7wr/8FAWW6f2InP4ATUurXANDcHZzg=;
 b=npzLdQx+g9LU/KxB/FnKWjVLQLKgbRSW/S2zkzyreH7I6HbE3H+ef+PkYJZdUECixTL1J7MyJGLbJ9kiaS71sG2fLsaLwmfelngqSX7ZvIUq56YCVUpzSj/tS4VF3UOL6ZuvN42PzNrWvbC/Bb1ijsBufVHe5NQ40ZFMQD0mp3QgTtG9P/sQAVk1BQaRf4JoaSaDodG4ezrI311c1kkbReFMBDeP+Z+pel8VCa8E+ZAF0g7AVkfS7uV4Khu84yEJ+b6Xsc/Mt7l9T6eYroO9I00OmAw8wtT+D9rUS3/+W6+kXygyHuyRM9KiS4O9f+VostQVzAoGaS+qwZ06IkniSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGAI0FSQtGa1W7wr/8FAWW6f2InP4ATUurXANDcHZzg=;
 b=EVCVRKrbTVRKFIfjpBj3+RSxR2eSTJQZ+QOyx85Qw4/VH14v0H7nqkSd9Xm3wdFBcBxjixJs+KyOUOXUqWD7c+7mwmYiUGZTMS33b3ow+CnwcS87kJopzkO4NluGhChnSbuG2r17VTDK5TBTRa0vQbDo351PRFcP0Re1o+a8guI=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:00 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:00 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 10/22] crypto: atmel-aes - add check for xts input length
 equal to zero
Date: Fri,  7 Aug 2020 19:19:58 +0300
Message-Id: <20200807162010.18979-11-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5371cd09-9f38-4e3d-71f1-08d83aee0317
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73590A1C90F70C0628A19904B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dy3Zhf4iD69DWnLN4d/OC7L53Vl5faPTIvVzC82or9Wmhst9C2xWU7uGqAwk5TS1m1kMbnEmpM8jvb2wUs7f+uRAzozHRVJGfNVQtSP0Ch0vt+Nt1lCRAKbPqKsWGPPZHOdfeYMePJ8yAf0mwKbpwgv5Rhtek2Fo+dmFZVfzsFKd5HO3x/vIfNwB8lbuj5AvmUBRTNo1dxryj8kIhRANHPu3fYa7/hS6g8uhcQFwULO+AUXSHs6E/0va0mEi22EUWC0egBLJGL9acByJcuUUxhXTY8DX6sEQpYL4ERBFvJuKw6D6V7dp+am5dVrE1Ymb5HN6zqHNzm2UWOfiFm/hww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ppMcg92PuluV6w7lwFcacI3tLpRbDdiRaomFZV/EYzg5y6t/ck51G2oGpJHIOTNsMRkgUkkoemOOGQoTlqgGLazRVCheBLsHPmPOB9KfhPEh9Q5ApeUA+uM78XYJGiFNPduHtGJSndd7B6D+qhZaOTPwSmuW4MEMWWr3TtNqENZVCgRplfjHzxsMhRUdovV+9Hyblr3HwL7IrqXlgFRC38Luk+dYX6+GiRiG/r5delHT/7egAvPGUH2ClIoxm7eGzb3Qs7Tmdn8jWRZdHOfu+DPZQe/vlGgWy2Kux3QqxLI2MHvycqo5Cw0NggRT1AxsVi58rTPqFgb+rrjBDQG4K+d9kuqupllA26d6R2sBgX8IsvRR2NmqBW6HVqVp4675spAxA+spGhx++z0hqwJ8g8msLqHajqCoxhUnRB8AaWsgmzjJs4UzApaqAJqdC71wLyRlYAMM2rMJgV9gL8vizQSF4Y4e55lv2CATMWVo0Z+dd123Te2FND5JeZH4yYIaPHtbNhJatrqm0F8ivHnht6JdV9VZK/9TTu9JK4w6tlaTRz/9kRZ9wJR4Py6KYElXKtrRRxZisXnPfQkhunGhqSPmhZJ4BYpUorpNGC8CgqQgKDymmvixgibkPpEdx/NR2wfMtP4kZpJKcbRtmYENaQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5371cd09-9f38-4e3d-71f1-08d83aee0317
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:00.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w66WcXabl6hxYafvlXj5ULkyPevq00owFCnj8B467gsTVEuqqJ/I5lF1apL1zQR6bWDhWuXtE0X2qPE+wdkozQ==
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/atmel-aes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index a6e14491e080..af789ac73478 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1107,6 +1107,10 @@ static int atmel_aes_crypt(struct skcipher_request *req, unsigned long mode)
 		ctx->block_size = CFB64_BLOCK_SIZE;
 		break;
 
+	case AES_FLAGS_XTS:
+		if (!req->cryptlen)
+			return 0;
+
 	default:
 		ctx->block_size = AES_BLOCK_SIZE;
 		break;
-- 
2.17.1

