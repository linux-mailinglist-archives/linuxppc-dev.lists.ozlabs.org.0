Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD377B47A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 10:44:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DNqtJ99Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPScj51wcz30fS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 18:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DNqtJ99Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPSbl69R7z2yVm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 18:43:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYErWLZYVvhLB+b7xxwux5idECyALhf1fuECjxiiVIZalZT/gU2KX9vCaSmhA/yWgsfX5C/pKIN1CnbNO+FZ9gWI0XO9gUQNJLMYpI12kP6ImsXdK9nr75Gdi3P9WZmz9KO6qhT4g93ON/Oib7Ar8KLgXMXSZguVAngPK0z0urBTw/oN/EwERu8pyKENe150cKZP7+JhZs6h6aetFljcZG9flTngylZkRP/L+qL1ciJz8Gchk+sWSw5EISNq3ZWZXN9C3qdvML2Uo+lMwRuKFhezy5HJ1sbbLZ04N6OnGYkeq4c6U4JsUpnACHoAiqFAUWaYucU9iHCZUbHNPkjGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwixmo+GqZArYzDmpWGS1l/Aq/M9l6Y1TO7wkBRFt1E=;
 b=TLuwLrQdSVFbjD965BHeva//+eLnoJveSEQPTEHeeD1n5PB821qqfI5zjq+MIAwsrR+oYg5M6yT5TlelCtHW4nZ+ewrSK+oDKEIDyZFGm4XwdQ7uEvDiILLCi19qmdWi3m/cS8RWQanTeKPqrJQNwWQVz+1bXZNaYG97QGg1hVzuzRo1mYD6dS1gFKvjeKT9Ick4cXWpEl/YLatqP3gQkoPUJiXg79GJ6nNgcpXDbnm+NrjjlITjg27sdaW8TzF7ofVArGq+yeyOY35YQ3pJnLwwVf8dEDMMIZlqUcWDzfu4zSIW5j4STyTQz3lb8jX74zpavvgxgHSrWhy+iptYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwixmo+GqZArYzDmpWGS1l/Aq/M9l6Y1TO7wkBRFt1E=;
 b=DNqtJ99YnEI3fJg5i6ptGETsspMtjdksVmvXYU17tyGtCXOFrb1kJ75DWW90Fz20RlWCoImqHQu9uvvJSceCSSYeqUkH1mEcNgRxE69Ue6IlV28wlZDHnwyMvScYd7tIaLbBTT4+2h4RqUYC//+D/HyXCckrWKuH9LWYVs5vkV10imdkUgVR2QuWuU+GObyalwz/VD2/8pW86ElTHDI6PhyziKuvlStAYECR5e+G/Lh8//3N8FQrKcRJ9E6LWQbPqY9jLRE5GY34xWCmVt+QPRsx9z6ysMHHz3JzYlOdlhNyDFnzVVZM+WK4LNsyreKGcVfxj2S8+P12xMtNUAjiRQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2469.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:43:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:43:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/radix: Move some functions into #ifdef
 CONFIG_KVM_BOOK3S_HV_POSSIBLE
Thread-Topic: [PATCH] powerpc/radix: Move some functions into #ifdef
 CONFIG_KVM_BOOK3S_HV_POSSIBLE
Thread-Index: AQHZypfJoKZq1ICbikuaiu2MTJYX2K/pWrWAgAAmyQA=
Date: Mon, 14 Aug 2023 08:43:06 +0000
Message-ID: <253aea00-d60d-377e-d696-cad83896b53e@csgroup.eu>
References:  <3d72efd39f986ee939d068af69fdce28bd600766.1691568093.git.christophe.leroy@csgroup.eu>
 <CUS1WM4XRDIT.2GTHPR1FHQKS2@wheely>
In-Reply-To: <CUS1WM4XRDIT.2GTHPR1FHQKS2@wheely>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2469:EE_
x-ms-office365-filtering-correlation-id: 49705d9c-cb69-405e-9b44-08db9ca27b4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  st0lZfd0HIjhOu2LbE5eceDk0QSX7hTz7MTqvBEXRhDJ6SgmTAM6+Ix1AskrdGrl5rVSnl4No8ob/6ii0HScdUhYDyUEAYGiNb3gKQ4h+nT4A3a3S1kQOY1VXxSLeB+iuUHfU4A6+g1yEoXe/RHk8z6CMu6L1paso6U0mbATqkCYeaGp4GHUj8xuDmdXBDC/DPD5QC1NZgqdNUind0EZnKcVd3VY9sp+tUwwir2EAtQAX0NYYU75wCSoudJIWvC1w0Ygk54b2yGfdB8YDrOh8e/LeGlzCiiF4pNIogg6yghGjJuvMZ1xrn6QA5xXOkPjpNewQaTLWA5byAV4u/nyRK3o7RWNmM5GFbouWmr4mw+MX6gw5AQHFxPIQT85AF+O4U8sGNypWJzupY3Nnds6kGPfVEyRVCr4Fk5shPLE+kASDNyenApiWI2wGhLDnYYV9GNWBTGT47Pajn6u46VnTE2MHHi8JXj/tCFqnc/FE3TWF1fU95izOrUdn00iKtA48Exc6B7ZRYIyXZFCyVGO0nT1ea/QlEwjMxvu14psIezXS62lI+Acwgo+IfkFOZfufoLWFQVFhHTzC43LEWpW66HKSENG8OUNyCj/S38jMq5ZyeZ7bt9Nb+PNnb65MsU65fVBgRv8b3XG40BmBAmtRpQcB2aZv3ek7Sy978k3BDx919BgkPiuDr3I4U4+92U3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(366004)(136003)(396003)(376002)(1800799006)(186006)(451199021)(26005)(6506007)(41300700001)(8936002)(64756008)(91956017)(76116006)(66446008)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(83380400001)(66574015)(71200400001)(6486002)(122000001)(478600001)(110136005)(38100700002)(54906003)(44832011)(31696002)(36756003)(86362001)(4326008)(5660300002)(2906002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TkpPeExCbE5ra2JacGhjMjF6ZGNWcDZWbnFsTi9yRkVXNnBRc0Iybkd3bS9M?=
 =?utf-8?B?VTMrWnNBcWRoTVovYjVuQWFKVXRqMk9EM0JUSURwbk1RcCs5TDJkUFNCdllG?=
 =?utf-8?B?cWsxWHFwY0dqNDhzTDJCblpkblg4UnJlNFY0VWNieEQxcUpHSnpuMi85L0o4?=
 =?utf-8?B?UlpKNjN1TXhkd3YzY2JCNS9KVTc5Zk1qdTFjQW95M2ZqaEZhbkhvWFhJZnpz?=
 =?utf-8?B?QjRrVmViTWI4cFpvUkdVcFJ5K2RON21aY3hJaEdoM3lSYVBCVVBENXZ3MDZl?=
 =?utf-8?B?VS9VUVl0Zm1LNHY2VGhleFhVb0NlaXJYY0txcVYwRXNLNS9ad1lGNG5XR1li?=
 =?utf-8?B?VEM1ZGk5eHdYKzc4Y1dRYSs1ODFjaWVEcFZoNUQyYUpOQlVRU0hucTlqcU9s?=
 =?utf-8?B?U0h6WDdwalF3WWlIMGRoVDUzM3FmZktOc2JMK3JzZFZnczB3M04xb2dHWU5B?=
 =?utf-8?B?VnB1NDlEcHJuVlo3b1dpdzQ3SnN4amhNRjQxUUVqUndEZWhBTHNIVG8zaXNj?=
 =?utf-8?B?QTBNY3ZkWThkT0gxMEtHa0ZGaHIyMUV1akJFaVhRQ2F2eGtQZE80UnFXK3M4?=
 =?utf-8?B?L0dhU1BQazdsQ0NyMWpZYUcwQ29PVlh0NzJmbExkaDd5d0I1L1lBdFdzSWN4?=
 =?utf-8?B?QlF4dnc2VFdxMytUY1pnYUxCQnVXNC9jSWhObzZmT29YV2tpRGxsUFdpUzhy?=
 =?utf-8?B?NFdoUFhCeEt1cXA4amQvTy8ydjFSNkZiTStGNmNaekxOS0RaYjlCcE9BZXZO?=
 =?utf-8?B?S3dIS20yVGd6b1hoRFpPVW9PZENKZndmN1hkNE9JNkZsL0tERVgyQ2FuT1l5?=
 =?utf-8?B?Z0JrUmxsb2lkMzhCUkdCUzZPRkRKdFVxUHM3Z0pDaTk4K2YrVXlwVFQvdEdw?=
 =?utf-8?B?cVdUQVJkUDRJT1ovTm9ZNkFyR0JWMXdjV09seUhGWWlOb1FBRjNqRjE2T3Mz?=
 =?utf-8?B?eWVWOWN2U21xbTFuTVd5TzNGZ3FDMmdxNCtNQmYxVXF3RnQ0T3Z6cmhPSXN5?=
 =?utf-8?B?VlJickQ1YkVhZnIrZGlabUEwVVVCWUl3Wm9xSWVyekVzWFRjQUtleGhHVnhq?=
 =?utf-8?B?T01JOCtHSjRKSGxTOGtWdHZzV05hZUx1SCtjeXQ0aXlzVHBqUUZBbHEyOW9H?=
 =?utf-8?B?ZEJRRzlZbDNIUWc1ZjJGWkNncHM5cDRldVZ5ODJZVzFiK0JlRkFCRksrSHhT?=
 =?utf-8?B?QjFRL1R0L0tiaG5HZERrL2FUcjFNcDZmaERydVF6aGFiYThyc2FWNm1pNGtH?=
 =?utf-8?B?UFo5bUtQUE8xYWVvSW0rbDk5SlI3VmdvaDZXWEhBbjB5aWczaThzSS8yU1Q4?=
 =?utf-8?B?blk3K1NHb2VMYzAzSmJvU0w3R3Z3SFZCVzFzSk84cjBORDhDZlhJZWdWMHdr?=
 =?utf-8?B?TFVrb2ttMkJhdDNvZVM4c0s3aVdJZU50emZtQjBjTDhjV0h0SnhUQmtZYUhm?=
 =?utf-8?B?ZHZmQk16Mm42SHJyWFJWY3d5QVpFNkV4S3NwckszbVB0VzJvQmh4YVhNb0ZW?=
 =?utf-8?B?UXI1aDNEK0ZLQ2p5bjFKbkRVekdUdk5ZMUIzTVFjL1M0OXpncTZrOHpaWXQw?=
 =?utf-8?B?RTZPVndkZGxnckYzZkIzMkxRU3ZENzUwSXlNZGxwb3ZFQTNod0d1S3ovYkpN?=
 =?utf-8?B?Wkp1RVQ0NkhBK3JVMkFVUXlIMW9wYjNFR0t0dGxvbDJjdWpSVFpwTTRSbm9V?=
 =?utf-8?B?Z2xxTk01dDhDSlJ2L0lYSmVqek5WUVlQS0t3OEVCVnN2TlNuS2NsSzlRbExr?=
 =?utf-8?B?T2dsSnFjQTUvNjRHd0JkaUs5cjVFQ2JQT3NoaTlEOXlHczg5M2syTzZRelVX?=
 =?utf-8?B?ZTRqMHlmOGFORmNZeExrVSs0U2trQTVHTk50ZGFrVjdWaGdGM2hxajJCRzYw?=
 =?utf-8?B?TEUyNHV2TEVEczlORE1DMjBDN2hLUzh2UVA2RVAwelpKZXdXM3Q2K2xhWjRr?=
 =?utf-8?B?Tm1Wck1teE1OMDBaQVd1ZDJ2UnNGUDVtRGV6Uzd5RkFNNURqV2ovRkRvMjZO?=
 =?utf-8?B?T3IzQklZdUdHN0NLRjJFMkFnLytDU2ZYcGxqWkt6SXpCemdxc1BWcmp6WU52?=
 =?utf-8?B?Wi9ZdVlLSG5MbnBlUWQ4QkM1eUhkL01uak0vcFd2eHZDc2NsaHBVd0RHMzFm?=
 =?utf-8?Q?174s8SfOI14TSiGmukgo4qxY6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E0E07AE17E52A4885A877CE74498E7B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49705d9c-cb69-405e-9b44-08db9ca27b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 08:43:07.0247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EmhHNYreB8GtNRbx32uvOlISU1jOKi1bE4y5MWciqtLCLkQibUdcmGfBH6N6SoWAaTx3oRciVljxD5VTCGDj34y/qBOs/VSJKimiQqskII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2469
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA4LzIwMjMgw6AgMDg6MjQsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQgQXVnIDksIDIwMjMgYXQgNjowMSBQTSBBRVNULCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gV2l0aCBza2lib290X2RlZmNvbmZpZywgQ2xhbmcgcmVwb3J0czoNCj4+DQo+PiAg
ICBDQyAgICAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF90bGIubw0KPj4gYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3RsYi5jOjQxOToyMDogZXJyb3I6IHVudXNlZCBmdW5j
dGlvbiAnX3RsYmllX3BpZF9scGlkJyBbLVdlcnJvciwtV3VudXNlZC1mdW5jdGlvbl0NCj4+IHN0
YXRpYyBpbmxpbmUgdm9pZCBfdGxiaWVfcGlkX2xwaWQodW5zaWduZWQgbG9uZyBwaWQsIHVuc2ln
bmVkIGxvbmcgbHBpZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgXg0KPj4gYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L3JhZGl4X3RsYi5jOjY2MzoyMDogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAn
X3RsYmllX3ZhX3JhbmdlX2xwaWQnIFstV2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQ0KPj4gc3Rh
dGljIGlubGluZSB2b2lkIF90bGJpZV92YV9yYW5nZV9scGlkKHVuc2lnbmVkIGxvbmcgc3RhcnQs
IHVuc2lnbmVkIGxvbmcgZW5kLA0KPj4gICAgICAgICAgICAgICAgICAgICBeDQo+Pg0KPj4gVGhp
cyBpcyBiZWNhdXNlIHRob3NlIGZ1bmN0aW9ucyBhcmUgb25seSBjYWxsZWQgZnJvbSBmdW5jdGlv
bnMNCj4+IGVuY2xvc2VkIGluIGEgI2lmZGVmIENPTkZJR19LVk1fQk9PSzNTX0hWX1BPU1NJQkxF
DQo+Pg0KPj4gTW92ZSBiZWxvdyBmdW5jdGlvbnMgaW5zaWRlIHRoYXQgI2lmZGVmDQo+PiAqIF9f
dGxiaWVfcGlkX2xwaWQodW5zaWduZWQgbG9uZyBwaWQsDQo+PiAqIF9fdGxiaWVfdmFfbHBpZCh1
bnNpZ25lZCBsb25nIHZhLCB1bnNpZ25lZCBsb25nIHBpZCwNCj4+ICogZml4dXBfdGxiaWVfcGlk
X2xwaWQodW5zaWduZWQgbG9uZyBwaWQsIHVuc2lnbmVkIGxvbmcgbHBpZCkNCj4+ICogX3RsYmll
X3BpZF9scGlkKHVuc2lnbmVkIGxvbmcgcGlkLCB1bnNpZ25lZCBsb25nIGxwaWQsDQo+PiAqIGZp
eHVwX3RsYmllX3ZhX3JhbmdlX2xwaWQodW5zaWduZWQgbG9uZyB2YSwNCj4+ICogX190bGJpZV92
YV9yYW5nZV9scGlkKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLA0KPj4g
KiBfdGxiaWVfdmFfcmFuZ2VfbHBpZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IGVuZCwNCj4gDQo+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcy4gRnVuY3Rpb25zIHZhZ3VlbHkgYmVs
b25nIHdoZXJlIHRoZXkgYXJlLCB3aGljaA0KPiBtYWtlcyBpdCBzbGlnaHRseSBhbm5veWluZyB0
byBtb3ZlIHRoZW0uIElzIGl0IGFsc28gYW5ub3lpbmcgdG8gYWRkDQo+IGlmZGVmcyBmb3IgZWFj
aCBvbmUgd2hlcmUgdGhleSBhcmU/DQoNCkxvb2tpbmcgYXQgaXQgb25jZSBtb3JlLCB3ZSBjYW4g
ZXZlbiBtb3ZlIGFsbCB0aG9zZSBmdW5jdGlvbnMgb3V0IGluIGEgDQpzZXBhcmF0ZSBmaWxlIHRo
YXQgd291bGQgb25seSBiZSBidWlsdCB3aGVuIA0KQ09ORklHX0tWTV9CT09LM1NfSFZfUE9TU0lC
TEUgaXMgc2VsZWN0ZWQuIFRoZSBvbmx5IGRlcGVuZGVuY3kgd2l0aCANCm90aGVyIHBhcnQgb2Yg
dGhlIGZpbGUgaXMgdGhlIHN0YXRpYyB0bGJfc2luZ2xlX3BhZ2VfZmx1c2hfY2VpbGluZywgDQp3
aGljaCBjYW4gZWFzaWx5IGJlIG1hZGUgZ2xvYmFsLg0KDQpJbiBwcmluY2lwbGUgd2UgdHJ5IHRv
IGF2b2lkICNpZmRlZnMgaW4gQy1maWxlcy4NCg0KV2h5IHdvdWxkIHdlIHdhbnQgdG8ga2VlcCB0
aG9zZSBmdW5jdGlvbnMgYXQgdGhlIGN1cnJlbnQgcGxhY2UgYW5kIA0Kc3ByZWF0IHNldmVyYWwg
bW9yZSAjaWZkZWZzIGluc2lkZSB0aGUgZmlsZSA/DQoNCkNocmlzdG9waGUNCg==
