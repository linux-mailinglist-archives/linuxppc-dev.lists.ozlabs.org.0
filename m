Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086087BD61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 14:13:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jtUE/1dt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwSVc23Hsz3vXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 00:13:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwSTk5BX3z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 00:12:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnuw3lh0S61LEYwPDbWahedTg9flpAg+ml8OlE2Ww2PTIyzyAdp2H9GTl+u4Uwqkazu2/2QSxiYtjhWB5pT1vHVunRJAyp1hX5hwhTvRAwxtGp+vxy+nECvi/QBWdsntkyui5TrdensPD0tmZSl32ZF06P1VlVG+XZEcjo18yh4VQrHuYAy71xWHp1h6fXjeDKEsZleCY7viuk6bWUhjULusZYWmp6M/qir+rZzHVk43gxtJAeKJbm0YWHR/N8MezOqFtQ+KoVecN/+DMQzyG2dxIlqkbUBdu4yqR/QFHMzKgmTaBqmbsSLLI6xo3ia5x/i6rx5/8LOctQyBZJVNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LYjtinn5cYqmaPoN6hSvk3ywtRAlD/oWsyyviVanjU=;
 b=SG4RPQVdPEFT5NW16ezPqL5tR+VlXuftAz4w5xUGDnRO6ZCvKxfKOXN7CxqEc7ueugQ9VH/r2zALs97vJ+mP9pg74+qf+rwQIWypINGWfYPa6xXH+v1xER7lQGLNK7cokxSjxo5xwfaCkMf4hsEk1L0QIKIAEkmAfPruPff+shayFQahHLHT4rO/cXdGPpbxHja6OKqYjmN5h+dFnp/6R+BnE/bolgjQSghq4KXbnw07p1tIvBbsy6ScDnZSDWU3Orc10fs4d2jAIkOLPpKPugjxVgqb5RYYCGBxLrszMdBQbdxWo++KwfYukElwAlmzY2wYJv6Dkb0jc8ZRT+8Kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LYjtinn5cYqmaPoN6hSvk3ywtRAlD/oWsyyviVanjU=;
 b=jtUE/1dtBzIabdtUZV/HM9ksoxFoGyohI/5+oWWo5KdTx/NivYASzEYxKNW5wu/Fqn1E9dAjqv0n6j/JSa9SUeESzdbKaJ2XimkazoycepHk5kqLnHjWpXSkaI5kKLj1OVcz9ED/1QYccZ8tgxDpDonJbgupQ6zJ/y1VWTWeLpUPfRDaMJ7t1BaoGlVKzgTqb5uQkVzimwYeSuVeThHK0uG9cN7yNewJ1sLR0MApiH8OrrhWO2mOidFQR2sKijWXqG5DG2vqH6XZ4o6w7EXvVcqljtsOapa/7cOXb/hYGv+JfsqqaVaJdsmnR4KuFQy1FOC5u0+mdHKF33rfjHAxFQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1885.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 13:11:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 13:11:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Index: AQHadZASkAUcDDurK02wtpi3kLRmM7E27NOAgABFZ4CAAAUJAA==
Date: Thu, 14 Mar 2024 13:11:59 +0000
Message-ID: <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu> <ZfLzZekFBp3J6JUy@x1n>
In-Reply-To: <ZfLzZekFBp3J6JUy@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1885:EE_
x-ms-office365-filtering-correlation-id: 22163883-e5dd-4220-c877-08dc442854ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DGTC2JFS9v1rZCIpXGOAhslN8+UV1UZLPsjPN12TaYpiBwoeQsLMNa0bEJ/uPk5h1WPbfhjHp0cAHyNoIqLMZSkX7VIQkSMQepTCEoBGHKbUpyzm8FoIKv4+UzXNljLyOH35XgcZvh8uLZYCb39Sk/8JHFqDC2c6le+LJLVfQ5Rfwl03WyZ8EDfBAEabjxVudSIKmJlYwfE+Vaxbo0zDcKdbG3uWrCmYOHjSA21933vxZaTl73UScmLIcMDEOk9xDDKInPhXc0KqSdMP657PHvwJL67rnWqRhOmu5eTMaAL5+SeAuyoRxFpSyPh2Vg7jK0FA9aXKwn49dcAV3r/re47XSsK66nNP1H2HJHCACgptVjZTrv10/vXrFHyQ3yUHC73Y8hDY+uTcS06dWpqsUhEvl2qdrsoG5mlzBa367iyb+Iz55GYp1mpi+Pw+MfLKM9QJQD4f879cutEcFvMmNdmAby3yluLtKk0T2jJwV3YPahgBRdQ5ttFF7td8E8u0JoBWs0ackD5rfZwAgO3I6H4gbtb8fgIldVbi57OHRXOMRrjExgOeldvuUrIbIlE2/uPecRIaP73cgtWCLM0o97lnefJDN6S3dwgKPleHcNI+OKNU7vA39mMBqf/6Kb3I2gGNWDQ5Izc7QG0N+GoptobbXHPj5vlovt8KYtJ2PPy6q3ul3lo2YwaD9rnUIlA/UlOJUUYFb3Ed/GDp7PAqqMN41q3jHFzOWpPgTfy4tAM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TnBmV3ZReHU4VHJ3bTRNQSsvVzFYbFpSRzYxYlZpMEdhZDJSVkhYYTV5T1hX?=
 =?utf-8?B?M2sxeXZ1dlRTUGdpaWZTM0NXUnFid0JwWGV0M0paTDBXejBWRkVodVp2bG9y?=
 =?utf-8?B?Nk5XdTNwTTBaLzJ3OUNETHVtOHYxWGRxZUhURnY2SDQzY2VtRmlXYjVWYlNU?=
 =?utf-8?B?R1JOTk9USTRldTdSU0gwMk1xcmRONjRNaHY4TFpPRkxCeFlSeUwrSkw2OHdO?=
 =?utf-8?B?Vm1jeGZ5cjM1ckFYM0h5WDhrSVFjZzIrZ1puQmo2eXlKOEh3OS9LOExuNkhW?=
 =?utf-8?B?alNwK1FndWJ5QUR1UG9LSEp5N3luVUtJdFFvRXM3R3J0a24vcTRwTDJEODNE?=
 =?utf-8?B?bndWMXpQWUF5enNHdGU1QnRtd0tqSmFWVG9nOVJDUFc0N0YxTHIrUm5rVk85?=
 =?utf-8?B?TVY1WHhSS2pxbmJLZXdXcCt2Wkk2c2gzUGtVSzVBS3BWcXhmWnVGeWRkZWZ2?=
 =?utf-8?B?QzFOLzQ0RzB4d1NVSlZndElBUHBUam9JTFhrZlRDWCszVG5GT083NFhBZHpq?=
 =?utf-8?B?SGVWeWhVU3lFbEV4aUlKQ09LUld5WGRmd3dZV2g5QU5WUlJwVWpFdTFjRlEy?=
 =?utf-8?B?TTFYMmozR2psWnAxWXBJc01yZ0l1YVcyRTZWajVWL1kzWHZjNkw5c1VTYUl3?=
 =?utf-8?B?ekdHeFkyckpJNXlyTDRVN2t5NzVERFAxQUJkRnN2bGZTZjFKbktSV3ozdXRJ?=
 =?utf-8?B?Mzh5K0hvUnhrWStGbUNlQko4RllNMVBEaDZmOEtyUVc4UWhXWVRxRmhCMW5j?=
 =?utf-8?B?WkpDNmtqcEgxUWRhSHlhSFdFbWZJajltcnJ4OEQ3cy9NVXpGRWdaS1FiS1RB?=
 =?utf-8?B?bUFSZFFvTGtiZmg5QjExYWhjRUJpYlBwY1BIZTZZTW04OUY5OVhDWEpJaXR5?=
 =?utf-8?B?cGlFMUhSMGlVQlpDVU5yZkNMMFhvcldKdHVITXk2blFlQm1tcjdvazJlWUV4?=
 =?utf-8?B?TjZWK2lqcEVNUmM0TXZmLzFWSHE2YkdHZ0EyU0R4QWh4VGhIbHhEait5ZW0w?=
 =?utf-8?B?ZDkxbWJiQWlTNVlDOW4xVUJQV0EwdVBHa2RBRUg2ZmxVejlSeU9OOEpTdlk5?=
 =?utf-8?B?OC9DTGZYMjE0dkNqeUpxL0svdnVSSEwyaXgwZXorSWF5MjRjbnlMZ0Nha2dM?=
 =?utf-8?B?b2YzN2R3c00ya2NGTXFLQmJ0ZFVLcnVkN1hxL2NSc1ROb0tnb2hJazc0bUha?=
 =?utf-8?B?NGE1d2R3RU40UFhWV1c0Nmg2cEd0M2FWQTRCdDVsaFJzemtwS0xuYXdnUlpp?=
 =?utf-8?B?cU40elI2SEQyMXlrTWNLNzV2WTVFRzVOaUE3elU3SW1jeldSc2ZOY2VkU3Rx?=
 =?utf-8?B?OHNscDdQNkV5OS9tZVFtMFNLZEtLVTJlM3N5OVhBWFJsZGE5VEhzVEJ1NlAw?=
 =?utf-8?B?Syt1YVBDdUs5MWFFMnBkS2lzSy9zZ1NFa1ZhL2tVSEFvenBQcGlpeDFDWDBr?=
 =?utf-8?B?REZPeVJUTHRYeFU0cUVyV1pGVjNLanVhdjNGNVpKcnIzeFZXcjhMRnlDQjFI?=
 =?utf-8?B?dWhzYjNZa3dUS0VWQS9vcS9YZ1VhcG1yL1hYWktqNG9sM3BvL3JTUXllN2pl?=
 =?utf-8?B?RmlVTFZCU3RjOGV0WlAxUUFzUTBsbjZFWGxSTElvMHcvcU9EL3BSdkd4UDBi?=
 =?utf-8?B?YVlCZHFsWnFxTTl5OUJxQjVlVlhLNmdDcm9XNHhnSEJUVkRsME1TeUJiNTRI?=
 =?utf-8?B?UWtZdHNYWHFsQW55U0FsOWg3ZEhDeG9QQXZCZVVsTmpJaHZHT1gzZ1VNc3hF?=
 =?utf-8?B?OWZURnV4KzE4VitHRU9NUlphTVUvZVMwTy9yTzc3aTV4OHFGQUlOa1JXN1BG?=
 =?utf-8?B?ZWMrbW14THZFVy9UNnh1TnZMTll1Yy9HWndIWFB2NnNRNXMvNVpDMXg1dkNO?=
 =?utf-8?B?ck1aOEg4bnpKdVYzRGZHb3VUWHJMZjJ1cExLa1hMVlZzOGVyemxwcVRUSlMr?=
 =?utf-8?B?NjNubjJuMlVzc21MWlZxNW5OV20vS2k0RnRkaFRyb1NXL25ad2txVVpRZnhN?=
 =?utf-8?B?Z0h4bkJtcHovU2owSWFQNjZ6WmZGbHEybHRGSjdKQ0o3ZzJkWG05V2FYSHc3?=
 =?utf-8?B?Y1dMV01kTndYN3RBS2xPVi9uSENqcm9GRFRnSWNVcURQeHZnRmVIc2syWGZI?=
 =?utf-8?B?YW8yaFE5b25oa215cjlwR0dZdlBzU3RUUmdXOG13bWhYdHdQL3FPVmMxc2Uy?=
 =?utf-8?B?bWNtTFBZa09GMSsrZEJ5RytFNVp1RnpsRS9JNXJpOTZ1eG9IZEJNZWdqMnRY?=
 =?utf-8?B?MFUraUN6ZWE5MVFSa0JGUnRTQzh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BBB8ADAB602D54087A433C82F663C9A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22163883-e5dd-4220-c877-08dc442854ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 13:11:59.3905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIkd5ATO0OCQTOdbEG9mHkZDV880pEv8gn9ulL/SEwh6jzcG05Pagy2fJm0yjddJ1cC2u3GbkpcW2EMnmiMkmDFS7gO6EAFTvWpsZ8bOEEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1885
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAzLzIwMjQgw6AgMTM6NTMsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFRo
dSwgTWFyIDE0LCAyMDI0IGF0IDA4OjQ1OjM0QU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pg0KPj4NCj4+IExlIDEzLzAzLzIwMjQgw6AgMjI6NDcsIHBldGVyeEByZWRoYXQuY29t
IGEgw6ljcml0wqA6DQo+Pj4gRnJvbTogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPg0KPj4+
DQo+Pj4gUG93ZXJQQyBib29rM3MgNEsgbW9zdGx5IGhhcyB0aGUgc2FtZSBkZWZpbml0aW9uIG9u
IGJvdGgsIGV4Y2VwdCBwWGRfaHVnZSgpDQo+Pj4gY29uc3RhbnRseSByZXR1cm5zIDAgZm9yIGhh
c2ggTU1Vcy4gIEFzIE1pY2hhZWwgRWxsZXJtYW4gcG9pbnRlZCBvdXQgWzFdLA0KPj4+IGl0IGlz
IHNhZmUgdG8gY2hlY2sgX1BBR0VfUFRFIG9uIGhhc2ggTU1VcywgYXMgdGhlIGJpdCB3aWxsIG5l
dmVyIGJlIHNldCBzbw0KPj4+IGl0IHdpbGwga2VlcCByZXR1cm5pbmcgZmFsc2UuDQo+Pj4NCj4+
PiBBcyBhIHJlZmVyZW5jZSwgX19wW211XWRfbWtodWdlKCkgd2lsbCB0cmlnZ2VyIGEgQlVHX09O
IHRyeWluZyB0byBjcmVhdGUNCj4+PiBzdWNoIGh1Z2UgbWFwcGluZ3MgZm9yIDRLIGhhc2ggTU1V
cy4gIE1lYW53aGlsZSwgdGhlIG1ham9yIHBvd2VycGMgaHVnZXRsYg0KPj4+IHBndGFibGUgd2Fs
a2VyIF9fZmluZF9saW51eF9wdGUoKSBhbHJlYWR5IHVzZWQgcFhkX2xlYWYoKSB0byBjaGVjayBo
dWdldGxiDQo+Pj4gbWFwcGluZ3MuDQo+Pj4NCj4+PiBUaGUgZ29hbCBzaG91bGQgYmUgdGhhdCB3
ZSB3aWxsIGhhdmUgb25lIEFQSSBwWGRfbGVhZigpIHRvIGRldGVjdCBhbGwga2luZHMNCj4+PiBv
ZiBodWdlIG1hcHBpbmdzLiAgQUZBSUNUIHdlIG5lZWQgdG8gdXNlIHRoZSBwWGRfbGVhZigpIGlt
cGwgKHJhdGhlciB0aGFuDQo+Pj4gcFhkX2h1Z2UoKSBvbmVzKSB0byBtYWtlIHN1cmUgaWUuIFRI
UHMgb24gaGFzaCBNTVUgd2lsbCBhbHNvIHJldHVybiB0cnVlLg0KPj4NCj4+IEFsbCBraW5kcyBv
ZiBodWdlIG1hcHBpbmdzID8NCj4+DQo+PiBwWGRfbGVhZigpIHdpbGwgZGV0ZWN0IG9ubHkgbGVh
ZiBtYXBwaW5ncyAobGlrZSBwWGRfaHVnZSgpICkuIFRoZXJlIGFyZQ0KPj4gYWxzbyBodWdlIG1h
cHBpbmdzIHRocm91Z2ggaHVnZXBkLiBPbiBwb3dlcnBjIDh4eCB3ZSBoYXZlIDhNIGh1Z2UgcGFn
ZXMNCj4+IGFuZCA1MTJrIGh1Z2UgcGFnZXMuIEEgUEdEIGVudHJ5IGNvdmVycyA0TSBzbyBwZ2Rf
bGVhZigpIHdvbid0IHJlcG9ydA0KPj4gdGhvc2UgaHVnZSBwYWdlcy4NCj4gDQo+IEFoIHllcywg
SSBzaG91bGQgYWx3YXlzIG1lbnRpb24gdGhpcyBpcyBpbiB0aGUgY29udGV4dCBvZiBsZWFmIGh1
Z2UgcGFnZXMNCj4gb25seS4gIEFyZSB0aGUgZXhhbXBsZXMgeW91IHByb3ZpZGVkIGFsbCBmYWxs
IGludG8gaHVnZXBkIGNhdGVnb3J5PyAgSWYgc28NCj4gSSBjYW4gcmV3b3JkIHRoZSBjb21taXQg
bWVzc2FnZSwgYXM6DQoNCk9uIHBvd2VycGMgOHh4LCBvbmx5IHRoZSA4TSBodWdlIHBhZ2VzIGZh
bGwgaW50byB0aGUgaHVnZXBkIGNhc2UuDQoNClRoZSA1MTJrIGh1Z2VwYWdlcyBhcmUgYXQgUFRF
IGxldmVsLCB0aGV5IGFyZSBoYW5kbGVkIG1vcmUgb3IgbGVzcyBsaWtlIA0KQ09OVF9QVEUgb24g
QVJNLiBzZWUgZnVuY3Rpb24gc2V0X2h1Z2VfcHRlX2F0KCkgZm9yIG1vcmUgY29udGV4dC4NCg0K
WW91IGNhbiBhbHNvIGxvb2sgYXQgcHRlX2xlYWZfc2l6ZSgpIGFuZCBwZ2RfbGVhZl9zaXplKCku
DQoNCkJ5IHRoZSB3YXkgcGdkX2xlYWZfc2l6ZSgpIGxvb2tzIG9kZCBiZWNhdXNlIGl0IGlzIGNh
bGxlZCBvbmx5IHdoZW4gDQpwZ2RfbGVhZl9zaXplKCkgcmV0dXJucyB0cnVlLCB3aGljaCBuZXZl
ciBoYXBwZW5zIGZvciA4TSBwYWdlcy4NCg0KPiANCj4gICAgICAgICAgQXMgYSByZWZlcmVuY2Us
IF9fcFttdV1kX21raHVnZSgpIHdpbGwgdHJpZ2dlciBhIEJVR19PTiB0cnlpbmcgdG8NCj4gICAg
ICAgICAgY3JlYXRlIHN1Y2ggaHVnZSBtYXBwaW5ncyBmb3IgNEsgaGFzaCBNTVVzLiAgTWVhbndo
aWxlLCB0aGUgbWFqb3INCj4gICAgICAgICAgcG93ZXJwYyBodWdldGxiIHBndGFibGUgd2Fsa2Vy
IF9fZmluZF9saW51eF9wdGUoKSBhbHJlYWR5IHVzZWQNCj4gICAgICAgICAgcFhkX2xlYWYoKSB0
byBjaGVjayBsZWFmIGh1Z2V0bGIgbWFwcGluZ3MuDQo+IA0KPiAgICAgICAgICBUaGUgZ29hbCBz
aG91bGQgYmUgdGhhdCB3ZSB3aWxsIGhhdmUgb25lIEFQSSBwWGRfbGVhZigpIHRvIGRldGVjdA0K
PiAgICAgICAgICBhbGwga2luZHMgb2YgaHVnZSBtYXBwaW5ncyBleGNlcHQgaHVnZXBkLiAgQUZB
SUNUIHdlIG5lZWQgdG8gdXNlDQo+ICAgICAgICAgIHRoZSBwWGRfbGVhZigpIGltcGwgKHJhdGhl
ciB0aGFuIHBYZF9odWdlKCkgb25lcykgdG8gbWFrZSBzdXJlDQo+ICAgICAgICAgIGllLiBUSFBz
IG9uIGhhc2ggTU1VIHdpbGwgYWxzbyByZXR1cm4gdHJ1ZS4NCj4gDQo+IERvZXMgdGhpcyBsb29r
IGdvb2QgdG8geW91Pw0KPiANCj4gVGhhbmtzLA0KPiANCg==
