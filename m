Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A952569A5A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 07:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ27k4Jb3z3cj2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AXGCvm/G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AXGCvm/G;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ26h1tLHz3c16
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 17:32:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmAKzhIqv8Sl9lUrxFOAimqWa4UwuTQYnBuSlqTAMvyRM5btJRL24vYyWaDbSag2vaRxWHOiO+J4lEW7xJnLycfUPxRtZwVvCRmtAflLbFmQx++0ViWmQkYMtHImeDVehgfOfOpjlHDDZqEOY9cKi9tOwk2dDROWhYDfW19TA+aHaHX51jTdwEg+hJW05muCFny/eYQ8q316qX2GWGpceGXWOIpDPhs0CB/hPQJqmKJ72FYoYckzkdGREV1F6bhDKNIuF1qYBqmxCsVinSsXdT+568ISdaoHABxpBU7g0ZWkV5JTjBUbBwxCCzBiQQnHJ40rN/fja8XcUXpa56JxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3nRyZeOEzOSmKrgr+kUPSguHvfWMm2y6UvUq2PdF1E=;
 b=k8WI09G00AuIxptV69UX9s9ihfzbOdAX8f9kGUGSK992sK4h+HD3/LT8AjFFkx+MMu0Hi0dplo+PNo3ihDUW2704apvNuBQ3jRgclmC+nfmUyhoa4JGdYXx16FLgmg7Q7z+NX2UQ8Uhqcnp9nbnUvHEn8FTGqZ60HDw9KwmbYthxLjBPWAhiqaNQPygx8zbhQRkf/4exXg+vOFiGQUeodlHyIqu3yR0OSGEgOwwNk1RqWJGafoKcGLgnQcd/puqdmN7+3X4lZSRe6haBVTJRFZ+IR+/1RAoGiunSymTACbxeslS+mi5+oc4hOJ0pOeXWIRGz9gkM6REdY05dZOJFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3nRyZeOEzOSmKrgr+kUPSguHvfWMm2y6UvUq2PdF1E=;
 b=AXGCvm/Gzrs9r7Cky954Gm+ppl1l+JNyVQ/UZPB+MTRGO+WM+atHc5dmkojU0FdaKX2SmqjT1y4pSk07jKj9dA/Bsjq9Pz2m95R5qQWP6FcKuIifWeHOB9S+E8l6688PujttC6PMAMo9J3sU1flN5dTIG2wf1iFdYpxFQp/iG6PGXuyfgc7WX55VnJ5galvhF8Lbqu16K8yqtj5oicSCcyxLey5C62KBrRYOzXeREW3V0Md7+F+OBwCzKtxGBlcSysQELklQ9VDqdeodvRViJExrNV9h0T7bL0AOere5guSZRAoQb2+RGOy4ru+tksGE0HHXGW3MxmyjVvN8I5EanQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1866.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 06:32:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 06:32:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Li Yang <leoyang.li@nxp.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Thread-Topic: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Thread-Index: AQHZQgyJTnKDkLwsSE+1HuE6BATU0a7SP34AgABvfwA=
Date: Fri, 17 Feb 2023 06:32:03 +0000
Message-ID: <0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <87mt5dyxph.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mt5dyxph.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1866:EE_
x-ms-office365-filtering-correlation-id: 5ebbc250-9ce2-4c55-93a8-08db10b0aea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Wh1aK3cDLWiZ4URc6ex3nOIO8LsCRCU5hIcpY6vy58PwGt6KaIoTOiFN8IKmlWuszoPYxKTNtFgLYsHqhuK3pILy5RiQEXhyGXWIbFsjWNoZ53sRxQJIxIWyfyTvN3kNDj6ecJO8QZX0MvItOy1pBd1TV4pQ50+VWhtIIfyI/p6w/qA8AdamMxY6y3u2MBHtMlz77Z2Eo+IyRfxO9vbwDBsH9OfOmLE5i4PwCjXQ++nIaIVN+A7ZWqLK++CHsRMa+Fy9pjqwdMDtJ3WI0QAaESFH0+8IAT5SAE4BzWieLSe+xtEJLJWKRJzj1Ha/ug0fwvwFwAgNrHr1eUzsrhZZtUDE5iReELPcJoPVUtQBqhko/8HNTCzzpEywp/DVzu67FHmGQ5afQq46sIZOhP7Yax8AUeeGUOI7OEE8Kpa2okyO+HqQMiIIJpyzJ9SLBal8BhCk3ExYvAyjNT30TsVCiMW9/rVhM34YG1m33M4UL7ApPj6pBqF54rVMhw/lJ2/6ZlRZuk3rdjwwqpA1uNJF4+TjIJ3TW/l/S4Cxid5i/lWPINrJi9A5rOVLbUq8gU3BEzRSjHpuoIVp4dTxtCfyX/KYtAhHuJVCuCmtRN9XvZA2tL7cspF5VNq7t4gfo+P58lBe8rGL4oUB8sPomVWfxv1LJ+pKxsSzFZMK17uOnULTM9H2Hia0cJJBJ+1Okj10f6hNNOQ1QlmLIEGw7i5Z79BLGrpKRW7ncn7L7kh7We1phNInmuIMNe/wPwvyhHhWNoYHlv78yz+W8uoRD51X5Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199018)(31696002)(41300700001)(122000001)(66476007)(66446008)(64756008)(8676002)(66556008)(76116006)(66946007)(4326008)(6512007)(26005)(186003)(7416002)(5660300002)(2906002)(44832011)(86362001)(38070700005)(38100700002)(8936002)(2616005)(36756003)(71200400001)(478600001)(83380400001)(6486002)(31686004)(66574015)(6506007)(110136005)(91956017)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Vis5aDFZSm5tRm1pQ0NwTHduYXIzV3B6c3diM3FWeVRGdk5JdnkwcWxTMGU2?=
 =?utf-8?B?NnBNWTFKWFB6eE1HSzBTQy93d01HUDYwVnJPNmhGMk1rZ3M3b0VBNnRuUEd2?=
 =?utf-8?B?SE4xUGJnSENEQnROemxFRkJDQ2F3Nml0dkFiMHplaW9vTW9hTUpJajl3c1E3?=
 =?utf-8?B?U1Y2VzZoL3Z2RVRHZ29PNU5mVEZMN0VHRDFzSFJCc3ZoQjZBa0t1cXBveTRp?=
 =?utf-8?B?WFlybkhuZUtiT2RQT0g4OEpBcGorNnhnL3cxbE1aeStmdGVIcWR5dkRXYndF?=
 =?utf-8?B?TzNqNTlKSHZrazBON0RaM3g4NnpNUktoZy93NEtVVUYxQ1ZWZzdOaGJ0cHhP?=
 =?utf-8?B?VkxReTdiT2tITndLdndsR0VLb3NYeFNweHFHQWV0YzRoTXpGdXF4KzROejAw?=
 =?utf-8?B?VGtPYkQwYVljRGJtWFI4RFdEVlFBNys1SUFyRWFWWU9qY0FnSHNFMmFhTHE0?=
 =?utf-8?B?UHZSc2VOcWY5WlNQQ21LSmN4ZW9XQi9GZVVkZGdTTWt1ZTlrSEh5QkErM3A5?=
 =?utf-8?B?VDF5bW1NbjFGcXd1Qk5VN09YcGN3cGF2WnJOQUJrUjd2Z3lPcDF0WXNXUGJi?=
 =?utf-8?B?RTBIa3VqMDVvTlAyc1MyS09ZdFVSRnJCZE9KUytESTJMSERjZHd0dGN1T3I4?=
 =?utf-8?B?d2djUnd2WEpDdktjVHU4VTdyK2Z1eHBneGVIZUw2dDdIczJoWWtYWlBNWkhk?=
 =?utf-8?B?TUpnN05CalE0aGp6OGI1aU4vb2NCTnEvam5taXJuRlNYU0sxYmp5ZjV0cFBC?=
 =?utf-8?B?TUVJS0xQNXc1a2hHb29hR3A5UmJ3MFZGMTlaellTYU83VDViQ2htOUJGV2ln?=
 =?utf-8?B?YWZjNmVXSkl3eUdYMG9OOEVlTjlHMU9aTTViWjZvUVJ3UTBxTGExL2o3UTNE?=
 =?utf-8?B?WUtMVXJCOG5FdWttY25RMnRWWW1ZWkdKdDdSZk5nNGxnUGZKTk1tV2E0dVlM?=
 =?utf-8?B?WURBWVE3cFcvdjZjTndTcWxXaDFTUXVsam11a05wUEcrRGJXejhQVXV2WDV3?=
 =?utf-8?B?ZGpxRk8wa0xJMGUzZ3ZrTzE5NEdBUDBVMDFKUTRnc3Bpc3NvY2xheGQxSmdD?=
 =?utf-8?B?eWRzMDF3bEtlb3FiVVdWLzVZWEpHWW1JamVmczBQNS9vTFY4L1pLNHpjNlRj?=
 =?utf-8?B?MlpOazBPQ0ZXUGYyKzI3MEFGRmM3M2R1czRkcjFURUdONVYxQXc0TjRWNTVr?=
 =?utf-8?B?eVlaNG9PMmIrSHd2czlHNUhTaVBQZFlqcE9sNGYxUzRLREU2M0ZLbzJXc2pW?=
 =?utf-8?B?dEI3NTRtL0lUaTlHTUtJTC8yQnpqZStsemRNTjhpOUVkRmpCNmRsRk1LbDRp?=
 =?utf-8?B?QXJkZUpLWjdTY0Nub3BCWU9UeTJHSjFseXpFUlRoQjM1WTZJVGZCNzIwRXkr?=
 =?utf-8?B?M2toVUpsaHlRRWNybzA4M2RVTUtId3Q3M3BxQUppZTVaZFZZN1NLMUdJTkV5?=
 =?utf-8?B?MFU0QWZ4MWNMKzA1WFA5MWdMa3ZWOGM4bDJPa0psYkJURytPT3RuQkZmYm5P?=
 =?utf-8?B?YVdLZjBOTFYvaUVBQXJGbVdoWWFxa3FBRmRKd1U4YzB4OWJlZnI4emc2ZHIv?=
 =?utf-8?B?c3c0KytRWG5lTGJaMWhUK3lRdktFaGRaM1JZMnVvSGlLaHF5aEJFMWVpSDhF?=
 =?utf-8?B?MlRETk9OWXlTOEV0eE01MkkvRzUzeFFlU3dVL0ZtdkdEd3pOTjhFKzNHUUQz?=
 =?utf-8?B?K1ltM0drQUlZd29ZZzNnckpNcFUrQVpBbjkwNTBoVkcyd2lvUEhwemlwT0s4?=
 =?utf-8?B?NlJCelcrRTV2andJeFlwTHdzRStCYmdFWUlndXBLb2RLQkYxYjNrcm5tZGZ1?=
 =?utf-8?B?VmxjYzk2SzFKeGdCeVdydGZ5SFVyT3UzQ2hhQjJRZzVFemdHZWhWdy8wdCt5?=
 =?utf-8?B?TEp3RTFrdVpmOWkrTXFiay9QWkk4aFZEOG5JcTU5OSt4LzZxWlRsN29GeGNO?=
 =?utf-8?B?eUptRTE1REVCZkdjM09VMURYaTJpUmowNnVnclRuUCtUU0k2VC9kZHhvK0dD?=
 =?utf-8?B?WktPdktETWwvVUhDbzZueVUrWlNjR1NXZ1FjWlE5Rmx3Z1BzbGV5UXAxL0JN?=
 =?utf-8?B?Q2Z1ak5lOUZvREY0MyswWTE1L2l4bmdjbzlvNkpML0VVdElSTXV0TDE0cHhh?=
 =?utf-8?B?RHkxUThPZ0tJRFRQY01EYmt0RHZXdzNxKzVsYWxLS0wwbFFFd2Q3cWx3K3Ny?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <217D4683BC83C9419D028B64699B48C5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebbc250-9ce2-4c55-93a8-08db10b0aea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 06:32:03.2675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y44DqXGT+1x+N+cux7VvHoXiCa+LhMQvwxgbU4SZs6np6bCw8PuCxkZqI33I+OkLeZu3Es9dAHCm/Ti9PYesVVm74+3d6mKU47WULJoFVKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1866
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjMgw6AgMDA6NTIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+IHdyaXRlczoNCj4+IEhp
LA0KPj4NCj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYXVkaW8gdXNpbmcgdGhlIFFN
QyBjb250cm9sbGVyIGF2YWlsYWJsZSBpbg0KPj4gc29tZSBGcmVlc2NhbGUgUG93ZXJRVUlDQyBT
b0NzLg0KPiANCj4gV2hvJ3MgZ29pbmcgdG8gdGFrZSB0aGlzIHNlcmllcz8NCj4gDQo+IEJ5IGxp
bmVzIG9mIGNvZGUgaXQncyBtb3N0bHkgaW4gZHJpdmVycy9zb2MvZnNsLCBzbyBJIHdhcyBleHBl
Y3RpbmcgaXQNCj4gd291bGQgZ28gdmlhIHRoYXQgdHJlZS4NCj4gDQo+IE9yIGlzIGl0IGEgc291
bmQgc2VyaWVzIHRoYXQgc2hvdWxkIGdvIHZpYSBvbmUgb2YgdGhlIHNvdW5kIHRyZWVzPw0KDQoN
Ckl0IGlzIGEgc291bmQgc2VyaWVzLCBJIHdhcyBleHBlY3RpbmcgaXQgdG8gZ28gdmlhIHNvdW5k
IHRyZWUsIHRoYXQncyANCnRoZSByZWFzb24gd2h5IEkgYXNrZWQgYW5kIGdvdCBhbiBBY2tlZC1i
eTogZnJvbSBmc2wgc29jIG1haW50YWluZXJzLg0KDQpNYXJrLCBpcyB0aGF0IG9rIGZvciB5b3Ug
b3IgZG8geW91IGV4cGVjdCB0aGlzIHNlcmllcyB0byBnbyB2aWEgc29jIHRyZWUgPw0KDQpUaGFu
a3MNCkNocmlzdG9waGUNCg0KPiANCj4gY2hlZXJzDQo+IA0KPiAuLi4NCj4+ICAgLi4uL3NvYy9m
c2wvY3BtX3FlL2ZzbCxjcG0xLXNjYy1xbWMueWFtbCAgICAgIHwgIDE3MiArKw0KPj4gICAuLi4v
YmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvZnNsLGNwbTEtdHNhLnlhbWwgfCAgMjM0ICsrKw0KPj4g
ICAuLi4vYmluZGluZ3Mvc291bmQvZnNsLHFtYy1hdWRpby55YW1sICAgICAgICAgfCAgMTE3ICsr
DQo+PiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MjUgKw0KPj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzh4eC9jcG0xLmMgICAgICAgICAgICAg
fCAgICAyICstDQo+PiAgIGRyaXZlcnMvc29jL2ZzbC9xZS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICB8ICAgMjMgKw0KPj4gICBkcml2ZXJzL3NvYy9mc2wvcWUvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgfCAgICAyICsNCj4+ICAgZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jICAgICAgICAg
ICAgICAgICAgICAgIHwgMTUzMyArKysrKysrKysrKysrKysrKw0KPj4gICBkcml2ZXJzL3NvYy9m
c2wvcWUvdHNhLmMgICAgICAgICAgICAgICAgICAgICAgfCAgODY5ICsrKysrKysrKysNCj4+ICAg
ZHJpdmVycy9zb2MvZnNsL3FlL3RzYS5oICAgICAgICAgICAgICAgICAgICAgIHwgICA0MiArDQo+
PiAgIGluY2x1ZGUvZHQtYmluZGluZ3Mvc29jL2ZzbCx0c2EuaCAgICAgICAgICAgICB8ICAgMTMg
Kw0KPj4gICBpbmNsdWRlL3NvYy9mc2wvcWUvcW1jLmggICAgICAgICAgICAgICAgICAgICAgfCAg
IDcxICsNCj4+ICAgc291bmQvc29jL2ZzbC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgOSArDQo+PiAgIHNvdW5kL3NvYy9mc2wvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDIgKw0KPj4gICBzb3VuZC9zb2MvZnNsL2ZzbF9xbWNfYXVkaW8uYyAgICAgICAg
ICAgICAgICAgfCAgNzM1ICsrKysrKysrDQo+PiAgIDE1IGZpbGVzIGNoYW5nZWQsIDM4NDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvY3BtX3FlL2ZzbCxjcG0xLXNjYy1x
bWMueWFtbA0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvYy9mc2wvY3BtX3FlL2ZzbCxjcG0xLXRzYS55YW1sDQo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHFt
Yy1hdWRpby55YW1sDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9mc2wvcWUv
cW1jLmMNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL2ZzbC9xZS90c2EuYw0K
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvZnNsL3FlL3RzYS5oDQo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3NvYy9mc2wsdHNhLmgNCj4+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc29jL2ZzbC9xZS9xbWMuaA0KPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgc291bmQvc29jL2ZzbC9mc2xfcW1jX2F1ZGlvLmMNCg==
