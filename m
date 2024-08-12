Return-Path: <linuxppc-dev+bounces-25-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54D94F965
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:11:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iBfHpl+i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTJ86fnSz2xTj;
	Tue, 13 Aug 2024 08:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iBfHpl+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjLBp2JxCz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 02:51:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYvuqW0hqLga4FjtzPm7M/etdxhnFNntV2CdEmnyyno/eEHv9O5/fWYz+pYPtj/MDud8C0Ft3IFxetvpKXVcGMKqF9Voynty/2WBSn0hocP2F5EKDEr9UApsdaBnlviJV2Mta9lqNokWim6Ba1lAHk18m+27CQsmauUTPHsqYkKvMtZj+EUVCsd6nc2717NCo6D7G8RRYwJNl1EXII4JceWVSMQoXx10xAu1nx1TmN7Ps/HR90K94HaSxMSHFKarAm3nGuj88B5/Ecb6G/AWj9WyKTkk6+gVqhLlw2xHsmczTVWAJQJk2aqCX6FgvY8MV2kFrEECugnRIqwKZxqaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CTVRmxbByW2YRbrohBxDwhpt7SeRR15knglV8wjIpc=;
 b=Mm34YfkgQdwIg5P+PxENrvYyG34iR7b1Q4senruNnqlgrTNJnAQqlX4yGX8ZA96kyz9Fwfy3oTcJR2ra8urpxFyww8DIO5tABgU555BFmfr7JSpJBx5k9sEvup9vPzJAeWjOTP5/d4jYutEX22A9WWmJBc0uppqSU6rbbzhS26WP0ARsmckPg4atNyZK4ROOB/InOxXk08FuFulcLOjke4sp9XIZDtIj2TmkW5L2QuMGeTGcmYG82WAcXSiCFBGoV3e9UJz7eXP3xdFJTdGvcZKYbqvpWkXNqPAO7WC7B2qql1J6VAbTPDC/cCKaq5F/zaquRdukcJNgwsBHu3ehZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CTVRmxbByW2YRbrohBxDwhpt7SeRR15knglV8wjIpc=;
 b=iBfHpl+izZOKXLw87J+2k6n++I5wqD5BsCmjmCiVl8TS9tl2qzkSkKan/NxSSryd1F3JgOtsXMORZwhD2MemnJ1ESL9UTmmyl8tDgnsCdF6ln+qpv9fMpDbRWsNiC7cp9LprVyhIJb14mI8JeswEqd15slIwBPaTLffQRs9qneUQ1ZkwHXRvGJx2CPjcGw0RhXVRIZjmtrfCS2YNYmuAurcKBYblyVSIqQoK/tg72CvA8osVdF8VWPthtK5FDTuEhUdMxpZkc1vayIE3D1JmPAXO5P9PDgoyLm/oerLg1sh9ydw9SdFfAoqygfu1yLOP0iIr0wfgVa6Lz19Wrf5lKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9825.eurprd04.prod.outlook.com (2603:10a6:20b:672::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 16:51:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 16:51:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: soc: fsl: cpm_qe: convert network.txt to yaml
Date: Mon, 12 Aug 2024 12:50:35 -0400
Message-Id: <20240812165041.3815525-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 6247cb31-8d62-4005-5bad-08dcbaeef1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hdt1DKQhqAOZDiwLyORJ+HygN4eNslI8hYVNk2U6IpkXuwPqus78OiF0EJiS?=
 =?us-ascii?Q?qUEhlt9MiZk12HxZ7A5wRoA4McqrP2iw6+RrCy9WjMe+KBW/wdxHy04z+KHI?=
 =?us-ascii?Q?qKH0MTDxpblRMClFrAU9+HtcuUsYap09s2peRl7YLhsdFRLMBsAse7A/mrsl?=
 =?us-ascii?Q?BeG/FrRrAP/iO3pm6/Qes0JDv9roKuT5xtJGyDGkTc/n76gYgIXAGVtlEhmp?=
 =?us-ascii?Q?98t2FWcIILnbV7FafucUTFRT0PYCMQbPHofLuLaY57wfMfUbcmBLLDqhdu3H?=
 =?us-ascii?Q?m8lPvUmOHQH1bq99/T9dKhR8q36uCYxMZYFOvzDMYOwwHdo8GZCWIW5LSIHF?=
 =?us-ascii?Q?FUNtMvRhTQnraNxHv3LeXhMeduVkhA6hfUXMSf8YvEErc8f3Ups0P8k6TnQ9?=
 =?us-ascii?Q?mCcFOfDA5Rw0l+GFTxMbJp9tE1Lc2XtSowhdvyhGsY3ThD5BlMnU7ECC8Hyw?=
 =?us-ascii?Q?C1sv0wu//Os0UfZUeg0wAvzRSz0DHbo6uWq150gkQqjZyzd4vNqy3ggkuy8W?=
 =?us-ascii?Q?hkvVtTvZrQgq3jcouUEctQjciXiNvQ94zRN+1QagpKqLGbDrM64pspUUdSir?=
 =?us-ascii?Q?PUxicI2Z5vu2NlOiQ72BqOz+rgJfH5PX3/ebHBXMPYuAVF1eBVaefpJTmvSP?=
 =?us-ascii?Q?jZEgXcJZUEeVdSIXpxy62UJZtA8XbgriB2T1hLSQV/yo9T/2tsFQWaYR2iDs?=
 =?us-ascii?Q?SCT3IasnyEqeYbd2zVycLgiieIkkDKRq07S0t8Y8ab211DYbFlVdHwTKdS0V?=
 =?us-ascii?Q?kCBy6zcAAodbB5JP+Z3rLBDgKgKjOLUbW6HjBYYZOZZSNPtP7ratigW7EXIG?=
 =?us-ascii?Q?LP/ZJxQK6imS3mRvoGRzkMSjYLBsVWfcm9QMAlQHoeTioQddznI6zEoyMg7R?=
 =?us-ascii?Q?tpGwlxYvjn0AqOYWyqbu6hVM8kO8lRPOhhI1zKRN6rVWhQ8tGqhPfz9ygLc+?=
 =?us-ascii?Q?fcT4tWszbWGYCddd8V2g/Mfrw+5zKR0vi6E7zrGS9sg5BVL35WKBRuig6MF4?=
 =?us-ascii?Q?gYO2lvEM8mpnVRS1kl799+hSpwcC0328t8yjx5KnN7VAALFJnflkldaaFL82?=
 =?us-ascii?Q?iDQNgxgU/2iMCrNn3xuIbrbI/zQr1eu2hiuhPXID53V4Z0PyJGAfKKDDB7FN?=
 =?us-ascii?Q?QyPHptBmgJW/3ZIey1fkAelEeWhsyDVi+nyvWSg+/I6lMO8htkiujKV+HE4s?=
 =?us-ascii?Q?GBMiWCCr7rz+uduiQrJWizgrbrAr6cst1B9vetM+BEv41Ma7+NTBu6k+1vJD?=
 =?us-ascii?Q?0ALZ7EH0eFEQXuLaPxhDv3rrN3PHqxXzkMVDzDeEtzvhwXiYtRXCiARL7zlC?=
 =?us-ascii?Q?cg3HgfAyvq4tTWDA2KRPXfF4x47jmFAp9MO5ZQHMFWNBYhOpMrzsaA6qRt8x?=
 =?us-ascii?Q?hYO3cGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dFmEXmg7lKfSU8keG4zTcTkL1gvZzz7R26sgfUT4vmStGCm0M2griaqOs1iq?=
 =?us-ascii?Q?gvygMqFh28i8CvF8IDH5Guhw8zty/LCkhs/LVrPf4qO7B0mUOVS8bS29XO8v?=
 =?us-ascii?Q?W7xRNz/PrpnBewHIJO4dh2JFfscZ/YHq5BgxdU2jQwmIzWZXWgvGJd5AfRrw?=
 =?us-ascii?Q?7KP1yYHYvJk4cvHHr4mfrfjplm+WGQYrtKMQ3dVVUuzvIJ3ceXzeZOHRD7qI?=
 =?us-ascii?Q?o4WIghtXKJCp1JCtJdo/8VASp+p6TRK7k8f0ORTa4gRRA82KycaURjtaV26L?=
 =?us-ascii?Q?gGvz1GU9jURlsZBTSADoQIXatPG56hGYuv60ozqJB+gC0wooVwUB78+xijAF?=
 =?us-ascii?Q?DETUjfPOOdf54osvsCZAbrxT7h+9dRQokIAGU1He0c5oiNy1X2qFFlibwyMp?=
 =?us-ascii?Q?aXTWcwlMdmfye5mKOodixUpKAM+lepdfdD4e0c4VECGQG76NbmvsR+Ddf335?=
 =?us-ascii?Q?hgODLj7x/SOKw5FqdpW4mVqL7w8/ccjikn4UnBb7Ku7mN24iX4TAhJlo0mPq?=
 =?us-ascii?Q?6FUF71hiGTM17E7uGSuo2K5VeYwUg/LijRxpo8emXmzIKwWVU7Ys3DHPjttn?=
 =?us-ascii?Q?qV/XYuhX+HhTghCl5DpbXawqtjfK+I5yepE467Xlj9FcrmCyKh+c62MoKpHc?=
 =?us-ascii?Q?m3HrK1t8Kndnk1cMdcqEeJyC8RCvhK1mgHjIf1I3Pl3rbGPeATcENQJLYOI0?=
 =?us-ascii?Q?+V6R7Xm2A8wctLprc+5YivCU4pf+9uLcOBBQ/eLAygyL8Igzb3IWRnFalTC/?=
 =?us-ascii?Q?NzCQ77TVCsK4C85rm19RkSuoBLythKA6zpan/BpZpmsbmVRJlFPMUTZGF7ec?=
 =?us-ascii?Q?c78SKAv+KxQwaqAXAEFnnaqcU7AiRyxiLynhyU2ORIWr2pXZumRkPnI8uerq?=
 =?us-ascii?Q?lP7Eb6ANPRJ7KWeWVR6S4ZCYfGc1fmt1DNFCnKp39YBHRyGjHrOtQrRUrLii?=
 =?us-ascii?Q?QCmjgI7khz4qREYyw1naxWwoMqknVDKSJStbrqobWTGtUQyq78dsliFelr9d?=
 =?us-ascii?Q?8UlZt3TAkriSZV79Ek7xhePeGZlSCB4j/SBRn91FdwFuX4mLp7reIFUK1MfM?=
 =?us-ascii?Q?+nfQ1amSt2affMyDFN9arulG3jnxjR2sPhtpNlZvhESuXTE+k5MB+t398zjM?=
 =?us-ascii?Q?BNKthyZ3Qkb5EuEWN7VjDaZUcTxJJgibJT/gqXusClY/ymTPAgQ8d9vIusmI?=
 =?us-ascii?Q?hecNvWQM8gbHf3BsfT7gIH6wX6Ky5EmeHCIP5ffAtXSN4u0TUq0Q1DLyGy4q?=
 =?us-ascii?Q?eoIwFIf/6Y1VKvtA0CoyknxFdnKAqNV1dJ5NK8bPE4H10OQOta/kmd83LKV+?=
 =?us-ascii?Q?l/wATZXGX7ejGFBM3VrDYTx3dPzyBe4POM3H6tKMqb+V/i20k4/KFTuhx+vf?=
 =?us-ascii?Q?v7DpCEn/YvNZqnBHoaQUPKsstxxOsOgJHI4AYffq1dcGQaXn7yua7cFeZs8k?=
 =?us-ascii?Q?6DBGhjKUQYYw/SoV2fTnd10zrjM0dcBVLl1PSbbXip6yhOJLpHtRpezS/iBb?=
 =?us-ascii?Q?M8xJrhy9amS/0G0MMn9Otv4K4BbPCIS035uCBtnzQGc0MF7MEUqD/l7Cp2ky?=
 =?us-ascii?Q?gBNMk47zSTB6dETSne8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6247cb31-8d62-4005-5bad-08dcbaeef1b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 16:51:00.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqnrg0CEvHO6CEnMFi0bvFOcQNsdHfATaaaReA+LiJ7j1o6ZbYVu7rqExOfLYgYg6F7DO0cnmMfoyIKSXh7M2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9825

Convert binding doc newwork.txt to yaml format.

HDLC part:
- Convert to "fsl,ucc-hdlc.yaml".
- Add missed reg and interrupt property.
- Update example to pass build.

ethernet part:
- Convert to net/fsl,cpm-enet.yaml
- Add 0x in example, which should be hex value
- Add ref to ethernet-controller.yaml

mdio part:
- Convert to net/fsl,cpm-mdio.yaml
- Add 0x in example, which should be hex value
- Add ref to mdio.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
This one is quite old. The detail informaiton is limited.
---
 .../devicetree/bindings/net/fsl,cpm-enet.yaml |  59 ++++++++
 .../devicetree/bindings/net/fsl,cpm-mdio.yaml |  55 +++++++
 .../bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml | 140 ++++++++++++++++++
 .../bindings/soc/fsl/cpm_qe/network.txt       | 130 ----------------
 4 files changed, 254 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml
 create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt

diff --git a/Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml b/Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml
new file mode 100644
index 0000000000000..da836477e8bad
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Network for cpm enet
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,cpm1-scc-enet
+          - fsl,cpm2-scc-enet
+          - fsl,cpm1-fec-enet
+          - fsl,cpm2-fcc-enet
+          - fsl,qe-enet
+      - items:
+          - enum:
+              - fsl,mpc8272-fcc-enet
+          - const: fsl,cpm2-fcc-enet
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  fsl,cpm-command:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: cpm command
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: ethernet-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@11300 {
+        compatible = "fsl,mpc8272-fcc-enet",
+                     "fsl,cpm2-fcc-enet";
+        reg = <0x11300 0x20 0x8400 0x100 0x11390 1>;
+        local-mac-address = [ 00 00 00 00 00 00 ];
+        interrupts = <20 8>;
+        interrupt-parent = <&pic>;
+        phy-handle = <&phy0>;
+        fsl,cpm-command = <0x12000300>;
+    };
+
diff --git a/Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml b/Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml
new file mode 100644
index 0000000000000..b1791a3c490e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale CPM MDIO Device
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,pq1-fec-mdio
+          - fsl,cpm2-mdio-bitbang
+      - items:
+          - const: fsl,mpc8272ads-mdio-bitbang
+          - const: fsl,mpc8272-mdio-bitbang
+          - const: fsl,cpm2-mdio-bitbang
+
+  reg:
+    maxItems: 1
+
+  fsl,mdio-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: pin of port C controlling mdio data
+
+  fsl,mdc-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: pin of port C controlling mdio clock
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: mdio.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@10d40 {
+        compatible = "fsl,mpc8272ads-mdio-bitbang",
+                     "fsl,mpc8272-mdio-bitbang",
+                     "fsl,cpm2-mdio-bitbang";
+        reg = <0x10d40 0x14>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        fsl,mdio-pin = <12>;
+        fsl,mdc-pin = <13>;
+    };
+
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml
new file mode 100644
index 0000000000000..64ffbf75dd9d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: High-Level Data Link Control(HDLC)
+
+description: HDLC part in Universal communication controllers (UCCs)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,ucc-hdlc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  rx-clock-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    oneOf:
+      - pattern: "^brg([0-9]|1[0-6])$"
+      - pattern: "^clk([0-9]|1[0-9]|2[0-4])$"
+
+  tx-clock-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    oneOf:
+      - pattern: "^brg([0-9]|1[0-6])$"
+      - pattern: "^clk([0-9]|1[0-9]|2[0-4])$"
+
+  fsl,tdm-interface:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Specify that hdlc is based on tdm-interface
+
+  fsl,rx-sync-clock:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: rx-sync
+    enum:
+      - none
+      - rsync_pin
+      - brg9
+      - brg10
+      - brg11
+      - brg13
+      - brg14
+      - brg15
+
+  fsl,tx-sync-clock:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: tx-sync
+    enum:
+      - none
+      - tsync_pin
+      - brg9
+      - brg10
+      - brg11
+      - brg13
+      - brg14
+      - brg15
+
+  fsl,tdm-framer-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: required for tdm interface
+    enum: [e1, t1]
+
+  fsl,tdm-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: number of TDM ID
+
+  fsl,tx-timeslot-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      required for tdm interface.
+      time slot mask for TDM operation. Indicates which time
+      slots used for transmitting and receiving.
+
+  fsl,rx-timeslot-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      required for tdm interface.
+      time slot mask for TDM operation. Indicates which time
+      slots used for transmitting and receiving.
+
+  fsl,siram-entry-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      required for tdm interface
+      Must be 0,2,4...64. the number of TDM entry.
+
+  fsl,tdm-internal-loopback:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      optional for tdm interface
+      Internal loopback connecting on TDM layer.
+
+  fsl,hmask:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: |
+      HDLC address recognition. Set to zero to disable
+      address filtering of packets:
+      fsl,hmask = /bits/ 16 <0x0000>;
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    communication@2000 {
+        compatible = "fsl,ucc-hdlc";
+        reg = <0x2000 0x200>;
+        rx-clock-name = "clk8";
+        tx-clock-name = "clk9";
+        fsl,rx-sync-clock = "rsync_pin";
+        fsl,tx-sync-clock = "tsync_pin";
+        fsl,tx-timeslot-mask = <0xfffffffe>;
+        fsl,rx-timeslot-mask = <0xfffffffe>;
+        fsl,tdm-framer-type = "e1";
+        fsl,tdm-id = <0>;
+        fsl,siram-entry-id = <0>;
+        fsl,tdm-interface;
+    };
+
+  - |
+    communication@2000 {
+        compatible = "fsl,ucc-hdlc";
+        reg = <0x2000 0x200>;
+        rx-clock-name = "brg1";
+        tx-clock-name = "brg1";
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
deleted file mode 100644
index 6d2dd8a31482a..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-* Network
-
-Currently defined compatibles:
-- fsl,cpm1-scc-enet
-- fsl,cpm2-scc-enet
-- fsl,cpm1-fec-enet
-- fsl,cpm2-fcc-enet (third resource is GFEMR)
-- fsl,qe-enet
-
-Example:
-
-	ethernet@11300 {
-		compatible = "fsl,mpc8272-fcc-enet",
-			     "fsl,cpm2-fcc-enet";
-		reg = <11300 20 8400 100 11390 1>;
-		local-mac-address = [ 00 00 00 00 00 00 ];
-		interrupts = <20 8>;
-		interrupt-parent = <&PIC>;
-		phy-handle = <&PHY0>;
-		fsl,cpm-command = <12000300>;
-	};
-
-* MDIO
-
-Currently defined compatibles:
-fsl,pq1-fec-mdio (reg is same as first resource of FEC device)
-fsl,cpm2-mdio-bitbang (reg is port C registers)
-
-Properties for fsl,cpm2-mdio-bitbang:
-fsl,mdio-pin : pin of port C controlling mdio data
-fsl,mdc-pin : pin of port C controlling mdio clock
-
-Example:
-	mdio@10d40 {
-		compatible = "fsl,mpc8272ads-mdio-bitbang",
-			     "fsl,mpc8272-mdio-bitbang",
-			     "fsl,cpm2-mdio-bitbang";
-		reg = <10d40 14>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		fsl,mdio-pin = <12>;
-		fsl,mdc-pin = <13>;
-	};
-
-* HDLC
-
-Currently defined compatibles:
-- fsl,ucc-hdlc
-
-Properties for fsl,ucc-hdlc:
-- rx-clock-name
-- tx-clock-name
-	Usage: required
-	Value type: <string>
-	Definition : Must be "brg1"-"brg16" for internal clock source,
-		     Must be "clk1"-"clk24" for external clock source.
-
-- fsl,tdm-interface
-	Usage: optional
-	Value type: <empty>
-	Definition : Specify that hdlc is based on tdm-interface
-
-The property below is dependent on fsl,tdm-interface:
-- fsl,rx-sync-clock
-	Usage: required
-	Value type: <string>
-	Definition : Must be "none", "rsync_pin", "brg9-11" and "brg13-15".
-
-- fsl,tx-sync-clock
-	Usage: required
-	Value type: <string>
-	Definition : Must be "none", "tsync_pin", "brg9-11" and "brg13-15".
-
-- fsl,tdm-framer-type
-	Usage: required for tdm interface
-	Value type: <string>
-	Definition : "e1" or "t1".Now e1 and t1 are used, other framer types
-		     are not supported.
-
-- fsl,tdm-id
-	Usage: required for tdm interface
-	Value type: <u32>
-	Definition : number of TDM ID
-
-- fsl,tx-timeslot-mask
-- fsl,rx-timeslot-mask
-	Usage: required for tdm interface
-	Value type: <u32>
-	Definition : time slot mask for TDM operation. Indicates which time
-		     slots used for transmitting and receiving.
-
-- fsl,siram-entry-id
-	Usage: required for tdm interface
-	Value type: <u32>
-	Definition : Must be 0,2,4...64. the number of TDM entry.
-
-- fsl,tdm-internal-loopback
-	usage: optional for tdm interface
-	value type: <empty>
-	Definition : Internal loopback connecting on TDM layer.
-- fsl,hmask
-	usage: optional
-	Value type: <u16>
-	Definition: HDLC address recognition. Set to zero to disable
-		    address filtering of packets:
-		    fsl,hmask = /bits/ 16 <0x0000>;
-
-Example for tdm interface:
-
-	ucc@2000 {
-		compatible = "fsl,ucc-hdlc";
-		rx-clock-name = "clk8";
-		tx-clock-name = "clk9";
-		fsl,rx-sync-clock = "rsync_pin";
-		fsl,tx-sync-clock = "tsync_pin";
-		fsl,tx-timeslot-mask = <0xfffffffe>;
-		fsl,rx-timeslot-mask = <0xfffffffe>;
-		fsl,tdm-framer-type = "e1";
-		fsl,tdm-id = <0>;
-		fsl,siram-entry-id = <0>;
-		fsl,tdm-interface;
-	};
-
-Example for hdlc without tdm interface:
-
-	ucc@2000 {
-		compatible = "fsl,ucc-hdlc";
-		rx-clock-name = "brg1";
-		tx-clock-name = "brg1";
-	};
-- 
2.34.1


