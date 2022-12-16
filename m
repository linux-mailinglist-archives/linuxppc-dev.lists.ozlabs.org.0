Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831C64F0B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 18:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYcKx0mYKz3bkM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 04:59:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aL6dpugo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.87; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aL6dpugo;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2087.outbound.protection.outlook.com [40.107.9.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYcJw5JK3z2xy3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 04:58:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJboDSN2m5Q0/jnXpP2t2sXCm54Ts07LhjJ5FG+lg8LATy7MKmt2pMjnIcbUTmGX3hCK/0enUAYi0LIDQxlHXt4dvxorJJ3p7MkrD6K4OugYYuZpF1XvHBJOwRG08l0G2wh61W45dpo5I5q598+Ql0xUSo/+9KF7QaA4KZlhOw3JeE4D9yh5jjweFFmzLYew55bLIHeaB+vWDf+PFg7bu59wuYjOZ1fwsPirbwISXWDUCXvKP27WGCleLtrxlL5CbzpdIxDkZET8s3xz9K8+0iDiqVi9g3sC473VFi/ocP0aTRpaO0a/UCEtyRDLrKdQMeoyNOP0IjFIsyfZ1mW8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5ACZDrKjzrMSOjiqA4FneoowjvDaSWRo066fpY+6ZM=;
 b=PYrjsj43ur43ThDBulxDHf2GZJY0OzssPW1WtTX/o4mgdJcJe8y4d4HFOKbRbl8rQ6Zp2brkmpLenRodZGEim5ZvcILc5xT3wovg7D6wz4cKcx6wx1PBufB5SDGRKNye1jSQhm60z8cMhm6vuXuufhXdMR25+mzsVSbTcx7mMyhCo8T4kik0HzKPC39zDMv3FGe5cnaEYv9sRotzkE4tEv/s+PefWImI+Mx4CPwFCNzguRn+u7PC6jI3OTNzCZaYYEa+S/9LDsx2QVSq9AjpyTaZxzWqxEiffpVuj/ODVCUUZKVN5UD6lBu1rvrzhnwK2SUxhxkqVV//o6xSL5hz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5ACZDrKjzrMSOjiqA4FneoowjvDaSWRo066fpY+6ZM=;
 b=aL6dpugokhC/9Vv+ycZxkKz4dDVNZ6vfIFZMwRSTz1MwWJ39wm4Q+Ow3kxSEBQKeI+XXV67zReQxGer+LJpaGn2zy/Bt3smvfif6VLAOUKLIZixWobkQEJrRAne+ko9Z3Qd9zH7lKbvK6WPFOI6ccOBQNrl0hhMj2pdYMaykxLUl/zwy0P22qwJyYtfmdPcI3r60ntPUXoMKyg8s4MtOmJxH2EbYLM3DaIUCKhDxH2dPEr9GPD8hGJd2mn2w7h2iB9au2Rm3fuxl20E/hjOFgvhNI5+2GAYA2P5Y0IC9rSJ+TlpU8AHZXk3Onvalq8kxglT4GLGS3nQce3YZ6OFXdw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2404.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:57:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d%7]) with mapi id 15.20.5880.021; Fri, 16 Dec 2022
 17:57:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: Pass correct CPU reference to assembler
Thread-Topic: [PATCH v2] powerpc: Pass correct CPU reference to assembler
Thread-Index: AQHZESl3h6uoWW5dBEO6rDYbx87kha5wwneAgAALBAA=
Date: Fri, 16 Dec 2022 17:57:46 +0000
Message-ID: <73fc1107-b540-bec3-7625-c6e6d0641bbb@csgroup.eu>
References:  <01fe73614988e2402a7526fb6b6e903bc3777bb5.1671179743.git.christophe.leroy@csgroup.eu>
 <20221216171821.GA25951@gate.crashing.org>
In-Reply-To: <20221216171821.GA25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2404:EE_
x-ms-office365-filtering-correlation-id: f79878ad-f7ed-4941-64be-08dadf8f0a12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wIVH+h8X0hPGFGRKZF/GzbGLpVKsgprp4qHQAj9J2IGXx9G9bU9dWVfUeh6KWLrOd+TYfFtZP7Y04aIWVQyN/P3BCV4urIWFI6MheArbS85YJsLHl6DPdZG/6F0NZJ5KVUmfHp2vtaz7MjPSGYaLM4Ib7J3e1lNyA0CBwAAbo7Q1QCRnD8o3fdT08KAa4h/SHNQuc1RDuFP22uel6qMuRVSAv7NChJbEHzZSx03ogqTclqYECh4CwC16bZLn8cNSiARLSkdX0agTa55cpXJmHKJgsx6h+RRdf9lE+HqJsydGsuFw7oefWtWjTS9+yBrGC2B0+siMs+w6/qVrkwnLCyytfL6JV4ilGFi7ReVq+Q20F/AvPyf4L5hRYWCxL/7F4lAaT7GswhxcFTgMBh+yF73K3VUxkgS9/3iTNuBsXNx2dMrlRo4wJymPVsddHBfMt82zc/aoxeIG62PVNdw8zn6onKSvu6vauzWHVgrdKeMBynneIhcygsK1OatnwTnktI1vEL3jF5vF0tXTGdKcYQlIXqPeHnJC8YFz/1hAasIiGv22jTRfv2wVWozv0m4obPUacc6eT5iC5TiAMLJSk4F1xcIUDmImurX/nNZt79aIPkQFUU48kZZ7XXMrLa95HFqqfPCvU7iBDT2XWnHN5DVR+feVKedb4vhXzMvKNLRYjkwvZCY1qavhjvQsTc6ctoZaVtixqIZZvb+EOEefFIYAIgtSvPeFOpWvzmOkAXG627T7jfwIgnFXhB5tMkcHb1py4zJs/vsTfsBLQfkJ+w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199015)(36756003)(2906002)(38070700005)(41300700001)(8936002)(5660300002)(122000001)(38100700002)(86362001)(31696002)(6916009)(31686004)(478600001)(6486002)(54906003)(71200400001)(44832011)(26005)(91956017)(4326008)(76116006)(316002)(66556008)(64756008)(66946007)(2616005)(66446008)(6506007)(66476007)(186003)(8676002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVU4RS9ZbS9raTN2K2creE5LQldSY2JuZjVRLzV3SDZyT1B4R0ZGUWxYM0lG?=
 =?utf-8?B?UTM5cHdXWGQvOXRxaFNDa29sRGtNektvblVIVnM3NC9ZOWtlMUhvQyt5ay9P?=
 =?utf-8?B?TENUU3pPbzliaHlwdjV0YVRUbnV0Tm5VWFE2S2RyNm0yNkNoZXJSajd3LzMy?=
 =?utf-8?B?Kzl5M1V2dm5DSzd6N2RReGtpU3NJc0xocmNKK29oa2FSK0pMUVVHSUFlY3VH?=
 =?utf-8?B?bUF0ZXAxYWRvT3BJK1J6QnByTFhRNy8zU2ZOcm1HeXJOWm9ldXpFM1pnWW1D?=
 =?utf-8?B?ZXQ4c0lKR1o3K1hLTFl6NDl2MktRWFo5blpmV0UxMHhna1NTMytZYk9pSjY3?=
 =?utf-8?B?VnhtOGc2WXRFSmptbCtUSlprSFJTNmQzczlLSXNBVVRJUEU2WXZFT1lGci96?=
 =?utf-8?B?VEh1U1hTSlYwcFVOdFhBSWlZR2lLZU9oYmwzRWZnRUM5aktpMklXbzdCRWZY?=
 =?utf-8?B?dnJwWlhQN3JyVHdLWFFBMTBrajVXaGZZeGJGWnBpK3ZCZUFNSEprQmNUUHFN?=
 =?utf-8?B?WUxWM3FNa0NTKzJPSXY3S2xxalFyU2xycFAwNmNEWGpKWmMvQnNUcDJIcFoz?=
 =?utf-8?B?bkZmSGZQL2NhbmdUVlltc2t2K0tvNjlIRWR2ZDR6Vzlrb2Z5OEdmQnRFdFFJ?=
 =?utf-8?B?UWhoWVV3emM0aFhsc3Y0SEVrNzNLL2FnY1o3RVIvS0UyREVJVFRhaHR2UFRn?=
 =?utf-8?B?NW81d0lqNHRLUXBGUXpwNXlXUXlFMkxJN2wyemV6TG5mbmZlUFd4d0ZhRVUy?=
 =?utf-8?B?OW1JNnR1TzRHdy81YVowZFBaZm1oaXl1UmpFWllFNXhGcXZyZUJSZEJiMm5G?=
 =?utf-8?B?OXNjTlYvMmZoMGtMTGlRaWdFTTdNMlFaWGlXaXpZZVNVYlZtZWVWU1dZK3BF?=
 =?utf-8?B?QS9MQ0pETUs4Y2xjTjBLdE1CUDNXMWQyQUZNQ2M2dmJVKzJHYnFOQnVHckVj?=
 =?utf-8?B?c1d4VUFEU2lWYTFBZ29oN3pFczB1U0dHdUJCTXBPU0dkL1lSWlZjTTcyM1Vi?=
 =?utf-8?B?emtlM1JKKy9aazU1ZmdqeVBTQm1saWpJc1ZzR1hhZVlCQjBVcDg0T2VwR1VW?=
 =?utf-8?B?MzVPR0x5WmJiVXFObDZ2dzh2aHQzSndrZzVJTFNnQmJkTnZhYStnLzBEbHo1?=
 =?utf-8?B?MXZUS3h5TW9LWmtrdmQ0Q0loNXRmcG1ZSWF0Z2J4aEJ1TUpuZ0tXR1RpY01I?=
 =?utf-8?B?b1J2WHVDcnRiS3hCY2R6UXhFR1A5U3Z3Q3daMU9FT0Y1bEltaTEwRFVrK2RM?=
 =?utf-8?B?NnBnOUQxdHk4UGJnUklwTnVvQW1QT0tEKzAzWDNEZUJoa2hYWUZ1bVU5UVRM?=
 =?utf-8?B?MkJwclNXeTJtMnJPL21PSEYxcUtKWStvb1RsaTNwcVR1endncU05QTFOUFdO?=
 =?utf-8?B?V2pYWnhJbWMwOFFOeVFhK1VhV3dzRWNLc04rZ2k4MmZUM3lqNEhHREdpSXBW?=
 =?utf-8?B?aVQwbmpyYzdBY01YZklPa0kzMGtVZjBldEtYUC9YMk5DeFpDZzQzaUsyc29l?=
 =?utf-8?B?WjJoY29WejhRZ1JPL2EzVkF4UVVTNXkzMGkvZG9tNHd0R09KcWpzZ3BhdEYx?=
 =?utf-8?B?Ull3UTNMdTJqQm80WWJqcWE3d3NTRGFNbkN3OXI3WEFJRW1IaGNCaW9nWVhp?=
 =?utf-8?B?cUtqK3R0NXcweXZXY3ovQkpiczdRSkxxdWRvQUY1dkxETXV6dzVkdTBYaGEz?=
 =?utf-8?B?d1dlMFYycXBJbTN2RG5EMWc4YWZPNThsdW9uQS92QzJrQTRYaDRhNEFyaXFL?=
 =?utf-8?B?ZTg0NS8yMHFRV202UUdTeDJIU3drdFhsU0hnWEhIWUQ2ZXpWdjZEZDFCRm9O?=
 =?utf-8?B?dG1CSkdHMWFPbXhzNTlrRXpnWEdnNFk5WEdINnMyVEJ0TFMxY01jZzJ1UUZ2?=
 =?utf-8?B?RTdMSHIwVWFDdmFBMzZZYUN1NzVYQVVKZFBVTnR4T1JVZTFsWlVsOUFxUk9H?=
 =?utf-8?B?RHk1dE85eGhXQ1BkTTExd3dUWmpuM0QwK2QxUlRCNUVxOGZ0WEJYU0c0c1Bw?=
 =?utf-8?B?bk5aZE1aZk0yRnJvdkZSRENGamEwNFZrdHJNNDg5QVJkNVhKVk1kQTFidGV5?=
 =?utf-8?B?REN1UTV5cVA1V1ZJN3F0dDJRWCtqWWdkbTcxV3ZiZGgwNUVRa0UrYUwwS0pr?=
 =?utf-8?B?eGovcFAza2Z5KytCYTQ4TWlrR1VNTG1oQ3c5NGoyL3E3bmFIMnByMG5LejBy?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6B39866BFB1124B97648EB56BC5CD22@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f79878ad-f7ed-4941-64be-08dadf8f0a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 17:57:46.8172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSwnWGQIWhUar0k+Hb0boHck3j9zOJibgtpAiZLniYjV3E8iuhtNKIKFKBBRuspeDylnl4iGbJkUf1H/akUQ6/uQ980Hu00rIWtLbHkqYgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2404
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Jan-Benedict Glaw <jbglaw@lug-owl.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Q0MgSm9lbCBmb3IgdGhlIC1tYW55IHN1YmplY3QuDQoNCkxlIDE2LzEyLzIwMjIgw6AgMTg6MTgs
IFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKgOg0KPiBIaSENCj4gDQo+IE9uIEZyaSwgRGVj
IDE2LCAyMDIyIGF0IDA5OjM1OjUwQU0gKzAxMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+
PiBUaGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBmYWN0IHRoYXQgQ09ORklHX1BQQ19FNTAwTUMg
aXMgc2VsZWN0ZWQgZm9yDQo+PiBib3RoIHRoZSBlNTAwbWMgKDMyIGJpdHMpIGFuZCB0aGUgZTU1
MDAgKDY0IGJpdHMpLCBhbmQgdGhlcmVmb3JlIHRoZQ0KPj4gZm9sbG93aW5nIG1ha2VmaWxlIHJ1
bGUgaXMgd3Jvbmc6DQo+Pg0KPj4gICAgY3B1LWFzLSQoQ09ORklHX1BQQ19FNTAwTUMpICAgICs9
ICQoY2FsbCBhcy1vcHRpb24sLVdhJChjb21tYSktbWU1MDBtYykNCj4gDQo+IFllcy4NCj4gDQo+
PiBUb2RheSB3ZSBoYXZlIENPTkZJR19UQVJHRVRfQ1BVIHdoaWNoIHByb3ZpZGVzIHRoZSBpZGVu
dGlmaWNhdGlvbiBvZiB0aGUNCj4+IGV4cGVjdGVkIENQVSwgaXQgaXMgdXNlZCBmb3IgR0NDLiBV
c2UgaXQgYXMgd2VsbCBmb3IgdGhlIGFzc2VtYmxlci4NCj4gDQo+IFdoeSBkbyB5b3UgdXNlIC1X
YSwgYXQgYWxsIGZvciB0aGlzPyAgVGhlIGNvbXBpbGVyIHNob3VsZCBhbHJlYWR5IHBhc3MNCj4g
cHJvcGVyIG9wdGlvbnMgYWx3YXlzIQ0KDQpUaGF0J3MgaGlzdG9yaWNhbCBJIGd1ZXNzLiBDb21l
cyBmcm9tIGNvbW1pdCAxNGNmMTFhZjZjZjYgKCJwb3dlcnBjOiANCk1lcmdlIGVub3VnaCB0byBz
dGFydCBidWlsZGluZyBpbiBhcmNoL3Bvd2VycGMuIikNCg0KPiANCj4+ICtjcHUtYXMtJChDT05G
SUdfUFBDX0JPT0szU182NCkJKz0gJChjYWxsIGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tYW55KQ0K
PiANCj4gV2hhdCBpcyB0aGlzIGZvcj8gIFVzaW5nIC1tYW55IGlzIGEgaHVnZSBzdGVwIGJhY2ss
IGl0IGhpZGVzIG1hbnkNCj4gcHJvYmxlbXMgOi0oDQoNClRoZSBvbmx5IHRoaW5nIEkgZGlkIGlz
IHJlbW92ZWQgdGhlIC1XYSwtbXBvd2VyNCBmcm9tIHRoZSBsaW5lLCBsZWF2aW5nIA0KdGhlIHJl
bWFpbmluZyBwYXJ0LiBJbml0aWFseSBpdCB3YXM6DQoNCmNwdS1hcy0kKENPTkZJR19QUENfQk9P
SzNTXzY0KSArPSAkKGNhbGwgYXMtb3B0aW9uLC1XYSQoY29tbWEpLW1wb3dlcjQpIA0KJChjYWxs
IGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tYW55KQ0KDQpJdCB3YXMgYWRkZWQgaW4gMjAxOCBieSBj
b21taXQgOTYwZTMwMDI5ODYzICgicG93ZXJwYy9NYWtlZmlsZTogRml4IA0KUFBDX0JPT0szU182
NCBBU0ZMQUdTIikuIFRoZXJlIGlzIGEgbG9uZyBleHBsYW5hdGlvbiBpdCB0aGUgY29tbWl0Lg0K
DQpTaG91bGQgd2UgcmVtb3ZlIGl0ID8NCg0KQ2hyaXN0b3BoZQ0K
