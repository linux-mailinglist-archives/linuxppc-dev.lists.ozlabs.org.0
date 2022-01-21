Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C24495C25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCYy25DYz3cDY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:42:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYW4rnRz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIhWc2py+vz92SIKOlUvLLijla1P303zUCWAwXplOBo9va6ELzhHIRS+F41t6r51//DA4gRSEgXsQi2wO4Xk9ZhHvruxcb+L1y7ONFrMcxgAQm749QvDytvcyPt/TiuLm5XQFXbT9yCXIs7MPjkV4A2RxDoXxMzk4dtab5+dCDT6/m52PdNkWEClfsFFaGxdK+fw/HsMM0WxExkUQGnNmYCxnkxNgAF16nw5qyK3Ix35linUz5qaEzmigJX9A2AQRTV9Qf4y8M/a7QTuK7zBLJaibJManhfFmUETonXgGeDdTxFl9OrKZbH/I8KcqbsdV2oWIIi5nNHjSBCAjOEzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leWjlZjox3uAVOfaI4AAGDO5Et3s+eb0XfqbtIb1At8=;
 b=JIiot5zDGKzvFs4+TBI7M0cWOuv+7RMFYDshSfA/CHfswLapvj7u9/VDT3ioFoafcVKTzOFDovBksEA8vMHMDq1y8xqZWfdn/bos7/TZbW7/M29B5wgDl6kmguFhX4WnjsGWJrU5BorOPY3adFAWgPqVT1wiRBmdUdHLcNHU6pxbbPY3B3/fdUJ2Ja4teCMHJG90BVyoq6SFJc8y76OUnQPrC4ATlce4ZQT4QY0SAKSueUvn2TkAaBn32zsvX/rbjjXqz6W/OBcjNJC5cCQSo7NYM6cRssxPB82i6xWbqTKdyxQtIe9F6n5TOIFAv81lmKGOeMDkOexSoBODIl/cNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 08:42:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 00/14] Convert powerpc to default topdown mmap layout
Thread-Topic: [PATCH v7 00/14] Convert powerpc to default topdown mmap layout
Thread-Index: AQHYDqLDmNB/bhjgA0WW4tdN8Jl9pw==
Date: Fri, 21 Jan 2022 08:42:03 +0000
Message-ID: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdc021f2-b8df-44b6-d9ea-08d9dcb9e5eb
x-ms-traffictypediagnostic: PR1P264MB2206:EE_
x-microsoft-antispam-prvs: <PR1P264MB22065620694713166E11B36FED5B9@PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DhGXULuKsHGsmbAKlI9Sr5y3T6HWoIZerOtE3Efx/GL19ziYcsWVqXwRwMkTOaQ215U8lSENlg8i7Wmvtreb519gyv1aLJxvBfRp6SwEGDeyh7v2H0sD5ItLPybc8uC3h63c5ZsK9kLa+WA1k9AwkKMNTpPsyFW1Wi5R9tjoePtbUVrZk32Xb3A69bYF78kww9dqm7OzAaTc26OfY4X3shrE+VCRmCvKPfGFy3y3/NFHwwz0XH+3V8EQMuo7bxcwpqIBW8I21VySG/n2uZ2FHeRRoZDcUXXbCg8if4kI7RbMY1Chm7F/Je9fSYbQ2oTofFnlheeFkkQ+JpDiWGAJoSqU0JUpirbIU1XhyYFMDnWGrEG9v9d/7piHhM4/ZxqWPaR4oKXlOylPNOCQFUq6oAnoD5c5bK0xKm18hbdxUb22WsmyxHZ1kTGhnrCJkLkjZl6QXC9LZeAdvb1uNNBEROQ1SSclm3c9HYDNPdQ/neQO5B1xgrjWBJSKAGoXlOH59BVj0BoFyQjPC4mKamgkbEX9jrVQFp7nvmGOLCQpYKFNxA/O+GmfuOaMSz/ZOTA/XAGcfaI2fp+7elCwb//9Tma9/is79QWG25XUvG2iozUL8gPdymQ2I3fW9CObp0vzpiDQBjL1PsUvm53lC4dGRzzL/pPg9+gCJKKzSB3LpFFZIDi/ahiIF0x/fGfsqI5EoaPBZOy4PMEAR5Urodlo5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(316002)(54906003)(38070700005)(2906002)(6512007)(8936002)(6486002)(86362001)(186003)(2616005)(83380400001)(7416002)(110136005)(26005)(66476007)(66556008)(64756008)(91956017)(36756003)(66946007)(44832011)(76116006)(66446008)(38100700002)(508600001)(5660300002)(8676002)(4326008)(122000001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUFCNUhlS3M4N1RTMVZodFBoWnY1NkpFMGF1TlQxZnQvR09kV1BYaFBqanky?=
 =?utf-8?B?TVd4UVRhR21rbTczYkd6Wkt1WkNLd3ZXLzlnSE0vUHNhU0svbEpnK0dHdURE?=
 =?utf-8?B?UC9LZEtRaFY3RzYrUzJsODdCRjdGNkE2RjlnaXN3dlZuMDd0c3g3OFJHZE1n?=
 =?utf-8?B?bC9FVTVwaktYSjd0a3Vwc0ZtN1QxVmxmZnNjVVVCT25sMCs4S1VhZ3NOSW9Z?=
 =?utf-8?B?M1JuOUNIN0dCeHpGVTZkYWY5MjdsNWswUm5KbklvUFJVYVJYVThHTExiamNl?=
 =?utf-8?B?ZklmeEhnUFdoalpRM2lwdjZZaU5SUHVuWDc4aVBaKzRBOGlTem8rbnkzWXNG?=
 =?utf-8?B?c1lTY2hBMlExbmtwM3A2Q2pRRWMra1FVUWdnOHRTRCtmTTcwT1g0eVp4aFVW?=
 =?utf-8?B?bk5FZW9yRmZpdkI4V1R1SWRFRkVycG5ydG43YnlrYzV5dDArUnVVOU9WWDhV?=
 =?utf-8?B?TCtoMVZ6b0NVa1hqVzZuVVZlM0tZRXdvd3RpaCtXSDZ0V0NsQm5KUXowbXdL?=
 =?utf-8?B?U3hxYUp6di9EZUJ3NlJ6K2JxZnFOdjFBSEZYdHpvVmZpaUZxRUFyWFJZRE45?=
 =?utf-8?B?WmV1ZnFzbmV4VituVXNnQ0tBRDFGQXk5TnFVT2I1UE1STFM1R0QxVkc3cDlo?=
 =?utf-8?B?RWNEdTZrREt0SVZOcGFaT3FIYUY3cW0veWljaFpRRm5oaU9PajJabkd0TTVF?=
 =?utf-8?B?aE9Fa21sdUpKZkpGbFBlK25WRmtIZWhBQ2xnY2pOUzM5QVBaYU50U0lBRFdD?=
 =?utf-8?B?aitBeTczRFZCR2JpRTVrVHh2dzluOG9Yczl4OU5aL0t0RTZiNUhKMFhnRW8z?=
 =?utf-8?B?THg4MGJyQldHWW9STmk0ZmZ5UXZ0YWRPU3FjRGZ3T05hYTFBN1VHS3FtOGFY?=
 =?utf-8?B?UVV0ci9hL09pdmRTSk55UVQvL0I0RFpGOWhRVC96V09IRkoyR2xoZXVnUndU?=
 =?utf-8?B?MDlTTFVSUjJFUUV6RjhYNUlQWDlKQy9PTE5HQVJNd3pzdCt6SjQvb0tVYnFt?=
 =?utf-8?B?S2I5QzdBanZFKzdqZTI4cGFuK1RWekhGa0NGamFzd2Q0RDF2SnFNRTd2emZY?=
 =?utf-8?B?MXFuUjBocjdkdGNMeXlIMjBraldSb281ZVlCQU94V3gxemdLcVIvL1I5L3FV?=
 =?utf-8?B?dkREVllPQVBtUUFoZWVQdFVMMm5tcWc3SXRnbWI4dW5FMUliMGs0SGNrMzky?=
 =?utf-8?B?SytaT1FMMmdYZXdQaExzaEtFb3FuNG5GSFRVRUZnWEJJOVoyNm5rWDRlOFlp?=
 =?utf-8?B?NlQ2ekd3bU1icm96Y0ljRE1ZOENYS3R5Y3RucXRKZEE4UVhPT3QzeExVdGZO?=
 =?utf-8?B?Rll5R2kxRHBQY1BGT2lHWW42cnYreE01UURjN25CaWhlOFZzeE1UeFZWajcx?=
 =?utf-8?B?L1BJcXk1cWVqby8vNGJ3aVo0SE9LUWFCY0k3akNOenk0dW1zQ00zZnJML2pL?=
 =?utf-8?B?Y1ZBM09Ic3RwZ2U4bXpOcXpwWk5hLzJBYmdrVTkvL0pJWmRmWGVyUVpJMEZt?=
 =?utf-8?B?WndSV0hFdy9IbE1VeDA0SG9ZRHJPZFVRVXB6UVB4a3FLRE5SM2pOTXg5T1Ju?=
 =?utf-8?B?WFFMUTc5MGJkTVRtQ3NHY0lYUUJvamtVaktEZ3dlMGhhak5VaGVYNXVZRCtp?=
 =?utf-8?B?TkxvaXM5andMRFpyMWprM29CbWhiRFgyQ0VlTVNWaW1QRFVQSTUxTTIzQitm?=
 =?utf-8?B?TytOajkxRmNrZ3luMTFodWZLRVhrWXRFallkUUJWS1A4clJRZXNUaVlVUHhz?=
 =?utf-8?B?MTNmRllpYTRHclNqQjZBQUN4NlNFWGdpU2tSOFRNRU5TV0pnekp3dEV0NktS?=
 =?utf-8?B?YzVoVmgrN0MxQUtiaTEwVW1nd1kveUFXZ2tibWJBNkk2SlY3clYreEVxQjdX?=
 =?utf-8?B?dGdUN2pMcU1nNGpxWE5RMzR6TUZvQVZRV1kvR3QvTFl4S0RiNndnM2ZWRmlw?=
 =?utf-8?B?cVVDbE1MNnVMNEVsZUFycHFqbU8rQjBJYVFvRGUyV0dpZmFLUU5TaGdZRzlt?=
 =?utf-8?B?VTd3cHZmVG1ZOTBvSVp6ZmUvSWR5eEVMWSt6b25UQ0lmVnNRZ2F4VTQ2RG1u?=
 =?utf-8?B?TDN3dDBZWU1aTTZHZFppRDZQWEk4eWFTbmdKTGxtZlo1NTNMTTVKRCtzMENT?=
 =?utf-8?B?YUptRTQyUVdaZkdpWGplc3BGcHlBZExBQ3BqZ0YwR0VLTkZNRGE2bDVmYWFJ?=
 =?utf-8?B?clZPQ0JCakdiRHV1YXBadTBzRXhUK0Q0N2hGK0N2RUJxQUlGdWtJajBGN0g3?=
 =?utf-8?Q?HkY9RIirODTX0ayEytPZ6f1BDbD3XuFf7NiF1DXsw8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DD1A181BEA4F0419D59E7807036351A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc021f2-b8df-44b6-d9ea-08d9dcb9e5eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:03.3354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Tv2DpkJmQYKT+mQUsT7Yi0ObnC6k3lrDbfk5qI5dQw2/ilju/Mslohv+pU0kt6+faL2qEyDWDlXUgFnhYDm/iNih15yQLjFv/M4/VgJn+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2206
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmViYXNlZCBvbiB0b3Agb2YgcG93ZXJwYy9uZXh0IGJyYW5jaA0KDQpUaGlzIHNlcmllcyBjb252
ZXJ0cyBwb3dlcnBjIHRvIGRlZmF1bHQgdG9wZG93biBtbWFwIGxheW91dC4NCg0KcG93ZXJwYyBy
ZXF1aXJlcyBpdHMgb3duIGFyY2hfZ2V0X3VubWFwcGVkX2FyZWEoKSBvbmx5IHdoZW4NCnNsaWNl
cyBhcmUgbmVlZGVkLCB3aGljaCBpcyBvbmx5IGZvciBib29rM3MvNjQuIEZpcnN0IHBhcnQgb2YN
CnRoZSBzZXJpZXMgbW92ZXMgc2xpY2VzIGludG8gYm9vazNzLzY0IHNwZWNpZmljIGRpcmVjdG9y
aWVzDQphbmQgY2xlYW5zIHVwIG90aGVyIHN1YmFyY2hpdGVjdHVyZXMuDQoNCkxhc3QgcGFydCBj
b252ZXJ0cyB0byBkZWZhdWx0IHRvcGRvd24gbW1hcCBsYXlvdXQuDQoNCkEgc21hbGwgbW9kaWZp
Y2F0aW9uIGlzIGRvbmUgdG8gY29yZSBtbSB0byBhbGxvdw0KcG93ZXJwYyB0byBzdGlsbCBwcm92
aWRlIGl0cyBvd24gYXJjaF9yYW5kb21pemVfYnJrKCkNCg0KQW5vdGhlciBtb2RpZmljYXRpb24g
aXMgZG9uZSB0byBjb3JlIG1tIHRvIGFsbG93IHBvd2VycGMNCnRvIHVzZSBnZW5lcmljIHZlcnNp
b25zIG9mIGdldF91bm1hcHBlZF9hcmVhIGZ1bmN0aW9ucyBmb3IgUmFkaXgNCndoaWxlIHN0aWxs
IHByb3ZpZGluZyBpdHMgb3duIGltcGxlbWVudGF0aW9uIGZvciBIYXNoLCB0aGUNCnNlbGVjdGlv
biBiZXR3ZWVuIFJhZGl4IGFuZCBIYXNoIGJlaW5nIGRvaW5nIGF0IHJ1bnRpbWUuDQoNCkxhc3Qg
bW9kaWZpY2F0aW9uIHRvIGNvcmUgbW0gaXMgdG8gZ2l2ZSBsZW4gYW5kIGZsYWdzIHRvDQphcmNo
X2dldF9tbWFwX2VuZCgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCkNoYW5nZXMgaW4gdjc6DQotIFRha2VuIGludG8g
YWNjb3VudCBjb21tZW50cyBmcm9tIENhdGFsaW4gKHBhdGNoZXMgMyBhbmQgNCkNCg0KQ2hhbmdl
cyBpbiB2NjoNCi0gTmV3IHBhdGNoIChwYXRjaCA0KSB0byB0YWtlIGFyY2hfZ2V0X21tYXBfYmFz
ZSgpIGFuZCBhcmNoX2dldF9tbWFwX2VuZCgpIGludG8gYWNjb3VudCBpbiBnZW5lcmljIGh1Z2V0
bGJfZ2V0X3VubWFwcGVkX2FyZWEoKQ0KLSBHZXQgYmFjayBhcmNoX3JhbmRvbWl6ZV9icmsoKSBz
aW1wbGlmaWNhdGlvbiBhcyBpdCByZWxpZXMgb24gZGVmYXVsdCB0b3Bkb3duIG1tYXAgbGF5b3V0
Lg0KLSBGaXhlZCBwcmVjZWRlbmNlIGJldHdlZW4gfHwgYW5kICYmIGluIHBvd2VycGMncyBhcmNo
X2dldF9tbWFwX2VuZCgpIChwYXRjaCA5KQ0KDQpDaGFuZ2VzIGluIHY1Og0KLSBBZGRlZCBwYXRj
aCAzDQotIEFkZGVkIGFyY2hfZ2V0X21tYXBfYmFzZSgpIGFuZCBhcmNoX2dldF9tbWFwX2VuZCgp
IHRvIHBhdGNoIDcgdG8gYmV0dGVyIG1hdGNoIG9yaWdpbmFsIHBvd2VycGMgYmVoYXZpb3VyDQot
IFN3aXRjaGVkIHBhdGNoZWQgMTAgYW5kIDExIGFuZCBwZXJmb3JtZWQgZnVsbCByYW5kb21pc2F0
aW9uIGluIHBhdGNoIDEwIGp1c3QgYmVmb3JlIHN3aXRjaGluZyB0byBkZWZhdWx0IGltcGxlbWVu
dGF0aW9uLCBhcyBzdWdnZXN0ZWQgYnkgTmljLg0KDQpDaGFuZ2VzIGluIHY0Og0KLSBNb3ZlIGFy
Y2hfcmFuZG9taXplX2JyaygpIHNpbXBsaWZpY2F0aW9uIG91dCBvZiB0aGlzIHNlcmllcw0KLSBB
ZGQgYSBjaGFuZ2UgdG8gY29yZSBtbSB0byBlbmFibGUgdXNpbmcgZ2VuZXJpYyBpbXBsZW1lbnRh
dGlvbg0Kd2hpbGUgcHJvdmlkaW5nIGFyY2ggc3BlY2lmaWMgb25lIGF0IHRoZSBzYW1lIHRpbWUu
DQotIFJld29ya2VkIHJhZGl4IGdldF91bm1hcHBlZF9hcmVhIHRvIHVzZSBnZW5lcmljIGltcGxl
bWVudGF0aW9uDQotIFJlYmFzZSBvbiB0b3Agb2YgTmljJ3Mgc2VyaWVzIHY2DQoNCkNoYW5nZXMg
aW4gdjM6DQotIEZpeGVkIG1pc3NpbmcgPGxpbnV4L2VsZi1yYW5kb21pemUuaD4gaW4gbGFzdCBw
YXRjaA0KLSBBZGRlZCBhIHBhdGNoIHRvIG1vdmUgU1pfMVQgb3V0IG9mIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpLXhnZW5lLmMNCg0KQ2hhbmdlcyBpbiB2MjoNCi0gTW92ZWQgcGF0Y2ggNCBi
ZWZvcmUgcGF0Y2ggMg0KLSBNYWtlIGdlbmVyaWMgYXJjaF9yYW5kb21pemVfYnJrKCkgX193ZWFr
DQotIEFkZGVkIHBhdGNoIDkNCg0KQ2hyaXN0b3BoZSBMZXJveSAoMTQpOg0KICBtbTogQWxsb3cg
YXJjaCBzcGVjaWZpYyBhcmNoX3JhbmRvbWl6ZV9icmsoKSB3aXRoDQogICAgQ09ORklHX0FSQ0hf
V0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQNCiAgbW0sIGh1Z2V0bGJmczogQWxsb3cg
YW4gYXJjaCB0byBhbHdheXMgdXNlIGdlbmVyaWMgdmVyc2lvbnMgb2YNCiAgICBnZXRfdW5tYXBw
ZWRfYXJlYSBmdW5jdGlvbnMNCiAgbW06IEFkZCBsZW4gYW5kIGZsYWdzIHBhcmFtZXRlcnMgdG8g
YXJjaF9nZXRfbW1hcF9lbmQoKQ0KICBtbSwgaHVnZXRsYmZzOiBBbGxvdyBmb3IgImhpZ2giIHVz
ZXJzcGFjZSBhZGRyZXNzZXMNCiAgc2l6ZXMuaDogQWRkIFNaXzFUIG1hY3JvDQogIHBvd2VycGMv
bW06IE1vdmUgdm1hX21tdV9wYWdlc2l6ZSgpDQogIHBvd2VycGMvbW06IE1ha2Ugc2xpY2Ugc3Bl
Y2lmaWMgdG8gYm9vazNzLzY0DQogIHBvd2VycGMvbW06IFJlbW92ZSBDT05GSUdfUFBDX01NX1NM
SUNFUw0KICBwb3dlcnBjL21tOiBVc2UgZ2VuZXJpY19nZXRfdW5tYXBwZWRfYXJlYSgpIGFuZCBj
YWxsIGl0IGZyb20NCiAgICBhcmNoX2dldF91bm1hcHBlZF9hcmVhKCkNCiAgcG93ZXJwYy9tbTog
VXNlIGdlbmVyaWNfaHVnZXRsYl9nZXRfdW5tYXBwZWRfYXJlYSgpDQogIHBvd2VycGMvbW06IE1v
dmUgZ2V0X3VubWFwcGVkX2FyZWEgZnVuY3Rpb25zIHRvIHNsaWNlLmMNCiAgcG93ZXJwYy9tbTog
RW5hYmxlIGZ1bGwgcmFuZG9taXNhdGlvbiBvZiBtZW1vcnkgbWFwcGluZ3MNCiAgcG93ZXJwYy9t
bTogQ29udmVydCB0byBkZWZhdWx0IHRvcGRvd24gbW1hcCBsYXlvdXQNCiAgcG93ZXJwYzogU2lt
cGxpZnkgYW5kIG1vdmUgYXJjaF9yYW5kb21pemVfYnJrKCkNCg0KIGFyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vcHJvY2Vzc29yLmggICAgICAgICAgICB8ICAgNCArLQ0KIGFyY2gvcG93ZXJwYy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvaHVnZXRsYi5oICB8ICAgNCAtDQogYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9tbXUtaGFzaC5oIHwgICAxICsNCiBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYm9vazNzLzY0L21tdS5oICAgICAgfCAgIDYgLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvNjQvc2xpY2UuaCAgICB8ICAyNCArKw0KIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9odWdldGxiLmggICAgICAgICAgICB8ICAgMiArLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wYWNhLmggICAgICAgICAgICAgICB8ICAgNyAtDQogYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3BhZ2UuaCAgICAgICAgICAgICAgIHwgICAxIC0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmggICAgICAgICAgfCAgIDIgLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9zbGljZS5oICAgICAgICAgICAgICB8ICA0NiAtLS0tDQogYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3Rhc2tfc2l6ZV82NC5oICAgICAgIHwgICA4ICsNCiBhcmNoL3Bvd2VycGMva2VybmVsL3Bh
Y2EuYyAgICAgICAgICAgICAgICAgICAgfCAgIDUgLQ0KIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJv
Y2Vzcy5jICAgICAgICAgICAgICAgICB8ICA0MSAtLS0NCiBhcmNoL3Bvd2VycGMvbW0vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0NCiBhcmNoL3Bvd2VycGMvbW0vYm9vazNz
NjQvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKy0NCiBhcmNoL3Bvd2VycGMvbW0vYm9vazNz
NjQvaGFzaF91dGlscy5jICAgICAgICAgfCAgMzMgKystDQogYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMgIHwgIDU1IC0tLS0NCiBhcmNoL3Bvd2VycGMvbW0veyA9
PiBib29rM3M2NH0vc2xpY2UuYyAgICAgICAgfCAgNzEgKysrKy0NCiBhcmNoL3Bvd2VycGMvbW0v
aHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAgICAgfCAgMzQgLS0tDQogYXJjaC9wb3dlcnBjL21t
L21tYXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjU2IC0tLS0tLS0tLS0tLS0tLS0tLQ0K
IGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gvbW11X2NvbnRleHQuYyAgICAgICAgICB8ICAgOSAtDQog
YXJjaC9wb3dlcnBjL21tL25vaGFzaC90bGIuYyAgICAgICAgICAgICAgICAgIHwgICA0IC0NCiBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSAgICAgICAgfCAgIDQgLQ0KIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMgICAgICAgICAgICB8ICAgMSAtDQogZnMv
aHVnZXRsYmZzL2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI2ICstDQogaW5j
bHVkZS9saW51eC9odWdldGxiLmggICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCiBpbmNs
dWRlL2xpbnV4L3NjaGVkL21tLmggICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKysNCiBpbmNs
dWRlL2xpbnV4L3NpemVzLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KIG1tL21t
YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0MyArLS0NCiBtbS91
dGlsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiAzMSBm
aWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKSwgNTM1IGRlbGV0aW9ucygtKQ0KIGRlbGV0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2xpY2UuaA0KIHJlbmFtZSBh
cmNoL3Bvd2VycGMvbW0veyA9PiBib29rM3M2NH0vc2xpY2UuYyAoOTElKQ0KIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Bvd2VycGMvbW0vbW1hcC5jDQoNCi0tIA0KMi4zMy4xDQo=
