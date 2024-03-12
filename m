Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60E878E36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 06:42:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bqo+zTi/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv2bx0XfMz3dng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bqo+zTi/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv2bB1F7Lz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 16:42:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ8YtF/FOZlx9nsjR0Pz/rKnKH3Z4WxmaX8B/7LObK+YnGbRbXBCFvUiji5/lauFQealZnItGIRF5f6mQbeyt7HWVZSqgPjZbnYDqeS2XtKDfyeMYsG8Qxqmy2Wx2pE6Q8B5ba9/RbebB2Y8V4vxzsUnDpjtsONvljkGQBAhWSvcXtb566E7kJwuBKPz8lRio6EMHMKCiqx0yDrImSOJkDdPyH2nbh2AmD/z5fQyA7vAQ1aPCoNupNF7ZdSAU5x9PYHtMXRVKWgPgSObsjHCD17i0mvIsj+t7SnLknWF75osKrS0PjzX+tPScQG5BoKiAu7VV2XSqJWeuh8gVgJNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHh8D7MmwbzPXsT+Vll1d4+H+pB9R7wVQ2m0ipLkN3Y=;
 b=YA2wYugammboQr4PJIFieDRPOeLEX2PxJTDmKkt3ElAnY+VM+NmeUTnGtcR0S+e9WS88GGTSY84IFtAzXpZHS+NIGpm8yh3RL3tbRxoc9/3SE0alfJCr8APrdrCk1tBK2KgKktg1ThlND91V+BTRpabYZHxXiAX9e1zlLZlGdRYOb5K2wVJIfi1cRUzsDQu3gtanZ+5oYOv5hhoLb9XMHFkiLGjPkd9pQltGI4VXjjSiRSJi3Al74IH5dG7Us3fU0Yg4QXN++CO1pHVyAAV6ZnxtU9K8BE1cVsJR8ccwSJdOfSaWCgTREGrE3gKOXv+YqNkNZYNXaWZARKpIB/lTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHh8D7MmwbzPXsT+Vll1d4+H+pB9R7wVQ2m0ipLkN3Y=;
 b=bqo+zTi/4rjvbDVtez1LH8r/R0ivfkeUPHfpJdWqEHjfc1UYB2Xi5b625hPZ7BcJFrMvp2vHGx+rHhB5y3IJ0b0firXVRip3khy2sGuZg9+a53FEijbnQB7wNpoSD0QXU10EnCQbTlOcxR0Djp5lzrD6O3xDtF7t9KWdlaCL5PHxH82eOBflgvcWwdWk4spHmspfygNIIlsfOqmh3dXHl/BUu06F/D9lEEtos2fhqc+G9jStYgU7CkCxGTXNUYryBeDvGC2xbpxmLcCTa9jxlyLkQ6/AW2z+AGa5HY4jIn6Tc7egkPE+FiMNDxdAPKz8LuSeCVf5qAFzdCAeX6ZwzQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 05:41:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 05:41:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Topic: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Index: AQHacDjgK3b+WpnPIEGh5lKDyA2GCLEsFb6AgAcqpICAAF8egA==
Date: Tue, 12 Mar 2024 05:41:48 +0000
Message-ID: <b7147fb3-fbe1-4063-823d-31f77b8ac801@csgroup.eu>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <CAHp75VfkTxRtMc_SpXoyoVjiWxm=c6_1VjeiRFUo4C7kH4HmUA@mail.gmail.com>
 <5ef5fb8d-f1be-4c8e-92fe-f40b68478228@salutedevices.com>
In-Reply-To: <5ef5fb8d-f1be-4c8e-92fe-f40b68478228@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2004:EE_
x-ms-office365-filtering-correlation-id: 49c75831-96ec-4075-b071-08dc42571c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nF9nouh5PSPiHS3gj/5SyFvGbjuDnfCft4V2yfwDHaq0I1oVflo/BjWBg3A/PRwNDmghENIo9jUNSKP7GgYC3pBNqAfO+oJmcQeY7URcr7hiLSzIf7UssKw+1H6CuoqZiLWdwCFLxOmuF1nljZKWD5z2n10pTQjT/EtmBC+a4rV8g/w4BRPPeeozEfGgcj0DLElR6+p4Mg8vME6G7PSmq9RmlOwni7JNckhmyMqNJ6Ex6ssxNQE3ACfsIQ3VBQzeCRa8pv8oXuDYP4W+5eTuBbuDIT2U9i358/Mm4VoLdKTzJKXecb/d4hYAdWYZutimXTycvCm3sUvbxiJFdcBpzTooSslnqPDeK0ydrJXQHNAfNZOrhYWF6Hp1Kga0M2Ru8o3ZRw/nOgnxHEYm6BE25MKyUbIUkrvw2q1n3gWcJcdpgpSCBIrmCoO/GLRIkKoZY4lmPO9/HW9ALUsRxqzqb9sjfE69hQEgr0h38o6TxA2h4PRMa40nZQVyZwGZOdYHPb27dxdEs0VG5or/aOzVVcj9TfPSwOuntgyZEz36ZXckxAOeEKIZKsTHl2cZrkN+RISA/KQDR4mM79BBkuLV/l04q7lMfbor22uiofH5lYQDzcKJ7iHCFAUYF39TloV5MXbnJmqdWAfy/4DyT8slQJFovOMgva5zVfUy84DxEbxrc0Lsl++xT0JlXEgvr2Zmpc3QAKEIQU5rSrAjyskHkkMLZx6ND/cbFKc1fT4A0jg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dTcrSmR3M09KVUtUcDlRcE4vYTdQWXE5anVzNThBWG00QXdsV0NlcnVHNElK?=
 =?utf-8?B?WEVWKzJ1eUdBRnBVemtnamwwbFBnck9mS1ZMSFNMWWN1em4vSzZoL3VPTi9U?=
 =?utf-8?B?ZXhpZXZ0enArYVM4YWFxV0NWT0twL01hM1Q4STFyNkFSM2FmVEh0eE9FUnZF?=
 =?utf-8?B?bXVyQlZXY2ZqWTMyRFFCS2R1cng5b2t3KzZRY1NqeGxIM1pxUngrWkM5eDdx?=
 =?utf-8?B?SEN0MWkyMnZ3cDIyaXRxZWV3QkJFVUZLaU1KbEJBUkJCUytJMTZJenp4QVU4?=
 =?utf-8?B?blA2NFErM3NGR0hpd3FzdytDL2pFOExKMHVuYWdrVitzWWlrQ3UrYnJYM2h4?=
 =?utf-8?B?NW9wQ1luS3VBL1pJQi9SWU1BeWlaVE5xbk9NMHJ6dG93UG1mdXdHN0FzRDkv?=
 =?utf-8?B?ZEtPUVBTQUI2N2FWK3BZbE9kM1FlSnYwbU15UW05cDllWkUvZkNGWXJhWkYr?=
 =?utf-8?B?MzgwWGUyWDFVOWkrSHFsZ1NNNGhkZVZ2cERNTktaWnNmSkhxd0VRaGpXZzly?=
 =?utf-8?B?c2cvY0Y2Y0puWWlXb1RINlBFQWZIekppWUdXSU41bnZrWE9XVDR3Tkg3UTlT?=
 =?utf-8?B?OExzSUtBaWJnbmV2UGFvSWJRWmZ3WENtOGtNQVh1YlFHK21rK3FCTEhDTm1v?=
 =?utf-8?B?WUhSa0szQmphS3prSU1iSTQ2OGYxcVRqcnhldndzRlBGMDJ0MmwyZWdXTUdm?=
 =?utf-8?B?akUwUDl4dlhkK2J6TmxGMzZ6ZytZR2VVbnhrOGs3ZVJzanRZUXE4SE5Gdk1X?=
 =?utf-8?B?Vkh5YklhL014eDE5amRtVG1kd3M5SUFESElzUi91SC9rMmY5L2lWRzRRKzdI?=
 =?utf-8?B?eXdqNXRnZ1NYREpFSmN6dlBDemZCQ2hHSzltenQ3MFNyOVRZME96RnY1SmhU?=
 =?utf-8?B?Q3JOVHFsVmhQMWtHcVM5MDVjNHB1M3NYMHUvRHQ2SkFXQVozR094aGlkOXhl?=
 =?utf-8?B?VFlsQWpnVzZJdEtWdGJNdFUwc2ZLclJyQkY4VXljQVYwOElZdWRMUllvdlo5?=
 =?utf-8?B?cTU1ZUxEYUFWa3U2aHh2UjNPdkxKeFFlRnplUzFEKzg3ekU4RW5RVVIxaDYz?=
 =?utf-8?B?bzRYaDVrdmErOU14REtXOStZV01GWjFTK1pVMm1qTjdEbGRLeGZaQzF0ZUZC?=
 =?utf-8?B?QWlZZlFNRkhJNFlJZnhIRzZ0T3lZdm0raFdVNXlpVTVPY2xYUEM1a1JRUHc0?=
 =?utf-8?B?V3M4RllDcGdpb1JaODcxWk9JNnlnRTdBTXhqSVcwak9sOEthazNQVXRuc3BN?=
 =?utf-8?B?cjJReDZjTXYrSVBBVFJmc2puSk1ISXArUjZRWDZiRk1TQUo0MjllalN6ZVRN?=
 =?utf-8?B?OG10K1FEYUZQbmhaRzl4RlFGelNrOVVFUjRONHQ2U2NGc3BUblkxeEZ5czE5?=
 =?utf-8?B?OVlJaDMxL2NDY0FnVU5zWEduRWhNdDREQzhPRkpsWCt5dThuT1RNOGgreU1O?=
 =?utf-8?B?a0dpMDVrK2RoWDFoQUh6VXJ6QVNRZlRWak9HZVJra0ZCd0hwUStiRkJtRXRh?=
 =?utf-8?B?b1BGRzVZdktiNEQyUkV5MkVNOFlUc21EWDdKM1BVeHQyOGNFQ2ZtNlpqdnpx?=
 =?utf-8?B?U244d0cwYU8rY1QvTTcvdzdoQysxL1pTL0FYV3Q5UnNPMjdHSDdGaytSOENr?=
 =?utf-8?B?K2l3M21xWUpxUFp5a2VuRENmcFExalNwdmxJWnk0S256cko0amVXZzZPdCs2?=
 =?utf-8?B?QndIK1B1TTh2Q0xOVDRibXEvWEFGdWt5UE5wNDl1ejBIbkNzbWVhYyswMGZ4?=
 =?utf-8?B?U2lySVJNWVRMQ1hQNGRlSFc1Mit6T25uZjFXc1BicFlJcll3NW5KcE5MSUEw?=
 =?utf-8?B?MXk4MG4vYWkrWVV0d3dZS1VkdEFBU0cvZkhPTThwbjFiV0xFVThka0d2d01L?=
 =?utf-8?B?dk1CblcyQjgyM1NTS1p5ek8vRzVFVFBQUUMzM1hmUTd2OXUvUnBsY0d0Ykk0?=
 =?utf-8?B?bkxLbzRmVEdPekhLM0lMZENTZmM4elVpblhjblN4YjdtaHdYMlpVQTJhM0Ja?=
 =?utf-8?B?bXZkdy9jQjBUYlBGQm9jU3BPcUl1ZTY3d3NBSWdOZmtBTksrbzVXL2RzZytF?=
 =?utf-8?B?TmxpTENQQzBBS2xNNjU3NXBDR3FMdWdjSnQ4L0kwNWNsdTRGWUdjUWgwRnZS?=
 =?utf-8?B?UTQ2Uk14TVM1UzUyQkNyblNSQ2poZ0k0QTlSSGRZOTlIcmN4Vm1tRnFsUDNq?=
 =?utf-8?B?M1N1STJlSktkaXJZeE12Y2dsTVFlcUROZGNYODQyRGJEVTZFdThhWUo2dFpm?=
 =?utf-8?B?ZHpqcktFbmZlNVRHcU4wdC9teDJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5145DB66068B244C945D28AA661ABC23@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c75831-96ec-4075-b071-08dc42571c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 05:41:48.7796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGP807RRjOurJfSakg1OwWNXqboLuddjhp0GusG/bI/L0KDxSHsASGVIabw3JEYrXO/kWfQBcoBH3Hu3HR2QUdCvfJB5ZrREam4e2+Mq35U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2004
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
Cc: "kabel@kernel.org" <kabel@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "longman@redhat.com" <longman@redhat.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzAzLzIwMjQgw6AgMDE6MDEsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiANCj4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQg
w6AgDQo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBIZWxsbyBBbmR5DQo+IA0KPiBPbiAzLzcvMjQgMTM6MzQsIEFuZHkgU2hldmNoZW5rbyB3
cm90ZToNCj4+IE9uIFRodSwgTWFyIDcsIDIwMjQgYXQgNDo0MOKAr0FNIEdlb3JnZSBTdGFyayAN
Cj4+IDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPiB3cm90ZToNCj4+Pg0KPj4+IFVzaW5nIG9m
IGRldm0gQVBJIGxlYWRzIHRvIGEgY2VydGFpbiBvcmRlciBvZiByZWxlYXNpbmcgcmVzb3VyY2Vz
Lg0KPj4+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13cmFw
cGVkIHNob3VsZCBiZSBkZWxldGVkDQo+Pj4gd2l0aCByZXNwZWN0IHRvIGRldm0tcmVsZWFzZSBv
cmRlci4gTXV0ZXggaXMgb25lIG9mIHN1Y2ggb2JqZWN0cyB0aGF0DQo+Pj4gb2Z0ZW4gaXMgYm91
bmQgdG8gb3RoZXIgcmVzb3VyY2VzIGFuZCBoYXMgbm8gb3duIGRldm0gd3JhcHBpbmcuDQo+Pj4g
U2luY2UgbXV0ZXhfZGVzdHJveSgpIGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcg
YnVpbGRzDQo+Pj4gZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGln
bm9yZWQgd2hpY2ggaXMgc2FmZSBmb3Igbm93DQo+Pj4gYnV0IHdyb25nIGZvcm1hbGx5IGFuZCBj
YW4gbGVhZCB0byBhIHByb2JsZW0gaWYgbXV0ZXhfZGVzdHJveSgpIHdpbGwgYmUNCj4+PiBleHRl
bmRlZCBzbyBpbnRyb2R1Y2UgZGV2bV9tdXRleF9pbml0KCkNCj4+Pg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+
Pg0KPj4+IMKgIEhlbGxvIENocmlzdG9waGUuIEhvcGUgeW91IGRvbid0IG1pbmQgSSBwdXQgeW91
IFNvQiB0YWcgYmVjYXVzZSB5b3UgDQo+Pj4gaGVscGVkIGFsb3QNCj4+PiDCoCB0byBtYWtlIHRo
aXMgcGF0Y2ggaGFwcGVuLg0KPj4NCj4+IFlvdSBhbHNvIG5lZWQgdG8gZmlndXJlIG91dCB3aG8g
c2hvdWxkIGJlIHRoZSBhdXRob3Igb2YgdGhlIHBhdGNoIGFuZA0KPj4gcHJvYmFibHkgYWRkIGEg
KG1pc3NpbmcpIENvLWRldmVsb3BlZC1ieS4gQWZ0ZXIgYWxsIHlvdSBzaG91bGQgYWxzbw0KPj4g
Zm9sbG93IHRoZSBjb3JyZWN0IG9yZGVyIG9mIFNvQnMuDQo+Pg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3Lg0KPiBJIGV4cGxhaW5lZCBpbiB0aGUgb3RoZXIgbGV0dGVyIGFzIEkgc2VlIGl0
LiBTbyBJJ2QgbGVhdmUgbXlzZWxmDQo+IGFzIGF1dGhvciBhbmQgYWRkIGFwcHJvcHJpYXRlIHRh
ZyB3aXRoIENocmlzdG9waGUncyBuYW1lLg0KPiBCVFcgd2hhdCBkbyB5b3UgbWVhbiBieSBjb3Jy
ZWN0IFNvQiBvcmRlcj8NCj4gSXMgaXQgYWxwaGFiZXRpY2FsIG9yZGVyIG9yIG9yZGVyIG9mIGlt
cG9ydGFuY2U/DQo+IA0KDQpUaGUgY29ycmVjdCBvcmRlciBpcyB0byBmaXJzdCBoYXZlIHRoZSBB
dXRob3IncyBTb0IuDQo=
