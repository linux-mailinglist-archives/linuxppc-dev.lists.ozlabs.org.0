Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D336E692F30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 08:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDN4Y5YlGz3f5X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 18:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=13zt4ymG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe12::611; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=13zt4ymG;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDN3X46ycz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 18:47:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSpOyp96yz65xFsyHd8l5s2zsowpAeWJ8ZAODFBs2i7Mehs1Dl1WnTXChdmY1rJYBt6gdnPqlNHYA+8ktC4/1LGXE8mKc6tfW6kNdNh6L2PXMHmKL+CdKEo2TF8fDl44Rjw43j3Q1VRBCZCehBvfnJ0eM1c4shPI6aHW78rHTavUH144uEty2gJTfYe4Bi2PEzCV/D1V+IxSwi3m6D2qVsKNRr0t5Z2mgjOYmz6hVdRdZ8bKk2Ba0sTwKdxaOwHSfzqSoyaTGr6/gr+7Jpp/h/5qug3mAlBKfWUCtQ9F63M2cCNicCc7GOFgoRkd1ERm/os/FDUteeJCjmKEUbFlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xufN+xYcb4/fvvbnonQpm7EKyl6YwbfqffaR/64/lVk=;
 b=Umh+TKYSvc274Tl21iu1SoMkWDO0U/ZZ5rqSFcLRjPT9oG+Hwyxab06wgcPNK4zlgH4DF98l1famkdzczgICog3Fg6ozkYoW2+dNB/BZf9wPnUoAwVaTZU2ctRQGmSqapTbADuMnmj5VUtSV2f9tGEnqvHqgkSUNV89yogcyMqBoRVypPQdepZaqH5Whzk+pHRlsI1rP1Jmkaud9TE5VyZ+0ni/I2zllMWVpX156/o+r5P6t4/y19lV5tKj6R2pKxZrBOvH40aALE+e0wdD1ambBe2esSw9zeJa+1qTiTbSD3x2hEl+tywEx5uHnZ5pj2EDDs73apV8VNH7gLjmqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xufN+xYcb4/fvvbnonQpm7EKyl6YwbfqffaR/64/lVk=;
 b=13zt4ymGU94DcRuPDBlUlTMzLzLWwoLO5g9XB8jY7a7HI1le4dNu/Czv9eQggI1wpkx6LJ3rjorkHKmh3YHKMVw45b0n8VgDQOrkob3J7tKc0NcymbwwvrwxZ4pncHKbCecZpwR4P48i8W2wWgz2WHeNLjzm4GdbJUh+VX1cIPcYj7RZugGn5W8f20oKyx3BPpISA+3lWMlLundewBppagh6xs/TahXHnNBRBPcxrjwl82bJGwwxzTURYXRCM6uFVa4RF00aHT9cs+IgRfyER/tHk11gvAfxqwdpH+XlyfqQPaggu3Hus1n+/pTUatpTs//TLp/ybWgboC3bKgteqQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3271.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Sat, 11 Feb
 2023 07:46:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.022; Sat, 11 Feb 2023
 07:46:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/machdep: warn when machine_is() used too early
Thread-Topic: [PATCH] powerpc/machdep: warn when machine_is() used too early
Thread-Index: AQHZPez34v4KSjq3L0+xRh2RbYYtLg==
Date: Sat, 11 Feb 2023 07:46:36 +0000
Message-ID: <53a1e4be-e41a-8cb7-c617-b473a2a01b9d@csgroup.eu>
References:  <20230210-warn-on-machine-is-before-probe-machine-v1-1-f0cba57125fb@linux.ibm.com>
In-Reply-To:  <20230210-warn-on-machine-is-before-probe-machine-v1-1-f0cba57125fb@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3271:EE_
x-ms-office365-filtering-correlation-id: e57e18f4-c466-476d-dad0-08db0c041a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  omJABxZKuyuzcnne3Fs9QxdJELAn8qypA4+qMneCccKp1Z6HYFl+sgWjWRCDxbPSV4prTwQNLinOC+NPojVe6tmR1A8Ya3TQkSfgsD9cRg0IKb8M8V30KiFofbfK1WjHpUpTbRwADsXFlHzURp8uaVDhPz/blAlEu/8UqGv6y6UKx7+2tbnMOa2wmFnx9VRk9kfZZM4URbIfxyw9PKt/puwzt3xun3ZtW6nuTHYDU/79IvELvNn7ApOuU2ozrcmuwAXF8hBTtKPZez6OpT8D3PtXvWQ0zotScSaGXv9ne+n9c6mXTf1dT1IZR7Qr9frjPqB2VTLNczwtxQSsFOwoRG1NZqbp5ZuXxYdyIPzChrBGL62vgbrc2R7EYyUoSrxtEf4Co+PuJ/7tIp2qIIFEshaoSRaC3pNW8WC1KaactujW1SAOFEDAZIuxgeXGD+Bgbv+d1Mbq/7Cv2v25P0N1mTgcfNleRnWGAcCKrbhuNekFqxipjeEP9dfgfIBB21BU5sruF2U6ecI95LA0AY5lOS3txBNWRigDn5zTrLrQBlvQaT5GFAgD88e86ntZ9DQLKLF1vksgSEvoeaOiT1nLoyDOlHtSGQIWT63Tc0Bp1D07trZaTbH/h96ACSRPHNdT5BLRb3ewZFInSan9mUyHl3+AcX9V+i3UqfXAP7t8r0+6ssiEAAUYILBXnNqWCrH3J8lb1LduMpaqXthFRtwuuO7wHkxYzjd75HaPPy2RaOEbm2FfBsVlIMcr6mvQcqpj0QiAAeDyb4ygRCtuZVF0Kg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199018)(6512007)(66946007)(76116006)(8936002)(316002)(110136005)(4326008)(8676002)(41300700001)(64756008)(66556008)(66476007)(66446008)(86362001)(31696002)(38070700005)(36756003)(122000001)(38100700002)(91956017)(186003)(6506007)(31686004)(6486002)(478600001)(2616005)(71200400001)(26005)(44832011)(2906002)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U1RCaFhWVVJsYVFtS3BJV3lISThJVytNbFRtelRTY2NFRG41b2l3d3M2QnRt?=
 =?utf-8?B?Z04zWnBpYkkyaWRzOHUwWGZCMDZ6cU9xSm1VSUtaQjNiekJwV1NjS0RqTUhh?=
 =?utf-8?B?Z0ZIc2Z6U3VKWUtodWZZcHZwMktBMzA1MDBwMHROVFZvZnVSQ3BDeDlMUXVX?=
 =?utf-8?B?NktOanMrL2Q0WWFBS21HZisxYTJDTlE5S3Z5Ris5L1QrNVVCOVNMV0JvVGcz?=
 =?utf-8?B?WUhyS3Z0TmwzTXM5R2NGN05CRlVjdkNXYmZNcGUyckw4VGFTUDBZY1JwVEZq?=
 =?utf-8?B?VkFZVURJZzkxTG1aUUx5dUNROFQ3MityQ3I3V3R5UlVpUVhwS2puSU5RWXBv?=
 =?utf-8?B?c0IwVWVwRW5VV0pUVnQ5cWVxVUpMdSs1Z3MxL0V0ZGJUeUZtS21jQUtnOU5i?=
 =?utf-8?B?d0hWSHNjSmFBcUZRdyt4c3VIbS9MS3NzWTZhOXNCZDdJVldZakJCdnBaUThp?=
 =?utf-8?B?S1l0bW5Zc0p6cEZtdUFpcjNpQjlxTXdlMVlieG9ua1cwdllxTTdqVG1PVDY0?=
 =?utf-8?B?Vmw4MGFHd3ZlcXR0VXUxOUtDV0Z5eGRMT09aTFpaL0JqMkUwY0FCc0llV21Z?=
 =?utf-8?B?OGxlNWtMb01UbCsvWjFvS2tlVDFsTkFYZStVVGxIakJjRHpjZERHTXc5S0xh?=
 =?utf-8?B?OTVJL09jdm9ROWpMeVpjWHNhUjZLa2lzOG1MeG02Ny9uRWE4UVlDTkRQVzc2?=
 =?utf-8?B?MEpwZWNWWW1zVjZuNjEwV0RLdjhQZXI2eUo4RG04WlovelQ4WG1RMkd1b09u?=
 =?utf-8?B?Q0pCY2FNTndSZnJiRm5TOE1lcWM4V0hXbzJZTFhXRi9ZaHhWTkVsOTZTQSt4?=
 =?utf-8?B?L1VzVEtNUHEvYSt6NDNYVEhuMDFsd2NnRXRYMHpHaGhPMVllS1BIb1NnRld1?=
 =?utf-8?B?SEJpSmFWUlRuWkt2OEx4ejZXdDFzRTJSN3ZrVzl6T3VjYW0zS0wxYXZsZXZz?=
 =?utf-8?B?UExXRFI1NmpHY3lMcWI5SllBV3lMcW9yRUh0ZmtyRU11enZnN3NFVmlRSHp4?=
 =?utf-8?B?SkdVYzZ0Yk5FRzVGREltd1hhTXdIdjhOVWZCMjl6bUhVZWtsdzlpRStGTmhu?=
 =?utf-8?B?MEEyS201blo4ZStIMU5mWXY5WUFUUFhoNi9DWnNQb1Y5eFdFcGd0MjRpdTQ1?=
 =?utf-8?B?Vk1PV28xQTFqaytDSGtvL1ZublZWRVV2MU5HcnVuOXFIQk4xMmh4VTdaMlZY?=
 =?utf-8?B?RGQzQVpIZzlKTG5OV2xYV05qWktUTzJwYUpZdUFMM0dlVWR0UnVNM3VTVmVH?=
 =?utf-8?B?aEFWdmlCYXhyZmxmUTRaWHhqNGRHSmNkZTNGLzFjeGh0WFg0OWM1WDNxelhR?=
 =?utf-8?B?SXZrOTBpZGtkc0kvSDBsQzEwUWdJU0Y1ak1hOERsSW5KVE40QTdMRkZySVVY?=
 =?utf-8?B?S0VOQzNxeitWQ1BNUlNuSUpXdUhyc2pWSVVsam1ZNVlUbVBxemhSQnNaV0Fu?=
 =?utf-8?B?czByemRIK0lsb0phUFRDcklzdCthZzg3djRmamJJRmdnWUswQm1wcnBmTGgr?=
 =?utf-8?B?d3VRNG9UMGt1N0w1d1Y1U0RaUEJxZjN1OGQ1QzY2WjVQUnE2ZjhFZENBS2ky?=
 =?utf-8?B?bUM4R1NMdFh0azdnSlZhUThqQlZqSVp4eVc5WTJ0TXErVFdMS2ZmdDNIYnlx?=
 =?utf-8?B?dmhrV2dEa0VxZy9YZ3FSV1RYSWNZT2RYTkoxY3d1TFp6TjlESjB4cEsyZUpx?=
 =?utf-8?B?VUhocWZUT1pHTWliSlFOMUtYaVdXR2N3TmN3d2hYd0RibytSRFBGK2lFdjhi?=
 =?utf-8?B?aFR0aXJ2OHViZ2dsTmpKaXNacDEySWxOVXJmUHo0ZzliK1d2VVJmZkZlWkNp?=
 =?utf-8?B?MjlsS0VueG5QNXFiVlYwSTNXdlJSVVRYem5VVFBkTy9Wa21lSzBaM2E4TXpF?=
 =?utf-8?B?cnNmdU1KdWM3TGtRbHA3MVlpaklFaXFOSTNaWG5EQ2hEckVUV1UzZnFJTG9W?=
 =?utf-8?B?VmlVdm5uVHFsUFFoYytIMnlObFRiaEN0QkY1RlBYM0VRenlGcGo4OVpraU13?=
 =?utf-8?B?ZTd6TnJYb3pIYnR5dnhaTzE3T0J5NkpjRXRhbTdqODRhNWxhTTdGeTZ0UWhO?=
 =?utf-8?B?ckdRYjRLU2x6elZaVTE5ZWpiNmd0NStPeGY2bldTeDhINXBrQ0lqZy9IR3dX?=
 =?utf-8?B?SlRCR3h0cmFIUTVRZ3RYOUtzZ0JkQ0xteWxOSmJhVDlhSDBDd2xLLy9tb24v?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52A83C09D1119242BBED2DAFE589D411@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e57e18f4-c466-476d-dad0-08db0c041a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2023 07:46:36.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5rVcC480jVMILCZnRDfqxakEDBMOkmo1HczYG98UpJfxxSPWqFhEm1anEcs/Eu2VkZD/UM/afWcEesJgPy+fmNE2fek34kHP2HzfmC8DCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3271
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAyLzIwMjMgw6AgMDA6NTYsIE5hdGhhbiBMeW5jaCB2aWEgQjQgU3VibWlzc2lv
biBFbmRwb2ludCBhIMOpY3JpdMKgOg0KPiBGcm9tOiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGlu
dXguaWJtLmNvbT4NCj4gDQo+IG1hY2hpbmVfaXMoKSBjYW4ndCBwcm92aWRlIGNvcnJlY3QgcmVz
dWx0cyBiZWZvcmUgcHJvYmVfbWFjaGluZSgpIGhhcw0KPiBydW4uIFdhcm4gd2hlbiBpdCdzIHVz
ZWQgdG9vIGVhcmx5IGluIGJvb3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2gg
PG5hdGhhbmxAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+IFByb21wdGVkIGJ5IG15IGF0dGVtcHRz
IHRvIGRvIHNvbWUgcHNlcmllcy1zcGVjaWZpYyBzZXR1cCBkdXJpbmcNCj4gcnRhc19pbml0aWFs
aXplKCkgYW5kIGJlaW5nIHB1enpsZWQgZm9yIGEgd2hpbGUgdGhhdCBpdCB3YXNuJ3QNCj4gd29y
a2luZy4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21hY2hkZXAuaCB8IDEy
ICsrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21h
Y2hkZXAuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tYWNoZGVwLmgNCj4gaW5kZXggMzc4
YjhkNTgzNmE3Li44YzBhNzk5ZDE4Y2QgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9tYWNoZGVwLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21hY2hk
ZXAuaA0KPiBAQCAtMjIwLDExICsyMjAsMTMgQEAgZXh0ZXJuIHN0cnVjdCBtYWNoZGVwX2NhbGxz
ICptYWNoaW5lX2lkOw0KPiAgIAlFWFBPUlRfU1lNQk9MKG1hY2hfIyNuYW1lKTsJCQkJXA0KPiAg
IAlzdHJ1Y3QgbWFjaGRlcF9jYWxscyBtYWNoXyMjbmFtZSBfX21hY2hpbmVfZGVzYyA9DQo+ICAg
DQo+IC0jZGVmaW5lIG1hY2hpbmVfaXMobmFtZSkgXA0KPiAtCSh7IFwNCj4gLQkJZXh0ZXJuIHN0
cnVjdCBtYWNoZGVwX2NhbGxzIG1hY2hfIyNuYW1lIFwNCj4gLQkJCV9fYXR0cmlidXRlX18oKHdl
YWspKTsJCSBcDQo+IC0JCW1hY2hpbmVfaWQgPT0gJm1hY2hfIyNuYW1lOyBcDQo+ICsjZGVmaW5l
IG1hY2hpbmVfaXMobmFtZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gKwkoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+ICsJCWV4dGVybiBzdHJ1Y3QgbWFjaGRlcF9jYWxscyBtYWNoXyMj
bmFtZSAgICAgICAgICAgICBcDQo+ICsJCQlfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7ICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gKwkJV0FSTighbWFjaGluZV9pZCwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4gKwkJICAgICAibWFjaGluZV9pcygpIGNhbGxlZCBiZWZvcmUg
cHJvYmVfbWFjaGluZSgpIik7IFwNCg0KSXMgYSBXQVJOKCkgcmVhbGx5IG5lY2Vzc2FyeSA/IFdB
Uk4oKSBpcyBsZXNzIG9wdGltaXNlZCB0aGFuIFdBUk5fT04oKSwgDQplc3BlY2lhbGx5IG9uIFBQ
QzY0Lg0KDQpUaGlzIHNob3VsZCBuZXZlciBldmVyIGhhcHBlbiBzbyBhIFdBUk5fT04oIW1hY2hp
bmVfaWQpIHNob3VsZCBiZSANCmVub3VnaCwgdGhlIGRldmVsb3BwZXIgdGhhdCBoaXRzIGl0IGlz
IGFibGUgdG8gZ28gdG8gdGhlIGdpdmVuIGZpbGU6bGluZSANCmFuZCB1bmRlcnN0YW5kIHdoYXQg
aGFwcGVuZWQuDQoNCj4gKwkJbWFjaGluZV9pZCA9PSAmbWFjaF8jI25hbWU7ICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gICAJfSkNCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbG9n
X2Vycm9yKGNoYXIgKmJ1ZiwgdW5zaWduZWQgaW50IGVycl90eXBlLCBpbnQgZmF0YWwpDQo+IA0K
PiAtLS0NCj4gYmFzZS1jb21taXQ6IDBiZmI5NzIwM2Y1ZjMwMDc3NzYyNGEyYWQ2ZjhmODRhZWEz
ZTg2NTgNCj4gY2hhbmdlLWlkOiAyMDIzMDIxMC13YXJuLW9uLW1hY2hpbmUtaXMtYmVmb3JlLXBy
b2JlLW1hY2hpbmUtMzc1MTViMWY0M2JiDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo=
