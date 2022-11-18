Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E762F01D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 09:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND9Xc5r22z3dxG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 19:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=degy/qK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=degy/qK/;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ND9Wb4xy2z3bj0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 19:51:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNqkq7rLgKDiaHwNWFy7npPDpYblDNFK8fEpa5l1lukM1pZ66gzsLNZy9Vf1KEF8nQfXBtsDTHBI1QKX5780UXrTBQvoywhSrkx47ITA641OInHF6ixyOsM23+N7+pov+P/dcW/1PJud4K5we7uncSSIOAaiOijyBF6i6lqAjLSqtsb3y7ZM4LtXxBJNGnNXz3Bh2573ES2EHZXGk5vi+R3naycTGXPiEPWLCtDMjvfFRBQftSzqwfHqzbGlelgDBYSwJTxdzqNYXzWMPjBIFUIpYyEvDjfRRPPDJbIpkw0kO+lDEN9Sqkrhu1Dpq6pDX7jqrF3JxrjA5uWr6ZKegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGn8uhaQtbUVc497XEt+CBFgfyNLq7KojGVa/kwpLjM=;
 b=Nl6rxkRY0etm7fkMhHNkmiaVG4tcfRZAHiQAqONsAOQpI34hgpuQzz1z5Zmn2zwS9zzW164JvWCEurZ666xWpPvslOGyegEs8+0RIkZdQFDv695gD9ZlzdHE6h1YUXcQYJIhQn89l5L9/eyXPEYvc7O29gQ3DVeONwI8lE/pPFXuFm6D6e9itJckEg34rCeygQYCvM4c3+66v8ZQK+fhT27f5GHQMgwM+AQXh4hRY2bDk+0y2GUPv6PyDCX6QVG+TUIfoS7OnnkA+ta68PrWY1dQjH3A/7HVQWcWt5MGbxPsZZo3oSO3cR1OD240zFA7YWhxaBh80V0INK6VMSALyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGn8uhaQtbUVc497XEt+CBFgfyNLq7KojGVa/kwpLjM=;
 b=degy/qK/0YJsYfGf6Zu2wzxuL2sUgThoidmKEnDPmEwOt45jjS4+9UjwXPm7qPQ6Y3gsUlpDVKGIDALE9QNKWOkruk6VQ85Imxgv6h13PLPWRquehwexG8a0AyDbkaZj8HczOcbngf0Kd2KzWP35KrFKCgfHqWtdojmOPkkibuPanbKG/ymu/dsYfpVWqRhpHOUz9v1UswTm2TyX1mQY3iT73kj5ZDhXqCoZ1jNXVF8M5AjlC4bBlDtiqxH7rR/aj4/7Ouu1CDExWKA0sA3tKZtL/17K2dYjUKbukV6pMymxuSVeRfhX2oCbKAv3z4yDjlj3RK8HTzx7u2aREVxNtA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1782.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 08:51:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 08:51:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index:  AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcAgATvboCAACzCgIABp7yAgAF1qQCAAOn5gIABrkOAgAADd4A=
Date: Fri, 18 Nov 2022 08:51:31 +0000
Message-ID: <c651bd44-d0ca-e3cf-0639-6b42b33f4666@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
 <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu>
 <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
 <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
 <02496f7a-51d8-4fc0-161d-b29d5e657089@csgroup.eu>
 <9d5c390a-31db-4f93-203d-281b0831d37f@linux.ibm.com>
In-Reply-To: <9d5c390a-31db-4f93-203d-281b0831d37f@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1782:EE_
x-ms-office365-filtering-correlation-id: 45184633-8295-4d66-9246-08dac94216e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0Tti3vuNBvjNYAz+DGwV75SnivrQaSXjBCQt1dgfZG8ZfHL5FbBjfVUpL41xdzU2S4MJV71Z1RbkNlTeTej1tzkRhxD+OsMlaN9BLPVyG6xdLoR6Muk/NCbFcFuLUSxgV8L3KJ8AKgqPXUDnJNwV4Hf8el5tl0PxTdf7aoRkkpBSsa+0MdQO7NS3xVAC9A4MP279YUPsfupGXAv21r9eOWBdkr1bPZaUvACzObCL0Qha3r9/AQZxTey2bL5sdcwWO350BKSSSxRXmmQ2yOm5PSWQDBRADEyQvEwWkjO9cyn/QUiknMdOVpvVsKVU3DzlomGrl5nKlVJBKPdT1ff4Lsun2VpXP3WS/WhhHtoxpAUTXxvAYVZbtrxk+yitHKp/Hc0C8Le99FIUXVWSzQ3ZAOhpEIk7F5OlyPUlTP1mghA1xZG3Oh59vU1NagUeG00VUHmsCm8eVDsqzwu+PBzSV0Lve2flTdrxv54+b3w0iXX5oRTwwd19PFnPmeGiMW+zs5kiyl/kjLlXpmRGBzrRrS5sn1dgKKwz5WSPDReKLtO8tFf0r1pQJNGgwkYrUI8BfGISNhUPcDNVZIgh9m+0r6jaOVrj2y0D6OWhQ0F1lG/jT/LwZqkndhFsLcf7CpPWQuSDmQIwStaW1oPY7+m/P4yWEuBC9T6qKO+1cGukvZGpcUaKDiVJNoSHZsia5f/HRa4l0MdVWPrn5QPtPZ2THjnxKVFhsVUQM2E7xpzGIfaHSORTftQ9XkhEnxDkIjdYSC1EJ4fXIWAAQ/x4hbtAIA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39850400004)(366004)(136003)(376002)(451199015)(54906003)(53546011)(110136005)(316002)(31686004)(26005)(4326008)(64756008)(8676002)(6512007)(478600001)(6486002)(91956017)(66946007)(66556008)(6506007)(71200400001)(66446008)(76116006)(66476007)(186003)(5660300002)(66574015)(41300700001)(8936002)(2616005)(44832011)(36756003)(2906002)(83380400001)(38100700002)(38070700005)(31696002)(86362001)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NXJZdHU3OFoyMWpSdFEzK3FUTVZUVTZpeVVVTml3SkdrSkFJeEFwdHA1Rk1G?=
 =?utf-8?B?TGhwNWUzNlczN0hNNklGQncySFRaZ0ltOHpjVzdpeE5lUmx5VVMyY0E3RVlh?=
 =?utf-8?B?ZjZUTXN2eTA3bWF1Qkp5RU5scXJoZng1ZlUxSVRhS2E1MDJYTk1vUkQydmJr?=
 =?utf-8?B?WThFNXh2a3pwakxSZ3crYTBob2ZXYkRzVkJ3T2x2eDFmUC9VdHViTE5FbllE?=
 =?utf-8?B?eVh5RkVzWERXZE5HMUx1SmE0c3dwYThlNXdMWmZmMHRJc0FVNFlvNjJQQ2Vx?=
 =?utf-8?B?SzBqazIwNTNGOC9VakJhb1ZPVU13UWVDZzY0VzlCdFpjMUdjemZNMnBnckZQ?=
 =?utf-8?B?dmhheDhjOEx5Tll5RktKTVpDYmk3Y0NsaEV2czFCbmJLRzlsL0Z3TWo0UFR1?=
 =?utf-8?B?cHNyOUpKL1pweHZtV1ZOMjJqa1BQZ3h0MWxOaldFM1NmWlNhWHB4TkxhME9x?=
 =?utf-8?B?WjJwNEJib2ZhZ295K0NOakkybExsYTYyREhpc012bVlMcHlrU2xKVzBjMkFn?=
 =?utf-8?B?QzVJYk9tNzZhaDZTZ0F5bVBlL0M1czVVWTN5R3BaZVk4WFp6ZnB1L3VQRTI0?=
 =?utf-8?B?WDJib21hekRhSzJjeGM5UDZodk5wZ0NTZVpsQit0NGpnWWNDdVFVRVQwVW5N?=
 =?utf-8?B?WGxnMElCSDFnSVhpc2UrVDMrR0JiYng4SENkbDV4RG9oYm5mZGV0ZmRGdHdX?=
 =?utf-8?B?b0VJQjZ6QWxWWU1zVkJYZWY5NllsaHp6OUk5Z0p6MTBJQ2FsMUNVanpUT2V6?=
 =?utf-8?B?ZFZCOVp1aExZUFlCaE5pbmorQXBOMm1oRHZzWFVaQUpCSE53WWwweEJmSERW?=
 =?utf-8?B?cEIvR1V2eUpCN3U4QitMTjZibHRIamZIeTZmYlZSblhzV1habTkrd0FEZHpQ?=
 =?utf-8?B?ZkQwWjdUWUQya21HNmhRZzJTVVcwWGZlU1FYSU5xSG92bFgxanc3OU53TCtp?=
 =?utf-8?B?S1hPTG9OdzNIRmlIZ0NrZzdCMnhCWVNOVUc2YmdtNkdzT2ZQVFkwVUJRT0ov?=
 =?utf-8?B?RE5BMmdqV0RWNmFYaHJCZ1Bwa01Fa3k0b1B4RWNtTTNSQjV1K0p5bzZOQlAv?=
 =?utf-8?B?TDRJMWNOM1dzM2dGY1pURStoTzZGcDV4YktBamNBMHV5U1Y1V1N1TTNKT05L?=
 =?utf-8?B?K0FFTG43ZUN1TGRTTkdtOG1tWmRST2xCdHM3ak16bm1LZUNJWkVkTmVsWXRn?=
 =?utf-8?B?Y2RZM0NiQVduWi8zS2YwZjViRE54R0F2VHZUWklFZURHb1RWanBjVXJEbW9j?=
 =?utf-8?B?aG41cUFKcnBPb1NrVEJvdVNCQ2wyRFVhemNmaDFFR2FEREFnVkFFelIzSkp4?=
 =?utf-8?B?dnJGWlI1dkwzUDZ3UmZiSWhjL3dLTXR0ZVJBU000SzltUzQ3ZmhkcGpFSitn?=
 =?utf-8?B?bmRqYWYzakZmUVk4SldkM0g1RTMvVFdTWjQvZ1UxaHRVbkVmMTJVSVlHcElW?=
 =?utf-8?B?dFNjV2VmZkZpbm0xWlZLZGhEZHZQZDZYaUhhOUFud250R09GM2NnbElGYmY2?=
 =?utf-8?B?TWhzNUZ0blFiSW1vbFBNU3dmaDN6QzB5aUVMbmN5T0ZoaTJtdnZBRHA5bG5M?=
 =?utf-8?B?d3YvTFRmU1RDQkI4L1hTQXYvTWIvb2pwd1JvaG43ZG84NnZWbVZhcXN4MlRm?=
 =?utf-8?B?cTFhT2lQMVFMV3k4YzlsMFIyNXY4Q0laVGtsRzNDMEVST2VkUDJlSWorUkZP?=
 =?utf-8?B?VVFEMUYxNDRNSGdWcUtDWFoycDNsYmFPU0Y4MWdyM3k2R0FLbVlaV2ZsQmhj?=
 =?utf-8?B?UzB1dnkzRTVRcVljbmRCem5xR21pUGY5c0duYXNOQXFKWS9tRGxVYUl5Sng3?=
 =?utf-8?B?c2JHUkRuMDNUa0VNNHA4VmdqVWFFUEtHZDk0UG5NSGMrdGM1NHZBQTJCYnBu?=
 =?utf-8?B?czdTZ2hYNXZzZUFMazBSQnlPblBPNTZXLy9vc2pjVXpTcG5qWTB1VncxNjdj?=
 =?utf-8?B?SFZHNWVKVFlIdVhKMFBxbUNXaXZKUXZpTWxSdUFPVkNGSjFPdzdxSHNRckpJ?=
 =?utf-8?B?TkhRQmpXcU10T056RnRka2Ewc2NseFJBdVAyUUFkMkJOVmZvVmFrZjR1RElz?=
 =?utf-8?B?Y3FpSXNHK1YwbkFyalQzYlFzT001UjV1V1RZSjVvNEhpSGFOQjUvK2JZcFBF?=
 =?utf-8?Q?VEBiSjjoJfVvL1ZQVr1gvQ0kq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B725F86474E2104AAF83FA5EBCDCDCF7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45184633-8295-4d66-9246-08dac94216e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 08:51:31.4850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BegPjIH+KWuSr+ERhpuDka3PtOCqtd8ZBG37wvjEmITD4v7l2erfRsSybG0AsSwnn88Sbxihtf3pLzIg5MrBtFS+HUZQuW4iT3XqwUdsZM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1782
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzExLzIwMjIgw6AgMDk6MzksIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDE3LzExLzIyIDEyOjI5IHBtLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4N
Cj4+DQo+PiBMZSAxNi8xMS8yMDIyIMOgIDE4OjAxLCBIYXJpIEJhdGhpbmkgYSDDqWNyaXTCoDoN
Cj4+Pg0KPj4+DQo+Pj4gT24gMTYvMTEvMjIgMTI6MTQgYW0sIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IExlIDE0LzExLzIwMjIgw6AgMTg6MjcsIENocmlzdG9waGUg
TGVyb3kgYSDDqWNyaXTCoDoNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gTGUgMTQvMTEvMjAyMiDDoCAx
NTo0NywgSGFyaSBCYXRoaW5pIGEgw6ljcml0wqA6DQo+Pj4+Pj4gSGkgQ2hyaXN0b3BoZSwNCj4+
Pj4+Pg0KPj4+Pj4+IE9uIDExLzExLzIyIDQ6NTUgcG0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+Pj4+Pj4+IExlIDEwLzExLzIwMjIgw6AgMTk6NDMsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKg
Og0KPj4+Pj4+Pj4gTW9zdCBCUEYgcHJvZ3JhbXMgYXJlIHNtYWxsLCBidXQgdGhleSBjb25zdW1l
IGEgcGFnZSBlYWNoLiBGb3INCj4+Pj4+Pj4+IHN5c3RlbXMNCj4+Pj4+Pj4+IHdpdGggYnVzeSB0
cmFmZmljIGFuZCBtYW55IEJQRiBwcm9ncmFtcywgdGhpcyBtYXkgYWxzbyBhZGQNCj4+Pj4+Pj4+
IHNpZ25pZmljYW50DQo+Pj4+Pj4+PiBwcmVzc3VyZSBvbiBpbnN0cnVjdGlvbiBUTEIuIEhpZ2gg
aVRMQiBwcmVzc3VyZSB1c3VhbGx5IHNsb3dzIGRvd24NCj4+Pj4+Pj4+IHRoZQ0KPj4+Pj4+Pj4g
d2hvbGUgc3lzdGVtIGNhdXNpbmcgdmlzaWJsZSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Ig
cHJvZHVjdGlvbg0KPj4+Pj4+Pj4gd29ya2xvYWRzLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGJwZl9w
cm9nX3BhY2ssIGEgY3VzdG9taXplZCBhbGxvY2F0b3IgdGhhdCBwYWNrcyBtdWx0aXBsZSBicGYN
Cj4+Pj4+Pj4+IHByb2dyYW1zDQo+Pj4+Pj4+PiBpbnRvIHByZWFsbG9jYXRlZCBtZW1vcnkgY2h1
bmtzLCB3YXMgcHJvcG9zZWQgWzFdIHRvIGFkZHJlc3MgaXQuIA0KPj4+Pj4+Pj4gVGhpcw0KPj4+
Pj4+Pj4gc2VyaWVzIGV4dGVuZHMgdGhpcyBzdXBwb3J0IG9uIHBvd2VycGMuDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gUGF0Y2hlcyAxICYgMiBhZGQgdGhlIGFyY2ggc3BlY2lmaWMgZnVuY3Rpb25zIG5l
ZWRlZCB0byBzdXBwb3J0IA0KPj4+Pj4+Pj4gdGhpcw0KPj4+Pj4+Pj4gZmVhdHVyZS4gUGF0Y2gg
MyBlbmFibGVzIHRoZSBzdXBwb3J0IGZvciBwb3dlcnBjLiBUaGUgbGFzdCBwYXRjaA0KPj4+Pj4+
Pj4gZW5zdXJlcyBjbGVhbnVwIGlzIGhhbmRsZWQgcmFjZWZ1bGx5Lg0KPj4+Pj4+Pj4NCj4+Pj4+
Pg0KPj4+Pj4+Pj4gVGVzdGVkIHRoZSBjaGFuZ2VzIHN1Y2Nlc3NmdWxseSBvbiBhIFBvd2VyVk0u
IHBhdGNoX2luc3RydWN0aW9uKCksDQo+Pj4+Pj4+PiBuZWVkZWQgZm9yIGJwZl9hcmNoX3RleHRf
Y29weSgpLCBpcyBmYWlsaW5nIGZvciBwcGMzMi4gRGVidWdnaW5nIA0KPj4+Pj4+Pj4gaXQuDQo+
Pj4+Pj4+PiBQb3N0aW5nIHRoZSBwYXRjaGVzIGluIHRoZSBtZWFud2hpbGUgZm9yIGZlZWRiYWNr
IG9uIHRoZXNlIGNoYW5nZXMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEkgZGlkIGEgcXVpY2sgdGVzdCBv
biBwcGMzMiwgSSBkb24ndCBnZXQgc3VjaCBhIHByb2JsZW0sIG9ubHkNCj4+Pj4+Pj4gc29tZXRo
aW5nDQo+Pj4+Pj4+IHdyb25nIGluIHRoZSBkdW1wIHByaW50IGFzIHRyYXBzIGludHJ1Y3Rpb25z
IG9ubHkgYXJlIGR1bXBlZCwgYnV0DQo+Pj4+Pj4+IHRjcGR1bXAgd29ya3MgYXMgZXhwZWN0ZWQ6
DQo+Pj4+Pj4NCj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBxdWljayB0ZXN0LiBDb3VsZCB5b3UgcGxl
YXNlIHNoYXJlIHRoZSBjb25maWcgeW91IA0KPj4+Pj4+IHVzZWQuDQo+Pj4+Pj4gSSBhbSBwcm9i
YWJseSBtaXNzaW5nIGEgZmV3IGtub2JzIGluIG15IGNvbmlmZy4uLg0KPj4+Pj4+DQo+Pj4+Pg0K
Pj4+Pg0KPj4+PiBJIGFsc28gbWFuYWdlZCB0byB0ZXN0IGl0IG9uIFFFTVUuIFRoZSBjb25maWcg
aXMgYmFzZWQgb24NCj4+Pj4gcG1hYzMyX2RlZmNvbmZpZy4NCj4+Pg0KPj4+IEkgaGFkIHRoZSBz
YW1lIGNvbmZpZyBidXQgaGl0IHRoaXMgcHJvYmxlbToNCj4+Pg0KPj4+IMKgIMKgwqDCoMKgIyBl
Y2hvIDEgPiAvcHJvYy9zeXMvbmV0L2NvcmUvYnBmX2ppdF9lbmFibGU7IG1vZHByb2JlIHRlc3Rf
YnBmDQo+Pj4gwqAgwqDCoMKgwqB0ZXN0X2JwZjogIzAgVEFYDQo+Pj4gwqAgwqDCoMKgwqAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4+PiDCoCDCoMKgwqDCoFdBUk5JTkc6
IENQVTogMCBQSUQ6IDk2IGF0IGFyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmM6MzY3DQo+
Pj4gYnBmX2ludF9qaXRfY29tcGlsZSsweDhhMC8weDlmOA0KPj4NCj4+IEkgZ2V0IG5vIHN1Y2gg
cHJvYmxlbSwgb24gUUVNVSwgYW5kIEkgY2hlY2tlZCB0aGUgLmNvbmZpZyBoYXM6DQo+IA0KPj4g
Q09ORklHX1NUUklDVF9LRVJORUxfUldYPXkNCj4+IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWD15
DQo+IA0KPiBZZWFoLiBUaGF0IGRpZCB0aGUgdHJpY2suDQoNCkludGVyZXN0aW5nLiBJIGd1ZXNz
IHdlIGhhdmUgdG8gZmluZCBvdXQgd2h5IGl0IGZhaWxzIHdoZW4gdGhvc2UgY29uZmlnIA0KYXJl
IG1pc3NpbmcuDQoNCk1heWJlIG1vZHVsZSBjb2RlIHBsYXlzIHdpdGggUk8gYW5kIE5YIGZsYWdz
IGV2ZW4gaWYgDQpDT05GSUdfU1RSSUNUX01PRFVMRV9SV1ggaXMgbm90IHNlbGVjdGVkID8NCg0K
Q2hyaXN0b3BoZQ0K
