Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FF3560D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 03:32:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFRhf6B8pz2yR7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 11:32:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TCxt5FBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.51; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=TCxt5FBw; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFRh538xCz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 11:31:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg7/oovfrzdnR8t18JcAZfAefPkwUcmPbCNzfHKD9c9/MDGwf6Crrak78qCfYOF6iXthC3PKt+OhEEwig1lnhTtMhhrK6U54npgU3C/XFJy5McuALxEnbDiYu7wdrCZIVQO0sT6qNPo+Pvv38mm6VsmkZwRhwvkCA0NhGSijqMkms1CXUwR0ZXGOcF5vZY6lISLXY+tt3F6zEjnGrHQZTm5JZRsA9b8ad2pE31Jupwv3Z5ngxmv3QFAqdNz5QPvqPyvYs6uP9XUvMAy0HYnNNvw3SxoML0EWRYCOgWWIphTn48TKyW91QzkMXMZRasLRqv4b0v1f8VuyqZFUOUa6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oJ+YRavceubpdba8/eD8i9CW5rpk51o1RrzM579DfM=;
 b=ToF5kpBKYdM9b3hjqDIBOiPX54xRuc/xP4S0e5exkdXylIGPBdWqjTKj6fz+J/GbBdxm7yRle/4xl6wDNPt75fg1Nle2vpWW1VucSUztYtww3yRFlcRyL6o3xZo3+QY//H2so/FMN4Lg90d4VYvuSehD3PeAj14RNhi0vN733NLyFMCGEL6clnlm26u0zIVBUJPdL46aTNSaBahc9V5dgqOykdDvjFKqWUuNGl3pARPll9suEf0w130SVkA5AMinTNao6k4hwm2/j+u2T+CBODncvhP6JWFQ9AGL2zIzM3Y8a6rmTq1d3auZ3ASkYrst7s0JnGQ9n14nLdnVI7fswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oJ+YRavceubpdba8/eD8i9CW5rpk51o1RrzM579DfM=;
 b=TCxt5FBwwB/i/YYM1LuRAhAqG9WeKxDvXcoazQZoIQG9G0O/BSFerj5MWdpghse19+sY7gQ+b84bM+Za8wOz3rn+s16XkymYqK4ssrCoR2BEbN/8EpXmtNlu1NTAkvP+aPzRC7Ic5AV41+4b+tr0wUYcdgHmFnT5X2Z9q+pOp9U=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM5PR0402MB2787.eurprd04.prod.outlook.com (2603:10a6:203:a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 01:31:38 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::2c18:5961:ebca:dfaa]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::2c18:5961:ebca:dfaa%2]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 01:31:38 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v6] soc: fsl: enable acpi support in RCPM driver
Thread-Topic: [PATCH v6] soc: fsl: enable acpi support in RCPM driver
Thread-Index: AQHXFxzh8ouwdY1weE2tXT45hbmJ7aqoLhiAgAA4tzA=
Date: Wed, 7 Apr 2021 01:31:38 +0000
Message-ID: <AM6PR04MB5413E08499BE566F67AA62ABF1759@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210312085822.12136-1-ran.wang_1@nxp.com>
 <CADRPPNRv_T9o=Kg4dCJ6jFPxOWMY24wgDXCzyTpz3oh_yL+4Tw@mail.gmail.com>
In-Reply-To: <CADRPPNRv_T9o=Kg4dCJ6jFPxOWMY24wgDXCzyTpz3oh_yL+4Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d13f1280-8415-4a24-e72c-08d8f964e3b4
x-ms-traffictypediagnostic: AM5PR0402MB2787:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0402MB2787E4B65EFF486053A6CD78F1759@AM5PR0402MB2787.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FqGSGTkxHSttpLMsoFNGk5WgVyOQhC05AW16dOYJoGfeokoyhEBz65QcSjDNcRWzIY0mTzTE0HpmMjKghVEqRJ76PG+wFJnP0I2RsaXq7P3Xhzl/1O17gCGP7ANCbumIkn07un0/51Zf83ucg6EybuApQgxqCkMsvEhp3eovLyeO5kKjADG89YokJPq1sinuPlBmWlsX2kiQ6AodhI9cMYRsINsy5y2DEY+5oWCOuBEBnDkFybZkvKoQjrZzgTk0mqd+sfVhN8D8w2uN+4O8qT1hgFtjmdIVnz5S+nYWhPZX003VxkUyza0s/1m3XDbDzj2Tf6N2WVhvfXqdaQbfx7lxLQznbacNMhA2UK8FAO0ReevSskOhis4tWwlccF28vcc2OT9SmIJ0ex89uvPJ/qjJlBLNIQFgqernPJN02k+Q+NwhheY+wD3PHSh76wADydlk7q1xshgXNrPbPNQWWVCSH/jhG+unhSNZ2euq1DcjigQcGafY8n+JaSUjaxE6FrigSEuACy0RthJjPpoEGrthfQiqVOpLRrzt4AmAc9K5nM3Vcl1+kmZWlPfxVrALeSd6mwN+FH+OW53zAulmzw5yFinQURhIalyr6yBjCHD1yHarYOHTbbXxagwPgAPpQzQWWQawTXz5ZsAqU1z0SvNVg4kwolkMrqGmLmW/eiY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(346002)(136003)(9686003)(26005)(55016002)(86362001)(38100700001)(8676002)(478600001)(316002)(6636002)(186003)(6862004)(66446008)(71200400001)(54906003)(83380400001)(66556008)(64756008)(76116006)(5660300002)(8936002)(66476007)(52536014)(6506007)(53546011)(66946007)(4326008)(2906002)(7696005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VkhpRmRWMkFuZjRtTFRjU3BTVm9pVU1heXlpeU5aQnpOMTdDbktSUjNwR290?=
 =?utf-8?B?cEJ5ZTFQZURXcm9hM0lvVy8wTm1kMHk5RFVvckpPc3d1MlFyUGRuM2wyT3FP?=
 =?utf-8?B?WE1qaVRxSVVDM2R5dXdQSDM4amxLYUlzT0lDS3hFSFlCSExZelpBejFIRk1z?=
 =?utf-8?B?WTR4d3dGaGN6eEZBZk9oY1ZURnJFU0RCRHM2cmVWdkJxQXZibERpdzdtUXhT?=
 =?utf-8?B?bUt2N0JaNXN4eFlva2phZnNweWJZMGNoZldzT3B0UkFrUC9IUlIwaEgzSzhv?=
 =?utf-8?B?cUQ0cVd1Y2xudFFGZnhEa3FHSFFwdmpwV3NxY1U4OTFWaFNtQlVUSnN6UVd0?=
 =?utf-8?B?Z3IrcjRSMlJSbndlcy9zVjNpdnplU1JnMmJrOVFZeEpwVzljWU9xY2hHL1lS?=
 =?utf-8?B?ZmxmSm02Tk4wRm1BMk5rK1RoQStUcnIycEhSZzJ1eDZaTWFpN2c2Z3pFd0ZR?=
 =?utf-8?B?NVdJTm9XdUdwU2FXQk9rSjFKRTRLV25Na0FmdnkyUUIyelNiNmVXRjJVNHZv?=
 =?utf-8?B?aVVxK2RIODUybDJDVWtLYzJYQUQ2Q21hd3k5c0NxdlJEM2EvTjRuaHFxZ2dH?=
 =?utf-8?B?L0hNQWZWT3dXdis3Z0tobHp3NmxvNzdZN3kvQTNDYytCamc0NUMwRHJtUE5T?=
 =?utf-8?B?NVVpaGJTRzgxdXpUZU9QQ0o1RVV2eGl5eWZUNlM2Y3JsTEtxeUlINTVyWXhV?=
 =?utf-8?B?WXBNMG9uMU1mZXpsa295M0tsY0tBODMvQXZXd2tMM3hBUFJmOFJLVngwd0FK?=
 =?utf-8?B?aDk0R0orNDVMdlhXQ2lwTVBhQlFsY21wTE9qQ1loejc1K3VMcURNZWM2K3Y1?=
 =?utf-8?B?K3NQZ0F3K3dUaFB2aWVDYitKejg0ZkhJWTVrRzRIWTFFMkZXTFdSMHpKUGVU?=
 =?utf-8?B?b0laaUJmM1ZwTEpSSG52SWZVdGRXMm5wKzlnT1ZJb1hLQ2poaVRrNkt1WUJJ?=
 =?utf-8?B?SHZkZGx1QTNVVXpJM2JRRW9WejFjYlZWRjRqN05mUDEvVFJZNGxleHNNZmpI?=
 =?utf-8?B?TFYyL080TkN6SEdFZXI3UTVsaGgzNWJoUWYxY1BaSGJHdXV4Uk5ZL21ndVdM?=
 =?utf-8?B?UW1wR2lHaSt2U0VCc0oxZDdFT3ZKbXg2c3JydXdhS3ZDVDBXdUlXQkV6dGs4?=
 =?utf-8?B?Mmd0QnFXRzhHWHRwNU9Tc3YwMlBEOXNyYWJsNTFWc1JkTTZTcU9BZS9waHZC?=
 =?utf-8?B?T3dGSys1OGVZQ1oyNTJGRFBjZG45cHkzNm9mdWtNWDFzNllxdFdrUUc1b1ZY?=
 =?utf-8?B?N29FYWZPNDBRdE9iVVZtVE43cXUycE13T0VrME9OcVVHbzJ0dWVoUUxFY3lG?=
 =?utf-8?B?aW9wM01BZjU1TEtWUmtlbStNanRqUTV3TzNkdSt3V3d4N08xdmdXU2kreVh4?=
 =?utf-8?B?b243Z2Raand5d2VzNmI1ejNWSEU3ZUFZNWwvMHpjeXhvL0tiaFJXa0trVUli?=
 =?utf-8?B?dHJxT3JldDhYSDRCSDA2SHpJcEczdnNtdXBpZW1ZbW80VFVCYWllTjYrekJr?=
 =?utf-8?B?YTdWMklBQ3c1aWVyMDNkOXgrREh6NGtzS1I5S1EweXIwS00zT000S3ZIeXZE?=
 =?utf-8?B?empkV1lNUFFjeWUzajUxZEZyZ2dwL0lPLzViR2ZLdEZhQjVYSTlyYXNBOEVG?=
 =?utf-8?B?ZW5OalhLOGpyZzlGejVQWWpoclMzY0ZmaHNyVnpnYjFwNTBQNnh5eS93czZp?=
 =?utf-8?B?RXVnV2t3WE9vb0w4aHJyakVEeWkwdFEwTjhKcDVnRUpvTzBaS2psVnFtT2VE?=
 =?utf-8?Q?Jo9TovGSqSg+ZO7zeAf9r0i1v9hsVgh6CLxap8F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13f1280-8415-4a24-e72c-08d8f964e3b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 01:31:38.4505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3BlUQaDBO2loXYUYAhWFpwql+ljIWo6dvfSbUL5w2TQFfp/APAIHFHDjMyiLv8ifQWcpIbHE31n9iJgJFJAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2787
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTGVvLA0KDQpPbiBXZWRuZXNkYXksIEFwcmlsIDcsIDIwMjEgNTo0NSBBTSwgTGkgWWFuZyB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgTWFyIDEyLCAyMDIxIGF0IDI6NTYgQU0gUmFuIFdhbmcgPHJh
bi53YW5nXzFAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZW5nIE1hIDxwZW5nLm1h
QG54cC5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgQUNQSSBzdXBwb3J0IGluIFJD
UE0gZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBNYSA8cGVuZy5tYUBueHAu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJhbiBXYW5nIDxyYW4ud2FuZ18xQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gQ2hhbmdlIGluIHY2Og0KPiA+ICAtIFJlbW92ZSBjb3B5cmlnaHQgdWRwYXRl
IHRvIHJlYmFzZSBvbiBsYXRlc3QgbWFpbmxpbmUNCj4gPg0KPiA+IENoYW5nZSBpbiB2NToNCj4g
PiAgLSBGaXggcGFuaWMgd2hlbiBkZXYtPm9mX25vZGUgaXMgbnVsbA0KPiA+DQo+ID4gQ2hhbmdl
IGluIHY0Og0KPiA+ICAtIE1ha2UgY29tbWl0IHN1YmplY3QgbW9yZSBhY2N1cmF0ZQ0KPiA+ICAt
IFJlbW92ZSB1bnJlbGF0ZWQgbmV3IGJsYW5rIGxpbmUNCj4gPg0KPiA+IENoYW5nZSBpbiB2MzoN
Cj4gPiAgLSBBZGQgI2lmZGVmIENPTkZJR19BQ1BJIGZvciBhY3BpX2RldmljZV9pZA0KPiA+ICAt
IFJlbmFtZSByY3BtX2FjcGlfaW14X2lkcyB0byByY3BtX2FjcGlfaWRzDQo+ID4NCj4gPiBDaGFu
Z2UgaW4gdjI6DQo+ID4gIC0gVXBkYXRlIGFjcGlfZGV2aWNlX2lkIHRvIGZpeCBjb25mbGljdCB3
aXRoIG90aGVyIGRyaXZlcg0KPiA+DQo+ID4gIGRyaXZlcnMvc29jL2ZzbC9yY3BtLmMgfCAxOCAr
KysrKysrKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3Jj
cG0uYyBiL2RyaXZlcnMvc29jL2ZzbC9yY3BtLmMgaW5kZXgNCj4gPiA0YWNlMjhjYWIzMTQuLjdh
YTk5N2I5MzJkMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9mc2wvcmNwbS5jDQo+ID4g
KysrIGIvZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+IEBAIC0xMyw2ICsxMyw3IEBADQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zdXNwZW5kLmg+
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Fj
cGkuaD4NCj4gPg0KPiA+ICAjZGVmaW5lIFJDUE1fV0FLRVVQX0NFTExfTUFYX1NJWkUgICAgICA3
DQo+ID4NCj4gPiBAQCAtNzgsMTAgKzc5LDE0IEBAIHN0YXRpYyBpbnQgcmNwbV9wbV9wcmVwYXJl
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJmc2wscmNwbS13YWtldXAiLCB2YWx1ZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJjcG0tPndha2V1cF9jZWxscyArIDEpOw0KPiA+DQo+ID4gLSAgICAgICAgICAgICAg
IC8qICBXYWtldXAgc291cmNlIHNob3VsZCByZWZlciB0byBjdXJyZW50IHJjcG0gZGV2aWNlICov
DQo+ID4gLSAgICAgICAgICAgICAgIGlmIChyZXQgfHwgKG5wLT5waGFuZGxlICE9IHZhbHVlWzBd
KSkNCj4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsNCj4gPg0KPiA+ICsgICAgICAgICAgICAgICBpZiAoaXNfb2Zfbm9kZShk
ZXYtPmZ3bm9kZSkpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogIFNob3VsZCByZWZl
ciB0byBjdXJyZW50IHJjcG0gZGV2aWNlICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKG5wLT5waGFuZGxlICE9IHZhbHVlWzBdKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7DQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoYXQgd2UgYXNzdW1lIHRo
YXQgaW4gdGhlIEFDUEkgc2NlbmFyaW8gdGhlcmUgd2lsbCBvbmx5IGJlIG9uZSBSQ1BNIGNvbnRy
b2xsZXIgYW5kIGFsbCBkZXZpY2VzIGFyZSBjb250cm9sbGVkIGJ5IHRoaXMgc2luZ2xlDQo+IFBN
IGNvbnRyb2xsZXIuICBUaGlzIHByb2JhYmx5IGlzIHRydWUgZm9yIGFsbCBleGlzdGluZyBTb0Nz
IHdpdGggYSBSQ1BNLiAgQnV0IHNpbmNlIHRoZSBkcml2ZXIgdHJpZWQgdG8gc3VwcG9ydCBtdWx0
aXBsZSBSQ1BNcywgbWF5YmUgd2UNCj4gc2hvdWxkIGNvbnRpbnVlIHRvIHN1cHBvcnQgbXVsdGlw
bGUgUkNQTSBjb250cm9sbGVycyBvciBhdCBsZWFzdCBtZW50aW9uIHRoYXQgaW4gdGhlIGNvbW1l
bnQuDQoNCkhvdyBhYm91dCBhZGRpbmcgc29tZSBjb21tZW50IGFzIGJlbG93Og0KDQovKiBGb3Ig
QUNQSSBtb2RlLCBjdXJyZW50bHkgd2UgYXNzdW1lIHRoZXJlIGlzIG9ubHkgb25lIFJDUE0gY29u
dHJvbGxlciBleGlzdGluZyAqLw0KDQpSZWdhcmRzLA0KUmFuDQoNCj4gDQo+ID4gKw0KPiA+ICAg
ICAgICAgICAgICAgICAvKiBQcm9wZXJ0eSAiI2ZzbCxyY3BtLXdha2V1cC1jZWxscyIgb2YgcmNw
bSBub2RlIGRlZmluZXMgdGhlDQo+ID4gICAgICAgICAgICAgICAgICAqIG51bWJlciBvZiBJUFBE
RVhQQ1IgcmVnaXN0ZXIgY2VsbHMsIGFuZCAiZnNsLHJjcG0td2FrZXVwIg0KPiA+ICAgICAgICAg
ICAgICAgICAgKiBvZiB3YWtldXAgc291cmNlIElQIGNvbnRhaW5zIGFuIGludGVnZXIgYXJyYXk6
DQo+ID4gPHBoYW5kbGUgdG8gQEAgLTE3MiwxMCArMTc3LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gcmNwbV9vZl9tYXRjaFtdID0geyAgfTsgIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIHJjcG1fb2ZfbWF0Y2gpOw0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfQUNQ
SQ0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIHJjcG1fYWNwaV9pZHNb
XSA9IHsNCj4gPiArICAgICAgIHsiTlhQMDAxNSIsfSwNCj4gPiArICAgICAgIHsgfQ0KPiA+ICt9
Ow0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIHJjcG1fYWNwaV9pZHMpOyAjZW5kaWYN
Cj4gPiArDQo+ID4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJjcG1fZHJpdmVyID0g
ew0KPiA+ICAgICAgICAgLmRyaXZlciA9IHsNCj4gPiAgICAgICAgICAgICAgICAgLm5hbWUgPSAi
cmNwbSIsDQo+ID4gICAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IHJjcG1fb2ZfbWF0
Y2gsDQo+ID4gKyAgICAgICAgICAgICAgIC5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIocmNw
bV9hY3BpX2lkcyksDQo+ID4gICAgICAgICAgICAgICAgIC5wbSAgICAgPSAmcmNwbV9wbV9vcHMs
DQo+ID4gICAgICAgICB9LA0KPiA+ICAgICAgICAgLnByb2JlID0gcmNwbV9wcm9iZSwNCj4gPiAt
LQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
