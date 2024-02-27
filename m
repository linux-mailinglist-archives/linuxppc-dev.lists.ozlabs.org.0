Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0C869ED5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:17:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QwspIJHI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkm1H49m9z3vb8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 05:17:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QwspIJHI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkm0V5XpNz3cxn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 05:16:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtaP2E1peiog1VZWYLpE3xS5qL4plrvJbeenAvKy03foXkNeizrnMMHOp5stwCljnDXCk/9+mA06LSLaT2o2AbSPwIQUk2MSRRhiNcf2ypEV0t7ee5y7x1Ypi7yLEy4U3w4JU8DRSiX4SjDqJuH13NHqaZ34V96BHfKX3wPu/UTAGmfTegpMfYwUj3jZ3U68uMWkViFJJ//3G/nAToR/UxsU+bqNBmLHRlK8Cc+CT7g8vcJMVyxEMLihDbNMhYJtRk0Ddt9WRRGgjHkQyAVurl/tqjJwOgAZE3RC2/4XFctbgwfLnnJB4sRhzwZa861HaFnqaIZm3pSbMMc4Zj+TeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfYR2LHtgSq+3SxqBT0hyeG1hfvGmqpQHvmAf0JxdbY=;
 b=Z0RF2i+Yj+hKXQEidaa9ltwxYDfegyLqcmBicQyMDXQTaWTxOHrH9X+IQy5yvcOYv8YBpx0yF2LB90RmFXSc/gDXHof9jYDT7kVqwITb9EUKZzeVGaShNNINTn227R3CrrCy7XTjOIunveb5GjphMqUN6ep1tGVmmJ+YenSdVbjbvVhd86qQGL9i2Jwm/0bTUOPcm6Mi1KQ9RutQhZey3ZKGrNqjxsupL3c3qfzxRH8i0fBClh3K5nkbOeszNWgeg0+t4GhkmGRI4/xeP7YuMZnvNH6F8Q19iWfr56vxn0TgfmActKv3e/mJ0A9ZFKVFss0L3f42RDv30a410Dsutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfYR2LHtgSq+3SxqBT0hyeG1hfvGmqpQHvmAf0JxdbY=;
 b=QwspIJHIco++uXd5ZTtTZq7n++9csrzZMcrrHeyGPla7R44kkaI4JaYflJ0NKCUBOsj3+GjYryL/IV+3eJcheOKdDrPNbMjAQTCY9IW9MyAezHzgc015y0BUoMTvVHIaRvcZ7SgYetk1idbEodra9zLrWXa/qsKx+wytykvp8O9dB0DwLOtP4JaQ4RC3+saAYxHF+rXV5GfKfzipoRAuG3MIExo0/koAizBp8w45qHFDmHSwUchMg2F3nrHyMkTM2J6u61h1FUHW1lpN/RMQBdvsQjr6SEdMl4QTw+cNY09O29pZCvO4wf+Lf4JySY3GNItBPhKtHFnVLEAMNNTJbg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3772.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:143::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 18:16:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 18:16:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOd3T09DEeJabki6TgRFYbqm47EdxC4AgAC5pgCAAAKNAA==
Date: Tue, 27 Feb 2024 18:16:35 +0000
Message-ID: <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
In-Reply-To: <202402271004.7145FDB53F@keescook>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3772:EE_
x-ms-office365-filtering-correlation-id: e06f12f8-e141-43c7-ddb1-08dc37c03b8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EC/T7eCKTwHTFTyH+z0RriHcqNXWhFZZB09dog2ZmftRnVF3PjmvDuj9rezHAnA/S63B1WXvGMZKcrUtBGZhIaX4EuNSrpJLp/WfLTTJ51cL+P7/ZzU0fzT2k2znPe9dfQsEHNY/NxcBRv6J6P3fn26ogXJ0w3LACQIJDsdDe7C8BW1AjvaumW/v+RmrH6twZPQO/fOCsE8NdPo27hdCHPgANm9JKw8aYIC1MQJ/B0aanWFNHIv+cYIOLTIaTgKXljq4JG6OH9sBX0H2SfUoJydr2MI3Z7Ng4fmWyqfxOtzRPCehqpfCd3a+dlwR2dedZdV/A4Nx1SMU8t+FywF3LsKQh5kwJTS+IsgBPEBw+wqjRFul0ysa2mUOw8eNKaTVPAgAhcjVhOoGxcZsR23CsihgLcgkKntdcxezHr7Bj/ea2ylmbgRYB0p1HO/V1YAMB1LCKlIQOM+pQSqYNbdOI7E8+2f8XfJOeMNP4r1Yj1SCfh7GADcfEptDgPp4EHRuKrUSZgcaEMloRVn+Z6EJlw4LXVWZ6z63/6u9ShQ/n4eOqAMgKWrZTw/D3g8RlaYiH1CvtV1W0hzL4kNiiI3FxXg2uqnyFh25YTBIYBfpZzF3G28Y4BtqmS36QOzmd54zts6hE2lJKs1SX0UiNA7JDg9novFE75sap6DFisoZt4RCKDhCXIjNTze8n/MU598pnXPS7SO9S6oqB/Uu3ItjEO58oJyy2aTWccLf+K448xY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NUlaNFZqd3NUT2FnazBGdGhrcUU1anFWR3c5UXJPRnBJVTRGRWEvTW1Sa2Fq?=
 =?utf-8?B?WjNSUVIxdjQ4YXV4RlRkc2xxNm9ibC9MTlF5RVV5TTFNMGNjZGRvMzYzYWxW?=
 =?utf-8?B?cU9EM1pSWTNuL0I1ZGZiYU5XRjV2Rm9NbGJ6cUJFU21Qd3N5a2NWY3pzY2lt?=
 =?utf-8?B?TjE2bFRFY0JrTGJIZXU4RzdDdjg5S0RyaUxUOEo0eUV0c29oM2V0RlhkK0Fw?=
 =?utf-8?B?WTlwNHdCTlpqaXJYSnhidTc4VnJha3A2QnY5NG8yYmJKTktLRE9pUWZheGNV?=
 =?utf-8?B?RjY5dy92ZWRrMVRBdVhHd2V5d2orSjYrckRzVUtOT3JDV3AweTloRTIzL21H?=
 =?utf-8?B?Yi9lUi80WWdseitZR3A4LzFGdUt5cXIwTmJDanYvOCt3bGxqS3FMcDZEdHc4?=
 =?utf-8?B?RlVhc29UbUJ2cFJkMlBPbFo2TnQ1Q0RoeW1obHdSR21WNlVkd1lVUE9GczVR?=
 =?utf-8?B?SE1jMjAxc1lMZzIzUjMyQ2lFRE1zMDc4bUIwWVZXZXA0VnZTNG1FWC8xY24z?=
 =?utf-8?B?ZkFPb3FmQWpKdzgzVWZaZjVEYzVqNVU0M2tJQ3h0d0RWTEN3M1duY01pSS9i?=
 =?utf-8?B?Vk5OT2ZUL01JaEVSKzRSS0dUdm1IMU9Vc3E1MEhhdjhFQlNsT1R1YkU1Zm1V?=
 =?utf-8?B?TFBrTk8ra21WcTZXTlRLZjU0ZnV1U0JOa3AwdHlGMnQxZkFTUnNUdHkvSUJB?=
 =?utf-8?B?VzZGMTF5WjZ5WGM2bHJSSjRrTnZBUTE1RVVwcXg5R3VYWVAwYVVLNnFYbmNY?=
 =?utf-8?B?NXVHZ2ptUy9VWkZhNTgwU3Z2aW1GVmp3dFhxdEx6cXVHTW0xbkZUMW1ZVEZr?=
 =?utf-8?B?Mi9OUFJ0Q1Z1NytlQTROTXdmamhhOWNrd01OK2dIdXFiZDQvYXp6YXViYzhx?=
 =?utf-8?B?Yk1SN0pMNDU5aDB1S0Z3QjkySlN4UExpelpEY3NiSDk5YmlBZUJ3dWFCNWYz?=
 =?utf-8?B?Sy8yNVpBMW41YW56aU9wdEpQS004OTl2SUFqeTVkcmladjlXd2RIUTJRbS81?=
 =?utf-8?B?VFVFMG9UVGxDSU45Y3FDN1VCY3R1aWZmS1djOUxrQWd4eEFoZmFQejVMelV4?=
 =?utf-8?B?c1VoRjFzSXFWTW1pTnNranZSbkR6RGtDSDV0MFk2cWFLK09DUllKcTdWWWpy?=
 =?utf-8?B?L29JMmpmejFqNmtyZmdBeXZNWWMzVGgrSS90bVFJbXV5T0tpS1p3Z3hPd291?=
 =?utf-8?B?MU51UUNvRTR3WUJnMzZHY1IzOVY0aFdldU1xOTZNSHZ0WWYwdkt0Ty9hUWpu?=
 =?utf-8?B?SHhFM0ZhblhMdWhHQVNwZEVLY0VxM29FZXBFSkY5RXFPK1duNnJTVlUwQVVl?=
 =?utf-8?B?UkdLeVduQVlCTnpYdWFTSVg1dUtRZFllMllxV1JiZGpoczNya2s4RnZ2K3FY?=
 =?utf-8?B?QnVNMkRtQUtsaExEbDRMQXJ4eStwTTMrcHRXRnRTS05id3J5aHNmdHpndnJE?=
 =?utf-8?B?WS9EWnlZTmRHajNKOGlvNnFtUUpvUytLc2xYWStLUVRSdGozMlNiaVlGMnV1?=
 =?utf-8?B?RW1kYnI5TGNaY3RSOW5MbHZpUHVad2hGOVRNc2dvK3daZnJaTWt4VE42NEZH?=
 =?utf-8?B?cnBpc3F0N3JkY2xIOWFDUitzWEhYK0E0MDQ3dHpDeVI3czdwdWZrUkVDWTN4?=
 =?utf-8?B?TUE0Y0V1NkdOK2c2VWNNVGJ2YWlERnBuVzZLaHlVcWFTNC9EZHo5UnRZYjlT?=
 =?utf-8?B?SHFjZE82bUNodHIyUGlEdHIvODZGUVVjMGZOdnpFTjF6dHI2amtNTCtMZG9W?=
 =?utf-8?B?QkRMQ09hcG4vQTlCM1dPL3BlMUtGTkZ3UHRvODVVeTJOVFM1cVcrNVQ1WHlG?=
 =?utf-8?B?dWl3YVpndmZWWjFoOTE1bWhiZjU0Z0tFbFBTK1I4RTR4b24yUlF2U015TDlH?=
 =?utf-8?B?SmdnL01YT3dLZTJvQzJ1VTNVNWlLbmJiWkxxK2xpbVk0K2tvalpVNEl1a3VI?=
 =?utf-8?B?TThuR3ZCMGNsQmNEbDNVSTR2TTRSMmR0cENqQnNBbkdXTktjL1BQRElJczNI?=
 =?utf-8?B?c0J5aTFpaVRKektjUFJ2L201bzdkZnI3WWxnbktxNlZqZ3R0VE51bXNYclRv?=
 =?utf-8?B?NWVKSHZPdUVMbTlJYllKZWxTYi94emQ2UVNQRDJQejlHMVc4a3JoQmw3Z21a?=
 =?utf-8?B?YUpQLytidGhFdHZKc1B1WGxLa3NwQVRJRmpvK3ZQc1ZDampkMERsRm1xRlVp?=
 =?utf-8?B?c1V5WnBZWGR0Z3JEb1NPRGpCN0RoZi9tc2hRNlFIc29rcDE0Z3ZTUTRwWHR3?=
 =?utf-8?B?ZmtnSEhRaC9GRUdjN3NIN2kvVzFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E287314C521C2C4685917AEFAFA502D4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e06f12f8-e141-43c7-ddb1-08dc37c03b8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 18:16:35.1877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOrkhj1WZNGVDpvOSjNYB2qkeY3QO7W/H/6nyM0rjZCAPYiUPo6ysaEepqVebkPCUgVTdaLZkbrRHvMJpQtWA9gbFj5rdfVX2cOIgp0dGtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3772
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
Cc: "luto@kernel.org" <luto@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug
 @rivosinc.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMTk6MDcsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBPbiBU
dWUsIEZlYiAyNywgMjAyNCBhdCAwNzowMjo1OUFNICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4NCj4+DQo+PiBMZSAyNi8wMi8yMDI0IMOgIDIwOjA5LCBSaWNrIEVkZ2Vjb21iZSBh
IMOpY3JpdMKgOg0KPj4+IEZ1dHVyZSBjaGFuZ2VzIHdpbGwgbmVlZCB0byBhZGQgYSBmaWVsZCB0
byBzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvLg0KPj4+IFRoaXMgd291bGQgY2F1c2UgdHJv
dWJsZSBmb3IgYW55IGFyY2hzIHRoYXQgZG9uJ3QgaW5pdGlhbGl6ZSB0aGUNCj4+PiBzdHJ1Y3Qu
IEN1cnJlbnRseSBldmVyeSB1c2VyIHNldHMgZWFjaCBmaWVsZCwgc28gaWYgbmV3IGZpZWxkcyBh
cmUNCj4+PiBhZGRlZCwgdGhlIGNvcmUgY29kZSBwYXJzaW5nIHRoZSBzdHJ1Y3Qgd2lsbCBzZWUg
Z2FyYmFnZSBpbiB0aGUgbmV3DQo+Pj4gZmllbGQuDQo+Pj4NCj4+PiBJdCBjb3VsZCBiZSBwb3Nz
aWJsZSB0byBpbml0aWFsaXplIHRoZSBuZXcgZmllbGQgZm9yIGVhY2ggYXJjaCB0byAwLCBidXQN
Cj4+PiBpbnN0ZWFkIHNpbXBseSBpbmlhbGl6ZSB0aGUgZmllbGQgd2l0aCBhIEM5OSBzdHJ1Y3Qg
aW5pYWxpemluZyBzeW50YXguDQo+Pg0KPj4gV2h5IGRvaW5nIGEgZnVsbCBpbml0IG9mIHRoZSBz
dHJ1Y3Qgd2hlbiBhbGwgZmllbGRzIGFyZSByZS13cml0dGVuIGEgZmV3DQo+PiBsaW5lcyBhZnRl
ciA/DQo+IA0KPiBJdCdzIGEgbmljZSBjaGFuZ2UgZm9yIHJvYnVzdG5lc3MgYW5kIG1ha2VzIGZ1
dHVyZSBjaGFuZ2VzIGVhc2llci4gSXQncw0KPiBub3QgYWN0dWFsbHkgd2FzdGVmdWwgc2luY2Ug
dGhlIGNvbXBpbGVyIHdpbGwgdGhyb3cgYXdheSBhbGwgcmVkdW5kYW50DQo+IHN0b3Jlcy4NCg0K
V2VsbCwgSSB0ZW5kIHRvIGRpc2xpa2UgZGVmYXVsdCBpbml0IGF0IGRlY2xhcmF0aW9uIGJlY2F1
c2UgaXQgb2Z0ZW4gDQpoaWRlcyBtaXNzZWQgcmVhbCBpbml0LiBXaGVuIGEgZmllbGQgaXMgbm90
IGluaXRpYWxpemVkIEdDQyBzaG91bGQgZW1pdCANCmEgV2FybmluZywgYXQgbGVhc3Qgd2hlbiBi
dWlsdCB3aXRoIFc9MiB3aGljaCBzZXRzIA0KLVdtaXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyA/
DQoNCj4gDQo+PiBJZiBJIHRha2UgdGhlIGV4ZW1wbGUgb2YgcG93ZXJwYyBmdW5jdGlvbiBzbGlj
ZV9maW5kX2FyZWFfYm90dG9tdXAoKToNCj4+DQo+PiAJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFf
aW5mbyBpbmZvOw0KPj4NCj4+IAlpbmZvLmZsYWdzID0gMDsNCj4+IAlpbmZvLmxlbmd0aCA9IGxl
bjsNCj4+IAlpbmZvLmFsaWduX21hc2sgPSBQQUdFX01BU0sgJiAoKDF1bCA8PCBwc2hpZnQpIC0g
MSk7DQo+PiAJaW5mby5hbGlnbl9vZmZzZXQgPSAwOw0KPiANCj4gQnV0IG9uZSBjbGVhbnVwIHRo
YXQgaXMgcG9zc2libGUgZnJvbSBleHBsaWNpdGx5IHplcm8taW5pdGlhbGl6aW5nIHRoZQ0KPiB3
aG9sZSBzdHJ1Y3R1cmUgd291bGQgYmUgZHJvcHBpbmcgYWxsIHRoZSBpbmRpdmlkdWFsICI9IDAi
IGFzc2lnbm1lbnRzLg0KPiA6KQ0KPiANCg0KU3VyZSBpZiB3ZSBkZWNpZGUgdG8gZ28gdGhhdCBk
aXJlY3Rpb24gYWxsIHRob3NlIDAgYXNzaWdubWVudHMgdm9pZC4NCg==
