Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A369B0FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJHQS4j2dz3fZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:32:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fwCCIq+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fwCCIq+J;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJHLD4v9lz3fRG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:28:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwPk4IGdZVeZ35W8ebHnnvzywhBE8f5NQCXw7xhuKkJOIiFGbW96oFuKfoYcTFXSrEyRNff+XE9pq4MT59Nn+dxwRhC321gEPlqsea0VpUz6gYEH2nz8qUvpyYN5Hd+sb2VG3JM/dss9R2nmdyjq26l2We2ek+UDAaFAy+6vbuZbsax2/kR8wXra+ijJFHnGVVGzY/ArBRZVXL4WTjldmwVrYxYhUd/Pamrb2ryB2fFTqTCtSjQg9xFYv5jJJevh+ybyunsu3sUrwK+zlNhuIQsWf6zN3WgkcFtHOYaLz4GT3qw5LF1E2aF0amZ/B9Rh4eEuOI+Q21nKyw02ACMSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di2OMtmDiHYw36T+XPwGVxu67VBf2REjRrTIhzywE3Q=;
 b=K6RlcWqhEN/pmTl3cOiI8z4Buu/JXTkLFFjUMOdfOoqK65wT2T4Bg3E023TVNc3nMX75q+CtLEIwq130PmlubXxNijdN18O11/Uo98MJTKGSRoeQ4mmWkBh4RlIMPdaGRxOEncEEpTmCNtF67jOFCbX7FCR/5Etnr3dTBGIFFv3S4Y+0jNRI/c/iNkiQEvRMiCGoP4Lbt/rBUyUZsLKu1EAu4UEoUyzupB6kMocivhDpdsSnsqJXduFQLz5Gh9/fcfpkO4sgpie9Bt3LqdXu9VEHW17NPYt8B2PeApwvqIbRGyiwkdGJa3b2ue+3vV6J7WaOT4sBxPo9PnX+vdnH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di2OMtmDiHYw36T+XPwGVxu67VBf2REjRrTIhzywE3Q=;
 b=fwCCIq+J0Mq47oxX2W0fYbjWdUlpQQcIlBX/2Cy4HlBXJNwN6xMgJ6zyiDHwVYpK/zGwn4yC4PvLEDoJutyWKnKV9DWOp5f+bcyg7/jwC6hIh3Z0fd++aXpl2cE+mHtC1eQV2/O2Cavxjd664p3I3nez1a0ELOgL1NBDQeEis0t3xs9LVhq3Y2413HKS3Zk3g03qiH3/XC1VsG4dBJZO8k4NIhjsin1IjYsop6gN4bUxnjwSfLxLaN1VKH7hxnM6bmDX4hzVnP5e97sSOy/yqhzj6Tr0xNpFAxosbb0bfhHgJge+zm2MxWsQLZXAVAZGFltt23yvdSXl6IOT5OS/Gw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:27:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:27:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v6 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Thread-Topic: [PATCH v6 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Thread-Index: AQHZQuAceFm1Cq40r0muV0TvGy8b4q7TU9cA
Date: Fri, 17 Feb 2023 16:27:59 +0000
Message-ID: <6c7d3ea9-b300-713f-15d8-9d4ab7833102@csgroup.eu>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-6-herve.codina@bootlin.com>
In-Reply-To: <20230217145645.1768659-6-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3137:EE_
x-ms-office365-filtering-correlation-id: a854f9f0-1e15-454f-8eaf-08db1103eedc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  czwUvZjRJOdQEs8unOwrsch6Nv+R5gNXLB1kPiGXssm0z86pb2tXJ3JX1WhFgG/Ym+hT8LLWowFtjamff4adktljwlIut1pqRfs02joRg3ZVdw6lAQbNvNIWQ6G08G54eTPxC/KOy5whQZvzr9iayEW262VXrFkY2dcb4VMfVcCkPSbFJAvXRG7Guu3iGPoMPSj1ZeupJrjNF/kDDHKFRgscpgmWoBdxKabDOOkPThvcQMgOfpfoYdBBm/Rr3kuDaDt0G8WRSc/ELSk6lpeBX+EGEgxiUz5DLR/czzt7VYXmHcvIz0OrjYwX7KU0FWeZ60Lp+dHk+r0TRO5IEAyrS9TiuPaLBim1ljOcqTHqTC2WxmzvpRmYEe3u+8syFYTTvXf7w+mOq7HX+vdk6B32C4V06tl3G12F2UUP1N2TvN7PK53RVlVLpsfk6/+7BT7Xte5GaTPrDzv5AderUmgbprU/ffGAIPSFP0CbAaoKoQ/RCdSWJXdaWZwvJy2Q/Xx0i8MEE4he6f5hC6ktsd1rciTaHTYuUiq12endef/KAdnHrk82ld+6GgsX9YUiEiv6mK+AMzsD/+A32EwJQXwki7Skcnt+mWPTNX8TCUo5w6c0g5qPZa3+CY2q4T0dWW6WIecN9tWGRJQvFX+9Q407bmmPV/dSnC8+aGuZBdBOG2Sgeui2wEoyCSE2Rz3dZ14adyh0CJhpiBWChuFz0Dnwq82T1vJMkdMXVQCMXWLUWYn11Ujrhbn7ysA9hNVOL+Kupg+uxa5LGR6aGIjLsCwLTg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199018)(2906002)(44832011)(31696002)(86362001)(83380400001)(36756003)(2616005)(38070700005)(66574015)(122000001)(921005)(66556008)(91956017)(76116006)(64756008)(66446008)(8676002)(66476007)(54906003)(316002)(110136005)(7416002)(41300700001)(8936002)(5660300002)(4326008)(66946007)(38100700002)(26005)(6512007)(186003)(71200400001)(478600001)(6506007)(6486002)(966005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VGQ2aUJGMUhMZ2xPclJGYTlKSDZoeEVuRmNzNStDYzVaVTMrY1FwUVQ4K3Jq?=
 =?utf-8?B?OEx5RFk4VlFmcnhCTkJyY0wxM3crWXBtMWQvVUtTb3B2ZkhwSEtyVmh3Zi82?=
 =?utf-8?B?ZEZ4RWRFa1FtODBhZkF5RXNVb0FWc2FQaU02Y25wbzdvZE1qak80bWRGZHZL?=
 =?utf-8?B?a3dBRFV2TDdRek9vZnZEbXNiTnBaOGNncmtvQ3dWaENkUko0SUNWNjBHd1NL?=
 =?utf-8?B?S21HYVpqUENzSzdEb3N5OGVHelp2bk5xUmxsQi9LeDBpSWVsbCtvcXdqaFZD?=
 =?utf-8?B?eWY2NEpQODFDL2REQ1pGMXYyTGkwbjc0S0xONm0wMWJiZmE0UDBOMFVxK296?=
 =?utf-8?B?V3ZDN1VNajVTbE5OejlRdHdqTitXaFZtSXZyalpCRjE5cFlyQU9JOGZYU0ww?=
 =?utf-8?B?SjV4dWNnU0hKNnU3d2xRS1Y3cXF3djVvNW1VYTdTaEtrcXZ0dXM5OTB0d0lz?=
 =?utf-8?B?MzdlZmd4VHRuTnFkbHZOcitNYjl3UlpHQ29iMGRpU21KaUhHUW42UEFxLytC?=
 =?utf-8?B?eGYwNFRsdjBxYTJGWXNKKzd1aFFWRGdqWDJYVit3SlRLNks3Y1ZRTW52NkIy?=
 =?utf-8?B?K0RPSjIzWlhXeHNQK3JzTjh3dmwwc2hpcjZWUW8vajFXOUpTK2pTd01ZVDBK?=
 =?utf-8?B?b0ZHNHUxUk40d1VFZkdzZVZWQ1M3dlYvOG9WUVloZmV4QjB6Nkk5OUc3K1Ra?=
 =?utf-8?B?VzVOZEVaV2Q4b25lekhXeGtOVVMwYjYva2RmbXB0LzJHcE53dFBxUS9saC83?=
 =?utf-8?B?c2hFcitJMFZlMlRDVEFyVzFqZURESDRCTzVsWWNYeWdmeXorbzdYU05RQUNn?=
 =?utf-8?B?V1hod3pSZ1ZXWEt3WGxySms4SXVwTkdzUDFRaTZRcWc2UC9QVjgyNTVKZzZo?=
 =?utf-8?B?YTJHZ3ZVRmdnbXdRa29lZE9CUWlkeFFyN1ZkazlacUs2Ukd0c20vNWRCOGxQ?=
 =?utf-8?B?UmhRdGJoZVN1QXc1YXhaOFQ0NEtacklURVZuK0t5MVNFL0ZncVByelZDb3BU?=
 =?utf-8?B?NFNCRUdoNlh2R3NwN2JpbnRoVENFbm9tdHBEQWRZcHFCSE5DOVFobWpsbXFy?=
 =?utf-8?B?dFRPVGw5RjBCUmZoNUUzaTM2R010OUZKeStucFdaMlh3QVB1aXZFRmdrRm5H?=
 =?utf-8?B?Ti9aTmNRaFZwbW81YmpkR3pnZVdrVVVkdGxJQ0JKYWg4b0F0M25TNUpqc0p6?=
 =?utf-8?B?aUZiajNaYk9zZGRJdzB4dEIyQmhNdmdma3NKNElPOTlPR0h4aTQ0R1h1azFt?=
 =?utf-8?B?VERhWHBVeDE4KzQwa2U2TVRVS1B2UlBtMndOZkY1ZS9COXRLUlMzQUhLdzla?=
 =?utf-8?B?ODljVitIdkZDdTRkTzdwRTdjVE00eVRkeGtJSjNoSXNCQW82aHAralZ0NXF6?=
 =?utf-8?B?NGFuZzBKWW0zdVRFWWNRVElZOWgrbU9STjlwQVRXNG9nOGR0MlpWeStoNzlJ?=
 =?utf-8?B?SHhabm00WnRPelJHZEwxNWZvdlVZKzdib3RvU0t0QW1MOGV3eldRTU41S3Zj?=
 =?utf-8?B?SmNqODNUWlh5SXJaRVF4Qjh1WTIwZGxJMFBBODJjcnluek1zQ2dTLzNoZ3Na?=
 =?utf-8?B?VGdEa2thZXQrSUpvQlU1OEhmdmRINEV5aUpMdHY2OEx0MFR6eDBLSW1LNHdk?=
 =?utf-8?B?RkFtVFN4WCtpSEZhOTJQemtDTnA1d0IxcENWN3ZSenVMRVVReERzKzBQMHNW?=
 =?utf-8?B?QlpiVm5tTkJHU1JPa3BYbkw1MkJzK0RHTThBY1QwS3c3RDZ2eWdTeC81dThQ?=
 =?utf-8?B?aFI3cmVYdkhTVzNHcEFBN1hpajdVUndwbXNjMkw4Unc3ZXlYTHJPUml4dkRr?=
 =?utf-8?B?eDZsZHhNVG9lRHM4K2hHS2ZuaXJEdWZPSyttT0lFUHdURlpzMDhwSmo3K0JL?=
 =?utf-8?B?ektRd3hnejdKT1hGMmxRRlRnVVBGaEErVnB4dGZiditSWEVOWk9RcDBjOXdV?=
 =?utf-8?B?Sm9PLzRzTHpvd0RvOExYZkVFT3kyUUViRG96WENTbVE5YURyTlJiZTU1RUV4?=
 =?utf-8?B?dGZyc1ZtYlNhSy9BZkUyNGt3SXFTUkUrNi84c3RrV054M20wc1FYQ0ZVUTRM?=
 =?utf-8?B?c3RlZmpHdnkwVkNPQlZnWnp6ZjNHVVVUcXJwRkhhbUxYQWtaME44R2ZHc2Nv?=
 =?utf-8?B?NjV0cUlWVjJqSTFya0J5eEJsR0NINHI1Ty90c2x4dExhWU5PZ1FLNkRUZS9h?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB8BEEBD59FEB445B574397D7A76828C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a854f9f0-1e15-454f-8eaf-08db1103eedc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 16:27:59.2906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fv3vdOwEx+W99Zlf8isD0fSb7u6cwqv2GS6tgAzVa3SS47jEttMfZB1tNW0RWaJrlTgtH4xenoqBnSw/ll8/CmTi5n5QXLFvS50W3x5mjCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3137
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjMgw6AgMTU6NTYsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBB
ZGQgc3VwcG9ydCBmb3IgdGhlIFFNQyAoUVVJQ0MgTXVsdGljaGFubmVsIENvbnRyb2xsZXIpDQo+
IGF2YWlsYWJsZSBpbiBzb21lIFBvd2VyUVVJQ0MgU29DIHN1Y2ggYXMgTVBDODg1IG9yIE1QQzg2
Ni4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3Rs
aW4uY29tPg0KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIC4uLi9zb2MvZnNsL2NwbV9x
ZS9mc2wsY3BtMS1zY2MtcW1jLnlhbWwgICAgICB8IDE3MiArKysrKysrKysrKysrKysrKysNCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvY3BtX3FlL2ZzbCxj
cG0xLXNjYy1xbWMueWFtbA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9mc2wsY3BtMS1zY2MtcW1jLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvZnNsLGNwbTEtc2Nj
LXFtYy55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NGViYmM3ZDUyOTgxDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvY3BtX3FlL2ZzbCxjcG0xLXNjYy1xbWMueWFtbA0KPiBA
QCAtMCwwICsxLDE3MiBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2MvZnNsL2NwbV9xZS9mc2wsY3BtMS1zY2MtcW1j
LnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMNCj4gKw0KPiArdGl0bGU6IFBvd2VyUVVJQ0MgQ1BNIFFVSUNDIE11bHRpY2hhbm5l
bCBDb250cm9sbGVyIChRTUMpDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIEhlcnZlIENv
ZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPiArDQo+ICtkZXNjcmlwdGlvbjoNCj4g
KyAgVGhlIFFNQyAoUVVJQ0MgTXVsdGljaGFubmVsIENvbnRyb2xsZXIpIGVtdWxhdGVzIHVwIHRv
IDY0IGNoYW5uZWxzIHdpdGhpbiBvbmUNCj4gKyAgc2VyaWFsIGNvbnRyb2xsZXIgdXNpbmcgdGhl
IHNhbWUgVERNIHBoeXNpY2FsIGludGVyZmFjZSByb3V0ZWQgZnJvbSBUU0EuDQo+ICsNCj4gK3By
b3BlcnRpZXM6DQo+ICsgIGNvbXBhdGlibGU6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGVu
dW06DQo+ICsgICAgICAgICAgLSBmc2wsbXBjODg1LXNjYy1xbWMNCj4gKyAgICAgICAgICAtIGZz
bCxtcGM4NjYtc2NjLXFtYw0KPiArICAgICAgLSBjb25zdDogZnNsLGNwbTEtc2NjLXFtYw0KPiAr
DQo+ICsgIHJlZzoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFNDQyAo
U2VyaWFsIGNvbW11bmljYXRpb24gY29udHJvbGxlcikgcmVnaXN0ZXIgYmFzZQ0KPiArICAgICAg
LSBkZXNjcmlwdGlvbjogU0NDIHBhcmFtZXRlciByYW0gYmFzZQ0KPiArICAgICAgLSBkZXNjcmlw
dGlvbjogRHVhbCBwb3J0IHJhbSBiYXNlDQo+ICsNCj4gKyAgcmVnLW5hbWVzOg0KPiArICAgIGl0
ZW1zOg0KPiArICAgICAgLSBjb25zdDogc2NjX3JlZ3MNCj4gKyAgICAgIC0gY29uc3Q6IHNjY19w
cmFtDQo+ICsgICAgICAtIGNvbnN0OiBkcHJhbQ0KPiArDQo+ICsgIGludGVycnVwdHM6DQo+ICsg
ICAgbWF4SXRlbXM6IDENCj4gKyAgICBkZXNjcmlwdGlvbjogU0NDIGludGVycnVwdCBsaW5lIGlu
IHRoZSBDUE0gaW50ZXJydXB0IGNvbnRyb2xsZXINCj4gKw0KPiArICBmc2wsdHNhLXNlcmlhbDoN
Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFy
cmF5DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAgICAgICAgIC0gZGVz
Y3JpcHRpb246IHBoYW5kbGUgdG8gVFNBIG5vZGUNCj4gKyAgICAgICAgICAtIGVudW06IFsxLCAy
LCAzXQ0KPiArICAgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4gKyAgICAgICAgICAgICAgVFNB
IHNlcmlhbCBpbnRlcmZhY2UgKGR0LWJpbmRpbmdzL3NvYy9jcG0xLWZzbCx0c2EuaCBkZWZpbmVz
IHRoZXNlDQo+ICsgICAgICAgICAgICAgIHZhbHVlcykNCj4gKyAgICAgICAgICAgICAgIC0gMTog
U0NDMg0KPiArICAgICAgICAgICAgICAgLSAyOiBTQ0MzDQo+ICsgICAgICAgICAgICAgICAtIDM6
IFNDQzQNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIFNob3VsZCBiZSBhIHBoYW5kbGUv
bnVtYmVyIHBhaXIuIFRoZSBwaGFuZGxlIHRvIFRTQSBub2RlIGFuZCB0aGUgVFNBDQo+ICsgICAg
ICBzZXJpYWwgaW50ZXJmYWNlIHRvIHVzZS4NCj4gKw0KPiArICAnI2FkZHJlc3MtY2VsbHMnOg0K
PiArICAgIGNvbnN0OiAxDQo+ICsNCj4gKyAgJyNzaXplLWNlbGxzJzoNCj4gKyAgICBjb25zdDog
MA0KPiArDQo+ICsgICcjZnNsLGNoYW4tY2VsbHMnOg0KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiArICAgIGNvbnN0OiAxDQo+ICsgICAgZGVz
Y3JpcHRpb246DQo+ICsgICAgICBRTUMgY29uc3VtZXJzIHRoYXQgdXNlIGEgcGhhbmRsZSB0byBR
TUMgbmVlZCB0byBwYXNzIHRoZSBjaGFubmVsIG51bWJlcg0KPiArICAgICAgd2l0aCB0aGlzIHBo
YW5kbGUuDQo+ICsgICAgICBGb3IgaW5zdGFuY2UgImZzbCxxbWMtY2hhbiA9IDwmcW1jIDE2Pjsi
Lg0KPiArDQo+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gKyAgJ15jaGFubmVsQChbMC05XXxbMS01
XVswLTldfDZbMC0zXSkkJzoNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIEEgY2hhbm5l
bCBtYW5hZ2VkIGJ5IHRoaXMgY29udHJvbGxlcg0KPiArICAgIHR5cGU6IG9iamVjdA0KPiArDQo+
ICsgICAgcHJvcGVydGllczoNCj4gKyAgICAgIHJlZzoNCj4gKyAgICAgICAgbWluaW11bTogMA0K
PiArICAgICAgICBtYXhpbXVtOiA2Mw0KPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAg
ICAgICBUaGUgY2hhbm5lbCBudW1iZXINCj4gKw0KPiArICAgICAgZnNsLG9wZXJhdGlvbmFsLW1v
ZGU6DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0
cmluZw0KPiArICAgICAgICBlbnVtOiBbdHJhbnNwYXJlbnQsIGhkbGNdDQo+ICsgICAgICAgIGRl
ZmF1bHQ6IHRyYW5zcGFyZW50DQo+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICsgICAgICAg
ICAgVGhlIGNoYW5uZWwgb3BlcmF0aW9uYWwgbW9kZQ0KPiArICAgICAgICAgICAgLSBoZGxjOiBU
aGUgY2hhbm5lbCBoYW5kbGVzIEhETEMgZnJhbWVzDQo+ICsgICAgICAgICAgICAtIHRyYW5zcGFy
ZW50OiBUaGUgY2hhbm5lbCBoYW5kbGVzIHJhdyBkYXRhIHdpdGhvdXQgYW55IHByb2Nlc3NpbmcN
Cj4gKw0KPiArICAgICAgZnNsLHJldmVyc2UtZGF0YToNCj4gKyAgICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KPiArICAgICAgICBkZXNjcmlwdGlvbjoN
Cj4gKyAgICAgICAgICBUaGUgYml0IG9yZGVyIGFzIHNlZW4gb24gdGhlIGNoYW5uZWxzIGlzIHJl
dmVyc2VkLA0KPiArICAgICAgICAgIHRyYW5zbWl0dGluZy9yZWNlaXZpbmcgdGhlIE1TQiBvZiBl
YWNoIG9jdGV0IGZpcnN0Lg0KPiArICAgICAgICAgIFRoaXMgZmxhZyBpcyB1c2VkIG9ubHkgaW4g
J3RyYW5zcGFyZW50JyBtb2RlLg0KPiArDQo+ICsgICAgICBmc2wsdHgtdHMtbWFzazoNCj4gKyAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDY0DQo+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAgICAgIENoYW5uZWwgYXNzaWduZWQgVHggdGlt
ZS1zbG90cyB3aXRoaW4gdGhlIFR4IHRpbWUtc2xvdHMgcm91dGVkIGJ5IHRoZQ0KPiArICAgICAg
ICAgIFRTQSB0byB0aGlzIGNlbGwuDQo+ICsNCj4gKyAgICAgIGZzbCxyeC10cy1tYXNrOg0KPiAr
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50NjQNCj4g
KyAgICAgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICAgICAgQ2hhbm5lbCBhc3NpZ25lZCBSeCB0
aW1lLXNsb3RzIHdpdGhpbiB0aGUgUnggdGltZS1zbG90cyByb3V0ZWQgYnkgdGhlDQo+ICsgICAg
ICAgICAgVFNBIHRvIHRoaXMgY2VsbC4NCj4gKw0KPiArICAgIHJlcXVpcmVkOg0KPiArICAgICAg
LSByZWcNCj4gKyAgICAgIC0gZnNsLHR4LXRzLW1hc2sNCj4gKyAgICAgIC0gZnNsLHJ4LXRzLW1h
c2sNCj4gKw0KPiArcmVxdWlyZWQ6DQo+ICsgIC0gY29tcGF0aWJsZQ0KPiArICAtIHJlZw0KPiAr
ICAtIHJlZy1uYW1lcw0KPiArICAtIGludGVycnVwdHMNCj4gKyAgLSBmc2wsdHNhLXNlcmlhbA0K
PiArICAtICcjYWRkcmVzcy1jZWxscycNCj4gKyAgLSAnI3NpemUtY2VsbHMnDQo+ICsgIC0gJyNm
c2wsY2hhbi1jZWxscycNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsN
Cj4gK2V4YW1wbGVzOg0KPiArICAtIHwNCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mvc29j
L2NwbTEtZnNsLHRzYS5oPg0KPiArDQo+ICsgICAgcW1jQGE2MCB7DQo+ICsgICAgICAgIGNvbXBh
dGlibGUgPSAiZnNsLG1wYzg4NS1zY2MtcW1jIiwgImZzbCxjcG0xLXNjYy1xbWMiOw0KPiArICAg
ICAgICByZWcgPSA8MHhhNjAgMHgyMD4sDQo+ICsgICAgICAgICAgICAgIDwweDNmMDAgMHhjMD4s
DQo+ICsgICAgICAgICAgICAgIDwweDIwMDAgMHgxMDAwPjsNCj4gKyAgICAgICAgcmVnLW5hbWVz
ID0gInNjY19yZWdzIiwgInNjY19wcmFtIiwgImRwcmFtIjsNCj4gKyAgICAgICAgaW50ZXJydXB0
cyA9IDwyNz47DQo+ICsgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JkNQTV9QSUM+Ow0KPiAr
DQo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gKyAgICAgICAgI2ZzbCxjaGFuLWNlbGxzID0gPDE+Ow0KPiArDQo+ICsgICAg
ICAgIGZzbCx0c2Etc2VyaWFsID0gPCZ0c2EgRlNMX0NQTV9UU0FfU0NDND47DQo+ICsNCj4gKyAg
ICAgICAgY2hhbm5lbEAxNiB7DQo+ICsgICAgICAgICAgICAvKiBDaDE2IDogRmlyc3QgNCBldmVu
IFRTIGZyb20gYWxsIHJvdXRlZCBmcm9tIFRTQSAqLw0KPiArICAgICAgICAgICAgcmVnID0gPDE2
PjsNCj4gKyAgICAgICAgICAgIGZzbCxtb2RlID0gInRyYW5zcGFyZW50IjsNCj4gKyAgICAgICAg
ICAgIGZzbCxyZXZlcnNlLWRhdGE7DQo+ICsgICAgICAgICAgICBmc2wsdHgtdHMtbWFzayA9IDww
eDAwMDAwMDAwIDB4MDAwMDAwYWE+Ow0KPiArICAgICAgICAgICAgZnNsLHJ4LXRzLW1hc2sgPSA8
MHgwMDAwMDAwMCAweDAwMDAwMGFhPjsNCj4gKyAgICAgICAgfTsNCj4gKw0KPiArICAgICAgICBj
aGFubmVsQDE3IHsNCj4gKyAgICAgICAgICAgIC8qIENoMTcgOiBGaXJzdCA0IG9kZCBUUyBmcm9t
IGFsbCByb3V0ZWQgZnJvbSBUU0EgKi8NCj4gKyAgICAgICAgICAgIHJlZyA9IDwxNz47DQo+ICsg
ICAgICAgICAgICBmc2wsbW9kZSA9ICJ0cmFuc3BhcmVudCI7DQo+ICsgICAgICAgICAgICBmc2ws
cmV2ZXJzZS1kYXRhOw0KPiArICAgICAgICAgICAgZnNsLHR4LXRzLW1hc2sgPSA8MHgwMDAwMDAw
MCAweDAwMDAwMDU1PjsNCj4gKyAgICAgICAgICAgIGZzbCxyeC10cy1tYXNrID0gPDB4MDAwMDAw
MDAgMHgwMDAwMDA1NT47DQo+ICsgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgY2hhbm5lbEAx
OSB7DQo+ICsgICAgICAgICAgICAvKiBDaDE5IDogOCBUUyAoVFMgOC4uMTUpIGZyb20gYWxsIHJv
dXRlZCBmcm9tIFRTQSAqLw0KPiArICAgICAgICAgICAgcmVnID0gPDE5PjsNCj4gKyAgICAgICAg
ICAgIGZzbCxtb2RlID0gImhkbGMiOw0KPiArICAgICAgICAgICAgZnNsLHR4LXRzLW1hc2sgPSA8
MHgwMDAwMDAwMCAweDAwMDBmZjAwPjsNCj4gKyAgICAgICAgICAgIGZzbCxyeC10cy1tYXNrID0g
PDB4MDAwMDAwMDAgMHgwMDAwZmYwMD47DQo+ICsgICAgICAgIH07DQo+ICsgICAgfTsNCg==
