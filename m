Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360A2163A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 04:12:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B15YZ63n2zDqfd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::62f;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=ou7GNUzR; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B15Wl0vd9zDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:10:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyrL2iFihE7RsYsF2We2G82yWiKUIkyXXyKf1DjiNSx3xT2f3v7eqPGIPkQjzMk3BjajZcLioYp88kAb61muvBHJxnuou4qUl5JWosGKPds+h/pEOHqGUxpWSKGzjCBOJV7q654gB25NYGf4mCqYrsQhYKlt+MS4qnpuvz9kht7n/Pvm5ckjiSvjAKpEBAHkH3bGpBEl9Vd78oXw+DkMT7mVg7dEJnPztXdqQfPeRLdqd+ohMFyRa7+RlElwHCXFLUSyvrzPeQxig+gGewwdKYHlt7avz6V/t/zoGpwB15jkT7TNRu2eblc5PtUaTL8sPMxzfC7nnV6bhcD76bSzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkvt9d44WSeg4rLQAXj1dgbRIHZepLdkziso5zwhoVQ=;
 b=nIRD9gFTLx6opGiVFevh/PhF29ULr7KS4kHiIpt3buRfK3j8aa5EkSPohsNXvi0DlGUJmK91bDj9+1SEYoZoE+W+ZMX09uS6dyfD9SpB7K7aAGwf6PpL6TD/vK46loznGG+aWo5f+fSMXkeJletB6xRaZcVWQbwT4frrHl13jxWNwunuNGxucqmLWqfQPdV2IGkFrqb74bSJMj93TjxsgFUVFjNbR7RfcjbWazIQGjFUW8SWiXSgjvuNRYOl9NX3Y/d/U6cWh3plk/E4sCaPRvmqDXkInSvZBi/JuTXjjZCgs1Th+QwIxX6l6iMhkXWfBKhoL1VsQDWhUqGbIcEueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkvt9d44WSeg4rLQAXj1dgbRIHZepLdkziso5zwhoVQ=;
 b=ou7GNUzR1PSAwsHNb7fYrB2B12VieU4NL/2KJRytU7kKvTUKe1Xkqosw78e6rBf9fUaOaHdcNnJ+Rf+h2pqJc4SQ9zljjXoOxduIoTEMnmN3a3XGDNzXy0pgVIDG+IVaOBSVT59/GkYQet15a6KXZf8/C2YHvA5eWhTB8DM0Kig=
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2555.eurprd04.prod.outlook.com (2603:10a6:3:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 02:10:46 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::418b:e236:d88e:a9f9]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::418b:e236:d88e:a9f9%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 02:10:46 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Xiaowei Bao
 <xiaowei.bao@nxp.com>
Subject: RE: [PATCH v6 00/11] Add the multiple PF support for DWC and
 Layerscape
Thread-Topic: [PATCH v6 00/11] Add the multiple PF support for DWC and
 Layerscape
Thread-Index: AQHV+bLj01n3GWgjzE++c2j/0E2bY6j7Eg6AgAEAchA=
Date: Tue, 7 Jul 2020 02:10:45 +0000
Message-ID: <HE1PR0402MB337186C44C944E0E360730BC84660@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20200314033038.24844-1-xiaowei.bao@nxp.com>
 <20200706104639.GC26377@e121166-lin.cambridge.arm.com>
In-Reply-To: <20200706104639.GC26377@e121166-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1963346-86e8-4cf0-ca70-08d8221af5c0
x-ms-traffictypediagnostic: HE1PR0401MB2555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0401MB255566C0CA0431C8136F634984660@HE1PR0401MB2555.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2KFa2i85k2ZZ0gwc0eRGLtNZg7ovR0zMGLeN8FDvYCi7sdHQJdYhf1xkhYaj9c2laAC3p+ebX6rSg6gLUGOCPuXpIR7UQVykvuSxCzJFzt68+N2LfBO/kZZwx0h3lBL44ygR32iJ2/hn3+yBvu4gSHKpLL/2EzYfjU/EjOrMy7rgCUmtsTwP0VX77Q3TjNdbCTLmdLDi8Ug/RPK9fIVX1mqE4nMi6iN5NwnXXWmK1/mXMSExzL+OAcWEw6aywZq5YJPXYnpMWrlzz5GIIgET1GpE6RcifYzF3vxI9T/TjtoQmin73lGQP+UkKKMZgUGL7LU11D6+AtX6/IQxtQF56g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3371.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(66446008)(2906002)(6636002)(33656002)(86362001)(26005)(5660300002)(52536014)(9686003)(53546011)(55016002)(6506007)(71200400001)(186003)(110136005)(54906003)(316002)(478600001)(7696005)(64756008)(66476007)(66556008)(66946007)(83380400001)(4326008)(7416002)(8936002)(76116006)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zRqlyK4SnfWcjsYrxnGQ+Pp7pQHUNPIu55IDw4BnyeqwdNlfwx56bp5RYzKFbPHcyAlr/HpU7Kw5Zu7+wTRAq1re5JS2A60fj+htzZGW/FwNaV1WawAjDcuR47ILyQ/QoMC84bRaZ7qFeEFx45ehz/pt+kRju5w4RdsypjY4z6OQx8Q9jQK2ZFORNvqUF4EJeJZakjN61IjB+mAbRfBu0qQSVI15CzhKLBQWfXlGAEuYq4TmzDUX0uthh2gmT6MxsZU2tyn3HAviQH/52M3d8ahJY7DF0R/pVh6PcXhI18F+ozY5vDafQlAP/62ZxQmSvL49W9RQ6f7DORssp2OOqofeVRDEKS67tHe/7LRFrnylvBlqz6CSbXQwFdV4SaK8QrpDW5dCOPRVbJdH0FRo2DP/JgEIuMU8bDEPEOix6MXpEVHCPiSG11n+eb2i2pKCkKSxyEVfDjs0SBO4XSOsIU2kgcCV/K5SvZF1C0/ZtAI=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1963346-86e8-4cf0-ca70-08d8221af5c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 02:10:45.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Njo6WdFbvHS6fiF3/c2nBmOKq2qim0Ug1ZpTXjCnxaPN+39ArSjrZD1fAQTETyRtJcsitpr43GN0BDn1m9Fmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2555
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
Cc: Roy Zang <roy.zang@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>,
 "kishon@ti.com" <kishon@ti.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTG9yZW56bywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMb3Jl
bnpvIFBpZXJhbGlzaSBbbWFpbHRvOmxvcmVuem8ucGllcmFsaXNpQGFybS5jb21dDQo+IFNlbnQ6
IDIwMjDE6jfUwjbI1SAxODo0Nw0KPiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5j
b20+DQo+IENjOiBaLnEuIEhvdSA8emhpcWlhbmcuaG91QG54cC5jb20+OyBNLmguIExpYW4gPG1p
bmdodWFuLmxpYW5AbnhwLmNvbT47DQo+IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47
IGJoZWxnYWFzQGdvb2dsZS5jb207DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2Vy
bmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+Ow0KPiBraXNob25AdGkuY29tOyBS
b3kgWmFuZyA8cm95LnphbmdAbnhwLmNvbT47DQo+IGFtdXJyYXlAdGhlZ29vZHBlbmd1aW4uY28u
dWs7IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNv
bTsgYW5kcmV3Lm11cnJheUBhcm0uY29tOw0KPiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eHBwYy1kZXZA
bGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAwLzExXSBBZGQgdGhl
IG11bHRpcGxlIFBGIHN1cHBvcnQgZm9yIERXQyBhbmQNCj4gTGF5ZXJzY2FwZQ0KPiANCj4gT24g
U2F0LCBNYXIgMTQsIDIwMjAgYXQgMTE6MzA6MjdBTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6
DQo+ID4gQWRkIHRoZSBQQ0llIEVQIG11bHRpcGxlIFBGIHN1cHBvcnQgZm9yIERXQyBhbmQgTGF5
ZXJzY2FwZSwgYWRkIHRoZQ0KPiA+IGRvb3JiZWxsIE1TSVggZnVuY3Rpb24gZm9yIERXQywgdXNl
IGxpc3QgdG8gbWFuYWdlIHRoZSBQRiBvZiBvbmUgUENJZQ0KPiA+IGNvbnRyb2xsZXIsIGFuZCBy
ZWZhY3RvciB0aGUgTGF5ZXJzY2FwZSBFUCBkcml2ZXIgZHVlIHRvIHNvbWUNCj4gPiBwbGF0Zm9y
bXMgZGlmZmVyZW5jZS4NCj4gPg0KPiA+IFhpYW93ZWkgQmFvICgxMSk6DQo+ID4gICBQQ0k6IGRl
c2lnbndhcmUtZXA6IEFkZCBtdWx0aXBsZSBQRnMgc3VwcG9ydCBmb3IgRFdDDQo+ID4gICBQQ0k6
IGRlc2lnbndhcmUtZXA6IEFkZCB0aGUgZG9vcmJlbGwgbW9kZSBvZiBNU0ktWCBpbiBFUCBtb2Rl
DQo+ID4gICBQQ0k6IGRlc2lnbndhcmUtZXA6IE1vdmUgdGhlIGZ1bmN0aW9uIG9mIGdldHRpbmcg
TVNJIGNhcGFiaWxpdHkNCj4gPiAgICAgZm9yd2FyZA0KPiA+ICAgUENJOiBkZXNpZ253YXJlLWVw
OiBNb2RpZnkgTVNJIGFuZCBNU0lYIENBUCB3YXkgb2YgZmluZGluZw0KPiA+ICAgZHQtYmluZGlu
Z3M6IHBjaTogbGF5ZXJzY2FwZS1wY2k6IEFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIGxzMTA4
OGENCj4gPiAgICAgYW5kIGxzMjA4OGENCj4gPiAgIFBDSTogbGF5ZXJzY2FwZTogRml4IHNvbWUg
Zm9ybWF0IGlzc3VlIG9mIHRoZSBjb2RlDQo+ID4gICBQQ0k6IGxheWVyc2NhcGU6IE1vZGlmeSB0
aGUgd2F5IG9mIGdldHRpbmcgY2FwYWJpbGl0eSB3aXRoIGRpZmZlcmVudA0KPiA+ICAgICBQRVgN
Cj4gPiAgIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSBNU0lYIHRvIHRoZSBkb29yYmVsbCBt
b2RlDQo+ID4gICBQQ0k6IGxheWVyc2NhcGU6IEFkZCBFUCBtb2RlIHN1cHBvcnQgZm9yIGxzMTA4
OGEgYW5kIGxzMjA4OGENCj4gPiAgIGFybTY0OiBkdHM6IGxheWVyc2NhcGU6IEFkZCBQQ0llIEVQ
IG5vZGUgZm9yIGxzMTA4OGENCj4gPiAgIG1pc2M6IHBjaV9lbmRwb2ludF90ZXN0OiBBZGQgTFMx
MDg4YSBpbiBwY2lfZGV2aWNlX2lkIHRhYmxlDQo+ID4NCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLnR4dCAgICAgfCAgIDIgKw0KPiA+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpICAgICB8ICAzMSArKysNCj4gPiAg
ZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kw0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jICAg
ICB8IDEwMCArKysrKystLQ0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRl
c2lnbndhcmUtZXAuYyAgICB8IDI1NQ0KPiArKysrKysrKysrKysrKysrKy0tLS0NCj4gPiAgZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMgICAgICAgfCAgNTkgKysr
LS0NCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmggICAg
ICAgfCAgNDggKysrLQ0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDQwNCBpbnNlcnRpb25zKCspLCA5
MyBkZWxldGlvbnMoLSkNCj4gDQo+IENhbiB5b3UgcmViYXNlIGl0IGFnYWluc3QgdjUuOC1yYzEg
cGxlYXNlID8NCg0KWWVzLCBJIHdpbGwgaGVscCB0byByZWJhc2UuDQoNClRoYW5rcywNClpoaXFp
YW5nDQoNCj4gDQo+IFRoYW5rcywNCj4gTG9yZW56bw0K
