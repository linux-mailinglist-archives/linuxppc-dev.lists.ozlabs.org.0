Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600B54F135
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 08:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPV2V5M60z3bsy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UYdKUjjw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UYdKUjjw;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPV1m650mz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 16:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=H+PIK
	gm+7cua7FtOe0VnZWnrrT7/N8p7fWrn1ErcRJY=; b=UYdKUjjwbyttw5xEBp4iS
	Th8JnGbh8AgbprVit/Noy03ggVeAqO86j9S06ouBX3ETuzBmZK3FsTNOvcem/BhH
	abead07jrA/dYMKg267zQhNEgOY2Yms94FZQO9209QCoBmoZP51veSn6fRUl3f9y
	xEBkRfWsZwMS1hVbbWoYHw=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 17 Jun 2022 14:45:33 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 17 Jun 2022 14:45:33 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re:Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowAAnffEPI6xi0V44AA--.56078W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgojF1-HZUQUuAACsz
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oss@buserror.net" <oss@buserror.net>, "paulus@samba.org" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CgoKQXQgMjAyMi0wNi0xNyAxNDoyODo1NiwgIkNocmlzdG9waGUgTGVyb3kiIDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPkxlIDE3LzA2LzIwMjIgw6AgMDg6MDgsIExp
YW5nIEhlIGEgw6ljcml0wqA6Cj4+IEluIGdwaW9faGFsdF9wcm9iZSgpLCBvZl9maW5kX21hdGNo
aW5nX25vZGUoKSB3aWxsIHJldHVybiBhIG5vZGUKPj4gcG9pbnRlciB3aXRoIHJlZmNvdW50IGlu
Y3JlbWVudGVkLiBXZSBzaG91bGQgdXNlIG9mX25vZGVfcHV0KCkgaW4KPj4gZmFpbCBwYXRoIG9y
IHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9yZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IExpYW5n
IEhlIDx3aW5kaGxAMTI2LmNvbT4KPj4gLS0tCj4+ICAgY2hhbmdlbG9nOgo+PiAgIHY0OiByZXVz
ZSBleGlzdCAnZXJyJyBhbmQgdXNlIGEgc2ltcGxlIGNvZGUgc3R5bGUsIGFkdmlzZWQgYnkgQ0oK
Pj4gICB2MzogdXNlIGxvY2FsICdjaGlsZF9ub2RlJyBhZHZpc2VkIGJ5IE1pY2hhZWwuCj4+ICAg
djI6IHVzZSBnb3RvLWxhYmVsIHBhdGNoIHN0eWxlIGFkdmlzZWQgYnkgQ2hyaXN0b3BoZSBMZXJv
eS4KPj4gICB2MTogYWRkIG9mX25vZGVfcHV0KCkgYmVmb3JlIGVhY2ggZXhpdC4KPj4gCj4+ICAg
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLmMgfCAzNSArKysrKysrKysr
KysrKy0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMyBk
ZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1
eHgvc2d5X2N0czEwMDAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAw
MC5jCj4+IGluZGV4IDk4YWU2NDA3NTE5My4uZTQ1ODg5NDNmZTdlIDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYwo+PiArKysgYi9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYwo+PiBAQCAtNzEsNiArNzEsNyBAQCBz
dGF0aWMgaW50IGdwaW9faGFsdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
PiAgIHsKPj4gICAJZW51bSBvZl9ncGlvX2ZsYWdzIGZsYWdzOwo+PiAgIAlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUg
KmNoaWxkX25vZGU7Cj4+ICAgCWludCBncGlvLCBlcnIsIGlycTsKPj4gICAJaW50IHRyaWdnZXI7
Cj4+ICAgCj4+IEBAIC03OCwyNiArNzksMjkgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJCXJldHVybiAtRU5PREVWOwo+PiAg
IAo+PiAgIAkvKiBJZiB0aGVyZSdzIG5vIG1hdGNoaW5nIGNoaWxkLCB0aGlzIGlzbid0IHJlYWxs
eSBhbiBlcnJvciAqLwo+PiAtCWhhbHRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdfbm9kZShub2Rl
LCBjaGlsZF9tYXRjaCk7Cj4+IC0JaWYgKCFoYWx0X25vZGUpCj4+ICsJY2hpbGRfbm9kZSA9IG9m
X2ZpbmRfbWF0Y2hpbmdfbm9kZShub2RlLCBjaGlsZF9tYXRjaCk7Cj4+ICsJaWYgKCFjaGlsZF9u
b2RlKQo+PiAgIAkJcmV0dXJuIDA7Cj4+ICAgCj4+ICAgCS8qIFRlY2huaWNhbGx5IHdlIGNvdWxk
IGp1c3QgcmVhZCB0aGUgZmlyc3Qgb25lLCBidXQgcHVuaXNoCj4+ICAgCSAqIERUIHdyaXRlcnMg
Zm9yIGludmFsaWQgZm9ybS4gKi8KPj4gLQlpZiAob2ZfZ3Bpb19jb3VudChoYWx0X25vZGUpICE9
IDEpCj4+IC0JCXJldHVybiAtRUlOVkFMOwo+PiArCWlmIChvZl9ncGlvX2NvdW50KGNoaWxkX25v
ZGUpICE9IDEpIHsKPj4gKwkJZXJyID0gLUVJTlZBTDsKPj4gKwkJZ290byBlcnJfcHV0Owo+PiAr
CX0KPj4gICAKPj4gICAJLyogR2V0IHRoZSBncGlvIG51bWJlciByZWxhdGl2ZSB0byB0aGUgZHlu
YW1pYyBiYXNlLiAqLwo+PiAtCWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyhoYWx0X25vZGUsIDAs
ICZmbGFncyk7Cj4+IC0JaWYgKCFncGlvX2lzX3ZhbGlkKGdwaW8pKQo+PiAtCQlyZXR1cm4gLUVJ
TlZBTDsKPj4gKwlncGlvID0gb2ZfZ2V0X2dwaW9fZmxhZ3MoY2hpbGRfbm9kZSwgMCwgJmZsYWdz
KTsKPj4gKwlpZiAoIWdwaW9faXNfdmFsaWQoZ3BpbykpIHsKPj4gKwkJZXJyID0gLUVJTlZBTDsK
Pj4gKwkJZ290b3QgZXJyX3B1dDsKPgo+RGlkIHlvdSB0ZXN0IHRoZSBidWlsZCA/CgpTb3JyeSBm
b3IgdGhpcyBmYXVsdC4gCgpJbiBmYWN0LCBJIGFtIHN0aWxsIGZpbmRpbmcgYW4gZWZmaWNpZW50
IHdheSB0byBidWlsZGluZyBkaWZmZXJlbnQgYXJjaCBzb3VyY2UgY29kZSBhcyBJIG9ubHkgaGF2
ZSB4ODYtNjQuCgpOb3cgSSBhbSB0cnkgdXNpbmcgUUVNVS4KCkFueXdheSwgc29ycnkgZm9yIHRo
aXMgZmF1bHQuCgoKPgo+PiArCX0KPj4gICAKPj4gICAJZXJyID0gZ3Bpb19yZXF1ZXN0KGdwaW8s
ICJncGlvLWhhbHQiKTsKPj4gICAJaWYgKGVycikgewo+PiAgIAkJcHJpbnRrKEtFUk5fRVJSICJn
cGlvLWhhbHQ6IGVycm9yIHJlcXVlc3RpbmcgR1BJTyAlZC5cbiIsCj4+ICAgCQkgICAgICAgZ3Bp
byk7Cj4+IC0JCWhhbHRfbm9kZSA9IE5VTEw7Cj4+IC0JCXJldHVybiBlcnI7Cj4+ICsJCWdvdG8g
ZXJyX3B1dDsKPj4gICAJfQo+PiAgIAo+PiAgIAl0cmlnZ2VyID0gKGZsYWdzID09IE9GX0dQSU9f
QUNUSVZFX0xPVyk7Cj4+IEBAIC0xMDUsMTUgKzEwOSwxNCBAQCBzdGF0aWMgaW50IGdwaW9faGFs
dF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgIAlncGlvX2RpcmVjdGlv
bl9vdXRwdXQoZ3BpbywgIXRyaWdnZXIpOwo+PiAgIAo+PiAgIAkvKiBOb3cgZ2V0IHRoZSBJUlEg
d2hpY2ggdGVsbHMgdXMgd2hlbiB0aGUgcG93ZXIgYnV0dG9uIGlzIGhpdCAqLwo+PiAtCWlycSA9
IGlycV9vZl9wYXJzZV9hbmRfbWFwKGhhbHRfbm9kZSwgMCk7Cj4+ICsJaXJxID0gaXJxX29mX3Bh
cnNlX2FuZF9tYXAoY2hpbGRfbm9kZSwgMCk7Cj4+ICAgCWVyciA9IHJlcXVlc3RfaXJxKGlycSwg
Z3Bpb19oYWx0X2lycSwgSVJRRl9UUklHR0VSX1JJU0lORyB8Cj4+IC0JCQkgIElSUUZfVFJJR0dF
Ul9GQUxMSU5HLCAiZ3Bpby1oYWx0IiwgaGFsdF9ub2RlKTsKPj4gKwkJCSAgSVJRRl9UUklHR0VS
X0ZBTExJTkcsICJncGlvLWhhbHQiLCBjaGlsZF9ub2RlKTsKPj4gICAJaWYgKGVycikgewo+PiAg
IAkJcHJpbnRrKEtFUk5fRVJSICJncGlvLWhhbHQ6IGVycm9yIHJlcXVlc3RpbmcgSVJRICVkIGZv
ciAiCj4+ICAgCQkgICAgICAgIkdQSU8gJWQuXG4iLCBpcnEsIGdwaW8pOwo+PiAgIAkJZ3Bpb19m
cmVlKGdwaW8pOwo+PiAtCQloYWx0X25vZGUgPSBOVUxMOwo+PiAtCQlyZXR1cm4gZXJyOwo+PiAr
CQlnb3RvIGVycl9wdXQ7Cj4+ICAgCX0KPj4gICAKPj4gICAJLyogUmVnaXN0ZXIgb3VyIGhhbHQg
ZnVuY3Rpb24gKi8KPj4gQEAgLTEyMyw3ICsxMjYsMTIgQEAgc3RhdGljIGludCBncGlvX2hhbHRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJcHJpbnRrKEtFUk5fSU5G
TyAiZ3Bpby1oYWx0OiByZWdpc3RlcmVkIEdQSU8gJWQgKCVkIHRyaWdnZXIsICVkIgo+PiAgIAkg
ICAgICAgIiBpcnEpLlxuIiwgZ3BpbywgdHJpZ2dlciwgaXJxKTsKPj4gICAKPj4gKwloYWx0X25v
ZGUgPSBjaGlsZF9ub2RlOwo+PiAgIAlyZXR1cm4gMDsKPj4gKwo+PiArZXJyX3B1dDoKPj4gKwlv
Zl9ub2RlX3B1dChjaGlsZF9ub2RlKTsKPj4gKwlyZXR1cm4gZXJyOwo+PiAgIH0KPj4gICAKPj4g
ICBzdGF0aWMgaW50IGdwaW9faGFsdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gQEAgLTEzOSw2ICsxNDcsNyBAQCBzdGF0aWMgaW50IGdwaW9faGFsdF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAKPj4gICAJCWdwaW9fZnJlZShncGlvKTsK
Pj4gICAKPj4gKwkJb2Zfbm9kZV9wdXQoaGFsdF9ub2RlKTsKPj4gICAJCWhhbHRfbm9kZSA9IE5V
TEw7Cj4+ICAgCX0KPj4gICAK
