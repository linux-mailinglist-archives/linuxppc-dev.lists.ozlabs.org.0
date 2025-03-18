Return-Path: <linuxppc-dev+bounces-7180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF0A675BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 15:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHD4x0wB6z2yrR;
	Wed, 19 Mar 2025 01:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742306433;
	cv=pass; b=kUPemZr0CkxGYJGf5eA8jFI1sTeH/S1AZEwie/xGsRrFjEKd2n5Ad25BLyBXeIqgyBotuqNpTgIFo8IxMiDHY+tQiO0ynGs9m0Ws3uL14vzxkL+PDq6adfoxXIDLicU0mnPFSThF1eJkDRO4MJE1a/BKYTAqtF4Biagk4PLLNO0Fc9h9f9NxJCnIWpzU1SBTDyGic0xMajn6wjHkWMZvmrsTWVjAw4ikIrzUp9e4Nn1i+ARjiO2qq0ob1F+G7f3ySFUnXc9zzFKQPnAxxG4mOGppK6CSlOWSBrai/GogGgv+ptNgw3jk3Urf/oG5yrpfHB2r87u0r80Qra+JRkRR8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742306433; c=relaxed/relaxed;
	bh=7MOyRM094spLavero/c0q7XinVeDU8tftLFiW+NL9ig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HI++cd9aa6ojt9qgsoGsoSqMpXdMSI2MB0yJEK+HVUAW2nTzWfx9ilv+ftietgipAxX1c5ZsSRhU3mGWWQ2BIm5CvlJ2S8Xx8ShhU/CT07wTAkaPRU1Dg+uAsAUIEJDxBIUJ8wbjvW3Ua5zQ/k8Y6dETM8D4y3NKP8B4ypBDd1Ct8bYgixPgPr+YdaubUYS5bfXikLRlV1jFEDP6FXyQ/S7h/ex9wHRuO4rSXCczt58AGIXmNKULLyUnxUo5i0XF8vd9YDaJ1Dp/5onYbYTMqIwQdSQExs8QCDAHQtV2T8E4DjSVLkClOqaZO24Pc3v/papC7aPPnj2ouTJnfjoEiQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DQKqDLMs; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DQKqDLMs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHD4w2Kzcz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 01:00:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJO/aLag2tLwTaCzEst8l1B5YzVg8LG+0NNFlLxqTJ/L/9cbew7zUPB1tfLPm0qsez6vx/sh5EwrdA+Cy9EUBw3q0YLhHiPeT4B50pHzNDyclbc6bwyx8xi2hE01O4Y2bAxNkhRMCnyvT25cIxD/J3gqUKYgpP7OBh9PqBTRmjaUnCw0xXM359tDdi8XOvNBNuRA0pDqis41Vm9i48156jjDyCDtFQs+/6oiFLs9nEnA3hwVhADABYPA6r7RPvn1Qkq/P70cMfK+T5DTnRXUicRuDo99ZzXVUXPmHq7k3UVc1/+tAwYLsK0Mw25IwdFxS1xqcm39vzdhpj1zLHnfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MOyRM094spLavero/c0q7XinVeDU8tftLFiW+NL9ig=;
 b=URTYdqmV+gXibyj5Ex70FJ1CdZsr4XNotGR3yuac5sib09QIvij7Vha4jU3Nvmp7OUDx7hAp/+9XPgWSeSo2nOF9ta1vfW7eNWh7Pjk9HJUP6CsU90dtKcLkacd2QuEWNSoKD06mOI2nkgHx1rQcv53G4wnN7PNvYkFjr9fbzcAh1i2xSsXLB+MrMGPdJepWQ6mQpTkjFTVULpH8a2dkmjOOv1mG3eq7lcJMrMJR4xSgKQxJs+6+hCqOqOm6UyE0JI1v7AbxHOi9dlj8CEtkpuIVfhRbp7UypvpIgX8heoNiBhobK1wpt+8IoVcyaOsMWR6XkxtwA2BZvSv854EHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MOyRM094spLavero/c0q7XinVeDU8tftLFiW+NL9ig=;
 b=DQKqDLMsQBdwnH4dFyCFOhiiefU32MERqUnMu1RyaGMjycm6F2YE1nzU3XlN4fdBEdcL4E//VPCvQLm7BHyCK0oym8MiGK45dwRppT8bevkrQklZPMHNi41qjIt5iNMHm5dOhpXEUNkht5VGte0PTYmrAcjePH4cMGvxa9SNxMRSlGufVXrJTFCkeWJG/daYKrtgubOee9+zyyP93FBKSr41XC4V8z38y24wFY1Z2BKKp62zZWV1OXMKFM3M+1CeVhTg1GDamXw2ayVEeryN3wCf/liZzeZ5U3bsIuB4d9CFGYZ9bxIO2zOZdFTNhY8Xk6sAemBugH0fdJq9YYQcuw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 14:00:10 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 14:00:10 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Topic: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Index: AQHbkkpbosg+I5pSyEimx2zUNxYPxbN3hVPcgADCsDCAAIlIAIAAJYog
Date: Tue, 18 Mar 2025 14:00:09 +0000
Message-ID:
 <PAXPR04MB851099502FD17128BDC13A2A88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250317155501.4haweyhlrfozg7zr@skbuf>
 <PAXPR04MB8510DE829523749E9FB5E20B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250318114316.2st2ylxuu7srloqc@skbuf>
In-Reply-To: <20250318114316.2st2ylxuu7srloqc@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AM7PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: cc3bff54-4e8b-4c53-7672-08dd6625324a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f5pG9ijHb87/b9rICrPUnNzX1UlLsAVBuL9Abqz3eMhIXeUs/CmjgP4NhLD9?=
 =?us-ascii?Q?WU/3IqpGPSMsPRwKPfn0qI6I7JcOXhmttkQIYJzx/RMiCqXVPGJlWN562uLv?=
 =?us-ascii?Q?8BsSNbrNZqBB2vDftRVcsDWkbiWSRyPqZeiVo3QGYyF36NIycjoaxIMZtmUk?=
 =?us-ascii?Q?4AVeHqZYi4twwPDmtWuU31uzK3KpFWEOVBGIlNxHtVuVfJclhd+jebUoS30D?=
 =?us-ascii?Q?cuzT2/xALgmym2EMkxHJrtG3L57btOtoAIznSMy9twwJ3tzw838KGtBG0Tkj?=
 =?us-ascii?Q?2IuZjtx3zvOjkfbHoVHPgRQolWivcbrXFcWJZ0L4whVdento4gUkD8zlrmnd?=
 =?us-ascii?Q?sXmlgVb8IRzCCZP5QqpJXySn+4LPEDybO/cVRLwK4CVJxhxiYenNW7oavATV?=
 =?us-ascii?Q?LmZLTxKKdBchX8dwgh8/22R0ZJn7a2wVSxEP5GONXmFOtBi6QjPSmf8orzpx?=
 =?us-ascii?Q?GlV7At3XF8a4i477ybDRpCyZkXiugleEABXYRK94kCpIUakuBrMMNKyO587t?=
 =?us-ascii?Q?DtUFbwRCmf3IYRGQBPbLzu+a/rMR9PaYBwjQJ/Eca/2zOaWbl2Q9n39+wWZt?=
 =?us-ascii?Q?4g8+Yeu+J81tp5T+/PCh8q4zma0CS9HYtbIA03nBtAWepV9dytvtJGbCmfme?=
 =?us-ascii?Q?hxPt9bh05j7zJ2W6q0iiaVEdbDNRR0QX8tm/ES7m3hzW2vFPm0N/+9g6MToQ?=
 =?us-ascii?Q?hl7vswixH7Ie1cUeWK05FF40w6RPmGAPdyyvD0mZ1j4di/Efxrb3KvVHbOH2?=
 =?us-ascii?Q?lmznzbECz/0YoJUNRBUA0lILT8/Tfgk/nvq2VC/YYoMj+Jn10oYq+/kWFHQV?=
 =?us-ascii?Q?bnj7hmvYmMjiAfZurchh+Vj/rsOhhLACOBKf4ObcTTjSLZB31EM7I54bDTW3?=
 =?us-ascii?Q?NLCzESfgoKNmv00fbrijSQAPr5OnlIS0iY/VPscrzsutV6CinW/uXyrAXmqF?=
 =?us-ascii?Q?I1Ud2DGtlXdXz/oB1Zo4wIYbwnOlXmz3wGZfBqRyh3Gexy2WnucjYFyWXQlZ?=
 =?us-ascii?Q?kkAciPGNNefpecYDjSa6z/RRFYi5zENs+xrtmac78UrQuPcyb8iEKqQlHOjJ?=
 =?us-ascii?Q?G8HHCv6Zndrpc6wVrCOFkqywKCPC/MLzYisYZ+VPmLKgncOtmHOsAAKYTd5r?=
 =?us-ascii?Q?FBTanSVdDFli1Qa00o8VFbnrmXGRrkiLadjIZmVw/ldV9osMVSWXlXW9qUlD?=
 =?us-ascii?Q?LjWImWEzeefN8zqOlWFrKRNjc4pY5so+Y89eOgF1H/4KsEqoANcdDVU+2Zgr?=
 =?us-ascii?Q?l+hbqK0o4XY/ifQMbMDDDjlehFWeoZQ9APb/mclCY4ZoTVA/oX66fTBccOlD?=
 =?us-ascii?Q?UUkFELw9L/U9FTVrU5Nmds8fMdtRPraslbUSpKiH6eOgWZmRAgWgCPDJqOPM?=
 =?us-ascii?Q?R3DZMtGRXmqilu9zTLQgc6fXG4xIzpA+ys8oWJv+fGKpdo3iQQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?of8fFSEQDOleTg/etxADAAYcawIaxXNz1/y6/sktZXnEKpjLeuXZ5lI2hnQE?=
 =?us-ascii?Q?kTNe4fXzhgFauJ8TmuIPe4zxQbGyf5F2tMxMJ116zK1ZIB3o47FhCdHBJxMk?=
 =?us-ascii?Q?hcaMIU23J9Mfno0Z0aNMD1vkt7PVGpXf7WUvDr3cPohGeqC1hLzu3CppU1aq?=
 =?us-ascii?Q?Xpv1E6TX7l/ld5LcaXslV76fjcfM17Om88nHHPbFb+Rx0GuHfSpGLrQpFF5X?=
 =?us-ascii?Q?4IzBkBB8KUgF5jUhjJRRwcmlgJWhWYbc9m6PsjkoEMoDbNVSgCQN5LBlJ3S4?=
 =?us-ascii?Q?Yh4zef6oi9QemUEoPZSGrCrqFInFNjYyQWfTmc/gNdvgKx0wEgc4BP8XRCqT?=
 =?us-ascii?Q?AItIMCAAxrhrOyUeW5vmEyECZxWipc5/SnJ+6iHEzPIQiCJsh9Gb3ix4zZsd?=
 =?us-ascii?Q?Bn45duoGOVDVjPfCz9x9SfkvIW3/SPJNC68czOYoAKk7w4rWJJ4bukMeULgO?=
 =?us-ascii?Q?bh6a0+7SkJz667le7gTCZNSSvwBaXMm/zUleSjy31D3tSVrimotPq9vxwUAj?=
 =?us-ascii?Q?ubAnHF0U4yMzLk5mOVKeDgQaHM8RbGdojw3PtRdG69XCjPTS/unj9lt7OdGQ?=
 =?us-ascii?Q?TZXLl/26vd/rdNchwyTFeieJqmrykyCqBVycsflNeMGUJnZmjESeqhb6YBAN?=
 =?us-ascii?Q?XZdF9Q7EXPXOJ5dPtaugDxkd6yup7FcNa38nkgxWpcX2tB1i8YUvO0IWEAzh?=
 =?us-ascii?Q?ElGRQSVqtdfjeteQY+2fSo5pIuiCTt4/QgHapNdMB67iSwHahyidC+UEgHNI?=
 =?us-ascii?Q?VootSIh6q3u74lW9uf+O+uQvEA7j1e4wBdPs/uOr2xir2xGdGOCT8d4Bf/oo?=
 =?us-ascii?Q?P5P97wGB0TseDBneAMSE8/pJwklmQFbuKxkwd7XIu5iUaK8qpE1uzETOvq6j?=
 =?us-ascii?Q?CU6JMEV4O47gNRx8ViWgZKQWzfQ6t8r2cQeLMHaJm1Gw/OzqruSycYyJ5510?=
 =?us-ascii?Q?qmqrakY4SgqUXvFRuhopS3Npsc7tJMf2RplxwlyagvHG3wwJkBSEfhUjmFol?=
 =?us-ascii?Q?xY8Czu5rEtdZUi6d+inrnwSrPU7HAG1km2cf4sWahpjrgcWYhTPHBr1eWv0L?=
 =?us-ascii?Q?nEFRfO88O0jDBLJewo9qiLqjyco+3ht01r9YLiDj/Wz6RAJLR30597LKTvcy?=
 =?us-ascii?Q?oy+jmgVhQ2CP8WC/bxqk/AtVOUB4xVpZbIQwNzsPB/88kv+B9i0vfAArtqPb?=
 =?us-ascii?Q?Pfrv7F8mcd1/DxkUPWkGsud54hougQh1enjkTxDIgiUw7VMrLPWAFY0rfHnb?=
 =?us-ascii?Q?f8HNDiOoU4M4uRW+NyoNcXIQUCbWkUAXr8S6yv1LLsYR/hPjHKVWNMfnrflo?=
 =?us-ascii?Q?qkM8AYIVr3XnCvnf6ZBfrQasbvtT+aU0fmQQZcxw88U77aPJdxDqb33Svidu?=
 =?us-ascii?Q?XXh5crn+hRaq8UOYTRdU53W3T55+Q9xPnrkVbqxfE0vpb1Tn3Pg5EV2HT4fU?=
 =?us-ascii?Q?N4czCaRdaT9yA2+8W8qJzPE1flukoyLxqWCQMmQh91wwYWCSgIdrUP8+0Fbg?=
 =?us-ascii?Q?wx1AzWG7Innuhcdeyt91wle99TDV+ADW3i9ORaKBrr/LtjoaC0SRhM87ONkd?=
 =?us-ascii?Q?YXIse+qYw3OjNTrdA4A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3bff54-4e8b-4c53-7672-08dd6625324a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 14:00:09.9942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaXmolRocSchaT3ZHzcXbCbi0kYPkYqFSmYlUS2toxjZdnaZglP2nKngY6KtSMsxgE1j+oVUqFm6ICKdqtarIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Tue, Mar 18, 2025 at 06:47:11AM +0200, Wei Fang wrote:
> > > These rxnfc commands seem implemented identically to the correspondin=
g
> > > subset from enetc_get_rxnfc(). Rather than duplicating those, could y=
ou
> > > rather return -EOPNOTSUPP for the unsupported ones on NETC v4, and
> reuse
> > > enetc_get_rxnfc()?
> > >
> >
> > I have explained it to Jakub in v2:
> >
> https://lore.kernel.org/imx/PAXPR04MB8510B52B7D27640C557680B4881A2
> @PAXPR04MB8510.eurprd04.prod.outlook.com/
> >
> > So I don't want to reuse it for ENETC v4 PF.
>=20
> A detail of the review process, written in
> Documentation/process/6.Followthrough.rst,
> is that "Andrew Morton has suggested that every review comment which does
> not result in a code change should result in an additional code comment
> instead; that can help future reviewers avoid the questions which came
> up the first time around."
>=20
> [ personal mention: it doesn't have to be a code comment but can also be
>   a sentence in the commit message ]
>=20
> I believe that it would be good if you could apply that suggestion for
> future submissions (not only for this particular comment).

Okay, good to know this info, I will add a comments here.


