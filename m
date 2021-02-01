Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8A30AC76
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 17:18:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTtQr53wKzDrgs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 03:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTtNz3B6BzDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 03:16:35 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-94-PDM0gjbiOZqXPIRJmgOpjw-1; Mon, 01 Feb 2021 16:15:18 +0000
X-MC-Unique: PDM0gjbiOZqXPIRJmgOpjw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 1 Feb 2021 16:15:17 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 1 Feb 2021 16:15:17 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Christopher M. Riedl'" <cmr@codefail.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Topic: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Index: AQHW9SvhJlSFmYQ9tkmGvwf2LRQAGqo811MwgAajugCAAARBUA==
Date: Mon, 1 Feb 2021 16:15:17 +0000
Message-ID: <0433d40adacc47a3a27bc8bc35e076e3@AcuMS.aculab.com>
References: <6a6ce1a53fcf4669a9848114d3460fef@AcuMS.aculab.com>
 <C8YBET4IGYGF.3QYANVRRHMV0R@geist>
In-Reply-To: <C8YBET4IGYGF.3QYANVRRHMV0R@geist>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZXIgTS4gUmllZGwNCj4gU2VudDogMDEgRmVicnVhcnkgMjAyMSAxNTo1
Ng0KPiANCj4gT24gVGh1IEphbiAyOCwgMjAyMSBhdCA0OjM4IEFNIENTVCwgRGF2aWQgTGFpZ2h0
IHdyb3RlOg0KPiA+IEZyb206IENocmlzdG9waGVyIE0uIFJpZWRsDQo+ID4gPiBTZW50OiAyOCBK
YW51YXJ5IDIwMjEgMDQ6MDQNCj4gPiA+DQo+ID4gPiBSZXVzZSB0aGUgInNhZmUiIGltcGxlbWVu
dGF0aW9uIGZyb20gc2lnbmFsLmMgZXhjZXB0IGZvciBjYWxsaW5nDQo+ID4gPiB1bnNhZmVfY29w
eV9mcm9tX3VzZXIoKSB0byBjb3B5IGludG8gYSBsb2NhbCBidWZmZXIuDQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgTS4gUmllZGwgPGNtckBjb2RlZmFpbC5kZT4NCj4g
PiA+IC0tLQ0KPiA+ID4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2lnbmFsLmggfCAzMyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3NpZ25hbC5oIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWwuaA0KPiA+ID4gaW5kZXggMjU1
OWE2ODE1MzZlLi5jMTg0MDJkNjI1ZjEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9hcmNoL3Bvd2VycGMv
a2VybmVsL3NpZ25hbC5oDQo+ID4gPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5o
DQo+ID4gPiBAQCAtNTMsNiArNTMsMzMgQEAgdW5zaWduZWQgbG9uZyBjb3B5X2NrZnByX2Zyb21f
dXNlcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHZvaWQgX191c2VyICpmcm9tKTsNCj4gPiA+
ICAJCQkJJmJ1ZltpXSwgbGFiZWwpO1wNCj4gPiA+ICB9IHdoaWxlICgwKQ0KPiA+ID4NCj4gPiA+
ICsjZGVmaW5lIHVuc2FmZV9jb3B5X2Zwcl9mcm9tX3VzZXIodGFzaywgZnJvbSwgbGFiZWwpCWRv
IHsJCVwNCj4gPiA+ICsJc3RydWN0IHRhc2tfc3RydWN0ICpfX3QgPSB0YXNrOwkJCQkJXA0KPiA+
ID4gKwl1NjQgX191c2VyICpfX2YgPSAodTY0IF9fdXNlciAqKWZyb207CQkJCVwNCj4gPiA+ICsJ
dTY0IGJ1ZltFTEZfTkZQUkVHXTsJCQkJCQlcDQo+ID4NCj4gPiBIb3cgYmlnIGlzIHRoYXQgYnVm
ZmVyPw0KPiA+IElzbid0IGlzIGxpa2VseSB0byBiZSByZWFzb25hYmx5IGxhcmdlIGNvbXBhcmVk
IHRvIGEgcmVhc29uYWJsZQ0KPiA+IGtlcm5lbCBzdGFjayBmcmFtZS4NCj4gPiBFc3BlY2lhbGx5
IHNpbmNlIHRoaXMgaXNuJ3QgZXZlbiBhIGxlYWYgZnVuY3Rpb24uDQo+ID4NCj4gDQo+IEkgdGhp
bmsgQ2hyaXN0b3BoZSBhbnN3ZXJlZCB0aGlzIC0gSSBkb24ndCByZWFsbHkgaGF2ZSBhbiBvcGlu
aW9uIGVpdGhlcg0KPiB3YXkuIFdoYXQgd291bGQgYmUgYSAncmVhc29uYWJsZScga2VybmVsIHN0
YWNrIGZyYW1lIGZvciByZWZlcmVuY2U/DQoNClplcm8gOi0pDQoNCj4gDQo+ID4gPiArCWludCBp
OwkJCQkJCQkJXA0KPiA+ID4gKwkJCQkJCQkJCVwNCj4gPiA+ICsJdW5zYWZlX2NvcHlfZnJvbV91
c2VyKGJ1ZiwgX19mLCBFTEZfTkZQUkVHICogc2l6ZW9mKGRvdWJsZSksCVwNCj4gPiA+ICsJCQkJ
bGFiZWwpOwkJCQkJXA0KPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgRUxGX05GUFJFRyAtIDE7IGkr
KykJCQkJXA0KPiA+ID4gKwkJX190LT50aHJlYWQuVFNfRlBSKGkpID0gYnVmW2ldOwkJCQlcDQo+
ID4gPiArCV9fdC0+dGhyZWFkLmZwX3N0YXRlLmZwc2NyID0gYnVmW2ldOwkJCQlcDQo+ID4gPiAr
fSB3aGlsZSAoMCkNCg0KT24gZnVydGhlciByZWZsZWN0aW9uLCBzaW5jZSB5b3UgaW1tZWRpYXRl
bHkgbG9vcCB0aHJvdWdoIHRoZSBidWZmZXINCndoeSBub3QganVzdCB1c2UgdXNlcl9hY2Nlc3Nf
YmVnaW4oKSBhbmQgdW5zYWZlX2dldF91c2VyKCkgaW4gdGhlIGxvb3AuDQoNCglEYXZpZA0KDQot
DQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpDQo=

