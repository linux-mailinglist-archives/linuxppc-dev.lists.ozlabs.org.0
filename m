Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F360D1C192
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:52:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45350L2HB1zDqGv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:52:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=infinera.com
 (client-ip=40.107.72.82; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.b="ZMoyB01O";
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720082.outbound.protection.outlook.com [40.107.72.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534z34z46zDq8D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:51:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahY3PwDdvXvvZ3EwGRlFE5BFyjFOgSVg0fQHVXgQfc4=;
 b=ZMoyB01O2yYs7tKRHoQDbos461ACh2JQZZ6EJHApFP5EF0cVOmpy5soxX7NePP53R1/4gqai40ieFLp1DJhA2RC8SCd1Uriq+/Fttt4LntvJ+En81Lrp7UiZeX9u+yzQn+Ox3QBeKp02kOs/9YZYUMJJh8H/sGNJEDLIe51Oo7Q=
Received: from BYAPR10MB3541.namprd10.prod.outlook.com (20.179.62.206) by
 BYAPR10MB2648.namprd10.prod.outlook.com (52.135.217.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 04:51:36 +0000
Received: from BYAPR10MB3541.namprd10.prod.outlook.com
 ([fe80::bda3:184c:7f59:f7ab]) by BYAPR10MB3541.namprd10.prod.outlook.com
 ([fe80::bda3:184c:7f59:f7ab%7]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 04:51:35 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "roy.pledge@nxp.com" <roy.pledge@nxp.com>
Subject: Re: [PATCH v1 4/8] soc/fsl/qbman: Use index when accessing device
 tree properties
Thread-Topic: [PATCH v1 4/8] soc/fsl/qbman: Use index when accessing device
 tree properties
Thread-Index: AQHVCadY7pF1Pe9lUE2omDuEjFRsAaZqDhiA
Date: Tue, 14 May 2019 04:51:35 +0000
Message-ID: <6c97a9105fe35d2afdcd2e481d109521c7acb235.camel@infinera.com>
References: <1557763756-24118-1-git-send-email-roy.pledge@nxp.com>
 <1557763756-24118-5-git-send-email-roy.pledge@nxp.com>
 <1afd837287cebccfc1dd68365870d0f5d1cf27f7.camel@infinera.com>
 <DB6PR0402MB27278B23001A8965AE493CE3860F0@DB6PR0402MB2727.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27278B23001A8965AE493CE3860F0@DB6PR0402MB2727.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 686b4a25-3963-426e-adf7-08d6d827d80d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR10MB2648; 
x-ms-traffictypediagnostic: BYAPR10MB2648:
x-microsoft-antispam-prvs: <BYAPR10MB26482D13BAFCC20A2997174BF4080@BYAPR10MB2648.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(396003)(366004)(189003)(199004)(486006)(2201001)(53936002)(66476007)(110136005)(446003)(54906003)(11346002)(14454004)(66066001)(66446008)(118296001)(8676002)(66556008)(2616005)(91956017)(73956011)(76116006)(476003)(66946007)(64756008)(86362001)(5660300002)(6512007)(2906002)(6436002)(36756003)(229853002)(53546011)(71190400001)(102836004)(71200400001)(186003)(5024004)(76176011)(256004)(8936002)(26005)(81166006)(14444005)(7736002)(6246003)(99286004)(316002)(478600001)(305945005)(25786009)(68736007)(4326008)(2501003)(6506007)(6486002)(72206003)(6116002)(3846002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR10MB2648;
 H:BYAPR10MB3541.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4PRavAMl7Zjm13s/FrQqJX8g8RklWNI5dUJIyjva8xPZVYu94PyTLe5txwL+8DTjzrL/jWG7BPQXam2qAsnN0aZ4pzTyqHl9xHuiYYLl6Gb7bNCcKPcUYXA1zqWJ3udoh6YoJuQsIW+sBuwE+k286mmhRzTpSdBAARtKubYS46lLziZqFC3+hjKzdlyydeyT8gz5znlWHNwc/d9LEjAf/dM8a6VapntTeDyNt3aOOYPjfAAG5ihcG79jzQHUIwagiTypDhrUZqQqFGSsAVBF2uWcO+CxtmutVEge5bznGYH56uCvtBc2VOWFqwfUwaRLH6ZYN0l7bVyWufPniGE+GTE8ypnWi56f3zAs2ALhokyzthWz2iM7K7GSSF/1YS5BN9rtcucJcHyOkjFS7/gv1I7Crhn+4zxCIKM0k5DzUtY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FCAA9E0AEB788468E4FCE14DAE4DCAD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686b4a25-3963-426e-adf7-08d6d827d80d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 04:51:35.6904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2648
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
Cc: "laurentiu.tudor@nxp.com" <laurentiu.tudor@nxp.com>,
 "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDE5LTA1LTEzIGF0IDE3OjQwICswMDAwLCBSb3kgUGxlZGdlIHdyb3RlOg0KPiBD
QVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6
YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiBPbiA1LzEzLzIwMTkgMTI6NDAgUE0sIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4g
T24gTW9uLCAyMDE5LTA1LTEzIGF0IDE2OjA5ICswMDAwLCBSb3kgUGxlZGdlIHdyb3RlOg0KPiA+
ID4gVGhlIGluZGV4IHZhbHVlIHNob3VsZCBiZSBwYXNzZWQgdG8gdGhlIG9mX3BhcnNlX3BoYW5k
bGUoKQ0KPiA+ID4gZnVuY3Rpb24gdG8gZW5zdXJlIHRoZSBjb3JyZWN0IHByb3BlcnR5IGlzIHJl
YWQuDQo+ID4gSXMgdGhpcyBhIGJ1ZyBmaXg/IE1heWJlIGZvciBzdGFibGUgdG9vPw0KPiA+IA0K
PiA+ICBKb2NrZQ0KPiBZZXMgdGhpcyBjb3VsZCBnbyB0byBzdGFibGUuICBJIHdpbGwgaW5jbHVk
ZSBzdGFibGVAdmdlci5rZXJuZWwub3JnIHdoZW4NCj4gSSBzZW5kIHRoZSBuZXh0IHZlcnNpb24u
DQoNCkkgdGhpbmsgeW91IG5lZWQgdG8gc2VuZCB0aGlzIHBhdGNoIHNlcGFyYXRlbHkgdGhlbi4g
VGhlIHdob2xlIHNlcmllcyBjYW5ub3QgZ28gdG8gc3RhYmxlLg0KDQogSm9ja2UNCg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogUm95IFBsZWRnZSA8cm95LnBsZWRnZUBueHAuY29tPg0KPiA+ID4gLS0t
DQo+ID4gPiAgZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFfc3lzLmMgfCAyICstDQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vZHBhYV9zeXMuYyBiL2RyaXZl
cnMvc29jL2ZzbC9xYm1hbi9kcGFhX3N5cy5jDQo+ID4gPiBpbmRleCAzZTBhN2YzLi4wYjkwMWE4
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFfc3lzLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9kcGFhX3N5cy5jDQo+ID4gPiBAQCAtNDks
NyArNDksNyBAQCBpbnQgcWJtYW5faW5pdF9wcml2YXRlX21lbShzdHJ1Y3QgZGV2aWNlICpkZXYs
IGludCBpZHgsIGRtYV9hZGRyX3QgKmFkZHIsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpZHgsIHJldCk7DQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4g
PiAgICAgICAgIH0NCj4gPiA+IC0gICAgICAgbWVtX25vZGUgPSBvZl9wYXJzZV9waGFuZGxlKGRl
di0+b2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCAwKTsNCj4gPiA+ICsgICAgICAgbWVtX25vZGUg
PSBvZl9wYXJzZV9waGFuZGxlKGRldi0+b2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCBpZHgpOw0K
PiA+ID4gICAgICAgICBpZiAobWVtX25vZGUpIHsNCj4gPiA+ICAgICAgICAgICAgICAgICByZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3U2NChtZW1fbm9kZSwgInNpemUiLCAmc2l6ZTY0KTsNCj4gPiA+
ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7DQo+ID4gPiAtLQ0KPiA+ID4gMi43LjQNCj4gPiA+
IA0KDQo=
