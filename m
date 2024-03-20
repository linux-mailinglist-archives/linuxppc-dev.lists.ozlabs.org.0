Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4E8816B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 18:41:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O/T39WE3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0G9n3F2hz3vZS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 04:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O/T39WE3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0G900lYNz3d2Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 04:41:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Egv5Dnk4yJkXGdeSUYHer4FJwhlz8INJip22dsmoVI7iOTQz/NYjWxJ5LcXhF8TATin83jAWHmSwq//IN51/TTpMr1fB+uWE0dD//Hnlu1n5qLUd9CtGVbg05er1nH8D9c7/m6soxLy3yLXV91SBhZmjCna6Ik+JcZlTrK8SEQAQ9QPDYdaeM4IIUdHH1g8fwtnHUUnfXrz2iqUobKSFSNDWECtvCD8pmexBw+p1sz32eE8+X8UNdeH94TcnOlqIQyayxx8O6OiTDz4ViKYX/Zt/x4L+zSuN9ei2aI4SjfGQ2DEalR4TWuiV1K+a2XO2YwCymBueZ+Sp292mTyzNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOEx3oQ/1i2MhkrtAyWd+CaXyIGmAu4iJGtcVg1w5vg=;
 b=dKMpqC1z6rqssGrHsV+tdjwulfSR3lMFIAvIPpzn53TLVpt9+PTSDE0GUeINuT6DbEtOsnVqmZi+Sxn9GzAs3T++y6MHqDh+GyYUX8jR7K2l+ptX7iFcUw6rbaoLRtPynqIA8D0+dyRLvfIxRPKY9ZzAJu+C5VMKZtGK6FWhR/1vERfxIixq0xyJT7jOwaPvJmU4EOkSXrP8eQe5VDhFf35IxgKqQnWHkrw02KHBxlhNhyxFZY7wnt13fTJVcfW5UdSPAcAwhgHzr+zv5yBSe2eq0hvqpal7tQQDm+rEevDH5mKRVLJLkkxRxTwNvAnkg23ALOgPVaK9aibj81OuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOEx3oQ/1i2MhkrtAyWd+CaXyIGmAu4iJGtcVg1w5vg=;
 b=O/T39WE387dmKFWOUyEbc/AMb+wiMp5czSCuOhz2MD3z+cJzEIQ7rPTR+Y+c+ioddrDT6DK6DwydJ89XLq7t7xuW9oqHUzW0XMFeY2g77pnaS9CwikayDdOicdxDNnl87n9H+dALGVNoEDKl6u5xkIJZxK9AsNp2enN/K8x5hW+TwPDye3A7b9JESlsAfgJlNUWqYc+kAiQHKPRAFlzfq/ZT1iJz4yFfiPvKE9t3EXacG9z+wjl4mUCtEdAfFdnXQblLYwS5LCXZvv1AiEFPXnmRAmGKwRGQMFYOAxw5Y08CSNiMHijPlJ+JB8cub0et7BHE379jTbgCd11aFQ70hA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3469.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Wed, 20 Mar
 2024 17:40:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 17:40:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>, Aneesh Kumar K.V
	<aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Index:  AQHadZASkAUcDDurK02wtpi3kLRmM7E27NOAgABFZ4CAAAUJAIAGfI2AgAIFYYCAAAWMAIAAcnoAgAClhYCAABmTgA==
Date: Wed, 20 Mar 2024 17:40:39 +0000
Message-ID: <2e632389-eb4e-42af-adee-36d5ba6c3d0f@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu> <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
 <20240318161519.GA5825@nvidia.com>
 <e0417c2a-2ef1-4435-b5a7-aadfe90ff8f1@csgroup.eu>
 <20240319232656.GC159172@nvidia.com>
 <7ca8f19e-7517-404a-b7bb-92ac516d87c8@csgroup.eu> <ZfsKIResY4YcxkxK@x1n>
In-Reply-To: <ZfsKIResY4YcxkxK@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3469:EE_
x-ms-office365-filtering-correlation-id: c43d50f5-4cc2-493a-7a03-08dc4904dbc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XnYadDY/OSq7KnWKfyMz2mxsdpV6ZvbEIcjJb2cU4Qx8VOCY0OpD5ds8sEck7zbahEfuE/Y2tAL3VgJP4dgyg4I1v+zH9Ircq0LbC7ApQFXCxuOqL5rNQQBYSepw3SbuwvSug3FJ0v8nB1Eal4eS8axoHSSkUES0+5yoN30b1n+2iR1clgO08nyke9dfBpy96cg14D8hXVytqyrQ6yirObvBiBa/2+BODcs1axvD51qpzOJB6J9WgVoytcZtc6rVhF6aVlp00rIy1/GwX7ht8wEuJEO3+4GxiXxhelH47YFKJvDNQzaMpRowd1fB4XydAjpCYisQ0dkm68yxf8oE/vOPu4C8tWhPucV3+MywFsGAdMNdzH3EOlMnr2t2hf++CarOJh3AcnQFtjTbVXkXJ3SIeoja4XeBi9oaDT5jWxYHMPGcCQFd+uH6UmUgo8ur49emxo0bu3HXi9QZGz5jNrr4eE01H72hJoqH7JCkMloTTEFq4/zsIFscsuqUW9Mprz37hPIdhu2zk2JZ/5/lamjBMD/9+9cSo0pzqODe1Nyv2r5WXRcwMJtBLPZRHJxWUHXKu+bg2rlOs1G0ENpAG15SNeBgh5k+nKufqxqhjyjGexKKNQ2lpQYxQHktVI0dwXZjOGqlKvVMD17wuwbNkHNMyHLSykHTnwuJJAk/JeUV4LcMvvqUjQKuhln1bfK2USyfX1qyOr0IEJ4EcTFxU6woiJFl1Jd8yyHMYp2YUqc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R0k0UUFxamhyMnpiVjBtRGRLYUZDRjRDelNYT2N3dVBWNTJvZWJacWlXYXNB?=
 =?utf-8?B?TXFKczFZc0NCQUR5UTEvdFhieW4rUXV3RElXNE43WlNCNXcvMGZHYkNYUEZW?=
 =?utf-8?B?MGY5MEhPYm1PNnU3eXZEbDBPVXpzOTIwbm9HUG5BUVZ2b1VMWm1HaFRjZ01i?=
 =?utf-8?B?RkZVeGZlRC9xYSs2UWFWbk9wZnp1ZWsxUkZOOHpoeG11K05pemswVTNQdjVk?=
 =?utf-8?B?QWxETTdFWlFOalNnbVdFek5yNWo5b0FLQnFxSkx2K0R2MDMxdEdvNkNmVkJ3?=
 =?utf-8?B?Njh3SktkaU9abHZ1VFdJK2drSm56cm5Dd3ZNMWJETXFrbDlhZ042MjdpcjFq?=
 =?utf-8?B?ZU03d2lsSTU2Z0tJZ1k3WVZqbHA2ODFZaDN3S29lbkFJYTRZOTB4eXF1MWdI?=
 =?utf-8?B?RnZSTzFnRVRqZEVqUlpzODRCcFFnUHplTUVFVGxZQ2Jrd21hNEVPa1A5elBP?=
 =?utf-8?B?ZDZCMy90OUR3YjUzaGpjMlVCR0UvbHNlRlJUQUs0N1lYVFluU0JQZFBwN0pu?=
 =?utf-8?B?TmVXd3k2YnNVc2hWb0VlTEhpa1IwUmZRbXBPbzB6aVZqZG43dDlqZHltS0pO?=
 =?utf-8?B?NDZ1UnBPQk9LTHI1VW5IaEtENktYRUxiUFJjR0hVUU1pNWZwQ3B1Q3pyaS9M?=
 =?utf-8?B?TTdiS01zUCtaUmF0cTdwM3lHSzltVjVYbmNEd0N1R25BUGJXZnhqalYzb00r?=
 =?utf-8?B?MlRTQWMwL0djOUg3TXY4cm03RFNCeCs1UXMyUjVBbzdteXNXdG9KQituRHJw?=
 =?utf-8?B?QStFSll4YVd5UGR3byttaHBRSGJqQlphcExlWlFZSXE3d1dTQU5HTlAxRlhK?=
 =?utf-8?B?QUhGYUo0aHhHcU45aFZJNUt4NDV0eVpPQlZJZzYyS1I2SXZVUklMa05UUEVP?=
 =?utf-8?B?UFRoM1p1cGMzRE1ZU0ZJeU9DbWJqeHlkaXhPM2lDcS9qRnR6NTVkK3lzajJK?=
 =?utf-8?B?ZjhyeEF0SkFmQWFYUTVLY3pJTHEyVytkVzVydGJjckkxak5QL3RDdmQyUXJK?=
 =?utf-8?B?OE1vSVZxOWltVk5oaUdtckU1T2xBYUxubE15RWpObDhCeDFId2FUU0RPL0NS?=
 =?utf-8?B?Ni8wTk8zYXpQQWE2dTRhVVBJam56RzlUc1lRcHFoWi8rYTJFYXpYeVFsSjBs?=
 =?utf-8?B?NXo0N2dzbld1enhmTzgxUERYdy9mWkpGcDRra3ZBMlUzZjZQd2M2WHg1YlFN?=
 =?utf-8?B?WjVDc0tPNXVKcVp2blBNTFB0Z1RXcWFtWnVQMjRFblBVdHdnTWtYSHFlaTRK?=
 =?utf-8?B?WElsT01zTDV1bVJPMWNYMjZkRHZENDBWdlQrSUhpYUNDdDBWUm1CdG9aR2h4?=
 =?utf-8?B?bHJEdnNienAyTTFKUmVhek16YUZJSU5BbjlBS1JxQjBtYXdKM1MzOGdHRFE1?=
 =?utf-8?B?cDJaTGxzOS94YlRETEdkTkhpaUZBTStTbGJGWG9BMVlnbDNENlgrMUlKTGE4?=
 =?utf-8?B?RmpwWnhMMWI3cmhIOXJRNUdHbWdSYXJnMnU0TStRU1YvZWh1ZU5JK0FVa3Fw?=
 =?utf-8?B?OTJWNjFyelBCK2dGVDlCaDA5SUx0SitNWmxRLytHWEtqTE1YTnBsaU1FN0tx?=
 =?utf-8?B?ZW5SZUhURGZQNFAyK044TFdhM3dPeVltdzFZNHVjOVp4d3VGTzZFeU1Rb1ow?=
 =?utf-8?B?SEt0cDFVWE9kOXZrQWs5ZTlZdzREZnJsRCszRXRWYXVvWUpUVG15TkNTdnNL?=
 =?utf-8?B?Y2x5SzZudHo1V3o1cklYaExGTjdxb2lSUGJWVmJhQ3k2MU5FUmhmUjNwdmdo?=
 =?utf-8?B?NW1zMW5aNCs3b2tNZHRhTWRONmFacGtkYVFOMGFzbFRtV0ZaOGR3U3diUXJE?=
 =?utf-8?B?OTdZeTNqNXZ0cFMzOGZNWmRhb1RIL0dVVEozZTVBUDNTREMycHRsSTczWkFq?=
 =?utf-8?B?TWFJQ2dnMk9hUmxYWHpQVnZjZEg1cXFIaGh6b3JhRTMwMjNZV2VUV0RzL1Vu?=
 =?utf-8?B?cVZSQTBuZ0tQdG84QWNQcUVpRzZZcUd3MC9rVnNXZ1ZBdlZKZE9hREZFWWxO?=
 =?utf-8?B?S0dWYkY2UG1rc2ZTWThySW9BVkRjR20zNzJ1S2NneXhzbXQ0MnZ5ZzdhOFRv?=
 =?utf-8?B?VmViTHlpZklwUjdISU1oQzdBVGtLbXhFZlYwT1BCNHhJWnRmekxySFFibWp5?=
 =?utf-8?B?cDdzV3FzcnpLUm5QNzQ4OUxqdmh5MXlKUFdUR0RUWUJEcWdJT2VLTWxOTmcv?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04739AE550E2D34A984B4F873C815E36@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c43d50f5-4cc2-493a-7a03-08dc4904dbc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 17:40:39.5694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zur3MdYr88Gv9ZdIduMGiafwIOU8AesO3hzRrbRjgGu3IyL8Wo17hU32kN6N2fpIdtPo42HxdoHPLfUmKBv2ISOKV5pPuSt+spxEbABluxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3469
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAzLzIwMjQgw6AgMTc6MDksIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFdl
ZCwgTWFyIDIwLCAyMDI0IGF0IDA2OjE2OjQzQU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+PiBBdCB0aGUgZmlyc3QgcGxhY2UgdGhhdCB3YXMgdG8gZ2V0IGEgY2xvc2UgZml0IGJl
dHdlZW4gaGFyZHdhcmUNCj4+IHBhZ2V0YWJsZSB0b3BvbG9neSBhbmQgbGludXggcGFnZXRhYmxl
IHRvcG9sb2d5LiBCdXQgb2J2aW91c2x5IHdlDQo+PiBhbHJlYWR5IHN0ZXBwZWQgYmFjayBmb3Ig
NTEyayBwYWdlcywgc28gbGV0J3MgZ28gb25lIG1vcmUgc3RlcCBhc2lkZSBhbmQNCj4+IGRvIHNp
bWlsYXIgd2l0aCA4TSBwYWdlcy4NCj4+DQo+PiBJJ2xsIGdpdmUgaXQgYSB0cnkgYW5kIHNlZSBo
b3cgaXQgZ29lcy4NCj4gDQo+IFNvIHlvdSdyZSB0YWxraW5nIGFib3V0IDhNIG9ubHkgZm9yIDh4
eCwgYW0gSSByaWdodD8NCg0KWWVzIEkgYW0uDQoNCj4gDQo+IFRoZXJlIHNlZW0gdG8gYmUgb3Ro
ZXIgUG93ZXJQQyBzeXN0ZW1zIHVzZSBodWdlcGQuICBJcyBpdCBwb3NzaWJsZSB0aGF0IHdlDQo+
IGNvbnZlcnQgYWxsIGh1Z2VwZCBpbnRvIGNvbnRfcHRlIGZvcm0/DQoNCkluZGVlZC4NCg0KU2Vl
bXMgbGlrZSB3ZSBoYXZlIGh1Z2VwZCBmb3IgYm9vazNzLzY0IGFuZCBmb3Igbm9oYXNoLg0KDQpG
b3IgYm9vazNzIEkgZG9uJ3Qga25vdywgbWF5IEFuZWVzaCBjYW4gYW5zd2VyLg0KDQpGb3Igbm9o
YXNoIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIGJlY2F1c2UgVExCIG1pc3NlcyBhcmUg
aGFuZGxlZCANCmJ5IHNvZnR3YXJlLiBFdmVuIHRoZSBlNjUwMCB3aGljaCBoYXMgYSBoYXJkd2Fy
ZSB0YWJsZXdhbGsgZmFsbHMgYmFjayBvbiANCnNvZnR3YXJlIHdhbGsgd2hlbiBpdCBpcyBhIGh1
Z2VwYWdlIElJVUMuDQoNCkNocmlzdG9waGUNCg==
