Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9465CC42
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 05:05:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nmwxn0jbBz3c79
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 15:05:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=dKYGts6u;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LiT7P8FV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=dKYGts6u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LiT7P8FV;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmwwr5bcgz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 15:05:00 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9122D5C00CB;
	Tue,  3 Jan 2023 23:04:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 03 Jan 2023 23:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672805097; x=
	1672891497; bh=nmAqejIKc05X26HPLMwl+dCLla1WZHY3JqAy3819vtg=; b=d
	KYGts6u5bTZWGg9gzqyT6lHIFERskH/yu8vGziFon591k3ZjvN802DwOnWA7NLJs
	UyzWOrjlzks5vBKNxt2yjTHjIx7O9pXGEEwIl1KZ9TiQGDHUNhyMxwO6JjFKHRev
	Vy1ajjRns7aVmiOhkzkzoedxjXkkWlnKAjzViyg0loDw59t6wzhxo1zeacz0ehhy
	/Z9iKg3SBSurDORbkAI3evc5aWJtznizaccnoFKq1c2bvS3tB4vxIPwD4JM4ILN/
	XV6/nmJx0DrS36wNQuoaVO8aNd6eTT4l67JnI/TIYuwvWQIjBjzC83rqBqzRpl3b
	pL7SDXfKr04JDihpn8ZDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672805097; x=
	1672891497; bh=nmAqejIKc05X26HPLMwl+dCLla1WZHY3JqAy3819vtg=; b=L
	iT7P8FVc3SXKN7/a+OC2s/xx7OGYr6o11uzy0GED7PKwm3amQBSqyE4zdc/byr4L
	MYv5dgdfBIvsQtbg9ze4DRuNCeqP/tMA7pn5ujqjD3ZGr3OCvYgfsTn5vVqPgusc
	X+mvt3MZKR59L6F0mLic1L4HdVwwLV+6zNN/xwF2F+WwwTSwHIrtmRopHniw/8Su
	XbItGaXLsvYmnyxJMF3yr9RfKksNolkWfdv37J/z5vj/eYeKUO1pylQPmQKLKga0
	sTnGGYNwl7jlCHpZ2BKvBGsYnZUZ75r7JDiegwQ/dnggzbGcXhvnOxMJ1fXX79z8
	8nqGw4z27OWHQO1Yr9XrQ==
X-ME-Sender: <xms:6fq0Y0dtM4XqSPJFrKOi6wJ9qBg9FXe3MPNSYi-WxpYKg4ei-y1aRA>
    <xme:6fq0Y2NtfYKx1yCaBwDrBmwTt78H48aoRiCjj-dnpowuNxtQGQIK3wKMeSMTwMEOv
    49VuMy1darEZGOYFg>
X-ME-Received: <xmr:6fq0Y1jdUuigAh-W1Ioe1h5buWvLnDLiM-DXSXHH2fyOuH4sWIhHXZpZu165pbysYPgAYLDX0dINQzNXeNgpImrJlq3YhUPgDB6zbClCQuDQ0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeehgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtsgertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    ehudeiudehtdeufeeugeffgfduudfgffevkeevgfetteehvdefvdehuefhgfehhfenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:6fq0Y5-6KADQ1xYdv3HtwF9qZCvq2mfZ3x_9T-L9zWc5BVVO9W6wBQ>
    <xmx:6fq0YwsU2tGtcJkb1ZA2NwALG9VG2Pt61OzSSvlVL9QMCjs-pt3Xxg>
    <xmx:6fq0YwEH58xC96J6HQl6Lo34ve8ZTABfyKQvT96n-3KaKEGdRHNFmg>
    <xmx:6fq0Y0iyggjlgRlFYz9bZeYUZY4tfQqgVx2LbSIaM7BZ046A24nymQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 23:04:54 -0500 (EST)
Message-ID: <6a9a6c4fb24a417447951a23ca4c96c914ff246b.camel@russell.cc>
Subject: Re: [PATCH 4/4] powerpc/pseries: Implement signed update for PLPKS
 objects
From: Russell Currey <ruscur@russell.cc>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 15:04:52 +1100
In-Reply-To: <20221220071626.1426786-5-ajd@linux.ibm.com>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
	 <20221220071626.1426786-5-ajd@linux.ibm.com>
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTEyLTIwIGF0IDE4OjE2ICsxMTAwLCBBbmRyZXcgRG9ubmVsbGFuIHdyb3Rl
Ogo+IEZyb206IE5heW5hIEphaW4gPG5heW5hQGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIFBsYXRm
b3JtIEtleXN0b3JlIHByb3ZpZGVzIGEgc2lnbmVkIHVwZGF0ZSBpbnRlcmZhY2Ugd2hpY2ggY2Fu
IGJlCj4gdXNlZAo+IHRvIGNyZWF0ZSwgcmVwbGFjZSBvciBhcHBlbmQgdG8gY2VydGFpbiB2YXJp
YWJsZXMgaW4gdGhlIFBLUyBpbiBhCj4gc2VjdXJlCj4gZmFzaGlvbiwgd2l0aCB0aGUgaHlwZXJ2
aXNvciByZXF1aXJpbmcgdGhhdCB0aGUgdXBkYXRlIGJlIHNpZ25lZAo+IHVzaW5nIHRoZQo+IFBs
YXRmb3JtIEtleS4KPiAKPiBJbXBsZW1lbnQgYW4gaW50ZXJmYWNlIHRvIHRoZSBIX1BLU19TSUdO
RURfVVBEQVRFIGhjYWxsIGluIHRoZSBwbHBrcwo+IGRyaXZlciB0byBhbGxvdyBzaWduZWQgdXBk
YXRlcyB0byBQS1Mgb2JqZWN0cy4KPiAKPiAoVGhlIHBscGtzIGRyaXZlciBkb2Vzbid0IG5lZWQg
dG8gZG8gYW55IGNyeXB0b2dyYXBoeSBvciBvdGhlcndpc2UKPiBoYW5kbGUKPiB0aGUgYWN0dWFs
IHNpZ25lZCB2YXJpYWJsZSBjb250ZW50cyAtIHRoYXQgd2lsbCBiZSBoYW5kbGVkIGJ5Cj4gdXNl
cnNwYWNlCj4gdG9vbGluZy4pCj4gCj4gU2lnbmVkLW9mZi1ieTogTmF5bmEgSmFpbiA8bmF5bmFA
bGludXguaWJtLmNvbT4KPiBbYWpkOiBzcGxpdCBwYXRjaCwgcmV3cml0ZSBjb21taXQgbWVzc2Fn
ZSwgYWRkIHRpbWVvdXQgaGFuZGxpbmddCj4gQ28tZGV2ZWxvcGVkLWJ5OiBBbmRyZXcgRG9ubmVs
bGFuIDxhamRAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgRG9ubmVsbGFu
IDxhamRAbGludXguaWJtLmNvbT4KPiAtLS0KPiDCoGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9o
dmNhbGwuaMKgwqDCoMKgwqAgfMKgIDMgKy0KPiDCoGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNl
cmllcy9wbHBrcy5jIHwgODEgKysrKysrKysrKysrKysrKysrKysrKystCj4gLS0KPiDCoGFyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9wbHBrcy5oIHzCoCA1ICsrCj4gwqAzIGZpbGVzIGNo
YW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHZjYWxsLmgKPiBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9odmNhbGwuaAo+IGluZGV4IDk1ZmQ3Zjk0ODVkNS4uMzNiMjZjMGNiNjliIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9odmNhbGwuaAo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9odmNhbGwuaAo+IEBAIC0zMzYsNyArMzM2LDggQEAKPiDCoCNk
ZWZpbmUgSF9TQ01fRkxVU0jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDQ0Qwo+IMKgI2RlZmlu
ZSBIX0dFVF9FTkVSR1lfU0NBTEVfSU5GT8KgwqDCoMKgwqDCoMKgwqAweDQ1MAo+IMKgI2RlZmlu
ZSBIX1dBVENIRE9HwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDQ1Qwo+IC0jZGVmaW5lIE1B
WF9IQ0FMTF9PUENPREXCoMKgwqDCoMKgwqDCoEhfV0FUQ0hET0cKPiArI2RlZmluZSBIX1BLU19T
SUdORURfVVBEQVRFwqDCoMKgwqAweDQ1NAo+ICsjZGVmaW5lIE1BWF9IQ0FMTF9PUENPREXCoMKg
wqDCoMKgwqDCoEhfUEtTX1NJR05FRF9VUERBVEUKPiDCoAo+IMKgLyogU2NvcGUgYXJncyBmb3Ig
SF9TQ01fVU5CSU5EX0FMTCAqLwo+IMKgI2RlZmluZSBIX1VOQklORF9TQ09QRV9BTEwgKDB4MSkK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmMKPiBi
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9wbHBrcy5jCj4gaW5kZXggYzVhZTAwYThh
OTY4Li45ZTQ0MDFhYWJmNGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
c2VyaWVzL3BscGtzLmMKPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxw
a3MuYwo+IEBAIC0zMCw5ICszMCw5IEBACj4gwqAjZGVmaW5lIE1BWF9OQU1FX1NJWkXCoMKgwqDC
oMKgIDIzOQo+IMKgI2RlZmluZSBNQVhfREFUQV9TSVpFwqDCoMKgwqDCoCA0MDAwCj4gwqAKPiAt
I2RlZmluZSBQS1NfRkxVU0hfTUFYX1RJTUVPVVQgNTAwMCAvL21zZWMKPiAtI2RlZmluZSBQS1Nf
RkxVU0hfU0xFRVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMCAvL21zZWMKPiAtI2RlZmlu
ZSBQS1NfRkxVU0hfU0xFRVBfUkFOR0UgNDAwCj4gKyNkZWZpbmUgUEtTX01BWF9USU1FT1VUwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA1MDAwIC8vIG1zZWMKPiArI2RlZmluZSBQS1Nf
RkxVU0hfU0xFRVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDEwIC8vIG1zZWMKPiAr
I2RlZmluZSBQS1NfRkxVU0hfU0xFRVBfUkFOR0XCoMKgNDAwCj4gwqAKPiDCoHN0YXRpYyB1OCAq
b3NwYXNzd29yZDsKPiDCoHN0YXRpYyB1MTYgb3NwYXNzd29yZGxlbmd0aDsKPiBAQCAtOTUsNiAr
OTUsMTIgQEAgc3RhdGljIGludCBwc2VyaWVzX3N0YXR1c190b19lcnIoaW50IHJjKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gLUVOT0VOVDsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIEhfQlVTWToK
PiArwqDCoMKgwqDCoMKgwqBjYXNlIEhfTE9OR19CVVNZX09SREVSXzFfTVNFQzoKPiArwqDCoMKg
wqDCoMKgwqBjYXNlIEhfTE9OR19CVVNZX09SREVSXzEwX01TRUM6Cj4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSBIX0xPTkdfQlVTWV9PUkRFUl8xMDBfTVNFQzoKPiArwqDCoMKgwqDCoMKgwqBjYXNlIEhf
TE9OR19CVVNZX09SREVSXzFfU0VDOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgSF9MT05HX0JVU1lf
T1JERVJfMTBfU0VDOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgSF9MT05HX0JVU1lfT1JERVJfMTAw
X1NFQzoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IC1FQlVTWTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBj
YXNlIEhfQVVUSE9SSVRZOgo+IEBAIC0xOTgsMTQgKzIwNCwxNyBAQCBzdGF0aWMgc3RydWN0IGxh
YmVsICpjb25zdHJ1Y3RfbGFiZWwoY2hhcgo+ICpjb21wb25lbnQsIHU4IHZhcm9zLCB1OCAqbmFt
ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdTE2IG5hbWVsZW4pCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCBsYWJlbCAqbGFiZWw7Cj4gLcKgwqDCoMKgwqDCoMKgc2l6ZV90IHNsZW47Cj4gK8Kg
wqDCoMKgwqDCoMKgc2l6ZV90IHNsZW4gPSAwOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmICgh
bmFtZSB8fCBuYW1lbGVuID4gTUFYX05BTUVfU0laRSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
c2xlbiA9IHN0cmxlbihjb21wb25lbnQpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChjb21wb25lbnQg
JiYgc2xlbiA+IHNpemVvZihsYWJlbC0+YXR0ci5wcmVmaXgpKQo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiArwqDCoMKgwqDCoMKgwqAv
LyBTdXBwb3J0IE5VTEwgY29tcG9uZW50IGZvciBzaWduZWQgdXBkYXRlcwo+ICvCoMKgwqDCoMKg
wqDCoGlmIChjb21wb25lbnQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2xl
biA9IHN0cmxlbihjb21wb25lbnQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAoc2xlbiA+IHNpemVvZihsYWJlbC0+YXR0ci5wcmVmaXgpKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8vIFRoZSBsYWJlbCBzdHJ1
Y3R1cmUgbXVzdCBub3QgY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LCBzbyB3ZQo+IGFsaWduIHRvIHRo
ZSBuZXh0IHBvd2VyIG9mIDIKPiDCoMKgwqDCoMKgwqDCoMKgbGFiZWwgPSBremFsbG9jKHJvdW5k
dXBfcG93X29mX3R3byhzaXplb2YoKmxhYmVsKSksCj4gR0ZQX0tFUk5FTCk7Cj4gQEAgLTM3Miw3
ICszODEsNyBAQCBzdGF0aWMgaW50IHBscGtzX2NvbmZpcm1fb2JqZWN0X2ZsdXNoZWQoc3RydWN0
Cj4gbGFiZWwgKmxhYmVsLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdXNsZWVw
X3JhbmdlKFBLU19GTFVTSF9TTEVFUCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQS1NfRkxVU0hfU0xFRVAgKwo+IFBLU19GTFVTSF9T
TEVFUF9SQU5HRSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0aW1lb3V0ID0g
dGltZW91dCArIFBLU19GTFVTSF9TTEVFUDsKPiAtwqDCoMKgwqDCoMKgwqB9IHdoaWxlICh0aW1l
b3V0IDwgUEtTX0ZMVVNIX01BWF9USU1FT1VUKTsKPiArwqDCoMKgwqDCoMKgwqB9IHdoaWxlICh0
aW1lb3V0IDwgUEtTX01BWF9USU1FT1VUKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAodGlt
ZWRfb3V0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmMgPSAtRVRJTUVET1VU
Owo+IEBAIC0zODIsNiArMzkxLDYwIEBAIHN0YXRpYyBpbnQgcGxwa3NfY29uZmlybV9vYmplY3Rf
Zmx1c2hlZChzdHJ1Y3QKPiBsYWJlbCAqbGFiZWwsCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBy
YzsKPiDCoH0KPiDCoAo+ICtpbnQgcGxwa3Nfc2lnbmVkX3VwZGF0ZV92YXIoc3RydWN0IHBscGtz
X3ZhciB2YXIsIHU2NCBmbGFncykKPiArewo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcg
cmV0YnVmW1BMUEFSX0hDQUxMOV9CVUZTSVpFXSA9IHswfTsKPiArwqDCoMKgwqDCoMKgwqBpbnQg
cmM7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGxhYmVsICpsYWJlbDsKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgcGxwa3NfYXV0aCAqYXV0aDsKPiArwqDCoMKgwqDCoMKgwqB1NjQgY29udGludWV0
b2tlbiA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgdTY0IHRpbWVvdXQgPSAwOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqBpZiAoIXZhci5kYXRhIHx8IHZhci5kYXRhbGVuIDw9IDAgfHwgdmFyLm5hbWVsZW4g
Pgo+IE1BWF9OQU1FX1NJWkUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAtRUlOVkFMOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoISh2YXIucG9saWN5ICYgU0lHTkVE
VVBEQVRFKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGF1dGggPSBjb25zdHJ1Y3RfYXV0aChQS1NfT1NfT1dORVIp
Owo+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIoYXV0aCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKGF1dGgpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBs
YWJlbCA9IGNvbnN0cnVjdF9sYWJlbCh2YXIuY29tcG9uZW50LCB2YXIub3MsIHZhci5uYW1lLAo+
IHZhci5uYW1lbGVuKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGxhYmVsKSkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IFBUUl9FUlIobGFiZWwpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiArwqDCoMKgwqDCoMKgwqB9Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoGRvIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmMgPSBwbHBhcl9oY2FsbDkoSF9QS1NfU0lHTkVEX1VQREFURSwgcmV0YnVmLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZpcnRfdG9fcGh5cyhhdXRoKSwKPiB2aXJ0X3RvX3BoeXMobGFiZWwpLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxh
YmVsLT5zaXplLCB2YXIucG9saWN5LCBmbGFncywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aXJ0X3RvX3BoeXModmFy
LmRhdGEpLAo+IHZhci5kYXRhbGVuLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVldG9rZW4pOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWV0b2tlbiA9IHJldGJ1ZlswXTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHBzZXJpZXNfc3RhdHVzX3RvX2Vy
cihyYykgPT0gLUVCVVNZKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpbnQgZGVsYXlfbXMgPSBnZXRfbG9uZ2J1c3lfbXNlY3MocmMpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWRlbGF5KGRlbGF5X21z
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRpbWVv
dXQgKz0gZGVsYXlfbXM7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmMgPSBwc2VyaWVzX3N0YXR1c190b19lcnIocmMp
Owo+ICvCoMKgwqDCoMKgwqDCoH0gd2hpbGUgKHJjID09IC1FQlVTWSAmJiB0aW1lb3V0IDwgUEtT
X01BWF9USU1FT1VUKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFyYykgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IHBscGtzX2NvbmZpcm1fb2JqZWN0X2ZsdXNoZWQo
bGFiZWwsIGF1dGgpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IHBzZXJp
ZXNfc3RhdHVzX3RvX2VycihyYyk7CgpEb2Vzbid0IHBscGtzX2NvbmZpcm1fb2JqZWN0X2ZsdXNo
ZWQoKSBhbHJlYWR5IHJldHVybiBhIExpbnV4LWZyaWVuZGx5CmVycm9yIGNvZGU/ICBJZiBJJ20g
cmVhZGluZyB0aGlzIHJpZ2h0LCB3ZSdkIGJlIHJlcGxhY2luZyBhbnkgbm9uLXplcm8KcmV0dXJu
IGNvZGUgd2l0aCAtRUlOVkFMLgoKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoGtmcmVlKGxhYmVsKTsKPiArb3V0Ogo+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKGF1dGgpOwo+
ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmM7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChwbHBr
c19zaWduZWRfdXBkYXRlX3Zhcik7Cj4gKwo+IMKgaW50IHBscGtzX3dyaXRlX3ZhcihzdHJ1Y3Qg
cGxwa3NfdmFyIHZhcikKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyByZXRi
dWZbUExQQVJfSENBTExfQlVGU0laRV0gPSB7IDAgfTsKPiBAQCAtNDI4LDcgKzQ5MSw3IEBAIGlu
dCBwbHBrc19yZW1vdmVfdmFyKGNoYXIgKmNvbXBvbmVudCwgdTggdmFyb3MsCj4gc3RydWN0IHBs
cGtzX3Zhcl9uYW1lIHZuYW1lKQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGFiZWwgKmxhYmVs
Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmM7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIWNv
bXBvbmVudCB8fCB2bmFtZS5uYW1lbGVuID4gTUFYX05BTUVfU0laRSkKPiArwqDCoMKgwqDCoMKg
wqBpZiAodm5hbWUubmFtZWxlbiA+IE1BWF9OQU1FX1NJWkUpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBhdXRo
ID0gY29uc3RydWN0X2F1dGgoUEtTX09TX09XTkVSKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmgKPiBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cHNlcmllcy9wbHBrcy5oCj4gaW5kZXggYzg5NzQwNzk2NjYwLi4zM2NmMTI4MDkzOTIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmgKPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxwa3MuaAo+IEBAIC00MCw2ICs0MCwxMSBA
QCBzdHJ1Y3QgcGxwa3NfdmFyX25hbWVfbGlzdCB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBw
bHBrc192YXJfbmFtZSB2YXJsaXN0W107Cj4gwqB9Owo+IMKgCj4gKy8qKgo+ICsgKiBVcGRhdGVz
IHRoZSBhdXRoZW50aWNhdGVkIHZhcmlhYmxlLiBJdCBleHBlY3RzIE5VTEwgYXMgdGhlCj4gY29t
cG9uZW50Lgo+ICsgKi8KPiAraW50IHBscGtzX3NpZ25lZF91cGRhdGVfdmFyKHN0cnVjdCBwbHBr
c192YXIgdmFyLCB1NjQgZmxhZ3MpOwo+ICsKPiDCoC8qKgo+IMKgICogV3JpdGVzIHRoZSBzcGVj
aWZpZWQgdmFyIGFuZCBpdHMgZGF0YSB0byBQS1MuCj4gwqAgKiBBbnkgY2FsbGVyIG9mIFBLUyBk
cml2ZXIgc2hvdWxkIHByZXNlbnQgYSB2YWxpZCBjb21wb25lbnQgdHlwZQo+IGZvcgoK

