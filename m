Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC88808CC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 16:56:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YOZeSZ2S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmJmV6LjWz3w5g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 02:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YOZeSZ2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmJlf6LCpz3w0M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 02:55:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLYM6sV46kZxncTSWUQBxusTMaaXH7oKnGVbD7BI8qxyOE9WL7dYYtXdF3wQFcfedGvpJmLmqnhg2g3YqrLBALTsEzbnXG/Kpw3UXJ2xhlmPxcjVaD4XL/exky/3kj5aGla4EnzdBV9n46J1k9ykJOEEKV7MsuuEL/dE2lqdRjBTx7pcThLgxE0Z8VbpMwM6KYv0ezGTKHQR2fUxVsjsE2ko0IAwx9G7IiZtv1LsvNtxPmd2t6GfWnX2Pv7cMuSlwhKC0vMHJTXtPK7VYPwBXxYDtVTSXWz/kg6sdSkYPP561x4p6HjH51xxtSCjP53qRkuxsCdG/HrtNMA9IomCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrfkSntKTnwQ7vkjdpZB+ElOM4lTyG718bIPYfQ3p4g=;
 b=jLJMYTS1A2Op/MKDa1lCxNf2mXsD1RmQzILZgFfBIZo8Nk6tcZGFvUNs2bqtfYcGJ7XU5MH93t9aw79iQI72iyzWVrojHlQ14yFonO/pIk5f5xKgP+46To26Etzj+S5HANvV/yB8W3EoVxN2/WB0O01fRIN3UJUj7PnhQwXyZo7Eh8qP0uXmhwOLqoJxGoYZNunaboKUPlIg8hO+z7fMFknq8AHLx2PuVxncQR9Q9KqyV864BYhBy6PwMJGUkAt3z6KMBkyfL4AY4jcQS7fvZPjhUNJPsLxTMhoHPKh6Yxm4wPkbPvbfyqHEaiBrsbCU2OxT47L03zarvqaR3PMHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrfkSntKTnwQ7vkjdpZB+ElOM4lTyG718bIPYfQ3p4g=;
 b=YOZeSZ2SoLJZm+/SP74Y0sDSO8lzxKF13fmy1JsxSU+jBFhH7CmTVN+YTLj7+4sV1xPs7y5meJJAYKKyKdSk92PyUBFY86PeXAmkebCEDJTFfnBGFNwWMO8elECbYZV/Q8K503fs9/ZLXA3O0jylxgLzZXWzbVuNrIipM8z65K0jIslHpVh7TEW+oqvPyxkHn1VSMgrQ6eYIWO/s62Ot+17yBnnRV3edOy88QckBW876IeskvGICxAPPD4ZCQ57PmBZh59nVyHpvgVSmVPx4EISvEy/D45EO1avHjMh3QGrSg2+EAHZ6jWNHeE4jgs3WpXCZKH4PpM8UwhWINkDpcQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2360.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 15:55:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 15:55:39 +0000
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
Subject: Re: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid TLB
 entries caching
Thread-Topic: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid
 TLB entries caching
Thread-Index: AQHaKR7hrVuLYe1ct0Ou00NCMx7wrrCd+WYA
Date: Thu, 7 Dec 2023 15:55:39 +0000
Message-ID: <6e3fb7b0-f47d-4d2f-b1b8-3ecc047b9ebf@csgroup.eu>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
 <20231207150348.82096-3-alexghiti@rivosinc.com>
In-Reply-To: <20231207150348.82096-3-alexghiti@rivosinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2360:EE_
x-ms-office365-filtering-correlation-id: edc63f17-f907-4257-0848-08dbf73cf576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JcKUaaIuyfpdheZEFhCzlGl18TvoKvNL8HLSOvXdOnSocJ68SJPKYP6hUHMKO1W1WoKem9LQA6oj99lJcP45L9gQsx0iE9n+czXeX7iILqpR0uoDtCKiJ9vkSrXkgzQNMGlJ2ez5t2zWJ2cjA463lOvzd2QkUYf0LGl/+u3zmjr6u8lyifFv2FPS36NQl1iYJvloaSzs/WBn+R+uei7WfcInIUG4rynl/043PVYpW4uO4adv9573p6m6eEIK2gMIV9w2sjfoO6ingA/S0SbfWo3BHyF21NmjfP7DAhbtRicD8fRLPiN7kkmfq0mXK5ufh6xxmcvNoET3laH8SVMlC9Itus6A4ojeolvFqLe+0ick73C9Ui3pC1mM/p9L3QuosqjVBqZTpM+Cdp1R8D6ubtYJawvcqq7DJjjeTyKVBTtSHq4+sSRL75CdczviJvG0PAgb7cGtQgN7776LEUYX0paZFZjDLGyvPmscI3kMXEopElKLkLhkPqJBq5LM0h/+txVAFzm6JFt0Jt2eDNMa7r6x+neVMwd8xRboO7/7FqOxv1OdfHg9LmMkrc+QdWtTIcFXbwLlonxpqYnHgf4yRq46pViktKVgUycXi1GBzBdinRCuARZXpO1ciRNk4HQcdeUJQwj9ufZWM/CjxBEODRc1CpZ28eYoghKSvFkw6axKdNi+jOGff4G2IJlRZtfXUqeJIEM6QeTgMcpylpOuGQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(7416002)(44832011)(5660300002)(2906002)(31686004)(8676002)(8936002)(66476007)(66556008)(66446008)(64756008)(316002)(110136005)(76116006)(66946007)(91956017)(6486002)(478600001)(921008)(38070700009)(2616005)(6512007)(6506007)(41300700001)(36756003)(83380400001)(71200400001)(26005)(38100700002)(66574015)(122000001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M2RvME9UNDJHNUZXTWVUbmpLTU83bGZKUUZ1djBNMVYzSVl2dXJWbVlSUVRJ?=
 =?utf-8?B?dFdTeTdGRVJoN29EblpqaFp2SlpmcitsOGNlcnF5RWxEVGtJVStETlE2N1dZ?=
 =?utf-8?B?REFHendHVUJKVHBnYmdVVnk0TnF5ZW5uMEEwY1NXTzZ4RUlKMERzbDhEQ1Jy?=
 =?utf-8?B?TGNnbmJOV2hNRUNNWktZQ2QvUDFvd0MrTUwzR1A2WEdXYm83QWU3ZGFqbTcy?=
 =?utf-8?B?bFZzTEpzNXFRVGgwRkNjaGNWOFcvZzJKdGRQRElPNmhsUVM5ejdhYk40SGRs?=
 =?utf-8?B?aXRXRVBYUm4vU3djcktwYjgxdlZsbFpRSUZZQ2t0Qmo3UmswRGFmN0VZTTRk?=
 =?utf-8?B?ZXpiTVZ4QzJoZ3p3aFNLdW9RYUZhakhObWdFS2Q1d3hmeHZjN0xlbnpUaTJC?=
 =?utf-8?B?Q2Q5dFRzczlGQ01HZlBDYy9YV0Z4aisvbGZzellySGhRSnBVOHNqVGR6TnlD?=
 =?utf-8?B?bTB1S3lYWnI4dHd3N0ljUTRsZ0xEK2tWMy9kbHBMQWJ5MTNtRGROZnlIZ0hk?=
 =?utf-8?B?RDhXNDJxSkEzOHVZUXlGby9rckEvVFNHa1pGQVhHQ3FxeDJQV2RQVTdmOGl2?=
 =?utf-8?B?VkZ1dVcwb1M1eEdKYjlRajVheWtzaGordWRHYmViTnFqZitITVQ0OU5rVEtV?=
 =?utf-8?B?dVZOQW1rbGtqNDAzb203bzhNbGNwUGdVZUZSU0lqbnI0ZmNoTTRNbHgrZWti?=
 =?utf-8?B?YWRkdTYwS3JrYkdXYTM1R3NMckRlWDRVT1VZYUh3QU5JcWo2SGNVUFN5eDdj?=
 =?utf-8?B?TEVCbmhCMVYrWmprVHlnUWx0a2hhaHNpbUNZZzhPcGh5MmNMd2NMbU5IcDRv?=
 =?utf-8?B?WnVPRDJpTXJiVmJ5cEJiWGpwZWFGQ1I4aEFBWjZSSHF1RUxSbUEzaUNhVjhH?=
 =?utf-8?B?RFRGZHR6NTNpSTd1R0ZaOUE0MUdOZFlYRTFVUjlpNC9oZjl2cW9mR1J2V0sv?=
 =?utf-8?B?dm9JYkN4aFFvTVluR3RuUmFHRVAzZGJUVlh5aFBKQUEwcFBXdnlrYnJGWlpw?=
 =?utf-8?B?SVBPalE4K243UEw0RGx0L2g1c2Z5cjY4REhhTS9QMjI0RjBoY21tcEhqR0hH?=
 =?utf-8?B?QzRRMnhldlFtZjNqbGtoRm9jVERDYUNlcFVoZUlJRzJqemJJTUdWL2pCcFdB?=
 =?utf-8?B?cXB2TDVzMlQrUU9kUjBHOE9keXNJaHB2Z3BHV25MV1pzOXJ5NnRIY3ZnSHZm?=
 =?utf-8?B?THJoUVF2dmlpT21NU0g5djAwR2RRMWxzSW5ubVdPeE5wQ0s5cnczVmwxR1Uw?=
 =?utf-8?B?cU9VcWo3L0lLVUZ4YXZCODRRT21BNDdid1pEbzk0OHk4ZWdzaWR2Yi9GS2N1?=
 =?utf-8?B?UysrVzBXV0g3UXFQa21qVVNLWXVxd08xNUpaUGlmci95WGgwL1hnNk03dlFW?=
 =?utf-8?B?SHBWOHo3cElwcUZqcFg0YjZTUXZKL2V5Q3FsYVVOMGljSmRWMGhVanpOWmJy?=
 =?utf-8?B?bWFZSkRsTThTRXVCNmV1OEtVS2tXOFVJcGRHOWdzR0dETGlMamdMTmU0OXBy?=
 =?utf-8?B?UGR1ZFJJRkM1eURiR0N0azRReDEwTE5PT0hQTTJCME1jQlZWNytkaE5PY2w4?=
 =?utf-8?B?aG1VVjd1WEtwQkpsQ2FYUUxwU1RITDBYdTkzditWakVpcndBSktlUjdFT1Yz?=
 =?utf-8?B?RUoxR1ZkL2RNYXQyMWtyMjhSWkRBTnkwbnowY0N4ZXIvaXEzL2Q4QndSaVFJ?=
 =?utf-8?B?VTY3NmJNZmJoNS9Eb0VWUjFIanJkRW0xQURPRndjazU4c1hIQVBCUDV1djBB?=
 =?utf-8?B?NFU2UCsxaitOKzVFajFaeWVPdTJQNUVnUHJYZ2hFeHlzemNUSE4zajNCVFdH?=
 =?utf-8?B?T1ZLMWpiVVVvN0pURDBCamVsc1Z0dmNXNFkxNUE3TGNtWis3SlZvSXNwdFBl?=
 =?utf-8?B?VEx1RWdxQWdta3pSMlQvL1IyOVBmK2tLWVVCa1dOc1pMN1pIVUxvS1hSbVFh?=
 =?utf-8?B?L1g1bE80K1lNck5mb0MzV1o0UWJGN2lGV3dhak8zZGhDeEN6YnNnU0dSUnFq?=
 =?utf-8?B?VGl5U3d4OTlqdmhENlY2Q2xBelJSRkFBd0pVUzl6V1gxQXlZK3AzcitrUnpF?=
 =?utf-8?B?aUdmT08xNnBZZThjSkc1TmMzZVQ4MnpFc25CZmFnTnRZdm1YS3E5b3h2U01q?=
 =?utf-8?Q?eXsHJGqx6LXQHSPo1Bg9d5qnW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D059D0B91B2E0643800D86CA72527FBD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edc63f17-f907-4257-0848-08dbf73cf576
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 15:55:39.0818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0lm/XRX8wyrB8+xPrQLihUK9rXE102JFPmV1VCtyo+En61MKrm9kGh+VzZeform/lOaAFZsf0P7X3Y09pG1BoQQ20kjV38KocmI86swSBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2360
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

DQoNCkxlIDA3LzEyLzIwMjMgw6AgMTY6MDMsIEFsZXhhbmRyZSBHaGl0aSBhIMOpY3JpdMKgOg0K
PiBUaGlzIG1lY2hhbmlzbSBhbGxvd3MgdG8gY29tcGxldGVseSBieXBhc3MgdGhlIHNmZW5jZS52
bWEgaW50cm9kdWNlZCBieQ0KPiB0aGUgcHJldmlvdXMgY29tbWl0IGZvciB1YXJjaHMgdGhhdCBk
byBub3QgY2FjaGUgaW52YWxpZCBUTEIgZW50cmllcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9y
aXNjdi9tbS9pbml0LmMgfCAxMjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMNCj4g
aW5kZXggMzc5NDAzZGU2YzZmLi4yZTg1NDYxMzc0MGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jDQo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jDQo+IEBAIC01Niw2ICs1
Niw4IEBAIGJvb2wgcGd0YWJsZV9sNV9lbmFibGVkID0gSVNfRU5BQkxFRChDT05GSUdfNjRCSVQp
ICYmICFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSDQo+ICAgRVhQT1JUX1NZTUJPTChwZ3RhYmxl
X2w0X2VuYWJsZWQpOw0KPiAgIEVYUE9SVF9TWU1CT0wocGd0YWJsZV9sNV9lbmFibGVkKTsNCj4g
ICANCj4gK2Jvb2wgdGxiX2NhY2hpbmdfaW52YWxpZF9lbnRyaWVzOw0KPiArDQo+ICAgcGh5c19h
ZGRyX3QgcGh5c19yYW1fYmFzZSBfX3JvX2FmdGVyX2luaXQ7DQo+ICAgRVhQT1JUX1NZTUJPTChw
aHlzX3JhbV9iYXNlKTsNCj4gICANCj4gQEAgLTc1MCw2ICs3NTIsMTggQEAgc3RhdGljIHZvaWQg
X19pbml0IGRpc2FibGVfcGd0YWJsZV9sNCh2b2lkKQ0KPiAgIAlzYXRwX21vZGUgPSBTQVRQX01P
REVfMzk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgX19pbml0IGVuYWJsZV9wZ3RhYmxl
X2w1KHZvaWQpDQo+ICt7DQo+ICsJcGd0YWJsZV9sNV9lbmFibGVkID0gdHJ1ZTsNCj4gKwlzYXRw
X21vZGUgPSBTQVRQX01PREVfNTc7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBl
bmFibGVfcGd0YWJsZV9sNCh2b2lkKQ0KPiArew0KPiArCXBndGFibGVfbDRfZW5hYmxlZCA9IHRy
dWU7DQo+ICsJc2F0cF9tb2RlID0gU0FUUF9NT0RFXzQ4Ow0KPiArfQ0KPiArDQo+ICAgc3RhdGlj
IGludCBfX2luaXQgcHJpbnRfbm80bHZsKGNoYXIgKnApDQo+ICAgew0KPiAgIAlwcl9pbmZvKCJE
aXNhYmxlZCA0LWxldmVsIGFuZCA1LWxldmVsIHBhZ2luZyIpOw0KPiBAQCAtODI2LDYgKzg0MCwx
MTIgQEAgc3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodWludHB0cl90IGR0Yl9wYSkN
Cj4gICAJbWVtc2V0KGVhcmx5X3B1ZCwgMCwgUEFHRV9TSVpFKTsNCj4gICAJbWVtc2V0KGVhcmx5
X3BtZCwgMCwgUEFHRV9TSVpFKTsNCj4gICB9DQo+ICsNCj4gKy8qIERldGVybWluZSBhdCBydW50
aW1lIGlmIHRoZSB1YXJjaCBjYWNoZXMgaW52YWxpZCBUTEIgZW50cmllcyAqLw0KPiArc3RhdGlj
IF9faW5pdCB2b2lkIHNldF90bGJfY2FjaGluZ19pbnZhbGlkX2VudHJpZXModm9pZCkNCj4gK3sN
Cj4gKyNkZWZpbmUgTlJfUkVUUklFU19DQUNISU5HX0lOVkFMSURfRU5UUklFUwk1MA0KDQpMb29r
cyBvZGQgdG8gaGF2ZSBtYWNyb3MgbmVzdGVkIGluIHRoZSBtaWRkbGUgb2YgYSBmdW5jdGlvbi4N
Cg0KPiArCXVpbnRwdHJfdCBzZXRfdGxiX2NhY2hpbmdfaW52YWxpZF9lbnRyaWVzX3BtZCA9ICgo
dW5zaWduZWQgbG9uZylzZXRfdGxiX2NhY2hpbmdfaW52YWxpZF9lbnRyaWVzKSAmIFBNRF9NQVNL
Ow0KPiArCS8vIFRPRE8gdGhlIHRlc3RfYWRkciBhcyBkZWZpbmVkIGJlbG93IGNvdWxkIGdvIGlu
dG8gYW5vdGhlciBwdWQuLi4NCj4gKwl1aW50cHRyX3QgdGVzdF9hZGRyID0gc2V0X3RsYl9jYWNo
aW5nX2ludmFsaWRfZW50cmllc19wbWQgKyAyICogUE1EX1NJWkU7DQo+ICsJcG1kX3QgdmFsaWRf
cG1kOw0KPiArCXU2NCBzYXRwOw0KPiArCWludCBpID0gMDsNCj4gKw0KPiArCS8qIFRvIGVhc2Ug
dGhlIHBhZ2UgdGFibGUgY3JlYXRpb24gKi8NCj4gKwlkaXNhYmxlX3BndGFibGVfbDUoKTsNCj4g
KwlkaXNhYmxlX3BndGFibGVfbDQoKTsNCj4gKw0KPiArCS8qIEVzdGFibGlzaCBhIG1hcHBpbmcg
Zm9yIHNldF90bGJfY2FjaGluZ19pbnZhbGlkX2VudHJpZXMoKSBpbiBzdjM5ICovDQo+ICsJY3Jl
YXRlX3BnZF9tYXBwaW5nKGVhcmx5X3BnX2RpciwNCj4gKwkJCSAgIHNldF90bGJfY2FjaGluZ19p
bnZhbGlkX2VudHJpZXNfcG1kLA0KPiArCQkJICAgKHVpbnRwdHJfdCllYXJseV9wbWQsDQo+ICsJ
CQkgICBQR0RJUl9TSVpFLCBQQUdFX1RBQkxFKTsNCj4gKw0KPiArCS8qIEhhbmRsZSB0aGUgY2Fz
ZSB3aGVyZSBzZXRfdGxiX2NhY2hpbmdfaW52YWxpZF9lbnRyaWVzIHN0cmFkZGxlcyAyIFBNRHMg
Ki8NCj4gKwljcmVhdGVfcG1kX21hcHBpbmcoZWFybHlfcG1kLA0KPiArCQkJICAgc2V0X3RsYl9j
YWNoaW5nX2ludmFsaWRfZW50cmllc19wbWQsDQo+ICsJCQkgICBzZXRfdGxiX2NhY2hpbmdfaW52
YWxpZF9lbnRyaWVzX3BtZCwNCj4gKwkJCSAgIFBNRF9TSVpFLCBQQUdFX0tFUk5FTF9FWEVDKTsN
Cj4gKwljcmVhdGVfcG1kX21hcHBpbmcoZWFybHlfcG1kLA0KPiArCQkJICAgc2V0X3RsYl9jYWNo
aW5nX2ludmFsaWRfZW50cmllc19wbWQgKyBQTURfU0laRSwNCj4gKwkJCSAgIHNldF90bGJfY2Fj
aGluZ19pbnZhbGlkX2VudHJpZXNfcG1kICsgUE1EX1NJWkUsDQo+ICsJCQkgICBQTURfU0laRSwg
UEFHRV9LRVJORUxfRVhFQyk7DQo+ICsNCj4gKwkvKiBFc3RhYmxpc2ggYW4gaW52YWxpZCBtYXBw
aW5nICovDQo+ICsJY3JlYXRlX3BtZF9tYXBwaW5nKGVhcmx5X3BtZCwgdGVzdF9hZGRyLCAwLCBQ
TURfU0laRSwgX19wZ3Byb3QoMCkpOw0KPiArDQo+ICsJLyogUHJlY29tcHV0ZSB0aGUgdmFsaWQg
cG1kIGhlcmUgYmVjYXVzZSB0aGUgbWFwcGluZyBmb3IgcGZuX3BtZCgpIHdvbid0IGV4aXN0ICov
DQo+ICsJdmFsaWRfcG1kID0gcGZuX3BtZChQRk5fRE9XTihzZXRfdGxiX2NhY2hpbmdfaW52YWxp
ZF9lbnRyaWVzX3BtZCksIFBBR0VfS0VSTkVMKTsNCj4gKw0KPiArCWxvY2FsX2ZsdXNoX3RsYl9h
bGwoKTsNCj4gKwlzYXRwID0gUEZOX0RPV04oKHVpbnRwdHJfdCkmZWFybHlfcGdfZGlyKSB8IFNB
VFBfTU9ERV8zOTsNCj4gKwljc3Jfd3JpdGUoQ1NSX1NBVFAsIHNhdHApOw0KPiArDQo+ICsJLyoN
Cj4gKwkgKiBTZXQgc3R2ZWMgdG8gYWZ0ZXIgdGhlIHRyYXBwaW5nIGFjY2VzcywgYWNjZXNzIHRo
aXMgaW52YWxpZCBtYXBwaW5nDQo+ICsJICogYW5kIGxlZ2l0aW1hdGVseSB0cmFwDQo+ICsJICov
DQo+ICsJLy8gVE9ETzogU2hvdWxkIEkgc2F2ZSB0aGUgcHJldmlvdXMgc3R2ZWM/DQo+ICsjZGVm
aW5lIEFTTV9TVFIoeCkJX19BU01fU1RSKHgpDQoNCkxvb2tzIG9kZCB0byBoYXZlIG1hY3JvcyBu
ZXN0ZWQgaW4gdGhlIG1pZGRsZSBvZiBhIGZ1bmN0aW9uLg0KDQoNCj4gKwlhc20gdm9sYXRpbGUo
DQo+ICsJCSJsYSBhMCwgMWYJCQkJXG4iDQo+ICsJCSJjc3J3ICIgQVNNX1NUUihDU1JfVFZFQykg
IiwgYTAJCVxuIg0KPiArCQkibGQgYTAsIDAoJTApCQkJCVxuIg0KPiArCQkiLmFsaWduIDIJCQkJ
XG4iDQo+ICsJCSIxOgkJCQkJXG4iDQo+ICsJCToNCj4gKwkJOiAiciIgKHRlc3RfYWRkcikNCj4g
KwkJOiAiYTAiDQo+ICsJKTsNCj4gKw0KPiArCS8qIE5vdyBlc3RhYmxpc2ggYSB2YWxpZCBtYXBw
aW5nIHRvIGNoZWNrIGlmIHRoZSBpbnZhbGlkIG9uZSBpcyBjYWNoZWQgKi8NCj4gKwllYXJseV9w
bWRbcG1kX2luZGV4KHRlc3RfYWRkcildID0gdmFsaWRfcG1kOw0KPiArDQo+ICsJLyoNCj4gKwkg
KiBBY2Nlc3MgdGhlIHZhbGlkIG1hcHBpbmcgbXVsdGlwbGUgdGltZXM6IGluZGVlZCwgd2UgY2Fu
J3QgdXNlDQo+ICsJICogc2ZlbmNlLnZtYSBhcyBhIGJhcnJpZXIgdG8gbWFrZSBzdXJlIHRoZSBj
cHUgZGlkIG5vdCByZW9yZGVyIGFjY2Vzc2VzDQo+ICsJICogc28gd2UgbWF5IHRyYXAgZXZlbiBp
ZiB0aGUgdWFyY2ggZG9lcyBub3QgY2FjaGUgaW52YWxpZCBlbnRyaWVzLiBCeQ0KPiArCSAqIHRy
eWluZyBhIGZldyB0aW1lcywgd2UgbWFrZSBzdXJlIHRoYXQgdGhvc2UgdWFyY2hzIHdpbGwgc2Vl
IHRoZSByaWdodA0KPiArCSAqIG1hcHBpbmcgYXQgc29tZSBwb2ludC4NCj4gKwkgKi8NCj4gKw0K
PiArCWkgPSBOUl9SRVRSSUVTX0NBQ0hJTkdfSU5WQUxJRF9FTlRSSUVTOw0KPiArDQo+ICsjZGVm
aW5lIEFTTV9TVFIoeCkJX19BU01fU1RSKHgpDQoNCkRlcGxpY2F0ZSBkZWZpbmUgPw0KDQo+ICsJ
YXNtX3ZvbGF0aWxlX2dvdG8oDQo+ICsJCSJsYSBhMCwgMWYJCQkJCVxuIg0KPiArCQkiY3NydyAi
IEFTTV9TVFIoQ1NSX1RWRUMpICIsIGEwCQkJXG4iDQo+ICsJCSIuYWxpZ24gMgkJCQkJXG4iDQo+
ICsJCSIxOgkJCQkJCVxuIg0KPiArCQkiYWRkaSAlMCwgJTAsIC0xCQkJCVxuIg0KPiArCQkiYmx0
ICUwLCB6ZXJvLCAlbFtjYWNoaW5nX2ludmFsaWRfZW50cmllc10JXG4iDQo+ICsJCSJsZCBhMCwg
MCglMSkJCQkJCVxuIg0KPiArCQk6DQo+ICsJCTogInIiIChpKSwgInIiICh0ZXN0X2FkZHIpDQo+
ICsJCTogImEwIg0KPiArCQk6IGNhY2hpbmdfaW52YWxpZF9lbnRyaWVzDQo+ICsJKTsNCj4gKw0K
PiArCWNzcl93cml0ZShDU1JfU0FUUCwgMFVMTCk7DQo+ICsJbG9jYWxfZmx1c2hfdGxiX2FsbCgp
Ow0KPiArDQo+ICsJLyogSWYgd2UgZG9uJ3QgdHJhcCwgdGhlIHVhcmNoIGRvZXMgbm90IGNhY2hl
IGludmFsaWQgZW50cmllcyEgKi8NCj4gKwl0bGJfY2FjaGluZ19pbnZhbGlkX2VudHJpZXMgPSBm
YWxzZTsNCj4gKwlnb3RvIGNsZWFuOw0KPiArDQo+ICtjYWNoaW5nX2ludmFsaWRfZW50cmllczoN
Cj4gKwljc3Jfd3JpdGUoQ1NSX1NBVFAsIDBVTEwpOw0KPiArCWxvY2FsX2ZsdXNoX3RsYl9hbGwo
KTsNCj4gKw0KPiArCXRsYl9jYWNoaW5nX2ludmFsaWRfZW50cmllcyA9IHRydWU7DQo+ICtjbGVh
bjoNCj4gKwltZW1zZXQoZWFybHlfcGdfZGlyLCAwLCBQQUdFX1NJWkUpOw0KPiArCW1lbXNldChl
YXJseV9wbWQsIDAsIFBBR0VfU0laRSk7DQoNClVzZSBjbGVhcl9wYWdlKCkgaW5zdGVhZCA/DQoN
Cj4gKw0KPiArCWVuYWJsZV9wZ3RhYmxlX2w0KCk7DQo+ICsJZW5hYmxlX3BndGFibGVfbDUoKTsN
Cj4gK30NCj4gICAjZW5kaWYNCj4gICANCj4gICAvKg0KPiBAQCAtMTA3Miw2ICsxMTkyLDcgQEAg
YXNtbGlua2FnZSB2b2lkIF9faW5pdCBzZXR1cF92bSh1aW50cHRyX3QgZHRiX3BhKQ0KPiAgICNl
bmRpZg0KPiAgIA0KPiAgICNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkgJiYgIWRlZmluZWQoQ09O
RklHX1hJUF9LRVJORUwpDQo+ICsJc2V0X3RsYl9jYWNoaW5nX2ludmFsaWRfZW50cmllcygpOw0K
PiAgIAlzZXRfc2F0cF9tb2RlKGR0Yl9wYSk7DQo+ICAgI2VuZGlmDQo+ICAgDQo+IEBAIC0xMzIy
LDYgKzE0NDMsOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfdm1fZmluYWwodm9pZCkNCj4g
ICAJbG9jYWxfZmx1c2hfdGxiX2FsbCgpOw0KPiAgIA0KPiAgIAlwdF9vcHNfc2V0X2xhdGUoKTsN
Cj4gKw0KPiArCXByX2luZm8oInVhcmNoIGNhY2hlcyBpbnZhbGlkIGVudHJpZXM6ICVzIiwNCj4g
KwkJdGxiX2NhY2hpbmdfaW52YWxpZF9lbnRyaWVzID8gInllcyIgOiAibm8iKTsNCj4gICB9DQo+
ICAgI2Vsc2UNCj4gICBhc21saW5rYWdlIHZvaWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBk
dGJfcGEpDQo=
