Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B9588BB06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 08:16:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AT7TjBRZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3h1H6FF2z3vYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 18:16:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AT7TjBRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3h0W0M2Pz3cxn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 18:15:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+2QvCzm7YYocK1x404mNPuBNaDJbxy3mV9zuVyoKecOluP+z/uEG+fIYwIBjTUEVndXi1NsBnE8y9gBM2i6DAnp53gGVO2412zkTu75Zzfktjvzux7aUcscT0/Lo7Hd+GqSoI7jsuT8rTXFH1s9VwYSwnbtvzfWKoW6hhe71yFaHTRQiojNiFtu7kHQq5sAEG5o/c5BZddRjIx+d//ieBnKUunIreTCgbMinxvUqF8+t2lZ9w4jGRtOlyTsi54nBe0bS+Qlhd7u+Di900MA2qbxTXFNtuGRatT+CX3XszWwPyhi2YsqDJEe2tNEf2ytb7g8OoJtIxN1QXyYaoTirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=996XgbKFxn1ldq4JImNlBKjeqerDE5eHiFo2MIOap4E=;
 b=Z78fttgkyRR5dlaNkRbv2+SSTwEaSTU0vg2kpoK1De67L4PZtBx6TWdRY2huMh324rHRYuV8BWwJMR3KRBXNlgh1UCOkLB0ErRnUTdQkMaR7cK3vsAz5jNDWOX0M+N9KSX+dwQwJUMIV5xtQCPwsTTYIeYd6fZNLt0rcoTg3lRDd1qpU4E9hhP4Y4+/v9QurnuzxfnPSWbW9kkOfRhq0gr8lt0JsPb+n4eWL2nHdYF4d9SxZxcn+nvVOqSH22zjsfNyPsvXTwjmlsZgdvP658tpX7dkkcUq4Wo3skb8bEq2vaJJPQgDYrti/hbfK/NexpCkEen1IP/VE3+ZwQugeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=996XgbKFxn1ldq4JImNlBKjeqerDE5eHiFo2MIOap4E=;
 b=AT7TjBRZmdgfWh8vQkKykhe5WvVFCk0r5Pd8kxmyKOodKLhUbwo2Bz4wmZwZ5RcNDzFgtftVIdm5J4KmiZCJDYcYzeVbqXI7HRJBsSg2mJl5SXHuKPjhQf/jdIzboYb5BTQn+bp4xtdfum5xiUJKYrBpkyeqrRFfUYLVRauwFftlY4L232ZdlcYCfRLowjCnwwmloHOW4HepYcx/0MGrPvYJ1j7ig9UxJ4axBG4Ht6llzJbRKeXmMDVbIBw9Xu/ru15ZzMvIZAeTG0a4Ci/5Durqd7alDF8QGqpWxk5zNBawQ5M/22vVDE04NwS77D5VmJCggzHmpH5lVDjekxBx2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR0P264MB4863.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:64::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 07:15:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 07:15:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 3/3] powerpc/code-patching: Restore 32-bit patching
 performance
Thread-Topic: [PATCH v2 3/3] powerpc/code-patching: Restore 32-bit patching
 performance
Thread-Index: AQHafwasYD9leX+Sfk2Kz0mUlkJ+6rFJnKEA
Date: Tue, 26 Mar 2024 07:15:13 +0000
Message-ID: <d71cabc6-e377-412c-8c41-32fbc191a12e@csgroup.eu>
References: <20240325224848.20987-1-bgray@linux.ibm.com>
 <20240325224848.20987-3-bgray@linux.ibm.com>
In-Reply-To: <20240325224848.20987-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR0P264MB4863:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  h1c8y3ycI82NB9/UZbo1fo7JbMT5GftnTidgKsHxktCRt03MmU24lVUF5xuSg7LsSNgI0kYjY4kEKMMnpPU0ORR3N9+TSDEfdcpBB07s2FhEMmytL7/SMHqvPu/tP5nq+eJioO9lIIEdnJjHQUuaNua8x/UvVj6+V1qK0kDQi65qm8um8lB/s5Ab2suFSetV++gxf/RK4R6oLaMN8N2pBkU4kv3Z8Bi2YlRMBO9U96r0dm2EVs3ce3ozRNzI3esxrKcw4w725CdL36z7NjL7wRldWysn8YlDFwSXDGdY4MH61eo8XhXNW4Cne88ALlG/5u57xi0hj+eSTZnT2/lcESv/ptOMjM1+VN+CI8AmL76QaEwaQQSUuDESd1i7OqYTA9NxIHgFLvcbcRY+g3uUcY3LDkxzc9w5Gf3Hyj1xklMCI/u9XZ2z3GR9J5jiha3F3u3Ye5LMWnua/hf0ogc8VxbumXCnScUivAekZw1LTCUOTMKL7aZkL1sc60b1z2uvj+mkZExakGHzoOXjI5FGTQ82GsdIbw2IbYvcZclg0iUv3JxvN0PGZnKzkeg5NF9fe3t5z3whw2VQ0+kQzSRAT3BuvwDmq/hP2mI0y39uiGE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UUhVNkM5eEoxNzJYZFNsWE1CMkdma0ZqY1ZDQWw0eTlxdU9RNkppL0h6ZTg4?=
 =?utf-8?B?N3RqQ0FubGtzcEZCY1VzRi85VnlzL0FPTmV4TGlkNFF0MjZrcUUzUkJvU3ZT?=
 =?utf-8?B?ZGg5NitJMjd2SDNFeFU0UWRFRlB4VmJ6UDQ1eVMveDQxOG15RHdpd0Rya0to?=
 =?utf-8?B?b0JzWGc0aWtJSDZyaFJSZGVoYlE2RWp3d2Y0NFM5SkUxekFwM0tLeVl4dnU5?=
 =?utf-8?B?MW5NdXVkT0JFT1duN2FSdGo4UzN1U3BJaTdXbmpWTDlXY3dQR3Zudm1KL0Rm?=
 =?utf-8?B?SGpYNklWYzlwbEFWeGNXZy8yNzVKRXNxM1RPTTNLSWpMN1p6LzM3YXJhZldU?=
 =?utf-8?B?amp2L3FBYmY0YVdIdlNTTEpIMFBiM2lQOTVQdThvUEFPYzAvTU8vWjM1Zmxt?=
 =?utf-8?B?ZTlOUnhoenJvd1FjNFdKNCtLVUZwc3YvMHQ0VGVCeWNNRk9PS09EV3lzcCsy?=
 =?utf-8?B?M0E1N1pQZkVvd2JmN05Ed2JBMTZ6SkJ4M0RiWFFjakVwcjVqNGdyZTdkTzZI?=
 =?utf-8?B?QnkveVZVNGpRK2JzeXRVRnFlUTR6Wk0zRWpuOXFmSkUwbW5wMXpLaVl0cVBV?=
 =?utf-8?B?QjI2Q0NUL1BDTmdkRnpnZ0xlSHkrWGlCdkhqQWNUSmthZ1RhUzVRRlhmRGth?=
 =?utf-8?B?YnFZMGxDUFNQTkFYWjlBWG5DNWJUanhsc1NINUNFRFgyZlpzaTFZZHBtTWlx?=
 =?utf-8?B?RWNNaUhzZlJpempGY1VVVHJDaWhWT0N3em8zNjkzcWs0U2hCcFRBeEtiaXln?=
 =?utf-8?B?Wk0xbU5iOGoxK2JZVkI5aWVYcHE2VTR5RHNvcTZId1VnTmxQV01RbkluaXdS?=
 =?utf-8?B?V0xFd0lSZUxUMzZSaWo5UXdzazNGaTZvM3dGS1hQWjErMWJsT2c4c3g1WEJp?=
 =?utf-8?B?WUpHdDVkVzU5UWZsbW9ocWppZXoxNGhYTUo1M0NKWnlBbDJlOVp5dUpUanh6?=
 =?utf-8?B?aEp6c1BNVWpObkFvVkVFbFpGSjE4eGs0dzNUS3kvYkp2cTRPcUFJbnFPbzhW?=
 =?utf-8?B?RXdZS1FscU92cDdWWk83NzlsWlR1WU94U0tUeDNqTWYvSGZ2eWpzK3hONnFh?=
 =?utf-8?B?Vm5oditBeFR0Z3ZDU2JOU3I2QlRjQVR3cytESFJ2ZVBNdkVIa2krQ2lyVnBS?=
 =?utf-8?B?N29CbkdTSGVlUFNVYkF5a3BucnZBOC9tcHBSOFJKbjdWSEpmR3dldEtSajlw?=
 =?utf-8?B?bll3K3FOZy90NWxlL3ZPSHVWSENGSlNVVWNuZFNyS2FQOVhNbjJhWmZSdGhv?=
 =?utf-8?B?eVMxK1lNS09SNk9MTlNUZE5XWFIzYkVwNVU2bVFOVUplUlVtZ1hxeGFFaysx?=
 =?utf-8?B?aytMdzlHMVVHUVpZZzJObitIelV4K3JmaW5GQ2FPOW9GRjFoYWU4dC9nbnBj?=
 =?utf-8?B?SEVmQjJWQmNTei9Dd1lTaHhHRWZBanpEZ1hrdTRaRXhSVHI0eHljN2ZEMDhO?=
 =?utf-8?B?M3NlanU4dGd4blZHWEJ1VmM4aWtrakdMUFNvK1NKTGY5UzgzaU9BTmN1bXM4?=
 =?utf-8?B?U1MxY1JwbzM0OTB3MzRaS0Flem1lenRJNWd1Mkk1RERDZEZPeHM0a0d6a0Er?=
 =?utf-8?B?NndDYk1tbDZjZzlBd1lmUFozMVZiOHVzeWdCRktodm01UjlLNWlXZG9EQVpS?=
 =?utf-8?B?eTFEZUlacmNyeXlySHdaVGduV25GMFhhYmo1WkRKY2tEL2I1Q213U1dDU1FO?=
 =?utf-8?B?cW1USldzR3pXK3JCTXJFanVIZG9hekE3ZlhhOCtSVEZoc2pzV2c2dzFSRWZT?=
 =?utf-8?B?eWdQcFdXVFlqQThRRWU2TU44ZWNRT0ExNTk1ZTNrNzE4aTN2WDN2eFBkL243?=
 =?utf-8?B?WncwdXozY1Zjd1FWSy9TbEhadGRiNUJRUldSVjAyY1Rxdy9kd0NLS3l3Q3hm?=
 =?utf-8?B?RGE2Y0lOaHd5QjZxMG1VRUNodUZSWmUxZXdjNkF2ZmhZSjJFQkF6d3pLV0d0?=
 =?utf-8?B?QU5WR0JFSEJ4WHdnTHBTS2MrUytkS250U0kzbTN4dTFhNk5hVWFFbXdmQlNa?=
 =?utf-8?B?ZXBCODF5KzF3RmQ2QTAraGZ5NUJWM2xabFdqUy9XcllCSXRZZXB6a285SGtI?=
 =?utf-8?B?cHJySTFBeVZSZytRRlZ6ZE9WeWpWKzJ3THRBV2J6QlFRUWFBVE9nMHZjcWxq?=
 =?utf-8?B?bXpvWW03YVhNcmJ3bzhaQndkbFlkMDN5S2htbnVvUWtmSXg4ejNWVzVFcGNz?=
 =?utf-8?B?a1ZVbzF3UC9xd3FGUVNaWXZqYnBaU25vMEJjVU9PME94dDJuRGNsRTd4SU1J?=
 =?utf-8?B?ellzdVdwaW1lRDJoVXFoOXpFbU9BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4A5CF72FF073E48ABDF171F4C7D6EC7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cb3cb8-2ace-4983-2b93-08dc4d647b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 07:15:13.9298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1mJYJFfG/0yOldX0lnR+30t96y56pGB+T8OssKT17Som3iU9MHi5JK3ETOLG2AFGANc1iLUx9xiI7cSolpIIzAjye+KI+vlK2xkrKLfq0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB4863
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

DQoNCkxlIDI1LzAzLzIwMjQgw6AgMjM6NDgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIG5ldyBvcGVuL2Nsb3NlIGFic3RyYWN0aW9uIG1ha2VzIGl0IG1vcmUgZGlmZmljdWx0IGZv
ciBhDQo+IGNvbXBpbGVyIHRvIG9wdGltaXNlLiBUaGlzIGNhdXNlcyAxMCUgd29yc2UgcGVyZm9y
bWFuY2Ugb24NCj4gcHBjMzIgYXMgaW4gWzFdLiBSZXN0b3JpbmcgdGhlIHBhZ2UgYWxpZ25tZW50
IG1hc2sgYW5kIGlubGluaW5nDQo+IHRoZSBoZWxwZXJzIGFsbG93cyB0aGUgY29tcGlsZXIgdG8g
YmV0dGVyIHJlYXNvbiBhYm91dCB0aGUgYWRkcmVzcw0KPiBhbGlnbm1lbnQsIGFsbG93aW5nIG1v
cmUgb3B0aW1pc2VkIGNhY2hlIGZsdXNoaW5nIHNlbGVjdGlvbi4NCg0KVGhpcyBzaG91bGQgYmUg
c3F1YXNoZWQgaW50byBwYXRjaCAxLiBUaGVyZSBpcyBubyBwb2ludCBpbiBoYXZpbmcgdGhhdCAN
CmFzIGEgc2VwYXJhdGUgcGF0Y2ggd2hlbiBpbiB0aGUgc2FtZSBzZXJpZXMuDQoNCj4gDQo+IFsx
XTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzc3ZmRjZGViLTRhZjUtNGFkMC1hNGM2LTU3
YmYwNzYyZGM2NUBjc2dyb3VwLmV1Lw0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IFNpZ25lZC1vZmYtYnk6IEJlbmph
bWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IA0KPiAtLS0NCj4gDQo+IHYyOiAqIE5l
dyBpbiB2Mg0KPiANCj4gSSB0aGluayBTdWdnZXN0ZWQtYnkgaXMgYW4gYXBwcm9wcmlhdGUgdGFn
LiBUaGUgcGF0Y2ggaXMgQ2hyaXN0b3BoZSdzDQo+IGZyb20gdGhlIGxpbmssIEkganVzdCBhZGRl
ZCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLCBzbyBpdCBjb3VsZCB3ZWxsDQo+IGJlIGJldHRlciB0
byBjaGFuZ2UgdGhlIGF1dGhvciB0byBDaHJpc3RvcGhlIGNvbXBsZXRlbHkuDQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIHwgNiArKystLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIGIvYXJjaC9wb3dlcnBjL2xpYi9j
b2RlLXBhdGNoaW5nLmMNCj4gaW5kZXggYjNhNjQ0MjkwMzY5Li5kMDg5ZGExMTU5ODcgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IEBAIC0yODIsMTMgKzI4MiwxMyBAQCBzdHJ1
Y3QgcGF0Y2hfd2luZG93IHsNCj4gICAgKiBJbnRlcnJ1cHRzIG11c3QgYmUgZGlzYWJsZWQgZm9y
IHRoZSBlbnRpcmUgZHVyYXRpb24gb2YgdGhlIHBhdGNoaW5nLiBUaGUgUElEUg0KPiAgICAqIGlz
IHBvdGVudGlhbGx5IGNoYW5nZWQgZHVyaW5nIHRoaXMgdGltZS4NCj4gICAgKi8NCj4gLXN0YXRp
YyBpbnQgb3Blbl9wYXRjaF93aW5kb3codm9pZCAqYWRkciwgc3RydWN0IHBhdGNoX3dpbmRvdyAq
Y3R4KQ0KPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgb3Blbl9wYXRjaF93aW5kb3codm9p
ZCAqYWRkciwgc3RydWN0IHBhdGNoX3dpbmRvdyAqY3R4KQ0KPiAgIHsNCj4gICAJdW5zaWduZWQg
bG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0KPiAgIA0KPiAgIAlsb2NrZGVwX2Fzc2Vy
dF9pcnFzX2Rpc2FibGVkKCk7DQo+ICAgDQo+IC0JY3R4LT50ZXh0X3Bva2VfYWRkciA9ICh1bnNp
Z25lZCBsb25nKV9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfY29udGV4dC5hZGRyKTsNCj4g
KwljdHgtPnRleHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpX190aGlzX2NwdV9yZWFkKGNw
dV9wYXRjaGluZ19jb250ZXh0LmFkZHIpICYgUEFHRV9NQVNLOw0KPiAgIA0KPiAgIAlpZiAoIW1t
X3BhdGNoX2VuYWJsZWQoKSkgew0KPiAgIAkJY3R4LT5wdGVwID0gX190aGlzX2NwdV9yZWFkKGNw
dV9wYXRjaGluZ19jb250ZXh0LnB0ZSk7DQo+IEBAIC0zMzEsNyArMzMxLDcgQEAgc3RhdGljIGlu
dCBvcGVuX3BhdGNoX3dpbmRvdyh2b2lkICphZGRyLCBzdHJ1Y3QgcGF0Y2hfd2luZG93ICpjdHgp
DQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIGNsb3NlX3BhdGNo
X3dpbmRvdyhzdHJ1Y3QgcGF0Y2hfd2luZG93ICpjdHgpDQo+ICtzdGF0aWMgX19hbHdheXNfaW5s
aW5lIHZvaWQgY2xvc2VfcGF0Y2hfd2luZG93KHN0cnVjdCBwYXRjaF93aW5kb3cgKmN0eCkNCj4g
ICB7DQo+ICAgCWxvY2tkZXBfYXNzZXJ0X2lycXNfZGlzYWJsZWQoKTsNCj4gICANCg==
