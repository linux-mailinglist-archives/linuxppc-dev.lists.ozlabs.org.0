Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8897738EA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:12:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PHmbbpjM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmBN3W4Rz3ddJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PHmbbpjM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm741hyCz3dJD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:09:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCIpORIob6LetRY/Bj5ISz4nlayZFhBL9SQKfi5TmlfHo9Xb8lvN8QakzUSJNgXP4hbZKNDMThMXf85l++PprxrGO43YY9nROyORc+DY8DnCznlcWvQdibjjPr/7RWOTG4LGINyGB1lPLefYxqSoaY1ProBnhaki9Ja8HclCSIu9/+0Gk+0fgqL11f2feypXnPVoeIdmT5SvFKbjls9f8M1u12LEmUeuZCzHcQ1TAf3dO0ZMzI2eOXDB4uUWtF4VrxeWji8Cuqllz6UkPesQJFHRs9eohgWln0ZU/Xij3bsGOyZo8AChxPe9e4VspgsaVeV5MRkrwI/ayLT79Up55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU8jcn6qfdpCdm8pDSXSJxCi7x3AAhmC+ssoSBpU5BQ=;
 b=IS0Ma3+u416EyD9L/QvlbhNjlFCIUzm2QNfhGBnLr0HkSjqWnNf5e59+8iLbTTIabM1de972XVlfBnH6Kh1jJyHfpmdxoMKj7itALWvZao2b16AyRe6UHs0Xlvp8orOgcgEfEElG1ggN2Nt7uKW49AAbFShA8ouju5VJrgIwfLVzZpwoGZL6QAYJ0Rxgbfh/rb4OExPuIuDr6qddGe4XV5zTVMDqKyzsLFqBT8qWTK2fKzLDr7Hn6NJRYcELQqiK5WwmjTWA1TDkd3pdMqj9fXa1qVogIdQ5M8D1nstGW9EFGBO7wUAep+CSjwzCHWVPMPmvzvC7lql8FuIZU/mzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dU8jcn6qfdpCdm8pDSXSJxCi7x3AAhmC+ssoSBpU5BQ=;
 b=PHmbbpjMeaMSn24exWz2mPhyNK1Hr7527SX1bxgUcEytgnoGHtnHWEoiOKTeBvLNHkVlBRnEVcxxqJx2rap5nCu/6WEVLTRDoDPG5FHIQGfa+iJeGImMrJB/z7pJfmdAVIbOkU09YqFDc5zDGOUVNX2cHCQsCILzyksyJSzye9+xNIjcqH8ZA3AhoQLTVWpazPRCybdDFCeLrRhJ2XgUe5kWIqJPyO/qndemwLHf6KCPXVruKXDmRK5rhYUROYYNe7br24s1WF1MkJPTGx2ZJiMkwiVY6BvDMtdbOrOiAznztZOSTItARumyWUpWYvQC4BdkVBsdjvnqrfVg1MAe5A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3396.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:09:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:09:03 +0000
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
Subject: Re: [PATCH v2 15/28] soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx
 flag
Thread-Topic: [PATCH v2 15/28] soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx
 flag
Thread-Index: AQHZv9JZBjSpPLlDzkSjMRVJibFlkK/gH4oA
Date: Tue, 8 Aug 2023 08:09:02 +0000
Message-ID: <d4b992f0-5ce2-e55f-d975-72c427e1cb5f@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-16-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-16-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3396:EE_
x-ms-office365-filtering-correlation-id: 3e326b0a-8a2b-4e74-7bb8-08db97e6ba79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  y9IdoqvLCVqPU/GFOOwJwQnAfJDkUF+pqJMfBCPmw+d8xunTiLugd9hJkMGPvCn1J+4OAE0bIiv1TSNHWjOnxsR8TuZ7ACvstqPQWOLO/0fAsrYek3b+AKXLIX6dTEPwecBiSWT9fOL58pZ48X/68BUTOO98mgTEemg6Dqw/XaE3Rr+y1yU0jWiCbcBhTT1UO6V1mBNGr3J5+5GDBzYi5+9J9vwWyyobttGsNf5fFOq+W8jpIteTyepV16v0fQUNcyxytzm2fANcb+AnAtK3BS3KrT6oGoZ3Hpz8n2uVtq0sAkPfVeToUgpy3olNWd9wcqkjHk/wI/lGmQWppyLBwNMVbN6dAS1hhfFU1YTYw5L5ddEEewt0JGRkdFHIKo6k+jIqBQWtHue9jl0bacULe3yZRur9olTkDmVvNbmnCtFPWF/HE2TN5Xw6E2AgzIeUxGz8xQjXN4P6zlMFincKTLw1jjFbgowG3A6/KhG4dD1iYOtu7uFo34SMVNw4W9ZHBgjTQzdNW008h6H3AUzt+w2i96ltcjr8dDOnUUtpFhy0mRgyH5RXXlTwBXNg3ezkM3R6XDnjan4AIr3TxU9hEOM70s1O17WBPDApy2nkET4VeEYrLraqDW8KQ4n6+nR7OdrgLCPclz2W1hPM/bv/+Y6SFcvVL1CiYsn3RLNzAd8YmO8v5t24w3CxRJgY8y2g/X9/ENNXZIztSP/ImniEYJ3tnBHg3YJeShweGRL+GG84yxlqWSX/XINMPKqMtkNLmyJh0kha9Kj1sJt26OfHGg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(366004)(90021799007)(1800799003)(186006)(451199021)(90011799007)(38070700005)(66574015)(41300700001)(26005)(2906002)(31686004)(44832011)(83380400001)(5660300002)(7406005)(7416002)(8936002)(8676002)(2616005)(478600001)(316002)(921005)(31696002)(110136005)(91956017)(54906003)(76116006)(6506007)(6486002)(66476007)(64756008)(66446008)(66556008)(38100700002)(71200400001)(66946007)(86362001)(122000001)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U1hYQzNHOERwWWhrUmVVaU9Td3hXTmozbzBmRWh6OVpqL3lRcWdia1hhbUZr?=
 =?utf-8?B?M3FkZ21tN3R1c2d3d00vYnBobVBoVmxtMEN1S0ZEYWdGZGxHQ0d0S0FGeHo1?=
 =?utf-8?B?OWRnSkNFeW4vVmU2eDBQQXcyb3VuenNiN0t5aFVOMGdzWU1BUGd4b1pSR3lT?=
 =?utf-8?B?UER6ckp6OEdWeHU4S2ZRWTNTaUJNMmNycHJkQllXc3ZzYm1oM2xsdStpRkZr?=
 =?utf-8?B?VHJXUmVMaEh0OVBCKzFqMTQ1RUpYVWRveVpWRGxOVjUyRHRpM2JoV1VId3Vo?=
 =?utf-8?B?Szh6R2owMGhOWlVmQjJmQnk0QlVJQWkwK0NTcnlvTE9OMDUvN1RKQ1VFL3ha?=
 =?utf-8?B?ak54c0FXVFcvREdNZXBnZU41N3BDb2JzZDVmdzdjNFFtVXN3RGdNclJmcHN2?=
 =?utf-8?B?THM2U3dRREphd245VjhrLzZ3S0FXV1hsR2xweFNRTktwSmJZeXE2bjJjQ0RY?=
 =?utf-8?B?d3AxdWJHWFpyZkJleGVnMkhCZlYyQ1cwbHFGMUV0dFFody9CNnFuY09uK2Zj?=
 =?utf-8?B?S3RzdjRKU0hibEEzdWFacm9nTDN0YkRtOW5iTHVCeW9QNG5SMnZCcHdNTXRY?=
 =?utf-8?B?RytYRmJseTNrcTh0MkZIOVh3VVU5MVZ4djZ2Q2NuMGtIdG1ZbTdoc3V4Ym9D?=
 =?utf-8?B?Zm56L0QrTjc4NE1WVDhiU3Z1Rk9hNDkxNTZOaUdXbnVHTkc2bUxtUUhOSzVo?=
 =?utf-8?B?RGNVZVE5UUJlY2JGd0lhNm5QZ1dzUDhWY1hWS3RFbU9mei92YzU4M1NjM1hZ?=
 =?utf-8?B?TFA1TmpZZUtVQkcwZ285eGtUTDdWb2lPODZxSGFvNWtCUzMzVDduaTI4ZG1m?=
 =?utf-8?B?Tk92OFNERFF4bFpCRURJZkc0THFnaFhmbm5MOVJFM1Njb1ZCRE04WlpyUWhI?=
 =?utf-8?B?MXo4V1BqZWYyTW5xdGlGV0MvZkQ4UXpyY0RZL3R4T3JwNHAvenh4VHBzbUJt?=
 =?utf-8?B?Z0RVSFJ6MjRoNzJjdlJ2ZFc3VzZRb2lONXlhZmkzY3NET0E0YVdrNnp1N2Fv?=
 =?utf-8?B?dVBDOEJIRGxTZ3AvN3RvU21RY0dSNHFDbVBkd3dXV2RVdzZnMUVycVVxRGN4?=
 =?utf-8?B?aHQ0K2NWdURibHY1dGpLZ3NKQ0JpSW5wVnM2Ym9CakhNaFlrRTZpSzAzT1JP?=
 =?utf-8?B?bnAzUGVUZVJwejEzc01MOVR4Y0ZCZFpuMGtrN1hNWTlOaUpCRFplRGp0Sk1O?=
 =?utf-8?B?Q2FLd3dDSWd1RzJHazNSb2s3aGVvaFc1UVIvUDZYOGVJVE56N3VyY0M2ME0r?=
 =?utf-8?B?Y2xEVWxmYTFNVW5pZFh2cDBnWTkycndzM1lxVWI4VlpmUHZQZk8rK2tDZ1Nt?=
 =?utf-8?B?TCtCTjUrc1dQMW15VkdWNERBdTM4TDVOamxLRzBHMVhKWGMzMHRpblBoV2px?=
 =?utf-8?B?Rm5JWDBiWGluemJ6cGtMWGZkMTlYZzRGUXdFekd4WkJxRVVmQUkyN3A0aklE?=
 =?utf-8?B?Ri96TDRzMXM0YXh1WWFtSHFpWXY3VzBlcndZUmRodExLZlZ0KzVyS1d4S0xW?=
 =?utf-8?B?SlhuZHJOZSt4bk9vUS9GM0lSN1UvdTFzZFdnWWEreWRqYlE2RmhLZGFaRGRB?=
 =?utf-8?B?d05XcnphWFYvWXI2MG9yR0ZqaEZnRHMycm1odXdOUnpMUy9xakhtUVl0N2g3?=
 =?utf-8?B?aG5EbVkxek55K0JiMzZtdEovaXl0YjRieEhtUHhqcS9WY05uNlRHNUgyaTNB?=
 =?utf-8?B?N0dsd2ZFbjhjSTMyN1NWODBtUnkrNzBMRy9uVEh5ajc4SkloUHFRUTllc0p4?=
 =?utf-8?B?S3F0UU85SGQ1R1hCOW1ORjd2L2U2Q0Nuays0NmV3VGRlZmVwV0I3TWFwdjNF?=
 =?utf-8?B?cnpXUFdhRnVtQUlTOWl3S2ZMaXROL3NKZThocHN3ZG1Wbmtlc1ErZ2E1dEpZ?=
 =?utf-8?B?QXFEMWhRTjNVc0h0NkUzdTFCVnNDNS81ckhqams0a3M5ejZGWnk1YTc1Z3o2?=
 =?utf-8?B?VS9oaWZ4enpZelEvRmdtaTF1ZUdJK0wwMXlibzJDNjBORkQ3STJVUmU5U3p1?=
 =?utf-8?B?Q2t5eUYwMFpmdUI2aVVaU2JRSHBlbm9vR2MwcG4randUSUdJcXV3K2NBdUgx?=
 =?utf-8?B?UGloRnVKZTlYRGVEbm0vNVJaRXhrUmN5RHlLZU10L3I2dks0VXdVWjMwNXdu?=
 =?utf-8?Q?lt6i/S+xGGdxE9Wn2Fz82Y6gA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82B21B0D0B41B944A73BFF2D1E2C2F05@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e326b0a-8a2b-4e74-7bb8-08db97e6ba79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:09:02.9431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxjASf6SG9sYLJ1kfFB1cGN5IuT5pHAXqTVXRAx1wGgKM4HDzwHYvUE9F9C9Nr6+PkEMCYqMQoLMD7YHpJGXZo6TfP1sPdsMHDyRydMdWkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3396
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
biBvcmRlciB0byBzdXBwb3J0IHJ1bnRpbWUgdGltZXNsb3Qgcm91dGUgY2hhbmdlcywgc29tZSBv
cGVyYXRpb25zIHdpbGwNCj4gYmUgZGlmZmVyZW50IGFjY29yZGluZyB0aGUgcm91dGluZyB0YWJs
ZSB1c2VkIChjb21tb24gUnggYW5kIFR4IHRhYmxlIG9yDQo+IG9uZSB0YWJsZSBmb3IgUnggYW5k
IG9uZSBmb3IgVHgpLg0KPiANCj4gVGhlIGlzX3RzYV82NHJ4dHggZmxhZyBpcyBpbnRyb2R1Y2Vk
IHRvIGF2b2lkIGV4dHJhIGNvbXB1dGF0aW9uIHRvDQo+IGRldGVybWluZSB0aGUgdGFibGUgZm9y
bWF0IGVhY2ggdGltZSB3ZSBuZWVkIGl0Lg0KPiBJdCBpcyBzZXQgb25jZSBhdCBpbml0aWFsaXph
dGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJv
b3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyB8
IDUgKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jIGIvZHJpdmVy
cy9zb2MvZnNsL3FlL3FtYy5jDQo+IGluZGV4IGM4ZGRkMmE1NGJlZS4uZGMxMTM0NjNmYmM3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gKysrIGIvZHJpdmVycy9z
b2MvZnNsL3FlL3FtYy5jDQo+IEBAIC0yMTYsNiArMjE2LDcgQEAgc3RydWN0IHFtYyB7DQo+ICAg
CXUxNiBfX2lvbWVtICppbnRfY3VycjsNCj4gICAJZG1hX2FkZHJfdCBpbnRfZG1hX2FkZHI7DQo+
ICAgCXNpemVfdCBpbnRfc2l6ZTsNCj4gKwlib29sIGlzX3RzYV82NHJ4dHg7DQo+ICAgCXN0cnVj
dCBsaXN0X2hlYWQgY2hhbl9oZWFkOw0KPiAgIAlzdHJ1Y3QgcW1jX2NoYW4gKmNoYW5zWzY0XTsN
Cj4gICB9Ow0KPiBAQCAtNjk2LDcgKzY5Nyw3IEBAIHN0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBf
dHNhKHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgYm9vbCBlbmFibGUpDQo+ICAgCSAqIFNldHVwIG9u
ZSBjb21tb24gNjQgZW50cmllcyB0YWJsZSBvciB0d28gMzIgZW50cmllcyAob25lIGZvciBUeA0K
PiAgIAkgKiBhbmQgb25lIGZvciBUeCkgYWNjb3JkaW5nIHRvIGFzc2lnbmVkIFRTIG51bWJlcnMu
DQo+ICAgCSAqLw0KPiAtCWlmIChpbmZvLm5iX3R4X3RzID4gMzIgfHwgaW5mby5uYl9yeF90cyA+
IDMyKQ0KPiArCWlmIChjaGFuLT5xbWMtPmlzX3RzYV82NHJ4dHgpDQo+ICAgCQlyZXR1cm4gcW1j
X2NoYW5fc2V0dXBfdHNhXzY0cnh0eChjaGFuLCAmaW5mbywgZW5hYmxlKTsNCj4gICANCj4gICAJ
cmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNhXzMycngoY2hhbiwgJmluZm8sIGVuYWJsZSk7DQo+IEBA
IC0xMDUzLDYgKzEwNTQsNyBAQCBzdGF0aWMgaW50IHFtY19pbml0X3RzYV82NHJ4dHgoc3RydWN0
IHFtYyAqcW1jLCBjb25zdCBzdHJ1Y3QgdHNhX3NlcmlhbF9pbmZvICppbg0KPiAgIAkgKiBFdmVy
eXRoaW5nIHdhcyBwcmV2aW91c2x5IGNoZWNrZWQsIFR4IGFuZCBSeCByZWxhdGVkIHN0dWZmcyBh
cmUNCj4gICAJICogaWRlbnRpY2FsIC0+IFVzZWQgUnggcmVsYXRlZCBzdHVmZiB0byBidWlsZCB0
aGUgdGFibGUNCj4gICAJICovDQo+ICsJcW1jLT5pc190c2FfNjRyeHR4ID0gdHJ1ZTsNCj4gICAN
Cj4gICAJLyogSW52YWxpZGF0ZSBhbGwgZW50cmllcyAqLw0KPiAgIAlmb3IgKGkgPSAwOyBpIDwg
NjQ7IGkrKykNCj4gQEAgLTEwODEsNiArMTA4Myw3IEBAIHN0YXRpYyBpbnQgcW1jX2luaXRfdHNh
XzMycnhfMzJ0eChzdHJ1Y3QgcW1jICpxbWMsIGNvbnN0IHN0cnVjdCB0c2Ffc2VyaWFsX2luZm8N
Cj4gICAJICogVXNlIGEgVHggMzIgZW50cmllcyB0YWJsZSBhbmQgYSBSeCAzMiBlbnRyaWVzIHRh
YmxlLg0KPiAgIAkgKiBFdmVyeXRoaW5nIHdhcyBwcmV2aW91c2x5IGNoZWNrZWQuDQo+ICAgCSAq
Lw0KPiArCXFtYy0+aXNfdHNhXzY0cnh0eCA9IGZhbHNlOw0KPiAgIA0KPiAgIAkvKiBJbnZhbGlk
YXRlIGFsbCBlbnRyaWVzICovDQo+ICAgCWZvciAoaSA9IDA7IGkgPCAzMjsgaSsrKSB7DQo=
