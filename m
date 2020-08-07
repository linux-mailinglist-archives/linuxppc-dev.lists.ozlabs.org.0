Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9223F573
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:21:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjZl3z09zDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:21:35 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=NUZOsrO4;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxG0397zDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:21:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9uDsvtZFmHf3sotPRdQTAYXr0uYiZSTWK4qSK/gTloBuOTpETZfcgti+tb8RQH1icI6w/fM5Deu3vSLaddkmZc4k73BZyJViF0YJacD9DTLuay5B+/++9ukkRlAe7RWcpmVB8TbTxr8JBPTm7kSndf5m/eySDqqbA+rwZxAvrvmVio3ar+KvElqL6sbJj4/20G7Qy4koV2TOq6nwXXfAuOX4od3YH1NHj3iqLNqIb4xAO7u4yuGqO2i3PXWsk3mSJzGRM5S9nTCK0s/rHZZjCrqBlUB/RAAlSOaG6YqIKnDNVhQj5I1yEZ5j4knm4siEPcLIz190XCYXt0cOuwC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9hlijDnz8pnw2mzudwtNwqJgqpFIk4v3HEQ3z7pw40=;
 b=OJO8TLXIR8S/+EkvMzxz4KqDyyc3dJXuO53sTNfa9d3PSUF6pjDzk8/pYKXk45FzhrX4T4tJAUCApTVQPsteig8UaY2PtECi1/6hd0z4nsxpazaZIkVnS6zspHF7RzDnX0retT/6LYoK6Hp5GTLdXVItU4VC0qj6Z7TbhZZ4CDKXVuSvNmq3JQe5g2HM7Tx1QZKopFjTcUaRzqcQObtnpVxQi2frqCSXKXn085csKMlc6TwdNuEcxDeFBokJzBIybpJcJZV0ykQ8bCdbZlCyR3G1V5+B3dnHRnKg4TAS3kQmukR7LgcWpNPPSBuNdzmokIninRPbtTdVsBXhPlAIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9hlijDnz8pnw2mzudwtNwqJgqpFIk4v3HEQ3z7pw40=;
 b=NUZOsrO4/KzSWiOgnFFMz5qXnYIw0zmVztwQ5mUjM8qHn5bFnOWB1Eog1vEoyTA/SYJiZm6gBN9NlgTRXZzfKa2TSHn4vSH3zpkNa7Gx7SbhnSdumfC8BoWzfGx/cZ1QZsjQx9GKzvYIBRT0r+SwA7rED/XAlQH70i/+TEOgavk=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:51 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:51 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 06/22] crypto: s390/aes - add check for xts input length equal
 to zero
Date: Fri,  7 Aug 2020 19:19:54 +0300
Message-Id: <20200807162010.18979-7-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfe6a72a-e408-4c51-8bc5-08d83aedfd80
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735919F4F00224DC3A421D54B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/PCkoMd0af76YS7jWZejJkp33gEgXWqNkYIQWVO8VUQxzq+1fXEC6OB6jt9YTvowgHnv7fGTvKAr6gSbBexQfYcm6P5e3NUQhWzVUBccJ583WJo1Rr2vjJxfLj7uZLrfh9+PipT67fkWRTGkRr1Hc9K9Cg90epzfoJKEmol34FqbEd0GNoe6XyHFU9f5BIsvv3zeW59aAOSd5Wm7aHY/rfoL9A5ZrjLN/+cf2Fd1UZTSvOX1iMCgOBHvz6V8uCYZDxH4BDyFydOLE+RnVbjlKIR19+yMEpwAYvi0EwlhmXQREwBxwsqp0v70y0uTlHrgWmxDjtNBKdIGcESI8WOkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nUbB9ZnKEY5sR6dWoiCeS03naqTgOjkQnnarNXA3gbv8Fz6EfcB2ysU/DkIJAjBuhu3IF6Hq94Bw+BefrtjAvDjv1HzHtW9dQOfF22BIEJtdJgxAgIrE1xxrEsOyam8K6X2dYGf+JI55Bp9fZnrmI1JDRhXGZrFWDK33HHq0z8auub+xCXGVi6/gHeOG84RbaE5RDF8+yhaahQ8eKggMoKzT3YpHJ20+vJMfnT+xIc+mXE47cAJ/Rc7zPQhlgJkBVuWvCAt3QrzTAh3yoh03nj1AQmzW6bQlaGkS6I8i6LvAWjJyyB/gZFuWYZwfm8U3dacNA8TVQtpvumpo/w5PjhZ6wTBxLBqgtZLpKXQmI82e/VtmUlHiE4NuFexY1zezevEmTZy3A/SD3dyqnfvAsVUOx709mB81GKpqlUaTfUP/n/g0IRVh3iCF9ii31oO/UIlNpNG2+Xg6VUb07hGnBChdkk8jO3L/sIFUAbgOTE88ErkZbFeq4fOuYFcjo4lO3CWMZfI6bGU9rcioB1oBumOxN3FDhi6YnSMZmb0a89aFRUiiX1GuZBAQG3ECahq1E/TRFTpvaurlhoUXomSqHxduAKkR1ltEwNuXlDCXpztMK3M8XP8pQeK3NZdktA4ATP65kOzv7/Bf07EJ6xKprw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe6a72a-e408-4c51-8bc5-08d83aedfd80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:51.0014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBmdYFxa54fj5jfShT5KzqId889iqWDSIlEUKYwxlF/yRX60pXnFSKaheR1hxY6XwbCmSGxDGAnkAaBgGIaU7g==
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
 Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 arch/s390/crypto/aes_s390.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/s390/crypto/aes_s390.c b/arch/s390/crypto/aes_s390.c
index 73044634d342..bc8855f4b7d1 100644
--- a/arch/s390/crypto/aes_s390.c
+++ b/arch/s390/crypto/aes_s390.c
@@ -437,6 +437,9 @@ static int xts_aes_crypt(struct skcipher_request *req, unsigned long modifier)
 		u8 init[16];
 	} xts_param;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
-- 
2.17.1

