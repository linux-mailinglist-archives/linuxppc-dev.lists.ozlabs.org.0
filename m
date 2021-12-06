Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA5469204
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:08:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6yJQ5ZkTz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:08:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::614;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yHw4k3Nz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:07:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZm5DpdH2C1aBDbDAK/zF2sD1Zi+f2ldmJkgqh18nUAu5Lx7c81H+j3OY3kvKFKbVGC28VOsLjhFwJ3WQja41cNZihrrmGI3nQzUj6VhrLE6W0Y4BXPFjgSJBFjD/GyjTKLT2NyZajAwB1qY8ZOVaj2GTM1DPpqAGGCuIil1m9wSd2GNuXwUV8Oz9ZG8lqn55c9g/nHjtQI9f9ZNwmiHrmc7SYTzEpkWkiiTLahPbUseeFwdsPxtS7xWmR4rDEp7UOuxIeVD6YAu2qSdIR/FHJS/8A52jhLzyn6ymFnnL2zNIhcnmM+sjvYTgUKqnOFq/oLQ1+HotHrkprSb/BT9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwqZN8zUQvaOdYVFwSytISfYuvxQfATRoB75226Yk1M=;
 b=VX7oQgrRudKRwipp0PAlZGMa6pOkhFGiTH5YFh+d7sDg+g4Wty4BNDne8FVNCauP+EPMNoltfy7NhijCcP3yNAb3q3YBGST8QGIm34pCF8C23gJ6Q8i5YEJdmZPw2B/Ycv7od22slTdf33e67dFdGse2FD3473XU73cM+yrW8RczOHibpRgzlakErgM7WIStybf5yPZjUsmRiG2rja720hvdmCR1v4gB7yvcYfU/GyZndn5ML9ddblu8mTjXZRNaZTMR71WREAYK89sdeMeFZQfCpyuTVDrjJGzMNnQmDaYK8yufgq8QcQNWPfDn6v0qTctIbtq/Us5NpCjF1FRUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0451.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 09:07:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 09:07:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIAAGRKAgAA7RACAAJxUgIAAHSSAgAAFZ4A=
Date: Mon, 6 Dec 2021 09:07:18 +0000
Message-ID: <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
 <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
 <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
In-Reply-To: <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7a671af-ce59-4672-f2f9-08d9b897cdf2
x-ms-traffictypediagnostic: MR2P264MB0451:EE_
x-microsoft-antispam-prvs: <MR2P264MB0451F5FE2D812530082FC2D9ED6D9@MR2P264MB0451.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBsLtdFANluxfA1lQ/HbPbeuEmFvHsbfg4KVECrWJxAxVgCkt/23zCV0LBc9ot07ksi0LOwN49qUornHziYKOXMwFq6ZF6UhPuoUp0TbPVofVoO/SI5XdACtxaT2v1xEFBjznDFXk3UEHU0Gb4xnx9ZJVCAVpQPMGuSBDTLv8bkqYNVV9NGAb59nfI30WMVALPOH3h/NmiizMD2mRm0rFkuC9mB33gAAswnalhNXYVUsLGrM6ZcwQUcUTQEXSEAwU6W7DwaVk+lMZinnlFAPFa7sk4TAgup7LbfVsWp/6qomZT9GlPkiyuMAOvdPj9ZrC9RlC6DryLu1bPiIwsJjCZ30K0Ht8L9VDUm2o/CY7yfvDB2dhMABME6kzw4TSeySH86gLOimAeyBuHL2p83d++QsBBN8wUdYo1DdTeMIMMXF1+BidK8vo/pWgpEXAShHRiQZ5i+0UsYxt+LgpfKUpKfABqMRnDCwNP06Iznwm963h5/GaYrMK6QcOJeObPRMhXbz2SKxJzPvzslPbFafybhegqLYp6ozTqaFGQEcWTw3a3LzVAE1GcNrX8AFuC4vu7QtFE9rYO9hNOATNLZWoMoHP3FGzWStRx3eJT0Plga60Fw96ugIOkQ8ZdcP4LRLdIndfvWvNpDfS9TcwVjfEE4HjE/GaS3miOUlbQybef0LoyEzy7ZiE2AJydKUuixzcl32Ki9Pmd8As5bcwODMc83rXaYJaIleb6POslpJkD3QPOCiuLywSZlFcnaSaXT9qdEEsWa/c+TaM5k+ujygGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(31696002)(86362001)(2906002)(8936002)(122000001)(6916009)(5660300002)(508600001)(4326008)(26005)(71200400001)(38100700002)(31686004)(6506007)(38070700005)(66476007)(316002)(4744005)(66556008)(91956017)(76116006)(64756008)(6512007)(66446008)(36756003)(6486002)(2616005)(44832011)(66946007)(8676002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU4yQVhxK3prV1hQaUdTc3BBUWxPZTFENVhXZjkrVVpCTFhsN0pTZHQxN0VH?=
 =?utf-8?B?U2k1SmhwOUtNb2Z3bXo2UVhjZm1VU3lWdm14STRidDMzSmVoY0NIT1l0VzVt?=
 =?utf-8?B?cmdPN0s5RXh2TElvSzVrMm9zMkliWFJLZzM5RkR0ZEVpR0JzL1JCa2dwbk1r?=
 =?utf-8?B?S3RER2VyMmVaRFdCOFRnamF4M0FpNHhvcGsxSlE0cEZxdnVXUG5zeHhGMU4r?=
 =?utf-8?B?MGNOWGdIdVhLUW5Kd0xSeEppNDMwQ0V0UmJmd1l0V3JKQzhFTlVCWnlZSldM?=
 =?utf-8?B?NlRya1daNjArbSsra1A3b3dYb09jTjYxaXFOdE5Yc2VMR0Fyb1RDU3pYSnh2?=
 =?utf-8?B?a1Eyb0hLamlpMkRDdnZ0VDZOY01DTTUvUEI2OGJ5VmhpajNUNm1TRGdxUHZz?=
 =?utf-8?B?RW5GOGJQdlRtTGJXN1RJUExCVkU4b2hjdVIrV0RkQ2VwbjlCczQ5Tk4rQzBK?=
 =?utf-8?B?MWI3VmIyWWNZU1RXY0dWUEJvVlF4Q01pY3lqcjdXaE1XcWVhbGZuQWtxamhy?=
 =?utf-8?B?cENaK1RQSmhQY2J4VUlwZTFhdXIyMVFkdnVYZGpYb2RsVU5DdVJOaGgvekt6?=
 =?utf-8?B?MG9uQmZlWFZUQ0Qwa200anV0ZWdjM1NQVGVNUjE0ZW1PN203SmNmZENWQW52?=
 =?utf-8?B?ekZLaHMxTW1GQTk5ZHEvR1BScUVxa1lUS3dQN21HaXBjeEFJQ0xBQzZicTI4?=
 =?utf-8?B?T0NvZmpVKy94eEE5cEorNUg2Mzd0dHAvak1raGVqTStzMDJNMnl3T2Z6Q29T?=
 =?utf-8?B?OFlrNzZqd05rVWdVSGJiMmdOZmNVcWY1OGYxMEZ2UStWeFhCbmttTGRMNVRl?=
 =?utf-8?B?cGRWOUJac2VJTVNNcEdBMDlVbVUyd1V6ekpvSDN5Z01jd1VFckdqSk9ELzRu?=
 =?utf-8?B?bDkxZlNvaTBxYit6cDRmdmRQMVRxSWF2a2hRL3p1eWhWd2IxRnJKSkFISDl1?=
 =?utf-8?B?b2p2R292a21JUDRKTTdwU2ViVjc4cWpYZHlhVWQyNnlwRjBBWEx6RncwaUNX?=
 =?utf-8?B?cFNSdFJOWkxVRlFybzNZRkdvNzYrTnJVVkhyOEJEWlZ0MlV5bG5jR2hOeDVp?=
 =?utf-8?B?Q3VMbUZscEFjRVAyTlNuUm5qQUVmM0NXMVV2MHdvTVlGVGFEeENPbm02Y0hS?=
 =?utf-8?B?eStZcW40bWZSQUhGYWErL1A4MEUweGZGSnpzK2RuVUMzL0pqSzJLTUpTU2dx?=
 =?utf-8?B?NTcxT204Wmptb3JwNDZOOTVxTmsvUXE0RUczUk83TnpZeElpTXp5aG9TQ1Ez?=
 =?utf-8?B?TVVCeVdJd0tuc0svekZ3RUx0TlhmUml5bEJKb3g4QXlhWWpyMUhOKzlIeGVM?=
 =?utf-8?B?VCtxdWRRME1zYXBEKzFJZnNkT1lFNXNaTEl0b1NnV0pXZkM5U05UV3FvOUJH?=
 =?utf-8?B?dVdIT3lKQXJNdm1uZ1JjS0p5a0lMaW9YMEhSb2dHdkJSdDgzVHo4MjZCUEh1?=
 =?utf-8?B?MEl6SjZYMkpCTTM1NXhiRE1KSHd1L2ZVR1pSR24zRzJQUjVKYmFZQzVMN1Rq?=
 =?utf-8?B?ZnlGZnZMVDZSYldrM0VxbW1oTVlRZ3VxRitWM052bW00cHpZd1Q2em80ZnVK?=
 =?utf-8?B?dm16bnZCUzVCWURZWjUwaTNJYUJoenFvVDBtaVVaUklWQlVCS3NveFJTcTN2?=
 =?utf-8?B?TnNyOHl4S3NOQU56SExBejdkMlNCakZCQnlGZFY5TzJjNWhLbTdPYXkrbksr?=
 =?utf-8?B?K0tKTVAxNHl2c0VITmFwTUdoMkRMQUNFYzZvSTBBRVJQSWU0NmNZMlNBSVZm?=
 =?utf-8?B?aC80YlhySm5hRTRpb2tqdU1UOXJiOUhPK1dLQXFhcVZsbHR3ZFh1NzhMeElz?=
 =?utf-8?B?Y21nWEhleTNBaWhVclcvYktiM0ovUndmdTBMamxTdEhwZkNZS1dDSjRRVmRx?=
 =?utf-8?B?cHV2V2JCQ3FMOTVHWW1VdjN0eTQzcGpFL2RtRTlobXVGZHVaTnZrekhETlRF?=
 =?utf-8?B?cVg2YnZjMG0vRjJTOWlTbzBvT1crd1hGc3RWSEhraklrbFdTUnVKbGx4bEtB?=
 =?utf-8?B?cHF0NmQvV3E3d2FMck5QTnErcHdiSkJURVdKTERCN1dNK1VBMW1ZRUZIV1c1?=
 =?utf-8?B?clUwMzVHV05oZTk3dmtramkrRFZ1RWtCaWdWNGpBRGdQWjlsRm11Uk1yenJH?=
 =?utf-8?B?TVdjN2RrQWJya0tlWjZpeGdnZTJ5Nk1VL2JNMnE0c1FDS1g2Sm54ZmRpNDZC?=
 =?utf-8?B?bVpEQndRNW05ejRldEVtT0FicXlQbXRIUElvbmpMSTJIdjRoK0pLd3E1eGZ6?=
 =?utf-8?Q?mKNidbqDq93h610wiOZGywVwsZt5fgNGwVb4cWkBa0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39AD5D3B937FDA42B27CC6953D62A3AE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a671af-ce59-4672-f2f9-08d9b897cdf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 09:07:18.3931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owLNAqeSHw3eyrdzNt0QpSD3cawySiVAbRei70TQ+Z4mfabzuZcFTchJCJxyPzTzGywJsHhqfob9embvM0P5QHR9a4SfVUhPrkk6nH/wviI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0451
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjEgw6AgMDk6NDcsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gT24gTW9uLCAyMDIxLTEyLTA2IGF0IDA3OjAzICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPiANCj4+IElzIGl0IHdvcnRoIGl0ID8gSSBoYXZlIHRoZSBmZWVsaW5nIHRoYXQncyBt
b3JlIGEgY29ybmVyIGNhc2UuDQo+IA0KPiBwcm9iYWJseSBub3Qgc2luY2UgaXQncyBub3QgYW4g
ZWFzeSBmaXgNCj4gDQo+IEknbSBydW5uaW5nIG9uIHRoZSBlZGdlIHdydCBCQVQgdXNhZ2Ugb24g
bXkgMkdCIGJvYXJkLCBpdCdzIG5vdCB0aGF0DQo+IGNvbW1vbiBJIGd1ZXNzLg0KPiANCg0KTG9v
a3MgbGlrZSB5b3UgY2FuIHdpbiBzb21ldGhpbmcgaWYgeW91IHRha2UgdGhlIHBhdGNoIEkganVz
dCBzZW50IGFuZCANCnJlcGxhY2UgdGhlIG1lbWJsb2NrX3BoeXNfYWxsb2Moa19zaXplLCBrX3Np
emUpIGJ5IA0KbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShrX3NpemUsIGtfc2l6ZSwgMCwgTUVN
QkxPQ0tfQUxMT0NfQU5ZV0hFUkUp
