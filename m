Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF058028A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls50G515zz3c9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:21:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DnN1cX6j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.59; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DnN1cX6j;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90059.outbound.protection.outlook.com [40.107.9.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4zT6fgWz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:21:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQTRiJBnSIiFAioT+0mvAIP9iydtKpMD6qTb8ygV21PKqNqClmqp9Jb6rDHm7RwyO+99OCxGCfEK4gBFPqbd0u/zMyQlk1EDpFssX1trAuVlniq/4A1GGA57iHX6GlPxz4TS6F9mwgkOP0MryVQZGZK/dLAWTKEiBiruASrjuVje/vLfWlpma+/EW6nAU1ek7+K916bCBIvRNeB/mu0nTpdTkbDxLlYIptiZn1UymzuwsLWHTsHZUC4yBMvnSjltbHvkKyeAhf6oEs6ZVLj2cpnJJWp1n8zsFCzjf1G8Fz4c8hmW6Zd9CuaopGbSIbToejjt/XZnhOI5VYrSrPsiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrLGZh9ZZDGE6iPAopDAZ05ta6FoENX6JJUhI8Xw05k=;
 b=K43D6dzBTfKMlNBdnI9eR0Zf8GfTZeeR03C4yYgHpTMAagYs4bri3TuidZeRu60o9/c13z3x59J4DNB1zagZqB80vjdtv2cgq0At1QyQ7vWUKtEILlKiyPb/K5xOMlgoGLfOgWLp7F8YEaO1Cfb2PI4lXzDE/cZms4V2HiNOdmuAjhN37tIdivOoHiql5xh5MkKtfb5b3eFsHNS8n/gn90S9g4vkDyBAJGbb9OO/naJgDbGZmBDFf1QMq5aEA2EjNQ5JnJXrTZQPzY5xp/WCAHNvj9qQPygEnGMno7ANnJ6p/xDuC0UR5rWMR3zIB0FpxtOSarXBXqRKyKq5J9t0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrLGZh9ZZDGE6iPAopDAZ05ta6FoENX6JJUhI8Xw05k=;
 b=DnN1cX6jQhEE/XqD5/92wFh7Vwz5e2qAKs3nHfJk31YE8+wUBJby6d6SVVen7qUDRn6At+XgbqvcjaSHHXJhrVn+Beqe1HYfsbdsER3nB4CV372PzzscHRlbUqHGJ32bsGNcCvmCk+MT+/jTstjF0OnhaJHNuBPr7AsZqbo18h93z3MfnBKci09qwT8+nuBDlw65NNF+S0mBV1oISr/XNvli7TLavEMILw+M0l/YR9QbuqHRF3EiDtMWkdQZerbKxdehtL2EgDCZwUi4tPrT0QiDb3o9SgLKAc88qs/a0VeF08057hFMkXENLIKU7ki/aiJGlOH1nkEtpDnUXbRoAw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2738.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 16:20:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 16:20:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Topic: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Index: AQHYnarFcL6sKMJcmk+y5CiOp18nOa2MCX8AgAAG5QCAArLxgIAATEEAgAA6FYA=
Date: Mon, 25 Jul 2022 16:20:49 +0000
Message-ID: <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
References: <20220722090929.mwhmxxdd7yioxqpz@pali>
 <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali>
In-Reply-To: <20220725125256.cg6su4d2ageylvp6@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c234b66-6254-4912-fe6f-08da6e59a316
x-ms-traffictypediagnostic: MR1P264MB2738:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hTZEkeoJJ6dWBUu54JBnwygiw7EKPy6IpYpxQbd/x5iYJyXyT71YJxtb8XLoTfyFfxZFIRk3ZUYLfhNW5CCZJ1wyTCsw+jNF43xQXIq3/XLCZ/svMypM1C+nuygjJ+HO85J3ZshVFW4tyA0/mdM8dEcJJQoicMtMnzvVjzJq/BqrK4Y47UPfDBP2DkpDrKV1TuDPVu/8wBlR1ZQfwUKjOXxwXnAmAk/Ju5w8ailoRd/N5LP9CWTXoatBN4PjeKpRjGOa4e+SLLqpK+ae/6mtLPzVnITMy6aff5Pp5ExMuavqW87Faa+F/4Jzlxx1uNpYYdGfzOqhyi7knl7xdSfH3KZexNBqsaVtKcrx6bS7m7P8OTM7o6dx55USKj0NqNwCwcQZ0pPwu3MhPyjkA6EjZkyPzgE9Hu46XdOE+ExFLee9VrupnSYKUPrifa0Y7Yzhjyc4YrAx8P/t/pwsw9Huyj3MUQtKRVlm97GkczGtP+Bjo0p/nMoDEir6l7T4zkq8jBnrQ2GajW9Jwl5nEjZCu+1rkg8uUZRs3mz+9YVd1ZNrKiRq2zCoAKZeHgMKkj7ldZpLTF6MM/R5wnqFeaSEEbW/aeeev8j5fBRKYBYXOmPqAsY6HaRlNAXIz++0vDTdyXuxckhhau+K5qbQwr4GuCFvM9hKOGESTYUc1AQtOnN3WDSuI1iAQGhxLhuxgYO5835Vo3X6S/vuhrbX9ZgKvrhzzor95yIqnG6fOmvaNwc4MRmageBkOpvV+fOpuy8+9IhlqqeDbmKoEEM/KND5hkQIuvKKxXYrBLExLOSY8iq750JijIM8us5QKkCgZyCUpFLcrxv0DawIvRQUWBArmv9vM5i2fSgDvvHtruGe0rLxkwISH/MjVcdOmX+v9sB7OzefWp6hI3olgpntu3FPjw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(136003)(376002)(396003)(346002)(366004)(8936002)(966005)(6486002)(38100700002)(31696002)(5660300002)(8676002)(4326008)(86362001)(478600001)(31686004)(71200400001)(122000001)(36756003)(2616005)(66476007)(83380400001)(66446008)(64756008)(91956017)(66946007)(66556008)(38070700005)(110136005)(186003)(44832011)(6506007)(76116006)(26005)(41300700001)(6512007)(54906003)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dGxlZEdxQm5kbUhPQnZyblVTYkY2b1pMdVdwU1JKeFZjeEh1ald2MGp1b3ZW?=
 =?utf-8?B?eDNaUUhBOWJBajJRaTNzUTdUdzVCVlI4eUJiVHFWMjNoTXp0RDFLbGtkM2NT?=
 =?utf-8?B?NTJCU3h5V0h2L25haHNJQlBlbjgvWXpobUxuaTJWUXlscFhPNWQyd1NmT0t1?=
 =?utf-8?B?cG9MRVJGZDJBdTRycXRPVUpZNkNvSCtweVNzaUlRTjJGMmtON2dxQmJZakpi?=
 =?utf-8?B?RGhVU3VnVW1Ga09lTkZkK2dCZEVibUwzWGYwRTJXaWtoNDJ4elVZdGpYbGk0?=
 =?utf-8?B?eFczTDdDQU9RV0lUZ3IxVmt5YkY2b3Fua0x2YW9DamZYL3VDZ3pKeUxEcTlR?=
 =?utf-8?B?alV4YkZNekh2bXdsUkNrWGFlRXJmOWx5WTFWVUt3UWQzaDNXT0E3TUd2VEgy?=
 =?utf-8?B?TjVkZ3dpdFR5REk0RkdsT1h0WnFXdVlpRk0wYUEvN2J2OXJNVTZFVk52YitB?=
 =?utf-8?B?cXJYN2p2TnBqUUJhOHJKMmc1NFM4WmI2WGtKZTZINGJCTUJ5SFB0TkcvSzkz?=
 =?utf-8?B?ZXp3TUplU3RXcWUxRHNveko3SHlQRnpzbzg3ZS9rcWM2SUt5RnRNa2IxZk9r?=
 =?utf-8?B?MGQvYnh5MWdoWVpnZkVNY2VmZ3BFYUJHcXZwbjU4S2V3YW1ZUzhnMmRreWh1?=
 =?utf-8?B?aXdidlpxMHJqT1gwZGFyakV1TXdhYmRNdDRLM1BkWDdmakJpSUZnNDZIVy82?=
 =?utf-8?B?ZHpoZjVTK01SWXFUbW1WOUtzV2pzM0RHK3pnWGhNbDdLYnFka25XWWcxeWRy?=
 =?utf-8?B?M0lTdkp1bjFtd2dMeW83bldFMGl5bGVtTkovaGoxYW5PcHRGQ1p0S0llM2xz?=
 =?utf-8?B?NlpLM2YwTmpDSGgwVStoclRqaWIxRy82QTVGWGRKZ2gweDJJZVNGbnphOWwy?=
 =?utf-8?B?dnl5MDlld3l0a3ZOTytpekpkenRvNklvR25rQVZYQlhUVDZ4UWd0b3pDdXFu?=
 =?utf-8?B?SVJEd3ZPbm0zNjN2eStlQTgyZW1PaTNSV2FqOTlyUXRrazJ3aTl2dGZWVmhj?=
 =?utf-8?B?T2QrSFV2OW5jWkk0dHRmOTBOa1VTMmxqTGt1V1k1alR3WGluVUZVM3dhWVNX?=
 =?utf-8?B?NFpqUmJmR05oeDB4R3d4SDhQSTc0b3djWC9hUFU2clFFajVWSklxeWNqRDVG?=
 =?utf-8?B?MnJGTFQ2TWVFQkpKeHBtQ2VETFVaS0VOWDRFVHJwQVRqd2xqT0VwRnZhV3VK?=
 =?utf-8?B?N0c0c1llb2EzNlF3ZFVxYWFwTitrZXZ1ZEZUQUFlRW00aFplNFZkU2RRQzln?=
 =?utf-8?B?ejN3bUwvV2NrTXVmRFpYQ3NPT3ZDWk5pRnZHQUhqU05KcWEzWmVuVmNLYjJU?=
 =?utf-8?B?RU5BOENIZGZyRHBkWDhCUVorR3paWUl2cXZHOG9RQ1hDUDlzeDVBK05hSnhU?=
 =?utf-8?B?MEVGS2lLUTJpL1liQldZc3B5MVlUM1dxMWV0YWtwWk11VVFhVTJpa2RXdWdP?=
 =?utf-8?B?Z044WEJ5dUE1TGczUmpDdmV5WFRCN1BNSWV1T1kzMTNGRkVhbHFuVzQ3b1BG?=
 =?utf-8?B?ZlJUdXB3c0dvMWZNaGY4YWluZEkycGQvUS8vRndJUlJDSzQxRmxocUhnNThU?=
 =?utf-8?B?RWNvV3o1a09ad3k3NFN6UXpObWhiUXdUVFZlS0x0dkhabEJiWlFHY3h0V3Rp?=
 =?utf-8?B?eWNoS01sZmtZY1B4bVN0V2xUdDBIN0dLUncwRGpGejR3ai9mZXU1eWJjVnFp?=
 =?utf-8?B?NjdpUVJINlo3QUNEU2ViRVhUdGdjTXVoaEFjVVE1ZlRJVGVkSEZuMGphSHVq?=
 =?utf-8?B?ZzFZUWV6T29RVFlhSWJheG1NaU9tRzhDMzEydUZZRHp6NjlyYkNLc2JBTWtT?=
 =?utf-8?B?NnNudEFQLzFNSFRZakhVemNRUHVGVnNBKy9ISVdHWHBudEFQcHk1eW5rdVVP?=
 =?utf-8?B?TlltRHhHRXdvaUR3enJxcGxZQUZyR0tKZGtmN1B4ZUxsZUJUUFMzUXlFanIv?=
 =?utf-8?B?b0ZCM1cwTXVVb2dNVWZkRitDV0hWalcxaEZyVVV3anlPb3hUd0VUM3huS2tx?=
 =?utf-8?B?SmFBRHZCc01kMUhzaWV2bDNmcWNBd2xhMzhBV21tMjdzZzdpdjBvUmFiWnFF?=
 =?utf-8?B?N29mRWxVajRRSnd5c3NiYnNPWUtKZ1pBWnlZbkdncEtNdzlRM05ucnd2N2Rm?=
 =?utf-8?B?Z3Rtem5wVkp5S05tR1RrNldJTUZNTjBYMjVUVjJOenBvSTdscHBvUyt0UGxk?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF74728681D4344E8D7BD01D2A9BE681@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c234b66-6254-4912-fe6f-08da6e59a316
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 16:20:49.3371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdsTPJmI9LNtWYaecSJj48qhnsrSR7F44BxVDR2fqTPEpqFg1UjIjVRwTxoDU/Ao2jC4KpG1TvZa1u2dZn1hdqfpmTs8qNWVr600IZkiYpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2738
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMTQ6NTIsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IE1vbmRheSAyNSBKdWx5IDIwMjIgMTg6MjA6MDEgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+
IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+PiBPbiBTYXR1cmRheSAy
MyBKdWx5IDIwMjIgMTQ6NDI6MjIgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4gTGUgMjIv
MDcvMjAyMiDDoCAxMTowOSwgUGFsaSBSb2jDoXIgYSDDqWNyaXTCoDoNCj4+Pj4+IFRyeWluZyB0
byBib290IG1haW5saW5lIExpbnV4IGtlcm5lbCB2NS4xNSssIGluY2x1ZGluZyBjdXJyZW50IHZl
cnNpb24NCj4+Pj4+IGZyb20gbWFzdGVyIGJyYW5jaCwgb24gRnJlZXNjYWxlIFAyMDIwIGRvZXMg
bm90IHdvcmsuIEtlcm5lbCBkb2VzIG5vdA0KPj4+Pj4gcHJpbnQgYW55dGhpbmcgdG8gc2VyaWFs
IGNvbnNvbGUsIHNlZW1zIHRoYXQgaXQgZG9lcyBub3Qgd29yayBhbmQgYWZ0ZXINCj4+Pj4+IHRp
bWVvdXQgd2F0Y2hkb2cgcmVzZXQgdGhlIGJvYXJkLg0KPj4+Pg0KPj4+PiBDYW4geW91IHByb3Zp
ZGUgbW9yZSBpbmZvcm1hdGlvbiA/IFdoaWNoIGRlZmNvbmZpZyBvciAuY29uZmlnLCB3aGljaA0K
Pj4+PiB2ZXJzaW9uIG9mIGdjYywgZXRjIC4uLiA/DQo+Pj4NCj4+PiBJIHVzZWQgZGVmYXVsdCBk
ZWZjb25maWcgZm9yIG1wYzg1eHggd2l0aCBnY2MgOCwgY29tcGlsYXRpb24gZm9yIGU1MDANCj4+
PiBjb3Jlcy4NCj4+Pg0KPj4+IElmIHlvdSBuZWVkIGV4YWN0IC5jb25maWcgY29udGVudCBJIGNh
biBzZW5kIGl0IGR1cmluZyB3ZWVrLg0KPj4+DQo+Pj4+PiBJIHJ1biBnaXQgYmlzZWN0IGFuZCBp
dCBmb3VuZCBmb2xsb3dpbmcgY29tbWl0Og0KPj4+Pj4NCj4+Pj4+IDk0MDFmNGU0NmNmNjk2NWUy
MzczOGY3MGUxNDkxNzIzNDRhMDFlZWYgaXMgdGhlIGZpcnN0IGJhZCBjb21taXQNCj4+Pj4+IGNv
bW1pdCA5NDAxZjRlNDZjZjY5NjVlMjM3MzhmNzBlMTQ5MTcyMzQ0YTAxZWVmDQo+Pj4+PiBBdXRo
b3I6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+Pj4+
IERhdGU6ICAgVHVlIE1hciAyIDA4OjQ4OjExIDIwMjEgKzAwMDANCj4+Pj4+DQo+Pj4+PiAgICAg
ICBwb3dlcnBjOiBVc2UgbHdhcngvbGRhcnggZGlyZWN0bHkgaW5zdGVhZCBvZiBQUENfTFdBUlgv
TERBUlggbWFjcm9zDQo+Pj4+Pg0KPj4+Pj4gICAgICAgRm9yY2UgdGhlIGVoIGZsYWcgYXQgMCBv
biBQUEMzMi4NCj4+Pj4+DQo+Pj4+PiAgICAgICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4+PiAgICAgICBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+Pj4+PiAgICAgICBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzFmYzgxZjA3Y2FiZWJiODc1Yjk2M2UyOTU0
MDhjYzNkZDM4YzhkODUuMTYxNDY3NDg4Mi5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
DQo+Pj4+Pg0KPj4+Pj4gOjA0MDAwMCAwNDAwMDAgZmU2NzQ3ZTQ1NzM2ZGZjYmE3NDkxNGE5NDQ1
ZTVmNzBmNTEyMDYwMCA5NjM1OGQwOGI2NWQzMjAwOTI4YTk3M2VmYjViOTY5YjNkNDVmMmIwIE0g
ICAgICBhcmNoDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IElmIEkgcmV2ZXJ0IHRoaXMgY29tbWl0IHRo
ZW4ga2VybmVsIGJvb3RzIGNvcnJlY3RseS4gSXQgYWxzbyBib290cyBmaW5lDQo+Pj4+PiBpZiBJ
IHJldmVydCB0aGlzIGNvbW1pdCBvbiB0b3Agb2YgbWFzdGVyIGJyYW5jaC4NCj4+Pj4+DQo+Pj4+
PiBGcmVlc2NhbGUgUDIwMjAgaGFzIHR3byAzMi1iaXQgZTUwMCBwb3dlcnBjIGNvcmVzLg0KPj4+
Pj4NCj4+Pj4+IEFueSBpZGVhIHdoeSBhYm92ZSBjb21taXQgaXMgY2F1c2luZyBjcmFzaCBvZiB0
aGUga2VybmVsPyBBbmQgd2h5IGl0IGlzDQo+Pj4+PiBuZWVkZWQ/IENvdWxkIGVoIGZsYWcgc2V0
IHRvIDAgY2F1c2UgZGVhZGxvY2s/DQo+Pj4+DQo+Pj4+IFNldHRpbmcgdGhlIGVoIGZsYWcgdG8g
MCBpcyBub3Qgc3VwcG9zZWQgdG8gYmUgYSBjaGFuZ2UgaW50cm9kdWNlZCBieQ0KPj4+PiB0aGF0
IGNvbW1pdC4gSW5kZWVkIHRoYXQgY29tbWl0IGlzIG5vdCBzdXBwb3NlZCB0byBjaGFuZ2UgYW55
dGhpbmcgYXQNCj4+Pj4gYWxsIGluIHRoZSBnZW5lcmF0ZWQgY29kZS4NCj4+Pg0KPj4+IE15IHVu
ZGVyc3RhbmRpbmcgb2YgdGhhdCBjb21taXQgaXMgdGhhdCBpdCBjaGFuZ2VkIGVoIGZsYWcgcGFy
YW1ldGVyDQo+Pj4gZnJvbSAxIHRvIDAgZm9yIDMyLWJpdCBwb3dlcnBjLCBpbmNsdWRpbmcgYWxz
byBwMjAyMC4NCj4+DQo+PiBDYW4geW91IGNvbXBhcmUgdGhlIGRpc2Fzc2VtYmx5IGJlZm9yZSBh
bmQgYWZ0ZXIgYW5kIGZpbmQgYSBwbGFjZSB3aGVyZQ0KPj4gYW4gaW5zdHJ1Y3Rpb24gaGFzIGNo
YW5nZWQ/DQo+Pg0KPj4gY2hlZXJzDQo+IA0KPiBZZXMsIG9mIGNvdXJzZS4gSGVyZSBpcyBkaWZm
IGJldHdlZW4gb3V0cHV0IGZyb20gb2JqZHVtcCAtZCB2bWxpbnV4Lg0KPiBvcmlnaW5hbCB2ZXJz
aW9uIC0tLSBpcyBmcm9tIGdpdCBtYXN0ZXIgYnJhbmNoIGFuZCBtb2RpZmllZCB2ZXJzaW9uICsr
Kw0KPiBpcyB0aGUgb3JpZ2luYWwgdmVyc2lvbiB3aXRoIHJldmVydGVkIGFib3ZlIHByb2JsZW1h
dGljIGNvbW1pdC4NCj4gU28gdGhlICsrKyB2ZXJzaW9uIGlzIHRoZSBvbmUgd2hpY2ggaXMgd29y
a2luZy4NCj4gDQo+IC0tLSB2bWxpbnV4Lm1hc3Rlci5kdW1wCTIwMjItMDctMjUgMTQ6NDM6NDUu
OTIyMjM5NDk2ICswMjAwDQo+ICsrKyB2bWxpbnV4LnJldmVydC5kdW1wCTIwMjItMDctMjUgMTQ6
NDM6NDkuMjM4MjU5Mjk2ICswMjAwDQo+IEBAIC0xLDUgKzEsNSBAQA0KPiAgIA0KPiAtdm1saW51
eC5tYXN0ZXI6ICAgICBmaWxlIGZvcm1hdCBlbGYzMi1wb3dlcnBjDQo+ICt2bWxpbnV4LnJldmVy
dDogICAgIGZpbGUgZm9ybWF0IGVsZjMyLXBvd2VycGMNCj4gICANCj4gICANCj4gICBEaXNhc3Nl
bWJseSBvZiBzZWN0aW9uIC5oZWFkLnRleHQ6DQo+IEBAIC0xMTIxMyw3ICsxMTIxMyw3IEBAIGMw
MDBiODUwOgkzZiBhMCBjMSAwZiAJbGlzICAgICByMjksLTE2MTENCj4gICBjMDAwYjg1NDoJODEg
MDIgMDAgMDQgCWx3eiAgICAgcjgsNChyMikNCj4gICBjMDAwYjg1ODoJM2IgZmQgMTAgNjggCWFk
ZGkgICAgcjMxLHIyOSw0MjAwDQo+ICAgYzAwMGI4NWM6CTM5IDQwIDAwIDAxIAlsaSAgICAgIHIx
MCwxDQo+IC1jMDAwYjg2MDoJN2QgMjAgZjggMjkgCWx3YXJ4ICAgcjksMCxyMzEsMQ0KPiArYzAw
MGI4NjA6CTdkIDIwIGY4IDI4IAlsd2FyeCAgIHI5LDAscjMxDQo+ICAgYzAwMGI4NjQ6CTJjIDA5
IDAwIDAwIAljbXB3aSAgIHI5LDANCj4gICBjMDAwYjg2ODoJNDAgODIgMDAgMTAgCWJuZSAgICAg
YzAwMGI4NzggPGRpZSsweDY4Pg0KPiAgIGMwMDBiODZjOgk3ZCA0MCBmOSAyZCAJc3R3Y3guICBy
MTAsMCxyMzENCg0KVGhhdCdzIHJlYWxseSBzdHJhbmdlLiBJIG1hZGUgYSB0cnkgd2l0aCBtcGM4
NXh4X2RlZmNvbmZpZyB3aXRoIEdDQyAxMSANCmFuZCBJIGRvbid0IGdldCBhbnkgc3VjaCBkaWZm
ZXJlbmNlLg0KDQpEb2VzIHlvdXIgdmVyc2lvbiBvZiBHQ0MgaGFzIGFueXRoaW5nIHNwZWNpYWwg
Pw0KDQpDYW4geW91IHNlbmQgeW91IGV4YWN0IC5jb25maWcgPw0KDQpUaGFua3MNCkNocmlzdG9w
aGU=
