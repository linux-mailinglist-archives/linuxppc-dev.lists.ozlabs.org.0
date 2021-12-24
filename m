Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5147EBE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 07:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKxKP5j6Tz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 17:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKxJr2Zp6z2xsZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 17:01:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2jy/OxPgxz8lfCsSWr515JbDAJMRoH0jcSu7vBYOznmXpPtklXr2jtf6RIithq5vgdZhl08V1EZLXuZOJ/DnxWCWHTwvRvozKw0liRyutX0jm+3rxTUUXUOLivCXcuwyqH4/hoHCQB8CX2nzIycuxzC3dysavNubA0Pco8Nsi7/Xe0202pWHaS91Mhx1EGUvgm6/pVUulPgdKwfNgcBmy2z9HUEmcVZCxJ4BE2AByA//plRO32doxl1Y8p/Q1QLUL2MxopOU36yGkD8f7+sbZJfVId2pnRJeteLBe1AK8pkkqfGFU5sS9YMFdcMBbhK3ibXPUJkPnQ5yb0U2u1bCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I76TIHmVXw89rHa3RWfj9281fN4n1Wmd60lbJUMYJc=;
 b=PGEa+Yec7mLw4aloCy83vwNUvBWnc/tUBTos4scLt6QVU+fyqTJRSKvnrKzR4QHa3W6S2FRBcpxVvAyXgtBlJm9URsRl9Jvd3K0jM0ia5Pnm3m6ueGfhgoB9bqUXBA+G7KflwMF2GeRkucZJzmoQx/zj+GDNR6UtJuuAYTnRBz9p0B+lfVJB44L4inKykzgvp6vezVE2o97y1MTPgOgZuEzRWFpItTSRP3q+hkcaivZCS+URWxpDS3O2VbiowHpBd2fKOu5vtFUHtrhSCiv9aUsa5eJ8JgZjs1iMFQTHBWUXtZ+LSXHgPS2wTLMudLDKKcYfaxKwXPtAkAqILXjj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0822.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:25::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 06:01:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 06:01:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Kees Cook
 <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
Thread-Topic: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
Thread-Index: AQHX9+WglE9xp28KkU+RFxKNUBkEAqxBJ3qA
Date: Fri, 24 Dec 2021 06:01:07 +0000
Message-ID: <ffd77bcf-b9d8-956c-9f83-14b9f0b496e7@csgroup.eu>
References: <20211223102126.161848-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20211223102126.161848-1-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47c2bfbf-3f0f-4949-e816-08d9c6a2c71a
x-ms-traffictypediagnostic: MRXP264MB0822:EE_
x-microsoft-antispam-prvs: <MRXP264MB082208D61E1348B3819FD950ED7F9@MRXP264MB0822.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zZ6q1O0Vuj15yLOd9NDVRt6shQzhBRJydXgXJHhzoPgi6B+UbGXL/tKmOiWWX1R4U1Y8Sla4DaXp/TEiIMoAjjb5Qo4byf3AZL0UxjLi6PXjmUZAwsQDQlRbjULnAuVEoU5G4tNX6q6ZMS80jxF/58dciEByc+hzpOxbFv80bqjGg+O3GS+4AFW8OScton0I0t97hICG161rPNNtifK1aeEIQFQtdwC2yzoSIgPP4oeeKMrGtyaR/W27w9ZpQ2zyU9bTpSoZ2H0R7x2NLepzKzM9aLNeLlg58JEprWTodC8yTAG5Cs7iaTTRiKGE68v7xWUAs37WcMEPuINOmLB3ejXYHdDFJgQoGoW7WwYCvQ2j5O5jAjK82+IoUSkczBC+G4lhIFq2rKjLLvlPNj1pH9CUEzBR8q2T0fGqdRUy24dZ1XUO/DyEPGOpW2JA8C52zz35HX+X3AwARzF9dyOiyUXqOZZlYlwNFkL1Fl9nOlzT1pv4adR0lES5Kx8WqQzYDcEa/thEHHFZjjrU4kLmM/txIpS1yelYy7sjCOrjhgNnal/IRLM+8+gtL2ycGU5mGrLfRZRutT62H6B1it/k1ONRtzSNXFfraU0Izn/OhnH0hXHsYw4MghfpO1ubMdQkLQE2GZaJJDC9+OP7e+kSqUX7WUWN+Rtjv2Wst83jZepxiuOtF4koxPjKYaKvtKBpqscfIh5ys+2n66ri5bRXDmWVmMAxCigEvxqFbXniVN/AgQwpuuoT0faMzNTYHCuV5KCimZ4hol2vMascEFzBOyq1fCHWM5/T1unYdT57An0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6506007)(2616005)(71200400001)(64756008)(186003)(26005)(66556008)(91956017)(66476007)(76116006)(66446008)(6486002)(5660300002)(31696002)(86362001)(31686004)(38070700005)(44832011)(38100700002)(6512007)(2906002)(921005)(508600001)(7416002)(66946007)(122000001)(110136005)(316002)(83380400001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXpRdFM0WUxLQlZNNXAxY050aGxpWGRVK0E1NEM4YklONTdVbGNCM0MwMlov?=
 =?utf-8?B?QzlJWUx4Q0RFOWZSVmwzdXM4dkl2VnU3WkZ5L2loMHJkV2V4eDRad0RuWXRS?=
 =?utf-8?B?RFN5RVBJNGZqa0t3QW5kQjBBYkJVamVabzBRRDBpTXhidjNlSlo2M2VUL0I2?=
 =?utf-8?B?STNaQXV5Y0Z5VEF4eDVCWk1TaC9RYkdCRWJ6Q1VzR2lEcnlkcUdBbWpFamdN?=
 =?utf-8?B?ZjVyZ0c1S1RCUnJWNUlKVng0WVQwQUR4S3BYUk1TS2pndlBHUUN3WU50YzFX?=
 =?utf-8?B?ZnlOV2w0WTYzT0Y5SGNQQlIvYTA0Q3IreEtHMWI4RFV6TlZWdFRoTU1uVUlp?=
 =?utf-8?B?V3pjdWd2K3l3SjhlcUFwcFcwd0Z6amV2ZkExTGZQU3VCM2N5eEtZTks3U1kr?=
 =?utf-8?B?SVZDUTRuN1BpdTM1Zit6dHppTWdCUzRQckEyQVR3SGEwOGlQcXJJZDhlRDFN?=
 =?utf-8?B?RzF1ZmlyMVFxb0J1ejlSc0VZbXBoWTZnbUtlbElETzJTUmtFQ1l3bmVmWENF?=
 =?utf-8?B?OU9KYjhDSFpLQXFiQXMvNGJ5TDJaZGNRUFhzbE1Edi9RM1NRSi9NQkxWcW9t?=
 =?utf-8?B?VW1SeHBkY3I4OUFjQkZ2K3I4OVpYN1BJMzZNb0NSOGFGUWtwQ3RraUFBNzNz?=
 =?utf-8?B?OVhsM2NIRlZWYVJjaFhIaVhVamVnbVpvM0kvNWdIcmtKL1JZVDE5T0g2RXha?=
 =?utf-8?B?UjBYVmsydjZnaWNtWlZMc3N5RUEzTFIrWkZ2Zm5pcndHSko1MG9VRXl2S2g5?=
 =?utf-8?B?bXAyNXJISHhBVlkwWFJmOXIzWWt0bDJ1WTMrSTBOdDd1S2w0QW4wRmpIeWpp?=
 =?utf-8?B?eU9wZDJueEo3WUltQjJBOHJncEdCZWlEdVhDQ2pxUU9SSk1HS2VCaEs0c2Nh?=
 =?utf-8?B?RXU3Nlo4QkVzM3lXOHlLejBrY0ZnM0VFeC9keHp0RmpZaGVqZ1dBVHFnUkgw?=
 =?utf-8?B?d0lhTnlqMStPK1lyRWE2VE9rTFFlMHdhNFV4NElDeFJZTks1WHAvTlF1cEFr?=
 =?utf-8?B?UTBCcWwyWnpqbFBOTHB3WlgwRmtEN0xSYjVHNkJQSEZ3NE52cVFoVVhIZkFN?=
 =?utf-8?B?SWtORGxKMEQzVnI1b00xb2l4ZG9WWnVvNEpsVGFiMXZEcEJHa204MmxSUTBh?=
 =?utf-8?B?cmNacy9ZNXg4ZDBueEpDQXNoSkk1YnhGRmkrUXp3KzkzYk1RZGE2Mm1UelBW?=
 =?utf-8?B?bkF1a1gxSE1XWlRiby9GYnpleGV4WHJ1OUErOTVCY1d1RnQyR2x0V1k5clNY?=
 =?utf-8?B?d09DaUFTNGpMRS9RaTJzY0RNL0V6azllL3hxOS8vQ2dDK2xNWXNMbmczK2tl?=
 =?utf-8?B?MjlVcjRhQTFWZWhjYmRVK0VZQWp2YnBMcWxRSFdBQnplK2dVUFk0NUxlSWhn?=
 =?utf-8?B?aDRPeUNBaldsaTlHNlgwOFNIclk2enZXS200dVJhRVh6ZzI5djgvdmlaRmF3?=
 =?utf-8?B?dDc2TVc1TGg2TWw1SnpWRU5RYXQ4S1JYVzgvd1MvRUhiYXFEZHQrMmFnZitH?=
 =?utf-8?B?V00vcWMzN0dubEpNTkJ3NGtFeUtPUURBc0RKSGgrWWRNK1dMTjd1L3F1dFlQ?=
 =?utf-8?B?bmFyektpWTVDd1d1clQ2VGhxZ3lEd2FlR1FIWCtyNWhVVkFZejNBQ3hENXNo?=
 =?utf-8?B?N0dXcThob2p2NFVzeFd2bmovV1d2UTV4TjRaVEN3VzhBZENPSzVBc01weEs1?=
 =?utf-8?B?eGhMeHgxMExzQUlPeVFLRG85T1pQZE9Kc2x3dW5yTG9UeEdpclNJVHF6Myt2?=
 =?utf-8?B?NjU4c05Bd0hDemRJRHU4OHJ0djJrMnhESXNKTEhoNWhmM05WSUlYcGFXb3JZ?=
 =?utf-8?B?d25CSEpGajRhdTBQcVppSTV2OERXbmZPZlRzVkFUMHYrN3NXOU9aTldzSGhF?=
 =?utf-8?B?VDZYcEtSYWFUeDdaY2lOT1FMQnhVQjdJbFgvay9nWHlaOWhNTlNnMG80Wm9j?=
 =?utf-8?B?eWtabWw1MldteUNMZ3ZSYXJKbXI0bC9oSjllQlUybCtjaXVCY1hPU1JmWmhj?=
 =?utf-8?B?VXgvWUN3TkJLdHg4V2pHV2d4QytVLzFvUUNGUUdFcVZQbE1oNGVPblRUenFV?=
 =?utf-8?B?bHNxcUFFYzJGdUxKUTROYS9ZZ2FTbGx1MzAzQkxETFZsTXpyUzVzdW1kZ0ta?=
 =?utf-8?B?MGFqWE14YWkvUDdrQkFzUnlObDhQelkzbStrdk55VHJKTmdyR3RXTWlNbE1k?=
 =?utf-8?B?czMvTWJnV1RIOHBwN1B6NlR6NHNQd1RkZC9FTkZqMUI2Y2RWd2VXVmUxQWhh?=
 =?utf-8?Q?R4gsSJlVdGM9x+L787zpprsHtE4rRGpYULf9hsHRfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79E627101C553F4AB781BBBE3D52CEFB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c2bfbf-3f0f-4949-e816-08d9c6a2c71a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 06:01:07.6286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hCQF8Nvi6plp5Hl4Kmw42zpt02AklGVwXOhNJzGMmgaLNcaxO45Cuuw5zxeznNowhwZuHONvVsd+dviwrvXWvYB9c42+YWvzZmyUsO2E1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0822
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

DQoNCkxlIDIzLzEyLzIwMjEgw6AgMTE6MjEsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgNTE3ZTFmYmViNjVmNWVhZGU4ZDE0ZjQ2YWMzNjVkYjZjNzVhZWE5
Yi4NCj4gDQo+ICAgIHVzZXJjb3B5OiBLZXJuZWwgbWVtb3J5IGV4cG9zdXJlIGF0dGVtcHQgZGV0
ZWN0ZWQgZnJvbSBTTFVCIG9iamVjdCBub3QgaW4gU0xVQiBwYWdlPyEgKG9mZnNldCAwLCBzaXpl
IDEwNDgpIQ0KPiAgICBrZXJuZWwgQlVHIGF0IG1tL3VzZXJjb3B5LmM6OTkNCj4gICAgLi4uDQo+
ICAgIHVzZXJjb3B5X2Fib3J0KzB4NjQvMHhhMCAodW5yZWxpYWJsZSkNCj4gICAgX19jaGVja19o
ZWFwX29iamVjdCsweDE2OC8weDE5MA0KPiAgICBfX2NoZWNrX29iamVjdF9zaXplKzB4MWEwLzB4
MjAwDQo+ICAgIGRldl9ldGh0b29sKzB4MjQ5NC8weDJiMjANCj4gICAgZGV2X2lvY3RsKzB4NWQw
LzB4NzcwDQo+ICAgIHNvY2tfZG9faW9jdGwrMHhmMC8weDFkMA0KPiAgICBzb2NrX2lvY3RsKzB4
M2VjLzB4NWEwDQo+ICAgIF9fc2Vfc3lzX2lvY3RsKzB4ZjAvMHgxNjANCj4gICAgc3lzdGVtX2Nh
bGxfZXhjZXB0aW9uKzB4ZmMvMHgxZjANCj4gICAgc3lzdGVtX2NhbGxfY29tbW9uKzB4ZjgvMHgy
MDANCj4gDQo+IFdoZW4gcnVuIGV0aHRvb2wgZXRoMCwgdGhlIEJVRyBvY2N1cnJlZCwgdGhlIGNv
ZGUgc2hvd3MgYmVsb3csDQo+IA0KPiAgICBkYXRhID0gdnphbGxvYyhhcnJheV9zaXplKGdzdHJp
bmdzLmxlbiwgRVRIX0dTVFJJTkdfTEVOKSk7DQo+ICAgIGNvcHlfdG9fdXNlcih1c2VyYWRkciwg
ZGF0YSwgZ3N0cmluZ3MubGVuICogRVRIX0dTVFJJTkdfTEVOKSkNCj4gDQo+IFRoZSBkYXRhIGlz
IGFsbG9jZWQgYnkgdm1hbGxvYygpLCAgdmlydF9hZGRyX3ZhbGlkKHB0cikgd2lsbCByZXR1cm4g
dHJ1ZQ0KPiBvbiBQb3dlclBDNjQsIHdoaWNoIGxlYWRzIHRvIHRoZSBwYW5pYywgYWRkIGJhY2sg
dGhlIGlzX3ZtYWxsb2Nfb3JfbW9kdWxlKCkNCj4gY2hlY2sgdG8gZml4IGl0Lg0KDQpJcyBpdCBl
eHBlY3RlZCB0aGF0IHZpcnRfYWRkcl92YWxpZCgpIHJldHVybnMgdHJ1ZSBvbiBQUEM2NCBmb3Ig
DQp2bWFsbG9jJ2VkIG1lbW9yeSA/IElmIHRoYXQncyB0aGUgY2FzZSBpdCBhbHNvIG1lYW5zIHRo
YXQgDQpDT05GSUdfREVCVUdfVklSVFVBTCB3b24ndCB3b3JrIGFzIGV4cGVjdGVkIGVpdGhlci4N
Cg0KSWYgaXQgaXMgdW5leHBlY3RlZCwgSSB0aGluayB5b3Ugc2hvdWxkIGZpeCBQUEM2NCBpbnN0
ZWFkIG9mIGFkZGluZyB0aGlzIA0KaGFjayBiYWNrLiBNYXliZSB0aGUgQVJNNjQgZml4IGNhbiBi
ZSB1c2VkIGFzIGEgc3RhcnRpbmcgcG9pbnQsIHNlZSANCmNvbW1pdCA2OGRkOGVmMzIxNjIgKCJh
cm02NDogbWVtb3J5OiBGaXggdmlydF9hZGRyX3ZhbGlkKCkgdXNpbmcgDQpfX2lzX2xtX2FkZHJl
c3MoKSIpDQoNCkluIHRoZSBtZWFudGltZSwgY2FuIHlvdSBwcm92aWRlIG1vcmUgaW5mb3JtYXRp
b24gb24geW91ciBjb25maWcsIA0KZXNwZWNpYWxseSB3aGljaCBtZW1vcnkgbW9kZWwgaXMgdXNl
ZCA/DQoNCkNocmlzdG9waGU=
