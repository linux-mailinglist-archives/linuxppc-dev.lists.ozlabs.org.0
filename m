Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF55615DCC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 09:35:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Kw260WGz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 19:35:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BOyI98Sw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.49; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BOyI98Sw;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90049.outbound.protection.outlook.com [40.107.9.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Kv40k3Bz308b
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 19:34:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiBjzZinUSIACTsKmdzE+XkGcoMwqUFniM/+mEMF0q7zFe12qWo/+MqCphGRhxPWLm9sQg1h60bLJGUnPlFnAf+iLnRzTEG7B9q77guvkny08E717/pBW5JEkVkf9k68mDdnclfPu40nAgIOUxPzO+YvS+uc4LskAXp2WOYcl0YFto1wdyD7fpKN7vtf2gE1isqfQeU3fLVaQUXfcf9pZcck3W8CQRrNi4k0S4nzPWmTX2JwcOWsB35yceMHGb9TJzQbh03my8okc3cqMN0/SYuKH7n5pQk/oHi8kAM9Yggc0010AIXkVeNcjq7YBJVFoYO1A1Kr/GzR1Kf0G9e3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7acZFBxrPSfPowb479xb8ajHIEUPyXNxXvFFNhjXSHw=;
 b=ljGvtGWIEAXqLJgqvat4Ksc4KhU1TFRd5jBm4Lc1Ajde9GFje93MnsqQOiPeViMXLSYr0A5w4LMeu5eWgCsI5xjVSVm8K6SaRkKJZmdJ+P9/QemzsPpfz2tNzvY1J/4BiPtuaJjKQyg1glYFptuXYKtxPF0I557Npy7bQNOhSkk9AQ0vdGAfH3eodvnRLjKGiToB05jK14/lWo+XU3LZqD1jFNIqtkkQ7zdvAQvembAQeE4fBtIaMRd3DAARU781ptOfZ+hcfmw9F+xKJRBCbA+ULdHWmn1o4JiRzff0Y8ldFe2UAdYlGUTRYGxMYvn5eGWwFLjbyWwJqvDMVI1zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7acZFBxrPSfPowb479xb8ajHIEUPyXNxXvFFNhjXSHw=;
 b=BOyI98SwTfs7Q2r//v4TEkhS7fkVD4XHnQF77GwR/okq3ROESQANo7jRwwxNWxzIqFm0Yl0UXVhDk0uWmzsDdNZi8kMKjNi5c2v2uGegtCqSGO74Sp3Ow26FCOZqh8m1RGaqytf/ro35HURNTI3I9fF/gUjZrefVQ4RLvLiorMEetkIPK9928h4V+c0St0WrvkVIp0zHRwGu3osw878yxZ0t1vJ71IlRuDuDPbiKXGfON1WmxU3gPVzh7D6nXspJtpuRcZF8kkb5qlRxkCUcZ1PwLkR3Yua1t0smSLdQpav7TieDyfDZClECW1SkGhYnykJ3Zkgv1u5tTwrQeqaxfQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2485.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 08:34:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 08:34:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: ruanjinjie <ruanjinjie@huawei.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "Julia.Lawall@inria.fr"
	<Julia.Lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] powerpc/mpic_msgr: fix cast removes address
 space of expression warnings
Thread-Topic: [PATCH -next v2] powerpc/mpic_msgr: fix cast removes address
 space of expression warnings
Thread-Index: AQHY44VPs74ieKtClUecmgFWRhhXka4rZMAA
Date: Wed, 2 Nov 2022 08:34:19 +0000
Message-ID: <02397deb-9a60-52cd-2222-9dc581a1be11@csgroup.eu>
References: <20221019063414.3758087-1-ruanjinjie@huawei.com>
In-Reply-To: <20221019063414.3758087-1-ruanjinjie@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2485:EE_
x-ms-office365-filtering-correlation-id: 44c30b8a-accf-4c8c-3236-08dabcad0914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +Nvvpu0JLeqdMkph5rE6NbM30LbTLbnXFFga/8kDSLvKuDe4WlLxEmoRxQnCffCvzTQ45XBFfiorDZBU36yZ6rB5ufbQh6Dm49ZdvflBmxlKKsXZ8mB+67u+IEkG9BQhl+TuL1ewplsaGq173hJVLo6Axc3QNk7bdlCZU2yRcwzdqBpxEcSxg6N2RBukYpQdD8qloRiW199WQy9WllzzUy8tqWRcXaSnvdjtEv3RJzlhcd/m/V+426GUN2KOM9ewgODErjxCCKYZNF9QKBRTfLfiLdp7Hre7Il5os8eDHXV1upuLlybGyA1xBwCl+r5+GosQYZ9ztnhmkPG4PLCpLw1y9AarYmaglmZGhjNpypxCy2jC2TkVeB0ZHcjzweB4gID/OeVSCvIIMJBfRq1/KAV9P0yHCSUH26X9aBJ3BqWz3CydHpJP1ktjyxNjIcWoM/AgVnvSdzx9svmJ3ocS/cZ280t6z8NplSH7ZjDBVGpe/XvOC13Lw9fvWjWDoSZ5b8U4pUVb/4ZES+wNQqqOgSfrrvUimzJ5eZBnyJ7QGzYoJ29v9FBdZghvTkkkVkktLcnfP5Fj4LTmHOj/PQ4kt3iCB5SYqL2Tr3ebk+2i5sqsig21V62YaE5qw82CFPtv0PebMDqKe1k41MhPzzDOfbZ2/QzmabxRash6wc6zZTRUIVCLyeQ+QxbZ6YZ7Cl9QU6ggulTccCNu8l+ZTxJpCAHtQG69oQT3Mvr6xeIZxzOxrAF1pxl/PMCLL7aeW2fHU73LgalkzwOmuD5fWxxBXgFyRIleJpfn98F0nI/H+HngwcpRD4lSUl8CMM4PNXBktmy3maPVTqQ01xIVwKZfrw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199015)(38100700002)(66476007)(91956017)(64756008)(66446008)(66556008)(31686004)(71200400001)(122000001)(76116006)(2616005)(110136005)(8936002)(41300700001)(66946007)(316002)(8676002)(38070700005)(86362001)(31696002)(478600001)(5660300002)(186003)(2906002)(6486002)(6506007)(36756003)(6512007)(44832011)(66574015)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VjRTUXhIWjNTU3BkSWhHczMxNTVPU1I5ZDB2bzk3U2JpdXM1akViM2tuVUIr?=
 =?utf-8?B?ZU1DcENQd2ZFcGxmQWQ0Uk1CemhHMDU5Wk1VOXZvNmZpcXBmMmFPRERaTHZV?=
 =?utf-8?B?Tk5sZ0w3dDlzeFB4Zjk3bmYxaXZaRXJESUpqdnBsd0MzOFZaT1hGYjAxdUdZ?=
 =?utf-8?B?cC8rTU9rR3BOYmlBT0F1U3R0TW94c08yL2hJekp3V0MzVTM2d3AwaUhrRm1u?=
 =?utf-8?B?OTFFaFZvZms3Wmt6bTdkalpqcUFpLzRPK1JLZk9IOVBBaGxvZXFSREtJdXpX?=
 =?utf-8?B?ZFV6YndPZWpsVVc0UURhT010UWFud1Z4S21HR0xKQzF2R0xtMmtFRG9iOGtV?=
 =?utf-8?B?Q2xXTXl4ZUhBdEJTZGV6OE5MM0VEK00xOXUvczZwN0VqRUE2aVh5aEhzcEZB?=
 =?utf-8?B?RzIrNkRVdnV3YS9tUWdpQ2k1S29GSC9OOUNoNFlaejVoV24xek80TC9FcjFO?=
 =?utf-8?B?Z3FNc0ZlZFRsU1ExRHVPVllueVJmNER1dmxqcEJPbnd1ZHBNRExtOEduZnlq?=
 =?utf-8?B?RjVnUE1XWVZPTy9RbmtwQkowU1lmbHBZenVPZTAzeEZQM2FOdXJtRjlkemJP?=
 =?utf-8?B?UjkwTk5HQzd4aXNsOTZNN0YyL2dkMWVxV2ZzUWk0WWRRVEtzakh4QVpyWjB0?=
 =?utf-8?B?aWtnV2laSE9zK0pJbTNZOWlhUURITEpJRWxRRHE2NEVhUHlIWEYvZHVlU0xq?=
 =?utf-8?B?dnF5VU1UL29mckxNY2ZnaFNnTzY4dDZzczkzOTNTeUJld2R3d2JqOXpTUzd3?=
 =?utf-8?B?TXRYak1wY1NOb09QekNoV0tkd1FoLzYxRGZ1K0FseFJmRmhkaGVLWTFoZ01S?=
 =?utf-8?B?RndIekVMMlZTQzBtMlZlR1hDQVljSkRlVmJPUC95K01XT0Y5Sm1Wbktjby9T?=
 =?utf-8?B?dllDUWxReHJzdnAyTTNJakRsZ0FSUjc1WW0xRUZSVDRBRUtTZXlnZ1BJUUFW?=
 =?utf-8?B?Y2hjZ2JIaTBBRTZNWFliYUtFYW9HYUJIelhDc1c2ZGtDOUFNeXYwcG1jTkJ0?=
 =?utf-8?B?cDFqQ1VXTkkvbEUxZUdYRTYzY282Q0QxKzg2NHgzai9XOVpXMENCUU5DbDUz?=
 =?utf-8?B?WUluK0RLcVN4UWtEaHJCa3ZRRzM5c1RiQ20vZUh6WThIcWNHSU9FQ1k3NFRq?=
 =?utf-8?B?NGRNTHBZbys4YjFHNWNCMEhWNG01WEZJa3Z6N2ZiWHhPa3BLbk9vQ0NhZk11?=
 =?utf-8?B?Q0V6U09NaEJWazN1eHFCRmlqTmU2djhrRUV0cDEveHp2R2RIZDFnR2c4K2JS?=
 =?utf-8?B?YlN5aUYrbm95ckFPUTEvOEQyanB0OVBpemwySUVuWDJPdmJUckFJM1FPdUIy?=
 =?utf-8?B?V21DNzY0eXMreUxRZU9IdGdRcVNVMGk5UWwzVEIzbVIvdWE1TXJ4eGlkbnVy?=
 =?utf-8?B?SFJxK2hnRUhzS003cGtJQzFNelJETlFzd1NQWTc5bGU1UGt4L1hSL2pNU0pF?=
 =?utf-8?B?c1p6RmxzQlA2WGtxc2tyYldWZHRlOEtURUsyZW1lUU9QMHQxcU1DT3ZESFBu?=
 =?utf-8?B?dlY4TVdVajI4enVwRWtEcmNNV0lNRUNzbkdJWXVReS82bzV3cXd3NjdVTEVs?=
 =?utf-8?B?MzUwYmNJRENXQ2hoZXRWeU5RdjNsL3dodjY2Rk10dENWQi9kVUFqMFBTbzlY?=
 =?utf-8?B?bmhjM1RkdzdJZHhNUUVuTzlsSERvMk1pSCsyMGNIVnQ5ME9MWUQvVHpXelhm?=
 =?utf-8?B?U2FJMHVHS1hxQVlhbGcwblNEcWxUdVh6YUdEMXBHT2pWYmlsdmt4eStjTlJm?=
 =?utf-8?B?Z2RSSU9zU3pjV0VOcnhUNVhNVllCNHlSZjI2eWw3TzJoV2NnaGRWeXBIQUhz?=
 =?utf-8?B?UjFKeFJIelU4VmR1VU1qVURUaHFiUldXcGt6S3V3dHp5ZkJsWUlJNHhVOEQ0?=
 =?utf-8?B?NkhuYWlud3FlS0lwRmYzVW92b01Dd3lQR3djaWNNVVdFNXlEc3pRZENibGgv?=
 =?utf-8?B?bUFjQkdoNk83cWY3WXlhbFFYZUkyN1BURVFBa0kzcVZvMXc2NWwrWVkzQmpJ?=
 =?utf-8?B?SlpPV2VnME5PVGYwRERrbFZRR2NDZTRESWhjbm0weUZZZ3IySW5HYmU0dmkr?=
 =?utf-8?B?LzJ5blBvNUNObWhSNVZOQU1GMWxzSkg4N2YrZmpZYU1qWkl0MldzL01ybGdk?=
 =?utf-8?B?MU5RNlE4djE0UUg2ZTIzeUpIZDBSS1FTWHkyMmZuaW9wUnF3WEVjdkNuLzdv?=
 =?utf-8?Q?+RY4kBri0qHcakFtwGuNbOc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2951760C745DF54D82F1BF97644CEA73@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c30b8a-accf-4c8c-3236-08dabcad0914
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 08:34:19.3560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSBwufHO+xod0M/ABBcXqWgNfgmZoSrp3VOhdqEWEsGKkZyWocFy+Wqq/qHDVLLloU6FWRsYYCmg68OBIQlGmayrpLBPq+0IZsx6fLd+CpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2485
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

DQoNCkxlIDE5LzEwLzIwMjIgw6AgMDg6MzQsIHJ1YW5qaW5qaWUgYSDDqWNyaXTCoDoNCj4gV2hl
biBidWlsZCBMaW51eCBrZXJuZWwsIGVuY291bnRlciB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOg0K
PiANCj4gLi9hcmNoL3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jOjIzMDozODogd2FybmluZzog
Y2FzdCByZW1vdmVzIGFkZHJlc3Mgc3BhY2UgJ19faW9tZW0nIG9mIGV4cHJlc3Npb24NCj4gLi9h
cmNoL3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jOjIzMDoyNzogd2FybmluZzogaW5jb3JyZWN0
IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQ0KPiANCj4gVGhl
IGRhdGEgdHlwZSBvZiBtc2dyLT5tZXIgYW5kIG1zZ3ItPmJhc2UgYXJlICd1MzIgX19pb21lbSAq
JywgYnV0DQo+IGNvbnZlcnRlZCB0byAndTMyIConIGFuZCAndTggKicgZGlyZWN0bHkgYW5kIGNh
dXNlIGFib3ZlIHdhcm5pbmdzLCBub3cNCj4gaW5zdGVhZCBvZiB1c2luZyBhIHR5cGUgY2FzdCwg
Y2hhbmdlIHRoZSBzaXplIG9mIHRoZSBwb2ludGVyIG9mZnNldCB0byBmaXgNCj4gdGhlc2Ugd2Fy
bmluZ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBydWFuamluamllIDxydWFuamluamllQGh1YXdl
aS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+IHYyOg0KPiAtIGNoYW5nZSB0aGUgbWFjcm8gb2YgTVBJ
Q19NU0dSX01FUl9PRkZTRVQgdG8gYXZvaWQgdHlwZSBjYXN0IGFuZA0KPiAgICBzaW1wbGlmeSB0
aGUgZml4DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9zeXNkZXYvbXBpY19tc2dyLmMgfCA0ICsr
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvbXBpY19tc2dyLmMgYi9hcmNo
L3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jDQo+IGluZGV4IGE0MzllMzNlYWUwNi4uZDc1MDY0
ZmI3ZDEyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9zeXNkZXYvbXBpY19tc2dyLmMNCj4gQEAgLTIwLDcgKzIwLDcg
QEANCj4gICANCj4gICAjZGVmaW5lIE1QSUNfTVNHUl9SRUdJU1RFUlNfUEVSX0JMT0NLCTQNCj4g
ICAjZGVmaW5lIE1QSUNfTVNHUl9TVFJJREUJCTB4MTANCj4gLSNkZWZpbmUgTVBJQ19NU0dSX01F
Ul9PRkZTRVQJCTB4MTAwDQo+ICsjZGVmaW5lIE1QSUNfTVNHUl9NRVJfT0ZGU0VUCQkoMHgxMDAg
LyBzaXplb2YodTMyKSkNCj4gICAjZGVmaW5lIE1TR1JfSU5VU0UJCQkwDQo+ICAgI2RlZmluZSBN
U0dSX0ZSRUUJCQkxDQo+ICAgDQo+IEBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIGludCBtcGlj
X21zZ3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiAgIA0KPiAgIAkJcmVn
X251bWJlciA9IGJsb2NrX251bWJlciAqIE1QSUNfTVNHUl9SRUdJU1RFUlNfUEVSX0JMT0NLICsg
aTsNCj4gICAJCW1zZ3ItPmJhc2UgPSBtc2dyX2Jsb2NrX2FkZHIgKyBpICogTVBJQ19NU0dSX1NU
UklERTsNCj4gLQkJbXNnci0+bWVyID0gKHUzMiAqKSgodTggKiltc2dyLT5iYXNlICsgTVBJQ19N
U0dSX01FUl9PRkZTRVQpOw0KPiArCQltc2dyLT5tZXIgPSBtc2dyLT5iYXNlICsgTVBJQ19NU0dS
X01FUl9PRkZTRVQ7DQo+ICAgCQltc2dyLT5pbl91c2UgPSBNU0dSX0ZSRUU7DQo+ICAgCQltc2dy
LT5udW0gPSBpOw0KPiAgIAkJcmF3X3NwaW5fbG9ja19pbml0KCZtc2dyLT5sb2NrKTs=
