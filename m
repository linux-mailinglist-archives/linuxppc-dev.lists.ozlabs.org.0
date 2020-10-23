Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19448296C0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 11:25:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHf3j4J0NzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 20:25:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.220.65;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=SBExnlNr; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHf1Z39C1zDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 20:24:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZaUEUCEUgBv6T4qrUWfkq7zDqTag2DM4wjIWlS1zXgEn4rv+YxYiBPTG04pgNO00+wAH9+TjJOlXXrby1fWHkeWmeWppkyaQHm2oa8wQouz2GEh3hAkrazEzgAE69jftFWURIl7TFxVAswnwOMK0e0nCC1aaZMfdz7JHXvr32w4tMF36JGq183Aa8rOfuofjvEKqgO65G6nLGTyAFVVQ1Y3ggBiTWBIgpY5sWbCkw35a4PvjSut2qutv97npAcFPdkA/1/Fl+EOdsMnAlyPaumT2g9QKJ87DvVvoZnpX70fWQz/yrfziCaJAmHp9Y6qECNMU+B9iO0o7ACmQ6wzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frtj0OzfFzIm4b9V8eWGUfZjmqd/stlNtGUhO2eij6A=;
 b=Z4RI1cZFnp2DFC9iATX8Vbb5W2NPRx6Ghzgczm9KCRwQc9jJNf/oDsXcFd+Z/I3NFHak4KgjQFfk6ONkjy/ykAm+V7DmVsYHgoE3aUj3raXM4s+cU6/wJXl21cswWbsbL7p/0BsvESx7o2BFGOVEBtiwd6xM1GAwMGtmFoxVVVE+UWB4UsCUf899QLR/gxxcLSeZQZHqgTQIk19lgnsyKrQdeqvHaUukGU5g1yts1tm9Zd0R0eFXXxyxVCmZKI0TY5tSxFwj35rxrQfZML5sVDQKoRjKM2ePXKEo3NUCxtwK9X4UwiHpUZw8WwU88SYy4pD1AyOSRIOn/+Cls6flqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frtj0OzfFzIm4b9V8eWGUfZjmqd/stlNtGUhO2eij6A=;
 b=SBExnlNrhFgoKsp6o0AGFkn4bV4m6kUnNl58n2mezv8aqiyI93js+LWIuRP2/klO3peBo08t257zPX1g1HePgKBDF34FCBhUobVEcZpA/Hf85NwQNdgIhQFrjOIqn/XyaBWuUhzew+tpFWQPZ1dJz4YDzqJDZn97HABbEkcGM0Y=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2165.namprd10.prod.outlook.com
 (2603:10b6:910:42::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Fri, 23 Oct
 2020 09:23:55 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8%6]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 09:23:55 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Send SIGBUS from machine_check
Thread-Topic: [PATCH] powerpc: Send SIGBUS from machine_check
Thread-Index: AQHWmBUkBeSB6voqzUWPX7X30S3i+KmkfuaAgACNYwA=
Date: Fri, 23 Oct 2020 09:23:55 +0000
Message-ID: <8423036156b7cfe952270069611beb7bf3466072.camel@infinera.com>
References: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
 <87d019yd0w.fsf@mpe.ellerman.id.au>
In-Reply-To: <87d019yd0w.fsf@mpe.ellerman.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a074fa6-b8b2-449b-6950-08d877355d4f
x-ms-traffictypediagnostic: CY4PR1001MB2165:
x-microsoft-antispam-prvs: <CY4PR1001MB2165F088D94F83EF121A2673F41A0@CY4PR1001MB2165.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RGcYW0vIXQu2n2xC//+bGTyp2fdJLwpGEJ+/I/eCb7g63b8ZLJyC7UmO9p16ytF/ft1iCzRhNVbG0o2K0r6JY6XusqOiip60/ifdRJtEZ78Wr1RMH23cTFmHJBqMfHR3080A8vwrliQCZXOMeAJeWQIKGRe1l+ANOmQU1uRW0cV54W0nWha7sEjN6E8Oo4kAeb2MmjEJn+W4BG/YbyQcBqJYg4IJtCOAfriavn0zI18ijK417jvIh4IG+eLEmcPTic/BSgD8ICi5qdb3SWshoh51vwQ+KobnkcCaFOrXE3wGYN9QdtETSaOi3HqZ/vS6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(4001150100001)(6506007)(186003)(83380400001)(71200400001)(316002)(2906002)(36756003)(478600001)(66946007)(86362001)(5660300002)(8676002)(110136005)(91956017)(66556008)(6486002)(6512007)(8936002)(64756008)(66446008)(66476007)(2616005)(76116006)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FT+6ZvZmQtMVHM2TlmJBz6HizZYDBHRVuISMk9ebYKILBvmpKxQJDRT06ZVpWwqZplhcRhaDxvjWXiofJf6oy9iSVIATp5ETMzFqOl7oabSOgBftBMKKRY8ESXFDro6efV0nHKtb6PMpaehxRdHXaVeMqFUarCrmiM37edzffVCKga3uLkA+NxpIhErlznkPstsPqqqtnBsSGgr4B7HxNtmxtbkTBk9JQ1xm06dSKcnVPu4iNjJNZDJsAocD9fXlSOBW7nCBVfl74a4no3FQ/Go5m+YS3kpnvuANDL1EqnGjO8oUq/DhfMpa4YTZeGdVTgk8z5eEqCBtP9UASOK0cLR367zzqaXmw49KnE33FQoDgKmqUya4Vhy1GMGJVo9IEWjqkDXICjTZTq/ZHLL6sewQ4lDTBFpMXf3/SZBZJu4cnKh0XTb57q510azcIkTPMIJezHkd65MeBPSNAXykx8iKu9EyefLxF1AK9lQxIKqrPrLnGnEASe6ebLqboUmEYfrTd9uVoBD9dWVHFUToP+7gmtnTxH1H17qHAwE4MIgcF7x/KuSiPh6M45qSyHnTVUKYOnzPy6C5V/rf2Z38tgl7MuYkIIZhCzt5MvA/wct2nVp7kSLVjlDSppDOheTtYd9WHHPErg1k35dfNrgrTw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0945F82C3E13774A8D61F87254F35E6D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a074fa6-b8b2-449b-6950-08d877355d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 09:23:55.4203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aA2ECyv11s9YWVDCgJF4sP7lmUiiYTh37R2KU/iVXCcdNCYNWs7tvsiLVhhwqAvVW47huG/68j8s4MPcaIbGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2165
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIwLTEwLTIzIGF0IDExOjU3ICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiANCj4gDQo+IEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEu
Y29tPiB3cml0ZXM6DQo+ID4gRW1iZWRkZWQgUFBDIENQVSBzaG91bGQgc2VuZCBTSUdCVVMgdG8g
dXNlciBzcGFjZSB3aGVuIGFwcGxpY2FibGUuDQo+IA0KPiBZZWFoLCBidXQgaXQncyBub3QgY2xl
YXIgdGhhdCBpdCdzIGFwcGxpY2FibGUgaW4gYWxsIGNhc2VzLg0KPiANCj4gQXQgbGVhc3QgSSBu
ZWVkIHNvbWUgcmVhc29uaW5nIGZvciB3aHkgaXQncyBzYWZlIGluIGFsbCBjYXNlcyBiZWxvdyB0
bw0KPiBqdXN0IHNlbmQgYSBTSUdCVVMgYW5kIHRha2Ugbm8gb3RoZXIgYWN0aW9uLg0KDQpGb3Ig
bWUgdGhpcyBjYW1lIGZyb20gYW4gVXNlciBTREsgYWNjZXNzaW5nIGEgUENJIGRldmljZShhbHNv
IHVzaW5nIFBDSSBJUlFzKSBhbmQgdGhpcw0KU0RLIGRpZCBzb21lIHN0cmFuZ2Ugc3R1ZmYgZHVy
aW5nIHNodXRkb3duIHdoaWNoIGRpc2FibGVkIHRoZSBkZXZpY2UgYmVmb3JlIFNXIHdhcyBkb25l
Lg0KVGhpcyBjYXVzZWQgUENJIGFjY2Vzc2VzLCBib3RoIGZyb20gVXNlciBTcGFjZSBhbmQga2Vy
bmVsIFBDSSBJUlFzIGFjY2VzcykgdG8gdGhlIGRldmljZQ0Kd2hpY2ggY2F1c2VkIGFuIE1hY2hp
bmUgQ2hlY2soUENJIHRyYW5zZmVyIGZhaWxlZCkuIFdpdGhvdXQgdGhpcyBwYXRjaCwgdGhlIGtl
cm5lbA0Kd291bGQganVzdCBPT1BTIGFuZCBoYW5nL2RvIHN0cmFuZ2UgdGhpbmdzIGV2ZW4gZm9y
IGFuIGFjY2VzcyBtYWRlIGJ5IFVzZXIgc3BhY2UuDQpOb3cgdGhlIFVzZXIgYXBwIGp1c3QgZ2V0
cyBhIFNJR0JVUyBhbmQgdGhlIGtlcm5lbCBzdGlsbCB3b3JrcyBhcyBpdCBzaG91bGQuDQoNClBl
cmhhcHMgYSBTSUdCVVMgYW5kIHJlY292ZXIgaXNuJ3QgcmlnaHQgaW4gYWxsIGNhc2VzIGJ1dCB3
aXRob3V0IGl0IHRoZXJlIHdpbGwgYmUgYQ0Kc3lzdGVtIGJyZWFrIGRvd24uDQoNCg0KPiBJcyB0
aGVyZSBhIHBhcnRpY3VsYXIgQ1BVIHlvdSdyZSB3b3JraW5nIG9uPyBDYW4gd2Ugc3RhcnQgd2l0
aCB0aGF0IGFuZA0KPiBsb29rIGF0IGFsbCB0aGUgbWFjaGluZSBjaGVjayBjYXVzZXMgYW5kIHdo
aWNoIGNhbiBiZSBzYWZlbHkgaGFuZGxlZC4NCg0KVGhpcyB3YXMgYSBUMTA0MihlNTUwMCkgYnV0
IHdlIGhhdmUgZTUwMCBhbmQgbXBjODMyeCBhcyB3ZWxsLg0KDQo+IA0KPiBTb21lIGNvbW1lbnRz
IGJlbG93IC4uLg0KPiANCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dHJhcHMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYw0KPiA+IGluZGV4IDAzODEyNDI5
MjBkOS4uMTI3MTVkMjQxNDFjIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dHJhcHMuYw0KPiA+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYw0KPiA+IEBAIC02
MjEsNiArNjIxLDExIEBAIGludCBtYWNoaW5lX2NoZWNrX2U1MDBtYyhzdHJ1Y3QgcHRfcmVncyAq
cmVncykNCj4gDQo+IEF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZ1bmN0aW9uIHdlIGhhdmU6DQo+
IA0KPiDCoMKgwqDCoMKgwqDCoMKgcHJpbnRrKCJNYWNoaW5lIGNoZWNrIGluIGtlcm5lbCBtb2Rl
LlxuIik7DQo+IA0KPiBXaGljaCBzaG91bGQgYmUgdXBkYXRlZC4NCg0KU3VyZSwganVzdCByZW1v
dmUgdGhlICJpbiBrZXJuZWwgbW9kZSIgcGVyaGFwcz8NCg0KPiANCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWFzb24gJiBNQ1NSX01FQSA/ICJFZmZlY3Rp
dmUiIDogIlBoeXNpY2FsIiwgYWRkcik7DQo+ID4gwqDCoMKgwqDCoMKgfQ0KPiA+IA0KPiA+ICsg
ICAgIGlmICgodXNlcl9tb2RlKHJlZ3MpKSkgew0KPiA+ICsgICAgICAgICAgICAgX2V4Y2VwdGlv
bihTSUdCVVMsIHJlZ3MsIHJlYXNvbiwgcmVncy0+bmlwKTsNCj4gPiArICAgICAgICAgICAgIHJl
Y292ZXJhYmxlID0gMTsNCj4gPiArICAgICB9DQo+IA0KPiBGb3IgbW9zdCBvZiB0aGUgZXJyb3Ig
Y2F1c2VzIHdlIHRha2Ugbm8gYWN0aW9uIGFuZCBzZXQgcmVjb3ZlcmFibGUgPSAwLg0KPiANCj4g
VGhlbiB5b3UganVzdCBkZWNsYXJlIHRoYXQgaXQgaXMgcmVjb3ZlcmFibGUgYmVjYXVzZSBpdCBo
aXQgaW4NCj4gdXNlcnNwYWNlLiBEZXBlbmRpbmcgb24gdGhlIGNhdXNlIHRoYXQgbWlnaHQgYmUg
T0ssIGJ1dCBpdCdzIG5vdA0KPiBvYnZpb3VzbHkgY29ycmVjdCBpbiBhbGwgY2FzZXMuDQoNCk5v
dCBzbyBmYW1pbGlhciB3aXRoIFBQQyB0aGF0IEkgY2FuIG1ha2Ugb3V0IHdoYXQgaXMgT0sgb3Ig
bm90Lg0KSSBkbyB0aGluayB5b3Ugc3RhbmQgYSBiZXR0ZXIgY2hhbmNlIG5vdyB0aGF0IGJlZm9y
ZSB0aG91Z2guICANCg0KPiANCj4gDQo+ID4gKw0KPiA+IMKgc2lsZW50X291dDoNCj4gPiDCoMKg
wqDCoMKgwqBtdHNwcihTUFJOX01DU1IsIG1jc3IpOw0KPiA+IMKgwqDCoMKgwqDCoHJldHVybiBt
ZnNwcihTUFJOX01DU1IpID09IDAgJiYgcmVjb3ZlcmFibGU7DQo+ID4gQEAgLTY2NSw2ICs2NzAs
MTAgQEAgaW50IG1hY2hpbmVfY2hlY2tfZTUwMChzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4gDQo+
IFNhbWUgY29tbWVudCBhYm91dCB0aGUgcHJpbnRrKCkuDQo+IA0KPiA+IMKgwqDCoMKgwqDCoGlm
IChyZWFzb24gJiBNQ1NSX0JVU19SUEVSUikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcHJpbnRrKCJCdXMgLSBSZWFkIFBhcml0eSBFcnJvclxuIik7DQo+ID4gDQo+ID4gKyAgICAg
aWYgKCh1c2VyX21vZGUocmVncykpKSB7DQo+ID4gKyAgICAgICAgICAgICBfZXhjZXB0aW9uKFNJ
R0JVUywgcmVncywgcmVhc29uLCByZWdzLT5uaXApOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IDE7DQo+ID4gKyAgICAgfQ0KPiANCj4gQW5kIHNhbWUgY29tbWVudCBtb3JlIG9yIGxlc3MuDQo+
IA0KPiBPdGhlciB0aGFuIHRoZSBNQ1NSX0JVU19SQkVSUiBjYXNlcyB0aGF0IGFyZSBleHBsaWNp
dGx5IGNoZWNrZWQsIHRoZQ0KPiBmdW5jdGlvbiBkb2VzIG5vdGhpbmcgdG8gY2xlYXIgdGhlIGNh
dXNlIG9mIHRoZSBtYWNoaW5lIGNoZWNrLg0KPiANCj4gPiDCoMKgwqDCoMKgwqByZXR1cm4gMDsN
Cj4gPiDCoH0NCj4gPiANCj4gPiBAQCAtNjk1LDYgKzcwNCwxMCBAQCBpbnQgbWFjaGluZV9jaGVj
a19lMjAwKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiA+IMKgwqDCoMKgwqDCoGlmIChyZWFzb24g
JiBNQ1NSX0JVU19XUkVSUikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRr
KCJCdXMgLSBXcml0ZSBCdXMgRXJyb3Igb24gYnVmZmVyZWQgc3RvcmUgb3IgY2FjaGUgbGluZSBw
dXNoXG4iKTsNCj4gPiANCj4gPiArICAgICBpZiAoKHVzZXJfbW9kZShyZWdzKSkpIHsNCj4gPiAr
ICAgICAgICAgICAgIF9leGNlcHRpb24oU0lHQlVTLCByZWdzLCByZWFzb24sIHJlZ3MtPm5pcCk7
DQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMTsNCj4gPiArICAgICB9DQo+IA0KPiBTYW1lLg0K
PiANCj4gPiDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiDCoH0NCj4gPiDCoCNlbGlmIGRlZmlu
ZWQoQ09ORklHX1BQQzMyKQ0KPiA+IEBAIC03MzEsNiArNzQ0LDEwIEBAIGludCBtYWNoaW5lX2No
ZWNrX2dlbmVyaWMoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+ID4gwqDCoMKgwqDCoMKgZGVmYXVs
dDoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRrKCJVbmtub3duIHZhbHVl
cyBpbiBtc3JcbiIpOw0KPiA+IMKgwqDCoMKgwqDCoH0NCj4gPiArICAgICBpZiAoKHVzZXJfbW9k
ZShyZWdzKSkpIHsNCj4gPiArICAgICAgICAgICAgIF9leGNlcHRpb24oU0lHQlVTLCByZWdzLCBy
ZWFzb24sIHJlZ3MtPm5pcCk7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMTsNCj4gPiArICAg
ICB9DQo+IA0KPiBTYW1lLg0KPiANCj4gPiDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiDCoH0N
Cj4gPiDCoCNlbmRpZiAvKiBldmVyeXRoaW5nIGVsc2UgKi8NCj4gPiAtLQ0KPiA+IDIuMjYuMg0K
PiANCj4gDQo+IGNoZWVycw0KDQo=
