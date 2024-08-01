Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A8944F23
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 17:25:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZfGiPPlo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZXpl3tX6z3dSx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 01:25:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZfGiPPlo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZXp33BJjz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 01:24:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxaFXeCLSvfPqLneDVXHtPxWYxTEfmrhrJNgQLwGtlKwWKbTDONUsP/CY/CLnsLpChNfdggJRlc/2XyvC5WYtQVM/1WyNl2H55U2KMrdnAYM7zNQKRtfSuxeGpuY9WcgZ0YJOLO8js4HU6owU9tFWIQiOsT+9116AcijkHkXlI0Rc1EUOimXo2TyPgdOVmPgP1c3ouHwM0OvMKpwmunXXYBq/hSAM2xDRWsyW/h8+y4+CK/oecq+6XOQpxcw/cBtxdfiQ3nhiTpcU/X5MOcCcIYdOvyCznDUiTevPAsKW+BS6vK59zuwF8mCHPJa4WoGvknT56+f6D/6ypkE31ON+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxSw/LMNYTJp7J+3fXT7WuX2fWrAtDH4i3kKWBtS5rs=;
 b=w2IwzlDQ9fGtzltyZs8385kdCJYqa2C+OdR8oJM17dQ94/oH25Kb2d302sRE4ZEvibUCdvLgt35GyGWehB1ryaZQfYSqpPUEeL8b8TZW7cjHQ1OLA2HIX9HOZs6gziFFcCKYe+KVoh8XU93JTgKRk1+4tW6CoIEHh7rMsh2Rz/WBjwTr+4FVRNhDEoosIiZ4sZnypagLwhRUOOB8yWRbTsfhg8t/PP7DoFPDIEO/+hFlBDAWi8PfHhAohFxi6bkNy98iSAun7nO1OUqUjx9Ddk2JW+icDv+MW483CVhLZeoUAmChQCVBVgJhAefzPHY0iNteYGzyG5bWTZ6TAmJGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxSw/LMNYTJp7J+3fXT7WuX2fWrAtDH4i3kKWBtS5rs=;
 b=ZfGiPPloDTb617MXP8Xn7pEaYGMt6f8+tmxqUUtyO4TEveb/ZqUJEwwqB6cMGvM/pLQ/Zrj85/jn1gjb8rQTJryUuh/9qezXqKQ3VMrRe+7IBBjDvMN1EvUKxqdjefmDzjk2J7gW8tU5jdEgIxvx8hl0caI/cdn1xg1b9gyNNK/3EsU7hGTNHSnZZ5JvHhV9gpyHRyHgG7Ik4dbWGZWPE3m72OzUKCxlVDH8TR3s4j+WfoJlFQCqc7MD60tSUuAT9X6yS690+w7gLdIA+hsFKOB3XbGFJ6MThVnC+0nQbrnSflorEtVjOXgkuAbTusfLQix+j5B5VwlsDc702TTYBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10669.eurprd04.prod.outlook.com (2603:10a6:10:58e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Thu, 1 Aug
 2024 15:24:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 15:24:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Subject: [PATCH v3 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Date: Thu,  1 Aug 2024 11:24:21 -0400
Message-Id: <20240801152421.2501617-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bc1101-63f5-4267-c7af-08dcb23e0eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dml9eWYaa1ZLQsBVia3wlRuqyKttPi3f0KP1W6L97V5skzaG66zsfkIy6Fu7?=
 =?us-ascii?Q?lE4UFI6J6I89Mg1F+hNH48qiJ4u5lYLJlspOV/DOV3sLgPr2afLZF0+XSb/m?=
 =?us-ascii?Q?RJU6wi/Wze2gOByyxqvmfofE7A4M++Jr5qLqAB+HRYlRqneIDg6HGdbrjzw2?=
 =?us-ascii?Q?8kF8BpirHCW0FJCGMiIMniq/gofXPJY3OqxXTUP4iGGLJObFzzYHh2VU4NpH?=
 =?us-ascii?Q?nU7Gggf64ZEG3WFHIsOrWCzPKIazJfdGvun9qaNbZbM+g4lTCCIRuOPUCAnG?=
 =?us-ascii?Q?Y2R+Tv5wuGn0tKEOPEk6hB2GXkTMeepbVlVu5fM1gzK66mjbfDe6XwzRuDVR?=
 =?us-ascii?Q?aKRJ0NWS64RdZ0mw2eAWduV2wrc0+dxqOCFjvqb1Q6ekjeM8LuCc1zsLBmfd?=
 =?us-ascii?Q?GvePjQV5uZR3CvXF4V7EVKuCDlplaHgfmSpnsGGKHGF5NxfJZqZw1Uc6iX74?=
 =?us-ascii?Q?hhCOs6z+OONOLzXsVkA7qqsGfJur4Fv68J3hD1OaImFCU7xWJk0xAx6ujBBj?=
 =?us-ascii?Q?ijF45WxUFboV/0nQTbzjxgK+S5KqqOI88QSZveendOpfvpTsuekoUL4kzC8K?=
 =?us-ascii?Q?lmVE4OZ9SaoWtV3xI9Di7lUR0UFkG8K3XaPUS1cY7YkMcLZoAuiXmoHOWJKz?=
 =?us-ascii?Q?AtLV9G+Hy9oeEmY6CSbifpnRlPIfT5TJpf08MReayCRjwj2P/5rmTe/03HZM?=
 =?us-ascii?Q?33+h2XWM/Wl/+GbtvpaowK4ftAG1/03C3h2Jnacp4o349Jo57G+uEe/x+Lba?=
 =?us-ascii?Q?KmqkO/lJwLRHwy70JJXOzq/tqV8QRP0z95TuqmR3lH9Jf/ZHuzjvOcUA3JdM?=
 =?us-ascii?Q?mxzfKQM+7WBIbKjSBAupoN6j4hWDYeM92FTuRTdCLCP/l+s+vMqXBS9AXHn6?=
 =?us-ascii?Q?1WoUemycF7ks5m8FmNdSpPy3x94fceb3uZQkMrbZn1eX/F1YyBttgwPy08ga?=
 =?us-ascii?Q?MXZWP5KwJbZPJgVGPORodY9Y2NjBj64qpxctPvl455dGzOC7Op2IRrK10KUR?=
 =?us-ascii?Q?UAQ6xuFpGxa7hrsZDsqMFuvNjcUG+aMnsmmMn0yVZZ08Y/lJP2nWHHdnVfkM?=
 =?us-ascii?Q?nlt9/0WXuKlc4SqbBR7pshmNl4//aGDyDxFGNgAVOxwBB6l/+d9nuCRLW+/h?=
 =?us-ascii?Q?voa1LxvVDfgrM/x35xYY9GBbAo0n2R40dArbc8B9thhdLjY5XCiozCOHbKGZ?=
 =?us-ascii?Q?ene2j2jb8Q2HE0iVeR71q8zOezxmIdyw5bNQ5vxON1rZ9F4o04d4zfZqhdCI?=
 =?us-ascii?Q?40rjNXBmWPykOaVHjtVir83mC3dggaB9cSMhS7QHtO9fR0CK5RgbLFZC48fz?=
 =?us-ascii?Q?wXpK8s6tDuB+DaroWFZxz9V5mQNWwfnrjgWHBCxvZ84jMkV+rtr1l8Z/hS2q?=
 =?us-ascii?Q?6feRY/Y=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IvLWDnZaDal+JgSSMDSxEj0T80x1A3MzMtUOh1Rex1QLUyLD6+tt82vf+BiX?=
 =?us-ascii?Q?UrKSQL6IDntBM/l0Lqcbf/AXfft6K6HUDG2hUKRUWXO47WJANdIoNiG8rOue?=
 =?us-ascii?Q?sKqoVSQkdNy3NKA4tPpLVNcr9d2T0QjcCd9v4AT8FrZeFctqV/AXztIN4DH7?=
 =?us-ascii?Q?WIDDG3p7XLTozK773Fuh7Iemb8Kyd18CMHqXL3PdD3tC+CozZaTRMTh2G3zX?=
 =?us-ascii?Q?nhIOsVCHEVCYx9dBh+634SYI1g8AfxZinSpK4CZ3EO3Mh8XMm86+N543syrM?=
 =?us-ascii?Q?xvDy6YJgBqb5W7wNxhh28H0D62fXimEeuLhOupFihVePpE62Uj43lY/nYj3S?=
 =?us-ascii?Q?LuIvN+lvpSlWboqzyaNktlpYp5Xf1FS91gxWr2vUggXVwD3/yJVvRfV3tBzd?=
 =?us-ascii?Q?+Om6zMUZVfMpFRFoIr9VMDWgql2pZV9lY3Fbko0w6KFbTMxZIileiZHLGOsk?=
 =?us-ascii?Q?7DDla1m9WL/mg2zFGC+GHkBEUAwnosaAYHSQuikDzONfrdOB8PHmRpcnVPh3?=
 =?us-ascii?Q?sfHOD7d2NV2em/TXgdS3qWGTtCXDFyxGLuWAIjH/ANKGFDvnUyabNwPL3JXW?=
 =?us-ascii?Q?+5NeOySaDkLtTOxqbDIQ+94Ct11YU5xogzDkeib1t9RjDAN+eH7+7mLF5uBk?=
 =?us-ascii?Q?jGb73jQU89bN7zS2Hs4UqPYg9LsEDAoyfHqiTHfZ2x7MT4nM5UDziOagWsOi?=
 =?us-ascii?Q?5zJJaon3/HrBj0812cuKaE3RPm9Dt3oEehH38wRkcbMi11trdTjIN3Il/cP7?=
 =?us-ascii?Q?qP+YkwiSfUmNsAmUVAIxvJu61Q+hfOtgKuIR6O4dVCHxnsCHfTgtZ1Lr37dP?=
 =?us-ascii?Q?0ZdWdV+q2Z5Ks6rK9IzGFIpUbG+JM2+qa05gbakrD5D+gfB0WGI4e4mU5JC2?=
 =?us-ascii?Q?Nqm2ch45ErrtyZ/iyZEgKs9CPeddecWOCCnIljhm0cxJnwcaAZSkg20/1o+g?=
 =?us-ascii?Q?2Yc0Byyrsp+KWxCjOq5H9+kvwCbqSTVAWw5gHZlL0rIC3Vc1d1CoY4Rcw3XH?=
 =?us-ascii?Q?lmCCdmiojuy6UWpBP1rMZKKwmR577fN5hNxSzaRmrIUuXKGCrn4AoSMgCcTZ?=
 =?us-ascii?Q?TudvYf7V0Yptt43F1LlgvHzPyL219hxJFXX0V9erT7Nzs9dJbZ3KVyYzNu6m?=
 =?us-ascii?Q?LrLWCmLDVP+CA8fVXRRwVj4a2sMfezUXZwBskssGqbZlO3TSZrb/4fOTzrcV?=
 =?us-ascii?Q?A27SK+jCwDew7v7NAhbtN3rQMW/VvZSeernMsceVE1qEoDdgsIITjXnLhNEv?=
 =?us-ascii?Q?L1H4Hdw6KeAmQVbkadEh2a6ovXkXgImujURpAqQAe9wQbo5gob9+8fUTIGhV?=
 =?us-ascii?Q?/JxtEm7BGpMuwvUJqHnb/7CxSCTIt2stlwO271bLokBl1pP3n4RN7Xt8SZWw?=
 =?us-ascii?Q?oCpEZqovT+QpsOjG4S2IioBH6MlWGayfOzqoBJEmSKxRREQxAAQXdic8z6dd?=
 =?us-ascii?Q?Hl4mqEPoq8iKZ4FgXyokYfLecFJ1RsIgx/tdLFnW8JAVTAmfY9EJqsxgjVLz?=
 =?us-ascii?Q?RGg8dUr0GqRK3NTI6WM8tWJGa8rKNY2xG8XB36MUEnvKrkVuFrif2trXauW1?=
 =?us-ascii?Q?lUYEQLjB8smQLZfN40vC6gbJ00Bt0ItCLndP3da1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bc1101-63f5-4267-c7af-08dcb23e0eb2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 15:24:38.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raP0H5rhIeOveRBhmEsmEheTdwoKjpnjkY+ra9ZMPtujwp8wl++DejlZFfb7AtiefeE1+2T3viPV4Us4f+fVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10669
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
Chagne from v2 to v3
- fallback use const
- order as fallback compatible string
- remove minItems for compatible string
- Fix typo 1045a
Change from v1 to v2
- add missed compatible string
- Remove compatible string map table
- use oneof Item to align compatible string map table
---
 .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
 .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 93 +++++++++++++++++++
 .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 --------------
 3 files changed, 94 insertions(+), 70 deletions(-)
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
index 0000000000000..fa8491c8c2088
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -0,0 +1,93 @@
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
+              - fsl,p2041-rcpm
+              - fsl,p3041-rcpm
+              - fsl,p4080-rcpm
+              - fsl,p5020-rcpm
+              - fsl,p5040-rcpm
+          - const: fsl,qoriq-rcpm-1.0
+      - items:
+          - enum:
+              - fsl,b4420-rcpm
+              - fsl,b4860-rcpm
+              - fsl,t4240-rcpm
+          - const: fsl,qoriq-rcpm-2.0
+      - items:
+          - enum:
+              - fsl,t1040-rcpm
+          - const: fsl,qoriq-rcpm-2.1
+      - items:
+          - enum:
+              - fsl,ls1012a-rcpm
+              - fsl,ls1021a-rcpm
+              - fsl,ls1028a-rcpm
+              - fsl,ls1043a-rcpm
+              - fsl,ls1046a-rcpm
+          - const: fsl,qoriq-rcpm-2.1+
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

