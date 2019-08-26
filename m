Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FC9C80C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 05:53:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gylc1bKlzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:53:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.70; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="VveozXkx"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Gyjr4kpTzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 13:51:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UauIugfyws2+vRr31GnlfyFI3ElVKO1bBWxRCpIoHrKgl7/eQQnYgHujx2wv9PZ/kLvg3aG6l4/3rqYW9S7FJXMLfFxKZ+H5IJbUixTbVOYES5s6LtYxp6L2E5TmB7PMYDLKn46KOqGQAjNysdkZN3EGCtZauwVTCQjF5ClCSyWzFna5Sr5jvn4jJ5vAELSzIg+cfpAKQMKzJIo0AY9/l0FrPMJrrI6F7RYzDopsNJIIRcERD7J++TdPZPvSAgW+ga7G1I5epU8ddQ+YE7AbH02P8xF4CKgExQUWyMwnyrKb13lnBrcnKhBovgOuPw/IXD1x5+qyYcazZ5YG3BeiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek6wvCAJrwG1V7CeeehOPF7bqNQlAPNFnDrKQqRLseY=;
 b=m6Nv+0OyQ+pUfxdOiH3bwRj7xM6diKbWkTTeeEzdQQbu0px+gOPnM63McflO/8Wpg3gKH2jao5CnZmDq2vR+zNnJBqSX3iIGjXizIjBI7xmTchaT6ee5BUrgu04kNjZXsQDUGLUmcy+C0XoJLZ1yYKOlHlqV/hA2knJvn+OhCPL7Qhg8AP3hxWvfCY1z+Nx3zUgLy1b/wpKwsLEDuqUYpsZLOlodW8H/r/glW+nYPZuFs5rx4Bdtk+g3j/3glJLI7PSAPJXFzfejdQy76EDnyFScEdIkWDUkLVDXuX9B4mvXnPNutrO6AvkEt8isSK1cr3WS+wgaxLu4YcSflZLsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek6wvCAJrwG1V7CeeehOPF7bqNQlAPNFnDrKQqRLseY=;
 b=VveozXkxkfas4wcP3X5y7c09mjj1mUpHkBbyMI+7t5eeSaNMGXF7bPVeg/qktx/+m5Hx7CU6WleH8Lv8DIBGNaB+zxsvGuovThLBcT9s9zwBJ0/2GQPX9gbo3nTV3H3JOetXAOGcKkkZu9SCRKTdFoyJEVrUOxVwCXt209i3ajA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3012.eurprd04.prod.outlook.com (10.175.230.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:51:34 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 03:51:34 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCH v4 1/3] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1028a-pcie"
Thread-Topic: [PATCH v4 1/3] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1028a-pcie"
Thread-Index: AQHVWY3s6uRWml0OaEOV4KW/xSS6MKcIxFWAgAQK8oA=
Date: Mon, 26 Aug 2019 03:51:34 +0000
Message-ID: <AM5PR04MB3299C9DB7F9F21F6362ADDB2F5A10@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190823082643.10903-1-xiaowei.bao@nxp.com>
 <20190823140447.GA19283@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190823140447.GA19283@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01c55c48-67f6-4d3f-4749-08d729d8b03a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3012; 
x-ms-traffictypediagnostic: AM5PR04MB3012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB30126086D09A8168E430083AF5A10@AM5PR04MB3012.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(13464003)(189003)(199004)(2906002)(81156014)(81166006)(25786009)(54906003)(52536014)(229853002)(7736002)(76116006)(64756008)(66446008)(7416002)(66556008)(6436002)(5660300002)(99286004)(66946007)(26005)(102836004)(305945005)(186003)(76176011)(7696005)(53546011)(6506007)(11346002)(476003)(486006)(44832011)(66066001)(256004)(446003)(6116002)(55016002)(14454004)(6246003)(33656002)(71200400001)(9686003)(3846002)(86362001)(74316002)(6916009)(4326008)(8676002)(8936002)(478600001)(71190400001)(53936002)(316002)(66476007)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3012;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VAkr6Wn6QFPXAFPSFd08qroilTJ8aGE/qMuW7EDoWEMfHx0iaNNuLBk9bixgoVrTR9j9dmDyWu3LqW88CI7yGdYGq6lqv7nT9CFi/9Hu3vLD+jPIl1SuuRTeqyLK9YL0SfwNbeZDAG9oHc2wmtMkZk38M7l0ZkEFK6SHQSuoXuSDUs3cc1zGrne7Ty5L9MFGVof6ouR0AIcFdxdK8F9DOk78OkHxZCVYWR2i/0DZ6gHga8zWRunaQbjW/IEk8AHEaz7TeSBLi+cJf48B/rLsTdB4nqWbLVW6KRPrUAj+UpQsg77lib0Se0OkC/DWg2bCJ2Chq4M+pzRVhLfA1T/rjL4V8r4WLoBkqZ5qxKDuur3CpfOu2aZhvrHCrAlpz2kA8pTGY3upT3xxu3yOIziNquFLjPGejsbRJc3d48GgyQ4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c55c48-67f6-4d3f-4749-08d729d8b03a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:51:34.1269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zK/APWX+TSLGYBLmK81MuGSuiLJIJ5ccdx7fkZ9pkz3z8GVR5l9IB9yl9E2hx9klZDBYIg8eDVZ3de8GuGxrtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3012
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMTnE6jjUwjIzyNUgMjI6
MDUNCj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtk
dEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsg
TGVvDQo+IExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBNLmguIExpYW4gPG1pbmdodWFuLmxpYW5A
bnhwLmNvbT47IE1pbmdrYWkgSHUNCj4gPG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveSBaYW5nIDxy
b3kuemFuZ0BueHAuY29tPjsNCj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXhwcGMtZGV2QGxpc3RzLm96
bGFicy5vcmc7IFoucS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT47DQo+IGJoZWxnYWFzQGdv
b2dsZS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzNdIGR0LWJpbmRpbmdzOiBwY2k6
IGxheWVyc2NhcGUtcGNpOiBhZGQgY29tcGF0aWJsZQ0KPiBzdHJpbmdzICJmc2wsbHMxMDI4YS1w
Y2llIg0KPiANCj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDQ6MjY6NDFQTSArMDgwMCwgWGlh
b3dlaSBCYW8gd3JvdGU6DQo+ID4gQWRkIHRoZSBQQ0llIGNvbXBhdGlibGUgc3RyaW5nIGZvciBM
UzEwMjhBDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9A
bnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBu
eHAuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
PiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIE5vIGNoYW5nZS4NCj4gPiB2MzoNCj4gPiAgLSBObyBj
aGFuZ2UuDQo+ID4gdjQ6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+DQo+ID4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0IHwgMSArDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50
eHQNCj4gPiBpbmRleCBlMjBjZWFhLi45OWEzODZlIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50
eHQNCj4gPiBAQCAtMjEsNiArMjEsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAg
ICAgICJmc2wsbHMxMDQ2YS1wY2llIg0KPiA+ICAgICAgICAgICJmc2wsbHMxMDQzYS1wY2llIg0K
PiA+ICAgICAgICAgICJmc2wsbHMxMDEyYS1wY2llIg0KPiA+ICsgICAgICAgICJmc2wsbHMxMDI4
YS1wY2llIg0KPiA+ICAgIEVQIG1vZGU6DQo+ID4gIAkiZnNsLGxzMTA0NmEtcGNpZS1lcCIsICJm
c2wsbHMtcGNpZS1lcCINCj4gPiAgLSByZWc6IGJhc2UgYWRkcmVzc2VzIGFuZCBsZW5ndGhzIG9m
IHRoZSBQQ0llIGNvbnRyb2xsZXIgcmVnaXN0ZXIgYmxvY2tzLg0KPiANCj4gVGhpcyBzZXJpZXMg
ZG9lcyBub3QgYXBwbHkgdG8gdjUuMy1yYzEsIHdoYXQgaXMgaXQgYmFzZWQgb24gPw0KDQp0aGVz
ZSBzZXQgcGF0Y2hlcyBiYXNlIG9uIHY1LjMtcmMzLCB0aGFua3MuDQoNCj4gDQo+IExvcmVuem8N
Cg==
