Return-Path: <linuxppc-dev+bounces-2150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3599B386
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 13:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQh7x2Fgqz2yNB;
	Sat, 12 Oct 2024 22:28:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=15.184.82.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728732509;
	cv=none; b=Yp3n6PsOOkWUCZVaILhnRpGF28xj6kAtkokBJglOhaAzzERCnk6TkPSJWZDOuRwQrfale6VuIhXPIt08KfTeKD7TtHA9LazEOvx4MX8tXeJcOWfcoEKIqOYkqRrbooDNulzkVboY66jEchk51z8gvxlzO7uJ13Xs405WpP3aZxnuT2+5jklpgAzAEUJHE6jKr3qzWp4Rh0tt8UtuPi98balRrzPWhT5RQnSbTfkW+fpEgBgYyD9p63p09kKed4gU0h1xIgd6AsJ+wt8p7AdcBjmo/wdzkkoKty3FSTPTGMFvJADJha8o116RqgoiSYOfN4beQJQMRWYCXll8J4Q1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728732509; c=relaxed/relaxed;
	bh=20E3RnzZYPV/S+pBCHsi097BSoVWXSudiShioFAA1pc=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=E3LKaXwI6a8/fK8pH4pF1OGCUdo92yg1syIYaVTioFUw30FKcFU1VBRFVpTh+u+E5NpdzdRPpR580SeJoIY6oej1xyqTdTRfrHhmmPBJflh1YQhj4kLKlv3unS0YiS39oYj5AGZh52xdhMQxjE1lJDWtxI1nrX9KD2UJq2AW7GM9FBu4QCf7F0+9JF+CefbJQczrjStmK8e4f9b2XhcOIu05D/0FeKQylJ0B03yCrBn0RZQJOojFoGpY1UkrDADT5ncqboyFNYSUYQA/hlvT4Ma0KkPJpvGERk89+sok/K7whAiyQeijvMbUqMDh7wrphDL3lJoxI7JlezJxrq0xrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQh7t6ZC4z2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 22:28:15 +1100 (AEDT)
X-QQ-GoodBg: 2
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 0040000000000060
X-QQ-FEAT: D4aqtcRDiqQpBpTnjIJt3/f21w9WO3enREO5ZSgO7MU=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: BCwdjUuszVhG1D+MouUUgkkK0dhZP2LZRlIN/WeR4MA=
X-Originating-IP: 180.171.169.129
X-QQ-STYLE: 
X-QQ-mid: t6gz5a-0t1728732445t752831
From: "=?utf-8?B?6Jme6ZmG6ZOt?=" <luming.yu@shingroup.cn>
To: "=?utf-8?B?Q2hyaXN0b3BoZSBMZXJveQ==?=" <christophe.leroy@csgroup.eu>, "=?utf-8?B?bGludXhwcGMtZGV2?=" <linuxppc-dev@lists.ozlabs.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bXBl?=" <mpe@ellerman.id.au>, "=?utf-8?B?bnBpZ2dpbg==?=" <npiggin@gmail.com>, "=?utf-8?B?amlhbG9uZy55YW5n?=" <jialong.yang@shingroup.cn>, "=?utf-8?B?bHVtaW5nLnl1?=" <luming.yu@gmail.com>
Subject: Re: [PATCH 5/7] powerpc/entry: add irqentry_state and generic entry support
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 12 Oct 2024 19:27:25 +0800
X-Priority: 3
Message-ID: <tencent_1CDC5604234FC3813CF04D29@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
	<5ADB50C5F6678977+20241012035621.1245-7-luming.yu@shingroup.cn>
	<d2040f5b-008b-4c45-9cbc-9ea5c25c9149@csgroup.eu>
In-Reply-To: <d2040f5b-008b-4c45-9cbc-9ea5c25c9149@csgroup.eu>
X-QQ-ReplyHash: 155610352
X-BIZMAIL-ID: 9413037703563935359
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Sat, 12 Oct 2024 19:27:26 +0800 (CST)
Feedback-ID: t:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-0
X-QQ-XMAILINFO: NonMLXQbqcUbtiVKu+mJqh/VnX/Z0YGIqqgBUtXLuqq3J+I+TC0bH4f5
	Ajp95y3qyr3j5Ie92G945AH8Z/L8010LGwny2vMTwX0CiaOOQmg6I45hNlXXrG351tv/KtK
	Ol+ClgejI5eVQMufOWzMSZF65zGMXMcErPT7rSNFJqNZY8cBe+lHBiA6rHCijldOrW7end/
	Y2lk8bQdPmrwCmfdeyZJ+nByYytlFv3EjaGJDlZgniXKAtkCBQfYOlUt3ZSp5mIrGY4rI/L
	FftEHR8l/ouNotjnMbO5JzYdeuhCBWTota2hb5CqDGkT0VghbivvreiXwdn4tNtTD3i/1Hv
	SE4FZ5eVqkzH9GB4sC5YTg7NcKA4+P7D62USsn6zcCViKOuVZR+mMYbfFGaEjqygr+bLRLw
	eJ0K1xk4QSveqaWciwTfZthENpHDee/KyGWLyCxm1z5f729h4ch9c0NowK8ad+yRs8FR/Jh
	rJ4g+Gxgykmoo8M88luiNGy0w5Xfr1k9tt0LYK9/vYNokvwh8tBhttswekpgwnR0CLKhnrN
	qsnd93zdOB4TtS5XliJ5bgKdI6ttwZcjcOhfuANllWrWCmPmJuhFZv3CTGRPyWxMg4MfsIs
	Ac2isHN/LmTQ3FJiWWPpatnSKc21drKo2akzU9KHEt+3ACF38R+JslcoWTUI8B/yO20NNhp
	ewfdw6q/DEdn+Yi1gczNgLuswjXeUyKGaq5TmTBoeCAzTlhmjEUK8y2X4RmKcTFkJF2aInT
	Xy+5FulcEZOdaCxnW1k+zH828ElmCqIgVfkdD333DfIW0CgX/nK+E4Z66CJ+rnhsWSI7xMU
	gsVlpNy/cZKfPwxMcwv68HPXGWDmEYNHD3r6q/pHD9thAYp//RdmBD6L6ScnJivzVolToo+
	1flxBqIruiuDHiy1r/svlqszmAOWl31NbKhTtvqIpBzM5HyKZfOVPgscRAYVilU/
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

TGUgMTIvMTAvMjAyNCDDoCAwNTo1NiwgTHVtaW5nIFl1IGEgw6ljcml0IDoNCj4+IGdlbmVy
aWMgaXJxIGVudHJ5IHN1cHBvcnQgdmlhIGdlbmVyaWMgaXJxZW50cnkgaXMgYWRkZWQgZm9y
IHBvd2VycGMuDQo+PiBUaGVyZSBtYXkgYmUgZHVwbGNpYXRlIGNhbGxzIGFuZCBtaXNzaW5n
IGNhbGxiYWNrcyByZXF1aXJlcyBmdXJ0aGVyDQo+PiB3b3JrLg0KPj4gDQo+PiBTaWduZWQt
b2ZmLWJ5OiBMdW1pbmcgWXUgPGx1bWluZy55dUBzaGluZ3JvdXAuY24+DQo+DQo+VGhpcyBw
YXRjaCBkb2Vzbid0IGFwcGx5Lg0KDQpzb3JyeSB0byBoZWFyIHRoYXQuIDotKA0KIA0KdGhl
IHBwYyBsaW51eC1jaSBnaXRodWIgd29ya2Zsb3cgcmVzdWx0Og0KaHR0cHM6Ly9naXRodWIu
Y29tL2x1bWluZ3l1MjAyNC9saW51eC1jaS9hY3Rpb25zL3J1bnMvMTEyOTM2MzA3NDMNCj4N
Cj5BcHBseWluZzogcG93ZXJwYy9lbnRyeTogYWRkIGlycWVudHJ5X3N0YXRlIGFuZCBnZW5l
cmljIGVudHJ5IHN1cHBvcnQNCj5lcnJvcjogcGF0Y2ggZmFpbGVkOiBhcmNoL3Bvd2VycGMv
a2VybmVsL2ludGVycnVwdC5jOjMNCj5lcnJvcjogYXJjaC9wb3dlcnBjL2tlcm5lbC9pbnRl
cnJ1cHQuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkNCj5QYXRjaCBmYWlsZWQgYXQgMDAwNSBw
b3dlcnBjL2VudHJ5OiBhZGQgaXJxZW50cnlfc3RhdGUgYW5kIGdlbmVyaWMgZW50cnkgDQo+
c3VwcG9ydA0KPg0KPkkgdHJpZWQgb24gdjYuMTEsIHY2LjEyLXJjMiBhbmQgbmV4dC0yMDI0
MTAxMQ0KdjYuNy1yYzIgaXMgdGhlIGJyYW5jaCBvbiB0b3Agb2Ygd2hpY2ggSSBkaWQgZ2l0
IHNlbmQtZW1haWwgLTcuDQpwbGVhc2UgdHJ5IGl0IHN5bmMgd2l0aCBsaW51eCBjaSBodHRw
czovL2dpdGh1Yi5jb20vbGludXhwcGMvbGludXgtY2kvY29tcGFyZS9tZXJnZS4uLmx1bWlu
Z3l1MjAyNDpsaW51eC1jaTptZXJnZQ0KT3IgSSBjYW4gZG8gYSByZWJhc2UgYWdhaW5zdCAg
djYuMTItcmMyIGxhdGVyLg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9lbnRyeS1jb21tb24uaCB8IDMyICsrKysrKysrKysrKysrKysNCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL2ludGVycnVwdC5jICAgICAgICAgfCA1MSArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgIHwg
IDcgKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbC5jICAgICAgICAgICB8
ICAyIC0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDQzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9l
bnRyeS1jb21tb24uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24u
aA0KPiBpbmRleCA1MWYxZWI3Njc2OTYuLmZhYTgyOWUxNWI1ZCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaA0KPiBAQCAtMyw2ICszLDcgQEAN
Cj4gICAjZGVmaW5lIEFSQ0hfUE9XRVJQQ19FTlRSWV9DT01NT05fSA0KPiAgIA0KPiAgICNp
bmNsdWRlIDxsaW51eC91c2VyLXJldHVybi1ub3RpZmllci5oPg0KPiArI2luY2x1ZGUgPGFz
bS9zd2l0Y2hfdG8uaD4NCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9leGl0
X3RvX3VzZXJfbW9kZV9wcmVwYXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzLA0KPiAgIAkJCQkJ
CSAgdW5zaWduZWQgbG9uZyB0aV93b3JrKQ0KPiBAQCAtMTMsNCArMTQsMzUgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZShzdHJ1Y3QgcHRf
cmVncyAqcmVncywNCj4gICANCj4gICAjZGVmaW5lIGFyY2hfZXhpdF90b191c2VyX21vZGVf
cHJlcGFyZSBhcmNoX2V4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUNCj4gICANCj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBhcmNoX2V4aXRfdG9fdXNlcl9tb2RlX3dvcmsoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MsDQo+ICsJCQkJCQl1bnNpZ25lZCBsb25nIHRpX3dvcmspDQo+ICt7DQo+ICsN
Cj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDX0JPT0szU182NCkgJiYgSVNfRU5BQkxF
RChDT05GSUdfUFBDX0ZQVSkpIHsNCj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQ19U
UkFOU0FDVElPTkFMX01FTSkgJiYNCj4gKwkJCQl1bmxpa2VseSgodGlfd29yayAmIF9USUZf
UkVTVE9SRV9UTSkpKSB7DQo+ICsJCQlyZXN0b3JlX3RtX3N0YXRlKHJlZ3MpOw0KPiArCQl9
IGVsc2Ugew0KPiArCQkJdW5zaWduZWQgbG9uZyBtYXRoZmxhZ3MgPSBNU1JfRlA7DQo+ICsN
Cj4gKwkJCWlmIChjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9WU1gpKQ0KPiArCQkJCW1hdGhm
bGFncyB8PSBNU1JfVkVDIHwgTVNSX1ZTWDsNCj4gKwkJCWVsc2UgaWYgKGNwdV9oYXNfZmVh
dHVyZShDUFVfRlRSX0FMVElWRUMpKQ0KPiArCQkJCW1hdGhmbGFncyB8PSBNU1JfVkVDOw0K
PiArDQo+ICsJCQkvKg0KPiArCQkJICogSWYgdXNlcnNwYWNlIE1TUiBoYXMgYWxsIGF2YWls
YWJsZSBGUCBiaXRzIHNldCwNCj4gKwkJCSAqIHRoZW4gdGhleSBhcmUgbGl2ZSBhbmQgbm8g
bmVlZCB0byByZXN0b3JlLiBJZiBub3QsDQo+ICsJCQkgKiBpdCBtZWFucyB0aGUgcmVncyB3
ZXJlIGdpdmVuIHVwIGFuZCByZXN0b3JlX21hdGgNCj4gKwkJCSAqIG1heSBkZWNpZGUgdG8g
cmVzdG9yZSB0aGVtICh0byBhdm9pZCB0YWtpbmcgYW4gRlANCj4gKwkJCSAqIGZhdWx0KS4N
Cj4gKwkJCSAqLw0KPiArCQkJaWYgKChyZWdzLT5tc3IgJiBtYXRoZmxhZ3MpICE9IG1hdGhm
bGFncykNCj4gKwkJCQlyZXN0b3JlX21hdGgocmVncyk7DQo+ICsJCX0NCj4gKwl9DQo+ICt9
DQo+ICsNCj4gKyNkZWZpbmUgYXJjaF9leGl0X3RvX3VzZXJfbW9kZV93b3JrIGFyY2hfZXhp
dF90b191c2VyX21vZGVfd29yaw0KPiArDQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9p
bnRlcnJ1cHQuYw0KPiBpbmRleCA2MDliYTQ4MDM0ZGUuLjQyYWY5MjE3MTM2ZCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9pbnRlcnJ1cHQuYw0KPiArKysgYi9hcmNo
L3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICNp
bmNsdWRlIDxsaW51eC9jb250ZXh0X3RyYWNraW5nLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4
L2Vyci5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4NCj4gKyNpbmNsdWRlIDxs
aW51eC9lbnRyeS1jb21tb24uaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQvZGVidWcu
aD4gLyogZm9yIHNob3dfcmVncyAqLw0KPiAgIA0KPiAgICNpbmNsdWRlIDxhc20va3VwLmg+
DQo+IEBAIC0xODMsNDcgKzE4NCwxMSBAQCBpbnRlcnJ1cHRfZXhpdF91c2VyX3ByZXBhcmVf
bWFpbih1bnNpZ25lZCBsb25nIHJldCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ICAgDQo+
ICAgYWdhaW46DQo+ICAgCXRpX2ZsYWdzID0gcmVhZF90aHJlYWRfZmxhZ3MoKTsNCj4gLQl3
aGlsZSAodW5saWtlbHkodGlfZmxhZ3MgJiAoX1RJRl9VU0VSX1dPUktfTUFTSyAmIH5fVElG
X1JFU1RPUkVfVE0pKSkgew0KPiAtCQlsb2NhbF9pcnFfZW5hYmxlKCk7DQo+IC0JCWlmICh0
aV9mbGFncyAmIF9USUZfTkVFRF9SRVNDSEVEKSB7DQo+IC0JCQlzY2hlZHVsZSgpOw0KPiAt
CQl9IGVsc2Ugew0KPiAtCQkJLyoNCj4gLQkJCSAqIFNJR1BFTkRJTkcgbXVzdCByZXN0b3Jl
IHNpZ25hbCBoYW5kbGVyIGZ1bmN0aW9uDQo+IC0JCQkgKiBhcmd1bWVudCBHUFJzLCBhbmQg
c29tZSBub24tdm9sYXRpbGVzIChlLmcuLCByMSkuDQo+IC0JCQkgKiBSZXN0b3JlIGFsbCBm
b3Igbm93LiBUaGlzIGNvdWxkIGJlIG1hZGUgbGlnaHRlci4NCj4gLQkJCSAqLw0KPiAtCQkJ
aWYgKHRpX2ZsYWdzICYgX1RJRl9TSUdQRU5ESU5HKQ0KPiAtCQkJCXJldCB8PSBfVElGX1JF
U1RPUkVBTEw7DQo+IC0JCQlkb19ub3RpZnlfcmVzdW1lKHJlZ3MsIHRpX2ZsYWdzKTsNCj4g
LQkJfQ0KPiAtCQlsb2NhbF9pcnFfZGlzYWJsZSgpOw0KPiAtCQl0aV9mbGFncyA9IHJlYWRf
dGhyZWFkX2ZsYWdzKCk7DQo+IC0JfQ0KPiAgIA0KPiAtCWlmIChJU19FTkFCTEVEKENPTkZJ
R19QUENfQk9PSzNTXzY0KSAmJiBJU19FTkFCTEVEKENPTkZJR19QUENfRlBVKSkgew0KPiAt
CQlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDX1RSQU5TQUNUSU9OQUxfTUVNKSAmJg0KPiAt
CQkJCXVubGlrZWx5KCh0aV9mbGFncyAmIF9USUZfUkVTVE9SRV9UTSkpKSB7DQo+IC0JCQly
ZXN0b3JlX3RtX3N0YXRlKHJlZ3MpOw0KPiAtCQl9IGVsc2Ugew0KPiAtCQkJdW5zaWduZWQg
bG9uZyBtYXRoZmxhZ3MgPSBNU1JfRlA7DQo+IC0NCj4gLQkJCWlmIChjcHVfaGFzX2ZlYXR1
cmUoQ1BVX0ZUUl9WU1gpKQ0KPiAtCQkJCW1hdGhmbGFncyB8PSBNU1JfVkVDIHwgTVNSX1ZT
WDsNCj4gLQkJCWVsc2UgaWYgKGNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX0FMVElWRUMpKQ0K
PiAtCQkJCW1hdGhmbGFncyB8PSBNU1JfVkVDOw0KPiAtDQo+IC0JCQkvKg0KPiAtCQkJICog
SWYgdXNlcnNwYWNlIE1TUiBoYXMgYWxsIGF2YWlsYWJsZSBGUCBiaXRzIHNldCwNCj4gLQkJ
CSAqIHRoZW4gdGhleSBhcmUgbGl2ZSBhbmQgbm8gbmVlZCB0byByZXN0b3JlLiBJZiBub3Qs
DQo+IC0JCQkgKiBpdCBtZWFucyB0aGUgcmVncyB3ZXJlIGdpdmVuIHVwIGFuZCByZXN0b3Jl
X21hdGgNCj4gLQkJCSAqIG1heSBkZWNpZGUgdG8gcmVzdG9yZSB0aGVtICh0byBhdm9pZCB0
YWtpbmcgYW4gRlANCj4gLQkJCSAqIGZhdWx0KS4NCj4gLQkJCSAqLw0KPiAtCQkJaWYgKChy
ZWdzLT5tc3IgJiBtYXRoZmxhZ3MpICE9IG1hdGhmbGFncykNCj4gLQkJCQlyZXN0b3JlX21h
dGgocmVncyk7DQo+IC0JCX0NCj4gLQl9DQo+ICsJaWYgKHRpX2ZsYWdzICYgX1RJRl9TSUdQ
RU5ESU5HKQ0KPiArCQlyZXQgfD0gX1RJRl9SRVNUT1JFQUxMOw0KPiArCWlmICh1bmxpa2Vs
eSh0aV9mbGFncyAmIEVYSVRfVE9fVVNFUl9NT0RFX1dPUkspKQ0KPiArCQl0aV9mbGFncyA9
IGV4aXRfdG9fdXNlcl9tb2RlX2xvb3AocmVncywgdGlfZmxhZ3MpOw0KPiAgIA0KPiAgIAlj
aGVja19yZXR1cm5fcmVnc192YWxpZChyZWdzKTsNCj4gICANCj4gQEAgLTI5NywxMSArMjYy
LDE1IEBAIG5vdHJhY2UgdW5zaWduZWQgbG9uZyBzeXNjYWxsX2V4aXRfcHJlcGFyZSh1bnNp
Z25lZCBsb25nIHIzLA0KPiAgIAl9DQo+ICAgDQo+ICAgCWxvY2FsX2lycV9kaXNhYmxlKCk7
DQo+IC0JcmV0ID0gaW50ZXJydXB0X2V4aXRfdXNlcl9wcmVwYXJlX21haW4ocmV0LCByZWdz
KTsNCj4gKwlpZiAodGlfZmxhZ3MgJiBfVElGX1JFU1RPUkVBTEwpDQo+ICsJCXJldCB8PSBf
VElGX1JFU1RPUkVBTEw7DQo+ICAgDQo+ICsJaWYgKHRpX2ZsYWdzICYgX1RJRl9TSUdQRU5E
SU5HKQ0KPiArCQlyZXQgfD0gX1RJRl9SRVNUT1JFQUxMOw0KPiAgICNpZmRlZiBDT05GSUdf
UFBDNjQNCj4gICAJcmVncy0+ZXhpdF9yZXN1bHQgPSByZXQ7DQo+ICAgI2VuZGlmDQo+ICsJ
c3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsNCj4gICANCj4gICAJcmV0dXJuIHJl
dDsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5j
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWwuYw0KPiBpbmRleCBhYTE3ZTYyZjM3NTQu
LmRhMjFlN2ZlZjQ2YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWdu
YWwuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5jDQo+IEBAIC0xMSw2
ICsxMSw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L3Vwcm9iZXMuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgva2V5Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbnRleHRfdHJhY2tpbmcu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9lbnRyeS1jb21tb24uaD4NCj4gICAjaW5jbHVkZSA8
bGludXgvbGl2ZXBhdGNoLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+DQo+
ICAgI2luY2x1ZGUgPGFzbS9od19icmVha3BvaW50Lmg+DQo+IEBAIC0zNjgsMyArMzY5LDkg
QEAgdm9pZCBzaWduYWxfZmF1bHQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBw
dF9yZWdzICpyZWdzLA0KPiAgIAkJcHJpbnRrX3JhdGVsaW1pdGVkKHJlZ3MtPm1zciAmIE1T
Ul82NEJJVCA/IGZtNjQgOiBmbTMyLCB0c2stPmNvbW0sDQo+ICAgCQkJCSAgIHRhc2tfcGlk
X25yKHRzayksIHdoZXJlLCBwdHIsIHJlZ3MtPm5pcCwgcmVncy0+bGluayk7DQo+ICAgfQ0K
PiArDQo+ICt2b2lkIGFyY2hfZG9fc2lnbmFsX29yX3Jlc3RhcnQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpDQo+ICt7DQo+ICsJQlVHX09OKHJlZ3MgIT0gY3VycmVudC0+dGhyZWFkLnJlZ3Mp
Ow0KPiArCWRvX3NpZ25hbChjdXJyZW50KTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9rZXJuZWwvc3lzY2FsbC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxs
LmMNCj4gaW5kZXggZTAzMzhiZDhkMzgzLi45N2YxNThkMTM5NDQgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvc3lzY2FsbC5jDQo+IEBAIC0xODUsOCArMTg1LDYgQEAgbm90cmFjZSBsb25nIHN5
c3RlbV9jYWxsX2V4Y2VwdGlvbihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9u
ZyByMCkNCj4gICAJICogU28gdGhlIHJlc3VsdGluZyA2IG9yIDcgYml0cyBvZiBlbnRyb3B5
IGlzIHNlZW4gaW4gU1BbOTo0XSBvciBTUFs5OjNdLg0KPiAgIAkgKi8NCj4gICAJY2hvb3Nl
X3JhbmRvbV9rc3RhY2tfb2Zmc2V0KG1mdGIoKSk7DQo+IC0JLypjb21tb24gZW50cnkqLw0K
PiAtCXN5c2NhbGxfZXhpdF90b191c2VyX21vZGUocmVncyk7DQo+ICAgDQo+ICAgCXJldHVy
biByZXQ7DQo+ICAgfQ==


