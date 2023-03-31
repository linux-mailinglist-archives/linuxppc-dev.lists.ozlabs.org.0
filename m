Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A08956D2296
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp2gl493nz3fV7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 01:27:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=LqyenJBV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bang-olufsen.dk (client-ip=2a01:111:f400:fe12::712; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=emas@bang-olufsen.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=LqyenJBV;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp2fq4hRlz3chB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 01:26:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROas6I41sppQVF4EwiotjQzkC9pd/HTVXhCTDuwaHPYwW8q+17c0O1N8QngUuQrARhwPp0pCaSlbJuyYbl5HPAguuAz9/414DcEag8jCMswh/Sr1tSNevwOUf+6OjmyPkgSozFPGVeDCx4pbLjd1iHjrJY2B4u1bBMp9x4ApUOqPdAqQq2AMXI60w1e4HrWlkyU+Ekw4Voy9RON88/N3VIIzjxCZKK1hjEAYOX6ptdjK0QR6LPSXp3HdiOAYKnKwFgwi7PnmRf2ZYzcWzxCgC0IBpf6YUEcKE8qoISj1HY/mD5WVSCmlzx5Ri/WqF2FG1EBxMt2/A/haF9juJe5fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB0QCT90V6H2G9bzJMrRso10v4BM728EbTXbOGFzOgM=;
 b=eDFchTWxcN4nFiV0IUYfpyOHwbqqkiOA8rm0KeClzUOFjylS5EnImQtMJVtl7GK9QqaefeUbXJjKLwn9R6P22PL06+I2OwqrOonJPi0adejkkyWTeQTpSeAh5RJcYQVKdZ+VIUwXsNansJLFnr8oxHBEQ+YHQt10z0IfLzZvJvYIHWf6AmRU+5r4p6BRp5LLN9k7h7LfcN5KwguIq4SU0ZZ669B9y4G2fCg2NAFur9m5FUaSDUY8nmszWHulOLe0lqmpCgLDvP62oOK7pJ8ENN4Rm7LMGx3yPOv8tHXAZ8EBK2SZ9UDicUr1z6CI4TDoHdFA3eEVxWdqKWnDuDfPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB0QCT90V6H2G9bzJMrRso10v4BM728EbTXbOGFzOgM=;
 b=LqyenJBVQ3H/ynHjqK9CyNLoMhHxz2OaLyWEg2K92iJbBEfnYJj6/03Kzg0L2iBnR5rhbeIPX9uWKhdWlZWxlGkGMZVJ0Pm8cpN0sghhEyOZV/yKZUZVzF4letiLyMf2eaY9nFp+Hr5mcNag3ykQj7sJ9iBCfk2v23X14kp5IhU=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS4PR03MB8153.eurprd03.prod.outlook.com (2603:10a6:20b:4e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 14:26:33 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871%3]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 14:26:33 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Topic: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Index: AQHZYuHxlyQcfrXAUkmKoqNtMdKqs68UMreAgADA14A=
Date: Fri, 31 Mar 2023 14:26:33 +0000
Message-ID: <20230331142537.1399524-1-emas@bang-olufsen.dk>
References:  <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
In-Reply-To:  <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS4PR03MB8153:EE_
x-ms-office365-filtering-correlation-id: ef4219ed-c3ba-47ea-23cd-08db31f3ed70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jTE7dNOpY4GWFfNQgHVTXL8AbVYsul9eEGovrros9vR5pyMmuObmsCQckw6+9sl3WTYJd46yxcapGi9XV61Hym2vnFmOQyt9bi6iIue9GEcr4KiHvcQ3CSmpsiaXYWyAS0eDFr2X9OYVjqYtdDnyAEuLLf0oWEdrYbzUGVTTgMoFwKZu18CUVraxxh+nMb/psoxm+8Fa1v4sYd4FasOzi5LEIdsd/VqsE84L78ilUKEb9EFLbkANR8B0aqkp0wiLbfok+D42Mgb3JHdOBec3ThVdVwTF8zO+4D/6qnM2zrofMtz+pW0KMmYWhs7lOMZTP0oc6IF887ZhJ0rJrRZ8qVJ8lahRGQgFk9odeB5lZ10LcAXe/PBhgWHCkNP0GxZNL5fvgmZkQnmEswkGXWQxFZpALQKlndLGeOT8THDBDGHb5VNrmYraBhazjfpO8ohS73eIZN93J+Lvtp0hz5CsdKWH5V/kirfJd44O8dDOAUeACk2i2aWFyeM3GAjSebT/HLh7G9a4sozpsyICApkC/sIH+n81qbN5+b0yC/4sMdySMkcE241wEhd2wWhOBvlaOMVfJumd6IenbKs31DCVpU5wGDrGEcBPG61dSfLcD1AmfGbw8Q7vp4UCmbPIrTXY
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(4326008)(76116006)(6916009)(91956017)(6486002)(8676002)(54906003)(66446008)(66946007)(66476007)(66556008)(64756008)(316002)(36756003)(26005)(53546011)(6512007)(1076003)(6506007)(38100700002)(2616005)(122000001)(186003)(83380400001)(2906002)(41300700001)(5660300002)(8936002)(8976002)(478600001)(71200400001)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VENTamJpZWg4ZkRPQXZucFdDTGs1TXBRalRyNFhxRGFNd2FRNjA0NUFxK1ZB?=
 =?utf-8?B?OEw3RjJJWUJMM2xpa1I3c3puTHhwV3NjK2dmR040c0hjOFNiYkdoeGxCQmVy?=
 =?utf-8?B?aEdDMmc1Q1REdEEvakZSMnR2WlBmdFVEOC9CZTIyK3ZFSXRTbVdRWnRZKzVX?=
 =?utf-8?B?RG1XdDc5bjFoVjBuT0l4U1pJSlJ1Ui9qeEt5aytLS050djc1eERKQU1UUjRi?=
 =?utf-8?B?eE1PWGtBTTRqMUhobjlrd3FWNy9mRWRNTjJhcjhVTUdKQmRXREFwLzJpclQ4?=
 =?utf-8?B?Qmw2MlZDR0gyWldBSjVYMGNrM2RqZmFkRWZCRjBITGRMMm1FUnBvYW4vRjZH?=
 =?utf-8?B?U3ZTRzV5TDVQeFdQQkdhQW1xdm40QzBqZG04S1MybEZiUFBzdEkwYzVHNy9M?=
 =?utf-8?B?eXhwMkhsOUluUytKTjdNekdGWGRsWnd3djVhUWFJSldTWlVJc0lhakpLYTht?=
 =?utf-8?B?RG5PR0E0OXozbHh0WkFSUmlDYSthUDNlMDhVOTBzWUJNWnEwZWd3c2FJdTZl?=
 =?utf-8?B?SkNjdnRRbFp3RVlreDQvTDZLa2xnQ2dJLzN5YkRyaTNlQ1VMZy93TEFSdXp1?=
 =?utf-8?B?QzYvb2srQmhQTGNCTm1rQlprdE9jSk5RNHAxME5jM2cxa0RONTNDY1ByeHo1?=
 =?utf-8?B?eXFmZjNVbG0xVmxVakVqK0d3V2Z4U1BvUkdPZ3VZU0dGd3kxU0oyUXI5ZzNZ?=
 =?utf-8?B?MHpnb1ZTVW9vZFhEejNxcGtYL215YUJBYkhLUmh2a0Q5ZzdvdnJtWVFLTHRo?=
 =?utf-8?B?V2lQTXBaMVoxamxSUVh3V1YyZ2ttSURxTU9nb3BTaDJYNEoydHhXT1Fqekor?=
 =?utf-8?B?T0wzcUxndSswdHExVER0ODRZSGRVQnlJRWJQZkRxT2JleW5JWDhpdGl6T2dH?=
 =?utf-8?B?bkJzUkk2a1VFQ3J1c2dZdStaT2FxVmo4UmJ0R2ZBWGdzd0JSNzV3aGtHZ3Vl?=
 =?utf-8?B?bHhrZ0RGQ0w1Q2pDUkpMRURnT2xwaTZBcW9YVE5IMythc3ZXWWw0STlVYi9C?=
 =?utf-8?B?K3BlL2E3K0ZlZDlMZFVSZ2Mxeng3VEJGbWtkVlJNWm5PUUpHMGl6cUVYb2NH?=
 =?utf-8?B?VzU4NUQxRHZDVUUvOUFOK2Q1WnY1cmF6aEJpMm4vUGNGVWthUUtEdS9VTHZN?=
 =?utf-8?B?ZTZSRjVoRnE0dTl0OFM1MlhiQ0lqMGlxTjNtSUZITERZTEkzVzZEUk4wcEdx?=
 =?utf-8?B?WVBjclNpMW8wSDMxSGdXZDR5VzV2ZGlsdksyWjUvbjYrc2hyaktsWUEzU1Zu?=
 =?utf-8?B?bmJ1blFsUW9xTkE1S0hmNkV6U1I3c2FQSXRoU2VGQkRoc3hoYStHZytGbjRm?=
 =?utf-8?B?ckFLMWN4dkVVQWJqbDBzK0xRdWJIc0M2elk1UlJCQU9zV1I1UW94TzB2K2NP?=
 =?utf-8?B?NWtrOGVvbGZGaHJIdFd6T05peGFGRWlGNEppZ2MzRHMzVDg5U3BRdGFJWXhP?=
 =?utf-8?B?S1hXRVpRRHFIcmFOenNkdmlJN3NoR1N2R0QxUUViTVUzOWhLWE9KbDRyRFVh?=
 =?utf-8?B?djU3NnhrTktRcHVRT21EK0RlUWlrR21Wb0pLNkgycWJzaDBQQTFQWlF3QVlv?=
 =?utf-8?B?K0k3dzBycHRSMWYwQW42ajFhT3U1dzlLTTJJMjNGeG1PU2pkcGpWMFpxWFJo?=
 =?utf-8?B?VlBEU0tVNDQ1TFRvOFVMTU5aL3MxRnRCOVJwcDBnYTZNeWV2enRjYm03c1hQ?=
 =?utf-8?B?OUhhM0ZBVEQvdXM2WmZGQnE2c1NKQlBCTExQQjM5Q1B3Y1ZjL1NaNnNDR0px?=
 =?utf-8?B?MFZoOXNZdWJHTXNYL0RuaVk5SWZXT2VOQUJFaERjTm1HNFlKNWQ3cUd5UnBq?=
 =?utf-8?B?MmJmZ3hHWFRtY2FEN1ljU1ZmamhTRng1ZWV3R3g0LzU3ay9yYXI2MnR1eHBG?=
 =?utf-8?B?cVlzNUtTSmRwSkNTamRva0F1VVk5NnppdWszSGJSU2FqeG9UTlFsN3AxSW1X?=
 =?utf-8?B?bWhSZUl4RTZFNlNWY3VNcytZUVpmL2xUQ0RZcnA5SU03VksyOXBtWFMvNjFO?=
 =?utf-8?B?SlNBQ21Md1hXaURoZUhmMkx1TU9QL29ma2dVcXRrQTdMbE1INVJ5cEcvN1Iw?=
 =?utf-8?B?Sk9VcUgzZldJUkxPMDBqT3FycklSS21tclFHRmtrR29ZSGlVZ3ZkSjQ5QmIz?=
 =?utf-8?B?MDdXTFg2WnluMElQUDlZMExiQWtQcW5RcXZDL1hGYk13d3JLd0lDdG1NUVdG?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3221514765C9F3429B63D590448ED0AF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4219ed-c3ba-47ea-23cd-08db31f3ed70
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 14:26:33.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtANYyHWm1Kvo11wkWdlDIMOop0tJWT31ooxZzksmsQ8k7+IHgqikZwHU8xZ0yY5p2wDkR3IrPu/O2e5XQ9Ezg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8153
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMy8zMS8yMyAwNDo1NSwgU2hlbmdqaXUgV2FuZyB3cm90ZToNCj4gT24gVGh1LCBNYXIgMzAs
IDIwMjMgYXQgNDozMOKAr1BNIEVtaWwgQWJpbGRnYWFyZCBTdmVuZHNlbiA8DQo+IEVNQVNAYmFu
Zy1vbHVmc2VuLmRrPiB3cm90ZToNCj4gDQo+PiBTbG90IHdpZHRoIHNob3VsZCBmb2xsb3cgdGhl
IHBoeXNpY2FsIHdpZHRoIG9mIHRoZSBmb3JtYXQgaW5zdGVhZCBvZiB0aGUNCj4+IGRhdGEgd2lk
dGguDQo+Pg0KPj4gVGhpcyBpcyBuZWVkZWQgZm9yIGZvcm1hdHMgbGlrZSBTTkRSVl9QQ01fRk1U
QklUX1MyNF9MRSB3aGVyZSBwaHlzaWNhbA0KPj4gd2lkdGggaXMgMzIgYW5kIGRhdGEgd2lkdGgg
aXMgMjQuIEJ5IHVzaW5nIHRoZSBwaHlzaWNhbCB3aWR0aCwgZGF0YQ0KPj4gd29uJ3QgZ2V0IG1p
c2FsaWduZWQuDQo+IA0KPiANCj4gVGhlcmUgYXJlIGRpZmZlcmVudCByZXF1aXJlbWVudHMgZm9y
IHRoaXMgc2xvdCB3aWR0aC4gU29tZSBuZWVkIHBoeXNpY2FsDQo+IHdpZHRoLA0KPiBTb21lIG5l
ZWQgZm9ybWF0IHdpZHRoLiBXZSBuZWVkIHRvIGJlIGNhcmVmdWwgYWJvdXQgY2hhbmdlIGhlcmUu
DQoNCkkgbWlnaHQgYmUgd3JvbmcgYnV0IHNob3VsZG4ndCBwaHlzaWNhbCB3aWR0aCBhbHdheXMg
Y29ycmVzcG9uZCB0byB3aGF0DQpjYW4gYmUgcGh5c2ljYWxseSBtZWFzdXJlZC4gSWYgeW91IG5l
ZWQgdGhlIHNsb3Qgd2lkdGgsIHRoZSBzYW1lIGFzDQpmb3JtYXQgd2lkdGggeW91IHVzZSBhIGZv
cm1hdCB3aXRoIG1hdGNoaW5nIHdpZHRocyBsaWtlDQpTTkRSVl9QQ01fRk9STUFUX1MyNF8zTEU/
DQoNCj4gDQo+IEFjdHVhbGx5IHRoZXJlIGlzIC5zZXRfdGRtX3Nsb3QgQVBJIGZvciBzbG90IHNw
ZWNpZmljIHNldHRpbmcsIHBsZWFzZSB1c2UNCj4gdGhpcyBBUEkuDQoNCkJ1dCBpZiB5b3UncmUg
dXNpbmcgdGhlIGdlbmVyaWMgc291bmQgY2FyZHMuIFlvdSBuZWVkIHRvIGFkZCBpdCB0byB0aGUN
CkRUUy4gVGh1cywgaWYgeW91IHdhbnQgYSBzdGF0aWMgVERNIHNsb3Qgd2lkdGgsIGFsbCBpcyBm
aW5lLiBCdXQgaWYgeW91DQp3YW50IHRvIGNoYW5nZSBzbG90IHdpZHRoIHJ1bnRpbWUgdGhlbiBp
dCBpc24ndCBlbm91Z2guDQpVbmxlc3MgSSBtaXNzZWQgc29tZXRoaW5nLg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpFbWlsIFN2ZW5kc2VuIA0KDQo+IA0KPiBiZXN0IHJlZ2FyZHMNCj4gd2FuZyBzaGVuZ2pp
dQ0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFN2ZW5kc2VuIDxlbWFzQGJhbmctb2x1
ZnNlbi5kaz4NCj4+IC0tLQ0KPj4gIHNvdW5kL3NvYy9mc2wvZnNsX3NhaS5jIHwgMiArLQ0KPj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYyBiL3NvdW5kL3NvYy9mc2wvZnNsX3Nh
aS5jDQo+PiBpbmRleCA5MzljNmJkZDIyYzQuLjIxM2UyZDQ2MjA3NiAxMDA2NDQNCj4+IC0tLSBh
L3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+PiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWku
Yw0KPj4gQEAgLTUxOSwxMyArNTE5LDEzIEBAIHN0YXRpYyBpbnQgZnNsX3NhaV9od19wYXJhbXMo
c3RydWN0DQo+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPj4gICAgICAgICB1bnNp
Z25lZCBpbnQgY2hhbm5lbHMgPSBwYXJhbXNfY2hhbm5lbHMocGFyYW1zKTsNCj4+ICAgICAgICAg
c3RydWN0IHNuZF9kbWFlbmdpbmVfZGFpX2RtYV9kYXRhICpkbWFfcGFyYW1zOw0KPj4gICAgICAg
ICBzdHJ1Y3QgZnNsX3NhaV9kbF9jZmcgKmRsX2NmZyA9IHNhaS0+ZGxfY2ZnOw0KPj4gKyAgICAg
ICB1MzIgc2xvdF93aWR0aCA9IHBhcmFtc19waHlzaWNhbF93aWR0aChwYXJhbXMpOw0KPj4gICAg
ICAgICB1MzIgd29yZF93aWR0aCA9IHBhcmFtc193aWR0aChwYXJhbXMpOw0KPj4gICAgICAgICBp
bnQgdHJjZV9tYXNrID0gMCwgZGxfY2ZnX2lkeCA9IDA7DQo+PiAgICAgICAgIGludCBkbF9jZmdf
Y250ID0gc2FpLT5kbF9jZmdfY250Ow0KPj4gICAgICAgICB1MzIgZGxfdHlwZSA9IEZTTF9TQUlf
RExfSTJTOw0KPj4gICAgICAgICB1MzIgdmFsX2NyNCA9IDAsIHZhbF9jcjUgPSAwOw0KPj4gICAg
ICAgICB1MzIgc2xvdHMgPSAoY2hhbm5lbHMgPT0gMSkgPyAyIDogY2hhbm5lbHM7DQo+PiAtICAg
ICAgIHUzMiBzbG90X3dpZHRoID0gd29yZF93aWR0aDsNCj4+ICAgICAgICAgaW50IGFkaXIgPSB0
eCA/IFJYIDogVFg7DQo+PiAgICAgICAgIHUzMiBwaW5zLCBiY2xrOw0KPj4gICAgICAgICB1MzIg
d2F0ZXJtYXJrOw0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4gDQoNCg==
