Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F75617F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 12:33:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYZRG4nDMz3dtl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYZQl5fXmz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 20:32:29 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-308-GzwqdTqlNsKeXlp4TQFSLw-1; Thu, 30 Jun 2022 11:32:24 +0100
X-MC-Unique: GzwqdTqlNsKeXlp4TQFSLw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Thu, 30 Jun 2022 11:32:23 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Thu, 30 Jun 2022 11:32:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, 'Michael Schmitz'
	<schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Subject: RE: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Thread-Topic: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Thread-Index: AQHYi0Qnhtr21GMXN0qgKN5inTL9yK1nmAnQgAALb4CAAB3CUA==
Date: Thu, 30 Jun 2022 10:32:23 +0000
Message-ID: <8bedba3ddffc435ea44a5e2893583acb@AcuMS.aculab.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <26852797d822462abc1c9f96def7fa42@AcuMS.aculab.com>
 <a36a85a3-3fd3-10ac-cac3-09a90eaf1936@csgroup.eu>
In-Reply-To: <a36a85a3-3fd3-10ac-cac3-09a90eaf1936@csgroup.eu>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, "Maciej W . Rozycki" <macro@orcam.me.uk>, alpha <linux-alpha@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, scsi <linux-scsi@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph
 Hellwig <hch@infradead.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux
 IOMMU <iommu@lists.linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Parisc
 List <linux-parisc@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAzMCBKdW5lIDIwMjIgMTA6NDANCj4gDQo+
IExlIDMwLzA2LzIwMjIgw6AgMTA6MDQsIERhdmlkIExhaWdodCBhIMOpY3JpdMKgOg0KPiA+IEZy
b206IE1pY2hhZWwgU2NobWl0eg0KPiA+PiBTZW50OiAyOSBKdW5lIDIwMjIgMDA6MDkNCj4gPj4N
Cj4gPj4gSGkgQXJuZCwNCj4gPj4NCj4gPj4gT24gMjkvMDYvMjIgMDk6NTAsIEFybmQgQmVyZ21h
bm4gd3JvdGU6DQo+ID4+PiBPbiBUdWUsIEp1biAyOCwgMjAyMiBhdCAxMTowMyBQTSBNaWNoYWVs
IFNjaG1pdHogPHNjaG1pdHptaWNAZ21haWwuY29tPiB3cm90ZToNCj4gPj4+PiBPbiAyOC8wNi8y
MiAxOTowMywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+Pj4+Pj4gVGhlIGRyaXZlciBh
bGxvY2F0ZXMgYm91bmNlIGJ1ZmZlcnMgdXNpbmcga21hbGxvYyBpZiBpdCBoaXRzIGFuDQo+ID4+
Pj4+PiB1bmFsaWduZWQgZGF0YSBidWZmZXIgLSBjYW4gc3VjaCBidWZmZXJzIHN0aWxsIGV2ZW4g
aGFwcGVuIHRoZXNlIGRheXM/DQo+ID4+Pj4+IE5vIGlkZWEuDQo+ID4+Pj4gSG1tbSAtIEkgdGhp
bmsgSSdsbCBzdGljayBhIFdBUk5fT05DRSgpIGluIHRoZXJlIHNvIHdlIGtub3cgd2hldGhlciB0
aGlzDQo+ID4+Pj4gY29kZSBwYXRoIGlzIHN0aWxsIGJlaW5nIHVzZWQuDQo+ID4+PiBrbWFsbG9j
KCkgZ3VhcmFudGVlcyBhbGlnbm1lbnQgdG8gdGhlIG5leHQgcG93ZXItb2YtdHdvIHNpemUgb3IN
Cj4gPj4+IEtNQUxMT0NfTUlOX0FMSUdOLCB3aGljaGV2ZXIgaXMgYmlnZ2VyLiBPbiBtNjhrIHRo
aXMgbWVhbnMgaXQNCj4gPj4+IGlzIGNhY2hlbGluZSBhbGlnbmVkLg0KPiA+Pg0KPiA+PiBBbmQg
YWxsIFNDU0kgYnVmZmVycyBhcmUgYWxsb2NhdGVkIHVzaW5nIGttYWxsb2M/IE5vIHdheSBhdCBh
bGwgZm9yIHVzZXINCj4gPj4gc3BhY2UgdG8gcGFzcyB1bmFsaWduZWQgZGF0YT8NCj4gPg0KPiA+
IEkgZGlkbid0IHRoaW5rIGttYWxsb2MoKSBnYXZlIGFueSBzdWNoIGd1YXJhbnRlZSBhYm91dCBh
bGlnbm1lbnQuDQo+IA0KPiBJIGRvZXMgc2luY2UgY29tbWl0IDU5YmI0Nzk4NWMxZCAoIm1tLCBz
bFthb3VdYjogZ3VhcmFudGVlIG5hdHVyYWwNCj4gYWxpZ25tZW50IGZvciBrbWFsbG9jKHBvd2Vy
LW9mLXR3bykiKQ0KDQpMb29rcyBsaWtlIGl0IGlzIGRvbmUgZm9yICdwb3dlci1vZi10d28nIGxl
c3MgdGhhbiBQQUdFX1NJWkUuDQpUaGlzIG1heSBub3QgaGVscCBzY3NpIHRhcGUgd3JpdGVzIHdo
aWNoIGNvdWxkIGVhc2lseSBiZSAoc2F5KSA0NyBieXRlcy4NCkkgdGhpbmsgdGhhdCBvbmx5IGd1
YXJhbnRlZXMgMiBieXRlIGFsaWdubWVudCBvbiBtNjhrLg0KKEFsdGhvdWdoIGluY3JlYXNpbmcg
dGhlIG1pbi1hbGlnbm1lbnQgb24gbTY4ayB0byA0IChvciBldmVuIDgpDQp3aWxsIHByb2JhYmx5
IG1ha2Ugbm8gbWVhc3VyYWJsZSBkaWZmZXJlbmNlLikNCg0KV2hhdCBoYXBwZW5zIGFib3ZlIFBB
R0VfU0laRT8NCkFueSBzdHJ1Y3R1cmUgd2l0aCBhIHRyYWlsaW5nIFtdIGZpZWxkIGNvdWxkIGVh
c2lseSByZXF1ZXN0DQonNjRrICsgYV9iaXQnIGJ5dGVzLg0KWW91IGRvbid0IHJlYWxseSB3YW50
IHRvIGV4dGVuZCB0aGlzIHRvIDEyOGsgLSBidXQgSSBzdXNwZWN0DQp0aGF0IGlzIHdoYXQgaGFw
cGVucy4NCg0KCURhdmlkDQogDQoNCj4gDQo+IENocmlzdG9waGUNCj4gDQo+ID4gVGhlcmUgYXJl
IGNhY2hlLWxpbmUgYWxpZ25tZW50IHJlcXVpcmVtZW50cyBvbiBzeXN0ZW1zIHdpdGggbm9uLWNv
aGVyZW50DQo+ID4gZG1hLCBidXQgb3RoZXJ3aXNlIHRoZSBhbGlnbm1lbnQgY2FuIGJlIG11Y2gg
c21hbGxlci4NCj4gPg0KPiA+IE9uZSBvZiB0aGUgYWxsb2NhdG9ycyBhZGRzIGEgaGVhZGVyIHRv
IGVhY2ggaXRlbSwgSUlSQyB0aGF0IGNhbg0KPiA+IGxlYWQgdG8gJ3VuZXhwZWN0ZWQnIGFsaWdu
bWVudHMgLSBlc3BlY2lhbGx5IG9uIG02OGsuDQo+ID4NCj4gPiBkbWFfYWxsb2NfY29oZXJlbnQo
KSBkb2VzIGFsaWduIHRvIG5leHQgJ3Bvd2VyIG9mIDInLg0KPiA+IEFuZCBzb21ldGltZXMgeW91
IG5lZWQgKGVnKSAxNmsgYWxsb2NhdGVzIHRoYXQgYXJlIDE2ayBhbGlnbmVkLg0KPiA+DQo+ID4g
CURhdmlkDQo+ID4NCj4gPiAtDQo+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+ID4gUmVn
aXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

