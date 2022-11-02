Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF47616406
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 14:47:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2SqT5Cswz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jn7pLyoq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.88; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jn7pLyoq;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90088.outbound.protection.outlook.com [40.107.9.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2SpR1bGTz3c7G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 00:46:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQIN6RCa403gaQoGM9XWNctq9VmOStoNm85ImWFpQ/PIln4lwM5xH9kijeGb5mrxKzSfyCddpNiPp8FTErwO46xbiL+bnVMlUI2ceJ7D4bh+74RCLo5DMOMGa2wWpY4iZMXwkRvB5OfhfYLnkndQgHgipMA/FsMIJhLC69kSuos/7oDNJSkD5VWt6DPg+xov470taIzeZtKd0Dww/sCyrNThwDZ7gdNxyw68T1cGyZ7KVu4gDJA9yAs+G46a6Mh53QtD62GhiJdIQMSla0FjJ8gCr1MG2793pCoTWfSrdxy+KU1O+baX8vBLVsuS8oL/uGxZZZG+ZFZBjgUMx1/q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8Y5ongKGeeFoMj+3XSFoNZzv+sxMA1pxlSVXSVmPmE=;
 b=G8NJ2PdOK6nrMJP46iyg2+9Mrvgn4nqnYkcSAgJqWnfwFxScI1a4JFFsyXHpq7JOgftVsP5WuQwMDInOjwCBPgNvuXLmN8jEc2NdzQxYz2nGnqlboQCU6oM2o8GohtPMY4NVZgOt2Sij4yAE1DVTYYcSx9aqSVQD9+0VGHhxJgC+JA7AK3MyATC0yMWmTy0AWuHJkAgl+aAbR25O94KLLG9dSUsPrhGdFJy1mEmQROQOsduDICkFO4o36tUpGUPMMt4DUzW/JZDmK1My01z/E3pj109j8U4qxZ3WhNXacY+jdyy44K+zRKSnP0abnawE9nfnEUapOx9AAeBVsW+XnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8Y5ongKGeeFoMj+3XSFoNZzv+sxMA1pxlSVXSVmPmE=;
 b=Jn7pLyoqN0LqdzROc0TVblTcd0ALxJy9v+PQbblWpJst62qTcri6cg0l6eCJR8mUSqCaTsKgw50eJrTa+k77iuZFs2dkZd3FmYfc8OxPLkK2OolmURxa2tSDN1jWEgHXHK/LK/MY3JV2dA5/tvGSAg4uaUtVnxku+Ux09pslFmHqo85QKGCACOtIxxPe7CjVPkcZQAZCF5mY5SHM5eXL6WCs3f6fRAAEDMHn6ZrS0QzhgsvboWb07oMqTbPnKGpZSGMyVpYG3zrXUawH4srfEr26CSvFQMiWTYrBraJUF+pGLCFfWwWDAAFG6JlbFk005OXpzw8RHfNzhtoe1YoDOQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3413.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 13:45:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 13:45:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yang Yingliang <yangyingliang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc/fsl_rio: add missing of_node_put() in
 fsl_rio_setup()
Thread-Topic: [PATCH v2] powerpc/fsl_rio: add missing of_node_put() in
 fsl_rio_setup()
Thread-Index: AQHY65HClVxTgrv9bEuhF5O4+MzCYq4rq6kA
Date: Wed, 2 Nov 2022 13:45:44 +0000
Message-ID: <158f0d2c-9c05-7b38-693c-428bc7e77acf@csgroup.eu>
References: <20221029122600.1514280-1-yangyingliang@huawei.com>
In-Reply-To: <20221029122600.1514280-1-yangyingliang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3413:EE_
x-ms-office365-filtering-correlation-id: b52aa4fc-0aa7-49ec-1565-08dabcd88a07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DYx6dDEJJLRMMXbRo5FUbpu3CHHd1JeYiiHkstWpWaxPJed/Wdeprzm8yLh61LupshZ1d7WKO0AQKFMp12a/7E65RERmbYhmRM3pYXy1vJGQPji4MrsVJS+u6YLfE27LvlPZsIVPwSJE0vZ9YK7n/y8nK1wBi1DG5/OAZrQIGP4N02pP+L9KS+IcVpce9k5gACw36lwrmxAzvPnE7QM9Sk657kVKmogKfrDv5KGe0NUjbdd6GAfg7S6lngrspEy7JJ0ruIeMZhgNB9l3//3Xbvchlr2xM0ahJ1eEfq9gLE2GbKh8oNl9r4un6C4c/r0a/lKCDbNP180IzTUJZ2t7jRB9c5y1TdPOL5ACCbbhbficAJe6Vy99emb+Lqhgb7YntiemBanxTFpTOuty+RXfHW/Ewf8CUAgwOZWJWh92BrSP8YzqIoHQCnt5OL8XWtUg2xWY7j1o00h8WJrArneZzN0F3W02FmTF9D0q3OItYpHBtPFPFZGDyG1G6+gblbxg7XXXvXQtXA20FOf2zk+4C5axSo48uffVJ7PVYtz4uC4AugFFh56IMqeKdJrTEhqEFbLbOLklJGufwcJsy4BkppbKaEHhL4hmJv6G876DX3w6eVbtTqzRpcMbM6DcrQN1QOtMxRH75ZZZMVL0foMWeJsRxz2eMQc9XsezWg3fJ7Q35ZhqwO/yJyCRCL2ATwYaFrJ/VNJBQrEBr6QjLwFrvV5Xx8pYTJ50P2eBjWeZI8jIbppc43/AMSwT9PjyDyhE5/BxI9/3gTrMXXP8xrx7tUfqKtIlM+0Ej/mvmjMrVg9/jXqUEFKLDKwfKRURsXm14xW/SA/eucuvgeRNQdnUwK1MfrtXRgz4Pad/ifmAArY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(451199015)(31686004)(83380400001)(91956017)(64756008)(122000001)(6486002)(966005)(71200400001)(2906002)(38070700005)(36756003)(31696002)(44832011)(86362001)(38100700002)(2616005)(76116006)(6512007)(26005)(186003)(8936002)(316002)(66946007)(478600001)(54906003)(66556008)(66476007)(66446008)(6506007)(8676002)(41300700001)(4326008)(110136005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHVoTE9FU3NRc2VQd0R3OUR6UndJNC9DQXo0SkhJbTVCSFVObmo4TnRPZkNV?=
 =?utf-8?B?NmtKeldPc25peVRzTXRJV3d4aE1Qb2w1aGNTaTVtRU5rbWdVVzlJVUJtWWZj?=
 =?utf-8?B?cEVHVnlmUnVTRFBrMHFsYmZ2cUR5TUt5M0wzbHd3bzRoMjlIdUhMTk9VS3R4?=
 =?utf-8?B?TVZjNEVrSFpkVjZob1N4dEdVZExJVmhxeDBOQitjaDgwTGhHN1N3UWFyZWhC?=
 =?utf-8?B?cHI3dVBJcTYxRzZwNTVQQlYwTlJkbE45Y2FFWlBCNHBFUHRLREl6U1l3QWhH?=
 =?utf-8?B?NDg1bmx6TDlBUWpQWWNvYVFqODhZR3djM2F3bFhRaUszU0FkczhGNzdJSjdj?=
 =?utf-8?B?Y3o1L3ZBUmdiS1NhSUZJdHd5Z1ZWN0lvajBzRFdjYVVQemxoNmdld0xVbjYx?=
 =?utf-8?B?Uys0NlJLcTlmanhJSUJIMEJsVFdEakR6VVd5bDNrUll3djlNYTJxeXFqZ2o4?=
 =?utf-8?B?R3h2a2RMVXJwNGtUOW45L3g1Z2FodU1pODZJcmFjYkFuMzdvVmt4dGtHekRO?=
 =?utf-8?B?WFY3WDZ1NTNTY25VaW5LWVdVWlpGRWZla3FQeFRRZGdBVkFaNUphV0NqRi94?=
 =?utf-8?B?OHhLQklWSXMwbVE4aXJHd1hSMkdmT0daTGJucmcxbmthTU43eHUrbTQrTzVZ?=
 =?utf-8?B?bWRjTEJ3YWVPemZVQytwblVDbWhHMWN4SVdtZlQzNDVZQVYrVlEvWGVIdkpU?=
 =?utf-8?B?YlVzMjFmV21BMlVjYzFVK2hQUGJLWm5Zc2ZXNGY3QVVZOWVwdEx4bEdrNDNm?=
 =?utf-8?B?bm9nVk1ndFVoQ0NsaGlFTmpURDB1NU9pSGJ3dVJpR3pCZktCNmJuNVNudVFG?=
 =?utf-8?B?NWgwT3o3UFE1YUVCcmtwN0pobjNRS1AvWXZ6VVFNRjZhdGxzcThwSlVVaDhJ?=
 =?utf-8?B?MnVsL1dpaDFOVnJWMnBoUjFvZlVsYkFGanFlNHlJSjgwb0s1UlFRNzNYcVVt?=
 =?utf-8?B?a1B3bU9IU2VkSFZPeFNCbTJ3WmVMM1dUTWhzalRvbC9HNDhVaWQxSmRReDRZ?=
 =?utf-8?B?RG8xZmdzUHF2UkJTdi9vakVHRDJjdGs0VFEzZ21hd3FEclZsTE9YODZFeHVZ?=
 =?utf-8?B?c2p5UDBON1k5dXpXUjRQSU0vUXZPRklPaVY2VllLaFVjV1RqVCtVQmVKWTJD?=
 =?utf-8?B?c2tiNk1ZdUFmQzh3NGFFelF6Sm4xckxEWFdETEJqZjB5bHQzWEJIZXdsY3RS?=
 =?utf-8?B?bktiZ2ZGdUdPNU5Rano4a0cyUHlWU2ZlWSt4Y3BCMER4MW9UMDRBR2lvZCtl?=
 =?utf-8?B?THQ4eWcwWTNpMFdIaCttY2xzUjlCV0RlZDVXSlFVdGhZdzVVUWFEYTB1TVdE?=
 =?utf-8?B?WmdYMTh2OEhRYUFYTWxtbEFPRFJYZ3BzK1NTQ0lpTFNpTGxleDBuTDhaRS9T?=
 =?utf-8?B?bFkveFhhU3ZlQ0pnQVJ2M0plakY0VHh1K2VuZVF1YldyampSRUxIQXdFOXlB?=
 =?utf-8?B?Y0kwQVBNTzdnSjFYTTY2ZUx0RG5HNkxNMlBUYjErTkovNG4vcDlSbjUzV3Qx?=
 =?utf-8?B?dlJxeG10MVhrNWcrNisvK3B4Ynd6OXBwdWRGSHY3a0VBQ3hJU09CQk9ia3BT?=
 =?utf-8?B?RStVZUdFQzJIWnlZNENMTGFQMWJMSmd4WTZjVTRYNjJxQkZXUmhQaExaZTdz?=
 =?utf-8?B?ZjdFYTF0QXM1eGNFc3hvN0t4UGJnN1VqZXBUYTlWS3gzYUg4RGdtaitieXNM?=
 =?utf-8?B?dWp3eFBDYUJQclJ3eUdKMjlKbldaSS93b0dtdmxHcnRIL05uY1JUa3N5aFFQ?=
 =?utf-8?B?b0Rac2hEU1gybkpCcmRGdHVOSEpHNVhqWWN5Vk4yYmtlVmxYWnpLYnY1VzlT?=
 =?utf-8?B?Mm1IQWNOd1A5am1XWDl6SnNxNUJ5OWF6cnVtQzJBcDZEd0d3S1VIdDlIaGJV?=
 =?utf-8?B?SWxQTXBVOHZHSnFFMldwOTB2cGdxTzBQMFNpRldVYWM4NExKWVhOdVU3dnNy?=
 =?utf-8?B?QU4rQnFySERJcUtZRGI3L3pxdTVXME5SWlVlNnRrT3JpQ1RPYWxpL3k1MDYx?=
 =?utf-8?B?QU9CdG56VUFVSFYycUtxNVFDWDN1VkpZWkJZdlozcW9BbXVYcHFaQUZ0d2VM?=
 =?utf-8?B?WkZkRHZxVnpYcE1uTHk2dU9xV0JUZXJUZEdTTldqMkRpbmlodlR4TDRZN3cy?=
 =?utf-8?B?UStETDJMMy9yS1RRRk4rLzk4eDdmSmR3RFdJTE5sblZUQXE3aWJ0SnFReVpM?=
 =?utf-8?Q?2jATBit79Pzkzo7KntpV/go=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B4DC1430CF785469251B37403409F8E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b52aa4fc-0aa7-49ec-1565-08dabcd88a07
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 13:45:44.0712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQDQlAxv5bQCU3vLdDc/E7W3I0Q20E/+JM3C7QqzZ6OJFpiKCcKH8UjU4/3ABHc4j4gkDK8OKlrqstFzD5H+6SYzSzlg4lldKtQ5I6AUWt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3413
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
Cc: "b24347@freescale.com" <b24347@freescale.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "alexandre.bounine@idt.com" <alexandre.bounine@idt.com>, "Gang.Liu@freescale.com" <Gang.Liu@freescale.com>, "alak@kernel.crashing.org" <alak@kernel.crashing.org>, "leoli@freescale.com" <leoli@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzEwLzIwMjIgw6AgMTQ6MjYsIFlhbmcgWWluZ2xpYW5nIGEgw6ljcml0wqA6DQo+
IFRoZSBvZiBub2RlIHJldHVybmVkIGJ5IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKCkgb3IgZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZSgpDQo+IHdpdGggcmVmY291bnQgZGVjcmVtZW50ZWQsIG9mX25v
ZGVfcHV0KCkgbmVlZCBiZSBjYWxsZWQgYWZ0ZXIgdXNpbmcgaXQgdG8gYXZvaWQNCj4gcmVmY291
bnQgbGVhay4NCg0KSXMgdGhhdCBuZWNlc3NhcnkgdG8gZG8gb2Zfbm9kZV9wdXQoKSBzbyBvZnRl
biA/IENhbid0IGl0IGJlIGRvbmUgDQpleGNsdXNpdmVseSBvbiB0aGUgZXJyb3IgZXhpdCBwYXRo
ID8NCg0KPiANCj4gRml4ZXM6IGFiYzNhZWFlM2FhYSAoImZzbC1yaW86IEFkZCB0d28gcG9ydHMg
YW5kIHJhcGlkaW8gbWVzc2FnZSB1bml0cyBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogWWFu
ZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4NCj4gLS0tDQo+IHYxIC0+IHYy
Og0KPiAgICBBZGQgZml4IHRhZy4NCj4gdjEgcGF0Y2ggbGluazoNCj4gICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIyMDYxNTAzMjEzNy4xODc4MjE5LTEteWFuZ3lpbmdsaWFuZ0Bo
dWF3ZWkuY29tLw0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9yaW8uYyB8IDYg
KysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX3Jpby5jIGIvYXJjaC9wb3dlcnBjL3N5c2Rl
di9mc2xfcmlvLmMNCj4gaW5kZXggYzhmMDQ0ZDYyZmUyLi4xYjBiZTQ5MzFmMTggMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX3Jpby5jDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9zeXNkZXYvZnNsX3Jpby5jDQo+IEBAIC01NTMsNiArNTUzLDcgQEAgaW50IGZzbF9yaW9fc2V0
dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiAgIAkJcmMgPSAtRU5PTUVNOw0KPiAg
IAkJZ290byBlcnJfcHc7DQo+ICAgCX0NCj4gKwlvZl9ub2RlX3B1dChucCk7DQo+ICAgCXJhbmdl
X3N0YXJ0ID0gb2ZfcmVhZF9udW1iZXIoZHRfcmFuZ2UsIGF3KTsNCj4gICAJZGJlbGwtPmRiZWxs
X3JlZ3MgPSAoc3RydWN0IHJpb19kYmVsbF9yZWdzICopKHJtdV9yZWdzX3dpbiArDQo+ICAgCQkJ
CSh1MzIpcmFuZ2Vfc3RhcnQpOw0KPiBAQCAtNTgxLDYgKzU4Miw3IEBAIGludCBmc2xfcmlvX3Nl
dHVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikNCj4gICAJCXJjID0gLUVOT01FTTsNCj4g
ICAJCWdvdG8gZXJyOw0KPiAgIAl9DQo+ICsJb2Zfbm9kZV9wdXQobnApOw0KPiAgIAlyYW5nZV9z
dGFydCA9IG9mX3JlYWRfbnVtYmVyKGR0X3JhbmdlLCBhdyk7DQo+ICAgCXB3LT5wd19yZWdzID0g
KHN0cnVjdCByaW9fcHdfcmVncyAqKShybXVfcmVnc193aW4gKyAodTMyKXJhbmdlX3N0YXJ0KTsN
Cj4gICANCj4gQEAgLTU5MCw2ICs1OTIsNyBAQCBpbnQgZnNsX3Jpb19zZXR1cChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgCQlpZiAoIXBvcnRfaW5kZXgpIHsNCj4gICAJCQlkZXZf
ZXJyKCZkZXYtPmRldiwgIkNhbid0IGdldCAlcE9GIHByb3BlcnR5ICdjZWxsLWluZGV4J1xuIiwN
Cj4gICAJCQkJCW5wKTsNCj4gKwkJCW9mX25vZGVfcHV0KG5wKTsNCj4gICAJCQljb250aW51ZTsN
Cj4gICAJCX0NCj4gICANCj4gQEAgLTU5Nyw2ICs2MDAsNyBAQCBpbnQgZnNsX3Jpb19zZXR1cChz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgCQlpZiAoIWR0X3JhbmdlKSB7DQo+ICAg
CQkJZGV2X2VycigmZGV2LT5kZXYsICJDYW4ndCBnZXQgJXBPRiBwcm9wZXJ0eSAncmFuZ2VzJ1xu
IiwNCj4gICAJCQkJCW5wKTsNCj4gKwkJCW9mX25vZGVfcHV0KG5wKTsNCj4gICAJCQljb250aW51
ZTsNCj4gICAJCX0NCj4gICANCj4gQEAgLTYxOSw2ICs2MjMsNyBAQCBpbnQgZnNsX3Jpb19zZXR1
cChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgDQo+ICAgCQlkZXZfaW5mbygmZGV2
LT5kZXYsICIlcE9GOiBMQVcgc3RhcnQgMHglMDE2bGx4LCBzaXplIDB4JTAxNmxseC5cbiIsDQo+
ICAgCQkJCW5wLCByYW5nZV9zdGFydCwgcmFuZ2Vfc2l6ZSk7DQo+ICsJCW9mX25vZGVfcHV0KG5w
KTsNCj4gICANCj4gICAJCXBvcnQgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgcmlvX21wb3J0KSwg
R0ZQX0tFUk5FTCk7DQo+ICAgCQlpZiAoIXBvcnQpDQo+IEBAIC03NjMsNiArNzY4LDcgQEAgaW50
IGZzbF9yaW9fc2V0dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiAgIGVycl9kYmVs
bDoNCj4gICAJaW91bm1hcChybXVfcmVnc193aW4pOw0KPiAgIAlybXVfcmVnc193aW4gPSBOVUxM
Ow0KPiArCW9mX25vZGVfcHV0KG5wKTsNCj4gICBlcnJfcm11Og0KPiAgIAlrZnJlZShvcHMpOw0K
PiAgIGVycl9vcHM6
