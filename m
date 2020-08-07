Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E121523F590
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:39:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjyq0S1tzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:38:59 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=OcztL4JL;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxf0Pf3zDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg5tCAPbskTxHXRcFI2IxpsbccuBWg4+DyIfw4XHQRsyUJ8ByD2IyiWIXu5z/D8Lb/2lM87KWYhQeJhGIeBsNx+q19Gf2+k9AX9fYxfv9pS8LKgKJRthtCKTKyVPtkzJ+hiZqOp2opQrUKmwdvwmbVBNXEYGSpWpL/2epSn2iBIJZ6lii69kuqe27oAohZ8MQYGRezt1sYC+1gmmCf5tcrm4uTVK4+RccOYeL4ilC7bXT+pHjKzgAugw9uPDjQqJVdWs3gMxIXVoUGKEUg+AI1kwkrmm/9+hqTYg/bpzRYjnCRDMKLLYNmyqNbmvIk2rbqr18B2Gwpuyn1sRn7pxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjSlTBIIU6v80akFULRYM9ogtPRvcvrubPeMrVm1zlY=;
 b=TEW4EZO4eCV2TyTw4oVn7E+eeGABzkZW3JpSOFeXFK2RY7dnS096Q6+laoYl0QQz3uM4NCh59Y9DS1FK5pBUJ3u+1DMKZXkIAowkETCdRUOkSvCn28/1Vtf+jHZTqk3OgCW1KnYSi8RIkRNHvdTk4xhSTK7iCvwIvetvMHu5ZzSbvQJYTi19fsRdk8gPej0WMxjl93eQI6Vx6RJklAeQ0+TQ6sb/jJGR4WOwDDyK45RtUiubifDqAIJ/5p8eFFd79w9Ms6xP84mAkvy/Eu877Qf9kDqpF2Y2QSkjHvCtZYKOTd2TgtUL5/N6ZfUMMZ2pVEp2QrVGe0TEEtazVqmW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjSlTBIIU6v80akFULRYM9ogtPRvcvrubPeMrVm1zlY=;
 b=OcztL4JLuai4EJSflIa3WSM93yeRXif4mNhD0Won38o4eBOSaBm20z0D0BILQTzjvRobKvuWsmnIJDVzFJcOMTc31z30RR8ACC+SSpOKZ2owmrOKsOBdX5kSJJtW9bUk4mjayaqMWY5h/RL0FMY1f5wHaj+Q2sRNWeo1sdBK684=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:11 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:11 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 15/22] crypto: ccp - add check for xts input length equal to
 zero
Date: Fri,  7 Aug 2020 19:20:03 +0300
Message-Id: <20200807162010.18979-16-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c8aea55-aa12-4cc0-c174-08d83aee098d
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735997D620CBE507D5B98E46B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOK+n5XPW2kbFHr0PjIzG8/ZrsoCyK2Uynv3LrD5ARVj3nsPGg47vJuiKVxr2Z/eVFq8Y+XfuTQOVGLZ4PNqooNOMKR7fxDIEw4bdcw6asCxJsAxFR1301bdNj1JlYfC+r0yva+gLx98ROyNB7eatZrClWu6ckFXNJRUKdCu3MBgbcEsqw65N7uh8FyFGQNBxpPoTFLnanPjLMtD9qcBABIk4z+vL1eyqyWFR5yD7q1FzUfTYwPEx7KFZkw7z9bXH2To539e5rRMbniXQNyS+tYa0InYiQ+UueIQ+aofeBqFKSQ27KBRR2+X486m7j6eIeck+9IjrmmEV4XanZlHjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lpJGRnJqG2qClVfiihcs5b61Exz7Wnn4qOXnUs4FW6m23pe00clos6oT3aDjz6VY0CCcWA/i3ap8ja6ATOe9QpbACguiMbKvCKcFvRkypKrVK9bZ1FrUGFsGlyuxrQiOoj6UuRi2FpaZXYjEz8fdaHdao3tWk2pMc+Mdi6zdIFFJwhAyoYd6w1rXUxLPcCAgHH+CqQVzjfRxMJYeaMK3g6AUuWIM/2HXC0TmkOwmCRKkG5+X5Ls4miQseLpJf6TFfnra5asmf7tQsqTYfk6ocY6uyHIAV4n18TRshaCPcWWn+hGsKu7k8oYdr523sidl1g8n7wdB48lEKg6XRWiURni+g2rElTfgawNCTbuu+4H3SDx7VsOZDmuD0etfgQit2iX63c6qBeDEn8CNSDHLE753h6Cybw3Wl0V1mrsuL//K1vYei0DLxI4j2QzCDyKSev0Bm2qQHFylesasoKAQmYa4dSqnAfBnxqxVGSnrpLPKv+TyS56Foyy9Qnvi9IJZOyyUoZCxkQga9886Irk1uLUloEwmup5eGuz8zxoRUUWwoYvUQXQwvWy1sKPT/la5c87IIGt0mCPdBQ+nTuLiJqUIIuDKHy3l7o55P+4aR8fvL+nvomJcUdr1HPK5e7ciWQ8bfXXHtpIWasuWbIE1hw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8aea55-aa12-4cc0-c174-08d83aee098d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:11.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EigcJqHnY4F2wXL97v4Eo4RB3trGiN4a+m8ANaUAUxjNl2juZQDJi95rfQyenyvJroXCf1hGDdVQUZ7PJJEHZg==
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
Cc: John Allen <john.allen@amd.com>, linux-s390@vger.kernel.org,
 Andrei Botila <andrei.botila@nxp.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: John Allen <john.allen@amd.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/ccp/ccp-crypto-aes-xts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-xts.c b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
index 6849261ca47d..6a93b54d388a 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-xts.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
@@ -113,6 +113,9 @@ static int ccp_aes_xts_crypt(struct skcipher_request *req,
 	u32 unit_size;
 	int ret;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (!ctx->u.aes.key_len)
 		return -EINVAL;
 
-- 
2.17.1

