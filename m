Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 203EC6A3D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 10:29:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ntqR3CZjzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 18:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=63.217.80.70; helo=mxhk.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ntnW4c8ZzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:27:55 +1000 (AEST)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id A32E973245AF5BD20ACF;
 Tue, 16 Jul 2019 16:27:51 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
 by mse-fl2.zte.com.cn with SMTP id x6G8Qkfx055311;
 Tue, 16 Jul 2019 16:26:46 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
 Tue, 16 Jul 2019 16:26:46 +0800 (CST)
Date: Tue, 16 Jul 2019 16:26:46 +0800 (CST)
X-Zmail-TransId: 2b055d2d8a46f9331986
X-Mailer: Zmail v1.0
Message-ID: <201907161626465333445@zte.com.cn>
In-Reply-To: <20190712034409.zyl6sskrr6ra5nd3@vireshk-i7>
References: 1562899461-24045-1-git-send-email-wen.yang99@zte.com.cn,
 20190712034409.zyl6sskrr6ra5nd3@vireshk-i7
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <viresh.kumar@linaro.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Nl0gY3B1ZnJlcS9wYXNlbWk6IGZpeCBhbiB1c2UtYWZ0ZXItZnJlZSBpbnBhc19jcHVmcmVxX2NwdV9pbml0KCk=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn x6G8Qkfx055311
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiA+IFRoZSBjcHUgdmFyaWFibGUgaXMgc3RpbGwgYmVpbmcgdXNlZCBpbiB0aGUgb2ZfZ2V0X3By
b3BlcnR5KCkgY2FsbAo+ID4gYWZ0ZXIgdGhlIG9mX25vZGVfcHV0KCkgY2FsbCwgd2hpY2ggbWF5
IHJlc3VsdCBpbiB1c2UtYWZ0ZXItZnJlZS4KPiA+Cj4gPiBGaXhlczogYTlhY2MyNmI3NWY2ICgi
Y3B1ZnJlcS9wYXNlbWk6IGZpeCBwb3NzaWJsZSBvYmplY3QgcmVmZXJlbmNlIGxlYWsiKQo+ID4g
U2lnbmVkLW9mZi1ieTogV2VuIFlhbmcgPHdlbi55YW5nOTlAenRlLmNvbS5jbj4KPiA+IENjOiAi
UmFmYWVsIEouIFd5c29ja2kiIDxyandAcmp3eXNvY2tpLm5ldD4KPiA+IENjOiBWaXJlc2ggS3Vt
YXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgo+ID4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1w
ZUBlbGxlcm1hbi5pZC5hdT4KPiA+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+
ID4gQ2M6IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4gdjY6IGtlZXAgdGhlIGJsYW5rIGxpbmUgYW5kIGZpeCB3
YXJuaW5nOiBsYWJlbCAnb3V0X3VubWFwX3NkY3B3cicgZGVmaW5lZCBidXQgbm90IHVzZWQuCj4g
PiB2NTogcHV0IHRvZ2V0aGVyIHRoZSBjb2RlIHRvIGdldCwgdXNlLCBhbmQgcmVsZWFzZSBjcHUg
ZGV2aWNlX25vZGUuCj4gPiB2NDogcmVzdG9yZSB0aGUgYmxhbmsgbGluZS4KPiA+IHYzOiBmaXgg
YSBsZWFrZWQgcmVmZXJlbmNlLgo+ID4gdjI6IGNsZWFuIHVwIHRoZSBjb2RlIGFjY29yZGluZyB0
byB0aGUgYWR2aWNlIG9mIHZpcmVzaC4KPiA+Cj4gPiAgZHJpdmVycy9jcHVmcmVxL3Bhc2VtaS1j
cHVmcmVxLmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jcHVmcmVxL3Bhc2VtaS1jcHVmcmVxLmMgYi9kcml2ZXJzL2NwdWZyZXEvcGFz
ZW1pLWNwdWZyZXEuYwo+ID4gaW5kZXggNmIxZTRhYi4uN2Q1NTdmOSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvY3B1ZnJlcS9wYXNlbWktY3B1ZnJlcS5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWZy
ZXEvcGFzZW1pLWNwdWZyZXEuYwo+ID4gQEAgLTEzMSwxMCArMTMxLDE4IEBAIHN0YXRpYyBpbnQg
cGFzX2NwdWZyZXFfY3B1X2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCj4gPiAg
ICAgIGludCBlcnIgPSAtRU5PREVWOwo+ID4KPiA+ICAgICAgY3B1ID0gb2ZfZ2V0X2NwdV9ub2Rl
KHBvbGljeS0+Y3B1LCBOVUxMKTsKPiA+ICsgICAgaWYgKCFjcHUpCj4gPiArICAgICAgICBnb3Rv
IG91dDsKPiA+Cj4gPiArICAgIG1heF9mcmVxcCA9IG9mX2dldF9wcm9wZXJ0eShjcHUsICJjbG9j
ay1mcmVxdWVuY3kiLCBOVUxMKTsKPiA+ICAgICAgb2Zfbm9kZV9wdXQoY3B1KTsKPiA+IC0gICAg
aWYgKCFjcHUpCj4gPiArICAgIGlmICghbWF4X2ZyZXFwKSB7Cj4gPiArICAgICAgICBlcnIgPSAt
RUlOVkFMOwo+ID4gICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsgICAg
Lyogd2UgbmVlZCB0aGUgZnJlcSBpbiBrSHogKi8KPiA+ICsgICAgbWF4X2ZyZXEgPSAqbWF4X2Zy
ZXFwIC8gMTAwMDsKPiA+Cj4gPiAgICAgIGRuID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVM
TCwgTlVMTCwgIjE2ODJtLXNkYyIpOwo+ID4gICAgICBpZiAoIWRuKQo+ID4gQEAgLTE3MSwxNiAr
MTc5LDYgQEAgc3RhdGljIGludCBwYXNfY3B1ZnJlcV9jcHVfaW5pdChzdHJ1Y3QgY3B1ZnJlcV9w
b2xpY3kgKnBvbGljeSkKPiA+ICAgICAgfQo+ID4KPiA+ICAgICAgcHJfZGVidWcoImluaXQgY3B1
ZnJlcSBvbiBDUFUgJWRcbiIsIHBvbGljeS0+Y3B1KTsKPiA+IC0KPiA+IC0gICAgbWF4X2ZyZXFw
ID0gb2ZfZ2V0X3Byb3BlcnR5KGNwdSwgImNsb2NrLWZyZXF1ZW5jeSIsIE5VTEwpOwo+ID4gLSAg
ICBpZiAoIW1heF9mcmVxcCkgewo+ID4gLSAgICAgICAgZXJyID0gLUVJTlZBTDsKPiA+IC0gICAg
ICAgIGdvdG8gb3V0X3VubWFwX3NkY3B3cjsKPiA+IC0gICAgfQo+ID4gLQo+ID4gLSAgICAvKiB3
ZSBuZWVkIHRoZSBmcmVxIGluIGtIeiAqLwo+ID4gLSAgICBtYXhfZnJlcSA9ICptYXhfZnJlcXAg
LyAxMDAwOwo+ID4gLQo+ID4gICAgICBwcl9kZWJ1ZygibWF4IGNsb2NrLWZyZXF1ZW5jeSBpcyBh
dCAldSBrSHpcbiIsIG1heF9mcmVxKTsKPiA+ICAgICAgcHJfZGVidWcoImluaXRpYWxpemluZyBm
cmVxdWVuY3kgdGFibGVcbiIpOwo+ID4KPiA+IEBAIC0xOTYsNyArMTk0LDExIEBAIHN0YXRpYyBp
bnQgcGFzX2NwdWZyZXFfY3B1X2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCj4g
PiAgICAgIHBvbGljeS0+Y3VyID0gcGFzX2ZyZXFzW2N1cl9hc3RhdGVdLmZyZXF1ZW5jeTsKPiA+
ICAgICAgcHBjX3Byb2NfZnJlcSA9IHBvbGljeS0+Y3VyICogMTAwMHVsOwo+ID4KPiA+IC0gICAg
cmV0dXJuIGNwdWZyZXFfZ2VuZXJpY19pbml0KHBvbGljeSwgcGFzX2ZyZXFzLCBnZXRfZ2l6bW9f
bGF0ZW5jeSgpKTsKPiA+ICsgICAgZXJyID0gY3B1ZnJlcV9nZW5lcmljX2luaXQocG9saWN5LCBw
YXNfZnJlcXMsIGdldF9naXptb19sYXRlbmN5KCkpOwo+IAo+IFNvIHlvdSBhcmUgdHJ5aW5nIHRv
IGZpeCBhbiBlYXJsaWVyIGlzc3VlIGhlcmUgd2l0aCB0aGlzLiBTaG91bGQgaGF2ZQo+IGJlZW4g
YSBzZXBhcmF0ZSBwYXRjaC4gT3ZlciB0aGF0IEkgaGF2ZSBqdXN0IHNlbnQgYSBwYXRjaCBub3cg
dG8gbWFrZQo+IHRoaXMgcm91dGluZSByZXR1cm4gdm9pZC4KPiAKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL2VlOGNmNWZiNGI0YTAxZmRmOTE5OTAzN2ZmNmQ4MzViOTM1Y2ZkMTMuMTU2
MjkwMjg3Ny5naXQudmlyZXNoLmt1bWFyQGxpbmFyby5vcmcvCj4gCj4gU28gYWxsIHlvdSBuZWVk
IHRvIGRvIGlzIHRvIHJlbW92ZSB0aGUgbGFiZWwgb3V0X3VubWFwX3NkY3B3ciBpbnN0ZWFkLgoK
T2theSB0aGFuayB5b3UuCk5vdyB0aGlzIHBhdGNoCihodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sL2VlOGNmNWZiNGI0YTAxZmRmOTE5OTAzN2ZmNmQ4MzViOTM1Y2ZkMTMuMTU2MjkwMjg3Ny5n
aXQudmlyZXNoLmt1bWFyQGxpbmFyby5vcmcvKSAKc2VlbXMgdG8gaGF2ZSBub3QgYmVlbiBtZXJn
ZWQgaW50byB0aGUgbGludXgtbmV4dC4KCkluIG9yZGVyIHRvIGF2b2lkIGNvZGUgY29uZmxpY3Rz
LCB3ZSB3aWxsIHdhaXQgdW50aWwgdGhpcyBwYXRjaCBpcyBtZXJnZWQgaW4gYW5kIHRoZW4gc2Vu
ZCB2Ny4KCi0tClRoYW5rcyBhbmQgcmVnYXJkcywKV2VuCgo+ID4gKyAgICBpZiAoZXJyKQo+ID4g
KyAgICAgICAgZ290byBvdXRfdW5tYXBfc2RjcHdyOwo+ID4gKwo+ID4gKyAgICByZXR1cm4gMDsK
PiA+Cj4gPiAgb3V0X3VubWFwX3NkY3B3cjoKPiA+ICAgICAgaW91bm1hcChzZGNwd3JfbWFwYmFz
ZSk7Cj4gPiAtLQo+ID4gMi45LjU=


--=====_003_next=====--

--=====_001_next=====--

