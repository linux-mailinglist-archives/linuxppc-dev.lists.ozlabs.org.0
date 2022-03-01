Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13B4C98B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 23:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Xjf1pbxz3bxf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:58:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7Xj74xtLz30NW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 09:58:17 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-115-iQhP_KcpMfqbKr15oucLPQ-1; Tue, 01 Mar 2022 22:58:13 +0000
X-MC-Unique: iQhP_KcpMfqbKr15oucLPQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 22:58:11 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 1 Mar 2022 22:58:11 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Topic: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Index: AQHYLZ9++DU/OogLf0+tiSFmjztyUKyrHL5A
Date: Tue, 1 Mar 2022 22:58:11 +0000
Message-ID: <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
In-Reply-To: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd
 Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Mike
 Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMDEgTWFyY2ggMjAyMiAxOTowNw0KPiBPbiBN
b24sIEZlYiAyOCwgMjAyMiBhdCAyOjI5IFBNIEphbWVzIEJvdHRvbWxleQ0KPiA8SmFtZXMuQm90
dG9tbGV5QGhhbnNlbnBhcnRuZXJzaGlwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIb3dldmVyLCBp
ZiB0aGUgZGVzaXJlIGlzIHJlYWxseSB0byBwb2lzb24gdGhlIGxvb3AgdmFyaWFibGUgdGhlbiB3
ZQ0KPiA+IGNhbiBkbw0KPiA+DQo+ID4gI2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcywg
aGVhZCwgbWVtYmVyKSAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgZm9y
IChwb3MgPSBsaXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVvZigqcG9zKSwgbWVtYmVyKTsgICAg
ICAgIFwNCj4gPiAgICAgICAgICAgICAgIWxpc3RfZW50cnlfaXNfaGVhZChwb3MsIGhlYWQsIG1l
bWJlcikgJiYgKChwb3MgPSBOVUxMKSA9PSBOVUxMOyAgICAgICAgICAgICAgICAgICBcDQo+ID4g
ICAgICAgICAgICAgIHBvcyA9IGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikpDQo+ID4NCj4g
PiBXaGljaCB3b3VsZCBhdCBsZWFzdCBzZXQgcG9zIHRvIE5VTEwgd2hlbiB0aGUgbG9vcCBjb21w
bGV0ZXMuDQo+IA0KPiBUaGF0IHdvdWxkIGFjdHVhbGx5IGhhdmUgYmVlbiBleGNlbGxlbnQgaWYg
d2UgaGFkIGRvbmUgdGhhdA0KPiBvcmlnaW5hbGx5LiBJdCB3b3VsZCBub3Qgb25seSBhdm9pZCB0
aGUgc3RhbGUgYW5kIGluY29ycmVjdGx5IHR5cGVkDQo+IGhlYWQgZW50cnkgbGVmdC1vdmVyIHR1
cmQsIGl0IHdvdWxkIGFsc28gaGF2ZSBtYWRlIGl0IHZlcnkgZWFzeSB0bw0KPiB0ZXN0IGZvciAi
ZGlkIEkgZmluZCBhbiBlbnRyeSBpbiB0aGUgbG9vcCIuDQo+IA0KPiBCdXQgSSBkb24ndCBtdWNo
IGxpa2UgaXQgaW4gdGhlIHNpdHVhdGlvbiB3ZSBhcmUgbm93Lg0KPiANCj4gV2h5PyBNYWlubHkg
YmVjYXVzZSBpdCBiYXNpY2FsbHkgY2hhbmdlcyB0aGUgc2VtYW50aWNzIG9mIHRoZSBsb29wDQo+
IF93aXRob3V0XyBhbnkgd2FybmluZ3MgYWJvdXQgaXQuICBBbmQgd2UgZG9uJ3QgYWN0dWFsbHkg
Z2V0IHRoZQ0KPiBhZHZhbnRhZ2Ugb2YgdGhlIG5pY2VyIHNlbWFudGljcywgYmVjYXVzZSB3ZSBj
YW4ndCBhY3R1YWxseSBtYWtlIGNvZGUNCj4gZG8NCj4gDQo+ICAgICAgICAgbGlzdF9mb3JfZWFj
aF9lbnRyeShlbnRyeSwgLi4uLikgew0KPiAgICAgICAgICAgICAgICAgLi4NCj4gICAgICAgICB9
DQo+ICAgICAgICAgaWYgKCFlbnRyeSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7
DQo+ICAgICAgICAgLi4gdXNlIHRoZSBlbnRyeSB3ZSBmb3VuZCAuLg0KPiANCj4gYmVjYXVzZSB0
aGF0IHdvdWxkIGJlIGEgZGlzYXN0ZXIgZm9yIGJhY2stcG9ydGluZywgcGx1cyBpdCB3b3VsZCBi
ZSBhDQo+IGZsYWctZGF5IGlzc3VlIChpZSB3ZSdkIGhhdmUgdG8gY2hhbmdlIHRoZSBzZW1hbnRp
Y3Mgb2YgdGhlIGxvb3AgYXQNCj4gdGhlIHNhbWUgdGltZSB3ZSBjaGFuZ2UgZXZlcnkgc2luZ2xl
IHVzZXIpLg0KPiANCj4gU28gaW5zdGVhZCBvZiB0aGF0IHNpbXBsZSAiaWYgKCFlbnRyeSkiLCB3
ZSdkIGVmZmVjdGl2ZWx5IGhhdmUgdG8NCj4gY29udGludWUgdG8gdXNlIHNvbWV0aGluZyB0aGF0
IHN0aWxsIHdvcmtzIHdpdGggdGhlIG9sZCB3b3JsZCBvcmRlcg0KPiAoaWUgdGhhdCAiaWYgKGxp
c3RfZW50cnlfaXNfaGVhZCgpKSIgbW9kZWwpLg0KPiANCj4gU28gd2UgY291bGRuJ3QgcmVhbGx5
IHRha2UgX2FkdmFudGFnZV8gb2YgdGhlIG5pY2VyIHNlbWFudGljcywgYW5kDQo+IHdlJ2Qgbm90
IGV2ZW4gZ2V0IGEgd2FybmluZyBpZiBzb21lYm9keSBkb2VzIGl0IHdyb25nIC0gdGhlIGNvZGUg
d291bGQNCj4ganVzdCBzaWxlbnRseSBkbyB0aGUgd3JvbmcgdGhpbmcuDQo+IA0KPiBJT1c6IEkg
ZG9uJ3QgdGhpbmsgeW91IGFyZSB3cm9uZyBhYm91dCB0aGF0IHBhdGNoOiBpdCB3b3VsZCBzb2x2
ZSB0aGUNCj4gcHJvYmxlbSB0aGF0IEpha29iIHdhbnRzIHRvIHNvbHZlLCBhbmQgaXQgd291bGQg
aGF2ZSBhYnNvbHV0ZWx5IGJlZW4NCj4gbXVjaCBiZXR0ZXIgaWYgd2UgaGFkIGRvbmUgdGhpcyBm
cm9tIHRoZSBiZWdpbm5pbmcuIEJ1dCBJIHRoaW5rIHRoYXQNCj4gaW4gb3VyIGN1cnJlbnQgc2l0
dWF0aW9uLCBpdCdzIGFjdHVhbGx5IGEgcmVhbGx5IGZyYWdpbGUgc29sdXRpb24gdG8NCj4gdGhl
ICJkb24ndCBkbyB0aGF0IHRoZW4iIHByb2JsZW0gd2UgaGF2ZS4NCg0KQ2FuIGl0IGJlIHJlc29s
dmVkIGJ5IG1ha2luZzoNCiNkZWZpbmUgbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVhZCwgbWVt
YmVyKSAoKHBvcykgPT0gTlVMTCkNCmFuZCBkb3VibGUtY2hlY2tpbmcgdGhhdCBpdCBpc24ndCB1
c2VkIGFueXdoZXJlIGVsc2UgKGV4Y2VwdCBpbg0KdGhlIGxpc3QgbWFjcm9zIHRoZW1zZWx2ZXMp
Lg0KDQpUaGUgb2RkIG9uZXMgSSBqdXN0IGZvdW5kIGFyZSBmcy9sb2Nrcy5jIG1tL3BhZ2VfcmVw
b3J0aW5nLmMNCnNlY3VyaXR5L2FwcGFybW9yL2FwcGFybW9yZnMuYyAoMyB0aW1lcykNCg0KbmV0
L3hmcm0veGZybV9pcGNvbXAuYyNMMjQ0IGlzIGJ1Z2d5Lg0KKFRoZXJlIGlzIGEgV0FSTl9PTigp
IHRoZW4gaXQganVzdCBjYXJyaWVzIG9uIHJlZ2FyZGxlc3MhKQ0KDQpUaGVyZSBhcmUgb25seSBh
Ym91dCAyNSB1c2VzIG9mIGxpc3RfZW50cnlfaXNfaGVhZCgpLg0KDQpUaGVyZSBhcmUgYSBsb3Qg
bW9yZSBwbGFjZXMgd2hlcmUgdGhlc2UgbGlzdHMgc2VlbSB0byBiZSBzY2FubmVkIGJ5IGhhbmQu
DQpJIGJldCBhIGZldyBvZiB0aG9zZSBhcmVuJ3QgYWN0dWFsbHkgcmlnaHQgZWl0aGVyLg0KDQoo
T2ggYXQgM2FtIHRoaXMgbW9ybmluZyBJIHRob3VnaHQgaXQgd2FzIGEgZGlmZmVyZW50IGxpc3Qg
dHlwZQ0KdGhhdCBjb3VsZCBoYXZlIG11Y2ggdGhlIHNhbWUgcHJvYmxlbSEpDQoNCkFub3RoZXIg
cGxhdXNpYmxlIHNvbHV0aW9uIGlzIGEgdmFyaWFudCBvZiBsaXN0X2ZvcmVhY2hfZW50cnkoKQ0K
dGhhdCBkb2VzIHNldCB0aGUgJ2VudHJ5JyB0byBOVUxMIGF0IHRoZSBlbmQuDQpUaGVuIGNvZGUg
Y2FuIGJlIG1vdmVkIG92ZXIgaW4gc3RhZ2VzLg0KSSdkIHJlb3JkZXIgdGhlIGFyZ3VtZW50cyBh
cyB3ZWxsIGFzIGNoYW5naW5nIHRoZSBuYW1lIQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBB
ZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMs
IE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

