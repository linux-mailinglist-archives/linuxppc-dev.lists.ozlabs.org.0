Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA2682995
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 10:53:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5gNT4SJgz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 20:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FXLhIB/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.21.67; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FXLhIB/b;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5gMV0z2Rz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 20:52:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDeAWC5KN3QRUydFbqPQVZp56q11eOH94Q2w6QTbJW2kz9wUXTEs8n1LN1ETMFJm2UsmBs8CwxI5JrMzgMCPOskC7xZ9IJTFtGjifTjxzEX6EDS8n/jWwQ+udkoe3CcnOUeE1dhLFRw9yjfeNiZd2l0d9mVJDE1rDcc02YT276eMUHXUnyL1KwVGH228oeUavGz55JPRoqxNxLkX0coTgAnUMcoVHHL2BWJkj1Jy/xQiMlhO/zcvS5SJZjC6Ob55TRAtuMilXHaqY8VCagp/x+Ze1/5c7I0V5iKVI0pyaAE3jK28T1a4ANjPaPvl44DMPPb7jDIgzsfna/ABujogXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay2G+0NYoFKOzTuzcfJy2+P+NaP2I76YVywb32NOtiw=;
 b=B9DR6N0hNuHl3aJo4gYR+u9/N9xiCxyDbmEh1O+zVyzPP2PgF9jQ7WduL34P8ipOHOAOCkIo/sa/dP4ECKEHSbcoiVvLpMNVhqKrjeZukErRt+gVBRLCoAtWDP+AyjG+VczTEmUDMNhwH/NXmKdDQ6bquEJ6TZxhSxxLWwUaJGY5EZQ1uRerhr1pnDCPCUe9amdtom6FtJJFGpA0NwHiO/VlEh3DASkqH+XV42gHLcxQG4909cptgHd0L3EuOzHViHQMgIaV0nZOPRLK362V7+YfiuInwrKu5FVMs4+azCfWAmAAbrYihW9ZJOkcrxolS9utGOQVe2/fyV0TFQ2nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay2G+0NYoFKOzTuzcfJy2+P+NaP2I76YVywb32NOtiw=;
 b=FXLhIB/bSnVwhz3E0EdMNYRStZ+3N8OhVvfAg+f2edz542iYj+PAQ537xxiidfWWV2DGwXYzL+OTeghPEqorM8rLtku7+xtT3hnLyc2ma7y2I2aTMvgMAW/+QOlfXP3Pu5AXV9ZZWZhdOLKxKmhjVJAsShhGm57QlCqT837eRGc/i1w+UQxWst974Sg83OwNEZCa76SMjaviFINFqOvixQijzegUzRxnH8NazaDNQdHSnl51y75Z9vPzNK1nxOWymnIl+rTP9nIHS9e+yLC/PRQ17Js6qdEsxq3hiVAF83TMnysD3CT8XLtFqUkS8KS8uvp/gZD9EGWp94sen00iCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3378.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:52:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:52:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 06/10] powerpc/bpf: Perform complete extra passes to
 update addresses
Thread-Topic: [PATCH v1 06/10] powerpc/bpf: Perform complete extra passes to
 update addresses
Thread-Index: AQHZBVqCkj8YuVwOdECCOwoQkmb0la5rr0QAgAn/9YCAIeWEgIAhE/OA
Date: Tue, 31 Jan 2023 09:52:16 +0000
Message-ID: <d53644df-7f02-00fb-f022-58ce2436a245@csgroup.eu>
References:  <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
 <c13ebeb4d5d169bda6d1d60ccaa6cc956308308d.1669881248.git.christophe.leroy@csgroup.eu>
 <1670926819.9nqhz2fj7v.naveen@linux.ibm.com>
 <57406145-4199-00f7-8593-da2f498116f1@csgroup.eu>
 <1673339740.lyeaje9o3l.naveen@linux.ibm.com>
In-Reply-To: <1673339740.lyeaje9o3l.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3378:EE_
x-ms-office365-filtering-correlation-id: 82936b64-dfe5-4ad2-032d-08db0370d5d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  y31f1idiZG9O3ZDh8a3rE8cocLmxdjL07ywG0nmw3Z+KPEZ5zJ0BNZnzRuxVvrBrQkl6sM+N2ktLee3fFlM6cdpQ29Jm8blGL29lqAEEm3z1GDCyAP9uKu37ISLbY/LYK+/W2xvs2HHxgPkc2uHok3m3E8xOXXnuWtOXW3N3KdG7mlXG4bfkGabnYSRL6r+nep7Uvy8+Br/ZBs5reiOS7vABkK36HJtmCumqaiIFe9GwSg0LytRx+qf4vjT2LMl6PVho2VAMLmnEdn/abQgrKZsxCySdegT5nAFinIXfu5flTU2Hp03IQvcQ+b5t7cgXiKk6Y+jTA3D9XCxm1LamuovQqmR3yKG7qAJ9wWDb8WFo/OoCm8X/lXO9Fn8K97EQun2mKnlxlg6C0PaL1kcLJsV/w8DZBfdTx7B3RFXeIX/Er4imOQnBw4/7tEquK3ltKkaphgRWj0Xssna4mQBQNcXZmYgTyXgRioDqiTA07NQkVqIBmyAY54FVX2EOQIDdnM6gU5W6fjqct1xPe7jH6qb2warirjDHoJcZYxWbn0n2MVDwj+D5DFoMr1l5dluOMx4t2qoV3tekVquvelfX2aFqMb4u2y0/rhXZIzvAAiQR0sBHbXnfb3T9XK7QChQT8dkaR7fswXiAdU0ZnVfuJ32dQnQFB9OupqBR242CkMronWdZWhMD0g1N6A2yx+kFgz4sn9lRAcRNvEY6cCDylm31j7W+y/xrFBPFVQCJQ9ET1qfB3tlCyPX03lefZDxdmLUKKpTVd3sIJpv6utegcA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39850400004)(136003)(451199018)(44832011)(7416002)(83380400001)(38070700005)(2616005)(31696002)(66574015)(38100700002)(122000001)(86362001)(15650500001)(186003)(71200400001)(36756003)(2906002)(6506007)(26005)(6512007)(478600001)(8936002)(66476007)(66556008)(66446008)(64756008)(8676002)(91956017)(41300700001)(66946007)(31686004)(76116006)(4326008)(6486002)(5660300002)(54906003)(110136005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TjVyM0hhSm5NUGFhc1NrUW1yc0ExN2JDdXdrOEdIZXZaQS9ybisvOW9oaWJG?=
 =?utf-8?B?ZGlwdzR4dnN0YVFmb3QzcE1tUERLWG81S04xQkdjM0c5eTdBbTNSQTRQN3FV?=
 =?utf-8?B?WEsrUElYZWtnd1ZqYkU0M0FCY1RNS2xocjU5UU5OWllhUHJqVjdRR2xScTUw?=
 =?utf-8?B?L1JTaERRYUR1cDNEcG0xbFJaZFU3ODlsR0VXQ2p5ZlFzTVo4K2NXcWFycVBo?=
 =?utf-8?B?K2EzYkp2cGp1VUxIemNoaWJNTXNhbURNZDJXY25lMzJNME04MEIyeEZBeXdn?=
 =?utf-8?B?V2tzT1A1U3VJTnBJK0hyQ2t6WFVEUHhheC90c3VlM3MwVG0yQ1hueTNBSVJG?=
 =?utf-8?B?NEV2YVErZTVna2dXdWN3NkV0bXJ6bTNwRU1sZmtTMk5yV2s1ZGJSK1gzSXhO?=
 =?utf-8?B?bTE1NHRMYWV1YitsVDZ6aTIybW1sdWV0b2ZLUkFrT1NGc09BV0lQcUw1RWJq?=
 =?utf-8?B?V3pjRUd6bVcyM1JDNjZtOHNQS2JJcUszajNlMXVkZEFLMjVJOGlEZG5Yb2lZ?=
 =?utf-8?B?azJ5c1RRZllmNTg1MzJBOGVpS3RIQnVMaERlV3lzRUtBU1hkTVpCdGtyRitR?=
 =?utf-8?B?RElTaFNoaGtzbG5LNnBsdDdBalBJcTRmU3JXUi9TeGxLUUNDQ09DdnJhYVE1?=
 =?utf-8?B?OTdWVEZJVGdOTUVMK3hONEg2UVJlZE5nM2Z4OXhQV3hOc1pDcXNuL0NzYWtE?=
 =?utf-8?B?enN0cXFTN1RzNFNLaUF1alBBallCb3k5eGkwOTVZa1RNWEhLRWlNdlZNK1Vu?=
 =?utf-8?B?dzBKcVI0dFI2Qm5PanJ3eEpBZkp1N3NzRGNZUlJiQ0tsejFNa3FxRTA2WDRZ?=
 =?utf-8?B?Z2dSNTNnMHFRK3dya1lVdnd1UW14YmJST1huTXk1S1pRZ3huQS9vK0ZvZHRi?=
 =?utf-8?B?MzhsUnVJQ05DVThWSFRvdXFpUUhnM2JSM1BvU0oyOWFjVjQrVG9SOUw3Q0JM?=
 =?utf-8?B?WDhuZXZMVVpRV0V5T1R5Wk4xb1VCU3U2MkMwTWlmcW1od1ltTW1jYzkzcjRE?=
 =?utf-8?B?blVid3Uvb2V5c3NLM2l0L1Z4dGdDVVFPNXljcTMwczlGaUNBTHBaTWZHZ3Yy?=
 =?utf-8?B?ZjVQYXNBeWFHWW1GMXVOWUxFbzlNZnl6K1FEYktMOTFQODltYXB4b3lXcWE2?=
 =?utf-8?B?YVRyYWNGR0txVzNGck1EQzlVN3pHLytwRER2czMwWjNLNG5TRTlSWnl5V0JO?=
 =?utf-8?B?M3lvVnFvY3FKOVN4MGt0SE9ZZ2hydzBxYmF4NW9yMDV3dkVORkVqS25Kbm9P?=
 =?utf-8?B?YnlMRHFqOGd1WERTZC9nWTBZOHc3SVFmUmJHM1VZc0Z6bXJDSkNocjM4Wk1G?=
 =?utf-8?B?N2JUeElPKzVuVDZOSVdwWEhuK0ZkcURTMUR6T1hXNmY0cnd2dVVmSUtKaU42?=
 =?utf-8?B?U2ZKSE1hUHdkNUJ6Nll5SUN1Z0FFaGJVLzY0U3R1U1lncnFPaEJFWjdCWUx1?=
 =?utf-8?B?YzdLYmplWkJaa0hHbEx4alJWZ1VhS0c0V2ZuTy80Y213TVMwdmZvbEhPT0c2?=
 =?utf-8?B?eUZ2TC9NUlR2RGRYWHA4T2tlT29VUFBIbmZxMGUzcHFFYnhjS2JFRCtVV29F?=
 =?utf-8?B?MHRMeG9vQ1lNajAvTS9Od2xucEIyVjdvK3VsSGk5ank2NHV3bmoybWRtOEI5?=
 =?utf-8?B?S2NXNGRsblAxVEl5eFEyclRpY0NweWFBNjdNUVlmQXFiQWFaeS9oZnhHdWdt?=
 =?utf-8?B?WVFJTU1JME1YOTJEOFhUTVFiNWF2dmdUMTlSeitoY0xqWEQxQkU1MTBIa3lJ?=
 =?utf-8?B?cHIxcEpHUjdTTVpRV1FJNzMxaEo1UEErTkJZbkNBRUFISjVuZ3h0enRKNGJ6?=
 =?utf-8?B?Wlhna3dJOG1OQUNzcmJGeHVrSXphY2MwWWVDR01FaWJ1Sm1VS2VqVWkrZWc1?=
 =?utf-8?B?WGdZZ2Fob0QvcUFxdzBQQW1uc3l3d25LM0piY2FMU24xS3V2azJBdWpreEtu?=
 =?utf-8?B?SlQ5bWUza3YvV0JBM09rYUpIbHlQRDVqMk9NRUs1MkdvUjhEeldYUGpJYU9U?=
 =?utf-8?B?QUhvcVZ6amc1L1daMjlWVDZ5Nk5iU1lXaENUSlFCNklKQ2RucHpSWDVsZEZF?=
 =?utf-8?B?L0xHUjdiVURwb1NqbmZUNG9PcS96ZFhRTmk1OUFhdnNGU1M1UVBhb0RPSmht?=
 =?utf-8?B?WloxWWs1WEhSQmk2QkNkckg5M2RsWVpsWkovL3l1cVB2c1FBZHNXWUJ3Qk95?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03F5160C47701A4FB38CFC1E766B1B5A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82936b64-dfe5-4ad2-032d-08db0370d5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 09:52:16.1497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28eb55Wj7xJRGiPQLnBRJEKszRe363v/DdaW00gz59SpnqjkWUXRzkdQX8N9fz5IRr8s7NAJTlk63U5yHSka7ypwNp3oR5yvkDsNZEyYbCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3378
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzAxLzIwMjMgw6AgMDk6NDQsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTMvMTIvMjAyMiDDoCAxMToy
MywgTmF2ZWVuIE4uIFJhbyBhIMOpY3JpdMKgOg0KPj4+IENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+Pj4+IEJQRiBjb3JlIGNhbGxzIHRoZSBqaXQgY29tcGlsZXIgYWdhaW4gZm9yIGFuIGV4dHJh
IHBhc3MgaW4gb3JkZXINCj4+Pj4gdG8gcHJvcGVybHkgc2V0IHN1YnByb2cgYWRkcmVzc2VzLg0K
Pj4+Pg0KPj4+PiBVbmxpa2Ugb3RoZXIgYXJjaGl0ZWN0dXJlcywgcG93ZXJwYyBvbmx5IHVwZGF0
ZXMgdGhlIGFkZHJlc3Nlcw0KPj4+PiBkdXJpbmcgdGhhdCBleHRyYSBwYXNzLiBJdCBtZWFucyB0
aGF0IGhvbGVzIG11c3QgaGF2ZSBiZWVuIGxlZnQNCj4+Pj4gaW4gdGhlIGNvZGUgaW4gb3JkZXIg
dG8gZW5hYmxlIHRoZSBtYXhpbXVtIHBvc3NpYmxlIGluc3RydWN0aW9uDQo+Pj4+IHNpemUuDQo+
Pj4+DQo+Pj4+IEluIG9yZGVyIGF2b2lkIHdhc3RlIG9mIHNwYWNlLCBhbmQgd2FzdGUgb2YgQ1BV
IHRpbWUgb24gcG93ZXJwYw0KPj4+PiBwcm9jZXNzb3JzIG9uIHdoaWNoIHRoZSBOT1AgaW5zdHJ1
Y3Rpb24gaXMgbm90IDAtY3ljbGUsIHBlcmZvcm0NCj4+Pj4gdHdvIHJlYWwgYWRkaXRpb25hbCBw
YXNzZXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+Pj4gLS0tDQo+Pj4+IMKgYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAuYyB8IDg1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCA4NSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgDQo+Pj4+IGIvYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXAuYw0KPj4+PiBpbmRleCA0M2U2MzQxMjY1MTQuLjg4MzNiZjIz
ZjVhYSAxMDA2NDQNCj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0K
Pj4+PiArKysgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+Pj4+IEBAIC0yMyw3
NCArMjMsNiBAQCBzdGF0aWMgdm9pZCBicGZfaml0X2ZpbGxfaWxsX2luc25zKHZvaWQgKmFyZWEs
IA0KPj4+PiB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+Pj4gwqDCoMKgwqAgbWVtc2V0MzIoYXJlYSwg
QlJFQUtQT0lOVF9JTlNUUlVDVElPTiwgc2l6ZSAvIDQpOw0KPj4+PiDCoH0NCj4+Pj4NCj4+Pj4g
LS8qIEZpeCB1cGRhdGVkIGFkZHJlc3NlcyAoZm9yIHN1YnByb2cgY2FsbHMsIGxkaW1tNjQsIGV0
IGFsKSBkdXJpbmcgDQo+Pj4+IGV4dHJhIHBhc3MgKi8NCj4+Pj4gLXN0YXRpYyBpbnQgYnBmX2pp
dF9maXh1cF9hZGRyZXNzZXMoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY29kZWdlbl9jb250
ZXh0ICpjdHgsIHUzMiAqYWRkcnMpDQo+Pj4+IC17DQo+Pj4+IC3CoMKgwqAgY29uc3Qgc3RydWN0
IGJwZl9pbnNuICppbnNuID0gZnAtPmluc25zaTsNCj4+Pj4gLcKgwqDCoCBib29sIGZ1bmNfYWRk
cl9maXhlZDsNCj4+Pj4gLcKgwqDCoCB1NjQgZnVuY19hZGRyOw0KPj4+PiAtwqDCoMKgIHUzMiB0
bXBfaWR4Ow0KPj4+PiAtwqDCoMKgIGludCBpLCBqLCByZXQ7DQo+Pj4+IC0NCj4+Pj4gLcKgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgZnAtPmxlbjsgaSsrKSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCAv
Kg0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIER1cmluZyB0aGUgZXh0cmEgcGFzcywgb25seSB0
aGUgYnJhbmNoIHRhcmdldCBhZGRyZXNzZXMgZm9yDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgICog
dGhlIHN1YnByb2cgY2FsbHMgbmVlZCB0byBiZSBmaXhlZC4gQWxsIG90aGVyIGluc3RydWN0aW9u
cw0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGNhbiBsZWZ0IHVudG91Y2hlZC4NCj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqAgKg0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBKSVRlZCBpbWFn
ZSBsZW5ndGggZG9lcyBub3QgY2hhbmdlIGJlY2F1c2Ugd2UgYWxyZWFkeQ0KPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoCAqIGVuc3VyZSB0aGF0IHRoZSBKSVRlZCBpbnN0cnVjdGlvbiBzZXF1ZW5jZSBm
b3IgdGhlc2UgY2FsbHMNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBhcmUgb2YgZml4ZWQgbGVu
Z3RoIGJ5IHBhZGRpbmcgdGhlbSB3aXRoIE5PUHMuDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgICov
DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaW5zbltpXS5jb2RlID09IChCUEZfSk1QIHwgQlBG
X0NBTEwpICYmDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluc25baV0uc3JjX3JlZyA9
PSBCUEZfUFNFVURPX0NBTEwpIHsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0g
YnBmX2ppdF9nZXRfZnVuY19hZGRyKGZwLCAmaW5zbltpXSwgdHJ1ZSwNCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZnVuY19hZGRy
LA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICZmdW5jX2FkZHJfZml4ZWQpOw0KPj4+DQo+Pj4gSSBkb24ndCBzZWUgeW91IHVwZGF0
aW5nIGNhbGxzIHRvIGJwZl9qaXRfZ2V0X2Z1bmNfYWRkcigpIGluIA0KPj4+IGJwZl9qaXRfYnVp
bGRfYm9keSgpIHRvIHNldCBleHRyYV9wYXNzIHRvIHRydWUuIEFmYWljcywgdGhhdCdzIA0KPj4+
IHJlcXVpcmVkIHRvIGdldCB0aGUgY29ycmVjdCBhZGRyZXNzIHRvIGJlIGJyYW5jaGVkIHRvIGZv
ciBzdWJwcm9ncy4NCj4+Pg0KPj4NCj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFu
Lg0KPiANCj4gSSBhbSByZWZlcnJpbmcgdG8gdGhlIHRoaXJkIHBhcmFtZXRlciB3ZSBwYXNzIHRv
IGJwZl9qaXRfZ2V0X2Z1bmNfYWRkcigpLg0KPiANCj4gSW4gYnBmX2ppdF9idWlsZF9ib2R5KCks
IHdlIGRvOg0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIGNhc2UgQlBGX0pNUCB8IEJQRl9DQUxMOg0K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdHgtPnNlZW4gfD0gU0VFTl9GVU5DOw0KPiANCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gYnBmX2ppdF9nZXRfZnVuY19hZGRyKGZwLCAm
aW5zbltpXSwgZmFsc2UsDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJmZ1bmNfYWRkciwgJmZ1bmNfYWRkcl9maXhlZCk7DQo+IA0KPiAN
Cj4gVGhlIHRoaXJkIHBhcmFtZXRlciAoZXh0cmFfcGFzcykgdG8gYnBmX2ppdF9nZXRfZnVuY19h
ZGRyKCkgaXMgc2V0IHRvIA0KPiBmYWxzZS4gSW4gYnBmX2ppdF9nZXRfZnVuY19hZGRyKCksIHdl
IGhhdmU6DQo+IA0KPiAgwqDCoMKgwqAqZnVuY19hZGRyX2ZpeGVkID0gaW5zbi0+c3JjX3JlZyAh
PSBCUEZfUFNFVURPX0NBTEw7DQo+ICDCoMKgwqDCoGlmICghKmZ1bmNfYWRkcl9maXhlZCkgew0K
PiAgwqDCoMKgwqDCoMKgwqAgLyogUGxhY2UtaG9sZGVyIGFkZHJlc3MgdGlsbCB0aGUgbGFzdCBw
YXNzIGhhcyBjb2xsZWN0ZWQNCj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBhbGwgYWRkcmVzc2VzIGZv
ciBKSVRlZCBzdWJwcm9ncmFtcyBpbiB3aGljaCBjYXNlIHdlDQo+ICDCoMKgwqDCoMKgwqDCoMKg
ICogY2FuIHBpY2sgdGhlbSB1cCBmcm9tIHByb2ctPmF1eC4NCj4gIMKgwqDCoMKgwqDCoMKgwqAg
Ki8NCj4gIMKgwqDCoMKgwqDCoMKgIGlmICghZXh0cmFfcGFzcykNCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYWRkciA9IE5VTEw7DQo+IA0KPiBCZWZvcmUgdGhpcyBwYXRjaCBzZXJpZXMsIGlu
IGJwZl9qaXRfZml4dXBfYWRkcmVzc2VzKCksIHdlIHdlcmUgY2FsbGluZyANCj4gYnBmX2ppdF9n
ZXRfZnVuY19hZGRyKCkgd2l0aCB0aGUgdGhpcmQgcGFyYW1ldGVyIHNldCB0byB0cnVlLg0KDQpB
aCByaWdodCwgSSBzZWUuDQoNCkkgd2lsbCBzZW5kIG91dCB2MiBzaG9ydGx5Lg0KDQpUaGFua3MN
CkNocmlzdG9waGUNCg==
