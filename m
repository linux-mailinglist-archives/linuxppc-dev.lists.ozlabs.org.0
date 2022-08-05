Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0758AE80
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 18:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzs8f4t8kz3cdG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 02:52:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lWSRN+ug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.82; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lWSRN+ug;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90082.outbound.protection.outlook.com [40.107.9.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lzs7r01WZz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 02:51:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV9cFpR9AwPeZyRKmzh7BU1g510Ze3T95aTzkvj4URK4WgcQhlJMrNfVeHc3oNrWGf1zz65TMpcRTj3y42TyWBfbeI2WOcK0bjQSJFPqXh7ZvBUlk+pggiYOo+MqGFg71E3qJcN/zQbw1jKiicpP4B0b8sxLaA/30syiFuB+edstMlCzcWoy2J7w6o4lCBh6MD649njtbiKXdoSJpnnqpPQ62B97DyeHP4dr4WzqzmrZyYz8xFq0zNjHVv76SvFKWg9S7ZVU+Xc5Y2y36DRPf1zmB2DJEElphJ2XCR97kGbq/Rj8XSVRioP4iaMKhGdVKws3+rvRrdLnAlh5z08B7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PyKUElTxKZWBSIKIrUy4JxZ2CiDiN+OPQWmsb7SSUQ=;
 b=G1OAfZgg8Tp32wtmu7MQCkMvJ9D88BId0P2olbPL/sy1ejJh6Yi3FcHO2Tg0YUrndJDeGofqpQOuZ4PpVo7r4TDDmBTXkWcxT/WRO7LyhcSMhgNGuI2/td5N10fBOhfDLYdvP8uFf/G2u/sEXOpAnsQPoVllJNSZ56owjyN7nL5L7FRHazrkk6MTzX3jk7aoN6f8UeQlyb6szOVmPRyXsAOQTaqv4aJRMR4FbvxGjBl9FlJ8QuLxhGC3hYkj2B3ucY2A/BtYMwd3nOQFHukJsOo+sAODYTIFu+JFawFaT1OmDBqrHIYpNrdRUkMbBuJLksevB2WN89nYgjmhF1AsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PyKUElTxKZWBSIKIrUy4JxZ2CiDiN+OPQWmsb7SSUQ=;
 b=lWSRN+ugU2gBJZ8+uq5SKiPjHEPI2ZFHY5v2VITag7HTD2k5QnNWLNaiXvfKtGo36ZkxoQYvwxVtLBlz1KAN0tm7EBlb9j5nJJhx0AofTTYI90RPUKhsWREjnLNz4A0EauulJudtEKsmGKSkCneEl7QrnowCp9Uamn+c7vGuejgPhOUmEdEIxtl8njT7/x8B9fiZYdAx+OfiBB7013zV3rMEie49a4NE3IZH2nrYqN4MjRzDwj3wi5GGmZdocS5iORn//8oX7l42Wa5NRE6yrXdDNQLWsN3deIJFDzkYwX76B19NPfcDK9Jfa4siEo40fte9t7UArh+oE57tDk8Gvg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2883.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 16:51:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 16:51:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 04/14] powerpc/32: Remove powerpc select specialisation
Thread-Topic: [PATCH v2 04/14] powerpc/32: Remove powerpc select
 specialisation
Thread-Index: AQHYn+98bSpVPz9Tc02L89W9nXTToK2gl1sA
Date: Fri, 5 Aug 2022 16:51:32 +0000
Message-ID: <1f2aa86f-2331-0b22-dd2a-c7607c52545f@csgroup.eu>
References: <20220725062621.118988-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725062621.118988-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f79b42b8-259a-46a3-0226-08da7702c080
x-ms-traffictypediagnostic: MR1P264MB2883:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Xb3jZVIhtRU7j4wdIFxPkQ02wE2K4h3Ec7A/GcBHf5hK3vtMXncFmMTvvNA+v71cFtvQorYkXik7TxBtxaFDD7bpqU2SnU3pwtJa5zDnGg9regWas3oUdgvrkX85quIVLyRztFy5HCRAf3o56r456zdOGiB8v0LaiujNco8DsG9wgstNGtYvmqmrHRkaX/GqfrbaquxwkCouVGuuWKtu57I4J1TClXLmFuYxjEtJoFFCrXHCOG//v050JMrt44WTRWVUZf40f06ASNXTGNOFo2ehgmMXdSzTr96jA41ougVzEQKITo1MLhb6LYy5u/ODhoWTItkTsqyIRlA46krlgDo6Y5Jei6zzuC/h1RIwqWVGPB55HaezrgHmBsX9kUqg1SXg0HEPOb4DNDjeCshbD1Mor0TyFC5E9ftlI0KjNojfcHpUKbfW/RIjjI3M2rnihZbz1Tgdq6qxR4hABQANkFFKw4ziq/7zAfkgNSpgHtdW+0kVYE3kiyTpEkGCCxVutLMFbveV57BRTgXdwF+VjL+BaoFw4CVVVr/jx8OHl0CDZZFBmySaXw6tla4YSfui89botB51jJcUKsXoo4ofJXxQ4afDaTISZyfIhDmCqoWLm8RuSutBTGJQGK51VVDJZomrmvsqdfL6sqNlwKS7hDeLmsww/JjiEzG80huPwl+rXNwUoIeiTTB0M5gD57yIXDjmhmOklg75bcT3gJunv+swN4APB2+w9WGv8keHj3CpyR7T21NWOIybzAU7CYLT5PxRTTcTogqeEbKjrJPR+84D2H/aTpFUMcsLDlWZATi0lqzsXlDv1YZuGl6QVuzzg9ko6hdlaEqNea/eXT2/aWrsROq+oxMlC0XxrAHnAv2g3iBuSwTqMjefGf5Z8RdWpNHSBPmAwevhaWHM5UOfmg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39850400004)(8676002)(4326008)(64756008)(5660300002)(66476007)(66446008)(66556008)(66946007)(76116006)(316002)(44832011)(122000001)(2906002)(91956017)(8936002)(38070700005)(31696002)(86362001)(36756003)(38100700002)(6486002)(478600001)(966005)(41300700001)(71200400001)(54906003)(110136005)(107886003)(6506007)(66574015)(83380400001)(6512007)(26005)(2616005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Ykh6Z1ViUGYzWGlDQ3pRclVQM05oT0hQenJEREhxeXVGZjZHVjF0Q2U4NW8r?=
 =?utf-8?B?NUdZVHhEczRZYjFXR3VMcW91eGo2NlAvMy9hN2pkdHBDUjd2V20yTnFVNGVR?=
 =?utf-8?B?ZXVnMmNKckZMaVdNeThtbE5HdDNkc0cwSkxwS2d0QXhhQkV3TmFHVjZPcUtR?=
 =?utf-8?B?aEtPUE5BekRnVHk0VjI2YklXNHBMVmxxWGxkNUxnaXdsaDRQUE9JMFNpTlVR?=
 =?utf-8?B?bVg4ZndDTU13dkkwbWJBQW0ycmNZa0RDRE8xMEt5amlZWk1YWnhkMW4zZzZs?=
 =?utf-8?B?NS9ST1M3UENCbE9JNFZ2SDFuWEV3bU9DYUs0cTJCMXY1OEgrUFZGUnZnRFVa?=
 =?utf-8?B?bzRRcVFtYmszNlpNUXhVQm1YeGU1dnh4Tm9mTnAva21PVUxmcVRhblgwRG04?=
 =?utf-8?B?NC8raUNNQ21DT3dNTER3UTNWNzdvQ3NYdThQdXhEdk13UzA1QnpZUUFqMzQv?=
 =?utf-8?B?RmQxM1hpRHBkVmh1WjNpZGhGSUZ0KzRwQ3ZWa3ovRm9FTHNaVU5RcEszZjlp?=
 =?utf-8?B?ckttTGswK0phdDVTYkVlcGFpcWlzR2dRMVpYV1d2SkVleVhIM1V4T2g1c2Nv?=
 =?utf-8?B?bVFObEhpYlI3WXdLbnVLdjFIVDdXcThJTmpqNmd5VVJVcnBGV1N6bjdLYTZM?=
 =?utf-8?B?MWhZM2NlSHhMZ1g3RFVMQm8wRkhHUjBMTXlTQWYxMzhCcFhNek1IZFlHOTl1?=
 =?utf-8?B?TE5WSTM2Tk1sK0N6eWdqL2dFbDYrcytKU3NIR0pOd3NKM0x6bHY2a3g1ZFBD?=
 =?utf-8?B?TmpidDBPVVpDMTJkeXZwVWt6cWx3RmZQSFdkTkhiblQxV0tJOFQyYVJqRnAw?=
 =?utf-8?B?UWwzZE0wUS8rK0dZQWZuMGp0TndvN3BrcnhsQzZ6S1Q0bFh6ZkVuOUVPUTdn?=
 =?utf-8?B?N1FSbEZ2eXBIWG8xM0VpazJCaGRjQ3dyMXFxSmdRYXkra3BhS1FYM3ZFWi8w?=
 =?utf-8?B?OUpNaFhNSGV0VjN1QlB2Ky9QcXZnQVFWanFkRVQ0Q0lVcHd6THFaQnRIQzg3?=
 =?utf-8?B?K1VzNmhlb2hvSElFUngxSnVIb2N0TEp2b1c3TUQvMHoxTTI0LzBQa1RxZjRo?=
 =?utf-8?B?NXUvUUVySEhBMW9hTmhuUFJVUUh0L1dJSDltSFZ4Um1YNUYzM2lqakt0Lzg3?=
 =?utf-8?B?RkdVaHYyWnduMVp0Si9VVFFpeGJhdlUvRVhDWmV3YzlBcWQxYmduV3dMR2g3?=
 =?utf-8?B?eisxTUVia2d3bUFaRzh0V1JaVTBDa1phb3N5Yjl4TXFmSFRCWm9mRUhvUER2?=
 =?utf-8?B?T3VIMmFoKzhvMUpXQTE3QzV2UkcyNVcwK0VxZE1DVkhyUU5Pc0ZiM2R4Rlpx?=
 =?utf-8?B?SmxmNEtrOG5nUUxQZ3NNRFVTcHNqU0Y3aUN2MzAyMlNYNzYyUjRwUmdhWUli?=
 =?utf-8?B?Mk1OYXdxSUpPUnJwdUZuTTlOUUVpVHNxeXlLWnowQzRWZzlsbWlyVlBtQ0Iw?=
 =?utf-8?B?Rk5ydjN3aEpGZU9UeWpibjlUQmNhWEJBeCtJWUhMZHNiZEk3MjV1enUvYmZC?=
 =?utf-8?B?Ri9vazVXSHJJL0Fnd1JCQUUyTFFzaXh1YmtUNm84T0d0MUtTRjV6OG1hNGw4?=
 =?utf-8?B?OEszV2ZsM09GdnlNL1BWWnA0UTQyVUJYTmJEeUcxNDJUYXFJZTNPTVp4WXJJ?=
 =?utf-8?B?dHNYNDBtelhkOWRoUnhZYTVnY2RMYTN0b3Q1OXAvZEZRVVhhcGxvSmtkbzlD?=
 =?utf-8?B?VmpHVnhwVnVmZHVGMzJKa1FUbWl4eVhGSmhrMG9vMDg4ZjhZWm05VUhBdmlX?=
 =?utf-8?B?RHcrbU8zR0NLekh6cjZTNzcrcGJhZm1kUWJKdTRlU0h1VmYxVUk0ZVlOT3Jl?=
 =?utf-8?B?UUZBeHpzUk53MHJ5NDNCVDBPUFVUbFBBNHV2M3RweHpBTmErVDZFL08yRnE2?=
 =?utf-8?B?dkJCdlpKOG53SFhDSGUxZEVvMEZQR1ZlbnkwNEcwQWhMZ0NOOXNaNzZoOEo0?=
 =?utf-8?B?aStablpnOU9lbjgzWW9TVklPYlllT0xlWWduNk8xa1RHT3R4alluSituRlZ6?=
 =?utf-8?B?aUh0MWczOWl1UWtLN21lYmxDd1lObDl4Tit1QzdRTUtMb0RBRWg2Q0I1VUVi?=
 =?utf-8?B?V2VWUjJMOHJnZEpQL3ZpRE5zVzNZcmFBV01YZzhxajFLMTVQS3VrZDBXcWVF?=
 =?utf-8?B?L1BqUmFrY3AvS2R6WWRXTXEzRmMrMjRBdTFTaHVwSmpJUEx0bXlhY2MyYUdj?=
 =?utf-8?Q?iXyP7kesN5lKMigy0xSb2Eg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E820691B07AA64FB80B4E301B1DDDA4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f79b42b8-259a-46a3-0226-08da7702c080
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 16:51:32.9288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kZlqy1b9v8vjYlUv+p9iq7jN2UB5dI6GOw+tpkkqf23nM+tBi9X4tlpXcdDFj2Oxl7a66yYOSqaf8307FU8eIoHy9VVsjSn+liY+m58CUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2883
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MjYsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
eXNjYWxsICM4MiBoYXMgYmVlbiBpbXBsZW1lbnRlZCBmb3IgMzItYml0IHBsYXRmb3JtcyBpbiBh
IHVuaXF1ZSB3YXkgb24NCj4gcG93ZXJwYyBzeXN0ZW1zLiBUaGlzIGhhY2sgd2lsbCBpbiBlZmZl
Y3QgZ3Vlc3Mgd2hldGhlciB0aGUgY2FsbGVyIGlzDQo+IGV4cGVjdGluZyBuZXcgc2VsZWN0IHNl
bWFudGljcyBvciBvbGQgc2VsZWN0IHNlbWFudGljcy4gSXQgZG9lcyBzbyB2aWEgYQ0KPiBndWVz
cywgYmFzZWQgb2ZmIHRoZSBmaXJzdCBwYXJhbWV0ZXIuIEluIG5ldyBzZWxlY3QsIHRoaXMgcGFy
YW1ldGVyDQo+IHJlcHJlc2VudHMgdGhlIGxlbmd0aCBvZiBhIHVzZXItbWVtb3J5IGFycmF5IG9m
IGZpbGUgZGVzY3JpcHRvcnMsIGFuZCBpbg0KPiBvbGQgc2VsZWN0IHRoaXMgaXMgYSBwb2ludGVy
IHRvIGFuIGFyZ3VtZW50cyBzdHJ1Y3R1cmUuDQo+IA0KPiBUaGUgaGV1cmlzdGljIHNpbXBseSBp
bnRlcnByZXRzIHN1ZmZpY2llbnRseSBsYXJnZSB2YWx1ZXMgb2YgaXRzIGZpcnN0DQo+IHBhcmFt
ZXRlciBhcyBiZWluZyBhIGNhbGwgdG8gb2xkIHNlbGVjdC4gVGhlIGZvbGxvd2luZyBpcyBhIGRp
c2N1c3Npb24NCj4gb24gaG93IHRoaXMgc3lzY2FsbCBzaG91bGQgYmUgaGFuZGxlZC4NCj4gDQo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTM3MzdkZTUtMGViNy1lODgxLTlh
ZjAtMTYzYjBkMjlhMWEwQGNzZ3JvdXAuZXUvDQo+IA0KPiBBcyBkaXNjdXNzZWQgaW4gdGhpcyB0
aHJlYWQsIHRoZSBleGlzdGVuY2Ugb2Ygc3VjaCBhIGhhY2sgc3VnZ2VzdHMgdGhhdCBmb3INCj4g
d2hhdGV2ZXIgcG93ZXJwYyBiaW5hcmllcyBtYXkgcHJlZGF0ZSBnbGliYywgaXQgaXMgbW9zdCBs
aWtlbHkgdGhhdCB0aGV5DQo+IHdvdWxkIGhhdmUgdGFrZW4gdXNlIG9mIHRoZSBvbGQgc2VsZWN0
IHNlbWFudGljcy4geDg2IGFuZCBhcm02NCBib3RoDQo+IGltcGxlbWVudCB0aGlzIHN5c2NhbGwg
d2l0aCBvbGRzZWxlY3Qgc2VtYW50aWNzLg0KPiANCj4gUmVtb3ZlIHRoZSBwb3dlcnBjIGltcGxl
bWVudGF0aW9uLCBhbmQgdXBkYXRlIHN5c2NhbGwudGJsIHRvIHJlZmVyIHRvIGVtaXQNCj4gYSBy
ZWZlcmVuY2UgdG8gc3lzX29sZF9zZWxlY3QgZm9yIDMyLWJpdCBiaW5hcmllcywgaW4ga2VlcGlu
ZyB3aXRoIGhvdw0KPiBvdGhlciBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgc3lzY2FsbCAjODIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4N
Cg0KQWNrZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4NCg0KPiAtLS0NCj4gVjEgLT4gVjI6IFJlbW92ZSBhcmNoLXNwZWNpZmljIHNlbGVjdCBoYW5k
bGVyDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMuYyAgICAgICAgICAg
ICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNj
YWxscy9zeXNjYWxsLnRibCAgICAgfCAgMiArLQ0KPiAgIC4uLi9hcmNoL3Bvd2VycGMvZW50cnkv
c3lzY2FsbHMvc3lzY2FsbC50YmwgIHwgIDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9zeXNjYWxscy5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy5jDQo+
IGluZGV4IDlmMzM5YmNiNDMzZC4uMGFmYmNiZDUwNDMzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMva2VybmVsL3N5c2NhbGxzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNj
YWxscy5jDQo+IEBAIC03NCwyNCArNzQsNiBAQCBTWVNDQUxMX0RFRklORTYobW1hcCwgdW5zaWdu
ZWQgbG9uZywgYWRkciwgc2l6ZV90LCBsZW4sDQo+ICAgCXJldHVybiBkb19tbWFwMihhZGRyLCBs
ZW4sIHByb3QsIGZsYWdzLCBmZCwgb2Zmc2V0LCBQQUdFX1NISUZUKTsNCj4gICB9DQo+ICAgDQo+
IC0jaWZkZWYgQ09ORklHX1BQQzMyDQo+IC0vKg0KPiAtICogRHVlIHRvIHNvbWUgZXhlY3V0YWJs
ZXMgY2FsbGluZyB0aGUgd3Jvbmcgc2VsZWN0IHdlIHNvbWV0aW1lcw0KPiAtICogZ2V0IHdyb25n
IGFyZ3MuICBUaGlzIGRldGVybWluZXMgaG93IHRoZSBhcmdzIGFyZSBiZWluZyBwYXNzZWQNCj4g
LSAqIChhIHNpbmdsZSBwdHIgdG8gdGhlbSBhbGwgYXJncyBwYXNzZWQpIHRoZW4gY2FsbHMNCj4g
LSAqIHN5c19zZWxlY3QoKSB3aXRoIHRoZSBhcHByb3ByaWF0ZSBhcmdzLiAtLSBDb3J0DQo+IC0g
Ki8NCj4gLVNZU0NBTExfREVGSU5FNShwcGNfc2VsZWN0LCBpbnQsIG4sIGZkX3NldCBfX3VzZXIg
KiwgaW5wLA0KPiAtCQlmZF9zZXQgX191c2VyICosIG91dHAsIGZkX3NldCBfX3VzZXIgKiwgZXhw
LA0KPiAtCQlzdHJ1Y3QgX19rZXJuZWxfb2xkX3RpbWV2YWwgX191c2VyICosIHR2cCkNCj4gLXsN
Cj4gLQlpZiAoKHVuc2lnbmVkIGxvbmcpbiA+PSA0MDk2KQ0KPiAtCQlyZXR1cm4gc3lzX29sZF9z
ZWxlY3QoKHZvaWQgX191c2VyICopbik7DQo+IC0NCj4gLQlyZXR1cm4gc3lzX3NlbGVjdChuLCBp
bnAsIG91dHAsIGV4cCwgdHZwKTsNCj4gLX0NCj4gLSNlbmRpZg0KPiAtDQo+ICAgI2lmZGVmIENP
TkZJR19QUEM2NA0KPiAgIHN0YXRpYyBpbmxpbmUgbG9uZyBkb19wcGM2NF9wZXJzb25hbGl0eSh1
bnNpZ25lZCBsb25nIHBlcnNvbmFsaXR5KQ0KPiAgIHsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5
c2NhbGxzL3N5c2NhbGwudGJsDQo+IGluZGV4IDU5ZDkyNTlkZmJiNS4uYzZjZmNkZjUyYzU3IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5c2NhbGwudGJsDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gQEAgLTEx
MCw3ICsxMTAsNyBAQA0KPiAgIDc5CWNvbW1vbglzZXR0aW1lb2ZkYXkJCQlzeXNfc2V0dGltZW9m
ZGF5CQljb21wYXRfc3lzX3NldHRpbWVvZmRheQ0KPiAgIDgwCWNvbW1vbglnZXRncm91cHMJCQlz
eXNfZ2V0Z3JvdXBzDQo+ICAgODEJY29tbW9uCXNldGdyb3VwcwkJCXN5c19zZXRncm91cHMNCj4g
LTgyCTMyCXNlbGVjdAkJCQlzeXNfcHBjX3NlbGVjdAkJCXN5c19uaV9zeXNjYWxsDQo+ICs4Mgkz
MglzZWxlY3QJCQkJc3lzX29sZF9zZWxlY3QJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCTY0CXNl
bGVjdAkJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCXNwdQlzZWxlY3QJCQkJc3lzX25pX3N5c2Nh
bGwNCj4gICA4Mwljb21tb24Jc3ltbGluawkJCQlzeXNfc3ltbGluaw0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwgYi90b29s
cy9wZXJmL2FyY2gvcG93ZXJwYy9lbnRyeS9zeXNjYWxscy9zeXNjYWxsLnRibA0KPiBpbmRleCA0
MzcwNjZmNWM0YjIuLmI0Yzk3MGM5YzZiMSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNo
L3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gKysrIGIvdG9vbHMvcGVyZi9h
cmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gQEAgLTExMCw3ICsxMTAs
NyBAQA0KPiAgIDc5CWNvbW1vbglzZXR0aW1lb2ZkYXkJCQlzeXNfc2V0dGltZW9mZGF5CQljb21w
YXRfc3lzX3NldHRpbWVvZmRheQ0KPiAgIDgwCWNvbW1vbglnZXRncm91cHMJCQlzeXNfZ2V0Z3Jv
dXBzDQo+ICAgODEJY29tbW9uCXNldGdyb3VwcwkJCXN5c19zZXRncm91cHMNCj4gLTgyCTMyCXNl
bGVjdAkJCQlzeXNfcHBjX3NlbGVjdAkJCXN5c19uaV9zeXNjYWxsDQo+ICs4MgkzMglzZWxlY3QJ
CQkJc3lzX29sZF9zZWxlY3QJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCTY0CXNlbGVjdAkJCQlz
eXNfbmlfc3lzY2FsbA0KPiAgIDgyCXNwdQlzZWxlY3QJCQkJc3lzX25pX3N5c2NhbGwNCj4gICA4
Mwljb21tb24Jc3ltbGluawkJCQlzeXNfc3ltbGluaw==
