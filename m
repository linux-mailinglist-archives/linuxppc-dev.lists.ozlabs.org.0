Return-Path: <linuxppc-dev+bounces-216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5729580E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 10:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp2f55KLCz2y8c;
	Tue, 20 Aug 2024 18:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c213::2" arc.chain="microsoft.com:microsoft.com"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=jRG4psKT;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=jRG4psKT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=duagon.com (client-ip=2a01:111:f403:c213::2; helo=zrzp278cu001.outbound.protection.outlook.com; envelope-from=alberto.amori@duagon.com; receiver=lists.ozlabs.org)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c213::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp1vz3Fkdz2xBm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:54:54 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bLbE1aDD6M16m4mwTG5FvNpg1lXlGdH5UNAZGSNxAsK4OgYzaQoLNovBbIepPLY6qyBihGhkkc81fuQNycgW8WWeurAdtt1t2IS9kfTzlDUiNQWLI6LTFCGg5fUGhnRN/ayYDPNvSaIfmrBFaW/9CrjP5DrcwWvWT606dsDMhbJUJVVVCMDomqsWcWhQfH6pUUjoDT9CKT9TD5cbUTMAMkM1gOiRPg57HfGH2IU9kdQshqUxDAQ+t/wlTintxKqX8Ri7O2qTQfi4ZMWUqStlCKU2pva0Puf4+XIoS9VxgaTrWND0APnYeeMkrlokUWuBwTBXQIP6zDUNa5SF6Z7pfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZInMhcoqKfSNzK5+Vkxc8u3jyiBmsIC5OhGz/BG04Q=;
 b=xY4lFQjeReBghwb1CuUpoXLPz+6ky/Y5jY8PLI2TtuDllF+VmLThFhkKxEYEmKwxrwn4hO7Te9gxNz67UiZDKIRMYyoB39KFUdJRO8x0Ci3uVXr2ZAiHPxNxkjRSBaJmQHVvUWfZVvvqu1DYqr/c1/lt15AkIwiL9O6BeqO2HqjWRqAzPgvhobY3xb2pZ/JHd23w2ahNN4yKoJD05hK6Z5J/y/8jsZfHDYyFcZVTz0iUNDZqTsT9EbKXDbEJu16U9UGRLLpKTMe786rjGU8nY6CEbVCjHyhqv79bvcH8yT9v3mzVPhdGsDT9GK4J2yH/UKLhGqI48KwutXneYMcwgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=google.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZInMhcoqKfSNzK5+Vkxc8u3jyiBmsIC5OhGz/BG04Q=;
 b=jRG4psKTolq2zgFfcytN0iknGbe0vugooSw+vFqO7HHH5tKYdlR8LZVkCWq9rddiy9r5vKH3nofmrFfhg5WfPa9EytaG8Amg801Urc4jypFlav2gq0XMPWyNJ8m6kpnaYSrEY61+ugaF6SSEa2Ff9s8E603pRGdJ9mcxNBKGl/k=
Received: from DUZPR01CA0328.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::13) by ZR0P278MB0187.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:37::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 07:54:25 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::fd) by DUZPR01CA0328.outlook.office365.com
 (2603:10a6:10:4ba::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Tue, 20 Aug 2024 07:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Tue, 20 Aug 2024 07:54:24 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Wp1vN1nkVzxpD;
	Tue, 20 Aug 2024 09:54:24 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com [40.93.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 09:54:23 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSSmgFClvLkKtxfeutw2e6cZ4QMgKlYzJKZ6m6hGR1Olb4+/Hvt0XEndN4GdvwRk0KtxDBiZMf5pMkq1qfS3D3aP93kSwzPIAcjs3fqOUH/mUmcCH84MwWpK0yLhCXCiJaw3wpQqNUQLdkq4xdrZaMigF1dBeXaYzDHcLbYzDIxNQx/bqYvaFXsRE+4LBK/HaQJvOBTVYY38EwvQvoXedA8MyH29o7mWWUG5A46eucWPfiwqmsGB+loREArdkjw2bosPtZb2BZPSkgY8hkEcuKP/YA43r/6WfXPSTDLBOqRgnHhtxPkPpAvk/m3r+TipySpP+U9PlbUb/0Z5zoEzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZInMhcoqKfSNzK5+Vkxc8u3jyiBmsIC5OhGz/BG04Q=;
 b=ybLMi+sVK+WmTW8OCxXfK0AyRe8IvmID+tRpWZnj2r4NgT1lut9vo6TvtN2vVyMQzRbPRu2nng5W43gGOATw43lCIz56sGNFhySycmZDM3h+C7635V1wdcMqaj2JkrThECFFHCNV28lxALruITe8s5D2wtANtA1mxdzGh2Fx+tdguIVX5mR7/YXOk7Z0w9RX55SSh8pMHo8xH+ouNwnljBmP4OCLx1Y4JOklOEs6v9IPxJ5v6nGLlRwH0OPAaOn9Xf0NFUp7raPoUSjzubxGC93yjEQwXXvO5JX7t9Xd9cEhlIKuzq0E3Pp3hJBAwpnhzq5mUWx9HJ4eUz/tLBWEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZInMhcoqKfSNzK5+Vkxc8u3jyiBmsIC5OhGz/BG04Q=;
 b=jRG4psKTolq2zgFfcytN0iknGbe0vugooSw+vFqO7HHH5tKYdlR8LZVkCWq9rddiy9r5vKH3nofmrFfhg5WfPa9EytaG8Amg801Urc4jypFlav2gq0XMPWyNJ8m6kpnaYSrEY61+ugaF6SSEa2Ff9s8E603pRGdJ9mcxNBKGl/k=
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::8) by
 ZRAP278MB0740.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 07:54:19 +0000
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148]) by GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 07:54:19 +0000
From: "Amori, Alberto" <Alberto.Amori@duagon.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Question about AER in latest kernels (text format)
Thread-Topic: Question about AER in latest kernels (text format)
Thread-Index: Adry1iiMmzIfH6wMR2SKLqe5Prk8SQ==
Date: Tue, 20 Aug 2024 07:54:19 +0000
Message-ID:
 <GVAP278MB0119BBB30DC2065981D978B5968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic:
	GVAP278MB0119:EE_|ZRAP278MB0740:EE_|DB5PEPF00014B99:EE_|ZR0P278MB0187:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b688db-7781-4867-dac1-08dcc0ed4f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Nqs2K8X4SFNQLokqeb3x4Pu5DQQG1+RYmUaKRwoOS4Z5hEZ9RfAMvXHNdaBf?=
 =?us-ascii?Q?UfctLwNCIDrTcdlxjMJ4Ojv+IZNHzdYLEf2djsvJrCSc+5eToujFbFqrCsPi?=
 =?us-ascii?Q?zG/t+JL9vAnE4KcGWLp+9R16IWvBJIbuuMeV5YWxdazrIn9FjD/PRnGFxSP1?=
 =?us-ascii?Q?oUeeh8HTvTGXNpM0aTvMKoJ5t/ZptiKO6Sb4QoUmjFqKvDM2uuU2ckVKdtxO?=
 =?us-ascii?Q?I0Ho1zh/7DxnkOdaziGj2G6enu6c+k+MjE7nErFYwFaJ5UW9WoWdKZCnqRf7?=
 =?us-ascii?Q?qXHmV51yC1gGbg4dh3vwBwnWR+ixDwv0YykN5aS2wV2NMU7N52JZx7iIrsKU?=
 =?us-ascii?Q?Jn4xCvIBIpaJABgd8sMhoorbmMK01HAgFmIiyaUyQqhEEUetQQWgI3juBkuB?=
 =?us-ascii?Q?Bki3EVSz57wSqvGXOVaUAkNH1Q3MnyI7cuw8BChaN8JwAwpHr3CAJFeVJD2c?=
 =?us-ascii?Q?CZzaSHX77RkIJgUid8gdU23i/Z79z2lIz2+Rx16nd9KjilDTPV0lPFMP+0Yy?=
 =?us-ascii?Q?ziZGj3dzfjOmMD/hzxcU64odYQMZUmyHJOAwNwdL+2cF04aoHeHBLiolgORI?=
 =?us-ascii?Q?2VUgTbhQI7OjWtQ1RQJSzk+9PajQDazUdCFohKOaN17zdluUiPhcyRM26e6o?=
 =?us-ascii?Q?HfOhN1J2G2Kuecr3K2qhXnw1r6EJckm/lLzfa8ZzmDuaCeNWgAUd42fHJhFz?=
 =?us-ascii?Q?0zRI39+ctM68txb6MvluMuIOC6ytJMRM0UWObBNLeuBmRTYOaNCaZQ6rfbmr?=
 =?us-ascii?Q?mjiCyOcU/RcDHP62a/+e/bnttsUVXcWyRF6j3JPUiLC/H+oUFfvtKfriYHI2?=
 =?us-ascii?Q?sGPEj0w64QAy6U+zZ0kuMwyGK7ilQm9Wpz35tiOhK7MbgckgKSUZ5DbMYkdj?=
 =?us-ascii?Q?IYPuai93NS5CPqW7pt/k9UC+wLgPIlQYPLrEpZ9NWO0sWXKBp8fwgxdQVnjK?=
 =?us-ascii?Q?z1auyoWnBGaxnuTkbDVeCNnxLq992KfXjKoumPRomdq82576cXZoo2wTbqK7?=
 =?us-ascii?Q?h1zDFfexjC2J7uyLeL/+LLMKI6B7cRb3M/E7yhPuIXqgVB91nhz1w9OqX9eE?=
 =?us-ascii?Q?mi2308rxsDwyglCmJFsmSycOmFWSJTLwiTzgTqd+9c+b/JLnUnb1lrIodXY5?=
 =?us-ascii?Q?NCAw8WqAd5OuJWMvZp/W1+4QYb3OPybEBB9tvw+dCWGcwjck1axglez+C+kI?=
 =?us-ascii?Q?8IksvTpM8LyVIOMepzSxDCMcEFbqj6vSRSZx+ES2fiUUMJ6LlBMfWnqMYnDp?=
 =?us-ascii?Q?w6zWY/LrD8jeyybFBhBouBpeWz0sefFTV+ShJxzjT4hZHtHsPWw9L/MEPS8K?=
 =?us-ascii?Q?DXkcRK9ycSN6CEJxCdGKvy1R8f64KaVvrZzbPwareA8AB7I0yXyVH9lOdtLA?=
 =?us-ascii?Q?UOXJNzU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0740
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c51cf6d-71e1-4dc2-7c63-08dcc0ed4be9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKe0tPoAvcK2HBcn/zyB7eFDfXpPgJUkeMnyBHTiW7sRT2ypwe4OWE8ThQPX?=
 =?us-ascii?Q?ehFULWoJ2ADtqixW3q1x6Rv3cFyp1SIalf/7uvN071dM5PLFGMmVtuPLghJk?=
 =?us-ascii?Q?YqNE/RsVGpinjR+gyudLNQTn/8lkeqHOo14Oqk3wvmybmByfeHMr4FfYtE6e?=
 =?us-ascii?Q?AHaE83A8dBQPCBpR6H6KoK2dZAurRmLSotPfrjKj58xk4GTIAG9kEn8fkzP2?=
 =?us-ascii?Q?KbBb1iLM6q3a0NqY3+nLF7YXRhhMzFwxL5YnSLRvd4SxDtNz8y9EATQybGtx?=
 =?us-ascii?Q?8BQDFBLR5ZBoaZgc0xVvlvv+T9pH3tYdxmEasLIUDL/zEGMJmpGq5lyl0Oni?=
 =?us-ascii?Q?tadPeDV1/Haf9Fw4perYPmcDY8tRExoaxY7GMu+Mk43EQXnN/GPono/S+vzD?=
 =?us-ascii?Q?DfmY1VQfTSEz8A4+pLy1TtvLdhtm32yNqar/Aqbp7BcedZUNOOA1DaUWrBiS?=
 =?us-ascii?Q?EDEvu904r3mp8uyEixD5XJqosMorqfgLp1wvl3J8N0MEKgiqOHnKB74a8TYJ?=
 =?us-ascii?Q?FqNajA6Xt46amXw4WkRngqS3x2QTomiqiR39a0mcrC1tdI6cDUmDb1HdOY7K?=
 =?us-ascii?Q?Sgce+Ffyn0ko2PAOPkOrxB26inQepJu39tRRd9pcLJBBZn09xeS82EL34dnL?=
 =?us-ascii?Q?nIXViFCHmfX1ooka4p88NH5LQ0gJumhKN4qDX1gzRXzKC27qtb6Cd9Y79UZ+?=
 =?us-ascii?Q?a2AXKTH9DwH/0TfDH7igQf0SDzdcn5TYec+R8B75kKYlilW/jutvo/by/Cl6?=
 =?us-ascii?Q?u3sCkp7FyhD5UcXpLMe9OSoDqUX25+pz+rBs0fqlqFwfA+JLs41LIgILyvQr?=
 =?us-ascii?Q?aA/Ei+2mlrF8DTTb4QPX8QX3TGMDDEhAoFPoZy6QHV5AaDkI2u2/pqOOJE/g?=
 =?us-ascii?Q?lkv9GA/jXLTmeLWggUg7Yps/7s8HFvXCK7e1CmCuzHWthRTKVN19tVJzeubi?=
 =?us-ascii?Q?Gty4tkzJ4qNes9Q9JO+8+4Aam/LtM2omMoythcQPLXR/sZrmgFflfvdSgqg+?=
 =?us-ascii?Q?1kdAzRTC6YWwhwBn1T0I3YMHACprJwD/q9+XZtu2AdPP3bgf02kAjmUf+AS4?=
 =?us-ascii?Q?2YAM/iVIIhmnR3O8eakNa8/nILwvhHW6ZYq6N4RIWd7jkCvAvIBYQmJvzx/a?=
 =?us-ascii?Q?712gdx2HxazTrD8NlgygFoRpKu1PTGm/nDlmYwZcKbB7WlLkjHu0s+WHh1Pk?=
 =?us-ascii?Q?NBkc9x3ysLnYjmcZNJPmtZrWOxvOcM5BZ64hqgzl2mLVm4QOB+xVY3F/hVSl?=
 =?us-ascii?Q?3masJvXqC6cbH6UQYNoaV2eHYYL5J93gSFkvnOqI6qWD1204HNDhRBct3q56?=
 =?us-ascii?Q?jGSi+3Bmbh/EX8LUhyQIEoJKkFaNnh/DoZKm6esJtGRTMG547TAcyWxqo+nu?=
 =?us-ascii?Q?4Qn1uzx4YjVQW3Fi3ZBAibB0enVa?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:54:24.7673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b688db-7781-4867-dac1-08dcc0ed4f56
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0187

Good morning Mr. Helgas,
Sorry if I am not posting my question through the proper channel, but I am =
not so familiar with that.

I have noticed that the Kernel API pci_enable_pcie_error_reporting() has be=
en removed from kernel 6.6

https://lore.kernel.org/all/20230710232136.233034-3-helgaas@kernel.org/
"pci_enable_pcie_error_reporting() is used only inside aer.c.  Stop exposin=
g it outside the file."

This caused a build error in our PCIe driver after upgrading the kernel and=
 I fixed it adding a pre-processor check:

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 6, 0)
    result =3D pci_enable_pcie_error_reporting(dev);
    if(result) {
        err(" Unable to enable PCIe error reporting");
        printk(KERN_WARNING "dg pci_enable_pcie_error_reporting returned %d=
 (ignoring)\n", result);
    }
#else
    printk(KERN_WARNING "pci_enable_pcie_error_reporting is not available i=
n this kernel version\n");
#endif

In the newer kernel docs (see https://www.kernel.org/doc/html/v6.5/PCI/pcie=
aer-howto.html) this paragraph has been removed:

"8.3.3. helper functions
int pci_enable_pcie_error_reporting(struct pci_dev *dev);
pci_enable_pcie_error_reporting enables the device to send error messages t=
o root port when an error is detected. Note that devices don't enable the e=
rror reporting by default, so device drivers need call this function to ena=
ble it."

I guess that with the new kernels the AER is implicitly enabled when instal=
ling the device (e.g. when pci_device_add is called), but can you confirm t=
his?
Or maybe the call of pci_enable_pcie_error_reporting() was superfluous also=
 in the kernels < 6.6?

Thank you in advance
Best regards

Alberto Amori
Senior Embedded Software Engineer
Phone +41 44 743 73 94
duagon AG I Riedstrasse 12 I 8953 Dietikon I Switzerland I www.duagon.com


