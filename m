Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79805BEE8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCmp2tClz3f56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:28:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QW0Nkqd+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QW0Nkqd+;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXChB75bvz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StqcegoDZzu4jc9zc6yOWJd2n7bSrut3ZO4M36rEDlQHhrTsHFhn40G5PpZBfIPst4TfA2JxqMNvgaMl8NGJeHsjdDwX9SJUDIfvBxGOHUTUwUN4rRniVuaDJhWVJuF7N2pf9Y03tf0Utl1/U1mAUBPTsDUe5x5o9Ro7+pkSoO0SEUFSNex523v+a9fYAUIBYVrN+lK5UMnFF1x7a5/mE1Av5XHh3QqzXTydPQx0+xw5UTRrMJS90G/02oe69fASw7/RjKh2zePSapn9v2M66+ZimAdPxg07zOB11vCJNpMGU6vGwjyu+FdVMCSm9homLfQJUVqPzgMaGjM40Nn8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=k3lOUAcrrw6b98dHDVE8y3arGBcLWwQ08ChgKQNOdSFWa1+PBtESYTsWgGKxg0FpHJvh6namW/jQU+CicpvtpcfI+q1vmKY4/qWdMFf2GlwBt9NZnt2Zb4SYNDXVjKSRGz6US/0KPilz8cu2XD+516sJWVbazO4R4jB26j5elCk5wq7jv6PmwC48EY0f36xkuxMYNkJmvQsX4TUWHNObsul8EDZb+haJzIcYFNWigGDuCrbP9ciV6w62jR5jPdFEmFLQpD2Sa5OhgT+Am4KFgOENt/lVtrvSXBUHG3NLgC7TTIg8GMl6mkiQWh4Z9hsmWK8miIFQikklGvmWyUuV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=QW0Nkqd+pEUjtz7EBEIdqPj++s+dKQqUjpDks1knvo8LooNCiPZ7rGUee6P82Xsw10kz1GRpzIo0bS3+hwOINsFG5Xr7xNugS5oa/slRED+UFO6/7Gxm6XPMW+rWj/s+jrgQWYHM11U2rCbeVmuvl7ezcUq4enUcxH9+D5SzUmIHDXPcOtC5TJ6+t3Ax2+JGpaiGfBsRPwHHR27/gf5lcHsjtiHyuwBQJoPQ1z8w5rv3YYPEffHwMM76NMqKQl6pxyr0+5kPbKrcHVfZjEmIj7kr6p3HbXlU3AzJtsOw44PRDf400faeiU5POVTPIqFh7LbP5HVTaAvggE+PQ4tb7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:24 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:23 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 6/8] arm64: dts: ls1088a: Add serdes bindings
Date: Tue, 20 Sep 2022 16:23:54 -0400
Message-Id: <20220920202356.1451033-7-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: 62cd1419-1fa5-49e1-0758-08da9b461b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MAD0RohG3Xc3Q8ojEx2/s3N8fw2s6R0TGTuHnmM/N+9C0ZCAtvCN2YA1Kdur1ZdfJRBfAP4lllwiBP5KgqqBYEn5yi+azJowJW420Ekq00r1t0MqvKRvVY/NPotv2dh9O2C5zd88P3j5u3ljfZAV1o6duK5eZT4t7kYMXfoJBUWZaXzzFWLQsWXUT8vTSVt+/fjokMSJ5FI7okyt8b+qxERBNNK2yHT7YexnmiEX+j9TAl/lcjNImhz4ydLZa6Wj/zNkpbDX+oVA1j8Svw5ac6kZJhN4MsUU6/pcPHkCgGBComeGOpCsJvtUYtKcGkTBsM5NlL7QxUBtg5dqBcVj0Madv14nlH7f//9XVmn8bASxs0AchNEKMdcbES0iu0Eou0AWnXyXIlIV+FdXVOxYW346jvRwV+BxwzsYWRvgKpjHBjWa94qGSuZd+amO648xtsSnD2ODQPgItIwZa/Ie+KP7BxeXdxNbM3Zo1xEpZXBFqZ4sP5AzKv1t14VO+zTK8xk3kq+GZXaJjQEWqmge0p1Fy7PXgOFCASB+JYJgp0MeMUXO2+VKriqVnmqSbiRsQzYd5rmQ1jqUh102iJD1o/MSD8fxMuOuMfMkjGg1O9bZax8xpIKD4w5wpBFFMZMdAqthVwoeo4Xdb0WJ2BSWLQ//O/syW6KQo2bVAzlluhc3NDyksAD7j0JdLWNTz87mfLZHAtnd7QpcG+DsgVyoOFYeQeqnUYm0Mojn7auJ6S86+FbVhHqhCsOHvRKULoUw
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qEO+pcQ8OTK7ps7/YQtngBM+MB2PeZsUfW3rLlFN28vpXYNQ17ClFtJcfC4Z?=
 =?us-ascii?Q?3RI0MnTfktfo8Ja8honVQJmT/1Zl+p6qnf1WP49J5Qgh7HVCTDpQK3Su2pZi?=
 =?us-ascii?Q?zf4jT/fNAi9tyYFmxemCn2oqHfCsucbwCXTC8/ZF0JyyWDPqii8Oo9/PSvJq?=
 =?us-ascii?Q?X6u11C5gzRIEb4ZDhQ40aSvynmi+PtAbRTbqYi2r9t12kpxCC39w+7iWuIjX?=
 =?us-ascii?Q?HRJrkv0rOsclJKr3qC1aP9sEEkPWgIB/9e9j+Ej+5IugGpKsHVEufMR5Ksru?=
 =?us-ascii?Q?oEZhu09SfwfYEi48nF48XBwg9PB3kyhRTzMyQZkf+LV94zRmRoEOkTIq3ef8?=
 =?us-ascii?Q?3g6kP5FIWQ3J7H8hcCZ2tlJf7MWsZ7TVAeq9iN7my61vyJdpgCsFic6D7pq/?=
 =?us-ascii?Q?9PzO7jYcO3pUlKh+/nUpRZ0VElJmUzr17Vyujt9rzsrhkdoHkIWE6B7m/h1J?=
 =?us-ascii?Q?WzHL7QqERgmZQTNij3mXF156kMrhaI78vnP6TRxBMgMYlcWOvFTjIBmezwMc?=
 =?us-ascii?Q?jZxq9g4K1Czrv1l3AJ3qWrOKpeTxMPXbiq4QWCHlp8NEY6RTmBU2OP5RmQMN?=
 =?us-ascii?Q?97S7uGhnuBxp2CUIsEpTFnR/+C48i1jJN7Z2dNRFhan3QwRg31aIYisdIOQl?=
 =?us-ascii?Q?YTV2NKB5K4Htp9H2iqmF6rIif9X0Bbss15kmv/tmH4InNl8g8zds23kwjGnU?=
 =?us-ascii?Q?Z619uslcMEsgR1y+ebdyJtQlkyI2RL5LsLk6JtxQPRiKvrO1OC4UBjS7g1sA?=
 =?us-ascii?Q?YKVXZtG80UX7nCTdmueaEcp9ydUTjh0MKDiYHz1xjeM6e+cxjL14LTer3AM9?=
 =?us-ascii?Q?UMi8HCWQoBRh4fswlJSeaPGdNDNu6QeDjojp0XzZT/n462BSsARTRQUJyMnP?=
 =?us-ascii?Q?DNBTD6Qit8Pecy8b1GD/WNm8sqwxnWkqsfs0y1zE64cWD9zQYyITe0B7ZjwC?=
 =?us-ascii?Q?sG6hSV+TOZp0rcIrLQHAfGne0k1u8VlbtYsBIwcjmM2z1wkNYvTEgGFoLJXG?=
 =?us-ascii?Q?jCrHgMJTw8l7e1wbkDbR4zziDM0p2EUvuxDlMS0dR+qbCDOvqmGjugxPBj4V?=
 =?us-ascii?Q?EbY8zyPynjW83QAoi0iPXeFzaY0Hlsi5MU6XusSU7KkAS9hOffpE1vA0lLaL?=
 =?us-ascii?Q?OEri7kaULsQuAfrxx8ISipR8XaMahlD/Opbtyft9kJeMk7Zhd1ZzoeZ7Ptyh?=
 =?us-ascii?Q?GfauTQ4OqLogPIrk8ez5czrzjUmC7C4p7KBNznoSe1vEACCfg3LfjV+6YZsm?=
 =?us-ascii?Q?anniJh5DMBBC9G4V3GNZBURmSHFDK8EaRmp0wl1rIATRAvTOlYnNFePHlErV?=
 =?us-ascii?Q?+FZ1By4HmrpWTGME27UAIGBrd6ee/iO1LVt6djQv0VHT9EKIJWLYArorTleX?=
 =?us-ascii?Q?RzIRqHzhMLGmQDTIfelGSwBtDHv+VSGGTe0NEGSRbwLf3ORFy9BBLFEntQwe?=
 =?us-ascii?Q?4qIqsjN2j/hepe9LbTX22vUFkt6UDgAP3WB+0gVB/x3ReJHIxXKE/W1YXqdP?=
 =?us-ascii?Q?H+zeBB4eK72qupB6u8UmCKAtTrgUltMSfJnTBdtiVTfiehMbFOmrWc0zUHsk?=
 =?us-ascii?Q?VhhwAl+O+dvzMK4H4WKQm4QmM2/EeUcSdM1AGnb4/Kw9h8LfVwDew4bbZE/n?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cd1419-1fa5-49e1-0758-08da9b461b6c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:23.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqEdPAq7bmyqv/AvS42bD/pgGPEzzrnZqPMDZHcg/pFHaT4Gznjp+n//lekVSmiPJ/KNsyNknsOGOk4Tkqr1xQ==
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

Changes in v4:
- Convert to new bindings

Changes in v3:
- New

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 421d879013d7..3810d66f8725 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -238,6 +238,24 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.35.1.1320.gc452695387.dirty

