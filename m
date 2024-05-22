Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 82F9B8CBF46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 12:31:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cFxJXPvw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VknTT6zB6z7937
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 20:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cFxJXPvw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VknSk3lRKz3gBG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 20:23:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPtJ7NWhvf/33kyx5pUWIMnDrEr7MyaQ70ZJhjO2/u6UgntPJds1Mq0dad/AZb9SUvlNZBynkUHtIwCciKhQu47oBteicUo9NFs4uebxWMTmoq8Tt7gb6ukA55cW6NFqvQ6iav0+lsWhWswfEOYYQs+UMYbd0VF8Wmb7uBrZl8Jvq/wyS8acEzoYWSKqUe9wfWWtLS0D/NmwefFW8geK/t47s1YyWqq9rrjqGhCgn9CSpPLKQmT2XkMVXcpN70sfkdgGufXV1quG48Bsz/RfYHA/RQaXjBrtEfor5k74jOdfvEyp1C0HOzkpDHxtL7tUgt4OadObemEpVA2OqZXh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+UbT5AXiHsAYa7heigH8V6la913V73KBy1+D5W1qYE=;
 b=WKDgPW1TAwGKiET3OuHjamPnWq6CFnNeKmMZp2wQnTRf9pb9pjR8v8wXjHRpO7govV8r7TVUhi74tuPc2M98PDxl0zhluFUuBdSNnMxzdZBvbGhqjoMmuO876IsF/8AVzxq0wERA6QXHpm7hj75EDLyL/5wMw/69BQWTOb0jLThjw09Xerw+K4p3yBzP/mfG/dsTImS139Uo02yBWhr2LIoOpfggyUEY1/dw9RfaZMx+eZkt0aw42BFXEbJTlI6azBaJ/KqE752wTt/p61PgVbhkfAFAqaFQ9P1X6AAdbXdrT1WhMgX+1Bk1qWEhEGhqAH0f70lW/YE+Yn/Loqmieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+UbT5AXiHsAYa7heigH8V6la913V73KBy1+D5W1qYE=;
 b=cFxJXPvw9eIX1MAqP9OA9+uS0XF+cu3Y2/iJtH/mcM4ivl0H+TVqs9lOzZEY356Lwp5sg09P5fIL7MbO42KdELFptqW7EY/UrlpdpM6EsjodJaZEoF4u5YQwD2rag5I4jiGz+cYV7tNdJTIEaBCFOC0OCrl8imHufMAh300ZGTZHyLAVBrLosOUNhiEwU/kdAk42S0KRHqxZnOPH1xz7lSFwameFpmorjDDQgmmSjuIM19oc7pOGHfEOnJyxEde7iQ5gSE4/Djf+mjQ2aZxIxdHRzQZo8esIKl7UcmL195gZRrX4f7CFB5YOMmsoFfM0DPk1WVIZ/m3BJflJCfCd/g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PARP264MB4586.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 10:22:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 10:22:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 03/20] mm: Provide pmd to pte_leaf_size()
Thread-Topic: [RFC PATCH v2 03/20] mm: Provide pmd to pte_leaf_size()
Thread-Index: AQHaqIxwS0Sp+Ej9bkO5xpTFqDtxcrGhdHAAgAGebgA=
Date: Wed, 22 May 2024 10:22:45 +0000
Message-ID: <268458e9-0204-4b88-974e-a23fc9c86205@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ab93995d27055f055249e1e8770b22f89c980322.1715971869.git.christophe.leroy@csgroup.eu>
 <ZkxrzrD5aJbqTq2Z@localhost.localdomain>
In-Reply-To: <ZkxrzrD5aJbqTq2Z@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PARP264MB4586:EE_
x-ms-office365-filtering-correlation-id: e4c167ca-9c5c-4d6c-c120-08dc7a491f15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?NEpBOTZpdVB5Wk93czNWcytMSmFBSWFKU1VVMG1KYVNObGxPcnNndSt3UDNT?=
 =?utf-8?B?MVYyZ2h6UGNwa24wYTg2bEozME14TFNVVmthelMxZVJPa1JHekFkVUtvQlA0?=
 =?utf-8?B?QXhxU3ZhSzBxcnMyTk9QckRTNzRoRGRzU0puT09oZUxYWElOU1NFNkF0c2Ey?=
 =?utf-8?B?REwxVGJCRFBWSVZXZnJ2enpLVVFIY2dNRVVTMmFYUDNWSVoyVmFTWm0zcG9F?=
 =?utf-8?B?NDAwNFpXcmFaMDhlT1gwelpnTURhNGtSbUlDNTBFTEhzenA0RmQwQmVxNmFW?=
 =?utf-8?B?Wk1JUWllZC9iZE9kRzVQQ3BiQy9NdnFsNlFpNWpyRitlOEhESW5qL0I5cVBD?=
 =?utf-8?B?ZFR4MEFDcXFqdWptUWlqTFhzU1RuV29hN1hXczZLN2crRmJGamRzeDgxaGhM?=
 =?utf-8?B?cVpJbVVLcmo5eGxMQ0Y0cEZDaTcxYll1UE9ET3N3am9iNGVwZjc5bGU4bzVW?=
 =?utf-8?B?V2c4bWh5eUNIalV0RUc1enhrU0dqVk0xS1doREVkMllIbEVOUWp6V1FpUGM3?=
 =?utf-8?B?RXFobm5ZUFh4U0huQ25qaGJlOHpqaXpoZzQrOGsvRnhYOFI5dkdIcmJxYWU5?=
 =?utf-8?B?UU1CZlNwdmJJMklySDNoZDJDa1k3cWRxUExMdTkxTmRmNU1mYjhYR3dQaGtu?=
 =?utf-8?B?Z3h6UEJNUFl3cnRsME1wcHRnZjluaDcxNzlLalUrd3EvV3dQYU83dFpCMGE2?=
 =?utf-8?B?TGJwdFgrbEVLaitlMmMyRG9QK0dLTWsyTVhlN21mMVVaR1RZQUJUVVFFK2Vq?=
 =?utf-8?B?dzBYTVUzeHRDWjdJNkp5bjBIN3RnNExUZUNSdlNkSW9BY2tRcU1MRG05Zlpn?=
 =?utf-8?B?UGRqR1RHQnIwRXlsTTkrT1hyNWpTdUNjTWU0TE10a2dZaTFMNFdvS2IwdXZP?=
 =?utf-8?B?eDdjbFJQdDRWYnVaT1hjRThldzdBOFZWeEdOWFFlOWVDRzlPb3pvVDY1Y0Ew?=
 =?utf-8?B?ZTAwTHNwd2ltUVg0T2wrRGVFcEJOYk1CSklITEN1d3kwaE5JOFdmRURaQ1BF?=
 =?utf-8?B?OGVhZlBPSWVVRlVzNm9xRlRlUUJockh0QlZhdkdUUk5zclhxSnllZ1c0QTVy?=
 =?utf-8?B?bkdERXdhNDJKRVcxeitqWmY1d1d2STB3N05ZOFp6dnpiM0ZIZHNxdGU1V1Uz?=
 =?utf-8?B?WHg4TnN6RXZpQkxtU2hnbitCaGlQYWEycThFN2JVUzNDRkR6NnlRTUc3Rnpk?=
 =?utf-8?B?dWY1bnNPSklLUEFvdCtpN2NYYmoraU5ldGc1UytwRlRUM05TdVQ4c1VEYm9H?=
 =?utf-8?B?N040ejFoOGdnaFdQdjRTQnRtWjAyYlNkSHJLRjFaUFB1YVBELzZVZkJZN2d4?=
 =?utf-8?B?TWlVQ0ZvVi8zdFVLdGdQVXZkY3NjRHVhOXgwMHlYRzNoazM3b1kxME4xODdD?=
 =?utf-8?B?QzRSeFIyT1M5cnJWRkNwVnpIUWZCbzFXZU9UbGRjSXVpNzdFRWYvSnVXUk5S?=
 =?utf-8?B?dUZQOVFvaWQrRHpTZG9qZ0FvazVLbTgyTjJ4SThQN2JvdkJic0EvUWs2Y2dK?=
 =?utf-8?B?UEVXUStGK0lVdmVOSkdHL1dEVWxDTkU1ZEdJMGxvTFpJMHJpWDBLUHZVb2RY?=
 =?utf-8?B?NHZJbmRmRnNxWnpoYjBDSFY5MTk0L1cvVmVCNUV6dVUrdWF4ZWx3TkxvRXBl?=
 =?utf-8?B?TlJTbDVSVVAycDBHSnRteVVLTXIxd2VBR09SSzNiaUZ3amRpdnZTb1N1L3kr?=
 =?utf-8?B?WjBEMmM2TDhOYzRQUnUzUm9xdWJmTmNOUXF6eXdQZFl3b2lWVU5jOGZleXBV?=
 =?utf-8?B?ZXVYdkRkSE5hZnBudW5CZFp5ZHdFQXBUMTBESC9pY3lOYXBrUlFmYTI4Wm91?=
 =?utf-8?B?M244eHBsY0s2c0crNkhTdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UUFwRDgrWW9FQVAwSmxuMy90MHdjNW1hcVZUWElIR2orczQ3ZnB1SXlob1JQ?=
 =?utf-8?B?UmxhYkVWQnlkeFVnVGV0eXlNNEZnSi9JQVFkZmpWN1RVTlUzdEpDWlBiMEdL?=
 =?utf-8?B?cExPVHZDcjlRTjFDY0V4cWhhR0g5R1EvVUc4eENIMWtkUkM1Qmd3cmloM0ZX?=
 =?utf-8?B?N1lCUTNiODVpZEJUNU4xUjEyVW51MmlCZGxqS01yN2FuM1M0VGVHZlF5ZFZh?=
 =?utf-8?B?MWIyYnhEQkdHQ1hxK2w5dUIyL0tXclovSlhvWGVmZTllajR2SDFCYStiOHZE?=
 =?utf-8?B?VEJJVlhCR05zU0lxMGovdzFqNGNua1lQNkl0bloyRDVidzlBand1WTRzSWFp?=
 =?utf-8?B?bnByRXZiZ2VZUmNhOGZYSTlkUjh5d3dLUzB2MFhmRko0OU50alBDcjZlRElk?=
 =?utf-8?B?R1BTdlc1WE45Y3BIVzhyZWpLREwwSHZwWk0zRk1WbWFLV3djVUZ2dmdrdnBa?=
 =?utf-8?B?eEpqWE1lMGU0c3pUT1VTRjllVGMwOXo2S1dpVndFeVFEYzdsRDh1TDF5NmYv?=
 =?utf-8?B?MFlVTzFPUFAxSk9zRU0vMU12YXVkMUZoT2NWUmxVYjdiL01CaVVicUwxRGJY?=
 =?utf-8?B?WGtCQk9BSnNMUnE2RS9rWnpUa1N4NDNNRVBueWZEMUhCaytBd2cyR2MzSEo0?=
 =?utf-8?B?bERsSXY5ODV2TlNLY2lENE41V1BlNm8ycGJrM0hEc2RwZXRnbEhqUWNVZzlV?=
 =?utf-8?B?cEJvYWFYd0cyNVpsSmtVdnZTTHFXVm5CYUxWOFlNVXdHUXJpYnZVbkxhZEpT?=
 =?utf-8?B?UW04c1pNamVIVVYyd2gwcXQxZ2p1RzlHVmVVY1hkUFpETHdpV1VPZk5PNER0?=
 =?utf-8?B?dmJkTkljbmNvQmpPU3lNUXR5dW1Ea0c4L3RnODNidEw5c2htRStaemZvekZK?=
 =?utf-8?B?SU5ZRDRQQVo0V2VzVG9ySVZxcnZzZ0FGTTFENGYxaTJ3NmNCTWFoUG1OTmdP?=
 =?utf-8?B?cFBQK3ZDVWZlQlB1T1dMZS95eldIVkdyNGZxMklwdlByWi8vZ2lhbzNOUzhW?=
 =?utf-8?B?ZnlMb2J4dEgwb3Z1YkRpZkE5VDdBbCtGdmFpRnY5ZFZMaUlVTnNRVzJQUWVN?=
 =?utf-8?B?L0pkT1pTbUhMVWhZbHZOcWU0elIwZ0JjalRqRmRUNkszOFQvOWlJVEhjZHZJ?=
 =?utf-8?B?clp5TnBxVzk5YzdzZlV3Ui95NUZ1c2tjaHEzeHdxUmZFWGZ6K3JDbEdPbnBK?=
 =?utf-8?B?cnFIYytVM2pyekxQazFLSlZTbmI2Z2VNcmVXQko0WWQ5bTNUcXBHTmtSb2R5?=
 =?utf-8?B?UGNhRzVlcFI2UnVyNkhiZGx6ZWFJVkhnZ2F5QWdtUUJ4N1g1SlUvWTFuZEFv?=
 =?utf-8?B?ckNQeHFvdzFnNXkzMUIzTjJIbXlEVEtyUlN1SVdKL1NwQm9TZ0JieVpKODls?=
 =?utf-8?B?UGlPc0hQQ3Y5Sk5HeWQwcU9PaHdNVDA2TVAvQkx2c0dCelp6VlRseGJpVitp?=
 =?utf-8?B?c0xQcVZWYVBaSGhqMjRwZjJwVTA5NGdCcEI1THUyUjQwZzZYYjBGaU1MVlhJ?=
 =?utf-8?B?U09YMjhpRGhKNnYzOWI0TXpTZHlBRHdVcHVoQ1RIcld0NWVSY3lEWTI3Zk1D?=
 =?utf-8?B?SzlqSkczaW8vdGttbUs2N2R3b3o1WFdpWGw2TEtsazkzWFlySTZvK3ExcVFa?=
 =?utf-8?B?NmdtVEVZZ2xWeFdnVHMzNGRqbjlmRG44ZnlHTlRCd2FFQStWZU5NUTRlZ0py?=
 =?utf-8?B?cUtkV2ZVTnh2Z3dPWTNSOThrQnQxWGNGcmU5akNDWG5ZcWhQS1l4VDc3OTFY?=
 =?utf-8?B?WEl6alFQcjFhcGNTanB2L2I2bldtejg5d09OdlMwWW1XQ0dCOGRScE5xcGJh?=
 =?utf-8?B?MWI1U2ExU1FCd3dIckVNekJKL1JqT1lKTlMyRkFyZjc5ajM2N0lvbEZQcW1s?=
 =?utf-8?B?TGtTYUEycFFBODJxazBRSDg2R1RLNkxhVjVzZ2hGaE1hYldFY1BLL1AzR3dB?=
 =?utf-8?B?QUEyTDh2aXNsTm5KOW1Fblg0SUxIMElPbm1tV2RRbjhuTWI2NUZTMGova1Vj?=
 =?utf-8?B?MUhMWElWZ1RscjZXWkRidWtva29OL21VNzZDdVN5VHdVSjRoTERoazNqUFZZ?=
 =?utf-8?B?N1BzdWM0UUEvMzFVUzdPVUtybndaWGpoaDFuRjFpY2RSQWgySG9BNDdGbE1w?=
 =?utf-8?Q?jVnODRU3YtTsJ4d+A6edONrAV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2A0B0520E73A34AA882303A1725ED12@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c167ca-9c5c-4d6c-c120-08dc7a491f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 10:22:45.2464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHYBpoJ1hS2q31+Kg5iCqV4olbaJkfsp1X44UfeHSH2R6NgiHQKxk/BYN67OOcLASdOnPvsAfejOTetBN9h65rLrYIDFTGwRTMawzoKG3sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB4586
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

DQoNCkxlIDIxLzA1LzIwMjQgw6AgMTE6MzksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA4OjU5OjU3UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBPbiBwb3dlcnBjIDh4eCwgd2hlbiBhIHBhZ2UgaXMgOE0gc2l6ZSwgdGhl
IGluZm9ybWF0aW9uIGlzIGluIHRoZSBQTUQNCj4+IGVudHJ5LiBTbyBwcm92aWRlIGl0IHRvIHB0
ZV9sZWFmX3NpemUoKS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IA0KPiBPdmVyYWxsIGxvb2tzIGdvb2QgdG8g
bWUuDQo+IA0KPiBXb3VsZCBiZSBuaWNlciBpZiB3ZSBjb3VsZCBsZWZ0IHRoZSBhcmNoIGNvZGUg
dW50b3VjaGVkLg0KPiBJIHdhbnRlZCB0byBzZWUgaG93IHRoaXMgd291bGQgYmUgaWYgd2UgZ28g
ZG93biB0aGF0IHJvYWQgYW5kIGZvY3VzIG9ubHkNCj4gb24gOHh4IGF0IHRoZSByaXNrIG9mIGJl
aW5nIG1vcmUgZXNvdGVyaWMuDQo+IHBtZF9wdGVfbGVhZl9zaXplKCkgaXMgYSBuYW1lIG9mIGhl
bGwsIGJ1dCBjb3VsZCBiZSByZXBsYWNlZA0KPiB3aXRoIF9fcHRlX2xlYWZfc2l6ZSBmb3IgZXhh
bXBsZS4NCj4gDQo+IFdvcnRoIGl0PyBNYXliZSBub3QsIGFueXdheSwganVzdCB3YW50ZWQgdG8g
Z2l2ZSBpdCBhIGdvOg0KDQpJIGxpa2UgdGhlIGlkZWEsIGl0IGRvZXNuJ3QgbG9vayB0aGF0IGJh
ZCBhZnRlciBhbGwsIGl0IGF2b2lkcyBjaGFuZ2VzIA0KdG8gb3RoZXIgYXJjaGVzLg0KDQo+IA0K
PiANCj4gICBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9w
dGUtOHh4LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3B0ZS04eHguaA0K
PiAgIGluZGV4IDEzN2RjM2M4NGU0NS4uOWUzZmU2ZTEwODNmIDEwMDY0NA0KPiAgIC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcHRlLTh4eC5oDQo+ICAgKysrIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wdGUtOHh4LmgNCj4gICBAQCAtMTUxLDcg
KzE1MSw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBwZ2RfbGVhZl9zaXplKHBnZF90
IHBnZCkNCj4gICANCj4gICAgI2RlZmluZSBwZ2RfbGVhZl9zaXplIHBnZF9sZWFmX3NpemUNCj4g
ICANCj4gICAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHB0ZV9sZWFmX3NpemUocHRlX3Qg
cHRlKQ0KPiAgICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcG1kX3B0ZV9sZWFmX3NpemUo
cHRlX3QgcHRlKQ0KPiAgICB7DQo+ICAgICAgICAgICBwdGVfYmFzaWNfdCB2YWwgPSBwdGVfdmFs
KHB0ZSk7DQo+ICAgDQo+ICAgQEAgLTE2Miw3ICsxNjIsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2ln
bmVkIGxvbmcgcHRlX2xlYWZfc2l6ZShwdGVfdCBwdGUpDQo+ICAgICAgICAgICByZXR1cm4gU1pf
NEs7DQo+ICAgIH0NCj4gICANCj4gICAtI2RlZmluZSBwdGVfbGVhZl9zaXplIHB0ZV9sZWFmX3Np
emUNCj4gICArI2RlZmluZSBwbWRfcHRlX2xlYWZfc2l6ZSBwbWRfcHRlX2xlYWZfc2l6ZQ0KPiAg
IA0KPiAgICAvKg0KPiAgICAgKiBPbiB0aGUgOHh4LCB0aGUgcGFnZSB0YWJsZXMgYXJlIGEgYml0
IHNwZWNpYWwuIEZvciAxNmsgcGFnZXMsIHdlIGhhdmUNCj4gICBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KPiAgIGluZGV4IDE4
MDE5ZjAzN2JhZS4uMmJjMmZlM2IyYjUzIDEwMDY0NA0KPiAgIC0tLSBhL2luY2x1ZGUvbGludXgv
cGd0YWJsZS5oDQo+ICAgKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgNCj4gICBAQCAtMTg5
MSw2ICsxODkxLDkgQEAgdHlwZWRlZiB1bnNpZ25lZCBpbnQgcGd0YmxfbW9kX21hc2s7DQo+ICAg
ICNpZm5kZWYgcHRlX2xlYWZfc2l6ZQ0KPiAgICAjZGVmaW5lIHB0ZV9sZWFmX3NpemUoeCkgUEFH
RV9TSVpFDQo+ICAgICNlbmRpZg0KPiAgICsjaWZuZGVmIHBtZF9wdGVfbGVhZl9zaXplDQo+ICAg
KyNkZWZpbmUgcG1kX3B0ZV9sZWFmX3NpemUoeCwgeSkgcHRlX2xlYWZfc2l6ZSh5KQ0KPiAgICsj
ZW5kaWYNCj4gICANCj4gICAgLyoNCj4gICAgICogV2UgYWx3YXlzIGRlZmluZSBwbWRfcGZuIGZv
ciBhbGwgYXJjaHMgYXMgaXQncyB1c2VkIGluIGxvdHMgb2YgZ2VuZXJpYw0KPiAgIGRpZmYgLS1n
aXQgYS9rZXJuZWwvZXZlbnRzL2NvcmUuYyBiL2tlcm5lbC9ldmVudHMvY29yZS5jDQo+ICAgaW5k
ZXggZjAxMjhjNWZmMjc4Li5lOTBhNTQ3ZDJmYjIgMTAwNjQ0DQo+ICAgLS0tIGEva2VybmVsL2V2
ZW50cy9jb3JlLmMNCj4gICArKysgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYw0KPiAgIEBAIC03NTk2
LDcgKzc1OTYsNyBAQCBzdGF0aWMgdTY0IHBlcmZfZ2V0X3BndGFibGVfc2l6ZShzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPiAgIA0KPiAgICAgICAgICAgcHRlID0g
cHRlcF9nZXRfbG9ja2xlc3MocHRlcCk7DQo+ICAgICAgICAgICBpZiAocHRlX3ByZXNlbnQocHRl
KSkNCj4gICAtICAgICAgICAgICAgICAgc2l6ZSA9IHB0ZV9sZWFmX3NpemUocHRlKTsNCj4gICAr
ICAgICAgICAgICAgICAgc2l6ZSA9IHBtZF9wdGVfbGVhZl9zaXplKHBtZCwgcHRlKTsNCj4gICAg
ICAgICAgIHB0ZV91bm1hcChwdGVwKTsNCj4gICAgI2VuZGlmIC8qIENPTkZJR19IQVZFX0dVUF9G
QVNUICovDQo+IA0KPiAgIA0KPiANCg==
