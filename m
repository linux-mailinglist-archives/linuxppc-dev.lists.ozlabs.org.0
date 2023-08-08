Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5479C7738E1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:09:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hH8S0uap;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm7H15WVz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:09:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hH8S0uap;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm3p6y8dz3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:06:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmKWpuXn3TScu3V8DY53TuW7C97ztWco/RgQuSEc7GPEXASUB1bF+fcBToInjdReUeSDOg27g+JqmWtilFT70V7GX+GtOiOQhEVJCeuGhMx+pHipV/sQE34De6IJKCYfAP47F0mAiuNpna6sDCOrflG8UvRS9Bm3iuoGBd7IEc/oikQarJQ8sNM1umF6emGJNbOmoX1fFHdmByghtYqIwGWfRbm9o6tZSsIVALahrmcuNJn6tOEdixoz2XYJLPIhpCRufSa9fyQ/0jiWA9/KZ7oFu5SH0XGaBHTT+jrZzw+F4ixdzKGyxrbY3a7lQ5A2uq8i0L2Ii6ZQnfYHmlUceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx1uR9YM2EYoBJGR+Mpdlx+4TQW+OT7KIglLeuf8Cw4=;
 b=lSQfR9XZRs3LEO+wUIpXl12ZF9vVyVqgMY+RuYym1rGQVOXypmlJzBDItso/Bujkzr4iKyxAvn+MVQpWE7NDUJzNnI0oXRe42+EOyT1ICA1mGR+1xUUA29EbH9MKKeDMpjQSOtp6BpYK/6zJw0Da8FcKMXQE4S5/ieb6QeK0n2lI/uleLjT0esb6nFMzcn5tFroI7GiG8D8ZK3Djsefqw/arwsFSK3tOZeY6QOo88WwFWH6f9rMgeSsO1nWbw32notqh9SnZyFoSB1QRBLpiAw6q7GgQcSol5l1A3q66mEd3w58axS8BwRsoPr+bqhlRE8Q2P3eEotQbGOZz0ZBrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx1uR9YM2EYoBJGR+Mpdlx+4TQW+OT7KIglLeuf8Cw4=;
 b=hH8S0uapo/hBxfM1uq5tvBsDs7sGXM12qiGFuUkWfz2ph0PDljsiRPqD2q5fB9y9/sIyTdHnb6N1tm9MQTsh4pvjhgbqCS7cAjbFJXsDlJlLAFhkxHzhEvDN+32XywcoKApQZabIlr+gOKpERPgIsIwaczZp7ZCSN2CWOl8c3VNeIkRn+iSaXwshQ46Bvbbq+Ss+gyMPbicTxGFSbEH8SX9p14WvbdFVPlDEtvOvicXRNThoMpSpQ1iP/QyWbuf3Cr/RA/w+XaNjcvoJXSBVB7k4UGGdGgzlwBimCe4E0ntmrzwWzNEnjBb00vMFqoBq5Sd5SyhTilXQAaNB0Nr6pA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:06:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:06:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH v2 12/28] soc: fsl: cpm1: qmc: Check available timeslots
 in qmc_check_chans()
Thread-Topic: [PATCH v2 12/28] soc: fsl: cpm1: qmc: Check available timeslots
 in qmc_check_chans()
Thread-Index: AQHZv9JTpZVwOM4QeEa5eKZAAh1gla/gHr6A
Date: Tue, 8 Aug 2023 08:06:11 +0000
Message-ID: <8cf66ca8-ee80-6102-febe-90499fdd3734@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-13-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-13-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2052:EE_
x-ms-office365-filtering-correlation-id: e30af105-166a-4dc0-3757-08db97e6544a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9rhLt3/fWg9WzqkfqpEOv1FRRYQ1jTNYJGVbpVBLCbmthf03NJzrO70YH6EY6d6CvxU2oqYIrHT17wal/kCaBIs6go4gxK9emlybPiU8d+EilJnyltI9n+ldjmLVU0AGREqjDwpo3z4rILYlngdtsT9l221nkklcOw+SKRnPD1AvdfEjFYzbF70U7p59PPLj28UnjhFQucOEb0mwx18hUoQhfAntPSzg824l+tIRbMxlVn5iMuXMcLWMWVk36bommBQQobDuULKqglq1+6OQ0ptVUD5nGwBJ05cxw/nsYJ6+ha8ycD4hvUOtXR58J4WtffBz5UL+Bq2HK9Rust5MLf1UAltDqvfezf7+MnyDoUVH7zs1Nku9uQwsjx/1DrPof+BWBkPYwyUFbzGE2wSswQWWTFsJTwVqlCgvdVTTWnXgy8jo3noJ7sxzgxs3IbpnT5iKszcyt+35DPU26woFKTckabzOVK/luLrOhqrUEuBWqOBII7wwyveJJheYgRHwC2i99OdMAzFggiaTjd4/4xz7RnjTDqaaLe8x/s3m+GZv1mtzfo9oyyiqG6ieGFFOghHAfLJJZsbos1XhwAXgUwofYl+WUpXanDyrFH/kPmYV7TtsIaFj0KWkgavEj39uALbb9umIh+vLJ8zTvD/lPJeNy4p0ljVtnAxvJNnmFzFFaxLg4LmjaJiNJNLfu/FqYN/WC4sHyb8MFooP3f78GoNvmfyxlJmjSHeHHoknNBjvS+yf+Xw5F8rvNrhxCWcVeYdDPmWT2Z2G+QnOxeh5Lw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39850400004)(90021799007)(451199021)(186006)(1800799003)(90011799007)(2616005)(36756003)(4326008)(6512007)(316002)(86362001)(122000001)(921005)(54906003)(76116006)(110136005)(38100700002)(66946007)(91956017)(478600001)(66446008)(64756008)(71200400001)(66556008)(31696002)(6486002)(66476007)(6506007)(41300700001)(26005)(38070700005)(66574015)(8676002)(8936002)(2906002)(83380400001)(7406005)(7416002)(5660300002)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q0p6WnVtMjNDS05NSkZhUUJFcWh3RkJxUEZjM2tzK1pzMkpXUUlGTVhqYlk4?=
 =?utf-8?B?ZWh6ajkybEJyRWJmdEYwOEVkU2RLMHptTGw4QllxbERoZVpvL01KM2lQY2g3?=
 =?utf-8?B?bTA4Rk1hZWVVM01aNGc4MzRrZlFJNmxHaWpPV2hkSmdQM2s4UWtKbDZOMnY5?=
 =?utf-8?B?WVIyVDVRYlkrR0dlUEpOUUd2UmpDSEplL3dWMlU3aTlKd3hmMXVIbjRQT3o5?=
 =?utf-8?B?TWVDdDQrejQvZlMybXk4blRZSUNENHRXaWg0ZlRMd1VzcnVkd0thRXhrbU5J?=
 =?utf-8?B?OFBITDc1ZkgzQVc0ZEdwWTJQVDZEd215bDloV1lkbmorOEdHY3VDejZxMjQ3?=
 =?utf-8?B?QWhWSGI5ZkdjVDJDMGF3WTdPWmEwRk5VZDhkMm9Dbmg0REJGZGVkMklTY1Q2?=
 =?utf-8?B?eEVDa09qaUM4UTBpeGRxdjk4elZjdHZqNHNvR1VaVENCaFp3dzBXM0hGNkFz?=
 =?utf-8?B?ZEZ6amY5RS9RWFVFRG1hMXZFeXJ6OFVxMXhOcmQrSFJab2czVDREbWoraml1?=
 =?utf-8?B?ZEVMS3hzU3VJWk5Bb2g0UWx0SVZRdEV1VnBZQVFUM3Z6MDJvbWM5bFJyWFcx?=
 =?utf-8?B?UVB5elVjTGZTS2Vha05UOHFMS2hFUHBsaXRtOTVRMzg5U0h6a1VKL0ZuaTlG?=
 =?utf-8?B?cVpvZ0Y0dVZ4akZXUEorSUN2TlFGV1VyNkRCV3JpeW8wdDNFbGdaODdMdUlK?=
 =?utf-8?B?WEh3T054b0V4V3lWT0VjMHRWeGtPcnFtWmgycFB4TDFFYVExSGlDMlVUNGhP?=
 =?utf-8?B?NHZtQ3ZrRDY2QkNtNGVab3FnNDJodTdIckNhazRUc1hmRXdNMnBvZit5Qm9u?=
 =?utf-8?B?aWc0UmF4UEc3YjU1Z2xQbjkxbldUSXEwNzBOTUMxM1owcVUvb2RCZVJOSnZ2?=
 =?utf-8?B?Z3BJZ3VBMU1USml5SlUxaUtOWlA1NmhhMTUwRVNzdmc0cEhxeW52R2EzYjNo?=
 =?utf-8?B?aDBmdjNKY0N0angvLzE1UTJSWnhDSGxrYVJsQ0lnbWZSVTNOWHQrc2U3TG13?=
 =?utf-8?B?NnZFMWJ4Mm1CbXJYb0RkVTBKcERxWlgrTElUalltR1dYL2tuMWZXaU5IK1Vx?=
 =?utf-8?B?WnNDcHBSSjlpZXdQb3lyeUdQN2lUVXUyTktiYy91WUdiWGY3U3pBaUhiZWtu?=
 =?utf-8?B?L2RLMkpXRnRSMXhYTzY5OXEvakxocTljNUVGWlFwNDFpZ2dkV0hNeks4M0lq?=
 =?utf-8?B?MkxPNHFZZDRMZENsWTU0WnNFWENOd0VtZXBOYU9wL1BCTkt2WTBoOWk2a2ZN?=
 =?utf-8?B?Y3J5UXlGckFKd2ZTTkRIUGgwcWVrNVNjQVlkTGx6MXlad3c2d2JoU3ZYQkJ4?=
 =?utf-8?B?cXRybVB0emhPZVBMN3l5M3pEMlNTSXJJWTV2ZU91MmhyeHVmb0VrZ2lGVnov?=
 =?utf-8?B?MUNvTUI4MUIrNGJzWjRDZUlPOUhhRDV5Mmx6L3VLM1U0ZzNZMFozQkltdXN2?=
 =?utf-8?B?eGdUNW9pQzZGc0UvRjFWVW9WRHNjOVpZZ2FOTCsrV2NrZDlXRUlyNUY5MDJj?=
 =?utf-8?B?TmZURjJMVklGdmFIR040akdmOGdidmJOOVpzQlRQOXQ0M3ZJbmJlelprMGRW?=
 =?utf-8?B?MzY0REIwK082K1VMNEdLY09DckRLeUVlVU5WTjR6dy9CTWsvT3NIVFU0dWFI?=
 =?utf-8?B?clBZajNEV2RhY1lncEtPMDNZOHo5SkM1T2ZHbWtEcmhpOGpTRkJHYjVCYVdw?=
 =?utf-8?B?dzA4aWJVMWtxNDZsQ1RWOXV0emE4RHQyMWZ3Wkk5QllpbVJKczNBb2p6NFdv?=
 =?utf-8?B?WFN3WHo5RnVkRnpoSGxNTDJKNHVVU3Eya1JtOWxjS0xnNHdDd0lqMGZpNlIy?=
 =?utf-8?B?TEYrTDB4MnNWOStEbkNOalkxam5XU2t0QmRUOXhQWUU5ejh0NThLUXhGSUMy?=
 =?utf-8?B?VGR2MEVIQ0J2ZlRBdXFFdjZyTG9aYnFseEF2c1ZCUERxbXhKc3RQMFdTTURy?=
 =?utf-8?B?K25tMXBSOXB0Zk9LNEZiTkptY2x6K3ZNaVFVdHF3clBVdjIzeVVMaFZYVVVv?=
 =?utf-8?B?L0pabit0NzY3SVNqQWd4YnBGbktjTElLbk9TUTNlRWJ2MkZUZi9qdlNWQVNM?=
 =?utf-8?B?RkhDNlJ6Z1VFZ0IzRnI4eWxET2doNTFydzY0ejlURGduUFlIeDlrcHY1V2Vk?=
 =?utf-8?Q?/AiQFVetOfL4ZAbVh0LErnPof?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3E46873122CA245A7FA3E40F7182208@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e30af105-166a-4dc0-3757-08db97e6544a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:06:11.5450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkEbAX2NDMjmMFRKq4EZjOgrnnmAQkY1Wsqyo8TEufhlNfr942HQBlZ1oSpagMG1qRcMPqariGLEbXwzrih3fdUmsMgNqXDXDqOJcm+LraU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2052
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgdGltZXNsb3RzIGNoZWNrZWQgaW4gcW1jX2NoZWNrX2NoYW5zKCkgYXJlIHRoZSB0aW1lc2xv
dHMgdXNlZC4NCj4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBhdmFpbGFibGUgdGltZXNs
b3RzLCB0aGUgdXNlZCB0aW1lc2xvdHMNCj4gYXJlIGEgc3Vic2V0IG9mIHRoZSBhdmFpbGFibGUg
dGltZXNsb3RzLiBUaGUgdGltZXNsb3RzIGNoZWNrZWQgZHVyaW5nDQo+IHRoZSBxbWNfY2hlY2tf
Y2hhbnMoKSBjYWxsIHNob3VsZCBiZSB0aGUgYXZhaWxhYmxlIG9uZXMuDQo+IA0KPiBTaW1wbHkg
dXBkYXRlIGFuZCBjaGVjayB0aGUgYXZhaWxhYmxlIHRpbWVzbG90cyBpbnN0ZWFkIG9mIHRoZSB1
c2VkDQo+IHRpbWVzbG90cyBpbiBxbWNfY2hlY2tfY2hhbnMoKS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQoNClJldmlld2Vk
LWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCg0K
PiAtLS0NCj4gICBkcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgfCA4ICsrKystLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1j
LmMNCj4gaW5kZXggMzM3NjFjMzlhZWUxLi44MjQwNTkxNWYyYTQgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMN
Cj4gQEAgLTkxNCwxMyArOTE0LDEzIEBAIHN0YXRpYyBpbnQgcW1jX2NoZWNrX2NoYW5zKHN0cnVj
dCBxbWMgKnFtYykNCj4gICAJcnhfdHNfYXNzaWduZWRfbWFzayA9IGluZm8ubmJfcnhfdHMgPT0g
NjQgPyBVNjRfTUFYIDogKCgodTY0KTEpIDw8IGluZm8ubmJfcnhfdHMpIC0gMTsNCj4gICANCj4g
ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFuLCAmcW1jLT5jaGFuX2hlYWQsIGxpc3QpIHsNCj4g
LQkJaWYgKGNoYW4tPnR4X3RzX21hc2sgPiB0eF90c19hc3NpZ25lZF9tYXNrKSB7DQo+IC0JCQlk
ZXZfZXJyKHFtYy0+ZGV2LCAiY2hhbiAldSB1c2VzIFRTQSB1bmFzc2lnbmVkIFR4IFRTXG4iLCBj
aGFuLT5pZCk7DQo+ICsJCWlmIChjaGFuLT50eF90c19tYXNrX2F2YWlsID4gdHhfdHNfYXNzaWdu
ZWRfbWFzaykgew0KPiArCQkJZGV2X2VycihxbWMtPmRldiwgImNoYW4gJXUgY2FuIHVzZSBUU0Eg
dW5hc3NpZ25lZCBUeCBUU1xuIiwgY2hhbi0+aWQpOw0KPiAgIAkJCXJldHVybiAtRUlOVkFMOw0K
PiAgIAkJfQ0KPiAgIA0KPiAtCQlpZiAoY2hhbi0+cnhfdHNfbWFzayA+IHJ4X3RzX2Fzc2lnbmVk
X21hc2spIHsNCj4gLQkJCWRldl9lcnIocW1jLT5kZXYsICJjaGFuICV1IHVzZXMgVFNBIHVuYXNz
aWduZWQgUnggVFNcbiIsIGNoYW4tPmlkKTsNCj4gKwkJaWYgKGNoYW4tPnJ4X3RzX21hc2tfYXZh
aWwgPiByeF90c19hc3NpZ25lZF9tYXNrKSB7DQo+ICsJCQlkZXZfZXJyKHFtYy0+ZGV2LCAiY2hh
biAldSBjYW4gdXNlIFRTQSB1bmFzc2lnbmVkIFJ4IFRTXG4iLCBjaGFuLT5pZCk7DQo+ICAgCQkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICAgCQl9DQo+ICAgCX0NCg==
