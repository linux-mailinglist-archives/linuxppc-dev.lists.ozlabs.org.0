Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03E4F6312
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSpq4P5tz3bg2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 01:19:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSpL08k3z2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 01:18:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXLJq5jg1e6+0emfEby6bqMEPrrHU2G5MlALffqqPLbcX5sxHQsfuXgx5i1tJmxYbEVIVN+vCX+fTKC6DwRXlT3pwvdiGyhjvbGBVFkNK49cX9k780NzWEtfhDi6nQQ6KMpoopfSlPCcdBptqIZ0U6RoJkjGEUQoJ2dDEFSG0ZA2TwCYrzL9pM+VIOga0SuYyKMaqX02ri9YodWIsNcpyDKPUeW30ESSqK6ycJIwdP+o1P1oUiZ6ldHCvFFGz+1IGE1Cf0g2BnKMZaO2ulnxtdlsMJ6ITLMDWx2qyz7Q6auwAx8PNVcnLG01RAci7uVG3glb8Lgfwv6RMwi+3RoEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvuzP+q3DblyuQ08ZOKQkzQ6ptQf9/GAXzK6bdgu3kc=;
 b=IM43Vuy+zf+6AmS9+aSQGB3QyxOApP+6euwTd12fMQ/rObdR+/s1LVhGWUXOroO7QrluAiGLu+rwCQzeZpWYbmzVZRnKCZSRAaFYJ05ZeMkbBkTcTMneWm0G8moaIWXEwhOUw+jrdl6sDgOas6vjYox+j3/R6tGKKvfNNuZWCEr/Gv6b83G3XHCC+XjTkYN1kGvXfPRKqwJEmIAOQlkwyip2KvF4dVtOnKBJrV3WiQ84aAGDQtU/l5wB1ZhlHdK4ZpnXNdSHJgSo/WRkkhUWVTUi8eAPnRUdGRNQydmzou2dvyOday9UtBFLBPfsJDl7oNyt+bYBVwPNotaPC9+hcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1897.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 15:18:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:18:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/6] powerpc/64: Only WARN if __pa()/__va() called with
 bad addresses
Thread-Topic: [PATCH 5/6] powerpc/64: Only WARN if __pa()/__va() called with
 bad addresses
Thread-Index: AQHYScbFPyPD2dgz+kqiqIUWBCIsgKzi/46A
Date: Wed, 6 Apr 2022 15:18:23 +0000
Message-ID: <7381978d-26d1-4abb-e539-d28247a93d9b@csgroup.eu>
References: <20220406145802.538416-1-mpe@ellerman.id.au>
 <20220406145802.538416-5-mpe@ellerman.id.au>
In-Reply-To: <20220406145802.538416-5-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85685ff9-42a3-4716-fb73-08da17e0b149
x-ms-traffictypediagnostic: PR0P264MB1897:EE_
x-microsoft-antispam-prvs: <PR0P264MB1897A275BFC32D19D4A68CFEEDE79@PR0P264MB1897.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gSulrlctBGcPf8xuYrjuN5WqUd3GquMwp9zfk3bc7VEIzc32sZqwqKkUpVOJg2ZUF4Jc5MbTjGkO7k4RjtCbatIRwc5sB8xyMkhY7qavGX5SBoEPsBScHhzWFZjKp4PhuUTM0jb/HoR0egrGJO5Nv8g9ZaOQyO8pL6OPfPnYqzbmVsMC5QBWA/Cdu38DpKQ/eX19j6i1NKnjCOiWwL8yYlAeZSVvYcTjvThpDEPi12VtA9LCQYF0fKtk5CB6HBp7KLdI03D7be8Chva29kGm6JZKmowiOKAphLGI4ffJ7GF13CtlNAGIileiTD1SwmJCE/al8S+sTbj6IvozmYCFTOrqIheS5HhMNEdhdGg8Gu2G0lmWpHH49/2GCGdYq/FaO8m7rO3S2Dfs9/HWbLHeXpPLtGsL316uLs+J1G5VROX+BUhup3iqkrhDKTM7lJrRN9Eri3l6r+ob7MD4KcVBNyu2YqKk8OhrfmM+qvR0FePyzszgH27Y0Y9rCXsWa6jmZRUJ9Se4SGoHfmCcX1vH9GA5X5uwC4XpbjJL6ICHqI4rPHOsj6uWCttE9snUVyXu4KwM1pHyC1+3yIFSztyhZNhQrwaXVz2chGs2e1yO8svaytC3Xw7pWDBuT53w5qQPpiAXnZ7bujZ8QNGxFBmIwfKz4ulgHWxlal4modqj31VKlqovTOn2A4VgoF8i44i9RJm0oQVgtFqg4MclPwZSnwBfzSGSo15A9479ZEi05eiv9L6AoQEPBjkcQpXMVd4lws0QTUjrOOjw1V4ufNDfs2KFM60R2v0aukylqE9Dsh7QKfGchoPgHHG5qQJlHWp8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(44832011)(76116006)(8676002)(4326008)(66946007)(66556008)(91956017)(66476007)(6512007)(38100700002)(122000001)(2906002)(6506007)(5660300002)(64756008)(8936002)(66446008)(31696002)(83380400001)(186003)(110136005)(54906003)(26005)(2616005)(31686004)(38070700005)(6486002)(36756003)(71200400001)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkRmU1IydzFDU1Bick9XVkhkejdGZ01DZ3BMWjJCdFhXaUFPVHFnbE1Wb25P?=
 =?utf-8?B?aWY5VFNkeFdXNWZwU0cxL2Y5eE1ZUHl6KysrSXEyK1l0aHBadEg5SVdENE9l?=
 =?utf-8?B?N1Y2NDVEMjFETDRpTWRaaS9DWTdqYlloa1pBdmxyNWJVbjdlVEhQT1E1amdi?=
 =?utf-8?B?dkh4ckc2bElmNFlveVlSSXNnbmx0ckFydUcvcnh2Mnp1NStBRmE2c1Y2Tnk1?=
 =?utf-8?B?cUhvKzZ4MnM1WDk1aU1nc3pEbHBSZVRFNm5maG42YlZReC84NVJWWWowWjB0?=
 =?utf-8?B?L2puRytBS2hZK2JUMEVLNWxOZldGVkVFTldpV3JHSUVkK0hHUFpzUXE1Nzd0?=
 =?utf-8?B?VDNSeDA3SlhacWRScnpYcjFoRExKU2tEUlJNeEhydDJZYzRpZHZERTVuRHh0?=
 =?utf-8?B?a0pGU2FUUHhrS3BpYnI4aEhETnRmTXJocjZVSW1aemJoZ3lvNzY3NE9CWXBv?=
 =?utf-8?B?bW9aNmdmb3BQbVdpYUcva21EMkVrc1RiKzBqV085YmhwbDg3K2dLR1Y1VmFu?=
 =?utf-8?B?ellnNS9qNHhsekp5SlNIUGNXeEljcVNscTQ3aTltWjYzRm5ndEllMDB2SXJx?=
 =?utf-8?B?NnYydUdNdWZyZk5jbCtVWWdkeE1UcXp5eFNCc2llbDdIQlRUdXlMQ0x3YW1M?=
 =?utf-8?B?bjROUHVZQmRTYkRrSFFZc1ZKV3lFUWJSUVBuZ08zYzJOTzhuT1dDM3pQUUlu?=
 =?utf-8?B?SWNGSUFobndTTWd6WERtQVV4OW1oTjZVS3g3bGFybDNpMWhUMjNJcTljTUR2?=
 =?utf-8?B?S044Z29vRnQ1Tm54U2Q1L3MwTTQ0UCtBNlZyZ2dFVzlENWxJdWZJcVFNUUFD?=
 =?utf-8?B?Z3lrakdMb3JvK2dnQVdXblhxQkpCSWpVeXptSU05ai9NZ0VmNUd3OUxEbGg0?=
 =?utf-8?B?eWgzNzlEK202TVhhdU9SZFBCdlpoMW40NEtZeUdWamNtYzgrZk1QRDNQK05j?=
 =?utf-8?B?bDdYb01KNnBWVVFtancrSGRaREs3dHBMYm14K0NjNlVheFQxdXA4a3lSUVlL?=
 =?utf-8?B?SVRwV1ozOWgzM0RUKzJNMTZra2xsYU5UajV1cU1MLzYydFVrYVZ1bGlPZjhw?=
 =?utf-8?B?bjZvdjdHQVJqc1ZCUSt5Vk05TnMyMWdBNXQ5U3lGTnNXYUo4WGRNbFNGM01X?=
 =?utf-8?B?a1RzMWw1Y28vSjc0WFZnbVJoazVseXFIRVBpYnd3ZXZ1NFhJb2UvZHBvcU5w?=
 =?utf-8?B?MDMyMm44aTlQN2NKU3FVT3QzNS8vVENPaE1mbTRGdEFKcEZPWkEyeUNLSW9a?=
 =?utf-8?B?Y2ZyTXdobVM2TjNLRC9RdjFKdGlMWG9zS3JnYXptVjNnNGxRdGN1MUg0aDJD?=
 =?utf-8?B?OExWU0hsSSs2aHpBNWJWVHQyNXNWbnlZME9XTGhxSFhsTmFlN3QrWW1odjBs?=
 =?utf-8?B?dmROa1ovOTNodElENVBIbzZQZ1Y1c3lpcG1ia2tsZ3BabmpYdzIxSzJxMHhU?=
 =?utf-8?B?NXg0eVFPcmVwNEdwa3owVXB4dFlvbVYvREh6Y08vQk9abEJUVFUwQjZ3RzZS?=
 =?utf-8?B?SS91SjlmNHEwSWgzN1AyNFNNdEFBUlVTbFJZRktCUjN4VzdRR0tCeXJxbkJK?=
 =?utf-8?B?TjJpRnAvQW14bW16WUhHQzc4Z1BrVDk0RzlBTnMwbUgyS00vbU92bFAzekt2?=
 =?utf-8?B?U2NRUXkrYmxrVUorblJCdklCYytMREp6WjJKeUhVVVY5UHRTR0pwd0YzeDFY?=
 =?utf-8?B?YUhZT0xXUHB6aFQyczgzT1BmN2xETFBmYTZnM0pjd3IyZUlSQ3lDNktBTlhj?=
 =?utf-8?B?aDRwRmJHOEdialdTZ2ZZVHp1YkJxRnpxZjM5ZmVhVnNrcXBOaHZ0RStnYkJM?=
 =?utf-8?B?c0YwV0pObzlnMnA0dE55ZjZNTjBrN09ocjBOQmxFem5jaTJoUUJMc1R4dHJJ?=
 =?utf-8?B?bnA3OU9BNFp4V01QYlpKcmMvMjZuUUhNb29DeE1pVHlOeGtNK0c2RmRtU0Jk?=
 =?utf-8?B?OFBvK1BTeW1LVjJPWi93KzBhajR3WndJeG5NeDNueE1VdzdjTWtnOEJac3hM?=
 =?utf-8?B?R2pwcWJLdTNieWtMNGYvcGpuRHpJQnRPME5aUnpiNXZIOFJlQVJRTThuWXUz?=
 =?utf-8?B?U1R5b3pjbzVTQVRhTC9pSGhlQmFPNXVwa3dyc3BodHlKRkJxZi8xTU15SDN6?=
 =?utf-8?B?WWtaZlU5ejdXdFE0UlcySmN1K0t6SjRCQUNTSzhMMjhYRFZCUm9ZWEJFdWVX?=
 =?utf-8?B?TDYyQkx2M3ZZM0tsNzlSbkx0a1VRbEo4bkVDWjl5SkFBUVdxYVBvdmJXVldN?=
 =?utf-8?B?R1VZWkJpMk5EYWl5a1ZMWlNHUFhsT0NITkRGZ2VIOHVlTUhZTklEWXFNNk9v?=
 =?utf-8?B?S1dpNHR0ak90dXdFekRpL21jdGhrc1J4Y08xTXMyZ2ZSZVZrQzFFRGhKc2Jo?=
 =?utf-8?Q?zTnzMyZG7aOuXvhlnsMkB18eaWYF+aklU497R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C0768673204C249BF8E802254F5BB50@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85685ff9-42a3-4716-fb73-08da17e0b149
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 15:18:24.0094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emINQlFcyF2sHd5dyabIPlrwFVsvwc+Zne/5VsRMhbbvB2UXUVKp1rDD4lQpa6up29YIyiJjnhiGaYgfAVWR72uNJX49xZqkE3jdTjoiUN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1897
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
Cc: "erhard_f@mailbox.org" <erhard_f@mailbox.org>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA0LzIwMjIgw6AgMTY6NTgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gV2UgYWRkZWQgY2hlY2tzIHRvIF9fcGEoKSAvIF9fdmEoKSB0byBlbnN1cmUgdGhleSdyZSBv
bmx5IGNhbGxlZCB3aXRoDQo+IGFwcHJvcHJpYXRlIGFkZHJlc3Nlcy4gQnV0IHVzaW5nIEJVR19P
TigpIGlzIHRvbyBzdHJvbmcsIGl0IG1lYW5zDQo+IHZpcnRfYWRkcl92YWxpZCgpIHdpbGwgQlVH
IHdoZW4gREVCVUdfVklSVFVBTCBpcyBlbmFibGVkLg0KPiANCj4gSW5zdGVhZCBzd2l0Y2ggdGhl
bSB0byB3YXJuaW5ncywgYXJtNjQgZG9lcyB0aGUgc2FtZS4NCj4gDQo+IEZpeGVzOiA0ZGQ3NTU0
YTY0NTYgKCJwb3dlcnBjLzY0OiBBZGQgVklSVFVBTF9CVUdfT04gY2hlY2tzIGZvciBfX3ZhIGFu
ZCBfX3BhIGFkZHJlc3NlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1w
ZUBlbGxlcm1hbi5pZC5hdT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Bh
Z2UuaCB8IDEwICsrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wYWdlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+IGluZGV4IGYy
YzVjMjY4NjlmMS4uNDBhMjdhNTZlZTQwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcGFnZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgN
Cj4gQEAgLTIxNiw2ICsyMTYsMTIgQEAgc3RhdGljIGlubGluZSBib29sIHBmbl92YWxpZCh1bnNp
Z25lZCBsb25nIHBmbikNCj4gICAjZGVmaW5lIF9fcGEoeCkgKChwaHlzX2FkZHJfdCkodW5zaWdu
ZWQgbG9uZykoeCkgLSBWSVJUX1BIWVNfT0ZGU0VUKQ0KPiAgICNlbHNlDQo+ICAgI2lmZGVmIENP
TkZJR19QUEM2NA0KPiArDQo+ICsjaWZkZWYgQ09ORklHX0RFQlVHX1ZJUlRVQUwNCj4gKyNkZWZp
bmUgVklSVFVBTF9XQVJOX09OKHgpCVdBUk5fT04oeCkNCj4gKyNlbHNlDQo+ICsjZGVmaW5lIFZJ
UlRVQUxfV0FSTl9PTih4KQ0KPiArI2VuZGlmDQoNCkNvdWxkIGJlOg0KDQojZGVmaW5lIFZJUlRV
QUxfV0FSTl9PTih4KQlXQVJOX09OKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX1ZJUlRVQUwpICYm
ICh4KSkNCg0KPiAgIC8qDQo+ICAgICogZ2NjIG1pc2NvbXBpbGVzICh1bnNpZ25lZCBsb25nKSgm
c3RhdGljX3ZhcikgLSBQQUdFX09GRlNFVA0KPiAgICAqIHdpdGggLW1jbW9kZWw9bWVkaXVtLCBz
byB3ZSB1c2UgJiBhbmQgfCBpbnN0ZWFkIG9mIC0gYW5kICsgb24gNjQtYml0Lg0KPiBAQCAtMjIz
LDEzICsyMjksMTMgQEAgc3RhdGljIGlubGluZSBib29sIHBmbl92YWxpZCh1bnNpZ25lZCBsb25n
IHBmbikNCj4gICAgKi8NCj4gICAjZGVmaW5lIF9fdmEoeCkJCQkJCQkJCVwNCj4gICAoewkJCQkJ
CQkJCVwNCj4gLQlWSVJUVUFMX0JVR19PTigodW5zaWduZWQgbG9uZykoeCkgPj0gUEFHRV9PRkZT
RVQpOwkJXA0KPiArCVZJUlRVQUxfV0FSTl9PTigodW5zaWduZWQgbG9uZykoeCkgPj0gUEFHRV9P
RkZTRVQpOwkJXA0KPiAgIAkodm9pZCAqKSh1bnNpZ25lZCBsb25nKSgocGh5c19hZGRyX3QpKHgp
IHwgUEFHRV9PRkZTRVQpOwlcDQo+ICAgfSkNCj4gICANCj4gICAjZGVmaW5lIF9fcGEoeCkJCQkJ
CQkJCVwNCj4gICAoewkJCQkJCQkJCVwNCj4gLQlWSVJUVUFMX0JVR19PTigodW5zaWduZWQgbG9u
ZykoeCkgPCBQQUdFX09GRlNFVCk7CQlcDQo+ICsJVklSVFVBTF9XQVJOX09OKCh1bnNpZ25lZCBs
b25nKSh4KSA8IFBBR0VfT0ZGU0VUKTsJCVwNCj4gICAJKHVuc2lnbmVkIGxvbmcpKHgpICYgMHgw
ZmZmZmZmZmZmZmZmZmZmVUw7CQkJXA0KPiAgIH0pDQo+ICAgDQoNCklzbid0IGl0IGRhbmdlcm91
cyB0byBXQVJOIChvciBCVUcpIGhlcmUgPyBfX3BhKCkgY2FuIGJlIHVzZWQgdmVyeSBlYXJseSAN
CmR1cmluZyBib290LCBsaWtlIGluIHByb21faW5pdC5jDQoNClNvbWUgb3RoZXIgYXJjaGl0ZWN0
dXJlcyBoYXZlIGEgX19wYV9ub2RlYnVnKCkuIFRoZSBfX3BhKCkgZG9lcyB0aGUgDQpXQVJOKCkg
dGhlbiBjYWxscyBfX3BhX25vZGVidWcoKS4gRWFybHkgdXNlcnMgY2FsbCBfX3BhX25vZGVidWco
KSBkaXJlY3RseS4NCg0KQ2hyaXN0b3BoZQ==
