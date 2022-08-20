Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42759AE9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 16:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M90sl1KsZz3c71
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 00:11:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=msBsOKap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.44; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=msBsOKap;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120044.outbound.protection.outlook.com [40.107.12.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M90rx1hS0z3c21
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 00:10:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHqZ1w2K7YSwf8dPx0weaz7kDC8J77CNsEX5JoMFM7nLca0j8PXIg6tuu3X9fmN2oleohK5qRFwSCJJLK0lz8cTu/p2eRUIDCwVFxGZLOqwhY8PkcKYW3pnO6a9rILaYLYFsf8RwlDLC3MI9nObT3Z2ngA/NA/VEzKi15MCB/QVBF2chyWPYoCELYnWazScTaNLCQAKxrLri/xAovaSQpUvT1j8AdRELH8gd9ezS6mVxv4oKpHZivqz4VGuSEmFCqhjQ5+yyI9bNuBmpR30h7Q9Efpkms2pc9Lu3B+IWGG2D3rBkGkQysXPsZ5g9LjbBff/De22BI9TY1UiZIM9Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5ea49WFG8pyITKzQOxZ4fczXCe+ecHpGQ8mVCTlLy8=;
 b=Igvhu8ijIi3gXDFle8MOHZcZd6AnbFPf1vAJkrSEBIM4OWat1sHer7p1XL1AKVx3M63NhZmuATCdZn+OYSzJQRd3jYTdlni1442hAuqIblo8kp38P/vTHITor6TeytArerZeoLJ5W0U7pYEqQPsdiut0xv6sM0iMpVGUj0w/p3wC1C70yOJQMSR2UF5I8PTSYOzRBxUxOMNJbKIttFzY7hgmtwHTG4OmFgf/e5yFojUuwt/7ANZ8gu+afncUPKAPQZin25ShrMw6MmZGZGa2g3RP+aOXyg6bBqSi44pjTVu5LI7JV0tpWiHYkVz4uIYC8Iq3jENht9ts6yeGO6IbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ea49WFG8pyITKzQOxZ4fczXCe+ecHpGQ8mVCTlLy8=;
 b=msBsOKape5igSN93A9kV/mZWbxt/qrJ72lRCBV5AEy+1iNNorloX7341kVETOaGFghCjIWK1VCtO6NS+O2z6fkk1zTtCguMXy5a8UFNJ1kRpgh3NVieFBrISOl9KmolT5sYSjHPSCiQXhgK/rmvE5P78L3syfJz4XxXrNnA7M+K8jZwMKw9glsn6ru6MUMCcdwZUzDvbMTNbSwK3fumarhvuugoMDqEgMvgOnInPjVFKTonUueoHcWhbGLWUTJpb5Yz6xUqSqqifnU4oPA4oeFNDjuqazNEFaRXyhOFwY4DSBPmed7K2SAaBIZwHbKcqNwjHXhQjcVSNyck+Zhi9aw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4141.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Sat, 20 Aug
 2022 14:10:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.021; Sat, 20 Aug 2022
 14:10:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>
Subject: Re: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Topic: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Index: AQHYtHvmHBMhgvHYdkutxUw4JYFhKa23sWCAgAAizoA=
Date: Sat, 20 Aug 2022 14:10:18 +0000
Message-ID: <b6a7a909-8322-235d-1863-f751cc808ecc@csgroup.eu>
References: <20220513113930.10488-1-masahiroy@kernel.org>
 <20220513113930.10488-3-masahiroy@kernel.org>
 <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
 <CA+icZUU1R6vmmKussGBXGBzR8We2b5mAnfWT5BCcfvYY3vk+Zw@mail.gmail.com>
In-Reply-To:  <CA+icZUU1R6vmmKussGBXGBzR8We2b5mAnfWT5BCcfvYY3vk+Zw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a1c4f8c-c050-49cd-745c-08da82b5b64f
x-ms-traffictypediagnostic: PAYP264MB4141:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CgeBf26FCg/72X0JeiU3wVK9vsEW30GpLUQj2K7LUvRtSA9keivMZ64XdSA1N92KSyk6qSSHgNw4lsVta9tMDaK0BRTMtG872sPNLWZXC2lxlStX5mZVB0oajf9CV4Tnadfxz84FsLPhr5o7Mm+tv5X/85ylzRmWD/EpO/lbG/ysgOUX4iiSFzPRmMrhofeEF1woodC6sYDiltTK5lYKm6jhTEiGLMDmKzbkH13bTKGXiUypzIPWPSQjx6cV0vIaSniT78LHNI281Z2aFM/ypZyyVi2uuBKB9pRo7qvnKJaW+fKFTIr9w1nM84CHCtRUKYKLKniPFVb2OiFYDEf4dAOjNw8Jkp9t7Jfab2jGA2AzWkWWVpYvHLkS77GhujImmBbVjDIEUjkTg6ZSqb9MnzOOsgc6KMyrni0+0rLGXlYtNvyQi5VunEudzH9I4Mia34jcDdFnRV5BGknsXGU/TPCPwviimuIKqsmg1bt9R49jw0F/PvupRIUSD2iUWWK12sHh7VYcT6dmfpDjmFNaxSgB+Z3fbP5txSrlSFx7R/vHGOZF89KSb+7rY31aAvDmuJYgoc3SbL0UaCLRmm/TqAkd44ULIXAo4z9RRZB+Qhrc1iBezxoe2iQtqkJ41k5KmLV4ePy3sNCT44PBDTkLI8myUZnwP6BE8ucE3VMfDBejK+qKpFGjG2+Ax9MoGuIBh2hQy7fkbvtj6fnmdX4GSZjyQTg58faL85PVb9LpRRIPBkKFvtfODCwn+V5NXzrYb3D1OFBqrXrYe+yWJ+M9KLM7p0SkeTk8lXTqsfSycX4/setUd5f/xoV3UXFqQvhV6XTEOI2Jqa/WazMIdsuWqzXDaBnhr4kieC/8VyT3lwM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(91956017)(31696002)(76116006)(83380400001)(66446008)(66556008)(66946007)(64756008)(66476007)(8676002)(4326008)(2906002)(38100700002)(38070700005)(8936002)(44832011)(7416002)(5660300002)(6486002)(966005)(6512007)(26005)(31686004)(122000001)(71200400001)(54906003)(6916009)(41300700001)(36756003)(53546011)(86362001)(478600001)(316002)(6506007)(66574015)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bGsxM21YWCtVVkcrY0tHUFNuOWlhcEhmVlloOEFVbFpSd0NJUDRzdWFkZk0v?=
 =?utf-8?B?cG1SRDlYVk1OZlpTZ0RvdElQL0VuUXlLOFNuTVdSRlROQlBZbE5vRmlVZmN3?=
 =?utf-8?B?cUhKZEFBTlVsSU5uMlpsUElHUHlNSHNyYXJBWW11dFhRNjNxTXVSSGkvVGUx?=
 =?utf-8?B?bWlnNDlRamhzbVRmcjNYWThWZmN3MGEzRkFpbG94N3hKVzhCbEUxUE9lK3ht?=
 =?utf-8?B?WkpvSlpYQm1PbTUzNmtuakhWZlNlZTNVMjFmTWVuamQyeHRPaFZ2Q0V1UVFn?=
 =?utf-8?B?NEI0VjV6bnp5NzVEVWdSQUczd2NVZTR1dXFOT2psR25YMC96ODlEcjJST2ts?=
 =?utf-8?B?UnRubDEvcEtyTUxuaG5TYUExUHd6UUt0ZklVbXk1VW9va203MldKVXhoM3FU?=
 =?utf-8?B?bXpmdEY5VmxNd05IMUFNYSsrMjNOUVYzUHQ4TGlyNWZVaVZVVDd0NTNFZW5R?=
 =?utf-8?B?L0xVR2tQM0swU0pRbFVNeEhPcmRZUjhOUnNXWmZ6UXR0L1IyR1dWSy9YeWFk?=
 =?utf-8?B?YXFuNjIvWU00dmtjUDQzNGZGMi9lc3FHdXkxMzFaZ3NOV3JjckM1eE5xc2g2?=
 =?utf-8?B?b21hY2RFTDJjUUlDNDh3a1QzOVQ5UXAzT3E0cWI4VnhxM2RPZFRac0d2am9h?=
 =?utf-8?B?WFVBY2IrSENkMEk4cmdNWi9yR3hCdXF4dTl1UlArZjBONWJJdHFudGZxTDFH?=
 =?utf-8?B?TE1wNjErcFpoeSs2VnNPSkU3ZWFKQnRMTVZOZGlKWWx1ZGJZQUg2bkxkVkdj?=
 =?utf-8?B?M0c1RklzUDc4aU5ubnNSZGVER2c4cWd6YzhiNERxZnNQUXR6aTdPS2hpcTZM?=
 =?utf-8?B?elZvckZnRnRhd0NodmM4bVZtNWNiSXNmMnd3VkhFMTloRDhVSENnczF5TG5N?=
 =?utf-8?B?TFF5czBjMjBEV3NGL0hwd28zMExpR3k3bU5uQXErZG1hNnVhck1xQ2dCUnhh?=
 =?utf-8?B?YnR2R3RJemxlRUxLNml1TUNyWUdjd2h4TEpkSVRCc1BHSzBKNkxPQU5QcUhF?=
 =?utf-8?B?akpNQlE2Zk5FdlVRNUxYZk9LMHpDV2ZFNGRPN2lXM3JTVkd0UlkvK1JxaVpp?=
 =?utf-8?B?UFFVd1RoVGV3d1F5NVozdnFyU0NhaUhzTHg2WG9ZdUMzRFZDckk3WHVtYlIy?=
 =?utf-8?B?b0FuVTc5WXdFS2F3dCttMkU2eGV6RlNiSjRsQkphT3RBWlRhb0pSYVZ6UTZT?=
 =?utf-8?B?L3E5OGIrRUNTYm12eDZ2a3BXNWEvQkpsd1JvK3ovZWRNQTFiNXZkMnJqMzNl?=
 =?utf-8?B?SlcvUDVza3pZYXNrMnU0VzlXM2E2MzFXNWxrNG4vRTkxUjRXN01vbExPSFBG?=
 =?utf-8?B?ZDErdE5zN2xkV25OL1p5SmxINEwvU0xNcUl0OXlEUFVaNXRRUkZQK1ZnZTNp?=
 =?utf-8?B?TDRNallaQzVkRUhWUTA0eUZOblhjdFJ2TUpsYjlUVys5cjg4bmlydlI0ckt6?=
 =?utf-8?B?aXhwaHNiZlNIY1J3WlJyMG4xV2JPVEVNd0lPU2JYTWpMUGcwSHEzaHA4c0N6?=
 =?utf-8?B?bG9mVzFCUTA5TWliZ2N3Skttd0FKTkJmVElicHRFSUNhSHBwbk5CVE1OOTBi?=
 =?utf-8?B?RUJPRi9XQUhFanBPRmZuc3pOazNMUlNVMmEyd3U4eldMb1FLdkdicGM4c0Nq?=
 =?utf-8?B?NjgrWno0UmFPa0wwdktTbVRnd2F1bGZ6SWpwUElvMTY4QmRSVlVXTytnLzJR?=
 =?utf-8?B?WjNKMmtmTUlwNEp4bkNSRUhFK2VQclN0cG5sRlRWRVBBRUZRNi9Ld3V1SUhw?=
 =?utf-8?B?V0E4Uzlua1Y5R01BMkIxNXR5RnN4WTlxTllwU09pcjlxZTUvQXdVWlROTDI1?=
 =?utf-8?B?N0drdUpseU1GanA4R0g2NDd6dVd0TGNkcTRYQlRNZTI1cmljNzM1UlJ2dzkv?=
 =?utf-8?B?Y00zSFhYNzcyQWdETFNmL1E5N0MxL2EyeFFCMzhVSkJadEcvdTFnS29USGdu?=
 =?utf-8?B?aXlmSGFRZ0FSK1NYRUtObzRsenYwcjNseC96RHJUeDd6aTcvVzFQWXhnRXNJ?=
 =?utf-8?B?WEJueGxzU3hMbWtFNDBub05pZ1JxZnoydE1RV1JXSlR4aXpobWNQZUVab1Zm?=
 =?utf-8?B?WFJnaUtaSEpsUU9kZksyOXoxc3d4dlFtc2QvNjFKYU9rbGR4OUxHZm5yT2Rr?=
 =?utf-8?B?a21meDA2eVVSVHNoS3czVWUvZjVoNVA4R29FTjFIVVNZdUY0Y25uR0o4WFNM?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99602D416A9B2241BC2B7C1836317288@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1c4f8c-c050-49cd-745c-08da82b5b64f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 14:10:18.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 325i1wu5RL+VOQ34ivnHcJ9xgS3b1GauGXFd1rUhXHzz9YkKaJoy2nOKzPC0Ch+gwNsJJPrFnPlpv8iLxncXAGEKG7YlBxkxzqnKKGKCdSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4141
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Sami Tolvanen <samitolvanen@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMTQ6MDUsIFNlZGF0IERpbGVrIGEgw6ljcml0wqA6DQo+IE9u
IFNhdCwgQXVnIDIwLCAyMDIyIGF0IDEyOjA0IFBNIENocmlzdG9waGUgTGVyb3kNCj4gPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gTGUgMTMv
MDUvMjAyMiDDoCAxMzozOSwgTWFzYWhpcm8gWWFtYWRhIGEgw6ljcml0IDoNCj4+PiBpbmNsdWRl
L3tsaW51eCxhc20tZ2VuZXJpY30vZXhwb3J0LmggZGVmaW5lcyBhIHdlYWsgc3ltYm9sLCBfX2Ny
Y18qDQo+Pj4gYXMgYSBwbGFjZWhvbGRlci4NCj4+Pg0KPj4+IEdlbmtzeW1zIHdyaXRlcyB0aGUg
dmVyc2lvbiBDUkNzIGludG8gdGhlIGxpbmtlciBzY3JpcHQsIHdoaWNoIHdpbGwgYmUNCj4+PiB1
c2VkIGZvciBmaWxsaW5nIHRoZSBfX2NyY18qIHN5bWJvbHMuIFRoZSBsaW5rZXIgc2NyaXB0IGZv
cm1hdCBkZXBlbmRzDQo+Pj4gb24gQ09ORklHX01PRFVMRV9SRUxfQ1JDUy4gSWYgaXQgaXMgZW5h
YmxlZCwgX19jcmNfKiBob2xkcyB0aGUgb2Zmc2V0DQo+Pj4gdG8gdGhlIHJlZmVyZW5jZSBvZiBD
UkMuDQo+Pj4NCj4+PiBJdCBpcyB0aW1lIHRvIGdldCByaWQgb2YgdGhpcyBjb21wbGV4aXR5Lg0K
Pj4+DQo+Pj4gTm93IHRoYXQgbW9kcG9zdCBwYXJzZXMgdGV4dCBmaWxlcyAoLiouY21kKSB0byBj
b2xsZWN0IGFsbCB0aGUgQ1JDcywNCj4+PiBpdCBjYW4gZ2VuZXJhdGUgQyBjb2RlIHRoYXQgd2ls
bCBiZSBsaW5rZWQgdG8gdGhlIHZtbGludXggb3IgbW9kdWxlcy4NCj4+Pg0KPj4+IEdlbmVyYXRl
IGEgbmV3IEMgZmlsZSwgLnZtbGludXguZXhwb3J0LmMsIHdoaWNoIGNvbnRhaW5zIHRoZSBDUkNz
IG9mDQo+Pj4gc3ltYm9scyBleHBvcnRlZCBieSB2bWxpbnV4LiBJdCBpcyBjb21waWxlZCBhbmQg
bGlua2VkIHRvIHZtbGludXggaW4NCj4+PiBzY3JpcHRzL2xpbmstdm1saW51eC5zaC4NCj4+Pg0K
Pj4+IFB1dCB0aGUgQ1JDcyBvZiBzeW1ib2xzIGV4cG9ydGVkIGJ5IG1vZHVsZXMgaW50byB0aGUg
ZXhpc3RpbmcgKi5tb2QuYw0KPj4+IGZpbGVzLiBObyBhZGRpdGlvbmFsIGJ1aWxkIHN0ZXAgaXMg
bmVlZGVkIGZvciBtb2R1bGVzLiBBcyBiZWZvcmUsDQo+Pj4gKi5tb2QuYyBhcmUgY29tcGlsZWQg
YW5kIGxpbmtlZCB0byAqLmtvIGluIHNjcmlwdHMvTWFrZWZpbGUubW9kZmluYWwuDQo+Pj4NCj4+
PiBObyBsaW5rZXIgbWFnaWMgaXMgdXNlZCBoZXJlLiBUaGUgbmV3IEMgaW1wbGVtZW50YXRpb24g
d29ya3MgaW4gdGhlDQo+Pj4gc2FtZSB3YXksIHdoZXRoZXIgQ09ORklHX1JFTE9DQVRBQkxFIGlz
IGVuYWJsZWQgb3Igbm90Lg0KPj4+IENPTkZJR19NT0RVTEVfUkVMX0NSQ1MgaXMgbm8gbG9uZ2Vy
IG5lZWRlZC4NCj4+Pg0KPj4+IFByZXZpb3VzbHksIEtidWlsZCBpbnZva2VkIGFkZGl0aW9uYWwg
JChMRCkgdG8gdXBkYXRlIHRoZSBDUkNzIGluDQo+Pj4gb2JqZWN0cywgYnV0IHRoaXMgc3RlcCBp
cyB1bm5lZWRlZCB0b28uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEg
PG1hc2FoaXJveUBrZXJuZWwub3JnPg0KPj4+IFRlc3RlZC1ieTogTmF0aGFuIENoYW5jZWxsb3Ig
PG5hdGhhbkBrZXJuZWwub3JnPg0KPj4+IFRlc3RlZC1ieTogTmljb2xhcyBTY2hpZXIgPG5pY29s
YXNAZmphc2xlLmV1Pg0KPj4+IFJldmlld2VkLWJ5OiBOaWNvbGFzIFNjaGllciA8bmljb2xhc0Bm
amFzbGUuZXU+DQo+Pg0KPj4gUHJvYmxlbSB3aXRoIHY2LjAtcmMxDQo+PiBQcm9ibGVtIHdpdGgg
djUuMTkNCj4+IE5vIHByb2JsZW0gd2l0aCB2NS4xOA0KPj4NCj4+IEJpc2VjdGVkIHRvIDdiNDUz
NzE5OWE0YSAoImtidWlsZDogbGluayBzeW1ib2wgQ1JDcyBhdCBmaW5hbCBsaW5rLA0KPj4gcmVt
b3ZpbmcgQ09ORklHX01PRFVMRV9SRUxfQ1JDUyIpDQo+Pg0KPiANCj4gV2hhdCB5b3UgYXJlIGxv
b2tpbmcgZm9yIGlzLi4uDQo+IA0KPiBjb21taXQgN2QxM2ZkOTZkZjg3NWE5ZDc4NmVlNmRjYzhm
ZWM0NjBkMzVkNGIxMg0KPiAoIm1vZHBvc3Q6IGZpeCBtb2R1bGUgdmVyc2lvbmluZyB3aGVuIGEg
c3ltYm9sIGxhY2tzIHZhbGlkIENSQyIpDQo+IA0KPiBJdCdzIHBlbmRpbmcgaW4ga2J1aWxkLmdp
dCNmaXhlcy4NCj4gDQo+IC1TZWRhdC0NCj4gDQo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tYXNhaGlyb3kvbGludXgta2J1aWxkLmdpdC9jb21t
aXQvP2g9Zml4ZXMmaWQ9N2QxM2ZkOTZkZjg3NWE5ZDc4NmVlNmRjYzhmZWM0NjBkMzVkNGIxMg0K
PiBbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWFz
YWhpcm95L2xpbnV4LWtidWlsZC5naXQvbG9nLz9oPWZpeGVzDQo+IA0KDQpUaGF0IHBhdGNoIGRv
ZXNuJ3QgZml4IHRoZSBwcm9ibGVtLg0KDQpDaHJpc3RvcGhl
