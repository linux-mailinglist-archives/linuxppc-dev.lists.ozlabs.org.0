Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 62C168CF32A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:37:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dnEBz/EE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnD695v7Tz8C0f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dnEBz/EE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnD4p1Fchz8BbN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:29:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnIw4yboSdeEapFc4gy3hqyFE7zdXtLezU/DyEV1dEb/Y65juxgp1fgQzjeqYODoJi8zV0i3Vymcryeguh9gve3oyprg3M9p2NORmoFqg5MbqeiYzx7gyisd/pkXH5SdfQO+GFFulm+/cbtLfVzanTW8NI+blgywQ/DXfJtvurvP1TmV4GlmaMAnSQFKocxkUemP50geLbOMQ4nZiPUBV25yNIBi+AK/R8wURIi1OS2qYaIaXwaSBBaUDJiRkvFoMjtc+OLI7JT8CTQbFoWY6KvzL8TXM8ZgQ4sefBhu3XL/opYgbnMDcEAFHAP5p/y2BeBD3oJR9dCdvekh0+j5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQZKB82GgnBTriKwl0I7v6+jfd2ICFztT/5Ug5NXkZc=;
 b=e7RRD2k5Md6o4yD0Y56ljwv1ogSCgL06F1u2Ei+XE86OF3wsMjDOT5MPijzoP/52DcK9z7UP4Yn5Tp175SPcLm/RXmAMD+va4TReaKhhJ8D4vul/1U3WccgZR/S6UHoZMbV8WxAxmscaBvvBxlvp23p3WSR0WCP7IyLK9bPo8vCwuR1UQiUUncLZOKINWbiSEXpVBIrsWfAw4bWygV/KwvLuJok7gUvTaSg7PX+eiP/kQFX2ZzCD2TehhcAh4zJD9/80D/Ix/eN4U2+bPVE+6dYRRByc/Xd1mgOguLfiXN+Lmt1deFeZHaXIaFqlNSN/2SJLNsuTh8ck45YUeI4FiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQZKB82GgnBTriKwl0I7v6+jfd2ICFztT/5Ug5NXkZc=;
 b=dnEBz/EEIHHA6U4mBIzT6Engdr6pc8jtifvELgVelATgK7z6VpOx7fOAPv4WqAE8R6DivZmxWfEflywR1OTaGymyongGZA7pwpfK90CpxGGEPnWGX857IHxddhtG+wU2A52H5pDvtXbT/sdqNNqCkw/ZHoVnqyOiG/qvN4UILWsRWeN6Aj0SLhX0zJVfxc/HzR5eEE0rDtua+bRJHdkmMtlOY+ugrkjdfcP5qwhctWtozZAMWYo5R29K4U6YsWScT1nVTh+c6l1klxlEe6JEtz5c0TAArWMGToAF8+v9iOOiUoo5jRcYyW1ptpMByZlHauAUCAAhVBJnVUP6nrUtbw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Sun, 26 May
 2024 09:29:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 09:29:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Topic: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Index: AQHafsSUDf1gEqeQdEWjl7G6IxKzM7FIoteAgGD974A=
Date: Sun, 26 May 2024 09:29:07 +0000
Message-ID: <9788c6dd-1d93-4a7f-9426-cc8bf7ba4778@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325161919.GD6245@nvidia.com>
In-Reply-To: <20240325161919.GD6245@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3164:EE_
x-ms-office365-filtering-correlation-id: e5d5df23-d989-48fe-ce6f-08dc7d664b23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?d0pheWNjcEJCRFRPYXc0TURMUEhtL3R5dGsxWkVNeGJ0M3hRN3dyVFFBb0tj?=
 =?utf-8?B?MjgrL1gwNUhKWkpMZkt0dmkzNjlaMXA2VFhsWmtrdExWRGh4SkVCbzdMQ0VX?=
 =?utf-8?B?MXFORzdZemJmSC9CNWFvSVhmV3VRMjlGTUZWdVBFeVlwNS9sV0hrc1ZMb3NW?=
 =?utf-8?B?UTFzaTd1RW40cDducGlucW80RUtTQTZPTmNabWkxellMTjlKdGRnaGRtand0?=
 =?utf-8?B?WVNocVd2MGhCclNhL2dnRTRBQ25DSm5LcjNuVm0yekxQbk84VHc4KzdBZTBP?=
 =?utf-8?B?L2Q2cUdKS3VzeVhJYVZFK2h1RzcxdmIrNlhHQmh0Mlc2NnJxM2l1Q2ZzbGJv?=
 =?utf-8?B?Q3NqUUVRK0RGdjdrNENVZm56bmhORHpLcTY0eTl2am9IbTFFK3hJczZRUU1P?=
 =?utf-8?B?TGp1QlEyU1BjTDlTZU1pRG8ySThQZDFoZTFaQ2txL2NrNWc4Uk5GTUI1ZEJn?=
 =?utf-8?B?YjlPTVRhTytIWDBVUnh0cGZkTTZYZzU1TDgvYTFiSTh4SFJqcmRZaVcrWXoy?=
 =?utf-8?B?YTllSlJOK2pDb0E5VmY1M0RNMmtPdHJIeXFUa2tLSzltcy9TMjNvb1l1K0dF?=
 =?utf-8?B?ZWt2Z2I4SjUzOXJRQ3BjWk9aakVBMkloYXk1N0NmVzV3VWt4MnpmWFBlVmZI?=
 =?utf-8?B?eDdibDN6RlFGUnp0L2FLUWdGb2hsNHNhRmNYUXpmVXVnUVVpTy9TcDByRzht?=
 =?utf-8?B?MGNIaDhqODdmZ0tsSHY0ZWJzYUlzWTcrSW50YjQ0SkJxejMxbUlYZmNubkVs?=
 =?utf-8?B?dzdGTko0d25MWGtNdmRPSktvQ1gzbXdUQ0FCUWlFL3JHZzdKVTAreGZkZ2s0?=
 =?utf-8?B?ejZNaEhsZHVlc09GYmcraDQrZU1jT2pOM3lRQ0xyUUJja0tabWw1b3VjaDV0?=
 =?utf-8?B?bEtXSGw4Q2pFRkN4dVU5ZCtXT1V5dmFPWFpmN0owdFllOVJ1ZmZkRGhiWk1U?=
 =?utf-8?B?elUweVVLaGxMZWFTSFYvTVNpYkdqdllhbERiWVJNS3RuRHdKUS9mNGcxeXFw?=
 =?utf-8?B?bU5EY0poMDRQWmVDMzFtQ1ZIYjdIUzhzd2R0djRwRGxtR00xNmZVRlpLejdX?=
 =?utf-8?B?cDVqd3JaUDhpNVNaeHc0WnA0Nk9hZnBjVkFJWDBNUUY5WVliaC82NEh5Snpr?=
 =?utf-8?B?eXRzODFCS3J0N1NIQjBFT0JUZ1dJamVyMXErRlgyTWFDTFYyNGtVN1YyU1Vj?=
 =?utf-8?B?ZFcrb3BjOXNOc0trd3BVOWZIMUw1YTFaZzFjRUVmR21OQndCRkJHRENldzZ2?=
 =?utf-8?B?T3BUVkRJTXhGZi9UUHRaTjFMV2ozV0ROa0FtUHJjVEZYaGMwRDlVTlJnRmdS?=
 =?utf-8?B?dDkramx5NHM5ZUJ0Z3hMejR2dnB0RnpuUDA0bjNxd2s4empCYXhHa0ZnQVVm?=
 =?utf-8?B?VkE0bVhZNlRmMkZaT2lBajNnbWtpcGViU0FtVXBrNHIyZE9qYVc3NWpibGhW?=
 =?utf-8?B?dHJwbFQybTV0RllESGxlTzRJcVdHTzA3Mk5Ia21xQmpOYTNWMkNsZ1RlcGFz?=
 =?utf-8?B?MjNsYktIdExvcHVwV3JxZ0o3UUtTdU9WS0JHV1ZMOXBZMXpyKzAwcDVsRnlk?=
 =?utf-8?B?MmRRdGFJdXd5QmQzckQ5elppSHNkS0UvRks3M2FIWWdHUkQ4UHMrbVJTYjV3?=
 =?utf-8?B?N3BvaXY2WHVBN2EvUTUwVEhMLzVLZDRFYUhORFRLOVlpcUtYL0dYc1NrMG02?=
 =?utf-8?B?UEZTMUhjTGxEUy9DTDJBR04wT0hxT2xHdlQzTHdtb1ppQXZnUGxzbzlLTFll?=
 =?utf-8?Q?MMIvVV8r0lq6oD51yZOjQKxAQWsPUgaRlZZIfoa?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SW5hRkxnRTMzY3MyZUgwckIrTU9pQ3hjUldMYStablkyVC9Ib0UvbTFlVDJD?=
 =?utf-8?B?TEMrcUdjSm15aW9qYlZCc2U1Y0lQeHM1MVpFN2d4MXdacWI1WkF5TVI3THJs?=
 =?utf-8?B?TGJyQnNWcklpTzFiTC9jSGJTU2pnbmZCMlVUSFFDSnoyVzN1bFZWd3VMeUVX?=
 =?utf-8?B?OGlvSm8rWUVoeXNvMGZlMWFueXdlWmtSVlVlT3liMkg3SGtybWhPS2ZpSE50?=
 =?utf-8?B?U0E1bXV0VFVyUmFVcGJ3cW82dHNHRUxJdnZUcUlxTGtkTHlsYW16OUVHUnYx?=
 =?utf-8?B?Y0xoWlpYSGJpS2dBNXNwUmpuUGlzVmdKNlB0LzIyQkdvRUtoSXJNRVVlUXJw?=
 =?utf-8?B?RnRqWGVoM214WjZoRituSXpYbTdLN3pIS0RCdG16LzFnc0YwRUVVU2E3MFVU?=
 =?utf-8?B?dEtJYmZkRzBDSmREUWFMWndIN2R0OU9DOVJyMjJpZGQ5Qzg5SzZFWlJuU2Jp?=
 =?utf-8?B?ZnY0aWJkanZjZ3RXTmxXK1IrS0UwTFhKTlptNWxGMS9YRjdQNkloMlUrYmlm?=
 =?utf-8?B?cXpTS2EzSGUyZm8wODg0T21CdE13WXpyRkRnN0t4ak1oRm9VQ3BURUJDTk91?=
 =?utf-8?B?TlJVMkp6M0lialV5ZU9CdGJrQzViaWo4aHZ3TTAzek1uUmxzMFgzeFdpLzhs?=
 =?utf-8?B?OFZMcDVoOFR2bTNVK0xzc010N3RGVlN2RkRKU215MzJjcVMwY1dBdTRaeWti?=
 =?utf-8?B?NXFycjJUSVlHd2szdHBpUnlEWnFDV3l3ZmtwU2FRMHd3Nmh0VWJzSmJ5R0lS?=
 =?utf-8?B?NUVrNlpjWkY2MjRYSThMSHhYQVBROTVhS0hBbit2dTBsTElyVkQ2MkhMei91?=
 =?utf-8?B?dTVuV05EbUY2NXhuN0JTdkV5d2dBM09JR2JaeTVBc3BnWGZmVE9jVGlOeGpN?=
 =?utf-8?B?VTVTQnNFT2tFaWFzaTNrWSsyNDVPTG1qS3RnTi9QWEdqaEVJVnJkTmtLR2NZ?=
 =?utf-8?B?RkRNQkQxak5lUlJqVUdWZnE5RklzZXVMV0FPa1hKZTJROUR6U0RUWHhreEZL?=
 =?utf-8?B?YmovcU1PcXFBL3ZaTHJSTURnYmh4bUtxN1h1Nmw2V0hBZzhxUkVaV2hQczAw?=
 =?utf-8?B?RGg0aUljNUtYQ0kzbEhHV1hvRjEwZUVTQmhSKy9RWUlRTTdQNkdhQi9XY04w?=
 =?utf-8?B?Z1haKzFPR1JTUjcwQVdPWFE4a1BlNlNxZWRHckZyYkkwK1RuRXZmZlYzZmRN?=
 =?utf-8?B?RU5sYXB5R0dPSVZHNFl1SHEwZmw5OFdSbHlNTkoyTG9WS0MxU25KUjNCZ0la?=
 =?utf-8?B?b2R0TkR3aWlNd0hIYms2VUxScWY5L0l6cWxUZ1BZWktlVzg4TlpOaHJWOUdh?=
 =?utf-8?B?RndkemVnVG82VkllOUtLZzNJMHEreHhEcFdKbG9XdGRoRHpvWmtIZVV6MGQr?=
 =?utf-8?B?bnZEMGpTMGFYSERsUDhPN3JjVUR0YjRpVFkwTVNFZE82QjBLQnpFaVhzTUcv?=
 =?utf-8?B?bXA1eVpxNXBETG9qdXV5UDRBekp2TlAwS2xicUx4NnRqTUtuajJNT25YenNT?=
 =?utf-8?B?M2VLdVp2c3U5cGxZc1RCSjMvVHhuU29pZVh1U1g5RnlpV2dvS0tMRnQxYVRG?=
 =?utf-8?B?ZC9aNHRPcHhFSTVCUzNmWHNiL1l1WWJOcDBxNjBFcTd3YTEwVUVlSEg2akhw?=
 =?utf-8?B?QWIyV0tneW1IQUE4VjNCc0FMRHgzUDFHVmUxdmZqb2o5OXVudnpWZ1Z6YVZE?=
 =?utf-8?B?K2o4Vld3V2JheTRMZkEyTTRqNnovTFVnQTZnbUdaL3VqM1Q5OTVSSG9ZZ0l4?=
 =?utf-8?B?cFNPaC9lUmxjcytoMVdkaFBjREtFM2NNaGNObTErZ3VpNjBRaUxOV2IzTnl6?=
 =?utf-8?B?dkVYRjhCaDdrcldaVDBNbXI3bFRyY3Vpc2VZemFYRG53SCtrQXhNY1dHQ3NH?=
 =?utf-8?B?TWUydkRNSkdRVjBKRGJuRlhUOXJOLzdWRWN6Nmh5NnB1NVdqS3I4NjQrQVBk?=
 =?utf-8?B?LzUyeE1HbTZzQnNEWjlUV1RYb1VST0F2ZHVGbzk1VS9Hd1JpYmF5QjB1d2tm?=
 =?utf-8?B?aFlEK2R2cG9Ca2Z2b2NMQzRsQXd1VThXYVJJa0N5QmY5TVhYOWo5STg4RXlG?=
 =?utf-8?B?ZlFteVNHMmIwbTh3Q1I5ZGZkS29GaFMxNkxuLzFYdllsdDJDVEl5cHNIZ1pp?=
 =?utf-8?Q?EmyEEQstwvLXYtl8JZWoAqqwH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C520341981BA449A284303256D95422@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d5df23-d989-48fe-ce6f-08dc7d664b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2024 09:29:08.0042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0Pg2xeSkRVka52xHNf9hMsnePqn+ln1NWqyX45mNgdziPZP1wr45z4wNz5ogtaSRMLvG0BgUBWQwH59RYZvKvMFp6P3+1mcERzKBWSps8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3164
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAzLzIwMjQgw6AgMTc6MTksIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NTo1NFBNICswMTAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4gVW5saWtlIG1hbnkgYXJjaGl0ZWN0dXJlcywgcG93ZXJwYyA4eHggaGFy
ZHdhcmUgdGFibGV3YWxrIHJlcXVpcmVzDQo+PiBhIHR3byBsZXZlbCBwcm9jZXNzIGZvciBhbGwg
cGFnZSBzaXplcywgYWxsdGhvdWdoIHNlY29uZCBsZXZlbCBvbmx5DQo+PiBoYXMgb25lIGVudHJ5
IHdoZW4gcGFnZXNpemUgaXMgOE0uDQo+Pg0KPj4gVG8gZml0IHdpdGggTGludXggcGFnZSB0YWJs
ZSB0b3BvbG9neSBhbmQgd2l0aG91dCByZXF1aXJpbmcgc3BlY2lhbA0KPj4gcGFnZSBkaXJlY3Rv
cnkgbGF5b3V0IGxpa2UgaHVnZXBkLCB0aGUgcGFnZSBlbnRyeSB3aWxsIGJlIHJlcGxpY2F0ZWQN
Cj4+IDEwMjQgdGltZXMgaW4gdGhlIHN0YW5kYXJkIHBhZ2UgdGFibGUuIEhvd2V2ZXIgZm9yIGxh
cmdlIHBhZ2VzIGl0IGlzDQo+PiBuZWNlc3NhcnkgdG8gc2V0IGJpdHMgaW4gdGhlIGxldmVsLTEg
KFBNRCkgZW50cnkuIEF0IHRoZSB0aW1lIGJlaW5nLA0KPj4gZm9yIDUxMmsgcGFnZXMgdGhlIGZs
YWcgaXMga2VwdCBpbiB0aGUgUFRFIGFuZCBpbnNlcnRlZCBpbiB0aGUgUE1EDQo+PiBlbnRyeSBh
dCBUTEIgbWlzcyBleGNlcHRpb24sIHRoYXQgaXMgbmVjZXNzYXJ5IGJlY2F1c2Ugd2UgY2FuIGhh
dmUNCj4+IHBhZ2VzIG9mIGRpZmZlcmVudCBzaXplcyBpbiBhIHBhZ2UgdGFibGUuIEhvd2V2ZXIg
dGhlIDEyIFBURSBiaXRzIGFyZQ0KPj4gZnVsbHkgdXNlZCBhbmQgdGhlcmUgaXMgbm8gcm9vbSBm
b3IgYW4gYWRkaXRpb25hbCBiaXQgZm9yIHBhZ2Ugc2l6ZS4NCj4+DQo+PiBGb3IgOE0gcGFnZXMs
IHRoZXJlIHdpbGwgYmUgb25seSBvbmUgcGFnZSBwZXIgUE1EIGVudHJ5LCBpdCBpcw0KPj4gdGhl
cmVmb3JlIHBvc3NpYmxlIHRvIGZsYWcgdGhlIHBhZ2VzaXplIGluIHRoZSBQTUQgZW50cnksIHdp
dGggdGhlDQo+PiBhZHZhbnRhZ2UgdGhhdCB0aGUgaW5mb3JtYXRpb24gd2lsbCBhbHJlYWR5IGJl
IGF0IHRoZSByaWdodCBwbGFjZSBmb3INCj4+IHRoZSBoYXJkd2FyZS4NCj4+DQo+PiBUbyBkbyBz
bywgYWRkIGEgbmV3IGhlbHBlciBjYWxsZWQgcG1kX3BvcHVsYXRlX3NpemUoKSB3aGljaCB0YWtl
cyB0aGUNCj4+IHBhZ2Ugc2l6ZSBhcyBhbiBhZGRpdGlvbmFsIGFyZ3VtZW50LCBhbmQgbW9kaWZ5
IF9fcHRlX2FsbG9jKCkgdG8gYWxzbw0KPj4gdGFrZSB0aGF0IGFyZ3VtZW50LiBwdGVfYWxsb2Mo
KSBpcyBsZWZ0IHVubW9kaWZpZWQgaW4gb3JkZXIgdG8NCj4+IHJlZHVjZSBjaHVybiBvbiBjYWxs
ZXJzLCBhbmQgYSBwdGVfYWxsb2Nfc2l6ZSgpIGlzIGFkZGVkIGZvciB1c2UgYnkNCj4+IHB0ZV9h
bGxvY19odWdlKCkuDQo+Pg0KPj4gV2hlbiBhbiBhcmNoaXRlY3R1cmUgZG9lc24ndCBwcm92aWRl
IHBtZF9wb3B1bGF0ZV9zaXplKCksDQo+PiBwbWRfcG9wdWxhdGUoKSBpcyB1c2VkIGFzIGEgZmFs
bGJhY2suDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGRvY3VtZW50
IHdoYXQgdGhlIHNlbWFudGljIGlzDQo+IHN1cHBvc2VkIHRvIGJlIGZvciBzej8NCj4gDQo+IEp1
c3QgYSBnZW5lcmFsIHJlbWFyaywgcHJvYmFibHkgbm90aGluZyBmb3IgdGhpcywgYnV0IHdpdGgg
dGhlc2UgbmV3DQo+IGFyZ3VtZW50cyB0aGUgaGlzdG9yaWNhbCBuYW1pbmcgc2VlbXMgcHJldHR5
IHRvcnR1cmVkIGZvcg0KPiBwdGVfYWxsb2Nfc2l6ZSgpLi4gU29tZXRoaW5nIGxpa2UgcG1kX3Bv
cHVsYXRlX2xlYWYoc2l6ZSkgYXMgYSBuYW1pbmcNCj4gc2NoZW1lIHdvdWxkIG1ha2UgdGhpcyBt
b3JlIGludHVpdGl2ZS4gSWUgcG1kX3BvcHVsYXRlX2xlYWYoKSBnaXZlcw0KPiB5b3UgYSBQTUQg
ZW50cnkgd2hlcmUgdGhlIGVudHJ5IHBvaW50cyB0byBhIGxlYWYgcGFnZSB0YWJsZSBhYmxlIHRv
DQo+IHN0b3JlIGZvbGlvcyBvZiBhdCBsZWFzdCBzaXplLg0KDQpJIHJlbW92ZWQgcGF0Y2hlcyAx
IGFuZCAyIGFuZCBub3cgYWRkIGJpdCBfUE1EX1BBR0VfOE0gaW4gUE1EIGVudHJ5IA0KYWZ0ZXJ3
YXJkcyBpbiBzZXRfaHVnZV9wdGVfYXQoKQ0KDQo+IA0KPiBBbnlob3csIEkgdGhvdWdodCB0aGUg
ZWRpdHMgdG8gdGhlIG1tIGhlbHBlcnMgd2VyZSBmaW5lLCBjZXJ0YWlubHkNCj4gbXVjaCBuaWNl
ciB0aGFuIGh1Z2VwZC4gRG8geW91IHNlZSBhIHBhdGggdG8gcmVtb3ZlIGh1Z2VwZCBlbnRpcmVs
eQ0KPiBmcm9tIGhlcmU/DQo+IA0KPiBUaGFua3MsDQo+IEphc29uDQo=
