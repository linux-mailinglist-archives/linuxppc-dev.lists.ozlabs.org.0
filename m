Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B42D332
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVL4T3Cmdz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 18:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=40.107.9.72;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90072.outbound.protection.outlook.com [40.107.9.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVL401BxLz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 18:04:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkzVJ6uwYdYG9zo8Op88C7IquhN1ZSuHcn4rhnhE1av1tYvSaQ+OTxKsscjafikrXI8HbzNP1zt3xqbcOoNwkw6TD7FXLIhWwP8ZHN49sGaBOqQj5cDdLXv8qzT6BnCMGnIGawR+3fLmJIjh/SctimTPdXruv492lcwtoUiA+5bfoApjWhTIuIsXVqc5ccHpeOFhCbPkKJPmJg83EYY5uhXZ8DBm/7fm7Ty4q8O4yb7akN9Gw8y2CJHROeuANHzCrqW1jH9EDohdy8xZinm/uH31xCNCoY7gJihm4+gGZNEKvUPo+uiTUdKtf9aMefin2V4JycpL+zC8Mw+ENyriYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/SZzNJNGadjh+8x35ct8i/PHFxQ954/tq/O0MMbVsc=;
 b=kYEB3Xr83IXgLV9ocF3WpQSLyj0AwjECVU9AdNjJ2eLNM2KAkaYJL4E+fsSmxYSua+StxnmoYKaEorxDvL2TMi+tfbxIy2Ltka8gJDTvumj/CE5K4bPClQ6VmnBzwMQ4S19vBNr7Kx/8wo+trssL014rEEJJAj8UGjjuywArW3jIZvwelLS+G3N1j3JkKYqS9eB7jeO00FWtmA9/0rGQM383+N+er6NYFWTf7TZabWhSd1WBKqG+1jSShbkdDjHtnNCbNcHNpI+hxZHxY4qsAhxJtL5Ua3qbprZ12TPOUPVFMOPd3qhESQDOTK3qZ1zXfGBwgbb8+BUnr9m5infgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 07:03:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 07:03:52 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64s: Default to 64K pages for 64 bit book3s
Thread-Topic: [PATCH] powerpc/64s: Default to 64K pages for 64 bit book3s
Thread-Index: AQHXwIqRbXj2pBhuxEuJx3nyPE9pi6vSEjOA
Date: Thu, 14 Oct 2021 07:03:52 +0000
Message-ID: <e738798a-7b78-d598-0e6b-507e12712727@csgroup.eu>
References: <20211013233133.728484-1-joel@jms.id.au>
In-Reply-To: <20211013233133.728484-1-joel@jms.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fde0022-64e4-4220-766c-08d98ee0c7ce
x-ms-traffictypediagnostic: MRXP264MB0039:
x-microsoft-antispam-prvs: <MRXP264MB0039799833D645096E03381AEDB89@MRXP264MB0039.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lm1/zQXAc3duqiy4NVurwaf155BOCVMfdPyYjl+8e6aE2DlcZ/Bpi20fsCNqakuLhhnJIIX8wgyODhyHezVTc1yphAYGy+aI1aIfHkGVrTUgzGtHe0+BMyyv3boafSvy8iBZA36o1nc2VWNnyULuBDTipNtCDSTnM6O6qJWdf/xwFapblN082oz5J7X1mDoCLdNibetYS+ALnOoc/cRMBE8CnOrtnx93jcoe3x8pWPt8o/5yB/Q04X+U5su3XVEWvVvUsMlXVYS5FYLzo7tFcfBTk7cdPzlHzHUA7WOKDcmI0nggs1aAni4Zqc/9QdaubNA3b1O/wQ9mB9z7YgEnUSJuhWO9YWzBBRdPzCtIHBf1pE96+8GkCgR1Zd58w5UGlsZRpW9TsPGcO2TJ1qWrwA3TF20a6LwWlW7ML8Wr6RPAwPXTJLiFZT+9IdeRjSvtAAl3XvR2c7fcjJLxDwNHHKJaR2tHbt+9W9e3Sj5qSJtGEV3pe6BScFjMicKLYWhfR5J/rFEfhaQpPzu6YjaWaw5m9zlQzhFEiid550qZzCqjjNwQgrnX/G8+BH6QvOQ0m4ISKk0MiiMX+GxoOAGsOx7YsLOou2EbvN8WuaIeU9wFLP0BbZrJhaJmOWAUKAUM5QQSnVOvmUprmVCf3fgt08yY8aMc8CSRChmrEYT3OaxVkpSOm6Jcb7HK/33rOTQkq7lJqInuVDgX6I/OkAP6RLBqusWdbGIq23srwdTtBwnygV8lKkgjes+0loK4fQe2/BLP9nJY6Ie6i+NkYEBCno6c3DeKGj14LXZiHNAXYxHdfyKqTIhp8/hkt8qUa2+hNvemb6YuWu9wTssaZR7ii2rLNBjo3vkca5F3fHBo12A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(186003)(76116006)(966005)(316002)(38100700002)(6512007)(64756008)(2906002)(31696002)(508600001)(91956017)(6506007)(110136005)(66556008)(8936002)(122000001)(26005)(66946007)(2616005)(36756003)(6486002)(8676002)(71200400001)(31686004)(66476007)(5660300002)(83380400001)(38070700005)(86362001)(32563001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEVWeXdJazB0R255Y09DeDdYQUxscVNyV0xTeS9zRG9MUUUzZnIrTm5ORnVG?=
 =?utf-8?B?WkxYTDJGM0xvUWhkNmJ6bjMyOFJXL0h6czh5L0FCTTF3aXBuakNoSGJva2Nm?=
 =?utf-8?B?a0ZuMkM4NjlDMU1YZTRySEdNSXRQQUE5ZnRINzk3RUpqdDZycGdBZmY4eHRz?=
 =?utf-8?B?Zm5RSUMrb0gvTUhEVTRGM0dOdU9xbG0zWEt1YTZnMENaMkRoMWZaWndSUWtB?=
 =?utf-8?B?RlJ5djcxd0E0a1BQenVyNEFkRW0yZVJpLzhXWUNhM1c4blpzSDV0YitIdnVn?=
 =?utf-8?B?MWxIZ2xXVFNuS0dKUU4rZytVUHcxejQ4eDJmWHdnMm5hckFKakk4MzFNZnNO?=
 =?utf-8?B?V0d1OUVad3hCOUx0MEhtWUhjazN5VEpWRU9vTk5JMmNwcHM5Zm5HeXBkb01T?=
 =?utf-8?B?eUY0aHNXS1pMWkcvcWExbklEWSt3b1dNdGp3Y3NJRmxCTDNwVHFIQnNxOFpP?=
 =?utf-8?B?QWd3ZEcyZmwxRFR6NFB2QWpEOG9UaGV4S2JDMkF5L0Q0UzVUQXgvUy9QNFB0?=
 =?utf-8?B?ZWNENDVzV0ZRdExNZERrUkF5VEpBaGg1YkZNTExoZVlWVVlNUlNxeCt0ZU1l?=
 =?utf-8?B?WU5HZ3hjZmRzcHAxZDhWMUM5SWxja3dzbzUzNHVqdTVvcllEVWhCWFh6bkhQ?=
 =?utf-8?B?REZjRWhpOFNxeEN2bXJTMEhDZ2tiQUlyWnlsQ2tqbk1qV3hiMVk0NTlTaFBr?=
 =?utf-8?B?c3JvWkZLV2FVSnJGNVllQ2h1UFFrS0Nza1UrUkFWTG1HMDFUYytpYVVCbDhL?=
 =?utf-8?B?NWxBcVdhUzRGbTFHdUk1cUN6Q3liOHBRbTJIeGhZOEZxOEFydmNRakh6Mmd6?=
 =?utf-8?B?NlEwUWJ0VXpLRVRxWVpZN1A1L1FUMGtTZnQwcTVxUTJyYUdmdVlZd2l4NXhx?=
 =?utf-8?B?dTU2U0xuMWpQQy9UQjlNM0JhVUJSbmllbUhwazEwVy9udXJzbWtTcFFRR3JF?=
 =?utf-8?B?NkpneVlhZUZ2T1dUK0JvVTdvVmgzMnhUaE5Xb0tHWE9NVU1YZlliZnhLTUJp?=
 =?utf-8?B?dWREbmRLZGtUUzJURDZLdThzMi9rWlY5N0ZxWkN4dFB6VldHQ2E5ZzRXT2tN?=
 =?utf-8?B?WVVKNUxsZFZsTVZDWEZrMTNWWnBFeHJqQjBSNy81RU43ZEZzc2hoaFF3TzJ2?=
 =?utf-8?B?Wm9Gc1QyRTRER2QvckhRU3lvSHNZM3grK1dZOWdEalk1OEVadWVGOEVjYU1O?=
 =?utf-8?B?VG9KUkxnLzJKWXZib0tpUkhJVEtOb0lvb0NHdHRXMjJlQmNSZW5yM3U3R2xO?=
 =?utf-8?B?MVc3WDBQUkRsZ1k2Mm1KTDBOUElkdUwxd0phZlpvZHROSWIzQnUyWGcyT3Jm?=
 =?utf-8?B?cUFMSUx0Q1E5SEt2RWJtM3hJOWd4SkYzaExncmVFNWtzbzkrcDJidmpsZHZV?=
 =?utf-8?B?SFNtRHhiS0xsa2R6SkFVc0ZsbDd1UUVJbE03T3FhK0hacmp3V2pieW4rNEZD?=
 =?utf-8?B?UjUrU09UWFBOZUU0NStoOWNWRmYrekQ5QkpvNUdwL0tadmpGVjZHMGRHN1VO?=
 =?utf-8?B?U0ppWlltcXBVendVVWVPWi9VNk9xZEVJYUIrSkxVN0Vwc28xM0hudlBySWRX?=
 =?utf-8?B?K1dKNUpXRmlFMHdVQXBieE12VWwwNW9KTzhrVlZnMjV4M0JUVjNJbnRWbnRL?=
 =?utf-8?B?a3JTTDZXcjV4OTRSTms5amlrQnBaMzRFbUFQRkZIdGZFeUNjMGxGYzNDMHFS?=
 =?utf-8?B?WUhYdFVxZjY3Y3R5alRJTU9RTEZMc2xxSlBNTERPRUxvRmY0clpiZWxyL0Vx?=
 =?utf-8?Q?HKpCC5HfFt2WX5ojce77OwLl3+7QSapDIHbEt+R?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D174494B3FDCCD4B8F37EDEF7A237FE9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fde0022-64e4-4220-766c-08d98ee0c7ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 07:03:52.4456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3d1dCOzYwuAraeml1MK+KCkJu3YNgru3rZFy5fRFB85XZiizYvDcp0KAm9nO8xU90rXpQnhgnRmUljr8vwyn6Oufszwa2mnl6NqwCHapno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0039
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEwLzIwMjEgw6AgMDE6MzEsIEpvZWwgU3RhbmxleSBhIMOpY3JpdMKgOg0KPiBG
b3IgNjQtYml0IGJvb2szcyB0aGUgZGVmYXVsdCBzaG91bGQgYmUgNjRLIGFzIHRoYXQncyB3aGF0
IG1vZGVybiBDUFVzDQo+IGFyZSBkZXNpZ25lZCBmb3IuDQo+IA0KPiBUaGUgZm9sbG93aW5nIGRl
ZmNvbmZpZ3MgYWxyZWFkeSBzZXQgQ09ORklHX1BQQ182NEtfUEFHRVM6DQo+IA0KPiAgIGNlbGxf
ZGVmY29uZmlnDQo+ICAgcGFzZW1pX2RlZmNvbmZpZw0KPiAgIHBvd2VybnZfZGVmY29uZmlnDQo+
ICAgcHBjNjRfZGVmY29uZmlnDQo+ICAgcHNlcmllc19kZWZjb25maWcNCj4gICBza2lyb290X2Rl
ZmNvbmZpZw0KPiANCj4gVGhlIGhhdmUgdGhlIG9wdGlvbiByZW1vdmVkIGZyb20gdGhlIGRlZmNv
bmZpZywgYXMgaXQgaXMgbm93IHRoZQ0KPiBkZWZhdWx0Lg0KPiANCj4gVGhlIGRlZmNvbmZpZ3Mg
dGhhdCBub3cgbmVlZCB0byBzZXQgQ09ORklHX1BQQ180S19QQUdFUyB0byBtYWludGFpbg0KPiB0
aGVpciBleGlzdGluZyBiZWhhdmlvdXIgYXJlOg0KPiANCj4gICBnNV9kZWZjb25maWcNCj4gICBt
YXBsZV9kZWZjb25maWcNCj4gICBtaWNyb3dhdHRfZGVmY29uZmlnDQo+ICAgcHMzX2RlZmNvbmZp
Zw0KPiANCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMv
MTA5DQo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IC0t
LQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAxICsNCj4g
ICBhcmNoL3Bvd2VycGMvY29uZmlncy9jZWxsX2RlZmNvbmZpZyAgICAgIHwgMSAtDQo+ICAgYXJj
aC9wb3dlcnBjL2NvbmZpZ3MvZzVfZGVmY29uZmlnICAgICAgICB8IDEgKw0KPiAgIGFyY2gvcG93
ZXJwYy9jb25maWdzL21hcGxlX2RlZmNvbmZpZyAgICAgfCAxICsNCj4gICBhcmNoL3Bvd2VycGMv
Y29uZmlncy9taWNyb3dhdHRfZGVmY29uZmlnIHwgMiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9jb25m
aWdzL3Bhc2VtaV9kZWZjb25maWcgICAgfCAxIC0NCj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9w
b3dlcm52X2RlZmNvbmZpZyAgIHwgMSAtDQo+ICAgYXJjaC9wb3dlcnBjL2NvbmZpZ3MvcHBjNjRf
ZGVmY29uZmlnICAgICB8IDEgLQ0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdzL3BzM19kZWZjb25m
aWcgICAgICAgfCAxICsNCj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9wc2VyaWVzX2RlZmNvbmZp
ZyAgIHwgMSAtDQo+ICAgYXJjaC9wb3dlcnBjL2NvbmZpZ3Mvc2tpcm9vdF9kZWZjb25maWcgICB8
IDEgLQ0KPiAgIDExIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCj4gDQoNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9jb25maWdzL21pY3Jvd2F0dF9k
ZWZjb25maWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9taWNyb3dhdHRfZGVmY29uZmlnDQo+IGlu
ZGV4IDk0NjUyMDliOGM1Yi4uNTU2ZWM1ZWVjNjg0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvY29uZmlncy9taWNyb3dhdHRfZGVmY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9jb25m
aWdzL21pY3Jvd2F0dF9kZWZjb25maWcNCj4gQEAgLTEsNyArMSw2IEBADQo+ICAgIyBDT05GSUdf
U1dBUCBpcyBub3Qgc2V0DQo+ICAgIyBDT05GSUdfQ1JPU1NfTUVNT1JZX0FUVEFDSCBpcyBub3Qg
c2V0DQo+ICAgQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15DQo+IC1DT05GSUdfUFJFRU1QVF9WT0xV
TlRBUlk9eQ0KDQpUaGlzIHNlZW1zIHVucmVsYXRlZC4NCg0KPiAgIENPTkZJR19USUNLX0NQVV9B
Q0NPVU5USU5HPXkNCj4gICBDT05GSUdfTE9HX0JVRl9TSElGVD0xNg0KPiAgIENPTkZJR19QUklO
VEtfU0FGRV9MT0dfQlVGX1NISUZUPTEyDQo+IEBAIC0yNiw2ICsyNSw3IEBAIENPTkZJR19QUENf
TUlDUk9XQVRUPXkNCj4gICAjIENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FIGlzIG5vdCBz
ZXQNCj4gICBDT05GSUdfQ1BVX0ZSRVE9eQ0KPiAgIENPTkZJR19IWl8xMDA9eQ0KPiArQ09ORklH
X1BQQ180S19QQUdFUz15DQo+ICAgIyBDT05GSUdfUFBDX01FTV9LRVlTIGlzIG5vdCBzZXQNCj4g
ICAjIENPTkZJR19TRUNDT01QIGlzIG5vdCBzZXQNCj4gICAjIENPTkZJR19NUV9JT1NDSEVEX0tZ
QkVSIGlzIG5vdCBzZXQ=
