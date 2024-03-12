Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDC878F7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 09:09:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ZmokEv3G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv5rd293Vz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 19:09:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ZmokEv3G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv5qq62Npz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 19:08:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPFtKd44ZXhz6XsK0CEpMOO0FwS0c84tBZQHH9NaoGmH5ztuH8BgnRht70kDIr0csAbvr6hiCJaoNiMVoo4N9U/t26157v92X+uIz8O96hkBvCi8A9xvuFGvfKc+gafw+gd5qchcbFdI7dZMBktXLBPzowvn4AGG0N98d2NumrBY6UdqboiOQVUeFNfxsAfNML/vbZlL0J3fHz1BasPknmZ1CmmPwZ97/F0Mv/7pSodQAXOoEoRqs7U+sjLgSA/wiQhCN0Dd8yXEz7IOe8RJbuthifLFS1rmUHi5Oe7tH/Z3VaExAcOoNxdCsriTz4T4ziVTw5TKvdb13CMvIZIyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ManRMFhrXH/yC+Nu7W6a4Noc1XoBD4f+0hLuQy7iLYw=;
 b=K+HuyhkkglZfeQ8ZFrdf1sn8fIoAqcQ1gfm7JdQJWAhMEY92JAz1Hv+PUktm4rY75a5Cf88X7cncIT09RbD3wnyabxL9aPsgak8fD/LG7ESvOZBP0AEWxKk0k0bcILqKREOVrCWsk6PLkKXVdSbsgh4xxqMj8A8c6Uv5PoO19JbzBSTQp5JId4vaWoEg5V8pYAiUjoan481MHZfql5ymd2G1psU0/XM7C8faQ2kXkg20bFQmJtZVETmlNBCVIUpwK9gtDbb4IwuHZ6hGWfGjEGXXuNN32nWWgpV6miA7RilTYkedvtfPgkRcu7L4loRNOE/XjVQg8+AirCuB6GGniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ManRMFhrXH/yC+Nu7W6a4Noc1XoBD4f+0hLuQy7iLYw=;
 b=ZmokEv3GF01003NWk9n/tWbecOzXuXNVYhgqnC4P593ljldkhjZKBdIvRmMRrPVfSsJ/ms2SpWBT/vRZ7RhinbNE4ebJcmVSWGmgi0b24nZRSMfEn2SMhGgn1n8uAMyHsf7dot+5JmAQK5grGQIw6tKcfYA9+WGagbkY95Dc1sRb7KxcnDnINeltQDd+4twEP3hxfC92M2GZ41R2HSERRqN8x944dJMdvy7OI+PY0HGc7AQKfaX+NhjOkx+8gQ0ffS+v90cInjrKqe8C8mqIEKHVRBKab3Qu3wZbtPHYfeeL+14gxc1tXpDj/dkgWnXSYLEqHSwFYv8aGIJ+tdzNZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3559.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 08:07:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 08:07:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Pedro Franco de Carvalho <pedromfc@linux.vnet.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Flush checkpointed gpr state for 32-bit
 processes in ptrace
Thread-Topic: [PATCH 1/2] powerpc: Flush checkpointed gpr state for 32-bit
 processes in ptrace
Thread-Index: AQHadFRl1TG8W7E9YkWvsj5I+xn3iw==
Date: Tue, 12 Mar 2024 08:07:59 +0000
Message-ID: <720ec9b0-b433-4e0c-9fa3-28e711049c22@csgroup.eu>
References: <87d0wvtolp.fsf@concordia.ellerman.id.au>
 <20180619195429.22925-1-pedromfc@linux.vnet.ibm.com>
In-Reply-To: <20180619195429.22925-1-pedromfc@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3559:EE_
x-ms-office365-filtering-correlation-id: f8d69e86-6c5e-4390-801a-08dc426b882a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ibtzw2bNq2xFDgUXWMybgb7noys6c3CaJtCzauvSVgTHbQQUXVB7KuUynL2hNVMQ5vcXGSV1FcTWcdUqwu0U4T3A+8GczrFzVb8PjPgqgYCiFI+7PaR7e0jjtlXLgba/VUMXpsgETxKTpNISK5KpLipva1wzXAszoDtIY38lby01iYaabcQQen27oCv1HxYaHSHFTUcIvmR9jNNPcVCyMpqUT4bge3T4BknkgNE7uzsj3FceesL7b+SSggI8iEQ2LP8lFZcPfGaVcuewwHdwRpMxVd/Yi0qpKiBqM6mfBITnh8L7xafPG/AGlV6+oCINNhlZfZTEgF51UgEuFbyGKTGkiv8t4BJMyRNg/9xclazCN9uHXDMREK0P7bJA75KR4xW02qhbdYpIL80kKVAM1X4Wg4tmAF9xAf+ItcSjcmaDL30S8rWxGe4wQpXC6t+2witTWit0LB/OoFU9VHiNvMAtYv6X6tyZL5j27K5g/MmQYhwUhtakMARvihk422dLVllTLIde/DtcZuSSvEizRl+1yv7NJh7e90oO6mEfG2rnUlEfxnxp0uTBbpJDVzqyJykogOH/atnz93h5w8aIVndBvzNODEM/qQn7Zdu4/4mX15NVw2sDqFaMsVW260ngWD73FnuryVEzqhLzzET5wYrt2Kq/eYezyuqLAuUVsWjqx+YdILXpfbvQ5273tPUdaav2rqkkY2yz4OM+rgZiopAQs2Y6QF0SC4+RBJepsD4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?blJsUkhFL3IwSmxoRzNzSUtVRGlicHpSV2VDdmNqRjhlVzRiYkluYlhWQmUx?=
 =?utf-8?B?b2pKL1BpZSs2VnkrdnMvQmwwRmJPUHlxOFQ3N3ByTDJ1aExLdEVYaVlNRW1J?=
 =?utf-8?B?aHpWYjFWcTNpcFdGeXdzSHlQVFV5UnhsZnpmMytqNnRwdExDWUM0eHZPRFNt?=
 =?utf-8?B?SEdNajhMMk5BYUk3WnFNN1dnNzcvd0s5enRUMnpwNmhDTWMydFhKUU5uVWF6?=
 =?utf-8?B?VS9DQjN6ZUVscDFhN3NtWE9maW96TnVtNUM4bEVRdXE2MjV2dmtxb1VrQ0tR?=
 =?utf-8?B?SE5aV2R5dG9PM0RYR1dibzBDSG9IK1hRaXZhSUhPQXhLMzNlaWFXczJNS0ZZ?=
 =?utf-8?B?N2d0M1dhK3c4SWtmSVN0NnFaOFIreDE0eUgzR3V3Q0hkSDI3Um1IY09KRFFI?=
 =?utf-8?B?ZkNoNkYvVUJ2VWF3MkcxVS9MUW8rQ2wvVHBkdzJOVWFrTjlPSzRuQ3VRTWxD?=
 =?utf-8?B?NFdUZzZWL0ZKLzNwVDJ1eUU4MXlxK21WangydWVGSkFJRElPWTE1d2VuVXJH?=
 =?utf-8?B?VHYyYzR0cEpGOWI2a3NzNUFnSlh1TWZVY1ZDWmkxdjV5U3ZtZFJjZXQ3U1Jh?=
 =?utf-8?B?WlF0cTYyaWtNeXJUOUxCZUFmZ09pZXBtdFNOak5XVFZvRXMwT3ZHbEdvb3Zh?=
 =?utf-8?B?d0lwZ2hUY2d6dmtxeUY4SHBYbHljWWhCdTZSSTB6TlZCZi90Y0wxbWpmQ05K?=
 =?utf-8?B?UGlQMnBsVkUzOHBreXVXVy9xeHZQd1cyUXpVcGUrQ1JPV1VEM29GNDlOSFpt?=
 =?utf-8?B?SVVSL2FiUnR5Z2MzMHJKZzdOZ0N0cG5xVUVleGdHMGlXNk1YZERyRjhMcktz?=
 =?utf-8?B?bmZjcFN4eHJTZ3BYVE8rcTNtUWJqckFBV25Wa0hiZW4wZnBXMlZWL3dZZjJF?=
 =?utf-8?B?aEVvUm5EZWU0VGNsNVQ5VUpMTVZ4US9DRnpYcHdIdmkxM1M4T1lIRzJ6YWN5?=
 =?utf-8?B?THVZb2xlc016ZnJJY0VJVkNNMnJYcldqYzFyS2dXNWZpNUNHOTdvZHVhR2V3?=
 =?utf-8?B?aU9IK01TUGRJMVFPbDZJY0c0OUN3WE5ZZXZLYmtTYjh4VFVyZi9vL0NCSUFm?=
 =?utf-8?B?MFFuR05UbDBsNENQNENxTzFXU2NNV1FVbG5uczJXWUovOEFQVDBOU3NKV0Zt?=
 =?utf-8?B?K0RlTEZSSGQ4bkN0VUx0dVNkb3Zjd0VGWjJPdzFMVkFKSmJ5RGcxMzNLS3Q1?=
 =?utf-8?B?azB3Q29naXE5U0hsdUR6Vm9lMFd6NUtHTDJjajZleHBzeEJaeWhLSTEwYm1m?=
 =?utf-8?B?WEptdW5nMUxxbFlHTFF3akNZSGhaaW1hUzY2Qy9ORnZMbDBkc21QUHBXRDBq?=
 =?utf-8?B?Q0tsZHRHSkg3WHE5VXIwZW5yeU5mOFUvVllzZGlHUXJFQnlQSi9MR2xCYnJz?=
 =?utf-8?B?SVJZOWordjU0UWxZREl2UHhUM3JBMms4MU53QmQwTkNieU1tb2ZaMG96dm1P?=
 =?utf-8?B?TTkzYitIRmJZM3BTcEJJSHRLV1lJU2tzeG8zWkFiTnVPQllIYzh1V1I4d3ZQ?=
 =?utf-8?B?emowVHB6VHhFaERqRWpOakgrcUZROTJERkxiK1pvcm9meXJvVGVMcHZiSVk0?=
 =?utf-8?B?OHBVT0NVemlGVlRUcldTYW1kQWtPK1lObWx5ZnQxeHhCVVJDSm5wSEJ3ZllM?=
 =?utf-8?B?R1B3L3VMdUtxaGdlRTVGenNGbEd0RHo0YytvY2Fqd1MzYTZIZStodDlGUEpp?=
 =?utf-8?B?OWN5OVRhRTYxbE9HMnZNNDRDMUdKRDJYMHFUelM5VWM4enJWbmlsbXpRVmtB?=
 =?utf-8?B?WnZHSEFHVHdYUXFUbTZUdmZ1YmJGNFAzc3VzNWNkU083UWxyaHdiY3B5L1hF?=
 =?utf-8?B?V2g1VEFuZU84bCt5Mk1jZGZ3VUxhWUlaL1pqY1dWRGRrSXpaTElwUVZ1Z3FV?=
 =?utf-8?B?UjVwTGhja0lMdkQrQVBBbGN0QWFlZE9tUEYrWkVVcjFDTDFmZ1QvSytJMjda?=
 =?utf-8?B?TzBlV2hIQUdvaE5FUUtlbjlQU3lTK3FUczBxeVdSY1VmOHlMRDlHc0RRUCsv?=
 =?utf-8?B?eGVXZkRpOGYwU2MzTmhBSGVqS1dCVEJZaCtBL21TVGJmTVlGeDREUHQvckF6?=
 =?utf-8?B?cExwMXFxMjlpNHZSUXBwaThOZ0NuYWJDWStSL0k4YlF0ZkFIMkcrTTZ0Tkdv?=
 =?utf-8?B?YmZRM3RKd1NvcHgyV2w4Tml1cU1RdjQ2TUFaUm53cHhxSi84cXJYZXpWZFEw?=
 =?utf-8?B?TjlEMTA2SEY0T0tDMUV0QTVBb1N6ZVdremozSHFwelRlb1ZNaFZWbXZGMnNp?=
 =?utf-8?B?enh2WUs4Z3dBbWNwRi9SemE1YjRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <710530E6C6907847A080845015302E88@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d69e86-6c5e-4390-801a-08dc426b882a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 08:07:59.2551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gnkG+RSb/moc7nc0EWDaby4EpjkdwPkEBDUZ9NbWQO4FOZw25knYdbRN0psbP2V7PxhF2PSODT5getPNuABy5YLl25ma+lCBu5AcOa6rD3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3559
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

DQoNCkxlIDE5LzA2LzIwMTggw6AgMjE6NTQsIFBlZHJvIEZyYW5jbyBkZSBDYXJ2YWxobyBhIMOp
Y3JpdMKgOg0KPiBXb3VsZCBzb21ldGhpbmcgbGlrZSB0aGlzIGJlIG9rPw0KPiANCj4gSSBmYWN0
b3JlZCBvdXQgdGhlIGNhbGxzIHRvIGZsdXNoX2ZwX3RvX3RocmVhZCBhbmQgZmx1c2hfYWx0aXZl
Y190b190aHJlYWQsDQo+IGFsdGhvdWdoIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgd2h5IHRo
ZXNlIGFyZSBuZWNlc3NhcnkuIFRoZSB0bV9jdnN4X2dldC9zZXQNCj4gZnVuY3Rpb25zIGFsc28g
Y2FsbHMgZmx1c2hfdnN4X3RvX3RocmVhZCAob3V0c2lkZSBvZiB0aGUgaGVscGVyIGZ1bmN0aW9u
KS4NCj4gDQo+IEkgYWxzbyBub3RpY2VkIHRoYXQgdG1fcHByL2RzY3IvdGFyX2dldC9zZXQgZnVu
Y3Rpb25zIGRvbid0IGZsdXNoIHRoZSB0bQ0KPiBzdGF0ZS4gU2hvdWxkIHRoZXkgZG8gaXQsIGFu
ZCBpZiBzbywgc2hvdWxkIHRoZXkgYWxzbyBmbHVzaCB0aGUgZnAgYW5kIGFsdGl2ZWMNCj4gc3Rh
dGU/DQo+IA0KPiBUaGFua3MhDQo+IFBlZHJvDQo+IA0KPiAtLSA+OCAtLQ0KPiBDdXJyZW50bHkg
cHRyYWNlIGRvZXNuJ3QgZmx1c2ggdGhlIHJlZ2lzdGVyIHN0YXRlIHdoZW4gdGhlDQo+IGNoZWNr
cG9pbnRlZCBHUFJzIG9mIGEgMzItYml0IHRocmVhZCBhcmUgYWNjZXNzZWQuIFRoaXMgY2FuIGNh
dXNlIGNvcmUNCj4gZHVtcHMgdG8gaGF2ZSBzdGFsZSBkYXRhIGluIHRoZSBjaGVja3BvaW50ZWQg
R1BSIG5vdGUuDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24gdG8gZmx1
c2ggdGhlIFRNLCBmcHUgYW5kIGFsdGl2ZWMNCj4gc3RhdGUgYW5kIGNhbGxzIGl0IGZyb20gdGhl
IHRtX2NncHIzMl9nZXQvc2V0IGZ1bmN0aW9ucy4NCg0KVGhpcyBwYXRjaCBpcyBhbG1vc3QgNiB5
ciBvbGQgYW5kIGRvZXNuJ3QgYXBwbHkgYW55bW9yZS4NCg0KSWYgc29tZW9uZSB0aGlua3MgaXQg
aXMgc3RpbGwgcmVsZXZhbnQsIHBsZWFzZSByZWJhc2UgYW5kIHJlc3VibWl0Lg0KDQpUaGFua3MN
CkNocmlzdG9waGUNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGVkcm8gRnJhbmNvIGRlIENhcnZh
bGhvIDxwZWRyb21mY0BsaW51eC52bmV0LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvcHRyYWNlLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3B0cmFj
ZS5jDQo+IGluZGV4IDk2Njc2NjZlYjE4ZS4uMGQ1Njg1N2UxZTg5IDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMva2VybmVsL3B0cmFjZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
cHRyYWNlLmMNCj4gQEAgLTc3OCw2ICs3NzgsMjkgQEAgc3RhdGljIGludCBldnJfc2V0KHN0cnVj
dCB0YXNrX3N0cnVjdCAqdGFyZ2V0LCBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgKnJlZ3NldCwN
Cj4gICANCj4gICAjaWZkZWYgQ09ORklHX1BQQ19UUkFOU0FDVElPTkFMX01FTQ0KPiAgIC8qKg0K
PiArICogdG1fZmx1c2hfaWZfYWN0aXZlIC0gZmx1c2ggVE0sIGZwdSBhbmQgYWx0aXZlYyBzdGF0
ZSBpZiBUTSBhY3RpdmUNCj4gKyAqIEB0YXJnZXQ6CVRoZSB0YXJnZXQgdGFzay4NCj4gKyAqDQo+
ICsgKiBUaGlzIGZ1bmN0aW9uIGZsdXNoZXMgdGhlIFRNLCBmcHUgYW5kIGFsdGl2ZWMgc3RhdGUg
dG8gdGhlIHRhcmdldA0KPiArICogdGFzayBhbmQgcmV0dXJucyAwIGlmIFRNIGlzIGF2YWlsYWJs
ZSBhbmQgYWN0aXZlIGluIHRoZSB0YXJnZXQsIGFuZA0KPiArICogcmV0dXJucyBhbiBlcnJvciBj
b2RlIHN1aXRhYmxlIGZvciBwdHJhY2Ugb3RoZXJ3aXNlLg0KPiArICovDQo+ICtzdGF0aWMgaW50
IHRtX2ZsdXNoX2lmX2FjdGl2ZSAoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQpDQo+ICt7DQo+
ICsJaWYgKCFjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9UTSkpDQo+ICsJCXJldHVybiAtRU5PREVW
Ow0KPiArDQo+ICsJaWYgKCFNU1JfVE1fQUNUSVZFKHRhcmdldC0+dGhyZWFkLnJlZ3MtPm1zcikp
DQo+ICsJCXJldHVybiAtRU5PREFUQTsNCj4gKw0KPiArCWZsdXNoX3RtcmVnc190b190aHJlYWQo
dGFyZ2V0KTsNCj4gKwlmbHVzaF9mcF90b190aHJlYWQodGFyZ2V0KTsNCj4gKwlmbHVzaF9hbHRp
dmVjX3RvX3RocmVhZCh0YXJnZXQpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4g
Ky8qKg0KPiAgICAqIHRtX2NncHJfYWN0aXZlIC0gZ2V0IGFjdGl2ZSBudW1iZXIgb2YgcmVnaXN0
ZXJzIGluIENHUFINCj4gICAgKiBAdGFyZ2V0OglUaGUgdGFyZ2V0IHRhc2suDQo+ICAgICogQHJl
Z3NldDoJVGhlIHVzZXIgcmVnc2V0IHN0cnVjdHVyZS4NCj4gQEAgLTIxMjQsNiArMjE0NywxMSBA
QCBzdGF0aWMgaW50IHRtX2NncHIzMl9nZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsDQo+
ICAgCQkgICAgIHVuc2lnbmVkIGludCBwb3MsIHVuc2lnbmVkIGludCBjb3VudCwNCj4gICAJCSAg
ICAgdm9pZCAqa2J1Ziwgdm9pZCBfX3VzZXIgKnVidWYpDQo+ICAgew0KPiArCWludCByZXQgPSB0
bV9mbHVzaF9pZl9hY3RpdmUodGFyZ2V0KTsNCj4gKw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVy
biByZXQ7DQo+ICsNCj4gICAJcmV0dXJuIGdwcjMyX2dldF9jb21tb24odGFyZ2V0LCByZWdzZXQs
IHBvcywgY291bnQsIGtidWYsIHVidWYsDQo+ICAgCQkJJnRhcmdldC0+dGhyZWFkLmNrcHRfcmVn
cy5ncHJbMF0pOw0KPiAgIH0NCj4gQEAgLTIxMzMsNiArMjE2MSwxMSBAQCBzdGF0aWMgaW50IHRt
X2NncHIzMl9zZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsDQo+ICAgCQkgICAgIHVuc2ln
bmVkIGludCBwb3MsIHVuc2lnbmVkIGludCBjb3VudCwNCj4gICAJCSAgICAgY29uc3Qgdm9pZCAq
a2J1ZiwgY29uc3Qgdm9pZCBfX3VzZXIgKnVidWYpDQo+ICAgew0KPiArCWludCByZXQgPSB0bV9m
bHVzaF9pZl9hY3RpdmUodGFyZ2V0KTsNCj4gKw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBy
ZXQ7DQo+ICsNCj4gICAJcmV0dXJuIGdwcjMyX3NldF9jb21tb24odGFyZ2V0LCByZWdzZXQsIHBv
cywgY291bnQsIGtidWYsIHVidWYsDQo+ICAgCQkJJnRhcmdldC0+dGhyZWFkLmNrcHRfcmVncy5n
cHJbMF0pOw0KPiAgIH0NCg==
