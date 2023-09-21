Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5237A92C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 10:46:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ShA68Qgw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrpsh2DLDz3c5S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 18:46:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ShA68Qgw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::628; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrprm336Pz2yW4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 18:45:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDAbc84tXUm2pPKm+LEdBaJE98nyA/m7pfaSJBi3VJbyiB0if+xpaJ74H+7MWx0Tl/+NUdiTFRYRxW9BOex4JD63IcguFdhKzjeZqn8vGWTLkaKYA3ZebikbXcDP6RgYMQJESf+GWna1tAH+m6EfpOrhNRR6Cf6AUjfwxC1Dksb6IzL/bk4RcbbeQNsAHRNoPuo6c1ZGCv3Dz90WnON/j/DvG2KqSppZln2nJc3hQ/lulJZSRK50lZ0Z9K2ogyY1hgKKACZCRxx/j3EhkPmGwXlySgdV8BSSVU/Xl5b3LUFZTnNdacBLj7AW6HCjoNGz4i2zBX8CoWKP7xndm6AC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh2Do4rFAcFgvTvnmy818oWcamd0W3Mx0d7SOTy/JiY=;
 b=LCzxlmogVRAkDuhPCvmr7Oo0DX0Ciw6x29AKbAJZfPoiwaxchb0bHsthWFBcmZbJtWLrr0fc6dh9c14MqOdSW8+KDiVRyLy67H/KmETllw4GLkxWeOrwv2WmgtYgb5Lm9caly4gHel2vV7tlmqEi3aE1jEiNwGOpEpO1UjxXIxe4TrVFS+HkBLSbut+X0suJFpEA8qqHG1gpp/KFbH5XzY9B5h8GpOyjwjmYmo+9mEueFWzk0eeepA7K64EwEoF3Z2zNbBxqcRP9h4HZc9T+Sfzayhd4fzT2N3yONHWsW+PZ09yGpaouXhvgC7bobbxcrtIecC0Nk9ZQRfHCWCHdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bh2Do4rFAcFgvTvnmy818oWcamd0W3Mx0d7SOTy/JiY=;
 b=ShA68QgweUI6op6jKvTxumzvVJGQw442e1CFEGjzj2GQLSNtJOiP11NJ6Z0Ofq2qKC/ttahCb6kz6/tbkXZlNSFruNmMTARO4i1mMyGS0UZnUeS3OeeXwZ+VvM3jKiaOVFzwaRXvCi9d5SWA0ZeDaKa5KWHNROair/Rf/c9ux+jqcT4LQM9TOZjqJjutx5qobxH1f5meEYVCfVbjkeIkpO9hII4z2x1y1S8gSRadidlTcRQtOR/8G1Q9J9sdPGgjd2/IrobeLHVCWZQqNuaNCtvrXWNOEV/+3Va2brkoVB1AkwNqUY+UMpZ3h/8A+sVjgbZt9nkL3qYwcwKfGAPdyA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 21 Sep
 2023 08:45:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6792.023; Thu, 21 Sep 2023
 08:45:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Thread-Topic: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Thread-Index: AQHZ5WH2BcxmfZPRPE6nid3HeITn7LAXfukAgAAKBoCACLWPgIAExp+A
Date: Thu, 21 Sep 2023 08:45:18 +0000
Message-ID: <5df13bd2-fde8-7bac-ce0e-845457681c25@csgroup.eu>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101444.225809-1-herve.codina@bootlin.com>
 <20230912-overplay-donated-080eb97803d6@spud>
 <992a2b31-e21f-eee3-8bfc-a65b69fe5bd7@csgroup.eu>
 <20230918094919.03835d40@bootlin.com>
In-Reply-To: <20230918094919.03835d40@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2146:EE_
x-ms-office365-filtering-correlation-id: 5c4ab9f8-597d-48a1-d011-08dbba7f152f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hgcq9teP2hLStIB4k1L6PFAzsrg1OQ1xEq9dThok407N12UNnIIYdQfCt71eME3/yak+TnykxaPs3hFcOTQbgsgw7ctD1sdlJDo89eQledX0GVQy9bJF2ZiI22eMSfnAtEr9ENg/vXcRVxRUn/62lnPfyvYy35o1XeOwM7GEHnY9VCXb0w2aYq6GSI9SCy7gD2bcRgvu6U3OLYPvr5OBgBm3PS31fGlqABl6ZifLnOVsQu6rpBT7c887gidZDAwuWR8cMn3Z1zHtujlGzjvCRQay48JpwEVFvFb+T+RW5n/LKRJv11Oo1dZ259momS4jLkXi0xuMshyl7C95/lu0ec2ik6y513CTSoRMWiF8K9U3WBu6YRrba+xzWr9pgmX4aqJJrCXczPu6hDSzy+CoOQKP6/Q1yPillR8Sh8/WrO/0V4wMk7OxUTsRBjd8EaDNk+/l4iwBPJkic0DrLDdiHlIEIG/hEQj6rMEL1EvKgPPN6PPnW924oWYvLSyViV9QAyeacn13dQKHx6VPlK1jg2eppuZv+rxPujxRJgWkXjF/SvJHvEfyDK8ELuLqsWamkZCsCz22jM9ziwwcNU/A7g3nclZOcUA2D5GkbAYcSpV0BaLZRSSCSoM5SV0T+m5yG9D+Z8mzAXGwtKIviMLpR6iEsy/USJnIQ5+wzbRQeP5jG73zgSOUL7WRY0//v5Mz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39850400004)(346002)(366004)(451199024)(186009)(1800799009)(2906002)(31686004)(5660300002)(44832011)(66556008)(26005)(6916009)(316002)(54906003)(66446008)(7406005)(7416002)(41300700001)(76116006)(66946007)(64756008)(91956017)(66476007)(4744005)(478600001)(8936002)(8676002)(4326008)(71200400001)(6486002)(6506007)(6512007)(36756003)(2616005)(122000001)(31696002)(38070700005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L1JuUWFRTkRvL21YOWJWbUR0RE82N1JuTVZJSEhQUlBKSmIwK2NIc0F0amYw?=
 =?utf-8?B?TWVGK21aRXY0SkdyaGFsZkVMY2dFWk91a3ZJWTZwampyVEtIRExYc2hvSTkw?=
 =?utf-8?B?SStOdnFLZTgwWjJQM0NTS3cxR1pmOVBtRUNITTliUEhJeWFLZzR3YTZHczdx?=
 =?utf-8?B?Q1c0K3piSlpNdWZ4YjBiYVV4c2M2Ung2WUFCa2xIRHA0d1RMQ1I3cFBvYmRz?=
 =?utf-8?B?U3BmU1NOdHMrRWg4S1l6cWRWMk9ZekRXMlJkbHhORU1SbWI0RytycERPMWxN?=
 =?utf-8?B?V3BjY3I3ZnNzQytWNzZSNGp6Y0lGOTBqMFJzY1hxSU5hU3NhQXJpSnJOMmR3?=
 =?utf-8?B?c3JoL3Z2WGhHaFN0azFCeHZZWnhxU2tVTTAxVGRQZHJvTVhHVmlQa1E5eS9K?=
 =?utf-8?B?czhjamlXOWZCdFVURkljdExVTTQyR2VxOUdYMmRhNEZKTmFydWdzQ0s5T1JK?=
 =?utf-8?B?dUo5ZU1BMTBsK0JVSEZoUll0dGQ1MFBORnhxOGpnWU0yU21rSE9aVmpoRVhO?=
 =?utf-8?B?YzNDMFNpaUJ1ZWt2S2ZSRXpLOUgyWU5lLzZHUjNlK0tUT3lRQVZoUHlDYVNt?=
 =?utf-8?B?UE1uSXZjdDN3clBsZldCWWs5YUxHR0U4bmZMZmU0eGVnSm44dUdDcDVjTUgv?=
 =?utf-8?B?dVpVQUY2UWUxSzdoaWdEZjl1bnBPU0FocmIzT2Z1TkplMHJEU0ZjemMwWE05?=
 =?utf-8?B?YUV1R0Nja1U3b3hiRVVBUyt0OWI4TlUyVklFRWpXSkcvcTQ1Y2krQjhYMU1q?=
 =?utf-8?B?TWhTSllpbzFzWEJ5eFUwR1R1a09Wb2R3MkZsbWdBdFpxTmJrUFhxdjVjV0VQ?=
 =?utf-8?B?Q3FsaGVDT1lyaGVmcUpvZkVJTEE0MTAvcjJDVDRyRmFFNmJtRk5nT29uQ1l2?=
 =?utf-8?B?SVJOenlOZnE1VHZyT2Z6ZTEyb1VsOVdlSnhlaVNod0laTHZmTUxUcWc4ejdh?=
 =?utf-8?B?M3U1UHZ5OXpYZzNscmU5SnU1S0t1a1UzbTNQYXliQ3Y5RlpsU0M3WDZraXdV?=
 =?utf-8?B?SkxodnZsdi9IRTE5OXdZMnMxOGJWTGFVaHBiMFIzby81c0E5ZU9Yejh3M21G?=
 =?utf-8?B?R0lFWUpJV1JHd2pPdVZBa0Y1RE5TenAzLzQrU2JRTDBKa0JlTStLQUlDWGRj?=
 =?utf-8?B?NGxySWF0WDh3L0dKNVAyR1hsRktpQWc4ZUUyZ3hZRnVOdDhyQkhRNjU1dlZU?=
 =?utf-8?B?UXdtWnhFbDFzZUxoRmVaaGVDc1JrV1B3VVhRb01yMCtzL1FuRVdVRG8ycW45?=
 =?utf-8?B?QzJFc1YvaDNvV3RxalhHSktScXNkV3lKT3E0QWY0Mi85emVFQlM5VHJvZytL?=
 =?utf-8?B?YXJHM25jVmIyQ09aZURKM2VCRDRwV01LQ3ArTDJ0SXh0UkZGUWZIM3ZoVE5E?=
 =?utf-8?B?R1I0RVRrSitTOHd0REJ2cGZTbXlrRDZQN2dKSFRZN3JpMUxLc3pCb3BxOGZT?=
 =?utf-8?B?NHJvdTdpeG16d3hHbDd5WVc1NlFJQjZ0SFp5NkY4NDdRdkRHU1E4cGg5Y0g4?=
 =?utf-8?B?V1VMZGdUbkdIeUZ6L3YwTGVrN3lzZ0lxRXl0dXJOWk1WZ0RtOUV3NFl1RmY5?=
 =?utf-8?B?bzY1RzFRTWtSMUUrQUgxK3ppV3g3ZVhGUHVoSXc5OGMwUFVGYTR4Sk1JK1Za?=
 =?utf-8?B?WlNRaVpic2NvVkQwOGE0bGtsdW9BS05ZYmFzMWg5Q0kvc0I1MERnSHRTQnFO?=
 =?utf-8?B?VEpvTElMb1AyM01IOGVRcUJWY21TT1BMRFpqbkJlMU1DczVsSmRHZGFrUTdD?=
 =?utf-8?B?WUp6RFdueE4zSkYwWWVucHVIcXJiSG94RmlJajNvTTkzVU9nQ0VOcnQvUjY2?=
 =?utf-8?B?VXQ1dDRFc0lhMnJZaVFXeXpnVVQzaUhjTFVDZTBNOGZDQVJydWk0M2FGbDZp?=
 =?utf-8?B?ZWZmUlZXRHZla3UxZ2xOOVJ6dGNvaUZVS0ZpOTdMR3Y1cjNCM3FLNlRxbEFY?=
 =?utf-8?B?M216cVM5cGUzODNZTHNUMVhheTZGU3YwbWNOMUVHN29jRERlSFVaNjF1TnBx?=
 =?utf-8?B?b0pGUlBBNmVBL3Z6Mk5GYzZacUVVaU10Mzd5V0VpdmlBcUg0aHFwQTdnQW5Y?=
 =?utf-8?B?dkIvOXNnN3VOM2pGSW1SUjFtenl0eDJDaWEwenBLNW1CZGs5ZVJzVmNjWUZH?=
 =?utf-8?Q?F6FjN1XD/pPiOFx12GtJdJK3h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF15371D09336447B289FD7649FBA4ED@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4ab9f8-597d-48a1-d011-08dbba7f152f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 08:45:18.1919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XY574Do+PbGMGRy5iCtt4aQkS8/kfQ+FjvUUjMIYCzzAOe3GqVVHl79OnTRJ9L0zXbBCf1cdn08u+JU+AQui0c6oByQ7ho6diH6f+Qjikw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2146
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.or
 g>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor@kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSGVydsOpLA0KDQpMZSAxOC8wOS8yMDIzIMOgIDA5OjQ5LCBIZXJ2ZSBDb2RpbmEgYSDDqWNy
aXTCoDoNCj4gSGkgQ2hyaXN0b3BoZSwNCj4gDQo+IE9uIFR1ZSwgMTIgU2VwIDIwMjMgMTg6NDk6
MjYgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
PiB3cm90ZToNCj4gDQo+PiBMZSAxMi8wOS8yMDIzIMOgIDIwOjEzLCBDb25vciBEb29sZXkgYSDD
qWNyaXTCoDoNCj4+PiBZbywNCj4+Pg0KPj4+IEknbSBub3QgYXUgZmFpdCBlbm91Z2ggd2l0aCB0
aGlzIHRvIGxlYXZlIHBhcnRpY3VsYXJseSBtZWFuaW5nZnVsDQo+Pj4gY29tbWVudHMsIHNvIGp1
c3Qgc29tZSBtaW5vciBvbmVzIGZvciB5b3UuDQo+Pj4NCj4+PiBPbiBUdWUsIFNlcCAxMiwgMjAy
MyBhdCAxMjoxNDo0NFBNICswMjAwLCBIZXJ2ZSBDb2RpbmEgd3JvdGU6DQo+Pj4+IFRoZSBMYW50
aXEgUEVGMjI1NiBpcyBhIGZyYW1lciBhbmQgbGluZSBpbnRlcmZhY2UgY29tcG9uZW50IGRlc2ln
bmVkIHRvDQo+Pj4+IGZ1bGZpbGwgYWxsIHJlcXVpcmVkIGludGVyZmFjaW5nIGJldHdlZW4gYW4g
YW5hbG9nIEUxL1QxL0oxIGxpbmUgYW5kIHRoZQ0KPj4+PiBkaWdpdGFsIFBDTSBzeXN0ZW0gaGln
aHdheS9ILjEwMCBidXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8
aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4NCj4+PiBNaXNzaW5nIGEg
Y28tZGV2ZWxvcGVkLWJ5Pw0KPj4NCj4+IE5vLCBJIGd1ZXNzIGl0J3MgYSBsZWZ0LW92ZXIgb2Yg
dmVyc2lvbiB2NCB0aGF0IEkgc2VudC1vdXQgd2hpbGUgSGVydsOpDQo+PiB3YXMgQUZLLg0KPj4N
Cj4+IElmIGEgdjYgaXMgc2VudCBJIHRoaW5rIHRoaXMgbGluZSBjYW4gYmUgcmVtb3ZlZC4NCj4g
DQo+IE1heSBJIG1vdmUgdG8gcmV2aWV3ZWQtYnkgPw0KDQpZZXMgeW91IGNhbiBkbyB0aGF0Lg0K
DQpCZXN0IHJlZ2FyZHMNCkNocmlzdG9waGUNCg==
