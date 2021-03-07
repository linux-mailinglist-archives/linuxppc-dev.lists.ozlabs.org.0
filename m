Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05741330523
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 00:02:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dtxng4PQnz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=GaUPz3mm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=GaUPz3mm; 
 dkim-atps=neutral
X-Greylist: delayed 542 seconds by postgrey-1.36 at boromir;
 Mon, 08 Mar 2021 10:02:06 AEDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtxnB2pX4z3bPN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 10:02:06 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 62DE3806B5;
 Mon,  8 Mar 2021 11:52:54 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615157574;
 bh=/uKpJ5Y+T9LW6SOC8eRw1AlWYpZCA12/OQkujPvvcJY=;
 h=From:To:CC:Subject:Date;
 b=GaUPz3mmGUBnXWWeJo65ql5yaIUz9E8ejIt68W1/UW14ePNIzX7emnkI0fBhGBT3x
 cJQMFFzkiHVOY5vnAB9eFH/0mPoq9OCurVHzEhZylgDxQw3433CvQG07QQcbMNYXu3
 6AhUCEpTrEmFk/xB2yXQjbcuZAvsxJxr1+9mzLDU2GLqjRH43XVbvbxaiIdTfSPtRK
 oVTAKnoieZOjhMggKeK5w1jowP4NdbNejouZFk1fcFT8sSs4RjUpp2uP/7k9ScRbMW
 n/337qaBOEo6GfOHuw2wrLAMc0YTDGf/Bmnchlqqz4kUM5YmJgXv9HEVzhzQ4rE6ft
 fiepq67lhkkjA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B604559460000>; Mon, 08 Mar 2021 11:52:54 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 8 Mar 2021 11:52:54 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 8 Mar 2021 11:52:54 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "jdelvare@suse.com" <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Skw==
Date: Sun, 7 Mar 2021 22:52:53 +0000
Message-ID: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F132F842DDAF194C9B19A1C4261BD2BA@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=v3EFt_4kAAAA:20 a=sozttTNsAAAA:8
 a=1L_YXzs6ym7sghQsxOAA:9 a=QEXdDO2ut3YA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=BPzZvq435JnGatEyYwdK:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-SEG-SpamProfiler-Score: 0
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkkndmUgZ290IGEgc3lzdGVtIHVzaW5nIGEgUG93ZXJQQyBUMjA4MCBTb0MgYW5kIGFt
b25nIG90aGVyIHRoaW5ncyBoYXMgDQphbiBMTTgxIGh3bW9uIGNoaXAuDQoNClVuZGVyIGEgaGln
aCBDUFUgbG9hZCB3ZSBzZWUgZXJyYW50IHJlYWRpbmdzIGZyb20gdGhlIExNODEgYXMgd2VsbCBh
cyANCmFjdHVhbCBmYWlsdXJlcy4gSXQncyB0aGUgZXJyYW50IHJlYWRpbmdzIHRoYXQgY2F1c2Ug
dGhlIG1vc3QgY29uY2VybiANCnNpbmNlIHdlIGNhbiBlYXNpbHkgaWdub3JlIHRoZSByZWFkIGVy
cm9ycyBpbiBvdXIgbW9uaXRvcmluZyBhcHBsaWNhdGlvbiANCihhbHRob3VnaCBpdCB3b3VsZCBi
ZSBiZXR0ZXIgaWYgdGhleSB3ZXJlbid0IHRoZXJlIGF0IGFsbCkuDQoNCkknbSBhYmxlIHRvIHJl
cHJvZHVjZSB0aGlzIHdpdGggYSB0ZXN0IGFwcGxpY2F0aW9uWzBdIHRoYXQgYXJ0aWZpY2lhbGx5
IA0KY3JlYXRlcyBhIGhpZ2ggQ1BVIGxvYWQgdGhlbiBieSByZXBlYXRlZGx5IGNoZWNraW5nIGZv
ciB0aGUgYWxsLTFzIA0KdmFsdWVzIGZyb20gdGhlIExNODEgZGF0YXNoZWV0WzFdKHBhZ2UgMTcp
LiBUaGUgYWxsLTFzIHJlYWRpbmdzIHN0aWNrIA0Kb3V0IGFzIHRoZXkgYXJlIG9idmlvdXNseSBo
aWdoZXIgdGhhbiB0aGUgdm9sdGFnZSByYWlscyB0aGF0IGFyZSANCmNvbm5lY3RlZCBhbmQgZGlz
YWdyZWUgd2l0aCBtZWFzdXJlbWVudHMgdGFrZW4gd2l0aCBhIG11bHRpbWV0ZXIuDQoNCkhlcmUn
cyB0aGUgb3V0cHV0IGZyb20gbXkgZGV2aWNlDQoNCltyb290QGxpbnV4Ym94IH5dIyBjcHVsb2Fk
IDkwJg0KW3Jvb3RAbGludXhib3ggfl0jICh3aGlsZSB0cnVlOyBkbyBjYXQgL3N5cy9jbGFzcy9o
d21vbi9od21vbjAvaW4qX2lucHV0IA0KfCBncmVwICczMzIwXHw0MzgzXHw2NjQxXHwxNTkzMFx8
MzU4Nic7IHNsZWVwIDE7IGRvbmUpJg0KMzU4Ng0KMzU4Ng0KY2F0OiByZWFkIGVycm9yOiBObyBz
dWNoIGRldmljZSBvciBhZGRyZXNzDQpjYXQ6IHJlYWQgZXJyb3I6IE5vIHN1Y2ggZGV2aWNlIG9y
IGFkZHJlc3MNCjMzMjANCjMzMjANCjM1ODYNCjM1ODYNCjY2NDENCjY2NDENCjQzODMNCjQzODMN
Cg0KRnVuZGFtZW50YWxseSBJIHRoaW5rIHRoaXMgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGZhY3Qg
dGhhdCB0aGUgTE04MSBpcyANCmFuIFNNQnVzIGRldmljZSBidXQgdGhlIFQyMDgwIChhbmQgb3Ro
ZXIgRnJlZXNjYWxlIFNvQ3MpIHVzZXMgaTJjIGFuZCB3ZSANCmVtdWxhdGUgU01CdXMuIEkgc3Vz
cGVjdCB0aGUgZXJyYW50IHJlYWRpbmdzIGFyZSB3aGVuIHdlIGRvbid0IGdldCByb3VuZCANCnRv
IGNvbXBsZXRpbmcgdGhlIHJlYWQgd2l0aGluIHRoZSB0aW1lb3V0IHNwZWNpZmllZCBieSB0aGUg
U01CdXMgDQpzcGVjaWZpY2F0aW9uLiBEZXBlbmRpbmcgb24gd2hlbiB0aGF0IGhhcHBlbnMgd2Ug
ZWl0aGVyIGZhaWwgdGhlIA0KdHJhbnNmZXIgb3IgaW50ZXJwcmV0IHRoZSByZXN1bHQgYXMgYWxs
LTFzLg0KDQpbMF0gLSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9jcGFja2hhbS82MzU2YTNhOTQz
YWNjZWJiMjI4MTM1ZGMxMGRhZjcyMQ0KWzFdIC0gaHR0cHM6Ly93d3cudGkuY29tL2xpdC9kcy9z
eW1saW5rL2xtODEucGRmDQo=
