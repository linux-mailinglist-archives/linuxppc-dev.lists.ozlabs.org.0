Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF25BEE91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCpN6hrzz3fBJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:30:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EhotxXxA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.44; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EhotxXxA;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXChC6wrHz3bN6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoBD016Xu0thCtCrdVmmNI815+NDw/leEX/xhRyAxKAbUGgge9gYAJbktMY4ZHe/ADqYo1oFgTW/lmKoWQEt0uQnHSrcDHgsALUPq4OS9QHwbNsrv5nwC/OQHo9F5lVAYjsxU4lfCEwhsOQaIaQvxPyhNJc2PhJcaGoD1caednaLNc3XUhU0w7AcCXHvhufBcr0HdJhaHLbOEQlJZIhaKZEKPizOXlOoi71oKVrYQh7I49YCBsQ9cgEeLnXQPQhLapFkyjPXqfVkiKm3D564Afyi8M0fUbKiHrIlQdV+Bi4OR0l2Pe3hisAIqfqTYhZFjNr/cAGU30UXX0NNwArJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evn3WeTmIRvwNry8piRdsza0wD35LCdeMNEPDP563h8=;
 b=cMxP0uj7I0ikS4gB7QkYtDupFUbTdKojrqXor7I3peoX7KNHeiw0PMY22SOCtaaaeFdWcAXkvk/5TKvV/iXPRzk6BRCcSx+BZSZKleu61hDQahsw2xs1XtQRTnTyUJaBYqpfmf5otYyuz6kDna/UoEwBiMoCx3JCG9kbtTGV9ybWy1+62BM37d2zOpDD1vr0X5WefZuwj+h+AFLwpU5ZifFkKqswbrkj9ROTuUxsnDtbIQr+Vc+ugc3URmHMTZcyT2rAR6tUgoBxzSAIJ5ai4JKZC1ENrS9AIKHbMSMAUlk0sPJAZgn1j50JNHIsH61MlmxlRYvmYsZ0QbbUVKkzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evn3WeTmIRvwNry8piRdsza0wD35LCdeMNEPDP563h8=;
 b=EhotxXxAwrmjql6OwtIM8ofdgQY9a+J9HB8vHxBQlLWtrFc3A/xWKyL6CH4ZoXNwdHRownt9TqQS2aH/KK9uSD2YTiHXnZr+9fa+W7BhSz0M53ANpIc0Lr+0QMQ9iLhXx5ULzT6pFverTN2ea8S03eGjuFVnTuswZoEwiWKPPg0H4dly8I6HLaqDnNKM5slID+G0HoaiHUMV0o34fRAK4BLpy2UsjTgKKGa70pC3Wz57gMSw/lsgTnydHiki3gCKo+Yyf8M0fkLduvN4TvSr6rZbAcgUKrX4pF1Hoq7NmjFymIiw6kUc04Ctx0jrRB5Igqo2Rl2IboDOnBwuMi8XKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:15 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:15 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 1/8] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Tue, 20 Sep 2022 16:23:49 -0400
Message-Id: <20220920202356.1451033-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220920202356.1451033-1-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8419d6-51ff-4048-bc5c-08da9b461658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	78WVUx2eSpmsHUdiKJS2c9KlQCLAuE1I7aQ4VZ3WzbGzYXyPmrKyrERh9pGmk3rqqIaurQ6eWjWObyTxib3FLCLB8d3g7IQJxiccRzB0gZqziFIuHW1nN0prBJCwyoq/FicclBvkySSLhg9P8z03ezyqPi4SHkC+g8NSfS4+5FfMXl3QzI5kuYkbs6uoy1vodF5fu/KYuz3FYx3Ot2ELItImGtYEMrSp5VjFjAxud7Ax7grTbwJBGcyAunvZmdF6u5j9mDp1B9jhLbPCD1yKcc8XIIMK9Gi4e7Fq4I0xx+GPPIFAnbtP6XVXIkaytUn2mAhbO+KclRoKlURkc+EM8uTZ0baIJ2tOJ2TGAJMcvaRLLkASqL9tP66rExT3MIEpO5dPaxefH8qybtSsE9AwJ6ixcuFPqJgHnEOcVvZfrjrsGC1aeGv9EPECcSgGmeIDhq/qeY3GzEyRuHRus5g1mNKj/EWtOwCaJLY32TreRgOPC7GyQENWmtWo7+M2nD+taewWzxkECKALtL6mD84awzDGtCeZXRBsXBVebrdkQYNM82t3qf0h9kUq2IY91j2OcOpVjQ40agsLoQnq60ooo+qL0uhwH99buP3OkWTm/5OsZZFd6YJM52kML+ml0vqGDpQWp682wP/cDJZ1bdaLXBR9MEtFQzQV6WKLMNOG/MZME+RdWCmyZUw0sj+1HOX2Er2EmYIjjt4hi9NhYkpcikOmfxPqA6CXBhCC3boEWv29m8orIE1HeV9j+zhzK7+5m5nmWUgvRQ0twTWS7W+baUi6Ntcyfvl7A4vIkok/s38=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(966005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3Vo47PgWF8igerGTq//Nan3FTmgnWL7OasFyfka2jo7Paq/On/YPXJFM4eYA?=
 =?us-ascii?Q?Is+MvDTyjx4h2ee5fcCRWWPvoFHTDfbQZgIF8Ck0IgQ4TbhioQon+4+IjaYv?=
 =?us-ascii?Q?wZBtw4ZRaGNHFL1No6h8FBBiVxQBrrOPbVw/LlHZ29n8IoGwfgYEt0sJzDpI?=
 =?us-ascii?Q?nMjLgcXOPLPziJBUWFfEi0ZzpalsNUMVTG/oPV7OGV5BCbpCrYkSWc6bi4bE?=
 =?us-ascii?Q?QPzcILGDJN5zkDmk2MwnnRxZbElLfYOiR9bXRiOa4R3GRNKnf1bpkySzMa6o?=
 =?us-ascii?Q?GOrm6k8A8NhbDQzL99mYg2r4nvGTFAFxJl6OJI3H2aTROnLm4InO5GG8ZCTE?=
 =?us-ascii?Q?HeqhyEtwQCvFlMAExiKOJST87VJGenaf1xJub9oisi9cMPVTqn5WUKoryz0S?=
 =?us-ascii?Q?2Lsf5i537+oJR4acySth76uc8rr2Y2gaH/UlZE7FJc4hwGG6O2JNAuZzck24?=
 =?us-ascii?Q?Vb+9vk7G0Gb2r9Yh6W7bhwrxWpjd37XTZA2wigWIS9RQN3q2r/1DPFyNsygX?=
 =?us-ascii?Q?WGMs0a2P7VRe355b6EzS1lE26MYr/XfLWAUIY83LGvESVKgiAcNTU0ycKFaI?=
 =?us-ascii?Q?apAZ+i6qAsxYSOA3Wa9trtTBFhfaJLPdFuDvi3pq1IjcP4QPWXBYXAEM6AIb?=
 =?us-ascii?Q?ciYyBfXivU5xIKZsWIxdCah/ag11Hnpyl5IFwFDmXBOJkvsocyOnmYnmRvww?=
 =?us-ascii?Q?hlEkDM4imA1eA3KxdOUPYVokI//n9buxzmLXXPscnafIWHNlGeonPtZrcNt5?=
 =?us-ascii?Q?Z1NAyOCdWP2N0p0g++1/tDrrTR5MtqGqMnvR8oJl+atKJvT8PrtFsXBGwB5h?=
 =?us-ascii?Q?L0122DctBhSu1pAfGiXYvMSK7vZkZuQWbr4a73LzSoBqfFRat8sBW2hpshwQ?=
 =?us-ascii?Q?31qhvXLTSL0r+NMWEHoFdk9A8z4ZfPRk5r951uZ6U+n6yhZ6B17uAmxveQP9?=
 =?us-ascii?Q?xEjSVPGBWpj3MMi+Q8dWLuPaJc8/KIdQqs0CPUPilJ6rIsF/JR/TwHqKxUNu?=
 =?us-ascii?Q?SNtQXSag+wiOxML5HKEcAimqv5RczslnYJKGGZ61AUfka9wP7EuCV42TTHma?=
 =?us-ascii?Q?YHUJ49DP74DWkNEncWldbIrpcF7xVp6HR7Dq14QUytMFAyqlekyOo5+206QO?=
 =?us-ascii?Q?SV1XRMT0j6fhuQMno0iIr+oFKawdMaWiOrw3buQXRbN+Fh0XyJXn7MY9xjcF?=
 =?us-ascii?Q?jbYsI/OGzh87sSxjWOMrudUrANOL6QMQJygHi7U2fbFJKeUh3aPS+IoJfa2s?=
 =?us-ascii?Q?9FKREh3ALsUbG/SCbhiEvK9qLsgdLgRRhyMNduvvzw/kjjmOxYS6nIhxS3u5?=
 =?us-ascii?Q?bg08YsvHSq8OAEPvNpfQR+FT0qUggV7KFJFZaCImC7jG9C8VTjzTKy4Z0r2H?=
 =?us-ascii?Q?gEmdRZGGYhAnvE86YgR281aiZS159rs11C+92q0V+ACiz6cmmZ0vsWX6TWkt?=
 =?us-ascii?Q?KAFXocyZC5kkuCN1PYvtQdWg4wUFwBn7vaxlMzzmf9ijONr3DWATo14+ZebN?=
 =?us-ascii?Q?q8MSOZLT95vHAxk12JxutEMsgoVjACTNyn9hb9f9oCapriKKl3E2GTfdT5Xb?=
 =?us-ascii?Q?bEY2y6HeEespmkZ/aM9odQiwKv0kfypggd14N9k2R3JKFJ5PAMHUKCaOQK8D?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8419d6-51ff-4048-bc5c-08da9b461658
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:15.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWvksgXpw0tMf8iJ4m+w6Mw53T2CPTm6ybzTf7tae5fSjCZ7XqZmWVpH3Ofb6DL6RCMVvxHfyzf+wnHV/iAlZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
spoken between the PMA and PMD ethernet layers for 10GBASE-T and
10GBASE-S/L/E. It is typically used to communicate directly with SFP+
modules, or with 10GBASE-T phys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---
PR increasing phy-type maximum [1].

If this commit could be applied sooner rather than later, I'd appreciate
it. This should help avoid another respin if someone else adds another
phy type.

[1] https://github.com/devicetree-org/dt-schema/pull/85

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime

Changes in v4:
- New

 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..5b2b674d8d25 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,7 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_2500BASEX	13
+#define PHY_TYPE_10GBASER	14
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.35.1.1320.gc452695387.dirty

