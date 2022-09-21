Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7785BF75C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV6b5NNcz3gLZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:15:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BzuIt0wf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.72; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BzuIt0wf;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90072.outbound.protection.outlook.com [40.107.9.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTyF0HSmz3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 17:07:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+LDQrpQ9rdpS6XBm+LPDB7zvQCay54At0SX9hMpsLTnuiq+bLSdjPkesC0O6Fxr4Cdsl9kXv5vvbFZoGlE99ObUBjSNO7rv8UGjTOokp6gAV1WiZo6MiQmUOMLb6uB6AdYdJlSajTl4IAY8sOEoyX0uqNQMSv5pbgz4UsWwxaT2fVjOkHv75kGwAik7mLsyCcc6rkTXMD4+Q3icGnZ7l5ncpNDCxeEkoQ8B09CZiJOaHKWBRmYrN5SDankS8ucQPDiFVaVIGeV2/XRHvSyoOdvDb3WDu1OiQ8zoZ1aVap2JIproEBAeef4x9nP8ce28ymH9M2oMK3KoKP279mXBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16iOWDxZcF5xrtpN9rBEiLzUf6G6u/1DE/twyfLm9e8=;
 b=nv9q4vhny+GKzCb4pFD8CnX8UT2D1ObfqLLMS3el2lUiWfPM6M92nYPR/C/Jbr9m0dAIwHaYSsFK5kboHCMsjFmD0/v3UfsauGlqEGD9+G9ISzg9PvMNJ7lJCHiO8m3V4IKRxDuwn/mU/NGVt+bk1Nl9xumFfKi53Y/PNxvdsttPgrtSv5+fX17yNgNHZK5yyvBuy7QzrdTEaow/nRFQOAAxC3EpdAgWenwEDw6ItnucCGNhkwogMQ5vtYgxxp218RQo4w0RTO7ZNy5OyAEetvc/X4AB65Oe4I5E6yqhSCvB0fgbsDXGI+nJTNZ1EWdTBsFrye3FIcHvDDj8onRkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16iOWDxZcF5xrtpN9rBEiLzUf6G6u/1DE/twyfLm9e8=;
 b=BzuIt0wfM7A8naD3FatvDK2B9Qm5mq3nECEZ530BgLEC2IBB7tJKvpzF1XuKyRiuvKNxzUi1K9WXW9TxN2sC9c4bW2RNBy0ECw4aJ6VX4LrlMCzj4PEowuznqRFS6XwGJgSZLF/oDK83g7oKYseWCBy6DTHfv11SgQIecGH09gwCT+86p8+9xH69mq/vdQoUZarJSLHZUmxmYceKUjJAUBC5WbRjFtDSczLY/NVXItsfiS0PNp9tp5DtU/XsWBLIEudbDJtQxp+VsvIdSg05A6lDWqnRsBJaxBrrg9VlR0h20BDbdEtZkfFyN9PN6k1e987nQvWHxkFGh8CgBf+28Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 07:07:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.024; Wed, 21 Sep 2022
 07:07:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 4/4] powerpc/64s: Enable KFENCE on book3s64
Thread-Topic: [PATCH v2 4/4] powerpc/64s: Enable KFENCE on book3s64
Thread-Index: AQHYzV6HUcByi1mC3EitAtiNWf1qsa3pduKA
Date: Wed, 21 Sep 2022 07:07:29 +0000
Message-ID: <8467f892-8b96-62aa-851c-e824d0f80efc@csgroup.eu>
References: <20220921020213.868124-1-nicholas@linux.ibm.com>
 <20220921020213.868124-4-nicholas@linux.ibm.com>
In-Reply-To: <20220921020213.868124-4-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2212:EE_
x-ms-office365-filtering-correlation-id: 219a5075-5d5d-441a-a9fc-08da9b9ff2a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  15HmAt8KTst2w522iPFnP/Y2E3ygEFXXzJ3OMsROkVcQ02U+0aaorFrhI/45YDxOHucUdTyjRMjuvO57fyYRQmGhMXfpw2bu0ph3Jf+a0AazxTkOcKpf3OsSfhdk7q2ahsGUqoqVG2kso/IcmgNLkkSMFQZVjtHyhZDqgLzyhZe7ZxZ6tOP7bqLl4n04/9kc74F7kuzORkUtLtfLSNI7WP4Y4Rd39M7iDwWvAoyV4G62Ev0Ig6Seb2zc02EUH7zaEI8Dyq4E4WDBD6CYyv2vM8yGANjpqc1F7l1/FSyzJlaCTG/J2Jgzgt/XMrBdKJupoXNDXVlM/Hzd/uQviaadVfl2i4t7iAAu1EMUmpizd3P78O4g8dp2AMc0mIucvvhBL4qP8G1QoQZYDtiSssySrroR7uhuRUtJUFekyDjnmV8uEnYA7Jx1znXH+n2TzlrW5hfyy8jZCJg3JKFUoGzXNEFQo8Z0fUXw1+h7ZwL4PlMQrSNpD5+J8Up0RxnIrhQiXHw5mEOczwuBwmTUD9gPZsKPxvdDtnwxne1IkWfcSlqVz0vRaB1tPTlne3zLcOHX4ax1p8y83H8JJW/o0fnJp5h1ZsmVNxu5T8iS6QPrHCOHjmuUHzzDUxOQqWhhVQB2BzYkF5JPRNm2/qhV1ScvXo/O4puy307bez04CYTm2mh6BHYaWRjBUnf5ltjrZP+H+z9byfXW96BSCqhWIEFgY1kH2q3O8YlavZsvOPXszIZ0k9ClnaWsH8yArMizsANvkmy7YWrKz2Th7NogtRA5txYNMxo/IZ+Oraft2O+ZU5fHH34lLbIdeyg1rQ11hYQyDxYpspzV24nOqhXvCs/+PA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(31686004)(2906002)(36756003)(83380400001)(66556008)(66476007)(66446008)(64756008)(38100700002)(122000001)(5660300002)(44832011)(110136005)(86362001)(316002)(8676002)(41300700001)(8936002)(31696002)(76116006)(91956017)(66946007)(186003)(2616005)(478600001)(38070700005)(6512007)(26005)(71200400001)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZUNVR21OdjZhd29PcVNwNGpVeis5S2UvWUNzVURjUUcxL005MGMycHBNYzZ0?=
 =?utf-8?B?VU54NE9NMFZiWGVRVDZZOUxTWVlpNDNrNHNZMEo0eVhIbjRoV1FyMnd3elBK?=
 =?utf-8?B?ZGduK29MaUxSSXhpRkZ4YmpiQTBrYTIvcXJSSTRIK3I0anVoSURKOXp0TU5M?=
 =?utf-8?B?Ykw3enNldVlybG80b2hFbXRyM3FvbjZLMTVWZ2lwK1hheVFVdjhSYWdhRTFx?=
 =?utf-8?B?R3hkSzRoV3lGZmdKZnFBVTFGWmFpRkdTNW9JOVNCMW56VWhlK01FRDJOYzFO?=
 =?utf-8?B?b081dHRoVmVQQllYYjhyNXhQVjFyUzFibjRESEE1ay9YblppU3hVZWQvQ0xm?=
 =?utf-8?B?S1dpWVNvOUR4c25vUTVJNmdTRmMxL2lYQVNkV212RlgyRkNGZitSM2RYb0Mz?=
 =?utf-8?B?MTROZktQM29QckpyOUZNcXdNVzdscWhHNmp5aStLbmpkK2M2L0FEc1lseEF3?=
 =?utf-8?B?Q1k1bnF6blZDYXVXbjJVRm5pZlJGNTZCam55cEQ1M3BQQUhTUjg5OS9pOXNa?=
 =?utf-8?B?RFQ0eXowK05VSkU5OURoam5kRHdGM2Jsa2JvWGF2VWMwWC9acnJHUEs5Y2Zq?=
 =?utf-8?B?UzRDOU14djBnUHI1VlprVzVZby9hWTg3djl1M3doUUhIWVc5MWdDd0Z1cHcx?=
 =?utf-8?B?MFFhUGhsUWx5amNLNTJMTHFsOWpVUFZJRklUdTZ6dyt1c0JYMDRrZFF4Z2k5?=
 =?utf-8?B?Wm40a2Q2bkZHeDRHOWFUaDA2YnZheHlJcG1jOWFLT1JhdU5DWVo5QUVvSlhC?=
 =?utf-8?B?YlVUeUhYeitmcUxRTTQ5aVJ0Y0crUGVrdmRaZTk3OXFlanpQdWhNdzZMT3Zq?=
 =?utf-8?B?OTNrOFFaV0JOVGtzQUk3alBUcjM5Qm95STltTjdwZ3NRTkhvc3EzWjh3clhw?=
 =?utf-8?B?U2hRNzVseFhMRjZldzlIeWZwb2hSRTBqblNiQ0k4eVFNejc1dGk4bHJGUFFh?=
 =?utf-8?B?L3MzVG9wUUQvbFVGK3EyY0ZtNjhrSi9FTGpERlBSVTg5TUIrSkQwOG1xYWdh?=
 =?utf-8?B?QzlNOTdwSGdoZkR5RjRhaTU5S0VZTG5zTllISEdadGhiOTNGSWQ4aktRMGt4?=
 =?utf-8?B?QkN1c0NCbmFlajFmN3JGV1I1VXFlbTF5ZDJDdDVRaVlRWXdJVGV2bzRNL0FE?=
 =?utf-8?B?MmhzVGNabUw0emhOdWphbkY3Wkx5a3ZiMDV2YXljM3YyK1V2MUJtcENVYXQr?=
 =?utf-8?B?SVdFdG5vNzBveWVqdy8va2RVUE1DQU56RVBvb00zdWhPNHdvNzRjOUp2MTVy?=
 =?utf-8?B?Q1BjRXFZWW95VVYrcCtzSzg0NGRHNlV4dXJnWVArWU04cjFWVHZTS0pEL3JD?=
 =?utf-8?B?Z1F6M05IUjZ1S3FJRzZsOWpCK0p3SG9mZllkSTlaTENURWhSYk85bUllV1Zw?=
 =?utf-8?B?M09RUU9QS1B3MTV3MFh4WnlaTWZVdHlta2FtOXJGRkRDV0RVZlNDRXptRzdS?=
 =?utf-8?B?dkRvbitBOVlUTW1HSStlK3NvWVY5QXFKK3JJS2thaUZabjBmZW5Eb1UvSFlm?=
 =?utf-8?B?UVR6Q3oyT1hNYTlKWFdpaHFiNXhkUUFLSnhMem1DZGZ0Y1BMMUJpSHFQc0d0?=
 =?utf-8?B?c3dwNlE0YlRWVTlHdFFRanRrVWVqcjFlVVNwWnNGd1A3by8zeXJDTk1vR1Jq?=
 =?utf-8?B?UGVlRFovelFDeTE0SFBPNmlVYzhzMnVON2ZpWnhsTjM5OXYwZmRoaWQ3Mk9x?=
 =?utf-8?B?c2hBKzJycU03MmRha0JhV21XOHcrWWloaUR2RHhxeUhpQ1VOZjFZdGJKYmd4?=
 =?utf-8?B?L1R1V1Q0QkRiSFZ1VmtFVEJrakZVWVhvcWE0SlY4UjlxaDU1RXlaTVJHZFg2?=
 =?utf-8?B?YlZHbXVnMHNDeVlQNWl6K0Znaitlb0oyVU1TZytRaGdLYjB4Yy8wdG0wMHla?=
 =?utf-8?B?ZU54Z1NJVmwwMTVkOHpzNVJlQjROanViSi9nR0lWaEFwNVFsdzBWZ2I3TlhV?=
 =?utf-8?B?VnNlb2s4WVlWMG9XbnFYd25ISGJsSjNHTFBrQ2RiVTM4bGdKWXFjczE5eWRy?=
 =?utf-8?B?WDFmeWlTYnRzNDd6V2k2SGFtY3IrbXdOa3R1T2ZOdEtHby9LWUFaQW41QlU2?=
 =?utf-8?B?WGRYUTViNWVMVFhiYVNUMUxwU291L2RiZU5JQ3d0Q0Jqc2l3REhpYUc0VHJM?=
 =?utf-8?B?cTlreXhNS2tFajRKa2R4VGZTakgyQWUrR3I2V3JGT1I5N244LzVNSGdtUDdv?=
 =?utf-8?Q?nCIXEfHjB5hJaJWrsyjRaQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B2164876BB46548B2AC4FEEC6AA8459@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 219a5075-5d5d-441a-a9fc-08da9b9ff2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 07:07:29.8755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QN3KAt2KeGbIhl0/OPWR1iYzjVIirqxZg6851xmJS2Fun7ijh3b29iv3xV6V8beQGHMzaMKYLy1JVSeQ7ONPxZPssLhIds4shantT5TzeuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2212
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

DQoNCkxlIDIxLzA5LzIwMjIgw6AgMDQ6MDIsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gS0ZFTkNFIHN1cHBvcnQgd2FzIGFkZGVkIGZvciBwcGMzMiBpbiBjb21taXQgOTBjYmFj
MGU5OTVkDQo+ICgicG93ZXJwYzogRW5hYmxlIEtGRU5DRSBmb3IgUFBDMzIiKS4NCj4gRW5hYmxl
IEtGRU5DRSBvbiBwcGM2NCBhcmNoaXRlY3R1cmUgd2l0aCBoYXNoIGFuZCByYWRpeCBNTVVzLg0K
PiBJdCB1c2VzIHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBkZWJ1ZyBwYWdlYWxsb2MgdG8NCj4gcHJv
dGVjdC91bnByb3RlY3QgcGFnZXMuIEFsbCBLRkVOQ0Uga3VuaXQgdGVzdHMgcGFzcyBvbiBib3Ro
DQo+IE1NVXMuDQo+IA0KPiBLRkVOQ0UgbWVtb3J5IGlzIGluaXRpYWxseSBhbGxvY2F0ZWQgdXNp
bmcgbWVtYmxvY2sgYnV0IGlzDQo+IGxhdGVyIG1hcmtlZCBhcyBTTEFCIGFsbG9jYXRlZC4gVGhp
cyBuZWNlc3NpdGF0ZXMgdGhlIGNoYW5nZQ0KPiB0byBfX3B1ZF9mcmVlIHRvIGVuc3VyZSB0aGF0
IHRoZSBLRkVOQ0UgcGFnZXMgYXJlIGZyZWVkDQo+IGFwcHJvcHJpYXRlbHkuDQo+IA0KPiBCYXNl
ZCBvbiBwcmV2aW91cyB3b3JrIGJ5IENocmlzdG9waGUgTGVyb3kgYW5kIEpvcmRhbiBOaWV0aGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBNaWVobGJyYWR0IDxuaWNob2xhc0BsaW51
eC5pYm0uY29tPg0KPiAtLS0NCj4gdjI6IFJlZmFjdG9yDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BnYWxsb2MuaCB8ICA2ICsrKystLQ0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgIDIgKy0NCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20va2ZlbmNlLmggICAgICAgICAgICB8IDE1ICsrKysrKysrKysr
KysrKw0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMgICAgICAgIHwg
MTAgKysrKystLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxl
LmMgICAgIHwgIDggKysrKystLS0NCj4gICA2IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2tmZW5jZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2tmZW5jZS5oDQo+
IGluZGV4IGE5ODQ2YjY4YzZiOS4uY2ZmNjA5ODNlODhkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20va2ZlbmNlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2tmZW5jZS5oDQo+IEBAIC0xMSwxMSArMTEsMjUgQEANCj4gICAjaW5jbHVkZSA8bGludXgv
bW0uaD4NCj4gICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4NCj4gICANCj4gKyNpZiBkZWZpbmVk
KENPTkZJR19QUEM2NCkgJiYgIWRlZmluZWQoQ09ORklHX1BQQzY0X0VMRl9BQklfVjIpDQoNCkNP
TkZJR19QUEM2NCAmJiAhQ09ORklHX1BQQzY0X0VMRl9BQklfVjINCg0KaXMgdGhlIHNhbWUgYXMN
Cg0KQ09ORklHX1BQQzY0X0VMRl9BQklfVjENCg0KPiArI2RlZmluZSBBUkNIX0ZVTkNfUFJFRklY
ICIuIg0KPiArI2VuZGlmDQo+ICsNCg0KDQoNCkNocmlzdG9waGU=
