Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29927532B5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 15:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6wCc04FDz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 23:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6wC55FJWz3bZC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 23:33:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki+3ekmiJ4aDdPfPL19LxgzsmF4hi2KChIHP/tdfIIqaPd9IiBCVi18a2P2/6AZEfIkw9AQA+137SKuZKFGBVpSxcJ65UCZxdlKdOXDInXHXoff8BA3p/Bt6yf7UQjEquBxGLnHF6sj1Nf/wrKtyzU6m3YO2LNvhXdRBpz3wcV7C1VgJ5hahCHwanVP4njjDttcJvRg1g3vCL9w+t3QWlIM3GXjuD2LwOyhNuVVqCazrdBdOgPYb6qPWWCfxxrj/Kpl2reZ2LZwIaEAZb6vxE7Ajz1sDh4iahBtalW7fKE5fHScgZj0BHqEdtiNPpgEzNpjxLhvbdjMZXpCEKZbtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcQEbv02+5hL2u5xd8KJhUcrq0mk8qQNeEQpmI737fY=;
 b=Rig7PSGTAdaagB3Xn3A2LUdp1wFmYWRfhpHO7cdXNy8WBcRkRkDH79RfbRhTHW2PJIcg7HiZgWou/+SZ/TO0Rr4Kn1wh6oqxj23fVy4oQA4ucmCxpSb/GwoYo8ywBd6zw8bi2kv4/rVsu2LQQvjSc5fJHvY+4KkE4y8d2O9dwcjGOU8Od1HLjLY8OjghXZTLDqUWvlo5IccFsh1+tDEGXlaLHrx89cXtsXwZiMFF1al6eRjARDEEQU9izoQk6w/B/PzRRNsewmLd38OO0lG3b6OI23uJhwY9Z1l0P5Nt+9wE2i7yyIgwOmPZBeyHZm2toCMPvN94/wOaXbaNSvOYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2372.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 13:33:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 13:33:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHYbs5qyDK6/X7ZxEy6GUPocR2PqK0txaCAgAAXpYCAACrWAA==
Date: Tue, 24 May 2022 13:33:33 +0000
Message-ID: <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
 <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
In-Reply-To: <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c044f5a5-65e4-4798-315d-08da3d89fff1
x-ms-traffictypediagnostic: MR1P264MB2372:EE_
x-microsoft-antispam-prvs: <MR1P264MB2372D54697B66A335B0F5678EDD79@MR1P264MB2372.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CHBrD/4ilJvyQ1EB827wsIqPF2KtH1yBSh/Lr4eecZyrz9GTE67s7jOoSfDZj0kc2EPSI0tjZRCUWIEsQA7/qq04YTUT3XFSJpEhmMZIM+lOKCRJ7q0wDTxGkCS4VhnuE5ijaEnCal2bXgVJ6l7yOqDPc4Trowl19cbMOmA11xku4a+e32S93oLsxJxFjQPonZxsVkbO/PF4O1MSefUrseqHo6PvS3toHXgWLO0hJbvosVgnoJcyM1mqwfWAfIoTyqxSTv80bmEzNxmxmSFuRNTo7DnVTGnxbUBcbcM8KpeXezPbEhXzXWZIklOP8P9dgwplIiKUV9wOpgkHWpoMn6YdV6quJSTeB+D2cELwSs5xioGRN+tY95S/jxRCoaSaKttbvj0mrHrKmys+g5vapRkrIkgY+AN04PUVlvP1IINJvD7TvRa+J+Gg7jnhUypOU94intPp2FvbmgdFq4blaAOGOSYlb6FB4mJs8X87eMEuMEu2fQBAdW/q4G4Yi9B/Q/8M6JW5XINRBOUSpj861wxhoYiEA7itDBRVWUHs882OvBo2dhnHuRTU/CixVQWpp+fbljGTAibW6/RRrnfGbi6vNQtrvqAKyLVo3KlLkr6P0LqV2XM8vS+1cZD9Bhkr82tjHzIarqsJeN/9zKwhlL8zyWRhiGyQ+x+R/yHswZIXZvlGC16Gy0PJaa2lUPwLkj5LEmio3eY1st1u/Qzvx+fli2rTvxa2l/DgDJZZdDZYe4sH2M+LUDT7gIr9ictDBE5B6vGSw+BhAcHgg2iOXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(6486002)(6916009)(316002)(54906003)(66574015)(966005)(83380400001)(2906002)(4326008)(8676002)(8936002)(5660300002)(31686004)(36756003)(66946007)(44832011)(64756008)(66446008)(66476007)(66556008)(7416002)(122000001)(6506007)(6512007)(53546011)(38100700002)(186003)(2616005)(31696002)(86362001)(91956017)(38070700005)(26005)(71200400001)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFJ5K2JsakFqQm8yRzV0SHhXN2ZMekw4clQ0TkhBem01U0MyWHZ2LzB4eDY4?=
 =?utf-8?B?c29Lbmp5UFRBc1pSRDZSajlYMkVlazFNRnA5Mko5WUg1SW5tMUlYUGVFUTJl?=
 =?utf-8?B?THNxZmZhQy9tSjAzMlhXWkZYeXh6clNBSktVUkptTWJ0N21NREVaTkhQSVRx?=
 =?utf-8?B?a3lPNGIxcnZXSktNRlpXckpiY0xJOHdEV29HRVhBeTBLTkkvY0hwanNWQWRo?=
 =?utf-8?B?K0VUU2lBYTd2UEdmdHlRSjUxNnlTMzhQbEtGWjYwTldhc2RpQzE2ZEd2cjc0?=
 =?utf-8?B?c241UzFJM24wMjFWY1pCMHV0c1pMdUdoejlMUWFvWnoxWHNPZXBsMWE0aXo0?=
 =?utf-8?B?R2hteFpIUHNTL1QrQjU0cnZQSzlwWVVFdDJ3SFZGcmhpeFlUb29vR0Y5QTJk?=
 =?utf-8?B?eTlxR2Q4blRhRzBvMTBwZ25kd0kwMVlpY0FRRlVLZ3hXV2d3Ly9tV3dSYlNm?=
 =?utf-8?B?Q2Mzd1N3a1REQWNyUUE2dDZaWTVtaXRXdWh0M2EwUk1RS2EzZ2hQdHhJRDdN?=
 =?utf-8?B?UFEyN0lQOXdpVHF1ZmVOR3pvRjEwRlp4dFNBYWQ5cTJZeEtVOHd0a1lWZjlu?=
 =?utf-8?B?YUxHc3h1NjMzVkRycXhrR0JBNnFwbldZWVFqMlIvZENEZ1BaKzdaWVhpWWIy?=
 =?utf-8?B?UlQ3K2M2QXRsQ09Panc4cnFkWkIrbzNheE11c25Hc3JBRHVSa2NXbzZBUUpw?=
 =?utf-8?B?NmFCalFIU2thV05lWlJsTitIMGFFUGZqeWxyZHBlNWpWOEdLSGtoVkFMQWto?=
 =?utf-8?B?bHhRT2dMUUFNV2gxSk1xbUNOT2pwOTRONkM3dUpaajFoZ3F1ajhJYUVwbXg3?=
 =?utf-8?B?ZkhRNXVtWTZ2WkpwQU5JLzRUU01sMERrUlVsa3RCTERwVm1jbnBrcmVrdldH?=
 =?utf-8?B?R0tiS0F3RERmUUNRQk4wOEYrRUxDS2F3cURyalZGOHlvR20rRUIweS9SdFVv?=
 =?utf-8?B?K0lnTW0yMXBVYnlqNWsycEJwWGhPb3VLRWs2Z0t6Q1VVYWtIWGRuY3NMcUFm?=
 =?utf-8?B?ak1wWmFpMlNBUzN2a05EekNqYjczQVVYRGEzOU4xdzdkcHdsUXg4WFNNdEFI?=
 =?utf-8?B?SWhvOFVLam5TSjc0S05EdmNUVUM1MTA1eEFYR0UzOEpLSTJiaXdtYUJGODEv?=
 =?utf-8?B?blBOVkFiUlVkekdqVnl0Q2JBNHgrbUdtM205WFQxNlh5aHhqSDJRdnZzWGdt?=
 =?utf-8?B?alhvcTc2L2I3NmQ4Rzl6cmF0N3Vsb1Z5Z2RHYzdHSzhObjY0eklXeEJOUGtI?=
 =?utf-8?B?WTB2aUV1a3R1MjNVaTVJd21EYnZXdWoxckZBalZLRFdaa2Z0Q3NtSVF0VXVh?=
 =?utf-8?B?Q2diZ1J1dEpvY0t1RHViNkF1cnJlTmtBdk8zUVRuREJzbGxQblVScHJDUjJH?=
 =?utf-8?B?N2ZDMlRjWHBsSFZkRDhvZFpZSU8rdHBKZk5OT0RZU1gwTnhmZ0xzSmxpNjNT?=
 =?utf-8?B?SHhYOVlPcitCOU8yaEtFbUQ5Vk9abFJoMk1UenU2eDJVSGE2UXhZeWZETFNK?=
 =?utf-8?B?TE5ka2dQUGhIWEdnNXY2Mnp4dHhhNmw4NElwYTlzcmVDU3Bxc2M2VTBmNW8z?=
 =?utf-8?B?Q0tDK0hWeU5IbVlnNkMyVi9jVUtoZU9mc3l6N1ZiTDRLbUZZUTYwRUgzU3o3?=
 =?utf-8?B?cU9HSHhxcmJRRjBMbWtkMEViaUc5ZkJlVnYrTExDd2hzNWNscjZFWGxPbitk?=
 =?utf-8?B?ZjMrd1BIc3NUM2xoUDVXZGhrYitKUFllZ0FrY0hFZlVRcUFqMk5NT0dhVVpC?=
 =?utf-8?B?MXNXN2dIS285dlMvVmhzMjkxejdaZUFSaGtFdlZiWk1xWWsyc1p4Z1VNQkxG?=
 =?utf-8?B?cTdoNzEwd0ppTGZ1T0xqa3JQbXNKcVpTa29ObE1tRFNFR09pTnprWGJiR0M1?=
 =?utf-8?B?eEV2YkxPWVRMVzJuang3NUZSaTVmUU52Nk5xUTJqOXpCdXN3ekc5aGRZUE5L?=
 =?utf-8?B?WGNVY2tLamRLT3pPcDZkb1pJMnVzQW8xMUtka0pOcWdKdlBieWJOVWxmUzkv?=
 =?utf-8?B?YzhvODE2d0taMDNMRHE4T0NMdGdPc01TeGFIREw2SmNqSmF0Ym45OEQyOFgx?=
 =?utf-8?B?c0hXcm9vWEg3aXJxS3JTd3U0OUtWSlI4YktLb3BDb25iNE9OSGw2emtQZ3Bv?=
 =?utf-8?B?dXdia3N4a0pJNGRCTG5mcU51S25lVjRnMnZIU0VnaHBhcVllTFF3OGJTanhQ?=
 =?utf-8?B?TWlPeFc1RkZubjZmSUprSXdyeTNIdnhtNWdWK3dGbWpmRHFpbXUzMGZBRTRi?=
 =?utf-8?B?UkY1aXZyN0hJeUhWeDdlU2E2ZENvaTJDOUc3eXBHODRQbzgwRmw3ZGViV0lD?=
 =?utf-8?B?dC92NlNLenI1QWFDTEZxQWdGbTF3cUxqWkJZWWxMNlFKMEQyc2tzd1dOTUZO?=
 =?utf-8?Q?znNsl8Kt7eVZBv+HAkeGXQiAHUONfWCVfkA09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F6E77EFA7FC214D89721BB7B935A04A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c044f5a5-65e4-4798-315d-08da3d89fff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 13:33:33.9689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lud42bMwQUO7S9cW29oqQ0ySLZ3QiyvEaF0UgZ219kR7+9H8T9o7lfFyccJZFVMFTXW03g5A2do9eRgvmLIq3EMrPdQA1cepaeqP03ZAO6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2372
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA1LzIwMjIgw6AgMTM6MDAsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBsYSBwYXJ0
IGRlIA0KPiBzdkBsaW51eC52bmV0LmlibS5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2VsYSBw
ZXV0IMOqdHJlIGltcG9ydGFudCDDoCANCj4gbOKAmWFkcmVzc2UgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uLl0NCj4gDQo+IE9uIDI0LzA1LzIyIDE1OjA1LCBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IExlIDIzLzA1LzIwMjIgw6AgMTk6NTUsIFNh
dGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdCA6DQo+Pj4gVGhpcyBwYXRjaCBlbmFibGVzIG9ianRv
b2wgLS1tY291bnQgb24gcG93ZXJwYywgYW5kDQo+Pj4gYWRkcyBpbXBsZW1lbnRhdGlvbiBzcGVj
aWZpYyB0byBwb3dlcnBjLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJl
ZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPj4+IC0tLQ0KPj4+IMKgwqAgYXJjaC9wb3dlcnBjL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4+IMKgwqAgdG9v
bHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMgfCAxNCArKysrKysrKysrKysrKw0KPj4+
IMKgwqAgdG9vbHMvb2JqdG9vbC9jaGVjay5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDEyICsrKysrKystLS0tLQ0KPj4+IMKgwqAgdG9vbHMvb2JqdG9vbC9lbGYuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysrKysrKysrKw0KPj4+IMKgwqAgdG9vbHMv
b2JqdG9vbC9pbmNsdWRlL29ianRvb2wvZWxmLmggfMKgIDEgKw0KPj4+IMKgwqAgNSBmaWxlcyBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+PiBp
bmRleCA3MzJhM2Y5MWVlNWUuLjMzNzNkNDRhMTI5OCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+Pj4gQEAgLTIz
Myw2ICsyMzMsNyBAQCBjb25maWcgUFBDDQo+Pj4gwqDCoMKgwqAgc2VsZWN0IEhBVkVfTk1JwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIFBFUkZfRVZF
TlRTIHx8IChQUEM2NCANCj4+PiAmJiBQUENfQk9PSzNTKQ0KPj4+IMKgwqDCoMKgIHNlbGVjdCBI
QVZFX09QVFBST0JFUw0KPj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX09CSlRPT0zCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIFBQQzY0DQo+Pj4gK8KgwqDCoCBzZWxl
Y3QgSEFWRV9PQkpUT09MX01DT1VOVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIEhBVkVf
T0JKVE9PTA0KPj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTDQo+Pj4gwqDCoMKg
wqAgc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFNfTk1JwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IFBQQzY0DQo+Pj4gwqDCoMKgwqAgc2VsZWN0IEhBVkVfUEVSRl9SRUdTDQo+Pj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5jIA0KPj4+IGIvdG9vbHMvb2Jq
dG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMNCj4+PiBpbmRleCBlM2I3N2E2Y2UzNTcuLmFkM2Q3
OWZmZmFjMiAxMDA2NDQNCj4+PiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNv
ZGUuYw0KPj4+ICsrKyBiL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5jDQo+Pj4g
QEAgLTQwLDEyICs0MCwyNiBAQCBpbnQgYXJjaF9kZWNvZGVfaW5zdHJ1Y3Rpb24oc3RydWN0IG9i
anRvb2xfZmlsZSANCj4+PiAqZmlsZSwgY29uc3Qgc3RydWN0IHNlY3Rpb24gKnNlYw0KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbGlz
dF9oZWFkICpvcHNfbGlzdCkNCj4+PiDCoMKgIHsNCj4+PiDCoMKgwqDCoCB1MzIgaW5zbjsNCj4+
PiArwqDCoMKgIHVuc2lnbmVkIGludCBvcGNvZGU7DQo+Pj4NCj4+PiDCoMKgwqDCoCAqaW1tZWRp
YXRlID0gMDsNCj4+PiDCoMKgwqDCoCBtZW1jcHkoJmluc24sIHNlYy0+ZGF0YS0+ZF9idWYrb2Zm
c2V0LCA0KTsNCj4+PiDCoMKgwqDCoCAqbGVuID0gNDsNCj4+PiDCoMKgwqDCoCAqdHlwZSA9IElO
U05fT1RIRVI7DQo+Pj4NCj4+PiArwqDCoMKgIG9wY29kZSA9IChpbnNuID4+IDI2KTsNCj4+IFlv
dSBkb250IG5lZWQgdGhlIGJyYWNrZXRzIGhlcmUuDQo+Pg0KPj4+ICsNCj4+PiArwqDCoMKgIHN3
aXRjaCAob3Bjb2RlKSB7DQo+Pj4gK8KgwqDCoCBjYXNlIDE4OiAvKiBibCAqLw0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICgoaW5zbiAmIDMpID09IDEpIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnR5cGUgPSBJTlNOX0NBTEw7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICppbW1lZGlhdGUgPSBpbnNuICYg
MHgzZmZmZmZjOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoKmltbWVkaWF0ZSAmIDB4MjAwMDAwMCkNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICppbW1lZGlhdGUgLT0gMHg0MDAwMDAwOw0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsNCj4+PiArwqDCoMKgIH0NCj4+PiArDQo+Pj4gwqDCoMKgwqAgcmV0dXJuIDA7DQo+
Pj4gwqDCoCB9DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jIGIv
dG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4gaW5kZXggMDU2MzAyZDU4ZTIzLi5mZDhiYWQwOTJm
ODkgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4gKysrIGIvdG9v
bHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4gQEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgaW50IGNy
ZWF0ZV9tY291bnRfbG9jX3NlY3Rpb25zKHN0cnVjdCANCj4+PiBvYmp0b29sX2ZpbGUgKmZpbGUp
DQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVsZl9hZGRfcmVsb2NfdG9f
aW5zbihmaWxlLT5lbGYsIHNlYywNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlkeCAqIHNpemVv
Zih1bnNpZ25lZCBsb25nKSwNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUl9YODZfNjRfNjQsDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsZl9yZWxvY190eXBlX2xvbmcoZmlsZS0+ZWxmKSwNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluc24tPnNlYywgaW5zbi0+b2Zmc2V0KSkNCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsNCj4+Pg0KPj4+
IEBAIC0yMTgzLDcgKzIxODMsNyBAQCBzdGF0aWMgaW50IGNsYXNzaWZ5X3N5bWJvbHMoc3RydWN0
IG9ianRvb2xfZmlsZSANCj4+PiAqZmlsZSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChhcmNoX2lzX3JldHBvbGluZShmdW5jKSkNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmdW5jLT5y
ZXRwb2xpbmVfdGh1bmsgPSB0cnVlOw0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghc3RyY21wKGZ1bmMtPm5hbWUsICJfX2ZlbnRyeV9fIikpDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgoIXN0cmNtcChm
dW5jLT5uYW1lLCAiX19mZW50cnlfXyIpKSB8fCANCj4+PiAoIXN0cmNtcChmdW5jLT5uYW1lLCAi
X21jb3VudCIpKSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmdW5jLT5mZW50cnkgPSB0cnVlOw0KPj4+DQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaXNfcHJvZmlsaW5nX2Z1bmMoZnVu
Yy0+bmFtZSkpDQo+Pj4gQEAgLTIyNTksOSArMjI1OSwxMSBAQCBzdGF0aWMgaW50IGRlY29kZV9z
ZWN0aW9ucyhzdHJ1Y3Qgb2JqdG9vbF9maWxlIA0KPj4+ICpmaWxlKQ0KPj4+IMKgwqDCoMKgwqAg
KiBNdXN0IGJlIGJlZm9yZSBhZGRfanVtcF9kZXN0aW5hdGlvbnMoKSwgd2hpY2ggZGVwZW5kcyBv
biAnZnVuYycNCj4+PiDCoMKgwqDCoMKgICogYmVpbmcgc2V0IGZvciBhbHRlcm5hdGl2ZXMsIHRv
IGVuYWJsZSBwcm9wZXIgc2libGluZyBjYWxsIA0KPj4+IGRldGVjdGlvbi4NCj4+PiDCoMKgwqDC
oMKgICovDQo+Pj4gLcKgwqDCoCByZXQgPSBhZGRfc3BlY2lhbF9zZWN0aW9uX2FsdHMoZmlsZSk7
DQo+Pj4gLcKgwqDCoCBpZiAocmV0KQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7DQo+Pj4gK8KgwqDCoCBpZiAob3B0cy5zdGFja3ZhbCB8fCBvcHRzLm9yYyB8fCBvcHRz
LnVhY2Nlc3MgfHwgb3B0cy5ub2luc3RyKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0ID0gYWRkX3NwZWNpYWxfc2VjdGlvbl9hbHRzKGZpbGUpOw0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7DQo+Pj4gK8KgwqDCoCB9DQo+PiBJIHRoaW5rIHRoaXMgY2hhbmdl
IHNob3VsZCBiZSBhIHBhdGNoIGJ5IGl0c2VsZiwgaXQncyBub3QgcmVsYXRlZCB0bw0KPj4gcG93
ZXJwYy4NCj4gTWFrZXMgc2Vuc2UuIEknbGwgbWFrZSB0aGlzIGEgc2VwYXJhdGUgcGF0Y2ggaW4g
dGhlIG5leHQgcmV2aXNpb24uDQoNCkdyZWF0LiBDYW4geW91IGJhc2UgeW91ciBuZXh0IHJldmlz
aW9uIG9uIHRoZSBvbmUgSSBqdXN0IHNlbnQgb3V0ID8NCg0KSSB3aWxsIG5vdyBzdGFydCBsb29r
aW5nIGF0IGlubGluZSBzdGF0aWMgY2FsbHMgZm9yIFBQQzMyLg0KDQo+Pg0KPj4+DQo+Pj4gwqDC
oMKgwqAgcmV0ID0gYWRkX2p1bXBfZGVzdGluYXRpb25zKGZpbGUpOw0KPj4+IMKgwqDCoMKgIGlm
IChyZXQpDQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvZWxmLmMgYi90b29scy9vYmp0
b29sL2VsZi5jDQo+Pj4gaW5kZXggYzI1ZTk1N2MxZTUyLi45NTc2MzA2MGQ1NTEgMTAwNjQ0DQo+
Pj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9lbGYuYw0KPj4+ICsrKyBiL3Rvb2xzL29ianRvb2wvZWxm
LmMNCj4+PiBAQCAtNzkzLDYgKzc5MywxOSBAQCBlbGZfY3JlYXRlX3NlY3Rpb25fc3ltYm9sKHN0
cnVjdCBlbGYgKmVsZiwgDQo+Pj4gc3RydWN0IHNlY3Rpb24gKnNlYykNCj4+PiDCoMKgwqDCoCBy
ZXR1cm4gc3ltOw0KPj4+IMKgwqAgfQ0KPj4+DQo+Pj4gK2ludCBlbGZfcmVsb2NfdHlwZV9sb25n
KHN0cnVjdCBlbGYgKmVsZikNCj4+IE5vdCBzdXJlIGl0J3MgYSBnb29kIG5hbWUsIGJlY2F1c2Ug
Zm9yIDMyIGJpdHMgd2UgaGF2ZSB0byB1c2UgJ2ludCcuDQo+IFN1cmUsIEknbGwgcmVuYW1lIGl0
IHRvIGVsZl9yZWxvY190eXBlKCkgb3Igc29tZSBzdWNoLg0KPj4NCj4+PiArew0KPj4+ICvCoMKg
wqAgc3dpdGNoIChlbGYtPmVoZHIuZV9tYWNoaW5lKSB7DQo+Pj4gK8KgwqDCoCBjYXNlIEVNX1g4
Nl82NDoNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUl9YODZfNjRfNjQ7DQo+
Pj4gK8KgwqDCoCBjYXNlIEVNX1BQQzY0Og0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBSX1BQQzY0X0FERFI2NDsNCj4+PiArwqDCoMKgIGRlZmF1bHQ6DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgV0FSTigidW5rbm93biBtYWNoaW5lLi4uIik7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZXhpdCgtMSk7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4gK30NCj4+IFdvdWxk
bid0IGl0IGJlIGJldHRlciB0byBtYWtlIHRoYXQgZnVuY3Rpb24gYXJjaCBzcGVjaWZpYyA/DQo+
IA0KPiBUaGlzIGlzIHNvIHRoYXQgd2UgY2FuIHN1cHBvcnQgY3Jvc3MgYXJjaGl0ZWN0dXJlIGJ1
aWxkcy4NCj4gDQoNCg0KSSdtIG5vdCBzdXJlIEkgZm9sbG93IHlvdSBoZXJlLg0KDQpUaGlzIGlz
IG9ubHkgYmFzZWQgb24gdGhlIHRhcmdldCwgaXQgZG9lc24ndCBkZXBlbmQgb24gdGhlIGJ1aWxk
IGhvc3Qgc28gDQpJIGNhbid0IHRoZSBsaW5rIHdpdGggY3Jvc3MgYXJjaCBidWlsZHMuDQoNClRo
ZSBzYW1lIGFzIHlvdSBoYXZlIGFyY2hfZGVjb2RlX2luc3RydWN0aW9uKCksIHlvdSBjb3VsZCBo
YXZlIA0KYXJjaF9lbGZfcmVsb2NfdHlwZV9sb25nKCkNCkl0IHdvdWxkIG1ha2Ugc2Vuc2UgaW5k
ZWVkLCBiZWNhdXNlIHRoZXJlIGlzIG5vIHBvaW50IGluIHN1cHBvcnRpbmcgWDg2IA0KcmVsb2Nh
dGlvbiB3aGVuIHlvdSBkb24ndCBzdXBwb3J0IFg4NiBpbnN0cnVjdGlvbiBkZWNvZGluZy4NCg0K
Q2hyaXN0b3BoZQ==
