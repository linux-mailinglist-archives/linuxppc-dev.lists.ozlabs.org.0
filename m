Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C832C8F72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:53:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHWf10wRzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.7.128;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=UCY697iW; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70128.outbound.protection.outlook.com [40.107.7.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClG6y1TWkzDqng
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 06:50:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzOXaVPMflNWn/6PqjkV6hHVRg+BTjyVAXU6Tx33TQwvUmfiwGqtoRYKA1AFPVJW0tyCTiJe5UYbDfjyqLuyPbFJ/gUh0rdBJaokCulZ36HJH4KCO2hDfMI8SnDZtAvEzWHm+apqJxuAUeZRg7FSx+tDZ3CjO7ZXzLl1JLg2TO2UAI3w4yzZDt0P3Ow+Bm/C7kyzqmuuVfOrpgbFSV/TFOaDJ9+43Vu6O5BeMR1pQoqT4szTCC/W2FddZflhFWcsX5uwgmxRkaJk73THp7dpQGEy0TlTYbFYKY8okIMytnjOiwmrpEQIW1Vyw32Vm6fh87A6XFZqJMab16TfXjbQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rfx4T3Rcm8aYEBJpww5cMhrOGEcA3q+9v7m0vKO3qk=;
 b=Q4I+8NiN5yNjLj0i6OUFqOhKHcmCH9/YqhP22Rebo2B3SwaUjtOi9CsUiyk6xYgH02cpmEivAhsfRUUOv/vpnPgZOIRgVazkN6YoEfOFVA2Xv5exX0m6bVHB6KxnnZsPb6dN7nfCKCuWoG31sRRexyzWyNczHsD4WNBFK7wo6J+lfJIA793YQl66uyQ4BuYR98fbP1Iwc8MMWq/3Kw/83s2LrRERvVOJzBUcqCo/FLvMa21PPxUc+3cLtmVPLkrzjHkEQKrKwNQY7otjb3V7DdzWGx3cfXjwd0++KK0dn9yHLfmAcQcKiP43FYe4g5z6vb8pxaqF+rzZnRErhBex+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rfx4T3Rcm8aYEBJpww5cMhrOGEcA3q+9v7m0vKO3qk=;
 b=UCY697iWB+EZykxCpZiGh6M/RExYkOEs/ILXXm41jay2+KN/xDe9BgeEdPyHzyeReiGT18ZVADipLFZr0p3gqBeojGhKiOoqnh4tTEo13oR4FmVu5UNbPwy5Sxo+0dpw8zlP1HQ9s9lbwGylW5elT7eLyactvVxDDgjsRosfZlw=
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com (2603:10a6:20b:37::25)
 by AM6PR0602MB3384.eurprd06.prod.outlook.com (2603:10a6:209:a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 19:50:25 +0000
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6]) by AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 19:50:25 +0000
From: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Thread-Topic: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Thread-Index: AQHWx0nyrvG/8Bze9k2IWWGibqXRnanhE2IA
Date: Mon, 30 Nov 2020 19:50:25 +0000
Message-ID: <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
In-Reply-To: <20201130185227.GA29434@kozik-lap>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=leica-geosystems.com;
x-originating-ip: [146.185.2.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3897de71-be4b-410b-351b-08d895692e83
x-ms-traffictypediagnostic: AM6PR0602MB3384:
x-microsoft-antispam-prvs: <AM6PR0602MB338422CE16DA64CECD5E3D3AA6F50@AM6PR0602MB3384.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GeI5ZSgfJUX54gDT9jBKqjvY/GfDC4HgJLK/vNIlQk1U0NnwDcvfje25gr3aSG9YV7TTNFEnYGefduSkYgAImTe1acptfcDjgPUM2GV5zQ4+b91jEL6lyjkx/FXEt/JEwOel3hzh9c5+lB49t0D4D9M21YSR9VYgzr9JoevtINsg1amU5BG8Saom8UZkuq3FnO0EuZi7HEx1FfDCxmtiEIDolTy2ZP53H0pk4dTYyXJsNX9tLwQ6pZZyeqs6Xi4fsTK2XW2vuTfc4j+geTL+HzmHsORNziIPVSsFaRb0xCZLZ5Kfu1/aKJyegNAxLu9uiLHfIMA3kKNVpfEWr2/cOHMFzEuCQsO2wwquTnHMEYUqXXquEm5hzjnu3Q+aFMZ1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR06MB4691.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(55016002)(9686003)(33656002)(71200400001)(4326008)(316002)(83380400001)(6916009)(6506007)(7416002)(26005)(2906002)(53546011)(7406005)(7696005)(86362001)(45080400002)(8676002)(52536014)(66476007)(76116006)(478600001)(66446008)(66556008)(64756008)(186003)(66946007)(8936002)(54906003)(5660300002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NlpTK3ZNZ01sNUk5NkxuTFNYTHBGeE1LZjBUVHdidnhUUk5YLzhZVWNVNUZn?=
 =?utf-8?B?SGhJVWNwM0JIQVNaZ0l1dkZOR21DSEhIbGRVWTJiRWRnajVxelNCRkx6VjE3?=
 =?utf-8?B?M0tKRzZPYkhMaG5LL2RYTFlXZ3h3YTZuQ2x1eFFPenRMQjROcERhQk5YQW9I?=
 =?utf-8?B?SmdNYkV5dEw3UnJaaTBLVkZTT3BCL085YVE4T3BxalFZVktUUTdSK0cwR0FE?=
 =?utf-8?B?WkhlZG0yT0U2dmprZGk3VzRXelZEWmZSUHg5empTZ2wycFY0NXNlcVB5Rkl4?=
 =?utf-8?B?RnUxTVc0YXhuWWgrdXp2cGpLMFNUbytCWmxFbDZCTXd2M1BiTjM2czBNS1pM?=
 =?utf-8?B?d2FucXhzV2s2OS91dlU0RnZjeC9OdlhWWnhvU0x0MVZpbTJUcERZYkVYdmt2?=
 =?utf-8?B?dGNwWlFtc3N1R3VMT0xxNzJnUDAvNzVmd1JyMVN0QlNhYjhQYkpEdldCWUpO?=
 =?utf-8?B?RUk4NkxDNWNDT0x2cDZRT3ZFVUwyTHZSeDc4NktlbkxKT2ZHYkhGOGF5ZU5R?=
 =?utf-8?B?a05NRWpseTZTNUF5MGxudjNsb3dFYStDUEQ2MXlOL3BQcU1SL1ZGN1pFbGVK?=
 =?utf-8?B?WXBwYTYyczMzV09rNjBJcmlVMXhpN0lhNmlmbEp1R1BkZzFNalBSbzI3QnVJ?=
 =?utf-8?B?ZUdZcFU4aWg4aTBpZFJBQjlFeEI2ZWVrejRjZkREaUNKRW5KaXIrUk9qRTFx?=
 =?utf-8?B?dVQ5bHN1NUFkWGcyOVlrQTN4ejRsSFNNejdzaVpTWFFmUjMyeVdrMUtuOGlI?=
 =?utf-8?B?NnhkOVErcVBKWk9CZ0NmZWl5TmxoeEluQ3dlcHI3cmtqMDQrdWJ1UjZ3VFhX?=
 =?utf-8?B?V21IeE1pTDRoR2NSM0FPMktTOFZra1V4aFNGNWtMWTcvUmNySnZpeThHY1VK?=
 =?utf-8?B?NEh3SGp1bUY0R2R0Qk9HbnMwR1cwTXJKQWpPYUo1eFlqRnpVZEtvOUJzNFBQ?=
 =?utf-8?B?SjRudVp6dVhLc2RucGtySHB1clRXZjlhbUVMeFErNW5SMGllWTlZN3RTMktX?=
 =?utf-8?B?NHVZdFViK1ZBclBTWXl5K21QQ2VxUTNUL0Vlc0dXT3htNnhmRjdHbW9Sd1Js?=
 =?utf-8?B?TlphNWhteTNMMDVqdC9hRXZZSTFSUGdkVUdLQ1NpNDJVNllsdDJsNmc5VGho?=
 =?utf-8?B?MHE1VDdITUtRTW9XUUkveHVnazhQQUcwd3RjMy8ybHVFdmdZUjNmbzRMWC9V?=
 =?utf-8?B?VVNaOVR0dkV3NWJiSUxZOEE1dVovQ3BBN3dTdVR1NWRTcldreWVid21WSGZN?=
 =?utf-8?B?ZUZhM2ZWaVVPSS80OVY2blRWcDBoRWhEMTdxaVU5V2R3NHMyd0Z3cUVWZ1Bp?=
 =?utf-8?Q?zoBA1YPYmgw90=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB4691.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3897de71-be4b-410b-351b-08d895692e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 19:50:25.5861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7fa2zRY2zdPNPOsPfKjgGmoQAd0ge1pO8+1QpKOZbhV12LVYLF6D7POLEkdFcFcMdOOlMtTCfrKRz17Db5KibbHgmrFAagW5tR+1ErDuMcTcF7HQSme/fa76g1+WWgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3384
X-Mailman-Approved-At: Tue, 01 Dec 2020 07:36:05 +1100
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "paulus@samba.org" <paulus@samba.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "deller@gmx.de" <deller@gmx.de>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "will@kernel.org" <will@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBO
b3ZlbWJlciAzMCwgMjAyMCA3OjUyIFBNDQo+IFRvOiBaSElaSElLSU4gQW5kcmV5IDxhbmRyZXku
emhpemhpa2luQGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiBDYzogbGludXhAYXJtbGludXgub3Jn
LnVrOyBuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb207DQo+IGFsZXhhbmRyZS5iZWxsb25pQGJv
b3RsaW4uY29tOyBsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOw0KPiB0b255QGF0b21p
ZGUuY29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7IHdlbnNAY3NpZS5vcmc7DQo+IGplcm5lai5za3Jh
YmVjQHNpb2wubmV0OyB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb207IGpvbmF0aGFuaEBudmlkaWEu
Y29tOw0KPiBjYXRhbGluLm1hcmluYXNAYXJtLmNvbTsgd2lsbEBrZXJuZWwub3JnOyB0c2JvZ2Vu
ZEBhbHBoYS5mcmFua2VuLmRlOw0KPiBKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAu
Y29tOyBkZWxsZXJAZ214LmRlOw0KPiBtcGVAZWxsZXJtYW4uaWQuYXU7IGJlbmhAa2VybmVsLmNy
YXNoaW5nLm9yZzsgcGF1bHVzQHNhbWJhLm9yZzsNCj4gbGVlLmpvbmVzQGxpbmFyby5vcmc7IHNh
bUByYXZuYm9yZy5vcmc7IGVtaWwubC52ZWxpa292QGdtYWlsLmNvbTsNCj4gZGFuaWVsLnRob21w
c29uQGxpbmFyby5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0NCj4gdGVncmFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1taXBzQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtDQo+IHBhcmlzY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0
cy5vemxhYnMub3JnOyBBcm5kIEJlcmdtYW5uDQo+IDxhcm5kQGFybmRiLmRlPjsgT2xvZiBKb2hh
bnNzb24gPG9sb2ZAbGl4b20ubmV0Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gQVJNOiBj
b25maWdzOiBkcm9wIHVudXNlZCBCQUNLTElHSFRfR0VORVJJQw0KPiBvcHRpb24NCj4gDQo+IFRo
aXMgZW1haWwgaXMgbm90IGZyb20gSGV4YWdvbuKAmXMgT2ZmaWNlIDM2NSBpbnN0YW5jZS4gUGxl
YXNlIGJlIGNhcmVmdWwgd2hpbGUNCj4gY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcgYXR0YWNobWVu
dHMsIG9yIHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuDQo+IA0KPiANCj4gT24gTW9uLCBOb3YgMzAs
IDIwMjAgYXQgMDM6MjE6MzNQTSArMDAwMCwgQW5kcmV5IFpoaXpoaWtpbiB3cm90ZToNCj4gPiBD
b21taXQgN2VjZGVhNGEwMjI2ICgiYmFja2xpZ2h0OiBnZW5lcmljX2JsOiBSZW1vdmUgdGhpcyBk
cml2ZXIgYXMgaXQNCj4gPiBpcw0KPiA+IHVudXNlZCIpIHJlbW92ZWQgZ2VlbnJpY19ibCBkcml2
ZXIgZnJvbSB0aGUgdHJlZSwgdG9nZXRoZXIgd2l0aA0KPiA+IGNvcnJlc3BvbmRpbmcgY29uZmln
IG9wdGlvbi4NCj4gPg0KPiA+IFJlbW92ZSBCQUNLTElHSFRfR0VORVJJQyBjb25maWcgaXRlbSBm
cm9tIGFsbCBBUk0gY29uZmlndXJhdGlvbnMuDQo+ID4NCj4gPiBGaXhlczogN2VjZGVhNGEwMjI2
ICgiYmFja2xpZ2h0OiBnZW5lcmljX2JsOiBSZW1vdmUgdGhpcyBkcml2ZXIgYXMgaXQNCj4gPiBp
cyB1bnVzZWQiKQ0KPiA+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IFpoaXpoaWtpbg0KPiA+IDxhbmRyZXkuemhpemhpa2luQGxl
aWNhLWdlb3N5c3RlbXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL2F0OTFf
ZHRfZGVmY29uZmlnICAgICAgICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL2NtX3gzMDBf
ZGVmY29uZmlnICAgICAgICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL2NvbGlicmlfcHhh
MzAwX2RlZmNvbmZpZyB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL2pvcm5hZGE3MjBfZGVm
Y29uZmlnICAgICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL21hZ2ljaWFuX2RlZmNvbmZp
ZyAgICAgICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL21pbmkyNDQwX2RlZmNvbmZpZyAg
ICAgICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL29tYXAycGx1c19kZWZjb25maWcgICAg
ICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL3B4YTN4eF9kZWZjb25maWcgICAgICAgICB8
IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnICAgICAgICAgICB8IDEg
LQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL3NhbWE1X2RlZmNvbmZpZyAgICAgICAgICB8IDEgLQ0K
PiA+ICBhcmNoL2FybS9jb25maWdzL3N1bnhpX2RlZmNvbmZpZyAgICAgICAgICB8IDEgLQ0KPiA+
ICBhcmNoL2FybS9jb25maWdzL3RlZ3JhX2RlZmNvbmZpZyAgICAgICAgICB8IDEgLQ0KPiA+ICBh
cmNoL2FybS9jb25maWdzL3U4NTAwX2RlZmNvbmZpZyAgICAgICAgICB8IDEgLQ0KPiA+ICAxMyBm
aWxlcyBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IFlvdSBuZWVkIHRvIHNlbmQgaXQg
dG8gYXJtLXNvYyBtYWludGFpbmVycywgb3RoZXJ3aXNlIG5vIG9uZSBtaWdodCBmZWVsDQo+IHJl
c3BvbnNpYmxlIGVub3VnaCB0byBwaWNrIGl0IHVwLg0KDQpHb29kIHBvaW50LCB0aGFua3MgYSBs
b3QhDQoNCkkgd2FzIG5vdCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IHRoZXJlIGlzIGEgc2VwYXJh
dGUgTUwgdGhhdCBzaG91bGQgcmVjZWl2ZSBwYXRjaGVzIHRhcmdldGVkIEFSTSBTT0NzLiBDYW4g
eW91IChvciBhbnlvbmUgZWxzZSkgcGxlYXNlIHNoYXJlIGl0LCBzbyBJIGNhbiByZS1zZW5kIGl0
IHRoZXJlIGFzIHdlbGw/DQoNCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gDQo+ICtDQyBBcm5kIGFuZCBPbG9mLA0KPiANCj4gRGVhciBBcm5k
IGFuZCBPbG9mLA0KPiANCj4gTWF5YmUgaXQgaXMgd29ydGggdG8gYWRkIGFybS1zb2MgZW50cnkg
dG8gdGhlIE1BSU5UQUlORVJTIGZpbGU/DQo+IE90aGVyd2lzZSBob3cgb25lIGNvdWxkIGdldCB5
b3VyIGVtYWlsIGFkZHJlc3M/IE5vdCBtZW50aW9uaW5nIHRoZQ0KPiBzZWNyZXQtc29jIGFkZHJl
c3MuIDopDQoNCiJzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC0tbm8tZ2l0LWZhbGxiYWNrIC0t
bm8tbXVsdGlsaW5lIC0tbm8tcm9sZXN0YXRzIC0tbm8tbiAtLXNlcGFyYXRvciAsICIgYWNyb3Nz
IGVudGlyZSBzZXJpZXMgZ2F2ZSBvbmx5IHRoZSBsaXN0IG9mIGFkZHJlc3NlcyB0aGF0IEkndmUg
aW5jbHVkZWQgaW4gdGhlIHNlcmllcyBpdHNlbGYuIElmIEkgd291bGQgYmUgZ2l2ZW4gYSBhcm0t
c29jIG1haWxpbmcgbGlzdCBhcyBvdXRwdXQgb2YgdGhlIHNjcmlwdCAtIEkgd291bGQndmUgaW5j
bHVkZWQgaXQgYXMgd2VsbC4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
UmVnYXJkcywNCkFuZHJleQ0K
