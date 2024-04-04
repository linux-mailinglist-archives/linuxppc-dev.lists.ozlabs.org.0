Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71F898146
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:15:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ja7+GTym;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9BDd1Vnbz3vZj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 17:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ja7+GTym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9BCw282rz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 17:14:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMk9B+XpJDxOFh/rv6p3dCmtKDfiEdqrIx22yyKNKd4/nlXUUZ0eFgb02vmxIUp5OUaRDeFS/J5tNI1E0BaqCJHnp2c8PnusDhogHvjb2rb6JkP2dBLAHc4HmhN+T5eicg18BkCxuvKH7+SzgazpbGEnDxF4qkMwD0+Iu16FLhM0L4qSATtmVbW79QB876GqybIuPH001cF5GlUcINRzE3+tZoS6zomcdk7qyihqmQqF7Hx0Lm/9gCUhpx8DKyBjHqQczBHfce3jfLoDu5hEd28+IuwlhMgFR3Q54rK6nJ65vR57E4tV1wAVJJwqZSdSipe0ItTMw3PK3tn4rytFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fHKsxvyfZuRFH9HyiaJ92oJCfFvEuCTdRTc296a92E=;
 b=VlRmQnBxJLz4KB3u8GQMYD81cFMMbPA8wNHxwhq1OK9Zt1rRx+XAtOZK27QrbbE2kU23AKBZu8hKZgn9KCGvibiz9OlpNbRtTCQcxKMHQy+vkAA6xbVqdTkY0snGrYfeyWQJ5KIRsrHmrnhx5Qpv98nFXV6KIaDOymcBh2uNgKGdGILoJ6Shu7ocGd7a0Srgz1E7i8ah1Uvmz7ULoPwvuCvpEpefMk4WPz283jbLtUwh3L/bva0NmuonfzeQ15gP9luCowyOxSRwo9tiYJ+TP/BkJ5C1Eid0lRO4GL+SI4IGV/I+aEiR9xd0u2rWTZ+Z1GH5son0uKE7dqqG0/+RNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fHKsxvyfZuRFH9HyiaJ92oJCfFvEuCTdRTc296a92E=;
 b=Ja7+GTymzpWoqsdLKY7iGuYeZa/Gr340a9wCTwnVFaL6Ag6fUCU/gXaP13E4vtze02iQ4xVdjBZvNICffGCtrprHCvnTlJL9Qhs8794htDjRISWtq576m+RCxb1bdOA7n53yCIfLIy5+nDPlBlNCLYKqeumFol5h+VC67RwuwDuvgAclZynrBtZ5AwZhYPdCQEk6x1q0Eg32omex/azUdnA+zUpWiLX3lTaiBjnmzP2rhIGtmJXxcIh33lTffIpogMsJ34hlFrI/KMAFO9S3BpuVYGP57QgLmNViGqZeymvbpyKM32cGsRMtQjzbkBoyJK0awqtP4MycGxSJbWYxNg==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAZP264MB2575.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 06:14:12 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310%4]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 06:14:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] powerpc/64: Only warn for kuap locked when KCSAN not
 present
Thread-Topic: [PATCH 2/2] powerpc/64: Only warn for kuap locked when KCSAN not
 present
Thread-Index: AQHahksOeaqO5Ygo/0eRdw8ydBKe7LFXogiA
Date: Thu, 4 Apr 2024 06:14:12 +0000
Message-ID: <cf6f5be6-3250-4dba-8f2d-3e003edced97@csgroup.eu>
References: <20240404044535.642122-2-rmclure@linux.ibm.com>
 <20240404044535.642122-4-rmclure@linux.ibm.com>
In-Reply-To: <20240404044535.642122-4-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PAZP264MB2575:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m9Hvywu18cgARoa+JYUR1fOrNg6ls4isbOgcgMVnMZd/3Y4evbc3N/8Q2PzKS1Flca2O9fvHJV+kC8FLR5tw/gY/s/uGKC2ybm/E7nQ5kvi+/hpy09OszqaQy+OILRMrkVndZ99uBR3kK/5SKX1AZDGubRJ539ubQIDy/wc5+tCxoPMh2rFHZV0NDMyiXUg859VPLf5Zx/NW3v0FWCfZOaNIAedgNqx92O163dpT57cpMJmhSfxunJuQ8GIZnUWe7syUt0nvDQWQhoyv/ndgIDspGHkGHJMZlrry+aWAL5AZgy0hrumKSwYnjJX6L3M23g34v5eeS9lcTyCkSta2BtK3wlVJeUXiBCHRIwdWhXkBd/NwqpJRbNOOO+idcnHV2U+LP4zzhGJW5vBlmM0dAW4rtyh47BsicJXSXjHM2RMSfRBBllP3IvwH/VB/xmBDKUD0kamxQyeaLP5XXwNWH0RMDUIhP3mixAfbbiagB/EJFl/bVdmPzMSJkMPev84EA06X78mhffo1KdwvrfTgDYIoIp60MlttJRuMmcVD2fzDRQupnckhRio0slXv/fpextrYq2lB44XEoZiVj/ljppDAe6XvYKo/mpMwUEWhqNNGC/MLEYZA3IR5kZSl13v8wPxaEdyY2J5iKsO6079giF3/gBaj+ndR8OA+lQtwFew=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NVRNdmdnWmhBWEhEN1pkemtXZmlGNVlqOTZxWEZyVHdKcVFnWTBhVCt0R1V2?=
 =?utf-8?B?dmhyTUZ3bUd3ZVFpUE9sUnlwdlA0Y0U2OWVtRU5FUG5nWUVacTdDYjRwTWdK?=
 =?utf-8?B?NVlsbUt2aVVtTkMyTFNVeUV4TnRYNTdYQ3lzd2lHOFFWc0ZCbnB3alBQTUYw?=
 =?utf-8?B?MmRhYkE2NXFLNVpLRUVSYlhmdEl6QVRURmZMRHNobWlyOGdPVlJrK2FNRy9v?=
 =?utf-8?B?R1NXUnlkL0FBNnJQQXMvbEN5c0tDLzZ0KzZYb2lNd1I1SHNxRW1WZDdTMHV3?=
 =?utf-8?B?aGJMRVBxdFBiR1pFR2ZldmoxTElvZ0dzQTFVVXlNMW9xcUlrazd3MnpQNmRv?=
 =?utf-8?B?eGw4QlpZWkRWOUV3NjhXTldMYy8zeXUra1pPb1QwS2s4NFI1QVk2OFRRZit1?=
 =?utf-8?B?NWpMTG9PbFZROVdQd1ZRZ09KOEpYdjl4WEQ0bUg2dVN5dHhXM3JCTzdoSFRM?=
 =?utf-8?B?NTlsOXhKYjhpQlZxTXMyU1N0aVgyeVFnd1JCWklkblpTYVU1dHdodTZRdmpI?=
 =?utf-8?B?Tk1VL042RWw1SS9Sa0lMU2VHWXNidm83MDFKdjVISU1RZnYzMUlxLzczLzVJ?=
 =?utf-8?B?SUgyYjhnbStCY25Ja2JxOSt2ak5xSDNtenhHZjY3Z0xoaTQ4RXcxSFp1K0hN?=
 =?utf-8?B?WGNUbVc0Z0RVYlg2NUN2VmR1MkRvdGVsNUhFZm5meFpSWVY5VUxabzUvbGND?=
 =?utf-8?B?VDVNSVBKbE5wejlkV2lYOHdpTVIvR29XeGdxZWcvR3dMM2p5YVh5L1BVbnZa?=
 =?utf-8?B?WndzNlI2bHBZbkoyU1BrTGhDbkQxNjZxcS82a3U1bTRuVFAyQThjZEhIbWQ2?=
 =?utf-8?B?cTBLRzltNVJEK2phem85ZWxKT2pjZXdCY2RFbnVnTSthdE5jNU8zaHhrRXEr?=
 =?utf-8?B?bVh6eVV5em13eVl4azd0WkQrSldqcTFQc0V3OUU4aFdUVzFaZzh5bWVvSWo3?=
 =?utf-8?B?U2d5K2tVOEpGNDhxcDFwY0h0bDZyeXBLZURicEg1bFY0YVgxeTBuZWxFVW9Y?=
 =?utf-8?B?SE8rUndGTWN2WGhGQTRLeEF6NnNRWXdkTGpuSjBaU3NWY2JJekNFMUxMZHVE?=
 =?utf-8?B?b3dFOHpLeHEzOTdOSllOT1BkanRtT3Bqd1pUMEtsRjVvcUJKQlJNcThCTnQ3?=
 =?utf-8?B?OUxYSFNYSldtMnhvSU9Yd1UvTytoQjBjNWp3MTZTcTJ6VjN1OTQvQ2pwbi8x?=
 =?utf-8?B?VUZLeXF0UUV2SFlheU1PMHZzSWJqVnZ6MWpsSHpjVHAvOFpnVDY2dTM3SXZ6?=
 =?utf-8?B?VmN6bWtJQk9saUZpZkxaWkRzbDNxSlFNOERuazFnNG5vUi9xRjFZYVJQb2Vj?=
 =?utf-8?B?QnJ6UmZmTjVtRzlFS2ZFYmJjYVExdXFQbExpbDMvOHlMRXp1SHJxZFo5dkFj?=
 =?utf-8?B?VnVpWTEyQTUyUVNqR256dVE3VStNK0tnN3ZrRDduekhGL05rSXIwVUlUZjM2?=
 =?utf-8?B?bzFBZlVrek9qSFBUNHdCeGo2WXd3anRNcEtMbDdYY0FHaG9wbVNmdzdRTEZh?=
 =?utf-8?B?Y0NSWFhjUW9iS0ZDSFdiNEdON3ltNGRYWFZwNWQ3M0JDWWd2SzA2dVd2TVJx?=
 =?utf-8?B?VWliWlJKRlloSzFicVhXaFJ4UXE3L2owenZoVGVpamRIWi9DaVA5cENvTENW?=
 =?utf-8?B?MUtyVUFjdk5vNGpkcWR1YzNSOFBYV1RjQTlUbG9Ud0F3ek5jQnZsejZhRHFM?=
 =?utf-8?B?aGV0T2lBWFhTbmtabnM2dVU2aVFqTjhqcldJOCtnUjZXdVB1K29WVTl3dG5X?=
 =?utf-8?B?dWRnN3JEVWxiaUtFVEF3T2xMallINTZpUUpwWmZmR3JsMng2WXZ6VVY1VE9H?=
 =?utf-8?B?eThUWmxobnNudVRxNDczZmFsQ2pjemtmajlwWGcrd01jQTZCTGdya3FCT0JC?=
 =?utf-8?B?R1JRaER3M3hHS0p4VlBJaE54N2JFS0puZWV3dlB4Tm16NFNpUVkxTTRkRzRk?=
 =?utf-8?B?QTM2MS84WTVCTVRvb2grZS9USm9IWGFWUitYb3JBc3pNY2JUNEJxd0cxUWpz?=
 =?utf-8?B?TkczL0NTQjVuazlUTDg5QXVOUjlEbXFnbFRLS1RHZVkrNkUvbkxUTlYwTzM5?=
 =?utf-8?B?M01QZ012a0ZvclBYZlFzc0RNR05hZlN6SzJEZXZxc0paR3hqYldVQmU1VDh6?=
 =?utf-8?Q?j5D1NarzcGkXNH2M+QWB8coO8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7644807D3D02394A943953E701AF591F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 564398df-ac06-4447-705b-08dc546e7258
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 06:14:12.1152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpkkKLdPYFlu3zuZZRW+gCroTN83mtwD6MBfUgs/jMX0lnRbJNyVpemetdCMlDG98zx2EbpM9T0417Io+wFgLW52xyVsRvpVbQL3AQDpO4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2575
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA0LzIwMjQgw6AgMDY6NDUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
cmJpdHJhcnkgaW5zdHJ1bWVudGVkIGxvY2F0aW9ucywgaW5jbHVkaW5nIHN5c2NhbGwgaGFuZGxl
cnMsIGNhbiBjYWxsDQo+IGFyY2hfbG9jYWxfaXJxX3Jlc3RvcmUoKSB0cmFuc2l0aXZlbHkgd2hl
biBLQ1NBTiBpcyBlbmFibGVkLCBhbmQgaW4gdHVybg0KPiBhbHNvIHJlcGxheV9zb2Z0X2ludGVy
cnVwdHNfaXJxcmVzdG9yZSgpLiBUaGUgcHJlY29uZGl0aW9uIG9uIGVudHJ5IHRvDQo+IHRoaXMg
cm91dGluZSB0aGF0IGlzIGNoZWNrZWQgaXMgdGhhdCBLVUFQIGlzIGVuYWJsZWQgKHVzZXIgYWNj
ZXNzDQo+IHByb2hpYml0ZWQpLiBGYWlsdXJlIHRvIG1lZXQgdGhpcyBjb25kaXRpb24gb25seSB0
cmlnZ2VycyBhIHdhcm5pbmcNCj4gaG93ZXZlciwgYW5kIGFmdGVyd2FyZHMgS1VBUCBpcyBlbmFi
bGVkIGFueXdheS4gVGhhdCBpcywgS1VBUCBiZWluZw0KPiBkaXNhYmxlZCBvbiBlbnRyeSBpcyBp
biBmYWN0IHBlcm1pc3NhYmxlLCBidXQgbm90IHBvc3NpYmxlIG9uIGFuDQo+IHVuaW5zdHJ1bWVu
dGVkIGtlcm5lbC4NCj4gDQo+IERpc2FibGUgdGhpcyBhc3NlcnRpb24gb25seSB3aGVuIEtDU0FO
IGlzIGVuYWJsZWQuDQoNClBsZWFzZSBlbGFib3JhdGUgb24gdGhhdCBhcmJpdHJhcnkgY2FsbCB0
byBhcmNoX2xvY2FsX2lycV9yZXN0b3JlKCkgDQp0cmFuc2l0aXZlbHksIHdoZW4gZG9lcyBpdCBo
YXBwZW4gYW5kIHdoeSwgYW5kIHdoeSBvbmx5IHdoZW4gS0NTQU4gaXMgDQplbmFibGVkLg0KDQpJ
IGRvbid0IHVuZGVyc3RhbmQgdGhlIHJlYXNvbmluZywgaWYgaXQgaXMgcGVybWlzc2libGUgYXMg
eW91IHNheSwganVzdCANCmRyb3AgdGhlIHdhcm5pbmcuIElmIHRoZSB3YXJuaW5nIGlzIHRoZXJl
LCBpdCBzaG91bGQgc3RheSBhbHNvIHdpdGggDQpLQ1NBTi4gWW91IHNob3VsZCBmaXggdGhlIHJv
b3QgY2F1c2UgaW5zdGVhZC4NCg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBOaWNob2xhcyBQaWdnaW4g
PG5waWdnaW5AZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1
cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnFfNjQu
YyB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxXzY0LmMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL2lycV82NC5jDQo+IGluZGV4IGQ1YzQ4ZDFiMGEzMS4uMThiMjA0
ODM4OWEyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2lycV82NC5jDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxXzY0LmMNCj4gQEAgLTE4OSw3ICsxODksOCBAQCBz
dGF0aWMgaW5saW5lIF9fbm9fa2NzYW4gdm9pZCByZXBsYXlfc29mdF9pbnRlcnJ1cHRzX2lycXJl
c3RvcmUodm9pZCkNCj4gICAJICogYW5kIHJlLWxvY2tpbmcgQU1SIGJ1dCB3ZSBzaG91bGRuJ3Qg
Z2V0IGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLA0KPiAgIAkgKiBoZW5jZSB0aGUgd2FybmluZy4N
Cj4gICAJICovDQo+IC0Ja3VhcF9hc3NlcnRfbG9ja2VkKCk7DQo+ICsJaWYgKCFJU19FTkFCTEVE
KENPTkZJR19LQ1NBTikpDQo+ICsJCWt1YXBfYXNzZXJ0X2xvY2tlZCgpOw0KPiAgIA0KPiAgIAlp
ZiAoa3VhcF9zdGF0ZSAhPSBBTVJfS1VBUF9CTE9DS0VEKQ0KPiAgIAkJc2V0X2t1YXAoQU1SX0tV
QVBfQkxPQ0tFRCk7DQo=
