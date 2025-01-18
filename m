Return-Path: <linuxppc-dev+bounces-5375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D263FA15BCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 08:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZpqx5gMGz30Vj;
	Sat, 18 Jan 2025 18:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737187085;
	cv=none; b=VJokSfmBE0zZCCf6+D388B/9Zz4Tz+PcOIA70j1eTjilAa0ByL6IRATn3lMA17L64KpUS/ldpRJBSBhISMGN6CZYoaRbZUl1du9RY7DnIYrn0j6bDE8SD7XxkjshjRhoOSCJXWynxNm6wmppEzGxRMKljeb7ELDVdlcUJOYFw0+5HTQRIB+33CbzOipP6sCuvGiClrbZ7NGrt7/SsBL8OlMJXGYk1CJ9AO5HZm64vkg1jp3DczwfC2a2OKIIHWCBSIS12X1Vw/+63bsXRgF0nLY8F+a8Qzld5tjq6NpHF/QAyWk7wip/rLFjhmYU1fqHD3Q6viCy5HNKj3gThrA6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737187085; c=relaxed/relaxed;
	bh=Jgu6bS64YCzGx/TQ1qSfoDkrzUoCItm7/J6mJOQUzs0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TPB+amyWu1/cPGk08Vwi2akSP6R3Ej78zX4VUuqdIRKbNSxdM4FPoN6fSyXdhP6ifvRAtvuHOwu03uC6jGlkivvyKGoqYE/XRDz6qrZ1ixW9S3EI667JZndCTC+740mbhNY04ex8Yawpk/IqHlwzfW/zzE/pc+zRUf26Z0b0myv8kDdENs6PouQIaslSkNb96jtIbOElJ4r/WcTW2uf1w183XEQ7QHw0vrduoE1POSlQ4Lk4WJ7/wXnxvSfDlHWzlrIuqHf+6hQTPlzMmLyPrhQoiII+BqWc7krilqnJ5JfucodWQnDfXKTnPkIaWLDruBD+qBJBmfJ7n3GcKnaHcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=pangliyuan1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=pangliyuan1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZpqv6c6pz30VK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 18:58:02 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YZplx2pd6z1V55g;
	Sat, 18 Jan 2025 15:54:37 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id ED7F21A0188;
	Sat, 18 Jan 2025 15:57:51 +0800 (CST)
Received: from kwepemd200025.china.huawei.com (7.221.188.181) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 18 Jan 2025 15:57:51 +0800
Received: from kwepemd200025.china.huawei.com ([7.221.188.181]) by
 kwepemd200025.china.huawei.com ([7.221.188.181]) with mapi id 15.02.1544.011;
 Sat, 18 Jan 2025 15:57:51 +0800
From: pangliyuan <pangliyuan1@huawei.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "anil.s.keshavamurthy@intel.com"
	<anil.s.keshavamurthy@intel.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>
CC: "wangfangpeng (A)" <wangfangpeng1@huawei.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] powerpc/kprobes: don't save r13 register in kprobe
 context
Thread-Topic: [RESEND PATCH] powerpc/kprobes: don't save r13 register in
 kprobe context
Thread-Index: AdtpfYiOkqtc8CvtQ42pizKZVJR1zQ==
Date: Sat, 18 Jan 2025 07:57:51 +0000
Message-ID: <02b42c0fd075402b8ee98f821fd50bb1@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.67.109.231]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

T24gU2F0LCBKYW4gMTgsIDIwMjUgYXQgMTU6NDA6MDFQTSArMDgwMCwgcGFuZ2xpeXVhbiB3cm90
ZToNCj4gTGUgMTYvMDEvMjAyNSDDoCAwOTo0NSwgcGFuZ2xpeXVhbiBhIMOpY3JpdCA6DQo+PiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBwYW5nbGl5dWFuMUBo
dWF3ZWkuY29tLiANCj4+IETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOg
IA0KPj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4+
IA0KPj4gV2hlbiBDT05GSUdfU1RBQ0tQUk9URUNUT1JfU1RST05HIGlzIGVuYWJsZWQgYW5kIEZU
UkFDRSBpcyBkaXNhYmxlZCBvbg0KPj4gcG93ZXJwYzY0LCByZXBlYXRlZGx5IHRyaWdnZXJpbmcg
dGhlIGtwcm9iZSBwcm9jZXNzIG1heSBjYXVzZSBzdGFjayBjaGVjaw0KPj4gZmFpbHVyZXMgYW5k
IHBhbmljLg0KPj4NCj4+IENhc2U6DQo+PiBUaGVyZSBpcyBhIGtwcm9iZShkbyBub3RoaW5nIGlu
IGhhbmRsZXIpIGF0dGFjaGVkIHRvIHRoZSAic2htZW1fZ2V0X2lub2RlIiwNCj4+IGFuZCBhIHBy
b2Nlc3MgQSBpcyBjcmVhdGluZyBmaWxlIG9uIHRtcGZzLg0KPj4NCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDUFUwDQo+PiBBIHxyMTMgPSBwYWNhX3B0cnNbMF0sIHBhY2FfcHRyc1sw
XS0+Y2FuYXJ5PUEtPnN0YWNrX2NhbmFyeQ0KPj4gICAgfHRvdWNoIGEgZmlsZSBvbiB0bXBmcw0K
Pj4gICAgfHNobWVtX21rbm9kKCk6DQo+PiAgICB8ICAgIGxvYWQgQSdzIGNhbmFyeSB0aHJvdWdo
IHIxMyBhbmQgc3RvcmVkIGl0IGluIEEncyBzdGFjaw0KPj4gICAgfCAgICBzaG1lbV9nZXRfaW5v
ZGUoKToNCj4+ICAgIHwgICAgICAgIGVudGVyIGtwcm9iZSBmaXJzdA0KPj4gICAgfCAgICAgICAg
b3B0aW5zbl9zbG90KCk6DQo+PiAgICB8ICAgICAgICAgICAgc3RvcmVkIHIxMyAocGFjYV9wdHJz
WzBdKSBpbiBzdGFjaw0KPj4NCj4+ICAgIC4uLi4uLg0KPj4NCj4+ICAgID09PiBzY2hlZHVsZSwg
IEIgcnVuIG9uIENQVTAsIEEgcnVuIG9uIENQVTENCj4+DQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1BVMA0KPj4gQiB8cjEzID0gcGFjYV9wdHJzWzBdLCBwYWNhX3B0cnNbMF0tPmNh
bmFyeT1CLT5zdGFja19jYW5hcnkNCj4+ICAgIHxkbyBzb21ldGhpbmcuLi4NCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDUFUxDQo+PiBBIHwgICAgICAgICAgICByMTMgPSBwYWNhX3B0
cnNbMV0sIHBhY2FfcHRyc1sxXS0+Y2FuYXJ5PUEtPnN0YWNrX2NhbmFyeQ0KPj4gICAgfCAgICAg
ICAgICAgIGFib3V0IHRvIGxlYXZlICdvcHRpbnNuX3Nsb3QnLCByZXN0b3JlIHIxMyBmcm9tIEEn
cyBzdGFjaw0KPj4gICAgfCAgICAgICAgICAgIHIxMyA9IHBhY2FfcHRyc1swXSwgcGFjYV9wdHJz
WzBdLT5jYW5hcnk9Qi0+c3RhY2tfY2FuYXJ5DQo+PiAgICB8ICAgICAgICAgICAgbGVhdmUgb3B0
aW5zbl9zbG90LCBiYWNrIHRvIHNobWVtX2dldF9pbm9kZQ0KPj4gICAgfCAgICAgICAgbGVhdmUg
c2htZW1fZ2V0X2lub2RlLCBiYWNrIHRvIHNobWVtX21rbm9kDQo+PiAgICB8ICAgIGRvIGNhbmFy
eSBjaGVjayBpbiBzaG1lbV9ta25vZCwgYnV0IGNhbmFyeSBzdG9yZWQgaW4gQSdzIHN0YWNrIChB
J3MNCj4+ICAgICAgICAgY2FuYXJ5KSBkb2Vzbid0IG1hdGNoIHRoZSBjYW5hcnkgbG9hZGVkIHRo
cm91Z2ggcjEzIChCJ3MgY2FuYXJ5KSwNCj4+ICAgICAgICAgc28gcGFuaWMNCj4+DQo+PiBXaGVu
IEEob24gQ1BVMCkgZW50cmluZyBvcHRpbnNuX3Nsb3QsIGl0IHN0b3JlZCByMTMocGFjYV9wdHJz
WzBdKSBpbiBzdGFjaywNCj4+IHRoZW4gQSBpcyBzY2hlZHVsZWQgdG8gQ1BVMSBhbmQgcmVzdG9y
ZSByMTMgZnJvbSBBJ3Mgc3RhY2sgd2hlbiBsZWF2aW5nDQo+PiAnb3B0aW5zbl9zbG90Jy4gTm93
IEEgaXMgcnVubmluZyBvbiBDUFUxIGJ1dCByMTMgcG9pbnQgdG8gQ1BVMCdzDQo+PiBwYWNhX3B0
cnNbMF0sIGF0IHRoaXMgdGltZSBwYWNhX3B0cnNbMF0tPl9fY3VycmVudCBwb2ludHMgdG8gYW5v
dGhlcg0KPj4gcHJvY2VzcyBCLCB3aGljaCBjYXVzZSBBIHVzZSBCJ3MgY2FuYXJ5IHRvIGRvIHN0
YWNrIGNoZWNrIGFuZCBwYW5pYy4NCj4+DQo+PiBUaGlzIGNhbiBiZSBzaW1wbHkgZml4ZWQgYnkg
bm90IHNhdmluZyBhbmQgcmVzdG9yaW5nIHRoZSByMTMgcmVnaXN0ZXIsDQo+PiBiZWNhdXNlIG9u
IHBvd2VycGM2NCwgcjEzIGlzIGEgc3BlY2lhbCByZWdpc3RlciB0aGF0IHJlc2VydmVkIHRvIHBv
aW50DQo+PiB0byB0aGUgY3VycmVudCBwcm9jZXNzLCBubyBuZWVkIHRvIHJlc3RvcmUgdGhlIG91
dGRhdGVkIHIxMyBpZiBzY2hlZHVsZWQNCj4+IGhhZCBoYXBwZW5lZC4NCj4NCj4gRG9lcyByMTMg
cmVhbGx5IHBvaW50cyB0byBjdXJyZW50IHByb2Nlc3MgPyBJIHRob3VnaHQgaXQgd2FzIHBvaW50
aW5nIHRvDQo+IFBBQ0Egd2hpY2ggaXMgYSBzdHJ1Y3R1cmUgYXR0YWNoZWQgdG8gYSBnaXZlbiBD
UFUgbm90IGEgZ2l2ZW4gcHJvY2Vzcy4NCg0KWW91IGFyZSByaWdodCwgcjEzIHBvaW50cyB0byB0
aGUgcGFjYSBzdHJ1Y3R1cmUgYXR0YWNoZWQgdG8gYSBnaXZlbiBDUFUsIFRoZXJlDQphcmUgaXNz
dWVzIHdpdGggbXkgZGVzY3JpcHRpb24gaGVyZSwgSSB3aWxsIGZpeCB0aGVtIGluIG15IG5leHQg
cGF0Y2guDQoNCj4NCj5CeSB0aGUgd2F5LCBkb24ndCB3ZSBoYXZlIHRoZSBzYW1lIHByb2JsZW0g
b24gcG93ZXJwYzMyIHdpdGggcmVnaXN0ZXIgcjIgPw0KDQpPbiBwcGMzMiwgcjIgcmVhbGx5IHBv
aW50cyB0byBjdXJyZW50IHByb2Nlc3MuIEFzc3VtZSB0aGVyZSBpcyBhIHByb2Nlc3MgUEEsDQpu
byBtYXR0ZXIgd2hpY2ggQ1BVIHRoZSBQQSBpcyBydW5uaW5nIG9uLCByMiBvbiB0aGF0IENQVSB3
aWxsIHBvaW50IHRvIFBBLA0KdGhlcmVmb3JlLCBzYXZpbmcgYW5kIHJlc3RvcmluZyByMiBzdGls
bCBtYWtlIHIyIHBvaW50IHRvIHRoZSBzYW1lIFBBLg0KDQpPbiBwcGM2NCwgZWFjaCBjcHUgaGFz
IGl0J3Mgb3duIHBhY2Egc3RydWN0dXJlIHBvaW50ZWQgYnkgcjEzLiBJZiB5b3Ugc2F2ZQ0KdGhl
IHIxMyB3aGlsZSBydW5pbmcgb24gY3B1IEEsIGFuZCB0aGVuIHN3aXRjaCB0byBjcHUgQiBhbmQg
cmVzdG9yZSB0aGUgcjEzLA0KaXQgd2lsbCBjYXVzZSByMTMgb24gY3B1IEIgcG9pbnQgdG8gdGhl
IHBhY2EgYXR0YWNoZWQgdG8gY3B1IEEuIFNvIGlmIHlvdQ0KZ2V0IGN1cnJlbnQgcHJvY2VzcyBv
biBjcHUgQiwgeW91IHdpbGwgYWN0dWFsbHkgZ2V0IHRoZSBwcm9jZXNzIHJ1bm5pbmcgb24NCmNw
dSBBLg0KDQo+Pg0KPj4gRml4ZXM6IDUxYzljMDg0Mzk5MyAoInBvd2VycGMva3Byb2JlczogSW1w
bGVtZW50IE9wdHByb2JlcyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBwYW5nbGl5dWFuIDxwYW5nbGl5
dWFuMUBodWF3ZWkuY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvb3B0cHJv
YmVzX2hlYWQuUyB8IDEyICsrKysrKy0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMva2VybmVsL29wdHByb2Jlc19oZWFkLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL29wdHByb2Jl
c19oZWFkLlMNCj4+IGluZGV4IDM1OTMyZjQ1ZmI0ZS4uYmYwZDc3ZTYyYmE4IDEwMDY0NA0KPj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9vcHRwcm9iZXNfaGVhZC5TDQo+PiArKysgYi9hcmNo
L3Bvd2VycGMva2VybmVsL29wdHByb2Jlc19oZWFkLlMNCj4+IEBAIC0xMCwxMiArMTAsMTIgQEAN
Cj4+ICAgI2luY2x1ZGUgPGFzbS9hc20tb2Zmc2V0cy5oPg0KPj4NCj4+ICAgI2lmZGVmIENPTkZJ
R19QUEM2NA0KPj4gLSNkZWZpbmUgU0FWRV8zMEdQUlMoYmFzZSkgU0FWRV9HUFJTKDIsIDMxLCBi
YXNlKQ0KPj4gLSNkZWZpbmUgUkVTVF8zMEdQUlMoYmFzZSkgUkVTVF9HUFJTKDIsIDMxLCBiYXNl
KQ0KPj4gKyNkZWZpbmUgU0FWRV9ORUVERURfR1BSUyhiYXNlKSBTQVZFX0dQUlMoMiwgMTIsIGJh
c2UpOyBTQVZFX0dQUlMoMTQsIDMxLCBiYXNlKQ0KPj4gKyNkZWZpbmUgUkVTVF9ORUVERURfR1BS
UyhiYXNlKSBSRVNUX0dQUlMoMiwgMTIsIGJhc2UpOyBSRVNUX0dQUlMoMTQsIDMxLCBiYXNlKQ0K
Pg0KPiBUaGlzIG1hY3JvIG5hbWUgc2VlbXMgYSBiaXQgc2tldGNoeSwgYXMgZmFyIGFzIEkgdW5k
ZXJzdGFuZCByMCBhbmQgcjENCj4gYWxzbyBuZWVkIHRvIGJlIHNhdmVkL3Jlc3RvcmVkIGFsbHRo
b3VnaCB0aGV5IGFyZSBub3QgaGFuZGxlZCBieSB0aGlzIG1hY3JvLg0KDQpZZXMsIHRoZSBuYW1l
IG9mIHRoaXMgbWFjcm8gaXMgaW5kZWVkIG5vdCB2ZXJ5IGFjY3VyYXRlLiBEbyB5b3UgaGF2ZSBh
bnkgYmV0dGVyDQpzdWdnZXN0aW9ucz8gSG93IGFib3V0IHVzaW5nIFNBVkVfMjlHUlBTL1JFU1Rf
MjlHUlBTIGZvciBwcGM2NCB3aGlsZSBrZWVwaW5nDQpTQVZFXzMwR1JQUy9SRVNUXzMwR1JQUyBm
b3IgcHBjMzI/DQoNCg==

