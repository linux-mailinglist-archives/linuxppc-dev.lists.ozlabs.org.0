Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C687F1E04DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 04:49:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VhPk6v5dzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 12:49:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.21.81; helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=n3AUoINQ; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VhMm4f2SzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 12:47:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIAY7em68b30spvLf/YwT3qD9x/KkQr0toB8p6Aa04prkHA9EqqYsonWzhIlItNxVbbaWH1KGw7wgks6rlwbGgopaQMzx63H6mggE1MGExPryYIimogvTl30Mzr3Rw8Nkw7yIcN3wyHiI690zurkem23itOWVihSZ/bYaKAdtEBhzjGXWBVBKgDVWapONjLKM/hTVxrfy2rTIwHMyWzwv7U0OKz9rloDNHjH3CW9HrToKEBB3NAUfTCGTf1Q6hl6gUC/rAAmdeyYyCFvuACEzqR8oK5sNY10IIEWBuGUVlfKUijpf9cv4f8EQfrrnnXc1piy4ypVOJlP4+jU8ce8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKjR8N4L7da98tNGjPXlyqi/jZK2//4Zy4zqYp41R+Q=;
 b=J+facogj18NtKN1lhQRvgO+zKdqeDrF3LgDDo1KP7R3Zf/inbhRefIfSRuACY+PwZB1QURXGk/C2fryr8Nv0e5qsOM520OE67TpBG5UOz+olsHCAGBtzQ5wffc8TLSQtTKT72hFOpmyP9ypLkS2izIrqRR0PEwJhWub7HSoLLrTRmEbXVdEfR+3MSTLC3z5dnFt2ysh7FCeiaV4NbVV9fq0coJoofcvAj++yeHz1n2joWuQZcmPWi6xuHwYXejL9DXtql1msj5HDy34oPb9978RXwvkYMHsXS+5hXbl0B5H1RNSjJjjhYOSALo4eBbg7Gkr+1vKYkD2ny3RFLxpzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKjR8N4L7da98tNGjPXlyqi/jZK2//4Zy4zqYp41R+Q=;
 b=n3AUoINQs9ZQOayVY/UlpT1RF2hzHM3Q7uRBdW30CwCVafyclIM2s6q5g7LYFk0mm0/f04OwALw/i/PPwW2j4W36xa/WFPBHi8AfDpF+byNNuAle7N7Pb6pOOZmTJZsCvUZH2B4nCdek7IbWCAIim0TeZ8KWWYfVB+YKwMkjiHk=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VE1PR04MB6366.eurprd04.prod.outlook.com (2603:10a6:803:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 02:47:23 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::48b0:7f65:3d24:7733]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::48b0:7f65:3d24:7733%7]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:47:23 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, Leo Li <leoyang.li@nxp.com>, Kees Cook
 <keescook@chromium.org>
Subject: RE: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Thread-Topic: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Thread-Index: AQHWLWGuojis9CniAEW2XimSNhF8HqiudHiAgAM0K4CAADs1gIACv1kAgAN89tA=
Date: Mon, 25 May 2020 02:47:23 +0000
Message-ID: <VE1PR04MB67682776BDC5682B3B330D6A91B30@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200518221904.GA22274@embeddedor>
 <202005181529.C0CB448FBB@keescook>
 <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
 <202005202022.588918E61@keescook>
 <CADRPPNTuUUVOHs76JVzELcsyRH_LSi2PGML1t2wob+45LJCXvA@mail.gmail.com>
In-Reply-To: <CADRPPNTuUUVOHs76JVzELcsyRH_LSi2PGML1t2wob+45LJCXvA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cd29a6c1-e002-45d0-cb03-08d80055f3cb
x-ms-traffictypediagnostic: VE1PR04MB6366:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6366A7B2E5661DB997C18CF691B30@VE1PR04MB6366.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: saUnENX4XV21hUGARUwtp6qz0f1cDya7DBr1rzx7S4Vffoe8p5GqqqZybcUlZUm0VDVVtq31AA3OeASagDdhx3EhNrKvhe3DOinW6RlIWsU1KCXyGyJeSEnInkIQcdy2sO+g1Xs18ZSFTLEqPG8kuFlRbxf2bkjA0k2Uk/jB44Qntsj00v9UwBgBftTV8ecW9fKfbfm8zBwgte8lT/G+rJgNR6VRlfbNATJ8xpFnun1JW1E9gI4H00De6qamikMsmGRUwNiL1xLZFjes4RaQlw+tDI9dqsLiPFfAysAxc1OQp+xx0ER6TG8XL5GHLrze
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6768.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(55016002)(9686003)(4326008)(54906003)(110136005)(316002)(71200400001)(5660300002)(86362001)(2906002)(6506007)(7696005)(26005)(186003)(53546011)(8936002)(76116006)(66946007)(66476007)(52536014)(44832011)(478600001)(8676002)(33656002)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PSW0aoSpbRZJn6UjkdBusv+rQB0x0cI9GwM2IhoOeft/qsbCgtWguYcUHB/Wq/Mw+7a1787x16joIhrnFtm2KGHWbdfz3iRoud/nkUPv8MuQZqsSIiv+Ypd7DYDffeeaWU+WmBdkJbocpZMAZDUGCHFjkjtapH+v0lXnel5A2SnmVEUQlPI6+xMgqIfsXxl1b0eZInjIxPDlgOPzca9BTphhSzoQ4CSNxj7KPI7hUUjfvXEonzJk2i8QJn+BGmhLRQnbgEWqLRl47G8jBUrtnxUDzUe/gDxTuKdeKwaN02d7VEQFC6UUmdlL3CvNPqofpMnS9CvvjX4c6GK+Y+YxjTigvB9/ZUFSmvXPn9zlPjj6rG8iJNgq4y4zC4exDsGrVel77IxRe0xH9cuV7YJ60N3EtbfkhB+nMMXEjIEiJLSLAzSVI171i3A01v0DRPFKEvCBSmN/0jEPbT7pHo04th8LtP44NctQKQfzEkuuJW4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd29a6c1-e002-45d0-cb03-08d80055f3cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:47:23.5084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pbssUBabAZCvUOlOmDICLqt96JrE6jBkkXXOpbmhNwmkNu8cpOYbzbPxVsfIv3Xn5yYrigjs96x6sdIV8BnzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6366
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCBNYXkgMjMsIDIwMjAgYXQgNToyMiBQTSBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5j
b20+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpIFlhbmcgPGxlb3lh
bmcubGlAbnhwLmNvbT4NCj4gU2VudDogMjAyMOW5tDXmnIgyM+aXpSA1OjIyDQo+IFRvOiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4gQ2M6IEd1c3Rhdm8gQS4gUi4gU2lsdmEg
PGd1c3Rhdm9hcnNAa2VybmVsLm9yZz47IFFpYW5nIFpoYW8NCj4gPHFpYW5nLnpoYW9AbnhwLmNv
bT47IGxpbnV4cHBjLWRldiA8bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc+Ow0KPiBtb2Rl
cmF0ZWQgbGlzdDpBUk0vRlJFRVNDQUxFIElNWCAvIE1YQyBBUk0gQVJDSElURUNUVVJFDQo+IDxs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsa21sIDxsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnPjsNCj4gR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRl
ZG9yLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc29jOiBmc2w6IHFlOiBSZXBsYWNlIG9u
ZS1lbGVtZW50IGFycmF5IGFuZCB1c2UNCj4gc3RydWN0X3NpemUoKSBoZWxwZXINCj4gDQo+IE9u
IFdlZCwgTWF5IDIwLCAyMDIwIGF0IDEwOjI0IFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPg0KPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDA2OjUy
OjIxUE0gLTA1MDAsIExpIFlhbmcgd3JvdGU6DQo+ID4gPiBPbiBNb24sIE1heSAxOCwgMjAyMCBh
dCA1OjU3IFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0KPiB3cm90ZToNCj4g
PiA+ID4gSG0sIGxvb2tpbmcgYXQgdGhpcyBjb2RlLCBJIHNlZSBhIGZldyBvdGhlciB0aGluZ3Mg
dGhhdCBuZWVkIHRvIGJlDQo+ID4gPiA+IGZpeGVkOg0KPiA+ID4gPg0KPiA+ID4gPiAxKSBkcml2
ZXJzL3R0eS9zZXJpYWwvdWNjX3VhcnQuYyBkb2VzIG5vdCBkbyBhIGJlMzJfdG9fY3B1KCkgY29u
dmVyc2lvbg0KPiA+ID4gPiAgICBvbiB0aGUgbGVuZ3RoIHRlc3QgKHVuZGVyc3RhbmRhYmx5LCBh
IGxpdHRsZS1lbmRpYW4gc3lzdGVtIGhhcyBuZXZlcg0KPiBydW4NCj4gPiA+ID4gICAgdGhpcyBj
b2RlIHNpbmNlIGl0J3MgcHBjIHNwZWNpZmljKSwgYnV0IGl0J3Mgc3RpbGwgd3Jvbmc6DQo+ID4g
PiA+DQo+ID4gPiA+ICAgICAgICAgaWYgKGZpcm13YXJlLT5oZWFkZXIubGVuZ3RoICE9IGZ3LT5z
aXplKSB7DQo+ID4gPiA+DQo+ID4gPiA+ICAgIGNvbXBhcmUgdG8gdGhlIGZpcm13YXJlIGxvYWRl
cjoNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgICBsZW5ndGggPSBiZTMyX3RvX2NwdShoZHItPmxl
bmd0aCk7DQo+ID4gPiA+DQo+ID4gPiA+IDIpIGRyaXZlcnMvc29jL2ZzbC9xZS9xZS5jIGRvZXMg
bm90IHBlcmZvcm0gYm91bmRzIGNoZWNraW5nIG9uIHRoZQ0KPiA+ID4gPiAgICBwZXItbWljcm9j
b2RlIG9mZnNldHMsIHNvIHRoZSB1cGxvYWRlciBtaWdodCBzZW5kIGRhdGEgb3V0c2lkZSB0aGUN
Cj4gPiA+ID4gICAgZmlybXdhcmUgYnVmZmVyLiBQZXJoYXBzOg0KPiA+ID4NCj4gPiA+IFdlIGRv
IHZhbGlkYXRlIHRoZSBDUkMgZm9yIGVhY2ggbWljcm9jb2RlLCBpdCBpcyB1bmxpa2VseSB0aGUg
Q1JDDQo+ID4gPiBjaGVjayBjYW4gcGFzcyBpZiB0aGUgb2Zmc2V0IG9yIGxlbmd0aCBpcyBub3Qg
Y29ycmVjdC4gIEJ1dCB5b3UgYXJlDQo+ID4gPiBwcm9iYWJseSByaWdodCB0aGF0IGl0IHdpbGwg
YmUgc2FmZXIgdG8gY2hlY2sgdGhlIGJvdW5kYXJ5IGFuZCBmYWlsDQo+ID4NCj4gPiBSaWdodCwg
YnV0IGEgbWFsaWNpb3VzIGZpcm13YXJlIGZpbGUgY291bGQgc3RpbGwgbWF0Y2ggQ1JDIGJ1dCB0
cmljaw0KPiA+IHRoZSBrZXJuZWwgY29kZS4NCj4gPg0KPiA+ID4gcXVpY2tlciBiZWZvcmUgd2Ug
YWN0dWFsbHkgc3RhcnQgdGhlIENSQyBjaGVjay4gIFdpbGwgeW91IGNvbWUgdXANCj4gPiA+IHdp
dGggYSBmb3JtYWwgcGF0Y2ggb3IgeW91IHdhbnQgdXMgdG8gZGVhbCB3aXRoIGl0Pw0KPiA+DQo+
ID4gSXQgc291bmRzIGxpa2UgR3VzdGF2byB3aWxsIGJlIHNlbmRpbmcgb25lLCB0aG91Z2ggSSBk
b24ndCB0aGluaw0KPiA+IGVpdGhlciBvZiB1cyBoYXZlIHRoZSBoYXJkd2FyZSB0byB0ZXN0IGl0
IHdpdGgsIHNvIGlmIHlvdSBjb3VsZCBkbw0KPiA+IHRoYXQgcGFydCwgdGhhdCB3b3VsZCBiZSBn
cmVhdCEgOikNCj4gDQo+IFRoYXQgd2lsbCBiZSBncmVhdC4gIEkgdGhpbmsgWmhhbyBRaWFuZyBj
YW4gaGVscCB3aXRoIHRoZSB0ZXN0aW5nIHBhcnQuDQo+IA0KDQpOb3cgdGhlIGZpcm13YXJlIGFy
ZSBsb2FkZWQgaW4gdWJvb3QsIGFuZCBrZXJuZWwgd2lsbCBkbyBub3RoaW5nIGZvciBpdC4NClNv
IHRlc3Rpbmcgb24gaXQgbWF5YmUgbmVlZCBzb21lIGV4dHJhIGNvZGVzIGJvdGggaW4gZHJpdmVy
IGFuZCBkdHMuDQpJbiB0aGUgbWVhbndoaWxlLCBJIGFtIHNvIGJ1c3kgb24gc29tZSBoaWdoIHBy
aW9yaXR5IHdvcmsgdGhhdCBtYXliZSB0ZXN0IHdvcmsgDQpjb3VsZCBub3QgYmUgZG9uZSBpbiB0
aW1lLg0KT25jZSBJIGFtIGZyZWUsIEkgd2lsbCBkbyBpdC4NCg0KQmVzdCBSZWdhcmRzDQpRaWFu
ZyBaaGFvDQo=
