Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1D3778A1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 23:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdcMX5bj1z308Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=LqJ4eS3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=LqJ4eS3l; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdcM36klyz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 07:11:59 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2423284488;
 Mon, 10 May 2021 09:11:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1620594718;
 bh=rn/0A/r/J6ZWS5aVYOqR6TkTM48PGy18wlDfWtSu1Lc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=LqJ4eS3l2DIeiqsYn1+6fw3gM6LO1WRCZrmEb6phyHlODb5YhHf8TW27mGJ64XdJB
 dKNkQOXF5V1/uxkB4dfk9RGHpnDTC9eKZdG2xohfRvUGgJ3mCVKk2k01U4ioccXHvZ
 8hCldqh7II58JCoGIei+viH1RsLCAcwwMPGp8+sYuxRnJIarXuZxJapCwFyA26tN0/
 hClhtRe+DW9GreQREl2XKfdxMclxt79c/0TD4UbyT5mPNWcs21DakprdkkhUyDee55
 lwr6MMUqngXIekyTVDStspsuehwsmMRxJl/UjlWLzgRfT3uu7TkpSAGUSs7HT3NMsT
 UAgMmh0m7bJjA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B6098501e0000>; Mon, 10 May 2021 09:11:58 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 10 May 2021 09:11:57 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Mon, 10 May 2021 09:11:57 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "wsa@kernel.org" <wsa@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] powerpc/fsl: set fsl, i2c-erratum-a004447 flag for
 P2041 i2c controllers
Thread-Topic: [PATCH v2 2/3] powerpc/fsl: set fsl, i2c-erratum-a004447 flag
 for P2041 i2c controllers
Thread-Index: AQHXQxekK+B1aNGwTkeVt4NR0C48BKrW5YEAgAP7CIA=
Date: Sun, 9 May 2021 21:11:57 +0000
Message-ID: <aac3f1d2-adba-a77a-3d87-551b073223d4@alliedtelesis.co.nz>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-3-chris.packham@alliedtelesis.co.nz>
 <5e625652e3f980b7cd9fb86fe3d66f19a2f4201d.camel@infinera.com>
 <cc8d990216e159ee1dd463511d538baf9a6cad1b.camel@infinera.com>
In-Reply-To: <cc8d990216e159ee1dd463511d538baf9a6cad1b.camel@infinera.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6519C62164E51B44BCCC23813DB2230F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=lLZmtIKjAAAA:8 a=LAbSoUkVWqnkK6biDCsA:9
 a=QEXdDO2ut3YA:10 a=q5Nj8NTjyn2D8kUwajRn:22
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiA3LzA1LzIxIDg6MjQgcG0sIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIEZyaSwg
MjAyMS0wNS0wNyBhdCAxMDowNCArMDIwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4+IE9u
IEZyaSwgMjAyMS0wNS0wNyBhdCAxMjo0MCArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+
PiBUaGUgaTJjIGNvbnRyb2xsZXJzIG9uIHRoZSBQMjA0MC9QMjA0MSBoYXZlIGFuIGVycmF0dW0g
d2hlcmUgdGhlDQo+Pj4gZG9jdW1lbnRlZCBzY2hlbWUgZm9yIGkyYyBidXMgcmVjb3Zlcnkgd2ls
bCBub3Qgd29yayAoQS0wMDQ0NDcpLiBBDQo+Pj4gZGlmZmVyZW50IG1lY2hhbmlzbSBpcyBuZWVk
ZWQgd2hpY2ggaXMgZG9jdW1lbnRlZCBpbiB0aGUgUDIwNDAgQ2hpcA0KPj4+IEVycmF0YSBSZXYg
USAobGF0ZXN0IGF2YWlsYWJsZSBhdCB0aGUgdGltZSBvZiB3cml0aW5nKS4NCj4+ICBGcm9tIHdo
YXQgSSBjYW4gdGVsbCB0aGlzIEVycmF0dW0gYWxzbyBhcHBsaWVzIHRvIFAxMDEwDQpXaWxsIGFk
ZCBmb3IgdjMuDQo+PiAgwqBKb2NrZQ0KPiBSZWZlcmVuY2U6IGh0dHBzOi8vbWVkaWEuZGlnaWtl
eS5jb20vcGRmL1BDTnMvRnJlZXNjYWxlL1AxMDEwQ0VfUmV2TC5wZGYNCj4NCj4gQWxzbywgSSB0
aGluayB0aGlzIHNlcmllcyBzaG91bGQgZ28gdG8gc3RhYmxlLg0KVGhpcyBzZXJpZXMgYnVpbGRz
IG9uIGNoYW5nZXMgdGhhdCBoYXZlIGJlZW4gbWVyZ2VkIGZvciB2NS4xMy4gSSBoYXZlbid0IA0K
Y2hlY2tlZCBpZiBpdCBhcHBsaWVzIHRvIHN0YWJsZSwgSSB0aGluayBhdCBsZWFzdCBjb21taXQg
NjUxNzFiMmRmMTVlIA0KKCJpMmM6IG1wYzogTWFrZSB1c2Ugb2YgaTJjX3JlY292ZXJfYnVzKCki
KSB3b3VsZCBuZWVkIHRvIGNvbWUgYWxvbmcgDQp3aXRoIGl0Lg==
