Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D837698D9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 08:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHR4m2sJNz3f2k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 18:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fvYeEJBj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fvYeEJBj;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHR3m5G0pz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 18:12:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdnUT1tSY4r5ni1yDvZO/O1wTCGxU30fqc1tiTU/6tlKGejT+YKm7cFFWHNDgNVlk5Vm0Esc+oj7SMqWNVlQ/MDHKrwzMlgW1nu0aMKEzfBqTalVZbwlhnIDSATZla7XyeWYkj49KpmTOt7dtGggH3vHw/X0vSW5X7tLd9hQBxVIgYAe+07xqRyfxYRvkwwxhtHt5MaY5UVYCbVWBHNSxUB97bYBNuqY6mlR7GnizTeq/puegWHZD67n0dQgfbJhRdhl8GVIWtrntT1mD97+W3SMkMkk9QWBYeftYPzwBHhL256yGXUJt0aDX0nyg1MnfK1dITmfcbVmPGelvwPsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApiSxe1aWj8ukzHxiVdzvhdJNp1KSoTgId6gZai+zaY=;
 b=DmhItXGJrbd6x/ew8ddhrFNfpflh6V631co5xw36rlk4nT0Mk3o/qmwz9TpGhe1somN4bfI7wN97ojTY5NQKnkA714W/+9GZR60BtXG9DqeebPwzC1QYo60HV1tr2mioBS/9a3XLxPB1RGmrqXti0fYn+UF73b4v2JM9yIReJTil0lNWPcLvb/jW34XyI+YkeeuctmS7H3RrcCLwNkufIQvbvabdBKFpkPHAuh4b4ggJVjnbT1nGBkoAdcVOoaDOg7NKL0qlVdiClq/Op173q84eQaC8paoenEeTWG0GOGwqs7A2TnQ6rA62VF30hsKKjlncVxmNkhZRT1kmGPtXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApiSxe1aWj8ukzHxiVdzvhdJNp1KSoTgId6gZai+zaY=;
 b=fvYeEJBjCPkgLZaCw4tXGQlDFbaiLp46yHKInBHfXBDSthImSYuzfb30h/OgBQYXe/B3m9MLIjUwSYtgk/HsUPGU7BjgWhKc50g+jiH0AeSZvgrtMIR2UZ+H2F3sw8J9wQHpS/vY7Z+KgbTS/OQUaK70AEdEpRNV6qVrDjAiby3TL9JQH+Cs3Hw0tgPad8amc2yzdXK2CL61jwso7s+xZ4go32624yE6VCnga0kvYfSo09zaQ6xM+QXdyoAbk7DEntx2y9XtHv2MOsM0EgUvTTYMLBKKL/Ov4u0vx8AI7egVh/dU/gFSZHPxGS4fi4oq8ZwuwB9Fk4rNusnCOkq0og==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Thu, 16 Feb 2023 07:12:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:12:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] kcsan: xtensa: Add atomic builtin stubs for 32-bit
 systems
Thread-Topic: [PATCH 1/2] kcsan: xtensa: Add atomic builtin stubs for 32-bit
 systems
Thread-Index: AQHZQcUG0YdOHgVMFEKNKlnA7MJd167RKIeA
Date: Thu, 16 Feb 2023 07:12:31 +0000
Message-ID: <42e62369-8dd0-cbfc-855d-7ad18e518cee@csgroup.eu>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
In-Reply-To: <20230216050938.2188488-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2022:EE_
x-ms-office365-filtering-correlation-id: 67a21f3d-ee6b-4c77-fcca-08db0fed2ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VOUXgMwNG39lmidvK0xCK8pJ4Nrj2CZ3QfuxPmQEGx3zNIWn6t6K4kAwMbDsRqAmgxZAhu/bayuVmJiIaZTHZg7PSauPoKOqNpG3A42vLYpNP9+DKmK+osZb+hBNMSBHGZhTJgn1tKt0hgnom2jOlF/rdPp0lINiayU1YBgM5use006/e5MqP3An2uvrNPHH3XUPjm45e0BI20tjAYwdQu211RhT6h8GCqnd3Ogh17ygZagqrRDfdgBitdYMZFAElXedcj3Kb20qNiCS+8A7TcEyhm4PhkdyqB0aKxJMZTkzr+lsqE0yfjimMRzSg0/Wob0LcAEE0wZ6PDKcTN4X9fq3l2kQKLYL5CqtP4fY5gf7lK3Re11OHxlw/LIBAjpBLJ6+3l4aNHJP5lxNYPuW5w49I1uk8rI4BNphuFl+QB7aa0Tl+iux+tJEml720Yke4egZ7R9v55vkC5bRSCs1/bRDgrPEZMHzPFZcCb5xtxk2IIwibap/vdJzpHJV3EbmR3qpaSDZSRJ44mHUkd6CkwzZbOSCYB3AsH9iA7qlTBzsqrcVrW0NaNJ+1gM41nI0Gh04M4nb2KZUz3ydYzvVS3KoPVTo+KUCaqLPmuGfnj6EHRIrx+WCvF3ACVAasrGhjhimXmh59IuIdLuFAgK6Rp8PZGJOfJum08ThxVzqsQJFDAosXnmwXDmFui22uOAGFboko7KiWxqPTKKpnGkfsVtHvdTFP5Weam6hpOJ0DXy+UFk6l2ZhFwxBMbPLbYL6
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199018)(122000001)(8936002)(110136005)(54906003)(86362001)(83380400001)(91956017)(66574015)(64756008)(31696002)(66446008)(76116006)(66946007)(66556008)(4326008)(66476007)(316002)(8676002)(6506007)(38070700005)(2616005)(186003)(6512007)(2906002)(26005)(36756003)(41300700001)(38100700002)(5660300002)(478600001)(31686004)(6486002)(966005)(44832011)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OVY5V0ZBWmFEOXIybFE2TGc0NnB0RDV1azNIWEsrbUdIWVNmbnNBeFQ4eTBY?=
 =?utf-8?B?dnNuOGNIV0tFcWQwVTNLeGl1elJlMkdwSVhVVHFVblJReWg1VXcrcnBsNXVp?=
 =?utf-8?B?bW5QYmxXNmVZWHpVV2UyK1ErbkVoZXJvRmdFSHQrMCsrREpyM0xZOCtQOVJj?=
 =?utf-8?B?TVcvZnFqaTI4VzRVRVNlTGpUWTZkM2NoWnd1SDYrNFZHbG8zdmJzbnJlZTcz?=
 =?utf-8?B?MEp3Y0R1Z2luMVNtSUJBcGtjUWlYZUcxRCs5UkxORFRMTnhsVWZsVGMwczVX?=
 =?utf-8?B?ZlRsWXI2dUswZEU3L2hCOGdOT0RSVkM0d0t4TFduRHlSTjgwN1JVK0tSa1M4?=
 =?utf-8?B?UFNtVW9KcTFYS0JoUk9QZmF6Umxpc1dGQnd4NVN6Z09SMzlQc3lVMG1paVg1?=
 =?utf-8?B?dDdjVERQczZBSkxrUGtJQ3ZLUkY0bUVkMWExMEN6SE1lQWRRN1R6WFg5K0tw?=
 =?utf-8?B?L095VFArWndLYS9zV1NLbEc2b1pZaFlxSmlSNnB5bzJpdFBnR1lEbzNTQld1?=
 =?utf-8?B?NVY4Y1BjZFhZZjhNenFwZFpBcDRSTGNXdERORmFxSzYxWUM1SUN2WTlablYz?=
 =?utf-8?B?aVZiWEMweE5xd1JwRXJPbEh2SC83NFN4MW1hR2FDUEU1L0pSVkljOHYvOW1K?=
 =?utf-8?B?NWhoWXkyandoTjhvVTB5aE1CQWhNR0VUU3NaSVhVME5PU0hKbXpZTHRGeUVU?=
 =?utf-8?B?azl4RC9HdkZNYmczNG5Cb0tkdldYT3d1cDV2dktEZGkvbDN1MVo0aDhWeGFk?=
 =?utf-8?B?NjkwamVRNzFVaWxqaGo0cHUwdGxsYXhOVW42NkdlNk5lcXJsckdFUFpzbXdE?=
 =?utf-8?B?Ny9QSTgrTTVObEJQV1BpMEFyVUMxbWRpVnFOcDZBUHlFZlZ1QXBkbFZxWDhz?=
 =?utf-8?B?V1NzenZhNkh3dFBQUUM5bEhGRmNmK0lvaGY2aU1BbDlVT3ZwOXk1M3RnUitG?=
 =?utf-8?B?Z2MzZTRxazVzV0Q1QnRhSFBSRTBmVEpjQWNlRXY2Nzh3RmlWdStmOXY2OHA4?=
 =?utf-8?B?aTQzdld3alV0enduSDZYVlZydllQUGhvbFQrUkN0eU5Va0M1dHhEK1llSW14?=
 =?utf-8?B?SVRVcC9kQUYvRWNncXJ2VUc4VlZ1d29qK1YzZ2lEWGp0cU9COHhJNnE2TnR2?=
 =?utf-8?B?QVJzMmpGdkdQK0hsRHpjTHBSUm1OY3NXQzdDSVp0ZEFvaHgyeUJHdlFkSTJi?=
 =?utf-8?B?UmJMUzBJZk5HWnAxNHZiTm8wUFQ1RFpsSkNGRnFuUDE5YmQ5L0xyM1VLb1Jh?=
 =?utf-8?B?VUpqRnQvM3M2dFVNT0JmYk1zUXZ1dWNPYVBYaS8zako1TVdtbHIydmdkczBh?=
 =?utf-8?B?ZWNKSGZwYVFQU3k0VkpSQmtmczBLL0xwekI0YWF0ZmNaWUlJZ0ZMclBUeTZM?=
 =?utf-8?B?MklrQXE3R3c5ZytPdWh3OStzVHhRSmpHc1JMOHFHRFNzUXpzT1lXcXFFaDdp?=
 =?utf-8?B?azVvSDZYMjFWZDR0ajNOUndwRko5ejN4RldZU29zRW00aXQ4SUN6dkNBcXpz?=
 =?utf-8?B?TmRycmdlaGs0cHBucG13WnVOYmk2Z29rZzlscm54UW9rNlJFbkJmRFNSZmNZ?=
 =?utf-8?B?dnlXaDUvYW9pUUtUdmgxT3o4UHlLcXRpSzZVbWdBODlsdGZRem1adVUzZThD?=
 =?utf-8?B?SG9SN3hMSzNiUXBzQSthb2J5eFpxSEI5aUhnRitLN3haRUQ4NlBkSEJEbWFn?=
 =?utf-8?B?aCtYYVFnZk9qbmwvQjRTeG1PMmMyRnM0R0owMk9mSW02WmhNQkRiakxaNEVK?=
 =?utf-8?B?NHJScFBPMDNncFZaSkFMMmZvOGtzd0VRU2hoQUR1TEwvUERCWDdFN1RiK3du?=
 =?utf-8?B?d2RrTHAzMlhvWUg0bkNmc1NYaWpXbk54R1ZpMVlEbW5vZFB1Lzd0VlFOS2hy?=
 =?utf-8?B?OWNlME5KeThtSzJZc2ZyR0o1UERqWHFhWkprRWpGSU5wSVdrWmdyUGFDcFpI?=
 =?utf-8?B?N3djeTdXczd1ekMvcE1EcGFpNmdpZ0NISFZILzBpTUJ4SUVYUEQ5MGw2UmIv?=
 =?utf-8?B?a09jc25CNlJxMDVJQTV1WUZDSkZuZjN6U2R5dUNNKzZIL2FDTUtpMU1IUzl3?=
 =?utf-8?B?dU5sYmd2RGt4N2N5c0VXL0U3bEVORzN3NWg1cmtPNzBVZmZ0RHludkROeXpU?=
 =?utf-8?B?eUI2OHVIYVdWVFQwamlob09aSjNSV01EQTQwa2FNd2NlUXBYR1UwVCtxSDVN?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68A5DB3C578889458F7CE706915B6B1A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a21f3d-ee6b-4c77-fcca-08db0fed2ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 07:12:31.7061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKWw3qmup4UEkMI88NICxW56bFTgK3N1YBu6I6MpMeMtk9Tv3r2Wzj24YK1sYbRN1N63qugftix1R7RlGNU5LLY8Eh2yO+bn0a47+TJJXYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2022
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
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev <kasan-dev@googlegroups.com>, Max Filippov <jcmvbkbc@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzAyLzIwMjMgw6AgMDY6MDksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBL
Q1NBTiBpbnN0cnVtZW50cyBjYWxscyB0byBhdG9taWMgYnVpbHRpbnMsIGFuZCB3aWxsIGluIHR1
cm4gY2FsbCB0aGVzZQ0KPiBidWlsdGlucyBpdHNlbGYuIEFzIHN1Y2gsIGFyY2hpdGVjdHVyZXMg
c3VwcG9ydGluZyBLQ1NBTiBtdXN0IGhhdmUNCj4gY29tcGlsZXIgc3VwcG9ydCBmb3IgdGhlc2Ug
YXRvbWljIHByaW1pdGl2ZXMuDQo+IA0KPiBTaW5jZSAzMi1iaXQgc3lzdGVtcyBhcmUgdW5saWtl
bHkgdG8gaGF2ZSA2NC1iaXQgY29tcGlsZXIgYnVpbHRpbnMsDQo+IHByb3ZpZGUgYSBzdHViIGZv
ciBlYWNoIG1pc3NpbmcgYnVpbHRpbiwgYW5kIHVzZSBCVUcoKSB0byBhc3NlcnQNCj4gdW5yZWFj
aGFiaWxpdHkuDQo+IA0KPiBJbiBjb21taXQgNzI1YWVhODczMjYxICgieHRlbnNhOiBlbmFibGUg
S0NTQU4iKSwgeHRlbnNhIGltcGxlbWVudHMgdGhlc2UNCj4gbG9jYWxseS4gTW92ZSB0aGVzZSBk
ZWZpbml0aW9ucyB0byBiZSBhY2Nlc3NpYmxlIHRvIGFsbCAzMi1iaXQNCj4gYXJjaGl0ZWN0dXJl
cyB0aGF0IGRvIG5vdCBwcm92aWRlIHRoZSBuZWNlc3NhcnkgYnVpbHRpbnMsIHdpdGggb3B0IGlu
DQo+IGZvciBQb3dlclBDIGFuZCB4dGVuc2EuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBN
Y0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IE1heCBGaWxpcHBv
diA8amNtdmJrYmNAZ21haWwuY29tPg0KDQpUaGlzIHNlcmllcyBzaG91bGQgYWxzbyBiZSBhZGRy
ZXNzZWQgdG8gS0NTQU4gTWFpbnRhaW5lcnMsIHNob3VsZG4ndCBpdCA/DQoNCktDU0FODQpNOglN
YXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xlLmNvbT4NClI6CURtaXRyeSBWeXVrb3YgPGR2eXVrb3ZA
Z29vZ2xlLmNvbT4NCkw6CWthc2FuLWRldkBnb29nbGVncm91cHMuY29tDQpTOglNYWludGFpbmVk
DQpGOglEb2N1bWVudGF0aW9uL2Rldi10b29scy9rY3Nhbi5yc3QNCkY6CWluY2x1ZGUvbGludXgv
a2NzYW4qLmgNCkY6CWtlcm5lbC9rY3Nhbi8NCkY6CWxpYi9LY29uZmlnLmtjc2FuDQpGOglzY3Jp
cHRzL01ha2VmaWxlLmtjc2FuDQoNCg0KPiAtLS0NCj4gUHJldmlvdXNseSBpc3N1ZWQgYXMgYSBw
YXJ0IG9mIGEgcGF0Y2ggc2VyaWVzIGFkZGluZyBLQ1NBTiBzdXBwb3J0IHRvDQo+IDY0LWJpdC4N
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzE2NzY0NjQ4NjAw
MC4xNDIxNDQxLjEwMDcwMDU5NTY5OTg2MjI4NTU4LmI0LXR5QGVsbGVybWFuLmlkLmF1L1QvI3QN
Cj4gdjE6IFJlbW92ZSBfX2hhc19idWlsdGluIGNoZWNrLCBhcyBnY2MgaXMgbm90IG9ibGlnYXRl
ZCB0byBpbmxpbmUNCj4gYnVpbHRpbnMgZGV0ZWN0ZWQgdXNpbmcgdGhpcyBjaGVjaywgYnV0IGlu
c3RlYWQgaXMgcGVybWl0dGVkIHRvIHN1cHBseQ0KPiB0aGVtIGluIGxpYmF0b21pYzoNCj4gTGlu
azogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTA4NzM0DQo+
IEluc3RlYWQsIG9wdC1pbiBQUEMzMiBhbmQgeHRlbnNhLg0KPiAtLS0NCj4gICBhcmNoL3h0ZW5z
YS9saWIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQ0KPiAgIGtl
cm5lbC9rY3Nhbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
Kw0KPiAgIGFyY2gveHRlbnNhL2xpYi9rY3Nhbi1zdHVicy5jID0+IGtlcm5lbC9rY3Nhbi9zdHVi
cy5jIHwgMA0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ICAgcmVuYW1lIGFyY2gveHRlbnNhL2xpYi9rY3Nhbi1zdHVicy5jID0+IGtlcm5lbC9r
Y3Nhbi9zdHVicy5jICgxMDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveHRlbnNhL2xpYi9N
YWtlZmlsZSBiL2FyY2gveHRlbnNhL2xpYi9NYWtlZmlsZQ0KPiBpbmRleCA3ZWNlZjA1MTlhMjcu
LmQ2OTM1NmRjOTdkZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC94dGVuc2EvbGliL01ha2VmaWxlDQo+
ICsrKyBiL2FyY2gveHRlbnNhL2xpYi9NYWtlZmlsZQ0KPiBAQCAtOCw1ICs4LDQgQEAgbGliLXkJ
Kz0gbWVtY29weS5vIG1lbXNldC5vIGNoZWNrc3VtLm8gXA0KPiAgIAkgICBkaXZzaTMubyB1ZGl2
c2kzLm8gbW9kc2kzLm8gdW1vZHNpMy5vIG11bHNpMy5vIHVtdWxzaWRpMy5vIFwNCj4gICAJICAg
dXNlcmNvcHkubyBzdHJuY3B5X3VzZXIubyBzdHJubGVuX3VzZXIubw0KPiAgIGxpYi0kKENPTkZJ
R19QQ0kpICs9IHBjaS1hdXRvLm8NCj4gLWxpYi0kKENPTkZJR19LQ1NBTikgKz0ga2NzYW4tc3R1
YnMubw0KPiAgIEtDU0FOX1NBTklUSVpFX2tjc2FuLXN0dWJzLm8gOj0gbg0KPiBkaWZmIC0tZ2l0
IGEva2VybmVsL2tjc2FuL01ha2VmaWxlIGIva2VybmVsL2tjc2FuL01ha2VmaWxlDQo+IGluZGV4
IDhjZjcwZjA2OGQ5Mi4uODZkZDcxM2Q4ODU1IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwva2NzYW4v
TWFrZWZpbGUNCj4gKysrIGIva2VybmVsL2tjc2FuL01ha2VmaWxlDQo+IEBAIC0xMiw2ICsxMiw4
IEBAIENGTEFHU19jb3JlLm8gOj0gJChjYWxsIGNjLW9wdGlvbiwtZm5vLWNvbnNlcnZlLXN0YWNr
KSBcDQo+ICAgCS1mbm8tc3RhY2stcHJvdGVjdG9yIC1ERElTQUJMRV9CUkFOQ0hfUFJPRklMSU5H
DQo+ICAgDQo+ICAgb2JqLXkgOj0gY29yZS5vIGRlYnVnZnMubyByZXBvcnQubw0KPiArb2JqLSQo
Q09ORklHX1BQQzMyKSArPSBzdHVicy5vDQo+ICtvYmotJChDT05GSUdfWFRFTlNBKSArPSBzdHVi
cy5vDQoNCk5vdCBzdXJlIGl0IGlzIGFjY2VwdGFibGUgdG8gZG8gaXQgdGhhdCB3YXkuDQoNClRo
ZXJlIHNob3VsZCBsaWtlbHkgYmUgc29tZXRoaW5nIGxpa2UgYSBDT05GSUdfQVJDSF9XQU5UU19L
Q1NBTl9TVFVCUyBpbiANCktDU0FOJ3MgS2NvbmZpZyB0aGVuIFBQQzMyIGFuZCBYVEVOU0Egc2hv
dWxkIHNlbGVjdCBpdC4NCg0KPiAgIA0KPiAgIEtDU0FOX0lOU1RSVU1FTlRfQkFSUklFUlNfc2Vs
ZnRlc3QubyA6PSB5DQo+ICAgb2JqLSQoQ09ORklHX0tDU0FOX1NFTEZURVNUKSArPSBzZWxmdGVz
dC5vDQo+IGRpZmYgLS1naXQgYS9hcmNoL3h0ZW5zYS9saWIva2NzYW4tc3R1YnMuYyBiL2tlcm5l
bC9rY3Nhbi9zdHVicy5jDQo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiByZW5hbWUgZnJvbSBh
cmNoL3h0ZW5zYS9saWIva2NzYW4tc3R1YnMuYw0KPiByZW5hbWUgdG8ga2VybmVsL2tjc2FuL3N0
dWJzLmMNCg==
