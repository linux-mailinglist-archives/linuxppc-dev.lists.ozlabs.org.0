Return-Path: <linuxppc-dev+bounces-6666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D7A4D4FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:40:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJ66dhWz3bkg;
	Tue,  4 Mar 2025 18:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741073990;
	cv=pass; b=jMEoVArh5sXsLpRywdA/b7330SUz1K0Vh4P4aTE18F5cCHUXb75zLBMI1tFWeLzAsOJK4MyGixjb2z6Z7pgUrUvUbppr0Guq2UpTR+cVbXe9paNgjS9VoBUWKPxbaGK+7qPPVSVJsTP6X/Ie3Zv9CtwamweeouwTJzdYwEinff+e3baAUOjw36I85hU2iV5TpeIY9K5OJUuBuK+eaI99Z1EcbmKC5pEWjvaVP81QeaV8OHqZdxij2luFdp1hTi7MbWzCOx06VZdUkuGmWGr2ZfmQRnp6LAW5RH+KIFKRny11wX1IsIB0MuVvxVofPNQNR33YKMjVZXgk1QAT8x+OPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741073990; c=relaxed/relaxed;
	bh=GnRVcgcQq/gSAk9o7Gk119IitRT2tfuErtnK0cB1tq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XhTgMNkAOU77kCTeUgcCqJMOBvIsbHpcyy0s3ubRIBI+4iZwkp2xaerJiy0wJbQTJ4R0Vx3CA5VXAoQd209p/OJATYHo1ZkQdCuHxcyFUBS14qHmBmfyHetM8h4fcsvRUdMSDw790ZmVNUBmTa4TZKye75MWn1nyz1iaKvHMotdbrcpIKQxC7pWnxIvpjCOQj+/x/2g6PFc7iQzXRP92nfwrBLWAv0/jmEnqkEVgBqQU3d0857TAM/2AJHNkraDdnxT9/F/edH294HgmRLcrR/w85wdgj4YhEsC7RERX9gi/hob3T4RdZ6vU3NW75FlveIhgJb4tGPuxENMA6mctQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=F5vvZrfy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=F5vvZrfy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJ237xWz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:39:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNXboEIgzj1fNMdPGbw24ixNrr6QvPlwGuPtf+xafA1dbtuFx4mRhe9E/eHRXJ2RFSK2vhKHF0mqEmQCTqp2WUHqjjzX7dBDu996Cnx0RQs5lfbyS4c3bnTRA/hVwLPLYg+sDDMB1RrNJAYBURhDRBtYOJdeyrZ/+/aprvSbzAqxh5jztTT2qNYPzYlINtaXx71C1wFle9X5SjVpC/j3R3z+RRHmbFlVC7w2sWU7Ud2TQ98CD1kwAWOj4MOnVJLVWYmBTQ2J7LPf64ZiqdgD8Z7eQZnMO7bEdGEwvATvuZDlvkcUxsN3lNcqz9Dk9q7zB9H6MHXGCgwr2YVvuVeAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnRVcgcQq/gSAk9o7Gk119IitRT2tfuErtnK0cB1tq0=;
 b=GwncPPwpMUoutIGw9PlIkNKIKhnETz5LugNYyUg0+vdjHGKOZJzi+ndNFU1IWlF0gvQqsczoRmrCBXtZQWj+eWiTw1Jq6t6Di/+7EfUTm9E/8H+Qft32YdZH2YxZVx8ZAqKA9FMoyjL5mIXRIoNFLQWNBqm6X1bUQJlk+5X8AUIAmaw67TqQEBHrzAMHYMM1PWF/Co8JEq/LWrl0hAT7n6oaxflV1bwlNuripMJOT86J+vAQkIg1dS6OSO+8Sh+ZFe1Obz9nl5qN4/2GexN/s6N2WbbN4vQtz9bIH8W9JdK0c/O9YFz4rbmXknXMHzCxo94Ko0EdgIiXQnhhQ5V6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnRVcgcQq/gSAk9o7Gk119IitRT2tfuErtnK0cB1tq0=;
 b=F5vvZrfy3FjgVdPY1n/1sOrkunKoouW124jVU9xlh/IhUikVmIvTx5MxB5OTMDDoaS2VsfVVrxpNvbyxFc5MkLGpAq6jXna+2GzKQB4V25RSCeGa8mxAmDcPBEr1wDOFJsG9dSQXP5/N3J9v3hNM9wqLIb3UV1EfFcY/DJfk6HhhH+20XSh/PkhgyTb3hOrx4ODco+3WNzkvv00779ateXtr9JFCzj10T0TtEeb32h4qybi4C/HHWpN5sX9xHpFfhgwbNEIT99NEFa6S3Ykng5lUiEoZOFkI4xESpw1P9+mGf7FSzU+kCbKCsKNHiDzV3wnInxE4lmnVv5nZ1GT9qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:39:36 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:39:36 +0000
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
Subject: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95 ENETC PF
Date: Tue,  4 Mar 2025 15:21:52 +0800
Message-Id: <20250304072201.1332603-5-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 67069f88-b81a-4b5e-02b0-08dd5aefb683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HRBIIU1T3oHrG1htA+CPTETixfT7zZpaqZdIcJJwm/Q8bgTgYMTjVySi07FD?=
 =?us-ascii?Q?gp7Zs/h0APgxGI8syOEbamZpcdzrZ2lRI0rS4dyeg6xoAxXEaDQHAK1MfbyH?=
 =?us-ascii?Q?VgSQYU1ZywFcmFZSN8HxB0P/cdVx7r2x7zYB4X9gwDLJpWul8XGNfvgl0pVl?=
 =?us-ascii?Q?gVGAXBbDWpVnXf4g/mQTTb+SM+++VV4hdGCNGJO3UNQ5VLxmlPP4P6s5Cy5x?=
 =?us-ascii?Q?4FTUNp3wLpa72actgS0Wsi/L1mKKRAHS8nmyMjcVf8tJekOI656YwExev8o7?=
 =?us-ascii?Q?SQsr5dJZueieAp++90o6I53N57ZmxvccAODYuVgx7wHE06yjg7SOUsAQuQpJ?=
 =?us-ascii?Q?pIqwD12vutNtbjVz238t3HgdJryimHYzh/DgmKkVKCDRbqlP1mJKdalFQOTT?=
 =?us-ascii?Q?xNtMqt1lgQMoIGTLvjHNXrxcaS2XVCtY3TUj54hGL0hQWBX8eZ7Nt6P4sfjQ?=
 =?us-ascii?Q?bTzKDegiOmVt7JLugaheBr0MkiSJq6STbT8+ltyDM9A0zTRYxMOlwSEsDyBs?=
 =?us-ascii?Q?UbYhRmyxAqfzvWD8WB7ENnbz+7za1cjMYpXsdpbpFKBXhvgbDiViEU+af4HI?=
 =?us-ascii?Q?l+97QsPosE7tz6nurHo1Wxqrb22Eo5d85tUHJP/Hev2XC+fRtLJoTL0jeF0m?=
 =?us-ascii?Q?iiI82HoYbEq2iCeQ2PNYO5rSCSBOxShM9fbdR5lmO7zMctnXzWOJA0lhwByO?=
 =?us-ascii?Q?5V23kxn2zx9FjOkKDdfm/9cc6tcY6NvEXu0OIUoa0YAzn5rsEtKew0Mu0WKK?=
 =?us-ascii?Q?zu5FbkAU9RFzlkOMrMl8HBurOg6da/jkp7OpFqWzs7o/4kch8Dn+SY42WqYV?=
 =?us-ascii?Q?9ucKKMtDdlUDam80gFYs4uT+1qbWC7PVy2+F3WojJzB20zJ+nyLs7A+1AJqu?=
 =?us-ascii?Q?rvporHgPEWmNbOoL2xNX3XIoOb6DLfPKJqFy+zrpa3Pl5txKUBC5EDFS/Fn0?=
 =?us-ascii?Q?TMI9IbUU21PQ4Fd72lVj6kOFArl8vmr9cxgBDL3lld+3by0uR9giGCAFpRTV?=
 =?us-ascii?Q?P/ptG9PG8eo9gn5Ja02qGrwEYf0h242ntPtHjADVKQ5Dy2aUFTIeNSmiB4x/?=
 =?us-ascii?Q?x7GK7A2Qr1ZPpWL2LcSwCMZ6iqth83seEe2hDkGAqhJHglNfuF7ZA27CV9Tk?=
 =?us-ascii?Q?fIei+qavkU8XjlA0+WtRQGH58hb0BrdMl21gacrTRt992RFY/TjSSbTckkPQ?=
 =?us-ascii?Q?+N8fiPY7aQaOwvpXIiRXyq08RmSLZMgz5I/m/Dhpy3cdLB33vwB1Qow7AOms?=
 =?us-ascii?Q?jjlcbmZgKewbHGpq/wZ2rcj0I4WItEsRiFZlJWRxGkyiNu9YMxdQF9zCRdYg?=
 =?us-ascii?Q?VLb5HZ0GhBtgCS2VwmfXsKxIzwBMmlwSnajiGg2mo8Epkv/PUcU4I/tUZXJ1?=
 =?us-ascii?Q?t7lbMaYxZdmrNAUFcneist/rgkfL9qgLtt7DczRKBV7ftqienztFwKO8AJRe?=
 =?us-ascii?Q?OQZS/w8T3Is=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lCsDcZ9R790pGYoFK1Qjsu+MgyYbMIlWSd8XzItkC2/MEgQf8zb8IbDSkDVs?=
 =?us-ascii?Q?08zgOoDpaRGJTMPKjBCKNsgdL1Op2nLXjWVm6qpp3qDG3j2wWyq/9c33bz+f?=
 =?us-ascii?Q?P2sVMUkDEiHfZgAYITXJWBFImuVHxs0ogDP7QbMCex2jwVXWZyeGbiByNvvI?=
 =?us-ascii?Q?XLbrW8inOYlqv64cixkoFzwj+d+0XTn/pI7BGePF+tCBi+O6sTMJew4aEWU5?=
 =?us-ascii?Q?1teEVPu6o28/9hUmRy1ShkiSmwEOm5+Rx5brNfZkWtzdmav06utWWh8auQEE?=
 =?us-ascii?Q?0bJ2El6VpNAqHrCyp1xr2B82rSvEjAFaoAU8Fk20gyF4YtFOud0Xsv5jSuZR?=
 =?us-ascii?Q?k//iTTlES1W8KnRE7Kf6OYz17CUHt8hOcVnNVEU8nLusBWDrFEJrCTSJJJjY?=
 =?us-ascii?Q?J+19It5CG/B6vO15BSxwAMZQfjIAyJm0qfkTOobJJ/paLAB/Jd6sVYTtrDI6?=
 =?us-ascii?Q?VeNt4eE+cPpapUQR6NRx3SMfK/SW4sXkb9Nux/z4ho4IYjO6L19iOCjP/Qiw?=
 =?us-ascii?Q?Rd8wEUey6/TQecGS/edAGbfIgv2Kt4yrFPMDrqtf0mOL1hzscIc8jbjX3QLp?=
 =?us-ascii?Q?j6pQEpJxwIv69BFir0XRSUMhl6l6yMfMl9h8SWK/3j4Mwq4QYAzCTOnRxsGZ?=
 =?us-ascii?Q?4LFPaw2AKEcUw7Jw8bNbb3cGgMBAUE8W+Ol70lGNKio/SVPXskTSqATCDYnN?=
 =?us-ascii?Q?QCI6S46o6i4tWGAx2fb3xjW+VxQawMl7wIiG60ZyeoUDsQy+RNxJDzTV82vq?=
 =?us-ascii?Q?XSfZ0U55ipja/1qogO87eogl+a+LlBW4DKuv52YdE1boQ9NAmqh5ueurbStj?=
 =?us-ascii?Q?RAGlQ7sFcAE4nUL9Xiy0t7IQpvvQ/LuU5w8dKyWRRTiuAq05KZfxaySxh42h?=
 =?us-ascii?Q?0nbqmtav2E/3E8Asi2x73IuA4v5YtsZRtsIbnwPnzBfSbNYdi+APMQLJqPh1?=
 =?us-ascii?Q?Xmr6Y95lBwPXWsjuT0L/8h/Y3tWFJe70ZvNKrVdWE3ZEtrPgZkhRyDVYMEPJ?=
 =?us-ascii?Q?qC/e1Os+qAzHFlee6ZVCXoJumgKfQE3B6yaycKK79RkVzvisYaxmvAP2XbNn?=
 =?us-ascii?Q?CGVIv0iIXl30AvuSXIDarTI889U2gRW0gzI39lwbgH420NKRAjpiFXbwvX3H?=
 =?us-ascii?Q?Di4hrC7Q+QG4KWbcGGpCQAV8bL3FfPVA0flaPfhCBc643/KxPV+RfENJt3HZ?=
 =?us-ascii?Q?proD6kAVGFu1Sl3mLnOHqz8fzuZx8DbU02GYl0a5cBImJkReL84iOoUV2wWI?=
 =?us-ascii?Q?VMWHh1Cf7zcfad5oo1EZZUxvKIK7wPK8AHJCwRjCY8Q/t/DoAIQ6HTboONVA?=
 =?us-ascii?Q?h6RlJAIqNzos0WR66CBGtPM0tvM8WU8089x/ybt/mJ2sFnh+OX4XKZ/9zTCD?=
 =?us-ascii?Q?/NVvTFZl3H6kLgieQAnKXR5iQazJ7e2WVima3NdJ/UXzOPyTrQfjtVmLeitW?=
 =?us-ascii?Q?QvpMTDXMFQIA8pkv3z1M1OVjzs/2ASoUASJmMdwQmlhwE1SGm73l1E1dCKFP?=
 =?us-ascii?Q?/yxbXgOcX1UG/87jp4xdIF4IcqjlWtk3AixWu9jE7kP8QGCU2StzIW0CCbTS?=
 =?us-ascii?Q?wk7CGxn47FjRbTYNdfhlxpzNJODe7HKkwsnEirnW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67069f88-b81a-4b5e-02b0-08dd5aefb683
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:39:36.5332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbRQEWDCz3zD4GtnFgtd62axkYVqcA/16GUlllLf6P/JJCLcHd/mGZCt0eYjRpPxWGTw6oBOcs8eFXz3on6g6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
hash filter is implenented through a 64-bits hash table to match against
the hashed addresses, PF and VFs each have two MAC hash tables, one is
for unicast and the other one is for multicast. But MAC exact filter is
shared between SIs (PF and VFs), each table entry contains a MAC address
that may be unicast or multicast and the entry also contains an SI bitmap
field that indicates for which SIs the entry is valid.

For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
observation of the system default network configuration, the MAC filter
will be configured with multiple multicast addresses, so MAC exact filter
does not have enough entries to implement multicast filtering. Therefore,
the current MAC exact filter is only used for unicast filtering. If the
number of unicast addresses exceeds 4, then MAC hash filter is used.

Note that both MAC hash filter and MAC exact filter can only be accessed
by PF, VFs can notify PF to set its corresponding MAC filter through the
mailbox mechanism of ENETC. But currently MAC filter is only added for
i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
subsequent patches.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |   2 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 418 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  11 +
 5 files changed, 444 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 9380d3e8ca01..4dba91408e3d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -316,6 +316,8 @@ struct enetc_si {
 	const struct enetc_si_ops *ops;
 
 	struct enetc_mac_filter mac_filter[MADDR_TYPE];
+	struct workqueue_struct *workqueue;
+	struct work_struct rx_mode_task;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 695cb07c74bc..826359004850 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -99,6 +99,14 @@
 #define ENETC4_PSICFGR2(a)		((a) * 0x80 + 0x2018)
 #define  PSICFGR2_NUM_MSIX		GENMASK(5, 0)
 
+/* Port station interface a unicast MAC hash filter register 0/1 */
+#define ENETC4_PSIUMHFR0(a)		((a) * 0x80 + 0x2050)
+#define ENETC4_PSIUMHFR1(a)		((a) * 0x80 + 0x2054)
+
+/* Port station interface a multicast MAC hash filter register 0/1 */
+#define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
+#define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 63001379f0a0..305781ccefd0 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -11,6 +11,15 @@
 
 #define ENETC_SI_MAX_RING_NUM	8
 
+#define ENETC_MAC_FILTER_TYPE_UC	BIT(0)
+#define ENETC_MAC_FILTER_TYPE_MC	BIT(1)
+#define ENETC_MAC_FILTER_TYPE_ALL	(ENETC_MAC_FILTER_TYPE_UC | \
+					 ENETC_MAC_FILTER_TYPE_MC)
+
+struct enetc_mac_addr {
+	u8 addr[ETH_ALEN];
+};
+
 static void enetc4_get_port_caps(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -26,6 +35,9 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
 
 	val = enetc_port_rd(hw, ENETC4_PMCAPR);
 	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
+
+	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
+	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
 }
 
 static void enetc4_pf_set_si_primary_mac(struct enetc_hw *hw, int si,
@@ -56,6 +68,337 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
+					 int type, bool en)
+{
+	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+
+	if (type == UC) {
+		if (en)
+			val |= PSIPMMR_SI_MAC_UP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_UP(si);
+	} else { /* Multicast promiscuous mode. */
+		if (en)
+			val |= PSIPMMR_SI_MAC_MP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_MP(si);
+	}
+
+	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
+}
+
+static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
+					     int type, u64 hash)
+{
+	if (type == UC) {
+		enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
+	} else { /* MC */
+		enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
+	}
+}
+
+static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
+{
+	struct enetc_mac_list_entry *entry;
+	struct hlist_node *tmp;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+		hlist_del(&entry->node);
+		kfree(entry);
+	}
+
+	pf->num_mfe = 0;
+
+	mutex_unlock(&pf->mac_list_lock);
+}
+
+static bool enetc_mac_filter_type_check(int type, const u8 *addr)
+{
+	if (type == ENETC_MAC_FILTER_TYPE_UC)
+		return !is_multicast_ether_addr(addr);
+	else if (type == ENETC_MAC_FILTER_TYPE_MC)
+		return is_multicast_ether_addr(addr);
+	else
+		return true;
+}
+
+static struct enetc_mac_list_entry *
+enetc_mac_list_lookup_entry(struct enetc_pf *pf, const unsigned char *addr)
+{
+	struct enetc_mac_list_entry *entry;
+
+	hlist_for_each_entry(entry, &pf->mac_list, node)
+		if (ether_addr_equal(entry->mac, addr))
+			return entry;
+
+	return NULL;
+}
+
+static void enetc_mac_list_add_entry(struct enetc_pf *pf,
+				     struct enetc_mac_list_entry *entry)
+{
+	hlist_add_head(&entry->node, &pf->mac_list);
+}
+
+static void enetc_mac_list_del_entry(struct enetc_mac_list_entry *entry)
+{
+	hlist_del(&entry->node);
+	kfree(entry);
+}
+
+static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
+					       struct enetc_mac_addr *mac,
+					       int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	int i;
+
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (entry) {
+			entry->si_bitmap &= ~si_bit;
+			if (!entry->si_bitmap) {
+				enetc_mac_list_del_entry(entry);
+				pf->num_mfe--;
+			}
+		}
+	}
+}
+
+static bool enetc_mac_list_is_available(struct enetc_pf *pf,
+					struct enetc_mac_addr *mac,
+					int mac_cnt)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct enetc_mac_list_entry *entry;
+	int cur_num_mfe = pf->num_mfe;
+	int i, new_mac_cnt = 0;
+
+	if (mac_cnt > max_num_mfe)
+		return false;
+
+	/* Check MAC filter table whether has enough available entries */
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		for (i = 0; i < mac_cnt; i++) {
+			if (ether_addr_equal(entry->mac, mac[i].addr))
+				break;
+		}
+
+		if (i == mac_cnt)
+			new_mac_cnt++;
+
+		if ((cur_num_mfe + new_mac_cnt) > max_num_mfe)
+			return false;
+	}
+
+	return true;
+}
+
+static int enetc4_pf_add_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
+					     struct enetc_mac_addr *mac,
+					     int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	int i, num_mfe, err = 0;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	if (!enetc_mac_list_is_available(pf, mac, mac_cnt)) {
+		err = -ENOSPC;
+		goto mac_list_unlock;
+	}
+
+	num_mfe = pf->num_mfe;
+	/* Update mac_list */
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (!entry) {
+			entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+			if (unlikely(!entry)) {
+				/* Restore MAC list to the state before the update
+				 * if an error occurs.
+				 */
+				enetc_mac_list_del_matched_entries(pf, si_bit,
+								   mac, i + 1);
+				err = -ENOMEM;
+				goto mac_list_unlock;
+			}
+
+			ether_addr_copy(entry->mac, mac[i].addr);
+			entry->si_bitmap = si_bit;
+			enetc_mac_list_add_entry(pf, entry);
+			pf->num_mfe++;
+		} else {
+			entry->si_bitmap |= si_bit;
+		}
+	}
+
+	/* Clear MAC filter table */
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+mac_list_unlock:
+	mutex_unlock(&pf->mac_list_lock);
+
+	return err;
+}
+
+static void enetc4_pf_flush_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
+						int mac_type)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	struct hlist_node *tmp;
+	int i, num_mfe;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	num_mfe = pf->num_mfe;
+	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+		if (enetc_mac_filter_type_check(mac_type, entry->mac) &&
+		    entry->si_bitmap & si_bit) {
+			entry->si_bitmap ^= si_bit;
+			if (!entry->si_bitmap) {
+				enetc_mac_list_del_entry(entry);
+				pf->num_mfe--;
+			}
+		}
+	}
+
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+	mutex_unlock(&pf->mac_list_lock);
+}
+
+static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int type)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_addr *mac_tbl;
+	struct netdev_hw_addr *ha;
+	u8 si_mac[ETH_ALEN];
+	int mac_cnt = 0;
+	int err;
+
+	mac_tbl = kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
+	if (!mac_tbl)
+		return -ENOMEM;
+
+	enetc_get_primary_mac_addr(&pf->si->hw, si_mac);
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		netdev_for_each_uc_addr(ha, ndev) {
+			if (!is_valid_ether_addr(ha->addr) ||
+			    ether_addr_equal(ha->addr, si_mac))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		netdev_for_each_mc_addr(ha, ndev) {
+			if (!is_multicast_ether_addr(ha->addr))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+	netif_addr_unlock_bh(ndev);
+
+	err = enetc4_pf_add_si_mac_exact_filter(pf, 0, mac_tbl, mac_cnt);
+	kfree(mac_tbl);
+
+	return err;
+
+err_nospace_out:
+	netif_addr_unlock_bh(ndev);
+	kfree(mac_tbl);
+
+	return -ENOSPC;
+}
+
+static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
+{
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_filter *mac_filter;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct enetc_si *si = pf->si;
+	struct netdev_hw_addr *ha;
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		mac_filter = &si->mac_filter[UC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_uc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, UC,
+						 *mac_filter->mac_hash_table);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		mac_filter = &si->mac_filter[MC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_mc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, MC,
+						 *mac_filter->mac_hash_table);
+	}
+	netif_addr_unlock_bh(ndev);
+}
+
+static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
+{
+	/* Currently, the MAC address filter table only has 4 entries, and the
+	 * table is shared by PF and VFs. In the default network configuration,
+	 * the MAC filter will be configured with multiple multicast addresses,
+	 * so it is only suitable for unicast filtering. If the number of unicast
+	 * addresses exceeds the table capacity, the MAC hash filter will be used.
+	 */
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		if (enetc4_pf_set_mac_exact_filter(pf, ENETC_MAC_FILTER_TYPE_UC))
+			/* Fall back to the MAC hash filter */
+			enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC)
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
@@ -71,9 +414,18 @@ static int enetc4_pf_struct_init(struct enetc_si *si)
 
 	enetc4_get_port_caps(pf);
 
+	INIT_HLIST_HEAD(&pf->mac_list);
+	mutex_init(&pf->mac_list_lock);
+
 	return 0;
 }
 
+static void enetc4_pf_struct_free(struct enetc_pf *pf)
+{
+	enetc4_pf_destroy_mac_list(pf);
+	mutex_destroy(&pf->mac_list_lock);
+}
+
 static u32 enetc4_psicfgr0_val_construct(bool is_vf, u32 num_tx_bdr, u32 num_rx_bdr)
 {
 	u32 val;
@@ -305,12 +657,53 @@ static void enetc4_pf_free(struct enetc_pf *pf)
 	enetc4_free_ntmp_priv(pf->si);
 }
 
+static void enetc4_pf_do_set_rx_mode(struct work_struct *work)
+{
+	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
+	struct enetc_pf *pf = enetc_si_priv(si);
+	struct net_device *ndev = si->ndev;
+	struct enetc_hw *hw = &si->hw;
+	bool uc_promisc = false;
+	bool mc_promisc = false;
+	int type = 0;
+
+	if (ndev->flags & IFF_PROMISC) {
+		uc_promisc = true;
+		mc_promisc = true;
+	} else if (ndev->flags & IFF_ALLMULTI) {
+		mc_promisc = true;
+		type = ENETC_MAC_FILTER_TYPE_UC;
+	} else {
+		type = ENETC_MAC_FILTER_TYPE_ALL;
+	}
+
+	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
+	enetc4_pf_set_si_mac_promisc(hw, 0, MC, mc_promisc);
+
+	/* Clear Old MAC filter */
+	enetc4_pf_flush_si_mac_exact_filter(pf, 0, ENETC_MAC_FILTER_TYPE_ALL);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, UC, 0);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, MC, 0);
+
+	/* Set new MAC filter */
+	enetc4_pf_set_mac_filter(pf, type);
+}
+
+static void enetc4_pf_set_rx_mode(struct net_device *ndev)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+
+	queue_work(si->workqueue, &si->rx_mode_task);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
+	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 };
 
 static struct phylink_pcs *
@@ -721,6 +1114,19 @@ static const struct enetc_si_ops enetc4_psi_ops = {
 	.teardown_cbdr = enetc4_teardown_cbdr,
 };
 
+static int enetc4_pf_wq_task_init(struct enetc_si *si)
+{
+	char wq_name[24];
+
+	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
+	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
+	si->workqueue = create_singlethread_workqueue(wq_name);
+	if (!si->workqueue)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -756,9 +1162,13 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 		return err;
 
 	pf = enetc_si_priv(si);
+	err = enetc4_pf_wq_task_init(si);
+	if (err)
+		goto err_wq_task_init;
+
 	err = enetc4_pf_init(pf);
 	if (err)
-		return err;
+		goto err_pf_init;
 
 	enetc_get_si_caps(si);
 
@@ -770,6 +1180,10 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 err_netdev_create:
 	enetc4_pf_free(pf);
+err_pf_init:
+	destroy_workqueue(si->workqueue);
+err_wq_task_init:
+	enetc4_pf_struct_free(pf);
 
 	return err;
 }
@@ -781,6 +1195,8 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
+	destroy_workqueue(si->workqueue);
+	enetc4_pf_struct_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 4098f01479bc..2e676212d230 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -712,6 +712,12 @@ static inline void enetc_load_primary_mac_addr(struct enetc_hw *hw,
 	eth_hw_addr_set(ndev, addr);
 }
 
+static inline void enetc_get_primary_mac_addr(struct enetc_hw *hw, u8 *addr)
+{
+	*(u32 *)addr = __raw_readl(hw->reg + ENETC_SIPMAR0);
+	*(u16 *)(addr + 4) = __raw_readw(hw->reg + ENETC_SIPMAR1);
+}
+
 #define ENETC_SI_INT_IDX	0
 /* base index for Rx/Tx interrupts */
 #define ENETC_BDR_INT_BASE_IDX	1
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 2b9d0f625f01..3b0cb0d8bf48 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -22,6 +22,13 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
+	int mac_filter_num;
+};
+
+struct enetc_mac_list_entry {
+	u8 mac[ETH_ALEN];
+	u16 si_bitmap;
+	struct hlist_node node;
 };
 
 struct enetc_pf;
@@ -57,6 +64,10 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
+
+	struct hlist_head mac_list; /* MAC address filter table */
+	struct mutex mac_list_lock; /* mac_list lock */
+	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
-- 
2.34.1


