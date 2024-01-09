Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E52DD82839C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 11:00:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Gg7+NspP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8RJK3PrCz30gD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 21:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Gg7+NspP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8RHQ56qqz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 20:59:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwgxSB7VYMyyG0vSEQrSl7Gr7relI6S1AN8MiJQi7leQB4Tf+TwTijVWg69MSmCRDesmxQVf0gYcKLqqNP2DNgLuc1gtKmYpWtXp7kKVodXpH6UwjIwMVe0/Qxd3AJxfclL+DKuNrnk+0449UQc7Y46elqwEgmqY+VhOFyxWAXVIUcKiHtCdA2xawIy1OX14sefwwEA8vfEDOBZz0AqVmaaX/xQZbkzTAspb7KAuIh87YdfyWIMHiB7DVUK2/KHVl2YEG9vLMS9wsWL0NhL4TvxbXVf5UkPfDLO8kdiW1hCu8SDY8OSjMcJ4YPzHIpOjFfayqvLyR7vvRB4L5F343w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8YmzRzrN0f/a9Wv7saFpZ+7IU51W4J27KcNsxq+6FY=;
 b=RjoZH8Aj54i3qdeEdzwori6j0l6cFhLV+pOFLnA3SlJ9i4YrCSR7fy9i0RNZYFwJgxkRjMIauq1SKuGhOXZuxt2Y0fM+rg4Yg9mWAlzuooSsJVNduFwt5v0BoJKzgEuNlxtCifPN/VNi8FRrr2aMgX4qSK0HEezwbzxVlByJ411rZ1znvIam9IoHfMxvNAeBKrdSECsJW39NXFATW8TGFJInMHw7D3VxMZNvPbbbsp4IAQAMOtu0xzVi1aEujeRQi6r/PADLJXCoWhsQ6yJehIBKvLwZIFkRMlAW+13GqjRbES1HmRPtEWsLE7GQ6yg7qfTE2VNkutvm6YbujXPtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8YmzRzrN0f/a9Wv7saFpZ+7IU51W4J27KcNsxq+6FY=;
 b=Gg7+NspPaJ69kPooYvh0BL9wYP9Fd2bncUccya/dn9aHBERuDWOfHss9ikNZj/d5enD/lmdGcdg6GKYFBXL4C+IjltW/yK+48Z5f1V8f5dwmwaWH1462iNUV5OhyZrmK3YJR05z+Q+GDnEyb0LMbuwcwqBnlJHI85wQjrQ2U4VdnpMRc18uERs7RuJj4fi4CbDOkRtEVecE7xJo8jN46dKHun83I5HROmPvy2V0AWf9miPJvAwDQR4SU4Azmptx7fnmKnW1dew85AusjvlKy1Njtq/OGdYxLxSdcSwT8wqJAs9+RrKFfNHpOUx//AHrw2v8V2XZ7p5qlbhYC3PI5fA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2922.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 09:59:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 09:59:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: GUO Zihua <guozihua@huawei.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix preserved memory size for int-vectors
Thread-Topic: [PATCH] powerpc: Fix preserved memory size for int-vectors
Thread-Index: AQHaQq2+M7vr4rRHP0eB3ZFywE363rDRP6kA
Date: Tue, 9 Jan 2024 09:59:19 +0000
Message-ID: <1e4cabf5-2d1a-4046-bff9-7f3547abb613@csgroup.eu>
References: <20240109033851.1310455-1-guozihua@huawei.com>
In-Reply-To: <20240109033851.1310455-1-guozihua@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2922:EE_
x-ms-office365-filtering-correlation-id: 47a6d26e-a6a2-40b3-7961-08dc10f9a5c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SFDvFCly3XzqVwW3OcB2Sv6dq6gC9Y7M5Jv0IVK3x0nR4xIbh7JrDWCfyNWVZKMY0yjsX9SJaSVMkqDgOsvNekZNrOJZYNvUzv5vP3TNcvIplOBhkT7b12Hs3E1pZv5nSlEhshT65qaKVwwya7gzm0xjI6xTErQjFC54Bb6rTkkV5wRcmOUiUS9CFITIjru17ozVHbZyBsATl5tUSfYWj7brLcIG5ySC89UYButFDCb1Va1PlnwmQTQJOxh7jYJDmOuwWazeL1RepFAU7j5hjZHx4Vw5PE8vKueMqUMStpf4K2YqipBZvoVuuWqiVb15lQkfwWVY85I+NxdTvsbTs9z8OHSqjiMo/Had9m+y3+8gkIa3nCt/kCjt2GscbFyAG+3IhSxU9vvXK+D/3Jl0gHnKO9+4hn7l21E5P5sIKT05ew7kkokqmbS3anGQWtDwgO7AYeqKTEbIXUA4u/BhX2SCHbKjz2GYPDuvO7uSEUldRKyVZm8E4Za99QreX/vcIA6RaD6S5iGPjjBha9Sx5ORCoUHq1wQc9pJuWy3wBqSkgPt6mrBsIRc7alBaaRLOMaD+TcMlVr4tyZLUK98aHcIDiBX67xdtkHKUGvLDd5Yi7Wu1dDU7UDfHDTMVeE0RLQKuetYPBG8c4clOjKiUS/ZnGwMjz4yGtffBuJyXXET7E45+m907PTJYtlTKUajY
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39850400004)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(31686004)(66574015)(966005)(478600001)(4326008)(5660300002)(8936002)(6512007)(66556008)(71200400001)(66476007)(6506007)(64756008)(66446008)(76116006)(8676002)(91956017)(6486002)(2616005)(44832011)(26005)(66946007)(2906002)(122000001)(83380400001)(36756003)(54906003)(110136005)(316002)(38100700002)(86362001)(41300700001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c0FlR3R2N2RUMUxaS0RIdUp3NlJHeUlURWFxVjl6UzF6c2R4Zjlmam5FZkI1?=
 =?utf-8?B?aWtkZE1YYU1GeGdJMU5CZVZIQ3RrUmRSdC9BTUZRbEpaV3I1bWFrZ2ZsU3V5?=
 =?utf-8?B?OUN0SDJaekZWYitBLzY4TGd3Mk1tV0ZRZWZnQm5lMjNZRXQ4UFk2c05JYzRI?=
 =?utf-8?B?dTRWMTBTWnpjSGM3SGtXSE9XUVZTR1crV0RYN21zaS9YMlhUNkRreWVCK1dh?=
 =?utf-8?B?cTB3OVpjU0Fxb0VndC80cVZjZGdUcXFmSkNtSzN6Z3d6YVVQWnF2VVMrZWlo?=
 =?utf-8?B?RHQrNitLL2pjUmhHbnp5NmR3aXBWSVdETHpKUVJNa2k1bGt1cXZUWENmaFBY?=
 =?utf-8?B?Nkh3UkJnYkYvZTNidXM0TDJlZWhhZjQwbTdVaWcvNWVWNmlyeklhRTZOTmFK?=
 =?utf-8?B?WEI1Z082Vk5jL2R5dStielBodFBrNDJrMmV1cFVhT0MwRGJZSkluajJrYTdy?=
 =?utf-8?B?bHdKSHFscTlqVFliZ2VrV0I1T1RBNDJSajRVbmV5NHFxZVhQQVJUcFNCUW9M?=
 =?utf-8?B?VXYya2NtYjgxNWQ5TVVPVm1VRDd4MXRDWmJsaTlpQzkxN2J2ak5JYXE3MlVF?=
 =?utf-8?B?LzJ3Y3lnY3lWOHVwRUlpbWtGdENhVlVxLzRDakRBb2h2M0tQTXREU0dkK1pj?=
 =?utf-8?B?aENOemRLR01XUXJpNFRBSzRVMkNVQ1Q5cVhrd09yZjZYaTVUbjNFVVpRNHdU?=
 =?utf-8?B?N3pka0Rva25RclREVEtGM3dBWk1ubGdJUjdrQnczTEdBdFkzZlNKTGJHa0M3?=
 =?utf-8?B?RjQ5b1k1cVU4MU5mWWhVOHV1cndINkRFM1NsbDd5RXNSdGlXNHRTVWdOdFBy?=
 =?utf-8?B?aXF5TlNzZ0ZrUk5nNkdWZmNGTkphalBjUXB4c2pJWlF5OUE5eUt2dFhlVkxZ?=
 =?utf-8?B?VjN3QlRUN0xkamJpaFBDVHQ0NVgwT05iZ3pGdll1eks1b0JpZVp0eFFXTkdh?=
 =?utf-8?B?cDJXelVBNGhlcnNOQ00vTFdoT2ZTVTZWUlBjVVdDR0hVNGlYby9McWI5NlNS?=
 =?utf-8?B?eWFwVlEwUUQwYkE0WDhsM2trR3lPbEZXOFZsTkVUZU03WWJ2eVI4clNtdjBp?=
 =?utf-8?B?WnB3cVFnN1JhcHE4MW5wTXdNS3UrdlpvcjJMRzl2T0ZoWHdRa3hWZ24vemhp?=
 =?utf-8?B?cTFKZ0kvN2ZUZzdENDdQNWRGUXVuSlppUElpNWNEM2xsV3JKVFArblVYenR5?=
 =?utf-8?B?Uk9kRGtzWlhoMlA3SkI4YlRjekxtWWFUSTZuYXFNU2xuejVQeFowa3drSXR1?=
 =?utf-8?B?OFp1VnRiY29teW1JWHJDZHo0bEFLMWFjb1Y1WWRhQXdXdEk3cE9EYmpQUytC?=
 =?utf-8?B?dWdwbnFncHJ0NCs2T0xqbXBKUE1oYnpYV2JEamFhU1RvYWVZSjVJeWZnVkVy?=
 =?utf-8?B?Zmw1QW0wRWlEd1ZXK2U3M2lKVkdVbDIxYzhrS25vK0N6NFR6U3ZGYkNOckFs?=
 =?utf-8?B?WmwrYmdCdm56Nmc1clhBaE1helk2T3ZGUXg2cFI0TEh6R2kxaldPdEpveWhN?=
 =?utf-8?B?TUUxaGNxWEtxdm1RSExDYWdKMUhINWVFL3Iza3NLYXBWNEpuZ2d6K3FhSUNH?=
 =?utf-8?B?d1lmSm04dTB1aElKbVBOeGxhVnRPWFc0d0Y1Z2kyV0F0R1lBU2VYSVFtbURE?=
 =?utf-8?B?L1pCdkw2RlRNNVBiSVNLTndHSko5eGV6TTBJRTJueTBrdXlTQndxbnkwcDlW?=
 =?utf-8?B?eXdWdGdiNStTSFkybGo3a3hzTzVYNjR5ajhqUHNOV3drdHdMY1Y2UVg1NE5Q?=
 =?utf-8?B?a041ZkNTMlhRUzVMRVNCSnRRaGdsOTY3cFB1MzR0U3J4SGd4UHZmZklEblIz?=
 =?utf-8?B?L3JEZ2hGanJXa1N3QVdpTGpIVHlvbjJCOXJaSHB1NmhrQnFFMjFQSy82Q3Rh?=
 =?utf-8?B?bDFBWWlUbHlvcHJFUy81Tks0K2ZIclBWSCtqNXZDejJrc3VhZmR3UURUWTUv?=
 =?utf-8?B?aElNbkZyRm5HMnVwNHdiYzRSYTZHNk1SeFg1QXR6Rm8rTFAxMW9TQ3hIeTAr?=
 =?utf-8?B?dlg2SmZPQ2FPNzJHbUNNS3pkb3pjcWV0NmRpMFBWU0ZUVUxnMWtSQkpqdWE0?=
 =?utf-8?B?UDlxZkxxOFVvL1pjUFNsZ1dlbzVwc1BGUXlYdjBWSmdqYUdkU0dZVlNkY1pv?=
 =?utf-8?Q?GfmayhFCpdH+qjWRK3/s1V9g1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0F5186CDC239542B31C213E2B253DAD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a6d26e-a6a2-40b3-7961-08dc10f9a5c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 09:59:19.3294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOIKZ/dHmOJ7Mf/cuIG9NwKdMWHHtjpli1n1FwLqbTIDfV7j+064iA1Qc1KcZk/bQaJpfW8coZsbeXlF/j+xKol5cZ3nTBnQ6cbNK7YFBcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2922
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
Cc: "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAxLzIwMjQgw6AgMDQ6MzgsIEdVTyBaaWh1YSBhIMOpY3JpdMKgOg0KPiBbVm91
cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBndW96aWh1YUBodWF3ZWku
Y29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhlIGZpcnN0IDMy
ayBvZiBtZW1vcnkgaXMgcmVzZXJ2ZWQgZm9yIGludGVycnVwdCB2ZWN0b3JzLCBob3dldmVyIGZv
cg0KPiBwb3dlcnBjNjQgdGhpcyBtaWdodCBub3QgYmUgZW5vdWdoLiBGaXggdGhpcyBieSByZXNl
cnZpbmcgdGhlIG1heGltdW0NCj4gc2l6ZSBiZXR3ZWVuIDMyayBhbmQgdGhlIHJlYWwgc2l6ZSBv
ZiBpbnRlcnJ1cHQgdmVjdG9ycy4NCg0KWW91IHNheSAidGhpcyBtaWdodCBub3QgYmUgZW5vdWdo
Ii4gRG8geW91IGhhdmUgZXhlbXBsZXMgb2Ygd2hlbiBpdCBpcyANCm5vdCBlbm91Z2gsIG9yIGlz
IGl0IGp1c3QgaHlwb3RoZXR5Y2FsID8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR1VPIFppaHVh
IDxndW96aWh1YUBodWF3ZWkuY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3By
b20uYyB8IDExICsrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb20uYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbS5jDQo+IGluZGV4IDBiNTg3OGMzMTI1
Yi4uZjM3NDQ4NzUxM2IzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb20u
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb20uYw0KPiBAQCAtNzU4LDYgKzc1OCw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzYXZlX2ZzY3JfdG9fdGFzayh2b2lkKSB7fQ0KPiAgIHZv
aWQgX19pbml0IGVhcmx5X2luaXRfZGV2dHJlZSh2b2lkICpwYXJhbXMpDQo+ICAgew0KPiAgICAg
ICAgICBwaHlzX2FkZHJfdCBsaW1pdDsNCj4gKyAgICAgICBzaXplX3QgaW50X3ZlY3Rvcl9zaXpl
Ow0KDQpXaHkgc2l6ZV90ID8NCg0KbWVtYmxvY2tfcmVzZXJ2ZSgpIHRha2VzIGEgcGh5c19hZGRy
X3QNCg0KPiANCj4gICAgICAgICAgREJHKCIgLT4gZWFybHlfaW5pdF9kZXZ0cmVlKCVweClcbiIs
IHBhcmFtcyk7DQo+IA0KPiBAQCAtODEwLDkgKzgxMSwxNyBAQCB2b2lkIF9faW5pdCBlYXJseV9p
bml0X2RldnRyZWUodm9pZCAqcGFyYW1zKQ0KPiAgICAgICAgICBzZXR1cF9pbml0aWFsX21lbW9y
eV9saW1pdChtZW1zdGFydF9hZGRyLCBmaXJzdF9tZW1ibG9ja19zaXplKTsNCj4gICAgICAgICAg
LyogUmVzZXJ2ZSBNRU1CTE9DSyByZWdpb25zIHVzZWQgYnkga2VybmVsLCBpbml0cmQsIGR0LCBl
dGMuLi4gKi8NCj4gICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShQSFlTSUNBTF9TVEFSVCwgX19w
YShfZW5kKSAtIFBIWVNJQ0FMX1NUQVJUKTsNCj4gKyNpZmRlZiBDT05GSUdfUFBDNjQNCj4gKyAg
ICAgICAvKiBJZiByZWxvY2F0YWJsZSwgcmVzZXJ2ZSBhdCBsZWFzdCAzMmsgZm9yIGludGVycnVw
dCB2ZWN0b3JzIGV0Yy4gKi8NCj4gKyAgICAgICBpbnRfdmVjdG9yX3NpemUgPSAoc2l6ZV90KSgo
dWludHB0cl90KV9fZW5kX2ludGVycnVwdHMgLQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICh1aW50cHRyX3QpX3N0ZXh0KTsNCg0KV2h5IGRvIHlvdSBuZWVkIHNvIG1hbnkg
Y2FzdHMgPyBXaGVuIEkgbG9vayBpbnRvIGZ1bmN0aW9uIA0Kb3ZlcmxhcHNfaW50ZXJydXB0X3Zl
Y3Rvcl90ZXh0KCkgaXQgc2VlbXMgdG8gd29yayB3ZWxsIHdpdGhvdXQgY2FzdCBhdCBhbGwuDQoN
Cj4gKyAgICAgICBpbnRfdmVjdG9yX3NpemUgPSBtYXhfdChzaXplX3QsIDB4ODAwMCwgaW50X3Zl
Y3Rvcl9zaXplKTsNCg0KVXNlIFNaXzMySyBpbnN0ZWFkIG9mIDB4ODAwMA0KDQo+ICsjZWxzZQ0K
PiAgICAgICAgICAvKiBJZiByZWxvY2F0YWJsZSwgcmVzZXJ2ZSBmaXJzdCAzMmsgZm9yIGludGVy
cnVwdCB2ZWN0b3JzIGV0Yy4gKi8NCj4gKyAgICAgICBpbnRfdmVjdG9yX3NpemUgPSAweDgwMDA7
DQoNClVzZSBTWl8zMksNCg0KPiArI2VuZGlmDQo+ICAgICAgICAgIGlmIChQSFlTSUNBTF9TVEFS
VCA+IE1FTU9SWV9TVEFSVCkNCj4gLSAgICAgICAgICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoTUVN
T1JZX1NUQVJULCAweDgwMDApOw0KPiArICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShN
RU1PUllfU1RBUlQsIGludF92ZWN0b3Jfc2l6ZSk7DQo+ICAgICAgICAgIHJlc2VydmVfa2R1bXBf
dHJhbXBvbGluZSgpOw0KPiAgICNpZiBkZWZpbmVkKENPTkZJR19GQV9EVU1QKSB8fCBkZWZpbmVk
KENPTkZJR19QUkVTRVJWRV9GQV9EVU1QKQ0KPiAgICAgICAgICAvKg0KPiAtLQ0KPiAyLjM0LjEN
Cj4gDQo=
