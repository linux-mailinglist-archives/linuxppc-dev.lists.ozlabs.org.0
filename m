Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993D54F0C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 07:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPSq56ChLz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 15:52:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HutoRPCw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HutoRPCw;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPSpV1FHsz303x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 15:51:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=b5u4k
	DTxqzjmIZdyUqh0rWeaRnuepHJYmgM/2pAS2Zw=; b=HutoRPCwt7KaVE05439pe
	/uUSAagJmIOILQgd40YbS5+UdblRu5sYm2Vl/2r7fXEnWIAB+jHJ9GHURbrFFl9N
	atIZ+p6QtOELoxaqB48lLTnUG81Ws8YAzmGImahEWb+ytscot3chvz7n2OPrmHiJ
	eq7YKRJ0gfEjNqD3137/CU=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 17 Jun 2022 13:50:37 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 17 Jun 2022 13:50:37 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Subject: Re:Re: [PATCH v3] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <b42b4644-5c22-f39d-eb5b-b3a4d5404630@wanadoo.fr>
References: <20220617052214.4004188-1-windhl@126.com>
 <b42b4644-5c22-f39d-eb5b-b3a4d5404630@wanadoo.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7d68d310.3bb6.1817036a352.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADHHPEtFqxiCFI4AA--.55350W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhMjF18RPT44uAABsl
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
Cc: linux-kernel@vger.kernel.org, oss@buserror.net, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CgpBdCAyMDIyLTA2LTE3IDEzOjM3OjEyLCAiQ2hyaXN0b3BoZSBKQUlMTEVUIiA8Y2hyaXN0b3Bo
ZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+TGUgMTcvMDYvMjAyMiDDoCAwNzoyMiwgTGlh
bmcgSGUgYSDDqWNyaXTCoDoKPj4gSW4gZ3Bpb19oYWx0X3Byb2JlKCksIG9mX2ZpbmRfbWF0Y2hp
bmdfbm9kZSgpIHdpbGwgcmV0dXJuIGEgbm9kZQo+PiBwb2ludGVyIHdpdGggcmVmY291bnQgaW5j
cmVtZW50ZWQuIFdlIHNob3VsZCB1c2Ugb2Zfbm9kZV9wdXQoKSBpbgo+PiBmYWlsIHBhdGggb3Ig
d2hlbiBpdCBpcyBub3QgdXNlZCBhbnltb3JlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTGlhbmcg
SGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1
eHgvc2d5X2N0czEwMDAuYyB8IDM5ICsrKysrKysrKysrKysrKy0tLS0tLS0tCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5jIGIvYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLmMKPj4gaW5kZXggOThhZTY0MDc1MTkz
Li5hODY5MGZjNTUyY2YgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4
eC9zZ3lfY3RzMTAwMC5jCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lf
Y3RzMTAwMC5jCj4+IEBAIC03MSwzMyArNzEsMzkgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICB7Cj4+ICAgCWVudW0gb2ZfZ3Bp
b19mbGFncyBmbGFnczsKPj4gICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2
Lm9mX25vZGU7Cj4+ICsJc3RydWN0IGRldmljZV9ub2RlICpjaGlsZF9ub2RlOwo+PiAgIAlpbnQg
Z3BpbywgZXJyLCBpcnE7Cj4+ICAgCWludCB0cmlnZ2VyOwo+PiArCWludCByZXQ7Cj4+ICAgCj4+
ICAgCWlmICghbm9kZSkKPj4gICAJCXJldHVybiAtRU5PREVWOwo+PiAgIAo+PiAgIAkvKiBJZiB0
aGVyZSdzIG5vIG1hdGNoaW5nIGNoaWxkLCB0aGlzIGlzbid0IHJlYWxseSBhbiBlcnJvciAqLwo+
PiAtCWhhbHRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdfbm9kZShub2RlLCBjaGlsZF9tYXRjaCk7
Cj4+IC0JaWYgKCFoYWx0X25vZGUpCj4+ICsJY2hpbGRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdf
bm9kZShub2RlLCBjaGlsZF9tYXRjaCk7Cj4+ICsJaWYgKCFjaGlsZF9ub2RlKQo+PiAgIAkJcmV0
dXJuIDA7Cj4+ICAgCj4+ICAgCS8qIFRlY2huaWNhbGx5IHdlIGNvdWxkIGp1c3QgcmVhZCB0aGUg
Zmlyc3Qgb25lLCBidXQgcHVuaXNoCj4+ICAgCSAqIERUIHdyaXRlcnMgZm9yIGludmFsaWQgZm9y
bS4gKi8KPj4gLQlpZiAob2ZfZ3Bpb19jb3VudChoYWx0X25vZGUpICE9IDEpCj4+IC0JCXJldHVy
biAtRUlOVkFMOwo+PiArCWlmIChvZl9ncGlvX2NvdW50KGNoaWxkX25vZGUpICE9IDEpIHsKPj4g
KwkJcmV0ID0gLUVJTlZBTDsKPj4gKwkJZ290byBlcnJfcHV0Owo+PiArCX0KPj4gICAKPj4gICAJ
LyogR2V0IHRoZSBncGlvIG51bWJlciByZWxhdGl2ZSB0byB0aGUgZHluYW1pYyBiYXNlLiAqLwo+
PiAtCWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyhoYWx0X25vZGUsIDAsICZmbGFncyk7Cj4+IC0J
aWYgKCFncGlvX2lzX3ZhbGlkKGdwaW8pKQo+PiAtCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwlncGlv
ID0gb2ZfZ2V0X2dwaW9fZmxhZ3MoY2hpbGRfbm9kZSwgMCwgJmZsYWdzKTsKPj4gKwlpZiAoIWdw
aW9faXNfdmFsaWQoZ3BpbykpIHsKPj4gKwkJcmV0ID0gLUVJTlZBTDsKPj4gKwkJZ290b3QgZXJy
X3B1dDsKPj4gKwl9Cj4+ICAgCj4+ICAgCWVyciA9IGdwaW9fcmVxdWVzdChncGlvLCAiZ3Bpby1o
YWx0Iik7Cj4+ICAgCWlmIChlcnIpIHsKPj4gICAJCXByaW50ayhLRVJOX0VSUiAiZ3Bpby1oYWx0
OiBlcnJvciByZXF1ZXN0aW5nIEdQSU8gJWQuXG4iLAo+PiAgIAkJICAgICAgIGdwaW8pOwo+PiAt
CQloYWx0X25vZGUgPSBOVUxMOwo+PiAtCQlyZXR1cm4gZXJyOwo+PiArCQlyZXQgPSBlcnI7Cj4K
PlNvcnJ5IGZvciBub3Qgc2VlaW5nIGFuZCBhc2tpbmcgYmVmb3JlLCBidXQgd2h5IGRvIHlvdSBu
ZWVkICdyZXQnPwo+Q2FuJ3QgeW91IHVzZSB0aGUgZXhpc3RpbmcgJ2VycicgaW4gcGxhY2UgaW4g
dGhpcyB3aG9sZSBwYXRjaD8KPgoKVGhhbmtzLCBDSi4KCllvdXIgYWR2aWNlIGlzIGdvb2QgYW5k
IEkgaGF2ZSBub3Qgbm90aWNlZCB0aGUgJ2VycicuCgo+PiArCQlnb3RvIGVycl9wdXQ7Cj4+ICAg
CX0KPj4gICAKPj4gICAJdHJpZ2dlciA9IChmbGFncyA9PSBPRl9HUElPX0FDVElWRV9MT1cpOwo+
PiBAQCAtMTA1LDE1ICsxMTEsMTUgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KGdwaW8s
ICF0cmlnZ2VyKTsKPj4gICAKPj4gICAJLyogTm93IGdldCB0aGUgSVJRIHdoaWNoIHRlbGxzIHVz
IHdoZW4gdGhlIHBvd2VyIGJ1dHRvbiBpcyBoaXQgKi8KPj4gLQlpcnEgPSBpcnFfb2ZfcGFyc2Vf
YW5kX21hcChoYWx0X25vZGUsIDApOwo+PiArCWlycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKGNo
aWxkX25vZGUsIDApOwo+PiAgIAllcnIgPSByZXF1ZXN0X2lycShpcnEsIGdwaW9faGFsdF9pcnEs
IElSUUZfVFJJR0dFUl9SSVNJTkcgfAo+PiAtCQkJICBJUlFGX1RSSUdHRVJfRkFMTElORywgImdw
aW8taGFsdCIsIGhhbHRfbm9kZSk7Cj4+ICsJCQkgIElSUUZfVFJJR0dFUl9GQUxMSU5HLCAiZ3Bp
by1oYWx0IiwgY2hpbGRfbm9kZSk7Cj4+ICAgCWlmIChlcnIpIHsKPj4gICAJCXByaW50ayhLRVJO
X0VSUiAiZ3Bpby1oYWx0OiBlcnJvciByZXF1ZXN0aW5nIElSUSAlZCBmb3IgIgo+PiAgIAkJICAg
ICAgICJHUElPICVkLlxuIiwgaXJxLCBncGlvKTsKPj4gICAJCWdwaW9fZnJlZShncGlvKTsKPj4g
LQkJaGFsdF9ub2RlID0gTlVMTDsKPj4gLQkJcmV0dXJuIGVycjsKPj4gKwkJcmV0ID0gZXJyOwo+
PiArCQlnb3RvIGVycl9wdXQ7Cj4+ICAgCX0KPj4gICAKPj4gICAJLyogUmVnaXN0ZXIgb3VyIGhh
bHQgZnVuY3Rpb24gKi8KPj4gQEAgLTEyMiw4ICsxMjgsMTIgQEAgc3RhdGljIGludCBncGlvX2hh
bHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAKPj4gICAJcHJpbnRr
KEtFUk5fSU5GTyAiZ3Bpby1oYWx0OiByZWdpc3RlcmVkIEdQSU8gJWQgKCVkIHRyaWdnZXIsICVk
Igo+PiAgIAkgICAgICAgIiBpcnEpLlxuIiwgZ3BpbywgdHJpZ2dlciwgaXJxKTsKPj4gKwlyZXQg
PSAwOwo+PiArCWhhbHRfbm9kZSA9IG9mX25vZGVfZ2V0KGNoaWxkX25vZGUpOwo+Cj5MR1RNLCBi
dXQgbXkgcHJlZmVycmVkIHN0eWxlIHdvdWxkIGJlOgo+CWhhbHRfbm9kZSA9IGNoaWxkX25vZGU7
Cj4JcmV0dXJuIDA7Cj5JJ20gbm90IGEgbWFpbnRhaW5lciwgc28gdGhpcyBpcyBqdXN0IG15IG9w
aW5pb24gYW5kIGl0IGlzIG1vc3RseSBhIAo+bWF0ZXIgb2YgdGFzdGUuCj4KPkNKCgpUaGFua3Ms
IENKLgoKTm93LCBJIGFsc28gcHJlZmVyIHRoaXMgc3R5bGUgYW5kIEkgd2lsbCB1c2UgaXQuCgo+
Cj4+ICAgCj4+IC0JcmV0dXJuIDA7Cj4+ICtlcnJfcHV0Ogo+PiArCW9mX25vZGVfcHV0KGNoaWxk
X25vZGUpOwo+PiArCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgZ3Bp
b19oYWx0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiBAQCAtMTM5LDYg
KzE0OSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19oYWx0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+PiAgIAo+PiAgIAkJZ3Bpb19mcmVlKGdwaW8pOwo+PiAgIAo+PiArCQlvZl9u
b2RlX3B1dChoYWx0X25vZGUpOwo+PiAgIAkJaGFsdF9ub2RlID0gTlVMTDsKPj4gICAJfQo+PiAg
IAo=
