Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D155B662D1C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 18:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrLvj5Gfpz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 04:45:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=A78PvSH9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.79; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=A78PvSH9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2079.outbound.protection.outlook.com [40.107.12.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrLtn3Cb2z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:45:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6Tuup7sIDJnCdPQM+dyMbLR3WcFE7dT4uZ5D3JYT3gmTW8mV+QxpuFHEq9u+nXWHUjAE8sabDC5F0Y89yNPPWH1MCymIBoHSjVWLKwfiiVCOM5pkbsLwgtXz0OrG2zuhNk1gAW0kXJjCJCuSsepUoW7VLgR/vHDCcqDGN7I5hwjw7Wcxnday8Xf4qY3KuAMMPXMUm3E5CrWDfR3FwomUEa8Ke0uLGToLFycV4lq6S98839OxEWR4Jb3ZOq9RcxMhZ0heRpysN6hn/no64vYtBEmOWWkYkZisQlHkJslH0M6ERFPhW9X6WzTu08Oan2IgnzVsOeJDRlrWy7Bc+WoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNy2KpJY/ToGzrVQcXTuMxnI8Z5RKknZV05GwbqDMq8=;
 b=PVKZ6DL/+xFhESG13XLj4QR5cw+eJ1ARxHfdMoqaXJ57m+tqjQhGRDQjzO+L0KTRoVekLKsytzyI0/Wltu4jjMooPBGa9FN8LivSFgsgXpI2WIkDacGce3IWrqu2TnUZ4i5v5i2iAIm5OPw+OMVdUXaCEs06yZhGcNYmtQHXKZjYOeiSYaOUy6RFnLXxAHkIurdejMfxn+/Ik7kjYnEzWnjUJpjK3piOlThw8y6v5mGG4RfOC3HdX4wzYM4GZTvyHbg7xc74X2spTXQf3fDTSKbzmw/dGtY15YbWcnE9GgaKG/Me6TcVR9X8vsE6OHaRfMk3Gli2GLXj/8mCgtPrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNy2KpJY/ToGzrVQcXTuMxnI8Z5RKknZV05GwbqDMq8=;
 b=A78PvSH9mGnA4FcM6ACVt/sqEjctHjLiEsbF3fX6D0RwKNCKGttQSmTShRAZ3dGkdF9v5i7nluvLskA487sKShZndpQux6EklloDm8rSsQPO2+zaDDU4anbVewI2+aTeNoAJOVNJYFI+5qiGm4CYPVuvwTCn0uUerNSrI+iP4cGqR0bYfS8Pi4Wx7Wmjcfp8bQevoPmqf+u88QRbVTz1dRJiMdz7YzkLQuLKfx+Nry8vOtmhllE9HXWUXCVNTpiz4Yw9GNVix8dij1u7Fn4/ROEbsTD7wAPr4kvkHblEygTBOcErHSC9nJJlAvjbFboLfDioVGcnKov2F6qmYIgiIw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1540.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 17:44:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:44:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "sam@ravnborg.org" <sam@ravnborg.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Antonino Daplas <adaplas@gmail.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin van der Gracht
	<robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Lee Jones
	<lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
	<jingoohan1@gmail.com>
Subject: Re: [PATCH 02/15] video: fbdev: atyfb: Introduce
 backlight_get_brightness()
Thread-Topic: [PATCH 02/15] video: fbdev: atyfb: Introduce
 backlight_get_brightness()
Thread-Index: AQHZIvwMFJRONkElPUiPiNfjS9DSeq6WXiUA
Date: Mon, 9 Jan 2023 17:44:46 +0000
Message-ID: <04f0f8c7-43cd-f774-c952-eb1cf3494bd8@csgroup.eu>
References:  <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-2-1bd9bafb351f@ravnborg.org>
In-Reply-To:  <20230107-sam-video-backlight-drop-fb_blank-v1-2-1bd9bafb351f@ravnborg.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1540:EE_
x-ms-office365-filtering-correlation-id: 050730f6-33a6-4dab-b549-08daf26932af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KDHjSpnxPbT6T72j6oRosbN4kpGiv2vyiXJASZWrhl+9o9bRWo2KwN97cXH5048SjPRcSUEMv96kqdX1QNf0sUQqCGandtzw0YzXtXMQxg9giXgxIYGsgWHeLhKHXquyQPerdCx5FzCYr1aCnEtJmCbzBPqfao4N+To/l7nVsPXaTGKq5N1G5mz9PrcuSa4oissGE9MVr9TwagXDbAWInhN95+zStdseGe8ci3bAJh0iwqiXMaAjcpYfobBzy+aWhZ2GqgdGeretdWyj+BLlNfxGFZIehczozjABRHUMp5Av0izUG7+a1NKvc4U1phEfrri0i2/mE4EwVOqINWfghHO4TIrShFVliCGrkotIxO0sHdIPKPOaNiVFtdMzwjDcA8zz5zrFgF7Eio9Ub3ytlgqi0d4YpO4T3f7F2pal0TR1i8rtu4fkMlMPHJI5i5/XGVuglIBU2oKF+yB34viMkJCjsWYSp79QWmom2u1I96vl9QCqNJkh8KJOaPJbjxsQQwVJWZHg4A1Wh6re55AmWl3od9jgriixoFPIbLO08LuNBms5irFEziUa0upDk2hEmv4FgAuPrd6ORbaOZPflQtd2V5nO09RioZsDWFG0aOAD5z6uMNFx4jP9vv8ZVhauCX8QvVSzV20zYSre941YbOKDB+IQOg20oojM4i5eTU5EPD5wxgEP37hTfDFmAqOiaHcn7WnkPID1WO2/HSjU0hDuXLfnPby5ZxAKlM9kj/SP8dofnoHWqWR0yv/PybMiEEhJ7/hKwZeE+t4XDTPYj/ftNE8sZK3MyIy/xA/tbvU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(8936002)(2906002)(5660300002)(66574015)(41300700001)(7416002)(66446008)(71200400001)(38070700005)(66556008)(91956017)(4326008)(76116006)(8676002)(66476007)(66946007)(64756008)(316002)(44832011)(921005)(110136005)(54906003)(186003)(26005)(6512007)(122000001)(2616005)(38100700002)(31686004)(86362001)(83380400001)(31696002)(36756003)(478600001)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RzR1MmZ2K2h6STJya3NnblhKU3VNcmM5QlFvRTFUVGN1UEd0TWt3Vm91Qy81?=
 =?utf-8?B?NFA1RS9LODVYZ0ZOZFRONUVyMjVVaytqWTk4YndLM3ZTRS9WUmxTOEp4UnNN?=
 =?utf-8?B?TlBjL3FXUWdYZHZwVmtweEpWSUtQdVJJakhqeXF4Zk1WVHh0RjZTL1c5YlNq?=
 =?utf-8?B?WGN3VEJORmJnVEF1N0h4dStBalljdlNEaFVsNFhYdU1VVkFnTEwxczhIQUJ0?=
 =?utf-8?B?YnFKWFBPTkNBcEZkTUs1ZE9ETXVsbEkzSmRhaDJwZlhYazR4SzdSQTlNV09Q?=
 =?utf-8?B?Y01EVmVKa3hVcE1vTnJ4WVRrYVloR3p0QktES0wxa3pZN2t6QlMvN204bW81?=
 =?utf-8?B?V00xbkFBN2NHQ1ZtcEluMitrK1NTaGhRUUJnKzhONVdMTGl1MFRaSEI5SFNj?=
 =?utf-8?B?NEVvdjgxZUtnOFAxRjBES0RqV1hpWDBEak5GK0ZqS0FkWGMyNURlMzVtVWZ0?=
 =?utf-8?B?S3FDS3dwbVJtdU1MTXhlTDFvQXlVbmxZZk5UZTNncEFrdGRxMzZLVlBHa2VP?=
 =?utf-8?B?a3dvaFZoRVJPWnU1WjJqTFo0QjBqYjJoWlFETTh3KzduVE5VaWRpc1Rwc250?=
 =?utf-8?B?bW82SEE3YlNUS2c2SmN2TnN6cUtmcy9qYUZoMGprTm9jc0gzRm0wUkwzbEdL?=
 =?utf-8?B?bFRvVXZiREFKLzVPNkJlZStJZXJNN3pCR2dheFBEamhUMlJocGs3UFB0L3Fi?=
 =?utf-8?B?M01qWW5Ma2R1bER4aEsybUZ0WjVxOG9PWkE2dllCY29aNkZvcTdLZ0dXSDgr?=
 =?utf-8?B?elJicGZwVWVZczBTNGZsb1ZJRkxtR3NUeURFZnpYVVdzQlVRRFVxQWZTek1u?=
 =?utf-8?B?djJ6MnJCUXhydi9SeVI2Y3dPVmZ6SEs2NjRlaTFYSHJjZEVZNnRaOGxOd2xE?=
 =?utf-8?B?V3BYaDloVUVaN2h0OEx5dzhnWFdHUWVYNXZTckdYL0RBUnQwcUJXcEtmcHNz?=
 =?utf-8?B?KzA0L3YwWnFUL2plK2l2Q3ZTdWQzZEhoc0JUeWFqUEtIbUEyVWNrMFVONUhH?=
 =?utf-8?B?Z1JsRXBoQk1mM0Z2aXY0KzE4c0Q1dTQxK2RabGxVSXAvWDJza3FLK01xc0d3?=
 =?utf-8?B?NTlVSlV2L3NqSEZuaWtLc3R2eitsajRUQTdNVlIvU0tOOWUwZmNNRnlkMG1M?=
 =?utf-8?B?TGNCTjBGSkd4WmwvdzVqVGI1aU1JeXJZN3NxbElFVVdMbEp1Rko2MlkvRTNv?=
 =?utf-8?B?NHcyYm9pdXNwVnd1VU5KYUZkMFJDZnplK0xDWmhlQkJvSzF5VGMxdm9xc0NS?=
 =?utf-8?B?UUs1YkpIL2xvclk0NU9DRldzOGkrOFJHYnVUNGU0cW5VYXRJUnVVdnFxN3NZ?=
 =?utf-8?B?WldYZkhlVktMQWRUM1BabXQwRGh5cWFzOVA0VTFVZ3VaejB0Sy81dFlvaUFY?=
 =?utf-8?B?RWNZMkhyUkdJTjMyc2ErRFVydHp0bGZ6VlFYSkY1c1VQbXNoTGRtY3VaZldn?=
 =?utf-8?B?a2ZjZ3MvM2pUMytnK2hpSmtjSnRjOTRYVkRsOC9VdkhkZ1RNM1laWFZ6b3Ju?=
 =?utf-8?B?TTJ1QTZHVTVJTnpic3V6YjE3d1ZVNXFkdFYydFp2aHkyNjhEL1dXcEhoNWpm?=
 =?utf-8?B?cGVraldTUkRHMjAzNXB5ZGJka2JnbnVFMWEwaTFxT1JrRzM0TTQ2NjdmRHly?=
 =?utf-8?B?cE45R29NUlV4WkZvNFNpU2RacmpQWHIrb3h6QXFDbTYxajJrNGFnbVpEemky?=
 =?utf-8?B?cU0zWUZHTUw4YkhkNWVlVFdGVlU2K2MrQnNya0NuMStOVXlrS2YwbzBRM084?=
 =?utf-8?B?L0l5TE1nZEZzbG9PakFEekhvekVXU1h0K1RBTkJNSUxKdGFGci9MeUNjTmJM?=
 =?utf-8?B?K3BZYUpmMndScXZhcFJkNHBsOEErRDJ2WjFZVTI3QWpVUG8xem5mWkJISzkz?=
 =?utf-8?B?THhCaURUcDdRenFSaFNTQ0w2cWVYNnpiakZwZ1A3Q3k1VnlaNDBuTm5uODkv?=
 =?utf-8?B?Tm1XQ3c1RXF1NHo1MGFxb21JVnBKaWhQOGNhRU10UVBodmJKazFibUt2bGZD?=
 =?utf-8?B?TUhZdXhwMVRoNEFtaFlYZzNDYkZiR1R1c2kxZEJoN3pvRksrMlpKMW1RVnQ5?=
 =?utf-8?B?UFZkRVpKUGVsOUZ3RzdFd3FwK2JyQUxsYWNWU3h5VDNjV1dtbmc4NEpIZEE5?=
 =?utf-8?B?Y05zWElJK3VZQ3NBK2k1ZE5HR2dleXRZT0NvK2JicEJndFFsRGVQbXF2VytF?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCA0E54ECCFA4043A1D5EA08A848A5F0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 050730f6-33a6-4dab-b549-08daf26932af
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 17:44:46.1898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBc7xtZzTJqErhAy2NsWUQ/T9x5ExNZM++JZMSkb8xlJ87R14Y1LNxodnICm4zKBuOzEj2l6uUyKS8l/yCcGlGZaltt6SZCw3OZP3bL9dy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1540
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Stephen Kitt <steve@sk2.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Jason Yan <yanaijie@huawei.com>, Souptick Joarder <jrdr.linux@gmail.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAxLzIwMjMgw6AgMTk6MjYsIFNhbSBSYXZuYm9yZyB2aWEgQjQgU3VibWlzc2lv
biBFbmRwb2ludCBhIMOpY3JpdMKgOg0KPiBGcm9tOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+DQo+IA0KPiBJbnRyb2R1Y2UgYmFja2xpZ2h0X2dldF9icmlnaHRuZXNzKCkgdG8gc2lt
cGxpZnkgbG9naWMNCj4gYW5kIGF2b2lkIGRpcmVjdCBhY2Nlc3MgdG8gYmFja2xpZ2h0IHByb3Bl
cnRpZXMuDQoNCldoZW4gSSByZWFkICdpbnRyb2R1Y2UnIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBh
cmUgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uLg0KDQpJbiBmYWN0IGJhY2tsaWdodF9nZXRfYnJpZ2h0
bmVzcygpIGFscmVhZHkgZXhpc3RzLCBzbyBtYXliZSByZXBsYWNlIA0KJ2ludHJvZHVjZScgYnkg
J3VzZScNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+DQo+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+DQo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBDYzogU291cHRpY2sgSm9h
cmRlciA8anJkci5saW51eEBnbWFpbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogSmFzb24gWWFuIDx5YW5haWpp
ZUBodWF3ZWkuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4N
Cj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2UuYyB8IDggKy0tLS0tLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvYXR5ZmJfYmFzZS5jDQo+IGluZGV4IDBjY2Y1ZDQwMWVjYi4uY2EzNjFlMjE1OTA0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMNCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jDQo+IEBAIC0yMjE5LDEzICsy
MjE5LDcgQEAgc3RhdGljIGludCBhdHlfYmxfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0
X2RldmljZSAqYmQpDQo+ICAgew0KPiAgICAgICAgICBzdHJ1Y3QgYXR5ZmJfcGFyICpwYXIgPSBi
bF9nZXRfZGF0YShiZCk7DQo+ICAgICAgICAgIHVuc2lnbmVkIGludCByZWcgPSBhdHlfbGRfbGNk
KExDRF9NSVNDX0NOVEwsIHBhcik7DQo+IC0gICAgICAgaW50IGxldmVsOw0KPiAtDQo+IC0gICAg
ICAgaWYgKGJkLT5wcm9wcy5wb3dlciAhPSBGQl9CTEFOS19VTkJMQU5LIHx8DQo+IC0gICAgICAg
ICAgIGJkLT5wcm9wcy5mYl9ibGFuayAhPSBGQl9CTEFOS19VTkJMQU5LKQ0KPiAtICAgICAgICAg
ICAgICAgbGV2ZWwgPSAwOw0KPiAtICAgICAgIGVsc2UNCj4gLSAgICAgICAgICAgICAgIGxldmVs
ID0gYmQtPnByb3BzLmJyaWdodG5lc3M7DQo+ICsgICAgICAgaW50IGxldmVsID0gYmFja2xpZ2h0
X2dldF9icmlnaHRuZXNzKGJkKTsNCj4gDQo+ICAgICAgICAgIHJlZyB8PSAoQkxNT0RfRU4gfCBC
SUFTTU9EX0VOKTsNCj4gICAgICAgICAgaWYgKGxldmVsID4gMCkgew0KPiANCj4gLS0NCj4gMi4z
NC4xDQo=
