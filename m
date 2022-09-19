Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B505BCD67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 15:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWQlm2Xs7z3c4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 23:40:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dYn99dcv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.75; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dYn99dcv;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90075.outbound.protection.outlook.com [40.107.9.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWQkz3tcnz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 23:39:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SluworCrf99pPs2tnCobkuErs7thbrhyW0ktFGKt9Remc3RskFTP1g/XRx5YK3WEvqpF+X2i9PhBHOH9CNHfKBEV/oXqaHHsUk5BFyml7UBNcIKYGvSSwz02KSMoFYn00hxRlvcnblrTk4n2Qxtq6tB9AyRt567icjTFDSU1DjmvjhewJQzCeeU216bPNW3lYxE2ZNFCY3+9NwV33soX9fvxxNQnFn1dRT7GbZoH2nL5T1tTU7k6EoSFt4OAr5QTgYTL/3ovpcB9kYqu2YukoexDYBJIAEocDaVUrSRIwfQc+dwFnMuSWCfYxQ7ilp7mgX0yEKgRzAkdNu3hwkEIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaaGiq3n8NhL7UnzgIpBg8OJTJe1XPYvBv6kM8PFe1M=;
 b=IActNmRy8RKIw7LcnIfE+GNosDX88MSwU+UvvW4Q6vztk/bPkLwNJmug3SGjJ6fX5PQe6dtQMW+U7kMyt0F04gD3bZ9SEVsyMcJlb7KkjR5nzRx8c6UGj7o6AAGMTJZkNNp2LMWH7ZHk9IWELxARMSNe3f6GHaX6rVryVZTQ7FFsZmcG62qcz0c2DkyePKM6HMlQQgUNzCkaJn2vFAgR+RU+Gi9bEIRHkVkiuL7cKDypG9NjymEluUJxr24dWzWrEcd3+qqzY2j6aT+GUOQKus66sp9luWfUAsLoGKW7GrESZMhEHJhCjBCs7fB9JLZrb+db1xEVGZzkrCJXnfW9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaaGiq3n8NhL7UnzgIpBg8OJTJe1XPYvBv6kM8PFe1M=;
 b=dYn99dcvIodXAzGiiF3WtTPAiMjX79J6jSg7WSabpkZaNxNEislJRt9tZSi/PVTR83BQhE7gtwOxA7HicBd8BIr4GS8NrJRx81lt5jOIx7xSRpSeHAkc87xOd+djLyl3+I3rDJF3nzbcksSCvqMs4vxEjAPt51iX4jr+kplBVQsiAnAlS9WzcrhxlmAGXI/8Rh++Bf0gw3NUemAT2MxIvlyCu738I70me7tcSXiiuOWjzp7WYW2Hvznh0GIESrY/7f94OV2+dlYIgBYRTy0Y8SYigFEuWxjKSzRNwr7fxZRcUtnm58sqI33KpUNosU6VqaO2bmQMbsVdyXRkSbkfmw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 13:39:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:39:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Samuel Holland
	<samuel@sholland.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Topic: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Index: AQHYyYnrawisyGt7e0mr4Du3kDJFGq3jSIUAgANtqoCAABEVgA==
Date: Mon, 19 Sep 2022 13:39:02 +0000
Message-ID: <9a433048-ab0d-6d57-7aa8-c9acbe7b7a99@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <87h713leu8.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h713leu8.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3159:EE_
x-ms-office365-filtering-correlation-id: 38b3f255-52e2-4b97-ee41-08da9a445059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NrmoJsu7E34l63FGCE+yuYL+e7HpDQi0XxHrdpuOslR+muaxH2cOgS3Dt3lzJE+wkGx5GOFvXoZXofPxQq3NUTe8o733SbdjeWT6CZTWvEynLM/bqGH56R9pfByXCkPK4CkPRO4xc2+4tmJCGK9+dfrqVddmbkK/1NQJDlZC0zIGWBXnX9V+tULpGU4iFOABqY0+nOgPNU94/UkbhvQ/osErhC+rXtQDko8LsdqKFGCry0BUoK1WBfFzn8o7BukfjAjskwxKVAcmPA3aBGCXslweaXwsnwEt0KHLlyB7Wtmm0CtlQFP8hvwmE/V/u64tJy9qBNlEAqAOZqWgIIBpWoLbKaSnTz8qFACED/RBSIf9IS05LLYwu1nrjmD2SOz7jz/g0FDc2If4egFW5ikDz/zPf+T6tanNNVaJvKXyC/gVe+ySFCRsgxZ2GVQFsqBRbmsTx1gGnx4ZREJ3BxJtg3v5lZL+GfKFm5FUg5g009mPmWyVvry/34NP6YRqEeijdO+X5fEXWqpkMqiaYDwB6EDSYBti9x41TGuY5nZu/j9FhKc5pz+kliHUUJV56B5KQcRmdVV3zA+Yxicm20jX21NswHVZg9cbnvRL5XJRMX0SL02casM8dd1SM8f4SbLHpPeWuu97so/EUgICX2bjrcYmzJ8W5UjHaZdHrNUw/Wgu9TkMik9s4Dl9yMtzzglo8u8C4gOvtoB4KzJE5lSyv3x7krktDaezTZcG5fHpvJh2Vt7MdKy6r/ndBUz4GTYmvvyjOOO45r5pddHI7lcbwnqXUX9hJvLtxSKGf22vTfCC86Tc3uYRXG5BXL3wlxbXgkw8bhXz4r+h3gaFZidzAw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(451199015)(186003)(36756003)(66946007)(122000001)(2616005)(38100700002)(8936002)(66446008)(64756008)(66556008)(66476007)(66574015)(2906002)(83380400001)(316002)(110136005)(38070700005)(41300700001)(86362001)(54906003)(8676002)(6486002)(4326008)(76116006)(91956017)(6506007)(6512007)(71200400001)(26005)(478600001)(31696002)(44832011)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?amdwTTdoeXkxRDkweWQ5eVFyNGRWRldNZE9UTVo2emNMTWV0aVhvbXFPODl3?=
 =?utf-8?B?YkdGalJ1clFqZTM2emcvK0k2UE54ODVjU1Z5RXNiSDRCTVlzeWE1SHRLRVhD?=
 =?utf-8?B?OFZtNGdGWC9wcDgvb25UWkUxSmxNVDQ4RlFLVDBRTlB2K3JDbmlubTNYNGRJ?=
 =?utf-8?B?UllLWmNCNkt2ejlEckxXZmVLSzdQTEhiejY1a2JROEFFc0hqaWlDNGVTd2t2?=
 =?utf-8?B?UW1CVFBSWXVqWFZ6QU9PbHhUK1FyUHY5ZGMrVnZKOElhMkVRKytEQUZWd09E?=
 =?utf-8?B?ZHYzUStXd05wYkU4M2VpTWJBcy81U0F6RVlaY1VIdDYrSndEc0orL0Qwb1JF?=
 =?utf-8?B?THRDUER6NlNQQldYY2hBSW1RYThyWlZSTVE0K213VTQvZWhhMHdBVXFKWkZ2?=
 =?utf-8?B?ZGpoM0RReURxSGNPcHJ5R09uS1Y2aFpwamw1aWU0THE4clA2TURSMzFJOWo1?=
 =?utf-8?B?TnlXaEh6K3FoLzROVzNMWFNIY25WVHAvZXNMdVhCemdaZGdMaG11UjZQSEpD?=
 =?utf-8?B?L1BwZlIvS1JZUjBFRDBzODZHb0NBOUtYQnpycVByYi94ak1XM1c0Qk5CZzRk?=
 =?utf-8?B?ejhBcms0d3h2MWpVQ1FvYlMrSmRLTkU0ZEh3bUt1Y0hRcDNTaCszUHQvSVVi?=
 =?utf-8?B?bXd6ZVgxamZmRk9zMDhYZHF5VVBHOFdidjY0ZkZWYVc3SXZZczZPWDhMWWRD?=
 =?utf-8?B?ajhzSmlxSGZkUmZuekpTRWExUGRnNUR6RWZ3TWoxdTRmNEd2N3BKRWhDUXBV?=
 =?utf-8?B?K0Z2SEw4TTdQVFR5dVVZZGN5VWI0VUdONitRUWlnK1dQNkhRY3p2WURSQnRi?=
 =?utf-8?B?elJMaXZUYXd4Nks4U0tsTnhhYnBLYjA1YmxKNHlXYWpRcHVFK1hadjYzYU94?=
 =?utf-8?B?bFF1enNsRTdtVm1vbG1qK3M0S1VhOHR5ZlYzaGgzRjg0MWRrVVVEUkdxOHVl?=
 =?utf-8?B?R0dIYUxPdTEyTStpZTJSYWluaGFhY0hENlFsczRQV0YxeVh5WUNld1A1eTNH?=
 =?utf-8?B?R2N3c3JDdDRaUURJY3RNbjEwQ1FEdU9aa3JoSi9GSmVGTDI5WTgwY3JoU2hY?=
 =?utf-8?B?Z25RSElhN01YYWxtdVFqdEV5RWZFUm5Yd0NsdXhxTmFIbHNpL1I2Nkx3QmZE?=
 =?utf-8?B?NE43SElGWk02ajR1S3Y1alJabWQ5YnAvT0NlYktDZVNMRnlhb2xVZnMxYUhY?=
 =?utf-8?B?L2F3Z1FoWGFxOHQ4TklCdGppTEVUTGpSUVRpa1p0TjFia251U0ViRUI1WEx6?=
 =?utf-8?B?clpSQXBEbHdCWHRWdERQQkdZbHVIKzdFVHVOVkZrU3hJaWJ5SUdKNVQ0Wm5K?=
 =?utf-8?B?OEFsWnlKTVBPYzJnZS9kOUh3eTV3ZEk5L2FpSmV4Ull0endtR2ljQmZrQTJV?=
 =?utf-8?B?ZWJjcDJ1cjZ3UWZ0cDVBR0krQnhBN3QrUmRiVjJ1ZmJkSmd0VnN3eDFVVUNW?=
 =?utf-8?B?UVRzc3BqdHdaMVU2dk5oam9HVW9lMGU1Q2tFQWtIQndCVHdGWUh6bmxBLy9q?=
 =?utf-8?B?RGZoUnl0RE9yd2hMbE1PSXJGTkpTOEFsY0UwaFhqMk81TlRvRFAvRC9QMEpn?=
 =?utf-8?B?MHRRY1lWSmJjQTBsYnZqVE9jNEowbktUUU1HQnNpZ0RBTXE1TFI3OUdIMkE1?=
 =?utf-8?B?ZTFPQndEU3p2c0JYWnJyQWd2TmVYeEVDa1RuT0gzTmZBZzArOU42bFpudEFw?=
 =?utf-8?B?N05BRmI1S1VXR05SbWNXVzBmOVhxMDk4QlNORnNRNm1handlZ00wc2dCaXpP?=
 =?utf-8?B?dkRKUWJyMFNNcGRPTUVPaExXQnllOVBsNnZ1aFhLK1lnSjhZc3FVUUNMbHp5?=
 =?utf-8?B?TExnclVLSVYrWDUySURwVmg0UjBaRmhwNDBTVUU0a01XNkdTZGlaZk1GeVlQ?=
 =?utf-8?B?aFh0V1YwNTUzUnJGVWFkakRmcWxCVEloejRkZjBRaXkvcTMwVERGbWpPWkRE?=
 =?utf-8?B?OHZTTGhPMDdyTFpXSWdxVmxxdkIya2RXcUE4S1JJWjZHTFEvMnEwdnhOMUVj?=
 =?utf-8?B?TSs4LzdzVDVSdklkWTBKM1BVUTA5eWZHei85RWFXV0JnK1MvOWpFSDcvL1NR?=
 =?utf-8?B?N2NIN3B0Ymx2ZlFyb0tpVGtrdFlEU3UxVXZqRUdNWGhmQjNvSm1takJqVkJN?=
 =?utf-8?B?TkZmbzZpR0Y5cklFY2dDRHBrQ3VqdUdoRGNlZ0NLZUpkVTg5Nll1UWFCeXZh?=
 =?utf-8?Q?216USnb9FkGUJpiKmgUDJ7o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B56ADEBF37E0964280E4750B0D942B21@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b3f255-52e2-4b97-ee41-08da9a445059
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 13:39:02.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5d+YCzaiKxeWg0ZNnQrJtQo0KS/DoDCdFuX26SbmP1PRcjLFUfJMexPqmZaHvl0W5OA64/G7vcZyBrmrAbbWlqokF5RLjot3KJ1FR78LEEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3159
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMTQ6MzcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxNi8wOS8yMDIyIMOgIDA3OjA1LCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdMKgOg0K
Pj4+IFdpdGggQ09ORklHX1BSRUVNUFQ9eSAoaW52b2x1bnRhcnkgcHJlZW1wdGlvbiBlbmFibGVk
KSwgaXQgaXMgcG9zc2libGUNCj4+PiB0byBzd2l0Y2ggYXdheSBmcm9tIGEgdGFzayBpbnNpZGUg
Y29weV97ZnJvbSx0b31fdXNlci4gVGhpcyBsZWZ0IHRoZSBDUFUNCj4+PiB3aXRoIHVzZXJzcGFj
ZSBhY2Nlc3MgZW5hYmxlZCB1bnRpbCBhZnRlciB0aGUgbmV4dCBJUlEgb3IgcHJpdmlsZWdlDQo+
Pj4gbGV2ZWwgc3dpdGNoLCB3aGVuIEFNUi9JQU1SIGdvdCByZXNldCB0byBBTVJfS1VbQUVdUF9C
TE9DS0VELiBUaGVuLCB3aGVuDQo+Pj4gc3dpdGNoaW5nIGJhY2sgdG8gdGhlIG9yaWdpbmFsIHRh
c2ssIHRoZSB1c2Vyc3BhY2UgYWNjZXNzIHdvdWxkIGZhdWx0Og0KPj4NCj4+IFRoaXMgaXMgbm90
IHN1cHBvc2VkIHRvIGhhcHBlbi4gWW91IG5ldmVyIHN3aXRjaCBhd2F5IGZyb20gYSB0YXNrDQo+
PiBtYWdpY2FsbHkuIFRhc2sgc3dpdGNoIHdpbGwgYWx3YXlzIGhhcHBlbiBpbiBhbiBpbnRlcnJ1
cHQsIHRoYXQgbWVhbnMNCj4+IGNvcHlfe2Zyb20sdG99X3VzZXIoKSBnZXQgaW50ZXJydXB0ZWQu
DQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoaXMgaXNuJ3QgdHJ1ZSB3aGVuIENPTkZJR19QUkVFTVBU
PXkuDQoNCkFyZ2gsIHllcywgSSB3cm90ZSB0aGUgYWJvdmUgd2l0aCB0aGUgYXNzdW1wdGlvbiB0
aGF0IHdlIHByb3Blcmx5IGZvbGxvdyANCnRoZSBtYWluIHByaW5jaXBsZXMgdGhhdCBubyBjb21w
bGV4IGZvbmN0aW9uIGlzIHRvIGJlIHVzZWQgd2hpbGUgS1VBUCBpcyANCm9wZW4gLi4uIFdoaWNo
IGlzIGFwcGFyZW50bHkgbm90IHRydWUgaGVyZS4geDg2IHdvdWxkIGhhdmUgZGV0ZWN0ZWQgaXQg
DQp3aXRoIG9ianRvb2wsIGJ1dCB3ZSBkb24ndCBoYXZlIGl0IHlldCBpbiBwb3dlcnBjLg0KDQo+
IA0KPiBXZSBjYW4gc3dpdGNoIGF3YXkgd2l0aG91dCBhbiBpbnRlcnJ1cHQgdmlhOg0KPiAgICBf
X2NvcHlfdG9mcm9tX3VzZXIoKQ0KPiAgICAgIC0+IF9fY29weV90b2Zyb21fdXNlcl9wb3dlcjco
KQ0KPiAgICAgICAgIC0+IGV4aXRfdm14X3VzZXJjb3B5KCkNCj4gICAgICAgICAgICAtPiBwcmVl
bXB0X2VuYWJsZSgpDQo+ICAgICAgICAgICAgICAgLT4gX19wcmVlbXB0X3NjaGVkdWxlKCkNCj4g
ICAgICAgICAgICAgICAgICAtPiBwcmVlbXB0X3NjaGVkdWxlKCkNCj4gICAgICAgICAgICAgICAg
ICAgICAtPiBwcmVlbXB0X3NjaGVkdWxlX2NvbW1vbigpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgLT4gX19zY2hlZHVsZSgpDQoNCg0KU2hvdWxkIHdlIHVzZSBwcmVlbXB0X2VuYWJsZV9ub19y
ZXNjaGVkKCkgdG8gYXZvaWQgdGhhdCA/DQoNCg0KPiANCj4gSSBkbyBzb21lIGJvb3QgdGVzdHMg
d2l0aCBDT05GSUdfUFJFRU1QVD15LCBidXQgSSByZWFsaXNlIG5vdyB0aG9zZSBhcmUNCj4gYWxs
IG9uIFBvd2VyOCwgd2hpY2ggaXMgYSBiaXQgb2YgYW4gb3ZlcnNpZ2h0IG9uIG15IHBhcnQuDQo+
IA0KPiBBbmQgY2xlYXJseSBubyBvbmUgZWxzZSB0ZXN0cyBpdCwgdW50aWwgbm93IDopDQo+IA0K
PiBJIHRoaW5rIHRoZSByb290IG9mIG91ciBwcm9ibGVtIGlzIHRoYXQgb3VyIEtVQVAgbG9jay91
bmxvY2sgaXMgYXQgdG9vDQo+IGhpZ2ggYSBsZXZlbCwgaWUuIHdlIGRvIGl0IGluIEMgYXJvdW5k
IHRoZSBsb3ctbGV2ZWwgY29weSB0by9mcm9tLg0KPiANCj4gZWc6DQo+IA0KPiBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcNCj4gcmF3X2NvcHlfdG9fdXNlcih2b2lkIF9fdXNlciAqdG8sIGNv
bnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcgbikNCj4gew0KPiAJdW5zaWduZWQgbG9uZyBy
ZXQ7DQo+IA0KPiAJYWxsb3dfd3JpdGVfdG9fdXNlcih0bywgbik7DQo+IAlyZXQgPSBfX2NvcHlf
dG9mcm9tX3VzZXIodG8sIChfX2ZvcmNlIGNvbnN0IHZvaWQgX191c2VyICopZnJvbSwgbik7DQo+
IAlwcmV2ZW50X3dyaXRlX3RvX3VzZXIodG8sIG4pOw0KPiAJcmV0dXJuIHJldDsNCj4gfQ0KPiAN
Cj4gVGhlcmUncyBhIHJlYXNvbiB3ZSBkaWQgdGhhdCwgd2hpY2ggaXMgdGhhdCB3ZSBoYXZlIHZh
cmlvdXMgZGlmZmVyZW50DQo+IEtVQVAgbWV0aG9kcyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zLCBu
b3QgYSBzaW1wbGUgaW5zdHJ1Y3Rpb24gbGlrZSBvdGhlcg0KPiBhcmNoZXMuDQo+IA0KPiBCdXQg
dGhhdCBtZWFucyB3ZSBoYXZlIHRoYXQgZXhpdF92bXhfdXNlcmNvcHkoKSBiZWluZyBjYWxsZWQg
ZGVlcCBpbiB0aGUNCj4gZ3V0cyBvZiBfX2NvcHlfdG9mcm9tX3VzZXIoKSwgd2l0aCBLVUFQIGRp
c2FibGVkLCBhbmQgdGhlbiB3ZSBjYWxsIGludG8NCj4gdGhlIHByZWVtcHQgbWFjaGluZXJ5IGFu
ZCBldmVudHVhbGx5IHNjaGVkdWxlLg0KPiANCj4gSSBkb24ndCBzZWUgYW4gZWFzeSB3YXkgdG8g
Zml4IHRoYXQgInByb3Blcmx5IiwgaXQgd291bGQgYmUgYSBiaWcgY2hhbmdlDQo+IHRvIGFsbCBw
bGF0Zm9ybXMgdG8gcHVzaCB0aGUgS1VBUCBzYXZlL3Jlc3RvcmUgZG93biBpbnRvIHRoZSBsb3cg
bGV2ZWwNCj4gYXNtIGNvZGUuDQo+IA0KPiBCdXQgSSB0aGluayB0aGUgcGF0Y2ggYmVsb3cgZG9l
cyBmaXggaXQsIGFsdGhvdWdoIGl0IGFidXNlcyB0aGluZ3MgYQ0KPiBsaXR0bGUuIE5hbWVseSBp
dCBvbmx5IHdvcmtzIGJlY2F1c2UgdGhlIDY0cyBLVUFQIGNvZGUgY2FuIGhhbmRsZSBhDQo+IGRv
dWJsZSBjYWxsIHRvIHByZXZlbnQsIGFuZCBkb2Vzbid0IG5lZWQgdGhlIGFkZHJlc3NlcyBvciBz
aXplIGZvciB0aGUNCj4gYWxsb3cuDQo+IA0KPiBTdGlsbCBJIHRoaW5rIGl0IG1pZ2h0IGJlIG91
ciBiZXN0IG9wdGlvbiBmb3IgYW4gZWFzeSBmaXguDQoNCldvdWxkbid0IGl0IGJlIGV2ZW4gZWFz
aWVyIGFuZCBsZXNzIGFidXNpdmUgdG8gdXNlIA0KcHJlZW10X2VuYWJsZV9ub19yZXNjaGVkKCkg
PyBPciBpcyB0aGVyZSBkZWZpbml0aXZlbHkgYSBnb29kIHJlYXNvbiB0byANCnJlc2NoZWQgYWZ0
ZXIgYSBWTVggY29weSB3aGlsZSB3ZSBkb24ndCB3aXRoIHJlZ3VsYXIgY29waWVzID8NCg0KQ2hy
aXN0b3BoZQ==
