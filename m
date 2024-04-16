Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDFD8A693E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 12:59:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EMRbsynZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJgzJ2cBHz3vb6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 20:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EMRbsynZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJgyX1Y6yz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 20:58:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4xoDCeC4xnurDUZWJxQeX3sUbTwU03oXIchTpW7RLsg2jXeJoHxWPc1HLceNtTri1BK5/uZZK2RrSpGqeIBNIP4QHm2qAkiRfDxalX8EePemxga++TAvU8/dmipbUbDgRiPVhSIPCT+/LfZ+3Ud21XaPoGIOv/9mEDPM7rJlurV0YMFNstjsQLMlP6udQXgphjKM78va4BYZjhvAf8/NeVuk6ygUz66MyvySDU6nsuYarYur6th6BjouU2NHyNvNqjuvJ7pOWq1SXvk4h/W8kqPqKNRVXoEGemFy5SRy49Nd24t0tes3dzYwIN+Ad+ly2nQPg+oWl3+nqvlOpEc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIIK2hm6/at8UQTIqPt8dykHLwZVB4iYlfbJ3y7o+Vs=;
 b=Nhu1u2q1jpof26k0Irr1tCKLaYd1vzBL2PC/AoSdnuqoqnHbiH4a0zYqD62mMlAD+L9qxu7VjvIJ9waNRS7CrK/vcfd0R5n+96D2mnkFJV8kb/k+ZJ2uKPGc9DqBU0Euy0e6ulco0840zdwH82WEFk5O+4s4imV/ipUQhSGgB/+qmNLHoqtD7+19Uw5zkCoLw5XycDjoU4K21Tk78JzeQMxcvUlUYBiqMrCSQ7uCX23LTneK942g8kxMAlwga+7PTvl6CL9SsyxZlG9UKtKs/GGINeYeqpYunZX/aoAMzseU05tOMNk+TO8kPQrgqyLOMqoU3PJdz1ONGQ1Ru9YKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIIK2hm6/at8UQTIqPt8dykHLwZVB4iYlfbJ3y7o+Vs=;
 b=EMRbsynZpiBOOmmFcNWLYTVsJ8J/j77Tc+367kPnM3ZhXPS70au0bALLE/GMwbudDva3yxf9u9myFdmEQBz+efTu1zwjGsjxUUV3YsB0OqEQv+D74mruV97Kb/sHgCCVfzdoXUV7FWAJNkn4Rjq3mYShIZ/aXWNXrNuFbLtIAad4aGdFhRZxLO/pPP0oie/cbsq9xMqd2mKuUmrox11V1q/9ICQrzHp/FyW59wmh/ezd4lt1CpZxhTXJrWO42zHlt7X+FA1E44VGPrL+G8CWpN3sgvMLuqsIPjx8X06dRVfGROfG/iHNpn1AroPkUD+0FyuJM1BTj5dCI+hpHJXrjw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:58:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 10:58:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Topic: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Index:  AQHafsSU45Ki1FdCPEivNpHUmuU++LFIqD8AgBqxMACAAW6xAIAABmgAgAUFpQCAAQhTgA==
Date: Tue, 16 Apr 2024 10:58:33 +0000
Message-ID: <8f7d4343-6bfd-4c1c-aeaf-350abde770ca@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com> <ZhgMqF7SNaISrYMJ@x1n>
 <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu> <ZhlFokakZo3c90C6@x1n>
 <d3a4c5a6-0fd6-4518-a76b-04dcf2ea2f2c@csgroup.eu>
In-Reply-To: <d3a4c5a6-0fd6-4518-a76b-04dcf2ea2f2c@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3183:EE_
x-ms-office365-filtering-correlation-id: a1f2a7f3-7b91-4715-6811-08dc5e04288e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8ovjirGulhjsei4SF9xMCrhuZdEyMErvClqLjNLjEH04dnUQgcNHBrOuPDVM6XV0EcTXii/VCuc0MpHUzNW4DYRwCPRoKtZyTTN9D9Tk+uzHnR/uauv9L1EgHXFeVXyNg3+Vs2O042YGMWrrKZeshWicN+FzxGFB68kMxanSKCBCcn1zmLHaRDjXUyKEz2fDIe7crYS3XFY7C14aL1jw+evulQmsRQgaGbeQYR1GTC9LUORRv6ikOZzUmJ9GZSBdh2O+PJKCIMpfCZzSQj+rRdpf1PCRCeYa47Vw8zT6N3aDii/oxSsrJiok2q2cjC4EV5gNSa3LnE1a4Iflh4hw7Oso5AytdUZLfvF1uATlvPnE7XdYcaefnRaV+IZ+eZC/WiNmTWJd+3HriK2ZfTqBaEfmQj7wy3CQLr2qSTL1hHw48M9tVL1Yr/djdHijvxAfkTAWvcqDQKLVVSZpFbWzE4m9X/is8qdudvdPeNF6KOyPSOEWEyosWI6u49p4zZIYnHakgZ88qm6FRnGDANlro0Ssg9R1BvhhRNmhgbsSyIDMK5rByyk4pFn08SJErrAMet521y4Q6Vu1IjxWvE0KYO5AwVwCwprvmfEJTfaKDnM4RrPGi89/DFnSgkL3ucAbLMyZjBA8M7R0MmcZHBC178mOTH/k27Fv0xc2DsL2p4e9jK4a5x/mudAFvnMxV+w1eX4Qvd1XoahyMhb++Oc/EaG71+ngFgKcqtHmJK2GCBI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SjdvU1dlL0lTbEsrbEFLVHpXSXA4VnNSSXk4NFhsWHgxTWRQT3VrL0tCaXFh?=
 =?utf-8?B?SGo0Nis3a3prUU05d1pSbjhZUXl2VnUrK2VJU0NiNXQremgxSHh2SXFTU3A3?=
 =?utf-8?B?MHkrYmVDM0Y4QU54Q3dWR05JbURVakE4Ull3Ny9Ka0V6cXFZcEJmelkrTUky?=
 =?utf-8?B?b0lCdi9HNUViZnhYTGZsV0p4bmxKRGpZeFJNd1V5cTgxaUszL1o4V2gzU1JT?=
 =?utf-8?B?S2xKSWZwOS9TdS92ZjdPUld5TGNjdTAzYVpSR21hMWNhQWpjVTJZN205bEJ1?=
 =?utf-8?B?THpxQzArSytvdlhhZG1BWjQzTlNTQ1RUbUhyaGwwMVA2RXdRRXh0NzMvcXZP?=
 =?utf-8?B?YlVLWWdZUmw0Q0tFMHJUeWZ4ZTlsd3FWanRmSFRYT0hPdXgwUWZnSjlGb21k?=
 =?utf-8?B?YlJnU2F0KytpeSsrWlc2ZkViQTVHNlZUNEIxY3YzSjZ4SFpzK20yc2ZhYXh2?=
 =?utf-8?B?a3U2RUtoSDN6TDE1cUNEOVBURmxUbWx4bEZkVXIrWXFmUm5iaTVoVURZWG1s?=
 =?utf-8?B?b2xkVG1kOVV1WjZNUWpocWF4SVlaWXllcHlYemNIRmxRT2E5MzRna2E2SWFx?=
 =?utf-8?B?OU9EeEJ4MXQ0Tm45T2ZaZk5LTHhtQkVtM3haaUlSbnB2UUE5WEp2WjV4dmc4?=
 =?utf-8?B?TUl1Nmg3d2lLRytQZGt0cjlMM0t2c1JZbS9ZblNtWkFrMmFwc1Q5aDdFZjV2?=
 =?utf-8?B?VzlNck1tajhjalUvUS9LQzFiM29xcHFDeTQ3aFVaTG1Jb01HUWo0dlVrcUZQ?=
 =?utf-8?B?SHdvTmd3TWhraUc2dFZnSUVvcGNpYjBXSDRFM1lMWXRSVzFCamtlMWc2NFgv?=
 =?utf-8?B?UDdrRml5YlZYNmhaSXE2V1U2OUhIS29WS0dBYjBwaWNaR1ZDTVVqZEdVYjNT?=
 =?utf-8?B?STdIL1hrNFlnTklQeFdqTC83bmptY3V1aU1xRGt1TmtCTVNZQ3hRUUlibEVD?=
 =?utf-8?B?MjV0bTFWNUtGWjlqWEpRSWlRYzBQTVpydkkzZDZ4bVBDeGkzTFFnN0ZjVUpL?=
 =?utf-8?B?a0JtZ2hoRm91UFlGWlNBSXQ1SUhUbDBmRFJaYlg3U3UvbFFVWWIrL0F5ZnYr?=
 =?utf-8?B?eWFGTExRdnZwNkpScEMyT1VXWXdxTkxhM0gvYmtNbTNZNENPRW9ObTJLRlRH?=
 =?utf-8?B?TlBGVEpYcytNbGR6cUowNm1VQUhSY1E1U0w0ZHh0VThSMU4zcWk5M25qQXBS?=
 =?utf-8?B?MzQwK0xFVGFrbFk4a3RqUmxiaDBoTkpuRTVmS085K0s1ZllFczE0dmFZcTJH?=
 =?utf-8?B?QSsvQjVXM1laajljR0kwYnF0S1k1ZElnZjV3RENHdkZ6bHQ5aU9pOFBodjVz?=
 =?utf-8?B?N0ZQSk45bWdTUGgxSTRCSlNUWStBN1RJZVBRNFhkb3R2VnhsYjlmLzAxdVV1?=
 =?utf-8?B?Ly9mODE4M3RvNCtoTC84ZVVXdHF3NUl1K3laTnczdzZXQ2xpTFR1cE9HNzdW?=
 =?utf-8?B?ZWdmSW40WUFxUTZROUY3dkVtSTZNV0hqcVdseVlRMGJ2dm85aE01Rm9Xa3M4?=
 =?utf-8?B?RDVZd3VpTjBjQ1Y1UU5QU2xtQ2FIR3Exb0JhMFQ3U203ZDF4Y1o3RGs4MUl0?=
 =?utf-8?B?WkcxZjEzcm5OT3hWK1FiaFpyNEYyK0l2Z09ybVRFM1pMZk9YWDVWVktreGVr?=
 =?utf-8?B?TUptN2FTU2VSVlJOTkZkT3o3NllsQ2x4Mm4yV3NLV0pQbms0WHBrNmJIeFRL?=
 =?utf-8?B?Z0pDZHlaNktrbGVzTWdvRkp2Q3RibUkxcS9qNmVzK2hrWVVGQXNxdkZNTHZF?=
 =?utf-8?B?NDRGL0tqY3kzZlVHWm93SnE5MituNmxNakVDaVhUSkgzQkdBOWp3Tk50dlJ2?=
 =?utf-8?B?eGN3ZmM1RmdZb2dMUHdJcmVhb21kdy9OZ2NlL0JVR3AwWW9oZzlYMmx6Y1px?=
 =?utf-8?B?bTh0czNIZCtjUWZtYjVoQXpOQnAyMS9pK2xUd3cxamlTQ3N1Y2hvSFByWHcw?=
 =?utf-8?B?eXh2Si9EU1o3OGg1bHpDazFodGluTXU5bkRxSTRDUU9VVFVaem15NnJLQlpa?=
 =?utf-8?B?T3RHblVOSkl4NjgvUSsxN3MrR00yeFRwZEN0WVlXNWtZbjlQK1lESEVqa3dV?=
 =?utf-8?B?MUpyM1JPWDM0WHIva3JLWTFBaUJUNUozOTBkSjIrUTZHUXBBTmZOcXNKQU0w?=
 =?utf-8?Q?aoQJ4eblh81Ba4D/EqU+p/8jp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6BC13A67ACF634D9E31B7A813F8D6D6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f2a7f3-7b91-4715-6811-08dc5e04288e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 10:58:33.2583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxzegtJZcdkn96iIqsC0aRZTIuvZboPCu6Gua3z06pTISikBmbWdYfpIGtexCp9DwI/DpkxcZnNw6kYWcC57OoN6+9V/mNxY6A2xSz5HCQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3183
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA0LzIwMjQgw6AgMjE6MTIsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxMi8wNC8yMDI0IMOgIDE2OjMwLCBQZXRlciBYdSBhIMOpY3JpdMKgOg0K
Pj4gT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMDI6MDg6MDNQTSArMDAwMCwgQ2hyaXN0b3BoZSBM
ZXJveSB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gTGUgMTEvMDQvMjAyNCDDoCAxODoxNSwgUGV0ZXIg
WHUgYSDDqWNyaXTCoDoNCj4+Pj4gT24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMDE6Mzg6NDBQTSAt
MDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBNYXIgMjUsIDIwMjQg
YXQgMDM6NTU6NTNQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4+PiBUaGlz
IHNlcmllcyByZWltcGxlbWVudHMgaHVnZXBhZ2VzIHdpdGggaHVnZXBkIG9uIHBvd2VycGMgOHh4
Lg0KPj4+Pj4+DQo+Pj4+Pj4gVW5saWtlIG1vc3QgYXJjaGl0ZWN0dXJlcywgcG93ZXJwYyA4eHgg
SFcgcmVxdWlyZXMgYSB0d28tbGV2ZWwNCj4+Pj4+PiBwYWdldGFibGUgdG9wb2xvZ3kgZm9yIGFs
bCBwYWdlIHNpemVzLiBTbyBhIGxlYWYgUE1ELWNvbnRpZyBhcHByb2FjaA0KPj4+Pj4+IGlzIG5v
dCBmZWFzaWJsZSBhcyBzdWNoLg0KPj4+Pj4+DQo+Pj4+Pj4gUG9zc2libGUgc2l6ZXMgYXJlIDRr
LCAxNmssIDUxMmsgYW5kIDhNLg0KPj4+Pj4+DQo+Pj4+Pj4gRmlyc3QgbGV2ZWwgKFBHRC9QTUQp
IGNvdmVycyA0TSBwZXIgZW50cnkuIEZvciA4TSBwYWdlcywgdHdvIFBNRCANCj4+Pj4+PiBlbnRy
aWVzDQo+Pj4+Pj4gbXVzdCBwb2ludCB0byBhIHNpbmdsZSBlbnRyeSBsZXZlbC0yIHBhZ2UgdGFi
bGUuIFVudGlsIG5vdyB0aGF0IHdhcw0KPj4+Pj4+IGRvbmUgdXNpbmcgaHVnZXBkLiBUaGlzIHNl
cmllcyBjaGFuZ2VzIGl0IHRvIHVzZSBzdGFuZGFyZCBwYWdlIHRhYmxlcw0KPj4+Pj4+IHdoZXJl
IHRoZSBlbnRyeSBpcyByZXBsaWNhdGVkIDEwMjQgdGltZXMgb24gZWFjaCBvZiB0aGUgdHdvIA0K
Pj4+Pj4+IHBhZ2V0YWJsZXMNCj4+Pj4+PiByZWZlcmVkIGJ5IHRoZSB0d28gYXNzb2NpYXRlZCBQ
TUQgZW50cmllcyBmb3IgdGhhdCA4TSBwYWdlLg0KPj4+Pj4+DQo+Pj4+Pj4gQXQgdGhlIG1vbWVu
dCBpdCBoYXMgdG8gbG9vayBpbnRvIGVhY2ggaGVscGVyIHRvIGtub3cgaWYgdGhlDQo+Pj4+Pj4g
aHVnZXBhZ2UgcHRlcCBpcyBhIFBURSBvciBhIFBNRCBpbiBvcmRlciB0byBrbm93IGl0IGlzIGEg
OE0gcGFnZSBvcg0KPj4+Pj4+IGEgbG93ZXIgc2l6ZS4gSSBob3BlIHRoaXMgY2FuIG1lIGhhbmRs
ZWQgYnkgY29yZS1tbSBpbiB0aGUgZnV0dXJlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUgYXJlIHBy
b2JhYmx5IHNldmVyYWwgd2F5cyB0byBpbXBsZW1lbnQgc3R1ZmYsIHNvIGZlZWRiYWNrIGlzDQo+
Pj4+Pj4gdmVyeSB3ZWxjb21lLg0KPj4+Pj4NCj4+Pj4+IEkgdGhvdWdodCBpdCBsb29rcyBwcmV0
dHkgZ29vZCENCj4+Pj4NCj4+Pj4gSSBzZWNvbmQgaXQuDQo+Pj4+DQo+Pj4+IEkgc2F3IHRoZSBk
aXNjdXNzaW9ucyBpbiBwYXRjaCAxLsKgIENocmlzdG9waGUsIEkgc3VwcG9zZSB5b3UncmUgDQo+
Pj4+IGV4cGxvcmluZw0KPj4+PiB0aGUgYmlnIGhhbW1lciBvdmVyIGh1Z2VwZCwgYW5kIHBlcmhh
cHMgd2VudCBhbHJlYWR5IHdpdGggdGhlIDMyYml0IHBtZA0KPj4+PiBzb2x1dGlvbiBmb3Igbm9o
YXNoLzMyYml0IGNoYWxsZW5nZSB5b3UgbWVudGlvbmVkPw0KPj4+Pg0KPj4+PiBJJ20gdHJ5aW5n
IHRvIHBvc2l0aW9uIG15IG5leHQgc3RlcDsgaXQgc2VlbXMgbGlrZSBhdCBsZWFzdCBJIHNob3Vs
ZCANCj4+Pj4gbm90DQo+Pj4+IGFkZGluZyBhbnkgbW9yZSBodWdlcGQgY29kZSwgdGhlbiBzaG91
bGQgSSBnbyB3aXRoIEFSQ0hfSEFTX0hVR0VQRCANCj4+Pj4gY2hlY2tzLA0KPj4+PiBvciB5b3Un
cmUgZ29pbmcgdG8gaGF2ZSBhbiBSRkMgc29vbiB0aGVuIEkgY2FuIGJhc2Ugb24gdG9wPw0KPj4+
DQo+Pj4gRGVwZW5kcyBvbiB3aGF0IHlvdSBleHBlY3QgYnkgInNvb24iLg0KPj4+DQo+Pj4gSSBz
dXJlIHdvbid0IGJlIGFibGUgdG8gc2VuZCBhbnkgUkZDIGJlZm9yZSBlbmQgb2YgQXByaWwuDQo+
Pj4NCj4+PiBTaG91bGQgYmUgcG9zc2libGUgdG8gaGF2ZSBzb21ldGhpbmcgZHVyaW5nIE1heS4N
Cj4+DQo+PiBUaGF0J3MgZ29vZCBlbm91Z2gsIHRoYW5rcy7CoCBJJ2xsIHNlZSB3aGF0IGlzIHRo
ZSBiZXN0IEkgY2FuIGRvLg0KPj4NCj4+IFRoZW4gZG8geW91IHRoaW5rIEkgY2FuIGxlYXZlIHA0
ZC9wZ2QgbGVhdmVzIGFsb25lP8KgIFBsZWFzZSBjaGVjayB0aGUgDQo+PiBvdGhlcg0KPj4gZW1h
aWwgd2hlcmUgSSdtIG5vdCBzdXJlIHdoZXRoZXIgcGdkIGxlYXZlcyBldmVyIGV4aXN0ZWQgZm9y
IGFueSBvZg0KPj4gUG93ZXJQQy7CoCBUaGF0J3Mgc28gZmFyIHdoYXQgSSBwbGFuIHRvIGRvLCBv
biB0ZWFjaGluZyBwZ3RhYmxlIHdhbGtlcnMNCj4+IHJlY29nbml6ZSBwdWQgYW5kIGxvd2VyIGZv
ciBhbGwgbGVhdmVzLsKgIFRoZW4gaWYgUG93ZXIgY2FuIHN3aXRjaCBmcm9tDQo+PiBodWdlcGQg
dG8gdGhpcyBpdCBzaG91bGQganVzdCB3b3JrLg0KPiANCj4gV2VsbCwgaWYgSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSwgc29tZXRoaW5nIHdpdGggbm8gUE1EIHdpbGwgaW5jbHVkZSANCj4gPGFzbS1n
ZW5lcmljL3BndGFibGUtbm9wbWQuaD4gYW5kIHdpbGwgdGhlcmVmb3JlIG9ubHkgaGF2ZSAuLi4u
IHBtZCANCj4gZW50cmllcyAoaGVuY2Ugbm8gcGdkL3A0ZC9wdWQgZW50cmllcykuIExvb2tzIG9k
ZCBidXQgdGhhdCdzIHdoYXQgaXQgaXMuIA0KPiBwZ2RfcG9wdWxhdGUoKSwgcDRkX3BvcHVsYXRl
KCksIHB1ZF9wb3B1bGF0ZSgpIGFyZSBhbGwgImRvIHsgfSB3aGlsZSANCj4gKDApIiBhbmQgb25s
eSBwbWRfcG9wdWxhdGUgZXhpc3RzLiBTbyBvbmx5IHBtZF9sZWFmKCkgd2lsbCBleGlzdCBpbiB0
aGF0IA0KPiBjYXNlLg0KPiANCj4gQW5kIHRoZXJlZm9yZSBpbmNsdWRpbmcgPGFzbS1nZW5lcmlj
L3BndGFibGUtbm9wNGQuaD4gbWVhbnMgLi4uLiB5b3UgDQo+IGhhdmUgcDRkIGVudHJpZXMuIERv
ZXNuJ3QgbWVhbiB5b3UgaGF2ZSBwNGRfbGVhZigpIGJ1dCB0aGF0IG5lZWRzIHRvIGJlIA0KPiBj
aGVja2VkLg0KPiANCj4gDQo+Pg0KPj4gRXZlbiBpZiBwZ2QgZXhpc3RzICh0aGVuIHNvbWV0aGlu
ZyBJIG92ZXJsb29rZWQuLiksIEknbSB3b25kZXJpbmcgd2hldGhlcg0KPj4gd2UgY2FuIHB1c2gg
dGhhdCBkb3dud2FyZHMgdG8gYmUgZWl0aGVyIHB1ZC9wbWQgKGFuZCBsb29rcyBsaWtlIHdlIGFs
bA0KPj4gYWdyZWUgcDRkIGlzIG5ldmVyIHVzZWQgb24gUG93ZXIpLsKgIFRoYXQgbWF5IGludm9s
dmUgc29tZSBwZ3RhYmxlDQo+PiBvcGVyYXRpb25zIG1vdmluZyBmcm9tIHBnZCBsZXZlbCB0byBs
b3dlciwgZS5nLiBteSBwdXJlIGltYWdpbmF0aW9uIHdvdWxkDQo+PiBsb29rIGxpa2Ugc3RhcnRp
bmcgd2l0aDoNCj4gDQo+IFllcyBJIHRoaW5rIHRoZXJlIGlzIG5vIGRvdWJ0IHRoYXQgcDRkIGlz
IG5ldmVyIHVzZWQ6DQo+IA0KPiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3Bn
dGFibGUuaDojaW5jbHVkZSANCj4gPGFzbS1nZW5lcmljL3BndGFibGUtbm9wbWQuaD4NCj4gYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmg6I2luY2x1ZGUgDQo+IDxh
c20tZ2VuZXJpYy9wZ3RhYmxlLW5vcDRkLmg+DQo+IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9u
b2hhc2gvMzIvcGd0YWJsZS5oOiNpbmNsdWRlIA0KPiA8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3Bt
ZC5oPg0KPiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUtNGsuaDoj
aW5jbHVkZSANCj4gPGFzbS1nZW5lcmljL3BndGFibGUtbm9wNGQuaD4NCj4gDQo+IEJ1dCB0aGF0
IG1lYW5zIHRoYXQgUFBDMzIgaGF2ZSBwbWQgZW50cmllcyBhbmQgUFBDNjQgaGF2ZSBwNGQgZW50
cmllcyAuLi4NCj4gDQo+Pg0KPj4gI2RlZmluZSBQVEVfSU5ERVhfU0laRcKgwqDCoCBQVEVfU0hJ
RlQNCj4+ICNkZWZpbmUgUE1EX0lOREVYX1NJWkXCoMKgwqAgMA0KPj4gI2RlZmluZSBQVURfSU5E
RVhfU0laRcKgwqDCoCAwDQo+PiAjZGVmaW5lIFBHRF9JTkRFWF9TSVpFwqDCoMKgICgzMiAtIFBH
RElSX1NISUZUKQ0KPj4NCj4+IFRvOg0KPj4NCj4+ICNkZWZpbmUgUFRFX0lOREVYX1NJWkXCoMKg
wqAgUFRFX1NISUZUDQo+PiAjZGVmaW5lIFBNRF9JTkRFWF9TSVpFwqDCoMKgICgzMiAtIFBNRF9T
SElGVCkNCj4+ICNkZWZpbmUgUFVEX0lOREVYX1NJWkXCoMKgwqAgMA0KPj4gI2RlZmluZSBQR0Rf
SU5ERVhfU0laRcKgwqDCoCAwDQo+IA0KPiBCdXQgdGhlbiB5b3UgY2FuJ3QgYW55bW9yZSBoYXZl
ICNkZWZpbmUgUFRSU19QRVJfUE1EIDEgZnJvbSANCj4gPGFzbS1nZW5lcmljL3BndGFibGUtbm9w
NGQuaD4NCj4gDQo+Pg0KPj4gQW5kIHRoZSByZXN0IHdpbGwgbmVlZCBjYXJlIHRvby7CoCBJIGhv
cGUgbW92aW5nIGRvd253YXJkIGlzIGVhc2llcg0KPj4gKGUuZy4gdGhlIHdhbGtlciBzaG91bGQg
YWx3YXlzIGV4aXN0IGZvciBsb3dlciBsZXZlbHMgYnV0IG5vdCBhbHdheXMgZm9yDQo+PiBoaWdo
ZXIgbGV2ZWxzKSwgYnV0IEkgYWN0dWFsbHkgaGF2ZSBsaXR0bGUgaWRlYSBvbiB3aGV0aGVyIHRo
ZXJlJ3MgYW55DQo+PiBvdGhlciBpbXBsaWNhdGlvbnMsIHNvIHBsZWFzZSBiYXJlIHdpdGggbWUg
b24gc3R1cGlkIG1pc3Rha2VzLg0KPj4NCj4+IEkganVzdCBob3BlIHBnZCBsZWF2ZXMgZG9uJ3Qg
ZXhpc3QgYWxyZWFkeSwgdGhlbiBJIHRoaW5rIGl0J2xsIGJlIA0KPj4gc2ltcGxlci4NCj4+DQo+
PiBUaGFua3MsDQo+Pg0KDQpEaWdnaW5nIGludG8gYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5o
LCBJIHNlZSBhIGRlZmluaXRpb24gb2YgDQpwdWRfbGVhZigpIGFsd2F5cyByZXR1cm5pbmcgMCwg
aW50cm9kdWNlZCBieSBjb21taXQgMmM4YTgxZGMwY2M1IA0KKCJyaXNjdi9tbTogZml4IHR3byBw
YWdlIHRhYmxlIGNoZWNrIHJlbGF0ZWQgaXNzdWVzIikNCg0KU28gc2hvdWxkIGFzbS1nZW5lcmlj
L3BndGFibGUtbm9wdWQuaCBjb250YWluIHRoZSBzYW1lIGZvciBwNGRfbGVhZigpIA0KYW5kIGFz
bS1nZW5lcmljL3BndGFibGUtbm9wNGQuaCBjb250YWluIHRoZSBzYW1lIGZvciBwZ2RfbGVhZigp
ID8NCg0KQ2hyaXN0b3BoZQ0K
