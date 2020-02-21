Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A6D168A53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 00:20:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PS9D2ZV7zDqQB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 10:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::628;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=brUUn6Xy; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PS7s0SZmzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 10:18:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgjDtzcGKCxvMVEMRoAXhbKbZMlg1t+rVmFxkZ0+oVTYFqmSO5F5ozpq3Gr8eSbO9vsa3NsPhT5LjpvdKr+O/bCueLVIXUjJynFzCt5V8/sxjk7AJZ9NS2U6Db/k13PhHx9hCpnsA6pDeR0QzSBIfRv8y5rt54V1+EHJU3dZmD4k24wGlZbn+PCnofoJLd7pw1mNaNikp38swRn4mbjFwf5A85T+jVCpY2IZKM6CvERZXb1SMGVVOQMgyxoRleiwjkQiWaz46yGPnYv4eyZ/2O8eoWmONcUgCVFxh+EbFxJjY1JjiON39SFlhCVfbZjvRfxk1ixZY2zEeffn/q/F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGcNXHh9S+Kkp+bniHPr3wV6kd48X6gdMwyoeXqMwVA=;
 b=aRK5CVuydiqw2baQQucQoE1+BwMwOO0AetoUU5ysiUP8cHjmf7+xkyu0l91VHkaB3rcpXRIAly40nGDLTceh5MKEej2F/woRF/vjpcYdZttu5hJMGQauTFxfv2jyw+2wprzIxpwkSghXTHeLuzLUXQJICLh3yhS3p2cRQm+QnN3cDZJMouJUG3llsmo2Jx0AvKxLFMxK8qtTHWR/7jgF+q2plBU1o/8gu7yyXz1NVtlyxeQf3idkG3YACZ4CuMMgTiudcSJyWffXNvc1YwLJYz2f7Mhz48gENh7SuwpiTntz6TAnmNdQQTiDg0EO8iJ5Jv1Eo23g/0vgtOGEuAvQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGcNXHh9S+Kkp+bniHPr3wV6kd48X6gdMwyoeXqMwVA=;
 b=brUUn6XyBCU9FWCRRugu6X5ZHf8BANL7Ex+ek6D/cIsVanIfkVmbvd27+yIgCSceYnqUi1szM43LVqLdoUn2c+yIRvsWJgbmSV5eHppPMIV6JPzzYg9NQntgl5nZtAQ3gYwwAcUP2XXZpMey/qDK9YKYxPVM5r2sZ8SKOzKYumQ=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) by
 VE1PR04MB6382.eurprd04.prod.outlook.com (20.179.234.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 21 Feb 2020 23:18:38 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b896:5bc0:c4dd:bd23]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b896:5bc0:c4dd:bd23%2]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 23:18:38 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Colin King <colin.king@canonical.com>, Roy Pledge <roy.pledge@nxp.com>,
 Youri Querry <youri.querry_1@nxp.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH][next] soc: fsl: dpio: fix dereference of pointer p before
 null check
Thread-Topic: [PATCH][next] soc: fsl: dpio: fix dereference of pointer p
 before null check
Thread-Index: AQHV6QxK4GBO4LDKQkW+6fNAYtWLS6gmR4EA
Date: Fri, 21 Feb 2020 23:18:38 +0000
Message-ID: <VE1PR04MB6687C23030FD3C59BA5EC1EE8F120@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200221231143.30131-1-colin.king@canonical.com>
In-Reply-To: <20200221231143.30131-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59477418-5cc5-4896-457c-08d7b7246202
x-ms-traffictypediagnostic: VE1PR04MB6382:|VE1PR04MB6382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB63823E59551312CE216CA6A58F120@VE1PR04MB6382.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(8936002)(8676002)(81156014)(86362001)(76116006)(66476007)(52536014)(64756008)(54906003)(81166006)(110136005)(33656002)(5660300002)(66446008)(66556008)(66946007)(4326008)(71200400001)(7696005)(316002)(478600001)(55016002)(26005)(6506007)(9686003)(2906002)(186003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6382;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RyghmJby+uYZ0EPBqzjDq36mTfBUwjWlUudFpqp1jzs4h+sPgzKAb0an4hyKX+uZAdUhxAxsxrftCRc0Hnf7E50nJU/NxPwhJ+m32RIPNbH1/rZorDna5RmVDuq7wh2nQJsDkm+V94Gv3/Y5ZVpO9oXQcadyWw2T7+yMImqkUYNkdmGwmWeE0wXhqRf/9VwsvFdBFSxXAXsuhZy7uwgY0zeesFR6vcO4X1osodkjKjag2q/bIw4gLOnvDsBZPQnVbZXRT3MRSBwM+/AmICfQATzYoH0CNi2lpiJhZ5OSZNlWxQLIp5h88aclp30O1unTw7o3Bz+sKeApII7YURBx+bmJyxUsWcql9+jmsom2sIXah7ir4zRlpNWyMauUXvwOlmCgHcM5CXE0AK5qjbwJmu2ZR1nYTiMdDmUJCr9MRdnU4xoVj9Y3aSW2rJ6lWHGT
x-ms-exchange-antispam-messagedata: AjBywuOWAN0zvB3ar/pKhoRqV13h2AAei6zjeDvm/xyKfoIT3+zPGyMtPJKmigX5MsMNStxb+A5bGMxETZScF+hDBXpCg5bjx1Ov9EYg3YMncSlHsHu+74VrxgdympAC02imJa3QRnzDzv+6W/CE9A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59477418-5cc5-4896-457c-08d7b7246202
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 23:18:38.6366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6B4hIZBTkEm+zMPImW80rDCng0s/nOOcc2vLAvD20N09J25ThvYRoO2P3kZHWCz1FvAmUrR5GPiQEV4EvYlxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29saW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIxLCAyMDIw
IDU6MTIgUE0NCj4gVG86IFJveSBQbGVkZ2UgPHJveS5wbGVkZ2VAbnhwLmNvbT47IExlbyBMaSA8
bGVveWFuZy5saUBueHAuY29tPjsgWW91cmkNCj4gUXVlcnJ5IDx5b3VyaS5xdWVycnlfMUBueHAu
Y29tPjsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LQ0KPiBhcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIXVtuZXh0
XSBzb2M6IGZzbDogZHBpbzogZml4IGRlcmVmZXJlbmNlIG9mIHBvaW50ZXIgcCBiZWZvcmUgbnVs
bA0KPiBjaGVjaw0KPiANCj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4NCj4gDQo+IFBvaW50ZXIgcCBpcyBjdXJyZW50bHkgYmVpbmcgZGVyZWZlcmVuY2Vk
IGJlZm9yZSBpdCBpcyBudWxsIGNoZWNrZWQgb24gYQ0KPiBtZW1vcnkgYWxsb2NhdGlvbiBmYWls
dXJlIGNoZWNrLiBGaXggdGhpcyBieSBjaGVja2luZyBpZiBwIGlzIG51bGwgYmVmb3JlDQo+IGRl
cmVmZXJlbmNpbmcgaXQuDQo+IA0KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2Ug
YmVmb3JlIG51bGwgY2hlY2siKQ0KPiBGaXhlczogM2IyYWJkYTdkMjhjICgic29jOiBmc2w6IGRw
aW86IFJlcGxhY2UgUU1BTiBhcnJheSBtb2RlIHdpdGggcmluZw0KPiBtb2RlIGVucXVldWUiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pg0KDQpBcHBsaWVkIGZvciBuZXh0LiAgVGhhbmtzLg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9zb2Mv
ZnNsL2RwaW8vcWJtYW4tcG9ydGFsLmMgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2ZzbC9kcGlvL3FibWFuLXBvcnRhbC5jDQo+IGIvZHJpdmVycy9zb2MvZnNsL2RwaW8vcWJt
YW4tcG9ydGFsLmMNCj4gaW5kZXggNzQwZWUwZDE5NTgyLi5kMWY0OWNhYTViMTMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9kcGlvL3FibWFuLXBvcnRhbC5jDQo+ICsrKyBiL2RyaXZl
cnMvc29jL2ZzbC9kcGlvL3FibWFuLXBvcnRhbC5jDQo+IEBAIC0yNDksMTAgKzI0OSwxMSBAQCBz
dHJ1Y3QgcWJtYW5fc3dwICpxYm1hbl9zd3BfaW5pdChjb25zdCBzdHJ1Y3QNCj4gcWJtYW5fc3dw
X2Rlc2MgKmQpDQo+ICAJdTMyIG1hc2tfc2l6ZTsNCj4gIAl1MzIgZXFjcl9waTsNCj4gDQo+IC0J
c3Bpbl9sb2NrX2luaXQoJnAtPmFjY2Vzc19zcGlubG9jayk7DQo+IC0NCj4gIAlpZiAoIXApDQo+
ICAJCXJldHVybiBOVUxMOw0KPiArDQo+ICsJc3Bpbl9sb2NrX2luaXQoJnAtPmFjY2Vzc19zcGlu
bG9jayk7DQo+ICsNCj4gIAlwLT5kZXNjID0gZDsNCj4gIAlwLT5tYy52YWxpZF9iaXQgPSBRQl9W
QUxJRF9CSVQ7DQo+ICAJcC0+c2RxID0gMDsNCj4gLS0NCj4gMi4yNS4wDQoNCg==
