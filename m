Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4D617826
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:57:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2x1T5ywYz3cMl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:57:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PH223W1h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.40; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PH223W1h;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120040.outbound.protection.outlook.com [40.107.12.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2x0Y3l9Zz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:56:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McotABJTdIwEqkp34RL1vhvvY4352PWxiUAB1m5HhQz3/LUH/y4lfZ6bYNCvONQJSgDJ5lgj+GnybNpjzRe/uOY7+RPWtpAdLLDDoFg2stJYWYQHU+DOkJqk51KGvaWY2ZnXAGlHQiqbuq1TXhHcaU/PZ3uDDB1r47lIVnFcdaxcrI/Gd2CTjeCTkSyRQByjzXxA8brZJAxqQ1ApUARRvdpfsX+TJk5UBE6sGD9kUe7MNMiyt4t25FvqveADoI6ouI4Zog6bnXSXGgFCQ8Yw9vj3T8GOpktYOARzGhPIUrZehAtviaN7jCsJqMJlUoAPDwVKyLJ80s/PGadI8Fm8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDD9JfVts5ii87Ld5NBsmrhfb6hLuTbtUMMhg5liedo=;
 b=PxzO2mqgZAegn5SFGlait9EARsT8nd9FwMMlVTC9Cq+KFdSOegd4KQ+ZHu/V9w0wHag3qcDNQIoxRKNNxTcf+lkfxEcaXqorFARtXWg636stJp3hQGcCgyVc0gF1CCPFohvftqm5EIPPOgS6FPB9wwwdrnHb2GifRaifzhMHVGNd3lmjwCZ+yfzWNU2zPkLZVCc9h5LG/zhA3dXBU9MCryWJT34BTdhSh1bkwogNaWhDpzmhU22ED4VZwqji4Vg0EunJQjqhm+jRY9LE/M8K/C/kCTBzdzidKoCLnxiJ7LZuKUTXYmg5NenMRzFZ6SnqsGh8l/RGV+6kH5CVW4z/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDD9JfVts5ii87Ld5NBsmrhfb6hLuTbtUMMhg5liedo=;
 b=PH223W1hrbVRmuLZzh2PMAqO3jYInLU6QDXDRwfRCxdg2fumcmDc9Q3nbwzdqmnjzqW5rGR+0uUVZ3VfbPIe6QMf11ywVkT8+RU7Q2wxU/mP/dUUnDrud282qVoRyUbtbshSkFku+LhX9dXBpz2Oi39tq+ibSC0ff09LqUSBy2nwbmm8ARQjofoZK2ZXExgVldSMSL00aZ9BrNqrarfsH7FplV6rnthHJN9cFuDlPVNsNRuseLl0ZfIKy6E9kvbjrJzXH8WNQp4aL5aqgExuiBBJv6STYFcuh80SKYdpvnPksUWG7JdX2TvHvgVIa9qgtdEf0UgZQltj5wSn3t6SbA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 07:56:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 07:56:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 1/3] powerpc: Add common pud_pfn stub for all platforms
Thread-Topic: [PATCH v3 1/3] powerpc: Add common pud_pfn stub for all
 platforms
Thread-Index: AQHY50D5ws9u7sIq40WeFtVLgn3Sv64s5PIA
Date: Thu, 3 Nov 2022 07:56:09 +0000
Message-ID: <70e6a35a-f7d8-edc0-fca2-bb16fe6d7ab8@csgroup.eu>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
In-Reply-To: <20221024003541.1347364-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2990:EE_
x-ms-office365-filtering-correlation-id: 403deeab-994f-41a0-c7b0-08dabd70dee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZGyfWVZxYHzZNfXVisIc57PpPRVQ3x8g0iQSkqB97bNZy6lktST2MlXCurxJhMWY+2DOukQzUeixzKbnZmbcm/EQuHn+DHTq3KgXoV0BYtFrawuoHAEUYVCgdjR895DKZOsC9opaNLJUi1kAgDG9b5CDVynq37TByduBCK0b+uoQ6vU7qZWCDyByv80JG99dUddXtgHLt+O7vAHTCIvKIxsPLvNE4BN6RB6vFCLZgdT/8kDlSg64AjPOZOIwyZVf8FqymrKNeYFD1olUQylRCZqqFx0+WWdFPftuHzns0J5Aijj+Dmuf9WcmBsSWhJ0dwO7hgds5SwZN18lDlpTxrEIYO8Ka9aqHnOt7K9I4w94wgzqx9gZfqnmBtXvt/aC7K+/8PvtJVWjqiDln7/PXlVLZxOPv4E60OrWlLQFEVXPzZNiQK6hiJtomEPLHrQqZIsM3ORE+JcVSy0KBWHP4Q5vPw/rJ5cBXtTciisUXau0neR8/E4J1m6hYN9asK6kz1C8JavDKz/A2UTvz5AdZzluQkx7Lz3PUBBm0b9lGTC7knAUNPKzswuDaF1u6MMALNiQN1inOey9Mby0f5yYviQAYbC0fzh8k5cuvycMSrlncLu/S18o8A6LRBoC2qdARjccRQXjgC1V/RyIaGR+9Ln3gQM58fHpIoY0F0kJN02RdO3RYnFZDzDhrjUQyt/wGx63N5HF0oKxf4Vsm2FRxAY6tA3LHgOFoMUb4EotO5OSW/KxdepjL/XdEUP1Pr86ATwXZpkk1FeaBMDy5IgLG2ZXphs4b+rpP7ASiFteI2lmKvT354m+xVmxdmImM9huFqqh6MC8suwR3TsT7AkSgmQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(39850400004)(376002)(451199015)(64756008)(2906002)(36756003)(38070700005)(66446008)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(110136005)(76116006)(86362001)(31696002)(186003)(83380400001)(26005)(6506007)(6486002)(38100700002)(71200400001)(6512007)(122000001)(2616005)(5660300002)(44832011)(91956017)(478600001)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dzFmRk5oVzJpay9tV0pSZ3h5R25WYkVackJtRzRvUkVFSmlxZzI5eTZJYW1P?=
 =?utf-8?B?Qm1tVTgrT0lUMkd6eU9ERG02ck5SMGxNL3dNaEh4cGNLMTM2TmNJZ1lYSE53?=
 =?utf-8?B?cUc3M1h4SERxcDBoZGlCSUlNM09BR2lISCtTcUxaYmJpRTdkWGJ3QXV2TWdT?=
 =?utf-8?B?c0Jxd1JDUGhnTzRaRWZkTmJ2SVFZK2hnb1kweGp4UWN1WVhYdTBwRW42UzRK?=
 =?utf-8?B?RVZYQ3I4M0sxZ0ZrME9EeXFYTDVXdUVyRTM3QjVBN25CY3gzZDI5WlE0T05q?=
 =?utf-8?B?QzJzWlRxUUl0c3g1ekFNRUF6UlR0QWhLWTRseE5qY1ZPeXZOM0RRRDJiamhK?=
 =?utf-8?B?RWFIeGJxb0hPcEVRc0xWTkdKVnFsOUpDS202bTJydVFpNHhTakR6cnM5Y1JX?=
 =?utf-8?B?cmlPcnM3OXJWc3VwMGRxTThoQXdwOWE2UjlkeGRWM3E2QTZ6ODRXdiswdDNw?=
 =?utf-8?B?ZE4wTzRpd3NhaTVaOTA2SkJ3SHRmNUhVNEYreUIydzFJUitaL1hkMEk4eFZE?=
 =?utf-8?B?MHgwSk9aeXdQdkg2cnIxK2IxQXp3aXI5Um8wOG10dnNUSjZvZ093NFFhMjE3?=
 =?utf-8?B?Nmt4UVFPZTFKa0ZrRncvcEpibThrNTRyTkZnRkViYk1FaDYzRFRxcnNNcHlv?=
 =?utf-8?B?d0padjYvMWZJMG1ReTBlQ0M2ZjBNakx0ZkVEYWZKa2xwS3JaSUFQUDBmRTMr?=
 =?utf-8?B?TnFuc1k0YVVGWWE5d3RKUEdXd29hN2NRZGcxRXJyckt1eklySDl2aEJmbHJy?=
 =?utf-8?B?VFdVbUdWRStEK214NmtDQ2hwbGN1ZCtGeDVVK1owTytlTDhOQ25CendpYmVQ?=
 =?utf-8?B?dFJWK2JqcFFqVWRLZ1JkT2pFejJTeWMwaS93b3VXRE5ubmJOY25EcVFWNkVN?=
 =?utf-8?B?Z2Ixamc4U3hTd3YyVGhtRUVmTWhJYnpPR2pCNjFCME82cmFnb2tWWlZqZDNk?=
 =?utf-8?B?cEk5b0pMSVZnUkZ1MTFaY1BlVE5PeUpIRTZtaVRrQzhHV1UyK2I3Zkl6dkhH?=
 =?utf-8?B?N2EzUEVjYm9TWEVYSTk5NUZUdkRzMDFtUWxkd2hndFg3VHJSbEE1NEloSHZo?=
 =?utf-8?B?QWZick8wZEdIMVZ2elN6WUNWeVRWbVl1aHRZbktSa1o3V3NsUG9SclRGbklB?=
 =?utf-8?B?VEd3RHlkUjNLQ0VhSXMvOVdtenBETStJNG5GZGxqemRyMTBVcjFxZXF2N0t6?=
 =?utf-8?B?enRoaythbkF2UWZtdmZpc1g3ODdMaGI1dFlicEwvVHM0MkFwU2U3a3hoQWJJ?=
 =?utf-8?B?L3JPcmJvTkpPZHdWWk50R083Y3hmSUE5NWlucTNhSkQ3NFpoVlZpNDJNQzk5?=
 =?utf-8?B?UitnZ2c1S2NsbHBlWFN1KzJVNTQwZWxqWGU4c3J1aFlZbUIxc3I4RjhsWERK?=
 =?utf-8?B?akFBako0aWxtZHZ2TEFoeHNCSzgzcmxRQ1haSlFpYmtEdTNHc0dWb0RjZ0dI?=
 =?utf-8?B?QXFlNTBkTW9rTnRVeWJQOVYraWxxT2drQnNMemtjMnA1WWVPa1RaK1VqVkRz?=
 =?utf-8?B?cTd5RTd4ZkduUjVOSWsyUXVhWDJpVlZod1dhWm00OFZ2TUQyM0l5a2JYcTA3?=
 =?utf-8?B?VFhxWTlMNUVSVkVmOTBlb3kzZTA0UnVKaWN3VU9XU0d2d2dHZXZIeEQra002?=
 =?utf-8?B?MSs5dFlWWWg2YmZiNkI5aUd5RlEvWEMxS1FpRTd5dWNWaVhaNnJXalVvOXhv?=
 =?utf-8?B?d3g4Q01zWkdueDRyNzJCaUs5L0wzNHBKYUFuZWpBRk5FaVVpUjRTZG9JOVZE?=
 =?utf-8?B?VWpYSHNFUTB3QTRPL2xnNE9KTGljTTRyMms0TzVyK2hQODRXdmMvaFVNQ0ZE?=
 =?utf-8?B?TEo4eVpQNE5GK1BkVFVDclVxSHp0QUFWTjNCTkVRWGNZejVwOEdiVU9uQnpR?=
 =?utf-8?B?dG9wRkN0QmFlb2ZITUtCaG1oQk9EZCs0dDYzZ1Rpbk4zN1JmR3JDUXF2L2Qx?=
 =?utf-8?B?N280dE92WEhJUDUvNFYvSXFsc0MyWDBpdHBLTWFKYndaTVhEZzdDSlQ2TTA4?=
 =?utf-8?B?V2FFRnFkMUNxbWJTYkxkTGZubWJZbUNWS2I0ZkR5d2U2RSt4UEQ0SVNRdjFM?=
 =?utf-8?B?NWNpdXl2VmZVRzJwZFQvUExUalRXUUpTeVBRa3g4dGpTSHdMaWQwbndlWCsz?=
 =?utf-8?B?VzhqZE5IUkhyQWVvOE1haGVuTHpPZnNzOUxReGxLc2c4bUlFNEpVN3htbS9s?=
 =?utf-8?Q?ZlxBiMCDBYMg8lBJ8AwuWGs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C4DADFA8BC5B54D8FB95B6F412AB909@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 403deeab-994f-41a0-c7b0-08dabd70dee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 07:56:09.9057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7q2L8OzV3WGheiqN3+llfpkviLrzGMhEEDQMxYIXQaZzKOYR9gEom20bu+3EB1G7BGli0HzkkLNtP4brA3GSTfhfhbKnDAhV6mZvP6mu1F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2990
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

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDI6MzUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
cmlvciB0byB0aGlzIGNvbW1pdCwgcHVkX3BmbiB3YXMgaW1wbGVtZW50ZWQgd2l0aCBCVUlMRF9C
VUcgYXMgdGhlIGlubGluZQ0KPiBmdW5jdGlvbiBmb3IgNjQtYml0IEJvb2szUyBzeXN0ZW1zIGJ1
dCBpcyBuZXZlciBpbmNsdWRlZCwgYXMgaXRzDQo+IGludm9jYXRpb25zIGluIGdlbmVyaWMgY29k
ZSBhcmUgZ3VhcmRlZCBieSBjYWxscyB0byBwdWRfZGV2bWFwIHdoaWNoIHJldHVybg0KPiB6ZXJv
IG9uIHN1Y2ggc3lzdGVtcy4gQSBmdXR1cmUgcGF0Y2ggd2lsbCBwcm92aWRlIHN1cHBvcnQgZm9y
IHBhZ2UgdGFibGUNCj4gY2hlY2tzLCB0aGUgZ2VuZXJpYyBjb2RlIGZvciB3aGljaCBkZXBlbmRz
IG9uIGEgcHVkX3BmbiBzdHViIGJlaW5nDQo+IGltcGxlbWVudGVkLCBldmVuIHdoaWxlIHRoZSBw
YXRjaCB3aWxsIG5vdCBpbnRlcmFjdCB3aXRoIHB1ZHMgZGlyZWN0bHkuDQo+IA0KPiBSZW1vdmUg
dGhlIDY0LWJpdCBCb29rM1Mgc3R1YiBhbmQgZGVmaW5lIHB1ZF9wZm4gdG8gd2FybiBvbiBhbGwN
Cj4gcGxhdGZvcm1zLiBwdWRfcGZuIG1heSBiZSBkZWZpbmVkIHByb3Blcmx5IG9uIGEgcGVyLXBs
YXRmb3JtIGJhc2lzDQo+IHNob3VsZCBpdCBncm93IHJlYWwgdXNhZ2VzIGluIGZ1dHVyZS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPg0K
PiAtLS0NCj4gVjI6IFJlbW92ZSBjb25kaXRpb25hbCBCVUlMRF9CVUcgYW5kIEJVRy4gSW5zdGVh
ZCB3YXJuIG9uIHVzYWdlLg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzLzY0L3BndGFibGUuaCB8IDEwIC0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IGluZGV4IDQ4Njkw
MmFmZjA0MC4uZjlhZWZhNDkyZGYwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBAQCAtMTQxMywxNiArMTQxMyw2IEBAIHN0YXRpYyBp
bmxpbmUgaW50IHBnZF9kZXZtYXAocGdkX3QgcGdkKQ0KPiAgIH0NCj4gICAjZW5kaWYgLyogQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFICovDQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIGludCBw
dWRfcGZuKHB1ZF90IHB1ZCkNCj4gLXsNCj4gLQkvKg0KPiAtCSAqIEN1cnJlbnRseSBhbGwgY2Fs
bHMgdG8gcHVkX3BmbigpIGFyZSBnYXRlZCBhcm91bmQgYSBwdWRfZGV2bWFwKCkNCj4gLQkgKiBj
aGVjayBzbyB0aGlzIHNob3VsZCBuZXZlciBiZSB1c2VkLiBJZiBpdCBncm93cyBhbm90aGVyIHVz
ZXIgd2UNCj4gLQkgKiB3YW50IHRvIGtub3cgYWJvdXQgaXQuDQo+IC0JICovDQo+IC0JQlVJTERf
QlVHKCk7DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQ
X01PRElGWV9QUk9UX1RSQU5TQUNUSU9ODQo+ICAgcHRlX3QgcHRlcF9tb2RpZnlfcHJvdF9zdGFy
dChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiwgdW5zaWduZWQgbG9uZywgcHRlX3QgKik7DQo+ICAg
dm9pZCBwdGVwX21vZGlmeV9wcm90X2NvbW1pdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiwgdW5z
aWduZWQgbG9uZywNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDMzZjRi
ZjhkMjJiMC4uMzY5NTZmYjQ0MGUxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgNCj4gQEAgLTE1OCw2ICsxNTgsMjAgQEAgc3RydWN0IHNlcV9maWxlOw0KPiAgIHZvaWQgYXJj
aF9yZXBvcnRfbWVtaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0pOw0KPiAgICNlbmRpZiAvKiBDT05G
SUdfUFBDNjQgKi8NCj4gICANCj4gKy8qDQo+ICsgKiBDdXJyZW50bHkgb25seSBjb25zdW1lZCBi
eSBwYWdlX3RhYmxlX2NoZWNrX3B1ZF97c2V0LGNsZWFyfS4gU2luY2UgY2xlYXJzDQo+ICsgKiBh
bmQgc2V0cyB0byBwYWdlIHRhYmxlIGVudHJpZXMgYXQgYW55IGxldmVsIGFyZSBkb25lIHRocm91
Z2gNCj4gKyAqIHBhZ2VfdGFibGVfY2hlY2tfcHRlX3tzZXQsY2xlYXJ9LCBwcm92aWRlIHN0dWIg
aW1wbGVtZW50YXRpb24uDQo+ICsgKi8NCj4gKyNpZm5kZWYgcHVkX3Bmbg0KPiArI2RlZmluZSBw
dWRfcGZuIHB1ZF9wZm4NCj4gK3N0YXRpYyBpbmxpbmUgaW50IHB1ZF9wZm4ocHVkX3QgcHVkKQ0K
PiArew0KPiArCVdBUk4oMSwgInB1ZDogcGxhdGZvcm0gZG9lcyBub3QgdXNlIHB1ZCBlbnRyaWVz
IGRpcmVjdGx5Iik7DQoNCldvdWxkIGEgV0FSTl9PTkNFKCkgYmUgZW5vdWdoID8NCg0KPiArCXJl
dHVybiAwOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gICAjZW5kaWYgLyogX19BU1NFTUJMWV9f
ICovDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8=
