Return-Path: <linuxppc-dev+bounces-16392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN4yK0w7e2mNCgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 11:49:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E36AF1C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 11:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1wrR0xtJz2ydj;
	Thu, 29 Jan 2026 21:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769678268;
	cv=pass; b=HVivaM1dPn27JcawNWcTqFhGVyaP4ItPP5pnvDbr7mvL0Ro4sUH9hAzTiDxn32gcT/paECdE1aFq7RnyTFogX2qE3bCW6rS0W/8+KpdykJ/e/NWbUdtIfeA053f77c5d+SkWMQY+Y86WCvc4ES98e06fpKqXG0qVZKenlF28nKM3wye15MEJRLptDOswV88iFt/OJxO6hvS/PqWA6zAwvP7c/uO9npAVMyDS/IDdsiN+jFkmKcbnb9HGLETxbv3QJyRy/T9Bf+GGWxgeij/QHljTelEUXh/C0dF14ikvHauu8JGTheLvLqKkACsvvmE1Ap43jiMXHBQOaeQCS86gKg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769678268; c=relaxed/relaxed;
	bh=bWQRtAEyl2Z0yAwjWUqg4ZmFkQx8ersY3ysG/h0RZoE=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=SYWYDVxuTf0qJZ5KlQGM50V1bVN67qUB5OMNW5Z04ljzp5BhSdcUoKWSE6ZA3FykcBdMrlYC4/g4lE0AWep/ZDZxhMI4EcraOxZuiAwaLMOo/jKBRdpJewNtM6QdGATFI9+nrPvIhiAcG1mKB6JzOBWcjJv0veUgDDxWDCqs7mTdCM6z2wkUHX/uO+Pbb9qV0RbXH2xUeyG97wSPpxXoJkIRMrtSHauYEBfBUXoxhFYONoBECSxruCLcRiOOzQHJUk/rDfjpC4WAdibcgTyCSSWdH2gFznzRDacMud3yrpq+9gSQOocF14u/rVVJ3h141sLmfXzxtCSJl92d2yOL2g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com; dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ALPDhsor; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=daniel.baluta@oss.nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ALPDhsor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=oss.nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=daniel.baluta@oss.nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1tpM22YJz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 20:17:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIrFcUWGUzBFxlE0sqjqMnMTJdOJ/Vgaspd5xTJ903otxLFdIhd8wIASK37WCpJilct8EL/Zdbhv9wriXjcZxy+BCeDidj4vACUg8P//96WctfFW8NkvmJFR2GiBvLl0tizmfLG9QuZMKkXtoP7FCURVRjEsYEwq+ebQqXeeu0X289tp8NY7s12BeXbNVRkmT4tsogUvOP1KDmbGBxSrM7F0SEHsVvojAWw6c/JXV2RoXpL3QWLYy7Sf7VP3HVNnE+Ie+4mp55U+xP2ump/L1c5G49xKw6UBOqnbKM+Zd9cRZ6uXz9hsn7505XJQAeiNEBqg2fJvJWs+aWZtYRqpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWQRtAEyl2Z0yAwjWUqg4ZmFkQx8ersY3ysG/h0RZoE=;
 b=ai1UlOxksJEfXAGHB5nPEGVJ8HDXGue2sztxzYiWD93kzFrIkXW+31nmFmA58L8aSw6G0HbsbYulh/ulce+wmVmAMXuqDKD8fNFm72v6IKrlILQ6ctfnoymGqHT4ROwW0xJhSszaFLLC7PW7Qj1wTaT285gt8jBa/Lvmv1XEJ+fIY39rxg30AQR2SVfNl5j3I3+Oqv1XTynCX+3sHWPVRDOO4glXuR1Fz0MIulRE9HGmUJKKArBBtvz6jX4cXz2/ppv4Sf53LUgnIYjNl4wR7gRUSjgV1V4R/nKk0zmvKg8ZA0Gowlp+zHRMQREQ6Du/tilVBmjP1pv+wzkJ1hyZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWQRtAEyl2Z0yAwjWUqg4ZmFkQx8ersY3ysG/h0RZoE=;
 b=ALPDhsor0emnx80MJOsbwXU9Yox3Gr/ACAH/t/2O+xw1byNlQzhDSI4XHoyCLUDLxVJDOxdG/eZw3jLt9+59+907d0VuCHeOGcUk3CYLdzGXhWJa4ShS46aXPqxiOS3RJ2Es9QFuRQp3OjLi4q2l8MDKGxGlQcFqb/FoCRNAS0b+xauWjbpeOehGOz/9Ho4mZzbv2saBvCor5gg15+wMI8vcRRQjOdIlPzO2uBKO86Jwba0GYgcIVYdEYYarPRvl3IU74LnJa5MV+RmjdCFdGZrh4h01lcGgWZ/mMPpqM9fWKopTsONDDjFIJCmIPaarSY2mGbYSXlyiKTLSROxzTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 09:17:17 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 09:17:17 +0000
Content-Type: multipart/alternative;
 boundary="------------aexFGhz9upHKtlzg9pgEzqdf"
Message-ID: <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
Date: Thu, 29 Jan 2026 11:20:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260128071853.2602784-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AM0PR02CA0165.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::32) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
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
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM9PR04MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e829a4-e2c1-430c-86b1-08de5f1732ac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|19092799006|1800799024|921020|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlF5d0l6TGxLdVQ0QTFwZ1Z1QnFmMk92azhOdzc0RHBtTnB0OEpFZjBsdkhD?=
 =?utf-8?B?ZVkzMjdic1J1dFBEMkdFYk5TY1hlSE10MWxZaUlsdGNxV1oxN2t1Ty85MElo?=
 =?utf-8?B?b2M3clliT3M5VXdDWWo0RVRVemxYWHgwRUhhb2tzWHhXWVZBY1lVdTBwYWIr?=
 =?utf-8?B?T3RCRzVscmtVVDgwN2dKb21LTUtJZ3BlNERWN1QwNHpVWFZLVldHZWVSaHk1?=
 =?utf-8?B?Qm9DZzVDWXYvQVFmQTNjZ3IrQkxIWEs5dlE2S3BCOHdpeWw3SnNFbkpiUEpJ?=
 =?utf-8?B?cnJBbk1rampobGl6YllsdG03Y2sxckxqcVlqdjR0aHZDSCsrUDI3VHlBb0hB?=
 =?utf-8?B?Ym50djk5RlFzNkZZTG1yd3ZyOU5FQ2dBYnBjaTR5bkVSWDd5QkhDaVBOdC9Q?=
 =?utf-8?B?QWJyejZkUU9LL0hrZEE1c01FeXdmZnVjcVdKRmRYbDhtUkZ3blhBaVJSVnBZ?=
 =?utf-8?B?L2ZGNmZGSzdPa1lrZWIyRnc4WmpkakdjV0pJR0YrZzVmZHdXeTBYSnl1V1p1?=
 =?utf-8?B?M3F3bWw3bGptUzU2YVQ3YWFFWjZ3dzdkNW9XSnh2L0JWMnFiRkcxcjAySWdu?=
 =?utf-8?B?ZjdmcncyTnNRbytxaE51R3VZTldWMER5QmhhNkhtb1NBTFYxSEpMSHRjaFg5?=
 =?utf-8?B?YkNXOGh0NENNUlRYQ29uWnF1c0FUVGhsWS9Zd2crNDRtQnloSEpoUGdiSVBC?=
 =?utf-8?B?NjZsanVuTlNDeFA4bFI4VXNXVVROS1phZ2RIeEk1dDR3cnMzWkk5b2hkV2gz?=
 =?utf-8?B?d2d2ZFp5RjBvQTU1SmxWR3RHa0pRaHU4Q2FaZHJtL3JCbVdtMk1rK2E1R00v?=
 =?utf-8?B?a0lXTXFudTU0Y09VR2RnZXh4eklqbmNYaVJLcG9YQjFsRGhxSU9IY1NsUmNy?=
 =?utf-8?B?ZFp4cGpXdENMajJHU0dkTDdXRi9WN0dsZWFDTlRmWW40TjdRV1ZvZDRGWERk?=
 =?utf-8?B?a3ZGS3BZZ1NDK3FQNko3SWcwWXRXZXoyWWxpcnk3Zk5IUSsvTG1IY29MN1dh?=
 =?utf-8?B?eTFJVnhyVnVJRDNJZWQyTElSRDMySlFVdzljUUp1YXZLcHNvY2pxdkh5b0Fo?=
 =?utf-8?B?LzhZaGx2aHlrN29TcHhxZGJWL0p6eUI5ZnA2Rmc4VVUyNHFETkV6blhEWFBr?=
 =?utf-8?B?VGNiR280ZTZyWEttWTlVaWg3MTdBZFRvV2dqZkQxcEsxR051THRadUtiNnhQ?=
 =?utf-8?B?NlhNeFljcHZWUnVoTWFxM2lXY3ZHNnloem8wL01FZ1UwWjN4U09hNXBvOGxD?=
 =?utf-8?B?VDZPT0FMMnVRRFJGREErcDV3ZE9XcFF6Sk44blQvOUtTS1pXQThtd0duOVVO?=
 =?utf-8?B?UUV5Z1dSaW5WNVZMUTBzcDIybUsrV2svVWtKVDVjTHlrK29IdWNBV1laMnZq?=
 =?utf-8?B?U0FhV3M4Um5ITHVSSGpKdDdZWkhUUWc5QmtKczhyeWl1QVRhQ3BIYjJzaXMx?=
 =?utf-8?B?b01MZmxUc3MzV2tLSFpwTFhwSTZRbkQrUWZwSDZjamJsRjlJZi9oOWQ3dXhz?=
 =?utf-8?B?YUc4eUMxcXJhcDZubEh0TjdrR01PTFFtcUoyWElhdnI2cEduQll0bllzemNu?=
 =?utf-8?B?cjc4aHcyYktsSHZwNjlkV0pscjNuUktxZjErenNvUndvWWNmR250THpzdDEw?=
 =?utf-8?B?ZVRsYTJrbzJiRHh5RzkwcjZoYmtab3k1L2RFWEVwaXFCWkYrVXZkSVVtUGxk?=
 =?utf-8?B?T1VxYm5XbGJmUWthcUppYWp1OExtY1BSLzJJMUlWZENPb29QYWRwMmcrTkF3?=
 =?utf-8?B?cTBUUzRkMmxhKzJSdUQydE0vZ3VsNlduWmgzWmszSitJQWYzcDhGRDV5ZTFl?=
 =?utf-8?B?ODZvSUNQWDd4ci9pRjZpODg1M3NNZ2M0cXhoNlZ4ZExkQlBZNFozNjZWN1I1?=
 =?utf-8?B?Q0pWK0xiTFZmZ0pRMXVGaU9rcVplRVZCcmFiRnlrVnMvZDYxN3M1aWhMRitl?=
 =?utf-8?B?V3ZTRVFDdzNvRENRK1c0QW5UaE1CWTFHV0V1VXAvTmlhTUcyTEJDTXNJTUdr?=
 =?utf-8?B?UUt4TGhmSzloZmhzaWRRa1RDaUlZT0ZOMTNOUW1RTGYvWU1Ma0VnbmxpZkYv?=
 =?utf-8?B?aEg4MHJIU29ZM2VJemdEdVhxK3IvditRVVFsMTRJdDNWbU01eXVZUkxhNzc4?=
 =?utf-8?B?bkdTZTY1Vk5Ybm1OWkRPU25nanJjSWVSUEJ1TVl5OWdoWklKZ0tabDNMVUNL?=
 =?utf-8?B?ZXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(1800799024)(921020)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ArTENxbEMwWExHczZOUTJuM3llV3lzMFhqeVp4ZzZOT28vb3RYK3dVYi8r?=
 =?utf-8?B?eWh2aDBGTWJOSnJ0aXFubkQxdEpmTzEwNSs4UnVaUEpoTXQ3QS84VGdFcEM4?=
 =?utf-8?B?R0orMG1IUTdBcDVtR25BQmtZUmY4ZXVaYWI3a2gybHZuT1Z6VUtIN2Fsb1lk?=
 =?utf-8?B?ekRsOUJ2Nm1JSFdkc3VYWCtQZ01RemVjV0kyVWZ2TE51cVEvRVlpb01uME4w?=
 =?utf-8?B?Q2kwSjhlOVFSWWxyUkdOdC9ieS9kVDlTWlpKaVJvWVNRK0FDRzlzQ0t1RHZZ?=
 =?utf-8?B?eFZzZzFOdk5COC81ZVFrQnBhMFdqMFo0U0p5UjhHZVhSOFB6djJSZXR2OUVV?=
 =?utf-8?B?SlN6YXc5NXZDeTRUdjlCVGZRTWlnaTdJdFNuR1NtMWJ5MXlxZ054T1h2ZHl4?=
 =?utf-8?B?WUg5VzlvYVRsK3FyeHM5encxVXNvUzJseS9nZ0dEejhWajkzRkRmS1VDaHZo?=
 =?utf-8?B?MXVRUXJGTi9YNlVheEZubzZGTEVWbzVtQVVNNk1ZTVhjNGZicTN3SVFKeWRE?=
 =?utf-8?B?YkJkcHd5Q3JxYTJHNzVDbi83ZTYyVEZvMi9QajhkNTR5T2RPdE5QcjU2VlZr?=
 =?utf-8?B?YjByTHhrTllsNTJ4aVNkQXJwWkdXQm05VUkraFI2eWxtVlVRYVJ1ZGFsMEhK?=
 =?utf-8?B?YUNDTzY4UXp5WEd6S05aVnVLU1hmQWN4Vzh0ZHR1Y3V0RGVmTGV5UWtUNmU5?=
 =?utf-8?B?eURMSmhpZ3ROMkt3T0ZYYmxKeXpIRi9VQXJHamhYZmErWFVBSnRmb3Z2c1Z5?=
 =?utf-8?B?ZFhyVDVaUFdVL3hGRE9uOWJyNlFFWmh0SDhzL1YwUTJKSmZ2VGxwd3gyc2ZL?=
 =?utf-8?B?SmRVVGN0UjB1cTBFZlc3VFpWOHRtSkd1WTl1TE9NajVqZzJSbkhucnROWXhB?=
 =?utf-8?B?d1FnSEdDUnE0KzF2VlJKVnZKTXFEeG5keTV2QTk1dFhXWkZQQmgzb1Frbndt?=
 =?utf-8?B?ZS9KSCthUk5RdXVuV0txSHFVd05jV1dYaVFmNVYyMm9Db0tVL3ZnYm5BR3Mz?=
 =?utf-8?B?K1FZWDRUM28vMlVHdFdaR1ZiMS84K2tBUzJHYVdoTUdpRFYyWnRBcmxjT0Jq?=
 =?utf-8?B?cVdFNzNRNzdWb2NDSXpUaGxuUDFxVTArUUtRY3oxZFJPclRDY3pWMHF3VGMy?=
 =?utf-8?B?eU02b0twRDFTWnpLMmdsUWpRLzZleVlKcGtIL3E2bUFvekE2aDNaaUhBNnQx?=
 =?utf-8?B?SWNNR0c5aUZCelNYeEY4dHNTdnp5K2ZZbG9jZTB4azRsR3FTRkVDZG9TOWVu?=
 =?utf-8?B?QUw5aVI2U2lOZzRnRSt6T2FIbERkT1o1cE9zMFZuTlc0NGs3dDd6Y2tDQnZC?=
 =?utf-8?B?ZE9oV2xjL25mVTR6UzlYbjBidysraWZhL05ZRHlzWjN5MjFTOXZISzJXS2tu?=
 =?utf-8?B?eHYzUHVRVGhvN1FhZGpEVzQ0S05VT0UwbzhYRzRLNENpRDhZd0xQN1J1NmtR?=
 =?utf-8?B?cHZvTGI0dHZnMktQS3l4dk9HcGFwQ3dVS2p5K1V3YWtsdnNHdVZpMkpHVmgr?=
 =?utf-8?B?WDR1UHRqY28zMU0vT2hheTByZmx2allRbU00UlBSVktKM21uU0dINVN6MnIz?=
 =?utf-8?B?M1BTbEhhYVpoN3pxUDJzalRkMmY0MHlud2N2cGRJSzd0L3JzMnVnZi9vaTdj?=
 =?utf-8?B?SWFqVy8raDdhV3FFNENXT3RnT2hEV3diemNHSDVndHVwTjNxVEFid0NkS0FU?=
 =?utf-8?B?WGs1RXcwa1BsckJPcXUzc2FtTWNEVlM0eTFMVDZuSDh4dEk2eDloZFRuZUNU?=
 =?utf-8?B?LzBOTUZpRS9ZNlAzTW5mWjRUT2MxM0dZbWRiY1FoVjlJV0Z6MEdIL1orZ2Fl?=
 =?utf-8?B?L2s3Q0tscnMvNmNVZGFubjh2Q2c4dTU2alg0MEZNM3FSd1UzRWZtOGt2WUNY?=
 =?utf-8?B?VVJ3bWJ5b3BnL2NzdEFtUXFoQXhXZ0VIblRxUTNIdFFhM3dnZ21vcitJQ3BH?=
 =?utf-8?B?Uy8yU0xqSmVNWE5nWHFTUVNkaXVaZFYvYU5qQm1hQ2NMZVJhYkMrWWc1dWVq?=
 =?utf-8?B?bDgyTkNMY25nZzdBcFR5L1BRR0ZGMkN6TWVRbVQzVGhwNXlITTZtYUZCVnM5?=
 =?utf-8?B?dmcvT251Z1NHK0VTQWtIMUZkUWgyOTZUbDNxQWdtSjBOR09JbGR3N1BUZ3B0?=
 =?utf-8?B?REgvRTBIaUpBV0U5WEYwL3R6R0dxa3JRTTBwT3N0d3JoK3FpV0RLd1g1TWJ1?=
 =?utf-8?B?b1NiYnZYQ2dib2lUZkE0TnIveUZKK1RlQU0vN2d0ZVdLZHkvR29scVJ1Y1pH?=
 =?utf-8?B?SHZ1VDVzdEZTamlSejhXVG5sbDVVam9qY241cHQ4Wk8xVmhVOEl6eEx1OEc3?=
 =?utf-8?B?eFg0SUhvemkrelBpOVdlZmhIckJLRGJKbU1rM2lXSTNaMDQvWWU1Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e829a4-e2c1-430c-86b1-08de5f1732ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:17:17.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8Ctxp1ZwljI1jMyHb7vbDzI37MFtuNv81mtJwjakKDpPEAARR4jW5Eho9uLlYpdjtCW3aAuzLTy1BvEYgJ7tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827
X-Spam-Status: No, score=1.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.baluta@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16392-lists,linuxppc-dev=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: A9E36AF1C1
X-Rspamd-Action: no action

--------------aexFGhz9upHKtlzg9pgEzqdf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/28/26 09:18, Shengjiu Wang wrote:
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

This patch does more than one logical change. 

I would split in two patches:

- 1) introduce functionality to start ASRC before DMA.

- 2) add imx952 support including clk_map and introduce fsl_asrc_imx952_data

Thanks,

Daniel.


--------------aexFGhz9upHKtlzg9pgEzqdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/28/26 09:18, Shengjiu Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260128071853.2602784-3-shengjiu.wang@nxp.com">
      <pre wrap="" class="moz-quote-pre">Add a compatible string and clock mapping table to support ASRC on the
i.MX952 platform.

There is a limitation on i.MX952 that dma request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped
from the input fifo on the second time if dma is triggered before the
client device and EDMA may copy wrong data from output fifo as the output
fifo is not ready in the beginning.

So need to trigger asrc before dma on i.MX952, and add delay to wait
output data is generated then start the EDMA for output, otherwise the
m2m function has noise issues.

Signed-off-by: Shengjiu Wang <a class="moz-txt-link-rfc2396E" href="mailto:shengjiu.wang@nxp.com">&lt;shengjiu.wang@nxp.com&gt;</a></pre>
    </blockquote>
    <p>This patch does more than one logical change.&nbsp;<br>
      <br>
      I would split in two patches:</p>
    <p>- 1) introduce functionality to start ASRC before DMA.</p>
    <p>- 2) add imx952 support including clk_map and introduce&nbsp;<span style="white-space: pre-wrap">fsl_asrc_imx952_data</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p>Daniel.</p>
    <br>
  </body>
</html>

--------------aexFGhz9upHKtlzg9pgEzqdf--

