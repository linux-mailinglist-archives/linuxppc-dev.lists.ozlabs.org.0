Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21159D0D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 07:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBdjT2qTcz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 15:54:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xDfQXO4e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.73; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xDfQXO4e;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120073.outbound.protection.outlook.com [40.107.12.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBdhh387Rz305d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 15:54:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdDCtX/N13isY8G+gI9H5laEsouMky2rTbztoJU7bcIF9JJbW8FC88ohr2Vl0yI2XnFPQ/wt/gJObVRDT7SgMrC4gx/+rsISkcnptA/c0aJ0TE0rmJ9enGgyG8wsV22X5XaJzXbhy4D/4xuz+tY8XZSxr5ScIMM9NnryEeE/Xr2VFVjFoSlSscM5S2Cc0Z/fWUrBtxVl8KBxKi7NCjqiJW4rvChOiF0LjoOmTbXdHdS6an1trny6GQ24UriDoZSI1fMpify4Q9ZTZXxBQSvgbviel4dIQzjBlZd6v8X/mVIbUYMJqssj7TP5KfWeB28bqHSx2HEm0gzfz4pEj2T9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR/E9Z/BqZQkaIijKYTqxeoG2RmIVtMGnSkrbaR1djw=;
 b=jP0q0Wl6AP0gLhkgwrTv0D5nm70mzzqX+Ve1arxsCXc3Da9xI94NpzXnYLDBP0jr5zbGcT0UY1kH5u+XzPyMv/VZy+JMP6GfQ9Tgn7zC9t6sys3akHWRI1V7pupRRnwQ+4R5XccbYJiOA/WveW9Ysz+9qevIAuCye3AhAFlC0QLtpzBESciDh99tfnj6sQlJv83QZexvT1kMPhw3H2e3Yt9it74A5Wmr7NHeXMPeBEvFXTLvLeOLkTtf4ZjRRQCmx8IPWU4qj7idWGnmO/bCuloSHON5JKJHzWcXNxR4tZnrUJfwZU/GE0Ez5hH9JjWlTox6X8qZo+UJKGl62wIfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR/E9Z/BqZQkaIijKYTqxeoG2RmIVtMGnSkrbaR1djw=;
 b=xDfQXO4e2leraLSkIX2coqvzX9z7iWvVig2q4X0DAdsR2tZ++JaxHIbkm61Sv/UyU//Hm/5FOpN/PF5KUVcYOc3mIag9A19DD9hAJ4AHvGjKN8uow/9OMw3xtrQzZWuvLD6KMo80JeHMdP0lppD9rW7H4rVlHmSPIegPlGjZL2QxlMtU08LVK+VhSdiMmkhHJxljjgi69kNkjCerK67K2Y6hpULLCIyo6GQ1xs594lcFWo7277iEZWjZ/BOLrB//FmOiDbVt53k82Te9INSSwmo/S4A9FUDs+GRbSdodzDaG8Ehi1nufZMSXXHnKqDVqVVIU6ipk/0b4cxe6KU6EHQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1684.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Tue, 23 Aug
 2022 05:53:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 05:53:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Topic: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Index: AQHYtPl0/VA1s9ADPEeW7qUGdddrzK26cACAgAFJbACAAEYPgA==
Date: Tue, 23 Aug 2022 05:53:50 +0000
Message-ID: <7f5cff06-903f-f823-db10-ed6d2aafba23@csgroup.eu>
References: <20220821010030.97539-1-zhouzhouyi@gmail.com>
 <6375fd69-d57f-be90-6b17-f183e918dbc8@csgroup.eu>
 <CAABZP2y8dGAWHZwbXpbQgc3iO+7hBMuexqvcYUK-GKaKnAHH5Q@mail.gmail.com>
In-Reply-To:  <CAABZP2y8dGAWHZwbXpbQgc3iO+7hBMuexqvcYUK-GKaKnAHH5Q@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 542a8bae-219a-4091-85b1-08da84cbdaa1
x-ms-traffictypediagnostic: MR1P264MB1684:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6/z3CYs+UV9FnW9yArTRBiDMrJwmaH5NIpB/wmYwRrawPZrTxTc/45N0+n7hAytQRuU8yblzH/MR6DlI93zV4vV0MUaaG+tH9KwfEYrvZE4iw27n96riU00cBTibFDDrjKtjZEmlg8AOv6q9piEJQI29lzOokQhN0RvVPNVt8ma8uNcvUcIsbq8mPaRiQ8+y1rhGWThLkXvhY4p3DqnVbn/UfqqZS1+1em2BHxeMPQztZxKGIOvp5URCxEmx3IqJ+xjVKnvqCONnA6Esz7pARPuN/Z2qKJ5avRzyg0EV24YWUtruYpaKydcx9VxeaiKoot9AAI+D/H3ZzgIuSoa75zkxViVX9anT8k11SxVEng1xJ7WJHVJ5YpWn58yLjQx4MAcoKVLIXxqRzF19nMKOLrCm+L3vKOX8BzCQrTgO4TTNwiCfxnMRQWqBZTgADP4I//mpLPpffDLvCiEY2ultuVHr3xJZgZ5mIWgVzSYQTTFeCE+51thxzbnZjX0vIQNals2Gx8w8uk4c0nOLswt649Is/AG8jI1OwgibYDhWTTCZzPq/aeus9cqSDDwlGpZfSnDwpR6qh7wW0OGObN7GieZfF5vq5Qm1DASbELMdl/f/GJetew81TfZ5vEV+hc68kLUKbmIRUm/iZ6aTRRZuRqUOdDMw6hsJ5HA/5P25bwYNO20EIOyEybysPnXKvBT10mZzZUesl2SwWYhGFTIlBmlZryRF2cTh5nxHYOQlj6MaMLjsGmDkKZEmbeIrLATiQKvtnkpY8TY1y3KfYriBP9CTWcIR5pF6FFMYLv5v/PAXKzom8BfpwYUhSkClI+/zKMk0Gk16EkjKlky2j5ayxg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(136003)(39850400004)(41300700001)(5660300002)(8936002)(6486002)(478600001)(31696002)(53546011)(2906002)(6506007)(26005)(6512007)(44832011)(86362001)(122000001)(38100700002)(186003)(66574015)(2616005)(38070700005)(83380400001)(8676002)(76116006)(31686004)(6916009)(71200400001)(316002)(4326008)(66946007)(66446008)(64756008)(66556008)(66476007)(36756003)(91956017)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aGhZZE9sOHAzZFppNlBkK1NWWFdWbnBrNWF0NG0ydjlwU1NuNFRLemVoL0Nw?=
 =?utf-8?B?RlorNXhSUU83a0RoNHQ0aXpUTDdwM1ZjNW90RzJhRUZSUCtHaDAwcmJ2Nk9V?=
 =?utf-8?B?eXRWblRxVWFxTTJDVk9uc25EWkF6OCszVkFDTk0rYjI0QXZiMUE4c0tXalRP?=
 =?utf-8?B?dzNWNjh5emlab0NNMzdHZkJVazVCRzVNemxPZ05VMjJSdElJNTJCcHFZQmUr?=
 =?utf-8?B?cHFVOVh4Ny9sRmVPU1ZxeEVYUG9DY252T01PZTBVZTQ5OHV4QUJ3WmVWMC9C?=
 =?utf-8?B?RVRiZjVvRENhSm8vVDduNktKZDlNbThNVi9NQ3h4dUd4RVZzRmdvZ1h3dlBR?=
 =?utf-8?B?cVVFY0wyNjF2bGRSMmV3YXZFUkQzZHZBYzZXNndpaTRQSVZJQTNCOW55b0I4?=
 =?utf-8?B?QVdUbjlHTHcrQUtObXdEYWVSVFZXRTZyM3dkejJhaERMMitWclJvRjRiSnll?=
 =?utf-8?B?MWgxRXYvKzRyVXZqbnZmNHh5SkNwTmlTb0tJVFpSWUpsWU9FNktvRERYZEJC?=
 =?utf-8?B?NU1ySEhuNVplbTNNQXJHZzkxd3dsbFBKN1VRdjNjaW5BOTFjMzhHbkp6L0Ir?=
 =?utf-8?B?aGlLc1ZGTzVHTmNkcC9JK3JtcDkveURLVEVuTjVzejQzenVEUFA4dTh5TjIw?=
 =?utf-8?B?Ky9idXlTQzd0ZFE3dzhjS0xIZkxKNHRLaERkZWhNZncrYkRuWXJWaE84ckMx?=
 =?utf-8?B?emlMdFVmaFMxVk5XTXlmejlOWVpTM0VoMm1KUEh2K3E5QnQ5T2RRbzRLKzJu?=
 =?utf-8?B?T24zODBndTlCb21ET3YvUE5yZ1B3ZkI5NVkvYnlnRFhURnEyelMwd2ljL3Jl?=
 =?utf-8?B?d0NFRnVpdzVHQ3NtRFV2ZVh4R05Wekk0STU3aVN4Syt3SUt3TUdFRDB6ZGht?=
 =?utf-8?B?ZGkvdVVHcXRnU00zMUgvZVhWcmZqQ2RkTWY4VC9idWZlVnFBaExOLzg4cTN2?=
 =?utf-8?B?KzlJdHBFTEsxcmFWQlErMWhTMmlrR0l1elF5M0FkNEYwVk5wNWUyczJ1SlpN?=
 =?utf-8?B?NVZqMkpVY2VVWDhIU2l0ZzFkcFVTZEluaFFhS3ZYdTRRZ1liMHlLSjNmaUty?=
 =?utf-8?B?c0tnM1kyOXJ3SENEWGxhQnBHRDZqMVdWYUlNeFpyUFZLRkxRRERWOFg3am81?=
 =?utf-8?B?ZFM2T3ZpMEYvdTRCbU9vekZJdk1TR2xlSXlPeXFWNGJwSG4rc2JvZ2Z0bktJ?=
 =?utf-8?B?MVNGR2EvaDNWNDhDZUM4TnJDWE5YWC8vdVl3ZEJkNmwzR2QzbkJyQWJWQjNF?=
 =?utf-8?B?YjNUNmFKdUVPVnREb2ZCTW5BNm9Mb3JDUUxrSmpwaVZIR3pEcTRFUjRFVFB4?=
 =?utf-8?B?UlUwVEhtdWZyRDNHekxwNDZPQ2lBMmRBZlJKQWtrVkExakRvbEtYRU0xa2RX?=
 =?utf-8?B?T3JpT294dUJlT093WXJhSFRTMERqbXhEakVIaFY5bVpyL3U1WmdlRDl1TnlX?=
 =?utf-8?B?QWJHd0VlRk1rc1gvTjNMeXlSZUdUMmdNMVV6VHlpc0JQNWloOGZ3SWdjc2ty?=
 =?utf-8?B?SloxWmpHL2s5SXkvcXFINjJPWWMyZFE5TTV0TGhETDgzb1NXSU5IQVdzSUpk?=
 =?utf-8?B?YmpzMmpTS01OYUJOM0NEUEpLdWdNZ3VrMTZlSkMrYWR4dFNQT3crYVdFbFd4?=
 =?utf-8?B?dXJBK0tzZjl1cjloczVWZFJDdHJyZC8xV3RmTS9Oc2JscG9uYWFmR3gvd2c4?=
 =?utf-8?B?bW9HOSs2c3lWYkRWeXlxa3VWbTczcFNxSHQ3dm1ySHg1KzJzZWJ4N3hXV1pG?=
 =?utf-8?B?b2Nwdlh3cStYbmR5SXBDTmhvMlYva3pwODY0Wnl0Vy9IMG5tbVowbzFRSnBF?=
 =?utf-8?B?Q2VBZlJQbU5GaExkc2hsWHVzRStFUmJRdGtUZ1JLK1ltcDN0VTZUNTNXN1JT?=
 =?utf-8?B?MnUyZEhnaFkwbnVjMmZGUjNjVDJmd3E5bnJMYkpaMXdVRWlMWkErdWZxY2cy?=
 =?utf-8?B?TnlxNnQ4TlFJMmtFWVBLYjJzMi9yeUJ5SHZXaHRuWTI1WXVMZE9Ib3NweDZI?=
 =?utf-8?B?YVF2WHBaL2ZIOTNZNlZpaHFjL0NJTnFmZ1Vuc3BsK01McnJ2Z2hqVVJmTjkx?=
 =?utf-8?B?a0V0NG4wWEVSQUlwVHE3eG8veWRaZmgzQ2kzOGIwY2tyRFVxSkVUV2o4dUFP?=
 =?utf-8?B?dURKbzhTSk8wNEVWT1pUNlRjTWFvVldBUDNER3RBYy9Ed0xQMXVpbk1PVWJP?=
 =?utf-8?Q?bpwx0WQFGRQdCdAENM59xZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C6E2157CB2EF64ABE49D43ADE2D4A08@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 542a8bae-219a-4091-85b1-08da84cbdaa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 05:53:50.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KCH46b69MwQHilInSTd1VtM05s4LX0f1guX6sLgnNoNfLHmJwTlxd8UzzNLgpWpiLaGk5wsNSoywZkIkF3s0mvE1UPHyIKt43rfksVCk+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1684
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
Cc: "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA4LzIwMjIgw6AgMDM6NDMsIFpob3V5aSBaaG91IGEgw6ljcml0wqA6DQo+IE9u
IE1vbiwgQXVnIDIyLCAyMDIyIGF0IDI6MDQgUE0gQ2hyaXN0b3BoZSBMZXJveQ0KPiA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+IExlIDIxLzA4LzIw
MjIgw6AgMDM6MDAsIFpob3V5aSBaaG91IGEgw6ljcml0IDoNCj4+PiBJbiBwcGMsIGNvbXBpbGVy
IGJhc2VkIHNhbml0aXplciB3aWxsIGdlbmVyYXRlIGluc3RydW1lbnQgaW5zdHJ1Y3Rpb25zDQo+
Pj4gYXJvdW5kIHN0YXRlbWVudCBXUklURV9PTkNFKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2ss
IG1hc2spOg0KPj4+DQo+Pj4gICAgICAweGMwMDAwMDAwMDAyOTVjYjAgPCswPjogIGFkZGlzICAg
cjIscjEyLDc3NA0KPj4+ICAgICAgMHhjMDAwMDAwMDAwMjk1Y2I0IDwrND46ICBhZGRpICAgIHIy
LHIyLDE2NDY0DQo+Pj4gICAgICAweGMwMDAwMDAwMDAyOTVjYjggPCs4PjogIG1mbHIgICAgcjAN
Cj4+PiAgICAgIDB4YzAwMDAwMDAwMDI5NWNiYyA8KzEyPjogYmwgICAgICAweGMwMDAwMDAwMDAw
OGJiNGMgPG1jb3VudD4NCj4+PiAgICAgIDB4YzAwMDAwMDAwMDI5NWNjMCA8KzE2PjogbWZsciAg
ICByMA0KPj4+ICAgICAgMHhjMDAwMDAwMDAwMjk1Y2M0IDwrMjA+OiBzdGQgICAgIHIzMSwtOChy
MSkNCj4+PiAgICAgIDB4YzAwMDAwMDAwMDI5NWNjOCA8KzI0PjogYWRkaSAgICByMyxyMTMsMjM1
NA0KPj4+ICAgICAgMHhjMDAwMDAwMDAwMjk1Y2NjIDwrMjg+OiBtciAgICAgIHIzMSxyMTMNCj4+
PiAgICAgIDB4YzAwMDAwMDAwMDI5NWNkMCA8KzMyPjogc3RkICAgICByMCwxNihyMSkNCj4+PiAg
ICAgIDB4YzAwMDAwMDAwMDI5NWNkNCA8KzM2Pjogc3RkdSAgICByMSwtNDgocjEpDQo+Pj4gICAg
ICAweGMwMDAwMDAwMDAyOTVjZDggPCs0MD46IGJsICAgICAgMHhjMDAwMDAwMDAwNjA5Yjk4IDxf
X2FzYW5fc3RvcmUxKzg+DQo+Pj4gICAgICAweGMwMDAwMDAwMDAyOTVjZGMgPCs0ND46IG5vcA0K
Pj4+ICAgICAgMHhjMDAwMDAwMDAwMjk1Y2UwIDwrNDg+OiBsaSAgICAgIHI5LDENCj4+PiAgICAg
IDB4YzAwMDAwMDAwMDI5NWNlNCA8KzUyPjogc3RiICAgICByOSwyMzU0KHIzMSkNCj4+PiAgICAg
IDB4YzAwMDAwMDAwMDI5NWNlOCA8KzU2PjogYWRkaSAgICByMSxyMSw0OA0KPj4+ICAgICAgMHhj
MDAwMDAwMDAwMjk1Y2VjIDwrNjA+OiBsZCAgICAgIHIwLDE2KHIxKQ0KPj4+ICAgICAgMHhjMDAw
MDAwMDAwMjk1Y2YwIDwrNjQ+OiBsZCAgICAgIHIzMSwtOChyMSkNCj4+PiAgICAgIDB4YzAwMDAw
MDAwMDI5NWNmNCA8KzY4PjogbXRsciAgICByMA0KPj4+DQo+Pj4gSWYgdGhlcmUgaXMgYSBjb250
ZXh0IHN3aXRjaCBiZWZvcmUgInN0YiAgICAgcjksMjM1NChyMzEpIiwgcjMxIG1heQ0KPj4+IG5v
dCBlcXVhbCB0byByMTMsIGluIHN1Y2ggY2FzZSwgaXJxIHNvZnQgbWFzayB3aWxsIG5vdCB3b3Jr
Lg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBkaXNhYmxlIHNhbml0aXplciBpbiBpcnFfc29mdF9tYXNr
X3NldC4NCj4+DQo+PiBXZWxsIHNwb3R0ZWQsIHRoYW5rcy4NCj4gVGhhbmsgQ2hyaXN0b3BoZSBm
b3IgcmV2aWV3aW5nIG15IHBhdGNoIGFuZCB5b3VyIGd1aWRhbmNlIQ0KPj4NCj4+IFlvdSBzaG91
bGQgYWRkOg0KPj4NCj4+IEZpeGVzOiBlZjViNTcwZDM3MDAgKCJwb3dlcnBjL2lycTogRG9uJ3Qg
b3BlbiBjb2RlIGlycV9zb2Z0X21hc2sgaGVscGVycyIpDQo+IE9LLCBJIHdpbGwgZG8gaXQhDQo+
Pg0KPj4gQnkgdGhlIHdheSwgSSB0aGluayB0aGUgUkVBRF9PTkNFKCkgbGlrZWx5IGhhcyB0aGUg
c2FtZSBpc3N1ZSBzbyB5b3UNCj4+IHNob3VsZCBmaXggaXJxX3NvZnRfbWFza19yZXR1cm4oKSBh
dCB0aGUgc2FtZSB0aW1lLg0KPiBZZXMsIGFmdGVyIGRpc2Fzc2VtYmxpbmcgaXJxX3NvZnRfbWFz
a19yZXR1cm4sIHNoZSBoYXMgdGhlIHNhbWUgaXNzdWUNCj4gYXMgaXJxX3NvZnRfbWFza19zZXQu
DQo+IA0KPiBJbiBhZGRpdGlvbiwgSSByZWFkIGh3X2lycS5oIGJ5IG5ha2VkIGV5ZSB0byBzZWFy
Y2ggZm9yIHJlbW92ZWQgaW5saW5lDQo+IGFzc2VtYmx5IG9uZSBieSBvbmUsDQo+IEkgZm91bmQg
YW5vdGhlciBwbGFjZSB0aGF0IHdlIGNvdWxkIHBvc3NpYmxlIGVuaGFuY2UgKFRoYW5rIFBhdWwg
RS4NCj4gTWNLZW5ueSBmb3IgdGVhY2hpbmcgbWUgdXNlIGdpdCBibGFtZSA7LSkpOg0KPiAwNzdm
YzYyYjJiNjZhKCJwb3dlcnBjL2lycTogcmVtb3ZlIGlubGluZSBhc3NlbWJseSBpbiBoYXJkX2ly
cV9kaXNhYmxlIG1hY3JvIikNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h3X2ly
cS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19pcnEuaA0KPiBAQCAtMjgy
LDkgKzI4Miw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwbWlfaXJxX3BlbmRpbmcodm9pZCkNCj4g
ICAgICAgICAgZmxhZ3MgPSBpcnFfc29mdF9tYXNrX3NldF9yZXR1cm4oSVJRU19BTExfRElTQUJM
RUQpOyAgICAgICAgICAgIFwNCj4gICAgICAgICAgbG9jYWxfcGFjYS0+aXJxX2hhcHBlbmVkIHw9
IFBBQ0FfSVJRX0hBUkRfRElTOyAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgaWYgKCFh
cmNoX2lycXNfZGlzYWJsZWRfZmxhZ3MoZmxhZ3MpKSB7ICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gLSAgICAgICAgICAgICAgIGFzbSAoInN0ZHggJSVyMSwgMCwgJTEgOyIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAgICAgICAgICAgICAgICA6ICI9bSIgKGxv
Y2FsX3BhY2EtPnNhdmVkX3IxKSAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgICAgICAg
ICAgICAgICAgIDogImIiICgmbG9jYWxfcGFjYS0+c2F2ZWRfcjEpKTsgICAgICAgICAgICAgICAg
ICAgIFwNCj4gKyAgICAgICAgICAgICAgIFdSSVRFX09OQ0UobG9jYWxfcGFjYS0+c2F2ZWRfcjEs
IGN1cnJlbnRfc3RhY2tfcG9pbnRlcik7XA0KPiAgICAgICAgICAgICAgICAgIHRyYWNlX2hhcmRp
cnFzX29mZigpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAg
ICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAgIH0gd2hpbGUoMCkNCj4gSSB3cmFwIHRoZSBtYWNybyBoYXJkX2lycV9k
aXNhYmxlIGludG8gYSB0ZXN0IGZ1bmN0aW9uIGFuZCBkaXNhc3NlbWJsZQ0KPiBpdCwgc2hlIGhh
cyB0aGUgYWJvdmUgaXNzdWUgdG9vOg0KPiAoZ2RiKSBkaXNhc3NlbWJsZSB0ZXN0MDAyDQo+IER1
bXAgb2YgYXNzZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIHRlc3QwMDI6DQouLi4NCj4gQ291bGQg
d2UgcmV3cml0ZSB0aGlzIG1hY3JvIGludG8gYSBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uIGFzDQo+
IGlycV9zb2Z0X21hc2tfc2V0IGRvZXMsIGFuZCBkaXNhYmxlIHNhbml0aXplciBmb3IgaXQ/DQoN
ClllcyB3ZSBjb3VsZCB0cnkgdG8gZG8gdGhhdCwgaG9waW5nIGl0IHdpbGwgbm90IGJyaW5nIHRv
byBtdWNoIHRyb3VibGVzIA0Kd2l0aCBjaXJjdWxhciBoZWFkZXIgaW5jbHVzaW9uLg0KDQpBbm90
aGVyIHBvc3NpYmxlIGFwcHJvYWNoIGNvdWxkIGJlIHRvIGNyZWF0ZSBhIFdSSVRFX09OQ0VfTk9D
SEVDSygpIG1vcmUgDQpvciBsZXNzIHNpbWlsYXIgdG8gZXhpc3RpbmcgUkVBRF9PTkNFX05PQ0hF
Q0soKS4NCg0KV2UgY291bGQgYWxzbyBjaGFuZ2UgUkVBRF9PTkNFX05PQ0hFQ0soKSB0byBhY2Nl
cHQgYnl0ZXMgc2l6ZSB0aGVuIHVzZSANCml0IGZvciBpcnFfc29mdF9tYXNrX3JldHVybigpIC4N
Cg0KQ2hyaXN0b3BoZQ==
