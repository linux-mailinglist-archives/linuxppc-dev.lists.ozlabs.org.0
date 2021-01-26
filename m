Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B4303A44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:30:39 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ30X3VVKzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:30:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2xv4dfYzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:28:17 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-103-0STilh9oPG2ZWsVCMifh3A-1; Tue, 26 Jan 2021 10:28:09 +0000
X-MC-Unique: 0STilh9oPG2ZWsVCMifh3A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 26 Jan 2021 10:28:09 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 26 Jan 2021 10:28:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicholas Piggin' <npiggin@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, "msuchanek@suse.de"
 <msuchanek@suse.de>, Paul Mackerras <paulus@samba.org>
Subject: RE: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
Thread-Topic: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
Thread-Index: AQHW8807JGe39joh3kmpEKEvm5M8jao5syyQ
Date: Tue, 26 Jan 2021 10:28:09 +0000
Message-ID: <d9993f034db848d1afeffa322373b811@AcuMS.aculab.com>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
 <1611656343.yaxha7r2q4.astroid@bobo.none>
In-Reply-To: <1611656343.yaxha7r2q4.astroid@bobo.none>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTmljaG9sYXMgUGlnZ2luDQo+IFNlbnQ6IDI2IEphbnVhcnkgMjAyMSAxMDoyMQ0KPiAN
Cj4gRXhjZXJwdHMgZnJvbSBDaHJpc3RvcGhlIExlcm95J3MgbWVzc2FnZSBvZiBKYW51YXJ5IDI2
LCAyMDIxIDEyOjQ4IGFtOg0KPiA+IHN5c2NhbGxfNjQuYyB3aWxsIGJlIHJldXNlZCBhbG1vc3Qg
YXMgaXMgZm9yIFBQQzMyLg0KPiA+DQo+ID4gUmVuYW1lIGl0IHN5c2NhbGwuYw0KPiANCj4gQ291
bGQgeW91IHJlbmFtZSBpdCB0byBpbnRlcnJ1cHQuYyBpbnN0ZWFkPyBBIHN5c3RlbSBjYWxsIGlz
IGFuDQo+IGludGVycnVwdCwgYW5kIHRoZSBmaWxlIG5vdyBhbHNvIGhhcyBjb2RlIHRvIHJldHVy
biBmcm9tIG90aGVyDQo+IGludGVycnVwdHMgYXMgd2VsbCwgYW5kIGl0IG1hdGNoZXMgdGhlIG5l
dyBhc20vaW50ZXJydXB0LmggZnJvbQ0KPiB0aGUgaW50ZXJydXB0cyBzZXJpZXMuDQoNCkhtbW0u
Li4uDQoNClRoYXQgbWlnaHQgbWFrZSBpdCBoYXJkZXIgZm9yIHNvbWVvbmUgbG9va2luZyBmb3Ig
dGhlIHN5c3RlbSBjYWxsDQplbnRyeSBjb2RlIHRvIGZpbmQgaXQuDQoNCkluIHNvbWUgc2Vuc2Ug
aW50ZXJydXB0cyBhcmUgdGhlIHNpbXBsZXIgY2FzZS4NCg0KRXNwZWNpYWxseSB3aGVuIGNvbXBh
cmluZyB3aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMgd2hpY2ggaGF2ZQ0Kc3BlY2lhbCBpbnN0cnVj
dGlvbnMgZm9yIHN5c2NhbGwgZW50cnkuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJl
c3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsx
IDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

