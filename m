Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E672D5715A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 11:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhwKL6Cwlz3c4N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 19:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zLrUfOK8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.57; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zLrUfOK8;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120057.outbound.protection.outlook.com [40.107.12.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhwJX6pYFz3bwg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 19:22:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEMz/ccM1qUlHbGVo1R095ZBLrKUluxpt+yY8e9ORljDqPuE9Q4LjN02k529dYH/Qs5Fb8c8KorjyJO+ur9n8/iqwCfIE1kjpHy2z4rVTRlb0ViQ+3biAeIpqY+KcOxwOQE2bZrWOuabj8tiQbllMlhV7mUuSUxdba5JkQqQSx2Fzw1hS56w02h8KbKCrKpwOKv83sTAYai6fAZqBJkqYyqJkyP7QR8fGzglbxSbfxuP62WsBMSq5WcdehEV8InYZ1NTwe3vE01pz4WkhJvC7e1qMFAir918TBagndWzbdZqITioNbx4XUpgevtP9X9oFJgpOrWYv+UQdwknlb+2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ7rHTINmjBq7RMs3OZOIGwfQB0+f47VR69ebHStVBI=;
 b=WVbAbh5IDRv/wCbwz17ntLGAMquotlx5Qq6/HDvB0bJj4ymuOclk8PIStycF47K29Zr364zRi+GxI12vVmgcIYIhcpkTUwBAHKyHIarsVPcuaoxKk4iTefoG4mYMeqqGzu5hMlnMOB9U7nVF++bNYdswdbnWga8TVIFoJm6hyv+lUirakG2kW3XfgcNpMwWcz32FSBWcQmLfRe50jzRY/WKOULeD7q/ZkFbNTsFJo9dUoARX3kvNcB8406azl+XHv/OS+R/K+VvjVLEo/x8ZbCgCsMnag9Zny51NP+WDhH4zdxVj4IB4jdIW9/JwjPeKhne3u/DHLdavjdycFlJiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ7rHTINmjBq7RMs3OZOIGwfQB0+f47VR69ebHStVBI=;
 b=zLrUfOK8uOThEEm78KPkFs6scDZ2D5nxgb0mNbFoLOWdoVMmhSRftJrlgw2H0A/GsJhET4RiyZ5fa+N8jXp3jaTfUR43XOCKKIH2eFSaqzFlpeUy/Q+MBAnXxE1NweEzZsenYRWknCdkJP7L3snDaxlxvBP2/dqzlqJ//FaNERWDrHNT5wGv54RRT1hzNQ37pX+Uv6YMKWMmUg9tCNcNeUMVggC3YoxLAS2XsRtjSDr2EQaeHraDhdVhWoT2QzG5fYw9dZFLUR6h9GY2psu3j2TZC+ve1JZanulIQkvw3NRLcqZNhf7AZthR9MGLd7F1ucBKruMNpayiRWKnUPgVEQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3829.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:250::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Tue, 12 Jul
 2022 09:22:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 09:22:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAaen4CAAC/3AIAA4BYAgAOWzwCAABWjgIAAR6wAgADBxQA=
Date: Tue, 12 Jul 2022 09:22:12 +0000
Message-ID: <aab87b89-3518-f13e-995a-cbe48892e200@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220708171227.74nbcgsk63y4bdna@pali>
 <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
 <d9339bb9-2410-bea5-7502-1c7839707f4e@csgroup.eu>
 <20220711161442.GD25951@gate.crashing.org>
 <2552726a-cca4-ecd4-6fca-4f73bbf7942e@csgroup.eu>
 <20220711214840.GJ25951@gate.crashing.org>
In-Reply-To: <20220711214840.GJ25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bca5b80-2a65-4ec8-0c66-08da63e800db
x-ms-traffictypediagnostic: PR1P264MB3829:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  A6jaLWP+y51MGDq8FqxBfY4K0RGgM98J0nzDU1KqLA5CE3PHDzdmBon2VtHgISRAsW1VUMlwr3uCrCmbW+Igy0kgbXYWoOlFU29crr3zDRNJ6/cinbjre11Cwy0Sc5XSW7kClLfNLWQ+yrXQnzFluhriqlJ0tZMvb2Gw7XhhqChrUbU1xVs7vkP1rrK46+AAbLZo/baEOrUoEzV12i5dUSw82vNoWM6VLfnAxVZxVU1i61wdyobDrWt2AfJ7gxe55il7bpr21+Iv0P+6glcneuvtOcYxI+tDA99IQPZ7nNp6k81OXMKybwp7nNw4AHtLZNmQxJi3KMVspBkepW19KH6/Q/jexvwXkHPHNiVY0ak16u9F0oX5kXVgAIwLqW2J85J83d6SHnbHmKlyHxqWiUvIKeIS3OrIEOgfQo34rCb5DZkC8BcmVelD5y72IY/SbtCztMWhRp/U2zOa8rzaKvfE3NwKrJlu4GGqTLS1FdSIIj/RDaDjRunVAjbVk1ws8MxG6dGs4HRHa7RUHNmSWSlMxF7KJT26jK1KJJ2Raj3qPjfzkdLGkAgkEqzFV6K7QHNSgcGtTwRm03PN1e5gFn8qI1VAJddgQuv54oOggjZaOJutLDk0/x+Y8piTQAGW6JNSc06dEFBq1nMcsE0iHpq+v/2w9IwIyk95IS7TCBBVf2j/72503y9nZKaaVT9phCtD5buz7k5yoSM1FT9eyB4W/XqXUeXvfveNhhWhj3xqHKnTetrUc3AiZH8WkQcqvQrNRquN/LILuXJWXgP0x0/iWJGCL/RXsQnBobD1YJmYiw/Q8ISnvPBQLuLDKFSTxJm2HLXOvS6HmyBsbgf6fHVEv5MoaBEB0jyrJPzSiov4QEdtQPO28BgFneYU4VDa
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(66556008)(64756008)(41300700001)(478600001)(66476007)(2906002)(4326008)(6916009)(54906003)(71200400001)(8676002)(31696002)(36756003)(91956017)(76116006)(26005)(316002)(6512007)(66946007)(6506007)(6486002)(66446008)(66574015)(31686004)(38100700002)(83380400001)(2616005)(38070700005)(186003)(44832011)(8936002)(5660300002)(86362001)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YUxZckw2eWZqbEEyMHN6OUZrNGJWRE0zWE5CMEgreVRkdXB5NzNFM0dXWjFH?=
 =?utf-8?B?S0wyVUY5MTlVeVBXYjRIYmJ0bWlsY3JKMmlXVlZqRmxsNEVuOGlLZ2gyYjhW?=
 =?utf-8?B?djVuTSthK2QyQ2NYa1MyNllHWFJhaVRXalhqU1FsazJJTUhiS3k0MVBadEJX?=
 =?utf-8?B?WlRwQVcvTEpnNExyQS9MK0k0d1UxaHp1NVRZd2g2VTV2WWtWUVl0RndGZGtU?=
 =?utf-8?B?c1E5NGF3VDA1RGgvRHQxVzBCb1VXUy9sQVRJWWR2U2pXc0lrSWxaK3FRd3RL?=
 =?utf-8?B?b1JaOStsc3RLL1FUT3hrQzdSTHRrYmRxbFFTN0FIZUVvYmlHREdLSURidWVi?=
 =?utf-8?B?OUVVTERHQXNndTNsVjBWNlpXRGcvbXg1Wk12Rjdub0Exci9vclhYK3IyVnZ6?=
 =?utf-8?B?TjVJVXQ3RTQ2WVVJSEl2ZDkzSnd3MEhlRXhWRlZZOFo1bnJ2MUdNdzN3M1JC?=
 =?utf-8?B?d0RPRkNwMGdmTSsrWUYyeEpQRU1WT3ZydTRtZUV0NGxUcS9lZDVkWnM0UVhs?=
 =?utf-8?B?MDg3aVAxZVJOa0FjWE0xMHRjdjR1SUZPQXdreEdZKzd0U3BLWHdPSElOTkdF?=
 =?utf-8?B?SXlTQWo5eXNQZmsyNHJYeUw2MGZBdUtDU1d2aWVHc3l4TU56dTR1VFdYSXl4?=
 =?utf-8?B?L2pMS3JBTVZwVHpKKzU4ZC9yTGEwdVZXMjBHZkRKZ29jRnMzRFduQUlTclM5?=
 =?utf-8?B?bE9rQk5hQWc0ZVNacGRkTkJhQzA3aVRCL2Zlc0dXWCtrT1N4eEN1QmVZWkZi?=
 =?utf-8?B?TG1qNnpabHBWK2ZuM3FMVlJ4bHZpanVoWHFBaVJ1TGluVGJTUDRpZGpieXBr?=
 =?utf-8?B?ZlR3dzRYQ21rcms1Mkp4QUFiNFJrWUFUNTJEUU5YUWNKRXRkNTRnbXhJMStL?=
 =?utf-8?B?MGdzOGtsR2JtL01xcDNieGROSzFGZDRCaGpYb2l5YW8wNGVMRW9zem1QY2ds?=
 =?utf-8?B?dDRNeVdubkF2aHR3V0dsb0xqR2tEeEdLQXJjMkU3bTlBdWhieFgxcGpSa2tv?=
 =?utf-8?B?dFR1L3ZBNnhIbis0NWtDcDc1NGtCdTJhNlc5ckY2VzRJZ1FnM0xETjlWbnpR?=
 =?utf-8?B?TTZGQ0t6ZTRVMk1IVGY4Zk9pdVNkdXFEVE5Cbk1aMkh5enYzUzU0WENlWlV5?=
 =?utf-8?B?anY0dzdvbkg3NmNqSmhXR0QwbElCQmUxcXV2QlNzWjdYbjJEcDRKVXExT2Nh?=
 =?utf-8?B?MUlTcHk0V3Nyci9ocFgvMVN0SE8zTmI2RzJWUlJ3enAvUUdsNCtXYy9LRnRz?=
 =?utf-8?B?S3dkdEhIYXdNWjJWSHlTbW4rTTk3Zy96T3RYQUkvN1FIaGkrYkhja0VSbllx?=
 =?utf-8?B?YjdweWNtejNRSDBWRXFmNFRpaWkvcTY1Q3dQazRsWmoyTEV5cTFwV25vZUcv?=
 =?utf-8?B?eDYzbS9OTk9Oem92SC82YXlmYVVwZzk0dUFMRmt1Q09EK1doeDlCT0RLVE53?=
 =?utf-8?B?VkxzdVo4eEtTMTFhMG53OHM0bmczZlJzbzZKT3ByQWFVbU42bk0xcS9YZlYr?=
 =?utf-8?B?QWxMTzJTelJKYmMvSTZjeU9IY3NSdVdsTVJnV0NFbE5ydkZXOFdsbjVoVHUr?=
 =?utf-8?B?KzlpQ1pvU2hXUHhzb2srODhGTmhXWWRVZ2dnMlBJNnc2Ri9rbmNPVWxIcHlI?=
 =?utf-8?B?WG5SamVJU3VjcFZHa2ZETlZwbTd1WW96VGZZYytQK2Q1RjBzeUFKcGRzRU9p?=
 =?utf-8?B?enRTY21WbE9BQk1kMTFVRmpXSG5mSW10aGppYmJtR2RjMng4dXlXM3NrajNw?=
 =?utf-8?B?VDIrRXREWkxrSUZldFhtVGV1TEhHRm1mdVEybjdjRWdQZlhHLzMwTDBYcDlZ?=
 =?utf-8?B?TnJDb1AzWmZwRVR1VnlmbE54L2tiR1RsWGdHUnc1bkhhRzl4a0Y0RG1MV0t3?=
 =?utf-8?B?Z3ZxQlRJNmZVRmlkQU96dDB6WnFQVWZqRndPZGJjalhSWmxNcWI4K1ZWK3Nl?=
 =?utf-8?B?VlNyRGhyWGFPUEt6SldBSjFRNFlxUkVTY05yTHRGVk9xQ08vdWJNdXE4UERh?=
 =?utf-8?B?NllXQkxnZUpsMjBrT0pVVzNlRnl3ZFpOWFpoTk5wRXEwVGV5L0RtcjBrVXBS?=
 =?utf-8?B?VDdGQUpxREx5MEJWVU9QVk9CT2pSTEYvOFQ0MVY1MklPbDBpNDBCdHQxRlQ1?=
 =?utf-8?B?c3BwNGxTdmxXM2JIUmRydFUxY0llMWh3ejh3ZDRTc3ZwRW1TWTEvVFV3aGVx?=
 =?utf-8?Q?0ikPkjJ5vUcLTfi7l80xLdo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE52FDE5DF05254184C6AF3B06C84B93@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bca5b80-2a65-4ec8-0c66-08da63e800db
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 09:22:12.3795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijfZ6waYgCOGQ+bneLMPEJFhqg42hUE+kjFarSB4bl5eHRbWlRtxKn0BxO5HLCHviMoKwszl0eeN3jt8+xcOAD3RbF3im2ARa15/kx7PGY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3829
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA3LzIwMjIgw6AgMjM6NDgsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDA1OjMyOjA5UE0gKzAwMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBMZSAxMS8wNy8yMDIyIMOgIDE4OjE0LCBTZWdo
ZXIgQm9lc3Nlbmtvb2wgYSDDqWNyaXTCoDoNCj4+Pj4gICAgICBDQyAgICAgIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvaXJxLm8NCj4+Pj4ge3N0YW5kYXJkIGlucHV0fTogQXNzZW1ibGVyIG1lc3NhZ2Vz
Og0KPj4+PiB7c3RhbmRhcmQgaW5wdXR9OjM1MzU6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2Rl
OiBgd3J0ZWVpJw0KPj4+PiB7c3RhbmRhcmQgaW5wdXR9OjU2MDg6IEVycm9yOiB1bnJlY29nbml6
ZWQgb3Bjb2RlOiBgd3J0ZWVpJw0KPj4+DQo+Pj4gV2hhdCAtbWNwdT0gZGlkIGl0IHVzZSBoZXJl
Pw0KPj4NCj4+IC1tY3B1PXBvd2VycGM2NA0KPj4NCj4+PiB3cnRlZWkgaXMgbm90IGEgUG93ZXJQ
QyBpbnNuIChpdCBpcyBCb29rRSwgaW5zdGVhZCksIHNvIGl0IGlzIG5vdA0KPj4+IHJlY29nbmlz
ZWQgd2l0aG91dCBhbiBhcHByb3ByaWF0ZSAtbWNwdT0uDQo+Pj4NCj4+Pj4gSWYgSSBzZWxlY3Qg
dGhlIGU1NTAwICh3aXRob3V0IGFsdGl2ZWMpIG9yIGU2NTAwIEkgZ2V0Og0KPj4+Pg0KPj4+PiAg
ICAgIENDICAgICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9pby5vDQo+Pj4+IHtzdGFuZGFyZCBpbnB1
dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCj4+Pj4ge3N0YW5kYXJkIGlucHV0fTozODE6IEVycm9y
OiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBgZWllaW8nDQo+Pj4NCj4+PiBTYW1lIHF1ZXN0aW9uLiAg
ZWllaW8gaXMgYSBiYXNlIFBvd2VyUEMgaW5zdHJ1Y3Rpb24sIHNvIHRoaXMgb25lIGlzDQo+Pj4g
ImludGVyZXN0aW5nIiA6LSkNCj4+DQo+PiAtbWNwdT1lNTAwbWM2NCAoZm9yIGU1NTAwKQ0KPj4g
LW1jcHU9ZTY1MDAgKGZvciBlNjUwMCkNCj4+DQo+PiBJIGhhZCB0byByZXBsYWNlICdlaWVpbycg
aW5zdHJ1Y3Rpb24gYnkgJ21iYXInIGluc3RydWN0aW9uLg0KPiANCj4gSSBzYXcgc29tZSBwYXRj
aGVzIGZseSBieS4uLiAgeW91IGhhdmUgaXQgYWxsIGZpeGVkIHdpdGggdGhhdD8NCg0KWWVzIGl0
IGZpeGVkIGFsbCBidWlsZCBmYWlsdXJlcyB3aXRoIEdDQyAxMi4NCg0KDQo+IA0KPj4gU2VlbXMg
bGlrZSBiaW51dGlscyBhZGRlZCAnZWllaW8nIHRvIGU1MDAgaW4gMjAxMCB2aWEgY29tbWl0DQo+
PiBlMDFkODY5YTNiZSwgYnV0IGl0IHNlZW1zIGl0IGlzIG9ubHkgZm9yIHRoZSA4NXh4LCBub3Qg
Zm9yIHRoZSBvdGhlcnMuDQo+IA0KPiBJIGJlbGlldmUgdGhlIGVpZWlvIGluc3RydWN0aW9uIGlz
IGRpc2FibGVkIG9uIHNvbWUgZTUwMCBtb2RlbHMsIGJlY2F1c2UNCj4gaXQgZG9lcyBub3Qgd29y
ayBjb3JyZWN0bHksIHNvIEVJRUlPX0VOPTEgY2Fubm90IHdvcmssIHNvbWV0aGluZyBsaWtlDQo+
IHRoYXQ/DQoNCkRvbid0IGtub3cuDQoNCkl0IGlzIGFsc28gZGlzYWJsZWQgb24gNDA1IGFuZCA0
NDAuDQoNClRoYXQncyBuZXcgd2l0aCBHQ0MgMTIuDQoNCkNocmlzdG9waGU=
