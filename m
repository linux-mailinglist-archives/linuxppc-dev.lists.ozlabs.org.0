Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E682A5B5396
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 07:31:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQwFc2GT9z3c2q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 15:31:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=cYFvmTbr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.24.101; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=cYFvmTbr;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01lp0101.outbound.protection.outlook.com [104.47.24.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQwDs3Pczz2yPm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:31:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGGy/0QMZ0EojN5ZrQ2lKTIcabjXcbnY91IWdDWHzzjhG55Gjv3nbPSSP5rUi8pw1ZXdiOBNo25eaueQCe4tAxt57+9CqN9DJhF+9ShxT/Pzd999b6BDETPivNZwXy48aMmwwBYIE42iRJZFtSYL1gIzHHaVH2YC2lPpWUyjS851A4MyOTIYyw47IIL2eOed73zK1hTTGKg66CJtd4EC3Mjyo+bASYdsVHZWxjH/8rWbZcNytC6HtXBA7GR8XsxN1uLi19/GphGk3yUibxdhdWjgd71Pktd3LlsRCCDCXq6PsHoSJV7e7cWsro6mSg4hEYhPBRJkbtuNDEiMlDACbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em5IGbfCnNEMgIw8Blz4jFFf5+VL3/nGCWL+9RNhnK0=;
 b=Guh7wJQHXNfut9UVUNsA9UOV/znlL8A+EbPUxi9Id0YjfQIJKwf7Fdps53G2UIKmIzcPtCfSq2C3qg7Who/r+E7PWqEYJfGwyg0yUwFT853PlNcFglpjat00353R2j+Plk/SBO9tNlSaVNYQpXyR2ovh342y8tthCQEgHdwx4sZifylLJ8lQMzYAHbwDc8w4DEHYK3ka6vOE52nbAu/RPleviVodvABaE6+fVcv1jN4owApK4ncNgKvbLKr8acbqBU3SVF4D75LLlqAKBlWItR+qbACS8N3CQsoWLOW0TwAyf8MMzGtMwETdEKodzWi2Pgr89b35qwhyA3/41Z+O+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em5IGbfCnNEMgIw8Blz4jFFf5+VL3/nGCWL+9RNhnK0=;
 b=cYFvmTbruNCeZ3eNUV+eea05noTRdvyvh+ZFlehR0QhRi4BmhpEPppk01EJvIjLVia+75GxSP613sAe91eUlYeMB1J82dufhga9ryjBly3LjbVmM8FZXs7vr4d5VEdG1MyN8rh6ZoRmBIhPoC5Uz/OcBEba7S4vUQT3xjcNeGdkjo57hQP4fJVmGwiAomqSENXFZXLjzfXrUpTPVWRdyHM7lagToVP0Ptw1yUoujna1Me/6Z/uKDSjLneonRxzthbbRTXKqIXAUDRzXW5vs3GCkj4wIzTG4r2/bgkttXbfv2z7Wy8VLckiAFdFpDQrAZmCWP10iQaOkFbCht9XJenw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3381.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:126::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 05:30:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 05:30:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/3] powerpc: mm: move pud_pfn stub to common pgtable
 header
Thread-Topic: [PATCH 1/3] powerpc: mm: move pud_pfn stub to common pgtable
 header
Thread-Index: AQHYxkm7daVXrhBxQE2b1NJ0xGDt363bRQ6A
Date: Mon, 12 Sep 2022 05:30:49 +0000
Message-ID: <d2b304f2-6d6b-fdcb-c852-24bcc11084dc@csgroup.eu>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
In-Reply-To: <20220912014703.185471-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3381:EE_
x-ms-office365-filtering-correlation-id: d20e011b-8fb2-4170-4f12-08da947ff3cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1TQ/htFkGgKuZC9Uz6usmeZJfAdh2jG5BVLsQUdEOolY7i/9sXqBXzSYdyY7DhzdO6wvXZmp2yBQK2XI1v5nHDpmu26syKy6O1dhnyiGWCdrrBiGImmpEJHh5XgeACKHza21L/pa/p2ayBDSksvLDGH05P4f0RBmQ6c/tYrAsjQOeJnStz1uNtqP3iPzp+OSADdFJdTTEfOOIVB54elkMfxmgaUqS42zi7xNXRQxUPLmgvtOs3BouYgOJ33I5ENG0oYADx1p0qyMiIYVaBiRhSAT0m+BnuwRzIzTP19TCgFkrb93SUIJCud8rML4yKQ8kvMF75zg2ldMgFGa4eJ97dTKL2l2lXMQ8JhMJxtGmUtbth2hsCb5QxzHGY8QW6QFvNCtvcChXBKGwyYcomE2FYyFf9sOmgXuw7wXbq/uzOt5YJ580WQt6JK7bnL8/8yNd4q7lFmHfxGYrCYcBiFyXmkGGBZj+WL8R8d0NzoiiPC28k8H00Wvfk4ywg1/0LdWnMveP3JtQUagi44W04I+BX7hIaqEDx7eN3HaOKEel4yGz9bdvV5Pe3NZ3XnJ+3su24a9haBUK1fIsb8DacsWGa88x7jhuwZnXE8G5rk1LpoMCFqRUn6ymB3UzVPBPuLTdJS2U670tSoH1VeXUTHqJz0+ZFzMgsz8fBKtXh4WEYOsevwPt8c+X7ZQk4Wrlj85azb1Z25ccY+SM/hs/N212pRI+7Hm5xW5l6DYOpAKRFjxm1KDGWW7pLibAmGUMAMbb7xCx8aodh7lqjO8kuwQ2DuCXtauaba0299qJGypso3BLa6/rCWE5J20wJJS3ZJMAtX2AcDZkbS7BzRbs/qSWA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(66476007)(38100700002)(31686004)(86362001)(31696002)(122000001)(8676002)(76116006)(66556008)(66446008)(38070700005)(66946007)(91956017)(64756008)(36756003)(6506007)(478600001)(83380400001)(2616005)(71200400001)(6512007)(26005)(6486002)(41300700001)(186003)(316002)(110136005)(2906002)(44832011)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Vk41NWJNNG5zSituU29yWHF6azBDZTR0Y25XYlZsc2tMUkVzeVFnUWRxWmlC?=
 =?utf-8?B?a25aZzdkRkc4aTdDV1VndmVVQnh5emhPazQ5WmtBdFM4WTBZTm9QQ2p1STJB?=
 =?utf-8?B?WDZUNEpHU3ArcTR3OTVXZmZkc1hyME8vZmd6WXZnWDBaTVFPcXZ6MjJtWG1l?=
 =?utf-8?B?WFJ4RHJMMXpROXFSaWpSTmxHNDdhWExzQUlSWjFzUFRDejNFdHZXVkdUZzV3?=
 =?utf-8?B?eEc0VFhzcWpsWW04L0YzckxBc1EvdGJrQmlzWWVCUlR6UDdwYkhoN1o1WWpB?=
 =?utf-8?B?aVdyNk9OS3JacXcvbXd6ZXowV1dGYkdlRnJSZ0pQSmgwcDFnbGw0eEVjWDRm?=
 =?utf-8?B?WmRySG40WTdyQU1pOXJDbVQxVW51NUpINk5McEs0UDZlYjI4VWJtN1psTjlD?=
 =?utf-8?B?dUVtYU1RdXJuaGFJQUZnRVh0MlpGbDg2NElTSS9iTHRPcEJjQmJIR1NHTjJn?=
 =?utf-8?B?a1NUM1VkZlllN1RsaWMzUmQ0VlM5blFYVXBhb2VGZ09rWks3WldYRHdlVWpy?=
 =?utf-8?B?M2RjSzJCUzJDMVI2NWpHejh1TVVBdXNtaEF1YUc5N25hQXFnanUwUWIrZUpV?=
 =?utf-8?B?dWNSVUNiSnYrUjMzajdzckRWK2JtbWdsaWhiUjFteDZjUEZuUU5sc2xVVjZu?=
 =?utf-8?B?ZU5tNVYyYzVFcEMzQk9oV2xGNWRSak45MEUwbzMxekNKSXpQT2ZJTWxZY21U?=
 =?utf-8?B?UG9UL1B3aTR6TW5iMkkrUC9ySXVlK2ZwQzdFbUFVNWw4RmJKelYzekNyTWNk?=
 =?utf-8?B?ZzZFK3QrOG1aVlpBdmtQVDRGSGVzS09ZUGxaOE14WG9MSVVuaW1zQkM4TWp5?=
 =?utf-8?B?L3k4OEp1cHNLbUUrMTZqWnZGRWRPbDEySHBwMk5iRWFVSGlvVEhTYUFCQ3hF?=
 =?utf-8?B?TVc4ZkVuYjFZbERXZFp0M3VXd0VlRGZGazNJUG1vcEY5cEo1WkxCbFBYRHJa?=
 =?utf-8?B?VUh6dDZjcU1zZTVZSnE4UUtPdW9RNm1qdFUyN2pVK2o4K2tqaUlqSzFRbkx5?=
 =?utf-8?B?ems2N2cvMWRSSkJmUXBtYUM0eCtibW9mK3lBMHdlejIxcG5sT2VIbGpPUVJw?=
 =?utf-8?B?VDdkUmVYbGlTZU5NbVQxTTBueWxjQlpGWnFWV2JYNUxDTy9sbGdGM2pCeCsx?=
 =?utf-8?B?NElhQ2I4RHpBMklZMzZUeEl4bDhSTDl1SVNBeUROZDlZMUlyV01wcU5pdXAv?=
 =?utf-8?B?RHh1ZmZuN3BpKzBkczM4VkJ5MGJlR0pzNXVDdWVpWk5YZ1cwV1EzYVRHUThH?=
 =?utf-8?B?SHZSTVRqZ3NkMko1bUE5elNvTktGQmtJQlVMa1JzRFFCVGJRU3UxenZ6M3Zm?=
 =?utf-8?B?LzI5TERjSDROay91UnpXaVZDdGR3Z3ovQzhVRFBPbC9ac3lTNlVTdW1weC9u?=
 =?utf-8?B?SXVHUEU3VFU3Q1BrTGpKeHNXRm5LWi8yeWREb25XTHFrZS9LcGY4Y3lQaFly?=
 =?utf-8?B?WTZCbkN1RlBWTDVReFJkNTVzUUlqOVc0OEs5WVdVMnZUT1V3OXlad2FSVE5u?=
 =?utf-8?B?UmNwVUZxWnRlL1JmYXNLSkJUVVBuYVdEaVFxbmRFUjViTWdkOHMvSGNyY3ZR?=
 =?utf-8?B?ZWpaaDNJOElZdTNZY0FOa0ZJa01FZkk5ZUJSMW12ZHBGUWtMOEVBMWdmTDcw?=
 =?utf-8?B?MXl1MnhkZUpNSi9MUGw4bzRrKy9rbTAxLzVxSWpyOWZhazMzc3pBU25janFM?=
 =?utf-8?B?S0RITTUrSXQ5N09UNXNZLzBHWlltS0xYd2FjWGdtZVQ5L2dZZnNNZCs5L1hK?=
 =?utf-8?B?M2ZIQ2Q0TS9ySDV4Ti9LaFRPUVhWaGl4WElJMnVHSUhBVlhuSHl5ZkIwNEFr?=
 =?utf-8?B?UzY1ZmNiRFpIU0h5Z3gxWTE0cERCODVMWEhnd2QvbFRhZTh3UmpUeU1ic3RW?=
 =?utf-8?B?c0w0ZDVJZnVlcEhNU1dDOGJWOXJvSnFCU1phK2t5bCtwbDhwUkJMbWNaMnli?=
 =?utf-8?B?ZmJIRW5mQzBJemlPaU9VQjdraTYzMmE3NzVoUGFvd0h2a1BlWGdIU09ldCtr?=
 =?utf-8?B?ZitCbzVFUDZJYVFRd240Mzh3M1B6RmJuTXJKbUxZVTg0MlFoZCtpOVRxR2hY?=
 =?utf-8?B?WmtjYjBQRUV2ZFRyWFVwNDFhdytjeVF1RngzVmRoMDl5VTRDL0xuQkpMcEhZ?=
 =?utf-8?B?c0gwQTdJTHhVQVRac2gxU21TeEVJbnZ4d1FtS2FtOThiS0VQWUVob25yVkJx?=
 =?utf-8?Q?9bV/Szsnx8/AnZKkK3TZh0Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3497D137F0E6CE4FA7B41BF79D0E992D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d20e011b-8fb2-4170-4f12-08da947ff3cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 05:30:49.8135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7MMhOZnRFQoi/iM2Lg5bpoEctdP6plGZYrxgac+3P1la+HJoVlU1iBBJzHaB5j9NGxYl2JHxMgqSExU12gM8g+QBniYDGGGkvsbKJwUmRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3381
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

DQoNCkxlIDEyLzA5LzIwMjIgw6AgMDM6NDcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBU
aGUgcHVkX3BmbiBpbmxpbmUgY2FsbCBpcyBvbmx5IHJlZmVyZW5jZWQgb24gNjQtYml0IEJvb2sz
UyBzeXN0ZW1zLA0KPiBidXQgaXRzIGludm9jYXRpb25zIGFyZSBnYXRlZCBieSBwdWRfZGV2bWFw
KCkgaW52b2NhdGlvbnMsIHJlbmRlcmluZyB0aGUNCj4gYm9keSBvZiB0aGlzIGZ1bmN0aW9uIGFz
IGRlYWQgY29kZS4NCj4gDQo+IEFzIHN1Y2gsIHRoaXMgZnVuY3Rpb24gaXMgcmVhZGlseSBleHBv
cnRhYmxlIHRvIGFsbCBwbGF0Zm9ybXMgaW4gdGhlDQo+IGluc3RhbmNlIHdoZXJlIGtlcm5lbCBm
ZWF0dXJlcyBkZXBlbmQgb24gaXQgYXQgbGVhc3QgYmVpbmcgZGVmaW5lZC4NCg0KSSBkb24ndCB1
bmRlcnN0YW5kLiBJZiB0aGlzIGZ1bmN0aW9uIGlzIGRlYWQgY29kZSwgd2h5IG1vdmUgaXQgdG8g
YSANCmxhcmdlciBzY29wZSA/IFNob3VsZG4ndCB5b3UgcmVtb3ZlIGl0IGluc3RlYWQgPyBPciBh
cmUgeW91IHBsYW5uaW5nIHRvIA0KcmUtdXNlIGl0IG9uIG90aGVyIHBsYXRmb3JtcyA/IEluIHRo
YXQgY2FzZSBzYXkgaXQuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1j
bHVyZUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
Ym9vazNzLzY0L3BndGFibGUuaCB8IDEwIC0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICB8IDEyICsrKysrKysrKysrKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBpbmRleCAzOTJm
ZjQ4Zjc3ZGYuLjg4NzRmMmEzNjYxZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAgLTE0MTEsMTYgKzE0MTEsNiBAQCBzdGF0aWMg
aW5saW5lIGludCBwZ2RfZGV2bWFwKHBnZF90IHBnZCkNCj4gICB9DQo+ICAgI2VuZGlmIC8qIENP
TkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAqLw0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBpbnQg
cHVkX3BmbihwdWRfdCBwdWQpDQo+IC17DQo+IC0JLyoNCj4gLQkgKiBDdXJyZW50bHkgYWxsIGNh
bGxzIHRvIHB1ZF9wZm4oKSBhcmUgZ2F0ZWQgYXJvdW5kIGEgcHVkX2Rldm1hcCgpDQo+IC0JICog
Y2hlY2sgc28gdGhpcyBzaG91bGQgbmV2ZXIgYmUgdXNlZC4gSWYgaXQgZ3Jvd3MgYW5vdGhlciB1
c2VyIHdlDQo+IC0JICogd2FudCB0byBrbm93IGFib3V0IGl0Lg0KPiAtCSAqLw0KPiAtCUJVSUxE
X0JVRygpOw0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfUFRF
UF9NT0RJRllfUFJPVF9UUkFOU0FDVElPTg0KPiAgIHB0ZV90IHB0ZXBfbW9kaWZ5X3Byb3Rfc3Rh
cnQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICosIHVuc2lnbmVkIGxvbmcsIHB0ZV90ICopOw0KPiAg
IHZvaWQgcHRlcF9tb2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICosIHVu
c2lnbmVkIGxvbmcsDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCAzM2Y0
YmY4ZDIyYjAuLjUyMjE0NWIxNmEwNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oDQo+IEBAIC0xNTgsNiArMTU4LDE4IEBAIHN0cnVjdCBzZXFfZmlsZTsNCj4gICB2b2lkIGFy
Y2hfcmVwb3J0X21lbWluZm8oc3RydWN0IHNlcV9maWxlICptKTsNCj4gICAjZW5kaWYgLyogQ09O
RklHX1BQQzY0ICovDQo+ICAgDQo+ICsjZGVmaW5lIHB1ZF9wZm4gcHVkX3Bmbg0KDQpXaHkgZG8g
eW91IG5lZWQgdG8gYWRkIHRoYXQgZGVmaW5lID8NCg0KPiArc3RhdGljIGlubGluZSBpbnQgcHVk
X3BmbihwdWRfdCBwdWQpDQo+ICt7DQo+ICsJLyoNCj4gKwkgKiBDdXJyZW50bHkgYWxsIGNhbGxz
IHRvIHB1ZF9wZm4oKSBhcmUgZ2F0ZWQgYXJvdW5kIGEgcHVkX2Rldm1hcCgpDQo+ICsJICogY2hl
Y2sgc28gdGhpcyBzaG91bGQgbmV2ZXIgYmUgdXNlZC4gSWYgaXQgZ3Jvd3MgYW5vdGhlciB1c2Vy
IHdlDQo+ICsJICogd2FudCB0byBrbm93IGFib3V0IGl0Lg0KPiArCSAqLw0KPiArCUJVSUxEX0JV
RygpOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlf
XyAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfUEdUQUJMRV9IICov
