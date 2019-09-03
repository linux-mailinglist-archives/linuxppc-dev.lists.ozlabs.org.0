Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6652A5F0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 04:03:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MqxK0LvjzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.5.86; helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="NgqwAKMC"; 
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50086.outbound.protection.outlook.com [40.107.5.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mqv84Kv9zDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 12:01:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNqYbKIssrg+Y9tN+jtMCUGLNQyApSPxJ0Y9f8tfr6Z9s1GVN9tr3g2MkkttNR7UdzCYpKCzDMtiSy0m762ip6O3Bn3/9/gNzsFtaAhrc9O75nrXv3dBGX9pHCyQtsDaTFMfKh2rj77CH7zBIE2Li5bOKb/r44Gg9Jv+chUeCcmFHQ7JlEyTiiKxDqtuYYRESi3sJl4DswwekbQBIlP5phYZ57sOAZTNWa7V1mpVoWmdg8VGCi9zhZJu9iwBFKtmodLcu2XMhtIy+GMUP+QYLv4CHzZ0Qe4dDqrgK6i8/2kqoMlw1fzqggdXcJBYrXMHEwq4s0YEnVizieZAvwX7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUKj9fN7Rscukd+/DtEllKeY7TOY6DfEBReNc+/njwo=;
 b=jd2Jrs2jGCNllwGr+fo3WEVySTOmiLNcm/B5Y8/lm6thZ4fprJvAuPKh21ONOtZ0k0lzy4S2EVzJo8E9g6PCuxXUeYUtlMQVBHs80XlG2yNjIQJn++xS/lyCNSA4/ZyYCivkWmkkL+jQz3MU5VpA8uxSrJdyd8AxjkYiywZMMqwsjHjn2MPhY+zd5WlJCAWVtj8DEd+c84GOhE6cGHgOaBFUJxvFkbjB5tfU0Uk092FZmTQ0kZXy0NMPoNTLKUY+OgkCC49+O1hXhfhqv8C5EoVZFBPikiTD99lqfugp2aLhjvJ+Jv2nXChZ3J3O6wktlL6VBUP8w4SFQMU/pBbpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUKj9fN7Rscukd+/DtEllKeY7TOY6DfEBReNc+/njwo=;
 b=NgqwAKMCs7JcXkv5bC2gKOUTfcXC4rlFbDfGjOGTz5wuMYrLuyOhyFjnJ1nKZ7fWEbwkwnwbxQvfx4DVvkixSjoLPNAHBRADN+ezSIoFlr+V7p1Pn5TtLpYEGNgzRsgIq5adYzNr8bon0cydqpx3gP5QUrusKCeBenJ9ST1/gAI=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3028.eurprd04.prod.outlook.com (10.167.170.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 02:01:32 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 02:01:32 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 10/11] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Topic: [PATCH v3 10/11] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Index: AQHVYT5oVK45giVaYUuJ12uPbJqjnacYW/kAgADW+HA=
Date: Tue, 3 Sep 2019 02:01:32 +0000
Message-ID: <AM5PR04MB329926C6F424C4BE1CE9B787F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-11-xiaowei.bao@nxp.com>
 <20190902130628.GL9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902130628.GL9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4981c9-44b0-4aea-f320-08d73012a476
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3028; 
x-ms-traffictypediagnostic: AM5PR04MB3028:|AM5PR04MB3028:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB302867E5AE726C93C34BDF84F5B90@AM5PR04MB3028.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(13464003)(6116002)(3846002)(9686003)(25786009)(4326008)(102836004)(26005)(74316002)(6436002)(55016002)(186003)(53546011)(6506007)(86362001)(478600001)(52536014)(5660300002)(53936002)(6246003)(14454004)(8936002)(66066001)(2906002)(7736002)(81156014)(476003)(44832011)(8676002)(81166006)(486006)(11346002)(446003)(33656002)(316002)(99286004)(305945005)(256004)(14444005)(71190400001)(71200400001)(6916009)(7696005)(76176011)(66946007)(66446008)(76116006)(229853002)(54906003)(64756008)(66556008)(7416002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3028;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: blRTT5oJqJHuBEt335pBUgt7o0bs9Q6x1bWS5eSAUhOkh+IyoPF+Sq2clMReVHJRell4goBce43hf7Jwyr/KiKjpUkcQuR1pXTOf8LNguS5SmxyagyxqiBXq9rRhtlyQ7NBh/6wbYdmaq1GZ+KLBh4hRFupyCUyL27+lo/6KHARY1Se9pcbsSFzJc3kXbt4Qyfguq7DwblDzIOoKcYpzGgk0+0ZdsRD4iXy062kgsk6aplzfs57dZecTXRsdAV19CG7g3hAFTaQ1o67nY7z5Q0KMPeZbVanWDAyLAd4mHNmhA8gchiq81wx4izd7MuxjvFkJAnBKrPe8z19poHx6GpEz6tD/4YeILdM5vJep785Xu7cYuuMTb0DAsfajNHitutFJRkPEaceU04AI2QvCSKKjZwcf+zrC/sdL1EYRAzI=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4981c9-44b0-4aea-f320-08d73012a476
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 02:01:32.1668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/qxai4tvrrOgPVBK+i0wNhZEu2pH8mcKBvHgh56RpDyW2oFOV+dQB1bI/DhgxAe7KXpR/1/7mIXayvUpDkNjQ==
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIyyNUgMjE6MDYNCj4gVG86
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
bnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxMC8xMV0gYXJtNjQ6IGR0czogbGF5
ZXJzY2FwZTogQWRkIFBDSWUgRVAgbm9kZSBmb3INCj4gbHMxMDg4YQ0KPiANCj4gT24gTW9uLCBT
ZXAgMDIsIDIwMTkgYXQgMTE6MTc6MTVBTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4g
QWRkIFBDSWUgRVAgbm9kZSBmb3IgbHMxMDg4YSB0byBzdXBwb3J0IEVQIG1vZGUuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiB2MjoNCj4gPiAgLSBSZW1vdmUgdGhlIHBmLW9mZnNldCBwcm9wYXJ0eS4NCj4gPiB2
MzoNCj4gPiAgLSBObyBjaGFuZ2UuDQo+ID4NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvZnNsLWxzMTA4OGEuZHRzaSB8IDMxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaQ0KPiBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kNCj4gPiBpbmRl
eCBjNjc2ZDA3Li5kYTI0NmFiIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpDQo+ID4gQEAgLTQ4Myw2ICs0ODMsMTcgQEANCj4g
PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJcGNpZV9l
cEAzNDAwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llLWVwIiwi
ZnNsLGxzLXBjaWUtZXAiOw0KPiANCj4gSGVyZSB5b3Ugc3BlY2lmeSBhIGZhbGxiYWNrICJmc2ws
bHMtcGNpZS1lcCIgdGhhdCBpcyByZW1vdmVkIGJ5IHRoaXMgc2VyaWVzLg0KPiANCj4gQmVzaWRl
cyB0aGF0LCB0aGlzIGxvb2tzIE9LLg0KDQpBcyBleHBsYWluZWQsIHRoZSAiZnNsLGxzLXBjaWUt
ZXAiIGlzIG5lZWRlZCwgZHVlIHRvIHRoZSB1LWJvb3Qgd2lsbCBmaXh1cCB0aGUgc3RhdHVzDQpw
cm9wZXJ0eSBiYXNlIG9uIHRoaXMgY29tcGF0aWJsZSwgSSB0aGluayB3ZSByZXNlcnZlIHRoaXMg
Y29tcGF0aWJsZSBpcyBoZWxwZnVsbHksDQppZiBkZWxhdGUgdGhpcyBjb21wYXRpYmxlLCBJIGhh
dmUgdG8gbW9kaWZ5IHRoZSBjb2RlIG9mIGJvb3Rsb2FkZXIuDQoNClRoYW5rcyANClhJYW93ZWkN
Cg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiArCQkJcmVnID0g
PDB4MDAgMHgwMzQwMDAwMCAweDAgMHgwMDEwMDAwMA0KPiA+ICsJCQkgICAgICAgMHgyMCAweDAw
MDAwMDAwIDB4OCAweDAwMDAwMDAwPjsNCj4gPiArCQkJcmVnLW5hbWVzID0gInJlZ3MiLCAiYWRk
cl9zcGFjZSI7DQo+ID4gKwkJCW51bS1pYi13aW5kb3dzID0gPDI0PjsNCj4gPiArCQkJbnVtLW9i
LXdpbmRvd3MgPSA8MTI4PjsNCj4gPiArCQkJbWF4LWZ1bmN0aW9ucyA9IC9iaXRzLyA4IDwyPjsN
Cj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiAgCQlw
Y2llQDM1MDAwMDAgew0KPiA+ICAJCQljb21wYXRpYmxlID0gImZzbCxsczEwODhhLXBjaWUiOw0K
PiA+ICAJCQlyZWcgPSA8MHgwMCAweDAzNTAwMDAwIDB4MCAweDAwMTAwMDAwICAgLyogY29udHJv
bGxlcg0KPiByZWdpc3RlcnMgKi8NCj4gPiBAQCAtNTA4LDYgKzUxOSwxNiBAQA0KPiA+ICAJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICAJCX07DQo+ID4NCj4gPiArCQlwY2llX2VwQDM1MDAw
MDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gImZzbCxsczEwODhhLXBjaWUtZXAiLCJmc2wsbHMt
cGNpZS1lcCI7DQo+ID4gKwkJCXJlZyA9IDwweDAwIDB4MDM1MDAwMDAgMHgwIDB4MDAxMDAwMDAN
Cj4gPiArCQkJICAgICAgIDB4MjggMHgwMDAwMDAwMCAweDggMHgwMDAwMDAwMD47DQo+ID4gKwkJ
CXJlZy1uYW1lcyA9ICJyZWdzIiwgImFkZHJfc3BhY2UiOw0KPiA+ICsJCQludW0taWItd2luZG93
cyA9IDw2PjsNCj4gPiArCQkJbnVtLW9iLXdpbmRvd3MgPSA8OD47DQo+ID4gKwkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gIAkJcGNpZUAzNjAwMDAwIHsNCj4g
PiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llIjsNCj4gPiAgCQkJcmVnID0gPDB4
MDAgMHgwMzYwMDAwMCAweDAgMHgwMDEwMDAwMCAgIC8qIGNvbnRyb2xsZXINCj4gcmVnaXN0ZXJz
ICovDQo+ID4gQEAgLTUzMyw2ICs1NTQsMTYgQEANCj4gPiAgCQkJc3RhdHVzID0gImRpc2FibGVk
IjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJcGNpZV9lcEAzNjAwMDAwIHsNCj4gPiArCQkJY29t
cGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llLWVwIiwiZnNsLGxzLXBjaWUtZXAiOw0KPiA+ICsJ
CQlyZWcgPSA8MHgwMCAweDAzNjAwMDAwIDB4MCAweDAwMTAwMDAwDQo+ID4gKwkJCSAgICAgICAw
eDMwIDB4MDAwMDAwMDAgMHg4IDB4MDAwMDAwMDA+Ow0KPiA+ICsJCQlyZWctbmFtZXMgPSAicmVn
cyIsICJhZGRyX3NwYWNlIjsNCj4gPiArCQkJbnVtLWliLXdpbmRvd3MgPSA8Nj47DQo+ID4gKwkJ
CW51bS1vYi13aW5kb3dzID0gPDg+Ow0KPiA+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+
ICsJCX07DQo+ID4gKw0KPiA+ICAJCXNtbXU6IGlvbW11QDUwMDAwMDAgew0KPiA+ICAJCQljb21w
YXRpYmxlID0gImFybSxtbXUtNTAwIjsNCj4gPiAgCQkJcmVnID0gPDAgMHg1MDAwMDAwIDAgMHg4
MDAwMDA+Ow0KPiA+IC0tDQo+ID4gMi45LjUNCj4gPg0K
