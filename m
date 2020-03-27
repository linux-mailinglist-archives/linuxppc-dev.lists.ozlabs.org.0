Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154E1954E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 11:12:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pd2L4pXJzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:12:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pd0R6sfpzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 21:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=LkY+lB4j; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48pd0R5qf0z8tTB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 21:10:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48pd0R52tSz9sSQ; Fri, 27 Mar 2020 21:10:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.92.55;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=LkY+lB4j; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48pd0Q1HMGz9sSM
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Mar 2020 21:10:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKrsuWVzyTJ6lcEd0mK7TX64/QjiLB29MH29ZwM6Tc0AgaGhdD+nFXLokZVyFQi7utWRGunVXYNc1KA1vaVqLtwohu51S5ZaYWuOUG2AJnwq8ii02jyDmPAO6qVBx4lqJ66y/ha8WMs7diKD6lJgkaFpbQLSg3OeGJa3NbW4s4qIL0zVoOwZPUuv4rcWwUBzRRaj0jyiSTSGygPUOrv68RneulB0gaOoXrTLl0tsCi3Mr5h3GnIwN303v3cblS9hH1qZsnztAI3H2CsUpGIPNbRAfge3Gk54Co5Xen2JBFxGrPWp8vRV2FNr7m0Pc1+rkKOVLAPFUIMM5STxtrbyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRzAARW3lo3txDkyfliPPgpyMB4rCidm+p3GA86Og+w=;
 b=HJNQq5O+MaRXgFAQ8sh5KXcYMQuVkNLaq9iDcxNryjDMnevhN9o+Nx1IKORDrajbAIY5fdC9nGGmknwW2QaG8chnTVxaNH7F0TH8RGFCDJZGeS2hR6+yxnxq3rpoiVY5p3G+U1NWxmi0IEFbRWlQAjFeOxPWKkiaWgkWIYFZ4UoKaYKKazEUxUeaqg7c/aZR3h2WmOsBJ8tarGIOwnBKhHHh5reBwnK60R0J5CPxB7VmUEwV6uMnGGspfzoE8xAWK0s23Hhum+NYq8nvVb+VAUXev9Qn6AvJNYEDs3dD5bQlnAM5jJjj6Ur8J8LM/1lD2afmt6fI/AXZaUwfhyq4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRzAARW3lo3txDkyfliPPgpyMB4rCidm+p3GA86Og+w=;
 b=LkY+lB4jOHa0hgU8UFKZiMsdCqtWGaJUAdOraGr41mY27W7JB9FXt+1yhvh9uyzuL87rl4qgqPNaUT4u+0HJ7siNPR73s4mqtDpMpQIV8jlb22G36fzYoePMa4Dqj9xQpn9hMqR5cflRBZ4ZjdREGYibf8LeUKieF3GF5jiZvqM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3572.namprd10.prod.outlook.com (2603:10b6:408:b0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:10:41 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 10:10:41 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgIADwREAgAI07gA=
Date: Fri, 27 Mar 2020 10:10:41 +0000
Message-ID: <466b6f76d90816d297a134232fd1dd91b3c582af.camel@infinera.com>
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
x-ms-office365-filtering-correlation-id: 9e7b2c60-bd69-4ae2-6dba-08d7d2371adb
x-ms-traffictypediagnostic: BN8PR10MB3572:
x-microsoft-antispam-prvs: <BN8PR10MB3572BCFD3B540F51A65E13AFF4CC0@BN8PR10MB3572.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(45080400002)(478600001)(2616005)(186003)(316002)(966005)(110136005)(6486002)(91956017)(76116006)(6512007)(6506007)(66946007)(71200400001)(66556008)(64756008)(66476007)(26005)(81156014)(81166006)(86362001)(2906002)(66446008)(36756003)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3572;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYh5n2vRUXmaQh5JMps9HLYvjUgGcw20m9okCYSX1K7wiGY1jbR4WTRkAHYpxDtnHO17+4LJVC5WYjapsb3qAExLX1Nd2t8im0b07YqA34MX2c8NxE9KXC8ocOq0O1EuwONKSslM/YFq92QYyfog+6xrX1nLnKc+Dl/4MCVa5xaoTDvhmfo6B/bzadOWnEmQR+gg6MqctbUkYkuUxyPMEVLl7LPerEYTw1dJHkZi9jFNYXrjUdRWyZdgFxf/Ik0KHCOVsDMAvz2FUDtR/YE9JZcZ/mSUwgXK0snp8nBO7bJWpBHkCyzlIs22WqqtP3uUnJ9YdYO8UyRoUfuVWHazFLljm5WQjnqpZi3qTsig/UUaZox4j4akIi/l88KR8gZEQdlbwLijdaFeT3fDLUQqddVJjFbd7iJzd33S8nuOfbfLoSQaa4L5H5+yOYbxNjqPDA1SHEqKAnoU1PmGUqXwSxeNZTEklgNzxq0aL33ofGIKJPoAiE/vS0Ull4jIypoh9KnRsG1FlgpuLgKBI+VBAQ==
x-ms-exchange-antispam-messagedata: ZgPqRit3gkS4ATQXvQnNCi0t5nGL+p0Ty9XEXi/8Y0o/vdLL/vM0vVQciyt7i3dUU4ZLdF7LwsD+jANm+lSW1mg0cAPnMXu308nW3bIG46baJkMOzPVWDlw3yEEx/6RaQjtffZ6ferERgIE00A8xtA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8771200B1165F4ABE52EA462CEBF4CD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7b2c60-bd69-4ae2-6dba-08d7d2371adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 10:10:41.1267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 91sUUXFVjK/p0c/uH3/mojBscFCvxLe+0t5GWLwXp4Ed2Cvelz9JB/GfRPNUydyW+vHpANji4OYJslvwB6UTBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3572
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
J3MgcGxhdGZvcm0gc3BlY2lmaWMuIFdoYXQgcGxhdGZvcm0gYXJlIHlvdSBvbj8NCg0KSSBhbSBv
biBlNTAwLCBlNTUwMChlNTAwbWMpIGFuZCA4M3h4IDopDQoNCg0KPiANCj4gU2VlIHRoZSBwcGNf
bWQgJiBjdXJfY3B1X3NwZWMgY2FsbHMgaGVyZToNCj4gDQo+IHZvaWQgbWFjaGluZV9jaGVja19l
eGNlcHRpb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+IHsNCj4gICAgICAgICBpbnQgcmVjb3Zl
ciA9IDA7DQo+ICAgICAgICAgYm9vbCBuZXN0ZWQgPSBpbl9ubWkoKTsNCj4gICAgICAgICBpZiAo
IW5lc3RlZCkNCj4gICAgICAgICAgICAgICAgIG5taV9lbnRlcigpOw0KPiANCj4gICAgICAgICBf
X3RoaXNfY3B1X2luYyhpcnFfc3RhdC5tY2VfZXhjZXB0aW9ucyk7DQo+IA0KPiAgICAgICAgIGFk
ZF90YWludChUQUlOVF9NQUNISU5FX0NIRUNLLCBMT0NLREVQX05PV19VTlJFTElBQkxFKTsNCj4g
DQo+ICAgICAgICAgLyogU2VlIGlmIGFueSBtYWNoaW5lIGRlcGVuZGVudCBjYWxscy4gSW4gdGhl
b3J5LCB3ZSB3b3VsZCB3YW50DQo+ICAgICAgICAgICogdG8gY2FsbCB0aGUgQ1BVIGZpcnN0LCBh
bmQgY2FsbCB0aGUgcHBjX21kLiBvbmUgaWYgdGhlIENQVQ0KPiAgICAgICAgICAqIG9uZSByZXR1
cm5zIGEgcG9zaXRpdmUgbnVtYmVyLiBIb3dldmVyIHRoZXJlIGlzIGV4aXN0aW5nIGNvZGUNCj4g
ICAgICAgICAgKiB0aGF0IGFzc3VtZXMgdGhlIGJvYXJkIGdldHMgYSBmaXJzdCBjaGFuY2UsIHNv
IGxldCdzIGtlZXAgaXQNCj4gICAgICAgICAgKiB0aGF0IHdheSBmb3Igbm93IGFuZCBmaXggdGhp
bmdzIGxhdGVyLiAtLUJlbkguDQo+ICAgICAgICAgICovDQo+ICAgICAgICAgaWYgKHBwY19tZC5t
YWNoaW5lX2NoZWNrX2V4Y2VwdGlvbikNCj4gICAgICAgICAgICAgICAgIHJlY292ZXIgPSBwcGNf
bWQubWFjaGluZV9jaGVja19leGNlcHRpb24ocmVncyk7DQo+ICAgICAgICAgZWxzZSBpZiAoY3Vy
X2NwdV9zcGVjLT5tYWNoaW5lX2NoZWNrKQ0KPiAgICAgICAgICAgICAgICAgcmVjb3ZlciA9IGN1
cl9jcHVfc3BlYy0+bWFjaGluZV9jaGVjayhyZWdzKTsNCj4gDQo+ICAgICAgICAgaWYgKHJlY292
ZXIgPiAwKQ0KPiAgICAgICAgICAgICAgICAgZ290byBiYWlsOw0KPiANCj4gDQo+IEVpdGhlciB0
aGUgcHBjX21kIG9yIGNwdV9zcGVjIGhhbmRsZXJzIGNhbiBzZW5kIGEgc2lnbmFsLCBidXQgYWZ0
ZXIgYQ0KPiBiaXQgb2YgZ3JlcHBpbmcgSSB0aGluayBvbmx5IHRoZSBwc2VyaWVzIGFuZCBwb3dl
cm52IG9uZXMgZG8uDQoNClNlZW1zIHNvDQoNCj4gDQo+IElmIHlvdSBnZXQgaW50byBkaWUoKSB0
aGVuIGl0J3MgYW4gb29wcywgd2hpY2ggaXMgbm90IHRoZSBzYW1lIGFzIGENCj4gbm9ybWFsIHNp
Z25hbC4NCg0KRXhhY3RseSwgYW5kIHRoZSBkaWUvT09QUyBkb2VzIG5vdCBzZWVtIHdvcmsgYXMg
aW50ZW5kZWQgZWl0aGVyLiBUaGUgc3lzdGVtIHRyaWVzIHRvIGxpbXAgYWxvbmcNCmFuZCBnZW5l
cmF0ZXMgbW9yZSBzaW1pbGFyIE9PUHNlcyBhbmQgbWF5IGV2ZW4gaGFuZy4NCg0KPiANCj4gY2hl
ZXJzDQoNCg==
