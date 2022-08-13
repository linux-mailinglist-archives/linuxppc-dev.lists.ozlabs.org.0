Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2853591A1B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 14:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4fYn32Lvz3c69
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 22:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Vi0hzY9u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Vi0hzY9u;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4XRg1w0Gz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 17:36:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=tE9T9
	FqtSALUnvs7sFV0mc1d2rem4MJ916ywgLtADRk=; b=Vi0hzY9uAK9cTE2Qy2OwC
	eruOkHeveR3IsAN0jiqoKd1c2U+qn8xUW/q3oC6jgDZ4wwD7ZzZaiQyW4KpHrYOz
	NDyYoua3aLjSBDjEwOMGEY+pwyXtt3ClculcQPFIcub+qakDL6oNpXNU33P0sqtH
	+vE6Mdoxi9WtEGE8NvUHWE=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sat, 13 Aug 2022 15:36:07 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Sat, 13 Aug 2022 15:36:07 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
Subject: Re:Re: [PATCH] powerpc/powermac/pfunc_base: Fix refcount leak bug
 in macio_gpio_init_one()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <2c9150f2af2147bb7c40c646de51f46620ddb8b9.camel@kernel.crashing.org>
References: <20220716073111.539739-1-windhl@126.com>
 <2c9150f2af2147bb7c40c646de51f46620ddb8b9.camel@kernel.crashing.org>
Content-Type: multipart/alternative; 
	boundary="----=_Part_19856_2023912772.1660376167097"
MIME-Version: 1.0
Message-ID: <3fcf0d48.1529.1829621b2b9.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowAAHXfFnVPdiJGtaAA--.24881W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgdcF1-HZqokwAAAsm
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Sat, 13 Aug 2022 22:11:58 +1000
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------=_Part_19856_2023912772.1660376167097
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgoKQXQgMjAyMi0wOC0wMiAxMjo1MTowOCwgIkJlbmphbWluIEhlcnJlbnNjaG1pZHQiIDxiZW5o
QGtlcm5lbC5jcmFzaGluZy5vcmc+IHdyb3RlOgo+T24gU2F0LCAyMDIyLTA3LTE2IGF0IDE1OjMx
ICswODAwLCBMaWFuZyBIZSB3cm90ZToKPj4gV2Ugc2hvdWxkIGNhbGwgb2Zfbm9kZV9wdXQoKSBm
b3IgdGhlIHJlZmVyZW5jZSAnZ3BhcmVudCcgZXNjYXBlZAo+PiBvdXQgb2YgdGhlIGZvcl9lYWNo
X2NoaWxkX29mX25vZGUoKSBhcyBpdCBoYXMgaW5jcmVhc2VkIHRoZSByZWZjb3VudC4KPgo+U2Ft
ZSBjb21tZW50IGFzIGJlZm9yZS4gVGhhdCBzdHVmZiBoYXBwZW5zIG9uY2UgYXQgYm9vdCwgdGhl
cmUncyBuZXZlcgo+YW55IGR5bmFtaWMgYWxsb2NhdGlvbi9kZWFsbG9jYXRpb24gb2YgdGhlc2Us
IHRoZXkganVzdCBkb24ndCBtYXR0ZXIsCj5idXQgZmVlbCBmcmVlIC4uLi4gOi0pCgo+CgoKVGhh
bmtzIGZvciB5b3VyIHJlcGx5LCB0aGlzIGlzIGEgdmFsdWFibGUgbGVzc29uIGZvciBtZS4KSSB3
aWxsIG5vdyBiZWdpbiB0byBsZWFybiB0aGUgZGV0YWlsZWQgZGlmZmVyZW5jZSBvZiBkeW5hbWlj
IGFuZCBzdGF0aWMgYWxsb2NhdGlvbi4KCgpUaGFua3MsCkxpYW5nCgoKPj4gRml4ZXM6IDViOWNh
NTI2OTE3YiAoIltQQVRDSF0gMy81IHBvd2VycGM6IEFkZCBwbGF0Zm9ybSBmdW5jdGlvbnMKPj4g
aW50ZXJwcmV0ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+
Cj4+IC0tLQo+PiAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9wZnVuY19iYXNlLmMg
fCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9wZnVuY19iYXNlLmMKPj4gYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3BmdW5jX2Jhc2UuYwo+PiBpbmRleCA5YzI5
NDdhM2VkZDUuLjA4NWUwYWQyMGViYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm1hYy9wZnVuY19iYXNlLmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9wb3dlcm1hYy9wZnVuY19iYXNlLmMKPj4gQEAgLTEzNiw2ICsxMzYsOCBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgbWFjaW9fZ3Bpb19pbml0X29uZShzdHJ1Y3QKPj4gbWFjaW9fY2hpcCAqbWFjaW8p
Cj4+ICAJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShncGFyZW50LCBncCkKPj4gIAkJcG1mX2RvX2Z1
bmN0aW9ucyhncCwgTlVMTCwgMCwgUE1GX0ZMQUdTX09OX0lOSVQsIE5VTEwpOwo+PiAgCj4+ICsJ
b2Zfbm9kZV9wdXQoZ3BhcmVudCk7Cj4+ICsKPj4gIAkvKiBOb3RlOiBXZSBkbyBub3QgYXQgdGhp
cyBwb2ludCBpbXBsZW1lbnQgdGhlICJhdCBzbGVlcCIgb3IKPj4gImF0IHdha2UiCj4+ICAJICog
ZnVuY3Rpb25zLiBJIHlldCB0byBmaW5kIGFueSBmb3IgR1BJT3MgYW55d2F5Cj4+ICAJICovCg==

------=_Part_19856_2023912772.1660376167097
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwcmU+QXQg
MjAyMi0wOC0wMiAxMjo1MTowOCwgIkJlbmphbWluIEhlcnJlbnNjaG1pZHQiICZsdDtiZW5oQGtl
cm5lbC5jcmFzaGluZy5vcmcmZ3Q7IHdyb3RlOgomZ3Q7T24gU2F0LCAyMDIyLTA3LTE2IGF0IDE1
OjMxICswODAwLCBMaWFuZyBIZSB3cm90ZToKJmd0OyZndDsgV2Ugc2hvdWxkIGNhbGwgb2Zfbm9k
ZV9wdXQoKSBmb3IgdGhlIHJlZmVyZW5jZSAnZ3BhcmVudCcgZXNjYXBlZAomZ3Q7Jmd0OyBvdXQg
b2YgdGhlIGZvcl9lYWNoX2NoaWxkX29mX25vZGUoKSBhcyBpdCBoYXMgaW5jcmVhc2VkIHRoZSBy
ZWZjb3VudC4KJmd0OwomZ3Q7U2FtZSBjb21tZW50IGFzIGJlZm9yZS4gVGhhdCBzdHVmZiBoYXBw
ZW5zIG9uY2UgYXQgYm9vdCwgdGhlcmUncyBuZXZlcgomZ3Q7YW55IGR5bmFtaWMgYWxsb2NhdGlv
bi9kZWFsbG9jYXRpb24gb2YgdGhlc2UsIHRoZXkganVzdCBkb24ndCBtYXR0ZXIsCiZndDtidXQg
ZmVlbCBmcmVlIC4uLi4gOi0pCjxkaXY+Jmd0OzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhh
bmtzIGZvciB5b3VyIHJlcGx5LCB0aGlzIGlzIGEgdmFsdWFibGUgbGVzc29uIGZvciBtZS48L2Rp
dj48ZGl2Pkkgd2lsbCBub3cgYmVnaW4gdG8gbGVhcm4gdGhlIGRldGFpbGVkIGRpZmZlcmVuY2Ug
b2YgZHluYW1pYyBhbmQgc3RhdGljIGFsbG9jYXRpb24uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGFua3MsPC9kaXY+PGRpdj5MaWFuZzwvZGl2PjxkaXY+PGJyPjwvZGl2PiZndDsmZ3Q7IEZp
eGVzOiA1YjljYTUyNjkxN2IgKCJbUEFUQ0hdIDMvNSBwb3dlcnBjOiBBZGQgcGxhdGZvcm0gZnVu
Y3Rpb25zCiZndDsmZ3Q7IGludGVycHJldGVyIikKJmd0OyZndDsgU2lnbmVkLW9mZi1ieTogTGlh
bmcgSGUgJmx0O3dpbmRobEAxMjYuY29tJmd0OwomZ3Q7Jmd0OyAtLS0KJmd0OyZndDsgIGFyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvcGZ1bmNfYmFzZS5jIHwgMiArKwomZ3Q7Jmd0OyAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQomZ3Q7Jmd0OyAKJmd0OyZndDsgZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvcGZ1bmNfYmFzZS5jCiZndDsm
Z3Q7IGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9wZnVuY19iYXNlLmMKJmd0OyZn
dDsgaW5kZXggOWMyOTQ3YTNlZGQ1Li4wODVlMGFkMjBlYmEgMTAwNjQ0CiZndDsmZ3Q7IC0tLSBh
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvcGZ1bmNfYmFzZS5jCiZndDsmZ3Q7ICsr
KyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvcGZ1bmNfYmFzZS5jCiZndDsmZ3Q7
IEBAIC0xMzYsNiArMTM2LDggQEAgc3RhdGljIHZvaWQgX19pbml0IG1hY2lvX2dwaW9faW5pdF9v
bmUoc3RydWN0CiZndDsmZ3Q7IG1hY2lvX2NoaXAgKm1hY2lvKQomZ3Q7Jmd0OyAgCWZvcl9lYWNo
X2NoaWxkX29mX25vZGUoZ3BhcmVudCwgZ3ApCiZndDsmZ3Q7ICAJCXBtZl9kb19mdW5jdGlvbnMo
Z3AsIE5VTEwsIDAsIFBNRl9GTEFHU19PTl9JTklULCBOVUxMKTsKJmd0OyZndDsgIAomZ3Q7Jmd0
OyArCW9mX25vZGVfcHV0KGdwYXJlbnQpOwomZ3Q7Jmd0OyArCiZndDsmZ3Q7ICAJLyogTm90ZTog
V2UgZG8gbm90IGF0IHRoaXMgcG9pbnQgaW1wbGVtZW50IHRoZSAiYXQgc2xlZXAiIG9yCiZndDsm
Z3Q7ICJhdCB3YWtlIgomZ3Q7Jmd0OyAgCSAqIGZ1bmN0aW9ucy4gSSB5ZXQgdG8gZmluZCBhbnkg
Zm9yIEdQSU9zIGFueXdheQomZ3Q7Jmd0OyAgCSAqLwo8L3ByZT48L2Rpdj4=
------=_Part_19856_2023912772.1660376167097--

