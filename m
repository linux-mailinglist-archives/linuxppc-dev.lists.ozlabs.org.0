Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C184863BC74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:03:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLxFx4bxFz3Wtr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:03:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=d2al1rtt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=d2al1rtt;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLxF01xDRz30Qq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:02:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQPAmz823tacoHCcjzwJCcKb2pxh/jyDhalB6gZH55U2TQHyDY42cWWSEL3dvaWsGx5hcOaI+zBeDE9D5VMhdBGkGHTgMZNf7P9Kaqed6XfkoYC5J1LOLtv0OzGgFOdE0UIGqjfdUaPDnPwgq+cIuwZbI2Pb1dqRIRIH2PNBJH3RjGE+pBp1tM2/TErdCAlEd08WXBvVY6KoZ9Atdjr4WUSi6QMArVI1rWmkgj+tP7JR1qRWRCdjCFdO58ifkBR39isGLdFn4U8S4DxfG2Y8p0Nqu8xjFfvtYLL8H6LXfx4U8KkQBIExeT+EVDEEB5o+lmmW+PJR0YCn1uE+LcaLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+l97cqgPYt4LUgjdr+SIHnmrHa0LzdFXI1cQIVyGVw=;
 b=SmkwoO/hq0VY1shF9w+crKJ1gROZHqMpsLfwZwGwdGdPEtN8vMjEXhOY7cojzbbZlajYcw3g7PaEyW0cs2TCHkISSlzIC33fbQV8wz9iEKndE3QQxx313AWupP7n69lPPVVpI9Y70jmM/5hz69ugoXVFDGQTl1A1hy0Y37uPQ3vxBQcAkK5cp5aPRe0aaKZahmt/5B1JFpJKDfV9VOjDuzdUQi2meDAFCB0LojOq0dRNDprvJJnf3trGDLP8+t+JKuD44HdNvVtwoXEFg0u2UpasDnqkaFNHWqzvYw2bqdLXgoL40n3Ob2lIxPMi64OqHsJFBJVXz6oiEfQBnPaDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+l97cqgPYt4LUgjdr+SIHnmrHa0LzdFXI1cQIVyGVw=;
 b=d2al1rttJ8D0McsxPJ9rWDsFdR46gKEbn9gNZZJT4N72oDdNm1cN3rzJ6/7M2CgivzYM5Gmss724EtVHNN1amGB/1xbSQGoPUdPg9vdUqDnuVvWx4aSH6S3Ola6/5UyksZwC6khFcnIiRUfTloT7/1K/KSwc945A32t12KmCqVPb/gKBwUaEC2W2sa21urSOpLnDpJhqlBD+ITRGp0LB/Bn9YrHrkJpl6VBfijGJBoYBehAm3qja0w03Bn3hzyQ35yxDPi99eOl3Lw0TbcFpD/4X0OwMKUc9CGBFr+VJDyuurTTOeZ0VN4Yepjt+d/5+up2WWsnZ9noG/osNKZ+Kvw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 09:02:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 09:02:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] driver core: fix up some missing class.devnode()
 conversions.
Thread-Topic: [PATCH] driver core: fix up some missing class.devnode()
 conversions.
Thread-Index: AQHZA0/Z+sN/TmHaCEK8/6gw90dH9a5Vcj2AgAAgBACAAAmrAA==
Date: Tue, 29 Nov 2022 09:02:15 +0000
Message-ID: <e9251907-3aaf-2038-0d77-deeee5ae4102@csgroup.eu>
References: <20221128173539.3112234-1-gregkh@linuxfoundation.org>
 <9da4f875-7fb3-803f-379e-0352eb824d8f@csgroup.eu>
 <Y4XCelSURHMMK61T@kroah.com>
In-Reply-To: <Y4XCelSURHMMK61T@kroah.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2118:EE_
x-ms-office365-filtering-correlation-id: 3471dba9-12de-4e0d-fb58-08dad1e8691c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WZGWCkFbCViBK1uY7UzR4fdgLxQelfXC4ZQJ5IlKKDKHrvWXpyLfnD1QYBquOPu9qP7GT5KTHKgvZB/Cll3OVFpRX1LD+9P0SnsPANkWZd9vrXJ4cHdEecUXDmajMftexEN20Dllzo0rsoKv2vs6e/WfyztkAaBC65Up45YPlY8k2oJHGem1lxVAoYnAfFvFEY/cdKWn2EHaW40+Mlhq3T5QMAjevyQ/UYdgX7/6O1B1JOdWUuoplbZxDg/ecENJrCorj5Hh75Sw1LaOxJfaI6IJLqSFZXhfZrORM45azoSU9vLkneGx8Vtlcsd8TqbjGbGJKqDoQoXvfgNdkicEKjHZFX22hjp/kAzq8XOe+XPdlN35tQoA87hWKfeuJDMFUb2+S66v58LYtV02wBhuY79jTKwp2S/ZLTPkwYnDtHNFyf6TaHV3RDMn3wBZeuUE22i+6TgbNtILRNxrHAm23qvUYMQ7jxh/x//AMKpq9wbKqilpxqn0B0me6XGk5qG0qxzPOOBkbk5QAxHgNkmHQklt5NA0wnUqyFcRaXfdbu74+/sHOltaVnUKA+VpKzLU2aztJgG8t2/aFNNtFY+zZRpsIL0AxC7wmtcZS42VmrMHQkuLBXi0XD+4CsA4kK/N+QxBFx9IQbnRCfdzQvF5nGijsqSvNN6hhNmLTHVB5+1suPupgN5zx+RdXgDv00bnx9y3gZk3F3jy25m6ESr/j31oveLkuD8tuecu9/o6rSMPFn8/TynxmHW0nTI+GP97pfoxnNbcbCoeGNSWSRf5DYAzJ6n8yjAMOpxcQvb8Zic=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39850400004)(366004)(136003)(451199015)(66574015)(5660300002)(44832011)(8936002)(316002)(6916009)(54906003)(6512007)(26005)(2616005)(41300700001)(186003)(66946007)(76116006)(66556008)(36756003)(66446008)(4326008)(64756008)(91956017)(8676002)(66476007)(122000001)(38070700005)(38100700002)(2906002)(31696002)(86362001)(6506007)(478600001)(6486002)(966005)(83380400001)(71200400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YTVVdnUvWG9CS01GbEZUTi9nQUJ0Y0ZicUdDb3hBLytjOFB1ZXY5aFUrZStU?=
 =?utf-8?B?b3VibzV6V3BHZVVKWDJpTGcvUmZSaVNpeURNbm8rcW1ZR2Ixek1nZ1YyV3dI?=
 =?utf-8?B?T1BNU0RPc2ZYaGZZWkxvUGhZc2pIMitJbnUwL29zbzNsR0J4d1dBeVA5SUxy?=
 =?utf-8?B?VGVndVRDTzNkNVcrb0Z1MithNHV3aVN4REEzMmdtVEl5WElPdmYzWlhLc1Qv?=
 =?utf-8?B?clh3Ymt3ZWJxNUZuYXU2WjRZSURoWmc0b2QrTHBHdVZUL2tSVFVXZGliN2VL?=
 =?utf-8?B?bU9RV1gyV2o0NGJRdU15Nm53NzlvVUtlVFdlK20yK0REcEErVUUyVHBTalk3?=
 =?utf-8?B?UXduM1dpWmIxaFFzemFKQjVZaTAvRHVYNWRrU2lyQTJEekdhUWtMbFR4cXUw?=
 =?utf-8?B?cFZaWllvcWlvUmRtdjhHTUd1cEk1RVIzaUV6SEp6c1gvY3ZkOENKb0hiRzNl?=
 =?utf-8?B?ZkR1ZkJwa29XdTBoYi8zNUc2RlhkZHA4dVhrZ2RSakw5N1oyRWRUanpna05h?=
 =?utf-8?B?aXl0UytXUjJldjJIM3Vjai9wMHRXYVdQdTM5citha0M2SWtwY1lSK0FDOEp4?=
 =?utf-8?B?aStNMEdYeXh3NlNUK0VmUlRwMHczaFc4S1FKa2NvYnM5TVZ4Y1ladDFIYThO?=
 =?utf-8?B?RjlGRDNmNjRTcklGRGU1eGdIeDF2c2dsZFJBWm9zRDVJNzE1L3VWdHNsVVVB?=
 =?utf-8?B?QmVSVExhU0JvZWVOQi9lS3B0WU9nQkg2ei94WFNpcjVobWtkUnpYblN4RDZX?=
 =?utf-8?B?V1BXT0ptckRPZTcyWHR0S2JBNGtJQ0Z5dUZJY2lwVVRCTGNLNG8rdUdpbVF3?=
 =?utf-8?B?Q05SMG5YS2YrS3RxUnRZQ3lFTmZ3VTZ2RXovVC9mL0NWV2tqQnZ4MCtNc04z?=
 =?utf-8?B?R1I5YlRZd1k2Z1JISnh1Qi9JeEFvR3FxczgrM0IzZ2pWRS9yS1RWdExPellI?=
 =?utf-8?B?VGdieGdOK0V6VWFGd2xUR000eHhFMllHKzhnUE5TM0M4M0l6aDlvYnY5Y2ow?=
 =?utf-8?B?VGt4akFwSDFuelRvbFVZWHBTV1Z2bmk3cXRweUt0ZnhPWDhGVjc4WS9TeklH?=
 =?utf-8?B?aW44SDlQRzBjS05SbUFYejBrMW1ETGZ4NDBtYU9mOFo0N052ZkI5dWdtcUR5?=
 =?utf-8?B?Sk1jTjhBeGsvVzVYOVVNamJncXNHSWtWc0YyRVBzRzFNWnM4c0NBYnVWYWdJ?=
 =?utf-8?B?RmpFRDVWYngwZmF0MVdGMDhrRHpqOU4xYjlqa2ZsVWtaQzQvZjV0RSt1QWl3?=
 =?utf-8?B?a0RzN1J5WHpsalVGNjU4K1MzUGJSRFh3MWhHb01kcGtXa1VLaGZHTlUzeUpt?=
 =?utf-8?B?N002OXp4MVdaRmJsWUVrdUxwRGtNSDY4dGZxZjVRd1kwUEpBSjdzelZHTlhU?=
 =?utf-8?B?V3RlRlpLT25kdHV1eGZOaWNoeVRoWVUyN2RjR0JpYU1NdWpNT3JzWjVUL1py?=
 =?utf-8?B?OG8wRWhwUlVBMERWY0p0ckM5aHJmN01FRnlrSnpoeHJtc1RsVXVObDNOM3Jp?=
 =?utf-8?B?T20vNzAySWUzNUp2VzRsY1pYOTNjYStZblV2b3oxWEc3K2V5K2RWYVdQU0dq?=
 =?utf-8?B?dVhyYUFCYlQzZ0tkMmxGQWFGYWx2TlJCQzNGTHM5NVR2Z2paaVl2ZWJXSjJ6?=
 =?utf-8?B?M0V6aS9qbER6NHpueElKNXNoVVNMK05sYkRiQXlEVHBMbkVGWVd2cjE2MHEr?=
 =?utf-8?B?bUxZZWNDWWh4T0VjTnFTY1N0TzBqZjE5YjNKQlBvNTdUbU04UTJUR1hZNlJx?=
 =?utf-8?B?OVd4aWZ0b25CZGRxRUh6Ulk4V3F0OXpZRk9LaFRucXNxUjFnWEQ3a2tLend0?=
 =?utf-8?B?UmUvQzJ1TXJpVzkzQS84OVo3MnMra21pV05LZDZGenBkT2NXakZwbE5vN1Fv?=
 =?utf-8?B?bkx6VWVhL29mTXFBeEVKeUlHM3UxcGdMaDRTVkg2a0hCRWI1VlJIdnQwVnlr?=
 =?utf-8?B?OElzaGZQTHVrYmoxL3hiQkpOMTV6VWJZa2lJMTdURm1zWjNNem0xYkwrTlhN?=
 =?utf-8?B?OExuMWZmeXdtWnlWNWV3UkZUVm1oZU1nb3FIVS9vUTdPVUJuYVp3dk9wSW5W?=
 =?utf-8?B?eUpCRzRrWXZLT0VwMkx6dVZER1VxZmpMclNPNlhyUndLZ3UzKys4c0hJUkZ1?=
 =?utf-8?B?VjUvb0ZQVjFnZWxHWHdCWXJZdnA4bzhTRlZHNG9iN2p0U29NT3dETTVjQ1NN?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A848B6ECC46F44AA790A88C02534D88@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3471dba9-12de-4e0d-fb58-08dad1e8691c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 09:02:15.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pal3Mx2yWEO1hi8zbcMuLa04NzOdUYaHsd/KPm/lO8ITag7EWVDHf7PHfrvhgP7d9LIYkXQI/vrtN/vm7EVqhHEvsS9lFF74duARiX6Bkyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2118
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzExLzIwMjIgw6AgMDk6MjcsIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKg
Og0KPiBPbiBUdWUsIE5vdiAyOSwgMjAyMiBhdCAwNjozMzowNEFNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAyOC8xMS8yMDIyIMOgIDE4OjM1LCBHcmVnIEty
b2FoLUhhcnRtYW4gYSDDqWNyaXTCoDoNCj4+PiBJbiBjb21taXQgZmY2MmI4ZTY1ODhmICgiZHJp
dmVyIGNvcmU6IG1ha2Ugc3RydWN0IGNsYXNzLmRldm5vZGUoKSB0YWtlIGENCj4+PiBjb25zdCAq
IikgdGhlIC0+ZGV2bm9kZSBjYWxsYmFjayBjaGFuZ2VkIHRoZSBwb2ludGVyIHRvIGJlIGNvbnN0
LCBidXQgYQ0KPj4+IGZldyBpbnN0YW5jZXMgb2YgUG93ZXJQQyBkcml2ZXJzIHdlcmUgbm90IGNh
dWdodCBmb3Igc29tZSByZWFzb24uDQo+Pj4NCj4+PiBGaXggdGhpcyB1cCBieSBjaGFuZ2luZyB0
aGUgcG9pbnRlcnMgdG8gYmUgY29uc3QuDQo+Pg0KPj4gQnVpbGQgZmFpbHM6DQo+Pg0KPj4gL2xp
bnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvYm9vazNzL3Zhcy1hcGkuYzogSW4gZnVuY3Rpb24N
Cj4+ICd2YXNfcmVnaXN0ZXJfY29wcm9jX2FwaSc6DQo+PiAvbGludXgvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9ib29rM3MvdmFzLWFwaS5jOjU5MDozMTogZXJyb3I6IGFzc2lnbm1lbnQNCj4+IGZy
b20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10NCj4+ICAgICBjb3Byb2NfZGV2aWNlLmNsYXNzLT5kZXZub2RlID0gY29wcm9jX2Rl
dm5vZGU7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+PiBjYzE6IGFs
bCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiANCj4gV2hhdCBkaWQgeW91IGJ1
aWxkIHRoaXMgYWdhaW5zdD8gIEl0IGhhcyB0byBiZSBiZSBhZ2FpbnN0IG15DQo+IGRyaXZlci1j
b3JlLW5leHQgdHJlZSBhcyB0aGF0IGlzIHdoZXJlIHRoZSBGaXhlczogY29tbWl0IGlzLg0KPiAN
Cg0KRmFpbHVyZSB3YXMgcmVwb3J0ZWQgYnkgcG93ZXJwYyBwYXRjaHdvcmsgOiANCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjExMjgx
NzM1MzkuMzExMjIzNC0xLWdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnLw0K
