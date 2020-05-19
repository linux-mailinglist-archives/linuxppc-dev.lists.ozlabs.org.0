Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D331D8E50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 05:39:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R1pJ4h4pzDqpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 13:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.88; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=sV3Dyyl7; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R1mW6PfDzDqm9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 13:37:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAlq8dcVDfcwSRD5xL9hTx9j9jxMDvgzmCurb1jxsR9ecZ5qrtISXM2jj67qs5/q2bnnLFErCrzEKUE6IuxuJVwcA2mADfBajAv8MXEbdE5ZW7lu4TbwSgGRsnYGRVJuQT0CAgEcetAdZyCCgFTw1sqmES2Mx2fUxKWSxKWDY7bzlmaCVGWhCPaity7sAeWhFuOZM7m11q798dAHoy9ZPj+oCThb+3TBFpZF/dBHH2ygMGbBxgQ+oIkP07v3oPX27i9HjH7q0pYwENCguFa6vAsbhMFKkBoVyP78o0Lb1mMXAc1bhce8Uk2U/JPME/irfuqNd4WNghur7ocTQUJ0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfbZaEIvXULACniSepGlbY3JWA76pjiKwVB0Wyh9cJ8=;
 b=XUrPYADA7yENwH+vJz1suB4hW28UwvIT5yVTDqPFSttVoU4H3rTNbcvbJVaPazBTn51LGhrrlICaL9+iCjSLx62CmBeASLUWAtig0apURo4CEVhWjK6BI0cx7bRH/zNHQR+YyZO5p5GpPkXuYwURn+l2TikPNpaA43hSX7gQvcXHcDKwm0Ttdhn8yeQn0e40DA+isjTilQ59OqCKqcvL5q/mhwtk83h9DpSIFe4dZFGriOV3GqtWni5Kph10mcFJKe+rTpYtCYfD/wsFdeIAK/zJ6GkTHcsNjMCsYy8SieLZOER+GeNN/2SdV2Mce0MtNORd6diSlsMr6FuptXJArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfbZaEIvXULACniSepGlbY3JWA76pjiKwVB0Wyh9cJ8=;
 b=sV3Dyyl7nM0ZIJfHpxys+I6neYfSiTGs56KXTQYGBAe/+Jz0t9nzfwHwDdAXGWvN2ISijWvWo+sqH1Lg4fDazYBE1gfetAJmXdfViCKE2gJ7BAIqrhhmU5hqLrlrvrxpbkZWFsg2Y4EgZGuIvVHXKYri8h1yuXrx+ylQLFYuZmM=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 03:37:38 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::48b0:7f65:3d24:7733]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::48b0:7f65:3d24:7733%7]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 03:37:38 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Thread-Topic: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Thread-Index: AQHWLWGuojis9CniAEW2XimSNhF8HqiuwkuQ
Date: Tue, 19 May 2020 03:37:37 +0000
Message-ID: <VE1PR04MB6768CA802BD428288306587891B90@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200518221904.GA22274@embeddedor>
In-Reply-To: <20200518221904.GA22274@embeddedor>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44259fa0-9130-4a96-2367-08d7fba5fa17
x-ms-traffictypediagnostic: VE1PR04MB6623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6623A2D120C7EFDCC571286691B90@VE1PR04MB6623.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9DsswM+mihmhWAH0Uhl68nt6jhzboJG0uXdbimpQKgX2EJTRvOvx0DkugsChrA9GlIP0uEnZEmKts9mg7XaYCmlfs9bdTPFGtJH0JkraL36p0mrrxSeGA/q8aEtDXncBoBr/qREAbLUxhSya0ZA+FcXQ4oZHMHzfCfk+C8S/0kRQJWZJhqcPURXsZYv57uOEzlo2j2VznSBvDbAdUh+xb6bpY3EEnclu0ASOLI5xkVqGTzCkxErPzKvG+BLMxFUceE8KzELSMW8h5MluwKOM+B3Olrbka2ducDgQ22NYzgRPww0ffrTYwa0kkZAx0IHZSEsAQJvcoPEwc5NRmllZSHhpPCDto8jTZ8nLlPhj/kp7IIDkM01SXUzTwrfy+STPTVMSZslHjRA76p3N8zCz/6uM2bRt1Dh3pB7o8WcuqMjMNkwoOruI/6PSoOyJZ+goFPVwxbRy69b0ZfWiAscKe313KzKdrWHo2rtCaANqth2gUvu4/jAHYrigpnv4W6PqD+ZUMVQGEZE5vvbTPCsBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6768.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(55016002)(9686003)(2906002)(5660300002)(83080400001)(33656002)(26005)(76116006)(4326008)(186003)(66556008)(64756008)(110136005)(54906003)(66446008)(66476007)(66946007)(86362001)(7696005)(53546011)(6506007)(966005)(316002)(478600001)(6636002)(52536014)(44832011)(8936002)(71200400001)(45080400002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pM3eTzLOhpbjWvYsrVo8eQYfemOpWbzmMRuGAxTiOp48wxKUFK6CSjslJRXiYWRPBq61oJF32ypEd9qKtxdMQKUlmwbimXWoD1/XxI0qm3MQeO3oSen/yDKjLg5k1ZJTokv+u/yGPnjkJ4irkEv9QiCGPb1S8BZLIPRj1OinTufSgAh56pQjXVRD3Ta5/a4ZhAGLk+Gxy6fGJczvdA2lZYkEKQzJKDyetnijOaYKlt4f2gsVtOLGP91fZorczGsFFP7uPu6S/PRd+GPbX2LEd0FxmYtuzANhF+zFNO964OMprQow1537+XLRiJal/8ZBdrHLbvod0H+PaHgkcdr+IKXWs7zJOJB1p1kyK4erQBZJPFUp6jPfLAqH4LRb5K0I4lRuZjP/Zjr1iHxa7VseEISZqVdECvrN1dqC8jc7I1agTovzZwDJVlMYUbXVdLg1zs+y0t8yL4eWFOx6b2rAKn37FD1ap09ySSUsKAA71K4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44259fa0-9130-4a96-2367-08d7fba5fa17
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 03:37:37.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AedfcZcvprY1WWPs1VEn0vzod+fbxbbmJwf8LXF8O80QDAb1KiqqiobxFSudbshjJ4Q9Aw/6lhJpwfBGHzAc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
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
Cc: Kees Cook <keescook@chromium.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAyMDIwLzUvMTkgNjoxOSwgR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJu
ZWwub3JnPiB3cm90ZToNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDE
6jXUwjE5yNUgNjoxOQ0KPiBUbzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPjsgTGVv
IExpIDxsZW95YW5nLmxpQG54cC5jb20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVk
b3IuY29tPjsNCj4gS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+IFN1YmplY3Q6
IFtQQVRDSF0gc29jOiBmc2w6IHFlOiBSZXBsYWNlIG9uZS1lbGVtZW50IGFycmF5IGFuZCB1c2Ug
c3RydWN0X3NpemUoKQ0KPiBoZWxwZXINCj4gDQo+IFRoZSBjdXJyZW50IGNvZGViYXNlIG1ha2Vz
IHVzZSBvZiBvbmUtZWxlbWVudCBhcnJheXMgaW4gdGhlIGZvbGxvd2luZw0KPiBmb3JtOg0KPiAN
Cj4gc3RydWN0IHNvbWV0aGluZyB7DQo+ICAgICBpbnQgbGVuZ3RoOw0KPiAgICAgdTggZGF0YVsx
XTsNCj4gfTsNCj4gDQo+IHN0cnVjdCBzb21ldGhpbmcgKmluc3RhbmNlOw0KPiANCj4gaW5zdGFu
Y2UgPSBrbWFsbG9jKHNpemVvZigqaW5zdGFuY2UpICsgc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+IGlu
c3RhbmNlLT5sZW5ndGggPSBzaXplOw0KPiBtZW1jcHkoaW5zdGFuY2UtPmRhdGEsIHNvdXJjZSwg
c2l6ZSk7DQo+IA0KPiBidXQgdGhlIHByZWZlcnJlZCBtZWNoYW5pc20gdG8gZGVjbGFyZSB2YXJp
YWJsZS1sZW5ndGggdHlwZXMgc3VjaCBhcyB0aGVzZQ0KPiBvbmVzIGlzIGEgZmxleGlibGUgYXJy
YXkgbWVtYmVyWzFdWzJdLCBpbnRyb2R1Y2VkIGluIEM5OToNCj4gDQo+IHN0cnVjdCBmb28gew0K
PiAgICAgICAgIGludCBzdHVmZjsNCj4gICAgICAgICBzdHJ1Y3QgYm9vIGFycmF5W107DQo+IH07
DQo+IA0KPiBCeSBtYWtpbmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwgZ2V0
IGEgY29tcGlsZXIgd2FybmluZyBpbiBjYXNlDQo+IHRoZSBmbGV4aWJsZSBhcnJheSBkb2VzIG5v
dCBvY2N1ciBsYXN0IGluIHRoZSBzdHJ1Y3R1cmUsIHdoaWNoIHdpbGwgaGVscCB1cyBwcmV2ZW50
DQo+IHNvbWUga2luZCBvZiB1bmRlZmluZWQgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nIGluYWR2
ZXJ0ZW50bHkgaW50cm9kdWNlZFszXQ0KPiB0byB0aGUgY29kZWJhc2UgZnJvbSBub3cgb24uIFNv
LCByZXBsYWNlIHRoZSBvbmUtZWxlbWVudCBhcnJheSB3aXRoIGENCj4gZmxleGlibGUtYXJyYXkg
bWVtYmVyLg0KPiANCj4gQWxzbywgbWFrZSB1c2Ugb2YgdGhlIG5ldyBzdHJ1Y3Rfc2l6ZSgpIGhl
bHBlciB0byBwcm9wZXJseSBjYWxjdWxhdGUgdGhlIHNpemUgb2YNCj4gc3RydWN0IHFlX2Zpcm13
YXJlLg0KPiANCj4gVGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5l
bGxlIGFuZCwgYXVkaXRlZCBhbmQgZml4ZWQNCj4gX21hbnVhbGx5Xy4NCj4gDQo+IFsxXQ0KPiBo
dHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZnY2MuZ251Lg0KPiBvcmclMkZvbmxpbmVkb2NzJTJGZ2NjJTJGWmVyby1MZW5ndGgu
aHRtbCZhbXA7ZGF0YT0wMiU3QzAxJTdDcWlhbmcuDQo+IHpoYW8lNDBueHAuY29tJTdDYjA1OGJj
YjlhZjEzNGRmODQ0NjgwOGQ3ZmI3OGNmYTklN0M2ODZlYTFkM2JjMmINCj4gNGM2ZmE5MmNkOTlj
NWMzMDE2MzUlN0MwJTdDMCU3QzYzNzI1NDM2ODYxMDIwMzkwOCZhbXA7c2RhdGE9NzANCj4gYTZW
Qmczb1dRZjlhNUtJQ3VDRXVJajZndzU3TktZaE52MkpMOEpkRFklM0QmYW1wO3Jlc2VydmVkPTAN
Cj4gWzJdDQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jDQo+IG9tJTJGS1NQUCUyRmxpbnV4JTJGaXNzdWVz
JTJGMjEmYW1wO2RhdGE9MDIlN0MwMSU3Q3FpYW5nLnpoYW8lNDANCj4gbnhwLmNvbSU3Q2IwNThi
Y2I5YWYxMzRkZjg0NDY4MDhkN2ZiNzhjZmE5JTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmMNCj4gZDk5
YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcyNTQzNjg2MTAyMTM5MDEmYW1wO3NkYXRhPWtWeU5CWUhi
bQ0KPiBhNWpDTzlwYmtvSE1ldEhFWUd2V0RxNlh3JTJCQmVDN3VISUklM0QmYW1wO3Jlc2VydmVk
PTANCj4gWzNdIGNvbW1pdCA3NjQ5NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQg
YmVoYXZpb3VyIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9hcnNAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyB8
IDQgKystLQ0KPiAgaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmggfCAyICstDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jIGluZGV4
DQo+IDQ0NzE0Njg2MWMyYzEuLjJkZjIwZDZmODVmYTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
c29jL2ZzbC9xZS9xZS5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+IEBAIC00
NDgsNyArNDQ4LDcgQEAgaW50IHFlX3VwbG9hZF9maXJtd2FyZShjb25zdCBzdHJ1Y3QgcWVfZmly
bXdhcmUNCj4gKmZpcm13YXJlKQ0KPiAgCXVuc2lnbmVkIGludCBpOw0KPiAgCXVuc2lnbmVkIGlu
dCBqOw0KPiAgCXUzMiBjcmM7DQo+IC0Jc2l6ZV90IGNhbGNfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qg
cWVfZmlybXdhcmUpOw0KPiArCXNpemVfdCBjYWxjX3NpemU7DQo+ICAJc2l6ZV90IGxlbmd0aDsN
Cj4gIAljb25zdCBzdHJ1Y3QgcWVfaGVhZGVyICpoZHI7DQo+IA0KPiBAQCAtNDgwLDcgKzQ4MCw3
IEBAIGludCBxZV91cGxvYWRfZmlybXdhcmUoY29uc3Qgc3RydWN0IHFlX2Zpcm13YXJlDQo+ICpm
aXJtd2FyZSkNCj4gIAl9DQo+IA0KPiAgCS8qIFZhbGlkYXRlIHRoZSBsZW5ndGggYW5kIGNoZWNr
IGlmIHRoZXJlJ3MgYSBDUkMgKi8NCj4gLQljYWxjX3NpemUgKz0gKGZpcm13YXJlLT5jb3VudCAt
IDEpICogc2l6ZW9mKHN0cnVjdCBxZV9taWNyb2NvZGUpOw0KPiArCWNhbGNfc2l6ZSA9IHN0cnVj
dF9zaXplKGZpcm13YXJlLCBtaWNyb2NvZGUsIGZpcm13YXJlLT5jb3VudCk7DQo+IA0KPiAgCWZv
ciAoaSA9IDA7IGkgPCBmaXJtd2FyZS0+Y291bnQ7IGkrKykNCj4gIAkJLyoNCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc29jL2ZzbC9xZS9xZS5oIGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmggaW5k
ZXgNCj4gZTI4MmFjMDFlYzA4MS4uM2ZlZGRmZWM5Zjg3ZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS9zb2MvZnNsL3FlL3FlLmgNCj4gKysrIGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmgNCj4gQEAg
LTMwNyw3ICszMDcsNyBAQCBzdHJ1Y3QgcWVfZmlybXdhcmUgew0KPiAgCQl1OCByZXZpc2lvbjsJ
CS8qIFRoZSBtaWNyb2NvZGUgdmVyc2lvbiByZXZpc2lvbiAqLw0KPiAgCQl1OCBwYWRkaW5nOwkJ
LyogUmVzZXJ2ZWQsIGZvciBhbGlnbm1lbnQgKi8NCj4gIAkJdTggcmVzZXJ2ZWRbNF07CQkvKiBS
ZXNlcnZlZCwgZm9yIGZ1dHVyZSBleHBhbnNpb24gKi8NCj4gLQl9IF9fYXR0cmlidXRlX18gKChw
YWNrZWQpKSBtaWNyb2NvZGVbMV07DQo+ICsJfSBfX3BhY2tlZCBtaWNyb2NvZGVbXTsNCj4gIAkv
KiBBbGwgbWljcm9jb2RlIGJpbmFyaWVzIHNob3VsZCBiZSBsb2NhdGVkIGhlcmUgKi8NCj4gIAkv
KiBDUkMzMiBzaG91bGQgYmUgbG9jYXRlZCBoZXJlLCBhZnRlciB0aGUgbWljcm9jb2RlIGJpbmFy
aWVzICovICB9DQo+IF9fYXR0cmlidXRlX18gKChwYWNrZWQpKTsNCj4gLS0NCj4gMi4yNi4yDQpb
Pl0gDQoNClJldmlld2VkLWJ5OiBRaWFuZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQoNCkJl
c3QgUmVnYXJkcw0KUWlhbmcgWmhhbw0KDQo=
