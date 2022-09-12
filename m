Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 007315B539D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 07:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQwSX6fhZz3bmC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 15:41:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=potUDjyz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.52; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=potUDjyz;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120052.outbound.protection.outlook.com [40.107.12.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQwRq4cqNz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:40:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M45fYkS+rXTyhCAKwH2psnS9NpDbZHwgu/pNYtQqgYmd5Ykv1mcqClGebdYU7GhiDllA26ofmBcLcQwMV5in0DujSK7r9puC6fxJ+cceBmB+BcK/Liiw9ZwF011P4fhPCCFHhIbIlRCdTr8moViAoCVz+NSQfP9nw16MRp3sk2fh5OqzlLzdw2DStkT0t5dcHCQrJG4nISN0wCQembvgXpO+Xq7iXmgRE6oOu9eI6KntNv41z9SNxtDCjct5oHc6apPT+wuqqJk99AYTjYkcb/fqk2L5NNBkEN1H4efsj2syHcj28IDeHRDwazj0lylnrIJfB36UU0lLMe1DTEz/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+QvkNmqcMQ6CqTvww9D0iGbHbP133UGs00BPTZa/LA=;
 b=GUMJ6WMkx13o4sOFrWRHlbIWFrdEN+716JWIECM7OjpRTiiG99RpcjUnJuGequoK5ZT4wyGDs2U4Eo7f6gvI5fNGePAfAkCu8sgoD4WFktCn97hLpIeH/AW8rF4TXeLuoYqHfJGzvgYmFQFcFy3MnEOusBhDTWBav58XLXNksc16D6iitpnjrxiaWDg+E+6s5pS2nHxSLST1vZtR6CaiUcbZaUgMqpDxRyxM78j8ipaFq9J99xEDkFYn1iP7utpHmnsJpokhdqYQ9dc13qainJhrAw2Q8Qdmca9DJLjHUntqOvJv2BOMwvt7SgmFduVqS6GxTppwZrS0RBoUeeDfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+QvkNmqcMQ6CqTvww9D0iGbHbP133UGs00BPTZa/LA=;
 b=potUDjyzU3leST/lAVlCcBwRqZM1NrHYgxg1U9VbTXjnndeVRdnx77yzEUo7V6cX3kxkD5o0Ar2/8xeqJNg7l2j52Ncgf5C8s+2V6zyL6BKm/ujZrya3a3Lo0Xvc0O/pFcI1LUDYHVbUzd4aXm3DTPIK9i5tTPsC8/khFMDK881Za2xfVar+qf31GMHrCwJ9IBFEQ5WJtNX+Qy1ZN16STgAZdYdA914Tp4y3YxhZhPZdLnqW4yUBqmb1s7TeJl4Bh/tdwi5sInewb9kiVZN/v4g1xwpOaTpKFutYv8K1z87b5yUane8uxHj11oPO+fKXs6FzfZWT7PLgZHdBwdbArA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2347.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 05:40:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 05:40:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHYxknSyZE2k04Z8EWLaX7wGvxwMK3bR7WA
Date: Mon, 12 Sep 2022 05:40:19 +0000
Message-ID: <91881012-0d3c-c072-2d07-6513b00e7bca@csgroup.eu>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
 <20220912014703.185471-2-rmclure@linux.ibm.com>
In-Reply-To: <20220912014703.185471-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2347:EE_
x-ms-office365-filtering-correlation-id: 7df8d097-4df5-473e-5dc9-08da94814756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MLJxlmN9RNYhGavM8dQaUZCXBnW2QYP94hhLDpCvpGU1ggtsoEnyoz9hQW2wUnRIL4iXbypH67g1C7Sgvhr4sRjpnDoLAqXs5T1D5kG2L/zNADpWd45Ce2ttwCx358JIHSPfS8Fn4zv9p3K0c7yGnnQ66flfEL13We5waWcew/KrHuFPyTpW53dJDI3OS69bHmlaOGrHpyK+gBMZS9OriXS34dmU1oItIrhJZz1s14zPgoY5avYxfVcdjU1RvIOdXW/QJYhEb08VRKe+d6WZIjs8T0RW9z8W5LxbM2TJD/noIV97gGj2Ixu5qNmjRBMs0iGKQ7vlopwbTLsO0bnbgBK+GPXAsyC3Ml0BPI71kxgzwr5pxn5vAOiPoNa+csY4BGgc9mXemKMwFr8UO8Sk1AQ5/szRWeQR9BB+QP9adswnx0CB/3ytDVIwIhK1td/YCZAxxQlOBeIKoGIKf4w0Qus8lsRbFirYetAbnzUPd3gwhst6HnP8Mw15GKPcr3DHyI+fq8AL9dmqYE8aotcgf62Pwj3LAqGYV+0+gD/4JpcwXFsQu1JDtpclle1KbbBzGYP2dyLr6iTaKuuy5YoVVcRd73Xvi4S4W9gdrzs6QUNqbSuVpStJ91ozcyrnPmOWZH3UxYYATy4xG8oo5XAoNjdLgwbk/yg7sXOAF03SDFyDk23f+eEZ5O2qGdHlc5YJI4aEo/Hfl00laXj6+rix+0LE4tfjTWJjD0mIpXKllpafnUz9cYA2N+HA7Y0vIetJJZyv9U/+WrimfX+IyoM+t/rHbsOkbL/ghZhpc5xYQieNqf1220figVJoeNRzqzZBnCjHWVTw4NOslzL8f13r3aIhuC/tEczqJJ1AZw+f1Vc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(83380400001)(26005)(122000001)(2616005)(66574015)(186003)(86362001)(31696002)(6512007)(38070700005)(38100700002)(66946007)(66556008)(66476007)(66446008)(8676002)(64756008)(31686004)(91956017)(76116006)(316002)(36756003)(110136005)(44832011)(2906002)(5660300002)(8936002)(6506007)(6486002)(966005)(41300700001)(71200400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d0V3blFwRmlHZk5QTjNYNEZIcEQydmsrNSt6U3FKNWs2K2NlNm9zOGMvZXpP?=
 =?utf-8?B?S1ZmTmJ1VEUvcE95dithQXEyQ2VOam8zNzdOSGpLRXVNUDRzL2J6MjUzdjJ6?=
 =?utf-8?B?cmR5bG9ZUmlzSUFaeDZPdzdqSG9TWE8rRDJJcEYyQWFtOFZTMFJ1VTlaUjhx?=
 =?utf-8?B?NG42MmVsZlo5dFBvOGFiZDR3enJhY2JyZWFoMDRmOGo3UEd0TEJLb2NvTE4w?=
 =?utf-8?B?Z0xGdzIvSDdXcDRvbWxiemtjc1FNMTk3NFFJVDZHdVpRZUhrTU9rcjN2eVR0?=
 =?utf-8?B?VFA3RXNVWmFxd2hBNEY1RVVrZnNRd2tza002WlVScndjMDJqQ1ZVb3A3WGxZ?=
 =?utf-8?B?TEJSZW9udzBNSGtJYkl1R1RNTnZGOFI0U09QNUt5S01VRFViWjcxa3R2SUJF?=
 =?utf-8?B?dFdWNlBjL2lEQTBMeEpobVU0WmgwZ0dMcXYrVG1Mb0VoRytoRVNuMzZNaEJu?=
 =?utf-8?B?Y2V2YTJ2alFnenVmMjV5QmwyWm05TmFqd3lMSjlZUWxLRk1VVEt3dzZ0MEdO?=
 =?utf-8?B?ajdRZGZDTmIzMVdtV0padzhQa1I2WThDdGdUd1AzNVJTVXN4ejVraUtPY1By?=
 =?utf-8?B?bUpwS2xQNEd5ZzhJNzhEZTB0WlgralkyMHJrK3FwWTl6ODk1dktnUmg5Y2hH?=
 =?utf-8?B?eWNiY0hRVGVGMnNXajZBaFJtYTR3aTJqZUp5Sjk0VHZFVk5BYmhpbU9WcEU3?=
 =?utf-8?B?MmVKeVpGZVpTaGtvTFo0WXpBN3hMUHFXcnVnQW9KamtPa29qYUJjNmN3bjZK?=
 =?utf-8?B?RllhMTcwU3pwaTBuM0d0QlBVeVkvOGJBQ0ZyU3d6ekdYRmFNS2orVHAxdnVS?=
 =?utf-8?B?MnRqYWdvbW5ickgwVkVEQ0NmZytyWUhTR1BVa2tkNWlDRWdNQlE5T0F4Q1dM?=
 =?utf-8?B?dHlhZTVsSmEwWXlJSlBVR0QzVit5d1FaWlQ5WkhsZno4eFkyUkd6M1NqUFB5?=
 =?utf-8?B?YVRLMTJPaEdKVkpkRmxLSFhjcDBqT1VhQU12VFQ5WnlTSkFEdTBBbXp1NmJh?=
 =?utf-8?B?d09CU2tjaU9YaEt1U0g0blBRdlplMUZNZmJ4alVndE1STk84MmJid2oyZUt6?=
 =?utf-8?B?U1RFYlNZSXQrcTljRVpWNUh6L3AvcmtTR2dtMjdScldXSGNmTHZwcXJoRWdU?=
 =?utf-8?B?TFp4d1RhYnJvNkF5czRVQTk3ODhkODQ5MlZ3UEE1TkwxbGNHUGJBUjl0UlZ1?=
 =?utf-8?B?b3NSUmRSR2hjdFJvblVjTHlHZnNJenpZQWF0dTI2T2NUS05VYXM1M3cybVMz?=
 =?utf-8?B?b2dLbDIxMG1ydjNsckc2dTZoRXRDckZnRE5JSHVXUzRraHlMRjFIVUdBQkhD?=
 =?utf-8?B?dGFUZForT1JZejZWN2p2UFdUT2JGNVFVdEVHN0tMTWR1Ym8ydHZPdEFsT2dK?=
 =?utf-8?B?R0NyTlhWdTFTeldmTzZJME5yb2daZTdack9TSldaSStmckxPdU1zcVYzcE1a?=
 =?utf-8?B?cWcrQjk1RWJVNGx6SnhhYVZhVjFVb3QwRlkyampoMy9zcjZOUHJKNjNhN1gy?=
 =?utf-8?B?OHB3SUp4ZnRreXM2WGpZeEY3WUJ3c3RmaFBXL0JnbU5ZTlphMXQveUZMNUJi?=
 =?utf-8?B?ckk2bjVCa0p5S3hGbnNqT05pZkVNZjY3bzhXMWxXUzIwUzl3blFHRFF3bUtG?=
 =?utf-8?B?UGw4eE5udWlKa3ZzTzNiMnFjT2VReHJVTURWbUswMlJGTnNydGdva1UwNWNH?=
 =?utf-8?B?eGlzLzVKOGhxaUpnTCtieVJsU1ByOWcvNnNBd1VUS2w3c0wySTlrK3Buc2o1?=
 =?utf-8?B?Q2NPK3A0RkhIS0RFN0ZDQUhSSnpGcEtjM2drbEcvVmZ4SjZzTXVMN0paVXRh?=
 =?utf-8?B?TzBwSUJESkoxcUw2NnJwanpFdnA4VkFhcG55UUtEUEJQNXFzaFI4Vm13VGRW?=
 =?utf-8?B?b1dQeXIyVXJxRksxaFEyQmQ4U1ZtQkVSblViVW83ZTRWcFdLcUFlRkp5M2Ja?=
 =?utf-8?B?c3lUVldCQW9IbEpRV0ZzaHNWanArZFowMzFmWStHMlZZd0tnWkhrYWlJaEJR?=
 =?utf-8?B?aUxVUFBpSGx1cjVyMmR3eFRIK1pjaGNEa29ZbnFRRHZQUERiNTVNdy85Mm8w?=
 =?utf-8?B?ajM1Z2dnT0Z5TW1EZ1lqUHd1d2pEVncwcG9ubHBoZmJWMDlubmczN3pUN2pH?=
 =?utf-8?B?V1lhRlA2Q044VU53Zi9ORVRraERUN3RZYXhDUlpVYkRKWlF0OUdFYVhHeDNE?=
 =?utf-8?Q?P8ks86dkm5PqDNJDgeVHUJ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0E4783C06857A4E933DBCEA1EF2FED8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df8d097-4df5-473e-5dc9-08da94814756
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 05:40:19.4412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Ghq6GtgRH+w4T5k2jOnAq2xYiv/MYPr89fTlSb81afsyum7aFz/ORlcKiiRRunf+0Rtn+7UXgU7ZKSfK9XbRolDQygvufGIgCUJ/fkMzy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2347
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjIgw6AgMDM6NDcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gVGhlIGhlYXZ5
IGxpZnRpbmcgaXMgZG9uZSBieSBwdGVfdXNlciwgd2hpY2ggY2hlY2tzIHVzZXIgYWNjZXNzaWJp
bGl0eQ0KPiBvbiBhIHBlci1tbXUgbGV2ZWwsIHByb3ZpZGVkIHByaW9yIHRvIHRoaXMgY29tbWl0
Lg0KDQpOb3QgaW4gdGhpcyBzZXJpZXMgaXQgc2VlbXMsIHNvIEkgZ3Vlc3MgdGhhdCBjb21taXQg
aXMgYWxyZWFkeSBpbiB0aGUgDQp0cmVlLiBDYW4geW91IHJlZmVyZW5jZSBpdCA/DQoNCj4gDQo+
IE9uIDMyLWJpdCBzeXN0ZW1zLCBwcm92aWRlIHN0dWIgaW1wbGVtZW50YXRpb25zIGZvciB0aGVz
ZSBtZXRob2RzLCB3aXRoDQo+IEJVRygpLCBhcyBkZWJ1ZyBmZWF0dXJlcyBzdWNoIGFzIHBhZ2Ug
dGFibGUgY2hlY2tzIHdpbGwgZW1pdCBmdW5jdGlvbnMNCj4gdGhhdCBjYWxsIHB7bWQsdWR9X3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlIGJ1dCBtdXN0IG5vdCBiZSB1c2VkLg0KDQpQbGVhc2UgcGxlYXNl
IHBsZWFzZSBubyBuZXcgQlVHIG9yIEJVR19PTiwgcGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIA0K
ZGlzY3Vzc2lvbiBhbmQgZXNwZWNpYWxseSB0aGUgcG9zaXRpb24gb2YgTGludXMgVG9ydmFsZHMg
Og0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FIay09d2c0MEVBWm9mTzE2RXZpYWo3
bWZxRGhaMmdWRWJ2ZnNNZjZnWXpzcFJqWXZ3QG1haWwuZ21haWwuY29tLw0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDM1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDUyMjE0NWIxNmEwNy4uOGMx
ZjVmZWI5MzYwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTE3
MCw2ICsxNzAsNDEgQEAgc3RhdGljIGlubGluZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpDQo+ICAg
CXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcl9h
Y2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlKQ0KPiArew0KPiArCXJldHVybiAocHRlX3ZhbChwdGUp
ICYgX1BBR0VfUFJFU0VOVCkgJiYgcHRlX3VzZXIocHRlKTsNCj4gK30NCj4gKw0KPiArI2lmZGVm
IENPTkZJR19QUEM2NA0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX3VzZXJfYWNjZXNz
aWJsZV9wYWdlKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlyZXR1cm4gcG1kX2lzX2xlYWYocG1kKSAm
JiBwbWRfcHJlc2VudChwbWQpDQo+ICsJCQkJJiYgcHRlX3VzZXIocG1kX3B0ZShwbWQpKTsNCg0K
VGhlICYmIGdvZXMgb24gcHJldmlvdXMgbGluZS4NCg0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkNCj4gK3sNCj4gKwly
ZXR1cm4gcHVkX2lzX2xlYWYocHVkKSAmJiBwdWRfcHJlc2VudChwdWQpDQo+ICsJCQkJJiYgcHRl
X3VzZXIocHVkX3B0ZShwdWQpKTsNCg0KU2FtZQ0KDQo+ICt9DQo+ICsNCj4gKyNlbHNlDQo+ICsN
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocG1kX3QgcG1k
KQ0KPiArew0KPiArCUJVRygpOw0KDQpDYW4geW91IHVzZSBCVUlMRF9CVUcoKSBpbnN0ZWFkID8N
Cg0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHB1
ZF91c2VyX2FjY2Vzc2libGVfcGFnZShwdWRfdCBwdWQpDQo+ICt7DQo+ICsJQlVHKCk7DQoNClNh
bWUuDQoNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gKyNlbmRpZiAvKiBDT05GSUdf
UFBDNjQgKi8NCj4gKw0KPiAgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8NCj4gICANCj4gICAj
ZW5kaWYgLyogX0FTTV9QT1dFUlBDX1BHVEFCTEVfSCAqLw0KDQpCeSB0aGUgd2F5LCB0aGVyZSBp
cyBhIGdyZWF0IHRvb2wgdGhhdCBjYW4gaGVscCB5b3UgOg0KDQokIC4vYXJjaC9wb3dlcnBjL3Rv
b2xzL2NoZWNrcGF0Y2guc2ggLS1zdHJpY3QgLWcgSEVBRH4NCkNIRUNLOkxPR0lDQUxfQ09OVElO
VUFUSU9OUzogTG9naWNhbCBjb250aW51YXRpb25zIHNob3VsZCBiZSBvbiB0aGUgDQpwcmV2aW91
cyBsaW5lDQojNDM6IEZJTEU6IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6MTgz
Og0KKwlyZXR1cm4gcG1kX2lzX2xlYWYocG1kKSAmJiBwbWRfcHJlc2VudChwbWQpDQorCQkJCSYm
IHB0ZV91c2VyKHBtZF9wdGUocG1kKSk7DQoNCkNIRUNLOkxPR0lDQUxfQ09OVElOVUFUSU9OUzog
TG9naWNhbCBjb250aW51YXRpb25zIHNob3VsZCBiZSBvbiB0aGUgDQpwcmV2aW91cyBsaW5lDQoj
NDk6IEZJTEU6IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6MTg5Og0KKwlyZXR1
cm4gcHVkX2lzX2xlYWYocHVkKSAmJiBwdWRfcHJlc2VudChwdWQpDQorCQkJCSYmIHB0ZV91c2Vy
KHB1ZF9wdGUocHVkKSk7DQoNCldBUk5JTkc6QVZPSURfQlVHOiBBdm9pZCBjcmFzaGluZyB0aGUg
a2VybmVsIC0gdHJ5IHVzaW5nIFdBUk5fT04gJiANCnJlY292ZXJ5IGNvZGUgcmF0aGVyIHRoYW4g
QlVHKCkgb3IgQlVHX09OKCkNCiM1NjogRklMRTogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Bn
dGFibGUuaDoxOTY6DQorCUJVRygpOw0KDQpXQVJOSU5HOkFWT0lEX0JVRzogQXZvaWQgY3Jhc2hp
bmcgdGhlIGtlcm5lbCAtIHRyeSB1c2luZyBXQVJOX09OICYgDQpyZWNvdmVyeSBjb2RlIHJhdGhl
ciB0aGFuIEJVRygpIG9yIEJVR19PTigpDQojNjI6IEZJTEU6IGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmg6MjAyOg0KKwlCVUcoKTsNCg==
