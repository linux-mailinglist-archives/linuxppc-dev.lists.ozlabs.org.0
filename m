Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07553489480
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 09:58:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXSQw5vYVz30hh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 19:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXSQQ1rtfz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 19:57:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqEEOI/l5EaE0b7boyM4Cjw+yR0BpNor2I7uuOKRQ6zrY2O/1sDZZXnlxsGEVrdiszLZ77AfRaDGTMwTtxnlYvytjN99XS8pwbFpJ/Z1wIBMPZfXmAoToURHYYnK6XAAFDzYH+jk9Ma31O/KLz2uSKWOJlHl4rNDrS0Pd+EhXxFYHk7Uy4vTALQlLMKAIgf8tmnPp0zSO7b3ekDAUIMZwAfr1Qp9IvmLHujzFVvd1aUTjhVpKEal2/CSnVtz1LX6hIT6D0trRLAemmcVlDWpdiDi8WTYVsyFXqHALfji0+WWi0zBK1w3csp86/ZvsPJeFKgDAHf2KpRbmlILIJ3wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkAlX05vLyMRxSul0WBZXrI0oFQzt21yJUXak/odUZ4=;
 b=Ak7lqfx3HxwsKc9a3pCLgB+dXmILLjNX0gzEld5lDNK5hPeB5TpFt5jtGMzF+ETWKOXIGXr3Dm1kwPNb0OUSbuyQglmlP1oOFsE7N886uJTwT4pG2ih7tP00O7tQUwqYM5HJjnWbItY/FrOFJe6Nc8oBwIjY79UpRVUpLCJ1n0iyjEUvzkNdSgV9vQZgd+3gNLVp0z9Zv4qW/ZdDWP7QkEgOJbn4BsRuYOGH/Ju6x826pQO7Ti1+5Z56wxdJ59hsLKBVJBgF+7YdQOgbXnBZu8YNeSxk/xmlLxe/cbkDawwZzfLQFwScrEeDmiM7DowvjMNwJOgfhEbYafDgWYUt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2874.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 08:57:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 08:57:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH 01/13] bpf: Guard against accessing NULL pt_regs in
 bpf_get_task_stack()
Thread-Topic: [PATCH 01/13] bpf: Guard against accessing NULL pt_regs in
 bpf_get_task_stack()
Thread-Index: AQHYAvL+psGc6dNHLUeF2kkMkz1C5axb+kcA
Date: Mon, 10 Jan 2022 08:57:26 +0000
Message-ID: <b10434ec-f2bc-44b0-0b0a-414bff75edd8@csgroup.eu>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d5ef83c361cc255494afd15ff1b4fb02a36e1dcf.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <d5ef83c361cc255494afd15ff1b4fb02a36e1dcf.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ac8b121-3f5f-44e1-0d6d-08d9d41739e8
x-ms-traffictypediagnostic: MRZP264MB2874:EE_
x-microsoft-antispam-prvs: <MRZP264MB28740537FC8060C0C2B97FC2ED509@MRZP264MB2874.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WNEDMfnVAiSdEwRVkCyOaGpSCj0ACXqMbvkmPR2b4cFclwqgJpdTpq2U4wz4ah73tCb2CYl4uMBuxyluoCk8fuh+tu1SFkeslFcVh3Hyv7Ye9JdoxEnqT36975SDSjiProm0olE/3jzlqks1Rey3Kb8BaXdy/KHOshDE1jeeyj2lWjWTJBJVRfqoiqnF8VX1grz4vnVmtNjVaSvwAEwMWMYhsn07aKg22n2vFT+zICBeLtmwpo1V6EOj66ASeTxawMAJ0XiZn9PAqm64zFvHv5zU3IUJcx2I/WMd3R3oGmsNsJcJmnOR8AVndOrr8fZOOCH3uVHqluEbnb4+JOdyCEukjw91TRYAeWC8qlLRvo7az54IMwLYnoHISyZAL0w65ulhtB6pv5YKx5ABUBhIGnQwm1B0xjl9CRKf/a8dlRP/xzZtHlK7wDIbshaoCvPI1n6ENNRRM0xvaVqelHbUeXDcLW4+TXWUMjLXWqW1aa6NZq+lw7SVYVeehlbZMQa8qq6xRF9Cs7f873sODdkVHeAQ+LDZktKs8HGtVV2aJBFeO/O6GpGPPmQyXa4lm5+/cC04gw2rnpx57ePMKsMh7WpBzf80juSavlBiOlEYLK1e2Awa7mZtkDpVoTvTFWcrUZfJl4oA481skF7N5JIniApaZYo6SWokAo5DRyyti4RagS7+SS76SYURd5AqaW4fZRQaxP/75IcyYxnelR9xfsC8v7YH5a1sZkv/osdZnP/AiEet2C8fW/Se95/fhehKEc/eV+wwvp2xZWisV/uCQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8676002)(4326008)(2616005)(8936002)(71200400001)(316002)(66446008)(86362001)(54906003)(5660300002)(91956017)(6486002)(6506007)(44832011)(186003)(26005)(31696002)(36756003)(76116006)(6512007)(38070700005)(31686004)(110136005)(508600001)(66476007)(66946007)(64756008)(66556008)(2906002)(7416002)(66574015)(38100700002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3NOcktLUWhmVVEzOWVEeXBpRWZqM29GZTFKcFZUcEhwb2JXMGJBRDhuc0hs?=
 =?utf-8?B?bEhsOGZ2NW9kSjduOXlvakNYRFlkbStmS2N0aWR4V1pNSXprMFRPc21IaW8v?=
 =?utf-8?B?THk0UDR3aU5yQThwK3ZuWXREVGgrWlp0RldrcUVQTndjU04raWo1UStpd0hs?=
 =?utf-8?B?WHR2Z2VRV2NxbFdsSlFxcVpVOUVmaUJkSVBGcUFiM0NDK2V4WWdZU0g3Y2xQ?=
 =?utf-8?B?MkpFL0dHaTNnaGVWckM0RVhKV2ZndmhMNnFNYkNPUGpETlEySzllN1hFVFFz?=
 =?utf-8?B?eVJwSEJpRVZxbWVmRVVJQkVNeUV3Wm5tZ2QyNXN6V2J6ZVZqbHpvWk1CeWkv?=
 =?utf-8?B?aXgxWVQ0MUtLQlFWc21McE90RkN0eTB2UGxxVkdLckZCcmVBRXpWak5XKzV1?=
 =?utf-8?B?K0xNZzdUcE5kQnJJTklUbmVLSHhoWWdIai9xQnk2WlJYK2RyaEt6ZXZDb3d3?=
 =?utf-8?B?clI4SEFhdlNJUURIcTZuREhGWW4vKzlpVVJhbXJrNHRTM0h0bFAxZG8zU0J1?=
 =?utf-8?B?VjE3NVRQNkZKTE5YRzY4RmtkY1h0ODNPcWkvaHhlemMyUk9kbDBpek52L3Zy?=
 =?utf-8?B?Z1RwMWMwWTBuYm5jN3Q5byt5RU9BQXNiZE53bWZjYXY2emJPMnBBZmNZM3Iw?=
 =?utf-8?B?aUVrcTNXMGtLYVFVcE9qWUhmaXk3Z3VqQ1VyV3V1MHA2dzFiYSszRjJoWFY4?=
 =?utf-8?B?TFZsR2o4T0xXSFZ1aGpCQnprMjMrZHVNZGFzOERXVm1Bb2dGdlhaQU9ReGEw?=
 =?utf-8?B?Tmo5b21ZaTZSUy9lQWV3Qk1UN2FtY3pkZW5aNHJwYXh5VldZZENRVC9jb0Rk?=
 =?utf-8?B?QTl1dVFSUDFyT1lMbzlTdk5TYUg2NXFoay9WTDJvQ1pvNGQ2UURvbnduWHJr?=
 =?utf-8?B?UUFWN0xZV3BqMnF3THdtc2tqVmVjR1AwNEp1T29qajloVy9sVkxpNlA5V2Nq?=
 =?utf-8?B?WWZpcHlKRTFOa0hBSlcvQVlaWTI4UE9aMlIyQTBxd2VoSW0yNFdBTVZZSVlr?=
 =?utf-8?B?dVkxSGU4R1c5YVAwRkp1dG5xQ1RtMmwzeGdEcW9Zei9TZGxqRnMvTGJQK2h0?=
 =?utf-8?B?Wk0wQ283UVV3amg3Y2NXVnU0MFVMRUF5cXIvVTV4UHFaeFdHRDlyNDdYV0xj?=
 =?utf-8?B?NFlpSStMdlJOTXh4Q3NOMHB3MHEwZzZTc0tnU1ZRRTJDbUUwV0hLNnQ4MnJh?=
 =?utf-8?B?VE1VbkY4dTMxZHpRUW5DRjlqOUg0YnpBdHh3TFJ5STNHRGZDM1pveDNybEFQ?=
 =?utf-8?B?K3hHR1FRQUNUeHdEMG9jbjA5ZmJna1c0OVlZSlZjL3RseThoVmcvOGV5TVZJ?=
 =?utf-8?B?ZHhKRDJVc2l5VThyUzlsaE84TFZEWWUyUkFsSFd0KzIvd05RZms2Z291MDhx?=
 =?utf-8?B?Qkl2bCt0RTBGVGhJRFR6Ny9HVWhqVGdDVm5nKzY1aTdZODVzMFFhb0llSnps?=
 =?utf-8?B?SHgrZ1pqUWFnNlNWM09KbythOGl0bnluSndxL2J0MWIvZWllZEg2VEdIZjBh?=
 =?utf-8?B?Y1dwTkQ2aXY3Myt6S3RYWjZyM056bytsRTR3eVhEQnpkbkkwMldpT0VacE53?=
 =?utf-8?B?dkxFZklwMk95Y1h6cUtEVHFSYy9mSHgwdVp5ODNCdWpRQnJFc1hWWWd0Qk9L?=
 =?utf-8?B?TS9BMytSRGREWWl2T3M0WHh1ZzBBdDI0VVFROUxralNvdldXbWV5WDc0U0sx?=
 =?utf-8?B?c1dULzBxYTF1SVdWekYxTzJzSFQvMTlyT2JoRXVWWDlwaXFuZTF0U3BDdE51?=
 =?utf-8?B?ZTF6M1E4RmlMWmhtSmg2dUI5aGFLTkx0b21RK29SSkVZbUJWU3hkd1UrK3pj?=
 =?utf-8?B?cVhaUW1OUDAybWVBVklROEpCeDE3LzByajN2VXdMczBRd29SWTE4TDUva0Q0?=
 =?utf-8?B?ZjJ3bXZ5YmVPMTJxc0xrR2pMVVkxeUpDK3lNMVdqNU9xeUJTd1dRUHNJQVpS?=
 =?utf-8?B?a0Z0amQyTHRLYjdudU9XaWtJZmtiNFY0ZHNheVByKzRwREU0RG5zTGwzYVA5?=
 =?utf-8?B?RzlZdklhSWJUemVJSnBOalQ1Q0FnZ2JjWXRhZHRISDZ5cjQ4bVlIcElobHVI?=
 =?utf-8?B?OUtKUVpaOXYxMzZ0T0dpcDhqWVRGNmlHZDF6QkU2QUY0ZTNMRlllNjBHZVp2?=
 =?utf-8?B?VVFURmJDN1lEZGdpNjE5OTh1bjZ3blU1aWFkQ3NjcGZzM3lVZXFXbFdEdjdn?=
 =?utf-8?B?bzZ5OFJBZUdvZk14TUI5aENPM0RsRkJIM2ozeDdTMUNNUUhQVVJwUHV6WjZ2?=
 =?utf-8?Q?gl8fi1aiqf7aytLMe6INTQmFU5nW7ifDUUaKuLjdR8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDA66DAC98BCC94EB7F8D617C23C385C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac8b121-3f5f-44e1-0d6d-08d9d41739e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:57:26.9387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FA7DQKgx7NURiAZIEhSr9sqJ+E45Ucrd0NGE63vq6147F/5w+bcPz/VcGEcUsmnbJgyGVfxVvFuPq38xAswuJiPUtbvpDz7hi02l3Cucwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2874
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjIgw6AgMTI6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
dGFza19wdF9yZWdzKCkgY2FuIHJldHVybiBOVUxMIG9uIHBvd2VycGMgZm9yIGtlcm5lbCB0aHJl
YWRzLiBUaGlzIGlzDQo+IHRoZW4gdXNlZCBpbiBfX2JwZl9nZXRfc3RhY2soKSB0byBjaGVjayBm
b3IgdXNlciBtb2RlLCByZXN1bHRpbmcgaW4gYQ0KPiBrZXJuZWwgb29wcy4gR3VhcmQgYWdhaW5z
dCB0aGlzIGJ5IGNoZWNraW5nIHJldHVybiB2YWx1ZSBvZg0KPiB0YXNrX3B0X3JlZ3MoKSBiZWZv
cmUgdHJ5aW5nIHRvIG9idGFpbiB0aGUgY2FsbCBjaGFpbi4NCg0KSSBzdGFydGVkIGxvb2tpbmcg
YXQgdGhhdCBzb21lIHRpbWUgYWdvLCBhbmQgSSdtIHdvbmRlcmluZyB3aGV0aGVyIGl0IGlzIA0K
d29ydGgga2VlcGluZyB0aGF0IHBvd2VycGMgcGFydGljdWxhcml0eS4NCg0KV2UgdXNlZCB0byBo
YXZlIGEgcG90ZW50aWFsbHkgZGlmZmVyZW50IHB0X3JlZ3MgZGVwZW5kaW5nIG9uIGhvdyB3ZSAN
CmVudGVyZWQga2VybmVsLCBlc3BlY2lhbGx5IG9uIFBQQzMyLCBidXQgc2luY2UgdGhlIGZvbGxv
d2luZyBjb21taXRzIGl0IA0KaXMgbm90IHRoZSBjYXNlIGFueW1vcmUuDQoNCjA2ZDY3ZDU0NzQx
YSAoInBvd2VycGM6IG1ha2UgcHJvY2Vzcy5jIHN1aXRhYmxlIGZvciBib3RoIDMyLWJpdCBhbmQg
NjQtYml0IikNCmRiMjk3YzNiMDdhZiAoInBvd2VycGMvMzI6IERvbid0IHNhdmUgdGhyZWFkLnJl
Z3Mgb24gaW50ZXJydXB0IGVudHJ5IikNCmI1Y2ZjOWNkN2IwNCAoInBvd2VycGMvMzI6IEZpeCBj
cml0aWNhbCBhbmQgZGVidWcgaW50ZXJydXB0cyBvbiBCT09LRSIpDQoNCldlIGNvdWxkIHRoZXJl
Zm9yZSBqdXN0IGRvIGxpa2Ugb3RoZXIgYXJjaGl0ZWN0dXJlcywgZGVmaW5lDQoNCiNkZWZpbmUg
dGFza19wdF9yZWdzKHApICgoc3RydWN0IHB0X3JlZ3MgKikoVEhSRUFEX1NJWkUgKyANCnRhc2tf
c3RhY2tfcGFnZShwKSkgLSAxKQ0KDQpBbmQgdGhlbiByZW1vdmUgdGhlIHJlZ3MgZmllbGQgd2Ug
aGF2ZSBpbiB0aHJlYWRfc3RydWN0Lg0KDQoNCj4gDQo+IEZpeGVzOiBmYTI4ZGNiODJhMzhmOCAo
ImJwZjogSW50cm9kdWNlIGhlbHBlciBicGZfZ2V0X3Rhc2tfc3RhY2soKSIpDQo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnICMgdjUuOSsNCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIE4uIFJh
byA8bmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4gLS0tDQo+ICAga2VybmVsL2Jw
Zi9zdGFja21hcC5jIHwgNSArKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9zdGFja21h
cC5jIGIva2VybmVsL2JwZi9zdGFja21hcC5jDQo+IGluZGV4IDZlNzViYmVlMzlmMGI1Li4wZGNh
ZWQ0ZDNmNGNlYyAxMDA2NDQNCj4gLS0tIGEva2VybmVsL2JwZi9zdGFja21hcC5jDQo+ICsrKyBi
L2tlcm5lbC9icGYvc3RhY2ttYXAuYw0KPiBAQCAtNTI1LDEzICs1MjUsMTQgQEAgQlBGX0NBTExf
NChicGZfZ2V0X3Rhc2tfc3RhY2ssIHN0cnVjdCB0YXNrX3N0cnVjdCAqLCB0YXNrLCB2b2lkICos
IGJ1ZiwNCj4gICAJICAgdTMyLCBzaXplLCB1NjQsIGZsYWdzKQ0KPiAgIHsNCj4gICAJc3RydWN0
IHB0X3JlZ3MgKnJlZ3M7DQo+IC0JbG9uZyByZXM7DQo+ICsJbG9uZyByZXMgPSAtRUlOVkFMOw0K
PiAgIA0KPiAgIAlpZiAoIXRyeV9nZXRfdGFza19zdGFjayh0YXNrKSkNCj4gICAJCXJldHVybiAt
RUZBVUxUOw0KPiAgIA0KPiAgIAlyZWdzID0gdGFza19wdF9yZWdzKHRhc2spOw0KPiAtCXJlcyA9
IF9fYnBmX2dldF9zdGFjayhyZWdzLCB0YXNrLCBOVUxMLCBidWYsIHNpemUsIGZsYWdzKTsNCj4g
KwlpZiAocmVncykNCj4gKwkJcmVzID0gX19icGZfZ2V0X3N0YWNrKHJlZ3MsIHRhc2ssIE5VTEws
IGJ1Ziwgc2l6ZSwgZmxhZ3MpOw0KDQpTaG91bGQgdGhlcmUgYmUgYSBjb21tZW50IGV4cGxhaW5p
bmcgdGhhdCBvbiBwb3dlcnBjLCAncmVncycgY2FuIGJlIE5VTEwgDQpmb3IgYSBrZXJuZWwgdGhy
ZWFkID8NCg0KPiAgIAlwdXRfdGFza19zdGFjayh0YXNrKTsNCj4gICANCj4gICAJcmV0dXJuIHJl
czs=
