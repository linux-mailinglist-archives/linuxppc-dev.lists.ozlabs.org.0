Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E85812B7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:18:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eh6+iWfp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRbt4PPyz3vrP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eh6+iWfp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::614; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRb41MHJz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:17:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZTj6/MUOQ99bkaB3/vsFArYzAjRY+fsWFg3gMMK3KoL2/vfpfeKUHVF6g1k1exsOAiYp0B+gquOC50EU+VrHBhdq3ziZMwm5yTcP8OyRXNFy5yavPyIo0K6JSmQAwKuSciiLLFaeklSEqkrUyFRL7rqaXdgif4W6hUwRTrSPuWr4uXdwr29m/H5T1GN6A5Zm89u0mDnG5PHG6FcSMhUNpKjJ+2ZRyP7T3ou2wiO96t+tRNs3gZ6PQNYrwEpyEv+/TIeUeDwWwDTHF7ZdcLzjdWq3j2HnX1P+pIiGVsCdx+mGzsULTTz5vxZK/qCTOz910N2N1sN+uZQ8SmwxJfSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIKDqZdgU3TnD42f8D3u4+T2RkWLA7v2bkjMWiGL5TQ=;
 b=dDDTdGrBDO78aEdwI3M4Rvhj8wB1dKn5BfdFD6GFhNTwEEggzzkoYYj94GtvlR4j7Z44bkHDUzlZZXO8eaTQTlNZyKl1iP7J2OMcpTQzsFu47MkFn5R54b+A8F/6Sjzq0N3uheUmUHzEAAMt6vLBFieLKKundo4lc8Pr1l4Ac/1QgrZFJziJ50/X+3UjoV2diDmuKizTXm6VnBUJgcTlIkPmbZ1jME3wThmIVynTlYwRaEIqHS7UPgz/xco8U+bAfbBiLTlJm3aD9pjl6xVSvQP8f6xjaaf0jAzSpwoTBUqSsE8YyWkSmBZZWPw7THoWAxUyIFSLf+aPjbu/wZg5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIKDqZdgU3TnD42f8D3u4+T2RkWLA7v2bkjMWiGL5TQ=;
 b=eh6+iWfpEtULzhyQEEFAkWr2TgcY1SaWFr8mD2uQPl5cOnHpYbXoZg+P3mpvmfumnJHTbwxz4V/Jztg1oAAxHmUY1/V1IKlQoazIHKtK9zHAgg069/SH4SWWhYGnNNrIWtPACzrxfO/lDM2uBfND747uNT0Bv2bzj5HAIdjux4QO64FSvK3P+GKafEiCXCz/m/ahkJT0SBUPLGtwM0T9rvJoyUT/34NVK11ZiHbz5Tr1Tp8+WHTFMQKkkDN1IygVY5mRN8D8GpH7qjYl6JdpV4QsKLREeA1SlIGI7ugpbc+eUzgqit+GA/srd7eqm4m93MWpLiEI9zApnnNLmRJEMA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1892.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.28; Thu, 14 Dec 2023 09:17:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:17:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 10/13] powerpc: Define KMSAN metadata address ranges for
 vmalloc and ioremap
Thread-Topic: [PATCH 10/13] powerpc: Define KMSAN metadata address ranges for
 vmalloc and ioremap
Thread-Index: AQHaLlJRjUyjraQgMkSxQbOtue9pZ7CogBOA
Date: Thu, 14 Dec 2023 09:17:30 +0000
Message-ID: <d24c430a-bde5-4432-8550-57de33cb203c@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-11-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-11-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1892:EE_
x-ms-office365-filtering-correlation-id: cad02949-1d7b-425c-6e1e-08dbfc857fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UA9+4vAZVV0X/rFOh1R6VKwXTT6oEBYb138+/w5QJzmQ/okNi5J4pXhYEL2D4inOGVYkroLN7IvRsYJ4191rmHzX4VYxu8fzAg75nxZGVoIdjDlg4UqhcVKpsneES3DC4d0Wx55XC3mkbIWi7SP4rI3M4pZe7ungVEIg/uxn5MmuPXCinQKWEEouxq8gH739tdDCl4WKAnFx/2loIVXQLE3UbYSDXewRxEONM9Zz+DUtVLraFq4yQHnSqH14DZS+brdjsf6i12gtgtAY5NesjThxFtd/2rWMyVSbIsKRi4jxp8MnZMO7P+Me74J/fFVYBKb4mM45B4GR7pjyhWck7P6AiKZpZXGaETSYTdodArhj57XJoIkdMidIwq/Dnx4U+8Zu/hQOH0rGET61qjGIVz8Bsi3L/f9ssauJAA4fHrvIpEIOAW1/GNysIa8OLPbRFb4wX2m+Lks4YCShPCGZEpMfhkM9gHQ1RkyrcAsjnrhx19nI9I3LkGKELhUfvSvKC9Cwv46xrfM+ZbZQmiyBauDTuuvjsk1MJuI+G4E9GP6ZTS6FvwPpLYxFwNMb/9NLcQpH2aIM0i6iEulJ3QnYFLIsBFkohhJF6spe03Qa94lEcyqwBtI8DiOkXclyGC2RyHw6UlvTbd4z/VfpdKLyArfKNKgQ6ljKrA1lnq12d1bOT2VB6Jexlqj38RdTZJEt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39850400004)(366004)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8936002)(8676002)(44832011)(76116006)(54906003)(316002)(66446008)(64756008)(4326008)(110136005)(66556008)(66476007)(66946007)(91956017)(36756003)(122000001)(86362001)(38100700002)(31686004)(31696002)(38070700009)(83380400001)(478600001)(71200400001)(6486002)(6512007)(6506007)(41300700001)(5660300002)(2616005)(26005)(66574015)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZGFQOUUrRC9HVXEvVkNCUXZKbklMbVpJcndTVXQ5WnB3K0tMWEFQbHpvdXNr?=
 =?utf-8?B?OEhQQUtjemp6aDZiYXBxc25oVmNneXF4Q1MrZXc0cmpJNCtSWkZicDY2WWl6?=
 =?utf-8?B?ck8vRTdmRFRWSU16Nlp6NVloOWlqZXErQVd5V1kvQ2tNcWd4YzNGMW4vTWtG?=
 =?utf-8?B?MVBvTmFLNmZRWlI0UXc5VWw1TDhCdEtUd2lJWFo1NWN5RDQybHFPcUtiMU4z?=
 =?utf-8?B?cVErNmt4M05ZRVJEamZTQTNsMFZtNzZiU2pQeXNXZTJJOXN3TWlCN0wyYVJq?=
 =?utf-8?B?dmJSR3AvTEdtTDdVVk51amtkam5KazBwK1EweUVIeVpncldSSUdpeE9MeFBD?=
 =?utf-8?B?YlJrRDVFZWxnNjRHUzFqUXlNQkZuMFJRRTVyZ1Z6a2NDcnNUdkxsRDJiSDJV?=
 =?utf-8?B?eE1LRXREMmdFaHJ3elV0UHo2ZUlVYmgxMFhvdS8vU1BmMUVFYlJCTnRPRGRa?=
 =?utf-8?B?TnVqa2o1V3RjNzZORFlJYzBmZ3pRVlpzdE0xSmEzZ0JNbEM5Yzd2ZnBRREF3?=
 =?utf-8?B?dWRleFU5aGNWdVd3WGdRSi9xT1ZVVkQ4aXRkeFU5cGJseHJqMjBFVHVTVHV0?=
 =?utf-8?B?TXBlRkFkbm1RK3dsaW1wS2hrR1lPZXlna1RscEZFZFJta3F1akY4b1hHc2tm?=
 =?utf-8?B?OHBCVG5td3lnMWJTejRMNlVQVzRiUGYzbVVEV0Z5d1N1c1Jhcmx4blVYS0dq?=
 =?utf-8?B?dkRzUW90RU8rTEM1NEJwRGs1ckE3VHlhVTM4cHZqa1FSY0FPeTJJWnpHYWlK?=
 =?utf-8?B?a0plZ1BiYjlSMmlTNkdiNE4zWld5cWw5SmtseEIzSHJ4a0NQcGRzSnVGUUdY?=
 =?utf-8?B?eUFMUGprNkFLTjVnNERKZmZFNUlXU1Q3Rm0zZEFUV1EwVUdWb0h3UHBVeDBV?=
 =?utf-8?B?L2YzTndHRFZZSkpzRGxHVjc1YVo5V1VIVDdydEpPendHRVQrOCt4aDhYYmto?=
 =?utf-8?B?YmtTaW02WEVzbVJLTmdvZ2VtK2JvZjI3bFR1RlB2TVZVbVZsNTM0dmdqa1N4?=
 =?utf-8?B?dHpPSFloREV1bEducVFUN1h2b2REcjdBY1FHU2YwaXhzd3AzZU5tWlFjN0Zz?=
 =?utf-8?B?Nk9LWnM1YzU4WU5QaFhXSjd0U1U5RFRCQmpVNEprc3htTlEzTXpxSDVTelFo?=
 =?utf-8?B?eElKTXhqNmhTb1psWmtPSm0vTkNkSWRTcE52ME03VDc4dkFicThVUjJvT3JJ?=
 =?utf-8?B?a2NSTTQ4dEMrcE5GQzhjNm5zbFRkS1FEVEJkb3gweTFwVzNNSnA4RG13NDBl?=
 =?utf-8?B?UVMrdGJBdWxKY0g3Q1U2ZmI1KzRuUTRpam5UVG83ZDQyQVBUVkRTYUtiT0Jz?=
 =?utf-8?B?bFFidVpzVWVSN3N2U2FFYVVIYVZVeXVjWVVzc3V6d3dVajY5SExqZURqbUJW?=
 =?utf-8?B?Ni9WcHBQM3EzUHo1dWxLK1lGeVZmMjV1STB1NjliZ05kN2prTGpNZ2h5WUMz?=
 =?utf-8?B?S2pvNldIMkQxaGJFR2JadnQ4eVRnOTg4KzlKQ1BEK3B6T25VL21xRVlkMGxL?=
 =?utf-8?B?Q2xJOGNmczNDM0ErSWNsdjBCY2Zwa3kyRVpDYThqUkhJMThnajJmOEFzbFVG?=
 =?utf-8?B?aGttS2h3K0JiSGxva1N6SkRHV0I3WVNZSk4yNWVEbnhMdG92VHpyR2hvaTJa?=
 =?utf-8?B?RUpBeWR3aGRuaElzMlJEZ2tXMmRwbUlHRkw4UTV1ZGtad2o0YkpYMUJYRkx3?=
 =?utf-8?B?MldRaE1EWDBjYWJZNytxZjQycVRwbHlMU0VtbEV5L1ZKcFVGR1FmYjVjQUli?=
 =?utf-8?B?dXl5azJrbllNTVNPNDRWVDBWN1RzVCtxSFpJVHN5RURuckxjZ1dSQ3lxbmZ6?=
 =?utf-8?B?ZFFDTWZmMzZ0bEhFbDBkL3JucXNjbTV3M1ZTSXJmSFhkdjhHWVNmYjY3ci9R?=
 =?utf-8?B?MHVqMXZLVUNUdFdVV2VjY0NPaFZKdkM3NzNvbXd1VklOeVdJendTeHFwM2RQ?=
 =?utf-8?B?UEdQTXJERjdYc2dJSkhTZ0duOXVpTW9jOGxxV0ZSaXRQQWU1Slh3OURQT1ZF?=
 =?utf-8?B?azJuczZ2YTRlVmJRcEVKRk1CYlF5K2JzYXoxWlRUTXIrb3R4cVd2aDZPc1ZO?=
 =?utf-8?B?bkZxdG9YYkt0WFdUcndZVk5hd0pBNHBrcXg4bmt3a0FwVFBraERYamUrVGZR?=
 =?utf-8?B?aTRpYzRNaWtmTEhhaHc5NjFWcWJ4cktiTWZSd3hOOXh4Y3hjcHFWcU9aK0pk?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC26EA0A44A03B4CA90E9F8ABFD12A41@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cad02949-1d7b-425c-6e1e-08dbfc857fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 09:17:30.8172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3xNoqweeUHKpPL8MEI56uGUkauN+qbVG6NBCu6qj2wzbie5o0aD7CdjbbBck1anijvFthcjhzbGZenPSPJa98hDYLtydezsdeK5KQABOuIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1892
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gU3BsaXRzIHRoZSB2bWFsbG9jIHJlZ2lvbiBpbnRvIGZvdXIuIFRoZSBmaXJzdCBxdWFy
dGVyIGlzIHRoZSBuZXcNCj4gdm1hbGxvYyByZWdpb24sIHRoZSBzZWNvbmQgaXMgdXNlZCB0byBz
dG9yZSBzaGFkb3cgbWV0YWRhdGEgYW5kIHRoZQ0KPiB0aGlyZCBpcyB1c2VkIHRvIHN0b3JlIG9y
aWdpbiBtZXRhZGF0YS4gVGhlIGZvdXJ0aCBxdWFydGVyIGlzIHVudXNlZC4NCj4gDQo+IERvIHRo
ZSBzYW1lIGZvciB0aGUgaW9yZW1hcCByZWdpb24uDQo+IA0KPiBNb2R1bGUgZGF0YSBpcyBzdG9y
ZWQgaW4gdGhlIHZtYWxsb2MgcmVnaW9uIHNvIGFsaWFzIHRoZSBtb2R1bGVzDQo+IG1ldGFkYXRh
IGFkZHJlc3NlcyB0byB0aGUgcmVzcGVjdGl2ZSB2bWFsbG9jIG1ldGFkYXRhIGFkZHJlc3Nlcy4g
RGVmaW5lDQo+IE1PRFVMRVNfVkFERFIgYW5kIE1PRFVMRVNfRU5EIHRvIHRoZSBzdGFydCBhbmQg
ZW5kIG9mIHRoZSB2bWFsbG9jDQo+IHJlZ2lvbi4NCj4gDQo+IFNpbmNlIE1PRFVMRVNfVkFERFIg
d2FzIHByZXZpb3VzbHkgb25seSBkZWZpbmVkIG9uIHBwYzMyIHRhcmdldHMgY2hlY2tzDQo+IGZv
ciBpZiB0aGlzIG1hY3JvIGlzIGRlZmluZWQgbmVlZCB0byBiZSB1cGRhdGVkIHRvIGluY2x1ZGUN
Cj4gZGVmaW5lZChDT05GSUdfUFBDMzIpLg0KDQpXaHkgPw0KDQpJbiB5b3VyIGNhc2UgTU9EVUxF
U19WQUREUiBpcyBhYm92ZSBQQUdFX09GRlNFVCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gDQpkaWZm
ZXJlbmNlLg0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIE1p
ZWhsYnJhZHQgPG5pY2hvbGFzQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgNDIgKysrKysrKysrKysrKysrKysr
KysNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5jICAgICAgICAgICAgICAgICB8ICAy
ICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9w
Z3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0K
PiBpbmRleCBjYjc3ZWRkY2E1NGIuLmIzYTAyYjhkOTZlMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAgLTI0OSw3ICsyNDksMzgg
QEAgZW51bSBwZ3RhYmxlX2luZGV4IHsNCj4gICBleHRlcm4gdW5zaWduZWQgbG9uZyBfX3ZtYWxs
b2Nfc3RhcnQ7DQo+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX192bWFsbG9jX2VuZDsNCj4gICAj
ZGVmaW5lIFZNQUxMT0NfU1RBUlQJX192bWFsbG9jX3N0YXJ0DQo+ICsNCj4gKyNpZm5kZWYgQ09O
RklHX0tNU0FODQo+ICAgI2RlZmluZSBWTUFMTE9DX0VORAlfX3ZtYWxsb2NfZW5kDQo+ICsjZWxz
ZQ0KPiArLyoNCj4gKyAqIEluIEtNU0FOIGJ1aWxkcyB2bWFsbG9jIGFyZWEgaXMgZm91ciB0aW1l
cyBzbWFsbGVyLCBhbmQgdGhlIHJlbWFpbmluZyAzLzQNCj4gKyAqIGFyZSB1c2VkIHRvIGtlZXAg
dGhlIG1ldGFkYXRhIGZvciB2aXJ0dWFsIHBhZ2VzLiBUaGUgbWVtb3J5IGZvcm1lcmx5DQo+ICsg
KiBiZWxvbmdpbmcgdG8gdm1hbGxvYyBhcmVhIGlzIG5vdyBsYWlkIG91dCBhcyBmb2xsb3dzOg0K
PiArICoNCj4gKyAqIDFzdCBxdWFydGVyOiBWTUFMTE9DX1NUQVJUIHRvIFZNQUxMT0NfRU5EIC0g
bmV3IHZtYWxsb2MgYXJlYQ0KPiArICogMm5kIHF1YXJ0ZXI6IEtNU0FOX1ZNQUxMT0NfU0hBRE9X
X1NUQVJUIHRvDQo+ICsgKiAgICAgICAgICAgICAgS01TQU5fVk1BTExPQ19TSEFET1dfU1RBUlQr
Vk1BTExPQ19MRU4gLSB2bWFsbG9jIGFyZWEgc2hhZG93DQo+ICsgKiAzcmQgcXVhcnRlcjogS01T
QU5fVk1BTExPQ19PUklHSU5fU1RBUlQgdG8NCj4gKyAqICAgICAgICAgICAgICBLTVNBTl9WTUFM
TE9DX09SSUdJTl9TVEFSVCtWTUFMTE9DX0xFTiAtIHZtYWxsb2MgYXJlYSBvcmlnaW5zDQo+ICsg
KiA0dGggcXVhcnRlcjogdW51c2VkDQo+ICsgKi8NCj4gKyNkZWZpbmUgVk1BTExPQ19MRU4gKChf
X3ZtYWxsb2NfZW5kIC0gX192bWFsbG9jX3N0YXJ0KSA+PiAyKQ0KPiArI2RlZmluZSBWTUFMTE9D
X0VORCAoVk1BTExPQ19TVEFSVCArIFZNQUxMT0NfTEVOKQ0KPiArDQo+ICsjZGVmaW5lIEtNU0FO
X1ZNQUxMT0NfU0hBRE9XX1NUQVJUIFZNQUxMT0NfRU5EDQo+ICsjZGVmaW5lIEtNU0FOX1ZNQUxM
T0NfT1JJR0lOX1NUQVJUIChWTUFMTE9DX0VORCArIFZNQUxMT0NfTEVOKQ0KPiArDQo+ICsvKg0K
PiArICogTW9kdWxlIG1ldGFkYXRhIGlzIHN0b3JlZCBpbiB0aGUgY29ycmVzcG9uZGluZyB2bWFs
bG9jIG1ldGFkYXRhIHJlZ2lvbnMNCj4gKyAqLw0KPiArI2RlZmluZSBLTVNBTl9NT0RVTEVTX1NI
QURPV19TVEFSVAlLTVNBTl9WTUFMTE9DX1NIQURPV19TVEFSVA0KPiArI2RlZmluZSBLTVNBTl9N
T0RVTEVTX09SSUdJTl9TVEFSVAlLTVNBTl9WTUFMTE9DX09SSUdJTl9TVEFSVA0KPiArI2VuZGlm
IC8qIENPTkZJR19LTVNBTiAqLw0KPiArDQo+ICsjZGVmaW5lIE1PRFVMRVNfVkFERFIgVk1BTExP
Q19TVEFSVA0KPiArI2RlZmluZSBNT0RVTEVTX0VORCBWTUFMTE9DX0VORA0KPiArI2RlZmluZSBN
T0RVTEVTX0xFTgkJKE1PRFVMRVNfRU5EIC0gTU9EVUxFU19WQUREUikNCj4gICANCj4gICBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGludCBpb3JlbWFwX21heF9vcmRlcih2b2lkKQ0KPiAgIHsNCj4g
QEAgLTI2NCw3ICsyOTUsMTggQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19rZXJuZWxfaW9fc3Rh
cnQ7DQo+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19rZXJuZWxfaW9fZW5kOw0KPiAgICNkZWZp
bmUgS0VSTl9WSVJUX1NUQVJUIF9fa2VybmVsX3ZpcnRfc3RhcnQNCj4gICAjZGVmaW5lIEtFUk5f
SU9fU1RBUlQgIF9fa2VybmVsX2lvX3N0YXJ0DQo+ICsjaWZuZGVmIENPTkZJR19LTVNBTg0KPiAg
ICNkZWZpbmUgS0VSTl9JT19FTkQgX19rZXJuZWxfaW9fZW5kDQo+ICsjZWxzZQ0KPiArLyoNCj4g
KyAqIEluIEtNU0FOIGJ1aWxkcyBJTyBzcGFjZSBpcyA0IHRpbWVzIHNtYWxsZXIsIHRoZSByZW1h
aW5pbmcgc3BhY2UgaXMgdXNlZCB0bw0KPiArICogc3RvcmUgbWV0YWRhdGEuIFNlZSBjb21tZW50
IGZvciB2bWFsbG9jIHJlZ2lvbnMgYWJvdmUuDQo+ICsgKi8NCj4gKyNkZWZpbmUgS0VSTl9JT19M
RU4gICAgICAgICAgICAgKChfX2tlcm5lbF9pb19lbmQgLSBfX2tlcm5lbF9pb19zdGFydCkgPj4g
MikNCj4gKyNkZWZpbmUgS0VSTl9JT19FTkQgICAgICAgICAgICAgKEtFUk5fSU9fU1RBUlQgKyBL
RVJOX0lPX0xFTikNCj4gKyNkZWZpbmUgS0VSTl9JT19TSEFET1dfU1RBUlQgICAgS0VSTl9JT19F
TkQNCj4gKyNkZWZpbmUgS0VSTl9JT19PUklHSU5fU1RBUlQgICAgKEtFUk5fSU9fU0hBRE9XX1NU
QVJUICsgS0VSTl9JT19MRU4pDQo+ICsjZW5kaWYgLyogIUNPTkZJR19LTVNBTiAqLw0KPiAgIA0K
PiAgIGV4dGVybiBzdHJ1Y3QgcGFnZSAqdm1lbW1hcDsNCj4gICBleHRlcm4gdW5zaWduZWQgbG9u
ZyBwY2lfaW9fYmFzZTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxl
LmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5jDQo+IGluZGV4IGY2ZDZhZTBhMTY5Mi4u
NTA0M2I5NTlhZDRkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5j
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMNCj4gQEAgLTEwNyw3ICsxMDcs
NyBAQCBfX21vZHVsZV9hbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBib29sDQo+ICAgDQo+ICAgdm9pZCAqbW9kdWxlX2FsbG9j
KHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4gICB7DQo+IC0jaWZkZWYgTU9EVUxFU19WQUREUg0KPiAr
I2lmIGRlZmluZWQoTU9EVUxFU19WQUREUikgJiYgZGVmaW5lZChDT05GSUdfUFBDMzIpDQo+ICAg
CXVuc2lnbmVkIGxvbmcgbGltaXQgPSAodW5zaWduZWQgbG9uZylfZXRleHQgLSBTWl8zMk07DQo+
ICAgCXZvaWQgKnB0ciA9IE5VTEw7DQo+ICAgDQo=
