Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C654E584
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 17:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP52103jVz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 01:00:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=g4/QoVpG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=g4/QoVpG;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP51K1Zqvz3bdB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 00:59:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ovjTU
	O24ypn/3asmCSBp8kcH40860kjRDa2YdbnXg2A=; b=g4/QoVpG4t/oSYplaftP6
	XN76yO+RkWFao9sZg2RH3tYLJZx+43ZKucab9EForRQ1UkuCN6Tc07MYFba0iDO2
	fjv9+X+fENzRnay376cML00kT4RCv1kyzs0B7bLzlKblRww3+14NS0coSUo8jUyB
	6cqqa36FZN1rmdSNGnHPyo=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Thu, 16 Jun 2022 22:56:21 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 16 Jun 2022 22:56:21 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re:Re: [PATCH] arch: powerpc: platforms: 85xx: Add missing
 of_node_put in sgy_cts1000.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <db681dac-5c42-d659-d0ed-31390b2feb3a@csgroup.eu>
References: <20220615120717.3965164-1-windhl@126.com>
 <db681dac-5c42-d659-d0ed-31390b2feb3a@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <8470436.7edc.1816d03e9c2.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowACn9fGXRKti6e43AA--.53681W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuA4iF2JVj5SI4QABsH
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

CgoKCkF0IDIwMjItMDYtMTYgMjI6NDk6MzYsICJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPgo+Cj5MZSAxNS8wNi8yMDIyIMOgIDE0OjA3LCBM
aWFuZyBIZSBhIMOpY3JpdMKgOgo+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHdp
bmRobEAxMjYuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L3NneV9jdHMxMDAwLmMgfCAxMCArKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9z
Z3lfY3RzMTAwMC5jCj4+IGluZGV4IDk4YWU2NDA3NTE5My4uMmE0NWIzMDg1MmIyIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYwo+PiArKysg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYwo+PiBAQCAtODUsMTcg
Kzg1LDI0IEBAIHN0YXRpYyBpbnQgZ3Bpb19oYWx0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4+ICAgICAgICAgIC8qIFRlY2huaWNhbGx5IHdlIGNvdWxkIGp1c3QgcmVhZCB0
aGUgZmlyc3Qgb25lLCBidXQgcHVuaXNoCj4+ICAgICAgICAgICAqIERUIHdyaXRlcnMgZm9yIGlu
dmFsaWQgZm9ybS4gKi8KPj4gICAgICAgICAgaWYgKG9mX2dwaW9fY291bnQoaGFsdF9ub2RlKSAh
PSAxKQo+PiArICAgICAgIHsKPj4gKyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGhhbHRfbm9k
ZSk7Cj4KPkR1cGxpY2F0aW5nIHRoZSBzYW1lIGNvZGUgYXQgbXVsdGlwbGUgZXhpdCBwb2ludHMg
aXMgYmFkIHByYWN0aWNlLgo+Cj5JZiB5b3UgY2FuJ3QgZG8gYSBzaW1wbGUgJ3JldHVybicgZXhp
dCwgeW91IHNob3VsZCB1c2UgJ2dvdG8nIHRvIGEgCj5jb21tb24gZXJyb3IgcGF0aCBleGl0LgoK
VGhhbmtzIGZvciB5b3VyIHZhbHVhYmxlIGFkdmljZSwgSSB3aWxsIHJlc2VuZCBhIG5ldyBwYXRj
aCBmb3IgdGhhdC4KCgo+Cj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsg
ICAgICAgfQo+PiAKPj4gICAgICAgICAgLyogR2V0IHRoZSBncGlvIG51bWJlciByZWxhdGl2ZSB0
byB0aGUgZHluYW1pYyBiYXNlLiAqLwo+PiAgICAgICAgICBncGlvID0gb2ZfZ2V0X2dwaW9fZmxh
Z3MoaGFsdF9ub2RlLCAwLCAmZmxhZ3MpOwo+PiAgICAgICAgICBpZiAoIWdwaW9faXNfdmFsaWQo
Z3BpbykpCj4+ICsgICAgICAgewo+PiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaGFsdF9u
b2RlKTsKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKyAgICAgICB9Cj4+
IAo+PiAgICAgICAgICBlcnIgPSBncGlvX3JlcXVlc3QoZ3BpbywgImdwaW8taGFsdCIpOwo+PiAg
ICAgICAgICBpZiAoZXJyKSB7Cj4+ICAgICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJn
cGlvLWhhbHQ6IGVycm9yIHJlcXVlc3RpbmcgR1BJTyAlZC5cbiIsCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdwaW8pOwo+PiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaGFsdF9ub2Rl
KTsKPj4gICAgICAgICAgICAgICAgICBoYWx0X25vZGUgPSBOVUxMOwo+PiAgICAgICAgICAgICAg
ICAgIHJldHVybiBlcnI7Cj4+ICAgICAgICAgIH0KPj4gQEAgLTExMiw2ICsxMTksNyBAQCBzdGF0
aWMgaW50IGdwaW9faGFsdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAg
ICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiAiZ3Bpby1oYWx0OiBlcnJvciByZXF1ZXN0
aW5nIElSUSAlZCBmb3IgIgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJTyAlZC5cbiIs
IGlycSwgZ3Bpbyk7Cj4+ICAgICAgICAgICAgICAgICAgZ3Bpb19mcmVlKGdwaW8pOwo+PiArICAg
ICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaGFsdF9ub2RlKTsKPj4gICAgICAgICAgICAgICAgICBo
YWx0X25vZGUgPSBOVUxMOwo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4+ICAgICAg
ICAgIH0KPj4gQEAgLTEyMyw2ICsxMzEsOCBAQCBzdGF0aWMgaW50IGdwaW9faGFsdF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgICAgICAgICBwcmludGsoS0VSTl9JTkZP
ICJncGlvLWhhbHQ6IHJlZ2lzdGVyZWQgR1BJTyAlZCAoJWQgdHJpZ2dlciwgJWQiCj4+ICAgICAg
ICAgICAgICAgICAiIGlycSkuXG4iLCBncGlvLCB0cmlnZ2VyLCBpcnEpOwo+PiAKPj4gKyAgICAg
ICBvZl9ub2RlX3B1dChoYWx0X25vZGUpOwo+PiArCj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAg
IH0KPj4gCj4+IC0tCj4+IDIuMjUuMQo+PiAK
