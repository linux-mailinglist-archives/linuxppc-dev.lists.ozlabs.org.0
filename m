Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D34536BB8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 10:44:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9Fbq0xY3z3c96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 18:44:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9FbJ37Tpz3073
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 18:44:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obSuWgUNsxVBemXBF5YUgWI5EBIDuSzuPc0GpC6jowJ71Nx2wQ13jKu90RIzZMLdpg3xGeI0YtXlv/vjPp9uCJCF/eDQLL4dt1TmgqbNpsODVNQIlsaYNr4JdzUqq11N2Ba0f74y1Ztclf0zOH6JpjZWmzEt4FsrL8k3WnVaSWj7QCrBTwKo4JW63TQ2PKXBUZEV6wJGnYSekvTR3PJK5hF0HzCs2b98u3YrgPFHE/dSxzhqzm6+dsok67jFhzDQyaOsVe7rPlv6ezvTmz0uFKoP9qVcNM5IZtOuTNOj3ZZ74GR8bhJhCrA1ivxKh/JgJpw+W14uHHJyDN6nyDeyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xOVxiUcnd7Dp23xQltkGxlRQDX8HpZmZ8LzK3jSfPQ=;
 b=YuhQUCFRVvfop7+FY+C1WFl1EP6SNXMi+CsAjxgeGNKzPKC8aH5qEf+40MeJ2Ze4N0gLvIcxoraSF7IBb4nr+QqwgRQ7m7f7yjsOS6nRzH1VAuel0kaVZqJvm7QsJU+yUtAXy0cydcP/egj75k5gBGBjADwl401aOFHdILq24y7XiPmKKLtjKpgnmeO4/8UHCebdv+lBXnWdg6+KdrDF4sbOVkyVcaQxfblWuRA00tg/dDhaTXCGch+TilUgkHH5ohqEz3J44GSy0MuLyFuh4MosN4DMJnII4b9OQ+nDLbAeZilr8oDs46GgE4GN4tgVh+/QwpvpKhwoh1XqYRLjmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1813.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sat, 28 May
 2022 08:44:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.017; Sat, 28 May 2022
 08:44:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Rob Herring <robh@kernel.org>
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Topic: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Index:  AQHYcSj+9qLJZNI0xk+8W6rmCSktpq0yUuSAgAAIiQCAAAOEgIAAAFrggAAHBICAAGHoAIABKMOAgAAK2AA=
Date: Sat, 28 May 2022 08:44:02 +0000
Message-ID: <13619cf5-1fe1-c541-2188-e0bff6c3dfb6@csgroup.eu>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
 <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
 <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <f2945a3f-04c6-9685-3193-62d02e6453b8@xenosoft.de>
In-Reply-To: <f2945a3f-04c6-9685-3193-62d02e6453b8@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638c3279-cf16-4f58-90a4-08da4086372c
x-ms-traffictypediagnostic: MRZP264MB1813:EE_
x-microsoft-antispam-prvs:  <MRZP264MB1813EEF85043B58FE4CD04B6EDDB9@MRZP264MB1813.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +2NJixvt7Zr25SMQZZRDxXHl478i9BLU4ZjH4OjeiRJv+MVXufgBG1h1246e2EftAjdAmxJhJRv7SUCDkQqJIEzKijLvcaDJSJijaVbKD9Avcx4lmok3HpBix2OY28I9sM6oetrNczQ2nxYvHMePSyioGG2TvuB4RBmAREgzSlkkYxvGh3Na57ayA2ezSN2yFUPBVQkAUnMJ5GvnDM6vD4cNApkVTxMLVXeCUtrRv2hp0Oyta+b8KBdg4k/U96FZZQIpSzNM05eQOfkYC27uAG5JZ5A3PFqaLHnqcU8eJ6vsiI7pb8MgbxnZPqC/2hk9orY1D9utossDCK52P303snA/TX9X4IK4jwx9M8qYKnk00alWiHpnnvd3w/EXpvxQBp0rZyVyP0mGL+YlOaOgiVoSsQmk14JY/cmbspXTdnpdU9KkplOeV8fu9Lfr3ydYPs2VbCi9qWsarR08rawTjkhy7nSpA+TrtYpZ+tqzGbuJOM+r4QbU805X+f0rdcHFXgBM13RvB2qVUYgc71JaoVXUJYb2mkNU8/VoJGBcVSGc1c2gDS8/jCgh5twk3UdkqvkXccq//IoKCEQ/ZC5RQ5P2FAAUAn9AvY3ukFoov9/oTX2ywkCvRpZDAy0XRSYoVU8u7m07f2JrI5N1/2pXh03zz3SsXeQ5kx3QeHfI2NYFXkdUlS9D9jEpScNXC3i8im7WqffOogGJxAgubL0Et3lUkj/gtZKTi1Qs8PrG/HOvRBYDchmUDReW9gBSPjqkdodXMGwYf9bwB7HAf9rxODy2KHZ9VKsdN+PdhqASlEFO7fbhyyOdu2HQlHHG76QDYF3eBFEEIen3mbbjbNmCNcoXURD57uKt4/7L5eHx5Hg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(64756008)(66556008)(66476007)(38070700005)(86362001)(4326008)(2616005)(122000001)(54906003)(8676002)(316002)(110136005)(6486002)(76116006)(966005)(66946007)(91956017)(508600001)(38100700002)(186003)(26005)(6512007)(31686004)(36756003)(5660300002)(53546011)(44832011)(8936002)(71200400001)(2906002)(6506007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UWdoWTNFQzhqSldqZzhpMGFrNkg2emUzVXhiY1RzUUhmTkE0WFovVUNmT3oz?=
 =?utf-8?B?bE82d010RjhyVTRtcEV6WTZHeFc2S0NRYWZGNXQ2dUxFMDA3Yk14aUx0bGNo?=
 =?utf-8?B?a2NPYThHTVJsaTFPRnZ3dUV6TjZ4UnV6KzcrY2JEUDBvS1BUQmJzcVljZkRC?=
 =?utf-8?B?T2RZRTYrOGJ4WXJOandzQzIzRjc3cW0vZnIxUFhwbjJNeUowckhmMU5Jditz?=
 =?utf-8?B?SGZRWFRVRVFNM2RKVUFCWi94TVRHajY1L0s5VElEMGJNc1VPYnF0djRubnZH?=
 =?utf-8?B?SFFvMXlVNzhZNUNObkpMZjFFaDNZNUwxWmZPZVBROUJlc2ZJMVRRcTdKYUhn?=
 =?utf-8?B?bnJhZm80RW5uY3JLQytsbUd0Z0F0NFBTcS9BTmtmb0hLcHpNNi9BR0VTeGV6?=
 =?utf-8?B?dHZ6eEpEZnVNS2RNTE1mdW01WHR2WlRiNktVOGRVTGFOeWM4dWsxcDR3cHN0?=
 =?utf-8?B?Vk9TWUZsWDduMXRUa2dSdFlHMjdUZFV1NWNpbEZxM0RPWFN1OVQxUmJLYTc2?=
 =?utf-8?B?bjc2WmFlUy9DbGF1TU9zbHRyd0JHRTF4MTJYZTJFZ3ZvZXhJTXpvamVjcjZG?=
 =?utf-8?B?eVdDYXJocytHaGF1RXhzQ21rd205TmlzV3Zja0F6WFRRNFpXMVVRcGIrNWFo?=
 =?utf-8?B?NFl5SlkxcTYyMDhqZVQ0WkJmMW9sSlVXRXdBSzhJMEV1OHVBRW9lS1phWmx0?=
 =?utf-8?B?MEp1NVp2VTBUQTBRSGdnTy9MQlNnMXlQdFZPdXVLQXFXcEJjRVNtRFArWSt0?=
 =?utf-8?B?cVBwYTZZZFFqNTEyeWMrMVRqMlB3eHZtOGU0cVc2OWY2V3ZvY2hXSDRSWVh5?=
 =?utf-8?B?RjQweEVNWEg2cGtlWW8rZmhYTE9Ga1ltejJJdk1CemhyN3MxaHE4S3J1aEw5?=
 =?utf-8?B?M1ZwbTAxd09QcytCbDFrSzhYd0ZRdkYvMmZvTTBoL2ovMWRNc1NzdUwwQWUy?=
 =?utf-8?B?R0ZhQnRWUEViblZ4ZVNQa2gvOGNCZHo2VVZFNXNIUmdidGdKWFhvb3RxNE5Q?=
 =?utf-8?B?YmROQkl4TS9hblNaNE9ZQklhQjBVRlNvSFdUbjR5TytqaGtjdzBWdDljbXV5?=
 =?utf-8?B?NDZnSkRkbUdLWTFRSUpIZ0VYQS92ODcyVTNQNlJUU3p6clNOOGtSbFVla2Vn?=
 =?utf-8?B?S0ZPaXVvUXg5MTA1QUxSaTNBWHluQVl0ekROeFZWM0RZbzRCM0NRZWZ3cHRO?=
 =?utf-8?B?K0ppeTNVamZSL0g0UHZObEdsUDdUT041L1Z1cVVKVk5HRnBNSXNOejExVENk?=
 =?utf-8?B?NjlOTE1RcUJPNzBETEptRVVOVDNxOTVoT1Yya3k4MlFGNHY4VW0yY0lIZy9m?=
 =?utf-8?B?U3VBaVdQSzg1Q3NQdGtVWDJ3OHBnWlhveExMR2lMUlpwY0F1Sld2aVlLbURL?=
 =?utf-8?B?WVkyYytvK3pOSDlRZWtkTjIzTCtIS1Ara0h5Qlg2eml5bk8vTU5KUmhBbEht?=
 =?utf-8?B?QmNsVkl3ZnR2Sk5YUVZwak8zVEQyNzdIclhiS2R1L2gxSXBYTDZvQlZmZTdO?=
 =?utf-8?B?eEJKMTFkYkJkUjhOaUZRTUZRMk5RS0NjV2daSzdnMWF3NzlDRUpBclczb2Y0?=
 =?utf-8?B?NFBuVjl6N2NYbHVadCtkY2t2T3dnZlB3bU53MERrUnh1ckMwM2FSd1NNbGFG?=
 =?utf-8?B?SGphWlpEVklyWWdGMkMzQVJMWm9RN1JwYXR4RHB5alVLY3J2bk5KZktMRS9R?=
 =?utf-8?B?VjZGNGwxR2ZBUVlENlVwL1VCYzJlbVpSYTNIWi9FUW5jaHpWVk0vUDE3NEdn?=
 =?utf-8?B?eDJpVThoUU9CTVdpdHdEVnJQbERRTlJxQWtoMDBGSFM3K1VidC9rZElpQ3Fk?=
 =?utf-8?B?RThCbC9kQjUybGpuMVVKLys0cFVDZTU1bjlxa2pvVTh0eHBnTGpzVHFFVFYr?=
 =?utf-8?B?RXJHWTlOd1R5ekhYY3lFQmdlNk03UEdHQXpienFZNkYwVGVWbHVSeWhuaHcw?=
 =?utf-8?B?bEtHdXNFd0JmMUU0UmhFSUVScDFyMEZsVXBZdXgvTzRUdHo3R1ZBaHNkNHdS?=
 =?utf-8?B?cGhMMDE5emJGVWJrOUJ1UlJaWGhqUU1nazBndjdwU0EvbExIdGFGQVlZUE9T?=
 =?utf-8?B?aUU5MGNoUURQUC8wbGZLRHB1bEdMTmVZY09VN3ZQRERzL3VBQ0dTc0tzNDdK?=
 =?utf-8?B?WHRWZTQrYU1LaHA2WWtkamNaMFdOdkhWc1p0REhwb0cyQTNGY3N2Q1dDS3di?=
 =?utf-8?B?a0hnSklHMGphTmE3eVRWcEMrU1d1a0s3VCswNGlsaEdUSVdsSllKaE5XLzc0?=
 =?utf-8?B?YkROVWxTcTgyMGduU0xyWHNpTERzR1J0bHU1blErbEVKWGh5WlVhWUxLRHRT?=
 =?utf-8?B?b0dUeGRJSCtZWWlmMUNmQlhEWGczQjdCSTY4NFBvWVMwaUNtSEVRSnIzWGxX?=
 =?utf-8?Q?ZUWICtlxID+lwV4nL0oVLIMoG7PEIBWBjAZgK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89E4ECD90D41E644ACCC51EB85AA19EA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 638c3279-cf16-4f58-90a4-08da4086372c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2022 08:44:02.1183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdOkw5q/Brg90nEO9sc/w+/oJiB/jax9pc9pQmlEr5pP7fT6zzxeSLXtuOehYzWx04nsOGAJO0up/k8zQ5hsO9lv5Ikyavf7SKbeV9Vyxjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1813
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA1LzIwMjIgw6AgMTA6MDUsIENocmlzdGlhbiBaaWdvdHpreSBhIMOpY3JpdMKg
Og0KPiBPbiAyNyBNYXkgMjAyMiBhdCAwNDoyMyBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+PiBU
aGUgaXNzdWUgaXMgaW4gZHJpdmVycy91c2IvaG9zdC9mc2wtbXBoLWRyLW9mLmMgd2hpY2ggY29w
aWVzIHRoZQ0KPj4gcmVzb3VyY2VzIHRvIGEgY2hpbGQgcGxhdGZvcm0gZGV2aWNlLiBDYW4geW91
IHRyeSB0aGUgZm9sbG93aW5nDQo+PiBjaGFuZ2U6DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QvZnNsLW1waC1kci1vZi5jIA0KPj4gYi9kcml2ZXJzL3VzYi9ob3N0L2ZzbC1t
cGgtZHItb2YuYw0KPj4gaW5kZXggNDRhN2U1OGEyNmUzLi40N2Q5YjdiZTYwZGEgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L2ZzbC1tcGgtZHItb2YuYw0KPj4gKysrIGIvZHJpdmVy
cy91c2IvaG9zdC9mc2wtbXBoLWRyLW9mLmMNCj4+IEBAIC04MCw4ICs4MCw2IEBAIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIA0KPj4gKmZzbF91c2IyX2RldmljZV9yZWdpc3RlcigNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWUsIGludCBpZCkNCj4+IMKg
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsNCj4+
IC3CoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHJlc291cmNlICpyZXMgPSBvZmRldi0+cmVzb3Vy
Y2U7DQo+PiAtwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBudW0gPSBvZmRldi0+bnVtX3Jlc291
cmNlczsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgaW50IHJldHZhbDsNCj4+DQo+PiDCoMKgwqDCoMKg
wqDCoMKgIHBkZXYgPSBwbGF0Zm9ybV9kZXZpY2VfYWxsb2MobmFtZSwgaWQpOw0KPj4gQEAgLTEw
NiwxMSArMTA0LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgDQo+PiAqZnNsX3Vz
YjJfZGV2aWNlX3JlZ2lzdGVyKA0KPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0dmFsKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsNCj4+DQo+PiAtwqDC
oMKgwqDCoMKgIGlmIChudW0pIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHZhbCA9IHBsYXRmb3JtX2RldmljZV9hZGRfcmVzb3VyY2VzKHBkZXYsIHJlcywgbnVtKTsNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXR2YWwpDQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsNCj4+IC3CoMKg
wqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoCBwZGV2LT5kZXYub2Zfbm9kZSA9IG9mZGV2LT5k
ZXYub2Zfbm9kZTsNCj4+DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHZhbCA9IHBsYXRmb3JtX2Rl
dmljZV9hZGQocGRldik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXR2YWwpDQo+IEhpIFJv
YiwNCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBwYXRjaCEgOi0pDQo+IA0KPiBGaXJzdCBh
dHRlbXB0IHdpdGggdGhlIGxhdGVzdCBnaXQga2VybmVsOg0KPiANCj4gcGF0Y2hpbmcgZmlsZSBh
L2RyaXZlcnMvdXNiL2hvc3QvZnNsLW1waC1kci1vZi5jDQo+IEh1bmsgIzEgRkFJTEVEIGF0IDgw
Lg0KPiBIdW5rICMyIEZBSUxFRCBhdCAxMDYuDQo+IDIgb3V0IG9mIDIgaHVua3MgRkFJTEVEIC0t
IHNhdmluZyByZWplY3RzIHRvIGZpbGUgDQo+IGEvZHJpdmVycy91c2IvaG9zdC9mc2wtbXBoLWRy
LW9mLmMucmVqDQo+IA0KPiBJIGNyZWF0ZWQgYSBuZXcgcGF0Y2ggd2l0aCB5b3VyIG1vZGlmaWNh
dGlvbnMuIChzZWUgYXR0YWNobWVudCkNCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSBjYW4ndCB0ZXN0
IGl0LiBUaGUgZ2l0IGtlcm5lbCBkb2Vzbid0IGNvbXBpbGUgY3VycmVudGx5Lg0KPiANCj4gcG93
ZXJwYy1saW51eC1nbnUtbGQ6IG5ldC9yZHMvdGNwX3N0YXRzLm86KC5ic3MrMHgwKTogbXVsdGlw
bGUgDQo+IGRlZmluaXRpb24gb2YgYF9fX19jYWNoZWxpbmVfYWxpZ25lZCc7IGluaXQvdmVyc2lv
bi5vOiguYnNzKzB4MCk6IGZpcnN0IA0KPiBkZWZpbmVkIGhlcmUNCg0KLi4uDQoNCj4gbWFrZTog
KioqIFtNYWtlZmlsZToxMTYwOiB2bWxpbnV4XSBFcnJvciAxDQo+IA0KPiBAQWxsDQo+IENvdWxk
IHlvdSBwbGVhc2UgY2hlY2sgdGhlIG11bHRpcGxlIGRlZmluaXRpb24gb2YgYF9fX19jYWNoZWxp
bmVfYWxpZ25lZCc/DQo+IA0KDQpGaXggYXQgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjIwNTI3MTEyMDM1LjI4NDIxNTUtMS1tcGVA
ZWxsZXJtYW4uaWQuYXUvDQoNCkNocmlzdG9waGU=
