Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B72251B14F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:44:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktr2V1pnTz3byX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 07:44:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=kAucNGnP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=kAucNGnP; 
 dkim-atps=neutral
X-Greylist: delayed 392 seconds by postgrey-1.36 at boromir;
 Thu, 05 May 2022 07:36:17 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktqrx6nS1z2ymf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 07:36:17 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 458A22C022A;
 Wed,  4 May 2022 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1651699777;
 bh=UEhiOk6leN6EMoJVBVMjmnwY1G/YuszhEyimWxGue3g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kAucNGnPwlORw7jH6md5JCMUMQOcci47P8bkR4JcNe8ohuEXow6phtB2vFo5wIxiZ
 tQ9T2Px0xVmdJ2P3iU8URyrU6uF4YAZsoDYLYmKd9Z3rZFns+1Wi6qG38t2LAXTfU8
 Lu7iPybHNyV0+n/cvhKkHtBYQj1nTEOKLzD+4KIMdkcoix9RBqEDvT+FakappMJ7nV
 0GICsAIzXP1ksyTPJByjK3OYRfHc7+rk91vmZYcbFon3L4z1y+3h4YW8PP+KCS5ugw
 /06LB8C/LfIOJUCEXCKe5vUoiB3WGvyRt5KWZJNbDUux68Y51TUb4usAz2NFcsUf9u
 Z/j6xNmVgeJ+Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B6272f0410000>; Thu, 05 May 2022 09:29:37 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 5 May 2022 09:29:36 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.033; Thu, 5 May 2022 09:29:36 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Wolfram Sang <wsa@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, "David
 S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-ide@vger.kernel.org"
 <linux-ide@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "linux-can@vger.kernel.org"
 <linux-can@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v1 2/4] powerpc/mpc5xxx: Switch
 mpc5xxx_get_bus_frequency() to use fwnode
Thread-Topic: [PATCH v1 2/4] powerpc/mpc5xxx: Switch
 mpc5xxx_get_bus_frequency() to use fwnode
Thread-Index: AQHYX76hvhP3kWHGgUas4wrlaQB7da0Oc3MA
Date: Wed, 4 May 2022 21:29:36 +0000
Message-ID: <81d6f00b-7b93-715a-3264-f2c67c9e3620@alliedtelesis.co.nz>
References: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
 <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: multipart/alternative;
 boundary="_000_81d6f00b7b93715a3264f2c67c9e3620alliedtelesisconz_"
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7GXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=oZkIemNP1mAA:10 a=QyXUC8HyAAAA:8 a=hfv0c1pAhgQOO3EUg40A:9 a=QEXdDO2ut3YA:10
 a=dMrpmeaZNg0118eQ:21 a=_W_S_7VecoQA:10 a=rVnDm9A_-c-k2ki-JAcA:9
X-SEG-SpamProfiler-Score: 0
X-Mailman-Approved-At: Thu, 05 May 2022 07:43:59 +1000
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
Cc: Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Anatolij
 Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_81d6f00b7b93715a3264f2c67c9e3620alliedtelesisconz_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiA1LzA1LzIyIDAxOjQ0LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQoNClN3aXRjaCBtcGM1
eHh4X2dldF9idXNfZnJlcXVlbmN5KCkgdG8gdXNlIGZ3bm9kZSBpbiBvcmRlciB0byBoZWxwDQpj
bGVhbmluZyB1cCBvdGhlciBwYXJ0cyBvZiB0aGUga2VybmVsIGZyb20gT0Ygc3BlY2lmaWMgY29k
ZS4NCg0KTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQoNClNpZ25lZC1vZmYtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjxtYWlsdG86
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KLS0tDQogYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL21wYzV4eHguaCAgICAgICAgICAgIHwgIDkgKysrLQ0KIGFyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvNTJ4eC9tcGM1Mnh4X2dwdC5jICAgICB8ICAyICstDQogYXJjaC9wb3dlcnBjL3N5
c2Rldi9tcGM1eHh4X2Nsb2Nrcy5jICAgICAgICAgIHwgNDEgKysrKysrKysrKy0tLS0tLS0tLQ0K
IGRyaXZlcnMvYXRhL3BhdGFfbXBjNTJ4eC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstDQog
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyAgICAgICAgICAgICAgICAgIHwgIDcgKystLQ0K
IGRyaXZlcnMvbmV0L2Nhbi9tc2Nhbi9tcGM1eHh4X2Nhbi5jICAgICAgICAgICB8ICAyICstDQog
ZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2ZlY19tcGM1Mnh4LmMgIHwgIDIgKy0NCiAu
Li4vbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfbXBjNTJ4eF9waHkuYyAgfCAgMyArLQ0KIC4u
Li9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2ZzX2VuZXQvbWlpLWZlYy5jICB8ICA0ICstDQogZHJp
dmVycy9zcGkvc3BpLW1wYzUyeHguYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2
ZXJzL3R0eS9zZXJpYWwvbXBjNTJ4eF91YXJ0LmMgICAgICAgICAgICAgfCAgNCArLQ0KIDExIGZp
bGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KDQpBY2tlZC1i
eTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PjxtYWls
dG86Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PiAjIGZvciBpMmMtbXBjDQoNCg0K

--_000_81d6f00b7b93715a3264f2c67c9e3620alliedtelesisconz_
Content-Type: text/html; charset="utf-8"
Content-ID: <EE6DE46A91FCE846A5C057D95B9051CA@atlnz.lc>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPHA+PGJyPg0KPC9w
Pg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA1LzA1LzIyIDAxOjQ0LCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRl
PSJtaWQ6MjAyMjA1MDQxMzQ0NDkuNjQ0NzMtMi1hbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20iPg0KPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5Td2l0Y2ggbXBjNXh4
eF9nZXRfYnVzX2ZyZXF1ZW5jeSgpIHRvIHVzZSBmd25vZGUgaW4gb3JkZXIgdG8gaGVscA0KY2xl
YW5pbmcgdXAgb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbCBmcm9tIE9GIHNwZWNpZmljIGNvZGUu
DQoNCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbmR5
IFNoZXZjaGVua28gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSI+Jmx0O2FuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbSZndDs8L2E+DQotLS0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bXBjNXh4eC5oICAgICAgICAgICAgfCAgOSAmIzQzOyYjNDM7JiM0MzstDQogYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy81Mnh4L21wYzUyeHhfZ3B0LmMgICAgIHwgIDIgJiM0MzstDQogYXJjaC9wb3dl
cnBjL3N5c2Rldi9tcGM1eHh4X2Nsb2Nrcy5jICAgICAgICAgIHwgNDEgJiM0MzsmIzQzOyYjNDM7
JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzstLS0tLS0tLS0NCiBkcml2ZXJzL2F0
YS9wYXRhX21wYzUyeHguYyAgICAgICAgICAgICAgICAgICAgfCAgMiAmIzQzOy0NCiBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW1wYy5jICAgICAgICAgICAgICAgICAgfCAgNyAmIzQzOyYjNDM7LS0N
CiBkcml2ZXJzL25ldC9jYW4vbXNjYW4vbXBjNXh4eF9jYW4uYyAgICAgICAgICAgfCAgMiAmIzQz
Oy0NCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21wYzUyeHguYyAgfCAgMiAm
IzQzOy0NCiAuLi4vbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfbXBjNTJ4eF9waHkuYyAgfCAg
MyAmIzQzOy0NCiAuLi4vbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mc19lbmV0L21paS1mZWMuYyAg
fCAgNCAmIzQzOy0NCiBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC5jICAgICAgICAgICAgICAgICAg
ICAgfCAgMiAmIzQzOy0NCiBkcml2ZXJzL3R0eS9zZXJpYWwvbXBjNTJ4eF91YXJ0LmMgICAgICAg
ICAgICAgfCAgNCAmIzQzOy0NCiAxMSBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCYjNDM7
KSwgMzQgZGVsZXRpb25zKC0pPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIiB3cmFwPSIiPkFja2VkLWJ5OiA8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9u
b3NwYWNlIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMDtiYWNrZ3JvdW5kLWNvbG9yOiNmZmZm
ZmY7Ij5DaHJpcyBQYWNraGFtIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnoiPiZsdDtjaHJpcy5wYWNr
aGFtQGFsbGllZHRlbGVzaXMuY28ubnomZ3Q7PC9hPiAjIGZvciBpMmMtbXBjPC9zcGFuPg0KPC9z
cGFuPjwvcHJlPg0KPGJyPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_81d6f00b7b93715a3264f2c67c9e3620alliedtelesisconz_--
