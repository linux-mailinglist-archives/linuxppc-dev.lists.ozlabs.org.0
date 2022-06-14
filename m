Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360154ABEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 10:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMhj30L5hz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 18:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=CBErJmxW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feae::805; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=CBErJmxW;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01acsn20805.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::805])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMhhF6CWlz303D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 18:39:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqFd5mzGc1QrijdGQcRqnepnQFHI4QdGPHXcnubMo6CXJb9qjNE0n3tN9WoU/qPgjfMuUyloQwtIUbBlenOcHPdoT32MLnylQbZ0XSR4xyxtj00QXNEBTp+lO2XtXKk0MXWRAGn7aRNaofS5+yWYeoe9Nu/TL33dRn1+5U6YM7J8DiSeaIOnX5YfdbPitRQVLCr/kMRTFftp5qkb1Gqc/cjN1vH+MeX9M6vLqgLQRk7dQOkisRYoLrz+kSoykXpNjLR5fqeYyKn9VgnL8mGlrD+RGsICKn9GDkA2Ty8C+vMPWjluK24n7bejqYkvJIchPBusM3NdTgOPKAKnhQzVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHvF+davT/0BFcV22N66AYhGZEqvyuLNf0kJ1AtZwGA=;
 b=afDWl5z9FvA7azboQIjGHbxhp4W9L/4RqmZ46hCvedVR0mmq7uR7n13BW1JWUvcLYFWoRFBMLsEIl/BVj5pd8n1KcIu5XqrP7aGsvCt6MjxCE+cWs2QyTFeoyKzAic3Tv4V5AL3sAAnoHrj3ua1lvVOmJs75h+qwwmiyTRPpyN4V4r8rGjScYdoCIDqwAre1kKkI5qSx4T2jkUDkVR07G/VmSfsPkegiaS69Z+/RZzQCRMh8CEZ4Qyl2CWXq+11qzfnl3B+2/Wm/hgel+ktjKauFLmnifU9irYT+j4fqJ7ifsUbz+ITFdnvQdbq8Sr6bdr2IJ3kaTYTAwgjGwhFp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHvF+davT/0BFcV22N66AYhGZEqvyuLNf0kJ1AtZwGA=;
 b=CBErJmxWQ1AIfkMHiClL6tu39lss20MTnLZQ4KaR1ZLunnNIwgQAWO/kiTxoCxs1k+dr9Fz1AXtY3AK+w4GzDKRAVT4HAaEYBivBtz1nvKuicsjUUseUUGooGZYd65iEET1dunsMiV7T1KEMtan30foXo8JMy7+x6gqvkaazbFh8w2uMV2pn0XScwlPXPxRqt7dSGnG5YgIcJAeQOu6oM7GJ36FVkrNslejU2a69pJ0Jc/5Cb1o/ALrRmwIx1b5TYhQ2yD/E+T0TUr1youlPqHgEvtutXnRpGtMFj+eLM1MKa7pV1Zn0tWDaUIi3a3eXBexwwOWG1+ADnjFh8XhWdQ==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by SL2PR01MB2683.apcprd01.prod.exchangelabs.com
 (2603:1096:100:53::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 08:39:36 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 08:39:36 +0000
From: Wenhu Wang <wenhu.wang@hotmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Topic: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Index: AQHYf8PgfEfUKvdhvUy2TYJx5fnwT61OiuIAgAAH7jk=
Date: Tue, 14 Jun 2022 08:39:36 +0000
Message-ID:  <SG2PR01MB295125ACF1B4A7BF7DBB74E49FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
 <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
 <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqhAxj0dLoUkBZfg@kroah.com>
In-Reply-To: <YqhAxj0dLoUkBZfg@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [eImnR5xyGKxXSxkGO0oQ6q91G0kMUkwZ]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba02e1e6-f52c-4e5f-b3a0-08da4de169ca
x-ms-traffictypediagnostic: SL2PR01MB2683:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qrzLaL1Orx9lAKMFO0DyHZZl+XimJ6r5SEKfCIcd2RzY25GKflyEc4Pa61gFZLXBOvKCVZQp7trIxTZA+yq31E+ulyip2S1N/rhVpNEeuaC9OoBGYLAQau+3QHp/geQmN9p3f/3Z9kUKcadreuuuTJQlHPbiCT7Plz8oFz1etaH6uGboCqek38NaqYzsE3uxpR1mWLsUoZW6gXldSIGEJIu6NLqb4Z9LifW4w5XDXdPbC70aXoeDWvVwXjMkAFBW9A9bfvA603smO6ACp3WQD3B0/lxBgJf0sB/y8Ie88hiLevcu10h/jawcQx/V5H/V16mr3Cz2YQ0mfbAs9Ar6GDhUfP7FSpO6vaiZTbFKcDvYZ90BdJLhukyY6YiV5cq3x93ERPe/NG1vikJX1+MGVmoRSWn+yc+hMnbMK7WDHQ6Sgt+KjYMnwBoOImEVqhIzT6emWIGsFb7na1JWgKdNhjsx5mrOmtOzN00d4Be7ugLIC6EsrLn2VR9VjV4rgK191qg+07xl5LYgqUQFboZqL17CKiFZJl3BhMT9gHpuCyhLvBw0xI7/Al4XyP7fj8Kw6doBXSf2hmyP6ZbL+XdA8qPHCzRPbybuxuxD8aoWRx3lOTJjY9RQzBvPqafwNFZx
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?gb2312?B?QkcvekVxVG9sQ01vVXNoNE5ydkNXelZBMEdaUjdpc2w4VDBZazltQXdXWmRE?=
 =?gb2312?B?VGhBdzArOEJ6UWxVR0hSSVFqZXQrTEtGbHgvWUhRUXFLNHgycW1peXBmWjNi?=
 =?gb2312?B?b0xHeUlLYjkzeU9QaktLS1pHbnkrMWpKT0VZZmFicVVla2hrSGhDOVY0Wkhi?=
 =?gb2312?B?SW1WaVlEcmMxQ2JyOWJMbEJ6a2Yva3ROaE5FMzFPaHJBSjhDd3VFN1EwSzFM?=
 =?gb2312?B?Yk56RG9Vc09jK0UybGNCeVdKV3VMNEVSenpqUmxjOHFnNDJJY25HcUJVZ01M?=
 =?gb2312?B?ZnNQb20zMWRlNCs0NDRrZWhoaHZHOWI0bmR3SUcySEpjUjNlWm5uMGtLeklV?=
 =?gb2312?B?aVpVdnFNeFdxMndKeXJNcXplOEwzR3I1cFQxRUhEQXYxcWdvZ0tBalU3TFNG?=
 =?gb2312?B?YkdkczcxMjVYRmJjUFlFVEdQdVlrbklOUE8rM2pYQkNsR1N6bmdVVTBKendh?=
 =?gb2312?B?UFdscmhvcWM4QzZXTVpNNTdBMW1GbVp3clRtc0xiSmFVcWtzNGk2bFlqTS8w?=
 =?gb2312?B?enVwSERsaTA3N0dJdlQrYkdPekJydmNiTFRXT1VCcEZpQW9qTUU3NGIxNVBP?=
 =?gb2312?B?MG5ZSmhtUWE3NEtFUXlVMkF6dDF2RlByQi9JNXg2dDRSOGMwN01xU0wwVmd4?=
 =?gb2312?B?a3J6aUN6a0YrMzFPSXVIWU9FbW1CN3ozeW9LQk9UL0RKMHNtcXF0NDNjazlu?=
 =?gb2312?B?dkwvTTJKYXZSbzZPUlFoc210N0hwQ2hVWWVDNjdFbWZTckpaWjByRzlZam1a?=
 =?gb2312?B?ZnNEYXZuYitNSkUwUHdZMHJPaDcwYTROVnVEQ21VSHdTUTY5YjJTRDlmN1Jz?=
 =?gb2312?B?eTV1ZjdZOWh2eWVQQU9QWlY4c0NsY3Qram1KNlNQR0t2MWttU2pDYktkYnF1?=
 =?gb2312?B?YU9iYng5OHBmWVVDaVpqSDZaa3kwUTBrb3pHQXlkTkR4YkkzNDQ0aXVBQk5V?=
 =?gb2312?B?OFJnYldXM1E2TUZrY3pGUi9JelNCR1Q1TWRQSDFVUzZlK0plY1JIMDJVSjBX?=
 =?gb2312?B?ODN5cTVLWGVNV012aWd3UktiODd5V1p1bjVGQmFBMGJpeDhWcW5ZMTBoTlJ6?=
 =?gb2312?B?VGtJQmowUTN6SjJNUXpRVTFaeDNjTzZsbnZyRGNIZVZONEVteFI2SWl6Nndu?=
 =?gb2312?B?YWxLK3h0ZWtzTUpCUnNMeG9mQ1JPdWEzL0N0VnNrMm9QTW8rZ05acHVCNnI1?=
 =?gb2312?B?eFduUUgybmM2NzhKRmxTUGo5cGs5ckdDWlBmd2lOczFGSkNMZ3F5ZFBQRFVz?=
 =?gb2312?B?NXRuaUIvVkJFWkREVi9aazRWTmhIZU94MnBEcmdFTlkzTmZPU3BkTUxQK2tm?=
 =?gb2312?B?Sk9OSWR0VThmMVc3V0NnYmRnMnZiSHZ6QUo2UkcrUEhQZGdUQ1VaZGlEc1d5?=
 =?gb2312?B?WEhURk1EUmxBSTBiQ1ZVVWlvTDQyN3ZTb0Q1eUtZemMyeHNZOExDWCs0ZGZB?=
 =?gb2312?B?QWtUSXdnZlFacXVVVzFOWEhhSHhmeXJ4dFh2b24rSUR3MXZkNmdocGs4SENW?=
 =?gb2312?B?cE5JNmh5ZjI2SnJMN1ZpV05TcndiaklWbkhtVGR6cTc0Y2pKMGU5MzVzWW9M?=
 =?gb2312?B?czF1K0x4cnRFV3pVRC9ROHNKZmtPZlZjZWtwY0VOc25mT0pISGdyZlZ4eGpK?=
 =?gb2312?B?bDFObWZrdlFWTDNhaGVnWGFPMmRDTjdENElhQjBvODF4alZVN29RRzNFbGkx?=
 =?gb2312?B?eGdqNGhHaU13OXUyVXF4MzVGYWhjRVFJaHhHMkVKYWdQS1NFbTFhcDlNdHMy?=
 =?gb2312?B?NUZuUEhFekxpVEs4V0pGWmVTdlp4WEdEd2hpdlRPSUIxTDlDcnZTT3poekdX?=
 =?gb2312?B?aVp0OTBML0tQeGtmVTAreWowc24zNmN5azE4L3paSlE3cFVqcmsxdDZqMjUy?=
 =?gb2312?B?d3RkNEllZE5lM1h0U1Y4WU44MFdVZHgySXh0cW1HazhqRHAxSXd2T3dyemlq?=
 =?gb2312?Q?kMwUCKQoQM4=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ba02e1e6-f52c-4e5f-b3a0-08da4de169ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 08:39:36.3750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR01MB2683
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pk9uIFR1ZSwgSnVuIDE0LCAyMDIyIGF0IDA3OjUzOjQ2QU0gKzAwMDAsIFdlbmh1IFdhbmcgd3Jv
dGU6Cj4+ID4+ID4+ICsKPj4gPj4gPj4gK3N0cnVjdCBtcGM4NXh4X2wyY3RsciB7Cj4+ID4+ID4+
ICsgICAgIHUzMiAgICAgY3RsOyAgICAgICAgICAgIC8qIDB4MDAwIC0gTDIgY29udHJvbCAqLwo+
PiA+PiA+Cj4+ID4+ID5XaGF0IGlzIHRoZSBlbmRpYW4gb2YgdGhlc2UgdTMyIHZhbHVlcz8gIFlv
dSBtYXAgdGhlbSBkaXJlY3RseSB0bwo+PiA+PiA+bWVtb3J5LCBzbyB0aGV5IG11c3QgYmUgc3Bl
Y2lmaWVkIHNvbWUgd2F5LCByaWdodD8gIFBsZWFzZSBtYWtlIGl0Cj4+ID4+ID5vYnZpb3VzIHdo
YXQgdGhleSBhcmUuCj4+ID4+ID4KPj4gPj4KPj4gPj4gU3VyZWx5LCB0aGUgdmFsdWVzIHNob3Vs
ZCBiZSB1MzIgaGVyZSwgbW9kaWZpZWQgaW4gdjIKPj4gPj4gVGhlIGNvbnRyb2xsZXIgaW5mbyBj
b3VsZCBiZSBmb3VuZCBpbgo+PiA+PiAiUW9ySVEgUDIwMjAgSW50ZWdyYXRlZCBQcm9jZXNzb3Ig
UmVmZXJlbmNlIE1hbnVhbCIKPj4gPj4gIkNoYXB0ZXIgNiBMMiBMb29rLUFzaWRlIENhY2hlL1NS
QU0iCj4+ID4+IFNlZTogaHR0cDovL200dWRpdC5kaW5hdXoub3JnL1AyMDIwUk1fcmV2MC5wZGYK
Pj4gPgo+PiA+VGhhdCdzIG5vdCB0aGUgYW5zd2VyIHRvIG15IHF1ZXN0aW9uIDopCj4+ID4KPj4g
PlRoZXNlIGFyZSBiaWctZW5kaWFuLCByaWdodD8gIFBsZWFzZSBtYXJrIHRoZW0gYXMgc3VjaCBh
bmQgYWNjZXNzIHRoZW0KPj4gPnByb3Blcmx5IHdpdGggdGhlIGNvcnJlY3QgZnVuY3Rpb25zLgo+
Pgo+PiBZZXMsIHRoZXkgYXJlIGJpZy1lZGlhbi4KPj4gRG9lcyBpdCB3b3JrIHRvIGFkZCBjb21t
ZW50cyhhYm91dCBvcmRlciBhbmQgYWNjZXNzIGZ1bmN0aW9ucykgZm9yIHRoZSBzdHJ1Y3R1cmUg
YWhlYWQgb2YgaXQ/Cj4+IEFuZCBhcHBlbmRpbmcgbGlrZSAiX2JlIiwgIl9hY2Nlc3NfYmUiIG9y
ICJfYmlnX2VuZGlhbiI/IChzdHJ1Y3QgbXBjODV4eF9sMmN0bHJfYmUgey4uLn07Cj4KPk5vLCBu
b3QgY29tbWVudHMsIHRoZXNlIHNob3VsZCBiZSBvZiB0aGUgdHlwZSBfX2JlMzIsIHJpZ2h0Pwo+
CgpZZXMsIHVuZGVyc3RhbmQuIEl0J3MgY2xlYXIgc3RyYWlnaHQgZm9yd2FyZC4KSSB3aWxsIHVw
ZGF0ZSB0aG9zZSBpbiBwYXRjaCB2Mi4KClRoYW5rcywKV2VuaHU=
