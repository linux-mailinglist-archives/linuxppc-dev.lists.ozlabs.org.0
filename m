Return-Path: <linuxppc-dev+bounces-7025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421AA607CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:38:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVTJ1G20z3bw9;
	Fri, 14 Mar 2025 14:38:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741923524;
	cv=pass; b=TWOUmbkZGpyfHwcMyptvUb3w3pKq+uA56h8Ng1ooZpkGV088Tx4WkYWCYl1j1vuO/FLyx4Zfik5RHoImM5mg7PqR2Qh7xuefZQ/+44awaUsAXFoX/CCCb+hA/faCYRZF6Oy8AtHzKqRKBN0bGPDnAwJK2ko9X3nsO1WMsJ8sgY+qHh0XJP9ztk07TpeaG4EuRyHhLPVrNs7ZxnzlaQP9i3+SEssgW6QEesunMV+6x9EKEQEzT2dupD1JV90WWGQewYTlulanw7tsaS7q7j3227Jvk6wUhxvVE1dppsL5NvRVQv4WrS3/rYuvZ4Ga+BW12JFlF632cjHwE8fgPJ8m8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741923524; c=relaxed/relaxed;
	bh=no2l66Flsk6qGgelDVoVbnbqevyRuH2L2Ws3OTdIDFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FxH4x8iXyWscw1Ev785vWWbnLmX3ZjIPH5z0uJdvNmtMH9oxjjQ07spegazk6nOPrWaVzUjn5RF/VBKtSe1+KPc6JVbytGLwT63evKiLhIiLCzxO6XvSNTkWi2k+i2avCZi1KQVjwQ3hwoM4aoRv2Kz9U3ua98dlNTNwzaUipaYV7qT/WvJ+IfP2xS5eeKc2JVMw7Rszd5/GSLmKjxLY5dLjkuf1nJQwIeCcBT754lVe4zFZ/Lpdfrvw9+sYWu1pH3uGMdqTLYFhk6dXQ3RcIRTf23Z53Nxz9EUqMihuacxKGxYT350cNgw9FaRPS8Yf/cNQXknYVzn1KAOokmZcqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jgVCCz3y; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::629; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jgVCCz3y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::629; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVTG1NMhz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:38:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFtH2HQHR/NilaEIWoGISuH5zIkFRljkh5GlpBoWR1zjUu1xEtA2g3vyNm3vepQ44X0SHNR5M5GBuvb+iH9PPB9F6RHQM3Vvax1Lg2+320AjzA37texOmb2NZ4OpxFRfdNUViONqlZ7mj8/jVkglA9YaeBub8O8mXL5d4vKXAUgu0eOLAgQe45KL7Stx9oZ72KZgtXBkLTUEL4ov/8fuUzNu8oKdmhF4JrkmHnU9WB4ly1goVKXXaeK80fknJJQ1KyVmQBcImgaU+Cbqcv4364g/VSzQTA55qhCd+epviYEo/+M0GyECj1GrNZ0b5MvSPfwtoxTTQbiKLKhQ3G7d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no2l66Flsk6qGgelDVoVbnbqevyRuH2L2Ws3OTdIDFM=;
 b=HFLpow82hk08hUkZVVoWIo6EKQtqHI1SZ7occXS/iBJDcaf748rwxGbmSBgkHvUR6PG+8amZniK5RHJt+sNnJMvvN1wZqbLLQHo/AdOIWjyG4Wri/dG1Sa12QqHR0vV7ILV2Cfh/RdysoF1jGbpowGTem0J4bI7jARMYaTT1rq1HblVc9SczT4amLTt0gJ+LaT7DQV4VcfWighNzc05RegS0U28fWcDNr2i+aBK1yTUnz2tz+T9HHcAN8kytYagxhSE1aDSguYIulkDeXFCU5uorsdhrj0YSlKSeBYN0G46T/RICPQ77gairlIus8Ac9+Ny8jNPiipUheII6Y5d8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no2l66Flsk6qGgelDVoVbnbqevyRuH2L2Ws3OTdIDFM=;
 b=jgVCCz3y4lXemEbavLM5TOSCeOi2O+2SauGWBzbDeMO82ELjbZjDFEV5Upo9yw0mHX8+YNLp6jR48Ak0GblZZe32A2eutKmtFKPFtF+4247KNGMcTk94+3oVJV0M6cxZr7q8Y+qDekjt84a8294tSaxMPu6shaEYWH5vXYJi7UDpwTHsfFHm7gTHgM+GAuGlphHZH7e1KzfNHW6sciKKfnwoVy/KcJ1ZIwnsF1IAxjT0f8FBNoRw0Ls/GgLnIfA89Aa2rgUixeGRFPiM2c8reZM5sM3EQBli/0iBHqAI+jlpiahoHVYfL/eKXhfaiNe94bI8VQas1NcN17i1mi46cQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 03:38:18 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 03:38:18 +0000
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
Subject: RE: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib driver
 to support NTMP
Thread-Topic: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Thread-Index: AQHbkkpJSjcnE6eIUE+0uP7QMRa23rNxR0QAgACVlrA=
Date: Fri, 14 Mar 2025 03:38:18 +0000
Message-ID:
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
In-Reply-To: <20250313163526.pqwp2wsfvio7avs6@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DB9PR04MB9889:EE_
x-ms-office365-filtering-correlation-id: dfa3122a-3de0-43e1-b62d-08dd62a9a951
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NSf1nouJcGRjsC+qWzILgXn9ksaVwVLokjBPlP0w/KvIY4ioOoMlZiUz8Bqn?=
 =?us-ascii?Q?Z7x/+8SK0uGid8CraXjJ5KcRrzVB+Wlg2Y8wjgdR0dotKymIncnjtbRzrmeK?=
 =?us-ascii?Q?96iD+M9RE2swtUXIZ23tD/KZdPFNWldE9B+OxoZm3XrAf0IHFaj6ELnBH5cQ?=
 =?us-ascii?Q?lJFlnCLyGtWKoJyB7Z48ARM5jgGxo+ltNJb4QzR3Ix2kkjAF0hxYYuJGo2H7?=
 =?us-ascii?Q?HY4UoBO+GNUWAEc4gPKjr14RpmVuPRmg6/t1hxogZSdX69Z78vrYOIZj54/d?=
 =?us-ascii?Q?VeeBSKjPMO3pSK33UYaIQ4b9oMLGwCJgz7XHZFaArkxzfHPjbLkOWz2/w54+?=
 =?us-ascii?Q?OLs2YVQ9LDFWBTCFa1nGksY7QKLcr1JQH5j9k/rpr0zesJlzCL0V+vOX+3vl?=
 =?us-ascii?Q?YEDeI4ZEPM51Tq/p8ldcmNf1WWugqMJxRSl9pJi+FsURsGIwUTKasp+3808V?=
 =?us-ascii?Q?YCvc5CrsgktL10AJfUkkB9xeWlpgkvZ+xSdA1ukAfQISEojvYEoVFzN0cQ4A?=
 =?us-ascii?Q?mceM+AbUuAoUPFr7Cw/PmSaCiBxD9banHQaT/rTfpK6xxtw+Il/AX7OEUP/u?=
 =?us-ascii?Q?7NEGhNxunHlWV1CajXzdNcWoworszfcwcMeifyBdrzupdTuP4BxbRPUftDmq?=
 =?us-ascii?Q?jmmGnDoN50M9fsfpa0y70mihqmwufvviA2pkqO+trb+CucL1cv3LEQBlK7aH?=
 =?us-ascii?Q?O4oMa5NH7rPLIra5UdpaB0wcnx2zBhI7Le4qfmz2aW6IM8dI2YL+pAwMIRYG?=
 =?us-ascii?Q?QsYWjj7JDe94UivVE4/S55D+72hBs/0p5/23c9hkkvNz4y33HxamEK8UNAFQ?=
 =?us-ascii?Q?9Ds9JeWlmxeKoiNuymJFOphXKB9lmQEFIAO5Mg6hccOHVg7HZRgBMKQBfMt8?=
 =?us-ascii?Q?TjaXGQm8VvNldYcJuWsdXKjA2xJKbP0zozv0fkfCCNGQRdTneTC/bUWFA7dF?=
 =?us-ascii?Q?izRu2bT1rNmc1hWtMoG5wV04xsFE432jDsrxoYK1KVGXASNJI54sjdR/rP+w?=
 =?us-ascii?Q?CqCg2A31QZb5Rz0hRgDg+oMizAfSVs2bn3FHY5ut4RyjoOQLQJA/8gDnjk6B?=
 =?us-ascii?Q?MsA1hXLCC6V7tJ3fRW0Gd57YDLGhTFXqnKGcggOO55goxDaFAeuKc4NOECNY?=
 =?us-ascii?Q?n0D2Ogg+YawHY/mnuoPIB/zr+RydGysD09/iu6lJvAxtGLLxL/auyHBA34NM?=
 =?us-ascii?Q?N9qlslqQR9gln1tDvsZDjcJpLXDJOz6P2ogMTBL9fdJ08YPVQmWu0SpL0OVp?=
 =?us-ascii?Q?z5RjcWy1IT9dWByjDOxU7dxWGHQYbOby87RSP0Y327RYKs2hOPsJz28A+A/M?=
 =?us-ascii?Q?CEXDazTtX1PQDaOCRCZFbOZ1YQ7yo3kW4g4oGbsYrOo/mI+/ye0nqdGyYTdr?=
 =?us-ascii?Q?QsPWgxDyRq3W9SpZcduT7MxKn61DPaLVvMP+8xbc/liRpVUBOE1qn+wAx/Xq?=
 =?us-ascii?Q?lG4chBTa5WBkdKCMMo86K0gJZk1QcAvF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?69AJDfqrdztXcb9HG5DeNrTcRZZBRG2RNGoLwu01Cb+cpyacvv3jRjD2x+VC?=
 =?us-ascii?Q?hHbYo5hJW0Cg83FGkL7IIEedfFoGL3X9wkUKZmtUWxynYwfxHBvXY67nfYp2?=
 =?us-ascii?Q?Q3J4O324myDRkux8iSqi/o4uHai/fC5Eqe0o7wZVUkm1Kq7c69HKgXxEi62f?=
 =?us-ascii?Q?5OYmolu18pYC/3dgzECXM6UVTywSx7VflzKw3q+tM6Ade73foBy6Y15OUzcK?=
 =?us-ascii?Q?PYvy8yjX8XkpoYuKe/SzJZVyVKQtod72to933qLOANCoA/qmQFGNUg9JNf3c?=
 =?us-ascii?Q?bzpFKgWrPwhH9AYZtUvpZ7aLR3JqJ/IeZAq1OnPAwjUqjQwkG3H9tn4cZ2z1?=
 =?us-ascii?Q?51UqRbwKveuWLNKzu+THDZThQOIH620QZNN4zqtj7qkfLuqdSxgvDZUMpyQ0?=
 =?us-ascii?Q?JqZyydkH8L4DLzWBVY1thVTMnsO2vslqUgOuobRYbj5bWVDchoc2CcUVGq0d?=
 =?us-ascii?Q?Y7IyNFGdpeBgrK4yY7alx+sBhdlqfg+wWHp7xWZClCcLk4ipESMA1NIgkIM6?=
 =?us-ascii?Q?igd0OsUm16vhp1iqiaUVkjuLKrJKPB8HSiphnRwhWLi+8ZATf4JKBUhTs8I0?=
 =?us-ascii?Q?gbPjh2zNwt92fbh0EGfKkdfaeoJaN455Liku/UpKnPkKZ4H6FCrm5xJfPZP0?=
 =?us-ascii?Q?+uwVN34f+T6nqqbpgmtlSSBv5xUATGbHsks84Sv9Ml/oO+Sn8dU3f1fQ8gUp?=
 =?us-ascii?Q?KFqL+B9yFp8x9YbAHnZ0KNyQPfw3pYMiEY7Mtm44GmOn6Yg59o8kHmbxNVYx?=
 =?us-ascii?Q?ddsKg9M8gxliuendNReviwGv5aqlvF0nMtkDnfNO4+HliXomuvmAtn5EjbWc?=
 =?us-ascii?Q?snlYigJI/OW0iw+PSCKUxtNq5f49/dDdGrC6pTCEVb2laPFH4WZo1AZiQM8g?=
 =?us-ascii?Q?6CSt2FXfoHg46vdIGTmpl+nO8QkWHayqDO3AkEzN8yYFNwYqepOmgg6b0DJE?=
 =?us-ascii?Q?Cqjqk6VxRchXKlzxDTH3f524Qwz+iL7C/cbZ5uG7oQJOkLcBGYY8kYzcsohH?=
 =?us-ascii?Q?8GiTIfhw/ww4mc6VEy36BJjYtbBSrtA3nBERCPp7VS7qKZzzMvc+Y5Hw62nf?=
 =?us-ascii?Q?7xDMAXPqucn+BDTIUKD59tiLyP5ExNCqRVWYwkF+bi5vGd7Qusw5uknLlK3v?=
 =?us-ascii?Q?IfxwBSzfv+DsZqsiWb8wer+NgaFtp0l5mjS7T8jncH5FA4aFQNzLvhDy5nhb?=
 =?us-ascii?Q?4LkLwnHtwcck0hivoSMILwn/FzNvT9JwxASXEtC1nKSMjUotcozHWeQzmaub?=
 =?us-ascii?Q?wmpidmaQ2fI6AxDjxyBds6eazdfjugvEbomziuCzx1XP0MGIBLtoO4dtm8QF?=
 =?us-ascii?Q?4Qt3Kn2uOHavoy1Q2QvIoL0aLnQpZDAEm3P4D8G71y9xRUf9SmMWLOrbKy4p?=
 =?us-ascii?Q?7dclMZR99yL3wVTlL7rfMIuXuCfR33AeQcDbT5HQIt1782W0xE96OZOQz887?=
 =?us-ascii?Q?W3sK2lIT49c7q+xGz7daFGIsv+Q2P7TEqAdI/ayDhQZH3uLa0R2LVTecuOSc?=
 =?us-ascii?Q?B7OvZbeklva36ZFYsPKNLa8mX0rw7vqRMApdNaQozI6A158zMni2RooQgNNz?=
 =?us-ascii?Q?NSOOAxaO7lY9cwwW7mk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa3122a-3de0-43e1-b62d-08dd62a9a951
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 03:38:18.5831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qq2OsOzEn9T9pM4S9nARekP9rYn75fPGx1tP+Ih6GQDkGqA7DBAIrBazxH8zY+IFeb6CmJewVtPviArGy3GcEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> On Tue, Mar 11, 2025 at 01:38:17PM +0800, Wei Fang wrote:
> > +int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs, u32 *tab=
le,
> > +				    int count, bool query)
> > +{
> > +	struct ntmp_dma_buf data =3D {.dev =3D cbdrs->dma_dev};
> > +	struct rsst_req_update *requ;
> > +	struct ntmp_req_by_eid *req;
> > +	union netc_cbd cbd;
> > +	int err, i;
> > +	u32 len;
> > +
> > +	if (count !=3D RSST_ENTRY_NUM)
> > +		/* HW only takes in a full 64 entry table */
> > +		return -EINVAL;
> > +
> > +	if (query)
> > +		data.size =3D NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
> > +			    RSST_CFGE_DATA_SIZE(count);
> > +	else
> > +		data.size =3D struct_size(requ, groups, count);
> > +
> > +	err =3D ntmp_alloc_data_mem(&data, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Set the request data buffer */
> > +	if (query) {
> > +		ntmp_fill_crd_eid(req, cbdrs->tbl.rsst_ver, 0, 0, 0);
> > +		len =3D NTMP_LEN(sizeof(*req), data.size);
> > +		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
> > +					NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
>=20
> Please either use a commonly accepted abbreviation such as "hdr", or
> preferably,
> just spell "header" as such. This reminded me of Kevin Malone's quote
> "Why waste time say lot word when few word do trick?" :)
>=20

Sure, I will fix it.

> > +	} else {
> > +		requ =3D (struct rsst_req_update *)req;
> > +		ntmp_fill_crd_eid(&requ->rbe, cbdrs->tbl.rsst_ver, 0,
> > +				  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
> > +		for (i =3D 0; i < count; i++)
> > +			requ->groups[i] =3D (u8)(table[i]);
> > +
> > +		len =3D NTMP_LEN(data.size, 0);
> > +		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
> > +					NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
> > +	}
> > +
> > +	err =3D netc_xmit_ntmp_cmd(cbdrs, &cbd);
> > +	if (err) {
> > +		dev_err(cbdrs->dma_dev, "%s RSS table entry failed (%d)",
> > +			query ? "Query" : "Update", err);
> > +		goto end;
> > +	}
> > +
> > +	if (query) {
> > +		u8 *group =3D (u8 *)req;
> > +
> > +		group +=3D NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
> > +		for (i =3D 0; i < count; i++)
> > +			table[i] =3D group[i];
> > +	}
> > +
> > +end:
> > +	ntmp_free_data_mem(&data);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(ntmp_rsst_query_or_update_entry);
>=20
> Instead of exporting "query_or_update" mixed semantics, can you please
> export two separate functions, one for "query" and the other for "update"=
?
> For query=3Dfalse, you can make the "table" argument const.
>=20
> Also, from the looks of their implementation, there isn't much that is
> common anyway.
>=20

Okay, accept, I will split it into two functions.

> > +static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void
> **buf_align)
> > +{
> > +	void *buf;
> > +
> > +	buf =3D dma_alloc_coherent(data->dev, data->size +
> NTMP_DATA_ADDR_ALIGN,
> > +				 &data->dma, GFP_ATOMIC);
>=20
> Is there any call site that can't use sleeping allocations (GFP_KERNEL)?
>=20

The initial reason was that we called ntmp_maft_add_entry() directly when
implementing ndo_set_rx_mode(), so we changed it to GFP_ATOMIC. Later,
we implemented ndo_set_rx_mode() using workqueue, so for the current
patch, we can change it back to GFP_KERNEL.

> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	data->buf =3D buf;
> > +	*buf_align =3D PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
> > +
> > +	return 0;
> > +}
> > +
> > diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > new file mode 100644
> > index 000000000000..45e4d083ab0a
> > --- /dev/null
> > +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > @@ -0,0 +1,63 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> > +/*
> > + * NTMP table request and response data buffer formats
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#ifndef __NTMP_PRIVATE_H
> > +#define __NTMP_PRIVATE_H
> > +
> > +#include <linux/fsl/ntmp.h>
> > +
> > +struct ntmp_dma_buf {
> > +	struct device *dev;
> > +	size_t size;
> > +	void *buf;
> > +	dma_addr_t dma;
> > +};
> > +
> > +struct common_req_data {
>=20
> Some maintainers prefer to avoid definitions which "sound" generic, but t=
ruly
> are driver-specific, and instead recommend to prefix their names with
> some kind of driver specific indication
> (example:
> https://lore.kernel.org/netdev/20190413205311.GC2268@nanopsycho.orion/).
>=20
> So, maybe something like "ntmp_common_req_data",
> "ntmp_common_resp_query", ...
> would make that more clear?
>=20

I will rename these structs, thanks.

> > +	__le16 update_act;
> > +	u8 dbg_opt;
> > +	u8 tblv_qact;
> > +#define NTMP_QUERY_ACT		GENMASK(3, 0)
> > +#define NTMP_TBL_VER		GENMASK(7, 0)
> > +#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
> > +				 ((a) & NTMP_QUERY_ACT))
>=20
> Can you please move #define macros out of structure definitions?

No, I think these macros in the structure can better reflect the specific
meaning of these members. We can intuitively see what the bits of
these members represent, rather than finding the definition of these
bits in RM or elsewhere.

>=20
> > +};
> > +
> > +struct common_resp_query {
> > +	__le32 entry_id;
> > +};
> > +
> > +struct common_resp_nq {
> > +	__le32 status;
> > +};
> > +
> > +/* Generic structure for request data by entry ID  */
> > +struct ntmp_req_by_eid {
> > +	struct common_req_data crd;
> > +	__le32 entry_id;
> > +};
> > +
> > +/* MAC Address Filter Table Request Data Buffer Format of Add action *=
/
> > +struct maft_req_add {
> > +	struct ntmp_req_by_eid rbe;
> > +	struct maft_keye_data keye;
> > +	struct maft_cfge_data cfge;
> > +};
> > +
> > +/* MAC Address Filter Table Response Data Buffer Format of Query actio=
n */
> > +struct maft_resp_query {
> > +	__le32 entry_id;
> > +	struct maft_keye_data keye;
> > +	struct maft_cfge_data cfge;
> > +};
> > +
> > +/* RSS Table Request Data Buffer Format of Update action */
> > +struct rsst_req_update {
> > +	struct ntmp_req_by_eid rbe;
> > +	u8 groups[];
> > +};
> > +
> > +#endif
> > diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> > new file mode 100644
> > index 000000000000..fe15e394c4a4
> > --- /dev/null
> > +++ b/include/linux/fsl/ntmp.h
> > @@ -0,0 +1,174 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> > +/* Copyright 2025 NXP */
> > +#ifndef __NETC_NTMP_H
> > +#define __NETC_NTMP_H
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/if_ether.h>
> > +
> > +#define NTMP_NULL_ENTRY_ID		0xffffffffU
> > +#define NETC_CBDR_BD_NUM		256
> > +
> > +union netc_cbd {
>=20
> Do you seriously need to export the netc_cbd definition outside of
> drivers/net/ethernet/freescale/enetc/ntmp.c? I would say even if you do
> (which this patch set doesn't appear to need), the NTMP library exports
> an API which doesn't do a great job abstracting the information.

Sorry, I was not aware of the netc_cbd could be moved to ntmp_private.h
as well.

>=20
> The question pertains to everything else that is exported to
> include/linux/fsl/ntmp.h - what the API consumer sees. Is there a real
> reason to export it? For many structures and macros, the answer seems no.
>=20
> Even for cases like struct maft_keye_data which are only used by debugfs,
> it still seems preferable to keep data encapsulation and offer a helper
> function to retrieve a pointer to the MAC address from the MAFT entry.
> Then, "struct maft_keye_data;" can simply be declared, without exposing
> its full definition.

ntmp_private.h is only used for ntmp driver, I don't want it to be included
by any enetc files. ntmp.h is used for both enetc and switch drivers, so we
need to add full definitions of the table data.

>=20
> > +	struct {
> > +		__le64 addr;
> > +		__le32 len;
> > +#define NTMP_RESP_LEN		GENMASK(19, 0)
> > +#define NTMP_REQ_LEN		GENMASK(31, 20)
> > +#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
> > +				((resp) & NTMP_RESP_LEN))
> > +		u8 cmd;
> > +#define NTMP_CMD_DELETE		BIT(0)
> > +#define NTMP_CMD_UPDATE		BIT(1)
> > +#define NTMP_CMD_QUERY		BIT(2)
> > +#define NTMP_CMD_ADD		BIT(3)
> > +#define NTMP_CMD_QD		(NTMP_CMD_QUERY |
> NTMP_CMD_DELETE)
> > +#define NTMP_CMD_QU		(NTMP_CMD_QUERY |
> NTMP_CMD_UPDATE)
> > +#define NTMP_CMD_AU		(NTMP_CMD_ADD | NTMP_CMD_UPDATE)
> > +#define NTMP_CMD_AQ		(NTMP_CMD_ADD | NTMP_CMD_QUERY)
> > +#define NTMP_CMD_AQU		(NTMP_CMD_AQ | NTMP_CMD_UPDATE)
> > +		u8 access_method;
> > +#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
> > +#define NTMP_AM_ENTRY_ID	0
> > +#define NTMP_AM_EXACT_KEY	1
> > +#define NTMP_AM_SEARCH		2
> > +#define NTMP_AM_TERNARY_KEY	3
> > +		u8 table_id;
> > +		u8 ver_cci_rr;
> > +#define NTMP_HDR_VERSION	GENMASK(5, 0)
> > +#define NTMP_HDR_VER2		2
> > +#define NTMP_CCI		BIT(6)
> > +#define NTMP_RR			BIT(7)
> > +		__le32 resv[3];
> > +		__le32 npf;
> > +#define NTMP_NPF		BIT(15)
> > +	} req_hdr;	/* NTMP Request Message Header Format */
> > +
> > +	struct {
> > +		__le32 resv0[3];
> > +		__le16 num_matched;
> > +		__le16 error_rr;
> > +#define NTMP_RESP_ERROR		GENMASK(11, 0)
> > +#define NTMP_RESP_RR		BIT(15)
> > +		__le32 resv1[4];
> > +	} resp_hdr; /* NTMP Response Message Header Format */
> > +};
> > +
> > +struct maft_keye_data {
> > +	u8 mac_addr[ETH_ALEN];
> > +	__le16 resv;
> > +};
> > +
> > +struct maft_cfge_data {
> > +	__le16 si_bitmap;
> > +	__le16 resv;
> > +};
> > +
> > +struct netc_cbdr_regs {
> > +	void __iomem *pir;
> > +	void __iomem *cir;
> > +	void __iomem *mr;
> > +
> > +	void __iomem *bar0;
> > +	void __iomem *bar1;
> > +	void __iomem *lenr;
> > +};
> > +
> > +struct netc_tbl_vers {
> > +	u8 maft_ver;
> > +	u8 rsst_ver;
> > +};
> > +
> > +struct netc_cbdr {
> > +	struct netc_cbdr_regs regs;
> > +
> > +	int bd_num;
> > +	int next_to_use;
> > +	int next_to_clean;
> > +
> > +	int dma_size;
> > +	void *addr_base;
> > +	void *addr_base_align;
> > +	dma_addr_t dma_base;
> > +	dma_addr_t dma_base_align;
> > +
> > +	spinlock_t ring_lock; /* Avoid race condition */
>=20
> Can this description be more specific? This type of comment is as
> useful as not having it. Make the reader understand what is serialized
> with what, to prevent concurrent, non-atomic access to what resources.
>=20
> > +};
> > +
> > +struct netc_cbdrs {
> > +	int cbdr_num;	/* number of control BD ring */
> > +	int cbdr_size;	/* number of BDs per control BD ring */
> > +	struct device *dma_dev;
> > +	struct netc_cbdr *ring;
> > +	struct netc_tbl_vers tbl;
> > +};
> > +
> > +enum netc_dev_type {
> > +	NETC_DEV_ENETC,
> > +	NETC_DEV_SWITCH
> > +};
>=20
> Can you delay the introduction of this distinction until when the
> "dev_type" will actually be used for something, and it's clear to
> reviewers what is the intention behind it? Currently the switch driver
> does not exist, and this has no purpose.
>=20

Okay, I will remove it.

> > +
> > +struct ntmp_priv {
>=20
> Would it be better to name this "struct ntmp_client"? I don't really
> understand the way in which it is "private".

It refers to some private data of NTMP of different devices (enetc or
switches). Since the current patch is only a small part of NTMP, many
members have not been added to the structure. The following is the
definition in our downstream.

struct ntmp_priv {
	enum netc_dev_type dev_type;
	struct netc_cbdrs cbdrs;
	u32 errata;

	struct ntmp_caps caps;
	/* bitmap of table entry ID */
	unsigned long *ist_eid_bitmap;
	unsigned long *rpt_eid_bitmap;
	unsigned long *sgit_eid_bitmap;
	unsigned long *isct_eid_bitmap;
	unsigned long *sgclt_word_bitmap;
	unsigned long *ett_eid_bitmap;
	unsigned long *ect_eid_bitmap;
	u32 ett_bitmap_size;
	u32 ect_bitmap_size;

	struct hlist_head flower_list;
	struct mutex flower_lock; /* flower_list lock */

	u64 (*adjust_base_time)(struct ntmp_priv *priv, u64 bt, u32 ct);
	u32 (*get_tgst_free_words)(struct ntmp_priv *priv);
};

>=20
> I'm looking at this from an API perspective, and I don't really
> understand which one is the "top-level" object for an NTMP consumer
> driver. Is it ntmp_priv or netc_cbdrs? Logically, ntmp_priv encapsulates
> netc_cbdrs, but I see that all functions take the smaller netc_cbdrs,
> which I find unintuitive. Could you just perhaps squash them into a
> single structure, if they in fact serve the same purpose?
>=20
> > +	enum netc_dev_type dev_type;
> > +	struct netc_cbdrs cbdrs;
> > +};
> > +
> > +struct maft_entry_data {
> > +	struct maft_keye_data keye;
> > +	struct maft_cfge_data cfge;
> > +};
>=20
> > +static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_i=
d,
> > +				   u8 tbl_ver, u32 entry_id, u32 req_len,
> > +				   u32 resp_len)
> > +{
> > +	struct ntmp_dma_buf data =3D {.dev =3D cbdrs->dma_dev};
> > +	struct ntmp_req_by_eid *req;
> > +	union netc_cbd cbd;
> > +	u32 len;
> > +	int err;
> > +
> > +	if (entry_id =3D=3D NTMP_NULL_ENTRY_ID)
> > +		return 0;
>=20
> What's the idea with the null entry ID? Why special-case it?
>=20

Some functions are configured by multiple tables. If a table is
not needed in the current configuration, we may set its entry
id to NTMP_NULL_ENTRY_ID, indicating that the table is bypassed.
For the current patch, this condition can be removed.

> > +
> > +	/* If the req_len is 0, indicates the requested length is the
> > +	 * standard length.
> > +	 */
> > +	if (!req_len)
> > +		req_len =3D sizeof(*req);
>=20
> Objection: as submitted in this patch set, the req_len argument is _only_
> passed as zero (the only caller is ntmp_maft_delete_entry()). I don't
> know about downstream, but let's only add complexity that we need, when
> we need it.
>=20

Okay, I will remove it.

> > +
> > +	data.size =3D req_len >=3D resp_len ? req_len : resp_len;
> > +	err =3D ntmp_alloc_data_mem(&data, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
> > +	len =3D NTMP_LEN(req_len, resp_len);
> > +	ntmp_fill_request_headr(&cbd, data.dma, len, tbl_id,
> > +				NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
> > +
> > +	err =3D netc_xmit_ntmp_cmd(cbdrs, &cbd);
> > +	if (err)
> > +		dev_err(cbdrs->dma_dev, "Delete table (id: %d) entry failed: %d",
> > +			tbl_id, err);
> > +
> > +	ntmp_free_data_mem(&data);
> > +
> > +	return err;
> > +}
> > +
> > +static int ntmp_query_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id=
,
> > +				  u32 len, struct ntmp_req_by_eid *req,
> > +				  dma_addr_t dma, bool compare_eid)
> > +{
> > +	struct device *dev =3D cbdrs->dma_dev;
> > +	struct common_resp_query *resp;
> > +	int cmd =3D NTMP_CMD_QUERY;
> > +	union netc_cbd cbd;
> > +	u32 entry_id;
> > +	int err;
> > +
> > +	entry_id =3D le32_to_cpu(req->entry_id);
> > +	if (le16_to_cpu(req->crd.update_act))
> > +		cmd =3D NTMP_CMD_QU;
> > +
> > +	/* Request header */
> > +	ntmp_fill_request_headr(&cbd, dma, len, tbl_id,
> > +				cmd, NTMP_AM_ENTRY_ID);
> > +
> > +	err =3D netc_xmit_ntmp_cmd(cbdrs, &cbd);
> > +	if (err) {
> > +		dev_err(dev, "Query table (id: %d) entry failed: %d\n",
> > +			tbl_id, err);
> > +		return err;
> > +	}
> > +
> > +	/* For a few tables, the first field of its response data is not
>=20
> s/its/their/
>=20
> > +	 * entry_id, so directly return success.
> > +	 */
> > +	if (!compare_eid)
> > +		return 0;
> > +
> > +	resp =3D (struct common_resp_query *)req;
> > +	if (unlikely(le32_to_cpu(resp->entry_id) !=3D entry_id)) {
> > +		dev_err(dev, "Table (id: %d) query EID:0x%0x, response EID:0x%x\n",
>=20
> Can you please put some spaces between ":" and "0".

Yes, sure.

>=20
> > +			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
> > +			struct maft_entry_data *maft)
> > +{
> > +	struct ntmp_dma_buf data =3D {.dev =3D cbdrs->dma_dev};
> > +	struct maft_req_add *req;
> > +	union netc_cbd cbd;
> > +	int err;
> > +
> > +	data.size =3D sizeof(*req);
> > +	err =3D ntmp_alloc_data_mem(&data, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Set mac address filter table request data buffer */
> > +	ntmp_fill_crd_eid(&req->rbe, cbdrs->tbl.maft_ver, 0, 0, entry_id);
> > +	req->keye =3D maft->keye;
> > +	req->cfge =3D maft->cfge;
> > +
> > +	ntmp_fill_request_headr(&cbd, data.dma, NTMP_LEN(data.size, 0),
> > +				NTMP_MAFT_ID, NTMP_CMD_ADD,
> > +				NTMP_AM_ENTRY_ID);
> > +	err =3D netc_xmit_ntmp_cmd(cbdrs, &cbd);
> > +	if (err)
> > +		dev_err(cbdrs->dma_dev, "Add MAFT entry failed (%d)", err);
>=20
> Can you use symbolic error names? "Adding MAFT entry failed: %pe\n",
> ERR_PTR(err).
> Also notice the missing \n in the error message..

Okay, thanks.

>=20
> Same comment for the error message in:
> - ntmp_delete_entry_by_id()
> - ntmp_rsst_query_or_update_entry() - which as per review feedback here
>   should become 2 functions
>=20
> > +
> > +	ntmp_free_data_mem(&data);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
> > +
> > +int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
> > +			  struct maft_entry_data *maft)
> > +{
> > +	struct ntmp_dma_buf data =3D {.dev =3D cbdrs->dma_dev};
> > +	struct maft_resp_query *resp;
> > +	struct ntmp_req_by_eid *req;
> > +	u32 req_len =3D sizeof(*req);
> > +	int err;
> > +
> > +	if (entry_id =3D=3D NTMP_NULL_ENTRY_ID)
> > +		return -EINVAL;
> > +
> > +	data.size =3D sizeof(*resp);
> > +	err =3D ntmp_alloc_data_mem(&data, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	ntmp_fill_crd_eid(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
> > +	err =3D ntmp_query_entry_by_id(cbdrs, NTMP_MAFT_ID,
> > +				     NTMP_LEN(req_len, data.size),
> > +				     req, data.dma, true);
> > +	if (err)
> > +		goto end;
> > +
> > +	resp =3D (struct maft_resp_query *)req;
> > +	maft->keye =3D resp->keye;
> > +	maft->cfge =3D resp->cfge;
> > +
> > +end:
> > +	ntmp_free_data_mem(&data);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
> > +
> > +int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
> > +{
> > +	return ntmp_delete_entry_by_id(cbdrs, NTMP_MAFT_ID,
> > +				       cbdrs->tbl.maft_ver,
> > +				       entry_id, 0, 0);
> > +}
> > +EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
>=20
> > +static void netc_clean_cbdr(struct netc_cbdr *cbdr)
> > +{
> > +	union netc_cbd *cbd;
> > +	int i;
> > +
> > +	i =3D cbdr->next_to_clean;
> > +	while (netc_read(cbdr->regs.cir) !=3D i) {
> > +		cbd =3D netc_get_cbd(cbdr, i);
> > +		memset(cbd, 0, sizeof(*cbd));
> > +		i =3D (i + 1) % cbdr->bd_num;
> > +	}
> > +
> > +	cbdr->next_to_clean =3D i;
> > +}
> > +
> > +static struct netc_cbdr *netc_select_cbdr(struct netc_cbdrs *cbdrs)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < cbdrs->cbdr_num; i++) {
> > +		if (spin_is_locked(&cbdrs->ring[i].ring_lock))
> > +			continue;
> > +
> > +		return &cbdrs->ring[i];
> > +	}
> > +
> > +	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
>=20
> I think you need to be in a "preemption disabled" / "migration disable"
> calling context for smp_processor_id() to be reliable. Otherwise, the
> task can migrate to another CPU as soon as this function returns.
>=20

It does not matter, we just want to select a command BD ring when all
command BD rings are busy. So smp_processor_id() is just a parameter,
we can also use a random number.

> Anyway, much can be said about this, but currently it is useless
> complexity, because the only user, enetc4_setup_cbdr(), sets
> "cbdrs->cbdr_num =3D 1", which side-steps the entire netc_select_cbdr()
> logic.
>=20
> Please strip all unnecessary logic and only add it when the need
> presents itself, so we can all assess whether the solution is
> appropriate for that particular need.
>=20

Okay, agree

> > +}
> > +
> > +static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd
> *cbd)
> > +{
> > +	union netc_cbd *cur_cbd;
> > +	struct netc_cbdr *cbdr;
> > +	int i, err;
> > +	u16 status;
> > +	u32 val;
> > +
> > +	if (cbdrs->cbdr_num =3D=3D 1)
> > +		cbdr =3D &cbdrs->ring[0];
> > +	else
> > +		cbdr =3D netc_select_cbdr(cbdrs);
> > +
> > +	spin_lock_bh(&cbdr->ring_lock);
> > +
> > +	if (unlikely(!netc_get_free_cbd_num(cbdr)))
> > +		netc_clean_cbdr(cbdr);
> > +
> > +	i =3D cbdr->next_to_use;
> > +	cur_cbd =3D netc_get_cbd(cbdr, i);
> > +	*cur_cbd =3D *cbd;
> > +
> > +	/* Update producer index of both software and hardware */
> > +	i =3D (i + 1) % cbdr->bd_num;
> > +	cbdr->next_to_use =3D i;
> > +	dma_wmb();
>=20
> Can you place this dma_wmb() right next to the "*cur_cbd =3D *cbd" line,
> to make it obvious that updating the producer index has nothing to do
> with it? Or is there another reason for this ordering?
>=20

No special reason for this ordering, I will move it after "*cur_cbd =3D *cb=
d".

> > +	netc_write(cbdr->regs.pir, i);
> > +
> > +	err =3D read_poll_timeout_atomic(netc_read, val, val =3D=3D i,
> > +				       10, NETC_CBDR_TIMEOUT, true,
> > +				       cbdr->regs.cir);
> > +	if (unlikely(err))
> > +		goto cbdr_unlock;
> > +
> > +	dma_rmb();
> > +	/* Get the writeback command BD, because the caller may need
> > +	 * to check some other fields of the response header.
> > +	 */
> > +	*cbd =3D *cur_cbd;
> > +
> > +	/* Check the writeback error status */
> > +	status =3D le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
> > +	if (unlikely(status)) {
> > +		err =3D -EIO;
> > +		dev_err(cbdrs->dma_dev, "Command BD error: 0x%04x\n", status);
> > +	}
> > +
> > +	netc_clean_cbdr(cbdr);
> > +	dma_wmb();
> > +
> > +cbdr_unlock:
> > +	spin_unlock_bh(&cbdr->ring_lock);
> > +
> > +	return err;
> > +}

