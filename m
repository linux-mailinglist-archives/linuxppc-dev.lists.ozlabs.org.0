Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD2D7738F9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:15:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=imsNtzB1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmFg0v10z3dH6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:15:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=imsNtzB1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm8l2JR7z3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:10:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL9GO9k6Yakh4DxtdSPMVXrAFB+GAJdENDQ5y6NXYIO1thzWGMchpg/liMEJf/E5bityuEKV7DwGPD3Y7QSPYmR/uN5Wr5VjIBz4NGsbYuV6Of7IeGyR0yL24/tUFOxhWPTRXa97OAGxXrlT8+IBuFMXaQxnuZ//30p4XhRf+tRPcJS9RkOEsl2Kr4oVbrc8DZOmks6XSV1vnpWqRjj/xpDicT+NXL/kPzlgbJnvzXWDgXqcAq1tz/4CykasGYSaKEa3/v+q4QKqTPt+nolf5VZS2BUpTjQKZqFXVppUQSlAuYWnUCXcvcVuO9b9rBtOM5tunQrzp9NpKNEmIWhG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsItRpekJ0SqAV0nEyMYrxtgPkpdMcrLUS5UFq4Zgxk=;
 b=BWIj2mHHs1p7YbX9gdl9Km7dsr/46gtfEF35OKIUnFrAJ7q3BRtbn5eChsmXiahd/gvCzYrNU0zF5ejPLjelU3pdD0ylb5K3QazMSrcet0Wc82wOu2izQIsp07eJMoneOVy9IzBoZYgi6+hp3YrwzdShUGwyPCgMJVwxOg5DocAKkoiSRva1+2DSvKmfz54G+52Bywzv9SfBNaFxMFgJYvSFagP/ZYqqRVGcG79KMPy+G5jqYnX8i4kvw9lN2VvPbDoeaaTBGWILjLBcHOC8JDFq0uEVs0BJr8M9rwRQglXlR6AJ3i51/A/bxmUAcHzIrDTkn6aXf54boRKcsn1H9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsItRpekJ0SqAV0nEyMYrxtgPkpdMcrLUS5UFq4Zgxk=;
 b=imsNtzB1f4r23VwrM3WG2ZLpcYdGWQ9TsQYDkiEdumPoxGf/ajosWMBcocHXMtHChJzOD0/p4l5rBI/88jFB4jS37p8eaXdEeF45v7wMMM1599tNnH559c+XoEy7lmO6lqRmZlKBGmg0iyLWQXk2kZNhaKXYJnc71eNf9++PFgzaNwXPNd92cb7whi2WcbvJKmCgHv6/eHVW5E19kVycLBJ1HCMdNsh89A51OLOo/WgSY2otgUX8OwAXGDs7p4+4VQhoJ47GmlifSXdwkTXZi5YQNU0Kigdgi9+j2vtoAPD3QDhDouYDnypQoMrYyTL+F9BitJ2VcZC7otfmUAf1fQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:10:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:10:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH v2 18/28] soc: fsl: cpm1: qmc: Introduce functions to
 change timeslots at runtime
Thread-Topic: [PATCH v2 18/28] soc: fsl: cpm1: qmc: Introduce functions to
 change timeslots at runtime
Thread-Index: AQHZv9JfcdNe0P3C7U6iRLV0Mvuxaa/gH/GA
Date: Tue, 8 Aug 2023 08:10:29 +0000
Message-ID: <aba9b823-26d1-ec7b-7067-0de6cb971d91@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-19-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-19-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2014:EE_
x-ms-office365-filtering-correlation-id: 9a1a8041-2baa-4c07-47fb-08db97e6ee46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zoiTASnr2e3/FKSZjeDR3qkYyOfbW8YtmwJe5RsmVqUMsoqA+vVOnMwg0xuFlELR/w34j6upcDtgD9wygVmJ6qTs6P54+t4KVyE1pgL+f5QealB4OPYI8+A6EwDqjYS+BkJEDAPF83mZIlpGeWB+i1wp1ANwGOVYlRHPtMPu7gpA7DGCYp5V3IBnfXQSBEz9XpxcEDBVf7JkQP3ktM0AneZ8fl2U7gWpAZCCLxgoMQXyHoPXoGiIN8MNVkm3BerVYBLH8JER+ucrsv9XDmLjlev3EFz70ylH3Z4PV0fEK08TTtphEVgByPPh6HKL/Cf5vzP0Nipfvv4FXy8YVTRJoB8mrybFF3osiwl7tS2Ljkwpx6z9wUYhoH1zoMyeyBwePImu/EwwbSkHx9VOglsZzkSBamOzoc+6dbLiCUhz35QwBIKKVI49lRKIkveHiohLtzikAgU89m7c/8fhOIhwDoir3Jv3sfJduQtcZRn4QEUQjhBTGb1fzzp74lXR88jCLlE06NslF15PsviW4+KhNkMz9Ag2P1SrD4v0fTpZNoSL9Q+uEtxY4+CgMYQfjmyKHjDyjj2cG8yTOgCW5X51Q9gJgzOS8UvqdPGJqmeiJwdSPxHEGDd/9LHuDYffiIntHDuIf355yGwLU3m9jawSSRNMtw4LaIgX9mDpSIFm3A4CcfTAjf1WmUoCutwj7eYyPIPQs6klxgEZKZ8BO7xp87qwttgmfKXAjTlQiK8sfu5zrEP4aXDrdCUMdVbOH5f6LKNWWXX/jROE+XMEQRQcLw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199021)(1800799003)(186006)(90021799007)(90011799007)(31686004)(316002)(83380400001)(66574015)(2616005)(2906002)(122000001)(921005)(36756003)(8936002)(8676002)(26005)(38100700002)(6486002)(5660300002)(7416002)(66946007)(41300700001)(66556008)(76116006)(66476007)(44832011)(66446008)(4326008)(6506007)(7406005)(64756008)(478600001)(91956017)(54906003)(110136005)(31696002)(86362001)(71200400001)(6512007)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cmpoNTJHUTN6M2hrNVI1MnRsY3I3QWlBZlJQRlZBTEgxZ0N4V0dtVHpaNE44?=
 =?utf-8?B?Vjh0bEIrdkpNaWkwNEFVWFNWd3pSdjdXdlhIZE1SWnFEcmNxMys1WnlQVDRH?=
 =?utf-8?B?eHBzTS82aUNFa3JDV25GM0FsaUl6Z0l0Ni9YWlJaOG14OUpkRVN0aEdUZDFN?=
 =?utf-8?B?UkRrdzk2UEVpZi9maElMR1NZUHArbW54dzBVSDJmV3p6N0RVTzhROVIzbXpL?=
 =?utf-8?B?UVpEd1NoZWtDQk9xVElBUWFBbDJZNWg1SlFITVdHelc1eUFEa1FVREZFZU5i?=
 =?utf-8?B?Umw0cDV2UEZaOFJWZFdaTEF5SnNOY0Zab2kxRlVJZjd6aVFCcGdRUVpINDR2?=
 =?utf-8?B?Y3lkZ3hJWXg2bkpTR2lMY2Jyem5rdUc1Ym5hTG1TRzBsWkFWYTRKOVlsYXJy?=
 =?utf-8?B?ZzVPSlhjbTFXY294MzBkUFlJbm9ocXM4TkxvUDhWV241M0ZMbGQrNWJNKzN2?=
 =?utf-8?B?NFJON3FQQXRJd2ErY1ZSdXYzMG9BOG1yekYyQjB3a29nakRQdnNmdnlaZVFn?=
 =?utf-8?B?TWZlZ2NIQU52dW9pdXN6bEF0aEtLbzBSNnZaRkgrdHpibEM4Y3ZlVk5lREd2?=
 =?utf-8?B?NW9WYVlQaHB4ZW04alNnZHhPYVlNTG5KUnBOYmtSTUF3YmdqWVp0MW16WHZu?=
 =?utf-8?B?Mm16ZGJKWGZ5bGVVMEhJRk5VcisyNEd6V1hnUlJyQVpOWUhoZ2tYaVRlRCtF?=
 =?utf-8?B?cjcybzFSRXQ1VGZxSVpOU09WQWVWNHo3cnM1WGUvbFIyK0JScXRBcXZ5MHlY?=
 =?utf-8?B?ZEpHK2hSaVBYZ0h5R1pUT241WFEvb25iYlJhYXZTZVZlRkhKOElYQ3V0azdl?=
 =?utf-8?B?T0gyb0h3azZ5YUI0YTYwOU5Ra1hxS1k5ZUJrdTVUVlBBVmtGeTZTVDRGcGpl?=
 =?utf-8?B?RDBKdW9XM29keDNYVnBTbm9ZdjJlVUVxaGhVTHhQYzBLdEV0TXdCTFdRUDZJ?=
 =?utf-8?B?Y0VuSjNOM3d3dHpGSXRURDBtWVJhZGdscitkYWtuUjd3dGRZZnNHVVpKUWxn?=
 =?utf-8?B?Q0ovVnFraWkrYWp4cTRMOGxWSEJXTVV0ZUN1S254UHp1VjAvVDhtYUtiN0t6?=
 =?utf-8?B?MFdLVFgrVlRBR2ZmSUhnRlg4Y2VmckoyZCtmM3U5UWN4a0hKU002UGtyQlRL?=
 =?utf-8?B?aVRlVXVYOWtGSHFTbHI0U0lVeTQ1VURCWHhoeUZ1cHVvdkplck5abGlmblpm?=
 =?utf-8?B?aGQzWGhrNTdXQXNkaFFYcEM0ZjViSXlNYmp4RGJSd2NJbi85RXFOTnZPS2ZT?=
 =?utf-8?B?YnZ5cUFpejVMajh6b0ZTRzVMZUV3UHIyY0VPbTRtZzRTTmxwajI0OFhQOWdh?=
 =?utf-8?B?YTQycytDQml1YnN6VzUrSnpqTzI3Mk82WHBJZDBaM1ovMGUxY3JjZCtYVG9H?=
 =?utf-8?B?U3B1ZTRTNWR1QTBsN2s3TkVlWHhtb29lNXEvSmI2ZStobkpDZjJSaEdXR2Ir?=
 =?utf-8?B?WkluakxrMXdSd0NQeStKM1c1cUhoSjc4UFZhaDRwSFdMcmZEUGRhaHUwZ0Zw?=
 =?utf-8?B?aGREeE1temcwYmhVNmZieWVUZHJQMWNQY1lmeU5NbEFiZEdxYkI0S1daMTN6?=
 =?utf-8?B?MW1uOEhSWlFSYnByUnlXVmQrVmV1TmUrU05keW9WMnRhM2NNbHovYTVxZWlv?=
 =?utf-8?B?Zm9pZ3FRVzVIRUM1NE1mVDM4Yng2djBDYVRWbmVaVW5zbkdWQUNob3o4bTdn?=
 =?utf-8?B?dkNtV0l4c3lHcldYVW5jQ2xTNVh6TC8xSGVWQnVYT0pWUVZDYWhUTkRwYmlj?=
 =?utf-8?B?MFI2Y2ZnUFlwc2wwZ1kzeE9GcWwwUkdOYkhjb2RiLzR1YUhJYzIrT2hMZmdS?=
 =?utf-8?B?UjNhaEZRUEhxTEU0SVZVUlBDS0lBYUdDQjJxQUcweXVkSEduQmdRRDZlWkZw?=
 =?utf-8?B?T2hnKy9VTTM1UXJJOWc2dmFvRXo4bzh1OU5MRWFQNHV1aHJzL2pQblpDdHRN?=
 =?utf-8?B?bnZvakNVOCtPMnYzTkhRZGVucDQrLzROMVlIY0o0UXVJZ2ZKUEtxaUY3cHRp?=
 =?utf-8?B?OG54eXJFR2VSUjdXL09YNlZLamxGVlVrUnR5ZXBlWFRhMmNvQ3NqSXVuVktX?=
 =?utf-8?B?Sk9kVkhla3pCUUlxcDRQYXpZbytyVEQ2Qmhxb0JvR0ppelFTVFRMZmE5REVo?=
 =?utf-8?Q?a4yECnayi6BMSVu9xwCskxDZv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2176393B320DB40A9DF3D3772F5F16B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1a8041-2baa-4c07-47fb-08db97e6ee46
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:10:29.8465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17wLN09imUA2yx40Wzdv2beqEMWwv3Vd2Yr4+DJtUK9FZ2kAlXh/iosBo+uiGKFPAFaB8sRXVbuRyi/aTTLiCPTlrWyy5DfCe/vwNyvOh00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2014
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBJ
bnRyb2R1Y2UgcW1jX2NoYW5fe2dldCxzZXR9X3RzX2luZm8oKSBmdW5jdGlvbiB0byBhbGxvdyB0
aW1lc2xvdHMNCj4gbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuDQo+IA0KPiBUaGUgbW9kaWZpY2F0
aW9uIGlzIHByb3ZpZGVkIHVzaW5nIHFtY19jaGFuX3NldF90c19pbmZvKCkgYW5kIHdpbGwgYmUN
Cj4gYXBwbGllZCBvbiBuZXh0IHFtY19jaGFuX3N0YXJ0KCkuDQo+IHFtY19jaGFuX3NldF90c19p
bmZvKCkgbXVzdCBiZSBjYWxsZWQgd2l0aCB0aGUgY2hhbm5lbCByeCBhbmQvb3IgdHgNCj4gc3Rv
cHBlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJv
b3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBpbmNsdWRl
L3NvYy9mc2wvcWUvcW1jLmggfCAxMCArKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjEg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMu
YyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBpbmRleCBiMTg4M2I5ZDJiYWUuLmUzOTUz
YmMwN2IxZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+ICsrKyBi
L2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBAQCAtMjkwLDYgKzI5MCw1NyBAQCBpbnQgcW1j
X2NoYW5fZ2V0X2luZm8oc3RydWN0IHFtY19jaGFuICpjaGFuLCBzdHJ1Y3QgcW1jX2NoYW5faW5m
byAqaW5mbykNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChxbWNfY2hhbl9nZXRfaW5mbyk7DQo+
ICAgDQo+ICtpbnQgcW1jX2NoYW5fZ2V0X3RzX2luZm8oc3RydWN0IHFtY19jaGFuICpjaGFuLCBz
dHJ1Y3QgcW1jX2NoYW5fdHNfaW5mbyAqdHNfaW5mbykNCj4gK3sNCj4gKwl1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPiArDQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmNoYW4tPnRzX2xvY2ssIGZsYWdz
KTsNCj4gKw0KPiArCXRzX2luZm8tPnJ4X3RzX21hc2tfYXZhaWwgPSBjaGFuLT5yeF90c19tYXNr
X2F2YWlsOw0KPiArCXRzX2luZm8tPnR4X3RzX21hc2tfYXZhaWwgPSBjaGFuLT50eF90c19tYXNr
X2F2YWlsOw0KPiArCXRzX2luZm8tPnJ4X3RzX21hc2sgPSBjaGFuLT5yeF90c19tYXNrOw0KPiAr
CXRzX2luZm8tPnR4X3RzX21hc2sgPSBjaGFuLT50eF90c19tYXNrOw0KPiArDQo+ICsJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+dHNfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJcmV0dXJu
IDA7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKHFtY19jaGFuX2dldF90c19pbmZvKTsNCj4gKw0K
PiAraW50IHFtY19jaGFuX3NldF90c19pbmZvKHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgY29uc3Qg
c3RydWN0IHFtY19jaGFuX3RzX2luZm8gKnRzX2luZm8pDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9u
ZyBmbGFnczsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJLyogT25seSBhIHN1YnNldCBvZiBhdmFp
bGFibGUgdGltZXNsb3RzIGlzIGFsbG93ZWQgKi8NCj4gKwlpZiAoKHRzX2luZm8tPnJ4X3RzX21h
c2sgJiBjaGFuLT5yeF90c19tYXNrX2F2YWlsKSAhPSB0c19pbmZvLT5yeF90c19tYXNrKQ0KPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKwlpZiAoKHRzX2luZm8tPnR4X3RzX21hc2sgJiBjaGFuLT50
eF90c19tYXNrX2F2YWlsKSAhPSB0c19pbmZvLT50eF90c19tYXNrKQ0KPiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gKw0KPiArCS8qIEluIGNhc2Ugb2YgY29tbW9uIHJ4L3R4IHRhYmxlLCByeC90eCBt
YXNrcyBtdXN0IGJlIGlkZW50aWNhbCAqLw0KPiArCWlmIChjaGFuLT5xbWMtPmlzX3RzYV82NHJ4
dHgpIHsNCj4gKwkJaWYgKHRzX2luZm8tPnJ4X3RzX21hc2sgIT0gdHNfaW5mby0+dHhfdHNfbWFz
aykNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCXNwaW5fbG9ja19pcnFz
YXZlKCZjaGFuLT50c19sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlpZiAoKGNoYW4tPnR4X3RzX21h
c2sgIT0gdHNfaW5mby0+dHhfdHNfbWFzayAmJiAhY2hhbi0+aXNfdHhfc3RvcHBlZCkgfHwNCj4g
KwkgICAgKGNoYW4tPnJ4X3RzX21hc2sgIT0gdHNfaW5mby0+cnhfdHNfbWFzayAmJiAhY2hhbi0+
aXNfcnhfc3RvcHBlZCkpIHsNCj4gKwkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwgIkNoYW5uZWwg
cnggYW5kL29yIHR4IG5vdCBzdG9wcGVkXG4iKTsNCj4gKwkJcmV0ID0gLUVCVVNZOw0KPiArCX0g
ZWxzZSB7DQo+ICsJCWNoYW4tPnR4X3RzX21hc2sgPSB0c19pbmZvLT50eF90c19tYXNrOw0KPiAr
CQljaGFuLT5yeF90c19tYXNrID0gdHNfaW5mby0+cnhfdHNfbWFzazsNCj4gKwkJcmV0ID0gMDsN
Cj4gKwl9DQo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+dHNfbG9jaywgZmxhZ3Mp
Ow0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0wocW1jX2NoYW5f
c2V0X3RzX2luZm8pOw0KPiArDQo+ICAgaW50IHFtY19jaGFuX3NldF9wYXJhbShzdHJ1Y3QgcW1j
X2NoYW4gKmNoYW4sIGNvbnN0IHN0cnVjdCBxbWNfY2hhbl9wYXJhbSAqcGFyYW0pDQo+ICAgew0K
PiAgIAlpZiAocGFyYW0tPm1vZGUgIT0gY2hhbi0+bW9kZSkNCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc29jL2ZzbC9xZS9xbWMuaCBiL2luY2x1ZGUvc29jL2ZzbC9xZS9xbWMuaA0KPiBpbmRleCA2
ZjFkNmNlYmM5ZmUuLjgwMmMxNjE2MzZiZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9zb2MvZnNs
L3FlL3FtYy5oDQo+ICsrKyBiL2luY2x1ZGUvc29jL2ZzbC9xZS9xbWMuaA0KPiBAQCAtMzgsNiAr
MzgsMTYgQEAgc3RydWN0IHFtY19jaGFuX2luZm8gew0KPiAgIA0KPiAgIGludCBxbWNfY2hhbl9n
ZXRfaW5mbyhzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIHN0cnVjdCBxbWNfY2hhbl9pbmZvICppbmZv
KTsNCj4gICANCj4gK3N0cnVjdCBxbWNfY2hhbl90c19pbmZvIHsNCj4gKwl1NjQgcnhfdHNfbWFz
a19hdmFpbDsNCj4gKwl1NjQgdHhfdHNfbWFza19hdmFpbDsNCj4gKwl1NjQgcnhfdHNfbWFzazsN
Cj4gKwl1NjQgdHhfdHNfbWFzazsNCj4gK307DQo+ICsNCj4gK2ludCBxbWNfY2hhbl9nZXRfdHNf
aW5mbyhzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIHN0cnVjdCBxbWNfY2hhbl90c19pbmZvICp0c19p
bmZvKTsNCj4gK2ludCBxbWNfY2hhbl9zZXRfdHNfaW5mbyhzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4s
IGNvbnN0IHN0cnVjdCBxbWNfY2hhbl90c19pbmZvICp0c19pbmZvKTsNCj4gKw0KPiAgIHN0cnVj
dCBxbWNfY2hhbl9wYXJhbSB7DQo+ICAgCWVudW0gcW1jX21vZGUgbW9kZTsNCj4gICAJdW5pb24g
ew0K
