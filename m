Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE748008C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 11:45:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aRpL3jHi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShV88656Fz3d9v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 21:45:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aRpL3jHi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShV7J33k6z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 21:44:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9Z6xp7fe/pJgtofqE/dSVXwWq45eAunY+T6G0KWRZUnLhPEmKduvyl1XvsJELvroN6Pu/YoEvHvle9SXEIEBTpVb93Y9pxs5bFQqgm+SbtEJ+sYpofGDv0T9id6yILIf0OXBFpFn+Wri7XlgYPZrDmzRiaN0cao6tIi7YnJeWf5V1Uuvzfdlsnp5dNGBQINKXJlQnsjctInxR1+xYl19OLI6w3+yD+bs3rBXMG2Ca1/ftpC7nbmTGOnSd+K8IiX+kQW7woR6WTsmKUv8tCa5Q1CLJESKVAoSC6lwv9SkMWD5MnTOcGGWlFcPqXID7HnwgZROXg8ewFoVQAcJMLURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v1N0Yw8b/jWoWmydJMMPXdhnECXIrvheGwhVeId3Ig=;
 b=hfp+XjmupFvowfTfIhFHokI+Tx5J5YG51G/6DvSh2fzlG89KlxBI/zv5T5egsUpjtNuQpFNzxPRGqeeVKX9bhi1fgMSPO6hQepBGVGPeBbHI2h03AU1DVp3v6pW27aj1BIWTBBa9XetaP7pdJoO3rmttoyN3AOlUTHtVPaIFxcTyMRCFqi+mMewtJZNOUWwhtW8b+nctrRX93IJ48VuDVcv4VfLD4wmywrV6ECmV/dkUhOfsyjHYKRHBjfDxhVPg+emN7OlO35jwjFqudtrRhWXEJ4Bmtz4zMTZCVVfzFhNLuycCLjxMYLxfqubQ21+mOF/7/YNQQ6Cq843A20PvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v1N0Yw8b/jWoWmydJMMPXdhnECXIrvheGwhVeId3Ig=;
 b=aRpL3jHiOCCQ+05Z+DWY51WhfBADaizgFmUK1BOhfd05U6Jl0MNI6aOQ2yqXeKQaIn4/3ohZ1vRVqSsOGhDmGcWCPqZg8jZ3FkkmJmJLz886kGFZ2vhCYeyn52NwRzyKlmZs7qnVfvbWAN0RqS7j3QNvNKoEMY++AyHudtZddY+X/4gLuKQ47ccdpfXTS95EScEjh6GVSNz7gqxqSRRZX8KhkLcA9pBh4aKmPWScj+ehItkX548UWz/X8h10tvnVCv435HabHmN3VSWbq2gxpkqIoe8/wpghFeA9km9SnclrrjqhqM70VZpm7oFQ9jsvKUsB5Xh7uBvY6PR/SOEwEA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.15; Fri, 1 Dec
 2023 10:44:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.014; Fri, 1 Dec 2023
 10:44:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Aneesh Kumar K.V
	<aneesh.kumar@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Thread-Topic: [PATCH v2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Thread-Index: AQHaFsnUmR8VQvWrR06bM3c6zDP/2rCUVsSAgAACV4A=
Date: Fri, 1 Dec 2023 10:44:21 +0000
Message-ID: <db7bb5b3-c183-4b4d-b7b1-3c3971033625@csgroup.eu>
References: <20231114071130.197966-1-aneesh.kumar@linux.ibm.com>
 <87a5qu1a7k.fsf@mail.lhotse>
In-Reply-To: <87a5qu1a7k.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2340:EE_
x-ms-office365-filtering-correlation-id: 96fb0dfa-2083-4012-01ff-08dbf25a7a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WOH0ydZPNIG+28CCX0M1+2GsXikWAKr10+C1ZXOu6mZRuj5o2KtEu74vyruEaG0s1HUck/STAmiXuoB8mmCzIgw0+TcUgvKDVmPc22IgNnk9CHiVdT13nqDG39Itrfv7trrhobwxWeIfZCI6Xocn88IH+5smzMKkF+U9rqnQXwxY2pjNbIONiWNrGIHcnC5ANdePqOuY1i4608FuxdNeJNnkPOV/5Ey2TT9BZ6AoqkQB4tGid0SoGRJlwZjpVjgn8moeFjnASV25yanqBDuJ708wiKJygs9Z8R8k+93vLqs4NjRKY/kgHSs1G2rA1c4VYD6jdFFGCHBlzEv7mLI07Qw2188GB51PZbgl97bH/P9AfDOVC/iOVefEyPpOAfrvxpEprvMKBAU0JBudosULRZ/SGFRGEdrWDLzyUIQX9NHRooeSafUExeOe2d2tfdWc9IjcmLlB8/B/5pbiewErEiF9CogfiZrtTmkmw3tYGmbvMOY4BQnxZZhVHuX0tfkEowduQT5p6CUz7l+ZIOQdNjrufb0yXZ1w6j/pEaoLVoAGZ2wsjuyJuE5kPWMGNEClV21DUHJTNl9Tv1iV8ldx2A70bbvXvM7FuK7TH9OhivWT+pUk340a9EMoviyadJONK9I/pQ3AFyr3Rs5K4XXbaUecyWoPtIJi9KtupcUxrnTayo2Con3JRklzYV9zja+UH+eZCOeKLd9RriFibFUnT+IeTLHdoMdB+6S2CJB0BI8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(376002)(346002)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(83380400001)(2616005)(6506007)(6512007)(66574015)(5660300002)(44832011)(41300700001)(91956017)(71200400001)(76116006)(6486002)(66946007)(8936002)(8676002)(66446008)(64756008)(66556008)(66476007)(38070700009)(316002)(110136005)(2906002)(31696002)(122000001)(86362001)(38100700002)(478600001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NkMwSktZWldlNHFKbVNvS3lmbkZkcXlhc1hVeUJoZ2lXUmFOeUhKRFhTeStX?=
 =?utf-8?B?aktvNFFBZTJqYlNrR3FjNHVxSm1ldStlelREMklTVElZQ1g0L2o3VmRRa2RS?=
 =?utf-8?B?WVVZTHpDL2o3dGRBUFZZTnZqd09UbVlDSExCTnVwZWJUQmQrTVNBNmc5RFhV?=
 =?utf-8?B?bVV4MThmUHFiRzBhdk9CV3dPcWV1UVhhd0U2WEd4QmNKSzRDazN6V2tCUUxa?=
 =?utf-8?B?M0UvT2dEdVhsUnRNWWFSc3lHS3RxdTZnUzlvSlExdnhGTmwxMEh2RzNpWG5y?=
 =?utf-8?B?L05hbEFVdXFOMVp3WDZWcjNSS1N1ZGpBaUtDdnJTOG1Gb2VQS0JWUFNONlFS?=
 =?utf-8?B?RGpyck9KZWlyYTdrK2QxSzVkQVZ1cklEelB6cmJEOGpEMmh0QmJhR1VTbmxJ?=
 =?utf-8?B?Rm5JcGpvVE9FM0E3NERxQVhpRmhydmZDWjdqMEZSOS9rUTdTYWx1Q08vMHNp?=
 =?utf-8?B?ZGN4YitYZW95VlBCSGVYeGV3WllJT0x6NER1djFpWDRTYmlhSUpRcUx1SkNJ?=
 =?utf-8?B?UElNcHVYOTRFZVhHYlRuc3FHUUdDUzZ4OC8yWW92alpXOXhRblE5R0hIVGpF?=
 =?utf-8?B?anEzMnRQTFRuNVl4MGpsVFFRTnQzZWRGQW8ydFlvZ2xLREU2b09QK29QWDND?=
 =?utf-8?B?azY2T0ppSGUwVmZjSlFkYnUrODFiZ2lOTTVaOSt1d0lGUXJUWDVXQ3laNHFW?=
 =?utf-8?B?U0MyazlwbGpSbUtIQTVobXMvNWR0dzN5aFpDL3piQjRLSUJZWkc3RzMxT2xW?=
 =?utf-8?B?bHBJOVpDSGNscUJpTFBxRkp5L2I5Mmk1b08rT2ZPZnY4ZzRGN3dNZ1UzemtZ?=
 =?utf-8?B?b3hqdDVnVk5GbzFuc0tQTUNBTXFEY2V5elQydms2SGdPb0RkWlZBM2JhSnJ5?=
 =?utf-8?B?c296Ly81aTBPN3I2YmcvMnBLcDhZZE4xTUNVd1lmdEJPTENEWGlPTXZnWDZa?=
 =?utf-8?B?VHRrRXA2OTdua3NrQXM0dkM3OGViNTFkSTgyMTIraFlHK2l5L0xpd1p1L3Nt?=
 =?utf-8?B?bnQ5QjhpTDhRRGhxU0hpeE8rS1h5VVdyZ2Z0aURxdkhSQXpFTnFPUi9nZkg5?=
 =?utf-8?B?R0krelkzeEpHSnU3ZEI1TEh2MVNjdklQanRJL2txdTQ5NVpMTHYyYVZrSjh5?=
 =?utf-8?B?L1ZxOVBrMXhIRnV4dXdFK0Q0cUFhbUxDZXRLTTA1dkRuSUtaaVA5dzRNWFF6?=
 =?utf-8?B?SFdNcVQwUGo3Q3NVRVQxb1RxNEZXZjlCNzdDNzhnd1ArMTR2MEI2ZU9CNnpB?=
 =?utf-8?B?ZFc2L09HYXRUKzlteG1XcGJpcDhwSFRXbENER3BKMVNNemN2S1hYbENqWmxQ?=
 =?utf-8?B?NDZlVmJ4ejRvK3ZLcnhsUTZzMXh6c0ZjTi9xYzVPTkplUkxhSWh2bldTQVBU?=
 =?utf-8?B?L3R1TjlycXRWUFJNbkZKMkxwN0FzRFY0ZG1iTEVFRUNJODFsUGdka1VVYXVB?=
 =?utf-8?B?Tm01em1hSzdGeVlXWWc4K3ZPUERiSEtKZE95cThDb3R0ek9vRDB6blp1UDU2?=
 =?utf-8?B?VnpuVG02eHdwbjQvdlMrL3ZXTkdiUE9UNEhJYU9Wa1JXZVdtRzNtekxPNDFx?=
 =?utf-8?B?cFY5WlVtb29EOHB2T2lnL2VBdGVQSHdGZHNmRGJrT1YyMHpxbDFqUnlrT01s?=
 =?utf-8?B?NEdGOThoSWFpaEhtVzNleDJDdGlqUUxBQUNsRUF4dUpLUlRnWnZvQWIwWGRv?=
 =?utf-8?B?UDc0anMrRWFUTXpsUkFXTzVVQ0tqZ3R6RFZ6Qm5XV1ZiUUFjRURVdjA0Q2Ra?=
 =?utf-8?B?NEFQUWorQlhWYjlHZmxyaXVTbER5b0Vod0JVSzZ3SUxqMU5nZngvVkZPeSsv?=
 =?utf-8?B?Q041WmZBdE92QkNQSWV3dnZnbEdXUlJQSHJ4UDIwaWc4T0Y2K3dORjRpZVVV?=
 =?utf-8?B?cFFUTkhpa1RiY09mMHIvUHNjK1FDUjFSU1JuNFZ1NHlUQ1QvRWxyUmpjYzUy?=
 =?utf-8?B?UXQ3T3dRSU84aEZ3RXhVWEh3TjVnS0kyV2Q2S2dUMXFYNFVOYktHMkRuUndi?=
 =?utf-8?B?TzQyUXNxaDVhaXFhM1h3S215bHJLZGI5Y2N4Zi9oMGNhTXE2eTRPWHVnR01a?=
 =?utf-8?B?cjJjcm9IQWVLOXRSY2Q4TkdzZ251ZzhZMkgvL3dJb0IwVlZmbTdrc0FVUGRi?=
 =?utf-8?B?T3hpRzRZQlozWTBNY0VWSUREb3ZGZHhJYmZRNitzaXNoMkpwSHZzR0IyK2xN?=
 =?utf-8?B?TDI4L2RFQXEyUkRtQk1iam5xWE5zN0hFTHluZ0E0ZDRUNDBndWZsZ21TV2pV?=
 =?utf-8?B?Y1hya1ZiaUF6RnNWV0swK2FnMXBBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E456CD844A5A4459898AD44F969ECEE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fb0dfa-2083-4012-01ff-08dbf25a7a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:44:21.9876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6AyDpxXTy0F8loz93j/CAu+Rsm8dZEJN9y4Zub0TnTEV9DGGcQvFrdpwMIdxyxa/xEvj00idw8FBuTuoAv+ZfozQcN/JaCpf7aajfXv2sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2340
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

DQoNCkxlIDAxLzEyLzIwMjMgw6AgMTE6MzUsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gIkFuZWVzaCBLdW1hciBLLlYiIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4gd3JpdGVz
Og0KPj4gVGhlcmUgdXNlZCB0byBiZSBhIGRlcGVuZGVuY3kgb24gX1BBR0VfUFJJVklMRUdFRCB3
aXRoIHB0ZV9zYXZlZHdyaXRlLg0KPj4gQnV0IHRoYXQgZ290IGRyb3BwZWQgYnkNCj4+IGNvbW1p
dCA2YTU2Y2NiY2Y2YzYgKCJtbS9hdXRvbnVtYTogdXNlIGNhbl9jaGFuZ2VfKHB0ZXxwbWQpX3dy
aXRhYmxlKCkgdG8gcmVwbGFjZSBzYXZlZHdyaXRlIikNCj4+DQo+PiBXaXRoIHRoZSBjaGFuZ2Ug
aW4gdGhpcyBwYXRjaCBudW1hIGZhdWx0IHB0ZSAocHRlX3Byb3Rub25lKCkpIGdldHMgbWFwcGVk
IGFzIHJlZ3VsYXIgdXNlciBwdGUNCj4+IHdpdGggUldYIGNsZWFyZWQgKG5vLWFjY2Vzcykgd2hl
cmVhcyBlYXJsaWVyIGl0IHVzZWQgdG8gYmUgbWFwcGVkIF9QQUdFX1BSSVZJTEVHRUQuDQo+Pg0K
Pj4gSGFzaCBmYXVsdCBoYW5kbGluZyBjb2RlIGRpZCBnZXQgc29tZSBXQVJOX09OIGFkZGVkIGJl
Y2F1c2UgdGhvc2UNCj4+IGZ1bmN0aW9ucyBhcmUgbm90IGV4cGVjdGVkIHRvIGdldCBjYWxsZWQg
d2l0aCBfUEFHRV9SRUFEIGNsZWFyZWQuDQo+PiBjb21taXQgMTgwNjFjMTdjOGVjICgicG93ZXJw
Yy9tbTogVXBkYXRlIFBST1RGQVVMVCBoYW5kbGluZyBpbiB0aGUgcGFnZSBmYXVsdCBwYXRoIikN
Cj4+IGV4cGxhaW5zIHRoZSBkZXRhaWxzLg0KPiAgIA0KPiBZb3Ugc2F5ICJkaWQgZ2V0IiB3aGlj
aCBtYWtlcyBtZSB0aGluayB5b3UncmUgdGFsa2luZyBhYm91dCB0aGUgcGFzdC4NCj4gQnV0IEkg
dGhpbmsgeW91J3JlIHJlZmVycmluZyB0byB0aGUgV0FSTl9PTiB5b3UgYXJlIGFkZGluZyBpbiB0
aGlzIHBhdGNoPw0KPiANCj4+IEFsc28gcmV2ZXJ0IGNvbW1pdCAxYWJjZTA1ODBiODkgKCJwb3dl
cnBjLzY0czogRml4IF9fcHRlX25lZWRzX2ZsdXNoKCkgZmFsc2UgcG9zaXRpdmUgd2FybmluZyIp
DQo+IA0KPiBUaGF0IGNvdWxkIGJlIGRvbmUgc2VwYXJhdGVseSBhcyBhIGZvbGxvdy11cCBjb3Vs
ZG4ndCBpdD8gV291bGQgcmVkdWNlDQo+IHRoZSBkaWZmIHNpemUuDQo+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+DQo+PiAt
LS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggIHwg
OSArKystLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJm
bHVzaC5oIHwgOSArKy0tLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hf
dXRpbHMuYyAgICAgICAgIHwgNyArKysrKysrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4+IGluZGV4IGNiNzdlZGRjYTU0Yi4uMmNjNThh
Yzc0MDgwIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC9wZ3RhYmxlLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQv
cGd0YWJsZS5oDQo+PiBAQCAtMTcsMTIgKzE3LDYgQEANCj4+ICAgI2RlZmluZSBfUEFHRV9FWEVD
CQkweDAwMDAxIC8qIGV4ZWN1dGUgcGVybWlzc2lvbiAqLw0KPj4gICAjZGVmaW5lIF9QQUdFX1dS
SVRFCQkweDAwMDAyIC8qIHdyaXRlIGFjY2VzcyBhbGxvd2VkICovDQo+PiAgICNkZWZpbmUgX1BB
R0VfUkVBRAkJMHgwMDAwNAkvKiByZWFkIGFjY2VzcyBhbGxvd2VkICovDQo+PiAtI2RlZmluZSBf
UEFHRV9OQQkJX1BBR0VfUFJJVklMRUdFRA0KPiAgIA0KPj4gLSNkZWZpbmUgX1BBR0VfTkFYCQlf
UEFHRV9FWEVDDQo+PiAtI2RlZmluZSBfUEFHRV9STwkJX1BBR0VfUkVBRA0KPj4gLSNkZWZpbmUg
X1BBR0VfUk9YCQkoX1BBR0VfUkVBRCB8IF9QQUdFX0VYRUMpDQo+PiAtI2RlZmluZSBfUEFHRV9S
VwkJKF9QQUdFX1JFQUQgfCBfUEFHRV9XUklURSkNCj4+IC0jZGVmaW5lIF9QQUdFX1JXWAkJKF9Q
QUdFX1JFQUQgfCBfUEFHRV9XUklURSB8IF9QQUdFX0VYRUMpDQo+ICAgDQo+IFRob3NlIGFyZSB1
bnJlbGF0ZWQgSSB0aGluaz8NCg0KVGhleSBhcmUgcmVsYXRlZC4gVGhvc2UgZXhpc3RzIG9ubHkg
YmVjYXVzZSBfUEFHRV9OQSBpcyBkaWZmZXJlbnQgZnJvbSANCnRoZSBvbmUgZGVmaW5lZCBpbiBh
c20vcGd0YWJsZS1tYXNrcy5oDQoNCkFzIHNvb24gYXMgeW91IHJlbW92ZSBfUEFHRV9QUklWSUxF
R0VEIGZyb20gX1BBR0VfTkEsIGV2ZXJ5dGhpbmcgYmVjb21lIA0Kc3RhbmRhcmQgYW5kIGlzIHRh
a2VuIGZyb20gYXNtL3BndGFibGUtbWFza3MuaA0KDQo+IA0KPj4gICAjZGVmaW5lIF9QQUdFX1BS
SVZJTEVHRUQJMHgwMDAwOCAvKiBrZXJuZWwgYWNjZXNzIG9ubHkgKi8NCj4+ICAgI2RlZmluZSBf
UEFHRV9TQU8JCTB4MDAwMTAgLyogU3Ryb25nIGFjY2VzcyBvcmRlciAqLw0KPj4gICAjZGVmaW5l
IF9QQUdFX05PTl9JREVNUE9URU5UCTB4MDAwMjAgLyogbm9uIGlkZW1wb3RlbnQgbWVtb3J5ICov
DQo+PiBAQCAtNTI5LDYgKzUyMyw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcihwdGVf
dCBwdGUpDQo+PiAgIH0NCj4+ICAgDQo+PiAgICNkZWZpbmUgcHRlX2FjY2Vzc19wZXJtaXR0ZWQg
cHRlX2FjY2Vzc19wZXJtaXR0ZWQNCj4+ICsvKg0KPj4gKyAqIGV4ZWN1dGUtb25seSBtYXBwaW5n
cyByZXR1cm4gZmFsc2UNCj4+ICsgKi8NCj4gDQo+IFRoYXQgd291bGQgZml0IGJldHRlciBpbiB0
aGUgZXhpc3RpbmcgY29tbWVudCBibG9jayBpbnNpZGUgdGhlIGZ1bmN0aW9uDQo+IEkgdGhpbmsu
IE5vcm1hbGx5IHRoaXMgbG9jYXRpb24gd291bGQgYmUgYSBmdW5jdGlvbiBkZXNjcmlwdGlvbiBj
b21tZW50Lg0KPiANCj4+ICAgc3RhdGljIGlubGluZSBib29sIHB0ZV9hY2Nlc3NfcGVybWl0dGVk
KHB0ZV90IHB0ZSwgYm9vbCB3cml0ZSkNCj4+ICAgew0KPj4gICAJLyoNCj4gICAgICAgICAgICBp
ZS4gaGVyZQ0KPiANCj4gY2hlZXJzDQo=
