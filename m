Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E322E1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 10:13:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456s9B1TwQzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 18:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.52; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xou2uT1h"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456s7h6YsSzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 18:12:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO6v2+9Q+oADiaXWyc2Lm1KtzVYLG6nKk2XzKVg3ow4=;
 b=Xou2uT1hbXirRseG/wIeBmHzAusiVnGCea2K3qi6b9EbfqZN+kInJZdvLFVoDJu+QzT1KHVsMnVDziKKdciYbYs9FWFqAds+ZhZZ3BajzfJlep8CXSxlNdJBaTUi2dc+yCWrG/QugdZP/78VXFX3tFeU1wW5iLbrz2QwGdib/so=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3185.eurprd04.prod.outlook.com (10.173.255.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 08:12:06 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::15e3:bb28:7e33:1adb]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::15e3:bb28:7e33:1adb%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 08:12:06 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: RE: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT
 nodes
Thread-Topic: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller
 DT nodes
Thread-Index: AQHVCvDcQiDXhQiDJU+q/k8vTUL4F6Zr0/6AgALH2dCAAGu0gIAEp57w
Date: Mon, 20 May 2019 08:12:06 +0000
Message-ID: <AM5PR04MB329911C71C671C52925495B6F5060@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190515072747.39941-2-xiaowei.bao@nxp.com>
 <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
 <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
In-Reply-To: <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fed7f85d-fc29-45da-a19e-08d6dcfad97c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3185; 
x-ms-traffictypediagnostic: AM5PR04MB3185:
x-microsoft-antispam-prvs: <AM5PR04MB3185B66690DB51613E170726F5060@AM5PR04MB3185.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(39860400002)(396003)(189003)(199004)(13464003)(8676002)(99286004)(44832011)(25786009)(53546011)(6436002)(6506007)(86362001)(229853002)(316002)(54906003)(66946007)(52536014)(5660300002)(53936002)(9686003)(68736007)(6916009)(76116006)(73956011)(66446008)(64756008)(66556008)(66476007)(256004)(74316002)(2906002)(305945005)(14444005)(66066001)(7416002)(14454004)(33656002)(186003)(7736002)(4326008)(446003)(11346002)(102836004)(71200400001)(55016002)(8936002)(476003)(81156014)(478600001)(81166006)(486006)(7696005)(76176011)(6116002)(71190400001)(3846002)(26005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3185;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eR1bepXtERoaalI8zAbub3pAfqDDAdbnJ9ub/IzLfZ/Za8kPLsyMrItjzEC2iPySi0FH7bhKX//5/NUxdAfqXQiaTr8n2NIKeb0QxtUBR+edWIAonVsqXswgI94sAz074Zg8TGqI8ihm/+PfVSB/673oZuIBlUcGiiXwdBh16V45oLoZDyMq9vDlBGGYVvmrJqNdiU9p1Rn9GnSYfa4DtK0iEjrwwX71UxD56RcFiejYDw2jvAlhAn4cEypof2Geu4bz/2PKYblLlo79A8k389cKvnkxcscmfGK8P7qGLkdUpy56+MWq5vRf1cvOntVrVLobR60/VttP18oSMfyrTUPJDAZ6SMpurD3FqK5RkX9sVxtR3NS1JD4q+nYctpYeYp2rYl9azLwXhHaOy2KUlpYF3y3WnLIsVrDdRcvu74k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed7f85d-fc29-45da-a19e-08d6dcfad97c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 08:12:06.7732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3185
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
Cc: Mark Rutland <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 DTML <devicetree@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXJuZHTvvIwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+IA0KU2VudDogMjAxOeW5tDXmnIgxN+aXpSAxNjo1OQ0KVG86
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KQ2M6IEJqb3JuIEhlbGdhYXMgPGJo
ZWxnYWFzQGdvb2dsZS5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFy
ayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNoYXduIEd1byA8c2hhd25ndW9Aa2Vy
bmVsLm9yZz47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgS2lzaG9uIDxraXNob25AdGku
Y29tPjsgTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+OyBncmVn
a2ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgTS5oLiBMaWFuIDxtaW5naHVhbi5saWFu
QG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kgWmFuZyA8cm95
LnphbmdAbnhwLmNvbT47IEthdGUgU3Rld2FydCA8a3N0ZXdhcnRAbGludXhmb3VuZGF0aW9uLm9y
Zz47IFBoaWxpcHBlIE9tYnJlZGFubmUgPHBvbWJyZWRhbm5lQG5leGIuY29tPjsgU2hhd24gTGlu
IDxzaGF3bi5saW5Acm9jay1jaGlwcy5jb20+OyBsaW51eC1wY2kgPGxpbnV4LXBjaUB2Z2VyLmtl
cm5lbC5vcmc+OyBEVE1MIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5l
bCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBBUk0g
PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4cHBjLWRldiA8bGlu
dXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRD
SCAyLzNdIGFybTY0OiBkdHM6IGxzMTAyOGE6IEFkZCBQQ0llIGNvbnRyb2xsZXIgRFQgbm9kZXMN
Cg0KQ2F1dGlvbjogRVhUIEVtYWlsDQoNCk9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDU6MjEgQU0g
WGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+IHdyb3RlOg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBP
biBXZWQsIE1heSAxNSwgMjAxOSBhdCA5OjM2IEFNIFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0Bu
eHAuY29tPiB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5i
YW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTAyOGEuZHRzaSB8ICAgNTIgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEg
ZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS5k
dHNpIA0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRz
aQ0KPiA+IGluZGV4IGIwNDU4MTIuLjUwYjU3OWIgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kNCj4gPiBAQCAtMzk4LDYgKzM5
OCw1OCBAQA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgcGNpZUAz
NDAwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxs
czEwMjhhLXBjaWUiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwIDB4
MDM0MDAwMDAgMHgwIDB4MDAxMDAwMDAgICAvKiBjb250cm9sbGVyIHJlZ2lzdGVycyAqLw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDgwIDB4MDAwMDAwMDAgMHgwIDB4MDAw
MDIwMDA+OyAvKiBjb25maWd1cmF0aW9uIHNwYWNlICovDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVnLW5hbWVzID0gInJlZ3MiLCAiY29uZmlnIjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA4IElSUV9UWVBFX0xFVkVMX0hJR0g+LCAv
KiBQTUUgaW50ZXJydXB0ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxHSUNfU1BJIDEwOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsgLyogYWVyIGludGVycnVwdCAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJwbWUiLCAi
YWVyIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRtYS1jb2hlcmVudDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBu
dW0tbGFuZXMgPSA8ND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnVzLXJhbmdlID0g
PDB4MCAweGZmPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MHg4MTAw
MDAwMCAweDAgMHgwMDAwMDAwMCAweDgwIDB4MDAwMTAwMDAgMHgwIDB4MDAwMTAwMDAgICAvKiBk
b3duc3RyZWFtIEkvTyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
eDgyMDAwMDAwIDB4MCAweDQwMDAwMDAwIDB4ODAgDQo+ID4gKyAweDQwMDAwMDAwIDB4MCAweDQw
MDAwMDAwPjsgLyogbm9uLXByZWZldGNoYWJsZSBtZW1vcnkgKi8NCj4NCj4gQXJlIHlvdSBzdXJl
IHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIDY0LWJpdCBCQVJzIG9yIHByZWZldGNoYWJsZSBtZW1v
cnk/DQo+IFtYaWFvd2VpIEJhb10gc29ycnkgZm9yIGxhdGUgcmVwbHksIFRob3VnaHQgdGhhdCBv
dXIgTGF5ZXJzY2FwZSBwbGF0Zm9ybSBoYXMgbm90IGFkZGVkIHByZWZldGNoYWJsZSBtZW1vcnkg
c3VwcG9ydCBpbiBEVFMsIHNvIHRoaXMgcGxhdGZvcm0gaGFzIG5vdCBiZWVuIGFkZGVkLCBJIHdp
bGwgc3VibWl0IGEgc2VwYXJhdGUgcGF0Y2ggdG8gYWRkIHByZWZldGNoYWJsZSBtZW1vcnkgc3Vw
cG9ydCBmb3IgYWxsIExheWVyc2NhcGUgcGxhdGZvcm1zLg0KDQpPaywgdGhhbmtzLg0KDQo+IE9m
IGNvdXJzZSwgdGhlIHByZWZldGNoYWJsZSBQQ0lFIGRldmljZSBjYW4gd29yayBpbiBvdXIgYm9h
cmRzLCANCj4gYmVjYXVzZSB0aGUgUkMgd2lsbCBhc3NpZ24gbm9uLXByZWZldGNoYWJsZSBtZW1v
cnkgZm9yIHRoaXMgZGV2aWNlLiBXZSANCj4gcmVzZXJ2ZSAxRyBuby1wcmVmZXRjaGFibGUgbWVt
b3J5IGZvciBQQ0lFIGRldmljZSwgaXQgaXMgZW5vdWdoIGZvciBnZW5lcmFsIGRldmljZXMuDQoN
ClN1cmUsIG1hbnkgZGV2aWNlcyB3b3JrIGp1c3QgZmluZSwgdGhpcyBpcyBtb3N0bHkgYSBxdWVz
dGlvbiBvZiBzdXBwb3J0aW5nIHRob3NlIGRldmljZXMgdGhhdCBkbyByZXF1aXJlIG11bHRpcGxl
IGdpZ2FieXRlcywgb3IgdGhhdCBuZWVkIHByZWZldGNoYWJsZSBtZW1vcnkgc2VtYW50aWNzIHRv
IGdldCB0aGUgZXhwZWN0ZWQgcGVyZm9ybWFuY2UuIEdQVXMgYXJlIHRoZSBvYnZpb3VzIGV4YW1w
bGUsIGJ1dCBJIHRoaW5rIHRoZXJlIGFyZSBvdGhlcnMgKGluZmluaWJhbmQ/KS4NCltYaWFvd2Vp
IEJhb10gc29ycnksIEkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IGluZmluaWJhbmQgYW5kIEdQVSwg
YXMgeW91IHNhaWQsIEkgdGhpbmsgbWFueSBkZXZpY2VzIHdvcmtzIGZpbmUgd2l0aCB0aGlzIERU
UywgSSB3aWxsIGFkZCB0aGUgcHJlZmV0Y2hhYmxlIG1lbW9yeSBlbnRyeSBpbiBEVFMgZnV0dXJl
IGFuZCBzdWJtaXQgYW5vdGhlciBwYXRjaC4NCg0KICAgICAgQXJuZA0K
