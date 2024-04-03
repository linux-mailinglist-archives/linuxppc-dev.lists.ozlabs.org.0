Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8889684C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:20:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NHBEcshl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8d3F0Qvqz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 19:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NHBEcshl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8d2S0j2Tz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:19:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBix/+uY67vjqocnFyVYcqskVWpf/uemtxZBTZLUqPgBFh7ozwYaeRCOiprfeb4w7j09gf+dnmyxRv8S+JBmybF9Vp86D+b6cb5WvUzlj2roZaSe9GiaaZafC6j2PysLmo7xFyu7pCdoie1gxsCC12kf8LQ35KMfZMt4oDXAiPB6RkL93bA3Nz+klanMfx+aVClCrvwfKFIiToqNL0FaS8FrThtR75G3UwSdW9NFsy58JIzpFTg/59mKH3KmOU4O8Vej61JCL9Zdf3T+Gid7mZpovMf1zW+U7LTlns4rrwTv1RH1M0E2JEIDd9QTfZ5X0dFn5oX8CpRMFxm/UpSoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URxAnykGhj2VVDHcqCaFjTwk0ztCIOZSGtVBTeBzuOw=;
 b=kaHPaj8WC9qXkIb129QF15xgpu3dkYawNO4FhaidV6YeXur6FI0jkwvSRJET+Mulo5POq09JKy2QxQNmOalSKmEDtujjV8pF+JLQYbVTV7Kkr3mU7SSklpHBB4m8mAz4gIBej0jp9qTbgMgo/nEV34IDnw3EldQX1czhmV1pi0NsC5ugvZTicdJ/yFD9eLFoXliPqADKGjGcgRh/nQcepfMu74bh1lX6SIBcRy1Yr6SxetVe2Ndpm/GPiuy/MDSAZk/2S0qqrfmEFCwCzFJkKC2b2lsybm4UaSM4efGJOefuUnkEUV7DYaE/Smfk1x2ECFdi8MTFN97hdMGPJOfjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URxAnykGhj2VVDHcqCaFjTwk0ztCIOZSGtVBTeBzuOw=;
 b=NHBEcshlQpeCL12wDShglg0ZmdAk5MxETTvTtvZ4E3B9XZT1M45HcRfjEYtNbRvhNWGtRSkluYHbowxhNKDXqS7IpdfPUVLoHWlLWQKHoz90HQcVvaXfJ/THWSOzb6KFtnm5xDpGI+4vfcoL7CoiGMCRm54AKbNsFXOCWDbYKXeEDlZKUR3XCkzZPRFJN111ZKdbqXX9XMbgHeBuTZddQ+1n+tfDAYm67W63CN63UhbHxPXLb/saQcVKAhEDhtwI3QYl3SMMfIVLERtFpy+sGLtfK8Fr3vJwsDFy+aMGrEVdHWpsngX0Q/dMIrOcsygBgtj9INk92UmFNcUEcE/LIQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:19:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 08:19:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Alexander Graf <agraf@suse.de>, Stuart Yoder <stuart.yoder@freescale.com>,
	Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 01/34] powerpc/fsl-soc: hide unused const variable
Thread-Topic: [PATCH 01/34] powerpc/fsl-soc: hide unused const variable
Thread-Index: AQHahZ4EgGsJj5wL8E6YA60gu3PSTLFWM+oA
Date: Wed, 3 Apr 2024 08:19:00 +0000
Message-ID: <0e42ea85-e239-4072-8593-2205c7f14ed3@csgroup.eu>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-2-arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-2-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3180:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  074r7CNOQcvyy6TY0rSJPv72vjJOoIwkFDk6sBVmNMmcLO7ByTjLE8cQZ67SjRYwgn88OG5PYCHeVqafe+zJFcHRWFA0Fyg/L5xCmUD6XUwByKiW3JsMXVMDhM7wFjSUDYG2947fN87e4xInKqcTQ/rxb4zq++5DJM3gwFYwhOxF5VhJBAojB6Sh/DTQTuVy4ui4xkyQNiFDHmnuALpI8ke8ehMC6EYsT9nBiP7XT3me2iptdWA01lQMb9gVww4a7GDC2KnKxQT3kh39cMM8xV38stb7FStSCWk28s1UsjmQHU16yq0D9CX5PYBNaCTb9kvEQhV2oCfolcmQixH75XYks6kaukb376ZHjvGwzFF35+qIIdQAre83Ki+rPm6EAMKF2Qk9+oy6KWmz/Ej0XrggSV7CMxhDEFdvbc3mTkV+aJHAV7bBmL1dqmp37RSnaq0GHxtT8PhYaci4kFrbSc0x2cLExLyDj5qIs/ZZ96y+BjJ1NQ+7qgYSb//Rn+o+AH/bXgr7TgoDIDC1AcHPXqhCH1Ng0K6wiutzD4wqP8P3QU5gTjc7oDWxF3VGhjvYdMD4h2CpWxDFhGyMwNhoEFZ5usWsHB/6IPx10P4duw4uvESi8HEZpt7HUg6PASrQd4vhtSjF69hVf7N0MDkXI2Fpb9APWi+7rkdY/1LOPH8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M2hURlZCT3ZYTlNFZWFGWjBtSHFHd3VKc2dZRVVuWUNUQ0VDcHZxaWpQUEdv?=
 =?utf-8?B?dFNiTDljVmQ0Q1JBL3o0Q0xIZ0kyczFPUU11YmtPSk50d3F6SzNnbEVnY0JN?=
 =?utf-8?B?SFNMQUdTN3FjTGsraC9xUXArdVdSeTlFUWp2SGQxYWtnNlhVa0Vva1BZV3pY?=
 =?utf-8?B?SDBPMTlnQVozMnZOU3R4eW5IMHp5L252Y0daTDQ4T2s4YnphS05aT0IwR242?=
 =?utf-8?B?Uk4zUEtlUjlmRDRXcGFQU2NzblY2YUZxalZMdWxoaDdaRk80K0pyaHBzRHYr?=
 =?utf-8?B?VUxCZ1ZFVFNJdnhUdkFtSXJsUVdKUWhnVSt4ZTJUSEpVcEU2blFtTDZTclYr?=
 =?utf-8?B?RE1vMEdjWHE1UzZWMUozZzJoV2xPK3B2OGg2WW01ODltcHFNVXJVVWtXMlMy?=
 =?utf-8?B?RmJxcVlrOXNvU3RFdVQ3M2JGMmV1RyszY3NzU0JESGNMZVNvSjFxT2xhSTM4?=
 =?utf-8?B?ejRXRDhIalI4SG9rK1U1NVg3eElsK3E1SC9sUUNaczhmU0RVYURVTnAzTE9S?=
 =?utf-8?B?dFpDUjZwUC9wYU4yYkpnTi9ZYlF5WHI3OUxTUGNDSkZFZHAxdHBVT0RyRkRF?=
 =?utf-8?B?cm80OGZQbWNiUFlNRGJmcXlPRUJaNVpmWDA3Yy9xdHVMSWdoV1lSTWhhV0VE?=
 =?utf-8?B?aGtTRjVUSU9NeElNWEt3Z0l5aHN3MVdHMEpZeXYxcEhLRE5WUkxQRGw2TitF?=
 =?utf-8?B?K1VZbW53ckFncjdvWnp2eENzVkozVWY2L0pXa0M3UXIzSitSNVdNVU8ydDZ5?=
 =?utf-8?B?QmRSNUFMNmtxZ0YwMkE2RlNqOU5YTjFNbEZyTTJNcEIyc1g2QzFWY1pvS0Zu?=
 =?utf-8?B?NFFJRGMvbmNvRWU0RG1xdExYMFZBNXdoY3ZodEhiN016SC9aVUd3VUV4NVRj?=
 =?utf-8?B?bmUxaG11dDhNa1oyNk90cEhoeWU5d21JemFNRk83ZW0rWXJHOVpJMzI2ZkVB?=
 =?utf-8?B?RWhmSjNTVEtoMVBQRGNEYmpaNHMvZXRJdFdOK3YxeVlEbXRnclZTMDJmVVZr?=
 =?utf-8?B?bUw1RGNZSlZudkNxdkxCeGc5VFZpZllCaGlmMkp1Y1FuOC9odTBmRHdtWDIx?=
 =?utf-8?B?azFwUkZ4WXJHOVpDZ1ZLYnNjRUVJbWNpd1NEYXV0NDJsREloNXdXejJaYlZW?=
 =?utf-8?B?TW1lcW1lOHVxNmxFYUZ5VDVIM2ZVWEo5MEdsM0xRdmNCNjZyY3ZLeVR5Y0ZK?=
 =?utf-8?B?dVJUOVBMMnBSbi8relQyVkZQTm9JL05PWEhDWWFqcUZpWXdwY1pjd05tMTdJ?=
 =?utf-8?B?QzZPd2U5OEZhZlJUR2pWRm4zT1EwRUxwVXJhQUM0Y1FCdUdjcXVCOENXUUNn?=
 =?utf-8?B?amJyUm82R3pzVGRpK2FZNlczbVJjVVZPOUF5d21VOWdDVk8zejM0YXdVUEFK?=
 =?utf-8?B?NmxJaWhwTWh1aW5yRSt4czM4L01RR0ZXTXY3NDNLVzRnQXhsNVI0dTNLQU1w?=
 =?utf-8?B?bnFqbjdpbUxhMWhqbnk5ZXZZMERuRDJYNWplUXk0Skhneks2bXVkTnJIKzFo?=
 =?utf-8?B?OW13VGZpTHNmUjdaeDR6OUp2S1pXNDJLKzlIN210MU1LN0FGZUVXMjkycDVk?=
 =?utf-8?B?TXVNQ2FiWEhWZ3llcEpnSEx3ZXNuYUpxd0ljbnBNa253VmRjSk5tQUkwQzh5?=
 =?utf-8?B?Sk1ZYjQrUXhCaDE1Tk5JRytrR0ViOFYyOW9LMHMrT2YxVDlqUmJMOVZyQkRi?=
 =?utf-8?B?NG5vUGR2Mkl1b09Eb3NBYXVPKzhCY0lyMTcza0thMHl4YnFDNE4wWjgyM2NC?=
 =?utf-8?B?cEx4ckx6UnpseVV6ZHR3Y1Z4K2VYeHdhTE1YU25zWGh4U0hTMitDRnlsekll?=
 =?utf-8?B?b2hLQnNMeUhML0RJczdCQzJYcjZ2RW5FaUl1MXk3OGlGUTNoei9uejRYWkQ0?=
 =?utf-8?B?dkxEVGREekFUNFVqMFVUcnV1eUwzWHlPWUxTa0Z0TFVZWjg3ZVZxcjlEZENr?=
 =?utf-8?B?Z1c5enZRYUtkODJrTmI3TmQ3NHdoOGt5RTBIeU55QlNHSzFFejFUQ24ybzZu?=
 =?utf-8?B?WkNMYmNrUjFFSDRVbTk2d2FoKzcweFJFMWdRUUdoWkpQNktVQXhIUW9TMHNa?=
 =?utf-8?B?SHE4M1p5dU13cVBCd1JMTFpEdHlYT0dLUjNNVVhCUXNHMGZFcjRwZ0xldEFT?=
 =?utf-8?Q?x33uvfMoOgSZ4TelLeLDFwaBQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <735C1AA2ACA96A4C8DB0A869901FCE88@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9663f0a8-1a3d-436b-887c-08dc53b6b750
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 08:19:00.2845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfS/AEEI21jYzrJ+TEX13WOI/5sgZFlBKkCnw/9pQvJg56VQhKKqvnUGFdubgy5gCfSWGKwmrVQMMH4OODtfKngRJrpgjChKXu7j3MSJF3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3180
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA0LzIwMjQgw6AgMTA6MDYsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IHZtcGljX21zaV9mZWF0
dXJlIGlzIG9ubHkgdXNlZCBjb25kaXRpb25hbGx5LCB3aGljaCB0cmlnZ2VycyBhIHJhcmUNCj4g
LVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9IHdhcm5pbmcgd2l0aCBnY2M6DQo+IA0KPiBh
cmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9tc2kuYzo1Njc6Mzc6IGVycm9yOiAndm1waWNfbXNpX2Zl
YXR1cmUnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJs
ZT1dDQo+ICAgIDU2NyB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZnNsX21zaV9mZWF0dXJlIHZtcGlj
X21zaV9mZWF0dXJlID0NCj4gDQo+IEhpZGUgdGhpcyBvbmUgaW4gdGhlIHNhbWUgI2lmZGVmIGFz
IHRoZSByZWZlcmVuY2Ugc28gd2UgY2FuIHR1cm4gb24NCj4gdGhlIHdhcm5pbmcgYnkgZGVmYXVs
dC4NCj4gDQo+IEZpeGVzOiAzMDViY2YyNjEyOGUgKCJwb3dlcnBjL2ZzbC1zb2M6IHVzZSBDT05G
SUdfRVBBUFJfUEFSQVZJUlQgZm9yIGhjYWxscyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3N5
c2Rldi9mc2xfbXNpLmMgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jIGIvYXJj
aC9wb3dlcnBjL3N5c2Rldi9mc2xfbXNpLmMNCj4gaW5kZXggOGU2Yzg0ZGY0Y2ExLi5lMjA1MTM1
YWUxZmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jDQo+IEBAIC01NjQsMTAgKzU2NCwxMiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGZzbF9tc2lfZmVhdHVyZSBpcGljX21zaV9mZWF0dXJlID0g
ew0KPiAgIAkubXNpaXJfb2Zmc2V0ID0gMHgzOCwNCj4gICB9Ow0KPiAgIA0KPiArI2lmZGVmIENP
TkZJR19FUEFQUl9QQVJBVklSVA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZnNsX21zaV9mZWF0
dXJlIHZtcGljX21zaV9mZWF0dXJlID0gew0KPiAgIAkuZnNsX3BpY19pcCA9IEZTTF9QSUNfSVBf
Vk1QSUMsDQo+ICAgCS5tc2lpcl9vZmZzZXQgPSAwLA0KPiAgIH07DQo+ICsjZW5kaWYNCj4gICAN
Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBmc2xfb2ZfbXNpX2lkc1tdID0g
ew0KPiAgIAl7DQo=
