Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 908908CBD3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 10:51:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pbe7PI5Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VklJd45Ncz78td
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 18:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pbe7PI5Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VklHs6bKgz3w50
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 18:45:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUxpAALpaIZ3VDJORGkTorXiMWm2zRevF7DYrtiioHay1846Ro3eXUFY/Y5QYIQexqna4wtAWmOP6BP9fx3ZKY870Xn8w5dN0EEpWNCReXtV/aMxYI7JJJWJ9NyeW79OBGqtTjeJXU1+6mknaNR47SVrlKLKTU8wBxNFZFaUdBNJxO53DKXbUJ/doltkYiMtlLvoSRdEq9SAzzb7oLsxmEm990KIYLvGYiw5+PAEeO8xeSwIiWLM+tLus1q+vnsJ/fGWVCb9ZmszLXFgyqLoCX9n3JALgodNrWBzFHJWPsR7amo5/exor+eEcYu5NYg1xcUqB6F76rRNLjKMYvHqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtAZa8wwtG1FKZPmZMs0yLVUpb1OQr9eTYzrQiB2W4s=;
 b=FTeHNTMGaiiKP5/LbPx/EAZO29BLwGoEk19a51NEZEAzHCO6bxkvjmq1HZuZpsG5WuUbMoZVTwIMOSr3YsXrDoPg1e8+McHBeXGNifDAYH9P2BNjJUIFKVItD1v6hJFZg1B27rw4AghocTDBggDt4JBYomFvES/dLwpCCee8a/8UvJnWPTdlkNZu33yqrBwe+Ic8ghlIE545VPBxWFbpJgUoxjHWAHBH3jbaaAdhEpV5MTe6uu1zdygjZolkpyl4pWQhyCxaIo4NMpu7YnwPp5uDfPy9hs7Bhn3fFUMdQaLhZVlxoOzfY8nceQr6mX4vDIcgGC1ulekRd4fReD6RFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtAZa8wwtG1FKZPmZMs0yLVUpb1OQr9eTYzrQiB2W4s=;
 b=Pbe7PI5QZqXvlZx2zOaZEnPsjAaKjCeSqvNY2/9blAh7HWh+K0L8H3lHsXUuauYCBXssWcmeQgH/C6Wkq9dCHVa3T9DvK7iX6D9qoFrpHlNg3vDdWpybBb55PfdyCsFMZ/rJ/j6p7NYRTR/ycNaqRpWqFecIGyQkeUx1U9KMSAOxa+iqehU6kuMyc6262IWWgXpfYX4TiGqUlM4xwiNSUISKWjT8XlP3789FXFXpKTT+CZcs3sNbNXIbPEaXJBPJJkcxfq/qpM5KydZOg/U2UHcB3DQwCtA9hnqbdIIHu9Yp/1VjwtH7BYkejoyQQf7mv7SXMVupymdchOlrhRHgZw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PASP264MB5491.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 08:45:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 08:45:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Topic: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Index: AQHaqIxxLOw0k+xnhUqWHgWN6F7AE7Gf2z2AgAB6CICAABPKAIACjoeA
Date: Wed, 22 May 2024 08:45:06 +0000
Message-ID: <37987c7b-e9e1-4969-82b3-84da47b2c6ff@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <04f4e737608ea0b177b88057db138fbf0d6ab138.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksUiwNaKx2n1fJO@localhost.localdomain>
 <f26807dd-bbd2-405d-9a88-c0654c525a5c@csgroup.eu>
 <ZkuLgtujN1C2cpaH@localhost.localdomain>
In-Reply-To: <ZkuLgtujN1C2cpaH@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PASP264MB5491:EE_
x-ms-office365-filtering-correlation-id: 2d9a8ea2-29c7-472b-6033-08dc7a3b7acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?bUo0N1JPUzEwRm02WVRkTDVCYW5iQUxtWnd4bFp1Kzk0TTRjem1sdUx5dmNT?=
 =?utf-8?B?NktXdDVPckI4Q0p2eGE5M1hYZWNJNU1ob2FFeE5tcTB2d1FaeGM4Zzg2Tk5B?=
 =?utf-8?B?ZDc2MUVnNUx6WVBONllJR3ZPRStWOE9IQUhKNGwxU3NZaWp4YU1qL2lMak9a?=
 =?utf-8?B?L09CRG8yTmxiaUVXRWIyWUQyby80TERMMW1reHZJZGp5d0VkQlFCdDFYN2Z4?=
 =?utf-8?B?VXJOV3RrNngreEluQlQ3THhVUmljNHpBT1ZNVFF4TEtKVlNoTCtzUVJFSG8v?=
 =?utf-8?B?TVFyVmM2WDh0alh3SHlxbDhidUVKTUpWMVZkVlFOVmhyVlIxVzVieFlRMkov?=
 =?utf-8?B?anNFT29kRHIzWWpKZzF5OTNRMHFnUEQ5R2VlbDcyQWFFcGRRWTRTVUt0MG0v?=
 =?utf-8?B?NHdQWWN3L3BVOVg5MWlscmlVbzNuT21ld3hKMGJyM0xLSFdXTnVkRk11Y3Nq?=
 =?utf-8?B?K0o0OXJPTXNwUDNQdXRVUFJ4SnBCanlRV01KdHZGejU3UGt5Qk1IMDJUT1U3?=
 =?utf-8?B?b3dodkRTMmZmdWZaUEU2NTFkTk5yYmx1bUFXRlFjckpJSWJhMU9rZUU0SHhz?=
 =?utf-8?B?Q3JEVVJQOG04TVBWZEVnMldEcExBVzd2cGVSMWZERHp2VGpRVFhZM28xSGp4?=
 =?utf-8?B?dkhENXJqMzVwY2ZVNWtiK2tjcWJuckR0RnIwd1U3UnlSc2Y3aW9PQzlRUCtz?=
 =?utf-8?B?endMQWtCK0lDdmIyZ3hacEpwdWJqWHRkK1ROTmNjUWxUTWVYeThhVndsMXI1?=
 =?utf-8?B?REtFSmpkNnRvT1o2NUYyRjU3c214YjBlamEzVUtqTG0xQ2Ixa1dNS1dBN25n?=
 =?utf-8?B?UmRKMlk5a01xNDJsYmIvZXlnN0VqK2xLZWNNeWZWbmc5WmFMNVhBMkhsdENu?=
 =?utf-8?B?bnJqdzk1ejdRV215NVV5bEhJKzQ2YVJCNzN6L01RcTBVZWE1VXFHNE1kUlVY?=
 =?utf-8?B?RTI1K3k1amlzazFJL29DZVA5RVZTV0IvcC9idGdlRk1WbFJlOWJub0NSZTlD?=
 =?utf-8?B?VUt4VHAxUUxuNDE3VUh2TFlWN1lJZ1k1cUpsYStZN0g5QzhjM3F6TGFiejV5?=
 =?utf-8?B?R2VtM2tlREpFWndjZ3dzYmY4NDBFVXE0TXB4bHNHNlUxWVNLbjRKTHVUejda?=
 =?utf-8?B?ZS8rbm1FbGc2NzBYR2dNcnVpZnlmb0hLaTZNQmtrdWo0QmN6UC9xVVR1bFZQ?=
 =?utf-8?B?dnBudXJBQW1VcFQyOWx6VWpPc1Q3dUR0aUxoYU5od0E5bUpVUnR0b0thU3ZR?=
 =?utf-8?B?cDFBdkYyMnoyRVplQ2g4RlZCdzVETDJRN1M1VkQyTE1VaEdBTk1acUszRnZW?=
 =?utf-8?B?Lys2NVczbTY3RHFoc1pRejh0cEFNRi9DQlFWRllUZU9mTGVxSGhOV0gvUC82?=
 =?utf-8?B?enhsK0xnTlpBcGRKSjBJUnRGa0JtZEo3eXB2UmFsL0VMSmthTXFhNTR2OXds?=
 =?utf-8?B?TTYvTzRxMzM3cURuT2FWamNCSlYvaEVISTNnTWJoYUdmMUFXRE8yZ1hLMHZw?=
 =?utf-8?B?R2Z0SGN4WnNaSkxZWmJyMktuWEVTTHpnZlBmK3NVTi9YcFI3UXQvYWphU3BS?=
 =?utf-8?B?eE5tRk4xelZ0bGkySUtDRG9DL2xBVDlTZVdNc0t2NUJZYTVjQmdVU3pHOURN?=
 =?utf-8?B?S2ZPNitZOHBHQlpXMzk5YW9vREpHcTlOZG5MZHNxODdoRVNadG5KVTBDcjk2?=
 =?utf-8?B?WmZrQnRVei9ic214aW9kelFySHZMMXFOazY3Skx0aFZ5RERlVTNUK0h0cC84?=
 =?utf-8?B?MzZydk5tRktNZHA5QkZxSHpGNVBqS0pEdENnMjU0bkVzZjhyd3JLSm1zazJI?=
 =?utf-8?B?eUNhakM5dnM2dzFkYnhIdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXRWOVZRWG5wTFNuS1NsMGlRUjIxaXpqUm1xRndHOVZDUzA1dGlReWpvZkM5?=
 =?utf-8?B?Z1hvaUFubzA3K1dwamV0UXE5bWFmZVI4bkJHQmZIYk9maGc2c05kT00rdUwr?=
 =?utf-8?B?VzNxRmk4dFNOam9nTHR3M1ZaZFVwTWVaZFp6cDBoUzZhNmVscjdMUzdLS3FG?=
 =?utf-8?B?d1JGSEdBelkzZXNoZ3hhTzhheGx2elRmaXVpZklZaEVtMWUvdWQzZWFlMXFu?=
 =?utf-8?B?bUQzUGgwQURIMTlBRE1jTVNxNFZPT2JlRFQwbCtYM3hLb0dTTVBNdDJlMkhB?=
 =?utf-8?B?c0NnTHdGd3h4bjZCZ05JUUpsekVhR1RkRWtzTW81TDBaeWhGSzZWN2hFSXJR?=
 =?utf-8?B?VC9Ja09qNFZTd0RUSWZGSEhXUmQ3UThUOE1QeWVydE5Jb2NwbUQ2aVFQc3BP?=
 =?utf-8?B?S2tPei8ybGdSRHJLcHNKa2s4QWhJaDJIL2ZDTkhrcDVsdjRabjdRaGw4RENC?=
 =?utf-8?B?TzdxWXgyY3FXeG1xcUF3Vno2UENpRUdOVVdUd0RTdkxBR3JoN3BydzZqcVQr?=
 =?utf-8?B?b21JMnJJOEprZ2ltTXJhbVE0Y3VSdUhtRFlBbWZiZGF4am4rdEl6SC8vUGNH?=
 =?utf-8?B?S00rYUc0TEFpVmFnTzNzNDFxa1NSQTVsTnIybmlaLzI0aW9QcVQ3TnhseGl1?=
 =?utf-8?B?UVVJbi94M3dEQm81WDloZWc3akNwZXZNVU91Tm1XWmNncE84c1E1NldxNlVO?=
 =?utf-8?B?M0xHSW4xWlY3YzVvNUJ5WVJxSUFXWmxvSFJvaVdIbG52RlVDcmJISjJCZXJn?=
 =?utf-8?B?enVrZTFPMnVLK1BYRTFrVFZrVVBvY0Q2Y0crNDYwRG9Cbm5SLy8xNWhFSERM?=
 =?utf-8?B?MElQUnRiM01wTng5K0x6ZDl2Z093N2RkZDArQmhLS053ZFlwSlZXdGxVRUlH?=
 =?utf-8?B?WmluSHBtSE5IelFvT0N4R2VIdmZzVFNLQ0xDeVhUbWFmWGVnRU1OSmczZkQ4?=
 =?utf-8?B?cXJGd0FnbWRtUktVeTdMdDZ3N3RYUGxDVEx4NmVKMHYrbGtCanM1Z3JyN3Bo?=
 =?utf-8?B?bXVSQjhIVFRhMUtnSXJKTUVxTnNwRklTdk9DUUM0QXhNTmhMd3BhMHN3dWd4?=
 =?utf-8?B?L3RQMXB3QXBSU1RxOHlLci9iSUJRaVcwaGxVVSs2MUxrendra2FNTUkwMVRK?=
 =?utf-8?B?RHZCdHIwd215QmUvZUpsOFdtem5kRnN6dTNEU01xRVdFU1hBWWJsbURqVUJM?=
 =?utf-8?B?L0hJWjF4ZEdKVXRqQkhkZFVsMGQrR2lXZHMvcllIUWR4bHJTa0QxWnc5aUtF?=
 =?utf-8?B?ZCtOeVJzR1p5R2lPNTRqeENvOHJWQXNPUGdhVDliZ2FVOEFLN2ZIOVpDbmtU?=
 =?utf-8?B?eUxXKzBsTWxIR0RoQXBrN1loSlJHU0pWS3dxQ2ZVYzl2Tm9wY0xYQ2RpRGtF?=
 =?utf-8?B?M2tpYlA3cTR2eGsxQmdPNHZkVE84cFc5eGllRmVYS0xrUnhrSzBXK2YySkZx?=
 =?utf-8?B?aExPTFdaME1NTnlpNGZuU3R4enI0NVBVQnovRkoxM3RkZ0ZYdGw2U2tuMWJK?=
 =?utf-8?B?bHByUWZzcHBCUDlaaEl6ak5WeDhjbEUvcEVzell0Szc3WEE0T2FIeVlHbnlZ?=
 =?utf-8?B?TUxOK3hOUlhTaGtvRWlhdWV0OEE1K21qT2VsMUw1VDIrY0RQU2g0eEFoVUZl?=
 =?utf-8?B?QTg2bnROUEZqeU9jdWQwekUveGdRRzBPR2oxNFM5NGdnMTdpZklnS0J4S0Ja?=
 =?utf-8?B?b2E5ZWp6akNHNlA4V05OWEZ2czZuU2o1VVVEaTNFMS9WVGNmOWhFa1h4eWw4?=
 =?utf-8?B?cWZCZTVSaVFWdzNoaThwUENNYWw0djVLZ3RUV0dta0tyalJLVTd6N2YvWm94?=
 =?utf-8?B?QkhyOGI4STFHM2JCandtclNCTnV6S0l3eTBqVzg5Uk5JWGRURndaRjdrVUlI?=
 =?utf-8?B?M1ZqaUE3OS90OEdHSkJQdTVIR3VBalljQ2Z0QXRRYUJwOGtUNGhUa2ZuU0pT?=
 =?utf-8?B?TlNRZXJldFRPQUNjQTNKaTh6bHFpS2FTRFRpenpaaXRWY01BMmJuaTlJd3Zm?=
 =?utf-8?B?KzAyZlREaFU4VkV6cjJrc2o3b1BmMks3RlE4RWI5Qzl1NVFqVGxicy9URVpn?=
 =?utf-8?B?T3Vyd1QvVmd2OFBVV3BVNDkxSFJwRzJRZmczS253WFVRQ3NuWS8yV0h6U0p3?=
 =?utf-8?Q?XEkbpqMQyoo/OFRH5tOqZH2D8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB36D259EF87044C969CFCDA6BF83CEE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a8ea2-29c7-472b-6033-08dc7a3b7acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 08:45:06.1273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oKKXG34IZ1YUFkCokHtD3FnW2WZrR5pxOaB6j1VTrciTcWICK/oPhtFjgXU4tfIrq91P5WoQXgjyf4gFtn9JHISaDJt/EGN3bDgPbXQeNa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5491
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

DQoNCkxlIDIwLzA1LzIwMjQgw6AgMTk6NDIsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgTWF5IDIwLCAyMDI0IGF0IDA0OjMxOjM5UE0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBIaSBPc2NhciwgaGkgTWljaGFlbCwNCj4+DQo+PiBMZSAyMC8wNS8yMDI0
IMOgIDExOjE0LCBPc2NhciBTYWx2YWRvciBhIMOpY3JpdMKgOg0KPj4+IE9uIEZyaSwgTWF5IDE3
LCAyMDI0IGF0IDA5OjAwOjAwUE0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+
IHNldF9odWdlX3B0ZV9hdCgpIGV4cGVjdHMgdGhlIHJlYWwgcGFnZSBzaXplLCBub3QgdGhlIHBz
aXplIHdoaWNoIGlzDQo+Pj4NCj4+PiAiZXhwZWN0cyB0aGUgc2l6ZSBvZiB0aGUgaHVnZSBwYWdl
IiBzb3VuZHMgYmV0dHRlcj8NCj4+DQo+PiBQYXJhbWV0ZXIgJ3B6aXplJyBhbHJlYWR5IHByb3Zp
ZGVzIHRoZSBzaXplIG9mIHRoZSBodWdlcGFnZSwgYnV0IG5vdCBpbg0KPj4gdGhlIHdheSBzZXRf
aHVnZV9wdGVfYXQoKSBleHBlY3RzIGl0Lg0KPj4NCj4+IHBzaXplIGhhcyBvbmUgb2YgdGhlIHZh
bHVlcyBkZWZpbmVkIGJ5IE1NVV9QQUdFX1hYWCBtYWNyb3MgZGVmaW5lZCBpbg0KPj4gYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL21tdS5oIHdoaWxlIHNldF9odWdlX3B0ZV9hdCgpIGV4cGVjdHMg
dGhlIHNpemUNCj4+IGFzIGEgdmFsdWUuDQo+IA0KPiBZZXMsIHBzaXplIGlzIGFuIGluZGV4LCB3
aGljaCBpcyBub3QgYSBzaXplIGJ5IGl0c2VsZiBidXQgdXNlZCB0byBnZXQNCj4gbW11X3BzaXpl
X2RlZi5zaGlmdCB0byBzZWUgdGhlIGFjdHVhbCBzaXplLCBJIGd1ZXNzLg0KPiBUaGlzIGlzIHdo
eSBJIHRob3VnaHQgdGhhdCBiZWluZyBleHBsaWNpdCBhYm91dCAiZXhwZWN0cyB0aGUgc2l6ZSBv
ZiB0aGUNCj4gaHVnZSBwYWdlIiB3YXMgYmV0dGVyLg0KPiANCj4gQnV0IG5vIHN0cm9uZyBmZWVs
aW5ncyBoZXJlLg0KPiANCg0KVGhhbmtzLCBJJ2xsIHRyeSBhIHJlcGhyYXNlLg0KDQpDaHJpc3Rv
cGhlDQo=
