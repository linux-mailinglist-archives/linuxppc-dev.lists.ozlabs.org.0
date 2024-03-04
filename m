Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277E8708F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:01:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FRPx+Cpx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpRND6Lqqz3vWy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FRPx+Cpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpRMQ3WbQz3cCG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 05:01:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEvtP9/66zp+vxc0YI77IottVO/NRi6vcTCNQjm1jhGb66jirCcfwxxW1uEd5LoPkWUy/BuZcVOPxDTwwVHPAQv9YjZqzEGOr+HIwTRv5bBA76O8H6RNDcl/4RW42djOOcJlNUEFSVAlJwnYOAUn5Mhpi3YZSE3i5g3OlTInS4Z8kXrjfnYfSzOe2svxUFpJAvb//xQpGZhttcRH/NMgI6x80x4Bkkql2gkfywNS5IZpUORO7N6UqAFJ2iD5xiPL6+XUhksYkDTWLLKGzDzFz8VOh9LXLTxVl3J6WByn4W8BmjMYUsNiWQqF6CLov7YdjNFOtdhw4gjZxqgkNgFhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChzmTioaoJ3Tnoz2NuP640C18LPE4jO3THzzaW9t1EE=;
 b=drpm+3FLJgo8DZa3OaBXQMwQkxwoiIf5eupsuEi16RG00Ohik/XGf6QERWijtMQMiknarCu1V6/wzKTC9tdn5JO7toDzvc95IzeejdJE8JT58wq1NDL7WIzjacdZNEUHXVugsRvaXqQfBj5PtSXk8R+NB+aOK3+2LiYrLoAkhRfKWsdzqVgc2JnIwePbhe93Jj8ZwDIZ1nk2QSbQAp1OeWURhCuI0yQgvbeHTcD5wLoY/sn+nTt9fs7tvN0/0w8PP8Tox9k8i1lR9aCgUM2JvSvi9dT3O77fAbitcERg6vZXfv0aWsSRIeiwVsVH95JS7rNVPFEb0rWqr56PzTdl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChzmTioaoJ3Tnoz2NuP640C18LPE4jO3THzzaW9t1EE=;
 b=FRPx+Cpx5lqpY3Y27KMEQ7Y3TLTCXCO1bwwRk44rknXX05g8w9qmHQlyBLorHCfvGvj9+eYH+czWdv4HeL+RUbzW3YQmzPCKtEs3Gqb+wvrUFwmbd/B2dmDU7tg0/2WaCv7IgOwaRhb6xFVHQyA36Hhcixbf/U5kBhnrYNJ0ky1Yh3jPficM9ddtI7JHTBDnVqPvjQla1XBtcn2nYr49T/29Mw2aOZ8yJeEr0YWusz8ftBJrUUnvDzTJuWZBsLWjYa8dV7OUMzJLUVPi3wz8NGRqwhWvj7e9tlxMbvR/kzIMrKtqTocbbSLpE0tK9Aotz5DVptuRKP3vA96e6qpgLw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 18:00:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 18:00:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index:  AQHaaOd3T09DEeJabki6TgRFYbqm47EdxC4AgAC5pgCAAAKNAIAAJBAAgAEcAgCAAELkgIADoSgAgAAR4gCABDOQgA==
Date: Mon, 4 Mar 2024 18:00:43 +0000
Message-ID: <ec3e377a-c0a0-4dd3-9cb9-96517e54d17e@csgroup.eu>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
 <202402280912.33AEE7A9CF@keescook>
 <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>
 <202403011747.9ECFAD060B@keescook>
In-Reply-To: <202403011747.9ECFAD060B@keescook>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2045:EE_
x-ms-office365-filtering-correlation-id: 60952a1e-1f8f-435b-a1c4-08dc3c750315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QiHkvHWAmIEQ+lMV9izbpgV+qj/gGZM8GlRXJdt3PvAO4AyDKWMdepKIR29ScOSvKnBkBri+YAUrbVg4JwN4cV6L6wtg+GA6iW2315FUpxq3BmaVOdsWGJRW3mX9pUxtAjHxkXWP5ja7y91SHciALjhFtJ6iLiDrQbbksxn1QeoaCBLklhTERMcVMsf3oLoBbja+hDYslxP98BHHdFudjr2k4528j1vzgKGxt9klsOuslft+g4E+WWKbM9GJCp9dwTn9UlI9vn1R8LMqvcQ9WaG4bH7+a+W10lh4Vdg0RmD8PVIFJkakpNzRl43/Zp+2UdDhiq3Czwb+P8Q6M/5X5lGydrJmOZRtCilxUbSxv3PTbWBqY6q5uUhg+EJ7vQQDaCoasQ/IXwM4qOG5EdY2sKh3s2W9oVQqJ3W2Dc9gfczOnyBC8UDx6bm9bSXcHVjXPAB43HmCMsLJhLc8x51+/eaLN2KgbYSnKnElm77WqNDY92mBfPtv5bc+Nq5/8rDLn/5+OPXt7lwpEALccXdtIILmKdcP2VPtID8ahEfkyFlc3L1SgKIqYa/YYyXREjRi9ffJfapyrj5p6oQ/Kvf4czVedRTITtO+6fq/mrmOi9sGs9b4pDJSgrZ5ssjBztz3q9W+K9ydqS3FeiS21Hcng0frU02s0Yavs4KVaECFpR++TlHqHEaBRWbFioDlr7ZqZaBuW1hqZYfpbVxENtF8YbxsnS0ngbysTLH57/GdfVI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akU3bXhsRVRDSG9ZWUMwQnVoLzRNYmdhQ3o4K0d3emVURzY5RDdSMnB1ZUh1?=
 =?utf-8?B?dFl2K3l5TTk0d1pONHdyTU9NOVY4L1ZuTUg4WTB2WWl4c2Jmcm5UTmlCeitX?=
 =?utf-8?B?Skk0bjBidXVuTGkzakREL0R2Rnh2bGhpK1l2NExHWXRIMUdadkJXRFByWGRm?=
 =?utf-8?B?UDFkaWtYZVhkMzI0VC9md3NYYmcra1Y3YzhLK2MxMlZYL0IzdEJVSmdHaGxp?=
 =?utf-8?B?bnJiUXFwRVFIWFpuaGFkek5jN2FWdGVybms2WnZhdWZ5c2hQMXdsNHA5MDNE?=
 =?utf-8?B?WC9NbFNTdkh4MTBiOGhRRUovZFhBbVBDOGlSZGVuUzFkeGVkSEV5UWpQa0tz?=
 =?utf-8?B?Rkc1MHpJNHJZS3VGQ0NDV0ZoeklqeEhHSXpWRXdaUFNYaEptMSt3VkdueDE0?=
 =?utf-8?B?d3ZmMExNN2h3ajRKNjhCQ1phTFY5RjhQa3h0L1MyR1ZLaklSKzhjcTNadk9O?=
 =?utf-8?B?RU5aSTlYMTU1dEhkdUFaUTl3dWpya3h1NC9RNTNGZDVpREkxSWU5anBrS3o2?=
 =?utf-8?B?aTR0bFQwbWh1dm5LWndMZ2NUNmtYSDFHNVBjU1JnaVA4Q0wxQms1bkg0ekNt?=
 =?utf-8?B?QkZvZW1rVUZwTkpta2MwTlBEekRsZWVkbDhrLytNK3NRanhNUkw0NmlnbWNR?=
 =?utf-8?B?QWlRRUoxZTVhUDMvVEE1aXQvckdTdjFGMlRTZmM1QlRxWEJkcFJNMkZhZGZx?=
 =?utf-8?B?R3dPY2czalB2SllnVG5nUWpRNzlWOFNJUzJDQXA0eG56TXUvZHo4ZnRTcWQ1?=
 =?utf-8?B?c1pUZEllNDZyclJhZ05QenZTVWtYcmEycHJaTnAvbitsR201M2tvY1VZdCtU?=
 =?utf-8?B?MkNYV3FXUk56NGErVHBaTzB2U0lJT2FIQUUyTm5QZCsyYWhaMUZld3pDRk1k?=
 =?utf-8?B?UThYUkVVckxCVWtWeGtwZmo3VGJJbWpzODRWTkN5T3BjeUxIUTFhaklBcmd6?=
 =?utf-8?B?a204d21saVNyS3FxNFVWeUJZcTMyS3VPZGZ2TEg0dVoyV09laGxsRHRmU01F?=
 =?utf-8?B?Ky85K1FUZUJVRFpsZkZ4VmRhNVBQQ1dIM21IWnlhYk9Fa3B6aXU2SWtFQTI1?=
 =?utf-8?B?TC9DWEFtNEdJdGZZM0lFbEw5b2Q3N0hKcmdWakJoK2E2aVFZbkRRVnIzcGoy?=
 =?utf-8?B?N1UrRzVpb0lEOU9pT3UvUmhiTWtsNksrQnYraHE3NnQ1U0RtQWRjMzdxTCt6?=
 =?utf-8?B?K0tFREF6Q1Zia0h1ZEJJeEJBUXVmT2gwQTl2ZjhxM1FlMnhSRStUZS9qNGpQ?=
 =?utf-8?B?TzQwK0lEcEdHQTdTakNLRnVCL3BCMndNL2EyUjE2YmdPdjZOaEk3TU9VeHA3?=
 =?utf-8?B?Q0YyMENjN3YrODZYM3JiS0k5SDN3ajRpOVk5NlVkMHh3a2ZXQkhuc1dHTnpR?=
 =?utf-8?B?blBJYkpTMlRaTThOU0NXNi9TSkY0UEZuelE3Z2phUWJsMTNNaVpIOTdxTEZR?=
 =?utf-8?B?QXV3TmRyOGFXWkdRMHg4RlVVUnJNSXZPeXJiNjRFWlB3UTArQjE4U3BhTnNB?=
 =?utf-8?B?K0QzK3IrZHRVay9SeUxid3U3NzV0ODlDNmMxaVYwRkdqWnpCVmJsc0FURCtN?=
 =?utf-8?B?QnY0RUc1VGZKTzdpSHArTDBzeDBncEttZGcxU2M1UkdlaFU1VW5uc3FMMHpx?=
 =?utf-8?B?RGFlYXNEcjRRZGhscTZSUVZrNnNsbTN0UVlpMDVSSi84OGNqelRnMVkwbnM3?=
 =?utf-8?B?b04vS2dPeGdjejEwZWdBdVNjUlh1MUVSSlV6cFlTcDBETk15QnRPRVpQMXlz?=
 =?utf-8?B?NU1pVFdqQjFsZzN0ekRsOVQ5ZnJIQ1ZZZFRmQi9WTndoUEd5b2lFWm5iYyt6?=
 =?utf-8?B?T1AvVElSb0ZvOFEvbnErUXZ6ckw0VGpKZ2xGYWZyTkZhWlBraGUzZThpRVhH?=
 =?utf-8?B?Z0JtNHY1eTJzbk1MZW4xVzd3NUsyMG5TN2NLM0ZhTTdMRkQwODkxTEo5ZVNQ?=
 =?utf-8?B?Rk1XSXRUUUIva1UwRkdVaDk4eXZFYWFPczBZTC9zOTNjUW90Ry9mMnhSWFkr?=
 =?utf-8?B?ODF5OWo2REg2V0cybzRVeGM3VUhlWm01azZZZ0c1dy9WZ1lnWXZwOU1CNDBR?=
 =?utf-8?B?N2Voaml4UjYxU3R2bzVIM25ORjJuTUJnTmRVOWJiQVY1RU1BN2lhRkJiblpD?=
 =?utf-8?Q?SkzmFsR+rdtu9P6kmAADfZ0AN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50BF0531C663AC4B9F8EB29F53B588E1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 60952a1e-1f8f-435b-a1c4-08dc3c750315
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 18:00:43.9787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmRlyleQyqcvqJEL3brT1SwWFgPreElok2udAY42dILNeJuxguefLIiy0/vYkqWzyeu8IHoOwRxjhLJQpdhYq7S3ghIuHp/6Nc0iVP9wBaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2045
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
Cc: "luto@kernel.org" <luto@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug
 @rivosinc.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzAzLzIwMjQgw6AgMDI6NTEsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBPbiBT
YXQsIE1hciAwMiwgMjAyNCBhdCAxMjo0NzowOEFNICswMDAwLCBFZGdlY29tYmUsIFJpY2sgUCB3
cm90ZToNCj4+IE9uIFdlZCwgMjAyNC0wMi0yOCBhdCAwOToyMSAtMDgwMCwgS2VlcyBDb29rIHdy
b3RlOg0KPj4+IEkgdG90YWxseSB1bmRlcnN0YW5kLiBJZiB0aGUgInVuaW5pdGlhbGl6ZWQiIHdh
cm5pbmdzIHdlcmUgYWN0dWFsbHkNCj4+PiByZWxpYWJsZSwgSSB3b3VsZCBhZ3JlZS4gSSBsb29r
IGF0IGl0IHRoaXMgd2F5Og0KPj4+DQo+Pj4gLSBpbml0aWFsaXphdGlvbnMgY2FuIGJlIG1pc3Nl
ZCBlaXRoZXIgaW4gc3RhdGljIGluaXRpYWxpemVycyBvciB2aWENCj4+PiAgwqAgcnVuIHRpbWUg
aW5pdGlhbGl6ZXJzLiAoU28gdGhlIHJpc2sgb2YgbWlzdGFrZSBoZXJlIGlzIG1hdGNoZWQgLS0N
Cj4+PiAgwqAgdGhvdWdoIEknZCBhcmd1ZSBpdCdzIGVhc2llciB0byAqZmluZCogc3RhdGljIGlu
aXRpYWxpemVycyB3aGVuDQo+Pj4gYWRkaW5nDQo+Pj4gIMKgIG5ldyBzdHJ1Y3QgbWVtYmVycy4p
DQo+Pj4gLSB1bmluaXRpYWxpemVkIHdhcm5pbmdzIGFyZSBpbmNvbnNpc3RlbnQgKHRoaXMgYmVj
b21lcyBhbiB1bmtub3duDQo+Pj4gcmlzaykNCj4+PiAtIHdoZW4gYSBydW4gdGltZSBpbml0aWFs
aXplciBpcyBtaXNzZWQsIHRoZSBjb250ZW50cyBhcmUgd2hhdGV2ZXINCj4+PiB3YXMNCj4+PiAg
wqAgb24gdGhlIHN0YWNrIChoaWdoIHJpc2spDQo+Pj4gLSB3aGF0IGEgc3RhdGljIGluaXRpYWxp
emVyIGlzIG1pc3NlZCwgdGhlIGNvbnRlbnQgaXMgMCAobG93IHJpc2spDQo+Pj4NCj4+PiBJIHRo
aW5rIHVuYW1iaWd1b3VzIHN0YXRlIChhbHdheXMgMCkgaXMgc2lnbmlmaWNhbnRseSBtb3JlIGlt
cG9ydGFudA0KPj4+IGZvcg0KPj4+IHRoZSBzYWZldHkgb2YgdGhlIHN5c3RlbSBhcyBhIHdob2xl
LiBZZXMsIGluZGl2aWR1YWwgY2FzZXMgbWF5YmUgYmFkDQo+Pj4gKCJ3aGF0IHVpZCBzaG91bGQg
dGhpcyBiZT8gcm9vdD8hIikgYnV0IGZyb20gYSBnZW5lcmFsIG1lbW9yeSBzYWZldHkNCj4+PiBw
ZXJzcGVjdGl2ZSB0aGUgdmFsdWUgZG9lc24ndCBiZWNvbWUgcG90ZW50aWFsbHkgaW5mbHVlbmNl
ZCBieSBvcmRlcg0KPj4+IG9mDQo+Pj4gb3BlcmF0aW9ucywgbGVmdG92ZXIgc3RhY2sgbWVtb3J5
LCBldGMuDQo+Pj4NCj4+PiBJJ2QgYWdyZWUsIGxpZnRpbmcgZXZlcnl0aGluZyBpbnRvIGEgc3Rh
dGljIGluaXRpYWxpemVyIGRvZXMgc2VlbQ0KPj4+IGNsZWFuZXN0IG9mIGFsbCB0aGUgY2hvaWNl
cy4NCj4+DQo+PiBIaSBLZWVzLA0KPj4NCj4+IFdlbGwsIEkganVzdCBnYXZlIHRoaXMgYSB0cnku
IEl0IGlzIGdpdmluZyBtZSBmbGFzaGJhY2tzIG9mIHdoZW4gSSBsYXN0DQo+PiBoYWQgdG8gZG8g
YSB0cmVlIHdpZGUgY2hhbmdlIHRoYXQgSSBjb3VsZG4ndCBmdWxseSB0ZXN0IGFuZCB0aGUNCj4+
IGJyZWFrYWdlIHdhcyBjYXVnaHQgYnkgTGludXMuDQo+IA0KPiBZZWFoLCB0ZXN0aW5nIGlzbid0
IGZ1biBmb3IgdGhlc2Uga2luZHMgb2YgdGhpbmdzLiBUaGlzIGlzIHRyYWRpdGlvbmFsbHkNCj4g
d2h5IHRoZSAib2J2aW91c2x5IGNvcnJlY3QiIGNoYW5nZXMgdGVuZCB0byBoYXZlIGFuIGVhc2ll
ciB0aW1lIGxhbmRpbmcNCj4gKGkuZS4gYWRkaW5nICI9IHt9IiB0byBhbGwgb2YgdGhlbSkuDQo+
IA0KPj4gQ291bGQgeW91IGxldCBtZSBrbm93IGlmIHlvdSB0aGluayB0aGlzIGlzIGFkZGl0aW9u
YWxseSB3b3J0aHdoaWxlDQo+PiBjbGVhbnVwIG91dHNpZGUgb2YgdGhlIGd1YXJkIGdhcCBpbXBy
b3ZlbWVudHMgb2YgdGhpcyBzZXJpZXM/IEJlY2F1c2UgSQ0KPj4gd2FzIHRoaW5raW5nIGEgbW9y
ZSBjb3dhcmRseSBhcHByb2FjaCBjb3VsZCBiZSBhIG5ldyB2bV91bm1hcHBlZF9hcmVhKCkNCj4+
IHZhcmlhbnQgdGhhdCB0YWtlcyB0aGUgbmV3IHN0YXJ0IGdhcCBtZW1iZXIgYXMgYSBzZXBhcmF0
ZSBhcmd1bWVudA0KPj4gb3V0c2lkZSBvZiBzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvLiBJ
dCB3b3VsZCBiZSBraW5kIG9mIHN0cmFuZ2UgdG8NCj4+IGtlZXAgdGhlbSBzZXBhcmF0ZSwgYnV0
IGl0IHdvdWxkIGJlIGxlc3MgbGlrZWx5IHRvIGJ1bXAgc29tZXRoaW5nLg0KPiANCj4gSSB0aGlu
ayB5b3Ugd2FudCBhIG5ldyBtZW1iZXIgLS0gQUlVSSwgdGhhdCdzIHdoYXQgdGhhdCBzdHJ1Y3Qg
aXMgZm9yLg0KPiANCj4gTG9va2luZyBhdCB0aGlzIHJlc3VsdGluZyBzZXQgb2YgcGF0Y2hlcywg
SSBkbyBraW5kYSB0aGluayBqdXN0IGFkZGluZw0KPiB0aGUgIj0ge30iIGluIGEgc2luZ2xlIHBh
dGNoIGlzIG1vcmUgc2Vuc2libGUuIEhhdmluZyB0byBzcGxpdCB0aGluZ3MNCj4gdGhhdCBhcmUg
a25vdyBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBmcm9tIHRoZSBzdHVmZiBrbm93biBhdCB0
aGUNCj4gZXhpc3RpbmcgaW5pdGlhbGl6YXRpb24gdGltZSBpcyByYXRoZXIgYXdrd2FyZC4NCj4g
DQo+IFBlcnNvbmFsbHksIEkgdGhpbmsgYSBzaW5nbGUgcGF0Y2ggdGhhdCBzZXRzICI9IHt9IiBm
b3IgYWxsIG9mIHRoZW0gYW5kDQo+IGRyb3AgdGhlIGFsbCB0aGUgIj0gMCIgb3IgIj0gTlVMTCIg
YXNzaWdubWVudHMgd291bGQgYmUgdGhlIGNsZWFuZXN0IHdheQ0KPiB0byBnby4NCg0KSSBhZ3Jl
ZSB3aXRoIEtlZXMsIHNldCA9IHt9IGFuZCBkcm9wIGFsbCB0aGUgInNvbWV0aGluZyA9IDA7IiBz
dHVmZi4NCg0KQ2hyaXN0b3BoZQ0K
