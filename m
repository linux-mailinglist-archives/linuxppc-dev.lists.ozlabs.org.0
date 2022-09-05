Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D55ACEE0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 11:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLjyw3Cnrz3bcw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 19:34:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z+AdUCF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z+AdUCF5;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLjy75qswz2xfm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 19:33:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0QI+TKZgR/H03dmU8MAOBwPripziIGhKnGN8YJ5QyOu8KRhRGFDwjkR85zL9coEFtFn178G/Gu/7dbvUK0OTozOZ+D5HKbM+aGwoDrokKLj+0JaQ79rvMU06GTsenXYfpR+ID2JyrpjZmiGZ36dWLlypkx9ShNPW/Maq3fG/ifiHL8ebr1XqnvaioG0bzR6NKveJVvpiZ86el1RnDF4LeEj6myEB6fzi3li7ZGW5vSl3a2LKr1E2n6LnDjMgU/HipUkoHL1I8oZdGPmKBZ7NuoKgTcr1SHadZpdCzqzV7nkzsBHeND4mGaEQ7SIdQGMVeMHgMnMBx3Cq9md1j/FDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMytXcCJEKlBwCtUXEh2vSiMblGGtOLi35y5lfncWLk=;
 b=LAnh4gj28XwJWFZNYRmdkJ4itPZJOk10GcXS6hNCV8u9Pnb+2ea4cNihETf7u0KqW8eZ2i3B73wu1OO9Gh+2xT/YGcSNHJXgI+eDaW2YcP5WkulTCQs382Cdvy313i8ZQgZ8XGBGZZnX3Y5lSrIsxFA8OSbyCsYmUkqlLBANdYv7+Oe1rRsZla954qia8GVbgCjkel728z21FM2JQ839E6a8yzR+tEYtDm7FJ7PXVmZ49ZrGaUTkzryTmeYiL1g3EG5RZL1rkh5Hg/mWHpe91LC12H2auvUfhw9CbDg5aJrEbFLd0A0g2aPYonaP/JIDeq+pKawyDy84mqOz9J3f3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMytXcCJEKlBwCtUXEh2vSiMblGGtOLi35y5lfncWLk=;
 b=z+AdUCF5FCJ7UO1zAzbC+3t7S6+u1KiHLdjSQLBRfVsgcsTcrn0ekfH5cj49ggKReWB468C6E1b6Tkra/n9zoVmIs2xhCgIMvjlAZzaRiUBxy/Fe1rEM6g/OR6UIp2Roh8/FaxOkBkyeg1dc3FL3ShGBDQYDngaMDqG53QDm+ILq/1+7yF/I62zSbBm9onLpllMxpME5EKH2GVqxMWcdJmEg7JboFE1C1EqY9qbszK2uF0XJnA0PGmjpm/RCxp1WF2kXVegFVJrY+XBfpz2mTCvR/R6Hb9NnmAORuADfxEocxA1havbgGgN1Skt5KQ20WFpO2RK8rc8JxJX1qhCw2A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2465.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:33:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:33:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, Mike Kravetz
	<mike.kravetz@oracle.com>
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Topic: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Index:  AQHYvADXSfya6wb65kG+D7mgtkHwTK3HGEyAgACRYoCAAE3+AIAAsbkAgAPYXwCAAACZAIAAzVqAgAM9zgCAAA+WgA==
Date: Mon, 5 Sep 2022 09:33:29 +0000
Message-ID: <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
In-Reply-To: <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e46d6a1e-8f87-4756-1c92-08da8f21b12f
x-ms-traffictypediagnostic: MR1P264MB2465:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wNMZh0KG+WR5HrrGoVFjFbHtHMgC+m26DzXhHH6kbQ5qpibVR4GJESia6Se1aETIy0bxgq8q4mpK5G6rpEFPWCZKExH++EAOYOHpWqoKETJ5lYjz/pjJewtKM/mfX/ec8WB/0OVqt2ouXKi56+agYzFitV37UkaN1ZdytlUocZOqiXjtVSRHyVGH8oaFmW+Th7v7enHCBqAoj3cjUtXASeGYfxrf0/+BhtJpTjyNnhVBj4lJyyjdDB3t4YKmtOIbhGlCSFA1bW/9dFOI5AwAZnJZwxFZHsF+7CPUaOM1ACh1RQ5UFD5nI0F9EObpui7m2HrexkTbCeSKq6vMxA4ezTR5wQdf4SF23dZjCfy7yCcjNShg3ZGTWWindGULaCwEXA5UjSzsbyyEHI3rJlLPFUDFjUL1wiI5Q0EsXJSw8sVM4R7FvAuc7Beznms29Ny/pLTAdtd/0+Cm0/C8EcvlbYX+JRPuReCX00uEH28XrldwILhV/WVBey0TX9/ux8EyYOoPnEUUbKBmm2Mv+xeFdNoHGBUr9pkigBa8Hs4t9LhSFsV1GzF/36qIwIbbOAmMfQ72U7LUsl7UZud5gIX0mBQav6S0n40DZld33uM+94/A0XeGGAAqOEWoqZxjclFyvypWlXobegTIElBWIIIVmS3rmeg7zLK8qwHzf1qORlLQ3n4JIBOjnXmT9umlZY9023TivKDX9XjYK6SYS0w71fr41e1roOJZAjlBA5EKl8h9tMzPcbnAG7hVJUh8N5T+Rg+z4O20xEdstx535WX0egsmlNzcHQPYesJ4dKne3eUNEiXo1k5/cczOCnL0j9YD
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(186003)(2616005)(8936002)(6512007)(2906002)(44832011)(83380400001)(7416002)(5660300002)(54906003)(53546011)(41300700001)(6506007)(86362001)(31686004)(31696002)(36756003)(66574015)(6486002)(26005)(71200400001)(478600001)(38070700005)(122000001)(38100700002)(66946007)(76116006)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(110136005)(316002)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZUc5bU13R3dwTHk5ZlNQWkZORk1rQ2p6eC9IdkpYS1ErdzloL1cvakx3M2NF?=
 =?utf-8?B?eEUwbm5BV3lrOHJrektmV29LalhkZVlpL1NRSkRjUlovUE11V0FzZjdpOXVn?=
 =?utf-8?B?dGRLbzY1U2Y0TkhXaEd2UldZMko2YTNwYW9OeGhDWXRPbVZ3NW5STzRDdzlp?=
 =?utf-8?B?TmltNjJDbEh1bm5yOG01VEFxZlNkcmhIQXZ1TW9QSTJoMDVYWHBTbWsvdnAv?=
 =?utf-8?B?eXdxaHh5dXlXQXN6dzl5NU5icXNmTnVxcU00S0wxY1RIMHlWNUc3YWU4b0Yx?=
 =?utf-8?B?Y1dxSHY4aC9UMm5VVzU5QmtaZnA4KzVPL1VZNjB5Qk9GaVRwRXg4Zml2UzMz?=
 =?utf-8?B?THA0UUJWNkc4SS9OT3JpeUhSaGtLeDl6bUhIK3lJcjI0RXBUUTlTaHNYNXpl?=
 =?utf-8?B?VFA4WmNyekVUMEpDVno0Y3d3eG1yR3E5a1pwNHZKTjVuYmtYaUJEQk9HaXd2?=
 =?utf-8?B?RFJzTHlidVJ0NVpIK2l6THphVlNXbWVzaEdnWW9ZaTJDOEJSdThKd3c0L1li?=
 =?utf-8?B?T3pmQi9XRjNobHZLQWNyU1RoTnF5alkvUGJQTXlKS2VBV1NnaGE5YUxnazdJ?=
 =?utf-8?B?SnJTb3ZjR2pWYmtURFJ4YVhUa0pBVHBhSlFERFVJVGpKaWpOZlJURE5UVnBh?=
 =?utf-8?B?WDlHZ3l3bnhKeTdFZEpNRWhnYW5QVXhDb2xsRm9rSW9sOUpZT0dHOXhCeG1s?=
 =?utf-8?B?a2RkRzljQUR4T1J0cGNrVEczNXR5ZHdTY0FEcWNpMkQwc2ticFMrS3RQellC?=
 =?utf-8?B?bHliT21MWE0ydDlCaFNJMHNHQzRObUUyY05XMXFyUlFJNXhpZW1Wck9BOGti?=
 =?utf-8?B?MTNQaGNGZ0IzWS81VHlmTU9pMGRWaEluUmRVcmNUOVhrd1NiRU9BTFRZLzRl?=
 =?utf-8?B?cElhRUh5NlFic0xVK1hUWVlxTTM5VzRBaVRHSTJsV2VoRnl4VkF2U1ArYW95?=
 =?utf-8?B?dW9hQVgvSDgxd1lORnZzT2ZpVm1PUjlwdk44SGRkMFh3VEtpbVZNQzZIRS8y?=
 =?utf-8?B?YlduQjFHcFVxbjUxSDU2cFloRXkweVJGZjFCajhBRFR5UG5wSVdCVjdDR2Fy?=
 =?utf-8?B?ZU5SNE1LWFJxVHpLNGI1ZUNUQWJOR0tWcVZJczFsaHo5bnQrUGNwOFZoQUJz?=
 =?utf-8?B?SlRGMUFFUnRGQXcrTkVrS1FPNFlrSXNkWHZiZ1FsMXFTMjNoM2JNemRadUh1?=
 =?utf-8?B?WHBTY0duQmxNM1g5RDAzeW1yUTNDbzFOZEJiOHFlM2xrbzVJR09sNVNNSGRq?=
 =?utf-8?B?cVFUSjZEZEU1NzhNdEFtVURwQjJpdjJlUXlWZVlpUjlYV3NFMXpnMmdXY1lF?=
 =?utf-8?B?T1ZHNWxNRFVOSmJIWU5oamJXbnZVVnN2bTJpc0RCeFdoZ2VYb05JS2VkakdL?=
 =?utf-8?B?U0czdzJJcHhaUGVpVWpNbkxmd24vMm01eUcyS20zeWdqZU9IcXZGMVZrUEI5?=
 =?utf-8?B?cmxweFgyT2tjSTVVL3VMc2hpQVphd2JkMG51VFB4L0RybVUzQVpIcE1mTDYx?=
 =?utf-8?B?TnJ1cWsyalM5NjJqY1ErdzJ3L0MvZGduT1U3YWNYdEFpMmxzNnQwTm11Ykwx?=
 =?utf-8?B?VFBUVXZFRC9lZGVWRGVQelN4aGFxV1cvQVdhdjk5czczOXk1QkJqRjdpbmpI?=
 =?utf-8?B?L0JFM2pRUnQ4NFlPTkJMejFiKythMVRsa0ovOGRiZXIyZTI0MWh1Zzk2VkVw?=
 =?utf-8?B?QkwxbEM1MlpmT25xU2lTd3FEdzFJT1ZkMGxXM0xMMjlOaWhpWkljbytxcU8y?=
 =?utf-8?B?VUN4eWw0WUxGWURuM1o2cUcva1pxUHhjL2xLSmV6NDlzTVpWcjJSUzdMelF1?=
 =?utf-8?B?L2VyMzdCMm1RN3BCYWZRNEtGbnd6NzJyZW14ZW1TVU5oOWlHZzNHVElDV0NK?=
 =?utf-8?B?SzFHUjJ3eDV3NGhzNHVJaThsOXBSZE94bXVkanI1SzJqeDZSTzYvOThKc2E0?=
 =?utf-8?B?U3VSOExVS0xid25NSVh0ZUdWTHZ6UmNtd3NMaEFweEQzeUxTOE1SMDh2bU1l?=
 =?utf-8?B?MVYwZ2FQY2FCeUdVRXBsL3dDUzFKam93cC94SWRkemU4WmFHdlQySkpsMlpp?=
 =?utf-8?B?UUhDUTd3L1FpK2JZckN6SzBvZW50Ym90MmRGNVlXa1FGV1NjMSt5NS9xdzB4?=
 =?utf-8?B?RDk1Wjl1Rm92dW1sNGNLUlc3TGI4aFd3T1hXalgvUlhYSy9YbGZOTXQzN2Yx?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F26563C70939EE47B600520999A308BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e46d6a1e-8f87-4756-1c92-08da8f21b12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 09:33:29.5225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hM+O8RMrH6liverELTlDeq+JilaKKYx2alLJOK3HOEhGSoD/VrPATMGT/tFwWrl5yNjO4jxFkWaNexil3Qyab6Is8rlkLSi1SLiKfLAdmGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2465
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA5LzIwMjIgw6AgMTA6MzcsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IE9uIDAzLjA5LjIyIDA5OjA3LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4gK1Jlc2Vu
ZGluZyB3aXRoIHZhbGlkIHBvd2VycGMgbGlzdCBhZGRyZXNzDQo+Pg0KPj4gTGUgMDIvMDkvMjAy
MiDDoCAyMDo1MiwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoNCj4+Pj4+PiBBZGRpbmcg
Q2hyaXN0b3BoZSBvbiBDYzoNCj4+Pj4+Pg0KPj4+Pj4+IENocmlzdG9waGUgZG8geW91IGtub3cg
aWYgaXNfaHVnZXBkIGlzIHRydWUgZm9yIGFsbCBodWdldGxiIA0KPj4+Pj4+IGVudHJpZXMsIG5v
dA0KPj4+Pj4+IGp1c3QgaHVnZXBkPw0KPj4NCj4+IGlzX2h1Z2VwZCgpIGlzIHRydWUgaWYgYW5k
IG9ubHkgaWYgdGhlIGRpcmVjdG9yeSBlbnRyeSBwb2ludHMgdG8gYSBodWdlDQo+PiBwYWdlIGRp
cmVjdG9yeSBhbmQgbm90IHRvIHRoZSBub3JtYWwgbG93ZXIgbGV2ZWwgZGlyZWN0b3J5Lg0KPj4N
Cj4+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgaWYgdGhlIGRpcmVjdG9yeSBlbnRyeSBpcyBub3Qg
cG9pbnRpbmcgdG8gYW55DQo+PiBsb3dlciBkaXJlY3RvcnkgYnV0IGlzIGEgaHVnZSBwYWdlIGVu
dHJ5LCBwWGRfbGVhZigpIGlzIHRydWUuDQo+Pg0KPj4NCj4+Pj4+Pg0KPj4+Pj4+IE9uIHN5c3Rl
bXMgd2l0aG91dCBodWdlcGQgZW50cmllcywgSSBndWVzcyBwdGR1bXAgc2tpcHMgYWxsIA0KPj4+
Pj4+IGh1Z2V0bGIgZW50cmllcy4NCj4+Pj4+PiBTaWdoIQ0KPj4NCj4+IEFzIGZhciBhcyBJIGNh
biBzZWUsIHB0ZHVtcF9wWGRfZW50cnkoKSBoYW5kbGVzIHRoZSBwWGRfbGVhZigpIGNhc2UuDQo+
Pg0KPj4+Pj4NCj4+Pj4+IElJVUMsIHRoZSBpZGVhIG9mIHB0ZHVtcF93YWxrX3BnZCgpIGlzIHRv
IGR1bXAgcGFnZSB0YWJsZXMgZXZlbiANCj4+Pj4+IG91dHNpZGUNCj4+Pj4+IFZNQXMgKGZvciBk
ZWJ1Z2dpbmcgcHVycG9zZXM/KS4NCj4+Pj4+DQo+Pj4+PiBJIGNhbm5vdCBjb252aW5jZSBteXNl
bGYgdGhhdCB0aGF0J3MgYSBnb29kIGlkZWEgd2hlbiBvbmx5IGhvbGRpbmcgdGhlDQo+Pj4+PiBt
bWFwIGxvY2sgaW4gcmVhZCBtb2RlLCBiZWNhdXNlIHdlIGNhbiBqdXN0IHNlZSBwYWdlIHRhYmxl
cyBnZXR0aW5nDQo+Pj4+PiBmcmVlZCBjb25jdXJyZW50bHkgZS5nLiwgZHVyaW5nIGNvbmN1cnJl
bnQgbXVubWFwKCkgLi4uIHdoaWxlIGhvbGRpbmcNCj4+Pj4+IHRoZSBtbWFwIGxvY2sgaW4gcmVh
ZCB3ZSBtYXkgb25seSB3YWxrIGluc2lkZSBWTUEgYm91bmRhcmllcy4NCj4+Pj4+DQo+Pj4+PiBU
aGF0IHRoZW4gcmFpc2VzIHRoZSBxdWVzdGlvbnMgaWYgd2UncmUgb25seSBjYWxsaW5nIHRoaXMg
b24gDQo+Pj4+PiBzcGVjaWFsIE1Ncw0KPj4+Pj4gKGUuZy4sIGluaXRfbW0pIHdoZXJlYnkgd2Ug
Y2Fubm90IHJlYWxseSBzZWUgY29uY3VycmVudCBtdW5tYXAoKSBhbmQNCj4+Pj4+IHdoZXJlIHdl
IHNob3VsZG4ndCBoYXZlIGh1Z2V0bGIgbWFwcGluZ3Mgb3IgaHVnZXBkIGVudHJpZXMuDQo+Pg0K
Pj4gQXQgbGVhc3Qgb24gcG93ZXJwYywgUFREVU1QIGhhbmRsZXMgb25seSBpbml0X21tLg0KPj4N
Cj4+IEh1Z2VwYWdlIGFyZSB1c2VkIGF0IGxlYXN0IG9uIHBvd2VycGMgOHh4IGZvciBsaW5lYXIg
bWVtb3J5IG1hcHBpbmcsIHNlZQ0KPj4NCj4+IGNvbW1pdCAzNDUzNmQ3ODA2ODMgKCJwb3dlcnBj
Lzh4eDogQWRkIGEgZnVuY3Rpb24gdG8gZWFybHkgbWFwIGtlcm5lbA0KPj4gdmlhIGh1Z2UgcGFn
ZXMiKQ0KPj4gY29tbWl0IGNmMjA5OTUxZmE3ZiAoInBvd2VycGMvOHh4OiBNYXAgbGluZWFyIG1l
bW9yeSB3aXRoIGh1Z2UgcGFnZXMiKQ0KPj4NCj4+IGh1Z2VwZHMgbWF5IGFsc28gYmUgdXNlZCBp
biB0aGUgZnV0dXJlIHRvIHVzZSBodWdlIHBhZ2VzIGZvciB2bWFwIGFuZA0KPj4gdm1hbGxvYywg
c2VlIGNvbW1pdCBhNmE4ZjdjNGFhN2UgKCJwb3dlcnBjLzh4eDogYWRkIHN1cHBvcnQgZm9yIGh1
Z2UNCj4+IHBhZ2VzIG9uIFZNQVAgYW5kIFZNQUxMT0MiKQ0KPj4NCj4+IEFzIGZhciBhcyBJIGtu
b3csIHBwYzY0IGFsc28gdXNlIGh1Z2UgcGFnZXMgZm9yIFZNQVAgYW5kIFZNQUxMT0MsIHNlZQ0K
Pj4NCj4+IGNvbW1pdCBkOTA5ZjkxMDljMzAgKCJwb3dlcnBjLzY0cy9yYWRpeDogRW5hYmxlIEhB
VkVfQVJDSF9IVUdFX1ZNQVAiKQ0KPj4gY29tbWl0IDhhYmRkZDk2OGEzMCAoInBvd2VycGMvNjRz
L3JhZGl4OiBFbmFibGUgaHVnZSB2bWFsbG9jIG1hcHBpbmdzIikNCj4gDQo+IFRoZXJlIGlzIGEg
ZGlmZmVyZW5jZSBiZXR3ZWVuIGFuIG9yZGluYXJ5IGh1Z2UgbWFwcGluZyAoZS5nLiwgYXMgdXNl
ZCANCj4gZm9yIFRIUCkgYW5kIGEgYSBodWdldGxiIG1hcHBpbmcuDQo+IA0KPiBPdXIgY3VycmVu
dCB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaHVnZXBkIG9ubHkgYXBwbGllcyB0byBodWdldGxiLiAN
Cj4gV291bGRuJ3Qgdm1hcC92bWFsbG9jIHVzZXIgb3JkaW5hcnkgaHVnZSBwbWQgZW50cmllcyBp
bnN0ZWFkIG9mIGh1Z2VwZD8NCj4gDQoNCidodWdlcGQnIHN0YW5kcyBmb3IgaHVnZSBwYWdlIGRp
cmVjdG9yeS4gSXQgaXMgaW5kZXBlbmRhbnQgb2Ygd2hldGhlciBhIA0KaHVnZSBwYWdlIGlzIHVz
ZWQgZm9yIGh1Z2V0bGIgb3IgZm9yIGFueXRoaW5nIGVsc2UsIGl0IHJlcHJlc2VudHMgdGhlIA0K
d2F5IHBhZ2VzIGFyZSBkZXNjcmliZWQgaW4gdGhlIHBhZ2UgdGFibGVzLg0KDQpJIGRvbid0IGtu
b3cgd2hhdCB5b3UgbWVhbiBieSBfb3JkaW5hcnlfIGh1Z2UgcG1kIGVudHJ5Lg0KDQpMZXQncyB0
YWtlIHRoZSBleGVtcGxlIG9mIHBvd2VycGMgOHh4IHdoaWNoIGlzIHRoZSBvbmUgSSBrbm93IGJl
c3QuIFRoaXMgDQppcyBhIHBvd2VycGMzMiwgc28gaXQgaGFzIHR3byBsZXZlbHMgOiBQR0QgYW5k
IFBURS4gUEdEIGhhcyAxMDI0IGVudHJpZXMgDQphbmQgZWFjaCBlbnRyeSBjb3ZlcnMgYSA0TWJ5
dGVzIGFyZWEuIE5vcm1hbCBQVEUgaGFzIDEwMjQgZW50cmllcyBhbmQgDQplYWNoIGVudHJ5IGlz
IGEgNGsgcGFnZS4gV2hlbiB5b3UgdXNlIDhNYnl0ZXMgcGFnZXMsIHlvdSBkb24ndCB1c2UgUFRF
cyANCmFzIGl0IHdvdWxkIGJlIGEgd2FzdGUgb2YgbWVtb3J5LiBZb3UgdXNlIGEgaHVnZSBwYWdl
IGRpcmVjdG9yeSB0aGF0IGhhcyANCmEgc2luZ2xlIGVudHJ5LCBhbmQgeW91IGhhdmUgdHdvIFBH
RCBlbnRyaWVzIHBvaW50aW5nIHRvIHRoZSBodWdlIHBhZ2UgDQpkaXJlY3RvcnkuDQoNClNvbWUg
dGltZSBhZ28sIGh1cGdlcGQgd2FzIGFsc28gdXNlZCBmb3IgNTEya2J5dGVzIHBhZ2VzIGFuZCAx
NmtieXRlcyANCnBhZ2VzOg0KLSB0aGVyZSB3YXMgaHVnZSBwYWdlIGRpcmVjdG9yaWVzIHdpdGgg
OHggNTEya2J5dGVzIHBhZ2VzLA0KLSB0aGVyZSB3YXMgaHVnZSBwYWdlIGRpcmVjdG9yaWVzIHdp
dGggMjU2eCAxNmtieXRlcyBwYWdlcywNCg0KQW5kIHRoZSBQR0QvUE1EIGVudHJ5IHBvaW50cyB0
byBhIGh1Z2UgcGFnZSBkaXJlY3RvcnkgKEhVR0VQRCkgaW5zdGVhZCANCm9mIHBvaW50aW5nIHRv
IGEgcGFnZSB0YWJsZSBkaXJlY3RvcnkgKFBURSkuDQoNClNpbmNlIGNvbW1pdCBiMjUwYzhjMDhj
NzkgKCJwb3dlcnBjLzh4eDogTWFuYWdlIDUxMmsgaHVnZSBwYWdlcyBhcyANCnN0YW5kYXJkIHBh
Z2VzLiIpLCB0aGUgOHh4IGRvZXNuJ3QgdXNlIGFueW1vcmUgaHVnZXBkIGZvciA1MTJrIGh1Z2Ug
DQpwYWdlLCBidXQgb3RoZXIgcGxhdGZvcm1zIGxpa2UgcG93ZXJwYyBib29rM2UgZXh0ZW5zaXZl
bHkgdXNlIGh1Z2UgcGFnZSANCmRpcmVjdG9yaWVzLg0KDQpJIGhvcGUgdGhpcyBjbGFyaWZpZXMg
dGhlIHN1YmplY3QsIG90aGVyd2lzZSBJJ20gaGFwcHkgdG8gcHJvdmlkZSANCmZ1cnRoZXIgZGV0
YWlscy4NCg0KQ2hyaXN0b3BoZQ==
