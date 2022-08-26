Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF775A2168
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 09:04:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDW5p1Mt7z3c1G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 17:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=6xRF7M5/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.53; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=6xRF7M5/;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120053.outbound.protection.outlook.com [40.107.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDW511JS3z30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 17:03:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6LvFVuW1LNW39y6jRuMbH+AQz8j5VtCrGDAvcDvcCKYYGLOUhwLSu8p3F5KNRVDySWvVOCU3o8R0nFc0ie1m0241P0aG75XjJ0PNJf1zvHCjomjNTatBvcHYJGVSaGmg4g2L816CX8g1xg3pVXqRXaiR13Wew+exJIqPg4R2v8w8VXX80Nt4+3gXWvQDIm3atsUaPJhOlcqS4K7ScfM6jO7ad7Z8MUlkH3jQvRlmZVN5RpzUZ+AmoJ/2bj/TI68pTQU+mAX/m9wVT9Q91sVkBhJ/OTzopi+/KLok7Zkg5FuqkHN2jhriGTkArn0b/S3aOG+RMiuTxk95tCTmZBoMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdQqLlIq2LjtFxggMAbI9sC6dMAddso2FYfM9Vwsii0=;
 b=KBe3YNlJVEG2+GMfIhancJv76aSqPSk14ZJ9gZdGrwinkj/NXad7GBRWcGDmiqA0OVbuLiDUSK76Emd2L8PHuRD8C4+NjFt8NZmJURoTxIWUwUxsQ0gWey/K3ays64qVjKy07B8lryCtgF/zalU6+5ZKQHaf9C2TFNnaCTSPt9Kr8u6c7qcZBtDA7bEOFJesSEt+87PFkY255mZ+KmBkmI+tK7KQ3KzAxI8p1LeJiGu96YjclzXNThz8pfWtpAp4iXh73a6VVz2jOXaSoKWeXsr17eUBxi1Rvzy551PYoDzNDe4+gwrfcPhAL3xol4xSq0oyRjWiHFi2v2byqs+90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdQqLlIq2LjtFxggMAbI9sC6dMAddso2FYfM9Vwsii0=;
 b=6xRF7M5/4kbjGjdt76/2xHYWjqoK1cdbDXUkbl943M/rdjsQSP8U4tNI9+AJyD5/vSSDwDaALNkU0QOxZfqdjzi9OKewjUy972y2u5qaRoGoblKHzc0pCwEGppDwvmF68pFuIG+56nXkq4qAmcCu2BPdn7SHmbaN+z7tHkQgGG7hnZ7ZHzNeB5uYwFA92D2AIjxsp1iLorSZt+mGPNAmS54bytuRj/6kivJRIpzdtxsbY+r6dXKD4rji0mUE29hOjU/Obsa4QmS9MGOHcdv7AQysfOaH3dwVGrEMWxJHthC+JCorMYH/hXwJ8w8/ygZRpDl8pVY/4UoGvjD1GCBpJA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 07:02:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 07:02:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Topic: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Index: AQHYuG3gJRoiq14gKku11kRUFzyUCa2/6mQAgADYdwA=
Date: Fri, 26 Aug 2022 07:02:53 +0000
Message-ID: <807f6788-436f-33d5-0c60-cc9aa9b42a0c@csgroup.eu>
References: <20220624141412.72274-1-ubizjak@gmail.com>
 <1661422971.cqtahfm22j.naveen@linux.ibm.com>
 <20220825180806.GG25951@gate.crashing.org>
In-Reply-To: <20220825180806.GG25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0603c497-8257-4889-e088-08da8730ff6b
x-ms-traffictypediagnostic: PR1P264MB4182:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Uli4G+II1XFqoysbDlvuabyZME+SYp4LDg4Dcrm5UqCkRQWi4AWughLnHlvK0QXeD77ffuwytAO49nks501D0rO7POfhovtQObpZDuZu2p+z4bWkox8xkk1ynCR88+TNNO5ZeGgbkOZZDakNgdSyF1rMVwomuiUWyFyE/WtjbCf4N9aUaV5l5TPdXeCVked0JURKSqREMpY/K+BqvOTn0wPOrNHN2AIG/hTaDMBgfGv2Y8QN9pZKWROqixTNVBFkk7ZF0oWS+Xiafuvsj89PfXc1tfqBMUQvhKXytEeNgOY8fCsPEg7ZuFUmXVAcetQL41SmS7abXJldI28aNO1Q6vcAbPWhiHO7IafnnAf7OzeqJM6BkbyRAlfNLiIvZ2y+nLL4H8eIevYAf+4/pwBWwcMqrpT7HZOhifvsxXvwhyFdBoue1ZWzJlo3B2QMn56DHOQ6JnKxh3ur7VjPu8GRqX8sf9KmiJzKpE9tP+udfu7Yi/fw0gMnTmtqtyaD4Lk0a49yIrqo0KutKkgYqMXcFcDjzfsyIN8aKZgs5Pv4uO267AjdjWbzpkiBov3jXkAeNyC4hn2C9JYhA0US8Y/0eLqdsW7KEoz0ws8ZIZPpHjGEa0WlBc1nF6c71lEkyJ5xxJDC4etpkfvmlc7spVq9SlUREbSjHUe9syzBAL655bpMKNdEupC+Md4c+UffC130QjRQiO0WqXFYwwBd/iGnL7n4P0dxqTXVIqCJIX2WdzFwYoddM/+Vu9llYxKDEtWfUFyHEdLqihmTH3lcglYBvxTVcBXTGEZ3iUXWe6tjz1jv2zvFgzxEzL1vrIYaCk5bUeI8bZgWS9Flp3hYhx3aPAQQ5J+WN3L+Js8gom3RGrM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(86362001)(31696002)(38070700005)(122000001)(38100700002)(316002)(54906003)(110136005)(76116006)(2906002)(8936002)(44832011)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(66574015)(2616005)(186003)(478600001)(83380400001)(6486002)(966005)(71200400001)(6506007)(26005)(6512007)(41300700001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OHJUY0xZaU1tN3liWGl2c3JpNzMvaytGNWt2RjhlU2VTV3MvQlkrcmhxT21z?=
 =?utf-8?B?Y0xORFl1WGk5MkcxY2kzTVdDaHJGNkQyeUIzb3ZyY3RBa3dzNDFoSXZqNnNu?=
 =?utf-8?B?TTd5OWVENXlXR3JySExLZlVWRkRiSmlZUGk2YUFyQzh0Ym54L3JqNkYzSGN0?=
 =?utf-8?B?WVUyUmxIanVPbWsrQkIvNnFuZVZnUVdNRzVzT01vVDkrM2hQd0lxWjBURHNx?=
 =?utf-8?B?UXRNYlNONXV1TmpSMEFaN2xDOGFFb0NyWjNwSGJXTDV1M3pPMzU0QUw3T3BW?=
 =?utf-8?B?OHYwdHhzZTVZL2Rydm0vVUMwNXo2MXRvb0daWkNrUWJpZnUzOWxXclRjOWxh?=
 =?utf-8?B?bmptUmZ4Y1dLSmdzamJWckVLNDNaa0hGUEJhN0kvbm5hVHFNQkVWYjRlQVln?=
 =?utf-8?B?cjRnRHhKYmxjeU1EQXErUWJJWmFIazlJNHlWWnFPNHAzT0FUTXpUd3dVdWhq?=
 =?utf-8?B?RTdoSmlyS2gycm96clAyTEZFTm9OKzUvWHRYQ1ljdGtDTy8weUZPMms1Qjhr?=
 =?utf-8?B?N3V4b0FzUFdKYUFyT1RvUUVpdnJMQkxMaVNCRVlVUHFmcWJ4dExLbk91Mk9y?=
 =?utf-8?B?LzVwaG10L2cySm5XSkJsc254N1RwL1hGdk5mWkRMK1pBdW9IVFdWalRyYy9U?=
 =?utf-8?B?a294VVpEQXJDOU1KQnFhSVc4ekFob3VCVEJ2T1FpRnd0Vk9iMjErRE5oNmlP?=
 =?utf-8?B?RXNTaGdzcjBkTzhDRC9RcVpNVDNVdkdFbjdrVXIxWWNCUUIwVlJBektCT0Fw?=
 =?utf-8?B?Q2hRVEJoQjBuV2V0QUF0bHROcnkyU1dhYkhaUjVUK004T2F1QmptV0VWVGF1?=
 =?utf-8?B?ZVFNZ21CdzNVZTRmMHdhbHd2azdvUzlXeXgvTCtIZ09tcVk2ZEQrVDZ6OFpt?=
 =?utf-8?B?cjRjRit6NGd3a203aXlvZG9qZ3lwaUZnbGV1TFRZcEJqNHVINDdvRUdKdExB?=
 =?utf-8?B?L0gwREw3dzZ0VHBUZitJOUQ4NEZHdVE3RXRxcDJibWgxdmt2RnRUK3JnMHZR?=
 =?utf-8?B?aml4aTNweWhJZ1FQVzVMbmhGRkVONEdMMGl4amJHdTlWbkhjMlRud0d4YVRP?=
 =?utf-8?B?TVlFOGlmbmNVeDJPL1dWWjR5bHdUNWdSa1M4R0tGeCsvRUdYeEFEQlJRajFD?=
 =?utf-8?B?UXFtNjdyRzJoK1Zld3BMeVNZVEhuVjVnMEd6MHFOZGdIdERmRUFSdisxN2ZE?=
 =?utf-8?B?eEVyU3lKVytjMDZMbEp4eEo2QlZ5NXhiSlhOY2JjNW9ycFF3S0FSM3VRWWd5?=
 =?utf-8?B?T2ppNmJSbXYrVFFpcHdibEFkelRoeHdCcUFJcy8zMXB4RHJITWQxOHpRUXVB?=
 =?utf-8?B?cVZwY0xnWitGZWozS3lHWE1EMnJucDk2N2NOaGg3YU5tV3R5aDJZUFR5TWNp?=
 =?utf-8?B?THJYU1VnT3FNbE9IMlpNalgrcnJjcTUwVkIxTmZ5ZTZ1U2JxYjVvMGtEd05w?=
 =?utf-8?B?RkhabDRGM2ZqVGtWVkRkQlNjZDhrZEZVcjBOMjJIWlE1OWpSdjNnZlZUdk1y?=
 =?utf-8?B?SENIdmh2QXFXQ2I3dkhOaWhGRE5SL3lEZEJKN1IvY2hJeEQ4dU5WN3lnWFRJ?=
 =?utf-8?B?UzBBQ1YyZC9Ca21ZZVE1VldEaVRXVTJnWkx2ZWlZeGwzZDM0emhSSmxVL2Jo?=
 =?utf-8?B?VUE4alluWlpsVDh0RnlsODJZMEk0NnBNMGtxc0R6ZEpOU0xjNDRlbUFXeUdW?=
 =?utf-8?B?TFlLeGR2N09KTDBrSUdncnpwVVQ3b1A0MWM4VnZXdGlsQ2NaaUNEN0o4SmlT?=
 =?utf-8?B?SWRaTmFhWlNVYitmTzkrSEFNaVpsWVpPT1c0dWFnS1JqemdMeVZRZGhOYkFK?=
 =?utf-8?B?dFl3SmhTbldYRytCNmVvNFRWL25seXQ5MEc0SXpKMGV4NHA2NkNuMTdWejBr?=
 =?utf-8?B?b2F3eDJVV1RQWmlyVldkMHRWTUdOaW44ek4rMkg3c0hNb2IzYkVVQlVqdHp0?=
 =?utf-8?B?bXlMQVdVZmhQMnVKS2ZybDZ4THo1QXNQRWo1MnJxWW1OMUJkcmhld1NNMGVE?=
 =?utf-8?B?UlB3a1dDb2llRE5LVlRvNWhOMSszOS9sQU1KOTIxQi9kRTlUTWo5ZDZJWitM?=
 =?utf-8?B?Z0N1UFhHSXBHVU5pckVzbWxXMEp4bk50ZXdtUmN5WWc1aVFBTlcvRHFkQzd2?=
 =?utf-8?B?bkNGMUtRZDU0Wjg2UFhwSEEwbUpBUzdYSE53Q3JEb1lwUTVjbXBOdzA1cVJQ?=
 =?utf-8?Q?PsGLdkIbMx+4eOjYmN//rOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE8C527B342F9F4194988176D697F3FB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0603c497-8257-4889-e088-08da8730ff6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 07:02:53.9473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQoWIZGqDXVkjCFppIQbP/ogFdzzOH+Z49jHQUgyE5XDUx1LizAebtPpwXWTRHEampVy1SOCVoAyMDi0mpV6mCFXwi5SJjb/MB5LYpEHsxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4182
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
Cc: "x86@kernel.org" <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA4LzIwMjIgw6AgMjA6MDgsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDA0OjAwOjUyUE0gKzA1MzAs
IE5hdmVlbiBOLiBSYW8gd3JvdGU6DQo+PiBUaGlzIGlzIGNhdXNpbmcgYSBidWlsZCBpc3N1ZSBv
biBwcGM2NGxlIHdpdGggYSBuZXcgcGF0Y2ggcmVwbGFjaW5nIHVzZQ0KPj4gb2YgdW5yZWFjaGFi
bGUoKSB3aXRoIF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpIGluIF9fV0FSTl9GTEFHUygpOg0KPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjIwODA4MTE0OTA4LjI0MDgx
My0yLXN2QGxpbnV4LmlibS5jb20vDQo+IA0KPiBXaGF0IGlzIHRoZSBjb21waWxlciB2ZXJzaW9u
PyAgSWYgdGhpcyBpcyBhIEdDQyB2ZXJzaW9uIHRoYXQgaXMgc3RpbGwNCj4gc3VwcG9ydGVkLCBj
b3VsZCB5b3UgcGxlYXNlIG9wZW4gYSBQUj8gIDxodHRwczovL2djYy5nbnUub3JnL2J1Z3MuaHRt
bD4NCj4gDQo+PiBkdXJpbmcgUlRMIHBhc3M6IGNvbWJpbmUNCj4+IEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAvbGludXgva2VybmVsL2xvY2tpbmcvcnRtdXRleF9hcGkuYzo5Og0KPj4gL2xpbnV4L2tl
cm5lbC9sb2NraW5nL3J0bXV0ZXguYzogSW4gZnVuY3Rpb24NCj4+ICdfX3J0X211dGV4X3Nsb3ds
b2NrLmNvbnN0cHJvcCc6DQo+PiAvbGludXgva2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOjE2MTI6
MTogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IGluDQo+PiBwdXJnZV9kZWFkX2VkZ2VzLCBhdCBj
ZmdydGwuYzozMzY5DQo+PiAxNjEyIHwgfQ0KPj4gICAgICAgfCBeDQo+PiAweDE0MjgxN2MgaW50
ZXJuYWxfZXJyb3IoY2hhciBjb25zdCosIC4uLikNCj4+IAk/Pz86MA0KPj4gMHg1YzhhMWIgZmFu
Y3lfYWJvcnQoY2hhciBjb25zdCosIGludCwgY2hhciBjb25zdCopDQo+PiAJPz8/OjANCj4+IDB4
NzIwMTdmIHB1cmdlX2FsbF9kZWFkX2VkZ2VzKCkNCj4+IAk/Pz86MA0KPj4gUGxlYXNlIHN1Ym1p
dCBhIGZ1bGwgYnVnIHJlcG9ydCwNCj4+IHdpdGggcHJlcHJvY2Vzc2VkIHNvdXJjZSBpZiBhcHBy
b3ByaWF0ZS4NCj4+IFBsZWFzZSBpbmNsdWRlIHRoZSBjb21wbGV0ZSBiYWNrdHJhY2Ugd2l0aCBh
bnkgYnVnIHJlcG9ydC4NCj4+IFNlZSA8ZmlsZTovLy91c3Ivc2hhcmUvZG9jL2djYy0xMS9SRUFE
TUUuQnVncz4gZm9yIGluc3RydWN0aW9ucy4NCj4gDQo+IChGb3Igc29tZSByZWFzb24geW91ciBj
b21waWxlciBkb2VzIG5vdCBzaG93IGNvbXBpbGVyIHNvdXJjZSBjb2RlIGZpbGUNCj4gbmFtZXMg
b3IgbGluZSBudW1iZXJzLikNCj4gDQo+IFNvIGl0IGlzIEdDQyAxMS4uLiAgaXMgaXQgMTEuMz8g
IElmIG5vdCwgcGxlYXNlIHRyeSB3aXRoIHRoYXQuDQoNCldpdGggZ2NjIDExLjMgSSBnZXQ6DQoN
CiAgIENDICAgICAga2VybmVsL2xvY2tpbmcvcnRtdXRleF9hcGkubw0KZHVyaW5nIFJUTCBwYXNz
OiBjb21iaW5lDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20ga2VybmVsL2xvY2tpbmcvcnRtdXRleF9h
cGkuYzo5Og0Ka2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOiBJbiBmdW5jdGlvbiAnX19ydF9tdXRl
eF9zbG93bG9jay5jb25zdHByb3AnOg0Ka2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOjE2MTI6MTog
aW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IGluIA0KcHVyZ2VfZGVhZF9lZGdlcywgYXQgY2ZncnRs
LmM6MzM2OQ0KICAxNjEyIHwgfQ0KICAgICAgIHwgXg0KUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVn
IHJlcG9ydCwNCndpdGggcHJlcHJvY2Vzc2VkIHNvdXJjZSBpZiBhcHByb3ByaWF0ZS4NClNlZSA8
aHR0cHM6Ly9nY2MuZ251Lm9yZy9idWdzLz4gZm9yIGluc3RydWN0aW9ucy4NCm1ha2VbMl06ICoq
KiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDkgOiBrZXJuZWwvbG9ja2luZy9ydG11dGV4X2Fw
aS5vXSANCkVycmV1ciAxDQptYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDY1
IDoga2VybmVsL2xvY2tpbmddIEVycmV1ciAyDQptYWtlOiAqKiogW01ha2VmaWxlOjE4NTcgOiBr
ZXJuZWxdIEVycmV1ciAyDQoNCg0KV2l0aCBnY2MgMTIuMiBJIGdldDoNCg0KICAgQ0MgICAgICBr
ZXJuZWwvbG9ja2luZy9ydG11dGV4X2FwaS5vDQpkdXJpbmcgUlRMIHBhc3M6IGNvbWJpbmUNCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBrZXJuZWwvbG9ja2luZy9ydG11dGV4X2FwaS5jOjk6DQprZXJu
ZWwvbG9ja2luZy9ydG11dGV4LmM6IEluIGZ1bmN0aW9uICdfX3J0X211dGV4X3Nsb3dsb2NrLmNv
bnN0cHJvcCc6DQprZXJuZWwvbG9ja2luZy9ydG11dGV4LmM6MTYxMjoxOiBpbnRlcm5hbCBjb21w
aWxlciBlcnJvcjogaW4gDQpwdXJnZV9kZWFkX2VkZ2VzLCBhdCBjZmdydGwuY2M6MzM0Nw0KICAx
NjEyIHwgfQ0KICAgICAgIHwgXg0KUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJlcG9ydCwgd2l0
aCBwcmVwcm9jZXNzZWQgc291cmNlIChieSB1c2luZyANCi1mcmVwb3J0LWJ1ZykuDQpTZWUgPGh0
dHBzOi8vZ2NjLmdudS5vcmcvYnVncy8+IGZvciBpbnN0cnVjdGlvbnMuDQptYWtlWzJdOiAqKiog
W3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5IDoga2VybmVsL2xvY2tpbmcvcnRtdXRleF9hcGku
b10gDQpFcnJldXIgMQ0KbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ2NSA6
IGtlcm5lbC9sb2NraW5nXSBFcnJldXIgMg0KbWFrZTogKioqIFtNYWtlZmlsZToxODU3IDoga2Vy
bmVsXSBFcnJldXIgMg0KDQoNCj4gDQo+PiBTbywgaXQgbG9va3MgbGlrZSBnY2Mgc3RpbGwgaGFz
IGlzc3VlcyB3aXRoIGNlcnRhaW4gdXNlcyBvZiBhc20gZ290by4NCj4gDQo+IENvdWxkIGJlLiAg
UGxlYXNlIGF0dGFjaCBwcmVwcm9jZXNzZWQgY29kZSAob3IgcmVkdWNlZCBjb2RlIHRoYXQgc2hv
d3MNCj4gdGhlIHNhbWUgcHJvYmxlbSBpZiB5b3UgaGF2ZSB0aGF0IC8gY2FuIG1ha2UgdGhhdCku
ICBUaGFua3MhDQo+IA0KPiANCj4gU2VnaGVy
