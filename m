Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42F54F32B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXW45tjgz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:38:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RDb0KWoM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RDb0KWoM;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXVQ2gQBz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=I7Pi+
	Im12M8ou/QoSMecx1nm7zEUMo5TJmtZNFXx6oU=; b=RDb0KWoMRPSX7T87//JdG
	5Fm5ZW6pY00uwrtQD1KnL09nwc+LMqKNd9qMu0Gy8VzsF3pGm8SRTwr0mwYcetuH
	a0Q3bDyMfpHHm5tGOwYpGc7yGAqtocDRopwu2Ivps8lqk8OiUkQ39mkoZUlgsOM6
	Eh2UmV3Qal7DiOkrmz7hC8=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 17 Jun 2022 16:34:56 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 17 Jun 2022 16:34:56 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: Conor.Dooley@microchip.com
Subject: Re:Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <33668b61-4ae7-f625-0eb3-e15d2119623c@microchip.com>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
 <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
 <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
 <64ac3dc9.5bd1.18170bcb6a6.Coremail.windhl@126.com>
 <33668b61-4ae7-f625-0eb3-e15d2119623c@microchip.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4be090c8.607e.18170cd11ad.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowABnvfGxPKxiGoc4AA--.57772W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AUjF1pEDvT03AABsg
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

CkF0IDIwMjItMDYtMTcgMTY6Mjc6MDMsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3Rl
Ogo+T24gMTcvMDYvMjAyMiAwOToxNywgTGlhbmcgSGUgd3JvdGU6Cj4+IAo+PiAKPj4gCj4+IEF0
IDIwMjItMDYtMTcgMTQ6NTM6MTMsICJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1PiB3cm90ZToKPj4+Cj4+Pgo+Pj4gTGUgMTcvMDYvMjAyMiDDoCAwODo0NSwg
TGlhbmcgSGUgYSDDqWNyaXTCoDoKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBBdCAyMDIyLTA2LTE3IDE0
OjI4OjU2LCAiQ2hyaXN0b3BoZSBMZXJveSIgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IExlIDE3LzA2LzIwMjIgw6AgMDg6MDgsIExpYW5nIEhl
IGEgw6ljcml0wqA6Cj4+Pj4+PiBJbiBncGlvX2hhbHRfcHJvYmUoKSwgb2ZfZmluZF9tYXRjaGlu
Z19ub2RlKCkgd2lsbCByZXR1cm4gYSBub2RlCj4+Pj4+PiBwb2ludGVyIHdpdGggcmVmY291bnQg
aW5jcmVtZW50ZWQuIFdlIHNob3VsZCB1c2Ugb2Zfbm9kZV9wdXQoKSBpbgo+Pj4+Pj4gZmFpbCBw
YXRoIG9yIHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9yZS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgICBj
aGFuZ2Vsb2c6Cj4+Pj4+PiAgICAgdjQ6IHJldXNlIGV4aXN0ICdlcnInIGFuZCB1c2UgYSBzaW1w
bGUgY29kZSBzdHlsZSwgYWR2aXNlZCBieSBDSgo+Pj4+Pj4gICAgIHYzOiB1c2UgbG9jYWwgJ2No
aWxkX25vZGUnIGFkdmlzZWQgYnkgTWljaGFlbC4KPj4+Pj4+ICAgICB2MjogdXNlIGdvdG8tbGFi
ZWwgcGF0Y2ggc3R5bGUgYWR2aXNlZCBieSBDaHJpc3RvcGhlIExlcm95Lgo+Pj4+Pj4gICAgIHYx
OiBhZGQgb2Zfbm9kZV9wdXQoKSBiZWZvcmUgZWFjaCBleGl0Lgo+Pj4+Pj4KPj4+Pj4+ICAgICBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDM1ICsrKysrKysrKysr
KysrLS0tLS0tLS0tCj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4
eC9zZ3lfY3RzMTAwMC5jCj4+Pj4+PiBpbmRleCA5OGFlNjQwNzUxOTMuLmU0NTg4OTQzZmU3ZSAx
MDA2NDQKPj4+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAw
MC5jCj4+Pj4+PiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAu
Ywo+Pj4+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Pj4+ICAgICB7Cj4+Pj4+PiAgICAgCWVudW0g
b2ZfZ3Bpb19mbGFncyBmbGFnczsKPj4+Pj4+ICAgICAJc3RydWN0IGRldmljZV9ub2RlICpub2Rl
ID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4+Pj4+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGRf
bm9kZTsKPj4+Pj4+ICAgICAJaW50IGdwaW8sIGVyciwgaXJxOwo+Pj4+Pj4gICAgIAlpbnQgdHJp
Z2dlcjsKPj4+Pj4+ICAgICAKPj4+Pj4+IEBAIC03OCwyNiArNzksMjkgQEAgc3RhdGljIGludCBn
cGlvX2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Pj4+ICAgICAJ
CXJldHVybiAtRU5PREVWOwo+Pj4+Pj4gICAgIAo+Pj4+Pj4gICAgIAkvKiBJZiB0aGVyZSdzIG5v
IG1hdGNoaW5nIGNoaWxkLCB0aGlzIGlzbid0IHJlYWxseSBhbiBlcnJvciAqLwo+Pj4+Pj4gLQlo
YWx0X25vZGUgPSBvZl9maW5kX21hdGNoaW5nX25vZGUobm9kZSwgY2hpbGRfbWF0Y2gpOwo+Pj4+
Pj4gLQlpZiAoIWhhbHRfbm9kZSkKPj4+Pj4+ICsJY2hpbGRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hp
bmdfbm9kZShub2RlLCBjaGlsZF9tYXRjaCk7Cj4+Pj4+PiArCWlmICghY2hpbGRfbm9kZSkKPj4+
Pj4+ICAgICAJCXJldHVybiAwOwo+Pj4+Pj4gICAgIAo+Pj4+Pj4gICAgIAkvKiBUZWNobmljYWxs
eSB3ZSBjb3VsZCBqdXN0IHJlYWQgdGhlIGZpcnN0IG9uZSwgYnV0IHB1bmlzaAo+Pj4+Pj4gICAg
IAkgKiBEVCB3cml0ZXJzIGZvciBpbnZhbGlkIGZvcm0uICovCj4+Pj4+PiAtCWlmIChvZl9ncGlv
X2NvdW50KGhhbHRfbm9kZSkgIT0gMSkKPj4+Pj4+IC0JCXJldHVybiAtRUlOVkFMOwo+Pj4+Pj4g
KwlpZiAob2ZfZ3Bpb19jb3VudChjaGlsZF9ub2RlKSAhPSAxKSB7Cj4+Pj4+PiArCQllcnIgPSAt
RUlOVkFMOwo+Pj4+Pj4gKwkJZ290byBlcnJfcHV0Owo+Pj4+Pj4gKwl9Cj4+Pj4+PiAgICAgCj4+
Pj4+PiAgICAgCS8qIEdldCB0aGUgZ3BpbyBudW1iZXIgcmVsYXRpdmUgdG8gdGhlIGR5bmFtaWMg
YmFzZS4gKi8KPj4+Pj4+IC0JZ3BpbyA9IG9mX2dldF9ncGlvX2ZsYWdzKGhhbHRfbm9kZSwgMCwg
JmZsYWdzKTsKPj4+Pj4+IC0JaWYgKCFncGlvX2lzX3ZhbGlkKGdwaW8pKQo+Pj4+Pj4gLQkJcmV0
dXJuIC1FSU5WQUw7Cj4+Pj4+PiArCWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyhjaGlsZF9ub2Rl
LCAwLCAmZmxhZ3MpOwo+Pj4+Pj4gKwlpZiAoIWdwaW9faXNfdmFsaWQoZ3BpbykpIHsKPj4+Pj4+
ICsJCWVyciA9IC1FSU5WQUw7Cj4+Pj4+PiArCQlnb3RvdCBlcnJfcHV0Owo+Pj4+Pgo+Pj4+PiBE
aWQgeW91IHRlc3QgdGhlIGJ1aWxkID8KPj4+Pgo+Pj4+IFNvcnJ5IGZvciB0aGlzIGZhdWx0Lgo+
Pj4+Cj4+Pj4gSW4gZmFjdCwgSSBhbSBzdGlsbCBmaW5kaW5nIGFuIGVmZmljaWVudCB3YXkgdG8g
YnVpbGRpbmcgZGlmZmVyZW50IGFyY2ggc291cmNlIGNvZGUgYXMgSSBvbmx5IGhhdmUgeDg2LTY0
Lgo+Pj4+Cj4+Pj4gTm93IEkgYW0gdHJ5IHVzaW5nIFFFTVUuCj4+Pj4KPj4+PiBBbnl3YXksIHNv
cnJ5IGZvciB0aGlzIGZhdWx0Lgo+Pj4KPj4+IFlvdSBjYW4gZmluZCBjcm9zcyBjb21waWxlcnMg
Zm9yIG1vc3QgYXJjaGl0ZWN0dXJlcyBmb3IgeDg2LTY0IGhlcmUgOgo+Pj4gaHR0cHM6Ly9taXJy
b3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29sLwo+Pj4KPj4+IENocmlzdG9w
aGUKPj4gCj4+IEhpLCBDaHJpc3RvcGhlIGFuZCBDb25vci4KPj4gCj4+IFNvcnJ5IHRvIHRyb3Vi
bGUgeW91IGFnYWluLgo+PiAKPj4gTm93IEkgb25seSBrbm93IGhvdyB0byBxdWlja2x5IGlkZW50
aWZ5IHRoZSByZWZjb3VudGluZyBidWdzLCBidXQgSSBjYW5ub3QgZWZmaWNpZW50bHkgZ2l2ZSBh
IGJ1aWxkIHRlc3QuCj4+IAo+PiBGb3IgZXhhbXBsZSwgSSB1c2UgdGhlIGNyb3NzIGNvbXBpbGVy
cyAncG93ZXJwYy1saW51eC1nbnUtZ2NjJyB0byBjb21waWxlICdhcmNoL3Bvd2VycGMvcGxhdGZv
cm1zLzg1eHgvc2d5X2N0czEwMDAuYycgd2l0aCAtZnN5bnRheC1vbmx5IGZsYWcuCj4+IEJ1dCBJ
IG1lZXQgdG9vIG1hbnkgaGVhZGVyIGZpbGUgbWlzc2luZyBlcnJvcnMuIEV2ZW4gaWYgSSBhZGQg
c29tZSAnaW5jbHVkZScgcGF0aGVzLCBlLmcuLCAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlLCAuL2lu
Y2x1ZGUsCj4+IHRoZXJlIGFyZSBzdGlsbCB0b28gbWFueSBvdGhlciBlcnJvcnMuCj4+IAo+PiBT
byBpZiB0aGVyZSBpcyBhbnkgZWZmaWNpZW50IHdheSB0byBjaGVjayBteSBwYXRjaCBjb2RlIHRv
IGF2b2lkICdnb3RvdCcgZXJyb3IgYWdhaW4uCj4KPmlkayBhbnl0aGluZyBhYm91dCBwb3dlcnBj
LCBidXQgd2hhdCBJIGZpbmQgaXMgYSBuaWNlIHdheSB0byBnZXQgYSBjb21waWxlcgo+Zm9yIGFu
IGFyY2ggSSBkb24ndCB1c2UgaXMgdG8gc2VhcmNoIG9uIGxvcmUua2VybmVsLm9yZyBmb3IgYSAw
ZGF5IHJvYm90Cj5idWlsZCBlcnJvciBzaW5jZSBpdCBnaXZlcyBpbnN0cnVjdGlvbnMgZm9yIGJ1
aWxkaW5nIG9uIHRoYXQgYXJjaC4KPkZvciBleGFtcGxlOgo+aHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXhwcGMtZGV2LzIwMjIwNjA2MDkxMC5yWU5URnFkSS1sa3BAaW50ZWwuY29tLwo+Cj4K
PkluIHRoaXMgY2FzZSwgeW91ciBidWcgc2VlbXMgb2J2aW91cz8gWW91IHR5cGVkICJnb3RvdCIg
aW5zdGVhZCBvZiAiZ290byIuCj4KPkhvcGUgdGhhdCBoZWxwcywKPkNvbm9yLgo+Cj4+IAo+PiBU
aGFua3MgYWdhaW4sIENocmlzdG9waGUgYW5kIENvbm9yLgo+PiAKPj4gTGlhbmcKCgpUaGFua3Mg
c28gbXVjaCwgSSB3aWxsIHRyeSBpdC4=
