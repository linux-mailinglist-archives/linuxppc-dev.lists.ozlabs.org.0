Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653669F6D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJmM13R8z3c81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wEtyZ02N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::618; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wEtyZ02N;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJlK6zpyz3bg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:42:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb7iZNlXYtV/nOorOXHWG17WQvyLSZdDRhcD0+sfw9z6nBGXtIFz15MTtOFeDp0fbjap/R9enJn0Dz7eK4Qe76csPaj6yHg5qifabRlaOyG5bnG3+dHYgOrFc2sgeha46LDT/gzGkVBQD8q5qpOq7MC4AtJm3JpgchHlC4s3A+6d5sz0V986Z4B+EZlI4lsjjJ90vz24sGpnqBeIeobiFrgDDVfsw11W/shu3BwX8u37M1QGFBv/tnjHpRLINgoAKYRkZM7IoGg2sekqSwmZO0uWqR7XseDe/JSTj1d7rHFRPZNtSQzIHj3C8ExlZ5L5FQrbM2Xwb6I0+EF31UGvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLfiBiQfySJhLMcxW7NBxNq8jHv7P5DvTHTHBYUhSts=;
 b=b5M089k/P19DPD6ckFoHYNHLfHNiRpSlPV07SbSjMW2eKufuRqAnEGViVXRSw/rwck/cec9J7GRnQeHc17m5tl3pbuRaYweHm5SYDPvfSuAn6PCVma0T/kRtxxsSUXec3EqfkUGUW/c5OdlO+a/qoPQFuNhzGj398hp6N8FDfarG0B4kKi7pR0ZFDA4DNJKvs7TAw5yWmZ5EFWYFw+d45/v8SrHF+K6V/5no7E6DyBhtTTAr2C0cw5QiKxeSZafteN0bfgwhG6tVFsyoZ04gFhnisbDE0ML2lEs8IdQ7WrocDSWRMUJM4duBXDK9zj4diqkMW8/tL5tUXDz2awCpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLfiBiQfySJhLMcxW7NBxNq8jHv7P5DvTHTHBYUhSts=;
 b=wEtyZ02NPUvG4/BjfwOQrhaPwfNbQ+/CJAXlx1iuBIAIJfR2XzDTT8qGq57ELXQXHzLM9+ARC2BuO1x9TPBxxPodr9Nb1VO6aKR9MHBJNOCWTIde0gm6AeDq/7CNfebf8sm+O8mAswITpCsDemI98inf2vLkizILB65hf98/z3UnIRQXY2FMpPw3tPyvdWasggTzHenOkR7y/kcVmzWAAQ8PwPgXAkCv1szTAxmrxLqpVScrbwu3G4yBoQo3WNRhImb6MDsqd1FPjb7+55Oz1ZH9JgeFs39AUszdY9QMEC7VXXIwdtLZFAFEUXKbj5eXdWg2whA4dogeb9EX4Y+NTA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1709.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 14:41:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 14:41:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH v3 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index: AQHZQ4voiBHHMXLxIEOEExcEj19bG67Z+pwAgACPBYCAABRnAIAAcm4A
Date: Wed, 22 Feb 2023 14:41:43 +0000
Message-ID: <90174bc7-c295-bd08-95a9-1e75b4b49e5a@csgroup.eu>
References: <20230218111405.27688-1-pali@kernel.org>
 <20230221220714.pm64kwsnf3erdjcm@pali>
 <a692823b-eada-3072-c9e9-83877480454f@csgroup.eu>
 <20230222075208.y2nxqttaxfwsd4ye@pali>
In-Reply-To: <20230222075208.y2nxqttaxfwsd4ye@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1709:EE_
x-ms-office365-filtering-correlation-id: 397389ab-98ad-42a1-9235-08db14e2ea7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KZdF/N6nf9b267pMEdsjZxaQlIOr8HMcB99RMY43MFqQAGxdJrlm6qy8XLPCVPIDrEkv72hg8aY5lk1iC2EX4LXDFsMTrtUd/EfY5y34KfHciLNrCkFJN4jui7VIbwXpR39J/1yn2YzDkX1zga0RSS+Lh7Z38SHcLxA9XYTRjYc1Qw3oTUYWgP1iwrsybr4CMKymBwqMv6zGW5/PzzPVEVTiz2IbK4Wc7ajt/wmZqyKBt+Iy17QItTD30xiz++0EwhlgryX+NwxYT2qO2GeucwlklM3ia4Rq8gNYkIHqcZffIknFW0QLDJCsskrO6D0EVcGoMUcqBQ5goTY2wL/NEyzkkmoEzAdoWYRbpf7RoAkMt+rBuisgLdnvvENgp49IW7C8/+mVQc2+9f/3u1MVVv4TOOS2GmPE41Ktvtuloovrk9Rz9r4aDET6FHepPu8U5UARwhlnGjxm0/PsS1pIA3WlmipUEaIN0ClEDwspRA8y+9aX4Uo3uUPZXbSpzQesTWmE23M7bI2uvyrcjWjxNXg3drmQX7yyAAkPybwWEoEz2e/njT1hOSAAZnIQqI0/pV4nezJDwvCup0rhaCod1Ao5u3tJv+BOxv/sGumVCwhcXhi2ZoRskrcMwnTWHpaci29fQKyQwG0pKP+/wQk/J/oRUsPaW719IPJovn8kzBN8OWdIt0vRd56hR8AUjiexvxxxvX5kM2pdNFWCRFjQ7KWycMEn/REJBRB/6jDgGLMEYDxSu6AliW1uhYapVfKheOhVOkB/V2XGsE2+p/TJw+nqdJ223YQ9aFsIV8E5Hys=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39850400004)(346002)(396003)(366004)(451199018)(966005)(31686004)(6512007)(26005)(6486002)(186003)(8936002)(4326008)(91956017)(66446008)(76116006)(6916009)(64756008)(8676002)(66476007)(66946007)(66556008)(5660300002)(36756003)(83380400001)(6506007)(2616005)(71200400001)(478600001)(66574015)(316002)(41300700001)(54906003)(38100700002)(44832011)(86362001)(122000001)(31696002)(38070700005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QnA3R1ZpRkkvQ29oTEVKZ0hBb1FnODhSYXErdC9KelRFc01qMVk3RExreEZa?=
 =?utf-8?B?c2JzRW0ybFFFdVR5aksvWXpRNVFKZ3NCdVNrSEZiVG11U3dEUERiSWpRYk5J?=
 =?utf-8?B?Rzc1RUxqZFJlSFlmS3Job1lGK2NGa2lNbG5PVUJXcE9JY0tudHpQUXk4eG5E?=
 =?utf-8?B?OHQ5d2dvdG1JS3VGcjNENDMrQmc5YVd2Q1ZtT29SYmg3VUw0cWtXZHlnNUFK?=
 =?utf-8?B?L0R5Wjlxcm5EaDFPZUFkZHJZbWE1ZUtzeU9sd2UvUjdHblEyRmYvOXpPcmlT?=
 =?utf-8?B?cEU0eVR3dk1kMEhsWlVkNFNkQ2RVUGUxQUFraW5uV1o0cFRkUHZleVN1ek45?=
 =?utf-8?B?enZrMDIwRzJWbTJFQlc1Z2Rnc25MemFYc2tYRTV4TDQwanM0dkUwUTh5TW5S?=
 =?utf-8?B?TVhKd0hKa0x2dWpjU012RG9BZ1hpQmpaMks5U2lCbnNhcG1OcmFxWUo5aEg5?=
 =?utf-8?B?YzVlZG12UCtuaEZzbi9ybm1aeFNJSFRpbnNrUndmKzRqMkFkMExNd2hwRWk4?=
 =?utf-8?B?ek1yclZWamJqblZwMEhidFcyYnVIOGZxb2UyWmtyWHQyM0dWM1Y0eVNpV3g4?=
 =?utf-8?B?eFkwYWc3ZVk0UG1TNXNhb1gwSkpGbDVFVzJvVDF2YXl0c1pZeVEzaWhuVC9W?=
 =?utf-8?B?RFZhNGphdUYzbjJpclVISEJFZGc4aHJ0Um1sTGVZNVpKSndWZzJ6NzhFYnh4?=
 =?utf-8?B?UzU0dGNmSVI1Yko1WHFqTUtUZVNnVExWM2RjU1Z0alRyczNqOG9FUHBLbFVy?=
 =?utf-8?B?WGpGaGUrSU1oczJIVENSSFRTWkFid2phTG5QN25lK2dUeUM1RTdrWVpicFFK?=
 =?utf-8?B?THhEM1p5VTlBZ2dDNUlPRUMwZW5qSTE5VWpGajFhVjAzU05pTDZnY1BtWFJE?=
 =?utf-8?B?RGwwZlMrdDBuZGhJVUwzaUZrYmZuNkdmdlJuRHp1dS90amFob09Tb2FwWjZo?=
 =?utf-8?B?VU1YOVhYOHhoUTJaQjdNZTN2bldMTGxHK1JIT2t5dkNBc0NHN0xMbWNJQlBP?=
 =?utf-8?B?eG5KVlJ5Z2p6WmxKamR2VHBwOW0yMktCbmZyanZ2VjNFVDF3eW9TR3FhQkRV?=
 =?utf-8?B?N1NnOUhmYUxhYmFYT2lsSloyVXhFU2dpRUxwelhRWUZ1WGZoOGVUdVRXTU83?=
 =?utf-8?B?RWFlbGtha2xsMmhOOGNjRHdMbi8rMFdnb3VHVmh0Ylc1czFEK203TTNHZVVi?=
 =?utf-8?B?ZXNlRDd6ZjZQN3ZUU0FpTFZWeUs2OFVZNDhYVFdLN09UUUVEa2RJTzJSN2Ev?=
 =?utf-8?B?MDZYVGgzd2FDZ3pNUkxUbXI4cUVYOTBjblZOdjAvdjJGa3NuMVBhWlE5MXZh?=
 =?utf-8?B?cUx5NGd1ampsWVU1aVVEV3o4VHU3czhGRldBUDJxRm1QOThBZlQzRDNXa0FE?=
 =?utf-8?B?QzNSVkJOTWVGdGhIT3AwYkplNHhnWXRoZGlJdWRWNkNsaHZ3aFFNaURzemFr?=
 =?utf-8?B?UzVkajdmeFdoYnBpNU82MVpaVmZZT0hlOVdHUkdKNFdkWkc1WUNwMjBibWZ6?=
 =?utf-8?B?TVk3ODNKY1ovc3l3aU80M1BRRE0xU3N0MGpFWU5MY1krcnF4NmozclZidk13?=
 =?utf-8?B?U1hPQzFQY1NNTklJRlVQS1ZwbXRBaGdPL21WVTJkdlRDZzlnNldFN2UvelZS?=
 =?utf-8?B?bllPc3hkYlRZWXhSQm45ZHo1OHo5SFREbnZBWG1GMlQ4OEVXOVI0Vk1QTS93?=
 =?utf-8?B?NGdlQjBjU0tKc2p4R2kvWWhlMVNCdjJRL25BK0NYZVZGMjc4YWRZTi9sWU5m?=
 =?utf-8?B?WW1Cc0Z6S05NQzgyMmdaR0NhTEdSSFNLUmdiU1JIbDZsWUNPc1ZrOWNRTkps?=
 =?utf-8?B?WFZNUDUzZ2VFSGxIYzdvbkg1M3lXS1A2bzRNZEV3VlNqUkJXZlYvNkdJOVhU?=
 =?utf-8?B?d0VZMUFZbFJhV3JhZCtuU0RGV3g0OERDbGxIZklIZ2xWeG9sU241Sy9ybkNU?=
 =?utf-8?B?R0xpdUhVdGUzWWZLVEJmaFkrRjFQUFUvNzFPd2YvRnEyTzZZaTZVNlRyTDQ4?=
 =?utf-8?B?WlhWUUE5WEdRcUd4eXdSTUlheUpjVmdlYitIY2ovK0pmNHlndDl2bXYxVGJC?=
 =?utf-8?B?LzlmcFdUSjY1djhicUlDTURZcHBlMHoycGxpT1lJVUJaeldEUXZadWU2ck0v?=
 =?utf-8?B?NGVtV3V5RDhiS3VKa2NyZnRycEpjQXN2d0wrVmxETXRacHpPbENGcGd3V3Vs?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C39D91FBDFACD4785BE9B40ACF6CBAD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 397389ab-98ad-42a1-9235-08db14e2ea7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 14:41:43.1629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LW+0FvlVYq7w0mFDcmWk4uH2YGQxtY7JXujFy0rf5cVSgTOxJwInTHD4EWuJUvbk9WoFPCSIS1R6aiLmsvu9bTJ4wj4jvxPiiGjMmU3eRGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1709
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMDg6NTIsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFdlZG5lc2RheSAyMiBGZWJydWFyeSAyMDIzIDA2OjM5OjA3IENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+PiBIaSwNCj4+DQo+PiBMZSAyMS8wMi8yMDIzIMOgIDIzOjA3LCBQYWxpIFJvaMOhciBh
IMOpY3JpdMKgOg0KPj4+IEhlbGxvIENocmlzdG9waGUhIENvdWxkIHlvdSBsb29rIGF0IHRoaXMg
djMgc2VyaWVzPw0KPj4+IEkgYWRkcmVzc2VkIHRob3NlIHNtYWxsIGlzc3VlcyBhbmQgaG9wZWZ1
bGx5IGl0IHNob3VsZCBiZSByZWFkeS4NCj4+PiBJdCB3b3VsZCBiZSBncmVhdCB0byBoYXZlIHRo
aXMgZmluYWxseSBpbiB2Ni4zIHJlbGVhc2UuDQo+Pg0KPj4gSSBzdGFydGVkIGxvb2tpbmcgYXQg
eW91ciBzZXJpZXMgYW5kIEkgd2lsbCB0cnkgdG8gcHJvdmlkZSBhIGZlZWRiYWNrDQo+PiB3aXRo
aW4gYSBmZXcgZGF5cy4NCj4+DQo+PiBCeSB0aGUgd2F5IEkgc2VlIHRoYXQgUGF1bCBHb3J0bWFr
ZXIgaGFzIHN0YXJ0ZWQgcmVtb3ZhbCBvZiBzZXZlcmFsIDg1eHgNCj4+IGJvYXJkcy4gU2hvdWxk
IHdlIGZpcnN0IHRha2UgUGF1bCdzIHJlbW92YWwgc2VyaWVzIHRoZW4gc2VlIHdoYXQgcmVtYWlu
cw0KPj4gYmVmb3JlIGFwcGx5aW5nIHlvdXJzID8gVGhhdCB3b3VsZCBtYWtlIHlvdXIgc2VyaWVz
IGV2ZW4gbW9yZSBlZmZpY2llbnQuDQo+IA0KPiBJIGhhdmUgYWxyZWFkeSByZXBsaWVkIHRvIFBh
dWwgcGF0Y2ggc2VyaWVzLiBUaGUgaW1wb3J0YW50IHRoaW5nIGlzIHRoYXQNCj4gd2UgYXJlIHRv
dWNoaW5nIGRpZmZlcmVudCBmaWxlcywgc28gcGF0Y2ggc2VyaWVzIHNob3VsZCBiZSBpbmRlcGVu
ZGVudC4NCg0KT2suDQoNCkJlY2F1c2UgZXhlbXBsZXMgYXJlIGFsd2F5cyBiZXR0ZXIgdGhhbiBs
b25nIHdyaXRpbmdzLCBJIGhhdmUgcHJlcGFyZWQgYSANCnY0IG9mIHlvdXIgc2VyaWVzIGFuZCB3
aWxsIHNlbmQgaXQgb3V0IHNob3J0bHkuDQoNCklmIHRoYXQgYXBwcm9hY2ggaXMgb2sgZm9yIHlv
dSwgZmVlbCBmcmVlIHRvIHJlc3RhcnQgZnJvbSB0aGVyZS4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0K
Pj4gQ2hyaXN0b3BoDQo+Pg0KPj4+DQo+Pj4gT24gU2F0dXJkYXkgMTggRmVicnVhcnkgMjAyMyAx
MjoxMzo1NyBQYWxpIFJvaMOhciB3cm90ZToNCj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgdW5pZmll
cyBhbGwgUDIwMjAgYm9hcmRzIGFuZCBtYWNoaW5lIGRlc2NyaXB0aW9ucyBpbnRvDQo+Pj4+IG9u
ZSBnZW5lcmljIHVuaWZpZWQgUDIwMjAgbWFjaGluZSBkZXNjcmlwdGlvbi4gV2l0aCB0aGlzIGdl
bmVyaWMgbWFjaGluZQ0KPj4+PiBkZXNjcmlwdGlvbiwga2VybmVsIGNhbiBib290IG9uIGFueSBQ
MjAyMC1iYXNlZCBib2FyZCB3aXRoIGNvcnJlY3QgRFRTDQo+Pj4+IGZpbGUuDQo+Pj4+DQo+Pj4+
IFRlc3RlZCBvbiBDWi5OSUMgVHVycmlzIDEuMSBib2FyZCB3aXRoIGhhcyBGcmVlc2NhbGUgUDIw
MjAgcHJvY2Vzc29yLg0KPj4+PiBLZXJuZWwgZHVyaW5nIGJvb3RpbmcgY29ycmVjdGx5IGRldGVj
dHMgUDIwMjAgYW5kIHByaW50czoNCj4+Pj4gWyAgICAwLjAwMDAwMF0gVXNpbmcgRnJlZXNjYWxl
IFAyMDIwIG1hY2hpbmUgZGVzY3JpcHRpb24NCj4+Pj4NCj4+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+
Pj4gKiBVc2UgJ2lmIChJU19FTkFCTEVEKENPTkZJR19QUENfSTgyNTkpKScgaW5zdGVhZCBvZiAn
I2lmZGVmIENPTkZJR19QUENfSTgyNTknDQo+Pj4+ICogU2ltcGxpZnkgcDIwMjBfcHJvYmUoKQ0K
Pj4+PiAqIFBhdGNoZXMgZ2VuZXJhdGVkIGJ5IC1NIGFuZCAtQyBnaXQgb3B0aW9ucw0KPj4+Pg0K
Pj4+PiBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAy
MjEyMjQyMTE0MjUuMTQ5ODMtMS1wYWxpQGtlcm5lbC5vcmcvDQo+Pj4+DQo+Pj4+IENoYW5nZXMg
aW4gdjI6DQo+Pj4+ICogQWRkZWQgcGF0Y2ggInAyMDIwOiBNb3ZlIGk4MjU5IGNvZGUgaW50byBv
d24gZnVuY3Rpb24iIChzZXBhcmF0ZWQgZnJvbSB0aGUgbmV4dCBvbmUpDQo+Pj4+ICogUmVuYW1l
ZCBDT05GSUdfUDIwMjAgdG8gQ09ORklHX1BQQ19QMjAyMA0KPj4+PiAqIEZpeGVkIGRlc2NyaXB0
aW9ucw0KPj4+Pg0KPj4+PiBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eHBwYy1kZXYvMjAyMjA4MTkxOTE1NTcuMjgxMTYtMS1wYWxpQGtlcm5lbC5vcmcvDQo+Pj4+DQo+
Pj4+IFBhbGkgUm9ow6FyICg4KToNCj4+Pj4gICAgIHBvd2VycGMvODV4eDogTWFyayBtcGM4NXh4
X3JkYl9waWNfaW5pdCgpIGFzIHN0YXRpYw0KPj4+PiAgICAgcG93ZXJwYy84NXh4OiBNYXJrIG1w
Yzg1eHhfZHNfcGljX2luaXQoKSBhcyBzdGF0aWMNCj4+Pj4gICAgIHBvd2VycGMvODV4eDogcDIw
MjA6IE1vdmUgYWxsIFAyMDIwIG1hY2hpbmUgZGVzY3JpcHRpb25zIHRvIHAyMDIwLmMNCj4+Pj4g
ICAgIHBvd2VycGMvODV4eDogcDIwMjA6IE1vdmUgaTgyNTkgY29kZSBpbnRvIG93biBmdW5jdGlv
bg0KPj4+PiAgICAgcG93ZXJwYy84NXh4OiBwMjAyMDogVW5pZnkgLnNldHVwX2FyY2ggYW5kIC5p
bml0X0lSUSBjYWxsYmFja3MNCj4+Pj4gICAgIHBvd2VycGMvODV4eDogcDIwMjA6IERlZmluZSBq
dXN0IG9uZSBtYWNoaW5lIGRlc2NyaXB0aW9uDQo+Pj4+ICAgICBwb3dlcnBjLzg1eHg6IHAyMDIw
OiBFbmFibGUgYm9hcmRzIGJ5IG5ldyBjb25maWcgb3B0aW9uDQo+Pj4+ICAgICAgIENPTkZJR19Q
UENfUDIwMjANCj4+Pj4gICAgIHBvd2VycGM6IGR0czogdHVycmlzMXguZHRzOiBSZW1vdmUgImZz
bCxQMjAyMFJEQi1QQyIgY29tcGF0aWJsZSBzdHJpbmcNCj4+Pj4NCj4+Pj4gICAgYXJjaC9wb3dl
cnBjL2Jvb3QvZHRzL3R1cnJpczF4LmR0cyAgICAgICAgICAgIHwgICAyICstDQo+Pj4+ICAgIGFy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9LY29uZmlnICAgICAgICAgICB8ICAyMiArKy0NCj4+
Pj4gICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L01ha2VmaWxlICAgICAgICAgIHwgICAx
ICsNCj4+Pj4gICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1eHhfZHMuYyAgICAg
IHwgIDI1ICstLS0NCj4+Pj4gICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1eHhf
cmRiLmMgICAgIHwgIDQ2ICstLS0tLQ0KPj4+PiAgICAuLi4vcGxhdGZvcm1zLzg1eHgve21wYzg1
eHhfZHMuYyA9PiBwMjAyMC5jfSAgfCAxMzUgKysrKysrLS0tLS0tLS0tLS0tDQo+Pj4+ICAgIDYg
ZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMTYzIGRlbGV0aW9ucygtKQ0KPj4+PiAg
ICBjb3B5IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC97bXBjODV4eF9kcy5jID0+IHAyMDIw
LmN9ICg1MiUpDQo+Pj4+DQo+Pj4+IC0tIA0KPj4+PiAyLjIwLjENCj4+Pj4NCg==
