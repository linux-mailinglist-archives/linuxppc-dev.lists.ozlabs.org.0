Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8C538B5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC2MB3R2Rz3btt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC2Lm22THz30BV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:24:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0BYuwyy7HsMejwKEj5M+XoGXgl0S4HqAwxsIEZCa7O6z4z9DMbuQhxXyBq8A5eTyaePMRSjKQ3TkYBKfHp+aGxLgrGcfvBC0W0ApB5S+xDVl1GXznkflGUjdv/aDnl3p2TFX/13zsmI08qxx7hmkiSIVpgoGsBrOYd8dGX2Y280D6FFOquI7yqph2ptyuynrIKIN9PWmJ1elHhXGzDaamy3fsszdS1wKM1j0XgyzvDqpOmKVSRS/prHzA3ehyYi6Vf4PFdT9IObpDIi0TB9tkNCjrjtHzuYrS+epl8EIJTTPuulnSjEDv6k4WaEROnqP7NcIOsKEM1UATP0nbtRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7IIyLUL86BTNPUJzAtUA/NH4AoBrgT8V5n87+bHziM=;
 b=ARRp3bVtTDP9UM+GEKaW/FfMfGNH25yepNdF7YMvrmzxJwDF3pjvYwNYt6Y4cjEtGzThmkK9QrxDqyPUnq3IHjpaupIYYy1olPWCgHhoOoQHI1pfKxZMSwlSV+FPfFIgb1a1nyDOWpMPKXvfD6X4E5B1bAQV9IpAgg2cf0uGBe6nWt/jkMMKedxocR0T+kA+niHAHlMKG9Shu5ZcwCFi3Q7Ae0wHOfkuYHFq/lsD8tqezoCCLQoPHaoNhbYzBgHl8CAFRibUfvX2GEQvjGQSL9t5CVG5mYW1L729LkRydwUvJ5RlGl3kbq1z+syQWy1Nhf4EWHF6pbSaIyArWE6aNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2356.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 06:24:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 06:24:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Michael Ellerman
	<patch-notifications@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Topic: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Index: AQHYPgMuEw69Ny4KjUGygXqB4JUsF60gESMAgALl+4CAAGKkAIAVmFsA
Date: Tue, 31 May 2022 06:24:26 +0000
Message-ID: <b5fb2df0-911b-ee84-9377-fc426c081adc@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au>
 <f1481139-9ed6-3e00-e73e-87d4319c614d@csgroup.eu>
 <874k1opc6l.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k1opc6l.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24c47a93-e415-44e3-df28-08da42ce35ec
x-ms-traffictypediagnostic: MR1P264MB2356:EE_
x-microsoft-antispam-prvs:  <MR1P264MB2356C4A939A1AD7BFB6B9AB8EDDC9@MR1P264MB2356.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  H9NzOXdP2BqB19tciOiIJNIGQI+mgT0/8B6cjbBsISFzU0WXTHZqUIlz55AIgZJpWhh4VOhTBXvM7bPxqHMkyhpBufg01URLz40b/CH1Z4h3dzBr4E8Bdmja/d4Yhs+TOZiUDGMqSF3DC/869r2yAzWJb9ENN0nMei0luOHwrMFn4Qz+YRP+qgUl13Sw8k9Sbqi1yxms+6CYyUlAKQp/P+6f13WtNmCMSErZIbxd1oQ7YKHJgH4YA/2YlGDW9bMQ5jd1X3S75XC/8C/ZikjbAaxUTg0FkoQOBnhyxQZogyoUsx2u4m4xwNwaxSKi5nmSOF8lUedH8hcW9z3tjmGsnGPo2Mbf19nptKoWfMfDOEhJX65iFzWAbS1d0CWsif3F8+68QYfJyDiLD/6fLLcHtbjdhqnaTl4BFy/CKEE0AcJVc9hoAKhkBXx6uJBcMQ6yDY4pxsRcfsODqAr5J3Gr3vVbmSCEZJYsC7YS2B726pIUgQSrqzJJYOoSv829KKnMRpK7vaOmZK2Bscd8a/KYNT4yQMfITeba9hSe1b0wtMIyCtJw7JfeJ3KpOvlEo0Kkb0NHStZJOAaMk3ZklIwazspB6dCOEJQk8MAnyF9+EkN1T1PuBDXgtCM28cbtcly+68OqG2Lzz9+PnNgwv79ByzbZAPWZxaU0lmGV9/9wQCZBWmM+7aDEf8zvG4XD8XrmmO1rxRbU1aaRMceX+UlnVpkg5dtwxtPdUZH8TtkvZm/TtjcE0JwCuRLe/+clYM5TMGaLiaeywcterVY8Ia+jCLiDuy2tyUEgVkm4Md0b5I2CrzCY9cJ4PRt2VdLjKLc7df24WmOshfru7UkQ7TPnPvHSKThGpa4s+Pe6QlQHMN0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(6486002)(71200400001)(5660300002)(122000001)(508600001)(8936002)(6512007)(83380400001)(186003)(966005)(2616005)(66574015)(26005)(38070700005)(2906002)(86362001)(6506007)(31696002)(38100700002)(8676002)(4326008)(31686004)(76116006)(66476007)(66446008)(66946007)(316002)(66556008)(64756008)(91956017)(36756003)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Tys2MjQ2NnBESEVOMFc2RkN3TThZVWVEL1dLekFPSDVQRkdTeWhuMHFqbksv?=
 =?utf-8?B?SUpZaUd6N2t1bGJoekxmeElleXduMk5kYjNvOExnd1RaRHZ0Z3hmTWNkaE5q?=
 =?utf-8?B?VDM2YVVHY1FRVDh4M2RCdFgzaVBmZ3hWNU0ydXA2aGlKRGZGK3RWdVRnUjZS?=
 =?utf-8?B?Mk1xQTBTZ1ZPWFAxWmZycElOdW9CYnFML2N2cmdnZzFmam43ZEF0UGV0cTlz?=
 =?utf-8?B?Q1JMWVlOK2F3TTVQdlJwWnUvS1RHTlRWTHFaeUhWdkhxL3BuNE5ScTVRL3hW?=
 =?utf-8?B?cEFtc2NiV3J5aVNLUE40bzcyYVBuMm4rb3Y0VFoyOVRFTDQvVmFtaHRsK1h6?=
 =?utf-8?B?R3JlNFpJRks0eStOL1NyWEdkdUFFeS9ma2NmWExkcC9NMWE4WVRzOGVRY2tq?=
 =?utf-8?B?d0JkNVJTRzR3QzJFSDc2dnZ0c0FQYlp4YmJObW9ZemFUUzRlUzVMUUQrSjIv?=
 =?utf-8?B?c01Sek9HdUI2NitTWGswK0JIRXYxQlFMUVlES0lDbW5KRUpvY1dMSXpNR1FW?=
 =?utf-8?B?a1hyUnMzQUZOeEoxbDRidUZNZDFMc1hlMkQzeUZ2eDJQZkZvRkVhL2RlY2t1?=
 =?utf-8?B?R2tVbFVQS01KVFJ2Qjl3QWVKNXZEQzFQeHM3TUpDbmVPelkrWDVpOG5VOXNS?=
 =?utf-8?B?S1lBWEkyMFBkUU1IVTcybEpRckYxcTU4OFppQ2NKaFNRSTY0S2tRdjVjcDNT?=
 =?utf-8?B?ajFWaW45VERiR01wQUFYc2ZxZVpaZnRZQUpUMTZETHpjaStsRTlSWFR6UTB1?=
 =?utf-8?B?MXNnYWYySEUxekNmTHN0Yjc4dlJjRGZZWXVxZ3ZvZjN3d2loNzRRMDRCbzMy?=
 =?utf-8?B?UGlkV1F3d0Z6c3dteUpMV0JSV0tjL1l2TnNlaFZBM3k0eGVmeSt0YkNBOFY3?=
 =?utf-8?B?NmVITEVYTGtESHY5V1d5aStEUGwxdWQ0UHdYWU1ra1RxejlNYU1qWlQ4aXM3?=
 =?utf-8?B?cDJrQ0Vqa2ZnQUErQXZpZHdWOEkrR3g5cE9Ca1dHbWg1QjZ0Mks4My9jY05K?=
 =?utf-8?B?TnNISHVQQUJkajdtMWJqaGZUN0RaZ0FlL0xIVEVQVHpJMnhSMkE3ejhjb2Iy?=
 =?utf-8?B?RkI0M1FQazh5YXZXSTdOc2tGeDN2dzI4bXU2Y3pHOGNMcUF1dWNlTEN5Z25G?=
 =?utf-8?B?MjkyMXFSZ3VnY2thMlZlNzIreDRGU2RZekU3blJKaElDL3RRaWo3dmplSWR4?=
 =?utf-8?B?eG9JVHVoWFA5NTV1Y05MSGJvM3ZERU0xWXYwSVZBRjNWZ2hESXFheTFxczJm?=
 =?utf-8?B?ZFlwQ24xd0tzVEdRTjBua00vMS9EZTdvdFBvZGJLb3NwbHFpeWw5ZUZteUFT?=
 =?utf-8?B?dFpYbHFPM3V0aUJQaHRLU2d0SW5QUlBIN2E2TFEySHpsUnhpRk84dkVnamp0?=
 =?utf-8?B?SGtOUk5uRWMwUEl5d1NsSDAzcVVudWVhREkya3VLVUdqTUhwU3IzNElnQUtU?=
 =?utf-8?B?dGpmbThlUjBBVGUvL2tuNnB1MnliQXdHY053V1ZMUFZtblZJQWJDaVVCaHhv?=
 =?utf-8?B?bkgwSFpqaWxSYnVVTDJTZWJIeEx6MmV2aE8rWWI1WGh3M3lVZ3JlZ25oVktW?=
 =?utf-8?B?cGJzMVl1Smphd2tTeWx2SUdadFRtQ1RrVW0ycFhmeXd1MWFMeGpVUFZFMmFj?=
 =?utf-8?B?RW1oRXJFQ0xORG5yMFp4UmRpL0VkNHhXZEpWQkt2Q2IwMVB4RWRsWmI2Rm1p?=
 =?utf-8?B?Q3NMZDZZMFFJbC9RTjYvSVE4NzlzYTIvN2dWd3o1VGRKOVNEMnd4dlpTa3hQ?=
 =?utf-8?B?OWNlWmd3Q3IvM2E1TjRISUVrN1VSa2l0RXZyejJUbW8rNDYyVXVkckJSUS9U?=
 =?utf-8?B?NE5OTit5MmVjR0JVOU9FUzRvTmlhbUpKUk1jaFdnMTZ2MDNOM21WS0d4a0RK?=
 =?utf-8?B?aXViMUlTYWhBYlpxQktDc2h4WW4vSkNUL2FRVEs2aGRQaDRrSjJNSW5JUHhm?=
 =?utf-8?B?VitKcGs0MEZmcCsvVzRGUnBZTEVzdVdMdmd4dG51alZUODR3Y3dVSHlEQWx0?=
 =?utf-8?B?QW1QZkRyZVk1WnBrbmNHN2NBUFdxcllSYTE4ZVlvRjh1VWpDaFpRV0gyQXNF?=
 =?utf-8?B?YkFnRnYrOHdCY1lpSkFLanR5L24zZ1UrYzBsdjBzU3ZaNHVJUVBTNzdqdzlV?=
 =?utf-8?B?bVh3WHBCV1BsS2NLNmhmNVIvRmRSVmsxaVBid0w0dVV0bk9sWWQ0SjhIVDRB?=
 =?utf-8?B?U0UrZEphUi9ycXFiaEE0eEM0MkgzSGJYT0NvaVllZlJTa0RMU0VtSkpLdXhm?=
 =?utf-8?B?cG1qTHpuYldSdmdKVWR3SnVXNFhmamZzdkg4UDVKOEtXbWd3aFJ6b0x3ZEtn?=
 =?utf-8?B?a2gzNitnVmF3dWYrdXNOUllRRnlwWGNGTWUzeHF5MlJwRDM5TkxOVkp1Y1M1?=
 =?utf-8?Q?PpCtLvq954L84aWCXhGDTievE9m1grD/pyYT1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE116EB281E33C439E0563849C715D6B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c47a93-e415-44e3-df28-08da42ce35ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 06:24:26.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjobcJulx3KsDW2GoveXoyOHPYowRU5GLgyhvFlFJUFjjxdR775bik53s0eDPC48oppHyalPd/+DBGuxPeG4lexY5ZqI1Fz2c5Ff624oq8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2356
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA1LzIwMjIgw6AgMTQ6MzcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxNS8wNS8yMDIyIMOgIDEyOjI4LCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gT24gVHVlLCAyMiBNYXIgMjAyMiAxNjo0MDoxNyArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+Pj4gVGhpcyBzZXJpZXMgcmVkdWNlcyBieSA3MCUgdGhlIHRpbWUgcmVxdWly
ZWQgdG8gYWN0aXZhdGUNCj4+Pj4gZnRyYWNlIG9uIGFuIDh4eCB3aXRoIENPTkZJR19TVFJJQ1Rf
S0VSTkVMX1JXWC4NCj4+Pj4NCj4+Pj4gTWVhc3VyZSBpcyBwZXJmb3JtZWQgaW4gZnVuY3Rpb24g
ZnRyYWNlX3JlcGxhY2VfY29kZSgpIHVzaW5nIG1mdGIoKQ0KPj4+PiBhcm91bmQgdGhlIGxvb3Au
DQo+Pj4+DQo+Pj4+IFdpdGggdGhlIHNlcmllcywNCj4+Pj4gLSBXaXRob3V0IENPTkZJR19TVFJJ
Q1RfS0VSTkVMX1JXWCwgNDE2MDAwIFRCIHRpY2tzIGFyZSBtZWFzdXJlZC4NCj4+Pj4gLSBXaXRo
IENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCwgNTQ2MDAwIFRCIHRpY2tzIGFyZSBtZWFzdXJlZC4N
Cj4+Pj4NCj4+Pj4gWy4uLl0NCj4+Pg0KPj4+IFBhdGNoZXMgMSwgMyBhbmQgNCBhcHBsaWVkIHRv
IHBvd2VycGMvbmV4dC4NCj4+Pg0KPj4+IFsxLzRdIHBvd2VycGMvY29kZS1wYXRjaGluZzogRG9u
J3QgY2FsbCBpc192bWFsbG9jX29yX21vZHVsZV9hZGRyKCkgd2l0aG91dCBDT05GSUdfTU9EVUxF
Uw0KPj4+ICAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wb3dlcnBjL2MvY2IzYWM0NTIx
NGMwMzg1MjQzMDk3OWE0MzE4MDM3MWE0NGI3NDU5Ng0KPj4+IFszLzRdIHBvd2VycGMvY29kZS1w
YXRjaGluZzogVXNlIGp1bXBfbGFiZWwgZm9yIHRlc3RpbmcgZnJlZWQgaW5pdG1lbQ0KPj4+ICAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wb3dlcnBjL2MvYjAzMzc2Nzg0OGM0MTE1ZTQ4
NmIxYTUxOTQ2ZGUzYmVlMmFjMGZhNg0KPj4+IFs0LzRdIHBvd2VycGMvY29kZS1wYXRjaGluZzog
VXNlIGp1bXBfbGFiZWwgdG8gY2hlY2sgaWYgcG9raW5nX2luaXQoKSBpcyBkb25lDQo+Pj4gICAg
ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Bvd2VycGMvYy8xNzUxMjg5MjY4ZWY5NTlkYjY4
YjBiNmY3OThkOTA0ZDY0MDMzMDlhDQo+Pj4NCj4+DQo+PiBQYXRjaCAyIHdhcyB0aGUga2V5c3Rv
bmUgb2YgdGhpcyBzZXJpZXMuIFdoYXQgaGFwcGVuZWQgdG8gaXQgPw0KPiANCj4gSXQgYnJva2Ug
b24gNjQtYml0LiBJIHRoaW5rIEkga25vdyB3aHkgYnV0IEkgaGF2ZW4ndCBoYWQgdGltZSB0byB0
ZXN0DQo+IGl0LiBXaWxsIHRyeSBhbmQgZ2V0IGl0IGZpeGVkIGluIHRoZSBuZXh0IGRheSBvciB0
d28uDQo+IA0KDQpZb3UgZGlkbid0IGZpbmQgYW55IHNvbHV0aW9uIGF0IHRoZSBlbmQsIG9yIGRp
ZG4ndCBoYXZlIHRpbWUgPw0KDQpXaGF0IHdhcyB0aGUgcHJvYmxlbSBleGFjdGx5ID8gSSBtYWRl
IGEgcXVpY2sgdHJ5IG9uIFFFTVUgYW5kIGl0IHdhcyANCndvcmtpbmcgYXMgZXhwZWN0ZWQuDQoN
CkNocmlzdG9waGU=
