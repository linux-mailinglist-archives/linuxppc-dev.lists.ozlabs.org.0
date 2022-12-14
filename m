Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767664C863
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 12:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXDDQ34N6z3cG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 22:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ebqyHBIN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.84; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ebqyHBIN;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2084.outbound.protection.outlook.com [40.107.12.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXDCQ4mFJz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 22:48:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YytPPYKLV1Ur7y6uwdgCUNfTak9QFswXLhQYqRPyeyZS3mAjSn41hXRpGorOPN616K70EGq1lCpBfrBHHXULh5O878RWWXfJ1Sya4/S47XhVnTy1+wJwBE/ECMSlFjDIeDN0JcvpBpGH74jWcMiBguCdQeM2GduUk/Q1QRnJ3NhQOpHiBdzoS0wAN6Sqktv1qjR6lwEFBZyfqX+oDT7/MfCF60AFXHt0HYa8H9qtws+hIyT/K1rzsCvKI8YbwdZK+x4xPGuoLVUASSAPoeSNvITWeTwBwg+baeNdiX6/T49xkV4KwsOqStKh4yKdTHP81rYk5s/adjFAant5FFaRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtrIaYaltBEJvNyoK+CJbUmX52Fc9QDJ0glJCVya1kY=;
 b=MEHVQH/LGD4DfHmbPnBX7IyDWyGLIAr7wwkoVdkcgPiQC/PQh1CFwnvYYgJDFhkunpb+3PTkupWXYPjvce47tTMXDvowB4SkmL+8B5NdCg180B/BYX4zoUpCoRCGzSDv4OWOUElvbcMUBPzrV08Kd5jlukdvU6MkkhNS6NOnhD7REXn9lmNiiJwYVMQ5CWMcqNc8s+TaKJNitYuRDQ0DIGOigypuj9W70CSMCs4UKXkW/jx6Q1rsKxn9R7ivsmcOSovS0nuad0FgooJJMU4UAJeZfojY6GJfZX/bmr3eVhSs770ceTVZTxTIT0d6BWWNGNxcaTwN+7rtg3smKHlWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtrIaYaltBEJvNyoK+CJbUmX52Fc9QDJ0glJCVya1kY=;
 b=ebqyHBIN3+q9aACEjfB6TfL59wiQ6gqiODDxcVxzD+3BL+q4T+lGlfZ2lzUauqp//2F0jVxbHWSw04pmRprbCTpfrAdKZo6VIeES8yVgmhN5zzkwZdIFFyBVmdNa8ISqBl5YP+CbZAuTcvn5+y5PwdkF+blIJNGl15pDspercgCohdmjVFzQMP1nMG8JejtzRCC4GX0kYr4WVRycd4Q9qRHeBLu0d2fckDOgd/peReYnBtJ7o00NVWbQu8liv5Ph9eB1sD7aL7nBJjeG9oPbVXCfIHDiOhQWiOpOqErmHbp3meV2i50J9a8Q1dTVDc96mK5wrhfmxzOSab7thV7xKg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1842.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 11:48:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:48:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Nicholas Miehlbradt
	<nicholas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Thread-Topic: [PATCH] powerpc/64: Implement arch_within_stack_frames
Thread-Index: AQHZD3bMRzKWazF2AEiUNE4WaJ8LX65tEEmAgAAyOICAAAJzgA==
Date: Wed, 14 Dec 2022 11:48:12 +0000
Message-ID: <9fb5aedd-0a6a-8fb2-eeed-82d291455cf9@csgroup.eu>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
 <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
 <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
In-Reply-To: <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1842:EE_
x-ms-office365-filtering-correlation-id: 2dc306be-20da-430d-5ac5-08daddc9142b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KJa7cvmAgVX2GGWmzhIut+8gLEtzmjFPDaoTdoc50lisx+cpirsz0bKc5qPOtpMGTUw1mQ8NwUvQARImh0nAfR3j8eBGUZjGI5wkxKAmudpBevTBRE75gpZ1fih8lM/9tP8QxOMW/b8cJ3sSOTmonXgso7FH0dBPTy3OUSgPdOBXuErKwE7kGmx6tncKPnf3x3n6ejyZkn73lAB1lBang8hwKpwlAokeDgEooEUHsUN2uAs24ITcW48r7z1dTW+9QBLJGdHp5CpXQ1iyv8/OZi4gH+7ec6ezzWECS5jWct2AqoTIY9nl7xAWzuEmFRvFdjwDKJUKCJMZ3onpMJCRdGJxvhqZIZJLxBa/KqFtl+n6qDiJkAFSP3VkiLbE6WJIq2f/F2syJ5HhKsvh9eCyWl1g57wn1pH23YbU5WxtEBMo+uPWPy8PcSeJdb7ERnRpPr8lnLUfQpdiyT1o+OH9l/JFz6CCZUPQstssh7LYwRh3tGXDbjQWndh1SCkH3yNOg6F2fzwPKpI+VPRz4pkoPDQuSpNsYfyecCRIa7MnHd1yGczYOKJV5MzZ04Bd7v0G/8Ld3X/kc9NNHapBvsXD8Ha3nCk38dPwJoGud14PCc1TQ/Gwt4J2IJaI8b7lo7AMrQPlwRHmG8QklcxUFPprxhCJxeLdDqrn5+fXTih8FnDfm0Zk5IoX202s/zfadt4U7BuwJ0mgucuBhJjCT7AqPjCT0/c50xYPUDp2nsjeUhxDe9U8jsCfheJvF7Jv7+6tmCoFGmm9Y6TFM4Ntt3YnKw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199015)(71200400001)(31686004)(6486002)(478600001)(31696002)(6506007)(122000001)(86362001)(36756003)(2906002)(44832011)(186003)(6512007)(26005)(38070700005)(38100700002)(2616005)(110136005)(41300700001)(8936002)(66446008)(5660300002)(66556008)(66946007)(66476007)(64756008)(8676002)(4326008)(91956017)(76116006)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dnZ1ZUgwVEN6SVp4R1RyVE1ReDc5V3NjUTMzM0tOVGhqZmUrNVdKM2ZZRXMv?=
 =?utf-8?B?emFOclJFbEpnWGV4TzlLZk56NHY1bThobDdHSnpvcmtLQTdQaVNhZm1XRVBZ?=
 =?utf-8?B?ZWVjZ2NGOFRIbEVWTWdhOXBWUVFlUUNxdFdRN0JEc1RFZld1cWpvRlhOWm1J?=
 =?utf-8?B?bXJiZDY5Yml5dmdQZEhUalBZY1FlZEdrY25HVUNydU5ieUhzUi81SURDZU1G?=
 =?utf-8?B?eXBUN3lVZmxYeWdacUlHaFgwRTJ0M3NCalIxSzZXS3lKeEtyNHg1N1l4S1Jv?=
 =?utf-8?B?aWQ4cmF3VlZObURERmswc0I3UzNPaXN5a3luOWZPUWVudVA1VTNTZUhqSXFK?=
 =?utf-8?B?UkFWNGErbmRMZUhYakszakRKNVJxNDdLSHhVLzVSR3BlTHE5YnRrUjgyMG9F?=
 =?utf-8?B?M25MUWs5TlIvdEVna3JLaWYxM0NyTlB0d3BHMmtCU1N6eEtNd1MrTTV5RTJQ?=
 =?utf-8?B?dDdlTXgyUjB3cHlQQmN6OVUwbGJKYnRBYXdJOW1xUWJ4SGVUZUVwSTdOempK?=
 =?utf-8?B?VkxISWljdlh1UUg0Mk1ieGpBcHRPWmZJaGJnSFZwaG9oNng3Wk13TDFWOWFj?=
 =?utf-8?B?ZUdQYkJjTEwrY2VhTVpCNzdsMzRmbzQ4Mm5TYTNvY2hTeXBmSmRMOTIvTEVP?=
 =?utf-8?B?Z0dIenhNMTlTejlpVDRjdm8vQ21DNFNoODd6bjNPcTFnVVdkb1FRd0NCV2RT?=
 =?utf-8?B?dWoxYnp3dmFZSzl6eWtOYVFxVVJVejZuUmNOS2lKZ1RZUndLS3JzZTBDMWhG?=
 =?utf-8?B?VjJjMDhxYnlZMWIwMjc0V1dSUDhDUno0eEpoLzFOTFlyVWJLU2M4Y2wwR3Bl?=
 =?utf-8?B?YUk3Q2FiNndLMmlUZ0lRODJyNkZhZURNRUxGemxCYS9xZ2F2YWEzdytEOCsv?=
 =?utf-8?B?Qzg3d2taZUF1eGgyZnNEbHkwWW1qU1lrNDNlVDJsQ1VxQVd3Tm91SnhSOEll?=
 =?utf-8?B?akhtUGQ3VE45cFFtZFhkdmF3eTJHVFpyUmt0cEJ6LzVJd3hDYUp0SVRaR2Rj?=
 =?utf-8?B?VVN0OVhrS0RBc01CZ0RjYUZIOFN0MWFNQWgzS3lrcmdlT3BmQlFkaEw4THBl?=
 =?utf-8?B?Sng5SlF2U1BQWXQ5Y3lPYU5POTF2VFljRG5hL1Y4UVl2aGdOQ0I2b1hFajZV?=
 =?utf-8?B?L0F5c050VmtOVlNldGFIM1cxaEZmR3cwNXZldkt4dHdVd0dLcXN2K3BaSTRI?=
 =?utf-8?B?eitPQUE3Y005ZzlrbTczejBVKzJmTEtlUjRxWk9rcmVBekI3SzdWenNlWHJU?=
 =?utf-8?B?bmFpZW9RVVEzZmlCbnBxU04yNHFxUm16blVHQ3dxZ2lLVEg4ZFVoWmMzZ1k5?=
 =?utf-8?B?V1FsNWxETWxxcWZHM1JJVnZVSElGVlNWWmJISUlMNEtSL21HbXZXdjhiN1Fr?=
 =?utf-8?B?bDNJL0ZKNklJTlRCZWpWVGFFa3FnWnVjNFpEa0RCL1JHUDBDQnRGODlxd25K?=
 =?utf-8?B?clhONFcvU0p5Q25DeS9kbzVEankvNzVoNnRQZVdTZnNPSWFLZVduaUYxWFJt?=
 =?utf-8?B?cDhEVDBHWEVMdklvSS9nOXFTdGRTVnFscFptdnVNK3lvTmtwV2RUVVVSbHlC?=
 =?utf-8?B?QnpYRVdDVW9TZi9LekZMTFdMQ0taQlkraUtOaEE4cC9YSmpLZVRkWkFNcEJq?=
 =?utf-8?B?TzRmOUtBNjJEODdZZGVtRFNCMXJNQURrSnVZTnh3YW04YktFU3FaWU1FUGNV?=
 =?utf-8?B?WlVqdTBpeFdGNXFESGhnbFc5QVVZUnhwTGNFYXRrMG5SOU9OblpQRkNFYVRQ?=
 =?utf-8?B?UmZlTE5SUklHQ3o4emlUY0U3L0J5UmVIQUhkSGRNQTc5US9HUHNrR3E0L0FW?=
 =?utf-8?B?MzhqOEJ3cURPVnFiS1VoVGdBR3M5dU93M28zbGNBaGlWaUJvdHRSeHlPYnBo?=
 =?utf-8?B?SnFJQWtDbXlVcFBETGExb3I3QVhoWENSMGhWMmE5Um9qeXR5eUtDWDFudWJ2?=
 =?utf-8?B?SVh5bXRhYTJBdGxlYUszeFkrdWpBVXdNVnQza2U1dzRIRVlwZ0NyZnNGamlT?=
 =?utf-8?B?d1gwcEVpV3owWjlYR0lvL0I3ODFMUlAxSkcrR3FsMmtoeXJZVVJpWGJyU3VN?=
 =?utf-8?B?anF3WURUVzROSDNmaVJSVlB0dFdJdFg0ejN2aTBQL3VJOFpvSUtCQmd1OVV3?=
 =?utf-8?B?dEtRUzBhRlJ5Ylc1UVFRSzNHNjBTYzdvcFMvcDRBMlMyR2cwV1ZyOEFPN0xu?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <268D9BAA54E4CD41A2D43874A5D6E99F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc306be-20da-430d-5ac5-08daddc9142b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 11:48:12.2585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZffM2BW/I5egZ3ZRilzE5V3Uub9CFCSA8SoYpu9bN3JK0CB0IS/WlJT+2byrq25UazrLUa9LDV9DKOSkkNFdID1B656J/++bKMYH/lula8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1842
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjIgw6AgMTI6MzksIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQgRGVjIDE0LCAyMDIyIGF0IDY6MzkgUE0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTQvMTIvMjAyMiDDoCAwNTo0MiwgTmljaG9sYXMgTWllaGxi
cmFkdCBhIMOpY3JpdMKgOg0KPj4+IFdhbGtzIHRoZSBzdGFjayB3aGVuIGNvcHlfe3RvLGZyb219
X3VzZXIgYWRkcmVzcyBpcyBpbiB0aGUgc3RhY2sgdG8NCj4+PiBlbnN1cmUgdGhhdCB0aGUgb2Jq
ZWN0IGJlaW5nIGNvcGllZCBpcyBlbnRpcmVseSB3aXRoaW4gYSBzaW5nbGUgc3RhY2sNCj4+PiBm
cmFtZS4NCj4+Pg0KPj4+IFN1YnN0YXRpYWxseSBzaW1pbGFyIHRvIHRoZSB4ODYgaW1wbGVtZW50
YXRpb24gZXhjZXB0IHVzaW5nIHRoZSBiYWNrDQo+Pj4gY2hhaW4gdG8gdHJhdmVyc2UgdGhlIHN0
YWNrIGFuZCBpZGVudGlmeSBzdGFjayBmcmFtZSBib3VuZGFyaWVzLg0KPj4+DQo+Pj4gU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4NCj4+
PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAx
ICsNCj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDM4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9h
cmNoL3Bvd2VycGMvS2NvbmZpZw0KPj4+IGluZGV4IDJjYTU0MTg0NTdlZC4uNGM1OWQxMzllYTgz
IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+Pj4gKysrIGIvYXJjaC9w
b3dlcnBjL0tjb25maWcNCj4+PiBAQCAtMTk4LDYgKzE5OCw3IEBAIGNvbmZpZyBQUEMNCj4+PiAg
ICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DCQlpZiBIQVZFX0FSQ0hfS0FTQU4NCj4+
PiAgICAJc2VsZWN0IEhBVkVfQVJDSF9LRkVOQ0UJCQlpZiBBUkNIX1NVUFBPUlRTX0RFQlVHX1BB
R0VBTExPQw0KPj4+ICAgIAlzZWxlY3QgSEFWRV9BUkNIX1JBTkRPTUlaRV9LU1RBQ0tfT0ZGU0VU
DQo+Pj4gKwlzZWxlY3QgSEFWRV9BUkNIX1dJVEhJTl9TVEFDS19GUkFNRVMJaWYgUFBDNjQNCj4+
DQo+PiBXaHkgZG9uJ3QgeW91IGRvIHNvbWV0aGluZyB0aGF0IHdvcmtzIGZvciBib3RoIFBQQzMy
IGFuZCBQUEM2NCA/DQo+IA0KPiArMQ0KPiANCj4+PiAgICAJc2VsZWN0IEhBVkVfQVJDSF9LR0RC
DQo+Pj4gICAgCXNlbGVjdCBIQVZFX0FSQ0hfTU1BUF9STkRfQklUUw0KPj4+ICAgIAlzZWxlY3Qg
SEFWRV9BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTCWlmIENPTVBBVA0KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS90aHJlYWRfaW5mby5oDQo+Pj4gaW5kZXggYWY1OGYxZWQzOTUyLi5lZmRmMzll
MDc4ODQgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVhZF9p
bmZvLmgNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaA0K
Pj4+IEBAIC0xODYsNiArMTg2LDQ0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB0ZXN0X3RocmVhZF9s
b2NhbF9mbGFncyh1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+Pj4gICAgI2RlZmluZSBpc19lbGYyX3Rh
c2soKSAoMCkNCj4+PiAgICAjZW5kaWYNCj4+PiAgICANCj4+PiArI2lmZGVmIENPTkZJR19QUEM2
NA0KPj4+ICsNCj4+PiArI2lmZGVmIENPTkZJR19QUEM2NF9FTEZfQUJJX1YxDQo+Pj4gKyNkZWZp
bmUgUEFSQU1FVEVSX1NBVkVfT0ZGU0VUIDQ4DQo+Pj4gKyNlbHNlDQo+Pj4gKyNkZWZpbmUgUEFS
QU1FVEVSX1NBVkVfT0ZGU0VUIDMyDQo+Pj4gKyNlbmRpZg0KPj4NCj4+IFdoeSBub3QgdXNlIFNU
QUNLX0lOVF9GUkFNRV9SRUdTLCBkZWZpbmVkIGluIGFzbS9wdHJhY2UuaCA/DQo+IA0KPiBJIHRo
aW5rIHVzZSBhIFNUQUNLX0ZSQU1FIHByZWZpeGVkIGRlZmluZSBpbiBhc20vcHRyYWNlLmgsIGJ1
dCBtYXliZQ0KPiBhdm9pZCBvdmVybG9hZGluZyB0aGUgU1RBQ0tfSU5UXyBzdHVmZiBmb3IgdGhp
cy4NCj4gDQoNCk1heWJlIEkgc2hvdWxkIGhhdmUgd3JpdHRlbiBfYWxyZWFkeV8gZGVmaW5lZCA6
DQoNCiQgZ2l0IGdyZXAgLW4gU1RBQ0tfSU5UX0ZSQU1FX1JFR1MgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtLw0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3B0cmFjZS5oOjEyNjojZGVmaW5lIFNU
QUNLX0lOVF9GUkFNRV9SRUdTIA0KKFNUQUNLX0ZSQU1FX01JTl9TSVpFICsgMTYpDQphcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcHRyYWNlLmg6MTM4OiNkZWZpbmUgU1RBQ0tfSU5UX0ZSQU1FX1JF
R1MgDQpTVEFDS19GUkFNRV9NSU5fU0laRQ0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3B0cmFj
ZS5oOjE1NTojZGVmaW5lIFNUQUNLX0lOVF9GUkFNRV9SRUdTIA0KU1RBQ0tfRlJBTUVfTUlOX1NJ
WkUNCg0KDQpDaHJpc3RvcGhlDQo=
