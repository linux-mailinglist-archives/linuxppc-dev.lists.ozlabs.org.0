Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876D666196
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsZBR238Bz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GpiOm+g+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GpiOm+g+;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsZ9T0tvJz2yjR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:16:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdrpS6iEPsdEn08O5BL+h6Ju+O0dryZSWIC4tYRlNM/w9bBznLcDRwYSwrIj3Z9C2aG1J/7hAxu5uYjYw6xLKdD+THEHSG1GC4aNrJVTpAxgj2m27uYbA8TGGw2q3m4NJ4/JFM3zJEPXNnAYx3+w1GEOog/xxML3RhdI66VmDQJYoWAuYwvLqsN26i6s0D53EtaL0TvFp9gcP0KqudU2VeGn5Ln1B4VS8JwygzE+KQFhIuClCv4pzuYur/gFRKR7najqJmJkUFOLNqDDmLp6DvLSXBFwRsY5jxfXqHEPB58iKxJLTAJQYvIAOz+ey5UE03EIipJphDrAOKwk1YYy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Vi+uvjlFFDVzm783z4BKWfkSmcnUWVog84qTpKCT3g=;
 b=HMfaO/EQw78UusR+96L2v76mNzSUfHwQoMV5TnWF4uZCtvMyVem9kYOpfuuhKNT+azATMxdrrbG7QzFBkjTzV124ihSy9IqM3ctAIg2GonItHd0LeykPye2cC8KyZwNv/9ZE0JkeasVJYa9oI8ceFKTNZ62iZTnGLQ7zmMF1QSnBEM2oIqKH60MCb4yhBnz/LfqSrPUq5lrsgn9gX5YzByNYdILx9lltT56ZvVSGMe2ioeuIrZ5N/LLl6cvoTmGi1pqS9YD5cpdIcyrUgCfykpjl4iXdIxAdRmzgR7lvHOlDnqLuqhb14uFjngaaOF1XMf5dhTAIxlJg8/m6T0JNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Vi+uvjlFFDVzm783z4BKWfkSmcnUWVog84qTpKCT3g=;
 b=GpiOm+g+yuzLLkEzjhee58bLGSGfv7Mbz1UFSUSfs81Xz3g+Ag0zfbbW3zIsbA0hnRXN2MSs3yNL6NU/sNxi1R617/SAwVgSQYV7ranm++rfjJ91Zl4J9NYYueYEN1dOWGhX10LrP/cjgRurP7WOO01ooONF9cNOOskuQ76rGV4LKGY1bilSf9l+VKHN3l6M4FROWZ84oJZUdswl3LJzO3kvgvGVCsaf0vluYLZHLA0x8EI+niKnTEvuhGEi3q0K9c/iD1Wr3N2L4bE+oiSSj3cD4ZWrP+W70XkUe/CtSS92IlD1KAfSw6keJYNPLkTLNE+ucBxxqef9cqEuXAvVSg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3198.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:16:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:16:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 02/10] soc: fsl: qe: Add support for TSA
Thread-Topic: [PATCH v2 02/10] soc: fsl: qe: Add support for TSA
Thread-Index: AQHZIe0/rHHawuyaT0OnpKhqNXssCq6ZQpsAgAAWNYCAACRDAA==
Date: Wed, 11 Jan 2023 17:16:38 +0000
Message-ID: <f1133d22-f737-ab98-6913-9ce5b0498193@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-3-herve.codina@bootlin.com>
 <7a36f02b-1ba1-b509-4aa0-c5c37a3cb3ef@csgroup.eu>
 <20230111160651.24538b35@bootlin.com>
In-Reply-To: <20230111160651.24538b35@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3198:EE_
x-ms-office365-filtering-correlation-id: 5255d183-5e09-4b15-02af-08daf3f79985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  sdjv/hRVS81pnVAmG/ycWFT19NaCObOe0yMAbnpSIGnS3RXHI7q5m5i6JPzkZNSXaqgz+KavyR8O9Ygw5BFtmcCOkRCiQHsF1mn3myn5Yl6MKjAuAvwSlr4fH/zgpLOb+7k+lsWQTJDVetovCF2Wy3okET2q426FYsq+F0XoFHq28wIJ/GwQq50ZnSUMo9NVmCx2UbFy7ElNFpo/n3K7ibtzhv0yco0tRmjVRqxTHEeiuJVwaT41x/6s7ZAN6+nfOvcQSOlSi7UpPSqcIX6KyVdLSzIAcpGGs9GwLCkgjXixLktr/p19XcFI5PKloFnInX3S2ptYN5m3WleR+UkEJQbwwnK6bOLfNQpZFI1MuAdRBszUT5L3eDCZVBsdplvsiEY7r/1nGMa855iG62uAzgcIxxTR88hJXb/h64FLi67MxNAgh+NXFEWPXnSUStrH3fugynwFRjn7eEtZslWdlrwfgw67KOKXHzH82CailPI6wvEnYNCkvEffy5vWzDfFuXq6jpafbTWPnn2kzGINAeK1sGHFSQtNhXUOt5ELiq1KA1ypRf9Sl7qI7Lxjr1sUuoW80V8rvFERX9cx7xkEkxN5GcKabDjNaa4sy0QlhgzewyPzjOFWTSOYY14yKrF+nrpfCyj75mHcZEiVRjOl4hsBeQd3SuD5130Eba90EjXdoXHwDzO8IhExzCdTKrt4oQ3Rtnkj5t1uVc8ksAovikEvAE05wxJ3GFda+uHYFikOZH5DbJUE74wkz6PG72hLi83T/U3B90dQCmmlCdWg2g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(451199015)(2906002)(44832011)(2616005)(66446008)(66556008)(7416002)(66476007)(64756008)(6916009)(66946007)(5660300002)(8936002)(122000001)(36756003)(186003)(26005)(6506007)(6512007)(31686004)(6486002)(478600001)(38100700002)(76116006)(41300700001)(54906003)(8676002)(86362001)(38070700005)(316002)(4326008)(71200400001)(91956017)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eWZOMzFNZDd6bW4rbGtFT2NTZzFHU3ArT1VROUNTK1A0bXBNTDZPUjhDNHA4?=
 =?utf-8?B?MEIzNkU2R0M3dXNkbytQbFJ0M0V4VlFiOENMS2NWU1BYUldFOTA4Q1dSQUp4?=
 =?utf-8?B?UVlwVU5FK3MwbG9QNUZhcGZ0MHFkeit6c0FWWjA2WFlVWk0wQ2xIZU9yT0tS?=
 =?utf-8?B?bjN4VWpBb0sreWZMRjBSVGpMMEFGQUlHNS9xMEVxTTN0UjlvcXVtcFJNajF5?=
 =?utf-8?B?R2FHd0NMRFBBSXNaVXdPYVJPekFzUEVYYmg3MFFoSlVCT1VYcW85b3dFN1Zs?=
 =?utf-8?B?bWFmQlVlZnlqRW1VRDROZlFQaDZuL3lFMzB4UEtSVXJNNVpuYnlFaUNISEJO?=
 =?utf-8?B?M0Z2ZjBKTFF3M1lFekIrQUlTYW5GM2NoK1R3N24wN1dxN25mam1LMU81cFAw?=
 =?utf-8?B?MXlnRXAyTWRvVVVuUFg4SndvMFZjUTNPcndOYnBIYnNlWUhjaUo2VFkxL09p?=
 =?utf-8?B?eC9RK0laaFNZQnhyK3hncWE1VXkzdFNwMHFockNkV0dPeldDYmRWM3N4TzhB?=
 =?utf-8?B?VFBVSGNuMWxtOHhNUldtdUtyUGYvVjBFNmxQN2ZGbmR6TExlSGlSeCtOc1Fr?=
 =?utf-8?B?U0ZVY0loNkhVY2o1d0k4cWluOGZoRkZiRGVPbnEwK0lrVW5mUWFyR3QrK1FZ?=
 =?utf-8?B?MTB2M3FPSUEwS2NydC9WcnNURTVKY3FxRjNuQ0YrdkQ0YU9ZQTQyWG55N0Z0?=
 =?utf-8?B?VE0zY3B4bUJ6TU5XcnBwZTdxYUhIbDNIc3U5ODZsbUEwanllRG5tTnJkMFpl?=
 =?utf-8?B?dlZYV1krNlZRbkQ3SEVtbHpzQzl6Ri9NTkVIOEZmRTVwdkd3NzVBR2F1bnpD?=
 =?utf-8?B?TGQ1Z3JoeHZYYzlBR1V4aTIwWjdFR1g0Qk5BUW9RNEJ0SjVoNG1tdzdWU3FX?=
 =?utf-8?B?OTVVYWU1WnNZanBsVnhaR2dXRWsvR1dyWHB3Zk5KY3dMWnZ5czIrdFpiUVpo?=
 =?utf-8?B?ZGE2NVlUaDR4WnlRSzgvS0pZbGpQU2ZXMncyL2JWSERDR2puenNpbFRUSUhZ?=
 =?utf-8?B?djVTV1JJWVgzYkFjK2dkYlhXZEl3MHZnY1cxcDVnZ2djSWVKdyt4V3dvUWpB?=
 =?utf-8?B?UVB6b05hd3Q3SWR4eDA1M0RzQ3BDNWpZd1B6MVlTUEtLSUExQW9LT05UY1Yv?=
 =?utf-8?B?RmV4VkdBazhXbmh1MjVuVEc3ZGlIblJqaTVIcG1kS1RGcHJrZWoyK2plVDBv?=
 =?utf-8?B?dWRTVlJWN0NyUWpxVVVKTDN0SXUyTjBzM3lQeEdjd1dRRUk1Q0h0S3psTm1Z?=
 =?utf-8?B?RXdSaXdNQ2lnNktJdTk2QTFUSkJXbmVxVjdQVWd0QkoybEM5a1JsSTVsM1hD?=
 =?utf-8?B?bUF4R1pGZ1ArcmlzQmIyU2VlOHZMNExKS0tqMmVrRjhuSjluTVo4K1V0SGpF?=
 =?utf-8?B?RTVtMGpFYnh6VFA3NlRLUDc1Sm5OM3NwMGJCaTFYV2ZaSkJQZXFMUDBEbkh0?=
 =?utf-8?B?TWRMRXFBUW1PY3BxdW9TNG53UGNmV2dNOUJldlY0cWpycG9YOTJuYjBLYWJy?=
 =?utf-8?B?d2gwUDNrZWdNNGJheXVyOE1GVlZjUk5xMjlKZjdLUkxoZkpwOVhSaXVwMzhl?=
 =?utf-8?B?SFg2Z2ZRcmZSVmluTWFOelVWWUhpTm1YMnNMektCZkl0eHRlRGlLRmJ2S2E2?=
 =?utf-8?B?d2NWVk5QREZrWWN1Y21CUExQWlRSeGRxZ1VPdWxnRG5YWkpxTlBEUUVjTVFB?=
 =?utf-8?B?VS9Ka0FHN3h3ZUhzVHlBMlpnK3hZWUlkbjk0N0RmU0hZTlB5R2Y5S25CTFVN?=
 =?utf-8?B?eDVGNVdzYlQrYlp1anN1aExESGRYb0FSU1pCMU52WjN2Q01lNTNZb1NFQWJN?=
 =?utf-8?B?UWVHZUVobWR5YjN5TjhLZm4zeC91dmZmSy9YZ3UwQzUvUkptMEhHT0xscWtJ?=
 =?utf-8?B?Q20yOG9XNjY5VERBWFRqTzhhOHZGSUlibm5rekZKS3hpd0hYRC9sS2ZXQnFM?=
 =?utf-8?B?aHhXQ3YzcjZtTXgyYXB5ZnhyVEkxbE5ab3ZTTnZqZ05NNTkwSlEvcVpNN241?=
 =?utf-8?B?L2JwVXFhYTdjcFpGaFBiMHZncDJsTUNBS2FnaE11RkJzbnIwNUpSbFU4Q3Jv?=
 =?utf-8?B?cnFjbHROdDQ4TFJ6bDlUaG9oMnpMMUhFek05Y0dyQlVSQUFrR2hMWkMvSjNT?=
 =?utf-8?B?YjJ5N1QzL3ZHblpLaGo3SFd1MUJMbG9QNDROK2pSVlV2d0Q2WTBMT1JpUG9Z?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74FE148B92E81246BEA7AF92ED361F52@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5255d183-5e09-4b15-02af-08daf3f79985
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 17:16:38.4292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph4jq2938jUC0bbCaB+0XkORiiNPIgzPzcCefYX6ip3YHOZxV+On8M9Ke5G5gfvYLH4A2tR6u0XW4LIlwMdJV8OecRBOMOJufdVz2iKXOAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3198
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAxLzIwMjMgw6AgMTY6MDYsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBI
aSBDaHJpc3RvcGhlLA0KPiANCj4gT24gV2VkLCAxMSBKYW4gMjAyMyAxMzo0NzoyMyArMDAwMA0K
PiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0K
PiANCj4+IExlIDA2LzAxLzIwMjMgw6AgMTc6MzcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0K
Pj4+IFRoZSBUU0EgKFRpbWUgU2xvdCBBc3NpZ25lcikgaXMgYXZhaWxhYmxlIGluIHNvbWUNCj4+
PiBQb3dlclFVSUNDIFNvQyBzdWNoIGFzIHRoZSBNUEM4ODUgb3IgTVBDODY2Lg0KPj4+DQo+Pj4g
SXRzIHB1cnBvc2UgaXMgdG8gcm91dGUgc29tZSBURE0gdGltZS1zbG90cyB0byBvdGhlcg0KPj4+
IGludGVybmFsIHNlcmlhbCBjb250cm9sbGVycy4NCj4+DQo+PiBJcyB0aGUgc3ViamVjdCBjb3Jy
ZWN0ID8gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGlzIHBhdGNoIGFkZHMgc3VwcG9ydA0KPj4g
Zm9yIHRoZSBUU0Egb24gdGhlIENQTSAoZXhhY3RseSBvbiBDUE0xKSwgbm90IG9uIHRoZSBRRS4N
Cj4gDQo+IFllcyBleGFjdGx5LCBpdCBpcyBhIENQTTEgc3VwcG9ydCAoa2luZCBvZiBwcmV2aW91
cyB2ZXJzaW9uIG9mIFFFKS4NCj4gDQo+IERvIHlvdSB0aGluayB0aGF0IGZpeGluZyB0aGUgc3Vi
amVjdCBpcyBlbm91Z2ggb3IgZG8gSSBuZWVkIGFsc28NCj4gdG8gY3JlYXRlIGEgbmV3IGRpcmVj
dG9yeSBkcml2ZXJzL3NvYy9mc2wvY3BtLyBhbmQgbW92ZSB0aGVzZSBkcml2ZXJzDQo+IChUU0Eg
YW5kIFFNQykgaW4gdGhpcyBuZXcgZGlyZWN0b3J5Lg0KDQpJIHRoaW5rIGZpeGluZyB0aGUgc3Vi
amVjdCBzaG91bGQgYmUgZ29vZCBlbm91Z2guDQoNClRvZGF5IHdlIGFscmVhZHkgaGF2ZSBpbiB0
aGF0IGRyaXZlcnMvc29jL2ZzbC9xZS8gZGlyZWN0b3J5IHNvbWUgY29kZSANCndoaWNoIGlzIGNv
bW1vbiBiZXR3ZWVuIENQTSBhbmQgUUUsIG1haW5seSBpbiBxZV9jb21tb24uYw0KDQpOb3Qgc3Vy
ZSBxZV9jb21tb24uYyBpcyB0aGUgYmVzdCBuYW1lIGV2ZXIsIGJ1dCBpdCBoYXMgYmVlbiBnaXZl
biB0aGF0IA0KbmFtZSBpbiBjb21taXQgMTI5MWU0OWU4OTM3ICgiUUUvQ1BNOiBtb3ZlIG11cmFt
IG1hbmFnZW1lbnQgZnVuY3Rpb25zIHRvIA0KcWVfY29tbW9uIikNCg0KU28gbGV0J3MgdGhpbmdz
IGFzIHRoZXkgYXJlLCBqdXN0IGJlIHByZWNpc2UgaW4gdGhlIHN1YmplY3QsIGFuZCBpZiB0aGUg
DQpmaW5hbCBpbnRlbnRpb24gaXMgdG8gaGF2ZSBzb21lIFRTQSBjb21tb24gdG8gQ1BNIGFuZCBR
RSwgbGV0J3MganVzdCANCmNhbGwgaXQgdHNhLmMgLiBJZiBpdCdzIGRlZGljYXRlZCB0byBDUE0g
YXQgdGhlIGVuZCwgdGhlbiBtYXliZSBjYWxsIGl0IA0KY3BtLXRzYS5jLg0KDQpNYXliZSBvbmUg
ZGF5IHdlIHNob3VsZCByZW5hbWUgZHJpdmVycy9zb2MvZnNsL3FlLyB0byANCmRyaXZlcnMvc29j
L2ZzbC9jcG0tcWUvDQoNCj4gDQo+IFRoZSBhbHRlcm5hdGl2ZSBjb3VsZCBiZSB0byBsZWF2ZSB0
aGlzIGRyaXZlciBpbiBkcml2ZXJzL3NvYy9xZS8gYW5kDQo+IHJlbmFtZSBpdCB0byBjcG0tdHNh
LmMuDQo+IA0KPiBGb3IgaW5mb3JtYXRpb24sIHdlIGhhdmUgc29tZSBwbGFuIHRvIGhhdmUgdGhp
cyBkcml2ZXIgd29ya2luZw0KPiB3aXRoIFFFIChub3QgZG9uZSB5ZXQpLg0KPiANCj4+DQo+PiBC
eSB0aGUgd2F5LCB0aGVyZSBhcmUgYWxyZWFkeSBzb21lIGVtYnJ5byBmb3IgaGFuZGxpbmcgVFNB
IG9uIFFFIGluDQo+PiBkcml2ZXJzL3NvYy9mc2wvcWUvcWUtdGRtLmMNCj4gDQo+IFllcyBidXQg
dGhpcyBjYW4gYmUgc2VlbiBhcyBhbiBleHRlbnNpb24gb25seSB1c2VkIGJ5DQo+IGRyaXZlcnMv
bmV0L3dhbi9mc2xfdWNjX2hkbGMuYyBhbmQgaXQgc3VwcG9ydHMgUUUgb25seS4NCj4gDQo+IE5v
dCBzdXJlIHRoYXQgcWUtdGRtLmMgd2lsbCBmaXQgd2VsbCBpZiBzZXZlcmFsIG90aGVyDQo+IGRy
aXZlcnMgaW5zdGFuY2VzIHVzZSBpdC4NCg0KRmFpciBlbm91Z2guDQoNCj4gDQo+Pg0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+
DQo+Pg0KPj4gQ2hyaXN0b3BoZQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LA0KPiBIZXJ2
w6kNCj4gDQo=
