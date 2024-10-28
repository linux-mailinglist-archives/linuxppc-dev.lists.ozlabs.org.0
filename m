Return-Path: <linuxppc-dev+bounces-2628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2E9B248E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 06:46:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcMpS2bKvz2xRm;
	Mon, 28 Oct 2024 16:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730094416;
	cv=none; b=nrPx5/88J67MrBcWxQ6luzwLCJnczpDCmRKVxQy1LSsYio0oVPFCLWhk/DxWqpoBJEGHUbIeRRWtHSYzfSUUNtvDPqnxrS+eU85bVAEMORMlsmjDWiirFHEq7L+AINUmhamowa6Qabeus/CR6DEnhllvR5JMA0ZZMRwd+CdSxIFvSqW/VuqvPA6R/+tstauku9fpG6UdGb9L4O40Sr1V9oiCOsVUmjguIEKl9evYSuWRi4ZSevmP0NfINlcvRQUugxgZfgNS1KjR4YmBC50G+BxsFzO6RjyDEDyMr93ixVZ7Y/Bqk8xtFfqWuaWupmwZgUrqbntGIjma/KZiCKBZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730094416; c=relaxed/relaxed;
	bh=OMDUt1JiIM60tJUhcbGeIusKB8rIA6ft0n0PF1UfVyE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a7cMpowpFQq6LXWMF3gSHyT0Bu5yze8Mvhl+KqBnuO4FeOiU0DOHTbWOOCk53ooaKQMYBmHcnqmRjP5sk5P09zQmfQ8EpJTebcD/2P1dK5PJyj56pkXwGNVMZEl/QNFRkCD4QPQGtiIkOOyRqUz7HI8n5Phf2q5reAK2XbNBzN+oo1ukDOs9gFZe57YZn5V3i2fPeBY+tRx0V9ak5tiHf03mAxJy3lfRkyHrM/XYM80ZbKfvt8wyG6+F9dUIQE6GTbU0oURNGhoXCOjv7nVmCdIPqVMRAgodJV1L++p0oAQigJA9TgfNxnLcoQcR2o5M7rA972L7XPKad74YbDwizA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hu8ku3x0; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hu8ku3x0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcMpQ1ZtDz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 16:46:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730094411;
	bh=OMDUt1JiIM60tJUhcbGeIusKB8rIA6ft0n0PF1UfVyE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hu8ku3x09JE6p7y7v7trn5lIhE4uz+agLI0UYSa1bU/zp+ThOALYVhMxPwrnpLjDa
	 VxnyNnMyeobW4bT6UPlNhR49HcUcXRCjahiOVVAFfrVZkQDF9GTpr0VF44VJfUXpue
	 H0h4nwwHMh9m2CqFwdu9zoQ0EsQ+oBQNTzP15qgIoEMh18Ckm0ely29JAZrK/9fyZh
	 lS5CGxQtQJOgDFGkZwdOsHyT8BPjXIVMaMpovWqwnWLrzpfVIQaCMVDucRqL/eGsL/
	 11olKF/2J3u0KwtipWgl2mVLRvKW1x5nJNLC2ti8gELad/8gziU37xEtdnNEtUqowl
	 F1wvCaFKCzarA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcMpL4SL7z4x6k;
	Mon, 28 Oct 2024 16:46:50 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>,
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, Linux Kbuild
 mailing list <linux-kbuild@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "Naveen N. Rao" <naveen@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia
 <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
In-Reply-To: <a00df08a-605f-41c9-ba0d-2060e0d1e8b4@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-18-hbathini@linux.ibm.com>
 <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
 <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com>
 <CAADnVQKfSH_zkP0-TwOB_BLxCBH9efot9mk03uRuooCTMmWnWA@mail.gmail.com>
 <7afc9cc7-95cd-45c7-b748-28040206d9a0@linux.ibm.com>
 <CAADnVQJjqnSVqq2n70-uqfrYRHH3n=5s9=t3D2AMooxxAHYfJQ@mail.gmail.com>
 <875xq07qv6.fsf@mail.lhotse>
 <28d39117-c512-4165-b082-4ca54da7ba6c@linux.ibm.com>
 <a00df08a-605f-41c9-ba0d-2060e0d1e8b4@linux.ibm.com>
Date: Mon, 28 Oct 2024 16:46:40 +1100
Message-ID: <87r080srsv.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

SGFyaSBCYXRoaW5pIDxoYmF0aGluaUBsaW51eC5pYm0uY29tPiB3cml0ZXM6DQo+IE9uIDEwLzEw
LzI0IDM6MDkgcG0sIEhhcmkgQmF0aGluaSB3cm90ZToNCj4+IE9uIDEwLzEwLzI0IDU6NDggYW0s
IE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6DQo+Pj4gQWxleGVpIFN0YXJvdm9pdG92IDxhbGV4ZWku
c3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cml0ZXM6DQo+Pj4+IE9uIFR1ZSwgT2N0IDEsIDIwMjQg
YXQgMTI6MTjigK9BTSBIYXJpIEJhdGhpbmkgPGhiYXRoaW5pQGxpbnV4LmlibS5jb20+IA0KPj4+
PiB3cm90ZToNCj4+Pj4+IE9uIDMwLzA5LzI0IDY6MjUgcG0sIEFsZXhlaSBTdGFyb3ZvaXRvdiB3
cm90ZToNCj4+Pj4+PiBPbiBTdW4sIFNlcCAyOSwgMjAyNCBhdCAxMDozM+KAr1BNIEhhcmkgQmF0
aGluaSANCj4+Pj4+PiA8aGJhdGhpbmlAbGludXguaWJtLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IE9u
IDE3LzA5LzI0IDE6MjAgcG0sIEFsZXhlaSBTdGFyb3ZvaXRvdiB3cm90ZToNCj4+Pj4+Pj4+IE9u
IFN1biwgU2VwIDE1LCAyMDI0IGF0IDEwOjU44oCvUE0gSGFyaSBCYXRoaW5pIA0KPj4+Pj4+Pj4g
PGhiYXRoaW5pQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gKw0K
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgLyoNCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgKiBH
ZW5lcmF0ZWQgc3RhY2sgbGF5b3V0Og0KPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqDQo+Pj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgICogZnVuYyBwcmV2IGJhY2sgY2hhaW7CoMKgwqDCoMKgwqDC
oMKgIFsgYmFjayBjaGFpbsKgwqDCoMKgwqDCoMKgIF0NCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgW8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdDQo+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgICogYnBmIHByb2cgcmVkem9uZS90YWlsY2FsbGNudCBbIC4uLsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXSA2NCANCj4+Pj4+Pj4+PiBieXRlcyAoNjQtYml0IHBv
d2VycGMpDQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXSAtLQ0KPj4+Pj4+Pj4gLi4uDQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqAgLyogRHVtbXkgZnJhbWUgc2l6ZSBmb3IgcHJvcGVyIHVud2luZCAt
IGluY2x1ZGVzIDY0LSANCj4+Pj4+Pj4+PiBieXRlcyByZWQgem9uZSBmb3IgNjQtYml0IHBvd2Vy
cGMgKi8NCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgIGJwZl9kdW1teV9mcmFtZV9zaXplID0gU1RB
Q0tfRlJBTUVfTUlOX1NJWkUgKyA2NDsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBXaGF0IGlzIHRoZSBn
b2FsIG9mIHN1Y2ggYSBsYXJnZSAicmVkIHpvbmUiID8NCj4+Pj4+Pj4+IFRoZSBrZXJuZWwgc3Rh
Y2sgaXMgYSBsaW1pdGVkIHJlc291cmNlLg0KPj4+Pj4+Pj4gV2h5IHJlc2VydmUgNjQgYnl0ZXMg
Pw0KPj4+Pj4+Pj4gdGFpbCBjYWxsIGNudCBjYW4gcHJvYmFibHkgYmUgb3B0aW9uYWwgYXMgd2Vs
bC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSGkgQWxleGVpLCB0aGFua3MgZm9yIHJldmlld2luZy4NCj4+
Pj4+Pj4gRldJVywgdGhlIHJlZHpvbmUgb24gcHBjNjQgaXMgMjg4IGJ5dGVzLiBCUEYgSklUIGZv
ciBwcGM2NCB3YXMgdXNpbmcNCj4+Pj4+Pj4gYSByZWR6b25lIG9mIDgwIGJ5dGVzIHNpbmNlIHRh
aWxjYWxsIHN1cHBvcnQgd2FzIGludHJvZHVjZWQgWzFdLg0KPj4+Pj4+PiBJdCBjYW1lIGRvd24g
dG8gNjQgYnl0ZXMgdGhhbmtzIHRvIFsyXS4gVGhlIHJlZCB6b25lIGlzIGJlaW5nIHVzZWQNCj4+
Pj4+Pj4gdG8gc2F2ZSBOVlJzIGFuZCB0YWlsIGNhbGwgY291bnQgd2hlbiBhIHN0YWNrIGlzIG5v
dCBzZXR1cC4gSSBkbw0KPj4+Pj4+PiBhZ3JlZSB0aGF0IHdlIHNob3VsZCBsb29rIGF0IG9wdGlt
aXppbmcgaXQgZnVydGhlci4gRG8geW91IHRoaW5rDQo+Pj4+Pj4+IHRoZSBvcHRpbWl6YXRpb24g
c2hvdWxkIGdvIGFzIHBhcnQgb2YgUFBDNjQgdHJhbXBvbGluZSBlbmFibGVtZW50DQo+Pj4+Pj4+
IGJlaW5nIGRvbmUgaGVyZSBvciBzaG91bGQgdGhhdCBiZSB0YWtlbiB1cCBhcyBhIHNlcGFyYXRl
IGl0ZW0sIG1heWJlPw0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIGZvbGxvdyB1cCBpcyBmaW5lLg0KPj4+
Pj4+IEl0IGp1c3Qgb2RkIHRvIG1lIHRoYXQgd2UgY3VycmVudGx5IGhhdmU6DQo+Pj4+Pj4NCj4+
Pj4+PiBbwqDCoCB1bnVzZWQgcmVkIHpvbmUgXSAyMDggYnl0ZXMgcHJvdGVjdGVkDQo+Pj4+Pj4N
Cj4+Pj4+PiBJIHNpbXBseSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvIHdhc3RlIHRo
aXMgbXVjaCBzdGFjayBzcGFjZS4NCj4+Pj4+PiBXaHkgY2FuJ3QgaXQgYmUgemVybyB0b2RheSA/
DQo+Pj4+Pg0KPj4+Pj4gVGhlIEFCSSBmb3IgcHBjNjQgaGFzIGEgcmVkem9uZSBvZiAyODggYnl0
ZXMgYmVsb3cgdGhlIGN1cnJlbnQNCj4+Pj4+IHN0YWNrIHBvaW50ZXIgdGhhdCBjYW4gYmUgdXNl
ZCBhcyBhIHNjcmF0Y2ggYXJlYSB1bnRpbCBhIG5ldw0KPj4+Pj4gc3RhY2sgZnJhbWUgaXMgY3Jl
YXRlZC4gU28sIG5vIHdhc3RhZ2Ugb2Ygc3RhY2sgc3BhY2UgYXMgc3VjaC4NCj4+Pj4+IEl0IGlz
IGp1c3QgcmVkIHpvbmUgdGhhdCBjYW4gYmUgdXNlZCBiZWZvcmUgYSBuZXcgc3RhY2sgZnJhbWUN
Cj4+Pj4+IGlzIGNyZWF0ZWQuIFRoZSBjb21tZW50IHRoZXJlIGlzIG9ubHkgdG8gc2hvdyBob3cg
cmVkem9uZSBpcw0KPj4+Pj4gYmVpbmcgdXNlZCBpbiBwcGM2NCBCUEYgSklULiBJIHRoaW5rIHRo
ZSBjb25mdXNpb24gaXMgd2l0aCB0aGUNCj4+Pj4+IG1lbnRpb24gb2YgIjIwOCBieXRlcyIgYXMg
cHJvdGVjdGVkLiBBcyBub3QgYWxsIG9mIHRoYXQgc2NyYXRjaA0KPj4+Pj4gYXJlYSBpcyB1c2Vk
LCBpdCBtZW50aW9ucyB0aGUgcmVtYWluaW5nIGFzIHVudXNlZC4gRXNzZW50aWFsbHkNCj4+Pj4+
IDI4OCBieXRlcyBiZWxvdyBjdXJyZW50IHN0YWNrIHBvaW50ZXIgaXMgcHJvdGVjdGVkIGZyb20g
ZGVidWdnZXJzDQo+Pj4+PiBhbmQgaW50ZXJydXB0IGNvZGUgKHJlZCB6b25lKS4gTm90ZSB0aGF0
IGl0IHNob3VsZCBiZSAyMjQgYnl0ZXMNCj4+Pj4+IG9mIHVudXNlZCByZWQgem9uZSBpbnN0ZWFk
IG9mIDIwOCBieXRlcyBhcyByZWQgem9uZSB1c2FnZSBpbg0KPj4+Pj4gcHBjNjQgQlBGIEpJVCBj
b21lIGRvd24gZnJvbSA4MCBieXRlcyB0byA2NCBieXRlcyBzaW5jZSBbMl0uDQo+Pj4+PiBIb3Bl
IHRoYXQgY2xlYXJzIHRoZSBtaXN1bmRlcnN0YW5kaW5nLi4NCj4+Pj4NCj4+Pj4gSSBzZWUuIFRo
YXQgbWFrZXMgc2Vuc2UuIFNvIGl0J3Mgc2ltaWxhciB0byBhbWQ2NCByZWQgem9uZSwNCj4+Pj4g
YnV0IHRoZXJlIHdlIGhhdmUgYW4gaXNzdWUgd2l0aCBpcnFzLCBoZW5jZSB0aGUga2VybmVsIGlz
DQo+Pj4+IGNvbXBpbGVkIHdpdGggLW1uby1yZWQtem9uZS4NCj4+Pg0KPj4+IEkgYXNzdW1lIHRo
YXQgaXNzdWUgaXMgdGhhdCB0aGUgaW50ZXJydXB0IGVudHJ5IHVuY29uZGl0aW9uYWxseSB3cml0
ZXMNCj4+PiBzb21lIGRhdGEgYmVsb3cgdGhlIHN0YWNrIHBvaW50ZXIsIGRpc3JlZ2FyZGluZyB0
aGUgcmVkIHpvbmU/DQo+Pj4NCj4+Pj4gSSBndWVzcyBwcGMgYWx3YXlzIGhhcyBhIGRpZmZlcmVu
dCBpbnRlcnJ1cHQgc3RhY2sgYW5kDQo+Pj4+IGl0J3Mgbm90IGFuIGlzc3VlPw0KPj4+DQo+Pj4g
Tm8sIHRoZSBpbnRlcnJ1cHQgZW50cnkgYWxsb2NhdGVzIGEgZnJhbWUgdGhhdCBpcyBiaWcgZW5v
dWdoIHRvIGNvdmVyDQo+Pj4gdGhlIHJlZCB6b25lIGFzIHdlbGwgYXMgdGhlIHNwYWNlIGl0IG5l
ZWRzIHRvIHNhdmUgcmVnaXN0ZXJzLg0KPj4+DQo+Pj4gU2VlIFNUQUNLX0lOVF9GUkFNRV9TSVpF
IHdoaWNoIGluY2x1ZGVzIEtFUk5FTF9SRURaT05FX1NJWkU6DQo+Pj4NCj4+PiDCoMKgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC8gDQo+Pj4gdHJlZS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHRyYWNlLmg/IA0KPj4+
IGNvbW1pdD04Y2YwYjkzOTE5ZTEzZDFlOGQ0NDY2ZWI0MDgwYTRjNGQ5ZDY2ZDdiI24xNjUNCj4+
Pg0KPj4+IFdoaWNoIGlzIHJlbmFtZWQgdG8gSU5UX0ZSQU1FX1NJWkUgaW4gYXNtLW9mZnNldHMu
YyBhbmQgdGhlbiBpcyB1c2VkIGluDQo+Pj4gdGhlIGludGVycnVwdCBlbnRyeSBoZXJlOg0KPj4+
DQo+Pj4gwqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvIA0KPj4+IHRyZWUvYXJjaC9wb3dlcnBjL2tlcm5lbC9leGNl
cHRpb25zLTY0cy5TPyANCj4+PiBjb21taXQ9OGNmMGI5MzkxOWUxM2QxZThkNDQ2NmViNDA4MGE0
YzRkOWQ2NmQ3YiNuNDk3DQo+PiANCj4+IFRoYW5rcyBmb3IgY2xhcmlmeWluZyB0aGF0LCBNaWNo
YWVsLg0KPj4gT25seSBhc3luYyBpbnRlcnJ1cHQgaGFuZGxlcnMgdXNlIGRpZmZlcmVudCBpbnRl
cnJ1cHQgc3RhY2tzLCByaWdodD8NCj4NCj4gLi4uIGFuZCBzZXBhcmF0ZSBlbWVyZ2VuY3kgc3Rh
Y2sgZm9yIHNvbWUgc3BlY2lhbCBjYXNlcy4uLg0KDQpUaGVyZSBpc24ndCBhIG5lYXQgcnVsZSBs
aWtlIHN5bmMvYXN5bmMuDQoNCk1vc3QgaW50ZXJydXB0cyB1c2UgdGhlIG5vcm1hbCBrZXJuZWwg
c3RhY2ssIHdoZXRoZXIgc3luYyBvciBhc3luYy4NCg0KRXh0ZXJuYWwgaW50ZXJydXB0cyBzd2l0
Y2ggdG8gYSBzZXBhcmF0ZSBoYXJkIGludGVycnVwdCBzdGFjaw0KKGhhcmRpcnFfY3R4KSBpbiBj
YWxsX2RvX2lycSgpLCBidXQgb25seSBhZnRlciBjb21pbmcgaW4gb24gdGhlIGtlcm5lbA0Kc3Rh
Y2sgZmlyc3QuDQoNClNvbWUgaW50ZXJydXB0cyB1c2UgdGhlIGVtZXJnZW5jeSBzdGFjayAoaW4g
c29tZSBjYXNlcyksIGVnLiBITUksIHNvZnQNCk5NSSAoZmFrZSksIFRNIGJhZCB0aGluZyAocHJv
Z3JhbSBjaGVjayksIG9yIHRoZWlyIG93biBzdGFjaywgc3lzdGVtDQpyZXNldCAobm1pX2VtZXJn
ZW5jeV9zcCksIG1hY2hpbmUgY2hlY2sgKG1jX2VtZXJnZW5jeV9zcCkuDQoNCmNoZWVycw0K

