Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A95AFBC9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 07:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMrXY03qYz3bq5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 15:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fgZDLspw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fgZDLspw;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMrWk5C7Bz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 15:33:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THpbXgeJek2Vzi1q7gWFP4Ke7wTKlrtPpies88Hba1NDuheZSYQgIArMZ/98AoD3g7KS7RFSVFeyQuFkmvtqritWYXr96UbEQbH1WHlZCeCSNF1Dq0vmb+lp4Hku0ls7osNYTf/32uQmkfU5z9kfeAQvgWWLMD9PxUsqqu5aFFmFjhvz2uTRpWGVuWAc9onfHxjMUY0Vlq1xW45Gs8o7COxk5DF4XFgLRnJFTaFp/SINkjhZ/J/PuyvUQpMbNgw/QwuM2i64HYMO80Fj7XAcLyWoyAbf8uIfPO1lSOQmISPuH1fhsSgEpByHsSQPITt8548ZK2bF7f9dJS6RaBgjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK32BsJrF381XfgkEvurDdP0rAf1UBdmy1x8q7SeRB4=;
 b=Ha4jpvlr4og/XLDJCaNHWtcWyIw75MAf0VLPqntJfTnUClvNzIslPxtG/9Hcdk9v1rYqg2TLQ51iwgfkbPxDZFlZwjyb65LrzLLpN43B9VzCABb1f0JGb43UIBzVpmBV1ArZaQRclIQUi00BF2g8AmR1KbFjLywL1Zks4j7AfWV2KyEOKqB8vA0KkK0pSzXXX7YMB0OWV8MC9AiTS+4BDA+4iI+0GCHK+LLAiWyXigPbm+3o3B0yVxbLX/ArS8wQiLqICfwZqh0ZVCMF62ZUVYexQA8LPu6pTwOthNbBdjQgEOv2vhijk0vLc+BQjW4Fw73PW37Lavo6mU0xU9VjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK32BsJrF381XfgkEvurDdP0rAf1UBdmy1x8q7SeRB4=;
 b=fgZDLspwSiHcO67vzDhRD768Ty4tjH3/BvDSsLMgsB0giibWwkqjrx+KV9UsYfQNJ9Nlioh5he4JxfJ8o1wuvbK+txhLfi4Zjjz6EI/LPXlcR++X/cTWu5DuuuE2hyTEgPx0a05vK9hBwG+qPSdNMl2OmNxauva3kqm10jQiERFfKr/bCpxlmKw+jMAqmMMF0e5emh0jqr6DELIWRh8V9SJzDUaju6GaFUEMWNy7C2MHoaEnTFVqOT5DIFnIeHiRpcd8sOQx41PbmRjWreyZI0O0M3JjzqGPVbX+yk8HQGVW7v/1JZRkVRQ7RcauS8Z5kJUAFqBzwEzaR9UeXxAi0A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 05:33:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 05:33:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/vdso: link with -z noexecstack
Thread-Topic: [PATCH v2] powerpc/vdso: link with -z noexecstack
Thread-Index: AQHYvuBFITegECW2Q0Op93BLfBI7R63TaQGAgAAP1AA=
Date: Wed, 7 Sep 2022 05:33:00 +0000
Message-ID: <73866ab0-a5d8-7afb-2e57-a12789617b64@csgroup.eu>
References:  <b95f2e3216a574837dd61208444e9515c3423da4.1662132312.git.christophe.leroy@csgroup.eu>
 <CMPW28H38HE0.W6BB976O6ULP@bobo>
In-Reply-To: <CMPW28H38HE0.W6BB976O6ULP@bobo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6a4d0c0-d839-41ea-9693-08da90926dcb
x-ms-traffictypediagnostic: PR0P264MB3032:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6hFURMrg4sIFXi08SrImwCwthA0Hfhcxu7xGy48q5YcOrgjlKxSHPEP97+vFKsmZuMdijPCdquI5AV1dOO+y4aS/oXkN8lFXfyx4wJoH4Q4uVgM3R9SH4c0QH3rxTkPsgN8baDE88RDkW3c69/UNL49hPgfnu1o8t02wwTaVRW3RwNffRMGM1Kxdx+KaCJq9bqKhaLaa0O9GKthKgO4EjsuAwTNifku4vHNthx7Tqx4v9p6hyJEKhhp/xWp58DmKon1nCgPqRSS+jY/2S4/Yu3cKloiaiRYxps4Nm7ZSmZsXdqF53TbLJLWcdFa/du8MvDJIyDLrDo7Or1cH+lorUKgDs4v1L/1biBATDtarPm+/HBQXplrFfPgG41w+4FxgyEKOSkDjYyrwWYsc8Bv7plPkEA91czIrdligWJeNEUqTb0lnk3bwN/3hVpuqqH0xBQbg0VWKHie9JedgFyKA0eisP33CiaSgmoLmP8SljXi4d/eGLTb4ipA/brQsUtd/iu0GYkiVdOSUrjPMUmspTdHFiGZbWAZetO8rGaC1uxVRyGxbu0vIzFq/p/yqY7zoqeeQkWzmWNJc/Kv0Oh88jQDs1lltgjpKk8cNQK96V0JQ6KqwZjamD9+50qhO0J6Sw4Uua/02GwoHgDciFBeXfhX5Bh9L0/tF3GspDKwOyeVMB+AzRoEBjrPB1UQQp4psCu81cztTI+NEYL6Y0LQcUg1QrW89ovzQ6orE46i2fIx0N2H7FbK64DEczK1mQSwH+Dx4CsDIUbJ8EwHY0s3bTEsrFkT9XPdGFGIkFYfYlPF3L8upq3GcNMoTLfbBJRTUP7fxODz1zAH6D9j98rM79w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(38070700005)(2906002)(66946007)(38100700002)(83380400001)(122000001)(8676002)(66476007)(316002)(76116006)(66556008)(64756008)(66446008)(91956017)(54906003)(4326008)(110136005)(44832011)(66574015)(26005)(186003)(2616005)(5660300002)(6512007)(6506007)(41300700001)(71200400001)(6486002)(478600001)(8936002)(86362001)(31696002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RkwySVFZN1htTkNrYUd2KzI1TS9LdW1UU21abmJleFJ3QWpJMzNLdlFPUk5P?=
 =?utf-8?B?cDhoT29teURDTFFZRGUwQ0QrTFN2OWlINUREeWdvTVBONlZiN0VwMndvS1Vu?=
 =?utf-8?B?QXFFdWxWcEF1ZTFIMVpYUmk0NTlDcUUyTmdmZXpPQnR6Q2k3V281eWNqaDZw?=
 =?utf-8?B?ZzYxeTJ2NFpWVmZuU1Aybnc4TU5oOVMrT2pHbjJDZW1rbEszbDlua1hpZ3U3?=
 =?utf-8?B?RDgxNGxoYmIxV0hpSUJUNHpoblB0blpGeHNiZkdZZHZwNXlYZHZYaVd0MFdm?=
 =?utf-8?B?S1o4R3oza3JMSExDZ21kbWt6RWRYQnhoTnRWS2NxVGdrQjV3bkFESWRKZUk1?=
 =?utf-8?B?ektWUXVQU1hodEZGZndINnY1UGlDSlRBSnFtZEpaZEN2emJEL2ZoNWtIOHk4?=
 =?utf-8?B?NjBMaGtGcnk3bzBpa0s5emljZG9Xeng5RnYzNzhnUHA5WldRa2VLby9sQ3pG?=
 =?utf-8?B?UlAzT011SVVxd2VTOTMxanRFbzFyMjNFWURoSGNDVkFXQnkwZ1JHVjZ1UWNx?=
 =?utf-8?B?TDZIZnNJbmphZ3Izblhvc3pjWVYwUEJ2Vkp0TVpIcjFrMFJFdlNzZlBLMjJa?=
 =?utf-8?B?V0FVS3NsdDBqaHVzZHhsdGM3QUF4dW1Id2hPelVXNldtU3dLWmc3Uk1LYlRI?=
 =?utf-8?B?a1J4eWgydWR4Vmx6U0tUQmd2N1JRYUcrQXR2cGh3Z2o2RGxhN2xCUGxiK3R3?=
 =?utf-8?B?UlR0dU9NOFBzbzFHVUp3L1Fic0E1cEJUZ0RXTDA3NERoOFhXaHRiVm5BWG9V?=
 =?utf-8?B?Uk5qa2wyNCtlbGhCTnhuRUkvbWJJR0U1ZUpOdE1NQkVHZVlFUEpZaVZXeHFj?=
 =?utf-8?B?Q0NDcS9ZZTJrem9vZjFPV2s0SFV1MjFKbkJCZnI5eVJNUWVTL1EzMTFLN0ZT?=
 =?utf-8?B?NzhDc2xBcnVoQ0RUa2paNzJBcGxzRXRVbFVqVTg4bWwxVmk5UlVqd3ZrNlkz?=
 =?utf-8?B?NklvUzZNR1Y5bWN2NVpaZDdGSHFaRTZsMFFuN2paaDN5MVhmYVZLRGpvcXRZ?=
 =?utf-8?B?Mmx4K2hmV21CUExtcHplWHEzSlhZMWhiNXMzaENYRUFDbWl5NWJmTTFpSGQ1?=
 =?utf-8?B?YWtyRHJzRkJvM08xYlpkcFhnWWhKbWxIUWpPTWpHN0IvamNPeGZrZWR1Q1ZQ?=
 =?utf-8?B?RjZWdkNqYjNIK3FnNVludmNzbERGSVNORjlHcG9VOFd5U0tzYmFhQmFFRGtR?=
 =?utf-8?B?WjhqTDdZRTdVTTIrVlF1V2VaZklQOExQV1g2cUVjMFZnUFRwWjBVZUNyTURy?=
 =?utf-8?B?TVQ3UGxUVElaWDcxeW0ybCswY3g3WWF3WDJFenZaOUpQUUttQUhPcXluVXk1?=
 =?utf-8?B?Y2taRCtCajZWTFR1NmJ5OEVSR2wvRWxiMVU0UXp2c1oxSWFEQWVUNGJnQjFq?=
 =?utf-8?B?M0hlOUFtVVRUaklRWEF4N3pqcWNUTXkwMjY5dWFRRUZWcnZQNXZZY1Y3dUEv?=
 =?utf-8?B?REx0Y2NzY0t1a0dTUGNud1p5aVVvNXBCRTVXNndZYlRIRnhvc1BRaHlDUnA1?=
 =?utf-8?B?dkxXaE5NZHVzc1NqVFBrTDdaOFFkK3cvWlFJaUNqNFdnNk5ZRERuWW5OUmZl?=
 =?utf-8?B?M2tpc0VLeHRra29DbnRiQTdyYUlsRVdPNlkwMU1yeHF5eWpucFpFbHRSaFl3?=
 =?utf-8?B?eUhCWWRHV0hJZ2wvMnFiRGFvUGlXQUIrbkE0OE9rYUFsVjZLZHdNUm5WUEF5?=
 =?utf-8?B?UGlpRmYrVVJ1a0k2RUZqb1ZQTkZtaDVCUE1rUHMwVEg5cW5RaENxQ1dCNUhp?=
 =?utf-8?B?di9odnovYnNpU2FFdTNXdkxCZHVvenBoOVNyT0tDN1FVaTIrd0RXcDJyRitt?=
 =?utf-8?B?dTVmUzZ5SS9mZXlKRGpETWxpNk90TmUwMVdidk9jSURTRnFCOW5TL3B0K1A4?=
 =?utf-8?B?VkxVNWNDVlBXa0JDakVjOEhlT0VTT0ZyT3hCY1hTNHJ1OElFQ2FQc2tyM3VF?=
 =?utf-8?B?bWhVbE9HL0d2U0JxNWN2dzFlQk1RMFVoYkpMRG1nZnViYXpld2cveGZCZ1N1?=
 =?utf-8?B?d0I3c29SSHdHRW1nbHUyVGE1akN3R1BjcHNBYm9GanhyY1JxOVBTb1JWNDFU?=
 =?utf-8?B?Uld3MDRpSjVnRGUwZUlpMFBIOW9hRXFKYnZKUnErNUszdVd5N3AyS1hPYjE3?=
 =?utf-8?B?UTIwQmhYZDEwM2RlY2xhbWYwa0dqTFlubzdmRGI0bThTMDBndS9TUmVVUmxv?=
 =?utf-8?Q?oqj7OSnkgBGdh8dhtSoxVuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1DC837D7E02B346BB046DF801B046B0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a4d0c0-d839-41ea-9693-08da90926dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 05:33:00.7562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bk+KjPpLMZNugl9KPsdpsV5/9KDIyscDQ18oZ1zZqaEm2UO8zmI4SxEnOKjfR3y2DEQ9O4ams0FxOoKXP8C0Q9bCsMAOMdskZS5OZWa0p3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3032
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

DQoNCkxlIDA3LzA5LzIwMjIgw6AgMDY6MzYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQgU2VwIDMsIDIwMjIgYXQgMToyNSBBTSBBRVNULCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gV2l0aCByZWNlbnQgYmludXRpbHMsIHRoZSBmb2xsb3dpbmcgd2FybmluZyBhcHBl
YXJzOg0KPj4NCj4+ICAgIFZEU08zMkwgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3Zkc28zMi5z
by5kYmcNCj4+IC9vcHQvZ2NjLTEyLjIuMC1ub2xpYmMvcG93ZXJwYzY0LWxpbnV4L2Jpbi8uLi9s
aWIvZ2NjL3Bvd2VycGM2NC1saW51eC8xMi4yLjAvLi4vLi4vLi4vLi4vcG93ZXJwYzY0LWxpbnV4
L2Jpbi9sZDogd2FybmluZzogYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldGNwdS0zMi5vOiBt
aXNzaW5nIC5ub3RlLkdOVS1zdGFjayBzZWN0aW9uIGltcGxpZXMgZXhlY3V0YWJsZSBzdGFjaw0K
Pj4gL29wdC9nY2MtMTIuMi4wLW5vbGliYy9wb3dlcnBjNjQtbGludXgvYmluLy4uL2xpYi9nY2Mv
cG93ZXJwYzY0LWxpbnV4LzEyLjIuMC8uLi8uLi8uLi8uLi9wb3dlcnBjNjQtbGludXgvYmluL2xk
OiBOT1RFOiBUaGlzIGJlaGF2aW91ciBpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQg
aW4gYSBmdXR1cmUgdmVyc2lvbiBvZiB0aGUgbGlua2VyDQo+Pg0KPj4gVG8gYXZvaWQgdGhhdCwg
ZXhwbGljaXRlbHkgdGVsbCB0aGUgbGlua2VyIHdlIGRvbid0DQo+PiB3YW50IGV4ZWN1dGFibGUg
c3RhY2suDQo+Pg0KPj4gRm9yIG1vcmUgZXhwbGFuYXRpb25zLCBzZWUgY29tbWl0IGZmY2Y5YzU3
MDBlNCAoIng4NjogbGluayB2ZHNvDQo+PiBhbmQgYm9vdCB3aXRoIC16IG5vZXhlY3N0YWNrIC0t
bm8td2Fybi1yd3gtc2VnbWVudHMiKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gdjI6IFJlbW92
ZWQgdW5yZWxhdGVkIGNoYW5nZSBpbiBhcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+IA0K
PiBTZWVtcyBva2F5LiBIZXJlIHRvbywgY29tbWl0IDBkMzYyYmU1YjE0MjAgKCJNYWtlZmlsZTog
bGluayB3aXRoIC16DQo+IG5vZXhlY3N0YWNrIC0tbm8td2Fybi1yd3gtc2VnbWVudHMiKS4gQ29y
ZSBhbmQgeDg2IGFyZSB1c2luZw0KPiBuby13YXJuLXJ3eC1zZWdtZW50cyBhcyB3ZWxsLCBzaG91
bGQgd2UgaGF2ZSB0aGF0IGp1c3QgdG8gbWF0Y2gNCj4gdG9vPw0KDQpJIHRoaW5rIHRoZSBSV1gg
c2VnbWVudCBzdHVmZiBpbiB1bnJlbGF0ZWQgdG8gVkRTTy4gRm9yIFZEU08geDg2IG9ubHkgDQpk
b2VzIG5vZXhlY3N0YWNrLCByZWZlciBjb21taXQgZmZjZjljNTcwMGU0ICgieDg2OiBsaW5rIHZk
c28gYW5kIGJvb3QgDQp3aXRoIC16IG5vZXhlY3N0YWNrIC0tbm8td2Fybi1yd3gtc2VnbWVudHMi
KQ0KDQpBbmQgYXMgbm8td2Fybi1yd3gtc2VnbWVudHMgaXMgaW4gdGhlIHRvcCBsZXZlbCBNYWtl
ZmlsZSwgSSBkb24ndCB0aGluayANCmFyY2hpdGVjdHVyZXMgbmVlZCBpdCwgZG8gdGhleSA/DQp4
ODYgaGF2ZSBpdCBvbmx5IGluIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZSwgbWF5
YmUgcG93ZXJwYyANCm5lZWRzIGl0IGluIGFyY2gvcG93ZXJwYy9ib290LyA/IEFueXdheSB0aGF0
IHdvdWxkIGJlIGFub3RoZXIgcGF0Y2guDQoNCkNocmlzdG9waGUNCg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+IA0KPj4gLS0tDQo+PiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8IDQgKystLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMva2Vy
bmVsL3Zkc28vTWFrZWZpbGUNCj4+IGluZGV4IDA5NmIwYmYxMzM1Zi4uYTJlN2IwY2U1YjE5IDEw
MDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlDQo+PiArKysg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUNCj4+IEBAIC05MiwxMyArOTIsMTMg
QEAgaW5jbHVkZS9nZW5lcmF0ZWQvdmRzbzY0LW9mZnNldHMuaDogJChvYmopL3Zkc282NC5zby5k
YmcgRk9SQ0UNCj4+ICAgDQo+PiAgICMgYWN0dWFsIGJ1aWxkIGNvbW1hbmRzDQo+PiAgIHF1aWV0
X2NtZF92ZHNvMzJsZF9hbmRfY2hlY2sgPSBWRFNPMzJMICRADQo+PiAtICAgICAgY21kX3Zkc28z
MmxkX2FuZF9jaGVjayA9ICQoVkRTT0NDKSAkKGNfZmxhZ3MpICQoQ0MzMkZMQUdTKSAtbyAkQCAt
V2wsLVQkKGZpbHRlciAlLmxkcywkXikgJChmaWx0ZXIgJS5vLCReKSA7ICQoY21kX3Zkc29fY2hl
Y2spDQo+PiArICAgICAgY21kX3Zkc28zMmxkX2FuZF9jaGVjayA9ICQoVkRTT0NDKSAkKGNfZmxh
Z3MpICQoQ0MzMkZMQUdTKSAtbyAkQCAtV2wsLVQkKGZpbHRlciAlLmxkcywkXikgJChmaWx0ZXIg
JS5vLCReKSAteiBub2V4ZWNzdGFjayA7ICQoY21kX3Zkc29fY2hlY2spDQo+PiAgIHF1aWV0X2Nt
ZF92ZHNvMzJhcyA9IFZEU08zMkEgJEANCj4+ICAgICAgICAgY21kX3Zkc28zMmFzID0gJChWRFNP
Q0MpICQoYV9mbGFncykgJChDQzMyRkxBR1MpICQoQVMzMkZMQUdTKSAtYyAtbyAkQCAkPA0KPj4g
ICBxdWlldF9jbWRfdmRzbzMyY2MgPSBWRFNPMzJDICRADQo+PiAgICAgICAgIGNtZF92ZHNvMzJj
YyA9ICQoVkRTT0NDKSAkKGNfZmxhZ3MpICQoQ0MzMkZMQUdTKSAtYyAtbyAkQCAkPA0KPj4gICAN
Cj4+ICAgcXVpZXRfY21kX3Zkc282NGxkX2FuZF9jaGVjayA9IFZEU082NEwgJEANCj4+IC0gICAg
ICBjbWRfdmRzbzY0bGRfYW5kX2NoZWNrID0gJChWRFNPQ0MpICQoY19mbGFncykgJChDQzY0RkxB
R1MpIC1vICRAIC1XbCwtVCQoZmlsdGVyICUubGRzLCReKSAkKGZpbHRlciAlLm8sJF4pIDsgJChj
bWRfdmRzb19jaGVjaykNCj4+ICsgICAgICBjbWRfdmRzbzY0bGRfYW5kX2NoZWNrID0gJChWRFNP
Q0MpICQoY19mbGFncykgJChDQzY0RkxBR1MpIC1vICRAIC1XbCwtVCQoZmlsdGVyICUubGRzLCRe
KSAkKGZpbHRlciAlLm8sJF4pIC16IG5vZXhlY3N0YWNrIDsgJChjbWRfdmRzb19jaGVjaykNCj4+
ICAgcXVpZXRfY21kX3Zkc282NGFzID0gVkRTTzY0QSAkQA0KPj4gICAgICAgICBjbWRfdmRzbzY0
YXMgPSAkKFZEU09DQykgJChhX2ZsYWdzKSAkKENDNjRGTEFHUykgJChBUzY0RkxBR1MpIC1jIC1v
ICRAICQ8DQo+PiAtLSANCj4+IDIuMzcuMQ0KPiA=
