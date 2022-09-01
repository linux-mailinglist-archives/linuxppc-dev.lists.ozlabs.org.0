Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D9D5A95B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJJhF5Hh1z30KY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=G2JVal2J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.84; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=G2JVal2J;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120084.outbound.protection.outlook.com [40.107.12.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJJgT1lWyz2xZ9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:27:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP81UdrYuJ1BdfkPmIGnWeTEt8XvbJKAAYd8i+3T0vhyAnPdwJyvOtBECoGlUeOWWWCNfv3eUsbgAJA+n++CsIhUKD3u44z6j5L5qrL8cmQ+kWvxhWwIh7sJZHe0YxN+TLqfgWd2UxPWr++TSZBXoNq0N9PZ+X8B98XvbmQ1ZSG5fyuwxyl+F8lwPogdgjUd7tG3cjN9VupRjgKXRv+u5Z59gVRtuzYkrUDIEYp9qGzWPZGuOIxPey+gm7Tf20O87yTQGcrAxyHEU3cz3TVKJN9EZkJ5PNELTf2rqCdUBEXgvWh9JLBZKAWYkJeSd8JFqsugoKLlZbViz3DRxDpTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkRy4uXVQIh3fFuKX25GUJY3lEYNEViUkvjU3H3VCkM=;
 b=Ws+dXngt2Sh3vNgcCeNWuxsp10obtjF2upbnm6ayLowQXrj12kgx5jTR8RlD4QTjEszrwuFPwnS3CHR00tYafGUMH9SD5SOc633HxwlLJBQTsCTlNe5eHXuD3JAFk7UHhdQCTgLsD0v+NBl9o+qghDS5dGaf6frKn1l/e0dt68zsxEYTGOoarSApDWWaxwGWwbEX0FhmnG78hVJHhDLtcEdYDGbgzZrD1aViVCaIoi32+UB7/H0U/Ewuq4e7ITw4sTFNrQm0q80qqn6D1eoBpehuqlHcy8C4xr8aguYPT3pjSJVubkfggFm8/GgBRa/EvzR07pyr+44+O36L5ggAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkRy4uXVQIh3fFuKX25GUJY3lEYNEViUkvjU3H3VCkM=;
 b=G2JVal2J+8IhjDsBtvy8wYlOZqiAiROCCIqsWctXpf9DWyFREzxG0WEn5L35PhYiz6Nle97FO9ZY3UKJtEzwpxg5E9bljuIRlAq+hLBTW0gi3H5/eLPP2i/HmwDC2AxOW+0JjqiDusV6YsTlV1PM8vU35KoHmjdbVAfK6KtIgksJJjIuhYi4JUCUd6xDpHkS67/1Bm7IFzVkRD4Lc7l6bIMHkqwXRZDOhFhG5pCzqxHwgjuTi4xfcaTnNRWZH41HNDIx9nODjzbesZynQxouXDtYWTxWTHHyU2X1PvrsaCtFWgYuaGV0FSN9B1ljwHSHR27Y+HgQ9iS7sL37gIdVjQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1894.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 11:27:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 11:27:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc/64s: add pte_needs_flush and
 huge_pmd_needs_flush
Thread-Topic: [PATCH v2] powerpc/64s: add pte_needs_flush and
 huge_pmd_needs_flush
Thread-Index: AQHYvfKCw4MsHKC32E+rTddoKBqzf63Kb7oA
Date: Thu, 1 Sep 2022 11:27:28 +0000
Message-ID: <d699b8d5-dba1-2239-4b2e-cd810dee7d9f@csgroup.eu>
References: <20220901110334.1618913-1-npiggin@gmail.com>
In-Reply-To: <20220901110334.1618913-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44bf1d34-fe1c-430d-460b-08da8c0cf40c
x-ms-traffictypediagnostic: MRZP264MB1894:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2iatz3i/ZBko2zTiNEWfD4wPuP3F/6hNFBMy606wXzQR3OmKila5ffK7GVII3o2+ev0iZZr1NhkayGD7fFsVA3/Wf5qXYXDb3iHmYuZPzYpecBypTfQHWZ4GDVO8/AjIDK21Vi1RXLHuVDWxaGLlui972Oqmijxw824S45wOrf+kCuVnJU/urUDUwgBQ59v1yFWFnlZHlVBXem/NNTVv5rIooY3vDiRoXGmS0m+YDGMXT6a4hHqbBNQO3HhecLefZQi+f2cve5mqLd8LikRhglrXWVCyIOFrqia6RwOQ2TGpgz+hHNSjcTPhMALPqCsWDPfEc6GM0Q6uiHVVeitQF8Q9HWF2xEOJpJIyhMZepvJMpy3y7e5wEScSb3M6HyxvuBeD3mnNzApC2DDeckISNS4p4crmYsfK1pF7oPF3Xs4m1SDsmsyio98d8D3Ov4ilE461rIAKm8si2RQXlHLqmhlTE/cB/qMj5+WfLQpLYhIkvrZUKRyEkut8xxXa4VysagI1iX3ZXEu/GYaUhPd5hwzWRpw5Hb4Yda9bFONbJCND26qaQyh8cXGfcSXvLA3H5jxHgMmHf74KKvvoq9r+lM1EsZMA1kSz3HUblN3HxdL6Ob3F+4hJ+s+ew2XL7eBjr5EiSuzEV2EKuOJZOiORrd099Vek5yfyhxN4v4jLWP6y4TIlkKYXRE0qbsFzPYk9H1E92RPHO/7OE5eIURL+2nrA82CHuClwbZLEAn+WaZErdaoKcVu6fbgMMEpEKOgcxUdKjDy5gqjASfAffV4xvqrZbTbzWHbmKEQA8YQm/v8ni5t9xnQzh7wtAZ/QSqBpOTNZDSPkDK8DGARK0FCza7tEKCS7Usua+5T3IG518Ns=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(6512007)(186003)(83380400001)(38070700005)(86362001)(66574015)(2616005)(38100700002)(122000001)(31696002)(8676002)(91956017)(66446008)(64756008)(66946007)(76116006)(66556008)(66476007)(36756003)(316002)(110136005)(44832011)(5660300002)(8936002)(2906002)(478600001)(6486002)(71200400001)(31686004)(6506007)(26005)(41300700001)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bkVaR3NRdUt3UldnN3k4ZXpxQWdaazBIbjNTMTRQZDgzc05Pa2lWM1NZOE5x?=
 =?utf-8?B?NVdaTlN1bVk4cFl0aWhIL2Ridm13aW9JM25wTTdyQ2Q3d09HOW9kNnVneWZF?=
 =?utf-8?B?YytnSTQwYVJnM0F0Nnd4MVg2dGxUNmcxTXgvUExtczJMRXhyRS9WdjBhV1Zj?=
 =?utf-8?B?SklSb2tTaWg4V290RHNReHRDaWRwamVzRjcrREpncDB4ZWZRbVFjc1BIQ3Iz?=
 =?utf-8?B?OWJXSHNyNFpPU28rVTFlK1VnMTIzSDZoYU1HNnh2YTdqRXhMYXM3aGVCV2dC?=
 =?utf-8?B?UzgxR0VEbW5GQUQ2YkRRQlg3NU9CTWUyZnN3RS93SXd5YU5EUmtlRlE4dERL?=
 =?utf-8?B?eVAvZ0VCM1VsTjlTdEsrSTFWRWRjUmtVZWJaaE45Vzg2d2FHcERNeWxTOWNZ?=
 =?utf-8?B?MlNlOFE2TVozNjNCWGtTZmFPSTdHdjlTS29STWg4TlJOQzBKR0pNNjROUWVo?=
 =?utf-8?B?bWJBdWVWTndMVGMwMk03VjNmS2doMHNoWW4xcWtpdEpKSFJSNjl4c2RCWk1V?=
 =?utf-8?B?a29RYVpWWFpVem5DVnk2N24yYzhFdW1uZ2NpQk5lT1djSUV2S21xR3doNjcv?=
 =?utf-8?B?YTVJSjlLeGJpQmlQYUF5R0FmcmovUnFNR051dDVrVTN6SDF5dW5leFlYRmQx?=
 =?utf-8?B?Tno3QmFvaTdLek4vOTFZWEUyY2VqWVUzeS9kU0FIblZBaHdlc3RGMFN5QUhq?=
 =?utf-8?B?bEZhWUdJeHpjMW5mTGQ1SlAvclUyQlNoR0RxY295ZUs4WUxrSkF5aUJacit5?=
 =?utf-8?B?MHBhdldrQ2pqT2xEYWJham5YSTBMTmRLLzd5b0F5MFVJRnNqMVRSZjc5Rzc1?=
 =?utf-8?B?dS9qMDBDSXdRdDRSdUk1QVkwdkJIZjgzOHJmdFA2UzVZU0xDTDFmK1hVZ0Ji?=
 =?utf-8?B?eWdualkyZjhBMWFHR3ZNcnFqOU5xaHJiOW9CYlQwRm9rYnFsSWJvMkxuMHpP?=
 =?utf-8?B?cDgyaUlEMHRWMnRjNi9WRXNMZlIzcmZUZXpWcldFYktvUnlpNFhtZ1RJYnlq?=
 =?utf-8?B?clBsekEydkRORTF1M01xdE5DOUhrS3BBRTFtbEM1dEh5VE1ScXB0TVhTNXEy?=
 =?utf-8?B?VHRxb3htN3o0UjdCdWxQVDFJV2tGRjBUeEpudTNmMFZiaGlxYU55WWJkOEhY?=
 =?utf-8?B?Nk1TSWx4NEQxNkN3RmRYWjFmN3hKWjBkWmR6Y2FremFTZWJ5VWFwK2F6YUo5?=
 =?utf-8?B?V2t0TFFUNUY2RlBoK05SRUF1U1ZCWDJtMUFRTTFDaGl4NUJ3QmdjbWgydHF3?=
 =?utf-8?B?VkdadE4zNmhGeHhwYm80dTB1b1dQYUVOQytic0tNckQxWmVqeU5DdUpRWUFR?=
 =?utf-8?B?Rld6SnZNVFVabEhKNlBrWXRMQzU1Sk5jbzJuTUZQWWtNbnRYL1dQcWZ5UlRy?=
 =?utf-8?B?aU1zTXk5ZFFOdWxVUTczdHRDbjNLZ1dZTXo0bzdHdjRXZWM1aHdtM2ZlbklT?=
 =?utf-8?B?ZndXNGRDUFJaZ05HOXNIQlYwWWNNL3V5cVZWTzVLNUpHRWtIVjk1aVcrTGh2?=
 =?utf-8?B?OThKRHpqcTVBZlo4UUc2MVJJSTNmZ1BVVzlLV3NSekNORmlGWTB1emhlaVpY?=
 =?utf-8?B?b240Qm1UdGhPVnNlR0wvN3hRVGhxd0FiUWg1UENVUGNCNTdNYldYKythRmpy?=
 =?utf-8?B?UjFNOU9jTGhqcnM0bjhid2xiWW05NlZpalVXaWRUM2ZlN2JSdTFLNlR6cEkr?=
 =?utf-8?B?RkkrTEh4ak1yc0Nadk85SmI3V2tCNkY4YzUxTHRkcitVckJKQVN4RzluZWZn?=
 =?utf-8?B?eDJKc3ExVTFGL2FTSXZWcy9xeU9adS9iZkJVQXQ5R3ZWWVVaSkZsT3k0Rmda?=
 =?utf-8?B?SGw1MVhJaWpzL0xmTlRmUGQxbGxWbnZaRWgrUy9uWENKalNjdWFIMWV5c0h3?=
 =?utf-8?B?VzhUdEZWVWNCaVVxQWUzQ0pvY1U2WkpHZmZCamVaaExIZDhUb2dKektiR2V0?=
 =?utf-8?B?RUtYUUJ0bjdIUEQwdnkxOVNRa1p2c0lDaFQ3ZGJJcHpmTmtXNTg0Z1ZtYWJH?=
 =?utf-8?B?cWR5V1Z2Smh4SmxDUEJBaXRjdTcyVndQSER5VUN1UzkrOFh1ZjJsSWR0bHQ3?=
 =?utf-8?B?VHVDRkh0RDZHU3I1eWd4Z2FITnRHUjZpM3lDMy9IbDEzV3hQM0szQjkxM3Uy?=
 =?utf-8?B?bUVHOERLakJLbnN6NzUrT0VKclp2a1dmWXYvYXM5WExCQlJlQW8rSE1SVmJx?=
 =?utf-8?Q?ni/OF6QcbVguFR4LbSVmJLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59F3675593802E4795B30650C013EE73@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bf1d34-fe1c-430d-460b-08da8c0cf40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 11:27:28.7976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VP+HbBeAD4FL+4OEL2AVTsSZXTh4ogPsa8AEta7Y5Atv36X+9wX9HL6fiEuG+FBhMbV4vLLK7N7RxsNBlpN2ccfDCV6UQOsGTg2FyKe2mRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1894
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

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMTM6MDMsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBBbGxvdyBQVEUgY2hhbmdlcyB0byBhdm9pZCBmbHVzaGluZyB0aGUgVExCIHdoZW4gYWNjZXNz
IHBlcm1pc3Npb25zIGFyZQ0KPiBiZWluZyByZWxheGVkLCB0aGUgZGlydHkgYml0IGlzIGJlaW5n
IHNldCwgYW5kIHRoZSBhY2Nlc3NlZCBiaXQgaXMgYmVpbmcNCj4gY2hhbmdlZC4NCj4gDQo+IFJl
bGF4aW5nIGFjY2VzcyBwZXJtaXNzaW9ucyBhbmQgc2V0dGluZyBkaXJ0eSBhbmQgYWNjZXNzZWQg
Yml0cyBkbyBub3QNCj4gcmVxdWlyZSBhIGZsdXNoIGJlY2F1c2UgdGhlIE1NVSB3aWxsIHJlLWxv
YWQgdGhlIFBURSBhbmQgbm90aWNlIHRoZQ0KPiB1cGRhdGVzIChpdCBtYXkgYWxzbyBjYXVzZSBh
IHNwdXJpb3VzIGZhdWx0KS4NCj4gDQo+IENsZWFyaW5nIHRoZSBhY2Nlc3NlZCBiaXQgZG9lcyBu
b3QgcmVxdWlyZSBhIGZsdXNoIGJlY2F1c2Ugb2YgdGhlDQo+IGltcHJlY2lzZSBQVEUgYWNjZXNz
ZWQgYml0IGFjY291bnRpbmcgdGhhdCBpcyBhbHJlYWR5IHBlcmZvcm1lZCwgYXMNCj4gZG9jdW1l
bnRlZCBpbiBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nKCkuDQo+IA0KPiBUaGlzIHJlZHVjZXMgVExC
IGZsdXNoaW5nIGZvciBzb21lIG1wcm90ZWN0KDIpIGNhbGxzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4g
Q2hhbmdlcyBpbiB2MjoNCj4gLSBDaGFuZ2UgVk1fQlVHX09OIHRvIFZNX1dBUk5fT04gKENocmlz
dG9waGUpDQo+IC0gUmVtb3ZlIGlmbmRlZiBndWFyZCBhcm91bmQgaGVscGVyIGRlZmluZXMgKENo
cmlzdG9waGUpDQo+IC0gQWRqdXN0IGNvbW1lbnRzIHNsaWdodGx5Lg0KPiANCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCAgfCAgMyArDQo+ICAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oIHwgNTYgKysrKysrKysrKysr
KysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3RsYi5jICAgICAgICAg
ICB8ICAxICsNCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5jICAgICAgICAg
ICAgfCAgMSArDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBpbmRleCBj
YjlkNWZkMzlkN2YuLmE1MDQyYmI5YTMwYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAgLTQxMSw2ICs0MTEsOSBAQCBzdGF0aWMg
aW5saW5lIGludCBfX3B0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcoc3RydWN0IG1tX3N0cnVjdCAq
bW0sDQo+ICAgICogZXZlbnQgb2YgaXQgbm90IGdldHRpbmcgZmx1c2hlZCBmb3IgYSBsb25nIHRp
bWUgdGhlIGRlbGF5DQo+ICAgICogc2hvdWxkbid0IHJlYWxseSBtYXR0ZXIgYmVjYXVzZSB0aGVy
ZSdzIG5vIHJlYWwgbWVtb3J5DQo+ICAgICogcHJlc3N1cmUgZm9yIHN3YXBvdXQgdG8gcmVhY3Qg
dG8uIF0NCj4gKyAqDQo+ICsgKiBOb3RlOiB0aGlzIG9wdGltaXNhdGlvbiBhbHNvIGV4aXN0cyBp
biBwdGVfbmVlZHNfZmx1c2goKSBhbmQNCj4gKyAqIGh1Z2VfcG1kX25lZWRzX2ZsdXNoKCkuDQo+
ICAgICovDQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQX0NMRUFSX1lPVU5HX0ZMVVNIDQo+
ICAgI2RlZmluZSBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nIHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91
bmcNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxi
Zmx1c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0K
PiBpbmRleCBkMmU4MGYxNzhiNmQuLjY2YjBkZTBjZTYwMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0KPiBAQCAtMTQzLDYgKzE0Myw2
MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdChzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJCWZsdXNoX3RsYl9wYWdlKHZtYSwgYWRkcmVz
cyk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIF9fcHRlX2ZsYWdzX25lZWRf
Zmx1c2godW5zaWduZWQgbG9uZyBvbGR2YWwsDQo+ICsJCQkJCSAgdW5zaWduZWQgbG9uZyBuZXd2
YWwpDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyBkZWx0YSA9IG9sZHZhbCBeIG5ld3ZhbDsNCj4g
Kw0KPiArCS8qDQo+ICsJICogVGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGZ1bmN0aW9uIGRvZXNu
J3QgbWF0dGVyIGZvciBoYXNoLA0KPiArCSAqIHB0ZXBfbW9kaWZ5X3Byb3Rfc3RhcnQoKSBkb2Vz
IGEgcHRlX3VwZGF0ZSgpIHdoaWNoIGRvZXMgb3Igc2NoZWR1bGVzDQo+ICsJICogYW55IG5lY2Vz
c2FyeSBoYXNoIHRhYmxlIHVwZGF0ZSBhbmQgZmx1c2guDQo+ICsJICovDQo+ICsJaWYgKCFyYWRp
eF9lbmFibGVkKCkpDQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBXZSBk
byBub3QgZXhwZWN0IGtlcm5lbCBtYXBwaW5ncyBvciBub24tUFRFcyBvciBub3QtcHJlc2VudCBQ
VEVzLg0KPiArCSAqLw0KPiArCVZNX1dBUk5fT05fT05DRShvbGR2YWwgJiBfUEFHRV9QUklWSUxF
R0VEKTsNCj4gKwlWTV9XQVJOX09OX09OQ0UobmV3dmFsICYgX1BBR0VfUFJJVklMRUdFRCk7DQo+
ICsJVk1fV0FSTl9PTl9PTkNFKCEob2xkdmFsICYgX1BBR0VfUFRFKSk7DQo+ICsJVk1fV0FSTl9P
Tl9PTkNFKCEobmV3dmFsICYgX1BBR0VfUFRFKSk7DQo+ICsJVk1fV0FSTl9PTl9PTkNFKCEob2xk
dmFsICYgX1BBR0VfUFJFU0VOVCkpOw0KPiArCVZNX1dBUk5fT05fT05DRSghKG5ld3ZhbCAmIF9Q
QUdFX1BSRVNFTlQpKTsNCj4gKw0KPiArCS8qDQo+ICsJKiAgTXVzdCBmbHVzaCBvbiBhbnkgY2hh
bmdlIGV4Y2VwdCBSRUFELCBXUklURSwgRVhFQywgRElSVFksIEFDQ0VTU0VELg0KPiArCSoNCj4g
KwkgKiBJbiB0aGVvcnksIHNvbWUgY2hhbmdlZCBzb2Z0d2FyZSBiaXRzIGNvdWxkIGJlIHRvbGVy
YXRlZCwgaW4NCj4gKwkgKiBwcmFjdGljZSB0aG9zZSBzaG91bGQgcmFyZWx5IGlmIGV2ZXIgbWF0
dGVyLg0KPiArCSAqLw0KPiArDQo+ICsJaWYgKGRlbHRhICYgfihfUEFHRV9SV1ggfCBfUEFHRV9E
SVJUWSB8IF9QQUdFX0FDQ0VTU0VEKSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gKwkvKg0K
PiArCSAqIElmIGFueSBvZiB0aGUgYWJvdmUgd2FzIHByZXNlbnQgaW4gb2xkIGJ1dCBjbGVhcmVk
IGluIG5ldywgZmx1c2guDQo+ICsJICogV2l0aCB0aGUgZXhjZXB0aW9uIG9mIF9QQUdFX0FDQ0VT
U0VELCBkb24ndCB3b3JyeSBhYm91dCBmbHVzaGluZw0KPiArCSAqIGlmIHRoYXQgd2FzIGNsZWFy
ZWQgKHNlZSB0aGUgY29tbWVudCBpbiBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nKCkpLg0KPiArCSAq
Lw0KPiArCWlmICgoZGVsdGEgJiB+X1BBR0VfQUNDRVNTRUQpICYgb2xkdmFsKQ0KPiArCQlyZXR1
cm4gdHJ1ZTsNCj4gKw0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlu
bGluZSBib29sIHB0ZV9uZWVkc19mbHVzaChwdGVfdCBvbGRwdGUsIHB0ZV90IG5ld3B0ZSkNCj4g
K3sNCj4gKwlyZXR1cm4gX19wdGVfZmxhZ3NfbmVlZF9mbHVzaChwdGVfdmFsKG9sZHB0ZSksIHB0
ZV92YWwobmV3cHRlKSk7DQo+ICt9DQo+ICsjZGVmaW5lIHB0ZV9uZWVkc19mbHVzaCBwdGVfbmVl
ZHNfZmx1c2gNCj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIGh1Z2VfcG1kX25lZWRzX2ZsdXNo
KHBtZF90IG9sZHBtZCwgcG1kX3QgbmV3cG1kKQ0KPiArew0KPiArCXJldHVybiBfX3B0ZV9mbGFn
c19uZWVkX2ZsdXNoKHBtZF92YWwob2xkcG1kKSwgcG1kX3ZhbChuZXdwbWQpKTsNCj4gK30NCj4g
KyNkZWZpbmUgaHVnZV9wbWRfbmVlZHNfZmx1c2ggaHVnZV9wbWRfbmVlZHNfZmx1c2gNCj4gKw0K
PiAgIGV4dGVybiBib29sIHRsYmllX2NhcGFibGU7DQo+ICAgZXh0ZXJuIGJvb2wgdGxiaWVfZW5h
YmxlZDsNCj4gICA=
