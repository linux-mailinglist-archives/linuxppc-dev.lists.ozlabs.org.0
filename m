Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9F55B5F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 06:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWZ6V6P4jz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 14:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=DAylWBEP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mzMpAk/Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=DAylWBEP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mzMpAk/Z;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWZ5k5Pg8z3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:10:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id EA48E320085B;
	Mon, 27 Jun 2022 00:10:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 Jun 2022 00:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656303042; x=
	1656389442; bh=HbtKYQh14amSIs5NaX+nYpy2zLFo4y3s85F1PIuP0Dk=; b=D
	AylWBEPFbAoFGtlRUHLX+Jh6BjYRA+urKuyike/dcc/SJHHsw9LeLcOpI0L0JeDs
	pVFDvud/oYqE4Tmy+uKc6eobRF6maZWBbcqY+VKQw9JHMUvIkU5QTbTrRSB/pvlq
	4oIRBdNvF9jLph0zW8KJAJ0N0WrSo7vo3mVyY51u1MQvB/HcOdHfXBYn0alhT05b
	sbY5U9Zx82LK13bZMR0Raf5C4KDv1TN98/x7L9S9b8NA/g2gFzQ4Y2r1vyYcvTu1
	NiBg7h9kwi8nCMEU32fMC2HWqbI/t17JiXOjCtKDYGfp4ng+t+BOucGML6qxYNxD
	YtqeDHg11ArLuouH5edGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656303042; x=
	1656389442; bh=HbtKYQh14amSIs5NaX+nYpy2zLFo4y3s85F1PIuP0Dk=; b=m
	zMpAk/ZZj+W6D4SSmouAJiH1On8RBiUgqxGUotLNABit35XYXLO7wO+Dz58lBiGV
	ORqwvrarxS7dgnDa5IUit4qq95Zr8mipfdw8MmXZFlzLyI5aQmhqe0bTSrfaJA8R
	EcUj1VBPpNJxC/HYQkvPNJyuc1t1FIb3DVsRfrqlAYOirnPVjG3tu6WeR9aY6u2G
	dv5hMYSt9DE8ifraF0L6UQGxXIcdBKG18SqZG3qaNJizpC245u1b7bgBAf4WP2Ig
	O5boY7UeuapZOEFs1vFBsoux51nfRNllceYKKjjJGOqoPLZ6x2RtE9OVbc2rP/S6
	e3A3o2EKGcOvL88B96kfg==
X-ME-Sender: <xms:wS25Ylfe9X_d51ht-2k96947dTyODti-C7yNqtT4A3iAdWOlbvriCg>
    <xme:wS25YjPxmxOs_QmL1fCohgFytTHWBJz7dT-x4zdwBcWZnZd7GC6wuIbPxvP34IFNK
    QwcuXx94It3gCIB6w>
X-ME-Received: <xmr:wS25YujcfQDlIzM0OUO1h-QzMVuR9VAYXYeiD5IF7K3ITCCR11Rh68YLN7dTt5STbIUvw7Dks8Va5ITHwZA7Oza-PHzwg3J6XuI6EBEWltnSDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthgsredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepheduieduhedtueefueegfffguddu
    gfffveekvefgteethedvfedvheeuhffghefhnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:wS25Yu_q0mQzvOld0xX1AVCPFgdwupoWHdrZVc9mntiMybDK6GTAfA>
    <xmx:wS25YhuGeH9sLduBsGFwDR0XH6aWxFCsNR5wpAIi-0b2bIGKagNkPA>
    <xmx:wS25YtH3lxqdmCc6K6glrPCbUU1u3pWdqvRO799WaxL5AHBdDyTWCA>
    <xmx:wi25Yq4bhi2VsBvxjMn-20otH8BMNAGjc_eJOGrizKAs1iuog7XtYw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 00:10:39 -0400 (EDT)
Message-ID: <dc7c7d99b515664fca22b5a4b62d8346e07aded8.camel@russell.cc>
Subject: Re: [PATCH kernel] pseries/iommu/ddw: Fix kdump to work in absence
 of ibm,dma-window
From: Russell Currey <ruscur@russell.cc>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 27 Jun 2022 14:10:36 +1000
In-Reply-To: <20220616075901.835871-1-aik@ozlabs.ru>
References: <20220616075901.835871-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDE3OjU5ICsxMDAwLCBBbGV4ZXkgS2FyZGFzaGV2c2tpeSB3
cm90ZToKPiBUaGUgcHNlcmllcyBwbGF0Zm9ybSB1c2VzIDMyYml0IGRlZmF1bHQgRE1BIHdpbmRv
dyAoYWx3YXlzIDRLIHBhZ2VzKQo+IGFuZAo+IG9wdGlvbmFsIDY0Yml0IERNQSB3aW5kb3cgYXZh
aWxhYmxlIHZpYSBERFcgKCJEeW5hbWljIERNQSBXaW5kb3dzIiksCj4gNjRLIG9yIDJNIHBhZ2Vz
LiBGb3IgYWdlcyB0aGUgZGVmYXVsdCBvbmUgd2FzIG5vdCByZW1vdmVkIGFuZCBhIGh1Z2UKPiB3
aW5kb3cgd2FzIGNyZWF0ZWQgaW4gYWRkaXRpb24uIFRoaW5ncyBjaGFuZ2VkIHdpdGggU1JJT1Yt
ZW5hYmxlZAo+IFBvd2VyVk0gd2hpY2ggY3JlYXRlcyBhIGRlZmF1bHQtYW5kLWJpZ2dlciBETUEg
d2luZG93IGluIDY0Yml0IHNwYWNlCj4gKHN0aWxsIHVzaW5nIDRLIHBhZ2VzKSBmb3IgSU9WIFZG
cyBzbyBjZXJ0YWluIE9TZXMgZG8gbm90IG5lZWQgdG8gdXNlCj4gdGhlIEREVyBBUEkgaW4gb3Jk
ZXIgdG8gdXRpbGl6ZSBhbGwgYXZhaWxhYmxlIFRDRSBidWRnZXQuCj4gCj4gTGludXggb24gdGhl
IG90aGVyIGhhbmQgcmVtb3ZlcyB0aGUgZGVmYXVsdCB3aW5kb3cgYW5kIGNyZWF0ZXMgYQo+IGJp
Z2dlcgo+IG9uZSAod2l0aCBtb3JlIFRDRXMgb3IvYW5kIGEgYmlnZ2VyIHBhZ2Ugc2l6ZSAtIDY0
Sy8yTSkgaW4gYSBiaWQgdG8KPiBtYXAKPiB0aGUgZW50aXJlIFJBTSwgYW5kIGlmIHRoZSBuZXcg
d2luZG93IHNpemUgaXMgc21hbGxlciB0aGFuIHRoYXQgLSBpdAo+IHN0aWxsIHVzZXMgdGhpcyBu
ZXcgYmlnZ2VyIHdpbmRvdy4gVGhlIHJlc3VsdCBpcyB0aGF0IHRoZSBkZWZhdWx0Cj4gd2luZG93
Cj4gaXMgcmVtb3ZlZCBidXQgdGhlICJpYm0sZG1hLXdpbmRvdyIgcHJvcGVydHkgaXMgbm90Lgo+
IAo+IFdoZW4ga2R1bXAgaXMgaW52b2tlZCwgdGhlIGV4aXN0aW5nIGNvZGUgdHJpZXMgcmV1c2lu
ZyB0aGUgZXhpc3RpbmcKPiA2NGJpdAo+IERNQSB3aW5kb3cgd2hpY2ggbG9jYXRpb24gYW5kIHBh
cmFtZXRlcnMgYXJlIHN0b3JlZCBpbiB0aGUgZGV2aWNlCj4gdHJlZSBidXQKPiB0aGlzIGZhaWxz
IGFzIHRoZSBuZXcgcHJvcGVydHkgZG9lcyBub3QgbWFrZSBpdCB0byB0aGUga2R1bXAgZGV2aWNl
Cj4gdHJlZQo+IGJsb2IuIFNvIHRoZSBjb2RlIGZhbGxzIGJhY2sgdG8gdGhlIGRlZmF1bHQgd2lu
ZG93IHdoaWNoIGRvZXMgbm90Cj4gZXhpc3QKPiBhbnltb3JlIGFsdGhvdWdoIHRoZSBkZXZpY2Ug
dHJlZSBzYXlzIHRoYXQgaXQgZG9lcy4gVGhlIHJlc3VsdCBvZgo+IHRoYXQKPiBpcyB0aGF0IFBD
SSBkZXZpY2VzIGJlY29tZSB1bnVzYWJsZSBhbmQgY2Fubm90IGJlIHVzZWQgZm9yIGtkdW1waW5n
Lgo+IAo+IFRoaXMgcHJlc2VydmVzIHRoZSBETUE2NCBhbmQgRElSRUNUNjQgcHJvcGVydGllcyBp
biB0aGUgZGV2aWNlIHRyZWUKPiBibG9iCj4gZm9yIHRoZSBjcmFzaCBrZXJuZWwuIFNpbmNlIHRo
ZSBjcmFzaCBrZXJuZWwgc2V0dXAgaXMgZG9uZSBhZnRlcgo+IGRldmljZQo+IGRyaXZlcnMgYXJl
IGxvYWRlZCBhbmQgcHJvYmVkLCB0aGUgcHJvcGVyIERNQSBjb25maWcgaXMgc3RvcmVkIGF0Cj4g
bGVhc3QKPiBmb3IgYm9vdCB0aW1lIGRldmljZXMuCj4gCj4gQmVjYXVzZSBERFcgd2luZG93IGlz
IG9wdGlvbmFsIGFuZCB0aGUgY29kZSBjb25maWd1cmVzIHRoZSBkZWZhdWx0Cj4gd2luZG93Cj4g
Zmlyc3QsIHRoZSBleGlzdGluZyBjb2RlIGNyZWF0ZXMgYW4gSU9NTVUgdGFibGUgZGVzY3JpcHRv
ciBmb3IKPiB0aGUgbm9uLWV4aXN0aW5nIGRlZmF1bHQgRE1BIHdpbmRvdy4gSXQgaXMgaGFybWxl
c3MgZm9yIGtkdW1wIGFzIGl0Cj4gZG9lcwo+IG5vdCB0b3VjaCB0aGUgYWN0dWFsIHdpbmRvdyAo
b25seSByZWFkcyB3aGF0IGlzIG1hcHBlZCBhbmQgbWFya3MKPiB0aG9zZSBJTwo+IHBhZ2VzIGFz
IHVzZWQpIGJ1dCBpdCBpcyBiYWQgZm9yIGtleGVjIHdoaWNoIGNsZWFycyBpdCB0aGlua2luZyBp
dCBpcwo+IGEgc21hbGxlciBkZWZhdWx0IHdpbmRvdyByYXRoZXIgdGhhbiBhIGJpZ2dlciBERFcg
d2luZG93Lgo+IAo+IFRoaXMgcmVtb3ZlcyB0aGUgImlibSxkbWEtd2luZG93IiBwcm9wZXJ0eSBm
cm9tIHRoZSBkZXZpY2UgdHJlZSBhZnRlcgo+IGEgYmlnZ2VyIHdpbmRvdyBpcyBjcmVhdGVkIGFu
ZCB0aGUgY3Jhc2gga2VybmVsIHNldHVwIHBpY2tzIGl0IHVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhleSBLYXJkYXNoZXZza2l5IDxhaWtAb3psYWJzLnJ1PgoKSGV5IEFsZXhleSwgZ3JlYXQg
ZGVzY3JpcHRpb24gb2YgdGhlIHByb2JsZW0uICBXb3VsZCB0aGlzIG5lZWQgYSBGaXhlczoKdGFn
PwoKPiAtLS0KPiDCoGFyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuY8KgwqDCoMKgwqAg
fCA1MiArKysrKysrKysrKysrKysKPiDCoGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9p
b21tdS5jIHwgODggKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gLS0KPiDCoDIgZmlsZXMgY2hh
bmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMva2V4ZWMvZmlsZV9sb2FkXzY0LmMKPiBiL2FyY2gvcG93ZXJwYy9rZXhl
Yy9maWxlX2xvYWRfNjQuYwo+IGluZGV4IGI0OTgxYjY1MWQ5YS4uYjRiNDg2YjY4YjYzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuYwo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuYwo+IEBAIC0xMDM4LDYgKzEwMzgsNDggQEAgc3Rh
dGljIGludCB1cGRhdGVfY3B1c19ub2RlKHZvaWQgKmZkdCkKPiDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHJldDsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgaW50IGNvcHlfZG1hX3Byb3BlcnR5KHZvaWQg
KmZkdCwgaW50IG5vZGVfb2Zmc2V0LCBjb25zdAo+IHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4sCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBjaGFyICpwcm9wbmFtZSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGNvbnN0IHZvaWQgKnBy
b3AsICpmZHRwcm9wOwo+ICvCoMKgwqDCoMKgwqDCoGludCBsZW4gPSAwLCBmZHRsZW4gPSAwLCBy
ZXQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHByb3AgPSBvZl9nZXRfcHJvcGVydHkoZG4sIHByb3Bu
YW1lLCAmbGVuKTsKPiArwqDCoMKgwqDCoMKgwqBmZHRwcm9wID0gZmR0X2dldHByb3AoZmR0LCBu
b2RlX29mZnNldCwgcHJvcG5hbWUsICZmZHRsZW4pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAo
ZmR0cHJvcCAmJiAhcHJvcCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0g
ZmR0X2RlbHByb3AoZmR0LCBub2RlX29mZnNldCwgcHJvcG5hbWUpOwo+ICvCoMKgwqDCoMKgwqDC
oGVsc2UgaWYgKHByb3ApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGZk
dF9zZXRwcm9wKGZkdCwgbm9kZV9vZmZzZXQsIHByb3BuYW1lLCBwcm9wLAo+IGxlbik7CgpJZiBm
ZHRwcm9wIGFuZCBwcm9wIGFyZSBib3RoIGZhbHNlLCByZXQgaXMgcmV0dXJuZWQgdW5pbml0aWFs
aXNlZC4gCgo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IHVwZGF0ZV9wY2lfbm9kZXModm9pZCAqZmR0LCBjb25zdCBjaGFyICpkbWFwcm9wbmFt
ZSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG47Cj4gK8KgwqDC
oMKgwqDCoMKgaW50IHBjaV9vZmZzZXQsIHJvb3Rfb2Zmc2V0LCByZXQgPSAwOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAoIWZpcm13YXJlX2hhc19mZWF0dXJlKEZXX0ZFQVRVUkVfTFBBUikpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqByb290X29mZnNldCA9IGZkdF9wYXRoX29mZnNldChmZHQsICIvIik7Cj4gK8KgwqDCoMKg
wqDCoMKgZm9yX2VhY2hfbm9kZV93aXRoX3Byb3BlcnR5KGRuLCBkbWFwcm9wbmFtZSkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY2lfb2Zmc2V0ID0gZmR0X3N1Ym5vZGVfb2Zm
c2V0KGZkdCwgcm9vdF9vZmZzZXQsCj4gb2Zfbm9kZV9mdWxsX25hbWUoZG4pKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHBjaV9vZmZzZXQgPCAwKQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBjb3B5X2RtYV9wcm9wZXJ0eShmZHQsIHBj
aV9vZmZzZXQsIGRuLAo+ICJpYm0sZG1hLXdpbmRvdyIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAocmV0IDwgMCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSBjb3B5X2RtYV9wcm9wZXJ0eShmZHQsIHBjaV9vZmZzZXQsIGRuLAo+IGRtYXByb3BuYW1l
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCA8IDApCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKg
wqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK30KPiArCj4gwqAv
KioKPiDCoCAqIHNldHVwX25ld19mZHRfcHBjNjQgLSBVcGRhdGUgdGhlIGZsYXR0ZW5kIGRldmlj
ZS10cmVlIG9mIHRoZQo+IGtlcm5lbAo+IMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBiZWluZyBsb2FkZWQuCj4gQEAgLTEwOTksNiArMTE0MSwxNiBAQCBp
bnQgc2V0dXBfbmV3X2ZkdF9wcGM2NChjb25zdCBzdHJ1Y3Qga2ltYWdlCj4gKmltYWdlLCB2b2lk
ICpmZHQsCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPCAwKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gwqAKPiArI2RlZmluZSBESVJFQ1Q2NF9QUk9QTkFN
RSAibGludXgsZGlyZWN0NjQtZGRyLXdpbmRvdy1pbmZvIgo+ICsjZGVmaW5lIERNQTY0X1BST1BO
QU1FICJsaW51eCxkbWE2NC1kZHItd2luZG93LWluZm8iCgpJbnN0ZWFkIG9mIGhhdmluZyB0aGVz
ZSBkZWZpbmVkIGluIHR3byBkaWZmZXJlbnQgcGxhY2VzLCBjb3VsZCB0aGV5IGJlCm1vdmVkIG91
dCBvZiBpb21tdS5jIGFuZCBpbnRvIGEgaGVhZGVyPyAgVGhvdWdoIHdlIGhhcmRjb2RlIGlibSxk
bWEtCndpbmRvdyBldmVyeXdoZXJlIGFueXdheS4KCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gdXBk
YXRlX3BjaV9ub2RlcyhmZHQsIERJUkVDVDY0X1BST1BOQU1FKTsKPiArwqDCoMKgwqDCoMKgwqBp
ZiAocmV0IDwgMCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHVwZGF0ZV9wY2lfbm9kZXMoZmR0LCBETUE2NF9QUk9Q
TkFNRSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCA8IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgLyogVXBkYXRlIG1l
bW9yeSByZXNlcnZlIG1hcCAqLwo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBnZXRfcmVzZXJ2ZWRf
bWVtb3J5X3Jhbmdlcygmcm1lbSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9pb21tdS5jCj4gYi9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvaW9tbXUuYwo+IGluZGV4IGZiYTY0MzA0ZTg1OS4uYWYz
Yzg3MTY2OGRmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9p
b21tdS5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2lvbW11LmMKPiBA
QCAtNzAwLDYgKzcwMCwzMyBAQCBzdHJ1Y3QgaW9tbXVfdGFibGVfb3BzCj4gaW9tbXVfdGFibGVf
bHBhcl9tdWx0aV9vcHMgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5nZXQgPSB0Y2VfZ2V0X3BTZXJp
ZXNMUAo+IMKgfTsKPiDCoAo+ICsvKgo+ICsgKiBGaW5kIG5lYXJlc3QgaWJtLGRtYS13aW5kb3cg
KGRlZmF1bHQgRE1BIHdpbmRvdykgb3IgZGlyZWN0IERNQQo+IHdpbmRvdyBvcgo+ICsgKiBkeW5h
bWljIDY0Yml0IERNQSB3aW5kb3csIHdhbGtpbmcgdXAgdGhlIGRldmljZSB0cmVlLgo+ICsgKi8K
PiArc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGNpX2RtYV9maW5kKHN0cnVjdCBkZXZpY2Vf
bm9kZSAqZG4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IF9fYmUzMiAqKmRtYV93aW5k
b3cpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBjb25zdCBfX2JlMzIgKmR3ID0gTlVMTDsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgZm9yICggOyBkbiAmJiBQQ0lfRE4oZG4pOyBkbiA9IGRuLT5wYXJlbnQp
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHcgPSBvZl9nZXRfcHJvcGVydHko
ZG4sICJpYm0sZG1hLXdpbmRvdyIsIE5VTEwpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAoZHcpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmIChkbWFfd2luZG93KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpkbWFfd2luZG93ID0gZHc7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZG47Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZHcgPSBvZl9nZXRfcHJvcGVydHkoZG4sIERJUkVDVDY0X1BST1BOQU1FLCBOVUxMKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGR3KQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGRuOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkdyA9IG9mX2dldF9wcm9wZXJ0eShkbiwgRE1BNjRfUFJPUE5B
TUUsIE5VTEwpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZHcpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZG47Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsKPiArfQo+
ICsKPiDCoHN0YXRpYyB2b2lkIHBjaV9kbWFfYnVzX3NldHVwX3BTZXJpZXNMUChzdHJ1Y3QgcGNp
X2J1cyAqYnVzKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW9tbXVfdGFibGUgKnRi
bDsKPiBAQCAtNzEyLDIwICs3MzksMTAgQEAgc3RhdGljIHZvaWQgcGNpX2RtYV9idXNfc2V0dXBf
cFNlcmllc0xQKHN0cnVjdAo+IHBjaV9idXMgKmJ1cykKPiDCoMKgwqDCoMKgwqDCoMKgcHJfZGVi
dWcoInBjaV9kbWFfYnVzX3NldHVwX3BTZXJpZXNMUDogc2V0dGluZyB1cCBidXMKPiAlcE9GXG4i
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRuKTsKPiDCoAo+IC3CoMKgwqDC
oMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICogRmluZCBuZWFyZXN0IGlibSxkbWEtd2luZG93
IChkZWZhdWx0IERNQSB3aW5kb3cpLCB3YWxraW5nCj4gdXAgdGhlCj4gLcKgwqDCoMKgwqDCoMKg
ICogZGV2aWNlIHRyZWUKPiAtwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBmb3Ig
KHBkbiA9IGRuOyBwZG4gIT0gTlVMTDsgcGRuID0gcGRuLT5wYXJlbnQpIHsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX3dpbmRvdyA9IG9mX2dldF9wcm9wZXJ0eShwZG4sICJp
Ym0sZG1hLXdpbmRvdyIsCj4gTlVMTCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmIChkbWFfd2luZG93ICE9IE5VTEwpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiAtwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDC
oMKgcGRuID0gcGNpX2RtYV9maW5kKGRuLCAmZG1hX3dpbmRvdyk7Cj4gwqAKPiAtwqDCoMKgwqDC
oMKgwqBpZiAoZG1hX3dpbmRvdyA9PSBOVUxMKSB7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGRtYV93
aW5kb3cgPT0gTlVMTCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByX2RlYnVn
KCLCoCBubyBpYm0sZG1hLXdpbmRvdyBwcm9wZXJ0eSAhXG4iKTsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBwcGNpID0gUENJX0ROKHBkbik7Cj4gwqAKPiBAQCAtNzM1LDExICs3NTIsMTMgQEAg
c3RhdGljIHZvaWQgcGNpX2RtYV9idXNfc2V0dXBfcFNlcmllc0xQKHN0cnVjdAo+IHBjaV9idXMg
KmJ1cykKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFwcGNpLT50YWJsZV9ncm91cCkgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHBjaS0+dGFibGVfZ3JvdXAgPSBpb21tdV9wc2Vy
aWVzX2FsbG9jX2dyb3VwKHBwY2ktCj4gPnBoYi0+bm9kZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB0YmwgPSBwcGNpLT50YWJsZV9ncm91cC0+dGFibGVzWzBdOwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpb21tdV90YWJsZV9zZXRwYXJtc19scGFyKHBwY2kt
PnBoYiwgcGRuLCB0YmwsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHBjaS0+dGFibGVfZ3JvdXAsIGRtYV93aW5kb3cpOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZG1hX3dpbmRvdykgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW9tbXVfdGFibGVfc2V0
cGFybXNfbHBhcihwcGNpLT5waGIsIHBkbiwKPiB0YmwsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwcGNpLT50YWJsZV9ncm91cCwKPiBkbWFfd2luZG93KTsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWlvbW11X2luaXRfdGFibGUo
dGJsLCBwcGNpLT5waGItPm5vZGUsIDAsIDApKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFuaWMoIkZhaWxlZCB0byBpbml0aWFsaXplIGlvbW11IHRh
YmxlIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAoIWlvbW11X2luaXRfdGFibGUodGJsLCBwcGNpLT5waGItPm5vZGUsCj4gMCwgMCkpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcGFuaWMoIkZhaWxlZCB0byBpbml0aWFsaXplIGlvbW11Cj4gdGFibGUiKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaW9tbXVfcmVnaXN0ZXJfZ3JvdXAocHBjaS0+dGFibGVfZ3JvdXAsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjaV9k
b21haW5fbnIoYnVzKSwgMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcl9k
ZWJ1ZygiwqAgY3JlYXRlZCB0YWJsZTogJXBcbiIsIHBwY2ktPnRhYmxlX2dyb3VwKTsKPiBAQCAt
MTQyOSwxNiArMTQ0OCwyMiBAQCBzdGF0aWMgYm9vbCBlbmFibGVfZGR3KHN0cnVjdCBwY2lfZGV2
ICpkZXYsCj4gc3RydWN0IGRldmljZV9ub2RlICpwZG4pCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHBjaS0+dGFibGVfZ3JvdXAtPnRhYmxlc1sxXSA9IG5ld3RibDsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBLZWVwIGRlZmF1bHQgRE1BIHdp
bmRvdyBzdHJ1Y3QgaWYgcmVtb3ZlZCAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoZGVmYXVsdF93aW5fcmVtb3ZlZCkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgdGJsLT5pdF9zaXplID0gMDsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZmcmVlKHRibC0+aXRfbWFwKTsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRibC0+aXRfbWFwID0g
TlVMTDsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IC0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNldF9pb21tdV90YWJsZV9iYXNlKCZkZXYtPmRldiwgbmV3
dGJsKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGRlZmF1
bHRfd2luX3JlbW92ZWQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHByb3BlcnR5ICpkZWZfd2luOwoKQW5vdGhlciBzZWN0aW9uIG9mIGVuYWJsZV9kZHcoKSBhbHJl
YWR5IGhhcyBhIGRlZmF1bHRfd2luLCBjb3VsZCB0aGF0CnZhcmlhYmxlIGJlIG1hZGUgdG9wLWxl
dmVsIGFuZCBzaGFyZWQ/Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
cGNpX2RuICpwY2kgPSBQQ0lfRE4ocGRuKTsKCmVuYWJsZV9kZHcoKSBhbHJlYWR5IGhhcyB0aGUg
c2FtZSB2YXJpYWJsZSBkZWNsYXJlZC4KIApPdGhlcndpc2UsIExHVE0uCgpSZXZpZXdlZC1ieTog
UnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPgoKCj4gKwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpb21tdV90Y2VfdGFibGVfcHV0KHBjaS0+dGFibGVfZ3JvdXAtPnRh
Ymxlc1swXSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlZl93aW4gPSBvZl9m
aW5kX3Byb3BlcnR5KHBkbiwgImlibSxkbWEtd2luZG93IiwKPiBOVUxMKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGRlZl93aW4pIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mX3JlbW92ZV9wcm9wZXJ0eShwZG4sIGRlZl93
aW4pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2
X2luZm8oJmRldi0+ZGV2LCAiUmVtb3ZlZCBkZWZhdWx0IERNQQo+IHdpbmRvdyBmb3IgJXBPRlxu
IiwgcGRuKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwY2ktPnRhYmxlX2dyb3VwLT50YWJsZXNbMF0gPSBOVUxMOwo+
ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9jaygmZG1hX3dp
bl9saXN0X2xvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqBsaXN0X2FkZCgmd2luZG93LT5saXN0LCAm
ZG1hX3dpbl9saXN0KTsKPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2soJmRtYV93aW5fbGlz
dF9sb2NrKTsKPiBAQCAtMTUwMywxMyArMTUyOCw3IEBAIHN0YXRpYyB2b2lkIHBjaV9kbWFfZGV2
X3NldHVwX3BTZXJpZXNMUChzdHJ1Y3QKPiBwY2lfZGV2ICpkZXYpCj4gwqDCoMKgwqDCoMKgwqDC
oGRuID0gcGNpX2RldmljZV90b19PRl9ub2RlKGRldik7Cj4gwqDCoMKgwqDCoMKgwqDCoHByX2Rl
YnVnKCLCoCBub2RlIGlzICVwT0ZcbiIsIGRuKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGZvciAo
cGRuID0gZG47IHBkbiAmJiBQQ0lfRE4ocGRuKSAmJiAhUENJX0ROKHBkbiktCj4gPnRhYmxlX2dy
b3VwOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBkbiA9IHBkbi0+cGFyZW50KSB7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV93aW5kb3cgPSBvZl9nZXRfcHJvcGVydHko
cGRuLCAiaWJtLGRtYS13aW5kb3ciLAo+IE5VTEwpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAoZG1hX3dpbmRvdykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiAtCj4gK8KgwqDCoMKg
wqDCoMKgcGRuID0gcGNpX2RtYV9maW5kKGRuLCAmZG1hX3dpbmRvdyk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmICghcGRuIHx8ICFQQ0lfRE4ocGRuKSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcHJpbnRrKEtFUk5fV0FSTklORyAicGNpX2RtYV9kZXZfc2V0dXBfcFNlcmllc0xQ
OiAiCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIm5vIERN
QSB3aW5kb3cgZm91bmQgZm9yIHBjaSBkZXY9JXMKPiBkbj0lcE9GXG4iLAo+IEBAIC0xNTQwLDcg
KzE1NTksNiBAQCBzdGF0aWMgdm9pZCBwY2lfZG1hX2Rldl9zZXR1cF9wU2VyaWVzTFAoc3RydWN0
Cj4gcGNpX2RldiAqZGV2KQo+IMKgc3RhdGljIGJvb2wgaW9tbXVfYnlwYXNzX3N1cHBvcnRlZF9w
U2VyaWVzTFAoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gdTY0IGRtYV9tYXNrKQo+IMKgewo+IMKg
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKmRuID0gcGNpX2RldmljZV90b19PRl9u
b2RlKHBkZXYpLCAqcGRuOwo+IC3CoMKgwqDCoMKgwqDCoGNvbnN0IF9fYmUzMiAqZG1hX3dpbmRv
dyA9IE5VTEw7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogb25seSBhdHRlbXB0IHRvIHVzZSBh
IG5ldyB3aW5kb3cgaWYgNjQtYml0IERNQSBpcwo+IHJlcXVlc3RlZCAqLwo+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoZG1hX21hc2sgPCBETUFfQklUX01BU0soNjQpKQo+IEBAIC0xNTU0LDEzICsxNTcy
LDcgQEAgc3RhdGljIGJvb2wKPiBpb21tdV9ieXBhc3Nfc3VwcG9ydGVkX3BTZXJpZXNMUChzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdTY0IGRtYV9tYXNrKQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBzZWFy
Y2ggdXB3YXJkcyBpbiB0aGUgdHJlZSB1bnRpbCB3ZSBlaXRoZXIgaGl0IGEgZG1hLQo+IHdpbmRv
dwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBwcm9wZXJ0eSwgT1IgZmluZCBhIHBhcmVudCB3aXRoIGEg
dGFibGUgYWxyZWFkeSBhbGxvY2F0ZWQuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDC
oMKgwqDCoGZvciAocGRuID0gZG47IHBkbiAmJiBQQ0lfRE4ocGRuKSAmJiAhUENJX0ROKHBkbikt
Cj4gPnRhYmxlX2dyb3VwOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGRuID0gcGRuLT5wYXJlbnQpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZG1hX3dpbmRvdyA9IG9mX2dldF9wcm9wZXJ0eShwZG4sICJpYm0sZG1hLXdpbmRvdyIs
Cj4gTlVMTCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChkbWFfd2luZG93
KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gLcKgwqDCoMKgwqDCoMKgfQo+IC0KPiArwqDCoMKgwqDCoMKgwqBwZG4gPSBwY2lfZG1hX2Zp
bmQoZG4sIE5VTEwpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocGRuICYmIFBDSV9ETihwZG4pKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVuYWJsZV9kZHcocGRldiwg
cGRuKTsKPiDCoAoK

