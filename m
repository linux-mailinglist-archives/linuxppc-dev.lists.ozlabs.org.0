Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA9134F9E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 23:52:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tPdL2TdLzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ch.abb.com (client-ip=40.107.4.62;
 helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=matteo.ghidoni@ch.abb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ch.abb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ch.abb.com header.i=@ch.abb.com header.b="N/T16gN1"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40062.outbound.protection.outlook.com [40.107.4.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t71n06nnzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 22:53:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUebKui3AzzZu69zWnoUjMG0+zhx4HjLFM5KhaMT0oPZXAZO/0mdSAmB7/UR4NO7//F390md13vQ1QxxmYd2zRQwePxTctnnr4lpcwkZ8xKYC50C3Pz0bWthOid5rtJ3WqdgNq/qb2d0/Yoz441UX0hK4T72Fss+2JTyhxCykrd9c2at8GDskNVR6P3J/R2eobXWERJh6RLPDwDp2w5giIE4Jy8+9tD8nqxMC5wpSK0p838j0dRqtFoclJlOpQ+hEvUcecnk/mIWHjbbjtVeXhOVhLLLLsPaDe4G+d/UQaLERYvfKJJbLoS79iOrsk1EhSVFK+ZdG2XXaOqmpPLO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mHyNybkMvgUwsv4huJGeIikZNJGB3pqjWCYyQz2caQ=;
 b=AP8YHvy5w3yMO/hJAdgwziSZFpKHMFhlmgqbSn9CU6TLWs7r3V65c+FL/k76qRk2sLgMIjPnPvjnRg3IC+XSRqeTlfgczsOGyWcD4yiHo2XnsvvUkTgx3jC+32coBYExY9lWM1BnJyt6NvOw8g9oxkdHuCngetyzrCdOuBK9B1s5Xsi1t0IQ+lrvPx67H6I+4sWEBQHEggmOCr9hwp2HnnDnQAqJYU63W2ddM4YF/JSpBgH89tf7i9Sv0DhjULG1MUVA5J1vhqTwr1Awri0aUeHSHdu+8VMpp8+WpIa0XHwHPicudA8u/jeH3yXFGEbMe/HFjGZPqQ77kCFXtuqALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ch.abb.com; dmarc=pass action=none header.from=ch.abb.com;
 dkim=pass header.d=ch.abb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ch.abb.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mHyNybkMvgUwsv4huJGeIikZNJGB3pqjWCYyQz2caQ=;
 b=N/T16gN13ilih3pJGKmFHoQCMiebatNdbmkMZP6T05eM6ZEwNpp7uyvZq9foHkKz6jirOSBdUo7OYvLyp/8wpX9CV9fN0KKUBP031AqPOfHwqyzDpN1UV1foMy7YQzIGQDtPwZ0ORDNEfaOD0pEWkn8ptHSb1Ulb+PfzxndL71o=
Received: from AM0PR06MB5427.eurprd06.prod.outlook.com (20.178.23.156) by
 AM0PR06MB3953.eurprd06.prod.outlook.com (52.133.58.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Wed, 8 Jan 2020 11:53:37 +0000
Received: from AM0PR06MB5427.eurprd06.prod.outlook.com
 ([fe80::bde5:65c9:a39a:23c4]) by AM0PR06MB5427.eurprd06.prod.outlook.com
 ([fe80::bde5:65c9:a39a:23c4%5]) with mapi id 15.20.2602.017; Wed, 8 Jan 2020
 11:53:37 +0000
From: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>
Subject: RE: Freescale network device not activated on mpc8360 (kmeter1 board)
Thread-Topic: Freescale network device not activated on mpc8360 (kmeter1 board)
Thread-Index: AQHVxVqfalFIjdyzCE+lQXaLrMtWbKffgEcAgAEGaKA=
Date: Wed, 8 Jan 2020 11:53:36 +0000
Message-ID: <AM0PR06MB5427E1BDB8C23FD09E625BD2B33E0@AM0PR06MB5427.eurprd06.prod.outlook.com>
References: <AM0PR06MB5427E4BDF8FB1BEC5DF3D45FB33F0@AM0PR06MB5427.eurprd06.prod.outlook.com>
 <55f4ba5d-fd05-4a14-6319-d5d76c9675f2@gmail.com>
In-Reply-To: <55f4ba5d-fd05-4a14-6319-d5d76c9675f2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=matteo.ghidoni@ch.abb.com; 
x-originating-ip: [80.75.192.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5df8be22-ec59-4dcc-56af-08d79431654d
x-ms-traffictypediagnostic: AM0PR06MB3953:
x-microsoft-antispam-prvs: <AM0PR06MB39532ABA95E5B221EB120900B33E0@AM0PR06MB3953.eurprd06.prod.outlook.com>
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(51234002)(189003)(199004)(53754006)(66446008)(64756008)(66946007)(7696005)(66556008)(66476007)(186003)(4326008)(6506007)(26005)(33656002)(478600001)(110136005)(55016002)(54906003)(76116006)(9686003)(5660300002)(71200400001)(316002)(81156014)(8936002)(52536014)(86362001)(44832011)(2906002)(8676002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR06MB3953;
 H:AM0PR06MB5427.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: ch.abb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQEfDwN76tmQj11CKZuUBvXHynfNndjNTDzIW9NP3ESzcGKTG4yxDoblTRd5Zm92P8CW1yO1cUi59gu1HmPyjA+qhjxw+nYS1KAoGGQYqnzbvG9OWUzKKKIxFn8hOYYeGV1XGE6TO+91OudUA1NMRJb2V8NIekmgsXvZX6TqlLZ6sPlWuyK8UGYhKPgIcnAVuY8PP2cGV7uxSGb5xQp+EGBQfeGBrM7cI063WF5Ma4qaoPQgqi8DZUCTxy3octgKpQF2MCQ0YAsKjcvEsay6X1ERyBHo87pFkFKSda+VoR03z983uHtFmBIpktQNgeRfLk3jmqKINCeQJOPD0+8UVJ9dUH891E1nQKTKGxm3gFcGIlkj2mNFIwdeG0bj3aXkNr7tK8pvtRuYd9CFUwd3pNpDgA/gpVqXf8lYR8y6q+hVX8HRRIkVRMkWimQuiYu02dnbz5jnOn/8MLTeU+pm6XzPXFxPjlMXyBCay6OYrObKvdLZWVeIbf31VIxnTwZgGJv36vZT23/L4LUseCS3LQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ch.abb.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df8be22-ec59-4dcc-56af-08d79431654d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 11:53:36.8521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nQZqlaAObJsSSkDcF+SN8Gl7n47nS9Oo6ogBVwzx3OjnnAwY24ITLNexlwL1Nc0w1eOSH1QTC4Zo0o9zcwUqBOy9tLUOBq480ty1A3CPcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB3953
X-Mailman-Approved-At: Thu, 09 Jan 2020 09:50:19 +1100
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sux@loplof.de" <sux@loplof.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSGVpbmVyLCB0aGFuayB5b3UgZm9yIHRoZSBxdWljayBhbnN3ZXIuDQoNCj4gPiAgSGkgYWxs
LA0KPiA+DQo+ID4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBmb2xsb3dpbmcgcGF0Y2gs
IHdlIGFyZSBmYWNpbmcgYW4gaXNzdWUgd2l0aA0KPiB0aGUgYWN0aXZhdGlvbiBvZiB0aGUgRnJl
ZXNjYWxlIG5ldHdvcmsgZGV2aWNlICh1Y2NfZ2V0aCBkcml2ZXIpIG9uIG91cg0KPiBrbWV0ZXIx
IGJvYXJkIGJhc2VkIG9uIGEgTVBDODM2MDoNCj4gDQo+ICtMaSBhcyB1Y2NfZ2V0aCBtYWludGFp
bmVyDQo+IA0KPiBDYW4geW91IGRlc2NyaWJlIHRoZSBzeW1wdG9tcyBvZiB0aGUgaXNzdWU/DQoN
CkkgYW0gdHJ5aW5nIHRvIGJvb3QgaW4gTkZTLCBidXQgYXMgc29vbiBhcyB0aGUgYm9vdCBwcm9j
ZXNzIGlzIGZpbmlzaGVkIHRoZXJlIGlzIG5vIG5ldHdvcmsgY29ubmVjdGlvbnMgYmV0d2VlbiB0
aGUgYm9hcmQgYW5kIHRoZSBob3N0Lg0KDQo+ID4NCj4gPiBjb21taXQgMTI0ZWVlM2Y2OTU1Zjdh
YTE5YjllNmZmNWM5YjZkMzdjYjNkMWUyYw0KPiA+IEF1dGhvcjogSGVpbmVyIEthbGx3ZWl0IDxo
a2FsbHdlaXQxQGdtYWlsLmNvbT4NCj4gPiBEYXRlOiAgIFR1ZSBTZXAgMTggMjE6NTU6MzYgMjAx
OCArMDIwMA0KPiA+DQo+ID4gICAgIG5ldDogbGlua3dhdGNoOiBhZGQgY2hlY2sgZm9yIG5ldGRl
dmljZSBiZWluZyBwcmVzZW50IHRvDQo+ID4gbGlua3dhdGNoX2RvX2Rldg0KPiA+DQo+ID4gQmFz
ZWQgb24gbXkgb2JzZXJ2YXRpb25zLCBqdXN0IGJlZm9yZSB0cnlpbmcgdG8gYWN0aXZhdGUgdGhl
IGRldmljZSB0aHJvdWdoDQo+IGxpbmt3YXRjaF9ldmVudCwgdGhlIGNvbnRyb2xsZXIgd2FudHMg
dG8gYWRqdXN0IHRoZSBNQUMgY29uZmlndXJhdGlvbiBhbmQgaW4NCj4gb3JkZXIgdG8gYWNoaWV2
ZSB0aGlzIGl0IGRldGFjaGVzIHRoZSBkZXZpY2UuIFRoaXMgYXZvaWRzIHRoZSBhY3RpdmF0aW9u
IG9mIHRoZQ0KPiBuZXQgZGV2aWNlLg0KPiA+DQo+IEl0IHNvdW5kcyBhIGxpdHRsZSBiaXQgb2Rk
IHRvIHJlbHkgb24gYW4gYXN5bmNocm9ub3VzIGxpbmt3YXRjaCBldmVudCBoZXJlLg0KPiBDYW4g
eW91IGdpdmUgYSBjYWxsIHRyYWNlPw0KDQpIZXJlIGlzIGEgY2FsbCB0cmFjZSBmb3JtIHRoZSBh
ZGp1c3RfbGluayBmdW5jdGlvbiBpbiB0aGUgaWYgY29uZGl0aW9uIGF0IGxpbmUgMTY0NCAodWNj
X2dldGguYyBmaWxlKToNCg0KQ1BVOiAwIFBJRDogMzUgQ29tbToga3dvcmtlci8wOjEgTm90IHRh
aW50ZWQgNS40LjgtZGlydHkgIzE5DQpXb3JrcXVldWU6IGV2ZW50c19wb3dlcl9lZmZpY2llbnQg
cGh5X3N0YXRlX21hY2hpbmUNCkNhbGwgVHJhY2U6DQpbY2Y4OGJkZThdIFtjMDJkZGNhOF0gYWRq
dXN0X2xpbmsrMHgzMDQvMHgzMjAgKHVucmVsaWFibGUpDQpbY2Y4OGJlMjhdIFtjMDJjYmYzY10g
cGh5X2NoZWNrX2xpbmtfc3RhdHVzKzB4ZTQvMHhmYw0KW2NmODhiZTQ4XSBbYzAyY2NjZGNdIHBo
eV9zdGF0ZV9tYWNoaW5lKzB4NDQvMHgxNzANCltjZjg4YmU3OF0gW2MwMDM2MWEwXSBwcm9jZXNz
X29uZV93b3JrKzB4MjY0LzB4NDA4DQpbY2Y4OGJlYThdIFtjMDAzNzBmOF0gd29ya2VyX3RocmVh
ZCsweDE0MC8weDUzYw0KW2NmODhiZWY4XSBbYzAwM2Q4MThdIGt0aHJlYWQrMHhkYy8weDEwOA0K
W2NmODhiZjM4XSBbYzAwMTAyNzRdIHJldF9mcm9tX2tlcm5lbF90aHJlYWQrMHgxNC8weDFjDQoN
CkhlcmUgdGhlIGNhbGwgdHJhY2UgZnJvbSB0aGUgbmV0aWZfY2Fycmllcl9vbiBmdW5jdGlvbiBq
dXN0IGJlZm9yZSB0aGUgY2FsbCB0byB0aGUgbGlua3dhdGNoX2ZpcmVfZXZlbnQgZnVuY3Rpb24g
KGxpbmUgNDk4LCBzY2hfZ2VuZXJpYy5jIGZpbGUpOg0KDQpDUFU6IDAgUElEOiAzNSBDb21tOiBr
d29ya2VyLzA6MSBOb3QgdGFpbnRlZCA1LjQuOC1kaXJ0eSAjMjANCldvcmtxdWV1ZTogZXZlbnRz
X3Bvd2VyX2VmZmljaWVudCBwaHlfc3RhdGVfbWFjaGluZQ0KQ2FsbCBUcmFjZToNCltjZjg4YmRl
OF0gW2MwMzUyMDY0XSBuZXRpZl9jYXJyaWVyX29uKzB4YzQvMHhjOCAodW5yZWxpYWJsZSkNCltj
Zjg4YmUwOF0gW2MwMmNmNGVjXSBwaHlfbGlua19jaGFuZ2UrMHg4NC8weGI0DQpbY2Y4OGJlMjhd
IFtjMDJjYmYzY10gcGh5X2NoZWNrX2xpbmtfc3RhdHVzKzB4ZTQvMHhmYw0KW2NmODhiZTQ4XSBb
YzAyY2NjZGNdIHBoeV9zdGF0ZV9tYWNoaW5lKzB4NDQvMHgxNzANCltjZjg4YmU3OF0gW2MwMDM2
MWEwXSBwcm9jZXNzX29uZV93b3JrKzB4MjY0LzB4NDA4DQpbY2Y4OGJlYThdIFtjMDAzNzBmOF0g
d29ya2VyX3RocmVhZCsweDE0MC8weDUzYw0KW2NmODhiZWY4XSBbYzAwM2Q4MThdIGt0aHJlYWQr
MHhkYy8weDEwOA0KW2NmODhiZjM4XSBbYzAwMTAyNzRdIHJldF9mcm9tX2tlcm5lbF90aHJlYWQr
MHgxNC8weDFjDQoNCk1vcmVvdmVyLCBJIG5vdGljZWQgdGhhdCBieSBhZGRpbmcgdGhlIGR1bXAg
ZGlyZWN0bHkgaW4gdGhlIGxpbmt3YXRjaF9kb19kZXYgZnVuY3Rpb24gKGxpbmtfd2F0Y2guYykg
dGhlIGludGVyZmFjZSBjb21lcyB1cCBjb3JyZWN0bHksIGJlY2F1c2Ugb2YgdGhlIGRlbGF5IGlu
dHJvZHVjZWQgYnkgdGhlIGR1bXBfc3RhY2sgZnVuY3Rpb24uDQoNCkhlcmUgYW5vdGhlciBsb2cg
d2l0aCBzb21lIHByaW50cyB0aGF0IG1heWJlIGNhbiBoZWxwIHRvIHVuZGVyc3RhbmQgdGhlIHNp
dHVhdGlvbi4gVGhlIHByaW50cyBhcmUgcGxhY2VkIGp1c3QgYmVmb3JlIGNhbGxpbmcgdGhlIGZ1
bmN0aW9uIG1lbnRpb25lZCBpbiB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIG1lc3NhZ2UgKGhvcGVm
dWxseSB0aGlzIHdpbGwgbm90IGJyaW5nIG1vcmUgY29uZnVzaW9uKToNCg0KPC4uLj4NCnViaTA6
IGF2YWlsYWJsZSBQRUJzOiAyMzUsIHRvdGFsIHJlc2VydmVkIFBFQnM6IDI2OSwgUEVCcyByZXNl
cnZlZCBmb3IgYmFkIFBFQiBoYW5kbGluZzogMA0KdWJpMDogYmFja2dyb3VuZCB0aHJlYWQgInVi
aV9iZ3QwZCIgc3RhcnRlZCwgUElEIDQ1DQojIyMjIyMjIyMjIyMjIyMjIyBbcGh5X2RldmljZS5j
XSBwaHlfbGlua19jaGFuZ2UgLSBjYWxsaW5nIG5ldGlmX2NhcnJpZXJfb24gKGV0aDIpDQojIyMj
IyMjIyMjIyMjIyMjIyBbc2NoZWRfZ2VuZXJpYy5jXSBuZXRpZl9jYXJyaWVyX29uIC0gY2FsbGlu
ZyBsaW5rd2F0Y2hfZmlyZV9ldmVudCAoZXRoMikNCiMjIyMjIyMjIyMjIyMjIyMjIFtwaHlfZGV2
aWNlLmNdIHBoeV9saW5rX2NoYW5nZSAtIGNhbGxpbmcgYWRqdXN0X2xpbmsgKGV0aDIpDQojIyMj
IyMjIyMjIyMjIyMjIyBbdWNjX2dldGguY10gYWRqdXN0X2xpbmsgLSBjYWxsaW5nIHVnZXRoX3F1
aWVzY2UgKGRldGFjaGluZyBkZXZpY2UpIChldGgyKQ0KIyMjIyMjIyMjIyMjIyMjIyMgW2xpbmtf
d2F0Y2guY10gbGlua3dhdGNoX2RvX2RldiAtIGNoZWNraW5nIGZvciBuZXRpZl9kZXZpY2VfcHJl
c2VudChldGgyKSA9PiAwDQpJUC1Db25maWc6IEd1ZXNzaW5nIG5ldG1hc2sgMjU1LjI1NS4yNTUu
MA0KSVAtQ29uZmlnOiBDb21wbGV0ZToNCiAgICAgZGV2aWNlPWV0aDIsIGh3YWRkcj0wMDplMDpk
Zjo1Njo1NDowNywgaXBhZGRyPTE5Mi4xNjguMS4yMCwgbWFzaz0yNTUuMjU1LjI1NS4wLCBndz0y
NTUuMjU1LjI1NS4yNTUNCiAgICAgaG9zdD1rbWV0ZXIxLCBkb21haW49LCBuaXMtZG9tYWluPShu
b25lKQ0KICAgICBib290c2VydmVyPTE5Mi4xNjguMS4xMDAsIHJvb3RzZXJ2ZXI9MTkyLjE2OC4x
LjEwMCwgcm9vdHBhdGg9DQojIyMjIyMjIyMjIyMjIyMjIyBbdWNjX2dldGguY10gYWRqdXN0X2xp
bmsgLSBjYWxsaW5nIHVnZXRoX2FjdGl2YXRlIChhdHRhY2hpbmcgZGV2aWNlKSAoZXRoMikNCnVj
Y19nZXRoIGUwMTAzMjAwLnVjYyBldGgyOiBMaW5rIGlzIFVwIC0gMTAwTWJwcy9GdWxsIC0gZmxv
dyBjb250cm9sIG9mZg0KcnBjYmluZDogc2VydmVyIDE5Mi4xNjguMS4xMDAgbm90IHJlc3BvbmRp
bmcsIHRpbWVkIG91dA0KcnBjYmluZDogc2VydmVyIDE5Mi4xNjguMS4xMDAgbm90IHJlc3BvbmRp
bmcsIHRpbWVkIG91dA0KDQpBcyBtZW50aW9uZWQsIGp1c3QgYmVmb3JlIHRoYXQgdGhlIGxpbmt3
YXRjaCBjaGVja3MgZm9yIHRoZSBuZXRfZGV2aWNlIHByZXNlbmNlLCB0aGlzIG9uZSBpcyBkZXRh
Y2hlZCBieSB0aGUgdWNjX2dldGggZHJpdmVyIGFuZCByZWF0dGFjaGVkIGxhdGVyLg0KDQo+IFRo
ZSBkcml2ZXIgaXMgcXVpdGUgb2xkIGFuZCBtYXliZSBzb21lIHBhcnRzIG5lZWQgdG8gYmUgaW1w
cm92ZWQuIFRoZQ0KPiByZWZlcmVuY2VkIGNoYW5nZSBpcyBtb3JlIHRoYW4gYSB5ZWFyIG9sZCBh
bmQgSSdtIG5vdCBhd2FyZSBvZiBhbnkgb3RoZXINCj4gcHJvYmxlbSB3aXRoIGl0LiBTbyBpdCBz
ZWVtcyB0aGUgY2hhbmdlIGlzbid0IHdyb25nLg0KDQpJIGFncmVlLiBJIHBvaW50ZWQgb3V0IHRo
ZSBjb21taXQgYnkgYmlzZWN0aW5nLiBUaGlzIGdhdmUgbWUgdGhlIGRpcmVjdGlvbiB0byB3aGVy
ZSB0aGUgcHJvYmxlbSBjb3VsZCBiZS4gDQoNCj4gPiBUaGlzIGlzIGFscmVhZHkgaGFwcGVuaW5n
IHdpdGggb2xkZXIgdmVyc2lvbnMgKEkgY2hlY2tlZCB3aXRoIHRoZSB2NC4xNC4xNjIpDQo+IGFu
ZCBhbHNvIHRoZXJlIHRoZSBzaXR1YXRpb24gaXMgdGhlIHNhbWUsIGJ1dCB3aXRob3V0IHRoZSBh
ZGRpdGlvbmFsIGNoZWNrIGluDQo+IHRoZSBpZiBjb25kaXRpb24gdGhlIGRldmljZSBpcyBhY3Rp
dmF0ZWQuDQo+ID4NCj4gPiBJIGFtIGN1cnJlbnRseSB3b3JraW5nIHdpdGggdGhlIHY1LjQuOCBr
ZXJuZWwgdmVyc2lvbiwgYnV0IHRoZSBiZWhhdmlvcg0KPiByZW1haW5zIHRoZSBzYW1lIGFsc28g
d2l0aCB0aGUgbGF0ZXN0IHY1LjUtcmM0Lg0KPiA+DQo+ID4gQW55IGlkZWEgaG93IHRvIHNvbHZl
IHRoaXM/IEFueSBoZWxwIGlzIGFwcHJlY2lhdGVkLg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBN
YXR0ZW8NCj4gPg0KPiBIZWluZXINCg0KTWF0dGVvDQo=
