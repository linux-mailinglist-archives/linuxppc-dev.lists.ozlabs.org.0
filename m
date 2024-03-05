Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C1E8725AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 18:30:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WS//ixpk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq2f22d3vz3vgb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 04:30:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WS//ixpk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq2dK1HsGz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 04:30:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt6TQtJicDm3/UJFX9C2p7zgo4M32aGr5IcmbdhbHTpL8XKhImY+Y2sWmlNRhjWHOgpJEjqS/L+mgJY6lbHrGgtKIie9L/IjayvXd7txPzz/rLgLTNZ2C6zTiV3c1u0T0t+lm9T3pbaYKutIbndshoOkLFm6e87XJpFK+y3ULd3BEwcNNKSR3/gA3MP65EdvnVN0Qw/MwHQFVsg6kubvBx2lBgEp/ja/B+UMM48HGr3lZ7FMxdNUIu7/MrfoR1f7BG09U2i57zABsWJdEeKVzVoWWLmU6PUWw7vM2vCc42U5xWscZM/VApW/vzA2b45jP7JASXTgylvFZViLDrKCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkIj8XOYmqDjFQmV6OmwwR2GUQqjDtmyQezS+v2Z8iY=;
 b=kGUjCpZnq1ve6MIaqNqQai5f5jrUcOJPvHukNnFuTGNEK8uBICQkutBNGdFv7FJLyuyA3CjtSh92q4KFuYR1cKrXRXoUJrC8Sw8u91twJmQWZU1el9ZOOWE7/wLbPRXXvQkdKI4m3oPWXVsZLY2mFLq+qZ/Pf9ZKFcKMrcT53DkgCFkvZqIv2ebs7jvrtuaI2c1pCP2VFfsACCLITaOZP0OPDmA01AGh5m37u9/auQghWRHAaRCrJNVKIb9zetDuwJCQKqk40G1zzHghXujIr6ButZEZ+VSbq15raaYZmero/+Kiqpn8hyjbeaV2jjfS1RLJe1viAoDSKzuTXNxz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkIj8XOYmqDjFQmV6OmwwR2GUQqjDtmyQezS+v2Z8iY=;
 b=WS//ixpkyw9P5xFzPWznVJcL8kKoaS2iUYY1+qclLaA4yLMi26GAXOp58i1b+Xo9t6RrOgQmmLFm6KkhDbybwlaMJwzSvOpr0F5uxsILIBDXCTOUpyatRBtbEwBiZdwcQEMqAp/9C8ryKzj4mobN1YlFq0KzLHJ5PwBU1beJ9gAvNj5reCA1Hp83Pi68gWTgF5R2rPwhPLkqp/SXGV4klBeF6646mbpoVqqAqY0LmOAokpO8L7uMWeEfUPBhzWGAmyfYMw4w1VbKLECWubpUQpw/cNLSP04f1KKs+SWUskp8Rg2MmWsTgMpePSwcAzo6tiWJ3kz22mmw7n6xyOT2Sw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2747.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 17:29:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 17:29:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 01/10] mm/ppc: Define pXd_large() with pXd_leaf()
Thread-Topic: [PATCH v3 01/10] mm/ppc: Define pXd_large() with pXd_leaf()
Thread-Index: AQHabrbvHsWAkvT/s0GqPfFOBfOBGrEpZ/4A
Date: Tue, 5 Mar 2024 17:29:45 +0000
Message-ID: <a4bcf0b2-bdc1-4832-8d29-1203b5f25d82@csgroup.eu>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-2-peterx@redhat.com>
In-Reply-To: <20240305043750.93762-2-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2747:EE_
x-ms-office365-filtering-correlation-id: ba6200c4-4ef6-4a90-d25b-08dc3d39d9e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gQfiyygG63XzwaWx+QJs11fP7QArfcNtc/zqYgGBk5U1lGliKhif33qW4mL8/V9TU2bzN8BcgU5aIe2CKQnEsps75PTx1UAgTtkbno2ubz7FlCjVMmwYyl2mveT9GQSHtbZDPAF8gPcrKoAnHHy3oUzq4WO79FcTIYOa5/fi+wkgFLceHEviUOOOUOErJHrQzoh7OvzW6xfKi9FJVjZV0aqVeX+D/P23hJyfwLJxmotV0ZctoekfZUAh4EWQ8hgnyUL3I4djxDqdWSY6sfrMWBwxp6p8cSzqD/Tz2Bry7KwaBFvhzKHkUUhNa7BFQ7IkuVZGZSIlneqiZ8WCi8bWLZCQX1d7hSoNA6x4TrN0xJfqlKB5zUstPuhgbNDXqMf1YkNjdN7pR+MS0fbCpMxjjPQJlZ/xDH/5YuaX2upAgMIaZ9PozOODA3YvqIDuNYS76Ldj4tzCX2p9eMEiOEIRvUVM1ZIwLo4TH8nWK8hE5UbkTtqkqrrpiIuhv8ecQpn8TBb41nWSLVJT07xQMl4eB8XZ2Ic0Q38v9hITgbZ6IjnVLTDOvmZmgxRWM4poZAZuKI4GzZXVZ41MFIoCDiXdno2B+uezANMpymekmVjgv2EQFrUg6Gf5sHWajekzwr5f573hV1BOrvnczaldB2V6//eZihT+IOy7tvDDNM0tGPw6ZmCwOBRBf4DWVM8Us1FoagVnXuTxzkUpYYJVaGxFNIKB0FarYobgOPCMOvLZlGk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SG9ySFlFdFNqQlZrYW42d2V6T3BZTzJ2dENqYUtJbXdId2d1MTFHKzhxbG0r?=
 =?utf-8?B?ZHRSa0JBUzJtRjBKaTkybnM5bWQwZWdhSzNOT25SMitCTG5MRlBLZzVvM01K?=
 =?utf-8?B?YlZuYjY0Z2Z3RHpZWHBIeHpvVkJ3MDdzMXI1UTB6cUM3bWdrYjlRempabTRu?=
 =?utf-8?B?TE9uengrTWQ5V2xUYmE5VkZ6SHhkalR5NnFHRnBuUTZPTGQrbzNrUm9uekVR?=
 =?utf-8?B?Y1N4WGNCUnJKQ2Z6bmgxUk9Pb3VDdHRBZWd6Ly9Za01KenArZEpvNDdTZzNU?=
 =?utf-8?B?cjFDZXMvNUp3SmZQNlNadjBMc0crQUhCOVIzb1gxQ2dzRmMwTEgzWHpWdjNo?=
 =?utf-8?B?c0RZUVVqRnVEMVRrVTZDYWZtREhKOCs5eWhqMlBlYWJmTGV6bTBHSzlNU2xH?=
 =?utf-8?B?Z0l1bC94Vm4zbjFna2hEd0VuK1JTTkM0UlFTK3lvMDlmYjkrRnE3cHhKVXp5?=
 =?utf-8?B?WU9kYmI1Tm5XRy8yTzQyZDhacXg4M0hiVG91aUZEVnB4U2ErMjQxZTY4OTZW?=
 =?utf-8?B?UURiRFR1VFVBZSttaTZoVk0ySUwreDljTlYrZnBZdDhDT1JaOWZ5TlIrc2c5?=
 =?utf-8?B?czlkczYvZ2hJdnpVK2ZhWkdzc3BzTFdkTEVtdnF3ak8xSnlDajlQWVFXc0k5?=
 =?utf-8?B?SElQSE9RcHAwOWZEZjZXbERHVjBNelZqZ1h0VExpa1N5QTc4WjZKZ0s2OUIr?=
 =?utf-8?B?NXVJYktQazZDK2VyYmJ3RWxVckxqN2djMUlEdWRVQWppejFRZGJ6a2RXSWt1?=
 =?utf-8?B?ZkszdVRiY09PWUlwWUIvSGNodmlzcHdudjE4RTV6T1hHSEl2Wi9vZExPdUVL?=
 =?utf-8?B?R1hJNFBsQVFtOFBhZlVwV1dULzY0MFdpYmNtdWs4RUllUW5TdHU5NEh6TWFD?=
 =?utf-8?B?VzRYcm90bDAxSHV1R0RyMVZxTXJ3aXg5cFY2Z1E0MU9zUHBiNjkrNGJObnV2?=
 =?utf-8?B?eWNiMk5XNkt4SUF2YzU1Ym1qZHZsTEZNYlB3MmJsOWR0clQxdnlaQ0JUcW1P?=
 =?utf-8?B?Q0ZHYTIzVDVWamlQckFuY0xKOVVPK3RyM2JONnM0blhNTzBJVFNrSm1WQ2pj?=
 =?utf-8?B?a2FpWEpWZUY4S2doWmxDOGJmNFJ1bEF1Mm9HZVk2ck55K2xyeHczanlwdU1q?=
 =?utf-8?B?U2FQbDZGL0JDRmlkWnVybklIeUJEb2VwYmdpajlzUk8rTndLNklPL0hsbmls?=
 =?utf-8?B?VTZjdXlEMHROanFUa0tkV0J2cTM4dnF4My8xaE5pQzl4M2pzWmxYaVJvOUFz?=
 =?utf-8?B?UjcyT2g3QWFxRTd1ZUY0ejRxbWZFbGg0bDRJNmV1b0dJMDR1QkFxMmJzUlZk?=
 =?utf-8?B?c1R2WXN6cEVxcUxQOHg5K3B4ejMrb3ltNFNQcy9rWGF3c1BwRWdFQkNxTkd4?=
 =?utf-8?B?cFNFM2RwU0ZPSk85U1FoWVllYXMxSUJJcEdxNXhpaCt2dkYzbHU3MjVGMGRW?=
 =?utf-8?B?Z0srUHRWTzN6N1grTm5mSU1sKzFYV2lZK2lsNncyb21wU0I2aTE1WHh2VWd3?=
 =?utf-8?B?U09iYkR0M1lhZmp3bGRuS1BGU0FuYjZKOVR3U2JnYnZZU1RsUGxOdUVML09V?=
 =?utf-8?B?Qys2NzJ2c2U5T08xYmhKNDZpT1hwMTN3SHZOL2tzM3l1NWhLLzZQd1U5NURJ?=
 =?utf-8?B?UGJWOUY1SkpCUlQ4VnVkOFhxU1k2Sk1nenlFazlmeGV3VW1KQWg3WXRkdFBV?=
 =?utf-8?B?bWhINlBvN0d6OCtPUTZFSm5jUi9XalFXdnh5d3UrZ2Y3Y2xHTi8rN2Y1ejlx?=
 =?utf-8?B?UUo3MDhmcXdWL2hYT3FiY1V3bjM4VnlPbXA3TjQvb2llNkh5TlpValJjMDIr?=
 =?utf-8?B?RG8ra3o0b2tOOG9KV0F6dkJzZS84dE0vRUJYbS9MaHR3UEJrQS9UZ29nVUJF?=
 =?utf-8?B?VGJZVm1JWmJKakZSSkg1TjM2ZHpIQUc5YUJscU9hdWdIV2J1SkRxQ2o4VmFH?=
 =?utf-8?B?TWpyenFTWEhPWW5vSTRsT0MzbTIrdTNPMVFjYWl4bWRSalMxK2h0L3VvSDRR?=
 =?utf-8?B?YWVzN1BvM1lpVlE3aUE4OFYrUE5NR3ZLdXZhcXZSQTNPRnlyUjVzRmdaN3pK?=
 =?utf-8?B?c3BhRkZIeUpiVy9Md2x0ZTR3aDV2bDdNbGljVjVubGxpN0dhSVJNcXQwdEFF?=
 =?utf-8?B?ODkwUTFQVWNnYkVuZVpZSVZVaWxnOWxQODVFRUNHK0prMHZ6cDhWMGJ0YjRx?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9A3A0EC34781248B70E64D6A1C5187C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6200c4-4ef6-4a90-d25b-08dc3d39d9e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 17:29:45.7378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SndaEmouJXTBhNpCe8cSrcbEsLCkW/pDy7fnU4vrA7WnDc/gF6H0wY4L5/71QgLaggLkjZL4IRHaLylOVIJ7EJr5MgJm1C9G77LExCAGpfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2747
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAzLzIwMjQgw6AgMDU6MzcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IFRoZSB0d28gZGVm
aW5pdGlvbnMgYXJlIHRoZSBzYW1lLiAgVGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGF0IHBYZF9s
YXJnZSgpDQo+IGlzIG9ubHkgZGVmaW5lZCB3aXRoIFRIUCBzZWxlY3RlZCwgYW5kIG9ubHkgb24g
Ym9vazNzIDY0Yml0cy4NCj4gDQo+IEluc3RlYWQgb2YgaW1wbGVtZW50aW5nIGl0IHR3aWNlLCBt
YWtlIHBYZF9sYXJnZSgpIGEgbWFjcm8gdG8gcFhkX2xlYWYoKS4NCj4gRGVmaW5lIGl0IHVuY29u
ZGl0aW9uYWxseSBqdXN0IGxpa2UgcFhkX2xlYWYoKS4gIFRoaXMgaGVscHMgdG8gcHJlcGFyZQ0K
PiBtZXJnaW5nIHRoZSB0d28gQVBJcy4NCj4gDQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29t
Pg0KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0K
PiBDYzogIkFuZWVzaCBLdW1hciBLLlYiIDxhbmVlc2gua3VtYXJAa2VybmVsLm9yZz4NCj4gQ2M6
ICJOYXZlZW4gTi4gUmFvIiA8bmF2ZWVuLm4ucmFvQGxpbnV4LmlibS5jb20+DQo+IENjOiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbnZpZGlhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgWHUgPHBldGVyeEByZWRo
YXQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQvcGd0YWJsZS5oIHwgMTYgKystLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgIHwgIDIgKy0NCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBpbmRleCA5MjdkNTg1NjUyYmMu
LmQxMzE4ZTg1ODJhYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy82NC9wZ3RhYmxlLmgNCj4gQEAgLTExNTcsMjAgKzExNTcsNiBAQCBwdWRfaHVnZXBhZ2VfdXBk
YXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB1ZF90ICpwdWRw
LA0KPiAgIAlyZXR1cm4gcHVkX3ZhbCgqcHVkcCk7DQo+ICAgfQ0KPiAgIA0KPiAtLyoNCj4gLSAq
IHJldHVybnMgdHJ1ZSBmb3IgcG1kIG1pZ3JhdGlvbiBlbnRyaWVzLCBUSFAsIGRldm1hcCwgaHVn
ZXRsYg0KPiAtICogQnV0IGNvbXBpbGUgdGltZSBkZXBlbmRlbnQgb24gVEhQIGNvbmZpZw0KPiAt
ICovDQo+IC1zdGF0aWMgaW5saW5lIGludCBwbWRfbGFyZ2UocG1kX3QgcG1kKQ0KPiAtew0KPiAt
CXJldHVybiAhIShwbWRfcmF3KHBtZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9QVEUpKTsNCj4gLX0N
Cj4gLQ0KPiAtc3RhdGljIGlubGluZSBpbnQgcHVkX2xhcmdlKHB1ZF90IHB1ZCkNCj4gLXsNCj4g
LQlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFRFKSk7DQo+IC19
DQo+IC0NCj4gICAvKg0KPiAgICAqIEZvciByYWRpeCB3ZSBzaG91bGQgYWx3YXlzIGZpbmQgSF9Q
QUdFX0hBU0hQVEUgemVyby4gSGVuY2UNCj4gICAgKiB0aGUgYmVsb3cgd2lsbCB3b3JrIGZvciBy
YWRpeCB0b28NCj4gQEAgLTE0NTUsNiArMTQ0MSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19w
dGVfcndfdXBncmFkZSh1bnNpZ25lZCBsb25nIG9sZF92YWwsIHVuc2lnbmVkIGxvbmcgbmV3X3Zh
DQo+ICAgICovDQo+ICAgI2RlZmluZSBwbWRfaXNfbGVhZiBwbWRfaXNfbGVhZg0KPiAgICNkZWZp
bmUgcG1kX2xlYWYgcG1kX2lzX2xlYWYNCj4gKyNkZWZpbmUgcG1kX2xhcmdlIHBtZF9sZWFmDQo+
ICAgc3RhdGljIGlubGluZSBib29sIHBtZF9pc19sZWFmKHBtZF90IHBtZCkNCj4gICB7DQo+ICAg
CXJldHVybiAhIShwbWRfcmF3KHBtZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9QVEUpKTsNCj4gQEAg
LTE0NjIsNiArMTQ0OSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwbWRfaXNfbGVhZihwbWRfdCBw
bWQpDQo+ICAgDQo+ICAgI2RlZmluZSBwdWRfaXNfbGVhZiBwdWRfaXNfbGVhZg0KPiAgICNkZWZp
bmUgcHVkX2xlYWYgcHVkX2lzX2xlYWYNCj4gKyNkZWZpbmUgcHVkX2xhcmdlIHB1ZF9sZWFmDQo+
ICAgc3RhdGljIGlubGluZSBib29sIHB1ZF9pc19sZWFmKHB1ZF90IHB1ZCkNCj4gICB7DQo+ICAg
CXJldHVybiAhIShwdWRfcmF3KHB1ZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9QVEUpKTsNCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDdhMWJhODg4OWFlYS4uNTkyOGIzYzE0
NThkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTEwMSw3ICsx
MDEsNyBAQCB2b2lkIHBva2luZ19pbml0KHZvaWQpOw0KPiAgIGV4dGVybiB1bnNpZ25lZCBsb25n
IGlvcmVtYXBfYm90Ow0KPiAgIGV4dGVybiBjb25zdCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsx
Nl07DQo+ICAgDQo+IC0jaWZuZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQ0KPiArI2lm
bmRlZiBwbWRfbGFyZ2UNCj4gICAjZGVmaW5lIHBtZF9sYXJnZShwbWQpCQkwDQo+ICAgI2VuZGlm
DQo+ICAgDQo=
