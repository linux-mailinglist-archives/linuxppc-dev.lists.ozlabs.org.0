Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F1564E78
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 09:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LbxrJ21kYz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:14:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=11mco8WP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=11mco8WP;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LbxqS05gdz308w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 17:13:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POpOlttpesx1+8FfwAv7ARbshov4xpqiOID3ZTDVlfxvweliUnaXrx9J0hRXIj0No8BpOHgsdMw3+UW6WWY9MR6AYisufdKweorg0gMlf+vq/8nJ/cTTH0/e3qZ7jUyJkgIy+yz2TJETG7qu0BKtv6FeAc2J50L9ZGHn44f+65WUHLs3R7I2PsneH2YZ9MRk5iUomMXRiTMHchlk8DcX4y3R0GVixVBF8DFbED8AS3eMd86JAsIpsvAv8/doGYpyJ0JaA7K5/AFq4oO0lnCXgz4G818IAazxGX24+BkoxJXDOw+iTMYyExd9SrP1roG4za520/2ZkSfKgGt/9vyO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWmDstbsw6W/Kh6xl4K8QT9UGAyKEF8lqh6zZuLjYBY=;
 b=nuEBefA1kwyDR7+hveqsVVGil3wLVqDKNbkSGlLT/2rW3c59zwPvirBoQPavY1PKUZV1OsDQ44MMSWYqFntjqyG0efATrTChzFk7m+iopKrb+3wqxncsxRZSPMIgj+LAO+vcSCwIJ8oAP4HsVpAy9XzUiwJRz/DsiSIVmjqMfBA692QqZ1gpY547+CC7d0vMH5uzwnF4Qn3YNPd87Fbk6BIrK0G35W3av5ZD+GRItIT/Io23IzJMrdFjcC1HgMZsXRmjSolXXvqhGm9QDW1HuVTs3LMNt6wp6T72lxms1PsvdZq2epptX7Muq4+UnwdCPJ34CE8zOPlVyj7foPvyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWmDstbsw6W/Kh6xl4K8QT9UGAyKEF8lqh6zZuLjYBY=;
 b=11mco8WPNIeep9+0WDjjSZ90yxfr6nlQSh2CcO+AVep8LUfp4FghE/HstMcM1U8KQv7RjI0y9iAFHvlZdrLRrXmORn2GrfQcOjwymFTsZfkFfEmso+IgQuhSJCAC2882uWjcSspUShRznbtVFxsDNyTmzN2QzfBtrPE521tWd5XtXqi5xby0HAZHiMJ73C/bXq8L9QXInIKbDdgfR7FXhARV6gxox9wLOYF663qW8Imp7GhY1zViGeqwign0+wkTVTnwmiSBwHPTcEC7PBxGDtuoEg/tcHUsUeMbErQRdNReIoxxF5R3GSIn38pj5CZ3kMA7lAwbgexCImarxdO0VA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2561.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 07:13:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:13:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Thread-Topic: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Thread-Index: AQHYj3DK8TYLIxu0rEqrHZAfN+PIEK1tzC+A
Date: Mon, 4 Jul 2022 07:13:17 +0000
Message-ID: <2daa07c5-db5f-a6c9-82a7-7b6f1524135b@csgroup.eu>
References: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4718e261-563d-41a5-fcd9-08da5d8cab3b
x-ms-traffictypediagnostic: MR1P264MB2561:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Arhur5L+1aNy1ZAfO+dshUfkvNRgTqSqgsjCngUlPJJ1Ulyaq8EJQfr4DefYtVx8KPyq0uNjPpF/JFqlSQqs1U+F8H4UlovivkDbuSzTKEKBRL612jJGQPk0CG4ct7oBRqrv4WD/DFtbae5WlEtj/I0dBS3vxGd9Qu/s2LIkLtd+5efachqUBzP4W8Gi5P6lrV5xOB18O4gHxDx9JKPJ74+mMKWeuyULys5BAhCdrwwudac0KiUG1oUFUruIpfmI3XfdMifNZYlKNPTsGZfX2IdbzJW8Ha1uACqBIRafvoXllmvcHoAZgvQbg5qkwSSW+0nrlXoUEnpIOcNSk/4JoRCGAAqFTZucZU4xFPqrmukVolOBPYQBBn8ukjLU8oo1gPgdZ89WBfjidrNR043L9Vp8VsK44dqwAfyHm9FSkM115YHWXVcJyIEUP522kKI8uWejgzmHpo238PIaF+F04Ty87LAEFrMD2b7L8G6ORZVzWtSbsvP2xW346dGx7dHEC9uvtJPkxJrk10kpOOtQzRy2pe8K6uKTT9ywIlBmafTREaWQBV0hEu5ob9Zq78TZ8+DIic2nm1WLe43kz86mb+75lZ9YcQ5/I3l8yvWRpyklMuW95rnNDNy+V73uUSczwQ1TwVMccrHCEuKqrsLh9rP1ITuk975pv9BVjD767FsxBVN6vHjdJxAEiQVAaSjEyBopi5t64/vJ/oQ/os5fFVlFhUyzeQv5Wnpa3qL9JWnwnQoJBgG/R6KKS6Xtrmlg+Ujng0sjJa1Vfd04sK3euL6mX38Z2lGvDt74udw7nO7YiqG6b5PcHgkiqv+6kCY31EkbeIBc9T/5TVjdd+kogG/Ig3RkVbzPhT8X71CbCPsLykS8MEdJEXcSjzMvTRNh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(5660300002)(8936002)(44832011)(38070700005)(15650500001)(122000001)(110136005)(316002)(31696002)(86362001)(6486002)(71200400001)(91956017)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(4326008)(66946007)(66574015)(6512007)(83380400001)(2616005)(186003)(26005)(41300700001)(38100700002)(2906002)(36756003)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZG9uVzdpV2l2QWZGTUsrdmRWS21QLy9sZGV1a05EN1cxOHBhRGV6azVXYVN0?=
 =?utf-8?B?QllZUjF4dDc2V1BaQzlLSVpQMk95dlQ0RGZNSFFlMTdVVkdHcWNocVpWejNT?=
 =?utf-8?B?RzRyZS9tWTJ1bWh3NHdWQlBOY3pha08zS1c2OEdRb3BaK0dsU0txVjV0cWRu?=
 =?utf-8?B?V1diR3Q3WTZkSm9UUGJoS3psZ25PODFlNzNiU0hjWVRsZ1crd2JSTWNJY0Fi?=
 =?utf-8?B?MWsxMWN5Wk0rZG00Q29nMFVIRFIwMU9DNUNCcFJXYXBoWGYyWnRqc0xTUkI5?=
 =?utf-8?B?bVpwZHM1eWd4eWxTSEJGVzRmNmtxVzMvblg1VVRQTFlLWURZMk0zYUl6ZDJP?=
 =?utf-8?B?akpxS0J6eGxsUzZHejJKVVhFaVJOZm5RLytSU1luOHRTZXhVZG9yS0kzcTV1?=
 =?utf-8?B?ZWRLMWZyWmxFaDBxR3VVZ1hhamlyaWtGbVY3ekhKKzBTVGU4YVlVVnBuQk1G?=
 =?utf-8?B?ZEZiZXRJbnpORWZGUnhtMW9KRjAyMjVtMVZDRy95azU5alpQYTJRSHdOVzB2?=
 =?utf-8?B?RVE4SjVxdWw5TkJmckdyZzhmUUU1dU9nc0ZSbVdZcy9uMjc3NU84ZjU4TnBL?=
 =?utf-8?B?d0tZNzYyeHRGbzJUdS9hdEx5Q2NmUWU5ci9yVS9JOENMOC9McmNLeWNTL29z?=
 =?utf-8?B?Myt6eWpYamxKSDNxVHExRlRmMGtPaW55bkhiY0hnYytmbVg4NW5RMWFrbUox?=
 =?utf-8?B?S21JbW5CME83eVNZMlVyODZXQURDZTEyVzFTQUxwQjFXd3MyZEoxZXZIQ3da?=
 =?utf-8?B?S1kvS0o4WnZHZG4yZjYycXhab05ZRnFwYVViRkVDWVFqRC9haVlScXJmOTlj?=
 =?utf-8?B?bi9jQzBWNFVzUSswSGtURitFMkJkYlVta3JXSE5mKzdJSVU0VHR6YkJMWVds?=
 =?utf-8?B?eVZnd2V5NW1xRzkvMFBpZG1wekE4TjRwSitRay9aVzRrczUycllQK09zdmxG?=
 =?utf-8?B?NkRoVFVYNlpQMVNTMy9BWkVJQ1d6MkliZStOK3RaRXAxaWNVSEFKem8vajRh?=
 =?utf-8?B?NGVZbmNZMmM2d0MzU0h4WlorbDhLT0Z3bmtDRGJKZTZ5bEZmeTNyS1N1Vlgr?=
 =?utf-8?B?WjZ5WGRLZDcvNWkxcWVVb2FRQmk1anlaZ1gzeUQ1STN2TFpZYzZxY3U4T3dB?=
 =?utf-8?B?YTVGckhLcng2dmFnb2hUamxxdUxKbnByUHc2SzMxeUg2K2REZnBLTFA3cFhj?=
 =?utf-8?B?TW9WSU04RGgxY3g4NjY2UkFsTW9uakZvT0ZhZFdLanN5OUVmWWU5YW9HeVV0?=
 =?utf-8?B?RVh6RmlMUHMrTkl0NjZoMCttdUdUaVYyNWVienVnUkJvMXpQa3lPSHpsM0hs?=
 =?utf-8?B?UVJJOHhOWDJNVGx0enpsUHpva0RPKzRSQnBMZmF5VklVUHFjUXlKV2xNbWRY?=
 =?utf-8?B?enNoRkFzM2d0ZldzNUJCSVpURlNNcEJ4NnMzelN2N2lxVEUyOHJGRFhDb3hC?=
 =?utf-8?B?UWc4Nnk3bURUdkttWCtScWQxYURoNVpjRDFnM01HenY3c3hWZVhQd3pQQlZ3?=
 =?utf-8?B?eEdEOHZiK2FsTjJxb25XWSthdVFQWmxxOGlVVzlMcTI4eGliR084NEl6Zllj?=
 =?utf-8?B?YTI3cy9DQzd1YzZ1RXFKaXFtQkZmOU5OdnRwQ0Y0Tzg4ano3SEdzQUhYNi8w?=
 =?utf-8?B?NXBTbjlaRGRrQkhzRUgwdzBUMzJsVnRNbHVHY3E1YUFBRmdxVmM0VDQzUDNP?=
 =?utf-8?B?RWdsNTAvdUFER3RpR29Vc2ZjUlhPTDVraEpjNzFkWU90dVhLUVpxdmNIS2dC?=
 =?utf-8?B?WEFSbll2WW1WdllMMGM5ZmRBVVA1R21tak5QeWw4YitTM3B5R1FieGlMS3Zk?=
 =?utf-8?B?SWQrakJ0akRkQTFjRE9iTER4R3M4YTRGYldOY05yZnJJWlZGSXRsU3BBd0VM?=
 =?utf-8?B?VHA0eFN2QXRTbHRLODBWaDArUmU1QmJHdTB2bEdHRDlsdmMwQXFTT0Y0ejdv?=
 =?utf-8?B?Mm03a3hpYm1MbWJwaTd4N3BNdXZLNFVMNEZhamZWMk9FWVJrNDI0SGMraGx4?=
 =?utf-8?B?SFNXWGVxcDFBVDFXY2VtZWtsd0Vyc213Rm02MENKNzgzMlV5a3lyTVkyOCt2?=
 =?utf-8?B?STd1bFhHM0dPNFJwd0MyTXRjWUpxRGJVWG5qNWwvMmhqeDJKQW81MDh6M1BR?=
 =?utf-8?B?bnJDelBhOHg1eDdVYVczeGozMGZmNGNOTDE0VWIvNVFzVXYwc0lxVWFPY05P?=
 =?utf-8?Q?IBwqTIxMutvW1kaYLNbaU2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC791CCDFF248741B788C40B9E44ABD6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4718e261-563d-41a5-fcd9-08da5d8cab3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 07:13:17.5830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/u0uLbz8J/g4pLp2QqFr69Yzq3cTy1LzRGdrJV/JxaTaQQFekje/G9zOIzF5YZMBTDoZYLP4zUij/0CsDiAWrBxhhVb4GBuR49yL1LPGvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2561
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMDg6MzksIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gSW5zdGVhZCBvZiBoaWdoX21lbW9yeSB1c2UgaXNfdm1hbGxvY19hZGRyIHRvIHZhbGlkYXRl
IHRoYXQgdGhlIGFkZHJlc3MgaXMNCj4gbm90IGluIHRoZSB2bWFsbG9jIHJhbmdlLg0KDQoNCkRv
IHdlIHJlYWxseSBuZWVkIGV2ZW4gbW9yZSBleHRyYSBjaGVja3MsIGFuZCBhIGZ1bmN0aW9uIHRo
YXQgaXMgbm90IA0KaW5saW5lZCBhbnltb3JlID8NCg0KdmlydF9hZGRyX3ZhbGlkKCkgdXNlZCB0
byBiZSBwcmV0dHkgc2ltcGxlLiBTb21lIGV4dHJhIHRlc3RzIHdlcmUgYWRkZWQgDQpieSBjb21t
aXQgZmZhMGI2NGUzYmU1ICgicG93ZXJwYzogRml4IHZpcnRfYWRkcl92YWxpZCgpIGZvciA2NC1i
aXQgDQpCb29rM0UgJiAzMi1iaXQiKSBpbiBvcmRlciB0byB3b3JrIGFyb3VuZCBzb21lIGNvcm5l
ciBjYXNlcywgYW5kIHRoZSANCmNvbW1pdCBtZXNzYWdlIHNheSB0aGV5IGFyZSB0ZW1wb3Jhcnku
DQoNCnZpcnRfYWRkcl92YWxpZCgpIGlzIHRoZXJlIHRvIGNoZWNrIHRoYXQgYW4gYWRkcmVzcyBp
cyBhIHZhbGlkIGxpbmVhciANCm1hcHBpbmcsIG5vdCB0aGF0IGFuIGFkZHJlc3MgSVMgTk9UIGEg
dm1hbGxvYyBhZGRyZXNzLiBXaGF0IHdpbGwgaGFwcGVuIA0Kd2l0aCB5b3VyIGNoZWNrIGlmIHlv
dSBwYXNzIGFuIGFkZHJlc3MgdGhhdCBpcyBmcm9tIGFuIGlvcmVtYXAgZG9uZSANCnByaW9yIHRv
IHRoZSBzdGFydCBvZiB0aGUgdm1hbGxvYyBzeXN0ZW0gPw0KDQpXSXRoIHRoZSBzZXJpZXMgSSBz
ZW5kIGxhc3Qgd2VlayB0byBhZGQgS0FTQU4gdG8gYm9vazNlLzY0LCB3ZSBub3cgaGF2ZSANClZN
QUxMT0MgYWJvdmUgUEFHRV9PRkZTRVQgb24gYWxsIHBsYXRmb3JtcyBzbyB3ZSBzaG91bGQgYmUg
YWJsZSB0byBjb21lIA0KYmFjayB0byB0aGUgb3JpZ2luYWwgdmlydF9hZGRyX3ZhbGlkKCksIGJh
c2VkIGV4Y2x1c2l2ZWx5IG9uIHBmbl92YWxpZCgpIA0KZm9yIFBQQzY0LCBhbmQgcGZuX3ZhbGlk
KCkgJiYgaGlnaF9tZW1vcnkgZm9yIFBQQzMyIChPciBtYXliZSBvbmx5IGZvciANClBQQzMyIGhh
dmluZyBISUdITUVNKQ0KDQoNCkNocmlzdG9waGUNCg0KDQo+IA0KPiBDYzogS2VmZW5nIFdhbmcg
PHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPg0KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggS3VtYXIg
Sy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4NCj4gLQ0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGFnZS5oIHwgMTAgKysrKy0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9tbS9tZW0uYyAgICAgICAgICAgfCAxMSArKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3BhZ2UuaA0KPiBpbmRleCBlNWY3NWM3MGVkYTguLjk3NzgzNTU3MGRiMyAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vcGFnZS5oDQo+IEBAIC0xMzEsMTIgKzEzMSwxMCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgcGZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgcGZuKQ0KPiAgICNkZWZpbmUgdmlydF90b19w
Zm4oa2FkZHIpCShfX3BhKGthZGRyKSA+PiBQQUdFX1NISUZUKQ0KPiAgICNkZWZpbmUgdmlydF90
b19wYWdlKGthZGRyKQlwZm5fdG9fcGFnZSh2aXJ0X3RvX3BmbihrYWRkcikpDQo+ICAgI2RlZmlu
ZSBwZm5fdG9fa2FkZHIocGZuKQlfX3ZhKChwZm4pIDw8IFBBR0VfU0hJRlQpDQo+IC0NCj4gLSNk
ZWZpbmUgdmlydF9hZGRyX3ZhbGlkKHZhZGRyKQkoewkJCQkJXA0KPiAtCXVuc2lnbmVkIGxvbmcg
X2FkZHIgPSAodW5zaWduZWQgbG9uZyl2YWRkcjsJCQlcDQo+IC0JX2FkZHIgPj0gUEFHRV9PRkZT
RVQgJiYgX2FkZHIgPCAodW5zaWduZWQgbG9uZyloaWdoX21lbW9yeSAmJglcDQo+IC0JcGZuX3Zh
bGlkKHZpcnRfdG9fcGZuKF9hZGRyKSk7CQkJCQlcDQo+IC19KQ0KPiArI2lmbmRlZiBfX0FTU0VN
QkxZX18NCj4gK2V4dGVybiBib29sIF9fdmlydF9hZGRyX3ZhbGlkKHVuc2lnbmVkIGxvbmcga2Fk
ZHIpOw0KPiArI2VuZGlmDQo+ICsjZGVmaW5lIHZpcnRfYWRkcl92YWxpZChrYWRkcikJX192aXJ0
X2FkZHJfdmFsaWQoKHVuc2lnbmVkIGxvbmcpIChrYWRkcikpDQo+ICAgDQo+ICAgLyoNCj4gICAg
KiBPbiBCb29rLUUgcGFydHMgd2UgbmVlZCBfX3ZhIHRvIHBhcnNlIHRoZSBkZXZpY2UgdHJlZSBh
bmQgd2UgY2FuJ3QNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9tZW0uYyBiL2FyY2gv
cG93ZXJwYy9tbS9tZW0uYw0KPiBpbmRleCA3YjBkMjg2YmY5YmEuLjYyMmY4YmFjODA4YiAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL21lbS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9tZW0uYw0KPiBAQCAtNDA2LDMgKzQwNiwxNCBAQCBpbnQgZGV2bWVtX2lzX2FsbG93ZWQodW5z
aWduZWQgbG9uZyBwZm4pDQo+ICAgICogdGhlIEVIRUEgZHJpdmVyLiBEcm9wIHRoaXMgd2hlbiBk
cml2ZXJzL25ldC9ldGhlcm5ldC9pYm0vZWhlYSBpcyByZW1vdmVkLg0KPiAgICAqLw0KPiAgIEVY
UE9SVF9TWU1CT0xfR1BMKHdhbGtfc3lzdGVtX3JhbV9yYW5nZSk7DQo+ICsNCj4gK2Jvb2wgX192
aXJ0X2FkZHJfdmFsaWQodW5zaWduZWQgbG9uZyBrYWRkcikNCj4gK3sNCj4gKwlpZiAoa2FkZHIg
PCBQQUdFX09GRlNFVCkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCWlmIChpc192bWFsbG9jX2Fk
ZHIoKHZvaWQgKikga2FkZHIpKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJcmV0dXJuIHBmbl92
YWxpZCh2aXJ0X3RvX3BmbihrYWRkcikpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChfX3ZpcnRf
YWRkcl92YWxpZCk7DQo+ICs=
