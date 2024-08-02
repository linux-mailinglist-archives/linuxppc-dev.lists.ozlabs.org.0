Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D2594624D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 19:12:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GXBWB3Tc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbC7W4QwGz3dWl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 03:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GXBWB3Tc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::61a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbC6n2ggnz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 03:11:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJbb/apeqA6CqqidqSvXdN66aRk3ARWwk54Rq+VLeoAJQMBzDMXrN1jFAT+3uniuQajh2p/aW5qZXOFRPOswqUvIsuLhrFWwmg+fRCmNKTkEZX8NOvDQ08pCe94leXUXrFWPn5vgkJXqIlyI/q2kzXies9lsnYqsOM3Yos8zUB+pDJxG6DAwHXd/sktcVkGgpbjDv0QkEn+z7frwpocMKFtZnQDujMqtYPaqP5XD/+tzIvvsq7EtklbjIxM6TXWnwbjzr5nPyaEwfHqrqY1GCf4xl7cMi8QIEFBqP1cRfPtrh75ovfRWV/hHhGuyzFNbtKXFKAoMlMy3G9+DMJFo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ7E2NYVhMhWMr28cvw4010zJ5+HKIs6GHz7SNTP3NI=;
 b=u7OE2U9Mff3JDkeoZTdxQbBF+ai6iv5AE8cmqr94J/tWgLV9KKIty3nm+zIcpqBXPsB7g4IQcPrV1GLK1fK/YIaA58h3PP6iaucJBD8p1Oi7D/EJz26MjZ82lhlHhGsQer6N16tpUZzaKIIeSLnk/e4y3FH0UV5/gL+nSUysITkPOaWUGOdlW1dApXH0d888qplHkcJ+WfYapAbwuJ+A/UVV29PY6AsSEunR2djZjE2MkeOoiTxhHB0GuhubGPTp3D/Ilix2jm4oQFQ+yv5mCld9QJrNxZGgXkvOY+EP5vOwv3xOrqRyl6J3UNYpTtTouqSJ9rUNXTVQwr2p5K5RFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ7E2NYVhMhWMr28cvw4010zJ5+HKIs6GHz7SNTP3NI=;
 b=GXBWB3Tc6lDt9Ct3rUmqi2+v6lp/aDIFirP97TKZeQDTZVBT6ZbDiUqazlKG53vzvWgJXng17zrSY2XUpdT6jT6F6r6O8jE2K81d/sIZp7yn/ytMmkH3WJZnroVq137oijRxQ7E1zMUuaH1vuAdSCxRgth+cHjc/skE+WpXUy1jpM+N310mKXy03Tsqko5oyhHFONOUrTN+ptPAiU9LCp2pHmHDV3yTSUOTfUSYaiwdtmdk29utk9y4yENGoe5Vayuq3Oz1BS5UPtyZZHvk1m6osOKEUDaVckCv8yPUdNBfvP9WjXRKT3IiHGI8zwDsB7dzcG8D439kr9abZLU27Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 17:11:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 17:11:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] dt-bindings: soc: fsl: add missed compatible string fsl,ls*-isc
Date: Fri,  2 Aug 2024 13:11:02 -0400
Message-Id: <20240802171102.2812687-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0083.namprd11.prod.outlook.com
 (2603:10b6:806:d2::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e9132e-fedd-486f-44c0-08dcb3161f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?hQNKAM3Dfqa9DzQRha6CdxGZpP8tRRFpfyV9Io4jN5tvs//wQn9M3fBg1WQj?=
 =?us-ascii?Q?niINe8CMPPvGmWtcHg5vs9rZpDRJMNTNyarRUPAsO9yaBYMmeEyFoU4WEuUg?=
 =?us-ascii?Q?HDXyOlN4rRR3jLO2nNDYfYBumDh7GfEtvJruBUy3Sf39PCy3s6fay6TH6HWr?=
 =?us-ascii?Q?8ivVKEyWK2YDDKDOFTPYSb4zWd7H9h7BSkkfipnsvXz4HBpsjyGC63aOJbPX?=
 =?us-ascii?Q?DD7n9vkvFdLBOiTskr99Go64gS/tnWg8/6E3lYToPrdFT9vsHimusvY3C1in?=
 =?us-ascii?Q?ntdjBq3VQSFThydjvG6TAPWBy2HXEL/bRufUuQaGcRfboM5pou6I67aIg6Zs?=
 =?us-ascii?Q?IjhsI37EsVT93R7QAiBANHXykwRjk8jkkWIOCEDfnAEoYoAzR/1uKj0zu6h6?=
 =?us-ascii?Q?duZO9scS+Zjtbd5arfstdLhovLyJG6ih9cSaWGolYPFuECjIj6egq9xk4H0v?=
 =?us-ascii?Q?COq1BG+E3rwPQusVIMbdvrUCH5zauoG+6KTRRpV0/des5te6YGaMw3bcXHKU?=
 =?us-ascii?Q?HMCkKPF/TV8rBcQxaYMxyzXnkie4+nKJ20KZDpxK7diGuTU+TjtS3V3ZQyfZ?=
 =?us-ascii?Q?EzF28rw2kBPr9FFr9RtTNheb/3FdMdIYNN3xDYmuDB3cC6+WhvMfqNsfGk2g?=
 =?us-ascii?Q?FudejBo5jHrVUI1k3to/mRAQLRn0AlMhSp7L0xmWWgsUOlRQBv6c3wRln4y0?=
 =?us-ascii?Q?B8i5eUfZqMILvzfQVucx+XwPwfR2T1CxWs8uhrl5i2PujbOab5ZKquTBDa5y?=
 =?us-ascii?Q?ANCXRsngUF+Hbf6H/DShJRIsmnMWwQzLzFg60nL2qcknRqz7OqepXU7hvBFr?=
 =?us-ascii?Q?oLKCivz1vjr/Zi7ejN/40kJyr/Uu+m4tgUg3iM6SsxpdaIR9BTOeueIQS87G?=
 =?us-ascii?Q?GTz7kMT+ah4syqFskA8zZwGOiFrmcewSPLXNWk4zf2Q5LHrBjQBlXZTlKTEN?=
 =?us-ascii?Q?hV42zDDlZaqjx78mvoJPvjv5dmdL/WKe0vmu4rA1w0Ym0DFGhZUM2Fo32+Dk?=
 =?us-ascii?Q?s1uWLO/Lfs8Iyv4S6ET6leBs1mh3ypR4vW+dljN/4rEP2btj1CxtjjBxPF7f?=
 =?us-ascii?Q?z9E3GdAvWXuu3vVGKVyrLinh7wfuCKHMg3rNNniELt5FxZIghPm0tqiKCnTU?=
 =?us-ascii?Q?wru3fI67jIrr283wM1sv/T5Kp0b6FaKVGifbsLRMsRng7qC8AaXK0PGhcdul?=
 =?us-ascii?Q?pBn1+IXbEzDej9pBPJufKqdiRANFmuV21BEsvB6lBQGQOz/Ri6+GTazH7d2q?=
 =?us-ascii?Q?2Dua7smJk4iIC25+zJc63pv7So8/2AOuET9X6xWyeQYc5oAFxvIL84B+8/ij?=
 =?us-ascii?Q?zNpIVND/Z762XsUMBivla7zoQENgkiiV/68yeQ72NjR0tQ2nQLATAIywwg/5?=
 =?us-ascii?Q?GWwM6/rWUvkv19/HOT9BNe5MP848NToQ9S5qnpyIQ/p+tWt5CA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/oUwBYeuA0r3kKMAW/DSlGbJTzRzC+gZgqXYLy/7U4ntZriJm5ms0VpOiyTG?=
 =?us-ascii?Q?TobJiPqPpo7EuCBd3NrWETYBgXJdoceXZStXUT2QW4wxd7iqOaQHvNBcQvvR?=
 =?us-ascii?Q?2vskY9iEFB5uJjY1S0GgkaHFceFfwqha0g2Sx+FrfZ9GmEqjifJb0Z4Vvb11?=
 =?us-ascii?Q?Q5JQ6izsBg8jA0mfzs6O34ykQioIn+Bz6SUXN9ov7u66Btt6IB8Ola1QRCkM?=
 =?us-ascii?Q?IBTUkLFC9uxrloLc2jsqNltNjR2nXse+1i0Hm7SNs0VyabWt1zSFXACG2v85?=
 =?us-ascii?Q?CXXWDIXa0HBG3VjyKvMuEG0yltNcjjtqJzRHONswzzniUPYkaKSucKwgXUBa?=
 =?us-ascii?Q?sy4ZiHNNDrzfIbFmQayJWjtdGA7Hjafh2O1Vi/a31cSWDnaSpNlQwQVN+9XN?=
 =?us-ascii?Q?UrI2+WoYAZ7arfnIFRGhqwZQjM3QZqHdQc98uzGyM+YyUCPxktHCNcdTXWar?=
 =?us-ascii?Q?4o0tEgqarUEwwpdKnnf2JeQjtPqledAR9lmCGlCrNyyrRWZr0aArFyvjo1VW?=
 =?us-ascii?Q?Lu3gXXlUpnyAOQEOLc8QEQlZcQ42dWHRHIuKqjjoTfM/o2zetKhLa2CgK6e5?=
 =?us-ascii?Q?dsgCmjZlPBTN09MJaQzM1B4VHn3tOpasMLWxtlSRz03LtQH66QPfZPln+wCr?=
 =?us-ascii?Q?eqjLfCvV6zWzqc6Ux5GWLtTFAE2FaTmE0xq2ptohiPcXgQ1+buhioF+3lD2Z?=
 =?us-ascii?Q?T+YNy6byFWs8LI5Dhg8Y0nMQjpxJzq+GMoF5giIt+BpLLneoQzeEhKx+Oku8?=
 =?us-ascii?Q?d6Rsqwatm9Qpqzi1xOP84b8UC8NMc081eW2ik2EVcfTR20dpJOCFa7B6y6tQ?=
 =?us-ascii?Q?pjwooug/WCmb5pwg10qXQhAoC+fzo9nUKZGtZY2d456Q+0Em60UJzi0dmc9X?=
 =?us-ascii?Q?AdgiLJ2uY60T944FsAvyvlNtmr7LOxPp6U8krnFU6u/Wyoh8P8sQgt9GoQoP?=
 =?us-ascii?Q?aoV19iL2r92jjIUTf54ysKlyRG3w8om3xDm/R7sR0Qwj9LdHNGWrDFHjWN4n?=
 =?us-ascii?Q?zVrXixcsYHyI4SCL5xEFPECAA8zt3/tO4N1MgFyK4DVmxKu0wfiTIlb4LO6x?=
 =?us-ascii?Q?FxQ9BMpS7eaBZ7Gnp+9p7v4SCLAMsli9jfabC5DLD5PhhhLBq4r9L+FEB4yZ?=
 =?us-ascii?Q?6KgWYjzK0wHP9I07rI5fehmBVgrXcK8NTMUkC9jLnb1oT6EmM9E91nc/2n4q?=
 =?us-ascii?Q?tOkItZibKwdP9EsreMakLQ/D1zFTBk+4eoV7PVxJqV88FPTnqRlyS3a/vxkS?=
 =?us-ascii?Q?TYfe8af2MLWHnO1IP1yV2CwUSiTbspvcqDpMdeOUR1bHuj8sZ9dKoMLgmcLy?=
 =?us-ascii?Q?3b15Yk+XWrhc0bh525tZYfJjsUqQWHIjEFOebO8kdEXFjLyCr6sicAx4yPJN?=
 =?us-ascii?Q?oVDCGnqZX2/ur/YuBAw+DQ4jX815ahlID617H8WlYa98+/IT5GZeWCSDn5Id?=
 =?us-ascii?Q?lllFwxBXux6C/awgiaycu8eRNKWpPcvkA0oAMFKy7lRFoNuiuvWVUgCfdwcn?=
 =?us-ascii?Q?vbi8IpPIIq4ZxDoqz53nVMNP2dgHiQCzbSanpd7fYq72GRb3RkOZkZG39KPI?=
 =?us-ascii?Q?kB9Q21Ct9LbJDgP3unTGhB810Tr/GAopypL5T0Ne?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e9132e-fedd-486f-44c0-08dcb3161f1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 17:11:17.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkwY0H+LEVXtaql+Ow3k53nrG5knk9RAXCStsgs/bQtzC+YlPbi4OEZj3Xl5E1GdsqztVU9Pgpi0S4f+lNJbOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add compatible string, fsl,ls1088a-isc, fsl,ls2080a-isc, fsl,lx2160a-isc.
Fix the below warning:
arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
index 2a456c8af992e..cff59d6453cec 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
@@ -23,6 +23,9 @@ properties:
           - fsl,ls1028a-scfg
           - fsl,ls1043a-scfg
           - fsl,ls1046a-scfg
+          - fsl,ls1088a-isc
+          - fsl,ls2080a-isc
+          - fsl,lx2046a-isc
       - const: syscon
 
   reg:
-- 
2.34.1

