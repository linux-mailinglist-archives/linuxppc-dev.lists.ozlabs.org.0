Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FCF36302A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 15:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMtgv5R07z3c0l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:08:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMtgY2PH8z303g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 23:08:39 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-40-NxhZsd9HMzmFc3zLPSZr6w-1; Sat, 17 Apr 2021 14:08:31 +0100
X-MC-Unique: NxhZsd9HMzmFc3zLPSZr6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 14:08:30 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 14:08:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Grygorii Strashko' <grygorii.strashko@ti.com>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Subject: RE: Bogus struct page layout on 32-bit
Thread-Topic: Bogus struct page layout on 32-bit
Thread-Index: AQHXMqLVEv6dx6LXIEqsc09GLT7Ydaq4r3RA
Date: Sat, 17 Apr 2021 13:08:30 +0000
Message-ID: <e8247c8d079d45928990031870db7a9e@AcuMS.aculab.com>
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
 <20210410082158.79ad09a6@carbon>
 <CAC_iWjLXZ6-hhvmvee6r4R_N64u-hrnLqE_CSS1nQk+YaMQQnA@mail.gmail.com>
 <ab9f1a6c-4099-2b59-457d-fcc45d2396f4@ti.com>
In-Reply-To: <ab9f1a6c-4099-2b59-457d-fcc45d2396f4@ti.com>
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Linux-MM <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28NCj4gU2VudDogMTYgQXByaWwgMjAyMSAxMDoyNw0KLi4u
DQo+IFNyeSwgZm9yIGRlbGF5ZWQgcmVwbHkuDQo+IA0KPiBUaGUgVEkgcGxhdGZvcm1zIGFtMy80
LzUgKGNwc3cpIGFuZCBLZXlzdG9uZSAyIChuZXRjcCkgY2FuIGRvIG9ubHkgMzJiaXQgRE1BIGV2
ZW4gaW4gY2FzZSBvZiBMUEFFDQo+IChkbWEtcmFuZ2VzIGFyZSB1c2VkKS4NCj4gT3JpZ2luYWxs
eSwgYXMgSSByZW1lbWJlciwgQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVCBoYXMgbm90IGJl
ZW4gc2VsZWN0ZWQgZm9yIHRoZSBMUEFFIGNhc2UNCj4gb24gVEkgcGxhdGZvcm1zIGFuZCB0aGUg
ZmFjdCB0aGF0IGl0IGJlY2FtZSBzZXQgaXMgdGhlIHJlc3VsdCBvZiBtdWx0aS1wYWx0Zm9ybS9h
bGxYWFhjb25maWcvRE1BDQo+IG9wdGltaXphdGlvbnMgYW5kIHVuaWZpY2F0aW9uLg0KPiAoanVz
dCBjaGVja2VkIC0gbm90IHNldCBpbiA0LjE0KQ0KPiANCj4gUHJvYmFibGUgY29tbWl0IDQ5NjVh
Njg3ODBjNSAoImFyY2g6IGRlZmluZSB0aGUgQVJDSF9ETUFfQUREUl9UXzY0QklUIGNvbmZpZyBz
eW1ib2wgaW4gbGliL0tjb25maWciKS4NCj4gDQo+IFRoZSBUSSBkcml2ZXJzIGhhdmUgYmVlbiB1
cGRhdGVkLCBmaW5hbGx5IHRvIGFjY2VwdCBBUkNIX0RNQV9BRERSX1RfNjRCSVQ9eSBieSB1c2lu
ZyB0aGluZ3MgbGlrZQ0KPiAoX19mb3JjZSB1MzIpDQo+IGZvciBleGFtcGxlLg0KDQpIbW1tIHVz
aW5nIChfX2ZvcmNlIHUzMikgaXMgcHJvYmFibHkgd3JvbmcuDQpJZiBhbiBhZGRyZXNzICtsZW5n
dGggPj0gMioqMzIgY2FuIGdldCBwYXNzZWQgdGhlbiB0aGUgSU8gcmVxdWVzdA0KbmVlZHMgdG8g
YmUgZXJyb3JlZCAob3IgYSBib3VuY2UgYnVmZmVyIHVzZWQpLg0KDQpPdGhlcndpc2UgeW91IGNh
biBnZXQgcGFydGljdWxhcmx5IGhvcnJpZCBjb3JydXB0aW9ucy4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

