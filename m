Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95912CACB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 20:50:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clt4f0DVCzDqtj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 06:50:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.8.98;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=tASf2JaZ; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80098.outbound.protection.outlook.com [40.107.8.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clt2f2RN8zDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 06:48:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCeECwu91a7x9a+MbtfNGn891U1GgRtk6BQcjJWPTTzISv7YXJXI7ls9oz7twVGKzKYPizlLclm27B9a5R0gtocda5HC91+P9+sJZqwY/sazKuGeUFHVXC177acxJrP1qkuoGCrZoT8yms/atGQ3m+R1uMMNqSGh/BhmpJ/zYsT8jiNj2PF6hQi7hq+JkvvS+hQu/Pk/P+G9iG4F5dHpmC3KvqL0uLQlnRqu7lqTQrj+AWMNXErUYwffp7w0u11c2UzjmCWpdNzGhFkzU1QOtNCW6BmIgUZkqcmopUUi39lUv3sU9qrh0WiJfbVls5PNbYfNei29iwKgBiUtNtyeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYI2SpJaREY7XAN2uZLPIH3fZOryo5G5N0bv3AA5zZY=;
 b=aSgEvzHeUKxu1f8VxC/I3LDLULY47mNaCUyg7Sc8BOngWqKScZLwJkDc71/QFiE75M0eNji+sR6XxeYcfK1c6UgUcFzz4uf2kpeesrrIczSpyC0C86wUERWEzU49qpBcOmlTxBSj0PW6Mc/tAWtI0Qo1HLsy2z0SCBclzu2vaoC+RXo4LLtEBsfD7RGxE1Pc9mUSQ+yFf6VzyJybCyrfNpmpBpKEEOQGYjLAOKrQ0pY4FpmreYb4+Le7XeOZM2OdWyD68wPmcqg/pRit6OVg9YSz4QvJbvowUXWYohDLTtJJudYaGGGt1qk0K+QcM+mjGRR9M6KYv+hPME7hRYXiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYI2SpJaREY7XAN2uZLPIH3fZOryo5G5N0bv3AA5zZY=;
 b=tASf2JaZh0OCmEMvbawZL4/nsHqfGbB11cfGruRh4zo5KcKZVsXTPY0f2aILsBUzIjSlt2O9PmVu6qsesWfTv63lFOEUHCKvZQwFvt74+AnVW3zVkw9mLSR6Twq21TIJX9oL3vLTz4wRRg5CS/iJO5tB+4E7pHoIGYMDnKRfGYc=
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com (2603:10a6:20b:37::25)
 by AM5PR0601MB2436.eurprd06.prod.outlook.com (2603:10a6:203:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 19:48:50 +0000
Received: from AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6]) by AM6PR06MB4691.eurprd06.prod.outlook.com
 ([fe80::b073:9747:410c:12c6%6]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 19:48:49 +0000
From: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
To: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: RE: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Thread-Topic: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Thread-Index: AQHWx0nyrvG/8Bze9k2IWWGibqXRnanhE2IAgAE9+oCAABD6gIAAAnAAgAA+F7A=
Date: Tue, 1 Dec 2020 19:48:49 +0000
Message-ID: <AM6PR06MB4691A5E1603BBE57F35F3B17A6F40@AM6PR06MB4691.eurprd06.prod.outlook.com>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
 <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 5be564df-152b-480a-3dcb-08d896321fad
x-ms-traffictypediagnostic: AM5PR0601MB2436:
x-microsoft-antispam-prvs: <AM5PR0601MB24364119E62ACECD5804F6D0A6F40@AM5PR0601MB2436.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rCaGlcz6Givz5NGALXs0ZcuEcse6jZu0SejRHPWjVjLw7Y3RQX01JzQZ5zyB9JxBtFCjg7F/BTmXUbqft5hd3JPLua4EHcdVargZlb8OQX9zu32jEZzWM4roi9AodbsiejvPly8hMfkpUzGlEcORC/7ivin3IA7bGNZg3dJjL3WCmHwZ8oms8OS5WRWoncMLqr/+9XU3xAF/2mkKTlBzoI8R+EVsUrKJgAwFx1PiERet39FGh/aURi5/k30QlZq9Tgrc4s/joQTYOBC5GJOp5BNjdXWa8R0wrY+gR1lv03hqOljmJuwvT50D29fKzcXRoE+GGjGJWtBD0Rv5WREuHLR5JoN5oDArrumhPzkRjIS/QwYPsE4lKowAE08x+isR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR06MB4691.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(55016002)(83380400001)(186003)(478600001)(64756008)(7416002)(52536014)(6506007)(66446008)(76116006)(66556008)(26005)(66476007)(53546011)(66946007)(2906002)(86362001)(54906003)(8936002)(5660300002)(9686003)(71200400001)(7696005)(7406005)(4326008)(33656002)(316002)(110136005)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RjhxTXhhUDFBekhpdDJqS3FOSlNDTjdYQ2l1QWxsTFZrSDh6bWRyMFloT2RI?=
 =?utf-8?B?eWJydS9qUHdBc29yckUwUDBVVkJwcjlnZnVjd0lFYVd0WEZ1bEZHWEtTd0xr?=
 =?utf-8?B?Q0Z5ZFdlMCsyeDNyL0R3cGVzaWh0aXhHRUc5RVJwK3RzQTVzQUNaR1cxdEwx?=
 =?utf-8?B?VU1oSDZuVFVoWURlSWYydCtUZ1pydk8xdmdBejhkSmVOOG1Kd1lCNlBrNzh6?=
 =?utf-8?B?bVJxQUY3eDM2ZmM3MHBNNklpSWdMaTBtZkwwWHkrVTRvMWhzR1pFVVZydStw?=
 =?utf-8?B?RGtnSFNsQVRhRDhhN0NFRG9kT2w4eFhHejBIaDBWWDVHOU1DRkJYNzE4dFRB?=
 =?utf-8?B?MlBMRkUvOHo5QzJYRmZoYXVnSUJJZnpZSXBPZ0NpUGtzZks4RXVEZ1ByVGdw?=
 =?utf-8?B?enlTdW0vTjV4S2FjSU5sV2RqVUFLREIybU42MXF5b2NnaU5va0VHVUhlZGts?=
 =?utf-8?B?TEF2RVJ5bTdpVnE4MCtyZ3BSei9sTUF3c2d1azYwS3EzRXJFaVRhOWRxeGM2?=
 =?utf-8?B?Z3ZvSlNodTE5NWY4dVZ3SXY2VnI3Zld3aDR3QVNHMmMrVlJJbzlicnN6TjlF?=
 =?utf-8?B?MTZDT0FIUmprVlJYNTNlSFhobThvaEJOUUtJblFGRWg5YWpKSE1pN1ByWHk0?=
 =?utf-8?B?bzkwRHFscW1JOEpTQmxHQ1ZRZStsV01yY1VFSWQxazhHSDllUWR0WnUwdHlV?=
 =?utf-8?B?bTdmUEVYRXgvY0RGK2tEQWpBM2Qxcy82U3p3YVZrYU1JWi80MGs3Z3VyRDhZ?=
 =?utf-8?B?RlpZWXZuTlNITzlMZFFXajdVeEEyQ3ZKbnpocU5tRUpLVzNEZ2Y0RXdUR243?=
 =?utf-8?B?NWlMcVVYRkg4Z3JpRjhOWjNQVzlRZjFJWVBYb0FiL200MkdZSHBpVHl3OEJv?=
 =?utf-8?B?NTRXaU5ZVHFoNWNvb1VGbFh3NWhMWFZsTFJYK1oyVzZBdE4xb0ZHWHptUzJt?=
 =?utf-8?B?QzNUYTluUVFkZit2cFZwQ1k5T00xWUNoMVhVR255ZlQrRGVTWGVXc3RMajkw?=
 =?utf-8?B?RjhxSE11eEE5SUQ5YzRSY0RVMlJCNlQ1OGNxcGdMYUpjYzRpUUgxZVpBSFdi?=
 =?utf-8?B?eDA2RTMvcW9wdkxmN3pSZTNURDZVN2YzeUVFUGlyV1NHeEljbXRKMkl5OEc0?=
 =?utf-8?B?MlFwMWJxMXcrTzRGbUI5NDBjM054UFlUbnZ5MTZGajBEU09OOUxWVk1Hd0R3?=
 =?utf-8?B?dWRNNTNaVWNpRm9Hdmc1WkRld0plc0IwWEIrMlZDcnJCL1JSbDlzNWlrTXh3?=
 =?utf-8?B?QWhqNGxacVBhY25FMkdsakhnUnFKSHJURVVvQmxnbWx0eUtYa0FzS0hlVGZa?=
 =?utf-8?Q?xIgYcFjUFH/fo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB4691.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be564df-152b-480a-3dcb-08d896321fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 19:48:49.4904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: En5TR0hBLU9NuIik/pE8ewKNNhk8Vr7lFMdGTISuRLiwlhR7zI4Vw8qWwHV7P1sfKoTdKTVIbL6KJovqsM5WL4NqSwzmkiyH+sYX9v9O3IMRBSXTk1nrKQb7qnsv1LSz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2436
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
Cc: "tony@atomide.com" <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "paulus@samba.org" <paulus@samba.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "deller@gmx.de" <deller@gmx.de>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 arm-soc <arm@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
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

SGVsbG8gQXJuZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBcm5k
IEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEs
IDIwMjAgNDo1MCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPg0KPiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJt
LmNvbT47IFpISVpISUtJTiBBbmRyZXkNCj4gPGFuZHJleS56aGl6aGlraW5AbGVpY2EtZ2Vvc3lz
dGVtcy5jb20+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprQGtlcm5lbC5vcmc+OyBsaW51
eEBhcm1saW51eC5vcmcudWs7IG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbTsNCj4gbHVkb3Zp
Yy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbTsgdG9ueUBhdG9taWRlLmNvbTsNCj4gbXJpcGFyZEBr
ZXJuZWwub3JnOyB3ZW5zQGNzaWUub3JnOyBqZXJuZWouc2tyYWJlY0BzaW9sLm5ldDsNCj4gdGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tOyBqb25hdGhhbmhAbnZpZGlhLmNvbTsgd2lsbEBrZXJuZWwu
b3JnOw0KPiB0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlOyBKYW1lcy5Cb3R0b21sZXlASGFuc2Vu
UGFydG5lcnNoaXAuY29tOw0KPiBkZWxsZXJAZ214LmRlOyBtcGVAZWxsZXJtYW4uaWQuYXU7IGJl
bmhAa2VybmVsLmNyYXNoaW5nLm9yZzsNCj4gcGF1bHVzQHNhbWJhLm9yZzsgbGVlLmpvbmVzQGxp
bmFyby5vcmc7IHNhbUByYXZuYm9yZy5vcmc7DQo+IGVtaWwubC52ZWxpa292QGdtYWlsLmNvbTsg
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBvbWFw
QHZnZXIua2VybmVsLm9yZzsgbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
bWlwc0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
cHBjLQ0KPiBkZXZAbGlzdHMub3psYWJzLm9yZzsgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT47IE9sb2YgSm9oYW5zc29uDQo+IDxvbG9mQGxpeG9tLm5ldD47IGFybS1zb2MgPGFybUBrZXJu
ZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gQVJNOiBjb25maWdzOiBkcm9wIHVu
dXNlZCBCQUNLTElHSFRfR0VORVJJQw0KPiBvcHRpb24NCj4gDQo+IA0KPiBPbiBUdWUsIERlYyAx
LCAyMDIwIGF0IDQ6NDEgUE0gQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPiB3cm90ZToNCj4gPiBPbiAwMS8xMi8yMDIwIDE0OjQwOjUzKzAwMDAsIENh
dGFsaW4gTWFyaW5hcyB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDMwLCAyMDIwIGF0IDA3OjUw
OjI1UE0gKzAwMDAsIFpISVpISUtJTiBBbmRyZXkgd3JvdGU6DQo+ID4gPiA+IEZyb20gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPjoNCj4gDQo+ID4gPiBJIHRyaWVkIHRvIGNv
bnZpbmNlIHRoZW0gYmVmb3JlLCBpdCBkaWRuJ3Qgd29yay4gSSBndWVzcyB0aGV5IGRvbid0DQo+
ID4gPiBsaWtlIHRvIGJlIHNwYW1tZWQgOykuDQo+ID4NCj4gPiBUaGUgZmlyc3QgcnVsZSBvZiBh
cm0tc29jIGlzOiB5b3UgZG8gbm90IHRhbGsgYWJvdXQgYXJtQCBhbmQgc29jQA0KPiANCj4gSSBk
b24ndCBtaW5kIGhhdmluZyB0aGUgYWRkcmVzc2VzIGRvY3VtZW50ZWQgYmV0dGVyLCBidXQgaXQg
bmVlZHMgdG8gYmUNCj4gZG9uZSBpbiBhIHdheSB0aGF0IGF2b2lkcyBoYXZpbmcgYW55IHBhdGNo
IGZvciBhcmNoL2FybSovYm9vdC9kdHMgYW5kDQo+IGFyY2gvYXJtLyovY29uZmlncyBDYzpkIHRv
IHNvY0BrZXJuZWwub3JnLg0KPiANCj4gSWYgYW55b25lIGhhcyBzdWdnZXN0aW9ucyBmb3IgaG93
IHRvIGRvIHRoYXQsIGxldCBtZSBrbm93Lg0KDQpKdXN0IGFzIGEgcHJvcG9zYWw6DQpNYXliZSB0
aG9zZSBhZGRyZXNzZXMgc2hvdWxkIGF0IGxlYXN0IGJlIGluY2x1ZGVkIGluIHRoZSBEb2N1bWVu
dGF0aW9uICgiU2VsZWN0IHRoZSByZWNpcGllbnRzIGZvciB5b3VyIHBhdGNoIiBzZWN0aW9uIG9m
ICJTdWJtaXR0aW5nIHBhdGNoZXMiKSwgbXVjaCBsaWtlIHN0YWJsZUAgaXMuIFRob3NlIHdobyBn
ZXQgdGhlbXNlbHZlcyBmYW1pbGlhcml6ZWQgd2l0aCBpdCAtIHdvdWxkIGdldCBhbiBpZGVhIGFi
b3V0IHdoaWNoIGxpc3QgdGhleSB3b3VsZCBuZWVkIHRvIGluY2x1ZGUgaW4gQ2M6IGZvciBzdWNo
IGNoYW5nZXMuDQoNClRoYXQgc2hvdWxkIElNSE8gcGFydGlhbGx5IHJlZHVjZSB0aGUgdHJhZmZp
YyBvbiB0aGUgbGlzdCBzaW5jZSBpdCB3b3VsZCBub3QgcG9wLXVwIGluIHRoZSBvdXRwdXQgb2Yg
Z2V0X21haW50YWluZXIucGwsIGJ1dCB3b3VsZCBhdCBsZWFzdCBiZSBkb2N1bWVudGVkIHNvIGNv
bnRyaWJ1dG9ycyBjYW4gZm9sbG93IHRoZSBwcm9jZXNzLg0KDQo+IA0KPiA+ID4gT3IgcmF0aGVy
LCBTb0Mtc3BlY2lmaWMgcGF0Y2hlcywgZXZlbiB0byBkZWZjb25maWcsIHNob3VsZCBnbw0KPiA+
ID4gdGhyb3VnaCB0aGUgc3BlY2lmaWMgU29DIG1haW50YWluZXJzLiBIb3dldmVyLCB0aGVyZSBh
cmUgb2NjYXNpb25hbA0KPiA+ID4gZGVmY29uZmlnIHBhdGNoZXMgd2hpY2ggYXJlIG1vcmUgZ2Vu
ZXJpYyBvciBhZmZlY3RpbmcgbXVsdGlwbGUgU29Dcy4NCj4gPiA+IEkganVzdCBpZ25vcmUgdGhl
bSBhcyB0aGUgYXJtNjQgZGVmY29uZmlnIGlzIHVzdWFsbHkgaGFuZGxlZCBieSB0aGUNCj4gPiA+
IGFybS1zb2MgZm9sayAod2hlbiBJIG5lZWQgYSBkZWZjb25maWcgY2hhbmdlLCBJIGdvIGZvcg0K
PiA+ID4gYXJjaC9hcm02NC9LY29uZmlnIGRpcmVjdGx5IDspKS4NCj4gPg0KPiA+IElJUkMsIHRo
ZSBwbGFuIHdhcyBpbmRlZWQgdG8gZ2V0IGRlZmNvbmZpZyBjaGFuZ2VzIHRocm91Z2ggdGhlDQo+
ID4gcGxhdGZvcm0gc3ViLXRyZWVzLiBJdCBpcyBhbHNvIHN1cHBvc2VkIHRvIGJlIGhvdyBtdWx0
aV92NSBhbmQNCj4gPiBtdWx0aV92NyBhcmUgaGFuZGxlZCBhbmQgdGhleSB3aWxsIHRha2UgY2Fy
ZSBvZiB0aGUgbWVyZ2UuDQo+IA0KPiBGb3IgY3Jvc3MtcGxhdGZvcm0gY2hhbmdlcyBsaWtlIHRo
aXMgb25lLCBJJ20gZGVmaW5pdGVseSBoYXBweSB0byBwaWNrIHVwIHRoZQ0KPiBwYXRjaCBkaXJl
Y3RseSBmcm9tIHNvY0BrZXJuZWwub3JnLCBvciBmcm9tIG1haWxpbmcgbGlzdCBpZiBJIGtub3cg
YWJvdXQgaXQuDQoNClNob3VsZCBJIGNvbGxlY3QgYWxsIEFjaydzIGFuZCByZS1zZW5kIHRoaXMg
c2VyaWVzIGluY2x1ZGluZyB0aGUgbGlzdCAibm9ib2R5IHRhbGtzIGFib3V0IiA6KSwgb3IgdGhl
IHNlcmllcyBjYW4gYmUgcGlja2VkIHVwIGFzLWlzPw0KDQpZb3VyIGFkdmljZSB3b3VsZCBiZSBy
ZWFsbHkgd2VsY29tZWQgaGVyZSENCg0KPiANCj4gV2UgdXN1YWxseSBkbyB0aGUgbWVyZ2VzIGZv
ciB0aGUgc29jIHRyZWUgaW4gYmF0Y2hlcyBhbmQgcmVseSBvbiBwYXRjaHdvcmsNCj4gdG8ga2Vl
cCB0cmFjayBvZiB3aGF0IEknbSBtaXNzaW5nLCBzbyBpZiBPbG9mIGFuZCBJIGFyZSBqdXN0IG9u
IENjIHRvIGEgbWFpbCwgd2UNCj4gbWlnaHQgaGF2ZSBmb3Jnb3R0ZW4gYWJvdXQgaXQgYnkgdGhl
IHRpbWUgd2UgZG8gdGhlIG5leHQgbWVyZ2VzLg0KPiANCj4gICAgICAgQXJuZA0KDQpSZWdhcmRz
LA0KQW5kcmV5DQo=
