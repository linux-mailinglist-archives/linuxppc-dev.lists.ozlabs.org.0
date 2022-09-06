Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E45ADFA4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 08:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFZf3Lp4z3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:18:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ixf5QNRW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.59; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ixf5QNRW;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120059.outbound.protection.outlook.com [40.107.12.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFYt6L2Mz2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 16:18:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKGNhKoG3w6AMtZnOkt7LESn32ZTa4H7hPeKywZA/eUTiLFsAnp/De18RN9XWpoRJI2PFg1RaocOlgYWGBShwpWtCdT53zHV9pyEfJgwIaK7MP4QxNu2RLsNg66J7+JIAu1pGOomBAHMQ7wLUyFi9Cc9aDIj48o5dxpQ9T7tL2s7YdLzHNYIFBqRQjyXBaAsxAGrPUpgWLIDJGcQNygK4wLAnVnjSKHZe6/n7Zqz7HGNCT/7f3PCvBYk5qcj8REXVQ+tJZpodpwAiOpI0drn39RMNEJLpBpA9YAWN/lIg3jtGeBfhiE923v4+MfdWEPI4jcuDd4BWBORZVhoLGzx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9noVwdRcaxNOYn469NY70f14K1IoVFpnkiSB7wZuV2E=;
 b=EYBtJR4ouyj9qCC3LxN2m0WU7OJrq9mOlxM+4KbV6FdPQXasZGXlLiIwr5rGKHOM7Ny24Kbn+NUgVupV/lDdS+1d6YEG73JMKdHf1O3hAqcplzeBDEzM2jjGJo++nPHBTPXdgGnj0JAIq46dfyzQEB6EOvgMY4MioJeC31lYcDKWlgnwzTHvhJKcsk+/xJCp5efoA+uKR1089kDTQYKUCy1SUkeicT/91olWAIPCo8JRPdsIA0WNjMaKnWPuj9XYEt3bt0IgzPKhXCHLc9uHBwbVO9urhehGfDJ6hxIGl+kNLbkiO5EYurr8PrRGTOfCfK4DSxb4gTbhwAqgiDhrfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9noVwdRcaxNOYn469NY70f14K1IoVFpnkiSB7wZuV2E=;
 b=ixf5QNRWk1QSB3o6dCcuO+JA141OVEqhJa/anUsPz+i/uKI96n81CuDRTrEVGH3Pmdy6Rm7NRu+sYDXdC/9jFgXJC1o77Ib82GR3c0xtwaMmAi5AVJmTTL1gqLBWLS9J9qAQ0U4D3G9nWV94YjASCy2kkuxAyCnAlkH6bg/U558ii0nmNgBgbl0nhyC9mbqhQDQ/Kf9tNRJk1aW7JvelJ/3Vr3ikwESXun9WW+c7sRcBvTxVXUqJr/UtIvu52yDOWE6mGVTftO6w7mrgFrfI3tIw6ML55dldEgI1VOIcCCRHeZSFvW4BMeOILcVMe6DtY0WDk5sCxMj3/H298Gjd0Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3423.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 06:17:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 06:17:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/pasemi: Use of_root in pas_pci_init()
Thread-Topic: [PATCH] powerpc/pasemi: Use of_root in pas_pci_init()
Thread-Index: AQHYwYyNRCp8UAnaQ0mD8qcb2+W4HK3R7awA
Date: Tue, 6 Sep 2022 06:17:49 +0000
Message-ID: <ebe8fdbb-c707-eb18-eef2-c37208642a77@csgroup.eu>
References: <20220906010313.1296714-1-mpe@ellerman.id.au>
In-Reply-To: <20220906010313.1296714-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f125245f-2d3d-42c6-1c97-08da8fcf85e1
x-ms-traffictypediagnostic: PR0P264MB3423:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wZ3hmcCFYFyPOOw4kC223Q7m2nNngKJ1uuDMGRd2ivDBYJqZq0lYQJ/49XqNUzUCalk7d+cDbeNd0XVfNjFptd33Mw+qOQzTKIccnrZ9l+/1z1+xnNHUudLw1J43COys5iE80UnTWvD912E6Bxbzg0gGAzSanXm1dc4kV1uhpALTwdRzXxqRXICEJ3CaOWJ10CuZnP5dynxJ5U/yv8JXd39AcnmHf7M+n0Wz+W4Ar6U2WFqyoegiub2P4H5iKp6Zb4eSSIeT34VQdBMbPp+AngrBuk7NdGGBc+I4otdDMYS0ikelwDeEYujYVhsgcDb/PE4zGv9WBp/YMGHx/TRJALwQsqgd044KkHDbZ2vdNbjeQ5sv1KC4oW1zazC7VwzZDExHnVhlWxbCVtmDlH85wLavNQnuZUmD3ctSIgcTVruI8777g+FJuCxw/+N/rFDN7b3N3bQFynD36D4p+ixM0LdKj9dRYflHVggPowJkF8sNrEhdc5aLJ9EnfJM+Bq0GKv9Fc8DCmmsazhJlWd9+7nDS6VXn50R9spunstGnCnlyydn8SskE+HNEMU2bmBVNhFjO/CU0NiZgvlE+YW8jrMFXH6C2H+McFPr0OHtX5M7IVxKR4IlBuITW7cGMWnlUyCrqVcq5PNWrChhp+q4oexCE5NvHKYnV0Y2i97CQ1UrrdRO7oP9qhQB734vOK2xNyObf+9Gjzn6SSz97ppEJ/IthZEfrV9O0q5Q/4K08rAmjMz3nPRCLm2OCdm+9kiizUbCyPyYbcYPg4QNFPJnVKWvr7099/SRsgFATJxSJ7W5lMHOt1Mm1L4kI8512LXhXIai1W42q8z40f2NqGWX9qg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(186003)(2616005)(41300700001)(71200400001)(31696002)(478600001)(6512007)(6486002)(26005)(38070700005)(6506007)(38100700002)(122000001)(86362001)(5660300002)(83380400001)(316002)(44832011)(2906002)(110136005)(64756008)(8936002)(8676002)(76116006)(91956017)(31686004)(66446008)(66946007)(66556008)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?czNyS1lhRGJHcXRxdVJkRWdBak1CaTJ2dGVnTVZCY2p1VEhHQlVuQjY4NXJs?=
 =?utf-8?B?QTFWZzQ2bW5JWUIxdmJpWHhCRTNVV3JQMzNZWEVaRWx2TmRnNFBvZ3BQS1h3?=
 =?utf-8?B?cUVpclRpb3R1REFJY2s0blNlb25Nc0NsejNYNDh0S2plMzc3ZTVuVm5Pbk1W?=
 =?utf-8?B?RHJjU3RRNmNlc2planU0UzBRV0R4cWN2Sjk5YVg5WkhDMC82aFFkT0dkNm5O?=
 =?utf-8?B?aGFGMDlRR3B1bFZOS3ZMbmlOemZDcEhJTDVheE5KWWN0WXgxS3Z6Q0xCZWhq?=
 =?utf-8?B?THdKdDY4UFZSdE93a1Y2QXlIUk45RTlHQ3Rhb3dVS0ttdC94QXRhYjlFK2dz?=
 =?utf-8?B?SjBhQ2Q5aml3OGg0NnA5Q2JRYU0zcWJxVVAzbVhXa2tHY1JGcjNuWVdJNDNU?=
 =?utf-8?B?MVp6NnBidVk5THBDY0RtMXVvNzNVUEwwd01kTmpEdVF1dHFqVlRia0FuZ2RS?=
 =?utf-8?B?M0N6QjNnLzYzTndoOTdJcFVGWGdxRlR2NzhUa0VoWGZzOENqRTRWdmQxN0Rv?=
 =?utf-8?B?cDBBTlFLbnpvSjVleHhVL3pkbGx6UzRhZHdXU2s5bWJmdjRlSThQaDM4ZUVp?=
 =?utf-8?B?MGd5TDV2TVJJWDNnQ2ZUMDl1Wm85M0pjZFpDYllRVXpScm4zZkdSdzZNbk9R?=
 =?utf-8?B?WkZNYTJNUW1KRmxBNW9zOWJ2VTFEWVV4cXNUUnc1eFRxdElmVS9YZlRRbC80?=
 =?utf-8?B?ZGNDSnN5OUVhOG9yQkNpbDdjUTlUVHRLQjFFWWVsNjJFQ0hDcHhJb3B3dWIz?=
 =?utf-8?B?N0k2NFFKclMwaTc2enEwL21BakFWZ2dNM2tyR3RzdTc0N3p6Q1hVakdBb0JN?=
 =?utf-8?B?VjhGVHFobGdGclVMaC84b3FaRFBCNDNrcEpaWWJmK2dsKzRZTFlLeU9UV1Ra?=
 =?utf-8?B?bnZVck1UNHZzcUcvaUFHQW1OK0V2TlBsbXdDQXN3N3p3ZUVTNG0yZ0sxbTVM?=
 =?utf-8?B?Q3dGeSt2M2RDcEVyaVRZU0I5UzlTVWNIbVpKSjhPYVlQb25ZVGZwSndKUTBJ?=
 =?utf-8?B?dVBrSEZNWm00TU5QRnZpd3JvTmJ3REJjTlRSK01qWVNJb0NlNjMyS29Rckty?=
 =?utf-8?B?N1h0bHp2R0xVNnZqU2tvMXV4eEhtZnZUV2NDY3BycHhGU0hUeFEvMVk2S3V3?=
 =?utf-8?B?ZHhTUm4zNTk5N0lWMERRNWo1akdIYXo4bzFWK0g2UWx3QkFCMllNZUFDQWJk?=
 =?utf-8?B?bzlWTVJOUHpGTTE0U0tqMXM3U3VtL0tPZVFmNGlnRkloS2tqcEYvc1NxQnNE?=
 =?utf-8?B?NmtXWmtmS3hNQUFoQWNvKy9zUW9nNE9wSjJueUo4YVhXRVc3L0MyOXJMcnA5?=
 =?utf-8?B?Nk9qeENhcG52ZXpNaWxGRGJHMm5VODdJZnUvakE5YURMQ0NIdFdkZ2Y3VE9G?=
 =?utf-8?B?OHA1QzhHR1dieFJNeVdzQXExakZqVTlTeTBocHFQMUtPdENtdGt3WkwrdWdu?=
 =?utf-8?B?c2xqQjVONDVGNHVmMTAza3ljUUpwb2w3dEp4V0ZmaURkTlRjT3lud2puMzZh?=
 =?utf-8?B?N0ROWEkzREdIWHVBc0REdklKcEhVK3lhbTNtK3l4YStUdExucS9lUE8yOUlN?=
 =?utf-8?B?QkMxRjlkUlBEZjlZRXZvd2Uvdmd6SmhoZXJtVXRFN0NSa2hhUGsyUFF1cmhj?=
 =?utf-8?B?SUxpZzhiUW9IOTU2SHVodWhLVWRhQk42V1NvQzBkajlFRjd2Yi9lMkFiRnp5?=
 =?utf-8?B?YURHWDlEanFxak1BdEVlRjBUTURid0JPME5jQlhyeGkwK3dBMFFTdTh4TWpn?=
 =?utf-8?B?QzY5OWVFdUgzMFVVRjlVdzZZeGRzM2lVYWJtU2R3UXQ0TjVUUkhLZXV2cDRK?=
 =?utf-8?B?TG9JNHVMQktFVExmN2RLRVl5cWRlMlp0S0dPRzFWSC9hRGJlU3NFZTBBNnNt?=
 =?utf-8?B?K2U4M1RnQWVwZkxVNEZEalhLMGNaWjdjSm9yQ0xwYWxnOHliM0t1UVJQWVJR?=
 =?utf-8?B?QTY5bjF6YTRTanNlRnBRbFJnVHpZbmF6NWV6eW0zbTJ2S0RPQW9vcWVzczBa?=
 =?utf-8?B?eDZ0OXIxZXRXRTh5SmVrOFloWk5zSnFDdVliWHY2a2Zzbm1Oc0JjeTI5L3ZB?=
 =?utf-8?B?WVBFL2Y1cmFCWExKZXRjcS92RmI1aUkyemV2aVNsdGhYcHVZZTVTVENxbDRD?=
 =?utf-8?B?aHFieXk2Z0prdTh5dXk2TGRiNWQyczAzVVk1L0NjNE1MK1o3MFhzVkxMM1g1?=
 =?utf-8?Q?bhMYhiFPlrytBG9qZYrEYl4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34BD7C09950E7F4AA82C04E39C56A898@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f125245f-2d3d-42c6-1c97-08da8fcf85e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 06:17:49.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFSvPmTjAeWasuXFGrvTGHx33JzYWAQfKxPtxBCzQ5uz/G9MIaabLrIbRfXjTrDwMIX1w4VxHjiZPbYZiHqxgTghF7CygGR9XWBGBh0HBtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3423
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA5LzIwMjIgw6AgMDM6MDMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ3VycmVudGx5IGluIHBhc19wY2lfaW5pdCgpIGEgcmVmZXJlbmNlIHRvIHRoZSByb290IG5v
ZGUgaXMgbGVha2VkIGR1ZQ0KPiB0byBhIG1pc3Npbmcgb2Zfbm9kZV9wdXQoKS4gSW5zdGVhZCBq
dXN0IHVzZSBvZl9yb290IGRpcmVjdGx5Lg0KPiANCj4gTm90ZSB0aGF0IGNvbnZlcnRpbmcgdG8g
b2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgLi4uKSB3b3VsZA0KPiBub3QgYmUgZW50aXJl
bHkgZXF1aXZhbGVudCwgYmVjYXVzZSB0aGF0IHdvdWxkIGNoZWNrIHRoZSBjb21wYXRpYmxlDQo+
IHByb3BlcnR5IG9mIHRoZSByb290IG5vZGUsIHdoZXJlYXMgdXNpbmcgb2Zfcm9vdCBza2lwcyBj
aGVja2luZyB0aGUgcm9vdA0KPiBub2RlIGFuZCBzdGFydCB0aGUgc2VhcmNoIGF0IHRoZSBmaXJz
dCBjaGlsZCBvZiB0aGUgcm9vdC4NCj4gDQoNClRoYXQgc2VlbXMgdG8gc2ltcGxpZnkgY29kZS4g
U2hvdWxkIHdlIGRvIHRoZSBzYW1lIGluIGFsbCBwbGFjZXMgYmVsb3cgPw0KDQokIGdpdCBncmVw
IC1uICJvZl9maW5kX25vZGVfYnlfcGF0aChcIi9cIik7IiBhcmNoL3Bvd2VycGMvDQphcmNoL3Bv
d2VycGMva2VybmVsL3BjaV8zMi5jOjEzOTogICAgICAgZG4gPSBvZl9maW5kX25vZGVfYnlfcGF0
aCgiLyIpOw0KYXJjaC9wb3dlcnBjL2tlcm5lbC9wY2lfMzIuYzoyMTQ6ICAgICAgIGRuID0gb2Zf
ZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9u
LmM6MjEyOiByb290ID0gb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9r
ZXJuZWwvc2V0dXAtY29tbW9uLmM6NzkzOiBucCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7
DQphcmNoL3Bvd2VycGMvbW0vbnVtYS5jOjM4ODogICAgICAgICAgICAgcm9vdCA9IG9mX2ZpbmRf
bm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvbW0vbnVtYS5jOjQ1NjogICAgICAgICAg
ICAgcm9vdCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZv
cm1zLzUyeHgvZWZpa2EuYzo3Nzogcm9vdCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQph
cmNoL3Bvd2VycGMvcGxhdGZvcm1zLzUyeHgvZWZpa2EuYzoxNDg6ICAgICAgICByb290ID0gDQpv
Zl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOw0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3hl
c19tcGM4NXh4LmM6MTE5OiAgcm9vdCA9IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9zZXR1cC5jOjY3OiByb290ID0gb2ZfZmluZF9ub2Rl
X2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9zZXR1cC5jOjE1NDog
ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcm9vdCANCj0gb2ZfZmluZF9ub2RlX2J5X3BhdGgo
Ii8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2hycC9wY2kuYzoxOTE6ICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKnJvb3QgPSANCm9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL2NocnAvcGNpLmM6MjE2OiAgc3RydWN0IGRldmljZV9ub2RlICpyb290ID0g
DQpvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOw0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jaHJw
L3NldHVwLmM6MTA1OiAgICAgICAgcm9vdCA9IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsN
CmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2hycC9zZXR1cC5jOjIwMTogICAgICAgIHJvb3QgPSAN
Cm9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NocnAv
c2V0dXAuYzoyNjg6ICAgICAgICBub2RlID0gDQpvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOw0K
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jaHJwL3NldHVwLmM6Mjk5OiAgICAgICAgc3RydWN0IGRl
dmljZV9ub2RlICpyb290IA0KPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOw0KYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9jaHJwL3NldHVwLmM6Mzc4OiAgICAgICAgcm9vdCA9IA0Kb2ZfZmluZF9u
b2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvbWFwbGUvcGNpLmM6NjAx
OiByb290ID0gb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvbWFwbGUvc2V0dXAuYzoyMjU6ICAgICAgIHJvb3QgPSANCm9mX2ZpbmRfbm9kZV9ieV9wYXRo
KCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bhc2VtaS9wY2kuYzoyNzY6ICAgICAgICBy
b290ID0gDQpvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOw0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9wYXNlbWkvc2V0dXAuYzoyNjg6ICAgICAgcm9vdCA9IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgo
Ii8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvcGNpLmM6OTEwOiAgICAgIHJv
b3QgPSANCm9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L3Bvd2VybWFjL3NldHVwLmM6MTA1OiAgICBucCA9IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8i
KTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9zZXR1cC5jOjI1NTogICAgIHJvb3Qg
PSANCm9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bz
My9vcy1hcmVhLmM6Njc2OiAgICAgICBub2RlID0gDQpvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIp
Ow0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wczMvb3MtYXJlYS5jOjc3NDogICAgICAgbm9kZSA9
IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNl
cmllcy9ob3RwbHVnLW1lbW9yeS5jOjE2NjogICAgcGFyZW50ID0gDQpvZl9maW5kX25vZGVfYnlf
cGF0aCgiLyIpOw0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2libWVidXMuYzoxODc6
ICAgcm9vdCA9IA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsNCmFyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvcHNlcmllcy9scGFyY2ZnLmM6MjMyOiAgIHJvb3QgPSANCm9mX2ZpbmRfbm9kZV9ieV9w
YXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvbHBhcmNmZy5jOjc5OTog
ICByb290ZG4gPSANCm9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQphcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3BzZXJpZXMvc2V0dXAuYzo5NzogICAgICByb290ID0gDQpvZl9maW5kX25vZGVfYnlf
cGF0aCgiLyIpOw0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3NldHVwLmM6NDg2OiAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpyb290IA0KPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIp
Ow0KYXJjaC9wb3dlcnBjL3N5c2Rldi94aXZlL3NwYXByLmM6NzE0OiAgIHJvb3RkbiA9IG9mX2Zp
bmRfbm9kZV9ieV9wYXRoKCIvIik7DQoNCkNocmlzdG9waGUNCg0KDQo+IFJlcG9ydGVkLWJ5OiBM
aWFuZyBIZSA8d2luZGhsQDEyNi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJt
YW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9wYXNlbWkvcGNpLmMgfCAxMCArKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bhc2VtaS9wY2kuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcGFzZW1p
L3BjaS5jDQo+IGluZGV4IDU1ZjAxNjA5MTBiZi4uZjI3ZDMxNDE0NzM3IDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bhc2VtaS9wY2kuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bhc2VtaS9wY2kuYw0KPiBAQCAtMjcwLDE4ICsyNzAsMTIgQEAgc3RhdGlj
IGludCBfX2luaXQgcGFzX2FkZF9icmlkZ2Uoc3RydWN0IGRldmljZV9ub2RlICpkZXYpDQo+ICAg
DQo+ICAgdm9pZCBfX2luaXQgcGFzX3BjaV9pbml0KHZvaWQpDQo+ICAgew0KPiAtCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsICpyb290Ow0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+ICAg
CWludCByZXM7DQo+ICAgDQo+IC0Jcm9vdCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7DQo+
IC0JaWYgKCFyb290KSB7DQo+IC0JCXByX2NyaXQoInBhc19wY2lfaW5pdDogY2FuJ3QgZmluZCBy
b290IG9mIGRldmljZSB0cmVlXG4iKTsNCj4gLQkJcmV0dXJuOw0KPiAtCX0NCj4gLQ0KPiAgIAlw
Y2lfc2V0X2ZsYWdzKFBDSV9TQ0FOX0FMTF9QQ0lFX0RFVlMpOw0KPiAgIA0KPiAtCW5wID0gb2Zf
ZmluZF9jb21wYXRpYmxlX25vZGUocm9vdCwgTlVMTCwgInBhc2VtaSxyb290YnVzIik7DQo+ICsJ
bnAgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShvZl9yb290LCBOVUxMLCAicGFzZW1pLHJvb3Ri
dXMiKTsNCj4gICAJaWYgKG5wKSB7DQo+ICAgCQlyZXMgPSBwYXNfYWRkX2JyaWRnZShucCk7DQo+
ICAgCQlvZl9ub2RlX3B1dChucCk7
