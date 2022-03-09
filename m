Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB204D2968
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 08:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD3YR4TcLz3bYS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD3Xv2C8Fz30Dt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 18:21:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn/pj3jBNEXUc87tD44BH7qdlcE9/M9hRn9uPKpMqpHmB5OZSCdK6F5XiLzS7EYfb3jGCeAOIBGom+aoxSoFMpxWsAoCXq7Z3CUuO27nSN7bMRXtzQxxSFbzg9UrCW1lPIin9y/Sd2uIYF6y3pHsuBwRBjXgN7Rol7DHrVq1FjZjTAHZ0/+m8Hag2KnEAlJNZ3OEfDZgc1WXDCksr0mxrEmv9twMa7yGzr/a9Q1CeNcCYSpP9y7oukaYwfahd2YE6ZyOxjl/sgADqb4zKyUgSMtcdVwUA0TvD3smA6WRscFvXg+Q3AvWE9bggOJCOBfuM6hGWSJEb2Y9upoAOtClZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooG1LwWeKRg7/xvzhTHEA2DBPl9HYWUpsIlBVLpBe60=;
 b=X6mOMcjP7Haz6yQtogX98EGP6WfEmd0hVWXl5VeIU4b49WydixI50eKUZnVzFsgY0N73WbjgPKYSC0bIgXGj1pZz+bmLyz7wWJAhgLsIBeOXfjm5bpiP83HLSEJFDxudiFGvOdLiaI3JU+EBHRUDFrt/Xe89JVxkUVV7BGeKjOnu/XSnCEX0L8HwuolTLU5qwVE+2gEJQSKNeyUSM5hxeI4B235OrkgGmlle8e+Me+DitP5/nPmTyv/o3IbuKC646uYmHkSJY9w8Q3VzFvRPMC/w6Cu/DxsS1hq2wVQwnxFeiRkDKCVoaR18zB2fxv+iGdxCySfPl7mFkYG1mtQlvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1820.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 07:21:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 07:21:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Hangyu Hua <hbh25y@gmail.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "peng.hao2@zte.com.cn" <peng.hao2@zte.com.cn>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Topic: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Index: AQHYKINXBJ1zcwXxM0+BDeqd/qE4Oay2eWSAgABCK4A=
Date: Wed, 9 Mar 2022 07:21:28 +0000
Message-ID: <87b40493-7630-f714-27f4-90ad2a5a7c12@csgroup.eu>
References: <20220223070223.26845-1-hbh25y@gmail.com>
 <87o82fn6yw.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o82fn6yw.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d52e3ef-124a-47c1-3e2a-08da019d6d80
x-ms-traffictypediagnostic: PR0P264MB1820:EE_
x-microsoft-antispam-prvs: <PR0P264MB1820A66C02CE975A165AC44AED0A9@PR0P264MB1820.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rS5KzQdvQu3VJrBWputvTYufLbu5mwr/gYb8PRGr+nA6F2PG2DK4ae0WiMWnRwR3GtC198IQtLvJYrqf+J37tvNtXxIotMKO+pEGlU0mndoMBrPrUX+Dqdo1WE9Do5crzYiTV/J3stTBNtwIJZzcnSAMAFDUjcENxHIPuuDwhEEHpfNuk6Mukjs5LbzqPFU/3ZNWQZBUitWlv0r8+/hsxMxz/ILDkQpzI8PVvXry1cIVbPCUTSJGTiJeEDIab0i/oGHPqh+NxIYVM/P5z3XfsqeC+hOkmQxC2B0+fuaNhhmLLSnP8ZKV4lJUwn0IeIelkAKF5GdawPJNH7Ft8F0QvDZoOdvl/I4dq5/Y7xA3u3q0YflqCWhG9HIkmczb0d1w6ijbGWI8uhPHCeo09z4dtF5JGNN+kSon6zYieAw4TEhrdJhJPMm6N6OAFuiGbjYlv8yh8mreZDGHDNIGyFGxnt7nGArhanGYjglYfI3VgMWH6pP+mL3H0NdOzmIWz8V5VyLSJrGQL+KQmab26R0vX/5PZjWx2klO9EjchqpnoaIDhUNH9clxv9jmhTv0Hi3E5wk3efhHNv52WbTZwhEqNXWuOa5h6967OoYEVel2VdWAFxaDwnCLQTK8rTwxU/gOeeZ1IG/LFlF+IO6nPME/iqdalOGD8GH7UqiWqdi1DEqwivbSJLFkNF7z6jkf5gVXkS5JQQ7AH7MwTos+bBpvuiaiynBSq//4/f3evmT/ZH1CEMMMmzgnkt1OBXNHldM3M2FSp/ygjsArsABw2ENVzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(6506007)(2906002)(6512007)(86362001)(38100700002)(54906003)(316002)(2616005)(110136005)(36756003)(6486002)(508600001)(66946007)(8676002)(4326008)(76116006)(91956017)(64756008)(66446008)(66476007)(66556008)(8936002)(71200400001)(5660300002)(44832011)(31686004)(122000001)(31696002)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STlGbjFDaUJGY1cvek0wbjlFSWtxRjFkeXVNREgvWGpWQnVnM2ZnWkNjMHBs?=
 =?utf-8?B?MzdDUUFPWGgrMG9nV1FpUTdhUjlmRFRONlMvS1o1ekVKRmFraWhCR1ZQMWZL?=
 =?utf-8?B?NjlKTWpnVUFWRnRxbHlvRkEzcUNlSmtFTWplNzBaTTEzamJtenVJYXdlbXdU?=
 =?utf-8?B?MjBXeDQzcmNLNW9FS1NvaXFUaHpxd05LMHlmLytSbkxwUTBjRk51VHAwSC9N?=
 =?utf-8?B?eDVnZXA0bUlaVHg0UzhwNTRYSDVsNzVYQ1NrTkhlTStVWEtVT0JzQVB3aitN?=
 =?utf-8?B?S0lPLzZQb1RsWnN5bnpreXpsc2VPR0VVbVdTZlhmMXJKL3BhZGhXYnJzYzFR?=
 =?utf-8?B?RzhJalJYbUp3VFYwYmxYNnhHVG9MVDVld0piM1VsZFdWR051VlhWeHhWVjZF?=
 =?utf-8?B?ZWNJTzhreFQzdGFmbmRnamZLTW9DZWpWVWYyUFpWUC8vVTY2cUtybDg2dFph?=
 =?utf-8?B?bEVrUlhjMitTNDRWMjJSSjBpendFV1RVQkF4M21oZmQ2UkpGK0RCUU5VVnZZ?=
 =?utf-8?B?TjhhMjFycEdJclJsU1BKaVJETGJualZXV3FVS1AvcmtuQjdORm5JNm1mdTFm?=
 =?utf-8?B?SUZNL2tGb25HSElUUWlqM3NDSTVUbDZoVnVWWmdKUEhzVzg5SnZvZE9nVU5q?=
 =?utf-8?B?M0xLTHpDc3NaU3VseE1rMk10RWNRdStKMDZ5UkRTOHhGSlBTWnMydGhiQXgy?=
 =?utf-8?B?QmtVWnJEdE5SWUlFTWtUdndoRE9FOVJiRmZNNlFWTmRBQnhPUVBKbjlVQ0Z3?=
 =?utf-8?B?ZHJkeVliQzhRRFZBQ1U3U2d4MTVJZWxvYXdKRktSQ3RpV1VHVVptTVVQRDhY?=
 =?utf-8?B?MEdrelRLQkZMQXpIOVk4ZzBjdENUWE9ya3liSmY5d0ZnR0VaUmNFS2JubXY3?=
 =?utf-8?B?UTVrZWdTM04vaExDcm1LNmUvM2pBbjVXZFJHbUpDaWRsSGIxODd6VlBoYTUv?=
 =?utf-8?B?UGRZMGV4TkhWU1hMWDlIUHVDdDRKQ0FhaGtvODZQYkwyM2F0dmNGODl4RW9L?=
 =?utf-8?B?NWJZcktFMzRDQ1Z1LzF4N2hUZkpHL2VxUGRmMUV4Um5ZMFp1eXFUN0lWQlY4?=
 =?utf-8?B?MER3ZDRBQ0laZ3JRMHRBdGs5dGZmTXRiM2VsSTQxYXQ5L1ZhVHM5eVJBbkcz?=
 =?utf-8?B?STdqKzFXTjdzREIxNmRKWjhpSlVLTnhMaHVOMFhrK3JSbW9UWVVSYlh6U1VW?=
 =?utf-8?B?RHNBWWhUVlo2WFh1UlJFNC9ndXZBRHlvUWxJYVlHTXZ0cnRQQnRYd0pBOWVU?=
 =?utf-8?B?eHplN2xnVGw0STVwbDRCQWZEVExzb2J6dVI5UVYwcTNBNHhXeTl0ZTBoVmh1?=
 =?utf-8?B?NitteHF0Ni85bk40dytOR2JubllNQTF1SllBZUtJaVdySjRhVkRlSWhiYnI3?=
 =?utf-8?B?V0FLbGdEaUJpZVdwcEpmUzlaKzlmeVh1Q2Z1SndtZWhxQ3VCMHlRWG9ydk8r?=
 =?utf-8?B?Ty9vQmdqRjhoSFlNNk4rcFp5eW5saXFuREtJd2FCZDczVDBsMWp5UkRxSmtr?=
 =?utf-8?B?WGVSaGh2Wnc3MmUxTlB4bjNTdTFSQWt3SEU4Y1RtdHA1S0VQNFdMMTNvbHhJ?=
 =?utf-8?B?Y1FGNzkwdUVORjBBcjYxSTFFeHFXeGxyS0NmSmhuTFFmSXFlZlRrWDdVUnhZ?=
 =?utf-8?B?UExKaXBSOGNnTGNXMzU3Ti9zTlNDSFVvWWQxME1jK1Vua256YjBQbUU5ZkJ0?=
 =?utf-8?B?K0FoZzlYbFQ1SmdJVjc3UjNxNm9HRWVGQmZxTWVDY2FONnFzVEcvUDZGaU5z?=
 =?utf-8?B?OWF2WjZvNllhcktZaEVxRElzTVI1SzNtSllYM1FwcGdnMzRCVDZhWVNKSDRP?=
 =?utf-8?B?VmdQdUZJeHh1Q3ZaWThiMUFoUDRlaEkwMUZQUWk4NFVlbzZ2ZngwRjlkU2lu?=
 =?utf-8?B?L3gzMEg5NVFCaXdUOXR6dFpYNG1La1Y0VmJHOTFKdzFieThlVStFUmJWTUds?=
 =?utf-8?B?eDh0VTJ4STdLZFNXMm5tenAzTmRwcTFqTnk0ckVuVDFjbUQxYzVEbmwxa05E?=
 =?utf-8?B?UkFURUJjVUdxcXhCcjN5WmMrSXRnZVozem1jdDdua1QwdUlrK3pXREpYRGRG?=
 =?utf-8?B?SUM0bjJaWmpuRjJwMHBydlZlUFlBZEFsa0w2YzhzcHNUYWNNTGZPc0EvTEdr?=
 =?utf-8?B?cnpUN2lHWnBBa0lGUWJUTjRYaHJCek1Idk40SVdZMVk0d1orTVhDUXp5eDlH?=
 =?utf-8?B?QXMrUlFGYlFGS29JclROY0JJdStGWDliRDkwOUN3bDBBSW0xWE1SNlc5ZWNh?=
 =?utf-8?Q?k6VPp4Z8X4CIbqWBCyUzhHUw4Z2Iot76n+VBtLw9cI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <321D2DE8D4FBD948BD81873221ADF8E3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d52e3ef-124a-47c1-3e2a-08da019d6d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 07:21:28.4492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auPQoCjyTvqZHwexwN+nYMoiNknzWNy2XJve7C49kaP3xt1ZOssIIZMJ17Mo9J/FJTxG0JlYBKKsM7kHCBcEAoxmDEK+Wm9FWBcVzFY7Qrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1820
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAzLzIwMjIgw6AgMDQ6MjQsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSGFuZ3l1IEh1YSA8aGJoMjV5QGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4gbXBjOHh4X3BpY19p
bml0KCkgc2hvdWxkIHJldHVybiAtRU5PTUVNIGluc3RlYWQgb2YgMCB3aGVuDQo+PiBpcnFfZG9t
YWluX2FkZF9saW5lYXIoKSByZXR1cm4gTlVMTC4gVGhpcyBjYXVzZSBtcGM4eHhfcGljc19pbml0
IHRvIGNvbnRpbnVlDQo+PiBleGVjdXRpbmcgZXZlbiBpZiBtcGM4eHhfcGljX2hvc3QgaXMgTlVM
TC4NCj4+DQo+PiBGaXhlczogY2M3NjQwNGZlYWVkICgicG93ZXJwYy84eHg6IEZpeCBwb3NzaWJs
ZSBkZXZpY2Ugbm9kZSByZWZlcmVuY2UgbGVhayIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5neXUg
SHVhIDxoYmgyNXlAZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvOHh4L3BpYy5jIHwgMSArDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzh4eC9waWMuYyBiL2Fy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvOHh4L3BpYy5jDQo+PiBpbmRleCBmMmJhODM3MjQ5ZDYuLjA0
YTZhYmYxNGMyOSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvOHh4L3Bp
Yy5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzh4eC9waWMuYw0KPj4gQEAgLTE1
Myw2ICsxNTMsNyBAQCBpbnQgX19pbml0IG1wYzh4eF9waWNfaW5pdCh2b2lkKQ0KPiANCj4gRXhw
YW5kaW5nIHRoZSBjb250ZXh0Og0KPiANCj4gCXNpdV9yZWcgPSBpb3JlbWFwKHJlcy5zdGFydCwg
cmVzb3VyY2Vfc2l6ZSgmcmVzKSk7DQo+IAlpZiAoc2l1X3JlZyA9PSBOVUxMKSB7DQo+IAkJcmV0
ID0gLUVJTlZBTDsNCj4gCQlnb3RvIG91dDsNCj4gCX0NCj4gDQo+IAltcGM4eHhfcGljX2hvc3Qg
PSBpcnFfZG9tYWluX2FkZF9saW5lYXIobnAsIDY0LCAmbXBjOHh4X3BpY19ob3N0X29wcywgTlVM
TCk7DQo+PiAgIAlpZiAobXBjOHh4X3BpY19ob3N0ID09IE5VTEwpIHsNCj4+ICAgCQlwcmludGso
S0VSTl9FUlIgIk1QQzh4eCBQSUM6IGZhaWxlZCB0byBhbGxvY2F0ZSBpcnEgaG9zdCFcbiIpOw0K
Pj4gICAJCXJldCA9IC1FTk9NRU07DQo+PiArCQlnb3RvIG91dDsNCj4+ICAgCX0NCj4+ICAgDQo+
PiAgIAlyZXQgPSAwOw0KPj4gICAJDQo+IG91dDoNCj4gCW9mX25vZGVfcHV0KG5wKTsNCj4gCXJl
dHVybiByZXQ7DQo+IH0NCj4gDQo+IFByb3BlciBlcnJvciBjbGVhbnVwIHNob3VsZCBhbHNvIHVu
ZG8gdGhlIGlvcmVtYXAoKSBpZg0KPiBpcnFfZG9tYWluX2FkZF9saW5lYXIoKSBmYWlscy4NCg0K
VWggLi4uDQoNCklmIHNpdV9yZWcgaXMgTlVMTCwgeW91IGdldCBhIHNlcmlvdXMgcHJvYmxlbSB3
aGVuIF9fZG9faXJxKCkgY2FsbHMgDQptcGM4eHhfZ2V0X2lycSgpDQoNCnVuc2lnbmVkIGludCBt
cGM4eHhfZ2V0X2lycSh2b2lkKQ0Kew0KCWludCBpcnE7DQoNCgkvKiBGb3IgTVBDOHh4LCByZWFk
IHRoZSBTSVZFQyByZWdpc3RlciBhbmQgc2hpZnQgdGhlIGJpdHMgZG93bg0KCSAqIHRvIGdldCB0
aGUgaXJxIG51bWJlci4NCgkgKi8NCglpcnEgPSBpbl9iZTMyKCZzaXVfcmVnLT5zY19zaXZlYykg
Pj4gMjY7DQoNCglpZiAoaXJxID09IFBJQ19WRUNfU1BVUlJJT1VTKQ0KCQlyZXR1cm4gMDsNCg0K
ICAgICAgICAgcmV0dXJuIGlycV9saW5lYXJfcmV2bWFwKG1wYzh4eF9waWNfaG9zdCwgaXJxKTsN
Cg0KfQ0KDQoNClNvIEknbGwgbGVhdmUgc2l1X3JlZyBhcyBpcyBldmVuIGlmIGlycV9kb21haW5f
YWRkX2xpbmVhcigpIGZhaWxzLg0KDQpXaGF0ZXZlciwgaWYgd2UgZG8gc29tZXRoaW5nIGFib3V0
IHRoYXQgaXQgc2hvdWxkIGJlIGRvbmUgaW4gYW5vdGhlciANCnBhdGNoIEkgdGhpbmsuDQoNCkNo
cmlzdG9waGU=
