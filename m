Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E4868980
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 08:04:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BlyoWBeV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkT484lt2z3cTT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BlyoWBeV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkT3N0ZxWz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 18:03:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN5sGN1Tk5IEFvMLiP7CqxnpU9bm0/bbFxwUSaBynHA7H0E3V5QDjjFT+u5jBqXsDpC8ZlpxT/bTjTM7LTQv61HhwpCtk882jvyPYj8UA2//bFXIVTPTBPGtfs7Aw67iKnQI64tlD4J84uUfSv6CgaweaEY8XzR5BlS9Cmyps6aBqKdhmCDPu06KriE71SKaBQa7ZCGa8jrArOOiMqvce9QIfyd9nMazMq+fIUxLcnA7Sj/jZpwk5L2F4997HZnOkEk7jrXUQ6hA4qvGIWWW688eUgL/eLBiIi91boFie7i7xDczoEDCmsWADUZDVepRR2WD1hLwqmBOUV+z8Dg5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9L1yH4c6j1MRT34x4ye8MOuGrA1sGdt4GPfR27+v57o=;
 b=gt+BD7NWq45SIMBJ8cwM5PFjsRLHbMBZtPidKTbr/EYTKplsdx+ARZdMjokZZt9zoKwuMFZj2NzwFo9V82wXvRclW5p1RIhINvKDLrs8CHLsDekR22qU7e6fA/71w7ROnZYKdKL46HUZeMdBVqmxtAUcID4LPQXYGlD9I3vU5q8DZvbvoHNrERnxB7mvZIJfjiETrSdpu2KS6H+pfxRNJlPIKlEY/PVCQGaXJHEDrPvL/LlBHDd8+bCMmoXfCvbUhHi0ZiIkpY5FtblSr7YJm/JcslZFL3MkaBbO8Fygs0ZuYfwDoODKWgwDr/25O0UiDh1ZBD2np9/LmM8yt6gScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9L1yH4c6j1MRT34x4ye8MOuGrA1sGdt4GPfR27+v57o=;
 b=BlyoWBeVVEskRYu3Fg/m8wURp1iy0tTBWt5OL//r7dNUIYLaBuYKImt179TSJDVyq3nPFMWAZKg3E+zUZQjSSakcbA0fI3HSinYzf/q+31F7fzz6HZ+h9IIB5wdkrmLkArT0Ne3ca38avRDyzfGwk7nOo3r4eDTqhdBX6NqZIT/exVqrCzd98LkqIWRE4l2hT8qxgO8s96pgFIHGfRuz2XRU1i+und5qB0HZXnd6H8rigCMqNKF2BUpPncux7I4bJbttHI2ofrKISvBpQHDpV11ftcuddI+DGkYd1ui9lbpIC/LSoAf+HTdgKqH0hzseuFI8VQ1dI9GjwFHfb0fjwg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2992.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 07:03:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 07:02:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, "Liam.Howlett@oracle.com"
	<Liam.Howlett@oracle.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "keescook@chromium.org"
	<keescook@chromium.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOd3T09DEeJabki6TgRFYbqm47EdxC4A
Date: Tue, 27 Feb 2024 07:02:59 +0000
Message-ID: <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
In-Reply-To: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2992:EE_
x-ms-office365-filtering-correlation-id: 614522f8-0eb3-4aa6-f625-08dc37622214
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vtIVH7RTEk7dbYUCAMHkZfatWni3LmRWwTQ+x/uJe/CuxEAAgmMlkCgDXWS6qzvRpjCtwU1d8/KEqpry78AuOcvYG8bXV4HEZjx+AFIItNy4nDVwL9cwTayEwubasG0s93+7bqcbOiQItOXgVHbdnXswCp3moFADdOPSuwfDWIxMQBuuEhFIdh2wGrxmjGhOaWTOaKaDihODKand5OZy3ZdfUFIjLccopHX1+yYAp91y6cNxMhde2r/sSy0bJ0maeBAMhPVLb8OmIC0f7pqTEuFi1+OUyzlfQBYh7280o/cgJ3vCt2wzv7/uIXTSYM9l6+5hCYYCT7CFN5kO8KfgUsUdnCFEtpKbRiG4rQIbwTWVnlNkn/p6Qnnv1V5C1XzTzZKDJoYrVBqou+RkgtiRzy+kHSJ07c+rU3YlfvaMCfnWIw7xGXxgzWAsXQyG2dzJZKbwBzTaWJpFL1YiXzGGI6J4TxCQiuLfkcSRtCl7O5Xl0JcLx8SiF5wePbJ1NUb1mFq+LMf3qIg2GkkGeQX3JIUWZkMCeqUAb4VqT2zW8f8jG6625ITDwDR5aMQ9U3q00bpJWIybjdCC9ExuK0Twr3JGFb8HBIDay2g/5B/Pz+qmg2crYNQpMihSkkh0rIhquwavDeKnj91j41Q2h9oyN4W/btACKIU/O3xaq+Juqgr4P262oU3M1NseEzeOJjHm/MBPQwRRX5vARlgpKJSzV1lLPNVeoga8bp2+/v626BY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dm5tS1hWeHVsa0Q3R2VaVkhqQ3dNaWIyWitKQnA5QTRQMVZBRG9QWWVzRkFV?=
 =?utf-8?B?Q1JwZ1BqT0hIQ2l0bFVEQUlIL2lQakJTeURhZDNkMVJDS3F6TUI1VzhydVhG?=
 =?utf-8?B?azhoWmxkNHIrYWxqU2VyWVdlTXprdzgrMlRWR05MdzVxTFdhOEszVnhqYWFh?=
 =?utf-8?B?Z2xuRm5VOHVxcHMvS3ltc1VuVHJOVmx2OU1oaG5hMHdzc2FlbythcWxON2dH?=
 =?utf-8?B?TUVwbXRPUzN3VmNpR0JTaGxiNTRiSmJlanlzTTJHSjAyZDlQKzZmckN2cHF3?=
 =?utf-8?B?THNlcDBlTDJ2VEtFM00xYytmTVUzTTdhcEt4UmtaQ0RVZGFkUWx2L041OHVO?=
 =?utf-8?B?RTRKNENLZy95OWpCVldla3lzV1RDa2VTOG0yLzBmOXhUUnNkMGVNQUJwSG96?=
 =?utf-8?B?M1dwcDdBcWE5MlZlbi9MTnRWZW9DcHU0a2Z4U2hsdzhvVFpFZHFJM050TzhS?=
 =?utf-8?B?Q0puSHJrNWNRVVFYaEIrZFhnS1RNT3ROanpzRjFYZjZ0QkJIMGZIQXRteERC?=
 =?utf-8?B?ZVRMcVZVc2RaUlIxbkdVUWtQU3BMQ0tQRjhRU1QyNkNETHQxVDlQZDV0RzVG?=
 =?utf-8?B?WGN0ei92ZmVlcUpUODl1ajMrVWtQR05sOVpETHd3cEFNQUE1ZjFqalFJOGNk?=
 =?utf-8?B?NXVManJidzBGazRSNkppbnZ5UnVwUTJxcDAzUEVucHBYaUR2WENFQjV3eUNJ?=
 =?utf-8?B?eXFsRm1VQVUzTHRQY1EvZUthUWh0SVVkY2p2cjJnUk4ya3JqK21MUjVyK1Ar?=
 =?utf-8?B?YWQySnNFZlo5VUo2Z3IxcmpaS1F2T0JMMjArY3lIZjEvRGF0WG9BMUpscnFz?=
 =?utf-8?B?ZlRCQkt1bVU2Q3ljTFlubnREUDdYV0tnVmlzU3hEK096Vnp3bzRzWk8xRzBo?=
 =?utf-8?B?ek9aQTFKdURWUEp3UXpnQ09Za1lBOWxqR1hOY3RVMS9GWHEvS00rR3IzTTg3?=
 =?utf-8?B?UjNLK1FrdTY4Ulk2OUNsR1lhTFhVSXlmTVBtWS9sMHFLSms4RDNwUzBQdG4w?=
 =?utf-8?B?WVc0YURzdE90TWRwbk53bUxKemUxK1o0djRXK2p4SVVDN0FWZndPUWJ5SFFy?=
 =?utf-8?B?VFRzV2J5ekxMTWRFK2dHaEtRWm9aVWJkaXY3aENTYUJCbDhDc3l4QjhCRm9J?=
 =?utf-8?B?ZVQ0SDdMcUhNcmdIeEozWnhpN001N2krRFdoYzdiYjA5ais1ZVczNENhUjhn?=
 =?utf-8?B?dDZha3RYblM2NS84N0tNZlJPRU9IUEJFU05IV2ZJc2cwZm9oanFia3lkdlhJ?=
 =?utf-8?B?ZWc0bVFxMEVWZXVYQ3Z2K1VtK1V0OWtYVHo0MWpFMkxjWGh4SG42RWt3QnI3?=
 =?utf-8?B?SHlRMGxnd3YzZ3pLbVBISjZSbGRLMmZFQ0wvdXgzb0V5UUtSODZ3NkNIdExm?=
 =?utf-8?B?NjRxZVZSS2VUZEk2aGtLbTVDdmdoeEZoaHdaVnN1cXYwTUduRmdnTzVsQU8z?=
 =?utf-8?B?L0xlT3JiMVNONnNsMjdVa2tKbUIzc1h1NXl2aE5GR1k2clZqbFlxWkcvazha?=
 =?utf-8?B?b3pETEI0T1kxdUhodEw3aXFJcUJJLzlYQVZrSG0vYXFscVB3UVJydGpPRlNa?=
 =?utf-8?B?amZOdHpQMENReUhodkd4K2dSeUpJb0VCdGJ0VS9KTFhyK1RWRFpqZ0ZkVHZz?=
 =?utf-8?B?WkkxOHFiMkhjTWlURk9QaWVKa0NJNldyUVBOM0N4WFFrS3BZOTIvY0JEbjA1?=
 =?utf-8?B?WjZtZ3FrNmQyYWhuVFdxQmpCWG1HWkxORmFCWGJyeWN6VkIxczdFQXdGMjZu?=
 =?utf-8?B?VHhiUlI1SXowMmVHQUN2Z01aVUphbjgwd2k2ZHdOMkVjcFkyK0kyeS9lcllw?=
 =?utf-8?B?UTNINnY1Vjd1SjFzb2YzTzRJZzBNQUpkL2hkQjZrSHBkcFM1eCtscjJzNUFt?=
 =?utf-8?B?NDh3aHp1bk94bWNrVEpkMGFKKzBUVEpscjh0VG04MHZvNFViV0xTT0pENkh4?=
 =?utf-8?B?K0hhSzBxZGh0UFVXKzh1VGoxK1dUaVZySXhobWZsU3JYN1VkS3MvT3Q3ZEdS?=
 =?utf-8?B?R0RZVkVyemxSRjZGL1pTMGFCSG5jaTA3ajVvS1B0N3JBbTljVkhlczB5akwy?=
 =?utf-8?B?ZEQrK1dLOGdYVTNyN2VYZFVPYUxXa1RKbGtuWVp4WjRqaDJLcU9ZTWtGeHRH?=
 =?utf-8?B?MldVSW1zazhTMlZYUTYxWGRTZzBLaEJqckM1L2pnRmNNOXg4d1NRYUZWdVRl?=
 =?utf-8?B?cm9RYVRRdjdoWTVzVzFyckxxMnhCeGV1clpvb21tbDRJUWFVa0dIaUdhLzBr?=
 =?utf-8?B?ZEpoOWRTeVBlb0VXNHRSNjZaVVRBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <777D03F074A6AB42ACB422DD63C1B8C6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 614522f8-0eb3-4aa6-f625-08dc37622214
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 07:02:59.7388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8m0MTwnmXund0FsFEId7kNFWvrkJ7E7GWCtCx2d+qJLoD1DjMfbsMtHByCKwOeDHh2AKtkck2HFebbhf89n1MJbeHWLo2pOTYu11KkQJWl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2992
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzAyLzIwMjQgw6AgMjA6MDksIFJpY2sgRWRnZWNvbWJlIGEgw6ljcml0wqA6DQo+
IEZ1dHVyZSBjaGFuZ2VzIHdpbGwgbmVlZCB0byBhZGQgYSBmaWVsZCB0byBzdHJ1Y3Qgdm1fdW5t
YXBwZWRfYXJlYV9pbmZvLg0KPiBUaGlzIHdvdWxkIGNhdXNlIHRyb3VibGUgZm9yIGFueSBhcmNo
cyB0aGF0IGRvbid0IGluaXRpYWxpemUgdGhlDQo+IHN0cnVjdC4gQ3VycmVudGx5IGV2ZXJ5IHVz
ZXIgc2V0cyBlYWNoIGZpZWxkLCBzbyBpZiBuZXcgZmllbGRzIGFyZQ0KPiBhZGRlZCwgdGhlIGNv
cmUgY29kZSBwYXJzaW5nIHRoZSBzdHJ1Y3Qgd2lsbCBzZWUgZ2FyYmFnZSBpbiB0aGUgbmV3DQo+
IGZpZWxkLg0KPiANCj4gSXQgY291bGQgYmUgcG9zc2libGUgdG8gaW5pdGlhbGl6ZSB0aGUgbmV3
IGZpZWxkIGZvciBlYWNoIGFyY2ggdG8gMCwgYnV0DQo+IGluc3RlYWQgc2ltcGx5IGluaWFsaXpl
IHRoZSBmaWVsZCB3aXRoIGEgQzk5IHN0cnVjdCBpbmlhbGl6aW5nIHN5bnRheC4NCg0KV2h5IGRv
aW5nIGEgZnVsbCBpbml0IG9mIHRoZSBzdHJ1Y3Qgd2hlbiBhbGwgZmllbGRzIGFyZSByZS13cml0
dGVuIGEgZmV3IA0KbGluZXMgYWZ0ZXIgPw0KDQpJZiBJIHRha2UgdGhlIGV4ZW1wbGUgb2YgcG93
ZXJwYyBmdW5jdGlvbiBzbGljZV9maW5kX2FyZWFfYm90dG9tdXAoKToNCg0KCXN0cnVjdCB2bV91
bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCg0KCWluZm8uZmxhZ3MgPSAwOw0KCWluZm8ubGVuZ3Ro
ID0gbGVuOw0KCWluZm8uYWxpZ25fbWFzayA9IFBBR0VfTUFTSyAmICgoMXVsIDw8IHBzaGlmdCkg
LSAxKTsNCglpbmZvLmFsaWduX29mZnNldCA9IDA7DQoNCkZvciBtZSBpdCBsb29rcyBiZXR0ZXIg
dG8ganVzdCBhZGQ6DQoNCglpbmZvLm5ld19maWVsZCA9IDA7IC8qIG9yIHdoYXRldmVyIHZhbHVl
IGl0IG5lZWRzIHRvIGhhdmUgKi8NCg0KQ2hyaXN0b3BoZQ0KDQoNCj4gDQo+IENjOiBsaW51eC1t
bUBrdmFjay5vcmcNCj4gQ2M6IGxpbnV4LWFscGhhQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnDQo+IENjOiBsaW51eC1jc2t5QHZnZXIua2VybmVsLm9yZw0KPiBD
YzogbG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldg0KPiBDYzogbGludXgtbWlwc0B2Z2VyLmtlcm5l
bC5vcmcNCj4gQ2M6IGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4cHBj
LWRldkBsaXN0cy5vemxhYnMub3JnDQo+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZw0K
PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnDQo+IENjOiBzcGFyY2xpbnV4QHZnZXIua2Vy
bmVsLm9yZw0KPiBDYzogeDg2QGtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBLaXJpbGwgQS4g
U2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8zeW5vZ3hjZ29rYzZpNnhvamJ4enp3cWVjdGc0
NzJsYWVzMjR1N2ptdGt0bHhjY2g1ZUBkZnl0cmEzaWEzemMvI3QNCj4gLS0tDQo+IEhpIGFyY2hz
LA0KPiANCj4gRm9yIHNvbWUgY29udGV4dCwgdGhpcyBpcyBwYXJ0IG9mIGEgbGFyZ2VyIHNlcmll
cyB0byBpbXByb3ZlIHNoYWRvdyBzdGFjaw0KPiBndWFyZCBnYXBzLiBJdCBpbnZvbHZlcyBwbHVt
YmluZyBhIG5ldyBmaWVsZCB2aWENCj4gc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mby4gVGhl
IGZpcnN0IHVzZXIgaXMgeDg2LCBidXQgYXJtIGFuZCByaXNjdiBtYXkNCj4gbGlrZWx5IHVzZSBp
dCBhcyB3ZWxsLiBUaGUgY2hhbmdlIGlzIGNvbXBpbGUgdGVzdGVkIG9ubHkgZm9yIG5vbi14ODYg
YnV0DQo+IHNlZW1zIGxpa2UgYSByZWxhdGl2ZWx5IHNhZmUgb25lLg0KPiANCj4gVGhhbmtzLA0K
PiANCj4gUmljaw0KPiANCj4gdjI6DQo+ICAgLSBOZXcgcGF0Y2gNCj4gLS0tDQo+ICAgYXJjaC9h
bHBoYS9rZXJuZWwvb3NmX3N5cy5jICAgICAgfCAyICstDQo+ICAgYXJjaC9hcmMvbW0vbW1hcC5j
ICAgICAgICAgICAgICAgfCAyICstDQo+ICAgYXJjaC9hcm0vbW0vbW1hcC5jICAgICAgICAgICAg
ICAgfCA0ICsrLS0NCj4gICBhcmNoL2Nza3kvYWJpdjEvbW1hcC5jICAgICAgICAgICB8IDIgKy0N
Cj4gICBhcmNoL2xvb25nYXJjaC9tbS9tbWFwLmMgICAgICAgICB8IDIgKy0NCj4gICBhcmNoL21p
cHMvbW0vbW1hcC5jICAgICAgICAgICAgICB8IDIgKy0NCj4gICBhcmNoL3BhcmlzYy9rZXJuZWwv
c3lzX3BhcmlzYy5jICB8IDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2Uu
YyB8IDQgKystLQ0KPiAgIGFyY2gvczM5MC9tbS9odWdldGxicGFnZS5jICAgICAgIHwgNCArKy0t
DQo+ICAgYXJjaC9zMzkwL21tL21tYXAuYyAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gICBhcmNo
L3NoL21tL21tYXAuYyAgICAgICAgICAgICAgICB8IDQgKystLQ0KPiAgIGFyY2gvc3BhcmMva2Vy
bmVsL3N5c19zcGFyY18zMi5jIHwgMiArLQ0KPiAgIGFyY2gvc3BhcmMva2VybmVsL3N5c19zcGFy
Y182NC5jIHwgNCArKy0tDQo+ICAgYXJjaC9zcGFyYy9tbS9odWdldGxicGFnZS5jICAgICAgfCA0
ICsrLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvc3lzX3g4Nl82NC5jICAgICB8IDQgKystLQ0KPiAg
IGFyY2gveDg2L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgIHwgNCArKy0tDQo+ICAgZnMvaHVnZXRs
YmZzL2lub2RlLmMgICAgICAgICAgICAgfCA0ICsrLS0NCj4gICBtbS9tbWFwLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQgKystLQ0KPiAgIDE4IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEva2Vy
bmVsL29zZl9zeXMuYyBiL2FyY2gvYWxwaGEva2VybmVsL29zZl9zeXMuYw0KPiBpbmRleCA1ZGI4
OGI2Mjc0MzkuLmRkNjgwMWJiOTI0MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hbHBoYS9rZXJuZWwv
b3NmX3N5cy5jDQo+ICsrKyBiL2FyY2gvYWxwaGEva2VybmVsL29zZl9zeXMuYw0KPiBAQCAtMTIx
OCw3ICsxMjE4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcNCj4gICBhcmNoX2dldF91bm1hcHBl
ZF9hcmVhXzEodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwNCj4gICAJCSAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbGltaXQpDQo+ICAgew0KPiAtCXN0cnVjdCB2bV91bm1hcHBl
ZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8g
PSB7fTsNCj4gICANCj4gICAJaW5mby5mbGFncyA9IDA7DQo+ICAgCWluZm8ubGVuZ3RoID0gbGVu
Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvbW0vbW1hcC5jIGIvYXJjaC9hcmMvbW0vbW1hcC5j
DQo+IGluZGV4IDNjMWM3YWU3MzI5Mi4uNjU0OWIzMzc1ZjU0IDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FyYy9tbS9tbWFwLmMNCj4gKysrIGIvYXJjaC9hcmMvbW0vbW1hcC5jDQo+IEBAIC0yNyw3ICsy
Nyw3IEBAIGFyY2hfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVk
IGxvbmcgYWRkciwNCj4gICB7DQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+
bW07DQo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0KPiAtCXN0cnVjdCB2bV91bm1h
cHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGlu
Zm8gPSB7fTsNCj4gICANCj4gICAJLyoNCj4gICAJICogV2UgZW5mb3JjZSB0aGUgTUFQX0ZJWEVE
IGNhc2UuDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9tbWFwLmMgYi9hcmNoL2FybS9tbS9t
bWFwLmMNCj4gaW5kZXggYTBmOGEwY2EwNzg4Li41MjU3OTU1NzhjMjkgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvYXJtL21tL21tYXAuYw0KPiArKysgYi9hcmNoL2FybS9tbS9tbWFwLmMNCj4gQEAgLTM0
LDcgKzM0LDcgQEAgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5z
aWduZWQgbG9uZyBhZGRyLA0KPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsNCj4gICAJ
aW50IGRvX2FsaWduID0gMDsNCj4gICAJaW50IGFsaWFzaW5nID0gY2FjaGVfaXNfdmlwdF9hbGlh
c2luZygpOw0KPiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1
Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICANCj4gICAJLyoNCj4gICAJ
ICogV2Ugb25seSBuZWVkIHRvIGRvIGNvbG91ciBhbGlnbm1lbnQgaWYgZWl0aGVyIHRoZSBJIG9y
IEQNCj4gQEAgLTg3LDcgKzg3LDcgQEAgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYV90b3Bkb3duKHN0
cnVjdCBmaWxlICpmaWxwLCBjb25zdCB1bnNpZ25lZCBsb25nIGFkZHIwLA0KPiAgIAl1bnNpZ25l
ZCBsb25nIGFkZHIgPSBhZGRyMDsNCj4gICAJaW50IGRvX2FsaWduID0gMDsNCj4gICAJaW50IGFs
aWFzaW5nID0gY2FjaGVfaXNfdmlwdF9hbGlhc2luZygpOw0KPiAtCXN0cnVjdCB2bV91bm1hcHBl
ZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8g
PSB7fTsNCj4gICANCj4gICAJLyoNCj4gICAJICogV2Ugb25seSBuZWVkIHRvIGRvIGNvbG91ciBh
bGlnbm1lbnQgaWYgZWl0aGVyIHRoZSBJIG9yIEQNCj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9h
Yml2MS9tbWFwLmMgYi9hcmNoL2Nza3kvYWJpdjEvbW1hcC5jDQo+IGluZGV4IDY3OTJhY2E0OTk5
OS4uNzI2NjU5ZDQxZmE5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2Nza3kvYWJpdjEvbW1hcC5jDQo+
ICsrKyBiL2FyY2gvY3NreS9hYml2MS9tbWFwLmMNCj4gQEAgLTI4LDcgKzI4LDcgQEAgYXJjaF9n
ZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLA0K
PiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0KPiAgIAlzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYTsNCj4gICAJaW50IGRvX2FsaWduID0gMDsNCj4gLQlzdHJ1Y3Qgdm1f
dW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5m
byBpbmZvID0ge307DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIFdlIG9ubHkgbmVlZCB0byBkbyBj
b2xvdXIgYWxpZ25tZW50IGlmIGVpdGhlciB0aGUgSSBvciBEDQo+IGRpZmYgLS1naXQgYS9hcmNo
L2xvb25nYXJjaC9tbS9tbWFwLmMgYi9hcmNoL2xvb25nYXJjaC9tbS9tbWFwLmMNCj4gaW5kZXgg
YTk2MzBhODFiMzhhLi42NjRiZjRhYmZkY2YgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbG9vbmdhcmNo
L21tL21tYXAuYw0KPiArKysgYi9hcmNoL2xvb25nYXJjaC9tbS9tbWFwLmMNCj4gQEAgLTI0LDcg
KzI0LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYV9jb21t
b24oc3RydWN0IGZpbGUgKmZpbHAsDQo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0K
PiAgIAl1bnNpZ25lZCBsb25nIGFkZHIgPSBhZGRyMDsNCj4gICAJaW50IGRvX2NvbG9yX2FsaWdu
Ow0KPiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1f
dW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICANCj4gICAJaWYgKHVubGlrZWx5KGxl
biA+IFRBU0tfU0laRSkpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvbWlwcy9tbS9tbWFwLmMgYi9hcmNoL21pcHMvbW0vbW1hcC5jDQo+IGluZGV4IDAwZmU5MGM2
ZGIzZS4uNjMyMWI1M2RjOTk1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL21pcHMvbW0vbW1hcC5jDQo+
ICsrKyBiL2FyY2gvbWlwcy9tbS9tbWFwLmMNCj4gQEAgLTM0LDcgKzM0LDcgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYV9jb21tb24oc3RydWN0IGZpbGUgKmZp
bHAsDQo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0KPiAgIAl1bnNpZ25lZCBsb25n
IGFkZHIgPSBhZGRyMDsNCj4gICAJaW50IGRvX2NvbG9yX2FsaWduOw0KPiAtCXN0cnVjdCB2bV91
bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZv
IGluZm8gPSB7fTsNCj4gICANCj4gICAJaWYgKHVubGlrZWx5KGxlbiA+IFRBU0tfU0laRSkpDQo+
ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2tlcm5lbC9z
eXNfcGFyaXNjLmMgYi9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzX3BhcmlzYy5jDQo+IGluZGV4IDk4
YWY3MTlkNWY4NS4uZTg3YzBlMzI1YWJmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3BhcmlzYy9rZXJu
ZWwvc3lzX3BhcmlzYy5jDQo+ICsrKyBiL2FyY2gvcGFyaXNjL2tlcm5lbC9zeXNfcGFyaXNjLmMN
Cj4gQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBhcmNoX2dldF91bm1h
cHBlZF9hcmVhX2NvbW1vbihzdHJ1Y3QgZmlsZSAqZmlscCwNCj4gICAJc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsICpwcmV2Ow0KPiAgIAl1bnNpZ25lZCBsb25nIGZpbHBfcGdvZmY7DQo+ICAg
CWludCBkb19jb2xvcl9hbGlnbjsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGlu
Zm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgDQo+
ICAgCWlmICh1bmxpa2VseShsZW4gPiBUQVNLX1NJWkUpKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2UuYyBiL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9zbGljZS5jDQo+IGluZGV4IGMwYjU4YWZiOWE0Ny4uNTg4NGYz
ODQ4NjZmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2UuYw0K
PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2UuYw0KPiBAQCAtMjgyLDcgKzI4
Miw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNsaWNlX2ZpbmRfYXJlYV9ib3R0b211cChzdHJ1
Y3QgbW1fc3RydWN0ICptbSwNCj4gICB7DQo+ICAgCWludCBwc2hpZnQgPSBtYXhfdChpbnQsIG1t
dV9wc2l6ZV9kZWZzW3BzaXplXS5zaGlmdCwgUEFHRV9TSElGVCk7DQo+ICAgCXVuc2lnbmVkIGxv
bmcgZm91bmQsIG5leHRfZW5kOw0KPiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5m
bzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICANCj4g
ICAJaW5mby5mbGFncyA9IDA7DQo+ICAgCWluZm8ubGVuZ3RoID0gbGVuOw0KPiBAQCAtMzI2LDcg
KzMyNiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNsaWNlX2ZpbmRfYXJlYV90b3Bkb3duKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIHsNCj4gICAJaW50IHBzaGlmdCA9IG1heF90KGludCwg
bW11X3BzaXplX2RlZnNbcHNpemVdLnNoaWZ0LCBQQUdFX1NISUZUKTsNCj4gICAJdW5zaWduZWQg
bG9uZyBmb3VuZCwgcHJldjsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87
DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgCXVuc2ln
bmVkIGxvbmcgbWluX2FkZHIgPSBtYXgoUEFHRV9TSVpFLCBtbWFwX21pbl9hZGRyKTsNCj4gICAN
Cj4gICAJaW5mby5mbGFncyA9IFZNX1VOTUFQUEVEX0FSRUFfVE9QRE9XTjsNCj4gZGlmZiAtLWdp
dCBhL2FyY2gvczM5MC9tbS9odWdldGxicGFnZS5jIGIvYXJjaC9zMzkwL21tL2h1Z2V0bGJwYWdl
LmMNCj4gaW5kZXggYzJkMjg1MGVjOGQ1Li43ZjY4NDg1ZmVlYTAgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvczM5MC9tbS9odWdldGxicGFnZS5jDQo+ICsrKyBiL2FyY2gvczM5MC9tbS9odWdldGxicGFn
ZS5jDQo+IEBAIC0yNTgsNyArMjU4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaHVnZXRsYl9n
ZXRfdW5tYXBwZWRfYXJlYV9ib3R0b211cChzdHJ1Y3QgZmlsZSAqZmlsZSwNCj4gICAJCXVuc2ln
bmVkIGxvbmcgcGdvZmYsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+ICAgew0KPiAgIAlzdHJ1Y3Qg
aHN0YXRlICpoID0gaHN0YXRlX2ZpbGUoZmlsZSk7DQo+IC0Jc3RydWN0IHZtX3VubWFwcGVkX2Fy
ZWFfaW5mbyBpbmZvOw0KPiArCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbyA9IHt9
Ow0KPiAgIA0KPiAgIAlpbmZvLmZsYWdzID0gMDsNCj4gICAJaW5mby5sZW5ndGggPSBsZW47DQo+
IEBAIC0yNzQsNyArMjc0LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaHVnZXRsYl9nZXRfdW5t
YXBwZWRfYXJlYV90b3Bkb3duKHN0cnVjdCBmaWxlICpmaWxlLA0KPiAgIAkJdW5zaWduZWQgbG9u
ZyBwZ29mZiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICB7DQo+ICAgCXN0cnVjdCBoc3RhdGUg
KmggPSBoc3RhdGVfZmlsZShmaWxlKTsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZv
IGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAg
CXVuc2lnbmVkIGxvbmcgYWRkcjsNCj4gICANCj4gICAJaW5mby5mbGFncyA9IFZNX1VOTUFQUEVE
X0FSRUFfVE9QRE9XTjsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9tbS9tbWFwLmMgYi9hcmNo
L3MzOTAvbW0vbW1hcC5jDQo+IGluZGV4IGNkNTJkNzJiNTljZi4uZGY4ODQ5NmUyOTAzIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3MzOTAvbW0vbW1hcC5jDQo+ICsrKyBiL2FyY2gvczM5MC9tbS9tbWFw
LmMNCj4gQEAgLTc3LDcgKzc3LDcgQEAgdW5zaWduZWQgbG9uZyBhcmNoX2dldF91bm1hcHBlZF9h
cmVhKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgew0KPiAgIAlz
dHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0KPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYTsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJ
c3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgDQo+ICAgCWlmIChs
ZW4gPiBUQVNLX1NJWkUgLSBtbWFwX21pbl9hZGRyKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+
IEBAIC0xMTYsNyArMTE2LDcgQEAgdW5zaWduZWQgbG9uZyBhcmNoX2dldF91bm1hcHBlZF9hcmVh
X3RvcGRvd24oc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWQNCj4gICB7DQo+ICAg
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0KPiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9
IGN1cnJlbnQtPm1tOw0KPiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4g
KwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICANCj4gICAJLyog
cmVxdWVzdGVkIGxlbmd0aCB0b28gYmlnIGZvciBlbnRpcmUgYWRkcmVzcyBzcGFjZSAqLw0KPiAg
IAlpZiAobGVuID4gVEFTS19TSVpFIC0gbW1hcF9taW5fYWRkcikNCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvc2gvbW0vbW1hcC5jIGIvYXJjaC9zaC9tbS9tbWFwLmMNCj4gaW5kZXggYjgyMTk5ODc4YjQ1
Li42YWVlNWY3NjFlMDggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvc2gvbW0vbW1hcC5jDQo+ICsrKyBi
L2FyY2gvc2gvbW0vbW1hcC5jDQo+IEBAIC01Nyw3ICs1Nyw3IEBAIHVuc2lnbmVkIGxvbmcgYXJj
aF9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRy
LA0KPiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0KPiAgIAlzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYTsNCj4gICAJaW50IGRvX2NvbG91cl9hbGlnbjsNCj4gLQlzdHJ1
Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2Fy
ZWFfaW5mbyBpbmZvID0ge307DQo+ICAgDQo+ICAgCWlmIChmbGFncyAmIE1BUF9GSVhFRCkgew0K
PiAgIAkJLyogV2UgZG8gbm90IGFjY2VwdCBhIHNoYXJlZCBtYXBwaW5nIGlmIGl0IHdvdWxkIHZp
b2xhdGUNCj4gQEAgLTEwNiw3ICsxMDYsNyBAQCBhcmNoX2dldF91bm1hcHBlZF9hcmVhX3RvcGRv
d24oc3RydWN0IGZpbGUgKmZpbHAsIGNvbnN0IHVuc2lnbmVkIGxvbmcgYWRkcjAsDQo+ICAgCXN0
cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07DQo+ICAgCXVuc2lnbmVkIGxvbmcgYWRk
ciA9IGFkZHIwOw0KPiAgIAlpbnQgZG9fY29sb3VyX2FsaWduOw0KPiAtCXN0cnVjdCB2bV91bm1h
cHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGlu
Zm8gPSB7fTsNCj4gICANCj4gICAJaWYgKGZsYWdzICYgTUFQX0ZJWEVEKSB7DQo+ICAgCQkvKiBX
ZSBkbyBub3QgYWNjZXB0IGEgc2hhcmVkIG1hcHBpbmcgaWYgaXQgd291bGQgdmlvbGF0ZQ0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9rZXJuZWwvc3lzX3NwYXJjXzMyLmMgYi9hcmNoL3NwYXJj
L2tlcm5lbC9zeXNfc3BhcmNfMzIuYw0KPiBpbmRleCAwODJhNTUxODk3ZWQuLjdlNzgxZGJmZDA1
MiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zcGFyYy9rZXJuZWwvc3lzX3NwYXJjXzMyLmMNCj4gKysr
IGIvYXJjaC9zcGFyYy9rZXJuZWwvc3lzX3NwYXJjXzMyLmMNCj4gQEAgLTQxLDcgKzQxLDcgQEAg
U1lTQ0FMTF9ERUZJTkUwKGdldHBhZ2VzaXplKQ0KPiAgIA0KPiAgIHVuc2lnbmVkIGxvbmcgYXJj
aF9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRy
LCB1bnNpZ25lZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwgdW5zaWduZWQgbG9uZyBm
bGFncykNCj4gICB7DQo+IC0Jc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvOw0KPiAr
CXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbyA9IHt9Ow0KPiAgIA0KPiAgIAlpZiAo
ZmxhZ3MgJiBNQVBfRklYRUQpIHsNCj4gICAJCS8qIFdlIGRvIG5vdCBhY2NlcHQgYSBzaGFyZWQg
bWFwcGluZyBpZiBpdCB3b3VsZCB2aW9sYXRlDQo+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL2tl
cm5lbC9zeXNfc3BhcmNfNjQuYyBiL2FyY2gvc3BhcmMva2VybmVsL3N5c19zcGFyY182NC5jDQo+
IGluZGV4IDFkYmY3MjExNjY2ZS4uZmM0OGFiM2Y4M2FmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Nw
YXJjL2tlcm5lbC9zeXNfc3BhcmNfNjQuYw0KPiArKysgYi9hcmNoL3NwYXJjL2tlcm5lbC9zeXNf
c3BhcmNfNjQuYw0KPiBAQCAtOTMsNyArOTMsNyBAQCB1bnNpZ25lZCBsb25nIGFyY2hfZ2V0X3Vu
bWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaQ0K
PiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiB2bWE7DQo+ICAgCXVuc2lnbmVkIGxvbmcgdGFz
a19zaXplID0gVEFTS19TSVpFOw0KPiAgIAlpbnQgZG9fY29sb3JfYWxpZ247DQo+IC0Jc3RydWN0
IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvOw0KPiArCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVh
X2luZm8gaW5mbyA9IHt9Ow0KPiAgIA0KPiAgIAlpZiAoZmxhZ3MgJiBNQVBfRklYRUQpIHsNCj4g
ICAJCS8qIFdlIGRvIG5vdCBhY2NlcHQgYSBzaGFyZWQgbWFwcGluZyBpZiBpdCB3b3VsZCB2aW9s
YXRlDQo+IEBAIC0xNTQsNyArMTU0LDcgQEAgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYV90b3Bkb3du
KHN0cnVjdCBmaWxlICpmaWxwLCBjb25zdCB1bnNpZ25lZCBsb25nIGFkZHIwLA0KPiAgIAl1bnNp
Z25lZCBsb25nIHRhc2tfc2l6ZSA9IFNUQUNLX1RPUDMyOw0KPiAgIAl1bnNpZ25lZCBsb25nIGFk
ZHIgPSBhZGRyMDsNCj4gICAJaW50IGRvX2NvbG9yX2FsaWduOw0KPiAtCXN0cnVjdCB2bV91bm1h
cHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGlu
Zm8gPSB7fTsNCj4gICANCj4gICAJLyogVGhpcyBzaG91bGQgb25seSBldmVyIHJ1biBmb3IgMzIt
Yml0IHByb2Nlc3Nlcy4gICovDQo+ICAgCUJVR19PTighdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJC
SVQpKTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvbW0vaHVnZXRsYnBhZ2UuYyBiL2FyY2gv
c3BhcmMvbW0vaHVnZXRsYnBhZ2UuYw0KPiBpbmRleCAzOGExYmVmNDdlZmIuLjYxNGUyYzQ2ZDc4
MSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zcGFyYy9tbS9odWdldGxicGFnZS5jDQo+ICsrKyBiL2Fy
Y2gvc3BhcmMvbW0vaHVnZXRsYnBhZ2UuYw0KPiBAQCAtMzEsNyArMzEsNyBAQCBzdGF0aWMgdW5z
aWduZWQgbG9uZyBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhX2JvdHRvbXVwKHN0cnVjdCBmaWxl
ICpmaWxwLA0KPiAgIHsNCj4gICAJc3RydWN0IGhzdGF0ZSAqaCA9IGhzdGF0ZV9maWxlKGZpbHAp
Ow0KPiAgIAl1bnNpZ25lZCBsb25nIHRhc2tfc2l6ZSA9IFRBU0tfU0laRTsNCj4gLQlzdHJ1Y3Qg
dm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFf
aW5mbyBpbmZvID0ge307DQo+ICAgDQo+ICAgCWlmICh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJ
VCkpDQo+ICAgCQl0YXNrX3NpemUgPSBTVEFDS19UT1AzMjsNCj4gQEAgLTYzLDcgKzYzLDcgQEAg
aHVnZXRsYl9nZXRfdW5tYXBwZWRfYXJlYV90b3Bkb3duKHN0cnVjdCBmaWxlICpmaWxwLCBjb25z
dCB1bnNpZ25lZCBsb25nIGFkZHIwLA0KPiAgIAlzdHJ1Y3QgaHN0YXRlICpoID0gaHN0YXRlX2Zp
bGUoZmlscCk7DQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07DQo+ICAg
CXVuc2lnbmVkIGxvbmcgYWRkciA9IGFkZHIwOw0KPiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVh
X2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsN
Cj4gICANCj4gICAJLyogVGhpcyBzaG91bGQgb25seSBldmVyIHJ1biBmb3IgMzItYml0IHByb2Nl
c3Nlcy4gICovDQo+ICAgCUJVR19PTighdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpKTsNCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9zeXNfeDg2XzY0LmMgYi9hcmNoL3g4Ni9rZXJu
ZWwvc3lzX3g4Nl82NC5jDQo+IGluZGV4IGM3ODNhZWIzN2RjZS4uNmU1ZDRmYTVmYzQyIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvc3lzX3g4Nl82NC5jDQo+ICsrKyBiL2FyY2gveDg2
L2tlcm5lbC9zeXNfeDg2XzY0LmMNCj4gQEAgLTEyNSw3ICsxMjUsNyBAQCBhcmNoX2dldF91bm1h
cHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgew0K
PiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0KPiAgIAlzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYTsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87
DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgCXVuc2ln
bmVkIGxvbmcgYmVnaW4sIGVuZDsNCj4gICANCj4gICAJaWYgKGZsYWdzICYgTUFQX0ZJWEVEKQ0K
PiBAQCAtMTY1LDcgKzE2NSw3IEBAIGFyY2hfZ2V0X3VubWFwcGVkX2FyZWFfdG9wZG93bihzdHJ1
Y3QgZmlsZSAqZmlscCwgY29uc3QgdW5zaWduZWQgbG9uZyBhZGRyMCwNCj4gICAJc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWE7DQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+
bW07DQo+ICAgCXVuc2lnbmVkIGxvbmcgYWRkciA9IGFkZHIwOw0KPiAtCXN0cnVjdCB2bV91bm1h
cHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGlu
Zm8gPSB7fTsNCj4gICANCj4gICAJLyogcmVxdWVzdGVkIGxlbmd0aCB0b28gYmlnIGZvciBlbnRp
cmUgYWRkcmVzcyBzcGFjZSAqLw0KPiAgIAlpZiAobGVuID4gVEFTS19TSVpFKQ0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvbW0vaHVnZXRsYnBhZ2UuYyBiL2FyY2gveDg2L21tL2h1Z2V0bGJwYWdl
LmMNCj4gaW5kZXggNmQ3N2MwMDM5NjE3Li44ODcyNmJkMWY3MmQgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gveDg2L21tL2h1Z2V0bGJwYWdlLmMNCj4gKysrIGIvYXJjaC94ODYvbW0vaHVnZXRsYnBhZ2Uu
Yw0KPiBAQCAtNTEsNyArNTEsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBodWdldGxiX2dldF91
bm1hcHBlZF9hcmVhX2JvdHRvbXVwKHN0cnVjdCBmaWxlICpmaWxlLA0KPiAgIAkJdW5zaWduZWQg
bG9uZyBwZ29mZiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICB7DQo+ICAgCXN0cnVjdCBoc3Rh
dGUgKmggPSBoc3RhdGVfZmlsZShmaWxlKTsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9p
bmZvIGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+
ICAgDQo+ICAgCWluZm8uZmxhZ3MgPSAwOw0KPiAgIAlpbmZvLmxlbmd0aCA9IGxlbjsNCj4gQEAg
LTc0LDcgKzc0LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaHVnZXRsYl9nZXRfdW5tYXBwZWRf
YXJlYV90b3Bkb3duKHN0cnVjdCBmaWxlICpmaWxlLA0KPiAgIAkJdW5zaWduZWQgbG9uZyBwZ29m
ZiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICB7DQo+ICAgCXN0cnVjdCBoc3RhdGUgKmggPSBo
c3RhdGVfZmlsZShmaWxlKTsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87
DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgDQo+ICAg
CWluZm8uZmxhZ3MgPSBWTV9VTk1BUFBFRF9BUkVBX1RPUERPV047DQo+ICAgCWluZm8ubGVuZ3Ro
ID0gbGVuOw0KPiBkaWZmIC0tZ2l0IGEvZnMvaHVnZXRsYmZzL2lub2RlLmMgYi9mcy9odWdldGxi
ZnMvaW5vZGUuYw0KPiBpbmRleCBhNjNkMmVlZTA4NmYuLjg0OGIyMjM5YTIxNSAxMDA2NDQNCj4g
LS0tIGEvZnMvaHVnZXRsYmZzL2lub2RlLmMNCj4gKysrIGIvZnMvaHVnZXRsYmZzL2lub2RlLmMN
Cj4gQEAgLTE2NSw3ICsxNjUsNyBAQCBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhX2JvdHRvbXVw
KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgCQl1bnNpZ25lZCBs
b25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICB7
DQo+ICAgCXN0cnVjdCBoc3RhdGUgKmggPSBoc3RhdGVfZmlsZShmaWxlKTsNCj4gLQlzdHJ1Y3Qg
dm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJc3RydWN0IHZtX3VubWFwcGVkX2FyZWFf
aW5mbyBpbmZvID0ge307DQo+ICAgDQo+ICAgCWluZm8uZmxhZ3MgPSAwOw0KPiAgIAlpbmZvLmxl
bmd0aCA9IGxlbjsNCj4gQEAgLTE4MSw3ICsxODEsNyBAQCBodWdldGxiX2dldF91bm1hcHBlZF9h
cmVhX3RvcGRvd24oc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gICAJ
CXVuc2lnbmVkIGxvbmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLCB1bnNpZ25lZCBsb25nIGZs
YWdzKQ0KPiAgIHsNCj4gICAJc3RydWN0IGhzdGF0ZSAqaCA9IGhzdGF0ZV9maWxlKGZpbGUpOw0K
PiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5t
YXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICANCj4gICAJaW5mby5mbGFncyA9IFZNX1VO
TUFQUEVEX0FSRUFfVE9QRE9XTjsNCj4gICAJaW5mby5sZW5ndGggPSBsZW47DQo+IGRpZmYgLS1n
aXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggZTAyYmIxN2ZlZjViLi4zM2FmNjgz
YTY0M2YgMTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFwLmMNCj4gQEAg
LTE2OTksNyArMTY5OSw3IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUg
KmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gICB7DQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tID0gY3VycmVudC0+bW07DQo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCAqcHJl
djsNCj4gLQlzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm87DQo+ICsJc3RydWN0IHZt
X3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307DQo+ICAgCWNvbnN0IHVuc2lnbmVkIGxvbmcg
bW1hcF9lbmQgPSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKTsNCj4gICANCj4g
ICAJaWYgKGxlbiA+IG1tYXBfZW5kIC0gbW1hcF9taW5fYWRkcikNCj4gQEAgLTE3NDcsNyArMTc0
Nyw3IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWFfdG9wZG93bihzdHJ1Y3QgZmlsZSAqZmls
cCwgdW5zaWduZWQgbG9uZyBhZGRyLA0KPiAgIHsNCj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsICpwcmV2Ow0KPiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOw0K
PiAtCXN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbzsNCj4gKwlzdHJ1Y3Qgdm1fdW5t
YXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsNCj4gICAJY29uc3QgdW5zaWduZWQgbG9uZyBtbWFw
X2VuZCA9IGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3MpOw0KPiAgIA0KPiAgIAkv
KiByZXF1ZXN0ZWQgbGVuZ3RoIHRvbyBiaWcgZm9yIGVudGlyZSBhZGRyZXNzIHNwYWNlICovDQo=
