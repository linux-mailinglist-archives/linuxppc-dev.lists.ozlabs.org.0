Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B575F8860
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 00:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlKz50M1dz3f02
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 09:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlKMz1QNNz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 09:19:10 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-78-vsudmffZOXKo2YB6dC4dtQ-1; Sat, 08 Oct 2022 23:18:48 +0100
X-MC-Unique: vsudmffZOXKo2YB6dC4dtQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Sat, 8 Oct
 2022 23:18:45 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Sat, 8 Oct 2022 23:18:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v4 4/6] treewide: use get_random_u32() when possible
Thread-Topic: [PATCH v4 4/6] treewide: use get_random_u32() when possible
Thread-Index: AQHY2ncqUPYFdmCx0kGKfFsfF+6dcq4FEdQw
Date: Sat, 8 Oct 2022 22:18:45 +0000
Message-ID: <f1ca1b53bc104065a83da60161a4c7b6@AcuMS.aculab.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-5-Jason@zx2c4.com>
In-Reply-To: <20221007180107.216067-5-Jason@zx2c4.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Sun, 09 Oct 2022 09:45:10 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vge
 r.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thom
 as Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>, Chuck Lever <chuck.lever@oracle.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogSmFzb24gQS4gRG9uZW5mZWxkDQo+IFNlbnQ6IDA3IE9jdG9iZXIgMjAyMiAxOTowMQ0K
PiANCj4gVGhlIHByYW5kb21fdTMyKCkgZnVuY3Rpb24gaGFzIGJlZW4gYSBkZXByZWNhdGVkIGlu
bGluZSB3cmFwcGVyIGFyb3VuZA0KPiBnZXRfcmFuZG9tX3UzMigpIGZvciBzZXZlcmFsIHJlbGVh
c2VzIG5vdywgYW5kIGNvbXBpbGVzIGRvd24gdG8gdGhlDQo+IGV4YWN0IHNhbWUgY29kZS4gUmVw
bGFjZSB0aGUgZGVwcmVjYXRlZCB3cmFwcGVyIHdpdGggYSBkaXJlY3QgY2FsbCB0bw0KPiB0aGUg
cmVhbCBmdW5jdGlvbi4gVGhlIHNhbWUgYWxzbyBhcHBsaWVzIHRvIGdldF9yYW5kb21faW50KCks
IHdoaWNoIGlzDQo+IGp1c3QgYSB3cmFwcGVyIGFyb3VuZCBnZXRfcmFuZG9tX3UzMigpLg0KPiAN
Ci4uLg0KPiBkaWZmIC0tZ2l0IGEvbmV0LzgwMi9nYXJwLmMgYi9uZXQvODAyL2dhcnAuYw0KPiBp
bmRleCBmNjAxMmY4ZTU5ZjAuLmMxYmI2N2UyNTQzMCAxMDA2NDQNCj4gLS0tIGEvbmV0LzgwMi9n
YXJwLmMNCj4gKysrIGIvbmV0LzgwMi9nYXJwLmMNCj4gQEAgLTQwNyw3ICs0MDcsNyBAQCBzdGF0
aWMgdm9pZCBnYXJwX2pvaW5fdGltZXJfYXJtKHN0cnVjdCBnYXJwX2FwcGxpY2FudCAqYXBwKQ0K
PiAgew0KPiAgCXVuc2lnbmVkIGxvbmcgZGVsYXk7DQo+IA0KPiAtCWRlbGF5ID0gKHU2NCltc2Vj
c190b19qaWZmaWVzKGdhcnBfam9pbl90aW1lKSAqIHByYW5kb21fdTMyKCkgPj4gMzI7DQo+ICsJ
ZGVsYXkgPSAodTY0KW1zZWNzX3RvX2ppZmZpZXMoZ2FycF9qb2luX3RpbWUpICogZ2V0X3JhbmRv
bV91MzIoKSA+PiAzMjsNCj4gIAltb2RfdGltZXIoJmFwcC0+am9pbl90aW1lciwgamlmZmllcyAr
IGRlbGF5KTsNCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS9uZXQvODAyL21ycC5jIGIvbmV0Lzgw
Mi9tcnAuYw0KPiBpbmRleCAzNWUwNGNjNTM5MGMuLjNlOWZlOWY1ZDliZiAxMDA2NDQNCj4gLS0t
IGEvbmV0LzgwMi9tcnAuYw0KPiArKysgYi9uZXQvODAyL21ycC5jDQo+IEBAIC01OTIsNyArNTky
LDcgQEAgc3RhdGljIHZvaWQgbXJwX2pvaW5fdGltZXJfYXJtKHN0cnVjdCBtcnBfYXBwbGljYW50
ICphcHApDQo+ICB7DQo+ICAJdW5zaWduZWQgbG9uZyBkZWxheTsNCj4gDQo+IC0JZGVsYXkgPSAo
dTY0KW1zZWNzX3RvX2ppZmZpZXMobXJwX2pvaW5fdGltZSkgKiBwcmFuZG9tX3UzMigpID4+IDMy
Ow0KPiArCWRlbGF5ID0gKHU2NCltc2Vjc190b19qaWZmaWVzKG1ycF9qb2luX3RpbWUpICogZ2V0
X3JhbmRvbV91MzIoKSA+PiAzMjsNCj4gIAltb2RfdGltZXIoJmFwcC0+am9pbl90aW1lciwgamlm
ZmllcyArIGRlbGF5KTsNCj4gIH0NCj4gDQoNCkFyZW4ndCB0aG9zZToNCglkZWxheSA9IHByYW5k
b21fdTMyX21heChtc2Vjc190b19qaWZmaWVzKHh4eF9qb2luX3RpbWUpKTsNCg0KCURhdmlkDQoN
Ci0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJt
LCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChX
YWxlcykNCg==

