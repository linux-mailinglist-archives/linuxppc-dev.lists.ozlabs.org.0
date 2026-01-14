Return-Path: <linuxppc-dev+bounces-15709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BFD1DD7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhf539fyz2xpm;
	Wed, 14 Jan 2026 21:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.66.49 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385325;
	cv=pass; b=hHtOBU1SDEDNtfY23mAF8U/eskWz/deYISvKoO8ubzO2xM0742ZaucEuVP2Mir8FL4tpkrdbu31Soem35Rb6h9j2kKLhRRveR6b7E6F8hogdQz3AUhh8D4OITu8xEf95PVvlf5tmX9V0ybaZ7XaRFQBVH5QnHxrgdN/ExSbs9yDFrD9rTjuG9gBM1sBpfFQO58rFfcu/tXm0wyJBc8yolTbzv9qlh1J9B21aK17GpMyM2LxdP38L7VyPSeNFPMHGw7Gzc1sgWPLFNTl7R1q/c6+GFPLAAO66q4+U4PMQEgLGKbv3vKTJF5rGZ6RwXyVUPkWzNarqu7koRqw21TAZrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385325; c=relaxed/relaxed;
	bh=T6l2B5emSI2OgURqGHHiljyuODdwraAdlNiM74sId8E=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NemP+1wtSndIjadlI0UJdn+RuNHth1o33dTwYJWWpxQpk5KL1rI30i7jIglDWlpzYDE0FaKjXOEKbolqOIvVAS4NnUDBJCH9GdaEhNsDO6vbYb1ZTVLC+q88bYYKd5rptk6XNPT8PSfifeCVRBiGb9ZekgerbXMq6/LvyQd89ENawnfeAWIQvtF3pefDaz08EhV7G2SiqxCIjE1clM8mr0wdT327j4WCJtD1Jk+hWGDim1Bmf8ZuHR32sCXe2IMft3FVO/fjFtZCkRPcaauqf7sCSXioexm1oyCuKWMUunZjsweh6ItOOquBZYt82Su5FufphGTGQxtJhXRPysCEfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cjq06IjJ; dkim-atps=neutral; spf=pass (client-ip=52.101.66.49; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cjq06IjJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.66.49; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhf458pfz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:08:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LS76B1ktJSS0rHoNQIrRPukLj/6tUlZBwy0+U/tcnEoduY4x4JkLKxA/TVl9+UPwcoFRmT3WZlTx6eh3cmhMxUZ3O80xJxDUjIgxVSMKfjzPPDcKoV5fOSWCi40C2LUSaVcZ7YTqOlzZ3HFdjCPiL6zTk/kGxshB4JR/SjudWNW43AyWYGci9PjO43kk4EWYt8EJCLzmOzUbOY5DdwfuCkXIX6Nt42li0UxXzGV2Oss2StI4Sy3B9RmrqzxM1gCDnIIid8e9BOKZDis4tKq4Ax7FnAJEsjLC7AQNNyDxePKURY1qeH93IfZ76zPYx5c7NnFrZLkKXEUDFupDfilQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6l2B5emSI2OgURqGHHiljyuODdwraAdlNiM74sId8E=;
 b=g5T2stSbbJj4Frki1fg72KZrGbUU9GtzNTXMSXc13JjMg2bKela1DI3DFCYEN/8bhS1dmgrI0BVWlYkChM8B+Jk36RgqOYpb5agdLYm8uq0gc6CEahRc4kE0o564fH4cTZbDWd6nvgtuy3KV1Z28zLK6B9vmwUVm8UUtJy5obF9d5WBSkOiFbyCYwkE9u+mYUBimmxw6VJwajvTVj6XMoT1xyyM94ChjkmB/SKn1sjSTarOpusSpc+ATDuYbwuv9gEeTPYmrIcO7aoAzTfUL5kpC02UjUgNgsWIImQlE3gMSO2V+cWy5O9mbhFOLHjYc9DlWlVk1tRtXBKKDDifTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6l2B5emSI2OgURqGHHiljyuODdwraAdlNiM74sId8E=;
 b=Cjq06IjJXU4bcso+n2dd0T/3OMllgour+1230c/vTq/w9Zpe0mye4KV0GWWm6Tnu5B3qYUgr/Ch0bhhOVUmMDiR3TJsU9NUSCKCW0tpJm+OGX6uzLv607f43LlJ0+JUiasBNmoUws3YrmZSjkfGYx9sUnrE6KUaKvY/m1dfbdNWTeBZ611FxD1EqdW9OZiys9P+fJIdf1VmLM4x3L5ttWuYvkR4mqHLcPUy6ujC4FZkb5LRfwhr/qLgBokSRNQcS9qek7TMvfnOGj424WeFnC8hr8t9/+yqiBJ/MKI7Hqvw+x119hwPZ9GdOWbIVAf8YZQw0oRmroBlJKlfSmomrAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10533.eurprd04.prod.outlook.com (2603:10a6:150:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:07:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 10:07:33 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform
Date: Wed, 14 Jan 2026 18:06:54 +0800
Message-Id: <20260114100655.3885926-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260114100655.3885926-1-shengjiu.wang@nxp.com>
References: <20260114100655.3885926-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7354cb-7eb9-40da-b8c7-08de5354bc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G6YKoTltcvcjCDf16eHdxX8kVpfdG68kzkl75b2bVo/VBZebw/m+1HjtFvMs?=
 =?us-ascii?Q?wl0bFFdWLfPYxps9N0YaH/Obs0l/4QXzRtT2q95hjODf/QlvqNNG8v9Qgj8D?=
 =?us-ascii?Q?YBOp6jAaSc4vjfJznYYRx+Ou5TjWnDSmkEoximGw8X1kEalK0x1itEvqfVSU?=
 =?us-ascii?Q?iT5hAw5JUoa6SCt+dmst0XT5dJ5ONvNSR7BatoqybXT1UTdyOj9qxMYqlye+?=
 =?us-ascii?Q?Gk8I+03gl8fEN896ucy2XRNMR02x1JPLU/H0lhWS0NGSC23bEu/2w3gst9u+?=
 =?us-ascii?Q?RhIUuQtzskC5pdbMTwF/00CNvmc0JYkFxxlfviHSUd9edMTQtDljKUUr3x7t?=
 =?us-ascii?Q?yDPv+XTJ3hHdWsV0xEITiG0XcNiu7ZPbnsqQRIILDEN6Y5bX0YI/KRdDXaVJ?=
 =?us-ascii?Q?ujKZmTgRjapZpxhaBZKZAPXZCVhF32hTJEqRIvu+dnS5F7KqP/1fWNHg1xcT?=
 =?us-ascii?Q?9x8h0SY4o2fa50ocas6WcZEyTdiJqErlz98zCltHzHL5F+V8KrHl1gcsDtms?=
 =?us-ascii?Q?zfnedLpwCahxt+gWBAmedrVlBhYrhGpKhBuoqWFPXQFuaSayEEXA4GhKv3TN?=
 =?us-ascii?Q?E8Xkv0t12HmmPS4u+YTo+3U9myZhD3E1EuGehWgASYZAEn0RZ8bBkuzNQ7z8?=
 =?us-ascii?Q?RlNXVCefXKlhGGHmaaxeFDCT7kZc6S/yzkWUWYCJAu14nxz/F+9xFIfmCtKg?=
 =?us-ascii?Q?W0Gxq/VHwX4U5JCTllYyJtYBHsYpdOMrBrsEFBRm52ir2BeGHggPzGjAlEji?=
 =?us-ascii?Q?M3GYWKFKmaTfTqpzKxBQeQ1oJS7dLvwTfoDUuA9PonO+9WzoFtQTe8KTs17+?=
 =?us-ascii?Q?el6qJJVOQGd3mSZaCHr5KCwG045TYuHZGtOpRLJ5wGEnCSRfqGekCkq+D8Gn?=
 =?us-ascii?Q?Xh4V9WWDCRkFxXjHr+pzQssGkIpVerZ48Z3AEUjjbdmWtYtqA10z54tzxPEs?=
 =?us-ascii?Q?f/mJrBtAugZMxNGIeA+ssfxjIRGoj3eOzOERdBG2Xk2bfkX5hNMrqtBzuVNQ?=
 =?us-ascii?Q?GGBnACmH6YTbWwF5YGVtYn/92aPOiAvwJAChCdm95wp8bFzyiPZqmuK0RCFm?=
 =?us-ascii?Q?hd8TZyH9gLvOb+1isoDZlh8GODQ3oUjFPf1G89OEbgvVsTVkjn968qCfiUDv?=
 =?us-ascii?Q?WtC+vU4nQTpIE1jkFWecPcb9BSgWabJzHOjulxXvEyoZN/oy1iJxKAEEIS3W?=
 =?us-ascii?Q?2pVNh5YqboYXFUipMmPxIhsq+lduupwBixi/fgXmqJNkT1VffnaWsbYB3Az0?=
 =?us-ascii?Q?IAbELKVWw6+pK4+zEojK8j6oJHerq/3P5Et9rew8sNSbtqQRhS+zSKSB/XVS?=
 =?us-ascii?Q?pUuiDviMuAbScN+1LLW/dqRmD9ChrJT1eBLz5nUz+gOzSQsFCx8QgWtk+Uxr?=
 =?us-ascii?Q?bJd3ds0DwsmWZBzGAdSb7QRUkHRvB0hVqfrFbdqq+37ug6qN5mviEkzscU0S?=
 =?us-ascii?Q?sNObKnP8hK90pW53HbA1ptVwdDc2hb9fqJ8iryQBpZKIm2oR3K/Qxu89Emk6?=
 =?us-ascii?Q?6/e6dqqUHmuMci5HbLU7u9YrmDd3u36PTvwaoUoEiN6AgusSDpdNV2/6PQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nbMAvbMxRaoWPK5tjmVT0OOQu8yqBxFBa7GVXBj0rMSfc4jpE7mK1YQbe2A3?=
 =?us-ascii?Q?G6tGXYMhh4fnlGAfwhoKOruaQY2jJGcVkQh7GXeXOSYMowhKK7rYstYoC/Pp?=
 =?us-ascii?Q?20FCZuKxhlnEyNNq4nBDhJojHJWZAP26Zo1YEQt3TdEypgLOi7jBCvjvWHUy?=
 =?us-ascii?Q?BPM7ddbSAylhxiMDyoXMQi+ilPE/7gHnob0j5GFryv9QvuRwSP0UKQzhoy9L?=
 =?us-ascii?Q?JZjfmjhXI6dykjc9N4zId8O1oFG2BJgZIcJqh9mcCB4opHOq+Kf7ppKodnBR?=
 =?us-ascii?Q?SDIJJ5nimS7VOeKR1yly3S/5Gh5secwrUnaYUexs80OIcHC20dUFzXJzu3yv?=
 =?us-ascii?Q?u7x9VBqyYEd/u5wR0N3QJKn3iCXK9L6FiDcgrI/8cfZg2aRHWfeKX7TjM6/h?=
 =?us-ascii?Q?5Feg2cMocQ+iG0ZyC/o7u7RvRgOw0vCw2yZBY3rh72LNy+wCSuQnotc/w11R?=
 =?us-ascii?Q?8XIK/kv8bKh8uKDdCU1Wp334bOwDE3Rm3NE9JqC3w2zOS7ACB27FxU2vq9I1?=
 =?us-ascii?Q?k5Z+0GATyZmJ7jrKiVklMB937UVHL8iu2mdPsO+rLSP3wPALFgVwsQQCbeJB?=
 =?us-ascii?Q?MIZGbSlwrzGwz7pN8bTO3GsV/RL5TtYbxKTxi4sOaUgVvX3gVDfW9NgUUWSe?=
 =?us-ascii?Q?uDsQOWd59dMF3v91y+uhweVdVUvNMVMrcvAP52FWZX3w+7uWMtTTnoeb9EZS?=
 =?us-ascii?Q?9WxtP5ck+G66/kH3coKrSEkCo68gnMQgcdlc6Cr7erFfwyRuMUO8VL8yPhkd?=
 =?us-ascii?Q?GYjNivnbNZ0ZBQJopXVQsp/gxZ8XADvCvsT2aS/nH/+2Si3q6CU5b5VByqjG?=
 =?us-ascii?Q?3JoRSaWdnmAeqAb+DVBUfEpNtWS9bu/ho8AbKtgN/8dQ3qFKfFycrIZT2tCi?=
 =?us-ascii?Q?sNClh1BkJ2rbqefTguSadZ+Un2hnBHNwRzl+y5Z6nAOlCB1sW+9XZngExYJg?=
 =?us-ascii?Q?BHXObycnBMdvmOHi2M+b37A6wUT0ltxiF46fEdNiAji07oSfHSKCtSjitIYF?=
 =?us-ascii?Q?unMejmFiR0FJwFbIWtX6cOLQunhqQ6ovExlEEwEPDIsgS5N3qZgz9P7CYjio?=
 =?us-ascii?Q?lPNn4RhRX1BUqtkLPcv2dDDfk8JW+YkipQ4RVWpNE7EwO57JkV7WYQ1eBssa?=
 =?us-ascii?Q?pNUw+5uRBDyL6QUaqmh9fQxKBSgnDtvoVjMWstlp3H3+EBtHmSnIcLeMG0bq?=
 =?us-ascii?Q?hMYn6pKaExNG5DAQR44UebEkv2Knh1YsVmRg+WGDU4p10h1YA0Zn3xvblexp?=
 =?us-ascii?Q?1XhHkYozabKSaiVggpAFXTMiKkezfAx48URYysns97qU0uhkOnHiLOSv/UhH?=
 =?us-ascii?Q?ylXJ8K/AmS46I6H08SbStlD6FOXANf4iIETIyKN9Bzp8sZzH/JAOaaclnmLG?=
 =?us-ascii?Q?9tI8XNBEaLmfVLH+0JPiO3QZDGv8ilbg/hwlTKWBOuJ4g/HMETAftNniVRmj?=
 =?us-ascii?Q?pvc4YNB4YptLVLKESWQjtsULtIA9mH0ek80FVYj2MZ7+YPM0Ghn7Kaf3UXd6?=
 =?us-ascii?Q?vmv4mIKBclVyAxPJiUIYWBVncugsa5Cgc15znxAC/oWcohYGE+T3L2/QTys6?=
 =?us-ascii?Q?ijd7U20yNtQFKCLFVEeKGBxuPVfJti/zNu00SXMN/JdApkrjmaudOy6ifPEJ?=
 =?us-ascii?Q?iI9OWbfMPHT1e2RVxenoH9MP3pgfLttegfQWoT8nE0vql3SfPjbLFJUsFvlm?=
 =?us-ascii?Q?b/3uilV4LY32P1OyjoebWXnxdMbBdH/usNCgbn5pXIoyQEgOXmo9e87y5jAG?=
 =?us-ascii?Q?RF7OuWkQ8w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7354cb-7eb9-40da-b8c7-08de5354bc13
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:07:33.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zEin9Z9OJnuMwBXKinIz1dDTMhH366PDgW0ml3vojWfnaxGhXp6bDH0xm1W4uDZhUUGWfNpFTCOoAKhZ5zSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10533
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add new compatible string 'fsl,imx952-sai' for i.MX952 platform

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 0d733e5b08a4..d838ee0b61cb 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fsl,imx94-sai
+              - fsl,imx952-sai
           - const: fsl,imx95-sai
 
   reg:
-- 
2.34.1


