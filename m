Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD85A2214
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 09:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDWv24yn6z3bqT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 17:39:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qXey6cVO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qXey6cVO;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDWtG1ljCz3bXD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 17:39:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLrYvBW8AgXxeG4FFOWXdrsBh5ycrYiXB9IIGz/VyswB7vcqxR1+JLN+GXoA1XP9nIxQ05dh4TCMnCgy+YRYN+aShwArsjwI0Al/zabWSJa1xjT0YJ9ENP5OQ3F9Ec5igbR82FhCJuLA0V3aBw392l8mj8K48j76eTMghk96+llWiMeGooImJ4fWsjxkLifn/V8vnD1W+8t5yzBxxS2Gz7BzbQAJoRMKEWjvY3ddZw9drFceoARgwZ0mHKBjQqfveE9R/10EvBnUWPCy4+UvtVKtw+Rr33ij2nIv2r/OmWL+/Zr7jUNZasXvCuA7rhUtTicFtAoLYjDmstWiNZfudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj+i00vrLV4lPKjopsQf3cxyxDcVir1PibiHWbxqttE=;
 b=KnvAHSTcD+Xg7apeJAN9u5fPoXWB+l37E2VFrSQEuku2bi8KO5dRU7fzOJpVyq6hEgmBtdAz8CAs2nH163Fy1Vtw8Kof3g2HWLDDOv/lm8qDYZYc9Ixeh87nDoLdu6d3EukXM6qL3fz3ANEJVSYx8PpG9ttPkyzIrhWIa3ezEl9AglCnR3fYgMSRD20aNRUe19IJnuBWx8pqxtZjdOo5WtxBDBi05ux5i/SewgxehsYlhcDCTGtDxQshUE9UcWZGuSeQp0KDKEKgje5tXxnpdKiGS/jWRo3WLBi84OlpHPpFL0oTfZv9s30T7xMNIY8tZ2/kfc3Z2VFqHGQF4kO6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj+i00vrLV4lPKjopsQf3cxyxDcVir1PibiHWbxqttE=;
 b=qXey6cVO1H8fZ4+IkmZdb/s8REH4VEdwqHlTwR06BvUlSnMq3FWeaTY0gtZLmMhzhPP/oQALA4R06YCYHStq2FP3EBTd1fJqp/5KH3oWnktFQoqNkuonNksdnvLBC4LhSOfrs5DLtHGiScS/TXuPU1rF62VoL6m8rzw+VjyOWfqTWE0AdcIqtYmaXk6wFRdH63CBOwWNOQWJjHoQtcpCv5IIQxDzuSuFdlB6aK05CRA4MQlp3IpLLwh8d7QHMkPw2fTrXSlPjdtK/OxBcmHsRB5G00IcnYA6Mib88Ks1tShqv7x2HLG4GaUKqPY2F9lf+0xDnKWRQw/rmagQ14n6tw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3934.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:188::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 07:38:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 07:38:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Topic: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Index: AQHYuG3gJRoiq14gKku11kRUFzyUCa2/6mQAgADYdwCAAAoAgA==
Date: Fri, 26 Aug 2022 07:38:41 +0000
Message-ID: <a5f0e388-0de4-be04-43eb-5df5108ee984@csgroup.eu>
References: <20220624141412.72274-1-ubizjak@gmail.com>
 <1661422971.cqtahfm22j.naveen@linux.ibm.com>
 <20220825180806.GG25951@gate.crashing.org>
 <807f6788-436f-33d5-0c60-cc9aa9b42a0c@csgroup.eu>
In-Reply-To: <807f6788-436f-33d5-0c60-cc9aa9b42a0c@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f68a83fb-1c50-42e8-49f0-08da8735ff65
x-ms-traffictypediagnostic: PAZP264MB3934:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  z0seLhc6nODdGkuEROD+guzZw8rJkp3aIdfw741svEmWEHpjYpiiSuCg4GDNl0dvB0OrD51TOtr2gtXQwNjWUKNIo0KEltyea9iR850QWPOEIGDyVo2MA+kfGlu6xbtxXi+iCKoINdWStshIADHmQzR/6WvwtlmWpwdq5qN4q9uBdJ2wfc40TP2fLDXwALiqPFjg7FcHFmj4eygPMyCLhxk/vhq/L2v8bTO+QHXe+Zpe9w4FjVCicugGxRayr+t9+122emdw+6k8IVozbLe9dBsXy5h5xCrnFbqGWkMN8grAlbnOGXLHMDZYKOK+XxWnHzqpqBxcaVw35T0k9AZ6gouL6wCI8MSLxpKVqvgdM9wLgzU2WMTbUAINNPXEo+oFFrRALVilRgFUfmS0yBUMvD0+PgJnGlpWlCifVFdrqYE1kGvDsk04lHZ+/GM+SXrSW9HyFq1/oJztQyVNdOZXaFEG/JEnxit+SrVFn7iDsniOEkra/gjyk4xwMrD1pfVHjF62UpREFC0WYC5niX8tedPAzb03t5+U2mbfNQ9p9MsAjbeVAHhcAyMphX5Ot5pvruEDczTFIx5gjv7c17Mj/yxRlQ+Vi1XK2b6Oebg2PcPErd30Y9vl/+COrNQQo6PCRur4xBE71mzlqRbdiEn212Rabi4nHuebo15mVQmEpGJ4W6WyTxVFYQnUKydtwyYG4UFs/kiPocg25OALvhaT1fF8y2bkjxL1UNdjhpaqVPzvks4GMwXnFnL0VZ26d+f5IlHAqPRNgiDqcRodvaeEhmVmFkD5KWTIOR8UuL17QjWSVr4X3oSEYKH7C8MBiD+2pB2i65vNPCOsnjGoozHsz08kH0ypLABI53BMDeE8lhQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(86362001)(31696002)(38070700005)(122000001)(38100700002)(316002)(91956017)(110136005)(54906003)(76116006)(2906002)(8936002)(44832011)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(66574015)(2616005)(186003)(83380400001)(478600001)(6486002)(966005)(71200400001)(6506007)(26005)(6512007)(41300700001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?emMxOGwxeUk2ek4rNmViTU4wMnhNRHVJMVM2Z2hoODh3MUtzUlkxMGFTY01N?=
 =?utf-8?B?RDd3clpIWGtnMGFLN01wbWRXTVJsT2xUOHdmYWdjTjNyUDNGR0RQczVWakdi?=
 =?utf-8?B?VDViV1dBQ1NxRlo0RUlreTRpTjVFbThWTjBmbHY2bjF2NHdUd01WamwrN3pB?=
 =?utf-8?B?UnJYNEtSejVSZ080OWU3cFRJTFh6SnpKdkc3N3BXUyt2c1hvdGllNWJkRVZu?=
 =?utf-8?B?eDJybzJ0aGNoQmVmby85Qzg2TThZOUlxVkVJQUdqME9henUwUElSOHozM2VB?=
 =?utf-8?B?T09XTDZRM09vR2JUVkxIODJHMllQSzAxWXlZTVJzdUhXaGFGYVJGTTgvSUcr?=
 =?utf-8?B?cWc5S2FUMWt5THRKMmJxbVJLdXJPdkhjVm5jcmkwaDVzeCtYM3h2UzFnR1ov?=
 =?utf-8?B?VXBQUFdTcXVlMVZXemQ3bXVGVGNoS3pyT2VFd3hBcFZTaU9MNkRhOTZmTEFU?=
 =?utf-8?B?TG1yK1NQVVU3SDFhOHROT2NMeFJZcE81MGVJL21IRmVJMUt3KzFPSFF4cEMr?=
 =?utf-8?B?L2dZTGV6cTdSMDF4ZHlDc0UzeUJjS2VWb0NpUHBGRVhxR2hsV1R6NzFCRGZK?=
 =?utf-8?B?TTdKa1YwTis3Y3NqUFUrcVE3VVAveEI2Z0NHZzFZYXBRTXNCVU1lbnFzdWx3?=
 =?utf-8?B?UlNsYXdqUENUc0hMTG1aMzhvWHo5N3pUbTkrcXV5bDJkTE9EYjdDOHRhWWVq?=
 =?utf-8?B?a1JQcEk5OE5IbzlqTmszTmRyR3l4L0dKd2lLL3hOVkdtdmc2VHlUV3UyZktq?=
 =?utf-8?B?MllCUHh1ajZrWU9vU1oyZjBDS29FWmcvb01keHYyeUNJcG1TUU41Qmwwa2VD?=
 =?utf-8?B?em9MaitVVjJCUzVJUFFDZWZQZXl5d0tBZitsZFIzdTFYckxkUmtzQ2xxTzdx?=
 =?utf-8?B?TUF4NllkMWoyVUxDYzlpcDh4L2Zwb1FxaXVCV2p4NW1tQ2pDNEVMZjdFZm44?=
 =?utf-8?B?NTY4SzNCZ09Objc3OVNLeW41ckJLUDdRaXIyYjJqSWhoUHV3dVpZY2c4eFQy?=
 =?utf-8?B?MmxvT2xYendXa3lpTVVJejdLK0RkYk5SSFRqVVp2dVNrRVpaN21VcUd0eFpl?=
 =?utf-8?B?SzBVQW56MG5mSEF0UUJ0akRMbFU1Ukx0bkpkeVVTZnU0RVdqTlFjZGtlZnhF?=
 =?utf-8?B?R05ZdThybXF2NVRqZ3JaYUZFcyt6elB4Ym16eVBta054UlFKak9xRDJSQ2lF?=
 =?utf-8?B?Q2VXNy9qZGFxMnBubGpIU2h0Nm4rZUNPaE0vNjJNbXRtdWR1TTFDZjQ1YllS?=
 =?utf-8?B?TXNUdXdaOWVldkE2cEJUanZWOVkxNld6K3o5TUc0akUvVHhjMjFIbG9vMmVH?=
 =?utf-8?B?MzFJYnN6bHdQRnV5VGl0aTU5SjROOTByZm15NGhkc3lNempQWTdEZmVIN1Z0?=
 =?utf-8?B?RjBMcC9YU0hHbk1VT1NGQW5rYk1jNVJWaURubGhoOEliTTZ4L2ZpWHJOdDVs?=
 =?utf-8?B?V050Vk1iK3o2WiszWDFkdDhXRldaUVN1ellidlRjdXdpdVEvL1Z5R3IrWmVX?=
 =?utf-8?B?clZwWUdRUW1icW5mSW1nVVBVeWlxYmRxeEZoU0l6bEF6WkJVN29SSm9VbjE1?=
 =?utf-8?B?RktJUFJmdlB2WDNpaXBuUnZhZXJIT2RreFUzMWI4K3dQWHpCVllXUTJyRXBy?=
 =?utf-8?B?UDlYekxtaG9EaWR4RU9VNjd6SW1NNmZxSWhoa0VDeUl6NFBRZy9xVW9JVnJ2?=
 =?utf-8?B?SXZXRk1MWkpwSnQxaWpKT0hKelNGVk1VODRBQUdDQk1CYWpPeXh4dlQ2ZlBa?=
 =?utf-8?B?SEdobklmM2ZaVEVwU0NaUjNIWG9id1RJRTFMaXc5eGdjR1U4aGRJc0VMOVZO?=
 =?utf-8?B?bExjN3RzZzd4NjBEbCswU3dQTE5ySEw2aXk0cGJEYllmMkkwMmN4WVFWb21t?=
 =?utf-8?B?YnREdWhQWDYvWC80c2krZytLQ2p0RkdocHM0R2dMc3lJTGtMWDFGQUxwcXVv?=
 =?utf-8?B?UVNVcWxDOWFSSFk0eVNNR2xsU0lQYzNWak1HaUkvWmF1MDhTS0tIUzFRV0Ez?=
 =?utf-8?B?TU9qSUkxYmJzKzdiNnR4amZtUzlTekwvMjNXRkNIMFA4VHp6L0xGVjVjcERl?=
 =?utf-8?B?TmNqOWU4Y2thT3djSFJ6ZFh0bTExSFZGMnI3eFkxL1ZFVER6T3BFRWFrQlU1?=
 =?utf-8?B?eFJFQ05UaDdTMmR0MHBEeUJkcjNjTEwwV2NUdGtPclBxZFZjUXd2bUttdWJk?=
 =?utf-8?Q?n9/hv76uDaGHM/GRBVKJvuA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <400EEB300C8F7747A3EF14114BEF6D88@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f68a83fb-1c50-42e8-49f0-08da8735ff65
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 07:38:41.4034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5wUoy8WDzI0zfUuEV7opgGrNy+hcnPj7Xz4GRyWgUhQRQ8cDj54OgLQMMeKQWGcZLR0Y7p9t5btccIBG4Wa+AUCFimR8DuVfkzUDWxY9aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3934
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
Cc: "x86@kernel.org" <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA4LzIwMjIgw6AgMDk6MDIsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAyNS8wOC8yMDIyIMOgIDIwOjA4LCBTZWdoZXIgQm9lc3Nlbmtvb2wgYSDD
qWNyaXTCoDoNCj4+IEhpIQ0KPj4NCj4+IE9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDA0OjAwOjUy
UE0gKzA1MzAsIE5hdmVlbiBOLiBSYW8gd3JvdGU6DQo+Pj4gVGhpcyBpcyBjYXVzaW5nIGEgYnVp
bGQgaXNzdWUgb24gcHBjNjRsZSB3aXRoIGEgbmV3IHBhdGNoIHJlcGxhY2luZyB1c2UNCj4+PiBv
ZiB1bnJlYWNoYWJsZSgpIHdpdGggX19idWlsdGluX3VucmVhY2hhYmxlKCkgaW4gX19XQVJOX0ZM
QUdTKCk6DQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjIwODA4
MTE0OTA4LjI0MDgxMy0yLXN2QGxpbnV4LmlibS5jb20vDQo+Pg0KPj4gV2hhdCBpcyB0aGUgY29t
cGlsZXIgdmVyc2lvbj8gIElmIHRoaXMgaXMgYSBHQ0MgdmVyc2lvbiB0aGF0IGlzIHN0aWxsDQo+
PiBzdXBwb3J0ZWQsIGNvdWxkIHlvdSBwbGVhc2Ugb3BlbiBhIFBSPyAgPGh0dHBzOi8vZ2NjLmdu
dS5vcmcvYnVncy5odG1sPg0KPj4NCj4+PiBkdXJpbmcgUlRMIHBhc3M6IGNvbWJpbmUNCj4+PiBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gL2xpbnV4L2tlcm5lbC9sb2NraW5nL3J0bXV0ZXhfYXBpLmM6
OToNCj4+PiAvbGludXgva2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOiBJbiBmdW5jdGlvbg0KPj4+
ICdfX3J0X211dGV4X3Nsb3dsb2NrLmNvbnN0cHJvcCc6DQo+Pj4gL2xpbnV4L2tlcm5lbC9sb2Nr
aW5nL3J0bXV0ZXguYzoxNjEyOjE6IGludGVybmFsIGNvbXBpbGVyIGVycm9yOiBpbg0KPj4+IHB1
cmdlX2RlYWRfZWRnZXMsIGF0IGNmZ3J0bC5jOjMzNjkNCj4+PiAxNjEyIHwgfQ0KPj4+ICAgICAg
ICB8IF4NCj4+PiAweDE0MjgxN2MgaW50ZXJuYWxfZXJyb3IoY2hhciBjb25zdCosIC4uLikNCj4+
PiAJPz8/OjANCj4+PiAweDVjOGExYiBmYW5jeV9hYm9ydChjaGFyIGNvbnN0KiwgaW50LCBjaGFy
IGNvbnN0KikNCj4+PiAJPz8/OjANCj4+PiAweDcyMDE3ZiBwdXJnZV9hbGxfZGVhZF9lZGdlcygp
DQo+Pj4gCT8/PzowDQo+Pj4gUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJlcG9ydCwNCj4+PiB3
aXRoIHByZXByb2Nlc3NlZCBzb3VyY2UgaWYgYXBwcm9wcmlhdGUuDQo+Pj4gUGxlYXNlIGluY2x1
ZGUgdGhlIGNvbXBsZXRlIGJhY2t0cmFjZSB3aXRoIGFueSBidWcgcmVwb3J0Lg0KPj4+IFNlZSA8
ZmlsZTovLy91c3Ivc2hhcmUvZG9jL2djYy0xMS9SRUFETUUuQnVncz4gZm9yIGluc3RydWN0aW9u
cy4NCj4+DQo+PiAoRm9yIHNvbWUgcmVhc29uIHlvdXIgY29tcGlsZXIgZG9lcyBub3Qgc2hvdyBj
b21waWxlciBzb3VyY2UgY29kZSBmaWxlDQo+PiBuYW1lcyBvciBsaW5lIG51bWJlcnMuKQ0KPj4N
Cj4+IFNvIGl0IGlzIEdDQyAxMS4uLiAgaXMgaXQgMTEuMz8gIElmIG5vdCwgcGxlYXNlIHRyeSB3
aXRoIHRoYXQuDQo+IA0KPiBXaXRoIGdjYyAxMS4zIEkgZ2V0Og0KPiANCj4gICAgIENDICAgICAg
a2VybmVsL2xvY2tpbmcvcnRtdXRleF9hcGkubw0KPiBkdXJpbmcgUlRMIHBhc3M6IGNvbWJpbmUN
Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGtlcm5lbC9sb2NraW5nL3J0bXV0ZXhfYXBpLmM6OToN
Cj4ga2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOiBJbiBmdW5jdGlvbiAnX19ydF9tdXRleF9zbG93
bG9jay5jb25zdHByb3AnOg0KPiBrZXJuZWwvbG9ja2luZy9ydG11dGV4LmM6MTYxMjoxOiBpbnRl
cm5hbCBjb21waWxlciBlcnJvcjogaW4NCj4gcHVyZ2VfZGVhZF9lZGdlcywgYXQgY2ZncnRsLmM6
MzM2OQ0KPiAgICAxNjEyIHwgfQ0KPiAgICAgICAgIHwgXg0KPiBQbGVhc2Ugc3VibWl0IGEgZnVs
bCBidWcgcmVwb3J0LA0KPiB3aXRoIHByZXByb2Nlc3NlZCBzb3VyY2UgaWYgYXBwcm9wcmlhdGUu
DQo+IFNlZSA8aHR0cHM6Ly9nY2MuZ251Lm9yZy9idWdzLz4gZm9yIGluc3RydWN0aW9ucy4NCj4g
bWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0OSA6IGtlcm5lbC9sb2NraW5n
L3J0bXV0ZXhfYXBpLm9dDQo+IEVycmV1ciAxDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtl
ZmlsZS5idWlsZDo0NjUgOiBrZXJuZWwvbG9ja2luZ10gRXJyZXVyIDINCj4gbWFrZTogKioqIFtN
YWtlZmlsZToxODU3IDoga2VybmVsXSBFcnJldXIgMg0KPiANCj4gDQo+IFdpdGggZ2NjIDEyLjIg
SSBnZXQ6DQo+IA0KPiAgICAgQ0MgICAgICBrZXJuZWwvbG9ja2luZy9ydG11dGV4X2FwaS5vDQo+
IGR1cmluZyBSVEwgcGFzczogY29tYmluZQ0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20ga2VybmVs
L2xvY2tpbmcvcnRtdXRleF9hcGkuYzo5Og0KPiBrZXJuZWwvbG9ja2luZy9ydG11dGV4LmM6IElu
IGZ1bmN0aW9uICdfX3J0X211dGV4X3Nsb3dsb2NrLmNvbnN0cHJvcCc6DQo+IGtlcm5lbC9sb2Nr
aW5nL3J0bXV0ZXguYzoxNjEyOjE6IGludGVybmFsIGNvbXBpbGVyIGVycm9yOiBpbg0KPiBwdXJn
ZV9kZWFkX2VkZ2VzLCBhdCBjZmdydGwuY2M6MzM0Nw0KPiAgICAxNjEyIHwgfQ0KPiAgICAgICAg
IHwgXg0KPiBQbGVhc2Ugc3VibWl0IGEgZnVsbCBidWcgcmVwb3J0LCB3aXRoIHByZXByb2Nlc3Nl
ZCBzb3VyY2UgKGJ5IHVzaW5nDQo+IC1mcmVwb3J0LWJ1ZykuDQo+IFNlZSA8aHR0cHM6Ly9nY2Mu
Z251Lm9yZy9idWdzLz4gZm9yIGluc3RydWN0aW9ucy4NCj4gbWFrZVsyXTogKioqIFtzY3JpcHRz
L01ha2VmaWxlLmJ1aWxkOjI0OSA6IGtlcm5lbC9sb2NraW5nL3J0bXV0ZXhfYXBpLm9dDQo+IEVy
cmV1ciAxDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0NjUgOiBrZXJu
ZWwvbG9ja2luZ10gRXJyZXVyIDINCj4gbWFrZTogKioqIFtNYWtlZmlsZToxODU3IDoga2VybmVs
XSBFcnJldXIgMg0KPiANCg0KDQpTYW1lIHByb2JsZW0gd2l0aCAxMC4zLCA5LjUsIDguNSBhbmQg
NS41DQoNCj4gDQo+Pg0KPj4+IFNvLCBpdCBsb29rcyBsaWtlIGdjYyBzdGlsbCBoYXMgaXNzdWVz
IHdpdGggY2VydGFpbiB1c2VzIG9mIGFzbSBnb3RvLg0KPj4NCj4+IENvdWxkIGJlLiAgUGxlYXNl
IGF0dGFjaCBwcmVwcm9jZXNzZWQgY29kZSAob3IgcmVkdWNlZCBjb2RlIHRoYXQgc2hvd3MNCj4+
IHRoZSBzYW1lIHByb2JsZW0gaWYgeW91IGhhdmUgdGhhdCAvIGNhbiBtYWtlIHRoYXQpLiAgVGhh
bmtzIQ0KPj4NCj4+DQo+PiBTZWdoZXI=
