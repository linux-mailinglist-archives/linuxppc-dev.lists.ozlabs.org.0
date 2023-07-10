Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C124A74DC18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:18:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Jf9x09DJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09gy4j1Sz3bw3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Jf9x09DJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09g05jV3z3bpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:17:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQeGjyQ/bNinUY6kIKBDduJVEZhqGuyURpomxPG8DuyEXVqRzqK+2YiHKMRVaaBdovzdmaSVL43vRO5mGQCM5vgZLtw17Tw5F4HK4R1EbjNZf6PfRzu0ph77gGXzf3C4wzkH23wTxpHFNUZbsDWdF0J5BYVJzf6T8HxLdLDFj27Jx6Syyr8J79kzTGYV7uUgH6G2J+wTkmMs4OtLWxBqocaNo9GwChDzk7sj908yU4Wxaw1C0oL8gLS2u+tc7GfeFfAkSiR1ZoQoBQDhPqJWWKAFcyPcUuStb+5rMZXXzkSsCPWyA7fznDCBJmv1AqHDEyOUM3RKHFMev+XUCH69fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWRtqvIsUEf9j6CAtr/iIiaXYdKtnaxQ4wJhjnfzNaQ=;
 b=gImRB2eN5fhVLAXDt4qSm/N+h/3n2a/o1VHfnGLfgyWd6hUllvuBg97iT9J5JMd5G8Hu6ytU7bbU/sHuzDwNlA/x8z9iFEMlxOJ8G7DM0UphgoLcmWslMNpWZ/pTOI3c5AxcK7oTvppxRuDvru9K99KThmH4zcOteEf3/6wMEotPsu9v+SRsf+lzWQNjit3jwLkZ97Eq0ty4B5b4/GN+lTt8MmwLpZo2a7wllPij0Q7FP4R2kcZP53GYVvidvCFHSTqXUEElo3s0YmaCZcVj/dXjmWBtWYuo5SUcbjFECEiMMYJsmnLnvoR/SYhGlBVp++UI84YVJlb7CmzlduQy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWRtqvIsUEf9j6CAtr/iIiaXYdKtnaxQ4wJhjnfzNaQ=;
 b=Jf9x09DJ5M1Nk8WX6lzGBD+Dzh7uzgK9Isj5eru1SFVBpYSmMKvikfrm2PNejbzYpZNqZNgvJc9OfKUM/klS21NZWTmHsJx9aD4AMOIQJ1SdgHtohD16O4q5pPkKhs5VoEnzjhJsLEZtT5QKK3wv3pwYNVTSr4dVDoU3xUyZpVivFglu+IxMz8aEhB173tbkjL6+1v3ar4NhmdpqAHFLFYUpDkvwkOs9pfpG1THaVAhHko3VUKWjvVHB+ISR9DyvnSji8FJP32jSiKfCYiKOdHzpWFtQ7TwGPtays+DUGo23YtC3GP4bg2kx6rbFiwilBn1PuWzjHPaTTuXqIb12Dg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1858.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:17:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:17:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/13] mm: Change pudp_huge_get_and_clear_full take
 vm_area_struct as arg
Thread-Topic: [PATCH v4 02/13] mm: Change pudp_huge_get_and_clear_full take
 vm_area_struct as arg
Thread-Index: AQHZs0jeMyrCc6A/aUaBYUqLvHCmaa+zPisA
Date: Mon, 10 Jul 2023 17:17:14 +0000
Message-ID: <c51d1b18-130b-5ced-1e73-2c5df568f786@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-3-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-3-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1858:EE_
x-ms-office365-filtering-correlation-id: 91691854-4f4c-4d7c-165c-08db81698125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JKrkyDQ3PJc9sEIlpbKH3gcv2c74vyv/rAIZql4bGE+9Gr5+wP991UtHyHmyIeQzUxDPssZj6Ny6r9MXoAvucNGmU1gy3I3w1vbHvvshZGUzIsunf3ueLgmUIfj+M5CQCRXBOkAzD31J5ZzqXk2BBUQsHaiwxwwJjvyCz/1iW9/vDx8N1MvXsDdEOwuGm+nxZeu6AUGFdznIHyKQ5WeJpHCUNhjkDT2q8ZeueFHgqY13+AXlN17wVt13NWVMfjdxOFzyM49CEJ6JD/L2vsolm1fUWLaoICiCHBz5gsmN4K+ro6ZFlcNb+razKV4saso8fMMNR4DQAqbEMfXlEReWdFTW9IiexLvjjcMlPztOQIf/HV1sngA82WGo0zDYojvcPHU9W4tYMrrIzivQITZQhunb+h58u8WVysBwY6DUFi/JmGVmVk4NwGD6LXRIxSiPZUkr5WtFBUtU1o5aGROmf75yoLuF6nUxL7jcYkH8TJ4B/KtGQcg6mhKjonlQbg2qd2dOZAgFo+smzNXPp/KzOx3wpMXZlZMghJgehgJr4OEOWzPqvcAEdKHhdC1Z02SBYoSWHzQHFs2vH4Zl+3r/Z3zLHyBVANJrgb6MYombT1jFCfv2jE+VuFPZW60bEYBQ7PDvXuUOgN8iXGAq0Ia90Gbyisy2upV3pkd4xpANKNf8IPRM4FvaUyNht2wOLrm/gFW+ZKavJWXKPos/5ph5NQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(451199021)(86362001)(38100700002)(38070700005)(31696002)(31686004)(36756003)(6486002)(76116006)(110136005)(54906003)(71200400001)(91956017)(122000001)(26005)(186003)(6506007)(6512007)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(66556008)(478600001)(66946007)(8936002)(8676002)(66574015)(83380400001)(4326008)(64756008)(66446008)(66476007)(41300700001)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Szd5aXlVS2xHem1sbEJFNnltaEtoSytFaDk1QW5tcGJNS0xFV29kdWhmVE1k?=
 =?utf-8?B?M2xkSTlSRHVhTnFIczJpc2RlTUdlZ0FyeWlydTY0UjM2Qnd4YlZlaVVEZTcv?=
 =?utf-8?B?UVpvZndsRWJjejFFSGdzRGI1SGhnY1FVYm0zZUtKQ3M1WG9WWlVSUFdTOUZK?=
 =?utf-8?B?YitrTnBXRmg3MVU0Nkk0RXhmdVZwR0tURW9KdFV5VllnZk01eXNMbmh4RkM4?=
 =?utf-8?B?SGtXUlhrdVRNRS9ienNxOWFGMHhxeUVzenpjcUszNzNWQmFGSlR4aUVoaURx?=
 =?utf-8?B?OEQvVUp5eGg4cjdlSHU4a3FUUjdodGdpbU8xRHcyREVHWjRPSG5uNnR0azll?=
 =?utf-8?B?OUZPSXZTWndod3B2MzExRGZjZGQ5VVh1NERsbC9WY2wxQVBrQi9CQmlDMUhR?=
 =?utf-8?B?ZTZucWpIRVNWRVg4dWlxeUJWdS9MZzJ2VjBlK2pwMUdubGovV1J6MWI2Ulhq?=
 =?utf-8?B?L2ZGa1VFUlVWTFJKdjVtU3l0QVFMdlpYZFJNak1IZlRzT2NSS0pjRlZDZW56?=
 =?utf-8?B?UDRFSWwzREdDc0cvV3lKZ2ZKZ2Uya05KQTgwaWdXOTNWVnFFdndvTFVMMzFh?=
 =?utf-8?B?RGw4SkJJZ3huakNmUG5DWG1xYThNNW5GWkZOTk5wZ3JULytUelROZGNQY0hm?=
 =?utf-8?B?OTM5ZkR4KzY2Q1lNVU45c01FeGdrRlJzb1R4SlNDS0k3eUxHOUVxT1NXVUZE?=
 =?utf-8?B?N0dNTWdzQmJyQnNJU3RTWmozZUtrUXV1LzRaVGVnWHgvdzlVWW5SeVRHQlRt?=
 =?utf-8?B?d0RUb2x3dlZhbTgrTWwvWkk1dEdpV3d6OWdSZTFmSFlxeVBxRHdYWG9vdy9k?=
 =?utf-8?B?NDBxbDFHWjNHTy9XVnpENEpRMGJuS1J2ZVFJK2FSM0QyQ1paS2gyQ21PYVYv?=
 =?utf-8?B?eURmeE00Q3p6THZSSEhBdHR1K1FhdituWDhHYXRQSlNqOE5vZ3c0cjQrRHZB?=
 =?utf-8?B?S3F2Q2lHd05ZdnIwVEdJN1RmOFVDWUNNaSs5aUtwRHhuZEVucmxYand5RzJ1?=
 =?utf-8?B?U29nN1oxODI2aEFDMWg5OW92VWt1UDhGZnB4eXpNamozZ2FKR0Nqc3hXSWpi?=
 =?utf-8?B?M0FkRzFqYTc0bFkxNGN1L09vUHZHdC9jdk95NlZWRGJYYjZiVHg3YXFZMVBh?=
 =?utf-8?B?OWNJSUdIcldLT1BkcHVCMjBlRFBzMytoVTVUTWt1SWx4Rm42b2d6UXlXVFRW?=
 =?utf-8?B?dE1wcXRIWHM2QkdoNTRqZTVkeDlUYkN0bFI5MGJJTTRuVUg0MUdra3c0cGdr?=
 =?utf-8?B?anRvdE1XU1Y4Zkg1N0wrRzgrVkd4dFF4Q1c5ejNUVU9vOFp2UHVBUVdXU1lv?=
 =?utf-8?B?UytWaHcyeFd5aFRiMFBXNHBEeG50YWROMTRld09zYjNHQUJRQStMWVNxaDlm?=
 =?utf-8?B?Mm9weHBicEJ0OHlTd0VWNmcvRXYvRVNoL012MGlnU055QldSaTNwUEJXWVZE?=
 =?utf-8?B?aHFkMi9jbER2VmlObVRwTlAxcnU5L084L3lNd3dzOTcyaHBYZy9yc0hjdmNm?=
 =?utf-8?B?MWdoaDRBRkUzNkhTNnBUTE9EYjB3azRGelJoSTQrWFpYUUMzV3FyT3hvK3kz?=
 =?utf-8?B?VXlMdVpzUlJpNkpWNU41Q1FDMzU2K0dXQVVRNmVzcmFieldzcUs5NmNhRldS?=
 =?utf-8?B?ZEZVZldyZG9zdXcxZzJWWVI5bjBRUGRDKzRraXFDMy85Nm4vQW5XQUhLRDc0?=
 =?utf-8?B?cEJrWEtUZ2tJa2tBSXprRlQ4a1BGYklkeTlIQ1dDT2FVeU5VVGJ5NkN1ZlNX?=
 =?utf-8?B?d1VSZWZaRWdpRXlscCtabEFxZEQzVHB1N0puNkJGd0pKSzVBS0JRZkg3SGp0?=
 =?utf-8?B?dFdlZ1RzcHl1STl0VnhSUVM2MjM1TEFxdWpwSlhvN3JjWG9MRkxyTHJCOVhQ?=
 =?utf-8?B?RjhGV01wMVFuRUFPbFIzUXo5MTU2Z3JLMVNUSUJaQUFNTkIxd1V3bXRVUnkx?=
 =?utf-8?B?eDdOUHptSU8wN2k1b00yQXdhSjVHK0JkRnlWZVBwRUpqZVRKVTdJejlDdGdV?=
 =?utf-8?B?c3BlMVN1S2huZ3JIKzVoRTBsVmR5SmdpU3lBUXJVdVYvUmNnc1hwaVppdzc2?=
 =?utf-8?B?dXBRUk95UHlHcGo4RjJNVm9BSzJrdS9wSHdBSWcydUMvNHpqdDVUZjhOTVRk?=
 =?utf-8?Q?Qn5BkkZGN6TaQSuM/xLibOxcv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2781E79FCF69CD41B95580ECFC9FFF9B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91691854-4f4c-4d7c-165c-08db81698125
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:17:14.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uu9z5/1+3Vcgf/KxudZrKAvWaCei1j0sJ/FRxsqiQSbrJBbrgb5b8nrBg6HeDYXfeiOl4zCooLWXA0TuoTob8hLUOhIgQXHMB6ZwaDJaNqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1858
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gV2Ugd2lsbCB1c2UgdGhpcyBpbiBhIGxhdGVyIHBhdGNoIHRvIGRvIHRsYiBmbHVzaCB3aGVu
IGNsZWFyaW5nIHB1ZCBlbnRyaWVzDQo+IG9uIHBvd2VycGMuIFRoaXMgaXMgc2ltaWxhciB0byBj
b21taXQgOTNhOTg2OTVmMmY5ICgibW06IGNoYW5nZQ0KPiBwbWRwX2h1Z2VfZ2V0X2FuZF9jbGVh
cl9mdWxsIHRha2Ugdm1fYXJlYV9zdHJ1Y3QgYXMgYXJnIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZWVzaCBLdW1hciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+
IC0tLQ0KPiAgIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIHwgNCArKy0tDQo+ICAgbW0vZGVidWdf
dm1fcGd0YWJsZS5jICAgfCAyICstDQo+ICAgbW0vaHVnZV9tZW1vcnkuYyAgICAgICAgfCAyICst
DQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4
L3BndGFibGUuaA0KPiBpbmRleCBjZjEzZjhkOTM4YTguLjZmZDliMjgzMTMzOCAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3Rh
YmxlLmgNCj4gQEAgLTQ1MCwxMSArNDUwLDExIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kcF9o
dWdlX2dldF9hbmRfY2xlYXJfZnVsbChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAj
ZW5kaWYNCj4gICANCj4gICAjaWZuZGVmIF9fSEFWRV9BUkNIX1BVRFBfSFVHRV9HRVRfQU5EX0NM
RUFSX0ZVTEwNCj4gLXN0YXRpYyBpbmxpbmUgcHVkX3QgcHVkcF9odWdlX2dldF9hbmRfY2xlYXJf
ZnVsbChzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gK3N0YXRpYyBpbmxpbmUgcHVkX3QgcHVkcF9o
dWdlX2dldF9hbmRfY2xlYXJfZnVsbChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJ
CQkJCSAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB1ZF90ICpwdWRwLA0KPiAgIAkJCQkJICAg
IGludCBmdWxsKQ0KPiAgIHsNCj4gLQlyZXR1cm4gcHVkcF9odWdlX2dldF9hbmRfY2xlYXIobW0s
IGFkZHJlc3MsIHB1ZHApOw0KPiArCXJldHVybiBwdWRwX2h1Z2VfZ2V0X2FuZF9jbGVhcih2bWEt
PnZtX21tLCBhZGRyZXNzLCBwdWRwKTsNCj4gICB9DQo+ICAgI2VuZGlmDQo+ICAgI2VuZGlmIC8q
IENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAqLw0KPiBkaWZmIC0tZ2l0IGEvbW0vZGVidWdf
dm1fcGd0YWJsZS5jIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jDQo+IGluZGV4IGVlMTE5ZTMzZmVm
MS4uZWUyYzRjMWRjZmM4IDEwMDY0NA0KPiAtLS0gYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMNCj4g
KysrIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jDQo+IEBAIC0zODUsNyArMzg1LDcgQEAgc3RhdGlj
IHZvaWQgX19pbml0IHB1ZF9hZHZhbmNlZF90ZXN0cyhzdHJ1Y3QgcGd0YWJsZV9kZWJ1Z19hcmdz
ICphcmdzKQ0KPiAgIAlXQVJOX09OKCEocHVkX3dyaXRlKHB1ZCkgJiYgcHVkX2RpcnR5KHB1ZCkp
KTsNCj4gICANCj4gICAjaWZuZGVmIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQNCj4gLQlwdWRwX2h1
Z2VfZ2V0X2FuZF9jbGVhcl9mdWxsKGFyZ3MtPm1tLCB2YWRkciwgYXJncy0+cHVkcCwgMSk7DQo+
ICsJcHVkcF9odWdlX2dldF9hbmRfY2xlYXJfZnVsbChhcmdzLT52bWEsIHZhZGRyLCBhcmdzLT5w
dWRwLCAxKTsNCj4gICAJcHVkID0gUkVBRF9PTkNFKCphcmdzLT5wdWRwKTsNCj4gICAJV0FSTl9P
TighcHVkX25vbmUocHVkKSk7DQo+ICAgI2VuZGlmIC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQg
Ki8NCj4gZGlmZiAtLWdpdCBhL21tL2h1Z2VfbWVtb3J5LmMgYi9tbS9odWdlX21lbW9yeS5jDQo+
IGluZGV4IGViMzY3ODM2MGI5Ny4uYmEyMGNlZjY4MWE0IDEwMDY0NA0KPiAtLS0gYS9tbS9odWdl
X21lbW9yeS5jDQo+ICsrKyBiL21tL2h1Z2VfbWVtb3J5LmMNCj4gQEAgLTE5ODEsNyArMTk4MSw3
IEBAIGludCB6YXBfaHVnZV9wdWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsDQo+ICAgCWlmICghcHRsKQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgDQo+
IC0JcHVkcF9odWdlX2dldF9hbmRfY2xlYXJfZnVsbCh0bGItPm1tLCBhZGRyLCBwdWQsIHRsYi0+
ZnVsbG1tKTsNCj4gKwlwdWRwX2h1Z2VfZ2V0X2FuZF9jbGVhcl9mdWxsKHZtYSwgYWRkciwgcHVk
LCB0bGItPmZ1bGxtbSk7DQo+ICAgCXRsYl9yZW1vdmVfcHVkX3RsYl9lbnRyeSh0bGIsIHB1ZCwg
YWRkcik7DQo+ICAgCWlmICh2bWFfaXNfc3BlY2lhbF9odWdlKHZtYSkpIHsNCj4gICAJCXNwaW5f
dW5sb2NrKHB0bCk7DQo=
