Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18ABEA56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 03:56:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dyhS3s0fzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 11:56:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.81; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="evtrozh8"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30081.outbound.protection.outlook.com [40.107.3.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyfW2ZC5zDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 11:54:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3p5jiSyd5Pkv8QcS6eCkBh//1InwvYK9A+eo4ithkYeqHMLy1zLXRPiuvFvWyoln882qFCuui3zhkKSuDLsLUXymtVCxAmRUqCaLU2pd6MAue19HCPTEU2JVGGeUYQBqbxeuGMLhtKQbNl9y9k7TcF5OdhzweCn4xDVBBWo2pn4r+ISttRPuu1zX2CMGhj7okge0znPraLgC5josp0AOlajQju22YyYOQ+Wb4ECsQwT7NVgpBWbGmkaKsxSIvI+YlQZ5Sgd1NO9hMSn8hp6v72kJYAXFdUZO4WKP0bxkjMSq2oeKqvE6ni0ETqIUDKFHyAIHZB/gG2x0MprPHrsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1jITZmPWC1jiXrKEf7aNWvcxqrS9c2X+vMmhoPrxDQ=;
 b=Ll3cbQ4NIIeQKJWdnYS0N/zY8MjmLBoU+tdQJE+NYxJjlNRHYS4oKixF8Q9yv1OP8Gi0jLwcIebCoQ380pAnTaUoVRHOERXefLeqrt7oxumVJ0TfNfhpckS5yGYdwdtL1AxIBuiYgpwM5y7BXest7see+/Db7Li5SlJS3dgWYO0N7ccg+q4G2zBLLtNANl1LyUk8K15V/A2jfEMAtfO0Y+nsmNxtzVUbN3egr7K5dFaHDdR3v4x1yoWdItQJ+Bo1iXkqHwEvYOYqwr/PfkBfuB/UrOqHOf4A0QJ5IwXyAlqcrvZULgHakxsp0KbT7wHZ3Tu88iE4Jx8WwfKwxL4gSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1jITZmPWC1jiXrKEf7aNWvcxqrS9c2X+vMmhoPrxDQ=;
 b=evtrozh8eLFPOcLyCEUIqhIGH+0+epFGR/TBKU5kBAjuMUvUPq6kZej/iF4OfR/7kd/8Exeyqs6nCkm/fJUsmzZ7w+XoM0j/tIU8xqCQdeQAKua31vygCm//RxKC/wozDzjW4rYA6UAfufa/bfcaoSHA4da1crNNqcIhgv1W1nI=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4810.eurprd04.prod.outlook.com (20.176.233.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 01:54:34 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 01:54:34 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: RE: [EXT] Re: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Topic: [EXT] Re: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Index: AQHVcoOnab7d5ysBNkWsXmY0PrfSuKc6/L+AgAC3JZCAAAkFAIAAANMggAABmICAAAIKMIAAAb8AgAACHkCAAAZAMIAApIsAgADFeCA=
Date: Thu, 26 Sep 2019 01:54:34 +0000
Message-ID: <DB7PR04MB4490A20636B2243785D8602D8F860@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB44902BADDDFD090BAF4178C68F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <DB7PR04MB4490684FE0E95695E89173948F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <CADRPPNQ+=au2qRL2K-tzhH8HK1+sO+ut9YBhYw4UhWSv5FF88A@mail.gmail.com>
In-Reply-To: <CADRPPNQ+=au2qRL2K-tzhH8HK1+sO+ut9YBhYw4UhWSv5FF88A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68f00465-acee-4715-7e2d-08d742247aee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR04MB4810; 
x-ms-traffictypediagnostic: DB7PR04MB4810:|DB7PR04MB4810:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB481035E34DA20F652F7663C88F860@DB7PR04MB4810.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(66476007)(25786009)(64756008)(76176011)(66556008)(66446008)(186003)(3846002)(478600001)(71190400001)(71200400001)(6116002)(316002)(305945005)(4326008)(229853002)(7736002)(14454004)(6436002)(44832011)(74316002)(9686003)(2906002)(55016002)(102836004)(476003)(256004)(6862004)(486006)(81166006)(66066001)(86362001)(8676002)(99286004)(53546011)(6506007)(52536014)(446003)(26005)(11346002)(81156014)(33656002)(6246003)(76116006)(66946007)(14444005)(6636002)(8936002)(7696005)(5660300002)(54906003)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4810;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /mJgdcqABuU0Snfpc7p8C4x8L4qt2cvFh6AKMVH/HS/bXfjCrQy+6I7LjXDHrjFHYPbqlA2OxwpgwYbbHV7CBwbOHv6Ov6kgWEdOQQ1vILQJuH5NRSM6NH3kca0TPYSGzRuXw8ckfSU6Gi9EkaibYcjpnnOPd4zFnPOaK8UI9j7sqBPppMFmw1+siJqhIRCKa0Jr3eN5cfDgpwOgGUD18zvsjw9mmAC8yVr+iooxRYtQN6E5BwD9EBA91MmYXJBZSSsN0BnHkpjteskp26lchGFc2cxNx8aoBj+uKvqp2wpGiQl+BKw4i6V4ooCZ2F2Vksv6Njz1hvRrwjZ5bG5FSHqvTMzg7NbBJWTRPENnAle8snru7l/nV6LVcjaW+fd+M4p+uEiKTsaMn8BSv6LOm3nKoW9pdwIf9BKDIRvhlbk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f00465-acee-4715-7e2d-08d742247aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 01:54:34.3331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRZVAGA0u1/fe6umgkizW0S6PtnTwjfdB4JywWVs5TnfG2MMlDJwoq8QtP/R4wasKTcX3YSYPFpU+NNn/3n/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4810
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Ran Wang <ran.wang_1@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDExOjI3
IFBNIEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGUgJ2ZzbCxpcHBk
ZXhwY3ItYWx0LWFkZHInIHByb3BlcnR5IGlzIHVzZWQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBoYW5kbGUgYW4gZXJyYXRhDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQS0wMDg2NDYgb24gTFMx
MDIxQQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQ2hhbmdlIGluIHYzOg0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgIC0gcmVuYW1lIHByb3BlcnR5IG5hbWUNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgIGZzbCxyY3BtLXNjZmcgLT4gZnNsLGlwcGRleHBjci1hbHQtYWRkcg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQ2hhbmdlIGluIHYyOg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIC0gdXBkYXRlIGRlc2Mgb2YgdGhlIHByb3BlcnR5
ICdmc2wscmNwbS1zY2ZnJw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL3JjcG0udHh0
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gfCAxNA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKysr
KysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBk
aWZmIC0tZ2l0DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL2ZzbC9yY3BtLnR4dA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvcmNwbS50eHQNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBpbmRleCA1YTMzNjE5ZDg4MWQuLjE1N2RjZjZkYTE3YyAxMDA2NDQNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL3JjcG0udHh0DQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wv
cmNwbQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyAudHh0DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gQEAgLTM0LDYgKzM0LDExIEBAIENoYXNzaXMgVmVyc2lvbiAgICAgICAgICAgIEV4YW1wbGUN
Cj4gPiA+ID4gPiBDaGlwcw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBPcHRpb25hbCBwcm9wZXJ0
aWVzOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgLSBsaXR0bGUtZW5kaWFuIDogUkNQTSByZWdp
c3RlciBibG9jayBpcyBMaXR0bGUgRW5kaWFuLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdpdGhv
dXQgaXQNCj4gPiA+ID4gPiA+IFJDUE0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgd2lsbCBi
ZSBCaWcgRW5kaWFuIChkZWZhdWx0IGNhc2UpLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgLSBm
c2wsaXBwZGV4cGNyLWFsdC1hZGRyIDogTXVzdCBhZGQgdGhlIHByb3BlcnR5DQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gKyBmb3IgU29DIExTMTAyMUEsDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+ID4gPiA+IFlvdSBwcm9iYWJseSBzaG91bGQgbWVudGlvbiB0aGlzIGlzIHJlbGF0
ZWQgdG8gYQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiBoYXJkd2FyZSBpc3N1ZSBvbiBMUzEwMjFhIGFu
ZCBvbmx5IG5lZWRlZCBvbiBMUzEwMjFhLg0KPiA+ID4gPiA+ID4gPiA+ID4gT2theSwgZ290IGl0
LCB0aGFua3MsIEkgd2lsbCBhZGQgdGhpcyBpbiB2NC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgTXVzdCBpbmNsdWRlIG4gKyAxIGVudHJpZXMgKG4gPQ0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgI2ZzbCxyY3BtLXdha2V1cC1jZWxscywgc3VjaA0KPiA+
ID4gPiBhczoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgI2ZzbCxyY3BtLXdha2V1cC1jZWxs
cyBlcXVhbCB0byAyLCB0aGVuIG11c3QNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIGluY2x1ZGUN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIDINCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICsNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArIDENCj4gPiA+ID4gPiA+IGVudHJpZXMpLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAjZnNsLHJjcG0td2FrZXVwLWNlbGxzIGlz
IHRoZSBudW1iZXIgb2YgSVBQREVYUENSDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHJlZ2lzdGVycyBv
biBhbg0KPiA+ID4gPiA+ID4gU29DLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBIb3dldmVyIHlvdSBh
cmUgZGVmaW5pbmcgYW4gb2Zmc2V0IHRvIHNjZmcgcmVnaXN0ZXJzIGhlcmUuDQo+ID4gPiA+ID4g
PiA+ID4gPiA+IFdoeSB0aGVzZSB0d28gYXJlIHJlbGF0ZWQ/ICBUaGUgbGVuZ3RoIGhlcmUgc2hv
dWxkDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGFjdHVhbGx5IGJlIHJlbGF0ZWQgdG8gdGhlICNhZGRy
ZXNzLWNlbGxzIG9mIHRoZSBzb2MvLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBCdXQgc2luY2UgdGhp
cyBpcyBvbmx5IG5lZWRlZCBmb3IgTFMxMDIxLCB5b3UgY2FuDQo+ID4gPiA+ID4gPiA+ID4gPiBq
dXN0IG1ha2UgaXQgMy4NCj4gPiA+ID4gPiA+ID4gPiA+IEkgbmVlZCBzZXQgdGhlIHZhbHVlIG9m
IElQUERFWFBDUiByZXNnaXRlcnMgZnJvbQ0KPiA+ID4gPiA+ID4gPiA+ID4gZnRtX2FsYXJtMCBk
ZXZpY2Ugbm9kZShmc2wscmNwbS13YWtldXAgPSA8JnJjcG0gMHgwDQo+ID4gPiA+ID4gPiA+ID4g
PiAweDIwMDAwMDAwPjsNCj4gPiA+ID4gPiA+ID4gPiA+IDB4MCBpcyBhIHZhbHVlIGZvciBJUFBE
RVhQQ1IwLCAweDIwMDAwMDAwIGlzIGEgdmFsdWUgZm9yDQo+ID4gPiA+ID4gPiBJUFBERVhQQ1Ix
KS4NCj4gPiA+ID4gPiA+ID4gPiA+IEJ1dCBiZWNhdXNlIG9mIHRoZSBoYXJkd2FyZSBpc3N1ZSBv
biBMUzEwMjFBLCBJIG5lZWQNCj4gPiA+ID4gPiA+ID4gPiA+IHN0b3JlIHRoZSB2YWx1ZSBvZiBJ
UFBERVhQQ1IgcmVnaXN0ZXJzIHRvIGFuIGFsdA0KPiA+ID4gPiA+ID4gPiA+ID4gYWRkcmVzcy4g
U28gSSBkZWZpbmluZyBhbiBvZmZzZXQgdG8gc2NmZyByZWdpc3RlcnMsIHRoZW4NCj4gPiA+ID4g
PiA+ID4gPiA+IFJDUE0gZHJpdmVyIGdldCBhbiBhYm9zb2x1dGUgYWRkcmVzcyBmcm9tIG9mZnNl
dCwgUkNQTQ0KPiA+ID4gPiA+ID4gPiA+ID4gZHJpdmVyIHdyaXRlIHRoZSB2YWx1ZSBvZiBJUFBE
RVhQQ1IgcmVnaXN0ZXJzIHRvIHRoZXNlDQo+ID4gPiA+ID4gPiA+ID4gPiBhYm9zb2x1dGUgYWRk
cmVzc2VzKGJhY2t1cCB0aGUgdmFsdWUgb2YgSVBQREVYUENSDQo+ID4gPiA+ID4gPiByZWdpc3Rl
cnMpLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gSSB1bmRlcnN0YW5kIHdoYXQg
eW91IGFyZSB0cnlpbmcgdG8gZG8uICBUaGUgcHJvYmxlbSBpcw0KPiA+ID4gPiA+ID4gPiA+IHRo
YXQgdGhlIG5ldyBmc2wsaXBwZGV4cGNyLWFsdC1hZGRyIHByb3BlcnR5IGNvbnRhaW5zIGENCj4g
PiA+ID4gPiA+ID4gPiBwaGFuZGxlIGFuZCBhbg0KPiA+ID4gb2Zmc2V0Lg0KPiA+ID4gPiA+ID4g
PiA+IFRoZSBzaXplIG9mIGl0IHNob3VsZG4ndCBiZSByZWxhdGVkIHRvICNmc2wscmNwbS13YWtl
dXAtY2VsbHMuDQo+ID4gPiA+ID4gPiA+IFlvdSBtYXliZSBsaWtlIHRoaXM6IGZzbCxpcHBkZXhw
Y3ItYWx0LWFkZHIgPSA8JnNjZmcNCj4gPiA+ID4gPiA+ID4gMHg1MWM+Oy8qDQo+ID4gPiA+ID4g
PiA+IFNDRkdfU1BBUkVDUjggKi8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBOby4gIFRoZSAj
YWRkcmVzcy1jZWxsIGZvciB0aGUgc29jLyBpcyAyLCBzbyB0aGUgb2Zmc2V0IHRvDQo+ID4gPiA+
ID4gPiBzY2ZnIHNob3VsZCBiZSAweDAgMHg1MWMuICBUaGUgdG90YWwgc2l6ZSBzaG91bGQgYmUg
MywgYnV0IGl0DQo+ID4gPiA+ID4gPiBzaG91bGRuJ3QgYmUgY29taW5nIGZyb20gI2ZzbCxyY3Bt
LXdha2V1cC1jZWxscyBsaWtlIHlvdQ0KPiA+ID4gPiA+ID4gbWVudGlvbmVkIGluIHRoZQ0KPiA+
ID4gYmluZGluZy4NCj4gPiA+ID4gPiBPaCwgSSBnb3QgaXQuIFlvdSB3YW50IHRoYXQgZnNsLGlw
cGRleHBjci1hbHQtYWRkIGlzIHJlbGF0aXZlDQo+ID4gPiA+ID4gd2l0aCAjYWRkcmVzcy1jZWxs
cyBpbnN0ZWFkIG9mICNmc2wscmNwbS13YWtldXAtY2VsbHMuDQo+ID4gPiA+DQo+ID4gPiA+IFll
cy4NCj4gPiA+IEkgZ290IGFuIGV4YW1wbGUgZnJvbSBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2ktbGF5ZXJzY2FwZS5jDQo+ID4gPiBhbmQgYXJjaC9hcm0vYm9vdC9kdHMvbHMxMDIxYS5k
dHNpIGFzIGZvbGxvd3M6DQo+ID4gPiBmc2wscGNpZS1zY2ZnID0gPCZzY2ZnIDA+LCAwIGlzIGFu
IGluZGV4DQo+ID4gPg0KPiA+ID4gSW4gbXkgZnNsLGlwcGRleHBjci1hbHQtYWRkciA9IDwmc2Nm
ZyAweDAgMHg1MWM+LCBJdCBtZWFucyB0aGF0IDB4MA0KPiA+ID4gaXMgYW4gYWx0IG9mZnNldCBh
ZGRyZXNzIGZvciBJUFBERVhQQ1IwLCAweDUxYyBpcyBhbiBhbHQgb2Zmc2V0DQo+ID4gPiBhZGRy
ZXNzIEZvcg0KPiA+ID4gSVBQREVYUENSMSBpbnN0ZWFkIG9mIDB4MCBhbmQgMHg1MWMgY29tcG9z
ZSB0byBhbiBhbHQgYWRkcmVzcyBvZg0KPiA+ID4gU0NGR19TUEFSRUNSOC4NCj4gPiBNYXliZSBJ
IG5lZWQgd3JpdGUgaXQgYXM6DQo+ID4gZnNsLGlwcGRleHBjci1hbHQtYWRkciA9IDwmc2NmZyAw
eDAgMHgwIDB4MCAweDUxYz47IGZpcnN0IHR3byAweDANCj4gPiBjb21wb3NlIGFuIGFsdCBvZmZz
ZXQgYWRkcmVzcyBmb3IgSVBQREVYUENSMCwgbGFzdCAweDAgYW5kIDB4NTFjDQo+ID4gY29tcG9z
ZSBhbiBhbHQgYWRkcmVzcyBmb3IgSVBQREVYUENSMSwNCj4gDQo+IEkgcmVtZW1iZXIgdGhlIGhh
cmR3YXJlIGlzc3VlIGlzIG9ubHkgaXMgb25seSByZWxhdGVkIHRvIElQUERFWFBDUjEgcmVnaXN0
ZXIsIG5vDQo+IGlkZWEgd2h5IHlvdSBuZWVkIHRvIGRlZmluZSBJUFBERVhQQ1IwIGluIHRoZSBi
aW5kaW5nLg0KT2theSwgZ290IGl0LCB0aGFua3MuDQpCZXN0IFJlZ2FyZHMsDQpCaXdlbiBMaQ0K
PiANCj4gPg0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBCaXdlbiBMaQ0KPiA+ID4gPg0KPiA+ID4g
PiBSZWdhcmRzLA0KPiA+ID4gPiBMZW8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgVGhlIGZpcnN0IGVu
dHJ5IG11c3QgYmUgYSBsaW5rIHRvIHRoZSBTQ0ZHIGRldmljZSBub2RlLg0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgICBUaGUgbm9uLWZpcnN0IGVudHJ5IG11c3QgYmUgb2Zmc2V0IG9mIHJlZ2lz
dGVycyBvZiBTQ0ZHLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gIEV4YW1wbGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIFRoZSBSQ1BNIG5vZGUgZm9yIFQ0
MjQwOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC00Myw2ICs0OCwxNSBAQCBUaGUgUkNQTSBu
b2RlIGZvciBUNDI0MDoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICNmc2ws
cmNwbS13YWtldXAtY2VsbHMgPSA8Mj47DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgfTsN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICtUaGUgUkNQTSBu
b2RlIGZvciBMUzEwMjFBOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIHJjcG06IHJjcG1A
MWVlMjE0MCB7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImZzbCxsczEwMjFhLXJjcG0iLA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsiZnNsLHFvcmlx
LXJjcG0tDQo+ID4gPiA+ID4gPiA+IDIuMSsiOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgcmVnID0gPDB4MCAweDFlZTIxNDAgMHgwIDB4OD47DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAjZnNsLHJjcG0td2FrZXVwLWNlbGxzID0gPDI+Ow0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgZnNsLGlwcGRleHBjci1hbHQtYWRkciA9IDwm
c2NmZyAweDANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIDB4NTFjPjsgLyoNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBTQ0ZHX1NQQVJFQ1I4ICovDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
fTsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICAqIEZyZWVzY2FsZSBSQ1BNIFdha2V1cCBTb3VyY2UgRGV2aWNl
IFRyZWUgQmluZGluZ3MNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBSZXF1aXJl
ZCBmc2wscmNwbS13YWtldXAgcHJvcGVydHkgc2hvdWxkIGJlIGFkZGVkDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gdG8gYSBkZXZpY2Ugbm9kZSBpZiB0aGUgZGV2aWNlDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAyLjE3LjENCj4gPg0K
