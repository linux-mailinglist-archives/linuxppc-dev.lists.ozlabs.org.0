Return-Path: <linuxppc-dev+bounces-15326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF53CF7EC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlp7W47vnz2yPR;
	Tue, 06 Jan 2026 21:58:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.69.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767689581;
	cv=pass; b=ZpPAHvf+8UbIc88fcKIAribBcHeHcVurftilp+Fv9XQx/g+0XEx2q6SXy9RIjFxJSGiyUwlm4esy/hDhGXnBEaxD40YbsS89ogkHXP8IZyUaG60k5rniaFoOmqHtx1Z/1tF5gLktdWkoSJXZsdJtB5yr1//WV8ZYP19VA3nuZ0nquOlgckn/YuHheGG2gqvhBZ7eH/YprP8fyULR2d4II6Wu0OYFCDWPlpjqHVPwX3cFGAHaE6UTH74j33pdEnld09f55q6lr7pYEMtAo4cEWIAOThGXDjxr02Cr3JNYq+oEBKGI3gGldf3f1TBgntzKSFS2CtddEr2MtWXbv/Z7xg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767689581; c=relaxed/relaxed;
	bh=3L5lLmiLNrtToGfnw+CqE17UFOLhQuP1YCuyR7Y9ixM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AEbtKMlKNv23n4v4oJVImuyqF3gcQEbVT0VfyLKH+BwTGoNGveMDsSb6tAbd4SmSuKe9159ZUXkFAHg8ZAxprdbRbbgMG7gqkSqxNSZyiQiYKxAXNi0IAyi5moK4DfgRGDMFh9MpeBqtGi5S+RpP2MU58XOTXP/6B36UczKs4GfcTe1pz/GPKPr+PGmrBz3D6M0kupdKG75wVQ2nDrm/OjBAGPEZzYlgnGFSvJH1qlq2mqAFI3IAWpXSb14NzvTELH9TikAAxl2t0vfkJ6OiKmzUlAe4iZxqdw154idZXSLFC8JilaGBKoODzpQqL4g8DEyhZVGp8qyouuiNL7LmRg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XzMVu9En; dkim-atps=neutral; spf=pass (client-ip=52.101.69.32; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=peng.fan@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XzMVu9En;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.69.32; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=peng.fan@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllLN2rsPz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 19:53:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ou8EARJO/BVUmv8voeHGCG5OyuKcLqzXFWF+3FpED6U/k9r2A+2tnc4Td8wTiHLStmosNIcHBwVg9uoKYgCsqdQZWkIVpaEyQOc+jR9Q6yMfJv09Q6pHeDkE64KVy5ogFD6cFlwlPtX7XL+pPxgA2+UcXDHRTX5bHB6gEfbr48kxLYb0OQ2cbyXf2fLdTjgSLTeDrUeLCMiAVgeZN4OMTzIbb+Gk4lsR9CmzZLzNIVYg4rDoCIuIH41YciYbVq5i1nLh/D3TWyrcn9JqU97756n9htnbB8t6q60/CLbIxZPevGkLXpNNRDcQ++WnnYcZRm1M3OkuQdoNm9bSObCTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L5lLmiLNrtToGfnw+CqE17UFOLhQuP1YCuyR7Y9ixM=;
 b=IKdt2Lki1lV7ng7zLR3t/mEoqPiwu7xWZWbqUVmZ2JR5OHpUQjBkAlXcieACMxYZQxhsBtsDhhFNoSOIdjWCbdBeKqNFQ0D6kqizYf7Q739bHEZ3eWBfbuFGcw3YjMLqlOE5WvXSNCtaxGxR78+q8PBv0xSAS3EHrnFG7TMezJRpWvKL3Sge1XxaiSSy6FuXY9tbUSNgzAHih5Ic71azgd46WVmNr2Rh2L5KyY0l1e3Lo2CsbbM3mtd+uoCmWweNRzqVqsFQo8BGWm77LWABBX2j/ZYCh0GWp3Tx9WfH+Coy9Oim2BjoahVzWowWQVKQh5iCDiEGQGA2Zor1BGHsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L5lLmiLNrtToGfnw+CqE17UFOLhQuP1YCuyR7Y9ixM=;
 b=XzMVu9EnjCwHQWoo4WMAu8YsSGA00ZfwAnnmv3dBr3kZL0yvbybb8ARVVKheMf4U0LtrMmGc/OA0DJIzhGN4eQM2WOKRwxUcrMl6BofsybyCAkfTy1CtFRwbfa5OlcQ4YSz7xrg7lrD7yserNcG/JFVpeVy3RXpJWwiAaezcJ77GCH1coFPAwHfElxGYmq+XYSVsg5Z+8QP6zETqjRi3YR2URW3JPYvZ8w4ZRVos7DnHvTJfqbH3ojXzvg5AVbDZDKMaGgfVXnMFlxTrcFiFG0bM2uZHnfPzFicmGP4NpjH0BP0d8juoEK/SJZ30tNpcJfDp1dnZVjwrbTFoyIyhFw==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DU4PR04MB10531.eurprd04.prod.outlook.com (2603:10a6:10:55a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:52:35 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:52:35 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Thread-Topic: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Thread-Index: AQHcfkgARdgdEDNN6UiT+Ejdk61WarVE1vmA
Date: Tue, 6 Jan 2026 08:52:35 +0000
Message-ID:
 <DB9PR04MB84614005E5B12A000207E3688887A@DB9PR04MB8461.eurprd04.prod.outlook.com>
References:
 <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
In-Reply-To:
 <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|DU4PR04MB10531:EE_
x-ms-office365-filtering-correlation-id: 1b5e710d-154b-4c31-cccf-08de4d00f031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T3RuSmZRWDdodWFHTTBZeVBpdUF5VDVDb0pHVW8zZ3gvM1ZPT3Y4VituaVJF?=
 =?utf-8?B?MytZQlFFU1REMTBTc0FsWkV1WDhydWZxNzkvNTJBT2dnNm83UlViWXRpSjM5?=
 =?utf-8?B?R1Z3NmRVby9pMno4aDhhQ2lZcEdadDFzbVgzMXhzbDRTZlhRZzZjeDJpcllv?=
 =?utf-8?B?ZUM3Qk1ORVQwSVRVb0w1NlkxK3M0WW82REhqTDJHNFJIK3JRcVhoWUVkWTRz?=
 =?utf-8?B?ZEwrd0RIWVBVb3o1T0hPcGhrMGpNbFhyZU9BOXowRTRWV3RVUzZ1S2oralpE?=
 =?utf-8?B?dFdSR1JUOUtmSmY4a0o5ZGxpNkNZV082QnF6WC9RVkZPaWdCbXo4U1NmY0dR?=
 =?utf-8?B?R0NPSDlTVk5yeVJVcUl3TzFZaExzSkxsaUxFM1oxdFdxTkZ3b3dMWnpxcnlW?=
 =?utf-8?B?Z01ndEc2QWNJbEVLczJ6ZExLb2g5WVB5REZkSC9zcThSaFpoeHJHOEVTNklB?=
 =?utf-8?B?ZEhuVXQ0TWpUYXZURzFRRFg1S2ZDWFMzQWNnWDRDN1hvZjNQSU0xQURqQTNw?=
 =?utf-8?B?ejZUY3VtcGs1QXRIeC96NXJTSC8vOVR3eGsyc2IyZXZPMmVUNmNqNENhWFFG?=
 =?utf-8?B?ZTJ3VlhvOGlINmV0RS9vMjBJcU03aWg2OWxBYXFHRFplYXhNWEFjWTRob0tp?=
 =?utf-8?B?NjJwWWU2cnprRVFrbEN5V0UyVDdMUU1relluMHNXQXlCbE1VSmRaZ1pHK2tI?=
 =?utf-8?B?TTJ0T1lGU21DS3AyWnhEWWw0UDZnMnRxaFhPdklLT1d5OW5raUVxMUh0MW5p?=
 =?utf-8?B?V1VLQ2hpemZmSi9yeVd2eHVHYks1cFRSejhPamdtcGI1U2d5YTBuRXQ3VTdN?=
 =?utf-8?B?ejhCc3BYQTQ1T0VjKzNWYWFuZ3BlRWJDUXJVcEQyWUNmZzJzSDBsV1N0WFB2?=
 =?utf-8?B?cDRIeHhrajB5Vnc5bW1WSzBOdytNN1cwUkhUMEZ2d1lWMVI3aHVmNTEwNEtF?=
 =?utf-8?B?MmNvOG1PYzZyZTRvYTJ1L2dhc3hVb3o4M3lNSEYxWTgvOTVRTURyYnRNV1Js?=
 =?utf-8?B?Z01lZ2VNQXlEV0FqNVQ4WVFDZmI0bUlCdCt1ZDZic0NXcFZMNFpFMi9ZRjRP?=
 =?utf-8?B?d3pVeG53Tm9JTGFId3ZqYnlUNVhMTUtpQzBneHIzQnBxWFRlZEV5VGtuYzYr?=
 =?utf-8?B?REdHNkRraFVvUmQvSHY4VWtQUkNxN0lMUDFUUUVVbThvTlpTdTU1WE50VHY3?=
 =?utf-8?B?S1NJRUg1d0JQNWRYaGkwa0Jia2dCRkZvcXhuTjN0QTZtalI5R0dEcGcxTkEr?=
 =?utf-8?B?V0pNTWVYR2t5V1JqZUdyOHVUVmRUaTdCUVhLTEpIMXl4MnFlZDFUcTRpM0Zp?=
 =?utf-8?B?THFwQVJhcjVoWm0xQ3RZYTdrTTVyRkFVTytWNEhudzZDWjVycjZ6YlJ4aGRW?=
 =?utf-8?B?ZmhaN0ZjRTJyVnBQRGEwSEVCMmNOckJnbExRN1dDNWVJUDU2Sm9kb2trMnZG?=
 =?utf-8?B?aFZyMmQ4a0ljS2tleGVPRnlKQlNDVTk1MzFmbGZiZXhsM01PakJkc2daSDVH?=
 =?utf-8?B?NEpqM2FaMXA4eWxuL2UxUW5kZHRQK0ZXbmpMS0JTbTBCNFJweWZVOGUxb1Np?=
 =?utf-8?B?K0xzcU5FZEcvY3MrbzVHOU4vOW1yajIzU1dFaGpUcWsybGIxTHVEcC9ya3R3?=
 =?utf-8?B?OXpJR1pmVlIrQ0hHUkFJQ1lWT3U5Yzk2azk5YkZvaGRub3lPZ2ZkTU8rZXJt?=
 =?utf-8?B?RU9iQTByTVZkaWJ5ZlYxaHZ3dDAxcGVwQ0FSdnJFcG5xV2VBVGhNZm90RVlE?=
 =?utf-8?B?RFpHbmRKY042VU1iUDQ5c3E0OXhGZlcwMVNjMThFenhneFR1NGhucUczRG9G?=
 =?utf-8?B?dENaTngxYzdQNWlUUUFUY1FSSGIxVkpQZ093MTE2N1hvNTBOd2pwY3lsa1pQ?=
 =?utf-8?B?U3RBcGJVejN2bEFrNWVrN1k0OGZmRjdCSUZKTVUyN00rTDNRR054dW8rYVJ6?=
 =?utf-8?B?NEdsNElic0Nsb2xYYUNmeVEvZTY2dDNzbDdoeXl4RU02K0JtQ0FIblVhblFs?=
 =?utf-8?B?QUJnM0RyQWNUYkd6SVNTcWhTTmFwclB0czNEN1E5Qlk4SUdWb2NTNjZ6L3lY?=
 =?utf-8?B?VGpQTlJHdnkvUXBxT3I4MzNOa3JNOGQrK09xdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmhWVFFpTEswREFvS1daR1BhdDdzTUwzSHBTa0tuTTQ3WkJCUmdoM1NYaDRC?=
 =?utf-8?B?WTk4QVlGbDZIVDRxRFZYa0pjc25QMHR1MU5mNVh4eitjSlFFd0JoQ2k5SjBp?=
 =?utf-8?B?NlZzL0xUbVRrbFhma00wb0hLSE1pMUx5QkZZS0lFT3FZSXNUNWNrMmxEdE1o?=
 =?utf-8?B?ODdPNFVMWkc0NE9JeXh2OUVVLzBBNlM4eVlBVUpWOVZ2bFVJUHpnSVpDdzc3?=
 =?utf-8?B?Y1h1bGhTZXN5Rm9QSW9wOWEvR25OZDc3KzU1ZDBHZ3JSR2ZXV1kvTkJ3Y0Jr?=
 =?utf-8?B?TVdlTEkvSzI0US81ZDdZL2Fwdmthby9FdjVFeE15VkJ4TzlBbHJBRGkydU9m?=
 =?utf-8?B?TFphVlJhUzFhQnV1K1M1YVBZOFdOeDBidFJZMERNWDJYbHFaSEFWMzQ4RUhJ?=
 =?utf-8?B?ZnZCSmxmN3RSL09LRXdkZnkvZjlFN2Jka09URk5GTU5ZQnFIU0NoUWQ3YkJs?=
 =?utf-8?B?YzhHdXA3VndMT3Q2UU9vODI1Y3VZbXh4RUNEWW1LZC9hV0Jua2U4UC8rejJI?=
 =?utf-8?B?aUhqU0h3Tk9jZ3ZTOWRlaCtFWm1HWXduQU9FZ3lBUXNETWZvZk9GbGRyNU1K?=
 =?utf-8?B?NXlEdE9hYzRsSEdpMUtyZTRIcUFwdWFmTUtra041b2ZDSUtVQ0g4WC91RnpY?=
 =?utf-8?B?MURzeDhSd1JhTzFuMzQzQWtTb1Y0d1ZzQTIyOE5LakNFcTBvdHNyck5YUkg0?=
 =?utf-8?B?Tm1RdFN3U0dKeFdYRUFMd1FhVUluTGJKTTlFd1M3U0VROEJTS2tLZTZFMXZE?=
 =?utf-8?B?U2RUMEk4SzMxSEpwR3lqcHVXUjNLczZXRlg0RmdiL0xDSTRTRGR5OW1KQUZ6?=
 =?utf-8?B?MGF1ajNGdW9nM09ZR3NjSEEzM1dURHlaaDg1RnAxdTBteEh4RkRldkVwMmpO?=
 =?utf-8?B?Y01yNU55UXpBM2swOVRTUTZkT3F2U1JjNDBpN2xUN2trSVdEWDJlMXpjY2hV?=
 =?utf-8?B?NDZsSkozeFFYR2tQQWpRMkdyaFlCeFIwaXViWGRGcEF4bVpWMkZCbDc4UHFL?=
 =?utf-8?B?K1l5d1Ezc3hCYjUwbk9PeUgyZm5aN2JaeXhOZ2JZeUZZVzNnbHZEamtvamdE?=
 =?utf-8?B?OTZxRldDMmlLY0NMNGJxcHpMajg5NDVlckdEWWRiV2dubi9ld2ZBUElHS3RQ?=
 =?utf-8?B?ZGtOTGNNNDV0d1M3QWNoZkJlQzY4RHpaMDhxaXpWdlN4d1dKQ3Q5WDkxcHZy?=
 =?utf-8?B?Q2pMdkp2RVBpbmRoSTBUMk0vWVAvc0dvZ04yTGFYN3VtRm9YYVFUSURSazMv?=
 =?utf-8?B?dko0SDdRbk5iTURoYmFhT1o5RnBteTJNRVQ4ejI5OVNwZGpyY000MGNVZmov?=
 =?utf-8?B?aFpxY0pqZlFYM2dXc25neUovZUlFYlJEb1p6emxQUGNnaEQ1b1JHaUdpZnVW?=
 =?utf-8?B?dktmODQydHBCTWJWN0NLaWJGakdoYzlrcDg2dWxjckRsQmJBRzA3ejBSY1Vs?=
 =?utf-8?B?cGFWa0JMWmpvK3pGOEJVUEtvSy9vWmxYSUpyWmJmY2lOYWpUZEx5YWt2UHhs?=
 =?utf-8?B?dTVQRnZIN2RQTm9PUnc0eUxNTXBSZlE0YjFnc2h5bmE0VU10VzhycFNVTVcy?=
 =?utf-8?B?ckdhV0RFUXZ0dXRqM01wU3o3eFRmVTdyRXlSTU5DWVFOSGJHcVJYZGwxZ0tX?=
 =?utf-8?B?YVJqOHAvL0RxTmUwZ1ZwM29pc0hBMFR2Q3ZsTHpLYVRmZDFPZGVrUURPSlBD?=
 =?utf-8?B?ZHNuNlZobkVPV1VpM2RScTQ0eWcyRGN2RXU5V0lOZmc2L0dsMFh5bk01N3lD?=
 =?utf-8?B?RWIrL2FVcjd3WVBXb1NGQjlsZHRQK1U3QVIyNXN4V0NlR0lSaGNmdE5ScGdB?=
 =?utf-8?B?bDhYK1J3VUk1OWxmRCtPTnVieTBBeGFUQTBBMmpLSDVSRXJWaHNWSjZYMVY3?=
 =?utf-8?B?SFN5WERDL2c2anZTR0FRRDQ2R21rMVRNdTVLVlJ3am8zQ3JNbmIxdHJRSXdF?=
 =?utf-8?B?NjZ1d0ZQbnFreXl5cktVUG9WOTdhTzVxRFNFTzR2dytZSWxqeHVFbFV5aDhi?=
 =?utf-8?B?NmNxZmtnRmVUNVQ5bWJWMTh5Z3ZjQ1hWeTBWTXluOUduSmRzOU9Lem0yK1pu?=
 =?utf-8?B?NVVka05sM1VJTHB3a1ZaSDA1SDIvbU13RCszRjhvQ2JTcFZxYVJDV1BGZzJC?=
 =?utf-8?B?ZGM2cEwwYXprQlZodm9IajdITnhxb3U2c0RndXRqREhDMzZoT25QaElVMzk3?=
 =?utf-8?B?bC9BdG9wa1dLMkZ6eldkNW1KVFRvRG5rUGVLaHhLS0hGSmdrN0hMY0I1TS84?=
 =?utf-8?B?Wm9QeWNzR3lJMFZ5THlsSUJ6MTB6WU15NkNvK2xXbUFPTFVNUUlQTG4wQ2dM?=
 =?utf-8?Q?kzu/+pL5dNUKKvbKhi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5e710d-154b-4c31-cccf-08de4d00f031
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 08:52:35.7796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHcm8Qp1DZMPnESLlLtB937nNdzbdxsBHyxtgLQ5t13FCln6aauCjVywo6iwh5W0AjfC+0w4g/7M2yGUNqYkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10531
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBbUEFUQ0ggMDgvMTFdIGNsazogaW14OiBpbXgzMTogU2ltcGxpZnkgd2l0aCBz
Y29wZWQgZm9yIGVhY2gNCj4gT0YgY2hpbGQgbG9vcA0KPiANCj4gVXNlIHNjb3BlZCBmb3ItZWFj
aCBsb29wIHdoZW4gaXRlcmF0aW5nIG92ZXIgZGV2aWNlIG5vZGVzIHRvIG1ha2UNCj4gY29kZSBh
IGJpdCBzaW1wbGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraQ0K
PiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiANCg0KUmV2aWV3ZWQt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0K

