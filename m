Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 683992500A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 17:15:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZwfW34lTzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 01:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZwRC5bBtzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 01:05:22 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-126-7nFhgKAtOJWwj5eufa76-g-1; Mon, 24 Aug 2020 16:05:14 +0100
X-MC-Unique: 7nFhgKAtOJWwj5eufa76-g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 24 Aug 2020 16:05:13 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 24 Aug 2020 16:05:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guohua Zhong' <zhongguohua1@huawei.com>, "paubert@iram.es"
 <paubert@iram.es>
Subject: =?utf-8?B?UkU6IFJl77yaUmU6IFtQQVRDSF0gcG93ZXJwYzogRml4IGEgYnVnIGluIF9f?=
 =?utf-8?Q?div64=5F32_if_divisor_is_zero?=
Thread-Topic: =?utf-8?B?UmXvvJpSZTogW1BBVENIXSBwb3dlcnBjOiBGaXggYSBidWcgaW4gX19kaXY2?=
 =?utf-8?Q?4=5F32_if_divisor_is_zero?=
Thread-Index: AQHWehocKoZB4BlfFESHO90JupmxU6lHWu5w
Date: Mon, 24 Aug 2020 15:05:13 +0000
Message-ID: <c200b38836674bbbb928bf76cbb978f1@AcuMS.aculab.com>
References: <20200822172524.GA5451@lt-gp.iram.es>
 <20200824132539.35972-1-zhongguohua1@huawei.com>
In-Reply-To: <20200824132539.35972-1-zhongguohua1@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "wangle6@huawei.com" <wangle6@huawei.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "nixiaoming@huawei.com" <nixiaoming@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogR3VvaHVhIFpob25nDQo+IFNlbnQ6IDI0IEF1Z3VzdCAyMDIwIDE0OjI2DQo+IA0KPiA+
PiA+SW4gZ2VuZXJpYyB2ZXJzaW9uIGluIGxpYi9tYXRoL2RpdjY0LmMsIHRoZXJlIGlzIG5vIGNo
ZWNraW5nIG9mICdiYXNlJw0KPiA+PiA+ZWl0aGVyLg0KPiA+PiA+RG8gd2UgcmVhbGx5IHdhbnQg
dG8gYWRkIHRoaXMgY2hlY2sgaW4gdGhlIHBvd2VycGMgdmVyc2lvbiBvbmx5ID8NCj4gPj4NCj4g
Pj4gPlRoZSBvbmx5IHVzZXIgb2YgX19kaXY2NF8zMigpIGlzIGRvX2RpdigpIGluDQo+ID4+ID5p
bmNsdWRlL2FzbS1nZW5lcmljL2RpdjY0LmguIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBkbyB0
aGUgY2hlY2sgdGhlcmUgPw0KPiA+Pg0KPiA+PiA+Q2hyaXN0b3BoZQ0KPiA+Pg0KPiA+PiBZZXQs
IEkgaGF2ZSBub3RpY2VkIHRoYXQgdGhlcmUgaXMgbm8gY2hlY2tpbmcgb2YgJ2Jhc2UnIGluIHRo
ZXNlIGZ1bmN0aW9ucy4NCj4gPj4gQnV0IEkgYW0gbm90IHN1cmUgaG93IHRvIGNoZWNrIGlzIGJl
dHRlci5BcyB3ZSBrbm93IHRoYXQgdGhlIHJlc3VsdCBpcw0KPiA+PiB1bmRlZmluZWQgd2hlbiBk
aXZpc29yIGlzIHplcm8uIEl0IG1heWJlIGdvb2QgdG8gcHJpbnQgZXJyb3IgYW5kIGR1bXAgc3Rh
Y2suDQoNCkkgdGhvdWdodCB0aGF0IHRoZSBvbnVzIHdhcyBwdXQgb24gdGhlIGNhbGxlciB0byBh
dm9pZCBkaXZpZGUgYnkgemVyby4NCg0KT24geDg2IGRpdmlkZSBieSB6ZXJvIGNhdXNlcyBhbiBl
eGNlcHRpb24gd2hpY2ggKEknbSBwcmV0dHkgc3VyZSkNCmxlYWRzIHRvIGEgb29wcy9wYW5pYy4N
Cg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2Fk
LCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykNCg==

