Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5C5AFF4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 10:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMwf21QB8z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 18:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Fe8E0aGX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.82; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Fe8E0aGX;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120082.outbound.protection.outlook.com [40.107.12.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMwdD2DQ0z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 18:38:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giAD0ve37p80VMBDF6JRh9yMGSKq9rC9gWFgEw2bAnifmJczuTErBDL/DRCz8L86UB8RFVDN09YjYEnJ16VE5K2PDd1k76FoAJ8kZlzhklaq4FsXH6XNntF4S+NQbSQAxLSB8ID6lhdSrUao8MlBQfbBeVI3Wo+O3uXgwAMF1gqzjw4XvsGu7Ok9o+alFi8wNlCvYCTzJqPdkvZKqCrbIuUP9pqwi+a/yg/0PQp/KWKu41eWU+PPnS6LHy2oVrMxYnL5Fsw3YpWBotK6t66NPhNsOQdWg0JrTMSi+dtIOTxeqdIliQk+GgedeCPkICods/0COaZhh/j2Pj+oZJUwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48bOj7tY3295QBJv2RPusYJ37leDHX/iuTprwh95ZRI=;
 b=PoZPU90MA+8IKnQ/HULdR4mWkd7uFHtEjuA9Sh22Bou9j7duE7CKhrbeUC3uR8SDtHEtWZy/XADuE4DvFD8YiLosjnNy88SniAcZY/b8rDOpmF/q9PPR39TUy+2Q+UKVUd49J7GFsMKfF31sM0ZvWpgdFi2bo+0E0fvx45SmrprH0Wc39UaOaQidMlx5Ef2pg7vHbjugwcOosvDSnOE7+a3FbnQ5sue7/4igUIedHJ9LHl0sTXP9lo9lY4Z18ID03/ooLghtGxac6w3fC24f+EVZaun1yK0UgiS64rw5jqqwQ8iSaOJ3oqzLk0J/owixRu7d1tGbRMHgW7hvSKLqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48bOj7tY3295QBJv2RPusYJ37leDHX/iuTprwh95ZRI=;
 b=Fe8E0aGX9qwSIrQ6E2pVrvZIbCnqIoEG9+yJyTdR+NOmjm6KOwD4BVKOeIVrd1M7145Id1jl2XHAnYMAagCh3wRIpM1PQWUKnDcftzhmIiLGOWQhcdlmde14MWmVQOG2BFQgdQy6X2EfHrVP6Omed+Qna/0Xd9RvDgw8z0h4tvwybQ3XLrsuEMG5FOBufdTEq3opsT6fX3BkOC4FGftd2+jndzuu6O5pfN0dKECiViNI8DGcnuutl8wXZQUiFlpkxouGgwYB57y/h0hlsaOhdeT789LD9ooU/EJ0RsLHwI+D87SSa64Elm7HOH18IlW2zgjVD/zhIqICfSkAfzK1+A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1812.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 08:38:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:38:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm/book3s/hash: Rename flush_tlb_pmd_range
Thread-Topic: [PATCH] powerpc/mm/book3s/hash: Rename flush_tlb_pmd_range
Thread-Index: AQHYwpK4lSCPbkc3xUirWbELp8zpfa3TpSSA
Date: Wed, 7 Sep 2022 08:38:03 +0000
Message-ID: <00a14299-2eaa-3d5a-27c6-b931e1f9c957@csgroup.eu>
References: <20220907081941.209501-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220907081941.209501-1-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf4d4eaf-f18b-49d1-0189-08da90ac4780
x-ms-traffictypediagnostic: MR1P264MB1812:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UXtE1VEgx+VZKTZFMznHSxP2xORHPTSkzE8O6ZmG2zRxbarRzMD8fmRy7W5xOqJ4bSv6Gxcy2PF/w2NdPmlN0nOfd3pKhOddHbH0RriIFuee7hRhrwceMLt5Qv7eakkNvs/I7A5aPWl43Kop1XYoK0JaDrfBSjcpDeWrceqfdxwUGaW1vSokOuxX755HxfOgYIpkNPvu+5H+y2cfc009KKtJqhwMVFkwFwuEsDl9ANHthfDVbUxJJTJtWYuCHxO10xd8/gbzEzdCPEFBBNCoaam0S+obTegGzkIy05PsFRD4BlkqCxoIptCxg/ucp0qaLkWlXPC4AtHWygo78DPJ5VpVLndCpjiKyEC7ZB6zFZLFJEe6sSNmrjBO+qtuPADh/8wnBeOUa0K5cG+GgO9sFGbNH+6RN3jKeWAuhfReIkRT9o5fnAghvenAJBGTZ14zHUTgVhR2WJSb5rtu6SsBR1PSKQmxRAmSVEUPyT8PQgeO9387JmUhinfKn/5Xm8pkh4ZgsoejWWbK2v2ifWcmOUj8ZCCy02MGkDtAxa1iPjGEAUJEZKB9QN181tBOl0Pd+8BrQrYZvkzDurk5UkhcSZB1976DMQ5z+PAYdJGdboPHskncPOyAD3m4le/fGxb83eorNcgsBeuqcJa3ni23IcBDbBFZ1t+aRNrZqYCDlQFXhq69g+Y+QgmBBd3djvYxy9I7KBUd9TLYa2o8fxGAQ9B0ebuO1mvfaIOOk7m1qnYPyBOY00At72EnKO2XgTugfKNZazsGvJWiIMk2Bwgh+UZ0u2ZP64uCk7XVo8/RTvh2/eWmZfgRrTXeqmO7EQ3RABzFkfBRFa0T3BL5OPnVLA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(8936002)(2616005)(41300700001)(26005)(6512007)(2906002)(86362001)(6506007)(31696002)(38100700002)(44832011)(5660300002)(122000001)(38070700005)(186003)(66574015)(83380400001)(91956017)(6486002)(64756008)(31686004)(8676002)(66556008)(110136005)(478600001)(76116006)(66476007)(66946007)(66446008)(71200400001)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dWM2ZkpNTjBYUUlmQWw4WnlWQzhmanRuMnZZZGd5bHVMWUlqbUllY21hdUpt?=
 =?utf-8?B?anlEWmVNM0xoNTZIYlJuRDNFVmhsSHp2TE5PRS9Ia0k5UGZHTUtoVVNCQkV2?=
 =?utf-8?B?NDlGWmJja09qeEdNNmIzZWszM1FyM0c3MkplOGYwak11eTVJWmdDSW5WUEw5?=
 =?utf-8?B?b0lkRFlSbHRJcFpaVEt6SEltZ3l1d2w0bE11VzZLL0x1Sjl0SXNvOFU1ODJY?=
 =?utf-8?B?czNpRnhMTzZhNlZRdmhnbTMwVjBrTUtSUkZRc00xanpMekUyN0k0UnEzSjkx?=
 =?utf-8?B?eksvODlGcjlXL2lNM0w3Tmh6MlpGcjIxY3FHclNvOXRpQkpiNlA0WHpJZWl1?=
 =?utf-8?B?eDRLZDBTTFQwNzFETE1za0crTWcydk5TY1BhVE5aTWVkb0VlWGI2Sk1oVEhk?=
 =?utf-8?B?cHdmQ1FycmNtd1UrNjJsSDlLT01tNkY5ckVHWWdVZ1hSRU1OTmRqZWNOS21L?=
 =?utf-8?B?NjRYaTBvQWJNTmVpMEtIaXNpdVZJd0dManRzSUppTUZLL2xCSkdWZ3ByaDNT?=
 =?utf-8?B?dy9NSUFCbnFwMUNoNllGdEtTUmx3a0cwM1Joc1k0L2FJMWVKNGpaTnFBSElR?=
 =?utf-8?B?Y2pENHdqYUtxYXVic0xYZERJM3FZWmw5dEFQNlp1aUlYN2src1Jxd0FXMVgr?=
 =?utf-8?B?dWJkRjh2UkViRDgvejlLMk4wdzB3STJKWlYya1hveXNWbkJUQkRQYk4wTVNL?=
 =?utf-8?B?Wm9MaTlxdlZSVEViTmNWN2UxWWh6UHA3UGRHMjI5dTZ2ZEU2eWlLR3hnTVhH?=
 =?utf-8?B?TUYrK1Avdkc3VWU1Q09ObVdFbmVnZ2hjSkt5NTVZWlFybURpUWF3bkpWcFpG?=
 =?utf-8?B?bE03WHRIUzVxMm1XODFGL09TRFNXakR3ZVN3OXZOclR3ZTd1SmtnbWFVL0ZD?=
 =?utf-8?B?dmxXZzA2cWd1MDNWZ2lsaitnTGs1QnBCOWhkT09wb0pEN0doMk9IMzBOTys2?=
 =?utf-8?B?RXJzSUgzSkN0Wm9IczJyaWZQa2hTVkc3ZUswRGxBZTFuZU9xRVNmWmdQY0c5?=
 =?utf-8?B?WkNZd3R2OEdtR3pGK2E1a3NFL2dYWnRVdk1aVmZvVVdqOFlDbkJQTDJkaE9m?=
 =?utf-8?B?MTVwaUJNSS9JVEJwWS9CZkhWVkVFYVhtaEhuY0I0MzBWMG81UG1JY1ZwSjlr?=
 =?utf-8?B?RzBzWkFrTUNuWFgvaVRUbnJLUWtPUFNKaDd5c3BDTFc0MytXU3NNckxHLzNn?=
 =?utf-8?B?ZXFDUVFOWk0vY0ZYaExiWWUza1VsRmpUam5tMlRlM2Q3MnorQzdESnc0aWJn?=
 =?utf-8?B?WnljY3FJSWdQTGVVaU13OXkwblZzZnUrMXdsYU5qOXdaenE0clpoUm5ybldC?=
 =?utf-8?B?SERNbmZqckFKYjBnM3kxdVFRQ1pjSEhvQzloc3VDQlkwUTc0c1VvOXhGZnpj?=
 =?utf-8?B?d2FaK05wTGt2MXgrUGlsNlgzTWdkdlYzend0WWZtRjFSTC9yS282cnYzOGM1?=
 =?utf-8?B?Q2Q1Q1FNZWFJVkJkWTNzRXh2VjZKM21WSEpnK2NjSXNiQ3g5VExTcG5neTN1?=
 =?utf-8?B?TnBHUk1qcmtsY0hNSjdrQ2hhbWkyMlpsU0IxUTZ1dTM3Sldvc2dmdEhOOGg5?=
 =?utf-8?B?Rktac1JzdmVLL2JCcm05bWJBM0ZQd1JlQzFlVTRGV0VNNTQzVG9jU3RyaXo0?=
 =?utf-8?B?NjRpQTRjamJqUlpUNyszTUFNQjRvWXpST1MxUlRjWnNJa0hXZDFQRFRvc0VB?=
 =?utf-8?B?UGJlVnE2WkVERWdWMERPZFlZNCtJeGE2YXRHZ0ZDTWNxTzZnQXgwMmlWUUZX?=
 =?utf-8?B?TllCODQ1cVZrNEl4blFWc0o5ejI1MnBhUlJlVmVpT2p4LzNGSUFIODJFS3Fv?=
 =?utf-8?B?bDBmc3ZDQlkwR1Rkb09CQ3RPZVE2M2RISVBpNU1aQm4xVFJ3Mmg2ckpKUVlT?=
 =?utf-8?B?VW0xTEY5am1MK3pSbHBMZmVQblBtYnhsRGtBejhkck8xQlVCYURZdUtrbWhL?=
 =?utf-8?B?UGRTdGN2TmFVYnRmcFVZdWMyVGo2eXcwZ2crTTRxUFlKU1Rld0ZCTEl1c0Mx?=
 =?utf-8?B?MzVMV3dGNEpsNU5oalArSWRIc2ZzRnVoeUlTNHFBNDA0bXZUbWFza0QrNDRH?=
 =?utf-8?B?MXpGOUorVE5TM3h1cWY3VWs2UUhUeTRMbjU2akJzYklBS0FiM3E3NUVKTUJt?=
 =?utf-8?B?Smw0M1ZnM0FtSjhFMFVhMll2bkIvM09UeEUrbWd6NnZhS0dhMEp4b29QNlB5?=
 =?utf-8?Q?fcZLptQf4sscMUT8WUePiJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FBA13D235AB7D458021069628C6430E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4d4eaf-f18b-49d1-0189-08da90ac4780
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 08:38:03.4223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CyDSfTfz4G+J8Glee5PTscQmEp1R3HPDtHaI7M7JtuKLTqIu8j/pzxUPaEk7qCdcE7NTLPFQbFJ3nZxGO1C9PPvYn3vx9Uij5lIJLoEEmgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1812
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

DQoNCkxlIDA3LzA5LzIwMjIgw6AgMTA6MTksIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gVGhpcyBmdW5jdGlvbiBkb2VzIHRoZSBoYXNoIHBhZ2UgdGFibGUgdXBkYXRlLiBIZW5jZSBy
ZW5hbWUgaXQgdG8NCj4gaW5kaWNhdGUgdGhpcyBiZXR0ZXIgdG8gYXZvaWQgY29uZnVzaW9uIHdp
dGggZmx1c2hfcG1kX3RsYl9yYW5nZSgpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggS3Vt
YXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNoLmggfCA1ICsrLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJsZS5jICAgICAgICAgICAgfCAyICst
DQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdGxiLmMgICAgICAgICAgICAgICAg
fCAyICstDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC90bGJmbHVzaC1oYXNoLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Rs
YmZsdXNoLWhhc2guaA0KPiBpbmRleCA4Yjc2MmYyODIxOTAuLmZkMzBmYTIwYzM5MiAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNo
LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1o
YXNoLmgNCj4gQEAgLTExMiwxMyArMTEyLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBoYXNoX19m
bHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+ICAgDQo+ICAgc3Ry
dWN0IG1tdV9nYXRoZXI7DQo+ICAgZXh0ZXJuIHZvaWQgaGFzaF9fdGxiX2ZsdXNoKHN0cnVjdCBt
bXVfZ2F0aGVyICp0bGIpOw0KPiAtdm9pZCBmbHVzaF90bGJfcG1kX3JhbmdlKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBwbWRfdCAqcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIpOw0KPiAgIA0KPiAgICNp
ZmRlZiBDT05GSUdfUFBDXzY0U19IQVNIX01NVQ0KPiAgIC8qIFByaXZhdGUgZnVuY3Rpb24gZm9y
IHVzZSBieSBQQ0kgSU8gbWFwcGluZyBjb2RlICovDQo+ICAgZXh0ZXJuIHZvaWQgX19mbHVzaF9o
YXNoX3RhYmxlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsN
Cj4gLWV4dGVybiB2b2lkIGZsdXNoX3RsYl9wbWRfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0s
IHBtZF90ICpwbWQsDQo+IC0JCQkJdW5zaWduZWQgbG9uZyBhZGRyKTsNCj4gK2V4dGVybiB2b2lk
IGZsdXNoX2hhc2hfdGFibGVfcG1kX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwbWRfdCAq
cG1kLA0KPiArCQkJCSAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIpOw0KDQonZXh0ZXJuJyBrZXl3
b3JkIGlzIHBvaW50bGVzcyBhbmQgZGVwcmVjYXRlZCwgd291bGQgYmUgYmV0dGVyIHRvIHJlbW92
ZSBpdC4NCg0KPiAgICNlbHNlDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIF9fZmx1c2hfaGFzaF90
YWJsZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkgeyB9DQo+
ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF9w
Z3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF9wZ3RhYmxlLmMNCj4gaW5k
ZXggYWUwMDhiOWRmMGU2Li5mMzAxMzE5MzNhMDEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9oYXNoX3BndGFibGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaGFzaF9wZ3RhYmxlLmMNCj4gQEAgLTI1Niw3ICsyNTYsNyBAQCBwbWRfdCBoYXNoX19w
bWRwX2NvbGxhcHNlX2ZsdXNoKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIGFkZHJlcw0KPiAgIAkgKiB0aGUgX19jb2xsYXBzZV9odWdlX3BhZ2VfY29weSBjYW4gcmVz
dWx0IGluIGNvcHlpbmcNCj4gICAJICogdGhlIG9sZCBjb250ZW50Lg0KPiAgIAkgKi8NCj4gLQlm
bHVzaF90bGJfcG1kX3JhbmdlKHZtYS0+dm1fbW0sICZwbWQsIGFkZHJlc3MpOw0KPiArCWZsdXNo
X2hhc2hfdGFibGVfcG1kX3JhbmdlKHZtYS0+dm1fbW0sICZwbWQsIGFkZHJlc3MpOw0KPiAgIAly
ZXR1cm4gcG1kOw0KPiAgIH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9i
b29rM3M2NC9oYXNoX3RsYi5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdGxiLmMN
Cj4gaW5kZXggZWIwYmNjYWYyMjFlLi5hNjRlYTBhN2VmOTYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3RsYi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9i
b29rM3M2NC9oYXNoX3RsYi5jDQo+IEBAIC0yMjEsNyArMjIxLDcgQEAgdm9pZCBfX2ZsdXNoX2hh
c2hfdGFibGVfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpDQo+
ICAgCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsNCj4gICB9DQo+ICAgDQo+IC12b2lkIGZsdXNo
X3RsYl9wbWRfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBtZF90ICpwbWQsIHVuc2lnbmVk
IGxvbmcgYWRkcikNCj4gK3ZvaWQgZmx1c2hfaGFzaF90YWJsZV9wbWRfcmFuZ2Uoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHBtZF90ICpwbWQsIHVuc2lnbmVkIGxvbmcgYWRkcikNCj4gICB7DQo+ICAg
CXB0ZV90ICpwdGU7DQo+ICAgCXB0ZV90ICpzdGFydF9wdGU7
