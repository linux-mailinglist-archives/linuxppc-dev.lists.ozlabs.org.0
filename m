Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2D48A792
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 07:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY0YQ6P1Nz3bPJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 17:05:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY0Xx57mnz2x9L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 17:05:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejP2G5rPebvqRWwwo9Ty9cEpKFkpHtZwVbmjB64+jzEkL7ZF8nbQWhK8kn78gTLIqpf3d+afSJ5o3/STk5TSZj/SjVidQuhvDcX3Dsi6X3pooxXSeKnHIDw3U+MysFIx1LT7wqYrxDuVDEczYHFoWFrFT7H7JJWV1rL+ylkRi6T7G+428gsfCyXpxeJ6PB+66I91yOyudmNgMAe1t6G6FyDKv7NomnYed1jPNnMEbw/zPKxE/wUVqc/uGuUhDzbDjAWTteLUhjmbLD1G02wowN8jw1rG1n6XoDtziJc88rxHGbefSvWggKNcDKlOMyFUvTvUTsPSRTVphk4rtILCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlDdxWYFaBsvmH8IGaxMGBEwMkg806LCDDJN1U7tpQo=;
 b=d5o11WItRy/GF5OL3UfAgtRs5iA+AZP/eWpGF56ZIr51W1ciCtJBD5TRlh5pDIuRKDxZkgVZACCCMbTqtfOKl7P7SgW97dTP9qPJtNJcsyvL5VP3o68uF8xdfhELGGhageUV+/LLxu7Vi8hsy7mWRvd9sV1adCH/Y1MN7l40e9Yad8rrvV2uGvsWBTE4Ze5GYFox2DWRHAWYp6w8qlPbOSqoLAByuQF4gJMMiOe7q1GzQTmz9PPJI41kqRB/0V8Opw1/haKWOnZk6IreaJZIs4pjY5+t/S4HzlYHWhWmfCxh9FYY/NdP29LTtdpfNnCxohMN2zageKZgKopexJeqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 06:04:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 06:04:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Kees Cook <keescook@chromium.org>, Laura Abbott
 <labbott@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland
 <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Topic: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Index: AQHX+Ya2u0aEpSnXzUqUcTfc81tnDqxZGu4AgAQ74YCAABh2AA==
Date: Tue, 11 Jan 2022 06:04:59 +0000
Message-ID: <ca351bfc-3507-11ad-73f1-79ca772b55fd@csgroup.eu>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
 <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
 <1641871726.fshx7g5r92.astroid@bobo.none>
In-Reply-To: <1641871726.fshx7g5r92.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1f08322-5433-47cd-8b31-08d9d4c84c75
x-ms-traffictypediagnostic: MRZP264MB2008:EE_
x-microsoft-antispam-prvs: <MRZP264MB20088DD3BB911CF551D23B4CED519@MRZP264MB2008.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJnaNCs71qabAyU731j8ZmNErlGBky2mi8rl2yKu5lbidJolbdY7DDr9RojYBYLuT4nGUHiwcZK/+hGK5Bpeasf/4AXj7zSXGnMjevCfo3KW1Pvg/+KjPaMHS0KIV7vxkpaDtvmIxkHwO+ph+YLzvOa5d1UIfI/3qToKRlFQwPnIK9Gg5m40ylJDlhTSXl3H4M/v//Jh/u7VO8ucec8UPclfk5AZCXhSx2rJtPVyq82cbHdmcBVRq1W84seUGhL5uamrvBAVSHxdDbggU9y3AXRGDl0NXr2jr8zkwIelubdgZK5lgW5kClrEWSswkHa7spGpWIVpPq+/LKvI8tqK+jc9/J6gQ2sQbfxeKphjd6R8cr9kKqiT0eAvXPO5wPW7j2mdZ8gwYrVAze5OBA5A6++YMXk/rexkg9fUBa4KcF8OaLwBbAQVtdGKkw/B8jIVlKuWhwoFiIZiKZt1ikBDcgb7ctnc1aSWPsuKyFmMzKab1qznMlYiytTVyF+aYLBqu0ID8QMIzjX+SLr/M4gdxSPMu2RzgZ1y9zC0/5n+AhDOZZlPA0fBYtBWAONm7DgSLVf/REQ3JX3PeTBSyKQZUJgxT90hKmldiToE6QUHamVGKFvpb6p8sv83POoG7v+C9WUnW6PhBsYlJYF16rsf4QZOGuKBD6Zk2wHlEbGsOOgfJOEeRLe783T2YGoH815PRNi823IMedhMIjykP0QS+VWqXbDpzM5sbI/21j+3LDZBnt9J85ZggjnbjEJfJyjD2nlnpoquVzJdoMHBnSm802ld9rrbnUEiT04BPpexc30=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(76116006)(508600001)(8936002)(66476007)(71200400001)(5660300002)(316002)(66556008)(8676002)(53546011)(6506007)(31686004)(38070700005)(31696002)(36756003)(86362001)(110136005)(66946007)(64756008)(6486002)(66574015)(66446008)(2616005)(26005)(186003)(91956017)(7416002)(921005)(83380400001)(44832011)(6512007)(38100700002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlI0US80U1p2d3Y2cVh0NDBsbWx4S1RLOXd5SkY0NTU0NFQ4aXpOeGdzY05y?=
 =?utf-8?B?MnZobzE3STJ0T20reTRxamxITUM1Z01WUEdPamt0ZTUwM2FSbGwrMG5NQ29R?=
 =?utf-8?B?amxXTlpVYUNxYUEwUG5RYmc1L3o4T0ttWWh1RHl4bWpIcXN3RlNaUlRoV3Qz?=
 =?utf-8?B?d0NFblB4YVc1V0pBV0JaK0tEL1NSMkJsaitWb0VLazdnMU5FN1FXd0VRNVhv?=
 =?utf-8?B?cDRFQ0NIWkswRVNBWkNldzAwZGtOaWREdUJaZWZneHVtV3hQMWJvWndQUGxp?=
 =?utf-8?B?TTBjUGlnNWFXNDE4THE4angrTTZvQXVyOXBDR0F0ZFJ6aEphVERDZ0tZeWoz?=
 =?utf-8?B?d3hzTU9zZThWeXB4V0QyUTRLQnI5cjZWcVF5UlZHMjhNNTgvcXNUMFlWWkRY?=
 =?utf-8?B?WnNVNmJvVktHcHdQeVR5UXpGMXJWSUhtRC9vbFZzblZiS09zOUhORnl6QVNY?=
 =?utf-8?B?SVg5bDV1UFNvd1BNUFBYWWY2bXBaRVROK1ZzTHJjRzlZK29JN2hnMWFWMlBE?=
 =?utf-8?B?UGdlczBZdXY4Wm1ra1pyUm5UeW0wTGp2RUpVN29GV054MmFlNFRpb09KMTN0?=
 =?utf-8?B?Rk04Yk92VkE5MjIxUGRsL0NqSWtSclVlakdUOWFJOXowMCtwN2tYTVlmWHA2?=
 =?utf-8?B?dGNVUkFkZ0JOK3VmU1htNEtZbHVtaHBDeEk4WGZpdXoyWXYrVmRBM2ZSSWZC?=
 =?utf-8?B?TlRGblZMR0ZKa3FaS04rbUdGcHZLLzcvNERqRUhxS3gxcTFMWlJaTzJQYy9K?=
 =?utf-8?B?bDFkT09OQThmZ3MvbGN0Q1BmR2JnZSt1Qm4vNGw2UGoyeTIrRlE4UzFoNTEy?=
 =?utf-8?B?QWl3bDlFTEJwMmFlUlQyRmhLY0xvK2hmdk02WCtHSnBwczBDbE1CaWV6NGVa?=
 =?utf-8?B?aHlkZGpuajZESUdJc2RPREZCN3hWdENDY0RORjUyNjZQWFBpdnFhZHUvbWtL?=
 =?utf-8?B?bUkxRUNkZUhUelU4SUpLa3RSUWJvYnBkWEFuM3lHNXcvYnZDcm1QcmhlODFM?=
 =?utf-8?B?ckh3RzJhZUpkSE5KeFV3NjMyRzI4R2hCMmJ4TS96dTB3VTJBZHN5TXRyMG1K?=
 =?utf-8?B?TXlXeEtJSlFnWnd3b3RJYllSY21WWUFOcXk1VTRkWFl2VXhIRGUrT01Va0p6?=
 =?utf-8?B?RGdaeDMzNmlIRDV1dXVUYzYzN1N6SWhmTjR5bnJMcnVYMHdGbWpVaUU5SUZO?=
 =?utf-8?B?eEsyTDlCLzd2OUhuT3RJU0lRSE1CQzZnMUJ2YTJEVSt4YU1iaFJ0akFuTFRn?=
 =?utf-8?B?dGQvTVpsbEhraEkrWGp6R1oyWTBWQlZSS3J5VXIvYkNIK2tMK0g5WG5OWnYv?=
 =?utf-8?B?VjY0TDhzMFcrZjVxV0lqZ0pic0RPMEdQcTBodmt6MmluWi9YQVpPZzJ6SHkv?=
 =?utf-8?B?UFVLazlQbFJTR3lMMmUwYXQzeVBYR1NCZmlSdUJXNFFGcWdIUXNkQUxQbkEw?=
 =?utf-8?B?ZWdHOVJBbmltYUQwUW9jN2ZJT3gvQnZQaHhCa1ZDOFB2a3ozYmhGdHNpcWhF?=
 =?utf-8?B?MlI3K3B2WVlOeldsUUQxazF0aFVXS2xxcmswZVBKU3ljZ3ZueE9RSkJjaWxl?=
 =?utf-8?B?d0R6WE5NbGRIRk9PRUNhTkFYbis2NDc5Y2dQRG16VGV5NlBqQmNkQ1NvQTR0?=
 =?utf-8?B?SWFNTzlpZjV3N2JnOENLUGRhSEhLM20rcExTS25vQ2llMnVSemZPaWl6SitI?=
 =?utf-8?B?VlVhcW42SHRXWHBrcGRQRk1oV2dtVG9zdmhmRmFhTCtmUWJ2WmpRdUxkMjJE?=
 =?utf-8?B?UnMvSlNuR0h1QUJsMXJYd0xZZEZSUXg0YWVqbzNNQ2dWRkRnZmZoVW9ERWRK?=
 =?utf-8?B?TldleWwvZm92ZjkrcXdOZlZ0cWV2NE1lRVVTTU1VdktEdlVOL05UczEzSWd2?=
 =?utf-8?B?RUozMkpGN1F6dmQ5UHF1d1lmMDQzME1BaFdRWjdPRUN0dkxka3FISjRTV05a?=
 =?utf-8?B?QURqUWRGdXJPRjE4WlBxb1JOMzlPb25mangxU0dPMXVsM0hxc09Nc2RPbExx?=
 =?utf-8?B?cE93VnB3NmZOZTQ5UFB0ZW1wZnNrazNSYmhjdjAyNmdyL2ZpUXpQUHJ3VDd4?=
 =?utf-8?B?Y1pLdTlGRzAyNVdUdG4zWWNDaWJBTUR6V3c2dzVTdzVndnRBRmkxMTBxRlNa?=
 =?utf-8?B?Y00xUmpYL1J6dmhTUVV4S1Nzd3FTc09wdWIrS3VoYkRMUDVzejdOZnd6a2dN?=
 =?utf-8?B?WHdwamhkVVRkdFFscHFzSjMwK3NRS0NWRkdLVjBTZXhvbndYTlcxWjhtTmJr?=
 =?utf-8?Q?ouMUC13cb49r1VqSmyoDAkvOrTeSzq6U5H2pJVHt1Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDC1DE9E88259749AF1C0E6B32473C4B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f08322-5433-47cd-8b31-08d9d4c84c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 06:04:59.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIa9uCyUmVfY+ju4uvzF8sQZkLPokFVHYD0Vn59NfN+1bfMbMsPmPYtmulekYaM0wJzyqmKPMQchUbFaD9CdSQG1RAkqiWiUlqHyPov3ZZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2008
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAxLzIwMjIgw6AgMDU6MzcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIEtlZmVuZyBXYW5nJ3MgbWVzc2FnZSBvZiBKYW51YXJ5IDgsIDIwMjIg
OTo1OCBwbToNCj4+IEhpIFBQQyBtYWludGFpbmVyc++8jCBwaW5nLi4NCj4gDQo+IEhtbS4gSSBt
aWdodCBoYXZlIGNvbmZ1c2VkIG15c2VsZiBhYm91dCB0aGlzLiBJJ20gZ29pbmcgYmFjayBhbmQN
Cj4gdHJ5aW5nIHRvIHdvcmsgb3V0IHdoYXQgSSB3YXMgdGhpbmtpbmcgd2hlbiBJIHN1Z2dlc3Rl
ZCBpdC4gVGhpcw0KPiB3b3JrcyBvbiA2NGUgYmVjYXVzZSB2bWFsbG9jIHNwYWNlIGlzIGJlbG93
IHRoZSBrZXJuZWwgbGluZWFyIG1hcCwNCj4gcmlnaHQ/DQo+IA0KPiBPbiA2NHMgaXQgaXMgdGhl
IG90aGVyIHdheSBhcm91bmQgYW5kIGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGVuYWJsZQ0KPiBm
bGF0bWVtIG9uIDY0cy4gQWx0b3VnaCB3ZSBtaWdodCBqdXN0IG5vdCBoaXQgdGhlIHByb2JsZW0g
dGhlcmUgYmVjYXVzZQ0KPiBfX3BhKCkgd2lsbCBub3QgbWFzayBhd2F5IHRoZSB2bWFsbG9jIG9m
ZnNldCBmb3IgNjRzIHNvIGl0IHdpbGwgc3RpbGwNCj4gcmV0dXJuIHNvbWV0aGluZyB0aGF0J3Mg
b3V0c2lkZSB0aGUgcGZuX3ZhbGlkIHJhbmdlIGZvciBmbGF0bWVtLiBUaGF0J3MNCj4gdmVyeSBz
dWJ0bGUgdGhvdWdoLg0KDQpUaGF0J3MgdGhlIHdheSBpdCB3b3JrcyBvbiBQUEMzMiBhdCBsZWFz
dCwgc28gZm9yIG1lIGl0J3Mgbm90IGNob2NraW5nIA0KdG8gaGF2ZSBpdCB3b3JrIHRoZSBzYW1l
IHdheSBvbiBQUEM2NHMuDQoNClRoZSBtYWluIGlzc3VlIGhlcmUgaXMgdGhlIHdheSBfX3BhKCkg
d29ya3MuIE9uIFBQQzMyIF9fcGEgPSB2YSAtIA0KUEFHRV9PRkZTRVQsIHNvIGl0IHdvcmtzIGNv
cnJlY3RseSBmb3IgYW55IGFkZHJlc3MuDQpPbiBQUEM2NCwgX19wYSgpIHdvcmtzIGJ5IG1hc2tp
bmcgb3V0IHRoZSAyIHRvcCBiaXRzIGluc3RlYWQgb2YgDQpzdWJzdHJhY3RpbmcgUEFHRV9PRkZT
RVQsIHNvIHRoZSB0ZXN0IG11c3QgYWRkIGEgdmVyaWZpY2F0aW9uIHRoYXQgd2UgDQpyZWFsbHkg
aGF2ZSB0aGUgMiB0b3AgYml0cyBzZXQgYXQgZmlyc3QuIFRoaXMgaXMgd2hhdCAoYWRkciA+PSAN
ClBBR0VfT0ZGU0VUKSBkb2VzLiBPbmNlIHRoaXMgZmlyc3QgdGVzdCBpcyBkb25lLCB3ZSBjYW4g
cGVyZmVjdGx5IHJlbHkgDQpvbiBwZm5fdmFsaWQoKSBqdXN0IGxpa2UgUFBDMzIsIEkgc2VlIGFi
c29sdXRlbHkgbm8gcG9pbnQgaW4gYW4gDQphZGRpdGlvbm5hbCB0ZXN0IGNoZWNraW5nIHRoZSBh
ZGRyIGlzIGJlbG93IEtFUk5fVklSVF9TVEFSVC4NCg0KDQo+IA0KPiBUaGUgY2hlY2tzIGFkZGVk
IHRvIF9fcGEgYWN0dWFsbHkgZG9uJ3QgcHJldmVudCB2bWFsbG9jIG1lbW9yeSBmcm9tDQo+IGJl
aW5nIHBhc3NlZCB0byBpdCBlaXRoZXIgb24gNjRzLCBvbmx5IGEgbW9yZSBiYXNpYyB0ZXN0Lg0K
DQpUaGF0J3MgY29ycmVjdC4gSXQgaXMgdGhlIHJvbGUgb2YgcGZuX3ZhbGlkKCkgdG8gY2hlY2sg
dGhhdC4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBJIHRoaW5rIDY0cyB3YW50cyAoYWRkciA+PSBQ
QUdFX09GRlNFVCAmJiBhZGRyIDwgS0VSTl9WSVJUX1NUQVJUKSBhcw0KPiB0aGUgY29uZGl0aW9u
LiAgQ291bGQgcG9zc2libHkgYWRkIHRoYXQgY2hlY2sgdG8gX19wYSBhcyB3ZWxsIHRvDQo+IGNh
dGNoIHZtYWxsb2MgYWRkcmVzc2VzLg0KPiANCj4gVGhhbmtzLA0KPiBOaWNrDQo+IA0KPj4NCj4+
IE9uIDIwMjEvMTIvMjUgMjA6MDYsIEtlZmVuZyBXYW5nIHdyb3RlOg0KPj4+IFdoZW4gcnVuIGV0
aHRvb2wgZXRoMCwgdGhlIEJVRyBvY2N1cnJlZCwNCj4+Pg0KPj4+ICAgICB1c2VyY29weTogS2Vy
bmVsIG1lbW9yeSBleHBvc3VyZSBhdHRlbXB0IGRldGVjdGVkIGZyb20gU0xVQiBvYmplY3Qgbm90
IGluIFNMVUIgcGFnZT8hIChvZmZzZXQgMCwgc2l6ZSAxMDQ4KSENCj4+PiAgICAga2VybmVsIEJV
RyBhdCBtbS91c2VyY29weS5jOjk5DQo+Pj4gICAgIC4uLg0KPj4+ICAgICB1c2VyY29weV9hYm9y
dCsweDY0LzB4YTAgKHVucmVsaWFibGUpDQo+Pj4gICAgIF9fY2hlY2tfaGVhcF9vYmplY3QrMHgx
NjgvMHgxOTANCj4+PiAgICAgX19jaGVja19vYmplY3Rfc2l6ZSsweDFhMC8weDIwMA0KPj4+ICAg
ICBkZXZfZXRodG9vbCsweDI0OTQvMHgyYjIwDQo+Pj4gICAgIGRldl9pb2N0bCsweDVkMC8weDc3
MA0KPj4+ICAgICBzb2NrX2RvX2lvY3RsKzB4ZjAvMHgxZDANCj4+PiAgICAgc29ja19pb2N0bCsw
eDNlYy8weDVhMA0KPj4+ICAgICBfX3NlX3N5c19pb2N0bCsweGYwLzB4MTYwDQo+Pj4gICAgIHN5
c3RlbV9jYWxsX2V4Y2VwdGlvbisweGZjLzB4MWYwDQo+Pj4gICAgIHN5c3RlbV9jYWxsX2NvbW1v
bisweGY4LzB4MjAwDQo+Pj4NCj4+PiBUaGUgY29kZSBzaG93cyBiZWxvdywNCj4+Pg0KPj4+ICAg
ICBkYXRhID0gdnphbGxvYyhhcnJheV9zaXplKGdzdHJpbmdzLmxlbiwgRVRIX0dTVFJJTkdfTEVO
KSk7DQo+Pj4gICAgIGNvcHlfdG9fdXNlcih1c2VyYWRkciwgZGF0YSwgZ3N0cmluZ3MubGVuICog
RVRIX0dTVFJJTkdfTEVOKSkNCj4+Pg0KPj4+IFRoZSBkYXRhIGlzIGFsbG9jZWQgYnkgdm1hbGxv
YygpLCB2aXJ0X2FkZHJfdmFsaWQocHRyKSB3aWxsIHJldHVybiB0cnVlDQo+Pj4gb24gUG93ZXJQ
QzY0LCB3aGljaCBsZWFkcyB0byB0aGUgcGFuaWMuDQo+Pj4NCj4+PiBBcyBjb21taXQgNGRkNzU1
NGE2NDU2ICgicG93ZXJwYy82NDogQWRkIFZJUlRVQUxfQlVHX09OIGNoZWNrcyBmb3IgX192YQ0K
Pj4+IGFuZCBfX3BhIGFkZHJlc3NlcyIpIGRvZXMsIG1ha2Ugc3VyZSB0aGUgdmlydCBhZGRyIGFi
b3ZlIFBBR0VfT0ZGU0VUIGluDQo+Pj4gdGhlIHZpcnRfYWRkcl92YWxpZCgpLg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPg0K
Pj4+IC0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggfCA1ICsrKyst
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+Pj4gaW5kZXggMjU0Njg3MjU4ZjQyLi4z
MDBkNGMxMDVhM2EgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Bh
Z2UuaA0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgNCj4+PiBAQCAt
MTMyLDcgKzEzMiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcGZuX3ZhbGlkKHVuc2lnbmVkIGxv
bmcgcGZuKQ0KPj4+ICAgICNkZWZpbmUgdmlydF90b19wYWdlKGthZGRyKQlwZm5fdG9fcGFnZSh2
aXJ0X3RvX3BmbihrYWRkcikpDQo+Pj4gICAgI2RlZmluZSBwZm5fdG9fa2FkZHIocGZuKQlfX3Zh
KChwZm4pIDw8IFBBR0VfU0hJRlQpDQo+Pj4gICAgDQo+Pj4gLSNkZWZpbmUgdmlydF9hZGRyX3Zh
bGlkKGthZGRyKQlwZm5fdmFsaWQodmlydF90b19wZm4oa2FkZHIpKQ0KPj4+ICsjZGVmaW5lIHZp
cnRfYWRkcl92YWxpZCh2YWRkcikJKHsJCQkJCQlcDQo+Pj4gKwl1bnNpZ25lZCBsb25nIF9hZGRy
ID0gKHVuc2lnbmVkIGxvbmcpdmFkZHI7CQkJCVwNCj4+PiArCSh1bnNpZ25lZCBsb25nKShfYWRk
cikgPj0gUEFHRV9PRkZTRVQgJiYgcGZuX3ZhbGlkKHZpcnRfdG9fcGZuKF9hZGRyKSk7CVwNCj4+
PiArfSkNCj4+PiAgICANCj4+PiAgICAvKg0KPj4+ICAgICAqIE9uIEJvb2stRSBwYXJ0cyB3ZSBu
ZWVkIF9fdmEgdG8gcGFyc2UgdGhlIGRldmljZSB0cmVlIGFuZCB3ZSBjYW4ndA0KPj4=
