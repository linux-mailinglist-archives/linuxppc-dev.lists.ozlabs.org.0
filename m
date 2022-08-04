Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5514158A31A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNH00wb3z3fBx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O1OND2k5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.2.72; helo=eur02-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O1OND2k5;
	dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20072.outbound.protection.outlook.com [40.107.2.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9Y6nb1z2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8D4ug3//6wdLGXkena3orURzVAYQuoOpaQJdzuWHsDUfAxC9YVGOmBs3zKKwnLt7MqUOMcQJGBGwN5xrw/MeqLmw3QHRGgshQJtv0lHgHA3mucU6vuPTh1prqEpY293QtjOCisA5jcN+8XGGFEmwq+Zj0lKXuVc/1zCsB4ecnM3voZhtj64OrSKbzo6vtkJ03vcpXfzgUe/lk8jKkCirmE8oaUZM4CDEjWNxYFdL8d/bhCZfx2qHFEEnDxACv1TOeyFFqrNb75KXuUidzFD2/2wuRAp3SzY1caOcNPCH+e1aytmuQ+Hh2vRDVDqIzSrt6G7ljCwj/DDvXLAk9weiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKxq/0RAymWIcWXFqksFoBLD0v2SENyUZixmAv2PcaU=;
 b=SADR/NZOEZrZpeonhBz7ewO7rf18iWomxNtf1VWhrHdtgnWLrOhBUkogtg2Q5twDuuQ87A73kXXhp71C/z466jlMElFhSxS+MQ0eeOArQLd+om9JNfsi8lH/2GArjgWfBI2gTUgKIETEoOLLJXKHFbp5ZLanbFRL+/AMj91tMEibSzGmJR1Qta5hU70Kmi6iSlak6Lik7HgafWH6WXV6L915ZPx8QeLHCraVGGRS8heRnVx705UPz/EdlHtyzkSCIdRkvqNnNYQPJCzq22CNo1hQOI7uz74vUvyIp2KMNHXTM1TfGyEYUZwvgfyLRXfNTrpHY7qbuf6gslIFXVhrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKxq/0RAymWIcWXFqksFoBLD0v2SENyUZixmAv2PcaU=;
 b=O1OND2k54FGWljdF93vV3PgAe+Cr0xBZ3jaPyON+aDy+iGxuOmCIEzs50NUg9NcB2h+ovfmFOxlpTtGbDDmvvRd23XX5ub/s5Bk2bVA8fl46PF5FLlFGhA1+imecb1s3ZcnVNxa9A75XxBke/3LiWEOqZ/+O1e3+gj0nzIZoGDiJZtYstJrcyD7qp8vFGIE+XGUj4Hzsrnw81glL42zgV7EkCaYcbCiP3jDuS9i1eqxIFg7Z9661zvL/w75SNeWBA313ij6i3/YtIP4lgvPNeLTRV43aXrD+omkl74mQCzU9EWGFZ8HiwmtpNmfdAKD28aYJ7aEz2iox96lGnyWYpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:14 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:14 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 1/8] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Thu,  4 Aug 2022 18:05:55 -0400
Message-Id: <20220804220602.477589-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5644edbb-7e7a-4f89-63da-08da76658c47
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3UanhBXE0/PIUvAjTJuYUddYwqf8IV+S17nxXA/6Jt//eygqhEveq362DFjpy5xurlZvCZ7Hcl739DGDZVhYWE7K1A3Z82DJ7nbasi09ymUIIG3W5klBF/GJ5p0NzRCMDpxDSIjEj9n4C1DcYDF70tFNqlGwigNVwxZtwn4wT2j/t/g6QHdg13BkUpsUINPVWvhv34jhfDZzZ8QWasnydOAy0AHPXJ5q/TceTeplqCSLtoCmf1yzwxgdH0LxKhZ1KMXFssuv2tXSb31JkHZgWdbQeau98d4FHO9TBWhmPK3x1KYwHnbwQ7xXB/MFIAPBO1GqnoEImxwerdxa8t8Jqlu3V/rA8OkPKCOO35XVasFYuR3jON2ha9HxPPCUnJ+61gQ1Fc8SFRpuU2TljaMNeJ6q9gKQKCjM/fa2Jh2xZR91NkxXff6wn4g45Pf3rirU0OfKw+/mIkNT8YjQoeVqOEAYPlQK/ezXWs9ael+3SNEBFolvzt9Shh93qgVUFqH+bS0PgEkP1mQZcQs7k3SoIBVBlyaGEbziw9QdBGWCn+NGs/RCJjnwzEd0XrwWDJ6opqHY0UuHyNlFw1xZZLAm4otgCXYK7xJQy+GegxjNu2rmCbxyaNRMvCMJqcFnMyVT3eF6K256lvSDmk4Bf85QRK90xy9DYzyAhIoqC17se4wjfu0zZwktf6UhjtplFw+uxNRnFBkE9yMwuYNp9D9P4omN/GqA/IAJEqmaKQDFMg6pI/F16z19euTvxfgoKoIJUCBeLEoT62IOQuj18K6jc+wazsm4WuBNiLMPs15msDPI0NSliqRb2U9E0qmnNbVy
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(4744005)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(107886003)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7+nICGXEV7USesrBq9v/L5kuJGZC6zN35ug4EM/+0yHhNHKCct8s0suTdNS5?=
 =?us-ascii?Q?IK7UgO4yXfV0vuavYSkdGMcJqjF6dD0p+0FV8es7Hsb+SQB87jTGRvUyE6yy?=
 =?us-ascii?Q?N9tHolbYvG5EnarkTsJUQAmJBKAcUKIKcOfasFvGQvb/tnDt+4F+D0/jqhS0?=
 =?us-ascii?Q?oSdwB1WF8Rna16vU/9bQnHUW9wWpK00Xna1AtejzJxYsNMXPA/QYW3eaTpd8?=
 =?us-ascii?Q?MW/2bw6M71fApsSWyv2o5bSk/XZaARqDfUPABN0qzla6LBfH7xQvb9RcTVDs?=
 =?us-ascii?Q?ywW++sujM0UifT+vx1fso272ileBOJLE1z7rn5PCpzKHDfaa7jGMkbKArMB4?=
 =?us-ascii?Q?7DcYTsNEncSa3zpIZMcRvSzhOH/d5RUODWDSr3QK8SuS4k2yg+UepkF5Eq5o?=
 =?us-ascii?Q?8NB9EVRxHuIk47HzUXoxX1DUHtSSSPFkY/aji2RPOQODMds6RnWVWCgdNYgJ?=
 =?us-ascii?Q?VrqxB8HqnyhPfUz4JmSEUzO/dzjrc/OcexvxqNEyUUhU6M3qAVCm1Jf9eKXm?=
 =?us-ascii?Q?Yth/QXu65iY0fntLKT1y+Xlpyx5p3aN43zDYumMRfQZ5NeTzt8i0ChFJ5ax+?=
 =?us-ascii?Q?RymfHuaHhhiMsyz/1anBMqdsfgfr4QqdOwD9Q0VfTejzPP2ma9AOinBSZeXY?=
 =?us-ascii?Q?zEuJFh4Kg0fAhzcLCUy8KlqocpcnlntqemQ9TUEt/UzGtP+CQB3/K+RqnjdN?=
 =?us-ascii?Q?qCetnEVVhHYZQ/oalBNFHiMQB4drkN7tsA0eyv4a1kUHAaeGQLk2DSL4eGmA?=
 =?us-ascii?Q?q/BPId+DK7T8rWNHXBEGktkoiuxyw8C7XroqMJPMOhGQFVBN4RExKCLRSn1V?=
 =?us-ascii?Q?hTTmjag24zjMfbD1ZMb7RNNKus+sqWKQHfSILWLe3DKYi6zE5foVrdAeePKB?=
 =?us-ascii?Q?nmm+95rKLjztc4BdXueahLvkIqUL2cUTdlP0lv2RgnwqLsFMV8PQyijkoLl0?=
 =?us-ascii?Q?RwHiBfSWjyBVSt54pYtU+ZwhT2lvVZDIuQZ8sc8ocriCyHOq/anMTE67taO/?=
 =?us-ascii?Q?OI29nesg88rG2I/o0eYheeJXGt84+NC1s3vmOGVAmr1izQ6NGzPdf5Pwvy4F?=
 =?us-ascii?Q?aM1tiUcdBpeWGSOQHL+xdZfgUUFCqLStSqO61Fz/b62waqzGwJ36HNKb7a2/?=
 =?us-ascii?Q?V2AtapvU9YZoCnsW/EIkxj+zWrYfoCeRjSxkb9EKcR4LM+vOg23VvhZnVyXb?=
 =?us-ascii?Q?h3CY2W6xf492xGVj+oBNv6t5u+FblRa56ES6xratYS881Xboc1GCIKNEt+67?=
 =?us-ascii?Q?7kQBBCXJLx7Wb53IRtQZyZHu9+GpjvRBKmADGLKWWKJ6EZu+iEVGxuVt3TEQ?=
 =?us-ascii?Q?LUNzObbL0LKRXPgyZU0FnoDTh0/Z7xlaUoOJuJiFG9MFXKeTBMA0Jo+XoZ3f?=
 =?us-ascii?Q?UdmOsgrzkjWUbyu6iHBLo3LIRJkIn0FCuYEYEbeDJO2mnbL1IlMu6RfBnW1V?=
 =?us-ascii?Q?PHAkXlQPfjiCsOYWsMelBypA+3xUOXQeejboLzlPiuyEVscsZy3ELQ1DWyjg?=
 =?us-ascii?Q?Y1E25PbUDmLG9sT+JL+wkdkW+6DLP1Vr1pPLWSPYUMUBjH/aKaRC1yWSyTqT?=
 =?us-ascii?Q?bAvrJB+ORthH4wBSLW+9nZ038h90Ga2NjiJ8LS/i0ubIJ9j2AzV21TQU+DNV?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5644edbb-7e7a-4f89-63da-08da76658c47
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:14.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ax3wz1DCEyuFaXsOdcx0m5xpia5OLq1fm3xrW0Ce92d0+xgK8gPK5SjyVSQOjeThvaC/vtRK3Ub6/QkzSvtcwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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

