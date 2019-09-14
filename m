Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CAB2A19
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 08:39:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VjXq0rkNzF2WQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 16:39:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.76; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="MH2XPCei"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40076.outbound.protection.outlook.com [40.107.4.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VjW15TBdzF5r8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 16:38:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XltCg2OcaXZ8iawY6kc7lhugLxwVApq0C23+OcTVo2DjYvXzAOEAocGY5981v7tPOJnWcUkRrUA3xMaEGiRRVwdoNsGwPyoafrwQiXPIjGHY0ra3vQLAJiG8yqe08vP6caQQbeGl8Uor6SBQ6NLUmnSC1pKnTeW4uk18f4nlVP/WzeQgKaTCQ0ZRxeb3SISPXlg3DPPGIsxPBHfCN+MhJsWwN3sCFBdqkN18TXEkidiYdAeo+maYkSq3kzjVkl4iWLsRoP+dxotYqsFv8tZcoh9KrIFfw3UWJ9ETEFtUbbJc8Xt0bfRFEcQ+tity8s30uKp61wtE9r2Z0TcalD4ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMkal4EhlamPTWsYPmwGKbo3JJrVvEVT3wY/3sjA3mM=;
 b=TgvvtuVYW4GmO7Iw11Bm278A8mPUXunKwmWk6ymjtT0Uymd3V0cKbZIV1Pa/JEb3pODEAvE6WbRN3hNxzWD2Gflr/sM2f2hF+Dbq3XzY7KvZy6URoAZ2lo+JlT/hH7erabfV2oVjuyyEew36xR5KlrAAfIp1pa+VEA7xHGBPEgE+OEiWXA9Fh3luvGHMe9o2yKLrFhIyTBDU9wbLSu9b6/93Wlr4SuTvYMPFct3S71idKBRE5ICjuNOuzV85mYLts+JrVQPojebQkEamYfgxwqmyPrXSa7Sb3oY/W+CF+JGRUG4/e378fFL8FXRVAqnVYzfqII1xRyDgYY40hFxd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMkal4EhlamPTWsYPmwGKbo3JJrVvEVT3wY/3sjA3mM=;
 b=MH2XPCei/yrg/o/oKLaaqMUcVp5E3uZmb5OONxlx623SweztR52fZbAYO50q8v6JJkVQtEzkVNrKrjUPSfF/DKTCN4kIMj3bHW2pX/fuTmZOA8+YpqWOHSd8w7CLlRNxVNISdgWiV9YQMlrQEw4QrR1yCGvG2WPdLjS4E38kMNs=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3139.eurprd04.prod.outlook.com (10.167.171.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Sat, 14 Sep 2019 06:37:54 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2241.022; Sat, 14 Sep 2019
 06:37:54 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Andrew Murray
 <andrew.murray@arm.com>
Subject: RE: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the doorbell
 mode
Thread-Topic: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the
 doorbell mode
Thread-Index: AQHVYT5nWcaogrOwy0eLEkU3GTDhxqcYSeeAgA+sxYCAAtRzAA==
Date: Sat, 14 Sep 2019 06:37:54 +0000
Message-ID: <AM5PR04MB32994FAF102AD4F760792808F5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-9-xiaowei.bao@nxp.com>
 <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
 <DM6PR12MB40100CC1C0E64040652C3BFBDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB40100CC1C0E64040652C3BFBDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 736a6fd2-a8b1-408b-72ab-08d738de129e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3139; 
x-ms-traffictypediagnostic: AM5PR04MB3139:|AM5PR04MB3139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3139BEA296E7E6D44F7D9043F5B20@AM5PR04MB3139.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01604FB62B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(13464003)(189003)(199004)(305945005)(55016002)(186003)(99286004)(25786009)(53546011)(2906002)(53936002)(102836004)(9686003)(54906003)(3846002)(26005)(33656002)(6116002)(316002)(66946007)(66476007)(64756008)(66446008)(229853002)(66556008)(86362001)(76116006)(7736002)(4326008)(81166006)(74316002)(44832011)(486006)(6246003)(81156014)(8936002)(8676002)(476003)(11346002)(71200400001)(71190400001)(110136005)(6506007)(256004)(446003)(66066001)(7696005)(7416002)(14444005)(76176011)(52536014)(14454004)(5660300002)(6436002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3139;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5gcK6M5ap2M86M2KRH3zPMa/4pfQNWmGLXK+LaYrQsM4rmhLT9u4p9WXcMUw5MyQShGAy7nlivwXWtu+0Jvqh1Z1mh3RTYNPq13Bh0JdXEKKRh4giddzr+iMEgrwGRsocyq86vjCIQvEc8EmU2l4CcVM21vUekXOFvZEHhy8f2IzVuoMg4cg44w8uYNZd3AbqcjQdCQsU1OPzfU9SvJLkoKBH9Qj2hEs0/bSPoYxsFjASqTyy5DdIKBJSqzwce2Niv1hv4QkQj3lkeXI8xVr2Vhb6wGmV+nRngFH+8Q1ib9jfBuNAPq0FMX/Zlz1m4MtrEYNwoQXVbYwRealwZP1SYH/q+9bKJRF0bKkHjwZ3xQ5/RHG8DXF4BsmkAGGNY8wGj/SHOdK/BZPaNWOcT8nhbNawcGpVu/ehPw7gH++Oqo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736a6fd2-a8b1-408b-72ab-08d738de129e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2019 06:37:54.0894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2YzivQHC/3wWrDsYhclkKkMobkr0sP1OQO0KfCOcjxVqzSiGAm+hbXjem2BG5+FPe8bW3CJMPZuIiLciVJzqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3139
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VzdGF2byBQaW1lbnRl
bCA8R3VzdGF2by5QaW1lbnRlbEBzeW5vcHN5cy5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyIMTLm
l6UgMTk6MjQNCj4gVG86IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT47IFhp
YW93ZWkgQmFvDQo+IDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExp
IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamlu
Z29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5k
ZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+IDx6aGlxaWFuZy5ob3VA
bnhwLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MyAwOC8xMV0gUENJOiBsYXllcnNjYXBl
OiBNb2RpZnkgdGhlIE1TSVggdG8gdGhlDQo+IGRvb3JiZWxsIG1vZGUNCj4gDQo+IEhpLA0KPiAN
Cj4gU29ycnkgZm9yIHRoZSBkZWxheSBJIHdhcyBpbiBwYXJlbnRhbCBsZWF2ZSBhbmQgSSdtIHN0
aWxsIHRyeWluZyBub3QgdG8gZHJvd24gaW4NCj4gdGhlIG1haWxpbmcgbGlzdCBlbWFpbHMuLi4g
8J+Yig0KPiANCj4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMzoxOjQ3LCBBbmRyZXcgTXVycmF5
IDxhbmRyZXcubXVycmF5QGFybS5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBPbiBNb24sIFNlcCAw
MiwgMjAxOSBhdCAxMToxNzoxM0FNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+IGR3
X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgd2FzIG5ldmVyIGNhbGxlZCBpbiB0aGUgZXhpc2l0bmcg
ZHJpdmVyDQo+ID4gPiBiZWZvcmUsIGJlY2F1c2UgdGhlIGxzMTA0NmEgcGxhdGZvcm0gZG9uJ3Qg
c3VwcG9ydCB0aGUgTVNJWCBmZWF0dXJlDQo+ID4gPiBhbmQgbXNpeF9jYXBhYmxlIHdhcyBhbHdh
eXMgc2V0IHRvIGZhbHNlLg0KPiA+ID4gTm93IHRoYXQgYWRkIHRoZSBsczEwODhhIHBsYXRmb3Jt
IHdpdGggTVNJWCBzdXBwb3J0LCBidXQgdGhlDQo+ID4gPiBleGlzdGluZyBkd19wY2llX2VwX3Jh
aXNlX21zaXhfaXJxIGRvZXNuJ3Qgd29yaywgc28gdXNlIHRoZSBkb29yYmVsbA0KPiA+ID4gbWV0
aG9kIHRvIHN1cHBvcnQgdGhlIE1TSVggZmVhdHVyZS4NCj4gDQo+IEh1bS4uLiB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgbXNpeCBpbXBsZW1lbnRhdGlvbiBkaWQgd29yayBvbiBteSB1c2UgY2FzZSwN
Cj4gaG93ZXZlciwgYXQgdGhlIHRpbWUgdGhlIHNldHVwIHVzZWQgZm9yIGRldmVsb3BpbmcgYW5k
IHRlc3RpbmcgdGhlDQo+IGltcGxlbWVudGF0aW9uIG9ubHkgaGFkIG9uZSBQRiAoYnkgZGVmYXVs
dCAwKS4gUGVyaGFwcyB0aGlzIGNvdWxkIHdhcyBpcw0KPiBjYXVzaW5nIHRoZSBkaWZmZXJlbnQg
YmVoYXZpb3IgYmV0d2VlbiBvdXIgc2V0dXBzLg0KPiANCj4gWW91IGhhdmUgbW9yZSB0aGFuIG9u
ZSBQRiwgcmlnaHQ/DQoNClllcywgSSBoYXZlIHR3byBQRnMuDQoNClRoYW5rcw0KWGlhb3dlaQ0K
DQo+IA0KPiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgbXNpeCBmZWF0dXJlIHN1cHBvcnQgZW50
ZXJlZCBvbiBrZXJuZWwgNC4xOSB2ZXJzaW9uDQo+IGFuZCBpdCB3b3JrZWQgcXVpdGUgd2VsbCBh
dCB0aGUgdGltZSwgYnV0IEkgZGlkbid0IHRlc3Qgc2luY2UgdGhlcmUgKEkndmUgdG8NCj4gbWFu
YWdlIHRpbWUgdG8gYmUgYWJsZSB0byByZXRlc3QgaXQgYWdhaW4pLCBJJ20gZGlkbid0IHNlZW4g
YW55IHBhdGNoIHRoYXQNCj4gY291bGQgaW50ZXJmZXJlIHdpdGggdGhpcy4NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IEd1c3Rhdm8NCj4gDQo+IA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW93
ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPg0KPiA+ID4gLS0tDQo+ID4gPiB2
MjoNCj4gPiA+ICAtIE5vIGNoYW5nZQ0KPiA+ID4gdjM6DQo+ID4gPiAgLSBNb2RpZnkgdGhlIGNv
bW1pdCBtZXNzYWdlIG1ha2UgaXQgY2xlYXJseS4NCj4gPiA+DQo+ID4gPiAgZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyB8IDMgKystDQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5j
DQo+ID4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMN
Cj4gPiA+IGluZGV4IDFlMDcyODcuLjVmMGNiOTkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiBAQCAtNzks
NyArNzksOCBAQCBzdGF0aWMgaW50IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19wY2ll
X2VwDQo+ICplcCwgdTggZnVuY19ubywNCj4gPiA+ICAJY2FzZSBQQ0lfRVBDX0lSUV9NU0k6DQo+
ID4gPiAgCQlyZXR1cm4gZHdfcGNpZV9lcF9yYWlzZV9tc2lfaXJxKGVwLCBmdW5jX25vLCBpbnRl
cnJ1cHRfbnVtKTsNCj4gPiA+ICAJY2FzZSBQQ0lfRVBDX0lSUV9NU0lYOg0KPiA+ID4gLQkJcmV0
dXJuIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEoZXAsIGZ1bmNfbm8sIGludGVycnVwdF9udW0p
Ow0KPiA+ID4gKwkJcmV0dXJuIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoZXAs
IGZ1bmNfbm8sDQo+ID4gPiArCQkJCQkJCSAgaW50ZXJydXB0X251bSk7DQo+ID4gPiAgCWRlZmF1
bHQ6DQo+ID4gPiAgCQlkZXZfZXJyKHBjaS0+ZGV2LCAiVU5LTk9XTiBJUlEgdHlwZVxuIik7DQo+
ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+IC0tDQo+ID4gPiAyLjkuNQ0KPiA+ID4NCj4g
DQoNCg==
