Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5B69B10F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJHX22JpQz3fZw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CtuDAX+y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CtuDAX+y;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJHNg5kZyz3f3B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:30:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8I7x805Deq96lPJ+Fl17Ej96xyr7TqseFsb887YY2lEp28Dy8qXXpzqe7D45lEk340BeaAzyQpR4dB5bnIfcVIfXefEvpZPq0dxDzyRVfHMTzVHko39tMZ4GEJ7BVEuVxC+IOZJW+f/rCagjoTRAZW66a7yulWZ9BmMeLzu2AiGCGt86ziEohFADbPuxXaoEMgOHRRbE9lEbI080k9bBXE4AdyijlyrS6E5LdD3yGDvwtzv2qH7zFmUyheU+svKx+CWX8SSkp/1tkcRYZ/ne6QgiV8qEK3trkuqiEblYI4crTTAZDRXkPOdn36cWks4QKPluY+OlI0vuj/m6Kw2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLzT+/qmNf0VkdDKxgqeh0britx/bueQ95SVNxXeIjs=;
 b=JQYpFNul0YYx5/KY734f4kALe87Y8xhOWaRDfqecdxMN3WH5hsl1wSc5JGosTUxfBRZh79F1C5LcoNRDiP2MHLIUNvHVl3YEaogJhKXRpyKCxKHR1lRg2oNZzy8tCpdM1DGBb5iA+3mDMp56Gn4vUFGvJnv9PGaiZ9tNXRNEdg3orbt2JoV3oqSWiw4yDdsIQlC0ZD6sGn5xvHvz2Ll/Ms2O0EI/Rx07SUwoI9QiLvpqksGY+JsGLZkbEN1EKyjgrI0XrqG1h2r3eZZ8Bzxb7ZUSq++SrN1l7Bp+M98QScfl0ZDlhe1dq/l6UrTfadH0cW+gLKnRh+UQjwElJ+fu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLzT+/qmNf0VkdDKxgqeh0britx/bueQ95SVNxXeIjs=;
 b=CtuDAX+yxt8ltgfNOLwMRdsYNDfffRp9PccIMPCegSVHfNZhWD9Xiy1T/DsinXaJYwSm1hJ5H7drCsQq4BTasVMb/ay6NkIXBP/qoxvKRthMGvERZVzy3MKSsteGb6+ZFDJq0ikE6nvcjnQLAgdIHG3RbI0Ty93qCksteyy7HAjYC31XA/VCcc6LJCzwtMkEIdJBaIv6B9jOEU1JoD56D8ZNN3WJjZh8UDb14WxOr9c76rLPRX2LLSX0ipwCFGNRRKRA/L1SQ+79fc89ZeZkS5eo3/6TikpESkaEzJndGlA82r0Vs+tGWwgEgZGq6QJh8nko56BjtmXMJnjdNwGiNg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1665.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 16:30:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:30:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v6 10/10] MAINTAINERS: add the Freescale QMC audio entry
Thread-Topic: [PATCH v6 10/10] MAINTAINERS: add the Freescale QMC audio entry
Thread-Index: AQHZQuAogmKtyPu4TE6Ld+B6lizV4K7TVIAA
Date: Fri, 17 Feb 2023 16:30:21 +0000
Message-ID: <113508fa-ebb7-886f-00d6-a003f4f304c7@csgroup.eu>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-11-herve.codina@bootlin.com>
In-Reply-To: <20230217145645.1768659-11-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1665:EE_
x-ms-office365-filtering-correlation-id: bf5439b5-85f9-4080-80e5-08db11044381
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TmyTJlFJKa0MJ6NHkTijrZSIsKeVlx14xn34VAHe1OuEB8a53Kq0VC3WVghixBU7M9DTZ8B5A1mVPYHMiXUC+FFmCZ6HWHASoP1yLrZJxNuvrfDBw/ZFiCozMB2hebaBD8jI152e4l0HosgkxBWi4wtG4tgqht47KbsV8eFVGjM9wz2n5z6wwugJt9HipN3MMGjNp1Rrcc0YrKMMq2LrvMsPYRca1LMP7/hAU6+NvK9rzer7bLof9HdtkQe8Tz5mNd/nrVqwGEu8+hrWUyhhaOanCDcULTPi77YKPHUqDjnsqkR6jAMy7milRcZGT7aSfuzzbdC1eikG9CcWkAt7dZsdsIIr54nGbNL+JP0J1yOoevUzAZNxeInqmbp27Irg4DZzwIkIhwGab9hvCPkOL5S5amkHoMORD39uU1unmEcKSCm0DhZHQNG2dEJM6WPN3x5WGHh3OEpQdKyCP4EvZBXCjglxk1GNs5JKQSn/z1iU8kesIRNee9dOXYcq7VQHrSL4VXuKpn0PXEUN12s80t91yziwkkbPVmXf/ZxNo85jk4uZnyFJ22JkAXuMPXTZ8Ocpx9bxGurCrV50/NQGK/nY/q39P0PLC9qrb4sJiZZNyUsVZKtbGbkfe+UsiyaLW171Wp70XCYXOHyFvgendYM2ZjnYTjOtMvY7AVMcpY+zgcyTdZaSxXENEX2yuXXxxllTuNBUGSrH4g5Vhs02LV7MrVObcKYSOkxptPy2GgyKhculzo8qjXXprDGzfNlrIY0l9SFRN2nE/qQ8gZoO5PYOUWHB4m74rAZ2gaNzsMk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(376002)(366004)(396003)(136003)(451199018)(122000001)(38100700002)(86362001)(921005)(38070700005)(4326008)(31696002)(36756003)(44832011)(7416002)(5660300002)(4744005)(64756008)(2906002)(76116006)(66556008)(8676002)(66446008)(66476007)(66946007)(8936002)(91956017)(41300700001)(2616005)(6512007)(186003)(26005)(71200400001)(54906003)(316002)(6486002)(110136005)(478600001)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekt2TkIwK2Z1czRaUnJXTTVuQUtOdGxZb2NJMldaRk5rUG8rS1c5NXdBZmow?=
 =?utf-8?B?RzRrR1N5NmJ5bmhGbUk2bmtSMlBTR0NxbXU0QW1Bc1Jvdk1naWp6cEV4Tjd4?=
 =?utf-8?B?MkZxT29hYkNySGIwTHB6OWJnOUx1UHNtZDgxYUlQdTBqV3RBd1NtaU1VQmJu?=
 =?utf-8?B?SzRYWThXY3NBcWxOcUxDRzQyWXJldnZYcW90OXJhbHd3bHV2MWNzN21PVGhH?=
 =?utf-8?B?THFmbWdjMGZTVVRrZUJhK1ZmaFBqSWdBVGpzdUgxY2g0UG1tTTBpVFBXa1U3?=
 =?utf-8?B?MU5wMVQrREovdjYyL2cwRG9iRFU4cEFiYWxXZTZOeERnMnRiZU5lZGdUNDNB?=
 =?utf-8?B?NDFadVpPN2ovV29jdy9rcFprampYdG9TVk5nT0lRb2RieVN4TU0yN1dnNDFr?=
 =?utf-8?B?N09ldFc0ZDdEdElLSnBUNkUwZUl3RitCdXlVV1VGTDZWbEFRbTByOUxHamth?=
 =?utf-8?B?L2tjR3JNNHpITUxnNkxZM0JaYnJ5UEJuMGVQYnhwSzEzK3VmUnFYcXUwZ2Nx?=
 =?utf-8?B?U0d1ZDhQU2NOM0N6SC9iY3M3RklHeERCeHVqM3lXOUozYzdBN3oxaCtKd0l1?=
 =?utf-8?B?R2R3TTAzUXFhalcrVDVCREpWSFhNeGlKbWxKTlF0cW92THplVlhYbHRYL0pi?=
 =?utf-8?B?K0VIZFIweUJKYU1aTUlMbmNxRjR3dmVKWG92SUtqSXhoRGNDVHZvRDVGU1FZ?=
 =?utf-8?B?RWFoZllxOUFFOUlSbjdVTkhRNjVLKzBYSEoybWo1QTA3S3kzaTRCUDk4Q3do?=
 =?utf-8?B?bzE4cnYwU1RKcUJONEVYaWRFdER0MXlCbE5UT04vU0V4UW9IYytGbGtBc3c5?=
 =?utf-8?B?eXh2K090Y3RkNUdHbFAvNGxDeCtOZ3pUL2FVWEhaREFmT05zV1lnbTVWRjI3?=
 =?utf-8?B?R2R3WENDZElaMmZmcFkwaHh6dGtFbWcvVmIrNDJ5NGFFNzZGWFBlTnl1TzlQ?=
 =?utf-8?B?YWRxZWFaV0NXNnl1N3pQcGcramFGNTlodjNrZjdzTnphWUVsN3M3ek5SNjRa?=
 =?utf-8?B?cUZMR05Xdk5XL3U0YlZJNklJaS9xM09IT2tnRHdzTWhwQW8reFR6OGVNdXpI?=
 =?utf-8?B?UDlPWEZkVkduSkkvRmZVSGFFMVFjYVNNN3hEcE1TRmh5UVVzVnJmK29ON0Vh?=
 =?utf-8?B?K2k4dTJyVHd2TmVjWWpkMTJvU1hxQW4veGpIV1lHUXBxRStJY1lmdm0vWTlz?=
 =?utf-8?B?TEx4Rmt4eGZISGJrbHB1MzVOb3hkd1MrVlpxNk5tcm1yY0pGY2xoZ2xSMjl5?=
 =?utf-8?B?eWxxREt4cDN2YWM4TzhIWEw3MEo4K3lsS0htS2UzSEd2dVZPVnhKTXlMMjB2?=
 =?utf-8?B?QnRNV0RmMDRyV3lXK28wNnc0RTY0QXVtL0ZZMCtBcWpveHRnSEQyam1KQ2dY?=
 =?utf-8?B?d21SdU5OaFlWSWNDU2dIWEMvcGpmblR6V3dCdG14TWlPN0tTWlJPYWllVndi?=
 =?utf-8?B?R3FWcEl2U0xYU29XMEk1Rkd4MmFsVGExMHRvZGZQb0RweHlWNlNJYWNWTjJN?=
 =?utf-8?B?K2RHcEwrd1g1YlgzVGx3ZmhlRlRvNzY5V3dqK2VYRGQ3dXJ5SXNpZTNNT2dC?=
 =?utf-8?B?T1JKbXJIRnoxUmFMQk5Mc2laTFJUVFMrcE8rT0JTclh3OXdOUE9vNmJaWTBH?=
 =?utf-8?B?RGFQSDJpWnFOVDZveWF1dy9oTkJDWURxc0s3MlVOL0NmcGJ5bWFtRDl2TGVh?=
 =?utf-8?B?YmxKTzB1N1o4RzdONy9zVXZhNHJnV0RUMGVveUhXZ3BQbXZsVjllbWtYb3Iw?=
 =?utf-8?B?SmovTjM1eWJmQk9jRUwxYXRlNDU5NUd6RFFTM3ZKTEp2Z3Q0RGw5ZEh4VFR0?=
 =?utf-8?B?NXRFMG1RMEhNZXljSVdlc0VCN3E2UUhPMDJ0ZEtjUWFHcXVpR0liQkdXMWFU?=
 =?utf-8?B?K2kzUVNFVnh5Nm51Y05PYkJZY3hPQkRuTXdWUktVUit5UStZV0hJN2FEWXB1?=
 =?utf-8?B?Y0hCM0xmQVJsZTZueTg4UmxQWlliT1BmUlhXUFNDNUhTbkt1K3RTSlRNRURN?=
 =?utf-8?B?NjdIckF3YnJETlhFRE0vaENHU2NwVUZpblZUS2N4QndyQzVtQkN0cks4bEFy?=
 =?utf-8?B?YXBzdWZsQW5hVitQVGt5MmhVK2NjOWRYUHhvVzFVMXFJQ0o0TmIvTlBMMXF0?=
 =?utf-8?B?UWdaQnEvVndya3NzcnV1UFBwS05NVTJEYzVhanVxMWx3Nk11RSs1SDRiQ1NS?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB928255EDA8D04EA6A68201532609BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5439b5-85f9-4080-80e5-08db11044381
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 16:30:21.2846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyLrxElFkLBRe5KYCNQm/fqrFJUC/VvymzcAyrGmzpx5cuCHooa8cI7vbUgrqbn23UXgE8+1OEtYXeJP+lntdqfFZRyhJzsEv3y1doUbLNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1665
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
ZnRlciBjb250cmlidXRpbmcgdGhlIGNvbXBvbmVudCwgYWRkIG15c2VsZiBhcyB0aGUgbWFpbnRh
aW5lcg0KPiBmb3IgdGhlIEZyZWVzY2FsZSBRTUMgYXVkaW8gQVNvQyBjb21wb25lbnQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4NCg0KPiAtLS0NCj4gICBNQUlOVEFJTkVSUyB8IDggKysrKysrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUw0KPiBpbmRleCA0N2VjYTViMDZjY2UuLjQ1NTNlNWEzMGU5ZSAxMDA2NDQN
Cj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTg0NDAsNiAr
ODQ0MCwxNCBAQCBGOglzb3VuZC9zb2MvZnNsL2ZzbCoNCj4gICBGOglzb3VuZC9zb2MvZnNsL2lt
eCoNCj4gICBGOglzb3VuZC9zb2MvZnNsL21wYzg2MTBfaHBjZC5jDQo+ICAgDQo+ICtGUkVFU0NB
TEUgU09DIFNPVU5EIFFNQyBEUklWRVINCj4gK006CUhlcnZlIENvZGluYSA8aGVydmUuY29kaW5h
QGJvb3RsaW4uY29tPg0KPiArTDoJYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnIChtb2RlcmF0
ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykNCj4gK0w6CWxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnDQo+ICtTOglNYWludGFpbmVkDQo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvZnNsLHFtYy1hdWRpby55YW1sDQo+ICtGOglzb3VuZC9zb2MvZnNsL2ZzbF9x
bWNfYXVkaW8uYw0KPiArDQo+ICAgRlJFRVNDQUxFIFVTQiBQRVJJUEhFUkFMIERSSVZFUlMNCj4g
ICBNOglMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ICAgTDoJbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZw0K
