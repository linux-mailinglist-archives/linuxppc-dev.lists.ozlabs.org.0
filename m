Return-Path: <linuxppc-dev+bounces-338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2495B070
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 10:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqGfM4Pr6z2yYY;
	Thu, 22 Aug 2024 18:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.58.6
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 248 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 18:32:25 AEST
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqGfK2VM8z2yXs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 18:32:24 +1000 (AEST)
X-QQ-GoodBg: 2
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 0040000000000060
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-XMAILINFO: Mdc3TkmnJyI/E0RSfrBBIP4muIbyVWN5snoef4lWtHM0mYve4V6P7+0k
	DYgRKFQowurUG9Gz6Kl0qkqr5hN1q2DtBn6IQKMfq1wFqtlLMgMAVp3VOY2K1/JWgLSsxSb
	dN4ZycsDGkNu8tK1OpExx0dsWocJ3Dr7rCPcMKexYKbCrfTBiEPLKSzROSjjrgtcwo8CWtu
	dC/KeDv+5OD6yBqb4Lz/B5ATy8MmqfCB/VyQ1m5OuQiUCxXAeHzkTuqBUnLLYJbm3bzs1Kz
	tyCtY3POSa0tUHorTvyZwMRFRUnQI6jayifpnOTCgtkFmLD4I4aE1jwBaJfgm2UomhjtBrY
	rjbQuWjjnmQh3lcbh6OZ/iQQDchtQ9bOLdfkp3aUrhwtJpG0q++jKqEXupNGpa8uWUAJ0xE
	j55em2FQQdO/vTs8+/gZv4d39VVXrVfjOir+5ah8SnvNE3bJ2RjLVxKDNa25IxPGM3+i5JA
	YmxbZJvqBXM1l6BqNNINpoPjzGPnqSllfFdq8FRbxv7E4fHgfbQ4sUIYvlKMTDEBSD4N/IP
	qcv1CC32M/bp9mYTKr5PQPavcQPX8EJEGA6DHGj+SKP2MRj/g+w2aNynlnlCuMWf8N5xAoZ
	QLnqK49Vo2Vs72xpwlDycc6bFrYaFqoF0uAUovGlPhgdbSQXOa/HgbqeGDorwvZ6ij8tCPN
	3GiH0aUFNvqfurz9t6SOs8/jTP5qvrNdUWSqCnupFyG3AMGyJZoivZNUlEFNNA3F26wzZb4
	3Nf1473/YGkai3+cB3CzpZTTmkMKHFELNB1WiGVw9ll0jtHapBMY7FFSJ9e6xoFQAZTr3Ud
	DCFrCCuM7y4w/F9gSiG4J7P0luO9J3LRUZgPa/DaEEAbAHj+YB1dIuGWAE8QOj003EX33xq
	IsRs+t2/eKiAP6YApjP8kaUpOCvKAGsH4R6c3R3HYBpWD/7OLgrg4pj4LZZ7DVzD+gLmzpO
	ExO8=
X-QQ-FEAT: D4aqtcRDiqQpBpTnjIJt3/f21w9WO3enREO5ZSgO7MU=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: 6XqUZ+koIUXooq3oJUsZpur6U54N8nOnO72U/v1+q5s=
X-Originating-IP: 58.34.222.244
X-QQ-STYLE: 
X-QQ-mid: t6gz5a-0t1724315469t6516429
From: "=?utf-8?B?6Jme6ZmG6ZOt?=" <luming.yu@shingroup.cn>
To: "=?utf-8?B?6Jme6ZmG6ZOt?=" <luming.yu@shingroup.cn>, "=?utf-8?B?bGludXhwcGMtZGV2?=" <linuxppc-dev@lists.ozlabs.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bXBl?=" <mpe@ellerman.id.au>, "=?utf-8?B?bnBpZ2dpbg==?=" <npiggin@gmail.com>, "=?utf-8?B?Y2hyaXN0b3BoZS5sZXJveQ==?=" <christophe.leroy@csgroup.eu>
Subject: Re:[PATCH 2/2] powerpc/locking: enable HAVE_CMPXCHG_LOCAL in kconfig
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
Date: Thu, 22 Aug 2024 16:31:09 +0800
X-Priority: 3
Message-ID: <tencent_0161BE863378EC161A2CF685@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20231204022303.528-1-luming.yu@shingroup.cn>
	<4250629DA95C6D4F+20231204022303.528-2-luming.yu@shingroup.cn>
In-Reply-To: <4250629DA95C6D4F+20231204022303.528-2-luming.yu@shingroup.cn>
X-QQ-ReplyHash: 1814028533
X-BIZMAIL-ID: 2076273090053773482
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 22 Aug 2024 16:31:10 +0800 (CST)
Feedback-ID: t:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-0

KGluIHRleHQpDQoNCkhpLA0KDQpzcGVjaWZpYyBmb3IgbG9jYWwgY21weGNoZyBlbmFibGVk
IG9uIHA4IHBvd2VybnYgcGxhdGZvcm0gb24gd2hpY2ggdGhlIHBhdGNoIGVuYWJsZWQgdm1f
c3RhdGUgdXBkYXRlIHBhdGgsDQpmdHJhY2UgZGF0YSBiZWxvdyBpbmRpY2F0ZXMgaXQgaXMg
IGF0IHRoZSBsZXZlbCAgb2ZhYm91dCA0dXMgb3IgNXVzIGxhdGVuY3ksICBmb3Igc3VjaCBh
IGJpZyBjYWNoZSBjb2xkIG9wZXJhdGlvbnMuDQogICAgICAgICAgPC4uLj4tMjc3Nzg3ICBb
MDA4XSAuLi4uLiA4ODM2Ni4yMzM2NDM6IHJlZnJlc2hfY3B1X3ZtX3N0YXRzIDwtdm1zdGF0
X3VwZGF0ZQ0KICAgICAgICAgIDxpZGxlPi0wICAgICAgIFswMDhdIGQuLi4uIDg4MzY2LjIz
MzY0ODogdGlja19ub2h6X2lkbGVfc3RvcF90aWNrIDwtZG9faWRsZQ0KDQpJIGhhdmUgbm8g
ZGlmZiBkYXRhIGFnYWluc3QgdGhlIGxhdGVuY3kgd2l0aG91dCB0aGUgcGF0Y2guIEJ1dCBi
YXNlZCBvbiB0aGUgZXN0aW1hdGlvbiBvZiB0aGUgcGlwZWxpbmUgb3ZlcmhlYWQgZm9yDQpz
dWNoIGEgYmlnIG9wZXJhdGlvbiBpbmN1cnJlZCBieSB0aGUgdm0gc3RhdHMgdXBkYXRlLCBp
dCBsb29rcyBub3QgYmFkLg0KIEkgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIGNvbGxlY3Qg
bW9yZSBoaXN0b2dyYW0gZm9yIGRpZmZlcmVudCBzY2VuYXJpb3MgdG8gZW5zdXJlIHRoYXQN
CnRoZSBsYXRlbmN5IGxldmVsIG9mIHVuZGVyc3RhbmRpbmcgaXMgc29tZXRoaW5nIHN0YXRp
c3RpY2FsbHkgbWFrZSBzZW5zZS4NCg0KSnVzdCBmb3IgdGhlIHJlY29yZCB0aGF0IHRoZSBz
bWFsbCBwYXRjaCB3b3JrcyBhcyBleHBlY3RlZC4gOi0pDQoNCkJSDQpMdW1pbmcNCiANCiAN
Ci0tLS0tLS0tLS0tLS0tLS0tLSBPcmlnaW5hbCAtLS0tLS0tLS0tLS0tLS0tLS0NCkZyb206
ICAi6Jme6ZmG6ZOtIjxsdW1pbmcueXVAc2hpbmdyb3VwLmNuPjsNCkRhdGU6ICBNb24sIERl
YyA0LCAyMDIzIDEwOjIzIEFNDQpUbzogICJsaW51eHBwYy1kZXYiPGxpbnV4cHBjLWRldkBs
aXN0cy5vemxhYnMub3JnPjsgImxpbnV4LWtlcm5lbCI8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz47ICJtcGUiPG1wZUBlbGxlcm1hbi5pZC5hdT47ICJucGlnZ2luIjxucGlnZ2lu
QGdtYWlsLmNvbT47ICJjaHJpc3RvcGhlLmxlcm95IjxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+OyANCkNjOiAgImx1bWluZy55dSI8bHVtaW5nLnl1QGdtYWlsLmNvbT47ICJrZS56
aGFvIjxrZS56aGFvQHNoaW5ncm91cC5jbj47ICJkYXdlaS5saSI8ZGF3ZWkubGlAc2hpbmdy
b3VwLmNuPjsgInNoZW5naHVpLnF1IjxzaGVuZ2h1aS5xdUBzaGluZ3JvdXAuY24+OyAi6Jme
6ZmG6ZOtIjxsdW1pbmcueXVAc2hpbmdyb3VwLmNuPjsgDQpTdWJqZWN0OiAgW1BBVENIIDIv
Ml0gcG93ZXJwYy9sb2NraW5nOiBlbmFibGUgSEFWRV9DTVBYQ0hHX0xPQ0FMIGluIGtjb25m
aWcNCg0KIA0KDQplbmFibGUgYXJjaCBmZWF0dXJlIEhBVkVfQ01QWENIR19MT0NBTCBmb3Ig
cHBjIGJ5IGRlZmF1bHQNCg0KU2lnbmVkLW9mZi1ieTogTHVtaW5nIFl1IDxsdW1pbmcueXVA
c2hpbmdyb3VwLmNuPg0KLS0tDQogYXJjaC9wb3dlcnBjL0tjb25maWcgfCAxICsNCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCmluZGV4IDZmMTA1ZWU0ZjNjZi4u
YzEwMjI5YzAyNDNjIDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCisrKyBi
L2FyY2gvcG93ZXJwYy9LY29uZmlnDQpAQCAtMjI2LDYgKzIyNiw3IEBAIGNvbmZpZyBQUEMN
CiAJc2VsZWN0IEhBVkVfQVJDSF9TRUNDT01QX0ZJTFRFUg0KIAlzZWxlY3QgSEFWRV9BUkNI
X1RSQUNFSE9PSw0KIAlzZWxlY3QgSEFWRV9BU01fTU9EVkVSU0lPTlMNCisJc2VsZWN0IEhB
VkVfQ01QWENIR19MT0NBTA0KIAlzZWxlY3QgSEFWRV9DT05URVhUX1RSQUNLSU5HX1VTRVIN
CiAJc2VsZWN0IEhBVkVfQ19SRUNPUkRNQ09VTlQNCiAJc2VsZWN0IEhBVkVfREVCVUdfS01F
TUxFQUsNCi0tIA0KMi40Mi4wLndpbmRvd3MuMg==


