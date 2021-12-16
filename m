Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCA477C62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFMSx3XWWz3c7x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 06:22:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFMSN3vDVz307l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 06:22:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDYIxSU3yK/ihWEWCORiHkypvVusqpETbWW0QYZF2FWQresvYqy9xmV6HmcLnNpfAR3oTAnkmR/zXhkw4/m2sCey+qFEzUbtPP1Ys/9aYhOHTm7IVYB/dEj1vMmy+CsqGq99gKDT9DvXti3saBSXzIMXUW5V9rOngELfQYiYG00honY+cq0sPY3eKkq4AXbRAVhYAG4SEJVPKNq+RfjwRkUJjT8ckZhGP0SKzG2F76J3fJf5RoVSQDeTtkIxxScV84kEbf2+RSR2SCx5/xW+DoVBeRAL4fewrJWtyC0WLJLPPscklOWAO0zxlBipZQ7GaYNh+5eH2Ot1GbH9qhuNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQGayLnUIsjgo9C5xTYt3SD1FV4kEK4ObbptXW7uHSc=;
 b=KUwIc8dDlldd7sXQyyrb+tM8PWBSbRagP1lwYNZSByYuO9iZFHS5v14iovl+pyGI57NbG5SmV7nz2I9hcOU99rIPtWTdKzcRkkz1hN5RuCt/2WeUf7Lakn1y0i0oVXfVFNxO6/a5aEI+H8mnhmvHQqw0ndBQwgpXtovihQAg7KS+AQ3G+hJgV+wYVc50MnmlZaBz+Pk9m4jiZfxAIkJjsCQCaHhVIfWg5qaUFs28/pxdnnaTFsv+vrANRfFQFr9mNEpR9R6HaFZeEBmrb7d7QhW1qE3YLVcppo5R6PLVK7Wq2WgQ0ioBcaxLV4Tvj5gixMMlnQrVeZVYnJoRIei8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (10.141.82.111) by
 MRZP264MB3129.FRAP264.PROD.OUTLOOK.COM (10.141.82.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.18; Thu, 16 Dec 2021 19:21:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 19:21:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc: Simplify and move arch_randomize_brk()
Thread-Topic: [PATCH 2/2] powerpc: Simplify and move arch_randomize_brk()
Thread-Index: AQHX7EB3EE2L+6Yk1kqjILMiGdDXTKw1i9EA
Date: Thu, 16 Dec 2021 19:21:44 +0000
Message-ID: <64841617-9edd-c9ac-4742-057a7c1d81fe@csgroup.eu>
References: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
 <3c5ffa5d102c9edbfeec19072416b33b102fdabb.1638973836.git.christophe.leroy@csgroup.eu>
In-Reply-To: <3c5ffa5d102c9edbfeec19072416b33b102fdabb.1638973836.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d97df905-1d73-4258-9ffb-08d9c0c94c17
x-ms-traffictypediagnostic: MRZP264MB3129:EE_
x-microsoft-antispam-prvs: <MRZP264MB31291946BD05E57FD45EA207ED779@MRZP264MB3129.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUyO7ChvXuoA+Vb6uBe9DVC/oB/0XYijBVuydR4jXHdQXJO9Gj75JIAgJkfLyX4/rJ0uJqfTnPHW4jc48KE+OfV40TSdlaWsd5TmJyxF/Cvm+Km4xFOEbzb7ogWuUF5kt/zg8jy75IxZYtnofIXCrVArWcuu6nCoVkYHF7ydicrUNuhPezUn5BkvMx33vSLkV4ih+kOC8cdWIPjnZzMokM+OpekrsDPyHiGWCAJ/NtUgGzHSCQat+VAIrr5gIg0WffS26mV2SAPoNHqc0uyHF0GrD/YALUvtgxV1UWgALSk5zazdbpw7xDL10HQRxTS0DE27+AeMMNjekJ7BuZFuwWiu2d30UxBD+fymZSeuK5h7BK1xZOLE7fiOBFpMKP2MvpLPKSp2Jsb7xR9m8JtOdNBuzzo0n4nQPIy77iUpO0WEDYUPbR4YD4E51OSQOtvkmpt2+LMNBUBybr+sGEitcfwtUN/DNBscmZfOka85p9CT2VuKF8PXusW1Ic6Dz15rqkD8gq53mo15Bi8aILbBkvC//CuOzAAK/1Si/J/DijTpf87sZz/tewbyAbYFdS9Vgw5MHPjQJ1k0wj2ocWIlqIiAunxHd2TLCNxV74fKXcuEIRG7XVMuVnyCj/78xq0cNy6EA/K40jCv/X4psv4NEA8U03qyl6in96XsYiITe04tT04ghnunhCVtFahW2kps1ARiwpZBUDn/frCty9C3OqblvVD6GWct1WIir+6pvMTQI1Wrwup4qQyCADovFXf0ROmK679N5/4FrYSL6VtVFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(31696002)(66476007)(71200400001)(66946007)(4326008)(316002)(6506007)(6512007)(8936002)(86362001)(2906002)(36756003)(83380400001)(44832011)(38070700005)(2616005)(54906003)(8676002)(26005)(186003)(508600001)(110136005)(6486002)(66556008)(64756008)(66446008)(91956017)(76116006)(122000001)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGw2aUJyQWZRaDVrRHVQUTNhY21RNmF6UlNQUDBIQW5wYjhiTFJUODVNcVBu?=
 =?utf-8?B?VzFWa2M3TDVJS3B4TXlKYm10WVl1eE1rNEJVUE5sd1hIclVPMm1tTEcrUS94?=
 =?utf-8?B?MjhVZEE0Nmp1ZUlEYXhkSVZuNnd1SUNDNk1xWU9oSm5uUmliUitYSnlDeTBi?=
 =?utf-8?B?cmtqK01QSXVOYmZnQXRYV0hmUEhZNnA0MXRJNGtkbWpTaFV5WUhsd0hEVGV2?=
 =?utf-8?B?MkhQUTBQYmZEalJEaW53M1d5b1NVbDFvQjIxdGRvZURLYTBzbGRWR3YwWm5F?=
 =?utf-8?B?b3BLM0NsNmh2RGFuOGMvL0JiTmdUMTNaU1FwNE16SGwvd0M3eHVSanpHdE1I?=
 =?utf-8?B?bUxSaGpDR3NmK0NVRENBRFRmTE8wTXB2eTQ5VVJkY29wdGNxcmhIMngzc0lF?=
 =?utf-8?B?RENRTEpqUkRFb01jbUxod1ZMZG91bW9EdTZjL3M0N3NIb1IydGE3NXRFNWZU?=
 =?utf-8?B?Z1FET3FHVkk3MXdkcXZqcUFkOGVGdTZpVzlYbCsvVkttRmxmSEdnQUtKTk9Y?=
 =?utf-8?B?VG1FY1EyckM2TDlBUzFSSXIrV1NkVi9iamZ2WEZ6Q3JCK3R4NmhTUkdCS3ND?=
 =?utf-8?B?MnpLRloyL2gzYVVySmRTVnJ1OG9WempLY21kOXBCTm1rcGxLTXdMZ09HRkVw?=
 =?utf-8?B?a0l6dSt4TU5rN0h5akpwS3o3MDRta0FrWUZISWN0TmpOWkZORGdlRFVpd3NX?=
 =?utf-8?B?MnJtR3kvajNtc0dKdHAzNmhzWFRTMWlhQlpscnJLVGJCUE9Gb2k1NVQ1dkVz?=
 =?utf-8?B?MXZ5UVN3bWoraWxrRFZ2a1lpKzNPeFB2bnF0TEhGWmNqcGdvM2x3UEpybHhJ?=
 =?utf-8?B?OHRuOVE3WXBtVGEyWHBndWo3TDEwTkcxNy9hUjNPT3VYK2FsYldSVHY5K0VH?=
 =?utf-8?B?QTFKdDJQcEpIY2lrTlZtWlJnSVJXYzg3SjVaSGRQRWIzb0FBUC9iSDFSQWIr?=
 =?utf-8?B?c2tZOEVPa0JWcXdFWWJkK1lSd0NXMFFUWUVJRGJkOXNWb0RsazdRMm9VTFcz?=
 =?utf-8?B?dnlTM2hqZTd4bUlVQTlsZis5QUhrSXdwWU5VNkhyL3NhT2FEbXRrSExQV2l6?=
 =?utf-8?B?VGZxN1Ewckx1QnIvRGxPWjlUUHJSS3llRGx1TENRY2lYb3hSZ2czTUQ4Y0Zi?=
 =?utf-8?B?RVhJZFFxSXF3VU9SN1lNZDE0bnI5NXV3WStiMlk2ODM2aDZaSmoxeHJXNGRZ?=
 =?utf-8?B?NnRRRWh3T1N0WFJTTmExQ2g4ZUhxeGpHQndMS2djUTdzckdVcTYyNGNiMVBE?=
 =?utf-8?B?b1RZajFVclI4cU5CRmdUNUlIKzA3TU9OQ0g2REN5Kzh2cE9xcm0vZDVsVkg1?=
 =?utf-8?B?d2hZbVhyQk96VzVTT1Z6c09nc3FEcHVBTks2cmhUNWlDVkh3TDlFZzE0TllQ?=
 =?utf-8?B?cUR2NDBtT0ExWDNLSGNJRVVDK2lBTjlCbkhIaVdKV2IzZEFJV2w0dlhlRGlI?=
 =?utf-8?B?TTdvVi9aeE1Tb3ozVTZKWFNTOHgyWTFHcXVpY3lrbFBsRjJPL3FleVZveUdR?=
 =?utf-8?B?c1JRUHBxV0lDbVRIcGpiQWFrZndoT3p0ekhodytXZU1YY2dwcVA1MEEwYm51?=
 =?utf-8?B?NFZTQ1JRVkwwMHZqMjM4L3FoQkNOOVRNYjBVRlVMdUVQaC9aa29YVzFYZzlu?=
 =?utf-8?B?M1dRc0ZSL0x6Y2Fsek9QbnUvNTlud2FNdy9kODBxeGd5NDBpTlU4bmY0LzBO?=
 =?utf-8?B?czZMMkRDQTVpcE5qLzltZkZqRUE0NXVia1hBTDNhYithUGdCNW5IYUFMKzUz?=
 =?utf-8?B?a0NpcFBUYnM3NGhtelBJQi80RGJ2cFh2OU0ya1lJQXd0MkJPOWhVZ3ludi9I?=
 =?utf-8?B?VGtJb0JiZXpGSUhSV1VTTzh5c0RSR1ppZXQ0ZmwwT1ljc3dBRXR2VklsOVBr?=
 =?utf-8?B?RnhkT0pjNHVrdEFlZFk0NUFsTktOTzZMNmQyaHIxUVdKME8zLy9vMTl3aGgx?=
 =?utf-8?B?UDBneDkvdjd2UDl1T09BdGVJTkdzRlJ5RzhhRkFIaEVVOFB3SkN0ZTQ2M1hs?=
 =?utf-8?B?WDFJSjkrM3A0Y2VlZzR2YUlZM0FtWndSVTI3dHUrYnNQSVVwOEFNR1pkU1k3?=
 =?utf-8?B?OWdFMzRyK2hKcE1jQ1JoT3RQY29LQTBkV3ZiVlZ1eStNR1ZDd2h4V2dDdDBs?=
 =?utf-8?B?VStTVlkxRDEwUHJVV1R2SkdxcEpyeGt1NExqeEhxY25BSjBURURiU3VvaURK?=
 =?utf-8?B?U2E3eHdqNkNFUFVPakIzc0RWcnc0a2luNU0yUHk2MHUzL3g0Qm1XUUUxbXJa?=
 =?utf-8?Q?T2kRQOqsfTMOk09jL2uW6tHfewk2ajwmQzi7q+c3k8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD744D90ECC33047BCCDB8C9ACA868DD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d97df905-1d73-4258-9ffb-08d9c0c94c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 19:21:44.6274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUjFKeSs4DR9hwohUOjtcKVS2A1+gXylrXpT6QkGfJOhPDmTpgYxj6bxrYLs7XvrmRGWJNE1Qam7VIHdq9Q1/QVtB7unEkhSvabHDHLm7TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3129
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzEyLzIwMjEgw6AgMTU6MzIsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gYXJjaF9yYW5kb21pemVfYnJrKCkgaXMgb25seSBuZWVkZWQgZm9yIGhhc2ggb24gYm9vazNz
LzY0LCBmb3Igb3RoZXINCj4gcGxhdGZvcm1zIHRoZSBvbmUgcHJvdmlkZWQgYnkgdGhlIGRlZmF1
bHQgbW1hcCBsYXlvdXQgaXMgZ29vZCBlbm91Z2guDQo+IA0KPiBNb3ZlIGl0IHRvIGhhc2hfdXRp
bHMuYyBhbmQgdXNlIHJhbmRvbWl6ZV9wYWdlKCkgbGlrZSB0aGUgZ2VuZXJpYyBvbmUuDQo+IA0K
PiBBbmQgcHJvcGVybHkgb3B0IG91dCB0aGUgcmFkaXggY2FzZSBpbnN0ZWFkIG9mIG1ha2luZyBh
biBhc3N1bXB0aW9uDQo+IG9uIG1tdV9oaWdodXNlcl9zc2l6ZS4NCj4gDQo+IEFsc28gY2hhbmdl
IHRvIGEgMzJNIHJhbmdlIGxpa2UgbW9zdCBvdGhlciBhcmNoaXRlY3R1cmVzIGluc3RlYWQgb2Yg
OE0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+DQo+IC0tLQ0KPiAgIEFwcGxpZXMgb24gdG9wIG9mIHNlcmllcyAicG93
ZXJwYzogTWFrZSBoYXNoIE1NVSBjb2RlIGJ1aWxkIGNvbmZpZ3VyYWJsZSINCg0KSSB3YXMgb2J2
aW91c2x5IGRyZWFtaW5nIHdoZW4gSSBzZW50IHRoaXMgcGF0Y2guDQoNCkl0IGRlZmluaXRlbHkg
cmVxdWlyZXMgQ09ORklHX0FSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQgc28g
DQpzaG91bGQgY29tZSBhdCB0aGUgZW5kIG9mIHRoZSBvdGhlciBzZXJpZXMuDQoNCj4gDQo+ICAg
YXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICB8IDQxIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMg
fCAxOSArKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA0MSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jDQo+IGluZGV4IDk4NDgx
M2E0ZDVkYy4uZTdmODA5YmRkNDMzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBAQCAt
MzQsMTAgKzM0LDggQEANCj4gICAjaW5jbHVkZSA8bGludXgvZnRyYWNlLmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbF9zdGF0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BlcnNvbmFsaXR5
Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2h3
X2JyZWFrcG9pbnQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPg0KPiAtI2luY2x1
ZGUgPGxpbnV4L2VsZi1yYW5kb21pemUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcGtleXMuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvc2VxX2J1Zi5oPg0KPiAgIA0KPiBAQCAtMjMxMyw0MiArMjMx
MSwzIEBAIHVuc2lnbmVkIGxvbmcgYXJjaF9hbGlnbl9zdGFjayh1bnNpZ25lZCBsb25nIHNwKQ0K
PiAgIAkJc3AgLT0gZ2V0X3JhbmRvbV9pbnQoKSAmIH5QQUdFX01BU0s7DQo+ICAgCXJldHVybiBz
cCAmIH4weGY7DQo+ICAgfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYnJr
X3JuZCh2b2lkKQ0KPiAtew0KPiAtICAgICAgICB1bnNpZ25lZCBsb25nIHJuZCA9IDA7DQo+IC0N
Cj4gLQkvKiA4TUIgZm9yIDMyYml0LCAxR0IgZm9yIDY0Yml0ICovDQo+IC0JaWYgKGlzXzMyYml0
X3Rhc2soKSkNCj4gLQkJcm5kID0gKGdldF9yYW5kb21fbG9uZygpICUgKDFVTDw8KDIzLVBBR0Vf
U0hJRlQpKSk7DQo+IC0JZWxzZQ0KPiAtCQlybmQgPSAoZ2V0X3JhbmRvbV9sb25nKCkgJSAoMVVM
PDwoMzAtUEFHRV9TSElGVCkpKTsNCj4gLQ0KPiAtCXJldHVybiBybmQgPDwgUEFHRV9TSElGVDsN
Cj4gLX0NCj4gLQ0KPiAtdW5zaWduZWQgbG9uZyBhcmNoX3JhbmRvbWl6ZV9icmsoc3RydWN0IG1t
X3N0cnVjdCAqbW0pDQo+IC17DQo+IC0JdW5zaWduZWQgbG9uZyBiYXNlID0gbW0tPmJyazsNCj4g
LQl1bnNpZ25lZCBsb25nIHJldDsNCj4gLQ0KPiAtI2lmZGVmIENPTkZJR19QUENfQk9PSzNTXzY0
DQo+IC0JLyoNCj4gLQkgKiBJZiB3ZSBhcmUgdXNpbmcgMVRCIHNlZ21lbnRzIGFuZCB3ZSBhcmUg
YWxsb3dlZCB0byByYW5kb21pc2UNCj4gLQkgKiB0aGUgaGVhcCwgd2UgY2FuIHB1dCBpdCBhYm92
ZSAxVEIgc28gaXQgaXMgYmFja2VkIGJ5IGEgMVRCDQo+IC0JICogc2VnbWVudC4gT3RoZXJ3aXNl
IHRoZSBoZWFwIHdpbGwgYmUgaW4gdGhlIGJvdHRvbSAxVEINCj4gLQkgKiB3aGljaCBhbHdheXMg
dXNlcyAyNTZNQiBzZWdtZW50cyBhbmQgdGhpcyBtYXkgcmVzdWx0IGluIGENCj4gLQkgKiBwZXJm
b3JtYW5jZSBwZW5hbHR5Lg0KPiAtCSAqLw0KPiAtCWlmICghcmFkaXhfZW5hYmxlZCgpICYmICFp
c18zMmJpdF90YXNrKCkgJiYgKG1tdV9oaWdodXNlcl9zc2l6ZSA9PSBNTVVfU0VHU0laRV8xVCkp
DQo+IC0JCWJhc2UgPSBtYXhfdCh1bnNpZ25lZCBsb25nLCBtbS0+YnJrLCAxVUwgPDwgU0lEX1NI
SUZUXzFUKTsNCj4gLSNlbmRpZg0KPiAtDQo+IC0JcmV0ID0gUEFHRV9BTElHTihiYXNlICsgYnJr
X3JuZCgpKTsNCj4gLQ0KPiAtCWlmIChyZXQgPCBtbS0+YnJrKQ0KPiAtCQlyZXR1cm4gbW0tPmJy
azsNCj4gLQ0KPiAtCXJldHVybiByZXQ7DQo+IC19DQo+IC0NCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNz
NjQvaGFzaF91dGlscy5jDQo+IGluZGV4IGVjZWQyNjZkYzVlOS4uYjE3OWEwMDFiZmE0IDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF91dGlscy5jDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMNCj4gQEAgLTM3LDYgKzM3LDgg
QEANCj4gICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BndGFi
bGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L3JhbmRvbS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2VsZi1yYW5kb21pemUuaD4NCj4gICANCj4g
ICAjaW5jbHVkZSA8YXNtL2ludGVycnVwdC5oPg0KPiAgICNpbmNsdWRlIDxhc20vcHJvY2Vzc29y
Lmg+DQo+IEBAIC0yMTg1LDMgKzIxODcsMjAgQEAgdm9pZCBfX2luaXQgcHJpbnRfc3lzdGVtX2hh
c2hfaW5mbyh2b2lkKQ0KPiAgIAlpZiAoaHRhYl9oYXNoX21hc2spDQo+ICAgCQlwcl9pbmZvKCJo
dGFiX2hhc2hfbWFzayAgICA9IDB4JWx4XG4iLCBodGFiX2hhc2hfbWFzayk7DQo+ICAgfQ0KPiAr
DQo+ICt1bnNpZ25lZCBsb25nIGFyY2hfcmFuZG9taXplX2JyayhzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkNCj4gK3sNCj4gKwkvKg0KPiArCSAqIElmIHdlIGFyZSB1c2luZyAxVEIgc2VnbWVudHMgYW5k
IHdlIGFyZSBhbGxvd2VkIHRvIHJhbmRvbWlzZQ0KPiArCSAqIHRoZSBoZWFwLCB3ZSBjYW4gcHV0
IGl0IGFib3ZlIDFUQiBzbyBpdCBpcyBiYWNrZWQgYnkgYSAxVEINCj4gKwkgKiBzZWdtZW50LiBP
dGhlcndpc2UgdGhlIGhlYXAgd2lsbCBiZSBpbiB0aGUgYm90dG9tIDFUQg0KPiArCSAqIHdoaWNo
IGFsd2F5cyB1c2VzIDI1Nk1CIHNlZ21lbnRzIGFuZCB0aGlzIG1heSByZXN1bHQgaW4gYQ0KPiAr
CSAqIHBlcmZvcm1hbmNlIHBlbmFsdHkuDQo+ICsJICovDQo+ICsJaWYgKGlzXzMyYml0X3Rhc2so
KSkNCj4gKwkJcmV0dXJuIHJhbmRvbWl6ZV9wYWdlKG1tLT5icmssIFNaXzMyTSk7DQo+ICsJZWxz
ZSBpZiAoIXJhZGl4X2VuYWJsZWQoKSAmJiBtbXVfaGlnaHVzZXJfc3NpemUgPT0gTU1VX1NFR1NJ
WkVfMVQpDQo+ICsJCXJldHVybiByYW5kb21pemVfcGFnZShtYXhfdCh1bnNpZ25lZCBsb25nLCBt
bS0+YnJrLCBTWl8xVCksIFNaXzFHKTsNCj4gKwllbHNlDQo+ICsJCXJldHVybiByYW5kb21pemVf
cGFnZShtbS0+YnJrLCBTWl8xRyk7DQo+ICt9DQo+IA==
