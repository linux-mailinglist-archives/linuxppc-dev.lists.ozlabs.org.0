Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E919432AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 17:05:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NtNKPUre;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYwQQ45TBz3dH4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 01:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NtNKPUre;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYwPf456jz2y8Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 01:05:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfPJn39UDSJQpl1oP+JnPlRunRonc1Y/unhcLtdEI5rJE7LMhdfb2wm13kDyEKtywbqd74PfE17Uo9btOfmOJftmoI/SDLjWTIi51xaxJBFZ0An+4jCqNDsGKj/a9xv8UDm1efKi5a2qHV0tescVg9cVO0DBPUhRjCJqQ4H1eYHGX3auT6K59TkAAIMLF3M01hHCpkIx+peFfvFFCBmOgPzhu0hFh7/p+VNbPxE0HlcvO/LbH6ksx7yI5NwjaJjGUK6hR7aEwzyA+qEfPm3SPTQwhAIuRFbJzFtjpVGW39f2AkNQyfAb3+dVMXbMEM6s6cKSd0eYg9JH2O0CL8sADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60KRb2GKTzaPOVBx0dWjAp9lQc9Vt9jLYjF5/7sfktI=;
 b=zJcZCwpJRn8IYf0Y9FN+1YV5IWr7+jkHCNyKRnjHtOqzRDPXX8fvOgqPd9kRCTNocnCruXMRoEMg7gigwB+Fmp54+NUCcgAmTNjJu9n9RNEMK9g3nrMO1fHyMmjmlIofIb+a0ghsl0VQDvSB/nLczIZGpVwTUih3rzo4wkwWpKphDncBQa1ihlw3FH/V+402vCd0oaMorJKi2zp+aj+lhdl8NahwZmzbE1ULBzNmN+Y58ygNQ0+kcAOgPUaAoKn4J/mfj5BbfsCc3/SlietIlfg3QVAG0ZO3soFoVzQhHz11mQYwJk7q1BgDgHOSZn56IorFD/j9infGBataXmmYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60KRb2GKTzaPOVBx0dWjAp9lQc9Vt9jLYjF5/7sfktI=;
 b=NtNKPUreOwSgiqtSbSdCgdg3zr5oBxztNnEI02xWjd6+Px3VtIckL/8jJaj5JQuWuc3F470mL00oKX/om3HniKQc3HinuvY9xLRewxI2fTnqxvf5cYitV7yyqbwNaAg0WJcjfN1T64SPvqyk6hZhIvf89bbQPJ/t6FCds2r0dQPKLP7pM+dTwf6WGk7vpIXaJhWuXsC2h3dw3CGK4vkWsMVjNesNqMz2zofv4fCdxLm306vwWExBlXbDUGCA4WnMLmv6Gk7eWkiWjKUah1XBvHHlZC3w/5CARi/bDGX01PEGaUKNpzi6/F7SmgnD87UeQn6Uz3SBLDeNxoTHMyU09g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9092.eurprd04.prod.outlook.com (2603:10a6:102:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 15:04:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:04:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Subject: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Date: Wed, 31 Jul 2024 11:04:20 -0400
Message-Id: <20240731150420.2217925-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 79408280-ec48-4f66-9b82-08dcb17218f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?jqQmIFyFOKVwxeuM8RtApPrY0q6x0pOPvQay4bncB+UK3k/mAccQKPVO1BQk?=
 =?us-ascii?Q?y3bpumJ9LCp+SoJ0O0m8pyCHGwZMba+TpIo+rxtrWBTCfaLRDqiukDrk2vc5?=
 =?us-ascii?Q?XMCVTqRQ1nMSkYVgMcWNPFWPJkK5bUOw1IzhGBpSQc1Ha61rn0i4tEJ7w2HK?=
 =?us-ascii?Q?Uf8XOXBtG/S/hP2NBdhPqUPe/vKYkHPEeUMnBubb8OOpabOQKuyqzRP7LBFf?=
 =?us-ascii?Q?tKfixsLDlleIMTZ+r9k+V2YJ0WRe0f12zAiHBGPoQbA8RktoBSTRNfwMHKRD?=
 =?us-ascii?Q?a0ArGT1+D2PSP4eWY2FWaPGOTDTB6F8XHA26AhcC9bHIgImByepBiaxk7HGP?=
 =?us-ascii?Q?1uvWGgXq97y+5KaNUbji8oTVCdQCEP+3OX4A9vMxm8tNbhyFgfNWHZVzTLR7?=
 =?us-ascii?Q?tgk92FjdXitfoJzAOhO++p0j6yEmflwwRyS+jQiW+zqzsJ8XBNl9dbrUBocZ?=
 =?us-ascii?Q?A5gdE2JlbGaSzQGp5vdSiwej9vh1BARaHrL0lKkmG9aRaaWYm61Xb6RlJSxm?=
 =?us-ascii?Q?jJEorebFnvnkpWzI9wutAntZuLQQeBtbLPoBLhJSgnRjwFTSb35Ni8gWCemS?=
 =?us-ascii?Q?zSfxTkVoW2UhbhXpkPgRaXqb0gPIkgPKPL/l34QlV+zdf2UnAFy7F8487A7L?=
 =?us-ascii?Q?8USlcZ4mXRIubysym/ExbCpAvF6vdXzBLRX/ltuHQH6xSGK7OtDHXBcDdpua?=
 =?us-ascii?Q?UEp1YPR5wRCqaIHTNQ5JrUgsjPILirP2iRpV0IgpZTTlJw/6IxqGxanlMCbj?=
 =?us-ascii?Q?NkQOX1qCAp/FIHlDCEYCWjdMLG3x/VDotA1coLtUx8f0K2QsNcRFNl929Lpt?=
 =?us-ascii?Q?cC21BhEGLDzNjTGXMQAARUkvtYawxate29z/P2cosmD2Nzd+ZukJIX9oiTn2?=
 =?us-ascii?Q?iGBYgwzbbhZqJD4gLvkMyQTpT5074oxD25/8iVxzT17+6uarcbJ7bAfQS9+t?=
 =?us-ascii?Q?LsFD31MzTspQGxfPXcVJogYrES8MGOManmNLoqaX9UfSg4nF9NNkSmKDe9ko?=
 =?us-ascii?Q?OOTalD0qU/8rRoAqSoZqrR5z6v0txOOJhRpTHAVgW99slNX2PDlGjHtK0OXk?=
 =?us-ascii?Q?yAHeUaNbZ81rxp+XAUpPHPPmFOuRiFdBcHJeOX7sEfSjYwp5EQO2t5H9UbyP?=
 =?us-ascii?Q?8R+PQxwpFopOVYvfSiMgsqv5vFbUO5ZtvpKLv2ATbpklCU6zoLtjLLr+rC/m?=
 =?us-ascii?Q?QHRoUAvcpqnCkmc5qDJoVQVepF9ucFYUGjilsL9DzuoVB2hzEk9dnzOzhz2W?=
 =?us-ascii?Q?MBqApQu0gEXALifotk7jXVjKrp42a2mxSNfF2W9oF42st31uJgSWl2zpDQ4/?=
 =?us-ascii?Q?7WX5SxTIs5r5NCvl1gZvk1Nk8CMMdy6ACB4bj3O9rms67qskSDp42RYxrEDR?=
 =?us-ascii?Q?AmOJw3Y=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6daUwNWoG0mc+LvNhCI/TFQuPAGQp6aVo//AA9Bxd4xJxjJh3orG89Umni7U?=
 =?us-ascii?Q?bjO9pEHFyqOLptikSBEgnD84PbtA1c7x99UQ4EdYaHniS+h+ZZ19CYgFKwUT?=
 =?us-ascii?Q?dGeOHTJKuVzo0b2Bo+VANd4GD2MG2RqsY3UVp9SvHbfuXLJM6iNdgfZqwrJ2?=
 =?us-ascii?Q?4XZ9NKQ4BNJDmf2eGQdu63yAXKyrO6/BhcR1ObmO4kE1Wumqf8hlGr/XA1nD?=
 =?us-ascii?Q?9DD83Sf+Yt20LpzuPLGX1Xhx+gh0WbF0YxpAV71ZPyCfwZheYFC1Zau9bDcl?=
 =?us-ascii?Q?tWQdPCUViejNJ9lhqZ3P2tuyFrsYmmoazXFc2zPOJq76ZKZL2rrvq90sbzNa?=
 =?us-ascii?Q?e8jbRAHaLTiX+yW7wBCd58LHz3bUtUG6i8G1OYlFwjU56rioIcZGLfCxHVUF?=
 =?us-ascii?Q?cGkhjMr07wsHNFcpRz9jdthMJvsDPnd40Cm/OvyW+yZ5B7ymvqcsyzAgBGk1?=
 =?us-ascii?Q?MQu3z2avbocbLZ+XOkqoe2QN8YA6cf14bJzyJl0DwcYM1CPJgfaPjnogZ/yB?=
 =?us-ascii?Q?RjHjkXAnMf9wugi0xHMkf0i8hgxZi2x2Ep2YrKFDazV0wIzfoQ2myaKjovu7?=
 =?us-ascii?Q?i5yMti1O5b5e7emZp6aJ9+Ee331yQ+e05Kmj61yehCxjaPjGPm4x7H1eZwju?=
 =?us-ascii?Q?DOvqoT278PSHwS/vqa7tUrSrZ3mFyaoGNFLE8uYdrYkqoQoGD2reDCNIN4Il?=
 =?us-ascii?Q?Dq5djqUGLbF3h7c4b4RbzYeth42xmC+im2bf2WHYMKgHHj1AyS6+pKu8olL4?=
 =?us-ascii?Q?wHoJ6dKyIXbPW7KMdcmXKogG4GvkuP8z8IUUugAPcn4lM5+PaJ6VeEr3w+vs?=
 =?us-ascii?Q?RUqfICL9g5CkbpeElS2geCPKQupVYMz/Wwn4KAKJPOfP5/TzKtcPFNPsbqLq?=
 =?us-ascii?Q?crXWBOaG0WkitUZUUpCPwE0fuLCw9nzegQY0h3E1WMVIoFmLt+DzV0It3f7Y?=
 =?us-ascii?Q?m/41A5/sb/1juDoV5JXJ2FngJcuKXO0FvKKDyJP07knrws1lN3gOzq3XG3aQ?=
 =?us-ascii?Q?7BZkdApFr6LGfDQHODM6Fks6hYt7CHs6giWQrPK6hhDzqYUHwWHWTysyrgYL?=
 =?us-ascii?Q?2rj7MO0GADK22UA/Xi84mWtxMtFyl/IPUXkuXfo72HUlWrohuM86ekBxc1OY?=
 =?us-ascii?Q?djkWR2vgxMQeANfsPIUEUvKP9SSzoS6Dkgfa9RwJE7396szPAf+ZHoC/NFD0?=
 =?us-ascii?Q?PQJFsqtBMpeqVt96JYjYLFxjfPgRc1fmLlEN1DTeiij/2dsCHSk3m48pK1h9?=
 =?us-ascii?Q?pW5jTqsVbxs0YpJc3G4u1Oj46C3ILmFnNNq6vedZwcd/xiQaNV2OBWhF2Kk7?=
 =?us-ascii?Q?GupxjKN8PiwLD4u9cnfpc6tOePFtwzO/Ur0p4uWVAwP/+Bx5zzrKHtzO9cOQ?=
 =?us-ascii?Q?OyBOWudnBmUlLw/B5tnQm6L7PXFeqlnChMEwH9Wxh5SaQKkSDVHF53IXGUmi?=
 =?us-ascii?Q?Giz/yGdltDqL893yzN7qPVz3JOLfZoD1iFse6544z0qg39Y6Fdex3g1LJb8R?=
 =?us-ascii?Q?sx7BnOeKnAxYCHOGu0CLD8osx+SrQ/HbpoUgluRV+YId5BOypbh/dMhu2TNM?=
 =?us-ascii?Q?CIH2UnyzFvG1XhbxnvE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79408280-ec48-4f66-9b82-08dcb17218f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:04:38.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYVPB8Qn6vhxnrP5TNZbya8fhYFNBTs3kUyEcUCKvNpmvmicMjZbW5YPs7GKDwVYN3TC6nSMpyh10OBUGOuq2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9092
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, imx@lists.linux.dev, Frank.Li@nxp.com, conor+dt@kernel.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert dt-binding rcpm from txt to yaml format.
Add fsl,ls1028a-rcpm compatible string.

Additional changes:
- Add missed compatible string fsl,<chip>-rcpm.
- Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- add missed compatible string
- Remove compatible string map table
- use oneof Item to align compatible string map table
- Fix typo 1045a
---
 .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |   2 +-
 .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 101 ++++++++++++++++++
 .../devicetree/bindings/soc/fsl/rcpm.txt      |  69 ------------
 3 files changed, 102 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt

diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
index 388102ae30cd8..3ec111f2fdc40 100644
--- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
+++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
@@ -42,7 +42,7 @@ properties:
         minItems: 1
     description:
       phandle to rcpm node, Please refer
-      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
 
   big-endian:
     $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
new file mode 100644
index 0000000000000..762316ef4d150
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Run Control and Power Management
+
+description:
+  The RCPM performs all device-level tasks associated with device run control
+  and power management.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,ls1012a-rcpm
+              - fsl,ls1021a-rcpm
+              - fsl,ls1028a-rcpm
+              - fsl,ls1043a-rcpm
+              - fsl,ls1045a-rcpm
+          - enum:
+              - fsl,qoriq-rcpm-2.1+
+        minItems: 1
+      - items:
+          - enum:
+              - fsl,p2041-rcpm
+              - fsl,p3041-rcpm
+              - fsl,p4080-rcpm
+              - fsl,p5020-rcpm
+              - fsl,p5040-rcpm
+          - enum:
+              - fsl,qoriq-rcpm-1.0
+        minItems: 1
+      - items:
+          - enum:
+              - fsl,b4420-rcpm
+              - fsl,b4860-rcpm
+              - fsl,t4240-rcpm
+          - enum:
+              - fsl,qoriq-rcpm-2.0
+        minItems: 1
+      - items:
+          - enum:
+              - fsl,t1040-rcpm
+          - enum:
+              - fsl,qoriq-rcpm-2.1
+        minItems: 1
+
+  reg:
+    maxItems: 1
+
+  "#fsl,rcpm-wakeup-cells":
+    description: |
+      The number of IPPDEXPCR register cells in the
+      fsl,rcpm-wakeup property.
+
+      Freescale RCPM Wakeup Source Device Tree Bindings
+
+      Required fsl,rcpm-wakeup property should be added to a device node if
+      the device can be used as a wakeup source.
+
+      fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
+      register cells. The number of IPPDEXPCR register cells is defined in
+      "#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
+      the bit mask that should be set in IPPDEXPCR0, and the second register
+      cell is for IPPDEXPCR1, and so on.
+
+      Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
+      mechanism for keeping certain blocks awake during STANDBY and MEM, in
+      order to use them as wake-up sources.
+
+  little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      RCPM register block is Little Endian. Without it RCPM
+      will be Big Endian (default case).
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rcpm: global-utilities@e2000 {
+          compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
+          reg = <0xe2000 0x1000>;
+          #fsl,rcpm-wakeup-cells = <2>;
+    };
+
+    serial@2950000 {
+         compatible = "fsl,ls1021a-lpuart";
+         reg = <0x2950000 0x1000>;
+         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+         clocks = <&sysclk>;
+         clock-names = "ipg";
+         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
deleted file mode 100644
index 5a33619d881d0..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-* Run Control and Power Management
--------------------------------------------
-The RCPM performs all device-level tasks associated with device run control
-and power management.
-
-Required properites:
-  - reg : Offset and length of the register set of the RCPM block.
-  - #fsl,rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
-	fsl,rcpm-wakeup property.
-  - compatible : Must contain a chip-specific RCPM block compatible string
-	and (if applicable) may contain a chassis-version RCPM compatible
-	string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
-	such as:
-	* "fsl,p2041-rcpm"
-	* "fsl,p5020-rcpm"
-	* "fsl,t4240-rcpm"
-
-	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
-	such as:
-	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
-	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
-	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
-	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm
-
-All references to "1.0" and "2.0" refer to the QorIQ chassis version to
-which the chip complies.
-Chassis Version		Example Chips
----------------		-------------------------------
-1.0				p4080, p5020, p5040, p2041, p3041
-2.0				t4240, b4860, b4420
-2.1				t1040,
-2.1+				ls1021a, ls1012a, ls1043a, ls1046a
-
-Optional properties:
- - little-endian : RCPM register block is Little Endian. Without it RCPM
-   will be Big Endian (default case).
-
-Example:
-The RCPM node for T4240:
-	rcpm: global-utilities@e2000 {
-		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
-		reg = <0xe2000 0x1000>;
-		#fsl,rcpm-wakeup-cells = <2>;
-	};
-
-* Freescale RCPM Wakeup Source Device Tree Bindings
--------------------------------------------
-Required fsl,rcpm-wakeup property should be added to a device node if the device
-can be used as a wakeup source.
-
-  - fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
-	register cells. The number of IPPDEXPCR register cells is defined in
-	"#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
-	the bit mask that should be set in IPPDEXPCR0, and the second register
-	cell is for IPPDEXPCR1, and so on.
-
-	Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
-	mechanism for keeping certain blocks awake during STANDBY and MEM, in
-	order to use them as wake-up sources.
-
-Example:
-	lpuart0: serial@2950000 {
-		compatible = "fsl,ls1021a-lpuart";
-		reg = <0x0 0x2950000 0x0 0x1000>;
-		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&sysclk>;
-		clock-names = "ipg";
-		fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
-	};
-- 
2.34.1

