Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777394605B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 17:23:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AV0qS6nF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb8k63Jssz3dXX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 01:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AV0qS6nF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb8jQ5Mg2z3cjX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 01:23:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Va7QfQsAxe5w2p0m4TZKxUacmHIRwk0YEvEBEhxVcr+Cj7hvQke7uGaPvJJo2ciz6l9CbMy1zsLHMbml28wvHY2jlv9HXTWqr+uoIQokJC9WrAP8jjqsUbWmsMnDn09f7oy9ZKdckS3MsKsYnP+5xaaSAKw6SeYgSp9ICiVqrX3DjesgqADCX0Wkd1ReO+l3MDUcpg5687sY0jI/CMTW1dnAffrcKY4qA0nibqOEnOR8MkZLWGhc+4CscGakzMwkZ5RxxrB0wIFvPBCrwbUBwGs3sPEBrndVhreCYy5RJAJ9ZeCTXIKFDo+esHsv9vQBu8Vb6EhuBelIkWEF+zupZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqJM5imcK/+Vsdx34W/kXMTFExYePk/AN8ErtGZV5/M=;
 b=IoUZFenjGUYRjCrjKPi/9l9Adu/kBXdnvQVlvpyRZjN3lEntuXVDKF9DiNa7UUA4uYFp9xHB7xBn24o6WEAFeAbcGdOWJ2zff21RCYQUaE54wT5Nwo0cwV6JGL0o+PqHxf09D5O3zebcH2+n+MI6tODrjIR2KpQ2XvU2lHxsOLpbXImY8oQIuZllyvYA4tui4tOcjBJv2CiO4p5mak9YnuuefIifUnr/GePDAoV3qp7VGyx5I3HzBHnflfaPea3rHS05OPoxtqEvfbTtJkLkR8zkzf/5Penw6iC5TFirdyYD0N7r1rVpe8BsL8eeQgb8toBr0NxNXnJ0niyqZn+q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqJM5imcK/+Vsdx34W/kXMTFExYePk/AN8ErtGZV5/M=;
 b=AV0qS6nFbY+DzD0Rt/e6bHkWyGjHQ0jiMbZ1zQ7AJcc5I+dEbJfviWxfASjs/777qnYlGMsGjRWJDmgOQuRIkwzLjg7BKEd2wBtN3Gi9FtZtu+zq7kneANdxDrUYZAuEih3djN44nsoArXTfBRzgJiGUorqsbgEaqXoRMzUKJLFyz7X1ajna0qYHYBMBRP8GkJ/Wo6KaQHPoY2bPyE8yeieaVEMAERGyjvmkgCwMytvFD72mO490qTd9qdK/7jaxGCOzeyfC8Bze4vbyD7kz1IVlVuGKDhnt8w/xAyBa1hy7tPA/CEeqpG3+8N5Z4tqP0k6rPcuVYR3zaIq9jDANgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10710.eurprd04.prod.outlook.com (2603:10a6:800:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 15:22:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 15:22:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Subject: [PATCH v4 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Date: Fri,  2 Aug 2024 11:22:19 -0400
Message-Id: <20240802152219.2740137-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10710:EE_
X-MS-Office365-Filtering-Correlation-Id: 16db1ffe-d3fa-4c3d-5f48-08dcb306f0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?7dOYQbRnKO7kwk9OnCklHERqdlZnn+AnA26Sxa1HnJEEiS7pg5rJRpEsTEGb?=
 =?us-ascii?Q?fXu2NTFsAjJC4dgLcm3nS17Op9AZrtOL5H0zhzvgC2UTRmkKxymOUTR1+oTx?=
 =?us-ascii?Q?J3DOl3cwKXSrAVsIn7fegWBoevs3cdRp7D8AEclN9jPN48ZdwFld35L0EhXG?=
 =?us-ascii?Q?rTm1/WxMU6D8WGqZpKhQXoRua4r5VmRYSY7+CKcUaV0Mvlu3JlAjaiI4/eIW?=
 =?us-ascii?Q?1/TazCU+/6XdpqHNfzLHyjM62p2yV31AySwui7P1naKn3FwFZkHVMawyrZH1?=
 =?us-ascii?Q?2mDK+W77UYPZx6jAySWchV/25DYk6QNLHPJv13tx2GPxQUrD68jkteyVPl6N?=
 =?us-ascii?Q?QUbcfsaoJNNgR4haFfwZz5NBO+ZAkuWPvK4UvvpbR1biiKRY6uAEsQXGJn2r?=
 =?us-ascii?Q?n8tGkuGQ15oBdFym7+kir9bacdfgKDMt5aenTueCFe4V2TgNMZ09THqnmCKC?=
 =?us-ascii?Q?stYsE06R7AGswavc1HvsmBHrdfQre3Lv7pATP3O7YUAkjYEk6h+xkRUGGjWK?=
 =?us-ascii?Q?KC1dECC6tCLRHLCiK0BBugm3jIFxK+gsJkkdFvZYVlsGGexKVS8NC0WWloBC?=
 =?us-ascii?Q?oHL4kwVM8YyNuno9YtFhvY31zZq18R62yFzKdcLTZGbegV762KT8KaRlK4ED?=
 =?us-ascii?Q?qmeuGcGglUwfTjzsgDn/m8EbYfAq4l9dVLzQMSZiPwtRgvbMwN6L73Bz5e2z?=
 =?us-ascii?Q?XfuPHC+mIPv+4zn3VDC6dKclHUQmIRc3gLaFcFuVbSm76m4FGMYlnmdCFRaB?=
 =?us-ascii?Q?r9PFYnZ6OTfIWxVGeU6sDvNTR9Efm9zJyxvvOVvvnTJZ0suZw45zMZwkRvqN?=
 =?us-ascii?Q?X1J8PJH11NMXnmQgpq0ogIzoTacMT2GN7+fh+3TD7z4aqQozepZTApW+j3Ql?=
 =?us-ascii?Q?sI0R9ausjLFUip39RLda1bLPU6rYpXP+9BKqyRyAbu/NPK2awU3K+fTFCJ0/?=
 =?us-ascii?Q?k05MAwJ+N/UTm0J1VRIId2W8xI/uiZAYGSXsmGA2z+6WaPofJAb4EmLlAXOb?=
 =?us-ascii?Q?Ob52TWelaQfEWqSvOTffs4GulsUM6/ECerMmxcy/apINZAO08sCr1EkGWQe/?=
 =?us-ascii?Q?K2cWXMB8s9gLWQc/o1mewMGGQrwo8+YvGtL8dIYnYDyPsxQTn2x/4LxMQBJj?=
 =?us-ascii?Q?bth/u8cl+j3NwK3loLF2tCF+t2doh5lONXvR4g/7E25e212QnnPlaS17gBgT?=
 =?us-ascii?Q?QjLyIVurYSAjp0mC66WiwUWFZrlydaBy1ap7jJkqdBwL6w8o8bwWXFtoUee2?=
 =?us-ascii?Q?zrAIbldiRN9KYTQk/Wmf+wln1jMa1DIzmIc3xRPWaKeGY9RR229nTvGMpJDy?=
 =?us-ascii?Q?QNz3ag1loJ7ouhlYk8KJqa7mcbZiGF8o0bJEjllrpHW3ew4atXI4et4e1QCG?=
 =?us-ascii?Q?GwNYhwI=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6gwyzcWrVrPQP3VWQZ/ghWchUJgDp7F6tHp3KE30lA32nMzDG6G33+GkYXh0?=
 =?us-ascii?Q?h3dzIVAaKRFNzfnXU4vz/gxmncLZ5oyOmO0VI8m3iIPiyrUqOVh7UB/Og9PU?=
 =?us-ascii?Q?GKuC+fsYJmK3e27WoPHFNDwdiCbE1xvWXCxNkxDwSL9715hW2LXlrAerr1Ue?=
 =?us-ascii?Q?6aYm+BG46Z+px2FpRQEmCMbY+qRN0tyuKaH9KNMDCJzMIMmCi7uZH15Uqra8?=
 =?us-ascii?Q?lPNo8HY3wPEZ0ika6X0ArEc+iYvttUi5soApTvUb+D4UmW6XPtTw+oKlkMut?=
 =?us-ascii?Q?d9JXEe3HQA1LgqbBx3xYQRAZS+qSKD0+wyqqh5sx2BXL+PSL6az9238z7D4a?=
 =?us-ascii?Q?oBHeBqdRLpE88eK8yw39lrJ9zw9pdnfs6hNb+RZAhlb48wTWDxyKQTWO6bJ1?=
 =?us-ascii?Q?9OZbcwnAGlRoVDA87L5gBhVKnOIffld2qqkjgru636pbOnIlQ+Pd/e1PkG61?=
 =?us-ascii?Q?ZVlObmktyq6ulfTBTLRyiINFv3oZAJfnYvF8aSk4GLpRjJFEu0m88w8mNRCm?=
 =?us-ascii?Q?qBKEM9+AI8ksEhdENN7fdyJH+brWX+/oznY9K0Q5xq620TmlMw4JLsz/m16c?=
 =?us-ascii?Q?m7C/5OD1X/m9NsE2OiEgkdDi8JH1lzPkpIV/rmjo6wXztlrOgBXiVaMzV/2X?=
 =?us-ascii?Q?pVBiXOfwb/Bj7VLtiHtD2HRIaKzbj+frMPBSKMtPjDj/YLEjCdb3P6j+bgCO?=
 =?us-ascii?Q?hNJA2H/9e27VBKAyVmLFcxAmg23AouL5a4HuhRhVmRDnXaZSeTSWTEPBeJBF?=
 =?us-ascii?Q?2c0E9pgufsoKDn/hlPL32vELJdz1hbzfvDmzDPVwJjd7yvze2/aEofd40kCk?=
 =?us-ascii?Q?McqYWeV3oyO7aEK3cmAkJWCuYsHLwMNvVQNdzSPIlum5QUWW9PjYnUe6r3AI?=
 =?us-ascii?Q?IoRqOR77qhIEu5f+mGE1+sR29H9Tb2skxwkOJDE6xz6tBLJw2ocvh4ocVbmz?=
 =?us-ascii?Q?QNZ1KPz+j2QyZrbX7/O8B2KEsi/WmA+cv9ojrCxzYCw3dYAnuTSc+c8hPe32?=
 =?us-ascii?Q?AcWhsqJDXnrAz02BnSLKAzXNrizR8uyiIytYf9UL1qJvY9ZFY7sDEexwHDm9?=
 =?us-ascii?Q?cVCsEYyP0JFCHC2yQNFc9/XC2qz1SxHCPIlP8HjWDNC8sT4BH+5zsenRbNRQ?=
 =?us-ascii?Q?+Z7yjtK5iVqmakNiYIbiAsff5unLgKfXaW6Nyy86dD9lebX9edv8TnechK4S?=
 =?us-ascii?Q?1aTARgJjfVkPXqcSxi6qqyuZGqHTvRdpagAtxKCtAT1WO/q3X+fod1nx9HlI?=
 =?us-ascii?Q?WETVBTq9dNfXzrJXj7nSrpct+KUg/1RFIN4lQ76w3hCDT9acCFkn0J/9+vy2?=
 =?us-ascii?Q?OVM4z/cSpZnNR+MMghPhaZ+Kiz3zZChcPxoj0jlKz5zTI7kWteEZ1tVft+WP?=
 =?us-ascii?Q?qZCnU6lEHJZONVf2+J2p0qRME6FWcFPu3RwRPOmIx5FudPYBL5S2nJ5x/l1g?=
 =?us-ascii?Q?2zS0X1WAdRnEUpqQrQ75p45tpjivfP4w+6bn9qpvhk6Kg4wW649InY5078oE?=
 =?us-ascii?Q?LhwVkVZzbDY9i7CK0zymIypcRakxM/xABKTRlHtRPjsq1I+Qf8psy2mtcjik?=
 =?us-ascii?Q?T7R7Ktb4J/1dpxnTlGc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16db1ffe-d3fa-4c3d-5f48-08dcb306f0c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:22:37.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMtPDjipJwsA4dZbMR/X5ScwYMjJC5KXwdQhdVfS38ON8hq6qmNykVJEEnYjrRQg63lc3ySXoZz2tHBN6Eph0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10710
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
Change from v3 to v4
- Add missed fsl,ls1088a-rcpm, fsl,ls208xa-rcpm, fsl,lx2160a-rcpm

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
 .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 96 +++++++++++++++++++
 .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 -------------
 3 files changed, 97 insertions(+), 70 deletions(-)
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
index 0000000000000..a7db0aad2b25b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -0,0 +1,96 @@
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
+              - fsl,ls1088a-rcpm
+              - fsl,ls208xa-rcpm
+              - fsl,lx2160a-rcpm
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

