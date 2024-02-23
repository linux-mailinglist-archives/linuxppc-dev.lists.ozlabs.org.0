Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463F860EE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 11:08:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mNQPwrti;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th5L63KmTz3dWY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 21:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mNQPwrti;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th5KJ3hfJz3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 21:07:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgFflJfa8MLbMiNhW1dEWlrAk2gBWp7lwv8BP5jELEe+fBT+k7Ovu+Ctjuso1mbr4k94Qz2Odae1sXSRQr/CMPTWIKUjD/5FocLIRKL3SzpbQIsv7QB98TvsAVsZOrDND6lrWZOoWqTknKi4DYFsdcj6q9pNoBXMHBe26D+657OCRFs7v1B0satTEs0jo0A8DyIbjWxLNn4RE9PB2tiCuG+KFjxb4ZU5V7uy8COZtCHgrIKIMapLXPIy5kw2IIRA6xEwNkCCRQ6SZUbQKurQzPYPfWVNJd/LgVDyJJ/Xo0tcpgHXjjbYFaVcWx0laW9S0wquUCsxS9Q/7NlA6ecJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0KRK4ogTylkr1JoS6Fg2/rrhaQDQiQ/8BTvuhUzi/U=;
 b=V6h4VD7VzdU0r8TinEnJoGL1feeWT2xNf9XDWIVLccsxFlaY0dGVmsHCk7wB7xHLak7oq00gRfNdb2ycax8ALfdxXbtLpwn0A2vlslXxPbC5FW6noXJbnCLK3UDTfOuGLQ8x4sq/C4SyTpc1Z4Gbmxqvn677sE+HFItVK8TAHCRJOLG8xQewnT/kQE23AaJEtveQSNYntowopvy+yhFP33vqZxOXS4mOoINI+gkrW+bcSql1qaPzfqWNiUkHtmpt8YKSCDUF41dJJAr8gzzNertADFyYIjP4MtD91K+bgIGWIeymTbIyqOagDn7pmTCkobLzREfnb+cR6g0X4O76wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0KRK4ogTylkr1JoS6Fg2/rrhaQDQiQ/8BTvuhUzi/U=;
 b=mNQPwrtivfn6Ykq89v5vL557aNl2ZCn3iI39cP/SZc4Izfbu7D/Z2fmlacUT+7DMYU47PWgJVKaV3Ywz9eDq2hBd7Xy6SNxNlk93+q64vC7hCboVrhKUpOlafV5GFc9sV8owUlZpzFXqgWrFp8WaM+M5t2+JjfwTl47DkU8KhgttP1pl/Qa2hW/wP8Bz7X8A5AKr+hsWHBinalIEl8F582tc6P/3+94RUpYJKvp4+nhNGxeiDnfmoVsRIHBwe++iR0yBmQW9Io3p6rr9PpSAuPOcN0VOG6B1zLXvnTHcI9Dgr2usK3HtVHsOzSMTdTHMM1ennfJi+DIuwdDIvl3HxA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3130.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 10:06:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 10:06:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Charlie Jenkins <charlie@rivosinc.com>, Guenter Roeck
	<linux@roeck-us.net>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Helge Deller
	<deller@gmx.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Parisc List
	<linux-parisc@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Topic: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Index: AQHaZkAGLgdm0wM7/EyWAeS1+R0G6g==
Date: Fri, 23 Feb 2024 10:06:54 +0000
Message-ID: <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
References:  <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
In-Reply-To:  <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3130:EE_
x-ms-office365-filtering-correlation-id: 56127325-f133-4b8b-5d0c-08dc3457298b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iNIcZs5VkY6mdB3FMEfrhjrB8YPyRfMNypLuLkLcltC22iPb5fhiIGKRVkrjaH7PiNE99mtL7t6TIapzuX35pAyEHRahKJ+zhNw558ZR8Z5wwzMriZN+vAZT/hlZgSp8X3CS/00Lqm8qqZhvAn+0N+loj3/xne8whU5Mtc8Ev9L4vBzKkOwoKvojpe5m+44ND6C00hKFp3hgXYUIijFPTdDIZMiqvqjJlC37z6SV0tA83VrLRnYNv4G/sVSTqQBZd5JEq2JbZmTo8aTenr35skqNXCzI1sGlJq/XOOy0J3neocvgIRBomyVIpV1TpMge3s8PwUFdUcuxB6qwwT84KyiuMzKgrt7hH4lWD7Y7NthKkUo9V7lH3MnASRO/hWMdJOW5qgrcl70IbYlSkKLP9ayIDJBlf7BqPw1V/CbA8CpeLCXBsgAOVlmBVtgNrsKm7eUWi30uj3SiqRJTEk5ayoV2G4JPFLoYPrngm74xa/LCF2zHUUIRULEQ6IxyKTRTNVubx1gneE3zYF+4xqbe9m0D5wBb1PQD1Nz/Ev0qjPiRQHP0EA/j8rpsNZUY57j9lfrUk/HP3XpcDrbUPd4FCLU7YcNepXeOr1uQ8dMOEdUJV6jDd25haf8CwQp5xX9d
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?di82MU1kR1Z3MnExQ1kwdmNOMENGOWtRcCt1STc3cjVNQTgwdVRSYkVRamVP?=
 =?utf-8?B?TXJnZDFiQnEzanBYZHFnVktmdzFEU25XWllseW9aYytvcUpvZGhMSGNINFRF?=
 =?utf-8?B?dWsxcG5ZRWtwV2pDbUJLNy9lUEpZK2d3QVZRdlg1WDk3bVZ5cGF0N1dFTnVE?=
 =?utf-8?B?QytMQXVMYzVZWHozRDhBU0FaOVpkSWNWbWEvQjl1V1h5bVBxWTVua1NkQXBB?=
 =?utf-8?B?SE83N2t1NU1TM2l4L0l1WURYeFhEc3oyRVBKU29NK0tpUEdmbWNkQWw1RTJw?=
 =?utf-8?B?c1hwaU9OTERuNDIwMklKdnhqMkdOWEZSR2tHck1SM1MzQmlYMm5wZXZvL3RQ?=
 =?utf-8?B?clBoQjdyTTZhdHlRYVVpNVFLOEJmS2tLMnpwSDZwWkdCNE10dlVlUXowNjBH?=
 =?utf-8?B?VUFvL1pkRi9PakYrS3ByY3hHZHlCK3IxR0g1K1RxR3NtMTV1R25hOFdrUnhT?=
 =?utf-8?B?QlRxeSsxc0lWc2NCSWhsNlQ0ZjJIUmdlY0I3Zkh3TThSS201ajkrUmtMMXpt?=
 =?utf-8?B?MUtFdXJWc2NnbGd5WmtGUzJGNlRIWmRwajhNZVdvOUlZdHNteHNqb2R1V1Vv?=
 =?utf-8?B?YVJQcFVZOWRySm9RUXgxMHR6c0lFZkVOVXlNUFkrK1B0cmpUYXdyY2J6dUtT?=
 =?utf-8?B?Vk12bmRyMnlpa0ZjQ0NUQmlWdk4xMVNtNXFYQSt3MW14L3hGWm4rc2RBYTFr?=
 =?utf-8?B?TFkxRW8xR3dVMnJBMjlHQS9zTGxKWHgxaklsWmhFM1YyeEcrdlZNTWltMWNq?=
 =?utf-8?B?VHN3ZFA5ajNqaFNiYUlWOEp1STFSNm5HaHNsK1hMeGQxNGt2ZzBwR1M4ajNP?=
 =?utf-8?B?cXQwOUdRcnVNWkIrUUpWeEs0Q0o4OWxTaEpYcVRHdVlQaFk0NjJ6aDN1Q0pl?=
 =?utf-8?B?WUZxN05WckNFcHpaK09EWlUwUGVCWUJEYWZvYW1xZ1F6WXJNOXVnQVhhaGRu?=
 =?utf-8?B?TktOOXJQZFZUVjZsZTNMMHJUUHJZZjJXZVBXSEFpUEVhckEyQUZHVjZLc1ly?=
 =?utf-8?B?RjJiV1N4N0ZvdjVueEtodmN3VEs1WmZvZmh4b3MzUGJHbXdEOSttQkdaTkor?=
 =?utf-8?B?Smp5Q0JYaHFRVGhzNlFKK2xNYWhoYW1seThJcHh3b3NTMXh1cXZUU0x3Zkhs?=
 =?utf-8?B?OThNcStxZEgzejVuNzUrbHAyTm1QUU9NNmhGRk8zNVdOTUNYNUU3QzF1Zi8y?=
 =?utf-8?B?QjVwckFrTnppYVZZRmtsU2oycldOYXAxR1p4OEFCeWFFWmxCcXhpaDhqV2Fu?=
 =?utf-8?B?bk9PSFJRYVp5UDRUNUUxVVNoNVlPZWpIQ2JLZTRYTWZnWFJjQkEva01ERHRn?=
 =?utf-8?B?RTlIV2w2UktWa1NOdGsxMjlRRE1kaDBJbkwvam1lMW5uVU5aYlFVWlJrdTVy?=
 =?utf-8?B?ZXB4dC9YWlN3bGdNcHhnTzhBYW1wUVEra1lCVHlaZjVCMXY0YlVVUS9lbGdq?=
 =?utf-8?B?T3BLWXlJVTZQc0JnK0p4ZmxWVTZzK0E1NWZmZ0d5and0cUJ3d1RzcHRjWjhk?=
 =?utf-8?B?Z3FiUnhRZW82UUhIMVFCbnRTUGI5ZXdnSHAydjhUUS94S0hEOWdnQ2ZJTEVk?=
 =?utf-8?B?bnpIcWwrZEE5VGI0YW55YVVpa3ZoYUJxUTUwOEY2blB0RFdrMmZTTytETlRh?=
 =?utf-8?B?b2cwVVQ5cW5XQ0t5TW4wcUl4aEVTdnROWjVEUTNrNWNRdWRYb0FtaDlValYx?=
 =?utf-8?B?SEdDOUFYVXdNbzg1WUFYUFVQSUtuN0N6a252UjJ3dDBwSHMxbjRpSS8xVzZo?=
 =?utf-8?B?WGdPYjZXM2V3ZXZzTFBzQWUxd3VqK29HVS84WUhHby9ua25PbmM2bmtLUzF6?=
 =?utf-8?B?RTlONWhmWlFrb0JhKzVjS3FwejFUMVEzT1hTRUtIeWxkeS9UOUE2M0NZYUEv?=
 =?utf-8?B?Q0QrQnRPdXBNb0ZiTjNTVkNsbWxIOE1aWEp5a21nSUlHQU1VQlFBYmlHVXZL?=
 =?utf-8?B?azhUMkMrSVdLeFhrUEsrbFJyMTNZQmJpUlFGOVZtRWE3M3J3Ynh1RFVtVHlr?=
 =?utf-8?B?WVpsMFNhdDA4NkRuKzgySmR4c2U0LzhnS3poSVhmMzlDdHBmUXc4cW9iaG1M?=
 =?utf-8?B?QlI3TGNsUG1FWmFLMFJUQmtrQjRwalJPemRHMzBwblJoY1BkSCtMZUJpVElI?=
 =?utf-8?B?aGx0ejFCTmZxQjZwUFprSW5iYWE2OURUYVBNRDdpOHhKcmlLVzR5Q016cXlQ?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11228C0772192D4EB094B0779D0A8052@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56127325-f133-4b8b-5d0c-08dc3457298b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:06:54.3306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvXJ5IJ59Qei4yjP3wNZidE70l0CfVDuTl7qQePvH6sH+EInaLXvCZOzXnkU2kW/YYoMCOnumzJjTbBA2GE5cjVwy5vqNSEJX+ivUpARoT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3130
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjQgw6AgMDM6NTUsIENoYXJsaWUgSmVua2lucyBhIMOpY3JpdMKgOg0K
PiBUaGUgdGVzdCBjYXNlcyBmb3IgaXBfZmFzdF9jc3VtIGFuZCBjc3VtX2lwdjZfbWFnaWMgd2Vy
ZSBmYWlsaW5nIG9uIGENCj4gdmFyaWV0eSBvZiBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlIGJpZyBl
bmRpYW4gb3IgZG8gbm90IHN1cHBvcnQNCj4gbWlzYWxnaW5lZCBhY2Nlc3Nlcy4gQm90aCBvZiB0
aGVzZSB0ZXN0IGNhc2VzIGFyZSBjaGFuZ2VkIHRvIHN1cHBvcnQgYmlnDQo+IGFuZCBsaXR0bGUg
ZW5kaWFuIGFyY2hpdGVjdHVyZXMuDQoNCkl0IGlzIHVuY2xlYXIuIFRoZSBlbmRpYW5lc3MgaXNz
dWUgYW5kIHRoZSBhbGlnbm1lbnQgaXNzdWUgYXJlIHR3byANCmluZGVwZW5kYW50IHN1YmplY3Rz
IHRoYXQgc2hvdWxkIGJlIGhhbmRsZWQgaW4gc2VwYXJhdGUgcGF0Y2hlcy4NCg0KQWNjb3JkaW5n
IHRvIHRoZSBzdWJqZWN0IG9mIHRoaXMgcGF0Y2gsIG9ubHkgbWlzYWxpZ25lZCBhY2Nlc3NlcyBz
aG91bGQgDQpiZSBoYW5kbGVkIGhlcmUuIEVuZGlhbm5lc3Mgc2hvdWxkIGhhdmUgYmVlbiBmaXhl
ZCBieSBwYXRjaCAxLg0KDQpBbHNvLCB3b3VsZCBiZSBuaWNlIHRvIGdpdmUgZXhlbXBsZSBvZiBh
cmNoaXRlY3R1cmUgdGhhdCBoYXMgc3VjaCANCnByb2JsZW0sIGFuZCBleHBsYWluIHdoYXQgaXMg
dGhlIHByb2JsZW0gZXhhY3RseS4NCg0KPiANCj4gVGhlIHRlc3QgZm9yIGlwX2Zhc3RfY3N1bSBp
cyBjaGFuZ2VkIHRvIGFsaWduIHRoZSBkYXRhIGFsb25nICgxNCArDQo+IE5FVF9JUF9BTElHTikg
Ynl0ZXMgd2hpY2ggaXMgdGhlIGFsaWdubWVudCBvZiBhbiBJUCBoZWFkZXIuIFRoZSB0ZXN0IGZv
cg0KPiBjc3VtX2lwdjZfbWFnaWMgYWxpZ25zIHRoZSBkYXRhIHVzaW5nIGEgc3RydWN0LiBBbiBl
eHRyYSBwYWRkaW5nIGZpZWxkDQo+IGlzIGFkZGVkIHRvIHRoZSBzdHJ1Y3QgdG8gZW5zdXJlIHRo
YXQgdGhlIHNpemUgb2YgdGhlIHN0cnVjdCBpcyB0aGUgc2FtZQ0KPiBvbiBhbGwgYXJjaGl0ZWN0
dXJlcyAoNDQgYnl0ZXMpLg0KDQpXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoYXQgcGFkZGluZyA/
IFlvdSB0YWtlIGZpZWxkcyBvbmUgYnkgb25lIGFuZCANCm5ldmVyIGRvIGFueXRoaW5nIHdpdGgg
dGhlIGZ1bGwgc3RydWN0Lg0KDQo+IA0KPiBGaXhlczogNmY0YzQ1Y2JjYjAwICgia3VuaXQ6IEFk
ZCB0ZXN0cyBmb3IgY3N1bV9pcHY2X21hZ2ljIGFuZCBpcF9mYXN0X2NzdW0iKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPg0KPiBSZXZpZXdl
ZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiBUZXN0ZWQtYnk6IEd1
ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCj4gLS0tDQo+ICAgbGliL2NoZWNrc3Vt
X2t1bml0LmMgfCAzOTMgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzNCBpbnNlcnRpb25zKCspLCAyNTkgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2NoZWNrc3VtX2t1bml0LmMgYi9saWIv
Y2hlY2tzdW1fa3VuaXQuYw0KPiBpbmRleCA3NzZhZDNkNmQ1YTEuLmYxYjE4ZTM2MjhkZCAxMDA2
NDQNCj4gLS0tIGEvbGliL2NoZWNrc3VtX2t1bml0LmMNCj4gKysrIGIvbGliL2NoZWNrc3VtX2t1
bml0LmMNCj4gQEAgLTEzLDggKzEzLDkgQEANCj4gICANCj4gICAjZGVmaW5lIElQdjRfTUlOX1dP
UkRTIDUNCj4gICAjZGVmaW5lIElQdjRfTUFYX1dPUkRTIDE1DQo+IC0jZGVmaW5lIE5VTV9JUHY2
X1RFU1RTIDIwMA0KPiAtI2RlZmluZSBOVU1fSVBfRkFTVF9DU1VNX1RFU1RTIDE4MQ0KPiArI2Rl
ZmluZSBXT1JEX0FMSUdOTUVOVCA0DQoNCklzIHRoYXQgbWFjcm8gcmVhbGx5IG5lZWRlZCA/IENh
bid0IHlvdSBqdXN0IHVzZSBzaXplb2YodTMyKSBvciANCnNvbWV0aGluZyBzaW1pbGFyID8NCg0K
DQo+ICsvKiBFdGhlcm5ldCBoZWFkZXJzIGFyZSAxNCBieXRlcyBhbmQgTkVUX0lQX0FMSUdOIGlz
IHVzZWQgdG8gYWxpZ24gdGhlbSAqLw0KPiArI2RlZmluZSBJUF9BTElHTk1FTlQgKDE0ICsgTkVU
X0lQX0FMSUdOKQ0KDQpPbmx5IGlmIG5vIFZMQU4uDQoNCldoZW4gdXNpbmcgVkxBTnMgaXQgaXMg
NCBieXRlcyBtb3JlLiBCdXQgd2h5IGRvIHlvdSBtaW5kIHRoYXQgYXQgYWxsID8NCg0KPiAgIA0K
PiAgIC8qIFZhbHVlcyBmb3IgYSBsaXR0bGUgZW5kaWFuIENQVS4gQnl0ZSBzd2FwIGVhY2ggaGFs
ZiBvbiBiaWcgZW5kaWFuIENQVS4gKi8NCj4gICBzdGF0aWMgY29uc3QgdTMyIHJhbmRvbV9pbml0
X3N1bSA9IDB4Mjg0N2FhYjsNCg0KLi4uDQoNCj4gQEAgLTU3OCwxNSArNDUxLDE5IEBAIHN0YXRp
YyB2b2lkIHRlc3RfY3N1bV9ub19jYXJyeV9pbnB1dHMoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiAg
IHN0YXRpYyB2b2lkIHRlc3RfaXBfZmFzdF9jc3VtKHN0cnVjdCBrdW5pdCAqdGVzdCkNCj4gICB7
DQo+ICAgCV9fc3VtMTYgY3N1bV9yZXN1bHQsIGV4cGVjdGVkOw0KPiAtDQo+IC0JZm9yIChpbnQg
bGVuID0gSVB2NF9NSU5fV09SRFM7IGxlbiA8IElQdjRfTUFYX1dPUkRTOyBsZW4rKykgew0KPiAt
CQlmb3IgKGludCBpbmRleCA9IDA7IGluZGV4IDwgTlVNX0lQX0ZBU1RfQ1NVTV9URVNUUzsgaW5k
ZXgrKykgew0KPiAtCQkJY3N1bV9yZXN1bHQgPSBpcF9mYXN0X2NzdW0ocmFuZG9tX2J1ZiArIGlu
ZGV4LCBsZW4pOw0KPiAtCQkJZXhwZWN0ZWQgPSAoX19mb3JjZSBfX3N1bTE2KQ0KPiAtCQkJCWV4
cGVjdGVkX2Zhc3RfY3N1bVsobGVuIC0gSVB2NF9NSU5fV09SRFMpICoNCj4gLQkJCQkJCSAgIE5V
TV9JUF9GQVNUX0NTVU1fVEVTVFMgKw0KPiAtCQkJCQkJICAgaW5kZXhdOw0KPiAtCQkJQ0hFQ0tf
RVEoZXhwZWN0ZWQsIGNzdW1fcmVzdWx0KTsNCj4gKwlpbnQgbnVtX3Rlc3RzID0gKE1BWF9MRU4g
LyBXT1JEX0FMSUdOTUVOVCAtIElQdjRfTUFYX1dPUkRTICogV09SRF9BTElHTk1FTlQpOw0KPiAr
DQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBudW1fdGVzdHM7IGkrKykgew0KPiArCQltZW1jcHko
JnRtcF9idWZbSVBfQUxJR05NRU5UXSwNCj4gKwkJICAgICAgIHJhbmRvbV9idWYgKyAoaSAqIFdP
UkRfQUxJR05NRU5UKSwNCj4gKwkJICAgICAgIElQdjRfTUFYX1dPUkRTICogV09SRF9BTElHTk1F
TlQpOw0KDQpUaGF0IGxvb2tzIHdlaXJkLg0KDQo+ICsNCj4gKwkJZm9yIChpbnQgbGVuID0gSVB2
NF9NSU5fV09SRFM7IGxlbiA8PSBJUHY0X01BWF9XT1JEUzsgbGVuKyspIHsNCj4gKwkJCWludCBp
bmRleCA9IChsZW4gLSBJUHY0X01JTl9XT1JEUykgKw0KPiArCQkJCSBpICogKChJUHY0X01BWF9X
T1JEUyAtIElQdjRfTUlOX1dPUkRTKSArIDEpOw0KDQpNaXNzaW5nIGJsYW5rIGxpbmUgYWZ0ZXIg
ZGVjbGFyYXRpb24uDQoNCj4gKwkJCWNzdW1fcmVzdWx0ID0gaXBfZmFzdF9jc3VtKHRtcF9idWYg
KyBJUF9BTElHTk1FTlQsIGxlbik7DQo+ICsJCQlleHBlY3RlZCA9IChfX2ZvcmNlIF9fc3VtMTYp
aHRvbnMoZXhwZWN0ZWRfZmFzdF9jc3VtW2luZGV4XSk7DQoNCllvdSBtdXN0IGRvIHByb3BlciB0
eXBlIGNvbnZlcnNpb24gdXNpbmcgdG9fc3VtMTYoKSwgbm90IGEgZm9yY2VkIGNhc3QuDQoNCj4g
KwkJCUNIRUNLX0VRKGNzdW1fcmVzdWx0LCBleHBlY3RlZCk7DQo+ICAgCQl9DQo+ICAgCX0NCj4g
ICB9DQo+IEBAIC01OTQsMjkgKzQ3MSwyNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2lwX2Zhc3RfY3N1
bShzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+ICAgc3RhdGljIHZvaWQgdGVzdF9jc3VtX2lwdjZfbWFn
aWMoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiAgIHsNCj4gICAjaWYgZGVmaW5lZChDT05GSUdfTkVU
KQ0KPiAtCWNvbnN0IHN0cnVjdCBpbjZfYWRkciAqc2FkZHI7DQo+IC0JY29uc3Qgc3RydWN0IGlu
Nl9hZGRyICpkYWRkcjsNCj4gLQl1bnNpZ25lZCBpbnQgbGVuOw0KPiAtCXVuc2lnbmVkIGNoYXIg
cHJvdG87DQo+IC0JdW5zaWduZWQgaW50IGNzdW07DQo+IC0NCj4gLQljb25zdCBpbnQgZGFkZHJf
b2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdCBpbjZfYWRkcik7DQo+IC0JY29uc3QgaW50IGxlbl9vZmZz
ZXQgPSBzaXplb2Yoc3RydWN0IGluNl9hZGRyKSArIHNpemVvZihzdHJ1Y3QgaW42X2FkZHIpOw0K
PiAtCWNvbnN0IGludCBwcm90b19vZmZzZXQgPSBzaXplb2Yoc3RydWN0IGluNl9hZGRyKSArIHNp
emVvZihzdHJ1Y3QgaW42X2FkZHIpICsNCj4gLQkJCSAgICAgc2l6ZW9mKGludCk7DQo+IC0JY29u
c3QgaW50IGNzdW1fb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdCBpbjZfYWRkcikgKyBzaXplb2Yoc3Ry
dWN0IGluNl9hZGRyKSArDQo+IC0JCQkgICAgc2l6ZW9mKGludCkgKyBzaXplb2YoY2hhcik7DQo+
IC0NCj4gLQlmb3IgKGludCBpID0gMDsgaSA8IE5VTV9JUHY2X1RFU1RTOyBpKyspIHsNCj4gLQkJ
c2FkZHIgPSAoY29uc3Qgc3RydWN0IGluNl9hZGRyICopKHJhbmRvbV9idWYgKyBpKTsNCj4gLQkJ
ZGFkZHIgPSAoY29uc3Qgc3RydWN0IGluNl9hZGRyICopKHJhbmRvbV9idWYgKyBpICsNCj4gLQkJ
CQkJCSAgZGFkZHJfb2Zmc2V0KTsNCj4gLQkJbGVuID0gKih1bnNpZ25lZCBpbnQgKikocmFuZG9t
X2J1ZiArIGkgKyBsZW5fb2Zmc2V0KTsNCj4gLQkJcHJvdG8gPSAqKHJhbmRvbV9idWYgKyBpICsg
cHJvdG9fb2Zmc2V0KTsNCj4gLQkJY3N1bSA9ICoodW5zaWduZWQgaW50ICopKHJhbmRvbV9idWYg
KyBpICsgY3N1bV9vZmZzZXQpOw0KPiAtCQlDSEVDS19FUSgoX19mb3JjZSBfX3N1bTE2KWV4cGVj
dGVkX2NzdW1faXB2Nl9tYWdpY1tpXSwNCj4gLQkJCSBjc3VtX2lwdjZfbWFnaWMoc2FkZHIsIGRh
ZGRyLCBsZW4sIHByb3RvLA0KPiAtCQkJCQkgKF9fZm9yY2UgX193c3VtKWNzdW0pKTsNCj4gKwlz
dHJ1Y3QgY3N1bV9pcHY2X21hZ2ljX2RhdGEgew0KPiArCQljb25zdCBzdHJ1Y3QgaW42X2FkZHIg
c2FkZHI7DQo+ICsJCWNvbnN0IHN0cnVjdCBpbjZfYWRkciBkYWRkcjsNCj4gKwkJX19iZTMyIGxl
bjsNCj4gKwkJX193c3VtIGNzdW07DQo+ICsJCXVuc2lnbmVkIGNoYXIgcHJvdG87DQo+ICsJCXVu
c2lnbmVkIGNoYXIgcGFkWzNdOw0KPiArCX0gKmRhdGE7DQo+ICsJX19zdW0xNiBjc3VtX3Jlc3Vs
dCwgZXhwZWN0ZWQ7DQo+ICsJaW50IGlwdjZfbnVtX3Rlc3RzID0gKChNQVhfTEVOIC0gc2l6ZW9m
KHN0cnVjdCBjc3VtX2lwdjZfbWFnaWNfZGF0YSkpIC8gV09SRF9BTElHTk1FTlQpOw0KPiArDQo+
ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBpcHY2X251bV90ZXN0czsgaSsrKSB7DQo+ICsJCWludCBp
bmRleCA9IGkgKiBXT1JEX0FMSUdOTUVOVDsNCj4gKw0KPiArCQlkYXRhID0gKHN0cnVjdCBjc3Vt
X2lwdjZfbWFnaWNfZGF0YSAqKShyYW5kb21fYnVmICsgaW5kZXgpOw0KPiArDQo+ICsJCWNzdW1f
cmVzdWx0ID0gY3N1bV9pcHY2X21hZ2ljKCZkYXRhLT5zYWRkciwgJmRhdGEtPmRhZGRyLA0KPiAr
CQkJCQkgICAgICBudG9obChkYXRhLT5sZW4pLCBkYXRhLT5wcm90bywNCj4gKwkJCQkJICAgICAg
ZGF0YS0+Y3N1bSk7DQo+ICsJCWV4cGVjdGVkID0gKF9fZm9yY2UgX19zdW0xNilodG9ucyhleHBl
Y3RlZF9jc3VtX2lwdjZfbWFnaWNbaV0pOw0KDQpTYW1lLCB1c2UgdG9fc3VtMTYoKSBpbnN0ZWFk
IGh0b25zKCkgYW5kIGEgZm9yY2VkIGNhc3QuDQoNCj4gKwkJQ0hFQ0tfRVEoY3N1bV9yZXN1bHQs
IGV4cGVjdGVkKTsNCj4gICAJfQ0KPiAgICNlbmRpZiAvKiAhQ09ORklHX05FVCAqLw0KPiAgIH0N
Cj4gDQoNCg0KQ2hyaXN0b3BoZQ0K
