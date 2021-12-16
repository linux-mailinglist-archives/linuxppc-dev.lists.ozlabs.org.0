Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B171477A2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 18:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJdB09cvz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 04:14:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJch1wB1z2xsS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 04:14:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEqp8ZH72botkhizLMNNguM9Evarsh/rIUHUyS9CmTjJdoOTkYbSPQGylUPNshtSSGV08cysLNXnmLNw3MlZOAVah9ViPsxxnfJC539VrYTs3F+T84M2F3qsRXDIwPIrJCtoIodzNg+k5QIfDpMBPrjy2hYo+gLGrfK9vYyXcOWXCucsaeNzL3mFv7/2jOyoKaMR4zVRzLHJAKkux2HL02R7qum1Ndz5BPLN+vzuxjFLhDECzqZUXPRc0/H/vQ5NqfYL64l11A/IROBXbWCmRVeyLf/LWZi64wreRmyVTujRMqOIVwl8wodH8J8TVzy74aCsvYVCAk7NNaQRvohQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AA5A1o0q5404uN/5Bkw4XAA05/0yWV77QN06VNPc8U=;
 b=jMN4WOpKL56jl0tyPdkHD5EwjhwrM1HuduUR7Oenu3uSKsbMOdYqQLfnUeURps9cSVPW3QKfqTMJ6D9MRiUjXCWJeK3hkKxIXzAl9HvJoQvgEHz1tyfcNmLcRZSpcljmVYY3pDWGSjlcqrWz+ZlvsrdbGoe+Vk+jH4IThnh5x31+3xE1Dyqouo3tUbFX6xBiO4czzRA7uKI23r33yYYsdQMPM5exw8WU1F94hNWV4hhLT9PaKRfrEmLkn1y2UYNNw2tUOpjhn/cOQxRKRtF8Zf4qJz43yZYq+RQxheXvdPwnz0OcMr33fLG/2Bnp2xsWuphvzMSWWrDbiNaMd9Oj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2628.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 17:13:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 17:13:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Will Deacon
 <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Steve Capper
 <steve.capper@arm.com>
Subject: Re: [PATCH v4 07/10] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Topic: [PATCH v4 07/10] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Index: AQHX7FeZBU3PIhmcjU6PaLYrRJLsx6wp7vGAgAt48QA=
Date: Thu, 16 Dec 2021 17:13:47 +0000
Message-ID: <5393b7d1-33e0-2f5c-f2fb-84e6319698c9@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <f292a83707b64c73fcb02a8708f18f09422f7eea.1638976229.git.christophe.leroy@csgroup.eu>
 <1639043741.e2zqhea1ix.astroid@bobo.none>
In-Reply-To: <1639043741.e2zqhea1ix.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f34728fb-a066-457f-9a6f-08d9c0b76bf0
x-ms-traffictypediagnostic: MR1P264MB2628:EE_
x-microsoft-antispam-prvs: <MR1P264MB262893DBA84A0D3A383A5B41ED779@MR1P264MB2628.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4csXOK/yA36/41bYujMozHK7v+7uENhGpiochkGzC/hsmxTHRdAC2kTIqcOXU/IYZe/5jkSN6yWVBRKr64D9EETVi/Y7+S1y4GI9fGnKPTCTQPk5uSx9xaad1/p3Bym9+kZQWu8sWgotVTXKVs8SXGYykhoKmGOI+gzOnveERWJaNvZyPuQp8bO42ovl11JtbOFeZX/Z6KtmqqmYGauWNiUguNIvA7Dc+jCfvtNNfnB61M6Zs7obMWpF2kezZACUEfxIMHAaCSek+lxXT6RozwPD+/trzdvk2mlDgN4IK5ujJS+cMT+L8AQX8UqauS3fkQV52nMOWYwkNKlw41+rlfQ4NkAKHfe8eLwKrugGNysE8wEVAafvpDOR1pQfObOSOPgL8fKzRAP0C+5wWMhdkpXMnYCGxchZ4IVAhmwxzXP04Y1kFbqmYe3zsvCEnhJy7f4hEkTjpqtB4vWt6Wd3gPGHJsIkkgJtmMmZJY9SpehXXL39AyynniuSw+3//Rc+mnFN7o7RkmWXfNB3TXC5zK1fk6RSMyPmOYewwILPowdsyHs9CLQxywL8v4/t8VBZORWyND1mLCFahIHktndffPaNEs8rcufLaN7HFmVh6jQknfKZ5s8etAJrG8XnIPPsSSG64hyz+Rq5aSGj8FlFqEPxgFQU/zcZFKEHe5VZh6V0rpDH6nZPX742A4ZbRh6ncNgp9BEveCgvH3NXJjKQlWCeLxp4Q395MefuKeSmosNSRmhDvLGvr925PUy61vqLY5vyh6yzEzpn3CavV2XLo3FTr6of7XuYIZGOZPlDeA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(7416002)(8676002)(38070700005)(186003)(66946007)(31686004)(76116006)(26005)(91956017)(64756008)(66446008)(66556008)(66476007)(44832011)(31696002)(4326008)(38100700002)(316002)(83380400001)(110136005)(54906003)(36756003)(6506007)(2906002)(66574015)(6512007)(6486002)(508600001)(2616005)(8936002)(5660300002)(86362001)(122000001)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekMrZzNrYU8rMERreGtsM3dtejFCQ2xJZTJZNjJiamQ4dThYZjdHQS9meDNV?=
 =?utf-8?B?V3gzZFZIQVROajF6czF2V3FTRllkZytEU2E2L0NrZnlIVU4zU0lKZXlPc1kw?=
 =?utf-8?B?b1dHbEFIa0hRNTBjbVJSWW9XbzZKTDl1MTFHUHFoUW5yRmg5eWI4NDBKdVhS?=
 =?utf-8?B?cmsvZVRPaEJEaXBuR29IUmFuSFRFSDFmWXZPcWlubldhbURTb3RxRkRMTEl1?=
 =?utf-8?B?WFZIVHFJZlVoZkVLdEpJS1FXUUtveUd1QW1NNk9yNzQxZnhEV2JpUXk4SUNx?=
 =?utf-8?B?cVBTTjNxRTZ5dmNIV3ZjdU42NkZBbjM1dGFLUEZBb2RkS3lFMWJ2OWNXMUV1?=
 =?utf-8?B?alJsRk5NNWdJaUo3a3ZoZHdDME1BTHJHSHNzQmV6SmZoVWluZDRjekZ4ek8v?=
 =?utf-8?B?TDNoUDhNVGRRbVppNlY1VFRZUTNsTkUyc3E3OUQrWkpVbkVtQUpDK0Iwb2pz?=
 =?utf-8?B?djd5TE1IcTVyNkhvbE1DZ1FGMVdJK2Z1cEVrVTh1aFQvbkNjK2VwVnMyZkwv?=
 =?utf-8?B?c1FwY2tFek9ISy85dzAyUWNScnA1K3FhK0FhN0t5L1Bra1JkZHk3RTdhbW5B?=
 =?utf-8?B?OXIzUFZFaXRWVzdwVG5XeU9QWGw4dnBZVFJEckpGMHdaanFDN1hFOU0yUXFs?=
 =?utf-8?B?L2xxNC9RZUFhSjBZMm5UUU9YaU1pZkk4eXZ6ck9uRWlJQ2xlcElWbXZyNEh5?=
 =?utf-8?B?VkNiQjdydFFoc2hXaG1nL3luOS9nODZUell4NlBXcjBESS9yMmREeitPVmRh?=
 =?utf-8?B?b0MxSnRPY0E0K0tDMnhDRmdCdW5CajVKc2pQeHFLOGFmQ1QrSlF4RmpJUCtM?=
 =?utf-8?B?V240WElpT3c5WXo4RU5Ua0Q3SmNCdlRnbzVpRlRKcXlsNnF1dyt0QkZscXp6?=
 =?utf-8?B?cHRrbXFXN0xSanZpdXpGU2ViOUxCTjlpSDNPdTl5Y2JycC9NdHl2QUQrTEpv?=
 =?utf-8?B?SzE2ZDRXZXdPVytwd3VJMmUyM2JLYmFWeW5ZQ3lyRENad2ZRZVAwNXRUblpN?=
 =?utf-8?B?aUNkaG0zc2hDT0YraEFQbUNtVk01eE9LV3Zyc0QvcTZ4REtYaFlvVDZHdGR5?=
 =?utf-8?B?UWswOVU2dEVqSG9IY2hFbUw4SUNCNEYzaUJYRFJxdkp4cXRYSllMVU9ROXV4?=
 =?utf-8?B?R0xRK2VBc29zUmFPbmhPSHJXZ1NacktDcnlsUC82R0RLUkhYaE14NDU3MDRv?=
 =?utf-8?B?STd0UTlmR2xTTG1VSXNWV0pYWnZnWmhmcmVtYmV4ZnZ2ZTZDY09TVXVWcTZU?=
 =?utf-8?B?WnQ3MDVmM2IyM0dtcWViZFJPUjZWMENvUUU0S01UbFN4dlZJNUtNR2dPNkYz?=
 =?utf-8?B?Y0VXVXNEVW1uMnpDLzZ5ZjFIMVZFMHF3RW9OM1h1ZnExdkRTQzlEby9memJP?=
 =?utf-8?B?VURkdVZkVlhDbVV2WHR2SEpzNGhCTWluQnJWZzl5SXhCeW5CSFR5cDZYVnNy?=
 =?utf-8?B?ODc2MzBObUpRQmNZTEgxNjBnb3ByYVBYZFpzL0RieU9pSFFHVUhvUlBPbk1x?=
 =?utf-8?B?V3RTTEFKWXRxNHZ2bWNKcjFUR2RvZVNLYW51anF2dHEzanVhM21qeEMvVmZ6?=
 =?utf-8?B?TEluTUZITElLa3l6azdmY2tmNlphTE56anJwcmMzVzUrSnIxZ2RVNlJXUk1n?=
 =?utf-8?B?aEhjbE5Gb2lrVjI5VzJQQ1VuUno2K1l2K1ZxS0VBK0R4T283SzVkYm1yZDJ1?=
 =?utf-8?B?UHJGcEo1UzAvYm15dDZMUWY1SWhOT1cyOGFHNDZvZWJwRVBIRGlpV2hUYVNq?=
 =?utf-8?B?MHVCSE1VNDBWRldybEpyMElkTzhHUUlHYVU2aVU2Q1ExcnZkVGlLUDltc3J6?=
 =?utf-8?B?SUtjdHBVeDFzTnZpSzlxY0RjOVV6ODhweGUyV2NOckp5MkQ2ZFIyNmZld0J6?=
 =?utf-8?B?REdEOTJWc1YyR3dTeWlpbjBTdkhWQ2hyKzNmbGNucEtoQXJpbDVKYUNOV2g0?=
 =?utf-8?B?ZnUyVkNtbGpoRDdPQ3BDdnRlVnRxckdKME1OL0hHQS9rUTRaODBuaGYycFh3?=
 =?utf-8?B?dGdYcWZ5L05WREltaUFZOVFnYnJsb1J5NUFEOEJJWi9Cb1pXSWR0RXdudWph?=
 =?utf-8?B?N3lYa2lxZWFpMG1QYTJuVXFoVTArMDdTUjVxbjZzSEdFbTg1U2orQUNGVzFP?=
 =?utf-8?B?TjRza0JiWlVrQXZBWDhjSWpDZ25TN2NqMmFnSTBPSmRjdVBybENpZDRXb2hL?=
 =?utf-8?B?UWJ3NEV6U1ZpeTZKOEZ0ZGVNT3FYWjE3N1RkcUEraDBtZk1URC9DK3BmRHpO?=
 =?utf-8?Q?DPAO2n/U7ZFsSXGNHWMqoke93BvAfxw0XHjyH3DhMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ED89247153BDA4BB30313DEA125B81F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f34728fb-a066-457f-9a6f-08d9c0b76bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 17:13:47.1489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHmeCBEvYDH0Ep7M5mG3P51k8K43xk0Z0vNxu58pVVK58IEhKltvSU0XUjyhrjvsMvMpD7nTs31b0HBiWF8TWh391M+UpmUuHCzA4hooIs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2628
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMTE6MDIsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDks
IDIwMjEgMzoxOCBhbToNCj4+IFVzZSB0aGUgZ2VuZXJpYyB2ZXJzaW9uIG9mIGFyY2hfaHVnZXRs
Yl9nZXRfdW5tYXBwZWRfYXJlYSgpDQo+PiB3aGljaCBpcyBub3cgYXZhaWxhYmxlIGF0IGFsbCB0
aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
Ym9vazNzLzY0L2h1Z2V0bGIuaCB8ICA0IC0tDQo+PiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9yYWRpeF9odWdldGxicGFnZS5jIHwgNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgYXJj
aC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgfCAgNCArLQ0KPj4gICAz
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2MiBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9odWdldGxiLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2h1Z2V0bGIuaA0KPj4gaW5kZXgg
MTJlMTUwZTYxNWI3Li5iMzdhMjhmNjJjZjYgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L2h1Z2V0bGIuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Jvb2szcy82NC9odWdldGxiLmgNCj4+IEBAIC04LDEwICs4LDYgQEANCj4+ICAg
ICovDQo+PiAgIHZvaWQgcmFkaXhfX2ZsdXNoX2h1Z2V0bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyB2bWFkZHIpOw0KPj4gICB2b2lkIHJhZGl4X19sb2Nh
bF9mbHVzaF9odWdldGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVk
IGxvbmcgdm1hZGRyKTsNCj4+IC1leHRlcm4gdW5zaWduZWQgbG9uZw0KPj4gLXJhZGl4X19odWdl
dGxiX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFk
ZHIsDQo+PiAtCQkJCXVuc2lnbmVkIGxvbmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLA0KPj4g
LQkJCQl1bnNpZ25lZCBsb25nIGZsYWdzKTsNCj4+ICAgDQo+PiAgIGV4dGVybiB2b2lkIHJhZGl4
X19odWdlX3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LA0KPj4gICAJCQkJCQl1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLA0KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jIGIvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMNCj4+IGluZGV4IDIzZDNl
MDg5MTFkMy4uZDJmYjc3NmZlYmI0IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jv
b2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29r
M3M2NC9yYWRpeF9odWdldGxicGFnZS5jDQo+PiBAQCAtNDEsNjEgKzQxLDYgQEAgdm9pZCByYWRp
eF9fZmx1c2hfaHVnZXRsYl90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVu
c2lnbmVkIGxvbmcgc3QNCj4+ICAgCQlyYWRpeF9fZmx1c2hfdGxiX3JhbmdlX3BzaXplKHZtYS0+
dm1fbW0sIHN0YXJ0LCBlbmQsIHBzaXplKTsNCj4+ICAgfQ0KPj4gICANCj4+IC0vKg0KPj4gLSAq
IEEgdmFpcmFudCBvZiBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhIGRvaW5nIHRvcGRvd24gc2Vh
cmNoDQo+PiAtICogRklYTUUhISBzaG91bGQgd2UgZG8gYXMgeDg2IGRvZXMgb3Igbm9uIGh1Z2V0
bGIgYXJlYSBkb2VzID8NCj4+IC0gKiBpZSwgdXNlIHRvcGRvd24gb3Igbm90IGJhc2VkIG9uIG1t
YXBfaXNfbGVnYWN5IGNoZWNrID8NCj4+IC0gKi8NCj4+IC11bnNpZ25lZCBsb25nDQo+PiAtcmFk
aXhfX2h1Z2V0bGJfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVk
IGxvbmcgYWRkciwNCj4+IC0JCQkJdW5zaWduZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdv
ZmYsDQo+PiAtCQkJCXVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+PiAtew0KPj4gLQlzdHJ1Y3QgbW1f
c3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0KPj4gLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YTsNCj4+IC0Jc3RydWN0IGhzdGF0ZSAqaCA9IGhzdGF0ZV9maWxlKGZpbGUpOw0KPj4gLQlpbnQg
Zml4ZWQgPSAoZmxhZ3MgJiBNQVBfRklYRUQpOw0KPj4gLQl1bnNpZ25lZCBsb25nIGhpZ2hfbGlt
aXQ7DQo+PiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4+IC0NCj4+IC0J
aGlnaF9saW1pdCA9IERFRkFVTFRfTUFQX1dJTkRPVzsNCj4+IC0JaWYgKGFkZHIgPj0gaGlnaF9s
aW1pdCB8fCAoZml4ZWQgJiYgKGFkZHIgKyBsZW4gPiBoaWdoX2xpbWl0KSkpDQo+PiAtCQloaWdo
X2xpbWl0ID0gVEFTS19TSVpFOw0KPiANCj4gSSB3b25kZXIgaWYgZ2VuZXJpYyBodWdldGxiX2dl
dF91bm1hcHBlZF9hcmVhIG5lZWRzIHRvIGhhdmUgdGhlDQo+IGFyY2hfZ2V0X21tYXBfZW5kKCkg
YWRkZWQuDQo+IA0KPiBhcm02NCBoYXMgYXJjaF9nZXRfbW1hcF9lbmQoKSBhbmQgIUhBVkVfQVJD
SF9IVUdFVExCX1VOTUFQUEVEX0FSRUEgc28NCj4gaXQgbG9va3MgbGlrZSBpdCBoYXMgYnJva2Vu
IGxhcmdlIGFkZHJlc3MgaGludCBsb2dpYyBmb3IgaHVnZXRsYmZzDQo+IG1hcHBpbmdzPyB4ODYt
NjQgZGVmaW5lcyB0aGVpciBvd24gYW5kIGRvZXMgdGhlIHNhbWUgaGludGluZyBmb3INCj4gbm9y
bWFsIGFuZCBodWdldGxiZnMgbW1hcC4NCj4gDQo+IElmIHdlIGhhZCB0aGF0IGFuZCBkZWZpZWQg
YXJjaF9nZXRfbW1hcF9lbmQoKSwgdGhlbiB0aGlzIHBhdGNoIHNob3VsZA0KPiB3b3JrLg0KPiAN
Cg0KQXMgZmFyIGFzIEkgY2FuIHNlZSwgaHVnZXRsYl9nZXRfdW5tYXBwZWRfYXJlYSgpIHZhcmlh
bnRzIHVzZWQgdG8gYmUgDQp2ZXJ5IHNpbWlsYXIgdG8gZ2V0X3VubWFwcGVkX2FyZWEoKSB1bnRp
bCBjb21taXQgMWJlNzEwN2ZiZTE4ICgibW06IA0KbGFyZ2VyIHN0YWNrIGd1YXJkIGdhcCwgYmV0
d2VlbiB2bWFzIikgYW5kIGNvbW1pdCBmNjc5NTA1M2RhYzggKCJtbTogDQptbWFwOiBBbGxvdyBm
b3IgImhpZ2giIHVzZXJzcGFjZSBhZGRyZXNzZXMiKQ0KDQpJIHNlZSBubyByZWFzb24gd2h5IHRo
b3NlIGNoYW5nZXMgY291bGRuJ3QgYXBwbHkgdG8gDQpodWdldGxiX2dldF91bm1hcHBlZF9hcmVh
KCkgYXMgd2VsbC4NCg0KTmVlZCB0byBrbm93IHdoYXQgQVJNNjQgdGhpbmsgYWJvdXQgaXQgdGhv
dWdodC4gV2lsbCwgQ2F0YWxpbiwgYW55IG9waW5pb24gPw0KDQpDaHJpc3RvcGhl
