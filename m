Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F986C28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 23:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464Lj14lrFzDqsh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 07:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="BC2gVSlE"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464Lfn2dJ1zDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 07:12:16 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 457F7806B6;
 Fri,  9 Aug 2019 09:12:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1565298732;
 bh=W2k74tqXbJx5Ec7T8QCeVBazUTWZg/ddcDaMpjqSM4g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=BC2gVSlEZ87YSku2Lei4poT74JChwSzhoHgrSHHOKvvMuAgpSOfuSdTAu/aj82v1R
 WH8cvnsmjI1eKIQyD+nVWlZpQcpUxf0fu+O1o7SIGOWkfkUVPog39sj9Oz0C7CqpVD
 yH+PecqOfMGM48V8QZWeP2K8XBPl0jBsAM8zKEMGhOjTA6yOQ5p9R5Kj9oUDlt8SZT
 zC/CpTIohuqBkhjEIhpFm4rwpDEGC/IOWE9GHOwDYxk2WmUCjGvzM8vO+ZO7xFWvfF
 55eYCXkW0zeRa4Qlu3DH56NzfSKhW3NnOgiM44yk+QCUTASxoJxzzykUD1SMq+cJsr
 dOomFfVLvQAGQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d4c902b0000>; Fri, 09 Aug 2019 09:12:11 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Fri, 9 Aug 2019 09:12:11 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 9 Aug 2019 09:12:11 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/64e: drop stale call to smp_processor_id() which
 hangs SMP startup
Thread-Topic: [PATCH] powerpc/64e: drop stale call to smp_processor_id() which
 hangs SMP startup
Thread-Index: AQHVTeeWjuj86p0A5U+CJo7DQvxMVabw9umA
Date: Thu, 8 Aug 2019 21:12:11 +0000
Message-ID: <1565298731.4267.5.camel@alliedtelesis.co.nz>
References: <bef479514f4c08329fa649f67735df8918bc0976.1565268248.git.christophe.leroy@c-s.fr>
In-Reply-To: <bef479514f4c08329fa649f67735df8918bc0976.1565268248.git.christophe.leroy@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <41B4A7E9A46BAB44BA9C5B3F109F1CF1@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGkgQ2hyaXN0b3BoZSwNCg0KT24gVGh1LCAyMDE5LTA4LTA4IGF0IDEyOjQ4ICswMDAwLCBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPiBTYW50YSBjb21taXQgZWJiOWQzMGE2YTc0ICgicG93ZXJw
Yy9tbTogYW55IHRocmVhZCBpbiBvbmUgY29yZSBjYW4gYmUNCj4gdGhlIGZpcnN0IHRvIHNldHVw
IFRMQjEiKSByZW1vdmVkIHRoZSBuZWVkIHRvIGtub3cgdGhlIGNwdV9pZCBpbg0KPiBlYXJseV9p
bml0X3RoaXNfbW11KCksIGJ1dCB0aGUgY2FsbCB0byBzbXBfcHJvY2Vzc29yX2lkKCkgd2hpY2gg
d2FzDQo+IG1hcmtlZCBfX21heWJlX3VzZWQgcmVtYWluZWQuDQo+IA0KPiBTaW5jZSBjb21taXQg
ZWQxY2Q2ZGViMDEzICgicG93ZXJwYzogQWN0aXZhdGUNCj4gQ09ORklHX1RIUkVBRF9JTkZPX0lO
X1RBU0siKSB0aHJlYWRfaW5mbyBjYW5ub3QgYmUgcmVhY2hlZCBiZWZvcmUgbW11DQo+IGlzIHBy
b3Blcmx5IHNldCB1cC4NCj4gDQo+IERyb3AgdGhpcyBzdGFsZSBjYWxsIHRvIHNtcF9wcm9jZXNz
b3JfaWQoKSB3aGljaCBtYWtlIFNNUCBoYW5nDQo+IHdoZW4gQ09ORklHX1BSRUVNUFQgaXMgc2V0
Lg0KPiANCj4gUmVwb3J0ZWQtYnk6IENocmlzIFBhY2toYW0gPENocmlzLlBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uej4NCj4gRml4ZXM6IGViYjlkMzBhNmE3NCAoInBvd2VycGMvbW06IGFueSB0
aHJlYWQgaW4gb25lIGNvcmUgY2FuIGJlIHRoZQ0KPiBmaXJzdCB0byBzZXR1cCBUTEIxIikNCj4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMvMjY0DQo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPg0K
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KDQpNYW55IHRoYW5rcyBmb3IgeW91ciBoZWxw
Lg0KDQpUZXN0ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNp
cy5jby5uej4NCg0KPiAtLS0NCj4gwqBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL3RsYi5jIHwgMSAt
DQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbW0vbm9oYXNoL3RsYi5jDQo+IGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC90
bGIuYw0KPiBpbmRleCBkNGFjZjZmYTA1OTYuLmJmNjA5ODNhNThjNyAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL21tL25vaGFzaC90bGIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbm9o
YXNoL3RsYi5jDQo+IEBAIC02MzAsNyArNjMwLDYgQEAgc3RhdGljIHZvaWQgZWFybHlfaW5pdF90
aGlzX21tdSh2b2lkKQ0KPiDCoCNpZmRlZiBDT05GSUdfUFBDX0ZTTF9CT09LM0UNCj4gwqAJaWYg
KG1tdV9oYXNfZmVhdHVyZShNTVVfRlRSX1RZUEVfRlNMX0UpKSB7DQo+IMKgCQl1bnNpZ25lZCBp
bnQgbnVtX2NhbXM7DQo+IC0JCWludCBfX21heWJlX3VudXNlZCBjcHUgPSBzbXBfcHJvY2Vzc29y
X2lkKCk7DQo+IMKgCQlib29sIG1hcCA9IHRydWU7DQo+IMKgDQo+IMKgCQkvKiB1c2UgYSBxdWFy
dGVyIG9mIHRoZSBUTEJDQU0gZm9yIGJvbHRlZCBsaW5lYXIgbWFwDQo+ICov
