Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF087B97F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:46:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EyBowORn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLb864kxz3vX6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EyBowORn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLZL5Dytz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:46:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeKWrERhokmMwgT/KfCdNvF1frQZ5WyENvroS/F/tJ9Jj2bR6TjK5CZ4EcI6HFWyZzTFGgHe5PQB+XuNsAPQRlEmgyHsIj8awRuQOvo3exSouyT2KS2WEs1t6wN/vVwdcaLXiEtZscP0RCZgUiuG5m5nMAzrzTPQzh3l3CV+GcoxRGD4+UMPGN966wQwe79uw/kalLPFfVPKr8y5ZLPeNeu0ncrCPBGEtfMiWB57/oX7p9lEC95vkzh4Sai87PNYJJatQECvnAEGtMmh5TNAkvhUh1IjGuBtVCUr2eb7y1WwzJhqrHXNd8zvCxnPGdebLASTDhYZvqK7Ebby+dqBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4ggo8kGPaNwVQTARgJjAEvfrmyeDWor1qTfAod04Kc=;
 b=E//rWsOUfSWoQjhAXQYrJrFFjOHudywqtMfQUJNKqCeEaqQWCprx280rQ43ShhYv4ePyvO1p847m7CRZ9FgJV8twJQvmxKo8ge9lQWhgCHkQsCrowuWJIxfx0KiXM058eaYdnidBX79W3iXOxaytMNm7nLoAUXN1vbGHFTMaPI97kulqCgGF3/8di83uQhqj4u17qy0G5RRivazWqnbFD8g4W89E28rti91oxFY+zxHbLlA9pTt4CwZHKRKC2SRTkiubNkhbnG1/vY7Ovu8j5qGWGaqkcI6HUmG8eP270Fq84gbY88xTqfEhwJcbgkQrzx1vNxwcBLUejCAObgC+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4ggo8kGPaNwVQTARgJjAEvfrmyeDWor1qTfAod04Kc=;
 b=EyBowORnNsgUkYD7kt8Ya4cisfs9DPth7RFwwVjV/ppKYRW9OLLLFZjMKJ4bVsybJ6y531ZW1X0i1zGsawnmMDyy1H6fzwkxRX8Tv2N6Ll8UH5oCIvvvNelwTHIOqjOOT75Ff4HovKV/sE5r/Y+31/qeglfK0K4FjeFALN5JoUOQKbCkw6z7zsm04VGYao7cn4bb27rEXGyeoH7g8I9B8rDZ6rgaP9YAn1t8eQesB4MYdBCTcXPcJBv91ZaiC7u4/PhgI1JfreEnCVVEk4TnR8y3t1/zrPHgT4RZuXCGogHPJzweM7a1R1tSxv3HBmz/Z6AO7ZXtYal3Ia22kxGPdw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1540.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 08:45:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 08:45:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Index: AQHadZASkAUcDDurK02wtpi3kLRmM7E27NOA
Date: Thu, 14 Mar 2024 08:45:34 +0000
Message-ID: <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
In-Reply-To: <20240313214719.253873-10-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1540:EE_
x-ms-office365-filtering-correlation-id: ce57b44d-da02-42e5-271e-08dc44031d54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rA5KmAMRtzjpLnKzhpUnUXp0Sl/WoS/HIMRi+NlT4ilNn4rhgjwS7ut26JE+BkitLT79yBooprsloJWpZXYZ0fOJYmQ/QK+a/DByeJOJJy85An0PPfouQQvPHvOsSs/r7AAROd4yfVgbbXtBwsB48+u5JzvUJuUyl9FiwvbM42e5q5fVVztbjLcwTpjwigPXJYYcS2RPm+3GkPpj/gMLEWSmylTVmic/rVhy+R6L9mtXi9EUxdOndaX/yBM9jReJqU17+ywI6SnrLSDy2i3tyb/oE5NKK/0fhRP0lai0u3QUUK/5eobynqp1KpREht7Y0VGnj3TaDodEyxIfb88KHeOji0qcheZBjXnmKZJ0en/MKr97ucIV8dayu9hFfFcNrt0/Q7MOcuQ24TSMruZkF+xULO17BjRUtAA9HkB9nddbi1oaIPRgBIaNCO3xdMZ7ygtT5VEouGmKHuVdeCMnuwfZmqVczB1fsSvl9iy+W4gMbmlW97rO6dNLK4HjK2kb3ntANcFloJSk35z4gq0GEWguUd6LXqU8rDigrP/KNd1Xw91IZqgjTfMA+MbbqlQe/GaC1eysKSKVCXCDCbpAm1oj6gFMNbvEXhQzNgUSZObEHiWH/9LwPxwSorbUv1XT/WctdudznfrWRnVEL0n4/aZMibWsH5FzLV39e2jqalw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TGwvY1A4dXlldjVqdWJhaXYwTnk4VWFCQUtTQlZjVXo3c0xoakRhRi9ROU55?=
 =?utf-8?B?RENwSTUwTFkrSHRKSG1kN2J1eUNVSVFMV01KSDRHUFgzaWM3a2N5NytBOTU0?=
 =?utf-8?B?U29nQUdIMWhjNFk1MWswa1pwbjhKTUlBRE15RGp6UGtFN1I5K1hXYytKcWVh?=
 =?utf-8?B?Mkp2TjhNZ3UzZ3Y5SUViZ0hsbUIwcGd3OWl4bG10Wi90Rno0OHo3MCtuSmFq?=
 =?utf-8?B?NUhpdlQrTTJjTDJTVDByS1phTmdoNTUvc2RQRDRsU0xNWDhXT0t0RVRmam1M?=
 =?utf-8?B?UVUwQlFPNXlFdHQ5bzkydTRtL1FoTTk4LzdsZHpjL2JjOTBxZTVBK2F2M0xp?=
 =?utf-8?B?d1RPcDdRUXJwUndIcFBFZzFTKzlqU293QnZUcTVyMGNNbmxSc2tLMmNxRGVB?=
 =?utf-8?B?Rmw0UVBoNmdwVk1mTFdQTFllZ1dMQ1dNRDArYXZUNytTK0NZZ1M3NE5rWDU1?=
 =?utf-8?B?WnFEYVZCRUJ4ZklzUlBUaXBPaXV0bVd4SUF3NzBvL3VldXJFT0Y3em5nNUtV?=
 =?utf-8?B?RWFXNUVPMFBPaDdtOVNvUU85SVRwZWl6V1BhQ3EybWNnMTkrMlhicGU3SjM1?=
 =?utf-8?B?SEcyNnRwc21iVjFicG82MmlERW9BT2JDU0xhOW00Y0hvNFE4ZW41K1RMVkdr?=
 =?utf-8?B?QWo5cUc3b2k0TUJ1RVdEYnJTaE0vemtpc0g2cFJzeEJqcTBvZnFLYUpvcS84?=
 =?utf-8?B?aUYwZUY5TUpqZmh3ZmpOMzZ5UHYyczZ5dlNMcTI4SUFnNEQyUXorbG9welIy?=
 =?utf-8?B?YVJLaFhJTzliSU0yVEw1WWJmOGltWFQ1b1pYamZnZ3ZGUTZubUMzaHJBL3JN?=
 =?utf-8?B?RGVQczFBWWg2cDlmVGdtMk9FREM2d3pkNkVYUW02bVkrTnltdXphZWhoZVJk?=
 =?utf-8?B?ODkxOUgxeXE3bHlPSCtUMXV2eXRvd2p1ZHp2eUxieVA0MnBXR294Vmh4NEVz?=
 =?utf-8?B?N2ljeGtrWjBjOENnUFNqd2RRWFljTHJiUVd6WFVmVVg5aHFUanFFVmt1YUhN?=
 =?utf-8?B?Y0FtZWV2YlRsMC9PamxVMVdQSWczcS9hNjQ5STk5Wit5ZEd1bmdQUHp3UE1U?=
 =?utf-8?B?RFFCQ2RuaFkwZWNvMlBmNUdIYUQrKzFXR0xsT2JHcG5QSEp1UkRaaXE3bjMx?=
 =?utf-8?B?T3JjYitodDBkZmh2VmN4M3BqRTR1T2lSdUNaaThib1ZQa1kyQjJtYk4yR2ha?=
 =?utf-8?B?THFLWXV5UzczMm9UTHp2UjA1cjFYWnptMndjTWV3OFhtVkxWeXJjQW4rQ1NV?=
 =?utf-8?B?eGhGOWY3VlNYcDZqRTVFRWtGbnlqV1pGWGtmcS9SZkFuRVZROVZuUXIyUExU?=
 =?utf-8?B?UW5hc1l6dlBUNmtsVnpUZ0llMk5ncE1oTDBJOWwyMkk0QmVveElvUVoyQmZm?=
 =?utf-8?B?WFRKOHNBeXVpaFhNbUx2c3hDdkNkSS9vbG5WV0FOVTdpeGZ6VXlnbnQ0Kyt3?=
 =?utf-8?B?Uld4d2JweDlaT3pJZTNRemhDeENoRGFWRlZqVDV5Y3ZSSGpPTGtNbCtRcVl2?=
 =?utf-8?B?dW9xeVpYQ1RFaDZDaTdMSndCN3FJcW5wQ0U2L1dPWDFTcWV1bUZ4Y0IvcUdy?=
 =?utf-8?B?cDU0Y1Y4ZHJOS3o1Q0Z1RnpmSmFrQ21GUmNZV2h2dFJHcEY2eFFiWDdPQ0dI?=
 =?utf-8?B?ZE9rN2tFMHBGZGFLSUlGaUNOMzVHa1hBQU03VFF5eEU5Q3E0Y1YwWFNFTEdM?=
 =?utf-8?B?bVFidEF1YWhwcVFYK1R4dUN2c2hqUHd0SVdUaElZMi9GZkZJQnZySGRaOHlM?=
 =?utf-8?B?RWlHUzJQZUtwNllieWRYUTBpWGluYm9Xa1dQM29wVXE3eVpHRUl4MmNSQmI5?=
 =?utf-8?B?cHNja1RjbTFvOE5nblo0STVlUDMwN0FZaUsyNkMzRHMzTUpTeTdnTlZ1M2Jh?=
 =?utf-8?B?V3NaUEk4Ni8vaThLNzlNbkwraFBIbXdITTdlbFZXWTJ5d3ZaQ28xRVV2ZWI1?=
 =?utf-8?B?eWNjUG0xY0h3MTFnaGFtYkpvbk5oUUVrcTZXV3ZoUHRxeFhua2FLWitSK0hI?=
 =?utf-8?B?N2F0UW5Lbkd5cUZ6d2JqNVBVenlEM0pUZmg0Z1R3VUVzK3hFaU1rRnFIdzJK?=
 =?utf-8?B?WEMxRlBOdUR5QkpqL2x6aGh4ZWt2V3FueTIxRXp0MVVXNDUvVEZUSmk3ck1G?=
 =?utf-8?B?VlpyOW4reDdJeGNlYitrNk15SUF4dmZCNFNqZ1FaOTNubzBEcDdvcXRQeVJX?=
 =?utf-8?B?VlQzQjgrYkdEZzRNM2M1dVErUG5DRk93ZlcrUTB3ZEhJSk13Ymp3b29vbmdW?=
 =?utf-8?B?TjJkK3N4eGFjeGlqWnp4WlB1RnZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C20A0726B22CF447B12EE24945206852@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce57b44d-da02-42e5-271e-08dc44031d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 08:45:34.7270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZ1AAsb6+h+VYvM9beoz5DWO1wkuApOOT6deefh1sFc5HAa2oF2Yktj/CiImrBgOoXl7SS59usNwx8XRNLGQ7wLVMIr7LvBNtEOMffSt7us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1540
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAzLzIwMjQgw6AgMjI6NDcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IFBvd2VyUEMgYm9v
azNzIDRLIG1vc3RseSBoYXMgdGhlIHNhbWUgZGVmaW5pdGlvbiBvbiBib3RoLCBleGNlcHQgcFhk
X2h1Z2UoKQ0KPiBjb25zdGFudGx5IHJldHVybnMgMCBmb3IgaGFzaCBNTVVzLiAgQXMgTWljaGFl
bCBFbGxlcm1hbiBwb2ludGVkIG91dCBbMV0sDQo+IGl0IGlzIHNhZmUgdG8gY2hlY2sgX1BBR0Vf
UFRFIG9uIGhhc2ggTU1VcywgYXMgdGhlIGJpdCB3aWxsIG5ldmVyIGJlIHNldCBzbw0KPiBpdCB3
aWxsIGtlZXAgcmV0dXJuaW5nIGZhbHNlLg0KPiANCj4gQXMgYSByZWZlcmVuY2UsIF9fcFttdV1k
X21raHVnZSgpIHdpbGwgdHJpZ2dlciBhIEJVR19PTiB0cnlpbmcgdG8gY3JlYXRlDQo+IHN1Y2gg
aHVnZSBtYXBwaW5ncyBmb3IgNEsgaGFzaCBNTVVzLiAgTWVhbndoaWxlLCB0aGUgbWFqb3IgcG93
ZXJwYyBodWdldGxiDQo+IHBndGFibGUgd2Fsa2VyIF9fZmluZF9saW51eF9wdGUoKSBhbHJlYWR5
IHVzZWQgcFhkX2xlYWYoKSB0byBjaGVjayBodWdldGxiDQo+IG1hcHBpbmdzLg0KPiANCj4gVGhl
IGdvYWwgc2hvdWxkIGJlIHRoYXQgd2Ugd2lsbCBoYXZlIG9uZSBBUEkgcFhkX2xlYWYoKSB0byBk
ZXRlY3QgYWxsIGtpbmRzDQo+IG9mIGh1Z2UgbWFwcGluZ3MuICBBRkFJQ1Qgd2UgbmVlZCB0byB1
c2UgdGhlIHBYZF9sZWFmKCkgaW1wbCAocmF0aGVyIHRoYW4NCj4gcFhkX2h1Z2UoKSBvbmVzKSB0
byBtYWtlIHN1cmUgaWUuIFRIUHMgb24gaGFzaCBNTVUgd2lsbCBhbHNvIHJldHVybiB0cnVlLg0K
DQpBbGwga2luZHMgb2YgaHVnZSBtYXBwaW5ncyA/DQoNCnBYZF9sZWFmKCkgd2lsbCBkZXRlY3Qg
b25seSBsZWFmIG1hcHBpbmdzIChsaWtlIHBYZF9odWdlKCkgKS4gVGhlcmUgYXJlIA0KYWxzbyBo
dWdlIG1hcHBpbmdzIHRocm91Z2ggaHVnZXBkLiBPbiBwb3dlcnBjIDh4eCB3ZSBoYXZlIDhNIGh1
Z2UgcGFnZXMgDQphbmQgNTEyayBodWdlIHBhZ2VzLiBBIFBHRCBlbnRyeSBjb3ZlcnMgNE0gc28g
cGdkX2xlYWYoKSB3b24ndCByZXBvcnQgDQp0aG9zZSBodWdlIHBhZ2VzLg0KDQo+IA0KPiBUaGlz
IGhlbHBzIHRvIHNpbXBsaWZ5IGEgZm9sbG93IHVwIHBhdGNoIHRvIGRyb3AgcFhkX2h1Z2UoKSB0
cmVld2lkZS4NCj4gDQo+IE5PVEU6ICpfbGVhZigpIGRlZmluaXRpb24gbmVlZCB0byBiZSBtb3Zl
ZCBiZWZvcmUgdGhlIGluY2x1c2lvbiBvZg0KPiBhc20vYm9vazNzLzY0L3BndGFibGUtNGsuaCwg
d2hpY2ggZGVmaW5lcyBwWGRfaHVnZSgpIHdpdGggaXQuDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci84N3Y4NXpvNnc3LmZzZkBtYWlsLmxob3RzZQ0KPiANCj4gQ2M6IE1pY2hh
ZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8
bnBpZ2dpbkBnbWFpbC5jb20+DQo+IENjOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+DQo+IENjOiAiQW5lZXNoIEt1bWFyIEsuViIgPGFuZWVzaC5rdW1hckBr
ZXJuZWwub3JnPg0KPiBDYzogIk5hdmVlbiBOLiBSYW8iIDxuYXZlZW4ubi5yYW9AbGludXguaWJt
LmNvbT4NCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgLi4uL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC9wZ3RhYmxlLTRrLmggICAgICAgIHwgMTQgKystLS0tLS0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oICB8IDI3ICsrKysrKysr
Ky0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDI3IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvNjQvcGd0YWJsZS00ay5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC9wZ3RhYmxlLTRrLmgNCj4gaW5kZXggNDhmMjE4MjBhZmUyLi45MjU0NTk4MWJiNDkgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS00ay5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS00ay5o
DQo+IEBAIC04LDIyICs4LDEyIEBADQo+ICAgI2lmZGVmIENPTkZJR19IVUdFVExCX1BBR0UNCj4g
ICBzdGF0aWMgaW5saW5lIGludCBwbWRfaHVnZShwbWRfdCBwbWQpDQo+ICAgew0KPiAtCS8qDQo+
IC0JICogbGVhZiBwdGUgZm9yIGh1Z2UgcGFnZQ0KPiAtCSAqLw0KPiAtCWlmIChyYWRpeF9lbmFi
bGVkKCkpDQo+IC0JCXJldHVybiAhIShwbWRfcmF3KHBtZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9Q
VEUpKTsNCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcG1kX2xlYWYocG1kKTsNCj4gICB9DQo+
ICAgDQo+ICAgc3RhdGljIGlubGluZSBpbnQgcHVkX2h1Z2UocHVkX3QgcHVkKQ0KPiAgIHsNCj4g
LQkvKg0KPiAtCSAqIGxlYWYgcHRlIGZvciBodWdlIHBhZ2UNCj4gLQkgKi8NCj4gLQlpZiAocmFk
aXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3RvX2JlNjQo
X1BBR0VfUFRFKSk7DQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0dXJuIHB1ZF9sZWFmKHB1ZCk7DQo+
ICAgfQ0KPiAgIA0KPiAgIC8qDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvcGd0YWJsZS5oDQo+IGluZGV4IGRmNjZkY2U4MzA2Zi4uZmQ3MTgwZmRlZDc1IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBAQCAt
MjYyLDYgKzI2MiwxOCBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBfX2tlcm5lbF9pb19lbmQ7DQo+
ICAgDQo+ICAgZXh0ZXJuIHN0cnVjdCBwYWdlICp2bWVtbWFwOw0KPiAgIGV4dGVybiB1bnNpZ25l
ZCBsb25nIHBjaV9pb19iYXNlOw0KPiArDQo+ICsjZGVmaW5lIHBtZF9sZWFmIHBtZF9sZWFmDQo+
ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX2xlYWYocG1kX3QgcG1kKQ0KPiArew0KPiArCXJldHVy
biAhIShwbWRfcmF3KHBtZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9QVEUpKTsNCj4gK30NCj4gKw0K
PiArI2RlZmluZSBwdWRfbGVhZiBwdWRfbGVhZg0KPiArc3RhdGljIGlubGluZSBib29sIHB1ZF9s
ZWFmKHB1ZF90IHB1ZCkNCj4gK3sNCj4gKwlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3Rv
X2JlNjQoX1BBR0VfUFRFKSk7DQo+ICt9DQo+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0K
PiAgIA0KPiAgICNpbmNsdWRlIDxhc20vYm9vazNzLzY0L2hhc2guaD4NCj4gQEAgLTE0MzYsMjAg
KzE0NDgsNSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHRlX3J3X3VwZ3JhZGUodW5zaWduZWQg
bG9uZyBvbGRfdmFsLCB1bnNpZ25lZCBsb25nIG5ld192YQ0KPiAgIAlyZXR1cm4gZmFsc2U7DQo+
ICAgfQ0KPiAgIA0KPiAtLyoNCj4gLSAqIExpa2UgcG1kX2h1Z2UoKSwgYnV0IHdvcmtzIHJlZ2Fy
ZGxlc3Mgb2YgY29uZmlnIG9wdGlvbnMNCj4gLSAqLw0KPiAtI2RlZmluZSBwbWRfbGVhZiBwbWRf
bGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHBtZF9sZWFmKHBtZF90IHBtZCkNCj4gLXsNCj4g
LQlyZXR1cm4gISEocG1kX3JhdyhwbWQpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFRFKSk7DQo+IC19
DQo+IC0NCj4gLSNkZWZpbmUgcHVkX2xlYWYgcHVkX2xlYWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9v
bCBwdWRfbGVhZihwdWRfdCBwdWQpDQo+IC17DQo+IC0JcmV0dXJuICEhKHB1ZF9yYXcocHVkKSAm
IGNwdV90b19iZTY0KF9QQUdFX1BURSkpOw0KPiAtfQ0KPiAtDQo+ICAgI2VuZGlmIC8qIF9fQVNT
RU1CTFlfXyAqLw0KPiAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfQk9PSzNTXzY0X1BHVEFCTEVf
SF8gKi8NCg==
