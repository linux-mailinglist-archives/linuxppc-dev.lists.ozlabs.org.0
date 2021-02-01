Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D330AE13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 18:39:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTwDr4BtxzDrYX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTwC22JjQzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 04:38:03 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-270-YLUUenDnNpGfVo7ZRnS7KQ-1; Mon, 01 Feb 2021 17:37:57 +0000
X-MC-Unique: YLUUenDnNpGfVo7ZRnS7KQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 1 Feb 2021 17:37:56 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 1 Feb 2021 17:37:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Christopher M. Riedl'" <cmr@codefail.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Topic: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Index: AQHW9SvhJlSFmYQ9tkmGvwf2LRQAGqo811MwgAajugCAAARBUIAADGqAgAALRtA=
Date: Mon, 1 Feb 2021 17:37:56 +0000
Message-ID: <f6234b06ccb54cffb3583f40635636d3@AcuMS.aculab.com>
References: <0433d40adacc47a3a27bc8bc35e076e3@AcuMS.aculab.com>
 <C8YCOH19N9EX.3LXG80WZT1N37@geist>
In-Reply-To: <C8YCOH19N9EX.3LXG80WZT1N37@geist>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZXIgTS4gUmllZGwNCj4gU2VudDogMDEgRmVicnVhcnkgMjAyMSAxNjo1
NQ0KLi4uDQo+ID4gPiA+ID4gKwlpbnQgaTsJCQkJCQkJCVwNCj4gPiA+ID4gPiArCQkJCQkJCQkJ
XA0KPiA+ID4gPiA+ICsJdW5zYWZlX2NvcHlfZnJvbV91c2VyKGJ1ZiwgX19mLCBFTEZfTkZQUkVH
ICogc2l6ZW9mKGRvdWJsZSksCVwNCj4gPiA+ID4gPiArCQkJCWxhYmVsKTsJCQkJCVwNCj4gPiA+
ID4gPiArCWZvciAoaSA9IDA7IGkgPCBFTEZfTkZQUkVHIC0gMTsgaSsrKQkJCQlcDQo+ID4gPiA+
ID4gKwkJX190LT50aHJlYWQuVFNfRlBSKGkpID0gYnVmW2ldOwkJCQlcDQo+ID4gPiA+ID4gKwlf
X3QtPnRocmVhZC5mcF9zdGF0ZS5mcHNjciA9IGJ1ZltpXTsJCQkJXA0KPiA+ID4gPiA+ICt9IHdo
aWxlICgwKQ0KPiA+DQo+ID4gT24gZnVydGhlciByZWZsZWN0aW9uLCBzaW5jZSB5b3UgaW1tZWRp
YXRlbHkgbG9vcCB0aHJvdWdoIHRoZSBidWZmZXINCj4gPiB3aHkgbm90IGp1c3QgdXNlIHVzZXJf
YWNjZXNzX2JlZ2luKCkgYW5kIHVuc2FmZV9nZXRfdXNlcigpIGluIHRoZSBsb29wLg0KPiANCj4g
Q2hyaXN0b3BoZSBoYWQgc3VnZ2VzdGVkIHRoaXMgYSBmZXcgcmV2aXNpb25zIGFnbyBhcyB3ZWxs
LiBXaGVuIEkgdHJpZWQNCj4gdGhpcyBhcHByb2FjaCwgdGhlIHNpZ25hbCBoYW5kbGluZyBwZXJm
b3JtYW5jZSB0b29rIGEgcHJldHR5IGJpZyBoaXQ6DQo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9y
Zy9waXBlcm1haWwvbGludXhwcGMtZGV2LzIwMjAtT2N0b2Jlci8yMTkzNTEuaHRtbA0KPiANCj4g
SSBpbmNsdWRlZCBzb21lIG51bWJlcnMgb24gdjMgYXMgd2VsbCBidXQgZGVjaWRlZCB0byBkcm9w
IHRoZSBhcHByb2FjaA0KPiBhbHRvZ2V0aGVyIGZvciB0aGlzIG9uZSBzaW5jZSBpdCBqdXN0IGRp
ZG4ndCBzZWVtIHdvcnRoIHRoZSBoaXQuDQoNCldhcyB0aGF0IHVzaW5nIHVuc2FmZV9nZXRfdXNl
ciAod2hpY2ggcmVsaWVzIG9uIHVzZXJfYWNjZXNzX2JlZ2luKCkNCmhhdmluZyAnb3BlbmVkIHVw
JyB1c2VyIGFjY2Vzc2VzKSBvciBqdXN0IGdldF91c2VyKCkgdGhhdCBkb2VzDQppdCBmb3IgZXZl
cnkgYWNjZXNzPw0KDQpUaGUgZm9ybWVyIHNob3VsZCBiZSBvaywgdGhlIGxhdHRlciB3aWxsIGJl
IGhvcnJpZC4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJh
bWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0
cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

