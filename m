Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D758A302B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:09:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=e2b0Ys6t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGJMs2Vc1z3vvX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 00:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=e2b0Ys6t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGJM53vykz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 00:08:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6OK4u9xrboXdpqHxW21VHjtR/ZaJ27Fbs18QsHG0GsMEk9eaDxdW1ZpoYuuA1ng8JLawLnRoqShIPYGXxLlH0ebacxg691vVFMAbdYTTxJqhs0aeELk0IfS0j3czNI0Q95TG0SPwRK3kI0NzmJ0d7Hmby/38JEqR72ES/Sb3NYboQtfZR0jwKwjEEdIHe8i9i5qQH1XnaiXyTBx/JrXLecGuz5D77fD3+tAU1F/KzphxOzvrkpyuiQ/KaFfon5KQ6uouRRJxSoExNRgpeOc+QVz9KU8t6qF9Ow6CM0NV1L/znczq6bDuGefJXO4tdWidI5GumPP7KIb67kzAD9/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQksJRu4pj5GWi2/lM/0D38MI0I3gZEb7B09aFO3Yq0=;
 b=QzwzXtiiVrkCO01SSVb170ih3tmxMuRt3S7wCl9kcWIOjjEmEWNPNKO47pCugZt9ECovg1zGl7AAnLFF69EUju2xLht6K3xqqYHkifN6lFIBYXLdYs3YfUS9/bynz1H25/jfAN7w2L01FYUPQeKFGkLUHWOISM9cSK4QDgIqc+/LAorCeh8uKWB7R8ME1VwR04f4Wl8TsuGtMG308S+YMlTwp/TA/jwXt6qNwoAdRdQ6J4PuHyHCMI2F9dJgXhlgJxKoZG5E1WoQIotw5ACBmEDTkKjVMEC81afWE/wgVt1fkRdy4TON53X7ddSsqc9PZ/DrfeMs+V+1ytdPrJLkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQksJRu4pj5GWi2/lM/0D38MI0I3gZEb7B09aFO3Yq0=;
 b=e2b0Ys6tglPaYlgjVSXVaLEKc8z9wo+p7eejngHwZUowIIdjVrpB5MSbNEc16879FlBjWngDLxY9DV4UBxxcZPROrVB2XAcrRQnGdZZr7nGuFiodKxL7YR66qAKtQkQFqLwImj/CfV8MwjfKqGTJ3DOyrNTCGrtkhTKEoaisOX8d3tRBxq8VM6EKcbG9dTJrsiJvcRhcGKrL14oDXf+uH0pbAbe14RSL1aRxBMjAehMlwPREn2vqciWUwWlTGjpux1yGPYv73LGJC1mkkp6t7gFmiJFHHm5HukhH6+Xr+WUs2ylznk5Vn+0Lb0AC1O7bBxXfJGW07Sdkodn2uYfxLA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PARP264MB4654.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:42d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 14:08:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 14:08:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Topic: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Index: AQHafsSU45Ki1FdCPEivNpHUmuU++LFIqD8AgBqxMACAAW6xAA==
Date: Fri, 12 Apr 2024 14:08:03 +0000
Message-ID: <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com> <ZhgMqF7SNaISrYMJ@x1n>
In-Reply-To: <ZhgMqF7SNaISrYMJ@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PARP264MB4654:EE_
x-ms-office365-filtering-correlation-id: 998a952f-0f28-454e-b737-08dc5af9f804
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QVvbVbiK+H1u1A1PrEG1gKDzF/dM5D8F7RQaLYVhrqJJ0IUbPwexFx2gvL89+EjKcRagBpOmYlRJ7+Xr+sZaKWw0FXjff+YTglVLv61v45btKLBQtCGP6d1Ds1wUnbgjY1y7u4M+RwEzGh5S8r+ovhRRwqKwW62O48TvSn8JgO8dPscGspTas4FPsD6N/nzo2Czm7aYfeMAvQpaondperXX4G0EwsYJKh01d2Ki7pywvmx7gVJm3+7mobDy/r60JhkwnRzsxKB7Ae9tkowJDroYBLFQVyGr7i3YcZY0OVPql04eQS+aqKmEqdB3XWp5XMWgeZ9ct5puIgxafFB5vRJXXwKUzxEiwaMWPNj5DQXMGT2Mg2AwbUf4RzqU8WZGtM4ye9iBcT59pJaXu1oHdyz9cErmzpTkul+jpib/8GckTgYRRGtz/3wXilvrKRB/Z7dWk47Q7tlqvkmmdVDnWbY5qwUe6in+LfXUBAV9xIys0gXUoVO8ZBPrajhdCG4bBHWRK7ZbgA16WSZ37e97Yez2ZhQu/vqjUrqTQ+0qyPB6XjuhrKdlzvj6a+l5Y3Bnw1aZHUIeHv6/9PmOIGziGInRCQTkZFTKzbjSsBW8uc7uKFZ60iFUOvauHLnFn2HcGzsiPsdhgrxAVaU0TcUPwxq+fu5KtdZjiP3H0DNtFBrn1QulGDe57tcH//lE97+bZrf1NyP3DuYOphmtcwbAWG6H6DbPTmw0dHYHN2ETlUPo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TWNOckRLd2UrZmpGR1V5cndCNXk1UG9zcitOelJ1WHhKUUJLU1Zjbndid01q?=
 =?utf-8?B?TGg0b3RTY2RkaUVNSWRNOGlXdEVTa2FvSklnSFB1M3BoWVRkVVRNSEYxVnVC?=
 =?utf-8?B?RlZEaXdHaVRPRGRpN3ZwUXpRSkJQMFYvNW9JTTYzMlIrRHc0cFRGVDgrakkx?=
 =?utf-8?B?VThwWS9CNmdhRVhtMVFNQzUzVWNsSWR4N2lHTnlvR1pkV0h2ZVNDRHdjY3FO?=
 =?utf-8?B?bzFuZDNycU91MHBtQlAxYWZRcTNxWFFXd25XYU5WWXZ5QlJmNTVORjFFL0Zk?=
 =?utf-8?B?TGRIdTVOQTlYVW9yNVA4MGNua2xIQTFHL3J3b0RaQnUyRXBJK3VyRUJDc2JG?=
 =?utf-8?B?cW5rUThSOVpmVUxROHpRZ21sbXhuTVBHbWhaY3IvWS9HeDRDajZQR0k0ZGFq?=
 =?utf-8?B?S1A3b0k1ZWhuazZ5T3JjMkxXWUVITXZscnVQLzIyRFhkMTNCL0JyUlJLeTZI?=
 =?utf-8?B?cVp5RkNuUWtURkhaQldQYm5FZVlxVlRJMFpsYkJHWWZicmo5N1JUQWJGbUF3?=
 =?utf-8?B?KzBqV3NENGx3ZWRzTi8xd3FyVGcvdVJoKzR4RFdvWXdiSEUyUWpGaVBrLzVp?=
 =?utf-8?B?cm0vazBXLzk0NlJDSm1xQ1o1bFAvN1Z5UWgraWZaSXNqc3lVVnp5QWFxa1lK?=
 =?utf-8?B?ZEJFNkZQNWFZTGJyNGwrblFwbVhJbmdmcktnNUtZK3RvNmg5Wnk2Q2FtYnRu?=
 =?utf-8?B?ZFNUNUEvbGFrdHBMRXRCRVRyUUphU0xtd1NYY0dJQUFCY05uVzZkYUdlc1JQ?=
 =?utf-8?B?S0hlRmtZd09xWnRzS1hWMGd4ZWFtQ3R4QWh5Y2dacU1RdVFIM0NZTFNXNCs1?=
 =?utf-8?B?YWRmMmxFRWpqQ1ZwK3picEpQaytLMWNZUHh3eE51TUtmWlpyM2ZzMXdldVho?=
 =?utf-8?B?YndDbFBVUFRWOC9GK1hsd2tFcmtFdmJlVjlyQWcyWGh6OGJBQkpFNkovY2ZY?=
 =?utf-8?B?VEYxV25mYmFKc01zMkNjNWpYN0VjRW8wNGpPSmxFQmthcUlDMDBLSzBXdXhB?=
 =?utf-8?B?dXZNWURDeGlLNllYUFlKMTFGZEphdjdWOVpjY0NGeThPR0FNc25sRHJZamxM?=
 =?utf-8?B?R0g3U01INi9JS2dlb2xQWW1mYTl2TTZWZ0V2NlJXMHh5b2p3U2Nhc3Bna1Ba?=
 =?utf-8?B?SEhJTWxLMHhhQTdkU1QzYmJrU29yQ3BzRDZCYnJxeFJaSnZSNyt3bHVRMHF0?=
 =?utf-8?B?OEZWbnBIWVNFck04L3NOZnNPa0FUQjErSSsvQ1NrNlBsSVJXZm1IYnhteVR5?=
 =?utf-8?B?UTNxUkVnU0lOZnhkTTRYSDYzanlxWmZ5UlRVRzBCejhkYy9QcjZ0RS9OeFhI?=
 =?utf-8?B?eU04MHA1clowTW9xYkNRWkE5N2ljbU82UDlETFVRaGsyWldKZnovZ1UzUlFs?=
 =?utf-8?B?dStsOHM2YjY1K0tUWWRDemY2UzV1VVpRREUyem5RZkd3M0psSmhFUHpETUFX?=
 =?utf-8?B?VTZZN3BBWGVxSFgwUldhUzliMmRud0ViQ1Qzb1hoSWNJeXNoZkZLZXFFbGxa?=
 =?utf-8?B?SGZiUmJ2VFUxYnZHZE43YjZWVEU0VGZkMExzQjJuR2E3UVZBU2Q1Q0NiYnZ0?=
 =?utf-8?B?c2hZajFLMS91Y0pySjFmTFhlbVFpVnVXWDJhYWh1c05JaGNJRDRBenJWTXE3?=
 =?utf-8?B?ajk1QzNDQlY1K0FvM09MK3dCMjR2UVk5aU1udWY0NHV3NFAxbU9KaXJrMy9G?=
 =?utf-8?B?RFMybWNpOGl2OFhuSEs1VkhWQ1R6UElhclNYSGUyRUJZdk1TL3VvbktRUUVh?=
 =?utf-8?B?THM2QlpHVmRBcGhxcW1rdXlHdXI3QS8zR3RKdkg3NzNUVHdtcmxoQTBwOC9a?=
 =?utf-8?B?ZksrTUsxT3pjYUdYcjA0T3lEcVIyRk96ZHMrYW1WelM3a1ZvVkZZVzBIdnFl?=
 =?utf-8?B?NnovdHN0Qkh0a1N6TUxYVGp0eXZIa3k0L05UclZPWGdqd2p0SHFGKzdLZEpZ?=
 =?utf-8?B?ZEIwZDhOeHdIMjlxZXFpSmoydG9EYU5yL2dJd3FadGt5Y2llRk9ZcDg1S2hL?=
 =?utf-8?B?UGt0TFZ3bXdUbmdiVEt2WTVvTDFVQWhrWjJGUVJQNG1VbFRseStqcDNHTjAv?=
 =?utf-8?B?SnFsamcwbTQ2VVdzcU1neVR5Q1NBbHpvMi9RNTVDalN6SlVZSnRFOHJ1ZTRr?=
 =?utf-8?B?Y3U0TmZuVXFaWjR2S3o3WVN5N0p5V3JIV1RydTVGKzQwNWhPYlN3N0h0a0Rq?=
 =?utf-8?Q?MKDX/mu6Qkd19dsLpauVKqhV0f2g2lX2IVvZxKwCCkWQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60B2548C74DEC84095B93A9E170FD412@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 998a952f-0f28-454e-b737-08dc5af9f804
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 14:08:03.3596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEKSJvu/TMYCYHWSist9N6ULpFeVbgQ/SScu8eH76BmIX6oWMOIDFNX7P5wOxVZziDm16jrDSqYkHWeYoKQtSnaLYbaai9KgcArun6jvwTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB4654
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA0LzIwMjQgw6AgMTg6MTUsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIE1v
biwgTWFyIDI1LCAyMDI0IGF0IDAxOjM4OjQwUE0gLTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90
ZToNCj4+IE9uIE1vbiwgTWFyIDI1LCAyMDI0IGF0IDAzOjU1OjUzUE0gKzAxMDAsIENocmlzdG9w
aGUgTGVyb3kgd3JvdGU6DQo+Pj4gVGhpcyBzZXJpZXMgcmVpbXBsZW1lbnRzIGh1Z2VwYWdlcyB3
aXRoIGh1Z2VwZCBvbiBwb3dlcnBjIDh4eC4NCj4+Pg0KPj4+IFVubGlrZSBtb3N0IGFyY2hpdGVj
dHVyZXMsIHBvd2VycGMgOHh4IEhXIHJlcXVpcmVzIGEgdHdvLWxldmVsDQo+Pj4gcGFnZXRhYmxl
IHRvcG9sb2d5IGZvciBhbGwgcGFnZSBzaXplcy4gU28gYSBsZWFmIFBNRC1jb250aWcgYXBwcm9h
Y2gNCj4+PiBpcyBub3QgZmVhc2libGUgYXMgc3VjaC4NCj4+Pg0KPj4+IFBvc3NpYmxlIHNpemVz
IGFyZSA0aywgMTZrLCA1MTJrIGFuZCA4TS4NCj4+Pg0KPj4+IEZpcnN0IGxldmVsIChQR0QvUE1E
KSBjb3ZlcnMgNE0gcGVyIGVudHJ5LiBGb3IgOE0gcGFnZXMsIHR3byBQTUQgZW50cmllcw0KPj4+
IG11c3QgcG9pbnQgdG8gYSBzaW5nbGUgZW50cnkgbGV2ZWwtMiBwYWdlIHRhYmxlLiBVbnRpbCBu
b3cgdGhhdCB3YXMNCj4+PiBkb25lIHVzaW5nIGh1Z2VwZC4gVGhpcyBzZXJpZXMgY2hhbmdlcyBp
dCB0byB1c2Ugc3RhbmRhcmQgcGFnZSB0YWJsZXMNCj4+PiB3aGVyZSB0aGUgZW50cnkgaXMgcmVw
bGljYXRlZCAxMDI0IHRpbWVzIG9uIGVhY2ggb2YgdGhlIHR3byBwYWdldGFibGVzDQo+Pj4gcmVm
ZXJlZCBieSB0aGUgdHdvIGFzc29jaWF0ZWQgUE1EIGVudHJpZXMgZm9yIHRoYXQgOE0gcGFnZS4N
Cj4+Pg0KPj4+IEF0IHRoZSBtb21lbnQgaXQgaGFzIHRvIGxvb2sgaW50byBlYWNoIGhlbHBlciB0
byBrbm93IGlmIHRoZQ0KPj4+IGh1Z2VwYWdlIHB0ZXAgaXMgYSBQVEUgb3IgYSBQTUQgaW4gb3Jk
ZXIgdG8ga25vdyBpdCBpcyBhIDhNIHBhZ2Ugb3INCj4+PiBhIGxvd2VyIHNpemUuIEkgaG9wZSB0
aGlzIGNhbiBtZSBoYW5kbGVkIGJ5IGNvcmUtbW0gaW4gdGhlIGZ1dHVyZS4NCj4+Pg0KPj4+IFRo
ZXJlIGFyZSBwcm9iYWJseSBzZXZlcmFsIHdheXMgdG8gaW1wbGVtZW50IHN0dWZmLCBzbyBmZWVk
YmFjayBpcw0KPj4+IHZlcnkgd2VsY29tZS4NCj4+DQo+PiBJIHRob3VnaHQgaXQgbG9va3MgcHJl
dHR5IGdvb2QhDQo+IA0KPiBJIHNlY29uZCBpdC4NCj4gDQo+IEkgc2F3IHRoZSBkaXNjdXNzaW9u
cyBpbiBwYXRjaCAxLiAgQ2hyaXN0b3BoZSwgSSBzdXBwb3NlIHlvdSdyZSBleHBsb3JpbmcNCj4g
dGhlIGJpZyBoYW1tZXIgb3ZlciBodWdlcGQsIGFuZCBwZXJoYXBzIHdlbnQgYWxyZWFkeSB3aXRo
IHRoZSAzMmJpdCBwbWQNCj4gc29sdXRpb24gZm9yIG5vaGFzaC8zMmJpdCBjaGFsbGVuZ2UgeW91
IG1lbnRpb25lZD8NCj4gDQo+IEknbSB0cnlpbmcgdG8gcG9zaXRpb24gbXkgbmV4dCBzdGVwOyBp
dCBzZWVtcyBsaWtlIGF0IGxlYXN0IEkgc2hvdWxkIG5vdA0KPiBhZGRpbmcgYW55IG1vcmUgaHVn
ZXBkIGNvZGUsIHRoZW4gc2hvdWxkIEkgZ28gd2l0aCBBUkNIX0hBU19IVUdFUEQgY2hlY2tzLA0K
PiBvciB5b3UncmUgZ29pbmcgdG8gaGF2ZSBhbiBSRkMgc29vbiB0aGVuIEkgY2FuIGJhc2Ugb24g
dG9wPw0KDQpEZXBlbmRzIG9uIHdoYXQgeW91IGV4cGVjdCBieSAic29vbiIuDQoNCkkgc3VyZSB3
b24ndCBiZSBhYmxlIHRvIHNlbmQgYW55IFJGQyBiZWZvcmUgZW5kIG9mIEFwcmlsLg0KDQpTaG91
bGQgYmUgcG9zc2libGUgdG8gaGF2ZSBzb21ldGhpbmcgZHVyaW5nIE1heS4NCg0KQ2hyaXN0b3Bo
ZQ0K
