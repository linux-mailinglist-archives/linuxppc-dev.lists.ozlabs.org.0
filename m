Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242FA495C4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCgh6yw3z3ddN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYr3BTmz3cKK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKl6PA2PhoDixYIc9gtYMeK4HE9hCJ6r/MaSuJ0EtwMu1s3ooGFLWwLrGzckv7YSbg/pSnuTJhVyUn6SHM5S1fwxcln2WbiqczKGCh/w+bupCn390mDVUjzIZ2JrOgHBsTNHJnkaaL3595ITeZyBiJLjQe47vNc4AdqQdMNSIVHmLpcAo0v9+fQGxIFNFrxLePZ3zSMGOqe6XJWsENmw5hht5SoK3lE5+dOIyuyB1lGaXsxT6iYrOPVLwrlQxkb7nK+6bsA40cpkOsIrdS3cDhuzCjZj/xzKr3bIMQ4qQAXc4TPVJ6Yu9IkcEG31ePt/eHgqXywOBE+3B2ubVQKFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMqQpMVPJWiGmTGtq2QUJHhfhL+o8r8GMswJlhxDXUU=;
 b=fIrmtPgi58wUrz7qmagxiHmi1X3fRaRYEps8WALIbqpMEzeEfWn8YzQbTPMsPCHt8+tfsAojFxbRExS7kvcJ7EyjRl7+9l5NuNtmpv8UnGZxnUmgyPvcjT2Gah2kt4opnWyxhDaSZGvuZ5yvOQZJ1qQr5GfcvopTnn+vxlFjm+X6mn9fdRTeObuCafJCrNGg2omkw60YFXkOnJFC2jBmU4q2PADL8Hz6y9TPqSUYHfDhjugsiox7elCH/eMiK1I8pVg0C/L94iWEKiv287V17YxRLSCpqCwvfonBnu+jA7E6LXWyBM8JGYeyBmGy5XzPeqwdRw6fEuLbV2OViCzROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:42:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 05/14] sizes.h: Add SZ_1T macro
Thread-Topic: [PATCH v7 05/14] sizes.h: Add SZ_1T macro
Thread-Index: AQHYDqLOuo8uvB/7ok2rn9L7yMBx/g==
Date: Fri, 21 Jan 2022 08:42:21 +0000
Message-ID: <575cb7164cf124c75df7cb9242ea7374733942bf.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bab4360e-7273-4eb4-e849-08d9dcb9f0ca
x-ms-traffictypediagnostic: MR2P264MB0196:EE_
x-microsoft-antispam-prvs: <MR2P264MB01969F587FBA782C5F1AEFE9ED5B9@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wFNSPQLoXv713+UZ1YmwmWzGYYlpm4/DEcpjIziTKNxOvnh0YUm8IT2gGnFhGJOPoIATBW8gh9/q9rlTG0byU/IH3oeytuLLQ1UbJUNA/yzAR77F89p/JVo0mKk4CRwGgXGpe9Cw2VvG+AVI1Tx8iAMR3Avi6NRDSXeBTvJiDDDHXBufi/5KGaCsbUiJo1ZzLoTmiOsENa/VD6yvwpoi7Fq0f+xKfOueDypYMKd/qCwdQFhoeeOS7ouT2oS/X3Y5+2OghBQhe7tOmST62GrKoqQjHvDNELjEduZE73ol+K/2lV6rTC8SO1Q95ktOp3InmyWIMWFgcIRK5oGZJqRlzXSrAsVp8mdbY7a7D82WeS8KhLKDihKdwOoY1mUn7Pol+N9xn5xZCvcXLi6gzGC9nC6EDTARYwvEMkwR+W3scn7UkHZQ7tyVQ89IxjD/CA4azLgWoflgR7TEwFcimb1t2mKFNILKxCfP/h8nx/BbSmOZFHDMa2cBs9mfbdO1A+BI8NSze2OqrS7YDHUupwaya//+gkRzYouehyMpeanyhkRDHC2uMfQVDdpLDF6I85PI/AiO5OJn1phrj4T7m5m890MfDdrVO2CCNVVuW73v2zoX766WIloAGmHKzdkVQpGHicun741hAWHx7TuKwjo8Maz8wFkwmD9QX0JvxxiWaRcw2BYANqhmNt9+N8k3/Su3fpO7ZgBCD81gZl5YMnDQ2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(186003)(44832011)(26005)(7416002)(6512007)(6506007)(2906002)(8676002)(71200400001)(8936002)(508600001)(86362001)(4326008)(5660300002)(316002)(66446008)(64756008)(66556008)(91956017)(110136005)(54906003)(38070700005)(76116006)(66476007)(122000001)(38100700002)(66574015)(66946007)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3JoQVR0am9hS3NGVUFvV3ZaTm02aHdJdnlvOVpnTndvVElsOHFyUWJ6Zy9V?=
 =?utf-8?B?QjBNcFhlaWVia2ZzeG9Cb0xtNDU0d0JSelZMVkR4UzdGaU51UzlrMW51UmYx?=
 =?utf-8?B?QTVqQ05DbENCY2s3cW82TGFkeGtrQjU1SmtnU1hMWDlaQnRxb2hDRnZ3MzFQ?=
 =?utf-8?B?RWt2bm1OMmxkUS9SSjB4V1pOQzQ1UjYrNlVGL3VHandkc3VHZGFYWWpEWkJ3?=
 =?utf-8?B?NWw3TThGNUtTc0FwblllRDRPUVdMTmtwR3EwU00xOWRVQVRpcjhhY1MvM09r?=
 =?utf-8?B?TThLQ01UVVgwd1BlM1lrb2xzZWJKZHA3cFJ0eGM0bXlyY1prKytkT3ZGSzBO?=
 =?utf-8?B?Z2F2TWZLWE5yNlZXSndyRHlucEdSTlNpK2FianRJVUozcmphK0I4aDJqTUEv?=
 =?utf-8?B?eXRKOFg2TUJWTXBUbktRVWlYN1VLaWpSc1pYS1BuUS9KL09UcjE2bHM1elo5?=
 =?utf-8?B?Wmx1RXVPdVBKVzdjS0JEMmlDWklvM05JcktLZ2hDZUVrQTRxdTZqSnYvYlR5?=
 =?utf-8?B?WDVMZDl5RFVNVnhnN0ZHWG40Mm1rV0VqSzNJTUg4eTF5RlhDOWFaN3cxSXRm?=
 =?utf-8?B?dDJXbGNLT0ZQYnlUOXMxcG5YcnRYbmp5U2poU1dkWS9mZm1jZlE4T0F1cHdU?=
 =?utf-8?B?ZXllaHZVQ1Q4YzluTVFFTjFBemxwNFBmYVQrUDVSQW16dkNybFUvRStxNHhR?=
 =?utf-8?B?bTRYUUpIeXVVaHFOYjFld3RPWEUyeUlRMDl3eVFCQkF6OCtyOW9pdjYvd2Vq?=
 =?utf-8?B?Z3ROZUo4SzdEdjE3R3dZV0hFTEozYkR2UnlINHBqSE9KU3FwdjJXb3gzLzZE?=
 =?utf-8?B?bDRjZ3U2dmgwd3ZYWTR1T3VNV3V1N1dhV1dlOS8xMEg2eVdFT0xkdE9CYmhN?=
 =?utf-8?B?NDhQQklsZzY5Y2JTeHRqMWNYQkdiR0NzTGxraEN1V3lLa3lmSFloVGhzdTJW?=
 =?utf-8?B?dkh3QVpZUzlxUVJvZTF4Vm1kNy9OZ3hZNlcvdHlTalpEeWIranFUKzdqc2J1?=
 =?utf-8?B?T3d6cUVLUHR2YlluSktsMVhvS1RiUDJZaXRJV3dOb210N01SZVlNVVpsNnNh?=
 =?utf-8?B?dGw2blAyLzFpSDhHVU9GOGR6WkdjR01QWDNzbVJmS1pIY1U2YTh0TUNTMFhU?=
 =?utf-8?B?SHlLWW1zdEV5RktpOWtIUERTYTRUSGc5WWttNjR4NW1xUU11Y3BqQlpZQk83?=
 =?utf-8?B?aVY0Z1FpRnFFRXVFeFRpbHlUc0hsUXZ4UTZld01kVVZnWmpqbGdLRFhjMXBJ?=
 =?utf-8?B?bEEwTHdxU2lQbTE3UmY2NUgwYWpqNHZQYUlOL0gyZGxyYXR4QzB5M3d0bUQ3?=
 =?utf-8?B?S21NdUpuT0FTRUZ2MTk5RGVvd1hYY2JnU2V2UzY2SW9KNi9FQVpBV1lTS3hJ?=
 =?utf-8?B?ejhoT2NYcEpGbDhWVVB5WWlLUHk0TVhRZzhWbVJCSEIzcmJqSUpHaFNiSnlM?=
 =?utf-8?B?WVJQb09QTzJIaHJmei9aYkhDZTB3Y2dpRytpcDJvWlorTzBMd1JSdUpxVWda?=
 =?utf-8?B?Y3FxeGlaQlNkbWM0N01KdFZvWUtLL1FnM3kvVFhTVThaUDRkS2lmd0kzVHZH?=
 =?utf-8?B?OUdVdmptRUl3MEQ2Z29HVkFIQ2tWRHFuL04zbFNZWkN4enRPRDdUbnhRMWZR?=
 =?utf-8?B?NWlOQ09xRXRzU3UyRzE5MERjTElKY0N0YUdOb1hSOGg4dlJsLzJUT05VZmZv?=
 =?utf-8?B?Mm0vdnJGM0VHbklZWGJ0RDJFV0R6aHltOGZTdjBabGQrQlk0M0pyb2kwT3Y3?=
 =?utf-8?B?WFNkNXc1L2UxNWtsSmpVTmlMdCtDMG1CUjZEYy9mZkdsQU9hdFZGc0ZLeEJq?=
 =?utf-8?B?bmg2cmhFT2RpVlZCRGhpRzBCd1lYN1NYak1Vaytyd2hUT3E5MXh1ZXZxelBl?=
 =?utf-8?B?VjFrRHVMRG1Td0xMK2wxb2xyZWdybVc0QTlWSXZvdVNMQmVIZ0ovWHpYZ2pY?=
 =?utf-8?B?VEFlMGNzVzV5OURNeFRvT0w4RUZlSmJDQ3ZxbGRVWGZGUjcyVUp3M0hkcmUv?=
 =?utf-8?B?VGU2Yk9Edkhweno3R3JtQlozUS9SVUFoUkhQb3hZR3pEMXBkdGd5SHdzMEJm?=
 =?utf-8?B?bVNPWGFmUDIvV08zRjJHOHlydmladmh4aHZEeE5hbDVRelp2RFBOT1lyeFFY?=
 =?utf-8?B?L2NRelFzeThmdWNjWmc3VXAzcVFUcy8vR0NHNmJ6K2lVU3JiQ2FLc1ZkQ0Vy?=
 =?utf-8?B?TFNaWGh6SjJtYUZWYWZoVTBsbldkOXFFUDBBMXhFVy9tSDczcFo3T2d0bkFD?=
 =?utf-8?Q?GOcuXN8JUIYp8frB9s3DeT61Nwi4km66Eb0MzMzi4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <459E0A3096FDB242BFF2B48A7CA01F7C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bab4360e-7273-4eb4-e849-08d9dcb9f0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:21.5744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bk9aEtwuY3YECjeiZX5T+h25cQWjmzLcMtxZW1qmOk+jEVS/4EGUxj6riCdHjoYylL31CkpnBE1lTXTgNHptEIQEr93vtVOXaKkqscmjptk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0196
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
Cc: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>,
 "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Toan Le <toan@os.amperecomputing.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VG9kYXkgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUuYyBkZWZpbmVzIFNaXzFUDQoN
Ck1vdmUgaXQgaW50byBsaW51eC9zaXplcy5oIHNvIHRoYXQgaXQgY2FuIGJlIHJlLXVzZWQgZWxz
ZXdoZXJlLg0KDQpDYzogVG9hbiBMZSA8dG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KQ2M6
IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NClJldmlld2VkLWJ5OiBLcnp5c3p0b2Yg
V2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4NCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPg0KLS0tDQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUu
YyB8IDEgLQ0KIGluY2x1ZGUvbGludXgvc2l6ZXMuaCAgICAgICAgICAgICAgfCAyICsrDQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS14Z2VuZS5jDQppbmRleCA1NmQwZDUwMzM4YzguLjcxNmRjYWI1Y2E0NyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMNCisrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMNCkBAIC00OSw3ICs0OSw2IEBADQogI2RlZmlu
ZSBFTl9SRUcJCQkJMHgwMDAwMDAwMQ0KICNkZWZpbmUgT0JfTE9fSU8JCQkweDAwMDAwMDAyDQog
I2RlZmluZSBYR0VORV9QQ0lFX0RFVklDRUlECQkweEUwMDQNCi0jZGVmaW5lIFNaXzFUCQkJCShT
Wl8xRyoxMDI0VUxMKQ0KICNkZWZpbmUgUElQRV9QSFlfUkFURV9SRChzcmMpCQkoKDB4YzAwMCAm
ICh1MzIpKHNyYykpID4+IDB4ZSkNCiANCiAjZGVmaW5lIFhHRU5FX1YxX1BDSV9FWFBfQ0FQCQkw
eDQwDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zaXplcy5oIGIvaW5jbHVkZS9saW51eC9z
aXplcy5oDQppbmRleCAxYWM3OWJjZWUyYmIuLjg0YWE0NDhkOGJiMyAxMDA2NDQNCi0tLSBhL2lu
Y2x1ZGUvbGludXgvc2l6ZXMuaA0KKysrIGIvaW5jbHVkZS9saW51eC9zaXplcy5oDQpAQCAtNDcs
NiArNDcsOCBAQA0KICNkZWZpbmUgU1pfOEcJCQkJX0FDKDB4MjAwMDAwMDAwLCBVTEwpDQogI2Rl
ZmluZSBTWl8xNkcJCQkJX0FDKDB4NDAwMDAwMDAwLCBVTEwpDQogI2RlZmluZSBTWl8zMkcJCQkJ
X0FDKDB4ODAwMDAwMDAwLCBVTEwpDQorDQorI2RlZmluZSBTWl8xVAkJCQlfQUMoMHgxMDAwMDAw
MDAwMCwgVUxMKQ0KICNkZWZpbmUgU1pfNjRUCQkJCV9BQygweDQwMDAwMDAwMDAwMCwgVUxMKQ0K
IA0KICNlbmRpZiAvKiBfX0xJTlVYX1NJWkVTX0hfXyAqLw0KLS0gDQoyLjMzLjENCg==
