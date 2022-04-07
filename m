Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD34F7C8C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYy4L1tRTz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYy3n706Zz2yNH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:17:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQkrDBdClkV+lhH8wUcUqlltlh6vR3qIVNejIShE+QWoObU7954BUxx07/9PgIdLQNjAXKFz8aRhoSK/vXcaZZY/s8zWszf6rL4jVwSVOZJELk0c1vB37Pk1QgIlTg/U3LmnQsuyYnkuMro7emU0xY5Ea+dbcHj9XB33zGxt88XlNAgyWQp3i8tnCEdC3WcGJWQgDYUshYaWxrIE3addrYkflSLV/ZJ11rT2U4XWRXv2/B3ASBMtvrp3uthY5voPRhTNJ7A6rX6kk/A2Xn71QhlwwqX3UjN9GL2V1Q89Ev0dqd9tjUpUiuZkwfR9iBFKS25V1xWEQFMSosqZ/w5yRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbs0G3bdAsIuIAQha2zw/EtddRKu4FY6T2U1SccIAZg=;
 b=hIhHWQ/r3gjiAmf/5p+/GrWKc2RY0QqTemrW97PBRZoggk0lhfB+AjU61KJ4MHcccgLHqB/rU0qseABlgGm7/2Q4PT10CzHZgGCI1YA2RIKhgBzQs7HCqYUhLSG1UXNQaDMO+Zg6QaC/Pl9pQBXZW4i05Eznf7+yowWdjVFTLCVj6iTezQRrVf137O1mA0SV5NCbIGLvXAPuVMcVf1SlkdiAADq90goDM4tJru3EHrPey+p5FywHa49zcit/J/lmuEZ1bHMCxsxG+TrR+50KYC70zpegHc3APazo72DWO2amHvc26DjX5FL6Pc5/i4iwhyHuRLu8b/Fn5HTQg43szw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3387.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 10:16:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 10:16:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Subject: Re: [PATCH v2] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
Thread-Topic: [PATCH v2] macintosh/via-pmu: Fix build failure when
 CONFIG_INPUT is disabled
Thread-Index: AQHYSmhkQficGnPlkkO/1bDVZS/PTKzkPFeA
Date: Thu, 7 Apr 2022 10:16:44 +0000
Message-ID: <aac54b56-3f23-a210-822c-204f590fb94a@csgroup.eu>
References: <5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org>
In-Reply-To: <5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bed9d3b-b04b-471b-99c7-08da187fb795
x-ms-traffictypediagnostic: PR0P264MB3387:EE_
x-microsoft-antispam-prvs: <PR0P264MB3387B25FC8C97312F071F257EDE69@PR0P264MB3387.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wslc4r4eMwj52vTFTTYKSA6cOlTbvq4kEn/cWKBqXPSKN5yKmB3itbHw2w6rTuuRC3Gl/fPXK8laJibIKBcSxdGr5RFEMneUqimyEZjrdAwKsnsxr0MPSjZoGVRf5frv8NuP11+PX5oihiIy8u2CzR5fDD+66Ri/hsa49jVHBp/TxO/s2JH7hYQGzkhjc69YTqRfIR4KgKx2KDu6unQvLLm8rKXh66REbmbxfq3YF6CO1UBiHTKaihwWvKMnP3W0VFKbWfisKTy0w2SnhGcT/B8q/fu5JO8dgiLRrSHqaABfnv7UzeKngTqcgNqjWUoY2grxNhPdQ/P1VNYmzhqWsW1KfgUOkfUjoscb/0CSDCF8tqCTXWw+reRt79bIHgR9fzuGzz6uuAy//cmS/axgE0wTSxb7Yjm+21d/3tgxUZsDP+PWSzSPfa8MEZphnjmj0/yKsIRPmnDoZjFBs/i6ZD4NOWCn06T1Vk6gGtJE5O0Sq/V3HColylQNaPvJUSzoiht8Tg3ycnv8vUu/FgR610PDvxEWyx3JWuXXjniFnWksbyaUbTERJhCIEjUNAKfw6Q7oUodjF75cK6UQ0hbLJiPvyz80gZ9Q4QiUqtfY1pDeir0y/fDZNx+JRzyVHL/ShmosRL8dGstGPcaZVmrUZjPeORZwoMTnDK/gFPU7vJC9kWgsBzjQyK12UB/sKmUjVKKiwxw3da55moA2YpR7XJydrhBr3VuRvzGxcgOoqP3eVIdbvAqd0bEeLjon8IwUw5HlNX7ddBu64RHsqDWEMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(91956017)(8676002)(76116006)(186003)(2616005)(86362001)(31696002)(83380400001)(66946007)(64756008)(38070700005)(66446008)(5660300002)(66476007)(66556008)(26005)(6512007)(6506007)(71200400001)(6486002)(2906002)(31686004)(508600001)(316002)(44832011)(36756003)(8936002)(122000001)(110136005)(38100700002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDdveVptZk1LK2Nka2hhMXZRWnVrTW5SbmlBaTlWRmlReGFHRGdVWFM0REdv?=
 =?utf-8?B?WkpZNU51SWlSUUF0TnB3WTEwM0FoWExCTDA0SlU0ZHVXVzBsc0l6d09QUlFD?=
 =?utf-8?B?WHB5NzMxYnhEa0VQTExtYm9CYkJaTm1yeGx5cHlSY2xKcjA0cW1jWDhkQTFn?=
 =?utf-8?B?NEZMcmE1RVFwZmFWUDBjZm9QT3g0WjJXcHFpR2w1TFgxYTU2Mk16WXl5WkRW?=
 =?utf-8?B?ZFNCZDlrNEErUEZnMW1ub09NQmFBQjVoZjloYUhsNituTGNWdnpVQ3BibmZp?=
 =?utf-8?B?bWhiZ1luUVNZMDQ0ckY5aVdBWkt1MW5lc3dPZ2puMlBDRkdpbTZjVlZ3R1F5?=
 =?utf-8?B?R0pBMkFmbEE5aUN3dGpNczNpWm15djJaU203MDRmRnIvcnBiU0taaEYyRjZP?=
 =?utf-8?B?K0dCR0dRcXBwczdFbWFsUDhoSGVTWDUramVvNGk1T3ZRYXg1WUxOTnRoajhh?=
 =?utf-8?B?Z2FjaVZnVU5TdW96Zk5xWGFVbTY3c01pRDlwcG5BVGZ2Y0srRytIelhvQXQ5?=
 =?utf-8?B?amtGdGZXOExGWVRSVHJCWmhGczNtQUVtK1NjL1lMKzJyMWF6NmFaNi9nVmxC?=
 =?utf-8?B?VU9YS1ZkNi91bXZTaGxHd1lsdWlXVmdVQ1hNajYvVUd1S1gzNGw2Q2w4TFBZ?=
 =?utf-8?B?eWphbmV3a09zSENRVkZONU44bmpXeG9CN1gvQThGNXpVTllidy8yUXZobUVR?=
 =?utf-8?B?RmhDNFJzWC96MlBiblVkYlVvbW5LckR2SzlUVmwrb1dtSit5bWU3SGNZdE9S?=
 =?utf-8?B?VEVZTHpNYkVJUWpvQnU0bkVDSUovWmUwVjFBMmZVZE0xZllQMkNxZnRKVUdS?=
 =?utf-8?B?NFkzRzdIQWJVT1gwMU91VXBZbkwzNW1xTXUxWGIrWDN5MFl2amFRM0Z1VXd6?=
 =?utf-8?B?MitTMS82YVdjOE9xMEx6RzRBZ2lxdnNXRWRINVh5RTNpTnZMWkZFMzRNOVUv?=
 =?utf-8?B?MmV2akJTYzhRSnMyZTQrUTFhUVBQVzdiUzBNR2ttTDhxU0pZc0VqK2xzUnNG?=
 =?utf-8?B?RWZjdFpZUFZ6SURKRDAyQzRRNng3MGFYcEdXNnBvYjJrUGExRmRkQXFGWkhK?=
 =?utf-8?B?OCtBK09qbjE4TEhoaEowY2ZJZVlWdjkwSlNSNStwS2RzN3YyTDZPU01kSnJq?=
 =?utf-8?B?b0dycWtBbTlEMEdwZWpid3BqVUUveVg4Umpyb0M0TGw2d0NXZFgwcXRnK0Zu?=
 =?utf-8?B?K1ltaTJWZkNQL1Q0MWo5NHdJRXhKQ2dhVG5qOXRjbGYvYndSOVkvRGsxdWda?=
 =?utf-8?B?cXo1cWh1aHB6Qk9xZnJLYml0K0NPTlB5STZjQnlpeDdzekwrWXYwY0JtN3Jz?=
 =?utf-8?B?UXF6TTRIU1VtbzYyNHVkamtaV1M0MFd1YTNXT1Z1cEZuT2ltaWtnSyt4alZa?=
 =?utf-8?B?NnRTUGRCOGhpeTdXQmlaT3BDbFhySCt4ZjR5MmVVdStrNXdMSXRUWlBsdUM1?=
 =?utf-8?B?bDFLOVdRaDl4NEp4WlAvZXZLdVFBaldxTjBpL1Y5WkZsT1hDdG1iSVExMWda?=
 =?utf-8?B?bkYyQ3ZLVmM5VTRoaVFjdFJoWFpVSjRWOGRsOVErOVI4YXUwLy9DWHIzUU9q?=
 =?utf-8?B?UXBoZjcyMHVlTWlnODFhdGFaNnkxTlErQ0xDODZFcVlyamw5UUMyT3N0b3F3?=
 =?utf-8?B?OEVPWnk3d0diWm1ZUWdld29hb1FGdmhvR2JtNU50TkNwalNVb0JYTHRUN3N4?=
 =?utf-8?B?Qmg1bDRVQUQxZmdzNHFyTWZENEI5Ry9xRVVCKy9iU3Q1UWZtNm5RcDJXeUdt?=
 =?utf-8?B?L3FFODl6dlNiYzAzc2VJeHJlbEZTU3ZEcCtUSjMzWUdsTzM1MVN6cThTRnRB?=
 =?utf-8?B?THlNTHB3d0ZoWGFLTGJieUxNMjRuWnozdjkySHNsTWhNMlFkUG5FY3pMTmVD?=
 =?utf-8?B?SkhjVmY0YzlpQmEyOURGcWUvNk1zbkpZR09NVUR5YS9iOEtHOVNOU285NWdj?=
 =?utf-8?B?cFBaem1pU0x5RFE3TmVSU3hHVHgzOXJwdVUyaGFqVXRnWHlJQmMzcytGMkZl?=
 =?utf-8?B?YU5TTmFpclozZndSeXVDdnJSd2FtM1lNQWRPZEJXbmRNa0luQlduY3h1RmNu?=
 =?utf-8?B?R2w1bG12WE5JaElkWmE4NGN4Y2U5UzhMRURqbjZkbE5TMmc3Z0pZM21OQmtX?=
 =?utf-8?B?aUpnczZ2UlVhWnVjVU5iOUpxcWJmVGEvcXBERXpMUDNiOWM2V2lFYlVNNm43?=
 =?utf-8?B?cjd5VkI4dGlyaFdMWks2YnEwVXEvNk9veW1lRTU2L1ZFWHQ3MDA3cHloOTFV?=
 =?utf-8?B?TjNkMlJuZ2V3eDNXNlpIR2pzV2RoKzNiVXluUUFsLzIzWWk4ZGZ2ZTlYNWN1?=
 =?utf-8?B?anU1UG1HOUZPYTZIRldEcEhPcmpKS0laaGhvcUx5Y0FCYlF6bGNJNEg4bVA0?=
 =?utf-8?Q?UgK7GbS+r8Qx8FSZPqrvNIfstyYiWbf9LeFaa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2EDA1E306D19B4C8F6EAC5A9E3787AF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bed9d3b-b04b-471b-99c7-08da187fb795
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 10:16:44.5825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4rkANDLEOIECSNb71CN1FQWkoIeBQHloY09tMEUNroHrdMdwz+bZhDFdOoIc4uSGe/lhz6GqTEOy6Y8/kfLgLiGySFNJBRDLY9+KDKg6bKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3387
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
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA0LzIwMjIgw6AgMTI6MTEsIEZpbm4gVGhhaW4gYSDDqWNyaXTCoDoNCj4gZHJp
dmVycy9tYWNpbnRvc2gvdmlhLXBtdS1ldmVudC5vOiBJbiBmdW5jdGlvbiBgdmlhX3BtdV9ldmVu
dCc6DQo+IHZpYS1wbXUtZXZlbnQuYzooLnRleHQrMHg0NCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGlucHV0X2V2ZW50Jw0KPiB2aWEtcG11LWV2ZW50LmM6KC50ZXh0KzB4NjgpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcNCj4gdmlhLXBtdS1ldmVudC5jOigudGV4dCsw
eDk0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZXZlbnQnDQo+IHZpYS1wbXUtZXZl
bnQuYzooLnRleHQrMHhiOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2V2ZW50Jw0K
PiBkcml2ZXJzL21hY2ludG9zaC92aWEtcG11LWV2ZW50Lm86IEluIGZ1bmN0aW9uIGB2aWFfcG11
X2V2ZW50X2luaXQnOg0KPiB2aWEtcG11LWV2ZW50LmM6KC5pbml0LnRleHQrMHgyMCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2FsbG9jYXRlX2RldmljZScNCj4gdmlhLXBtdS1ldmVu
dC5jOiguaW5pdC50ZXh0KzB4YzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9yZWdp
c3Rlcl9kZXZpY2UnDQo+IHZpYS1wbXUtZXZlbnQuYzooLmluaXQudGV4dCsweGQ0KTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZnJlZV9kZXZpY2UnDQo+IG1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MTE1NTogdm1saW51eF0gRXJyb3IgMQ0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjM1MDog
X19idWlsZF9vbmVfYnlfb25lXSBFcnJvciAyDQo+IA0KPiBEb24ndCBjYWxsIGludG8gdGhlIGlu
cHV0IHN1YnN5c3RlbSB1bmxlc3MgQ09ORklHX0lOUFVUIGlzIGJ1aWx0LWluLg0KPiANCj4gQ2M6
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IFJh
bmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGaW5uIFRoYWluIDxmdGhhaW5A
bGludXgtbTY4ay5vcmc+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+IENoYW5nZWQgc2luY2UgdjE6DQo+ICAg
LSBBZG9wdGVkIElTX0VOQUJMRUQgdG8gYXZvaWQgYW4gaWZkZWYgYXMgc3VnZ2VzdGVkIGJ5IENo
cmlzdG9waGUuDQo+ICAgLSBBZGRlZCB0aGUgQURCX1BNVV9FVkVOVCBzeW1ib2wgYXMgc3VnZ2Vz
dGVkIGJ5IEdlZXJ0LCB0aG91Z2ggdGhpcw0KPiAgICAgYWRkcyBhIG5ldyBLY29uZmlnIHN5bWJv
bCBmb3IgbGl0dGxlIGdhaW4gQUZBSUNTLg0KPiAtLS0NCj4gICBkcml2ZXJzL21hY2ludG9zaC9L
Y29uZmlnICAgfCA0ICsrKysNCj4gICBkcml2ZXJzL21hY2ludG9zaC9NYWtlZmlsZSAgfCAzICsr
LQ0KPiAgIGRyaXZlcnMvbWFjaW50b3NoL3ZpYS1wbXUuYyB8IDIgKy0NCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnIGIvZHJpdmVycy9tYWNpbnRvc2gvS2NvbmZpZw0K
PiBpbmRleCA1Y2RjMzYxZGEzN2MuLjM5NDJkYjE1YTJiOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tYWNpbnRvc2gvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnDQo+
IEBAIC02Nyw2ICs2NywxMCBAQCBjb25maWcgQURCX1BNVQ0KPiAgIAkgIHRoaXMgZGV2aWNlOyB5
b3Ugc2hvdWxkIGRvIHNvIGlmIHlvdXIgbWFjaGluZSBpcyBvbmUgb2YgdGhvc2UNCj4gICAJICBt
ZW50aW9uZWQgYWJvdmUuDQo+ICAgDQo+ICtjb25maWcgQURCX1BNVV9FVkVOVA0KPiArCWRlZl9i
b29sIHkNCj4gKwlkZXBlbmRzIG9uIEFEQl9QTVUgJiYgSU5QVVQ9eQ0KPiArDQo+ICAgY29uZmln
IEFEQl9QTVVfTEVEDQo+ICAgCWJvb2wgIlN1cHBvcnQgZm9yIHRoZSBQb3dlci9pQm9vayBmcm9u
dCBMRUQiDQo+ICAgCWRlcGVuZHMgb24gUFBDX1BNQUMgJiYgQURCX1BNVQ0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tYWNpbnRvc2gvTWFrZWZpbGUgYi9kcml2ZXJzL21hY2ludG9zaC9NYWtlZmls
ZQ0KPiBpbmRleCA0OTgxOWIxYjZmMjAuLjcxMmVkY2IzZTBiMCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9tYWNpbnRvc2gvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRvc2gvTWFrZWZp
bGUNCj4gQEAgLTEyLDcgKzEyLDggQEAgb2JqLSQoQ09ORklHX01BQ19FTVVNT1VTRUJUTikJKz0g
bWFjX2hpZC5vDQo+ICAgb2JqLSQoQ09ORklHX0lOUFVUX0FEQkhJRCkJKz0gYWRiaGlkLm8NCj4g
ICBvYmotJChDT05GSUdfQU5TTENEKQkJKz0gYW5zLWxjZC5vDQo+ICAgDQo+IC1vYmotJChDT05G
SUdfQURCX1BNVSkJCSs9IHZpYS1wbXUubyB2aWEtcG11LWV2ZW50Lm8NCj4gK29iai0kKENPTkZJ
R19BREJfUE1VKQkJKz0gdmlhLXBtdS5vDQo+ICtvYmotJChDT05GSUdfQURCX1BNVV9FVkVOVCkJ
Kz0gdmlhLXBtdS1ldmVudC5vDQo+ICAgb2JqLSQoQ09ORklHX0FEQl9QTVVfTEVEKQkrPSB2aWEt
cG11LWxlZC5vDQo+ICAgb2JqLSQoQ09ORklHX1BNQUNfQkFDS0xJR0hUKQkrPSB2aWEtcG11LWJh
Y2tsaWdodC5vDQo+ICAgb2JqLSQoQ09ORklHX0FEQl9DVURBKQkJKz0gdmlhLWN1ZGEubw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jIGIvZHJpdmVycy9tYWNpbnRv
c2gvdmlhLXBtdS5jDQo+IGluZGV4IDM5OTA3NDMwNmE3NC4uNDk1ZmQzNWIxMWRlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL21hY2ludG9zaC92aWEtcG11LmMNCj4gKysrIGIvZHJpdmVycy9tYWNp
bnRvc2gvdmlhLXBtdS5jDQo+IEBAIC0xNDYzLDcgKzE0NjMsNyBAQCBwbXVfaGFuZGxlX2RhdGEo
dW5zaWduZWQgY2hhciAqZGF0YSwgaW50IGxlbikNCj4gICAJCXBtdV9wYXNzX2ludHIoZGF0YSwg
bGVuKTsNCj4gICAJCS8qIGxlbiA9PSA2IGlzIHByb2JhYmx5IGEgYmFkIGNoZWNrLiBCdXQgaG93
IGRvIEkNCj4gICAJCSAqIGtub3cgd2hhdCBQTVUgdmVyc2lvbnMgc2VuZCB3aGF0IGV2ZW50cyBo
ZXJlPyAqLw0KPiAtCQlpZiAobGVuID09IDYpIHsNCj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklH
X0FEQl9QTVVfRVZFTlQpICYmIGxlbiA9PSA2KSB7DQo+ICAgCQkJdmlhX3BtdV9ldmVudChQTVVf
RVZUX1BPV0VSLCAhIShkYXRhWzFdJjgpKTsNCj4gICAJCQl2aWFfcG11X2V2ZW50KFBNVV9FVlRf
TElELCBkYXRhWzFdJjEpOw0KPiAgIAkJfQ==
