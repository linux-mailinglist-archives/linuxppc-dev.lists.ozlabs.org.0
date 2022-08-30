Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D755A5BEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGyJx0R6Xz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:37:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yIQ43ip9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yIQ43ip9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGyJ90N6kz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:36:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMagSckHz4mnNO1sMiZlCz4HPOAD1hvcEdHhoLmNCVRK1pbcMkIzWL51UkDXrvpzFmKXY8V+2CgsDX9+XePWtkeI2MU0rw7IdXymjpKrWKYEPwNWgzIO9dKWm0QeWdH38Yp3j8RrwAN9KMQI2+G3qZ9t6NlsbaPbyp281n1brTg3b58nypx0LHxXIcwtyMaP4ue9RuImcK0lRV5bh+BlmcYj60H12X3jKCI+iAMoEM0FFEbMI6yIAiz5E2v21Elw2DLo5aloZSpnaMnsyHK8Eddh4clpr0f8u+mhZaU45G65+vzf/vTzcht3srq7EyuJpnIzm8W4xLZ7Llqs3IfvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REhG5AlhphRwyuIyIXIvAerOf8OlXTuZxjZGBnHjotE=;
 b=C26X/3Tb6Vxmms5mogY7PwDhUH3mVPJrnfOson2iLYyZaxicyECnPkuyuLM0impKYzXkVuMqYVkUNsZqvXnDAnaSG+6Pjuiik54b78vPIoaIKrOuwCHWa3PqztWq9GRnNyKnGfI8oTWfwtoI45zaSev5yPpEaj16jFwuczyx9XGVBQzaQh/X/6QNlhylYQmhy+VIeT4Ec3IHFPlvm2XaXEI/tMi0Z0BiRIuO1EiyrJzSEFvd44Xs1qiANwyJz1DwDTiLDlAel7RCjD8osXEtK3f4opc9018qP+t+RPNULyX9MtY0xPiHYtiQwU5ErshJOGSl8QetaFH2IZX0hy3Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REhG5AlhphRwyuIyIXIvAerOf8OlXTuZxjZGBnHjotE=;
 b=yIQ43ip9N6iWKewanDAM7TzbNT3on7aYNEX+cHTlEGC13KJFxmKMmbadH6mGw1UGXlwS6fHG4tcEGt/FN2QtjE0vsxCDNrRvOEgMuQIKvHxWtGF+t0/I8QCWUP6YxS7ILUgtquUqe6PmNwHPJbl8KtfXxTfkN2v3I6EOjvbTvpdsVkUWBjMFA1Y1ocz2EJyKYSvWhg4hD7XK/ODW7AhueNZfV2SSv+DbEH7/qp1GC/MLjbk4roJ32PfntIPj/jqHs/CzhPqo/RTLbjyzR2LaFPUqHkHF8jf5s7p1yN4OqcKTMVcIYxIdYUI/lhp/wJF8ZN+Qm3HCRbmtzK7bhmpcBg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:36:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:36:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 14/16] objtool: Add arch specific function
 arch_ftrace_match()
Thread-Topic: [PATCH v2 14/16] objtool: Add arch specific function
 arch_ftrace_match()
Thread-Index: AQHYu2u6wfhFk4SmS0i7HQOQnPBaJ63G/rYA
Date: Tue, 30 Aug 2022 06:36:05 +0000
Message-ID: <9db3f9f3-8fc0-9f33-2c93-7d51006dc127@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-15-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-15-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86860d6d-047d-4fc1-3547-08da8a51ea47
x-ms-traffictypediagnostic: PR0P264MB2171:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bBVqupFpsO12LNMCS52gGNoaFHvNMOGLOKV/tRgzI/BpE30tOJ7kXusH7fDFxU2rRbVf1ELwDWfoyW8YhNXFnCNDM4aHUSpzPkNV75JcYD9tV00gS336I0E/b/W1lUOy8Q0hJhksS0ds2So/9CKcXfLFH0HUP26YUnJ5zqiUlS4Ir0U6t8EvUYQhY59VDLEdWJCRyWuHLYaMBEqRHiDNo1EK1u0VdKZ8SfYS5qVuUtAVJO/BYa4L3u0fBG1SqxO4jOLoHkypjlvPz3VI18s7otu9SA4elphnE+ZBy4YA7zTThcyrZcn+SstYnvZMY6JqOU+baE0qowTOB3WZB91JkQF+dnIYEmwhYb5GoBdrxOLQ45CfIGNt5iwtrfHv4+v0ImEfokfhfaf8HWnkFxI/3zPEi9a26/0kOt8kqRXqfpwr5KAVl24W6Kun2SRLpoq/4QpjGPircDwmDup+1fnyxV0Ba7AgqmwBcD8U80BF5L3c3EtYdcXOouhzLrBvr/5bEofC/FdPvbGELEkyMXbbVId7EXVkmJu7GknoUVmVJHg2kiHxBCnTa/ph5WHS5ujjOQS1mrPoXs7TQDTTyGN4MYSFIC4719r/kRFFlNQ6/yRmz9F0Daf5Rrpr4x5HOCjIik4fFgOufzg9WaXfzqr5Jsh0w0Mapb21GWPqgjZ+19ULm7Eiu+RBGV6sFi+vPB+OIVFOuv6gURAbBgRp3hYYiYKAfBd+IdlbQJ49O5bXTcV5Od3obkTNuMiCAzIpqdbipHjY15xxz62KxbA1Fywl0eNm8pOvyBW6Kk5lWOS5YIaJurj5mIghnXQY4sCpN9pMLsff7/b6h0vS2YEmPia5Ug==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(38100700002)(2906002)(6512007)(26005)(44832011)(6506007)(122000001)(2616005)(66574015)(186003)(83380400001)(66556008)(64756008)(66446008)(66476007)(8676002)(66946007)(316002)(31686004)(76116006)(6486002)(110136005)(31696002)(4326008)(71200400001)(54906003)(7416002)(41300700001)(8936002)(5660300002)(36756003)(38070700005)(86362001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NXVmd3ZHRnc0ZTFEaUhyNDVUUWZoUTBqZEI2VTgwQWNrNTZicGZ1U1V5RG42?=
 =?utf-8?B?d0NUMlpFTDZQbE1ra1dDQVV0d2Y2YVhFYkpINEszd240RExuWURDelA2Rks5?=
 =?utf-8?B?SytXaDh5SGcvajdYNElvZ2tKcXBHaU1MMEZMc1NXYVM3N2IveTQwR3MzcVFk?=
 =?utf-8?B?SW50cVpkZW5vOUZIUWR4V0M2UzBCY2w2WUlyeDJXY0p3aldxemI1UXo0bm1q?=
 =?utf-8?B?MExGNDlXOFkrUDNXcHl2RzNkL3VQV2ZoalVKZHNWT0RvdHhmdGt3RWpwZkcy?=
 =?utf-8?B?dFU2TE1vcWgrbXlmclpnSUp0S3RVUFVVdS9xelR4VjgyaE11NWZnOFgvL2M0?=
 =?utf-8?B?Rk83R0xZcjZ2RU03ZjNhYk14ZmpLMjYwcFA0UFdMdTdSdkJJbmF3MWZEZ0Rr?=
 =?utf-8?B?ak56Ny9uNDA1akF1YmxkSCtLSCtMR0tpZDNjejJEdXJZbGNyWEZab3psQW13?=
 =?utf-8?B?UHpLSGJMbzM4TzkyQlZWdFI1K1plMUxmUTlqakdwZi9BaUNya0tnVEhYNWtZ?=
 =?utf-8?B?eWxGYmJkcDB5Yk1OVXg0R1VER0o5eGtTeHdSU1RuQzNoUTFId1U1ZGhXcTEx?=
 =?utf-8?B?QWZnM0IxSHUxelk3VHZEK3RoQ0JORkRDREhKaEN0aGFHeCs4WUNWY2c0MzM3?=
 =?utf-8?B?b2xlQThjZHNGdktuQ0l4OXlaUWp0WWwwQytTVE9ObW9sSkNzdi80VmxwWWpt?=
 =?utf-8?B?UUFRd0pENWxsekxub0JBcDUzQWFxbDVIMGY3WFVCZjdlZHlFb3BjdThTQUh0?=
 =?utf-8?B?UnU4Q2RWaDJjOTN6SVpwc2IwVXB2R1Y4SnhGaTJqUllMNkRSaVVYeG1MK2ZR?=
 =?utf-8?B?RDkxTzM0S2Y4WUhudjVaZCszcHlpbHVuR1BFbHNCZTEwSWNXVk1MbCtYRnlD?=
 =?utf-8?B?S2IxbFE3OUprQWZMa2VOeEMxWGpGY1YzR083QzF0NndPTXlJU3lPYWVwWmV1?=
 =?utf-8?B?NnNkVWRVdmM0Vi85SWx3TkJLRWcrQ3RWQUFJUEpFUzgrMCtuZWlLNzBna05z?=
 =?utf-8?B?bENoYzIvTE55UFRVaGxZdzg5cm9NNjVzSVlpTTdsV2pHOHZFRjlkd2UzakVM?=
 =?utf-8?B?emQyRE9zeXB5K201QXdjZzRuNlM1bG0xSy9ray8wME1tcUNDYXRHTDllREdD?=
 =?utf-8?B?c0pzSGwzYlF6em1jSkZTbHNNVjdjNFg1Q1EyRFI0YTU4ekJiQUwxVHBzc2pQ?=
 =?utf-8?B?dVUxVSt0aExKcG9xaVUyVitFM2xZU0JnZDMvaFd5N0F4UXdvRzlXRngzcWhY?=
 =?utf-8?B?eE5vTkJzY3Y0UnoyYzZ0R1QrUkNhWDIwR093UzJkRUN1SkQydHhza0pINnNy?=
 =?utf-8?B?V2lzVWRrV2NhMHdHUStwSUpSU1VSUk9lbjlLWDIwMnZocVZFbEtYQW0rMUZa?=
 =?utf-8?B?OFozUVFmV2tudkNBQTczc2FJTlpGYzUvZU04N2pIaVdpdjYvbHJDL2pubm1n?=
 =?utf-8?B?eHJxTTZCY0MxTVh4NkxUelRvZEhNSk5odzFjUks3WHk4TGxhMmRjZlUxeXNh?=
 =?utf-8?B?YmJpYURneDF1VjhqK2gzeTB2VUJjL1MxaW12bUFNbkVzbUZiaWhTVzlaNWJp?=
 =?utf-8?B?cDQvMEVuOC9PQ05lcUZPN2IwUStGV0lNSjVGd1VCbzhqbXRFUEpRb1BIOFUw?=
 =?utf-8?B?aUVDdnZZWnlYZCtjZUFZVS93K1IwNFg4MkQ3M0lsMHp3Y2lTQkRVaDBKUWlL?=
 =?utf-8?B?blJ0WVpsM3BETVd0VUFzblJiTm9Ha3RuTG0vTkYvUnBUcGd4V2ZwV1FJQ3hz?=
 =?utf-8?B?VDVRZFpVMHV5SDY0VlVnM2pPUnZ1T3NsUmpWZU9qY3ExYnBKQjhUL3BXaXFO?=
 =?utf-8?B?OEkrY3VpQWN6WnYveG9pclFoY2p1L2dtViswNzFnckFrbnNxeFByN1k1WVAr?=
 =?utf-8?B?dDRlaGtPL3o2RE5pUUNVcmd2ODhzeWR6Tmw1V281cGVKdXUzWDVTcUZBZEk0?=
 =?utf-8?B?dyszTHFHcEIrYXVpbXBNWk9EVFNzdUVreFhVZ3NzSEltRmVaMEJFa1ZpcHov?=
 =?utf-8?B?S2lFQWk3ckNmMnNHdndyWDRWQXFwbmEzaEN3WlMrOVlnUjZydnlISU5ENHI2?=
 =?utf-8?B?RXlvSFJjdFZEZ0VpVi9xRm9MNmNSTEk5OGZyZS9rKzJQVU1ZZVl5YjZIYXlC?=
 =?utf-8?B?aXoyZk5tMlVJSFI1N1gxTVRZa2xDa3BSRUphamtycVUyZXJwMEgySTZxTWMr?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6ABEDE72A0E27F438B6F141B07598E0E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86860d6d-047d-4fc1-3547-08da8a51ea47
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:36:05.3397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IppYNKu+oVvGSrdm+hyCcq1dK/Njpocusgo7MzvF47gNSpq4La2tv023Od7CksxV7hllnulZkIxFXCste1GGIJiaablfKMlz8AT7NcQcCoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2171
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
Og0KPiBBZGQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGZ1bmN0aW9uIHRvIGxvb2sgZm9yDQo+IHJl
bG9jYXRpb24gcmVjb3JkcyBwb2ludGluZyB0byBhcmNoIHNwZWNpZmljDQo+IHN5bWJvbHMuDQo+
IA0KPiBTdWdnZXN0ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nn
cm91cC5ldT4NCj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5p
Ym0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC94ODYvZGVjb2Rl
LmMgICAgICB8IDggKysrKysrKysNCj4gICB0b29scy9vYmp0b29sL2NoZWNrLmMgICAgICAgICAg
ICAgICAgfCAyICstDQo+ICAgdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYXJjaC5oIHwg
MiArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvYXJjaC94ODYvZGVjb2RlLmMgYi90
b29scy9vYmp0b29sL2FyY2gveDg2L2RlY29kZS5jDQo+IGluZGV4IGMyNjAwMDYxMDZiZS4uMDI1
NTk4YjZiNzAzIDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gveDg2L2RlY29kZS5j
DQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvYXJjaC94ODYvZGVjb2RlLmMNCj4gQEAgLTIzLDYgKzIz
LDE0IEBADQo+ICAgI2luY2x1ZGUgPG9ianRvb2wvYnVpbHRpbi5oPg0KPiAgICNpbmNsdWRlIDxh
cmNoL2VsZi5oPg0KPiAgIA0KPiArYm9vbCBhcmNoX2Z0cmFjZV9tYXRjaChjaGFyICpuYW1lKQ0K
PiArew0KPiArCWlmICghc3RyY21wKG5hbWUsICJfX2ZlbnRyeV9fIikpDQo+ICsJCXJldHVybiB0
cnVlOw0KPiArDQo+ICsJcmV0dXJuIGZhbHNlOw0KDQpDb3VsZCBiZSBzaW1wbGlmaWVkIGFzOg0K
DQoJcmV0dXJuICFzdHJjbXAobmFtZSwgIl9fZmVudHJ5X18iKTsNCg0KDQpXaGF0ZXZlcjoNCg0K
UmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4NCg0KDQoNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgaXNfeDg2XzY0KGNvbnN0IHN0cnVj
dCBlbGYgKmVsZikNCj4gICB7DQo+ICAgCXN3aXRjaCAoZWxmLT5laGRyLmVfbWFjaGluZSkgew0K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVj
ay5jDQo+IGluZGV4IGYxZDA1NTQ2NzkyNi4uMDFmZjc1MDRmMThkIDEwMDY0NA0KPiAtLS0gYS90
b29scy9vYmp0b29sL2NoZWNrLmMNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IEBA
IC0yMjk0LDcgKzIyOTQsNyBAQCBzdGF0aWMgaW50IGNsYXNzaWZ5X3N5bWJvbHMoc3RydWN0IG9i
anRvb2xfZmlsZSAqZmlsZSkNCj4gICAJCQlpZiAoYXJjaF9pc19yZXRodW5rKGZ1bmMpKQ0KPiAg
IAkJCQlmdW5jLT5yZXR1cm5fdGh1bmsgPSB0cnVlOw0KPiAgIA0KPiAtCQkJaWYgKCFzdHJjbXAo
ZnVuYy0+bmFtZSwgIl9fZmVudHJ5X18iKSkNCj4gKwkJCWlmIChhcmNoX2Z0cmFjZV9tYXRjaChm
dW5jLT5uYW1lKSkNCj4gICAJCQkJZnVuYy0+ZmVudHJ5ID0gdHJ1ZTsNCj4gICANCj4gICAJCQlp
ZiAoaXNfcHJvZmlsaW5nX2Z1bmMoZnVuYy0+bmFtZSkpDQo+IGRpZmYgLS1naXQgYS90b29scy9v
Ymp0b29sL2luY2x1ZGUvb2JqdG9vbC9hcmNoLmggYi90b29scy9vYmp0b29sL2luY2x1ZGUvb2Jq
dG9vbC9hcmNoLmgNCj4gaW5kZXggYmViMmYzYWE5NGZmLi4yYmE0Yjk4OTcyODUgMTAwNjQ0DQo+
IC0tLSBhL3Rvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2FyY2guaA0KPiArKysgYi90b29s
cy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9hcmNoLmgNCj4gQEAgLTY5LDYgKzY5LDggQEAgc3Ry
dWN0IHN0YWNrX29wIHsNCj4gICANCj4gICBzdHJ1Y3QgaW5zdHJ1Y3Rpb247DQo+ICAgDQo+ICti
b29sIGFyY2hfZnRyYWNlX21hdGNoKGNoYXIgKm5hbWUpOw0KPiArDQo+ICAgdm9pZCBhcmNoX2lu
aXRpYWxfZnVuY19jZmlfc3RhdGUoc3RydWN0IGNmaV9pbml0X3N0YXRlICpzdGF0ZSk7DQo+ICAg
DQo+ICAgaW50IGFyY2hfZGVjb2RlX2luc3RydWN0aW9uKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZp
bGUsIGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMs
