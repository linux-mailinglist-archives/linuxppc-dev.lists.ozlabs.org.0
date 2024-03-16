Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D987D9B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 11:11:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=f1BPCDwk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxcNP2QBhz3vZ8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 21:11:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=f1BPCDwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxcMh4D5Lz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 21:11:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifMPdVkOdK5thKgre1ipLzu0SrZCmX5psOLU25GxRt9MxISvTvaGsMlLf8RtO3wd7nkrcSy0ZPQxr0FPQJTmBNtWwDLmhqvSTOmzBB27S/9wbmt/jr3eSRYL8ZJcZ6IVF1tf7BTS0DhnCZYI996iVq6J0CJC3XOlLt/03TYIt7tLILk4NIjcit1nOAg/6n5hmS+V66rsctda5CCPhyKP/PRq6GQjfpwH8lb2EXGNu9FVJFFxS7uEIG0btqXlyBQriZmrEhFl3crojikx3XGsaZDucZwDStNnw0Z7es1F4L+hjF3qI6t42AP1CViULt8qzNntDP5GqLu07Cxl6ZgO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDzFQYNSoO2LlhICdgKk4kIYuIqYqes5SV6CK5xz8L0=;
 b=eNZBZXQjMm+ObMJAI9STLuS3/fe6MhvbOxquwdK9hvbQ1KaykXqRgfky2aJBfHioJYBzdkQGvEnUTkDDm2BUZI8PZWpq7ZDEOC0feYCYQTO8r7mxOVYsN/m2S90CQHcZju/KQuvjanlO/kAUfWA76UbZ5Nimx8L2adIAX/t16p7ri7vo4/I6daRAkYWGuDZkYDYbGsP1TLGhk9db+jA44cQoA1RdfMeToMNlqHm6uTsQ2YSrbuX62HOAqE7oe3sK88+bUhkuyj8muqE+pDyJ00ABi5KnUPacf1FT5bybp1Udgojqw43UOGguaWfDwrvKq0AeVBPayXO7KZigJr0+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDzFQYNSoO2LlhICdgKk4kIYuIqYqes5SV6CK5xz8L0=;
 b=f1BPCDwkq89Y8hz+euBP/gF3GrI5gYtKyrtwqLOzi382JBy7geG+Cww61LlNuOyMjDgY4OiPIrTG3XP4LahPheMnXxto5HGyDaLnDHe+UZNhtx5bpBsvqTGMggn1sotqjQuUJL28SEC5HfGMFmP6tjtr7JGjpmb5SEor+Z44URcce5cpdM5KT6UWyOvsIRCsq2zShDpvPDcvLmcztK2c4FcF7QQuvDI0FXyr+bvb9c4i7DTwCOA1pMevLVuNpekPyFsA4XXknGR8ew5py62VrDqtmVG6ZU9Vy9FEtD2uzc6pAzkr73ZloE4cQeKk5H7lwD+gjHeuJoJ87KBF6kCN/A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1758.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Sat, 16 Mar
 2024 10:10:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.022; Sat, 16 Mar 2024
 10:10:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 2/2] powerpc/code-patching: Convert to
 open_patch_window()/close_patch_window()
Thread-Topic: [PATCH v1 2/2] powerpc/code-patching: Convert to
 open_patch_window()/close_patch_window()
Thread-Index: AQHadoUYgu3+KipSKkqQtIgPs6qhz7E4eysAgAGsOIA=
Date: Sat, 16 Mar 2024 10:10:48 +0000
Message-ID: <77fdcdeb-4af5-4ad0-a4c6-57bf0762dc65@csgroup.eu>
References: <20240315025937.407590-1-bgray@linux.ibm.com>
 <20240315025937.407590-2-bgray@linux.ibm.com>
 <510d986a-ce2b-47dc-bf5e-7ba2e72ecf5a@csgroup.eu>
In-Reply-To: <510d986a-ce2b-47dc-bf5e-7ba2e72ecf5a@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1758:EE_
x-ms-office365-filtering-correlation-id: 0d9bed7f-8930-42da-3ffc-08dc45a15a0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nfpGga1ITrsn7AY6AozDuN6h5Q9HvS8NWqHTaKP+YCwWvhDIlcmLQfGsH3V8ENGuSz9th8Kp38ETBGHScIMyXXZbD30j5LYzh8N3xEU1YhhuEoapa7MUjnCuL/g3rxiq5WNWFFMWBgHS4W+OLHSGhTxaj4TxjA2sl5hB7CKIB+hXf9ag4pE1dafLDZoUnxRGswwl4OlM7f4cgLvmy+n4i9aZr0jmD0K5VVA40AYQWgk4Lcqf4W6JlPSlhjxCCywrr39sXc7jkcE0GDCF9viw4YGW672WSKahJsznTuxhx3MMyP3W+ppIqOY+1VuIPwapC88my+ioqfbcrX1dq26BMnzzkLSsL+weDFapSoRj7/1LmBaudNQ/1g18/nXyVmUE3rykKspe8OMNke6/f67+nfGFcZy1geLXeM8unQfanhESPpYPNZ9+rg+PL+l344B7bj6wCaUrnXk1hlXTLyfctIilqDHS3WKaooPP+vsWjO2A88j0H4hdiv1QNcXjsRn0bXqmJ1oxGSR4WiPf2ziLmEsBZyaFqrdMw2WxdMpOePGYV+nfs9tvWmcot8ex4uIuBrEUvIgcLpz23Vk1UiZSQBlEMEOAn7k2bR7fZsOJDXrRBBOGoEFFzEID8MsPFm32sNs+LB90oOmarolm7AbllxFwIHYQTPj36HNCbc9dqosDO+BNEuB2n2t+lmeuUzfoSlejCTonCOM2lLh+NOnzj6y1gD4FpmDzl9ZL39hLNh4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VzdUZExKdmZiSkMwTzZkSUF5ekxIaFVmNWhBKzlKbjFrNk1WREZHdXp6b0Fw?=
 =?utf-8?B?c3FNYW5FRmE0UHlCZmgyWFFFNEdGSFdBRGNXN2lTY3g1U2hwa1NlK0NSYVlH?=
 =?utf-8?B?UmhZQVFHdXRKc1M3YWFwdk1JdUt1dEE1UG5mcm5RbG1PM2RsR3hlSitaQkMy?=
 =?utf-8?B?Y0k5Q2VUbDZJMk8rQWhqY3VxbmxDOTNVR1NpQ0I5VG1sQXhPRmpoSFhkcVFp?=
 =?utf-8?B?TlVad09jdjJXaWQ3ZDdmZlM0bXFMTDk5YXJ0VmkrMXVNWThGUVhuNzFSRnIv?=
 =?utf-8?B?WkRwamhIaDhacTRaVkkxQ1J4Qy95eG1NWkk1cmpLRFZPRXo3c3V0aTJkOFNE?=
 =?utf-8?B?TUM0cE0zU2ZEcE5YU2FQd3NiMElCVVFTSk1DaEhUZHBzOG5RL3REckM5UXFE?=
 =?utf-8?B?KzZ4VmpKcHVpTUtRL1BZS0RxNG5ocDlHdDM3S3kxbzd4RnNNaFVNVFhJMTZB?=
 =?utf-8?B?YkZ6M084VUVlZlRDUGNRSHd1aXNRN1NINC9KMTZMMHEra0U3ZVlVRWFxczRS?=
 =?utf-8?B?OE5MckxpQWliNCttbk1ON2Z4Y01NOVEzeVFvOHdOY3dGMjRGNTBmdHdBTnNv?=
 =?utf-8?B?RVcrenEzaUhJVWJlQjhXVmd4QTc3MmVYZWZqZ2NzUHVDTzQxdWZHNGx1N3or?=
 =?utf-8?B?aGJPNlNxNU5oL2x4N21CdEtxV05LdllFTldJdTNGeC9kSmdZUi9XVzJ3V1BP?=
 =?utf-8?B?UC9oeGloQ291MmV3UWdOZTZxcEZVVzIzRXNseUJzdXNVSVJ3MGhDcWg4UkZO?=
 =?utf-8?B?TGxEeGlpak10d2RWdmNSVllpR054N0dvWnBrTFYrQU4vS3c4V3hkSlF5emlr?=
 =?utf-8?B?d2Q5OStpQXpVNWt4TU1tb2dRWkxNeUhzT2E3N3VnbUI1K2lqYkdEZFFuQWlW?=
 =?utf-8?B?OVFBVHRsZ3psVUYrdlRxcXVsMXU5M0ZFYnFVRmYwdDBnU1A1TjdRajRwRmNY?=
 =?utf-8?B?dHZBVkcxNWdzWE1rQnB6WHJvZVBEVjdTQlFld0lrR1ZyN1lGbS9MSy80Y256?=
 =?utf-8?B?OHl6d0FTK0pBeFFhOE5TRm1VbFVONjlmOERWN0c1bUFsWHhpSkppLzJidFhs?=
 =?utf-8?B?eFh0c1BScmxWRzhmV0dRNnRKNnhxYjE4WUpCbkkrWlJ5d0Q5MVNCeWY3STBk?=
 =?utf-8?B?WTBEYkxZTjNDRTBMMklTN3NSTnFmaEFZMWpvMnJ4UktZU1lzOVliT3QrK0pG?=
 =?utf-8?B?RGRjbWttVVBuNXFrUi9qRmZtTGFUYTNySWpvMWhUS2Z1Ukp1RHJwOVhzY2RE?=
 =?utf-8?B?TUZNQktGWVhzVHRXaWF5elNjeFJwSE1QZzJIbVNwRldHQnIxZjdFc0hqa2Iv?=
 =?utf-8?B?SWszTTNMWlJVcWRxVEJFT3E4UDFiajB1L2tBM0Qwbld0djlpeFgzVmdoYjZK?=
 =?utf-8?B?WGNBMU9Xd1JrNjE2OC9zVld1Vklick96WXFHaWpVcFJ6aFRBcnVDQ2JpZnVq?=
 =?utf-8?B?NkkycFpYTHo3elpGUmt2cGFIa0VyRHc1dEdXWmcrbnMzNExRcjRQUUExVDZL?=
 =?utf-8?B?M0FBRnB0YSszTkhycytHUTJqWTVIenBOS0tOaUNvMlowejJQR21OUXRRM0p6?=
 =?utf-8?B?b1ZoNVJGZEtKYkF1ZHhsSHYwZ1NuWUozaUpHOGhMdko0S1psUXJGNEVuY0Jr?=
 =?utf-8?B?MFg2TSt3a3E1QW5BM1hzNHFMRG1IRFZQcDVpV3FraWl4R2cyVy9lSlcraysz?=
 =?utf-8?B?Vnc4Tjhva1lBY2dacG1rOUlMNmlsMHEvLzlKOFFlOUFPdFkwV2I3ZGpHT1Nm?=
 =?utf-8?B?Rm4xWTJ2QSswYmJTWUN5bm54dmw2d0NlMmQ0YldXNFNPVmwrcjNqT08relBk?=
 =?utf-8?B?Qy9TMXc2TFlLU2FVQ2RwcWpqN3hkQlR3RUtBdlJEenNVUXVwUGtud3ZpSU8x?=
 =?utf-8?B?QzNIVG5OdU1XQkRPbm1XOEhGTVRkSXZXWlpJbGx5VEZXYjZVTzBadmhvNzRG?=
 =?utf-8?B?Nis4Yy9PL056MXQyc1lCc1VyeVRmN0hTSTBNeTJHV2pycExLY3VDamJDdjRu?=
 =?utf-8?B?QytsRjNObURRL2x2QmpUR2p4R1UzZHMyN0ZWK05zY09WeXBQWFF6L3c1ZjVn?=
 =?utf-8?B?YnBIUmhnYitRcEozSXNxNlJJS0I0U2tBVVZiejlXK1dXMnNtc0tFaFRpZENu?=
 =?utf-8?B?eTZVOEJBYy9CTVpqRFlEQmMwZmF0a1Y1Vnd3N0lTc0dWc1czcTZrYlRnR3pH?=
 =?utf-8?Q?ASTof5933p0/nvasfV51tJd+zLWFNRphKConmi5kq6ML?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A0E21974313784E8F9E8DF99074DFD3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9bed7f-8930-42da-3ffc-08dc45a15a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2024 10:10:48.2259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUmcyJOprNA51EQQZybuKm31U/eJPVLEZMjSQCwOxlPctXfHMhtkyp6ulw+lo91yBoBGCxBUgmu0hujsa4ArZ5JaaRUN1TzvNOfp8hMoLlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1758
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

DQoNCkxlIDE1LzAzLzIwMjQgw6AgMDk6MzgsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxNS8wMy8yMDI0IMOgIDAzOjU5LCBCZW5qYW1pbiBHcmF5IGEgw6ljcml0
wqA6DQo+PiBUaGUgZXhpc3RpbmcgcGF0Y2hpbmcgYWxpYXMgcGFnZSBzZXR1cCBhbmQgdGVhcmRv
d24gc2VjdGlvbnMgY2FuIGJlDQo+PiBzaW1wbGlmaWVkIHRvIG1ha2UgdXNlIG9mIHRoZSBuZXcg
b3Blbl9wYXRjaF93aW5kb3coKSBhYnN0cmFjdGlvbi4NCj4+DQo+PiBUaGlzIGVsaW1pbmF0ZXMg
dGhlIF9tbSB2YXJpYW50cyBvZiB0aGUgaGVscGVycywgY29uc3VtZXJzIG5vIGxvbmdlcg0KPj4g
bmVlZCB0byBjaGVjayBtbV9wYXRjaF9lbmFibGVkKCksIGFuZCBjb25zdW1lcnMgbm8gbG9uZ2Vy
IG5lZWQgdG8gd29ycnkNCj4+IGFib3V0IHN5bmNocm9uaXphdGlvbiBhbmQgZmx1c2hpbmcgYmV5
b25kIHRoZSBjaGFuZ2VzIHRoZXkgbWFrZSBpbiB0aGUNCj4+IHBhdGNoaW5nIHdpbmRvdy4NCj4g
DQo+IFdpdGggdGhpcyBwYXRjaCwgdGhlIHRpbWUgbmVlZGVkIHRvIGFjdGl2YXRlIG9yIGRlLWFj
dGl2YXRlIGZ1bmN0aW9uIA0KPiB0cmFjZXIgaXMgYXBwcm94IDEwJSBsb25nZXIgb24gcG93ZXJw
YyA4eHguDQoNCldpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2VzLCB0aGUgcGVyZm9ybWFuY2UgaXMg
cmVzdG9yZWQ6DQoNCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcu
YyANCmIvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCmluZGV4IGZkNmY4NTc2MDMz
YS4uYmM5MmI4NTkxM2Q4IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNo
aW5nLmMNCisrKyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQpAQCAtMjgyLDEz
ICsyODIsMTMgQEAgc3RydWN0IHBhdGNoX3dpbmRvdyB7DQogICAqIEludGVycnVwdHMgbXVzdCBi
ZSBkaXNhYmxlZCBmb3IgdGhlIGVudGlyZSBkdXJhdGlvbiBvZiB0aGUgDQpwYXRjaGluZy4gVGhl
IFBJRFINCiAgICogaXMgcG90ZW50aWFsbHkgY2hhbmdlZCBkdXJpbmcgdGhpcyB0aW1lLg0KICAg
Ki8NCi1zdGF0aWMgaW50IG9wZW5fcGF0Y2hfd2luZG93KHZvaWQgKmFkZHIsIHN0cnVjdCBwYXRj
aF93aW5kb3cgKmN0eCkNCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBvcGVuX3BhdGNoX3dp
bmRvdyh2b2lkICphZGRyLCBzdHJ1Y3QgDQpwYXRjaF93aW5kb3cgKmN0eCkNCiAgew0KICAJdW5z
aWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0KDQogIAlsb2NrZGVwX2Fzc2Vy
dF9pcnFzX2Rpc2FibGVkKCk7DQoNCi0JY3R4LT50ZXh0X3Bva2VfYWRkciA9ICh1bnNpZ25lZCAN
CmxvbmcpX190aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19jb250ZXh0LmFkZHIpOw0KKwljdHgt
PnRleHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIA0KbG9uZylfX3RoaXNfY3B1X3JlYWQoY3B1X3Bh
dGNoaW5nX2NvbnRleHQuYWRkcikgJiBQQUdFX01BU0s7DQoNCiAgCWlmICghbW1fcGF0Y2hfZW5h
YmxlZCgpKSB7DQogIAkJY3R4LT5wdGVwID0gX190aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19j
b250ZXh0LnB0ZSk7DQpAQCAtMzMxLDcgKzMzMSw3IEBAIHN0YXRpYyBpbnQgb3Blbl9wYXRjaF93
aW5kb3codm9pZCAqYWRkciwgc3RydWN0IA0KcGF0Y2hfd2luZG93ICpjdHgpDQogIAlyZXR1cm4g
MDsNCiAgfQ0KDQotc3RhdGljIHZvaWQgY2xvc2VfcGF0Y2hfd2luZG93KHN0cnVjdCBwYXRjaF93
aW5kb3cgKmN0eCkNCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgY2xvc2VfcGF0Y2hfd2lu
ZG93KHN0cnVjdCBwYXRjaF93aW5kb3cgKmN0eCkNCiAgew0KICAJbG9ja2RlcF9hc3NlcnRfaXJx
c19kaXNhYmxlZCgpOw0KDQoNCg==
