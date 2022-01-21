Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF249627B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 16:59:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgPG127Q6z3cPR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 02:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPFW401lz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 02:59:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MklaIooSbkqMc481WZvSOSGP63IzHndCnE8xR5ewGZl9sy/J6Q45pF5cvw3sTuXBBTHFmVJgl+s01SVLPndmp7bIShNPmBkGhXJTLrVIS0NfRgrUu7PmK43ZVrYdyJymai84NuxDjbh0WAzgLTDnjatiH/9WQgtVHdPFXnb9G4khQA7gNs75zKhFdWLYobIIwtViSL5GTWlWrFUH+9mDeSk6UTJz9eFIypy4DySgE+qAfwDFgXB8Z/QI9os6N2LkvF9p3DvnxmoIVNAcur5MK+zkIWnLuDMic08CGtDj2YlOZVdjhXHfD29rhDTv/hMOThPhvMNIewtXOgttsydbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIS31QOLi+nR8gQHTUqMFQd5jYb3VmKBMHDTxIy/e2s=;
 b=STKvt4gLYydbKjALgYEdbEUTe1RZvu7sv9jT7hc7HeKoFQHw6FeOIm47kQaMwA4oWxsluP7C69dC/3dPqKtB7strQup3tpwh/n2n5Z1b2XvMIC/g982pZGM1NiMVxc1zvOfgUymge0AthSpua7zBnHZCTp0UNjS3x5IXVNmvkL6iGayg33FBJ2qcMXFPNHNBQ080iAVanvdENz9gzV+4aFKivBZKLwsOueTzro88I0CgV8GdwgzRFrmBYSKAX8YHXWPshnn/Ga+lSiiXeIGJgcGEYnOCFifkgpwFOM8pOLDMYQUMMR9ivV1L1QOfde327IKTJhpNmxfQEZSbn4ovYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0579.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 15:58:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 15:58:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kernel test robot <lkp@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: Re: [PATCH v3 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Topic: [PATCH v3 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Index: AQHYDq5q4X/zFzDPC0qXcH9f2UXjTaxtnyiAgAADB4A=
Date: Fri, 21 Jan 2022 15:58:48 +0000
Message-ID: <c9298570-b8ce-d2c6-c007-61708c34ee5d@csgroup.eu>
References: <2ddc46d3a6d2996c56547039709e171b0ed2ec46.1642759506.git.christophe.leroy@csgroup.eu>
 <202201212332.oy8FMnno-lkp@intel.com>
In-Reply-To: <202201212332.oy8FMnno-lkp@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a19ea59-4a26-4c90-6cd0-08d9dcf6e927
x-ms-traffictypediagnostic: MR2P264MB0579:EE_
x-microsoft-antispam-prvs: <MR2P264MB057955B1C7527650E1E237FFED5B9@MR2P264MB0579.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62hXcPl77MdvRt76A3k0AAltJ88/EjrxGGdzIXPYRCQVNqRFu0dvMnmIj+rD2esuI6XEgL22Zdaav6TVRRAnYpceHux9iUVokQvAcEBiZxRBYxGcmi5keFLnKBwOjIG2tf9LboqG6esKFh+MPF+jNXT+O7uZui3h5qxDts6/73SxYQPsoNWvfk3yR/59zSelQ/td0QeXhVHiNmke0PEKmW5revh9YrLVIAJngmvuLKOyhvm1Fjg/bL353HqEtEK5JxR8ZoK+zep+NcQmYQwCOcvUW85vI6Wm/Q6iVsDFWrAQuBVIqFBTnP3piuDpWYeJIDM1LNnr3tos7JuUWsvVI1eqc/KsyK++n6IJSyE6iQJXvv1RzMSSSo8/9aYk6jVIiGQC5dhiHBMt8wXo2N5BcbdIXo84HhjzH9yAJYlvFxu59FvBSxbsOkrA8FrM/ZQ8pN4sO+ggsEJGDh5y5OZcKy9WJTDZQS1MS5fgLmzqmsD6vS5sqqlbAto7GqqnC1ZrYsGQ0zDntpy1/hrptq4D7ymOR4F7kcr8+7h3dJJG0zdLImOX4QMmm+AYJ00WDk497EtqKqnVi3vUMPps/jcNUk/dAGadhcvluwkreOdC4bTfE47YMq08rxvGir/25I/JexlA2aT51j7s+1SMRRpTIPDPBFHNGH8ifO63cxPZkYHVKUaAnOqjvUqSn8gcVCAIEfb2+mT55E+lzYEiL+5k6EXF4+RJ1sbO91gIjCuSKGODe2HBvD5ZxzRuGl0t/6Iql4OJz+ECUQAh1cUf1hOI3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(110136005)(316002)(44832011)(2616005)(38070700005)(508600001)(6512007)(4744005)(91956017)(76116006)(66946007)(71200400001)(54906003)(66476007)(66556008)(64756008)(66446008)(83380400001)(6486002)(4326008)(122000001)(5660300002)(8676002)(2906002)(86362001)(31686004)(6506007)(31696002)(8936002)(36756003)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0NHWmkrMzlXdjV0am1CSUN6SHdOeVZUbXJTQWVMelExWkRQd2hrRmh2WUJ0?=
 =?utf-8?B?UGY1WkIxRFJERnppdjBuQVp5aVNabFJ5NGdHcGp2UTdNeGl3SGp0dkJGODNx?=
 =?utf-8?B?cGQ3TEVLeW55bnpTT2djejdJRjl4bEhrenh0VWVFOFpLNjN6Z3dqeEhyL21Q?=
 =?utf-8?B?bDRwNkFHN0JXQVdVNXAreFZ3Vm9iTUNaWkNZdUswcVZnaUZzZEIxU2RqNWJp?=
 =?utf-8?B?Q2xMOUQwQjlSRkxkclVlSndrS2RwaWl4eENYcytpeUMxbWF1K2VULzlwdHBh?=
 =?utf-8?B?cHlTMnRzbEYzUUJ2eVgvY0NYcUdna084cm5hdkpEazNGMUhZTUZROFpzaGI1?=
 =?utf-8?B?a0RBUEVZSTJ4NHpFUlI2djI3V25vK2tKM0Vyb0lkNWtVb3Nuc002N2EwcEN4?=
 =?utf-8?B?ZHVaa0llOHlGSjhBamNzK1B2Tzg4WUNGOTJla1lxNFdjMVdldW5vRFdBSXVr?=
 =?utf-8?B?WjZHQmg1bXU5LzYvVzlhK0J5dG1udzByNFlCL0ZWVkhXUzRBUk50cHQzME56?=
 =?utf-8?B?eTBtdTFvZFNOYU9JQWQvK0VyZVA5WTE0L0d2OFdleVVUR052aXZHUm0wMG10?=
 =?utf-8?B?bTl1TUp6bDlRMTNsMjRBVFNLNzhDa3FScGRSNEtBTVc2Nm8wcDN4Kyt3ODdY?=
 =?utf-8?B?M011N1V1Y0szSU1ndk44aTdqelhBUUdKTlZxeGlVc0REL2JaV2x4bE93MFNa?=
 =?utf-8?B?bW4vaXNFVlZwWDJPWXVMbzJyZUVCMHNuQVR2QnpkMDkzMmttMy9tbVhUdXAz?=
 =?utf-8?B?d2tUb2xpb3YyVDFEaVRlSm85dmtKNUNrZ1B2c3l5SmtqQ2w4amk5anpkTXR3?=
 =?utf-8?B?MjdqdFNoN2p4MGhZMVljMEJrNFo1YTVZVUtUWldrMk5tVytiZ2JUZHc2QW1G?=
 =?utf-8?B?c3ludFMvQkpBeUk3azhjK3luUHRXZy9nRGhoUWVCaER5SDVVeVRVMTNWaXJp?=
 =?utf-8?B?N0FoeHB4RHVtOFo3TXdsdk1nVEs2My82M3AvRDhjek9oQklKK29wRFdrVlk0?=
 =?utf-8?B?cGN4Yi93YUttTlVJZTRJdFdpbHBWZVJuQlRaRFk3WU1YUUh0S3NieERTSnBC?=
 =?utf-8?B?ejJJUXdSSXd5SFN0dmpWUC9JVWYzM3JGTE0zTzVJSDNpTDcwaUlUVkVueVlR?=
 =?utf-8?B?MjNkQWFiUkVUdUlDMno5eXlNc1BqaWRubmhaN0tRK1dSVHB5TVUyUFpiOFh3?=
 =?utf-8?B?S3BaREdZbTFKdWpMbTkxaEpTMTBlUFBqYUVDTGlwZGlwRVgzcXJpaWxqaUlC?=
 =?utf-8?B?MzlRSzlWMHJUamR6OWhQanYvVHNpeXpqWHhaZlJpUGQ3Q1U2bmhTU1IyYTVO?=
 =?utf-8?B?bHUwUXlSRkpDVjgwbUREZnNlVWNxZXhBTFV6c1ExdG1ZMUhmM3NlTnlIMlpB?=
 =?utf-8?B?NTJIM21tVThmVDZKNDNVT1hqRWdGLzdKVHQ5WG90bTR0Y0xXbENyMGVKWndV?=
 =?utf-8?B?d3ZUMW1JK1k0ck9ac2tmYzI0QXhtU3ZFNFhoZVUxaHZYd0NvQitUUk5nUFBa?=
 =?utf-8?B?YzBoY0xQOUpWbTl4c2tVVUNlQmptdFV2bzhwejBTQUxQMncxRXc0cTdYclVu?=
 =?utf-8?B?Y3ZxSVdHQzU0R0hrTGdFeFdseW5oc3NNa0NTdlVVbnR1c0EvQmtNajl5YTZF?=
 =?utf-8?B?ak5nWWtxS0lFMmJ2anR1cHMzby85VE1oU3NKMVpNOU5qdFFvamMxVlVhaTRw?=
 =?utf-8?B?UWZjZHprT0txSnR0Y2xLb0kvM3JNcld6MHlqaUNGaEo0c1lFT0JtQ1ZMK1Vq?=
 =?utf-8?B?MlNEUWgycHVGR2VYcDVXWWxWT0FGaEtoMjNJUE1PV3gwamk3QzZxMmJxZTdz?=
 =?utf-8?B?SG1nZHRKUWE4MGp1ZWZNRFVLNDF2RHhkYWJxVFF1Z0gwc1ZaZlVlNzlBVGhB?=
 =?utf-8?B?ODlyQ0JWcUFkZGZ6STdzQVUzV0xFZFpyK2o4VWZFbWk3S2s4QTlYREU5Z0Vl?=
 =?utf-8?B?Mzdyb3diVEdBYzF6RGtDOCszY2tzQ2paei9YUWdVaGtFcExkUys2UTFPd3ZX?=
 =?utf-8?B?My81VjFxZ0NEdWtQQ1d5Q0I4dHVBejZUV1Q5NHFKb09hU0Rlajk0V0V5Y1ls?=
 =?utf-8?B?RitxaWlSb0lhVmZOMnZBQStZS2R1SnpRMFQ4M2Y0aW90Y29vWGxNbWpDWVdC?=
 =?utf-8?B?QzRUTzBZendvL0RWUDd4NnhDT1A0ZkYwTlZBRS9FTCtSdFd1djZSWDZxMXpi?=
 =?utf-8?B?eHpLRHYxZldDS3l2czI4Z2pOa01Qd041Yy9oTnF0dTBtb3dEQlYvVDdXeUMv?=
 =?utf-8?Q?J3KNwTTeNa+Xy0lhpiU3Pzrc6wOHb/C8QUnQJX0feY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CD5B759C499514F90B1204902874E4E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a19ea59-4a26-4c90-6cd0-08d9dcf6e927
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 15:58:48.0439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IoU7Hz57hB90VcCIYAxCAKgBQH6Kpv9Lc/T2l3SWu4GNSEzckm9aGnEFy2jbXFxggBF/1hHO5q1DiKB12G9wpglJDdu9YIinQ63XxXmUhFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0579
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAxLzIwMjIgw6AgMTY6NDcsIGtlcm5lbCB0ZXN0IHJvYm90IGEgw6ljcml0wqA6
DQo+ICAgICBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vZ2V0dGltZW9mZGF5LlM6IEFzc2VtYmxl
ciBtZXNzYWdlczoNCj4+PiBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vZ2V0dGltZW9mZGF5LlM6
Njg6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBgY3Zkc29fY2FsbF90aW1lJw0KPiAgICAg
bWFrZVsyXTogKioqIFthcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGU6NzE6IGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby9nZXR0aW1lb2ZkYXktMzIub10gRXJyb3IgMQ0KPiAgICAgbWFr
ZVsyXTogVGFyZ2V0ICdpbmNsdWRlL2dlbmVyYXRlZC92ZHNvMzItb2Zmc2V0cy5oJyBub3QgcmVt
YWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiAgICAgbWFrZVsxXTogKioqIFthcmNoL3Bvd2VycGMv
TWFrZWZpbGU6NDIzOiB2ZHNvX3ByZXBhcmVdIEVycm9yIDINCj4gICAgIG1ha2VbMV06IFRhcmdl
dCAncHJlcGFyZScgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gICAgIG1ha2U6ICoq
KiBbTWFrZWZpbGU6MjE5OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+ICAgICBtYWtlOiBUYXJnZXQg
J3ByZXBhcmUnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IA0KPiANCg0KT29wcy4g
TGFzdCBtaW51dGVzIGNoYW5nZSBkb25lIHRvbyBxdWlja2x5LiBTb3JyeSBmb3IgdGhlIG5vaXNl
Lg==
