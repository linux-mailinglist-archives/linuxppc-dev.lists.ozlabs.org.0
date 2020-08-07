Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108A23F575
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjcg5DdmzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:23:15 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=ixO/4pj9;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxH6YNqzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:21:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koRfX+ELIry8gzN36D4+VCbXKEK+oiebuagAJbFX5mS/TLfxfNn8djPyY7wAnbaNYj8znM8wFCN7fNi2gPngpKbaXsy0eTN/YHM+kAuVyOdX1IBkeZoebaPRyynD68PNR4Pj3X+dPO+9tuegMQ4Bnk3lg6uUgIBlxAFZjZ8ttsCC+4r8kdp+51ATuYpqeNOJrRADSdqQNmpNr++9m99VHeenQjtukvn3bcZNyaG9CaaDw6a7qd4p45RrZPh+eqtlJE9pmn99XwDdIejzpyNn/tUQa+2W//Lf6F+veGITpVOUrsViEVAXYjAgCiSDMZbtxfSncjiWmj0BeEycPOL1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ehk/al5YldKkn6kPZlc7yCIC51d6sPnLi7zv7o5MQ=;
 b=TA02ZiLu2kSNyppoqtiH1lTzU1Yg63++Sjz4bcIS0RreAnNd/6VcXjA2W55B9Ds0xOBs2g/Y3IIjuG5LfSIRiKsQ6VU+PUB7nE6THZHX35CO3Vnj08Jffw9z62+cltygdVI9TZF0ljhdzM50a0TCOffX2gBzmtuAoQw+MJznmgHlaTB7zpBJJPCm/hBPC1zNdfHNo3ND9TRvIDo15FnhwUH0cOpIqawfS5Ydbj/kqBCbQ/olLmmqRYsxy4NrBe1rWd54PKCk8rQOhDbTKm7iLd91Ie9EHfsX5hANZume9KOz3aDbxSj2+ZAhCGKQnzQWxAmZeZmYmykt7Nc8FWSGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ehk/al5YldKkn6kPZlc7yCIC51d6sPnLi7zv7o5MQ=;
 b=ixO/4pj9sQPI/UVNiEnreOZN2kqwYPRnexa6eSvmasqSVojOKnlw2CAud9s67F48n9dUNCQxDxvUCilsKGU2eR3vUJpmHZVO2WaYWAlUhYZffGByMh0J7yec9uiw1gewPJcikybji/Sc68oFvcxqvGH1YGSvcpNHZiAGeqg9eiY=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:53 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:53 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 07/22] crypto: s390/paes - add check for xts input length
 equal to zero
Date: Fri,  7 Aug 2020 19:19:55 +0300
Message-Id: <20200807162010.18979-8-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9325de9d-1130-4bde-e6c0-08d83aedfee8
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7359A6239A6299F40067E55EB4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwG8XlwbJs/hww0tE8xCdhTAO9ATvOBwD+x/Ojy0NW1xaY0tmtrIqaEec6F4GWHeQSdzMiqm1F0sruEFvs1fdLz5VhSLd8tm62ZMcELsGRIuT/nmIccXHIogmtoOfVFOequAwr9fIC3c3dict3uOgjdanmDrbVe4O3MYr08NyZ747WHrIKa2RKkscQ+IsIMLyydxJ2/wRL2YK5Qvf0heWbHc8HOU8KIsOgwKSy/GxXpJs1GnVS4LnoMDceVTJfZ5ZNL3F+t9l7RTb+6Q4M4whprg6OeMtEsx4Zm78qi+0oUUk34OXfxFDaMjZ7bj7NvkACiPyqerl7wL0QWGiQ3wow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b0gRcUDAUPn9zlDJ+oJQOX1SY4FOixk8zoR6ynwWNhkSQosARDIOO3Xncp+xiFctcG3aHC6lXx04F4qYXrSn1u+saG589b4hx/QNFhs8T4AsJnw8vk5Xw7yuo+zl4MlFApisHiAcSj9f2kEbPf3CSuqiskenojvHgHmMiLCK72BCLIYeQ20R6EpT+zsxYOYauuYupiPgDCrRgedot97twK8+eJedcl0asvi1+Xu8U+hGUTPjLK6ucoZJZQ1uJWf5/EPTcV+x7PWhOfT0MHSHd5tvaZ/IxjiZjA4IAF7f0NIMSfDjOLugXgCvu7lHMYcr/9U/bhvMDKPdKjm+am7jzcHWZInbRg8hAZOkS6jI7/+iTViDf9rrhdV3oxibj5TqvlHHtDdRetdJim6pztry3gSAuoqSXcH/KC6i1ceKddlapXVmmHc+/afir73O0vpDIEJMVxIxtxVCPpDTYIBpQnvRwdfDFpmBPMWJ2ArBBU8rj5UIrERo0xTfe9cv5F51qIOtfd8pLg4VHnxgI0QYGRFMwqfSyfs/X82V25xdladQ75HMEAFQSlDWnF7/fgqv5kw2wsiGr08uXWvohLkE6VZFUCb2HfYSHEKxMuRLbkbZVgtUHshyCe8tW1HtZKdCH2F3ClJrmZ6/rxwm4RWIcQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9325de9d-1130-4bde-e6c0-08d83aedfee8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:53.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyEk4SFo4p/DP/2GZhNfsFgmRZcR0ccOtJ/TExqOYb8JO1/ahBBlI+Z/1x+SfJeUb0R7y/jy4u73EJ1jjSHdlw==
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
 arch/s390/crypto/paes_s390.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/s390/crypto/paes_s390.c b/arch/s390/crypto/paes_s390.c
index f3caeb17c85b..7f0861c6f019 100644
--- a/arch/s390/crypto/paes_s390.c
+++ b/arch/s390/crypto/paes_s390.c
@@ -494,6 +494,9 @@ static int xts_paes_crypt(struct skcipher_request *req, unsigned long modifier)
 		u8 init[16];
 	} xts_param;
 
+	if (!req->cryptlen)
+		return 0;
+
 	ret = skcipher_walk_virt(&walk, req, false);
 	if (ret)
 		return ret;
-- 
2.17.1

