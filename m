Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321B73B017
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:34:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=afKOKduv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQsR1xW4z3cCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:34:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=afKOKduv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQqW6Cp5z3bcL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:32:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI/FWn3TUvTxvgiV4HQ7fiVsIT3Yh1hTEfGHvqQGQR90FUwxOOY2lDoVZLa5/qq+oUYg6ypFV1Ztbvn7ojN1rMJDevIQZCLbOWZLHtAhvvuLkZEiVY3oFPK+8qztaBThVhKr0rlEK8mpAayNsOXqSPXtBQsUECQggnuZ3X592gIaL4OyzpawYMWIh//FAGQL91HeuETcyErbpGP/Yz94VHK1wwrwmpbh2u31eoSGBDAZoYylYnCWtD7Vj2Nk3GU0tvxLiR3o/o06hYbvGa9LxAGj1wuXTVzMzgouH97swc4Bnfrkf4NuovMeridnC9fvcn4EOdjhO1GYi+yVGPEocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAXjH0Ls4eUofltqgt2Zdu5AQjTpJ72pkHcNNqZuwns=;
 b=VLmy4Nm2IBPCwaM5p58iUMWPItjG1/sitFFW1+U+Gwcv/Yp0ySVLG9klALCi+Lahx9oHITDpylV2lCMNlBKDGwFBe6m0fQKPab34bnR0BpLBEy9PUBSqPAetfukudfLRhRriRruAB7fPKNYWpW8qrS+2wwM5vj/3CIPG00UBVYU70wTkXy3BDf40qzC0nVIC6OapfxNPrhH6Uo0ItOI0pkhy00lUcTyK+tKCDCz1MvRlaFG6aZRj/WsMJ88JRaSGW82zG9jliUkZcaxjFONOwcUQTPnxIEWeWC2a4QW/+517vD8C1XOk+KufFWw7fDAn+snDIw4SAvzbpe0LhYge0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAXjH0Ls4eUofltqgt2Zdu5AQjTpJ72pkHcNNqZuwns=;
 b=afKOKduv0QTCjvm7hjGH08O2rT3A1jr6YHQaAl55JNuw74fDIpzyfENoCsgvE7MYCEej+NxvlxrZc4JIMPOzVvMk45im1u2S2XkfT37Hhc2cIDG0YPRWdHkfUKRVKw/itAbVoDMhm6/06xqIe5AZN6YMGE/0xI38sR3P2isMBmMnzFudTR4BtP09Ny20st+ZhtmhJVzfO6MbGzgdzEfGK6JLOE0saT435bxpTXa8ok6eLeFe4pTHWG4cRomLTlXKEGBzBOqFJAF2csisGl48y4p1SQeUrr7LTogjApDIiU/vacWXJnEjsR2ZhJc262xXRRBch7b31tyComKQmK7KWw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:32:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:32:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 14/17] powerpc/ftrace: Replace use of
 ftrace_call_replace() with ftrace_create_branch_inst()
Thread-Topic: [PATCH 14/17] powerpc/ftrace: Replace use of
 ftrace_call_replace() with ftrace_create_branch_inst()
Thread-Index: AQHZopRIJ1voyLUPLkiyoLf8DLXkn6+X4wGA
Date: Fri, 23 Jun 2023 05:32:21 +0000
Message-ID: <a09d469f-3368-c3e8-c36f-5a50b4da9f4e@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <953513b88fa922ba7a66d772dc1310710efe9177.1687166935.git.naveen@kernel.org>
In-Reply-To:  <953513b88fa922ba7a66d772dc1310710efe9177.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1990:EE_
x-ms-office365-filtering-correlation-id: dafddc47-38ac-4bde-9de5-08db73ab37a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ev/oOSaJIW4wopB+J1yGILuMcY8WcfSwUNUnCVDxYDAaRXVV4yA4KiaS1+ZnVuXFYSzrDAaA2/7DqNMYkAqq5KeYo3RMe3LrDOWDVoUcx8UxuMNrkh7fX+yAEAzmaYV1NptcySu7dRKwxr/0Z3oUFggqLQOIRDter1ZfaGzR2N3FnK+UtrTILjN7xu2GlST2P0ksPVd2dyL7gfqLF6LNEkRfQ0pRuReHm78QDJuUwMX2fTH8uR9ov1VjnwC1VY1X2ip7WW4/ii15LhoRWySR8/CVL8zfpC5H0Wcn39XlvKmM0Vv+6e8cDZJMDuW6blgDGz2XLxr+AGhJFvbTtHLESx+igeeKzK3haI/ZSyn+zyDk8OfFZU7mpdDYCcsB5fUHYeKR2XVbeOq5IigM8MrJl5lPd2qzYipjvcVevhQH4DRzdxH6NbGxHKOERE3ULGd0XKd4JCTYe45tcFnBWiJzAe3xSOarVk/CZgJ1PxeyHV7gQDC0//8ZPXkufwHeG3WZbwd5pPpetcM8b6jW3zWDWV/Bt5y4RAS+l+oYqIaptIhZcHpi+zzMeCtkxc+ZK9CmaALj1VKNP9U/otQX6vQZnkUS/TpUZ3L81nW9dBeSygPK+cy6eFLpgWUq57R9Fs01spp7yUwRhNiGm3u8/T6yRYVnuhn4b5nAzKJ6kIKAhR3W9e8Gw+inxmA4cEtHURy7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(451199021)(478600001)(71200400001)(4326008)(91956017)(76116006)(110136005)(6506007)(186003)(26005)(66946007)(6512007)(2906002)(6486002)(8676002)(8936002)(64756008)(41300700001)(316002)(66556008)(66476007)(66446008)(5660300002)(44832011)(38100700002)(122000001)(38070700005)(31696002)(36756003)(66574015)(2616005)(83380400001)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y1JxMmlIMkNmOVdoRFRBTHFhY3FNMUdocnlpWDhyRklaUHJFbjZKb3h0bEdm?=
 =?utf-8?B?cE9GbzhYVnZ0ZlFSTTNmZWNRMHBUbk5XcDdKTU1hNHVWWnJxNDJsRHBoMEMw?=
 =?utf-8?B?dldWV0Z4a0ZyRnBEMUY4Si9jakNKVkZaLzl1RlFaa2pjTS93NXY1dE84SlNF?=
 =?utf-8?B?RFdtZDJITG5xTnhNTjJBMDkyWlh6T3I2RjZMeFYyQnZzWmlZZytnYXR3MDMz?=
 =?utf-8?B?MkNLQVE4dENFc1ZFZldXdnFWK3E4QnFEeVdvdlhxdjY0cDFVZnFLcktDZTY4?=
 =?utf-8?B?TkdQcHhndHdKRHlMRm9jTEhQZEJQLzNwTlR3QlppMlpYSi9yaGRJeW43MDUx?=
 =?utf-8?B?VmRPdXhGdCtNdkNTNWQrbEJMZXNpS2hRTUZsWkdHWGcrdjEzME02Q0lNejJW?=
 =?utf-8?B?NXIrVitVRFVOS0JYQXc1NjJGbll5c2JZQjVTcTJxN3R6WERkQTRJdFdwK0VC?=
 =?utf-8?B?UmM4MEoyTThzRjZVbHV6V2ZaclV0WXJESkdtbFlNcmR3T1A3dG5GQjJjRmcx?=
 =?utf-8?B?KzV6ZjhUSUN4eDdrTGJ0a0I5YUxKVXZCcHF4Z2VKSjErMWtkRmpxWWljOVVM?=
 =?utf-8?B?bUFsNlZyS3FuYmhVSHlEKzRCbDBCdWxzN2wzUXdjRFF0MXRqTXljMEFUREVs?=
 =?utf-8?B?UWpHQm14S3FLOHRHdTBQTzlsRUtsM29wbWxWRjZnSEJGdS9aeWk3VlYzTlVC?=
 =?utf-8?B?dWF0bDZjcTgzRjFyaExSbmpNd2FONi8wY0U3d05jdEVJYWg3TDJBWmNKSWQ5?=
 =?utf-8?B?aUFaTDZXRjJlMHFnbnhKSXEzWHBUeS9SaEhuU09wUmNmU3VsS2NKNGZrWlFT?=
 =?utf-8?B?QTNjL3RCdkFwUk9EMXdmNEwxb2dZUWdxYTBRMlk5STN5UEo2WCt6WVdaMkNx?=
 =?utf-8?B?cmF3SUdEdHVMMXBxMVVvYlNmRWVtUkpEWStMK2hGR05WbVc1ck9vaHF5QXV0?=
 =?utf-8?B?MzhxNkhoZFo3dE5zUjBQVlc0dFVzeVBxTVVaY0pJWVRxVS92ZmNSVzhZWjU3?=
 =?utf-8?B?OS9pS2FBQ1oyVEQ5cmlvVStlaHI0dy9lWnVSMnlwdSt4VUpqQ1FNT3RSWnBS?=
 =?utf-8?B?d1FHOUdvSUxGVXY5ckR6NThwMnNjdXpXODNabG1UQWNtTGdsQjl0Z2pUbkpz?=
 =?utf-8?B?NDVwVzFZQ0xvK2lKUHB3YVY0M1ljZmI0aGpYOVlEUzE4SjFWbW1rVW1FV1g1?=
 =?utf-8?B?RXBlZ1kvZmpWaTJERnRvQkN4cmFETUkrQUQ5KzQvNjJtWi9WanRING5MQWxQ?=
 =?utf-8?B?MkZYSXRHaGl2RE1RSlppeDBoaDRjSG5SL09IdGNqcEZqSDZQcDJPay9iV0tt?=
 =?utf-8?B?Yzh4MTEvcVdMWUM0UVNJc0Iza3MrK3dtRlFEUE4vQmQwaUJDMXF5YWt6Z2lT?=
 =?utf-8?B?c0U0Mzl2dndUaDA2TUtabi9OVC9IQ0NpSFRGZGE1WjBiMzZpQUtwY0o4YzhD?=
 =?utf-8?B?QnRLZksrckdKM3pRNGt5cmlQTHVMTmlCK1VIWFZqNVpibFlLTUt3V3BBSFYy?=
 =?utf-8?B?YVU3R1ZSQXBlbTZJNHpjQ0xCNzZzY1ErTEVsK2RNOVh0am83N0NKY0tkMGF2?=
 =?utf-8?B?QkVoMlFROTVsWUVHVmtMMUdoOVI2MGorSlBEL0dGdDFMeTVKU21icHBvTVpY?=
 =?utf-8?B?WU1wL2pIMWMxczNHa005dDFKak8rZHI1SVdzZzFqYmRESDB0TXAyTUJ4Lzh3?=
 =?utf-8?B?RlF3OTNUVjlmYkRTTFlBSmszemQzQk9kWTEwcUhCZVp5bTMvUFFYUVJ5cjlo?=
 =?utf-8?B?VnFLUTZVRy8rN1RVTjM1NWx6RkphQXhhblRNUjhBSkxLVDBPTVFuN21aYVJG?=
 =?utf-8?B?THdHdjF2QXF5cEZWamxtc01TVFRKcjRtUHN3dG9rbUxPb1g0YndFZU91RUNI?=
 =?utf-8?B?bzdjdlA5RFEzVy9kR2tXaWIwNkNwWnlMQ3BTdzFNaEI3VEw2VWVKRjZxSE05?=
 =?utf-8?B?YlEyWm5VQXBDUWppMEtiQ3loakZrN0JiWWlGYjhQclRISFFTZExlV0ZlZkVY?=
 =?utf-8?B?a2MrMGwyMk5ld0hNbDA4MWdpZEdxRytoT3dXb0hJS0h5eisrTTFJTlplSFNI?=
 =?utf-8?B?VEd3aWRLZGZNMzM5Vko2SjZtWEQvWEE4VC9SKzJOelZFY2gwTWNzR3NnNExK?=
 =?utf-8?B?VkNQbk5tWTlFTWQzMG9haFhlbU5BZDREOW8vYmpGMjY1bWdscXM1alByUmRm?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E53A4B15FFC70D46AAD68C2BF1BC5DF2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dafddc47-38ac-4bde-9de5-08db73ab37a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:32:21.2677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NyhcvdcAB/N0IOi8R5gHs40J73ZIY2E9vCT81VrS5nIZ6Vfrbs9hmJdaEh7Jd1+3XmcoqrIX15RxyzmDTcKdjsSCptK3ACDdyUtIuOJ21RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1990
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBm
dHJhY2VfY3JlYXRlX2JyYW5jaF9pbnN0KCkgaXMgY2xlYXJlciBhYm91dCBpdHMgaW50ZW50IHRo
YW4NCj4gZnRyYWNlX2NhbGxfcmVwbGFjZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVu
IE4gUmFvIDxuYXZlZW5Aa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIHwgMTcgKystLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiBpbmRleCBjMzdlMjJjNmMyNjUyMS4uNDIyZGQ3NjBm
YmUwMTMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiBAQCAtNDEsMTkg
KzQxLDYgQEAgc3RhdGljIHBwY19pbnN0X3QgZnRyYWNlX2NyZWF0ZV9icmFuY2hfaW5zdCh1bnNp
Z25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIGFkZHINCj4gICAJcmV0dXJuIG9wOw0KPiAgIH0N
Cj4gICANCj4gLXN0YXRpYyBwcGNfaW5zdF90DQo+IC1mdHJhY2VfY2FsbF9yZXBsYWNlKHVuc2ln
bmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IGxpbmspDQo+IC17DQo+IC0JcHBj
X2luc3RfdCBvcDsNCj4gLQ0KPiAtCWFkZHIgPSBwcGNfZnVuY3Rpb25fZW50cnkoKHZvaWQgKilh
ZGRyKTsNCj4gLQ0KPiAtCS8qIGlmIChsaW5rKSBzZXQgb3AgdG8gJ2JsJyBlbHNlICdiJyAqLw0K
PiAtCWNyZWF0ZV9icmFuY2goJm9wLCAodTMyICopaXAsIGFkZHIsIGxpbmsgPyBCUkFOQ0hfU0VU
X0xJTksgOiAwKTsNCj4gLQ0KPiAtCXJldHVybiBvcDsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBp
bmxpbmUgaW50IGZ0cmFjZV9yZWFkX2luc3QodW5zaWduZWQgbG9uZyBpcCwgcHBjX2luc3RfdCAq
b3ApDQo+ICAgew0KPiAgIAlpZiAoY29weV9pbnN0X2Zyb21fa2VybmVsX25vZmF1bHQob3AsICh2
b2lkICopaXApKSB7DQo+IEBAIC0yNzUsMTQgKzI2MiwxNCBAQCBpbnQgZnRyYWNlX3VwZGF0ZV9m
dHJhY2VfZnVuYyhmdHJhY2VfZnVuY190IGZ1bmMpDQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICAg
CW9sZCA9IHBwY19pbnN0X3JlYWQoKHUzMiAqKSZmdHJhY2VfY2FsbCk7DQo+IC0JbmV3ID0gZnRy
YWNlX2NhbGxfcmVwbGFjZShpcCwgKHVuc2lnbmVkIGxvbmcpZnVuYywgMSk7DQo+ICsJbmV3ID0g
ZnRyYWNlX2NyZWF0ZV9icmFuY2hfaW5zdChpcCwgcHBjX2Z1bmN0aW9uX2VudHJ5KGZ1bmMpLCAx
KTsNCj4gICAJcmV0ID0gZnRyYWNlX21vZGlmeV9jb2RlKGlwLCBvbGQsIG5ldyk7DQo+ICAgDQo+
ICAgCS8qIEFsc28gdXBkYXRlIHRoZSByZWdzIGNhbGxiYWNrIGZ1bmN0aW9uICovDQo+ICAgCWlm
IChJU19FTkFCTEVEKENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MpICYmICFyZXQpIHsN
Cj4gICAJCWlwID0gKHVuc2lnbmVkIGxvbmcpKCZmdHJhY2VfcmVnc19jYWxsKTsNCj4gICAJCW9s
ZCA9IHBwY19pbnN0X3JlYWQoKHUzMiAqKSZmdHJhY2VfcmVnc19jYWxsKTsNCj4gLQkJbmV3ID0g
ZnRyYWNlX2NhbGxfcmVwbGFjZShpcCwgKHVuc2lnbmVkIGxvbmcpZnVuYywgMSk7DQo+ICsJCW5l
dyA9IGZ0cmFjZV9jcmVhdGVfYnJhbmNoX2luc3QoaXAsIHBwY19mdW5jdGlvbl9lbnRyeShmdW5j
KSwgMSk7DQo+ICAgCQlyZXQgPSBmdHJhY2VfbW9kaWZ5X2NvZGUoaXAsIG9sZCwgbmV3KTsNCj4g
ICAJfQ0KPiAgIA0K
