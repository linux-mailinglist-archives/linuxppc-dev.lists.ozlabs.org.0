Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95BEEE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 05:01:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tRB82s7czDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 13:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=windriver.com
 (client-ip=147.11.146.13; helo=mail1.windriver.com;
 envelope-from=pablo.rodriguez-quesada@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
X-Greylist: delayed 7829 seconds by postgrey-1.36 at bilbo;
 Tue, 30 Apr 2019 13:00:05 AEST
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tR8j6mHZzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 13:00:03 +1000 (AEST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U0nRL5015621
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 29 Apr 2019 17:49:27 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
 ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000; Mon,
 29 Apr 2019 17:49:15 -0700
From: "Rodriguez Quesada, Pablo" <Pablo.Rodriguez-Quesada@windriver.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: RE: Machine Check Exceptions
Thread-Topic: Machine Check Exceptions
Thread-Index: AdT61Io1ul16C2EtScWIxTsT0pjndwAis6KAAAauFKAAxLJIgAAYKEIA
Date: Tue, 30 Apr 2019 00:49:15 +0000
Message-ID: <0CDD4071D6ACF54ABB9CF1A6D90375A809BA18D7@ALA-MBD.corp.ad.wrs.com>
References: <0CDD4071D6ACF54ABB9CF1A6D90375A809B91A41@ALA-MBD.corp.ad.wrs.com>
 <64209dd1-7cce-4061-1139-15e7ef394e66@c-s.fr>
 <0CDD4071D6ACF54ABB9CF1A6D90375A809B91C51@ALA-MBD.corp.ad.wrs.com>
 <49f28ecd-b2c2-aa9f-8183-f6c945824292@c-s.fr>
In-Reply-To: <49f28ecd-b2c2-aa9f-8183-f6c945824292@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.144]
Content-Type: text/plain; charset="utf-8"
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQ2hyaXN0b3BoZSwNCg0KSSB3aWxsIHRyeSB3aXRoIHRoZSBOTUkgYXBwcm9hY2guIEp1c3Qg
b25lIHF1ZXN0aW9uOiANCg0KPlRoZSBkcml2ZXIgSSB3cm90ZSB0aGF0IHlvdSBhcmUgcmVmZXJy
aW5nIHRvIGlzIHRvIGhhbmRsZSB0aGUgd2F0Y2hkb2cgaW4gZTMwMCBwb3dlcnBjIGNvcmUuIFRo
aXMgaXMgYmVjYXVzZSB0aGUgZTMwMCBnZXJlcmF0ZXMgYSBtYWNoaW5lIGNoZWNrIG9uIGV4cGly
eSA+d2hlbiB0aGUgd2F0Y2hkb2cgaXMgY29uZmlndXJlZCBpbiBOTUkgbW9kZS4NCg0KQnkgTk1J
IG1vZGUgZG8geW91IG1lYW4gZW5hYmxpbmcgdGhlIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBz
eW1ib2wgb24gdGhlIC5jb25maWc/DQoNCg0KVGhhbmsgeW91LA0KUGFibG8NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAYy1zLmZyPiANClNlbnQ6IE1vbmRheSwgQXByaWwgMjksIDIwMTkgMTI6MTAgQU0NClRvOiBS
b2RyaWd1ZXogUXVlc2FkYSwgUGFibG8gPFBhYmxvLlJvZHJpZ3Vlei1RdWVzYWRhQHdpbmRyaXZl
ci5jb20+DQpDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBN
YWNoaW5lIENoZWNrIEV4Y2VwdGlvbnMNCg0KSGkgUGFibG8sDQoNCkkga25vdyBub3RoaW5nIGFi
b3V0IG1jZS1pbmplY3QuDQoNClRoZSBkcml2ZXIgSSB3cm90ZSB0aGF0IHlvdSBhcmUgcmVmZXJy
aW5nIHRvIGlzIHRvIGhhbmRsZSB0aGUgd2F0Y2hkb2cgaW4gZTMwMCBwb3dlcnBjIGNvcmUuIFRo
aXMgaXMgYmVjYXVzZSB0aGUgZTMwMCBnZXJlcmF0ZXMgYSBtYWNoaW5lIGNoZWNrIG9uIGV4cGly
eSB3aGVuIHRoZSB3YXRjaGRvZyBpcyBjb25maWd1cmVkIGluIE5NSSBtb2RlLg0KDQpUaGVyZWZv
cmUsIHRyaWdnZXJpbmcgdGhlIG1hY2hpbmUgY2hlY2sgaXMgcmF0aGVyIGVhc3kgaW4gdGhhdCBj
YXNlLCBJIGp1c3QgaGF2ZSB0byBzdG9wIHJlZnJlc2hpbmcgdGhlIHdhdGNoZG9nLg0KDQpDaHJp
c3RvcGhlDQoNCkxlIDI1LzA0LzIwMTkgw6AgMTc6MzUsIFJvZHJpZ3VleiBRdWVzYWRhLCBQYWJs
byBhIMOpY3JpdMKgOg0KPiBIaSBDaHJpc3RvcGhlciwNCj4gDQo+IEkgYW0gdHJ5aW5nIHRvIGNy
ZWF0ZSBhIGN1c3RvbSBoYW5kbGVyIGZvciBNQ0UsIGJ1dCBJIGRvbid0IGhhdmUgYSB3YXkgDQo+
IHRvIHRyaWdnZXIgaXQgKE9yIGRvbid0IGtub3cgaG93KQ0KPiANCj4gVGhlcmVmb3JlIEkgbG9v
a2VkIGF0IHRoZSBtY2UtaW5qZWN0IHRvb2woKiopIGFuZCBjb21waWxlIGl0IGZvciBQUEMgYnV0
IHRoZSBwYXRoICIvc3lzL2RldmljZXMvc3lzdGVtL21hY2hpbmUgY2hlY2svbWFjaGluZWNoZWNr
MCIgZG9lc24ndCBleGlzdCB1bmxpa2UgSW50ZWwgYXJjaGl0ZWN0dXJlIGFuZCB0aGUgYXBwIGZh
aWxzLiBJIHdhbnQgdG8gZml4IGl0Lg0KPiANCj4gTXkgcXVlc3Rpb24gaXM6IERvIHlvdSBrbm93
IGlmIHRoZXJlIGlzIGEgd2F5IHRvIGluamVjdCBhbiBNQ0Ugb24gUG93ZXJQQz8gT3IgY2FuIHlv
dSBndWlkZSBtZSBvbiBob3cgdG8gc3RhcnQgbXkgcmVzZWFyY2ggYWJvdXQgaXQuIEkgZmluZCBp
dCB2ZXJ5IGRpZmZpY3VsdCB0byBzZWFyY2ggZm9yIFBQQyBkb2N1bWVudGF0aW9uLiBUaGF0IGlz
IHdoeSBJIGFtIHdyaXRpbmcgdG8geW91LCB0byBnZXQgYW55IHRpcHMgZm9yIGRldmVsb3Bpbmcg
YSBtY2UtaW5qZWN0IGZvciBQUEMuIEFuZCBvZiBjb3Vyc2UsIEkgd291bGQgYmUgbW9yZSB0aGFu
IGdsYWQgdG8gY29udHJpYnV0ZSB0byB0aGUgT3BlblNvdXJjZSBjb21tdW5pdHkuDQo+IA0KPiBB
bHNvLCBob3cgZGlkIHlvdSB0ZXN0IHlvdXIgaGFuZGxlcj8gRG8geW91IGhhdmUgYW4gZWFzeSBt
ZWNoYW5pc20gdG8gdHJpZ2dlciB0aGUgZXhjZXB0aW9ucz8NCj4gDQo+IFRoYW5rIHlvdSwNCj4g
UGFibG8NCj4gDQo+ICgqKikgaHR0cHM6Ly9naXRodWIuY29tL2FuZGlrbGVlbi9tY2UtaW5qZWN0
Lw0KPiANCj4gDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4NCj4gU2VudDogV2VkbmVzZGF5
LCBBcHJpbCAyNCwgMjAxOSAxMTowNyBQTQ0KPiBUbzogUm9kcmlndWV6IFF1ZXNhZGEsIFBhYmxv
IDxQYWJsby5Sb2RyaWd1ZXotUXVlc2FkYUB3aW5kcml2ZXIuY29tPg0KPiBTdWJqZWN0OiBSZTog
TWFjaGluZSBDaGVjayBFeGNlcHRpb25zDQo+IA0KPiBIaSBQYWJsbywNCj4gDQo+IE5vIHByb2Js
ZW0NCj4gDQo+IENocmlzdG9waGUNCj4gDQo+IA0KPiBMZSAyNC8wNC8yMDE5IMOgIDIxOjMzLCBS
b2RyaWd1ZXogUXVlc2FkYSwgUGFibG8gYSDDqWNyaXTCoDoNCj4+IEhpIENyaXN0b3BoZXIsDQo+
Pg0KPj4gSG9wZSB5b3UgYXJlIGRvaW5nIGdvb2QhDQo+Pg0KPj4gSSBhbSBsZWFybmluZyBhYm91
dCBNYWNoaW5lIENoZWNrIEV4Y2VwdGlvbnMgb24gUFBDLCBhbmQgSSBmb3VuZCB0aGlzIA0KPj4g
Y29tbWl0IG9mIHlvdXJzOg0KPj4NCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9jb21taXQvMGRlYWUzOWNlYzZkYWIzYTY2Nzk0ZjNlOWU4Mw0KPj4gYw0KPj4gYTRkYzMwMDgw
ZjENCj4+DQo+PiBXb3VsZCB5b3UgbWluZCBpZiBJIGFzayB5b3UgYSBjb3VwbGUgb2YgcXVlc3Rp
b25zPw0KPj4NCj4+IFRoYW5rIHlvdSwNCj4+DQo+PiBXUiBsb2dvIHNpZ25pdHVyZSA8aHR0cDov
L3d3dy53aW5kcml2ZXIuY29tLz4NCj4+DQo+PiAJDQo+Pg0KPj4gKlBhYmxvIFJvZHJpZ3Vleios
IEludGVybiwgV2luZCBSaXZlciBDb3N0YSBSaWNhDQo+Pg0K
