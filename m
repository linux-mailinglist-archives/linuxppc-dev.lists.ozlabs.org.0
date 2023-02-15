Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0269773C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 08:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGqBk0VB2z3chl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 18:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zInKGqX2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe16::60b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zInKGqX2;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGq9j28Rwz3bfs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 18:15:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKjGQs9lNi4OlHZRKuDNfwEmaLN89IWOkqyTCVXsME7J0eS22mkJTHhFEwBPCKJuPBFTwx7Z1S1PjdWYhRKCWq+J7VU/PhsX0jfC8YGSHlo28Gh2EDltzc7gAnLLy4yQV6lJahdqPCGMAbEdXHrBsI3/kathIDP2giTrUn9TOIMbx9brrmGx3uKLLhndO/QkDHjrBe/rqIXv7DqE4Z9+8OUCRNjGl6bl36ASVhkyft9PTX8JUJoZscHM8OpI4tuVApoFpc/JAZ8yvn9yNjKNT70jDmdlsz3NgULPnTRXq1lx4wmMqNZxiff6m9lb6EqG4b8LmgjNFd+bY65p96J+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUMJCRgQiB/Dos1OSjbu0NS5iz8GZwXavEn/eRwIKC8=;
 b=oNNxKd5vh+E1s0nVezN+zQb3oLb5OFHvssAq4fcR7EqBuNVkbn329NGXLK8eEAQg6mhVor3jQWKXiHVEAk3uvyTLpvZQcPfZUNat/7Dvi8PNBPXlTrixpOAQIv0JugjomVzQ66D+fo2E9DDhjW0neVChnh7dQjCvu++QGHB97TYtiiXw2l/fbAJx/i6kP7pLk//9b7zATuhYYN4ZDbC/iIct0aNJSBRLoF1f3nlmVXM2xn7tfyw4CmbWsZbrBwn4yTDgS6P0AnGQYo8uBzj9Y2kAZJDFEWbN2gCM9vii6qEQYlyg4xNR6qEJ4VH9HqH7WIU3jMX5dAgM5S91J6xs0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUMJCRgQiB/Dos1OSjbu0NS5iz8GZwXavEn/eRwIKC8=;
 b=zInKGqX2JIjQPWwJcND+/2Fvj54aEQvNrOlmUcwR1Nse01gF/TGAVIurS19MppMQVrc3/un+ZXf4y8GhPEsxfIvZyqrrBsun67BmqT2UUwi+3UadsRmJVdV514FCQL7fRJXY8AaKyK8fNZDPzqd4ES5Ywx4D4QicFAAC9LGu9eZrDWcECd7zbvnFZ5+Ly/xP4sgsfp8N/9QKi7rdJsHUZFt6wq7qZukb90dQKxaCNmZK9Fl7aIBPLm0YGcde/PCsrckUjsJxRHRqa7pvoNzNCjKTzfNEAkXFS5QwhV7nNfpE6/AEwW5ZOeEK8EvJkUpHaCJM5wYqCCMDfX/gap3Hyg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2467.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 07:15:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 07:15:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v7 1/7] powerpc: mm: Separate set_pte, set_pte_at for
 internal, external use
Thread-Topic: [PATCH v7 1/7] powerpc: mm: Separate set_pte, set_pte_at for
 internal, external use
Thread-Index: AQHZQOHN4cRd06zHYEqYmFKBoUf4Uq7PmM2A
Date: Wed, 15 Feb 2023 07:15:29 +0000
Message-ID: <028e450a-1588-dc04-d455-57fcc0d854b0@csgroup.eu>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
 <20230215020155.1969194-2-rmclure@linux.ibm.com>
In-Reply-To: <20230215020155.1969194-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2467:EE_
x-ms-office365-filtering-correlation-id: cfe955a9-d26f-4345-4414-08db0f246b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  stM758LGyD/1zdvycp5/rPyZs6/+nYCNGMyNSIcLw2cz19nGEpsTFebzd8cebXmFHGwJ3vMwUXNvu5HW5TWMWMNQocVZntBAndiPocTA2xf/B+i4GmIqKsb/Yklw7Hn05WDKeq5i/fTnD4WpEkCMwYbDTRYUo5f/gBlk2wFfHsFMjVlmZx5irMOOUvXru8mMP1cAsmNmBS/6IUTpFllTRLReMbzhKZYEN3Y/ng3ovxWXdpFIy/2FL9tNBrtD8Y3/K5A1l6e9FfVwLtNI0KHhKSdLG4xT7TM8EBfyYGwec8UHv30xE58a9LiJO50sK/JvhTn8TuKHKD9pCOELHpgYo6EjjQOsFeiPd1MtATJjBIKICnrrfr5a8Tt43zwuJE3ANWdIh6/wdhJvC50AyDsZKHTeXebhnsob8HkWaXRDYCpnhKaY6r6O69WeNGT/AVuWjUXz2KhHa0BJb8VxMrXtXz03g8znWwFyIyEknV/1NaGpK7kShUBPkO8IPLzcyAhsQQSoJHEjXCjWbRzj8Fc+jmBwWAMF46fmYK20UwxgsVgTCNmngrXpcHEz7alxAKMaPJkYLsQ7F6KgD9jkgxKAG2AXqlK3TlcYSAsO3HuekqDD4o7yTYQ+CVDVSySJkUyKyQmY5d065W0DBE1rh6rdxdYxQHo9r6ZhHDGMrj2z+wHvwtkZI9FoaFQ27kCMe6sqvuA9ZZhiARNAsBvOlO/I5PrNO5VDXrRGNTlYAN324IkAeaReqUSOr8DjyeIXricT0iMmXXpSWvFH2fDciMDUqw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199018)(41300700001)(26005)(6512007)(186003)(6506007)(38070700005)(31686004)(76116006)(91956017)(66946007)(5660300002)(316002)(110136005)(36756003)(66556008)(66446008)(66476007)(64756008)(44832011)(8936002)(66574015)(83380400001)(4326008)(8676002)(2906002)(71200400001)(6486002)(86362001)(478600001)(31696002)(122000001)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MldDRG0rZXRmb0QxeDE3OWNaK2ZPYldZTER0WDJWc3VnTm9oMWRMQmlERXBr?=
 =?utf-8?B?NTlBdDlBRFAxSHhwS0d0YUVpd0FpY3BaNjUwRFNJRlBiZVdSTWE1c0FTdU8w?=
 =?utf-8?B?dXdZa29ZR0dCR010aUdxMUpxQkFLLzdEWXZnU2MxbisrVGJzRkxNSS8rU0RS?=
 =?utf-8?B?MFNHUXZJWGZVZGJXUzRWeHluVTgzNDh2dWZhVTkzcVpWSmh1azNZWTdQRGps?=
 =?utf-8?B?Unp2N3ZKd0hqV3Bob01EQU45RkRhdXVYMTRFMk5Na1lYZWJicmFUNjk2VlZG?=
 =?utf-8?B?bm5YbUliYkk1MnBldGJwR1FCYWdoYXpJRHk0Qlg5K01JMXViMVlqM1NkV0k5?=
 =?utf-8?B?VmdWYWg2RTRHWkNVam1nYngwM3lwbmxib0lTY01ML3hSdG8xRGtGMW1lQ2lw?=
 =?utf-8?B?bmhxc1hvMjFiLy9YT3Zod01xcVJEcm5OTUYvVXpTbFM2OG1vM0F1UzRNQWlR?=
 =?utf-8?B?eWdwQWZRMkl4SkpEd05Rb2dUdERZblZiM24vRjM4cGhOZ2hpalRPaTBxbml3?=
 =?utf-8?B?aU4ySCtGK0pmTFhUOHBxYllyNTVzMWNyTkpkRkxXaWJKTjJqa1EzNTV5REhT?=
 =?utf-8?B?VEcyaTNaeVRPazRHVnJSTHdKNGpUUlBrcDBKNjUxSzY1V1RCOGp2Q0VwMEYr?=
 =?utf-8?B?S25CcnFHNnVtMCtrTnVIRXlBYU5BeWw5MlRtUHdEQTRtMFlscFh1NGFHdHUx?=
 =?utf-8?B?N1A5ZzBUVHBhZ3lsTS9FSGE2WitFcUc2S1RWNFZ0Mmx2RC85bm91aStWSU9t?=
 =?utf-8?B?aVdyMjA5Nit0aDZTYWttSHpuWEhVU3QrNXZFSVZtTmIvQU9rWHNSZUEyUitI?=
 =?utf-8?B?eGl1SDhOdzNNZ0FuWk9LR2MvMWRJZ0cvZjBwNTBrS1pZTHJ2RVRiS0ovSCsr?=
 =?utf-8?B?bkU2dHVrK0ZRaElxUGNtREVsSVQ3QkRaNEJyUGc5ZzRrNTNDbE05NzVrNEh3?=
 =?utf-8?B?OGJ6c0JnUWlKNmdiS3pzaDJub3dxeHFzdXFpbXQ5dytPT3B5OHprNURYa1hp?=
 =?utf-8?B?SnJIcUlnN1NsTDdpQUZxSDFaQ3hpbjVGN2FWMDVKK1V0YTNBUlVaMStLN0RR?=
 =?utf-8?B?OU10Vit0ei9tNWtiRUhOTUNWckZVSUk0cnZNb3M5cDJQU0dIVk85aERabnIx?=
 =?utf-8?B?UW1XZS81b1V6NHV2RTFYa2UwejAvMlEyZFZBb2F3WFFpWHhnNi9zNU1FbktN?=
 =?utf-8?B?SFVGUUdNWC9xRnVqRk55K1lKMlNzVFVpMDZGU0pzLzJkKzhZM0FSSmVodVBN?=
 =?utf-8?B?MHFCSVlRMUFDREp3WC9BN0R1ZmliY0swMitZSmxabXovbEhBY1hIMUsraFN6?=
 =?utf-8?B?M2lISFlCakpRUkVVV2RRaHB0N3ZTT1pBUldndHRCb2xKR21Pek5NeThJZW9t?=
 =?utf-8?B?MjZTbnRZS2xQOUZZeXVUSHQ2SXAyTFBWR0R1eU4yaFdRaTFoNnBYL0ZpQXdi?=
 =?utf-8?B?R2NldEI1SnVDQVh1MGM4cTlUMWxCOUZKZHlnU3QyZnpFNGFqbU56cHpwZGZn?=
 =?utf-8?B?b2dueWJDaDM3QkFCZVJMTFlIZG1UMFpNQWtlTmRMKzYvYlVDZU80YUpyY20z?=
 =?utf-8?B?eWZKU1ptRDB3V1NMY3FVbkRIRWowWlBTQmRkS2M4MXh6ZTY0ZU42RUM1RFA3?=
 =?utf-8?B?SzJiMktYa0NENU1JOFFWY2tHOVZta0RNVzA5U3BXYU44aG9DQ1ZJamtVTlYz?=
 =?utf-8?B?UzdpUjJ3dkRieDlNb2tWTmZkV1NTN0VTbXFpT0tjcFB1QkJEUVJXckQ0dERH?=
 =?utf-8?B?MmorMSt0Ujh0Rkp0ODk4TWtDYTBlMGYwdkNsanBCRkl6Titod2hpWU5qcDNY?=
 =?utf-8?B?ajNnM1c2cU8vRWxGTXNvV0hIdlIreFM4VDRGaVlPeUYwcHNmVHlzaHdhd0Ey?=
 =?utf-8?B?bDlRdFBTVUV0QzlTRmN3QmNvK2RyZkpiNG5sWlROTHh0RzZnbTEvS2xrZDhp?=
 =?utf-8?B?aW9JUmQ1bUxBV1RNNytVZE9uN3BTYVQ0ODZYMTZzVGhqZTFsak9FY0FZOEZW?=
 =?utf-8?B?eVpZZXZuZDkvMUtnMzdKZDM2VGRHVUFsNkdZbVFhVkxGeGd1M1ZnNmpYcDlF?=
 =?utf-8?B?ZGdYemM2b1hiQmlkRXNoR2dCRVhvM3Z4NElKZmNDZWt5ZjhTaXJDREMwY25T?=
 =?utf-8?B?bXBhY24wTnN0aVdQczludkNFeWV4R2JKT2dNZ2ZnV0o2MlJGLy84cmdJb2xQ?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9E8B6620D1C71418240CA6E596A636A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe955a9-d26f-4345-4414-08db0f246b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 07:15:29.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WN3J2iAt2al0IFaD8Cd8WBoXLZYJXSJsFXiBtCr9/D8OI6J6ire0DoYfzTWrxzKYYF6FRp7f/wA2EVurhTuNzDSfryX6vs2N1p0oyNCSPn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2467
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAyLzIwMjMgw6AgMDM6MDEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
cm9kdWNlIHNlcGFyYXRlIHN5bWJvbHMgZm9yIHNldF9wdGUsIHdoaWNoIGlzIHRvIGJlIHVzZWQg
aW4NCj4gYXJjaC9wb3dlcnBjIGZvciByZWFzc2lnbm1lbnQgb2YgcHRlJ3MsIGFuZCBzZXRfcHRl
X2F0LCB1c2VkIGluIGdlbmVyaWMNCj4gY29kZS4NCj4gDQo+IFRoZSByZWFzb24gZm9yIHRoaXMg
ZGlzdGluY3Rpb24gaXMgdG8gc3VwcG9ydCB0aGUgUGFnZSBUYWJsZSBDaGVjaw0KPiBzYW5pdGlz
ZXIuIEhhdmluZyB0aGlzIGRpc3RpbmN0aW9uIGFsbG93cyBmb3Igc2V0X3B0ZV9hdCB0bw0KPiBp
bnN0cnVtZW50ZWQsIGJ1dCBzZXRfcHRlIG5vdCB0byBiZSwgcGVybWl0dGluZyBmb3IgdW5pbnN0
cnVtZW50ZWQNCj4gaW50ZXJuYWwgbWFwcGluZ3MuIFRoaXMgZGlzdGluY3Rpb24gaW4gbmFtZXMg
aXMgYWxzbyBwcmVzZW50IGluIHg4Ni4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVy
ZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiB2NjogbmV3IHBhdGNo
DQo+IHY3OiBSZW1vdmUgZXh0ZXJuLCBtb3ZlIHNldF9wdGUgYXJncyB0byBiZSBpbiBhIHNpbmds
ZSBsaW5lLg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzL3BndGFi
bGUuaCB8IDMgKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxl
LmggfCAzICstLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAg
IHwgMSArDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAgICAgfCAz
ICstLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvcGd0
YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy9wZ3RhYmxlLmgNCj4gaW5k
ZXggZDE4Yjc0OGVhM2FlLi4xMzg2ZWQ3MDVlNjYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvcGd0YWJsZS5oDQo+IEBAIC0xMiw4ICsxMiw3IEBADQo+ICAgLyogSW5z
ZXJ0IGEgUFRFLCB0b3AtbGV2ZWwgZnVuY3Rpb24gaXMgb3V0IG9mIGxpbmUuIEl0IHVzZXMgYW4g
aW5saW5lDQo+ICAgICogbG93IGxldmVsIGZ1bmN0aW9uIGluIHRoZSByZXNwZWN0aXZlIHBndGFi
bGUtKiBmaWxlcw0KPiAgICAqLw0KPiAtZXh0ZXJuIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gLQkJICAgICAg
IHB0ZV90IHB0ZSk7DQo+ICt2b2lkIHNldF9wdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2ln
bmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSk7DQo+ICAgDQo+ICAgDQo+ICAg
I2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQX1NFVF9BQ0NFU1NfRkxBR1MNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmgNCj4gaW5kZXggNjljM2EwNTBhM2Q4Li5mMzZk
ZDJlMmQ1OTEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gv
cGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJs
ZS5oDQo+IEBAIC0xNTQsOCArMTU0LDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5
KHB0ZV90IHB0ZSwgcGdwcm90X3QgbmV3cHJvdCkNCj4gICAvKiBJbnNlcnQgYSBQVEUsIHRvcC1s
ZXZlbCBmdW5jdGlvbiBpcyBvdXQgb2YgbGluZS4gSXQgdXNlcyBhbiBpbmxpbmUNCj4gICAgKiBs
b3cgbGV2ZWwgZnVuY3Rpb24gaW4gdGhlIHJlc3BlY3RpdmUgcGd0YWJsZS0qIGZpbGVzDQo+ICAg
ICovDQo+IC1leHRlcm4gdm9pZCBzZXRfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNp
Z25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLA0KPiAtCQkgICAgICAgcHRlX3QgcHRlKTsNCj4g
K3ZvaWQgc2V0X3B0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBw
dGVfdCAqcHRlcCwgcHRlX3QgcHRlKTsNCj4gICANCj4gICAvKiBUaGlzIGxvdyBsZXZlbCBmdW5j
dGlvbiBwZXJmb3JtcyB0aGUgYWN0dWFsIFBURSBpbnNlcnRpb24NCj4gICAgKiBTZXR0aW5nIHRo
ZSBQVEUgZGVwZW5kcyBvbiB0aGUgTU1VIHR5cGUgYW5kIG90aGVyIGZhY3RvcnMuIEl0J3MNCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDk5NzI2MjZkZGFmNi4uMTdkMzAz
NTlkMWY0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTQ4LDYg
KzQ4LDcgQEAgc3RydWN0IG1tX3N0cnVjdDsNCj4gICAvKiBLZWVwIHRoZXNlIGFzIGEgbWFjcm9z
IHRvIGF2b2lkIGluY2x1ZGUgZGVwZW5kZW5jeSBtZXNzICovDQo+ICAgI2RlZmluZSBwdGVfcGFn
ZSh4KQkJcGZuX3RvX3BhZ2UocHRlX3Bmbih4KSkNCj4gICAjZGVmaW5lIG1rX3B0ZShwYWdlLCBw
Z3Byb3QpCXBmbl9wdGUocGFnZV90b19wZm4ocGFnZSksIChwZ3Byb3QpKQ0KPiArI2RlZmluZSBz
ZXRfcHRlX2F0ICAJCXNldF9wdGUNCj4gICAvKg0KPiAgICAqIFNlbGVjdCBhbGwgYml0cyBleGNl
cHQgdGhlIHBmbg0KPiAgICAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BndGFi
bGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggY2IyZGNkYjE4ZjhlLi5k
N2NjZTMxN2NlZjggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiBAQCAtMTg3LDggKzE4Nyw3IEBAIHN0
YXRpYyBwdGVfdCBzZXRfYWNjZXNzX2ZsYWdzX2ZpbHRlcihwdGVfdCBwdGUsIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLA0KPiAgIC8qDQo+ICAgICogc2V0X3B0ZSBzdG9yZXMgYSBsaW51eCBQ
VEUgaW50byB0aGUgbGludXggcGFnZSB0YWJsZS4NCj4gICAgKi8NCj4gLXZvaWQgc2V0X3B0ZV9h
dChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwN
Cj4gLQkJcHRlX3QgcHRlKQ0KPiArdm9pZCBzZXRfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1
bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpDQo+ICAgew0KPiAgIAkv
Kg0KPiAgIAkgKiBNYWtlIHN1cmUgaGFyZHdhcmUgdmFsaWQgYml0IGlzIG5vdCBzZXQuIFdlIGRv
bid0IGRvDQo=
