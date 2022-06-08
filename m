Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF44544031
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 01:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPJJ6ZYnz3bts
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 09:56:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=sqtJH990;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f403:7011::81e; helo=ind01-bmx-obe.outbound.protection.outlook.com; envelope-from=lonehugo@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=sqtJH990;
	dkim-atps=neutral
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2081e.outbound.protection.outlook.com [IPv6:2a01:111:f403:7011::81e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHx4l2ztWz308C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 15:44:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJn+xPx8l/p30SZ3FQn/lH0cZ8NUr5gtJr9fAkaO721MoPcpz9PeD2muq47644tsHMckGT+oWLztjlJEIz6TJHNyGyEVLBvmnrV9n5m1IBPT9m6E+wFrwtbz79jfnQunfa0poYBYSNoFnIUuQ/Xysx7ItP65Wz3eMfyG1gBhA261HETFq1XCiUszcuPO6P6iLMuWr4Pdsyy5xFi+KtVL3hBHZ6J2MyEifrwAyLbEPuB6ZcZszTV4UV8yyJJDCw71cJ+Vv58pEla4g5S8fdS+VOMt2rzqaN8BodTaUl7CTzf7HSyevbZ+V6ALaTiVb4kXkSlgLj+qMqSkMxI7HJ24mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w88YdncErhAxF7Kle3Wc2MtUGGXZdQCMNUMP0Air9PM=;
 b=iDfXIcBqbAZM1++dwMDKtKclGTKfaj49g2zK8C9/Ez4y9975Kc+87NwF59yUk/CJgAx4nnjbKi6vr2gKnkxWNuqVn8EpHHqRTeG+4ZIAHobcHhZ7t1e/xB4D/FHOHd4hL0yguYx8STEQkTcT7z6HKxd5qP+0X81c0ay9XBR7hM/8UfG1QG82fz1knyPqQs8JjZ1JK6nYF5zVKtua+CkvrMEuxToLb5g+WnmR+kxXWKqkWVUSyV0actdG7IW3cldwRPQCN0dFRlw81bl+dH6xfR/ok/kdafUA+7CM34jaFzeVLNBX18T7L0SWUqfRpedeaHW3dN2qtCoxtyGY9U+LUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w88YdncErhAxF7Kle3Wc2MtUGGXZdQCMNUMP0Air9PM=;
 b=sqtJH990SVVxFHh1TRLtQ54YUq/Dj4H5AsM7GdznPoxQoc2cRTFhmaJgKIq0Y4IF5ctqHbvw42Ky/Syeo29/NLUqosb/gxaMi5qw6f0o1mdduPG5CJSuylJ53PMKlTibesS1ta4kED0M3FJN7JelA8mgD82qSQdEGWn7iokZVpMy1PcEWr3DPvKPJzg6HxtSHbYeHwNMccHbelKGT6kywASzanSQTLgWffOUgXuCWe95fw2lrNBmmUFAXq8ldT4xRMU6fAYaeI4BDjX/bGM5+/Gyl1l8kfyb/qK72oAUsvFxxEmDOR8V91nkz8JVW1cUBlWDsdFBEVTxhf7wXtrJ/w==
Received: from PN3PR01MB7725.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ce::7)
 by PN3PR01MB7693.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 05:44:14 +0000
Received: from PN3PR01MB7725.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1ac:6386:9aad:ed03]) by PN3PR01MB7725.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1ac:6386:9aad:ed03%8]) with mapi id 15.20.5332.012; Wed, 8 Jun 2022
 05:44:14 +0000
From: wenhu wang <lonehugo@hotmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "kernel@vivo.com"
	<kernel@vivo.com>
Subject: Re: [PATCH v4,1/5] powerpc: sysdev: fix compile error for
 fsl_85xx_l2ctlr
Thread-Topic: [PATCH v4,1/5] powerpc: sysdev: fix compile error for
 fsl_85xx_l2ctlr
Thread-Index: Adh6+YZk352roBR2RFmYTn2vmkG6SQ==
Date: Wed, 8 Jun 2022 05:44:14 +0000
Message-ID:  <PN3PR01MB7725E0F190B3BF6B27202A01D2A49@PN3PR01MB7725.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [PG2sQjOzBqyxeQqjTrPgl+yLRQ5ZsU8b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0919daee-a563-4da1-fa79-08da4911ebd6
x-ms-traffictypediagnostic: PN3PR01MB7693:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lx+iltppsWUzNsIc6/UErtJJGASs4Wh4gwDprFjlPHcEhw1ntID+c+qpUUx5qsYjlhyvT135hJWUubQ8mgtcHgvo2+mmbWFd/9bF54K/znSvEyqlNULse+s9CZZoLBExwUeY55PAYOqlmYHiL32MXbaF7RSYv3L37+7xugjue+//Y599YiXNBfkP5HKgup8EGIRQ4f6HHT87oSPjp2UAkpbSByYNxJfalpJWV95GTgG3Zb4tSmrk7eVD8ZqYhP6MZpZb/IyEQ4nNNlgIFvHxhM5kSJpmdqvKY29TKe5hCG9m9neQkF8BVK0LHgD6HYk88GxO9EvFQKEoN9UVSc/nEVAibAjGorDqv2B4nYvX7JYAVrUeiTc54FLgx7IcekJ2MEswW22coeulwrWW2UIDwkXiHbWSy889pFP08VxoJdMwPuMo08odmPTk1kRZ5i+xrwjUOdffeUGllNkJqSVIULNi6zpbQs3okk30v0b6mdFRRDL086DZGXdUkmg58B/2CgARzMBzO9l/kmLBXvYrYqvr7264s04u6e09wjgR1pqp7ydedGXRVpRTG2HhTg8AGpDd8JeSCWIZnBtqvWCLS4PeWDPvKyKJQKD6Tstxh8AROurWnTePpsDcXf8YtTbJ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SHNESnVtek8vVjY2M29XNlhBdTdyTENVZUJQS2g2UUJPUllzcDVaTFhqRHlO?=
 =?utf-8?B?czdWcUhjZDNmeEdibnlzRlFEZmI3NWwxa3ROQzZidXNFV3RyalJvVHJwZldV?=
 =?utf-8?B?WFlvWUs1Wmdhb0pDM0s3ajZBS0tNbWhaMUlPM1kzL2JFdGN0TTVJcFJOTmkz?=
 =?utf-8?B?NVN3M3Y0dFp3R3IvR010NDJ1ZEc1WnFJa011Qy92OTE3WW9SaEV2N29xeW15?=
 =?utf-8?B?ZUpsb0pHODJ2N0M4eVNiVCtqWFQ0N1Vyd0hYZlJJNzFlKzQ4SWh2WXhuL0g1?=
 =?utf-8?B?MVZkZE1MY0c5NDVzQTgrazYyVThlRmdvUGNGQTg0L3o2Tjd3dFlJQWZ5QkZL?=
 =?utf-8?B?R0dmcUhJcmY5enFQVFN3TWJvRDZKTWdFSGtOblZSSUhqNW1kWE5ndmlUYk5F?=
 =?utf-8?B?d01TTEEzOFczMXRKUUQyN3JDUHZoTHpmYWtnQmZRUEQ4UzAwTkNUSTRJRERY?=
 =?utf-8?B?VUtOaFNoOUF1b1FKMCtURFdwNi9QYXd2UDMva294QVd4MSs1YkRubWpCZS9a?=
 =?utf-8?B?OEh3SS9wU2JEV1dmRU41YTVreVMwQUpVblFuWHJwdGZ4allqbUJ5ZW5vZmZL?=
 =?utf-8?B?bnNYMHdkVFpNUzJLazRKbzl4Vzgvc3l4clg0U0tsSUlJV0xyekJFSVpCTDlo?=
 =?utf-8?B?S3Z6UEdHQUlOZG1YcHdra3V2VzBTN2lmMnpLTWc3R3F4Szd0RVM0NFlnWkYz?=
 =?utf-8?B?OHRqYzN2bTBHODE3U1BubmtHVmRaYkN4SlFWczhob3VBRSs3ejh5UEpGdEdU?=
 =?utf-8?B?NEpWbDZGcDlKcGZmdXdoMy9ic1dMc3B5cVBzK0dEU2VBZkNHVlBEbzlEdkxT?=
 =?utf-8?B?TndCaGZPTXdzRjlhcTVjZWVsYlRhbTN0M3lzWVVUaXlhZ1QzUXYydzFvaWtk?=
 =?utf-8?B?S1U2b0pQQk5kKzE4eHMrT3QyRmsrYTZiR1p1SlppVW1RWVNJYnN1cXZZK1I2?=
 =?utf-8?B?cmNaU3pUM2R2eHFwQzl3cnBXMkpsNVdLd1lhaVlUOVAyY05DSm94REYrZHhS?=
 =?utf-8?B?M09Zc2paUExLS2RUSWxjbExNWFloNmVDSWxjWTNUUTZpZmt1NXErbXpkdUFZ?=
 =?utf-8?B?UnZ3dWJWUXVwVmVOSFVRUzh2dmtzMlB0UmVJbVdvekx0MlcvaHpNWEd4eFN1?=
 =?utf-8?B?QjBsUmozdGxlMm9tcWZYS0VjQXVoS1JJc0RwYUxmN3hlc3FHMTA4dG8wdjRK?=
 =?utf-8?B?d2N2TUMySG96OURrYlorc2N5RFJXYXlKbDV0ZERZTitoc3dGM1pkWGV6czZl?=
 =?utf-8?B?dUpXcGpRVUo0YUxPb1ZlaGYzYjU5dUxzdm8wbkpHWTFiV2E5OGhQSkxqMTZv?=
 =?utf-8?B?dVlVbkxuSFJySFVTUERMcDB2bWtuWXJYNnVUU2wwa2JDWm1kZ1BKckhMTlZR?=
 =?utf-8?B?MUtwQWFyUWx6d2xiVHljSGIyMUVXRU9hOVd2eVdMY2M1K0wvV083ZTVPWEpw?=
 =?utf-8?B?Y2l5NElKMTFWNVRhc2cxbWRmL1FpK3c2UVZ1aGdlOWE0K29kT2V2L3hMRmg2?=
 =?utf-8?B?YXE2UWduM3FtL0g2Zkp2WnhuZVJXSnhRdlNOSVlEMzNWWXpwSVJkcEptMUI3?=
 =?utf-8?B?ak9RcDhVcHUwaGoyUEhQL08xSWd0LytJVmoxWGVKK0JKTDBYOW1IeVpUZ2E1?=
 =?utf-8?B?T21TSUxoYUNLZFpXL0NkUHl5YTUyYXVmU0F0NVd1WklEV2hhQlY0M2U0WTdT?=
 =?utf-8?B?Z1IzQUc4RzRXZUxydVBNSHJNTjZ2OEhBNnJ1N2NHVlh6YVJvQUdiWkt5c1Np?=
 =?utf-8?B?WWp2NlhnczFJL2lVSGNZS3RiTFVlR3RQNzNPQnlwTURyekw2cDhES09NaHdv?=
 =?utf-8?B?aDFmcVhJNzZmd3A2SW9vRU42cnVBMXZHVThGS05ENFhPVGM5Q244ajFpTWtJ?=
 =?utf-8?B?b2UyZkVhalBMU01uem8rWEpxK2xFcmg5NWRrSkxOL2V3anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-42ed3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7725.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0919daee-a563-4da1-fa79-08da4911ebd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 05:44:14.6196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7693
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gDQrlj5HpgIHml7bpl7Q6IDIwMjLlubQ15pyIMjjm
l6UgMTU6MDMNCuaUtuS7tuS6ujog546L5paH6JmOIDx3ZW5odS53YW5nQHZpdm8uY29tPjsga2Vy
bmVsQHZpdm8uY29tDQrmioTpgIE6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgU2NvdHQgV29vZCA8
b3NzQGJ1c2Vycm9yLm5ldD47IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT47
IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPjsgbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmcNCuS4u+mimDogUmU6IFtQQVRDSCB2NCwxLzVdIHBvd2VycGM6IHN5c2Rldjog
Zml4IGNvbXBpbGUgZXJyb3IgZm9yIGZzbF84NXh4X2wyY3Rscg0KDQoNCg0KTGUgMTUvMDMvMjAy
MiDDoCAxMzo0NSwgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0KPiANCj4gDQo+IExlIDI0
LzA0LzIwMjAgw6AgMTA6NTgsIFdhbmcgV2VuaHUgYSDDqWNyaXTCoDoNCj4+IEluY2x1ZGUgImxp
bnV4L29mX2FkZHJlc3MuaCIgdG8gZml4IHRoZSBjb21waWxlIGVycm9yIGZvcg0KPj4gbXBjODV4
eF9sMmN0bHJfb2ZfcHJvYmUoKSB3aGVuIGNvbXBpbGluZyBmc2xfODV4eF9jYWNoZV9zcmFtLmMu
DQo+Pg0KPj4gwqDCoCBDQ8KgwqDCoMKgwqAgYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfODV4eF9s
MmN0bHIubw0KPj4gYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfODV4eF9sMmN0bHIuYzogSW4gZnVu
Y3Rpb24NCj4+IOKAmG1wYzg1eHhfbDJjdGxyX29mX3Byb2Jl4oCZOg0KPj4gYXJjaC9wb3dlcnBj
L3N5c2Rldi9mc2xfODV4eF9sMmN0bHIuYzo5MDoxMTogZXJyb3I6IGltcGxpY2l0IA0KPj4gZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYb2ZfaW9tYXDigJk7IGRpZCB5b3UgbWVhbiDigJhwY2lf
aW9tYXDigJk/DQo+PiBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+
IMKgwqAgbDJjdGxyID0gb2ZfaW9tYXAoZGV2LT5kZXYub2Zfbm9kZSwgMCk7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9p
b21hcA0KPj4gYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfODV4eF9sMmN0bHIuYzo5MDo5OiBlcnJv
cjogYXNzaWdubWVudCBtYWtlcyANCj4+IHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBj
YXN0IFstV2Vycm9yPWludC1jb252ZXJzaW9uXQ0KPj4gwqDCoCBsMmN0bHIgPSBvZl9pb21hcChk
ZXYtPmRldi5vZl9ub2RlLCAwKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+PiBjYzE6IGFs
bCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPj4gc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDoyNjc6IHJlY2lwZSBmb3IgdGFyZ2V0IA0KPj4gJ2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNs
Xzg1eHhfbDJjdGxyLm8nIGZhaWxlZA0KPj4gbWFrZVsyXTogKioqIFthcmNoL3Bvd2VycGMvc3lz
ZGV2L2ZzbF84NXh4X2wyY3Rsci5vXSBFcnJvciAxDQo+Pg0KPj4gQ2M6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+PiBDYzogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4NCj4+IENjOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGMtcy5mcj4NCj4+IENjOiBTY290dCBXb29kIDxvc3NAYnVzZXJyb3IubmV0Pg0KPj4gQ2M6IE1p
Y2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4+IENjOiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZw0KPj4gRml4ZXM6IDZkYjkyY2M5ZDA3ZCAoInBvd2VycGMvODV4eDogYWRkIGNhY2hlLXNy
YW0gc3VwcG9ydCIpDQo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjLXMuZnI+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFdlbmh1IDx3ZW5odS53YW5n
QHZpdm8uY29tPg0KPiANCj4gSXMgdGhlcmUgc3RpbGwgYW4gaW50ZXJlc3QgZm9yIHRoaXMgc2Vy
aWVzID8NCj4gDQo+IEkgc2VlIHRoZXJlIGlzIGV2ZW4gYSB2NSBhdA0KPiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0xNzI0MjEm
DQo+IHN0YXRlPSogYWxsdGhvdWdoIEkgY2FuJ3QgZmluZCBpdCBpbiBteSBlbWFpbHMuDQo+IA0K
PiBJZiBzbyBkbyB5b3UgcGxhbiB0byBzZW5kIGFueSB1cGRhdGUgb2YgaXQgYXQgc29tZSBwb2lu
dCA/DQo+IA0KPiBPdGhlcndpc2UsIGFzIENPTkZJR19GU0xfODVYWF9DQUNIRV9TUkFNIGlzIG5v
dCB1c2VyIHNlbGVjdGFibGUgYW5kIG5vIA0KPiBkcml2ZXIgc2VsZWN0cyBpdCwgSSB0aGluayB0
aW1lIGhhcyBjb21lIHRvIHJlbW92ZSBpdCBjb21wbGV0ZWx5Lg0KPiANClRoYW5rcyBmb3IgdGhl
IHJlZmVyZW5jZS4gQXMgdGhlIHY1IHNlcmllcyBmYWlsZWQgdG8gcmVhY2ggYSBhcHBvaW50bWVu
dCwgIHdlIGN1cnJlbnRseQ0KdXNlIGl0IG91dCBvZiB0cmVlLiBJIHdvdWxkIHRyeSBhIG5ldyB2
ZXJzaW9uIHdpdGggdGhlIHdob2xlIGRyaXZlciBpbXBsZW1lbnRlZCBpbiBVSU8gbW9kdWxlLg0K
U28gaXQncyBvayB0byByZW1vdmUgdGhlIHZlcnNpb24gaGVyZS4NCg0KQ09ORklHX0ZTTF84NVhY
X0NBQ0hFX1NSQU0gaGFzIG5vdyBiZWVuIHJlbW92ZWQuDQoNClNlZQ0KaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcG93ZXJwYy9saW51eC5naXQvY29tbWl0
Lz9pZD1kYzIxZWQyYWVmNDE1MGZjMmZjZjU4MjI3YTRmZjI0NTAyMDE1YzAzDQo=
