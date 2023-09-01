Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07178F94E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 09:44:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Orzl6qai;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcVRZ0kmvz2xdX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 17:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Orzl6qai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::616; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcVQg39Ltz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 17:43:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zkc4vM2MxMBvMO1nbzLhkKqDidTfOvPV+Gs22WN5j0CRDDg9EPt2k1Gpf8joNk6pI0EyB6MvJyqiYXUjOfjBBELfAkfb91+67ULT4p96R9KYT2i/o6R0VTD0J394y4ys5tFR4FJUwLDQLhV+1hhMGOJ3AsQl/bLVHWwpKMC8sIHY7wtrQqbfMgkSNq9WEAya8CeyPR98yxHaucrDomH40hTgLKX/KQkmqDWHwW/L3YOCSJ06jW0AjMnboENzkuX1ytBcEqT5qaciBnwXuleO5bfIXaGUyYivfEylUcFhWMCwVSZR9kmv9gy+HkL0KVutSCs/bywQlP2iFRuMHMl80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ntoR9SVBiZXeYdL063bdRNx1oCE7x+oQYsOW8MmkV4=;
 b=K+sWGyTybEuYhLyG0Bu3lqm0nmPJa+GaiNLiQC67ee4M0dwiya6bLfTPO7JZAwJlzyPZ+p31SHZOf0wpDjHWPiJr1tihw0RIPZXEX5X7/HOODDNC0YvB3eDuDqEtCSGNHmB1iefH5x7vOn3Z3yBi3MSL6vnlAZWA3Fd/j8rN4PkpyVj8wFW/0bdJbRwRW5ng8DYlkbWsqJcZFiXckiTWeBntLDa5zoyQemS7oT9QyPNYT9hrwaVcf34yXtP86kg3ftMuXGretjbhR6papo1xeoRzO8wRjrqNawLAdgT4/kbB0GlBKXP6tlg37slU+HMo8f/sxvYSXRiFZ16Tr8eH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ntoR9SVBiZXeYdL063bdRNx1oCE7x+oQYsOW8MmkV4=;
 b=Orzl6qaigAKaBomZT9Aq5waykZSpL4B+WfXc8snMqf0/sehm5iFX9Zv2RY00M7yRf0HNh+9e4XW2k3o1z+VYgBYA0UaPdA+qecyluOmcv/XJEeN+bRj5itQjB7UyqUPCT4zeAZEdxCP78aMaRNfM4lw4vO5c0Ck4YJtjPG6fqA642UIUdd663uZm2EJOMkPgHbsOI1J6MpJaXdVVFKggBJ8n+18CZcn0/CU3MXUV8CEE2HordeArwfLAQSPRcHhN831I8TEMSCY/buXOnSY1jQQR3Kykqske97SJreJnm+l4/vEPtRtLr3RQQk3lsKUPBjjrjZtRHOjlEbh8EzsLFw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3073.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 07:43:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 07:43:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsA
Date: Fri, 1 Sep 2023 07:43:34 +0000
Message-ID: <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
In-Reply-To: <20230901004417.631dc019@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3073:EE_
x-ms-office365-filtering-correlation-id: 789b0990-91d7-4251-9f34-08dbaabf2537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3SKg2UDN+B2xy6IHOwPObLMynXDZpUvlz4aEcHab+JFAK8WowjXdiRtqySLp2Cm4Ut/ofGeizcigCRoEzvKQpp0ZFYNyrarxYONJU6+7UgJQCutjGNSckcGejt8olHtcSGbyh+XQCSc4oXtjAzBv7vVaHAlUQZQCNYbJcl3YGyRXHhuHeFmHK1DKdpvJEre+nIKDvZ//IKPWB49oHEiJFqfmKcUtWnVOtQB41MhHWVuYCCQCFSylCviTOZGJiBDrxmb8ZLAGgZiI+Cg98DteYEIwhJH+duYNNijg4XX/UCNIpyEKmzXqs2k0VufbKEGIOxo79DdsPgdU7EGG8ngmHJScMLBuv4QaKAtey2jl6aU8L3K3x8nmrwLjilyOo9YmObeoA30N2Oatlw+yN+ZX4yFa+d7SdGrsenLeeg0pVjJhZNAW7zBS7z9NfbxmVaWXvHWV/BJKE/ZHeidwnyyIFgBcwI3OJ2aFwYvBWgeH3RVZ09fbjJVUMStxDIEseneiLDoSr/JckWfjnK+GZlKWphAWh/LuluKSjDwPfHuF9NY06URDs6QbFerZQ/CZE2FZft6+7DCp5ZF2eZRMFFowEQRUP1VK+w7I+jOCxu3y+CAxQYgqK85QYo1rSWQIRmXFv277Ii21/I3YHnEI02rmzc0hNiOSih4huY6iCXDPmmS2qW14ZPJEicp8nDFJ0NfKp5pzugCwrvOU9DQ25xqm4Iz9BlP7viUKGZlUkAhlDhU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39850400004)(396003)(346002)(186009)(1800799009)(451199024)(6512007)(83380400001)(966005)(2616005)(31686004)(6506007)(6486002)(71200400001)(478600001)(19627235002)(91956017)(64756008)(76116006)(54906003)(66556008)(66476007)(66446008)(66946007)(66574015)(6916009)(316002)(44832011)(4326008)(8936002)(8676002)(5660300002)(36756003)(122000001)(86362001)(38100700002)(38070700005)(31696002)(2906002)(41300700001)(45980500001)(43740500002)(505234007)(47845010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L1dHZy9tMjNVNzhPQlpLL21XY2F2UGNONWtUOXk5UUNvOUQvTUVrL2lYQlQ4?=
 =?utf-8?B?M2I1aDJGcVAza2lCdW5DQ0tRM3dZaGVFN0FvWm5POGV2c3ErcTRGRWJZVUZZ?=
 =?utf-8?B?cVM5VHczNXFkVDlKempPM3A4cVZLVnN0NHRrYythOEJKbmRvUC9XT0VSSmlD?=
 =?utf-8?B?SzBWTHhWZnJGRE5iTEE3NVF1SjdJQitWVVZ3VnVTZEZVbFBwZmJFOTZjaHZ5?=
 =?utf-8?B?ZUR2TzhIWWRUODkyNERZTng4M3RuNWF2M2QvM3ZxU3R4eGJvT1RRQm5nV0Fp?=
 =?utf-8?B?S3g4N1FLN0RRUnVlZW5JTnU2Umx3THQ4ckp4amNMZFMxckRIamFhbnd3VFF1?=
 =?utf-8?B?Q096cldYVCtHYUIvZnhlTDdyTVV1VzB5c3MwNzUzdVlpRmhhaXJubnExNmFl?=
 =?utf-8?B?U0R1SS9adXo0ek5jR2dkbnpsd0gyYWU0NldZQWo5a3Rnb0QycjdGOG9QWEJ5?=
 =?utf-8?B?N01wcWEzTC93T2hEdk5rZTNzVjJDS01ablBWQXNpWjJzY1h5M0RwN0RWSnZF?=
 =?utf-8?B?Z09acytDQmUwOURnajlQaENPL1VTajBRSTFMMFlPeUJtM25mdzJ5bVI1aG9Q?=
 =?utf-8?B?QTkwdFh6OUpaZFdrNml1OUQreWNxNm1WRWRYRTVsZHgwMVBEYnd5OTFhcmhY?=
 =?utf-8?B?Y2RYbjJiU2RJQlVCeUhUbjJFdEMvWVdJL3NacUpiZUxQejQwaEp6cWlNZTNy?=
 =?utf-8?B?Z1A5T3l4RWhIaTlNUTVSUCtpaDN3ZjFTK3p6VDlGZlI2MXJ6NmZtQXpSckxq?=
 =?utf-8?B?THhuMHBoNmtZdWMwcVZpRWNJL1JZcGZ4blptQ1gzVG9KbHp3bFFEYWsvdE93?=
 =?utf-8?B?VisrdW9TQTFYMzBsTy8yTGF4b2lGTVJFQjJzaUxqaFZiTXhRNUd0YTV6Z29v?=
 =?utf-8?B?WVVXWEh1WUVuQ1hLNmtMUU1QK1laK3FDZ0FEYmE1dG5BeTZvNUpQWFNJTU4w?=
 =?utf-8?B?Q0NBa0U2c1g2WWtRV29GNlBkZUFEek9VNzY2cWtmMUF4bXM2YldQZFJWcWdD?=
 =?utf-8?B?U1RwZEdQL3hOaitxL3dIcWVCZnBhTXJpOVdoakFXTE5QWnAxbit0TWNBRkM3?=
 =?utf-8?B?QmM3L3RETmZSWUZOMzhmMWdVdE9hWVo4UnJ5cDhybnh5VCs4aWZqa0J0TlFk?=
 =?utf-8?B?bkFyaS9ZSDluV2JwMHdZNFBVbWxLNytHdW1HTGJoTlRNb3FkUHhsOUYvdnll?=
 =?utf-8?B?Qkc1em1MdXp4NGdaZkl0M2ttT21SUmZYTVRrRWJ3MzZVWUVOVjF1SWU3S25I?=
 =?utf-8?B?aHdHTEpLOHU5eEhnNEhoa2t2T3ZrRFpwV2tUM3Nod1FxZ01NN09JcHllUStX?=
 =?utf-8?B?aEhPY0Z4c240MWU5SG52S0JScVU0Sm5PZEF6bEJJNmJCUFU1RnpNbnFMSG1H?=
 =?utf-8?B?czNmMmdnQlFTem11d1ZpM3Q4d1ZVcnFLbzFYMUhPZDhPcDVra0JLRDVTRE5R?=
 =?utf-8?B?L3lVS1JEY0RiMkc0dVdOS2Y2WDNyaThDZVNqSEJmS05SMnFpRE95azlRb2wz?=
 =?utf-8?B?K2dLMUdyRFI1amlOUTVxSTBIVGxzTzNmRmNiUW5ab3lBNnZmUXhLTjl4aDgz?=
 =?utf-8?B?R1ZTT0liV3p0TU9BdDQ3WkJRNnVFU2FMaGVqc2ljRnRoYlh5b1QySk9oWU1V?=
 =?utf-8?B?aWRxZlJBNC90aWJxSW5rdkMvR0dUeE9LVklwdjdHV0pLT283bmlGbmhQbExa?=
 =?utf-8?B?aE9HMnQzanc5emhZK1gyWS9sbGd0UDVmWXc3dEtaakw4MjZNdVROSXl3Nlhq?=
 =?utf-8?B?MXpJb1J3ajhiUlpsS1crQlUvc0JGRzhxeTlMZCt0L0NRN3ZldkdHTFAzWmZG?=
 =?utf-8?B?bHpRMlBpck9rRm0yOWZiSlJVQUQvUmhxSDVsdlRLY2VDMXVidzBGaURVY1pk?=
 =?utf-8?B?b2hmdDAvSW9iaFMxVnBtb0FEaDVYOTFNVVlQc0ZVdC9qNTIrZXhrd0hPK3lT?=
 =?utf-8?B?eEExQXBlNk5YRFE1WlRrcUgycTJEV0c1RjVuL2l1bGVXVnhlWU5kK2YxRzBm?=
 =?utf-8?B?Y3dsVjdkMlRNaTJCdTdpN3dhdHVUV3ZIemI0bGZ6dFk1enpaeVVSWWNOTWQ3?=
 =?utf-8?B?SzlCa1ZsNFU0QUk5ck9LcnkyZWFOaWlzeFZuL2x0QXl6d21BVkRjNHpIL21N?=
 =?utf-8?B?TFZObzNXNm1VdE1ZNHdNMVNWQlErYk4vTUh0TzBhWkN4R2xiNGkvS3Z0MEtX?=
 =?utf-8?B?OXNXY2hEeEJsQ2FUSmFOU3pJalZjTVY1cVprSkdKRnIvSDRUMHJ2VEU0UXJo?=
 =?utf-8?B?TFRqRnpHUEJNcWZrVW9EV1FzbmZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3FD92FBF5F4A74E8BC1222D3AF68199@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 789b0990-91d7-4251-9f34-08dbaabf2537
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 07:43:34.2684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrNGnT5Zg8sTykGHRwlwP4+Y7NheV99XThMEn+ZmiwALJl/cCMLSpfrEm10EE64movkxgXOJiOx8ZbNrH1/mc/1IMnvXr83kIclDRAcpuok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3073
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjMgw6AgMDA6NDQsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMzEgQXVnIDIwMjMgMDU6MzI6NDYgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBPayBzbyB0aGVyZSBp
cyBzb21lIGNvcnJ1cHRlZCBtZW1vcnkgc29tZXdoZXJlLg0KPj4NCj4+IENhbiB5b3UgdHJ5IHdo
YXQgaGFwcGVucyB3aGVuIHlvdSByZW1vdmUgdGhlIGNhbGwgdG8ga2FzYW5faW5pdCgpIGF0IHRo
ZQ0KPj4gc3RhcnQgb2Ygc2V0dXBfYXJjaCgpIGluIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAt
Y29tbW9uLmMNCj4gDQo+IE9rLCBzbyBJIGxlZnQgdGhlIG90aGVyIHBhdGNoZXMgaW4gcGxhY2Ug
KyBidGV4dF9tYXAoKSBpbnN0ZWFkIG9mIGJ0ZXh0X3VubWFwKCkgYXQgdGhlIGVuZCBvZiBNTVVf
aW5pdCgpICsgTWljaGFlbHMgcGF0Y2ggYW5kIGFkZGl0aW9uYWxseSBjb21tZW50ZWQtb3V0IGth
c2FuX2luaXQoKSBhcyBzdGF0ZWQgYWJvdmUuIFRoZSBvdXRjb21lIGlzIHJhdGhlciBpbnRlcmVz
dGluZyEgTm93IEkgZGV0ZXJtaW5pc3RpY2FsbHkgZ2V0IHRoaXMgb3V0cHV0IGF0IGJvb3QgT0Yg
Y29uc29sZSwgcmVnYXJkbGVzcyB3aGV0ZXIgaXQncyBhIGNvbGQgYm9vdCBvciB3YXJtIGJvb3Q6
DQoNCkFoLCBteSBiYWQuIFlvdSBhbHNvIG5lZWQgdG8gcmVtb3ZlIHRoZSBjYWxsIHRvIGthc2Fu
X2xhdGVfaW5pdCgpIGluIA0KbWVtX2luaXQoKSBpbiBhcmNoL3Bvd2VycGMvbW0vbWVtLmMNCg0K
TmV2ZXJ0aGVsZXNzLCB5b3VyIHJlc3VsdCBpcyBpbnRlcmVzdGluZyBhcyBpdCBzaG93cyB0aGF0
IHRoZSBib290IGdvZXMgDQptdWNoIGZ1cnRoZXIgd2hlbiB3ZSBkb24ndCBpbml0aWFsaXNlIEtB
U0FOLg0KDQpJdCBwcm9iYWJseSBtZWFucyB0aGF0IGthc2FuX2luaXQoKSBtZXNzZWQgdXAgdGhp
bmdzLiBJIHdpbGwgdHJ5IHRvIGRpZyANCmEgYml0IG1vcmUgaW4ga2FzYW5faW5pdCgpIGFuZCBz
ZWUgd2hhdCB3ZSBjYW4gbG9vayBhdC4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiB2aWEtcG11OiBT
ZXJ2ZXIgTW9kZSBpcyBkaXNhYmxlZA0KPiBQTVUgZHJpdmVyIHYyIGluaXRpYWxpemVkIGZvciBD
b3JlOTksIGZpcm13YXJlOiAwYw0KPiBpb3JlbWFwKCkgY2FsbGVkIGVhcmx5IGZyb20gcG1hY19u
dnJhbV9pbml0KzB4MjA4LzB4N2MwLiBVc2UgZWFybHlfaW9yZW1hcCgpIGluc3RlYWQNCj4gbnZy
YW06IENoZWNraW5nIGJhbmsgMC4uLg0KPiBudnJhbTogZ2VuMD0zMjM0LCBnZW4xPTMyMzUNCj4g
bnZyYW06IEFjdGl2ZSBiYW5rIGlzOiAxDQo+IG52cmFtOiBPRiBwYXJ0aXRpb24gYXQgMHg0MTAN
Cj4gbnZyYW06IFhQIHBhcnRpdGlvbiBhdCAweDEwMjANCj4gbnZyYW06IE5SIHBhcnRpdGlvbiBh
dCAweDExMjANCj4gVG9wIG9mIFJBTTogMHg4MDAwMDAwMCwgVG90YWwgUkFNOiAweDgwMDAwMDAw
DQo+IE1lbW9yeSBob2xlIHNpemU6IDBNQg0KPiBab25lIHJhbmdlczoNCj4gICAgRE1BICAgICAg
W21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDJmZmZmZmZmXQ0KPiAgICBOb3JtYWwg
ICBlbXB0eQ0KPiAgICBIaWdoTWVtICBbbWVtIDB4MDAwMDAwMDAzMDAwMDAwMC0weDAwMDAwMDAw
N2ZmZmZmZmZdDQo+IE1vdmFibGUgem9uZSBzdGFydCBmb3IgZWFjaCBub2RlDQo+IEVhcmx5IG1l
bW9yeSBub2RlIHJhbmdlcw0KPiAgICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAt
MHgwMDAwMDAwMDdmZmZmZmZmXQ0KPiBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAw
MDAwMDAwMDAwMC0weDAwMDAwMDAwN2ZmZmZmZmZdDQo+IHBlcmNwdTogRW1iZWRkZWQgMTQgcGFn
ZXMvY3B1IHMyNDYwOCByODE5MiBkMjQ1NDQgdTU3MzQ0DQo+IHBjcHUtYWxsb2M6IHMyNDYwOCBy
ODE5MiBkMjQ1NDQgdTU3MzQ0IGFsbG9jPTE0KjQwOTYNCj4gcGNwdS1hbGxvYzogWzBdIDANCj4g
S2VybmVsIGNvbW1hbmQgbGluZTogcm8gcm9vdD0vZGV2L3NkYTUgbnJfY3B1cz0xIHpzd2FwLm1h
eF9wb29sX3BlcmNlbnQ9MTYgc2x1Yl9kZWJ1Zz1GWlAgcGFnZV9wb2lzb249MSBuZXRjb25zb2xl
PTY2NjZAMTkyLjE2OC4xNzguOC9ldGgwLDY2NjZAMTkyLjE2OC4xNzguMy83MDo4NTpDMjozMDpF
QzowMSBpbml0PS91c3IvbGliL3N5c3RlbWQvc3lzdGVtZA0KPiBEZW50cnkgY2FjaGUgaGFzaCB0
YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA3LCA1MjQyODggYnl0ZXMsIGxpbmVhcikNCj4g
SW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDYsIDI2MjE0NCBi
eXRlcywgbGluZWFyKQ0KPiBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3JvdXBpbmcgb24u
ICBUb3RhbCBwYWdlczogNTIyNTYwDQo+IG1lbSBhdXRvLWluaXQ6IHN0YWNrOmFsbChwYXR0ZXJu
KSwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpvZmYNCj4gc3RhY2tkZXBvdDogYWxsb2NhdGlu
ZyBoYXNoIHRhYmxlIHZpYSBhbGxvY19sYXJnZV9zeXN0ZW1faGFzaA0KPiBzdGFja2RlcG90IGhh
c2ggdGFibGUgZW50cmllczogMTA0ODU3NiAob3JkZXI6IDEwLCA0MTk0MzA0IGJ5dGVzLCBsaW5l
YXIpDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KPiBCVUc6IEtBU0FOOiBzdGFjay1vdXQtb2YtYm91bmRzIGluIF9f
a2VybmVsX3BvaXNvbl9wYWdlcysweDZjLzB4ZDANCj4gV3JpdGUgb2Ygc2l6ZSA0ODk2IGF0IGFk
ZHIgYzE3YTcwMDAgYnkgdGFzayBzd2FwcGVyLzANCj4gDQo+IENQVTogMCBQSUQ6IDAgQ29tbTog
c3dhcHBlciBUYWludGVkOiBHICAgICAgICAgICAgICAgIFQgNi41LjAtcmM3LVBNYWNHNC1kaXJ0
eSAjNw0KPiBIYXJkd2FyZSBuYW1lOiBQb3dlck1hYzMsNiA3NDU1IDB4ODAwMTAzMDMgUG93ZXJN
YWMNCj4gQ2FsbCBUcmFjZToNCj4gW2MxNzE3Y2UwXSBbYzBmNGVjNDBdIGR1bXBfc3RhY2tfbHZs
KzB4NjAvMHhhNCAodW5yZWxpYWJsZSkNCj4gW2MxNzE3ZDAwXSBbYzAzNjgzODBdIHByaW50X3Jl
cG9ydCsweDE1NC8weDU0OA0KPiBbYzE3MTdkNTBdIFtjMDM2ODEzY10ga2FzYW5fcmVwb3J0KzB4
ZDAvMHgxNjANCj4gW2MxNzE3ZGIwXSBbYzAzNjliYjRdIGthc2FuX2NoZWNrX3JhbmdlKzB4MWM4
LzB4MzA4DQo+IFtjMTcxN2RjMF0gW2MwMzZhZTg4XSBtZW1zZXQrMHgzNC8weDkwDQo+IFtjMTcx
N2RlMF0gW2MwMzViNmUwXSBfX2tlcm5lbF9wb2lzb25fcGFnZXMrMHg2Yy8weGQwDQo+IFtjMTcx
N2UwMF0gW2MwMzM1NWU0XSBfX2ZyZWVfcGFnZXNfb2srMHg0MTgvMHg1MDANCj4gW2MxNzE3ZTYw
XSBbYzE0MzcyYzhdIG1lbWJsb2NrX2ZyZWVfYWxsKzB4MjY4LzB4NDAwDQo+IFtjMTcxN2YyMF0g
W2MxNDEwM2ZjXSBtZW1faW5pdCsweDhjLzB4Mjc0DQo+IFtjMTcxN2Y2MF0gW2MxNDMxY2QwXSBt
bV9jb3JlX2luaXQrMHgyNDAvMHg0ZTANCj4gW2MxNzE3ZmMwXSBbYzE0MDQ2OTRdIHN0YXJ0X2tl
cm5lbCsweDE1MC8weDJkOA0KPiBbYzE3MTdmMDBdIFswMDAwMzVkMF0gMHgzNWQwDQo+IA0KPiBU
aGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRvIHRoZSBwaHlzaWNhbCBwYWdlOg0KPiBwYWdlOihw
dHJ2YWwpIHJlZmNvdW50OjAgbWFwY291bnQ6MCBtYXBwaW5nOjAwMDAwMDAwIGluZGV4OjB4MCBw
Zm46MHgxN2E3DQo+IGZsYWdzOiAweDAoem9uZT0wKQ0KPiBwYWdlX3R5cGU6IDB4ZmZmZmZmZmYo
KQ0KPiByYXc6IDAwMDAwMDAwIGVlZTE1MzgwIGVlZTE1MzgwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIGZmZmZmZmZmIDAwMDAwMDAwDQo+IHJhdzogMDAwMDAwMDANCj4gcGFnZSBkdW1wZWQg
YmVjYXVzZToga2FzYW46IGJhZCBhY2Nlc3MgZGV0ZWN0ZWQNCj4gDQo+IE1lbW9yeSBzdGF0ZSBh
cm91bmQgdGhlIGJ1Z2d5IGFkZHJlc3M6DQo+ICAgYzE3YTdkMDA6IDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+ICAgYzE3YTdkODA6IDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+PiBjMTdhN2UwMDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZjEgZjENCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAgIGMxN2E3ZTgw
OiBmMSBmMSAwNCBmMiAwNCBmMiAwMCBmMyBmMyBmMyAwMCAwMCAwMCAwMCAwMCAwMA0KPiAgIGMx
N2E3ZjAwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0K
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gRGlzYWJsaW5nIGxvY2sgZGVidWdnaW5nIGR1ZSB0byBrZXJuZWwgdGFp
bnQNCj4gDQo+PiBJJ2QgYWxzbyBiZSBjdXJpb3VzIHRvIGtub3cgd2hhdCBoYXBwZW5zIHdoZW4g
Q09ORklHX0RFQlVHX1NQSU5MT0NLIGlzDQo+PiBkaXNhYmxlZC4NCj4gDQo+IERpc2FibGluZyBD
T05GSUdfREVCVUdfU1BJTkxPQ0sgZG9lcyBub3QgY2hhbmdlIHRoZSBvdXRwdXQgYWJvdmUuIF5e
DQo+IA0KPj4gQW5vdGhlciBxdWVzdGlvbiB3aGljaCBJJ20gbm8gc3VyZSBJIGFza2VkIGFscmVh
ZHk6IElzIGl0IGEgbmV3IHByb2JsZW0NCj4+IHlvdSBoYXZlIGdvdCB3aXRoIHJlY2VudCBrZXJu
ZWxzIG9yIGlzIGl0IGp1c3QgdGhhdCB5b3UgbmV2ZXIgdHJpZWQgc3VjaA0KPj4gYSBjb25maWcg
d2l0aCBvbGRlciBrZXJuZWxzID8NCj4gDQo+IEkgd2FudGVkIHRvIHJldmlzaXQgaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTYwNDEgYW5kIHZlcmlmeSB3aGV0
aGVyIGl0IHdhcyByZXNvbHZlZC4gS0FTQU4gd29ya2VkIGFyb3VuZCAyMDE5LTIwMjEgb24gbXkg
RzQgYXMgSSByZXBvcnRlZCBzb21lIGJ1Z3Mgd2l0aCBpdCBhcm91bmQgdGhhdCB0aW1lIGFuZCB5
b3UgZml4ZWQgc29tZSBvZiB0aGUgYnVncy4gOykgTGlrZSBrZXJuZWwgYnVnemlsbGEgIzIwNTA5
OSwgIzIxNjE5MCwgIzIwNTg4NS4NCj4gDQo+IEJ1dCBpdCBhbHdheXMgc2VlbWVkIGZsYWt5IG9u
IHRoZSBHNCBhbmQgaGFkIGl0J3MgcHJvYmxlbXMuIFNvIEkgY2FuJ3QgdGVsbCB3aGV0aGVyIHRo
aXMgc3BlY2lmaWMgaXNzdWUgd2FzIHRoZXJlIGJhY2sgdGhlbiBvciBpZiBpdCdzIG5ldy4gQXQg
bGVhc3QgYnVnICMyMTYxOTAgd2FzIGFsc28gYWJvdXQgS0FTQU4gYW5kIFNNUCBpc3N1ZXMuDQo+
IA0KPj4gQWxzbywgd2hlbiB5b3Ugc2F5IHlvdSBuZWVkIHRvIHN0YXJ0IHdpdGggYW5vdGhlciBT
TVAga2VybmVsIGZpcnN0IGFuZA0KPj4gdGhlbiB5b3UgZG9uJ3QgaGF2ZSB0aGUgcHJvYmxlbSBh
bnltb3JlIHVudGlsIHRoZSBuZXh0IGNvbGQgcmVib290LCBkbw0KPj4geW91IG1lYW4geW91IGhh
dmUgc29tZSBvbGQga2VybmVsIHdpdGggS0FTQU4gdGhhdCB3b3Jrcywgb3IgaXMgaXQgYQ0KPj4g
a2VybmVsIHdpdGhvdXQgS0FTQU4gdGhhdCB5b3UgaGF2ZSB0byBzdGFydCBmaXJzdCA/DQo+IA0K
PiBGaXJzdC4gSSBzdGFydCB3aXRoIGEgbm9uLUtBU0FOIFNNUCBrZXJuZWwgYW5kIGFmdGVyd2Fy
ZHMgcmVib290IGludG8gYSBLQVNBTiBrZXJuZWwuIEJ1dCBub3cgd2l0aCBrYXNhbl9pbml0KCkg
Y29tbWVudGVkLW91dCBpbiBzdGFydCBvZiBzZXR1cF9hcmNoKCkgaW4gYXJjaC9wb3dlcnBjL2tl
cm5lbC9zZXR1cC1jb21tb24uYyB0aGlzIGRvZXMgbm90IHdvcmsgYW55bW9yZS4gSSBnZXQgdGhl
IGRtZXNnIGFib3ZlIGFsbCB0aGUgdGltZSwgYXQgY29sZCBhbmQgd2FybSBib290cy4NCj4gDQo+
IFJlZ2FyZHMsDQo+IEVyaGFyZA0K
