Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837687C8D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 07:40:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IAiikqQm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twvkv6WWXz3dfy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 17:40:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IAiikqQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Twvk76sMDz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 17:39:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coZnP/2/TTCeMCWdCCkGmUA2qs+GWxAR6WmdLTfk2iH8NYJ0WKZAqEpWcQmCjtb+5JKmwOeyRqLXtoH2mlGAoVrjskipR3ZgA4fYdeLkOOHW2INM7lhd+1MZpAeS/7tJIEjhkqrEk6jKpidKNZg6LOHCnbmuFbeM6bgFfoMvUWwBtxaBmVDF04zd8aCh3dxijo21osOSNruNInvKlfu6t6Ht0myFyE2wY2roDETcBn0KvSzsWSbSXJmLFEe1BB7wVTkOCtu+fVe3TpH6Odm8wAShtYCW26fUtUN0cjROaEH86vZ87JXox6XivHXxjeQBEM/2nY2w4khCYHM6C/gHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPVeYMFRLL+pyulFTwjaRj6GfA0p7zXYFk7JedzrMi0=;
 b=Eyct/o050wQBmrZ15bsXwucv6nqhTyKNvoC1mddwurcFxIuI7d3HBZF1mC/9aTKczUIvHhwCIjubDn+LWRfgS7ZwCJGkv3R5bYfA1BMjfq0eSRIGPUYQgkOkZ9fq2UjBxjbfSxnsXBCHEsHUTrlBCgmJd6q24wBLQoqPfREwgHVE1aelrG3fFabJlL1g2ulV0Y/VnMYMZQ9e/+s6hmf926vdnuG/s4LSCnOQv7j5OeqheSkhDgOqjk1sGVx/jeTaMjQw/TeKeMYBHzyyPrTC20LetVMJun9mGMhlpg6yjg7/ahqkEikBwcBS/JnRsMD3KbZ+zzyO9d+nSzR0FccHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPVeYMFRLL+pyulFTwjaRj6GfA0p7zXYFk7JedzrMi0=;
 b=IAiikqQmHkTody91SprG3sK5AlT9v5qiO97hsPlKyMOadnkRY8oV/DJFkk3dZaCXnYrh345Jsry8FhQ4ff5Ce9BlD9RXckbdCfMdHINssx5Ch6autDLTSZOMXpTe+dpvRzcAYB8u/GNFFULdQJLUUzd1XhLPAri9vAdsGtRuJ40c2+bWKSLYIr7ErT6uqy/TvLfJvNm0inqFCtIQ+ZD1N6KFoj6DhY6oVf68471bxy36KBJesGTkKfyvZWfTRM5zdVGVfWk7GZabchNqIvFJQDD6uAIFDBMM/gDaGJeJ10pkSzkt1zjtCWMt9Pe61VypN7NRGWiT+77W1AiMjCR7og==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2735.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 06:39:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 06:39:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 3/3] powerpc/code-patching: Optimise patch_memcpy() to
 4 byte chunks
Thread-Topic: [PATCH v1 3/3] powerpc/code-patching: Optimise patch_memcpy() to
 4 byte chunks
Thread-Index: AQHadoTilNBU8DBPbkKpIHYNQ510TLE4WfyA
Date: Fri, 15 Mar 2024 06:39:22 +0000
Message-ID: <01aba74d-d05b-46f7-9f57-9c7fe6c31578@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
 <20240315025736.404867-3-bgray@linux.ibm.com>
In-Reply-To: <20240315025736.404867-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2735:EE_
x-ms-office365-filtering-correlation-id: 816aea3f-bcbd-488c-15df-08dc44baa624
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  J0VXdVovhShljMo5VUlGiSDVuQh1iypMzlvUY+ci/4P6CDv2iQNqzNm13hJ9OE71xNipX7xLrW0b/q0YG9qK1pBIbJXn11GabjBNFsmcORaazqA92nuy0brGCYR9dZPM9VRiEIWyt/sDiuqKtttHM2lA0pURChWB7LtwXqoByluUiERTIC5R5p/iOEs7icFkT5j82sinVRdz2BQCFCdYpdjCJP6Vt7/7ayRhCLktOWe6pIRFx+iA1caPCsIX96+eRvrbPvylAdz1ccNUbDGYJwxZ40w0DmohuMggCyizLgU0T3Z+V5oz1nypWpG5gEgzz2NZhIxpXR+XF6HxpXLhc2LFm73DWZN5UfUHJ10X+LhhcrsSHguqsPQjEPpOf6WIF3o7myD49PmUpCfxTJ1lU3+OmLQwWj+fGrWugt24LBpq7X2XAxQNeZwWF6eKX3SwEmhGuOOPSFktIwfnOzWzcOdFGzl+rUORhhCiaQwLGUfX9qyaHmfCm11inRWE3ig68vdjt6pO7InYay/APr0QhIgbJD0RvgRdQlZA9E9RypZxf6qaGtFo6fwtPpwVXnsJPKV4zmWi7zZgMlgfGxxzKNhwYnmQ+ZUwTBiiYAjcgsI+Qd3tUHAVyAaPPJgzz5sl4XCMVKW5fOucT7nkrYPXGE/iqjufymM9fvBCNbOEH3ln2li9Ra6rPzW9RM2tWDd180mRJfCIFnG9Jjg8LQ1ga96HYkZ4MpsxWyr/zi0srMQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QWVYVGZ2cnBVRnlRcVdWcEFuK05oQTl2dXV1TkZ0OFZLRVRUTnhkTm1DVzhY?=
 =?utf-8?B?RGhSZkM2RFZmWkVYNVF3RHMwV3JyMnI1OFNFcVM2MjQ4KzM2V0ZiaE5zZTZX?=
 =?utf-8?B?MjRzQzdLSlV1MjhlQ29pbk9TMG8rY2FnOWRidHBjWEhmbWwzS2VOS3BuU21i?=
 =?utf-8?B?NHRUQzRuUHU5TEUybnUvUVFkYTZ6M2Y4NHZPdWd6TnhVZlFJb2lVckYvTExl?=
 =?utf-8?B?eHJhSE0yZkFpZFExYUJuVTROMTkvUkZZMWFqUko3QllsamFDdVdEU3drbm9N?=
 =?utf-8?B?azlzRUF1djJQUTNqQ2ZTK2pBVlRjU0pnUlVJOWlCOS9ubWZKektkWFRmUzAv?=
 =?utf-8?B?c0FZTkJ1RlZxZjBoTFV5dlRRTUxwZnFnQ0UzYTA5VGhwOFlCb1hFT01ISkYw?=
 =?utf-8?B?TWphM1ZpaElvYitXKzBIalVsQmF6eUIwRWFpc1VsWUsrRGZKNm03Q3RrcE9X?=
 =?utf-8?B?QUVaMlZLNFdkaWFzM2Rvb3V4VGZJeTRyQUp1TUpkWE1FcHV6aXhuK0JyWHdz?=
 =?utf-8?B?ZTJXVXpraWdNVkZZTlo0QWNOUkp2TUdUNnQ0bjFuZVlLeHlMWFJiTFBaMVpp?=
 =?utf-8?B?Tld1am1wN0N6SjVJdTRoaXRtUFVZUkhCNGpRenR1bUtXRUNabE5ITmNEQlA0?=
 =?utf-8?B?QWUybnBpN1pJaTltcVhOY2k1S2lPcktKUGdBZnRBSmROYzFiTlBra1dxMW9U?=
 =?utf-8?B?MEdLenh0OXJpaU5Sc0lFRjdxN3IydjNjMTRYUzd4L1c3cDRWQzFNL0RGNnVS?=
 =?utf-8?B?VVVsTE1uTFZLdnh6eFpjNk03VDBPTzlHMU9PRDAwNmQ1Uy9tVEk1Y1hwYVlQ?=
 =?utf-8?B?cjBpcjl6QTlQbWVhcVVBU01LK1R2KzA0QXFNeFhseGQ4dGQzd3luaXFQN2d1?=
 =?utf-8?B?anIrbzNRK0dGS3FhZXdLZHlOWmp0Q0hyWUZYYmZQU0FEeFcrMFEyMnY1RjhK?=
 =?utf-8?B?VGNmT1RFc3Q0UllmTFJKdjV0R2p2QTJ5VmNrM0VyMlpTQ0FyYU5DZzBYbkF3?=
 =?utf-8?B?TWwweTF6OWk5dnZFeFpJVFVMb25kMm03dHZzTno2U0ZyY1lSYkEwNy9TTnpu?=
 =?utf-8?B?ZGhxVnNNYWdlakNWMWxMZUYwamtWNmJxZ0syd2xkZlR5U2E4THdIV29DUFY4?=
 =?utf-8?B?RGhjaTB5cWhyL3Uyc2FkMkNZbkdYaE5qcG91Mnd6SjdpTWJWL21WdVhlYUJG?=
 =?utf-8?B?YlNURStTS3k0alQ1azhjR3lxbTdoeXE0elE4Y2FGQkdvbGphYUIxSnN1V3lF?=
 =?utf-8?B?UlVrYm1XTVJXNkFJZGt5NXhpc1g3YUgyUkJ3QnRNNkNZNkVuMTBXbWpYTlRJ?=
 =?utf-8?B?TXpnRXpoL2J1ZnhRSXIvVE5VMmdGMWhiSWgwTllidllHV0U0WFZJNVZyVm94?=
 =?utf-8?B?V3hsRStGY25wbFpnd2U5MkpKV2lkRURLcDh1WlZkay8rM3dOT0lwS1BxREhj?=
 =?utf-8?B?VGdYaVliZlpDbHd0clBSQkhJMFRJL3VaYWhjQ1NScFhYSm43eEJEcXZzQlNy?=
 =?utf-8?B?MDV4cUdBUVpMWmVSdEQydDNaWkM2ZVRBWmJxQVhidkZidnAweUs3OHoyY1Zm?=
 =?utf-8?B?MGN1WU9PRmY5enREOXlNQW9kOFpjQVZJK2NxNWVCRDJWTEZRV3Fyc0JMd3g2?=
 =?utf-8?B?UGVxMEZ3emVFMzErb24xcG5QTzVkQkNuQkZwYlVRVkFiSXF5MUsvQzBIcWxt?=
 =?utf-8?B?VXNKcWFhbTJCd3diZmhzTHFQbXlFQjRxY1RBOFpyVHQvVXUzUGR3NTJPSDh0?=
 =?utf-8?B?a3dOOFgzMVJCTTltUG1CeDVvNzVtckF0aEFJUkhnWml1Z2dGUUNwMUt3Yk5S?=
 =?utf-8?B?MTdVU05yeGxxaFJ3Y1VMY29IbDNXVjlTbnUwS3BWdkJkaWh4Z0RrMkFxU1RS?=
 =?utf-8?B?QUp3OE9iMnMvWjh4M05DL1YwNVFGbHR6c05sWkVKTUNKMDlwZ1EzOTcvVXZP?=
 =?utf-8?B?TkdvZVpBM3g4TFNLUkcwMVh6VEtpQThpNkxyUFRjOUp6dXQzZHRjbHNqNDNH?=
 =?utf-8?B?TDczdk5yeDJUdG9DcEVLUVgvdEg0R1ZrVVFNTU04aGZrZnQxcFRIV2Fiazk1?=
 =?utf-8?B?cG1QeVpQT3ZJd3RFQWc4R2RXUTlRUjNnUVV0U1VoMGs4dVBwOGN5V2M0MEZR?=
 =?utf-8?B?d29GZmlEeFNlUTVtdk1TZXFXL3ZNdXZXYmNkZGVZZmQ4bUpRZ21wTExSVTYy?=
 =?utf-8?B?UWduNVAvQVg2YytpTmt6YkxWQ0hCRGxHeGFINWlOclMzdklJeTVmSjBKZ3VP?=
 =?utf-8?B?Y3FnMXNCY0liZ2RLcjJSaTVJTHRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58847B55B5EA8A4EB1178A1BF570C77C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 816aea3f-bcbd-488c-15df-08dc44baa624
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:39:22.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiROk5MBF5R7iaeWtGJ4s/siYlgq5wwQhYQeMtPqCJtR1MoR0uRJ7lw4C/HWAORJBVzg+nGd46HEnf9J5k/6GGVwfgxpe6OTcte9yQ2DO9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2735
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

DQoNCkxlIDE1LzAzLzIwMjQgw6AgMDM6NTcsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QXMgd2UgYXJlIHBhdGNoaW5nIGluc3RydWN0aW9ucywgd2UgY2FuIGFzc3VtZSB0aGUgbGVuZ3Ro
IGlzIGEgbXVsdGlwbGUNCj4gb2YgNCBhbmQgdGhlIGRlc3RpbmF0aW9uIGFkZHJlc3MgaXMgYWxp
Z25lZC4NCj4gDQo+IEF0b21pY2l0eSBvZiBwYXRjaGluZyBhIHByZWZpeGVkIGluc3RydWN0aW9u
IGlzIG5vdCBhIGNvbmNlcm4sIGFzIHRoZQ0KPiBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBkb2Vz
bid0IHByb3ZpZGUgaXQgYW55d2F5Lg0KDQpUaGlzIHBhdGNoIGxvb2tzIHVubmVjZXNzYXJ5Lg0K
DQpjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KCkgaXMgd2hhdCB5b3Ugd2FudCB0byB1c2UgaW5zdGVh
ZC4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJt
LmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgfCA4ICsr
KystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyBi
L2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IGluZGV4IGM2NjMzNzU5YjUwOS4u
ZWQ0NTBhMzI5MThjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hp
bmcuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBAQCAtMzk0
LDEwICszOTQsMTAgQEAgc3RhdGljIGludCBwYXRjaF9tZW1zZXQzMih1MzIgKmFkZHIsIHUzMiB2
YWwsIHNpemVfdCBjb3VudCkNCj4gICAJcmV0dXJuIC1FUEVSTTsNCj4gICB9DQo+ICAgDQo+IC1z
dGF0aWMgaW50IHBhdGNoX21lbWNweSh2b2lkICpkc3QsIHZvaWQgKnNyYywgc2l6ZV90IGxlbikN
Cj4gK3N0YXRpYyBpbnQgcGF0Y2hfbWVtY3B5MzIodTMyICpkc3QsIHUzMiAqc3JjLCBzaXplX3Qg
Y291bnQpDQo+ICAgew0KPiAtCWZvciAodm9pZCAqZW5kID0gc3JjICsgbGVuOyBzcmMgPCBlbmQ7
IGRzdCsrLCBzcmMrKykNCj4gLQkJX19wdXRfa2VybmVsX25vZmF1bHQoZHN0LCBzcmMsIHU4LCBm
YWlsZWQpOw0KPiArCWZvciAodTMyICplbmQgPSBzcmMgKyBjb3VudDsgc3JjIDwgZW5kOyBkc3Qr
Kywgc3JjKyspDQo+ICsJCV9fcHV0X2tlcm5lbF9ub2ZhdWx0KGRzdCwgc3JjLCB1MzIsIGZhaWxl
ZCk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiBAQCAtNDI0LDcgKzQyNCw3IEBAIHN0
YXRpYyBpbnQgX19wYXRjaF9pbnN0cnVjdGlvbnModTMyICpwYXRjaF9hZGRyLCB1MzIgKmNvZGUs
IHNpemVfdCBsZW4sIGJvb2wgcmVwDQo+ICAgCQkJZXJyID0gcGF0Y2hfbWVtc2V0MzIocGF0Y2hf
YWRkciwgdmFsLCBsZW4gLyA0KTsNCj4gICAJCX0NCj4gICAJfSBlbHNlIHsNCj4gLQkJZXJyID0g
cGF0Y2hfbWVtY3B5KHBhdGNoX2FkZHIsIGNvZGUsIGxlbik7DQo+ICsJCWVyciA9IHBhdGNoX21l
bWNweTMyKHBhdGNoX2FkZHIsIGNvZGUsIGxlbiAvIDQpOw0KPiAgIAl9DQo+ICAgDQo+ICAgCXNt
cF93bWIoKTsJLyogc21wIHdyaXRlIGJhcnJpZXIgKi8NCg==
