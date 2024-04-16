Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 949478A69A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:33:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GHRa+JfG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJhkp2QFQz3vfq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GHRa+JfG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJhk46kH0z3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 21:33:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMbtUzgkn+6WiMZdp2tSRQD6SqBqljQ2YEWLIzKySn+MF/7+6uo5tDL6Prj4OBkiaGHCQ0BgR2t2O7B4NTYscFmRA+h44NI6UbG8XVTSI4vbdiZ0m4NMJtYHhTW/e9HrE2/udxq4Jw0eI7BkdXgCJ/GSw//LmNuRpIQmjE2v9yElPQcxxHbgMPycJ9sRQQuxnU5AbIKveDaEqQwtU/XQB9i4mXSmXJoCimPdM5iMBpn2w2gS/gkttD/ORaGEuY8sjH12mDKANI7H7fBrYMsqLuTrumXpJd2pE7U7n/rTpAXEObNfr79hpbshyxUudPDjPAu/X9k6FBMuv8hW+VR4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhsT3OsX+8+Dm7V8mu8l100PwluW1lC8VCNPSaNVky0=;
 b=T0XCTT3n5jm3DKPQr3xlbZETLCt2ntvqnc1C64FSBC9tXCM7mk7JV4sGG6eARkKB9dKxnFEpUotdKZlylLtypa1PjF05MZ1m3kgvxflA09CvK19UwX2Fu1SZR/gtSeVnQBOf4a4Kh/Il4iXOHcrtwLYfde53I89swsozgkpjLPXkyq/1Vp6T6uZbFBckKYScfYSQubx51vRoeE8hyIQ+LZQgTz55NRfwu3df4Vtd6u7ZlSHds/iJlTyzOLX7+sQ17aFWDGQI+BsMXpv9vP1Bq8OofFr5RRT5fT8wWYY+ybmKkNjoEPYZ7wbxeiB2jhBMf3mxPftVf4bHO0bunVi79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhsT3OsX+8+Dm7V8mu8l100PwluW1lC8VCNPSaNVky0=;
 b=GHRa+JfGh7k7NWe/c+gqygy23KHLvm4BbPm08hK+CRvAFM/slCDlACIBnKqTEbmPyHJ8r4d0ag59qyW+7EpxDmV2Zckd3CRq5ttLbKbyp2gBRtKT+jReEon1fz/mH9/6S9JKw76QnM/mDgbw2PHIdFMbhY2KhHymoeIdE6JkWheUAwZaSmrH9AIcg9B6LTP4lPQLtWIsVONz2ihanz4rc6IzFyTDCS4vIVCaHfWn1rsOtSwZr1OYbAwU9LV9tZhwUBI+gzAjIBAh77B34FQvSPSysIL653bAC7bSHE5A1V6X5PI5jr2DgRg1K6WLYdl6Y+rFGRhO3ZWTHq2i2mFOCg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3594.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 11:32:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 11:32:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Markus Elfring
	<Markus.Elfring@web.de>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
Thread-Topic: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
Thread-Index: AQHajwiUZ49WFhSb3kyGC8qA5pa//LFqv4eAgAAGBwA=
Date: Tue, 16 Apr 2024 11:32:51 +0000
Message-ID: <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse>
In-Reply-To: <87plupbm0c.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3594:EE_
x-ms-office365-filtering-correlation-id: 28b8d700-6e3e-4981-5047-08dc5e08f352
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  =?utf-8?B?cENsaDlRR3h4cHFwRS9TWHpEU3VObUMwWmM3R1VwTzhwb0xJaFhUNmNZWGpS?=
 =?utf-8?B?Y3BTM3MvaWlKalhhNUNhcWQ0emVDMEFDSzk3MkNjODJ3SHdxZTBHTlBMVS9H?=
 =?utf-8?B?aWZLNGRxdGhZTDNKVUhnYUJHRndlT1QySEhIdFRQY25acURNRlFrcnlCU1R4?=
 =?utf-8?B?K1d2VDBaUFYyV3M0Z01wY0lwSkFoZ0lsVHV2UVdPeFZuWHpsY0NuZnZIWEtz?=
 =?utf-8?B?c1FvMFpVUWNPRG1ERTFheThlTkx0RzJkdHlSdGlVcDdNclhrSDhhSDlReW11?=
 =?utf-8?B?Wmk0U0FOcDdTZDljQlMyWXo2c3RCYzVsZnk4TzBWdU5oYVZFanh3UFkxSFBE?=
 =?utf-8?B?Q3RySFVWZkZhMzduVUZ6RlE0a0NrNmlLOWRTQ2dZZWFlK1kyUkZwZDFwT29y?=
 =?utf-8?B?ekdGTlBGdm9vL21ZOGxVU2FHUUVHYlYrWDdOUXlDNlpILytzUzhUZHE5V0k1?=
 =?utf-8?B?c2ZyblNFeFFSV1FuNjQvekpzakVlSXhIVWdzTTBpd2xjSEQ0eDBCeGhLUU43?=
 =?utf-8?B?Y2JyY2VtUTdvejN1VHAxMjNLSnRUZzZ1b3B6MDkzRytOQkFBSU9ONzVRU1or?=
 =?utf-8?B?eDhlMmlBU1IrS2syTWJrVDhHOHFwVWJKckFOUjNWakE5L3VZc2tEOVdnemly?=
 =?utf-8?B?cVFtcTVOQjVnWFBsSzFxQ0FXNGtrOFJSRGxwcUFLalg5QmtuQWw0YXdHQTBs?=
 =?utf-8?B?eElnL2Z5M2hwODFPUUM4dUZqTkFycVFDUDFoRDlNSVBSbG9ja1R0Q1pDeTlM?=
 =?utf-8?B?b2l4VmJOc3piQURyQUdjUTFkQjN5TEYzNlhxbUdiWXZIdjFqQjBNNzNJZys5?=
 =?utf-8?B?U0JZdGd2ZStDTnVWNy9NTTd5NnJSdEkrczdjZmQwYzdDbVd6VGEzYXhLVGRa?=
 =?utf-8?B?ekk3dUtVZzVWd0t1Tm5VcTN6T2dVcitlLzlueWVmZXBlbkZQaDdHakl5UEJT?=
 =?utf-8?B?QUxYS2tuK1EzdGRGOWtiV3BjdTZKM2JPMUNXT20xOTBuelNNWC85SmF6NUU4?=
 =?utf-8?B?N1FPd2UzNlUvNEZrUnplb3ZDNWQ2dmhlS3lCdTc3a2pqSm84ZU4xSTExdTM3?=
 =?utf-8?B?MXRreHRFdWtSYXd6ZFJSZjRLVGxwcVR1ZlZaWnFGN0R6RUZCQnNWaitFWmo0?=
 =?utf-8?B?aFJKODlTamRONEJSbEw3ZDd1TFNQL3NvMmFGdm51RXZRT0dZc0JrWkk5WkVZ?=
 =?utf-8?B?Ni9FcHgzVytINVJCakt6UnY4VFo1TFpub2lQdE04eklNd1lLSVV1WkdCak9k?=
 =?utf-8?B?YzBacWpVVmVoSGdBNk5OWkhtZ3FBZGlEamR2S2hzY1lEbHBSemdFUEF0UE9P?=
 =?utf-8?B?dnpOaG1LVTBMTGY2WmcxZFJQZ2syd2dYbU12YTJLb0FCVUZEZGl4ZzdNK3Nk?=
 =?utf-8?B?WDZXb2xXdDRUZnpzWHZmS1JaWTg1SDNtWE1OQnYxK0ZLbllRLzI3S01XM3JD?=
 =?utf-8?B?THFoVm1UbTlUSUk4czZZNmJLWUxzeTFydzlWUVN3V2k5UE1wNXM2WkNxMnRO?=
 =?utf-8?B?V0U0WnplU0YwK1FTSUJSS3FtVkNseTQ0Vmw4TDZDenZQSm81N0tmanNaUDFr?=
 =?utf-8?B?ajRUSWdURDJsL1JzVEIySFBOdDJEcWNLOXBKc1dEM1VuSlpOVnp1R211d3BP?=
 =?utf-8?B?b2s3RURkd2tDOElQOGtqd0h3VDYwb1hDTURzWkpZcmpZR3Z0ckN2MVkxd2Vh?=
 =?utf-8?B?UzNPdkdWQlFCUGgwbHE4dDdsWHlTOFdaWlROUFkwRUlUVE5nZUNIN0JBPT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3FnMFBVaWtrZTFOUSsyNUFlOEt3eEpnY3RkcGRyRzVkK2ZCTFo4c3N0aTVr?=
 =?utf-8?B?dWFxdmNjVUQ2M241WlR0MGRaaEdLbWZzcFBUZUxmR2plQTNlOGpyWUYxejZC?=
 =?utf-8?B?YUIveXQrQTVyOHh6Vk9BRzFxcTFucHFRVlBLczM4ck4vZ2hsWTcyWThXZlJZ?=
 =?utf-8?B?UVZNVUtmZWxsTE1OSG53YXA4Q0ZMKzRpdEZ4dVhjQ1UxaS9HN1ZUeWlJZmIy?=
 =?utf-8?B?dldzV0cxdjgzeGt0aDI0UGxxQndzTEcrcTVYV0pNN3pUUkZDZk9QZXkzQ2FJ?=
 =?utf-8?B?dkpsMDF1dXdFaUxRdVN4UXFVb2hnZmIwRVJhSytCL3RXWnR6WnJHbEp6aUdv?=
 =?utf-8?B?ejVFNlJ2bUh3cTVvaVdlaXIra0I2aStzUUtGNDlvc09iS0VvTXAvQS91bE5L?=
 =?utf-8?B?cHE5WTlWMDgzR3EwaE1IVGYxWDhnR0Y4VE1WZUwrd3lBWWs1S1ZhT1poSXJz?=
 =?utf-8?B?UWxlYzdyTDd3R2VZdEhlaUhBaXBKbnBudStjSklVQkVqcDNDMXZOUWZlWTYv?=
 =?utf-8?B?UjgybVBUSFFjYXNDMUs3SE1UQm1EZnFXNFhnVkFtVDEzdEFtcGhuZy9Hd3Fq?=
 =?utf-8?B?SS84Mlowb3ZTL0ovUUV5ZHR2dTcrRndROTg3WGZ1M0RUSGFod1gvUklvWWR4?=
 =?utf-8?B?SlJ2amc0NmZwV3R4a1I4RWpyM2tIMFgxaXVpOEpkcC9mSVYwRzRqRlNRcHVK?=
 =?utf-8?B?MXBJNzBIMjZEN3doYk0zSjdDZTY0Y1lNdUliRXY2M0pScWV4Zy9CRmM0L2Iy?=
 =?utf-8?B?V1F5cko2T0UxZzZyRVpjb1NjZ2FkREh1T0l0SDlnWUJhcFRabG1MZS9iMm85?=
 =?utf-8?B?S2FLRDhRZTBOV0FNY0Y4c2svcmxzenhhUkFxUzJqNzJUNlFnc3o4RVMxMFlw?=
 =?utf-8?B?Q1BXRU1EZVN4SUlyeEtoem8rNitPZ3ZuU28rRjhHcjVwZFNEd3VsN1k2cVNx?=
 =?utf-8?B?UFhja01sSGJmdndXemowRnJJNGx6WUtvRnBIRlp4VVFhQ0s4ZStLTlNFUWNv?=
 =?utf-8?B?NFBjK1ZjTXBtb3ArQTVMQy9uTkxFTmw3WnVib0VETmtLS2FnZGZiOXExeUpp?=
 =?utf-8?B?dmdJYngvR3NDZFZLRWV4UnorM0pvTWRudnAybFVsckNmRUpnYzBuM2JMeTRl?=
 =?utf-8?B?Sjcrc29qSUR1bW50TUtkdEUvM0YrMjI5Y0RMcURQdHUrRS9tTURrZHFnMTlR?=
 =?utf-8?B?YTRjSnZkR3ZhVHRqaUxielowTkRlS2tNM0pOcWZjbVQ0OHBHS0FKTWRYNWp4?=
 =?utf-8?B?ajBlZTQyKzVvMWhkQlVlUGZPVTJUZThXaGhmMmphZGRjV2xOb2lUem9lUGtj?=
 =?utf-8?B?QmhMZzRUaEpkWmFqQ2ZxK1BYMis2Z1hoN2lxdEMvZ2czeUZxNTRRNHdNMmxs?=
 =?utf-8?B?WVVqVkZONmZibCt1bVRuVmpRTC9samEwYWpjQ3BtVHBCU0NXS2NBeDF4cUZa?=
 =?utf-8?B?MVh5OHloMXRzNGRBb1JrUmV3RUVXYkd6MzZnYlpSVWVOc3g1ZWJoNlQ2cXho?=
 =?utf-8?B?SHBxOU5JK3ZUcit0cUZtN0JHejJoSnVyUVhFZkZyMFpjZlZJVnBhMTRQL0J0?=
 =?utf-8?B?STdZa2lKL1lGd1llamxlajljcDZ0Wld0M2NXei9uMjdmNmEwNVRaWFQ5SnV5?=
 =?utf-8?B?RW1qM3FXbmU3ckNDa2dCU09yNkd2c1JDcHpFZlFPMHV0blp6RHloVlZMcmhv?=
 =?utf-8?B?VzlRbmRkOW1URDAxM2ZrOEk0SFRRa3lHYUlPMHFTTTgyQWJROGtVMU5ZYnYx?=
 =?utf-8?B?bDN5N0JPMmVQMmcrWWhTS1paWDR0bHE3d2UrTk5jMVFaRmMxL3gyZUtRRDZD?=
 =?utf-8?B?MkRacHlndUhYd1kwYzVmOWxaa1cwakVYYy9HUnJHWEZHNnZoNEt1ZXYwRHVH?=
 =?utf-8?B?eXJDeW12UC9oMXFRT1JLYzNRZy9vSEp3N05NcHZkaFhuSGg2cDlwQVhNMFQw?=
 =?utf-8?B?d21jdVJWazVvdTNsbVFwTHY0T0pjUEpVb1JhWDFUL1l6aFBKWDVacnJRc3pi?=
 =?utf-8?B?MnBRcmRGT0F1M0VFTEg3REc4K0FHdmpJY1FIaVh2cm4vZWZ6cGEwQ293ZS9W?=
 =?utf-8?B?S2hCNXNEL0Raam1RYjZOTTk5eWVsYTlNYkJnenN0a2swQXpFa3BpN29ORkdq?=
 =?utf-8?Q?F0JUGjz44CsjmYDLBuVV1QSLj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D212CACD369EB54DB7C35319BCAAF141@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b8d700-6e3e-4981-5047-08dc5e08f352
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 11:32:51.4562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/GqTTcerK8Ta06jnfM2dpxO/XUYMyMtCPIFNMUCGPUx9rAe80eVz1w1BLCs4FiqgvrRGOcLO14pmMJlGdIYTkjozdT5akaOFuxmsghTW5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3594
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
Cc: LKML <linux-kernel@vger.kernel.org>, "cocci@inria.fr" <cocci@inria.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA0LzIwMjQgw6AgMTM6MTEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTWFya3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JpdGVzOg0KPj4+IEEg
ZmV3IHVwZGF0ZSBzdWdnZXN0aW9ucyB3ZXJlIHRha2VuIGludG8gYWNjb3VudA0KPj4+IGZyb20g
c3RhdGljIHNvdXJjZSBjb2RlIGFuYWx5c2lzLg0KPj4+DQo+Pj4gTWFya3VzIEVsZnJpbmcgKDIp
Og0KPj4NCj4+IEkgd291bGQgYXBwcmVjaWF0ZSBhIGJpdCBtb3JlIGluZm9ybWF0aW9uIGFib3V0
IHRoZSByZWFzb25zDQo+PiB3aHkgdGhpcyBwYXRjaCBzZXJpZXMgd2FzIHJlamVjdGVkLg0KPj4N
Cj4+DQo+Pj4gICAgT25lIGZ1bmN0aW9uIGNhbGwgbGVzcyBpbiB2YXNfd2luZG93X2FsbG9jKCkg
YWZ0ZXIgZXJyb3IgZGV0ZWN0aW9uDQo+Pg0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8xZjFjMjFjZi1jMzRjLTQxOGMtYjAwYy04ZTY0
NzRmMTI2MTJAd2ViLmRlLw0KPiANCj4gSXQgaW50cm9kdWNlZCBhIG5ldyBnb3RvIGFuZCBsYWJl
bCB0byBhdm9pZCBhIGtmcmVlKE5VTEwpIGNhbGwsIGJ1dA0KPiBrZnJlZSgpIGV4cGxpY2l0bHkg
YWNjZXB0cyBOVUxMIGFuZCBoYW5kbGVzIGl0LiBTbyBpdCBjb21wbGljYXRlcyB0aGUNCj4gc291
cmNlIGNvZGUgZm9yIG5vIGdhaW4uDQoNClRoaXMgaXMgZXhwbGljaXQgaW4gS2VybmVsIGRvY3Vt
ZW50YXRpb246DQoNCi8qKg0KICAqIGtmcmVlIC0gZnJlZSBwcmV2aW91c2x5IGFsbG9jYXRlZCBt
ZW1vcnkNCiAgKiBAb2JqZWN0OiBwb2ludGVyIHJldHVybmVkIGJ5IGttYWxsb2MoKSBvciBrbWVt
X2NhY2hlX2FsbG9jKCkNCiAgKg0KICAqIElmIEBvYmplY3QgaXMgTlVMTCwgbm8gb3BlcmF0aW9u
IGlzIHBlcmZvcm1lZC4NCiAgKi8NCg0KVGhhdCdzIGV4YWN0bHkgdGhlIHNhbWUgYmVoYXZpb3Vy
IGFzIGZyZWUoKSBpbiBsaWJjLg0KDQpTbyBDb2NjaW5lbGxlIHNob3VsZCBiZSBmaXhlZCBpZiBp
dCByZXBvcnRzIGFuIGVycm9yIGZvciB0aGF0Lg0KDQo+IA0KPj4+ICAgIFJldHVybiBkaXJlY3Rs
eSBhZnRlciBhIGZhaWxlZCBrYXNwcmludGYoKSBpbiBtYXBfcGFzdGVfcmVnaW9uKCkNCj4+DQo+
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNo
L2Y0NmYwNGJjLTYxM2MtNGU5OC1iNjAyLTRjNTEyMDU1NmIwOUB3ZWIuZGUvDQo+IA0KPiBCYXNp
Y2FsbHkgdGhlIHNhbWUgcmVhc29uaW5nLiBBbmQgaXQgYWxzbyBjaGFuZ2VzIHRoZSBmdW5jdGlv
biBmcm9tDQo+IGhhdmluZyB0d28gcmV0dXJuIHBhdGhzIChzdWNjZXNzIGFuZCBlcnJvciksIHRv
IHRocmVlLg0KPiANCg0KTG9va2luZyBhdCB0aGF0IGZ1bmN0aW9uLCBJIGhvd2V2ZXIgc2VlIGEg
bWlzc2luZyByZWdpb24gcmVsZWFzZSB3aGVuIA0KaW9yZW1hcF9jYWNoZSgpIGZhaWxzLg0KDQpD
aHJpc3RvcGhlDQo=
