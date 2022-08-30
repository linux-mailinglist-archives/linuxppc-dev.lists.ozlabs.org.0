Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CAF5A5BA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGxsl2zJyz3blw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:16:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=G3niwHiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.74; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=G3niwHiD;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120074.outbound.protection.outlook.com [40.107.12.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGxrz1yDSz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:16:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dcq8g1ZbQdYd+eGrveAzrkeS5t2pW09oaxS251dPlF8mS0oc76Zos8uSOcH/20olaRjYnmzB8nI7Azvlb+B/o05/zESVKBfXSLliJXPl9ZUTD1CffUTar7zce9FhUe4qbDZ2seyAwthQk8xfCwY8cFh7zacvoEcmG1HANApbLNDLaHLLfZ7tFGSeYP61fbKfHtkgYkJ5AbWEyS6uNpFDW1SDUh7djQiZXznf1mkadsWB9O4a+vQTL4st6ZwepTJtkQEbGhSD8HbI+8/NvaO4aRB4+vKK/WFYi6B6qrozHBV6e0qxxx+7DxcbkRAuIKleRyM03WmmD90xizyrI39zjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVbh8GXrAjW9GEYBIViyNzPZSRjmHoxYxh/neZKUi4U=;
 b=gQttMlonrqeKX3sUyRJU0exG/7G/ZsIPN92uJFrwMSoNGnsfwHLHfG76MvSTApZaNgWFq7OqQcUf/lUZDqemPNTqIum9cH0oxylG6/QJpkdtmpb80S07II7C2fjA9N/iL+KoZguDOINtMdAI+ANTDrpLcxnYIhFA2aPnvdp7yLZ0ZaYYeLEGyK+An9bvKxuB5/lEIs97sXIRdBQBhiBv0lQFTVV+Pn/8PNjFhAFjAOUx8tPaG4McDbNrw93ZbKxjF72ptJnu3FE31m2sUsorHKnyxmL3tC1IYNYiL0IISTwD/pMY42BGu7R6HfvFBQzrmgfb+/6HS+/6gdphdh39wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVbh8GXrAjW9GEYBIViyNzPZSRjmHoxYxh/neZKUi4U=;
 b=G3niwHiDWQVgQN1bP5AJFuVQ79fZ/XnHny5Ea3DUan/txk8tpgt4wydDeOvgJ+L2phbGWvnribUHUdJO/Jilxhp4kBsjImAcjpr6xMb2CHd4xZEDtI2YZnceXgPb17E73Bx5Phfh3ZkiGethR6RU4RrfIbzJD2Mbqt+kTPDWZPoebPsALMNTKXznj6fmyT9kWysmDJadaB1O8E/idkNiEE3Bq1awWm9LzKppCozg/elPvkntgP8tY3xzu8D+B1h92yPnVSmrad9AxYCv2FJqSQlQWwBmnZq02KpNlCw+sAlyXBxNsYlD2WvxkWJwy2PbVIzEuEyAdjQVQlLWtp+gTA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1943.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 06:16:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:15:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 01/16] powerpc: Replace unreachable() with it's builtin
 variant in __WARN_FLAGS()
Thread-Topic: [PATCH v2 01/16] powerpc: Replace unreachable() with it's
 builtin variant in __WARN_FLAGS()
Thread-Index: AQHYu2uQMVUOsBL9NUuVGsLDXPuRw63G+RkA
Date: Tue, 30 Aug 2022 06:15:59 +0000
Message-ID: <a3fc4685-9e8d-ebf6-62ca-2e9028753ce8@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-2-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-2-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b0cab4e-fb0b-49ba-e1e7-08da8a4f1bc5
x-ms-traffictypediagnostic: MRZP264MB1943:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VYS9zMiOkNmF3/af2XHE+BbpGuDHMRKKjK2IMvJCOaQkbLiq2hHtD+kGfMJIJsbCTbQFkmlb5UhuF7KwXa4B82AjgSG7rvJNyt253VXOcLVmfKO/0mYbK99ovo+4FHXdXHhlXIwjQWP3thE2SszbF4O6ko6g6Dda7iC2En8m/JuU7r6k/5w/t0IV3P0QTHly4rUr8qUbm9w2+9+7nMhuXNwRLn7mvvs8tNOaTnXoRlL8fTXbqQQ9LJoS36McGrJymWVMtv9nyv9Y4SDhdDjwS/xEZKQXrzMplZzVA0bA0RpKTu9rpNwJ6vrVlM+aYX83zvqouT1y5KQRlLFd9oruACeJ1MdPYCJLtteBak5xuOVMME5tw812xUFYWIXcq33tWwboFw8BicBo55t6AM66cGGd7Qs4ZvNeZZtJZIqpezlRWBimxEgOrM+k5j5VGnWx/6ridrVS8jprocnaB5+MVfvn+SVLCFposBl83jc4GftgzUNSqUIwh9JksQzxSxICqJgSFdsUyKOJUQykDFZuqZW6+vDD444LgonLA9izUZcYOycu2XWL6PmoB8PtZdNxqInglrWjMRAWPrAqJSd8TWemMPOUSeCjx4WT70Fdf3SiASgHJEizQFHmmv2cMmLiWOjY+KrnaC072IVK+Su7nBRdXGkGxteIOJ/0HS2hyavB9Z3EdCUkpDeYmpcud6wlDI9pFeaYNAYuwS65q87eBXw/GuEAJ5YPS8k9HPhi0wB91ysjk/eINjQxByLaK5A9NJJjTtHlPxVkhsudTef2mFed0qAJXwfNZo+tqywvumyU7bL301J99xwCkpHLPvA1dme2jsaA3tsOh13BWFuGpY1vJOYZ5BV1uRdImZ45cvc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(2616005)(66574015)(186003)(71200400001)(316002)(26005)(36756003)(44832011)(2906002)(31686004)(6512007)(83380400001)(6506007)(31696002)(38070700005)(122000001)(966005)(7416002)(478600001)(6486002)(8936002)(5660300002)(38100700002)(41300700001)(110136005)(86362001)(54906003)(66476007)(66446008)(4326008)(66556008)(76116006)(8676002)(64756008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L3p4czBMYkZwOC94L0FYb1d2ZXdoeWptQ0RsOHNpZUc4Qmk3WkNBNkpxT2lB?=
 =?utf-8?B?aXJEUmVkRVg3K0dYa2d6MWhoL2FBbUh0OVFmWjBlVjVYcUZFbVgvVmxSSTcz?=
 =?utf-8?B?ZlZXcUxMb3lPRzZoUFFsZld6M0x4ampMd3ZySEwwRlJMWU8raU9oUlNITUN6?=
 =?utf-8?B?c20yclJhZmV4Y2tjNnF1ODVHbkt1UTdKSXNCUHk2QzhjeVRJdm9WcTg1SzZV?=
 =?utf-8?B?b2c4OUlkY1ZoVTBGZzlVN3kwR2xXSjdQbW1TVmhLYlhuWTViQ21QbFNmV1A4?=
 =?utf-8?B?WkVMLzhBaXZwcmh4Wit5OEVEdGU1NWtjRkZSVThEWWJMQTNkZzdud2R5dHRE?=
 =?utf-8?B?bmhXbXlJUUJnS1RuWS9scDJzZlROWWxpcDY0K29iRHJaanVIb25kb3pPM2Zt?=
 =?utf-8?B?czZxeGxsVDk5RWR4RmJDMlpXRkQ1YWRWVFc4RXFUME5ONE05Ulhmd3BWQjBj?=
 =?utf-8?B?SkppQkdtQmJaNFBodk1PUGQrUGtlV3pXbHdlakFLM1k1aFFNeUhWcjBHaHdn?=
 =?utf-8?B?Nm0xeTdENlBTZ0lFK1V1c09XR1VBNmFSN0YzUVNSbkt2RHFWeGRZRGYzV04y?=
 =?utf-8?B?aEViSUV4eUcxOUNlY1EyNGNQdllmc0ZFc0ZGL2pZNVJpSlZEdXpFSFp6ZXRG?=
 =?utf-8?B?L3ZOdHhLaDlDZDNURVJpZzF5d2Uydk1pM1A3clQ0STVSQ0EybjBKVW5sK2ln?=
 =?utf-8?B?amtBZ0xwd1dxN2VQQ3c3M3FQQmtjd1BodEVMdFpZdFlzbkxSK3Z3bUJKdVEy?=
 =?utf-8?B?OEk4bDZtNHNhK29QdHVTSFNLSUhZdERzdXlvSS9DQmJsanRBcW5HTjZwQmly?=
 =?utf-8?B?cUlsZ082SW90endacXBmaXlpMzB5QndCUmtSdSt2a1RGc2ZCTng5T2Fyc2NG?=
 =?utf-8?B?Vy9xSVJiYzd6aFpTbmdIeG5xYTdScGdBeUtRbWN2dWJOWXpBVURQUWNzaEx6?=
 =?utf-8?B?eHhNa3F4MHArWE9DSitkejhvdkFMWHVrTUZlU1c3QVlkSzVlSkUvTUZQSWx0?=
 =?utf-8?B?cHlUeUE3YnRpVkFYdWRTLzVEak83TlExYlJWOFpFVlZPTUJXSytHalNWTktW?=
 =?utf-8?B?c3FrWmQ1TXRnTzArNGZWYU5RYmQ0RkRveTdtT2J2citEYkY4Q2M3RXh2KzVE?=
 =?utf-8?B?TzI5bHBxQnlSSnk3ZERzaXdsSGJCSU5mdnQzd3kvdm96YzQvL3RkSDVtTjNx?=
 =?utf-8?B?V2NhS2FGSjBYM1d4OW1rOWlNL2xKT2VrNVZIQmdTQmpwQlZUanhlODZqYWQr?=
 =?utf-8?B?Q2VSMHV0VHRUeVJ4c2d1dmpqSFd6K3hlOGxNS0d1ZitmVTZhR1U2UFViYU1Z?=
 =?utf-8?B?WE81MGR0K1p6Um9rZC8rNXNFeEN0ZXJKUzZxeFRNRllrdGcyT1k4akR4dm1H?=
 =?utf-8?B?bElNUW1pSlZIcy9XUjNJWWVQWDVvRjd6RFJNQU9QeXBtWDBwQnFnQ0sveGVO?=
 =?utf-8?B?YUFTeHhLNTUvZWVBU2ZDMUIrVkpEYVRPMGpONklGcyt6Wnc1Qmt2WTZnQzJG?=
 =?utf-8?B?aFNmdmVIK3NmVlNQNDhMNERHMDFxWW95SWh6bm9obFkxclJrZWR5d050Wndl?=
 =?utf-8?B?MStwUk54cVFrM2lydjJ5ZjRIYUNCQitVUE54TlVBNWxsaWJpZVJMaTdVSWcx?=
 =?utf-8?B?T3FUcmpYdFQzSjVGZE5VYmlvVEdHNjhuSDlIb2JVakd0SGJqUHhtcHJOaEFX?=
 =?utf-8?B?dmxpUW0reDhqTUVISytIMVpoRkRNQ3dTTmM2SVdhVnJTRlVHU2hLZEU4ZHJP?=
 =?utf-8?B?TjZRSGU1dFo0S0h0UkhvOG1YNk5RdU9udzd1RW9LK0lEb3R2U21JdTVPanhi?=
 =?utf-8?B?b0haeDExUzhlSC85VytHR2o5ZTZ5WDZ3aEs0YS8ramlxc29DemdxN2FJLys5?=
 =?utf-8?B?QU1WcWx3VVQ3RlFHZW5DQW9SS29zbm56akV1RjR4MXpnbUpQVG1Ma28yMk51?=
 =?utf-8?B?VlZrak1JYnlReUVaVlBYcW9hUWV4bC90b0d5M0hTZXBKdTl4WVptcllNcXJo?=
 =?utf-8?B?TkVDejhYVmdldEhXZjJWL3NCUUxCTkd5djZhN3ZiRjRzdGN3Y2J2cTJwdXhY?=
 =?utf-8?B?eFZUSFQrZk1EMzVrc1hKSi9aZFBKbHpvMTA2SmsyTU1aYWorUmhUaDNSOXZi?=
 =?utf-8?B?VHBVenhVdWlITEV6V3ZYcGdzRldOL1BzdlRDWGpOQkxMYTh6OXRRSG1kQ2Zi?=
 =?utf-8?Q?Hstdwztn9KdJuUec5NU17eg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2171F12C5B8BC4F9D81FFE045B81BC7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0cab4e-fb0b-49ba-e1e7-08da8a4f1bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:15:59.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYoHl/v+Nw3X/SS5Wkj6b6ueGt2uaOzHqA/Of1krtjrbbddug/tH9VE3Uc8IZfm7gX8SdDTlG7YevrFK2caa82qg8bGTJtrhbFtHaEU682w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1943
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBvYmp0b29sIGlzIHRocm93aW5nICp1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxs
KiB3YXJuaW5ncyBpbg0KPiAuYyBmaWxlcyB3aXRoIGEgZmV3IGluc3RydWN0aW9ucyB0aGF0IGFy
ZSBtYXJrZWQgdW5yZWFjaGFibGUuIFRoZQ0KPiBwcm9ibGVtIGNvbWVzIGZyb20gdGhlIGFubm90
YXRlX3VucmVhY2hhYmxlKCkgbWFjcm8gdGhhdCBpcw0KPiBjYWxsZWQgYnkgdW5yZWFjaGFibGUo
KS4gVGhpcyBhbm5vdGF0aW9uIGlzIGFkZGluZyBhIGNhbGwgdG8gYQ0KPiBmdW5jdGlvbiB3aXRo
IHNpemUgMCwgYW5kIG9ianRvb2wgZG9lcyBub3QgYWRkIHN1Y2ggc3ltYm9scw0KPiB0byB0aGUg
cmJ0cmVlLiBEdWUgdG8gdGhpcyByZWFzb24sIGZpbmRfY2FsbF9kZXN0aW5hdGlvbigpIGZ1bmN0
aW9uDQo+IGlzIG5vdCBhYmxlIHRvIGZpbmQgdGhlIGRlc3RpbmF0aW9uIHN5bWJvbCBmb3IgdGhh
dCBjYWxsLg0KPiANCj4gV2l0aCB0aGUgYW5ub3RhdGlvbiAoYW5ub3RhdGVfdW5yZWFjaGFibGUo
KSksIGdjYyBzZWVtcyB0bw0KPiBnZW5lcmF0ZSBhICdibCcgdG8gdW5yZWFjaGFibGUgc3ltYm9s
IHdpdGggc2l6ZSAwLiBCdXQgd2l0aA0KPiB0aGUgYnVpbHRpbiB2YXJpYW50IG9mIHVucmVhY2hh
YmxlIChfX2J1aWx0aW5fdW5yZWFjaGFibGUoKSksDQo+IGdjYyBkb2VzIG5vdCBlbWl0IGNhbGxz
IHRvIHN1Y2ggc3ltYm9scyBhbmQgdGhlIHdhcm5pbmdzDQo+IGdvIGF3YXkuIEdpdmVuIHRoYXQg
dGhlIGNvZGVnZW4gcmVtYWlucyBzYW1lLCBhbmQgdGhhdA0KPiB0aGVyZSBhcmUgbm8gJ2JsJyBp
bnN0cnVjdGlvbnMgdG8gc3VjaCBzeW1ib2xzIGVtaXR0ZWQsIGZpeA0KPiB0aGVzZSB3YXJuaW5n
cyBieSByZXBsYWNpbmcgdW5yZWFjaGFibGUoKSB3aXRoIGl0J3MgYnVpbHRpbg0KPiB2YXJpYW50
IGluIF9fV0FSTl9GTEFHUygpLg0KDQpIb3cgY2FuIHlvdSBzYXkgdGhhdCB0aGUgY29kZWdlbiBy
ZW1haW5zIHRoZSBzYW1lIGlmIHdpdGggdGhlIG9yaWdpbmFsIA0KeW91IGdldCBzdGFsZSAnYmwn
IGluc3RydWN0aW9ucyBhbmQgd2l0aCB0aGUgYWx0ZXJuYXRpdmUgeW91IGRvbid0ID8NCg0KPiAN
Cj4gQWxzbywgYWRkIGJhcnJpZXJfYmVmb3JlX3VucmVhY2hhYmxlKCkgYmVmb3JlIF9fYnVpbHRp
bl91bnJlYWNoYWJsZSgpDQo+IHRvIHdvcmsgYXJvdW5kIGEgZ2NjIGJ1ZyBbMV0sIGZvciB0aGUg
cHJvYmxlbSByZXBvcnRlZCBhdCBbMl0uDQoNCkhlcmUgbXkgY29tbWVudCB3YXMgbm90IHJlbGF0
ZWQgdG8gdGhlIGdjYyBidWcgWzFdIGJ1dCB0byBnY2MgYnVnIA0KaHR0cHM6Ly9nY2MuZ251Lm9y
Zy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODIzNjUgLCB3aGljaCB3YXMgd29ya2VkIA0KYXJv
dW5kIGJ5IGNvbW1pdCAxNzNhM2VmZDNlZGIgKCJidWcuaDogd29yayBhcm91bmQgR0NDIFBSODIz
NjUgaW4gQlVHKCkiKQ0KDQpCeSBjaGFuY2UgaXQgYWxzbyBzb2x2ZSB0aGUgcHJvYmxlbSBbMV0g
YXMgeW91IG1lbnRpb24uDQoNCj4gDQo+IFsxXTogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxs
YS9zaG93X2J1Zy5jZ2k/aWQ9MTA2NzUxDQo+IFsyXTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MjIvOC8yNS80MTgNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhdGh2aWthIFZhc2lyZWRkeSA8c3ZA
bGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYnVnLmggfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
YnVnLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYnVnLmgNCj4gaW5kZXggNjFhNDczNjM1
NWMyLi5lZjQyYWRiNDRhYTMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9idWcuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYnVnLmgNCj4gQEAgLTk5
LDcgKzk5LDggQEANCj4gICAJX19sYWJlbF9fIF9fbGFiZWxfd2Fybl9vbjsJCQkJXA0KPiAgIAkJ
CQkJCQkJXA0KPiAgIAlXQVJOX0VOVFJZKCJ0d2kgMzEsIDAsIDAiLCBCVUdGTEFHX1dBUk5JTkcg
fCAoZmxhZ3MpLCBfX2xhYmVsX3dhcm5fb24pOyBcDQo+IC0JdW5yZWFjaGFibGUoKTsJCQkJCQlc
DQo+ICsJYmFycmllcl9iZWZvcmVfdW5yZWFjaGFibGUoKTsJCQkJXA0KPiArCV9fYnVpbHRpbl91
bnJlYWNoYWJsZSgpOwkJCQlcDQo+ICAgCQkJCQkJCQlcDQo+ICAgX19sYWJlbF93YXJuX29uOgkJ
CQkJCVwNCj4gICAJYnJlYWs7CQkJCQkJCVw=
