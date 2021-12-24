Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A347EF17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 14:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL71d6x83z3cFq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 00:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL7152Tbcz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 00:18:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/kI1/2/WEtI/QzkPuCKsIaraN9A55SxYQFJP6dFSRFZaYC+U5BJ+vRMMY3qszczhIU8df/ITi2qkVsj6k/U3p2KFMjo522PWIJNmLnKyySPxCL8QrG0gHKfnjQyPJ0h9tGLBeoUqdtCzGNHjCOlMn9zOHt4bfKfSAnGOoVNRPepPBrpV3OcJ7BqwIuN8564LZ+z4+ZNWMLu27cVrjX065zZt9PJv9X7958gEItkG9I44n+N76C7znukcvoaNRc295cL0GFWBAGQ8TGrcAcAl0UFysDqRrHqfhcT5tOqK5w0S8vbQ8SKqAcUn6xejYLR/c3CU+m74cJf0vEuEGZyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2W63EushbXzSP7kjjqJfX2FOGdcgZDtsrcxXaY7eNY0=;
 b=W0GVjQPVQpi9x+tZev3mqRt3dYcaZ10poOvvS58OC2k1OOL2sFNT493LbpKZb4uPolb9nWC57vBdG7rEhXeNzmOnu1wwKNd1z55tgK3mAbA5tVDVaqJ5RzWcZwqkhBjFtMKtqn6UooWPEviXow9YlUSikCSYPwwlqate/OE/hYeGs3sjlxxEKEFcCgZZE/PKljytXrn6S9IKuaq5Y2FTCwdp4iStIX+BjdMmehSi6iWfBk0fOxI+1svCEbNl2Qjc/ytlBVc4NYVd89sxA8FHavOi+D0bvZcn8dcVRqWmxKClMYThcSij0nn1bZOxFYmRG1gak4xyCXTwoUhqyP5j1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1734.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 13:18:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 13:18:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Kees Cook
 <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Nick Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
Thread-Topic: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
Thread-Index: AQHX9+WglE9xp28KkU+RFxKNUBkEAqxBJ3qAgAASQYCAAGfagA==
Date: Fri, 24 Dec 2021 13:18:08 +0000
Message-ID: <6e2ddc83-bec3-fdd4-4d91-3ade0de0b7c8@csgroup.eu>
References: <20211223102126.161848-1-wangkefeng.wang@huawei.com>
 <ffd77bcf-b9d8-956c-9f83-14b9f0b496e7@csgroup.eu>
 <96fe1826-aeaf-4ea0-9f01-03d6b3933b34@huawei.com>
In-Reply-To: <96fe1826-aeaf-4ea0-9f01-03d6b3933b34@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b12fd04f-9f25-40c6-55d9-08d9c6dfd3f7
x-ms-traffictypediagnostic: MRZP264MB1734:EE_
x-microsoft-antispam-prvs: <MRZP264MB173485B9C7CB16E25748408AED7F9@MRZP264MB1734.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDRmhoL+KfRyy0CaFbZFJL+P0DGvnXkyVctjON18WF909eq1HzW/sZk49jRYhfF0hDU5rGsxyDNrV9lOs8MSS8LK7JAmp7nvkJanQ4tEVQRMNrQ+EjKG5sVWrLSIJSVmGuruieuMr5nsM8KEYpclOFDurLIQz9mBPrWs9/2pncQg1NsPDoBxDoM4SrMsXBTTiNPLVgwejDTa0k3h7uR9kxzJXb84+3hTB2oaah5k0j1EaxI/Tsdg123DFiV+kP90vYFDTeK/XIte0YotzyLeOlywt5HaJIE3hqd9xcGpYmV4b+9uSkNTCt8Z8nxEh98qC6e9yA8HLzbLcmW7oolAubtQHs6BIQn0s5+Wiiu25bKlUPGPsu3FhkXPeXVQYTRXL7SbLAxujarhfkElwZppmD+StI3wTcabSe9G6lRD+QPEgwC4Hx7x0lekPOlLv117s986XHEDTuCfXd+Vu9wGE6QHNAYN69um9o0nHyqW2Z96Fx/ydWkUuE4YYrPSxwByr5nhxiSnuWiWWQ1QVA7a8DVvIzmXVXa2wDWKC2zPxtgu2A83PdZpHItlotpzrKACE8cMXNojJqNarEOvhNBSPxP9b5QAuIYc76XCnkS5aU2ZBh9M434whVYaajYecV7rvv2H9vVCaKAVNtmsdsI2GbHY8TyDUJHOcbhtfmmkPsc0z3MD4XOvxR4sDEcHrlrxh/vIioUO9LHf0js5fV5K5tvj84UsNsrK1gu61NHGPqFeWotwUziF22x7xlM1XbQdu7LtacZM+VxUk8sl3pwxGp0b7aEEe9QkluWGOzKCS2Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(8936002)(5660300002)(6512007)(8676002)(38070700005)(6486002)(83380400001)(86362001)(44832011)(2616005)(921005)(31686004)(38100700002)(2906002)(6506007)(122000001)(66556008)(64756008)(66446008)(71200400001)(36756003)(508600001)(76116006)(186003)(110136005)(66476007)(53546011)(91956017)(66946007)(31696002)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDU0Q0JVMEdUb09iMUdNN3dJM0tHN1NEd01ieUlPN2FDWFpKT1Z5MnNIWm5U?=
 =?utf-8?B?ZWV1STgwTFpMajd1cnArMmtFenRUV1QrZ05OUk01djFFSUR1Q1ZudXdrQ1d2?=
 =?utf-8?B?Z1F3MVFRTjZDaG45QzZoWENUWFVBTFR5ZStjWjEwVkVHNXpvSGpQVEhzV2Jx?=
 =?utf-8?B?RzNwWnJIbVV0NzhGUlRrSVJVMnd2KzJFam8wTmtIRmZjdEFQTzRzbXRLdU1l?=
 =?utf-8?B?QXVxVHUxK0Y3eUkxZTNKcEhUVHB4elJ4VmhGZm9wRHp1U0V3M0hrMzcvMk9S?=
 =?utf-8?B?Z21QaWZkK25RdUI4YnF0TXF0MTlXdW8xNkxNUnVjVHJWV0JmSzQwV0lnVCtL?=
 =?utf-8?B?ZDlSSWo5N1VLWldLaDJ1czl6Q0NXWXFIN2h2ell0Q01UV1lDM3Z4L2JPcVFo?=
 =?utf-8?B?TDV2OFhnM0JXMVVOM1JFWGtjWXUwU3NFZ3g1WjhuVHZVdXp0ZnRTbFlWK0Zi?=
 =?utf-8?B?VlpZeGsxT05xNDkydnR3MlV3YmF5dGxhRUtaeTlZWDA5THhZVytmZ0V5clhY?=
 =?utf-8?B?TFIrS205UUlaZktvdG1BOFJML2RyVllwL2pHT3FTeERtRHZScWJ4Vmd1ZkVK?=
 =?utf-8?B?WnJRQjlSS1lRbHRwT3hGaUZsWUI0RHlzNXlrZUNhWGdxcW9iVTFkcGRiSGEy?=
 =?utf-8?B?bm01MDlxdHFkVW5Hd1ZJOVlkcUxEcU1ZVjk4N3FkMURjWFB3bzA3ejZJcGN2?=
 =?utf-8?B?eDJiS0JIaHlMMnYxMVZ2OUtwMkxkc3Q1YlZFL0hKVXVibWx6M3lnYU4xTUVR?=
 =?utf-8?B?eGpmdGt1aU9JTFRVUUltakF2VnZZaE1yb2plajBEUnVqZXpwSnFrUlkzRGlF?=
 =?utf-8?B?WGVkL0JaYjBtL2YxQ3ZqTUtyUmlMak5BbUh6WVpqZ21XbzBVSHZXV3l3Wm1r?=
 =?utf-8?B?Ykt4THEwZXRjelhKbStNN1hkdGlqS3RZTjJKTDFSay80SitVekZZVUpwVmdH?=
 =?utf-8?B?YmVJS3VWWWhBeEhkYUFhVUFiZXlMTGZ6MTJTMFl5OG91UFM4SnVFZmdPMTls?=
 =?utf-8?B?bytyQ0xnZExucXJxZHVDWlYrZlFDdWNFek92RjhORDJrOW5WV1J1S1ZwNXZr?=
 =?utf-8?B?eUlLbGFrTkY5Zi9EOGdOYlZocm1MZm45bmNTUC8rSi8yem55N2FmWERJS09h?=
 =?utf-8?B?NXdOL1dlWktCZUJ1Rlg2K3BBZUJOZTBDeURVL2FPTTI1dnY4ZURuUGc2U0Vp?=
 =?utf-8?B?a005SGRkR1llZHF0dW11TWo0Qm1Hak1kQ3pEVVhqZHBEandrRmpqMmNVc1JL?=
 =?utf-8?B?TlRNZU5pU3lDWngzbHIvZ2NxSlRFNUZKMGRCbDF2V25rWVRHcFZpRVRIdGgv?=
 =?utf-8?B?T2lKRllhQUo2VDVFQkFJSUdHbnVXVnQ5VndoVWpnaW1XakJUdXRxZVo2aDFS?=
 =?utf-8?B?SWp5TThsZW05SDNhZVJLTU9PYTVkb0pDUUR0YVFHcHoxTngrckpWdklaUkJ6?=
 =?utf-8?B?a0JEVmZkMTVwMmdCWW1ZSjFvWFVmY1R2dm9SOVRENHEzM1NHVmhFWk9qcTdz?=
 =?utf-8?B?dVVpN0tsSVVPRVBsYkNxVzYyemthSEJjTVBpbW8xVlc4WEUxQWUzdGJUZGRh?=
 =?utf-8?B?QWZ1bVBCbTZOYnFMcUsxc3Z0Nm92Sm03aVJtVUlFTnhLRHZmRUtmMWJZbFpa?=
 =?utf-8?B?YkFmeU1CdjVWMnlkRTRuZzJQd3laUHF5Sm91aHR6ZEhBTG4zUEpkOGlYRjdN?=
 =?utf-8?B?bE1HUW1lRW9hUDNRM1Fvb2hHb01pNTZETjF2UzdzVTYzZzVxYis3WjdYV0Rs?=
 =?utf-8?B?bXV5Znc5OW5rdFg5K3FjUno5QnJNY25wRDdqN1VwYkROVU1kSEJLMCtnVEpX?=
 =?utf-8?B?KzEvT2p4ajdSUmRORGs5V3ZBcTRWc3BMdjY0L2JqSEo4b0hqTjBndmU1VFk3?=
 =?utf-8?B?TllLeEZCeHpXSExTcEl2R2xQWUU3a0VKRittMGZ4L1FpTUswdzVORUJQdVZH?=
 =?utf-8?B?WkFtUHdLQW1nN2x0WjhXZFJjNEh6TXN4YW1kNzhORGR1cFdXZ1ZFMG9FRmFj?=
 =?utf-8?B?TnBJTXBaYTZ6YjhIVWNZQzlqaUNZK1QvZVlDaFZOck53OUJ4V3RUYjFvN3hy?=
 =?utf-8?B?aGQ2TWZMYkhuSHdnY1NrQVFYT1Y1cVA5N0pYazF3dmovNXRUTVE1VkowaVQv?=
 =?utf-8?B?YXM0SFJhblEyUFZPVzk2elYra2N4SjhRNDcxejlMNndoSkxBK25qQ2djdTRj?=
 =?utf-8?B?RG1NMVBCVCtKbURtN2FhSE1qYzI4MUNHL3lCU0FtZWdWYUpTWXltdmIzaklj?=
 =?utf-8?Q?z3UyPTHvBLfwF4F8YIS3j4VSqePExMs/3VmSRc3jTA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2692868382E286428BA94D4B9D1036B3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b12fd04f-9f25-40c6-55d9-08d9c6dfd3f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 13:18:08.5063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/jcimuqskcX9S+YyvGEq62B2GHNYjO++CvUw5sldy9aMEHNdElEKM6YEVaULxDGwJZRNanD84V/W7/OFLjEq/I8z8lzUYoZOloY4BUqxAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1734
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

DQoNCkxlIDI0LzEyLzIwMjEgw6AgMDg6MDYsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAyMDIxLzEyLzI0IDE0OjAxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IExl
IDIzLzEyLzIwMjEgw6AgMTE6MjEsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+Pj4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCA1MTdlMWZiZWI2NWY1ZWFkZThkMTRmNDZhYzM2NWRiNmM3NWFlYTliLg0K
Pj4+DQo+Pj4gwqDCoMKgIHVzZXJjb3B5OiBLZXJuZWwgbWVtb3J5IGV4cG9zdXJlIGF0dGVtcHQg
ZGV0ZWN0ZWQgZnJvbSBTTFVCIA0KPj4+IG9iamVjdCBub3QgaW4gU0xVQiBwYWdlPyEgKG9mZnNl
dCAwLCBzaXplIDEwNDgpIQ0KPj4+IMKgwqDCoCBrZXJuZWwgQlVHIGF0IG1tL3VzZXJjb3B5LmM6
OTkNCj4+PiDCoMKgwqAgLi4uDQo+Pj4gwqDCoMKgIHVzZXJjb3B5X2Fib3J0KzB4NjQvMHhhMCAo
dW5yZWxpYWJsZSkNCj4+PiDCoMKgwqAgX19jaGVja19oZWFwX29iamVjdCsweDE2OC8weDE5MA0K
Pj4+IMKgwqDCoCBfX2NoZWNrX29iamVjdF9zaXplKzB4MWEwLzB4MjAwDQo+Pj4gwqDCoMKgIGRl
dl9ldGh0b29sKzB4MjQ5NC8weDJiMjANCj4+PiDCoMKgwqAgZGV2X2lvY3RsKzB4NWQwLzB4Nzcw
DQo+Pj4gwqDCoMKgIHNvY2tfZG9faW9jdGwrMHhmMC8weDFkMA0KPj4+IMKgwqDCoCBzb2NrX2lv
Y3RsKzB4M2VjLzB4NWEwDQo+Pj4gwqDCoMKgIF9fc2Vfc3lzX2lvY3RsKzB4ZjAvMHgxNjANCj4+
PiDCoMKgwqAgc3lzdGVtX2NhbGxfZXhjZXB0aW9uKzB4ZmMvMHgxZjANCj4+PiDCoMKgwqAgc3lz
dGVtX2NhbGxfY29tbW9uKzB4ZjgvMHgyMDANCj4+Pg0KPj4+IFdoZW4gcnVuIGV0aHRvb2wgZXRo
MCwgdGhlIEJVRyBvY2N1cnJlZCwgdGhlIGNvZGUgc2hvd3MgYmVsb3csDQo+Pj4NCj4+PiDCoMKg
wqAgZGF0YSA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShnc3RyaW5ncy5sZW4sIEVUSF9HU1RSSU5HX0xF
TikpOw0KPj4+IMKgwqDCoCBjb3B5X3RvX3VzZXIodXNlcmFkZHIsIGRhdGEsIGdzdHJpbmdzLmxl
biAqIEVUSF9HU1RSSU5HX0xFTikpDQo+Pj4NCj4+PiBUaGUgZGF0YSBpcyBhbGxvY2VkIGJ5IHZt
YWxsb2MoKSzCoCB2aXJ0X2FkZHJfdmFsaWQocHRyKSB3aWxsIHJldHVybiB0cnVlDQo+Pj4gb24g
UG93ZXJQQzY0LCB3aGljaCBsZWFkcyB0byB0aGUgcGFuaWMsIGFkZCBiYWNrIHRoZSANCj4+PiBp
c192bWFsbG9jX29yX21vZHVsZSgpDQo+Pj4gY2hlY2sgdG8gZml4IGl0Lg0KPj4gSXMgaXQgZXhw
ZWN0ZWQgdGhhdCB2aXJ0X2FkZHJfdmFsaWQoKSByZXR1cm5zIHRydWUgb24gUFBDNjQgZm9yDQo+
PiB2bWFsbG9jJ2VkIG1lbW9yeSA/IElmIHRoYXQncyB0aGUgY2FzZSBpdCBhbHNvIG1lYW5zIHRo
YXQNCj4+IENPTkZJR19ERUJVR19WSVJUVUFMIHdvbid0IHdvcmsgYXMgZXhwZWN0ZWQgZWl0aGVy
Lg0KPiANCj4gT3VyIHByb2R1Y3QgcmVwb3J0cyB0aGlzIGJ1ZyB0byBtZSwgYWZ0ZXIgbGV0IHRo
ZW0gZG8gc29tZSB0ZXN0LA0KPiANCj4gSSBmb3VuZCB2aXJ0X2FkZHJfdmFsaWQgcmV0dXJuIHRy
dWUgZm9yIHZtYWxsb2MnZWQgbWVtb3J5IG9uIHRoZWlyIGJvYXJkLg0KPiANCj4gSSB0aGluayBE
RUJVR19WSVJUVUFMIGNvdWxkIG5vdCBiZSB3b3JrIHdlbGwgdG9vLCBidXQgSSBjYW4ndCB0ZXN0
IGl0Lg0KPiANCj4+DQo+PiBJZiBpdCBpcyB1bmV4cGVjdGVkLCBJIHRoaW5rIHlvdSBzaG91bGQg
Zml4IFBQQzY0IGluc3RlYWQgb2YgYWRkaW5nIHRoaXMNCj4+IGhhY2sgYmFjay4gTWF5YmUgdGhl
IEFSTTY0IGZpeCBjYW4gYmUgdXNlZCBhcyBhIHN0YXJ0aW5nIHBvaW50LCBzZWUNCj4+IGNvbW1p
dCA2OGRkOGVmMzIxNjIgKCJhcm02NDogbWVtb3J5OiBGaXggdmlydF9hZGRyX3ZhbGlkKCkgdXNp
bmcNCj4+IF9faXNfbG1fYWRkcmVzcygpIikNCj4gDQo+IFllc++8jCBJIGNoZWNrIHRoZSBoaXN0
b3J5LMKgIGZpeCB2aXJ0X2FkZHJfdmFsaWQoKSBvbiBQb3dlclBDIGlzIHdoYXQgSSANCj4gZmly
c3RseSB3YW50IHRvIGRvLA0KPiANCj4gYnV0IEkgYW0gbm90IGZhbWlsaWFyIHdpdGggUFBDLCBh
bmQgYWxzbyBIQVJERU5FRF9VU0VSQ09QWSBvbiBvdGhlcidzIA0KPiBBUkNIcyBjb3VsZA0KPiAN
Cj4gaGFzIHRoaXMgaXNzdWUgdG9vLCBzbyBJIGFkZCB0aGUgd29ya2Fyb3VuZCBiYWNrLg0KPiAN
Cj4gDQo+IDEpIFBQQyBtYWludGFpbmVyL2V4cGVydCwgYW55IHN1Z2dlc3Rpb24gPw0KPiANCj4g
MikgTWF5YmUgd2UgY291bGQgYWRkIHNvbWUgY2hlY2sgdG8gV0FSTiB0aGlzIHNjZW5hcmlvLg0K
PiANCj4gLS0tIGEvbW0vdXNlcmNvcHkuYw0KPiArKysgYi9tbS91c2VyY29weS5jDQo+IEBAIC0y
MjksNiArMjI5LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGNoZWNrX2hlYXBfb2JqZWN0KGNvbnN0
IHZvaWQgDQo+ICpwdHIsIHVuc2lnbmVkIGxvbmcgbiwNCj4gIMKgwqDCoMKgwqDCoMKgIGlmICgh
dmlydF9hZGRyX3ZhbGlkKHB0cikpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuOw0KPiANCj4gK8KgwqDCoMKgwqDCoCBXQVJOX09OX09OQ0UoaXNfdm1hbGxvY19vcl9t
b2R1bGVfYWRkcihwdHIpKTsNCj4gDQo+PiBJbiB0aGUgbWVhbnRpbWUsIGNhbiB5b3UgcHJvdmlk
ZSBtb3JlIGluZm9ybWF0aW9uIG9uIHlvdXIgY29uZmlnLA0KPj4gZXNwZWNpYWxseSB3aGljaCBt
ZW1vcnkgbW9kZWwgaXMgdXNlZCA/DQo+IA0KPiBTb21lIHVzZWZ1bCBjb25maWdzLA0KPiANCj4g
Q09ORklHX1BQQzY0PXkNCj4gQ09ORklHX1BQQ19CT09LM0VfNjQ9eQ0KPiBDT05GSUdfRTU1MDBf
Q1BVPXkNCj4gQ09ORklHX1RBUkdFVF9DUFVfQk9PTD15DQo+IENPTkZJR19QUENfQk9PSzNFPXkN
Cj4gQ09ORklHX0U1MDA9eQ0KPiBDT05GSUdfUFBDX0U1MDBNQz15DQo+IENPTkZJR19QUENfRlBV
PXkNCj4gQ09ORklHX0ZTTF9FTUJfUEVSRk1PTj15DQo+IENPTkZJR19GU0xfRU1CX1BFUkZfRVZF
TlQ9eQ0KPiBDT05GSUdfRlNMX0VNQl9QRVJGX0VWRU5UX0U1MDA9eQ0KPiBDT05GSUdfQk9PS0U9
eQ0KPiBDT05GSUdfUFBDX0ZTTF9CT09LM0U9eQ0KPiBDT05GSUdfUFRFXzY0QklUPXkNCj4gQ09O
RklHX1BIWVNfNjRCSVQ9eQ0KPiBDT05GSUdfUFBDX01NVV9OT0hBU0g9eQ0KPiBDT05GSUdfUFBD
X0JPT0szRV9NTVU9eQ0KPiBDT05GSUdfU0VMRUNUX01FTU9SWV9NT0RFTD15DQo+IENPTkZJR19G
TEFUTUVNX01BTlVBTD15DQo+IENPTkZJR19GTEFUTUVNPXkNCj4gQ09ORklHX0ZMQVRfTk9ERV9N
RU1fTUFQPXkNCj4gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQX0VOQUJMRT15DQo+IA0KDQpPSyBz
byBpdCBpcyBQUEM2NCBib29rM2UgYW5kIHdpdGggZmxhdG1lbS4NCg0KVGhlIHByb2JsZW0gaXMg
dmlydF90b19wZm4oKSB3aGljaCB1c2VzIF9fcGEoKQ0KDQpfX3BhKHgpIG9uIFBQQzY0IGlzICh4
KSAmIDB4MGZmZmZmZmZmZmZmZmZmZlVMDQoNCkFuZCBvbiBib29rM2UvNjQgd2UgaGF2ZQ0KDQpW
TUFMTE9DX1NUQVJUID0gS0VSTl9WSVJUX1NUQVJUID0gQVNNX0NPTlNUKDB4ODAwMDAwMDAwMDAw
MDAwMCkNCg0KDQpJdCBtZWFucyB0aGF0IF9fcGEoKSB3aWxsIHJldHVybiBhIHZhbGlkIFBGTiBm
b3IgVk1BTExPQ2VkIGFkZHJlc3Nlcy4NCg0KDQpTbyBhbiBhZGRpdGlvbmFsIGNoZWNrIGlzIHJl
cXVpcmVkIGluIHZpcnRfYWRkcl92YWxpZCgpLCBtYXliZSBjaGVjayANCnRoYXQgKGthZGRyICYg
UEFHRV9PRkZTRVQpID09IFBBR0VfT0ZGU0VUDQoNCkNhbiB5b3UgdHJ5IHRoYXQgPw0KDQojZGVm
aW5lIHZpcnRfYWRkcl92YWxpZChrYWRkcikJKChrYWRkciAmIFBBR0VfT0ZGU0VUKSA9PSBQQUdF
X09GRlNFVCAmJiANCnBmbl92YWxpZCh2aXJ0X3RvX3BmbihrYWRkcikpKQ0KDQoNClRoYW5rcw0K
Q2hyaXN0b3BoZQ==
