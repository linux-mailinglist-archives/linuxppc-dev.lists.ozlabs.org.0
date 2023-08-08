Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 495097738DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:08:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=U43QFCWs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm6G4GP9z3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=U43QFCWs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm3F0nLvz3cS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:06:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8liMFlNMK8zwtbnqSX1mwSfOEQDaMWZT/Xzs11+9gPZwHyVr1GQxGUvlw0jz7CuqCC3xDpOjWZphLeL3xhSdpIENf2k4OM7rmspU1Fb6eHp3AEoEnCA/Z9+mwdzeTxi7j5JOvYdQLBtKkpRvUodgbTphqLJEElxgwYuLensthSiMYTnuVdg1K0CjvLX5cblbf1Kc7qR9OxdXUqn68FLvTw+bXoPukOPQe68+iCEQbU6LLqWDP0E1som+zRqjBRjWSWwtmWIsXpXaixlqELknDw1r4g0mIZRl6LXnWLWfmPVFXHROodaIde2lwDz5nI2dT5yKR9ey25VrTjDwq1Wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTFDUK5yKyaF7oJLGJD9v/gs1aDETIL8SMTBHvm2daU=;
 b=OXyDU9q1yH60qVCiUJi3rKwIR1v1uT7ooKNf90J9WmYilSRmmRiablSO6UBCBVyb1HpMN5pTYRmb6+aaZDzM9q9Kai+rauJSvoP4TtfXYzM8SKQG/mRLfp2whBbY/pi0+XpkpOSIGLphkVZifUcYkhkI0T1oHljZKO89hxVizT8Fmu+molLS6SawRnmMjX/tFvKuZPhRNq8xW4es/aX0xTrhS2zJ42omtfHuo5RC7GH2OprINDG580jLW8UW0zanz6n1AsIPGXoGz9ClzYbrNNMfLwyt9ndT8Lx3IFqbGOgy0aSvEPam8pizS4lKH/OfZTtm/aShr9Y69rugkOojdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTFDUK5yKyaF7oJLGJD9v/gs1aDETIL8SMTBHvm2daU=;
 b=U43QFCWs2DKH4O6+Y5TxWyMLDhjSqlhkbgqsLWdPo3i9GYOYYxr8HpdxJyNx+XDgAWY+9J0cVwy4DxA24JcK7FUo3m4jUiqL/QXi0GOdPQqqpo8sp1rrKiRcoN7wHOAFQluaWIXvNZNmqsP98jLKYNbFVFc2Oi77eJUeAaBCIFL4hiLaidhaw/Xn0QgxWrkyIqFb7GetwwRy/n8tgFYRIv0QVBFu0GG+dZ1fJoSfjNnl7qVCMPh4lbIeqNRqQOuLtyStAtBr6+mFV1RFfFru2xzt1r8x1o3Tm6iDTNeJwglmNqXxIRG5uH1FASblTKyR2zf8xAPdwaeGglAIWuWqYg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:05:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:05:40 +0000
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
Subject: Re: [PATCH v2 11/28] soc: fsl: cpm1: qmc: Remove no more needed
 checks from qmc_check_chans()
Thread-Topic: [PATCH v2 11/28] soc: fsl: cpm1: qmc: Remove no more needed
 checks from qmc_check_chans()
Thread-Index: AQHZv9JQ14lj6X4l70uWOzOScfkRb6/gHpkA
Date: Tue, 8 Aug 2023 08:05:40 +0000
Message-ID: <187e11ac-8aef-cee0-2dc3-87df7d8a98e8@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-12-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-12-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3279:EE_
x-ms-office365-filtering-correlation-id: 2ac92e60-8f5c-4ae8-aeee-08db97e64207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ViqmFAmXuszLkrs4VTvXHALk1tDALC4OHUeyoPGLUa1Wsya/kkDEVphz5bn9osG1MVdr+NiIWiUQqVQbBX59kDIwki+OeZMhRE+fjD16mUSdGOFngxsFErDba6/nZ9fARyWKDq0j5rvXzEBPvK5Ucxg/I6sNqNlt7v6BDxgiRPQ7HMeyLnSvqAIDf/gIWMOBmi2OEFXsh4+49bCAItLjFGA9u2e7w9uvgG0ZoXOGWEEVxYg6osyGVSq5U9CFWN5QbdKSorwwRv53+nioOhLu5pSVCDQm6YluOnyhYIv/qLcJrxrcWbQXFB2K+CRMDSzh9typNHTxasMZCMahKsMWodqUbsy3yk3yiBnU4Y6oElpIFrJ2g7MdurEaAhgb1GcWvo0fgL5L4TGYT3TJREkqcMD335xouqfsqFLivxZhIYg0PBrZvcj+bOY8Ulvp35YtJM1oGTBnshBSP/5lACS+8f+spFzyrdBNZn8IikFybVxUc+S5Zhw2Q5+xdpNXYbnK/pzQNyLxKwgX1ebrnFuIipv86yP00bsfDMSDqkQR0KqwDau56+XOa4IT4UtipoAnujy+dnvwj68vkuxo1DTHLsmNZ51fmvIBmc1cjYw4IwcB7oXs5tniy5lu4HGPfzJK2BGjLR6PCPLMKc45JMwAQxWtJ79t4OflenxyOSMrWN/zMww+4dYSnXnQ36FQVU7WDhQmmgOpC7ugr9TAG1D40SExXQMMnd6BQcbDNtRYF+O4C5rFe9PNAxYENGlf07bFq2YRq1GZ4tZMnLqVF+aCf4biLtAa54NmLD1tTI8rmpA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39850400004)(396003)(136003)(376002)(90011799007)(186006)(1800799003)(90021799007)(451199021)(2616005)(36756003)(6506007)(26005)(6486002)(71200400001)(6512007)(122000001)(31686004)(478600001)(921005)(54906003)(38100700002)(110136005)(91956017)(66476007)(66556008)(66946007)(76116006)(66446008)(64756008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(38070700005)(7406005)(7416002)(44832011)(2906002)(83380400001)(86362001)(31696002)(29513003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d3M5ZWxmNHBMcFpuemF0V1gwQ2w2V1VQYW1WSExxRzMzV1d2UDMxVWk1Sndj?=
 =?utf-8?B?MjdTRUNMR2NKNkhZRFhQNW9xUUxDUmRaOW9qWjE5NytsMVpYc0tyNXJMNVVo?=
 =?utf-8?B?eXI3bSs0aXpHUExGRUxlV0tVYjFkTEkrVEs3UGswVGN0OFZxSTJiazF0Zmkz?=
 =?utf-8?B?OXh0ZllobkFIQi9GVmlFbmZxa0ZBM0YzMm4rREV2Q3AwTWg5Zm9QVU9FZ2t1?=
 =?utf-8?B?aWxMamR0U05EUE41eEs4UG9HOXFWWUJDc2tLVUhPU3B3cnBleUZyTUNiYnlZ?=
 =?utf-8?B?bkJ4Ky9FR3dLMXNZSkdLSjhiK1RRd093T1AvQkxMTFg0eVlIWGE2MGpidW5n?=
 =?utf-8?B?V0MvTDAvU2FrVDRwckdOWENKOERxK1FhK25CcHc5dzhRQ1NVcG9oenpSOFFB?=
 =?utf-8?B?OURtWEVRM0VSSXVUbTRHZCtNRzd5K2ZySThZUnA4RTBoN09xaVBEOEsvSkE2?=
 =?utf-8?B?WVQ4MjlRbGtTa1ZuQ21zU0hYMXkvbGFMY1FUTFdZanZBZTdpZUw5bEJCOU9i?=
 =?utf-8?B?eFNEdmpDWDVpUGJyem5KZkJyaGRLek5mMDJ6aW82Z21ENCtzNlFsanMrV0F4?=
 =?utf-8?B?K21pZCs3ajFRZVBBcVpVSzNpWVF6c3BYUzBJbGZSVkYwQlIxMTNKeFYvTFph?=
 =?utf-8?B?eG5WWktHUmN3cUUrUU9sNGlxVFdlYXMzS01lOTBKRVRLK0YzU3FpelZEdFps?=
 =?utf-8?B?RlcxOWZPV2J6bDNIRU9kUllQUDlBTGtSMHc3ZDVjbTBmdTFiYTk3MWxEYUxz?=
 =?utf-8?B?ZlRoSlZSUXQ2bVI4VHNQUHBWa1FPejcrT3g1M1NpMkZsczVGemY0aVV6V3F0?=
 =?utf-8?B?a2FJZzRBQzlML2MwRkhCZmlaWkxWaGUvSU1kNnpJMGxOV0pDd3VZSDJUblNM?=
 =?utf-8?B?OHN0bVVBKzVabVZRVUhnclRITUpoQVFUYndQTEc4aCtzQTFpSzRCQURHTm9h?=
 =?utf-8?B?QUgrUHVrVnN1VlBGZHo5bEIzUWtYRm5CNk5kd1NoR1FuNnpYbkxOSXdlcGV1?=
 =?utf-8?B?NytHVzk4WjhzQXJCUFdpVitVMktWSFNtN205eVh3dFArZzBFaU5Cd01CUUdB?=
 =?utf-8?B?cGVTYmxZd2VlVmFGbk5lSitVaEl4cWQzR2xMUFBldWVyeS8rOUdyMGJZTnJw?=
 =?utf-8?B?dzJZL3ZkTXhUeUthWkJEaG5PMkowQzVlQUNScjUvUVFwNkt2SDhMUjJCV1ZV?=
 =?utf-8?B?b3Y4aGJ4UmFoVlV5QW9OOXVHYlVNMnZtYmNDaFgzdUhWTEs3WW1DK29aSndL?=
 =?utf-8?B?VXB4KzNDSWhwMXNzYi9xaWs0Mlh6YzlKazlUbHNNKzQ5TGxWcjJCdWNXTGhG?=
 =?utf-8?B?UVBrSWxDamNzYThadm8wMndhczRLQVRRRG9ZSk1PL0ZOWittMW5vVTRxZHp4?=
 =?utf-8?B?Z1VaWVVtMHFvOUJGejl1anZsalVSalozQjVwK0IrNFZaa1liUUVoV0NkaUNz?=
 =?utf-8?B?R096WlRlcEo0MklXcTczeWo4WkJSNTBsQ2x3cXAzQTJPdmkxOXFuTFVDcWFH?=
 =?utf-8?B?WVF5NnUxYjJnMW5ZSFcyVzcxUGw3c3U4cXB4Uk1TWXVnNlhtRjViMEM3OTR4?=
 =?utf-8?B?QUZVQ2xZd0pYSy9aeGtvZ0s5Um0rRUF4RFl0SXhMWll4R0VhY3VPNllzN3Fr?=
 =?utf-8?B?bVE0Q2FzZDh4aWhvYVFIR1N6QzVWdURuOFNSV2hkRm14N2R3RHhDRnBYc0JX?=
 =?utf-8?B?c2FVcXRLcGM0UlJnNkNyV1drQ0xHS1ZiTGtGYk55UFN1WDJac2l4U1BaQjhK?=
 =?utf-8?B?NzJhMTZiQWZ3VkRCY2dMR3lLalNNODVrQllpNTl4TzRjdHVxeWxrNldnRm5o?=
 =?utf-8?B?Q3ZzaUJKdkhWRm5aM2FJTEN2dERmS2RHSkNnd3FUNDVHTlVsS0s0d1lrbEts?=
 =?utf-8?B?a3VMUUp3aHEvQzhaOGxEdjBlWTA3aktuNmZvNjlUVEZrQm9tWHdwVUlOeG5S?=
 =?utf-8?B?U0FSb1N4N0VMZmpwUE1iZlhnWjFHK1FSOVZRNGZGSDBSMzJ1Q0VXbVJ0OEli?=
 =?utf-8?B?OW1LTmNEM0dJdHlFLzdzVUVsV3RkRnUzTlB0QkNWeVFLbE1QNW9mZ1ZWOUlG?=
 =?utf-8?B?ZjVVTG9oakVCQ0kvRWxveFRINEt3Wlp2TFhmS0dSS0ZtbGRSQ0xtTjErVlZD?=
 =?utf-8?Q?Hq7EAJswJbs5JHLqmD4s6yssJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5E0E8AF4B80654A8790A63139B4C724@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac92e60-8f5c-4ae8-aeee-08db97e64207
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:05:40.8765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2pmkMfNjSCs/qlTlGzOv4JNpNx1QJG4PbjdOwVySoq+B2YLe5lAIC3hygNyBRY811cPb9oSNAeZJ7KYIrX6ACJK5ArD9oZZA3gxk/zYH/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3279
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgbmV3bHkgaW50cm9kdWNlZCBxbWNfY2hhbl9zZXR1cF90c2EqIGZ1bmN0aW9ucyBjaGVjayB0
aGF0IHRoZQ0KPiBjaGFubmVsIGVudHJpZXMgYXJlIG5vdCBhbHJlYWR5IHVzZWQuDQo+IFRoZXNl
IGNoZWNrcyBhcmUgYWxzbyBwZXJmb3JtZWQgYnkgcW1jX2NoZWNrX2NoYW5zKCkgYW5kIGFyZSBu
byBtb3JlDQo+IG5lZWRlZC4NCj4gDQo+IFJlbW92ZSB0aGVtIGZyb20gcW1jX2NoZWNrX2NoYW5z
KCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290
bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgfCAy
MCAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgYi9kcml2ZXJz
L3NvYy9mc2wvcWUvcW1jLmMNCj4gaW5kZXggYzU1NTJhMGI1YjE5Li4zMzc2MWMzOWFlZTEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysgYi9kcml2ZXJzL3Nv
Yy9mc2wvcWUvcW1jLmMNCj4gQEAgLTg4NCwxMCArODg0LDcgQEAgRVhQT1JUX1NZTUJPTChxbWNf
Y2hhbl9yZXNldCk7DQo+ICAgc3RhdGljIGludCBxbWNfY2hlY2tfY2hhbnMoc3RydWN0IHFtYyAq
cW1jKQ0KPiAgIHsNCj4gICAJc3RydWN0IHRzYV9zZXJpYWxfaW5mbyBpbmZvOw0KPiAtCWJvb2wg
aXNfb25lX3RhYmxlID0gZmFsc2U7DQo+ICAgCXN0cnVjdCBxbWNfY2hhbiAqY2hhbjsNCj4gLQl1
NjQgdHhfdHNfbWFzayA9IDA7DQo+IC0JdTY0IHJ4X3RzX21hc2sgPSAwOw0KPiAgIAl1NjQgdHhf
dHNfYXNzaWduZWRfbWFzazsNCj4gICAJdTY0IHJ4X3RzX2Fzc2lnbmVkX21hc2s7DQo+ICAgCWlu
dCByZXQ7DQo+IEBAIC05MTEsNyArOTA4LDYgQEAgc3RhdGljIGludCBxbWNfY2hlY2tfY2hhbnMo
c3RydWN0IHFtYyAqcW1jKQ0KPiAgIAkJCWRldl9lcnIocW1jLT5kZXYsICJOdW1iZXIgb2YgVFNB
IFR4L1J4IFRTIGFzc2lnbmVkIGFyZSBub3QgZXF1YWxcbiIpOw0KPiAgIAkJCXJldHVybiAtRUlO
VkFMOw0KPiAgIAkJfQ0KPiAtCQlpc19vbmVfdGFibGUgPSB0cnVlOw0KPiAgIAl9DQo+ICAgDQo+
ICAgCXR4X3RzX2Fzc2lnbmVkX21hc2sgPSBpbmZvLm5iX3R4X3RzID09IDY0ID8gVTY0X01BWCA6
ICgoKHU2NCkxKSA8PCBpbmZvLm5iX3R4X3RzKSAtIDE7DQo+IEBAIC05MjIsMjcgKzkxOCwxMSBA
QCBzdGF0aWMgaW50IHFtY19jaGVja19jaGFucyhzdHJ1Y3QgcW1jICpxbWMpDQo+ICAgCQkJZGV2
X2VycihxbWMtPmRldiwgImNoYW4gJXUgdXNlcyBUU0EgdW5hc3NpZ25lZCBUeCBUU1xuIiwgY2hh
bi0+aWQpOw0KPiAgIAkJCXJldHVybiAtRUlOVkFMOw0KPiAgIAkJfQ0KPiAtCQlpZiAodHhfdHNf
bWFzayAmIGNoYW4tPnR4X3RzX21hc2spIHsNCj4gLQkJCWRldl9lcnIocW1jLT5kZXYsICJjaGFu
ICV1IHVzZXMgYW4gYWxyZWFkeSB1c2VkIFR4IFRTXG4iLCBjaGFuLT5pZCk7DQo+IC0JCQlyZXR1
cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAgIA0KPiAgIAkJaWYgKGNoYW4tPnJ4X3RzX21hc2sgPiBy
eF90c19hc3NpZ25lZF9tYXNrKSB7DQo+ICAgCQkJZGV2X2VycihxbWMtPmRldiwgImNoYW4gJXUg
dXNlcyBUU0EgdW5hc3NpZ25lZCBSeCBUU1xuIiwgY2hhbi0+aWQpOw0KPiAgIAkJCXJldHVybiAt
RUlOVkFMOw0KPiAgIAkJfQ0KPiAtCQlpZiAocnhfdHNfbWFzayAmIGNoYW4tPnJ4X3RzX21hc2sp
IHsNCj4gLQkJCWRldl9lcnIocW1jLT5kZXYsICJjaGFuICV1IHVzZXMgYW4gYWxyZWFkeSB1c2Vk
IFJ4IFRTXG4iLCBjaGFuLT5pZCk7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAt
DQo+IC0JCWlmIChpc19vbmVfdGFibGUgJiYgKGNoYW4tPnR4X3RzX21hc2sgIT0gY2hhbi0+cnhf
dHNfbWFzaykpIHsNCj4gLQkJCWRldl9lcnIocW1jLT5kZXYsICJjaGFuICV1IHVzZXMgZGlmZmVy
ZW50IFJ4IGFuZCBUeCBUU1xuIiwgY2hhbi0+aWQpOw0KPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+
IC0JCX0NCj4gLQ0KPiAtCQl0eF90c19tYXNrIHw9IGNoYW4tPnR4X3RzX21hc2s7DQo+IC0JCXJ4
X3RzX21hc2sgfD0gY2hhbi0+cnhfdHNfbWFzazsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR1cm4g
MDsNCg==
