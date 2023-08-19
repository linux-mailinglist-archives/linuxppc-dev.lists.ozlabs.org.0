Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96344781887
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 10:58:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g8liDAg/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSXj33J2xz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 18:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g8liDAg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSXh86cPRz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 18:58:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHmN5USxptb6excGOLkPkDx5/g34FZ6yf7/pbUHmk2YLwopSJDBpf1oIAxPBZjbqukGL4kGBcwnzw7rt2NnWQlO4PD68bmNZSws0mrUrwhNfSYaGOgrkx1JvK50tb9aujFsX0SE4TRuBqsz0fVQ2GGkzRrr7gcllF3qd5slrrJHxtDoaBwZIx6phATFOeDLzPzsICCAYSUpSPLaYJsTHj6UN9BDiYCh8Qaf1gIyj0QLGEsSOGzp1fkoTvEILh+wYpZUWx7ZsBdywxZiuXEIWgcUY7iSSLVQ41zjwaYIivXwZnGiXjg+2CdMPuzdziTNBVD919aXl7EgiyQDt6BDLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZNtWdVYTY2YoSLAhjlXr+qwAE0IsqJCs5aQJoUH66s=;
 b=SugH4YZgEKsEriS6SuSB6K4ZAakkrBeiKzKfrNlmyPhSPHxQVn2O4sb6e8Nm1/bvjxKI4YgoTvYtFM1bCiPdkQc6gHgs6niUGCfRcdLaPA0OrW1QCUDv5NPnZArfbj6+nRuDYHzqfXB6XoF6RLOmU5im6KAticmWeKfJ7jSftUeNNiCajiACjmPS0pRYi+/5794tq/UhFxQOgDPU2oOqhdJox+174iUFg+TyxF58Aq7NZSZpxwNEF5wf27zgtfksX/BIjreCCEX7y2fZ1RqBYj1J0QfAJybLiGucts2lC5CHcaFYza1eJuI8x2+9EnsDtm172thAxwklMvc0hxkX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZNtWdVYTY2YoSLAhjlXr+qwAE0IsqJCs5aQJoUH66s=;
 b=g8liDAg//DGpm2rHmHcdYfJqJK2T0Ar12Ofx5NZr867kr+XjXrIfQa5pLF9cHu7rApt9w7D3+OyOrHE/sa3S6F2Qwqtj6dc8FZg1Aqissb3Rc69JAAcNvpOuQzLVdiS0KjAvPL/kUI+d3ST/QFup0CLCdTwnfXyPOViZIqH1cVPdPQexVtvrS2OF7yNnfbr4XyVC9fI2ZiXrHRFocAo4YhdvFlOlPta+4vTddDD54mQfg4RwvpkZeIAdXD3vOCQZ4uvoVHcyB0po0uibbN4j30eQKtrCM7yGqoz+/sd8i9SsXWe895LoNvPYe/KNVAuiZgq0G+mjppqc4CjTHFMu+g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 08:57:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.020; Sat, 19 Aug 2023
 08:57:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, Herve Codina
	<herve.codina@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 27/28] ASoC: codecs: Add support for the framer codec
Thread-Topic: [PATCH v4 27/28] ASoC: codecs: Add support for the framer codec
Thread-Index: AQHZ0fKx6Q8G+r1ooUuBXJw/eV+6Fa/wsKGAgACh4oA=
Date: Sat, 19 Aug 2023 08:57:41 +0000
Message-ID: <b94a3ea1-cfb0-f132-f16f-f56f2fd5628a@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <cb734efe2eeb89cb1afbf01d3625181537e2850f.1692376361.git.christophe.leroy@csgroup.eu>
 <e1ca6c2f-92e4-6dad-79ec-71cf66e9a385@infradead.org>
In-Reply-To: <e1ca6c2f-92e4-6dad-79ec-71cf66e9a385@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2179:EE_
x-ms-office365-filtering-correlation-id: 9688af63-2783-4bb8-8989-08dba092586f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uuMDVK08S1pVJLvI2UYaacgAWCk2Q/P4PVJVZWZ7QnTAJAADJ6LIHQUl3kR9eSsmVR66PiXQMhkhmTyQyyXdJKYw7/Ukzlfy7xmFcnYbqTzKdzGge5Yhw5idEJFXp0gDPL8GIulGKm75pDta5Blo6lZDJi8nB3rvi+PrCsbsE7xnXuoSzouMnBH2kVj8/pYnTuFq67JEBwUpzEx7urW9IvmQOdUcpKV+0y2LAKRuj9AsfnSUvsM2RdEFLmk1qRdVlIVOCkuhdjM1m9yUUri7rWY1q7uc6i+nyYBAv67CZds0bBV4E6Ep4RsM5kUK9Lr6+Iybd2/No/85hNcnsCjbywBvOYE6LrT1siORh0crnpoMQFOuvm+Lq9nn19FGySTB+YLcI6Z5inkVPUyhsOVMgNkz91xyWYOas1833OMXjBOSnbt7uyDLSiHE+b19AY8MOvTnYfQKXZn//ZKfkGZJVT674P6z9tZYf2ZGdnGRoeb5o1Aj8cDcdfg9cracMKyyYSSKKj6Zj0zPtaRdW3ahiIuD7ZyMcXeovlc5lxutMtxO9gG3XbujGosYAwsPlNPzC7j13MJ5n951ZWr8hNXxu//5G520ey7YuUO9DBH1etDEHzqMmLQuvUO5ajZmKvo6YD6GIU8SJyC2SJLNnHGZM0hFtcYermkAamxrIbWHPPPXT5+v9RZsvfMtBQ12yZbc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39850400004)(136003)(346002)(451199024)(1800799009)(186009)(91956017)(86362001)(76116006)(110136005)(64756008)(44832011)(5660300002)(2616005)(41300700001)(4744005)(316002)(2906002)(66946007)(66556008)(54906003)(66446008)(66476007)(7416002)(7406005)(31686004)(8936002)(4326008)(8676002)(478600001)(31696002)(71200400001)(6486002)(53546011)(38100700002)(38070700005)(6506007)(122000001)(6512007)(26005)(36756003)(921005)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?KzZ1VnBIcnpxbTVkYTc0WHM2RGIxVUxPOW1IRXlwZ1djREJGdjZIVy9nSHlH?=
 =?utf-8?B?eEFNVlJSOVhMMDVycEFsUyt4VS9mOFNVTUhBbytpelN6UVhUN3pNQStjdlJH?=
 =?utf-8?B?S0ZacG1BTHV6UHZQWEl2dkdETXA5emN0d2h6dUd1WkRQUFNyWEJrMGI2T1pO?=
 =?utf-8?B?aFRZbmdtUml5aWZ6K2ludFY5dHJxTEcrcnkwUWR1TkdJamxsUGR1K0FOM2sz?=
 =?utf-8?B?K0R4TC9MNVYwMFc5bGtDRzlBVm1uaVZlSVlLNUZTUENBRW1aR0Mrc3I2Z3dT?=
 =?utf-8?B?bGlZVDZRbS9ReStHTFNDWWN1TDNYUW9DanowdzJLbEdxeFMvZHk1U283c2s5?=
 =?utf-8?B?a3NKRFF5VVo5eDZMaGNnN0E2MEVObU4vZUM0dzhIcHIvb09pNUU5TFh5UUVl?=
 =?utf-8?B?blZ0bElhRDlma096TDVJUC9Fa3gvL0tXZzl3REFqcGo2UGE4YllJS3BQMGt3?=
 =?utf-8?B?aWdyTGpuN2E0Y1gxTlJOUVVzMmVEelZZVlRZaHJOM09qVjk0Wjl4WjZCWDlp?=
 =?utf-8?B?VGJyTWZaaTJjRVBBYmR4cnJCL3orclFoLys5MVVFTUlMZnNuUUhEYytkR1Fk?=
 =?utf-8?B?V0g3Z3JYaUVGVGpLWUlyVjdGTUpSWEY5aTJ6TVh0T3pEUzVzR3BaRGhzZnNO?=
 =?utf-8?B?WVYxZUMyQXZML1FOci9YMVVsZ2p0TDU0aFdvQUxjWDN6cDBjSzM4UkJVU2N3?=
 =?utf-8?B?RW1aWHY2M0xVazZNdWsrc1UweVp1WVpXK2Y5dkdvNzZwa29pUS84K3JzWkpz?=
 =?utf-8?B?RkpLTko1dVgvbWJQcWt5N1JRTm14SU9Pd1BNY1ZPNUVvRGR6VVdreGoxdTJQ?=
 =?utf-8?B?TTRJM0lSOWUveGE0V2JKTk5aT052NnM5ZDVKckNPWjJGSStLcU1MU3g3T3ZY?=
 =?utf-8?B?eVJwN2JlR2gvdjhoOXQyZHM0OEpUQ3BpVElzTHo5OTF4WWo0aHJrelN5WXNl?=
 =?utf-8?B?aENBaWkvTUNGS3JETGNtTTRaVXJXdEoxeWtEMVp2Tkp1ekM3bHpTaUxRd1RW?=
 =?utf-8?B?MnNoSmpCSHMwZ1ZKT0ZTZExZYWFUSDh0WmxTOXdVTmx5UEh1dXl1RGh6K05Y?=
 =?utf-8?B?NkNpU2IySFA1dGo5YlRVTVlrODl0NjRtcnl2bStrdk5jVXdaQlBmeGErNnVy?=
 =?utf-8?B?NEsvbjdjOVBkcUVqemxJSk9FcmRHcE9SYlJJWkNiZ3FwWHFhWDJaRkgyTmth?=
 =?utf-8?B?SlZZMEcweEhNMXdLcTB5L2NYT00zZDF4M1VIT1A2Q1F4MnJ3N3JDSGZnU2s2?=
 =?utf-8?B?TVdXWG5Td3VGalFEU0U5OHROWUxOYkNLaHVZdmRiajlIcVE0TlN6b3FqWXlP?=
 =?utf-8?B?OGVMMmgwSitDdktUMWkwK28vM2hoUHdLSDZzRHN2NzZJQ0lhR21zZDdPT2xG?=
 =?utf-8?B?bmFud2RTV1NMeTZ5NzNXVzNqcFJaVjZYUmhBTVVQdVFxSXZEcVlPUzJhUGly?=
 =?utf-8?B?V3RhWWs5TzQ5Z2RCeEhyOXZMZWhPZUJLcDcwcTdwMjN5Sks2UDJiRjVjU3dU?=
 =?utf-8?B?eGo1Y0g2Tm5jQlRqRUNaYmtHbDVmNVh1bjNicFBYWjc3WkJvK1Q0dUxCVHk1?=
 =?utf-8?B?RU9SSEtzSVBrSCtzUlJQWXd6dXVkMmdXUy95L2o0OXJROUd3SHIrb2RwTXV1?=
 =?utf-8?B?aFhjSjZ2eXYwcGhZRU5ZcFNIdFRtbVNzTDVtUndUOXFGUDgvY1ZNUk5iOFZt?=
 =?utf-8?B?V3RCRHBsaC94Q0VWT3RpazUvYjN6MXZlTnV2ZEVuYTlQczNtUGdIMWdQMkVp?=
 =?utf-8?B?a1hvc3NsSjFlZHBTSG1YRzFBWUcySVBvcjVtMW9MSEoxNnZ3bCs1VTJxS1ZI?=
 =?utf-8?B?QnZPMEJ2R2VvYUlmVDZyNjNnQXd1UkZDQldNUVdlUmlQMVV3NVlWbEJkOEJP?=
 =?utf-8?B?QS9EckJpMmtiZ0JLS2Jzc1NFQkRRQW1DUVVlTUNHVWlqdldqbHB1VHowdEp1?=
 =?utf-8?B?L2l0NzJWZXpSbHp2T3U5Mk5MVlNiV0xmd1RWdW5veTlacnNJcUpDSk52YjV3?=
 =?utf-8?B?NXFPYkJGZ2VMSEtJWlp3b2lJVllxWTFOeVNCU0g5Vm9uS2dVRkw5dXlFdlgx?=
 =?utf-8?B?cE9Wa21pdTV1MTc2TUhiS1lSVzByczgxNzdwZHpMNDFmd2VpbERaWXNFdDJs?=
 =?utf-8?B?M1p0YXN4SEYrd0U1Sno0OEtOdWRIZmg5ZFZ3YjFrenFOWHdRODc0YjEvZkY5?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6EAE7A29F564E42934C28B6D9B005FA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9688af63-2783-4bb8-8989-08dba092586f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2023 08:57:41.2415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mGPl7HvhRiv+eqvSHM4uV0BzothU3CYv9MbJs9MrUFdEWNMJNeGtqLJNnL6XM56jl+pZOeLUZmJyi9xewl+KMhvo+8wsLtuY8KbbvGBG7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2179
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjMgw6AgMDE6MTgsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBI
aSwNCj4gDQo+IE9uIDgvMTgvMjMgMDk6MzksIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiAr
Y29uZmlnIFNORF9TT0NfRlJBTUVSDQo+PiArCXRyaXN0YXRlICJGcmFtZXIgY29kZWMiDQo+PiAr
CWRlcGVuZHMgb24gR0VORVJJQ19GUkFNRVINCj4+ICsJaGVscA0KPj4gKwkgIEVuYWJsZSBzdXBw
b3J0IGZvciB0aGUgZnJhbWVyIGNvZGVjLg0KPj4gKwkgIFRoZSBmcmFtZXIgY29kZWMgdXNlcyB0
aGUgZ2VuZXJpYyBmcmFtZXIgaW5mcmFzdHJ1Y3R1cmUgdG8gdHJhbnNwb3J0DQo+PiArCSAgc29t
ZSBhdWRpbyBkYXRhIG92ZXIgYW4gYW5hbG9nIEUxL1QxL0oxIGxpbmUuDQo+PiArCSAgVGhpcyBj
b2RlYyBhbGxvd3MgdG8gdXNlIHNvbWUgb2YgdGhlIHRpbWUgc2xvdHMgYXZhaWxhYmxlIG9uIHRo
ZSBURE0NCj4+ICsJICBidXMgb24gd2hpY2ggdGhlIGZyYW1lciBpcyBjb25uZWN0ZWQgdG8gdHJh
bnNwb3J0IHRoZSBhdWRpbyBkYXRhLg0KPj4gKw0KPiANCj4gSnVzdCBjdXJpb3VzOiB3aGF0IGNv
bnRyb2xzIHRoZSBzbG90IGFsbG9jYXRpb25zL3VzYWdlcz8NCj4gSXMgdGhhdCBkb25lIGluIHVz
ZXJzcGFjZT8NCg0KRm9yIGF1ZGlvLCB0aGlzIGlzIGRvbmUgaW4gdXNlcnNwYWNlIHRocm91Z2gg
YWxzYWxpYi4NCg0KRm9yIElQIG92ZXIgRTEsIGEgbWFzayBpcyBwcm92aWRlZCB3aXRoIHRoZSB1
c2Vyc3BhY2UgdG9vbCAnc2V0aGRsYycNCg0KRm9yIHRoZSB0aW1lIGJlaW5nIHRoZXJlIGlzIG5v
IHNoYXJpbmcsIGVpdGhlciB0aGUgRTEgbGluZSBpcyB1c2VkIGZvciANCmF1ZGlvIGVpdGhlciB0
aGUgRTEgbGluZSBpcyB1c2VkIGZvciBJUCBvdmVyIEUxIChIRExDKQ0KDQpDaHJpc3RvcGhlDQo=
