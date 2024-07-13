Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A8930804
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 01:12:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IvPPUG1Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM43w6k9Xz3d8t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 09:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IvPPUG1Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM41M1Nhsz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 09:09:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp5mNLs3Q3RRVgT6APMQI0LqHxW0d7cKUdjEbSEGLScBMRcP/gHNHO+0Kmz1KpEs44Xx77VKY8w2IGWad8Mfn/6eskBmNFFXOx8Gngn4eBwzwy7ePYQG3dQaGNJ31DqfqlSjB6MFWh174ossD0Fji3tasYmLNLin9QK08hsPFOx5ahxNVdRm/vsLGERzUoKs6E1Yb2vPkVDHlWYCI7RN8evpbRF/yCH39Zq2/vJAioF6mzxaVoWNLsQMSA8C9TvElaPa1pB4vsja5YnmPVgQCCVLbF7ZTuIE3sd2FHmRXarv+MNDI+BYQZ71qGIVZva5yk7ZmPCIMk1tx6+nS0tZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W/LAxOcxHw23vCk6azf/dOBzHII7PmxH/L9fk02RSc=;
 b=OHWYq4fU9v56fwSyUd7Tjl7p0c9NNIfKXJf2cyl/2AJWYCFbPDkypjQpG2gH5i7a435ax+exwGWFihUs5YgjajuKdPllv6HBW7CGCd7HYF6VrOb/qiRYUNuqN1MOoAuQh7A3ktZCi2LqgB7hS+5vkcdD3BcFbVqTnER7uzTXOSTHhDruxjf8OlHJQFpS0IxUmeQERsLNLcQ+JOb5PvuS/yq4FtmNaNdz7PuNHZkr6BrkgbU/GHa49FpQ4xqg5OCJ0XZyVWYLymDWkzpiWz42w0Nc8toKZlBGiP7TAhqLdxRQmEJQJ8qwgYck2XorC2NFBmM8LffHU2CsNGZplVzDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W/LAxOcxHw23vCk6azf/dOBzHII7PmxH/L9fk02RSc=;
 b=IvPPUG1Zl2lFB4kUMyldI8wqrylXqv36jYCXJbZSbkXJoFCgg7Bi9azv1+ZMN+zRxA6WuZ6xeD10RzV3lf5DSBWlxsq0xLXbAL7kQHnT7ayQtOZOZETlSOmpd0ELwE7/lQH9GEtjx/Dan9icIjxOnm358HkXQtXSbl14mayWoCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 22:53:57 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:53:57 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 0/5] Eliminate CONFIG_NR_CPUS dependency in dpaa-eth and enable COMPILE_TEST in fsl_qbman
Date: Sun, 14 Jul 2024 01:53:31 +0300
Message-Id: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 135575fb-ae88-4659-57b7-08dca38ead5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?JOa0V8mUqzStbDjnQqmECsftzTDPU/Z2FZEQ2rDo+XiI85lHeLbZzz+8qG07?=
 =?us-ascii?Q?7zD+S22RmY+dM85NeYWhfjGdzwR/4JSNg2Js9Jbwtt1WkjodFWXtcQOTCBOF?=
 =?us-ascii?Q?ZcYZFafDF3i9JCgDicrpcHvIV0ILyEF0sn+ArPOmIzoMQyd4OancPu/dzcYT?=
 =?us-ascii?Q?3kaFRmeOpoKv//idBWIplKlptmkCd4Lsfiq9jGVi0lUrgrEWW66+D18sQ2Xe?=
 =?us-ascii?Q?Wd5SBMETgI8gxzT/+L99S/UYHmGJxZuP0EH6mrGmHE9blYCuVJzoOWbB8iNg?=
 =?us-ascii?Q?vvh9monEB/jd3zGmDrhgg/HCuwreKA3F/aENaWsiGMtdi7Cz4paMooQ0bAuG?=
 =?us-ascii?Q?wA/PjCZoAKZCC1/GLx+ustJLcdDCC0h34Vhb6vcla774XGeS6KJAGWuIY1ZC?=
 =?us-ascii?Q?U29ZPBHbbrXq0RlHGtEzGrxex36e/ALQjc+vbxdWYjA5WhW3j21Yz1mACmBn?=
 =?us-ascii?Q?e9ycoBnHy70pFbI0Fm1r9mJydsqfPtxWPG0bHOgz8wkjMEnhf/KKsK/dTx6U?=
 =?us-ascii?Q?xWXsw6+SqT41F5DOGm/q47ujeLTEmmoncMTcdJDKGP2019NLT8J34sfTkIoW?=
 =?us-ascii?Q?jyVEB4mWkl5KIt2yK3aB2WUy8bRjuoPUsvrTzPefjmClb4ANlMx78NJwJkdd?=
 =?us-ascii?Q?b23BWchyUIyegCDAZQ0jp/d5R2fUyfyF9WJ6CwrwmjW/CYSkhs7fKZo5acNO?=
 =?us-ascii?Q?FcMVusWMc6oYGQTDPLdEnSAbPfhgy0YY4jfGQWcynwBGxg5K2Y4s2+kY8oeA?=
 =?us-ascii?Q?sZf72SxzhVGK9nYgVgo3k4w3VxlUXgna8y1zNZDxmbxxr4Cm8AEMg52xOKRE?=
 =?us-ascii?Q?U/3LY/kSxrf1kgqen1Waqqx/ep0Y2d/ym5LWTpFweW1wmrxmO1st5zo8Fw2t?=
 =?us-ascii?Q?pl8YQzwb/LQIJxOBD0S5nRt68CJNQa0n+pQqbAkGU9xVFUCQd0fi703ziATM?=
 =?us-ascii?Q?sfL5KghXvttvOIZhZKvR0irahWtxrrDhh99nBLddYDnphmMcKYpx4p298oTK?=
 =?us-ascii?Q?aK6ZMaJGqzfkr91FUGoJyjgbIU5lli7539pAkHwtSrvuMPs9oTAxbn8d/7iD?=
 =?us-ascii?Q?H0CbPWpV9RQcC6zT4r5ExJanUarmbvLYD0cDITnKOlckxWX4S73PWC5nYhLD?=
 =?us-ascii?Q?0S2XmVsCO9f26tUOdjfjLjuzV2LXXF3P4/+Q+Plne6Ra1j4rSpkb4S0cqeLp?=
 =?us-ascii?Q?Wkvxya/eWMjVkB+yh31yYfddYFpeIOnkiJTo/D3GEsvgRDEbStMBPZIx3GHM?=
 =?us-ascii?Q?et8niRIa3wUq04GoUd3Mu8SVqE0CkASPzhBCtYmdt+vn9cUJqFO2eIMXQAPw?=
 =?us-ascii?Q?kt4kCi2lZOvfCyxr+UBvJgDZ9ZYSaJfM5WLto87WylFhXqFO+RkEoUdG8fez?=
 =?us-ascii?Q?q/kJUdg=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3tq9GR99eqdVHBgzJLrAYRatLuji4tZKlxpYpChCpCrvJUx+3gGm8wG3FCiJ?=
 =?us-ascii?Q?Fg65/mqZHo61Rl6ku30/vvmWOjq4DAhF0yWgGGPPnC0Mi8rbP+aBbvDHxH9A?=
 =?us-ascii?Q?9tDuq90f9IvUhlJKrwLWDBlEzG0OYjmXCwfLTCKiGYS5jqANDhBB5bfGO65z?=
 =?us-ascii?Q?jS2rm/RHAD/r/LfdJ/cDweJNg7iBd+KtsckaPZ9HaxyLCgOWI1YJSuLC/ALy?=
 =?us-ascii?Q?zqqiGwWVn/JeZlYYSH0qIv0p8tFqbRNYtzXj/e/dkvb+SPnMwWhETfpgJPXQ?=
 =?us-ascii?Q?mnoYLDoUhR5Qw/wH3xrL6Qx8WChqmZuWGvZHQTFXqMrcBqARUG1tDoe79hZ7?=
 =?us-ascii?Q?X4cUmCJadfuCXM3z179BAImlt2wZZTgFWorN+S3K6VETF0N6uB99fipuVbzn?=
 =?us-ascii?Q?N4jZwXdIU3FnkHlGA9CmupoWKS9HgSHptdLXtPCl55+KDtSw7DkXqb9+lfps?=
 =?us-ascii?Q?cbq+jDZtOnQQfEcflCXpXrSlylK9G/RglxjXdPX4hqtNf+brKPmOQRmpF+Aq?=
 =?us-ascii?Q?T3fb2D1HCd8Nz1t+0osdyl0TLL1nd+BC9+wgvKo0pMj+Ety7ZH8OumIvmMIr?=
 =?us-ascii?Q?0iYdHP7Ne5wISEJcgg5ftL5hunhjHqZlmT8jyCWM5mJojaK9RG7Jlh8xc90I?=
 =?us-ascii?Q?cnm93RB9I/nfkLDEr5L+C5+lQJmZLz3Q1osFTWCLkFe1kjCTRmnmqRuIB2ol?=
 =?us-ascii?Q?5B1hHuGSup14rDU4M/Rb0r0QBijRuSI7MLr3ndS2GXllyuuserFEa+lpkb0A?=
 =?us-ascii?Q?eMkg1LBpgsD38TRAM0ZNNwjZgkcalEPVacpkLzbS2QJV3fvzJpGrdM0yNzKI?=
 =?us-ascii?Q?cMUmDZyPjGul14oCswq2Y5JY34yERLHrnRg7SlKQpHObJ2Y42KzfrjKCxtSt?=
 =?us-ascii?Q?VlMKQa2JsYi9tSYRIH37jHbzPkKWSyHDCr30Dchg7maha/JiDCF2p0mq3juE?=
 =?us-ascii?Q?PjN1n3hRNezwgoAqVnUzA++RmoBJPtRMfrWkr74IiNiPpQu+/OfHvLuPsMO4?=
 =?us-ascii?Q?FwIAqBrd13JqrwInw1XQaZl4GHPk49BCNh3ZDsNYx/0oXRptamTs6qgi0c8h?=
 =?us-ascii?Q?sD0eiLwkdQwf9WLEWwFj5bAt7AGjO1KYt4v24NofplB7WtL75v2Cj7oq3iO8?=
 =?us-ascii?Q?u26bvBOyKa/bYOeLCDsYUqlBAlt4HfsAqrpMH9wv6mjLrs3biDzNaiM6AYN3?=
 =?us-ascii?Q?XMjVTiSWafXce1enAxuq9CuCWQ0Iot9MOrsySKPeAhMFJGuDuvxC2Cu/3q6Q?=
 =?us-ascii?Q?KZftchnA26hfeojdjcOTq/37oi7lETAiQtPYy2lxHWQHSERHs6n7riIWARFv?=
 =?us-ascii?Q?3Elr8kHzcuVXayMx1IHl/6wRpadyz1gH8WACeDOaPQtF4TB/+6Xc1XGSltyo?=
 =?us-ascii?Q?sODris2S1YAsXta7vrl4IlXgjEj5K4CXhxB8WhBFA/OZKc4FW6SILqF75Mlo?=
 =?us-ascii?Q?tBxzwT1A55JEUjZ7IZE+vG66P0xJ/mZLh8aJbNNt2dF22FC6EEnsJQU9xJ0D?=
 =?us-ascii?Q?iafhFCQE4kej+XpONO85xcFAmEGIzLdgqj49smK6HUwA24vGjKk+6E4q0wBd?=
 =?us-ascii?Q?XMstm82ucg40xzVFNtWBndH6UZ8rISeZK01Rb203AfaCfyIDh88RBQn1KNcB?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135575fb-ae88-4659-57b7-08dca38ead5c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:53:57.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfOfqVaOHAf4Q81VT3WpOIhKiPDJCM5RBtJGdoTXYIrRitdSP3XHYcVfGglleYQWm8Lb9A2fZIkyLblCUNE0NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Breno's previous attempt at enabling COMPILE_TEST for the fsl_qbman
driver (now included here as patch 5/5) triggered compilation warnings
for large CONFIG_NR_CPUS values:
https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/

Patch 1/5 switches two NR_CPUS arrays in the dpaa-eth driver to dynamic
allocation to avoid that warning. There is more NR_CPUS usage in the
fsl-qbman driver, but that looks relatively harmless and I couldn't find
a good reason to change it.

I noticed, while testing, that the driver doesn't actually work properly
with high CONFIG_NR_CPUS values, and patch 2/5 addresses that.

During code analysis, I have identified two places which treat
conditions that can never happen. Patches 3/5 and 4/5 simplify the
probing code - dpaa_fq_setup() - just a little bit.

Finally we have at 5/5 the patch that triggered all of this. There is
an okay from Herbert to take it via netdev, despite it being on soc/qbman:
https://lore.kernel.org/all/Zns%2FeVVBc7pdv0yM@gondor.apana.org.au/

v1->v2 change log:
- Return -ENOMEM in dpaa_eth_probe() if devm_kcalloc() fails - Jakub

Link to v1:
https://lore.kernel.org/netdev/20240710230025.46487-1-vladimir.oltean@nxp.com/

Breno Leitao (1):
  soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST

Vladimir Oltean (4):
  net: dpaa: avoid on-stack arrays of NR_CPUS elements
  net: dpaa: eliminate NR_CPUS dependency in egress_fqs[] and conf_fqs[]
  net: dpaa: stop ignoring TX queues past the number of CPUs
  net: dpaa: no need to make sure all CPUs receive a corresponding Tx
    queue

 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 76 +++++++++++--------
 .../net/ethernet/freescale/dpaa/dpaa_eth.h    | 20 +++--
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 ++-
 drivers/soc/fsl/qbman/Kconfig                 |  2 +-
 4 files changed, 69 insertions(+), 39 deletions(-)

-- 
2.34.1

