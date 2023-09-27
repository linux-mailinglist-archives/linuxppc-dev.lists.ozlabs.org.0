Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD57B0985
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 18:03:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=A/gdJTvM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwhGg71kFz3clv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 02:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=A/gdJTvM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwhFk60Wwz3c60
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 02:02:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ubp1wZdjWDQy/etPz/ImEhio5xHhCXKdZWQvzI2ie/Tidt48nkqjU+sKf6Yf4s+k1gmbN8bKT6DC8Omd44Tb0kGSbWJiSa2ZMjSXZmAJ8g1/HL1p7MXdINsKUNvxcNZ1k0Cvtr+lKqkj4KPMvLpOaLOJc00yvfgGzK4draHKS62v9560oMIlX/uqLTcsu6oWTpPDiuZrMzkHm1kqSmknkjgjOK6PHoE7F612e8jORZhrldnW/UJRN2AqR80Kiv3Di+nX2eo5Zs0BthKj5HpW/WcKplOM4ngBrax7ZPdgwrz4JG2YLVWUKlXcvkJe96WeOjwMuXg52sFnC4wjJhO5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBKNQf79SLsNVFbzvjyy9qkwCFtquBfwVGKlvrpzB5Q=;
 b=UYKXzm6F34YYblj3/t564DqkOzWtCIqh0YH4vr+kOaPpt1gakuw7X6eW2IwVl+6QBeihnbVLSa0/PU5rTYfcbdJNwsROlcHpH5HRQ49p+qXvvYL8QfPps4+mfaSeTOrJ22F17oY4gUAxqf/AiKSmod25PDq0KFdIwKuVHgxNDY+T3LqRfNVPHDXOJPYg3Hemha0yns5vdxW7hmf3PCN7JNyJBgCOgik6qA9k+Fta+liEgJDj5WvjsWdGZZXrgXpHH6HgU+OJiZXlScG70/+bgUNdqBpod9htztNZLoIfFvtuKBWWUaE4YIBnNxKysM8AGuUseciFTFfX8zENral9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBKNQf79SLsNVFbzvjyy9qkwCFtquBfwVGKlvrpzB5Q=;
 b=A/gdJTvM7T/RL0erHfWNDObPw55gIqz9N2/0pvxULyyjGL4wm8kKtuai8JKHTe8LDkt4HCFwsFZcasjNaVV5GlpCiGa79PzdteN8Pp6UjjqkE7maELAgRy9ROBTK/8l/WGcuIJ72bQYk0wSyIgZa+6tDwMfBDKvP3Zc1LFNxBA+bCz4QbTyv4OzJ7wRmr3uPKFt7kXiCv4cZJmgwTRm6LZfgbX7YLho9qIGy73iIwCajPdA18uhLl5LR5AgHZJ2TdCRlqgt8rR5/TN8PRLDa452OJEqOuyohhy5QRe3DNpbOelRjXW8HUA0YOR1O9ddEdgq9ZqhBUbakjwzV9+lksQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2308.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 16:01:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 16:01:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ariel Miculas <ariel.miculas@gmail.com>
Subject: Re: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Topic: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Index: AQHYe+wVZ/yxK3g4vk2yaVkdS+lXbbAxXrMAgAA5JQCAAB6KAIAACaWA
Date: Wed, 27 Sep 2023 16:01:57 +0000
Message-ID: <9afcdb29-db22-3f5c-b596-da7567b707ff@csgroup.eu>
References:  <CAPDJoNtU9Vuh87PxDkxo+7M_Kg_K4PPNGksPuW_guFbChYu-jA@mail.gmail.com>
 <20220601155702.176588-1-ariel.miculas@gmail.com>
 <CAPDJoNvZmeeU+T94rp8BJ0+bH5pDXQCEKPHiQF0Kcu=JrRRfrg@mail.gmail.com>
 <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com>
 <CAPDJoNuR8pNa+rp-PG_eeS14EvpMBLAmjNf9JvL=+0QTpwww-w@mail.gmail.com>
 <d6bd3632-207e-b232-b4a1-0c592a3aaae9@csgroup.eu>
 <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
In-Reply-To:  <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2308:EE_
x-ms-office365-filtering-correlation-id: c809fa9a-bb75-4d0f-c812-08dbbf7313a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JxC1lQ6EHdohXteZa9i8DqOjzdNTIbYiAXM8o04LZLvCor8X/SXkZLMcR2M2/DALnmG2aSByHh4SeO4i+qd+li7WbIgXgjhnpBCQkBqmpqDGPYhllxcG/dDcbEfpCXhW6CKZaNafP+KiBjeUdn+emgL40MR3M/52Gp1GG7oA7w//K/p51xi5Yu9oumuhkYary0Wc9gynDrgBpu6BD80WjmWUA//jl1s1j5tIS9h6ndm/iRt93IGKYOxHkVc/klaDYi9rcNMScMScUyEt70cCnUamD4bsMfGrn5uoxZjABLDC+i3pyB2A5LT/0CJQ0VA0aJm4HqqU8QentjgWSh4sSV0aFEqNZsDtwhmu4TRecviBMddIYwEddRU5zqcjt3k7+2Jk0EcGNbHQPtKEfw17Z7l4mBt+xwOETwW3zaAQEDP6L0pRi7etG7MQ8eI4sueYlBipzwjzgYsAGzfBdlMmYLjGiGR4AM0+j4ilcEz943ZQ4TiAM4clIIrsOFtxWow4oNx9/9urt6i/Omka9VEGstW3i4wTpAMaEOp2LrjND8j+/uuHpJmaUXJFhHLYrRqQPkLXxUmTS5EuDB1RXDIWW7YzAO5KWM4RafscRcz4Z/WAQ0jXRIMxS4LfnrLvzNBNbIDbE+VOUDK//ifpzCSSoqG9cXsY8XcUCeU0fxhBxbI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39850400004)(230922051799003)(1800799009)(186009)(451199024)(2906002)(4744005)(38100700002)(38070700005)(86362001)(36756003)(71200400001)(6512007)(31696002)(6506007)(2616005)(966005)(6486002)(478600001)(26005)(41300700001)(44832011)(31686004)(8936002)(8676002)(4326008)(316002)(6916009)(122000001)(76116006)(91956017)(66556008)(54906003)(5660300002)(66946007)(64756008)(66476007)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eTk4b1RiNHh5RzdMMTMwZ2dFVXVQMXQ1UnE2WGdEQitta2l2UG5lcTJZeHFn?=
 =?utf-8?B?MzdJbkNSTXlVUW9vdmpGOUMycXNjZFdJVzF4bFpLL1JiMnJEdWNSSWtKT3FW?=
 =?utf-8?B?T0kzNVVYRmlLOFdGTlJwd0o2MHB4dlQrVzd3SnFXSEJ5cmp0Q3RlbkpWRFkv?=
 =?utf-8?B?V0NUWmlsSnEyaGdqb0pxc2ErYmdraUM2SUpHMVNZMTZLNFlMcDM2dTFzeUpZ?=
 =?utf-8?B?TXJqczRUaEhISndvTHV3UWxaZHlmNERobmhJclJrajRSczVRSGg5ZTRSWmxU?=
 =?utf-8?B?NDNrOHVDOEh5M3A3UTFZNWtQVm4xTTh2VU1IVUJOdS9lM2hWa0J4K2xXdWFL?=
 =?utf-8?B?NVl4VzZveFhqbGE1L3lvcDRubjRWbVhFTmhES3ZXT2V6TmJFR2tzWUhWdENv?=
 =?utf-8?B?Y3FCSW04U1V4OXgrT05GUkdNekRycXQ3dnRTSkF1WVFxVEpYTE5YaFhPNDAz?=
 =?utf-8?B?aGJPVnhnZ3N0b1VOdnhVVXdSUnl2UzgrQlZKVmFaVjUxV2t6cjdza0dHUDFJ?=
 =?utf-8?B?SEpmOVlxQ08xUFZoNytNSSt5YUl2QVl5Zko4K1ZlREtKV0trUEEwZDF2dFV4?=
 =?utf-8?B?Z1RLYWdlcEM2bW1LanRjbTBvMEw3M2twbDdVQ2pLWEtURE41MG9hZHQ2cGdY?=
 =?utf-8?B?SzRqZXlOT3BlTnBDbEsrOC9ZaVVybnZxdkFXTVdYdHd4YmdKa2IyaFViVGtR?=
 =?utf-8?B?VGZRZEhIeTY3U3lUaXNaZWQvc1lTcDBWelZqSk9VelRoaXNJRTNRakFCZXFl?=
 =?utf-8?B?ZzRwTWhUWVF2NHdQcGl2VFNjZXBsZDlNRHBab3p3UjV4V0VYWEliQ1BCTVFz?=
 =?utf-8?B?SzFIVHgyNHNSbzZaWmtMV1dWUVlEZ0VGcldFNm5keERWVFBrdXNrenZBUTFE?=
 =?utf-8?B?R01BU0d6YkVWVDllSjA5emNQT1ZzM1RNTmIxN29mNEU5cllMaFVIVzdHL0dj?=
 =?utf-8?B?Z3VwekNyUXNveFlnMzhZSERxV3l2WkhrUkI1VnNoR1NJTFNPRTlWU3VXN2Nx?=
 =?utf-8?B?bGRMY1Vhb2Mvb1ZtczNJeWZuT3YxZ0k5V25uQnV1SnM1akhDbnZML3lpYzM0?=
 =?utf-8?B?OXEvbzgwbXdnMEpFcmlWMVJNYXhwY3dncmZBS1dOeVE1NmdSQU40cWtyai9X?=
 =?utf-8?B?akl1WkZUZTdYVi9HcmpVR0NtYnYwNWxKS3ZFRzZlU2tJcG1QVWk3RU1tQ0d4?=
 =?utf-8?B?MDV2Y2gxaytBcVlXemVWQWFoM3NvNXRQRmhzRXhVcXhxL1Q0bVB5bHRDN0lP?=
 =?utf-8?B?ekpnZ0RFeFJDeGpzSTJ5VVZuTVVIZ2pwQnBQK3dpSnRYMzV1N1c3dUlPZHBk?=
 =?utf-8?B?ZXBMVTdrVEhzeDdYcERnVjlURGl6RlVHQmtVcDVwd015ays4MDBQQXZIRDEw?=
 =?utf-8?B?LzduQlV2YXpoai9meXM5TDZSNXd6Ujlxbit5dHRnenFZZmw5QlMrRkhiS0R3?=
 =?utf-8?B?emNWa0ZLM1k3YVJMejIxWWoyR0pNOVpoWWNwRkhnTEMybUExSVZRU29KVEhL?=
 =?utf-8?B?OXhmVzRlQnl0UzlUT3ZxNHdPQWUrSEYrRzk0ZWRRKzRtNi9MK29tLzhvSUtt?=
 =?utf-8?B?NFBwNFVVem5rNGZrMFNpRHpCZ0lKVjBOeEljL1I2VTFCSWpmak5DVU8zNE5W?=
 =?utf-8?B?QlVsazgxNnFnb1VzQ3kyb0dRS0x2T0IxOVFRTjdhR2xyZVl0dXIrRVorT0FN?=
 =?utf-8?B?TlVjQWpDQlhpNEY1Y0xwWDRXSy9vSHNFeE94VlV5Z1BWMGNxVW1WbHN6a0xn?=
 =?utf-8?B?SzRTTzZNZDFxeEdWTHlMWisxRUM1QTNNb2lsYkE2cjdUS2ExT0Vyb1hsMEJj?=
 =?utf-8?B?bkZSc0RjeW14b1ZyTEpNNHNBS0JLMmVhTnRaVDY4ZnBtaHRDU0tvbzNTU2Zp?=
 =?utf-8?B?RXBnVG9CZUxWZWFCMUlnUEt1eHlSQWNSNmdBSk9YQVhVb1hETzFIZk55TGZh?=
 =?utf-8?B?bElrUGhhUWl4WWd6bEUvcXpsTDUwdXFGOFBsWi9ZMThrQmpVRFRNanhQTFFp?=
 =?utf-8?B?SzR0cVJSUWxHYlVhVTFxTzd1K2RBNWRFQ0RPQW4zWHhJWEcyc1FtWk1Ka1Nx?=
 =?utf-8?B?eTBlZVlvdG1WdjYxcTJYZi9GYTEweHlwN3VLM2t4dzAvQ21lQVUrdCtKNmpv?=
 =?utf-8?B?RGZFNFNQdDcyM1psSjZLMDFKNkZvbW5nVkJsMVM4OXNTaVZNdGhTSm1GWHpm?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D805823BA2DCF429115D680CD69E3B1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c809fa9a-bb75-4d0f-c812-08dbbf7313a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 16:01:57.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2aUEIYzXg6JlLBBIEHWyXuW/lKQQCmGXZNTfezA/CHbrye5lY6lJZgAD3sGbskiFxS8vPVGIvKtcn1MY8LTQaH4Ye/PcRvw61zPZPXcnms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2308
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA5LzIwMjMgw6AgMTc6MjcsIEFyaWVsIE1pY3VsYXMgYSDDqWNyaXTCoDoNCj4g
SSd2ZSBmb3J3YXJkZWQgdGhpcyBvbGQgZW1haWwgdGhyZWFkIGZvciB2aXNpYmlsaXR5IGFuZCBk
aXNjdXNzaW9uJ3MNCj4gc2FrZSBhcm91bmQgbXkgcmVjZW50IGJsb2cgcG9zdCBbMV1bMl0NCg0K
QWgsIHJpZ2h0LCBpdCdzIGJlZW4gc3VwZXJzZWRlZCBieSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjA2MDkxMzMyNDUuNTczNTY1
LTEtbXBlQGVsbGVybWFuLmlkLmF1Lw0KDQpTbyBJIG1hcmsgdGhlIG5ldyBvbmUgc3VwZXJzZWRl
ZCBhcyB3ZWxsLg0KDQpCeSB0aGUgd2F5LCBpcyB5b3VyIG90aGVyIHBhdGNoIHN0aWxsIGFwcGxp
Y2FibGUsIHJlZiANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBw
Yy1kZXYvcGF0Y2gvMjAyMjA2MTAxMDI4MjEuMjUyNzI5LTEtYXJpZWwubWljdWxhc0BiZWxkZW4u
Y29tLyANCj8NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEFyaWVs
DQo+IA0KPiBbMV0gaHR0cHM6Ly9uZXdzLnljb21iaW5hdG9yLmNvbS9pdGVtP2lkPTM3NjcxOTkx
DQo+IFsyXSBodHRwczovL3d3dy5yZWRkaXQuY29tL3IvcHJvZ3JhbW1pbmcvY29tbWVudHMvMTZ0
ZjVuZS9ob3dfaV9nb3Rfcm9iYmVkX29mX215X2ZpcnN0X2tlcm5lbF9jb250cmlidXRpb24vP3Jl
Zj1zaGFyZSZyZWZfc291cmNlPWxpbmsNCg==
