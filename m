Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7245F6D94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 20:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk0b83nZdz3cf9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 05:39:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s4rp9951;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.88; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s4rp9951;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120088.outbound.protection.outlook.com [40.107.12.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk0Z669M0z3c6r
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 05:38:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaJTc7U7IT1Yv62RYhuM0zlymC+7NMUjq1DCGGGtrEfY8axzEicoP36iixVMdg1UI8I9sAd5SvlwZyRNMsN/5FJrld6RfeaoxMDSpThPZBaJJkO2uwEMoCctFX55Z52nwSjKEh4yImQiRXH3fLQ+yGI0nZRRcHjK4AXgwCt++4TiEDcviMfzOymkVmrpPfY9yw7pqjmZWpKtsPKNj36d10J97yjBnuJWlVUAoxs/3f62eq8A7VQvdmmbZzvEXDffcpWo45bOQGDzRDNJEvMokaLQNuIsvdSLRnJgZLXZs/xHWne8o7fh7mgrLZU/2M+5kH6nVyM34XJiUy02FwU7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AcnKKtSN/X4R/DgR9d00r03KtAwVgJ50RA3XTzN92s=;
 b=c7tfmE8fzuQV7g7t27LX/NEimexY41WnLejN4s6Hwm+IHV/Cn7qk6T1hDjIf9eqyUOa7GsS3uDvjriA0Za0prkfoGst80JuN7V6QdggtGHCRNxufG0qQStMken0ZnAyBamA458IeP4sOgw4oVQARSRizU25s1Ogs1P5SXLPTu5wMYgbqrqGg3fGCL5/c4O72PmwY07yMy7Ka6ci4XTO4mP+sP6e8f2VSE4+qmmhTQ+07iQPMxUNzqONDVUN2PxwuX3jnsPWFXiXEYy7vrtQe+gRxnI1IY0Zqbj//8AzxwjZ65BBNQUNooOqXOveuIjMQ+rDesHaMJqYZB4qzLRgNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AcnKKtSN/X4R/DgR9d00r03KtAwVgJ50RA3XTzN92s=;
 b=s4rp9951y5EpCb+rYo5rf47tNF4iDqILeGyoxSK6JWJAT4t7kKL9hNOPLDNRAIVPi6gJgPJGkIvq6BINJkX5WcwqbIdWCBlzNoMMMGk6yeGLV06VuUD6IE0ROEeWaQUkLyrTUFjsd5ZzQcnG8y6bcas0X1g5gwIWKG9LFbRCh161X8oDUN751RV58JugHL87BnOojokxJ+04Wp0J6VDd6BBZvYUT40I8e5Y/z4s3gzlFI/DzkFEZgbyKhu2C302G63vlYexG2Qon1LQiBvYz9ZWL7Fa/jnjlaClVi57S9o4A3DYfjmTwkmlumxN+NrtIn4sYWPm2hvw+96cf2J3gew==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2998.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 18:38:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 18:38:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Topic: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Index: AQHY2Hvw77zNAtfUm0aSr4Prvs66h64AMxyAgABUNACAASkFAIAABDeA
Date: Thu, 6 Oct 2022 18:38:00 +0000
Message-ID: <2bb8accb-30c0-67e6-7ad5-36c02d46a2cd@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-6-bgray@linux.ibm.com>
 <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu>
 <878rltpyy1.fsf@mpe.ellerman.id.au>
 <20221006182254.GR25951@gate.crashing.org>
In-Reply-To: <20221006182254.GR25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2998:EE_
x-ms-office365-filtering-correlation-id: 436b0d2d-fa64-4573-fbba-08daa7c9e5a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Iz3PHQLvy+U/xoB01Oz+/d5hJGW5pH4/tiEWPCf6jpNj13MaiOe2TYZytOEfvQMxmv6iU3ZGzQtnqE/s2wHuDUxhd85nEAYlESFCDMEHgy6b92C1Q0megCTqVnnsleC2DTF+GUQJp3Wxjl+/6IgSW3trnrrqEbP5s2YKoAQIHAs54d8Ou6RePvW5pJJKCVou0AZpSRfkbxI7kpXzkt1cjoXtjUuLDFOr1Z2QZOxkpEeA3xUIcTdVREEoJQVajJpqUDTT76BQ1wRDvNZLv4/WoQ1lFUYZNXZLiyLOe9mttlWR0ZyLhvZnyJoK4fvt9rpP3mifMzo7nm+iW6K56HHWyd2sZYYWNRKBn4hk77jGE33iiSl72Ad+wkEuaHOb5QkPN/3PW3TewNy6i+zRCkWWqqfvYLuZn4S/1Mo+UF9tl/T0ClkQeEvMV+oJ8wWEM14lLCwh/FHlQi/NuXxcQHf3Dw9EZaF/1jzBFQaRvKmId25sCu54FR56BbYwOn1yurH4Oi1/qzRL8qPiDWcmvye3lMz6wnsgwfidsKqDkyi6gmatlqld044C/uaywUzw+ohLs4yWN4xMeukwdV88ZpITlzndyCD78GXiXuVntvyhR1g2X8fa82pGgYVslS7nuLAkiOlLN3EDFQsDyfDgmrdivia+CDi/A6byqz7otsSt+ny532+r0Epim5Z6L09JwubqPVcA7QXG+Ux5s1/Yj4ik3S/C7b6S3cswZVModtKijGFFCL8IVmz3LuySj3Iu6p4w+6loUMEGJucGPV+zlku6eMNH3tPgoFzDvkIa0ULN/k1O+KAmwOJadmhV0n6pV6T40A7WdohtE++pdAmq5o5ZhQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(2616005)(186003)(83380400001)(66574015)(8676002)(76116006)(44832011)(5660300002)(41300700001)(66446008)(66476007)(91956017)(4326008)(8936002)(64756008)(7416002)(66556008)(66946007)(6512007)(2906002)(31696002)(26005)(36756003)(6506007)(316002)(54906003)(110136005)(478600001)(6486002)(86362001)(38100700002)(31686004)(38070700005)(122000001)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bExWTDZqZG02cGtUc3M0S1dsMXlCakNoT1N1MWFjSHl3cUhYampoa0hZRkhw?=
 =?utf-8?B?Szl2YXlsdVVMRmdEbUIxZjdSdjR3TjNSWWFkYi9kTkcxS1FlenRrRkxoWXFl?=
 =?utf-8?B?aG9RSFZ6ZHV3ditaYkMxMG5jQldNN29KN25UNlE0NWU5U3h4RjRBQzBnZWVP?=
 =?utf-8?B?QjJSaUlFODZ0eXg0NG9adjIxMHN2Q2NFTnVtall3cEk3WjlmZ1FJbnF4VU1r?=
 =?utf-8?B?ZHVQRlViWU50anUzdVd1KzVCNGZRdVJCY1RmYzZ4dy84cmRISWxhckxSWFFZ?=
 =?utf-8?B?R3JsYnExQTErbmx2ejdnbTN5Nlp5YnhnS01YdzJIQkNJNVM1eTh5Y0dJUUl2?=
 =?utf-8?B?ajFhTEdpYWJhK3B6Wmd5SGNVbWJucEI0Ky9GKzNqODkvS09GNmltaTN2TmtX?=
 =?utf-8?B?YkordUJ0ZXFpdTMwWU1qRk9LalBkb2d2dzdRekJqNUdzVXhWUzFjODh1NWRQ?=
 =?utf-8?B?NFU4WWg1Y2lGR3I1T2pJbzg0MFJ4UXdsVnY1K2tMdjdRSGJ0bVcyTklCVTJk?=
 =?utf-8?B?YWR6ZllEZk5OT0RFK0d4ZG9BRnpEMDBFOFlBUThoOXpJNGp3aHBUVW1EWGUr?=
 =?utf-8?B?MzhmRCt3UXo1S2JUak1BdUVjSklLOUVMYkh4R3Y2bUVLbnY3czVRUnpTYjBk?=
 =?utf-8?B?aW82amFuYWd1SEo4UCsxTUg0ODUzM01rWFYxQXJrUnNSUW5iZnpDN25zRnVY?=
 =?utf-8?B?MXZyQjBUNHNaM0hUTjdLY1JDeWZKOTAvSDFGNW9XTDFxUHpmZEs1YzhWcUlS?=
 =?utf-8?B?TWhNQjVBcEsxWTRGamZSMDRNZ1RKWit1MWFWTmEvMHRWR2oxVTdPVitaZzFH?=
 =?utf-8?B?MFlDVUFORnlXdHF2eFY5K3ZOa01yeGYwUEd4cEJLUk1MNkYxVWpmcjRSdTVO?=
 =?utf-8?B?Q3VuTWpsNUQ2eW1hL0lKMmlwMmd0aHJ3NzBFQXdYcll4Z2xwTlFPbjBQSDQy?=
 =?utf-8?B?T2gyQ0tmcXh3SU5qWGUvd3UzOEVSUjBGOVZVUDdkWitLcU42NVVxdUd0cDRs?=
 =?utf-8?B?c0xFb0JNbHJBSFZBNHdhMnR2WlRoTHJpVUQrakdNVm94WXZ0Vm9tWmM2NlZC?=
 =?utf-8?B?UTc3OFRaWW54U0x4TnV1dnhrQU9ycWNvd1VNU1p2MjdreXBGcSt1SGR1U2ZB?=
 =?utf-8?B?SE5DcnV3OWNHWEdNSUdHV1dMQjh5RWkzMDBRZEdqTGVPeXhWZ3c5VDFKZ21W?=
 =?utf-8?B?VGtaWktId1MzQ3AyZE12MlA4Q2l5Z0hyMXdBbW4wSkdhNW45dXE0Yy8xa0ND?=
 =?utf-8?B?QVc1ZFFjNnN5eDU3Uzh3blBnZmN2WnVydmROSzRYeU5CN1FCVDVlcHE2U0s3?=
 =?utf-8?B?dTluMHloNVFYcmladkNiVjB1clprclVYV3c0aC9rRkg5UlIyRXBac1pNMy9i?=
 =?utf-8?B?Ui9pVUUrRjhNZFhUcGhHN0o0UHVyRXR4Nkl1aTY5TWE5cEF2TkVoQ3k5TGJj?=
 =?utf-8?B?NlNBSVN2d1l1VWFhSGVrZ29TWmVvSDA3cFR3eDV4THZ2dnFIWUsvTi9NZy9x?=
 =?utf-8?B?WEkyUWxOL3V5bklRMWs5UTRnREpWalBTMWlYUzhGMGZIN3FERnJiam5OMzZM?=
 =?utf-8?B?WGtzWWtQM1gwOWNRNEFlK2JtODJDTEdoRHl2SjVYRElhSmVQTFU2NTRxWHlV?=
 =?utf-8?B?MDZpVmM2Q0VqbVpkZmlBMmF3aXlEL2g1U2pIeVlnM0I5OFFhWXovWVE0bHNa?=
 =?utf-8?B?cEN3czU5Y1lwbC9oaXBEa2lqbXNrWjdsMW13SDFCbVNEcXV0c21sSG1vL3Jj?=
 =?utf-8?B?TnFCbTBVS0t3SUhkVTM1bjNSK2lFYWxaOTd1TlV1YTg3TEZiaUFWVWc3Uzlq?=
 =?utf-8?B?L2ZINEVneTBHQUlLYVpRMlNQMnB5aFVGK2ttbTYreC9GdWdZOTBNYVIrbktS?=
 =?utf-8?B?OEkycUh2ODJtU3ZjVjlqN2x3akVrN0doeUEveWp1MlpTTk1XUHVwWjA5ODRE?=
 =?utf-8?B?eDVkbkk5eGxnaEZURDFnSmlUQy96ZXFGNzRZamhJazVBMnN0U01OamN4Z2p1?=
 =?utf-8?B?blpGTjBTMHkvaTFoWVV2TWE1WTh0NnJTRlQwUXRhUWE0M2srS2xsSEVIb2ZU?=
 =?utf-8?B?N0V2d0VaclQ0aFN0Zk0zeWNIRkZPcytJdUk1VmtkaGszVUpxK1RqL01jL1Q4?=
 =?utf-8?B?TFM2NDFmUkEwNVlRemJxVVk2a3BoSzlMUGduem1TendMTExPYllweHRxSnFF?=
 =?utf-8?Q?5MQyuaOMNepVw68z7/rVhtw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F8D96D2F5E61A498F724B22BCAA87E6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 436b0d2d-fa64-4573-fbba-08daa7c9e5a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 18:38:00.9003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NgsTGu6AR94C/rrdgux8q9LT/ucrgGR6vAQ11kI387m2tLDreHJYXxe3wbizDtvx7u3LC5+asO8cdLiFrf2K+6kNFngyDZY0n6A08mkKn5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2998
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEwLzIwMjIgw6AgMjA6MjIsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUaHUsIE9jdCAwNiwgMjAyMiBhdCAxMTozOTo1MEFNICsxMTAwLCBNaWNoYWVsIEVs
bGVybWFuIHdyb3RlOg0KPj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1PiB3cml0ZXM6DQo+Pj4gSG93ZXZlciwgdGhpbmtpbmcgb3V0IGxvdWRseSwgSSdtIHdv
bmRlcmluZywgY291bGQgd2UgbWFrZSB0aGluZ3MgYW55DQo+Pj4gc2ltcGxlciB3aGVuIENPTkZJ
R19NT0RVTEVTIGlzIG5vdCBzZWxlY3RlZCwgb3IgaXMgdGhhdCBhIHRvbyBtdWNoDQo+Pj4gY29y
bmVyIGNhc2Ugb24gUFBDNjQgPw0KPj4NCj4+IEknZCBzYXkgaXQncyBtb3N0bHkgYSBjb3JuZXIg
Y2FzZS4NCj4+DQo+PiBPYnZpb3VzbHkgbm8gZGlzdHJvcyBzaGlwIHdpdGggbW9kdWxlcyBkaXNh
YmxlZC4NCj4+DQo+PiBBRkFJSyBldmVuIHRoZSBzdHJpcHBlZCBkb3duIGtlcm5lbHMgd2UgdXNl
IGluIENQVSBicmluZ3VwIGhhdmUgbW9kdWxlcw0KPj4gZW5hYmxlZC4NCj4+DQo+PiBTbyBJIHRo
aW5rIGl0J3MgcHJvYmFibHkgbm90IHdvcnRoIHdvcnJ5aW5nIGFib3V0LCB1bmxlc3MgdGhlcmUn
cyBhbg0KPj4gb2J2aW91cyBhbmQgZmFpcmx5IHNpbXBsZSBvcHRpbWlzYXRpb24uDQo+IA0KPiBM
b25nIGFnbyBJIGJ1aWx0IGtlcm5lbHMgdGhhdCBmaXQgdG9nZXRoZXIgd2l0aCB0aGUgYm9vdCBm
aXJtd2FyZSBhbmQgYQ0KPiByb290IGZzIChidXN5Ym94K2Ryb3BiZWFyIGVzc2VudGlhbGx5KSBp
biA0TUIsIGJ1dCBJIGRvdWJ0IHdlIGNhbiBnZXQNCj4gY2xvc2UgdG8gdGhhdCBhdCBhbGwgdGhl
c2UgZGF5cyA6LSkNCg0KNE1CLCBub3QgZWFzeS4gQnV0IDhNIHN0aWxsIGFjaGlldmFibGUuIFdl
bGwgb3VyIHNtYWxsZXIgYm9hcmQgaGFzIDMyTSwgDQp3ZSBoYXZlIHRob3VzYW5kcyBvZiBpdCBz
cHJlYWQgYWxsIG92ZXIgRXVyb3BlIGFuZCBoYXZlIHRvIGtlZXAgaXQgdXAgdG8gDQpkYXRlIC4u
Li4NCg0KPiANCj4gV2hhdCBpcyB0aGUgb3ZlcmhlYWQgaWYgeW91IGVuYWJsZSBtb2R1bGVzIGJ1
dCBkbyBub3QgdXNlIHRoZW0sIHRoZXNlDQo+IGRheXM/DQo+IA0KDQpPbiB0aGUgOHh4IGl0IGlz
IG1haW5seSB0aGUgaW5zdHJ1Y3Rpb24gVExCIG1pc3MgaGFuZGxlcjoNCg0KI2lmZGVmIENPTkZJ
R19NT0RVTEVTDQoJbWZjcglyMTENCglub3QuCXIxMCwgcjEwDQojZW5kaWYNCgltZnNwcglyMTAs
IFNQUk5fTV9UV0IJLyogR2V0IGxldmVsIDEgdGFibGUgKi8NCiNpZmRlZiBDT05GSUdfTU9EVUxF
Uw0KCWJsdCsJM2YNCglybHdpbm0JcjEwLCByMTAsIDAsIDIwLCAzMQ0KCW9yaXMJcjEwLCByMTAs
IChzd2FwcGVyX3BnX2RpciAtIFBBR0VfT0ZGU0VUKUBoYQ0KMzoNCgltdGNyCXIxMQ0KI2VuZGlm
DQoNCg0KQW5kIGFsc28gc29tZSBwYXRjaGVzIHdoaWNoIGhhdmUgYSBpbnRlcmVzdGluZyBpbXBh
Y3QsIGxpa2UgY29tbWl0IA0KY2IzYWM0NTIxNGMwICgicG93ZXJwYy9jb2RlLXBhdGNoaW5nOiBE
b24ndCBjYWxsIA0KaXNfdm1hbGxvY19vcl9tb2R1bGVfYWRkcigpIHdpdGhvdXQgQ09ORklHX01P
RFVMRVMiKQ0KDQoNCk9uIHRoZSBvdGhlciBoYW5kLCBpZiB3ZSB3YW50IG9uZSBkYXkgdG8gcmVw
bGFjZSBuZnRhYmxlcyBieSBCUEYgaml0dGVkIA0KaXB0YWJsZXMsIENPTkZJR19NT0RVTEVTIHdp
bGwgYmUgcmVxdWlyZWQuIFNvIHdoYXQgd2lsbCBiZSB0aGUgDQp0cmFkZS1vZmYsIGRvbid0IGtu
b3cgeWV0IGJlY2F1c2UgQlBGIGlzIG5vdCB5ZXQgY3Jvc3MtY29tcGlsZSBmcmllbmRseS4NCg0K
Q2hyaXN0b3BoZQ==
