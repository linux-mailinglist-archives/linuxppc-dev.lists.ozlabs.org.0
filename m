Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A25F87A8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 23:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlJtX6Y44z3dy9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlJq56SC7z2yQK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 08:54:08 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-322-B0KkuonxN4-iDxIJpOcDbw-1; Sat, 08 Oct 2022 22:53:36 +0100
X-MC-Unique: B0KkuonxN4-iDxIJpOcDbw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Sat, 8 Oct
 2022 22:53:33 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Sat, 8 Oct 2022 22:53:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, Kees Cook
	<keescook@chromium.org>
Subject: RE: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Thread-Topic: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Thread-Index: AQHY2nYZ0LDp17FxT0u8eu+L+6kCF64FCBzw
Date: Sat, 8 Oct 2022 21:53:33 +0000
Message-ID: <69080fb8cace486db4e28e2e90f1d550@AcuMS.aculab.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com> <202210071010.52C672FA9@keescook>
 <Y0BoQmVauPLC2uW5@zx2c4.com>
In-Reply-To: <Y0BoQmVauPLC2uW5@zx2c4.com>
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
X-Mailman-Approved-At: Sun, 09 Oct 2022 08:55:48 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@ker
 nel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh
 Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef
 Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave
 Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J .
 Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>, Heiko
 Carstens <hca@linux.ibm.com>, =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>, Chuck Lever <chuck.lever@oracle.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.oz
 labs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogSmFzb24gQS4gRG9uZW5mZWxkDQo+IFNlbnQ6IDA3IE9jdG9iZXIgMjAyMiAxODo1Ng0K
Li4uDQo+ID4gR2l2ZW4gdGhlc2Uga2luZHMgb2YgbGVzcyBtZWNoYW5pY2FsIGNoYW5nZXMsIGl0
IG1heSBtYWtlIHNlbnNlIHRvIHNwbGl0DQo+ID4gdGhlc2UgZnJvbSB0aGUgInRyaXZpYWwiIGNv
bnZlcnNpb25zIGluIGEgdHJlZXdpZGUgcGF0Y2guIFRoZSBjaGFuY2Ugb2YNCj4gPiBuZWVkaW5n
IGEgcmV2ZXJ0IGZyb20gdGhlIHNpbXBsZSAxOjEgY29udmVyc2lvbnMgaXMgbXVjaCBsb3dlciB0
aGFuIHRoZQ0KPiA+IG5lZWQgdG8gcmV2ZXJ0IGJ5LWhhbmQgY2hhbmdlcy4NCj4gPg0KPiA+IFRo
ZSBDb2NjaSBzY3JpcHQgSSBzdWdnZXN0ZWQgaW4gbXkgdjEgcmV2aWV3IGdldHMgODAlIG9mIHRo
ZSBmaXJzdA0KPiA+IHBhdGNoLCBmb3IgZXhhbXBsZS4NCj4gDQo+IEknbGwgc3BsaXQgdGhpbmdz
IHVwIGludG8gYSBtZWNoYW5pY2FsIHN0ZXAgYW5kIGEgbm9uLW1lY2hhbmljYWwgc3RlcC4NCj4g
R29vZCBpZGVhLg0KDQpJJ2QgYWxzbyBkbyBzb21ldGhpbmcgYWJvdXQgdGhlICdnZXRfcmFuZG9t
X2ludCgpICYgMycgY2FzZXMuDQooaWUgcmVtYWluZGVyIGJ5IDJebi0xKQ0KVGhlc2UgY2FuIGJl
IGNvbnZlcnRlZCB0byAnZ2V0X3JhbmRvbV91OCgpICYgMycgKGV0YykuDQpTbyB0aGV5IG9ubHkg
bmVlZCBvbmUgcmFuZG9tIGJ5dGUgKG5vdCA0KSBhbmQgbm8gbXVsdGlwbHkuDQoNClBvc3NpYmx5
IHNvbWV0aGluZyBiYXNlZCBvbiAodGhlIHF1aWNrbHkgdHlwZWQsIGFuZCBub3QgQyk6DQojZGVm
aW5lIGdldF9yYW5kb21fYmVsb3codmFsKSBbDQoJaWYgKGJ1aWx0aW5fY29uc3RhbnQodmFsKSkN
CgkJQlVJTERfQlVHX09OKCF2YWwgfHwgdmFsID4gMHgxMDAwMDAwMDB1bGwpDQoJCWlmICghKHZh
bCAmICh2YWwgLSAxKSkgew0KCQkJaWYgKHZhbCA8PSAweDEwMCkNCgkJCQlyZXR1cm4gZ2V0X3Jh
bmRvbV91OCgpICYgKHZhbCAtIDEpOw0KCQkJaWYgKHZhbCA8PSAweDEwMDAwKQ0KCQkJCXJldHVy
biBnZXRfcmFuZG9tX3UxNigpICYgKHZhbCAtIDEpOw0KCQkJcmV0dXJuIGdldF9yYW5kb21fdTMy
KCkgJiAodmFsIC0gMSk7DQoJCX0NCgl9DQoJQlVJTERfQlVHX09OKHNpemVvZiAodmFsKSA+IDQp
Ow0KCXJldHVybiAoKHU2NClnZXRfcmFuZG9tX3UzMigpICogdmFsKSA+PiAzMjsNCn0NCg0KZ2V0
X3JhbmRvbV9iZWxvdygpIGlzIGEgbXVjaCBiZXR0ZXIgbmFtZSB0aGFuIHByYW5kb21fdTMyX21h
eCgpLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K

