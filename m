Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE860992E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 06:34:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwj010BXyz3cBv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 15:34:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=PpJQRu9b;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QSRUH/h8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=PpJQRu9b;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QSRUH/h8;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwhz30MQJz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 15:33:34 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4FA9E5800DE;
	Mon, 24 Oct 2022 00:33:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 24 Oct 2022 00:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666586011; x=
	1666593211; bh=GPE7rK5ZoLarbQEJTIQYWsXD2B4K3gZrdcp5Xh8TWXw=; b=P
	pJQRu9bBLsvUGFpFVIcsTaHHs09Cj5XnFjmS9UqgTvQb0unSN+HLTzaSTGS7r6QI
	Jc6lWP7jsSAmBjLhZ4xVF7aYP3XowmoBg3FFRvj5vIxX1ABv62JBlGoSkblf+AvC
	vEwhH9OcCujmxV7puvBOmxorkMH0k/Mo1xcEy1FkYqRFLteI6ibqDKLizSOHWfP9
	5qBaiYMJIWvPQXWlRAGix4isqFaSVvWm8zuV8Qlz8V7EU3F0/ZOOaaZZWpBF4OUa
	GIN/gcjQmVCBjvraxdkMm10OT2nkIN73rmInoyFUmeqzHLe4qgf/rU5CdTknA0E5
	eSXWXyoFmaPXbipvHtOQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666586011; x=
	1666593211; bh=GPE7rK5ZoLarbQEJTIQYWsXD2B4K3gZrdcp5Xh8TWXw=; b=Q
	SRUH/h8soDTSSDcMEXMiYmiZ2BhRxlHv4wW1C4mq2LGPPxZuPV2v+dDHSjSKjedI
	SUqlqRHb66aOdCc6hKA2OusDl+m+MTUfkA6o40GqXfTE5A/TKI+8flzoIGVv6dNG
	IfY9O+n43KW1gHXCt+HwYRubm6S9X7ibXYk8C9Bn7zeR2F3tL6RuseViWtMY7KcM
	Gogl5385WgBpSPM3jH1YqizxDq0XLlGLUju865L9O/pEFmTmhNBm19wvmKbnaBCa
	1X6GvxuIjbGowNZpYT8GkbSg/zAYPk30eZjdPNvmd+cFXSAenrySjUzOXEIyZ+Uf
	69WPPkFAaeFSvXqcWA3lw==
X-ME-Sender: <xms:kRVWY34fHL-14goDpbfdUyGMBhRox1JphwrfNLf3FzvonE0rETqqvQ>
    <xme:kRVWY864YjcfLrKfAsVddmQ6v-k4hjcQFU1M3RFJIE1GkpxZWoYXB-EB6ul2jmzMX
    MNiEXqHOlt7JIXY0Q>
X-ME-Received: <xmr:kRVWY-cbWkAenccOPhhqIjVwetadGQENeht96aermFRGThCW7s6FVLBF7CCN2er88ru3xAnSZqS22wseH46T8DlsFw6x-eKM4u-KRmnpV0sIxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthgsredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepffeihfduhefgteevvddvhfekfeeg
    hefhleduffejtdevjeelhfeileethedvgfegnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehr
    uhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:kRVWY4LXRqsKEDoiywlXpYfZfOx6oy8cgCEspKqIyIpeDUk5a9dEvw>
    <xmx:kRVWY7JS5Db4oeEVi6NZnOfWRUwa4KwJ46OVlgwIt4M33wRYXLvDrw>
    <xmx:kRVWYxy-gZrtLreGUkUvztddUXeQvRBiy36C0GH3hD3_cg-DNNFe_A>
    <xmx:mxVWY2n3C4xrlZmC8OJ-qT8yZbMAZVJyorHjbLtOQDzWTl1_Mx7AQw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 00:33:17 -0400 (EDT)
Message-ID: <6426e8cf8d3bb2fff1403038ef627548f07cef32.camel@russell.cc>
Subject: Re: [PATCH] powerpc: replace ternary operator with min()
From: Russell Currey <ruscur@russell.cc>
To: KaiLong Wang <wangkailong@jari.cn>, mpe@ellerman.id.au,
 npiggin@gmail.com,  christophe.leroy@csgroup.eu, farosas@linux.ibm.com,
 mirq-linux@rere.qmqm.pl,  dmitry.osipenko@collabora.com,
 kda@linux-powerpc.org,  naveen.n.rao@linux.vnet.ibm.com
Date: Mon, 24 Oct 2022 15:33:15 +1100
In-Reply-To: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
References: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU3VuLCAyMDIyLTEwLTIzIGF0IDIwOjQ0ICswODAwLCBLYWlMb25nIFdhbmcgd3JvdGU6Cj4g
Rml4IHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgo+IAo+IGFyY2gvcG93ZXJwYy94
bW9uL3htb24uYzoyOTg3OiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtaW4oKQo+IGFyY2gvcG93
ZXJwYy94bW9uL3htb24uYzoyNTgzOiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtaW4oKQo+IAo+
IFNpZ25lZC1vZmYtYnk6IEthaUxvbmcgV2FuZyA8d2FuZ2thaWxvbmdAamFyaS5jbj4KCkhlbGxv
LAoKVGhpcyBmYWlscyB0byBjb21waWxlIG9uIHNvbWUgcGxhdGZvcm1zL2NvbXBpbGVycyBzaW5j
ZSBuIGlzIGEgbG9uZyBhbmQKMTYgaXMgYW4gaW50LCBleHBhbmRpbmcgdG86CgpyID0gX19idWls
dGluX2Nob29zZV9leHByKAoJKCghIShzaXplb2YoKHR5cGVvZihuKSAqKTEgPT0gKHR5cGVvZigx
NikgKikxKSkpICYmCgkgKChzaXplb2YoaW50KSA9PQoJICAgc2l6ZW9mKCooOCA/ICgodm9pZCAq
KSgobG9uZykobikqMGwpKSA6IChpbnQgKik4KSkpICYmCgkgIChzaXplb2YoaW50KSA9PQoJICAg
c2l6ZW9mKCooOCA/ICgodm9pZCAqKSgobG9uZykoMTYpICogMGwpKSA6CgkJCShpbnQgKik4KSkp
KSksCgkoKG4pIDwgKDE2KSA/IChuKSA6ICgxNikpLCAoewoJCXR5cGVvZihuKSBfX1VOSVFVRV9J
RF9fX3gwID0gKG4pOwoJCXR5cGVvZigxNikgX19VTklRVUVfSURfX195MSA9ICgxNik7CgkJKChf
X1VOSVFVRV9JRF9fX3gwKSA8IChfX1VOSVFVRV9JRF9fX3kxKSA/CgkJCSAoX19VTklRVUVfSURf
X194MCkgOgoJCQkgKF9fVU5JUVVFX0lEX19feTEpKTsKCX0pKTsKCkhlcmUncyB0aGUgZnVsbCBi
dWlsZCBmYWlsdXJlIGFzIGZvdW5kIGJ5IHNub3dwYXRjaDoKaHR0cHM6Ly9naXRodWIuY29tL3J1
c2N1ci9saW51eC1jaS9hY3Rpb25zL3J1bnMvMzMwODg4MDU2Mi9qb2JzLzU0NjE1NzkwNDgjc3Rl
cDo0Ojg5CgpZb3Ugc2hvdWxkIHVzZSBtaW5fdChsb25nLCBuLCAxNikgaW5zdGVhZC4KCi0gUnVz
c2VsbAoKPiAtLS0KPiDCoGFyY2gvcG93ZXJwYy94bW9uL3htb24uYyB8IDQgKystLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jIGIvYXJjaC9wb3dlcnBjL3htb24veG1vbi5j
Cj4gaW5kZXggZjUxYzg4MmJmOTAyLi5hNzc1MWNkMmNjOWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9w
b3dlcnBjL3htb24veG1vbi5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jCj4gQEAg
LTI1ODAsNyArMjU4MCw3IEBAIHN0YXRpYyB2b2lkIHhtb25fcmF3ZHVtcCAodW5zaWduZWQgbG9u
ZyBhZHJzLAo+IGxvbmcgbmR1bXApCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGNoYXIgdGVt
cFsxNl07Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0gbmR1bXA7IG4gPiAwOykgewo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByID0gbiA8IDE2PyBuOiAxNjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgciA9IG1pbihuLCAxNik7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBuciA9IG1yZWFkKGFkcnMsIHRlbXAsIHIpOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRycyArPSBucjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZvciAobSA9IDA7IG0gPCByOyArK20pIHsKPiBAQCAtMjk4NCw3ICsyOTg0
LDcgQEAgcHJkdW1wKHVuc2lnbmVkIGxvbmcgYWRycywgbG9uZyBuZHVtcCkKPiDCoMKgwqDCoMKg
wqDCoMKgZm9yIChuID0gbmR1bXA7IG4gPiAwOykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcHJpbnRmKFJFRywgYWRycyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwdXRjaGFyKCcgJyk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHIgPSBu
IDwgMTY/IG46IDE2Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByID0gbWluKG4s
IDE2KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG5yID0gbXJlYWQoYWRycywg
dGVtcCwgcik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZHJzICs9IG5yOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChtID0gMDsgbSA8IHI7ICsrbSkg
ewoK

