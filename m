Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0FA4DC1F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 09:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK1Dj3KRZz3bW2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 19:55:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1DG1GrCz2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 19:54:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NahMk5IIqNQq+8TSREfpzxcml7d7WBJA1VVRr+1t8+7xHMSU1YUiRsHRV6A/i3aKLege8id5O4eM1ZgbInZk+1BuCZP5Sv5ykmI0/6SitvPIgJhlObqLLjVd7dOEcoVWtQRXTCXorLCd5c4NtV9g0qtkWk3AuXEBAgRUd3Bw/RCAL2G1TBHbW4DI72X/YOe0ehE6QrSMG9UGSL79rdue6wTq9ItU1+9D0ONikiUhH2yYIHkOD9uJMBJvsSoT7xPrd2w7A5E0PPTf15T5zcdUmX0ocC5g6Oir766/xA3kdc+v7aif6676VSgcFhc+tamCXKbY0t7eM5YC+cQ2JZrXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9XYjzScVZnqHFdAPSIDZVHsWSgtODBt6SroX+qLuIU=;
 b=jgvvzSpHcgaiXVf6YFF9o0hw7rc3E7ymp0iB523Rwty0w/nuKhA5SxEz6641ez19wd+6PxbBk9n9cKkbknGcJCUUilwzBTHSJSzQ0uZau4GJVEU8Hz+viNI7P1oFQv71ZoWViD0OwzxvXBqA97iv2xu+aTBGe3WNrYyfl2HBehWIL231f8PF3sALYp7d3pUmLzhZxjTOMZrwMC9FTmILVi8h/nGKXOnzho9DeVDxz28p52QfOP1ka1zrIZtYzhgkq2faWdBs9ml0VJXQlHIT0EUGrQklRDeOFFAhwFTiQZRIHvFznl+UhJue5Ufrw9vrvk7eXpbxDO6ctRac7RAfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4482.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 08:54:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:54:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Haowen Bai <baihaowen@meizu.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "adobriyan@gmail.com" <adobriyan@gmail.com>
Subject: Re: [PATCH] macintosh: macio-adb: Fix warning comparing pointer to 0
Thread-Topic: [PATCH] macintosh: macio-adb: Fix warning comparing pointer to 0
Thread-Index: AQHYOanHdD1KGIpfXE6E+4BnRVJSrKzDRdKA
Date: Thu, 17 Mar 2022 08:54:16 +0000
Message-ID: <0d00b06f-52e5-bd9b-5592-f3c0ae7cc860@csgroup.eu>
References: <1647484201-11738-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1647484201-11738-1-git-send-email-baihaowen@meizu.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f8123a0-0acf-4dff-3bb9-08da07f3b771
x-ms-traffictypediagnostic: PR0P264MB4482:EE_
x-microsoft-antispam-prvs: <PR0P264MB448215992058CFA64D47BAF9ED129@PR0P264MB4482.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5uf3tnqUDnF0xeNGEM7hn0B1KvdvlAraq0mfp7DUHZzp7jNurikqUf3OyQDPomZ2nwdqlaIaE53S7I99aqz8NUN78zHBnRqKDS4zdH8mlEWnIH11pTSrxHqiKQBenxECygJJsXbA8bZbYaoncqtDyQgBvzecQuwXrUMoz5ruyaU45A4Fz5kRKpwga10Rj0iNFc+dJa7WNyUCSDF8ayGyonmlA7s9ppv6B6YScYE+YcOLvwUZLB5Ld1boDuO4ONBm5sFftahyzY9so5EK+212mIfw+kdp8WhE3Z3qY8Q3RaJdYOA8v7ZlpebWp/l+A7rUHi1ySAyB2kZqnTVhhGw2YI6mPWPeKUYoq8F3Q7MuHsT+p3hdVPT1fWyVGXIy8CNmJho4KZ/moi6HI7SLJ5sZ0e2vBQAW3TMI6XqiC3F5F39t0mv4rZhrisasmFkQHO/iDQ6NkpxC9PG2CKxs4a4fKNzxblrzqCBJwBR9T0ctP8QiOi34xMLmGcHKlcPnyoPVImacapXXuvnczFxhQGKdp+YJGZFJYvtm1j3J+y311bWEOwEe7lBvWTu/iq6ul0z4E//gYXFYIdzA5L5wLBMHwkG50RJ4CxtINe+TtzDs4xylho8VboPdszKmbrq3MRbamUkVlgiafWTzXcArLcAZjKDPpNrYyAOuOLDVUWaxAMY7l29TSQghP/KakeVDTCq6+XNhj3pAWTxirM5r/NxQnCcKlJU/LQzderxDlWDYFHMweH+O9MSkUY9I8YM92FuZg5YuqzVwTTNOdkkPw8nEIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(5660300002)(8936002)(83380400001)(66574015)(71200400001)(508600001)(2616005)(6486002)(36756003)(6512007)(26005)(186003)(6506007)(76116006)(66946007)(91956017)(66556008)(66476007)(4326008)(66446008)(64756008)(8676002)(110136005)(316002)(54906003)(38070700005)(31686004)(86362001)(31696002)(122000001)(38100700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0hoZHFVSjFVMFV6NjF0YXVsWVoxSmEwMVFYRmI3N3NuaEMzeXVhNHFOYXpz?=
 =?utf-8?B?bnVyam1tWjBQRFkwUVp2RTdvMXN5cUs3MzlDSDUrZEd0NnpEYTB5dU5hUnBq?=
 =?utf-8?B?cFJnS1VMcjVkMmpqNkNoMFF0ZTVVYnBERzI4bGJKWkd3SWRUSU4vT3gzKzNi?=
 =?utf-8?B?dDlLOS9FSTczSkNEWkd5UmxabEhwZnBhQVlZY0ovcHdZRHpadmdCNVk5WjRZ?=
 =?utf-8?B?RU41YS9iRWVuT1RkOWhUNitoNlA0ZWVLNlk4TWFPaVZpR25qZjhjNWZ2aTNF?=
 =?utf-8?B?TTZwNmZyUEgyNjkybElYQ1ZIbEllMXRERWpkVmJzTDNLRW10R0k3c3AvS1Fm?=
 =?utf-8?B?RFdjZFB0dGtoNG41clQxeENhc2ZqejRrZXByL0RUck1WQXVITm5EUEVySzdN?=
 =?utf-8?B?L2RMRFAzeUFFTWxQVkcyYmxhM1VYY3BLazZTS0lkN2hRYVpncnpWL2V2bVZq?=
 =?utf-8?B?VGR0SGN4TU9sTE40SFVOaVljUGlQSHF3R3IvVzA4UTFIVEM3Uk1lMlptbEFF?=
 =?utf-8?B?Z0JJd3U4YzNhMkZnSElIcDJyNExCZFgyNzFubFE3TERTNVJBMG9kaU5YRnhU?=
 =?utf-8?B?bU9lQmRHZ1ppaVZRWkFhVGlPbDdNZXN0WVZiVlhMQTVEdG16elp6SnNXdk9Y?=
 =?utf-8?B?dmZVRUVPVkZMZGhuWGFxRUp6V1lqT1cwdkJ5RVE0czNEc0xJVVQvUUcvbVhv?=
 =?utf-8?B?akJpUUdvanJWaTFEOUV1VHBJV3BtY1Q2NzQyWHFUMGhqRGhCYjZRb1ZJV1I2?=
 =?utf-8?B?MU03aWc3NkFjdzZNaGhPWXRiM250MW5aMy9SbVRjZmg4QThLaWE5bDJCNTNC?=
 =?utf-8?B?V1JVQ2N4alc2NnlKcURCTXJsZWhoOFFQNVM1UFdoanl5dVNFaUdhNnpJeUdK?=
 =?utf-8?B?WFV2Wk9Xc05zL0RXSlFxWWlKdWZ6dVYwZWM3b1FNRG11aGVLS0dFWkw2anJk?=
 =?utf-8?B?UDYrSksxWnQrdHR2d0h2aGU1cDhQS2ZxQkhBeTdwVmtLY3hUcnRZUHExR3Ry?=
 =?utf-8?B?VnNnRXJkV3VXZHBKY09lZS9SS2lOaWh5cUZjWWpSaURqRndodUlhdEdtVTR5?=
 =?utf-8?B?NFlKaXc2cUc0aFA3aXg5ZnU4UC8vdXcvUVBRT3pnZGdGc2ppWGZTanlxRG00?=
 =?utf-8?B?N1BrK2RSM1psT1Bad1gxb3N1ZUFLa09wVG1LQkw1eXpQdkYySXZkSThnZHVD?=
 =?utf-8?B?Myt0K1JCdVBoYXUrMHVUL2thbk1YeXRtbUtuckNHNnIrczlPZjhNZzlZQTAz?=
 =?utf-8?B?Ukk3V3h5UmtEZktldmpHWW52ZmR1aXcrMitBL3VKZlZFOXYvbEFERlNIcU4z?=
 =?utf-8?B?RThmU21jRFMzUTFZQ0hqZ0FCN3owYTBRV2F5T3BzanZCRTNzVzNDem1mcUhv?=
 =?utf-8?B?bzdzNTdjcjcrRkZqcXJ0QUJXSHlNVEtVQnBrMXJSdXlBZTd6Vmg1dUE3YWJY?=
 =?utf-8?B?Wm5tcmRudkxsSFNnUVIzUDB2cytzR0NlVnBxOXFHdlRTYWpPMWpWWmFqWU9t?=
 =?utf-8?B?di8vVVRCdnkrU3doVHc3OUpISExEaDJuNDRWdGJ3TnhJWXEya2FuZFZOSllC?=
 =?utf-8?B?dXhMczF4dTNiRFBUMzNBTGNnbTEvTUJGL1ZUU1RaSU1TYjg1R3dOTGpKTTgw?=
 =?utf-8?B?dXBUQno0b21vTTJHMjY0Y0VGcWFaQVhacmdISytoL3hDYzJ4czFieVhuazF1?=
 =?utf-8?B?RklZRk5rVE5sejl1SkZPQXZ3N3VVNXdDRm9GcWg2c3liU0tvT1RCa1JLM0VK?=
 =?utf-8?B?MUh1WlJQRHJuVW1qL1dZRGY3MGd4MTZjVGdyakZZWktpaUY1M0p0V1JWTWZi?=
 =?utf-8?B?Yys4ZE1xQmcrMWtLTWcvTDhDRHgyUjFvNmFUZFRwdFNQQXk3VG9MSldjQStN?=
 =?utf-8?B?dEpWalhiYTBXZWJqMjRHR2FrTDJwNDkxYUFrY3h2M0huNHVwL25qcE90d215?=
 =?utf-8?B?QnNFYzkrdlhhS2dqbUFPMTYvMVA4VGVhSFJ0dXB3NXUxMVdRZzRISXAycGg2?=
 =?utf-8?Q?2D4XA4iJyXie9DHx/qp1F7WsG4tpHk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AECC90E970AB14FB7CE0417FA5B03D6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8123a0-0acf-4dff-3bb9-08da07f3b771
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 08:54:16.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB6ADs7otJIptow4dSfuh7zSen5TEz31tDg57EWc8QZzshqqJ1DEvmS44JHrBROhMQdjPDFv3FPmkG7IFnncf8vfxHLbAdr5YnoK72LSFRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4482
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAzLzIwMjIgw6AgMDM6MzAsIEhhb3dlbiBCYWkgYSDDqWNyaXTCoDoNCj4gQXZv
aWQgcG9pbnRlciB0eXBlIHZhbHVlIGNvbXBhcmVkIHdpdGggMCB0byBtYWtlIGNvZGUgY2xlYXIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYW93ZW4gQmFpIDxiYWloYW93ZW5AbWVpenUuY29tPg0K
DQpUaGlzIHBhdGNoIGRvZXNuJ3QgYXBwbHk6DQoNCkFwcGx5aW5nIHBhdGNoICMxNjA2MzY2IHVz
aW5nICJnaXQgYW0gLXMgLTMgLW0iDQpEZXNjcmlwdGlvbjogbWFjaW50b3NoOiBtYWNpby1hZGI6
IEZpeCB3YXJuaW5nIGNvbXBhcmluZyBwb2ludGVyIHRvIDANCkFwcGx5aW5nOiBtYWNpbnRvc2g6
IG1hY2lvLWFkYjogRml4IHdhcm5pbmcgY29tcGFyaW5nIHBvaW50ZXIgdG8gMA0KZXJyb3I6IGNv
cnJ1cHQgcGF0Y2ggYXQgbGluZSAzNw0KZXJyb3I6IGNvdWxkIG5vdCBidWlsZCBmYWtlIGFuY2Vz
dG9yDQpQYXRjaCBmYWlsZWQgYXQgMDAwMSBtYWNpbnRvc2g6IG1hY2lvLWFkYjogRml4IHdhcm5p
bmcgY29tcGFyaW5nIHBvaW50ZXIgDQp0byAwDQpoaW50OiBVc2UgJ2dpdCBhbSAtLXNob3ctY3Vy
cmVudC1wYXRjaD1kaWZmJyB0byBzZWUgdGhlIGZhaWxlZCBwYXRjaA0KV2hlbiB5b3UgaGF2ZSBy
ZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1biAiZ2l0IGFtIC0tY29udGludWUiLg0KSWYgeW91IHBy
ZWZlciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4NClRv
IHJlc3RvcmUgdGhlIG9yaWdpbmFsIGJyYW5jaCBhbmQgc3RvcCBwYXRjaGluZywgcnVuICJnaXQg
YW0gLS1hYm9ydCIuDQonZ2l0IGFtJyBmYWlsZWQgd2l0aCBleGl0IHN0YXR1cyAxMjgNCg0KDQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9tYWNpbnRvc2gvbWFjaW8tYWRiLmMgfCA2ICsrKy0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNpbnRvc2gvbWFjaW8tYWRiLmMgYi9kcml2ZXJzL21hY2lu
dG9zaC9tYWNpby1hZGIuYw0KPiBpbmRleCBkYzYzNGMyLi41MWFmYTQ2IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21hY2ludG9zaC9tYWNpby1hZGIuYw0KPiArKysgYi9kcml2ZXJzL21hY2ludG9z
aC9tYWNpby1hZGIuYw0KPiBAQCAtOTcsNyArOTcsNyBAQCBpbnQgbWFjaW9faW5pdCh2b2lkKQ0K
PiAgIAl1bnNpZ25lZCBpbnQgaXJxOw0KPiAgIA0KPiAgIAlhZGJzID0gb2ZfZmluZF9jb21wYXRp
YmxlX25vZGUoTlVMTCwgImFkYiIsICJjaHJwLGFkYjAiKTsNCj4gLQlpZiAoYWRicyA9PSAwKQ0K
PiArCWlmICghYWRicykNCj4gICAJCXJldHVybiAtRU5YSU87DQo+ICAgDQo+ICAgCWlmIChvZl9h
ZGRyZXNzX3RvX3Jlc291cmNlKGFkYnMsIDAsICZyKSkgew0KPiBAQCAtMTgwLDcgKzE4MCw3IEBA
IHN0YXRpYyBpbnQgbWFjaW9fc2VuZF9yZXF1ZXN0KHN0cnVjdCBhZGJfcmVxdWVzdCAqcmVxLCBp
bnQgc3luYykNCj4gICAJcmVxLT5yZXBseV9sZW4gPSAwOw0KPiAgIA0KPiAgIAlzcGluX2xvY2tf
aXJxc2F2ZSgmbWFjaW9fbG9jaywgZmxhZ3MpOw0KPiAtCWlmIChjdXJyZW50X3JlcSAhPSAwKSB7
DQo+ICsJaWYgKGN1cnJlbnRfcmVxKSB7DQo+ICAgCQlsYXN0X3JlcS0+bmV4dCA9IHJlcTsNCj4g
ICAJCWxhc3RfcmVxID0gcmVxOw0KPiAgIAl9IGVsc2Ugew0KPiBAQCAtMjEwLDcgKzIxMCw3IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBtYWNpb19hZGJfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmFy
ZykNCj4gICAJc3Bpbl9sb2NrKCZtYWNpb19sb2NrKTsNCj4gICAJaWYgKGluXzgoJmFkYi0+aW50
ci5yKSAmIFRBRykgew0KPiAgIAkJaGFuZGxlZCA9IDE7DQo+IC0JCWlmICgocmVxID0gY3VycmVu
dF9yZXEpICE9IDApIHsNCj4gKwkJcmVxID0gY3VycmVudF9yZXE7DQo+ICsJCWlmIChyZXEpIHsN
Cj4gICAJCQkvKiBwdXQgdGhlIGN1cnJlbnQgcmVxdWVzdCBpbiAqLw0KPiAgIAkJCWZvciAoaSA9
IDA7IGkgPCByZXEtPm5ieXRlczsgKytpKQ0KPiAgIAkJCQlvdXRfOCgmYWRiLT5kYXRhW2ldLnIs
IHJlcS0+ZGF0YVtpXSk7
