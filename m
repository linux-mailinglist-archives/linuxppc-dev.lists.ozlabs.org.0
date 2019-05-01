Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C210CE2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 20:48:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vS8z71mTzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 04:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-am5-obe.outbound.protection.outlook.com
 (client-ip=40.107.0.133; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="O5lpYGU1"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00133.outbound.protection.outlook.com [40.107.0.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vS7D1sNFzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 04:47:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKp2dNvnG+drs/A6ljFelvF7IrEFVsHdJHmyoRpez/Y=;
 b=O5lpYGU1TRe3XwHUzG3nkOzLAOXGPVGtaD2jjjzC32ilHwYYno4rR5Y8g7cnezJvuj1Xzl5xRtlpgK8fSrGEewUn9xegvlEeblc8ecmEsisJnrqzRH/34JRG3csVjuajSul4p/H8m7cbkLWBjP7Wz3sXy7CyjELI4O8lbjjNwBA=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1805.EURPRD10.PROD.OUTLOOK.COM (10.165.194.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 1 May 2019 18:47:11 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 18:47:11 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "leoyang.li@nxp.com"
 <leoyang.li@nxp.com>, "qiang.zhao@nxp.com" <qiang.zhao@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Topic: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Index: AQHVAABTBBh/pLqBQEiPEhE0F8Qaj6ZWYLAAgAA73IA=
Date: Wed, 1 May 2019 18:47:10 +0000
Message-ID: <12a4abf5-2a56-c5d3-dc43-59b1473c0829@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-5-rasmus.villemoes@prevas.dk>
 <4c3aef881393398ca18efac99b1f76e7dbd19acf.camel@infinera.com>
In-Reply-To: <4c3aef881393398ca18efac99b1f76e7dbd19acf.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR08CA0071.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::42) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.186.118.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcc6a1b8-c38b-4e5f-4370-08d6ce656b50
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1805; 
x-ms-traffictypediagnostic: VI1PR10MB1805:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR10MB1805211FBA12C94BA0DC11198A3B0@VI1PR10MB1805.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(136003)(39850400004)(199004)(189003)(72206003)(7736002)(36756003)(305945005)(478600001)(5660300002)(966005)(66066001)(256004)(110136005)(5024004)(54906003)(71200400001)(71190400001)(68736007)(2906002)(31696002)(71446004)(74482002)(6486002)(6436002)(2201001)(6506007)(386003)(316002)(25786009)(186003)(52116002)(486006)(11346002)(76176011)(8936002)(2616005)(476003)(99286004)(26005)(81156014)(81166006)(8676002)(229853002)(31686004)(6116002)(53936002)(6306002)(6512007)(66946007)(14454004)(73956011)(66476007)(64756008)(66556008)(44832011)(66446008)(2501003)(4326008)(3846002)(6246003)(446003)(42882007)(8976002)(102836004)(7416002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1805;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 04Bgu7zXkfJErxHd0qWYxM06+wopIhFAB5HyWoRI33FZD+Mv86mBMFLRvZaMGY7aTxW3AeG0USvQllpUKfnwKlmMTQERzpqf4JuP+GWSXF+LvaSeoF9xNwQL1ssZKN18cosniEMq+HEQqgZoRyda1Ryvm8dG7c8reIHmj/zxwjxEazxlikkEZI1WNhK4ILVzYJwb/F7/344UmuV3umlpxAeFmVmepUYoP1qtIDE/O3rIclhHNhjrKHDx5ZmNBAZa6BHNVR5L08r3qnaFYJVwFH6yX5PxUQQ8xXdhSRtIBAVjJ1hjt1fbeSSbXpxwwLaqM6VjWgbP96FQ+AidUgq/IINsRkAbSL8WWOLZV1Ipmyd4RVqQrvbEMRbMGDzd2gnROOjNyZMApsQL4bRDdbT7xiBTa2fDku2QhwiZuThwT7w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D3C3DDBAB3D4847BB37F9D538B0407B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc6a1b8-c38b-4e5f-4370-08d6ce656b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 18:47:11.0077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1805
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
 Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "oss@buserror.net" <oss@buserror.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMDEvMDUvMjAxOSAxNy4xMiwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gT24gV2VkLCAy
MDE5LTA1LTAxIGF0IDA5OjI5ICswMDAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3RlOg0KPj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJl
Y29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pg0KPj4N
Cj4+IFJlYWRpbmcgdGFibGUgNC0zMCwgYW5kIGl0cyBmb290bm90ZXMsIG9mIHRoZSBRVUlDQyBF
bmdpbmUgQmxvY2sNCj4+IFJlZmVyZW5jZSBNYW51YWwgc2hvd3MgdGhhdCB0aGUgc2V0IG9mIHNu
dW0gX3ZhbHVlc18gaXMgbm90DQo+PiBuZWNlc3NhcmlseSBqdXN0IGEgZnVuY3Rpb24gb2YgdGhl
IF9udW1iZXJfIG9mIHNudW1zLCBhcyBnaXZlbiBpbiB0aGUNCj4+IGZzbCxxZS1udW0tc251bXMg
cHJvcGVydHkuDQo+Pg0KPj4gQXMgYW4gYWx0ZXJuYXRpdmUsIHRvIG1ha2UgaXQgZWFzaWVyIHRv
IGFkZCBzdXBwb3J0IGZvciBvdGhlciB2YXJpYW50cw0KPj4gb2YgdGhlIFFVSUNDIGVuZ2luZSBJ
UCwgdGhpcyBpbnRyb2R1Y2VzIGEgbmV3IGJpbmRpbmcgZnNsLHFlLXNudW1zLA0KPj4gd2hpY2gg
YXV0b21hdGljYWxseSBlbmNvZGVzIGJvdGggdGhlIG51bWJlciBvZiBzbnVtcyBhbmQgdGhlIGFj
dHVhbA0KPj4gdmFsdWVzIHRvIHVzZS4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgZm9yIHRoZSBNUEM4
MzA5LCBvbmUgd291bGQgc3BlY2lmeSB0aGUgcHJvcGVydHkgYXMNCj4+DQo+PiAgICAgICAgICAg
ICAgICBmc2wscWUtc251bXMgPSAvYml0cy8gOCA8DQo+PiAgICAgICAgICAgICAgICAgICAgICAg
IDB4ODggMHg4OSAweDk4IDB4OTkgMHhhOCAweGE5IDB4YjggMHhiOQ0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAweGM4IDB4YzkgMHhkOCAweGQ5IDB4ZTggMHhlOT47DQo+IA0KPiBJIHRoaW5r
IHlvdSBuZWVkIGFkZCB0aGlzIGV4YW1wbGUgdG8gdGhlIHFlLnR4dCBkb2MgaXRzZWxmdC4NCg0K
U3VyZSwgY2FuIGRvLg0KDQo+IEJUVywgd2hhdCBpcyAvYml0cy8gPw0KDQpUaGF0IGluZGljYXRl
cyB0aGF0IHRoZSBudW1iZXJzIHNob3VsZCBiZSBzdG9yZWQgYXMgYW4gYXJyYXkgb2YgdTgsIGFu
ZA0Kbm90IGFzIGJ5IGRlZmF1bHQgYW4gYXJyYXkgb2YgKGJpZy1lbmRpYW4pIDMyLWJpdCBudW1i
ZXJzLiBTZWUNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2R0Yy9kdGMu
Z2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kdHMtZm9ybWF0LnR4dCNuNDYNCg0KVGhpcyBpcyBhbHJl
YWR5IHVzZWQgaW4gc29tZSBiaW5kaW5ncyBhbmQgZXhpc3RpbmcgLmR0cyAoZS5nLg0KaHdtb24v
YXNwZWVkLXB3bS10YWNoby50eHQsIGJ1dCBnaXQgZ3JlcCBzaG93cyBtYW55IG1vcmUpLg0KDQpS
YXNtdXMNCg==
