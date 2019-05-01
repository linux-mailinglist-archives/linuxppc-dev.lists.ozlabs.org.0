Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5110558
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 07:52:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v6xN1HczzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 15:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-am5-obe.outbound.protection.outlook.com
 (client-ip=40.107.0.125; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="PGMIx8vl"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00125.outbound.protection.outlook.com [40.107.0.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v6w6142rzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 15:51:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejJuFEGbzgBZnKAAwr2rdBd9s9MNRdpYdxUzW5JraFk=;
 b=PGMIx8vl1Ck+FKHW8UUQ045pHW2+3kaepbqXMD9WdZj59JBcMd5rjf5LwjZOnwiQjOP3enMfUJIcK1U8j8XToJaDVZZw0A/rfgO01u/O6HX8dVfti715Z5Woapn7fW+XU9Cke5rhux0mS+U+vJ2IJw9ZDqu5APibGNGJWrYp8nA=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB0622.EURPRD10.PROD.OUTLOOK.COM (10.167.202.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 05:51:26 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 05:51:26 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 2/5] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Topic: [PATCH 2/5] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Index: AQHU/1m4QeMNIhRtn0+qXCERrOOPqqZU8QOAgADUGAA=
Date: Wed, 1 May 2019 05:51:26 +0000
Message-ID: <cb6a20d0-5ff1-8be9-5e3a-bd5c881dbae6@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-3-rasmus.villemoes@prevas.dk>
 <51b00425-58a7-089a-67a9-61cd315d5097@c-s.fr>
In-Reply-To: <51b00425-58a7-089a-67a9-61cd315d5097@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR08CA0049.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::20) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f06b4b5-3439-4e73-ebd2-08d6cdf90c5f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB0622; 
x-ms-traffictypediagnostic: VI1PR10MB0622:
x-microsoft-antispam-prvs: <VI1PR10MB06223A8BDE13838A09A142C38A3B0@VI1PR10MB0622.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39850400004)(346002)(396003)(376002)(136003)(189003)(199004)(6116002)(53936002)(386003)(14454004)(305945005)(6506007)(3846002)(71190400001)(71200400001)(25786009)(6512007)(186003)(66066001)(74482002)(102836004)(68736007)(44832011)(31686004)(6436002)(4326008)(76176011)(26005)(486006)(72206003)(7736002)(478600001)(6486002)(2906002)(6246003)(73956011)(316002)(52116002)(31696002)(2616005)(446003)(42882007)(8976002)(8936002)(476003)(66574012)(36756003)(8676002)(66946007)(81166006)(81156014)(99286004)(110136005)(66446008)(66556008)(5660300002)(64756008)(54906003)(229853002)(66476007)(256004)(14444005)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0622;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eYo0MsT8al9xsJICF9CwmggTVIR0ZIy+OM/wwN7Mr0Uda2WS/8RhLlx3Dc0sI+boxer+zKDFIU91HMxrPRfqGIPoW3n1cQ7PFkNLR/+VTyzHNJC/RKxVF2wL32SZQZLla/bGtjLBmLi6Z3vOQ9FCA9bAgGF1GrTdxQEDQr9ly5CQ1Obu0OfAclYzlgDArf/MtJEbuMJRosZwwdPY+MLEUznYcn5nJ+kwVLy6JiFl6QiAjLy/v0R3xeBSPoeepAg/X6/w44PxzNqSbotaXTZxQg+zlBpmJwVayseKp6Vag7vPHJa2x4mT2Vf0+18dIGGM7uOWK7WiM7vjyNUGbcCUKJBcfgcOJMTDAN2PDgoOg7ecIx8r3GVHAY99kG/sOtwlFKPE3da2nPq68gTbLH7KG8EjezpfRNaYJCbbvKUn6Ck=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC4588095BF224BBE921E82BA7899B2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f06b4b5-3439-4e73-ebd2-08d6cdf90c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 05:51:26.0889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0622
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
Cc: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMzAvMDQvMjAxOSAxOS4xMiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4gIA0KPiBMZSAz
MC8wNC8yMDE5IMOgIDE1OjM2LCBSYXNtdXMgVmlsbGVtb2VzIGEgw6ljcml0wqA6DQo+PiBUaGUg
Y3VycmVudCBhcnJheSBvZiBzdHJ1Y3QgcWVfc251bSB1c2UgMjU2KjQgYnl0ZXMgZm9yIGp1c3Qg
a2VlcGluZw0KPj4gdHJhY2sgb2YgdGhlIGZyZWUvdXNlZCBzdGF0ZSBvZiBlYWNoIGluZGV4LCBh
bmQgdGhlIHN0cnVjdCBsYXlvdXQNCj4+IG1lYW5zIHRoZXJlJ3MgYW5vdGhlciA3NjggYnl0ZXMg
b2YgcGFkZGluZy4gSWYgd2UganVzdCB1bnppcCB0aGF0DQo+PiBzdHJ1Y3R1cmUsIHRoZSBhcnJh
eSBvZiBzbnVtIHZhbHVlcyBqdXN0IHVzZSAyNTYgYnl0ZXMsIHdoaWxlIHRoZQ0KPj4gZnJlZS9p
bnVzZSBzdGF0ZSBjYW4gYmUgdHJhY2tlZCBpbiBhIDMyIGJ5dGUgYml0bWFwLg0KPj4NCj4+IFNv
IHRoaXMgcmVkdWNlcyB0aGUgLmRhdGEgZm9vdHByaW50IGJ5IDE3NjAgYnl0ZXMuIEl0IGFsc28g
c2VydmVzIGFzDQo+PiBwcmVwYXJhdGlvbiBmb3IgaW50cm9kdWNpbmcgYW5vdGhlciBEVCBiaW5k
aW5nIGZvciBzcGVjaWZ5aW5nIHRoZSBzbnVtDQo+PiB2YWx1ZXMuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMuZGs+DQo+PiAt
LS0NCj4+IC0NCj4+IMKgIC8qIFdlIGFsbG9jYXRlIHRoaXMgaGVyZSBiZWNhdXNlIGl0IGlzIHVz
ZWQgYWxtb3N0IGV4Y2x1c2l2ZWx5IGZvcg0KPj4gwqDCoCAqIHRoZSBjb21tdW5pY2F0aW9uIHBy
b2Nlc3NvciBkZXZpY2VzLg0KPj4gwqDCoCAqLw0KPj4gwqAgc3RydWN0IHFlX2ltbWFwIF9faW9t
ZW0gKnFlX2ltbXI7DQo+PiDCoCBFWFBPUlRfU1lNQk9MKHFlX2ltbXIpOw0KPj4gwqAgLXN0YXRp
YyBzdHJ1Y3QgcWVfc251bSBzbnVtc1tRRV9OVU1fT0ZfU05VTV07wqDCoMKgIC8qIER5bmFtaWNh
bGx5DQo+PiBhbGxvY2F0ZWQgU05VTXMgKi8NCj4+ICtzdGF0aWMgdTggc251bXNbUUVfTlVNX09G
X1NOVU1dO8KgwqDCoCAvKiBEeW5hbWljYWxseSBhbGxvY2F0ZWQgU05VTXMgKi8NCj4+ICtzdGF0
aWMgREVDTEFSRV9CSVRNQVAoc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KPj4gwqAgc3Rh
dGljIHVuc2lnbmVkIGludCBxZV9udW1fb2Zfc251bTsNCj4+IMKgIMKgIHN0YXRpYyBwaHlzX2Fk
ZHJfdCBxZWJhc2UgPSAtMTsNCj4+IEBAIC0zMDgsNiArMjk4LDcgQEAgc3RhdGljIHZvaWQgcWVf
c251bXNfaW5pdCh2b2lkKQ0KPj4gwqDCoMKgwqDCoCB9Ow0KPj4gwqDCoMKgwqDCoCBjb25zdCB1
OCAqc251bV9pbml0Ow0KPj4gwqAgK8KgwqDCoCBiaXRtYXBfemVybyhzbnVtX3N0YXRlLCBRRV9O
VU1fT0ZfU05VTSk7DQo+IA0KPiBEb2Vzbid0IG1ha2UgbXVjaCBpbXBvcnRhbmNlLCBidXQgd291
bGRuJ3QgaXQgYmUgbW9yZSBsb2dpY2FsIHRvIGFkZA0KPiB0aGlzIGxpbmUgd2hlcmUgdGhlIHNl
dHRpbmcgb2YgLnN0YXRlID0gUUVfU05VTV9TVEFURV9GUkVFIHdhcyBkb25lDQo+IHByZXZpb3Vz
bHksIGllIGFyb3VuZCB0aGUgZm9yKCkgbG9vcCBiZWxvdyA/DQoNClRoaXMgd2FzIG9uIHB1cnBv
c2UsIHRvIGF2b2lkIGhhdmluZyB0byBtb3ZlIGl0IHVwIGluIHBhdGNoIDQsIHdoZXJlIHdlDQpk
b24ndCBuZWNlc3NhcmlseSByZWFjaCB0aGUgZm9yIGxvb3AuDQoNCj4+IMKgwqDCoMKgwqAgcWVf
bnVtX29mX3NudW0gPSBxZV9nZXRfbnVtX29mX3NudW1zKCk7DQo+PiDCoCDCoMKgwqDCoMKgIGlm
IChxZV9udW1fb2Zfc251bSA9PSA3NikNCj4+IEBAIC0zMTUsMTAgKzMwNiw4IEBAIHN0YXRpYyB2
b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCj4+IMKgwqDCoMKgwqAgZWxzZQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHNudW1faW5pdCA9IHNudW1faW5pdF80NjsNCj4+IMKgIC3CoMKgwqAgZm9yIChp
ID0gMDsgaSA8IHFlX251bV9vZl9zbnVtOyBpKyspIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzbnVt
c1tpXS5udW0gPSBzbnVtX2luaXRbaV07DQo+PiAtwqDCoMKgwqDCoMKgwqAgc251bXNbaV0uc3Rh
dGUgPSBRRV9TTlVNX1NUQVRFX0ZSRUU7DQo+PiAtwqDCoMKgIH0NCj4+ICvCoMKgwqAgZm9yIChp
ID0gMDsgaSA8IHFlX251bV9vZl9zbnVtOyBpKyspDQo+PiArwqDCoMKgwqDCoMKgwqAgc251bXNb
aV0gPSBzbnVtX2luaXRbaV07DQo+IA0KPiBDb3VsZCB1c2UgbWVtY3B5KCkgaW5zdGVhZCA/DQoN
ClllcywgSSBzd2l0Y2ggdG8gdGhhdCBpbiA1LzUuIFN1cmUsIEkgY291bGQgZG8gaXQgaGVyZSBh
bHJlYWR5LCBidXQgSQ0KZGlkIGl0IHRoaXMgd2F5IHRvIGtlZXAgY2xvc2UgdG8gdGhlIGN1cnJl
bnQgc3R5bGUuIEkgZG9uJ3QgY2FyZSBlaXRoZXINCndheSwgc28gaWYgeW91IHByZWZlciBpbnRy
b2R1Y2luZyBtZW1jcHkgaGVyZSwgZmluZSBieSBtZS4NCg0KDQo+PiDCoMKgwqDCoMKgIHNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJnFlX2xvY2ssIGZsYWdzKTsNCj4+IMKgIEBAIC0zNDYsOCArMzMz
LDggQEAgdm9pZCBxZV9wdXRfc251bSh1OCBzbnVtKQ0KPj4gwqDCoMKgwqDCoCBpbnQgaTsNCj4+
IMKgIMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHFlX251bV9vZl9zbnVtOyBpKyspIHsNCj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAoc251bXNbaV0ubnVtID09IHNudW0pIHsNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNudW1zW2ldLnN0YXRlID0gUUVfU05VTV9TVEFURV9GUkVFOw0KPj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChzbnVtc1tpXSA9PSBzbnVtKSB7DQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjbGVhcl9iaXQoaSwgc251bV9zdGF0ZSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKg
IH0NCj4gDQo+IENhbiB3ZSByZXBsYWNlIHRoaXMgbG9vcCBieSBtZW1jaHIoKSA/DQoNCkhtLCB5
ZXMuIFNvIHRoYXQgd291bGQgYmUNCg0KICBjb25zdCB1OCAqcCA9IG1lbWNocihzbnVtcywgc251
bSwgcWVfbnVtX29mX3NudW0pDQogIGlmIChwKQ0KICAgIGNsZWFyX2JpdChwIC0gc251bXMsIHNu
dW1fc3RhdGUpOw0KDQpJIGd1ZXNzLiBMZXQgbWUgZm9sZCB0aGF0IGluIGFuZCBzZWUgaG93IGl0
IGxvb2tzLg0KDQpUaGFua3MsDQpSYXNtdXMNCg==
