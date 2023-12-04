Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E056B80426B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 00:10:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MXkjdt/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkfXf2gdsz3d8R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 10:10:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MXkjdt/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkfWl4tyXz3cRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 10:09:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJvVzuYvoGll02pTvlujLL/eMi7rajW9qY5e6JCZhLNC1/saP20zwZPkksleqeLSmj33bNY6KFVCtNlxiSJ77kt8ljn3lHOuUOqXW1nosJCFry7ah+/8RbbitlrL9T5iP+tIIsTqY1gewSLHl08eBOSS3LlPZoXxmL7kSMm6U/FfuUbCsjbyiJUBSL86rklSHUMOkpYgxq9w8EkrL9CGPd2h2UvHBtgYnK8fWCT6Br8E4Nl2swxZHLcWjex4EfhrrCeXAY7qrlL2iv1Wj1twVuSRxfRJ6VVI8RlsrFZ7CGb0Gz+IMC26gFX93yXL+vmB191FQfyQzwpnreN8/4ImMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA7QUBBgB/zHmIH2K5IhAEoAhoHQgSOb99N2M7tSzGs=;
 b=TbE4yhNfn5YMjBZopTErVHm2GcQqNNX9ObbxQLOpDXPJMg/HaUyHmHwppkx4+sms6xzm5A+6bvHkFc5p9if0IbkR+mPD3XsP6WxJMyJueYV7ZqzvlPB/mkmozZTwq4RZcfdH9+xS95SZ2bA5eNnFrqvWJyoIwJ9Q8inVywHOOm2NRxEWpsE+hWBNfaM4yBPLpyxEfIWsnYKsteO/eXdEDvycLo/E2NwbKrfLwsIefzWM6yr38nHyFQMu1vC2qBFqbf1utNiF9BPbm7o5h+e9CGqrZ2y2dg7KFQaHGQ/1StNzYGrlLbee6AOiZj621aNbRx1/apmu2A8XY4J3C5ow+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA7QUBBgB/zHmIH2K5IhAEoAhoHQgSOb99N2M7tSzGs=;
 b=MXkjdt/NU0ICdpFMbO8MfviN+mTMmoal4NBLD7jombQxd5cJeA2MV1nZrlPlFva3AFlgFhsKgZJmzg/jzoA9UeazAYM/fH2HUkG/9wnYKDboGrqxW4U5Txr01/9ckPzRXzGAhTQtgz5X8IlfYDvg8k1A3ku/BLAmG9edxUiX22rkvF+AFunfCwGMbaOnehaD2WRbaziNjsIUPIVHE4DLa6ob3Q89FvvwbCm3jNyl2RfL2moFHggMIxXBOHpH2A1uscGqzQ/MJkdbNxGsc7VhWBap9JBepM3FhSfSVa9nyf1i5PVU69ZIVLvyWb9DatAMJlF3+lY8RTDb/++pYqJBEg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1655.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 23:09:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 23:09:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>
Subject: Re: [PATCH v2 02/10] leds: aw2013: unlock mutex before destroying it
Thread-Topic: [PATCH v2 02/10] leds: aw2013: unlock mutex before destroying it
Thread-Index: AQHaJty4/91Z3RNAM0CeKQvYIMJPSbCZwCoA
Date: Mon, 4 Dec 2023 23:09:36 +0000
Message-ID: <eab990d8-9b08-4019-95c6-c71786081236@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-3-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-3-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1655:EE_
x-ms-office365-filtering-correlation-id: f4ba0828-ace0-4b1d-5e3e-08dbf51e1597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  au1ulE9Jik2klHRIuE5zxSCEl2tRHgiKcMxJD8bVgYkh8UjwWGzi0TsTb8IVTpr0syLv95lSFUcQWXnvWstnVb3HA7Uv84KfD3QGDmdUd4qIzXFZQvo/qtscw3biqIbeAOM3blnsip5z4Ny3Wldt6bs/MfDkMnJpQVo6xzOyHmnqYNDg7NQE5Ght9XfENltEcYE5FZ8Lerxm9Cil8uzfwnbiJIrsUYE57Cdq+uTGMFoA5okPMtzdpXKPhvbxMJq26tyagvUbMUwU1egc69zZ+p6VfHaeeU/tJcR5eCEVIYUsMcjGFKlh1EcnlQPWbgo0NwNJ1FXBXiA3ToWGkNkBIblDaP5Wqmgczb72Kn96nupn7JqmVYh+4DaU2wqgqyLXgkwsrxTLEmewfzBE0LEG+sWJP3Ey6xgpeB497F/tPRY47qPFfgYmhKDic/y8DynDyFmrXAfb9FlJAjPo2YYdbQ8NJJqnQyFFbjueE5S+6v541jhn/2VyDyV5umray/tGkePES+sBIasqWiH+2lLrVEuQQZr331NXOby4joprKu4u6VENMyPNELf9QQeyIOcFG6nZWLI6HB/5vSxqf5ocABQCb8nY6DTS4arGwZLpI6xIHLEqTpuGglUigfpg+WEMJbXapCR+1i9RzUX+FR8cEDVKmU3aqTfsKnqWKWW0+jfwwfs1LR7ak10iqhSqGsutHl1KiRLGld2xexvLkFpT1A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(91956017)(44832011)(66476007)(66556008)(8936002)(66946007)(316002)(110136005)(66446008)(54906003)(64756008)(76116006)(31686004)(5660300002)(8676002)(4326008)(7416002)(6486002)(71200400001)(38100700002)(83380400001)(122000001)(66574015)(31696002)(86362001)(2906002)(478600001)(26005)(2616005)(4744005)(6506007)(6512007)(36756003)(921008)(41300700001)(38070700009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VTRBR1YyMTlQaG9XZHZSa2hXOGtDaHAxalhtTEN2VkdsSnpkd1dJZFVpWTJR?=
 =?utf-8?B?NlVCSGd2RUtDMWlhRlk5VmJ4MUJFQWxDQ0pNM2M2WGZ1Y1NZaVZhdXR0R0FB?=
 =?utf-8?B?LzNYdDFkam9KTWVBNThJdll0SlpBWTUrczQ0MjQwRkdqL0V3YmZ2eWw4T28x?=
 =?utf-8?B?eWU5MkRnVjNPaW1tOE5RT1NZMHBGUkQza01RU3RNTmFxU0orNEhWb2ZMeDRz?=
 =?utf-8?B?ckdyQXR4aVZzSjVvNXhBckNPUzVsVm84bVVzTytHQW5Db1NJdmpYdlJDY2l5?=
 =?utf-8?B?T0JkeGM3bHhDc1pHc3R2cTF4L2ZJMUgyZXZHM0tsS3liZUw3endyQ1pWMFk0?=
 =?utf-8?B?QXZqejhBUllMMUpmbnkyUlEyMkMzYkNFK0V3cFVYNnQ1NWhETXNuVzNGdXZQ?=
 =?utf-8?B?aE9MbHJHTEdrZGxjem9mN25VOXU5RzB1Rit5SENVQWo0TEVOckhCMVZJeFBr?=
 =?utf-8?B?eFZyT0c0OXlMN2NMUEE2REc1N2cwbmtXZklXNTNLem9uZWVSRHFLUSt3RXh5?=
 =?utf-8?B?a0tVUTdJV3VLUTMrTGE5UXVLZlpWc2FLa0M4QkI3VHdhSDlMZWxOYUxXV3VF?=
 =?utf-8?B?STIrVEY1Rnc3bDFPSU9PWU5wL3EyMElaRG0vZFZmWmZ1RXlrcjE3dmV4MFp6?=
 =?utf-8?B?YnplRGM3MjcxbEw1YllxZmQxdWx0T0x5NTZNSzBqVzh5bDdiQnZ0WEJHSGda?=
 =?utf-8?B?eE9LV1N4dWdqOWw0QWV2NmpHdThmd2Z6ZEZlNmdmUHpLK09WbEVHUm5YajNL?=
 =?utf-8?B?V0pmUTJsdTNVMWJYRHRkWS94VjFkZUJObkxxQVR2V2RERldrQWd5U0dVakRa?=
 =?utf-8?B?aUMwTEU4aFpTRWtMYjNHOWQ2bHZVUXpWa25wNDY3a0t4U2pKbnpnNUVUNE5X?=
 =?utf-8?B?Q0FHTmh1OE80SFRYOUljWWVKeVJpK3gwMlg3UTk4ZHZEdlMvL1NZSGd6VVNq?=
 =?utf-8?B?aXh2Uklrc3E3Ri9JdENpTHNQanVoRVJyMjlzTTJFcHhxWldYaTVPYTJQQ05W?=
 =?utf-8?B?citlanBCY0VuZFJQVmR6MEdrSXY4MUdmRjNVT01yTTBTMk9TWFBZcDU3MGFP?=
 =?utf-8?B?Z2ljaDZ6djVySDZtWitBVGNjTElkbHhqSHZVRTJkOUtsWU9rbXB0QktOZW9Y?=
 =?utf-8?B?Ykt6bEFDZ3RJZGJucFFzMTltaGRHVnA3bFdLUUFPZHFETzRDSENMTGU0Mk04?=
 =?utf-8?B?RnJ1NEdzajl4UHJMam96d3ZyZERpd0UremYrMGpEOHJLbVYrc3czVUVDS1Jn?=
 =?utf-8?B?RTlXVnlmeU9Ob0hiL09WRFRlNW0rZU1YaFhWdDh4enBPL0tIcEE3bjZsNG44?=
 =?utf-8?B?a0JZYWE4VCtzMzR3bGgvWjNKb3FxbDd5Ym01c0N6NFcrQUxCMFRBcXRLMmw1?=
 =?utf-8?B?cy9aL2srQVV3OG9TR084SXJhY3RUZExraUlhVXlhNDFEOHVSdjZUR2F2QzBK?=
 =?utf-8?B?cGJVSElTbllFb1graldNL3Z4akpSTTBBc29aZ2lUa1RmckhlYXlIVnJSVEs5?=
 =?utf-8?B?c1dFSFhrTDJoVWluMC9jYzNVYSt1dzdNb1M4Q3dISVRoMElDQjBreWNvbzh6?=
 =?utf-8?B?eUdlR2k5OHduamdxWXFWZG42SXRRNnNUVWQ0UnF4OURUMklQLzNmYTZZcTJi?=
 =?utf-8?B?NzZDQWFXeE0zQWJrbFFNNGVkaTFMNXdTV09CVGtSSTUvYVNhMTZhVG54OU4x?=
 =?utf-8?B?SFZFVDhjM0o2aVV1MVNCQkNMZDFIcEdjTXIrMXpFakRoRkxFSHVVVmUzMmV5?=
 =?utf-8?B?ZXR6MGNIMmQvNWtjc3VESmhXWm5YTlR2YzAxUDZZUVRzN21KQ0diWHJzVnB5?=
 =?utf-8?B?a0dJdkN1WTJJNWtlclMzQk1DT1ZXZ2lvOE5CQTBkZ2NpMG1UWit2bHFXcXdX?=
 =?utf-8?B?dTJ6dk14YzVnZS96bHVRc295ckVUUEcrbGcvcnRNQ29MYWtNQWNTcEhMeWxZ?=
 =?utf-8?B?ZzNUN3FSbkpqU1FtcEt3RDZEeTdUWGVzSnFTL2szSE9VaEZmU2JUdWJKNVNl?=
 =?utf-8?B?ZkpCTyt0cmJUaUJkdmRxb3l6NWw5dGxraEx3NWFRQ3Q4dkFycUsrYVhSRTdI?=
 =?utf-8?B?TU9pdU1FY1VOSHB5UGdtYVMxSC9ZSjYvandHOElOSDAycUk0V0ttUWd0MDBs?=
 =?utf-8?B?akNOSDkxK0hlbk5pNEZqWUozRnl3R3RhRWorUDVrdGZJVzZ4cmREQlhmTXBI?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EAD1ADABB1EBA45ACD9B73E43A5D7AD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ba0828-ace0-4b1d-5e3e-08dbf51e1597
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 23:09:36.2681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZT3UhamFRfyWglyBlXfJEl55DLZKCUXw37SOwvm0jnql6BVbi2nwKG9VCzjbg7ybtOxMDH5gXZPHeKDZgSx8m8TkyPPuVvcxrv7RwAyVfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1655
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTk6MDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBJ
biB0aGUgcHJvYmUoKSBjYWxsYmFjayBpbiBjYXNlIG9mIGVycm9yIG11dGV4IGlzIGRlc3Ryb3ll
ZCBiZWluZyBsb2NrZWQNCj4gd2hpY2ggaXMgbm90IGFsbG93ZWQgc28gdW5sb2NrIHRoZSBtdXRl
IGJlZm9yZSBkZXN0cm95aW5nLg0KDQpTaG91bGQgdGhlcmUgYmUgYSBmaXhlczogdGFnID8gRm9y
IGluc3RhbmNlIG9uIDU5ZWEzYzlmYWYzMiAoImxlZHM6IGFkZCANCmF3MjAxMyBkcml2ZXIiKSA/
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZp
Y2VzLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9sZWRzL2xlZHMtYXcyMDEzLmMgfCAxICsNCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2xlZHMvbGVkcy1hdzIwMTMuYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWF3MjAxMy5jDQo+IGlu
ZGV4IDU5NzY1NjQwYjcwZi4uYzJiYzA3ODJjMGNkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2xl
ZHMvbGVkcy1hdzIwMTMuYw0KPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1hdzIwMTMuYw0KPiBA
QCAtMzk3LDYgKzM5Nyw3IEBAIHN0YXRpYyBpbnQgYXcyMDEzX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpDQo+ICAgCXJlZ3VsYXRvcl9kaXNhYmxlKGNoaXAtPnZjY19yZWd1bGF0b3Ip
Ow0KPiAgIA0KPiAgIGVycm9yOg0KPiArCW11dGV4X3VubG9jaygmY2hpcC0+bXV0ZXgpOw0KPiAg
IAltdXRleF9kZXN0cm95KCZjaGlwLT5tdXRleCk7DQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0K
