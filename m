Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98A54F2A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPX3r0Q0Dz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:18:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PqykP6FQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PqykP6FQ;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPX374FdGz3bkh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:17:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=e0kyO
	4KlNjj8d++Nv1d4HGe6KQ6GirYGzF18XyU/4L0=; b=PqykP6FQgyEdJ9o1OsCzk
	8T/C0Vg3XWGYSf3xytcKUPQwyTtId5RpJJCXjWWAekQq1EmpJa6edyWJ2AtAuk4i
	xdpR8Ww07yYA/vXoKPwYxws2BFX7esYbFTl92LNOl/ohDbaxpQLxcuA5Ds69ykQU
	pzEAGwMnGYDQBr4EldbB/I=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 17 Jun 2022 16:17:04 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 17 Jun 2022 16:17:04 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, 
	"Conor.Dooley" <conor.dooley@microchip.com>
Subject: Re:Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
 <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
 <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <64ac3dc9.5bd1.18170bcb6a6.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADHHPGBOKxiQ4A4AA--.56318W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAEjF2JVj6Z50QAAs7
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

CgoKQXQgMjAyMi0wNi0xNyAxNDo1MzoxMywgIkNocmlzdG9waGUgTGVyb3kiIDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPkxlIDE3LzA2LzIwMjIgw6AgMDg6NDUsIExp
YW5nIEhlIGEgw6ljcml0wqA6Cj4+IAo+PiAKPj4gCj4+IEF0IDIwMjItMDYtMTcgMTQ6Mjg6NTYs
ICJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToK
Pj4+Cj4+Pgo+Pj4gTGUgMTcvMDYvMjAyMiDDoCAwODowOCwgTGlhbmcgSGUgYSDDqWNyaXTCoDoK
Pj4+PiBJbiBncGlvX2hhbHRfcHJvYmUoKSwgb2ZfZmluZF9tYXRjaGluZ19ub2RlKCkgd2lsbCBy
ZXR1cm4gYSBub2RlCj4+Pj4gcG9pbnRlciB3aXRoIHJlZmNvdW50IGluY3JlbWVudGVkLiBXZSBz
aG91bGQgdXNlIG9mX25vZGVfcHV0KCkgaW4KPj4+PiBmYWlsIHBhdGggb3Igd2hlbiBpdCBpcyBu
b3QgdXNlZCBhbnltb3JlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRo
bEAxMjYuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGNoYW5nZWxvZzoKPj4+PiAgICB2NDogcmV1c2Ug
ZXhpc3QgJ2VycicgYW5kIHVzZSBhIHNpbXBsZSBjb2RlIHN0eWxlLCBhZHZpc2VkIGJ5IENKCj4+
Pj4gICAgdjM6IHVzZSBsb2NhbCAnY2hpbGRfbm9kZScgYWR2aXNlZCBieSBNaWNoYWVsLgo+Pj4+
ICAgIHYyOiB1c2UgZ290by1sYWJlbCBwYXRjaCBzdHlsZSBhZHZpc2VkIGJ5IENocmlzdG9waGUg
TGVyb3kuCj4+Pj4gICAgdjE6IGFkZCBvZl9ub2RlX3B1dCgpIGJlZm9yZSBlYWNoIGV4aXQuCj4+
Pj4KPj4+PiAgICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDM1
ICsrKysrKysrKysrKysrLS0tLS0tLS0tCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy84NXh4L3NneV9jdHMxMDAwLmMKPj4+PiBpbmRleCA5OGFlNjQwNzUxOTMuLmU0NTg4OTQzZmU3
ZSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEw
MDAuYwo+Pj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5j
Cj4+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiAgICB7Cj4+Pj4gICAgCWVudW0gb2ZfZ3Bpb19m
bGFncyBmbGFnczsKPj4+PiAgICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2
Lm9mX25vZGU7Cj4+Pj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkX25vZGU7Cj4+Pj4gICAg
CWludCBncGlvLCBlcnIsIGlycTsKPj4+PiAgICAJaW50IHRyaWdnZXI7Cj4+Pj4gICAgCj4+Pj4g
QEAgLTc4LDI2ICs3OSwyOSBAQCBzdGF0aWMgaW50IGdwaW9faGFsdF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4+Pj4gICAgCj4+
Pj4gICAgCS8qIElmIHRoZXJlJ3Mgbm8gbWF0Y2hpbmcgY2hpbGQsIHRoaXMgaXNuJ3QgcmVhbGx5
IGFuIGVycm9yICovCj4+Pj4gLQloYWx0X25vZGUgPSBvZl9maW5kX21hdGNoaW5nX25vZGUobm9k
ZSwgY2hpbGRfbWF0Y2gpOwo+Pj4+IC0JaWYgKCFoYWx0X25vZGUpCj4+Pj4gKwljaGlsZF9ub2Rl
ID0gb2ZfZmluZF9tYXRjaGluZ19ub2RlKG5vZGUsIGNoaWxkX21hdGNoKTsKPj4+PiArCWlmICgh
Y2hpbGRfbm9kZSkKPj4+PiAgICAJCXJldHVybiAwOwo+Pj4+ICAgIAo+Pj4+ICAgIAkvKiBUZWNo
bmljYWxseSB3ZSBjb3VsZCBqdXN0IHJlYWQgdGhlIGZpcnN0IG9uZSwgYnV0IHB1bmlzaAo+Pj4+
ICAgIAkgKiBEVCB3cml0ZXJzIGZvciBpbnZhbGlkIGZvcm0uICovCj4+Pj4gLQlpZiAob2ZfZ3Bp
b19jb3VudChoYWx0X25vZGUpICE9IDEpCj4+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwlp
ZiAob2ZfZ3Bpb19jb3VudChjaGlsZF9ub2RlKSAhPSAxKSB7Cj4+Pj4gKwkJZXJyID0gLUVJTlZB
TDsKPj4+PiArCQlnb3RvIGVycl9wdXQ7Cj4+Pj4gKwl9Cj4+Pj4gICAgCj4+Pj4gICAgCS8qIEdl
dCB0aGUgZ3BpbyBudW1iZXIgcmVsYXRpdmUgdG8gdGhlIGR5bmFtaWMgYmFzZS4gKi8KPj4+PiAt
CWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyhoYWx0X25vZGUsIDAsICZmbGFncyk7Cj4+Pj4gLQlp
ZiAoIWdwaW9faXNfdmFsaWQoZ3BpbykpCj4+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwln
cGlvID0gb2ZfZ2V0X2dwaW9fZmxhZ3MoY2hpbGRfbm9kZSwgMCwgJmZsYWdzKTsKPj4+PiArCWlm
ICghZ3Bpb19pc192YWxpZChncGlvKSkgewo+Pj4+ICsJCWVyciA9IC1FSU5WQUw7Cj4+Pj4gKwkJ
Z290b3QgZXJyX3B1dDsKPj4+Cj4+PiBEaWQgeW91IHRlc3QgdGhlIGJ1aWxkID8KPj4gCj4+IFNv
cnJ5IGZvciB0aGlzIGZhdWx0Lgo+PiAKPj4gSW4gZmFjdCwgSSBhbSBzdGlsbCBmaW5kaW5nIGFu
IGVmZmljaWVudCB3YXkgdG8gYnVpbGRpbmcgZGlmZmVyZW50IGFyY2ggc291cmNlIGNvZGUgYXMg
SSBvbmx5IGhhdmUgeDg2LTY0Lgo+PiAKPj4gTm93IEkgYW0gdHJ5IHVzaW5nIFFFTVUuCj4+IAo+
PiBBbnl3YXksIHNvcnJ5IGZvciB0aGlzIGZhdWx0Lgo+Cj5Zb3UgY2FuIGZpbmQgY3Jvc3MgY29t
cGlsZXJzIGZvciBtb3N0IGFyY2hpdGVjdHVyZXMgZm9yIHg4Ni02NCBoZXJlIDogCj5odHRwczov
L21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wvCj4KPkNocmlzdG9w
aGUKCkhpLCBDaHJpc3RvcGhlIGFuZCBDb25vci4KClNvcnJ5IHRvIHRyb3VibGUgeW91IGFnYWlu
LgoKTm93IEkgb25seSBrbm93IGhvdyB0byBxdWlja2x5IGlkZW50aWZ5IHRoZSByZWZjb3VudGlu
ZyBidWdzLCBidXQgSSBjYW5ub3QgZWZmaWNpZW50bHkgZ2l2ZSBhIGJ1aWxkIHRlc3QuCgpGb3Ig
ZXhhbXBsZSwgSSB1c2UgdGhlIGNyb3NzIGNvbXBpbGVycyAncG93ZXJwYy1saW51eC1nbnUtZ2Nj
JyB0byBjb21waWxlICdhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYycg
d2l0aCAtZnN5bnRheC1vbmx5IGZsYWcuCkJ1dCBJIG1lZXQgdG9vIG1hbnkgaGVhZGVyIGZpbGUg
bWlzc2luZyBlcnJvcnMuIEV2ZW4gaWYgSSBhZGQgc29tZSAnaW5jbHVkZScgcGF0aGVzLCBlLmcu
LCAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlLCAuL2luY2x1ZGUsIAp0aGVyZSBhcmUgc3RpbGwgdG9v
IG1hbnkgb3RoZXIgZXJyb3JzLgoKU28gaWYgdGhlcmUgaXMgYW55IGVmZmljaWVudCB3YXkgdG8g
Y2hlY2sgbXkgcGF0Y2ggY29kZSB0byBhdm9pZCAnZ290b3QnIGVycm9yIGFnYWluLgoKVGhhbmtz
IGFnYWluLCBDaHJpc3RvcGhlIGFuZCBDb25vci4KCkxpYW5n
