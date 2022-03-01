Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD04C8B01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Fhd3xb0z3bqn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 22:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7Fgq3ZPVz3byv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 22:41:10 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-37-mgVLvuYEMc62HB_eDoossw-1; Tue, 01 Mar 2022 11:41:07 +0000
X-MC-Unique: mgVLvuYEMc62HB_eDoossw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:41:06 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 1 Mar 2022 11:41:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, 'Segher Boessenkool'
 <segher@kernel.crashing.org>
Subject: RE: [PATCH] net: Remove branch in csum_shift()
Thread-Topic: [PATCH] net: Remove branch in csum_shift()
Thread-Index: AQHYHyQqmTo4K/pb5UWdDmTfE7rfRayQxWFwgABxD4CAAIxicIAYqtUAgAAE/lCAAAowAIAABVwg
Date: Tue, 1 Mar 2022 11:41:06 +0000
Message-ID: <10309fa64833418a980a8d950d037357@AcuMS.aculab.com>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
 <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
 <20220213091619.GY614@gate.crashing.org>
 <476aa649389345db92f86e9103a848be@AcuMS.aculab.com>
 <de560db6-d29a-8565-857b-b42ae35f80f8@csgroup.eu>
 <9cdb4a5243d342efb562bc61d0c1bfcb@AcuMS.aculab.com>
 <c616f9a6-c9db-d3a7-1b23-f827732566bb@csgroup.eu>
In-Reply-To: <c616f9a6-c9db-d3a7-1b23-f827732566bb@csgroup.eu>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAwMSBNYXJjaCAyMDIyIDExOjE1DQouLi4N
Cj4gTG9va3MgbGlrZSBBUk0gYWxzbyBkb2VzIGJldHRlciBjb2RlIHdpdGggdGhlIGdlbmVyaWMg
aW1wbGVtZW50YXRpb24gYXMNCj4gaXQgc2VlbXMgdG8gaGF2ZSBzb21lIGxvb2tpbmcgbGlrZSBj
b25kaXRpb25hbCBpbnN0cnVjdGlvbnMgJ3Jvcm5lJyBhbmQNCj4gJ3N0cm5lJy4NCg0KSW4gYXJt
MzIgKGFuZCBJIHRoaW5rIGFybTY0KSBldmVyeSBpbnN0cnVjdGlvbiBpcyBjb25kaXRpb25hbC4N
Cg0KPiBzdGF0aWMgX19hbHdheXNfaW5saW5lIF9fd3N1bSBjc3VtX3NoaWZ0KF9fd3N1bSBzdW0s
IGludCBvZmZzZXQpDQo+IHsNCj4gCS8qIHJvdGF0ZSBzdW0gdG8gYWxpZ24gaXQgd2l0aCBhIDE2
YiBib3VuZGFyeSAqLw0KPiAJaWYgKG9mZnNldCAmIDEpDQo+ICAgICAgMWQyODoJZTIxMDIwMDEg
CWFuZHMJcjIsIHIwLCAjMQ0KPiAgICAgIDFkMmM6CWU1OGQzMDA0IAlzdHIJcjMsIFtzcCwgIzRd
DQo+ICAgKiBAd29yZDogdmFsdWUgdG8gcm90YXRlDQo+ICAgKiBAc2hpZnQ6IGJpdHMgdG8gcm9s
bA0KPiAgICovDQo+IHN0YXRpYyBpbmxpbmUgX191MzIgcm9yMzIoX191MzIgd29yZCwgdW5zaWdu
ZWQgaW50IHNoaWZ0KQ0KPiB7DQo+IAlyZXR1cm4gKHdvcmQgPj4gKHNoaWZ0ICYgMzEpKSB8ICh3
b3JkIDw8ICgoLXNoaWZ0KSAmIDMxKSk7DQo+ICAgICAgMWQzMDoJMTFhMDM0NjMgCXJvcm5lCXIz
LCByMywgIzgNCj4gICAgICAxZDM0OgkxNThkMzAwNCAJc3RybmUJcjMsIFtzcCwgIzRdDQo+IAlp
ZiAodW5saWtlbHkoaW92X2l0ZXJfaXNfcGlwZShpKSkpDQoNClRoZXJlIGlzIGEgc3BhcmUgJ3N0
cicgdGhhdCBhIG1pbm9yIGNvZGUgY2hhbmdlIHdvdWxkDQpwcm9iYWJseSByZW1vdmUuDQpMaWtl
bHkgbm90IGhlbHBlZCBieSByZWdpc3RlcnMgYmVpbmcgc3BpbGxlZCB0byBzdGFjay4NCg0KSVNU
UiBhcm0zMiBoYXZpbmcgYSByZWFzb25hYmxlIG51bWJlciBvZiByZWdpc3RlcnMgYW5kIHRoZW4N
CmEgd2hvbGUgbG9hZCBvZiB0aGVtIGJlaW5nIHN0b2xlbiBieSB0aGUgaW1wbGVtZW50YXRpb24u
DQooSSdtIHN1cmUgSSByZW1lbWJlciBzdGFjayBsaW1pdCBhbmQgdGhyZWFkIGJhc2UuLi4pDQpT
byB0aGUgY29tcGlsZXIgZG9lc24ndCBnZXQgdGhhdCBtYW55IHRvIHBsYXkgd2l0aC4NCg0KTm90
IHF1aXRlIGFzIGJhZCBhcyBuaW9zMiAtIHdoZXJlIHIyIGFuZCByMyBhcmUgJ3Jlc2VydmVkIGZv
cg0KdGhlIGFzc2VtYmxlcicgKGFzIHRoZXkgcHJvYmFibHkgYXJlIG9uIE1JUFMpIGJ1dCB0aGUg
bmlvczINCmFzc2VtYmxlciBkb2Vzbid0IGV2ZXIgbmVlZCB0byB1c2UgdGhlbSENCg0KPiAuLi4N
Cj4gT2ssIHNvIHRoZSBzb2x1dGlvbiB3b3VsZCBiZSB0byBoYXZlIGFuIGFyY2ggc3BlY2lmaWMg
dmVyc2lvbiBvZg0KPiBjc3VtX3NoaWZ0KCkgaW4gdGhlIHNhbWUgcHJpbmNpcGxlIGFzIGNzdW1f
YWRkKCkuDQoNClByb2JhYmx5Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

