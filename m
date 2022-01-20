Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383C494E8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 14:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfjNc6ySJz3bTQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 00:02:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfjN96KQlz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:02:33 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-33-Vn3vaJQAO5ObVFev711Zzw-1; Thu, 20 Jan 2022 13:02:29 +0000
X-MC-Unique: Vn3vaJQAO5ObVFev711Zzw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 20 Jan 2022 13:02:27 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 20 Jan 2022 13:02:27 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Subject: RE: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Thread-Topic: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Thread-Index: AQHYDfvLsUgI09Yi+EGR4Ve6KMrB5Kxr3nRg
Date: Thu, 20 Jan 2022 13:02:27 +0000
Message-ID: <f2c1a3a10bf643d693afed6d23b3baf9@AcuMS.aculab.com>
References: <20220120073911.99857-4-guoren@kernel.org>
 <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
In-Reply-To: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 liush <liush@allwinnertech.com>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Christoph
 Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 gregkh <gregkh@linuxfoundation.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAyMCBKYW51YXJ5IDIwMjIgMTE6NTINCi4uDQo+
IEFzIHdpdGggY29tcGF0X2Zsb2NrLCB0aGUgcGFja2VkIGF0dHJpYnV0ZSBoYXMgbm8gaW1wYWN0
IG9uIHRoZSBsYXlvdXQNCj4gaGVyZSwgYnV0IHBsZWFzZSBkcm9wIGl0IGFueXdheSBmb3IgY29u
c2lzdGVuY3kuDQoNCk5ldmVyIG1pbmQgdGhlIHN0cnVjdHVyZSBsYXlvdXQsIGJlY2F1c2UgJ3Bh
Y2tlZCcgYWxsb3dzIHRoZQ0Kc3RydWN0dXJlIHRvIGJlIGFsaWduZWQgb24gYW55IGJvdW5kYXJ5
IGl0IGZvcmNlcyB0aGUgY29tcGlsZXINCnRvIHVzZSBieXRlIG1lbW9yeSBhY2Nlc3NlcyBhbmQg
c2hpZnRzIG9uIHNvbWUgYXJjaGl0ZWN0dXJlcy4NClRoaXMgaXMgYSBob3JyaWQgcGVyZm9ybWFu
Y2UgcGVuYWx0eS4NCg0KJ3BhY2tlZCcgc2hvdWxkIG9ubHkgYmUgc3BlY2lmaWVkIGZvciBzdHJ1
Y3R1cmVzIHRoYXQgY2FuDQpvY2N1ciBvbiBhbnkgYWRkcmVzcyBib3VuZGFyeS4NCmllIGJhc2lj
YWxseSBuZXZlci4NCg0KSWYgeW91IG5lZWQgdG8gcmVtb3ZlIHRoZSBpbXBsaWNpdCBwYWQgYmVm
b3JlIGEgZmllbGQgKGVnIDY0Yml0DQpmaWVsZHMgb24geDY0LTMyKSB0aGVuIHlvdSBjYW4gbWFy
ayB0aGUgZmllbGQgaXRzZWxmIGFzICdwYWNrZWQnLg0KQWx0aG91Z2gsIGluIHRoYXQgY2FzZSwg
cHV0dGluZyB0aGUgYXR0cmlidXRlIG9uIHRoZSB0eXBlIChjb21wYXRfczY0KQ0KaXMgZ2VuZXJh
bGx5IGNsZWFuZXIuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUs
IEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJl
Z2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

