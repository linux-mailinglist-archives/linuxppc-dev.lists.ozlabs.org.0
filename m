Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4887A702
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 12:20:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TMFUfdf5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvp3J2dwmz3vfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TMFUfdf5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvp2V600Kz3vXM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 22:20:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYtjiky0WfQVLB5rLPYFcHvXZl3Ww13BX12q3wz0M2eB9PWDhwfkpHHs8ZgzIinECmkt1s78POYnulFhyc7WqK4YR+v6N1UvIQnOS1srbyiR4YhUT3EMVNfkGF/GqVX/yKLG2PWD675RNC9GRSQS3uEzCdkLF78zWZh75w5sTNKDFFd+WuaWGIYjAC4EpMh0QKNNwGf6cKzwOVPgvJk6w7Oto4Lz7MUNYMnbWTmm6lcrYVMdJI5B0aXEdMUz1f5/UUEnz908z1b6IIQTLuKWuXxPMxmYB3E7RJvpg+FZUhJKYO2CS0kwKnbGCBQSjJ98JviFQJWiD9Bq6IqpQmWI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXJMxIHIu8+f/Lf5ewMuHL8uLj1Z13dBk57KutPhKvI=;
 b=jubmvJlpZZbNoI0WhUgccnrHwzLJuzpTLpF9rQRB9gQB1Gzj8G2/f1BpwuYmGtCbYp9clYi1b4+7HxWdNLG/Jyt04DTOsTApYTDuPEvuo7RDM46gnnHNDIQvl83J3h+etRog5sOskGg6t0+jk/rvfqhaOr5h7cBRSHYKOTOBPl0vIiip3rpk674wDrh0wLijC9urMG3E+bA7CF6+1XMK+IuG3elMNK6M4txuo8FKoObF1jrgqmCdknEDnglSZ4L4wL3MlJD5rMffFqJ9VJhsn1AvBsSBldHQnJT8bmN7F5IlL1T5aOB3y6dpJpWVPwh6icIjfUzHJX7Ue6ztXterHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXJMxIHIu8+f/Lf5ewMuHL8uLj1Z13dBk57KutPhKvI=;
 b=TMFUfdf5vZAsy5aLQj0r2iGoy9gy5ji3S5WEnmWha57HIHlvd/oRXADfiRMbtHQYzh/S1rPXeW+c/yhSZWnp5zz1u0iUn8EeeaZ1Kiq1FSJFbnuxV5CIeXfVrR6VahBk10WCTWIKQvre4BFjN3VonwTNbhYwkxy/3+ajZMQXbVOirWvPiOa6UqgGp6DX24lWPRP7sRSkfXDfaVCRVfyMz8jF/gKByfeWp2/zddmgG2uZWDIvwSN63dxhLE8LELniaeqlJ2ZEctRTX5pb1dn83S3X+6Cbxus2PT+EM9Ne9k0ntCThZzSEkTfHWUCLSWaFWRMT4PGzOj67aozzDmYqxQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3699.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 11:19:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 11:19:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 10/12] poweprc: mm: Implement *_user_accessible_page()
 for ptes
Thread-Topic: [PATCH v10 10/12] poweprc: mm: Implement
 *_user_accessible_page() for ptes
Thread-Index: AQHadP3zRykee4FW5E2w9Kf2LrXTnbE1hq6A
Date: Wed, 13 Mar 2024 11:19:38 +0000
Message-ID: <6bf7748a-537a-4bb2-a9ec-44e5f4e4ee28@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
 <20240313042118.230397-11-rmclure@linux.ibm.com>
In-Reply-To: <20240313042118.230397-11-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3699:EE_
x-ms-office365-filtering-correlation-id: df156d1e-bfa0-491d-d05c-08dc434f788b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NrDXsKTZHr5RC3M8YsR2bd+7IGGzWg2mnJmPaG9/NuKDGmAdEobB1kwq83MMvvpl/qnje0l7U1nxi1nTW/SSL03HhPUXoS3Hb+0WXfNtdNtfeBonBL5yLZ+Mc2YdxDqIw2AegsTxpWkNC2PNAgodqUy4m6tFZHHnjl9J9GafOUxGCaWdjZp3kUBcSZTb+fl8ipgLz80ERUNEUcw9dU1DYFixRG6BWsW2P0Jqmg6TavwCDeYGpSdPm+k9hxhvncu5Bfk1t4YGe6modjjt+gvQgN7Hu0uV+RuQaC+vfCQC0TeVhYmCjtywn6wB7IZJJwTGswNZsBcYKoC/1D/qq3y84rgrMBbk1vA/FD3Bets2mp6KiCW0tRqkMi3wUtyXuXwIpGS7ermy2o7nz5ViN+K39rjQwbp1QYR17hmA7vCyAv+bRxjcmL8otOsz/41H8ZYOdMFdXS3ebFFSq1TqDmPQarUamXQY2NUBCJd2atYQxG3w+pnKiWFBNl1BZzBpO3xFg1o/Hgq1WhGoxcnJk4Tx1LzquRR2rqYHnX3QlusgfVZhaC2t6fCJrGCxXYvTkL5KnFuUYPi9vJETdJB5s+6wEt/HEtfc/e4EGbGRX/sn9KSPbQeu3Zb5BusMYF8zKQqa3njTLV7jeukSve4Lel6JGfUi7paUoFHHLAtaC4HfUp3YM5ekWXOchZv/7OD1j3bsHHXWZL9CkF7TdC9LUn45fw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVJuRE9RRVhLVldYcm0zSVd5Z0ZPckdaWFBycUtaSFpvcFBCUDFUaUJNUGpm?=
 =?utf-8?B?Yk1TUnJiR1hoWHIwNEtQZWtlMlZ3QjdLaTFUd21KeE1zTmovbWlXWkhoMzZ5?=
 =?utf-8?B?Q3BKMnFRbm1Rb1BkTVMyMk5nY3RLWFpjckYwT2ZMN3BLYnAvRWM2SzlvWkFs?=
 =?utf-8?B?S2dFOU1FQW9EYjM4NWwzYUJtQkRuVVhxM1dFTWVnSzdYMXZiR0pLd1REZ1lo?=
 =?utf-8?B?YXVuZFpWdi9jcUl4bmQ0USs5QlZHME1kZmZrbFY5dko4ZC9MUHpabzBIL0th?=
 =?utf-8?B?dnFPeTl3ZFluZC8xZzlONkd2RnhFWENBL3dwMW56RitnVU9XSDF0M2p4cGF5?=
 =?utf-8?B?SThqODBSUWEva1Z4d3NaSVZRQncyQ1AyRHhUSXZmNGJKK1NhN0FlSmZ3ZGcw?=
 =?utf-8?B?L2QwNUU1a1lER09rYXpiT2psTEgvUjkwaUZmMlMrcnErSW5ZZ01RNVlUZHV0?=
 =?utf-8?B?ZU5qNEZTZzcvZUhTUmRzZjZ5Z1pWaGZ2MUpEbDJZYi9SRG1LUzRCT0pRSEc0?=
 =?utf-8?B?aDJmOUFPRDljRTYrVGx0cGJsK1R3WU95R25KS21DK25ZZkdGZGM2djdKYXl3?=
 =?utf-8?B?RVpEYW0wc3dBdFFpTHpUWi93eVVRR3NUM0UwbUNkU3pHZkFCcDFESzdtSDhu?=
 =?utf-8?B?UjdNRHBUMUp1cHlocUNoRUhUS1g5eXZ1WmZ3TG1wNlp2Y0E1Uk9OUkRGSUJZ?=
 =?utf-8?B?UTlmQm4rY3UwZ0V2WDBBNE1RVGkwbFRvQkQrcmdad1llOFZoV2N3alVWVjBw?=
 =?utf-8?B?d2NxcHJWTFVsT1AyTkxFQ3BDTkZjQXZFRWdvVmQ4cVNWODFYRjFpT3FLS3Yw?=
 =?utf-8?B?R0pLWDdhTHJUb2NjbDlVUTc1TXFKSnNMcmo0TFpGbkZ5cU1MVHR4TGh1cHl6?=
 =?utf-8?B?ajliWVdsNlM3cFcvbXUyMllsOENJc2tJV1A4UXdvekJDd2VrZVIxSG9hZGxH?=
 =?utf-8?B?TXBmMHArMHZCTE9oKzJXbDRxbU01aks1VzdBdExySHpkRTdwTTVROGRmN1Q1?=
 =?utf-8?B?Tldtb3RVUU1sbEh0SUZGYUVNY0hRU2hsWUduRVg0RlZWWk5Ia1puZlYzY1Ex?=
 =?utf-8?B?enM1OTdwbi9tRk5XWVhUbUVldk80elBLNmIyNE5STk9WNjhYWnJlMUJ0MnRk?=
 =?utf-8?B?LzA4NXZYVUFjUEUzNVNIZGE1K2Mxd2lqNU93TEdrbkp1QldGM2szSFM1SThU?=
 =?utf-8?B?QW1LY0FJeWVUT1VMTDBYRndBUXpJRG9mZ3ZCWlBLUWw2RlJZblM3TzZROWpi?=
 =?utf-8?B?czE1YW5vbHJqVXpyS3VORXRyYTMzOVdUMFp4SC9QS1dTTXczclJVbTJ4Sndn?=
 =?utf-8?B?VjhpQ3dBYi9XdjI5Tm42U0R6YVJqbEdsSnhqTGFRcERHeFZTYlBQbm83VEJk?=
 =?utf-8?B?SmUxb1F6MjY5Z3d4eVdVN1hQYm00OHQ4ZEVGbGY2ZDVNNzRiN3hOM0tjakFn?=
 =?utf-8?B?YXhvRkQxUlA1UEVhM21oZnNrcFZBUm9oTzBGZEl4eUF0UHlJMW1rRUJ0MVhP?=
 =?utf-8?B?a05vQ2dHRDQ5SEdGWWZOYnBjMFpmT2ZnT1NSMDdzMTNTMWpmendwR2lKeFNt?=
 =?utf-8?B?QjJ0N1Vqd2JBR3Y5YVlOT1NTUk5KUldRN0c0dlRIa0NNemp3cnBvMjA2YnZB?=
 =?utf-8?B?bE9tSkJHdVJMbzVCOGJ6NHMrQkJRdUl0V3o1OFdSQkQxTnVIUTh1OVlTMkc5?=
 =?utf-8?B?QzgwVEx4d0Z2MHo0MnpwOTJkSjdVQ0JvU1pRVDlqNEo5TjN1aWlCbkhYeHh3?=
 =?utf-8?B?T3NSNTVmZjl0bC80Ym5aM1NseUkvUUhRWHNVUVFaNnAvRVVZRW40WUp0TkxV?=
 =?utf-8?B?am9wc3drRWFWNGtYWEhKWWZiQzQrY2ppYnRHenFlbXV2RkF3dzluOFhvMTZM?=
 =?utf-8?B?NCtEemFQSVZ1NkJta010UkpsTEdWSUNsai9xbWN5MFg0elFDQmRtWXZoN0VH?=
 =?utf-8?B?Q2orS09Ba0Z0MjlSSXdCSjdIRkwybDBJaDhVcDRzSGtjNW5sNC9CL3JUOWZU?=
 =?utf-8?B?Z25yMnVhK051cktzL1pmTDRzbFBsK0Y2Z1lrTzZzbldudmVxMyt1TDRBaWpR?=
 =?utf-8?B?d3VJRTA1S1BoWlhRdnBUNTVJemE2RFBzbVB1MGlTRFZJdGRLOWx4Wk1XY0or?=
 =?utf-8?Q?ol73b0TBlGyBAd/r2jLhwLcf8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8C6B4D676EE9E4AA9CDF759B788F8BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df156d1e-bfa0-491d-d05c-08dc434f788b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 11:19:38.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGcwVknZn1N4RiaFpdsrbUW13//uhxx0W+mNIoYUKfTlL+mmv14YGHm0lvLi5YWiZL01rrqfu+Ckni3HYACf5mAuzR1daqEctX8DYQUzeU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3699
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAzLzIwMjQgw6AgMDU6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
YWdlIHRhYmxlIGNoZWNraW5nIGRlcGVuZHMgb24gYXJjaGl0ZWN0dXJlcyBwcm92aWRpbmcgYW4N
Cj4gaW1wbGVtZW50YXRpb24gb2YgcHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UuIFdp
dGgNCj4gcmVmYWN0b3Jpc2F0aW9ucyBtYWRlIG9uIHBvd2VycGMvbW0sIHRoZSBwdGVfYWNjZXNz
X3Blcm1pdHRlZCgpIGFuZA0KPiBzaW1pbGFyIG1ldGhvZHMgdmVyaWZ5IHdoZXRoZXIgYSB1c2Vy
bGFuZCBwYWdlIGlzIGFjY2Vzc2libGUgd2l0aCB0aGUNCj4gcmVxdWlyZWQgcGVybWlzc2lvbnMu
DQo+IA0KPiBTaW5jZSBwYWdlIHRhYmxlIGNoZWNraW5nIGlzIHRoZSBvbmx5IHVzZXIgb2YNCj4g
cHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgaW1wbGVtZW50IHRoZXNlIGZvciBh
bGwgcGxhdGZvcm1zLA0KPiB1c2luZyBzb21lIG9mIHRoZSBzYW1lIHByZWxpbWluYXkgY2hlY2tz
IHRha2VuIGJ5IHB0ZV9hY2Nlc3NfcGVybWl0dGVkKCkNCj4gb24gdGhhdCBwbGF0Zm9ybS4NCj4g
DQo+IFNpbmNlIENvbW1pdCA4ZTliZDQxZTRjZTEgKCJwb3dlcnBjL25vaGFzaDogUmVwbGFjZSBw
dGVfdXNlcigpIGJ5IHB0ZV9yZWFkKCkiKQ0KPiBwdGVfdXNlcigpIGlzIG5vIGxvbmdlciByZXF1
aXJlZCB0byBiZSBwcmVzZW50IG9uIGFsbCBwbGF0Zm9ybXMgYXMgaXQNCj4gbWF5IGJlIGVxdWl2
YWxlbnQgdG8gb3IgaW1wbGllZCBieSBwdGVfcmVhZCgpLiBIZW5jZSBpbXBsZW1lbnRhdGlvbnMg
YXJlDQo+IHNwZWNpYWxpc2VkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxy
bWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2OTogTmV3IGltcGxlbWVudGF0aW9uDQo+
IHYxMDogTGV0IGJvb2szcy82NCB1c2UgcHRlX3VzZXIoKSwgYnV0IG90aGVyd2lzZSBkZWZhdWx0
IG90aGVyIHBsYXRmb3Jtcw0KPiB0byB1c2luZyB0aGUgYWRkcmVzcyBwcm92aWRlZCB3aXRoIHRo
ZSBjYWxsIHRvIGluZmVyIHdoZXRoZXIgaXQgaXMgYQ0KPiB1c2VyIHBhZ2Ugb3Igbm90LiBwbWQv
cHVkIHZhcmlhbnRzIHdpbGwgd2FybiBvbiBhbGwgb3RoZXIgcGxhdGZvcm1zLCBhcw0KPiB0aGV5
IHNob3VsZCBub3QgYmUgdXNlZCBmb3IgdXNlciBwYWdlIG1hcHBpbmdzDQo+IC0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgMTkgKysrKysrKysr
KysrKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICB8
IDI2ICsrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFi
bGUuaA0KPiBpbmRleCAzODI3MjRjNWU4NzIuLmNhNzY1MzMxZTIxZCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAgLTUzOCw2ICs1
MzgsMTIgQEAgc3RhdGljIGlubGluZSBib29sIHB0ZV9hY2Nlc3NfcGVybWl0dGVkKHB0ZV90IHB0
ZSwgYm9vbCB3cml0ZSkNCj4gICAJcmV0dXJuIGFyY2hfcHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRl
X3ZhbChwdGUpLCB3cml0ZSwgMCk7DQo+ICAgfQ0KPiAgIA0KPiArI2RlZmluZSBwdGVfdXNlcl9h
Y2Nlc3NpYmxlX3BhZ2UgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICtzdGF0aWMgaW5saW5l
IGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90IHB0ZSwgdW5zaWduZWQgbG9uZyBh
ZGRyKQ0KPiArew0KPiArCXJldHVybiBwdGVfcHJlc2VudChwdGUpICYmIHB0ZV91c2VyKHB0ZSk7
DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIENvbnZlcnNpb24gZnVuY3Rpb25zOiBjb252ZXJ0
IGEgcGFnZSBhbmQgcHJvdGVjdGlvbiB0byBhIHBhZ2UgZW50cnksDQo+ICAgICogYW5kIGEgcGFn
ZSBlbnRyeSBhbmQgcGFnZSBkaXJlY3RvcnkgdG8gdGhlIHBhZ2UgdGhleSByZWZlciB0by4NCj4g
QEAgLTg4MSw2ICs4ODcsNyBAQCBzdGF0aWMgaW5saW5lIGludCBwdWRfcHJlc2VudChwdWRfdCBw
dWQpDQo+ICAgDQo+ICAgZXh0ZXJuIHN0cnVjdCBwYWdlICpwdWRfcGFnZShwdWRfdCBwdWQpOw0K
PiAgIGV4dGVybiBzdHJ1Y3QgcGFnZSAqcG1kX3BhZ2UocG1kX3QgcG1kKTsNCj4gKw0KDQpHYXJi
YWdlID8NCg0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHVkX3B0ZShwdWRfdCBwdWQpDQo+ICAg
ew0KPiAgIAlyZXR1cm4gX19wdGVfcmF3KHB1ZF9yYXcocHVkKSk7DQo+IEBAIC05MjYsNiArOTMz
LDEyIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdWRfYWNjZXNzX3Blcm1pdHRlZChwdWRfdCBwdWQs
IGJvb2wgd3JpdGUpDQo+ICAgCXJldHVybiBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdWRfcHRlKHB1
ZCksIHdyaXRlKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHB1ZF91c2VyX2FjY2Vzc2libGVf
cGFnZSBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRf
dXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVkX3QgcHVkLCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICt7
DQo+ICsJcmV0dXJuIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdWRfcHRlKHB1ZCksIGFkZHIp
Ow0KPiArfQ0KPiArDQoNCklmIEkgdW5kZXJzdGFuZCB3aGF0IGlzIGRvbmUgb24gYXJtNjQsIHlv
dSBzaG91bGQgZmlyc3QgY2hlY2sgDQpwdWRfbGVhZigpLiBUaGVuIHRoaXMgZnVuY3Rpb24gY291
bGQgYmUgY29tbW9uIHRvIGFsbCBwb3dlcnBjIHBsYXRmb3JtcywgDQpvbmx5IHB0ZV91c2VyX2Fj
Y2Vzc2libGVfcGFnZSgpIHdvdWxkIGJlIHBsYXRmb3JtIHNwZWNpZmljLg0KDQo+ICAgI2RlZmlu
ZSBfX3A0ZF9yYXcoeCkJKChwNGRfdCkgeyBfX3BnZF9yYXcoeCkgfSkNCj4gICBzdGF0aWMgaW5s
aW5lIF9fYmU2NCBwNGRfcmF3KHA0ZF90IHgpDQo+ICAgew0KPiBAQCAtMTA5MSw2ICsxMTA0LDEy
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwbWRfYWNjZXNzX3Blcm1pdHRlZChwbWRfdCBwbWQsIGJv
b2wgd3JpdGUpDQo+ICAgCXJldHVybiBwdGVfYWNjZXNzX3Blcm1pdHRlZChwbWRfcHRlKHBtZCks
IHdyaXRlKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHBtZF91c2VyX2FjY2Vzc2libGVfcGFn
ZSBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UocG1kX3QgcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICt7DQo+
ICsJcmV0dXJuIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRfcHRlKHBtZCksIGFkZHIpOw0K
PiArfQ0KDQpTYW1lLCBwbWRfbGVhZigpIHNob3VsZCBiZSBjaGVja2VkLg0KDQo+ICsNCj4gICAj
aWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+ICAgZXh0ZXJuIHBtZF90IHBmbl9w
bWQodW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHBncHJvdCk7DQo+ICAgZXh0ZXJuIHB1ZF90
IHBmbl9wdWQodW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHBncHJvdCk7DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCAxM2Y2NjE4MzEzMzMuLjM3NDFhNjNmYjgyZSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0yMjcsNiArMjI3LDMy
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9wZm4ocHVkX3QgcHVkKQ0KPiAgIH0NCj4gICAjZW5k
aWYNCj4gICANCj4gKyNpZm5kZWYgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICsjZGVmaW5l
IHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZSBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlLCB1bnNp
Z25lZCBsb25nIGFkZHIpDQo+ICt7DQo+ICsJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkgJiYgIWlz
X2tlcm5lbF9hZGRyKGFkZHIpOw0KPiArfQ0KPiArI2VuZGlmDQoNCkkgd291bGQgcHJlZmVyIHRv
IHNlZSBvbmUgdmVyc2lvbiBpbiBhc20vYm9vazNzLzMyL3BndGFibGUuaCBhbmQgb25lIGluIA0K
YXNtL25vaGFzaC9wZ3RhYmxlLmggYW5kIHRoZW4gYXZvaWQgdGhpcyBnYW1lIHdpdGggaWZkZWZz
Lg0KDQo+ICsNCj4gKyNpZm5kZWYgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICsjZGVmaW5l
IHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZSBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocG1kX3QgcG1kLCB1bnNp
Z25lZCBsb25nIGFkZHIpDQo+ICt7DQo+ICsJV0FSTl9PTkNFKDEsICJwbWQ6IHBsYXRmb3JtIGRv
ZXMgbm90IHVzZSBwbWQgZW50cmllcyBkaXJlY3RseSIpOw0KPiArCXJldHVybiBmYWxzZTsNCj4g
K30NCj4gKyNlbmRpZg0KDQpBbHNvIGNoZWNrIHBtZF9sZWFmKCkgYW5kIHRoaXMgZnVuY3Rpb24g
b24gYWxsIHBsYXRmb3Jtcy4NCg0KPiArDQo+ICsjaWZuZGVmIHB1ZF91c2VyX2FjY2Vzc2libGVf
cGFnZQ0KPiArI2RlZmluZSBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UgcHVkX3VzZXJfYWNjZXNz
aWJsZV9wYWdlDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdl
KHB1ZF90IHB1ZCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPiArew0KPiArCVdBUk5fT05DRSgxLCAi
cHVkOiBwbGF0Zm9ybSBkb2VzIG5vdCB1c2UgcHVkIGVudHJpZXMgZGlyZWN0bHkiKTsNCj4gKwly
ZXR1cm4gZmFsc2U7DQo+ICt9DQoNCkFsc28gY2hlY2sgcHVkX2xlYWYoKSBhbmQgdGhpcyBmdW5j
dGlvbiBvbiBhbGwgcGxhdGZvcm1zLg0KDQo+ICsjZW5kaWYNCj4gKw0KPiAgICNlbmRpZiAvKiBf
X0FTU0VNQkxZX18gKi8NCj4gICANCj4gICAjZW5kaWYgLyogX0FTTV9QT1dFUlBDX1BHVEFCTEVf
SCAqLw0K
