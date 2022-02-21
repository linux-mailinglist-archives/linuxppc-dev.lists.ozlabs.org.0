Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045B4BD614
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 07:36:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2CHP3fyfz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 17:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::609;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2CGv6VNZz30Md
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 17:35:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyevbBTPfRax/YGV5Vkb69cQiqCwI9B+ygeWs7ZgZPk/YULcQbN9rD38cnRNBMlZszBIAxFl+sGzTLzKDpo8ihJOZQGQMsFuWNKxPvzY9f1O7/F+ViUepGhexA24az9BIAxM5qflvoM72tcI2j3QYj0e4eMlosfKDZ8h9PC1FZ9d8Hszpnx537uPF5uBc1dZURdnb2H27F8N7Jk8Wg7isqsLSfA1Fn5zjlvuJxgmhSHLD3lpEZQ8MMCIcKy1/FD0yMejhGNhViI9uJaIlE72q5ZxWx7AWVSIxdp7OoNqwJVCKz9JNexolFaR+veP3Uf5NvwdOt1mpAU0y3wk+0YJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfGSTxZqeNun3xJ/PfHap2CCbNR63cs5n627L6aANcU=;
 b=HeZntum8EfVal7ssQsVNBddMjmXjcM6lwCc5s62JDWAqjXu7z7sFPQ1ENE8C6InOzT8e1aO/c5xjBkklY3KiZo8JZnDve9Ss0Ie8/f6Xz+AG2TmqP3UoaBPjoDokdln3d90ILtKZT3quHcJ1Z1iWvCLQf23xE2UcfOARmqqo+/DB23nX9/F57c5Ec576jWJeoZP3vq6U3kaV0lybXN8IFapJcQ9IC98E3sjsUA1lg3AQ5Gc8cayaC+Pz8YewEwXEH09fcgA2/XXD/HTSyAg0GO2tn1x0vux2iYe+VM16rIkQDenn0vK4Cu3X6xoq3z4FXoXsqQNhVaiv8Lg00VKPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0386.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 06:35:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%4]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 06:35:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] platforms/83xx: Use of_device_get_match_data()
Thread-Topic: [PATCH] platforms/83xx: Use of_device_get_match_data()
Thread-Index: AQHYJsdUSbBzncA20Uq1q5dqZ9MYcqydjM4A
Date: Mon, 21 Feb 2022 06:35:13 +0000
Message-ID: <1acf7ba2-6ad4-e460-3642-89cc8a07ac56@csgroup.eu>
References: <20220221020323.1925215-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220221020323.1925215-1-chi.minghao@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98be5d7f-57bb-4a7b-c877-08d9f50450ad
x-ms-traffictypediagnostic: MR2P264MB0386:EE_
x-microsoft-antispam-prvs: <MR2P264MB0386E83209B19D415829A6BDED3A9@MR2P264MB0386.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62+mpw9i/eJfz3VNXYx6W6OZLspD0rtVA4KLC7M1XoPYIrE3Swrvjibh5BY/DUfHqBMvh7hvxQoK2ba201z9HhcstgFkFYvGKx6RtF2DxzU23wEsql1bPefk9TiBGjC6LTNxI5ZgrZ9HJl3N54PAoqrESW5D1GIV/bj14dgJm+62aDeBe+iVImdk+XFL5ZjcLVhkTQMAxvfXCKmmB9r/SoilSLCErA5+DkKx+7spMo3sdbp1L5bqzKU12I+NcQW2KGmdLs29UZagYuhCylFvZA2SjiX0l7wUHrMATqiCJ3SAGyF9HTQ88TOD1KASaIRjrW+34G/vQsWlJLut7DxfguJVxoTx5ACY13kkthjusHumc1Sas6D07oqgQ7ilrXssdMNHX8cah/Cpg0DWjqV4py3kzvpv4/1T15gQiwkQ31gsoyanpWk/y6EC2AoO8XYNPO6HeoAzZdYe3G4qkVmjb/WMiirVNdd7imMnRm2ujQ42Cp5JdwzqyFg0tg6Kq0/Fd/kgXtcvxkLMDXjJ77hu/bZvc/bVVbs8XHp5Qls2SDhC9OQjrP2XCZ+CsklodIwmLWTOc365c+KCHVUILgKN9+C9A/Ndlp+w27qC/QzrZu4hhCDaHRWyd96f/rmNF8gzx2oI0wpqMMs5AGhBn1lzouyHNfv/u24+BYx4J/s8N/jbLSV+C4CUQZlqzwpLcUnhU+k+0wVkQah83/ClAF20hvo98hKbMfoZqiN12UZYXF9vMxo0D2ciMIQ5jAAHx2iC1+vMBgSagfhsZiTwdcYPdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(6506007)(36756003)(66556008)(31686004)(2906002)(6512007)(2616005)(66946007)(66446008)(86362001)(26005)(44832011)(31696002)(186003)(5660300002)(8676002)(122000001)(6486002)(508600001)(38100700002)(64756008)(8936002)(71200400001)(76116006)(83380400001)(91956017)(6916009)(38070700005)(66574015)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDNQY1JmM2xaNVpBVXhDL1hrVEt3MTVTbzB5MnVYMGhXV1EvckNrWlRIUWF1?=
 =?utf-8?B?VDJpQ2JzMmRqWkx2RWRvaE93aHEzTjExSXE3V2ZSM1NjNjhGMWpYWGdBb2hq?=
 =?utf-8?B?c0ZpREU2amltaGlHaFhoSFF4TFlIVnBMa3phUms3dXlEMDQ0VFJlM2Z2WFBp?=
 =?utf-8?B?bFRYK2x2dThqckpyRUJwVjREM25RVDdTQ0FIdXc4cVpCNUFXM2VwMkVDcVY2?=
 =?utf-8?B?d3hOUVYxS0RydVRCeGxEd2lJc2FNdWVuR2hOeWM2VVFOY3M0TFYvbnpxbkRr?=
 =?utf-8?B?b21vRStPWHpZTmkrNXRqajVYemJadEp5WWxpeUpYbVZ6OUpaVXhmak1hYm5r?=
 =?utf-8?B?SE4xa3hUdVNnRFdhQ3ZCcGsvRi9lZ09wTGoxT1l2RVlRdjRwbXBaV0t1TFU4?=
 =?utf-8?B?aVJmdFVLdG1jQWFHZGtaSTV2ejVrRzMvZFgyZ0JHZXJwWDNUQzBJSHNqMVo5?=
 =?utf-8?B?WmhheHBqUkJwVzZTc21sRXJCVG44Vy9UZkhML2RzZEVRRG5yc29iZkVqQ3ZX?=
 =?utf-8?B?Vk1PeHgwS0NlSGVvdWU2T2tLMklLNTlhdnJpVVQ3eUt0ek43L0xNcmQwS0s3?=
 =?utf-8?B?dEFWU2s0cWpjSDl4OWVhekxIdzZXKzZDaDgxUlhpcmtDUjk1OFhkSFRJOUQr?=
 =?utf-8?B?Sit2NUFtNFpERGJSMHhtMlgrUS9UQlV5akZ0eFJsR2dFVjh6TkxyelU0cklX?=
 =?utf-8?B?Vko2d2dkZ08xMmNTaU9pbzlHUS9zZDFsREgvc2VDQm1Sb0VMMFdqMVVBZXlK?=
 =?utf-8?B?bTlLK2NySjcwL0p5RXd1UFlPWnNuVy9ndlpBVGdrdUQ1bHFZcmRUY3JPZXBq?=
 =?utf-8?B?Y3ZMSEhTMXcxNTBKVm00MUowcll0UVdINW1zMDFCMEhBMWJBc1JiWGtxMmti?=
 =?utf-8?B?VUM3OVFJSGJ1ZjBrTzdPK0Z4S2RFK21iQmtOdmgwUjBCb2JtR1dpeURId1dC?=
 =?utf-8?B?QVdtOXlVV1V2NnpJbFZsU2xnYUVBZTFHNk1ZOE9EZzJjSk5SbDgwRUVidklw?=
 =?utf-8?B?cGVKejI0ZEI3TnBXNnJ2ZldnS2RSZW50NFVhdmRnd3hSNDE1bFVMVlFTT3pT?=
 =?utf-8?B?dllPZWZ3ek1HTVdLeklqMmZkVGpPTUNYSC9UZHowbXArQ3FzV1NkZjhENDh3?=
 =?utf-8?B?eGNEYjdhT1NhbkdKenNFWnREWmc1cUJnanVvVDA1TS9nWGVpMjdpS2tXQ0to?=
 =?utf-8?B?UGFqY1A2c0RZNUgycmxGYktURTRBQ3U2UmNJdm1RZGJEWU1KK1gwVjB2RlpD?=
 =?utf-8?B?eXJNMnlhNkxpdVhyWTJlOGFUbStKZGJzMnZ4YklNUWZhSVVvYTRzb1R2bHRN?=
 =?utf-8?B?Ty93K0xvRzBBcjFKT3h5SWp6UStKL1VINnllanJ0dk1odHM0cnhQNmxkclNj?=
 =?utf-8?B?UTlYQ2gyVk9sSWY0K0VPZjBSQk5IdnVoVUVnaDZDaHE0VjM3SFgzNUdLV1Z3?=
 =?utf-8?B?V2pmVHpPOFY1d2ZyZzd3WUM1V0hYeUs5UVl5VDlSZEExb2tNcitBV1NPeTZO?=
 =?utf-8?B?UW1XalNVUHFmSVhjV0kwT0lhVEFkcXNPakNJYURzNUp5NUNrUEtkd2tsUkE5?=
 =?utf-8?B?MkhPMEZSZWVMUnRGbnFRc216ZmE1cHNLR2hTcUIyZkdZdE9CblNQM2pUMUlo?=
 =?utf-8?B?M1ZjNEZrVlRTaHkxQVVKS1M5Q3lHMUIrOVJMT2VPNkp5eEtqRDA0WVYvWitr?=
 =?utf-8?B?YTFnMEN4OUM4TndqcUMzOThVVEhHWnpGc1h4VDZ1RS9vRzhsbWYrc21aT040?=
 =?utf-8?B?VitNRmNwUFRsenhyL1lNOEhOSUxEOTZkRGZqZEcvY09QdGVMVVlqbmpPdVRa?=
 =?utf-8?B?aXhMZEhaM2tIZ1BjYk9sRUV4anFGOHZzRm9iS1B6MGNPUldtTkpxSWJnaU9a?=
 =?utf-8?B?UUNzSC95ckR5SzRxbjg0bXhpU2x1K3F1ZXhneStKZU5QQlNtKzdleFVhOGk5?=
 =?utf-8?B?TUhwdGZvYTYyY3p1TjE0QUo5VHRLbEsvdVI2VDhnNmdzZnRVT1k0S0RvejlY?=
 =?utf-8?B?Uml0dzdYWXJQTlVRcUN6TXJ1Tnk4WWg0MDhGRlFPZHBiN3dWN2FMVitPd0tS?=
 =?utf-8?B?dG94REhaRjdROVB3RzJvZHNST2xPcDN3V0Y5Vy9BZVBORU5TcDRwZTFqOWdW?=
 =?utf-8?B?a3RGeUsxSU1XeS9vVUZXVmZSZzMzdVdscGZkL2p3dkZ2c1o2KzVZekdEVm81?=
 =?utf-8?B?VWsrK1FsSEFTcWdtWEZxUjlmRmkvaVF5RFNIVVVoOUw3cUozTWpvS1RyWjlN?=
 =?utf-8?Q?LZn2WWPqkGRBB+wjC+spFlXsT4kphF/tl+tbCV5ZDI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C2B36734E692144BE9754077F97CACA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98be5d7f-57bb-4a7b-c877-08d9f50450ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 06:35:13.1094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jq9wc/wf3ypKsppa8cMIaZwHMKC+MM3mTjNEjEVzPY81qcu5ogOaJ/RDWjqac7gScZPWLy5NwTHb8nMOzlqVYloM3SU6QwitzCrtq+Fd1wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0386
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAyLzIwMjIgw6AgMDM6MDMsIGNnZWwuenRlQGdtYWlsLmNvbSBhIMOpY3JpdMKg
Og0KPiBGcm9tOiBNaW5naGFvIENoaSAoQ0dFTCBaVEUpIDxjaGkubWluZ2hhb0B6dGUuY29tLmNu
Pg0KPiANCj4gVXNlIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHRvIHNpbXBsaWZ5IHRoZSBj
b2RlLg0KPiANCj4gUmVwb3J0ZWQtYnk6IFplYWwgUm9ib3QgPHplYWxjaUB6dGUuY29tLmNuPg0K
PiBTaWduZWQtb2ZmLWJ5OiBNaW5naGFvIENoaSAoQ0dFTCBaVEUpIDxjaGkubWluZ2hhb0B6dGUu
Y29tLmNuPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5j
IHwgNyArLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODN4eC9z
dXNwZW5kLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jDQo+IGluZGV4
IGJiMTQ3ZDM0ZDRhNi4uOWFlOTI2OGI2ODNjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
ODN4eC9zdXNwZW5kLmMNCj4gQEAgLTMyMiwxNyArMzIyLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGxhdGZvcm1fc3VzcGVuZF9vcHMgbXBjODN4eF9zdXNwZW5kX29wcyA9IHsNCj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbWNfbWF0Y2hbXTsNCj4gICBzdGF0aWMgaW50
IHBtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZmRldikNCj4gICB7DQo+IC0JY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7DQo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBvZmRldi0+ZGV2Lm9mX25vZGU7DQo+ICAgCXN0cnVjdCByZXNvdXJjZSByZXM7DQo+ICAg
CWNvbnN0IHN0cnVjdCBwbWNfdHlwZSAqdHlwZTsNCj4gICAJaW50IHJldCA9IDA7DQo+ICAgDQo+
IC0JbWF0Y2ggPSBvZl9tYXRjaF9kZXZpY2UocG1jX21hdGNoLCAmb2ZkZXYtPmRldik7DQo+IC0J
aWYgKCFtYXRjaCkNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gLQl0eXBlID0gbWF0Y2gt
PmRhdGE7DQo+ICsJdHlwZSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmb2ZkZXYtPmRldik7
DQoNCldoYXQgaGFwcGVucyB3aGVuIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHJldHVybnMg
TlVMTCA/DQoNCj4gICANCj4gICAJaWYgKCFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKG5wKSkNCj4g
ICAJCXJldHVybiAtRU5PREVWOw==
