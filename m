Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB47C880B21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 07:17:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cJrqhReA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tzz0c27Jzz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 17:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cJrqhReA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tzyzr253Wz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 17:17:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epD4nbGZJrKTHIwyF1DC6oC34hl2nCXAzujlVp9gKjuQjQCkp9Q9yxcNb5C0tGPGc6jc11SeTKCUS8KOqVE+qDi0Mnqvp2Q8Wsjr/qlGXq6iSEPkR61m3POIEK4qrn9m5TJ/A/7LFWZKyqHySGWeJnRTibv+XDBO0UhIKeiBGnulRxT9cQUJ7sXd1zGczAA4JTK0CqSdDZX5/dbiJLIJK7qqxYRx0wGwq24IhSpMBMEUMzbds0k33/JfCWU6L1TjwfsBArb2iYS6hugjSGHE/5L5RdjlDM7sk26FYjCg9BaYho2sGA5t6ui/gNNOdQqK7zh5Zarm39s27A2lleopEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlrSI7RQ2DWnMdL3//dCwiOLtz+4s1MXXIMIK2fGd7Q=;
 b=Z/HiELBUd3ZUwabR+S7zFrylVZHwbEhBfNd4abM5vuBHR8pSGjPQU/9h9SRiNCLKAi86Qc7kBdM8Ib9vnWnxbLhXKWnH66xeheNU1uzwzRZh2O+K1l0QoHem58SpAw/KJqlia17D3lMZuG4gFz2yihUsCyNwdIxB1JoVUjhTqxPc0kODUbGtpguWOUqhcYP9TzrDu3IAPaafobTaQ/Db24NMHIzjll3CaW8MAJDO2Z/1+luYCcXbvuldsZalezavprmyRQuBnvhb/hb7OiJ+/XEEaJlatvZx+xRRTmfO4UuOvbjmCsqOsMyd6mTBjC+ZGxbzHNClaxTL65SJFf6PsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlrSI7RQ2DWnMdL3//dCwiOLtz+4s1MXXIMIK2fGd7Q=;
 b=cJrqhReA2WJMzQF/Am53kteimqXlFzXB1AQ32ZMmFzH85CoZ93443KwfYm+Zs3XYLu1+++HvbowVjtqXBxmFj//4Kk4jeAl4/sbPZ3G5KN9hnlafZaI1ffHVCO4L7jHdGCvzadImMMfBL0xTshZZ8QeoccDtr0S743GUbWWhFda2zyzBzP7s5ZBGBGu2rqBOc2+RBcCKxWiYCSySo3zF7ZmiIxB9dwODl3TPz+6J+gsOGef5HTbf2dVVLS6d4t2KzyJ7i9vvGiIGJ++yuLN3+qYZyQ6ALCruZD6Gr3x4S3I9hJASIgJqTUj1ONe+Q6XdOd2zm0HpVTzYp9Dd2SyPZQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3527.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Wed, 20 Mar
 2024 06:16:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 06:16:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Index:  AQHadZASkAUcDDurK02wtpi3kLRmM7E27NOAgABFZ4CAAAUJAIAGfI2AgAIFYYCAAAWMAIAAcnoA
Date: Wed, 20 Mar 2024 06:16:43 +0000
Message-ID: <7ca8f19e-7517-404a-b7bb-92ac516d87c8@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu> <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
 <20240318161519.GA5825@nvidia.com>
 <e0417c2a-2ef1-4435-b5a7-aadfe90ff8f1@csgroup.eu>
 <20240319232656.GC159172@nvidia.com>
In-Reply-To: <20240319232656.GC159172@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3527:EE_
x-ms-office365-filtering-correlation-id: 8b0187e5-5253-4e95-9ba1-08dc48a55084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SFhzero1PxCQjMw/dAnUj5EPRdSyYScGronXcLH/lx83Wtk/1b1NzmDU85vjcySDD/8E747rweM3FYuVJ0CM6sZk+Qgb6FyBVF40gqYcbFNvhx4TxwkXvLhxvlOdxbx67i0c0ZTNAbiAdEjTmbqzt0JYlNfxv/ujV4inTM568NFuD2fd0drOpGLKyhFVnXFp+VJGK0MYYpJttYtdAh2G5b0IwmV+VKNT1t2Qn7UED+CmujT0FQp8IZSIqepietipQ26ElOnprnZtMHqPyPxrZFWVADObDRLVPXjvpOtk6MCY6ABX3CidV7l6hOFfpZs8L+HxMV3HuQncRBR5s1abOXCfSol+wRFAnRvCRPRkAynpsTPY6OpMR8gJAsm6dBDH5ArbZLcGaoqtbVdA6UKxXuFJFNl5p2xKzhyr/n4Hh/KaZLMVBTJ7LqHW7xnVBldYmgKiMkwQoTVZPaxMvyWAvWU9h3ecWrnYD//EN85cyASTcifo2sDOOJwsayMr/ei15e63BaCYk5ScqTWtOkMN51CxxIPMt+Cx7TqJ7vVicYq0ayJpm6o8Lbqq4Kdgk0TlJf73FPkUT+IjzRB7vJYn7rKkE/gK+99jj9JafmVDpDIe2xqFMAdOKRuvILeVd1TFN0RFivxAjDmGLrXePMMUeezX200PJOePcAsL/C9DCqglF5IeG46IeQzy33ES8On4osjD5JUjIdJbSiccC15D0AyZdjDMl2qYOfw4umLy0oY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZVp3b0RhY3lkL0F1eFIwWmRZZ2dTREsrZ3ZNR0twK0JuN0pVSnhpeGY5SXpS?=
 =?utf-8?B?dmpBVkVkWTFWWjlHdWc4Ky9NbmlqWlhoUGxnc2p6dzhQK00wTmFmV2xwMnpB?=
 =?utf-8?B?VElkZEJ0WkN6TUFvNDZOSDZ4anltM05DeVN6dlJ4cWpaZTZkcE9tajdZTmor?=
 =?utf-8?B?NEtqOTd5UCtCeklzaDJrM3BLSzhwdzlEbGVDcS9kTlpNUEIxZFFkenJQNDIr?=
 =?utf-8?B?aHN5RmM2ZUdMVUxSL3ovQXJ0U1QxRkU5YnRkc1J1NVRCU1lSMkxna0EzTUtl?=
 =?utf-8?B?cS9mN3JTMW00MW9tMmVKRjN1NXhoVWlpNUt2ZVZISHprcXNqZ3hEWHFneWh2?=
 =?utf-8?B?T0h2bmZPZlRLSzFKekRISzZRSDFsQm51ZnllRlB6bFdnbnQ1T1ZScEg4VkVh?=
 =?utf-8?B?YTZKamZrbmRGQStSOWdOQVUyaEQ2eWVSUmdvdU5QMFpPMGV6M0x1NldaaDht?=
 =?utf-8?B?eFZEdmNDUlJuS3IzWGtwRTB1ZGd5SHp1Q2I5UmdtTVE4SnZkWSs3RHAzd1RY?=
 =?utf-8?B?b2ZHNmpHTnF4ZmlNTXFoaDJlRzFRb2t4dEVwd3ZJYWNVS0xFc21ucVZ0VXlx?=
 =?utf-8?B?bXo2YTB4UkUwai84RFJBL29zM3FrUk9Ta21vaWRIdy9laVgvTXFxT0VjdUdB?=
 =?utf-8?B?a0ltdE5qWlNiVkdLL2JWeFlDOE1XQVNnOWtGejdCUVpJc1grRmMxMUV5bFZR?=
 =?utf-8?B?Rk5FVzV5b3diUEJhdERVWEZHcVBna2NqaVYrK0hVKy80RjN5NDlnTlhFdFVC?=
 =?utf-8?B?VW1Ia2Q5WlE4V25DdHdWOXFOZE5HTEZiWmlaRXhqSjVnVDZyVHIrelRxbml5?=
 =?utf-8?B?Z0ttaWRoT0ZYMm1hdlRleEEwOGtRV29TSjdZNnozbyswU3NJTStYaWNDRGhX?=
 =?utf-8?B?YkxUUEdXWG1rMzdWdE1aVDlSZVR3dmhOeVU2dmw1aFpnR1ozTVlCQlpTamUr?=
 =?utf-8?B?bnFtMWJwRVRvZC9LRHBqcG5EMlhxZWd3RXNwYVl3RFJQeDNBVkJGd2pTZ3Er?=
 =?utf-8?B?RjltSFJHSit3a1JrWkppZFpFbnJhOGYrbG9BUTNISHVDT0dGdFR5MCtERWdG?=
 =?utf-8?B?dzhWd0xWWC9PS2pZVkdBU3cvb29idEFRdGdNOG5VT29kNHU2MU1TSEhLamk4?=
 =?utf-8?B?QVQvWWZGNXYyZWRPcEtwU3BJUmRUOEVxWUVKQzVFT0dWV3lUSlA0c3BqZklB?=
 =?utf-8?B?NXl5U0NJSnlnYzU4a3N3YytPdFhpdlIrUThXQlNiK3lTWFZacmN0RFh0amVC?=
 =?utf-8?B?YlczRzBTdW5ITkJienNSWTNPOGFPVmdVYklWNXloSWVzaWZXdGxRemJIalhU?=
 =?utf-8?B?ejZLM05PTVRSOHE1OGlORjkyU3liVllBcXZESzBWcjFuQVdzUFo0TndCdlhz?=
 =?utf-8?B?d3A3bzlISCtrY1dZUTBtclR2VllkYmVpVnY4WWlqRmJoazZjK3QwYnlvdzJQ?=
 =?utf-8?B?c2ZiL3lkemY3ZkhOWHlyYStlaFA2UlZKRDRuVm5CbUVKM3Y0Q1VqTlRMOWM0?=
 =?utf-8?B?T2V0bWc2Zlh6SGVwSlhGUnhEbldNNzBEdW1xMDFhZWxqNnYxQzBlZG5ZQlZo?=
 =?utf-8?B?WFEvbmwxODVNQmFTbTQxODNISXkrbWlBTEVRUWhkSys0WUt0UUc1QTJ2cFhS?=
 =?utf-8?B?V0d1bnA3UkFWZkZ4VDVHcngwbkxIYWRkVW8xbzRsR3NwcGJhTWN0NFR6NDVl?=
 =?utf-8?B?NnQ1ZUFOcE56UDhjMU9ad1ZyUFYzT1YrZ0pLVVM5RE45RnRvOGxFblJnUFlL?=
 =?utf-8?B?cllzcmRsV1JqTmt1MFRDRk1QcFFTZWg0ZG9YZkJ3RTBRbHNESGlibVZvZE4z?=
 =?utf-8?B?ci9JRDlaNldrSDY4SmxBdHZxT2tMRWtHWWxwZW5SWi8vN2xtQUR0WE9Tc3Bk?=
 =?utf-8?B?ZXFrKzk3N0s3L0Nad2JUcWlMZVNPUlpCc1ZUZTVzb256SFpwVk4xRTFVMzB4?=
 =?utf-8?B?dHNMdkJnUUZpQjdlc0ozcCsrTExCdXk5emwwUnlPWE56eVlPdGY3b1FqbWQ3?=
 =?utf-8?B?WEptQy9xQ1JnZzdPektwdEpSUEVDdDUvL3dxK0NJd3ArRUkrcmYyaEgyVXJO?=
 =?utf-8?B?eWNOWEZEdnRRdkxPU2taMFRRc1ZwUGVWckEvUnZtbDdkdE81blFXK3dFS2Yz?=
 =?utf-8?B?WXkyRVNIQ1hSU3NYQ1Z4TzJOc3ZDVHZydVhXUHViUkdjNlArM0EvdzN0SzlD?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03187D31476D1A488AEC0FE71C1521DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0187e5-5253-4e95-9ba1-08dc48a55084
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 06:16:43.6917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ru6paeX31QtTtg4M1MEsuACvaC6Ed0UuDZWzPLOnZab5aXCqzg0p4WIxo2PM24/XkhnxHe6DacXa+/QRMeuRbNFcT8M1p6sZLzlmJ9J2+xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3527
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Mike Rapoport <rppt@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAzLzIwMjQgw6AgMDA6MjYsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBUdWUsIE1hciAxOSwgMjAyNCBhdCAxMTowNzowOFBNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAxOC8wMy8yMDI0IMOgIDE3OjE1LCBKYXNvbiBHdW50
aG9ycGUgYSDDqWNyaXTCoDoNCj4+PiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCAwMToxMTo1OVBN
ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBMZSAxNC8w
My8yMDI0IMOgIDEzOjUzLCBQZXRlciBYdSBhIMOpY3JpdMKgOg0KPj4+Pj4gT24gVGh1LCBNYXIg
MTQsIDIwMjQgYXQgMDg6NDU6MzRBTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+
Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gTGUgMTMvMDMvMjAyNCDDoCAyMjo0NywgcGV0ZXJ4QHJlZGhh
dC5jb20gYSDDqWNyaXTCoDoNCj4+Pj4+Pj4gRnJvbTogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQu
Y29tPg0KPj4+Pj4+Pg0KPj4+Pj4+PiBQb3dlclBDIGJvb2szcyA0SyBtb3N0bHkgaGFzIHRoZSBz
YW1lIGRlZmluaXRpb24gb24gYm90aCwgZXhjZXB0IHBYZF9odWdlKCkNCj4+Pj4+Pj4gY29uc3Rh
bnRseSByZXR1cm5zIDAgZm9yIGhhc2ggTU1Vcy4gIEFzIE1pY2hhZWwgRWxsZXJtYW4gcG9pbnRl
ZCBvdXQgWzFdLA0KPj4+Pj4+PiBpdCBpcyBzYWZlIHRvIGNoZWNrIF9QQUdFX1BURSBvbiBoYXNo
IE1NVXMsIGFzIHRoZSBiaXQgd2lsbCBuZXZlciBiZSBzZXQgc28NCj4+Pj4+Pj4gaXQgd2lsbCBr
ZWVwIHJldHVybmluZyBmYWxzZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQXMgYSByZWZlcmVuY2UsIF9f
cFttdV1kX21raHVnZSgpIHdpbGwgdHJpZ2dlciBhIEJVR19PTiB0cnlpbmcgdG8gY3JlYXRlDQo+
Pj4+Pj4+IHN1Y2ggaHVnZSBtYXBwaW5ncyBmb3IgNEsgaGFzaCBNTVVzLiAgTWVhbndoaWxlLCB0
aGUgbWFqb3IgcG93ZXJwYyBodWdldGxiDQo+Pj4+Pj4+IHBndGFibGUgd2Fsa2VyIF9fZmluZF9s
aW51eF9wdGUoKSBhbHJlYWR5IHVzZWQgcFhkX2xlYWYoKSB0byBjaGVjayBodWdldGxiDQo+Pj4+
Pj4+IG1hcHBpbmdzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGUgZ29hbCBzaG91bGQgYmUgdGhhdCB3
ZSB3aWxsIGhhdmUgb25lIEFQSSBwWGRfbGVhZigpIHRvIGRldGVjdCBhbGwga2luZHMNCj4+Pj4+
Pj4gb2YgaHVnZSBtYXBwaW5ncy4gIEFGQUlDVCB3ZSBuZWVkIHRvIHVzZSB0aGUgcFhkX2xlYWYo
KSBpbXBsIChyYXRoZXIgdGhhbg0KPj4+Pj4+PiBwWGRfaHVnZSgpIG9uZXMpIHRvIG1ha2Ugc3Vy
ZSBpZS4gVEhQcyBvbiBoYXNoIE1NVSB3aWxsIGFsc28gcmV0dXJuIHRydWUuDQo+Pj4+Pj4NCj4+
Pj4+PiBBbGwga2luZHMgb2YgaHVnZSBtYXBwaW5ncyA/DQo+Pj4+Pj4NCj4+Pj4+PiBwWGRfbGVh
ZigpIHdpbGwgZGV0ZWN0IG9ubHkgbGVhZiBtYXBwaW5ncyAobGlrZSBwWGRfaHVnZSgpICkuIFRo
ZXJlIGFyZQ0KPj4+Pj4+IGFsc28gaHVnZSBtYXBwaW5ncyB0aHJvdWdoIGh1Z2VwZC4gT24gcG93
ZXJwYyA4eHggd2UgaGF2ZSA4TSBodWdlIHBhZ2VzDQo+Pj4+Pj4gYW5kIDUxMmsgaHVnZSBwYWdl
cy4gQSBQR0QgZW50cnkgY292ZXJzIDRNIHNvIHBnZF9sZWFmKCkgd29uJ3QgcmVwb3J0DQo+Pj4+
Pj4gdGhvc2UgaHVnZSBwYWdlcy4NCj4+Pj4+DQo+Pj4+PiBBaCB5ZXMsIEkgc2hvdWxkIGFsd2F5
cyBtZW50aW9uIHRoaXMgaXMgaW4gdGhlIGNvbnRleHQgb2YgbGVhZiBodWdlIHBhZ2VzDQo+Pj4+
PiBvbmx5LiAgQXJlIHRoZSBleGFtcGxlcyB5b3UgcHJvdmlkZWQgYWxsIGZhbGwgaW50byBodWdl
cGQgY2F0ZWdvcnk/ICBJZiBzbw0KPj4+Pj4gSSBjYW4gcmV3b3JkIHRoZSBjb21taXQgbWVzc2Fn
ZSwgYXM6DQo+Pj4+DQo+Pj4+IE9uIHBvd2VycGMgOHh4LCBvbmx5IHRoZSA4TSBodWdlIHBhZ2Vz
IGZhbGwgaW50byB0aGUgaHVnZXBkIGNhc2UuDQo+Pj4+DQo+Pj4+IFRoZSA1MTJrIGh1Z2VwYWdl
cyBhcmUgYXQgUFRFIGxldmVsLCB0aGV5IGFyZSBoYW5kbGVkIG1vcmUgb3IgbGVzcyBsaWtlDQo+
Pj4+IENPTlRfUFRFIG9uIEFSTS4gc2VlIGZ1bmN0aW9uIHNldF9odWdlX3B0ZV9hdCgpIGZvciBt
b3JlIGNvbnRleHQuDQo+Pj4+DQo+Pj4+IFlvdSBjYW4gYWxzbyBsb29rIGF0IHB0ZV9sZWFmX3Np
emUoKSBhbmQgcGdkX2xlYWZfc2l6ZSgpLg0KPj4+DQo+Pj4gSU1ITyBsZWFmIHNob3VsZCByZXR1
cm4gZmFsc2UgaWYgdGhlIHRoaW5nIGlzIHBvaW50aW5nIHRvIGEgbmV4dCBsZXZlbA0KPj4+IHBh
Z2UgdGFibGUsIGV2ZW4gaWYgdGhhdCBuZXh0IGxldmVsIGlzIGZ1bGx5IHBvcHVsYXRlZCB3aXRo
IGNvbnRpZ3VvdXMNCj4+PiBwYWdlcy4NCj4+Pg0KPj4+IFRoaXMgc2VlbXMgbW9yZSBhbGlnbmVk
IHdpdGggdGhlIGNvbnRpZyBwYWdlIGRpcmVjdGlvbiB0aGF0IGh1Z2VwZA0KPj4+IHNob3VsZCBi
ZSBtb3ZlZCBvdmVyIHRvLi4NCj4+DQo+PiBTaG91bGQgaHVnZXBkIGJlIG1vdmVkIHRvIHRoZSBj
b250aWcgcGFnZSBkaXJlY3Rpb24sIHJlYWxseSA/DQo+IA0KPiBTdXJlPyBJcyB0aGVyZSBhbnkg
ZG93bnNpZGUgZm9yIHRoZSByZWFkaW5nIHNpZGUgdG8gZG8gc28/DQoNClByb2JhYmx5IG5vdC4N
Cg0KPiANCj4+IFdvdWxkIGl0IGJlIGFjY2VwdGFibGUgdGhhdCBhIDhNIGh1Z2VwYWdlIHJlcXVp
cmVzIDIwNDggY29udGlnIGVudHJpZXMNCj4+IGluIDIgcGFnZSB0YWJsZXMsIHdoZW4gdGhlIGh1
Z2VwZCBhbGxvd3MgYSBzaW5nbGUgZW50cnkgPw0KPiANCj4gPyBJIHRob3VnaHQgd2UgYWdyZWVk
IHRoZSBvbmx5IGRpZmZlcmVuY2Ugd291bGQgYmUgdGhhdCBzb21ldGhpbmcgbmV3DQo+IGlzIG5l
ZWRlZCB0byBtZXJnZSB0aGUgdHdvIGlkZW50aWNhbCBzaWJsaW5nIHBhZ2UgdGFibGVzIGludG8g
b25lLCBpZQ0KPiB5b3UgcGF5IDJ4IHRoZSBwYWdlIHRhYmxlIG1lbW9yeSBpZiB0aGF0IGlzbid0
IGZpeGVkLiBUaGF0IGlzIHdyaXRlDQo+IHNpZGUgb25seSBjaGFuZ2UgYW5kIEkgaW1hZ2luZSBp
dCBjb3VsZCBiZSBkb25lIHdpdGggYSBzaW5nbGUgUFBDDQo+IHNwZWNpYWwgQVBJLg0KPiANCj4g
SG9uZXN0bHkgbm90IHRvdGFsbHkgc3VyZSB0aGF0IGlzIGEgYmlnIGRlYWwsIGl0IGlzIGFscmVh
ZHkgcmVhbGx5DQo+IG1lbW9yeSBpbmVmZmljaWVudCBjb21wYXJlZCB0byBldmVyeSBvdGhlciBh
cmNoJ3MgaHVnZSBwYWdlIGJ5IG5lZWRpbmcNCj4gdGhlIGNoaWxkIHBhZ2UgdGFibGUgaW4gdGhl
IGZpcnN0IHBsYWNlLg0KPiANCj4+IFdvdWxkIGl0IGJlIGFjY2VwdGFibGUgcGVyZm9ybWFuY2V3
aXNlID8NCj4gDQo+IElzbid0IHRoaXMgcGFydGljdWxhciBQUEMgc3ViIHBsYXRmb3JtIGFuY2ll
bnQ/IEFyZSB0aGVyZSBjdXJyZW50IHJlYWwNCj4gdXNlcnMgdGhhdCBhcmUgZ29pbmcgdG8gaGF2
ZSBodWdldGxiZnMgc3BlY2lhbCBjb2RlIGFuZCBjYXJlIGFib3V0DQo+IHRoaXMgcGVyZm9ybWFu
Y2UgZGV0YWlsIG9uIGEgNi4yMCBlcmEga2VybmVsPw0KDQpBbmNpZW50IHllcyBidXQgc3RpbGwg
d2lkZWx5IGluIHVzZSBhbmQgd2l0aCB0aGUgZW1lcmdlbmNlIG9mIHZvaWNlIG92ZXIgDQpJUCBp
biBBaXIgVHJhZmljIENvbnRyb2wsIHBlcmZvcm1hbmNlIGJlY29tZXMgbW9yZSBhbmQgbW9yZSBj
aGFsbGVuZ2UgDQp3aXRoIHRob3NlIG9sZCBib2FyZHMgdGhhdCBoYXZlIGFub3RoZXIgMTAgeWVh
cnMgaW4gZnJvbnQgb2YgdGhlbS4NCg0KPiANCj4gSW4gdG9kYXkncyB3b3JsZCB3b3VsZG4ndCBp
dCBiZSBwZXJmb3JtYW5jZSBiZXR0ZXIgaWYgdGhlc2UgcGxhdGZvcm1zDQo+IGNvdWxkIHN1cHBv
cnQgVEhQIGJ5IGFsaWduaW5nIHRvIHRoZSBjb250aWcgQVBJIGluc3RlYWQgb2YgYmVpbmcNCj4g
c3BlY2lhbD8NCg0KSW5kZWVkLCBpZiB3ZSBjYW4gcHJvbW90ZSBUSFAgdGhhdCdkIGJlIGV2ZW4g
YmV0dGVyLg0KDQo+IA0KPiBBbSBJIHdyb25nIHRvIHF1ZXN0aW9uIHdoeSB3ZSBhcmUgcG9sbHV0
aW5nIHRoZSBjb3JlIGNvZGUgZm9yIHRoaXMNCj4gc3BlY2lhbCBvcHRpbWl6YXRpb24/DQoNCkF0
IHRoZSBmaXJzdCBwbGFjZSB0aGF0IHdhcyB0byBnZXQgYSBjbG9zZSBmaXQgYmV0d2VlbiBoYXJk
d2FyZSANCnBhZ2V0YWJsZSB0b3BvbG9neSBhbmQgbGludXggcGFnZXRhYmxlIHRvcG9sb2d5LiBC
dXQgb2J2aW91c2x5IHdlIA0KYWxyZWFkeSBzdGVwcGVkIGJhY2sgZm9yIDUxMmsgcGFnZXMsIHNv
IGxldCdzIGdvIG9uZSBtb3JlIHN0ZXAgYXNpZGUgYW5kIA0KZG8gc2ltaWxhciB3aXRoIDhNIHBh
Z2VzLg0KDQpJJ2xsIGdpdmUgaXQgYSB0cnkgYW5kIHNlZSBob3cgaXQgZ29lcy4NCg0KQ2hyaXN0
b3BoZQ0K
