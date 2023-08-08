Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC47738E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:10:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jGEaog0D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm8G2B9Cz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jGEaog0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm4R1vJhz3cPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:07:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgwIF4SQJy8HbQvS4fTnGbFTPSp7jw3R3thrpxWXPqjZuOmEcmMYI1O1Ly/biuJ1+ygO9AKBvsvSijd0mNhlQ9m1C8rKAZTjrmCu+ETxxo9pHmOiAvp6BefWw6IKPqz0cHVVLnTe5HpYsO5X+cBFJsKaL9ICr0k3Z7oV96ZZICO1tHJpfE/bgoXw7E6UxPx/QcaY6/CZKoX+21c8NGHilyJvHV6jZSUFTyJStaooIyHBJcUsL42Zn3KR2CnMWoyk0pvcucaUjoo0b9Vb5tZc/ChzmjOb2Tzx3oXzSI/lRDXaKpAZTSNAfbv5talaTjpXv8nE10QZGWIhdx18nT+sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+AySMIH6EdGl5+YnKnMg7qnfyZ6AJllwZr/ZssyCdg=;
 b=gQ41lKmAa4ke6JtlZS5V6rEgkbK/SvRVXu0Qh8O+NRUZnyovtyyhoAdCmeq6UJ73zmVLcepkRRbcvPaxAvbc803kEe1E/o5Mx8c42vFfmNSzXwFWh68zFevgkXQ+eemMZAKrnAtgjnrQqJ31LY8HF76QApJjawJNL5mXZeSLpO3l591ysmzETvUnei82d1rPMzmu5i3KaoTzrsvX6Ssg/5vsWSlBrPf2myM37qPHWGkx5JyrA04iuawt4j5DKNY2f/V3hIltFzQsQ9BF+kP2vdwLAy6et3A3ZtrEcMUoUUJCbPL48grhnITXbz8PCN2QK6EBVS4y1s70vz37tsM+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+AySMIH6EdGl5+YnKnMg7qnfyZ6AJllwZr/ZssyCdg=;
 b=jGEaog0Df/e2ysyeBXHAarSm01y9Ch/2QhfSFyb2Nat4doorLKO53qJZi7pEiyJ/IGWUOqtIZDv0LJMINjDeFDaVF7gqmE06TJCRv1I4EnwhIWJ1I+gAQL5YE88uH5PY2Dp1Qs5BLwIPH3GWslluCjLQQfVoy4V/FzQTFTjJDo8F1To1tyDzr5lU8Pne/ErlAeEiblWwNA93tASaI4zWfpE2+j8OSf0LtiWN68HpRxuSSOrCzehF4rswll3Itro3snQmOWlKXcSKh2xoVHKTZbQ/jzOTzquzU5DfIAvB8Z/o+w0K9l82Sq3i5JDxZb9FtUr9SAkF27Kjjv0SMYlS5w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:06:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:06:45 +0000
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
Subject: Re: [PATCH v2 13/28] soc: fsl: cpm1: qmc: Add support for disabling
 channel TSA entries
Thread-Topic: [PATCH v2 13/28] soc: fsl: cpm1: qmc: Add support for disabling
 channel TSA entries
Thread-Index: AQHZv9JVaxGOaXo+7UG5AiwRqFz4Uq/gHuaA
Date: Tue, 8 Aug 2023 08:06:44 +0000
Message-ID: <446e368d-4072-e706-1b11-50ad1106e505@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-14-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-14-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2052:EE_
x-ms-office365-filtering-correlation-id: 0494a766-e5df-4ac8-3517-08db97e6683c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TasVjmP7wCpEZvWv8s8du5W1yK4AZv9QkDB6W3X7GU286YM8QjNfmTVosIRSZ6tqL+iTvbHarvkRRv+tb9gByl505xf1ysKZ63hrM/wuE76Zpyv5AfknmYkGbzLt3lyY7LfMHQcty5D0E27aHrEmXC9NjO2RnzjQLN6HypY4TPBGbaJ7HwZuvB431uxpvJkFLwhyBmncBt3bGn36bULwUbNAd72W8vsEBs8aXIqur2MJWQAdCCwK3X3lQjCplju2xdObY2hV5f5AdK4RA4ladAF3rPvOZclMOKjOCmrsCIlRfQtSDHdvy3BtMRbpz7HL1Cr/y/jcRYgaePSeVycwZ2mwGLIM0IqiytGRM6c6v/xe0Yk99U7PUn8tDS9icwndhfNkt134UV0mYz8k5Muskt9jnPCnahSFvRcULWoW9TsC2vz4SdQsl7zSystZrcGM8dzLT7u2OD3G4W2BnAQO8FaBuSu0+8dyzh/WQLljpk04YGYyM+eHOmgxsn+8k1H/azEOYWXpOrj/YSpxeoZUtVxMflk7GX9yilTMCY/W5J7u8zl2E2sK2QZ8Pdf7TgAfBueqdKcU+tDks4IEwdyO+3CZKRJ0tBLjjuNwKXHBrnm2x5vj5VQExBUabxKYVYQkR/EAUohhOZX/l7rPiOvNTyL+XXUNoMhWYPRyZgggfyZOX42INTjOOw1uWe4eRxkTwrmt7lHuepdN69bkaiy4UUWQHRkZMVvVJf6SOlzk2Yxt6SuoS24qwAVTNRwUBM+HX1fXbMzTY8cHdB1r9UWnzw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39850400004)(90021799007)(451199021)(186006)(1800799003)(90011799007)(2616005)(36756003)(4326008)(6512007)(316002)(86362001)(122000001)(921005)(54906003)(76116006)(110136005)(38100700002)(66946007)(91956017)(478600001)(66446008)(64756008)(71200400001)(66556008)(31696002)(6486002)(66476007)(6506007)(41300700001)(26005)(38070700005)(66574015)(8676002)(8936002)(2906002)(83380400001)(7406005)(7416002)(5660300002)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cnNsR3NNNzNZWFhOY210UTREVG1zQkZseld4c2l3OWxaV1B0eFVFVFcvTE1u?=
 =?utf-8?B?YnVoVTNxbjFybVptQkRwSXh6K1dLVlVleC9SMWcyVExsYThRcWFvcHE0Kzh3?=
 =?utf-8?B?d0t5T1dYSXdpc0dlcXlQZjJOd1FhVGZyKy9XOTBvLzhWM29XRVNNTlZ6YmdI?=
 =?utf-8?B?VituSFhzT0RvODRNSUNRV0xhbGQ4eUo5Tjk4akQ1WkZTUTFFRU9mR0piR3BM?=
 =?utf-8?B?d3VBTWcxYlY4ZnJaUXV3YXk2WnA4VzNPUVgzNVRIOUdiM2dsT2xienVpa0ls?=
 =?utf-8?B?STBnUU8rWW1CUm92bFAzQm96K1l2Q2t4MGd1aWNzWlhieVpHMkFRbFRXU1o2?=
 =?utf-8?B?UlFKNnBPaHNaRHFWV3Fqc0VsRTJNRExFK3NmR05lNTN2RW4yZWhkSmV2TTkw?=
 =?utf-8?B?MlloTm5jVnJWbTkxVjR2R2NqaEdHTVh1czhwRFYvUkRFeE1CQnFrNkZtM0w5?=
 =?utf-8?B?ODhsencvNHZJMitsU0duMGJpQ3BxOWRUZklyVHlnQkprUmZ2ZFVrbGZIVnNR?=
 =?utf-8?B?dm56TklSTWtXUENRMDZjZEVuKy9wWCsxbmZVRDUxbEt1a2JaZXR0TFpjMktF?=
 =?utf-8?B?N0JlY3JrUS9zMVdBbG5XTGxzWkpJeUxtR2xhRmN5S0xZbFNJRXNyb0tWZkNR?=
 =?utf-8?B?RTJFSTY4NmNqSjRSZ0RqRGR2VmhmQ3NRUFQwOVBHRERQaE00dUpvSkdva0Mw?=
 =?utf-8?B?d3AxTkIrUEdpTEUxNE4rNXJMc0V4S1o4V0gyUUVXRFcyYTlsZ3lOczB0KzBh?=
 =?utf-8?B?RTE5T24vUTdMcDRUQWFIMjI2dmR3eGh6WUw4TlIrbWsvVTZEWm9RNkpJazR4?=
 =?utf-8?B?MlZ3NXkrSm1tUHY5dVJyb1M0WEVZcGdYQmlOOVlFUFJmNGpQMzRQWVdnZTZ0?=
 =?utf-8?B?RHdjaWVrZFlrNTZxS3JMNlk1b1NESktCOEc5MW1SbXp5MEZNeWdLbDRPVlBt?=
 =?utf-8?B?MGd1WTlJTUNuMGQ3S2JJTE9pR2kyOUloSXhNU1IxdUtUcXpCUEZWM3Q1bEdJ?=
 =?utf-8?B?NytibHpCYlF6WDFISkZuZTkyTlRQWGN2d3RGNmRXVnUwMGpDYmFINGVYNUR5?=
 =?utf-8?B?cmU0ekpSa1J3QmQ2ZG0wMDFFb05CeU1qR0YvOXo4SjVFZUJsT2xnYkg5VXFH?=
 =?utf-8?B?cmRBV3psMkxjcGFkUkpCSHpjVko3bkEvdEw1eGo1Q1Y4UHZWT050Y2VNTmJ5?=
 =?utf-8?B?T0dlU0xVMXVjRHVrbWpqVUwzMU5iSEcyUUNGYUVKMWhzUzN3K0I5YkRia2pp?=
 =?utf-8?B?OEVBUzIvdTFqU3VZYVBLeVNOR2lGZzg0Wnk5d2htVmwyUnk0bHdrZmgyQWNB?=
 =?utf-8?B?VXJwakVSVnppZjJML1Bkc0FWOGZKdGpsVnR5bVVscHpOUWlCWFpna1cxdnh0?=
 =?utf-8?B?TE9tay9TTlU2VnFGYnVDWjRQczZvZHg4aWNnMjVlcDBrM0xYWXp4NkNvZllj?=
 =?utf-8?B?MUxkdVR5Mng5TU5kcjlCTVNDc1E2UE1ZcVFmVmFWZWl1OHFiNnVYVC9wYko4?=
 =?utf-8?B?cXBNM3ByZlp0SkM4NHhDRGtMeFdSaTRDdTBCR1p3S3UzR1lNcW5ZVkZVVTVt?=
 =?utf-8?B?WnVSTHJSSjE2Q0IzL2NsbGMvR2hMTWRNSGx6Vk1lMUdHT1ZBdC9VSzMzU1Qv?=
 =?utf-8?B?Nk9ZRkxPTGl5Y3lwQSt1WVJxMHE2Sk9mVytQV2ZIN0FlQzNDUnZjM1l6aXha?=
 =?utf-8?B?djJTQXYybTZka0hSejFYcTR2aGcyQ3gxUEd2VEJDa1gxaUppL0JEY2JsTEJu?=
 =?utf-8?B?UHBIWWw5S3hpeFV5dmEwYnROOW8wOXZieXlNRDlXYTJJdFFlWVNtMU9kY2JT?=
 =?utf-8?B?YmR3aEhvNmZSWkdncFkyM0ljQmhOa2ZzV2lGQWF4bFFYNHZmbGRaL2NSRWVU?=
 =?utf-8?B?amtJSTlpdWM0QjNucmRvb3MzWUd6Z3AxcWtHaExqZkNJK1lRV2x0Z1pwald3?=
 =?utf-8?B?bEREZEtvZkVmbkdZSE1yejFIWDZZMHdTNnVGSm1DZTFqR20zL0xFeENRaXMw?=
 =?utf-8?B?QTRVdUp3V2swTmhMWitnSUZaRDEwK1VyYjltV0tOSWdpM0hiWFYrNk9UUUdi?=
 =?utf-8?B?WkJzT0tBZnh5ajFlZGQ3cjVhdlhWWDJsUjAvbFMrVHRnY3BGblRiNjdNZytm?=
 =?utf-8?Q?I6E6t8L/N3p1XwspwHh00cxBO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89E7453AAABD514CA17926DD1A2C0D8F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0494a766-e5df-4ac8-3517-08db97e6683c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:06:44.9592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TV/2BPT2GQ5e5C9WcKbRxmh1UnRA3J/28goEINsbQPLbz1J1wK8I65nB4gykgWUU8tzDQau1FnwIhRhZbUm+Sa0Lpjz4BefV/mUSTtKhR1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2052
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
biBvcmRlciB0byBhbGxvdyBydW50aW1lIHRpbWVzbG90IHJvdXRlIGNoYW5nZXMsIGRpc2FibGlu
ZyBjaGFubmVsIFRTQQ0KPiBlbnRyaWVzIG5lZWRzIHRvIGJlIHN1cHBvcnRlZC4NCj4gDQo+IEFk
ZCBzdXBwb3J0IGZvciB0aGlzIG5ldyBmZWF0dXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVy
dmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAg
ZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jIHwgMjAgKysrKysrKysrKystLS0tLS0tLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUv
cW1jLmMNCj4gaW5kZXggODI0MDU5MTVmMmE0Li4xNDZlZWJjMTI3MzcgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1j
LmMNCj4gQEAgLTU2Nyw3ICs1NjcsOCBAQCBzdGF0aWMgdm9pZCBxbWNfY2hhbl9yZWFkX2RvbmUo
c3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGFu
LT5yeF9sb2NrLCBmbGFncyk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCBxbWNfY2hhbl9z
ZXR1cF90c2FfNjRyeHR4KHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgY29uc3Qgc3RydWN0IHRzYV9z
ZXJpYWxfaW5mbyAqaW5mbykNCj4gK3N0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBfdHNhXzY0cnh0
eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGNvbnN0IHN0cnVjdCB0c2Ffc2VyaWFsX2luZm8gKmlu
Zm8sDQo+ICsJCQkJICAgICBib29sIGVuYWJsZSkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGludCBp
Ow0KPiAgIAl1MTYgY3VycjsNCj4gQEAgLTYwMywxMyArNjA0LDE0IEBAIHN0YXRpYyBpbnQgcW1j
X2NoYW5fc2V0dXBfdHNhXzY0cnh0eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGNvbnN0IHN0cnVj
dCB0c2Ffc2VyDQo+ICAgCQkJY29udGludWU7DQo+ICAgDQo+ICAgCQlxbWNfY2xyc2V0Yml0czE2
KGNoYW4tPnFtYy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RTQVRSWCArIChpICogMiksDQo+IC0JCQkJ
IH5RTUNfVFNBX1dSQVAsIHZhbCk7DQo+ICsJCQkJIH5RTUNfVFNBX1dSQVAsIGVuYWJsZSA/IHZh
bCA6IDB4MDAwMCk7DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0K
PiAtc3RhdGljIGludCBxbWNfY2hhbl9zZXR1cF90c2FfMzJyeF8zMnR4KHN0cnVjdCBxbWNfY2hh
biAqY2hhbiwgY29uc3Qgc3RydWN0IHRzYV9zZXJpYWxfaW5mbyAqaW5mbykNCj4gK3N0YXRpYyBp
bnQgcW1jX2NoYW5fc2V0dXBfdHNhXzMycnhfMzJ0eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGNv
bnN0IHN0cnVjdCB0c2Ffc2VyaWFsX2luZm8gKmluZm8sDQo+ICsJCQkJCWJvb2wgZW5hYmxlKQ0K
PiAgIHsNCj4gICAJdW5zaWduZWQgaW50IGk7DQo+ICAgCXUxNiBjdXJyOw0KPiBAQCAtNjUwLDcg
KzY1Miw3IEBAIHN0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBfdHNhXzMycnhfMzJ0eChzdHJ1Y3Qg
cW1jX2NoYW4gKmNoYW4sIGNvbnN0IHN0cnVjdCB0c2FfDQo+ICAgCQkJY29udGludWU7DQo+ICAg
DQo+ICAgCQlxbWNfY2xyc2V0Yml0czE2KGNoYW4tPnFtYy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RT
QVRSWCArIChpICogMiksDQo+IC0JCQkJIH5RTUNfVFNBX1dSQVAsIHZhbCk7DQo+ICsJCQkJIH5R
TUNfVFNBX1dSQVAsIGVuYWJsZSA/IHZhbCA6IDB4MDAwMCk7DQo+ICAgCX0NCj4gICAJLyogU2V0
IGVudHJpZXMgYmFzZWQgb24gVHggc3R1ZmYgKi8NCj4gICAJZm9yIChpID0gMDsgaSA8IGluZm8t
Pm5iX3R4X3RzOyBpKyspIHsNCj4gQEAgLTY1OCwxMyArNjYwLDEzIEBAIHN0YXRpYyBpbnQgcW1j
X2NoYW5fc2V0dXBfdHNhXzMycnhfMzJ0eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGNvbnN0IHN0
cnVjdCB0c2FfDQo+ICAgCQkJY29udGludWU7DQo+ICAgDQo+ICAgCQlxbWNfY2xyc2V0Yml0czE2
KGNoYW4tPnFtYy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RTQVRUWCArIChpICogMiksDQo+IC0JCQkJ
IH5RTUNfVFNBX1dSQVAsIHZhbCk7DQo+ICsJCQkJIH5RTUNfVFNBX1dSQVAsIGVuYWJsZSA/IHZh
bCA6IDB4MDAwMCk7DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0K
PiAtc3RhdGljIGludCBxbWNfY2hhbl9zZXR1cF90c2Eoc3RydWN0IHFtY19jaGFuICpjaGFuKQ0K
PiArc3RhdGljIGludCBxbWNfY2hhbl9zZXR1cF90c2Eoc3RydWN0IHFtY19jaGFuICpjaGFuLCBi
b29sIGVuYWJsZSkNCj4gICB7DQo+ICAgCXN0cnVjdCB0c2Ffc2VyaWFsX2luZm8gaW5mbzsNCj4g
ICAJaW50IHJldDsNCj4gQEAgLTY3OSw4ICs2ODEsOCBAQCBzdGF0aWMgaW50IHFtY19jaGFuX3Nl
dHVwX3RzYShzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgCSAqIGFuZCBvbmUgZm9yIFR4KSBh
Y2NvcmRpbmcgdG8gYXNzaWduZWQgVFMgbnVtYmVycy4NCj4gICAJICovDQo+ICAgCXJldHVybiAo
KGluZm8ubmJfdHhfdHMgPiAzMikgfHwgKGluZm8ubmJfcnhfdHMgPiAzMikpID8NCj4gLQkJcW1j
X2NoYW5fc2V0dXBfdHNhXzY0cnh0eChjaGFuLCAmaW5mbykgOg0KPiAtCQlxbWNfY2hhbl9zZXR1
cF90c2FfMzJyeF8zMnR4KGNoYW4sICZpbmZvKTsNCj4gKwkJcW1jX2NoYW5fc2V0dXBfdHNhXzY0
cnh0eChjaGFuLCAmaW5mbywgZW5hYmxlKSA6DQo+ICsJCXFtY19jaGFuX3NldHVwX3RzYV8zMnJ4
XzMydHgoY2hhbiwgJmluZm8sIGVuYWJsZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQg
cW1jX2NoYW5fY29tbWFuZChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIHU4IHFtY19vcGNvZGUpDQo+
IEBAIC0xMTQ2LDcgKzExNDgsNyBAQCBzdGF0aWMgaW50IHFtY19zZXR1cF9jaGFuKHN0cnVjdCBx
bWMgKnFtYywgc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIA0KPiAgIAljaGFuLT5xbWMgPSBx
bWM7DQo+ICAgDQo+IC0JcmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNhKGNoYW4pOw0KPiArCXJldCA9
IHFtY19jaGFuX3NldHVwX3RzYShjaGFuLCB0cnVlKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJl
dHVybiByZXQ7DQo+ICAgDQo=
