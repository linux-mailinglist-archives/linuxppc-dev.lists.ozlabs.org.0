Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33140134F0C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 22:44:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tN6k1xkhzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=146.101.78.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tN4m5kNrzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 08:42:13 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-2-XMFewsroMBqNVmL4iq_bTQ-1;
 Wed, 08 Jan 2020 17:39:44 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 8 Jan 2020 17:39:42 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 8 Jan 2020 17:39:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@c-s.fr>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Thread-Topic: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Thread-Index: AQHVxgB0oW/g95TA9k2fcgn+xgLf36fhB6DA
Date: Wed, 8 Jan 2020 17:39:42 +0000
Message-ID: <334434313e1642768995acc03a51214f@AcuMS.aculab.com>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
 <00a43e5c-0708-d49a-9cc4-eb2ce8b4cf99@c-s.fr>
In-Reply-To: <00a43e5c-0708-d49a-9cc4-eb2ce8b4cf99@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: XMFewsroMBqNVmL4iq_bTQ-1
X-Mimecast-Spam-Score: 0
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Matt
 Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>, Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAwOCBKYW51YXJ5IDIwMjAgMDg6NDkNCi4u
Lg0KPiBBbmQgYXMgcG9pbnRlZCBieSBBcm5kLCB0aGUgdm9sYXRpbGUgaXMgcmVhbGx5IG9ubHkg
bmVjZXNzYXJ5IGZvciB0aGUNCj4gZGVyZWZlcmVuY2UgaXRzZWxmLCBzaG91bGQgdGhlIGFyY2gg
dXNlIGRlcmVmZXJlbmNpbmcuDQoNCkkndmUgaGFkIHRyb3VibGUgd2l0aCBzb21lIHZlcnNpb25z
IG9mIGdjYyBhbmQgcmVhZGluZyBvZiAndm9sYXRpbGUgdW5zaWduZWQgY2hhciAqJy4NCkl0IHRl
bmRlZCB0byBmb2xsb3cgdGhlIG1lbW9yeSByZWFkIHdpdGggYW4gZXh0cmEgbWFzayB3aXRoIDB4
ZmYuDQooSSBzdXNwZWN0IHRoYXQgaW50ZXJuYWxseSB0aGUgdmFsdWUgbGFuZGVkIGludG8gYSB0
ZW1wb3JhcnkgJ2ludCcgdmFyaWFibGUuKQ0KDQpJIGdvdCBiZXR0ZXIgY29kZSB1c2luZyBtZW1v
cnkgYmFycmllcnMuDQpTbyBwdXR0aW5nIGFuIGFzbSBiYXJyaWVyIGZvciB0aGUgZXhhY3QgbG9j
YXRpb24gb2YgdGhlIG1lbW9yeSByZWFkDQplaXRoZXIgc2lkZSBvZiB0aGUgcmVhZCBzaG91bGQg
aGF2ZSB0aGUgZGVzaXJlZCBlZmZlY3Qgd2l0aG91dCBhZGRpbmcNCmV4dHJhIGluc3RydWN0aW9u
cy4NCihZb3UgbWlnaHQgdGhpbmsgJ3ZvbGF0aWxlJyB3b3VsZCBtZWFuIHRoYXQgLSBidXQgaXQg
ZG9lc24ndC4pDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

