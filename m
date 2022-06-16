Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFD54E2FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 16:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP3sL3dTJz3bqf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 00:07:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ld68B6pw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ld68B6pw;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP3rb2CZGz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 00:06:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIoBB+I2SuppDoTWFFnf9/0PDSA5BG5WBiBjVY7ro96RKJzW7q99VvQzRTwyJWjNMVpS2fj45xSHWTLI/MW+3ebzKakujvbul6IGzaV2NUxVlbksyq9so5C/u+O062xvi1pM2zTk9eI6aGTH2iwKt7nHAjj6ne2mduWmxX8iOYfjCV/A6+LSLtKJ9k2sFtoMIWeO0daqkkTueHF5x1Ok4vxN8ELdVkc3WSyAVO9nsjcXf1Ketar5GIYF6lm41EiV5UX7aIui1BWsIEcc0pMY5Ge6YCvowZSBNcdQiRtngYsYN7IGEUJMo9ABe21wS5JU8FqRW4pjsYKL6nOV36ExhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuFgRHlZtE5+gVhgjg4fJwPVuVtrKm0DJS9VrwhMYjo=;
 b=Bav+jhOLu/nWPldglZjGeJaxPB7rqlVyvpfGrp7S0cM3d+4RsWXYceskpEkUNVk+nggzuWPEnFpeqp97PTF3eYAO4fkUbWAR3pC60Hzew/UP+a3iKCq30VUmVkkz9WBaA1gox+sGAADUf1g4vVLg8wZghKon7yt+5UI+xSLLSUHEiIs5G4EuZ09nCTFtGNnB5vUr5YcWPrRPf06hPVPVPnI06rzPDX4FgtyR50Qo308E4Mf65FKXdeG/+gkOVxvW7/okUIDgF11UI+pU8j5nrg/0+0ffnc3dYw2htP6IWAuu2YJl1ri9QFk9s7l8En5WKo9iIhIOSVrnM9zX7ZRpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuFgRHlZtE5+gVhgjg4fJwPVuVtrKm0DJS9VrwhMYjo=;
 b=ld68B6pwzO/aNsVdyqTjoh/A8MJQX0teZ0MbYhBhuN5877lMH8Ss4pu+ZKWC5gEBq4Yak64YOdc/W7c6FBITb1SnnyBO5SVEdGc2Yw4r7szMDpWWQ3Bre7QQ/uMLXlOnzXnUXcRxF2uL/esyPRpBIJbQSpxKBbz/PJ4exApIBRhn4o0XxGesCINBjYVxB2dap0SxkxtxEYZjgI0ZugJdmnlBGOi9A3yrxKzeMEmZylMgb458nvsi6GAeM/DDg+A+lHV5ui9uClJB5dCW9bKDubT0k8KV2cSkIfQUOTd516H85PHT6q6cU1sDHW7M6HpLWyaX1H61ULNQBIInsWEsOQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1848.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 14:06:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 14:06:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index:  AQHYbs5qyDK6/X7ZxEy6GUPocR2PqK0txaCAgAAXpYCAACrWAIAB07WAgAizrYCAGZ52AIAAAb2AgAAE1YCAAAJsgA==
Date: Thu, 16 Jun 2022 14:06:33 +0000
Message-ID: <d095fe9d-e713-def1-6096-540c0d0da298@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
 <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
 <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
 <f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
 <c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
 <1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
 <30f3791c-0fdd-e635-4a85-ec457f990fae@csgroup.eu>
 <Yqs235037JrOOhBA@hirez.programming.kicks-ass.net>
In-Reply-To: <Yqs235037JrOOhBA@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f9842d9-6294-4a78-b593-08da4fa16b58
x-ms-traffictypediagnostic: MRZP264MB1848:EE_
x-microsoft-antispam-prvs:  <MRZP264MB1848F6057A4714C603CD6570EDAC9@MRZP264MB1848.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KQsnb7KWAji2Aa/4x/gDLgx4gzcrnsMdO0rcLt16/2fH4TO75ewAdd3DHLbHY91EU6NgOUqYxxHULwwT/+w35vWfXYLTbNn5sX8iBi/8nryx02kBkTszHeNM2M8JETfQWewB4EtPRrND7iZ/EVk/N7/T4g1ZMm9X1wI+4khkEsRvSBXKENmSfhKtLRdZk4RIBRbupJax8nQwy9rHd7ORXPqzYS/k7chZnDNfduwiifFrGp1jlzaJ2GLxGhpAsrpuQrbkt8bwTrMO9hvT+xx+z3RkvZREC5Jvv/o6XnmvsO0Q+B1sZgRQwbjPjowkcfD5RDKSUuewljb1CLDE0toRZFXi+CafApQ2m3/5MkmjbSk3DafMXEOVrYbx35qCWD97bWApj4Pbg3v/BA17O8rajW+yOINIcuO+ukhHKVCyfkFzhh1CB+tmnGmFCJe9HeoRTW3SvgCB6tvd1tQ/UgphRiPuhuhOmWynI3arkUtabOHJfEg5oj33lY35JwmngveI3jWWbVU+gxSaoE6VHiNm2hbl6UzEF3QXnyoSGlzj/a0UGmYkK1m2VaHqL1efxytrK9ZNlfX7iGdCbnilK27CRe6mMt2uL2UnWn6r36D2y4B6QDXRcCwypH86o7DtEw+Rdc/VFlaM1RmyiaVEFbhy96QLPJ4zKEn0XUEwAf66YuY9FSo1hhoAlC06y1ZHyadroLZjD0SCdVsZ0mUXApUZaRFSrHy2JPycKe22TDoZNGnjoYSJtExCiKXGSAv3oF2byS1pT0XVedw/uNPEGwnoFQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(26005)(6512007)(6916009)(36756003)(66446008)(64756008)(38070700005)(316002)(8676002)(66476007)(66556008)(66946007)(2616005)(6506007)(86362001)(83380400001)(76116006)(31686004)(4326008)(4744005)(54906003)(5660300002)(71200400001)(7416002)(38100700002)(2906002)(508600001)(6486002)(44832011)(8936002)(31696002)(122000001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?azJjbFZjaGs4bjhRS2RPdEpaWVF6c3RHNVhLd2xpQ1hiSEJoV1JzMHVFb3Q4?=
 =?utf-8?B?QklrTS9jc0NIOVJhV1dZRHRybXJoYUNaMUhyQ0VuYmFaWDdyYlRrMG9QSHpa?=
 =?utf-8?B?ck1xZ09GSm5NWFE1UXpXZFRiVWxQOVRJeE91SHBvU3F0Yld5bjFQekVhSEFH?=
 =?utf-8?B?YjY2cGp5LzZoeEZId0hMd1pBVVlzVzMrVHJsekdtODZrVkVNV2xsekZlNS90?=
 =?utf-8?B?ZFpuU2t2cmFOd3JWTnNHbkRwTkM2OUhNdmorVWtBUGFJdVpXWWQwQVdpMVN4?=
 =?utf-8?B?SmNqNlZLbElIVXFGYmZXU0ZMbU4vL0dmaWtkbGNlNVIzbmxtTE52RFJadVJG?=
 =?utf-8?B?aXVyTVhkOWtYSFpubks4ampEaEhSd3hBNFlCMGduU1dNNXlvQjlCN2hmbDZy?=
 =?utf-8?B?YktjdnB0MEUvbldvaDBWSVkrMlR5NGM5TDJuY3c5eFdLWFplVVgzY0RCNm9O?=
 =?utf-8?B?aTIrWTZCeUlLL2xzRDEzVWFpMHZmdmduRy9KN01VT1pSY0ViUC9CaEYvUG1r?=
 =?utf-8?B?Uyt6OFdYT1BPSmFmTElRS2dVY25VMXAzK0dGUVhLWXY2NERhOWFsZkZ6Smgw?=
 =?utf-8?B?Z0xFYWp5bXZOYnk2RGNzZUFwTEFGL2N0ZmpCVWVlYXZZYU9OcWF5UXNISGNB?=
 =?utf-8?B?enYyT0gwUGFXQ1k0YkRPM2lzL2prN0N5VU5YekVha3dGaWVrK0hQUWdodE5U?=
 =?utf-8?B?TjA5R3p1WitYTEhRbnpvL1g4K0FxUGVwYkxyUXZvTFUrWmFxaEl1bWV2VjRm?=
 =?utf-8?B?S2hETDFRQ1FsSEc4NnZCZm9XZTBpV1dJUzJ4L0x0SEplTXhoWnp4eDdUQ1J0?=
 =?utf-8?B?Tlh5ZG9mVXlLSTQxWUk5UmprTVVtTWNrL3cwbGpWcml1OHZHSmJSWGFjc3NN?=
 =?utf-8?B?T1g0N0NCVkoxVWV0QzBiV04yTzhRalZLdkNRYnFVRnlGWC9Bdm5UVEIwaEdw?=
 =?utf-8?B?cFFmS3RCQ2NEU2kxVGx4ZzZyS1Naa0xLL3llWC9jUUlIU3dpTXZJOUt6T2gr?=
 =?utf-8?B?cHRzVnRjc2VPUjl1QUJSV0JuMXYwMGVBUW9MMmlHNVI3VXJRRng4N3ljRTBh?=
 =?utf-8?B?blpwSnJJcFo5YzV6eUh0Qk1lU0tHQ2kwenlDeTV3ZmlCR241akREY3JtS1JM?=
 =?utf-8?B?Y0M3S1VScTZ3ck5pd0UxRnNiUzBleEJ1a3Bac2VCZHNMSVM3bEg1TlhsWG1t?=
 =?utf-8?B?V3FsUmFRTVRlLzdaNFhCbUNqNGx3SGVKOEdxOG1yd0RCZWd0WVdVR1N0b3VG?=
 =?utf-8?B?d2Vuc1ZIWndoMUN4WG55TmpvcEU1SHZZUk1oWW8wYVBHM09aQjFOTnNRNWpR?=
 =?utf-8?B?Y3JWVlNmWjl2UWptVmw4aHJzSjRudjEvSmpGZXFraHB2N3JIalAyRUVtMnBj?=
 =?utf-8?B?aDZYdkFBVWo4UWdId1B1d3RZZndRa3pyaUZ2S0tHYXpTWG0yMmtGTXlBUHJL?=
 =?utf-8?B?N2NjYk5JeHpoa0dpTmJiZGRCbldQK3phSlY5d3FKRjJSZEZvcmphUnJLTGJl?=
 =?utf-8?B?T2xIeGhRdVczZ0tBdXBQZUxuUE5JaVRvaENvMXppclNlRko0MlpaWGtYc1FM?=
 =?utf-8?B?NUlJZllnN0RNTjM2aFhQZDdreWVHeWJjbVJFa3R2bm50QzNaVmpSQWNyTTZY?=
 =?utf-8?B?YnRXNG0zOUFMMkJiNXNiWllMbTd6M2FSODR2eDg5Wi9KTFdpNTZnQmdSWSt1?=
 =?utf-8?B?M3ozTjZzME5yY01hUGZjOWRTY3Rob0lCbERYR1hLQTUydUpSSEZ2SnBObXdQ?=
 =?utf-8?B?djhRZ0YyOHZ3TXlKVHUwNnozQUFadkVla2lFRW1VNktVS0VtcGgwVGR6VU1I?=
 =?utf-8?B?Nkw2NGlkRDdvcCt5Q1JHUUZzckRTZ0Yvdk9zZHBhNFg1MzJQR2wzSU9RRFVm?=
 =?utf-8?B?NlR5dVZxN2JqSFczeks5d0xtVnZiWmdCcmV5WTFDUzRCVkxYdi95Z1hrY3Yy?=
 =?utf-8?B?cUVyTngrZVl5WW1tbGI5ZXNzcnlvR1crRi9sU3VLWk9KMHBYMUJMaDNjNHRU?=
 =?utf-8?B?Z1lWaU5CeXI2RC9IakJHM0kwb0tkdWZicVd0RnVuUllaMjhXUUtQNTk0S1or?=
 =?utf-8?B?aERoR0tMMGNWenc0YXptNGJRREtXQ0NUcUFDZ2JHYTBCcDF6SVNGdTBwRUVK?=
 =?utf-8?B?VGlDbCtoZEFqK1lIL1hYOG9WamZjWUVPZ2ZkeFgwam8vbk5JQ2JYTWp2Y0xy?=
 =?utf-8?B?SmdsUDNZRmx4R0p0UWdLd3JRWXJIMSt3aGlaTDMydVorOFJ4R1FOK1dxcmlI?=
 =?utf-8?B?a1N6RWpxWk41eHlaL25pMHQ4U0ozVEUwSlhyYUZGUE1Jc3krOFhsbFNFWUI5?=
 =?utf-8?B?THJvVVVsWHhDeXhSODFPeVgwRmVzd3c2VndvZ2t5SDNtdGRLVXhwRUNBbnBD?=
 =?utf-8?Q?GD9E7J0desGYVklU3Vu7kzpaGc/S8BugcWOpH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67AC4E7B411FD246B6B29280FA01CB2A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9842d9-6294-4a78-b593-08da4fa16b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 14:06:33.5182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ExVYQpdBq9kJJ3DlSCECBoFgCapv27f5kBiWEBN1+LNhax+0W8mvlDCzHFI61nnBMkzc1BGOL1igIswDtHksXOIoNAm8AgM/WsWEQdpEcqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1848
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA2LzIwMjIgw6AgMTU6NTcsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgSnVuIDE2LCAyMDIyIGF0IDAxOjQwOjM0UE0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBzaXplb2YodTY0KSBpcyBhbHdheXMgOCBieSBkZWZpbml0aW9uLg0KPj4N
Cj4+IFNvIGlmIHNpemUgaXMgOCB3ZSBhcmUgd29ya2luZyBvbiBhIGJpbmFyeSBmaWxlIGZvciBh
IDY0IGJpdHMgdGFyZ2V0LCBpZg0KPj4gbm90IGl0IG1lYW5zIHdlIGFyZSB3b3JraW5nIGZvciBh
IDMyIGJpdHMgdGFyZ2V0Lg0KPiANCj4gQ3Jvc3MtYnVpbGRzIGludmFsaWRhdGUgdGhpcyBJIHRo
aW5rLiBCZXN0IHRvIGxvb2sgYXQgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiAgICBlbGYtPmVoZHIu
ZV9pZGVudFtFSV9DTEFTU10gPT0gRUxGQ0xBU1MzMg0KPiANCj4gDQoNClllcyB0aGF0J3Mgd2hh
dCBpdCBkb2VzIGluZGlyZWN0bHk6DQoNCglpbnQgc2l6ZSA9IGVsZl9jbGFzc19zaXplKGVsZik7
DQoNCg0KV2l0aA0KDQpzdGF0aWMgaW5saW5lIGludCBlbGZfY2xhc3Nfc2l6ZShzdHJ1Y3QgZWxm
ICplbGYpDQp7DQoJaWYgKGVsZi0+ZWhkci5lX2lkZW50W0VJX0NMQVNTXSA9PSBFTEZDTEFTUzMy
KQ0KCQlyZXR1cm4gc2l6ZW9mKHUzMik7DQoJZWxzZQ0KCQlyZXR1cm4gc2l6ZW9mKHU2NCk7DQp9
DQo=
