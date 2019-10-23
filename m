Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4AE2401
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 22:08:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z1fY3NyRzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 07:08:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.69; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="SlGscV6u"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20069.outbound.protection.outlook.com [40.107.2.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z1ch2mTKzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 07:07:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HavgujDjrOJaUDO/kjV29ZFyxa48586+e+olwiBRD0KGfzR52XIMixIaBAx+YrmyLaHjkjM0bbp6tWEK1PXWmRtVCYbQfrlLcXlqleUj9q0vk10+8LOMUiZtsx8I2jX7QgZgBuNYtuN/iVfxU8CaT4HuRUOOXHLChfFiKb6bSXpQZM8EBjwAL5BOLfbUgSa3tAXiwOoNKP3JpeznSpaZXBBzu5Wbdzzc/1OOtalb8ZDoibvWM/Lu0wYxnruqeVtzCyCP9xkmsbudtAesrBgQjVuacVUmGTPWj2mut6EDST8Nk2N9Y6GSwFY9FnWQ+CgrbxvDMjq4m6wkkeBOUX7asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btlRay3yp9k/vMTHvGvVM5ycBW7OvOsN5xwkzn1H+v8=;
 b=G4Him6BKajnKsZ9kKZC6grfF7AT+jV8G6J1L708Fuu2NHzmeLVULJp49mah3n9rfNgF3TMc02CUXAlNuI+Wsf728Z2/tp1ZhMPfmZkVC/uZXaKbbDgA1uUmr91M61uZefRPXwQXLkxZAI13tb/9asiIHHbyfG5134qmvu0v4Kn37Wu+dC3ytLP/QP1eLsIfwZsQkEToYGznSyynFA6tSwqcTOd933YICG6QXipjtV5DClbh1FsFKPRFgPEYSN31Z5itLj8++2d33owM4jeFIq+nYmExD7rsrEsRnb1kZ5t03KG5yNS7/1o6a727hvulA5r3agCDzKrFPL+vWUm2LXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btlRay3yp9k/vMTHvGvVM5ycBW7OvOsN5xwkzn1H+v8=;
 b=SlGscV6umKHhArMOVP73SRAVDdMC9z+oS0OeerUe4vfOXyPgdR+FVQBKbbISxsSFjjRXBTFCmEfsX4OJQSYMbEi4kqtg3WVAAPFx2Mewa8ySfxuCYJ8EiDFZ8jsT+yARKFTGl2vSvJ5ATlBJiEpPkucNJpz4jyR4wHgk61YduOg=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) by
 VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 23 Oct 2019 20:07:05 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::c93:c279:545b:b6b6]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::c93:c279:545b:b6b6%3]) with mapi id 15.20.2387.019; Wed, 23 Oct 2019
 20:07:05 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: RE: [PATCH v9 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v9 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHViXs7pjvy0YmnJESZ+DezIHv14qdn72mAgAAM0YCAAKtBgA==
Date: Wed, 23 Oct 2019 20:07:05 +0000
Message-ID: <VE1PR04MB6687A70243B9764F1356442C8F6B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
 <CAJZ5v0jvQaREhg94f-COdYTt58gMP7YvqdEH0oYiS9Z56tg-XQ@mail.gmail.com>
 <DB8PR04MB68261D8B18D39DF170ECC7C8F16B0@DB8PR04MB6826.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB68261D8B18D39DF170ECC7C8F16B0@DB8PR04MB6826.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e96d190-6828-418a-7fbe-08d757f493cf
x-ms-traffictypediagnostic: VE1PR04MB6687:|VE1PR04MB6687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6687EA5F673D647B8B2839D98F6B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(51914003)(199004)(13464003)(189003)(55016002)(476003)(186003)(71190400001)(71200400001)(256004)(14454004)(6436002)(446003)(26005)(7696005)(5660300002)(52536014)(478600001)(66946007)(14444005)(53546011)(11346002)(54906003)(76116006)(102836004)(25786009)(99286004)(66476007)(64756008)(8676002)(8936002)(81156014)(66556008)(66446008)(110136005)(81166006)(9686003)(305945005)(6246003)(86362001)(7736002)(229853002)(4326008)(316002)(33656002)(3846002)(6116002)(6506007)(76176011)(486006)(2906002)(7416002)(74316002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6687;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OO6dGbREqJKG2+d0hxBuOb4FGQa2VqQOCXMD1cYaEZxkpcDhYQlNdHsK0RvR7EGt7WAlXbOY3iqHOBY47Zohy2wTwA018vu3g0jhgwMse1zUsQ+26QhV04mp9x1EHrTSUyFK/fadosrqo90PbDAWcZRmM7wBzAvsMUqFRn9jHOL5X9cSDzSlMcROteYXwyOlWbpKMA47ggBog4axZgTfIxP2uwuCexRr6fRsrEbf0OiIRyczp8dCY35/BzBc5C7Fs70IP8HzKfkrcVKLBnm2PaQFgf5Ya7Lz2yMIde1uiPBQr2iz56eh8mCAZymri8y/6FIwZZOP+UJbn9uZ7bB1vYXSldfaTzT0Unj2HwMSg2LQ4qK0xD2aZJcjZ7P1TKchRig01jOTfL7gdhxYPuCbeu15YWOmj4rbaQBCsOz43oFMU0S4g8KbU0EmKSifHePa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e96d190-6828-418a-7fbe-08d757f493cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 20:07:05.8581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTzE0P3KOt4dSHYh0h8rQSpS+5NMzbTXut0jK51yIPTM1gZAEvvgellZmsYOW/QSdVfREHtTQ799fqkHqB6YXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6687
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
Cc: Mark Rutland <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>,
 Anson Huang <anson.huang@nxp.com>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuIFdhbmcgPHJhbi53
YW5nXzFAbnhwLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDE5IDQ6NTMg
QU0NCj4gVG86IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4NCj4gQ2M6IFJh
ZmFlbCBKIC4gV3lzb2NraSA8cmp3QHJqd3lzb2NraS5uZXQ+OyBSb2IgSGVycmluZw0KPiA8cm9i
aCtkdEBrZXJuZWwub3JnPjsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBNYXJrIFJ1dGxh
bmQNCj4gPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+
OyBBbnNvbiBIdWFuZw0KPiA8YW5zb24uaHVhbmdAbnhwLmNvbT47IEJpd2VuIExpIDxiaXdlbi5s
aUBueHAuY29tPjsgTGVuIEJyb3duDQo+IDxsZW4uYnJvd25AaW50ZWwuY29tPjsgR3JlZyBLcm9h
aC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4cHBjLWRldiA8
bGludXhwcGMtDQo+IGRldkBsaXN0cy5vemxhYnMub3JnPjsgTGludXggQVJNIDxsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+OyBMaW51eCBQTSA8bGludXgtcG1Admdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBS
RTogW1BBVENIIHY5IDEvM10gUE06IHdha2V1cDogQWRkIHJvdXRpbmUgdG8gaGVscCBmZXRjaCB3
YWtldXANCj4gc291cmNlIG9iamVjdC4NCj4gDQo+IEhpIFJhZmFlbCwNCj4gDQo+IE9uIFdlZG5l
c2RheSwgT2N0b2JlciAyMywgMjAxOSAxNzowNywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6DQo+
ID4NCj4gPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMDoyNCBBTSBSYW4gV2FuZyA8cmFuLndh
bmdfMUBueHAuY29tPg0KPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBTb21lIHVzZXIgbWlnaHQgd2Fu
dCB0byBnbyB0aHJvdWdoIGFsbCByZWdpc3RlcmVkIHdha2V1cCBzb3VyY2VzIGFuZA0KPiA+ID4g
ZG9pbmcgdGhpbmdzIGFjY29yZGluZ2x5LiBGb3IgZXhhbXBsZSwgU29DIFBNIGRyaXZlciBtaWdo
dCBuZWVkIHRvDQo+ID4gPiBkbyBIVyBwcm9ncmFtbWluZyB0byBwcmV2ZW50IHBvd2VyaW5nIGRv
d24gc3BlY2lmaWMgSVAgd2hpY2ggd2FrZXVwDQo+ID4gPiBzb3VyY2UgZGVwZW5kaW5nIG9uLiBT
byBhZGQgdGhpcyBBUEkgdG8gaGVscCB3YWxrIHRocm91Z2ggYWxsDQo+ID4gPiByZWdpc3RlcmVk
IHdha2V1cCBzb3VyY2Ugb2JqZWN0cyBvbiB0aGF0IGxpc3QgYW5kIHJldHVybiB0aGVtIG9uZSBi
eQ0KPiBvbmUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdhbmcgPHJhbi53YW5n
XzFAbnhwLmNvbT4NCj4gPiA+IFRlc3RlZC1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJkLmNy
ZXN0ZXpAbnhwLmNvbT4NCj4gPg0KPiA+IE9LLCB0aGFua3MgZm9yIG1ha2luZyBhbGwgb2YgdGhl
IHJlcXVlc3RlZCBjaGFuZ2VzOg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGllbnQgZGlyZWN0
aW9uIDopDQo+IEFjdHVhbGx5IExlbyBhbmQgbWUgcGxhbmVkIHRvIGhhdmUgYSBmMmYgZGlzY3Vz
c2lvbiB3aXRoIHlvdSBhYm91dCB0aGlzIHBhdGNoDQo+IG9uIExQQyAyMDE5IGJ1dCB1bmZvcnR1
bmF0ZWx5IG1pc3NlZCB0aGUgb3Bwb3J0dW5pdHkgZmluYWxseSAodjYgcmV2aWV3IHdhcw0KPiBw
ZW5kaW5nIGF0IHRpbWUpLg0KPiANCj4gPiBSZXZpZXdlZC1ieTogUmFmYWVsIEouIFd5c29ja2kg
PHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoN
Cj4gPg0KPiA+IGFuZCBwbGVhc2UgZmVlbCBmcmVlIHRvIHB1c2ggdGhpcyB0aHJvdWdoIHRoZSBh
cHByb3ByaWF0ZSBhcmNoL3BsYXRmb3JtDQo+IHRyZWUuDQo+IA0KPiBZZXMsIHdlIHdpbGwgZG8g
dGhpcyBsYXRlci4NCj4gDQo+ID4gQWx0ZXJuYXRpdmVseSwgcGxlYXNlIGxldCBtZSBrbm93IGlm
IHlvdSB3YW50IG1lIHRvIHRha2UgdGhpcyBzZXJpZXMsDQo+ID4gYnV0IHRoZW4gSSBuZWVkIGFu
IEFDSyBmcm9tIHRoZSBhcHByb3ByaWF0ZQ0KPiA+IG1haW50YWluZXIocykgb24gcGF0Y2ggMy4N
Cj4gDQo+IFRoYW5rcyBhZ2FpbiwgSSB3aWxsIHdhaXQgTGVvJ3MgY29tbWVudCBvbiBwYXRjaCAz
Lg0KDQpJIHdpbGwgZG8gYW5vdGhlciByZXZpZXcgb24gcGF0Y2ggMyBhbmQgYXBwbHkgdGhlIHNl
cmllcyB0aHJvdWdoIG15IHNvYy9mc2wgdHJlZS4NCg0KUmVnYXJkcywNCkxlbw0K
