Return-Path: <linuxppc-dev+bounces-7605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55BA85951
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0S0Xzpz3c1Q;
	Fri, 11 Apr 2025 20:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366648;
	cv=pass; b=GSomQF4KgLraCw82U5CGqAq6PVoASQH+rpUbQL9C+h4CTzvzpX4X3jmNtkAR2/wtYu9uUkzefNhVFfKdaBu0wF86PB7/yVlZ9LAD2sSjfg4Kmf3ekocwFek/6CkuCDn8eKCr98MlT40InVIIYtQf9isYbAMeuERlhwgbFXyt0ypukpJ5aWb2UTdXwlma6n4MjonAr3zYCLT8iV23n2/AZd8fPT9w4Kj8M7J/rdqg0znMdPwsUwLs0H5fdb6SdOhd99TsbF7+txXWPe97bQt4lEJJTeifU5og9GcUlLwGVw2/2xVja0NWjdMK+Pfaw9CP056RXu19JR2zd8oS6LvVTA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366648; c=relaxed/relaxed;
	bh=A7uhTuoOWZX14HXS0JHUlxopZ8af5BKGhxb+yYy1rGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzdXImb4Fw5Oo5ZRoJVABseCtTniY1oc1kjPB2P0iztjP4qLs3NhVqVaJp1WFt/FTiz01S0Ty3kq7nKhNuwYItS+8HwIyCusge9qNkVfk97UItdbcNkceHot566lvu/PVA6xAAi0zqPTED35PlophgIDz6i6wxtJCIz3HVd0srjCtqizZoEIYNy7gOWnhkp8Ox+qMd0Mda+bnWmNI4hXJoVZ53za4w8YfQ9Sti6WHgBrrKXekw4PxH1WZNHN0cUPxeFRar+bM+bJSUw0jBQelfPp7sn0Mh15Z9AV4PHYN+oHL4S9uNy8ToPShzYcpyR5oOVX5psoRFj64mj/GIJA8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RBI8aCXq; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RBI8aCXq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0P01k2z3c85
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF3hTDPu5Jkq5YC+dC30YykgPk+hTxRX4gZGpngHB1mAlRTxZIRqoT6VJ93xBuq4O3luzu/EyG/6lI3rur2Os8bDuTZw4108BKdobHHi3RgHvdzRgvRyl4YmQbQwGQDYmyqwshsyUlt2ZUM+IO0bB5RonElPxppDabcz1i1CEbXG40F6QtpMEILyCPwREqcpoDxozUCXL+npcK8mJR6uIpsOFdnOIOUChEz8ZWCqF8oSSZ2lJBrBYkNJ2VnETxOBql3f+7wWm+WiQ38DfqIyRaOl0Ko7d16r3N0Cx6aws8/Bs5Zzs08hm5iIjRCu7QKMK4rBQXHbplzysQ4+YfPlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7uhTuoOWZX14HXS0JHUlxopZ8af5BKGhxb+yYy1rGw=;
 b=bDXuKMqbeNNKjj6XoTcYdbV/7DRxjUS4pP4kqPhlUx9jcfSWw+2RwmYrRGfNTqqChgKBpDr8QGydrZjYYKL9q396BvSABNBldFyXSEXDNdRNSPXgQ8wg8PrvlgJzdeVM61+xy5mtFTPzNm0KszWqCpNacCVQ/xRyvXaFoOOdSWKZZkKEhikrsJY4dik0T9lV0SAXfRmhnWkPJwZJJXBB7PrtVWLaVsJ82IJtNB4f4ggxTO/fFtDECsfrWh1Suj2gPvsp+Utx1UgwZWIdSwlzTJs0veLhUZicwUz78Fc61n0iR1Uhmja0bXba8duBzxrKkFIjwGhoozh2EfCjkpzFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7uhTuoOWZX14HXS0JHUlxopZ8af5BKGhxb+yYy1rGw=;
 b=RBI8aCXqMBxN2gQZjYb0I+FRrmeyP3xozuYBFv4VP+6+t5E0EjeTS77Hd3JYRlhLwZAKE7O8NyijQEtE6EFvWlaS2DIu7X/t4nJ7Q55TMQKfDU36RtDM3SDBlEe9QHi6U31W+79eVdaLPQeLioWXRdDkHtcCGa/Y4ArdQ3wvFB4sPUmUiWF7nZZA103uEqGXdmJwSipMPBvozQZ8yTatsdi4DZUY4aomFgevJdWaxkZqhCKZOpGYU0Rp1rKDuvpGRmvkaqzDGOHdMAto3bsxd4YArhaMWjnqQiHVdjbsZ9ru7biPpPR182XA31mGVzIXH6L4Qjh9PoxC4QstWM4SQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:07 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:07 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 02/14] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Fri, 11 Apr 2025 17:57:40 +0800
Message-Id: <20250411095752.3072696-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AM9PR04MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: d57e2c45-f5c4-4e36-5437-08dd78e203a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5b5BtGq+iQAubAl/myfmxebExZbnmo7yPUJZpbSbvscRU7wds42R9w7ruB/C?=
 =?us-ascii?Q?SQtpqVepS3KVohY69RbKUeXN9hqXlBzqtePgJEXYds4ZWsJsFeyIw80ZBeB8?=
 =?us-ascii?Q?jK3SDgAC/e5czQJ2EGyAtjxOq0Xf4Qv4nBJPtSQLjUj1Sc1o26NNCZjR7+y3?=
 =?us-ascii?Q?Onr1aI2QsFHwm8b7H4i5/88l8YWT412Hwt+mhddPfW+Lx862zyfpM/TQodAl?=
 =?us-ascii?Q?KgBoUokQTViDsU3CIMnvXZZdOcLPlbE5GSH5z5eHwB0jUT9a4PqNj2YkCPM8?=
 =?us-ascii?Q?KMhn4SIIzTpdovxARWgdkbxrxZqo5Wa1WvVSGBau2HPs+zcbLv6mJR/3fnfr?=
 =?us-ascii?Q?kdRt0f5/doQPRGgz1oxLKt+4yhfe9G2JC2VwI8XSlDfv70qpgZJgBopoidq8?=
 =?us-ascii?Q?mUiQ4XqGiGzRDgihTV8sh8avNpvJ0VUwwZR2OQ+7dR9cUHxogteRh72kxk5J?=
 =?us-ascii?Q?P//n7n39cvrAsFrPpiIylmLgvGQoEKQEnKNa41WR21Qk9ei4JBWFZSIFjHXG?=
 =?us-ascii?Q?mnGjCxw20+pYbKaEgSKr1uMeLI2f6ugNpb5fpqnIiWXJgaMncKj3AwkJdP3c?=
 =?us-ascii?Q?wkSwQxOjZvmW8Mv3xI405Uz32/Yicxsl/+KWEVyXy3BIUx053vq+BAjvocZq?=
 =?us-ascii?Q?igqhajb9dAph7nalcnQZajGLwNlTGylcL8P8HC9vz7DldxQZ8h3hhyTQ0a78?=
 =?us-ascii?Q?aXJAOInXaMxRw8aS+NN8zAXBAMM6o0c7L/TNufTzghZLZlg8I4i9/ElAOWbz?=
 =?us-ascii?Q?TMSfVlH0XPqIpClmBAUfhri9njsDJA8yLbmOPgN4rK26E4Eej8jm3gC0WreV?=
 =?us-ascii?Q?l2nexIlYyTmj7kN76ixw1r9+Yxf4gaMYq3JH+uxtd7TZcBSsJ3Updr1+B8UV?=
 =?us-ascii?Q?rYU+VtLyF1vfIVmfAEImoix5YLW8QfQp+T3O8BtB6CdpwLVK4AIyko4c++BP?=
 =?us-ascii?Q?DO7oIQHrziCkSufLN03v38mZWAy3/W6DovrcTBEv9+lAZw4qDBkCo9hMwRVZ?=
 =?us-ascii?Q?VeIqLVp8+Qmal3xzBzoKpHnEhxRc7RUz3E0GqhL/FDOPNip6pDi9QfWySpPZ?=
 =?us-ascii?Q?F5k+anTPz/a11uJRizViIXS7DPHM3cHxWtT+qPNmqkKvr5zcUGZTHgPbXezW?=
 =?us-ascii?Q?QfOoCVPckVP8JGRUr+R0FPH8E2ggOjuDIZ7PqTzffSqwViv+IRVkBFvK4hTT?=
 =?us-ascii?Q?e0aj7TH6kuLQkh+sMeDT0MGE2bNhGus0jxNNzQA9AZJklYZsuKXPHC9+KMkJ?=
 =?us-ascii?Q?6ad+fbF1It63TkOpI8aAlLhtxHqpaIuNONntJaHmlgCKJv/DFkwWitHUPjBn?=
 =?us-ascii?Q?PNpbVMtqB4YAorcFv2IQghGQ7N9ldoh/86+bbUyI7UyADw67JaprwA7Dt4Je?=
 =?us-ascii?Q?cBbzjzGuuiSyEnNYfnHrRGwBkOC83DeStn9A2I5udNebTz/1KFH5P/xPEfQj?=
 =?us-ascii?Q?wbTZuD0RF/snMvtX8vy8B5HcPeaqMApsp773/Yad+ksnqfLjKjT/xA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?whBKRZsVie7vrozd/jz74ki+28CB9eoeyXn1s8TK8st/e7xZuxaM1CSRdQps?=
 =?us-ascii?Q?7mhVdblyY4XWMME1fpIoBK5S/2/w+0TiS5/Ie69G4LzqLol/fX9OAoOiuwOw?=
 =?us-ascii?Q?wFrHyuhB7LVEn3DruZ20p4NrLYUpRtD5EA/1g/yYBxIQ+N+ZFtM746uTHQVd?=
 =?us-ascii?Q?Y4hKBPaDu27GNw2jfhTVs2JsbxT+eMcAVAQHdulS7UtA9yUhD55gd0Y0cQDT?=
 =?us-ascii?Q?OP4cZRQhVvyopHeT/r+/8yP4NIV3pb6mLIEkNgi51f+voIjp+Zy5NwTbdDV6?=
 =?us-ascii?Q?icLUUdwYx9y6+th8PdQnIiDy6RkbGs5jlBkqNXRlUWVWX4nYyOswcHR1u6y1?=
 =?us-ascii?Q?OIA97uw7GkINtrGeeBaSubjV53sVqyUJz5q5sMCvm1n+azaqWUPSWqHVp3cg?=
 =?us-ascii?Q?GT/EpS0bcN+IdOiWSTKukxq6zLIymBuFfMxvHM6/3BZnyCyBAMa/KJFG6Ujv?=
 =?us-ascii?Q?Fx2s/+daMOKakEd72On5rBO3FJFSqhWbeykQz0RdcQXt45BGKUnXZigvcrHb?=
 =?us-ascii?Q?QJU8S1A/euvfXdy3v4pILM5A92JSiOEPo5Uy1Yvs2G3O26PI1yPhD2fWO5vZ?=
 =?us-ascii?Q?gqOL3+dqJ0Wp9xdbdHYWp1FW6FAzRuCaETTdfVaRE9g7RDnpaDT/HZnMeOCB?=
 =?us-ascii?Q?jxJw+VV5qgb9J6JqdTKmgtihohvpJG4GOcpe1/1wHOH+xDWKDIJFRtI8RZMv?=
 =?us-ascii?Q?/wTW733PYa3kzSN7gd7UDFcf1Xj3yThqMTv2GhO7P41wP76WDplTq/EKjXhn?=
 =?us-ascii?Q?4SjgPcZfosdtHW/6qeE1W0rRPX5KMyNr02CL9X/lRW6PYKFkXh5f87LI7WJM?=
 =?us-ascii?Q?ygmSrD41nOWwWoMeXoklXEDAWL17bjqeRUHE0IXM77yCFLpGsjVUmWe8Epzy?=
 =?us-ascii?Q?4JCePqmr5xA6+7Jmx9D9yGYv92zJCt1OjhGIrOeV8wcr1C3jrEO0YF/dxrbz?=
 =?us-ascii?Q?Oc9qO/RyTeqBhIAEWOnwpjspAuPUehBy7+kiYMOdtFnRWBOkzjGIeRTPQACC?=
 =?us-ascii?Q?AQERhBnye4q+qDmgwiP2lciAqdIZj8gYt5Q+3RXQv4Vi/porojVEsq3H/Wq7?=
 =?us-ascii?Q?/+DGaw8W61R10124cPQlzFAMv7hFAElMV07umnGnyFMzt+v5+TxeCpAtfrzc?=
 =?us-ascii?Q?5n88G7Y/QqSnxYXW/7pZYQlmxUo6XiPMG9d3GfgDM0ZnGfX2UAW/cyoh2xVt?=
 =?us-ascii?Q?EqBZKvCioIDICXxu9erpp5MBUCG6QZJRPoMEryFiUR//JitLf5Mwz+uLLwIk?=
 =?us-ascii?Q?oGllwfoD7MpBWLEvjut0t77vy3V5CWVJDZfZAhWooxaxVFnzBCTsSgK+E+fv?=
 =?us-ascii?Q?MK3fbiP6gXguQd6jVxDLo+Iykg/7KWIlE1aevWQ7372eZfRoAEfpqdqCAF0z?=
 =?us-ascii?Q?vVzyTVRnLE9geewbS7Gj77uAiFgSa1eaXJoIS5pzwECCc4vKa3uOli/98C9A?=
 =?us-ascii?Q?32+6yyk+k4gLe6G0axKgij98WjYdNvTbOGCL3Ph48MhXvz2yJwd9CJhrTs6A?=
 =?us-ascii?Q?f4XKj1L7wbF+1zM3Q52XhcovMQc5KI/crSElgkwYe9k5OEjnLBE9jFSFClyL?=
 =?us-ascii?Q?vH2SEhGtQQd5zUWDB9BBgacrA7kNe/odMajlQrFx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57e2c45-f5c4-4e36-5437-08dd78e203a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:07.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QPs90WEami1t8k/sHkJnlfItroWZvmHQ0I4uunLf4mUvbJbPhHhTDMDdmIsb97tUElzM7rVd52n1LQ0p+iilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. So add
enetc4_setup_cbdr() and enetc4_teardown_cbdr() for ENETC v4 drivers.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Remove setup_cbdr() and teardown_cbdr() hooks
2. Rename enetc4_init_ntmp_priv() to enetc4_init_ntmp_user()
3. Modify the commit message
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  9 ++++-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 39 ++++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 39 +++++++++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..384e0bded87f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -274,7 +275,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_user ntmp_user; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +288,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -493,6 +498,8 @@ void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 		     struct enetc_cbdr *cbdr);
 void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 73ac8c6afb3a..175eebadde76 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,21 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_user(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&user->tbl, 0, sizeof(user->tbl));
+
+	return enetc4_setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_user(struct enetc_si *si)
+{
+	enetc4_teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +287,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_user(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_user(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -728,14 +754,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..ecb571e5ea50 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -60,6 +60,45 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+int enetc4_setup_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	user->cbdr_num = 1;
+	user->cbdr_size = NETC_CBDR_BD_NUM;
+	user->dev = dev;
+	user->ring = devm_kcalloc(dev, user->cbdr_num,
+				  sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!user->ring)
+		return -ENOMEM;
+
+	/* set CBDR cache attributes */
+	enetc_wr(hw, ENETC_SICAR2,
+		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return netc_setup_cbdr(dev, user->cbdr_size, &regs, user->ring);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	netc_teardown_cbdr(user->dev, user->ring);
+	user->dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
-- 
2.34.1


