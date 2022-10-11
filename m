Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EB5FB068
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 12:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmsQ45zJBz3drZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 21:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ry0Gc4Mt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.80; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ry0Gc4Mt;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90080.outbound.protection.outlook.com [40.107.9.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmsP32cgqz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 21:25:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRYcE4n4P9JPVJbrsCNXZwVl7d2Ar/sHe8fXl9PS/tQbmMLslR/pTWOJFflp+juh11P6WyKs/ZtwFlxFtAjlTfojEa43GE7rkV7VOHFlkGWiZMRDKZI5pnUNFDxLpG9vCt8Y6MO48uw6khBwgxvIG6ZIr6AZN6/GUkPwqtlyWJoqDxdo3zLIbXJdB6rUsKnOOTOlehn7490O4iU4UNXspoymkKPpJrJGtR52RwEtqMYz2I97EePC6p8jvndAPtRFMLkr1nSs7D9y50iGR+R/sqQ45giWstqGFTTKIDBGZb4qVeUscApmz7nVPUI7GOcMVt8suu3WzUBbuRigkaUpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgd4mnY7P5DmOXSw4Lg++69yeLfjIjcq9KZ2asKTS24=;
 b=dfUXK8u391JP/6w/c4EYZTJwCucNGNpOYni33YwLCY9sNQTcnhjjflOCoH/Fp7UGvePR2XrmFwWv4jxjPjEstqzo75xvdutUfD26Uzlylf9oLFEQxkJ9H+Kf5s8z0sor2GQWIHklLQwk/b6JbLUdOCtmrVc2buqsx1kUPMR4wMEBVcAc/ky3AwVFWFo7SWCTxZxM7P92N1nxOd6ZaYmSep/7gbOthtKvjU24kRZzS0Zt66k895BJa1B/x0SsnvO5GassROAG+Tl2AjZOHK41xS4yLwmsqd9WcWztb5bidku1iR+Ndq+1THbRGhjWDFGapVFNfygui4T3Tt6K/Krwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgd4mnY7P5DmOXSw4Lg++69yeLfjIjcq9KZ2asKTS24=;
 b=Ry0Gc4MtarJjuv5JJEAkjiAG/0A9V/aH2uJE4jEH5LMoobcZ/W/kuvrfKYPdVmUU5OM8Xh2947/6LmKe9u8DC5nUW9r7he7Tq61wMDhBRS4brgp5xIfvaajUUB5c/uoj6SUyaTDc0ur8cIJAX6IcLdPQnBig3h+xrh+T1lvas70+rm3DN/WRKTurpRl3nLfods1pA0nilwDiXyDNO76qDE8ihZDRFQTjM56YSVt18ZPA5ttljuFKhGGe+LLWuLmaKH1NV75eK1pITX0U6A5s2kzSyHcrG60a8+hN4epoJp6m+zh39d6Jf1ZILM9WP1sxR0YpZ1pNKSEMEMJMER4R4Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3289.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 10:25:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 10:25:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch
	<nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Topic: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Index:  AQHY2EIBh+iraNEA6UKZa+r/wPzLXq4AwrWAgAAPGgCAAfBWAIAE8XqAgAFMbYCAAAbegA==
Date: Tue, 11 Oct 2022 10:25:05 +0000
Message-ID: <0c46ba45-1fff-d067-159c-1951c5985de0@csgroup.eu>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
 <87h70for01.fsf@mpe.ellerman.id.au> <8735bvbwgy.fsf@linux.ibm.com>
 <87v8oqn0hy.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v8oqn0hy.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3289:EE_
x-ms-office365-filtering-correlation-id: 0e6bdb7c-7bb8-49a9-1990-08daab72dd36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mH7k/7ON1I3KT9rMoyJzzVTlDT6dJJgmeu6XPMsIntqIMGY+Eb70vFBtTb+CtdE/8Q05rXfhKP2GCtNpV4oe2oVaJWihW37+8plE1iOUyfIdnbPEx3MKBvXx/30IoPgZF96o6amMdjbZv92ef0dKHYji3kUN9pKHamQ6AGQzBULgE2i/SBZyN/Hr89wgrRi7q1BXbed1de+vnUuZPcQ+xMm6PTR0mcEGhPA+BZljqQB4c5srphFqrEvX8QImj34DQ/e93U8BR3iIhvqLmLqPKtnuttfyH7lTyPz58pjfWgVb+Scknetz+kuvOmG487HKpAMhPaZReubbfchQeYTWPQ17/7nA5uRRltWa8uAScaref2gclnogSq4KkzqYq/tbXcIK55Bb4oxFX/mrhsz2QxHOsfzEYzn5md91n7Zl2Z+PwHM2c0wwaVuEVhv208uoMYQTuJQ3bS968O3oW8MKyv9Srpl3/W/8T7Oqec+qjUJ/kDLE+8bUs+/NZFdu6s48fzrje2LBeoGhoCuE+BzsZqcpCyC9iASrAXIoeAgYMZB5gvRMM8Z78kxdXgCMvbSgHl1RasTF5Qe2yT534si7+LYxsWddhQzxeZ+4IierQ6y1a5K1kVelyM9iC0x6h1fWnZm9lcc0VfjqVlm5bnBCFeZHbjehspNDUp4txX7aeEWzIOnS+QoWDgSd7SPle1qZQBcwcXSr5qyvudx2dlR/72uI3l9LKWUqcpjYeVXhhCatLDCKkKEjWHvWJgBtbyYlj1SLI35s9nAi0znE5O4Eqz8fEIreKmRkewjusNw9irIhHpOhFXpeiqMeSd4IYmoV33h4/0qIHvdGAUmUWn7kAw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199015)(5660300002)(66899015)(8936002)(31686004)(44832011)(31696002)(66476007)(64756008)(54906003)(66446008)(110136005)(86362001)(91956017)(76116006)(66946007)(66556008)(8676002)(4326008)(316002)(71200400001)(38070700005)(478600001)(6486002)(36756003)(38100700002)(26005)(6506007)(83380400001)(41300700001)(2906002)(186003)(122000001)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MGdwREJkZWliRWZjekw5ZnltRjZpVGVkOUo0ZEhMOTVVSnhtMHM1WE8xN01O?=
 =?utf-8?B?M2ZMU0dsOFFlNnlMcUNUMzl3L0I4R1FSYjZkQzFFNWhRMkdUSWxzaVFYTDND?=
 =?utf-8?B?MzNzYktXeEE4azBEdk5QRUtOc0xzSjBUQlJFMkdUWU10d0hBMCs5UEV6OVFq?=
 =?utf-8?B?aHkxVURzU0FmRzJ1a01CbHA2b3gveGFoamxWOHFxaDJUVGpYOW9PaCt4VDZP?=
 =?utf-8?B?WS9ERkdwNnRNTUpaZVRCVWV0S1J0K1RMQlo4V2pjZjJuNWZvdUxhOXZ4OE1T?=
 =?utf-8?B?RGlrR0JpQXBvcGhpc2k5ZytaN0kzMGV4Y1d4L1FDWHk5R2pPWVFiTk9DaWpW?=
 =?utf-8?B?eFBKclRDRmJUd1JzRkxKYThoMVUyTVFsdFRJWU9WTSt1UGJCeCticG5aQTVW?=
 =?utf-8?B?dnBhR1Eyd3QzbzF0RlNyamtOYjZBQmZ4bXRqT3psRnU1OHZuSmZMb29TdU9O?=
 =?utf-8?B?bER6VkdJSjhrZHFsQTJ4MnR6a1BHSjVrUnNTMk1OUlhWUlRtNkR6ZDB4TXVp?=
 =?utf-8?B?Sk5ld2NPNHhsUUJ2dkd1T0JSY1FVNFdZY1V4dW11eGEvTUY3SzVVRy9UYUkv?=
 =?utf-8?B?elYrRWRtb0lpbktZRHRTcHpRdWg3VlJGSDdIM0FTbUFick1iUHNjYjhzN0xZ?=
 =?utf-8?B?MjRJK2o4VG91TjNhMHQrTDZVR2g0MzdaNzJxQjZRb01QYlZRS0FLMjNidytS?=
 =?utf-8?B?eWtkTzR4aGFCZnh2TXIrTHpSRDVyT0tnTXZlU3F3R085dEJmVmF6MEtuY252?=
 =?utf-8?B?VDczNHIyeVJWMzVXT2ZhaGxLUTdIMjhHWVU0Mmo2NUt4ZXNKL3NiSUlodHJQ?=
 =?utf-8?B?dlNyL0FzN3hsUE1ZSHNyQU1sNU8wbE5sRmswdWtWK3dVbUpMekJOV0x1TnBx?=
 =?utf-8?B?OHpaTXRlc2ZJaW9BbW8wQWoyR1UvYUtqdGordEdKbGM1d2xyVlpXZytCcG1h?=
 =?utf-8?B?RVBSeERoUzE4SFhkcndjTnJVOXd5TEhScnFlS1Z1VEQ4ZVJkajRsQyt0ZFlC?=
 =?utf-8?B?VFV3V243OFdNb3ZZdi9wL2dIS3hSbGpYQkJuU2J2eEpaQkNpcTJZZDFmYUNt?=
 =?utf-8?B?bkhCVUFONmtXL1pZUUM0aU9ySFAyT2E1WkdTUzF4eXJxckZiRWdGMnpIcGxI?=
 =?utf-8?B?Y2pVS05UY25TaHJ4L0IydDlqeG50OXdXZ2pkVGdLSlJEeUR5SUZBOWhEK1dI?=
 =?utf-8?B?R0k5LzVZd3RUbmRHdVExdUplTXVKVzZ0c3hHT05kOFUwb1BNRVpJVHpVUXd1?=
 =?utf-8?B?NGtzcU00cE8rY1ZYZ3FzNmtCREl4TzZ1OU81Vk43Mm1KQkx3MU9CZktsd0Yw?=
 =?utf-8?B?R0l2bnUyMmhWQ1NYZWVBdVlSOGVab2tGWGFXRkVYdndoS01DRC84V1lBbDNY?=
 =?utf-8?B?aFpEYlVQcUxnUTNVUCsvMmxYSWpmeGVHVVNzeE91bXpkd1Q1bU56WFo5dDRk?=
 =?utf-8?B?NmNNY1A1YzBPdk9TdjVhK3Z1S3UvUEtjc3FrZDRQLzZLZmwzbUhJTlAybFJ5?=
 =?utf-8?B?Zmw4R2k4NmxzUHhkY2Job2c1dkRZUFQ4Sk5nTk1FTmh2NThjcEpTNG5xQzgr?=
 =?utf-8?B?MzROcXBwSjcyRzBqWGxWdXBtUHdwTmdqbUhkcW1oZkhtWG41R0MySDU5cG56?=
 =?utf-8?B?VU1EbXd2Tnc0VTN6QndFSDBvUkZmeDhGUUE3UEpwcXdvMFQzSnVTOUR3N3Bk?=
 =?utf-8?B?NDh6U2pHTDVZeGpiekpuTnhIMUJuV3dZdS9ya0VKZElraDlUNDEzUWNYSjUx?=
 =?utf-8?B?K1JhRExLVzFaUkpjcWZZeURMcmRheFdzd3AxeXNXNkJ3M0pUY3UyY2RMdjVS?=
 =?utf-8?B?VFA5Ymc4ZHFZb1BQZ01tVG5LWDZpZllRc1lzQ2FCN2o1b1l3dDBJUEVoSS85?=
 =?utf-8?B?cGF3VVEwMFYxWWdva3JUQ0lnY2E1enlQWmlWc0NwQWpEWUZydjFISHprMFBq?=
 =?utf-8?B?S3p1Ym9RNmY3SkdyTmJxaUl6SXpXUlNoQUUrd2I1WjhpVi92bi9oVHE3cjgz?=
 =?utf-8?B?TDZsdjhWa3RsMWdwWGRmNmh6TFpQcHVsZ3dGSERNd0NpZHRnYmZLM1AzTE1Q?=
 =?utf-8?B?RjQzRWNaYVFuYk1CRXZkVzZ1SVJlaVRYdjd4WkpFZVU0QTFVeWcwWXc4RUY1?=
 =?utf-8?B?K1RrREFhQUJoY2FQRjNLVDVpeE9ybXRaK1BRbTFrcmNjck1BNEhnb3dGTzYw?=
 =?utf-8?Q?00DH4qRLhFwQzlVz3WoG/CI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C43762274521B42A6CC8F7BBAC45A4D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6bdb7c-7bb8-49a9-1990-08daab72dd36
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 10:25:05.1653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xkzBGhRCkAA+tMW63EtjJgtC3Bost0CM0rtvXK8jIXdxx1gYBbywPhGrSOjRd3oFKAcw7z2HE3z7UHEhSy5KcCkYuV2Zw0Mv+v7j0RTRIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3289
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzEwLzIwMjIgw6AgMTI6MDAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTmF0aGFuIEx5bmNoIDxuYXRoYW5sQGxpbnV4LmlibS5jb20+IHdyaXRlczoNCj4+IE1pY2hh
ZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gd3JpdGVzOg0KPj4+IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JpdGVzOg0KPj4+PiArIEtBU0FO
IGxpc3QNCj4+Pj4NCj4+Pj4gTGUgMDYvMTAvMjAyMiDDoCAwNjoxMCwgTWljaGFlbCBFbGxlcm1h
biBhIMOpY3JpdMKgOg0KPj4+Pj4gTmF0aGFuIEx5bmNoIDxuYXRoYW5sQGxpbnV4LmlibS5jb20+
IHdyaXRlczoNCj4+Pj4+PiBrYXNhbiBpcyBrbm93biB0byBjcmFzaCBhdCBib290IG9uIGJvb2sz
c182NCB3aXRoIG5vbi1yYWRpeCBNTVUuIEFzDQo+Pj4+Pj4gbm90ZWQgaW4gY29tbWl0IDQxYjdh
MzQ3YmYxNCAoInBvd2VycGM6IEJvb2szUyA2NC1iaXQgb3V0bGluZS1vbmx5DQo+Pj4+Pj4gS0FT
QU4gc3VwcG9ydCIpOg0KPj4+Pj4+DQo+Pj4+Pj4gICAgIEEga2VybmVsIHdpdGggQ09ORklHX0tB
U0FOPXkgd2lsbCBjcmFzaCBkdXJpbmcgYm9vdCBvbiBhIG1hY2hpbmUNCj4+Pj4+PiAgICAgdXNp
bmcgSFBUIHRyYW5zbGF0aW9uIGJlY2F1c2Ugbm90IGFsbCB0aGUgZW50cnkgcG9pbnRzIHRvIHRo
ZQ0KPj4+Pj4+ICAgICBnZW5lcmljIEtBU0FOIGNvZGUgYXJlIHByb3RlY3RlZCB3aXRoIGEgY2Fs
bCB0byBrYXNhbl9hcmNoX2lzX3JlYWR5KCkuDQo+Pj4+Pg0KPj4+Pj4gSSBndWVzcyBJIHRob3Vn
aHQgdGhlcmUgd2FzIHNvbWUgcGxhbiB0byBmaXggdGhhdC4NCj4+Pj4NCj4+Pj4gSSB3YXMgdGhp
bmtpbmcgdGhlIHNhbWUuDQo+Pj4+DQo+Pj4+IERvIHdlIGhhdmUgYSBsaXN0IG9mIHRoZSBzYWlk
IGVudHJ5IHBvaW50cyB0byB0aGUgZ2VuZXJpYyBjb2RlIHRoYXQgYXJlDQo+Pj4+IGxhY2tpbmcg
YSBjYWxsIHRvIGthc2FuX2FyY2hfaXNfcmVhZHkoKSA/DQo+Pj4+DQo+Pj4+IFR5cGljYWxseSwg
dGhlIEJVRyBkdW1wIGJlbG93IHNob3dzIHRoYXQga2FzYW5fYnl0ZV9hY2Nlc3NpYmxlKCkgaXMN
Cj4+Pj4gbGFja2luZyB0aGUgY2hlY2suIEl0IHNob3VsZCBiZSBzdHJhaWdodCBmb3J3YXJkIHRv
IGFkZA0KPj4+PiBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgY2hlY2sgdG8ga2FzYW5fYnl0ZV9hY2Nl
c3NpYmxlKCksIHNob3VsZG4ndCBpdCA/DQo+Pj4NCj4+PiBZZXMgOikNCj4+Pg0KPj4+IEFuZCBv
bmUgb3RoZXIgc3BvdCwgYnV0IHRoZSBwYXRjaCBiZWxvdyBib290cyBPSyBmb3IgbWUuIEknbGwg
bGVhdmUgaXQNCj4+PiBydW5uaW5nIGZvciBhIHdoaWxlIGp1c3QgaW4gY2FzZSB0aGVyZSdzIGEg
cGF0aCBJJ3ZlIG1pc3NlZC4NCj4+DQo+PiBJdCB3b3JrcyBmb3IgbWUgdG9vLCB0aGFua3MgKHA4
IHBzZXJpZXMgcWVtdSkuDQo+IA0KPiBJdCB3b3JrcyBidXQgSSBzdGlsbCBzZWUgdGhlIGthc2Fu
IHNoYWRvdyBnZXR0aW5nIG1hcHBlZCwgd2hpY2ggd2Ugd291bGQNCj4gaWRlYWxseSBhdm9pZC4N
Cj4gDQo+ICBGcm9tIFBURFVNUDoNCj4gDQo+IC0tLVsga2FzYW4gc2hhZG93IG1lbSBzdGFydCBd
LS0tDQo+IDB4YzAwZjAwMDAwMDAwMDAwMC0weGMwMGYwMDAwMDAwNmZmZmYgIDB4MDAwMDAwMDAw
NDVlMDAwMCAgICAgICA0NDhLICAgICAgICAgciAgdyAgICAgICBwdGUgIHZhbGlkICBwcmVzZW50
ICAgICAgICBkaXJ0eSAgYWNjZXNzZWQNCj4gMHhjMDBmM2ZmZmZmZmUwMDAwLTB4YzAwZjNmZmZm
ZmZmZmZmZiAgMHgwMDAwMDAwMDA0ZDgwMDAwICAgICAgIDEyOEsgICAgICAgICByICB3ICAgICAg
IHB0ZSAgdmFsaWQgIHByZXNlbnQgICAgICAgIGRpcnR5ICBhY2Nlc3NlZA0KPiANCj4gSSBoYXZl
bid0IHdvcmtlZCBvdXQgaG93IHRob3NlIGFyZSBnZXR0aW5nIG1hcHBlZC4NCg0KDQprYXNhbl9w
b3B1bGF0ZV92bWFsbG9jKCkgbWF5YmUgPw0KDQpDaHJpc3RvcGhl
