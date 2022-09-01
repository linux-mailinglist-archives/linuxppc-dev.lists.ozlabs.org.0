Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAA5A8D48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 07:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ8b76JjKz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 15:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U4clVhxV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.79; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U4clVhxV;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90079.outbound.protection.outlook.com [40.107.9.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ8ZQ5RT0z2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 15:22:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY4szxixDy9NcFItW2ABAlPCae/go/DjGASPLpRWUJMGpKmjL3ixZEMKu8tRxBJo71OvWzaCzm3vdE0LbwlWt2SEGDrJ3T7bWiPLfxd1mA88LUM6yWmWYxUu5eBSGxgPxfHyEJ5EuTZ55ZHN6d7lHR4dNlkR2Qb5jn69WNIx45J6FmFk3J+4qp7tJklmK3w/TMPvQJ/AiUjDE3OTUwU/Sjp8MpRacAv1WfFGFcyzruGHce1CnrbMfU76xivGggYPumoywTjy+RBXa0GsW4p5AY86peUOL8te4BB7QBjVjW2KrRhMbjTyiJrTy2ysh+s3b7bMH1nfP1c/qrfthUkqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAMow6eUBby/2Rpy2sXXbKp0zSl2X+SQhM7Chem8+Ts=;
 b=E7951jHSBN7+UtMoImrAQuJ+GoyqvqH3SVoqAiSRoGv0Fi5Ylu/SU4zh/g6umg+gINSnrUTB81ok6BaEARhDt7VLq1JcXohejEEVwvAcPsT18b69MpS+K7LkRdS3EF4tavNsAq12xCpLtljoAMOpQmt0+eI8XRb9rfYpF2mttypcNU6jbG8w/9YIQOozKeKgxQNEOxPfrg5vJkIH67wlSHmW4Wjje3rVWXvJJpXeZYNHIyqKEUFMqeOsfB2dBCKSL/VwIuwTY86F0h5+PgtnQhccr2i/N8CeOxODCePNZ+XhQKQHzqc/pcXEuXDKOGhN52oq4p099nv49JEtbyvESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAMow6eUBby/2Rpy2sXXbKp0zSl2X+SQhM7Chem8+Ts=;
 b=U4clVhxV4yUX+C+f1mqNL9PJIZH70T0EyLojL9DMkFHd1TDC7+5o9BpClh46ZuEL6XntjxGEbGOAHLecxd7ao8gxoz/q8mokqdKVRUX0WGj7rscGEKWAAEbTYoHlHIHvipt06ekpyUIOavlfRiBX465MA5hpOvF1uPgdPtzUB3CzanEDeoXS7u+0EIweRaAg6q26/ZFfV4kgL4x7Kabrg4ig86Rhn7C4yC0I9OG5C7DBaSpySqQL7Y0qFOyOsMx3rwQ1NfbKlMDcUKUCf/3ZVMwiyGU/PetXyLKIcH7tZ+wJ5mpVNVnWr3c7+qyCQwRei4VBbiPuCnIuHayFiFWPRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3306.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:147::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 05:22:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 05:22:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Topic: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Index:  AQHYtw7tEe9N/+CAqU6ZnvEJZB4bTq3G8M2AgAACxICAADyMgIAAAlUAgAJ2JACAAG71AA==
Date: Thu, 1 Sep 2022 05:22:32 +0000
Message-ID: <ad5ebb37-6b6f-372c-dd07-fc4cfc5f5fe5@csgroup.eu>
References:  <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
 <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
 <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
 <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo>
 <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu>
 <20220831224522.GX25951@gate.crashing.org>
In-Reply-To: <20220831224522.GX25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3e34881-ac45-4e0e-9a0f-08da8bd9f8ae
x-ms-traffictypediagnostic: PR0P264MB3306:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rlmMkSUwqxFdU/DAbUW+PbUDq2TYyHToShpkieXEapp5xWLt1HMpwhGwlmWq2w/PR3GxVU0djTR5IUP2H7oRjzAtWbfp/CeH477pFxzOqmoscoeMnqp/GBl7+wOvDzlvom46o8fzTR6JUtYpiMcK2AYuZsKPxvSV4DHgDoEbNvZFQVHuubAGvcHwgKDo9zSyhElDW80ilCkTxZZuYL6oftsCuBRh4zMJlBPQpCNqmnKAxNcZeVtyZ5ViAvueJg01vPVdBorQHoOJwFhxesMMogPMKCOIqtE3i/6yjSj6QnHBWiG9YskT9b+QsdO0rv7KLTsjM73VAl0J+L8zvj8EQ0lHUbDPQxblLRJZThJkzRQcRTTWuzTt4e/fsmsC007UxNf6SJr+4YXTseHeQe64rkuLSKDsQqxzLvjdXo7qBssw9GosTz+vyaph0Nj9gm8PQM0/VkHDn/OCOomsapr3kn2fu+lFZD/gSaBJqvG6tRmCt6FIJ9STrMvhgFszL1XDlRJbFSjhc5yhFWas8qy2xYQAJPJwGVfcZSOKD610Vr+R4ekpfFO/y1fCqupQip+thXX8180Yfgdytl/F2z2AX18BRHHJcZkLG0kbDZ3DKAYIvzl4d3DHHHh6SP0jk0jW4EC5JTQFKqWpq3typwA6ZPA3zWI6a8REzOH4vptL/4yIj0gO+PctmtWVTYEwOOvRRL6uATuYSJUXnmU40//xjgyWUbT3S4YD257N650FvTLLsZNkimM+Hcaw2+lbsB1scrtX2vL10hj54cCTe5W7Gmp3LEBjuCKNYQcpUJ5h33/5w6edTShPuXiqXRh+EVd4e73qXp4AsM03y9hKSjq1xA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(366004)(396003)(136003)(346002)(31696002)(316002)(38100700002)(2906002)(6512007)(26005)(83380400001)(122000001)(186003)(66574015)(31686004)(36756003)(6506007)(86362001)(2616005)(478600001)(71200400001)(54906003)(44832011)(8936002)(110136005)(41300700001)(66946007)(64756008)(8676002)(4326008)(66446008)(66476007)(66556008)(38070700005)(6486002)(76116006)(5660300002)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M3ZVNUhCNm9YZkZCTGZ5VGVpcFlOKzJDOGtGMENsZzNCRjdla05JVVNVczFx?=
 =?utf-8?B?YUlqMnRWeTJIWlBObzBIeEM0bkU5anUxS05pN0FZRWx6ZVpwOXArOG9DVmpH?=
 =?utf-8?B?T2J6UFBrVWZxZHFkVWluQ2hrU0FFTUtpMU53VlhLbHlFN3pRa0VlZkxBNUpY?=
 =?utf-8?B?RFpSQ1hSK083ajRRL2F5WU1CV1NRQlhSa0RCa0U0dFRjNmVDY0NBSU1seHFS?=
 =?utf-8?B?VU1rcjhvVk9TSXlsU3o0aHNQdzc0cE5TVHpFakVnRkU0NUJLZXBuNkNnazlT?=
 =?utf-8?B?S0hyMEpUTk1nbVpkVmlsRENDOXFkUU9qRnBxUXhZUDNYTzE5UG1PRHNBZnR5?=
 =?utf-8?B?TWltWWhLc1JWRGxvNmV1elZxY2pBRll3cVMrWXdxUDdoSXhiYzJ0dVoyMGRs?=
 =?utf-8?B?MmFzWFRSUzZhNWJ2WFFzcnlIUGpRamhxZG83Y3dXRW80TU1yajlLWnNodFM2?=
 =?utf-8?B?aC90NHBxVkJPNjNJTW5jTVhPSlBDbytGa3JodHovU1FpT1ZSY1FLblgrWHUr?=
 =?utf-8?B?SHRURXdvQU0wRGxTUFVMaG1wRUE0Qm5OUENIbFlHam92VmlYd20wK29namNo?=
 =?utf-8?B?b090L1VKMmVkRlgwanp6SVhxb3BLMyszLzlCbjZtYTlpZHVSMmpjZU5uTGxU?=
 =?utf-8?B?dmh3Z29waEROSzk5akVhUmFxcktyVzBMcVNVQnpTM1FFYW11ODNvOEE0MVFp?=
 =?utf-8?B?Y2FJUVRBTEg4cjBVTDRueHZUR1ZuTUJaeVJ1ZURvV0VualpXQ01td1JXUU1B?=
 =?utf-8?B?RUJuSWMzVDZjMU43NzhPNEtwQm1LQzZleTNQMms5SEtXU2UrNFY1Qi9PTy8x?=
 =?utf-8?B?WHkxYWg2SGtNVGI3UzYzb2E3aUJldllWSm5VWjlpUHVseEw4ck9DSlQ3K2J1?=
 =?utf-8?B?TWVQdHk3MDBhRHY3Y1YwNndEWlltbk5xd0hGcjdkSWVwR2U4cGcraWgyWnBG?=
 =?utf-8?B?L0ZUekh4eHZDNStpRkxzK05PaDBsSVJmOWhCL1V5eW4wbURzakI0OWRSbFFL?=
 =?utf-8?B?anJDdktSWGVSZGxXb3lmcFF6R0RLZ1pkcmpzRngrL3QwbFh2YzJUSW90azUx?=
 =?utf-8?B?Q09BMHYzZ2R6MmJ4dllyb1Ezam40bHpZOXJHeUt3Tk5zaE9ERUx3V05tZDlM?=
 =?utf-8?B?dldqS0dRbzE4Z3psbGlDdHI1c0t1V0cyVzZyUU56bnJZRWpqNERsQi9hNi9i?=
 =?utf-8?B?bTMwbjV5QVd4RFdkZ0NVeUdadkFSdTg0b0cwR0tmSVoxdGFEdU84RGZvRjBH?=
 =?utf-8?B?cCs0Y2NIRzllZUJ6ZG9qenF5TVdPY05CejJsNmYyNWRNUDdTYUdpeE9ibUxo?=
 =?utf-8?B?NXd6VHlmbm5pSXJGRnVWV0l0ZHZIZHNsZ3pORTFBV2FQUFN1aGhxSGFab0M1?=
 =?utf-8?B?MlVNRVVJS1hDODhFRnlMcTBCWkNoK2dVUXJoUVhzRmhmRjBobWhIcUY5Q2tC?=
 =?utf-8?B?NmErMXlHaEd4OWx5Z0FvNS9TUE52MVo3YUZlR1N3aXpQVm1ZRFJXRUJIN1VD?=
 =?utf-8?B?VkxmQ3JXZEpFSUhqQWd4WGdkZHZJUHkybXZQZDYzVDhiMHVwQlc2UTRqcnR4?=
 =?utf-8?B?TXZFOEx3U3drWm04NXQvRDc3Y01GcTZ2OURQODVxRTVBTUZJK2Nldmxmb1BG?=
 =?utf-8?B?OW45YktqakcveWttb0UzUU1UYVo2UGxldTVjWWNlK2svRlplSkpNNUx4TTB0?=
 =?utf-8?B?eWhzcm9XVnlBK2o0R3BVckc4Y2RpWE9NVW5wZEpnTVhjeW5UdjdBc0h0cm9O?=
 =?utf-8?B?THpZTE5kYmdQVlJEOTNLYnBWdVhXT0ZVRS9SSmV6ci9NN3lMUkRKbGExenE1?=
 =?utf-8?B?U1kwTS9ndi9nNTJ4THRhRHRWb1hTRGtqcEVYMTBQTUxNNS9SYmdUUi8waElI?=
 =?utf-8?B?bzJUL0doOXhGQSt6a0loRm8xQnNoQmVlQkF0QVRlYmg0THIxZjVpY1JXTzBN?=
 =?utf-8?B?K2FuRTZTTmtSdnVWV1NNSnBJYlFxOStuNWcwZWJWYWgxY2FwaFcwU0VYc1ZW?=
 =?utf-8?B?c0ZGYUp4RjRsRmhMSXdFVyt1QjFxVlB2Y0F0V3MzeGFXemgrQlJIeTBXOWVj?=
 =?utf-8?B?TjFVZVZHOVk5S0l3RkltNHdueFZEVVJvdWZjTHIxdEdLRzhMS21Lb3FvYkl6?=
 =?utf-8?B?Q2x2cVcybWxkZmVIMWtvTHZUS0ZoZHNvS1lTVFprcjJNRGlGbnZ3MktMZllG?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A11255B4717FF44B3E33DF078064EFC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e34881-ac45-4e0e-9a0f-08da8bd9f8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 05:22:32.2425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juFLgWQMGBV9vJAXl5aa40vusEVDfWU20NT1S6JB/c7h7+glt1OeelD0/8cSVJkmh63owfvsc/wAqL0Wgl3Ba3meImcTxUxEStwr9XRwltc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3306
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMDA6NDUsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIFR1ZSwgQXVnIDMwLCAyMDIyIGF0IDA5OjEwOjAyQU0gKzAwMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBMZSAzMC8wOC8yMDIyIMOgIDExOjAxLCBOaWNo
b2xhcyBQaWdnaW4gYSDDqWNyaXTCoDoNCj4+PiBPbiBUdWUgQXVnIDMwLCAyMDIyIGF0IDM6MjQg
UE0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4+IFRoaXMgaXMgc3RpbGwgc2xp
Z2h0bHkgY29uY2VybmluZyB0byBtZS4gSXMgdGhlcmUgYW55IGd1YXJhbnRlZSB0aGF0IHRoZQ0K
Pj4+Pj4gY29tcGlsZXIgd291bGQgbm90IHVzZSBhIGRpZmZlcmVudCBzZXF1ZW5jZSBmb3IgdGhl
IGFkZHJlc3MgaGVyZT8NCj4+Pj4+DQo+Pj4+PiBNYXliZSBleHBsaWNpdCByMTMgaXMgcmVxdWly
ZWQuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBsb2NhbF9wYWNhIGlzIGRlZmluZWQgYXM6DQo+Pj4+DQo+
Pj4+IAlyZWdpc3RlciBzdHJ1Y3QgcGFjYV9zdHJ1Y3QgKmxvY2FsX3BhY2EgYXNtKCJyMTMiKTsN
Cj4gDQo+IEFuZCB0aGlzIGlzIGluIGdsb2JhbCBzY29wZSwgbWFraW5nIGl0IGEgZ2xvYmFsIHJl
Z2lzdGVyIHZhcmlhYmxlLg0KPiANCj4+Pj4gV2h5IHdvdWxkIHRoZSBjb21waWxlciB1c2UgYW5v
dGhlciByZWdpc3RlciA/DQo+Pj4NCj4+PiBIb3BlZnVsbHkgaXQgZG9lc24ndC4gSXMgaXQgZ3Vh
cmFudGVlZCB0aGF0IGl0IHdvbid0Pw0KPiANCj4gWWVzLCB0aGlzIGlzIGd1YXJhbnRlZWQuDQo+
IA0KPiBGb3IgYSBsb2NhbCByZWdpc3RlciB2YXJpYWJsZSB0aGlzIGlzIGd1YXJhbnRlZWQgb25s
eSBmb3Igb3BlcmFuZHMgdG8gYW4NCj4gZXh0ZW5kZWQgaW5saW5lIGFzbTsgYW55IG90aGVyIGFj
Y2VzcyB0byB0aGUgdmFyaWFibGUgZG9lcyBub3QgaGF2ZSB0bw0KPiBwdXQgaXQgaW4gdGhlIHNw
ZWNpZmllZCByZWdpc3Rlci4NCj4gDQo+IEJ1dCB0aGlzIGlzIGEgZ2xvYmFsIHJlZ2lzdGVyIHZh
cmlhYmxlLiAgVGhlIG9ubHkgdGhpbmcgdGhhdCB3b3VsZCBtYWtlDQo+IHRoaXMgY3Jhc2ggYW5k
IGJ1cm4gaXMgaWYgKmFueSogdHJhbnNsYXRpb24gdW5pdCBkaWQgbm90IHNlZSB0aGlzDQo+IGRl
Y2xhcmF0aW9uOiBpdCBjb3VsZCB0aGVuIHVzZSByMTMgKGlmIHRoYXQgd2FzIGFsbG93ZWQgYnkg
dGhlIEFCSSBpbg0KPiBlZmZlY3QsIGhlaCkuDQo+IA0KPj4+IEknbSBzdXJlIFNlZ2hlciB3aWxs
IGJlIGRlbGlnaHRlZCB3aXRoIHRoZSBjcmVhdGl2ZSBhc20gaW4gX19kb19JUlENCj4+PiBhbmQg
Y2FsbF9kb19pcnEgOikgKkdyYWJzIHBvcGNvcm4qDQo+IA0KPiBBbGwgdGhhdCAlJSBpcyBibGlu
ZGluZywgeWVzLg0KPiANCj4gSW5saW5lIHRhYnMgYXJlIGJhZCB0YXN0ZS4NCj4gDQo+IE9wZXJh
bmQgbmFtZXMgaW5zdGVhZCBvZiBudW1iZXJzIGFyZSBncmVhdCBmb3Igb2JmdXNjYXRpb24sIGFu
ZCBub3RoaW5nDQo+IGVsc2UgLS0gdW5sZXNzIHlvdSBoYXZlIG1vcmUgdGhhbiBmb3VyIG9yIGZp
dmUgb3BlcmFuZHMsIGluIHdoaWNoIGNhc2UNCj4geW91IGhhdmUgYmlnZ2VyIHByb2JsZW1zIGFs
cmVhZHkuDQo+IA0KPiBPaCwgdGhpcyBmdW5jdGlvbiBpcyBhIGdvb2QgZXhhbXBsZSBvZiBwcm9w
ZXIgdXNlIG9mIGxvY2FsIHJlZ2lzdGVyIGFzbSwNCj4gYnR3Lg0KPiANCj4gQ29tbWVudHMgbGlr
ZSAiLy8gSW5wdXRzIiBhcmUganVzdCBoYXJtZnVsLiAgQXMgaXMgdGhlICJjcmVhdGl2ZSINCj4g
aW5kZW50YXRpb24gaGVyZS4gIEJvdGggaGFybSByZWFkYWJpbGl0eSBhbmQgZG8gbm90IGhlbHAg
dW5kZXJzdGFuZGluZw0KPiBpbiBhbnkgb3RoZXIgd2F5IGVpdGhlci4NCj4gDQo+IFRoZSB0aGlu
ZyBhYm91dCBpbmxpbmUgYXNtIGlzIHRoZSBzbWFsbGVzdCBkZXRhaWxzIGNoYW5nZSBtZWFuaW5n
IG9mIHRoZQ0KPiB3aG9sZSwgaXQgaXMgYSB2ZXJ5IGhhcnNoIGVudmlyb25tZW50LCB5b3UgYXJl
IHByb2dyYW1taW5nIGJvdGggaW4gQyBhbmQNCj4gZGlyZWN0bHkgYXNzZW1ibGVyIGNvZGUgYXMg
d2VsbCwgYW5kIHRoaW5ncyBoYXZlIHRvIGJlIHZhbGlkIGZvciBib3RoLA0KPiBhbHRob3VnaCBv
biB0aGUgb3RoZXIgaGFuZCB0aGVyZSBpcyBhbG1vc3Qgbm8gZXJyb3IgY2hlY2tpbmcuICBLZWVw
aW5nDQo+IGl0IHNtYWxsLCBzaW1wbGUsIHJlYWRhYmxlIGlzIHBhcmFtb3VudC4NCj4gDQo+IFRo
ZSBydWxlcyBmb3IgdXNpbmcgaW5saW5lIGFzbToNCj4gDQo+IDApIERvIG5vIHVzZSBpbmxpbmUg
YXNtLg0KPiAxKSBVc2UgZXh0ZW5kZWQgYXNtLCB1bmxlc3MgeW91IGtub3cgYWxsIGRpZmZlcmVu
Y2VzIHdpdGggYmFzaWMgYXNtLCBhbmQNCj4gICAgIHlvdSBrbm93IHlvdSB3YW50IHRoYXQuICBB
bmQgaWYgeW91IGFuc3dlciAieWVzIEkgZG8iIHRvIHRoZSBsYXR0ZXIsDQo+ICAgICB5b3UgYW5z
d2VyZWQgd3JvbmcgdG8gdGhlIGZvcm1lci4NCj4gMikgRG8gbm90IHVzZSB0b3BsZXZlbCBhc20u
DQo+IDMpIERvIG5vIHVzZSBpbmxpbmUgYXNtLg0KPiA0KSBEbyBubyB1c2UgaW5saW5lIGFzbS4N
Cj4gNSkgRG8gbm8gdXNlIGlubGluZSBhc20uDQo+IA0KPiBJbmxpbmUgYXNtIGlzIGEgdmVyeSBw
b3dlcmZ1bCBlc2NhcGUgaGF0Y2guICBMaWtlIGFsbCBlbWVyZ2VuY3kgZXhpdHMsDQo+IHlvdSBz
aG91bGQgbm90IHVzZSB0aGVtIGlmIHlvdSBkbyBub3QgbmVlZCB0aGVtISAgOi0pDQo+IA0KPiBC
dXQsIHlvdSBhcmUgdGFsa2luZyBhYm91dCB0aGUgZnVuY3Rpb24gY2FsbGluZyBhbmQgdGhlIGZy
YW1lIGNoYW5nZSBJDQo+IGJldCA6LSkgIEJvdGggb2YgdGhlc2UgYXJlIG9ubHkgb2theSBiZWNh
dXNlIGV2ZXJ5dGhpbmcgaXMgYmFjayBhcyBpdA0KPiB3YXMgd2hlbiB0aGlzIChzaW5nbGUhKSBh
c20gaXMgZG9uZSwgYW5kIHRoZSBzdGF0ZSBjcmVhdGVkIGlzIHBlcmZlY3RseQ0KPiBmaW5lICh0
aGlzIGlzIHZlcnkgZGVwZW5kZW50IG9uIGV4YWN0IEFCSSB1c2VkLCBldGMuKQ0KPiANCj4gSSB3
b3VsZCBoYXZlIHVzZWQgcmVhbCBhc3NlbWJsZXIgY29kZSBoZXJlIChpbiBhIC5zIGZpbGUpLiAg
QnV0IHRoZXJlDQo+IHByb2JhYmx5IGFyZSByZWFzb25zIHRvIGRvIHRoaW5ncyB0aGlzIHdheSwg
cGVyZm9ybWFuY2UgcHJvYmFibHk/DQoNCldlIGNoYW5nZWQgaXQgdG8gaW5saW5lIGFzbSBpbiBv
cmRlciB0byAuLi4gaW5saW5lIGl0IGluIHRoZSBjYWxsZXIuDQoNCkkgYWxzbyBmaW5kIHRoYXQg
dGhvc2Ugb3BlcmFuZCBuYW1lcyBtYWtlIGl0IGF3dWxsIG1vcmUgZGlmZmljdWx0IHRvIA0KcmVh
ZCB0aGF0IHRyYWRpdGlvbmFsIG51bWJlcmluZy4gSSByZWFsbHkgZGlzbGlrZSB0aGF0IG5ldyB0
cmVuZC4NCkFuZCBzYW1lIHdpdGggdGhvc2UgLy8gY29tbWVudHMsIGJldHRlciB1c2UgbWVhbmlu
Z2Z1bGwgQyB2YXJpYWJsZSBuYW1lcy4NCg0KQ2hyaXN0b3BoZQ==
