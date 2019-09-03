Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68EA5F41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 04:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MrDH4XJ9zDqg7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.70; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="KRVqsJ4l"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30070.outbound.protection.outlook.com [40.107.3.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mr8Z1t7pzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 12:13:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma3m84ILS7fqLfRGC35H5t77Fv9oV91FI1ockVWv6RHSOix/h05M/U2EnvqGsiMQZdydyxa70Y3WmbPrRTsUyXyzUNgkULyjwhAmsjRVa55f7PyzkSrj4zRmNLXfmvyUX9Lh8vswDGlmdHyg051yeJ52VzvmFo33aIFT8XtHbWdacJSsc7xrPF7i7CEdtoLIFLSQUuLnmSX5PljbdvniG+ch2qz75H7vXgwIeLE/bZ9CytNyX8Mxuhx13ypP89TAqfyHxMV0+InL4GRfJLRQJ+nxAnFs5f4OaDFJJskKxEt5n439cp22iLeqDS1XXV076boHuKDrfK0YEGohDwf0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0dO+2UBSkFVXRUArK0J6jQGOzxODu5+LHeH5Y4bXSw=;
 b=N+TDCH+lGxQLuQvJuWHWpkojeZsgdY6MjKVKmJAd0rIjd0HJZSq/l1EeWFUSzxs8U13jIUWZ4M4oOhrz4OE2v8FJYA34pt69hmLzh9i6vLz/ljOmgnubIrxNODzou2DpTQrvRS5MEm4DCcnrGfeQIGvOuwA9wQRodQ2TERy6QMpDKCDxLWyYkNu4FHknm2chTR0gDSAfan4Et6MPTTiuiz2rZcB8mg01YcdSUe0eK8v9N0QXHSxPyxVRgnJfbxon+ujfF+V75L61PtsHOg68Z218Wf8s+xu1HkBJ95zb+R1EDYpbXa5+UBnIq8od1HxPF06ADfIXpD5HchH3ua3DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0dO+2UBSkFVXRUArK0J6jQGOzxODu5+LHeH5Y4bXSw=;
 b=KRVqsJ4l1xLz2+D3tdrUiy37AkGVvZcF/Rcxcd6DvY88IR0AJKMYs86pfc+vQpKMT51XPyldiu9aZ86iZDZL30pTV3rxsJi0ZRCPVB083K+bgHnn6XVRIFCyr99StcKwLfXsTMye/HpA1LkMjavMOrjk1Uay8ABXCIIbxnO1f30=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3028.eurprd04.prod.outlook.com (10.167.170.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 02:13:12 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 02:13:12 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 07/11] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Topic: [PATCH v3 07/11] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Index: AQHVYT5m+MlmLHYqiUmikXHftOthjqcYZLmAgADSr+A=
Date: Tue, 3 Sep 2019 02:13:12 +0000
Message-ID: <AM5PR04MB329925CC756321C1072B3DA7F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-8-xiaowei.bao@nxp.com>
 <20190902133747.GN9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902133747.GN9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ff6fb6-657f-4464-d9f1-08d7301445d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3028; 
x-ms-traffictypediagnostic: AM5PR04MB3028:|AM5PR04MB3028:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3028FFF0554B8E2F090E6B23F5B90@AM5PR04MB3028.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(13464003)(6116002)(3846002)(9686003)(25786009)(4326008)(102836004)(26005)(74316002)(6436002)(55016002)(186003)(53546011)(6506007)(86362001)(478600001)(52536014)(5660300002)(53936002)(6246003)(14454004)(8936002)(66066001)(2906002)(7736002)(81156014)(476003)(44832011)(8676002)(81166006)(486006)(11346002)(446003)(33656002)(316002)(99286004)(305945005)(256004)(71190400001)(71200400001)(6916009)(7696005)(76176011)(66946007)(66446008)(76116006)(229853002)(54906003)(64756008)(66556008)(7416002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3028;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kV/LkRDxDe8PLdTMDMGyhct0F7iseZD2NbqhGQEX0PfjD33xn7OZO5RNZEc4c/MJUwu5m953/LzDsbDJEOTVLBeqa5AMH/KAyEfY6gGK+6EKN/4YuqNfXXH6UROnYcFv6ZL3KRebq2+9XFMKirqdxzTD+7tzwm5n4nOlbS8GFbFbGkPHWESRN0AaQcgVzZxnPYobgqm4MJ/NupDDOnzarYOFRFFsljGKLTi8p9tDSK1F+0+esquNkg8+lk7n5xOIe8j+WPcvEwO0B0EeMKJQOZdFytA2LGbrmmSeRVnthvmgEvTL908FzdG8MV8F48WYEwaU/4p5rum/jC2eYbhZKIPKAbCef2ISchsUVdqqxezGn96NyXXguNZMpfXwJID4/6ndgp0uomhvAKHk+DH0WmN/W9IxdtnWdnt81K1DZu4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ff6fb6-657f-4464-d9f1-08d7301445d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 02:13:12.4433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1fvUHwFcO7YNSe8D84vbrebvAGjIjgDYrLZZzP6frL5ryhBlboabJipZpCroSOLHIFFyqKroeOhsjKxk7ktug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3028
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
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIyyNUgMjE6MzgNCj4gVG86
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExp
IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamlu
Z29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5k
ZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+IDx6aGlxaWFuZy5ob3VA
bnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwNy8xMV0gUENJOiBsYXllcnNjYXBl
OiBNb2RpZnkgdGhlIHdheSBvZiBnZXR0aW5nDQo+IGNhcGFiaWxpdHkgd2l0aCBkaWZmZXJlbnQg
UEVYDQo+IA0KPiBPbiBNb24sIFNlcCAwMiwgMjAxOSBhdCAxMToxNzoxMkFNICswODAwLCBYaWFv
d2VpIEJhbyB3cm90ZToNCj4gPiBUaGUgZGlmZmVyZW50IFBDSWUgY29udHJvbGxlciBpbiBvbmUg
Ym9hcmQgbWF5IGJlIGhhdmUgZGlmZmVyZW50DQo+ID4gY2FwYWJpbGl0eSBvZiBNU0kgb3IgTVNJ
WCwgc28gY2hhbmdlIHRoZSB3YXkgb2YgZ2V0dGluZyB0aGUgTVNJDQo+ID4gY2FwYWJpbGl0eSwg
bWFrZSBpdCBtb3JlIGZsZXhpYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBC
YW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+IA0KPiBQbGVhc2Ugc2VlIHRoZSBjb21tZW50cyBJ
IGp1c3QgbWFkZSB0byBLaXNob24ncyBmZWVkYmFjayBpbiB0aGUgdGhyZWFkIGZvcg0KPiB0aGlz
IHBhdGNoIGluIHNlcmllcyB2Mi4NCg0KSSBoYXZlIHJlcGx5IHRoZSBjb21tZW50cyBpbiBzZXJp
ZXMgdjIsIGV4cGVjdCBLaXNob24ncyBmZWVkYmFjay4NCg0KVGhhbmtzDQpYaWFvd2VpDQoNCj4g
DQo+IFRoYW5rcywNCj4gDQo+IEFuZHJldyBNdXJyYXkNCj4gDQo+ID4gLS0tDQo+ID4gdjI6DQo+
ID4gIC0gUmVtb3ZlIHRoZSByZXBlYXRlZCBhc3NpZ25tZW50IGNvZGUuDQo+ID4gdjM6DQo+ID4g
IC0gVXNlIGVwX2Z1bmMgbXNpX2NhcCBhbmQgbXNpeF9jYXAgdG8gZGVjaWRlIHRoZSBtc2lfY2Fw
YWJsZSBhbmQNCj4gPiAgICBtc2l4X2NhcGFibGUgb2YgcGNpX2VwY19mZWF0dXJlcyBzdHJ1Y3Qu
DQo+ID4NCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAu
YyB8IDMxDQo+ID4gKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGluZGV4
IGE5YzU1MmUuLjFlMDcyODcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiBAQCAtMjIsNiArMjIsNyBAQA0KPiA+DQo+
ID4gIHN0cnVjdCBsc19wY2llX2VwIHsNCj4gPiAgCXN0cnVjdCBkd19wY2llCQkqcGNpOw0KPiA+
ICsJc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMJKmxzX2VwYzsNCj4gPiAgfTsNCj4gPg0KPiA+ICAj
ZGVmaW5lIHRvX2xzX3BjaWVfZXAoeCkJZGV2X2dldF9kcnZkYXRhKCh4KS0+ZGV2KQ0KPiA+IEBA
IC00MCwyNiArNDEsMzEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gbHNf
cGNpZV9lcF9vZl9tYXRjaFtdID0gew0KPiA+ICAJeyB9LA0KPiA+ICB9Ow0KPiA+DQo+ID4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcyBsc19wY2llX2VwY19mZWF0dXJlcyA9
IHsNCj4gPiAtCS5saW5rdXBfbm90aWZpZXIgPSBmYWxzZSwNCj4gPiAtCS5tc2lfY2FwYWJsZSA9
IHRydWUsDQo+ID4gLQkubXNpeF9jYXBhYmxlID0gZmFsc2UsDQo+ID4gLQkuYmFyX2ZpeGVkXzY0
Yml0ID0gKDEgPDwgQkFSXzIpIHwgKDEgPDwgQkFSXzQpLA0KPiA+IC19Ow0KPiA+IC0NCj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzKiAgbHNfcGNpZV9lcF9nZXRfZmVh
dHVyZXMoc3RydWN0DQo+ID4gZHdfcGNpZV9lcCAqZXApICB7DQo+ID4gLQlyZXR1cm4gJmxzX3Bj
aWVfZXBjX2ZlYXR1cmVzOw0KPiA+ICsJc3RydWN0IGR3X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVf
ZnJvbV9lcChlcCk7DQo+ID4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVf
ZXAocGNpKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcGNpZS0+bHNfZXBjOw0KPiA+ICB9DQo+ID4N
Cj4gPiAgc3RhdGljIHZvaWQgbHNfcGNpZV9lcF9pbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkg
IHsNCj4gPiAgCXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0K
PiA+ICsJc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUgPSB0b19sc19wY2llX2VwKHBjaSk7DQo+ID4g
KwlzdHJ1Y3QgZHdfcGNpZV9lcF9mdW5jICplcF9mdW5jOw0KPiA+ICAJZW51bSBwY2lfYmFybm8g
YmFyOw0KPiA+DQo+ID4gKwllcF9mdW5jID0gZHdfcGNpZV9lcF9nZXRfZnVuY19mcm9tX2VwKGVw
LCAwKTsNCj4gPiArCWlmICghZXBfZnVuYykNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICAJ
Zm9yIChiYXIgPSBCQVJfMDsgYmFyIDw9IEJBUl81OyBiYXIrKykNCj4gPiAgCQlkd19wY2llX2Vw
X3Jlc2V0X2JhcihwY2ksIGJhcik7DQo+ID4gKw0KPiA+ICsJcGNpZS0+bHNfZXBjLT5tc2lfY2Fw
YWJsZSA9IGVwX2Z1bmMtPm1zaV9jYXAgPyB0cnVlIDogZmFsc2U7DQo+ID4gKwlwY2llLT5sc19l
cGMtPm1zaXhfY2FwYWJsZSA9IGVwX2Z1bmMtPm1zaXhfY2FwID8gdHJ1ZSA6IGZhbHNlOw0KPiA+
ICB9DQo+ID4NCj4gPiAgc3RhdGljIGludCBsc19wY2llX2VwX3JhaXNlX2lycShzdHJ1Y3QgZHdf
cGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sIEBADQo+ID4gLTExOSw2ICsxMjUsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBsc19wY2llX2VwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBk
ZXYpDQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICAJc3RydWN0
IGR3X3BjaWUgKnBjaTsNCj4gPiAgCXN0cnVjdCBsc19wY2llX2VwICpwY2llOw0KPiA+ICsJc3Ry
dWN0IHBjaV9lcGNfZmVhdHVyZXMgKmxzX2VwYzsNCj4gPiAgCXN0cnVjdCByZXNvdXJjZSAqZGJp
X2Jhc2U7DQo+ID4gIAlpbnQgcmV0Ow0KPiA+DQo+ID4gQEAgLTEzMCw2ICsxMzcsMTAgQEAgc3Rh
dGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICAJaWYgKCFwY2kpDQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4g
PiArCWxzX2VwYyA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbHNfZXBjKSwgR0ZQX0tFUk5F
TCk7DQo+ID4gKwlpZiAoIWxzX2VwYykNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+
ID4gIAlkYmlfYmFzZSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNP
VVJDRV9NRU0sDQo+ICJyZWdzIik7DQo+ID4gIAlwY2ktPmRiaV9iYXNlID0gZGV2bV9wY2lfcmVt
YXBfY2ZnX3Jlc291cmNlKGRldiwgZGJpX2Jhc2UpOw0KPiA+ICAJaWYgKElTX0VSUihwY2ktPmRi
aV9iYXNlKSkNCj4gPiBAQCAtMTQwLDYgKzE1MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19w
Y2llX2VwX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlwY2kt
Pm9wcyA9ICZsc19wY2llX2VwX29wczsNCj4gPiAgCXBjaWUtPnBjaSA9IHBjaTsNCj4gPg0KPiA+
ICsJbHNfZXBjLT5iYXJfZml4ZWRfNjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCks
DQo+ID4gKw0KPiA+ICsJcGNpZS0+bHNfZXBjID0gbHNfZXBjOw0KPiA+ICsNCj4gPiAgCXBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsIHBjaWUpOw0KPiA+DQo+ID4gIAlyZXQgPSBsc19hZGRfcGNp
ZV9lcChwY2llLCBwZGV2KTsNCj4gPiAtLQ0KPiA+IDIuOS41DQo+ID4NCg==
