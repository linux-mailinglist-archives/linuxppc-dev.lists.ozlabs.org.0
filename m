Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887674EA272
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 23:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS5Yw52VBz3c9R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 08:34:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRsHf2gYGz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 23:21:17 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-8-vkuU1pGbNXCyrAVN_KskHQ-1; Mon, 28 Mar 2022 13:21:10 +0100
X-MC-Unique: vkuU1pGbNXCyrAVN_KskHQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 13:21:04 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 28 Mar 2022 13:21:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kalle Valo' <kvalo@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>
Subject: RE: [PATCH 21/22] rtw89: Replace comments with C99 initializers
Thread-Topic: [PATCH 21/22] rtw89: Replace comments with C99 initializers
Thread-Index: AQHYQoY88SRtyCmm7EOK7E4AJyEA9qzUtsLg
Date: Mon, 28 Mar 2022 12:21:04 +0000
Message-ID: <6082d343f18a40229df83e3102e7dc38@AcuMS.aculab.com>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-21-benni@stuerz.xyz>
 <f7bb9164-2f66-8985-5771-5f31ee5740b7@lwfinger.net>
 <87k0cezarl.fsf@kernel.org>
In-Reply-To: <87k0cezarl.fsf@kernel.org>
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
X-Mailman-Approved-At: Tue, 29 Mar 2022 08:33:34 +1100
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-atm-general@lists.sourceforge.net"
 <linux-atm-general@lists.sourceforge.net>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "robert.moore@intel.com" <robert.moore@intel.com>,
 "laforge@gnumonks.org" <laforge@gnumonks.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
 =?utf-8?B?QmVuamFtaW4gU3TDvHJ6?= <benni@stuerz.xyz>,
 "pkshih@realtek.com" <pkshih@realtek.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "dennis.dalessandro@cornelisnetworks.com"
 <dennis.dalessandro@cornelisnetworks.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "krzk@kernel.org" <krzk@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "mingo@redhat.com" <mingo@redhat.com>, "3chas3@gmail.com" <3chas3@gmail.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "mike.marciniszyn@cornelisnetworks.com"
 <mike.marciniszyn@cornelisnetworks.com>, "rric@kernel.org" <rric@kernel.org>,
 "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
 "bp@alien8.de" <bp@alien8.de>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux@simtec.co.uk" <linux@simtec.co.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devel@acpica.org" <devel@acpica.org>,
 "isdn@linux-pingi.de" <isdn@linux-pingi.de>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "fbarrat@linux.ibm.com" <fbarrat@linux.ibm.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "pali@kernel.org" <pali@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogS2FsbGUgVmFsbw0KPiBTZW50OiAyOCBNYXJjaCAyMDIyIDEwOjI5DQo+IA0KPiBMYXJy
eSBGaW5nZXIgPExhcnJ5LkZpbmdlckBsd2Zpbmdlci5uZXQ+IHdyaXRlczoNCj4gDQo+ID4gT24g
My8yNi8yMiAxMTo1OSwgQmVuamFtaW4gU3TDvHJ6IHdyb3RlOg0KPiA+PiBUaGlzIHJlcGxhY2Vz
IGNvbW1lbnRzIHdpdGggQzk5J3MgZGVzaWduYXRlZA0KPiA+PiBpbml0aWFsaXplcnMgYmVjYXVz
ZSB0aGUga2VybmVsIHN1cHBvcnRzIHRoZW0gbm93Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBCZW5qYW1pbiBTdMO8cnogPGJlbm5pQHN0dWVyei54eXo+DQo+ID4+IC0tLQ0KPiA+PiAgIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvY29leC5jIHwgNDAgKysrKysrKysrKyst
LS0tLS0tLS0tLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9yZWFsdGVrL3J0dzg5L2NvZXguYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3
ODkvY29leC5jDQo+ID4+IGluZGV4IDY4NDU4Mzk1NTUxMS4uM2M4M2EwYmZiMTIwIDEwMDY0NA0K
PiA+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvZXguYw0KPiA+
PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvZXguYw0KPiA+PiBA
QCAtOTcsMjYgKzk3LDI2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnR3ODlfYnRjX2ZidGNfc2xv
dCBzX2RlZltdID0gew0KPiA+PiAgIH07DQo+ID4+ICAgICBzdGF0aWMgY29uc3QgdTMyIGN4dGJs
W10gPSB7DQo+ID4+IC0JMHhmZmZmZmZmZiwgLyogMCAqLw0KPiA+PiAtCTB4YWFhYWFhYWEsIC8q
IDEgKi8NCj4gPj4gLQkweDU1NTU1NTU1LCAvKiAyICovDQo+ID4+IC0JMHg2NjU1NTU1NSwgLyog
MyAqLw0KPiA+PiAtCTB4NjY1NTY2NTUsIC8qIDQgKi8NCj4gPj4gLQkweDVhNWE1YTVhLCAvKiA1
ICovDQo+ID4+IC0JMHg1YTVhNWFhYSwgLyogNiAqLw0KPiA+PiAtCTB4YWE1YTVhNWEsIC8qIDcg
Ki8NCj4gPj4gLQkweDZhNWE1YTVhLCAvKiA4ICovDQo+ID4+IC0JMHg2YTVhNWFhYSwgLyogOSAq
Lw0KPiA+PiAtCTB4NmE1YTZhNWEsIC8qIDEwICovDQo+ID4+IC0JMHg2YTVhNmFhYSwgLyogMTEg
Ki8NCj4gPj4gLQkweDZhZmE1YWZhLCAvKiAxMiAqLw0KPiA+PiAtCTB4YWFhYTVhYWEsIC8qIDEz
ICovDQo+ID4+IC0JMHhhYWZmZmZhYSwgLyogMTQgKi8NCj4gPj4gLQkweGFhNTU1NWFhLCAvKiAx
NSAqLw0KPiA+PiAtCTB4ZmFmYWZhZmEsIC8qIDE2ICovDQo+ID4+IC0JMHhmZmZmZGRmZiwgLyog
MTcgKi8NCj4gPj4gLQkweGRhZmZkYWZmLCAvKiAxOCAqLw0KPiA+PiAtCTB4ZmFmYWRhZmEgIC8q
IDE5ICovDQo+ID4+ICsJWzBdICA9IDB4ZmZmZmZmZmYsDQo+ID4+ICsJWzFdICA9IDB4YWFhYWFh
YWEsDQo+ID4+ICsJWzJdICA9IDB4NTU1NTU1NTUsDQo+ID4+ICsJWzNdICA9IDB4NjY1NTU1NTUs
DQo+ID4+ICsJWzRdICA9IDB4NjY1NTY2NTUsDQo+ID4+ICsJWzVdICA9IDB4NWE1YTVhNWEsDQo+
ID4+ICsJWzZdICA9IDB4NWE1YTVhYWEsDQo+ID4+ICsJWzddICA9IDB4YWE1YTVhNWEsDQo+ID4+
ICsJWzhdICA9IDB4NmE1YTVhNWEsDQo+ID4+ICsJWzldICA9IDB4NmE1YTVhYWEsDQo+ID4+ICsJ
WzEwXSA9IDB4NmE1YTZhNWEsDQo+ID4+ICsJWzExXSA9IDB4NmE1YTZhYWEsDQo+ID4+ICsJWzEy
XSA9IDB4NmFmYTVhZmEsDQo+ID4+ICsJWzEzXSA9IDB4YWFhYTVhYWEsDQo+ID4+ICsJWzE0XSA9
IDB4YWFmZmZmYWEsDQo+ID4+ICsJWzE1XSA9IDB4YWE1NTU1YWEsDQo+ID4+ICsJWzE2XSA9IDB4
ZmFmYWZhZmEsDQo+ID4+ICsJWzE3XSA9IDB4ZmZmZmRkZmYsDQo+ID4+ICsJWzE4XSA9IDB4ZGFm
ZmRhZmYsDQo+ID4+ICsJWzE5XSA9IDB4ZmFmYWRhZmENCj4gPj4gICB9Ow0KPiA+PiAgICAgc3Ry
dWN0IHJ0dzg5X2J0Y19idGZfdGx2IHsNCj4gPg0KPiA+DQo+ID4gSXMgdGhpcyBjaGFuZ2UgcmVh
bGx5IG5lY2Vzc2FyeT8gWWVzLCB0aGUgZW50cmllcyBtdXN0IGJlIG9yZGVyZWQ7DQo+ID4gaG93
ZXZlciwgdGhlIGNvbW1lbnQgY2FycmllcyB0aGF0IGluZm9ybWF0aW9uIGF0IHZlcnkgZmV3IGV4
dHJhDQo+ID4gY2hhcmFjdGVycy4gVG8gbWUsIHRoaXMgcGF0Y2ggbG9va3MgbGlrZSB1bm5lZWRl
ZCBzb3VyY2UgY2h1cm4uDQo+IA0KPiBPbmUgc21hbGwgYmVuZWZpdCBJIHNlZSBpcyB0byBhdm9p
ZCB0aGUgY29tbWVudCBpbmRleCBiZWluZyB3cm9uZyBhbmQNCj4gdGhlcmUgd291bGQgYmUgbm8g
d2F5IHRvIGNhdGNoIHRoYXQuIEJ1dCBvdGhlcndpc2UgSSBkb24ndCBoYXZlIGFueQ0KPiBvcGlu
aW9uIGFib3V0IHRoaXMuDQoNCklmIHRoZSBbbm5dIGFyZSB3cm9uZyB0aGUgZWZmZWN0IGlzIHBy
b2JhYmx5IHdvcnNlLg0KWW91IHJlYWxseSBkb24ndCB3YW50IGEgZ2FwIQ0KDQpEb2Vzbid0IHNl
ZW0gd29ydGggdXNpbmcgQzk5IGluaXRpYWxpc2VycyB1bmxlc3MgdGhleSBhcmUNCiNkZWZpbmVz
IG9yIGVudW0gdmFsdWVzLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

