Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAC808DA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 17:38:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P04/jB8H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmKhS5gXsz3vtv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 03:38:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P04/jB8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmKgZ2XTwz3vjB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 03:37:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zpd6JEOBu027tBPJU7oB/5akG3+2EvfZzsZUyUUJmxWbMPbSyypujTXQxNQoUw4qhKYw6lNTq7a+cGBe2gxvWy4e+1QU5uwQlDVs6bkfmmS4t/A9QgVuCpNZdazqjFB5DBWMex9nutPPQaRu1d1D8XXkd/6+wSxUAI+uwmilfZvrUa2RL48HE56AhFiPitrAfZl4vr+jnGi3meYIsKfor2J/T30ulMb7FemNG0+djv+JBGd/TyWHz46MHgf5U6vOJvk1QrjRWUSbZAYU4ZuwYkxr/4zRV/j99iGiqa624HdS+rG1ht6MNOy96PTWwMnzkM4ISZWCtV/C6lz4rVCwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE7Xa5UMplantJV1Cqb5Qq7v9QlAiRrWQD9UHulyp/A=;
 b=RK5AJuE8tAoUcNqJcmS5Y/tvuB5zJMWC/U3hqNfAgEWyHfXXrKZ00se6H4DvQv/aDIrB7iOb54R8tglfpV4TMNsxxqf7eGXpWxM/b/5vJ/896sHWypZpHvxeDU8Qvt3XGBRoBMdSLZvQOwu7bP7XzS4Wu7lbY1PbXChPcBpFD9PfHHyU15CxogYBJh+L3Gw02wh3j37l+76eUgcp/FRVPAEkwv9MMazSvBbiC/NQCs9w2dyW9VlFbue9Q6l3FSpRRvOd3LMkXREwWTeTTX/ZntXN2Im7+k8Nux38jFaZrBIrPCF8oCfNn0H6kME9TzIfq/e08BdTjZobBetKkAsDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE7Xa5UMplantJV1Cqb5Qq7v9QlAiRrWQD9UHulyp/A=;
 b=P04/jB8HiclPxj04nXRPYar8tg2/0KKtlz5NGSBGSNZmoa3ZN+efVIZB6ElC22WqWN0rNrMhbDNllt0PPiGVAFlxj2cspXPb2ZDMqJWfPN9+DNr0yln4NHkhlhLvQoxwx206uyyQohlMSh6dJn4c5fZefxfoPH3BtwmUt1ncKxlQ2fKCNpbNRID5IG5SdJzWw3CYdryp+n4Qe5LCRhNGY5xDR4EMQ1a0HS59v0mOIHKgzPagpt2QOdVAuOW+gXAupW86LdWxQdKAvB22O3FYIlN+V1baLoqFfgkAMXmhk6mKOGany0kmz8YgPZffeLhFRwoumc2f4d+b6qi/iqGTCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1539.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 16:37:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 16:37:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew
 Morton <akpm@linux-foundation.org>, Ved Shanbhogue <ved@rivosinc.com>, Matt
 Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH RFC/RFT 3/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings
Thread-Topic: [PATCH RFC/RFT 3/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings
Thread-Index: AQHaKR8F+unkZ4/+EUu3jqiXnBRIYrCeBPUA
Date: Thu, 7 Dec 2023 16:37:04 +0000
Message-ID: <e783436f-631c-4b02-ba9c-b6145e0e8b5a@csgroup.eu>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
 <20231207150348.82096-4-alexghiti@rivosinc.com>
In-Reply-To: <20231207150348.82096-4-alexghiti@rivosinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1539:EE_
x-ms-office365-filtering-correlation-id: c52e9d6d-7ebc-400c-24f3-08dbf742bf19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XbPANGPD3kbVTo/5FOmmrMPmXr/UpJT+vetmb5Wg6DNxT+jZk9Eyqh7f/lfHt8FFlqbJaiFrFbXHnyr2tpDiO/sT8t0tARi7BwHYn0F8/I1XBOXvZsHWz0P9x6A/r4wO9BGv03SsnLmvtPsNey06+Ay4E3HnGboeHLF/EcMWOJJT+U+T489QY+tzkjjVErjejhcNzOd396Ozo8kO0hhW5ydhDNwyYBtEfZEgb7Fxz0fmuBaZmPy8xCA/OzVnLPibn3xBC7CK1nK+zUlzqSoOMUpXjMgZVwXLfTPxHmm9DrTcVtNL2rM78iGLtctWsIyXWJ91tD9kJoE+R0MxpHRGVT0Upx0b1urc6s5PU6NYJNxP6oQ0nA9omoaVtxGPoGvM8SzoZYf55MZyNZ3Xp/F4r0r4rZ4lyM09wE/1fybvQZgkTcDFcu9kazaiWi3O6JFTw12SX1N9Hmy5qwWSuPYMtNBDGezVvX+svAZ9avuk3SdNDCVSJy0Q+uai+GTP8roQ8HIeSDhEvnC/dxpnw5+tVlfQfJJ4ETOVx7gFFd9DMwZpOpGJLqygUj05aEOGFyaxfJzkMvUEkx3VunrjUWQLPtUanUYoXvYtG/AMaE6qkZ8AdNXPuEY1LPP1DS0imnSL4GuFEUUglSXCASCZ2hL+VXMPLl7cR0PssC/eaTq8vkAtQoDaCzm5hCVUge39PQFQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2616005)(66574015)(6512007)(31686004)(41300700001)(478600001)(38100700002)(6486002)(6506007)(71200400001)(38070700009)(26005)(83380400001)(122000001)(66446008)(66556008)(66476007)(64756008)(91956017)(66946007)(76116006)(316002)(2906002)(44832011)(5660300002)(921008)(7416002)(36756003)(31696002)(86362001)(8936002)(8676002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K0hZYy9McnMzM0JPaXJYMHZhbHNpSFZuekxlOEw4QThWVVpzYlJLR000YjA0?=
 =?utf-8?B?Ky9lTUFhWmhTTHdkcmhSNzRwOGsrQ1NkOG13dldmSHRxTEVKVklrM0hRNGhQ?=
 =?utf-8?B?dUZkMmV0YTJidE1mNUMzV2lldjF0T0xxMlZUdDIrNGlaekJKQ3NKaGpVMjl1?=
 =?utf-8?B?TE5Id1JNN0ZoSG5NRWRpTGw0UWpTTXpodlBHb29VQW1ZT0JBTWtYM3c4VjRs?=
 =?utf-8?B?b2J1WnVLUi9wZHQweU9yekhlRlBWdFByK2E2RTc0WU5uV2pyWjAybjBqTlRS?=
 =?utf-8?B?bjk0K2x4Vm5TdG52OEN5TkNxUjhKdFA0WFZrQ2NQM1R0QzFWKytSWXRBRW5F?=
 =?utf-8?B?R1hST1hWL0pJa3ljVDdSd3Qzemxnd0wvYjREd1hsSHBxVmJCVkd4dGtvTitV?=
 =?utf-8?B?WnFjL1RvaDZUTEdhN2Q3S2orNHlxNGhiTVdkQ0ZEa3VjT0RXMWd1QWVoNGho?=
 =?utf-8?B?TjdDWnJFbzY0RnVzYTVNODB5NG9mSnMyY0RBZmJNVXRxSzlCQkZwVHJTd0N3?=
 =?utf-8?B?cmNLa21tSVVGZEJkd2NQQThxRTczU2NrVFJTSEtiZ1l2UU9PNFFTamJmdVE2?=
 =?utf-8?B?dkFjUEs2MUdtU052MEFzZXU0VHFGTHppTktKb2J5RkNkVXFJbWZGSlZSL0p3?=
 =?utf-8?B?cXBTSmJudUJZaGFoaVN3MkxUNzBMcUZpOFF2SlZlclc3L3lqb0Q1dHNLRm5H?=
 =?utf-8?B?SVFXQXNKYkdoWHlqR2x2RGdsYnFoVFN4dXEydWJZUmNYd2FQNEJFRGVBR1Fh?=
 =?utf-8?B?NVFzR29vcW50Z3c1NmRaUmJ6Qy9XOW1mWk12dW9kU0tQOEZhbEsybncwQkIw?=
 =?utf-8?B?OWEzL3pTYmZyOTBFdkU2VW41NGtiSnJRcGdXbEVRMkExK2l3RHhpM1QvaUF5?=
 =?utf-8?B?VkNablczbFc1aHFWb24rbVhHb2QyMElVUUFjMnZUUmFNalVGUTJ1SnNXRWlI?=
 =?utf-8?B?QjBwRklXN1Zya2JWSm16RWtYN3VTOGtxTDRNekowV0ZCS1ZDd3NEU0FLUGox?=
 =?utf-8?B?SGFldlRYQkxvTEp1eWpGSEdkSU1rMU5zY0VGRS94NlNSRWErUXdrOHRTR1Bl?=
 =?utf-8?B?QXg5eC9zMUpNZkxwUW5Cejl3clkwUnpBUlRHS3ltZUZpdWZubzJjK2hUdUl6?=
 =?utf-8?B?b0VLUEZHNGhHcFc3NWoyWVBZTEI2ellUTzlkOXJOcExGaUtUV1JqNk1HNnFv?=
 =?utf-8?B?cHVYd2Q2TE9ROTgrWkdLUG5VZWtPVEVjSkVZcHorOXBRVWNQbGJZTFBldlcv?=
 =?utf-8?B?clZ4SWhzQmhjN1piVWtvNmRqdTBkVXJUVkVzMy9jd3NIM0Y4OHJDZk9HWVFK?=
 =?utf-8?B?V01HcitkekhuYkpzQkRtNkVpNkptQnlaS3dpN2RYNTljSjg2WWd4Ulo1Q1Z3?=
 =?utf-8?B?SEJKSTFUR2FmZG1qMSsxTzdoeHVrVzJHVmU1SThwMUtCSllpUlN0RStTUnV1?=
 =?utf-8?B?QjBKNWZFYjJoMldaeVptVzkybEpFNG03OTFpTFZXdHFvUmtyRWljYjFvbzNM?=
 =?utf-8?B?elhWN1hDbVFzOXRZUmxvVmdkU0dFREVzT0ZzT3A5T0RadFcyWFd3U0tmMC92?=
 =?utf-8?B?VktRMk1sUy9MWDh1bGVtOXlmWXE2R2R4ckc0WUtMK0xmanpQQy83b2FLby9z?=
 =?utf-8?B?Z1dabkJkZ1UzQkdJSHBRYy8wMVkxbzlEOS9icUVzbjNDUzhHVW02VFF0WEZv?=
 =?utf-8?B?ZXpMSnl1NVlJQU9adG42bEVaMnFXb3ZlRk85ZXR6SzBaeWVaeUFkd1hONTU4?=
 =?utf-8?B?ZDdPUUJlUkNqVjRMU2tWZGhsYjVrTTJJc1p5dVNPV01BRnlKNys4WEkvREl1?=
 =?utf-8?B?am1yODJML0I2TUQ5UTRubWgxZjV5aWhXNnVaTGRkRGhKUzZPYjBBbzFyWElT?=
 =?utf-8?B?VGNuZTErY2F1NVVpVGhQd0VmNEpZZnpmNCsraEdESkhPblVnN3VVekFpMStH?=
 =?utf-8?B?K0VyYU9sTHRtTDgyQ1QxQWp0aWl3bFI5aFZBL2pxSnVibzMxSFJOZHhwdjQx?=
 =?utf-8?B?VU1udm5YWVQ1bDRYSVhGd0VRemw1WEhiVHgyK0NENCsrUXQrSHY0R1B3VzZp?=
 =?utf-8?B?bmEzSm5VR090VEZvRkdOK3F3MlI5dFJEZjdWWGQ5TmZwNXUwTkdJREp0YTk4?=
 =?utf-8?B?L0RaOUNFVEJHWUN5bnh1U0JXeXhTdVVVU0JMS2U3c041dXRpOStpNjdDbkhz?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <029250F2587C7148836768CB07FB6CC2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c52e9d6d-7ebc-400c-24f3-08dbf742bf19
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 16:37:04.8738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8MgX78V0pbyrOmFQgRyXPtZ+Un7cm6QvX/twr3wdmUEbUS7M8t30uvczrWZL4tLpycLlwRtvX8jgwQlTcGHCmer1/Ftrbokba1R9uTqMnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1539
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

VGhlIHN1YmplY3Qgc2F5cyAicmlzY3Y6IiBidXQgaXQgY2hhbmdlcyBjb3JlIHBhcnQgYW5kIHNl
dmVyYWwgYXJjaC4gDQpNYXliZSB0aGlzIGNvbW1pdCBzaG91bGQgYmUgc3BsaXQgaW4gdHdvIGNv
bW1pdHMsIG9uZSBmb3IgQVBJIGNoYW5nZXMgDQp0aGF0IGNoYW5nZXMgZmx1c2hfdGxiX2ZpeF9z
cHVyaW91c19mYXVsdCgpIHRvIA0KZmx1c2hfdGxiX2ZpeF9zcHVyaW91c193cml0ZV9mYXVsdCgp
IGFuZCBhZGRzIA0KZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19yZWFkX2ZhdWx0KCkgaW5jbHVkaW5n
IHRoZSBjaGFuZ2UgaW4gbWVtb3J5LmMsIA0KdGhlbiBhIHNlY29uZCBwYXRjaCB3aXRoIHRoZSBj
aGFuZ2VzIHRvIHJpc2N2Lg0KDQpMZSAwNy8xMi8yMDIzIMOgIDE2OjAzLCBBbGV4YW5kcmUgR2hp
dGkgYSDDqWNyaXTCoDoNCj4gVGhlIHByZXZlbnRpdmUgc2ZlbmNlLnZtYSB3ZXJlIGVtaXR0ZWQg
YmVjYXVzZSBuZXcgbWFwcGluZ3MgbXVzdCBiZSBtYWRlDQo+IHZpc2libGUgdG8gdGhlIHBhZ2Ug
dGFibGUgd2Fsa2VyLCBlaXRoZXIgdGhlIHVhcmNoIGNhY2hlcyBpbnZhbGlkDQo+IGVudHJpZXMg
b3Igbm90Lg0KPiANCj4gQWN0dWFsbHksIHRoZXJlIGlzIG5vIG5lZWQgdG8gcHJldmVudGl2ZWx5
IHNmZW5jZS52bWEgb24gbmV3IG1hcHBpbmdzIGZvcg0KPiB1c2Vyc3BhY2UsIHRoaXMgc2hvdWxk
IGJlIGhhbmRsZWQgb25seSBpbiB0aGUgcGFnZSBmYXVsdCBwYXRoLg0KPiANCj4gVGhpcyBhbGxv
d3MgdG8gZHJhc3RpY2FsbHkgcmVkdWNlIHRoZSBudW1iZXIgb2Ygc2ZlbmNlLnZtYSBlbWl0dGVk
Og0KPiANCj4gKiBVYnVudHUgYm9vdCB0byBsb2dpbjoNCj4gQmVmb3JlOiB+NjMwayBzZmVuY2Uu
dm1hDQo+IEFmdGVyOiAgfjIwMGsgc2ZlbmNlLnZtYQ0KPiANCj4gKiBsdHAgLSBtbWFwc3RyZXNz
MDENCj4gQmVmb3JlOiB+NDVrDQo+IEFmdGVyOiAgfjYuM2sNCj4gDQo+ICogbG1iZW5jaCAtIGxh
dF9wYWdlZmF1bHQNCj4gQmVmb3JlOiB+NjY1aw0KPiBBZnRlcjogICA4MzIgKCEpDQo+IA0KPiAq
IGxtYmVuY2ggLSBsYXRfbW1hcA0KPiBCZWZvcmU6IH41NDZrDQo+IEFmdGVyOiAgIDcxOCAoISkN
Cj4gDQo+IFRoZSBvbmx5IGlzc3VlIHdpdGggdGhlIHJlbW92YWwgb2Ygc2ZlbmNlLnZtYSBpbiB1
cGRhdGVfbW11X2NhY2hlKCkgaXMNCj4gdGhhdCBvbiB1YXJjaHMgdGhhdCBjYWNoZSBpbnZhbGlk
IGVudHJpZXMsIHRob3NlIHdvbid0IGJlIGludmFsaWRhdGVkDQo+IHVudGlsIHRoZSBwcm9jZXNz
IHRha2VzIGEgZmF1bHQ6IHNvIHRoYXQncyBhbiBhZGRpdGlvbmFsIGZhdWx0IGluIHRob3NlDQo+
IGNhc2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPg0KPiAtLS0NCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUu
aCAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggICAgICAgICAgICAgICB8ICA2ICstLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvNjQvdGxiZmx1c2guaCB8ICA4ICsrLS0NCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaCAgICAgICAgICAgICAgfCA0MyArKysrKysrKysrKy0tLS0tLS0tDQo+ICAgaW5j
bHVkZS9saW51eC9wZ3RhYmxlLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrLQ0KPiAg
IG1tL21lbW9yeS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysr
LQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0p
DQoNCkRpZCB5b3UgZm9yZ2V0IG1tL3BndGFibGUtZ2VuZXJpYy5jID8NCg0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggN2Y3ZDliMWRmNGU1Li43MjhmMjVmNTI5YTUgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC01Nyw3ICs1Nyw3IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBhcmNoX3RocF9zd3Bfc3VwcG9ydGVkKHZvaWQpDQo+ICAgICogZmF1bHQg
b24gb25lIENQVSB3aGljaCBoYXMgYmVlbiBoYW5kbGVkIGNvbmN1cnJlbnRseSBieSBhbm90aGVy
IENQVQ0KPiAgICAqIGRvZXMgbm90IG5lZWQgdG8gcGVyZm9ybSBhZGRpdGlvbmFsIGludmFsaWRh
dGlvbi4NCj4gICAgKi8NCj4gLSNkZWZpbmUgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdCh2
bWEsIGFkZHJlc3MsIHB0ZXApIGRvIHsgfSB3aGlsZSAoMCkNCj4gKyNkZWZpbmUgZmx1c2hfdGxi
X2ZpeF9zcHVyaW91c193cml0ZV9mYXVsdCh2bWEsIGFkZHJlc3MsIHB0ZXApIGRvIHsgfSB3aGls
ZSAoMCkNCg0KV2h5IGRvIHlvdSBuZWVkIHRvIGRvIHRoYXQgY2hhbmdlID8gTm90aGluZyBpcyBl
eHBsYWluZWQgYWJvdXQgdGhhdCBpbiANCnRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiAgIA0KPiAg
IC8qDQo+ICAgICogWkVST19QQUdFIGlzIGEgZ2xvYmFsIHNoYXJlZCBwYWdlIHRoYXQgaXMgYWx3
YXlzIHplcm86IHVzZWQNCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDQzMGIyMDhj
MDEzMC4uODQ0MzlmZTZlZDI5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20v
cGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAg
LTQ3OCw5ICs0NzgsOSBAQCBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF93cml0ZWNvbWJp
bmUocGdwcm90X3QgX3Byb3QpDQo+ICAgCXJldHVybiBfX3BncHJvdChwcm90KTsNCj4gICB9DQo+
ICAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdChz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gLQkJCQkJCXVuc2lnbmVkIGxvbmcgYWRkcmVz
cywNCj4gLQkJCQkJCXB0ZV90ICpwdGVwKQ0KPiArc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3Rs
Yl9maXhfc3B1cmlvdXNfd3JpdGVfZmF1bHQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+
ICsJCQkJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsDQo+ICsJCQkJCQkgICAgICBwdGVf
dCAqcHRlcCkNCj4gICB7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+IGluZGV4IDE5NTBjMWI4MjViNC4uNzE2NmQ1NmY5
MGRiIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Rs
YmZsdXNoLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJm
bHVzaC5oDQo+IEBAIC0xMjgsMTAgKzEyOCwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hf
dGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgI2RlZmluZSBmbHVzaF90
bGJfcGFnZSh2bWEsIGFkZHIpCWxvY2FsX2ZsdXNoX3RsYl9wYWdlKHZtYSwgYWRkcikNCj4gICAj
ZW5kaWYgLyogQ09ORklHX1NNUCAqLw0KPiAgIA0KPiAtI2RlZmluZSBmbHVzaF90bGJfZml4X3Nw
dXJpb3VzX2ZhdWx0IGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQNCj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBmbHVzaF90bGJfZml4X3NwdXJpb3VzX2ZhdWx0KHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLA0KPiAtCQkJCQkJdW5zaWduZWQgbG9uZyBhZGRyZXNzLA0KPiAtCQkJCQkJcHRlX3Qg
KnB0ZXApDQo+ICsjZGVmaW5lIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfd3JpdGVfZmF1bHQgZmx1
c2hfdGxiX2ZpeF9zcHVyaW91c193cml0ZV9mYXVsdA0KPiArc3RhdGljIGlubGluZSB2b2lkIGZs
dXNoX3RsYl9maXhfc3B1cmlvdXNfd3JpdGVfZmF1bHQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsDQo+ICsJCQkJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsDQo+ICsJCQkJCQkgICAg
ICBwdGVfdCAqcHRlcCkNCj4gICB7DQo+ICAgCS8qDQo+ICAgCSAqIEJvb2szUyA2NCBkb2VzIG5v
dCByZXF1aXJlIHNwdXJpb3VzIGZhdWx0IGZsdXNoZXMgYmVjYXVzZSB0aGUgUFRFDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IGIyYmEzZjc5Y2ZlOS4uODlhYTU2NTBmMTA0IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtNDcyLDI4ICs0NzIsMjAgQEAg
c3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uoc3RydWN0IHZtX2ZhdWx0
ICp2bWYsDQo+ICAgCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBh
ZGRyZXNzLA0KPiAgIAkJcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikNCj4gICB7DQo+IC0J
LyoNCj4gLQkgKiBUaGUga2VybmVsIGFzc3VtZXMgdGhhdCBUTEJzIGRvbid0IGNhY2hlIGludmFs
aWQgZW50cmllcywgYnV0DQo+IC0JICogaW4gUklTQy1WLCBTRkVOQ0UuVk1BIHNwZWNpZmllcyBh
biBvcmRlcmluZyBjb25zdHJhaW50LCBub3QgYQ0KPiAtCSAqIGNhY2hlIGZsdXNoOyBpdCBpcyBu
ZWNlc3NhcnkgZXZlbiBhZnRlciB3cml0aW5nIGludmFsaWQgZW50cmllcy4NCj4gLQkgKiBSZWx5
aW5nIG9uIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgd291bGQgc3VmZmljZSwgYnV0DQo+
IC0JICogdGhlIGV4dHJhIHRyYXBzIHJlZHVjZSBwZXJmb3JtYW5jZS4gIFNvLCBlYWdlcmx5IFNG
RU5DRS5WTUEuDQo+IC0JICovDQo+IC0Jd2hpbGUgKG5yLS0pDQo+IC0JCWxvY2FsX2ZsdXNoX3Rs
Yl9wYWdlKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7DQo+ICAgfQ0KPiAgICNkZWZpbmUgdXBk
YXRlX21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXApIFwNCj4gICAJdXBkYXRlX21tdV9jYWNoZV9y
YW5nZShOVUxMLCB2bWEsIGFkZHIsIHB0ZXAsIDEpDQo+ICAgDQo+ICAgI2RlZmluZSBfX0hBVkVf
QVJDSF9VUERBVEVfTU1VX1RMQg0KPiAtI2RlZmluZSB1cGRhdGVfbW11X3RsYiB1cGRhdGVfbW11
X2NhY2hlDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV90bGIoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsDQo+ICsJCQkJICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90ICpw
dGVwKQ0KPiArew0KPiArCWZsdXNoX3RsYl9yYW5nZSh2bWEsIGFkZHJlc3MsIGFkZHJlc3MgKyBQ
QUdFX1NJWkUpOw0KPiArfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11
X2NhY2hlX3BtZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJCXVuc2lnbmVkIGxv
bmcgYWRkcmVzcywgcG1kX3QgKnBtZHApDQo+ICAgew0KPiAtCXB0ZV90ICpwdGVwID0gKHB0ZV90
ICopcG1kcDsNCj4gLQ0KPiAtCXVwZGF0ZV9tbXVfY2FjaGUodm1hLCBhZGRyZXNzLCBwdGVwKTsN
Cj4gICB9DQo+ICAgDQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVfU0FNRQ0KPiBAQCAtNTQ4
LDEzICs1NDAsMjYgQEAgc3RhdGljIGlubGluZSBpbnQgcHRlcF9zZXRfYWNjZXNzX2ZsYWdzKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAkJCQkJdW5zaWduZWQgbG9uZyBhZGRyZXNz
LCBwdGVfdCAqcHRlcCwNCj4gICAJCQkJCXB0ZV90IGVudHJ5LCBpbnQgZGlydHkpDQo+ICAgew0K
PiAtCWlmICghcHRlX3NhbWUoKnB0ZXAsIGVudHJ5KSkNCj4gKwlpZiAoIXB0ZV9zYW1lKCpwdGVw
LCBlbnRyeSkpIHsNCj4gICAJCV9fc2V0X3B0ZV9hdChwdGVwLCBlbnRyeSk7DQo+IC0JLyoNCj4g
LQkgKiB1cGRhdGVfbW11X2NhY2hlIHdpbGwgdW5jb25kaXRpb25hbGx5IGV4ZWN1dGUsIGhhbmRs
aW5nIGJvdGgNCj4gLQkgKiB0aGUgY2FzZSB0aGF0IHRoZSBQVEUgY2hhbmdlZCBhbmQgdGhlIHNw
dXJpb3VzIGZhdWx0IGNhc2UuDQo+IC0JICovDQo+IC0JcmV0dXJuIHRydWU7DQo+ICsJCS8qIEhl
cmUgb25seSBub3Qgc3ZhZHUgaXMgaW1wYWN0ZWQgKi8NCj4gKwkJZmx1c2hfdGxiX3BhZ2Uodm1h
LCBhZGRyZXNzKTsNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIGZh
bHNlOw0KPiArfQ0KPiArDQo+ICtleHRlcm4gdTY0IG5yX3NmZW5jZV92bWFfaGFuZGxlX2V4Y2Vw
dGlvbjsNCj4gK2V4dGVybiBib29sIHRsYl9jYWNoaW5nX2ludmFsaWRfZW50cmllczsNCj4gKw0K
PiArI2RlZmluZSBmbHVzaF90bGJfZml4X3NwdXJpb3VzX3JlYWRfZmF1bHQgZmx1c2hfdGxiX2Zp
eF9zcHVyaW91c19yZWFkX2ZhdWx0DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX2Zp
eF9zcHVyaW91c19yZWFkX2ZhdWx0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiArCQkJ
CQkJICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsDQo+ICsJCQkJCQkgICAgIHB0ZV90ICpwdGVw
KQ0KPiArew0KPiArCWlmICh0bGJfY2FjaGluZ19pbnZhbGlkX2VudHJpZXMpDQo+ICsJCWZsdXNo
X3RsYl9wYWdlKHZtYSwgYWRkcmVzcyk7DQo+ICAgfQ0KPiAgIA0KPiAgICNkZWZpbmUgX19IQVZF
X0FSQ0hfUFRFUF9HRVRfQU5EX0NMRUFSDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Bn
dGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+IGluZGV4IGFmNzYzOWMzYjBhMy4u
N2FiYWY0MmVmNjEyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KPiAr
KysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KPiBAQCAtOTMxLDggKzkzMSwxMiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgYXJjaF9zd2FwX3Jlc3RvcmUoc3dwX2VudHJ5X3QgZW50cnksIHN0cnVj
dCBmb2xpbyAqZm9saW8pDQo+ICAgIyBkZWZpbmUgcHRlX2FjY2Vzc2libGUobW0sIHB0ZSkJKCh2
b2lkKShwdGUpLCAxKQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtI2lmbmRlZiBmbHVzaF90bGJfZml4
X3NwdXJpb3VzX2ZhdWx0DQo+IC0jZGVmaW5lIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQo
dm1hLCBhZGRyZXNzLCBwdGVwKSBmbHVzaF90bGJfcGFnZSh2bWEsIGFkZHJlc3MpDQo+ICsjaWZu
ZGVmIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfd3JpdGVfZmF1bHQNCj4gKyNkZWZpbmUgZmx1c2hf
dGxiX2ZpeF9zcHVyaW91c193cml0ZV9mYXVsdCh2bWEsIGFkZHJlc3MsIHB0ZXApIGZsdXNoX3Rs
Yl9wYWdlKHZtYSwgYWRkcmVzcykNCj4gKyNlbmRpZg0KPiArDQo+ICsjaWZuZGVmIGZsdXNoX3Rs
Yl9maXhfc3B1cmlvdXNfcmVhZF9mYXVsdA0KPiArI2RlZmluZSBmbHVzaF90bGJfZml4X3NwdXJp
b3VzX3JlYWRfZmF1bHQodm1hLCBhZGRyZXNzLCBwdGVwKQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAg
IC8qDQo+IGRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jDQo+IGluZGV4IDUx
NzIyMWYwMTMwMy4uNWNiMGNjZjBjMDNmIDEwMDY0NA0KPiAtLS0gYS9tbS9tZW1vcnkuYw0KPiAr
KysgYi9tbS9tZW1vcnkuYw0KPiBAQCAtNTAxNCw4ICs1MDE0LDE2IEBAIHN0YXRpYyB2bV9mYXVs
dF90IGhhbmRsZV9wdGVfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+ICAgCQkgKiB3aXRo
IHRocmVhZHMuDQo+ICAgCQkgKi8NCj4gICAJCWlmICh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19X
UklURSkNCj4gLQkJCWZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQodm1mLT52bWEsIHZtZi0+
YWRkcmVzcywNCj4gLQkJCQkJCSAgICAgdm1mLT5wdGUpOw0KPiArCQkJZmx1c2hfdGxiX2ZpeF9z
cHVyaW91c193cml0ZV9mYXVsdCh2bWYtPnZtYSwgdm1mLT5hZGRyZXNzLA0KPiArCQkJCQkJCSAg
IHZtZi0+cHRlKTsNCj4gKwkJZWxzZQ0KPiArCQkJLyoNCj4gKwkJCSAqIFdpdGggdGhlIHB0ZV9z
YW1lKHB0ZXBfZ2V0KHZtZi0+cHRlKSwgZW50cnkpIGNoZWNrDQo+ICsJCQkgKiB0aGF0IGNhbGxz
IHVwZGF0ZV9tbXVfdGxiKCkgYWJvdmUsIG11bHRpcGxlIHRocmVhZHMNCj4gKwkJCSAqIGZhdWx0
aW5nIGF0IHRoZSBzYW1lIHRpbWUgd29uJ3QgZ2V0IHRoZXJlLg0KPiArCQkJICovDQo+ICsJCQlm
bHVzaF90bGJfZml4X3NwdXJpb3VzX3JlYWRfZmF1bHQodm1mLT52bWEsIHZtZi0+YWRkcmVzcywN
Cj4gKwkJCQkJCQkgIHZtZi0+cHRlKTsNCj4gICAJfQ0KPiAgIHVubG9jazoNCj4gICAJcHRlX3Vu
bWFwX3VubG9jayh2bWYtPnB0ZSwgdm1mLT5wdGwpOw0K
