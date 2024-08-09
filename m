Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842694D5A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 19:52:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dyDuqlVm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgWhg3cH2z301N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2024 03:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dyDuqlVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgWgz0NfQz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2024 03:51:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyL20g2RINjNIi04qwVQwq8iOZgc+LP4GK6zItj4PqoHUA8pRz68WPhLjVApE5vcwsHRcWYctaBxS37QoDjtbgYcW2DRbBk5y5Qi3XcLEwtM9pVW2Hn/4cby8n21s5OHG2wha5gKDAd7jziXKNWqMSjRwRaOhx/YfgkYrHWbhUQGUIvtv0o0owspsSCAs/3dH7ms9uD4npspIeT8dcUFWyYVsokVdOutZkyErZ7Tmk8e6O5B5jnDXc6jCyetc9I0lJfSbdw+I6Yj+0CYf3ui7fp4fLy4378tO/QcZFZyWu1CA502q6TwVJwWpjlUwIdSEQI7Xk8XdmpA4qMFB1AzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CTVRmxbByW2YRbrohBxDwhpt7SeRR15knglV8wjIpc=;
 b=RB/KwfJ1dmmJk6pLIL/FxaN8jjou0SY94gHw6gJzKq+zpjwqINANo+muPajdwekmbQbtnz7gOns7uDlEjl2AACKFFSCl2Nrv9D5LpYyc2M4RnLMSStz0DJ9TXVXMj8Lxkp2PotC/HeWakRPmNPYQKgnubm3sLxNoQdmH5f7FWaluK5O8oPEN8VsKjs+HwViy3QIBlmv0htNoLAoMczv58MzfxANpQRAHWp3cJDmTuEFxjQFo2r3eRu0CimMDzhYKEquhmDTEFYQwbHfHbLpiOlbV6SL3Ot+p5S4haCXZpzcfviClYmFR3+5WHbG9TxIbsP+LFvliX/lLUkBJAReggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CTVRmxbByW2YRbrohBxDwhpt7SeRR15knglV8wjIpc=;
 b=dyDuqlVm5zaTaDwTGEowOpeAthsoD8ZnGi5dG9Cg3Cv3/f4en0PePBg4SeOOCeBYsdSbFw8KxBRx9+u1H/CYaskM7lmAz8mDE0mdbXvSNZzQ0YfLv05VnSuOYEQpUjjsJiGf707zh6tR1qxH6eFHhtgJeafeQK9sMxjf4f0iXHQQL0jfqPeltuG5jWQx7TpS0QBa7RSk1MTfmLeb4YJGnKDdcoM3ulAF0qGM9TWYVjbI/nM7VvYd7B+HPLwWqbI3gn1M9OVWwnGsxJ9H/BOfyKF/IPrmSW4aBvzkasMMxpIuDq4DyO2+2KFlCnwQcw90RYEVefBZdf2WhTkdGqEofQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8398.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 17:51:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 17:51:28 +0000
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
Subject: [PATCH 1/1] dt-bindings: soc: fsl: cpm_qe: convert network.txt to yaml
Date: Fri,  9 Aug 2024 13:51:07 -0400
Message-Id: <20240809175113.3470393-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 56dc0c10-2122-49e6-7bd0-08dcb89be53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dMhbCim6LMVFSvjfuq1cwNmA5UEXMEZP+IqUmgzCAVQAfDjueqr4t5xNcSpW?=
 =?us-ascii?Q?90iOR5dGuyepMUflUy+CZyaXnto5/WvRx8+HyYRLd/dxo1WcvEAURFYfIETH?=
 =?us-ascii?Q?LZq/ZD7Qq2SLOjITqwQe0DGLtidgvxfVTtvaKd6t91elqNiOwUkPdx7dktI2?=
 =?us-ascii?Q?1bIPLqNVzT/PyNqVce4Ui+bpdKDKD4D3fv+RexEx+c3vTu8JYKmEhMz+OkW9?=
 =?us-ascii?Q?6jeM/CK84dZRFLx9rBEifOg6SDorKSxAJm2BJFeN+/2TvR06tqgUzKt053vb?=
 =?us-ascii?Q?u52PE2pGckHdbezWE1HBjD3t3lG2s9Zxy0/NdrjP+XPwoPg308aEurWOGpuf?=
 =?us-ascii?Q?GYyGv/rh4d2Hnut3G82XjqN6/vE48HsnXrKUN7mh+1VLRv2JiD2LXpEYHeoM?=
 =?us-ascii?Q?8C4gUO+nCkeMs58bjHp6vSFBqE2S3zU5uJEY6dHNuf5c7mnfXWNk2iqilMFw?=
 =?us-ascii?Q?BB/kTiYVAIcnShGRDR7KkpTB2prILTV2mujzzmaZyFQYLIrOhc3yzBNQrd5F?=
 =?us-ascii?Q?CnH8aQLzfps7rI0/pvGNZVCslOywDH4OvIruqqfNobKPIn9afUzAFmp5N8Ru?=
 =?us-ascii?Q?+pcIU3JAaqwZxuqaXkK/4ociWjsbEuH/UPWKY3Se+gepYbAKYpw+CifQpn/z?=
 =?us-ascii?Q?XDv+Nhq0FDSQLipLrVQ9CRUf7QlKsAibp1Da/BwCYMfzgTD7TnQfMunjfyuR?=
 =?us-ascii?Q?GHvztIVtFLTEr4ASaq3yohoet8f9eJsPTS0a8NcBnAnKw4/AnIeEUffstLNk?=
 =?us-ascii?Q?SuERvb9SZ7lQFzq/gc2pXLVecO1Wf/LAKO7V62i/YQnfC90VN9DdhiEdDGpL?=
 =?us-ascii?Q?WfhdU5GGLPXlXjIgIPc6/1rYbptTEiH+Oi4TydPgrwtMxs2dkwPpez6+fVmS?=
 =?us-ascii?Q?fYsy8zLFKlGBTgWVmaLZFGXOpeTSWIG1sCVcVQOF2GfchGV+3na5mOENHqVn?=
 =?us-ascii?Q?B06HJdhiWQxx7d7BPf94ihLyyoCPGed6bnBYO/Qp1LP51ZpePGhP7gL2/w/4?=
 =?us-ascii?Q?/J3cAE2ErU3XNqwEouxbdbdAJrJexj4qE3lfO1pAkfZTESntCyTds9ZipYdA?=
 =?us-ascii?Q?NBGnsySUOeteTcYkvH5Zxa7waBSVyjzS/HD2Mor2YjARJZE00QCNZYOga15q?=
 =?us-ascii?Q?feG3EyXMWXmpD9zV/MRN0j+3J0UqXYAFusSoE+KPswS2DlOXEhXXAMIcT4rj?=
 =?us-ascii?Q?bsB51snazFmTAk9ZT7BwG7Ghgz6crAq560DOEDfd3tXg7XGQ5rn+/uNvyKe+?=
 =?us-ascii?Q?1ffRjEaoOCeorwKPbtZ/p65aZbzXMXpDGPeGge3yJmjV66q94WRc3WPQMZP3?=
 =?us-ascii?Q?+TSpLqRQTVI78zr5dwymLZGELUwqDR3UitXU4s+wK0npg9LiXzxFv8ehTMQp?=
 =?us-ascii?Q?M4BoPmo=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fNg/7PLtaPxOWi9M1lf7G8NDtACYkattK2x2VNevJt/xg3qxLWvYQjoJWeYn?=
 =?us-ascii?Q?oXxZALrGe6uKTEbv8EwPf2XWnGwloDp6Sv9PPDIM9UbXxe+iF68KVb+aWZW5?=
 =?us-ascii?Q?OzHz0udfyHJOb0wYloiCNLtC10ZZRHUXCLrBvMBoocE65ci1wIuc/WSrpjLL?=
 =?us-ascii?Q?78/aht/W8aF093ItDq9hB+ka6/XBEBo0ETsmprBS/5Cbhg1ToH7S381HKVY8?=
 =?us-ascii?Q?KpaRsbTWXCzb6xv/pob+iA148Wu4lL5zuHXCWd7+gi4ZxA9+khumKwjIiouq?=
 =?us-ascii?Q?w7OiIR2Lnrvz6prKkQQmeOfK8SDM4rJ/9NSHd3RljHEC8S1V7Ohy1Zue+Aws?=
 =?us-ascii?Q?9EwiKtnRNfI9MxIWmYxNnjhJHjjOBn9KfOLep2IsYmuVdy4oW9m1ITpnvWbY?=
 =?us-ascii?Q?V4wE40uo5rhImxDby6qFkxDI7goTfXcMnPlqKGNgFJtFnFMwmhplDpxtqTph?=
 =?us-ascii?Q?k9QAkmK7SA+T3h4XYWMlAB/C6KlDYWxaQ6VLWdVZUbHLwkTN5odi/HOgVtkO?=
 =?us-ascii?Q?4vUbs+2rP+e30nbsSPl8VUI6cmNU9VY+fqpCwHCN218ssOTU30p3HiKeH69A?=
 =?us-ascii?Q?E5bQcpQ7Lbnfphigqy8GQmXRtdKQUMl8UyaEKvpG4Z+7vdmcIBh1yV391cu1?=
 =?us-ascii?Q?M8V/psC+I4uESKXvMgSD5a8HwuqfxdtxL4+hfi9WuqzTQNyxB9dnHs4xQYSu?=
 =?us-ascii?Q?gSSYJGJwdWbHH1WV5nYIitqS6HCQTbtrLaxBvoC1Ro1rDFQ9Eg90TzPZf2wN?=
 =?us-ascii?Q?nvxgWY+JPAYjmoO/gYbLWEXv44KDSLbJCMfexmEwhfyEeOImNObaatr6zckn?=
 =?us-ascii?Q?bjNmqp0OLxKatIrJD3XjRXaq163cuhIFlm3Tz3COzMrmt6CT9VjlC1bWFL+D?=
 =?us-ascii?Q?94ZVPtrTvqQIGOLAjfJFDxqo1FEPHTkvQUgVGJlrTlOLj8sUl5wGg2fbT6Du?=
 =?us-ascii?Q?nB34BgSV9hOEflqbM+brpDpvypYCEABep2fMsqxKtIYuIxUgu57pE02IB2fl?=
 =?us-ascii?Q?Punmf4Kr1Tj9oAyKrSQvBCxKnSZzMANGDutZO32Nu1I9o7qKmN5ay72MqjMm?=
 =?us-ascii?Q?dHbB7JOJqN1+7GIqSmEU0t2xeiFYpa2X212swK1nqy5QtwgL7+JSyUNwATLA?=
 =?us-ascii?Q?gMsECpxljiTHDC32D/W8aGS3md1WkE+G+UzsWqRF3fhT9RIklLivx5MCCuk6?=
 =?us-ascii?Q?WiwihidBrQ+xJ0nFRN4pkKj5y4mdaMV7MddP+y+RLqB40mtntzacP7JUmdaK?=
 =?us-ascii?Q?gN7bZXUPJIeFGyqQ6slIpPy9dCOJRpA1iToJJ0Iq+H4WZqvYVGqCfoRvj05G?=
 =?us-ascii?Q?iu1m3n3n5TbMd+CLbufhJ2YGy6z+lU3y46VuWnNvX0trEZIDHa4kCT/qXrSr?=
 =?us-ascii?Q?cQV5YfW5JN0Y8z3cdt6W9OsaUdn+q0lve7w5yu6wY9htaXTXn1q+C2TGFwnL?=
 =?us-ascii?Q?nEg6S3ROivWY+Kxwe/82vQ5nBRtPhjU4DPIhr39VYQi1wPaS2Moe7DzktLek?=
 =?us-ascii?Q?Wsw/KV2oSzfvRhrYoSdDG+fcYyCzal+fdftN5woU9wGjws2f5+NIoN1mQTN/?=
 =?us-ascii?Q?h+3KmQgFSHvIJxtVdYCbgcJXn7oyCRcXPh5UmUcu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dc0c10-2122-49e6-7bd0-08dcb89be53e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 17:51:28.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTvI6yCCdjui9xYuNenKdIfvh2V/JvE4Dyrts6p2Oqfq7qNy21CWRzB/bvkG1AQNUx0vV9bMRpSvUVzxCkhS5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8398
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

