Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 267239B926
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 01:53:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FdXJ4mghzDvrM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 09:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.82; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="B8npcK6D"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FdTZ1GCKzDvrG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 09:51:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in5JjSoCDQ9lPIo/nXeaOmNqDnSNZzAgP3TfDyTCou2gycMd/UVQcKylEpNs+oA5DR9T6HL6XuOyn1YNt6jMf+WZ+clLvQ8IC2X/GekJOIM7XDwfJ71JtmD/OQh3T1EGv23NgkU1lBX8+hgJyPEqwj9w1cwScY1r5K7zquXfhfVe8ZQ7gwIU7puy22xWJBxboHAsWiTTuXL/DrBbCsmeZGtUcwgbkK3rN3XfO32QdWNcaAbK/xNczLevYrbDYfZCOS7587ykrD3o80+fWKWw46aX2S325k+x6uu8yxLaA4UA8Q0L7XYaxSx5Uzow3mieF/25+n0OM18CNUz4oDVSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP52N6SRV3opAkyibbOxpo40MtjA+c03u6xvIg2kUiU=;
 b=cI1WR7O2czLvXGlkgvAI9iWpXp0+75f2zUPt0Stkk6A2mLuex4bjUGr2ng5O+R9R1npsV/Gy4Z9ZJj/ayPip5VG9iJfmXMd4EtQ5lFNZs8vah5yRa1GvdnBoyFMFCsHqpF36QOl9k64CTq28UVBjf1WwrDaXxlLX+FjasHc0Zi6Pn+FpUNQQRDddy1Zn4Ggm6noN98fyK4esTt7RUE4TG7JIKMnqhTzZReYOKryZhtAi/k566HrZ1w8xkQstEJ6E0ID2S68o6F8VnpphXjJodlDi0pUkV+sVSe4dQg5/41vQl9fGAgKKd1mACIMDjuDcyw6Nu2zluw3C6NnkNLsEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP52N6SRV3opAkyibbOxpo40MtjA+c03u6xvIg2kUiU=;
 b=B8npcK6DY+Hua1sraGlSx2sMtzoA1WFi2ws9vNWJGgRAG/dlbNy+mkuBQE9xW6SesVoh4dYNl99Br2wJoP62BqDTDtqHe2yB86p59wSJ12vynl1GVUbhhqLi7rZv1cF3AY5X5ze7M77huo1T0xgzzNMs1+1kNcJll+KGKnFg/f8=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3204.eurprd04.prod.outlook.com (10.167.169.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 23:51:22 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 23:51:22 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 02/10] PCI: designware-ep: Add the doorbell mode of
 MSI-X in EP mode
Thread-Topic: [PATCH v2 02/10] PCI: designware-ep: Add the doorbell mode of
 MSI-X in EP mode
Thread-Index: AQHVWN1XAVKZfsnBgEmktF5uuF46DacIvZWAgACr8dA=
Date: Fri, 23 Aug 2019 23:51:22 +0000
Message-ID: <AM5PR04MB32996961470C59C0F93E6A03F5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-2-xiaowei.bao@nxp.com>
 <20190823133540.GE14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823133540.GE14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f83a6d23-52af-44b5-41cb-08d72824cd91
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR04MB3204; 
x-ms-traffictypediagnostic: AM5PR04MB3204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3204A152A8B7AB61D0261125F5A40@AM5PR04MB3204.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(13464003)(199004)(189003)(81156014)(76176011)(52536014)(6916009)(229853002)(316002)(54906003)(99286004)(86362001)(55016002)(478600001)(9686003)(14454004)(7696005)(66066001)(6436002)(33656002)(71190400001)(71200400001)(446003)(11346002)(6506007)(7416002)(305945005)(74316002)(102836004)(26005)(53546011)(186003)(8676002)(6246003)(81166006)(476003)(6116002)(3846002)(2906002)(53936002)(256004)(7736002)(5660300002)(66946007)(76116006)(66476007)(44832011)(66446008)(486006)(66556008)(64756008)(25786009)(4326008)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3204;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MiRroh4LZ4Z641j/C5vs3yqfm3wnEskx7fkyTRITLTRD5YsxTOs9/Oa4uX03AY5fAmF4/86Rro3lVMXm4cuJeG51LRJdq4dxkAESTo3A9oLW92pvwMS8sjMScc383yWw44qS4xkodfG4ltLel6EOX0jo4OiOQfKvQXtSqNNsSClkVhwld4SkqdN0TvSZkLVBrNUV4z0Md/fm2DLSs6oOALsnCUyGYVWsuZl6awBjuhFDfUdAlQi8xBJHaZKOxlTG1CNkIJkOX4w8BU0KoMEXnMbBTCk13Vo3OFokm6AYq9hpyVDFgLNJz5KZgIRQxpv+88vfgVKCMzliahUaD8vzca5tjU8UmRaANAwvwd5bHx/SRJLIUIIVivYWt7IxntFp+eAgkDmeFzbLQhxVad5Ux5do44LgNoJ+mYmwkaDdRQY=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83a6d23-52af-44b5-41cb-08d72824cd91
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 23:51:22.6848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osvQ9LtaCHilSZHpuPnfLmj2TxvxW57Sn11lvQ6enbueCc9e+Bc65U8h42vHe0wQfrnolYdGuTn4h+Ho3aXnYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3204
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
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIxOjM2DQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2ds
ZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNv
bTsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lz
LmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwMi8xMF0gUENJOiBkZXNpZ253YXJlLWVwOiBBZGQgdGhlIGRv
b3JiZWxsIG1vZGUgb2YNCj4gTVNJLVggaW4gRVAgbW9kZQ0KPiANCj4gT24gVGh1LCBBdWcgMjIs
IDIwMTkgYXQgMDc6MjI6MzRQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4gQWRkIHRo
ZSBkb29yYmVsbCBtb2RlIG9mIE1TSS1YIGluIEVQIG1vZGUuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoN
Cj4gPiAgLSBSZW1vdmUgdGhlIG1hY3JvIG9mIG5vIHVzZWQuDQo+ID4NCj4gPiAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgfCAxNCArKysrKysrKysrKysr
Kw0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCAgICB8
IDEyICsrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRl
c2lnbndhcmUtZXAuYw0KPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLWVwLmMNCj4gPiBpbmRleCAzZTJiNzQwLi5iODM4OGY4IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ID4gKysr
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMNCj4gPiBA
QCAtNDgwLDYgKzQ4MCwyMCBAQCBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2lfaXJxKHN0cnVjdCBk
d19wY2llX2VwDQo+ICplcCwgdTggZnVuY19ubywNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4NCj4gPiAraW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoc3RydWN0IGR3
X3BjaWVfZXAgKmVwLCB1OA0KPiBmdW5jX25vLA0KPiA+ICsJCQkJICAgICAgIHUxNiBpbnRlcnJ1
cHRfbnVtKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9m
cm9tX2VwKGVwKTsNCj4gPiArCXUzMiBtc2dfZGF0YTsNCj4gPiArDQo+ID4gKwltc2dfZGF0YSA9
IChmdW5jX25vIDw8IFBDSUVfTVNJWF9ET09SQkVMTF9QRl9TSElGVCkgfA0KPiA+ICsJCSAgIChp
bnRlcnJ1cHRfbnVtIC0gMSk7DQo+ID4gKw0KPiA+ICsJZHdfcGNpZV93cml0ZWxfZGJpKHBjaSwg
UENJRV9NU0lYX0RPT1JCRUxMLCBtc2dfZGF0YSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gIGludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKHN0cnVjdCBk
d19wY2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCQkJICAgICAgdTE2IGludGVycnVwdF9u
dW0pDQo+ID4gIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1kZXNpZ253YXJlLmgNCj4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZGVzaWdud2FyZS5oDQo+ID4gaW5kZXggYTBmZGJmNy4uODk1YTllZiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oDQo+ID4gQEAgLTg4
LDYgKzg4LDkgQEANCj4gPiAgI2RlZmluZSBQQ0lFX01JU0NfQ09OVFJPTF8xX09GRgkJMHg4QkMN
Cj4gPiAgI2RlZmluZSBQQ0lFX0RCSV9ST19XUl9FTgkJQklUKDApDQo+ID4NCj4gPiArI2RlZmlu
ZSBQQ0lFX01TSVhfRE9PUkJFTEwJCTB4OTQ4DQo+ID4gKyNkZWZpbmUgUENJRV9NU0lYX0RPT1JC
RUxMX1BGX1NISUZUCTI0DQo+ID4gKw0KPiA+ICAvKg0KPiA+ICAgKiBpQVRVIFVucm9sbC1zcGVj
aWZpYyByZWdpc3RlciBkZWZpbml0aW9ucw0KPiA+ICAgKiBGcm9tIDQuODAgY29yZSB2ZXJzaW9u
IHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIHdpbGwgYmUgbWFkZSBieQ0KPiA+IHVucm9sbCBAQCAt
NDAwLDYgKzQwMyw4IEBAIGludCBkd19wY2llX2VwX3JhaXNlX21zaV9pcnEoc3RydWN0DQo+IGR3
X3BjaWVfZXAgKmVwLCB1OCBmdW5jX25vLA0KPiA+ICAJCQkgICAgIHU4IGludGVycnVwdF9udW0p
Ow0KPiA+ICBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycShzdHJ1Y3QgZHdfcGNpZV9lcCAq
ZXAsIHU4IGZ1bmNfbm8sDQo+ID4gIAkJCSAgICAgdTE2IGludGVycnVwdF9udW0pOw0KPiA+ICtp
bnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbChzdHJ1Y3QgZHdfcGNpZV9lcCAq
ZXAsIHU4DQo+IGZ1bmNfbm8sDQo+ID4gKwkJCQkgICAgICAgdTE2IGludGVycnVwdF9udW0pOw0K
PiA+ICB2b2lkIGR3X3BjaWVfZXBfcmVzZXRfYmFyKHN0cnVjdCBkd19wY2llICpwY2ksIGVudW0g
cGNpX2Jhcm5vIGJhcik7DQo+ID4gI2Vsc2UgIHN0YXRpYyBpbmxpbmUgdm9pZCBkd19wY2llX2Vw
X2xpbmt1cChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApIEBADQo+ID4gLTQzMiw2ICs0MzcsMTMgQEAg
c3RhdGljIGlubGluZSBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycShzdHJ1Y3QNCj4gZHdf
cGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+
ID4gK3N0YXRpYyBpbmxpbmUgaW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwo
c3RydWN0IGR3X3BjaWVfZXANCj4gKmVwLA0KPiA+ICsJCQkJCQkgICAgIHU4IGZ1bmNfbm8sDQo+
ID4gKwkJCQkJCSAgICAgdTE2IGludGVycnVwdF9udW0pDQo+ID4gK3sNCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gKw0KPiANCj4gTG9va3MgT0sgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KDQpUaGFua3MgYSBsb3Qu
DQoNCj4gDQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBkd19wY2llX2VwX3Jlc2V0X2JhcihzdHJ1
Y3QgZHdfcGNpZSAqcGNpLCBlbnVtDQo+ID4gcGNpX2Jhcm5vIGJhcikgIHsgIH0NCj4gPiAtLQ0K
PiA+IDIuOS41DQo+ID4NCg==
