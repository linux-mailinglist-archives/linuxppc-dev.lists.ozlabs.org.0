Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A758D192
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vmX6r2Sz3cfX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 10:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=gOmhoqcC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=yLDlF6Q6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=gOmhoqcC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=yLDlF6Q6;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vlT5bGJz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 10:56:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6ED1F320077A;
	Mon,  8 Aug 2022 20:56:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 08 Aug 2022 20:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1660006578; x=
	1660092978; bh=xXAVOD+VhrSR9jJZ6v3OPVsid1HVDZbzMl6wr2qK2t4=; b=g
	OmhoqcC4FNVmPISZtbhOQAoZRBXNfQMjSFC0Oi76F/q+0LJ9hOaBBgavsMO0cM/j
	+PHnrT/4+GWU9qZ6keHlWAZNzUG6DpPHTEE0FH1OMhhJQ5wLklAGnWtl7uTh4xfz
	kmLXvUDJX526YKSpIUgvCxrT72FWSJowWywCLlHAN160G4+NJGfqs0BM0e/ap1KN
	7xNW9wII9nqiF+MNeL5XImlRmTGRhYj25OFaNeX4AY+Ija7cwA6j9AD8a4lzzE40
	0tb404OLflb48sw+XZgkOzfILdO/PWqfAkHFUJTo5Jn2HSe6T64KizN+45Ay/803
	w2gXdfMGk36GyRtubkeyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660006578; x=
	1660092978; bh=xXAVOD+VhrSR9jJZ6v3OPVsid1HVDZbzMl6wr2qK2t4=; b=y
	LDlF6Q6M81PsKKSFtB/Jd77NHo8fFi7Tr540fcfFkfv3dDOdnoL7LJ85Jp70bTxE
	QymeN9q9gY0b/asrh0Ve5Gf9XDKRLgCsXd3nCSMn+iijOYP5lMiVmot2gAIisCnM
	dz2PX5XRaW+S1zlDNLi2TNiVR7gxn5LKbwA1ZxgpXS6brsuXbtEYW94XYsPvk/YZ
	08immZFH5EkPreimMvF0HjAd8WOFIBhAHPam6i647xGw6hWYDl8WufIjdxVC/AqI
	MshpHnk+Nz9M1kRceKH8IKxqnqLboNF/HZXN/748dzTqB0GlPquiBXF3k35lzKoJ
	4h0me8S2AibSMItTpZ37w==
X-ME-Sender: <xms:srDxYuDcMBkVj9ZcSUrP1Cs3XyNQlLkG2az-62J0TIrZv1-Zm3jCZw>
    <xme:srDxYohntcaldCYZLIw5UacP85fgLHPgizK8G5jC50uDcaAXCmloZ_VI6Y04jH55L
    b3p7EWsAbbNQTqLwg>
X-ME-Received: <xmr:srDxYhmdAe-wCnWo1-9nq5hKNv4FKflWaptL5Zxx2cWUKXBsFfHDzf_-BvE33lbJkw9lPELNXgXnK-4cf_1ZZ4ZrEuIZHetecupzuGZTTqjPTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthgsredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepieeifeffgfegtedtveetudekvdel
    gfetveduvddtffefveeilefhueffgeegjeetnecuffhomhgrihhnpehgihhthhhusghush
    gvrhgtohhnthgvnhhtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:srDxYszFw_zgLRXlGJq1l_s2ps7hpPVDBHI_6Wrrr1_HXwDTR5pDEQ>
    <xmx:srDxYjREZP8Bpu1jmcLb55b_7AFyjAiJ_OVZpv5Lua1Sv0W0QbGBpQ>
    <xmx:srDxYnZezkuzbA1tGcvWZWKcZZW84GR4XWDIHJ13WjtQGwm1K7gB8w>
    <xmx:srDxYhPRbbzzWD_ehYHR6R9I1DrBx56UKi1aOKRXAVFdkZMqenQ9tQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 20:56:16 -0400 (EDT)
Message-ID: <19ed45af17fb5e1c0044d50e4cb132db226260c0.camel@russell.cc>
Subject: Re: [PATCH v2 2/2] powerpc/mm: Support execute-only memory on the
 Radix MMU
From: Russell Currey <ruscur@russell.cc>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org
Date: Tue, 09 Aug 2022 10:56:13 +1000
In-Reply-To: <7adba348-00c4-e5f8-adbb-b0e403ec89bf@linux.ibm.com>
References: <20220808130109.30738-1-ruscur@russell.cc>
	 <20220808130109.30738-2-ruscur@russell.cc>
	 <7adba348-00c4-e5f8-adbb-b0e403ec89bf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, anshuman.khandual@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIyLTA4LTA4IGF0IDE4OjU0ICswNTMwLCBBbmVlc2ggS3VtYXIgSyBWIHdyb3Rl
Ogo+IE9uIDgvOC8yMiA2OjMxIFBNLCBSdXNzZWxsIEN1cnJleSB3cm90ZToKPiA+IFRoZSBIYXNo
IE1NVSBhbHJlYWR5IHN1cHBvcnRzIFhPTSAoaS5lLiBtbWFwIHdpdGggUFJPVF9FWEVDIG9ubHkp
Cj4gPiB0aHJvdWdoIHRoZSBleGVjdXRlLW9ubHkgcGtleS7CoCBBIFBST1RfRVhFQy1vbmx5IG1h
cHBpbmcgd2lsbAo+ID4gYWN0dWFsbHkKPiA+IG1hcCB0byBSWCwgYW5kIHRoZW4gdGhlIHBrZXkg
d2lsbCBiZSBhcHBsaWVkIG9uIHRvcCBvZiBpdC4KPiA+IAo+ID4gUmFkaXggZG9lc24ndCBoYXZl
IHBrZXlzLCBidXQgaXQgZG9lcyBoYXZlIGV4ZWN1dGUgcGVybWlzc2lvbnMKPiA+IGJ1aWx0LWlu
Cj4gPiB0byB0aGUgTU1VLCBzbyBhbGwgd2UgaGF2ZSB0byBkbyB0byBzdXBwb3J0IFhPTSBpcyBl
eHBvc2UgaXQuCj4gPiAKPiA+IFRoYXQncyBub3QgcG9zc2libGUgd2l0aCBwcm90ZWN0aW9uX21h
cCBiZWluZyBjb25zdCwgc28gbWFrZSBpdCBSTwo+ID4gYWZ0ZXIKPiA+IGluaXQgaW5zdGVhZC4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNj
Pgo+ID4gLS0tCj4gPiB2MjogTWFrZSBwcm90ZWN0aW9uX21hcCBfX3JvX2FmdGVyX2luaXQgYW5k
IHNldCBpdCBpbiBhbiBpbml0Y2FsbAo+ID4gKHYxIGRpZG4ndCB3b3JrLCBJIHRlc3RlZCBiZWZv
cmUgcmViYXNpbmcgb24gQW5zaHVtYW4ncyBwYXRjaGVzKQo+ID4gCj4gPiBiYXNpYyB0ZXN0Ogo+
ID4gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3J1c2N1ci9qdW5rY29kZS9tYWlu
L21tYXBfdGVzdC5jCj4gPiAKPiA+IMKgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC9yYWRpeC5oIHzCoCAzICsrKwo+ID4gwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJs
ZS5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4gPiDCoGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKysrKysrCj4g
PiDCoGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTYgKysrKysrKysrKysrKysrLQo+ID4gwqA0IGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3JhZGl4LmgKPiA+IGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Jvb2szcy82NC9yYWRpeC5oCj4gPiBpbmRleCA2ODYwMDFlZGE5MzYuLmJmMzE2
Yjc3M2Q3MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvcmFkaXguaAo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9y
YWRpeC5oCj4gPiBAQCAtMTksNiArMTksOSBAQAo+ID4gwqAjaW5jbHVkZSA8YXNtL2NwdV9oYXNf
ZmVhdHVyZS5oPgo+ID4gwqAjZW5kaWYKPiA+IMKgCj4gPiArLyogRXhlY3V0ZS1vbmx5IHBhZ2Ug
cHJvdGVjdGlvbnMsIEhhc2ggY2FuIHVzZSBSWCArIGV4ZWN1dGUtb25seQo+ID4gcGtleSAqLwo+
ID4gKyNkZWZpbmUgUEFHRV9FWEVDT05MWcKgwqBfX3BncHJvdChfUEFHRV9CQVNFIHwgX1BBR0Vf
RVhFQykKPiA+ICsKPiA+IMKgLyogQW4gZW1wdHkgUFRFIGNhbiBzdGlsbCBoYXZlIGEgUiBvciBD
IHdyaXRlYmFjayAqLwo+ID4gwqAjZGVmaW5lIFJBRElYX1BURV9OT05FX01BU0vCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAoX1BBR0VfRElSVFkgfAo+ID4gX1BBR0VfQUNDRVNTRUQpCj4gPiDCoAo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gaW5kZXggMzNmNGJmOGQyMmIw
Li4zY2JiNmRlMjBmOWQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
PiBAQCAtNjAsNyArNjAsNiBAQCBleHRlcm4gdm9pZCBwYWdpbmdfaW5pdCh2b2lkKTsKPiA+IMKg
dm9pZCBwb2tpbmdfaW5pdCh2b2lkKTsKPiA+IMKgCj4gPiDCoGV4dGVybiB1bnNpZ25lZCBsb25n
IGlvcmVtYXBfYm90Owo+ID4gLWV4dGVybiBjb25zdCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsx
Nl07Cj4gPiDCoAo+ID4gwqAvKgo+ID4gwqAgKiBrZXJuX2FkZHJfdmFsaWQgaXMgaW50ZW5kZWQg
dG8gaW5kaWNhdGUgd2hldGhlciBhbiBhZGRyZXNzIGlzIGEKPiA+IHZhbGlkCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMgYi9hcmNoL3Bvd2VycGMvbW0vZmF1bHQuYwo+
ID4gaW5kZXggMDE0MDA1NDI4Njg3Li44ODdjMGNjNDVjYTYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Bvd2VycGMvbW0vZmF1bHQuYwo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMKPiA+
IEBAIC0yNzAsNiArMjcwLDE2IEBAIHN0YXRpYyBib29sIGFjY2Vzc19lcnJvcihib29sIGlzX3dy
aXRlLCBib29sCj4gPiBpc19leGVjLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgfQo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICh1bmxpa2VseSghKHZtYS0+dm1f
ZmxhZ3MgJiBWTV9SRUFEKSkpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
Kgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElmIHdlJ3JlIG9uIFJhZGl4
LCB0aGVuIHRoaXMgY291bGQgYmUgYSByZWFkCj4gPiBhdHRlbXB0IG9uCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZXhlY3V0ZS1vbmx5IG1lbW9yeS7CoCBPbiBvdGhlciBN
TVVzLCBhbiAiZXhlYy0KPiA+IG9ubHkiIHBhZ2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiB3aWxsIGJlIGdpdmVuIFJYIGZsYWdzLCBzbyB0aGlzIG1pZ2h0IGJlCj4gPiBy
ZWR1bmRhbnQuCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJhZGl4X2VuYWJsZWQoKSkKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4g
PiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5
KCF2bWFfaXNfYWNjZXNzaWJsZSh2bWEpKSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHRydWU7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+
ID4gaW5kZXggMGIyYmJkZTVmYjY1Li42ZTFhNmE5OTljM2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Bvd2VycGMvbW0vcGd0YWJsZS5jCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5j
Cj4gPiBAQCAtNDc1LDcgKzQ3NSw3IEBAIHB0ZV90ICpfX2ZpbmRfbGludXhfcHRlKHBnZF90ICpw
Z2RpciwgdW5zaWduZWQKPiA+IGxvbmcgZWEsCj4gPiDCoEVYUE9SVF9TWU1CT0xfR1BMKF9fZmlu
ZF9saW51eF9wdGUpOwo+ID4gwqAKPiA+IMKgLyogTm90ZSBkdWUgdG8gdGhlIHdheSB2bSBmbGFn
cyBhcmUgbGFpZCBvdXQsIHRoZSBiaXRzIGFyZSBYV1IgKi8KPiA+IC1jb25zdCBwZ3Byb3RfdCBw
cm90ZWN0aW9uX21hcFsxNl0gPSB7Cj4gPiArc3RhdGljIHBncHJvdF90IHByb3RlY3Rpb25fbWFw
WzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgW1ZNX05PTkVdwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgPQo+ID4gUEFHRV9OT05FLAo+ID4gwqDCoMKgwqDCoMKgwqDCoFtW
TV9SRUFEXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0KPiA+IFBBR0VfUkVBRE9OTFksCj4gPiDCoMKg
wqDCoMKgwqDCoMKgW1ZNX1dSSVRFXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9Cj4gPiBQQUdFX0NPUFks
Cj4gPiBAQCAtNDk0LDYgKzQ5NCwyMCBAQCBjb25zdCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsx
Nl0gPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklU
RSB8IFZNX1JFQURdwqDCoMKgwqDCoMKgPQo+ID4gUEFHRV9TSEFSRURfWAo+ID4gwqB9Owo+ID4g
wqAKPiA+ICsjaWZkZWYgQ09ORklHX1BQQ19SQURJWF9NTVUKPiA+ICtzdGF0aWMgaW50IF9faW5p
dCByYWRpeF91cGRhdGVfcHJvdGVjdGlvbl9tYXAodm9pZCkKPiA+ICt7Cj4gPiArwqDCoMKgwqDC
oMKgwqBpZiAoZWFybHlfcmFkaXhfZW5hYmxlZCgpKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyogUmFkaXggZGlyZWN0bHkgc3VwcG9ydHMgZXhlY3V0ZS1vbmx5IHBhZ2UK
PiA+IHByb3RlY3Rpb25zICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJv
dGVjdGlvbl9tYXBbVk1fRVhFQ10gPSBQQUdFX0VYRUNPTkxZOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHByb3RlY3Rpb25fbWFwW1ZNX0VYRUMgfCBWTV9TSEFSRURdID0KPiA+
IFBBR0VfRVhFQ09OTFk7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsKPiA+ICt9Cj4gPiArYXJjaF9pbml0Y2FsbChyYWRpeF91cGRhdGVfcHJv
dGVjdGlvbl9tYXApOwo+IAo+IEluc3RlYWQgb2YgdGhpcyBjYW4gd2UgZG8gdGhpcyBpbiB2bV9n
ZXRfcGFnZV9wcm90KCkgPwo+IAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBFWEVDIG9ubHkgc2hhcmVk
IG9yIG5vbiBzaGFyZWQgbWFwcGluZyA/ICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyYWRpeF9l
bmFibGVkKCkgJiYgKCh2bV9mbGFncyAmIChWTV9SRUFEIHwgVk1fV1JJVEUgfAo+IFZNX0VYRUMp
KSA9PSBWTV9FWEVDKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByb3QgPSBQ
QUdFX0VYRUNPTkxZOyAKClRoYXQgaXMgYSBsb3Qgc2ltcGxlciwgdGhhbmtzLgoKLSBSdXNzZWxs
Cgo+IAo+IAo+ID4gKyNlbmRpZiAvKiBDT05GSUdfUFBDX1JBRElYX01NVSAqLwo+ID4gKwo+ID4g
wqAjaWZkZWYgQ09ORklHX1BQQ19CT09LM1NfNjQKPiA+IMKgcGdwcm90X3Qgdm1fZ2V0X3BhZ2Vf
cHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQo+ID4gwqB7Cj4gCgo=

