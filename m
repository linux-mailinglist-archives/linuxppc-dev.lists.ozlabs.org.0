Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BF74DC17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:17:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ip1MPKaZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09fm0QpVz3c3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ip1MPKaZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09dp5Bcbz30PW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:16:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB5ovq/FDqMgFUPcKc5JgrPJ21m/BDbHw9zBHL6Cfw/JuFekKv9woormcI81h9DK+3eCVFblyhzECo2oCNg0Mb8ajrDElzy04uLRtiUanEqaWZfcRuYDY686jQkYZvYGIG6sSkZrT+lOj7BFzZ/2OAvo8oFdFjbVokeZwkoXzA89afoL0QvPPIRxLBAudeGUgXSY5T86cKi4r9rcU4dxcLOjU1TJpa/rUw2LUcDWz/QpAZDVEUoCDxdGYYuXxXX4bir/N+O/jQTb06JGB4fSLjKo8y8a6ldwd4KIqVGFh6nBqesjGsqIcUShq6gROE2nzSzV2BJWRF5AwYgNNMOoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjEYJJueN3rppIMCQ6AvSv1lPX+b/+5/RFt/rQbLEbA=;
 b=XgsWxMxxcU984lWT+Op8RglW6pVxc9X6sdSMM+QnyxCinep0iqJRWNGnJa88Jpt81Q/KcvasTwEZH3kqysep5vUl5MNKsXDiw1bh9e437wXtyXgD2HUNglP5yoGtWanNHoi5xog2m49GpSljyidujrl3qSVp+3IHYJhPGYf/Xcg6i17iM77Baeq0aSMChB1rBNY46jub4vdBTKke/VE7bLg65IfSglRcZMzOW9azYPclK7BPNNNv1pRu40sZDOYvepVI+D+gOvYyjYVmQi4MLrJwaYT0NahkNzijOVek6Q8rChKk795HGZA5kzmHxFj4r6l33k/Yb3mpa5Nm673EnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjEYJJueN3rppIMCQ6AvSv1lPX+b/+5/RFt/rQbLEbA=;
 b=Ip1MPKaZIw7OWWJnhqvjPXWs2SZ7Izv0TVKizkcXbjiSPf1QLjWvLajlGuvyIJ/NmXU31gXEFiz6HapKI1ggj1frIdz4wufYPzZemvNwNWuHlOOIzP9JpayOeFpq1sRb6pOcrCGjOSxIEPd4kNB3xqKf9dwtKg9oJ0fFoaa+1vHZQUZGCochlGZvY3DNKkP9f5YRvvBdTYceo/4j3XhED/ONRI5cceUz+xm5sBtg8WkNBisqihBunpZp80NlfmjrMnbwcmNIBrLvqv/jpm6N4wCtXFowdVvsurgiUoptis6yGfS0NCBP4/HVNyDqhXST2WkvPxcR4bNy/jGsJEbccA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1858.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:16:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:16:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 01/13] mm/hugepage pud: Allow arch-specific helper
 function to check huge page pud support
Thread-Topic: [PATCH v4 01/13] mm/hugepage pud: Allow arch-specific helper
 function to check huge page pud support
Thread-Index: AQHZs0jbwyb79rUd8Uicg5WL5hPfCa+zPdwA
Date: Mon, 10 Jul 2023 17:16:08 +0000
Message-ID: <b9db5266-69b2-e8ea-dd43-4576a7779369@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-2-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1858:EE_
x-ms-office365-filtering-correlation-id: e2ace978-5737-488c-cdcf-08db816959e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qLvHncNnwTwtZzkZCBsHLT84ilBY2lNJY5mxgjCbWMjlpJ3uFEGBK+yvZtkteD7s6PiPIXss188MLFoF1UxFb7fyi77X4bb7GWLQRHgmlaIjShLPk+goGZB+X5HMeMflRjVyqMJZqcTa/iglfJ0hOCan2CjZrt5ngAOfUlkbQ3aOm0Lc6EnB0VWuSCfwJWvF0L1a9K81D0HTGLJAYFmZ9HdU5ODI5Lkeay1tWEzkjSYJZp2bzGepY3my2iGj+z9a1MV1Z4COjjNFr8lpNDcs1cDLXpVnGj5tKXSutLKQlce+GoPtNsrOLNTRurCyCMMxpRPhDX1TNtEb3uw8x5FClm34Nn73lmUgPv1C/cgufv0y8iHW02eUb67kuSR+gVipWC4jy3ySI72NzZLIA3UfIGPvXVs5JA8/Q/Jttv+u3VYYeexGn+JvniaLtHOu8Wbk8auAUKdZqz3rIJNINVjXp8qWxAzHaxkDlDXXPvJ0o78/8No21GopvThIU3rc4H1pkn5bKVS0WGrb+ys+do11/8A4L1fH9jWJGVQ2ED3aWcu2GyjICzXY7MeEkfpMlBA8AkqBNLpHEuZqi8J+WenMe9wj8gHBjQ5sZ1xBiAMWkwiPrCFMazLax7CCgQ5epsQxkm/I6tMqOSH6znwLH9WLjgFmvcT6ZPLQx69ExP0TSnv4g30g2a/TMcHlQsooCAUMcHVqpV+QKRPleNUdTZ35WQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(451199021)(86362001)(38100700002)(38070700005)(31696002)(31686004)(36756003)(6486002)(76116006)(110136005)(54906003)(71200400001)(91956017)(122000001)(26005)(186003)(6506007)(6512007)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(66556008)(478600001)(66946007)(8936002)(8676002)(66574015)(83380400001)(4326008)(64756008)(66446008)(66476007)(41300700001)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHpEL3RtQmJiUVNLOHdiMGlMejBCdmh5akx3UlpvSTBKZ0RrK1F0MUFIV2lF?=
 =?utf-8?B?WWlmdnNOTGUvMkFodUlXckgzbVUxTmgyTnI0dG5MQVVUWDJDZ2FhbFltMGRD?=
 =?utf-8?B?YXEvaS9qVlg1NXFKVXdhRDJjaytxUVdWaUF3VFpMbXo1L1JZL2VOMDlzcDJZ?=
 =?utf-8?B?dkJrbERibjBHaFg5MXd5Q3BDM1FyQXN2d1NSZGxuZDVBc0tYK1ZBclovcXlI?=
 =?utf-8?B?YTMzR3VIWE1jZldHT1VzeDJEK3ZsRGZrd29MbWVzTHozUE9uVHlyZXlZcUhR?=
 =?utf-8?B?cDRncFNEdVVpRkdtL2R0RmpxYmV3TG1obTZJWXNkQ3UxQTFYampKcHY0R3Nw?=
 =?utf-8?B?cVZrQWV0NDRhcGtRSm0wS0NsNjMwTFpWWk5mTmNJbTlMbHNUYk9WdVpQMWcv?=
 =?utf-8?B?cFJCbUhSblgzL1lTU3N1TWFIMmZsb0FrVHE0ZVBBNEpjYVFQelRuWnVPakJD?=
 =?utf-8?B?NVZQZlo1bnQzUSsyYWVjNkcvRHc2VFhUeFpHdGEycVlPYjFtTDhaSTFxL3Vq?=
 =?utf-8?B?TEpZbGZLQnV5ckFnRW1ObHMycU1GQW5IaDF1WGRlN3hWMENwam1oRzBod2ZT?=
 =?utf-8?B?MmkzdlF2MlFEV3ZDQUoxcVczdkhLcjVTSE5qV1Fvbi9nb2VxWXdrZWMwUWtx?=
 =?utf-8?B?bTQxYktyM25pK2M3dU1KL0FpL3ZUUHZSUXZOMklFNkZWVlJ0emgwaUFua1ZQ?=
 =?utf-8?B?OVRPYkhWQ2xmbXZRaHpxV1ArYS9tL1JWbFhwZEd4OU51bUZGUFk4b2NVd0d3?=
 =?utf-8?B?WXlHR2dvbXgvM2FVbTlXeXErM0c3dExkaUdTRzVsRXJDTkcwdndoWEE4cFBY?=
 =?utf-8?B?dnFmcDM5Um13UjBMdFZYMlMvYi9UNncydHJGS1pJNk5rVlF6NXpwWW5ZWnF4?=
 =?utf-8?B?dFBMSVkvWUcrWDBPT0taWWNzbUhSSVVkMS9ka0d1eVkzTDhoakZrMVZ2bE5K?=
 =?utf-8?B?WkhxQlhLYVBZMWYva3cyL014QmV5ZCtwN2pYT3hCV3ZxNFB1WFZONEJ3NWR5?=
 =?utf-8?B?bmw4MGR0bjRCWFM5NWZsdHBQSWRWS3BHbXJlcWVCVE1sS09PVkMxMmJsSHR4?=
 =?utf-8?B?Y3NGZHZOR1BKT05GSlRVbTZmYzFFcDQwQXJ3blFnNkRJMUdSQ0xQaHJZUEln?=
 =?utf-8?B?ZmhwYnhpclBpelU2MCtSUFE5V2gvOW5tL2JFd0doWnVCeWZrdm9ZR2xMc0c4?=
 =?utf-8?B?NUg0TlN6TFE4bFJPbVd5YWZMTzlTY0FOeFJTVXRCMCsvSTlUNkxNWm9xMFg5?=
 =?utf-8?B?VjRWQzhkczBsVnBpVS9sRnhDNHFvVWZyRDBER2IvdHpvS2VJZG5yR3FjcDYy?=
 =?utf-8?B?Q1JhWXJCT05vV01DOGZoekZERGZCZm5NWE5pTE5wb0xCamNOdEh0T0RZYkZ3?=
 =?utf-8?B?T084ZHRNR00vY2d1WEJOZXI1aVRZQWpUdVJnNWc2Sk5sQm92UzhSaTlKQnFY?=
 =?utf-8?B?aFF2OWt6TGM1T0NiNnI3Y1JuRGh4ZVg2ZWxaajFWczl2eE9kY2M4T2E5eU52?=
 =?utf-8?B?SE1OOVdqYVpvVnpQNlZnUE54MXk5THQ0L0FLVWd2bjZaMmpEWDhnWnpaMmIx?=
 =?utf-8?B?ZjFjSWZiaThTbVdpQlBncmxrRWhyanlnVnVKUUExbUZuWWdHZnBYTk13UEI0?=
 =?utf-8?B?NTE3d1N1MEk5dVZ5TmRGSExpVmpaYUk2WHZLZk11TGtCaHhWMDU1UVFXcytz?=
 =?utf-8?B?RFhVbWVWNmhOdWQ2SWFodDB2ZW04cWRmanBmZGdUT0kzNVZoTHRRY0c3aTJ4?=
 =?utf-8?B?cW5nWWNGclAvOWdyU1QyaVBvTjZ6aDRmeEphMTZSQVkxbUZ6dnd6TFhkOHNY?=
 =?utf-8?B?ZXhucVg5RHFzclI4Wm9FSWR2NXdicXRRenNNcWVmS3E5Y2hCNXNQNDFyTnor?=
 =?utf-8?B?cDlZOCtKSE12NlNEcTh2N0t0ODJJcERaampoaHlHYlFpZFlyMEh3M01hQTNL?=
 =?utf-8?B?dUJRK0hOWjJVWEZPVzB3M25SSDBpZUhtWGpVTnRidDdDOGpBMFZ0cldSZlcr?=
 =?utf-8?B?Vktkbjl5QUJBcHhRemp2Z01HalhPbkZVODlmTUdPL1dJZzJZVXduNi9LQTJ6?=
 =?utf-8?B?bWExMHltcUNnQ0pucms3SmZhSFgxQWtPWW1KNm9Ob3hZQi9nZHNqQWpaWXdZ?=
 =?utf-8?Q?0mEKOBbcoXEkGt//Ov/Bm/NyW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7B6DADEE0E61541A7A4A0919CB0EFDA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ace978-5737-488c-cdcf-08db816959e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:16:08.2361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgmMx9CHtoKf8dRF0czi91/H8Aji3Dy7tDkoGyFhwT/rGiNWVZCKpFZ/nffOuabkX/kRvHEhGTZ5e703B+1UwX81fynspwKZ1dXAiTap/nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1858
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQXJjaGl0ZWN0dXJlcyBsaWtlIHBvd2VycGMgd291bGQgbGlrZSB0byBlbmFibGUgdHJhbnNw
YXJlbnQgaHVnZSBwYWdlIHB1ZA0KPiBzdXBwb3J0IG9ubHkgd2l0aCByYWRpeCB0cmFuc2xhdGlv
bi4gVG8gc3VwcG9ydCB0aGF0IGFkZA0KPiBoYXNfdHJhbnNwYXJlbnRfcHVkX2h1Z2VwYWdlKCkg
aGVscGVyIHRoYXQgYXJjaGl0ZWN0dXJlcyBjYW4gb3ZlcnJpZGUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4N
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL252ZGltbS9wZm5fZGV2cy5jIHwgMiArLQ0KPiAgIGluY2x1
ZGUvbGludXgvcGd0YWJsZS5oICAgfCAzICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRp
bW0vcGZuX2RldnMuYyBiL2RyaXZlcnMvbnZkaW1tL3Bmbl9kZXZzLmMNCj4gaW5kZXggYWY3ZDkz
MDE1MjBjLi4xOGFkMzE1NTgxY2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbnZkaW1tL3Bmbl9k
ZXZzLmMNCj4gKysrIGIvZHJpdmVycy9udmRpbW0vcGZuX2RldnMuYw0KPiBAQCAtMTAwLDcgKzEw
MCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nICpuZF9wZm5fc3VwcG9ydGVkX2FsaWdubWVudHMo
dW5zaWduZWQgbG9uZyAqYWxpZ25tZW50cykNCj4gICANCj4gICAJaWYgKGhhc190cmFuc3BhcmVu
dF9odWdlcGFnZSgpKSB7DQo+ICAgCQlhbGlnbm1lbnRzWzFdID0gSFBBR0VfUE1EX1NJWkU7DQo+
IC0JCWlmIChJU19FTkFCTEVEKENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0Vf
UFVEKSkNCj4gKwkJaWYgKGhhc190cmFuc3BhcmVudF9wdWRfaHVnZXBhZ2UoKSkNCj4gICAJCQlh
bGlnbm1lbnRzWzJdID0gSFBBR0VfUFVEX1NJWkU7DQo+ICAgCX0NCj4gICANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgNCj4g
aW5kZXggNTA2M2I0ODJlMzRmLi5jZjEzZjhkOTM4YTggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
bGludXgvcGd0YWJsZS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+IEBAIC0x
NDk5LDYgKzE0OTksOSBAQCB0eXBlZGVmIHVuc2lnbmVkIGludCBwZ3RibF9tb2RfbWFzazsNCj4g
ICAjZGVmaW5lIGhhc190cmFuc3BhcmVudF9odWdlcGFnZSgpIElTX0JVSUxUSU4oQ09ORklHX1RS
QU5TUEFSRU5UX0hVR0VQQUdFKQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2lmbmRlZiBoYXNfdHJh
bnNwYXJlbnRfcHVkX2h1Z2VwYWdlDQo+ICsjZGVmaW5lIGhhc190cmFuc3BhcmVudF9wdWRfaHVn
ZXBhZ2UoKSBJU19CVUlMVElOKENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0Vf
UFVEKQ0KPiArI2VuZGlmDQo+ICAgLyoNCj4gICAgKiBPbiBzb21lIGFyY2hpdGVjdHVyZXMgaXQg
ZGVwZW5kcyBvbiB0aGUgbW0gaWYgdGhlIHA0ZC9wdWQgb3IgcG1kDQo+ICAgICogbGF5ZXIgb2Yg
dGhlIHBhZ2UgdGFibGUgaGllcmFyY2h5IGlzIGZvbGRlZCBvciBub3QuDQo=
