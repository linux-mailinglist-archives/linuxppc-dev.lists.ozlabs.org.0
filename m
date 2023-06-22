Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3273973D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 08:10:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CNEYmFqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmqjF275Wz30PZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 16:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CNEYmFqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmqhD4lG2z2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 16:09:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQkxA6NcDHT9W+Bagp7WURQgP8XMP2jpJuh8kUVptTK0+yyRDrCmCGmlT08pugMEue3H6L7dfzNfD8RXfwmE/Pr+psojQg+kAeeFa801S24HrNx9AiyCMsCMRA7W72eiEdrrTcKLTtSG4s0zF5hEZxDbXucyhT/UY5ZyZEPR/m9Q+4lGwZ8uiVlkaT9j+NMYEIoIOIclwXqjkJfuLGkqr9BTyN/OQb5z087PnfyaAO3Nm3vDCn75uQnp2tsEl06+/N6urZ6O2KOPDzxRpwIS6pzdrFI3Mk2sF7S7B7jQquwsAsPF5dS539WXgdbS/AUrjDehxIp3kAAfv3i3W8eiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i5AwdFIMvn26hy1oYQLl4CXITGwYLrn/8PUmS213vI=;
 b=FA5kxw1c6jM77nz/VW6IDg/LAjQ4Gve65JDBRY0gAKtNuFOkvGXLFVR3ZHq+Oba1JJ7AtnseLxv6zExE8Pn8pZ9YfU7J/Hb/TFwBhk65m4RkKZsL7jqPb6H1x9hvJMal2wTcVABzqjTSHavKX7xDnJ76Z7RGpWce42mD5RCBi917ndBPTS5tPJYSSjPLRrB1euPK/Yc6WmbLukuNekgYY+ul5Jlb0XMzfFpxshPQzBAGyxUYTTEImurhhJtw58ZUkT6Cju1upQJONqS5acg3JNxoTKI840TwXMKXvL0Q0iSmFLNkyTzMQUrgJPUJ8wComEB7HMLDh48OLhSvVMT7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i5AwdFIMvn26hy1oYQLl4CXITGwYLrn/8PUmS213vI=;
 b=CNEYmFqxqvisRqd4q8cI/wNl9to4PQr2SLD58tuzZR6WXXridM/LU9wtevG4FIeEtU+hlznAr85WZlijjSkadUAs1lg3eK1KHimJrhTBbNHVwOZaYzzSiCiaVAVmv77XXGwws+RrGIxqmE8hc1Hqz90LlAy+s8LidI1cocKbcNbYrbYfrWIECs9hACB/SKAcSXjOO5KqAlAZ/7HW86hv+ucuvs+PZDCnqWQ5yRWov1qBm8Vexi6RbN21I7IMHHp/9OUNM4jUbRe5P9Z0v/sgarl+WzEcTDBbZVFQojVGni9eYSCzEw3DmSETqEzghaR9imXVQyUS5iJj1elDXJy8Sg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 06:08:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 06:08:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/4] powerpc/kuap: Refactor static branch for disabling
 kuap
Thread-Topic: [PATCH 3/4] powerpc/kuap: Refactor static branch for disabling
 kuap
Thread-Index: AQHZl52aOlNohzf3wEu8LmcGJFGJAq99f/QAgBjw1oA=
Date: Thu, 22 Jun 2023 06:08:49 +0000
Message-ID: <59568be8-1164-042e-d843-ef5d45c1591c@csgroup.eu>
References:  <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
 <4d775047675e9f8ae2a9db9cb8a0cc8216a309b8.1685963081.git.christophe.leroy@csgroup.eu>
 <CT5GCZLAL3QC.URC3KKG0M0WR@wheely>
In-Reply-To: <CT5GCZLAL3QC.URC3KKG0M0WR@wheely>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1704:EE_
x-ms-office365-filtering-correlation-id: d0abe652-7033-4041-2d41-08db72e725e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3qoMnS97XZkz2yoVnvijnX4Q4Ge4fP6jD3OmGX4p2tc15qRYjo47DerpxCMkn9Dm4S8403yNgAogJTeLTvtBHUypt56mcATwG+UgHQ6swl174VI4kJ5RUFxElQFA4G3HeMtYSbxBJHFEcoQga+aJXftmH3n9doCn0IjQJ3+X7xKexgizg+KRIJOlsXb/NjefJ2jyLOdU+KGb4LIFbDthlnhxJDY+4jmwNDlgp02Hl+KTTLgClVeA1pJVIOaQJvpPcTXEWm5aaXjPe0t/pSqUYQL51n4hjdC/1siIwf1ulTdrersz9Erf3JhP5SDRXi0ajCOsSy26V6z3gqyAnqNfWI83dqztN6w9xUaHwExxKZFND3R+vmKdmmzxzJy3ZLX6rhivs3AGnQ7GQNuVZ4ppEFhXsvoo0j5yeCfNGkw1xI9ydGGsuH70g9w5QLXuK9SM3my8bXJzZQznVwv7/uxa0r65oHq5KIhRqZlF+jy54pBTHumn4bTt14bpEONgWcgPxjTDyjjrVopPb6R5bgRAktCNAmJuN9tS8/z/meYpzced0bd3qnH4soOP3abA7QVPi6NNS8h2+XtVs6BdQcUB0KQdrlToAQBglzjewqfwCdo6us9oz728626+4IFzwZ9wlwA2ZMO9oWVyZJM3toNMKH46AFVLuElgG3I7X1jjcPImYp5elbWTWRBzYTBRe/ib
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(5660300002)(31686004)(66574015)(44832011)(2906002)(6506007)(26005)(6512007)(8936002)(41300700001)(8676002)(186003)(83380400001)(478600001)(38100700002)(122000001)(71200400001)(36756003)(2616005)(66946007)(66446008)(316002)(76116006)(91956017)(66476007)(66556008)(64756008)(4326008)(86362001)(38070700005)(54906003)(110136005)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VUEzVEF1ckVvY0MyZHRJeUFMWThBUklMK2JQL3RFd252RzRqZGJTSzhNU2J3?=
 =?utf-8?B?K1h0VmQwTFVWamN1cndwakt0OVVUN2hwc0Mwd0YwYmdhM3lZZ3VpRXkvQm02?=
 =?utf-8?B?ZTE4RlNEQ3FXdFA0c3pqemRyNmtxZVQ2VWF4QjdZWW9uenJMRStLR1JOL0s2?=
 =?utf-8?B?Z21YSzJKMWdxWWJBekF6RlZaMkZQcE1hYUJqN3YrYjhRYzN4dUl0dkVXVm91?=
 =?utf-8?B?RU5GY2o2UWZ0SHJTbjQ3UHNzelpzM0dXai9xWFRTa0x5OTFCMjRGYmNudk1Q?=
 =?utf-8?B?eDhpRG0zeDVYRHRNN3hQZ3p2ek5USExLUk9QaUVsdjVBOXFSTThhVHBUZ2Jn?=
 =?utf-8?B?OWNTVmlZbVk2UVBKUlUrYTNQOWtlYXZKSmlNeUR3VTJUUFM3TUpKTVFFS3Rw?=
 =?utf-8?B?UkQwRUZZalZzRlA0UEZBcUxCcE84ZDhrV2ZZaFppSmUxV1hYdTFGc05oa1Ji?=
 =?utf-8?B?WFFDb0QzWkpza2xRZ3pZUDMyZG1Hc1RmanI5bnB5RmprcFB5NUtsTEJ6WGtp?=
 =?utf-8?B?NGRmRVRaSjVZY1VkMGJUbWQydGdwc1gzc0MvZDdGemw5ZWd1b2cwRFdGWmt4?=
 =?utf-8?B?bWovM0Y4QkMvdnpzWEw5V0J2VjA5Z1ovU3JxaVNyc3QzYkdpb0pGalByNGp3?=
 =?utf-8?B?ODkwZWZLZTZqWUMvZitmRVQxSTdkU3grbzV3VFdhUDluOWtlZHA3MzNTdzBl?=
 =?utf-8?B?Rkw5cDhPZDBSZzA1NHh5L0pXWFNSQ28zTjU0Q1k5cG9KVUt5aU1YT1BYTlUw?=
 =?utf-8?B?aHIxOGdTMEp0dDZEbHI0bERUcHkwaEZCR2pKb3JFa0JyMjZvT1krc3ZLT204?=
 =?utf-8?B?YnoyUVVMRUlDNVNtS2tBWTk3Z2dncVpGLzhCYmk5RDgzRko0UnZxbGQvMEc3?=
 =?utf-8?B?ZXJFM0svcHZzQnJkK3BVSGJ0bzhBK3dtd0dEQXBZVVZaYkZwL0dRcmRBWFNz?=
 =?utf-8?B?ZDhsbklVdjdqRTZkWi8zdjQrYWE3N3AwYUtLeVpDaW1VWWVIeGE4L2tjMVBn?=
 =?utf-8?B?RkMyalRXbzd6MzBaVlFMNWlSS3hZZ1ZyT2pDejVkcFgwN3hCT0VZc2MzdXg5?=
 =?utf-8?B?MCtrdXRkRWpFdWlna05kVHhTNkQvbExkTEhCWFZDQXRPN1dUNGtiTDN2V1B2?=
 =?utf-8?B?YncwaEQ5TFVNYkY0UDM4NHNWZnpEcStmWGJUQjBubVpJdVVGVzlSajdPeU5h?=
 =?utf-8?B?OWdZdElYUk54MWJvelhtQm84cmsxb3paQldtUFY2NFJheElCdjR0bE9tUEF3?=
 =?utf-8?B?dmNINXZSckNtZlJzSUcyNHFoT0srZkFhcEtrVStKaS8rbEJ1NmdTU3Q1dFNs?=
 =?utf-8?B?ZXlWK1dGT2R2OW9sU0t3alhqOEVDR2tVN0VoZ3RsMUxzZEN4c3UzaHJSN3dX?=
 =?utf-8?B?VmdXYlJLcW1SL1htWFJieUNTbnI5bC8xTDVaZVNVSkRxUEdEL0orckNGaFMr?=
 =?utf-8?B?a0ZiQU9MTGJGTG1CblVoM1hZSGZEOXlJcTdtSkJleG1PQmhvVTlnMWV6SFRB?=
 =?utf-8?B?WUZTcFViMnpGenUvYThaUW5rSk1pVHlRcUxOcGQ5TnVlWHJicTkvYU9LTW96?=
 =?utf-8?B?am1FOVhpN2hudFhudmJHNUVjVmd1OVQ4UmF3aWw4MDlhMTM5NkI3eWlLRVlU?=
 =?utf-8?B?TUFPVzFoZHBZbzJQRkt5cDNIa1lpUGs5TUZmaDlONFJ6VGtmdWNlSHdTNGJ6?=
 =?utf-8?B?MUtJaktYcmVDZ0Zkdm55eXlpUnN3UUpGZndiTmJyeGowVUVkVkJlOGR4emU0?=
 =?utf-8?B?LzhYaTZJRW9uakdycUVvVUU1dHdGVk05QzA3OHo5YlB4T3JjaTVPb3FnYXpr?=
 =?utf-8?B?cEVxWVc3VGZLMzNZd0FYUExRUDhqUkc2blR6NGpTS2l5TFVHOTFWMnZCamdV?=
 =?utf-8?B?NTREMmdDU2hkNzU4VDRLUjk5dElEN0d2eHl4R0pZT1lPRGg3V3BtaGlMWTU4?=
 =?utf-8?B?ZzltYXhIaFZHNVVDcU9lN3pXM2ExMG9JVnNLQm1pYW9sZzBpZFF1cDd0ejRm?=
 =?utf-8?B?VXNmdWlMeTI4YUNGbTlYc29MMXl0U1Y2Ylg3enQrMktXd3pacWI4UjM3ZXhG?=
 =?utf-8?B?eFJlWEdPMGRYNEhwVmpWcEEwQmF0SGhiSmNQa3REejROMHJtWjQyNDN2aGdm?=
 =?utf-8?Q?Op3qTOB+g/Y6mVWJoZYWaY93l?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E7F4EB5EE0CC8428B1DC7AFA36FEB44@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d0abe652-7033-4041-2d41-08db72e725e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 06:08:50.1181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foBPIwCB5alINt64KkqmLL4G+T2ZlcxDDkfAIIH03EMdeA825rmlmGPVOuOPM3d9Hniv6nT6vmub/1NFXY2DCTUQWxYOYWKkus1frnVC0RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1704
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

DQoNCkxlIDA2LzA2LzIwMjMgw6AgMTE6MTYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBNb24gSnVuIDUsIDIwMjMgYXQgOTowNCBQTSBBRVNULCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gQWxsIGJ1dCBib29rM3MvNjQgdXNlIGEgc3RhdGljIGJyYW5jaCBrZXkgZm9yIGRp
c2FibGluZyBrdWFwLg0KPj4gYm9vazNzLzY0IHVzZXMgYSBtZW1vcnkgZmVhdHVyZS4NCj4+DQo+
PiBSZWZhY3RvciBhbGwgdGFyZ2V0cyBleGNlcHQgYm9vazNzLzY0Lg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+
IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL2t1cC5oICAgICB8
ICA3IC0tLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9rdXAu
aCAgICAgfCAgMSArDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdXAuaCAgICAgICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvMzIva3VwLTh4eC5oIHwgIDcgLS0tLS0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vbm9oYXNoL2t1cC1ib29rZS5oICB8ICA3IC0tLS0tLS0NCj4+ICAgYXJjaC9wb3dl
cnBjL21tL2Jvb2szczMyL2t1YXAuYyAgICAgICAgICAgICAgfCAgMyAtLS0NCj4+ICAgYXJjaC9w
b3dlcnBjL21tL2luaXQtY29tbW9uLmMgICAgICAgICAgICAgICAgfCAgMyArKysNCj4+ICAgYXJj
aC9wb3dlcnBjL21tL25vaGFzaC9rdXAuYyAgICAgICAgICAgICAgICAgfCAgMyAtLS0NCj4+ICAg
OCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9rdXAuaCBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIva3VwLmgNCj4+IGluZGV4IDQ2NmEx
OWNmYjRkZi4uOGRhOTk5N2E2N2JhIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy8zMi9rdXAuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Jvb2szcy8zMi9rdXAuaA0KPj4gQEAgLTExLDggKzExLDYgQEANCj4+ICAgDQo+PiAgICNpbmNs
dWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+DQo+PiAgIA0KPj4gLWV4dGVybiBzdHJ1Y3Qgc3RhdGlj
X2tleV9mYWxzZSBkaXNhYmxlX2t1YXBfa2V5Ow0KPj4gLQ0KPj4gICBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGJvb2wga3VlcF9pc19kaXNhYmxlZCh2b2lkKQ0KPj4gICB7DQo+PiAgIAlyZXR1cm4g
IUlTX0VOQUJMRUQoQ09ORklHX1BQQ19LVUVQKTsNCj4+IEBAIC0yNSwxMSArMjMsNiBAQCBzdGF0
aWMgX19hbHdheXNfaW5saW5lIGJvb2wga3VlcF9pc19kaXNhYmxlZCh2b2lkKQ0KPj4gICAjZGVm
aW5lIEtVQVBfTk9ORQkofjBVTCkNCj4+ICAgI2RlZmluZSBLVUFQX0FMTAkofjFVTCkNCj4+ICAg
DQo+PiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGt1YXBfaXNfZGlzYWJsZWQodm9pZCkN
Cj4+IC17DQo+PiAtCXJldHVybiBzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZkaXNhYmxlX2t1YXBf
a2V5KTsNCj4+IC19DQo+PiAtDQo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBrdWFwX2xvY2tfb25l
KHVuc2lnbmVkIGxvbmcgYWRkcikNCj4+ICAgew0KPj4gICAJbXRzcihtZnNyKGFkZHIpIHwgU1Jf
S1MsIGFkZHIpOw0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQva3VwLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2t1cC5oDQo+
PiBpbmRleCAxYjAyMTVmZjM3MTAuLmY4YjhlOTNjNDg4YyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQva3VwLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQva3VwLmgNCj4+IEBAIC0yMzMsNiArMjMzLDcgQEAgc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGt1YXBfaXNfZGlzYWJsZWQodm9pZCkNCj4+ICAgew0K
Pj4gICAJcmV0dXJuICFtbXVfaGFzX2ZlYXR1cmUoTU1VX0ZUUl9CT09LM1NfS1VBUCk7DQo+PiAg
IH0NCj4+ICsjZGVmaW5lIGt1YXBfaXNfZGlzYWJsZWQga3VhcF9pc19kaXNhYmxlZA0KPiANCj4g
SXMgdGhlcmUgYW55IHBvaW50IHRvIGRvaW5nIHRoaXMgcGF0dGVybiBzaW5jZSB0aGUgY29kZSBp
cyBpbiBwbGFjZXMNCj4gdGhhdCBoYXZlIGlmZGVmIFBQQzYgUyBldGM/DQoNCkknbSBub3Qgc3Vy
ZSB3aGF0IHlvdSBoYXZlIGluIG1pbmQuDQoNClRoZXJlIGlzIGEgZGVmYXVsdCBrdWFwX2lzX2Rp
c2FibGVkKCkgaW4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t1cC5oDQpGb3IgNjRzIHdlIHdh
bnQgdGhlIHZlcnNpb24gZnJvbSANCmFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQv
a3VwLmggaW5zdGVhZCBvZiB0aGUgZGVmYXVsdCBvbmUuDQoNCkFuZCBrdWFwX2lzX2Rpc2FibGVk
KCkgaXMgdXNlZCBpbiBzb21lIGNvbW1vbiBjb2RlIGluIA0KYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2t1cC5oLCBub3Qgb25seSBpbiB0aGUgY29kZSBlbmNsb2RlZCBieSAjaWZuZGVmIDY0cw0K
DQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9pbml0LWNvbW1vbi5jIGIvYXJj
aC9wb3dlcnBjL21tL2luaXQtY29tbW9uLmMNCj4+IGluZGV4IDExOWVmNDkxZjc5Ny4uNzRlMTQw
YjFlZmVmIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2luaXQtY29tbW9uLmMNCj4+
ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9pbml0LWNvbW1vbi5jDQo+PiBAQCAtMzIsNiArMzIsOSBA
QCBFWFBPUlRfU1lNQk9MX0dQTChrZXJuc3RhcnRfdmlydF9hZGRyKTsNCj4+ICAgYm9vbCBkaXNh
YmxlX2t1ZXAgPSAhSVNfRU5BQkxFRChDT05GSUdfUFBDX0tVRVApOw0KPj4gICBib29sIGRpc2Fi
bGVfa3VhcCA9ICFJU19FTkFCTEVEKENPTkZJR19QUENfS1VBUCk7DQo+PiAgIA0KPj4gK3N0cnVj
dCBzdGF0aWNfa2V5X2ZhbHNlIGRpc2FibGVfa3VhcF9rZXk7DQo+PiArRVhQT1JUX1NZTUJPTChk
aXNhYmxlX2t1YXBfa2V5KTsNCj4+ICsNCj4gDQo+IFRoYXQncyBnb2luZyB0byBkZWZpbmUgaXQg
b24gNjRzPw0KDQpJcyB0aGF0IGEgcHJvYmxlbSBhdCBhbGwgPw0KDQpCeSB0aGUgd2F5IEkgd2Fz
IHRoaW5raW5nIGFib3V0IGFsc28gdXNpbmcgdGhhdCBrZXkgb24gNjRzLCB3aWxsIGxvb2sgYXQg
DQppdCBhcyBhIHNlY29uZCBzdGVwLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcNCkNocmlzdG9w
aGUNCg0KPiANCj4gTmljZSByZWZhY3RvcmluZyB0aG91Z2guDQo+IA0KPiBUaGFua3MsDQo+IE5p
Y2sNCg==
