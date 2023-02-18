Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649669B882
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 08:26:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJgGX6zwmz3cj2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 18:26:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=19kyx3Ij;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=19kyx3Ij;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJgFW5v5wz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 18:25:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+TZIU3SWBnMC/jV9SmGjrvz0DTnxe9Ek6hVGL/iqBx1E8xx6YyzcA2j7aI2v89s329NoGxKEFHZKLXqJhGJHlzIwOXpVanj821bxmgFqgEuRLEU1vy0SX7ULrYcfTaA7MzAL37/d36z+VrbhYeazd+lJKH5D+QVdDyyY53mWDjhQEtaZ5A4revN98LcStLjZJnVJY8eJlO0aDPceDGhmZUQ77AP6N5cu7R99PyAseWdOpatn5RyqXE3CO8E0ibM9mY3aRLiKMB9oRrqb93B+LuqeSPP/r7rKjpYIK4a6qwdf7kyzVtiIhLoJkMG1Dd3/NzsgIirzy7bqvOweWfItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DlJlIQUXLz2ctER85uUJODOFkmgFUsQLZfn3wqF14U=;
 b=i5+qxKcUaW9mkQdTYDkgCC4DlAtAOWwDloCoil4Fi1Q+aa6F/mRGfHvQDTN65iSMinD/7/CXmzj7rhVAEIxAy3BkEicmP8mUPYF74bbCv3G5bx9O+dcBpQ5C9+Ic8C16eHNXXHcolbWeWyQd1/37/pcWgD3WFH7vVUEhjBK3lMIRcOLatIBlmgi7W7cTDgYeK1DLgVCcZ37Ll5hGlONt7pBwHW2I47Bvopz0EmBZ8pwHvf3/MoFl18b4IWkZv1llwr3xN9SvV+F8xz9lVWY0FnxJVEJjZ/D2DSQRcsdSVHzQZMt2JzWbFMQd6igogirNvQCF4Eths9uK9aZyEexfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DlJlIQUXLz2ctER85uUJODOFkmgFUsQLZfn3wqF14U=;
 b=19kyx3IjK5xaD2kzhJ4HNABVZetPmeHIdm4zWghGAfvQYQHjVssOXWIHUfgol3G3iRGrEaZ22/vmsMU7M08aAVm23utiVWGQuaZAxU/tyEoamYPLcgNkmjd5oMLXgZ9mYMi/BOXDVWL2dkjj/rtlCUVmA5UUfmqKcYUQP0A9li8hTYD5rx5ePssiYmkWgJdR/93J0DOud3rcspNHhe1mHOja9767zAIhxjXxYY7JUPMi32Iveo5CUAAF8RyJKGHAAHELdssyqYehI0wWqoMF1J1yZuzhXDwQPfof7Lk3q5tiNwkclQtASMH8bj06llmuEBHenKi63Sx3fTmy+8Z1+g==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB2178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.18; Sat, 18 Feb 2023 07:25:09 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f791:1454:5fb3:265d]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f791:1454:5fb3:265d%4]) with mapi id 15.20.6111.018; Sat, 18 Feb 2023
 07:25:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: microwatt_defconfig broken: fined reference to `hash__tlb_flush'
Thread-Topic: microwatt_defconfig broken: fined reference to `hash__tlb_flush'
Thread-Index: AQHZQvSB0JNokkISPEWuZE5S5lS7Ya7TipIAgAAEjYCAAAtOgIAAs+sA
Date: Sat, 18 Feb 2023 07:25:08 +0000
Message-ID: <2ad9fc79-a9cd-febe-0052-96a1b42a8386@csgroup.eu>
References: <20230217171407.zuhmdozno3am6flk@lug-owl.de>
 <670dd176-c896-12ea-228e-c7db32f5b955@csgroup.eu>
 <20230217200043.cubehrboeqeyfhip@lug-owl.de>
 <20230217204111.2hvg2qkyhkm7c5l4@lug-owl.de>
In-Reply-To: <20230217204111.2hvg2qkyhkm7c5l4@lug-owl.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|MR1P264MB2178:EE_
x-ms-office365-filtering-correlation-id: 3fd7da47-2e84-4cc5-985f-08db118143d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cmO97kbEXPflR3JbTTkA0NQoxxpqxjuW7nHLfKbM2EWRRsXF1uM+KrMU0YbyMVUbf1oOm4ZZcRHo8AUSNA/duGHA4l7WczpgWm0AbKcYpQwoWGKAN4QbQiEjb5XwNMSVPdCx9s0vNFDtxPy3y8R+jiT5zBnsFPVCyLKir68x4eqd7odA0ZiqxFpHOwt6QomMyPWY8QaQtZc0Q25KMpnXVssf7k6Z7pkgB0v3yiX0w/uZjRDak9NeLLi7mpACM2oqQ3GepklIKaoPZJsvMCmW2vHcUOtmuz5gL/EvpA9ifAcR/DIHggFPWEemPIHd4UPmxjUqrf3Q9EPR35q0Nn5wRm5sEcAJKDjktjT5g1L+Ca4qPA3Wx7dSmr61k06s/NmPQ7llLeNXKpo//8VFCSkUCbOL3drXz1JzV/z1EzBum69AyATzzGFn1WhrjaLfYS1dUqrdz4CRU20p4NcOTeXjnCcfYEtz7w600bJk3zeeme+vogb3G0Hu7Hd2NV/cF61mnH2mczJgfDHMTsGXL8pDePwRI+tIPQKgADUcObk9bOAud1w6EzwQgVq8jjnbzXUsQsQXszCMu1Su33psXazomcS+4XIteRjSUdxR2fbw6xgIh+JLNqOVLwc1/iKuV4D0lVEzuZw2HRzAB1lYgFddmLVxJxIB12zPD1SSNb6NC0p9f8whfVLUoKdmm1f7IR+s2zwG6957ysDoCnY8MWfer0K21ei1RiP1xn15wMTbU4eSLsk1/PWjLoYlFfz4yD7hkykgXWzSBGAmsOkGjfWRmuZe3Dpf/nn744WB+u+QeOlmqyCuK7Nxdaxt0irySMvO
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(2906002)(44832011)(83380400001)(38100700002)(38070700005)(2616005)(86362001)(122000001)(31696002)(66946007)(76116006)(91956017)(54906003)(316002)(36756003)(66556008)(8936002)(5660300002)(4326008)(6916009)(8676002)(64756008)(66446008)(66476007)(41300700001)(478600001)(6506007)(26005)(186003)(6512007)(71200400001)(966005)(6486002)(31686004)(81973001)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c2piK2o4a1N0TWxhNmY4U1h6aU1NZ3RmYnJkZW5MMWRCbk91Z0dYUVlja0Vm?=
 =?utf-8?B?NkVBOXo0ZDdRMWlDbWovV1FtTzVvVVFKcEVqN1RQelRwdHRoaUhHUG1QQm9P?=
 =?utf-8?B?cjQrQU1zRkJtUzhBQ3dRRFhtL2k4UzNGQkRwMDRkNnV3VmVVenM5Um5ib1Nv?=
 =?utf-8?B?SmV2ai9aL0lHM1VMK09CTkxuZkRNNTdyczhIZkd6ODVOa2J5T09FQjlOeHJu?=
 =?utf-8?B?Z0Q3a0NSL1dnMmZzNWs1dWhzSk5QYU9QMERodWIrTGsyYVY0Tmh3SWY3Nmpy?=
 =?utf-8?B?LzR1UEpSOXBGS0o0bkI0cVFSTDJsM1l4UlZIenBFamtkT25YbUVkclFXamJa?=
 =?utf-8?B?bzB0VEd3UzV5MWNpemIvejgxTUVvMGFQQWtwOFBSd1NvZWZZRUdmRlFjU1Ns?=
 =?utf-8?B?MVI4TDlSNXBKZ053aUlLSWlHN0hMcVNJZVpZeDJzZ0ltVUhRdDRXZ0hMTVll?=
 =?utf-8?B?L0tuNmNVMGM2ZXFya3JZOElOdWV5RlE2Ukh2T0VZM01IckUyNTQvSTJIMUNG?=
 =?utf-8?B?NkdJQmNZTlp5SjhVc3dnREI1YXRRSSt6cUpLRkNuNy9PQ2ovMlZsZ00rNnps?=
 =?utf-8?B?Z3lpVy9TODhYU01xdklJcU5VZ0tSVVh6eGdlMEM5Y0wzMjlXNW1rME1uNDkr?=
 =?utf-8?B?SWY4NnRjMGhmYkJpZHI0eitBcDRMcWFkWTE0cmhsam9Lc2lod2Y0bXRMc2JD?=
 =?utf-8?B?Z1FWamxVTUd4aE13ODFFZDJwbzRBdDNIVjEzOEJvbklXSWpVLzhKYWF4QXFu?=
 =?utf-8?B?ZHo0Z2x5ejB5c1hFVU41SEpuRjVVQzZwc0Y4YUlnc2pKWDgrYUVjWlB6Uy9C?=
 =?utf-8?B?VS9udVo5WjVHVVhMeXVDd0hablNZMm5URHF1Wnl4cnE4THJKWDF4cEtVbjZT?=
 =?utf-8?B?bDVKQXVGSHdaR1hRYXUwUFZjdDVUMGxibGpHNitxVE8rdlNyZ1cvSkQ0NTZw?=
 =?utf-8?B?UXNTQlRFTGlqUmxnMTlKNExLWFhCcHZMUk9aVTJ1dGhqbTlUUFY2SGYyUitr?=
 =?utf-8?B?RTlnWTliNEpnYWxFaUxGSnkyYmxjdTZtT2dTM1VVN1FaTGVNQTcvL3BwcnVk?=
 =?utf-8?B?TmNjRGZrcmlhMVYrd1p4M0RJdVV5YVNhRjVNM1luR1lvOHpldjZZbnNpbVBL?=
 =?utf-8?B?dndSWXRPbE1TKys1QmJBcjBkSjVybTVuSEw3bXpSR2F2UHVEcWtYN3cyejNE?=
 =?utf-8?B?dGI0dUdhTCs4TTRMc3gveldMSU00TjYzZlJxWDYyM3ZVcFZvK2ZWMFB6aUVs?=
 =?utf-8?B?cFBxQVBvRU84bWJFeThIUmxsQ3NxWFcyQ0JCMHI2ZUdZT0hXMHNyV0Q3cUQv?=
 =?utf-8?B?Ym5FMjM1RUxHclpwSTkvb0lJNFFlN0xuQ0pOMmR4K1ZkYklhS2NUWUR1dE5H?=
 =?utf-8?B?SjQ1R1lVZWNXY05TbWU4MHBUR3czRmRnZTc1dFlVQVBqclIrcFlsSnhkY01D?=
 =?utf-8?B?UHdISXdmK1BCckpHaW9TNnRTcjJrdjRKV3B4cU1ZakdScFR6c2lKbE1xRGxp?=
 =?utf-8?B?UkVQcEZIdVlzQTZ4ZjVrMVpQOEdCWDI0UCt6UEt0dHdOWDFURTgyazFOSmw0?=
 =?utf-8?B?alJtVXQ5ZWV5cjNmM2NTWUQzbXFicDV1WjBGYmlvMVJPakl5SFd5NmhEUTQ3?=
 =?utf-8?B?SHh5c2RrclNmdlhOeCtLamRUQnJUSFdSNU1laDczRUQ3c1NOOFZMcXhBWGNw?=
 =?utf-8?B?YnIxTXBaMkxNcWsxWmd1c1lBQ1BzOEh5U2grQUNvRUkxZ0R5U0RGZlBkbGM4?=
 =?utf-8?B?ZGRkWENsdlRFNit0NWhUM1I2SktBUEdhSjgwdjVlb1Z5cTRZTFZ1OGtHWUJl?=
 =?utf-8?B?dnY4NmFLeW12VkRFdEFEZFhZamtQQW9xL1NOa3pNeTc1eGFLd2xKMWZoRitI?=
 =?utf-8?B?ZWVMamRCRDRyUklDb2VsenJDQzhaZElpbjFGY0pldkc3MURZODYwaGkvZUdm?=
 =?utf-8?B?cmJRYjExUWNteGpGMVRTU2V4ZzdvK1MxTW43dDRTaWJKV3VBeUU1bUVzWGVS?=
 =?utf-8?B?U1J5TGR2TlU4VjBTVzhyN1ZKOEtPWWJMMlVXZkhkZXlxa1lzZDRTY3lCVzYx?=
 =?utf-8?B?Y0F4a2k1c1c0SmVsMm1GZGdWZzZITDNYakx4KzdoVDhqYU1RVHpJOEVxdTlZ?=
 =?utf-8?B?YU9DWG9xSDFzY3J4U1FxL1kvM0JBcjRUTWNOODJud0NGSFZxYllxajdZMnRZ?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84E82A38EEFFAC4AA2EFEB743939641F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd7da47-2e84-4cc5-985f-08db118143d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2023 07:25:08.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7PGWY3UWAJfpwSsW/OLOWhkvPNvKQA31AMRH1QuGGWerR6zoJSPhXcClIcTqVqT5B8CQ4p5X8wg6HDRb35lPH0xZsa0QcUH7ct7XfquGm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2178
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSmFuLUJlbmVkaWN0LA0KDQpMZSAxNy8wMi8yMDIzIMOgIDIxOjQxLCBKYW4tQmVuZWRpY3Qg
R2xhdyBhIMOpY3JpdMKgOg0KPiBIaSBDaHJpc3RvcGhlIQ0KPiANCj4gT24gRnJpLCAyMDIzLTAy
LTE3IDIxOjAwOjQzICswMTAwLCBKYW4tQmVuZWRpY3QgR2xhdyA8amJnbGF3QGx1Zy1vd2wuZGU+
IHdyb3RlOg0KPj4gT24gRnJpLCAyMDIzLTAyLTE3IDE5OjQ0OjI3ICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+IExlIDE3LzAy
LzIwMjMgw6AgMTg6MTQsIEphbi1CZW5lZGljdCBHbGF3IGEgw6ljcml0wqA6DQo+Pj4+IE15IENJ
IGJ1aWxkcyBzaG93ZWQgdGhhdCB0aGUgbWljcm93YXR0X2RlZmNvbmZpZyBicm9rZSBzb21ld2hl
cmUgYmV0d2Vlbg0KPj4+PiAodXBzdHJlYW0gTGludXMpIDZkNzk2YzUwZjg0Y2E3OWYxNzIyYmIx
MzE3OTllNWE1NzEwYzQ3MDAgKGxhc3Qga25vd24gZ29vZCwgbG9nDQo+Pj4+IGF0IFsxXSkgYW5k
IDAzM2M0MGE4OWY1NTUyNTEzOWZkNWI2MzQyMjgxYjA5Yjk3ZDA1YmYgKGZpcnN0IGtub3duIGJh
ZCwgbG9nIGF0DQo+Pj4+IFsyXSkgd2l0aCB0aGlzOg0KPj4+Pg0KPj4+PiBbLi4uXQ0KPj4+PiBt
YWtlIFY9MSBBUkNIPXBvd2VycGMgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjRsZS1saW51eC0gSU5T
VEFMTF9NT0RfUEFUSD0vdmFyL2xpYi9sYW1pbmFyL3J1bi9saW51eC1wb3dlcnBjLW1pY3Jvd2F0
dF9kZWZjb25maWcvMjgvbGludXgtcG93ZXJwYy1taWNyb3dhdHRfZGVmY29uZmlnIElOU1RBTExf
RFRCU19QQVRIPS92YXIvbGliL2xhbWluYXIvcnVuL2xpbnV4LXBvd2VycGMtbWljcm93YXR0X2Rl
ZmNvbmZpZy8yOC9saW51eC1wb3dlcnBjLW1pY3Jvd2F0dF9kZWZjb25maWcgYWxsDQo+Pj4+IFsu
Li5dDQo+Pj4+IFttayBhbGwgMjAyMy0wMi0xNyAwMTo0MjoyN10gKyBwb3dlcnBjNjRsZS1saW51
eC1sZCAtRUwgLXogbm9leGVjc3RhY2sgLS1uby13YXJuLXJ3eC1zZWdtZW50cyAtQnN0YXRpYyAt
LWJ1aWxkLWlkPXNoYTEgLS1vcnBoYW4taGFuZGxpbmc9d2FybiAtLXNjcmlwdD0uL2FyY2gvcG93
ZXJwYy9rZXJuZWwvdm1saW51eC5sZHMgLS1zdHJpcC1kZWJ1ZyAtbyAudG1wX3ZtbGludXgua2Fs
bHN5bXMxIC0td2hvbGUtYXJjaGl2ZSB2bWxpbnV4LmEgaW5pdC92ZXJzaW9uLXRpbWVzdGFtcC5v
IC0tbm8td2hvbGUtYXJjaGl2ZSAtLXN0YXJ0LWdyb3VwIGxpYi9saWIuYSAtLWVuZC1ncm91cA0K
Pj4+PiBbbWsgYWxsIDIwMjMtMDItMTcgMDE6NDI6MjhdIHBvd2VycGM2NGxlLWxpbnV4LWxkOiBt
bS9tZW1vcnkubzogaW4gZnVuY3Rpb24gYHRsYl9mbHVzaF9tbXVfdGxib25seSc6DQo+Pj4+IFtt
ayBhbGwgMjAyMy0wMi0xNyAwMTo0MjoyOF0gbWVtb3J5LmM6KC50ZXh0KzB4MzIwKTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgaGFzaF9fdGxiX2ZsdXNoJw0KPj4+PiBbbWsgYWxsIDIwMjMtMDIt
MTcgMDE6NDI6MjhdIHBvd2VycGM2NGxlLWxpbnV4LWxkOiBtbS9tbXVfZ2F0aGVyLm86IGluIGZ1
bmN0aW9uIGB0bGJfZmx1c2hfbW11X3RsYm9ubHknOg0KPj4+PiBbbWsgYWxsIDIwMjMtMDItMTcg
MDE6NDI6MjhdIG1tdV9nYXRoZXIuYzooLnRleHQrMHhlMCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGhhc2hfX3RsYl9mbHVzaCcNCj4+Pj4gW21rIGFsbCAyMDIzLTAyLTE3IDAxOjQyOjI4XSBw
b3dlcnBjNjRsZS1saW51eC1sZDogbW0vbXByb3RlY3QubzogaW4gZnVuY3Rpb24gYGNoYW5nZV9w
cm90ZWN0aW9uJzoNCj4+Pj4gW21rIGFsbCAyMDIzLTAyLTE3IDAxOjQyOjI4XSBtcHJvdGVjdC5j
OigudGV4dCsweDU5Yyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGhhc2hfX3RsYl9mbHVzaCcN
Cj4+Pj4gW21rIGFsbCAyMDIzLTAyLTE3IDAxOjQyOjI4XSBwb3dlcnBjNjRsZS1saW51eC1sZDog
bW0vbWFkdmlzZS5vOiBpbiBmdW5jdGlvbiBgdGxiX2VuZF92bWEuaXNyYS4wJzoNCj4+Pj4gW21r
IGFsbCAyMDIzLTAyLTE3IDAxOjQyOjI4XSBtYWR2aXNlLmM6KC50ZXh0KzB4MWYwKTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgaGFzaF9fdGxiX2ZsdXNoJw0KPj4+PiBbbWsgYWxsIDIwMjMtMDIt
MTcgMDE6NDI6MjhdIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4OjM1OiB2
bWxpbnV4XSBFcnJvciAxDQo+Pj4+IFttayBhbGwgMjAyMy0wMi0xNyAwMTo0MjoyOF0gbWFrZTog
KioqIFtNYWtlZmlsZToxMjY0OiB2bWxpbnV4XSBFcnJvciAyDQo+Pj4NCj4+Pg0KPj4+IFRoZSBm
aXggaXMgYXZhaWxhYmxlIGhlcmUgOg0KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3Bvd2VycGMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NDMwMmFiYzYy
OGZjMGRjMDhlNTg1NWYyMWJiZmFlZDQwN2E3MmJjMw0KPj4NCj4+IEkgY2FuIGdpdmUgdGhhdCBw
YXRjaCBhIHRyeSwgYnV0IG9uIHRoZSBmaXJzdCBnbGltcHNlLCBpdCB3b24ndCBoZWxwOg0KPiBb
Li4uXQ0KPj4gVGhlIHBhdGNoIGhhbmRsZXMgYSByZXR1cm4tdHlwZSBpc3N1ZS4gTXkgYWJvdmUg
aXNzdWUgaXMgYSBsaW5rYWdlDQo+PiBpc3N1ZSwgdGhlIGxpbmtlciBjYW5ub3QgZmluZCBoYXNo
X190bGJfZmx1c2goKS4gT3IgYW0gSSBtaXN0YWtlbj8NCj4gDQo+IEkgc3RhbmQgY29ycmVjdGVk
OiBUaGF0IHBhdGNoIGZpeGVzIHRoZSBsaW5rZXIgaXNzdWUuIChCdWlsZCBsb2cgYXQNCj4gaHR0
cDovL3Rvb2xjaGFpbi5sdWctb3dsLmRlL2xhbWluYXIvam9icy9saW51eC1wb3dlcnBjLW1pY3Jv
d2F0dF9kZWZjb25maWcvNjkpDQo+IEp1c3QgZnRyOiBIb3cgZG9lcyB0aGlzIHdvcms/DQo+IA0K
DQpPbiBtaWNyb3dhdHRfZGVmY29uZmlnLCByYWRpeF9lbmFibGVkKCkgaXMgYWx3YXlzIHRydWUg
c28gdGhlIGNvbXBpbGVyIA0KZWxpbWluYXRlcyB0aGUgZWxzZSBicmFuY2guDQoNCkNocmlzdG9w
aGUNCg==
