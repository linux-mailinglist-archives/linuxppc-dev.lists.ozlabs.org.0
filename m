Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97124708F89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMwh32qb8z3f8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:41:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UlENRCoW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::607; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UlENRCoW;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMwg72xmVz3f8Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:40:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUPSHMmUKRIgu5hq8LG46jGT0/LfqzGeFUJzcrgqr3E/ZSSFW77zDLQizhmvTLWnZEpwchE2wIeUpPLEvDoilftNFGwjx/RZ7o4di8V3CIgdoUPCwmQfrjVUOqcrrPBVrzz3LuexkgktGYNBQHoxMoGPf+jYkg3cS1/TCMvddJiS+jO00H4eSUNqziCt5gI/b6aldq5NsDejpx1Mjyc1K1hpgqn8ID4NI+CUmlI6KNRl4PDfP8bsc/4TjPsXWxzBrl/Qpwj8SU97bz9WSg5Sl79NYsI/Fp4n/qHuFyAmSAcSovoACPNVrFDNKsTtxL/GOKk/VZPgcLixU0KLFyQPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bfm7Kx9TPPXflocESOHFpte9GOjD4v2kMgpn/QQdFc=;
 b=mTj/M8T8m18F13oGNifaEzBrsyxuFkIyQCUoYdCSNlQWfneLbm5FQJM4AXfwrrkzr3TmNWubYJee23Hk5/58+kjn/iLASeYknwubQ0g9TVz7qlOvIOzyAWUYMMZLtoleyHp+5Nieu16JeXfpE10p5C6P0r9/onFhbRh8pyFq7YAGDGrrrNP28PclkyRNUvbUSzbeI2UiOUQk/aBhLW91fCaOQUO+U5jOG+WjJVoRwBwE/kOWCQQsfEMgNNNrnbXLUtSLhT5ApDSyJHWDEqcGRDRe6i22oWPDxdK5S+06UcLnwpz+PgrePmyrLLylSWVRzpAKwWN+xL64TkByd2aqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Bfm7Kx9TPPXflocESOHFpte9GOjD4v2kMgpn/QQdFc=;
 b=UlENRCoWnex/yg9I9NkpupR8r6awD2NtlLIzAJj51n49sbzWYhKyjrunaQ1GCb5Imh4OwNTv2oPaTN7fZUQ1R6hdPzXOWIXQ5EAnovru4OzWq3E6BG63nimbV1iUzwt4sQW6iHmGznTiVtCPSWPXEU+T6sjI35HkWQzjTcaotULQSJWwRUn0x7ML9Owqgu1hZ8viwzetLpx7/r6sUXdhyuEMx+O5/ksJkipytB8SGSY/L+4QU3Cgene18xV5FHRXkGhJ4J7ABmasZBIGSAsDCcKt6GiQnCuwUMPNPFOchfuV0ale+5ju5YbTWzRKNob/92MY0I0R82OB5CAi2bFCjQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 05:40:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 05:40:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>, David Laight
	<David.Laight@ACULAB.COM>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
Thread-Topic: [PATCH] mm: kfence: Fix false positives on big endian
Thread-Index: AQHZfwTwBhXBE+Wdr0W8OihL3Jona69L1+OAgBNFpACAAg1BgA==
Date: Fri, 19 May 2023 05:40:26 +0000
Message-ID: <90e5657a-d9f1-4d45-edfd-07e51d98731e@csgroup.eu>
References: <20230505035127.195387-1-mpe@ellerman.id.au>
 <826f836f41db41eeb0fc32061994ac39@AcuMS.aculab.com>
 <20230517152028.86b6d2d5afa4541b4269131b@linux-foundation.org>
In-Reply-To: <20230517152028.86b6d2d5afa4541b4269131b@linux-foundation.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2259:EE_
x-ms-office365-filtering-correlation-id: 921c6112-7090-4339-6a6e-08db582b8ca5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nSZebBxVNADfcrBVH5MyhJXHV9QR0K43QmvDco49wLt047itIXiGxjEjasdMjyl2rnjCSGjM3qz3gJgUB0gkOHZYmt6uGLV5qozUwwQyrcZHJb/2n7KIW3TiMxknYJ2W3M+Y8kQPibPscM0XN+SFUWB7SFDBjxRcsEv3ImkpcuAFuHGZz4NFXHprS4G2VQ3UGW9VCWLqh6cAPZVdV+S3Le34SIY/e86nl4Mpq0++V8HsfaD+oKiUAWs+PFbpqkitYrfuHYZdVRrm1atMAcWE49qlJdXhRbKVnJVbPqHj0HtrIQ/IzxZA+y1pNjNso+Qqv8NoSlLBrR/0Nspl22wWuqi0EVuiduPkzkUVHt3POTki1KYRe1vsms1qRr0Yb/TCq9D3Ue5ceADZpmp0gkci/sVKKMT7odGdSJlSwY+Y9P6Sb/FTZJ/04wXtTUFhc11S5wwOsgg6nhD6gyU7crOAtxpSrUhgGlOjP1Wu9LsdIW98nAziNRntzG82/rX3UC/q3UIkk5e1MOTb6DUfWZId8PzGek+whxr6AOMoTVG+pXv3AFk75XAeeSbgYseJfVIid8iFywmFX14b5bzwo8H6QtXupOqnsHymWqR7OnEYGEZPgcZIXkbmeUOA4Rhul/Vj7LujA3yPnEcmgMDPPm8LU0t27QcdgwOHx4zSDjjm2tE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(451199021)(41300700001)(31686004)(478600001)(110136005)(54906003)(66574015)(2616005)(4326008)(316002)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(71200400001)(44832011)(8936002)(8676002)(6512007)(6506007)(966005)(6486002)(186003)(5660300002)(86362001)(31696002)(122000001)(38100700002)(36756003)(2906002)(83380400001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MDBQS3o0VFBCdFI5NHlUZVlXWlhxcGVmbTlTR2Nldm53Z1NQVnoyYVk1Q0pv?=
 =?utf-8?B?cVFKcXF3d1R0VVo2MWZjMTBoTk0zQVY1RkZSS0w0R3JtMk92VEwzUFg1Yk5N?=
 =?utf-8?B?cEgrY0ZBRVREYm8wcWM0S2RRTDFzRWV6K1lIbkhSUHpRVnRrWkFqdnppZXkv?=
 =?utf-8?B?ZUhzQmRYMVFocThSd3lLZ0pkRjVtVXVYNURTNUo2Q1RpUFlIT0dSNHFudkN6?=
 =?utf-8?B?V2J1dTlld0I1L3JubHIzTmR1bnVrMnh0WS9iYjhrbXRzSk95ZE1QeGd5RE1z?=
 =?utf-8?B?RjdEZWh5LzZYU0VJTUg1M0dDRWRGWkNXeDZoT1A5a3BySEZBdFQwSW9iRGZs?=
 =?utf-8?B?RTd0dUxiZHBYSllKdTdZZXlNRHgzM3V0RTM1Qko5eDJ1Mi9DUDFlOWw0a2g0?=
 =?utf-8?B?RGxjQXJENFRmclNqaDA0NFN6Wm15YnBqTnM1cVJFbWE0c3VsSU5wTHV2bUZs?=
 =?utf-8?B?MU9ZQTUwTmlTYjI5YndXNEp6YTdpV0tUR01tWUp4TnNabWQ5S0cwTGJ6K1BC?=
 =?utf-8?B?YXJVZ0w0alY0VUYxSjFEUmljRm9CM0xYM0Q4bk8yaUxFd2NPdklUYXNMRVVF?=
 =?utf-8?B?K2c1U09pbGZvWmpJUk1GS3haOEJ1YmNxbzNWNkVFN0w0NTg3b25XTTVwTGd5?=
 =?utf-8?B?V1ZWRWZ1S0NsYVE2RlljWmR2anJNbmpaSFZCdjVPd2ZUYW45SlVsaUZiT0Rz?=
 =?utf-8?B?aHBJbmlxeHVjL2tERXBaL2ZkMW1lZGFKeloySTZUT21uSE9ORjJiL28yc3Aw?=
 =?utf-8?B?eWdPTmI0dU1iTGY1WGZsRk00K3NiZkhPbWV5YXNDcXlrcVZLRGJtVDdLNkVo?=
 =?utf-8?B?eEFQekl0a1liL2ZKaFRoQzZJWU9pcDY2V1R0b2dVcU51bUNFUmovMURjdW5J?=
 =?utf-8?B?WDBXQzViTUkrV3h1SFRQVTJXc05Oam1wRVQ1anNxVUg5blJHRnJUOG9Zb016?=
 =?utf-8?B?a3Rha284eWxuT1RHS2hOc2VoYjY1bFZmRUIrOWo3MkdmTEJqUGNMUHovaUw3?=
 =?utf-8?B?VXJIUGcrbDY1cEVZYXQ1S1JIZFFQaWpQSE5Sc0tVczZuYS9ITzE4ZzVGZWhD?=
 =?utf-8?B?YXZjczZJeDZaZ2hYcFo3S1lST0VMV2FSV21QNHEzZnRpMGtEYzFzK255R3Ri?=
 =?utf-8?B?emU4Z2FZblhvTUo1ZDNJMDVKcENoSjZRcTd0dDcrNnAva3RGZk1zMjlPWTUr?=
 =?utf-8?B?ZU9saU8xTlVybVMyYlpVMTRrUjR1UlNNZzZaczlESk1vcVBoRVd2bldBbytM?=
 =?utf-8?B?OUFVQUx6Q1libmRDak1TOC8rZElaVDZQak15bHdXR2F2czlQdzIybHg0bWNE?=
 =?utf-8?B?T1NsT21idnlxTXd2OTZJQTcxRjVLNEVYWWowMWFRZGozTmx5R3IyejlEZmJo?=
 =?utf-8?B?aGdXeVRwRnpyWHpLR2hZVU1SbFd1L1doS0JOUHNxQjlVNTBOQ0VjWk1rVm02?=
 =?utf-8?B?bzlaNU5sUWVScDZETXRydW5vM2hxaHNEQkt3OEU5MmVxUmtaOTdYalR5VEpI?=
 =?utf-8?B?S1daZzEvSjJyWkdiZDhYKzNEQ3NDbXhBb0xrUk1nSE5FZmxKMlJHSU5Sa0VT?=
 =?utf-8?B?dDYxcUtmZHgzbkswSU9BYUsvc0J0WWIwTnVmK1FkYWR5M3Q5UXJ3YzFVbDRv?=
 =?utf-8?B?eVNTNUgzaDl1RkNUL1JNemxBaEh5SWxxUU5ibU5tOC9DcnlCUkJEQU51RmNr?=
 =?utf-8?B?WHFaQUd2Y2lJUldNOVlwTGZ0aUFHays5U3pRNVFXaDRFUFZ2Nkx4ZXdrcll3?=
 =?utf-8?B?VXIrNU9DTk9WdUptVlJQUVRESW9uWEhyTlRHRFA5TmpoV2lid01oendBNTVV?=
 =?utf-8?B?aktTeUFVYUgzZVNmMUY2dzlrMm8weEN0UDRHWS9KODhGMnB2L09BeVJLNHFl?=
 =?utf-8?B?ZkdneStGdmxMZkR4Q2tiNjFsdllBT1RVOEo0cnFqeFdsQ2IzdTNrMDZYeHEv?=
 =?utf-8?B?eXpSUXBRQWlZcjRQcVRDb3VsNnpIL1dqQkdrM1RNMkd1cCtTNCthTUlpMGNZ?=
 =?utf-8?B?cG9UVnBoVWY2ck9Cb2tQN2pmenBPRG02eTFBYi9FeGcxc2crWTlyL2ZDUmtC?=
 =?utf-8?B?NWg2dHhpQTlHcUFzRXY4U2JVaEF3cVlJVHdROGRqQU45VEw2Wi9wamk0L3dt?=
 =?utf-8?B?bWlxQ21XQll3NlBIdG1TZzhkaXByWUE2THh4T2xEVytmamdUVmI3dDNZaHlI?=
 =?utf-8?Q?5vjd/qpmp79DNWlxhBeT2rqxRT/E5FjEMhM+o27WYPwS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9ACA471A4106A4CA7B9D7DBE10510BF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 921c6112-7090-4339-6a6e-08db582b8ca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 05:40:26.8980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErYs8B5sCr4QKD/knyH9fsN7gUTjr5c3G91Gy53wgGa3xDo3oIG09oB/p6c8/mHU1YJcJexIxzJ3v/1uPPfx4yjq73+bW7IRZLbyu6G/TdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2259
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
Cc: "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>, "elver@google.com" <elver@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "glider@google.com" <glider@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA1LzIwMjMgw6AgMDA6MjAsIEFuZHJldyBNb3J0b24gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCA1IE1heSAyMDIzIDE2OjAyOjE3ICswMDAwIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QEFDVUxBQi5DT00+IHdyb3RlOg0KPiANCj4+IEZyb206IE1pY2hhZWwgRWxsZXJtYW4NCj4+
PiBTZW50OiAwNSBNYXkgMjAyMyAwNDo1MQ0KPj4+DQo+Pj4gU2luY2UgY29tbWl0IDFiYTNjYmYz
ZWMzYiAoIm1tOiBrZmVuY2U6IGltcHJvdmUgdGhlIHBlcmZvcm1hbmNlIG9mDQo+Pj4gX19rZmVu
Y2VfYWxsb2MoKSBhbmQgX19rZmVuY2VfZnJlZSgpIiksIGtmZW5jZSByZXBvcnRzIGZhaWx1cmVz
IGluDQo+Pj4gcmFuZG9tIHBsYWNlcyBhdCBib290IG9uIGJpZyBlbmRpYW4gbWFjaGluZXMuDQo+
Pj4NCj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBuZXcgS0ZFTkNFX0NBTkFSWV9QQVRURVJO
X1U2NCBlbmNvZGVzIHRoZQ0KPj4+IGFkZHJlc3Mgb2YgZWFjaCBieXRlIGluIGl0cyB2YWx1ZSwg
c28gaXQgbmVlZHMgdG8gYmUgYnl0ZSBzd2FwcGVkIG9uIGJpZw0KPj4+IGVuZGlhbiBtYWNoaW5l
cy4NCj4+Pg0KPj4+IFRoZSBjb21waWxlciBpcyBzbWFydCBlbm91Z2ggdG8gZG8gdGhlIGxlNjRf
dG9fY3B1KCkgYXQgY29tcGlsZSB0aW1lLCBzbw0KPj4+IHRoZXJlIGlzIG5vIHJ1bnRpbWUgb3Zl
cmhlYWQuDQo+Pj4NCj4+PiBGaXhlczogMWJhM2NiZjNlYzNiICgibW06IGtmZW5jZTogaW1wcm92
ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgX19rZmVuY2VfYWxsb2MoKSBhbmQgX19rZmVuY2VfZnJlZSgp
IikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQu
YXU+DQo+Pj4gLS0tDQo+Pj4gICBtbS9rZmVuY2Uva2ZlbmNlLmggfCAyICstDQo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9tbS9rZmVuY2Uva2ZlbmNlLmggYi9tbS9rZmVuY2Uva2ZlbmNlLmgNCj4+PiBpbmRl
eCAyYWFmYzQ2YTRhYWYuLjM5MmZiMjczZTdiZCAxMDA2NDQNCj4+PiAtLS0gYS9tbS9rZmVuY2Uv
a2ZlbmNlLmgNCj4+PiArKysgYi9tbS9rZmVuY2Uva2ZlbmNlLmgNCj4+PiBAQCAtMjksNyArMjks
NyBAQA0KPj4+ICAgICogY2FuYXJ5IG9mIGV2ZXJ5IDggYnl0ZXMgaXMgdGhlIHNhbWUuIDY0LWJp
dCBtZW1vcnkgY2FuIGJlIGZpbGxlZCBhbmQgY2hlY2tlZA0KPj4+ICAgICogYXQgYSB0aW1lIGlu
c3RlYWQgb2YgYnl0ZSBieSBieXRlIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuDQo+Pj4gICAgKi8N
Cj4+PiAtI2RlZmluZSBLRkVOQ0VfQ0FOQVJZX1BBVFRFUk5fVTY0ICgodTY0KTB4YWFhYWFhYWFh
YWFhYWFhYSBeICh1NjQpKDB4MDcwNjA1MDQwMzAyMDEwMCkpDQo+Pj4gKyNkZWZpbmUgS0ZFTkNF
X0NBTkFSWV9QQVRURVJOX1U2NCAoKHU2NCkweGFhYWFhYWFhYWFhYWFhYWEgXiAodTY0KShsZTY0
X3RvX2NwdSgweDA3MDYwNTA0MDMwMjAxMDApKSkNCj4+DQo+PiBXaGF0IGF0IHRoZSAodTY0KSBj
YXN0cyBmb3I/DQo+PiBUaGUgY29uc3RhbnRzIHNob3VsZCBwcm9iYWJseSBoYXZlIGEgdWwgKG9y
IHVsbCkgc3VmZml4Lg0KPj4NCj4gDQo+IEkgdHJpZWQgdGhhdCwgZGlkbid0IGZpeCB0aGUgc3Bh
cnNlIHdhcm5pbmdzIGRlc2NyaWJlZCBhdA0KPiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIw
MjMwNTEzMjI0NC5Ed3pCVWNVZC1sa3BAaW50ZWwuY29tLg0KPiANCj4gTWljaGFlbCwgaGF2ZSB5
b3UgbG9va2VkIGludG8gdGhpcz8NCj4gDQo+IEknbGwgbWVyZ2UgaXQgdXBzdHJlYW0gLSBJIGd1
ZXNzIHdlIGNhbiBsaXZlIHdpdGggdGhlIHdhcm5pbmdzIGZvciBhIHdoaWxlLg0KPiANCg0Kc3Bh
cnNlIHdhcm5pbmcgZ29lcyBhd2F5IHdpdGg6DQoNCiNkZWZpbmUgS0ZFTkNFX0NBTkFSWV9QQVRU
RVJOX1U2NCAoMHhhYWFhYWFhYWFhYWFhYWFhVUxMIF4gDQpsZTY0X3RvX2NwdSgoX19mb3JjZSBf
X2xlNjQpMHgwNzA2MDUwNDAzMDIwMTAwKSkNCg0KQ2hyaXN0b3BoZQ0K
