Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E39C801
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 05:38:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GyQz0pXlzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:38:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.70; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="okULqsBN"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150070.outbound.protection.outlook.com [40.107.15.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GyP82HqFzDqS9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 13:37:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9bny2/blIWb/XV3T88EinNQLmekPZSouLkUR9HCIUjwGy+qjzXxcwLivJt/+6drv/vebncyIOQ565m2TjiaeLYOuDLE4FnJsaBh9sBTYQebl2rjJ9ktQXbaEYcmIhPwZCOKnj8V8SQDA9uC7Bt2zAUxLGFqRPbJT45K+Q63MzDARM+eOXnYh4TmJYT528PSCLdPUKwe988tkGVjrxFSrWG5Qi6NpU8AhI2KGAJrqvmTG12SSnmygvfsU059BwAkKlOlKNprPChDGJITNyF2bSs26KKjv+Kc1QMQ7Qjilt0snxiEcF96ramhbueUDy73g1KgkX+wMVp0NDVy8jCR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4FChrmHv5UDT5ugRWWV+KnrNckxmPSFLXGxAXeTjCE=;
 b=GopLfl02jJc4RFNpcFjJo2qhv2DB51ZgS1H2mMtgdJ4tMQmYTSm2pTKm8n9nhU4Z7VI62gc/TO7dTH28wBAphu63j63wwgJpE3+DAfGxx5r6jKZrNVYGyakwoQ6mWVzO61PRcbBPMorlXloSvZ7pk3ftdvt1EO/6LxYgXymmfPMk7wrrgdv1qUNFOl2BzQkBla1Y05/zMZY2fCL7bPw0MDJGQxUtQx/Mhhk5UYW9bC9KZ1xunxMWFKtsny+lyoVZGgRsZ/69KR/YNIrDWgAKLkXSAw3q8A/DA9ae3sJADhVODIAzgK2h5cSKpOj+zSfdQLp0dHcwF7gXsny4EGwaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4FChrmHv5UDT5ugRWWV+KnrNckxmPSFLXGxAXeTjCE=;
 b=okULqsBNqFx0mBiKmnaxyN6IZR/WBikVBuS30cf+9TC+itGUUA6Qm6qvFHS79MafqLq8Su4TtXI3dxHDTKEQ0y03oD79PLbLvyaHhp1TYRdP+7WkR9/BnPmxfhHWFkzHyrK0R/1DvfAn7yxUt2g9ql0km+n4+eMrb9Kgkq85ChU=
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com (20.179.250.159) by
 DB8PR04MB5850.eurprd04.prod.outlook.com (20.179.11.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:37:05 +0000
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::19ec:cddf:5e07:37eb]) by DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::19ec:cddf:5e07:37eb%3]) with mapi id 15.20.2178.020; Mon, 26 Aug 2019
 03:37:05 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, "lorenzo.pieralisi@arm.com"
 <lorenzo.pieralisi@arm.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Topic: [PATCH v4 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Index: AQHVWY3s5t6agznRCEKNWBnD4dyCJacMyuug
Date: Mon, 26 Aug 2019 03:37:05 +0000
Message-ID: <DB8PR04MB67473F20531D2A7B7ABBB12D84A10@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190823082643.10903-1-xiaowei.bao@nxp.com>
 <20190823082643.10903-2-xiaowei.bao@nxp.com>
In-Reply-To: <20190823082643.10903-2-xiaowei.bao@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhiqiang.hou@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b3a094d-db46-477b-bf08-08d729d6aa84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB5850; 
x-ms-traffictypediagnostic: DB8PR04MB5850:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB58503E1DF9BCE335CDB0D86284A10@DB8PR04MB5850.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(13464003)(189003)(199004)(54906003)(102836004)(66946007)(110136005)(76116006)(53546011)(6506007)(3846002)(66446008)(7696005)(64756008)(66476007)(66556008)(316002)(6116002)(86362001)(45080400002)(14444005)(14454004)(71190400001)(2201001)(256004)(74316002)(76176011)(71200400001)(53936002)(26005)(6436002)(6306002)(66066001)(9686003)(55016002)(52536014)(8676002)(5660300002)(305945005)(186003)(7736002)(8936002)(33656002)(2906002)(99286004)(486006)(478600001)(446003)(11346002)(476003)(966005)(2501003)(81156014)(81166006)(229853002)(4326008)(25786009)(6246003)(7416002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB5850;
 H:DB8PR04MB6747.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yq3G7jxJwkcgwQAZNFEegIghdlNbfP6Ad1LIJ2cjuqED4AoSlw5vVFaMj23LVNMhkKz4k3dsz9as79LhSnrlW9H/sZTHuNplnReC2T4W25Gt1kCDS3cdYSByHIHBT8FjqhmaZPQTQCqkKXXRjmr5+l7vWDw01IBUE7jx+qK62P5LHPuKIQrGdWmi/xL2QyjNaUxr+FJZofIhw4ELNVXLBYOGcHL9EMFa26F/fNfqJ+t63QgHrzMcLES4O+kSAzDU04shzk0Mk0F4go4JcmGgTZgJR5P6pSjfdaGG1kWHbotKf0NmAGvwQ6/m0Kz8q2+YVjgWb+WkkYJGe7+aP5VmUwtpGHJLhWV5LSwJ0GE4lQFlmkMBMaAKgLVNXn6eu9u33WPM7fe1C1kGsy6uVvCHW+n+ESvupKMEK886ZKvEzGk=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3a094d-db46-477b-bf08-08d729d6aa84
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:37:05.5092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFEb1IIpgyTUxKoWlPepSLk+J3KvUZZJHGXroqsoWhQimdTiAkCKYw8GDxvQx60TUZEtTZ+CkVzxLufO+JybKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5850
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
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgWGlhb3dlaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYaWFv
d2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gU2VudDogMjAxOcTqONTCMjPI1SAxNjoy
Nw0KPiBUbzogcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25n
dW9Aa2VybmVsLm9yZzsNCj4gTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBNLmguIExpYW4g
PG1pbmdodWFuLmxpYW5AbnhwLmNvbT47DQo+IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNv
bT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJt
LmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IFoucS4N
Cj4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2dsZS5jb207
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPjsgWi5xLiBIb3UNCj4gPHpoaXFpYW5n
LmhvdUBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjQgMi8zXSBhcm02NDogZHRzOiBsczEw
MjhhOiBBZGQgUENJZSBjb250cm9sbGVyIERUIG5vZGVzDQo+IA0KPiBMUzEwMjhhIGltcGxlbWVu
dHMgMiBQQ0llIDMuMCBjb250cm9sbGVycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFhpYW93ZWkg
QmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcg
PFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiAtLS0NCj4gdjI6DQo+ICAtIEZpeCB1cCB0aGUgbGVn
YWN5IElOVHggYWxsb2NhdGUgZmFpbGVkIGlzc3VlLg0KPiB2MzoNCj4gIC0gTm8gY2hhbmdlLg0K
PiB2NDoNCj4gIC0gUmVtb3ZlIHRoZSBudW0tbGFuZXMgcHJvcGFydHkuDQo+IGRlcGVuZHMgb246
DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRnBhdGNoDQo+IHdvcmsua2VybmVsLm9yZyUyRnByb2plY3QlMkZsaW51eC1w
Y2klMkZsaXN0JTJGJTNGc2VyaWVzJTNEMTYyMjE1JmENCj4gbXA7ZGF0YT0wMiU3QzAxJTdDemhp
cWlhbmcuaG91JTQwbnhwLmNvbSU3QzA3YTM5YzhhMzgxMTQ4NTJhZDgNCj4gODA4ZDcyN2E1MGVh
OCU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mw0KPiA3MDIx
NDYyMTc0ODA5NDg3JmFtcDtzZGF0YT1NVFZzVVBQb3kyTnJNanBYRzRCTW9jSElOMEdia2gzVw0K
PiA4U042MjJRTUxJOCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiANCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kgfCA1MA0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS5kdHNpDQo+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaQ0KPiBpbmRl
eCA3MmI5YTc1Li5hMjVmOWQ5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMxMDI4YS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kNCj4gQEAgLTYyNSw2ICs2MjUsNTYgQEANCj4gIAkJCX07
DQo+ICAJCX07DQo+IA0KPiArCQlwY2llQDM0MDAwMDAgew0KPiArCQkJY29tcGF0aWJsZSA9ICJm
c2wsbHMxMDI4YS1wY2llIjsNCj4gKwkJCXJlZyA9IDwweDAwIDB4MDM0MDAwMDAgMHgwIDB4MDAx
MDAwMDAgICAvKiBjb250cm9sbGVyDQo+IHJlZ2lzdGVycyAqLw0KPiArCQkJICAgICAgIDB4ODAg
MHgwMDAwMDAwMCAweDAgMHgwMDAwMjAwMD47IC8qIGNvbmZpZ3VyYXRpb24NCj4gc3BhY2UgKi8N
Cj4gKwkJCXJlZy1uYW1lcyA9ICJyZWdzIiwgImNvbmZpZyI7DQo+ICsJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgMTA4IElSUV9UWVBFX0xFVkVMX0hJR0g+LCAvKiBQTUUNCj4gaW50ZXJydXB0ICov
DQo+ICsJCQkJICAgICA8R0lDX1NQSSAxMDkgSVJRX1RZUEVfTEVWRUxfSElHSD47IC8qIGFlcg0K
PiBpbnRlcnJ1cHQgKi8NCj4gKwkJCWludGVycnVwdC1uYW1lcyA9ICJwbWUiLCAiYWVyIjsNCj4g
KwkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Ow0KPiArCQkJI3NpemUtY2VsbHMgPSA8Mj47DQo+ICsJ
CQlkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiArCQkJZG1hLWNvaGVyZW50Ow0KPiArCQkJYnVzLXJh
bmdlID0gPDB4MCAweGZmPjsNCj4gKwkJCXJhbmdlcyA9IDwweDgxMDAwMDAwIDB4MCAweDAwMDAw
MDAwIDB4ODAgMHgwMDAxMDAwMCAweDANCj4gMHgwMDAxMDAwMCAgIC8qIGRvd25zdHJlYW0gSS9P
ICovDQo+ICsJCQkJICAweDgyMDAwMDAwIDB4MCAweDQwMDAwMDAwIDB4ODAgMHg0MDAwMDAwMCAw
eDANCj4gMHg0MDAwMDAwMD47IC8qIG5vbi1wcmVmZXRjaGFibGUgbWVtb3J5ICovDQo+ICsJCQlt
c2ktcGFyZW50ID0gPCZpdHM+Ow0KPiArCQkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsNCj4gKwkJ
CWludGVycnVwdC1tYXAtbWFzayA9IDwwIDAgMCA3PjsNCj4gKwkJCWludGVycnVwdC1tYXAgPSA8
MDAwMCAwIDAgMSAmZ2ljIDAgMCBHSUNfU1BJIDEwOQ0KPiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwN
Cj4gKwkJCQkJPDAwMDAgMCAwIDIgJmdpYyAwIDAgR0lDX1NQSSAxMTANCj4gSVJRX1RZUEVfTEVW
RUxfSElHSD4sDQo+ICsJCQkJCTwwMDAwIDAgMCAzICZnaWMgMCAwIEdJQ19TUEkgMTExDQo+IElS
UV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJCQk8MDAwMCAwIDAgNCAmZ2ljIDAgMCBHSUNfU1BJ
IDExMg0KPiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ICsJCX07DQoNCmxvc3QgdGhlIHByb3BlcnR5IG51bS12aWV3cG9ydC4NCg0KPiArDQo+ICsJ
CXBjaWVAMzUwMDAwMCB7DQo+ICsJCQljb21wYXRpYmxlID0gImZzbCxsczEwMjhhLXBjaWUiOw0K
PiArCQkJcmVnID0gPDB4MDAgMHgwMzUwMDAwMCAweDAgMHgwMDEwMDAwMCAgIC8qIGNvbnRyb2xs
ZXINCj4gcmVnaXN0ZXJzICovDQo+ICsJCQkgICAgICAgMHg4OCAweDAwMDAwMDAwIDB4MCAweDAw
MDAyMDAwPjsgLyogY29uZmlndXJhdGlvbg0KPiBzcGFjZSAqLw0KPiArCQkJcmVnLW5hbWVzID0g
InJlZ3MiLCAiY29uZmlnIjsNCj4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTMgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJICAgICA8R0lDX1NQSSAxMTQgSVJRX1RZUEVfTEVWRUxf
SElHSD47DQo+ICsJCQlpbnRlcnJ1cHQtbmFtZXMgPSAicG1lIiwgImFlciI7DQo+ICsJCQkjYWRk
cmVzcy1jZWxscyA9IDwzPjsNCj4gKwkJCSNzaXplLWNlbGxzID0gPDI+Ow0KPiArCQkJZGV2aWNl
X3R5cGUgPSAicGNpIjsNCj4gKwkJCWRtYS1jb2hlcmVudDsNCj4gKwkJCWJ1cy1yYW5nZSA9IDww
eDAgMHhmZj47DQo+ICsJCQlyYW5nZXMgPSA8MHg4MTAwMDAwMCAweDAgMHgwMDAwMDAwMCAweDg4
IDB4MDAwMTAwMDAgMHgwDQo+IDB4MDAwMTAwMDAgICAvKiBkb3duc3RyZWFtIEkvTyAqLw0KPiAr
CQkJCSAgMHg4MjAwMDAwMCAweDAgMHg0MDAwMDAwMCAweDg4IDB4NDAwMDAwMDAgMHgwDQo+IDB4
NDAwMDAwMDA+OyAvKiBub24tcHJlZmV0Y2hhYmxlIG1lbW9yeSAqLw0KPiArCQkJbXNpLXBhcmVu
dCA9IDwmaXRzPjsNCj4gKwkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQo+ICsJCQlpbnRlcnJ1
cHQtbWFwLW1hc2sgPSA8MCAwIDAgNz47DQo+ICsJCQlpbnRlcnJ1cHQtbWFwID0gPDAwMDAgMCAw
IDEgJmdpYyAwIDAgR0lDX1NQSSAxMTQNCj4gSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJ
CTwwMDAwIDAgMCAyICZnaWMgMCAwIEdJQ19TUEkgMTE1DQo+IElSUV9UWVBFX0xFVkVMX0hJR0g+
LA0KPiArCQkJCQk8MDAwMCAwIDAgMyAmZ2ljIDAgMCBHSUNfU1BJIDExNg0KPiBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwNCj4gKwkJCQkJPDAwMDAgMCAwIDQgJmdpYyAwIDAgR0lDX1NQSSAxMTcNCj4g
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiArCQl9
Ow0KDQpEaXR0bw0KDQpUaGFua3MsDQpaaGlxaWFuZw0KPiArDQo+ICAJCXBjaWVAMWYwMDAwMDAw
IHsgLyogSW50ZWdyYXRlZCBFbmRwb2ludCBSb290IENvbXBsZXggKi8NCj4gIAkJCWNvbXBhdGli
bGUgPSAicGNpLWhvc3QtZWNhbS1nZW5lcmljIjsNCj4gIAkJCXJlZyA9IDwweDAxIDB4ZjAwMDAw
MDAgMHgwIDB4MTAwMDAwPjsNCj4gLS0NCj4gMi45LjUNCg0K
