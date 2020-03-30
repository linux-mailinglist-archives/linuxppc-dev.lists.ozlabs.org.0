Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAA198215
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:18:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rfLH4FPnzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 04:18:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rfJS52S4zDqBY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 04:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=D5/a8WeV; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48rfJR6NY5z8tFV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 04:16:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48rfJR5ZY6z9sQt; Tue, 31 Mar 2020 04:16:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.237.60;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=D5/a8WeV; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48rfJQ28VBz9sPk
 for <linuxppc-dev@ozlabs.org>; Tue, 31 Mar 2020 04:16:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3NT8B0/iwW3iefvgLlkBlB0Kexf4wBoYHpvUhrKZUUZF5JC1/TqdEpEw5IqY171OLJisDl+MeXTEOmkA8coX8STWIi6Oh0dfL7ou7whBVXg0dAYjtCbHKVfrrAZKnDDTvtpQzZk+WMWEXNPvGfTvaFs9EDWCo4fBG4Jyxkeewc0BlwQDsS7UOOzaNyWZ9eh0hvNNpTCvTuM00KM3aaLDEbi4ilLWReJnvEZXR3RnLj1E2wMgBbhhK4sV3zyotPh+erOrzbeiR4CVl9pYv/43NeUPiZRY2Ex7sOMy460f9IfVyNx8Yttt6lQoFDieflydVbmGTmKtCtQ+CtMVdipgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeGoQRbbFKUMMPpbeZDskCs3bkc05pUtpjvvUIyFYYg=;
 b=WaIbeQ/TAK7yRsGjFNjo+ctsXjTWr4y5adxa3aiD6aIDv8/FhFBl+yRb0YAiJQDQjLscEoHm1+l8T5nO+XJRuCzcrGxq7ywlCCTLIXInK2kP+K+6XzskVv+kD5iICgOShGHPK77OvTc0h7hoJDQbmU4+5QF0opIB2eu7RwmfXluIbK2/6oCCbmCGXFWc/k7YYgrv6pVDBhIUXZjEqLHoPAvDfo9wTRPzpxlrFaLQMzFFD7R4acltE7dHNGDV+kC3PCFJbgAifIIJp1pGXRFqOKe+oVZYd27aI2Pr/W3Ax1SZMzzKl+qSGzBEvP43WlSAqaHu4jIqrFbhKBDYRi9O+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeGoQRbbFKUMMPpbeZDskCs3bkc05pUtpjvvUIyFYYg=;
 b=D5/a8WeVd2MnjyQRO1Dlk8z/7FWK7kXw542ItBpsHGDQmrhSPrh31maDt3pRQRGFxqLjkZO+pOrLM3zFSa2tQczDKNbYUsOaXFJHZ5Vgz2JQmmupht8uLO9uS5RTz+K9g+ffUM+QyWLNqhWxlxzYPulbBTE0IstfdXVQucWjDAs=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB4084.namprd10.prod.outlook.com (2603:10b6:408:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Mon, 30 Mar
 2020 17:16:32 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 17:16:32 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgIADwREAgAdi5wA=
Date: Mon, 30 Mar 2020 17:16:31 +0000
Message-ID: <8c6fa37dd346e1501199e8eb6040a134875f00b6.camel@infinera.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
 <87lfnovu11.fsf@mpe.ellerman.id.au>
In-Reply-To: <87lfnovu11.fsf@mpe.ellerman.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: effd4337-c38e-491d-819a-08d7d4ce17a9
x-ms-traffictypediagnostic: BN8PR10MB4084:
x-microsoft-antispam-prvs: <BN8PR10MB40842C670C9878A66FCA7D6CF4CB0@BN8PR10MB4084.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR10MB3540.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(8676002)(36756003)(81156014)(81166006)(498600001)(66946007)(66476007)(66556008)(2906002)(8936002)(64756008)(66446008)(6512007)(6486002)(2616005)(966005)(110136005)(91956017)(45080400002)(76116006)(6506007)(186003)(26005)(71200400001)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArjJgkltqFZJB69msbLFKxWlxsVsbXwcwAjro8Sd1y/zEOjT5eoxy/KkjYZhsttsYY3KJvauvUyLmqhV08aXUoblG9onSrPaRUR4EqT9yoNfV22kPpKNC3sO1M9aA87LW+1YjJNWkx/HrsVRabk3R2ZWQEOchxC7qrwxEjFa3GkfgiRN2j9PZJ/v63LUAI/CpIjORNQiJ7QDA4nvvI0HA6Xnfh0+Puk6SFwCa0XbHD8PRWVYJ+FpS+LNg3tHKcdubmy22CHg7B6JMZTu0cejiHj+g+I54Ie0evFKk04MCzCr0KYHfWTBCoP8LfExodioHJ9gLcvZvKrL6KRzO1XIQmkc3jI4qANoHs9xJQ9XuCNmYivvLXdNuJ11Sssa1u6QzuCIi7OrLm01kZCQpXzGGpIwtuMp23ROUcyibFFyQaq1OeGr0eKnEK8NoaIeAewf5vb1zSfNv6Y302yXLjVJcplNLk2epVnNP+mxoApWMmz51zsqnn7b2Ymswzs93gsBoHJj4hv+FvKtYIXUgkbNfQ==
x-ms-exchange-antispam-messagedata: OSd0wfUbCMRpeQbu5zfZ44X3kKCPorgfYcb8buot7jTgzo+YOw9rnpZ1tdhWiqoj3PGSRYeakqm9mDtblKRCu1AyWjs7EuCYgri3Vkc27USLpYXZr8ITCydoLsyCfWmxpEhx4Gp/8m9uAxAWqPCtQA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E99F51ED194B5F49B39959789D0A58E8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effd4337-c38e-491d-819a-08d7d4ce17a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 17:16:31.9182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7XLYUQ7LJ78z58iVq+U1uT4jfDKxm+V3K1d2qv5o/E7rNCQYE6cy2HiZnFi3mNY+2C3iL91HWM3UQI/iMbeBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB4084
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

T24gVGh1LCAyMDIwLTAzLTI2IGF0IDExOjI4ICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBKb2FraW0gVGplcm5sdW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNv
bT4gd3JpdGVzOg0KPiA+IE9uIE1vbiwgMjAyMC0wMy0yMyBhdCAxNTo0NSArMDEwMCwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToNCj4gPiA+IExlIDIzLzAzLzIwMjAgw6AgMTU6NDMsIENocmlzdG9w
aGUgTGVyb3kgYSDDqWNyaXQgOg0KPiA+ID4gPiBMZSAyMy8wMy8yMDIwIMOgIDE1OjE3LCBKb2Fr
aW0gVGplcm5sdW5kIGEgw6ljcml0IDoNCj4gPiA+ID4gPiBJbiBfX2RpZSgpLCBzZWUgYmVsb3cs
IHRoZXJlIGlzIHRoaXMgY2FsbCB0byBub3RpZnlfc2VuZCgpIHdpdGgNCj4gPiA+ID4gPiBTSUdT
RUdWIGhhcmRjb2RlZCwgdGhpcyBzZWVtcyBvZGQNCj4gPiA+ID4gPiB0byBtZSBhcyB0aGUgdmFy
aWFibGUgImVyciIgaG9sZHMgdGhlIHRydWUgc2lnbmFsKGluIG15IGNhc2UgU0lHQlVTKQ0KPiA+
ID4gPiA+IFNob3VsZCBub3QgU0lHU0VHViBiZSByZXBsYWNlZCB3aXRoIHRoZSB0cnVlIHNpZ25h
bCBuby4/DQo+ID4gPiA+IA0KPiA+ID4gPiBBcyBmYXIgYXMgSSBjYW4gc2VlLCBjb21lcyBmcm9t
DQo+ID4gPiA+IGh0dHBzOi8vbmFtMDMuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZr
ZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRmNvbW1pdCUyRiUzRmlkJTNENjZm
Y2IxMDU5JmFtcDtkYXRhPTAyJTdDMDElN0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEuY29t
JTdDYWEzMTYwNThmOWUzNGRkNzU4YzgwOGQ3ZDExY2EzOTElN0MyODU2NDNkZTVmNWI0YjAzYTE1
MzBhZTJkYzhhYWY3NyU3QzElN0MwJTdDNjM3MjA3NzkzMjUyNDQ5NzE0JmFtcDtzZGF0YT1MQnpS
TXhIV0p6TkV6dG5uRzBVekpiN1BIdmFER1Zzd1FEJTJCOFdwWTlZWDglM0QmYW1wO3Jlc2VydmVk
PTANCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEFuZA0KPiA+ID4gaHR0cHM6Ly9uYW0wMy5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5l
bC5vcmclMkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGlu
dXguZ2l0JTJGY29tbWl0JTJGJTNGaWQlM0RhZTg3MjIxZDNjZTQ5ZDlkZTFlNDM3NTZkYTgzNGZk
MGJmMDVhMmFkJmFtcDtkYXRhPTAyJTdDMDElN0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEu
Y29tJTdDYWEzMTYwNThmOWUzNGRkNzU4YzgwOGQ3ZDExY2EzOTElN0MyODU2NDNkZTVmNWI0YjAz
YTE1MzBhZTJkYzhhYWY3NyU3QzElN0MwJTdDNjM3MjA3NzkzMjUyNDQ5NzE0JmFtcDtzZGF0YT1E
aCUyQlVUUmdHODVvVlNnQzNTQ1IxQjdpelFINEhvZlQ0cHBPTWl5OXh2REElM0QmYW1wO3Jlc2Vy
dmVkPTANCj4gPiA+IHNob3dzIGl0IGlzICh3YXM/KSBzaW1pbGFyIG9uIHg4Ni4NCj4gPiA+IA0K
PiA+IA0KPiA+IEkgdHJpZWQgdG8gZm9sbG93IHRoYXQgY2hhaW4gdGhpbmtpbmcgaXQgd291bGQg
ZW5kIHVwIHNlbmRpbmcgYSBzaWduYWwgdG8gdXNlciBzcGFjZSBidXQgSSBjYW5ub3Qgc2VlDQo+
ID4gdGhhdCBoYXBwZW5zLiBTZWVtcyB0byBiZSByZWxhdGVkIHRvIGRlYnVnZ2luZy4NCj4gPiAN
Cj4gPiBJbiBzaG9ydCwgSSBjYW5ub3Qgc2VlIGFueSBzaWduYWwgYmVpbmcgZGVsaXZlcmVkIHRv
IHVzZXIgc3BhY2UuIElmIHNvIHRoYXQgd291bGQgZXhwbGFpbiB3aHkNCj4gPiBvdXIgdXNlciBz
cGFjZSBwcm9jZXNzIG5ldmVyIGRpZXMuDQo+ID4gSXMgdGhlcmUgYSBzaWduYWwgaGlkZGVuIGlu
IG1hY2hpbmVfY2hlY2sgaGFuZGxlciBmb3IgU0lHQlVTIEkgY2Fubm90IHNlZT8NCj4gDQo+IEl0
J3MgcGxhdGZvcm0gc3BlY2lmaWMuIFdoYXQgcGxhdGZvcm0gYXJlIHlvdSBvbj8NCj4gDQo+IFNl
ZSB0aGUgcHBjX21kICYgY3VyX2NwdV9zcGVjIGNhbGxzIGhlcmU6DQo+IA0KPiB2b2lkIG1hY2hp
bmVfY2hlY2tfZXhjZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiB7DQo+ICAgICAgICAg
aW50IHJlY292ZXIgPSAwOw0KPiAgICAgICAgIGJvb2wgbmVzdGVkID0gaW5fbm1pKCk7DQo+ICAg
ICAgICAgaWYgKCFuZXN0ZWQpDQo+ICAgICAgICAgICAgICAgICBubWlfZW50ZXIoKTsNCj4gDQo+
ICAgICAgICAgX190aGlzX2NwdV9pbmMoaXJxX3N0YXQubWNlX2V4Y2VwdGlvbnMpOw0KPiANCj4g
ICAgICAgICBhZGRfdGFpbnQoVEFJTlRfTUFDSElORV9DSEVDSywgTE9DS0RFUF9OT1dfVU5SRUxJ
QUJMRSk7DQo+IA0KPiAgICAgICAgIC8qIFNlZSBpZiBhbnkgbWFjaGluZSBkZXBlbmRlbnQgY2Fs
bHMuIEluIHRoZW9yeSwgd2Ugd291bGQgd2FudA0KPiAgICAgICAgICAqIHRvIGNhbGwgdGhlIENQ
VSBmaXJzdCwgYW5kIGNhbGwgdGhlIHBwY19tZC4gb25lIGlmIHRoZSBDUFUNCj4gICAgICAgICAg
KiBvbmUgcmV0dXJucyBhIHBvc2l0aXZlIG51bWJlci4gSG93ZXZlciB0aGVyZSBpcyBleGlzdGlu
ZyBjb2RlDQo+ICAgICAgICAgICogdGhhdCBhc3N1bWVzIHRoZSBib2FyZCBnZXRzIGEgZmlyc3Qg
Y2hhbmNlLCBzbyBsZXQncyBrZWVwIGl0DQo+ICAgICAgICAgICogdGhhdCB3YXkgZm9yIG5vdyBh
bmQgZml4IHRoaW5ncyBsYXRlci4gLS1CZW5ILg0KPiAgICAgICAgICAqLw0KPiAgICAgICAgIGlm
IChwcGNfbWQubWFjaGluZV9jaGVja19leGNlcHRpb24pDQo+ICAgICAgICAgICAgICAgICByZWNv
dmVyID0gcHBjX21kLm1hY2hpbmVfY2hlY2tfZXhjZXB0aW9uKHJlZ3MpOw0KPiAgICAgICAgIGVs
c2UgaWYgKGN1cl9jcHVfc3BlYy0+bWFjaGluZV9jaGVjaykNCj4gICAgICAgICAgICAgICAgIHJl
Y292ZXIgPSBjdXJfY3B1X3NwZWMtPm1hY2hpbmVfY2hlY2socmVncyk7DQo+IA0KPiAgICAgICAg
IGlmIChyZWNvdmVyID4gMCkNCj4gICAgICAgICAgICAgICAgIGdvdG8gYmFpbDsNCj4gDQo+IA0K
PiBFaXRoZXIgdGhlIHBwY19tZCBvciBjcHVfc3BlYyBoYW5kbGVycyBjYW4gc2VuZCBhIHNpZ25h
bCwgYnV0IGFmdGVyIGENCj4gYml0IG9mIGdyZXBwaW5nIEkgdGhpbmsgb25seSB0aGUgcHNlcmll
cyBhbmQgcG93ZXJudiBvbmVzIGRvLg0KPiANCj4gSWYgeW91IGdldCBpbnRvIGRpZSgpIHRoZW4g
aXQncyBhbiBvb3BzLCB3aGljaCBpcyBub3QgdGhlIHNhbWUgYXMgYQ0KPiBub3JtYWwgc2lnbmFs
Lg0KDQpJIGhhZCBhIGxvb2sgYXQgb3BhbF9tYWNoaW5lX2NoZWNrIGFuZCBmcmllbmRzIGFuZCBj
YW1lIHVwIHdpdGg6DQoNCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMNCmluZGV4IDAzODEyNDI5MjBkOS4uMTI3MTVk
MjQxNDFjIDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFwcy5jDQorKysgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMNCkBAIC02MjEsNiArNjIxLDExIEBAIGludCBtYWNo
aW5lX2NoZWNrX2U1MDBtYyhzdHJ1Y3QgcHRfcmVncyAqcmVncykNCiAgICAgICAgICAgICAgICAg
ICAgICAgcmVhc29uICYgTUNTUl9NRUEgPyAiRWZmZWN0aXZlIiA6ICJQaHlzaWNhbCIsIGFkZHIp
Ow0KICAgICAgICB9DQogDQorICAgICAgIGlmICgodXNlcl9tb2RlKHJlZ3MpKSkgew0KKyAgICAg
ICAgICAgICAgIF9leGNlcHRpb24oU0lHQlVTLCByZWdzLCByZWFzb24sIHJlZ3MtPm5pcCk7DQor
ICAgICAgICAgICAgICAgcmVjb3ZlcmFibGUgPSAxOw0KKyAgICAgICB9DQorDQogc2lsZW50X291
dDoNCiAgICAgICAgbXRzcHIoU1BSTl9NQ1NSLCBtY3NyKTsNCiAgICAgICAgcmV0dXJuIG1mc3By
KFNQUk5fTUNTUikgPT0gMCAmJiByZWNvdmVyYWJsZTsNCkBAIC02NjUsNiArNjcwLDEwIEBAIGlu
dCBtYWNoaW5lX2NoZWNrX2U1MDAoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQogICAgICAgIGlmIChy
ZWFzb24gJiBNQ1NSX0JVU19SUEVSUikNCiAgICAgICAgICAgICAgICBwcmludGsoIkJ1cyAtIFJl
YWQgUGFyaXR5IEVycm9yXG4iKTsNCiANCisgICAgICAgaWYgKCh1c2VyX21vZGUocmVncykpKSB7
DQorICAgICAgICAgICAgICAgX2V4Y2VwdGlvbihTSUdCVVMsIHJlZ3MsIHJlYXNvbiwgcmVncy0+
bmlwKTsNCisgICAgICAgICAgICAgICByZXR1cm4gMTsNCisgICAgICAgfQ0KICAgICAgICByZXR1
cm4gMDsNCiB9DQogDQpAQCAtNjk1LDYgKzcwNCwxMCBAQCBpbnQgbWFjaGluZV9jaGVja19lMjAw
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KICAgICAgICBpZiAocmVhc29uICYgTUNTUl9CVVNfV1JF
UlIpDQogICAgICAgICAgICAgICAgcHJpbnRrKCJCdXMgLSBXcml0ZSBCdXMgRXJyb3Igb24gYnVm
ZmVyZWQgc3RvcmUgb3IgY2FjaGUgbGluZSBwdXNoXG4iKTsNCiANCisgICAgICAgaWYgKCh1c2Vy
X21vZGUocmVncykpKSB7DQorICAgICAgICAgICAgICAgX2V4Y2VwdGlvbihTSUdCVVMsIHJlZ3Ms
IHJlYXNvbiwgcmVncy0+bmlwKTsNCisgICAgICAgICAgICAgICByZXR1cm4gMTsNCisgICAgICAg
fQ0KICAgICAgICByZXR1cm4gMDsNCiB9DQogI2VsaWYgZGVmaW5lZChDT05GSUdfUFBDMzIpDQpA
QCAtNzMxLDYgKzc0NCwxMCBAQCBpbnQgbWFjaGluZV9jaGVja19nZW5lcmljKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQ0KICAgICAgICBkZWZhdWx0Og0KICAgICAgICAgICAgICAgIHByaW50aygiVW5r
bm93biB2YWx1ZXMgaW4gbXNyXG4iKTsNCiAgICAgICAgfQ0KKyAgICAgICBpZiAoKHVzZXJfbW9k
ZShyZWdzKSkpIHsNCisgICAgICAgICAgICAgICBfZXhjZXB0aW9uKFNJR0JVUywgcmVncywgcmVh
c29uLCByZWdzLT5uaXApOw0KKyAgICAgICAgICAgICAgIHJldHVybiAxOw0KKyAgICAgICB9DQog
ICAgICAgIHJldHVybiAwOw0KIH0NCiAjZW5kaWYgLyogZXZlcnl0aGluZyBlbHNlICovDQoNCkkg
ZG9uJ3QgcmVhbGx5IGtub3cgd2hhdCBJIGFtIGRvaW5nLCBkb2VzIHRoZSBhYm92ZSBtYWtlIHNl
bnNlIHRvIHlvdT8NCg0KICAgICBKb2NrZQ0K
