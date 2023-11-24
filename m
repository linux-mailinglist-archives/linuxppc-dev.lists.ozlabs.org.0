Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAD7F77EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 16:35:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DfPR8R6d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScJvR1GzCz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 02:34:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DfPR8R6d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScJtX3wzpz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 02:34:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJbmz7C8Y2e+x+CpV8s3+XuC9FQi9WYrv+KJw07bc2v7Nh1sms0wGZl3BvECl7QjNlMNcyS1Cl9eFfnbr536bEkKQkhihptf9RHxjvXHvh7H/TxGJq5JDalWV07HwlMwey8dlUHplkMeKvQ+bo7sz4+p++/b49MTJxFndKub4zh2KFE8STYeM3N64UxKNB6YlqgQurXthtKmMLfambB1RPtxm7GjSW66/s+jHZnNblOfpsJv1PanGNgloC9zI7pX16CqyKj1aPS1u/tP7OdApss7DXv5TUhZXaTpmDPXEFLYA7cj/P3FwrKU9CNL5Lf7Z1kUI2kHM3srj1xOn3mQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eFSuBUoUglNnTqxx1Nnvoecgb9TbscVo+1ji9wI+A8=;
 b=KSH7gyZlfAJ4kCJj1aSbNNmpSdVgUDTSviC8JPX1Ny1efTdCG3TZidmTTmtKIqWdAJfJ7NA0lrFi9TTKfqF9bGuiN5wLELHg/dnredeyZjgpzNuahxBX8BBPM1tdqnDBmbaL4gtMp0E/0A/6VKqGyTvgLmGJChu6BhsWKDwiQB36f1jaoS3aGoYZZKHzx/3cigOvHIQslQzFe6EV0kYQcwfK8MEegCtGwnIKW8IJGKxSVPyq6UCVobFU9gjAYntDFgv+36IZlvcmSUnBUqzLXSmp8JCY0JoI9pkuSnCnDJuS43pNcqXbNKQqnL1p5GWxwRubzywlAjkvYo7ZO3ysZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eFSuBUoUglNnTqxx1Nnvoecgb9TbscVo+1ji9wI+A8=;
 b=DfPR8R6dQEUoCJmpZUbQTZNdWxIhO2Sjf7OvmuH1J7eL14SDjCcuQlBT1a1tkbLgkTqDWZvUP6eafRg/0Y91LTcgRtZ4KduW1e27btBh6E2dQu6xgHf32KlMWHlIaZ9FrSeM6JS4Qat0jHLJwwwC+0mDRMJqz3q2IKLoadQKp8U/zwu/6Oj9G1e/M2m4k6yG12PtnfRBRWrDibDCwr3+lJM/SIQi8FA3Bowm/P6dpU0cd2MffCPbXMHnoePW4ePsc4cSbko8PEKq5HmXcFsv1WIzuJ3WKeWV2lbeUk4lLDtl6E2fTIRP+Wonj9a2d0F/5RGMgnoh8D9lbEeJcTP3AA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 15:17:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 15:17:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kunwu Chan <chentao@kylinos.cn>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Fix null-pointer dereference in
 pgtable_cache_add
Thread-Topic: [PATCH] powerpc/mm: Fix null-pointer dereference in
 pgtable_cache_add
Thread-Index: AQHaHSJgJiXPWYFmuEqBZMSA+dWuWLCJmGQA
Date: Fri, 24 Nov 2023 15:17:27 +0000
Message-ID: <32077b74-7335-4f4d-8858-c53c820150d0@csgroup.eu>
References: <20231122090026.11728-1-chentao@kylinos.cn>
In-Reply-To: <20231122090026.11728-1-chentao@kylinos.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3084:EE_
x-ms-office365-filtering-correlation-id: 6ca90148-f2f7-4ecf-7948-08dbed007857
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p5Ffk6Z9yUik3Anoy9zYvH2U21vhvRohxBn705aWWV1sCxYPumd/gUSBadlfHimK8ALPh5VSp90CNq1p1tTHh0w38PyXfaMvkxaT01xZRrz3DQ9BcB/RQStiW9LOD4PfNlWEdUj2xDwvuYbDHwUQ0qdYMCq76+2yQLjs/QsmFm5fJxj/sz1VoxWUBUYDn3BmAD12cssSGDxFTh1dgyblBn0heSK1jtGe/vZt2Sl2luSpOyRfHFOE0yCLKHqxNDPzaWN4GPRCBDkjTwgaFJzdUg8Y5qtSMe9zfj5S/xfS/HVyl6qwXceaQurBTd39dye91vmaNTjsy7eXQ4GKEkG+jjNR7PdRuHnCWBP8sj1mnMkQ8Yx9SbAzmoQrrEWzkysTJTbz20YP8qSviTovD4QC1FYGwy5ONkSmU4G+nGnaQTabJhvQ2d4FsRaq5ohiFqi2ldw7IP12+pYx2+Y39i0teG3u3i8O17tqbztsw9r5BIo7glI4MGjed5wA0w7hzymsdHMbY4h6wYZMjb980NGJTX0BBuv/FVO0PSUr03VUoXT3Lydix8AvPs1wepEE3s/XGwVxEz94o41an+MF5AFrrNH/FDYe/gCfv9A76pWv9/5/XKf5cKQdsBQMcasJ/PDJqYdHYrICh9ymHuDQCEtdJzc/T2KYBelO231L6DjEb3dV8ghezsFgFqUaziz3uLcsMmW4JsBYaOB4KNNY1qs9jFPrG4mBl7WPmlMm8DspBc0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(31686004)(26005)(6512007)(66574015)(83380400001)(2616005)(6506007)(966005)(478600001)(6486002)(66946007)(66476007)(64756008)(316002)(54906003)(110136005)(76116006)(66446008)(2906002)(86362001)(66556008)(31696002)(44832011)(5660300002)(91956017)(36756003)(8936002)(4326008)(8676002)(38100700002)(71200400001)(122000001)(41300700001)(38070700009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SlIxUnBxSXRDd1B4ZHN5YTZBaStudlZCQ2dDRVRsS2M3QTV5V2dNQVdJcGZK?=
 =?utf-8?B?MHRpUlo1T1lrT2V3S0dveTVDZG1BM2s1M0hLRW1DdllXb3c5QXZuNFNFWW92?=
 =?utf-8?B?N1pGVmZ0VklGcmRDdWNzVldsQngvU1RGc2RZSXRrVDJwcGx2WDIyeUJXMzUz?=
 =?utf-8?B?bVp1eFp0UGNWN0Fod1p5alB0NnArSjRHS1o5RGJ1b0lFd2JDSGFodlp3VEhF?=
 =?utf-8?B?YVdqV1kyN3J3TXN1MElUUDFTTmZDWUFBQVpQUGo2OE1GazQ1ODhNM09BVVEv?=
 =?utf-8?B?LzNFamJ0ZjVFK0padDZzby9pbWRyUW9kaHRBcC9TN3p0WUQ5dGFLclh2R1Rw?=
 =?utf-8?B?Mzlpdk1DUTBoTkI4SXVVMEx5V2xjUVRNNnV4di9TdVREYjZ5S0pVWXhqWFd0?=
 =?utf-8?B?b1VPNDRWSk9ZLzV4SHIwTDhvWEpqV3FNU1dNVWpwY2NhcUF6eE93eFB6TFBF?=
 =?utf-8?B?QWwrQTVYUGdKUFB4VGIxcWVTeE5UU1k2ajFodVNabmNuNEdvRGRJWGR4V2d6?=
 =?utf-8?B?c3gxeUJxVHNHcDJ5aVlmWW8wQ0dCclBrM3BSOEpQcVRkOUladjhubzhWRmtY?=
 =?utf-8?B?L2N3cndWbGV0WWhTcnVoY0IwWHdzWGpKWGpyeXR4K0JGTU0zYmNGN0dhKzNr?=
 =?utf-8?B?aEU5SEZ0MFlNQzUyRmswdU1Zd2tHbTJZWUsrM2VkM3lpL2VTb0MyWis0S2ND?=
 =?utf-8?B?dVZOSDN2YWNqWjJzQ3VqaWo4dmUvMStvQU1kbnR0ZUpudS90cU5zN0ZVRmE1?=
 =?utf-8?B?WE9wMUFMS0VOTmtoWGFwMlFXU21ybXJqY25tUUhuK1FqRmlBeFRneSswdEta?=
 =?utf-8?B?RWZlNWJUdHloWTczekRKV3VQSTJDejZBN0lIOE0xYlk3ZVQ0YjN6TWxJMkg5?=
 =?utf-8?B?RVR6YUFwNVBKdU5NVWQxTm9hTmdOTkpiVmcxQXdaTnVMZzBtYzBCT0NCR3d5?=
 =?utf-8?B?ZTNHTXFBN3dDcU9JcUI2M3hQNUR6VjR2YVBiK3Z1UGRBUlI0MU0rNUk1eHp5?=
 =?utf-8?B?NWFRSi9JNFUzdnNPRnp4VEt4dFU1b0RIRmZVZDRxY0dhWDdZTW5YZk1GUjJ3?=
 =?utf-8?B?cnJEdGlYVW1JUmRtb2ZXSmNsV2RNY2JleC94elMvK09tYXRIUWc4TEFBcUov?=
 =?utf-8?B?SmVra3JYN1RDNFZhLzB0YTBHcEpZZWZVSFBoUHRSV3psY0J1NExGbXZoY3A1?=
 =?utf-8?B?aysvZlcweVVVbHVIckpqZHNFRU5sVGFkRGRQblhMZEdWdWNVaGF0YVNncllx?=
 =?utf-8?B?aHllNlY4Vmk3MGJWTlRVeUFEYVpObXZ6MUsyRkVrOHUzQU5MTHYrK2NLL0hO?=
 =?utf-8?B?Y0ozNU9PTG90VTFwUWhIOVAvWW0xSElvRGkzNlNjT0FFTElGQjc1ZXNkOFVL?=
 =?utf-8?B?YmcyWm5UOHR5cmloMlhnSjJ2WnltcnF2bHE0Q0VyTmwwYkVYOXg5Z0krSTFZ?=
 =?utf-8?B?SkNWMGkwcEtZMWZKdnRSMGlRYWdjWW9XNXpCZzFJejJwcVNpdlh0VXJvbEx3?=
 =?utf-8?B?TFkrRlZLalhnMTB0RXQrRDBUckpPQStDQVNMUHNkYy9zSisyTHVQd0xvLzNE?=
 =?utf-8?B?bVNoZG5SbHg0Q0dlNCt5WU41cHlmWjA1RzdpVUZrbjlWSEFGbDkrMklXb3hG?=
 =?utf-8?B?VUtVTktNMmhvY0ZSWUF2VVdSSi9Za2lZQk1GQnkwY2pTbGF1Y3lpREM4UjM1?=
 =?utf-8?B?L0hYUllUcjkxKzlNVm45YkFmWHhuK1RPTDdiK1BIQUUvSXJxZ3F3UEV1THpn?=
 =?utf-8?B?cFdaV2xndU1ZQ2h1QWgramRoOEVWWGNIclNDWkpnYkRPUkJvNGpLc0swVXhU?=
 =?utf-8?B?c3JjU21EdzlaZDI5Tm80YlVYZit0bm55NVQ3NXBycjJERndkQk1qbXVSU2ly?=
 =?utf-8?B?L3dmeVlKajNQekU2bUNwN25hRjFETXhkSWNTNURvd1BTN0srRkkzQjZJRmxj?=
 =?utf-8?B?SDZDZE5oekNTVzJTYmtqTjFCT1RFR2N2NEZFc0lEOTZqMW5PWDR5MVpJS2Zw?=
 =?utf-8?B?UnErN2pZNVF4ZFRBM2tMNGllcDJmMmFsSy8rUWtOd2NLQytyalY1eklRRTNU?=
 =?utf-8?B?eURCRTlsSmc3L0tZYmdqZHcvUWRGZTVZUzZtb20xOGtVRHB4dXNjWEdXOE1v?=
 =?utf-8?B?SkdRVDRUNVRqaFJPNW5vcjRlRVJDdkw0YUlFN2ZIUVF1OGswKzd5cEx0QUIy?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9B7FC2514964840825D8EACA95A345F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca90148-f2f7-4ecf-7948-08dbed007857
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 15:17:27.7435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APuBn/uj6s1FMOYYomWS0AIe6PdWI5f6XNWb0IgrQTsLRtq6WkVYhS5AgUyYoJC2N1JpPJQGSHglhpYEZG3EDQJDQWS9YwGdA2cdUBYQB+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3084
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzExLzIwMjMgw6AgMTA6MDAsIEt1bnd1IENoYW4gYSDDqWNyaXTCoDoNCj4gW1Zv
dXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgY2hlbnRhb0BreWxpbm9z
LmNuLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4ga2FzcHJpbnRmKCkg
cmV0dXJucyBhIHBvaW50ZXIgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGVkIG1lbW9yeQ0KPiB3aGlj
aCBjYW4gYmUgTlVMTCB1cG9uIGZhaWx1cmUuIEVuc3VyZSB0aGUgYWxsb2NhdGlvbiB3YXMgc3Vj
Y2Vzc2Z1bA0KPiBieSBjaGVja2luZyB0aGUgcG9pbnRlciB2YWxpZGl0eS4NCg0KQXJlIHlvdSBz
dXJlIHRoaXMgaXMgbmVlZGVkID8gRGlkIHlvdSBjaGVjayB3aGF0IGhhcHBlbnMgd2hhdCBuYW1l
IGlzIE5VTEwgPw0KDQpJZiBJIGZvbGxvd2VkIHN0dWZmIGNvcnJlY3RseSwgSSBlbmQgdXAgaW4g
ZnVuY3Rpb24gDQpzeXNmc19kb19jcmVhdGVfbGlua19zZCgpIHdoaWNoIGFscmVhZHkgaGFuZGxl
cyB0aGUgTlVMTCBuYW1lIGNhc2Ugd2hpY2ggDQphIGJpZyBoYW1tZXIgd2FybmluZy4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogS3Vud3UgQ2hhbiA8Y2hlbnRhb0BreWxpbm9zLmNuPg0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMvbW0vaW5pdC1jb21tb24uYyB8IDIgKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2luaXQtY29tbW9uLmMgYi9hcmNoL3Bvd2VycGMvbW0vaW5pdC1jb21tb24uYw0KPiBpbmRleCAx
MTllZjQ5MWY3OTcuLjA4ODRmYzYwMWM0NiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21t
L2luaXQtY29tbW9uLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2luaXQtY29tbW9uLmMNCj4g
QEAgLTEzOSw2ICsxMzksOCBAQCB2b2lkIHBndGFibGVfY2FjaGVfYWRkKHVuc2lnbmVkIGludCBz
aGlmdCkNCj4gDQo+ICAgICAgICAgIGFsaWduID0gbWF4X3QodW5zaWduZWQgbG9uZywgYWxpZ24s
IG1pbmFsaWduKTsNCj4gICAgICAgICAgbmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAicGd0
YWJsZS0yXiVkIiwgc2hpZnQpOw0KPiArICAgICAgIGlmICghbmFtZSkNCj4gKyAgICAgICAgICAg
ICAgIHJldHVybjsNCj4gICAgICAgICAgbmV3ID0ga21lbV9jYWNoZV9jcmVhdGUobmFtZSwgdGFi
bGVfc2l6ZSwgYWxpZ24sIDAsIGN0b3Ioc2hpZnQpKTsNCj4gICAgICAgICAgaWYgKCFuZXcpDQo+
ICAgICAgICAgICAgICAgICAgcGFuaWMoIkNvdWxkIG5vdCBhbGxvY2F0ZSBwZ3RhYmxlIGNhY2hl
IGZvciBvcmRlciAlZCIsIHNoaWZ0KTsNCj4gLS0NCj4gMi4zNC4xDQo+IA0K
