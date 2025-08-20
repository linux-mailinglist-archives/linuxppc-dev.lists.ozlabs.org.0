Return-Path: <linuxppc-dev+bounces-11158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59414B2D27A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 05:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6BTP1zG2z2xQt;
	Wed, 20 Aug 2025 13:17:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755659849;
	cv=pass; b=ilyQA1IVM1AyCUQu3zPrJkzeZMWGao7uyzTKMAZtknh9EV452ke0i9zvFKg88RvC/f8hpudCZ5Dz+PHTCBE/22LGL1JVnbx80AELDU4+GQ22W6IiWstRRNHRi29waLpdgzIDypaspcsRk1PeTfT7YYW+/F8pVPwlxfCIv0+eiPxqJA+xNgI/vKpil3exgFMU/CISCEsZBSgMsuFA9OblfsS//itjYZxLtY3m3ZrpcSBWgVv8teebGt25nawdS21ug3/to5sGO8kYtir/2bM5ZOrCcL1hIykBCHacjrU7yLUygpBBhJmy0RWvi1kZvn/jyJJ7N33mnmp7k6mn3cCH1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755659849; c=relaxed/relaxed;
	bh=3Q88szJlLYUPSI/0L3OmlhdvMemLnYRyhrsv5S5LGl0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VNsxsjeA9GHL5K5/sB2s+fM5Hvx0uW0lxsJy89nDssTxkX/J8fk1Ext0lRpNKHidcVqwuk1BaLfdLLxQdueKDTvekhrlZE7vARnuY19+B95+AP1tsm3hMmd/1fB2rnOUs5tVnNh8cR/6501puQiSC5m2IsVFpNQnv2fMSF19XDI5FkPYwD52Wj+aS/TAaR2U6QZ3Ud/eIFJmsn2qbAeSTU4iUM6JTd6ypVOZP3k3yA0xoq0VNO+IrB8YU1IT+kF6aqKTwzog4Upzm5iVuzNPxi7vZwfarl4Lu+OCu/8QrWD+gYF8bM6gl+ZUna9LX6tXkMRHZo0CEMrJADvS77i0XQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kmoDEZd1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kmoDEZd1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6BTM5nnBz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 13:17:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbed6AMs6zRgnmF4VvE1H32kZ568DznCtyHKl+jkI0DsPSmYmgb2as/UsW22kR+WiUA3gqQY820Cbdv3fs37nUBc00vWtNSc7PEbEylw82WhxcAsGnLkx1NMuY2bEhExRpwmcralkemIPnYSp4ccaDqlXzjdLeBp7PgQ2g+UB7EjVlm8GLzjNkkpj/pzuf5DWLt5up8M5HzhpKnvLkwfBXs197Iisjps5wFI496nyHsAQ/kmN2CxO5APenq22rY4WEOFo0YRON6knxGKQN7uCb7J7Ka8MxOBilVI6QJo/OoBcKi9D9QiCCyjWXhBe0gzMPNOQy6pkkPqwP2VBP8Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q88szJlLYUPSI/0L3OmlhdvMemLnYRyhrsv5S5LGl0=;
 b=OxbhR0Edh5EH+wU/C/DXmaldq3I/K9srgMYeVYG/c7P4n/E2oY93hRY4N4lPq5FkuRvAdWZAUQtlGV1VoqECh0ImSXEaLeVNzcnbSXSVzAl1DEg0LqvNoPwBfDsueRUk9AszBZBOmW/a4Tx8Uq6sf1QzbolstK7eamdZjb3XRzAh71CmsM0mxAslHc6SxDVoZbD8UtzoelXBBRGk0bUEvxY9ORxTeehaXlIazxPoCXPghwz3cCjBXq4lOMFl2xsroZVBpV3S8f2O5DxgRhKXcHazQm9BQSN1UyoLUvWQHYXQ6SZwCWA+FogSMkJdrvRXfr3sqbOKdSE8cOyRvLMWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q88szJlLYUPSI/0L3OmlhdvMemLnYRyhrsv5S5LGl0=;
 b=kmoDEZd1oSc8hbQKegQdRJUSVLl4/gE6HBNZnXXpHsrUjmPPUvY6nlqZn7SM0Yl8QHsFHWN5IuJgJmOFyMilXlTulah8jd0lj/3r0zw8v01bmhYUiFUnItidPPLIG6n+Ld7Uhj1zx1N+hR9YzRjub+leEF/daVtaZBrWRchk8hWzcnbtlsnFLE6QTJE04qqdQstimxbhaGo6Y6qFx0IUnfQv9iOu8p5Pci24wFH2oPetjXW49okPQJAO/JyWRWcRVZS8QvV2ilUrs3BR4gT/omQ7dnFO1QeAZYhRVtWlhA2kt8q/ZB+3zp0adBv7NLVTEM61XPM/+lS1WBh2GuKPsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:17:01 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:17:01 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-hdmi: remove cpu_pdev related code
Date: Wed, 20 Aug 2025 11:16:41 +0800
Message-Id: <20250820031641.2158261-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c020bf-216b-4a58-4d68-08dddf980780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wiV4jjV+CvSbivSAR7wjnHRTmkEnKW+OUT1+1vPKRf5bQRqM64ToNW7XHRsU?=
 =?us-ascii?Q?8xn/kEpga/WWCMwB0KfPA2Jgpy8eFb2XJII2mHKd+oOLy96OfENtCE2ypInT?=
 =?us-ascii?Q?F1de+RIpG50cbtCyo8+uvZpEM1+HuO6YtjYo9bt2h30BQFB7AObfrn949f/V?=
 =?us-ascii?Q?2q67xNJiHVsV3OC8F49ZD69OC37jajDFGaAZn0SjCKN1vUL+3O45GySLDFmo?=
 =?us-ascii?Q?WWp4JWxETi6JrYr8ZjR1g5TxAQDmAts0AHnBmRPIHKA30Yf6cJvJP6A8cO1h?=
 =?us-ascii?Q?9aM3bjz3g1tpILbffvGqzH7dEz6t3/CgRDkvKQDyzQg3ORfaCtYySlpf2tXK?=
 =?us-ascii?Q?WSCSidoJK/OamUKrUqxgJfCViVCyDp9fKswbBCCNQplT6O58IFg0NOx+UAPE?=
 =?us-ascii?Q?ZkNLPuHBcJkvJcZCoeoWyER2Ug1PRKwEjgtSOHdd0dHSOr25uPuRTUz5kRkp?=
 =?us-ascii?Q?S58T9wAMfOlDCouH0rVv6dEC8OU79iiQflJ8YRKO7RIBguvQEULLDTJVqKpJ?=
 =?us-ascii?Q?R39hQb5iPIsltOghhDGl7OpxCGpJVpgs1YITDGMdGyb4a9aM+Kjal/+jJFqZ?=
 =?us-ascii?Q?lPcwMho6wD52vOytLy3daREYnvMViS9iUuOp5CX/PAjp9vqJXs23QrP/5sUP?=
 =?us-ascii?Q?A7xuKbQCTxtb9RKnnn5ZYCJvBbgH+Rp1jehbrQwkjpo20LB4ceoTUASkQymJ?=
 =?us-ascii?Q?q/5xVitSIHI9PjD41bjr+LRxsntOiz6KTTqlhkPacHghEMs8dlnxdRxkvmUH?=
 =?us-ascii?Q?f98QQrd006V6hkBx0l9k+SO7Rz0etT8Fsj3xxDKlUWFwQSo074Z+4Uhe0ToO?=
 =?us-ascii?Q?cApPH2ul2dNg7mnXjNDDIfwz9fSjJJIaC/hVe8Qc/L61HG6lC2Gt6SWUsb+4?=
 =?us-ascii?Q?OXzpw5+OZitYGRGnWqoV9SIP1kTX7fyad3TthHpKW3SUqBghgcT7loov5PDr?=
 =?us-ascii?Q?XIdZuJZ4fp297Czhms69cO4xtT54uZRH2I4916yPT5iRJJP1sMrqLN17Wa2/?=
 =?us-ascii?Q?x4FfuOs2WZgGQBaAAxXOdhCzrFCXObVoarKCcv9Dt46YfslqIV4qopckjsIK?=
 =?us-ascii?Q?dpJjc1SqmMnkOYQhoVNFB0F6m/mnJxgFgNUx/hg78teJA7Rrqozcon/sAjkP?=
 =?us-ascii?Q?6bfRScBIzXyiOxNKDhhgPF9NMutihsRkmVr4uxzkJzsbpARprqpaPAGtbYan?=
 =?us-ascii?Q?xZ1Zf4my6RT6ZeYz/EgMrdN2C85BDHPpek+3ly3iaLGlvT022i2ceEHN3CTF?=
 =?us-ascii?Q?dM2kuA7/xZC7vNKmvRN+Lplf/D6ezMBES0QTnsgi4W4ta3tBOvNbjllZ86Yg?=
 =?us-ascii?Q?O2L/lUlj0Nc1LLRBWyjTUOsFw49hXg1ZSf3tSzoeArlJqP2FAmcsbRS8Tso0?=
 =?us-ascii?Q?hMyDg8w2nWuALK6In9dDSpVuPED0Gq2pwXyA0qkAx8OlMioIebu6AfkNIFtM?=
 =?us-ascii?Q?4MHsjm6WVT9hEXJnQVg69i1f0SJIOgzrbCutLjLxLKcOeUkttK43OM2fS6zI?=
 =?us-ascii?Q?6gZMOgIom9tgT8E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eP3isa0HyIUFLGUz6glfAgB9+yGgiDtiKQe/i+WyGE05oMlyZOFTxr0D7/y?=
 =?us-ascii?Q?QfXA4b5iUPBIIH9u8+Ss+U1ggIZ6Z3NEAv49nSiRU2mj5lx+LBkOfkazqQJe?=
 =?us-ascii?Q?wwniQ1J4q+o7JkOXnJIkcwFgBYq+X3pBwMueSd3j6sM8KAkfKND0WPBsXeUe?=
 =?us-ascii?Q?i2KCkJD5WMxp7C4rcEbKUMxluUsHu9fZ9Fz0b5yhN5YwMwO9YGTZk4njOu9h?=
 =?us-ascii?Q?iwu1bQv3rMjMd8pKT3qqMNGmeLC6YUNFX2OhoOxeAzSJwXYCeZPE55lutllY?=
 =?us-ascii?Q?Dp/7UHkJs9qzLfc84Em2299rjD9He5YgfGIwPJsMB3WkqB8Zl1K14TircYxs?=
 =?us-ascii?Q?TTv6Q0mXjDOlkeQOm3j2fE+MgI9xj37TEn9En08rvvpsJK5HcQMK3Fk6ftFR?=
 =?us-ascii?Q?f5MwoHqtQH4fO836yzaqgiItHc4IhdnGFj9UHXJILdYRC/WjAZlPg4Mb56Q4?=
 =?us-ascii?Q?8YksWNPIdQe+1nDVfHwtYo9P2qwN3i0NpUMIn4C007e/CTekH50tUoC71/41?=
 =?us-ascii?Q?OihY8vfwfIn58eIZ1rYyFn1g/k9XmMG3DQkrYR/AwA7IV/tbNmkrd2TspW65?=
 =?us-ascii?Q?+V1adG6otLEYJ9FLKw8YF0rWjlIGTdMfIyGrGznxLs0GSDN8HXcBIS4FRech?=
 =?us-ascii?Q?FquEM2kNC5c/K5VDvsqNNWy/ijagPh1NEBFa3hYYzP3iD0Zf87n5KaJ+r3JZ?=
 =?us-ascii?Q?ZrwtAmDEWsGhCVKkeCVv9zzfU76ckvzkORXXlNGEqpERiPEALp5/pd43taRo?=
 =?us-ascii?Q?/MhiOba24zSCb/x/B3YwO+V0H0WYNITIw+M+VlfT7iXi+Q9F2+XpOg2SXCjW?=
 =?us-ascii?Q?ElEL2iKR+zS3keSipsHgSZpUitJKA9Q5qv0b9Hz38LE8PT07E5c+dNQOehAc?=
 =?us-ascii?Q?ipF7u1Ysxoc/2BtV5ouWoypGQKDJYl3TO0eclsLA1QvJLyOzktKBix6boX5e?=
 =?us-ascii?Q?Icu3C6hXV8JRBklFQN93W6Ov+Z1vlc23Jzk14g9+nBQGqtfqurnhuWOEG9qm?=
 =?us-ascii?Q?SzpDGHvTxaqtW9CLkUlm9jrJZKzWFD3E3JDu4AzxzJslxtcV11FCrpRGnHoN?=
 =?us-ascii?Q?oBTt92J16ub4C2ziy/iwd+qYch/bQ+0guFDSIsdOUJouIXbQTvk8Ak5RAFfl?=
 =?us-ascii?Q?8z/qYkArQfEtW8StxW3+gA3aLR4JNrY0nM2KUJxLh4ORqmg6r+tPlftkp400?=
 =?us-ascii?Q?plhYhYvPl6OJfoLMPGXGObYXfSXzclzPD/Tr2yGo/u105E8FN7Eo12QZIcf2?=
 =?us-ascii?Q?rmURfl0JB66x6bRO1I1R2TxZyDdyv2jrXulb3w9RCX619FdLHoM3li+jIsBa?=
 =?us-ascii?Q?rI9V7S31r04v4/AwlvU3ztRzI443x7cAIw+b/rs910TdPMobcPS+N1cSUhGj?=
 =?us-ascii?Q?iVtaSH55tvycZf3yMP2kH6opIgI/Px4ey1aXGJ0nkFw1qz51YmnrV7UBuv0Q?=
 =?us-ascii?Q?GxN20p3euklOFhbZCENk3c4M820yPewX8oX3FJbr2+7HbuM1nENN78847lZj?=
 =?us-ascii?Q?1LB0SAaUrhNdxNeZKNxRS1422exbX4+nJ/LNynpOVsXmVzfi0IwTBjJeeaY4?=
 =?us-ascii?Q?mv0SF47hUA9a+zNtyLqviKvOfEVML85ZeMkJiynC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c020bf-216b-4a58-4d68-08dddf980780
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:17:01.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llaiY6FVgLlpeGYEKN8nXbw/1VPgA6iuNawxVxdpMRdOJgJHKiibO7gJMq4xS2Q9atI7wTFTyKXXCMWb0EK0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If a defer probe happens for the cpu device, the return value for
cpu_pdev "ret = -EINVAL" breaks defer probe. As the cpus->dai_name
can be replaced by cpus->of_node, to simplify the code, remove related
code for cpu_pdev.

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-hdmi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index fe47b439a818..1115189cc640 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -101,7 +101,6 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	bool hdmi_out = of_property_read_bool(np, "hdmi-out");
 	bool hdmi_in = of_property_read_bool(np, "hdmi-in");
 	struct snd_soc_dai_link_component *dlc;
-	struct platform_device *cpu_pdev;
 	struct device_node *cpu_np;
 	struct imx_hdmi_data *data;
 	int ret;
@@ -117,17 +116,9 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	cpu_pdev = of_find_device_by_node(cpu_np);
-	if (!cpu_pdev) {
-		dev_err(&pdev->dev, "failed to find SAI platform device\n");
-		ret = -EINVAL;
-		goto fail;
-	}
-
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
-		put_device(&cpu_pdev->dev);
 		goto fail;
 	}
 
@@ -140,15 +131,13 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 
 	data->dai.name = "i.MX HDMI";
 	data->dai.stream_name = "i.MX HDMI";
-	data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
+	data->dai.cpus->of_node = cpu_np;
 	data->dai.platforms->of_node = cpu_np;
 	data->dai.ops = &imx_hdmi_ops;
 	data->dai.playback_only = true;
 	data->dai.capture_only = false;
 	data->dai.init = imx_hdmi_init;
 
-	put_device(&cpu_pdev->dev);
-
 	if (of_node_name_eq(cpu_np, "sai")) {
 		data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
 		data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
-- 
2.34.1


