Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21688DAD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 10:59:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DY9d4UKt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4MbQ2C9Pz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 20:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DY9d4UKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4MZb4FLVz3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 20:59:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsVa0xaIm4YH8YcamZ2aTragRjhgLSPsSNvDjRhoc1LJ8z+rc4A8SUGsd+ux2IEVyDY9gSo9LwUWTMmxtWNQIKpHcqwpGh9p5dgASpNMW6F6LeAkikQsxCv5i64TqbNBd+wPOAXY+Ax7ucrgnJFEqhlAgSF9KzCJudBNJoXirXJNgDzZw70qvCml+dDqJ5sUyWfeobzvGBoj2q/6+CKbyhSyzns0Oat55/FC7RhOymLw7mczIUbgPCVcN2rSkwwdjgQacufXC4IhQtGGzZlWhCtg0xzbQzgBOK8ki3K+ZAyIZRbPl3o0epzeVmXDPaxKkLWX10CsNx6zmW22WDP+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxTMSgkVaXdxsp9Ag3vkw/HVCcVOb7/Qwyhhk+5Pk2M=;
 b=MMd9qKOCjiT+MZ7S0ao0bPwYOoQhU43vT+cnobRw8t6pFwgPJCyxrwmY2ZiS18G95TAGUCZXwTkgpU7mENCjfXOdlVaRWqaPeFXYhTyvrdL8gEjKvCGNJuGvrTCxNHtp2Q1I0xNESFrWBjFJxsjBlwmXUOjbBxCfeS4mgA+8NhEy7it8LRpAnS6r9kuiTVrLWqYThAwyEH3Dgd2ZN8AV32ayakqhW9SP5JtFq3w74Akba3BDZcnmYT9gjQQywMR43f9P1JinQHsumI8tNeQrqt8UO76GwEGJPftjs3P6U0ExNMB9fUHvVNSjplAl+zSg3rmraFYXjQP79QDkGUWu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxTMSgkVaXdxsp9Ag3vkw/HVCcVOb7/Qwyhhk+5Pk2M=;
 b=DY9d4UKtEmQOdHorr0do7ki1FXHpYTRtzQcQoXSM2EN22JtR5Ta4Lv/5qC/6wVXiNb37WU4sNfw/Ir1vmPdmE4JxOira7dvZluycBw4vHYbsj9TmAoPqBAccUMqnAKO8hGv9yHEEpMFHeFCRpeAGBwPRfHog28iFNZZwKDpz6Ztlv4j67UQG6a3CHp+Z5Ev62B0G6456HYIanaF0bmD+c7Gxlhahf/Ax+MCnPMMek1MS1Cz0V7aWJmcQhcQivpNUCwharGCfpoWdt+PocfnE5x7Dr2YT8hbfzpArvHDGCrpW9cloidWGUZD/87wdX1svsujb5jRLVhqEoTLZ9QCeIA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PATP264MB4606.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:427::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 09:58:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 09:58:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Topic: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Index: AQHafsSUDf1gEqeQdEWjl7G6IxKzM7FIoteAgAAuSYCAAU5AAIABPcCA
Date: Wed, 27 Mar 2024 09:58:35 +0000
Message-ID: <9703878c-c0b0-48ff-a356-d43e8f7391f3@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325161919.GD6245@nvidia.com>
 <6e16e042-0143-4a52-b4b7-09cf0022bc3e@csgroup.eu>
 <20240326150118.GI6245@nvidia.com>
In-Reply-To: <20240326150118.GI6245@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PATP264MB4606:EE_
x-ms-office365-filtering-correlation-id: 692de8b9-9b37-4e47-693b-08dc4e4477ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rZVJUFAvi9LPZa6SnjmxuZAkotil6toQ9kxLaIG5SaovmDL9SxooOtzknYv5rh0BEaw0TBPvvR+xgmEEQlKUkJpqx+8TiXB4BwutdqYR4uxxMLOoFBna5DTcoqKDkuJxNC6Ny7aLJ1EusO44Y87myji8VygKe2iqFTn8WxTkPHfX6AVLd22CZ+J9lfjq43uXC2/doIsrnV/DSDqDa0Rgw6xixz01xPBBT9bOAlAMnJffAbnLAI3vFdNSwdBI6kqxfE1vzeB0QZHatoB016Ehmi3di6loOxT59AHwAL3IYZHHvBH2DBbj5eYjU2iQ9dLmEH0SzV0o+AoawY7CTBNgTtB2CG7eJ9vlbc4CIWC9mBerHl0QJMPTrpGgBjoNLToFtwJK5kbvJV8qo0QfrqCH8rKB6+XOIk9TtcMdfxEBF6vUgzaVl2aT5mouZl94YuJrhv03GTXuINvLoJBMHy5x+XxPyw4PwKAbGnlt3dUbSyropFifxm30E/tOULjcdGM8UVLtSX2v6E8T04RcK0+1mcKIPcOcoMjgkyDgGISgqeuZYpN7ZAoBIg0wAXn9npqTTvg8Vek9QkpgSavyEMwmfKaYVSHVcHsTpGH712+qrWbymiow+qSONjSCEybrh7OnHafEIuc2CBQDoobpdZ7qM4TDqoH30D6mje5o6HOFfrxf2y5j5fGuliWA9bfDlJeOyk4NmaLqy+/8B9qNWD3KUNjhqmaqmhWx30yUq+FOSkE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akZTY1ZFQ2gyQWc3Q29ISnM1eFBrYm1DcG9SeURiMjBlRzVCaVhsb0xIeWl1?=
 =?utf-8?B?VU5lRVd2WE55MTUwYVRHaDFqeE0wQTBnMUk4cml1d1Z3YysvakUyR0xDSTJQ?=
 =?utf-8?B?b3lCM1o0eFY5Q3VYdEYxTGFmbEV6RkdrVXp0RktOTkc2eUJXd3dTYnJBdy9V?=
 =?utf-8?B?dFNRYlpoMDBmTm5PczJVQ3RFbUhiVTRUT0d1WC9KVm5naDMwMnB6ckpOTzNy?=
 =?utf-8?B?ajYxcGJSb0FCN2JENXIzWkZ1L2pXWnlVaWZCV1ZXYW11UC92ZEZOUWFmVWd5?=
 =?utf-8?B?V2lnbm12OXdIeUs0SmI0OHN5SU9QK3c5V3J3WnE0eWJmWjkzZUg4YUhQOC9m?=
 =?utf-8?B?SDI1UGhId0VSSXdqWkF5aWdzd1Mwc2VZazBxUkJsZUNYNU5rSStxQ0I1cnpv?=
 =?utf-8?B?RUI5QU15OGl3NVAvZ0lyVWxzRnlSeWdGa3Q2Tzl0alRJSFQ0TGx2QXg3NXAy?=
 =?utf-8?B?bTg2dlBCVW1yK1FtQTgyOEs5bms0MEd3anZPOC8zaEFhdGVHNTVuRDIxZDY2?=
 =?utf-8?B?c3Y2eVRCNDR0T0lYZVYramhUQThmRTkvNDlRZkdWc0Z2T256ZGhQcjJ5dy9s?=
 =?utf-8?B?WWhhUmhTdnA5S1FMWkV4YkEvZVdZMDcySDg5blViY1BXY3NQZjdCUjBDMDI4?=
 =?utf-8?B?NnVCdXBUbjUvWFNWWVd5c0dnRGJMMXNqTTB3MzZqQjR5bkF6QUJSc2VOZ1NX?=
 =?utf-8?B?ZVRtQmM3UGk5RVhQMjN4RE9qdGEvdjZ1U1BSUmF6bmdwUGZSQ1dDMUpHaWNE?=
 =?utf-8?B?RnV0bVlFcUM4NkJoNDJkaWcwZTdDbWxRTzUzRjBUazdqeGMxQ1drZC94THpr?=
 =?utf-8?B?VUxEZ1g1ZUlqb2w3ZWlVdW4xVFBTeTEyL0pBU05kNjRUdUlXMlFpMVp4R3FK?=
 =?utf-8?B?TkhLU0hyRHdDYU5Ua2tsVW1LSFpvcFNMWE03WTJxazAwWmJQTjFvNXYrQmpK?=
 =?utf-8?B?TDVwdE1pNXBlTG9xZEc3b1c0U0RCb1dTa3RPZERNb2llbTFBdmpDMWpuUHRa?=
 =?utf-8?B?RVFqanErZ0JiWDNHSittSkZSRitpL1NiaE5aYnlNc1dNMUNVRXZzTnY4a01E?=
 =?utf-8?B?YkpXYi83QXVxOHdKbkRkM3RncHpwbHUxSjgyakVGLzY2ZXU3dzFvZHZRM0xa?=
 =?utf-8?B?WjJqVm9XRmNlQzRuSHEvMTlkOUlGZmZZV0FydkRXanc2aTdyQTVSdTNrYTJ3?=
 =?utf-8?B?M3hLanlGUmU1QU1ua29OTjNoM05DL0dYZkZNSkhRVUxVRE9sRnlaMm1oNU56?=
 =?utf-8?B?c2g0WW53eCsyUG1KcmxkVno5TG83eFFmQ1UvZ2o3eUw2cXJxa0VCWE5EamNl?=
 =?utf-8?B?RXpLbmJZVVA1RGRKcFc0ZFRDRGdVMVdZdXU0MkkxdklIWWVIaGNiSFE5Yk13?=
 =?utf-8?B?Vm8wSlRESzVBY0lZUzZOQ2Q2UVE4MWc3a3BuWkZNSXl1ajNzYkNnZ0pONnN4?=
 =?utf-8?B?Z1RYQ1NtR3NwNVByUG9sQWF6d0w2THRYb1pvcFdtSXNRUXE1eFc0bG5zVWQ4?=
 =?utf-8?B?ZHJpaW9SVUltUWN2b2pIWXE3Yk4yVWYxbUhPdkhiNjVDbHpUa0Q5RGNMcWow?=
 =?utf-8?B?Z0dGVnVPUWNUaTJGS0Y4a01aZW5uZkhlTTVYSGI3QTk1U3ZPY1hoa3lRK3F1?=
 =?utf-8?B?eXpNQ0VmVEcvanpJTVZpRGd4ZWJTZ1ErZC9uWWR2ZWhhQ1NmeWYxc2d0WnJZ?=
 =?utf-8?B?Z294NVEwcWU4RkRMNFJHa1NjQkFTSzBqSWkwTWRJNmZ5aW9WQmc5TnNybVM4?=
 =?utf-8?B?Q3hyaGpwWUpCeER3QlZ1MzZkRDNxejZ3NU1OcUsxNW1uTko4UXVVbVNKOEtt?=
 =?utf-8?B?QkdVV0swTldjVVZUYm1yNm5RUUV0YVJwMGtJWitRY1BnSDk4QS9tbFRMR05L?=
 =?utf-8?B?ZXNOdGI2bVhmWjFNTnNGWXZQU2orSERmZzFhdmpqZGFMQ0lPUE9CRnVWSkN0?=
 =?utf-8?B?eVpzNDI2SEsrZjVzNjNYcytTZncwT3VsVEJvMWZ0STdmL3ZMZnpRMzNISXcw?=
 =?utf-8?B?akVwQVFQdWRFTURpSWZraFhQVytwMFA2QUJIektlYWNiamQ5aWpzdjN5Y25E?=
 =?utf-8?B?QkNOUXloQXRvNndFemwwdHpwbGFsRjc3LzRjZVVkdWQvV1I4UXg5RlhkeFAr?=
 =?utf-8?Q?OojVUF6x+tiZfeytmLAyH+iw1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17D3AAA36958D846B54654C1A14B89A6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 692de8b9-9b37-4e47-693b-08dc4e4477ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 09:58:35.6256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRzjzAw8uhd7/vSXlYrj85+WkzBXL9JSIS/Vdr19nd61mhcD91bXVn2kiKHrL0OtR+Dn4V/nsxSJx1ZeHdJltUBV5ozX72JaEHzCKPVJvwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4606
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzAzLzIwMjQgw6AgMTY6MDEsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwNzowNTowMVBNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPiANCj4+IE5vdCBsb29rZWQgaW50byBkZXRhaWxzIHlldCwgYnV0IEkgZ3Vl
c3Mgc28uDQo+Pg0KPj4gQnkgdGhlIHdheSB0aGVyZSBpcyBhIHdpa2kgZGVkaWNhdGVkIHRvIGh1
Z2UgcGFnZXMgb24gcG93ZXJwYywgeW91IGNhbg0KPj4gaGF2ZSBhIGxvb2sgYXQgaXQgaGVyZSA6
DQo+PiBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvd2lraS93aWtpL0h1Z2UtcGFnZXMgLCBt
YXliZSB5b3UnbGwgZmluZA0KPj4gZ29vZCBpZGVhcyB0aGVyZSB0byBoZWxwIG1lLg0KPiANCj4g
VGhlcmUgc3VyZSBhcmUgYWxvdCBvZiBwYWdlIHRhYmxlcyB0eXBlcyBoZXJlDQo+IA0KPiBJJ20g
YSBiaXQgd29uZGVyaW5nIGFib3V0IHRlcm1pbm9sb2d5LCBlZyBvbiB0aGUgZmlyc3QgZGlhZ3Jh
bSAiaHVnZQ0KPiBwdGUgZW50cnkiIG1lYW5zIGEgUFVEIGVudHJ5IHRoYXQgaXMgYSBsZWFmPyBX
aGljaCBvbmVzIGFyZSBjb250aWd1b3VzDQo+IHJlcGxpY2F0aW9ucz8NCg0KWWVzLCBvbiB0aGUg
Zmlyc3QgZGlhZ3JhbSwgYSBodWdlIHB0ZSBlbnRyeSBjb3ZlcmluZyB0aGUgc2FtZSBzaXplIGFz
IA0KcHVkIGVudHJ5IG1lYW5zIGEgbGVhZiBQVUQgZW50cnkuDQoNCkNvbnRpZ3VvdXMgcmVwbGlj
YXRpb25zIGFyZSBvbmx5IG9uIDh4eCBmb3IgdGhlIHRpbWUgYmVpbmcgYW5kIGFyZSANCmRpc3Bs
YXllZCBhcyAiY29uc2VjdXRpdmUgZW50cmllcyIuDQoNCj4gDQo+IEp1c3QgZ2VuZXJhbCByZW1h
cmtzIG9uIHRoZSBvbmVzIHdpdGggaHVnZSBwYWdlczoNCj4gDQo+ICAgaGFzaCA2NGsgYW5kIGh1
Z2VwYWdlIDE2TS8xNkcNCj4gICByYWRpeCA2NGsvcmFkaXggaHVnZXBhZ2UgMk0vMUcNCj4gICBy
YWRpeCA0ay9yYWRpeCBodWdlcGFnZSAyTS8xRw0KPiAgIG5vaGFzaCAzMg0KPiAgICAtIEkgdGhp
bmsgdGhpcyBpcyBqdXN0IGEgbm9ybWFsIHg4NiBsaWtlIHNjaGVtZT8gUE1EL1BVRCBjYW4gYmUg
YQ0KPiAgICAgIGxlYWYgd2l0aCB0aGUgc2FtZSBzaXplIGFzIGEgbmV4dCBsZXZlbCB0YWJsZS4N
Cj4gDQo+ICAgICAgRG8gYW55IG9mIHRoZXNlIGNhc2VzIG5lZWQgdG8ga25vdyB0aGUgaGlnaGVy
IGxldmVsIHRvIHBhcnNlIHRoZQ0KPiAgICAgIGxvd2VyPyBlZyBpcyB0aGVyZSBhIDJNIGJpdCBp
biB0aGUgUFVEIGluZGljYXRpbmcgdGhhdCB0aGUgUE1EDQo+ICAgICAgaXMgYSB0YWJsZSBvZiAy
TSBsZWFmcyBvciBkb2VzIGVhY2ggUE1EIGVudHJ5IGhhdmUgYSBiaXQNCj4gICAgICBpbmRpY2F0
aW5nIGl0IGlzIGEgbGVhZj8NCg0KRm9yIGhhc2ggYW5kIHJhZGl4IHRoZXJlIGlzIGEgYml0IHRo
YXQgdGVsbHMgaXQgaXMgbGVhZiAoX1BBR0VfUFRFKQ0KDQpGb3Igbm9oYXNoMzIvZTUwMCBJIHRo
aW5rIHRoZSBkcmF3aW5nIGlzIG5vdCBmdWxsIHJpZ2h0LCB0aGVyZSBpcyBhIGh1Z2UgDQpwYWdl
IGRpcmVjdG9yeSAoaHVnZXBkKSB3aXRoIGEgc2luZ2xlIGVudHJ5LiBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSANCnBvc3NpYmxlIHRvIGNoYW5nZSBpdCB0byBhIGxlYWYgZW50cnksIGl0IHNlZW1zIHdl
IGhhdmUgYml0IF9QQUdFX1NXMSANCmF2YWlsYWJsZSBpbiB0aGUgUFRFLg0KDQo+IA0KPiAgIGhh
c2ggNGsgYW5kIGh1Z2VwYWdlIDE2TS8xNkcNCj4gICBub2hhc2ggNjQNCj4gICAgLSBIb3cgZG9l
cyB0aGlzIHdvcms/IEkgZ3Vlc3Mgc2luY2UgOHh4IGV4cGxpY2l0bHkgY2FsbHMgb3V0DQo+ICAg
ICAgY29uc2VjdXRpdmUgdGhpcyBpcyBhY3R1YWxseSB0aGUgcGdkIGNhbiBwb2ludCB0byA1MTIg
MjU2TQ0KPiAgICAgIGVudHJpZXMgb3IgOCAxNkcgZW50cmllcz8gSWUgdGhlIHRhYmxlIHNpemUg
YXQgZWFjaCBsZXZlbCBpcw0KPiAgICAgIHZhcmFibGU/IE9yIGlzIGl0IHRoZSBzYW1lIGFuZCB0
aGUgdGFibGUgc2l6ZSBpcyBzdGlsbCA1MTIgYW5kDQo+ICAgICAgZWFjaCAxNkcgZW50cnkgaXMg
cmVwbGljYXRlZCA2NCB0aW1lcz8NCg0KRm9yIHRob3NlIGl0IGlzIHVzaW5nIHRoZSBodWdlIHBh
Z2UgZGlyZWN0b3J5IChodWdlcGQpIHdoaWNoIGNhbiBiZSANCmhvb2tlZCBhdCBhbnkgbGV2ZWwg
YW5kIGlzIGEgZGlyZWN0b3J5IG9mIGh1Z2UgcGFnZXMgb24gaXRzIG93bi4gVGhlcmUgDQppcyBu
byBjb25zZWN1dGl2ZSBlbnRyaWVzIGludm9sdmVkIGhlcmUgSSB0aGluaywgYWxsdGhvdWdoIEkn
bSBub3QgDQpjb21wbGV0ZWx5IHN1cmUuDQoNCkZvciBoYXNoNGsgSSdtIG5vdCBzdXJlIGhvdyBp
dCB3b3JrcywgdGhpcyB3YXMgY2hhbmdlZCBieSBjb21taXQgDQplMmIzZDIwMmQxZGIgKCJwb3dl
cnBjOiBTd2l0Y2ggMTZHQiBhbmQgMTZNQiBleHBsaWNpdCBodWdlcGFnZXMgdG8gYSANCmRpZmZl
cmVudCBwYWdlIHRhYmxlIGZvcm1hdCIpDQoNCkZvciB0aGUgbm9oYXNoLzY0LCBhIFBHRCBlbnRy
eSBwb2ludHMgZWl0aGVyIHRvIGEgcmVndWxhciBQVUQgZGlyZWN0b3J5IA0Kb3IgdG8gYSBIVUdF
UEQgZGlyZWN0b3J5LiBUaGUgc2l6ZSBvZiB0aGUgSFVHRVBEIGRpcmVjdG9yeSBpcyBlbmNvZGVk
IGluIA0KdGhlIDYgbG93ZXIgYml0cyBvZiB0aGUgUEdEIGVudHJ5Lg0KDQo+IA0KPiAgICAgIERv
IHRoZSBvZmZzZXQgYWNjZXNzb3JzIGFscmVhZHkgYWJzdHJhY3QgdGhpcyBlbm91Z2g/DQo+IA0K
PiAgIDh4eCA0Sw0KPiAgIDh4eCAxNksNCj4gICAgIC0gQXMgdGhpcyBzZXJpZXMgZG9lcz8NCg0K
VGhpcyBpcyBob3cgaXQgaXMgcHJpb3IgdG8gdGhlIHNlcmllcywgaWUgMTZrIGFuZCA1MTJrIHBh
Z2VzIGFyZSANCmltcGxlbWVudGVkIGFzIGNvbnRpZ3VvdXMgUFRFcyBpbiBhIHN0YW5kYXJkIHBh
Z2UgdGFibGUgd2hpbGUgOE0gcGFnZXMgDQphcmUgaW1wbGVtZW50ZWQgd2l0aCBodWdlcGQgYW5k
IGEgc2luZ2xlIGVudHJ5IGluIGl0ICh3aXRoIHR3byBQR0QgDQplbnRyaWVzIHBvaW50aW5nIHRv
IHRoZSBzYW1lIGh1Z2UgcGFnZSBkaXJlY3RvcnkuDQoNCkNocmlzdG9waGUNCg==
