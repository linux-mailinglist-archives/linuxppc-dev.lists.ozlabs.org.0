Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9123F560
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:11:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjLg2Sh6zDqnc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:11:07 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=MvyMCRnl;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVx51sRwzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:21:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg/i1CQ5kjyQ5Or1+Zay3AmsZnMD55UWypqe6QaLPscTX3Qk750PlqjpxA0qUMdNzqWx67jQmZ/hbUxnfOMPNbdSvpqvk2ItXbNEMQVBgjWWS1wWL/4mAZ0fQfbqajbMLjLrMRf7CwNfn7Fq1oqSojHVVkwagOqOfyrAfxANRQRtzIWNNRhkBMmA+8MpGDGehWYU9WphBxf1H0efz9hIeKmkKxQecRSuofhsXaJCAxOmjAk4iSt2We2B7sRG26MEz2EbZkY9gvApPaoTpMfhVxCSY0CrLErVAbWbUMP0b+OpraSnFwNxTVuf8SUVxZykLWYL3mIgcaw2caaN9ssNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPYv2itGQcwrWyNwsRoUTLKkbMT1wg5R2IXe3MyBWv8=;
 b=jMn1yAQBi66+f0j34wrBqwOaxX0ao6vmpB6BUl4LgW0r/i9psuct5tOA+zAdrD1y3f/8+o2SvcC+88HCyAwRQs6kh3teNyt6Vmt66bIa7xhjPS+0Y0nrbEMMQ1BoAs+BNYKbLueaCT1onm+s32/oNA7CHgZcPSbkcmAiJdlQcLFuC46Da90ah+13j3xSeFGPJ8WKx6FSViNXrnYhdI7ooQR17S+ZvBs0hS1SXlqQ4fQpvykhZPTWDYIOOk6dEh0Hm0LHbqZJTZaHfjRg7xXHyiD8tSnLITXWQk5DNMkM6byJiE99wiHXelrF8zP6hu3xfwLTSuV5ZLA3dr/KNzwgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPYv2itGQcwrWyNwsRoUTLKkbMT1wg5R2IXe3MyBWv8=;
 b=MvyMCRnlc70HAU5RLwJ8qe3LZzra/0l/CVqqmo3S/fqRLXkZ1OQKIVoRjcDxyA/WYu6tvcP4RP61G2+NLAorOVBXRze4pnU/T+CPqtycInc030lnS6BHtonwIPIGI/WuYI8DF4R900AqWlC2xpgTkwGdRGq1pXoVrZCqHG/W47g=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:39 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:39 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 01/22] crypto: arm/aes-ce - add check for xts input length
 equal to zero
Date: Fri,  7 Aug 2020 19:19:49 +0300
Message-Id: <20200807162010.18979-2-andrei.botila@oss.nxp.com>
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
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52d27dcb-7553-4d1b-c25f-08d83aedf69a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7359AEA7C3B697F3C9E8D661B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7826N4gn8oUxpE+6mblzB6xT1VKKyGvJhIknb/XgfNUr9TrICKw8gWjxbm96XqAkJMK62iG3ehJxpsII3Nq2yiJiOyakvRiKOM9AO/vjyZ3UiN4VYCVuKp3mWHcTSWtyDQihDUpke3xzPk1LmPXtXgM26vv8McKfd5jun9rOeqlEpapSMhbBoaJrUzuih1+zJ5/uQAM3xxQE3BgUxD+HbTTQu6nNNxZ0TNYZKo5TsBExRNTbhuxIoKbuvSaFtin5DbrO7Jb47K1sS6t3UXS7Kl65a2l/15AhjOlTLXQAw3Ca/cNUTKnOAc+4jKxBq5SMUO2tMCPyPBJTH+ew2jhZ0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /TNIYmfFIgyhtULMYTgFAsGfScfkFq7YD0b+JNnaQSdr+5blOz2mRjm3NND7/tZ5FjoGu83/8B/DQi86HVOGb1wt8VZ0R9ljdmWX8JQXnwWNADhFRGGIi1qiz1S6ot/WrbIMTpa1UlMP+bk68oLmjFmKf+CMmEdwrUkLWyC1W6dFjuzaIfuCRlMei3wZHUE18Tlr4KWXe/Z2VpjyIRJ8x+VIBKzbD4WHTvF5oyzZe1EyCRL7SehC1cULdyyQ+udfoIg2kclsgj+OIh2aT852m+RvLHbnz9I5DquD8PBdoW6Tng2fLbSdhJRVAmXd0RD0lMifEjZoAaH9YlnSYnjCAlBRWTACGDTj0LZXSU91IGcmeyZGNckdgxB1x8xQLMdaQoPngl8IiYaO3tMSi21Ein4Au9nlFCQpuvN/mpHJOFppmfjY80vfJaNP6tJEq7fMkspzABPryxvnZevvjGmGFQ4/mH84geZjVAjG6aiOQJ8GPcaWpYFwVE6JNYiR1c6PubkfIjZq+63n6K6M5Q81eG1bawclZmWiPGkHhYK72yK9ummsAKT5kUl2yooQKrNxQ4xMu8wW/kN7OUcJE/LbpLPKEacjfxhjAaB665TQLi79PozzStocrPkvkdbKNnDKff8MkAa9e3RwsGYk5nDxYQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d27dcb-7553-4d1b-c25f-08d83aedf69a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:39.4441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcmITPa+uegEfalX5ZDVKgdRcXHxD872TJKI65R2puY8uuaCk78SWqGstYoEGa/YSzGXHiM8lvnr3kZj/KD0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:28 +1000
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
 Russell King <linux@armlinux.org.uk>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 arch/arm/crypto/aes-ce-glue.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/crypto/aes-ce-glue.c b/arch/arm/crypto/aes-ce-glue.c
index b668c97663ec..57a9cf7fe98a 100644
--- a/arch/arm/crypto/aes-ce-glue.c
+++ b/arch/arm/crypto/aes-ce-glue.c
@@ -452,6 +452,9 @@ static int xts_encrypt(struct skcipher_request *req)
 	struct scatterlist *src, *dst;
 	struct skcipher_walk walk;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
@@ -524,6 +527,9 @@ static int xts_decrypt(struct skcipher_request *req)
 	struct scatterlist *src, *dst;
 	struct skcipher_walk walk;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
-- 
2.17.1

