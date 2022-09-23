Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF35E7380
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 07:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYh4d1SByz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 15:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zSuejT1r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zSuejT1r;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYh3t73Gbz2yxd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 15:46:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHavOFJ2r3xfx6rdNpSQdFoilGpc0pvPDDKMtUFwwL6fmNSQjyxEy3pbKzJ4PRSKPix0QOX1NduQOwf0xgSV8pLIoxzop1P6pPoBtSSTnnuPbViIuISqPmFJzmRVUpnuDFMQYHgn4TPlYiiEmleOp7j6b/DcYEJaX0h1OoQ+MsOA4Owo1bGXwXzs/8P06QtcIqLX8TEbfOBKi3rNTf33nf3IYLv5j5vutkoLhV7R1vnxf+KUY1jWAu5DQElJXcQU2AqGeagcN0uDH7/+mBY8p3vSF/IXR8hQB0aH2KmNEAHjXkgFpIY2j+qNVvcLPtGwKDppWPttqFeqVyutL95TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQnSHwXv1dvckAEOC0GXMXps3pYusPumdnmX4ptfET8=;
 b=BBtzs+dtqbqbr/26Gz7p6mDIn4ZSq3XF5lSJfcLj5oHBuDIvKpDk7qa51rMyBHVfULMIJv6xWGkeeqG6yb/1whe2jWYaGH4L9gCnJnozmjHz7MfOqkl1hJA0NkFiWhoNU15XwyiO4MiuajEyz2F2zaThBa+CHPD09lSvutCUKkvOlLfnn7Hda/e9tEVFE18pMfW9wDn2ZnUk1QM9w17dIQcDKwU1XaLlA6PFMc8N/N6TxYeApa7UjQ9m30f/AWvK9u1T7p3T0jegNKCld8BhDYR4HVCxCx0BE+qQUQKAYYFQz1IIro9EWfhBco8O1WSzYvnhiX160F5LMv7tt+BiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQnSHwXv1dvckAEOC0GXMXps3pYusPumdnmX4ptfET8=;
 b=zSuejT1rfTTYN1oQc3T0Yi8cFXg/AUu5lY2+3KVwJz+k1uaEfxgEIc0Ia2+UWuWYhstLq6Xuym0XSC1HvOciZxioeo+95HhS/uxzTKKzVzg+Ze1Co/NtpYnFwSArBbjCCtldYxps6GAK7MqXM7xCfNg9IxEx6oxpsuuLv0KnlAlkyWoE8vsRM60wRZSWYZmYR6YfXW0hc779JQ2y6gPDu4t9KIxh2n5jpFJPFf8gMVWBwtfORAbyRJKphS8EiYXTFf9mbnueCNePSQ8pVO9X85LrrX+bGLUwg+tSEGxIoBcU5gqh56Qc8FCNAuVouB9N5A0fsg13gZk3WLhY+UteGg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2385.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Fri, 23 Sep
 2022 05:46:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 05:46:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Thread-Topic: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Thread-Index: AQHYzvze6FBIhdsQoEmVA7xyGURQl63sga4A
Date: Fri, 23 Sep 2022 05:46:30 +0000
Message-ID: <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu>
References: <20220923033004.536127-1-npiggin@gmail.com>
In-Reply-To: <20220923033004.536127-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2385:EE_
x-ms-office365-filtering-correlation-id: 58cbbc26-dfe9-45e6-b486-08da9d26f72c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z+e4Uy6lOfBpb6LQ+AtTE8mwV96tykp8Hy+Fq58PPDuCqhsbJmLVkx3jGHuiMaD0BhrLnKXUp14HOHIDFbCm0YXx99n+e/3zHjU+ffbVsAN80L3PbWdw+NjsnWqnJDXLcQdWFSg+Ib/YGvhsL6/5I0Vgryk1+fzgh+zzCoxiB5WQw+0o2lsH238kRu3mAh1IG5wzE0/XJ2FlWUppK+1zIHUSN1XKAWpA6haqFxXPM3dRd0m+cMrRHCSwI8vsKf4PIbSfbN4CBeIYZKOyf6l7r+gXavniEr11WKmG026WZfJtA8wDWpDfNQI7qJZ6iTn/4/QmprU3EcAYl0s6nXnseZQ9DVnhCMf5+7EPvBs0tZkEqzOcyI8qwNXMCBrglXAAGg9zDZ66pNc7GakuUtxDxJDN53sNInoEE2wZiPYHMWQKFWhmEvHl3z4M+PKsWF5fWfwVyoL+Ut7iGBkshR0wofnkKZVet39yEgUk8XFJh7kQ3ah6XOIEBvwrDgcJgZuuE6n1T/JHFEkQu0nzFSOVXZLkxWxLZATaKyy3fj0TBFOw9ocujgKO6quoD/1dgDin+Ewm9h6G8rpRZ+cKINITm4geNbowFBEheuo/Imwh5DPsDFC7h9fRFHgNUfg7hXQcrt6/BEafqTlDCd6X8rg7gpz+ByqgqGnTESwzdisSYloaURf36R2bNQddWQc/10xuzmokCNwtFpk9TYPcqLaTKhiZRpHpUxmLUSUE0fz02OyEDxdz7Vs1EvlBJHAMuummxKq6Q6lVnqZh5uzlcwvStdC5q9ebk8usb8cQhK6rNSmT/+gfbyznOfo/aLCiZxm3xWKDCW9T8jzAXKHD0ReU5Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(44832011)(2906002)(26005)(6512007)(86362001)(31696002)(6506007)(8936002)(5660300002)(41300700001)(122000001)(38100700002)(66574015)(38070700005)(2616005)(36756003)(186003)(83380400001)(316002)(6486002)(110136005)(31686004)(91956017)(76116006)(66556008)(66476007)(66946007)(66446008)(64756008)(8676002)(71200400001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d2Vsai85NTRTMFpJN1ZGdFNuaXVaU2toS1ErMjR2Tm1leDQ1ejhMdk8xVHpx?=
 =?utf-8?B?YkhpaTk0WnNQM3lvZWxQTUorSHB6S0lGTVQxdExsb01FZ2VLRk5pOUJBSVE1?=
 =?utf-8?B?c0gyTWhCN2FURzFpYmpuOW81bWREK2QrdVlDdUFMY1gvT3lMcHU4RWg0aU80?=
 =?utf-8?B?NHkzYlVHNDQzZWNzd3BRL3dlZldPa21Ed1dKZHlLY3BOTkVRSGxvNWlXdUFW?=
 =?utf-8?B?ZHFHeVkzazVrNWZNSFFIblVDNnBoTFFpS0xUZDJieVBvYW52UTB0ZURreHNO?=
 =?utf-8?B?eGhFY0dhZ1NDcnhCWUhWSmZFVGczNzBqdnVBazVqZnZHbzd1SlVIZ29RU3ZB?=
 =?utf-8?B?S05DN3FUWEpXdUl4NmRPTUYxWTBhanNSZEJnU0RvOFFiR0ppU1FzbzNjUEIy?=
 =?utf-8?B?YjNoM2tBcGY4OEZrTFJJcEtoa0pxYzEzYUJremhRME9Qek9PVUY5V3lKbkJy?=
 =?utf-8?B?V2lqM0FWOWNnUWtrWnlla2JVUmpGZjE2bytDQUp6aWErWEJvK3dUWGwvcUNz?=
 =?utf-8?B?NWNRL0JqUTk2UWJiVTdjWHFTd2UyZXBlSmFya2FXeXQrak1zWVVIbURBcTM5?=
 =?utf-8?B?WWlCTHhmTkxUTVgxeGZNM0hXQ3AzRk5QdWpvN1ovUE9MK2NzMnJxQytUL09l?=
 =?utf-8?B?V3hEOWswd3VURjloTnJ2MUxNSS9RQWhpN0lUaEV6WFB1UEN2OWU2VkwzWmZa?=
 =?utf-8?B?eWVYNmNJQW1KMmtCcnNBZlp5MUpHRnRqdmFvU1hwVHY0cTJuVDVVejlOdGtY?=
 =?utf-8?B?T1FVb2xEOFVpRVRnMml2anIwN0Z6YjB4ZXRPSnlhWEQ2ZEROZGtaSjV1ZGtZ?=
 =?utf-8?B?UjlXWDV6NjN4dEhEUHdPcmxZSXVSaHg1R2hzeEFmdlowdEgwUy93SW1VUGxv?=
 =?utf-8?B?bGFpSUo0WUpKZTgvdFVpT24zK2NLdVdFNU91SU8yRmpTN1ovZ1BuNmpEMXJS?=
 =?utf-8?B?Q2JSeWVIOWRuL25mMGliQmh4QkxKV2ViVnJrdWs5SjkyOXFxMUE4aFN5bGtG?=
 =?utf-8?B?NTJ4NTR5MUFXUnZtQ1daR3RiZExQNTNNdUdWenZZeHpHMEVsTUw5by90RjJ4?=
 =?utf-8?B?cnd0ZUZNY2RCdnVMT08xUWlKVU1FQjl6TE1qRWFoaWNTcDk2VThQU29TMVRy?=
 =?utf-8?B?cEVCNDJUdEMvQnVBVGs1MDFib1VHRElSc29iOE5lcjd2cHBwM3hKQ29xMktu?=
 =?utf-8?B?T2ZIdkNzTC8wSjJRbXlTSFpTOWwyWXVSckppVEZmbXFTNXc0RklsODh5S1Ax?=
 =?utf-8?B?VjhHU0prcG1jdHFEaTg2a0xmM3RtRHBVNWM5VXBVeklPNkpER1FtR3paU0lt?=
 =?utf-8?B?cktoa08rV1dBTGdWQ2Zmb2swMlBHRFplQ3dLVFVCZUMrQVA3S1VZMXYrT2RY?=
 =?utf-8?B?eTZWaDFRU0xQWHZpdm9Fdks3VWJ1ZGpkVDViTWhBMnJodkM3VjVPdEtBazVW?=
 =?utf-8?B?WTlxM25ocDhmTHA3OFRELzdTREdCY0pQcDNCMnQ3SnZWUG5laHJvbzJvSXhB?=
 =?utf-8?B?Zmd1aHNKeFQyaVl5MEFmemRQUlNKRXlQaG5xVG1SeW8vdW9keWFXcUdxclM3?=
 =?utf-8?B?ejNHUEh0WU9kdnhWZjBWTGhLL3FsUmZtSTgydVl5WXNpa2hSNzZKMk0yWjZL?=
 =?utf-8?B?cXE5VDNSVTQ4Mm1YZUZOaHRPSVZpNXZsMVlOMjV3VVl4MUJIZGVVR2YwRnQ4?=
 =?utf-8?B?NzB3NS8rM1d1aFJkbFdQUzlYZlRsa3p6KzNDTFhtWUh3aU9ORU5DVklpYklo?=
 =?utf-8?B?a09JWTF0SFhqeERhOEJ3VytrK1JLTVdOeHNNUUo3TjZHODJ2N1V5UHZnSUk4?=
 =?utf-8?B?RUpxT1NLZWNjelVKMGZ3bnM0aWhUZnpvazJoeEtwVStmZ1hwSVZrcWxYL1hr?=
 =?utf-8?B?MEJLZHR5dTFSU005Y2Z0ZUpkUGl2aENQUWYzZEJzbTF6SzNZQ2htOHhoWmpT?=
 =?utf-8?B?U0ZJTm1DcGI4YkFqQXZ6SUN4cnJVc0hPNU90cmZxMklHVy9QYWxaM25XWkc4?=
 =?utf-8?B?MmNjZ0tKbncxOUJhRkVxcHFxY1lOSS8yOTdDd1pUcVZ4c2JIZWNoMENMcUdH?=
 =?utf-8?B?VjRMQXd2aE9VemxucTU2RlFQem5LQWdCU3BGZGNwNEhnZ1hPV3o4ZE5Mdmh6?=
 =?utf-8?B?V1lQZHN5YzNta1hoU3JDS21NL083bkdlN0NmdUFhMzlGemNFUGpEMTFGNUNj?=
 =?utf-8?Q?z2A540qA3VldLOG/l94ztPs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABB08E029FBEEE4AB7EFA959A26036BF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cbbc26-dfe9-45e6-b486-08da9d26f72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 05:46:30.7410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+BpL0M+OhIaNwVo3inSQd0GtLU9qZl0cOWBiVIn9rx1++awnRcBDpO5/OgRPL+EumWUi3DELNE/TfxdgEUqJSCt5CWOsahwe6O3EHNxFNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2385
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

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMDU6MzAsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBUaGlzIGFkZHMgYmFzaWMgUE9XRVIxMF9DUFUgb3B0aW9uLCB3aGljaCBidWlsZHMgd2l0aCAt
bWNwdT1wb3dlcjEwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGln
Z2luQGdtYWlsLmNvbT4NCj4gLS0tDQo+IFRoZXJlJ3MgcXVpdGUgYSBsb3Qgb2YgYXNtIGFuZCBs
aW5rZXIgY2hhbmdlcyBzbGF0ZWQgZm9yIHRoZSBuZXh0IG1lcmdlDQo+IHdpbmRvdyBhbHJlYWR5
IHNvIEkgbWF5IGxlYXZlIHRoZSBwY3JlbCBwYXRjaCBmb3IgbmV4dCB0aW1lLiBJIHRoaW5rIHdl
DQo+IGNhbiBhZGQgdGhlIGJhc2ljIFBPV0VSMTAgYnVpbGQgb3B0aW9uIHRob3VnaC4NCj4gDQo+
IFRoYW5rcywNCj4gTmljaw0KPiANCj4gICBhcmNoL3Bvd2VycGMvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICB8IDcgKysrKysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5j
cHV0eXBlIHwgOCArKysrKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvTWFrZWZp
bGUgYi9hcmNoL3Bvd2VycGMvTWFrZWZpbGUNCj4gaW5kZXggOGEzZDY5YjAyNjcyLi5lYTg4YWYy
NmY4YzYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0KPiArKysgYi9hcmNo
L3Bvd2VycGMvTWFrZWZpbGUNCj4gQEAgLTE5Miw5ICsxOTIsMTQgQEAgaWZkZWYgQ09ORklHXzQ3
NkZQRV9FUlI0Ng0KPiAgIAkJLVQgJChzcmN0cmVlKS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzQ0
eC9wcGM0NzZfbW9kdWxlcy5sZHMNCj4gICBlbmRpZg0KPiAgIA0KPiAtIyBObyBBbHRpVmVjIG9y
IFZTWCBpbnN0cnVjdGlvbnMgd2hlbiBidWlsZGluZyBrZXJuZWwNCj4gKyMgTm8gcHJlZml4IG9y
IHBjcmVsDQo+ICtLQlVJTERfQ0ZMQUdTICs9ICQoY2FsbCBjYy1vcHRpb24sLW1uby1wcmVmaXhl
ZCkNCg0KV2UgaGF2ZSBsb3RzIG9mIGNvZGUgdG8gaGFuZGxlIHByZWZpeGVkIGluc3RydWN0aW9u
cyBpbiBjb2RlX3BhdGNoaW5nLCANCmFuZCB0aGF0IGNvZGUgY29tcGxleGlmaWVzIHN0dWZmIGFu
ZCBoYXMgYSBwZXJmb3JtYW5jZSBpbXBhY3QuDQpBbmQgaXQgaXMgb25seSBwYXJ0aWFsbHkgdGFr
ZW4gaW50byBhY2NvdW50LCBhcmVhcyBsaWtlIGZ0cmFjZSBkb24ndCANCnByb3Blcmx5IHRha2Ug
Y2FyZSBvZiBwcmVmaXhlZCBpbnN0cnVjdGlvbnMuDQoNClNob3VsZCB3ZSBnZXQgcmlkIG9mIHBy
ZWZpeGVkIGluc3RydWN0aW9uIHN1cHBvcnQgY29tcGxldGVseSBpbiB0aGUgDQprZXJuZWwsIGFu
ZCBjb21lIGJhY2sgdG8gbW9yZSBzaW1wbGUgY29kZSA/DQoNCj4gK0tCVUlMRF9DRkxBR1MgKz0g
JChjYWxsIGNjLW9wdGlvbiwtbW5vLXBjcmVsKQ0KPiArDQo+ICsjIE5vIEFsdGlWZWMgb3IgVlNY
IG9yIE1NQSBpbnN0cnVjdGlvbnMgd2hlbiBidWlsZGluZyBrZXJuZWwNCj4gICBLQlVJTERfQ0ZM
QUdTICs9ICQoY2FsbCBjYy1vcHRpb24sLW1uby1hbHRpdmVjKQ0KPiAgIEtCVUlMRF9DRkxBR1Mg
Kz0gJChjYWxsIGNjLW9wdGlvbiwtbW5vLXZzeCkNCj4gK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxs
IGNjLW9wdGlvbiwtbW5vLW1tYSkNCj4gICANCj4gICAjIE5vIFNQRSBpbnN0cnVjdGlvbiB3aGVu
IGJ1aWxkaW5nIGtlcm5lbA0KPiAgICMgKFdlIHVzZSBhbGwgYXZhaWxhYmxlIG9wdGlvbnMgdG8g
aGVscCBzZW1pLWJyb2tlbiBjb21waWxlcnMpDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZp
Zy5jcHV0eXBlDQo+IGluZGV4IDQwMTdiZTcyZTQ2Zi4uMWY3YzkwM2VhNjY0IDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZQ0KPiArKysgYi9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZQ0KPiBAQCAtMTcxLDYgKzE3MSwxMSBA
QCBjb25maWcgUE9XRVI5X0NQVQ0KPiAgIAlkZXBlbmRzIG9uIFBQQ19CT09LM1NfNjQNCj4gICAJ
c2VsZWN0IEFSQ0hfSEFTX0ZBU1RfTVVMVElQTElFUg0KPiAgIA0KPiArY29uZmlnIFBPV0VSMTBf
Q1BVDQo+ICsJYm9vbCAiUE9XRVIxMCINCj4gKwlkZXBlbmRzIG9uIFBQQ19CT09LM1NfNjQNCj4g
KwlzZWxlY3QgQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSDQo+ICsNCj4gICBjb25maWcgRTU1MDBf
Q1BVDQo+ICAgCWJvb2wgIkZyZWVzY2FsZSBlNTUwMCINCj4gICAJZGVwZW5kcyBvbiBQUEM2NCAm
JiBFNTAwDQo+IEBAIC0yMzksNiArMjQ0LDcgQEAgY29uZmlnIFRBUkdFVF9DUFUNCj4gICAJZGVm
YXVsdCAicG93ZXI3IiBpZiBQT1dFUjdfQ1BVDQo+ICAgCWRlZmF1bHQgInBvd2VyOCIgaWYgUE9X
RVI4X0NQVQ0KPiAgIAlkZWZhdWx0ICJwb3dlcjkiIGlmIFBPV0VSOV9DUFUNCj4gKwlkZWZhdWx0
ICJwb3dlcjEwIiBpZiBQT1dFUjEwX0NQVQ0KPiAgIAlkZWZhdWx0ICI0MDUiIGlmIDQwNV9DUFUN
Cj4gICAJZGVmYXVsdCAiNDQwIiBpZiA0NDBfQ1BVDQo+ICAgCWRlZmF1bHQgIjQ2NCIgaWYgNDY0
X0NQVQ==
