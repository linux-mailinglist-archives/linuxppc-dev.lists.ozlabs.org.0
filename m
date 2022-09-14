Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CF5B8568
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 11:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSFmh3Z6mz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 19:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TH3jtyYt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.24.105; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TH3jtyYt;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01lp0105.outbound.protection.outlook.com [104.47.24.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSFlw0yLzz2y6N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 19:44:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekXwE8PuXIgI6aKJXphVdICjv4ugleNgOcFB0T0jKlmgEaktEKTREqB3qYzc3n030IIWo3Io6jb0Yw3zSTFGEL3a/xFWi7f+RgamnoRNdaHpvu4P3MN2N6TdgaXnfyxtOJ7yIObHw3+pYUFFtI3gc7hx8QmFXoS4LCFC003FyoHCE0ILx21+TZi8u/pC5kzzsraoInTeUQkv31YCBdxBaBfO5t/yj5WtisgO+3R8Vs9im+d+YrPGKKuzpa00+eVE7IzWw/n+YE20+JTOvngoL+vBfAyTxamHMpFfWKie5cQKQcx6ncqod/ZES+EvUfgz9dIFFGHUAu5fmNhCHZkV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2Rlo6qfrTfXmzp41rycAk3XF8tu4coD0dOWzOHfV78=;
 b=IOuB6Zq8Z7+c9IdiYsmRnYzAqQ8FGTn1KAzC+QtSX5itRwT6fo4FcOM9tqZWc1AFhGkyhqOo3h5NCTOl71QWXcWrG+UoOAPVL4GOlIewU3TBkXTfXc7hKKlk3MG8d54RhvTV3v1YWgqdTfc2IF9VWNnq9Oo0QGXjH27YUiDJNGOm4uv/CyAP9Q+Hnpv0j21WAj8KLbpuPHjEzcsDcyCteQ96k9bK52T16bXX/y3uu8QIhiOJvu1kgpQdjie56ak/8XJfsTkDeH8dIBGxlTsrD71+mQ3FK2xLbcwNyNl3cBuq2lmd0wcaZMlfu1v5nRJmCdXWy4use1+9OPjU7Sol1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2Rlo6qfrTfXmzp41rycAk3XF8tu4coD0dOWzOHfV78=;
 b=TH3jtyYtb6LdWknbERs6BHi0ToCtScNmysdR8nYqZjCAh3KqH5e9i/FPYHgOf2M3S7wvYZzIkcLRWO3RKUQfg1LLSMtMGETVduA4jRV8/Cq6/elrBSubZY1dAtFenals68OZ3fxrtJv0a6zQGjsWMN+7xp/HGEninZ/DrJthE4svoCGYkc+TxKKEQi9Yex1dmiuPd2T8Q5d88GlwgpykPtW0/PpZxiYE8/A/2uTDUj2rvYCnTZH1wxYxgEn0DoXRc3NxeZOWtTqoIQ14tc5jMg7OxtA5ZSYfwCuCEVWoTWL5+1AJANfYw8qK0ig/nlzca1c50d341MUjzFzqgZgAeQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2018.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 14 Sep
 2022 09:43:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 09:43:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: Fragmented physical memory on powerpc/32
Thread-Topic: Fragmented physical memory on powerpc/32
Thread-Index:  AQHYw7/6EKYd9DQJkEOt+3QHHtm+fq3YauaAgAN67oCAAGx9gIAAlYwAgABrdICAAV7dAIAAA0+A
Date: Wed, 14 Sep 2022 09:43:52 +0000
Message-ID: <ed8ff681-4182-3f9f-a65f-21cf5012fff0@csgroup.eu>
References: <20220609222420.ponpoodiqmaqtwht@pali>
 <20220808184034.lskqrk6z3gb5q76r@pali>
 <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
 <20220908153511.57ceunyusziqfcav@pali> <20220908201701.sd3zqn5hfixmjvhh@pali>
 <9fbc5338-5e10-032a-8f55-e080bd93f74b@csgroup.eu>
 <Yx9GpV1XT8r2a++R@kernel.org> <20220912211623.djb7fckgknyfmof7@pali>
 <1c95875c-29f8-68b7-e480-fed8614f3037@csgroup.eu>
 <4f540391-37dc-8e22-be0a-74543082504d@csgroup.eu>
 <YyGfkDKgeW7/nNlr@kernel.org>
In-Reply-To: <YyGfkDKgeW7/nNlr@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2018:EE_
x-ms-office365-filtering-correlation-id: c71e3993-d1e3-4fa0-07c0-08da9635a216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DDtThr2afg8n9QBebnmZwFPH/6cVhU3No5W40WoqZMKM59IP0qkkH2/CRM4QgKYiRVg9WkaKZ9+xERFNf71S/ok/5K5y0Ge94aaCVdRBsBTFa6AqfOr/4MB1Pa3UVBLcBEnU5MGnca5JXMb4jiLUBhsWQaQunQG6Uw15qy5JjQ+g2t3Av+7zY01DubcgF9BzGmNLyITSVgUSxSJxQWHsvQ+3h1P6p3E1MZS1DXlxP1SiXz7e3TfcUiwpqRmqPdhF/VcBZhRZoleBf2MaKcSEADXfsmfQDeFSZqLeGqwDxS3iv4FmxpscogN1m0czJG6y1e2ruIhBUkIbl3xQUvRU4cajA60CTdqRB6IhM/T1QZIwju1ReXJ2saV8hG/unIQUpgNgexs8AZrgbSsKP9+7GGKG6/5Zq5aCJl4u7f4Ga9Yxv5vEDQFGV1V1vmZcY01zHbWQfhuj63ozIaJbhxxlb4IwYe6KGmnJQVFAmThZ1fS3JlwNBm0ripF36awSHJZuKik5qhcbcXKzp18rNnUl5UKF9ZA/8RF61s7ahAXeigzOjiSaGgv6DpPjVGvSutoWlvxNn/AAB2eqYNjFHu3etFtkAJqFtvci/AnBASl8VBEy6xz0o2fhbwiOFyHm0J5Tq6TQjmVpwrlD5pnS3p9Ac+qKAQKCdMjiAoTFkaIzNVZ9I8UzAndlMEYPNIUl8VffcBJO6ucqC4ib0QgSOoB1JSsWEeGBvqPj7qj0PEiJq63gJ+aKSmpPlcDapA4Dxv+njEJtjW8MhGeVA5MSLRW02B0QxVgvwolcskTIzZZ4PtisHdXmV8ywTgnLGFIhHOLN1uVuu0ZIGXTg6ThVcKgjTQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199015)(66574015)(6916009)(6512007)(38100700002)(36756003)(91956017)(2616005)(54906003)(71200400001)(8676002)(478600001)(41300700001)(38070700005)(8936002)(44832011)(316002)(64756008)(66446008)(26005)(5660300002)(4326008)(76116006)(31686004)(7416002)(6506007)(83380400001)(6486002)(66556008)(66476007)(66946007)(122000001)(2906002)(31696002)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?emNwazlNOXQ1YStHU1d6U0QvVHdEU0hMTWdPVXdaWkZ0aGNjZ0RremJDMVJT?=
 =?utf-8?B?YUhwL0llbWVDcFozQW1IY3lKR3N1K2lPMGRmODkxVFpObkhsbGFsL2Fwb0NN?=
 =?utf-8?B?L0xaaW16Rno5YW9LM1BEYUQ2ZHVYNFlMdFlqUFdVMVdEN2FUT3hMY0JabWxo?=
 =?utf-8?B?RTd2RHVDN1ZTRHRGcXY4bExtRVpPd0tKWlVtZno3U2tnVTdLalJtZFBLNzJC?=
 =?utf-8?B?TDFNYUhOeWJtSERtNXIrM25MdnlJRGxjVVhuVmpFOHNMRnlVaWJFK3RTQkFz?=
 =?utf-8?B?N3ZPUXovSld5bkM2VEtVNEJqbVFyYUErVStCcFBMakpSVzdPcklpbzZmVWc0?=
 =?utf-8?B?a3BPWnUyeHpMUGF1TVA2WG94T3FmbThHbFJ2WUlrdDQzVFM3eVJaRmVIM2I3?=
 =?utf-8?B?NnlRcUpESnMxVHNncEZLSk5xeUZ4UG43cTRUQklWNFAzc2dsN0h1MHAxT2VZ?=
 =?utf-8?B?U1lrV3NnejRFSTl6MWRQTDB5M05VbTY5VkZqaHpFYVpNZjh4Mll0K0plUFN6?=
 =?utf-8?B?bVJueG5ac1ZKWXBFenJGVVZTWUUydyt0bXkrWXl2QUJEak9KdTNlVXR0OGhj?=
 =?utf-8?B?WmV0dnpHd0JwOGpFVEJiK0VpcUlGTjFHNTB6UThTcDBaTVpSVFBOUVhQOG1y?=
 =?utf-8?B?M0RuVmhYa3ZwdmJjNUd3YTd2Q0VaMUtZWVpFRTdXNWR4MStBNmN5RTVmZXA2?=
 =?utf-8?B?czBISUxIcFgyWXpTT0dYVmxmb3BxRzNETUY4VGUvUXp1dXZqT1RoZlhCVUdj?=
 =?utf-8?B?dURJNUUxUnRGTVBsYjEvbGdxN1JSbW9rcjNHd2JqTHo4Y1NkYkpxQmhhbjBL?=
 =?utf-8?B?SXRkaThQVzIwanRBTGJ0WTFEN3cxR1pqQXpqY1VXTFM5TmtMMWdGaTBoc0Zt?=
 =?utf-8?B?OStNTGFlcHg1VmtCNXNSQlBuSFB3dHFwTlNKSXUrNnNaWmc1a2NzOHVodEEv?=
 =?utf-8?B?UmVwTzNGU21NT2F4U1liRThRWmIvSEM2M3M0dlREL1g5OHZZYWZtMFBDdUky?=
 =?utf-8?B?Nkx0NzhXNHRKMEVqRk01RVYvVEJBcWQxR0o1WkYyanNDRXFLT1FrcVB5SS9j?=
 =?utf-8?B?Q3VndnhpWUtEeFMyMHhXaDVxZ3lLT1haNWxUbEptR0tvVWx2QjN1R0dmQkt1?=
 =?utf-8?B?SjJEWlhDYUJMWUpEWGdwQ2NhY3cvRXVCV3FobysrUDZhV1FwbnVrK0E4Rkdl?=
 =?utf-8?B?RHI2UTFFYVhtcmdKQjFoVlEzR1lvem85cnlCc0gyb3NLWjd6U1k4ZHh5WElM?=
 =?utf-8?B?TXE1cS8zeXhDRFJ1MGxqNzdVSlFZL0F3V1Fmc3JBRi9ZeCtlaTdCVVJYbjN2?=
 =?utf-8?B?WjJySTNhS1hWRnZ2cXM5L2x2anExeGxzQVd1MWpleGdvSkJZclc5aGdhUlJz?=
 =?utf-8?B?bjlkdXpzRWRiWkc1dW1zaUI1dmkxOTZjbm16U25naWNYTklDSktsZnplM3l3?=
 =?utf-8?B?Q3lLTmVoMDdPaGxrV2sxRExmQ3FHOWplNG5JOXpoZ0Z4OGR1Wmk2aU8rZjVt?=
 =?utf-8?B?MzMrMDFpUGNtZ3Q4Q3hLWGxzYllhNU9FQTZaNkx1MzhrMTFhK0M1SDM5TUVJ?=
 =?utf-8?B?NXBxTmdZU2tMSmU0eEhIQmlsbTRNWXRuTFo2WWZxREhtbmFJd0Zxb3lvVW1h?=
 =?utf-8?B?alFFcVFnb3BuWGgxck0vcktVS3V5anYyNzJuMUlocno2NmlIVy9CMGFLTFpL?=
 =?utf-8?B?YU9pdkVsZXh5bUxhalF0UE9VSUR5N3M2NERHdHpaTnBGN2hNcGp2bHVqZmN5?=
 =?utf-8?B?QUhoU0U0VXNqd1hGMjRpSFFxY2I3cHRuN0lJNnp0VkpHVGpMMVpVQmw1MTZV?=
 =?utf-8?B?SjVqZHdDZDVkMk5YSW5iZWVLNUhNd1k2R3VzZjBObG5EdzhwUm03ZmlWam80?=
 =?utf-8?B?aFZMbVMvMWZtbXJzYWI0aG9rcVRPcFQwQzZYT1ozN0lEWFB2SjE3MVh5cFJX?=
 =?utf-8?B?c1hHbUx3Q2FkQWs1eEQwdXNSS0d0M2xSWGdkREVRSHQ5RjF2bkJLRW9WL0ZY?=
 =?utf-8?B?cEdmUUUyeXFSZHVreWRZaXdLeVM1Si91U20xZ2pKdWFnc2liM0JSZ2NWcDZR?=
 =?utf-8?B?MU94TXpPUUZvNXpVTTFmRHdEK1E4emNOZ1BINVllNG5pT3RRUnhUZWNBczNK?=
 =?utf-8?B?WmtlbDNLazUzWFJUMjkxNWJYWU04bXhhd3FCS1p2Nk9QVGw3MlVPeXJLeEwz?=
 =?utf-8?Q?w7GUMWHrdxKZUC93t3JEj8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B113114B5353748A0E6B09725C1851F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c71e3993-d1e3-4fa0-07c0-08da9635a216
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 09:43:52.2507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAb+fxuKNydg1HcMVD2KRcqYeCrUWsUgfyA3iPykntNVKYYcp3grtGsxyD5NSOmih4DXaBPlxYHpiyLy9DYKe6CERClint/cwrKSjnJsPPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2018
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Ash Logan <ash@heyquark.com>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA5LzIwMjIgw6AgMTE6MzIsIE1pa2UgUmFwb3BvcnQgYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCBTZXAgMTMsIDIwMjIgYXQgMDI6MzY6MTNQTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTMvMDkvMjAyMiDDoCAwODoxMSwgQ2hyaXN0b3BoZSBM
ZXJveSBhIMOpY3JpdMKgOg0KPj4+DQo+Pj4NCj4+PiBMZSAxMi8wOS8yMDIyIMOgIDIzOjE2LCBQ
YWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+Pj4NCj4+Pj4+IE15IGd1ZXNzIHdvdWxkIGJlIHRo
YXQgc29tZXRoaW5nIHdlbnQgd3JvbmcgaW4gdGhlIGxpbmVhciBtYXANCj4+Pj4+IHNldHVwLCBi
dXQgaXQNCj4+Pj4+IHdvbid0IGh1cnQgcnVubmluZyB3aXRoICJtZW1ibG9jaz1kZWJ1ZyIgYWRk
ZWQgdG8gdGhlIGtlcm5lbA0KPj4+Pj4gY29tbWFuZCBsaW5lDQo+Pj4+PiB0byBzZWUgaWYgdGhl
cmUgaXMgYW55dGhpbmcgc3VzcGljaW91cyB0aGVyZS4NCj4+Pj4NCj4+Pj4gSGVyZSBpcyBib290
IGxvZyBvbiBzZXJpYWwgY29uc29sZSB3aXRoIG1lbWJsb2NrPWRlYnVnIGNvbW1hbmQgbGluZToN
Cj4+Pj4NCj4+PiAuLi4NCj4+Pj4NCj4+Pj4gRG8geW91IG5lZWQgc29tZXRoaW5nIG1vcmUgZm9y
IGRlYnVnPw0KPj4+DQo+Pj4gQ2FuIHlvdSBzZW5kIG1lIHRoZSAndm1saW51eCcgdXNlZCB0byBn
ZW5lcmF0ZSB0aGUgYWJvdmUgT29wcyBzbyB0aGF0IEkNCj4+PiBjYW4gc2VlIGV4YWN0bHkgd2hl
cmUgd2UgYXJlIGluIGZ1bmN0aW9uIG1lbV9pbml0KCkuDQo+Pj4NCj4+PiBBbmQgY291bGQgeW91
IGFsc28gdHJ5IHdpdGhvdXQgQ09ORklHX0hJR0hNRU0ganVzdCBpbiBjYXNlLg0KPj4+DQo+Pg0K
Pj4gSSBsb29rZWQgYXQgdGhlIHZtbGludXggeW91IHNlbnQgbWUsIHRoZSBwcm9ibGVtIGlzIGlu
IHRoZSBsb29wIGZvciBoaWdobWVtDQo+PiBpbiBtZW1faW5pdCgpLiBJdCBjcmFzaGVzIGluIHRo
ZSBjYWxsIHRvIGZyZWVfaGlnaG1lbV9wYWdlKCkNCj4+DQo+PiAjaWZkZWYgQ09ORklHX0hJR0hN
RU0NCj4+IAl7DQo+PiAJCXVuc2lnbmVkIGxvbmcgcGZuLCBoaWdobWVtX21hcG5yOw0KPj4NCj4+
IAkJaGlnaG1lbV9tYXBuciA9IGxvd21lbV9lbmRfYWRkciA+PiBQQUdFX1NISUZUOw0KPj4gCQlm
b3IgKHBmbiA9IGhpZ2htZW1fbWFwbnI7IHBmbiA8IG1heF9tYXBucjsgKytwZm4pIHsNCj4+IAkJ
CXBoeXNfYWRkcl90IHBhZGRyID0gKHBoeXNfYWRkcl90KXBmbiA8PCBQQUdFX1NISUZUOw0KPj4g
CQkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOw0KPj4gCQkJaWYgKCFtZW1i
bG9ja19pc19yZXNlcnZlZChwYWRkcikpDQo+PiAJCQkJZnJlZV9oaWdobWVtX3BhZ2UocGFnZSk7
DQo+PiAJCX0NCj4+IAl9DQo+PiAjZW5kaWYgLyogQ09ORklHX0hJR0hNRU0gKi8NCj4+DQo+Pg0K
Pj4gQXMgZmFyIGFzIEkgY2FuIHNlZSBpbiB0aGUgbWVtYmxvY2sgZGVidWcgbGluZXMsIHRoZSBo
b2xlcyBkb24ndCBzZWVtIHRvIGJlDQo+PiBtYXJrZWQgYXMgcmVzZXJ2ZWQgYnkgbWVtYmxvY2su
IFNvIGl0IGlzIGFib3ZlIHZhbGlkID8gT3RoZXIgYXJjaGl0ZWN0dXJlcw0KPj4gc2VlbSB0byBk
byBkaWZmZXJlbnRseS4NCj4+DQo+PiBDYW4geW91IHRyeSBieSByZXBsYWNpbmcgIW1lbWJsb2Nr
X2lzX3Jlc2VydmVkKHBhZGRyKSBieQ0KPj4gbWVtYmxvY2tfaXNfbWVtb3J5KHBhZGRyKSA/DQo+
IA0KPiBUaGUgaG9sZXMgc2hvdWxkIG5vdCBiZSBtYXJrZWQgYXMgcmVzZXJ2ZWQsIHdlIGp1c3Qg
bmVlZCB0byBsb29wIG92ZXIgdGhlDQo+IG1lbW9yeSByYW5nZXMgcmF0aGVyIHRoYW4gb3ZlciBw
Zm5zLiBUaGVuIHRoZSBob2xlcyB3aWxsIGJlIHRha2VuIGludG8NCj4gYWNjb3VudC4NCj4gDQo+
IEkgYmVsaWV2ZSBhcm0gYW5kIHh0ZW5zYSBnb3QgdGhpcyByaWdodDoNCj4gDQo+IChmcm9tIGFy
Y2gvYXJtL21tL2luaXQuYykNCj4gDQo+IHN0YXRpYyB2b2lkIF9faW5pdCBmcmVlX2hpZ2hwYWdl
cyh2b2lkKQ0KPiB7DQo+ICNpZmRlZiBDT05GSUdfSElHSE1FTQ0KPiAJdW5zaWduZWQgbG9uZyBt
YXhfbG93ID0gbWF4X2xvd19wZm47DQo+IAlwaHlzX2FkZHJfdCByYW5nZV9zdGFydCwgcmFuZ2Vf
ZW5kOw0KPiAJdTY0IGk7DQo+IA0KPiAJLyogc2V0IGhpZ2htZW0gcGFnZSBmcmVlICovDQo+IAlm
b3JfZWFjaF9mcmVlX21lbV9yYW5nZShpLCBOVU1BX05PX05PREUsIE1FTUJMT0NLX05PTkUsDQo+
IAkJCQkmcmFuZ2Vfc3RhcnQsICZyYW5nZV9lbmQsIE5VTEwpIHsNCj4gCQl1bnNpZ25lZCBsb25n
IHN0YXJ0ID0gUEZOX1VQKHJhbmdlX3N0YXJ0KTsNCj4gCQl1bnNpZ25lZCBsb25nIGVuZCA9IFBG
Tl9ET1dOKHJhbmdlX2VuZCk7DQo+IA0KPiAJCS8qIElnbm9yZSBjb21wbGV0ZSBsb3dtZW0gZW50
cmllcyAqLw0KPiAJCWlmIChlbmQgPD0gbWF4X2xvdykNCj4gCQkJY29udGludWU7DQo+IA0KPiAJ
CS8qIFRydW5jYXRlIHBhcnRpYWwgaGlnaG1lbSBlbnRyaWVzICovDQo+IAkJaWYgKHN0YXJ0IDwg
bWF4X2xvdykNCj4gCQkJc3RhcnQgPSBtYXhfbG93Ow0KPiANCj4gCQlmb3IgKDsgc3RhcnQgPCBl
bmQ7IHN0YXJ0KyspDQo+IAkJCWZyZWVfaGlnaG1lbV9wYWdlKHBmbl90b19wYWdlKHN0YXJ0KSk7
DQo+IAl9DQo+ICNlbmRpZg0KPiB9DQo+IA0KDQoNCkFuZCB3aGF0IGFib3V0IHRoZSB3YXkgTUlQ
UyBkb2VzIGl0ID8NCg0Kc3RhdGljIGlubGluZSB2b2lkIF9faW5pdCBtZW1faW5pdF9mcmVlX2hp
Z2htZW0odm9pZCkNCnsNCiNpZmRlZiBDT05GSUdfSElHSE1FTQ0KCXVuc2lnbmVkIGxvbmcgdG1w
Ow0KDQoJaWYgKGNwdV9oYXNfZGNfYWxpYXNlcykNCgkJcmV0dXJuOw0KDQoJZm9yICh0bXAgPSBo
aWdoc3RhcnRfcGZuOyB0bXAgPCBoaWdoZW5kX3BmbjsgdG1wKyspIHsNCgkJc3RydWN0IHBhZ2Ug
KnBhZ2UgPSBwZm5fdG9fcGFnZSh0bXApOw0KDQoJCWlmICghbWVtYmxvY2tfaXNfbWVtb3J5KFBG
Tl9QSFlTKHRtcCkpKQ0KCQkJU2V0UGFnZVJlc2VydmVkKHBhZ2UpOw0KCQllbHNlDQoJCQlmcmVl
X2hpZ2htZW1fcGFnZShwYWdlKTsNCgl9DQojZW5kaWYNCn0NCg0KDQpDaHJpc3RvcGhl
