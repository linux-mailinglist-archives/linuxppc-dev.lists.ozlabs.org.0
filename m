Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB869B0EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:31:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJHPG4RRYz3fXd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:30:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bWROf97T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bWROf97T;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJHKf6NnRz3f6m
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:27:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIsBqEYZ2oTBNrmmNtMMzrIr7BLT7CZNm2H2rSG807RKXIF1ODEjO/B8r+mbRhcrjZCJ/JjeixxA9EfYvpVVjvggobaKRx6njYTjCfFClutyQ115XRHo9S+/g5jDen5MxiPkgbXPItNngLifURvFGG2WMJm9aiR0w663Que46VlvYuriNTqWrkxHYNoRIuTMpEsuCygVPHf1PVViHktD9BG8vVbqaLHEF8XsLnkRmNAq1ZUI85XsWlEwAi6+X7wCzPpvvZJPudMjDIiPCYV9nwnTsRFNayaeVxBgIof6WGRXWFOw7eM9rZPoTZF70/xpYD6A5XsWg5PbKzE8KiPexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV1yLTJYfB1mffpaqdyLLoqs6y3zfSbghzz/ztGpkwU=;
 b=NussVf4NDVQFZCM8lHmZtvYm5qsXeWyjeGYWVmJTxHe672IOEkmsG2Xw2jjgFT7pC7ZLf+u6v6cT6Jx429dsE3tuwEJf+tYDXM/EfmvzlIogcAyrZP0znQgfAFhRBXjxv5s96nqddEMiV7fT3wNtJ3jxCqmGf7h6vnNd2lri8GXD34nkxOEh7FwO7O0nAqsPpO1WqBSyMYEBz9nP+Xy00V15l+H4bYMqcAgrEg7J3PvZ7gQiLrzlPwakdcSyriBvU7P2uj88Rozk0oZ7gxfVos3KhWlRBN83iPYqw/jLhWzbE1+ssQl5QA5aFLP+MFpv+RUTrFyNxnuvYGoIdZePtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV1yLTJYfB1mffpaqdyLLoqs6y3zfSbghzz/ztGpkwU=;
 b=bWROf97T2KOMBB6akYRZu4ORjZBZlCBPnzRf7KJHYO+Yp7cdmFciOvj2QkUx5JFxfBvL6rDcW4ImKjtED7x6Wy+LAWA5mrfsEz7ZctoFMPRiojCNfaQ2hJJMMfVzLMfbMOHQ8NC8eMauphNzj+I66yvd3x/Fa394p2eO3BPZJLTtbBN4s3HBMbepsbaa/iCV/1jJ3uxqcVmVgmBA2wQM32UrSfbGO5JPJbGGAvGO9g0qFG36Ba4cdyOpqCMQhnRhpD+PSVSvI743V9ZRpzXVVDispH6Bb2AiZbSsqDoRNCIV/ZZ/VpSgH7CyMltie6jCyXDYWkk8j26NtOKv0fIhfw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:27:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:27:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v6 03/10] MAINTAINERS: add the Freescale TSA controller
 entry
Thread-Topic: [PATCH v6 03/10] MAINTAINERS: add the Freescale TSA controller
 entry
Thread-Index: AQHZQuAYv7BLzP3t10+T4tyz77z/767TU8mA
Date: Fri, 17 Feb 2023 16:27:47 +0000
Message-ID: <332ab487-199d-9644-8c00-0e6c09152397@csgroup.eu>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-4-herve.codina@bootlin.com>
In-Reply-To: <20230217145645.1768659-4-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_
x-ms-office365-filtering-correlation-id: 95a5c683-1966-44a0-9fb7-08db1103e801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EmEw4/mQ2+adVSwNX09oA19OUdNZLDyep0aYNyti7fPFr6GlTJE6nu6TGDGEfMGKLBfRSlUcT8Vqo3XUNtqiQ/Al61qa/hRpSboqSUJ1eRFoB+sxnUt/+GYkb8VOpJ7vL+1OT16t6n1pFyPCAjQnB9Bpfnx5dKmRxWnHbiyachFUN88iDUcJ3l7BsMwldiHwFLpKyPRbTtulbOxTwiksRppoNVCARWtYVkq1JBo4zd5xne3PNdi0R27Gl3iQaooYMg6OJ7pO/g62LiZM7CTDK8OV2qCpDF33g/t4OEO0XBYUUhxlrvIBcxBYQ5nuPBOjcHRRT7tpngRceUws1zOG3xxur2B34ykET/KP33SqOgsMr+51gLWWZTqVp/SP+btD2lzZFshJfvXw6BJQ8dnWgPT7mGZNkUQRi4/cw4z7t4EtPpPYiNrpQTDb4c6V4ExdZHmBbu8cnhWUGSFLaXeONYCLWPz7FwibiQpf2jaRBblwcHFfq8EMO1L5Y+sbGl34V7pLTJTNxMzqPGQffgS7UO6HObiHgDQXZiUo8Xz04p+Y1UctvE9BZTCcdN4I32NfwfFEUZXpiCnbqZrpW1kE9s7lUUZ9yJ0fvIi546jUZYBJcyvyTxT2vi1oi+KvYyuuGbkkybgxC1t6SxIwj0mI1KseER2fvWc6RaLvVtGF+chDIj0ee37Cs5K2evd8a/LO810peE99KFNa11RUbstFNEuem8wEFPNr7Sm+65a6WHmu+trEPxP9fXD6dWkuFc5YI6BXngEdM+aaLNIUgRZ41GaXuLyCQW+KV/X8KPAkHX8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199018)(5660300002)(110136005)(7416002)(66946007)(71200400001)(66556008)(8936002)(316002)(44832011)(54906003)(66446008)(2906002)(4744005)(4326008)(478600001)(76116006)(91956017)(66476007)(41300700001)(8676002)(64756008)(36756003)(6506007)(2616005)(122000001)(38100700002)(31696002)(6512007)(186003)(26005)(921005)(6486002)(86362001)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UzdrVStwZTR3RVJiSTJFSFlodkZYWnZubzZpZDVTOUdKbEloN3U5aTJ5VWhN?=
 =?utf-8?B?Q0xBT1VLR3UreFpCSTJTKzN5TDM1MVZyWjZZU0VxY3NoYjFGZ0I1OUNCQXVX?=
 =?utf-8?B?ZHQvblZhcDZ2Vm9sdUNjdFdGZUMvOVpxREZGcCttOEpZRTZFL3lYQmRjT1Bk?=
 =?utf-8?B?V2h6QjVaaWZqdG85YnlBNzNhdnhjanpNVzR2VktVVjNHZ040cG1FSlh3d1VY?=
 =?utf-8?B?ZXYxbnVQdXZDTmhldEV6elBIenVLQkxOK0lFb3VHQ3VOSS9vUXJnNXRzNk9m?=
 =?utf-8?B?MDhTTVVEWE1wUHJLc1NNd3dXQS9KblpEb084RzIrSEhVdUhnWkZUajNGS0pm?=
 =?utf-8?B?aC9Wdkx3TXpXbFBsWGsvTUltbjZ1U0NzT3ZBcE1rY05zK1A1NkN1ZGg1UmdU?=
 =?utf-8?B?amt3TElHYkxxTzE3QnU0eDQyZXgrdlA2WDhCS005N0piY2lyTit1cGxDUkZ5?=
 =?utf-8?B?M0RjSmhZbFJuMXlTN010Q3l2U0RKa2xpM0Mramk0dnc4ZTVrV25rQ1BUTjFI?=
 =?utf-8?B?M0dTWEJ1YytTVFZkTTlsbFZkdk90SHdqQTJoTElYWnkxVUZkMW04cFN0b0Y1?=
 =?utf-8?B?Qk5KUXFBQWd4Ni93Tko3Q05OdDlRZktIdmRFRjJydGdLaTNVSTNwZzJPbnhI?=
 =?utf-8?B?R3RkdXNMQ1l1bmpiZVkxSGg5NHVTNU0yaGxvTjlPcGprSWRId1dHeUxMOWh0?=
 =?utf-8?B?TE9DczFuSytVQWdLZzV3dzlramRYbloxV2pWNUVycDNxMHpJVmZnNEl6TXhX?=
 =?utf-8?B?c05DQWlpTm81K2U1eDMrZXgwYjIyQ1grK05FYjJKVERZTS9ERzhiL1JROW1Y?=
 =?utf-8?B?b2xhbVVFRkpNanh4UDNWb0UwaWtGa1VEZ29jRFZOeDEwRHBVZFJuaEdIS0Rn?=
 =?utf-8?B?ZGtLNWF1TWQrU0RWRVhJdXByOGJKZlJmbjRLb3o5eXdCNDJpdzBLRGtLLy9u?=
 =?utf-8?B?Q2xtMGRIRGtvOTJKM21MRDdNRU1WTWIwZm0yYkpoZm9jVDlkckZPUUx2VkFI?=
 =?utf-8?B?SSt0aVJ3bkFJbHd0Z0syUlFadHlEbjNTdmRoN1RWNmJGV3ZlRHg2ZWhxb0hT?=
 =?utf-8?B?VXQrNFVEcDk0NDVUbWVIVG1xSjhodnB6RGdlWmc2MlJVeVN2NzBvQ3JhWHlO?=
 =?utf-8?B?RHRRcU9KWlkrQjhRUlNmVzZYWURZWG5iVVY2azlDZ2k2a3kwajEvaDdXNTZW?=
 =?utf-8?B?Y21Zb01pWmoyRTNPTUNFdER3dHE3dk1WTlR0eFI3WUJVRmxJajlhZW5NUmU2?=
 =?utf-8?B?anR5MWJ0N1Q0MkF3NWRrelVXN3EvV1F4dXhUb3V1YkE1RCtMb3JqTjE5QW4x?=
 =?utf-8?B?WS9TVDhNbmJrR1hybDVrKytBdWE1cmRycXh0OFlqbG9pRFJwWGRiaGpNa2ht?=
 =?utf-8?B?T1VrK0pvVldDUGtMZDRGa0JsemRtc01tL3p2eEdmN0ZTamVmaGprd1lGczF2?=
 =?utf-8?B?QWs1U0t1OVJDUEJ6QndMcFQ1dmdoYnFTWjBpS1MxbnBpVFNqMFRsSkJIdDZ2?=
 =?utf-8?B?WEY0UDB3dEc1YzAvV25talhxcTdoeE56R201aXJTL3B2THo2MlFnZjduTFM5?=
 =?utf-8?B?VTM0UEdKYWx2akZQUVZJaFgxNjkxaHJWNzhSREw1Y2E4b3paSTU4eFg0d3FS?=
 =?utf-8?B?SmxhcXhJamZEL2FQWVh0N2VGbXFKdVV4RUVaMzJwMFl0SHRETFpXRTBLZklJ?=
 =?utf-8?B?SlJKWUk0ZSsxK2J3TE5vVmltZWN4UkhTbldnWmJOcHpOTXdQbm5UbjJrQlVO?=
 =?utf-8?B?S3JtZytqaCs5Y01kK3FlSW5iQzlyZTZGWkNOcHU4SzZnb1ArRWpUdGQ0TWtw?=
 =?utf-8?B?Qzg3SC9GTUJqMHdRanphendkZU9SUEpmaldvUEJ5OWdDYThTUWJtcFNUK1ky?=
 =?utf-8?B?SUJhdlo3U2VZZEkrSEUxYkR4U3VvdmFGUUdSQzhEWTZoR1krejZnZ2xleEE5?=
 =?utf-8?B?Z1FwMzdNTjAyZHpxY3FGTXQ2Vlc2c2Q4NTA3c2diMm1lZ1V2OG9CVGdObVd6?=
 =?utf-8?B?eUNkMUNEbTVHMVMwNnJZK09LUUlMd2RiT2lZaDZxSzBxcktUOUpyZW43VmpM?=
 =?utf-8?B?c0ZqSWNBUzFvcWRpaEhLaThVaElPRG5SR2hGWXlkQXpDbXhGb1lIN1BxSVAz?=
 =?utf-8?B?d2dpcC9XSE4yZ21jYkdiQnZOMC90TXUwYWNEeE9MVWdhdUdLYVU5M2RIb2wr?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AD168A98BB98A48A2574DA800AEC1E4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a5c683-1966-44a0-9fb7-08db1103e801
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 16:27:47.7895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7WticCdOPp+M5VVwCGitMeOb8JLHCqF2x/FOQqrqCMkxa7UrolU4gde18VOpj8wgeKqK82ATnZ+R9pRPBSik1ssovUS0pT8zvtPx4XeLjss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2988
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjMgw6AgMTU6NTYsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBB
ZnRlciBjb250cmlidXRpbmcgdGhlIGRyaXZlciwgYWRkIG15c2VsZiBhcyB0aGUgbWFpbnRhaW5l
cg0KPiBmb3IgdGhlIEZyZWVzY2FsZSBUU0EgY29udHJvbGxlci4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1i
eTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0t
LQ0KPiAgIE1BSU5UQUlORVJTIHwgOSArKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uw0KPiBpbmRleCA3Zjg2ZDAyY2I0MjcuLjA5N2E4MGQ2NjIzYiAxMDA2NDQNCj4gLS0tIGEvTUFJ
TlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTgzNzIsNiArODM3MiwxNSBAQCBT
OglNYWludGFpbmVkDQo+ICAgRjoJZHJpdmVycy9zb2MvZnNsL3FlLw0KPiAgIEY6CWluY2x1ZGUv
c29jL2ZzbC9xZS8NCj4gICANCj4gK0ZSRUVTQ0FMRSBRVUlDQyBFTkdJTkUgVFNBIERSSVZFUg0K
PiArTToJSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQo+ICtMOglsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiArUzoJTWFpbnRhaW5lZA0KPiArRjoJRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvY3BtX3FlL2ZzbCxjcG0xLXRzYS55
YW1sDQo+ICtGOglkcml2ZXJzL3NvYy9mc2wvcWUvdHNhLmMNCj4gK0Y6CWRyaXZlcnMvc29jL2Zz
bC9xZS90c2EuaA0KPiArRjoJaW5jbHVkZS9kdC1iaW5kaW5ncy9zb2MvY3BtMS1mc2wsdHNhLmgN
Cj4gKw0KPiAgIEZSRUVTQ0FMRSBRVUlDQyBFTkdJTkUgVUNDIEVUSEVSTkVUIERSSVZFUg0KPiAg
IE06CUxpIFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gICBMOgluZXRkZXZAdmdlci5rZXJu
ZWwub3JnDQo=
