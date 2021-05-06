Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751EF375D04
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 23:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbnRm2VdZz3bsM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 07:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=12DdoIX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=12DdoIX8; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FblwF6tjjz302W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 06:45:49 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4CC08806B6;
 Fri,  7 May 2021 08:45:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1620333941;
 bh=no9O516gKKwJz48WN3hE2S94MgCeVTrgOKlpuvYHC60=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=12DdoIX8Dl6Y2LeTFmOm+uJiVjuAt0uoaJi69m35QLbLEjsf7ajrUI8xw3shliOGr
 frfL6Z7eJt1zok0v7Su6rp3l4oq7YZkgv1v7kXu+9c/ArdRBMVb1FvFe/X4YRIBsfW
 q/aOoNeafPGYvlnXSF+HU0qm6tAj9jQ91T1eQKl4uQPgVo2vrAVK5orEHgHeiEqeMO
 hVfIxQsufQG6pkIwYwBb8W2bkaOD+LwfNMJGWtCFXg8iwKoxXM7TbqLxQx1opbE3wl
 fGvKi+geOeDSxfGYnZEmbP7wnO3o/ltA5NXXnOoDO7e7xnO1kGBu131sfzgbwhH/6U
 roM4Vrh6Opxrg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B609455660000>; Fri, 07 May 2021 08:45:26 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 May 2021 08:45:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Fri, 7 May 2021 08:45:26 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/3] i2c: mpc: implement erratum A-004447 workaround
Thread-Topic: [PATCH 3/3] i2c: mpc: implement erratum A-004447 workaround
Thread-Index: AQHXQhSWHVZw/v9uEUaiuX94nSff16rVTz8AgADU6QA=
Date: Thu, 6 May 2021 20:45:26 +0000
Message-ID: <1c050ce0-2a02-41bd-a614-54d34dd4c377@alliedtelesis.co.nz>
References: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
 <20210506011015.17347-4-chris.packham@alliedtelesis.co.nz>
 <CAHp75VecRQT4zzzcQBJ6vsfNEWhj8T3f9VRNd8mDrwNee2kamA@mail.gmail.com>
In-Reply-To: <CAHp75VecRQT4zzzcQBJ6vsfNEWhj8T3f9VRNd8mDrwNee2kamA@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: multipart/alternative;
 boundary="_000_1c050ce02a0241bda61454d34dd4c377alliedtelesisconz_"
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=5FLXtPjwQuUA:10 a=kZi1GkTeAAAA:8 a=V4hm_rfxOLB00DjJrUMA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10 a=pGLkceISAAAA:8 a=fd11ak8lFgr4XfuzNZ0A:9
 a=_iNWTuv_yEK8XE1g:21 a=_W_S_7VecoQA:10 a=rVnDm9A_-c-k2ki-JAcA:9
 a=IflfE9mlhNY8QBIU3euP:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-SEG-SpamProfiler-Score: 0
X-Mailman-Approved-At: Fri, 07 May 2021 07:53:51 +1000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_1c050ce02a0241bda61454d34dd4c377alliedtelesisconz_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiA2LzA1LzIxIDg6MDMgcG0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCg0KDQpPbiBUaHVy
c2RheSwgTWF5IDYsIDIwMjEsIENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uejxtYWlsdG86Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pj4gd3Jv
dGU6DQpUaGUgUDIwNDAvUDIwNDEgaGFzIGFuIGVycmF0dW0gd2hlcmUgdGhlIG5vcm1hbCBpMmMg
cmVjb3ZlcnkgbWVjaGFuaXNtDQpkb2VzIG5vdCB3b3JrLiBJbXBsZW1lbnQgdGhlIGFsdGVybmF0
aXZlIHJlY292ZXJ5IG1lY2hhbmlzbSBkb2N1bWVudGVkDQppbiB0aGUgUDIwNDAgQ2hpcCBFcnJh
dGEgUmV2IFEuDQoNClNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uejxtYWlsdG86Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNv
Lm56Pj4NCi0tLQ0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgfCA4OCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbXBjLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQppbmRleCAzMGQ5ZTg5YTNk
YjIuLjA1MmUzNzcxODc3MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBj
LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCkBAIC00NSw2ICs0NSw3IEBA
DQogI2RlZmluZSBDQ1JfTVRYICAweDEwDQogI2RlZmluZSBDQ1JfVFhBSyAweDA4DQogI2RlZmlu
ZSBDQ1JfUlNUQSAweDA0DQorI2RlZmluZSBDQ1JfUlNWRCAweDAyDQoNCiAjZGVmaW5lIENTUl9N
Q0YgIDB4ODANCiAjZGVmaW5lIENTUl9NQUFTIDB4NDANCkBAIC05Nyw3ICs5OCw3IEBAIHN0cnVj
dCBtcGNfaTJjIHsNCiAgICAgICAgdTMyIGJsb2NrOw0KICAgICAgICBpbnQgcmM7DQogICAgICAg
IGludCBleHBlY3RfcnhhY2s7DQotDQorICAgICAgIGJvb2wgaGFzX2VycmF0YV9BMDA0NDQ3Ow0K
IH07DQoNCiBzdHJ1Y3QgbXBjX2kyY19kaXZpZGVyIHsNCkBAIC0xMzYsNiArMTM3LDgzIEBAIHN0
YXRpYyB2b2lkIG1wY19pMmNfZml4dXAoc3RydWN0IG1wY19pMmMgKmkyYykNCiAgICAgICAgfQ0K
IH0NCg0KK3N0YXRpYyBpbnQgaTJjX21wY193YWl0X3NyKHN0cnVjdCBtcGNfaTJjICppMmMsIGlu
dCBtYXNrKQ0KK3sNCisgICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0ID0gamlmZmllcyArIHVz
ZWNzX3RvX2ppZmZpZXMoMTAwKTsNCisgICAgICAgaW50IHJldCA9IDA7DQorDQorICAgICAgIHdo
aWxlICgocmVhZGIoaTJjLT5iYXNlICsgTVBDX0kyQ19TUikgJiBtYXNrKSA9PSAwKSB7DQorICAg
ICAgICAgICAgICAgaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW91dCkpIHsNCisgICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IC1FVElNRURPVVQ7DQorICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsNCisgICAgICAgICAgICAgICB9DQorICAgICAgICAgICAgICAgY29uZF9yZXNjaGVk
KCk7DQorICAgICAgIH0NCisNCisgICAgICAgcmV0dXJuIHJldDsNCit9DQoNCnJlYWRiX3BvbGxf
dGltZW91dCgpDQoNCg0KVGhhbmtzLiBJIGZpZ3VyZWQgdGhpcyBleGlzdGVkIEkgd2FzIGp1c3Qg
Z3JlcHBpbmcgZm9yIHdhaXRfLiogYW5kIGRpZG4ndCBmaW5kIGl0LiBJJ2xsIHByZXBhcmUgYSB2
MiBhbmQgZ2V0IGl0IG91dCBieSB0aGUgZW5kIG9mIG15IGRheS4NCg0KKw0KKy8qDQorICogV29y
a2Fyb3VuZCBmb3IgRXJyYXR1bSBBMDA0NDQ3LiBGcm9tIHRoZSBQMjA0MENFIFJldiBRDQorICoN
CisgKiAxLiAgU2V0IHVwIHRoZSBmcmVxdWVuY3kgZGl2aWRlciBhbmQgc2FtcGxpbmcgcmF0ZS4N
CisgKiAyLiAgSTJDQ1IgLSBhMGgNCisgKiAzLiAgUG9sbCBmb3IgSTJDU1JbTUJCXSB0byBnZXQg
c2V0Lg0KKyAqIDQuICBJZiBJMkNTUltNQUxdIGlzIHNldCAoYW4gaW5kaWNhdGlvbiB0aGF0IFNE
QSBpcyBzdHVjayBsb3cpLCB0aGVuIGdvIHRvDQorICogICAgIHN0ZXAgNS4gSWYgTUFMIGlzIG5v
dCBzZXQsIHRoZW4gZ28gdG8gc3RlcCAxMy4NCisgKiA1LiAgSTJDQ1IgLSAwMGgNCisgKiA2LiAg
STJDQ1IgLSAyMmgNCisgKiA3LiAgSTJDQ1IgLSBhMmgNCisgKiA4LiAgUG9sbCBmb3IgSTJDU1Jb
TUJCXSB0byBnZXQgc2V0Lg0KKyAqIDkuICBJc3N1ZSByZWFkIHRvIEkyQ0RSLg0KKyAqIDEwLiBQ
b2xsIGZvciBJMkNTUltNSUZdIHRvIGJlIHNldC4NCisgKiAxMS4gSTJDQ1IgLSA4MmgNCisgKiAx
Mi4gV29ya2Fyb3VuZCBjb21wbGV0ZS4gU2tpcCB0aGUgbmV4dCBzdGVwcy4NCisgKiAxMy4gSXNz
dWUgcmVhZCB0byBJMkNEUi4NCisgKiAxNC4gUG9sbCBmb3IgSTJDU1JbTUlGXSB0byBiZSBzZXQu
DQorICogMTUuIEkyQ0NSIC0gODBoDQorICovDQorc3RhdGljIHZvaWQgbXBjX2kyY19maXh1cF9B
MDA0NDQ3KHN0cnVjdCBtcGNfaTJjICppMmMpDQorew0KKyAgICAgICBpbnQgcmV0Ow0KKyAgICAg
ICB1MzIgdmFsOw0KKw0KKyAgICAgICB3cml0ZWNjcihpMmMsIENDUl9NRU4gfCBDQ1JfTVNUQSk7
DQorICAgICAgIHJldCA9IGkyY19tcGNfd2FpdF9zcihpMmMsIENTUl9NQkIpOw0KKyAgICAgICBp
ZiAocmV0KSB7DQorICAgICAgICAgICAgICAgZGV2X2VycihpMmMtPmRldiwgInRpbWVvdXQgd2Fp
dGluZyBmb3IgQ1NSX01CQlxuIik7DQorICAgICAgICAgICAgICAgcmV0dXJuOw0KKyAgICAgICB9
DQorDQorICAgICAgIHZhbCA9IHJlYWRiKGkyYy0+YmFzZSArIE1QQ19JMkNfU1IpOw0KKw0KKyAg
ICAgICBpZiAodmFsICYgQ1NSX01BTCkgew0KKyAgICAgICAgICAgICAgIHdyaXRlY2NyKGkyYywg
MHgwMCk7DQorICAgICAgICAgICAgICAgd3JpdGVjY3IoaTJjLCBDQ1JfTVNUQSB8IENDUl9SU1ZE
KTsNCisgICAgICAgICAgICAgICB3cml0ZWNjcihpMmMsIENDUl9NRU4gfCBDQ1JfTVNUQSB8IEND
Ul9SU1ZEKTsNCisgICAgICAgICAgICAgICByZXQgPSBpMmNfbXBjX3dhaXRfc3IoaTJjLCBDU1Jf
TUJCKTsNCisgICAgICAgICAgICAgICBpZiAocmV0KSB7DQorICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGkyYy0+ZGV2LCAidGltZW91dCB3YWl0aW5nIGZvciBDU1JfTUJCXG4iKTsNCisg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCisgICAgICAgICAgICAgICB9DQorICAgICAg
ICAgICAgICAgdmFsID0gcmVhZGIoaTJjLT5iYXNlICsgTVBDX0kyQ19EUik7DQorICAgICAgICAg
ICAgICAgcmV0ID0gaTJjX21wY193YWl0X3NyKGkyYywgQ1NSX01JRik7DQorICAgICAgICAgICAg
ICAgaWYgKHJldCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihpMmMtPmRldiwg
InRpbWVvdXQgd2FpdGluZyBmb3IgQ1NSX01JRlxuIik7DQorICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm47DQorICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgIHdyaXRlY2NyKGky
YywgQ0NSX01FTiB8IENDUl9SU1ZEKTsNCisgICAgICAgfSBlbHNlIHsNCisgICAgICAgICAgICAg
ICB2YWwgPSByZWFkYihpMmMtPmJhc2UgKyBNUENfSTJDX0RSKTsNCisgICAgICAgICAgICAgICBy
ZXQgPSBpMmNfbXBjX3dhaXRfc3IoaTJjLCBDU1JfTUlGKTsNCisgICAgICAgICAgICAgICBpZiAo
cmV0KSB7DQorICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGkyYy0+ZGV2LCAidGltZW91
dCB3YWl0aW5nIGZvciBDU1JfTUlGXG4iKTsNCisgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
bjsNCisgICAgICAgICAgICAgICB9DQorICAgICAgICAgICAgICAgd3JpdGVjY3IoaTJjLCBDQ1Jf
TUVOKTsNCisgICAgICAgfQ0KK30NCisNCiAjaWYgZGVmaW5lZChDT05GSUdfUFBDX01QQzUyeHgp
IHx8IGRlZmluZWQoQ09ORklHX1BQQ19NUEM1MTJ4KQ0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXBj
X2kyY19kaXZpZGVyIG1wY19pMmNfZGl2aWRlcnNfNTJ4eFtdID0gew0KICAgICAgICB7MjAsIDB4
MjB9LCB7MjIsIDB4MjF9LCB7MjQsIDB4MjJ9LCB7MjYsIDB4MjN9LA0KQEAgLTY3MCw3ICs3NDgs
MTAgQEAgc3RhdGljIGludCBmc2xfaTJjX2J1c19yZWNvdmVyeShzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmFkYXApDQogew0KICAgICAgICBzdHJ1Y3QgbXBjX2kyYyAqaTJjID0gaTJjX2dldF9hZGFwZGF0
YShhZGFwKTsNCg0KLSAgICAgICBtcGNfaTJjX2ZpeHVwKGkyYyk7DQorICAgICAgIGlmIChpMmMt
Pmhhc19lcnJhdGFfQTAwNDQ0NykNCisgICAgICAgICAgICAgICBtcGNfaTJjX2ZpeHVwX0EwMDQ0
NDcoaTJjKTsNCisgICAgICAgZWxzZQ0KKyAgICAgICAgICAgICAgIG1wY19pMmNfZml4dXAoaTJj
KTsNCg0KICAgICAgICByZXR1cm4gMDsNCiB9DQpAQCAtNzY3LDYgKzg0OCw5IEBAIHN0YXRpYyBp
bnQgZnNsX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCiAgICAgICAgfQ0K
ICAgICAgICBkZXZfaW5mbyhpMmMtPmRldiwgInRpbWVvdXQgJXUgdXNcbiIsIG1wY19vcHMudGlt
ZW91dCAqIDEwMDAwMDAgLyBIWik7DQoNCisgICAgICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChvcC0+ZGV2Lm9mX25vZGUsICJmc2wsaTJjLWVycmF0dW0tYTAwNDQ0NyIpKQ0KKyAgICAgICAg
ICAgICAgIGkyYy0+aGFzX2VycmF0YV9BMDA0NDQ3ID0gdHJ1ZTsNCisNCiAgICAgICAgaTJjLT5h
ZGFwID0gbXBjX29wczsNCiAgICAgICAgc2NucHJpbnRmKGkyYy0+YWRhcC5uYW1lPGh0dHA6Ly9h
ZGFwLm5hbWU+LCBzaXplb2YoaTJjLT5hZGFwLm5hbWU8aHR0cDovL2FkYXAubmFtZT4pLA0KICAg
ICAgICAgICAgICAgICAgIk1QQyBhZGFwdGVyICglcykiLCBvZl9ub2RlX2Z1bGxfbmFtZShvcC0+
ZGV2Lm9mX25vZGUpKTsNCi0tDQoyLjMxLjENCg0KDQoNCi0tDQpXaXRoIEJlc3QgUmVnYXJkcywN
CkFuZHkgU2hldmNoZW5rbw0KDQoNCg==

--_000_1c050ce02a0241bda61454d34dd4c377alliedtelesisconz_
Content-Type: text/html; charset="utf-8"
Content-ID: <07D7C1ECDC31394B9C09BA033985195E@atlnz.lc>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPHA+PGJyPg0KPC9w
Pg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA2LzA1LzIxIDg6MDMgcG0sIEFuZHkg
U2hldmNoZW5rbyB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNp
dGU9Im1pZDpDQUhwNzVWZWNSUVQ0enp6Y1FCSjZ2c2ZORVdoajhUM2Y5VlJOZDhtRHJ3TmVlMmth
bUFAbWFpbC5nbWFpbC5jb20iPg0KPGJyPg0KPGJyPg0KT24gVGh1cnNkYXksIE1heSA2LCAyMDIx
LCBDaHJpcyBQYWNraGFtICZsdDs8YSBocmVmPSJtYWlsdG86Y2hyaXMucGFja2hhbUBhbGxpZWR0
ZWxlc2lzLmNvLm56IiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmNocmlzLnBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uejwvYT4mZ3Q7IHdyb3RlOjxicj4NCjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMA0KICAgICAgICAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KVGhlIFAyMDQwL1AyMDQxIGhhcyBhbiBl
cnJhdHVtIHdoZXJlIHRoZSBub3JtYWwgaTJjIHJlY292ZXJ5IG1lY2hhbmlzbTxicj4NCmRvZXMg
bm90IHdvcmsuIEltcGxlbWVudCB0aGUgYWx0ZXJuYXRpdmUgcmVjb3ZlcnkgbWVjaGFuaXNtIGRv
Y3VtZW50ZWQ8YnI+DQppbiB0aGUgUDIwNDAgQ2hpcCBFcnJhdGEgUmV2IFEuPGJyPg0KPGJyPg0K
U2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5ueiIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5jaHJpcy5w
YWNraGFtQGFsbGllZHRlbGVzaXMuPHdicj5jby5uejwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KJm5i
c3A7ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDg4ICYjNDM7JiM0MzsmIzQzOyYjNDM7
JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYj
NDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQz
OyYjNDM7JiM0MzsmIzQzOzx3YnI+JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOy08YnI+DQombmJz
cDsxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygmIzQzOyksIDIgZGVsZXRpb25zKC0pPGJy
Pg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jPGJyPg0KaW5kZXggMzBkOWU4OWEzZGIyLi4wNTJlMzc3
MTg3NzEgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYzxicj4N
CiYjNDM7JiM0MzsmIzQzOyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmM8YnI+DQpAQCAt
NDUsNiAmIzQzOzQ1LDcgQEA8YnI+DQombmJzcDsjZGVmaW5lIENDUl9NVFgmbmJzcDsgMHgxMDxi
cj4NCiZuYnNwOyNkZWZpbmUgQ0NSX1RYQUsgMHgwODxicj4NCiZuYnNwOyNkZWZpbmUgQ0NSX1JT
VEEgMHgwNDxicj4NCiYjNDM7I2RlZmluZSBDQ1JfUlNWRCAweDAyPGJyPg0KPGJyPg0KJm5ic3A7
I2RlZmluZSBDU1JfTUNGJm5ic3A7IDB4ODA8YnI+DQombmJzcDsjZGVmaW5lIENTUl9NQUFTIDB4
NDA8YnI+DQpAQCAtOTcsNyAmIzQzOzk4LDcgQEAgc3RydWN0IG1wY19pMmMgezxicj4NCiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB1MzIgYmxvY2s7PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IGludCByYzs8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaW50IGV4
cGVjdF9yeGFjazs8YnI+DQotPGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDti
b29sIGhhc19lcnJhdGFfQTAwNDQ0Nzs8YnI+DQombmJzcDt9Ozxicj4NCjxicj4NCiZuYnNwO3N0
cnVjdCBtcGNfaTJjX2RpdmlkZXIgezxicj4NCkBAIC0xMzYsNiAmIzQzOzEzNyw4MyBAQCBzdGF0
aWMgdm9pZCBtcGNfaTJjX2ZpeHVwKHN0cnVjdCBtcGNfaTJjICppMmMpPGJyPg0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IH08YnI+DQombmJzcDt9PGJyPg0KPGJyPg0KJiM0MztzdGF0aWMg
aW50IGkyY19tcGNfd2FpdF9zcihzdHJ1Y3QgbXBjX2kyYyAqaTJjLCBpbnQgbWFzayk8YnI+DQom
IzQzO3s8YnI+DQomIzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3Vuc2lnbmVkIGxvbmcg
dGltZW91dCA9IGppZmZpZXMgJiM0MzsgdXNlY3NfdG9famlmZmllcygxMDApOzxicj4NCiYjNDM7
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7aW50IHJldCA9IDA7PGJyPg0KJiM0Mzs8YnI+DQom
IzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3doaWxlICgocmVhZGIoaTJjLSZndDtiYXNl
ICYjNDM7IE1QQ19JMkNfU1IpICZhbXA7IG1hc2spID09IDApIHs8YnI+DQomIzQzOyZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtpZiAodGltZV9h
ZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkgezxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDtyZXQgPSAtRVRJTUVET1VUOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDticmVhazs8YnI+DQomIzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDt9PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7Y29uZF9yZXNjaGVkKCk7PGJyPg0KJiM0MzsmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt9PGJyPg0KJiM0Mzs8YnI+DQomIzQzOyZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO3JldHVybiByZXQ7PGJyPg0KJiM0Mzt9PC9ibG9ja3F1b3RlPg0KPGRp
dj48YnI+DQo8L2Rpdj4NCjxkaXY+cmVhZGJfcG9sbF90aW1lb3V0KCk8L2Rpdj4NCjxkaXY+Jm5i
c3A7PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8cD5UaGFua3MuIEkgZmlndXJlZCB0aGlzIGV4aXN0
ZWQgSSB3YXMganVzdCBncmVwcGluZyBmb3Igd2FpdF8uKiBhbmQgZGlkbid0IGZpbmQgaXQuIEkn
bGwgcHJlcGFyZSBhIHYyIGFuZCBnZXQgaXQgb3V0IGJ5IHRoZSBlbmQgb2YgbXkgZGF5Ljxicj4N
CjwvcD4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpDQUhwNzVWZWNSUVQ0enp6
Y1FCSjZ2c2ZORVdoajhUM2Y5VlJOZDhtRHJ3TmVlMmthbUFAbWFpbC5nbWFpbC5jb20iPg0KPGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwDQogICAgICAg
IC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQomIzQz
Ozxicj4NCiYjNDM7Lyo8YnI+DQomIzQzOyAqIFdvcmthcm91bmQgZm9yIEVycmF0dW0gQTAwNDQ0
Ny4gRnJvbSB0aGUgUDIwNDBDRSBSZXYgUTxicj4NCiYjNDM7ICo8YnI+DQomIzQzOyAqIDEuJm5i
c3A7IFNldCB1cCB0aGUgZnJlcXVlbmN5IGRpdmlkZXIgYW5kIHNhbXBsaW5nIHJhdGUuPGJyPg0K
JiM0MzsgKiAyLiZuYnNwOyBJMkNDUiAtIGEwaDxicj4NCiYjNDM7ICogMy4mbmJzcDsgUG9sbCBm
b3IgSTJDU1JbTUJCXSB0byBnZXQgc2V0Ljxicj4NCiYjNDM7ICogNC4mbmJzcDsgSWYgSTJDU1Jb
TUFMXSBpcyBzZXQgKGFuIGluZGljYXRpb24gdGhhdCBTREEgaXMgc3R1Y2sgbG93KSwgdGhlbiBn
byB0bzxicj4NCiYjNDM7ICombmJzcDsgJm5ic3A7ICZuYnNwO3N0ZXAgNS4gSWYgTUFMIGlzIG5v
dCBzZXQsIHRoZW4gZ28gdG8gc3RlcCAxMy48YnI+DQomIzQzOyAqIDUuJm5ic3A7IEkyQ0NSIC0g
MDBoPGJyPg0KJiM0MzsgKiA2LiZuYnNwOyBJMkNDUiAtIDIyaDxicj4NCiYjNDM7ICogNy4mbmJz
cDsgSTJDQ1IgLSBhMmg8YnI+DQomIzQzOyAqIDguJm5ic3A7IFBvbGwgZm9yIEkyQ1NSW01CQl0g
dG8gZ2V0IHNldC48YnI+DQomIzQzOyAqIDkuJm5ic3A7IElzc3VlIHJlYWQgdG8gSTJDRFIuPGJy
Pg0KJiM0MzsgKiAxMC4gUG9sbCBmb3IgSTJDU1JbTUlGXSB0byBiZSBzZXQuPGJyPg0KJiM0Mzsg
KiAxMS4gSTJDQ1IgLSA4Mmg8YnI+DQomIzQzOyAqIDEyLiBXb3JrYXJvdW5kIGNvbXBsZXRlLiBT
a2lwIHRoZSBuZXh0IHN0ZXBzLjxicj4NCiYjNDM7ICogMTMuIElzc3VlIHJlYWQgdG8gSTJDRFIu
PGJyPg0KJiM0MzsgKiAxNC4gUG9sbCBmb3IgSTJDU1JbTUlGXSB0byBiZSBzZXQuPGJyPg0KJiM0
MzsgKiAxNS4gSTJDQ1IgLSA4MGg8YnI+DQomIzQzOyAqLzxicj4NCiYjNDM7c3RhdGljIHZvaWQg
bXBjX2kyY19maXh1cF9BMDA0NDQ3KHN0cnVjdCBtcGNfaTJjICppMmMpPGJyPg0KJiM0Mzt7PGJy
Pg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtpbnQgcmV0Ozxicj4NCiYjNDM7Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7dTMyIHZhbDs8YnI+DQomIzQzOzxicj4NCiYjNDM7Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7d3JpdGVjY3IoaTJjLCBDQ1JfTUVOIHwgQ0NSX01TVEEp
Ozxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7cmV0ID0gaTJjX21wY193YWl0
X3NyKGkyYywgQ1NSX01CQik7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtp
ZiAocmV0KSB7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ZGV2X2VycihpMmMtJmd0O2RldiwgJnF1b3Q7dGltZW91dCB3YWl0
aW5nIGZvciBDU1JfTUJCXG4mcXVvdDspOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3JldHVybjs8YnI+DQomIzQzOyZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwO308YnI+DQomIzQzOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7dmFsID0gcmVhZGIoaTJjLSZndDtiYXNlICYjNDM7IE1QQ19JMkNfU1Ip
Ozxicj4NCiYjNDM7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtpZiAodmFs
ICZhbXA7IENTUl9NQUwpIHs8YnI+DQomIzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt3cml0ZWNjcihpMmMsIDB4MDApOzxicj4NCiYjNDM7
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3dy
aXRlY2NyKGkyYywgQ0NSX01TVEEgfCBDQ1JfUlNWRCk7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7d3JpdGVjY3IoaTJjLCBD
Q1JfTUVOIHwgQ0NSX01TVEEgfCBDQ1JfUlNWRCk7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7cmV0ID0gaTJjX21wY193YWl0
X3NyKGkyYywgQ1NSX01CQik7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7aWYgKHJldCkgezxicj4NCiYjNDM7Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDtkZXZfZXJyKGkyYy0mZ3Q7ZGV2LCAmcXVvdDt0aW1lb3V0IHdhaXRp
bmcgZm9yIENTUl9NQkJcbiZxdW90Oyk7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwO3JldHVybjs8YnI+DQomIzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDt9PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7dmFsID0gcmVhZGIoaTJjLSZndDtiYXNlICYj
NDM7IE1QQ19JMkNfRFIpOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3JldCA9IGkyY19tcGNfd2FpdF9zcihpMmMsIENTUl9N
SUYpOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwO2lmIChyZXQpIHs8YnI+DQomIzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ZGV2X2VycihpMmMtJmd0O2RldiwgJnF1b3Q7dGltZW91dCB3YWl0aW5nIGZvciBDU1JfTUlG
XG4mcXVvdDspOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtyZXR1cm47PGJy
Pg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7fTxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO3dyaXRlY2NyKGkyYywgQ0NSX01FTiB8IENDUl9SU1ZEKTs8YnI+DQom
IzQzOyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO30gZWxzZSB7PGJyPg0KJiM0MzsmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7dmFsID0gcmVh
ZGIoaTJjLSZndDtiYXNlICYjNDM7IE1QQ19JMkNfRFIpOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3JldCA9IGkyY19tcGNf
d2FpdF9zcihpMmMsIENTUl9NSUYpOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2lmIChyZXQpIHs8YnI+DQomIzQzOyZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ZGV2X2VycihpMmMtJmd0O2RldiwgJnF1b3Q7dGltZW91dCB3
YWl0aW5nIGZvciBDU1JfTUlGXG4mcXVvdDspOzxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDtyZXR1cm47PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fTxicj4NCiYjNDM7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3dyaXRlY2NyKGkyYywgQ0NSX01FTik7
PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt9PGJyPg0KJiM0Mzt9PGJyPg0K
JiM0Mzs8YnI+DQombmJzcDsjaWYgZGVmaW5lZChDT05GSUdfUFBDX01QQzUyeHgpIHx8IGRlZmlu
ZWQoQ09ORklHX1BQQ19NUEM1MTJ4KTxicj4NCiZuYnNwO3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXBj
X2kyY19kaXZpZGVyIG1wY19pMmNfZGl2aWRlcnNfNTJ4eFtdID0gezxicj4NCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyB7MjAsIDB4MjB9LCB7MjIsIDB4MjF9LCB7MjQsIDB4MjJ9LCB7MjYs
IDB4MjN9LDxicj4NCkBAIC02NzAsNyAmIzQzOzc0OCwxMCBAQCBzdGF0aWMgaW50IGZzbF9pMmNf
YnVzX3JlY292ZXJ5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCk8YnI+DQombmJzcDt7PGJyPg0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHN0cnVjdCBtcGNfaTJjICppMmMgPSBpMmNfZ2V0
X2FkYXBkYXRhKGFkYXApOzxicj4NCjxicj4NCi0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtt
cGNfaTJjX2ZpeHVwKGkyYyk7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtp
ZiAoaTJjLSZndDtoYXNfZXJyYXRhX0EwMDQ0NDcpPGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7bXBjX2kyY19maXh1cF9BMDA0
NDQ3KGkyYyk7PGJyPg0KJiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtlbHNlPGJyPg0K
JiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7bXBjX2kyY19maXh1cChpMmMpOzxicj4NCjxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyByZXR1cm4gMDs8YnI+DQombmJzcDt9PGJyPg0KQEAgLTc2Nyw2ICYjNDM7ODQ4LDkgQEAg
c3RhdGljIGludCBmc2xfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKTxicj4N
CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB9PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IGRldl9pbmZvKGkyYy0mZ3Q7ZGV2LCAmcXVvdDt0aW1lb3V0ICV1IHVzXG4mcXVvdDss
IG1wY19vcHMudGltZW91dCAqIDEwMDAwMDAgLyBIWik7PGJyPg0KPGJyPg0KJiM0MzsmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDtpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG9wLSZndDs8d2Jy
PmRldi5vZl9ub2RlLCAmcXVvdDtmc2wsaTJjLWVycmF0dW0tYTAwNDQ0NyZxdW90OykpPGJyPg0K
JiM0MzsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7aTJjLSZndDtoYXNfZXJyYXRhX0EwMDQ0NDcgPSB0cnVlOzxicj4NCiYjNDM7PGJyPg0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IGkyYy0mZ3Q7YWRhcCA9IG1wY19vcHM7PGJyPg0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHNjbnByaW50ZihpMmMtJmd0OzxhIGhyZWY9Imh0dHA6
Ly9hZGFwLm5hbWUiIHRhcmdldD0iX2JsYW5rIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmFkYXAu
bmFtZTwvYT4sIHNpemVvZihpMmMtJmd0OzxhIGhyZWY9Imh0dHA6Ly9hZGFwLm5hbWUiIHRhcmdl
dD0iX2JsYW5rIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmFkYXAubmFtZTwvYT4pLDxicj4NCiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZxdW90O01QQyBhZGFwdGVyICglcykmcXVvdDssIG9mX25vZGVfZnVsbF9uYW1lKG9wLSZn
dDtkZXYub2ZfPHdicj5ub2RlKSk7PGJyPg0KLS0gPGJyPg0KMi4zMS4xPGJyPg0KPGJyPg0KPC9i
bG9ja3F1b3RlPg0KPGJyPg0KPGJyPg0KLS0gPGJyPg0KV2l0aCBCZXN0IFJlZ2FyZHMsPGJyPg0K
QW5keSBTaGV2Y2hlbmtvPGJyPg0KPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0K
PC9odG1sPg0K

--_000_1c050ce02a0241bda61454d34dd4c377alliedtelesisconz_--
