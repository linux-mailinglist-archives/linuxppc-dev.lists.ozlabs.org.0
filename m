Return-Path: <linuxppc-dev+bounces-14496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E54EC8850C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 07:46:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGVT02tVLz2ynP;
	Wed, 26 Nov 2025 17:46:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764139572;
	cv=pass; b=fQzmzUSFO5KLuMXUq7tDQEzzemeVIWt0DQ+Cd3CbdhVOwskEoq9wTmLJvPI1RXqdneK4cxIpg4NVrYEvOnM4LZX1he/+gL0tAhvxQ9n0GO2wpYeDRjlqNHijTOS6ZFXK+svOJqlysCP96jTbBaLDn4QL1cT0ynGVw891dRGoXtpW0fDM4W69jl4p1JvVTGBjjbBzy4I7LB4CCfPkpLEhJTxdWgV7k962VYXmfcmyEztvwcQx5LfVFm5xkyCYTB/CB/zjr10KKe3oUEP2NzfmCfDJfWBa0d66p8sLt/NhyTkv5LylQ0sVWLgYHeX4hWNUU99LFpM9PuldkuRAZOrpfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764139572; c=relaxed/relaxed;
	bh=4VZReBYOw5JcCk907aGheuu3Wr1v14n5JSIn5RAn2oI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UAThcpgtluwRQx/7d98f45SGP1QQPuFecCDgkWz2BfdZVq5lLVNNvfvPuJmkCvBe1dww2Xu/ootnWQuzOp3dBCV8nMmhW1hvFjmyZv0sLc6M8zXsoqodi7YnN2NhcPdiFQD8m821VoaUgRjUlzAROtxeO41cawTECVfz2sCbTqvltYptYAtpsO8JJ/C0f/WBKVgOlm4EDN92oQtgVvESGt13AITql94mCZiEA4j0qInRvZiQ78vn4eqHd/GFrhoRx0D40/XhHZyOsnFEfKC95opB1csLinzrh0v3qr6IPvE/maWJJuKMM8mBCSlHeYcsUnYgpDJ4oBc2wFXx7gDytQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eiSUW4u6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eiSUW4u6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGVSy4TFkz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 17:46:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4+u9Jj3PlYC262nfRQs/j8SGH015JxBkQVA2rkLoysiFgwhycj3c/LBa0I8QUj5Z8l81GAivWjAO/bmgwMA0r3GSg4Ba6SYKi3yBaIQtObsnsmqxg42GZdiasR2FGX2782ALiJHD6yAD3sP72H02ZRcu5P6vJLFi7xzUwSv4XRoPHSmf6/m7dTxrQs7ryIioCiBkFk7XhVDEvaH3kmANWb4xbA3SnEhH3iazcA0LfrabJARVa9l11oMa9yNjd70blWsRGf4em0z5foQONioavjzlqscF1TmM3e/jSrCJSpr6IKCbIqUK2aTC+fa0aycBwWpAHzvsdOMVsyWu77L+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VZReBYOw5JcCk907aGheuu3Wr1v14n5JSIn5RAn2oI=;
 b=S7DxvlsXuyBPqiKwneZ5L0GV0EZKYKhdGySl1tQag9DEJU/oWVXw8Ol4auoj1EH7oPw1WIwbtC+QrWQl5NczXiWi5aHxXyNpFwYMj5qU84niYwqLDC+muI1ORqs6ZGEpoYOcLTCEh9jw+rXh1Hg8cUN0VgupjAzr5kFqcyXAZw68XklMkhJpr1Vgu0CCA8gFL+YBmo69FO5bNYaLelaXxRMgk294raFj3y9NcHJAaZPzXOpP7T+e2b10CpX8Ly94yXKmrrih71RiHRT0jSKZ3w/NkiukgthIHAyuItXxdn9u5wShqBCR5sp9vXrT05sSv8C85s2/qJdgh62BV+LLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VZReBYOw5JcCk907aGheuu3Wr1v14n5JSIn5RAn2oI=;
 b=eiSUW4u60/wsdhZD5YcdsDxe0YKc+PhE0kIKIA8kUiq4dFxc44QyWurxeID8i3KFB9NmANAWAU2n9Exzkvy5GSPSLe3ozf12ALXeHFIaasPaqbBksrdw1tYXyYrveh5xFZtqs4fdOemQx5UQnEqlrIaKmu2cZ5cAMXHKnq7phYR32CV1Xx0pLu8hC1pI8Ptl/8mCcoMrlYkyCBx2zmSiLGf0HSvgNXQdY0+Gjci4ROySXRrvFoXBZnLG7Rpd1UWQJ8XCeOsF5juugbyB/ZyMwrgZvqJKs18fj4nB1+dpwsZJod0Ruw6ykBr9+/i3lJ+rVXR2YmiQt2lamjBOXTuy8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB11347.eurprd04.prod.outlook.com (2603:10a6:20b:6c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 06:45:44 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 06:45:44 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: clear the channel status control memory
Date: Wed, 26 Nov 2025 14:45:09 +0800
Message-Id: <20251126064509.1900974-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB11347:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f356aa-f38c-4bbb-1630-08de2cb76bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qfN5p9UBHuxno3FbNC/CwvJVlo7GrUfJvZIpErzszu734CKpuI2bkyqeU9T5?=
 =?us-ascii?Q?bTTF17Ygb6Z7s3mrvFwiIwzI9YWqo/cgVhpk6bzuClvvCKP5Ao0kAsGsyjms?=
 =?us-ascii?Q?oMWJm6aShsxYw1LlrhhqrAizB3GwdfY3cHhXG5VlSg1Awp+HlFRKmm2uFVNP?=
 =?us-ascii?Q?Z3r74JXp20S2Bxlv9YdWKz5s/FGfPboo7SDj9RojcZ+uU5VjB2e1enoWxGkH?=
 =?us-ascii?Q?n/1Ciu8p/QU8519ovOMqkv5GDFVJ0seZfaArqIm8ppO8aNmJ/7/d62ymB5S3?=
 =?us-ascii?Q?zfBzxsPa3NZiQoqg1KaDc+XTvRPdLazJcEaQMNqhHB1KaqLdi4mPYnAUpLba?=
 =?us-ascii?Q?cMHHahd8OW7cW5KkFKoBqEZJkrR3Z3HkYgo75wvONA1T4orw77o/78mjqCPa?=
 =?us-ascii?Q?dSJpHdosRkYqbGAvIcK5E8wwsKLokygz3mpFJVuPCu1X3fy2FQBKNicjZeHM?=
 =?us-ascii?Q?4lslMrSMjbcZheb/sYP6RlnE3wQ3o3COgDudaFJiMXlOb5MY8y3wioXrzhIn?=
 =?us-ascii?Q?z85dGC7QOsmHHypc76z89Mmvc6/kBbcVolP/L14AGKIppd6sxhRNzu/ZbOEO?=
 =?us-ascii?Q?ITnLzDJN20mA0mDJdYP+Lrnj9WUoF1HBkkWT+wpTd9XeMeI4AxI+JIF7QHi4?=
 =?us-ascii?Q?PlPEKB2Mv42jfI2uATrSFvMnse1krvrOFaYQ7pNtJQrQQ3QDzgWdIF8PKak4?=
 =?us-ascii?Q?B2o3QtW5Y80Um3z9NFeVBE0Koa9lGMsVsXplmVzOeJSXJGfN6L9gPnzQVJIY?=
 =?us-ascii?Q?av2WFnsQ7FB51DvlCOQVQOHlvtdFbpBM1zo87QoxU+mXZz/EeJ2d8s6LphOg?=
 =?us-ascii?Q?V2t3YWnUzWMJqG5PQgFezsKaZvybFs0u35h3Rt3LOQ38qPCDB8doAJmIOQtS?=
 =?us-ascii?Q?ZsEES6xRIUxt20JSqJMbjjE8WQszXBi6h559sdN6lZ+Ci4lQyrmbJAeCtU/I?=
 =?us-ascii?Q?Wc6V9+4CjckxGsaIbieECracDa6EJ+f8FmSNigUNAHqkvjrxPXD2FaydS4nd?=
 =?us-ascii?Q?z7AUHS/+0bEmNlE9GUyfhos5N8lsPcFc8B5zKZPaiohIXMaBE+llb2d88fTT?=
 =?us-ascii?Q?WxE4LMEOsAyruQopTQy/72WTzehMr4lwRY89h/KDL39PZpJC1wldIKU9Apan?=
 =?us-ascii?Q?wcTo6K4LrtnNTBnzgJeg3AmLnSU8TT+bIzQexQZQlJ+2eRZNTObwNaqIwxLD?=
 =?us-ascii?Q?kzglcUU8X66Mvlx/94YIiYfs7Igs4+2EkOoKKEgJg5Kg39DDpmID6BkiJ0XX?=
 =?us-ascii?Q?p2cGN2hsDwaqVHOa9u+OnPow16Bcp4v2IMcW5w0b09x0WGzQkx+1gNOJ1SRc?=
 =?us-ascii?Q?NfNuNA1Z8il2Arbu40SOscZGkhEywyjYWCdKy63WlJgJzzr0KrSveCSrUehg?=
 =?us-ascii?Q?p7GrKomzze649sJkY/slui3DVBnbjAZHkiq8mNNh7n9Ityal3Paw0fFFJSky?=
 =?us-ascii?Q?56ghpFz890eveMX8HT/3Uz01DSssozCCFC4crjThYDhGde8G/MoWlrVbAoVj?=
 =?us-ascii?Q?QA9lx6X+OmKsQHoUdC7YHYAqcqa1rs3DrfwGT4y1W1FVzjkJFxXmDqnNHg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JFaEnx6lncUYbWQiraSx6lAvC2le3/PfmG9uQZ0hSN4MOYT9N8+VQaRVBs2b?=
 =?us-ascii?Q?UYTadzupwTnhyDO8T4SjVVveNmQIRU9INee4jjylMP8IR06kLsOczDeiSbhB?=
 =?us-ascii?Q?rHnCogdDadT+dhOp4f0Y3FZvtUhRLlLGNsnWHes0qOoBBmbKPrpc36DJhN6F?=
 =?us-ascii?Q?J2T6bYFGY4Xv2sfs9jeYn+ggB9Xmz10cCTihGPWhgDEDmGSPILeXba8PzvFr?=
 =?us-ascii?Q?x9RALmjDImI+03eJgbeAa9vAP9hinio83QfJiq3PyZR1khPPynuFTHBHO/Ev?=
 =?us-ascii?Q?0hqbzhMWnteHMADJ2yBG5+i01kDa6cOKIymmhnlPCfgEhz6ovfp6QsReI+Z1?=
 =?us-ascii?Q?tj9E/CTQVR08RXgWO3UhmsyhT1t3Nko36CNzLvCfXxvS5icTUTarjGHpewUI?=
 =?us-ascii?Q?smyXg4r+xHLh0DZMfCXAN5Mf+TJrqsPcRphuCuzhu3We/cSU17b0UbQzwYOc?=
 =?us-ascii?Q?qO+OKmAff0XQW/EyUI1PfT/zNqjYCh6yNrhyOCi/H94VI6UUGUoP0JmAQe4F?=
 =?us-ascii?Q?fmQXgjtxmKvpjBPzyP8UQ5LDYlY7PNYYI19MREyneWwk+sSsxlViGArWmHpm?=
 =?us-ascii?Q?Dwkwl5LdLObXA5pDGUdZeTxbCAydGTIQ43sHnXisaXudi31Th0fxhduu+O0n?=
 =?us-ascii?Q?zCj5eLgm7tccNkjd1nm3h6CONAzFjLgNwz6y3IJPs2JRZIAujqRMWJrskyMW?=
 =?us-ascii?Q?xD3dysZvR2XXQ7gPVynVvu8EVewUEDTMAIVXq7WeVHU8DN9kCeqfxmCnM9mg?=
 =?us-ascii?Q?yYrC66HJ62DDQIVLAFNinzwi/LWMjfzAXWnpnEXipgAvrgw+BGoqtzeteSUp?=
 =?us-ascii?Q?MnaDyVJCFR6LOQa3wbtPm0+wtwGWaRpcvFP0C2pdSCd7HaW0QeY5qV+ytw73?=
 =?us-ascii?Q?S8i1dI4kF0W7Qw9YU3DBfAe7mgdeAonwbjP7i30b6ndluJ/RaSFVjOl5Z3J3?=
 =?us-ascii?Q?1wMGI0x9/aROJTl01n9AsYyhkrDnM6aKatUYWh4WvlB7fmDmHcbD5LCZNiPs?=
 =?us-ascii?Q?EDMfn/6LtmcBFwKPn+e4Gx7EM3Vdt/Jg4Da/M9cUox7+YDX/Y4pEXckbNtX7?=
 =?us-ascii?Q?wXkJxiQScnqgM9LzJc1b0/geP0y8NZtZfEmQ6IZUC35HC7I1raIdOANEvclZ?=
 =?us-ascii?Q?5j/T42Cwr42W7rNvRtL2c759gX4RJ/GgI4rPUedgPK/5wHUOzny5kmxiyUv8?=
 =?us-ascii?Q?PLlWW5fancL2+r7gRDkUJaSzW0bthZGYFe9vYmRiKiX/tLhFSSVmrGWx0ZFl?=
 =?us-ascii?Q?s7cNaVDTRLaoK+CBYAiwsOwgjlERBpG74Jnr9hdfx1PswDBgmNtAr5Y2AI0D?=
 =?us-ascii?Q?n+AWI4RiJazHqjDlSyUZYjTAyGDJtgXrr0pN1DMZ0t7dLk3F+QzImE6Azvny?=
 =?us-ascii?Q?A4dWw2SHbTNriKexbHz+WHolsmH6Xkfww0/+/d4qOYKAG3E+bUkX5/b5hZ2Q?=
 =?us-ascii?Q?dl3d49e27GQOfiO3CslfMhHQw4oiBFUwA2UwzXDCGn1K10HlRr/N7DKsSIOB?=
 =?us-ascii?Q?lvxTEQKPTCAmwKBQ7Lssbmr+j0/KBrMJGgsp6P/Bp4PUi1sP9lqVh9m73b0j?=
 =?us-ascii?Q?fgYGEsoMkpHXNnRKiEZ3E/9t7SkmiOhrWNlCMZKT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f356aa-f38c-4bbb-1630-08de2cb76bf7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 06:45:43.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/QvITQi59CrA+xbynQYqOPnqMzsRB9CzigR2bBJeLYX2WaBvr5RmjIKUwgxSe5hijn20C9sr0dkyviytxU85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11347
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

memset_io() writes memory byte by byte with __raw_writeb() on the arm
platform if the size is word. but XCVR data RAM memory can't be accessed
with byte address, so with memset_io() the channel status control memory
is not really cleared, use writel_relaxed() instead.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 07c9fef45b0f..06434b2c9a0f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1421,7 +1421,7 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 						bitrev32(val);
 				}
 				/* clear CS control register */
-				memset_io(reg_ctrl, 0, sizeof(val));
+				writel_relaxed(0, reg_ctrl);
 			}
 		} else {
 			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_0,
-- 
2.34.1


