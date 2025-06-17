Return-Path: <linuxppc-dev+bounces-9424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F85ADD315
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 17:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMBGw2Zhqz30GV;
	Wed, 18 Jun 2025 01:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750175592;
	cv=pass; b=QqOM4+W7UADxUDdQA11ZTtH6jrK7aszqwy4ttmPTlcptu4Dwf/feRgPnnnM6/U3iuj7S3FFEYM2siyrcXl+GEF+nntXKtSUFffC9u10BY+q9+n4ITzZ8qOxHWfh0anK+hMpeTuVYzuyUWGj79sg1zNDtZTtqBW8j8JPTM7jlCPUYRIA0URGUE8SlRNIRzTcVVhIrph/SiOO74cN5bzZ5Le76jKnG2YyhDwEidI/mW+I90fZl2o5GMFcSFzYqsbydaomKdxQAZ9Vpwwi4HT7+SDaTdHr61nqppldYSz5ZmhGYoPztFvfL0fl/K3REGeGK7iEZbm8R5wBFHZ83BX2RhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750175592; c=relaxed/relaxed;
	bh=u4xYxJkiCehEqp1gBa0wDge8tbaG6db973aIhfqFxgg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T7mQze1E0UcDnQfxXjlQf1xG8EhUwG9Kkv0g3oWuk+lo4zdwxX4KTnDvC47zyEhFDhllwWzCnrQ3Gz95oRsyoSHymmrzyRvpxYTx/ckDYMAiRsLVIGMcyEYiTsTRAnFpCY07LrvlrH4NoQ1tz1zprlo3UjSEHcfFL7ZvifRoz8df3/YKKzXqLaU9ivoPRHfq8xKVq8ZbxJgzVx4IqoI0qmedpnzqv5bHCi7OcXRfR3xPmVOslbc+5jnOMCq7Q3k463TyPQLzN/xCEkHy9szR2lWAApkPpyZPjp7pDq45FEDicgCMzpCgroSHQPUzLeiWF7i+a+UWUOq6LCdOJXLxIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=C7NgZDc6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=C7NgZDc6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMBGt6Lghz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 01:53:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBRWPYRRn2fSa99Z1XlLxnRwHmQGh2IbUOmPRVX4z4RRhY+hNP+UPpPlIBOgJUM6DZrtOcktcoiFGzt2MZU0BGj6Ej19+HT4VtywqggNw64Og0aMz166r2piJ7eAP8vMgil9yejMr5Vg+VT2FNgBMkRfRurJeXFTzi9cnPdjCepAA76QRz5mpsbdx0zVQXv1AjouS6m8L5D09WSJaoTAnv1pfN16nIR743jUmoeM2gc0cMqT3H4GCy7o1GbH490Ni8eipdFTI+q8d+MqAcaml0Vy1paSGWPLpafGkHxBF5RjTIyeZCFIc785MuDCHm9NC/TICmhNSQs6mCJjL0PsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4xYxJkiCehEqp1gBa0wDge8tbaG6db973aIhfqFxgg=;
 b=L0rEoZEbUn1wW1pHZJTnevGehL97FV35CBjxodXuwnMcRhK1U74bBcBDO1W3i5zjOPbt+8Us7G4AjiVsusLLKkArh4t9NO9ZZHdiHrCbFfpyRS5rA4qlJf2fD6NXBb+NhLiQSwQEdEzrTPc4JK4zhD3sZ3x9kznppi7DWkv+ZCSqf50z5WEcY+WTCStxzGB6vN3oOSNvgtJpnWNGWw/pPBmk7lQ8opxFIQWgqsMQRRbkyBomkkobGwljeA4Mz9ECBynKFuofEK61QlJPoDLACbp1NtAsFuggUtGFMD8MdpQvy7GD/MIzl803PytDQlwu3Ng3ZPkmBWiylH7jnsajOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4xYxJkiCehEqp1gBa0wDge8tbaG6db973aIhfqFxgg=;
 b=C7NgZDc6unHpcj1yLle0s/VnyznejSDc/EW0ta85yNoQWY7qb9Si8A8Tm+//W5BKK9XVqVXrCjQEMiA6BUtoAdDo19TlkrA6xKjJVvGHUS5JQIH3z7yvL+BevtiuAHOpI2F3EkBrgnmVy5NqTVImBZR2o3LgzuQKD6umQLOPbtkHL/il41oBMDpFS+kvtuSDi18GAyXC/8dg5mUkIt1qSkGjQvswJULcQ+j2wgzfTueucmZHo1sWhSIdzCoi7OmWM57gidWffBl5b8Gl0qqmztLLeuI42mTgjr9AO02inwXDmR2lw37Wiky0yWlGRVIVrNRIGJhuDUPXkjRDYM6yPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6946.eurprd04.prod.outlook.com (2603:10a6:208:186::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 15:52:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:52:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: soc: add vf610 reboot syscon controller
Date: Tue, 17 Jun 2025 11:52:30 -0400
Message-Id: <20250617155231.2023977-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 1178bd8a-ea06-4131-11fb-08ddadb700f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nrN6iagT5ZZo1xSCoUL+XbPmtxmTNlRKuILNp6Z3apcOEZzEbrFOTH/JpLCC?=
 =?us-ascii?Q?HqSN34DOF07EfJMVhcAhFkOHLXJ1NQ5n9cnbjCLWFSbf41uaLVjuNds1/TfA?=
 =?us-ascii?Q?ef3jo0BjjL1WsDxSsxgC1UDAPraE4i10kLcmitH68Mn9WB2jsHpXw3gh9YsI?=
 =?us-ascii?Q?aJHg4V/L2vzNEIIo5LqrAWuyRtQfulzhRleR6tzO4FcBdClm+MAt3g65ho9K?=
 =?us-ascii?Q?+bnGXdTNlB3CoUOQJXC3zKYUN+iIL1XKdfandMvBVVWlWyDZk5gIhjBf4W7/?=
 =?us-ascii?Q?52AbSp2KhMyOMWQs7i6kvIvE9jcBTuUL1zFHN94lLy0wfWUyR2ALwipGQmgS?=
 =?us-ascii?Q?FWQtW903xkaTMBlWPOeEqOM7oAADWEnuNUyAA4ZJgonOyiQpneWgLSnzkqpe?=
 =?us-ascii?Q?ZPa44w12IX4QlBcknEZSmP3ZtMBeRM31Ms9F3nikKGOGdM1vdhxJTLSs7aR/?=
 =?us-ascii?Q?5Xn0rylox6LSnURN6apvNNsF1r7+NEF5U4lawORsXzSNLev/c2SjDIE/SxPV?=
 =?us-ascii?Q?UfhN0GNaJTQag03AjIGAdGOJmLKe8nNOmr291R0nwELmiyrCkYplL4XVZXZz?=
 =?us-ascii?Q?SfI6XdgD+M7BnPkirSSzJn2gry7VTg/1OPVQ+qN18OzZGHsgFbHpi5lUQ6Hd?=
 =?us-ascii?Q?FtIyrryugpZTFUmw0XzPezbZXY6EqVOp+ioldm71MaWKXW5pKvdZ6GnCo50D?=
 =?us-ascii?Q?Vv80Xo2Fb5NIn9UDjD/AuxIzzpNFZaqdvQ5HKK5jolEGGRfPs46wwEceSuXT?=
 =?us-ascii?Q?ida8NNB4tzdRiFBWHxWITsrWlhhQ3pV5CHL/LLjvPNsCECMK6bcvmFL1Jvf4?=
 =?us-ascii?Q?e39/ds/P2FvY0gL3pyUNcdYJZRJ3e2WSWqoqu6TqxZS0E4Flhh4rKohrYky0?=
 =?us-ascii?Q?LQCjj1wQwhK6BBWMZOC/Vi6gm1N4UW7DdkhfU+FMt9qqTs2PY0oSmMP6P8Ku?=
 =?us-ascii?Q?fwPAj+oTHXjowg6LSbFbI6//9261/vpb5cZQfcVmtaV5sob4eTJVR32fF8lj?=
 =?us-ascii?Q?a2XZjMyApj9sOa58rqUcNQklnpxw8pOIF3Sx94zVAYStwwc2M0sXoxbFqKk5?=
 =?us-ascii?Q?EvX9izsd6pdsuUFdwdbkv86jEGdPUxlN4DCzEVITMJ2tM2PZdcFBAOjR/Krk?=
 =?us-ascii?Q?mm2YsirL+rbxB6jHGCZKRd7W1NCE5ECDoLK4HB2L5EBZOSqnN0TBpjV50330?=
 =?us-ascii?Q?zmjwaAdlBjOfO38ycYzNWvYXB+Q0LB66wXLzCsjCf3On3/jFMasf/RL5Kxfb?=
 =?us-ascii?Q?s30gONG7XuSKv1UBAnGnB2Z5jbWpg/TgK6U/QlfuN5Cum9F6QbPjb+MVWcBM?=
 =?us-ascii?Q?adW5XTGjuhPH7Fz4upsvKuEZL3jFlEkqEB1gBfOLMcKSTBlYibn5lXJG+rqn?=
 =?us-ascii?Q?Ryhl5c9x0VijYRkVQfGQT8zRqf0ELs8i0LOSKL/alfxkQrnBxEvlbzu2fMHh?=
 =?us-ascii?Q?4WINz2DprsG+auspDj92XROMwuxQAbhF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ycCIu096MOJMCP/95dViIi7zJktX2tvo8LxGfNwTEO8iX4Jcr8tDTex2u7L?=
 =?us-ascii?Q?91ljOIz2gz5KrCGnVkmUEP3AgSbZMeFdcSZppwjakTtQwvAmXjTxVjZ/cwvm?=
 =?us-ascii?Q?LEd5tSNUBRtBP/I5nYb2QVS7EurshQDSeO5Phi+J1Dmubfm4Qll/nidE+Q8N?=
 =?us-ascii?Q?n4T2vjBW0AWdo+zuR3wgFOj9JKV7+qHqeLq8fPHRSIVmuIrfWQqFJHpr2uvf?=
 =?us-ascii?Q?XQtIq0DyE5pXmGWe/YeKizmaPxzkegkpkCEcnWEhi6QaLIykIYBzointd8Zn?=
 =?us-ascii?Q?R3k5Jde8XS8K998pBIIhNGSY8nmoXOMcKd1Lvn/c6Ieix+mVSMfz90NFxB1r?=
 =?us-ascii?Q?bbPAVq4y/rx3Xn6Q85boeeaS54GgyQc8t6shWWECtsAWsbBQFteaY/BfvRyO?=
 =?us-ascii?Q?zjilhj01HeLxyWvm+rt18fSck7+lfx6arcI0q4BLjbTxzBVv6Bgw0uRe+ecy?=
 =?us-ascii?Q?se4UcII5Cxw7gwC3qzIVNe9pP1ittWr+SLYK468eA7/gjy6btZuwwTaD8yrB?=
 =?us-ascii?Q?aSkpJ+Yk564XERt/cAVr/BRpwaz9sROjynCLePwp8WIsziG8XyXJo/qF+dF7?=
 =?us-ascii?Q?NFsSawuotSc4tXAEd3Xfu3m5MyTsrextBTB6sS0TiIqVYkVgFdVy8bTAF16i?=
 =?us-ascii?Q?lwMqGG6QN5rlCs8B5skRVwwpZ6HQgQwyvJpP4oaeJchtVkOBaLQwTJeEE55e?=
 =?us-ascii?Q?kqiGb9gksf31zo6mx9SGIDw2B5OHa/HXEhz6oRFYcCW/TZ3JSnQeE//JTKoh?=
 =?us-ascii?Q?4CSoYtuTT7Z2AS/a6d55oXhikAAt0vetfkMf/OcLFzT0idoI71NP40qGLwkm?=
 =?us-ascii?Q?YE8tPLS9WfLVWSA6BpLph6PJ+pi8vlQAeM3+Rli5ALNz+V1BWnyGl6BdF/pA?=
 =?us-ascii?Q?jMa2J3krkHaKGU+v43eTqHWXdjKHGQHWxnRrUPFBZ7ZPaR/xBltS08q3w3sC?=
 =?us-ascii?Q?2YfPk5pYDJ2cetG+eJEJlblVmpK6tscPnByOhdyLVsUzKl520UxrmFVj/wHo?=
 =?us-ascii?Q?iv83uoz04wo7ehP97CJhdCulYPKJ//fA9pi249vZzE7R7G9kzl2kOZj4uNpl?=
 =?us-ascii?Q?4EgItW6+GsetMmKt4a6AurBjWuN7zOeeSn4RmuuytydtIqs/7yF9wjJExE3j?=
 =?us-ascii?Q?1flp+XSIHQ5uAbRCHxlUhPjWPnyxLG0qSDBkmZWzqvydbHHNSQATXuuwfJlU?=
 =?us-ascii?Q?Q2c0JYW1j8dN5fkdneMHvryy3h92T3416ZzLUyPJdlpwaqLlK6Qb7fy6UDzi?=
 =?us-ascii?Q?qGMizYkeZKFS1XIrCE7aRN/z/dSN4v5QXYdUGtGKL1ZUOJ8WJUq89GVIhmjW?=
 =?us-ascii?Q?4TT7+DcR8LXvXJFD7/MCBw6JQdT06gFk+nxe6XkZfpvXT6nFO3LKnWvy2d/e?=
 =?us-ascii?Q?yPjJtz2KvdXB2yZ25TnVTvUObpGWBb4wSZeNqUXET3Zarg+jKv8v1qsNcmJd?=
 =?us-ascii?Q?03e1WLG3DmoqFf00aI6GQcHuBRFUmHuaM+A5CCmxgYbglS+ggUKKDyuMIYYN?=
 =?us-ascii?Q?wjGXnACffV6JpMHfGRlxxCEe14pz9VyPPxaCAiRt3kwW3pkfFalSobZ1Mv4L?=
 =?us-ascii?Q?xV25/S69LQzRWGFEGdOjmU1QGUOZHSmaoMe46Rez?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1178bd8a-ea06-4131-11fb-08ddadb700f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:52:46.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o8Lmb8UdGu0mx1Y42mWB6lc4F2a9Qxn1vHi5qsXrsFqjsxlx6K1O6M6s23tHCoLN1AM17Wa4zq7iyqJJVQojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6946
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add vf610 reboot controller, which used to reboot whole system. Fix below
CHECK_DTB warnings:

arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
    failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']

IC reference manual call it as system reset controller(SRC), but it is not
module as linux reset controller, which used to reset individual device.
SRC work as reboot controller, which reboot whole system. It provides a
syscon interface to syscon-reboot.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- change description to avoid confuse about reset controller.
- it is legacy device, more than 10 year. So try keep existed dts as it.
---
 .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
new file mode 100644
index 0000000000000..cb8aa510a21f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale vf610 System Reset Controller (SRC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  IC reference manual call it as SRC, but it is not module as linux reset
+  controller, which used to reset individual device. SRC work as reboot
+  controller, which reboot whole system. It provide a syscon interface to
+  syscon-reboot.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-src
+      - const: syscon
+
+  reg:
+    maxItems: 1
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
+    syscon@4006e000 {
+        compatible = "fsl,vf610-src", "syscon";
+        reg = <0x4006e000 0x1000>;
+        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
-- 
2.34.1


