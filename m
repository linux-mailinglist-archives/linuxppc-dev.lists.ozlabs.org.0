Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F9949573
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 18:22:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WCcZIIvu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WddrJ1KBTz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 02:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WCcZIIvu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wddqc47P3z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 02:22:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7vhVIb1c75OFfrs+FY1Nkh8lS6fSDbP6Eh/cvxK0uV0294nn6s61xUYqUS+FR5UR5+D1gHLdm3JzYhr6ueldZ86y7RaWAf1q1WIWyZE0n6jwm4DwAAU8eNcnfCHf0u8heEkBdZFFYC4b/gJN4UUj5WpePLac0+PuumivGrr7nDG8n6HjVig3D1I1Cfzbp+9OQvsK1BvEmFsZfIYLU84iiLGsNH+6KE7BkPgfcPmpJwWftZQxbuLPxJAQPtsgUOH4K1kBdqVOCacEHxozzaFNe/8aK95NybcthfcfVyAwzJKnTuYIGIN5+SlzZqSz26wa13M0Xv4Rw8BdB22pLI5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh/jRr6XPk7fEXSh4cPu9bRDHeMBoKS+Zru6h4bY8xA=;
 b=iuZNRQy+Plh3rqaGdueLRM0/MHo1kwTaDhnm6c8+UYHZC+BUQhUCrj8pDs5zHStVeeMC/o116tqUXQEaigSWjP9xmIhcm/bAlwJH4gjyFVnj0Twy7N5bliPgII1I1ra3pL7uZpb24Rh3eDdTwzdV5u3q3gOZju1RlOhjbXO1vRLclQvK+wGpFCT76QKBIHPBMuTwici4QQz8tFqLy+ue6YLxSRm0iLTtQnPkWdeEuvjITDQ7DBL97W/UiC2QGWS0TGzjJrkskABy5gurJPqYC66InesY/U6X7ji+699re7PXg0WniTl1ErmOdrbbw8b1r0/iQmggWqtoeQlcvwTe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh/jRr6XPk7fEXSh4cPu9bRDHeMBoKS+Zru6h4bY8xA=;
 b=WCcZIIvu4IsfjsyvBrfhYKLUbQyyTwIOBupkiEM72SRiOTSulWa7Rrz2HJ2PpgMAlCu6GoOPGRcQwSb3PxDUAL1x8vfjT+WVa3+JTuSs4OzLFjk2fCRhysL6HWU2Mk6GYHT/F/Aes1T/2SZYlDyJ/pk8MEYfUKld3mCfGYyb95o76mgIQqLheQMy6syXdlXJ2AoBg31bplxg5E2aokP0vV+LHl8VsmNQ087CSUEb79lkJQTKd3xv9AylHtL4OZ9jFoDvz44OQgR8/NHFrQ4B8/uLn9Gx3sutazPOoE6DlZZYAn1mTUQgOzZG/WcgbupTtH7lO7IiJQQ539SQvPlf8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9465.eurprd04.prod.outlook.com (2603:10a6:10:359::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 16:21:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 16:21:37 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: soc: fsl: add missed compatible string fsl,ls*-isc
Date: Tue,  6 Aug 2024 12:21:21 -0400
Message-Id: <20240806162121.2996442-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 10240a6a-9a2a-4184-58d3-08dcb633d8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?0OqEWAJxF7nBvu1D92uUXZqq//j1xGfgVgJtVxBOFJLD4qqRsdGEvRGt52jD?=
 =?us-ascii?Q?mvPY+HujDsaCvJOoao4y1OCLm376zSep50YYyZCNbHIHEXlMItYbzjgFERYh?=
 =?us-ascii?Q?kIaZermjEGBDGKvyOjQFKGwZ++znQPae/FsGCM2g5qVIAjYpNBmfnX4Iytpq?=
 =?us-ascii?Q?oD6ZzAISoZQTyBwrVxzOCkgnb69iNbsJgUpPPDITAwzRwykEZfTisf0HKuDt?=
 =?us-ascii?Q?WXDyOiW24jXZ2YvxvljIBdhuDdWgWjqXYs4qEADYkd1v508tMkmkRe92DIk+?=
 =?us-ascii?Q?BsSoxEwjOA+8vXqT+DQh/DnlBVsKm0FcTKjV89t91W7sbzk9VjYQiMn4TPzk?=
 =?us-ascii?Q?byTEmuOIk3kJ2vkArimeD3SDaM+JSkSydSFmi8gAa1wmAJx+jnNAwXf8BXsU?=
 =?us-ascii?Q?J4wAK1OFjSJLgQ3YTcNw96XHmWFyiBoxk/m3ZxY4SZARFs97ilIKqS/bJifZ?=
 =?us-ascii?Q?jEQPqBnzR5S/VD3QkXaHj/uoJXr/B22EE3Thcb1YsLoYVp1yP6yOTWSACBtj?=
 =?us-ascii?Q?m6QpCDfJHJZChvoEjnVMhgMwNuchhFpBHvKuO+ZQYteaiJnZvZskECu1iLAF?=
 =?us-ascii?Q?o4IKZ+DOC1uVg4sOC7td9odKg3lngsWSosqI/+XH/NbbKt9uOZHGf9Cm2lHc?=
 =?us-ascii?Q?BoVqo3x48RDQY65FcCdXFpvT8GY/uBSawF7T1zr0pP5hhVGvWrhb0VZVdB7W?=
 =?us-ascii?Q?tA7ponrTMERiR3m4Mj9RFFP/soP8vwkHkRuHtEsD5ts6L3dDSQr/QaVVe5ny?=
 =?us-ascii?Q?W2qBcQWXbGtkxukQH+Kc2vclrS4j4b/C1j2O2q7yfWE7HobunoAS0iJy0P60?=
 =?us-ascii?Q?rSL+t2SD9LJQgj81Avtciog68vOfjbAhHGUq8r52GFYsUsVjM/jFrp6e+diJ?=
 =?us-ascii?Q?Tf4nYTTQ6h2ptJ/x/bty0OsBWMFgQYd+fFzMqrwOeezpHVvMyn5nTVlBvCYa?=
 =?us-ascii?Q?/W7Q17Q3mZRXToFHRwcJhGPL6s++Z2FCI515k5bRJXXAh2WmUSnTiGYfsbnE?=
 =?us-ascii?Q?R17uFfkdbQAVi88GmF8aVeNxN7RR8r6iRn1NXok+8zRFvTnjKrghn09Lh2FU?=
 =?us-ascii?Q?w9Vd4H45O1btyRltBFuXHDkw4X1eLPOjvJtKr5YIgB+BuVtIcVL+3PYFRoAe?=
 =?us-ascii?Q?WGgALjU7qfeJpSLG9h8nMrwwyPc/KLpNVMsI5c8vjcE3fnu+2HOW8q9OYXj7?=
 =?us-ascii?Q?D1cIf3LCwrYbvKhCHaKySsL1VfK1NfIfGUd9KnfDSv0ptx+13Ftf9BYUZy0E?=
 =?us-ascii?Q?mHZH3j2j09lUVudOY42kBzs2wV9cZS7Bja1RxYUoNS8lAcy3euestDexai/8?=
 =?us-ascii?Q?oq/G4R2tvohwwrGOQTTGHsjngwMjoJL/T7JFj619zmUfHmT13l9PDdjFdE1a?=
 =?us-ascii?Q?Hw3DO1YLos+um7FsimXNHxh0R/nNVXRR/DMdePadGDWFsef7+Q=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jUEmK/jCTzTa/HqMB0q3KftzV7BGwAfsdshiqnCc7BgDIjP2vOmcYl09aMyC?=
 =?us-ascii?Q?mjSsBdhs9NuFRcsQyZ+YxaGjDjx0p1vS5+C7f98DX6CSxmeIyyUw2cCDA7/V?=
 =?us-ascii?Q?wibjs8kKpoUlKfVm1AOH+2jxmDFQy8GDKENi3c812vd54zU5FjyUSzmru131?=
 =?us-ascii?Q?NalkA0Dd4DtMFrO/5adPymHwm5oi8BpEQUQkgtpGAC2sgQfF3Y824FPDVzPY?=
 =?us-ascii?Q?7n2cDVUnSnzIYy4yVW1Xil90A/X74oUCa1XfQCuA8/Ao0e6ytXvdVT+PFYfz?=
 =?us-ascii?Q?h8WhdkF+uFxyhKtmv5OtEwVAQBZYjGjkD4GNTazMnV8F/K4OLeF3yS84z4A7?=
 =?us-ascii?Q?07YOSGuus0BAhYNmYSUvS6gbB1nYg/NciaVNydnN2SW75YDH0FH50ZAZELUt?=
 =?us-ascii?Q?gn/7NjQcUxFlvEt4uEL2N2g6/A6Wsna1lBZOAoMqdyaPMwo4Z7O3mv0gMoqI?=
 =?us-ascii?Q?d6o8B1/V1eQyr1WMPnZze5wZORgWccMqgSkUzh6FMmYx8G4wUfmFcElSBqcX?=
 =?us-ascii?Q?xa5QDzUj+wXraN+MphwLGnTPhzEU7xhntJk7e/Vx1Tyx0glWj6HJNlsyvdDj?=
 =?us-ascii?Q?VdphUeUdsawNWYBBgINP8PTPELYG8FbTTso/y6lKFpKiiwi+HG1fVSCbbMPK?=
 =?us-ascii?Q?Q0FWxj6K8kfZcmEziH/F2kAKpQVB1zfRXKAHDoiG8V/7WZNYVpz1r1dWlyR6?=
 =?us-ascii?Q?xxq+nWrUv5sAUQkH+FYN0VrfvsQpLN98pUxuIdPokBxx7eHi3lrtEWTjfTQK?=
 =?us-ascii?Q?f0l7Ju4RNss4BQSmYZ87rfprlPYL7bT37ULBpDvGZXQl3pvHyY05vVQqJJAZ?=
 =?us-ascii?Q?vwleZfr5f9SIY4QHxZmf2WGE721U8ebRQ3ISz6r6vkdhap4t6nqSVkMQQj9R?=
 =?us-ascii?Q?jQmV1irERcs9eyiskLit1TJfUZbB8xgqoSG8yaOJpg5EtKPxW8QD9rjpOuMs?=
 =?us-ascii?Q?hh1Ipqe9vCqQfyO/WpmOllJoxUL2DJRWyqAlI/ioYgcfyv8jurgvm3VytPwI?=
 =?us-ascii?Q?PeBtBSH0fCsVbMlEK/rkK7k+IRqdPGquuHDW/3sQ+u9+RvO9S920sl3ZX5vn?=
 =?us-ascii?Q?+dzCcVXc75GB4j4la0hNVjnqgG3drhU/stDhGyDMU2gHg15Mx6il+gJvP1G+?=
 =?us-ascii?Q?3UURRGIRyi6dGXpftUzJowMpdpeCjpHg33hRYUEP7O5jA2HAGuMSG4L5JyF/?=
 =?us-ascii?Q?VwtqRN9Z9n7XG2LVQhmN15+sutsr6CgVrR1ZNy+iqfm7MwpbCfyaWWcE+lOu?=
 =?us-ascii?Q?dVYrEzQss05F/Ea3F7HY235NlFTCI2gJx2c0JunvvjkO/zVPOGJzriyyahHI?=
 =?us-ascii?Q?nROIwoFR+KfgSdapO9xwATr8YJ4WZ1fh5NlwNLTnaN6a/9IwpURsYlweNhOf?=
 =?us-ascii?Q?F2gWG6Ailh01Y3ap/9idUcCZglrAU3vVGmmYDMj3r5ZURMu4FuVe5bLXABPQ?=
 =?us-ascii?Q?EtgS0Mnq8z2s9a/2VWh6UonN0i0Unet9z3nMkH+OcX7vDlNIIQCooxiwpOQK?=
 =?us-ascii?Q?RVKkSCi3p7YAqqx1Mjna+QAFiu4w+/IJ5BMk0Ze8gPzj8NDdhGSsfdUvciOy?=
 =?us-ascii?Q?DjO7Ob2amhLtF1AO90/Sx4I53Cp9ToEugqa1Qj2v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10240a6a-9a2a-4184-58d3-08dcb633d8ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:21:37.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQki0XKjC9bSuOeu4a1cMbAevIM1zxn3pd7XSBfon31WzsUn26yf+mDs3S0uGH4n8jottJeBt7lFAkpcnBEOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9465
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
Change from v1 to v2
- fixed typo lx2046a with lx2160a
---
 .../devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
index 2a456c8af992e..2958ef45b3e9b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
@@ -23,6 +23,9 @@ properties:
           - fsl,ls1028a-scfg
           - fsl,ls1043a-scfg
           - fsl,ls1046a-scfg
+          - fsl,ls1088a-isc
+          - fsl,ls2080a-isc
+          - fsl,lx2160a-isc
       - const: syscon
 
   reg:
-- 
2.34.1

