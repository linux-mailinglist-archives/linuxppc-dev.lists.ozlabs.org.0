Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F696813B17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:54:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fk5IdqGw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srjjm6D1qz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 06:54:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fk5IdqGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srjhz2QfLz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 06:53:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8xujCr/mP1PTG3DL7hjy7n8movjf1Ptwputs2MKOZ9QnNyHgnxne8jBxH+VaFxOGd9qveF8tG+Oxf3D2i2EHZxTHumWmD++f9hvi5KcSHc94OgN64QnxsDnh778YSN0bTVSR0ZRs5a5/Aq+xwEIkbUA1WNKJFOm4rziGd2Fm3CT1TujsByoghGflafeVKCpPg9bO8XTu35f7hK9Gv48KLVv3Ezd8b8a+kBY33jpLHpKGqmZzCSW2ayHdNdC3KagLU5MmxYmkWGWH7IBwcWKpq3HleizxzXhjBL4y4066XUKeB6HACCudgja9fs6onSnp/YbDPmPmdh4CIre3l8ARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4toCinyF/HItNjanOJJj0jBDfnKbh0aI8FOErh2eG1Q=;
 b=h7Z+zmNPcYrPbDMv1YkB87aGKJXzPjmFChHhNN4AaA+pDEUGUurL3+whzXZzToSkUIWMYcvBxJOobmzIF3m22yUvqbQR2goe5AdCs6WcTdKcnaqRguVI/vZjtxCNXHyBASZmlmqY2ZSkRD9jMdlRuRXLNeYBwIbl1hO4rxgSe2ak1SudbksG1wTAD9EowBOmRdxjlNP4FQRV6OWv/dLX1Xq6SsxXlx4+s8S6L1BZF/AZq0pWIJLPW470yMTusLqs1yJE5WWndTQqiXI1Zx+q+9iCyPwS06KNgxOddIYkvQ+piXOqFHlCZTdP+GhGR9rS284FASVrB2N5W1mD0q21VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4toCinyF/HItNjanOJJj0jBDfnKbh0aI8FOErh2eG1Q=;
 b=fk5IdqGwvhgQ/adax1iOiA756jfRtcsxKVl+5n2crZ5w0m099tXBx3FThTUmHtoHSdOBx/lMEURCOXoFNoDtj+2BLq3gVz3x8wzjGu+ukROdgXzTteE7Ui5j2KXv56mEFVKqK/jOhP9z+mLFUaWKlM/Yl4au11ydntCjuIWSwhhEMYAGVgZfp/098VRrH5dg+78zOFA/Z5XmDmoLvdm7TgIMVgLQVb/j6DvpHh+EFVYjDbYUVpvr7miWeMhCWgZBIHu69/mRolaI7O/BO2j0ExLo9zyUjuXJs4muUaU3v8vgE3BzFWKwF44ZidewJPuILYvlnWeFcnmT/SXQbWeVaQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3053.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 19:53:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 19:53:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Waiman Long <longman@redhat.com>, George Stark
	<gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Subject: Re: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Topic: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Index: AQHaLrQSLTXRy4mOS0OgHh/wjtvn+LCpHvQAgAASE4A=
Date: Thu, 14 Dec 2023 19:53:33 +0000
Message-ID: <b158ca2b-7300-4ad0-82b8-e1442d267734@csgroup.eu>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-3-gnstark@salutedevices.com>
 <5c10f66c-3fd8-4861-994b-13e71c24f10a@redhat.com>
In-Reply-To: <5c10f66c-3fd8-4861-994b-13e71c24f10a@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3053:EE_
x-ms-office365-filtering-correlation-id: 0d530c66-629a-40c3-ebbf-08dbfcde5acb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Sz5AyOyvzoNOZXCMC+rkJx+Lum9CZd/3ayZNAANYDQNm8yKGG9HC8Xm4qcAVehpScctFxWo29o35MtU5nLR6UeuLfY6AOBA3HSkpfCLrzqNfz4FJy6L28/9m/RA+VltPh7J/z0MDcm/nZdHLvfqzB5uKEncXVEOjej1gTslx/ukBvR+ZGIkqC0PxwLMU33NMucUYif3jZB4I3DAdAIKMg7lFESyHKXmjvJSe66cbBkyOxX8wJS2PU8Eph/KhbFm4asZ7t/Zg2Dpxsluk7JHaHcvmjbgdnYme0Ycm8u631d3OcNhcfIoaIF2AGETxfwEP8KJ8B0pTeiV2oORyNrEBzlqJQFKenf6E5bwHCOFu/mVIqLPaw8PSeU4t++GDupe+UML94SDD+HOOqqt0Xz7PEjV/F3nh2nWpbz+CFlQI1ZMa2js5ZgJUhP3uFLmz/1UFqCifJ9avuAo+VMWUlkwUD0xfrD9dP5PTLnLnUdwo1e1/Y59+W7eny8Ng28s4kL3IGBJmeTgG5v1Oh7FD5kRtqNjIMf6kNJP+rH/3tfgdga5yRvz0zxEHjGfy4G4SNjM2EIy9dI0oGifBiz5cht/LPPA6ovo3N36sMHLUSf3fYnrNHa0A00+m8gPguk5zm3kseGYjISdVI9pWK1hQp+X6ZQACjaiarktHRcGkapIhiReG4OzWuSXEqa5lW0wcG1KdNUIY07phn3AGzxefRmjD2A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(31696002)(7416002)(6486002)(478600001)(41300700001)(38070700009)(921008)(31686004)(122000001)(86362001)(5660300002)(44832011)(4326008)(54906003)(91956017)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(83380400001)(2616005)(66574015)(26005)(53546011)(8936002)(66899024)(6506007)(6512007)(71200400001)(8676002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TTBhc1BIeU0rMnRXTEF2MkdqSVh2d2FVdnZEbjFXcldQdXFMUnhLdG5nd3FB?=
 =?utf-8?B?QzJ0MEJKbjRBV2pKaHl3N0lpYk5WU1NHaVd2bHhiYlB1WVRvN1hoOHpqOU9z?=
 =?utf-8?B?MVQzVUZsYklXQnpBaytUSFZOMi9YUGdweGlDR2hmZjIvMk9HUWcrVURBYVVL?=
 =?utf-8?B?eUFaMk9aeS94WDhBTXpjWUl2VGNHUExJTVh3UDE4TG1yb3h6S0V3SkIzVVph?=
 =?utf-8?B?K3V3YUh1WXZiS0xsektISE96TVVoMEhCV3M1cnVSOEZUVnYzZytSNk5xZ3dW?=
 =?utf-8?B?eGFjRFVKclJOajVzRWxxTzd0LzAxbnJlL1Rvang3TDlqcUhPN0VjQy8waSt0?=
 =?utf-8?B?ZDNjSDc4N0NJZlZobkhsRWRFS2RLUUNJc0diVi8xTXVRMFJLaGdZRXBsNGha?=
 =?utf-8?B?M2ducHlxWllyS0RqbHYrWGZaVzJtMW5oaUVsaVhYYWdRRk91ZmVJazMyMk56?=
 =?utf-8?B?ZzlqcHdGWUxXUlV6MXhtNWUrUTIramRQRmpaMWd6OFk0VUJFWThvNTh1Sy9p?=
 =?utf-8?B?b3pvM3N0V3F4dTZxQU96M21ZcXhTY0ExNktMemxPYnNkMjNQaUMzY3pGZ0J1?=
 =?utf-8?B?MU82Y29MOVRDcFZYOUcxR2Q0a1ZveHNHNGV1RHlvMENvQlFRVENJa3dNRXU0?=
 =?utf-8?B?NGVZUU54Vjl2NDNDWFNGTXhCVkpjVVlyaEhNN3hWOEo4TVEvdTBTRXVsNHpH?=
 =?utf-8?B?NUd4M0N2R2k2Rmw4VnpHcElVdmZKUmlNSHREeDF5VFZuUUc1WGxJRzJuNW9Y?=
 =?utf-8?B?VjNMdzBoOEIrMDFjdVlXYzRYN2g5cnA3K09PTkxFOVdSYUdPczFGWFkxTGti?=
 =?utf-8?B?SlN6VkU1OVZOT3hpMzYzNEt0TXVJMG0rcGhpTEE2ME95eDA0dDRYVUxwZE5q?=
 =?utf-8?B?b25iT2FrcFR4K1AwUFZ0L1ZJazdwM3RmaHJOR3FSVmZjeGV6emxta1krSStP?=
 =?utf-8?B?bzF6VjNlMXB2YkJpenB4QzF1Zmw5eVVLaGJuQ1ZjZkp4QkVMYkFUcnVEVVVJ?=
 =?utf-8?B?R2taUUNPWSsyMkVkL0N0K1JJcWMrYkU4MzNDcVF3UlRSOWFhZXg4UEY3K0tL?=
 =?utf-8?B?K3BZNno5dXkwV3h6VVM0cHBQK2h2eGlMODU5WTd3UGxIYXJpcys5eVJ4VThn?=
 =?utf-8?B?enFJL3RXTExrTC9zVkxuYy9hdjFlUGFPYlVUWE8vTGhvRW81eWp3bUhRdkx3?=
 =?utf-8?B?MWZ6OGtGUWNpWXdOV0N5aUpvdjJ6YVlhYnJhQkoyRVdudW9iVndQL3lHK05B?=
 =?utf-8?B?dW53ZWJFa2xPYmthZCtkbGVZeVAxamVzY3VMZTAzRWpoZzVUUlZ4T0VTR20y?=
 =?utf-8?B?Kzh3bFFpRXI0YlZOb2xKV2Y4OGZkZzlrd1p0d2c5ODBzbXNUK29TaldwTUdu?=
 =?utf-8?B?MTFTUFVRUUZBL2FLU0Qxd3V0Z0tRMENQMDhncjhncEx1L256bkhnU1grUWUv?=
 =?utf-8?B?NUp2cHV0NDJEbFhVWURhSGo5bVRBL0NSK1N2SGw1eWszOFhDaFpHd00zZDJJ?=
 =?utf-8?B?KzBVM3ZXUXNPeVpEOVU2MHQ2SWlUcS9SazBGbVhZRFpiVjRxMHpxeXBKL1Q1?=
 =?utf-8?B?M3FMK1V6MTBBZUZGYU5jaWUxSGFFTjBqVUpxR1ZmME5FUDUvQXk5SktnU1VG?=
 =?utf-8?B?dzlOWWVvd2FGeEFGK1JhZWVLYkFsbUhXVGtLYTBRMDVuUmRKN1ZsVkFIQUhq?=
 =?utf-8?B?VTdHWXk5dE9OOUJKK0pmSm5SZ2JpbmpDQ25ub2E3VzVIUU5BcjRHbmJtZmJr?=
 =?utf-8?B?cS9zRGc5aW5vcEduUWVCN3I1eU1CcTNQY2FsKzkyU29PQTR3NXBXa3JJNGQz?=
 =?utf-8?B?MjZ2c1l6eGtKOEFzc3prTFVqSE9yaHNqS0YwMCtrME5XMzJDNFNOQUpnNEQ1?=
 =?utf-8?B?RlMySWJwSXg0WVVpSWxraUxYcE5XZlVOR3VUd1dwcFBOZitpODNZVjBDQWx1?=
 =?utf-8?B?UWJZemlyZFc4WGdRcVFCK0ZQbkljdGR3UFphMGtrdFFoOEorMVk1TVV1cW11?=
 =?utf-8?B?L00xSHRUKzBWd3F5VGRPalBCb1k1M2c3dE5zeE1NNUdPRFpldi9zZnZxSWZr?=
 =?utf-8?B?ZDhBZEhYd2QwS1lHaU4yaW45UmJtS3ZyRXlMUGdiaHdsMWxPMVpoUXdNM2tF?=
 =?utf-8?Q?3PonCMV1dNIQbiAYLubLU9kuu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B88C21E4D068E4EAA5801FD47673A6B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d530c66-629a-40c3-ebbf-08dbfcde5acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 19:53:33.8925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBjWoyHfEybSgTLkd4uaUMrBBb/Ko3sgrNMczI3497TdQ4zBr0TO/qTIZg3JM649NO9rY1r2Pqa3bYXiTSPPBDOeoGkMeqK6o6MhhLRayhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3053
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

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMTk6NDgsIFdhaW1hbiBMb25nIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAxMi8xNC8yMyAxMjozNiwgR2VvcmdlIFN0YXJrIHdyb3RlOg0KPj4gVXNpbmcgb2YgZGV2
bSBBUEkgbGVhZHMgdG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNvdXJjZXMuDQo+
PiBTbyBhbGwgZGVwZW5kZW50IHJlc291cmNlcyB3aGljaCBhcmUgbm90IGRldm0td3JhcHBlZCBz
aG91bGQgYmUgZGVsZXRlZA0KPj4gd2l0aCByZXNwZWN0IHRvIGRldm0tcmVsZWFzZSBvcmRlci4g
TXV0ZXggaXMgb25lIG9mIHN1Y2ggb2JqZWN0cyB0aGF0DQo+PiBvZnRlbiBpcyBib3VuZCB0byBv
dGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4+IFNpbmNlIG11
dGV4X2Rlc3Ryb3koKSBhY3R1YWxseSBkb2VzIG5vdGhpbmcgaW4gbm9uLWRlYnVnIGJ1aWxkcw0K
Pj4gZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGlnbm9yZWQgd2hp
Y2ggaXMgc2FmZSBmb3Igbm93DQo+PiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFkIHRv
IGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgd2lsbCBiZQ0KPj4gZXh0ZW5kZWQgc28gaW50
cm9kdWNlIGRldm1fbXV0ZXhfaW5pdCgpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0
YXJrIDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPg0KPj4gLS0tDQo+PiDCoCBpbmNsdWRlL2xp
bnV4L211dGV4LmjCoMKgwqDCoMKgwqDCoCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+
PiDCoCBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXV0ZXguaCBiL2luY2x1ZGUvbGludXgvbXV0ZXguaA0K
Pj4gaW5kZXggYTMzYWE5ZWI5ZmMzLi5lYmQwM2ZmMWVmNjYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L211dGV4LmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPj4gQEAg
LTIxLDYgKzIxLDggQEANCj4+IMKgICNpbmNsdWRlIDxsaW51eC9kZWJ1Z19sb2Nrcy5oPg0KPj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD4NCj4+ICtzdHJ1Y3QgZGV2aWNlOw0KPj4gKw0K
Pj4gwqAgI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX0FMTE9DDQo+PiDCoCAjIGRlZmluZSBfX0RF
UF9NQVBfTVVURVhfSU5JVElBTElaRVIobG9ja25hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLCAuZGVwX21hcCA9IHvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiBAQCAtMTI3LDYgKzEyOSwyMCBAQCBleHRlcm4gdm9p
ZCBfX211dGV4X2luaXQoc3RydWN0IG11dGV4ICpsb2NrLCANCj4+IGNvbnN0IGNoYXIgKm5hbWUs
DQo+PiDCoMKgICovDQo+PiDCoCBleHRlcm4gYm9vbCBtdXRleF9pc19sb2NrZWQoc3RydWN0IG11
dGV4ICpsb2NrKTsNCj4+ICsjaWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4+ICsNCj4+ICtp
bnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2Nr
KTsNCj4gUGxlYXNlIGFkZCAiZXh0ZXJuIiB0byB0aGUgZnVuY3Rpb24gZGVjbGFyYXRpb24gdG8g
YmUgY29uc2lzdGVudCB3aXRoIA0KPiBvdGhlciBmdW5jdGlvbmFsIGRlY2xhcmF0aW9ucyBpbiBt
dXRleC5oLg0KDQonZXh0ZXJuJyBpcyBwb2ludGxlc3MgYW5kIGRlcHJlY2F0ZWQgb24gZnVuY3Rp
b24gcHJvdG90eXBlcy4gQWxyZWFkeSANCmhhdmluZyBzb21lIGlzIG5vdCBhIGdvb2QgcmVhc29u
IHRvIGFkZCBuZXcgb25lcywgZXJyb3JzIGZyb20gdGhlIHBhc3QgDQpzaG91bGQgYmUgYXZvaWRl
ZCBub3dhZGF5cy4gV2l0aCB0aW1lIHRoZXkgc2hvdWxkIGFsbCBkaXNhcHBlYXIgc28gZG9uJ3Qg
DQphZGQgbmV3IG9uZXMuDQoNCj4+ICsNCj4+ICsjZWxzZQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxp
bmUgaW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAN
Cj4+ICpsb2NrKQ0KPj4gK3sNCj4+ICvCoMKgwqAgbXV0ZXhfaW5pdChsb2NrKTsNCj4+ICvCoMKg
wqAgcmV0dXJuIDA7DQo+PiArfQ0KPiANCj4gSSB3b3VsZCBwcmVmZXIgeW91IHRvIGFkZCBhIGRl
dm1fbXV0ZXhfaW5pdCBtYWNybyBhZnRlciB0aGUgZnVuY3Rpb24gDQo+IGRlY2xhcmF0aW9uIGFu
ZCBwdXQgdGhpcyBpbmxpbmUgZnVuY3Rpb24gYXQgdGhlIGVuZCBvZiBoZWFkZXIgaWYgdGhlIA0K
PiBkZXZtX211dGV4X2luaXQgbWFjcm8gaXNuJ3QgZGVmaW5lZC4gSW4gdGhpcyB3YXksIHlvdSBk
b24ndCBuZWVkIHRvIA0KPiByZXBlYXQgdGhpcyBpbmxpbmUgZnVuY3Rpb24gdHdpY2UgYXMgaXQg
aGFzIG5vIGRlcGVuZGVuY3kgb24gUFJFRU1QVF9SVC4NCg0KSXQgaXMgYWxyZWFkeSBkb25lIHRo
YXQgd2F5IGZvciBvdGhlciBmdW5jdGlvbnMgaW4gdGhhdCBmaWxlLiBTaG91bGQgYmUgDQprZXB0
IGNvbnNpc3RhbnQuIEkgYWdyZWUgd2l0aCB5b3UgaXQgaXMgbm90IGlkZWFsLCBtYXliZSB3ZSBz
aG91bGQgDQpyZXdvcmsgdGhhdCBmaWxlIGNvbXBsZXRlbHkgYnV0IEkgZG9uJ3QgbGlrZSB0aGUg
aWRlYSBvZiBhIA0KZGV2bV9tdXRleF9pbml0IG1hY3JvIGZvciB0aGF0Lg0KDQpDaHJpc3RvcGhl
DQoNCj4gDQo+IEJ5IGRvaW5nIHRoaXMsIHlvdSBjYW4gYWxzbyBtb3ZlIHRoZSBmdW5jdGlvbiBk
ZWNsYXJhdGlvbiByaWdodCBhZnRlciANCj4gbXV0ZXhfZGVzdHJveSgpIHdpdGhvdXQgdGhlIG5l
ZWQgdG8gYWRkIGFub3RoZXIgI2lmZGVmIA0KPiBDT05GSUdfREVCVUdfTVVURVhFUyBibG9jay4N
Cj4gDQo+PiArDQo+PiArI2VuZGlmDQo+PiArDQo+PiDCoCAjZWxzZSAvKiAhQ09ORklHX1BSRUVN
UFRfUlQgKi8NCj4+IMKgIC8qDQo+PiDCoMKgICogUHJlZW1wdC1SVCB2YXJpYW50IGJhc2VkIG9u
IHJ0bXV0ZXhlcy4NCj4+IEBAIC0xNjksNiArMTg1LDEzIEBAIGRvIHvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiDCoMKg
wqDCoMKgIF9fbXV0ZXhfaW5pdCgobXV0ZXgpLCAjbXV0ZXgsICZfX2tleSk7wqDCoMKgwqDCoMKg
wqAgXA0KPj4gwqAgfSB3aGlsZSAoMCkNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBkZXZt
X211dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggDQo+PiAqbG9jaykN
Cj4+ICt7DQo+PiArwqDCoMKgIG11dGV4X2luaXQobG9jayk7DQo+PiArwqDCoMKgIHJldHVybiAw
Ow0KPj4gK30NCj4+ICsNCj4+IMKgICNlbmRpZiAvKiBDT05GSUdfUFJFRU1QVF9SVCAqLw0KPj4g
wqAgLyoNCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jIGIva2Vy
bmVsL2xvY2tpbmcvbXV0ZXgtZGVidWcuYw0KPj4gaW5kZXggYmM4YWJiODU0OWQyLi5jOWVmYWIx
YTgwMjYgMTAwNjQ0DQo+PiAtLS0gYS9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+PiAr
KysgYi9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+PiBAQCAtMTksNiArMTksNyBAQA0K
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2thbGxzeW1zLmg+DQo+PiDCoCAjaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+DQo+PiDCoCAjaW5jbHVkZSA8bGludXgvZGVidWdfbG9ja3MuaD4NCj4+ICsj
aW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+PiDCoCAjaW5jbHVkZSAibXV0ZXguaCINCj4+IEBA
IC0xMDQsMyArMTA1LDI0IEBAIHZvaWQgbXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXggKmxvY2sp
DQo+PiDCoCB9DQo+PiDCoCBFWFBPUlRfU1lNQk9MX0dQTChtdXRleF9kZXN0cm95KTsNCj4+ICsN
Cj4+ICtzdGF0aWMgdm9pZCBkZXZtX211dGV4X3JlbGVhc2Uodm9pZCAqcmVzKQ0KPj4gK3sNCj4+
ICvCoMKgwqAgbXV0ZXhfZGVzdHJveShyZXMpOw0KPj4gK30NCj4+ICsNCj4+ICsvKioNCj4+ICsg
KiBkZXZtX211dGV4X2luaXQgLSBSZXNvdXJjZS1tYW5hZ2VkIG11dGV4IGluaXRpYWxpemF0aW9u
DQo+PiArICogQGRldjrCoMKgwqAgRGV2aWNlIHdoaWNoIGxpZmV0aW1lIG11dGV4IGlzIGJvdW5k
IHRvDQo+PiArICogQGxvY2s6wqDCoMKgIFBvaW50ZXIgdG8gYSBtdXRleA0KPj4gKyAqDQo+PiAr
ICogSW5pdGlhbGl6ZSBtdXRleCB3aGljaCBpcyBhdXRvbWF0aWNhbGx5IGRlc3Ryb3llZCB3aGVu
IHRoZSBkcml2ZXIgDQo+PiBpcyBkZXRhY2hlZC4NCj4+ICsgKg0KPj4gKyAqIFJldHVybnM6IDAg
b24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4NCj4+ICsgKi8N
Cj4+ICtpbnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4
ICpsb2NrKQ0KPj4gK3sNCj4+ICvCoMKgwqAgbXV0ZXhfaW5pdChsb2NrKTsNCj4+ICvCoMKgwqAg
cmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1fbXV0ZXhfcmVsZWFzZSwg
bG9jayk7DQo+PiArfQ0KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRldm1fbXV0ZXhfaW5pdCk7DQo+
IA0KPiBUaGUgbXV0ZXgtZGVidWcuYyBjaGFuZ2UgbG9va3MgZmluZSB0byBtZS4NCj4gDQo+IENo
ZWVycywNCj4gTG9uZ21hbg0KPiANCj4gDQo=
