Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B5919858
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 21:39:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Q/pyGdbr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8X8635q8z3cPh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 05:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Q/pyGdbr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8X7N6k5hz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 05:38:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPs/zZFJGC58VqHof9sOEdwlnPj/6UEam0wiqFhxbvlk9pu6uAJqbNygvFpUzZamr0Gg3WA/2OACRoCyTi/3szXVAs+osAqkGB2xw4O4kWIdXfaS8BydMQaXia6TVytfJtXoeFVjzNcck7jcyZLprvYgh5db2+kRCMvdFLrgotgxvVEraOyufFulD2Ayi/bzlj+UAiYI0H6vAmEk0YFxhfq2PFJwlmp6OK8TgKnNXDOtOf+twEjcbyC1t81KAWAxmd2bBSPTUOl394Hs/KMCeJbMhuxURii6v1ZLcgFkmqL85pWRU8HA/8LU7LSAADEvRqzlS5tKobjCji77Gt8PFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFN68IGaoFysME8Evdy+x7LdxHg+Fh2cVWTtUEQ1yDU=;
 b=NFYkTW910ShAIPICXD22Tr9EuXlMmeSZIuNikRria/8zzTFB0fMUFE9SZoD2zQ6wShsYXYbkn+/j1arHewyjkyQ4LGAJ4ESCCsljBgprZdd9xlVQ8OMHCGWuqjTVMrUSoNBYTEG0XBEBsrb+ENGDUMoeKMabKMxVXbzYQxCFr8Thdfw4Fxa9Lfyhftr9IPkbXTuqwDQN4n5rcPLQMShqrx7lFxJu/D01JtimEFgNFaTnNgiBxbdBHGbN51zMjkz/E1F/0ecOUeNBkAcfxstzZnPhdd9i36TGgV7LRCGzyqstRNicDt/VCLbrmPk4SvhCLIbyipzxYe6iR/yQOEW99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFN68IGaoFysME8Evdy+x7LdxHg+Fh2cVWTtUEQ1yDU=;
 b=Q/pyGdbr/f8CkaW5Ct34x2XzgncyGzwFGof5RhYo1kLo/HiLgCu81nWDp7t1bJVBrP6w2pwWtHb0MoO6MsAUOXcPIOD588VCsO+1CiAa1VfgwW3sgvfLunLQdGxK8adYCY5NgrvcxLLX2XVYzEWZ1VhrZ7cNL243zqNFwfO6rV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Wed, 26 Jun
 2024 19:38:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 19:38:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Subject: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert q(b)man-* to yaml format
Date: Wed, 26 Jun 2024 15:37:53 -0400
Message-Id: <20240626193753.2088926-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 19487d05-7f81-4868-c5ab-08dc96178216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|376012|1800799022|52116012|366014|38350700012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?mbrJwh529hg4A34zqjPT2osbR/BFGx9rEBuLaAqjw+B6vf5AF8yg10nFOxYv?=
 =?us-ascii?Q?Hrj8OPMzltcnUc/Tv42khKZ2m1lX8ptzgZf9Nl5IXRUf9Bt3MusU54LnrHUb?=
 =?us-ascii?Q?OGhrz8JYiGQeqsuA/n4ktF7frOTng7wfny425WKK5wLkMvhfMyWr0NewjVgN?=
 =?us-ascii?Q?Pr59lti24VEyl1EtiIftQNqx4p/Ha7WkBeKJArlZpH1m1ftYv1O1lo5zq0sA?=
 =?us-ascii?Q?JWLQRuHoON8boF3/C+JYvbsxTHP7w61yarDwPPdP6fY59MxjPM+7maW3H354?=
 =?us-ascii?Q?HcMvaaHidKCFbaIaovUEpx5OCt8+aeettqP2QkbF4IJpi1Pbb/CXtyYJG1gP?=
 =?us-ascii?Q?HovAhgmmJEO4HRmHZk5PeI10LX8FcTgBMRqJNaLIcJvHWfYBtZezSOEqe1Z/?=
 =?us-ascii?Q?0FbB7AW0FIVqDB8g/Jbuc+kj4/1eialptlVZXbycLSasHkyl3nCsQKW/ltcW?=
 =?us-ascii?Q?OK9ztXQuTmIsQIaYaNormFc4QzHaIboCnT5M9OFBuTLx666N+vYXwjv/j8WY?=
 =?us-ascii?Q?21PRpY6UnEgUj8xVsnbadyEEjhD+m5Lg+fu6pGEpq5CHHR/nt6MZYzvIzcJz?=
 =?us-ascii?Q?+rp5HzkZbalvF1qjRDft1JlYtxOhU1hKB6CZEiRksIdYZkrqzvzCzokvzYSq?=
 =?us-ascii?Q?zeD9HoLOEyJ1paX3lXMQe5sW9PhVevyr4ciRmpGnxFxwEJVB9T5ODuNOSeel?=
 =?us-ascii?Q?c5hve3WOOscNyMdJF5nFQ10aZ0tmlsqKsyUZ0lQ7ZyRD4CACNiEDKe87saHm?=
 =?us-ascii?Q?oPXa5W4aMisKHOf3mHRxXSqoBknG7kFGB8+SGZa4Eut62G8yvEc4sj5SQEh2?=
 =?us-ascii?Q?dJ++9i83WghpqYqDF0FzWpG1R9QStLvGQBGn7vZ0jNe64NB4b3K0pW7I/+3C?=
 =?us-ascii?Q?vPlwjxQaHBYT/jYBThJqEf2oDdEfZSiyuvmIj80CdXvQMT3J3lciHSN19j/R?=
 =?us-ascii?Q?2NN2N/5ElXII2eppqyJOiqAbjNgUhFg8fIXOZoe4xaoWXeETH9cXJgUHqes0?=
 =?us-ascii?Q?3waYTA42B4kgQ9ckO8uBF/+HohIKlC81YltQtnq6ZNNGqHdrgT1We+m1gjrq?=
 =?us-ascii?Q?0efdXfq4tcknWy/clz9+yjv37JDMWxuFPOGXphBsOjK9WcqFfM/PBDgdw3oV?=
 =?us-ascii?Q?79yj8KeqxwRqOgbgnm9IRoJ4KsyPnH/LLT2P9VJ0kZY+sHJI6s11k2M+v+4/?=
 =?us-ascii?Q?v4xOo+NESqxA0mqBJ3VCXGwPuSHt25GCeiWOx9dtsq/rtrxBWrYT08UsRTq2?=
 =?us-ascii?Q?O4Do8CImjxdzCVo+mS3ggFKuFBAFc08H+kPhiP+LWvdxaKU/sTOcpPgFTZAE?=
 =?us-ascii?Q?JfKYomMCkmg/Vvws4hokUzIz?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(376012)(1800799022)(52116012)(366014)(38350700012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wWVAbTQfdua3Nh04zFplbQQYxzqX2Iyzx+dlGX4HLod/evdqaQv2YqnwVSCm?=
 =?us-ascii?Q?5G0JvjkJUx16YWbFAgZmqTGbjihZs1gjXDSglLc6jyQK9c3O+FOpTnwpzpvA?=
 =?us-ascii?Q?tkjzpMwjuACqZMD+ZnP8Z/NIuWSWmeA/Xxlk3OHYI7mhYL017v3ULXOqLNxE?=
 =?us-ascii?Q?YCQ7gAs6CQVbmZoVeWGXQ6e+/iGGR/ouw92b25B0g6nU7hUg77bLruoK86bT?=
 =?us-ascii?Q?JwM7TJfBzwtHjwf4Yb6yDKucG7ts89nJFH0fnP7d1sxPe7zw3UL13SMJIPwn?=
 =?us-ascii?Q?TT2GTGk4nA6s1i+uUfwxMDT/Hlx+r6vOWMY2SQqlkjn07zhR9C+UGcf7JrxW?=
 =?us-ascii?Q?i1CS/Mw+zIUKf0AMukvk7zdxSgLKQzcsxREZi+XqZfaj6ampfK30hm2GXKWi?=
 =?us-ascii?Q?LHsnxdjIvvUemKppnPF/dT87IoU8D8b6Xw26V/iB9pxjpbzEAwaTCgUIhiIQ?=
 =?us-ascii?Q?5ct6uqwxePATxDCp0sxC1PzFn6BOCSYcKiSUTSbTuI1QfgS5W6K3rVHIOKH9?=
 =?us-ascii?Q?RPQplzlJVe3z5QTq/kda60uQKvHB+2ltIw7uCBMAxsxyhm0ED2UWAjRsfZ40?=
 =?us-ascii?Q?YJYIY9eDab/DfITRcQNC/jZL2vu1YkN3RewvnCyUtYUte0rI+gwHJo5c6X5W?=
 =?us-ascii?Q?0alqtox7yQsWSJVy0C7A33dVixvtyFdUpSfvpxbIYWmDs544a4LS4wNG7oUw?=
 =?us-ascii?Q?kB4640qGpyfyQoPLnO02ZE9JZAFqp7dNFp+kuEdg5kWRoqzPPtNyggSELqwb?=
 =?us-ascii?Q?FifUNhX5Q+VOTAdCv9IBoT/MR011afYjMLVQYj6IwskLLf78n3gseuFIJ1UX?=
 =?us-ascii?Q?tXOkkU6Yl54t8H7I3jflUf5Q7haTsNc2JMQUBpr9HsLBoMVl35NNgvFq7irk?=
 =?us-ascii?Q?a9galdRp05KoBqrOLB8cB9vNHhFkidgW5bq71ybzbURXowwG/+S+qFXAR7gw?=
 =?us-ascii?Q?73e/qF/wF7zJDeXao49YpHOWZGN0nuAma88We8kW3MssyDrwEtH9qawkQkik?=
 =?us-ascii?Q?LXtmlHmPHiPcoeRZ5cmPqYRLy3SadlOyQOIVJzGJgRG8Z1KAo61zoH0widvR?=
 =?us-ascii?Q?/4O8U17UuaT2zLKad2hWvV1k1D4PbDIsLhrVeqMz3SS0/K3/lRMYbCJDfCQx?=
 =?us-ascii?Q?sY5+keEHhnE1kT08fnB/7XPp9U+TJMAMfj4InQEAkdm93M1SE4zY+kziweJy?=
 =?us-ascii?Q?W53Pi5eAEd/aivyYdWHc+tkJAQ1CHNhWAurMNAr0/6LIFH6r10ACFsyrTQyw?=
 =?us-ascii?Q?+3b63tbX8N/l4MV4q1eCviUhlZ5JBQu8aKRlnwKHE0FBc1l1aZMHO1XXDtIs?=
 =?us-ascii?Q?yfTqavi7yexpNEyDe+Wgs9SPPnKzzrn4lzNJ5tG2iasUzy+JoH3vXVHQr7zV?=
 =?us-ascii?Q?l3BAfTB3nQF0xtkZ1xbzmfDUd0l6Mox81jz88sSU1rgeeauNoNHGpShx36IQ?=
 =?us-ascii?Q?LdyhY1R2YrjtfBMdn8kWoAyZSVU+QVdZF7UrmkHnvOi/oLbiyXy3t7KKB+DF?=
 =?us-ascii?Q?cahLdt5XvVG/QgUUP0FVQw5riqkNTBrZKdDaIImJ68meoSqZdE7ptU9U//yK?=
 =?us-ascii?Q?/E9Am/wIfSI8RHQCe6yPfB6Cev3NAfUoS6XGq73o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19487d05-7f81-4868-c5ab-08dc96178216
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 19:38:09.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv9wIjTzKkO2rz4KGUFZYVV2kTg+xj+Rn02d9pOf6AoIk/h+3tmta9l9rwgfHRlQHEwb66ND5fvekipFytklwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8505
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert qman, bman, qman-portals, bman-portals to yaml format.

Additional Change for fsl,q(b)man-portal:
- Only keep one example.
- Add fsl,qman-channel-id property.
- Use interrupt type macro.
- Remove top level qman-portals@ff4200000 at example.

Additional change for fsl,q(b)man:
- Fixed example error.
- Remove redundent part, only keep fsl,qman node.
- Change memory-regions to memory-region.
- fsl,q(b)man-portals is not required property

Additional change for fsl,qman-fqd.yaml:
- Fixed example error.
- Only keep one example.
- Ref to reserve-memory.yaml
- Merge fsl,bman reserver memory part

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- fix typo chang
- fix typo porta
- Add | for reg description
- wrap to 80 for reg descritption
- memory-region set maxItems: 2
- fix regex parttern
- drop  See clock-bindings.txt
- "see reserved-memory.yaml" change to
"see reserved-memory/reserved-memory.yaml in dtschema project"

- A strange thing in fsl,qman-fqd.yaml, if example compatible string
change to fsl,qman-fqd, dt_binding_check report below error.
	qman-fqd: False schema does not allow {'compatible': ['fsl,qman-fqd'], 'size': [[4194304]], 'alignment': [[4194304]], 'no-map': True, '$nodename': ['qman-fqd']}

but I replace "fsl,qman-fqd" with "abc", it pass check.
---
 .../bindings/soc/fsl/bman-portals.txt         |  56 ------
 .../devicetree/bindings/soc/fsl/bman.txt      | 137 -------------
 .../bindings/soc/fsl/fsl,bman-portal.yaml     |  52 +++++
 .../devicetree/bindings/soc/fsl/fsl,bman.yaml |  83 ++++++++
 .../bindings/soc/fsl/fsl,qman-fqd.yaml        |  69 +++++++
 .../bindings/soc/fsl/fsl,qman-portal.yaml     | 110 +++++++++++
 .../devicetree/bindings/soc/fsl/fsl,qman.yaml |  93 +++++++++
 .../bindings/soc/fsl/qman-portals.txt         | 134 -------------
 .../devicetree/bindings/soc/fsl/qman.txt      | 187 ------------------
 9 files changed, 407 insertions(+), 514 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman.txt

diff --git a/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
deleted file mode 100644
index 2a00e14e11e02..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-QorIQ DPAA Buffer Manager Portals Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- BMan Portal
-	- Example
-
-BMan Portal Node
-
-Portals are memory mapped interfaces to BMan that allow low-latency, lock-less
-interaction by software running on processor cores, accelerators and network
-interfaces with the BMan
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,bman-portal-<hardware revision>"
-			May include "fsl,<SoC>-bman-portal" or "fsl,bman-portal"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Two regions. The first is the cache-enabled region of
-			the portal. The second is the cache-inhibited region of
-			the portal
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property
-
-EXAMPLE
-
-The example below shows a (P4080) BMan portals container/bus node with two portals
-
-	bman-portals@ff4000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges = <0 0xf 0xf4000000 0x200000>;
-
-		bman-portal@0 {
-			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
-			reg = <0x0 0x4000>, <0x100000 0x1000>;
-			interrupts = <105 2 0 0>;
-		};
-		bman-portal@4000 {
-			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
-			reg = <0x4000 0x4000>, <0x101000 0x1000>;
-			interrupts = <107 2 0 0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/bman.txt b/Documentation/devicetree/bindings/soc/fsl/bman.txt
deleted file mode 100644
index 48eed140765b0..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/bman.txt
+++ /dev/null
@@ -1,137 +0,0 @@
-QorIQ DPAA Buffer Manager Device Tree Bindings
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- BMan Node
-	- BMan Private Memory Node
-	- Example
-
-BMan Node
-
-The Buffer Manager is part of the Data-Path Acceleration Architecture (DPAA).
-BMan supports hardware allocation and deallocation of buffers belonging to pools
-originally created by software with configurable depletion thresholds. This
-binding covers the CCSR space programming model
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,bman"
-			May include "fsl,<SoC>-bman"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Registers region within the CCSR address space
-
-The BMan revision information is located in the BMAN_IP_REV_1/2 registers which
-are located at offsets 0xbf8 and 0xbfc
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property. The error interrupt
-
-- fsl,bman-portals
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	Phandle to this BMan instance's portals
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
-to the respective BMan instance
-
-- fsl,bman
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Description:	List of phandle and DCP index pairs, to the BMan instance
-			to which this device is connected via the DCP
-
-BMan Private Memory Node
-
-BMan requires a contiguous range of physical memory used for the backing store
-for BMan Free Buffer Proxy Records (FBPR). This memory is reserved/allocated as
-a node under the /reserved-memory node.
-
-The BMan FBPR memory node must be named "bman-fbpr"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,bman-fbpr"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The following constraints are relevant to the FBPR private memory:
-	- The size must be 2^(size + 1), with size = 11..33. That is 4 KiB to
-	  16 GiB
-	- The alignment must be a muliptle of the memory size
-
-The size of the FBPR must be chosen by observing the hardware features configured
-via the Reset Configuration Word (RCW) and that are relevant to a specific board
-(e.g. number of MAC(s) pinned-out, number of offline/host command FMan ports,
-etc.). The size configured in the DT must reflect the hardware capabilities and
-not the specific needs of an application
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-EXAMPLE
-
-The example below shows a BMan FBPR dynamic allocation memory node
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		bman_fbpr: bman-fbpr {
-			compatible = "shared-mem-pool";
-			size = <0 0x1000000>;
-			alignment = <0 0x1000000>;
-			no-map;
-		};
-	};
-
-The example below shows a (P4080) BMan CCSR-space node
-
-	bportals: bman-portals@ff4000000 {
-		...
-	};
-
-	crypto@300000 {
-		...
-		fsl,bman = <&bman, 2>;
-		...
-	};
-
-	bman: bman@31a000 {
-		compatible = "fsl,bman";
-		reg = <0x31a000 0x1000>;
-		interrupts = <16 2 1 2>;
-		fsl,liodn = <0x17>;
-		fsl,bman-portals = <&bportals>;
-		memory-region = <&bman_fbpr>;
-	};
-
-	fman@400000 {
-		...
-		fsl,bman = <&bman, 0>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
new file mode 100644
index 0000000000000..8dce75bebff9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,bman-portal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager Portals
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  QorIQ DPAA Buffer Manager Portal
+
+  Portals are memory mapped interfaces to BMan that allow low-latency, lock-less
+  interaction by software running on processor cores, accelerators and network
+  interfaces with the BMan
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,bman-portal
+      - items:
+          - enum:
+              - fsl,bman-portal-1.0.0
+              - fsl,ls1043a-bmap-portal
+              - fsl,ls1046a-bmap-portal
+          - const: fsl,bman-portal
+  reg:
+    items:
+      - description: the cache-enabled region of the portal
+      - description: the cache-inhibited region of the portal
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bman-portal@0 {
+        compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
+        reg = <0x0 0x4000>, <0x100000 0x1000>;
+        interrupts = <105 IRQ_TYPE_EDGE_FALLING 0 0>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
new file mode 100644
index 0000000000000..e6f468264b8d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,bman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Buffer Manager
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Buffer Manager is part of the Data-Path Acceleration Architecture (DPAA).
+  BMan supports hardware allocation and deallocation of buffers belonging to
+  pools originally created by software with configurable depletion thresholds.
+  This binding covers the CCSR space programming model
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,bman
+      - items:
+          - enum:
+              - fsl,ls1043a-bman
+              - fsl,ls1046a-bman
+          - const: fsl,bman
+
+  reg:
+    items:
+      - description: |
+          Registers region within the CCSR address space
+
+          The BMan revision information is located in the BMAN_IP_REV_1/2
+          registers which are located at offsets 0xbf8 and 0xbfc
+
+  interrupts:
+    items:
+      - description: The error interrupt
+
+  memory-region:
+    minItems: 1
+    maxItems: 2
+    description:
+      List of phandles referencing the BMan private memory
+      nodes (described below). The bman-fqd node must be
+      first followed by bman-pfdr node. Only used on ARM
+
+      Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
+      to the respective BMan instance
+
+  fsl,bman-portals:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: ref fsl,bman-port.yaml
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      See pamu.txt, PAMU property used for static LIODN assignment
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bman@31a000 {
+        compatible = "fsl,bman";
+        reg = <0x31a000 0x1000>;
+        interrupts = <16 IRQ_TYPE_EDGE_FALLING 1 2>;
+        fsl,liodn = <0x17>;
+        fsl,bman-portals = <&bportals>;
+        memory-region = <&bman_fbpr>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
new file mode 100644
index 0000000000000..de0b4ae740ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QMan Private Memory Nodes
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  QMan requires two contiguous range of physical memory used for the backing store
+  for QMan Frame Queue Descriptor (FQD) and Packed Frame Descriptor Record (PFDR).
+  This memory is reserved/allocated as a node under the /reserved-memory node.
+
+  BMan requires a contiguous range of physical memory used for the backing store
+  for BMan Free Buffer Proxy Records (FBPR). This memory is reserved/allocated as
+  a node under the /reserved-memory node.
+
+  The QMan FQD memory node must be named "qman-fqd"
+  The QMan PFDR memory node must be named "qman-pfdr"
+  The BMan FBPR memory node must be named "bman-fbpr"
+
+  The following constraints are relevant to the FQD and PFDR private memory:
+    - The size must be 2^(size + 1), with size = 11..29. That is 4 KiB to
+      1 GiB
+    - The alignment must be a muliptle of the memory size
+
+  The size of the FQD and PFDP must be chosen by observing the hardware features
+  configured via the Reset Configuration Word (RCW) and that are relevant to a
+  specific board (e.g. number of MAC(s) pinned-out, number of offline/host command
+  FMan ports, etc.). The size configured in the DT must reflect the hardware
+  capabilities and not the specific needs of an application
+
+  For additional details about reserved memory regions see
+  reserved-memory/reserved-memory.yaml in dtschema project.
+
+properties:
+  $nodename:
+    pattern: '^(qman-fqd|qman-pfdr|bman-fbpr)+$'
+
+  compatible:
+    enum:
+      - fsl,qman-fqd
+      - fsl,qman-pfdr
+      - fsl,bman-fbpr
+
+required:
+  - compatible
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qman-fqd {
+            compatible = "shared-dma-pool";
+            size = <0 0x400000>;
+            alignment = <0 0x400000>;
+            no-map;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
new file mode 100644
index 0000000000000..17016184143f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman-portal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager Portals
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Portals are memory mapped interfaces to QMan that allow low-latency, lock-less
+  interaction by software running on processor cores, accelerators and network
+  interfaces with the QMan
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,qman-portal
+      - items:
+          - enum:
+              - fsl,ls1043-qman-portal
+              - fsl,ls1046-qman-portal
+              - fsl,qman-portal-1.2.0
+          - const: fsl,qman-portal
+
+  reg:
+    items:
+      - description: the cache-enabled region of the portal
+      - description: the cache-inhibited region of the portal
+
+  interrupts:
+    maxItems: 1
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: See pamu.txt. Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
+      (FLIODN)
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: See pamu.txt.
+
+  fsl,qman-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: qman channel id.
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The hardware index of the channel. This can also be
+      determined by dividing any of the channel's 8 work queue
+      IDs by 8
+
+      In addition to these properties the qman-portals should have sub-nodes to
+      represent the HW devices/portals that are connected to the software portal
+      described here
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+patternProperties:
+  '^(fman0|fman1|pme|crypto)+$':
+    type: object
+    properties:
+      fsl,liodn:
+        description: See pamu.txt, PAMU property used for static LIODN assignment
+
+      fsl,iommu-parent:
+        description: See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+      dev-handle:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          The phandle to the particular hardware device that this
+          portal is connected to.
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    qman-portal@0 {
+        compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
+        reg = <0 0x4000>, <0x100000 0x1000>;
+        interrupts = <104 IRQ_TYPE_EDGE_FALLING 0 0>;
+        fsl,liodn = <1 2>;
+        fsl,qman-channel-id = <0>;
+
+        fman0 {
+            fsl,liodn = <0x21>;
+            dev-handle = <&fman0>;
+        };
+
+        fman1 {
+            fsl,liodn = <0xa1>;
+            dev-handle = <&fman1>;
+        };
+
+        crypto {
+            fsl,liodn = <0x41 0x66>;
+            dev-handle = <&crypto>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
new file mode 100644
index 0000000000000..501f06e190c42
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Queue Manager is part of the Data-Path Acceleration Architecture (DPAA). QMan
+  supports queuing and QoS scheduling of frames to CPUs, network interfaces and
+  DPAA logic modules, maintains packet ordering within flows. Besides providing
+  flow-level queuing, is also responsible for congestion management functions such
+  as RED/WRED, congestion notifications and tail discards. This binding covers the
+  CCSR space programming model
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,qman
+      - items:
+          - enum:
+              - fsl,ls1043a-qman
+              - fsl,ls1046a-qman
+          - const: fsl,qman
+  reg:
+    items:
+      - description: |
+          Registers region within the CCSR address space
+
+          The QMan revision information is located in the QMAN_IP_REV_1/2
+          registers which are located at offsets 0xbf8 and 0xbfc
+
+  interrupts:
+    items:
+      - description: The error interrupt
+
+  fsl,qman-portals:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: ref fsl,qman-port.yaml
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      See pamu.txt, PAMU property used for static LIODN assignment
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference input clock. Its frequency is half of the platform clock
+
+  memory-region:
+    maxItems: 2
+    description:
+      List of phandles referencing the QMan private memory nodes (described
+      below). The qman-fqd node must be first followed by qman-pfdr node.
+      Only used on ARM Devices connected to a QMan instance via Direct Connect
+      Portals (DCP) must link to the respective QMan instance.
+
+  fsl,qman:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of phandle and DCP index pairs, to the QMan instance
+      to which this device is connected via the DCP
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    qman: qman@318000 {
+        compatible = "fsl,qman";
+        reg = <0x318000 0x1000>;
+        interrupts = <16 IRQ_TYPE_EDGE_FALLING 1 3>;
+        fsl,liodn = <0x16>;
+        fsl,qman-portals = <&qportals>;
+        memory-region = <&qman_fqd &qman_pfdr>;
+        clocks = <&platform_pll 1>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
deleted file mode 100644
index 5a34f3ab7bea3..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
+++ /dev/null
@@ -1,134 +0,0 @@
-QorIQ DPAA Queue Manager Portals Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- QMan Portal
-	- Example
-
-QMan Portal Node
-
-Portals are memory mapped interfaces to QMan that allow low-latency, lock-less
-interaction by software running on processor cores, accelerators and network
-interfaces with the QMan
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,qman-portal-<hardware revision>"
-			May include "fsl,<SoC>-qman-portal" or "fsl,qman-portal"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Two regions. The first is the cache-enabled region of
-			the portal. The second is the cache-inhibited region of
-			the portal
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
-			(FLIODN)
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-- cell-index
-	Usage:		Required
-	Value type:	<u32>
-	Definition:	The hardware index of the channel. This can also be
-			determined by dividing any of the channel's 8 work queue
-			IDs by 8
-
-In addition to these properties the qman-portals should have sub-nodes to
-represent the HW devices/portals that are connected to the software portal
-described here
-
-The currently supported sub-nodes are:
-	* fman0
-	* fman1
-	* pme
-	* crypto
-
-These subnodes should have the following properties:
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-- dev-handle
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	The phandle to the particular hardware device that this
-			portal is connected to.
-
-EXAMPLE
-
-The example below shows a (P4080) QMan portals container/bus node with two portals
-
-	qman-portals@ff4200000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges = <0 0xf 0xf4200000 0x200000>;
-
-		qman-portal@0 {
-			compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
-			reg = <0 0x4000>, <0x100000 0x1000>;
-			interrupts = <104 2 0 0>;
-			fsl,liodn = <1 2>;
-			fsl,qman-channel-id = <0>;
-
-			fman0 {
-				fsl,liodn = <0x21>;
-				dev-handle = <&fman0>;
-			};
-			fman1 {
-				fsl,liodn = <0xa1>;
-				dev-handle = <&fman1>;
-			};
-			crypto {
-				fsl,liodn = <0x41 0x66>;
-				dev-handle = <&crypto>;
-			};
-		};
-		qman-portal@4000 {
-			compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
-			reg = <0x4000 0x4000>, <0x101000 0x1000>;
-			interrupts = <106 2 0 0>;
-			fsl,liodn = <3 4>;
-			cell-index = <1>;
-
-			fman0 {
-				fsl,liodn = <0x22>;
-				dev-handle = <&fman0>;
-			};
-			fman1 {
-				fsl,liodn = <0xa2>;
-				dev-handle = <&fman1>;
-			};
-			crypto {
-				fsl,liodn = <0x42 0x67>;
-				dev-handle = <&crypto>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/qman.txt b/Documentation/devicetree/bindings/soc/fsl/qman.txt
deleted file mode 100644
index ee96afd2af721..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/qman.txt
+++ /dev/null
@@ -1,187 +0,0 @@
-QorIQ DPAA Queue Manager Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- QMan Node
-	- QMan Private Memory Nodes
-	- Example
-
-QMan Node
-
-The Queue Manager is part of the Data-Path Acceleration Architecture (DPAA). QMan
-supports queuing and QoS scheduling of frames to CPUs, network interfaces and
-DPAA logic modules, maintains packet ordering within flows. Besides providing
-flow-level queuing, is also responsible for congestion management functions such
-as RED/WRED, congestion notifications and tail discards. This binding covers the
-CCSR space programming model
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,qman"
-			May include "fsl,<SoC>-qman"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Registers region within the CCSR address space
-
-The QMan revision information is located in the QMAN_IP_REV_1/2 registers which
-are located at offsets 0xbf8 and 0xbfc
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property. The error interrupt
-
-- fsl,qman-portals
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	Phandle to this QMan instance's portals
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-- clocks
-	Usage:		See clock-bindings.txt and qoriq-clock.txt
-	Value type:	<prop-encoded-array>
-	Definition:	Reference input clock. Its frequency is half of the
-			platform clock
-- memory-regions
-	Usage:		Required for ARM
-	Value type:	<phandle array>
-	Definition:	List of phandles referencing the QMan private memory
-			nodes (described below). The qman-fqd node must be
-			first followed by qman-pfdr node. Only used on ARM
-
-Devices connected to a QMan instance via Direct Connect Portals (DCP) must link
-to the respective QMan instance
-
-- fsl,qman
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Description:	List of phandle and DCP index pairs, to the QMan instance
-			to which this device is connected via the DCP
-
-QMan Private Memory Nodes
-
-QMan requires two contiguous range of physical memory used for the backing store
-for QMan Frame Queue Descriptor (FQD) and Packed Frame Descriptor Record (PFDR).
-This memory is reserved/allocated as a node under the /reserved-memory node.
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-The QMan FQD memory node must be named "qman-fqd"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,qman-fqd"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The QMan PFDR memory node must be named "qman-pfdr"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,qman-pfdr"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The following constraints are relevant to the FQD and PFDR private memory:
-	- The size must be 2^(size + 1), with size = 11..29. That is 4 KiB to
-	  1 GiB
-	- The alignment must be a muliptle of the memory size
-
-The size of the FQD and PFDP must be chosen by observing the hardware features
-configured via the Reset Configuration Word (RCW) and that are relevant to a
-specific board (e.g. number of MAC(s) pinned-out, number of offline/host command
-FMan ports, etc.). The size configured in the DT must reflect the hardware
-capabilities and not the specific needs of an application
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-EXAMPLE
-
-The example below shows a QMan FQD and a PFDR dynamic allocation memory nodes
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		qman_fqd: qman-fqd {
-			compatible = "shared-dma-pool";
-			size = <0 0x400000>;
-			alignment = <0 0x400000>;
-			no-map;
-		};
-		qman_pfdr: qman-pfdr {
-			compatible = "shared-dma-pool";
-			size = <0 0x2000000>;
-			alignment = <0 0x2000000>;
-			no-map;
-		};
-	};
-
-The example below shows a (P4080) QMan CCSR-space node
-
-	qportals: qman-portals@ff4200000 {
-		...
-	};
-
-	clockgen: global-utilities@e1000 {
-		...
-		sysclk: sysclk {
-			...
-		};
-		...
-		platform_pll: platform-pll@c00 {
-			#clock-cells = <1>;
-			reg = <0xc00 0x4>;
-			compatible = "fsl,qoriq-platform-pll-1.0";
-			clocks = <&sysclk>;
-			clock-output-names = "platform-pll", "platform-pll-div2";
-		};
-		...
-	};
-
-	crypto@300000 {
-		...
-		fsl,qman = <&qman, 2>;
-		...
-	};
-
-	qman: qman@318000 {
-		compatible = "fsl,qman";
-		reg = <0x318000 0x1000>;
-		interrupts = <16 2 1 3>
-		fsl,liodn = <0x16>;
-		fsl,qman-portals = <&qportals>;
-		memory-region = <&qman_fqd &qman_pfdr>;
-		clocks = <&platform_pll 1>;
-	};
-
-	fman@400000 {
-		...
-		fsl,qman = <&qman, 0>;
-		...
-	};
-- 
2.34.1

