Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9436672A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 10:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQDbm3MPcz30Dk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 18:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQDbP5rR3z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 18:43:10 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-118-CrBwdaVmPfOEx9eMOh2cMQ-1; Wed, 21 Apr 2021 09:43:02 +0100
X-MC-Unique: CrBwdaVmPfOEx9eMOh2cMQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 21 Apr 2021 09:43:01 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 21 Apr 2021 09:43:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Vineet Gupta
 <Vineet.Gupta1@synopsys.com>
Subject: RE: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXNir2f1yRrc3ugkWz9MvyD1ZvgKq+pqyQ
Date: Wed, 21 Apr 2021 08:43:01 +0000
Message-ID: <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
 <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
In-Reply-To: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
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
Cc: "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAyMCBBcHJpbCAyMDIxIDIyOjIwDQo+IA0KPiBP
biBUdWUsIEFwciAyMCwgMjAyMSBhdCAxMToxNCBQTSBWaW5lZXQgR3VwdGENCj4gPFZpbmVldC5H
dXB0YTFAc3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiBPbiA0LzIwLzIxIDEyOjA3IEFNLCBBcm5k
IEJlcmdtYW5uIHdyb3RlOg0KPiANCj4gPiA+DQo+ID4gPiB3aGljaCBtZWFucyB0aGF0IGhhbGYg
dGhlIDMyLWJpdCBhcmNoaXRlY3R1cmVzIGRvIHRoaXMuIFRoaXMgbWF5DQo+ID4gPiBjYXVzZSBt
b3JlIHByb2JsZW1zIHdoZW4gYXJjIGFuZC9vciBtaWNyb2JsYXplIHdhbnQgdG8gc3VwcG9ydA0K
PiA+ID4gNjQtYml0IGtlcm5lbHMgYW5kIGNvbXBhdCBtb2RlIGluIHRoZSBmdXR1cmUgb24gdGhl
aXIgbGF0ZXN0IGhhcmR3YXJlLA0KPiA+ID4gYXMgdGhhdCBtZWFucyBkdXBsaWNhdGluZyB0aGUg
eDg2IHNwZWNpZmljIGhhY2tzIHdlIGhhdmUgZm9yIGNvbXBhdC4NCj4gPiA+DQo+ID4gPiBXaGF0
IGlzIGFsaWdub2YodTY0KSBvbiA2NC1iaXQgYXJjPw0KPiA+DQo+ID4gJCBlY2hvICdpbnQgYSA9
IF9fYWxpZ25vZl9fKGxvbmcgbG9uZyk7JyB8IGFyYzY0LWxpbnV4LWdudS1nY2MgLXhjIC0NCj4g
PiAtV2FsbCAtUyAtbyAtIHwgZ3JlcCAtQTEgYTogfCB0YWlsIC1uIDEgfCBjdXQgLWYgMw0KPiA+
IDgNCj4gDQo+IE9rLCBnb29kLg0KDQpUaGF0IHRlc3QgZG9lc24ndCBwcm92ZSBhbnl0aGluZy4N
ClRyeSBydW5uaW5nIG9uIHg4NjoNCiQgZWNobyAnaW50IGEgPSBfX2FsaWdub2ZfXyhsb25nIGxv
bmcpOycgfCBnY2MgLXhjIC0gLVdhbGwgLVMgLW8gLSAtbTMyDQogICAgICAgIC5maWxlICAgIiIN
CiAgICAgICAgLmdsb2JsICBhDQogICAgICAgIC5kYXRhDQogICAgICAgIC5hbGlnbiA0DQogICAg
ICAgIC50eXBlICAgYSwgQG9iamVjdA0KICAgICAgICAuc2l6ZSAgIGEsIDQNCmE6DQogICAgICAg
IC5sb25nICAgOA0KICAgICAgICAuaWRlbnQgICJHQ0M6IChVYnVudHUgNS40LjAtNnVidW50dTF+
MTYuMDQuMTApIDUuNC4wIDIwMTYwNjA5Ig0KICAgICAgICAuc2VjdGlvbiAgICAgICAgLm5vdGUu
R05VLXN0YWNrLCIiLEBwcm9nYml0cw0KDQpVc2luZyAnX19hbGlnbm9mX18oc3RydWN0IHtsb25n
IGxvbmcgeDt9KScgZG9lcyBnaXZlIHRoZSBleHBlY3RlZCA0Lg0KDQpfX2FsaWdub2ZfXygpIHJl
dHVybnMgdGhlIHByZWZlcnJlZCBhbGlnbm1lbnQsIG5vdCB0aGUgZW5mb3JjZWQNCmFsaWdubW5l
dCAtIGdvIGZpZ3VyZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lk
ZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0K
UmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

