Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B887A6BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 12:09:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VwyLXDVJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvnns1VpFz3vZP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:09:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VwyLXDVJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvnn83VYWz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 22:08:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUw+RTgBJW7isKlAVwVGnwwX1DBDG3GQDP1D6MG2UWhxGSC9c6O8qlqLbizkJJ/Opn8i+x26adDua1XprIs4MBJ6PsS85HA3WHQmdfDGOIhoW1mDWo5Y9lh/V4nvLRIyfmtLsCtMYA627vfe0JVZEqN77rqr3sWs20wFFHOV5guZAJYQEnKUJR9q6/R1MX6+qanac/XGmlH7odl5l2/lU0w2SPpjUMggBdHnEyiwi872ONXZTMnR4yj+7qfuW58cTD0BY/1hF3N2U7f6/0d37NG5f4T8AHIXJyNo8X2P+bz37buuaYKRDWXw4fLvXtoiG9rkGJMieQEITteCgDKFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekxCclTv6WRGZcecHixLCllEOro/BJTHMTVcRAAhssU=;
 b=ZmK5paM7MW0rpTJ1xZVM5z58eNLLgQAt0pVd832cSPFTVvoMzIL5O3sOT/W3NkzWaKRA5n6CISITTsV/saHZ93YsPcLdYVQyFDU+4p1t02YNZSIGe7JB/dHx82H+y30HejJOwGhjpgAZNckk2ePXsGbDTxTmtyTcshSDWDOY1801EoLLzH0W3K6CdHGhhDpf6fo3ta4Juq+kqKvQmyt93bI4iZKWGUaUbjmDo6WX5pPoc+qYlCuKUFd5nB8NWACBEHwsBuZ4LOAu6Kvc7fFxHlP/G2ID9uJDnEnkwinhRzv3GzvKkc4aPP5hRKtNU1R2zC0yFvy1kj60ifproCyd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekxCclTv6WRGZcecHixLCllEOro/BJTHMTVcRAAhssU=;
 b=VwyLXDVJfE1ncZCaducxL8OrqDIUtWY3mrgWrWlLioPrWqUcyVRif2Hp96xhzZwKC03TPW/x5BDPVK8lB/2aQuwfjfPaFb1rDRRiApH/FrTKwOWujVzD/eyv/YU/xUlhUYK8B368VIMd58GiEgTgv5N/Pqqn0Fr634WRj2mpgjtaB8K7xPbYkWfrLcazDkxXBk4aZJvGcjEAiq3PtxDe61n7Oa6oPdvVbuWA3rv1u4Akqq+pANyIAJn15vDGKbuc6xVqc8KnV8Oiy+YexyioFpEB6Kdo3hSBDVyGIr1rOFzog87MqhIjvTprFACHGuaDz0jtDdeZUzRzd9w/tvaLSw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3601.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 11:08:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 11:08:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 09/12] powerpc: mm: Add common pud_pfn stub for all
 platforms
Thread-Topic: [PATCH v10 09/12] powerpc: mm: Add common pud_pfn stub for all
 platforms
Thread-Index: AQHadP304tI1ZcyJhk6yODp5HTrdi7E1g3IA
Date: Wed, 13 Mar 2024 11:08:03 +0000
Message-ID: <339a9b64-cba4-42df-82c5-9f0b1113312c@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
 <20240313042118.230397-10-rmclure@linux.ibm.com>
In-Reply-To: <20240313042118.230397-10-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3601:EE_
x-ms-office365-filtering-correlation-id: 5f6f6861-8439-4306-4545-08dc434dda1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /J+nkdfqY1uziXEZ6BxMv5TajybOqVMKAzPDhckj6BQKeofFGJt4Hq7yRp853GujmKqkhmtGWr86fUGphET+f55DSq201HSq7eGazAeoy/cpng8wB0vT31pr+ZmedBgzkK5YtJ0PwDXDlOGZoEcig83G4t8FOrg/z5j+Tcklq5nSCUVcSR2KXCvin1cATHY7HtGv8Kym8tcZjzljdbZuHZqFD86qXFHReJWBOSccdW9jNupmnVGtEOBVYv9zz9GjTmEvivZCGU7q5CTJMDRM74xrPkA6anFzcDNjE4vSpCxIjhkJoXwbt6adQ+lqCWCguTbgFqkPtY52OEHwHRZj4wi7Objb7S+rtq+5WtXDStMETGKIsybED1wvTNBuN+hseYt0CB5A4XM6PXVt98KjYvu69Dg32ZmOCtcKYpZ6cLIAB6ZfqrqKYgVCTnqXtcXouDAjKa22hV9AvfSIE+eA7379eX7VEC+xqiV5o84HM2dDTmSbr1RMPswKL3S5cMteIWbgMUtRma24x1GwuXrI3DKulETPdKtKC4zZ84KyaVsdx6+o8tJHJFe2Lc3imXGShOXwYxVIg7S1MQvJzHUIBfH0+m/E9iNeL9aFsAjBjurMpUW24Eq6w1CDpcFhT/aAdXB+otI3DNTXF4req1Ed6NXz8h6qRHuRTPvlCIkD4VE34MQp5lZvtgMllND6CpycEqF6sU2/hkFedn29OeWDZFfBRWvHNl1rcjAfh+T1JB8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SUQ4dVRHYUJoeXp5VWs2UG9mWk1FanRaUXlUTGVQOFpqcHU0SUF0SmREWCtB?=
 =?utf-8?B?Vis3dE5vVVhYTjdhQi8ydzdMWUFmQWZIazcwMlRWdUdOdnlkM0M0YkI4VnY4?=
 =?utf-8?B?NEpsMzMrN1dTMDNTM1dqK1FBWkQ4ekVtbDJUd3E1djIxZ1lzUEhjc2QvRFI1?=
 =?utf-8?B?ZGRSeFZFUGVYRGR0a1gwV1dySzk4RnB2UmZmR1l2NHREWklYQzFNemZhRlJo?=
 =?utf-8?B?cFZwVWNIaGhHSmFjZSt6TFVVbGxYTXBoZElRN1p4MDcwQzZVd2xJMGxPWS9O?=
 =?utf-8?B?dWVncWpZRVB5OVo1UXBLcElpWUtHaVhEN0NXNHdQd1hISVJYd1BPUGJWbGtH?=
 =?utf-8?B?eVBPa1BGZzcrTmFkbk1QRFRDM0IwSVRNRDZIUnlLb1g5RzVTaGZNV2cvN2Y2?=
 =?utf-8?B?cTJMakg1OWZOUUZwL0dwbzlCTnZJSjFvQkVYc2IzZkpyYzVzZklOaHhhcnkx?=
 =?utf-8?B?b0FvUEl6c1doTkNMNWo0MElYV0d0S0taMzVMeS8raTZSMUt5ckR1MmVHdE84?=
 =?utf-8?B?S1lzbHhNcUxxVVpRMEtYQ0JMRTk5bWVRVXZOUWIrckRLU0FsZ3hNYUVDZS9Q?=
 =?utf-8?B?NlN5UjBPMDF1UnBGRW9lMi9ISkdXbW8rdzFYYzRKMW82UlJ4K1EzS0dxR2Yv?=
 =?utf-8?B?bjAzL3JiT29hYnh5NkZwZE9qVm5BVDNhV1VPRzFrY1FxTTJSRkJqdVV2bG5m?=
 =?utf-8?B?N1Uxb2xmTFNrdm9Ta1psNHJZRDRTYWRMdCtBQ20xYzQ0Z2EwUHRZWGdHa2hp?=
 =?utf-8?B?M1I0UWtVc05KMnhRT3gxTDltYzBCenhVWXZrTUJ4d29aZ3RrRHkxd3JtaDJY?=
 =?utf-8?B?QnB4UjgwQllzY1k5T2MyNHhkRTZTNDcxMThOdG9nTUh3MzE5b1ZyMFlnVmhm?=
 =?utf-8?B?eWUvRFc5NkY4T1RQU0RicEYxTjVZSjVPc3lVTEJOY1NxRmxRNEZtZHVyWk4w?=
 =?utf-8?B?TkthUkpTWWE1SXRPUnRUVWNGL0dkUzBNNVlGclQva3Uzb0ZvSGk0VmtubzVK?=
 =?utf-8?B?K2F3L1RMUkY5L1RFREUwckovaVRmSncyekE3ZUlFc1AyU1J2M1FMdW1YYnB0?=
 =?utf-8?B?ZFcyWlRZTjRrQWtUbDdvdm5HNFpTWFlab0hoTGREdmtvRndyYU1GdElTNHBI?=
 =?utf-8?B?Q3pwMVBYT3pvU1BaQ1FiN0tMNGdSWU12UDZuRW1XOElPQWhBZkJaNXFTUTdJ?=
 =?utf-8?B?OTJpYzJSMjVjbVZlNmpzcEVTUDN3LzhRWXhxbFVHV2ozUnR3bE9Jc1c5YS9h?=
 =?utf-8?B?ZjhDVXY5cHVqMCtFT0YweEJDd3VSbGlPWS9TZHkrUmtiRHNNNTB2MjVybXQx?=
 =?utf-8?B?SmV0UDlqZjgwMmo4LzNhZlljeFZ3ZnY5R25oWmZUZnNEZXEwU3lsRWp0eUQr?=
 =?utf-8?B?N2NGRGhia2xVMno3TmZHbDJybS9CdGJHS2JHNURTOGZ0MHdNVDNJUnZiWExj?=
 =?utf-8?B?amhzcHdGQnU0WkwrVzc0R1BsZnc5Y1dOVUcvWFB3VC9aUUhCa0dMQTNhbzRP?=
 =?utf-8?B?RUs4UDA0Vmg2UUJRMGthQXJ1K1lkVnpSdjczRzY2YWZtYmVXMjMxdnY5c29q?=
 =?utf-8?B?aVhMV0Z1MndNOVJ6RW1qRDQvMk9xcGdRWHBYVHdMT29USWJRR3Y0Qm1aZk1T?=
 =?utf-8?B?VlhvRWFPMmFOWFdUL0dIY0JaVHVyNE9rSVNZTUVJWGlaSXdZUFRDcTJxOUZv?=
 =?utf-8?B?OWtYZW9zazdqMVB0SlNRMXdiaFRzSituQURBQm05OElRdjFiZG1aRG1LWEVZ?=
 =?utf-8?B?b0pIY2haazMraEkxSHdtanhGTVhJZVZnckY5cEc0bHpYZVZIRXNmNnBrek1S?=
 =?utf-8?B?bkFNUGRmN293empBaFR4SE50VEIzQ3QyVmZsNXhBMzQyRkJXSWo0dHIxYm80?=
 =?utf-8?B?Q3QyTmRud2UwdFJLRG04Ym9hb0ptUitOa05pcVdaU3hmMEZZNHlHTXVMZGwx?=
 =?utf-8?B?OGRYTzZqczhBdTZMVVVJcGZqRkVaQ015aHhNZlpnZW9vemlqa2krQ0xSa01O?=
 =?utf-8?B?VUhrbDd6QWRMd0lSOVhmTjJ5MVJ0Rzg1THB5cW1KUVVnZjZMKzBEWmJCdXk5?=
 =?utf-8?B?b2hVSzFON0RQdFVzeitKci8rYnJnRkQwQVdtUk1wdTQySURjSDlQeXNBRUxs?=
 =?utf-8?Q?0oDUsJxsYulaL9ehOAk2cX8vm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3776F9973D10AC4CAB550AE31733B25A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6f6861-8439-4306-4545-08dc434dda1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 11:08:03.0542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4UM0c9iQKrfS1gTBnGAZkqMjh/73o0IpW5mNO/frLZW2Qvbkn4Z6oOLD27Z6GJ93Z0Xe5mA5ysPghljV0EM0nakl6W98c4z9b0zHMKSn5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3601
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAzLzIwMjQgw6AgMDU6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
cmlvciB0byB0aGlzIGNvbW1pdCwgcHVkX3BmbiB3YXMgaW1wbGVtZW50ZWQgd2l0aCBCVUlMRF9C
VUcgYXMgdGhlIGlubGluZQ0KPiBmdW5jdGlvbiBmb3IgNjQtYml0IEJvb2szUyBzeXN0ZW1zIGJ1
dCBpcyBuZXZlciBpbmNsdWRlZCwgYXMgaXRzDQo+IGludm9jYXRpb25zIGluIGdlbmVyaWMgY29k
ZSBhcmUgZ3VhcmRlZCBieSBjYWxscyB0byBwdWRfZGV2bWFwIHdoaWNoIHJldHVybg0KPiB6ZXJv
IG9uIHN1Y2ggc3lzdGVtcy4gQSBmdXR1cmUgcGF0Y2ggd2lsbCBwcm92aWRlIHN1cHBvcnQgZm9y
IHBhZ2UgdGFibGUNCj4gY2hlY2tzLCB0aGUgZ2VuZXJpYyBjb2RlIGZvciB3aGljaCBkZXBlbmRz
IG9uIGEgcHVkX3BmbiBzdHViIGJlaW5nDQo+IGltcGxlbWVudGVkLCBldmVuIHdoaWxlIHRoZSBw
YXRjaCB3aWxsIG5vdCBpbnRlcmFjdCB3aXRoIHB1ZHMgZGlyZWN0bHkuDQo+IA0KPiBSZW1vdmUg
dGhlIDY0LWJpdCBCb29rM1Mgc3R1YiBhbmQgZGVmaW5lIHB1ZF9wZm4gdG8gd2FybiBvbiBhbGwN
Cj4gcGxhdGZvcm1zLiBwdWRfcGZuIG1heSBiZSBkZWZpbmVkIHByb3Blcmx5IG9uIGEgcGVyLXBs
YXRmb3JtIGJhc2lzDQo+IHNob3VsZCBpdCBncm93IHJlYWwgdXNhZ2VzIGluIGZ1dHVyZS4NCg0K
Q2FuIHlvdSBwbGVhc2UgcmUtZXhwbGFpbiB3aHkgdGhhdCdzIG5lZWRlZCA/IEkgcmVtZW1iZXIg
d2UgZGlzY3Vzc2VkIGl0IA0KYWxyZWFkeSBpbiB0aGUgcGFzdCwgYnV0IEkgY2hlY2tlZCBhZ2Fp
biB0b2RheSBhbmQgY2FuJ3Qgc2VlIHRoZSBuZWVkOg0KDQpJbiBtbS9wYWdlX3RhYmxlX2NoZWNr
LmMsIHRoZSBjYWxsIHRvIHB1ZF9wZm4oKSBpcyBnYXRlZCBieSBhIGNhbGwgdG8gDQpwdWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UocHVkKS4gSWYgSSBsb29rIGludG8gYXJtNjQgdmVyc2lvbiBvZiAN
CnB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZSgpLCBpdCBkZXBlbmRzIG9uIHB1ZF9sZWFmKCkuIFdo
ZW4gcHVkX2xlYWYoKSBpcyANCmNvbnN0YW50IDAsIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZSgp
IGlzIGFsd2F5cyBmYWxzZSBhbmQgdGhlIGNhbGwgdG8gDQpwdWRfcGZuKCkgc2hvdWxkIGJlIGZv
bGRlZCBhd2F5Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVA
bGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFi
bGUuaCB8IDE0ICsrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCAwYzBmZmJl
N2EzYjUuLjEzZjY2MTgzMTMzMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5o
DQo+IEBAIC0yMTMsNiArMjEzLDIwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX3N1cHBvcnRz
X21lbW1hcF9vbl9tZW1vcnkodW5zaWduZWQgbG9uZyB2bWVtbWFwX3NpemUpDQo+ICAgDQo+ICAg
I2VuZGlmIC8qIENPTkZJR19QUEM2NCAqLw0KPiAgIA0KPiArLyoNCj4gKyAqIEN1cnJlbnRseSBv
bmx5IGNvbnN1bWVkIGJ5IHBhZ2VfdGFibGVfY2hlY2tfcHVkX3tzZXQsY2xlYXJ9LiBTaW5jZSBj
bGVhcnMNCj4gKyAqIGFuZCBzZXRzIHRvIHBhZ2UgdGFibGUgZW50cmllcyBhdCBhbnkgbGV2ZWwg
YXJlIGRvbmUgdGhyb3VnaA0KPiArICogcGFnZV90YWJsZV9jaGVja19wdGVfe3NldCxjbGVhcn0s
IHByb3ZpZGUgc3R1YiBpbXBsZW1lbnRhdGlvbi4NCj4gKyAqLw0KPiArI2lmbmRlZiBwdWRfcGZu
DQo+ICsjZGVmaW5lIHB1ZF9wZm4gcHVkX3Bmbg0KPiArc3RhdGljIGlubGluZSBpbnQgcHVkX3Bm
bihwdWRfdCBwdWQpDQo+ICt7DQo+ICsJV0FSTl9PTkNFKDEsICJwdWQ6IHBsYXRmb3JtIGRvZXMg
bm90IHVzZSBwdWQgZW50cmllcyBkaXJlY3RseSIpOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAr
I2VuZGlmDQo+ICsNCj4gICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovDQo+ICAgDQo+ICAgI2Vu
ZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8NCg==
