Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68016A21E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 10:25:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QxW06JWXzDq8X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 20:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.41; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=pITX30Se; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140041.outbound.protection.outlook.com [40.107.14.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QxS16MshzDqQ6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 20:22:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR5bmWyjoSZtYDIjpU+uGCV6x3DD82ehKArV0tHGd+WKg+BKAsmF0dQZ7RGnqEN1eQwFe9B9hgp0E4eKQp4YqjMlwU8uoLS9JUaFc4+johYURjFHPr5o28GLc+3hydr437yECONlwKgogKLqiJeVN5qRsngiwqTrlQIxnavW/hawGqQhrpyWxx0x2YxMCZGZhxOJQoO3/YuY5KZjhTqAgoDkaaKSubhdddDuYCY4OApVys5lnI2nCZfRKGio9lg/2Fy5FYgOkBmZIG1AXgI49Yds+viDlynbJTWC7KXFgnxFmNMn4HSiqf9ikePWF9K+cQgNkVD8smLr+3E8zIRGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de1aR3MFLCX7Yz5h5aV2dNt/PB6gDlUvr9xuHi6g/Kg=;
 b=KfooYzX42txGeCCCJh0QJjbONCO0ofZzvSdsBhA203tbdDOoo9ZRKOoWD+RHo1Xc7p2d91+0n7lBCK72tvnM76Hv4OH2SeMWWvhOu8XnLWtlnHqYiWel2yBC1KkC6XYWKBbUWhSiuwy4cWegXqdrRRMSh1dHKh+NXnMWA8vQ3Jaj0n9tm4oai3b19inPhpgP9SD9EmEqt4wXrXbceuxjVLFI2h574Xk/CWexV3vTJeOw/uYJi5QdeeZ/aiqwlsQhOztv+MbIopLFlx8TZBtzJR6/PTeSnOvab0LsJK4SZ1eQfLqpXVxTc6hLnxB7wFG3pNeYWgDj9jju0hHZhGkLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de1aR3MFLCX7Yz5h5aV2dNt/PB6gDlUvr9xuHi6g/Kg=;
 b=pITX30SeeFFups8+DfN1kNyZ2/CWHfnVcvsc0XvmbzKvWKWlQsiU2pA0sva+f9Ys8mi1H7arjA5BkaYcgxfduSC4JMHhfOqwdjXbHDb3p3ZLiNs1vJ9jg/+9ZhmlPW1sCUIDbq11ZeG2U2n6OK3Nj7OHBzNwkzToJ6+QpixZImU=
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com (20.179.250.159) by
 DB8PR04MB6907.eurprd04.prod.outlook.com (52.133.242.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Mon, 24 Feb 2020 09:22:48 +0000
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::104b:e88b:b0d3:cdaa]) by DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::104b:e88b:b0d3:cdaa%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:22:48 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>
Subject: RE: [PATCH v6 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Topic: [PATCH v6 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Index: AQHVYUIA2y+cYTzIk0ebobZ1u8h9/agrEWeAgAAI9wCAAALoAIAAB6mw
Date: Mon, 24 Feb 2020 09:22:47 +0000
Message-ID: <DB8PR04MB67474FF5451A647C4495526F84EC0@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190902034319.14026-2-xiaowei.bao@nxp.com>
 <20200224081105.13878-1-michael@walle.cc> <20200224084307.GD27688@dragon>
 <a3aeabddc82ca86e3dca9c26081a0077@walle.cc>
In-Reply-To: <a3aeabddc82ca86e3dca9c26081a0077@walle.cc>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhiqiang.hou@nxp.com; 
x-originating-ip: [223.72.66.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca9c9c18-6fe0-4b13-f624-08d7b90b1d51
x-ms-traffictypediagnostic: DB8PR04MB6907:|DB8PR04MB6907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6907C3D2C62A2BECF5EC59FA84EC0@DB8PR04MB6907.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(7416002)(5660300002)(86362001)(55016002)(9686003)(8676002)(81156014)(81166006)(8936002)(6506007)(53546011)(7696005)(33656002)(52536014)(66476007)(478600001)(66556008)(110136005)(66446008)(316002)(64756008)(4326008)(54906003)(2906002)(71200400001)(26005)(186003)(76116006)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6907;
 H:DB8PR04MB6747.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZLC5LPh151g4wdlqKVWYmB6xZrbqy8oRG5AL708l4N2PZlbdrJirG+vQpviXR0IAFSesM9C4IdL5RfcR7LjDZkVQn5YPB/RqSEmg1u4t/32jcVQ+cN6n/qo+NHEXqhoP5B6cA+e2aQOj2pKxUS6JiY5baCUobcu4d6Wy7JDsw5Ag0RlBNzF7T58Md5D2l+uheka0mm02rjtKXdCBLVbeVMDZdzY9U8uXFoumaXdckRqyO5sBu5yS7+XE5YuVa5qonTr/jIUGPHnqCJzuocSiHSuodQLwlMM0LVPFHndWVpAKND9nuS2V/+igNj32HzX+jwG8YSPaL0bQ2q7/edeRMTA22Gabhi59tTWTB42MTecLxg+wtAIClVL+1HqHFKqN3fIr0iY6pZLipa3XWY1xacm7Z9CgOKBTKI/i18LV37RehNrJyWoYfofpNhYkNv/Z
x-ms-exchange-antispam-messagedata: imaKY1Jdo5rbJ3B5eMwzk84/xhMgymnR7hYn8mBOLH20nKyi+MKJuGrz0zmpHeMrjqA3TnwuIXs1kzekNmY4KYKjDabSUeh99hEczcBJTSDhj6+at1EBsQPdoGU5/VLNzk7kGFgvsbGXuHY8dWh0YQ==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9c9c18-6fe0-4b13-f624-08d7b90b1d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 09:22:48.2924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRHElNM7C0zIZEpnbQHcYXwE7AGqhUrY0LIN+IWSSzYxLUFQDqj7qrX/t6g23l2WLRBFeDg61J4+kWrdnyBj8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWljaGFlbCBhbmQgU2hhd24sDQoNCkknbGwgdXBkYXRlIHRoZSBwYXRjaCB3aXRoIGlvbW11
LW1hcCBwcm9wZXJ0eS4NCg0KVGhhbmtzLA0KWmhpcWlhbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPg0KPiBT
ZW50OiAyMDIwxOoy1MIyNMjVIDE2OjU0DQo+IFRvOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+DQo+IENjOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT47IFoucS4gSG91
DQo+IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT47IGJoZWxnYWFzQGdvb2dsZS5jb207DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47DQo+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmc7DQo+IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207IG1hcmsucnV0bGFuZEBh
cm0uY29tOyBNLmguIExpYW4NCj4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgUm95IFphbmcgPHJv
eS56YW5nQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMi8zXSBhcm02NDogZHRz
OiBsczEwMjhhOiBBZGQgUENJZSBjb250cm9sbGVyIERUDQo+IG5vZGVzDQo+IA0KPiBIaSBTaGF3
biwgYWxsLA0KPiANCj4gQW0gMjAyMC0wMi0yNCAwOTo0Mywgc2NocmllYiBTaGF3biBHdW86DQo+
ID4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDk6MTE6MDVBTSArMDEwMCwgTWljaGFlbCBXYWxs
ZSB3cm90ZToNCj4gPj4gSGkgWGlhb3dlaSwgSGkgU2hhd24sDQo+ID4+DQo+ID4+ID4gTFMxMDI4
YSBpbXBsZW1lbnRzIDIgUENJZSAzLjAgY29udHJvbGxlcnMuDQo+ID4+DQo+ID4+IFBhdGNoIDEv
MyBhbmQgMy8zIGFyZSBpbiBMaW51cycgdHJlZSBidXQgbm9ib2R5IHNlZW1zIHRvIGNhcmUgYWJv
dXQNCj4gPj4gdGhpcyBwYXRjaCBhbnltb3JlIDooDQo+ID4+DQo+ID4+IFRoaXMgZG9lc24ndCB3
b3JrIHdlbGwgd2l0aCB0aGUgSU9NTVUsIGJlY2F1c2UgdGhlIGlvbW11LW1hcCBwcm9wZXJ0eQ0K
PiA+PiBpcyBtaXNzaW5nLiBUaGUgYm9vdGxvYWRlciBuZWVkcyB0aGUgJnNtbXUgcGhhbmRsZSB0
byBmaXh1cCB0aGUNCj4gPj4gZW50cnkuDQo+ID4+IFNlZQ0KPiA+PiBiZWxvdy4NCj4gPj4NCj4g
Pj4gU2hhd24sIHdpbGwgeW91IGFkZCB0aGlzIHBhdGNoIHRvIHlvdXIgdHJlZSBvbmNlIGl0cyBm
aXhlZCwNCj4gPj4gY29uc2lkZXJpbmcgaXQganVzdCBhZGRzIHRoZSBkZXZpY2UgdHJlZSBub2Rl
IGZvciB0aGUgTFMxMDI4QT8NCj4gPg0KPiA+IFRoZSBwYXRjaC90aHJlYWQgaXMgYSBiaXQgYWdl
ZC4gIFlvdSBtYXkgd2FudCB0byBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2gNCj4gPiBmb3IgZGlzY3Vz
c2lvbi4NCj4gDQo+IFNvIHNob3VsZCBJIGp1c3QgcGljayB1cCB0aGUgcGF0Y2ggYWRkIG15IHR3
byBmaXhlcyBhbmQgc2VuZCBpdCBhZ2Fpbj8NCj4gV2hhdCBhYm91dA0KPiB0aGUgU2lnbmVkLW9m
Zi1ieSB0YWdzPyBMZWF2ZSB0aGVtPyBSZXBsYWNlIHRoZW0/IEFkZCBtaW5lPw0KPiANCj4gLW1p
Y2hhZWwNCg==
