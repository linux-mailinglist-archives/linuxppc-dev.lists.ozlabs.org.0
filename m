Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3DB7738DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:07:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CWQtAmD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm552DNHz3cYG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:07:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CWQtAmD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm2f0V9Xz3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:05:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJWGbrRWm5uXTdD4uojmEWJOsECCLX0CsMEvWGFguP/k1k+K82+DZVl2N0PdKle68X8O1bpLDhTrjtrQRbfjQEazxMD7rWSVa7zpd3gZaFUjGITpBVjFBOubittTcx8iUUMh6zAw/qVgyMGXbWuEpUwOrH+pgvg66yMz8TT1neJmnsJ2S0Rm5m6OQCCQVHzm/TA/09HP5F9D3aMC1U1Rkbz9uP7kNsSHh/byLfX9dxys6kSgUIKk07YTxKYlpnkknuh66KkV6KaZ2670tZRymajuIZWgs3fiHHxwzjy9JCcNuCOESBAvuCBhWMKbJgajKWUgwwaCWXviQbkU4oUxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsZ4MXs8Q+nrDVMO3q7UDezzRGLerCrMpX4/7NsnSMI=;
 b=lT8KaI+RmA2FrtHC6x9pC4h7JCH9rmSk6q4QPUwuqe0H+9Q1dOeGw2y591pn9C3mKbK06Ea6VsEOptALQlyhhpJ3B4haYAIol9IJdvviPvADY+eSV2Gu6dWacy0w5dHhhVGDCHSHbEQ+3z1lxgq4OuBro9rl1k1iVT5o/Z45wP7sBAyTbirHHEzE3Y9EEYQlDZzA8UeXI/nxdul1aKVwBKRwzvkE7FP3zzeHCjpZOERA8Yk36NrPKgJ7UCI2pH1N6dt/tAn16QJ4CK1NWKkrvmhmhUCcVDvwEQQzeSBl8qVaFMnNMs1LbpDoihFhNstqWhi099aNpIFjfAOhxVpGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsZ4MXs8Q+nrDVMO3q7UDezzRGLerCrMpX4/7NsnSMI=;
 b=CWQtAmD4U61K7YolfH8KOrv4bDsBW63mxUBlBYcX5SazaQo1MOeuIBNn5NrP/4KkpRB1VN4fjZETW4WvzqTs9vUoReyqvqJLrf/K7YUe0qbdknxjUv1NCLMaiwxOg9IEnWWZXTLNwOgQL3ZAsy1EJ54TNvYTuJ1zhdB/Jl+Mnh81rmDrma2xEDC+eYIhVRSXcdEWNcheVFUUSTax6rTl9d9uk4sC0KgD4q64ah6Z7Zf5eVV5q+oVV94ArdKY6j7AyDkajRbl4mcO5IilK1OY51jjzkL0we9YWBCN6ov8QeQNepzQ1iaygH5NzbGEea3q0EHSkjiLlBWFuDqFZl1N/A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:05:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:05:12 +0000
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
Subject: Re: [PATCH v2 10/28] soc: fsl: cpm1: qmc: Introduce
 qmc_chan_setup_tsa*
Thread-Topic: [PATCH v2 10/28] soc: fsl: cpm1: qmc: Introduce
 qmc_chan_setup_tsa*
Thread-Index: AQHZv9JOxazdSN6tI0CRZ2OhjoNcqa/gHngA
Date: Tue, 8 Aug 2023 08:05:12 +0000
Message-ID: <1189b56e-42b2-f510-54c9-657630a9b113@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-11-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-11-herve.codina@bootlin.com>
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
x-ms-office365-filtering-correlation-id: 3779cd14-04ce-4f18-e03f-08db97e63112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +DDTbArvESgj7EnT3Uq7SUYsfmWyETEEhK1Sd9W2zht7zfKxCP894atOFmFWDp5YArH7KPZo0wmtQM4uJ8kyLSND/5U1sutKM6HbLDbySQSUYDcWbzrb9LnijtkbiDv6F53RyqJtN9yGZnaVE78UEYcV1Z98vrCBHHQi9Ii4JuUtAwktS2uMaKaVvAYu4q06LnqzYRc6UBkmdHV7DI5kiCG7j4OPFMsWgxdK2uBCbtKloUD7uZaWP7s+/Y6sxZn7FRfTUQQ6fu9lJHBrvZyzoVEb25EEYr1debP7mFlXpsaodIPtFCkWmQRS8n1Z66Q0EVf9aaKvvvfQPhV3WNIHTuGRkLYknZiyODEybXgdbQCF/g5DaqWu4OzoyHvuQrXMhnuPHeLYhZNVRqMIP0+jfO9Nq0K41xrvzzMYusnnp7+aFcB5y8gIaTMK8vKmKmFTp2VOJG/kOXiuUPOnxQ5QNnWC2pwUVS2E3FK9v/Q6pbOJNdHGYdZ60LLNHnQNJeA/VipDMDK98qdASpPN3oMlAdrfCNKYG2f5N6gWYV3+ze0JiZSx8XkN5CU0uKRq86PSNkvKhoeD7ftlDpVqCTBR6OtnyVyeUNjYw3faIY9Ntmk/+hr7/bNFstis0k9Se1qprecofP8actClvZtPucJA44mPnMM6oBA1RyqsWfue3CdGizE5PFK+36/SxmBJwixIHJ8OPWIgHWyTMEgs9/CgmLBZRNHtzD34z5Jbx3Nv1hv0ANx2ZiCho7C20BOtfBd97PQSrL0Y4AEmvJXu1ttGAw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39850400004)(396003)(136003)(376002)(90011799007)(186006)(1800799003)(90021799007)(451199021)(2616005)(36756003)(6506007)(26005)(6486002)(71200400001)(6512007)(122000001)(31686004)(478600001)(921005)(54906003)(38100700002)(110136005)(91956017)(66476007)(66556008)(66946007)(76116006)(66446008)(64756008)(4326008)(316002)(41300700001)(66574015)(8936002)(8676002)(5660300002)(38070700005)(7406005)(7416002)(44832011)(2906002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SGJmcktSWVJrUG9hNWVQWXVCM0xFWGhkUlhxdXdNRE1ERmVrbjVUMVV0Zmpy?=
 =?utf-8?B?QjUweHp1WGlDV2hEYTdkVE9QdUlTNDZRMGk3OWgwSUVFSjVNOFhxMDZLWEpZ?=
 =?utf-8?B?Y1NIVmIya2JlRWJuZGd6dmlhTktvdjdNY2I4dGxOVENaNlhSSm5xRWh1aFRp?=
 =?utf-8?B?QmVnSWQ2Sk90L3ozcmM0eHppZWY4WjRXUGZsbTZFNjB2cURYeWpwbUxpMnlD?=
 =?utf-8?B?dklmdStJSXNaK2F4Vnp1OEx5VlpaczZZdmJ2L2JCbDRIVmoyR2dTZzZJUHpr?=
 =?utf-8?B?TW5aRzIyUUFzUFVtbnBFcUU4VkZvQVo1bnhJWkl6aEIreGNDR05oNW5XbDJW?=
 =?utf-8?B?MVV2RGFjZkpYRG15Zm9FQ1FKa0IybEpMMVhlZXRhM3dUOUNCY3BNUkloV0Y3?=
 =?utf-8?B?dm1oaTJ1T1NOQnQ4bkVHSHJYdFo3TktKeisrSU1qL0I1MGZIS2Jnek4zR3Rz?=
 =?utf-8?B?R0djQm9JQ3c2QkZGbTlrYy83cG9JUTdCQW1Nc25qb0p4U2NTNU5rQmZOMWdB?=
 =?utf-8?B?eTRESHVTbHZWdSt6MkRHb0I5anFzTFc2d1VaSTFzVktmQlRwMTVzcGR0azJx?=
 =?utf-8?B?dEFabHVaVk02blJhZUc4TGJ5ZmVmS1BDN25Sa01ndmhBeUNleUZCa09EWDlm?=
 =?utf-8?B?MzRzK05STjROTENZdms3NW52V2tIbUd1SmU1d3Z4c2ZJMVdsMElTbFcwdDZR?=
 =?utf-8?B?clVqT0cwQ3cvUy9Qejh5NlNCVk5ia0YxT3Jvc1ZLZ3lNaWlQdnZMREtPMGRZ?=
 =?utf-8?B?aXZmQXJCelM0NWx6UDI4YXNPdVBpZDJyUTVKZ1RPdlVtZEE4OHJIS21KTHkz?=
 =?utf-8?B?N1BEbUtDWEt1bzNybTBvTzBOajhqMzRlNlRzZjhpQWxTRS9LNE1jcThheFZL?=
 =?utf-8?B?cFNoUkVPengyL1RnbWFTQVlPNm5mcWYzK3BIYlFORXN2b2R5MDdTd2lXclgx?=
 =?utf-8?B?Z3d4aExLNHlnb1lVMTI4WDg3WnlpRTloWDVIRkI3U0x2enA3M2dzYXhrcE5B?=
 =?utf-8?B?K0Y5R2dFb29BRjBKZzZxQmhzUG5panFEbU1tb2lPWmJoMTNLaW9ZQzVoTGNw?=
 =?utf-8?B?MXV0QjViTC9Nek4vck5IUjZIVWZjWEJlOGpwQ0kxbGt5Q1p6VG5pcXJpbFRl?=
 =?utf-8?B?WEtwYWZjcEpkOUhIZy8vY210Z3J6WEJYcXkyY2UxZzlodmNHREpFYWw5VHRr?=
 =?utf-8?B?WGt5M1dySVFvejV2Y0NjYjJFNno4blE3Y0NKeENDSCtHTXNmM04ybFQrcWN1?=
 =?utf-8?B?dkFnNkorcFdnUmY1Z1dhSXZyeHRPMXNQL2JtQ3hhcm00MGs5NndFc1JneUlX?=
 =?utf-8?B?V1V5Ulc5UHNVcGM2VmxSMWJSTGVVZlBDNjNHS1JwclJTVHNYU25BVlYxSUxi?=
 =?utf-8?B?SmkzWCtsRmsySkdCeHdoYjhOeUpiQml0c0J5UWFIeWl2MWdFY0hibEI3SlNk?=
 =?utf-8?B?bUYrSm5nRnBSY3N1MTNDMUxIa1Ewc3V6b3A2TDhCRm5vSlJvRnFIc3Npc2E4?=
 =?utf-8?B?MXg0SVpjSjlDTC82d3lXUWlRMXhLV0cvWlNOaFpzRzY1dWUxQTJ1RGh5eFdY?=
 =?utf-8?B?d2VWSU5CeU9BOXRNWGVSQ09iZHJIVzY0RnpWWDkwYm1ud290cUc5MnZtVS9F?=
 =?utf-8?B?cG1tZlgzZDR3eklYQTdGeG9vaEhuczd2UmY0TUJSTFhNQVE5NmN0N1NwWW1N?=
 =?utf-8?B?am8vL1d5M1BRWHh1RlFPLzJUNDNoSFBobkxONWtGd2tRbGM1djdpdG5CVlpw?=
 =?utf-8?B?R29GbmVnK2VxZUh2SEpzWDliTURmbmk0c3ZnK1kvclVFelNXWkpzTFhibFFw?=
 =?utf-8?B?SEJTSElIOHRnMkRDOTd2L0RrWlZiR0hNRWpjdGRTUlB0QWZ3a2hNU1pBQzFM?=
 =?utf-8?B?azJwT0tEd0Q5Ui8zOC9XTElETUNmUitDSUdrVVI5YmlwWU13RU1TempnOU9G?=
 =?utf-8?B?K0hmZ2M3aUdRYXYwRzlEOHRBNkxlYVgxM3ZwaVdiZTBXL0doNExHT1dIYkhz?=
 =?utf-8?B?Wm1IWFlFMkx3bG1YbW1WcE5vU3RvLzRhSlVkMkFZM0QySlprUkQ3V0xCaVdt?=
 =?utf-8?B?YUhnL0JWQjhCS1hQMDVmaTlQR3RsWnduZWttQUpGODM2NmJwbWo4M0NPbVdJ?=
 =?utf-8?Q?CSW1BaU5IkMwBRP6z3GK6nC0O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA1470E1EBA84D49BB5DC46ECF3E16FF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3779cd14-04ce-4f18-e03f-08db97e63112
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:05:12.4243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syHcjaPsKWVdk1Xr4Gfq6A6Pd9bv3tZa5Ubby6z3f+ufq62PnfzTrBGY1os+EH820TDo5k6EZylQJvegRD+GH7yzla/QDkr+s8xcAEOxmOo=
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBJ
bnRyb2R1Y2UgdGhlIHFtY19jaGFuX3NldHVwX3RzYSogZnVuY3Rpb25zIHRvIHNldHVwIGVudHJp
ZXMgcmVsYXRlZA0KPiB0byB0aGUgZ2l2ZW4gY2hhbm5lbC4NCj4gVXNlIHRoZW0gZHVyaW5nIFFN
QyBjaGFubmVscyBzZXR1cC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVy
dmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29jL2Zz
bC9xZS9xbWMuYyB8IDE2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyBiL2RyaXZlcnMvc29j
L2ZzbC9xZS9xbWMuYw0KPiBpbmRleCA2NGExMWY1YzZmODUuLmM1NTUyYTBiNWIxOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2Zz
bC9xZS9xbWMuYw0KPiBAQCAtMjQwLDYgKzI0MCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcW1j
X2NscmJpdHMxNih2b2lkIF9faW9tZW0gKmFkZHIsIHUxNiBjbHIpDQo+ICAgCXFtY193cml0ZTE2
KGFkZHIsIHFtY19yZWFkMTYoYWRkcikgJiB+Y2xyKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW5saW5lIHZvaWQgcW1jX2NscnNldGJpdHMxNih2b2lkIF9faW9tZW0gKmFkZHIsIHUxNiBjbHIs
IHUxNiBzZXQpDQo+ICt7DQo+ICsJcW1jX3dyaXRlMTYoYWRkciwgKHFtY19yZWFkMTYoYWRkcikg
JiB+Y2xyKSB8IHNldCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgcW1jX3dy
aXRlMzIodm9pZCBfX2lvbWVtICphZGRyLCB1MzIgdmFsKQ0KPiAgIHsNCj4gICAJaW93cml0ZTMy
YmUodmFsLCBhZGRyKTsNCj4gQEAgLTU2Miw2ICs1NjcsMTIyIEBAIHN0YXRpYyB2b2lkIHFtY19j
aGFuX3JlYWRfZG9uZShzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmNoYW4tPnJ4X2xvY2ssIGZsYWdzKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW50IHFtY19jaGFuX3NldHVwX3RzYV82NHJ4dHgoc3RydWN0IHFtY19jaGFuICpjaGFuLCBjb25z
dCBzdHJ1Y3QgdHNhX3NlcmlhbF9pbmZvICppbmZvKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCBp
Ow0KPiArCXUxNiBjdXJyOw0KPiArCXUxNiB2YWw7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFVzZSBh
IGNvbW1vbiBUeC9SeCA2NCBlbnRyaWVzIHRhYmxlLg0KPiArCSAqIFR4IGFuZCBSeCByZWxhdGVk
IHN0dWZmcyBtdXN0IGJlIGlkZW50aWNhbA0KPiArCSAqLw0KPiArCWlmIChjaGFuLT50eF90c19t
YXNrICE9IGNoYW4tPnJ4X3RzX21hc2spIHsNCj4gKwkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwg
ImNoYW4gJXUgdXNlcyBkaWZmZXJlbnQgUnggYW5kIFR4IFRTXG4iLCBjaGFuLT5pZCk7DQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCXZhbCA9IFFNQ19UU0FfVkFMSUQgfCBR
TUNfVFNBX01BU0sgfCBRTUNfVFNBX0NIQU5ORUwoY2hhbi0+aWQpOw0KPiArDQo+ICsJLyogQ2hl
Y2sgZW50cmllcyBiYXNlZCBvbiBSeCBzdHVmZiovDQo+ICsJZm9yIChpID0gMDsgaSA8IGluZm8t
Pm5iX3J4X3RzOyBpKyspIHsNCj4gKwkJaWYgKCEoY2hhbi0+cnhfdHNfbWFzayAmICgoKHU2NCkx
KSA8PCBpKSkpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQljdXJyID0gcW1jX3JlYWQxNihj
aGFuLT5xbWMtPnNjY19wcmFtICsgUU1DX0dCTF9UU0FUUlggKyAoaSAqIDIpKTsNCj4gKwkJaWYg
KGN1cnIgJiBRTUNfVFNBX1ZBTElEICYmIChjdXJyICYgflFNQ19UU0FfV1JBUCkgIT0gdmFsKSB7
DQo+ICsJCQlkZXZfZXJyKGNoYW4tPnFtYy0+ZGV2LCAiY2hhbiAldSBUeFJ4IGVudHJ5ICVkIGFs
cmVhZHkgdXNlZFxuIiwNCj4gKwkJCQljaGFuLT5pZCwgaSk7DQo+ICsJCQlyZXR1cm4gLUVCVVNZ
Ow0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJLyogU2V0IGVudHJpZXMgYmFzZWQgb24gUnggc3R1
ZmYqLw0KPiArCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5uYl9yeF90czsgaSsrKSB7DQo+ICsJCWlm
ICghKGNoYW4tPnJ4X3RzX21hc2sgJiAoKCh1NjQpMSkgPDwgaSkpKQ0KPiArCQkJY29udGludWU7
DQo+ICsNCj4gKwkJcW1jX2NscnNldGJpdHMxNihjaGFuLT5xbWMtPnNjY19wcmFtICsgUU1DX0dC
TF9UU0FUUlggKyAoaSAqIDIpLA0KPiArCQkJCSB+UU1DX1RTQV9XUkFQLCB2YWwpOw0KPiArCX0N
Cj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IHFtY19jaGFuX3Nl
dHVwX3RzYV8zMnJ4XzMydHgoc3RydWN0IHFtY19jaGFuICpjaGFuLCBjb25zdCBzdHJ1Y3QgdHNh
X3NlcmlhbF9pbmZvICppbmZvKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCBpOw0KPiArCXUxNiBj
dXJyOw0KPiArCXUxNiB2YWw7DQo+ICsNCj4gKwkvKiBVc2UgYSBUeCAzMiBlbnRyaWVzIHRhYmxl
IGFuZCBhIFJ4IDMyIGVudHJpZXMgdGFibGUgKi8NCj4gKw0KPiArCXZhbCA9IFFNQ19UU0FfVkFM
SUQgfCBRTUNfVFNBX01BU0sgfCBRTUNfVFNBX0NIQU5ORUwoY2hhbi0+aWQpOw0KPiArDQo+ICsJ
LyogQ2hlY2sgZW50cmllcyBiYXNlZCBvbiBSeCBzdHVmZiAqLw0KPiArCWZvciAoaSA9IDA7IGkg
PCBpbmZvLT5uYl9yeF90czsgaSsrKSB7DQo+ICsJCWlmICghKGNoYW4tPnJ4X3RzX21hc2sgJiAo
KCh1NjQpMSkgPDwgaSkpKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJY3VyciA9IHFtY19y
ZWFkMTYoY2hhbi0+cW1jLT5zY2NfcHJhbSArIFFNQ19HQkxfVFNBVFJYICsgKGkgKiAyKSk7DQo+
ICsJCWlmIChjdXJyICYgUU1DX1RTQV9WQUxJRCAmJiAoY3VyciAmIH5RTUNfVFNBX1dSQVApICE9
IHZhbCkgew0KPiArCQkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwgImNoYW4gJXUgUnggZW50cnkg
JWQgYWxyZWFkeSB1c2VkXG4iLA0KPiArCQkJCWNoYW4tPmlkLCBpKTsNCj4gKwkJCXJldHVybiAt
RUJVU1k7DQo+ICsJCX0NCj4gKwl9DQo+ICsJLyogQ2hlY2sgZW50cmllcyBiYXNlZCBvbiBUeCBz
dHVmZiAqLw0KPiArCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5uYl90eF90czsgaSsrKSB7DQo+ICsJ
CWlmICghKGNoYW4tPnR4X3RzX21hc2sgJiAoKCh1NjQpMSkgPDwgaSkpKQ0KPiArCQkJY29udGlu
dWU7DQo+ICsNCj4gKwkJY3VyciA9IHFtY19yZWFkMTYoY2hhbi0+cW1jLT5zY2NfcHJhbSArIFFN
Q19HQkxfVFNBVFRYICsgKGkgKiAyKSk7DQo+ICsJCWlmIChjdXJyICYgUU1DX1RTQV9WQUxJRCAm
JiAoY3VyciAmIH5RTUNfVFNBX1dSQVApICE9IHZhbCkgew0KPiArCQkJZGV2X2VycihjaGFuLT5x
bWMtPmRldiwgImNoYW4gJXUgVHggZW50cnkgJWQgYWxyZWFkeSB1c2VkXG4iLA0KPiArCQkJCWNo
YW4tPmlkLCBpKTsNCj4gKwkJCXJldHVybiAtRUJVU1k7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4g
KwkvKiBTZXQgZW50cmllcyBiYXNlZCBvbiBSeCBzdHVmZiAqLw0KPiArCWZvciAoaSA9IDA7IGkg
PCBpbmZvLT5uYl9yeF90czsgaSsrKSB7DQo+ICsJCWlmICghKGNoYW4tPnJ4X3RzX21hc2sgJiAo
KCh1NjQpMSkgPDwgaSkpKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJcW1jX2NscnNldGJp
dHMxNihjaGFuLT5xbWMtPnNjY19wcmFtICsgUU1DX0dCTF9UU0FUUlggKyAoaSAqIDIpLA0KPiAr
CQkJCSB+UU1DX1RTQV9XUkFQLCB2YWwpOw0KPiArCX0NCj4gKwkvKiBTZXQgZW50cmllcyBiYXNl
ZCBvbiBUeCBzdHVmZiAqLw0KPiArCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5uYl90eF90czsgaSsr
KSB7DQo+ICsJCWlmICghKGNoYW4tPnR4X3RzX21hc2sgJiAoKCh1NjQpMSkgPDwgaSkpKQ0KPiAr
CQkJY29udGludWU7DQo+ICsNCj4gKwkJcW1jX2NscnNldGJpdHMxNihjaGFuLT5xbWMtPnNjY19w
cmFtICsgUU1DX0dCTF9UU0FUVFggKyAoaSAqIDIpLA0KPiArCQkJCSB+UU1DX1RTQV9XUkFQLCB2
YWwpOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50
IHFtY19jaGFuX3NldHVwX3RzYShzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICt7DQo+ICsJc3Ry
dWN0IHRzYV9zZXJpYWxfaW5mbyBpbmZvOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwkvKiBSZXRy
aWV2ZSBpbmZvIGZyb20gdGhlIFRTQSByZWxhdGVkIHNlcmlhbCAqLw0KPiArCXJldCA9IHRzYV9z
ZXJpYWxfZ2V0X2luZm8oY2hhbi0+cW1jLT50c2Ffc2VyaWFsLCAmaW5mbyk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCS8qDQo+ICsJICogU2V0dXAgb25lIGNvbW1v
biA2NCBlbnRyaWVzIHRhYmxlIG9yIHR3byAzMiBlbnRyaWVzIChvbmUgZm9yIFR4DQo+ICsJICog
YW5kIG9uZSBmb3IgVHgpIGFjY29yZGluZyB0byBhc3NpZ25lZCBUUyBudW1iZXJzLg0KPiArCSAq
Lw0KPiArCXJldHVybiAoKGluZm8ubmJfdHhfdHMgPiAzMikgfHwgKGluZm8ubmJfcnhfdHMgPiAz
MikpID8NCj4gKwkJcW1jX2NoYW5fc2V0dXBfdHNhXzY0cnh0eChjaGFuLCAmaW5mbykgOg0KPiAr
CQlxbWNfY2hhbl9zZXR1cF90c2FfMzJyeF8zMnR4KGNoYW4sICZpbmZvKTsNCj4gK30NCj4gKw0K
PiAgIHN0YXRpYyBpbnQgcW1jX2NoYW5fY29tbWFuZChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIHU4
IHFtY19vcGNvZGUpDQo+ICAgew0KPiAgIAlyZXR1cm4gY3BtX2NvbW1hbmQoY2hhbi0+aWQgPDwg
MiwgKHFtY19vcGNvZGUgPDwgNCkgfCAweDBFKTsNCj4gQEAgLTkyMSw3ICsxMDQyLDYgQEAgc3Rh
dGljIGludCBxbWNfb2ZfcGFyc2VfY2hhbnMoc3RydWN0IHFtYyAqcW1jLCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wKQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgcW1jX2luaXRfdHNhXzY0cnh0eChzdHJ1
Y3QgcW1jICpxbWMsIGNvbnN0IHN0cnVjdCB0c2Ffc2VyaWFsX2luZm8gKmluZm8pDQo+ICAgew0K
PiAtCXN0cnVjdCBxbWNfY2hhbiAqY2hhbjsNCj4gICAJdW5zaWduZWQgaW50IGk7DQo+ICAgCXUx
NiB2YWw7DQo+ICAgDQo+IEBAIC05MzUsMTggKzEwNTUsNiBAQCBzdGF0aWMgaW50IHFtY19pbml0
X3RzYV82NHJ4dHgoc3RydWN0IHFtYyAqcW1jLCBjb25zdCBzdHJ1Y3QgdHNhX3NlcmlhbF9pbmZv
ICppbg0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgNjQ7IGkrKykNCj4gICAJCXFtY193cml0ZTE2KHFt
Yy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RTQVRSWCArIChpICogMiksIDB4MDAwMCk7DQo+ICAgDQo+
IC0JLyogU2V0IGVudHJpZXMgYmFzZWQgb24gUnggc3R1ZmYqLw0KPiAtCWxpc3RfZm9yX2VhY2hf
ZW50cnkoY2hhbiwgJnFtYy0+Y2hhbl9oZWFkLCBsaXN0KSB7DQo+IC0JCWZvciAoaSA9IDA7IGkg
PCBpbmZvLT5uYl9yeF90czsgaSsrKSB7DQo+IC0JCQlpZiAoIShjaGFuLT5yeF90c19tYXNrICYg
KCgodTY0KTEpIDw8IGkpKSkNCj4gLQkJCQljb250aW51ZTsNCj4gLQ0KPiAtCQkJdmFsID0gUU1D
X1RTQV9WQUxJRCB8IFFNQ19UU0FfTUFTSyB8DQo+IC0JCQkgICAgICBRTUNfVFNBX0NIQU5ORUwo
Y2hhbi0+aWQpOw0KPiAtCQkJcW1jX3dyaXRlMTYocW1jLT5zY2NfcHJhbSArIFFNQ19HQkxfVFNB
VFJYICsgKGkgKiAyKSwgdmFsKTsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAgIAkvKiBTZXQgV3Jh
cCBiaXQgb24gbGFzdCBlbnRyeSAqLw0KPiAgIAlxbWNfc2V0Yml0czE2KHFtYy0+c2NjX3ByYW0g
KyBRTUNfR0JMX1RTQVRSWCArICgoaW5mby0+bmJfcnhfdHMgLSAxKSAqIDIpLA0KPiAgIAkJICAg
ICAgUU1DX1RTQV9XUkFQKTsNCj4gQEAgLTk2Myw3ICsxMDcxLDYgQEAgc3RhdGljIGludCBxbWNf
aW5pdF90c2FfNjRyeHR4KHN0cnVjdCBxbWMgKnFtYywgY29uc3Qgc3RydWN0IHRzYV9zZXJpYWxf
aW5mbyAqaW4NCj4gICANCj4gICBzdGF0aWMgaW50IHFtY19pbml0X3RzYV8zMnJ4XzMydHgoc3Ry
dWN0IHFtYyAqcW1jLCBjb25zdCBzdHJ1Y3QgdHNhX3NlcmlhbF9pbmZvICppbmZvKQ0KPiAgIHsN
Cj4gLQlzdHJ1Y3QgcW1jX2NoYW4gKmNoYW47DQo+ICAgCXVuc2lnbmVkIGludCBpOw0KPiAgIAl1
MTYgdmFsOw0KPiAgIA0KPiBAQCAtOTc4LDI4ICsxMDg1LDYgQEAgc3RhdGljIGludCBxbWNfaW5p
dF90c2FfMzJyeF8zMnR4KHN0cnVjdCBxbWMgKnFtYywgY29uc3Qgc3RydWN0IHRzYV9zZXJpYWxf
aW5mbw0KPiAgIAkJcW1jX3dyaXRlMTYocW1jLT5zY2NfcHJhbSArIFFNQ19HQkxfVFNBVFRYICsg
KGkgKiAyKSwgMHgwMDAwKTsNCj4gICAJfQ0KPiAgIA0KPiAtCS8qIFNldCBlbnRyaWVzIGJhc2Vk
IG9uIFJ4IGFuZCBUeCBzdHVmZiovDQo+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFuLCAmcW1j
LT5jaGFuX2hlYWQsIGxpc3QpIHsNCj4gLQkJLyogUnggcGFydCAqLw0KPiAtCQlmb3IgKGkgPSAw
OyBpIDwgaW5mby0+bmJfcnhfdHM7IGkrKykgew0KPiAtCQkJaWYgKCEoY2hhbi0+cnhfdHNfbWFz
ayAmICgoKHU2NCkxKSA8PCBpKSkpDQo+IC0JCQkJY29udGludWU7DQo+IC0NCj4gLQkJCXZhbCA9
IFFNQ19UU0FfVkFMSUQgfCBRTUNfVFNBX01BU0sgfA0KPiAtCQkJICAgICAgUU1DX1RTQV9DSEFO
TkVMKGNoYW4tPmlkKTsNCj4gLQkJCXFtY193cml0ZTE2KHFtYy0+c2NjX3ByYW0gKyBRTUNfR0JM
X1RTQVRSWCArIChpICogMiksIHZhbCk7DQo+IC0JCX0NCj4gLQkJLyogVHggcGFydCAqLw0KPiAt
CQlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bmJfdHhfdHM7IGkrKykgew0KPiAtCQkJaWYgKCEoY2hh
bi0+dHhfdHNfbWFzayAmICgoKHU2NCkxKSA8PCBpKSkpDQo+IC0JCQkJY29udGludWU7DQo+IC0N
Cj4gLQkJCXZhbCA9IFFNQ19UU0FfVkFMSUQgfCBRTUNfVFNBX01BU0sgfA0KPiAtCQkJICAgICAg
UU1DX1RTQV9DSEFOTkVMKGNoYW4tPmlkKTsNCj4gLQkJCXFtY193cml0ZTE2KHFtYy0+c2NjX3By
YW0gKyBRTUNfR0JMX1RTQVRUWCArIChpICogMiksIHZhbCk7DQo+IC0JCX0NCj4gLQl9DQo+IC0N
Cj4gICAJLyogU2V0IFdyYXAgYml0IG9uIGxhc3QgZW50cmllcyAqLw0KPiAgIAlxbWNfc2V0Yml0
czE2KHFtYy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RTQVRSWCArICgoaW5mby0+bmJfcnhfdHMgLSAx
KSAqIDIpLA0KPiAgIAkJICAgICAgUU1DX1RTQV9XUkFQKTsNCj4gQEAgLTEwODEsNiArMTE2Niwx
MCBAQCBzdGF0aWMgaW50IHFtY19zZXR1cF9jaGFuKHN0cnVjdCBxbWMgKnFtYywgc3RydWN0IHFt
Y19jaGFuICpjaGFuKQ0KPiAgIA0KPiAgIAljaGFuLT5xbWMgPSBxbWM7DQo+ICAgDQo+ICsJcmV0
ID0gcW1jX2NoYW5fc2V0dXBfdHNhKGNoYW4pOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBy
ZXQ7DQo+ICsNCj4gICAJLyogU2V0IGNoYW5uZWwgc3BlY2lmaWMgcGFyYW1ldGVyIGJhc2UgYWRk
cmVzcyAqLw0KPiAgIAljaGFuLT5zX3BhcmFtID0gcW1jLT5kcHJhbSArIChjaGFuLT5pZCAqIDY0
KTsNCj4gICAJLyogMTYgYmQgcGVyIGNoYW5uZWwgKDggcnggYW5kIDggdHgpICovDQo=
