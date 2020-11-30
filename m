Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A56362C8F7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:55:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHYl64LNzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.6.92;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=MaHvElaO; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60092.outbound.protection.outlook.com [40.107.6.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClGFn2trszDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 06:56:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLMfzGHuxOn5o9oM4YJa3jXFq9ELMjVQitkM2685ou8604CzRimDJzDE3KFDcLkVadht7VJdtFdU3fzcKIW3Gc5/j6hSYx7o0MZCNO2qI0fFYVBe/PInJn+qXgRIdEEms7cOfxIg+26pEspJRp346cgZBNCpdD1jABviwabPLyXueOIdoGQe72UVf622fVLG0/3zIygCxxgMHVPP5KhuwUUwIgx6WEtSthw4shdYC3rFjBhinL2ooOfB3LYUCrAv4D78vW7sUPZJJ5EQhDUYfq1civ6BrRHgneOW/puVHB7mrJDVHsYVCeEYqyZOqEUrZT3HR7hivNrFyEUV4XHEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A78VugkOTTnzeNaYAqQxwrLsF9uKh/sVxRzDgzyqCmE=;
 b=aPlFnG5vLvdHdlDVxSDNU11BG5FhdSK8U/eyaO0CVc+IQB2Cdx015hpaKUcuNZOXYRBW5B6nolchYTtP8ONqYJZbcliYQJyEKxhwvSvBHVF8vhBZ0Z2nXmYno1ci7CoQR7lDM+IFtqO1VNZNIX4cVx9VBcH+Ay20xssYaFIBmyCJTPBJ/yIdIw78Q/+F2tDcLWrMgL/CL0UiVvH7Rdt89fBQfE9mwjAaGMGUq58p5bRiQHm7f3EUqrhmOcm00Jld9dMUL+2UGe+TXcUB6/xJsOrFgFgbAOdq8+VeMyD/D+3qA0pA2+49aEyZ+sCUSw4i3tL3oOIs90C5L6ogSn7/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A78VugkOTTnzeNaYAqQxwrLsF9uKh/sVxRzDgzyqCmE=;
 b=MaHvElaOVIwmcsxbvcyCTsg8SXDSXQU22NzK4FD374sgZKBW9iMQDRgNXbyBvn35iA3oVyOvCiEteRfQnNNw9JnA89zSmXwxvF/X795eFZO2ieZoq72qrd7/TZNvEsVQyPwenVDpDlCPLsQ+WpmBrvnI0j6Sk6wR9nETjmuUKT8=
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com (2603:10a6:20b:37::25)
 by AM6PR0602MB3384.eurprd06.prod.outlook.com (2603:10a6:209:a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 19:56:22 +0000
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6]) by AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 19:56:22 +0000
From: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Thread-Topic: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Thread-Index: AQHWx0yl6YXgCwFOFUu+M4mDBYt7v6nhFYrA
Date: Mon, 30 Nov 2020 19:56:22 +0000
Message-ID: <AM6PR06MB46919E26FEB046D0B523DD37A6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130191133.GA1565464@ravnborg.org>
In-Reply-To: <20201130191133.GA1565464@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none
 header.from=leica-geosystems.com;
x-originating-ip: [146.185.2.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47c9e12c-177b-44f2-9c88-08d8956a02f4
x-ms-traffictypediagnostic: AM6PR0602MB3384:
x-microsoft-antispam-prvs: <AM6PR0602MB3384AE238F976808C6A16DE6A6F50@AM6PR0602MB3384.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g4Bp6bKrEFlPls3Ds/hbsXrs1YGseZvkMaLchBVMb1sby49uB8JxBgmpmrAcCCVaP3vNhcGovL4QWK2wCJJG9DqrWqU3o1XUV5eDqwSYthmrbnzf74YKfgaMNo4jbDwnqYxHGyIxUUtqOgXN4fAO6/g5Vg4fT8z6BkI/U9ZCQl5rK0ocK568tVmXDTw8fBgHngSWWlQ1eUG9AST6gEgvKdNP92l46r5WHaHHEPh9wIgyClXz5uEjqNXfUflujvNP+MXWSmvu4nUwOWxOKragP9e/Tp35nJtkmuL97JBTuwKvnopHqloLwxXVXb2DsFGoTGVbnAtxoTal8tGRkJ5uZheQ9/ukpyTchd25ISXvIl8hzfaDvEJBNKuapZb46OWJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR06MB4691.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(66556008)(66446008)(64756008)(478600001)(76116006)(186003)(8936002)(66946007)(8676002)(66476007)(52536014)(5660300002)(54906003)(316002)(83380400001)(6916009)(55016002)(33656002)(9686003)(71200400001)(4326008)(7696005)(86362001)(7416002)(6506007)(53546011)(7406005)(2906002)(26005)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RGlBTHp5OTU1WkFnUk5mVmYzZUJ2U1hVSXpYZjM1cndWZzBxZmJ6WmNIUWRT?=
 =?utf-8?B?WWtsdnI3WUIvek1LUi9obGIzMXVoNzdiR1dpdEVVWDVNYklkbWNUK3d5dmps?=
 =?utf-8?B?ckRuZWpLa240UTRsVDZGWmhyUld2cHZNTjFqOXVIK0VZS0hTSUMyekdhUWl4?=
 =?utf-8?B?Q3BCNk1hd2dieW1sS1laR2VGd0xZc29vaG5WVFpEa2sxTzlvMy92MEFBUlUz?=
 =?utf-8?B?aU1XMUVtc2t5MkJIdXZ6ZVoyZFV6SjdlTkw5UW9oOFBIUkFHeU93M0FyTEcz?=
 =?utf-8?B?R3RRWjcrSHZpaVFvK1dxUmRSK2d2QWVHcDRwVTdLVm5LNDdjZGt1U2o2Z1RV?=
 =?utf-8?B?MU5NWnF6ekpSTDltUytodEdFTkQxMlRWeHVNVm1RNE5QL1FuRW1KOTVKWHFq?=
 =?utf-8?B?aXJyNjRhT2UrT0svYlBOZXdCOEhKNmF3OGV3RE1tQWdFcm9YMnBibXNsUGhD?=
 =?utf-8?B?ZkdNanFtZjNJaWJNa0hZcjhRMXdsZWVxbnV1WHdJb1ZNZmZIaHFuVDlMZmhr?=
 =?utf-8?B?d3NRdFJ0bnFnUzc5R0dhQjlSOHNKU0N6RCtpMHhpNElQNVAwTFVUbzBvR0ty?=
 =?utf-8?B?UHRNc2YyQ29lMm1zSm5mTXJXOXZNRnB3a1BwR2lWNVkzKzg0RjJRR0JvR1Ry?=
 =?utf-8?B?eXF4ekVrTUZhVDFWeWlKakV4WGFqenVTOUVRNW00aGhVS1dIWVdCWi80d2JZ?=
 =?utf-8?B?aktrcWlwVnFFL1doWjZmZ2Ryd29mdjM4MG5mL1RxS2NWbURJTEFta2w3Wld6?=
 =?utf-8?B?b0tOVExyS002bVQvdmhuencxNzlwZ2tXbnBxVUxSdFhuNzF3L0VCRElVK1dx?=
 =?utf-8?B?emU1TEhJamVtSTFyOGxLNXgzVjc5Wis3bnZLZjZuYk9qTXpadlJQbGRSaWVC?=
 =?utf-8?B?UEVybzZlOXJ1cFVBS1hyYU1XVVV4UjlkL0ZBUjg4L0RlWExlb254QmtPVkho?=
 =?utf-8?B?L0ZUZlBzaXN5cWtHQXR5V3pIckQ4bHVxN2kvTkZZeFA3aG5ndExUbEN0Wlg2?=
 =?utf-8?B?TWQ4cXJjeThEb0NQRmpRZ3FFMVh1MGpUaW95aDBpWmFXZTZNbURjWmluUUcv?=
 =?utf-8?B?QzJrUGV2ZU1WMitNWmtJTzZqbjAybCtzbkNZeTlvYS9XMEpWQktoMTZEZXYx?=
 =?utf-8?B?ZmFPNEVXUTBIc0Q1VlNLcHRjbG5Yby9GUVEyZUVMWnlMOHpZd3YyRzVobU5M?=
 =?utf-8?B?WllsWHFsUEdxSmxYU2hqKy9ReW1LUGxBQjBRNTZOaVVQcnJ2N29uMnNmdjVP?=
 =?utf-8?B?ZkpOVSsyZWE1bHdoeUxobysrd2Z5SFNaQW14aGZXa2EwR3I4R3pHc1hHeC9y?=
 =?utf-8?Q?IuUEk+JY11vzA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB4691.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c9e12c-177b-44f2-9c88-08d8956a02f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 19:56:22.0413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EhUux8HXzjRu7RpgANenbYkE690f+SzZjPJqJLU23bx2WrMRn0L7kQMD/WiBHAC56kxWJdZDLEH08ESurvnLD2Vnnqetdeti6Pzy669w48/SYfEXlqDzevM/AedF8D6H
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
 "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "paulus@samba.org" <paulus@samba.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "deller@gmx.de" <deller@gmx.de>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "will@kernel.org" <will@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
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

SGVsbG8gU2FtLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAzMCwg
MjAyMCA4OjEyIFBNDQo+IFRvOiBaSElaSElLSU4gQW5kcmV5IDxhbmRyZXkuemhpemhpa2luQGxl
aWNhLWdlb3N5c3RlbXMuY29tPg0KPiBDYzogbGludXhAYXJtbGludXgub3JnLnVrOyBuaWNvbGFz
LmZlcnJlQG1pY3JvY2hpcC5jb207DQo+IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOyBs
dWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOw0KPiB0b255QGF0b21pZGUuY29tOyBtcmlw
YXJkQGtlcm5lbC5vcmc7IHdlbnNAY3NpZS5vcmc7DQo+IGplcm5lai5za3JhYmVjQHNpb2wubmV0
OyB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb207IGpvbmF0aGFuaEBudmlkaWEuY29tOw0KPiBjYXRh
bGluLm1hcmluYXNAYXJtLmNvbTsgd2lsbEBrZXJuZWwub3JnOyB0c2JvZ2VuZEBhbHBoYS5mcmFu
a2VuLmRlOw0KPiBKYW1lcy5Cb3R0b21sZXlAaGFuc2VucGFydG5lcnNoaXAuY29tOyBkZWxsZXJA
Z214LmRlOw0KPiBtcGVAZWxsZXJtYW4uaWQuYXU7IGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZzsg
cGF1bHVzQHNhbWJhLm9yZzsNCj4gbGVlLmpvbmVzQGxpbmFyby5vcmc7IGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbTsNCj4gZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc7IGtyemtAa2VybmVsLm9y
ZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IG9tYXBAdmdlci5rZXJuZWwub3JnOyBsaW51eC10
ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBtaXBzQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcGFyaXNjQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtDQo+IGRldkBsaXN0cy5vemxhYnMu
b3JnOyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgT2xvZiBKb2hhbnNzb24NCj4gPG9s
b2ZAbGl4b20ubmV0Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0gZHJvcCB1bnVzZWQgQkFD
S0xJR0hUX0dFTkVSSUMgb3B0aW9uDQo+IA0KPiANCj4gT24gTW9uLCBOb3YgMzAsIDIwMjAgYXQg
MDM6MjE6MzJQTSArMDAwMCwgQW5kcmV5IFpoaXpoaWtpbiB3cm90ZToNCj4gPiBTaW5jZSB0aGUg
cmVtb3ZhbCBvZiBnZW5lcmljX2JsIGRyaXZlciBmcm9tIHRoZSBzb3VyY2UgdHJlZSBpbiBjb21t
aXQNCj4gPiA3ZWNkZWE0YTAyMjYgKCJiYWNrbGlnaHQ6IGdlbmVyaWNfYmw6IFJlbW92ZSB0aGlz
IGRyaXZlciBhcyBpdCBpcw0KPiA+IHVudXNlZCIpIEJBQ0tMSUdIVF9HRU5FUklDIGNvbmZpZyBv
cHRpb24gYmVjYW1lIG9ic29sZXRlIGFzIHdlbGwgYW5kDQo+ID4gdGhlcmVmb3JlIHN1YmplY3Qg
dG8gY2xlYW4tdXAgZnJvbSBhbGwgY29uZmlndXJhdGlvbiBmaWxlcy4NCj4gPg0KPiA+IFRoaXMg
c2VyaWVzIGludHJvZHVjZXMgcGF0Y2hlcyB0byBhZGRyZXNzIHRoaXMgcmVtb3ZhbCwgc2VwYXJh
dGVkIGJ5DQo+ID4gYXJjaGl0ZWN0dXJlcyBpbiB0aGUga2VybmVsIHRyZWUuDQo+ID4NCj4gPiBB
bmRyZXkgWmhpemhpa2luICg1KToNCj4gPiAgIEFSTTogY29uZmlnczogZHJvcCB1bnVzZWQgQkFD
S0xJR0hUX0dFTkVSSUMgb3B0aW9uDQo+ID4gICBhcm02NDogZGVmY29uZmlnOiBkcm9wIHVudXNl
ZCBCQUNLTElHSFRfR0VORVJJQyBvcHRpb24NCj4gPiAgIE1JUFM6IGNvbmZpZ3M6IGRyb3AgdW51
c2VkIEJBQ0tMSUdIVF9HRU5FUklDIG9wdGlvbg0KPiA+ICAgcGFyaXNjOiBjb25maWdzOiBkcm9w
IHVudXNlZCBCQUNLTElHSFRfR0VORVJJQyBvcHRpb24NCj4gPiAgIHBvd2VycGMvY29uZmlnczog
ZHJvcCB1bnVzZWQgQkFDS0xJR0hUX0dFTkVSSUMgb3B0aW9uDQo+IA0KPiBGb3IgZGVmY29uZmln
cyBJIGV4cGVjdCBhcmNoIG1haW50YWluZXJzIHRvIGRvIGEgbWFrZSB4eHhkZWZjb25maWcgLyBt
YWtlDQo+IHNhdmVkZWZjb25maWcgLyBjcCBkZWZjb25maWcgLi4uIHJ1biBub3cgYW5kIHRoZW4g
LSB0aGlzIHdpbGwgcmVtb3ZlIGFsbCBzdWNoDQo+IHN5bWJvbHMuDQoNClRoaXMgc2VyaWVzIHN0
cmV0Y2hlcyBhY3Jvc3Mgc2V2ZXJhbCBhcmNocywgc28gSSB3b3VsZCBleHBlY3QgdGhhdCBpdCBj
b3VsZCd2ZSBiZWVuIGFkZHJlc3NlZCBmb3Igc29tZSBvZiB0aGVtIGJ1dCB3b3VsZCB0YWtlIG1v
cmUgdGltZSB0aGFuIHN1Ym1pdHRpbmcgdGhpcyAicG9pbnQgZml4IiBub3csIHRhcmdldGluZyBv
bmUgb2Jzb2xldGUgY29uZmlnIG9wdGlvbi4NCg0KSSd2ZSBwZXJzb25hbGx5IGhpdCBpdCBmb3Ig
YXJtNjQgb24gdGhlIGZpcnN0IHBsYWNlLCBhbmQgbG9va2luZyBmdXJ0aGVyIGludG8gdGhlIG9w
dGlvbiBpdHNlbGYgSSByZWFsaXplZCB0aGF0IGl0IGlzIG1pc3NpbmcgZnJvbSB0aGUga2VybmVs
IHRyZWUgY29tcGxldGVseSBhbmQgZGVjaWRlZCB0byBmaXggYWxsIGFyY2hzIGFmZmVjdGVkIGF0
IG9uY2UuDQoNCj4gDQo+IElmIHRoZSBwYXRjaGVzIGdvZXMgaW4gbGlrZSB0aGV5IGFyZSBzdWJt
aXR0ZWQgdGhlbjoNCj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4N
Cj4gDQo+ID4NCj4gPiAgYXJjaC9hcm0vY29uZmlncy9hdDkxX2R0X2RlZmNvbmZpZyAgICAgICAg
ICB8IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL2NtX3gzMDBfZGVmY29uZmlnICAgICAgICAg
IHwgMSAtDQo+ID4gIGFyY2gvYXJtL2NvbmZpZ3MvY29saWJyaV9weGEzMDBfZGVmY29uZmlnICAg
fCAxIC0NCj4gPiAgYXJjaC9hcm0vY29uZmlncy9qb3JuYWRhNzIwX2RlZmNvbmZpZyAgICAgICB8
IDEgLQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL21hZ2ljaWFuX2RlZmNvbmZpZyAgICAgICAgIHwg
MSAtDQo+ID4gIGFyY2gvYXJtL2NvbmZpZ3MvbWluaTI0NDBfZGVmY29uZmlnICAgICAgICAgfCAx
IC0NCj4gPiAgYXJjaC9hcm0vY29uZmlncy9vbWFwMnBsdXNfZGVmY29uZmlnICAgICAgICB8IDEg
LQ0KPiA+ICBhcmNoL2FybS9jb25maWdzL3B4YTN4eF9kZWZjb25maWcgICAgICAgICAgIHwgMSAt
DQo+ID4gIGFyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgICAgICAgICAgICAgfCAxIC0N
Cj4gPiAgYXJjaC9hcm0vY29uZmlncy9zYW1hNV9kZWZjb25maWcgICAgICAgICAgICB8IDEgLQ0K
PiA+ICBhcmNoL2FybS9jb25maWdzL3N1bnhpX2RlZmNvbmZpZyAgICAgICAgICAgIHwgMSAtDQo+
ID4gIGFyY2gvYXJtL2NvbmZpZ3MvdGVncmFfZGVmY29uZmlnICAgICAgICAgICAgfCAxIC0NCj4g
PiAgYXJjaC9hcm0vY29uZmlncy91ODUwMF9kZWZjb25maWcgICAgICAgICAgICB8IDEgLQ0KPiA+
ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgIHwgMSAtDQo+ID4g
IGFyY2gvbWlwcy9jb25maWdzL2djdzBfZGVmY29uZmlnICAgICAgICAgICAgfCAxIC0NCj4gPiAg
YXJjaC9taXBzL2NvbmZpZ3MvZ3ByX2RlZmNvbmZpZyAgICAgICAgICAgICB8IDEgLQ0KPiA+ICBh
cmNoL21pcHMvY29uZmlncy9sZW1vdGUyZl9kZWZjb25maWcgICAgICAgIHwgMSAtDQo+ID4gIGFy
Y2gvbWlwcy9jb25maWdzL2xvb25nc29uM19kZWZjb25maWcgICAgICAgfCAxIC0NCj4gPiAgYXJj
aC9taXBzL2NvbmZpZ3MvbXR4MV9kZWZjb25maWcgICAgICAgICAgICB8IDEgLQ0KPiA+ICBhcmNo
L21pcHMvY29uZmlncy9yczkwX2RlZmNvbmZpZyAgICAgICAgICAgIHwgMSAtDQo+ID4gIGFyY2gv
cGFyaXNjL2NvbmZpZ3MvZ2VuZXJpYy02NGJpdF9kZWZjb25maWcgfCAxIC0NCj4gPiAgYXJjaC9w
b3dlcnBjL2NvbmZpZ3MvcG93ZXJudl9kZWZjb25maWcgICAgICB8IDEgLQ0KPiA+ICAyMiBmaWxl
cyBjaGFuZ2VkLCAyMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+DQo+ID4gYmFzZS1jb21taXQ6IGI2
NTA1NDU5Nzg3MmNlM2FlZmJjNmE2NjYzODVlYWJkZjllMjg4ZGENCj4gPiBwcmVyZXF1aXNpdGUt
cGF0Y2gtaWQ6IGJmZDM4MmNmMWRjMDIxZDIwMjA0ZjEwZWE5NDAzMzE5YzFjMzJiMTINCj4gPiBw
cmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDUzOTdjMGM4NjQ4YmIzZTBiODMwMjA3ZWE4NjcxMzhjMTFj
NmU2NDQNCj4gPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGEzYzI4NGRmZjVmZTZkMDI4Mjg5MThh
ODg2ZGI2YThlZDMxOTdlMjANCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KDQpSZWdhcmRzLA0KQW5kcmV5
DQo=
