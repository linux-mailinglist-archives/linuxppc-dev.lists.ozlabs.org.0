Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD45550619
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 18:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQLnH12V9z3cgv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 02:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=K/HP8BUl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.64; helo=m1564.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=K/HP8BUl;
	dkim-atps=neutral
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQLmZ1KWsz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 02:22:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=at3L2
	+TfShf4wo60S1uEViBAVqUuMZHElKyE3quViX8=; b=K/HP8BUlacZ46AT0Ycikc
	pPHOprzF/lZ0yEOdyPBnduunrqOkdjR3NMOfCbAptzs6mDqpIMT7jwLZTcTmY5Xt
	F6IwHjvD3np9IFFd1QRe4TA9x9CLM+71vgUdWZZyDExt1pM1cpP+8LxGr/pOvJOk
	K7E/bew6VSsyjjgoi6sUtc=
Received: from windhl$126.com ( [123.112.70.164] ) by ajax-webmail-wmsvr64
 (Coremail) ; Sun, 19 Jun 2022 00:20:16 +0800 (CST)
X-Originating-IP: [123.112.70.164]
Date: Sun, 19 Jun 2022 00:20:16 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re:Re: [PATCH] powerpc: kernel: Change the order of of_node_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <c9785db9-b74d-540e-9c83-4db7bee10303@csgroup.eu>
References: <20220617112636.4041671-1-windhl@126.com>
 <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
 <61c85548.1a55.18175d69e21.Coremail.windhl@126.com>
 <c9785db9-b74d-540e-9c83-4db7bee10303@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5814e0cc.2c68.181779d72a2.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAA3P3NB+61iPNo6AA--.64779W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AEkF1pEDv1h-gAAsc
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gpiccoli@igalia.com" <gpiccoli@igalia.com>, "paulus@samba.org" <paulus@samba.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IAogIApBdCAyMDIyLTA2LTE4IDE2OjQ4OjI2LCAiQ2hyaXN0b3BoZSBMZXJveSIgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+TGUgMTgvMDYvMjAyMiDDoCAxMDowMywg
TGlhbmcgSGUgYSDDqWNyaXTCoDoKPj4gCj4+IAo+PiAKPj4gCj4+IAo+PiDlnKggMjAyMi0wNi0x
OCAxNToxMzoxM++8jCJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1PiDlhpnpgZPvvJoKPj4+Cj4+Pgo+Pj4gTGUgMTcvMDYvMjAyMiDDoCAxMzoyNiwgTGlhbmcg
SGUgYSDDqWNyaXTCoDoKPj4+PiBJbiBhZGRfcGNzcGtyKCksIGl0IGlzIGJldHRlciB0byBjYWxs
IG9mX25vZGVfcHV0KCkgYWZ0ZXIgdGhlCj4+Pj4gJ2lmKCFucCknIGNoZWNrLgo+Pj4KPj4+IFdo
eSBpcyBpdCBiZXR0ZXIgPwo+Pj4KPj4+Cj4+Pgo+Pj4gLyoqCj4+PiAgICogb2Zfbm9kZV9wdXQo
KSAtIERlY3JlbWVudCByZWZjb3VudCBvZiBhIG5vZGUKPj4+ICAgKiBAbm9kZToJTm9kZSB0byBk
ZWMgcmVmY291bnQsIE5VTEwgaXMgc3VwcG9ydGVkIHRvIHNpbXBsaWZ5IHdyaXRpbmcgb2YKPj4+
ICAgKgkJY2FsbGVycwo+Pj4gICAqLwo+Pj4gdm9pZCBvZl9ub2RlX3B1dChzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUpCj4+PiB7Cj4+PiAJaWYgKG5vZGUpCj4+PiAJCWtvYmplY3RfcHV0KCZub2Rl
LT5rb2JqKTsKPj4+IH0KPj4+IEVYUE9SVF9TWU1CT0wob2Zfbm9kZV9wdXQpOwo+Pj4KPj4+Cj4+
Pgo+Pj4gQ2hyaXN0b3BoZQo+PiAKPj4gSGksIENocmlzdG9waGUuCj4+IAo+PiBUaGFua3MgZm9y
IHlvdXIgcmVwbHkgYW5kIEkgd2FudCB0byBoYXZlIGEgZGlzY3Vzc2lvbi4KPj4gCj4+IEluIG15
IHRob3VnaHQsIHh4eF9wdXQocG9pbnRlcikncyBzZW1hbnRpYyB1c3VhbGx5IG1lYW5zCj4+IHRo
aXMgcmVmZXJlbmNlIGhhcyBiZWVuIHVzZWQgZG9uZSBhbmQgd2lsbCBub3QgYmUgdXNlZAo+PiBh
bnltb3JlLiBJcyB0aGlzIHNlbWFudGljIG1vcmUgcmVhc29uYWJsZSwgcmlnaHQ/Cj4+IAo+PiBC
ZXNpZGVzLCBpZiB0aGUgbnAgaXMgTlVMTCwgd2UgY2FuIGp1c3QgcmV0dXJuIGFuZCBzYXZlIGEg
Y3B1Cj4+IHRpbWUgZm9yIHRoZSB4eHhfcHV0KCkgY2FsbC4KPj4gCj4+IE90aGVyd2lzZSwgSSBw
cmVmZXIgdG8gY2FsbCBpdCAndXNlKGNoZWNrKS1hZnRlci1wdXQnLgo+PiAKPj4gSW4gZmFjdCwg
SSBoYXZlIG1lZXQgbWFueSBvdGhlciAndXNlKGNoZWNrKS1hZnRlci1wdXQnIGluc3RhbmNlcwo+
PiBhZnRlciBJIHNlbmQgdGhpcyBwYXRjaC1jb21taXQsIHNvIEkgYW0gd2FpdGluZyBmb3IgdGhp
cwo+PiBkaXNjdXNzaW9uLgo+PiAKPj4gVGhpcyBpcyBqdXN0IG15IHRob3VnaHQsIGl0IG1heSBi
ZSB3cm9uZy4KPj4gCj4+IEFueXdheSwgdGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+Cj5XZWxsIGlu
IHByaW5jaXBsZSB5b3UgYXJlIHJpZ2h0LCBpbiBhbiBpZGVhbCB3b3JsZCBpdCBzaG91bGQgYmUg
bGlrZSAKPnRoYXQuIEhvd2V2ZXIsIHlvdSBoYXZlIHRvIHdvbmRlciBpZiBpdCBpcyB3b3J0aCB0
aGUgY2h1cm4uIFRoZSBDUFUgCj5jeWNsZSBhcmd1bWVudCBpcyB2YWxpZCBvbmx5IGlmIHRoYXQg
ZnVuY3Rpb24gaXMgdXNlZCBpbiBhIGhvdCBwYXRoLiBCdXQgCj5hcyB3ZSBhcmUgdGFsa2luZyBh
Ym91dCBlcnJvciBoYW5kbGluZywgaXQgY2FuJ3QgYmUgYSBob3QgcGF0aC4KPgoKVGhhbmtzIHZl
cnkgbXVjaCBmb3IgdGhpcyB2YWx1YWJsZSBsZXNzb24uCgo+VGFraW5nIGludG8gYWNjb3VudCB0
aGUgY29tbWVudCBhc3NvY2lhdGVkIG9mIG9mX25vZGVfcHV0IDogIk5VTEwgaXMgCj5zdXBwb3J0
ZWQgdG8gc2ltcGxpZnkgd3JpdGluZyBvZiBjYWxsZXJzIiwgaXQgbWVhbnMgdGhhdCB1c2FnZSBp
cyB2YWxpZCwgCj5qdXN0IGxpa2UgaXQgaXMgd2l0aCBmdW5jdGlvbiBrZnJlZSgpIGFmdGVyIGEg
a21hbGxvYygpLgo+Cj5TbyBpbiBhIG5ldyBkZXZlbG9wcGVtZW50LCBvciB3aGVuIGRvaW5nIHJl
YWwgbW9kaWZpY2F0aW9ucyB0byBhIGRyaXZlciwgCj50aGF0IGtpbmQgb2YgY2hhbmdlIGNhbiBi
ZSBkb25lIGlkZWFsbHkuIEhvd2V2ZXIgZm9yIGRyaXZlcnMgdGhhdCBoYXZlIAo+YmVlbiB0aGVy
ZSBmb3IgeWVhcnMgd2l0aG91dCBhbnkgY2hhbmdlLCBhc2sgeW91cnNlbGYgaWYgaXQgaXMgd29y
dGggdGhlIAo+Y2h1cm4uIFlvdSBzcGVuZCB0aW1lIG9uIGl0LCB5b3UgcmVxdWlyZSBvdGhlciBw
ZW9wbGUgdG8gc3BlbmQgdGltZSBvbiAKPml0IGZvciByZXZpZXdpbmcgYW5kIGFwcGx5aW5nIHlv
dXIgcGF0Y2hlcyBhbmQgZHVyaW5nIHRoYXQgdGltZSB0aGV5IAo+ZG9uJ3QgZG8gb3RoZXIgdGhp
bmdzIHRoYXQgY291bGQgaGF2ZSBiZWVuIG1vcmUgdXNlZnVsbC4KPgoKVGhhbmtzIGZvciB5b3Ug
YWR2aWNlLCBJIHdpbGwga2VlcCBpdCBpbiBteSBtaW5kIGJlZm9yZSBJIHNlbmQgYSBuZXcgcGF0
Y2guCgo+U28gdW5sZXNzIHRoaXMgY2hhbmdlIGlzIHBhcnQgb2YgYSBtb3JlIGdsb2JhbCBwYXRj
aCwgSSB0aGluayBpdCBpcyBub3QgCj53b3J0aCB0aGUgZWZmb3J0Lgo+Cj5CeSB0aGUgd2F5LCBh
bHNvIGZvciBhbGwgeW91ciBvdGhlciBwYXRjaGVzLCBJIHRoaW5rIHlvdSBzaG91bGQgc3RhcnQg
Cj5kb2luZyBhbGwgdGhlIGNoYW5nZXMgbG9jYWxseSBvbiB5b3VyIHNpZGUsIGFuZCB3aGVuIHlv
dSBhcmUgZmluaXNoZWQgCj50cnkgdG8gZ3JvdXAgdGhpbmdzIHRvZ2V0aGVyIGluIGJpZ2dlciBw
YXRjaGVzIHBlciBhcmVhIGluc3RlYWQgb2YgCj5zZW5kaW5nIG9uZSBieSBvbmUuIEkgc2VlIHlv
dSBoYXZlIGFscmVhZHkgc3RhcnRlZCBkb2luZyB0aGF0IGZvciAKPm9wYWwvcG93ZXJudiBmb3Ig
aW5zdGFuY2UsIGJ1dCB0aGVyZSBhcmUgc3RpbGwgaW5kaXZpZHVhbCBwb3dlcm52L29wYWwgCj5p
biB0aGUgcXVldWUuIEkgdGhpbmsgeW91IHNob3VsZCBncm91cCBhbGwgdG9nZXRoZXIgaW4gYSBz
aW5nbGUgcGF0Y2guIAo+QW5kIHNhbWUgZm9yIG90aGVyIGFyZWFzLCBwbGVhc2UgdHJ5IHRvIG1p
bmltaXNlIHRoZSBudW1iZXIgb2YgcGF0Y2hlcy4gCj5XZSBkb24ndCBsaW5rIGh1Z2UgYm9tYnMg
dGhhdCBtb2RpZnkgYWxsIHRoZSBrZXJuZWwgYXQgb25jZSwgYnV0IHlvdSBjYW4gCj5ncm91cCB0
aGluZ3MgdG9nZXRoZXIsIG9uZSBwYXRjaCBmb3IgcG93ZXJwYyBjb3JlIHBhcnRzLCBvbmUgcGF0
Y2ggZm9yIAo+ZWFjaCBwbGF0Zm9ybSBpbiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLyBldGMgLi4u
Cj4KCllvdSBhcmUgcmlnaHQgYW5kIEkgd2lsbCBmb2xsb3cgdGhpcyBwcmluY2lwbGUgaW4gZnV0
dXJlIHBhdGNoaW5nIHdvcmsuCldoaWxlIEl0IGlzIHRvbyBleGNpdGluZyBmb3IgbWUgdG8gYmVn
aW4gdGhlIHBhdGNoaW5nIHdvcmsgLCBJIHNob3VsZCBoYXZlIApncm91cGVkIG15IHBhdGNoZXMu
Cgo+Cj5DaHJpc3RvcGhlCgpUaGFua3MgYWdhaW4sIENocmlzdG9waGUuCgpMaWFuZwo=
