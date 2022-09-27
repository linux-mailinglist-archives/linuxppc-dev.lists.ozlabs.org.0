Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6215EBA4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc8DZ6GQ4z3cC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:02:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=IwuRy1dm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=IwuRy1dm;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc8Cr16Tqz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 16:02:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3fUScInbzOhDYVotSy6m2AkL+quKRq2SSEQm0JtPZfv6bbigA5Cph9dL1S+OzrcWplPalOBSYChbXQEkF+H4jy6hapGIIKo/WqdjXzjSgYzTZsC2VLDqyd56IK5z7GNGKf3mLpr5yeJd0CtgmoBPUP0Tack3QnKjlnqW/sx1kLMJCcM1DtIU7yi8qLrOidmbwIhzueXOUQfT82XWjLn+7tAiNi1ur9okjmStVhtc2EShvo5QvjJom1pNQNrFbDyOxTBCYm0O2VQe7aKy/rzb1oormaAxgpkGKLx41Xv1cWr4ieXHqarHFB2rGQEOZkToiRIoGKL9YtriDKs7dbWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdsU6/Ydr4QlXAZhZfOgZ1+paBKjTGfhHZvu55XH5fs=;
 b=iPCswN4sC2PYhnAPDLY+Ezit1KhJJ591AhFesgKKWYIDtKx+hp7fw7M2B6OIHRGzcQVjHzO3ttzjoyVuG3nEUTy/84HkOXs4eqUwJAJrPNBYlOyQVAHs632Pu+kj9Z4+ih8AOKtOXf1OyX5wSXCZv2A7+1BF3wWmX4GfLpMi/9Jbs7grz5+pVQIhCVOmoBp+CaDdjFRqe7qOW028GQab5iMxVM1dkWMHLrj25vbQW+So93wblYzJcabHc2vpkM/nMTGH/PvpjQdvWH6o+3LLTqwrmaY7jy8/3lA0+s5OUC1mEkyIUSMNpjSBmvKV6oHrVVjD8zOomP8erQvNDES6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdsU6/Ydr4QlXAZhZfOgZ1+paBKjTGfhHZvu55XH5fs=;
 b=IwuRy1dmSINFF3fMh4JE+Da89oTQbWwjip7VIRH9ivKoJuiksofe6ymbOzHgfn+zHT62f1Y30Xue430JAvLcvGxYXu1alDGkPy/kknGttV1XuVshlWelMHjjLWUugcIou9pUTbPe53h9VCgGG8ojJZYb+riSfsLX583u3bylJWOo6jBTQeMSPGlOJ9zBkZX4BDVimo4p+RxaZ0Epb6Pdq8piiGBI/hUs2tGbh+sRDY1Dj44jR+iidcyyE1EF2v+zfm/DKqy2MySJf3MgYVAvx/fvdCDj0AAX5w6jbon5OOmLBIF3lXuLo3CohE6lFONLZL2TOFIChE0p2cUHFpVy2g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1985.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Tue, 27 Sep 2022 06:01:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 06:01:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Topic: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Index: AQHY0XNhlTbgzftlYUWN4r+snCpZxq3xzLgAgADQ34CAACzMgA==
Date: Tue, 27 Sep 2022 06:01:56 +0000
Message-ID: <edfd1068-dbb8-4d11-faac-507fff0d1328@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-6-bgray@linux.ibm.com>
 <869d9f29-f03f-539e-e961-da6f8309e1e3@csgroup.eu>
 <ecc0bf7f75607d5523165fb1105e7dc9065cfb37.camel@linux.ibm.com>
In-Reply-To: <ecc0bf7f75607d5523165fb1105e7dc9065cfb37.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1985:EE_
x-ms-office365-filtering-correlation-id: 7f61e899-f6f9-4cad-107e-08daa04dc891
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EOEHm1sZnRhHubq0oESQh5uugd4wH1Xwdhzg7SRWdxRvDb4voNlv6XJNpPeHy3RDf+wMAeYO0+j0bf/3eFRs44+cXbnNQhO8RHM30cr3pECNG9A/5Ji1273gIb1ye8B17terpwo8BQQKTSMzW7ORI37XVwb5fLLZxssqteT73xfKxOco05yWCVpTGRZ3sWZXPn7YVcc2AKEzBJ/cWAcl8onUDIgyg4DsCfmuonBISbOM8T11SMv//0EaBQ6M/Typlya1/GWkE0bccc5Q4Y7aXKyWqEStKpwukTgyeBN7ym60gMA9a81q7AQN9I6XJFFmYSrFnj5phxsFmfX+Fbyup8DLn0clvvRWOdRj/oCotem3rBSnA6CM+R99NlpgOKVOIVCn93tyyYcbdAzZ53ujvpBDa1/nQN4BupWntdLPPX+6OoSHG3t+EvQ5EnSxs01Vzj4FcXag3XtfNRceDcw7DEF34ww2bk9jQRM0vDOvKcRFc559dF3oKVdhPtxCD1ls5zYOUBEcqfL4h/w2TG6Ey/BZ9VN9LgNKvudv1t7KEcymBcO8OlWXufzsD/xFIRrs6Qe7SmF7qN11yCxwyUlMwIOmPJElpOTgNtSVOF9fttAulhts7ZXtkhgCVtRX7PMHpT+QPJ2qbKqOfShiaCGKUiGDz4++7gY/B+rY9/1lW8/3wwuQFAnrdgCMHuhw9/Pnp9xsMilK7Jf844KBU3L+DOz1KkCjgn9EgymKpWm1sw+ouD/PIpKSAzCMXEC314DdihOZqtyT1zrfrJrKk8IXKV0GB5+NX65GOD6qwiFpanDrzwDdmk+Z9DIZWbLYKKhGwCVp37r15EpKqxkvXamJ+de05kSe/mbmxG2Urbo8YUU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(110136005)(54906003)(966005)(6486002)(91956017)(5660300002)(2906002)(36756003)(83380400001)(316002)(7416002)(38070700005)(66946007)(122000001)(31696002)(76116006)(66446008)(66476007)(66556008)(86362001)(64756008)(4326008)(8676002)(41300700001)(8936002)(6506007)(44832011)(478600001)(6512007)(26005)(38100700002)(71200400001)(66574015)(31686004)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MlkwR09TdWJhbmNhQXhRRjdJOVJ0WkNSTG1tWDA5eVJPSndqTjFIL3dBb2hG?=
 =?utf-8?B?bHIvVzZTZHg5cGViMVI4MlhKQnZKVGd6K29hVXFtS2c4eU5tcVBZZEhialk2?=
 =?utf-8?B?QWoySWljU2ZVNXVoVkUrN01RUjFoWnM5MG1Ea1pDc01GZWN1TGY1d1kvdk5o?=
 =?utf-8?B?cHc4ZFNKazRnR2lYTkxrR1NZTTlGZ2czVWw5ck1rdUM1eEhad3pVbXplZlAv?=
 =?utf-8?B?VG5tNEVEcUo5Z1UwSUtsV3I4WC9JS2o0ME9YTmkvazJSNmVnbVorU2huNlNC?=
 =?utf-8?B?ZUx2ckZNTHBuSjJlMk5EQURmSjNCd3RVOUFOeTFTZjlkdldpN2NYajdKTlVt?=
 =?utf-8?B?bkNoZDdaaTdSbFVXRDJvcGN0QmViaG1TNGV3S05GOXBlTlh4b1JkSVBKZWdl?=
 =?utf-8?B?YS9VeDJZR1M2RkVuMDdua2E4eWo0OW56aS9tUlZLenF3WEJNR2lFM09TLzBU?=
 =?utf-8?B?V1gxUy82dHB5ck1acXlHWmg0NVArL1FPN0lBK1pHWW9ZeFZMM1E4Skc0Q2hY?=
 =?utf-8?B?UU5qdkJvdUkxcFdQdHQ5RG5OcVJWd2Y3RHhjVERTZ1JkN1c3eDR3RFlZVG9O?=
 =?utf-8?B?RFhrWURKMTJrM2JnQjFza05BZnUrbUNma0h2bnBWZ2JHSFFIOWpaTDF1ZEJS?=
 =?utf-8?B?NHVJSWlQcEFnRGloN2tWYVI3YlBOZVArcGtYaXJBUkRZcHFRK3lkM1UwQ1NI?=
 =?utf-8?B?aDcrMnY2SE1IbERVUllhZ2Rra1ltOUhRTmY1bmNJTElsMlZIT0d4cDFmMDRs?=
 =?utf-8?B?SHFnczBmNG1wY1cxREptYWczbWIvSUtZcEpLcHJkdW9vZkdvMjBXOC9CR2Rx?=
 =?utf-8?B?T0FFRmVEYWJxUVZWcStSSXVKdVJFMU44ZVNVSXVUUmVCV2VmRk1QNGlyZS91?=
 =?utf-8?B?SnJUSG84Rk9KMU5yUXBjc2hOSjB1MGFJQjB4N1FGZ1JVNVQ5NS9pdzMvSWFV?=
 =?utf-8?B?SGxNVVFJVElmbTc2N2FwVFBtL0xyUld2NmJJTG9Bc1VyTjh6MDZOK3ZHMzls?=
 =?utf-8?B?THV5YU1UVUsvYmZKdzM1bzhJK2xIZ3VWS1B4V2M5SHczcmdPY2ozNnp5eUlk?=
 =?utf-8?B?K2EyL1U0VTB5dDdoZjFIS1o0M1ZCbGJFZzNlWkdtVUhOR0o0YU1NS1BCSHVU?=
 =?utf-8?B?c0xXSTZkWGcwa0dWRE85OFJrMU5oV1g2U3piVkNyV3BoREp4ZFR3YzYwL3NI?=
 =?utf-8?B?WWxnTnFGNVVDT2ZTYy83WDEwMFNtOWxIZTYvRlFtdXk3dzY5dTNoY05Kb0lC?=
 =?utf-8?B?MlR3ZmUvY2N0Qk00NW8vdFpUTUl0SW5ZYWE0ZVdVano4d3ptUk82R0Z1eXp0?=
 =?utf-8?B?Q3djZnNqZElWZ0h2MjVIS3N4dnV5VXZpQ2JFLzA5NzZnUFhsVnFxb0d1ZUNL?=
 =?utf-8?B?WlhnaVBFRjMwdXAwSXB3T2Jwc1NGWGVvU1BFa0JZc2R4U25OOU1yVWRKb2h5?=
 =?utf-8?B?Uno2NkRvaEVOenhnRUxkQ1h2Y25nTDBzTlVOeXFob2VZRjh0aXlRVmhSeWFS?=
 =?utf-8?B?T0xidEdJTVVodlFsckM0Z1ZFR3VmRzB0NUNlZGtWU2ZiaHNlTXZvVWdmMVBC?=
 =?utf-8?B?emsrak5oYzl5STJ4enQrSUExdEQxYkZSMVdFck5hZUJxNEFKcjQ5bVlKR2V3?=
 =?utf-8?B?bjRxNGg3QWRDdm5nNStEaVhRK09JVDZyWmtXby9jZUlieDRPZGk5VGZzMWJ6?=
 =?utf-8?B?RUh3LzVOQy8wZHU5eFNuZENtY0tsS280QlpMRGt5akdpQysxYTFWbGhjVEJJ?=
 =?utf-8?B?dmZNa3JyeGxIcExvWllDNkV0NytGZGIyMUozaTR5WjY0L0R4V1pEeUQzem1w?=
 =?utf-8?B?UGdXSzFhaFoyV1FuVktvM2RBc2plbmJNQVBNdEo1cm04RGVqS0JyRHdSNEhL?=
 =?utf-8?B?dk1ONC9SS01aKzVoNEJJZC9Sck9UbUdSUVpTSE5BNlA5a09Kak1ZN0h3N3hU?=
 =?utf-8?B?M3RBRE5RZDJ6M3lWSE5OYm94bnpIZXBUcmUxczBCTG9nUG5adjNkUmc3NVk5?=
 =?utf-8?B?QkxCNzN0WnBSSXNVNHBDYWNFbzUxbU9ZQzlJN3FCQ3pGN0NGV1pTS1RQS2NF?=
 =?utf-8?B?NGlSK1RuSlV4dDV3VzBOVXJQUlBnd0JXdVB4WGF6aVBhNTZXb1kyblp6M2V2?=
 =?utf-8?B?aElRL0l3NHdReWg2Q0YrZ1krcEl4QTluMVJSTjcrMTJjTDd6MXU2MWNvTDha?=
 =?utf-8?Q?kstH53JLX/UTUD52fOpchek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6C2981999809E4DA75F807CDDBE2717@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f61e899-f6f9-4cad-107e-08daa04dc891
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 06:01:56.3597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbpDpYwsP5v7+QHIx5tt+MXxjvawi7XhNY0zeuRLaGmEecNepVNFegVfXOs8SDx1qkzvqc4YT3vHoUYuzSW0UPK/P8WR7Ha1GuAYc1ub2Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1985
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA5LzIwMjIgw6AgMDU6MjEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCAyMDIyLTA5LTI2IGF0IDE0OjU0ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3N0YXRpY19jYWxsLmMNCj4+
PiBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2NhbGwuYw0KPj4+IGluZGV4IDg2M2E3YWEy
NDY1MC4uZWNiYjc0ZTFiNGQzIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
c3RhdGljX2NhbGwuYw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2NhbGwu
Yw0KPj4+IEBAIC00LDMwICs0LDEwOCBAQA0KPj4+ICAgIA0KPj4+ICDCoCAjaW5jbHVkZSA8YXNt
L2NvZGUtcGF0Y2hpbmcuaD4NCj4+PiAgICANCj4+PiArc3RhdGljIHZvaWQqIHBwY19mdW5jdGlv
bl90b2ModTMyICpmdW5jKQ0KPj4+ICt7DQo+Pj4gKyNpZmRlZiBDT05GSUdfUFBDNjRfRUxGX0FC
SV9WMg0KPj4NCj4+IENhbiB5b3UgdXNlIElTX0VOQUJMRUQoQ09ORklHX1BQQzY0X0VMRl9BQklf
VjIpIGluc3RlYWQgPw0KPiANCj4gSSB0cmllZCB3aGVuIGltcGxlbWVudGluZyBpdCwgYnV0IHRo
ZSBgKHU2NCkgZnVuY2AgY2FzdCBpcyBhbiBpc3N1ZS4gSQ0KPiBjb3VsZCBzaWRlIHN0ZXAgaXQg
YW5kIHVzZSBgdW5zaWduZWQgbG9uZ2AgaWYgdGhhdCdzIHByZWZlcmFibGU/DQo+IE90aGVyd2lz
ZSBJIGxpa2UgYmVpbmcgZXhwbGljaXQgYWJvdXQgdGhlIHNpemUsIGl0J3MgYSBkZWxpY2F0ZQ0K
PiBmdW5jdGlvbi4NCg0KSXQgaXMgYWx3YXlzIGJldHRlciB0byBoYXZlIGNvZGUgdGhhdCBidWls
ZHMgaW5kZXBlbmRhbnQgb2YgY29uZmlnIA0Kb3B0aW9ucy4gSSBoZWxwcyB3aXRoIGJ1aWxkIGNv
bnZlcmFnZSwgeW91IGRvbid0IGhhdmUgdG8gYnVpbGQgdGhvdXNhbmRzIA0Kb2YgZGVmY29uZmln
cyBpbiBvcmRlciB0byBjb3ZlciBhbGwgb3B0aW9ucy4NCg0KU2VlIA0KaHR0cHM6Ly9kb2NzLmtl
cm5lbC5vcmcvcHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRtbCNjb25kaXRpb25hbC1jb21waWxhdGlv
bg0KDQpGb3IgbWUsIHVzaW5nICJ1bnNpZ25lZCBsb25nIiBpcyBtb3JlIGV4cGxpY2l0IHRoYW4g
dTY0IHdoZW4gaXQgDQpyZXByZXNlbnRzIHRoZSB2YWx1ZSBvZiBhIHBvaW50ZXIu
