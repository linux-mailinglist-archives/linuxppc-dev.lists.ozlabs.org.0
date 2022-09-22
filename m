Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB155E5E1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 11:06:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY8XB5ZnVz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 19:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oKqoWGGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.71; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oKqoWGGh;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90071.outbound.protection.outlook.com [40.107.9.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY8WN6Hzyz2xJ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 19:05:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD2/fxUeQjJHW+kuTSg+3MWhMdzTXqF/qfsAZgAIGthr710wu++2JZkbRfHByXuzzkp3QOPBbGoMZxG3NIwSLbrwpkQqCXxRpiF3MS1OXYEot26JN+Kep9mpui1VkKTrabRW9zhHu1vNhloqFIlYD04V3Mznpeu3OSqslII78KL00DzlSXBomrBTIvF+X0xoYi9vZudyf0yWWxNhjA5cAQjKWtNu8ROYd+CGFbMz1CSHD3EgdOfVnqgDQEV31sk8+NAeYGgwOo7R4VuezR28+Od61Az6g0CIZ/KTMkPukuH1MigF/iUy1YzVwx4kSByHKxkPYgptm7NRDTw8ontbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQmQLC9bQPiimriBVdhpRDpWwMKziP4thBnap6TnTTw=;
 b=m+2OVwpaggtF22yuuB+HYfl0L+j4iGkCtGb+lEiUcBiWvgq7rC/Uf+Eskz4PENr8eSeQpmvixNNEGWfrb7+GNLLqeXLJA+qm/LuoOnprualpOZgQPhdVFkXAvv1VBp9qHw4Mx0fSXO6MGwaPUJ8LSnWzcZAkA0cJVcnJ5s0xiC+1B3Da1/+poV09q0O+Km7fvXKL7UGQ8hF52wBmIb8Km2sv6+rF/VsXe3UYVTTHiLOz+cmNaQPVsbQawsP2zmVQV5tl4Q338/aEvKnhTHl5wFtQwE31XveHzMEItNRvJIeuIikfSq/oDHoOEieeQoNnFxxs5wC4grWlu3rgxaHBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQmQLC9bQPiimriBVdhpRDpWwMKziP4thBnap6TnTTw=;
 b=oKqoWGGhA/H3IBvu44NO6DMZk6LIQ0l8oq3ITVkLSD78CJwPX/ItSKgY7TbL7noaN+aO/paRq7OqVFkRIoZdV4PBQbqfA6aVE4dy9sBeerNhL/aOtqM4ceT1uFqb+p83EKO+nFa66l/B2mNi5alTKZTVIOcSBRkbaYH7BETpNjOIYkbzfWWe9W3fhHj2en3KC76D5y0LHM7zfMqBxOAnjyCe8b1rulrzo3GTSpwtEs+zh4h00sxzP5jhr4VZ6q05Ax08deuuneiR8nCSO7GYxJGWfyVWxTXehABb5VM6+o+pF9AJU/oIqrZ3xp+yg09YzUnArOZKcjx/SGh0uxKXdA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2218.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 09:04:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.024; Thu, 22 Sep 2022
 09:04:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Haren Myneni <haren@linux.ibm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Ignore DSI error caused by the copy/paste
 instruction
Thread-Topic: [PATCH] powerpc: Ignore DSI error caused by the copy/paste
 instruction
Thread-Index: AQHYzl2Zrfbvkfs2z0GIPt/oEu5vWq3rKAqA
Date: Thu, 22 Sep 2022 09:04:57 +0000
Message-ID: <859d233e-99c6-be6e-d770-dff511101109@csgroup.eu>
References: <bc3ff98e0da908d452cc161d6e1aca8ccec02d03.camel@linux.ibm.com>
In-Reply-To: <bc3ff98e0da908d452cc161d6e1aca8ccec02d03.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2218:EE_
x-ms-office365-filtering-correlation-id: 9ffd66b2-de30-4e5a-b54b-08da9c7985be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NNzQpCbTlVp+ykeg5HvGAgOlZW/vEmyovFd1qa+p8UyQ84xFn7VIesNlc1B/wqxBuYT6vvqXsKdn9huERMUAd+84T8fncnKkYYGIckFF680sSa1gKmwMrwrJk9jZ2Gs429Fy2uyIW6Xau4nv6jAEjGQyAv+DjV/9eGMma1ngcjuPPXziR1MmkJFoyPbRyzrkv31lzvH9TZg61DkiIP57nvLdQ5HbG6F0nEPzU9alTQaLvt1LgMgN3SyXtepl19G+brxx5F8TUkURETrEPN9pd2FTnxZO/yRo2n0pFOPmNMjLkntcwhHjZQZOb6kDCgLg/sUmOHh62ILAku8NEC7hGR00zKwlKzsBpFpVhimE9hruHhrRvjVIZgu2bumxpPseCHtK6MLkprr9ieU8zzBIY8zr2IpG94n8UDTwYTf90fdpkRYR+AiX+oUCcUeRlt/iKFiwN58/AQhdvq4Jk8LtnzPBwmO3n76AaEgdYMfQI75+eUUaK0xTEUDhXClDCi6vu01z/dS7Rwqg5TFckm0f74YLsnWiK1QXe3rDDMgtCCS/RM2JzU52GYdjfR7HWfW45hDdUCTTLCmM1V4enN0vGN+x0qIlyRSFstjRFz4JiknXtjFgbb/7dmUqFN/5I6at7S9VB3LPHE0ZjVsS7UXT0N6wnDJ0dONoTwckV2ZRBZ3AaK/XLXUWcS9mlFcBm+kcD2pHvLPrlnzwDU+vmTBWRVdPwvW6QHTzfTl53eHBPoDlqgwkAAh/eLsBkLvIbwuvfs8sHIPlu93qDc34Zx5BHyenxbL0J3tQ1FeGdzUE3vvtlUhZnYvOmfB0JbFOyLpixZZkVgOTCbbRzrG6IiTbZg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(451199015)(26005)(36756003)(6512007)(316002)(2616005)(478600001)(6506007)(110136005)(6486002)(71200400001)(122000001)(91956017)(38100700002)(38070700005)(83380400001)(66574015)(186003)(31696002)(86362001)(76116006)(31686004)(2906002)(64756008)(8676002)(66446008)(8936002)(5660300002)(44832011)(41300700001)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RExmazNncDI3SnVnMTQzby9NRm5EeDJ2L3hLVjdsSWRBcmJETEFnSTEwY0Q0?=
 =?utf-8?B?Nk1rdFFwZGFvbi9OcTN3eVduU2dpZHBWKyszZERDRHBkN0tZR01ha3gzSkpr?=
 =?utf-8?B?OEpJK3MrR0ZOTDN0amlNbnVKYlB1a0daNk1FbjlNaVBtRlFoc1JMYkRhTW5K?=
 =?utf-8?B?NWkrRDlQQWJQUnJhTmdITnovdVFHL295R0tlVXlSNVBaY2dxaGE2UHFVWTJw?=
 =?utf-8?B?WFZmRThCV1ZiNkNzZEN0MDY5R2h1VjJsR0x0bzNGT2F6Tysxamp2QmRlTTVu?=
 =?utf-8?B?OVNKbHpPN3JHOGdxYmdTSkpDRm4zbzFTVUtEWHpKdXlGdlFNc2p1ZWtZTFR1?=
 =?utf-8?B?c0M4M1hkZmRNN0xHRll0eTNCVzhrczN3M1FaRUVTdm83VkpwazhHYkkrc01I?=
 =?utf-8?B?bCtnWllxQXlXMkRFT2lRQ0RTZEsyZHI1WkZUQWllek14K29aZW54K0N3dTZQ?=
 =?utf-8?B?RC9tOXFOWHRML2IrRVZjaDFuc1dsNkE2MEtzWVpoYmV5Q0VPK01BbnQ4QitK?=
 =?utf-8?B?RFpYT2ZCSU9HNXRGTWdTTjA1bzNpOEUxeVVWbjdIUnViSnpoMnFnMzFHMjBn?=
 =?utf-8?B?dFdCM1ZUM01ibkdXVkc2TFI1OWVUS0VhM0FOMEhwZWsyOXBOalNrL2RWMFBY?=
 =?utf-8?B?MUx3R2ZwVVppVWxiK0QwKzZDc2k4SmVMSGNNN1lIM3B3cUd0TW01bTBJS2k5?=
 =?utf-8?B?NXc5T0NwUGVpWFdIdGhOMGtNVkJmZEdISlJHOUZmSmpJdTRCU0VRSHRHbVFL?=
 =?utf-8?B?VFlTdnVaaHhnTjMzUWtTWjRCa21QdjhtWCs3VFlTT1F0TzV2cDN5ZCtVcTBY?=
 =?utf-8?B?Qm56UmYzY3NLY2YwOHRuQnpCeTJ6OGpoVlJEc04vNHdITkY4NHhpVWdTSGhK?=
 =?utf-8?B?VVZLcEx4S1I1cUJkUFBITXRxWFdsNEI1bnYxYmI3MWpoM3RrOEFKWWViSlBC?=
 =?utf-8?B?OUQ5KzJMVXpQei9qSzlZS1Bmam5EZkxzcmFrOXk4WUh0YVJzMGo0VGtRZjBG?=
 =?utf-8?B?dGFQZ3ZKL1lOMExPNXZTZGFvYktQLzU5Ny9aYWlGTWE0WTV6SHlRUWMwaDlF?=
 =?utf-8?B?YWJZaWRPUzR6SVovbjhxcURiTU5VcHBGV1NsczdmVzd2anFOTVM3S0hIY3Va?=
 =?utf-8?B?VkhiUXVIT05seTc2Y0UzQ0ZvdVpDdUVQcGF5M3lmVXo0c1FPMDhMek5RM3R4?=
 =?utf-8?B?bzVRRTY4T3cvSGsva0tlamlMMHVEUjVYWWhqeVMvdy9MZjNpUWkwTk1ZbUpt?=
 =?utf-8?B?Sm5WSEVmVy9VODV0YzBlYVBwaHVvZUxJWi8yNFZtdWNKa3ZaWjhXalZ4K0Yy?=
 =?utf-8?B?T0FjcmZORU9teTNDTHdMd0ZBZXRMVUNRWUhtQ3lmYWJZZmdmNjNORDJoY1pZ?=
 =?utf-8?B?S3hBb1l2L0xGdFhHT1ZyUmJWL1ZkYWdIak9vYmFQVFBsaGhubWYwUVlYZU5w?=
 =?utf-8?B?TWFmL1haY0R1VTR0RERqMHlYZG43Y0dQcG9mVEJ5SFMrRFlEOEY4MUNFMGhN?=
 =?utf-8?B?Q3NRa2Y0ZDIrY3hsbTBkOEF5ZmszQS91VzBlMllRODE1Y3hZTlpuc2FRVEtm?=
 =?utf-8?B?Wnlqejk5YSttL1dhTVhWdjNRR1B6QXlLVjV2Ukk3enBGVGtJc0REN3hjZHpj?=
 =?utf-8?B?NnhSd0xQMkZvWXNUMVhUeVNZMXU5YTZBSlJDeEwrNVdWZDFNRVZTdkYrN1lr?=
 =?utf-8?B?U1VvYkZUZXc2K1hMYjJJeGdDU0xuK0EySWVKcUFxS2lKWGZDVXYvL1ZCbEYx?=
 =?utf-8?B?TSswRHpHeWxSL0EvV1VHL3N2bHlicE4yakVIaVVMV3Q4Yzl0UERGUnlvaVhm?=
 =?utf-8?B?QjhkOVVST0QvaHJSOFg3czRoYmNFaDdXdnBtaHJzdzJjMnV0YW45eEpCdnNi?=
 =?utf-8?B?cHBzQmw1eURHYXVRQnA2UVJGcGMrSUhSUmI2MDBkOEFWQUpmaUFWVGVaclQ4?=
 =?utf-8?B?TUYwTWsyTmcxeHB3dnI3U3RFRFZIM3I3VVhOVGViM3BhTm1wdVFhZS9DWlhX?=
 =?utf-8?B?ci9iMUNqTDhSRHArSHpsRzI0bGRIeTBQRDdqZHhDUmdNUHN6cE1EMlVQRlNM?=
 =?utf-8?B?VnBNWFJXQ3EwZ0MvZStxRnRyY21VU0w5enp4RGVkaVhkV21URC8vdW5WL2lN?=
 =?utf-8?B?YkRwYnpBeWdJU0ZoeDAvRGxGMUhBdVk3R0U0R1Y5Lzl1NkMyemlNckxJRVJh?=
 =?utf-8?Q?xcjYc9AdcqEJ2vbE1NV6SSg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <651B619F637A244384A9F49569E62F5F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffd66b2-de30-4e5a-b54b-08da9c7985be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 09:04:57.4565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zQAVmkDl4wb2TXdqripPhQE3nD95W3c/4Z7w0wHBUkXQ3cC4hWX2sIc7bvlZjCq9Bt44WyHspADajlcerIEOUwhPSKzRGTX/Ku16rsIaRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2218
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

DQoNCkxlIDIyLzA5LzIwMjIgw6AgMTA6MjksIEhhcmVuIE15bmVuaSBhIMOpY3JpdMKgOg0KPiAN
Cj4gRFNJIGVycm9yIHdpbGwgYmUgZ2VuZXJhdGVkIHdoZW4gdGhlIHBhc3RlIG9wZXJhdGlvbiBp
cyBpc3N1ZWQgb24NCj4gdGhlIHN1c3BlbmRlZCBOWCB3aW5kb3cgZHVlIHRvIE5YIHN0YXRlIGNo
YW5nZXMuIFRoZSBoeXBlcnZpc29yDQo+IGV4cGVjdHMgdGhlIHBhcnRpdGlvbiB0byBpZ25vcmUg
dGhpcyBlcnJvciBkdXJpbmcgcGFnZSBwYXVsdA0KPiBoYW5kbGluZy4gVG8gZGlmZmVyZW50aWF0
ZSBEU0kgY2F1c2VkIGJ5IGFuIGFjdHVhbCBIVyBjb25maWd1cmF0aW9uDQo+IG9yIGJ5IHRoZSBO
WCB3aW5kb3csIGEgbmV3IOKAnGlibSxwaS1mZWF0dXJlc+KAnSB0eXBlIHZhbHVlIGlzIGRlZmlu
ZWQuDQo+IEJ5dGUgMCwgYml0IDMgb2YgcGktYXR0cmlidXRlLXNwZWNpZmllci10eXBlIGlzIG5v
dyBkZWZpbmVkIHRvDQo+IGluZGljYXRlIHRoaXMgRFNJIGVycm9yLg0KDQpXaGF0IGlzIE5YID8g
Tm8gZVhlYyA/IFRoYXQncyB3aGF0IGl0IGlzIHVzdWFsbHkuIEJ1dCBpbiB0aGF0IGNhc2UgaXQg
DQp3b3VsZCBiZSB0aGUgSVNJLCBub3QgRFNJLg0KDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgY2hh
bmdlcyB0byByZWFkIGlibSxwaS1mZWF0dXJlcyBwcm9wZXJ0eSBhbmQgaWdub3JlDQo+IERTSSBl
cnJvciBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGluZyBpZiBDUFVfRlRSX05YX0RTSSBpZiBkZWZp
bmVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFyZW4gTXluZW5pIDxoYXJlbkBsaW51eC5pYm0u
Y29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY3B1dGFibGUuaCB8ICA1
ICsrLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Byb20uYyAgICAgICAgICB8IDM2ICsrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMgICAg
ICAgICAgICAgfCAxNyArKysrKysrKysrKysrLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL2ZhdWx0LmMgYi9hcmNoL3Bvd2VycGMvbW0vZmF1bHQuYw0KPiBpbmRleCAwMTQwMDU0
Mjg2ODcuLjE1NGNjMWU4NTc3MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2ZhdWx0
LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4gQEAgLTM2Nyw3ICszNjcsMjIg
QEAgc3RhdGljIHZvaWQgc2FuaXR5X2NoZWNrX2ZhdWx0KGJvb2wgaXNfd3JpdGUsIGJvb2wgaXNf
dXNlciwNCj4gICAjZWxpZiBkZWZpbmVkKENPTkZJR19QUENfOHh4KQ0KPiAgICNkZWZpbmUgcGFn
ZV9mYXVsdF9pc19iYWQoX19lcnIpCSgoX19lcnIpICYgRFNJU1JfTk9FWEVDX09SX0cpDQo+ICAg
I2VsaWYgZGVmaW5lZChDT05GSUdfUFBDNjQpDQo+IC0jZGVmaW5lIHBhZ2VfZmF1bHRfaXNfYmFk
KF9fZXJyKQkoKF9fZXJyKSAmIERTSVNSX0JBRF9GQVVMVF82NFMpDQo+ICtzdGF0aWMgaW5saW5l
IGludCBwYWdlX2ZhdWx0X2lzX2JhZCh1bnNpZ25lZCBsb25nIF9fZXJyKQ0KDQpUaGUgbmFtZSB3
YXMgX19lcnIgYmVjYXVzZSBpdCB3YXMgYSBtYWNybyBhbmQgdGhlcmUgd2FzIGEgcmlzayBvZiAN
CmNvbGxpc2lvbiB3aXRoIGEgJ2VycicgdmFyaWFibGUgaW4gdGhlIGNhbGxlci4NCg0KQnV0IGFz
IGl0IGlzIG5vdyBhIGZ1bmN0aW9uLCB5b3UgY2FuIGp1c3QgY2FsbCBpdCAnZXJyJy4NCg0KQW5k
IG5vIG5lZWQgb2YgdGhlICdpbmxpbmUnIGtleXdvcmQsIEdDQyB3aWxsIGlubGluZSBpdCBhbnl3
YXkuDQoNCj4gK3sNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWcgPSBEU0lTUl9CQURfRkFVTFRfNjRT
Ow0KPiArDQo+ICsJLyoNCj4gKwkgKiBQQVBSIDE0LjE1LjMuNC4xDQo+ICsJICogSWYgYnl0ZSAw
LCBiaXQgMyBvZiBwaS1hdHRyaWJ1dGUtc3BlY2lmaWVyLXR5cGUgaW4NCj4gKwkgKiBpYm0scGkt
ZmVhdHVyZXMgcHJvcGVydHkgaXMgZGVmaW5lZCwgaWdub3JlIHRoZSBEU0kgZXJyb3INCj4gKwkg
KiB3aGljaCBpcyBjYXVzZWQgYnkgdGhlIHBhc3RlIGluc3RydWN0aW9uIG9uIHRoZQ0KPiArCSAq
IHN1c3BlbmRlZCBOWCB3aW5kb3cuDQo+ICsJICovDQo+ICsJaWYgKGNwdV9oYXNfZmVhdHVyZShD
UFVfRlRSX05YX0RTSSkpDQo+ICsJCWZsYWcgJj0gfkRTSVNSX0JBRF9DT1BZUEFTVEU7DQo+ICsN
Cj4gKwlyZXR1cm4gKChfX2VycikgJiBmbGFnKTsNCg0KVGhlICgpIGFyb3VuZCBfX2VyciB3YXMg
YmVjYXVzZSBpdCB3YXMgYSBtYWNybyBwYXJhbWV0ZXIuIEl0IGlzIA0KcG9pbnRsZXNzIG5vdy4g
QW5kIHNhbWUgZm9yIHRoZSBvdmVyYWxsIG9uZXMuIE5vdyBpdCBjYW4gYmUgOg0KDQoJcmV0dXJu
IGVyciAmIGZsYWdzOw0KDQo+ICt9DQo+ICAgI2Vsc2UNCj4gICAjZGVmaW5lIHBhZ2VfZmF1bHRf
aXNfYmFkKF9fZXJyKQkoKF9fZXJyKSAmIERTSVNSX0JBRF9GQVVMVF8zMlMpDQo+ICAgI2VuZGlm
