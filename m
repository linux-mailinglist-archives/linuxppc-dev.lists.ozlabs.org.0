Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 616AE8D344C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:16:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cVL83hoo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4pv5XqHz88Lm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:08:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cVL83hoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4pC1PNGz886w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:08:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxRFaw2+HL+sCbYgc/+4RA3C5KK/DH388lBp/H94GAazkqu7DWeujbnOA3TxX0TRVUtFOP6bH6tYfICE4UftsNbu97kG4GavhoUB7KxAI2b3anmQv+S//7tStkOvjvbjI/2INFn72MyvsqsSIWdTlnXICMDzW64Cz4SWRwDGTv46g9EvI7F+2j+oqQswIdxCD1LyjS5eVnfiTUlw4RshPfKOZyIpmVx1jD4CcxZyt2BJFrJ2EY8iAezBUuaqXG7pFf6Y7qLG+i/XJoA4WezCD7UyyyCXMKctVHhL9x5X4elR/KbKjLa+ju1BgElqZlKYNJcx61S51k3VP0lr/N8T7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoShlhpxio/whrlJi14aoDFtRktfktpmfFk2sjSOWaE=;
 b=aCUMlr9b+kK0BHYeZAlOxVx+IS48ncQNlOQ2oc65QYfXGQ1iu8ftmG6+G6yukW3AissDiQ0UQINGeTAKGx4ZXS5Or9VyVdrLZPVHB+gcCWhGG5Cc8mUUJ47TU3DGQPyDJ7YSmaS6c7Luk0bCsSpAajwQK1nDFzqN2vuCNcs5eBgpCxFXmBRAXDDZHtGsdd2DBo//3o86wlJdoG+5qECyMIysgDEhqIZhtaGzjWY99Gpov16hGwDQWLBfcGX5O99Xz8FiySuc4zQdwDlHAzKdz/mIw19CZnO/cjUAwvW6YogPI0Ll3eETDGKpK0B7r10IXT1kgPmo9YF/GLSr4sXHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoShlhpxio/whrlJi14aoDFtRktfktpmfFk2sjSOWaE=;
 b=cVL83hoo5xK9+TW5281Ba7og4H1GeWtZPZe87lgIGHvUjS0YWdubn4zP8UM1mziP65WPVcMqihWpHYKUwsYcvqSkCD33j5TONxjzIE6BpbP1LynSS0lDHjKG35C51gOu3mROv+fmEoEpYNi72YKoV7kdIn3Y/TRr4Per+v06+PmtfuJ4R/zJsDPh2z3KItfHtK6JtMbMQWWNZNkrpb9tCwz4OEGCp32pXh2JrJuhItmtct6pQbLbxyCFvP6plV6Oo+ZvbhPm7bMbDg8Yxrld5hpE5TdDCppqXLyZJs20qDrIUTvPwbSxbYL1GWWutF5HQB48c8KSLveVzSf70BbEIA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2053.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 10:07:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 10:07:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.com>
Subject: Re: [RFC PATCH v4 14/16] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Thread-Topic: [RFC PATCH v4 14/16] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Thread-Index: AQHasDocM3CDkNRhzEO1+Too0SBD17Gt8zoAgAAMdgA=
Date: Wed, 29 May 2024 10:07:55 +0000
Message-ID: <315d1dc7-9eda-45cd-863d-803bfae4c29b@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <610be6003a6d215e9e9ca87d7f5402042da1e355.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlb0BugOwko4PrLm@localhost.localdomain>
In-Reply-To: <Zlb0BugOwko4PrLm@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2053:EE_
x-ms-office365-filtering-correlation-id: 2da655b5-17a2-48e2-6fed-08dc7fc7356f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?MHM1SGlFK2JKVk45WmdMbE9wWWphbUNWRXBLK1VsVlBXT3RXZGhqOVAzbDlI?=
 =?utf-8?B?Ym12V0RaQit1T1NVUkRpclRjYkFaZlVlNlgrNStoaHNqT0ZWZkwwSUNEK1Qv?=
 =?utf-8?B?RVIreGxpQ09WSk1KWmpBMTduR2Z1WUhNSkJ3dXNOcDZFdndobU4zMnUrMmxD?=
 =?utf-8?B?elJsWTdjR3JYNHJhOWFHcFByUnFOL0ZiUU5yZkNhemZsa0pOVC9nT3VTRkZG?=
 =?utf-8?B?M2FHM3MzMzJaQUdnRjA0NkRVd3RDaCtaQkJxMmZyMzBkMUlqalg0dkJPbVl0?=
 =?utf-8?B?OG9wMThCMG5FUGtDa3doVWQrRmNybVRJcWVWVWRlWlE3S2lJZ1prQjZDUVU0?=
 =?utf-8?B?Q08vd2Z0Y2p6V01IK1lKbkwwdkNyL2thNWFkaWpSaGI3VEdoMlVERDdmRStv?=
 =?utf-8?B?OXNReUpsbktYV0xrRGprT1NRUVBkYlFRNktNQ1E5YXBFN28zU1lnWDhwTmJm?=
 =?utf-8?B?WmVoTXB2Vkp6VDRmM0Jkai9IaVZuTEVmWHV5S3BiWG5JOGJSUmNHMjZvQTNI?=
 =?utf-8?B?TllOS1dvTnRneENpcUtYK2paMnkvVUJ4R1J0SWNtQUlSeU0wNk9BU0JwQzhP?=
 =?utf-8?B?T05MYXVSNlBlV3BNSFpTMFptRE1ILzNaS1FYUWp4bDRORjZqc0VBMVNhcXM5?=
 =?utf-8?B?MC9MK1l4NTlYN2lMeXMzR3A3UndDcFVKQ2UxbU9xTml2RzAzd3RWbGNNbk9q?=
 =?utf-8?B?c0pmUlpyaEhFMllaU2xJVVlIWE81YlRmdmNsdW9DV0RjVWxJVkRwSzRPa2w0?=
 =?utf-8?B?bnNvNzhDa2Z0M1hkY3N1enJFeURiUE9Lb3lvYmRrK1c5S0lCRmFlZHc3VzNt?=
 =?utf-8?B?L2loSUZoZ0Q2NGtxbmVuRUhRQUhmUXdLcDM2KzBKRGUyNXFSSEJSVU8wN1RN?=
 =?utf-8?B?NXRTVGxwZmJuaVF3aUZ4Y1VvdFduWkRKUWVBMGNNbmZIcVhPdG5qNzBWQlps?=
 =?utf-8?B?Qzd0SWI1bTRUWHh2MEVlYlJQdXhuMUk1Q3NTVis0U09pTnlRYnA3RnI1RTYy?=
 =?utf-8?B?Sk1LY1ZYeXZDQno3eEpuZ0w2dllwRGg1NjJaYmYvWXlXQXNHRHFjNW1JbG51?=
 =?utf-8?B?d2ZaZEtGek1leVJnSW1HNG9VL05HdEtsRG0vRkJDSEdWVFZRMjA0VW8vMFR0?=
 =?utf-8?B?UmZCS0JQUEloU2FJeGtiWURwU0FZTGRYQlUvZUkxVFlHMHN2eWR4VXp5VmtQ?=
 =?utf-8?B?aE5tVVM4cjB1SWNNN1QzOGs3aCtGd0tXSFFVclphZEFHeVJCOU52d1RzVUhJ?=
 =?utf-8?B?NkxQOSthK0Z4SVBzaDliNnNYY0hHeFRpZjBvN3dKSW1xVmdXVjVKSWJodjZZ?=
 =?utf-8?B?VmNSd25xM3piM1FuNVg3V2pSY0VCMzVSbGF0YWl0Qmc1V3B6UkVyVjBBNCs0?=
 =?utf-8?B?bTBIa0oyMkZYMTlBNXNqVE9FMnFHVnBXVmNrdXZMTm1ONFFOc21TT25GMEs4?=
 =?utf-8?B?TlVmWVF1YnpDWUJETm1YeWFPRmhmSXk0ZGZQaTVvb05HR1ZzbDZOU0hTQ2xk?=
 =?utf-8?B?Qm9Hd0xCS0lsT0M1RXNlWFp5S1l1NG1EVlZ5Vjc4c1Q0Y3NHTFdrWXNUMmdl?=
 =?utf-8?B?Wm9YQWNEbkdMTkQ3U1l3cEpuRjh4TWlmc3l1Tm8rUGl3bmxiR0FqVm5ESjR5?=
 =?utf-8?B?QjhFNDhMZWo2Mmw0SGg0YWZxNXJ3VVNyWUZQaFZtQlhKeHhtNW9oWUY4akJB?=
 =?utf-8?B?bEFLNGZ1QVp0RUhQU05GRDZQUnIwR01ZV3c4a0JuZmF5cG9lWmJSWksySzVI?=
 =?utf-8?B?ZUM1K2FJK3dVem15TTlqZnhtT2w1bGtxMnNWMUI4VTlFcXFrN3NEaEt4NjR2?=
 =?utf-8?B?S0hnUFlxcTZSUWxDeGFXdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aVFWTWUzczdOclVrTmFoOE5zTDd6M0xCRWxxVVJmTU5HR1B3QUF0SUlvcG1O?=
 =?utf-8?B?RExXNWRxbTFYY0ZQZk1jZHAyR1hEbjZuaXZsUzFmREFxMTVKWHVYRzFoWFpo?=
 =?utf-8?B?VTJZd0YxZWVLQnQxNHpsT2RUcTF2dTdRZG1xdVdOdkwxMXNCc2RmRnlsN0M0?=
 =?utf-8?B?OWFmeStMQ0JaT0RsUWdwVkxVMm01akxVNTRkWjIyNUw2VzNweld5REFzVnJ2?=
 =?utf-8?B?cktXSHVVZzh6NDFHVXhQQnQ5MlhDVWN6MmZUcmpsdU5KMjBVbjRBbjRodmpl?=
 =?utf-8?B?ODgzSUw4M1A1T041dElFY0lkWVZHTVNvVzA3UFA3enJocCtrZ3JlTGdNVXBl?=
 =?utf-8?B?bmIzUEJpMGxyT3F5a3VzRkZqei8vT3JjMVFXajc1cnBJVE5VeElweXdKMTYw?=
 =?utf-8?B?ME9scDByclZpU0srTWVoakVHRVBsL0FqWVNIdzZ0b0lOVURrY2R0b0VFL0Fi?=
 =?utf-8?B?OGxvd3E3QWVraFNXVkcxamsvU0ZrMnNkWkJYWGNPWWlTOFJydWpmdjBLbXB3?=
 =?utf-8?B?QzdWYlUvUkVZcEdsVFQ0TXUzdmd3V24yOEtuTkFzOVRjQ1FlLzBpazFybER2?=
 =?utf-8?B?YUJrU0UxVHozYUdobUhoMlAyNDIxbkJTWkQ2R3BRVFpOZE8wQkxKbE4yaERy?=
 =?utf-8?B?YVI1SFBGRkNla2VGdTIybjVRN1J2MXVaUTRwTjU4cm5ZRmhUQ3hQSVROL3Ju?=
 =?utf-8?B?ODhMcVFnS2NnOXVuL0YzMVc2dTlGbDFacW1odnNFR1h1S2xxMGVmbzVkZXdz?=
 =?utf-8?B?QWJoQVZJNGxOSGNyazZKK3ZBWm8zMFk3WjZBVkh0K1diUTlERUdzTVVYQUZ6?=
 =?utf-8?B?MEQyRTdzOCtkejNydjhmSGlLRDBwRHpQS2d3MnBXN1Y3WHJHbnFqMGU0SStG?=
 =?utf-8?B?UjVheGRtcDhwRWVTSlhEVGhHZGRseGFtWHFFNkhkbG5icnFsQVhkWFcwa05H?=
 =?utf-8?B?T3I0eUtOaHZOWFdmd1lPMWo1ZFNUMm1nOTJaWlROMVZOcTY2bCtKSzAzamZG?=
 =?utf-8?B?VGRNWEhmZFJhUlY2YVJUVFUxK1prbmVqUlBjeXltRi80U25TUnQvdnhPL0dR?=
 =?utf-8?B?bmFDWDVVSjFZNnpOTzAxbnliWFkyU2JtRllUMUVqQU5sVmErM2NIUDY5Q1ZU?=
 =?utf-8?B?K1ZYRE1iZm5uTVRLZmJBaW1ZRVZwdnZvVEZDelpsZlVRWWtvSWE4eEZKbUtK?=
 =?utf-8?B?Skh4TVIrK0UxamxLN0p4MnBFYzM5MXIrdnRYV3Q3aGMzbGx1Y2VQbVB6WmdZ?=
 =?utf-8?B?RTZBVDNMZEIvcEdubkNRdjJUdnVVUDBUaitjRGF2VUFwbnJxR0F0ekpDMDQ0?=
 =?utf-8?B?OFFNb1g5V2hGV1EybGs2ZDNqK1BuZnhoai9zV2lrQ2dqRzFCTVhmbTY1VVZE?=
 =?utf-8?B?NlYwS2wzUEtWNFdCdlNrRXI2R3F3d0ZJNUdpWjRJMEd5ZVlCK3g0VjFZaHVh?=
 =?utf-8?B?Y251YXpnZlNINnZkaGljVzdGWUh5cWVma1ZXVUt0eWVwRngrVG9EZDlsRGdQ?=
 =?utf-8?B?alZVMElBazlRbllUV3YwY0I2a3J6bHkyN3hpT243MCt1amM4K3ExUVlFMDN0?=
 =?utf-8?B?NDNhWVp2cXhTb3BTQ2FraVllMmpRTFI1SnFNY3A4M1BqUmJFME5PQmk1OE9j?=
 =?utf-8?B?WHJUWjBSclpFc0Jxbkcvdm80aTFRTkowYkowUmJjY0dteDBrZEVSWjlMSzk3?=
 =?utf-8?B?NG1oNTQ4dEpod3VkWFdLZmZEVkFXSVNoNlpRekh0cm40R3lJNG91VnNCNFFP?=
 =?utf-8?B?Q011OEFPZTV2b1JWSFFOcWlEREFORnNNeUZOQjgxaHZpNitLVDdGK1V6VXNq?=
 =?utf-8?B?S3plSktpclFxV2JkWFJoZXNoZktoTDEva1NNTXRKTFNucm9Db0ozeGJ1WnA3?=
 =?utf-8?B?Z284UVdldUYxNFRmbkxGbmIzU3cybmwrOGpmL3R5WVZwZmd1NzBaU3N3NmlT?=
 =?utf-8?B?YTZPSU1ZcHVRUU1odUIwUVBaQU4ycEJ3clhuWmZQNjZKR2IyamhJaXpCck1C?=
 =?utf-8?B?anBsSzZFaEhSUWZQaUFMTndud1N3bmVTR1ZrM3JRM200MFAyeVhZZmdRSHN5?=
 =?utf-8?B?RTBwdWdDeUsxMVNIUUtnWkQ5RE11c2xDejU5VkFTdnd1Q3YyVHpFMjdWdlkz?=
 =?utf-8?Q?XKGVX77TEOkOsFu8Ykzc3pXZO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2BC30FF99EA1C46BD8FB0731C61AB6C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da655b5-17a2-48e2-6fed-08dc7fc7356f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 10:07:55.1082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzg9sIM3ErIjtbO0dieMHDatD/K8mB7hX8oIE2R0Qbt+qs7BPiwvqeFJtkL1CUiLv7lTavxgVhzAqaoIeAm9TaDy6gwcbsWVZMFdAmghA1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2053
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA1LzIwMjQgw6AgMTE6MjMsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgTWF5IDI3LCAyMDI0IGF0IDAzOjMwOjEyUE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBPbiBib29rM3MvNjQsIHRoZSBvbmx5IHVzZXIgb2YgaHVnZXBkIGlzIGhh
c2ggaW4gNGsgbW9kZS4NCj4+DQo+PiBBbGwgb3RoZXIgc2V0dXBzIChoYXNoLTY0LCByYWRpeC00
LCByYWRpeC02NCkgdXNlIGxlYWYgUE1EL1BVRC4NCj4+DQo+PiBSZXdvcmsgaGFzaC00ayB0byB1
c2UgY29udGlndW91cyBQTUQgYW5kIFBVRCBpbnN0ZWFkLg0KPj4NCj4+IEluIHRoYXQgc2V0dXAg
dGhlcmUgYXJlIG9ubHkgdHdvIGh1Z2UgcGFnZSBzaXplczogMTZNIGFuZCAxNkcuDQo+Pg0KPj4g
MTZNIHNpdHMgYXQgUE1EIGxldmVsIGFuZCAxNkcgYXQgUFVEIGxldmVsLg0KPiANCj4gDQo+IE9u
IDRrIG1vZGUsIFBNRF9TSVpFIGlzIDJNQiBhbmQgUFVEX1NJWkUgaXMgMjU2TUIsIHJpZ2h0Pw0K
DQpDb3JyZWN0LCBhcyBkb2N1bWVudGVkIGluIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQvaGFzaC00ay5oDQoNCj4gDQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhh
c2hfX3B0ZV91cGRhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+PiArCQkJCQkgdW5zaWduZWQg
bG9uZyBhZGRyLA0KPj4gKwkJCQkJIHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIGNsciwNCj4+
ICsJCQkJCSB1bnNpZ25lZCBsb25nIHNldCwNCj4+ICsJCQkJCSBpbnQgaHVnZSkNCj4+ICt7DQo+
PiArCXVuc2lnbmVkIGxvbmcgb2xkOw0KPj4gKw0KPj4gKwlvbGQgPSBoYXNoX19wdGVfdXBkYXRl
X29uZShwdGVwLCBjbHIsIHNldCk7DQo+PiArDQo+PiArCWlmIChJU19FTkFCTEVEKENPTkZJR19Q
UENfNEtfUEFHRVMpICYmIGh1Z2UpIHsNCj4+ICsJCXVuc2lnbmVkIGludCBwc2l6ZSA9IGdldF9z
bGljZV9wc2l6ZShtbSwgYWRkcik7DQo+PiArCQlpbnQgbmIsIGk7DQo+PiArDQo+PiArCQlpZiAo
cHNpemUgPT0gTU1VX1BBR0VfMTZNKQ0KPj4gKwkJCW5iID0gU1pfMTZNIC8gUE1EX1NJWkU7DQo+
PiArCQllbHNlIGlmIChwc2l6ZSA9PSBNTVVfUEFHRV8xNkcpDQo+PiArCQkJbmIgPSBTWl8xNkcg
LyBQVURfU0laRTsNCj4+ICsJCWVsc2UNCj4+ICsJCQluYiA9IDE7DQo+IA0KPiBPbiA0SywgaHVn
ZXBhZ2VzIGFyZSBlaXRoZXIgMTZNIG9yIDE2Ry4gSG93IGNhbiB3ZSBlbmQgdXAgaW4gYSBzaXR1
YXRpb24NCj4gd2h3ZXJlIHRoZSBpcyBwdGUgaXMgaHVnZSwgYnV0IGlzIGlzIG5laXRoZXIgTU1V
X1BBR0VfMTZHIG5vciBNTVVfUEFHRV8xNk0/DQoNCldlIGNhbid0IGJ1dCBJIGRpZG4ndCB3YW50
IHRvIGxlYXZlIG5iIHVuZGVmaW5lZCBvciB3aXRoIGEgdmFsdWUgdGhhdCANCm1pZ2h0IGxlYWQg
dG8gd3JpdGluZyBpbiB0aGUgd2VlZC4gVmFsdWUgMSBzZWVtcyBhIHNhZmUgZGVmYXVsdC4NCg0K
PiANCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2Uu
YyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jDQo+PiBpbmRleCA1YTJl
NTEyZTk2ZGIuLjgzYzMzNjFiMzU4YiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9i
b29rM3M2NC9odWdldGxicGFnZS5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQv
aHVnZXRsYnBhZ2UuYw0KPj4gQEAgLTUzLDYgKzUzLDE2IEBAIGludCBfX2hhc2hfcGFnZV9odWdl
KHVuc2lnbmVkIGxvbmcgZWEsIHVuc2lnbmVkIGxvbmcgYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZz
aWQsDQo+PiAgIAkJLyogSWYgUFRFIHBlcm1pc3Npb25zIGRvbid0IG1hdGNoLCB0YWtlIHBhZ2Ug
ZmF1bHQgKi8NCj4+ICAgCQlpZiAodW5saWtlbHkoIWNoZWNrX3B0ZV9hY2Nlc3MoYWNjZXNzLCBv
bGRfcHRlKSkpDQo+PiAgIAkJCXJldHVybiAxOw0KPj4gKwkJLyoNCj4+ICsJCSAqIElmIGhhc2gt
NGssIGh1Z2VwYWdlcyB1c2Ugc2VlcmFsIGNvbnRpZ3VvdXMgUHhEIGVudHJpZXMNCj4gJ3NldmVy
YWwnDQo+PiArCQkgKiBzbyBiYWlsIG91dCBhbmQgbGV0IG1tIG1ha2UgdGhlIHBhZ2UgeW91bmcg
b3IgZGlydHkNCj4+ICsJCSAqLw0KPj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQ180S19Q
QUdFUykpIHsNCj4+ICsJCQlpZiAoIShvbGRfcHRlICYgX1BBR0VfQUNDRVNTRUQpKQ0KPj4gKwkJ
CQlyZXR1cm4gMTsNCj4+ICsJCQlpZiAoKGFjY2VzcyAmIF9QQUdFX1dSSVRFKSAmJiAhKG9sZF9w
dGUgJiBfUEFHRV9ESVJUWSkpDQo+PiArCQkJCXJldHVybiAxOw0KPiANCj4gSSBoYXZlIDAgY2x1
ZSBhYm91dCB0aGlzIGNvZGUuIFdoYXQgd291bGQgaGFwcGVuIGlmIHdlIGRvIG5vdCBiYWlsIG91
dD8NCj4gDQoNCkluIHRoYXQgY2FzZSB0aGUgcHRlX3hjaGcoKSBpbiB0aGUgd2hpbGUgKCkgd2ls
bCBvbmx5IHNldCBBQ0NFU1Mgb3IgDQpESVJUWSBiaXQgb24gdGhlIGZpcnN0IFB4RCBlbnRyeSwg
bm90IG9uIGFsbCBjb250LVB4RCBlbnRyaWVzLg0KDQpDaHJpc3RvcGhlDQo=
