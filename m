Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BBA21278
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 05:22:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454tsD4fwzzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 13:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.88; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z7GwFV56"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454tqt22nBzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:21:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gTHUN+SxCW/yl4z/7DRtX3nEeH0LD0dRIOmis8+cvs=;
 b=Z7GwFV56AV3MKsnOVJ65s+SQ473kQE3zxDivRYeCompvlmUBXw/JBqJHXrm2IVL7J2DSq0Ce0fKBNdVscwIS/czSNdLXdwoOvZRyJrSWZmq0KeO44f3ogOd2/3vR1DT0SNhge4xSYOL6gBwyh0pZh0nQcRD+nnuKJZII82JJR10=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3188.eurprd04.prod.outlook.com (10.175.229.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 03:21:33 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::15e3:bb28:7e33:1adb]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::15e3:bb28:7e33:1adb%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:21:33 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: RE: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT
 nodes
Thread-Topic: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller
 DT nodes
Thread-Index: AQHVCvDcQiDXhQiDJU+q/k8vTUL4F6Zr0/6AgALH2dA=
Date: Fri, 17 May 2019 03:21:33 +0000
Message-ID: <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190515072747.39941-2-xiaowei.bao@nxp.com>
 <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
In-Reply-To: <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5d37032-4b3c-4cc7-c06e-08d6da76c34a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3188; 
x-ms-traffictypediagnostic: AM5PR04MB3188:
x-microsoft-antispam-prvs: <AM5PR04MB31880D75F534138CDE24E794F50B0@AM5PR04MB3188.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(39860400002)(396003)(346002)(189003)(199004)(13464003)(74316002)(68736007)(7416002)(81166006)(8676002)(81156014)(5660300002)(305945005)(6916009)(11346002)(476003)(486006)(446003)(316002)(7736002)(71200400001)(71190400001)(86362001)(54906003)(7696005)(44832011)(66066001)(26005)(99286004)(186003)(66946007)(76116006)(73956011)(14454004)(53546011)(66446008)(64756008)(66556008)(66476007)(102836004)(6506007)(25786009)(478600001)(9686003)(33656002)(76176011)(52536014)(6436002)(3846002)(6116002)(55016002)(8936002)(6246003)(53936002)(2906002)(4326008)(256004)(229853002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3188;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AdrSs/gr7DF2q+akDsJOjEuADGGgqpM1SDcPKE2EFkM163DuV1nyLbWZgHS8kE3Mx4x1Yyu9cDZDT+royQwUfv0bQiMk0cGcR527MdDoI40UxFuc/82fcP7AMQ3YfAQmP5rTrvQSpcrtykxJOYs3+Za3d13UQW9NVGvTDFKJX/HJ0nQ5IRzf8doSdnQyYLW+zoWfDF+4JGsdavk5dVoT5e/aFI20d1oGjo33IBGyZey6xWLxNIs0n8xyio6U1DqY+ZTsCUBh6FRgXcv5oqZmQYCiBWJjf0J9y6kvx9EFdxuvAf7pzmhhyrNm++8OMSUDOM7yvirKjhwPjmggMcAhYLVl8hHIsa4ppmKDl9yad1nEb1zsaHJwNXV6ZN+gn82N5TNstJwpN723eucqI2Do+g+HbWSt6ZBM+Wv5BMpWFws=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d37032-4b3c-4cc7-c06e-08d6da76c34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:21:33.5276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3188
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

SGkgQXJuZCwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IA0KU2VudDogMjAxOeW5tDXmnIgxNeaXpSAxNjowNQ0KVG86IFhp
YW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxn
YWFzQGdvb2dsZS5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBS
dXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgS2lzaG9uIDxraXNob25AdGkuY29t
PjsgTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+OyBncmVna2gg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54
cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kgWmFuZyA8cm95Lnph
bmdAbnhwLmNvbT47IEthdGUgU3Rld2FydCA8a3N0ZXdhcnRAbGludXhmb3VuZGF0aW9uLm9yZz47
IFBoaWxpcHBlIE9tYnJlZGFubmUgPHBvbWJyZWRhbm5lQG5leGIuY29tPjsgU2hhd24gTGluIDxz
aGF3bi5saW5Acm9jay1jaGlwcy5jb20+OyBsaW51eC1wY2kgPGxpbnV4LXBjaUB2Z2VyLmtlcm5l
bC5vcmc+OyBEVE1MIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBN
YWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBBUk0gPGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4cHBjLWRldiA8bGludXhw
cGMtZGV2QGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDIvM10g
YXJtNjQ6IGR0czogbHMxMDI4YTogQWRkIFBDSWUgY29udHJvbGxlciBEVCBub2Rlcw0KDQpDYXV0
aW9uOiBFWFQgRW1haWwNCg0KT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgOTozNiBBTSBYaWFvd2Vp
IEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4gd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IFhpYW93
ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kgfCAgIDUyICsrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgMSBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxz
MTAyOGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0
c2kNCj4gaW5kZXggYjA0NTgxMi4uNTBiNTc5YiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS5kdHNpDQo+IEBAIC0zOTgsNiArMzk4LDU4IEBA
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAgICAg
ICAgICAgICAgICB9Ow0KPg0KPiArICAgICAgICAgICAgICAgcGNpZUAzNDAwMDAwIHsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1wY2llIjsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAgMHgwMzQwMDAwMCAweDAgMHgwMDEw
MDAwMCAgIC8qIGNvbnRyb2xsZXIgcmVnaXN0ZXJzICovDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAweDgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDIwMDA+OyAvKiBjb25maWd1cmF0
aW9uIHNwYWNlICovDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJyZWdz
IiwgImNvbmZpZyI7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lD
X1NQSSAxMDggSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIFBNRSBpbnRlcnJ1cHQgKi8NCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDEwOSBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsgLyogYWVyIGludGVycnVwdCAqLw0KPiArICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHQtbmFtZXMgPSAicG1lIiwgImFlciI7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDM+Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwyPjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAi
cGNpIjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hLWNvaGVyZW50Ow0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBudW0tbGFuZXMgPSA8ND47DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJ1cy1yYW5nZSA9IDwweDAgMHhmZj47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJh
bmdlcyA9IDwweDgxMDAwMDAwIDB4MCAweDAwMDAwMDAwIDB4ODAgMHgwMDAxMDAwMCAweDAgMHgw
MDAxMDAwMCAgIC8qIGRvd25zdHJlYW0gSS9PICovDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAweDgyMDAwMDAwIDB4MCAweDQwMDAwMDAwIDB4ODAgMHg0MDAwMDAwMCAweDAg
MHg0MDAwMDAwMD47IC8qIG5vbi1wcmVmZXRjaGFibGUgbWVtb3J5ICovDQoNCkFyZSB5b3Ugc3Vy
ZSB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciA2NC1iaXQgQkFScyBvciBwcmVmZXRjaGFibGUgbWVt
b3J5Pw0KW1hpYW93ZWkgQmFvXSBzb3JyeSBmb3IgbGF0ZSByZXBseSwgVGhvdWdodCB0aGF0IG91
ciBMYXllcnNjYXBlIHBsYXRmb3JtIGhhcyBub3QgYWRkZWQgcHJlZmV0Y2hhYmxlIG1lbW9yeSBz
dXBwb3J0IGluIERUUywgc28gdGhpcyBwbGF0Zm9ybSBoYXMgbm90IGJlZW4gYWRkZWQsIEkgd2ls
bCBzdWJtaXQgYSBzZXBhcmF0ZSBwYXRjaCB0byBhZGQgcHJlZmV0Y2hhYmxlIG1lbW9yeSBzdXBw
b3J0IGZvciBhbGwgTGF5ZXJzY2FwZSBwbGF0Zm9ybXMuIA0KT2YgY291cnNlLCB0aGUgcHJlZmV0
Y2hhYmxlIFBDSUUgZGV2aWNlIGNhbiB3b3JrIGluIG91ciBib2FyZHMsIGJlY2F1c2UgdGhlIFJD
IHdpbGwgYXNzaWduIG5vbi1wcmVmZXRjaGFibGUgbWVtb3J5IGZvciB0aGlzIGRldmljZS4gV2Ug
cmVzZXJ2ZSAxRyBuby1wcmVmZXRjaGFibGUgbWVtb3J5IGZvciBQQ0lFIGRldmljZSwgaXQgaXMg
ZW5vdWdoIGZvciBnZW5lcmFsIGRldmljZXMuICANCg0KSXMgdGhpcyBhIGhhcmR3YXJlIGJ1Zywg
b3Igc29tZXRoaW5nIHRoYXQgY2FuIGJlIGZpeGVkIGluIGZpcm13YXJlPw0KW1hpYW93ZWkgQmFv
XSB0aGlzIGlzIG5vdCBhIGhhcmR3YXJlIGJ1Zywgb3VyIEhXIHN1cHBvcnQgdGhlIDY0LWJpdCBw
cmVmZXRjaGFibGUgbWVtb3J5Lg0KDQogICAgICAgQXJuZA0K
