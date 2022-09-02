Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AC5ABA36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKB9h5NfZz3bSX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PwapkxMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PwapkxMO;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB936wsfz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:37:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exv0zuI38oO+g3PENNzXXzjSsl50+DHGmiruMZYUh0wlrhZbpXNm+3HH+XmX/DO0pa9GHwYSM3dmOzQ46a+dCh81svgdLddabO0zZrMkSrzrJIiivQ4EOkrArDYnI3BeN70KlquMqutM2LzhwjB2/YABmAAzX53NllCIvZZvdBcLmvnkfXUwiGJh7GssB0X9AgP2fJq4HMqxcowmeXOXDb+CNIjZo5uCOxE/W6BHV52l/Zof+JUAaDeZBRzfJjNehrQEnAy+ru2iEowmp1cWQ6F9KIHLy4PfLIWlg3OAk2Pz0hYuybCxY7bgnaj/B69uV0jqu7HmQv6LZX+NLGR6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GZcGIhDdkue469oDp6McdJPI57IxoOPqAIhHDkU0XU=;
 b=lcr1e1o5qcvktcbDCgRIV3SZBISsPUJKfJDGocwUpEHHAae42dtHWKiKG9v6ZHTzmZ/yDF3efiGW36T78aDQYJtDU/83/r/TrrbhPmbRIY7LMOCGhdVfe4mZfa0moiQNXl7ZYtdKKeO0vP6FM4ptvD7rrOOAgSS3PmsYd5NJdTFkT6zrQePte/MwvKBGTSN9o9EOZ/O/kGAQgPtI4oti/OgHpvIgyrEx59LbulkkHEjUdy3yesSWISQYsmxlCM7DkMDsBvpj3x8p/Bfcpxy56HEqfDJBzI9mWNQ6vKCLpElT6txLN32KIId33xGya9vhoPLNEcq9ukyCwP70CM0ZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GZcGIhDdkue469oDp6McdJPI57IxoOPqAIhHDkU0XU=;
 b=PwapkxMOijWJ/jFIA8zpqpwPhO+AA8e7XlpuLOGUy5O9wd58R9gC5f5GTQ+d9CQ8Z8A0Umgn2JG1UOz+zLTTkV3e82SlISgqEqhkhpiioxrfOgVmYB8EsIKL7anWIYkfC7deVPiEwm0EtEI0fdwPOA+JHjFA6K/5658eOCVE1iB+3kmzAYFQJlJTxinYDfJcB5JrtIEUlqxVjMAulqtBK1++avAcemBX08O/ZuBsdGc+fitL5eb3PZ2jOU9Mw6ntZnJGsg6KF96GoY/weisyD+PV4pa/8VRxdP4QjAxjVmJ88UA6Cb3SZjC13lRctCCGE5NDMTgGLNqKwp2RBUOELg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:40 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:40 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 1/8] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Fri,  2 Sep 2022 17:37:14 -0400
Message-Id: <20220902213721.946138-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 818ce82c-d8d0-4a28-a8e5-08da8d2b5c51
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	n0gerMDWMEmiy0jqhl6uwM+42UsUSPjhBONNHbleHdBvkztMvHIu72NheamGqF4fwPFF1ZzuOMdouqK0A5UmBSq7V2CrPTnnvdBSzMSX0DOVyWvrJkzCPlnu2o2PqahZPIAkV3UBnLZp0e6zH7zXqS9SZ+o6omLaBY51+N7Jx2A/bfo+CWYnKvQHL8UIfPTtjpY5I3bkAmJdeZqAPhs6bmNFEvLUOXybC5rQd2e9S7nXxecUgfQEtYYrM/Bjz6DzZDJmeIHZHH2hOxd1H2zPvHq233tyMA1OD+CFOdHHiRDLufpEQfQZUMCPKQLvRDBL1t1TgIEEbLoGR6GsqYsJCGVVGRj0+UZCSwFAe4JQMlQiu7+D5iTO0l7V0wX5eSaVvlnuq2VKtO2/lwWrvn6a4O5Fzqgv2MMzheyiyTb1swdDh5+m3JzkMt5bIxA3IdMsobYEifBNXS3wBgmIoJO2gj8yobpsp9T2ksWuFlqMRIXbiAI14IgFppdAWVdh+OKJf/JaAEiNasCQCyGf7JzuqN2Aqr5oB4Pkez9ZpgrEOUOlpXcBYwXzlpJIZn/iEvV4B4udcfO11CHR14BU7SQIptRIWGLEI0VZWk7rO0qGKyzY22WPeR/IHzvnqkXcREap2ykA3Oj/m6/TDoXuiRTy4V0Mk3Xt4bOEX9K8LNY4wQb3x0xplxF2EBZ2D4izHOxlykKyBSxS9AXIfsGd+Sf0ftSAeVPOuPka6BqSNPgsA14EvGMaHDeL5an3MUCRk5KIxwYR65jVVh5j6uIWq/R5mQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(107886003)(478600001)(6666004)(7416002)(41300700001)(44832011)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lYcRI3In95HKWOeYTCTlxGvEemyeHtblttY81QvpEkGaTojXdjxDSmDjlhrJ?=
 =?us-ascii?Q?/RGwgIVYlOhha9CT6EECv9kMBzdWkTjpZJvgvjB65OslCZ5I/HF/pRuzvHrE?=
 =?us-ascii?Q?IEG7/f3t+CIv9Hf4/hChZJvHZFpeQb+QyDFPKFFi8qfSTlTPQfgm5qQr2e1x?=
 =?us-ascii?Q?3FVNuUwsov05TYlI2TCoRTGZXLhvyeCqJQyTjtfw7nQLik/ArYzn6pcowi7X?=
 =?us-ascii?Q?KTGixWWBKGavFCgPyBb6ldRfu7o75jg4v8z3tqVSNZd0RiKQKPvINC2Tdpl3?=
 =?us-ascii?Q?/GkZ5bTlE3k0luSzGLAS3pZ3Zu6N+z1+Oabz0E6r8/jzzmNW6YHOEUVXGZxa?=
 =?us-ascii?Q?PYNQ5wNfbiM++lnLCd2BxboNWNeW0Yft3kZCSZi2PQjmiRHQa+DI5XsD+mc7?=
 =?us-ascii?Q?T/SaiBaMTuBzqczGRrBnGVxxwGFoIRCFXcZZAH/ZddGd63mkBw/LZI5hO971?=
 =?us-ascii?Q?2yS0A3cV0QxLnNmvV1aimikDNcVS5Fa5taTi3GvT4e82H6v0fgWDGh029Yyg?=
 =?us-ascii?Q?/1mS7r5mqksKHpa7DLjXwMf9aR21WMJPZ4WNBK2eadmF9NDB+iE249B+u6oC?=
 =?us-ascii?Q?HQQbQn/dlORkvKibNuxM0suiyNeZWzzna4pYutgG6UlPK9DzmsBefJMmDXKJ?=
 =?us-ascii?Q?80jz7tV0g3L47i8xgDjDJOoLothwnUdXooI8fSyV8MEqHWvEsZ5BnJie9g6b?=
 =?us-ascii?Q?pSiNRiR/6SgSnPbxU7cIQailE7QHkrLdwaJ5exi5HNGitPJIif2KPG0JLz32?=
 =?us-ascii?Q?tZGvrTVGc7lQtVs7SQ6IbbhbkauPmBqdY1PJ1JctmAXWhTaTKzCUbLpHkw0D?=
 =?us-ascii?Q?lZm1enzh9HBIrwEPO9VkNPvdFi3SVpja6mbsT3PfAipaiKq6Ihwf33WSeCar?=
 =?us-ascii?Q?VKJ/Ch2MxNM3o/IIgFQ/4zhDCfH1V4hmzprhafKUlGH2pETM3fBVDhDhl2as?=
 =?us-ascii?Q?/xePjTVGwPg3o1dasv2WmuOhhOoA6Ml5Kg0MvkdGpcfWKYyXZ86HNxcfMX86?=
 =?us-ascii?Q?EaH8UetNHLVJQMG8fAL8qFe/HWlaBS92zVY/+qLoWv6I1/QBwdftpthhrvjX?=
 =?us-ascii?Q?yHz6h5XF5dnx53oR9ewksxenVL0Oq2TD7PmmBi160FS9j7Mk0Yk37MJTvZ7h?=
 =?us-ascii?Q?u6usWATd6MWTO/RYof4ysJS8y2pmUJwhgwzyog1cG6ZXvBo4G1TS14m0y6wN?=
 =?us-ascii?Q?TrUvpA0ugAnev3RYfRuZ1NOB99WiXM3ZqFaUDYeBIRti+xaRPMTrRtXsGQGT?=
 =?us-ascii?Q?kLj0umczFo5GfkcipVlKKRvNL7GySS5BjpTc96zTMmWPPd2/Es/FY/ZEBvd1?=
 =?us-ascii?Q?0HMNgtNloV/JxeKsJlbzP77/xhk8ygA6FPs5TguY7zK0+p5lHzwPWg/rEsHb?=
 =?us-ascii?Q?Xl4ZM5oqKYPthiTgyEPU2wMB8eFoMSqsqEapJ0cr0nse0667B8hO5kS6d5a4?=
 =?us-ascii?Q?xBtRXB3PO5hjpYDgPeJGqiBZ2qId1K6Jl9RpPQMvw2Fyt+XilV6jx5CbKfV/?=
 =?us-ascii?Q?+1ZOrhk5qqMOD2FGczc8zGTW//sU9UvFTAG6aJkx7H5ANsuVt+ToPScuhGVy?=
 =?us-ascii?Q?V28246tixryuDRIn5zLVVaFjWP0mUCj6sTbns1laVN+0s8KzEJphViE01kN9?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818ce82c-d8d0-4a28-a8e5-08da8d2b5c51
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:40.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNuq4Do1WeWW1blLbqxxeXhB5lA1gmgCjTrddQvQB+Ah2fGRqXo2gYKWgrl463lbbQTWPX9z0dEf9EPj+DbOXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
spoken between the PMA and PMD ethernet layers for 10GBASE-T and
10GBASE-S/L/E. It is typically used to communicate directly with SFP+
modules, or with 10GBASE-T phys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

Changes in v4:
- New

 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index f48c9acf251e..ca2e3d52523d 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -22,5 +22,7 @@
 #define PHY_TYPE_QSGMII		9
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
+#define PHY_TYPE_2500BASEX	12
+#define PHY_TYPE_10GBASER	13
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.35.1.1320.gc452695387.dirty

