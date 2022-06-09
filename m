Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591654512D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 17:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJpNw22GFz3brR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 01:46:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJpNP6S14z3bmF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 01:46:11 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-243-Is8WKNGQOX6dncctkojYSw-1; Thu, 09 Jun 2022 16:46:05 +0100
X-MC-Unique: Is8WKNGQOX6dncctkojYSw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Thu, 9 Jun 2022 16:46:04 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Thu, 9 Jun 2022 16:46:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sebastian Andrzej Siewior' <bigeasy@linutronix.de>, Davidlohr Bueso
	<dave@stgolabs.net>
Subject: RE: [PATCH 09/10] scsi/ibmvscsi: Replace srp tasklet with work
Thread-Topic: [PATCH 09/10] scsi/ibmvscsi: Replace srp tasklet with work
Thread-Index: AQHYfBIQ5eC55mb1HE+HVpd+R7cwqq1HLyyA
Date: Thu, 9 Jun 2022 15:46:04 +0000
Message-ID: <7faa88aaf7554545a60561d73597dc4f@AcuMS.aculab.com>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-10-dave@stgolabs.net> <YqILmd/WnNT/zYrf@linutronix.de>
In-Reply-To: <YqILmd/WnNT/zYrf@linutronix.de>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, "ejb@linux.ibm.com" <ejb@linux.ibm.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvcg0KPiBTZW50OiAwOSBKdW5lIDIwMjIgMTY6
MDMNCj4gDQo+IE9uIDIwMjItMDUtMzAgMTY6MTU6MTEgWy0wNzAwXSwgRGF2aWRsb2hyIEJ1ZXNv
IHdyb3RlOg0KPiA+IFRhc2tsZXRzIGhhdmUgbG9uZyBiZWVuIGRlcHJlY2F0ZWQgYXMgYmVpbmcg
dG9vIGhlYXZ5IG9uIHRoZSBzeXN0ZW0NCj4gPiBieSBydW5uaW5nIGluIGlycSBjb250ZXh0IC0g
YW5kIHRoaXMgaXMgbm90IGEgcGVyZm9ybWFuY2UgY3JpdGljYWwNCj4gPiBwYXRoLiBJZiBhIGhp
Z2hlciBwcmlvcml0eSBwcm9jZXNzIHdhbnRzIHRvIHJ1biwgaXQgbXVzdCB3YWl0IGZvcg0KPiA+
IHRoZSB0YXNrbGV0IHRvIGZpbmlzaCBiZWZvcmUgZG9pbmcgc28uDQo+ID4NCj4gPiBQcm9jZXNz
IHNycHMgYXN5bmNocm9ub3VzbHkgaW4gcHJvY2VzcyBjb250ZXh0IGluIGEgZGVkaWNhdGVkDQo+
ID4gc2luZ2xlIHRocmVhZGVkIHdvcmtxdWV1ZS4NCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0aHJl
YWRlZCBpbnRlcnJ1cHRzIGluc3RlYWQuIFRoZSBwYXR0ZXJuIGhlcmUgaXMgdGhlDQo+IHNhbWUg
YXMgaW4gdGhlIHByZXZpb3VzIGRyaXZlciBleGNlcHQgaGVyZSBpcyBsZXNzIGxvY2tpbmcuDQoN
CkhvdyBsb25nIGRvIHRoZXNlIGFjdGlvbnMgcnVucyBmb3IsIGFuZCB3aGF0IGlzIHdhaXRpbmcg
Zm9yDQp0aGVtIHRvIGZpbmlzaD8NCg0KVGhlc2UgY2hhbmdlcyBzZWVtIHRvIGRyb3AgdGhlIHBy
aW9yaXR5IGZyb20gYWJvdmUgdGhhdCBvZiB0aGUNCmhpZ2hlc3QgcHJpb3JpdHkgUlQgcHJvY2Vz
cyBkb3duIHRvIHRoYXQgb2YgYSBkZWZhdWx0IHByaW9yaXR5DQp1c2VyIHByb2Nlc3MuDQpUaGVy
ZSBpcyBubyByZWFsIGd1YXJhbnRlZSB0aGF0IHRoZSBsYXR0ZXIgd2lsbCBydW4gJ2FueSB0aW1l
IHNvb24nLg0KDQpDb25zaWRlciBzb21lIHdvcmtsb2FkcyBJJ20gc2V0dGluZyB1cCB3aGVyZSBt
b3N0IG9mIHRoZSBjcHUgYXJlDQpsaWtlbHkgdG8gc3BlbmQgOTAlKyBvZiB0aGUgdGltZSBydW5u
aW5nIHByb2Nlc3NlcyB1bmRlciB0aGUgUlQNCnNjaGVkdWxlciB0aGF0IGFyZSBwcm9jZXNzaW5n
IGF1ZGlvLg0KDQpJdCBpcyBxdWl0ZSBsaWtlbHkgdGhhdCBhIG5vbi1SVCB0aHJlYWQgKGVzcGVj
aWFsbHkgb25lIGJvdW5kDQp0byBhIHNwZWNpZmljIGNwdSkgd29uJ3QgcnVuIGZvciBzZXZlcmFs
IG1pbGxpc2Vjb25kcy4NCihXZSBoYXZlIHRvIGdvIHRocm91Z2ggJ2hvb3BzJyB0byBhdm9pZCBk
cm9wcGluZyBldGhlcm5ldCBmcmFtZXMuKQ0KDQpJJ2QgaGF2ZSB0aG91Z2h0IHRoYXQgc29tZSBv
ZiB0aGVzZSBrZXJuZWwgdGhyZWFkcyByZWFsbHkNCm5lZWQgdG8gcnVuIGF0IGEgJ21pZGRsaW5n
JyBSVCBwcmlvcml0eS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lk
ZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0K
UmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

