Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5465FB89
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 07:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpDBZ5P4pz30CT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 17:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=iAJBs6b3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wEVQ1pTq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=iAJBs6b3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wEVQ1pTq;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpD9g3LL9z304m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 17:35:35 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 0C1AC3200A87;
	Fri,  6 Jan 2023 01:35:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 06 Jan 2023 01:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672986932; x=
	1673073332; bh=xIPL4chGSFXXnTHDoqhwzoSrVoTkoZ8BhJzCiZ8uv8U=; b=i
	AJBs6b3O7B82+P14aoBcHaMBUiaV1hDQrXXSBXd1GkLFapxDM2dcPIjg5m4dMryo
	KKSDbpRhy6c7xoQnEH1vQhlyY+XZmDSJf/75nxTFH3as6Lmt+JwPTNjygn7aN1c7
	lbjBxAF0jC4IbuX8eHw1MVE4b6vCSY+Lo8MQgGyTCYTf0wzsgbtrO8qNZvg+f5bw
	Op2fwykNRy3eoNiv6P8UQm4wGZGO8v94L1MI3nt9mHSHRJPKYn5veXW/SmOlUvzL
	hNkpNz29n/5GPDcUP34fnpBmqRWtiH+I+6hTm1kwQiSqaCv0NRCmFTTtwGK8U2Mf
	gZhF88IQBV/fNIVDYQuCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672986932; x=
	1673073332; bh=xIPL4chGSFXXnTHDoqhwzoSrVoTkoZ8BhJzCiZ8uv8U=; b=w
	EVQ1pTqmooLY5L7quMCG3R2eZ9uK3ktVu1OWxviGxMBtoAL1pHqE+hE2SrA2Fb0R
	zI9yUjfu+x313YDb3rGNtp6zVDpkn1b2dD2/GLyb0VHgcyajA1F6fnCTNPbRW/XW
	zv2W9LrDP4j2Zffkgtpl3F/Av4nYpMu9KeYzAo07QSOgS9UoyyoV4tHhKIRy3S4W
	01XsIAoyJGyMUzBM9q0WZDmYHSND5NH2nyJ9XmWntIA67cm650FTQ6O3rdmOL2/b
	pl6WCumWY/NDkH7mGVu/Rr4CFgN0DLF074L7UgiHLXJn8wwmcAyFWnSmt6+rBbzz
	E31DbZAQLVYGFU6WUJLRg==
X-ME-Sender: <xms:NMG3Y8qdEm6VHMCYtICuM--cYBbojNUFZq-fDIqCJVJ1VkcxzViKzA>
    <xme:NMG3YyrH3oEMxzrMM-oJpnVuA7C5R27Oy9ajrqQJ4AgR6cBTIEP2oioK2GKJwjNx2
    wKZwok3zhqmNm98Sg>
X-ME-Received: <xmr:NMG3YxPh4nA7vJl8N6hDNJlxeqzbiC8lHifcZWhXqo9cXdgOIfX0VvSoKFzzeya_2HA470emZfpH-91ZjGH6q39AqOS-5mH0rwAVKzz559NupA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeelgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtsgertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    ehudeiudehtdeufeeugeffgfduudfgffevkeevgfetteehvdefvdehuefhgfehhfenucev
    lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:NMG3Yz5TOCO1cgkV73Kt3QkakKCe9q13jriCRxPPkjaRw0TxEF6txQ>
    <xmx:NMG3Y77pMFcB--Vs-6PMZ2gGW6O9KK5QE2fAOoAqQOt6fN5oeqPtnw>
    <xmx:NMG3YzjW4tH2qMqpv4kRhT0VURUkmy-joVYDtTk6ceL-4_3WrZ_rgw>
    <xmx:NMG3Y4sJ6wLnYdrbU0xh0n2CmbxiZ2J5L4BNBhJMQ7-T3ddMbpkOkA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 01:35:29 -0500 (EST)
Message-ID: <247a3e32437ee98778db23348264e251bb97038e.camel@russell.cc>
Subject: Re: [PATCH v2 6/7] powerpc/secvar: Extend sysfs to include config
 vars
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 06 Jan 2023 17:35:27 +1100
In-Reply-To: <87358oi9hy.fsf@mpe.ellerman.id.au>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-7-ruscur@russell.cc>
	 <87358oi9hy.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIzLTAxLTA2IGF0IDE1OjE1ICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Ogo+IFJ1c3NlbGwgQ3VycmV5IDxydXNjdXJAcnVzc2VsbC5jYz4gd3JpdGVzOgo+ID4gVGhlIGZv
cnRoY29taW5nIHBzZXJpZXMgY29uc3VtZXIgb2YgdGhlIHNlY3ZhciBBUEkgd2FudHMgdG8gZXhw
b3NlCj4gPiBhCj4gPiBudW1iZXIgb2YgY29uZmlnIHZhcmlhYmxlcy7CoCBBbGxvd2luZyBzZWN2
YXIgaW1wbGVtZW50YXRpb25zIHRvCj4gPiBwcm92aWRlCj4gPiB0aGVpciBvd24gc3lzZnMgYXR0
cmlidXRlcyBtYWtlcyBpdCBlYXN5IGZvciBjb25zdW1lcnMgdG8gZXhwb3NlCj4gPiB3aGF0Cj4g
PiB0aGV5IG5lZWQgdG8uCj4gPiAKPiA+IFRoaXMgaXMgbm90IGJlaW5nIHVzZWQgYnkgdGhlIE9Q
QUwgc2VjdmFyIGltcGxlbWVudGF0aW9uIGF0Cj4gPiBwcmVzZW50LCBhbmQKPiA+IHRoZSBjb25m
aWcgZGlyZWN0b3J5IHdpbGwgbm90IGJlIGNyZWF0ZWQgaWYgbm8gYXR0cmlidXRlcyBhcmUgc2V0
Lgo+IAo+IFdvdWxkIGl0IGJlIHNsaWdodGx5IGNsZWFuZXIgaWYgdGhlIGF0dHJpYnV0ZXMgd2Vy
ZSBqdXN0IGEgbWVtYmVyIG9mCj4gc2VjdmFyX29wZXJhdGlvbnM/Cj4gCj4gVGhhdCB3b3VsZCBh
dm9pZCB0aGUgbmVlZCBmb3Igc29tZSBvZiB0aGUgc2VwYXJhdGUgaGFuZGxpbmcgb2YgdGhlCj4g
b3BzCj4gYW5kIHRoZSBhdHRyaWJ1dGVzLgo+IAo+IEkga25vdyAib3BzIiBpbXBsaWVzIGl0J3Mg
b25seSBtZXRob2RzLCBidXQgSSB0aGluayB0aGF0J3Mgbm90IGEgYmlnCj4gcHJvYmxlbS4gVGhl
IHBvd2VyX3BtdSBzdHJ1Y3QgZG9lcyBzb21ldGhpbmcgc2ltaWxhciwgd2hlcmUgaXQKPiBjb21i
aW5lcwo+IG9wcyBhbmQgYXR0cmlidXRlcy4KClllYWggdGhhdCBkb2VzIHNlZW0gZWFzaWVyLCB0
aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLgo+IAo+IGNoZWVycwo+IAo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zZWN2YXIuaAo+ID4gYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vc2VjdmFyLmgKPiA+IGluZGV4IDkyZDJjMDUxOTE4Yi4uMjUwZTcwNjZiNmRhIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3NlY3Zhci5oCj4gPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdmFyLmgKPiA+IEBAIC0xMCw2ICsxMCw3IEBA
Cj4gPiDCoAo+ID4gwqAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IMKgI2luY2x1ZGUgPGxp
bnV4L2Vycm5vLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+Cj4gPiDCoAo+ID4gwqBl
eHRlcm4gY29uc3Qgc3RydWN0IHNlY3Zhcl9vcGVyYXRpb25zICpzZWN2YXJfb3BzOwo+ID4gwqAK
PiA+IEBAIC0yNywxMCArMjgsMTIgQEAgc3RydWN0IHNlY3Zhcl9vcGVyYXRpb25zIHsKPiA+IMKg
I2lmZGVmIENPTkZJR19QUENfU0VDVVJFX0JPT1QKPiA+IMKgCj4gPiDCoGV4dGVybiB2b2lkIHNl
dF9zZWN2YXJfb3BzKGNvbnN0IHN0cnVjdCBzZWN2YXJfb3BlcmF0aW9ucyAqb3BzKTsKPiA+ICtl
eHRlcm4gdm9pZCBzZXRfc2VjdmFyX2NvbmZpZ19hdHRycyhjb25zdCBzdHJ1Y3QgYXR0cmlidXRl
Cj4gPiAqKmF0dHJzKTsKPiA+IMKgCj4gPiDCoCNlbHNlCj4gPiDCoAo+ID4gwqBzdGF0aWMgaW5s
aW5lIHZvaWQgc2V0X3NlY3Zhcl9vcHMoY29uc3Qgc3RydWN0IHNlY3Zhcl9vcGVyYXRpb25zCj4g
PiAqb3BzKSB7IH0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3NlY3Zhcl9jb25maWdfYXR0
cnMoY29uc3Qgc3RydWN0IGF0dHJpYnV0ZQo+ID4gKiphdHRycykgeyB9Cj4gPiDCoAo+ID4gwqAj
ZW5kaWYKPiA+IMKgCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZWN2YXIt
c3lzZnMuYwo+ID4gYi9hcmNoL3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jCj4gPiBpbmRl
eCBhYTFkYWVjNDgwZTEuLmFkMWUxZDcyZDJhZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvc2VjdmFyLXN5c2ZzLmMKPiA+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2Vj
dmFyLXN5c2ZzLmMKPiA+IEBAIC0xNSw5ICsxNSwxNyBAQAo+ID4gwqAKPiA+IMKgI2RlZmluZSBO
QU1FX01BWF9TSVpFwqDCoMKgwqAgMTAyNAo+ID4gwqAKPiA+ICtjb25zdCBzdHJ1Y3QgYXR0cmli
dXRlICoqc2VjdmFyX2NvbmZpZ19hdHRycyBfX3JvX2FmdGVyX2luaXQgPQo+ID4gTlVMTDsKPiA+
ICsKPiA+IMKgc3RhdGljIHN0cnVjdCBrb2JqZWN0ICpzZWN2YXJfa29iajsKPiA+IMKgc3RhdGlj
IHN0cnVjdCBrc2V0ICpzZWN2YXJfa3NldDsKPiA+IMKgCj4gPiArdm9pZCBzZXRfc2VjdmFyX2Nv
bmZpZ19hdHRycyhjb25zdCBzdHJ1Y3QgYXR0cmlidXRlICoqYXR0cnMpCj4gPiArewo+ID4gK8Kg
wqDCoMKgwqDCoMKgV0FSTl9PTl9PTkNFKHNlY3Zhcl9jb25maWdfYXR0cnMpOwo+ID4gK8KgwqDC
oMKgwqDCoMKgc2VjdmFyX2NvbmZpZ19hdHRycyA9IGF0dHJzOwo+ID4gK30KPiA+ICsKPiA+IMKg
c3RhdGljIHNzaXplX3QgZm9ybWF0X3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdAo+
ID4ga29ial9hdHRyaWJ1dGUgKmF0dHIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKmJ1ZikKPiA+IMKgewo+ID4gQEAgLTEzNCw2
ICsxNDIsMTYgQEAgc3RhdGljIGludCB1cGRhdGVfa29ial9zaXplKHZvaWQpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoH0KPiA+IMKgCj4gPiArc3RhdGljIGludCBzZWN2YXJf
c3lzZnNfY29uZmlnKHN0cnVjdCBrb2JqZWN0ICprb2JqKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgY29uZmlnX2dyb3VwID0gewo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gImNvbmZpZyIsCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLmF0dHJzID0gKHN0cnVjdCBhdHRyaWJ1dGUgKiopc2VjdmFyX2Nv
bmZpZ19hdHRycywKPiA+ICvCoMKgwqDCoMKgwqDCoH07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqByZXR1cm4gc3lzZnNfY3JlYXRlX2dyb3VwKGtvYmosICZjb25maWdfZ3JvdXApOwo+ID4gK30K
PiA+ICsKPiA+IMKgc3RhdGljIGludCBzZWN2YXJfc3lzZnNfbG9hZCh2b2lkKQo+ID4gwqB7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgY2hhciAqbmFtZTsKPiA+IEBAIC0xOTYsMjYgKzIxNCwzOCBAQCBz
dGF0aWMgaW50IHNlY3Zhcl9zeXNmc19pbml0KHZvaWQpCj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKg
wqDCoHJjID0gc3lzZnNfY3JlYXRlX2ZpbGUoc2VjdmFyX2tvYmosICZmb3JtYXRfYXR0ci5hdHRy
KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmMpIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBrb2JqZWN0X3B1dChzZWN2YXJfa29iaik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcHJfZXJyKCJzZWN2YXI6IEZhaWxlZCB0byBjcmVhdGUgZm9ybWF0IG9iamVjdFxu
Iik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmMgPSAtRU5PTUVNOwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoH0KPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgc2VjdmFyX2tzZXQgPSBrc2V0X2NyZWF0
ZV9hbmRfYWRkKCJ2YXJzIiwgTlVMTCwKPiA+IHNlY3Zhcl9rb2JqKTsKPiA+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoIXNlY3Zhcl9rc2V0KSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHByX2Vycigic2VjdmFyOiBzeXNmcyBrb2JqZWN0IHJlZ2lzdHJhdGlvbgo+ID4gZmFpbGVk
LlxuIik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga29iamVjdF9wdXQoc2Vj
dmFyX2tvYmopOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5P
TUVNOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJjID0gLUVOT01FTTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycjsKPiA+IMKgwqDCoMKgwqDC
oMKgwqB9Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoHJjID0gdXBkYXRlX2tvYmpfc2l6ZSgp
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChyYykgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBwcl9lcnIoIkNhbm5vdCByZWFkIHRoZSBzaXplIG9mIHRoZSBhdHRyaWJ1dGVc
biIpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycjsKPiA+ICvCoMKgwqDCoMKgwqDC
oH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChzZWN2YXJfY29uZmlnX2F0dHJzKSB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmMgPSBzZWN2YXJfc3lzZnNfY29uZmln
KHNlY3Zhcl9rb2JqKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmMp
IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJf
ZXJyKCJzZWN2YXI6IEZhaWxlZCB0byBjcmVhdGUgY29uZmlnCj4gPiBkaXJlY3RvcnlcbiIpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVy
cjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgfQo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZWN2YXJfc3lzZnNfbG9hZCgpOwo+ID4g
wqAKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+ICtlcnI6Cj4gPiArwqDCoMKgwqDC
oMKgwqBrb2JqZWN0X3B1dChzZWN2YXJfa29iaik7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmM7Cj4gPiDCoH0KPiA+IMKgCj4gPiDCoGxhdGVfaW5pdGNhbGwoc2VjdmFyX3N5c2ZzX2luaXQp
Owo+ID4gLS0gCj4gPiAyLjM4LjEKCg==

