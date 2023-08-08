Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE107738B5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:44:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VaQe5sj4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlZc0kKtz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 17:44:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VaQe5sj4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::627; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlWq52l4z3cK4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 17:42:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUS3wOD5FzBQ/qSWPwBRzDsEvjYtGbclk9MScmWi+LCSlQBu7yKb8uhnW94ggKa+ZPevWlNH8xnuc33Iu3i5/Z68qpoOKDeJgQCq4PK8bwZN/dtmVUeGS84xFNbWEQYzSRYDy6e+lEBhyAb47G+E38/BQ11GhDUC7CfUnz1a71wnbnit0vb1KR8oewb2IW8mM/ngzs76syI7nc2CBr9wrTgZP8HXdc4EQL8V7tDhqBctO0tC2gu6y83mUuWOhFjs9phLBHHkQhPZ8e/I81FBZuAl+qBzQtYketwfTxzadSgRAINr3pYoeolmuzUT20vRO1RN4u7hfPqB2EO7bX/+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZWAjTScZSVBgTmZR5UdZ7ioT/Sor/5gT2XcnXH9okQ=;
 b=La9f8rVV744h8+BsZsBF9veOIFazbDbU65+TBC1FSI49EcImh0WXsqglHRvpMeLYs8g98O2YZ4DJIQ/vkIggsZZJO4fzCnj0L1gXo98a0ltTCRynL1n/LHcJGFV6TYLjtJB3WIwIL6N8nHRSyAbiH1WtdL3f99BLT1cngmqyEzz7ZzsoGj9U0ad65Xiof12Z7nd5GuALvA3yM/NIiwCAMXKEtT7d+aY8T91qm1dJOrdFZvS0+Za55zOn8OjTPl9DKN3FhXkwZSLy+dj0WJ/MlJcfp0to5lY/nuYuVt2qNflB5zkxVhlRuMEC2TTxbM7+XvjwilKHHc1xS0F4IfmaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZWAjTScZSVBgTmZR5UdZ7ioT/Sor/5gT2XcnXH9okQ=;
 b=VaQe5sj4I7taHfjdDakg/F18TF6/xNBk80BU9my0tUt3EesO7JE80RuVUEl0VLjsDm2hM/NMpuQQL6ePaKsGdBTfbN0NFcPjj6+XweSh8PBHcF4wmpWlfWt+p+O1HVTwlHGPvpC0/lW4H0YvzOjMIehc7Z39Ei3WJbM/KtCxhX3W5VKFu4Bu8G61l+YuN6db2L6Q1wDvu0r9/fYSQr2xnAfhxNjGtnR4ezsVD5y/qXyyLgkgzfNZAKvgq3IhcO1F8hv7IkVt0U78qk/+auooOeYYMI7OQBp3pgE47fCcmRetn1YA7RCYWys9PmoCmzGE5BWe+gu5mzwW751OO4YoMQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:41:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 07:41:56 +0000
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
Subject: Re: [PATCH v2 04/28] soc: fsl: cpm1: qmc: Extend the API to provide
 Rx status
Thread-Topic: [PATCH v2 04/28] soc: fsl: cpm1: qmc: Extend the API to provide
 Rx status
Thread-Index: AQHZv9I/DOLet6AMkkOUBhyGyaya96/gF/gA
Date: Tue, 8 Aug 2023 07:41:56 +0000
Message-ID: <bb8337b2-807e-9cc3-6835-1bcb7e7eca58@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-5-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-5-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2884:EE_
x-ms-office365-filtering-correlation-id: 30216af0-aecb-43e6-5c9e-08db97e2f13f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q9TbcsUYucWBVRAv2KSacY08Or44FWKd3ND6Saj/nJCB9b19aMaJBhxSi6yqRamPWKTTyNZs2iOuHUn88DTeZxhlZHqcJt7qAPGHYp8Op9fsVP0p9uVhQG92A9dTkWMGWYO1fYHK0AkFaU3SH3Wav/wQn4pfFJEiThWWlMHU193toBMQIbG/GEs4aZEPHzRKbpC9UgA7sH7AiY5GjAtH1SYdpnONKTCCL4nvJZGuamJvu0E9q82HOr95gKXcgpdl5fXjG8SP+6LGQ7xFTAIvy7fflYX/obg9uBaIPc8dUoN/jyLT6StgQ7jQ43UlB6RnMm9Ayozue0026QgApF7EPCk1AaRFJbo7NdJeTfAdPMnJll0p9ugKNvFWeLZ0pfNrM+tuumhy+e4wtEVwEsJSWuPL8vKT6xYXKXe0Gm7ulBGLdgJqD3aZun/7GXCBd7BukBEy7S/8axW4FVDpvwdX0Ply2sW1tuGfBcmpoMTVafrfUxRw05l7uQ3oty0/8kvnYwRWfrq6lubPUPAKeQDO9i0izwd4QyRgpNsKyQUZoNN7EB693fmWL43Wf1gLkCtYfOBpxJdcFim/eEokSxbi1gvik0yBD1A2VEjo3WVQo10x7puat4yG8P+esdqJqyEtHsd/V8EKJFxZdcPv62Q1Av41q/ey1qarOrW/g1I6CQjHELN/zM7qcW7tNTKfvVNCgd0eGtBb5QmssoP12dIr6DI63dZJ+9V5kXMAu0IPjwT48kA3DwuGQADUYlaKvZWFEqVgRd8hB9Uy5SUKIUI/bg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199021)(90011799007)(1800799003)(90021799007)(186006)(41300700001)(38100700002)(6512007)(122000001)(6486002)(71200400001)(921005)(83380400001)(66574015)(86362001)(6506007)(26005)(2616005)(316002)(54906003)(110136005)(38070700005)(478600001)(2906002)(66446008)(66476007)(4326008)(91956017)(64756008)(76116006)(66946007)(36756003)(66556008)(7406005)(7416002)(31686004)(8676002)(8936002)(31696002)(5660300002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MXlLZm0wRXR4aW9hdWJqaWY4YTRMMW9iUDlKcGJMRDRuVGFuZDRqL0drZ1hW?=
 =?utf-8?B?bkZHMUprUzZhbkw3V3QvenNZcUlIemlQcGo3U3R5NmRTWHp5VnlKWUZnMTFu?=
 =?utf-8?B?S1FLZWtkODU0NFRFRElIRzRIK1JJRVRUcS9wa2JOMkpiblNZeFVBcEtaUExF?=
 =?utf-8?B?eEVDdWpzZ1RBdVVWeVdLUlByVVQyQWJpaTZ2VVJnT3U4Qk1WVEMwVWtTVllY?=
 =?utf-8?B?cEE0YUFIbnVPUmVINWhGQnQ0UDgzMERJbDNwVjIwbDV0TDBRajZjZCtwREVL?=
 =?utf-8?B?amNPcnlMMmt6TFQzZmFwMTEyNHVPUGF5MS92ek5lbUNEOFlLQjk1dGRqWWky?=
 =?utf-8?B?VXVnUStwcFBwM0ZlTkRxbmlUOGxOa1pPTHlRK1p6ak1peGF5aFNRUmJXamFn?=
 =?utf-8?B?TUJGU0pPT3RGTnFkWmNyWTN1WmxoSEx0MkxHekc1amJpeSsyWEpwenpKQlBV?=
 =?utf-8?B?RExxRnRqYW11R3JQR1ZLbnBvVVcram9yZkFHQnRYNkZPeERtamR5NDkwRXM2?=
 =?utf-8?B?NjY4U0E4UlJnQ0NWYWN6QVBYQW5JbVQwNWRQY3FkczdxRjZZZHE0SDNhbi96?=
 =?utf-8?B?QnE4MzVxQkZ3cEIzcU9sK0p0VkJBRU55c0hsSkxTM002eEk1LzFOM0JOKzFq?=
 =?utf-8?B?ck5nWWxXRlV1Wk1kMktkVVdQaVBKY1F3V29FTm5zTjcxa0pQQkhnZThLQWhx?=
 =?utf-8?B?UkNWalArbHNXR1VnUFBNdlYyTE5ic1h1Zy9JRmVqSjBvMzcwN1cyLy9YS2pm?=
 =?utf-8?B?UkJhbWw3V3RQeGJTelRhNFI0YWpySko5VzFmOHVKcmxPcTBoL1VncHRVUlI0?=
 =?utf-8?B?YnREOXVKMHZxeHlCTWtTcXJvZk5Wck9SZWNBOFV6UWR3NWV0Mk9hSmRFeGRC?=
 =?utf-8?B?MU1HZVFYL2N5TFFLTWhLM1E2QUNWbVpYYkxsb3ZMcGJ4ZnNqbDNsajRCZkZQ?=
 =?utf-8?B?cFdaRFppK3NqeGtjQkNQMjJ2bWR3ZWlWV09weUZKamVBK1ZhYnVYblJBQ3Rx?=
 =?utf-8?B?RjZhZnV2aE16M2pZWmlGc3kwcHdxam1zUEhqaThLRHg1Uzk2SEoyM1RBTGRQ?=
 =?utf-8?B?N2E2ejlUR3ZMTWppek1mSHNyN1IzWktSUEYxM1ZDSkl1MkdPQnIwTi9wdzNE?=
 =?utf-8?B?RklycFkyRldHSXhNWFpEcmFyZU9sR2k5dmV3ZmVLNElnMWlQdWFTVkNYZ1Jn?=
 =?utf-8?B?akIzQkdDSDlWa0pvQjFKTkM5NExTazVaMktJd0lrc3lWQUU5Qkw0MWFFb3VJ?=
 =?utf-8?B?UjBGcnlaNW1IaDF6TjFNd0kyTHM3R2l3QVRhZVg3Vy85TlFpSkFOWDFjd3pD?=
 =?utf-8?B?RGFHV0ltbEgvSEVBai9ZOWpXMFJZWm8rZkEzc3Fia3QzZFZkTzloMTlZRHdY?=
 =?utf-8?B?T2ptU3FxQlBwWHVsRlRzU0tJdmNXMUhMM0dUd0V3cFQ0ZEVYaW9OeHJ2VVpS?=
 =?utf-8?B?RXJBZlU1M0xJeUxyWWxXS1FvTHZNNWNuN1lLeWpRVk4rTTlla3o1dzRuaVZT?=
 =?utf-8?B?c3Y2M2FHbkNxakdmS2pjMmFsNE5FVUpKTytLNWR4eVU5NkxObjFISGRMM0V2?=
 =?utf-8?B?MzE2TG95TjJpQUVXcGhUVW9NOFFEMXFidFRyUENZcDJ1MXVQclhxTDA0RTNv?=
 =?utf-8?B?RzFlaUxZTFNhNXZUS3VoNDdCbUFTSVVQSU9nOXpIa1I2VUNXd1lqMktVYWxj?=
 =?utf-8?B?bTRidStJSUwwSjZSdnJjZlhQdk1mbldVM1o5RWh0Um1pYXhJa0M1Q3VTMVJF?=
 =?utf-8?B?Q1VyeUlTb1lmb3ZRZGF3UjR3WFVUa2MzWk9xTFFMVm5lQkxkZnZzWHF1OFo0?=
 =?utf-8?B?SWI1NEdxT1FIWWlGWFdzZWpyNmhoSVh3S09FUEpac1RwMWpKL3FWa1VLZldh?=
 =?utf-8?B?Y3BZOWlKWGJseHRvbHBMTEtCelVSYTQ4YW9XbS80VE1ucmJ3RG1lR0huMlpm?=
 =?utf-8?B?Z1Y3TUN5QnpWeGtaNS9lRi9COWc2bUlMTXpUaFZYbWU2Tllxbmh4MWZiK0xW?=
 =?utf-8?B?WDVHdGRDK053b082S29MVWx1TmI2andYRUUycDlML3lyd0RvYzJIOFFROW9i?=
 =?utf-8?B?Sm9UeHMwaW0rY3pPUE1jWlY1YWd4YWYwZVB5ZWtlRHlTNlV1NXowVDBBYjl1?=
 =?utf-8?B?bGNEeEIxbTA0dXdtRE1NQ1VjdzlIYnRKSyszMENpSUhCeWtFOHhHZUhtd2NJ?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <558A7DEAABF35145ADD417E72FABC198@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30216af0-aecb-43e6-5c9e-08db97e2f13f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:41:56.8796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rm93L29tsNdPhrZqRkfWeHQZywp2kFLbkqqetkF+/h41QHAoKBjsoZY4HxWsJTKw0MOcpnpTU4tUY5Md68xoPS2wgnQPk1vR5gZHnich/uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2884
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
biBIRExDIG1vZGUsIHNvbWUgc3RhdHVzIGZsYWdzIHJlbGF0ZWQgdG8gdGhlIGRhdGEgcmVhZCB0
cmFuc2ZlciBjYW4gYmUNCj4gc2V0IGJ5IHRoZSBoYXJkd2FyZSBhbmQgbmVlZCB0byBiZSBrbm93
biBieSBhIFFNQyBjb25zdW1lciBmb3IgZnVydGhlcg0KPiBhbmFseXNpcy4NCj4gDQo+IEV4dGVu
ZCB0aGUgQVBJIGluIG9yZGVyIHRvIHByb3ZpZGUgdGhlc2UgdHJhbnNmZXIgc3RhdHVzIGZsYWdz
IGF0IHRoZQ0KPiByZWFkIGNvbXBsZXRlKCkgY2FsbC4NCj4gDQo+IEluIFRSQU5TUEFSRU5UIG1v
ZGUsIHRoZXNlIGZsYWdzIGhhdmUgbm8gbWVhbmluZy4gS2VlcCBvbmx5IG9uZSByZWFkDQo+IGNv
bXBsZXRlKCkgQVBJIGFuZCB1cGRhdGUgdGhlIGNvbnN1bWVycyB3b3JraW5nIGluIHRyYW5zcGFy
ZW50IG1vZGUuDQo+IEluIHRoaXMgY2FzZSwgdGhlIG5ld2x5IGludHJvZHVjZWQgZmxhZ3MgcGFy
YW1ldGVyIGlzIHNpbXBseSB1bnVzZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2Rp
bmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBkcml2ZXJz
L3NvYy9mc2wvcWUvcW1jLmMgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0t
DQo+ICAgaW5jbHVkZS9zb2MvZnNsL3FlL3FtYy5oICAgICAgfCAxNSArKysrKysrKysrKysrKy0N
Cj4gICBzb3VuZC9zb2MvZnNsL2ZzbF9xbWNfYXVkaW8uYyB8ICAyICstDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0K
PiBpbmRleCA4ZGM3M2NjMWE4M2IuLjJkMmE5ZDg4YmE2YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9zb2MvZnNsL3FlL3FtYy5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBA
QCAtMTY2LDcgKzE2Niw3IEBADQo+ICAgc3RydWN0IHFtY194ZmVyX2Rlc2Mgew0KPiAgIAl1bmlv
biB7DQo+ICAgCQl2b2lkICgqdHhfY29tcGxldGUpKHZvaWQgKmNvbnRleHQpOw0KPiAtCQl2b2lk
ICgqcnhfY29tcGxldGUpKHZvaWQgKmNvbnRleHQsIHNpemVfdCBsZW5ndGgpOw0KPiArCQl2b2lk
ICgqcnhfY29tcGxldGUpKHZvaWQgKmNvbnRleHQsIHNpemVfdCBsZW5ndGgsIHVuc2lnbmVkIGlu
dCBmbGFncyk7DQo+ICAgCX07DQo+ICAgCXZvaWQgKmNvbnRleHQ7DQo+ICAgfTsNCj4gQEAgLTQy
MSw3ICs0MjEsOCBAQCBzdGF0aWMgdm9pZCBxbWNfY2hhbl93cml0ZV9kb25lKHN0cnVjdCBxbWNf
Y2hhbiAqY2hhbikNCj4gICB9DQo+ICAgDQo+ICAgaW50IHFtY19jaGFuX3JlYWRfc3VibWl0KHN0
cnVjdCBxbWNfY2hhbiAqY2hhbiwgZG1hX2FkZHJfdCBhZGRyLCBzaXplX3QgbGVuZ3RoLA0KPiAt
CQkJIHZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4dCwgc2l6ZV90IGxlbmd0aCksIHZvaWQg
KmNvbnRleHQpDQo+ICsJCQkgdm9pZCAoKmNvbXBsZXRlKSh2b2lkICpjb250ZXh0LCBzaXplX3Qg
bGVuZ3RoLCB1bnNpZ25lZCBpbnQgZmxhZ3MpLA0KPiArCQkJIHZvaWQgKmNvbnRleHQpDQo+ICAg
ew0KPiAgIAlzdHJ1Y3QgcW1jX3hmZXJfZGVzYyAqeGZlcl9kZXNjOw0KPiAgIAl1bnNpZ25lZCBs
b25nIGZsYWdzOw0KPiBAQCAtNDU0LDYgKzQ1NSwxMCBAQCBpbnQgcW1jX2NoYW5fcmVhZF9zdWJt
aXQoc3RydWN0IHFtY19jaGFuICpjaGFuLCBkbWFfYWRkcl90IGFkZHIsIHNpemVfdCBsZW5ndGgs
DQo+ICAgCXhmZXJfZGVzYy0+cnhfY29tcGxldGUgPSBjb21wbGV0ZTsNCj4gICAJeGZlcl9kZXNj
LT5jb250ZXh0ID0gY29udGV4dDsNCj4gICANCj4gKwkvKiBDbGVhciBwcmV2aW91cyBzdGF0dXMg
ZmxhZ3MgKi8NCj4gKwljdHJsICY9IH4oUU1DX0JEX1JYX0wgfCBRTUNfQkRfUlhfRiB8IFFNQ19C
RF9SWF9MRyB8IFFNQ19CRF9SWF9OTyB8DQo+ICsJCSAgUU1DX0JEX1JYX0FCIHwgUU1DX0JEX1JY
X0NSKTsNCj4gKw0KPiAgIAkvKiBBY3RpdmF0ZSB0aGUgZGVzY3JpcHRvciAqLw0KPiAgIAljdHJs
IHw9IChRTUNfQkRfUlhfRSB8IFFNQ19CRF9SWF9VQik7DQo+ICAgCXdtYigpOyAvKiBCZSBzdXJl
IHRvIGZsdXNoIGRhdGEgYmVmb3JlIGRlc2NyaXB0b3IgYWN0aXZhdGlvbiAqLw0KPiBAQCAtNDg1
LDcgKzQ5MCw3IEBAIEVYUE9SVF9TWU1CT0wocW1jX2NoYW5fcmVhZF9zdWJtaXQpOw0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIHFtY19jaGFuX3JlYWRfZG9uZShzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4p
DQo+ICAgew0KPiAtCXZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4dCwgc2l6ZV90IHNpemUp
Ow0KPiArCXZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4dCwgc2l6ZV90IHNpemUsIHVuc2ln
bmVkIGludCBmbGFncyk7DQo+ICAgCXN0cnVjdCBxbWNfeGZlcl9kZXNjICp4ZmVyX2Rlc2M7DQo+
ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCWNiZF90IF9faW9tZW0gKmJkOw0KPiBAQCAt
NTI3LDcgKzUzMiwyMyBAQCBzdGF0aWMgdm9pZCBxbWNfY2hhbl9yZWFkX2RvbmUoc3RydWN0IHFt
Y19jaGFuICpjaGFuKQ0KPiAgIA0KPiAgIAkJaWYgKGNvbXBsZXRlKSB7DQo+ICAgCQkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+cnhfbG9jaywgZmxhZ3MpOw0KPiAtCQkJY29tcGxldGUo
Y29udGV4dCwgZGF0YWxlbik7DQo+ICsNCj4gKwkJCS8qDQo+ICsJCQkgKiBBdm9pZCBjb252ZXJz
aW9uIGJldHdlZW4gaW50ZXJuYWwgaGFyZHdhcmUgZmxhZ3MgYW5kDQo+ICsJCQkgKiB0aGUgc29m
dHdhcmUgQVBJIGZsYWdzLg0KPiArCQkJICogLT4gQmUgc3VyZSB0aGF0IHRoZSBzb2Z0d2FyZSBB
UEkgZmxhZ3MgYXJlIGNvbnNpc3RlbnQNCj4gKwkJCSAqICAgIHdpdGggdGhlIGhhcmR3YXJlIGZs
YWdzDQo+ICsJCQkgKi8NCj4gKwkJCUJVSUxEX0JVR19PTihRTUNfUlhfRkxBR19IRExDX0xBU1Qg
ICE9IFFNQ19CRF9SWF9MKTsNCj4gKwkJCUJVSUxEX0JVR19PTihRTUNfUlhfRkxBR19IRExDX0ZJ
UlNUICE9IFFNQ19CRF9SWF9GKTsNCj4gKwkJCUJVSUxEX0JVR19PTihRTUNfUlhfRkxBR19IRExD
X09WRiAgICE9IFFNQ19CRF9SWF9MRyk7DQo+ICsJCQlCVUlMRF9CVUdfT04oUU1DX1JYX0ZMQUdf
SERMQ19VTkEgICAhPSBRTUNfQkRfUlhfTk8pOw0KPiArCQkJQlVJTERfQlVHX09OKFFNQ19SWF9G
TEFHX0hETENfQUJPUlQgIT0gUU1DX0JEX1JYX0FCKTsNCj4gKwkJCUJVSUxEX0JVR19PTihRTUNf
UlhfRkxBR19IRExDX0NSQyAgICE9IFFNQ19CRF9SWF9DUik7DQo+ICsNCj4gKwkJCWNvbXBsZXRl
KGNvbnRleHQsIGRhdGFsZW4sDQo+ICsJCQkJIGN0cmwgJiAoUU1DX0JEX1JYX0wgfCBRTUNfQkRf
UlhfRiB8IFFNQ19CRF9SWF9MRyB8DQo+ICsJCQkJCSBRTUNfQkRfUlhfTk8gfCBRTUNfQkRfUlhf
QUIgfCBRTUNfQkRfUlhfQ1IpKTsNCj4gICAJCQlzcGluX2xvY2tfaXJxc2F2ZSgmY2hhbi0+cnhf
bG9jaywgZmxhZ3MpOw0KPiAgIAkJfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb2Mv
ZnNsL3FlL3FtYy5oIGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FtYy5oDQo+IGluZGV4IDNjNjFhNTBk
MmFlMi4uNmYxZDZjZWJjOWZlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3NvYy9mc2wvcWUvcW1j
LmgNCj4gKysrIGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FtYy5oDQo+IEBAIC05LDYgKzksNyBAQA0K
PiAgICNpZm5kZWYgX19TT0NfRlNMX1FNQ19IX18NCj4gICAjZGVmaW5lIF9fU09DX0ZTTF9RTUNf
SF9fDQo+ICAgDQo+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPg0KPiAgIA0KPiAgIHN0cnVjdCBkZXZpY2Vfbm9kZTsNCj4gQEAgLTU2LDggKzU3
LDIwIEBAIGludCBxbWNfY2hhbl9zZXRfcGFyYW0oc3RydWN0IHFtY19jaGFuICpjaGFuLCBjb25z
dCBzdHJ1Y3QgcW1jX2NoYW5fcGFyYW0gKnBhcmFtDQo+ICAgaW50IHFtY19jaGFuX3dyaXRlX3N1
Ym1pdChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGRtYV9hZGRyX3QgYWRkciwgc2l6ZV90IGxlbmd0
aCwNCj4gICAJCQkgIHZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4dCksIHZvaWQgKmNvbnRl
eHQpOw0KPiAgIA0KPiArLyogRmxhZ3MgYXZhaWxhYmxlIChPUmVkKSBmb3IgcmVhZCBjb21wbGV0
ZSgpIGZsYWdzIHBhcmFtZXRlciBpbiBIRExDIG1vZGUuDQo+ICsgKiBObyBmbGFncyBhcmUgYXZh
aWxhYmxlIGluIHRyYW5zcGFyZW50IG1vZGUgYW5kIHRoZSByZWFkIGNvbXBsZXRlKCkgZmxhZ3MN
Cj4gKyAqIHBhcmFtZXRlciBoYXMgbm8gbWVhbmluZyBpbiB0cmFuc3BhcmVudCBtb2RlLg0KPiAr
ICovDQo+ICsjZGVmaW5lIFFNQ19SWF9GTEFHX0hETENfTEFTVAlCSVQoMTEpIC8qIExhc3QgaW4g
ZnJhbWUgKi8NCj4gKyNkZWZpbmUgUU1DX1JYX0ZMQUdfSERMQ19GSVJTVAlCSVQoMTApIC8qIEZp
cnN0IGluIGZyYW1lICovDQo+ICsjZGVmaW5lIFFNQ19SWF9GTEFHX0hETENfT1ZGCUJJVCg1KSAg
LyogRGF0YSBvdmVyZmxvdyAqLw0KPiArI2RlZmluZSBRTUNfUlhfRkxBR19IRExDX1VOQQlCSVQo
NCkgIC8qIFVuYWxpZ25lZCAoaWUuIGJpdHMgcmVjZWl2ZWQgbm90IG11bHRpcGxlIG9mIDgpICov
DQo+ICsjZGVmaW5lIFFNQ19SWF9GTEFHX0hETENfQUJPUlQJQklUKDMpICAvKiBSZWNlaXZlZCBh
biBhYm9ydCBzZXF1ZW5jZSAoc2V2ZW4gY29uc2VjdXRpdmUgb25lcykgKi8NCj4gKyNkZWZpbmUg
UU1DX1JYX0ZMQUdfSERMQ19DUkMJQklUKDIpICAvKiBDUkMgZXJyb3IgKi8NCj4gKw0KPiAgIGlu
dCBxbWNfY2hhbl9yZWFkX3N1Ym1pdChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGRtYV9hZGRyX3Qg
YWRkciwgc2l6ZV90IGxlbmd0aCwNCj4gLQkJCSB2b2lkICgqY29tcGxldGUpKHZvaWQgKmNvbnRl
eHQsIHNpemVfdCBsZW5ndGgpLA0KPiArCQkJIHZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4
dCwgc2l6ZV90IGxlbmd0aCwNCj4gKwkJCQkJICB1bnNpZ25lZCBpbnQgZmxhZ3MpLA0KPiAgIAkJ
CSB2b2lkICpjb250ZXh0KTsNCj4gICANCj4gICAjZGVmaW5lIFFNQ19DSEFOX1JFQUQgICgxPDww
KQ0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ZzbC9mc2xfcW1jX2F1ZGlvLmMgYi9zb3VuZC9z
b2MvZnNsL2ZzbF9xbWNfYXVkaW8uYw0KPiBpbmRleCA3Y2JiOGU0NzU4Y2MuLjVkNzQ1YWFlMTdh
OCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfcW1jX2F1ZGlvLmMNCj4gKysrIGIv
c291bmQvc29jL2ZzbC9mc2xfcW1jX2F1ZGlvLmMNCj4gQEAgLTk5LDcgKzk5LDcgQEAgc3RhdGlj
IHZvaWQgcW1jX2F1ZGlvX3BjbV93cml0ZV9jb21wbGV0ZSh2b2lkICpjb250ZXh0KQ0KPiAgIAlz
bmRfcGNtX3BlcmlvZF9lbGFwc2VkKHBydGQtPnN1YnN0cmVhbSk7DQo+ICAgfQ0KPiAgIA0KPiAt
c3RhdGljIHZvaWQgcW1jX2F1ZGlvX3BjbV9yZWFkX2NvbXBsZXRlKHZvaWQgKmNvbnRleHQsIHNp
emVfdCBsZW5ndGgpDQo+ICtzdGF0aWMgdm9pZCBxbWNfYXVkaW9fcGNtX3JlYWRfY29tcGxldGUo
dm9pZCAqY29udGV4dCwgc2l6ZV90IGxlbmd0aCwgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiAgIHsN
Cj4gICAJc3RydWN0IHFtY19kYWlfcHJ0ZCAqcHJ0ZCA9IGNvbnRleHQ7DQo+ICAgCWludCByZXQ7
DQo=
