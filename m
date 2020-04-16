Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF911AD1E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 23:30:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493C7D0G7FzDwND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=Jlux2HqC; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493C500ynYzDscM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 07:28:19 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 695F280237;
 Fri, 17 Apr 2020 09:28:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1587072496;
 bh=PbB4ou7PO5+THw+bx+oHN8/DciTud8oA+xxf15+y1SM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=Jlux2HqCOLS4af3/I+mGcnLJElBGnoRDC+IMOouYEMCLp9S/C6DaTB7Z80N5MIAQU
 FZUBUruq+zI+OyvOJJzVoVugg5Nqud+Hqm+9NWZr3YgoP5+k/HqRrv9WX3LbTaXPSl
 vskrr4P/WHarB0lsD6qfRyQQv+0CtcpCGGswNU2hfK5DY88O5WenJX2fubHEj8GiIc
 2byyYnExTEqxwe0erWb+Y0D922rF1jWgeu0HLbpur6k6dtsjeaBLP6qzaxFEjaVZTg
 v5SjY4RsQsgd9v+u6KSHIJK2ZSaD+y1Jx+m5qfivRc+Um5XV5r7clXiKZ+ZYhouhtK
 PgpdqJAj+BT7A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e98cdef0000>; Fri, 17 Apr 2020 09:28:15 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 17 Apr 2020 09:28:16 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Fri, 17 Apr 2020 09:28:16 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "oss@buserror.net"
 <oss@buserror.net>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Thread-Topic: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Thread-Index: AQHWAlQjUst7lNY0iUusXBl8ThU16Kh6g10AgAB3MQCAAKN/gA==
Date: Thu, 16 Apr 2020 21:28:15 +0000
Message-ID: <4d84f89aa682dc78bc0d3a8df2f14b0452465da4.camel@alliedtelesis.co.nz>
References: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
 <20200325031854.7625-1-chris.packham@alliedtelesis.co.nz>
 <343c0e8b01ab74481e0b8dfbe588b1c84127a487.camel@alliedtelesis.co.nz>
 <87tv1jirlj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tv1jirlj.fsf@mpe.ellerman.id.au>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <75AAF93CAFA3014AA38E4311E77144F3@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIwLTA0LTE2IGF0IDIxOjQzICsxMDAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdy
aXRlczoNCj4gPiBIaSBBbGwsDQo+ID4gDQo+ID4gT24gV2VkLCAyMDIwLTAzLTI1IGF0IDE2OjE4
ICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+ID4gSWYge2ksZH0tY2FjaGUtYmxvY2st
c2l6ZSBpcyBzZXQgYW5kIHtpLGR9LWNhY2hlLWxpbmUtc2l6ZSBpcw0KPiA+ID4gbm90LA0KPiA+
ID4gdXNlDQo+ID4gPiB0aGUgYmxvY2stc2l6ZSB2YWx1ZSBmb3IgYm90aC4gUGVyIHRoZSBkZXZp
Y2V0cmVlIHNwZWMgY2FjaGUtDQo+ID4gPiBsaW5lLQ0KPiA+ID4gc2l6ZQ0KPiA+ID4gaXMgb25s
eSBuZWVkZWQgaWYgaXQgZGlmZmVycyBmcm9tIHRoZSBibG9jayBzaXplLg0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVz
aXMuY28ubno+DQo+ID4gPiAtLS0NCj4gPiA+IEl0IGxvb2tzIGFzIHRob3VnaCB0aGUgYnNpemVw
ID0gbHNpemVwIGlzIG5vdCByZXF1aXJlZCBwZXIgdGhlDQo+ID4gPiBzcGVjDQo+ID4gPiBidXQg
aXQncw0KPiA+ID4gcHJvYmFibHkgc2FmZXIgdG8gcmV0YWluIGl0Lg0KPiA+ID4gDQo+ID4gPiBD
aGFuZ2VzIGluIHYyOg0KPiA+ID4gLSBTY290dCBwb2ludGVkIG91dCB0aGF0IHUtYm9vdCBzaG91
bGQgYmUgZmlsbGluZyBpbiB0aGUgY2FjaGUNCj4gPiA+IHByb3BlcnRpZXMNCj4gPiA+ICAgKHdo
aWNoIGl0IGRvZXMpLiBCdXQgaXQgZG9lcyBub3Qgc3BlY2lmeSBhIGNhY2hlLWxpbmUtc2l6ZQ0K
PiA+ID4gYmVjYXVzZQ0KPiA+ID4gaXQNCj4gPiA+ICAgcHJvdmlkZXMgYSBjYWNoZS1ibG9jay1z
aXplIGFuZCB0aGUgc3BlYyBzYXlzIHlvdSBkb24ndCBoYXZlIHRvDQo+ID4gPiBpZg0KPiA+ID4g
dGhleSBhcmUNCj4gPiA+ICAgdGhlIHNhbWUuIFNvIHRoZSBlcnJvciBpcyBpbiB0aGUgcGFyc2lu
ZyBub3QgaW4gdGhlIGRldmljZXRyZWUNCj4gPiA+IGl0c2VsZi4NCj4gPiA+IA0KPiA+IA0KPiA+
IFBpbmc/IFRoaXMgdGhyZWFkIHdlbnQga2luZCBvZiBxdWlldC4NCj4gDQo+IEkgcmVwbGllZCBp
biB0aGUgb3RoZXIgdGhyZWFkOg0KPiANCj4gICANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXhwcGMtZGV2Lzg3MzY5eHg5OXUuZnNmQG1wZS5lbGxlcm1hbi5pZC5hdS8NCj4gDQo+IEJ1
dCB0aGVuIHRoZSBtZXJnZSB3aW5kb3cgaGFwcGVuZWQgd2hpY2ggaXMgYSBidXN5IHRpbWUuDQo+
IA0KDQpZZWFoIEkgZmlndXJlZCB0aGF0IHdhcyB0aGUgY2FzZS4NCg0KPiBXaGF0IEknZCByZWFs
bHkgbGlrZSBpcyBhIHYzIHRoYXQgaW5jb3Jwb3JhdGVzIHRoZSBpbmZvIEkgd3JvdGUgaW4NCj4g
dGhlDQo+IG90aGVyIHRocmVhZCBhbmQgYSBGaXhlcyB0YWcuDQo+IA0KPiBJZiB5b3UgZmVlbCBs
aWtlIGRvaW5nIHRoYXQsIHRoYXQgd291bGQgYmUgZ3JlYXQuIE90aGVyd2lzZSBJJ2xsIGRvDQo+
IGl0DQo+IHRvbW9ycm93Lg0KDQpJJ2xsIHJlYmFzZSBhZ2FpbnN0IExpbnVzJ3MgdHJlZSBhbmQg
aGF2ZSBhIGdvIGEgYWRkaW5nIHNvbWUgbW9yZSB3b3Jkcw0KdG8gdGhlIGNvbW1pdCBtZXNzYWdl
Lg0KDQo+IA0KPiBjaGVlcnMNCg==
