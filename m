Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4465785053
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 08:02:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XVrm713R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwc94F27z3cBH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 16:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XVrm713R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwbG6gzvz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 16:02:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ+slnKlLVVjVoV6uKJrqaVQM0ExlRmrEcQ/lSQMMGLPe9fZmPx0PKKmBmeMM3PUVPKOBsbQoAQXuQbY735HiPah1luMGuAWEIgUQvDbnKl5bNgg4Q53gaT3rUWWT0kphdYy9Mc9m+fdP62HR2tY3K25mMAIoQqResvj3RRVKjYCOCxpqP/gDsM17tSH/6s+AUp+w0zh26zljnG1aghrb6nrp9WAVfh6xhKcZCtcprWl+eJ+mM62uHmTer4FCHv04sWuBQGyqc+wOk1BCXkCjiJIhX+qzJX1XcesEZIKSelgE+nWD81lH5b0i7jnu9oC4I7faBVfgLIf2nprScLtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8MBsLBEJ1yEmmlGN4D3GBwIiCgCI0PaSPmKJF0F+C8=;
 b=ifZf4Am+dA2ZahbLp6KL3/yHC+2CS0Ud7cqYTPiPCYB+GeYG0C00w3dj9cYqaJAaz+QsQgAIK0azTYbGQ0dUPKWXWjFFG48/zSF73BrTQEyo30o2+ce8ctCmszlgZpPdLuyIPJCYvoREdOc3f+xBO7YbyM99SvxAEvPcXETlh+82K9/09MjU4yiTnK6AX02EZiuss9euiAAIg7PFQMz8DA65NzWicuTc/R2b+Exo0pVN4P/MnUawobg6lhZ++5jg3etB9G6kdnzvHqjJEIbazABm3xyJ2OK2qTNxew12vIgN0w/P4gXRsWBtrjHHkAZF6m2l1QlYP78zypj+ZGQ0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8MBsLBEJ1yEmmlGN4D3GBwIiCgCI0PaSPmKJF0F+C8=;
 b=XVrm713RwdqWuP//wE4giWw2PYO+xvjzq2gFNKl7t9EZVLU/S+/YEiMf2BOXgNlIgQsxykoaD6OWa+8+dMuu4nUD/HqTnFv2+Q7z5ZYKWBcr/1dj+C7YNGaY1zL6YBqE76s+CxPPfTrusCYPLIKcWolfeumeAh74tFidp3NKilDMltL5UACjvvsT0sSQuji/Z4W9iz5REFm7iLow9MOIssyNWL/Mxlb+hCt3BiWEXZEyKHhOzxDAdMFayd0uryZ4y9xeBLGq6sHVDEvMMmWLrn2v94h/k2Eww5a0Xtt4RxAbeu8CpiU/GT/L0a0m9ZDCZdZ/wxiYMDjwexTvIs8lzg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2305.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 06:01:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 06:01:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Drop zalloc_maybe_bootmem()
Thread-Topic: [PATCH] powerpc: Drop zalloc_maybe_bootmem()
Thread-Index: AQHZ1YZP3bsF4u+EP0WXhh6gli8H0a/3Y4IA
Date: Wed, 23 Aug 2023 06:01:38 +0000
Message-ID: <de61fde1-2eac-d7ce-8dfd-e3fcb989a00f@csgroup.eu>
References: <20230823055430.752550-1-mpe@ellerman.id.au>
In-Reply-To: <20230823055430.752550-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2305:EE_
x-ms-office365-filtering-correlation-id: ca4c8356-31d4-4c0f-2f1d-08dba39e6a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MRLA2wbd7PLvygAMBbZZyO2FSmdoyGaTnWea95vUEDz6VS5gEAQ5VE348EXQsght3Da5pMA82v3ktfOcWSPNz9ieoAlr71HomaofR/jP0PjbL/Tp1XWxzOqsYgLDPDqsCNvwn8WoMy+DmWUeNjEgCfkz/wyg5d7PlBZ3tgjD/2SlOQ62ME1qZL3hZeSo8uW4EhEad3dEDd2lrRSNXUXxCJ2FLR9fglZWiaBYqfn8V8aASfddkTcfbzqxLavSJ9i0vJW84/iIdNIVs6ql3X68cqxOpKsfmlCDnIZyP3QrwzNyFy0/adlYLS0qZD9h/YtxYfCRqe59XAPBkCHkWaXKQNJgJqa/s/GwMOVqfL54p9Ev1PNa7QBCwpVrItBYczmGwIGPf8LsSiGfnfNoBlNuJUpvbny4PbJpiWkBTrTubvU5NZgCAVGr0i1n5yTEwwO9ZhqS89a5ES6A5AEgvig/JM1CQEPHhU9ShEm1SvYtdHsUnv8cI4KpLH5Fzs2Ssb+6MvI2k48J5KEAEWxI9CRGfTQINDc/rOidSLHye6RIN6FxsVzyPRCu5rc0usiU7r1Vb10nJ+/F/6QYJt4tWIq2QC+9zAfByjGyANx9lWxAYDEm5QGfi3I74cN74KX+05oPZXO0JJyDUL/UmgJjx7OuE42zWads0SN5jWy1PNOdCO9FRVuKJVzfwRMqNvMgxFts
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(346002)(136003)(186009)(451199024)(1800799009)(2616005)(6486002)(6506007)(316002)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(110136005)(91956017)(6512007)(41300700001)(26005)(44832011)(5660300002)(71200400001)(478600001)(31686004)(83380400001)(66574015)(31696002)(36756003)(86362001)(2906002)(38070700005)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0JIeXRsYUttNFVyb3A0V3J2MHB3YzlEQmFtZldDNGp4U01NQnVGQTFMUGZm?=
 =?utf-8?B?MXcvdWkxZnVsQXFDTUtFMzBmbi8wcnp3Q1pwbExod0dtNDI5NjVOR2NCNmVU?=
 =?utf-8?B?UVRvcE4rbWlBbmFMU3A5bHhnZjZaZlJxYTZLSWFqZ2FQTG1JOHFCMlVlWDZM?=
 =?utf-8?B?bjY0eXp4S0FVaDMwTnV5SGFTSVpCL2pueXZZZGlPNGUwMFIwUE1kcVhGeXFO?=
 =?utf-8?B?MTh4TlREQisra3hFbVdTazdST2Z1UUNUaVZYVXJrYTlnZVhwQ3ZRRC9WUlZE?=
 =?utf-8?B?VWd0Y2dESGR2M1IxcnVCS0luWW9GaDJoMnNodThldGQ4WmNjYjRIampkSFNP?=
 =?utf-8?B?VU9sZVBKRG9CTG1kMkMzWVh4ODA2LzhTSUo4RzJLeG54N2p6aTdLUEpvbnB2?=
 =?utf-8?B?NnFpKzNzQ1dKMXQweTNwOFA5bmV1V3oxKzdQZUdkc3RqaUMrVzM2UWtCZEx3?=
 =?utf-8?B?SWVaV2hTQWtRNHhsSlNwZjk0TXl2Y2dpMTF6b0FuUUhERC85aExJYUVPdk9q?=
 =?utf-8?B?OU4xQ3ZsdlpVN1ZxV1JHOHcwZ0xFUGd3bUYyTG40WmdOYWxiSU1ORUdzbDd0?=
 =?utf-8?B?VFI0L0JuS1YxL3BTWUdNQTdwQ1VxQnExRk9LZE1zcmV3UzVWZ3Jpa205aWdN?=
 =?utf-8?B?RVV4ZHJtbUJaK0p1dVVoeWFpK1p3R0xqNUtmMEFiblhtUVc2VWlFV1BQMWJ3?=
 =?utf-8?B?eVNEQVRnUUxMWnI2NUF3MDlNSDJlMU15Qm5vNEZuTVlCczhqVkhibGZtcWVL?=
 =?utf-8?B?bUNoeFB2N09UNUNZb0RkdEVramVsOWV6cDdoL3JWUTZ1VFduQnYwbmVXSzVZ?=
 =?utf-8?B?SExiNys0djM2N1ZJY1ZZMjF5YXFZSFhwb0xxS29sSTJXOUpTc21zRHNSMFpv?=
 =?utf-8?B?aVBockVCZlRTVTlPMm9RUk5EVm1FblRoUlB3M3EwRjVodkRmUVdrSmdqWm1x?=
 =?utf-8?B?TCtKWTVjajJaQ3FqRWt1dFJRSFVwNm5NdW1HYXBvTVdGNyt3QlBuYVVnK1lx?=
 =?utf-8?B?QUMwY2FxbTMzOFJRYzNVQUFTMTgzM1FoMHlBQTVRVzZIUEhyd0czZnpsOXgx?=
 =?utf-8?B?K0lucm9lWHRIcVpjNmUwN09uS0QxT0dLVlBWNWVCeXdEeFA0SHdMS2pHRG9L?=
 =?utf-8?B?Vk9mQmJvNG1ydHdLUzNvaU1jZTBwMjNJN2dzY3NoL2dEMTlmY0I1L1lhM0Yz?=
 =?utf-8?B?bElaeGhSbGRQdTI0NHYrbWhhL1NIMzBuZ1R3ajVKOFNFMTk2UWJWdFVBdkll?=
 =?utf-8?B?OWJ5eEVOeGc1QVNHR1FtK2Z4WTJic2NyOWZuQUpLS2tmb0tLcmJtUDcyREFJ?=
 =?utf-8?B?MWhyWWQ1a1VxT2FaK2JmVDU2Nk1BNjZWbHJQN1RnYjE0THhycjQrZDZac1RH?=
 =?utf-8?B?M3l3UTVwWXVCQzlyZEJIc2o1VU9Fd3Z0ZVc5YUZLVU9xL3BJQVoweHRqYXNW?=
 =?utf-8?B?UGFkakozVlRxOCtINjZ3bVU4U1d3dklvR2Fqdk8vbTR0VmJiRUpLREhKbnlJ?=
 =?utf-8?B?VEJDUEJHNWdkTVdUQjJORWFiak40YXA0NFRJeG9XTXp1VlE3a0lueDFwcncz?=
 =?utf-8?B?UlN4N1NvWDMwdU9yV2h0Yno0a0JBcTAxOWxpc1N0R0V3Y0xBNUZ3VlJYVFVn?=
 =?utf-8?B?MGNiR2xQWFJHdTJ6M3dseThSeVRRZlNkVWF0eFdlS0o3NnRpd0pURUliRVVi?=
 =?utf-8?B?YnJXQldWQ0tXZ3BFT3VTMzRpTks4OTNid1FzcFl4UEdzNHJ1SHd3cU9IWDhw?=
 =?utf-8?B?NnJrUWp3aXV5Z2YvTm9yZk11TUFVMzRhZU1IV3duTXhwWm16RU1wZG9HQUpw?=
 =?utf-8?B?TVdINTNYZzQxQjJCYjgxNnRrVVJYcW9aekdMS3U5RHc5ZzZxeDhtcWlHb1I0?=
 =?utf-8?B?OXJoejRRWU12eTcveDBKUENHTG9HampKMGlvYTJUMmJqWENtOUlUYlVlV3dl?=
 =?utf-8?B?THc2YllLR2N3NUliUjlsTC96clBjcnpobXRoTTZZSnptY2d6WUdlb2FDaGpR?=
 =?utf-8?B?TWU5aGRVdFA5NkJiZURZN0ZEdmo0cW5JRUZnNmlKU2lYWk5LRnZCdkxpc2Fz?=
 =?utf-8?B?RXYrenA0NzFQVm1hWW5kcGJ6SXJRUk53VVVrRjVnMldueTBDV0c0QStjWGow?=
 =?utf-8?B?Tk1FVVViZ0JKU25CWENYYnoxNDUyR2JHemZ2ZEV1NGJERG9hRW1heFRRNmd3?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA3B0184D946434E9B8B33FC7907801A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4c8356-31d4-4c0f-2f1d-08dba39e6a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 06:01:38.4998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIZFoHfaSmGBkS3U5ayBtKPETTgPDz4OwWKKcZw0u1EK+gLOnbIzox2ul+uLFgCvYbmvlQT1bhqnvd6KqDSLD8Yzb209Wp8s+NEpfV5GAXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2305
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

DQoNCkxlIDIzLzA4LzIwMjMgw6AgMDc6NTQsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gVGhlIG9ubHkgY2FsbGVycyBvZiB6YWxsb2NfbWF5YmVfYm9vdG1lbSgpIGFyZSBQQ0kgc2V0
dXAgcm91dGluZXMuIFRoZXNlDQo+IHVzZWQgdG8gYmUgY2FsbGVkIGVhcmx5IGR1cmluZyBib290
IGJlZm9yZSBzbGFiIHNldHVwLCBhbmQgYWxzbyBkdXJpbmcNCj4gcnVudGltZSBkdWUgdG8gaG90
cGx1Zy4NCj4gDQo+IEJ1dCBjb21taXQgNTUzN2ZjYjMxOWQwICgicG93ZXJwYy9wY2k6IEFkZCBw
cGNfbWQuZGlzY292ZXJfcGhicygpIikNCj4gbW92ZWQgdGhlIGJvb3QtdGltZSBjYWxscyBsYXRl
ciwgYWZ0ZXIgc2xhYiBzZXR1cCwgbWVhbmluZyB0aGVyZSdzIG5vDQo+IGxvbmdlciBhbnkgbmVl
ZCBmb3IgemFsbG9jX21heWJlX2Jvb3RtZW0oKSwga3phbGxvYygpIGNhbiBiZSB1c2VkIGluIGFs
bA0KPiBjYXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBl
bGxlcm1hbi5pZC5hdT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vc2V0dXAuaCB8ICAxIC0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3BjaS1jb21tb24uYyB8
ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZSAgICAgICAgfCAgMiArLQ0KPiAg
IGFyY2gvcG93ZXJwYy9saWIvYWxsb2MuYyAgICAgICAgIHwgMjMgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9wY2kuYyAgICB8ICAyICstDQo+ICAg
NSBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvbGliL2FsbG9jLmMNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9zZXR1cC5oDQo+IGluZGV4IGUyOWU4M2Y4YTg5Yy4uZWVkNzRjMWZiODMyIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2V0dXAuaA0KPiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vc2V0dXAuaA0KPiBAQCAtOCw3ICs4LDYgQEANCj4gICBleHRl
cm4gdm9pZCBwcGNfcHJpbnRrX3Byb2dyZXNzKGNoYXIgKnMsIHVuc2lnbmVkIHNob3J0IGhleCk7
DQo+ICAgDQo+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgbG9uZyBtZW1vcnlfbGltaXQ7DQo+IC1l
eHRlcm4gdm9pZCAqemFsbG9jX21heWJlX2Jvb3RtZW0oc2l6ZV90IHNpemUsIGdmcF90IG1hc2sp
Ow0KPiAgIA0KPiAgIHN0cnVjdCBkZXZpY2Vfbm9kZTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvcGNpLWNvbW1vbi5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wY2kt
Y29tbW9uLmMNCj4gaW5kZXggZTg4ZDdjOWZlZWVjLi4wNDAyNTVkZGI1NjkgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcGNpLWNvbW1vbi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvcGNpLWNvbW1vbi5jDQo+IEBAIC0xMjUsNyArMTI1LDcgQEAgc3RydWN0IHBjaV9j
b250cm9sbGVyICpwY2liaW9zX2FsbG9jX2NvbnRyb2xsZXIoc3RydWN0IGRldmljZV9ub2RlICpk
ZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgcGNpX2NvbnRyb2xsZXIgKnBoYjsNCj4gICANCj4gLQlw
aGIgPSB6YWxsb2NfbWF5YmVfYm9vdG1lbShzaXplb2Yoc3RydWN0IHBjaV9jb250cm9sbGVyKSwg
R0ZQX0tFUk5FTCk7DQo+ICsJcGhiID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHBjaV9jb250cm9s
bGVyKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmIChwaGIgPT0gTlVMTCkNCj4gICAJCXJldHVybiBO
VUxMOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZSBiL2Fy
Y2gvcG93ZXJwYy9saWIvTWFrZWZpbGUNCj4gaW5kZXggOWFhODI4NmM5Njg3Li41MWFkMDM5N2Mx
N2EgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvTWFrZWZpbGUNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL2xpYi9NYWtlZmlsZQ0KPiBAQCAtMjcsNyArMjcsNyBAQCBlbmRpZg0KPiAgIENG
TEFHU19jb2RlLXBhdGNoaW5nLm8gKz0gJChESVNBQkxFX0xBVEVOVF9FTlRST1BZX1BMVUdJTikN
Cj4gICBDRkxBR1NfZmVhdHVyZS1maXh1cHMubyArPSAkKERJU0FCTEVfTEFURU5UX0VOVFJPUFlf
UExVR0lOKQ0KPiAgIA0KPiAtb2JqLXkgKz0gYWxsb2MubyBjb2RlLXBhdGNoaW5nLm8gZmVhdHVy
ZS1maXh1cHMubyBwbWVtLm8NCj4gK29iai15ICs9IGNvZGUtcGF0Y2hpbmcubyBmZWF0dXJlLWZp
eHVwcy5vIHBtZW0ubw0KPiAgIA0KPiAgIG9iai0kKENPTkZJR19DT0RFX1BBVENISU5HX1NFTEZU
RVNUKSArPSB0ZXN0LWNvZGUtcGF0Y2hpbmcubw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2xpYi9hbGxvYy5jIGIvYXJjaC9wb3dlcnBjL2xpYi9hbGxvYy5jDQo+IGRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCBjZTE4MDg3MGJkNTIuLjAwMDAwMDAwMDAwMA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvbGliL2FsbG9jLmMNCj4gKysrIC9kZXYvbnVsbA0KPiBAQCAtMSwy
MyArMCwwIEBADQo+IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiAtI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+IC0jaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiAtI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC9tZW1ibG9jay5oPg0KPiAt
I2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPg0KPiAtI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiAt
DQo+IC0NCj4gLXZvaWQgKiBfX3JlZiB6YWxsb2NfbWF5YmVfYm9vdG1lbShzaXplX3Qgc2l6ZSwg
Z2ZwX3QgbWFzaykNCj4gLXsNCj4gLQl2b2lkICpwOw0KPiAtDQo+IC0JaWYgKHNsYWJfaXNfYXZh
aWxhYmxlKCkpDQo+IC0JCXAgPSBremFsbG9jKHNpemUsIG1hc2spOw0KPiAtCWVsc2Ugew0KPiAt
CQlwID0gbWVtYmxvY2tfYWxsb2Moc2l6ZSwgU01QX0NBQ0hFX0JZVEVTKTsNCj4gLQkJaWYgKCFw
KQ0KPiAtCQkJcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJXp1IGJ5dGVzXG4iLCBfX2Z1
bmNfXywNCj4gLQkJCSAgICAgIHNpemUpOw0KPiAtCX0NCj4gLQlyZXR1cm4gcDsNCj4gLX0NCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX3BjaS5jIGIvYXJjaC9wb3dlcnBj
L3N5c2Rldi9mc2xfcGNpLmMNCj4gaW5kZXggNWY3MjE5ZGYzNWVmLi4zODY4NDgzZmJlMjkgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX3BjaS5jDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9zeXNkZXYvZnNsX3BjaS5jDQo+IEBAIC03NjcsNyArNzY3LDcgQEAgc3RhdGljIGlu
dCBfX2luaXQgbXBjODN4eF9wY2llX3NldHVwKHN0cnVjdCBwY2lfY29udHJvbGxlciAqaG9zZSwN
Cj4gICAJdTMyIGNmZ19iYXI7DQo+ICAgCWludCByZXQgPSAtRU5PTUVNOw0KPiAgIA0KPiAtCXBj
aWUgPSB6YWxsb2NfbWF5YmVfYm9vdG1lbShzaXplb2YoKnBjaWUpLCBHRlBfS0VSTkVMKTsNCj4g
KwlwY2llID0ga3phbGxvYyhzaXplb2YoKnBjaWUpLCBHRlBfS0VSTkVMKTsNCj4gICAJaWYgKCFw
Y2llKQ0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICANCg==
