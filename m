Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F031B4C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:20:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452df806yDzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:20:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="LeVG7LDn"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dWv1jVfzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEuej7ss5STPp4OHMYfz0R03yzlH8IWgkfe+AgmlSy8=;
 b=LeVG7LDnVSxhb+Xq6Q6oyRjQmFim7bMUYbRCiS635BmgwJrqhI25i19OTxHFAOPMQ6bO8rHfbdZeqRkQOYATTbolyd33ctZrIK2TYZW4lRxzuyO1AO74t5PAvy3czD1ChBRIbBdzE65UjIkcJomtj903VpylFPsSgejjVPKOx2w=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM (52.134.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 11:14:58 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:14:58 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v3 4/6] dt-bindings: soc/fsl: qe: document new fsl,qe-snums
 binding
Thread-Topic: [PATCH v3 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Index: AQHVCX0ZXnBvt/NFO0u+76ybHNsHbQ==
Date: Mon, 13 May 2019 11:14:58 +0000
Message-ID: <20190513111442.25724-5-rasmus.villemoes@prevas.dk>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::32) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ae9f9da-f716-49b5-d22d-08d6d7943c4a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1950; 
x-ms-traffictypediagnostic: VI1PR10MB1950:
x-microsoft-antispam-prvs: <VI1PR10MB195021DADBE21BC44A5050F98A0F0@VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(366004)(376002)(136003)(396003)(40224003)(52084003)(189003)(199004)(51914003)(6512007)(66066001)(53936002)(107886003)(52116002)(68736007)(256004)(14444005)(71200400001)(71190400001)(76176011)(6436002)(478600001)(6486002)(1076003)(36756003)(5660300002)(72206003)(74482002)(446003)(81156014)(8676002)(14454004)(99286004)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(54906003)(11346002)(2616005)(42882007)(476003)(81166006)(44832011)(50226002)(486006)(8936002)(110136005)(8976002)(6116002)(7416002)(316002)(3846002)(2906002)(305945005)(7736002)(186003)(25786009)(102836004)(6506007)(386003)(4326008)(26005)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1950;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iY4V8mvoG5SJUI2Hu3/s4cR0ATbU25JjUJY87KCD/Z579idi+L4su6UuQ0Cx3iZODFEeMuECo4maI3ZfHIyrJnmttEnuRsSHUAzbT39sJfeX7Dvvo7N4B232GHOS1clZL4swA7snUAwX8llmHp8IYB+emPUL2C2OeisZsAxIoxg+GtqS7hUylSRUfSykKE3MB1iGBhXQxSyrEph5UX5uR4z1C8ACgChCvQ7p6XEQChZe0kkhMDyqO2YRHcy2XivFCNkrU+CAE4p2MfvUKoLXRgyVxKtFIV4nK4Pn3o7g4s5ao9WpXTVb0w5HA1yMWjLCULwusRRL7et4ErbpE0yoGtA9sgAm5HC+T/f0skwfS64/HUW6tSoW+dUDXmCuIhXBLLWezoZjYGut9AGVmzFA6bptD2hXVnT8YjoL95EAmtU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae9f9da-f716-49b5-d22d-08d6d7943c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:14:58.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1950
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmVhZGluZyB0YWJsZSA0LTMwLCBhbmQgaXRzIGZvb3Rub3Rlcywgb2YgdGhlIFFVSUNDIEVuZ2lu
ZSBCbG9jaw0KUmVmZXJlbmNlIE1hbnVhbCBzaG93cyB0aGF0IHRoZSBzZXQgb2Ygc251bSBfdmFs
dWVzXyBpcyBub3QNCm5lY2Vzc2FyaWx5IGp1c3QgYSBmdW5jdGlvbiBvZiB0aGUgX251bWJlcl8g
b2Ygc251bXMsIGFzIGdpdmVuIGluIHRoZQ0KZnNsLHFlLW51bS1zbnVtcyBwcm9wZXJ0eS4NCg0K
QXMgYW4gYWx0ZXJuYXRpdmUsIHRvIG1ha2UgaXQgZWFzaWVyIHRvIGFkZCBzdXBwb3J0IGZvciBv
dGhlciB2YXJpYW50cw0Kb2YgdGhlIFFVSUNDIGVuZ2luZSBJUCwgdGhpcyBpbnRyb2R1Y2VzIGEg
bmV3IGJpbmRpbmcgZnNsLHFlLXNudW1zLA0Kd2hpY2ggYXV0b21hdGljYWxseSBlbmNvZGVzIGJv
dGggdGhlIG51bWJlciBvZiBzbnVtcyBhbmQgdGhlIGFjdHVhbA0KdmFsdWVzIHRvIHVzZS4NCg0K
U2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMu
ZGs+DQotLS0NClJvYiwgdGhhbmtzIGZvciB0aGUgcmV2aWV3IG9mIHYyLiBIb3dldmVyLCBzaW5j
ZSBJIG1vdmVkIHRoZSBleGFtcGxlDQpmcm9tIHRoZSBjb21taXQgbG9nIHRvIHRoZSBiaW5kaW5n
IChwZXIgSm9ha2ltJ3MgcmVxdWVzdCksIEkgZGlkbid0DQphZGQgYSBSZXZpZXdlZC1ieSB0YWcg
Zm9yIHRoaXMgcmV2aXNpb24uDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2Nw
bV9xZS9xZS50eHQgICAgICAgfCAxMyArKysrKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0DQppbmRleCBkN2Fm
YWZmNWZhZmYuLjA1ZWMyYTgzOGM1NCAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQNCkBAIC0xOCw3ICsxOCw4
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogLSByZWcgOiBvZmZzZXQgYW5kIGxlbmd0aCBvZiB0
aGUgZGV2aWNlIHJlZ2lzdGVycy4NCiAtIGJ1cy1mcmVxdWVuY3kgOiB0aGUgY2xvY2sgZnJlcXVl
bmN5IGZvciBRVUlDQyBFbmdpbmUuDQogLSBmc2wscWUtbnVtLXJpc2NzOiBkZWZpbmUgaG93IG1h
bnkgUklTQyBlbmdpbmVzIHRoZSBRRSBoYXMuDQotLSBmc2wscWUtbnVtLXNudW1zOiBkZWZpbmUg
aG93IG1hbnkgc2VyaWFsIG51bWJlcihTTlVNKSB0aGUgUUUgY2FuIHVzZSBmb3IgdGhlDQorLSBm
c2wscWUtc251bXM6IFRoaXMgcHJvcGVydHkgaGFzIHRvIGJlIHNwZWNpZmllZCBhcyAnL2JpdHMv
IDgnIHZhbHVlLA0KKyAgZGVmaW5pbmcgdGhlIGFycmF5IG9mIHNlcmlhbCBudW1iZXIgKFNOVU0p
IHZhbHVlcyBmb3IgdGhlIHZpcnR1YWwNCiAgIHRocmVhZHMuDQogDQogT3B0aW9uYWwgcHJvcGVy
dGllczoNCkBAIC0zNCw2ICszNSwxMSBAQCBSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzDQogLSBicmct
ZnJlcXVlbmN5IDogdGhlIGludGVybmFsIGNsb2NrIHNvdXJjZSBmcmVxdWVuY3kgZm9yIGJhdWQt
cmF0ZQ0KICAgZ2VuZXJhdG9ycyBpbiBIei4NCiANCitEZXByZWNhdGVkIHByb3BlcnRpZXMNCist
IGZzbCxxZS1udW0tc251bXM6IGRlZmluZSBob3cgbWFueSBzZXJpYWwgbnVtYmVyKFNOVU0pIHRo
ZSBRRSBjYW4gdXNlDQorICBmb3IgdGhlIHRocmVhZHMuIFVzZSBmc2wscWUtc251bXMgaW5zdGVh
ZCB0byBub3Qgb25seSBzcGVjaWZ5IHRoZQ0KKyAgbnVtYmVyIG9mIHNudW1zLCBidXQgYWxzbyB0
aGVpciB2YWx1ZXMuDQorDQogRXhhbXBsZToNCiAgICAgIHFlQGUwMTAwMDAwIHsNCiAJI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQpAQCAtNDQsNiArNTAsMTEgQEAgRXhhbXBsZToNCiAJcmVnID0gPGUw
MTAwMDAwIDQ4MD47DQogCWJyZy1mcmVxdWVuY3kgPSA8MD47DQogCWJ1cy1mcmVxdWVuY3kgPSA8
MTc5QTdCMDA+Ow0KKwlmc2wscWUtc251bXMgPSAvYml0cy8gOCA8DQorCQkweDA0IDB4MDUgMHgw
QyAweDBEIDB4MTQgMHgxNSAweDFDIDB4MUQNCisJCTB4MjQgMHgyNSAweDJDIDB4MkQgMHgzNCAw
eDM1IDB4ODggMHg4OQ0KKwkJMHg5OCAweDk5IDB4QTggMHhBOSAweEI4IDB4QjkgMHhDOCAweEM5
DQorCQkweEQ4IDB4RDkgMHhFOCAweEU5PjsNCiAgICAgIH0NCiANCiAqIE11bHRpLVVzZXIgUkFN
IChNVVJBTSkNCi0tIA0KMi4yMC4xDQoNCg==
