Return-Path: <linuxppc-dev+bounces-7676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2CA8AE32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 04:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZclR71C3mz301B;
	Wed, 16 Apr 2025 12:32:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744770723;
	cv=pass; b=lnvNRqdjo14pN97TJmNTTKyjbT6CV8K2EyCUATia3Oy9A9ztsrzlgZWzx+Y4yQgqKHlcTWvlDbVDTCOAFr9eKbddwXIP4rXok8VEONMDG+O83vAeIw0Of5hriDLiZ40mbic2EIhwnbKmHtL8DLZka/4GmhgreXWPmQYiiF+JFrxVN906PAnrT/mvA4xVamD+Ui4iJZ/SEURD1sb+8WgtTEsNg7JGsE+x9updYBPflITU64h+47S8XnnWnjHuOhH4J5fZFL27QSVn/NttmJZy1Pve0X/m6elwCUdENQSBc08Ezd53fHO/3XGVhLyjm6U+gWyhGbI/EuygW1OaGHAh+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744770723; c=relaxed/relaxed;
	bh=h8/xK6/IXfGXVHLB0zW15sxxnOlMVcMqiBjxz8qo9AA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e8nVhNnaD7IauG5PB102xlbllOus9cwJKmn2IKzjxo10g4uEaTP1+ddYB3q3A0LWiJJCsWxdEhOfi0Ds5qQ1E1pRyo4Fdai/boDXMf43Oopt0sM9JlbZQL9sqe08wfzsC7i46SnFkavHdOmJM7tOEraSmOOVYKuawpDUVjpb3LJH9LKRGLp9+xtEUMkC1iOZ2PWUD5IReSw1jUZaosXGpuDc6Ju2c3fWNdFl46VnAtqQ9IpT/hlgPa1g+LcLFNJVmoxjkMBqQC3DeoZQX4dc4cuaxcvvXshSSMU/iAhg8mPZG/m5LI2SYrcrMMo89HPXPQ9sxb+b4Zc7hp1C/hwBVg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZWhlqq/2; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::62a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZWhlqq/2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::62a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZclR53npyz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 12:32:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWJVRdw8tcRp3w4mYNporKXAK8QiO2MeH2f5LQVMnbeHXcEjDj1WLxKntu4AuccS9AMcmTrp6p4ExfxmKI6nfF0F3Wr78y97cAR2qRPiImM+eIj4CfD7twUOVMpEiphspql2Idg/5EwkHobHSQpJzb34Bw8X++hD5YC2IRyBgCr+V1XuQyAhSKOkx1q5+TyQoPT1LCBTOtjIkCPnDFbhT0NMI2coObhae2BnqBzKywUonSMwfS+tEFz4aikJlKlpatrxDCCzIHQCiwI9dF8GbeOSSYyKCSLH0R6k/GqwFemgPf4cK7qTtfCe6v7HsrxPEBL3wdD2NkWWC8LAv/r6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8/xK6/IXfGXVHLB0zW15sxxnOlMVcMqiBjxz8qo9AA=;
 b=KM5CkdMUVAMVeEIdKcYkm640AUXcL1a81mV47Se1ISi2i2gm9rBLBZ2Huy4YOTEs3Q2XGP1/F1J4xMTENGNJBEYhsITJvd9vJFrESUC/KtBhS6VSQvdPW7Uaytqf3T0uoqueODqHnI5wg2Jq6t6TfHPC2w7Sqq8RSyhWBIajr4cWVWveekSBbzA2Gxkw/gSqabPzxwzM81yOqwX5/htNLSR3zXqHPuK/5QaMjNTWVsn5c3TAoq5lL5wurM+OUbFrfQ1Hf1bZ1f3McyPy9Sefm4KqG2X9KDYJ2bVffK9rTCufupENgzmsOlVAUx1McqXS+U0/k9fz9W+HD3ZVGHNOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8/xK6/IXfGXVHLB0zW15sxxnOlMVcMqiBjxz8qo9AA=;
 b=ZWhlqq/20nF2oP/shWoZnk9Fh0EknaKK2xmVNLkUW5d+W5nspgrC21GR7u1ATWbnvghlm5JsMuOh3VCrzjymUcobRUb6wzVO3R2xl/EGZt8MYIbxIfZG2vDFEqA0BFmEoBerHMDNvedy6mVdhT9Bfsr8Uk4FW/jvu9y3y03YFRPIgEsZZXN/LYCjH0MK9veMtXWGqdIgylWHWu3nGxoPXy5kXLwgw88/LzAa0BcTU5X2yWUmUw+1uexe32PYEDbb8MO7sn7QM+9R5fimWj2QkaXYLcV2Eu1CrORC2ZdzVccB/3g0ER4qbOkjlXfReYPfuXKx69TJcjgunho/fqir5Q==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 02:31:41 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 02:31:41 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>
CC: "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
Thread-Topic: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
Thread-Index: AQHbqsrsJYfokSDnyEKJtdbgoKWKSLOkwxaAgADV5QA=
Date: Wed, 16 Apr 2025 02:31:41 +0000
Message-ID:
 <PAXPR04MB8510245A181D998FD206580488BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-7-wei.fang@nxp.com>
 <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
In-Reply-To: <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PAWPR04MB10031:EE_
x-ms-office365-filtering-correlation-id: b1c348e7-f6c1-4506-6f33-08dd7c8ed289
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cK5pezxvY18kXB6QwCE5xD17PrW5e3y9lnww462e82E/EJAy2pApaebX2YSx?=
 =?us-ascii?Q?iC2/a9izalRFvAUe2SNVfIoL0uEFsjzdcQK49tGZSiMjTsqTY4kLaiawLtCh?=
 =?us-ascii?Q?G6RPPwH1Ltmzhsk5xqfXnanTxGE/gqyJ9KkaIBhS2CFM2/ww/7wbeFNGOl4I?=
 =?us-ascii?Q?A8esN3n+EvgaNbCz4ALzYB7ulzowF8Dn+UJjGLJYQ0nEX9nnHmYvb5iF4gJ3?=
 =?us-ascii?Q?eN1FtOrx0RrAvm5McLRIB9FqLak4UOdAqWksD8IV1h2k47cl8v8r/qIsnXVa?=
 =?us-ascii?Q?p922tLa3kagoCFqcXeKYyM5KxbLlK0Xs6FpLwNIgX+5f8qVInbE7nOONQT85?=
 =?us-ascii?Q?b8Qiq6SQ/viuzS548GjWg7zVX7SIOHYEBZ4Ku3TN6jjRrDODhqi/7DEIQr+o?=
 =?us-ascii?Q?XQusZNEL9l5244yl/jJmAUmXLYbz0JNVamCdzKXCbO+BzNy0p0peY6/AlM8e?=
 =?us-ascii?Q?FsFs8fCcGP3M+dp3nOFvvSRi01QRVJxp3Isu39/q9PGqk6BVyKRVSN/JaiT1?=
 =?us-ascii?Q?zx6FBnD9NsnsOqtOqv0E2Hr99v1G5Auflk+HrHFMZEJsAVQ/oSX5e870z806?=
 =?us-ascii?Q?bi9T9x22GU1bLUb5LiU9t4KKKcDkaouz2I2j6Wkk+GBEJYCHXgVEGIR0biRI?=
 =?us-ascii?Q?0aCiOufcwHbHjpN+VX8alCbdlBj8ZqwcfoIhEm223lw6rSxodd0e6fSDJUyb?=
 =?us-ascii?Q?eLNO1QmWYSFTUIrATsviGmrPAU32X5J6tjGCDA6QTTHc1IePgQDP79zDkcvk?=
 =?us-ascii?Q?5as1ytAIjVagWCga7G+SZT9af/80sCrNbVsCi6sgpQhOgswJQDiRUaW3Mp2j?=
 =?us-ascii?Q?BBJbyC9VhviGCWpb8bEesWnK5Il0xjlGgKTQ9vz0zEjl+cT0TPZ3ukrpAbpg?=
 =?us-ascii?Q?NEJsqTsVRjW+4eiqlbhbE28mkwtzxhNHupld0DFHqi+xJs5th3DZcGro5FDx?=
 =?us-ascii?Q?BGgh1mqcxINWg1H6tNZW18Xk38Eaizd2gjoKa1uTDoxNA3SEXikxRyxilUaB?=
 =?us-ascii?Q?9VqPZm9cTIe5YBQc7fnvkGLivr2LGoq3DMeim7ddX61uVvg36vvnnzRxgVEg?=
 =?us-ascii?Q?UJJwOuMuTQJxHDJHp5Azfr+it1Ra6B7eBtfm2s9TxnvW8g9h5QqjnQ4sTydv?=
 =?us-ascii?Q?ywjNkG8NtZ25Lqb/6M+wlvmPiYRBjOvygAxVsjBhZc8c3HMfse3o/TodkoeS?=
 =?us-ascii?Q?sO1DrCaqBo6KKq8WFE7/U97m7jtwXJptAmHHCpGRRLpBueEkNEsbwcioelW6?=
 =?us-ascii?Q?OdAMqvW4LlFMVbRF+jsPQuTvlGwKZJlEvzMdXXSZYP+s+5UXg32YUzRz+fu0?=
 =?us-ascii?Q?gHo6CURzNKOBLn+nkITy9rK2yu3o4sg9jgc/8jFfh6G74lNn6y/8A5rFeb5t?=
 =?us-ascii?Q?YUJpMcwXU0olHAuWvD1RqW7+F389sVhsBi8iXQdv8s9wNQJAwqcmYFxkYERL?=
 =?us-ascii?Q?nqBNlVtFicG05f5nFWZp0lQp3Bte3vCee2l7sa3ztXoHN7yWNShzrg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6Nk90p2fIDw3u44BGC6iTt8rDblb8wU0ikqoEhVj0DAoGCat+KsmDOsdbuyP?=
 =?us-ascii?Q?O6M8O4YzWZMFhGFhOn8oADpaYhx3RTAJBzr3gSGWy7bvTEQ7FvD0Y7g4DK1g?=
 =?us-ascii?Q?Ybat81UzEKVOqpxSSyFYS73Bl+1aGhjmwiTrtJyTTZNilX9w0Erz8DwiBQ6N?=
 =?us-ascii?Q?W44M7wOh4F+n729OjqWuV/7FGbDpgbksKnxPJpgHpLrhJ4PWtTzBkDm8S/NK?=
 =?us-ascii?Q?3K78gEGRT6h81zib0/aa5hhEFquKFYH4lvjKYVzMMEv26B2zdPcuRckl0d+2?=
 =?us-ascii?Q?sbP3UH0hoYXHfOEhg942C0G+2u7vWL8TOBKcHmPutcoaylXJypOdlaOXg1yT?=
 =?us-ascii?Q?4iSArKvakbr6K8wpfyWjmUy6RA09Kp2uZbvEH8VnLVH2erCV6A+QNqye75m1?=
 =?us-ascii?Q?f2oUConY7Zw/rou9KIAYCQnN2RG1ur8botOM+SO1s0wtUms0dGh/SMfDwZlQ?=
 =?us-ascii?Q?rdW/+SzunGM57sWAm9pTIwzGRX7LnVVJvsyGvPBclYghUivgZJbF9hJVLVu+?=
 =?us-ascii?Q?QckfpfZiSRG7MImzDQCXVDeI0SzFplyZZHQv7xne4xKbKkb3SBxfLvhTvVMv?=
 =?us-ascii?Q?2L7HSnfHa4dxs5AiM0ZDszKxwHi0Q5bzE2offqSMHTEnJlfXBoF6/lQfs2tn?=
 =?us-ascii?Q?+EnYwjTJO2BrK9OTVjNrEDZyAMeXXWvBur5SPooKLS0Q/uHke3mudi18BNhT?=
 =?us-ascii?Q?GLYVoPujrae3u+dGhsiyXr3tpHk/FkSsGDrovI0ZGCoRsZ9GaO5RY2At/XXj?=
 =?us-ascii?Q?8YUQxZfkrVACJik2LcVfREMJCQfHOmLNLz8PSzkW+hEUmGyR8pdxxQRcbIvq?=
 =?us-ascii?Q?WzSPsN4ZcolgAUnmDbyjO1KCad1UBN68MzPT7I5qlHThjJu359QlvPYt6mGB?=
 =?us-ascii?Q?BbVX7Dq0RwsCmkLQif9LOXYGUrmo3o5e/WxSdaJh4ToaMsZCkjsdxQ+9zBSl?=
 =?us-ascii?Q?NbYmdxWQsxh2c5PaL1wxtA/Hy5nb6Uz1mTpJM8aFLcDC2gxVTdy5zua5da/e?=
 =?us-ascii?Q?sz97RUr8a7rIMtb3a8Q67DzZBd/G0+Q1KDpMNxjrMnqu/M3nuiOnTml/Mnfr?=
 =?us-ascii?Q?365mZsT9NAhlLtJwK1ZGysCJ560ftvYKt7RU4rVh3zF8Bz6URtCfWkuUxpPB?=
 =?us-ascii?Q?THrokLFMXdgchWM8cP9gMeZalW06G/JA4y/9s8SytvdrZJpvA8vcKnEtVOc3?=
 =?us-ascii?Q?kx9DQvDo+8wkp6PA8vafzcvcthIVnLz+KRWqNV+w71UuHkU/JK+2J3nhghw3?=
 =?us-ascii?Q?/thp7LQ+fPATa4zZfr9RtJmxyJs8KwrcIrwVm6tTFxEoJjRZmCl73RTkGePn?=
 =?us-ascii?Q?EixaTl/MyTIPpD8AlMIseOpirNibC+P5yYmrCD+yFkF5f9WOVXNmk7urqmc5?=
 =?us-ascii?Q?3NKkRqzFdyBvnCGW1FPaYEnZFighfRTEJ9Q9DmDEpc0ou2zrgFiAKJz4tAqT?=
 =?us-ascii?Q?WnHaH9Ckz+hHfUCFSB+HDnC0emlDCmt8gvIi9GveG/swaoeCYU91Z7OZ/1GW?=
 =?us-ascii?Q?+L+ioR1K50k1tN+fSMfVjgyp1U9chzVMDLkbuQ0ehSUwnm2nANt/KMYwvta8?=
 =?us-ascii?Q?iu9owvNmGksdI4rhAZQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c348e7-f6c1-4506-6f33-08dd7c8ed289
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 02:31:41.5464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zccLyUaA513XLwy18/FnAt1SgnnbFXD8Nd/0HKLSn2s2CVApdoK6UUTSP1lXJwwY/OU4pnZ5Y7XPx8i2YFZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On 4/11/25 11:57 AM, Wei Fang wrote:
> > Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which
> > is different from LS1028A ENETC (v1). In order to reuse some functions
> > related to the RSS table, so add .get_rss_table() and .set_rss_table()
> > hooks to enetc_si_ops.
> >
> > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > ---
> > v5 changes:
> > Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in
> > both enetc v1 and v4 drivers
>=20
> Note for the reviewers: this changelog actually applies to the next
> (07/14) patch.
>=20
> /P

Thanks for pointing out this mistake of changelog.


