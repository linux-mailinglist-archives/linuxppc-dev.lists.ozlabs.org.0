Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4461BB4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 10:29:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hzBX4gt8zDqLd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 18:29:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hz8M716lzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 18:27:09 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id A522752D760905790219;
 Mon,  8 Jul 2019 16:27:06 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
 by mse-fl1.zte.com.cn with SMTP id x688QGhj087223;
 Mon, 8 Jul 2019 16:26:16 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp04[null]) by mapi (Zmail) with MAPI id mid14;
 Mon, 8 Jul 2019 16:26:15 +0800 (CST)
Date: Mon, 8 Jul 2019 16:26:15 +0800 (CST)
X-Zmail-TransId: 2b065d22fe276a48d4af
X-Mailer: Zmail v1.0
Message-ID: <201907081626159718896@zte.com.cn>
In-Reply-To: <20190708074432.56q2e3ig5ehiee5f@vireshk-i7>
References: 1562570393-8684-1-git-send-email-wen.yang99@zte.com.cn,
 20190708074432.56q2e3ig5ehiee5f@vireshk-i7
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <viresh.kumar@linaro.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gY3B1ZnJlcS9wYXNlbWk6IGZpeCBhbiB1c2UtYWZ0ZXItZnJlZSBpbnBhc19jcHVmcmVxX2NwdV9pbml0KCk=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl1.zte.com.cn x688QGhj087223
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
IHJlc3VsdCBpbiB1c2UtYWZ0ZXItZnJlZS4KPiA+Cj4gPiBGaXhlczogYTlhY2MyNmI3NWYgKCJj
cHVmcmVxL3Bhc2VtaTogZml4IHBvc3NpYmxlIG9iamVjdCByZWZlcmVuY2UgbGVhayIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXZW4gWWFuZyA8d2VuLnlhbmc5OUB6dGUuY29tLmNuPgo+ID4gQ2M6ICJS
YWZhZWwgSi4gV3lzb2NraSIgPHJqd0Byand5c29ja2kubmV0Pgo+ID4gQ2M6IFZpcmVzaCBLdW1h
ciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cj4gPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96
bGFicy5vcmcKPiA+IENjOiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiAtLS0KPiA+IHYyOiBjbGVhbiB1cCB0aGUgY29kZSBh
Y2NvcmRpbmcgdG8gdGhlIGFkdmljZSBvZiB2aXJlc2guCj4gPgo+ID4gIGRyaXZlcnMvY3B1ZnJl
cS9wYXNlbWktY3B1ZnJlcS5jIHwgMTAgKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY3B1ZnJlcS9wYXNlbWktY3B1ZnJlcS5jIGIvZHJpdmVycy9jcHVmcmVxL3Bhc2VtaS1jcHVm
cmVxLmMKPiA+IGluZGV4IDZiMWU0YWIuLmM2ZDQ2NGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2NwdWZyZXEvcGFzZW1pLWNwdWZyZXEuYwo+ID4gKysrIGIvZHJpdmVycy9jcHVmcmVxL3Bhc2Vt
aS1jcHVmcmVxLmMKPiA+IEBAIC0xMjgsMjAgKzEyOCwxOCBAQCBzdGF0aWMgaW50IHBhc19jcHVm
cmVxX2NwdV9pbml0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQo+ID4gICAgICBpbnQg
Y3VyX2FzdGF0ZSwgaWR4Owo+ID4gICAgICBzdHJ1Y3QgcmVzb3VyY2UgcmVzOwo+ID4gICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKmNwdSwgKmRuOwo+ID4gLSAgICBpbnQgZXJyID0gLUVOT0RFVjsK
PiA+ICsgICAgaW50IGVycjsKPiA+Cj4gPiAgICAgIGNwdSA9IG9mX2dldF9jcHVfbm9kZShwb2xp
Y3ktPmNwdSwgTlVMTCk7Cj4gPiAtCj4gPiAtICAgIG9mX25vZGVfcHV0KGNwdSk7Cj4gPiAgICAg
IGlmICghY3B1KQo+ID4gLSAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAgICByZXR1cm4gLUVO
T0RFVjsKPiA+Cj4gCj4gCj4gPiAgICAgIGRuID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVM
TCwgTlVMTCwgIjE2ODJtLXNkYyIpOwo+ID4gICAgICBpZiAoIWRuKQo+ID4gICAgICAgICAgZG4g
PSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAicGFzZW1pLHB3cmZpY2llbnQtc2RjIik7Cj4gPiAgICAgIGlmICghZG4pCj4g
PiAtICAgICAgICBnb3RvIG91dDsKPiA+ICsgICAgICAgIHJldHVybiAtRU5PREVWOwo+IAo+IFRo
aXMgY2hhbmdlIGxvb2tzIGluY29ycmVjdC4gWW91IHN0aWxsIG5lZWQgdG8gZHJvcCByZWZlcmVu
Y2UgdG8gY3B1ID8KPgoKVGhhbmtzIQpXZSB3aWxsIGZpeCBpdCBpbW1lZGlhdGVseS4KCi0tClRo
YW5rcyBhbmQgcmVnYXJkcywKV2Vu


--=====_003_next=====--

--=====_001_next=====--

