Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F9A87DA09
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 12:56:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WLfzqSLM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxfjB30Pyz3dXF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 22:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WLfzqSLM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxfhT1qmzz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 22:55:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeCkJlYYHw+YBAMgX5BDJUvUmMWjXrRAL5AvfXj4ZG4/lB62TDKHhZ+six6+75FssivW9uTZAu7I7xL+4EE97sMB5V6+mQDR+ZsEgHb//XDib3ztldGPzvH2RMIsFN31AdEQ75LOk+I8Usf26olAv+Vp5orSIf3K40Yc3MbN7RINo3/4Zp6yHOQYGHOFRzKUY8hiFLOw9bxamFHyVjIJhzo7m5absLY+52dEr12aoWLb/rg4lVorv1xnDVDJoyn4CMivMzOeMdInPNeXQmQKQdjMDse+zmlxm/Spvjrc9xhKD7hFrjEsFlGWiA0AsK+dPEmOdnEXoKDV8lviP1gUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTXfLSIMJCbgSKAqLDE87gYWp4eVD4Z8EoaBstSKCeI=;
 b=U+5u0oWUz52/eqh0OBRjcJDBxXHc690kyuT+sdMXjKG12JhC71Nhg/7CNfWftBcr2G5iJQts6UCzc+ZblHRwG3igvkfFqFk6AYcAoQx8ou1ao8edYtr2dUf6Uo+IdSEN7itj6WRKt7ZsiaWdx8gBGYP4yXAhhT6Gko0aOIJCehGYGWrywIbKmhEp8wdocBiixlKkwH/AlH9OmtTEgoU4Dp+L7Bi7ybx8W5CKdYgtZO+QMhRwx7l1PreLJsyi8gMRwhgwl8EqDw/dKB2GkaJfMzpCw+/1Ld5/adYLIN3oEJ5631czAlqU7QeweAvY+JglDAnDvB+bDsvnDZz7ED0j6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTXfLSIMJCbgSKAqLDE87gYWp4eVD4Z8EoaBstSKCeI=;
 b=WLfzqSLMq2c2HDLgUKmg8BBSKeN9p//CQ7hagQVvNb+ZQhg3Y8LvrCCXG92pK1k9o8J4WgC29JklSKMoCt8BES03eZJ0eveWfOBUcd3n3vZzqxdYr3WAz6p8sHOrjwcxXATx4Y5H7/VjR2Anh32WZu5Wwc2Aj1d9xO6jpx1SAU5e8yVomad0J8HtLE/xhO2/wtk7ioZemWHRuRHMifhHzJZ/7bRQonsfIu29WJEGDeDIpWNxB2ES8fBm5NkfTS9ZqtfspDfZg44spkJzLBwqyCNxApHSDhk5tsurIA2o9ccrYidPMDGmUDoAneSZ22TXZj16N+F+RcH4lVyioO8GCw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1748.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.23; Sat, 16 Mar
 2024 11:55:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.022; Sat, 16 Mar 2024
 11:55:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Use swapper_pg_dir instead of init_mm->pgd
Thread-Topic: [PATCH] powerpc: Use swapper_pg_dir instead of init_mm->pgd
Thread-Index: AQHY3AT4tzQrZ//ueEG7OF1TthbGebE9eZ2A
Date: Sat, 16 Mar 2024 11:55:23 +0000
Message-ID: <8dcc6a37-6b9c-45cf-bcc7-dfcc82e2da52@csgroup.eu>
References:  <9792b4281cae63e9c5692951b0ff2da14cfef79b.1665336655.git.christophe.leroy@csgroup.eu>
In-Reply-To:  <9792b4281cae63e9c5692951b0ff2da14cfef79b.1665336655.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1748:EE_
x-ms-office365-filtering-correlation-id: 17326099-2b21-4b82-5b78-08dc45aff67b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JqWIljPygV1s7CQy9fwuAw+QOS8dZj9asAHv36ssBrxgD/cNda1+8m+fi/8jLVuZxbcGsUiBhE8DplSp2IhLSQMdO4+Xxapv1GMmN2UONIb7eEvTqXprY8eWjyVYvtYdW4CWOehjCaooa/YDRhR4IN93ecCqCwDQn8hj5tEFch1oskreZj9DLtAkZWAI3+ASXisgMpXxZD/YAiaozeHvIQZH9Lv4J0AvlrGbBfPum2KVhIBgS3pkmjjjWY+NIlqNXRvScOLJVw1FvhuUvfhkZgskMrEr/t4o0osQJYzc2isz2B+Xt38fsKo2s5p19PNCaMb+0TFLKslcwnVwgwm7x8KQyuvamhELAMNawC+kTfQudyKoVbomm6HyRfK+Nmg1CIyVivB6b2WZjsIlzn8xTXb9+1a7BLNFVlD51qY0ykLLIecNbU8RgFvtfZQx0KSYZpSRf3OHYexXQ26CqUs8yRz+fdsBZqbVfroKfzjn5sZ//PUiP53OLL5/TSEYWRgc+LgoOhe1kaEb7GN9ldPGWOJPEpQV1zyKVeQwpSiNGQY38s0xE++Eruxzj0Sq83jjzHJV9EbWu5aax5TnhAdCHcL6i57MJ+7uMym2O66GKvKKCjQrPYalt5CMONjw1LUAQ9xF0H+hDJ6YbvN7LXEBqYRUfE7bFK6SHiPQATa6FIM5/YcEgZiFU9LUeiDpX5RuE8rkHe+4WJFt2ATY6OYwXLvIRfeN1gneSVJA/tlvHCs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S25TRjJpVlRra1g1RkJKRVpPaEFDREhEbExWSXRhZEJPV0VTMmluUWt3WTF3?=
 =?utf-8?B?QnJEd1lVRHBzMHBHTDh1MlNENWZXQW5EL1BKcDBsbjIrc2RCRlNDcmN5TU4x?=
 =?utf-8?B?bEFGVmF3TWtoZlFHeEpvdHdiQ3RDZTJCekxTeml3VUx6VlptYWdlQ0N4UFdL?=
 =?utf-8?B?QmUrMXo5c1VTbVZDSXIvcDlRQ1RxVDRyeXozVXhSdGJjOVhkUTZnMi82R3ZD?=
 =?utf-8?B?Q3d5OFEvMkw0QldwaE41VXBHRzRzSHlmaVJYOWVFa0ZZc2hrMzhmS1pIUWFL?=
 =?utf-8?B?aU9PR0xpN1RjNlU5aWo4cmJIQi9MU0w1SHN4MzNhMktDWm9VV0JWeHI2N3cw?=
 =?utf-8?B?dlRtTlN2NVRnWGFCZi8yUS9sM2NzNm9TYU1kTC8rZE1tV2ZrWVF2NGVRWThU?=
 =?utf-8?B?WDFNaVU4SFNZd1M4blpLU0tIc1Z2UjFkdEpmVDdpcldtbHJkT1kxQjFNMWxi?=
 =?utf-8?B?TjBOTjdVRGlFY1EvdXA5eGR2ZjNaQkNxRlJGMStkRmVWU0V0SEVyeVk4UndV?=
 =?utf-8?B?U21Uck9zNk1STXVHZEVyaFE4bnBVTEF3c3F6S21qaFdLRlZYb053WHdyUUNJ?=
 =?utf-8?B?czN6RGtKRi9LaXAzT2tHYkx6ZVQydkkrTDMxQU1FZ0RzQUkxaTdSUkhEOTlJ?=
 =?utf-8?B?bEl1dEdYWWRwaUVzUGd2MUJvbDNMd1d2dlhpU3lBdzRoa3pLT1Y4TFlQZjZU?=
 =?utf-8?B?RWkrMkNQcFhmRnp1UXhSTlhxa0pnelNiSk9QUUpJaTNVbnVUVVBORmVpTXh0?=
 =?utf-8?B?dWg1a2xwcUFrS09ORWdKY1ZkS2F0Qkx0Q0JCN1dSMTJnYWo0eUJ4QjMwQ0xY?=
 =?utf-8?B?MjdNRTRFcjVBNUtpUjU5YzFxaENEU0JzZDh0NWUrZUNla080QTArWmlZalVx?=
 =?utf-8?B?RHVUWGM2MURVdTdNODRvZGwwODBzS1MrT1FkREF1T3NDS0phRktsYkU3WmRj?=
 =?utf-8?B?UDZOMEhxTmVEdFQ4Sm1CMUE1Tkl1aWhMQjV3OHc3U1NDdStZam9ORFc0Nnho?=
 =?utf-8?B?MXJnYjkvQkZaTzR2TVltUnpvMFFBN2VJSmtFOFIzK2QzaUw2M2dnQ05EQzQ2?=
 =?utf-8?B?MFZqZnNjeXNHelVWU1hEUGR3dkRSNGx0NklETVRLK0hRNkZpQVF2amswR2Nl?=
 =?utf-8?B?d0graEVoRXRKUS9kQU9HcmpXdjJnT29OYkZDYzBPbVdoOWdKaTB1TmNRUlBN?=
 =?utf-8?B?anhBcGVIN1R5UzJhZkd2TzBsUm5WVzhpdEFXblBXQ3VxUWZBUXErZHhabUFR?=
 =?utf-8?B?QlhSekpjNUJHaEQ2MlJBenU3clRRVU1KNkhMY05RdENMdGF6a1QraVRnQWU5?=
 =?utf-8?B?L2lvbFhPVUpNYVcxZWRZNjlvTDlCbm1icDd0TFlLeFpKZ0twRi9tdmF0MzZK?=
 =?utf-8?B?Q01uVndZT1VOKzdzbEpNMXdIcFNHTnlmbm5veXZlT2RYUkpNYUxRS3ZXK0I3?=
 =?utf-8?B?cXlXeitWVGp2WU9iLzlkVkE0NlVUNWhOelhJUnpPb0hpdEVjb0k1b0lwT1Rt?=
 =?utf-8?B?NC9GNE52YzFRd1Uxb04vcS91QUh0Rm9rcEJGUHVKenZnbER5eTIwYWpDYjBR?=
 =?utf-8?B?WXNnQjc1Q0Vqa0t5SklNTGc2K040OVpwQ1RSa3pVaXJaV2FnRTJaNEYrTkV2?=
 =?utf-8?B?aXFwaVRXQjNBY1lFK3FwSGJ0bGhId2xWSkRUM0RWd0JVTkVrMHJLbTNQYUFm?=
 =?utf-8?B?UTgzeUtEMXg4eHFGQ1JNcTZNdktNSXp0ajlCYnVFdUNic2tsOHIvczlSTVZi?=
 =?utf-8?B?ZGJZcklyOGw0SGE5cmtnSGkyYlVGalF4aXRqUkYrZk43TGtKNTBHb01RdHh1?=
 =?utf-8?B?UmRUYUVKRWU3VWEwdWh4VjhBSXpqZUNEL2hUUDc4N2xXNUg2YURFZU82c1p5?=
 =?utf-8?B?c3hxVG1LenJ4cC91MDRzU29INldTVkxpWE1vdnFsdm9GOGV4Q0t0NHQ0bTlJ?=
 =?utf-8?B?N2tkV3VXU3FMUm5hNFVzUTFjd1d6b3dZQ0hMVFMxOVhuZEJZTnc3K1N1Nlp3?=
 =?utf-8?B?blNGVUtBRGRsbFYySko3WnhnU0I2dTY0R1RvM09Fd1hQZTZmNzVyc3AzMXJO?=
 =?utf-8?B?L3RxQ1A3dmxEL0RJb25jK1Eremp4Sk03VThBc2JsdEdMcTFyNHdVSkRjSVdh?=
 =?utf-8?B?MTVRN000RWtUUkFHSWNBTTZ6YkYwODJrM1RKNm1VSXJCbVdWdk5BUGhhUHpi?=
 =?utf-8?Q?XatxSOLL8NWFKr/0cRaxjhp4oEWlU/75QOwvxoZK1xip?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E95B1E2EE253D74B84F57B973938E329@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17326099-2b21-4b82-5b78-08dc45aff67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2024 11:55:23.6051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14GIgEIrx/DLbMZvMWJvO/gbwAaBows5gM60XNgbEWRid973yrYAZ69+6+jkvfV/t6zPDejuAqJx6Ms8mUDhk6QiLrMPTyO4VeqSWnw/nmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1748
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEwLzIwMjIgw6AgMTk6MzEsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gaW5pdF9tbS0+cGdkIGlzIGFsd2F5cyBzd2FwcGVyX3BnX2RpcltdIHdoaWNoIGlzIGtub3du
DQo+IGF0IGJ1aWxkIHRpbWUuDQo+IA0KPiBEaXJlY3RseSB1c2UgdGhlIGxhdGVyIGluc3RlYWQg
b2YgbG9hZGluZyBpdCBmcm9tIGluaXRfbW0NCj4gc3RydWN0IGF0IGV2ZXJ5IHRpbWUuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+DQoNCkRyb3BwaW5nIHRoaXMgcGF0Y2ggYWZ0ZXIgZmVlZGJhY2sgZnJvbSBNaWNoYWVs
Og0KDQpubyBvdGhlciBhcmNoZXMgZG8gaXQuIChzd2FwcGVyX3BnX2RpcikNCg0KSXQgd291bGQg
YWxzbyBtYWtlIHVzIHRoZSBvbmx5IGFyY2ggb3RoZXIgdGhhbiBpYTY0ICh3aGljaCBpcyBvbGQg
YW5kDQpwcm9iYWJseSBnb2luZyB0byBnZXQgcmVtb3ZlZCBzb29uKSBkZWZpbmluZyBwZ2Rfb2Zm
c2V0X2soKS4NCg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCAyODNmNDBkMDVhNGQuLmY2ODQzZTYy
OTRkOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0K
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC00OCw2ICs0
OCw5IEBAIHN0cnVjdCBtbV9zdHJ1Y3Q7DQo+ICAgLyogS2VlcCB0aGVzZSBhcyBhIG1hY3JvcyB0
byBhdm9pZCBpbmNsdWRlIGRlcGVuZGVuY3kgbWVzcyAqLw0KPiAgICNkZWZpbmUgcHRlX3BhZ2Uo
eCkJCXBmbl90b19wYWdlKHB0ZV9wZm4oeCkpDQo+ICAgI2RlZmluZSBta19wdGUocGFnZSwgcGdw
cm90KQlwZm5fcHRlKHBhZ2VfdG9fcGZuKHBhZ2UpLCAocGdwcm90KSkNCj4gKw0KPiArI2RlZmlu
ZSBwZ2Rfb2Zmc2V0X2soYWRkcmVzcykJCXBnZF9vZmZzZXRfcGdkKHN3YXBwZXJfcGdfZGlyLCAo
YWRkcmVzcykpDQo+ICsNCj4gICAvKg0KPiAgICAqIFNlbGVjdCBhbGwgYml0cyBleGNlcHQgdGhl
IHBmbg0KPiAgICAqLw0K
