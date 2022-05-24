Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE3D532768
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6qwg3c6jz3c81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:21:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::607;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::607])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6qwB0DsVz2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:20:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANUtTy5NbBGbihXkwp3CfwqCL9gVfGbH85ld6vlAjOTDqHoWF8yMuC2X5mTw5J5DIJcqoJ3GXLBthDawPS7Z6923GmOtKy91vIajJOzmNQJOjzKUWk8ubShepw/SvP4gdHgzgzXDW2G0U9mWcFXxBlzajJe3+KbPYGnVN4Qhs5POrvyvSvoV0GY7gd7HHtF4nqmoCXuOZ6YJFccLqdY5KmfCaIEwZZHDrWDxsQsijqChbqB8xPCt1Gz7yYYw2QlspfGQ/5RehbbftJmkMREEMfDxwAC8qFVJNIBw0eEqacBVNbTRxDpN0rTodaaO3g7PHjs5ScrRSwecA59fJEBVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUxwFR2mD+fsOTdeoMo9gBu9uc1lpQbprJ6CvoD3kp4=;
 b=BO3dKJ2ism/9cNmEYksFqB4sUxT5kwkbWwjRA6XCrPYMmc03su1CJa2pApcM+yopXffDxEoGBN+bpQUkJJH3KE3DYMqE9LlboaZuz36gTMk5T90hSqAsfR2Y8V5k6D7I/wns1P+W2Ne0AkGh+7patJ+8I+ey85NCOapqaAqvPgNjuk9byI0F2Xcsy6ywHSms1wz7rAttzyxeXcYro31M7OcEJxYtYRkYEXodskZ6YkAzSC53U9Fwn+ZoXpxOtNP02XciS1vIdCbkVLUowv8Hggg3BGbPtV+y/w4701ZOYoUPeQJZzOylj4L4IiXmsBKxhJwL8xqB72zfE9RYc82eFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2284.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 10:20:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 10:20:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika
 Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
Thread-Topic: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
Thread-Index: AQHYbs5i62JTj/rxWkqEHmudNaUwOq0tui6AgAAWjQCAAAFigA==
Date: Tue, 24 May 2022 10:20:17 +0000
Message-ID: <d45030be-3f6b-ebeb-3d63-bf7a96d3ff3b@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-2-sv@linux.ibm.com>
 <26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
 <1653386854.o7nss9hzc9.naveen@linux.ibm.com>
In-Reply-To: <1653386854.o7nss9hzc9.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5b1b310-e02f-4f5f-a66c-08da3d6f0020
x-ms-traffictypediagnostic: MRZP264MB2284:EE_
x-microsoft-antispam-prvs: <MRZP264MB2284448B489D53AC6E8D9BA2EDD79@MRZP264MB2284.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EUaksFbHDXrxQ5ZIollXjwQN+VLGY9ruOjDnKtW0nQQipmnBcdPyqTbKo2Zlq24EM82sNWt9jW31Rvw8EGUMwtjvdxFWjJgcUyxJnkL2+CJw9t7KGme9xAGZui+g2uquVM6aUHuL2Y8VGLfaITwciaMygp/RP0E9P8fhj0TM8QNTl9uaie1izFy/+NibVLO5hUTzJF+AtXI68FbJk6qMDekh2Cdi6vME8fttWrZnicaakpKsyIpe3V2V81IDMesZ29pbquR3LnWiC7/W10FVz8g7beczaYDMazDBrlodMopEXLY/VMs4VO5omP92vHRmasuzfmlUQmFJA+Dy0AcdJMgHTgDXXpx7oel+SFC8tEqW29BRAFteT/e9fhYHB42lpnMGSRkoiTKdbbdtKtACD6u2X/OEwcUniJVppC3M7Xu1ApIFbqsOYDJJv6oupNDiMWnQMKYmr9ZeK/qYV3a8oG0yOg7+7eqnDg2/5X4RW7U7wDFYhf3YHrW4rsl2036XmNc88/1HmMyxi/bnMRA582z5QeJ2qtK8BMLoJQ6RNH73dQc3kQXhWHvJuQj7SB4uKl/CaJ4tqNXHenm7vqHQ84UIlnLBPdFkp26QUd3KQRse/1DmsvkN5j4Voq6Ukxzn98RY46QwCoQjFuVBJLliYCzxclfCql8Lyz9QnqkHppKClAxWI2mSrG3qG0RJ9naakDOBgxCKjUi6+mzyB0+pk9+vIAjCwpu6lTrn4Hjd4P9TwTUe3YkCS2DLdvW1EhNYw3H+xT/jJSf+q2BEqc1TMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(71200400001)(66446008)(64756008)(36756003)(26005)(122000001)(66946007)(66556008)(66476007)(4326008)(83380400001)(76116006)(6512007)(5660300002)(91956017)(38100700002)(38070700005)(316002)(2616005)(110136005)(31686004)(8936002)(6506007)(6486002)(54906003)(86362001)(508600001)(66574015)(186003)(7416002)(2906002)(31696002)(4744005)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OSs4SHMrTm5RZlF0RmVxNVhlU09mbjFXNGYzVWxtY1ppcDhNTS9qamFOZ0Jm?=
 =?utf-8?B?bi9BZU9RYlJjS1VPbTNJOXdraXNHaDQxRzVpOEVrZTE4endKRFhOU3lFaDd5?=
 =?utf-8?B?YVQ2akpYNzFyeW12Q0ppZjBNVnlxdEJpeEthZjR3NEFzUFNScEpZZ2Ivb1B2?=
 =?utf-8?B?UTlraVNsUzZiWFRsZGU1c1M5TUl0b3E4VTc1dU1BQko3WkxOUlMxVzFhUzZQ?=
 =?utf-8?B?TEY3US8vRGhlSWlIQ0p3R2ZYa29OMW9DcjRZN2NJTktlU2NTb1hCZ2RxMy9D?=
 =?utf-8?B?c0s0S21PV2p2Qlo5R25zUUI3M0ZpbEl4N1lheXZMUHU1dUxINnFFNmtUK3Z2?=
 =?utf-8?B?N25TVFVic1ZyWU16UmYrTXQ1aWFMVk11VTFvUzAvYjNzcWNGMzU1RnZDbEpu?=
 =?utf-8?B?UkxWclFFRm5HQ3ZaK2JaZ1hNTm9GaWNIS1pQRkpiV1FpdEVreUpxdFArUW1m?=
 =?utf-8?B?Y2VURjRMTWtOM1B2SFFGaWJuWmhsUk12clA0TldreFJKZExqUWREdVNrRU0v?=
 =?utf-8?B?M1VDb3FXdjVJdnlJWlJhQVlHb0RHOEdTNkhFUU5BRXJhTUNIMytueE9ZcndI?=
 =?utf-8?B?V24xdFl3SEFHY0p5aHdrZGdDK0Mzb1pBVTJuWmZkdk5MME9NVCtjT2k0V0pC?=
 =?utf-8?B?bHNEU0RJT2txVkR5OU5KWngydXc5am5zOGtQWEx5MlBvRHR5NjQ4Uy81RW5s?=
 =?utf-8?B?QkRZaFRMQkhHb2RmcHJhbE5XY3RpTTJvMnNweVFidHppRU9zVTRMcWVDRFAx?=
 =?utf-8?B?S1praEFKV0Y3YWlOMzBEQWxUdXNsYTVWenlka0E1S2hyZlpVbG1QZk15WlFZ?=
 =?utf-8?B?cENNSmI1K2w3VFRyT0VSN2lNU0l0RUlKZE91TzVIL0pyamxHNnoxcWRYckZr?=
 =?utf-8?B?dUltemRqMjM2dUVUYzByU2J3YzI4a3MyUHAwekZCRTVRR3UrTWVSMm13ZG51?=
 =?utf-8?B?MHZsN016MHFmMERJQ2tKdmRLeFJiUWFxY3pGQ2g1SXg0bTFhTnpjaVZoZVhC?=
 =?utf-8?B?c3pHc1krNnc3RnkrUXAvMXBQTXdHT1FsdDJpOWR3ZmJqdC9rU1hpQTYrcHho?=
 =?utf-8?B?ajNncXlCWVZta1hiNE9vZDhEdzlWaXJQUHBuOTk3cFZqUkJBTTU5eDV5TS9C?=
 =?utf-8?B?SmlvRGhkY0JSZitCdm4zeW1mWDN6NzlCeFYxeDRtZGZYZ1JZRW5yelhwK2JH?=
 =?utf-8?B?OXh0Y1dCUmErYlZqOWtOMDNxQXFSaU81OHFSL2RNaHZpRHdyNklhb1UzZ3Ir?=
 =?utf-8?B?YjRJVk5Rd25MUENqcVFRcWh0RTlLR1BwUUgzd1hDeHVSSjMrelBMMXFRcXNG?=
 =?utf-8?B?S0ZVSTllTmliWkZwR3FvSHZXcEZpZ1RMRktaRVVOOUYyUGNyVlM3dDg4alY5?=
 =?utf-8?B?SGFIcFNZK2VpOEJxYWN3Q2NOWEFsc2ZYMjR4ekVaRkY5WVNMUnpZVkcvZ3hE?=
 =?utf-8?B?T2VsRXZveElza3dRTzkrODFyRVhZUERiM3JPWEJIejM5REd5N2VKcnYwbmty?=
 =?utf-8?B?VkthSnlBbE93ZzhEMGJTdndhMVdBbFlvd2RhVkVoa240L2NtSUFtd1lFTjNz?=
 =?utf-8?B?TllTL2VRNDV3cnhOT1VsUnRuRFpDSVJST3FDOUZYOVdiYTJjaTg4RDhSR3hY?=
 =?utf-8?B?YlRNT1pyQlgyQUJNUnBLOEJFMjRoUUhnajUrT3ZwQVluQlZzcHVndkV6cEl3?=
 =?utf-8?B?TnhMWW1WcS9ublBYWnNVeGpjNzQ0bUJoQVRwbUtsU09UZ1hVeHJabHAzTkRB?=
 =?utf-8?B?NnUxc3hBckpycDZUVUpUVlF1eURVWEQ3Zm14WHJZQjJuVkNiK3kzaUVnOWtj?=
 =?utf-8?B?Rm5PTHVScXpLMUZlZ1lERW15a2hpZGkxSWNhaXp4OE1lV3dzUkpFYitGQnUz?=
 =?utf-8?B?MHZQZjRJeDFHTFR5YVhYL0FUTExEWFRrNDdyeEgvRCs3TVJaNnF4eTFIN1ZY?=
 =?utf-8?B?TWxxR3VmbHl1b1h3R1hUVWpzQ1N2L3hxMUJEdXFsT0RhNUxoTE1lVTNhZ0RO?=
 =?utf-8?B?NHIxL1NPRkpwSTdTVTZhTmNWeVdNa0thcFBBTEM4dVcrekdDYkx1UFAvU3R5?=
 =?utf-8?B?Umx5ZkpFN2pDcGw1MzJBMHJTZmhhaEJReGJNRnBodFVxVHQrdHNQTlYySllz?=
 =?utf-8?B?cjJBR1ptZXNJMUlkRlRsL2ZucU1UWlVwVWdRUThzVXR6UXpxOTlCeUNES2o0?=
 =?utf-8?B?U29nRG84aGVwNWd0T1FxQTlTckFCRjNDaEpSYnpBRE9maDJkRkNlZ1ZuQ2pH?=
 =?utf-8?B?VXNzODEwdUNaTk9HZjF5QmtuZ0RVdzBnOVM4cDBvUzlDK2ZJZGwxeXdFVFNC?=
 =?utf-8?B?c0w5aXVGcUx3aFVqdTYzVlQrOUQwWGN0bkhzT1Rna1VzRndDZ3lkSkNwemVz?=
 =?utf-8?Q?bj0SowqYsGkuuffTCh+DAA3uYQzCdCh/dSnKj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C76866535FF684D99C4B936C01B26A8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b1b310-e02f-4f5f-a66c-08da3d6f0020
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 10:20:17.8838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Db7O47J9dWnKxkmOJ2naF6mU7PYQ/wotCqaJksfko+xMUhrJybMhtizUGSSwxpgsnmqu+r9c9fjzxLK27JZahQjPRqTuytI63KHP/kHvsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2284
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA1LzIwMjIgw6AgMTI6MTUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjMvMDUvMjAyMiDDoCAxOTo1
NSwgU2F0aHZpa2EgVmFzaXJlZGR5IGEgw6ljcml0wqA6DQo+Pj4gQXJjaGl0ZWN0dXJlcyBjYW4g
c2VsZWN0IEhBVkVfTk9QX01DT1VOVCBpZiB0aGV5IGNob29zZQ0KPj4+IHRvIG5vcCBvdXQgbWNv
dW50IGNhbGwgc2l0ZXMuIElmIHRoYXQgY29uZmlnIG9wdGlvbiBpcw0KPj4+IHNlbGVjdGVkLCB0
aGVuIC0tbW5vcCBpcyBwYXNzZWQgYXMgYW4gb3B0aW9uIHRvIG9ianRvb2wsDQo+Pj4gYWxvbmcg
d2l0aCAtLW1jb3VudC4NCj4+Pg0KPj4NCj4+IElzIHRoZXJlIGEgcmVhc29uIG5vdCB0byBub3Ag
b3V0IG1jb3VudCBjYWxsIHNpdGVzIG9uIHBvd2VycGMgYXMgd2VsbCA/DQo+IA0KPiBZZXMsIGlm
IHRoZXJlIGFyZSBmdW5jdGlvbnMgdGhhdCBhcmUgb3V0IG9mIHJhbmdlIG9mIF9tY291bnQoKSwg
dGhlbiB0aGUgDQo+IGxpbmtlciB3b3VsZCBoYXZlIGluc2VydGVkIGxvbmcgYnJhbmNoIHRyYW1w
b2xpbmVzLiBXZSBkZXRlY3Qgc3VjaCBjYXNlcyANCj4gZHVyaW5nIGJvb3QuIEJ1dCwgaWYgd2Ug
bm9wIG91dCB0aGUgX21jb3VudCBjYWxsIHNpdGVzIGR1cmluZyBidWlsZCANCj4gdGltZSwgd2Ug
d2lsbCBuZWVkIHNvbWUgb3RoZXIgd2F5IHRvIGlkZW50aWZ5IHRoZXNlLg0KPiANCg0KQnV0IGRv
ZXMgaXQgcmVhbGx5IG1hdHRlciB3aGV0aGVyIF9tY291bnQgaXMgcmVhY2hhYmxlIG9yIG5vdCA/
DQoNCl9tY291bnQgaXMgbmV2ZXIgdXNlZCwgYW5kIHRoZSBmdW5jdGlvbiB3ZSB3YW50IHRvIGNh
bGwgaW4gbGlldSBvZiANCl9tY291bnQgbWlnaHQgYmUgcmVhY2hhYmxlIHdoaWxlIF9tY291bnQg
aXMgbm90IG9yIG1pZ2h0IGJlIHVucmVhY2hhYmxlIA0Kd2hpbGUgX21jb3VudCBpcy4NCg0KQ2hy
aXN0b3BoZQ==
