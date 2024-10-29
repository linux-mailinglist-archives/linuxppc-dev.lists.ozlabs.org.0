Return-Path: <linuxppc-dev+bounces-2686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDE9B4FA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 17:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdGKz5RmPz2yWK;
	Wed, 30 Oct 2024 03:43:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730220231;
	cv=pass; b=mxZVUV3UbY8TQlIGB+zw6qKEoBubIgLi1Bsl/llnrCFrWGtFCy3vT20adJFP7a4fki71X1MSvk/yAeINV28CDcBqL410LB/frG/dxX5/AQlQr5AIWnCXnn6KpRS/UDnEGDQsmwT0n3zEU/y9KW9+ttVZn/G9XQ27O+KEsanQMx6OmTJjpmgOXfKivmhXWwDGdHZlnXZj98dG+/DR2Ubmfy29EKHjEGRk+IDqRZOp+aWtAN21pGTYU4e0KyKTydbe1oZxt2z7HsOWd6vvhtsjoPj2e/J4O+qO1UqJSiJymZ+/NRkZIBAJKXK7P5Nl2cJas8lAFsR1tcPVEnCAB0m8cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730220231; c=relaxed/relaxed;
	bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mxZtHV3ew4mPQdaro24hkquC0aVZh8VWP+W7MdohF+2M4pbQiQBCl3UmNn9vqN872vav30jA7pIv2G/rd+rcYhu6+9fjPwAP1wZHX7e5G1tCEpxR7E1q7XWZrDpipXCx2gACER/4BCM/wZrgnF/Qf4MGU5WQhaETINloYNQY9zZgF4pEmcA4YdPMYkSAtWM0K151yiFaAAm2pbi093bjM6AgATyPoR4wzAwyiEcSPG5vReBSwSASiefti1qYfxpu/EQr4HY6wm4nmhjlOOXHx9X1FtX5waxvNxKr0ma3az4tqG2GgCJT03qkq+pF/0X7UHB0kfvnsPvJSVb0QcDjXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bElhZhDP; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bElhZhDP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdGKz0JPDz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:43:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOxzMl+kxnh0NcFlrSRewKZmHH7YgEAUNEplN8y889cdpKwdRPapaQbRzx+8YelMYkFCYSBYAYxSneSO3/VdIiKcPQ7xmqnt190DcUqYaW36bYqK3vTH5PWVUt6jjjL0tzlxDN9m/1VVxMeCax/hFUCEY+ripBDOTcnlbyqycGakIDaT4TMqG29PzE+0kUBCxIza8sH8zMwVb6za5DjYSdolCi2eh6DYRKzhZJipM4qYbM3KRe9kQb1icw1nIRFlPxvp8pZNvvGd6B0OXLjNuki9JRr/Y9dTgZlFkzUwf9+2f/4//o0YW/AOBwJ8r6sekR8Ij8scNMhNN3TD+/2JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=;
 b=BTlJfaeycnPkFYiunDix6IVx3ziCu/nbWXn5hefvasvEek4lOFU336lt0Xm/dphKbGMddDLSHDcnNm5eODbQNNXwQvJdfj7qPdYTG4RjpO/5ZGHxGRYE+yquMsu6KSjSOsV6SCIW72EjaxXEDHEg9+KeK62FZz6hOZ/K8FK8HQFs9nC85Q7l/D4D7OoJk6rU9/m6pnH5V1cevBo1hAXQFLJuTJ3qTb4BpC2gl8f4dKh2xQThzFkvtW4k1qkYuwsuxe0utueOfZnkPFt3DyfQIeTqloaIrpYslNy8eUf5yrk65i8kAZJp6fY4NhlcBShzcMXB2IwH4tFIZuTE35h4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=;
 b=bElhZhDPwTctpc9OmUxi+0SK/hq9JEgVy80qi1hJl6Nn6GcxKY/or6Mxs3A8F+QRmlkNVeKJRU70qIZlojCvOw19HPjjVg7fi39AbNNVTm/krF+oxQECHVkQIal4FribvLY/Qk2rpB7/RfnYXNsdWEynEdkE1og4qC3xNVUGb/n+z2IGCeLQQUth81WzOuGrLpiWzUqSuwFAam5SbyLZsNMiKsMFO4/oliG1a0RqVSi5EnZPbqcz3CNIFds/3A18cRUN/aEHVXPBtsEvTepdf34khFSZoR0bVhhJmT9n2EwiY7cO6xnPwasjQG29gUOVxvMZjC679JiySI0rK2tc9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 16:43:31 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:43:31 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] net: dpaa_eth: add assertions about SGT entry offsets in sg_fd_to_skb()
Date: Tue, 29 Oct 2024 18:43:16 +0200
Message-Id: <20241029164317.50182-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 62df47c5-94fd-40cc-e72f-08dcf838d27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpCZhjFdga1MOQ4ByjJhqawS1l0Urj2Y9Q94/u40nyWqK7H3zuX7trofIXL2?=
 =?us-ascii?Q?XGMExGfA9Yqmva/xAdMrjADhzTS498cgP/ujvx3cIrF8oqNCMsFdWiLbHrC/?=
 =?us-ascii?Q?F8zU6H0tF6WD0eTqGbZniIz6kTgUy1twOLyNPfphAJnsMPfCBoujTfGFCLm9?=
 =?us-ascii?Q?9yzH/G0hWUQ1rqGO6K7XkughiwBNvr7cf292Jh4IzkLuv/HJVM9k7/9BzJSw?=
 =?us-ascii?Q?0TP45IiNI/9BcDWnf75B9Up6DW5esK+ZC/ptK6Yf9EgjV3V6yTR/W+rWljtJ?=
 =?us-ascii?Q?QI2v8tkHCrxVKtLaEe+28u/l+fRejBoqb6yaEeUC/xVnyCbY76REmKT+l656?=
 =?us-ascii?Q?qNkVlV5gCI2Fg90OMuT93dAIGXWfR8+O6TNP3DvnjsNUKT4ptzZ7bfz3cfl+?=
 =?us-ascii?Q?iceGwVJA+9TKuHj4qh4m891fxrxSFdn+TC3QzvS3LYqXC1Au7UgZLFwT/NQb?=
 =?us-ascii?Q?8CsV3+wfSfi8rv2NVgfVFvhO/Z5hpBcrYrH0cQGG1JMmTt70qf6ZdUVM2BIm?=
 =?us-ascii?Q?FAD2s/CJxZ1vJ8bgn6x6ivy9VZ4LePb477CoOfj9BYAv39yKYxVAnSYbAa7T?=
 =?us-ascii?Q?PxG6gIL7l8E4tYbBIIfRbkriHoYIrsrK2sHTQhMRTgBnpfQxQKeCI9P/tD8f?=
 =?us-ascii?Q?99hvROHVVNcwoaMUdd3nGknQA2jEvrFh5p1l5PG/IKpdHAqz2bq/NoSXV/up?=
 =?us-ascii?Q?S2fFzYzpoTlpxYJ4yg9SmOQdFM8lh2Dk//Ojg6lSIYWmxiSr4UOUXDgcVx15?=
 =?us-ascii?Q?GVSoPBKEvsCkvBes7OV5uZ6O1nXexXTF4xNV+JesroiPJSUWZuLqGBSeBlg4?=
 =?us-ascii?Q?wP3nAGogH0jV0q9oQDmLAZH9j1gaAsRZNfBnTtHTxfwnYaCHydnIsxKjiB0l?=
 =?us-ascii?Q?6LJjXPTExR96NTLZE041F1z5TzTNfP0EQLziFD3e84uxzrNzlaht6pxLNr9e?=
 =?us-ascii?Q?38GTKHfunux8nlAcsieuGGWXCxvrbmNI6mxfdB5lIKiL+/bGL4x/zNp1kLq1?=
 =?us-ascii?Q?0sXL/Gon3agxKXGlazVzcJduRki0E9fvXFMimLSp8MydCBS7119YTey96Pkt?=
 =?us-ascii?Q?l39QDizXj8vAV8vpPgXjtiDd4VDiHsLWeay0HuOndYQ5C9l2YzxLdVXQgGMk?=
 =?us-ascii?Q?+WuxEM03yUmMUEVZHLxK0/P9DQqIWevQN+4iexlAy2i68AO+PsqMOlZ4EHP8?=
 =?us-ascii?Q?8/LoZbnpA4e1Sbp4pyIHuTW0cV2+DA1aqVLFF2sdjuzZMqre1V28UIoiu1cE?=
 =?us-ascii?Q?wlgdPoy834GG1ZPoofLiqz3r2xxThPGsEbn7UjL/3il2DMX1fAuySV6EaKBy?=
 =?us-ascii?Q?gHnFZecoejJDGGENCSmDJU3C1yGbZlXsDX3gs5V7gbiN6tZ/yaYO8JOTTCcW?=
 =?us-ascii?Q?FzVJjB0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z1+pMNd573o8DyGqsjYHzuAnIwoBFnA4Sb0rACkaAIVaJY3XomlvsBexjDdD?=
 =?us-ascii?Q?C9m17zdwG77sg9WvDF9s0KrZXv+AYBj+svRP+z2T4PDR33wTuzIJsC7APOtV?=
 =?us-ascii?Q?fAXZxncZ2I0rrheuKKXKSddtesN/FK305DBAT1slTvc3ht+oLxIDiSz0lnfA?=
 =?us-ascii?Q?gSfxWJyLvSCM6GCQAmO8FZIu93Oe9+dj26n+XBbOJXjzRlKfHHS14wCZKfds?=
 =?us-ascii?Q?J/9Dmvb6qNXXWj6QNSODmpLRm97AxAYStQisnefdMNfYzi605fWWMVJteGkH?=
 =?us-ascii?Q?K0YjGdhDvTC0jv554NJzCyvuXzCyctL77Jr6s2CLame184zWn2uldtUG15Ih?=
 =?us-ascii?Q?qUUYx6NP28mmiraLzj/K0L4L/dtXF6O8hYpeXFCS5C/0nKCbFr9dCa7qlYBY?=
 =?us-ascii?Q?AYVdP6sbMrTNizUM/HKmbTc1qpjVn0fsv1SwGyOZBNdwe4ngmPNZW+2f1wSD?=
 =?us-ascii?Q?2CxOw1cY1UAs/BtQNCAqupwULn7MLnjHYauU5B0H0kXCzv17Ip9kT3GUaoRI?=
 =?us-ascii?Q?B0yI0Ax2FqO4mFNUjNRj9+eJ00SxT+mYIMiMUkbNx4yLhdSgjEqlJTrhbv7/?=
 =?us-ascii?Q?iaGP5XHE0CWNzi3f/J5/BjbV6sNWlST2VCk7K7K3hW9SzqAJsRFYTYHwPiyB?=
 =?us-ascii?Q?bu5YB3sg50dh5pLDvORsqrVS6Tbri/eE6QdvdNnn2qxMPvCWjQTjoUSoGh68?=
 =?us-ascii?Q?QqHmUnBEtrhJhCEZDCYBLZFMUz2AIIKDJRBkoM+Ydxl6ZJtbnHnbLS1azPrL?=
 =?us-ascii?Q?dNqwt1aBungbYRvheXEyPVWqk3kWwE5G/jjJpWFmdh0jUDvq9WPcSBQXHGKk?=
 =?us-ascii?Q?j9Hq08DMnOK2h/tSi712RCtl0kGBwJ/WVuRBTKcrkniJT/oeUmVEO5oGrVSF?=
 =?us-ascii?Q?Dkdybd+onooXUOvzgqx40o+zSxWNeF5t8Qsv7Wgfxd/fZSyznmFJ9p1K4rm9?=
 =?us-ascii?Q?Pxy+NZgV/Aq+RKKKsI7N08ecZ1Fu435N00NTSJe+9Y9+Te0QLYE5Hjc1J2lG?=
 =?us-ascii?Q?tU9kA83NjgpwBKKWVGCSfBVHCLTyXGTEJFU7aoD95f4Q8/dfkeOLOXQQkTTd?=
 =?us-ascii?Q?lsMkM1UTcoKaWL+QnLhrqreg/2ReUw8kFpZ0PAvPwFuLGv0L5BbFkZ7RIHmg?=
 =?us-ascii?Q?77N/FiCPWm9qzcBrlstqG3QYcfE9qfwNLiRNycv1WH78U2yN5DnJn1IufNX1?=
 =?us-ascii?Q?6ZqZ50jLDQ74Ql3N8RuUKlEs5pJA3OolKhv61+DousKjOCvy+aQU4YLWenqb?=
 =?us-ascii?Q?iF8D5TnYEpM/ewu1nvKsGlqE/uLo5Td8WwzwUwYNsWFdiaZkueyd1e7jE9iO?=
 =?us-ascii?Q?/rebFbXgUDIz+wwRj2dd+qMc6BlfpcR6qB7JdVYjiZciN2okE5fZQchCwY7w?=
 =?us-ascii?Q?pfATTJzh7gdXHt2vQtF5sWahKdy2XFg0A/nfXkHRDdURcpZwrTjbKpU6BXkD?=
 =?us-ascii?Q?UBWf8ACSlQt40CNXVnaW8ZPE4eScL2yYiJlAysPhaXjftn2ZnRpRWmpESvIl?=
 =?us-ascii?Q?KWcI7NaD1Xws7QGZHiiWfwiIkUHGoWtxtGcxwlQvBSmradOQQ+7uOGFa5pxO?=
 =?us-ascii?Q?bkSqfG434XlbrlWHUn8GzuHCnueoN2mLpeusO1ZGGTOKbPE0TicEi/XlNBF4?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62df47c5-94fd-40cc-e72f-08dcf838d27b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:43:31.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xminaAuOe/XnaYsUGatFEUHloyICglhK2NbfzZO7THzhc0IUJjKm039HxmILIAtkRE4ZKc+ci9bIYLZjhqVfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Multi-buffer frame descriptors (FDs) point to a buffer holding a
scatter/gather table (SGT), which is a finite array of fixed-size
entries, the last of which has qm_sg_entry_is_final(&sgt[i]) == true.

Each SGT entry points to a buffer holding pieces of the frame.
DPAARM.pdf explains in the figure called "Internal and External Margins,
Scatter/Gather Frame Format" that the SGT table is located within its
buffer at the same offset as the frame data start is located within the
first packet buffer.

                                 +------------------------+
    Scatter/Gather Buffer        |        First Buffer    |   Last Buffer
      ^ +------------+ ^       +-|---->^ +------------+   +->+------------+
      | |            | | ICEOF | |     | |            |      |////////////|
      | +------------+ v       | |     | |            |      |////////////|
 BSM  | |/ part of //|         | |BSM  | |            |      |////////////|
      | |/ Internal /|         | |     | |            |      |////////////|
      | |/ Context //|         | |     | |            |      |// Frame ///|
      | +------------+         | |     | |            | ...  |/ content //|
      | |            |         | |     | |            |      |////////////|
      | |            |         | |     | |            |      |////////////|
      v +------------+         | |     v +------------+      |////////////|
        | Scatter/ //| sgt[0]--+ |       |// Frame ///|      |////////////|
        | Gather List| ...       |       |/ content //|      +------------+ ^
        |////////////| sgt[N]----+       |////////////|      |            | | BEM
        |////////////|                   |////////////|      |            | |
        +------------+                   +------------+      +------------+ v

BSM = Buffer Start Margin, BEM = Buffer End Margin, both are configured
by dpaa_eth_init_rx_port() for the RX FMan port relevant here.

sg_fd_to_skb() runs in the calling context of rx_default_dqrr() -
the NAPI receive callback - which only expects to receive contiguous
(qm_fd_contig) or scatter/gather (qm_fd_sg) frame descriptors.
Everything else is irrelevant codewise.

The processing done by sg_fd_to_skb() is weird because it does not
conform to the expectations laid out by the aforementioned figure.
Namely, it parses the OFFSET field only for SGT entries with i != 0
(codewise, skb != NULL). In those cases, OFFSET should always be 0.
Also, it does not parse the OFFSET field for the sgt[0] case, the only
case where the buffer offset is meaningful in this context. There, it
uses the fd_off, aka the offset to the Scatter/Gather List in the
Scatter/Gather Buffer from the figure. By equivalence, they should both
be equal to the BSM (in turn, equal to priv->rx_headroom).

This can actually be explained due to the bug which we had in
qm_sg_entry_get_off() until the previous change:

- qm_sg_entry_get_off() did not actually _work_ for sgt[0]. It returned
  zero even with a non-zero offset, so fd_off had to be used as a fill-in.

- qm_sg_entry_get_off() always returned zero for sgt[i>0], and that
  resulted in no user-visible bug, because the buffer offset _was
  supposed_ to be zero for those buffers. So remove it from calculations.

Add assertions about the OFFSET field in both cases (first or subsequent
SGT entries) to make it absolutely obvious when something is not well
handled.

Similar logic can be seen in the driver for the architecturally similar
DPAA2, where dpaa2_eth_build_frag_skb() calls dpaa2_sg_get_offset() only
for i == 0. For the rest, there is even a comment stating the same thing:

	 * Data in subsequent SG entries is stored from the
	 * beginning of the buffer, so we don't need to add the
	 * sg_offset.

Tested on LS1046A.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ac06b01fe934..e280013afa63 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -1820,7 +1820,6 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 	struct page *page, *head_page;
 	struct dpaa_bp *dpaa_bp;
 	void *vaddr, *sg_vaddr;
-	int frag_off, frag_len;
 	struct sk_buff *skb;
 	dma_addr_t sg_addr;
 	int page_offset;
@@ -1863,6 +1862,11 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 			 * on Tx, if extra headers are added.
 			 */
 			WARN_ON(fd_off != priv->rx_headroom);
+			/* The offset to data start within the buffer holding
+			 * the SGT should always be equal to the offset to data
+			 * start within the first buffer holding the frame.
+			 */
+			WARN_ON_ONCE(fd_off != qm_sg_entry_get_off(&sgt[i]));
 			skb_reserve(skb, fd_off);
 			skb_put(skb, qm_sg_entry_get_len(&sgt[i]));
 		} else {
@@ -1876,21 +1880,23 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 			page = virt_to_page(sg_vaddr);
 			head_page = virt_to_head_page(sg_vaddr);
 
-			/* Compute offset in (possibly tail) page */
+			/* Compute offset of sg_vaddr in (possibly tail) page */
 			page_offset = ((unsigned long)sg_vaddr &
 					(PAGE_SIZE - 1)) +
 				(page_address(page) - page_address(head_page));
-			/* page_offset only refers to the beginning of sgt[i];
-			 * but the buffer itself may have an internal offset.
+
+			/* Non-initial SGT entries should not have a buffer
+			 * offset.
 			 */
-			frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
-			frag_len = qm_sg_entry_get_len(&sgt[i]);
+			WARN_ON_ONCE(qm_sg_entry_get_off(&sgt[i]));
+
 			/* skb_add_rx_frag() does no checking on the page; if
 			 * we pass it a tail page, we'll end up with
-			 * bad page accounting and eventually with segafults.
+			 * bad page accounting and eventually with segfaults.
 			 */
-			skb_add_rx_frag(skb, i - 1, head_page, frag_off,
-					frag_len, dpaa_bp->size);
+			skb_add_rx_frag(skb, i - 1, head_page, page_offset,
+					qm_sg_entry_get_len(&sgt[i]),
+					dpaa_bp->size);
 		}
 
 		/* Update the pool count for the current {cpu x bpool} */
-- 
2.34.1


