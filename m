Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A883C527654
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 09:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1FCX4W8Mz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 17:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1FC3073wz2xn8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 17:59:11 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L1FC27202z4xYY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 17:59:10 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4L1FC26yHgz4xYX; Sun, 15 May 2022 17:59:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::623;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4L1FC25DMCz4xXS;
 Sun, 15 May 2022 17:59:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx8I/cNTrihfnN33OqxmKTCJwcJvZiUDc6P+u/nR3ul9xntscgb/KI4r0hb91SKluOCGM/TIno2HBgks6g1LkwQU6E+A89cHBofMnX4P4aEitcwacI5EtUbTs2dKjp6cpvZYtq8FNB5cjn/rj3LuL4O2CRhtjtxHQwkZ+vDqtYpHEokPxaFcTaKdHr+K6Fqq4NjObhNrvqRVrzPMOwSs7ThS4tOhCwFp1PU/JSpFvIJGAuJsFJhmwBo/EEN8T62L8Bnh8EW5kgSD9230/vq1Qo6auLMGI1GqxTJg0oRRe2v+SD3yNPlvukpmssKOKZ0qcuIpL9kOvkW2DKwa3WS+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN/+7IDyqeMj1o6nSeUqEG9qLT0MBZnBVXZEDaSfj54=;
 b=TJa/dZLdwo/iK1dOHYufy7DRl8YdsSxxcOY0eGFi1r0vuxgujvG5GmOrCOcQB1EADMCs+4tgHe6BvBMGZY9Hr+5abPYdWC4o5wu4M+yVxRrX8AHoONXrFjz3si8/wWPnFvh0dGSWDrdjjA0vgiEwDNfzGvP3q9h6OmoJWwUA6EOYFKcYRAZi/t7ybfwygCsCY8bLjDxaZf4AaHUducuA1HqzZDi1PCFktY8BW0ieS0TBmbYhSKSR07Emva8w4H5ZCGqTzqGkV2rTMGlHCpJEeRWzvg02thDE6XbsZk/ilFDkAbJyv8imxxUpr1FSWXXjxQRGjNWtunfg/EHFHnQG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2474.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Sun, 15 May 2022 07:59:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%6]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 07:59:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Mackerras <paulus@ozlabs.org>, "linuxppc-dev@ozlabs.org"
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH 0/3] KASAN support for 64-bit Book 3S powerpc
Thread-Topic: [PATCH 0/3] KASAN support for 64-bit Book 3S powerpc
Thread-Index: AQHYZQkPL8Redqv/x0KVTzAYTeNUta0fmTUA
Date: Sun, 15 May 2022 07:59:03 +0000
Message-ID: <cc26b703-c9e7-ec58-de6c-8feb3fd37947@csgroup.eu>
References: <Yntk7oERGce44+Sd@cleo>
In-Reply-To: <Yntk7oERGce44+Sd@cleo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ca226c9-277f-4d99-cb93-08da3648c717
x-ms-traffictypediagnostic: MRZP264MB2474:EE_
x-microsoft-antispam-prvs: <MRZP264MB24745ACA78A3D00988D63C3CEDCC9@MRZP264MB2474.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDGsxdGQsYKbA1oPHaqQ9sLR0dzOCBbTcB/x+E42EAZ99rjCsiC9YRpDZLZZq6Rzu/pxyYbbaZeitq6aanb0ap/26L1538YSJH1KDSC9llaeIO7uobICpwomQG59LH+6f62PLLU/7/y8Ps/e27JnLjOa9q1WSvrHnJDdJ8iCakOh7j+gtAA095ugjBlYjGXHQT221ctrxoZhFDQvpOMAcQObcG0Dp7uup4COQuv6uFw7HAP4Vzpe8H+tTv1SdVfWF+SJoLImoaiaMQKzOQ7n/eKWrWNKCGhvUi2e/387TCg7RywosttAy3/eAtXYvKLfaiKBjfM6esTZyfJhvfbC8AbAGyPKbnYQoC+8ExhYcvyDgkJyk5xxfuK48XibCm1xbEzenzNZ8rCrxIHPZQ3Yy+szZRNFgdeRQn7v00EY95Ifu8F8HakJCUhxknbgucBC5z5J2SjN55S+sXoI9SFFy8RiRhH+FD0JPVFu1VjJDFzWeXktOd4Y2IrxeHRe0ClxMaqbbqJ1kPA0w+c9sls/t84UveeOiRLpyDe8Yd3oqcIU28KP59SmJnVuBGA92XPwPfbpvUuSblV90ZpheKMeEqxMfzDlTrkdf7P1XB0cowjnrRVBOv5A0LycaWCKkuPBGHibdt5MbOZyH/PtP5jMAU4Oi9XDKwDnozwlHZcHI5F/KitSDiye+hz/K1XXQZOXVe9B85ot0GzzSdUQkWgtaVBiAh3Cr6oq6dHnnOjlPZpCqy6wMHf9Y8os4QE3azO6cR28Xqu0VmdA3OCXLBkP7syky/SEt4e73pyOYY9zB0eFT0kIiN5SAUuCZ0jCtAna1FsDxZFhGqb2sXstTb8QvV2x/idmWG232ijJUXTiRN4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(186003)(31696002)(86362001)(26005)(8936002)(38070700005)(38100700002)(5660300002)(44832011)(966005)(6486002)(508600001)(36756003)(316002)(83380400001)(66476007)(66946007)(66446008)(64756008)(66556008)(76116006)(450100002)(91956017)(8676002)(71200400001)(6506007)(2616005)(110136005)(31686004)(2906002)(122000001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXROS0ZYQ0RvQTAvdloyYThjeEF2aStFaUR0VjBHM2d4dUtLZklzZDZUNDVB?=
 =?utf-8?B?RmZWN2ViUkVGV3FFNmtTRjR5WStFUVdqdkJkcEFUcWJYZ1dZTW9yaW5ua2FZ?=
 =?utf-8?B?NUZRV1YzNWxVTEZ0dnAyWXRwMlhkdnkyR01LT0lEMmhORGFIUGtteFU4S3Ny?=
 =?utf-8?B?cFZkUVFMT3hHZXlsNDNlVVRPaHR6M2c4SEFGVUxyMEtPM2NvdmN6RnNmWkNC?=
 =?utf-8?B?dUZ2T29scm13bmg5OWE2bExJek5lUUJGRkQ4R0VSL0E0b2RVL0V3SFliM1Ev?=
 =?utf-8?B?ZFl2VUw0bnVzSmJESy93Y29kTnZ4N3ZmcHRtdmJ3SUN4SlpHNm9nTVdINHVh?=
 =?utf-8?B?RHpEU2N6UzcwbW5DN3lrK1E2L3FUTTNyTzc2eUxscU1nWllEZm5wK2xUODRt?=
 =?utf-8?B?bHpBMkJPL0JBY1pyQlhEeEFZdE9xam1kYjZUbHZuVGlBQWdrTTdsRFdXaU5C?=
 =?utf-8?B?cUloaWFUWGFuVUdrZEgrUm1RT1FPQ3hwbTBMZHEwOHNCbUJSSXgrV01XRE1O?=
 =?utf-8?B?OFZMV3E5UkhiOUpqRjd4NTNWdUMvMEpmZyt0K3RxTzRlRmgzdmRnR3hVbThN?=
 =?utf-8?B?Z3Q3RytKSHp1NUd4eVZOMTBXNzZGVzhZNFZwdFpVSFpZNHhVK0plN3JHMVlM?=
 =?utf-8?B?a25CUWphQkFiQmlnUE54Vi8vS3EyMksrNDE4dDIrVHRHZ2JHVGQwWmxUMFM4?=
 =?utf-8?B?OVBLaW5CSlZyUGllSmNVM0NROUlxQ3NOSkgvMFdLNklOOWtmeDlyZnd2YVhG?=
 =?utf-8?B?UGw0WFBWWFNFNStDVHdDVWtuYkUvR2lWMElxSUwvalhvSnlSZk9HbXBQZUgy?=
 =?utf-8?B?QXA5VWpsWW5BWFJGbmZta1ZNSndBTXFZeDJiUjU3S0p2RVNPbjJlbE43Zy8v?=
 =?utf-8?B?SSsyVW5vNlZDbU11d0QyOEFoQXI1WnltZFBXSE1WN05GUFBKTUJwZ2RaSVhN?=
 =?utf-8?B?REphaHhodWpUeEx2bm1mR1BHNlYzMFluS2l3Zlo4OXFFY3NEbkt0cTRKTUZ6?=
 =?utf-8?B?OUZrTHpmUjFHelM4S0pSRzVORk9tcEtXMmhrTEh5czdsYmpvMjR0N1BQK0ht?=
 =?utf-8?B?YTFNaUVVSmVRTjRkTms4YTlpSUYxZEZObzZMaVdZUjAxRGZjSU13a2lMRnBB?=
 =?utf-8?B?WkJpbHdMOXRmNDFOWXJKRGtoeHFnNnRUUHJUWmozekdOUkwxc2xkODdmeUNw?=
 =?utf-8?B?UjNlbTRsbVhYOG5ZZzNBNlRRYjg1bUlWYUhBUkZFU1lKWDJTRWtZcTBxWXlp?=
 =?utf-8?B?Y1VtRCtac0crUDdlMGliN1lsV3Fqb2N1bWRpbWxVeUs0bE5HYUFxZGdQeGdk?=
 =?utf-8?B?Vk9aZVpQRk9JRUl6TFFlLzhJc29pS0RjckNHd2UzTzVGMG5VTkdVNXlDVS92?=
 =?utf-8?B?SGRNU1RkWWRBcUZDR3FMTHI3clZLbzRLejI3aG1BQ005aS9GZVozTE9LRWpn?=
 =?utf-8?B?VmlLaDVDaHd3Q243VGNwTmlkaWlRdjRIKzJzWVpXN01lTldGMC9SeHEzTHIv?=
 =?utf-8?B?VGp2SVlTWnkrdGtwY0tPa0MyUXhMaEZPT2J0NFhHb2Y2WUQrRUlZVUVTUHhl?=
 =?utf-8?B?SjBPMlpjNkg2djYrV0VJMXZqdkRVTnZWdGQvSC83TlVYdjlZcmtsdFE4K3BN?=
 =?utf-8?B?enYxZHdDRUE0cEZKQWwrcVBHL2pxek5NWEEwd3AvZ010L0lqd3EvekNIL21E?=
 =?utf-8?B?UmJBNFNjMUplbHBjSTJlOFFOdldjTVJuYU82d1NIUytSeU5wZWduSUR5NjBy?=
 =?utf-8?B?RnBIN21DNWZqSmFRYzlBTTNod25vV2V4TkszcDRHNGRvaXRWUEtjMzZ5VVZq?=
 =?utf-8?B?RU5TVkZOcUErejV1cUlYSm16UGUzbkZway9sNFBSMm5xSFJ5N1BHOGhxNklo?=
 =?utf-8?B?V2wrMG0vTHBjTVVKVVlmU1EzM3NOdXlkYzlLWDd2bU5QVnhxNjdlOU9hM1FU?=
 =?utf-8?B?K1YxSE54OTFIaTRqR3VFWnN1R0szRUxtWFoyVXJKcTJiVnRzVWVDVVN1bFNK?=
 =?utf-8?B?Tk5mOXNtOWlHbGlBLzdUaW9Ock5IM1ZhQ1hPRFFBUWdkUGZ3VkpTMjZTZkdi?=
 =?utf-8?B?ZTBuVkVGbXJ6UC8wOWpYcVJ3ZXB5QVlMTERtRVcwajFXdGRhUCtKQ1pTbTIr?=
 =?utf-8?B?RDJmYVJ2NXdCVnhhRzdRS0lSMmtGa09kLzNsdTk3S044dEs4WmN2MnJWd2h0?=
 =?utf-8?B?SHc1OUR4d0VWNFVTWWROR216SlZYRDNSa0F5SlZzejdkVWp2RExWRUVWS085?=
 =?utf-8?B?RlVzVGpxYjJwcTBjOEdiVjIvY3l0RGsvWDl6WEp4YmlEOThkd1pTa2gvSmZt?=
 =?utf-8?B?aVQ4aWFsaXVwaU52Z3JJS0k3V2x6Z0FSWFNvY3k2QUtxelBlaG5ndlQ5L3lT?=
 =?utf-8?Q?tERyERdLnGNa4Xe6nSThbTzEXLUv12x/dzRxo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA9BF8F0172B274B90F83AA9A38C1902@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca226c9-277f-4d99-cb93-08da3648c717
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2022 07:59:03.1504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hbrC64sFekK6S9bhAK974f3YAWUDIWl7oImT+5hP3cRfACsrLzHt6go6tskdMkZz8G25aGJ3itGwNNxSQuDZRNFNO2Di1YQjX4qKY0aizpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2474
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

DQoNCkxlIDExLzA1LzIwMjIgw6AgMDk6MjUsIFBhdWwgTWFja2VycmFzIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGxhIHBhcnQgZGUg
cGF1bHVzQG96bGFicy5vcmcuIEQ/Y291dnJleiBwb3VycXVvaSBjZWxhIHBldXQgP3RyZSBpbXBv
cnRhbnQgPyBsJ2FkcmVzc2UgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uLl0NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVudHMgS0FTQU4gb24gNjQt
Yml0IFBPV0VSIHdpdGggcmFkaXggTU1VLA0KPiBzdWNoIGFzIFBPV0VSOSBvciBQT1dFUjEwLiAg
RGFuaWVsIEF4dGVucyBwb3N0ZWQgcHJldmlvdXMgdmVyc2lvbnMgb2YNCj4gdGhlc2UgcGF0Y2hl
cywgYnV0IGlzIG5vIGxvbmdlciB3b3JraW5nIG9uIEtBU0FOLCBhbmQgSSBoYXZlIGJlZW4NCj4g
YXNrZWQgdG8gZ2V0IHRoZW0gcmVhZHkgZm9yIGluY2x1c2lvbi4NCj4gDQo+IEJlY2F1c2Ugb2Yg
dmFyaW91cyB0ZWNobmljYWwgZGlmZmljdWx0aWVzLCBtb3N0bHkgYXJvdW5kIHRoZSBuZWVkIHRv
DQo+IGFsbG93IGZvciBjb2RlIHRoYXQgcnVucyBpbiByZWFsIG1vZGUsIHdlIG9ubHkgc3VwcG9y
dCAib3V0bGluZSIgbW9kZQ0KPiAoYXMgb3Bwb3NlZCB0byAiaW5saW5lIiBtb2RlKSwgd2hlcmUg
dGhlIGNvbXBpbGVyIGFkZHMgYSBjYWxsIHRvDQo+IGEgY2hlY2tpbmcgcHJvY2VkdXJlIGJlZm9y
ZSBldmVyeSBzdG9yZSB0byBtZW1vcnkuDQo+IA0KPiBUaGUgbWFpbiBwYXRjaCBpcyBzdGlsbCBt
YXJrZWQgW1JGQ10gYmVjYXVzZSBvZiBrbm93biBkZWZpY2llbmNpZXMsDQo+IHNwZWNpZmljYWxs
eSB0aGF0IHRoZSBrZXJuZWwgd2lsbCBjcmFzaCBvbiBib290IG9uIGEgSFBUIHN5c3RlbSwgYW5k
DQo+IHRoYXQgb3V0LW9mLWJvdW5kcyBhY2Nlc3NlcyB0byBtb2R1bGUgZ2xvYmFsIGRhdGEgYXJl
IG5vdCBjYXVnaHQNCj4gKHdoaWNoIGxlYWRzIHRvIG9uZSBvZiB0aGUgS0FTQU4gdGVzdHMgZmFp
bGluZykuDQo+IA0KPiBDb21tZW50cyB3ZWxjb21lLiAgSSBtYXkgbm90IGhhdmUgYWRkcmVzc2Vk
IGFsbCB0aGUgY29tbWVudHMgYWJvdXQNCj4gcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhlc2UgcGF0
Y2hlczsgaWYgc28sIHRoZW4gcGxlYXNlIGp1c3QgcmVwZWF0DQo+IHlvdXIgY29tbWVudHMuDQoN
Ckxhc3QgcGF0Y2ggaXMgcXVpdGUgYmlnLiBJIHRoaW5rIGl0IHdvdWxkIGJlIHdvcnRoIHNwbGl0
dGluZyBpbiBzZXZlcmFsIA0KcGF0Y2hlcy4gQSBtYWRlIGEgZmV3IHN1Z2dlc3Rpb25zIHdoaWxl
IHJldmlld2luZyBpdC4gSSB0aGluayBpdCBjb3VsZCANCmFsc28gYmUgd29ydGggcHV0dGluZyBh
bGwgdGhlIGFkZGluZyBvZiBub19pbnN0ciBhbmQgS0FTQU5fU0FOSVRJWkUgOj0gbiANCmluIGEg
cHJlcGFyYXRvcnkgcGF0Y2guDQoNCkFsc28sIHlvdXIgbGFzdCBwYXRjaCBpbmNsdWRlcyB2MSBv
ZiAicG93ZXJwYzogbWFrZSBzdGFjayB3YWxraW5nIA0KS0FTQU4tc2FmZSIgDQooaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIxMDUyODA3
NDgwNi4xMzExMjk3LTEtZGphQGF4dGVucy5uZXQvKSANCndoaWxlIHYyIHdhcyBtZXJnZWQgDQoo
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8y
MDIxMDYxNDEyMDkwNy4xOTUyMzIxLTEtZGphQGF4dGVucy5uZXQvKQ0KDQpDaHJpc3RvcGhl
