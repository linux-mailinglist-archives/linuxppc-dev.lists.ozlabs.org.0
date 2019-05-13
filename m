Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C101B527
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:40:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452f5312Z0zDqFp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:40:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=infinera.com
 (client-ip=40.107.74.48; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.b="VkqJcfye";
 dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452f3c3LDXzDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:39:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bFwWqOQHMOO+34Oa8D7hVJuyV7G6ZKpj+L+SAshp40=;
 b=VkqJcfyetNKc0vn8PtEFzEdyFAgzQVJTGOp1jpnYoc1pYlx3pmnzLxuPARhaUNc/JzH9MkbAgM+gvH9xj/fpOhvCBhc+hkmGW+eTEHmM7q/HlaF4s+CreVwN0Pfe7ptcDHXBGvVMTKvu7VT4FNE0fQ3nKU6X2zwtz0rjHO9sazY=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3730.namprd10.prod.outlook.com (20.179.97.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 11:39:01 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::24c5:ea68:cff3:4a16]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::24c5:ea68:cff3:4a16%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:39:01 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "qiang.zhao@nxp.com"
 <qiang.zhao@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Topic: [PATCH v3 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Index: AQHVCX0dAJ3DoPo7GkSqekfXCWC8OKZo7e6A
Date: Mon, 13 May 2019 11:39:01 +0000
Message-ID: <35d7ec55a136259668cadbb662bfd4913c4423ca.camel@infinera.com>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-5-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190513111442.25724-5-rasmus.villemoes@prevas.dk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11214e72-c1b0-4e30-2f8d-08d6d797987b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN8PR10MB3730; 
x-ms-traffictypediagnostic: BN8PR10MB3730:
x-microsoft-antispam-prvs: <BN8PR10MB3730703F403556E2FCC7C3FFF40F0@BN8PR10MB3730.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(136003)(376002)(366004)(396003)(346002)(40224003)(199004)(189003)(51914003)(52084003)(186003)(446003)(54906003)(14454004)(305945005)(229853002)(66556008)(66066001)(6486002)(99286004)(11346002)(66446008)(64756008)(7416002)(66476007)(3846002)(26005)(6116002)(6506007)(102836004)(6512007)(476003)(76176011)(2906002)(6436002)(2616005)(110136005)(7736002)(76116006)(91956017)(66946007)(73956011)(486006)(6246003)(2501003)(86362001)(36756003)(118296001)(316002)(256004)(5024004)(8676002)(81166006)(14444005)(81156014)(5660300002)(53936002)(71190400001)(71200400001)(68736007)(8936002)(72206003)(4326008)(2201001)(478600001)(25786009)(142933001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3730;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnAdRF8xk/oDQ7bQP4AFZAcaWjDFZ5fmdZhODaOpjs/bt02E4XObfbVJXu9cvndwqcM8BQL0zN0M07pJJhIeaRLuRT3G/1yy1rK0dRedHS8UB/Poi9HOT7A6fldznUQB6kGHuZ3ogEswHB1Zf3/mu1jma8PFikWWk5sO5LkqDATfJ32sMHyZN0XbXPpWrYDmwVaBkpVY/IHh1PSO0oueWKiJ+VMSqQzO6LBO9Fm1oAtfAK4gGlMJDWQdidPJ6YxtzJBYaX+u/ycDvBkXZHXXmnk1hWzwh5ibFCrGUJow0conPwVI08XK46QgHKyKvBkRVhOLkVlzSmRqV/PDK31oGLPnHtTH3GMDfyKcJuxunhg9CXqREY/ENHI1VZLOWlr+/+6UBZm3t2CvLMZDPkB5UR4B9dm8hWSOVnExZ7Zx+g0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFB1973088CD854496BB37D5532730F9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11214e72-c1b0-4e30-2f8d-08d6d797987b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:39:01.6378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3730
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
 "oss@buserror.net" <oss@buserror.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Rasmus.Villemoes@prevas.se" <Rasmus.Villemoes@prevas.se>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDE5LTA1LTEzIGF0IDExOjE0ICswMDAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBSZWFkaW5nIHRhYmxlIDQtMzAsIGFuZCBpdHMgZm9vdG5vdGVzLCBvZiB0aGUg
UVVJQ0MgRW5naW5lIEJsb2NrDQo+IFJlZmVyZW5jZSBNYW51YWwgc2hvd3MgdGhhdCB0aGUgc2V0
IG9mIHNudW0gX3ZhbHVlc18gaXMgbm90DQo+IG5lY2Vzc2FyaWx5IGp1c3QgYSBmdW5jdGlvbiBv
ZiB0aGUgX251bWJlcl8gb2Ygc251bXMsIGFzIGdpdmVuIGluIHRoZQ0KPiBmc2wscWUtbnVtLXNu
dW1zIHByb3BlcnR5Lg0KPiANCj4gQXMgYW4gYWx0ZXJuYXRpdmUsIHRvIG1ha2UgaXQgZWFzaWVy
IHRvIGFkZCBzdXBwb3J0IGZvciBvdGhlciB2YXJpYW50cw0KPiBvZiB0aGUgUVVJQ0MgZW5naW5l
IElQLCB0aGlzIGludHJvZHVjZXMgYSBuZXcgYmluZGluZyBmc2wscWUtc251bXMsDQo+IHdoaWNo
IGF1dG9tYXRpY2FsbHkgZW5jb2RlcyBib3RoIHRoZSBudW1iZXIgb2Ygc251bXMgYW5kIHRoZSBh
Y3R1YWwNCj4gdmFsdWVzIHRvIHVzZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxs
ZW1vZXMgPHJhc211cy52aWxsZW1vZXNAcHJldmFzLmRrPg0KPiAtLS0NCj4gUm9iLCB0aGFua3Mg
Zm9yIHRoZSByZXZpZXcgb2YgdjIuIEhvd2V2ZXIsIHNpbmNlIEkgbW92ZWQgdGhlIGV4YW1wbGUN
Cj4gZnJvbSB0aGUgY29tbWl0IGxvZyB0byB0aGUgYmluZGluZyAocGVyIEpvYWtpbSdzIHJlcXVl
c3QpLCBJIGRpZG4ndA0KDQpUaGFua3MsIGxvb2tzIGdvb2Qgbm93Lg0KDQo+IGFkZCBhIFJldmll
d2VkLWJ5IHRhZyBmb3IgdGhpcyByZXZpc2lvbi4NCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQgICAgICAgfCAxMyArKysrKysrKysrKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9x
ZS9xZS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1f
cWUvcWUudHh0DQo+IGluZGV4IGQ3YWZhZmY1ZmFmZi4uMDVlYzJhODM4YzU0IDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvcWUu
dHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2Nw
bV9xZS9xZS50eHQNCj4gQEAgLTE4LDcgKzE4LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4g
IC0gcmVnIDogb2Zmc2V0IGFuZCBsZW5ndGggb2YgdGhlIGRldmljZSByZWdpc3RlcnMuDQo+ICAt
IGJ1cy1mcmVxdWVuY3kgOiB0aGUgY2xvY2sgZnJlcXVlbmN5IGZvciBRVUlDQyBFbmdpbmUuDQo+
ICAtIGZzbCxxZS1udW0tcmlzY3M6IGRlZmluZSBob3cgbWFueSBSSVNDIGVuZ2luZXMgdGhlIFFF
IGhhcy4NCj4gLS0gZnNsLHFlLW51bS1zbnVtczogZGVmaW5lIGhvdyBtYW55IHNlcmlhbCBudW1i
ZXIoU05VTSkgdGhlIFFFIGNhbiB1c2UgZm9yIHRoZQ0KPiArLSBmc2wscWUtc251bXM6IFRoaXMg
cHJvcGVydHkgaGFzIHRvIGJlIHNwZWNpZmllZCBhcyAnL2JpdHMvIDgnIHZhbHVlLA0KPiArICBk
ZWZpbmluZyB0aGUgYXJyYXkgb2Ygc2VyaWFsIG51bWJlciAoU05VTSkgdmFsdWVzIGZvciB0aGUg
dmlydHVhbA0KPiAgICB0aHJlYWRzLg0KPiANCj4gIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+IEBA
IC0zNCw2ICszNSwxMSBAQCBSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzDQo+ICAtIGJyZy1mcmVxdWVu
Y3kgOiB0aGUgaW50ZXJuYWwgY2xvY2sgc291cmNlIGZyZXF1ZW5jeSBmb3IgYmF1ZC1yYXRlDQo+
ICAgIGdlbmVyYXRvcnMgaW4gSHouDQo+IA0KPiArRGVwcmVjYXRlZCBwcm9wZXJ0aWVzDQo+ICst
IGZzbCxxZS1udW0tc251bXM6IGRlZmluZSBob3cgbWFueSBzZXJpYWwgbnVtYmVyKFNOVU0pIHRo
ZSBRRSBjYW4gdXNlDQo+ICsgIGZvciB0aGUgdGhyZWFkcy4gVXNlIGZzbCxxZS1zbnVtcyBpbnN0
ZWFkIHRvIG5vdCBvbmx5IHNwZWNpZnkgdGhlDQo+ICsgIG51bWJlciBvZiBzbnVtcywgYnV0IGFs
c28gdGhlaXIgdmFsdWVzLg0KPiArDQo+ICBFeGFtcGxlOg0KPiAgICAgICBxZUBlMDEwMDAwMCB7
DQo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+IEBAIC00NCw2ICs1MCwxMSBAQCBF
eGFtcGxlOg0KPiAgICAgICAgIHJlZyA9IDxlMDEwMDAwMCA0ODA+Ow0KPiAgICAgICAgIGJyZy1m
cmVxdWVuY3kgPSA8MD47DQo+ICAgICAgICAgYnVzLWZyZXF1ZW5jeSA9IDwxNzlBN0IwMD47DQo+
ICsgICAgICAgZnNsLHFlLXNudW1zID0gL2JpdHMvIDggPA0KPiArICAgICAgICAgICAgICAgMHgw
NCAweDA1IDB4MEMgMHgwRCAweDE0IDB4MTUgMHgxQyAweDFEDQo+ICsgICAgICAgICAgICAgICAw
eDI0IDB4MjUgMHgyQyAweDJEIDB4MzQgMHgzNSAweDg4IDB4ODkNCj4gKyAgICAgICAgICAgICAg
IDB4OTggMHg5OSAweEE4IDB4QTkgMHhCOCAweEI5IDB4QzggMHhDOQ0KPiArICAgICAgICAgICAg
ICAgMHhEOCAweEQ5IDB4RTggMHhFOT47DQo+ICAgICAgIH0NCj4gDQo+ICAqIE11bHRpLVVzZXIg
UkFNIChNVVJBTSkNCj4gLS0NCj4gMi4yMC4xDQo+IA0KDQo=
