Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817181417A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 06:47:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hSs5X5Gs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sryt15jyqz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 16:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hSs5X5Gs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srys758dCz3cWy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 16:46:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISMWu+TY198gs56eeWg1+c1X2osROlyoidQs3ahi3GLl3KgckTM4NoR60deerlogg5Q/gk7XJhqBHuXdFmcwOl3S5OatScgCkj/LT6wsmEcSuBi2YJrXjKcRN5ksYCSqyfM+1gY4GjkSI4WKcR9PlvgYTUYFCEpJpAhvRxl7rweNQrcOfRittHx/x651FsSfhjZUxyEy4tPp92aYK7VkYeumhtvX78pRHB0lP5SHGOj66A7rYncEp4UfScWI3/Q1WlcgD77Q1K8nopkEiC4xsqbSPG7i2I5tbhNpp+dxOaGgjPrLzQv5CELeSYEE7vsv+THCUyIl2s1V7yPwKjbuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVMMZG23TPlX43BU4DP+uwSFLoiuCmMf9CezlcYVk2M=;
 b=V2bKBo8vSRHqHX9UlLast44Nj5zx+FUZCO+IpM2yxLl36DffGmPI+9fIlhWHjl/x4rAfc7AfEoooHTqDViyqdcRvhVpakEH7pDWXE9mLZTL+8kUzPbAzLjX5MXK3mRTMfkoiKbMYZeIu19hbgA7sgcsNmmv7eOJzvNiWrXCK0tOE1U38hjQmX/dA4bawvE0wLIKjtG0gZq+aceqB6zZMExjHiwSjNCD6HfktTvnoVq+z8E+mcBCcxSiWx9NQQKE25l7DV3HOSbcrY+uXioEfnNWgIX7XqcDouZnWSF4OUf0s6v6TNmV5OsomiEV6xGEtGmDQF6CC3b+rzf4AKQkkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVMMZG23TPlX43BU4DP+uwSFLoiuCmMf9CezlcYVk2M=;
 b=hSs5X5GsRvcAZCvzqq3fPwd4NUX04TXLjqiLW2RkBZdepS/yph3YaHULpF1zlo7hPDajVqGjeFv8pGaxU/5dw9J18CTLJ3dId4HF/m8OvPYjcqQCh3Tux+RJNzZzHOmUF9abVM0D5DfwqCxP95kdy9Smq6XAyYAmtYzou4v4Kf8mN8jILDIVSXJn73DIp0MOBgvaSuOYx09axvpsttf2KDarACCo8qoWi+urNrU7i3aCh8mbDzqce8PrPgNsUTaOTryu7UdwSIUc4FXObYpsuIHWT0FVJZIcmTdxG1Sa4a0pSatpMuX5cToSAUE75hBeZhxsPZhCvLHXsU7GZagK7w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1951.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 05:46:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 05:46:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Waiman Long <longman@redhat.com>, George Stark
	<gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Subject: Re: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Topic: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Index: AQHaLrQSLTXRy4mOS0OgHh/wjtvn+LCpHvQAgAASE4CAACAsAIAAhXeA
Date: Fri, 15 Dec 2023 05:46:24 +0000
Message-ID: <5ef8a83a-5dfd-4038-851e-c730d5f1b6f3@csgroup.eu>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-3-gnstark@salutedevices.com>
 <5c10f66c-3fd8-4861-994b-13e71c24f10a@redhat.com>
 <b158ca2b-7300-4ad0-82b8-e1442d267734@csgroup.eu>
 <300d2131-87ef-48c1-b162-dcef0d8d5722@redhat.com>
In-Reply-To: <300d2131-87ef-48c1-b162-dcef0d8d5722@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1951:EE_
x-ms-office365-filtering-correlation-id: afaecdc4-6b3a-4aed-471e-08dbfd312cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p1swEM37G3DFbbVGjETkoLrpkHPbkDXy364s3/GGdiLsScFyh3wnwoCmrYnV5C9I//DTFqmQBVTkpN5MMfBM2nW9Gp/5SGpGLN/MqMuI5qRPR4ZgOwcBMmldnLxnzIkKbsRXHkOd+yY8AztelUfbePmUPU5FsZEWGRIIvdIYpVs4KNKnzk3LKbh7/YGzWqTlWbn2eTeWZRylA4Tusyv9ohs4cs6Pk0FUAeNBo4poSGiBqwI0mS5dlQ1jR8HeFd0v+ZWR9t5yAwdutYjv+Cj5qKOtVwTIvg35a41n3W3soUTlysMM4G67/xShGT8cbOXjTKVZSy5HIJtQRpPqapz0X5O3KZNl4R0lgCgOFYW1LCqAfQxyYlxRb3/bNfpxsqXIKuzTgR6XkmUESpWmUmRPjrcIBZVnfbh9ZGOPrY8wEojR0EUhG0/VE4w6Gk1xZt9UQP2YAFKsGgBuasAkCMvbOHFdogPGYSU79+EGFTgYFZS9xeMZk9fmkqqBkphddNKL+VxlJRxq4OdU4a34cIhms5vUqYcSY+FkkQgypSLg8UV5fiphRp2m8foWEp6vbe12sThbdqLP2dKwjrlN88kSXLx34z6x+4ckxTpSUUQ4dA2bKAkeklz/c0GudNOjs0NQlpK65QFaN9iNAssdK/SJRgumGMuOJ8K8r7PEYniIWbK8PEBSGJLg6e4Kpi92zIQLy/uwz9waMXpimL/J0VIYUG1zV45lQ55ljKeswcUAtH8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8936002)(44832011)(8676002)(2906002)(7416002)(5660300002)(478600001)(6506007)(6512007)(53546011)(91956017)(110136005)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(6486002)(66899024)(41300700001)(38100700002)(122000001)(31686004)(31696002)(86362001)(36756003)(921008)(38070700009)(71200400001)(66574015)(2616005)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVg2UVA4S2M0MkgwZDA5ejRPTFk2UCtUNVgrZHhhU0l5cnNLNnJRM2I3aDZN?=
 =?utf-8?B?bzJ6cFZ3NGMzcVlmTTIzY0FKNzBZR2V3ajVxYTRkamZsNklPSXF5TnpuclJO?=
 =?utf-8?B?UC9iMHdobmplRmJ4MjRSNDdzRWRhMGNMRUNLQVVndGRvOUZVSTJPdUlWemNO?=
 =?utf-8?B?TnVpTThONFFSVXAvVko3ZjJMVWtVMTZNOGVHeWxPNHhWcm4vcU9qYWhOTzla?=
 =?utf-8?B?ejdwSVRURytscDRpcVdJa3lHNVFqcENaaWk0eHJvbFJCNzRub01KYW9yNWpU?=
 =?utf-8?B?T2FFd0xSMFFjNXMrS0VBbXFObUJYRkR3dmFwczRNaEdtZEVYNk5JK2xQWC8w?=
 =?utf-8?B?V2ljSU9uMlpxSzNxdS9yN2w5VmY3aU9JdnJiUTQrc1JMdG5pcU13anRla3NQ?=
 =?utf-8?B?VGFzeGtqM2E5STcxaUR4WmVqdlE5MTdReXl2bDkwYngwL3grRUtEQ014Vzhm?=
 =?utf-8?B?MnR3OXFUTzhLVEtIeHFEallxZWxZZm11UE5icmJvUGI4Y21ublpQZFk1dUky?=
 =?utf-8?B?aUkwV0VxdVB2RG5UVlkyM2ZpakRXMkp4UGx1WitvMWpucHZtc211WnNhd21S?=
 =?utf-8?B?S05tZU9uREo5S2FJMHZmbWI1dmE4SmZ5alpUNVlNZ2hxcjY0aERrOU54bVJx?=
 =?utf-8?B?Rnl0VUMwUDJ3RUd4YkZLSkh4NTFKeUErbE9MTjYyRi9NSGUwdWRuM0Z3UFI0?=
 =?utf-8?B?SDJRRmJGcFR6RGJ2a0JlZ2JLZWpDb3UxS2grYmhSQXAvUTYxOVRaTGtFeFkw?=
 =?utf-8?B?OGt3cmxjOEFnUFdkMWRmZXpDb3VwVjYyNlNaOW14SjhkZlJVb09SQ0NGWGhj?=
 =?utf-8?B?WWVrZXJ1aFc2SldiRGVKSFR2QnJGbEFZUEhCdm40NnVnRUJza2ZHMGV4NUxC?=
 =?utf-8?B?TDAyVTVzbEljZlU3SkhxVzIrWC9mYmlEWlNOQkRpZnZ6ejh2RDBLbldXVnZC?=
 =?utf-8?B?NC81dDRRdVpOby9GTlZ2N0pIV2czQXJOUE1UYmVkSk43OTRUZXl1bW1Bck0v?=
 =?utf-8?B?QzNwVjN4NW5OU1JnYTd0bFJwdmtiTHZmYU1EaEI1dDJKaEU5eHdkbGhYemFj?=
 =?utf-8?B?SkduS01OSmhTVWc1bC90dGwvdUhTMWE5eVdTaG01NHJKeW9SYVkvUmRDZk1H?=
 =?utf-8?B?bEJpeTg0VWFnVjVWWTBLeVJQd09TSmtRNGRUZno0bTlvY3VVSDZaaVVwcVIv?=
 =?utf-8?B?aUh3UnE5c05mVk5BeTJycVZodHMwNEJodGdidzFIbDBlcG55QS84Um5iOW9a?=
 =?utf-8?B?Sy9DbEZMNGdPUzQyVTZ3dHdYbzJmMDNMbFRubkcva3lzVE1iRS9GNTFaN1JC?=
 =?utf-8?B?WnNEaFFnRDQ4dS9XRHN5TUZ4Q2JMWldMVm53R3ZweFZFaFdlRlBzdDN1ZnEy?=
 =?utf-8?B?K3hBNFBwTGNWVVhhNCtOd0tnNVpRU0ZuYk1VYXdFUHpnUDZhbWJlMkFndTNS?=
 =?utf-8?B?bTlkekhCS1VrMWNFdW56Y1VMRUhlR2d6eXhUcEtwS3FFcXRCZWFIbjllRVhK?=
 =?utf-8?B?a0ZCblVNcmVBbUtOTWNPQ1Y1SGNMMitmMVVSeW9PazhCeVBwdVBvNEFOL3gz?=
 =?utf-8?B?d3pGSnBUZzhyM25IakgzQkZoVmIra1dqV05CWFdRaktkR2VyWnRaRVF4cjFO?=
 =?utf-8?B?a3BJdHRJdzhDalNtNVY4UmMwVWlqcEV4aDRBL1Jwc216MTNnVFVoWmo0UFNL?=
 =?utf-8?B?bkp1QytqS1hKQ2piY3Y3aU5ZVU1wZEtrTmw4NXlqUHFlOTgrejFwVk5JQTgz?=
 =?utf-8?B?RUZJNkljOTBUUGhSSmtoNjRTRlhCL2d6UkV5M1AvYVN0MU1wZzgzWU5Bd1dp?=
 =?utf-8?B?VU9KM3REZ2h6dzlFcFBkdlVUMjZ1RUJ1dzlYa2x3eUozMFRjbm1xQkQ5VC8z?=
 =?utf-8?B?ZkpEdXNwRm9Pa3k0VkxtZk9aaDRHZFJEVUxCSVFNeE5yZWx4Z0g4S2ZEKzNq?=
 =?utf-8?B?Wkt2UXdQWDVTNSt2bnJ3Y0FCZUQrZVdTa1NvNlY3a2FxMjhSZ0pOc1hWWlc5?=
 =?utf-8?B?OEQrNGxpVm1hWkVySGxyQThFMDZnY1lBbTVVRkZkSGpmaGU0dWNhK0MvWkta?=
 =?utf-8?B?RzNremlzMGFtRjlaSWJVRW1UUS9pSFJpTVh1MzNtWTJnS3JYZVQxUzg3Qkxl?=
 =?utf-8?B?V1RPMEJNTzNxMitVZG4wdHczTExEZkl1YmMvaHlkUnBjR1J0WDZ6TUc1anll?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E1CE5739461284DB35EE9E8CA455D74@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afaecdc4-6b3a-4aed-471e-08dbfd312cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 05:46:24.7701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hE0HUtOT9GRnWt22U9JrxI8tkN5c5qRwQ+b0ykW98SnyGNGZWTPlUg9g2gY862omnIhV+y/Yg49/UyGkBYea7Q5SwMFKroVKglIs1xeua7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1951
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMjI6NDgsIFdhaW1hbiBMb25nIGEgw6ljcml0wqA6DQo+IE9u
IDEyLzE0LzIzIDE0OjUzLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IExlIDE0LzEy
LzIwMjMgw6AgMTk6NDgsIFdhaW1hbiBMb25nIGEgw6ljcml0wqA6DQo+Pj4gT24gMTIvMTQvMjMg
MTI6MzYsIEdlb3JnZSBTdGFyayB3cm90ZToNCj4+Pj4gVXNpbmcgb2YgZGV2bSBBUEkgbGVhZHMg
dG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNvdXJjZXMuDQo+Pj4+IFNvIGFsbCBk
ZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13cmFwcGVkIHNob3VsZCBiZSBk
ZWxldGVkDQo+Pj4+IHdpdGggcmVzcGVjdCB0byBkZXZtLXJlbGVhc2Ugb3JkZXIuIE11dGV4IGlz
IG9uZSBvZiBzdWNoIG9iamVjdHMgdGhhdA0KPj4+PiBvZnRlbiBpcyBib3VuZCB0byBvdGhlciBy
ZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4+Pj4gU2luY2UgbXV0ZXhf
ZGVzdHJveSgpIGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcgYnVpbGRzDQo+Pj4+
IGZyZXF1ZW50bHkgY2FsbGluZyBtdXRleF9kZXN0cm95KCkgaXMganVzdCBpZ25vcmVkIHdoaWNo
IGlzIHNhZmUgZm9yIA0KPj4+PiBub3cNCj4+Pj4gYnV0IHdyb25nIGZvcm1hbGx5IGFuZCBjYW4g
bGVhZCB0byBhIHByb2JsZW0gaWYgbXV0ZXhfZGVzdHJveSgpIHdpbGwgYmUNCj4+Pj4gZXh0ZW5k
ZWQgc28gaW50cm9kdWNlIGRldm1fbXV0ZXhfaW5pdCgpDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4NCj4+Pj4gLS0tDQo+
Pj4+IMKgwqAgaW5jbHVkZS9saW51eC9tdXRleC5owqDCoMKgwqDCoMKgwqAgfCAyMyArKysrKysr
KysrKysrKysrKysrKysrKw0KPj4+PiDCoMKgIGtlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMg
fCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L211
dGV4LmggYi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4+Pj4gaW5kZXggYTMzYWE5ZWI5ZmMzLi5l
YmQwM2ZmMWVmNjYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPj4+
PiArKysgYi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4+Pj4gQEAgLTIxLDYgKzIxLDggQEANCj4+
Pj4gwqDCoCAjaW5jbHVkZSA8bGludXgvZGVidWdfbG9ja3MuaD4NCj4+Pj4gwqDCoCAjaW5jbHVk
ZSA8bGludXgvY2xlYW51cC5oPg0KPj4+PiArc3RydWN0IGRldmljZTsNCj4+Pj4gKw0KPj4+PiDC
oMKgICNpZmRlZiBDT05GSUdfREVCVUdfTE9DS19BTExPQw0KPj4+PiDCoMKgICMgZGVmaW5lIF9f
REVQX01BUF9NVVRFWF9JTklUSUFMSVpFUihsb2NrbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLCAuZGVwX21hcCA9IHvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+IEBAIC0xMjcsNiArMTI5LDIwIEBAIGV4
dGVybiB2b2lkIF9fbXV0ZXhfaW5pdChzdHJ1Y3QgbXV0ZXggKmxvY2ssDQo+Pj4+IGNvbnN0IGNo
YXIgKm5hbWUsDQo+Pj4+IMKgwqDCoCAqLw0KPj4+PiDCoMKgIGV4dGVybiBib29sIG11dGV4X2lz
X2xvY2tlZChzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KPj4+PiArI2lmZGVmIENPTkZJR19ERUJVR19N
VVRFWEVTDQo+Pj4+ICsNCj4+Pj4gK2ludCBkZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KPj4+IFBsZWFzZSBhZGQgImV4dGVybiIgdG8gdGhl
IGZ1bmN0aW9uIGRlY2xhcmF0aW9uIHRvIGJlIGNvbnNpc3RlbnQgd2l0aA0KPj4+IG90aGVyIGZ1
bmN0aW9uYWwgZGVjbGFyYXRpb25zIGluIG11dGV4LmguDQo+PiAnZXh0ZXJuJyBpcyBwb2ludGxl
c3MgYW5kIGRlcHJlY2F0ZWQgb24gZnVuY3Rpb24gcHJvdG90eXBlcy4gQWxyZWFkeQ0KPj4gaGF2
aW5nIHNvbWUgaXMgbm90IGEgZ29vZCByZWFzb24gdG8gYWRkIG5ldyBvbmVzLCBlcnJvcnMgZnJv
bSB0aGUgcGFzdA0KPj4gc2hvdWxkIGJlIGF2b2lkZWQgbm93YWRheXMuIFdpdGggdGltZSB0aGV5
IHNob3VsZCBhbGwgZGlzYXBwZWFyIHNvIGRvbid0DQo+PiBhZGQgbmV3IG9uZXMuDQo+IFllcywg
ImV4dGVybiIgaXMgb3B0aW9uYWwuIEl0IGlzIGp1c3QgYSBzdWdnZXN0aW9uIGFuZCBJIGFtIGdv
aW5nIHRvIA0KPiBhcmd1ZSBhYm91dCB0aGF0Lg0KDQpGV0lXLCBub3RlIHRoYXQgd2hlbiB5b3Ug
cGVyZm9ybSBhIHN0cmljdCBjaGVjayB3aXRoIGNoZWNrcGF0Y2gucGwsIHlvdSANCmdldCBhIHdh
cm5pbmcgZm9yIHRoYXQ6DQoNCiQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QgLWcg
SEVBRA0KQ0hFQ0s6IGV4dGVybiBwcm90b3R5cGVzIHNob3VsZCBiZSBhdm9pZGVkIGluIC5oIGZp
bGVzDQojNTY6IEZJTEU6IGluY2x1ZGUvbGludXgvbXV0ZXguaDoxMzE6DQorZXh0ZXJuIGludCBk
ZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spOw0K
DQp0b3RhbDogMCBlcnJvcnMsIDAgd2FybmluZ3MsIDEgY2hlY2tzLCA5OSBsaW5lcyBjaGVja2Vk
DQoNCj4+DQo+Pj4+ICsNCj4+Pj4gKyNlbHNlDQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyBpbmxpbmUg
aW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleA0KPj4+
PiAqbG9jaykNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBtdXRleF9pbml0KGxvY2spOw0KPj4+PiAr
wqDCoMKgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+IEkgd291bGQgcHJlZmVyIHlvdSB0byBhZGQg
YSBkZXZtX211dGV4X2luaXQgbWFjcm8gYWZ0ZXIgdGhlIGZ1bmN0aW9uDQo+Pj4gZGVjbGFyYXRp
b24gYW5kIHB1dCB0aGlzIGlubGluZSBmdW5jdGlvbiBhdCB0aGUgZW5kIG9mIGhlYWRlciBpZiB0
aGUNCj4+PiBkZXZtX211dGV4X2luaXQgbWFjcm8gaXNuJ3QgZGVmaW5lZC4gSW4gdGhpcyB3YXks
IHlvdSBkb24ndCBuZWVkIHRvDQo+Pj4gcmVwZWF0IHRoaXMgaW5saW5lIGZ1bmN0aW9uIHR3aWNl
IGFzIGl0IGhhcyBubyBkZXBlbmRlbmN5IG9uIFBSRUVNUFRfUlQuDQo+PiBJdCBpcyBhbHJlYWR5
IGRvbmUgdGhhdCB3YXkgZm9yIG90aGVyIGZ1bmN0aW9ucyBpbiB0aGF0IGZpbGUuIFNob3VsZCBi
ZQ0KPj4ga2VwdCBjb25zaXN0YW50LiBJIGFncmVlIHdpdGggeW91IGl0IGlzIG5vdCBpZGVhbCwg
bWF5YmUgd2Ugc2hvdWxkDQo+PiByZXdvcmsgdGhhdCBmaWxlIGNvbXBsZXRlbHkgYnV0IEkgZG9u
J3QgbGlrZSB0aGUgaWRlYSBvZiBhDQo+PiBkZXZtX211dGV4X2luaXQgbWFjcm8gZm9yIHRoYXQu
DQo+IA0KPiBkZXZtX211dGV4X2luaXQoKSBpcyBub3QgYW4gQVBJIGZvciB0aGUgY29yZSBtdXRl
eCBjb2RlLiBUaGF0IGlzIHdoeSBJIA0KPiB3YW50IHRvIG1pbmltaXplIGNoYW5nZSB0byB0aGUg
ZXhpc3RpbmcgY29kZSBsYXlvdXQuIFB1dHRpbmcgaXQgYXQgdGhlIA0KPiBlbmQgd2lsbCByZWR1
Y2UgY29uZnVzaW9uIHdoZW4gZGV2ZWxvcGVycyBsb29rIHVwIG11dGV4LmggaGVhZGVyIGZpbGUg
dG8gDQo+IGZpbmQgb3V0IHdoYXQgbXV0ZXggZnVuY3Rpb25zIGFyZSBhdmFpbGFibGUuDQoNCklm
IEkgbG9vayBhdCBsaW51eC9ncGlvLmggd2UgYXJlIG1vcmUgb3IgbGVzcyBpbiB0aGUgc2FtZSBz
aXR1YXRpb24gSSB0aGluay4NCg0KZGV2bV9tdXRleF9pbml0KCkgaXMgbm90IGFuIEFQSSBmb3Ig
dGhlIGNvcmUgbXV0ZXggY29kZSwgYnV0IGRldmVsb3BlcnMgDQpuZWVkIHRvIGtub3cgdGhlIG1h
bmFnZWQgZnVuY3Rpb25zIGZvciBtdXRleCBleGlzdCwgYW5kIGhhdmluZyB0aGVtIGF0IA0KdGhl
IHNhbWUgcGxhY2UgYXMgbm9uIG1hbmFnZWQgZnVuY3Rpb25zIGxvb2tzIGJldHRlciB0byBtZS4g
Tm93IEkgYWdyZWUgDQp3aXRoIHlvdSB0aGF0IHRoaXMgZHVwbGljYXRpb24gb2YgZnVuY3Rpb25z
IGlzIG5vdCB0aGUgYmVzdCwgYW5kIGl0IGFsc28gDQphcHBsaWVzIHRvIGV4aXN0aW5nIGNvbnRl
bnQgb2YgbXV0ZXguaCBzbyBtYXliZSB3ZSBjYW4gZG8gc29tZXRoaW5nIA0KYWJvdXQgaXQgbGF0
ZXIgYW5kIGltcHJvdmUgdGhlIHNpdHVhdGlvbi4NCg0KQ2hyaXN0b3BoZQ0K
