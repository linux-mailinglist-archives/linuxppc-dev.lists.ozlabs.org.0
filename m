Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74425591D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTlvb5wCrz3dQb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:25:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jx8j5ef5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jx8j5ef5;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTltv13Rzz2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:25:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPldU+OZ47M1EjjgbrgctC721eE0z92/j3JUU+D8Xlmof5TSB6VJEgoKaPClu/JwAcakRADCQ/HfJJofKOMCmy51SxS8Me1m5Ie1ZXo5wFO0FlFqOFMKo7TgY5lCndRjr3S9kkmCkf1FDYTs3r6OsotiVZVSa03IYGyVtiABcC4lIb6aFCSvtO5BB+zakSPgoM3UQyM0k/BZrPsxVOMrcGGXNtJzmdbXcFSTdi/l0b0mGMxKZ1zZqx/SYQzNbnHHuRk7Xf9ST1PzvzzPCMeMuSB3RNgA1p98SS+35GWHjhXsQRkjRMgMqQQ8zTwg8rr/wPoBIGx0oo/RbtHS24WQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of7ksJ3KvF+/Ehv6fPZP2y9ZWD5ECCCVvRiiO/MS3p8=;
 b=eSP6YSqINDjxq7yfXQkSeEHJpNMCUJa1qtzYJE2+dx1cvgL87lPl3qDo/4BT8NmidxaM+qniGSzo1pU0GyBL14IB34wa8+u1tMaw4dBLOVvn7azUEMSFPkt6D2pHbRl2L5rXDxd4y4v4JjJbK53cJmBTUV5ZHxQbJDVDlllMKa0JR8TYsjc8f699OWKvqj1yHPrP1pP+Ts1l4sz+A4IWTbmCOeoryjr7rjOUpvSk6EarSPvFAI6xN/stCmMe9cBmavJ6P6UJx5tOviNLGyASUAZV7IL6Ry9+xwRBQgDPWHyT0GT7ZqqisW2AnXlBouAWSdibNSk0ujMtmhJ/o8DkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of7ksJ3KvF+/Ehv6fPZP2y9ZWD5ECCCVvRiiO/MS3p8=;
 b=jx8j5ef5mpRkGwD6b80wLekDwWj8EYNpZHV1VcSaRe78EJgiDaMQe7rfbIHsPKRflqQx4NlZ2exVB18wLP+krRMcPTbS20BnaaicT5zyjmGRRUSLG3EDsvrn74HdNMD3M3dv3GUk4q+Y0Xa1DlOfZm3/FUeaOdZ2lC4iIY0awwLfD6EIJ6ysf1lEHVLrIp9IjlvMnstiHnFFc1MAolL9RcRBXS9sLN8DYdM/853JYL2v0GRS5ehR9OV7GVQRleAXBoiWWBDW2EATFjyNAkaI6K0hhyzogbcbA9/UjyfW3tw/4ihq90B6wnoKW6PcxhmiUTl9HrxRSxh+7uYIqTTUnQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 05:24:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:24:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 08/26] microblaze/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 08/26] microblaze/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYh4UrggW5hyzDL0uck53DlB2Sy61eBmYA
Date: Fri, 24 Jun 2022 05:24:50 +0000
Message-ID: <3cc86db1-d1fe-0fb7-1108-6062bdfdb0cd@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-9-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-9-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a975a821-aa9d-4936-3082-08da55a1dc95
x-ms-traffictypediagnostic: MR1P264MB2882:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UYp1WbwW51GjLsSdvn6ZRYYDbgA8dDxPMkKrzR9iPsC4WxvbJUmSzgV85btvF70po0+z3SwUG2KPOfaZjerM42cK5pwGppopAPVHiU8CeJnkgbPpdOH/1ZHH2euBD87+eDBths9tjm515SSiqMF0OrnHXfhp7LPlRSIDHBGETEH5SlKaJdyJ5DeW9yq8NggMldrsyginZImJ90CMPxDr3sXGBEUGVBOOzb1Czit1VjBkaPgw4vMPDQ5Qqi76Fai1Kcx1m9JQoHa1g5UNyQLja5/dY5soClgH3elipI91rAvARq44cpEla7Ie1A+ZkfwBC78JH0S9pXfClszN3CgBJnYoDOL9xNmCGiI/o02ZsPshLMFysKq3O6CrGJKEfrWvYRc5H4VkqmJItz8y5pInlFf6sdAQ0tpBtuEdQCrgKIlpCBAKiRMxMscYiy7cmjPr7grQEgwZkqLIDbcA8uDzwyPUC66LwJWSoEmggewzMRDX64YAnUPkozN0UL+2FigzgTK0Dbp7bQr0jEicn2jZ1kTcJyQ/EWxODFTwjmIT8aqGlsRsekdvmQAl0ciLjPNV6oVJJyMt7zq4FhZ0A4btQeQ4EGTAnXCvhJ4ObY/gILSqcpWp+eX07LLhawxo8dAStb8arqTdAm1EcCbA7z28X6d8FPx5RtKdOTjXAPfUNw8Da8/8iZKLHna9ebKByAurOAHXGWtUDlYUXx+SvHiCkC660HjE/OjKj7CtlD3GbeoX/DiLPivMCegE2Dic7f3yxRdOHBJhAcNLi1aSbdFpxcpRlHg7pDOv8MLNHZbz8xcchXWg9LOXS+Kcp7wSjwQ7Zb/EJAqL5nDZyrXeXzWu2NOZIwspoJ0REyT/p0xqYkg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(2906002)(6512007)(31696002)(26005)(31686004)(6486002)(478600001)(38100700002)(6506007)(91956017)(8936002)(71200400001)(86362001)(41300700001)(38070700005)(2616005)(5660300002)(7416002)(186003)(122000001)(110136005)(83380400001)(8676002)(66946007)(36756003)(44832011)(66446008)(66476007)(316002)(54906003)(76116006)(4326008)(64756008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Qk90TU1zK01HREhaWVVINUZYdWxydUdoenpPbWxqcHluWUExZzdhaGh0cWZr?=
 =?utf-8?B?RFFxL1ZiUitYc1lqSHlyM2ozTnkrVjFEQWcvdGdVSW41Snhka0dZNW1aS2FP?=
 =?utf-8?B?VWFlZzlWVzdzaWdHdDZHMmFzcDZySDFCTjZReXBFenQ2bG9WN0U3ZTVOVXdt?=
 =?utf-8?B?cWg5elRQWllkaW1CWnpic1M1QkNFQXM3OXRUVFd6azd1STg1MHNFTEpiQ1ZS?=
 =?utf-8?B?WFRYV0lTRzlZeEQza1BjdWNNd2RrSkxmME8wRVBhUDhmem5jcW1WQ25CUnZU?=
 =?utf-8?B?K00zcTdZU1Rxdmw1ZFlJeDAvYjRaRWxPQWJGSFppR3JVWnJaS1hWUUdoSlZz?=
 =?utf-8?B?cVhUS2JWQWVVZTlrVnRSM09FanRaK08xNUZHdkZWY1lkOGdHUXhydy83NjZM?=
 =?utf-8?B?eEpNSkxlRmF1SUVxMWJwTHlHWldqTkdPc0Mvak5pbXJqVmY4cndwNXdLUnhS?=
 =?utf-8?B?V1JmM0NzUzc2elUwMUNOTVAzaEJGREQvZEtobks4THhpeWVtOGpRUUhDajlR?=
 =?utf-8?B?a2gzdkNOb05vSXNERll4UFBjOFlNSytPeWR4MXp3cG1uSFh0TWs5L0E4cW5S?=
 =?utf-8?B?QVloUHdZSFhDVlllak5NK2JWSElLaDhVTDRjYU42ZnN1d1lzWVUwMElLa2hi?=
 =?utf-8?B?STdXTXFBK0R2b2UvY3FmU1ZHVCtocG1ubThySytlNEFMY09HenBLS2djNk9Z?=
 =?utf-8?B?RHAxV2oxbGZodjhxNndJVHdGL0lOV1V6dDF5TDYwMzJycmVaY3ZSL3Jjck5m?=
 =?utf-8?B?TGxLR0dmdStBRlQyMGw1NkxPV3U2Ry9LMXhjZXZidjNwMy9pUTBwZERRSUJC?=
 =?utf-8?B?MHFoUDhsZFNxUnlNT3lnYjFqYWhabmU2YzJuNGJZTTlZSmFNU2lDZjV3TDhs?=
 =?utf-8?B?YnNob29KbjMvSDd2dERnR3lSWmtiRi9tUHJycFZ5NXhnK1dYVzl0b3pYY3BP?=
 =?utf-8?B?dHQ0czMrNVpKbWJMd3lTbHpkWXBtZFgrQ3RuQnltL2FjSk5hQzdVbUpRWFdo?=
 =?utf-8?B?OFZ6SXE2UlZwdWZpME1MeU42cldVRDErM28yQitLUllwN1p6ZnlvNytpcjVW?=
 =?utf-8?B?OFNiejRuS1J4REtmS29IeGh5ZlhKTU5ZTFUwM2JUVkgzV29pZEtlYUNkQUVh?=
 =?utf-8?B?V2lWREtoaDhVclRpSEdWWEVtUUlkQ1RsMys4b2ltRXRrZjJWTjY2L282TTlo?=
 =?utf-8?B?TWh0dTBhZ3Q2ZjBkMkRmMHR5Um52dFQ2TEVkV0dud3ZpMGlZNW4vV2k1b0hO?=
 =?utf-8?B?UE5SRGY3QlpyK2lKczN0eFN3ODhjMjNISUhLbmdIYmYzaDBaamVIbCtUaHph?=
 =?utf-8?B?bGxGTjFlL1lyUS9oRmdsYXN2bDljQVI3N0N6MFRNQ2UxMU9Mam5GWG5Hb1lM?=
 =?utf-8?B?WWErWW5nQm1nTklWYTYwand2czgvRnNhNHZ1MVNmeWE4RUdibjJiWHhuYVpJ?=
 =?utf-8?B?azIzYy94dFI2azZ0UThaT0pPS1Zjb2lKdXdrSjhkR1RtT0QwbUVOOFlXNlUz?=
 =?utf-8?B?cGZzK2dWcEpaUHhPOGl0VUJzZks1VzNpVm0waU5PUHRqeDZXY1hYYU9FdE9t?=
 =?utf-8?B?U2NWSTIya1p1ZFgvYzRCbXBacEJYQUlpQ21nejZROGl3RG5wWjhMQXNpMGl1?=
 =?utf-8?B?TEtEcm1DT0RhQmdDbzM1NWpxUlQySWM1M1RDdWp4OTA2bVBMOFMzYUloSHZD?=
 =?utf-8?B?TEpVYzFoa2EzaW1qWUR4THRaQ2FNM0g4M29yRUs4MDh0cmZ4dWo0blFDeEdN?=
 =?utf-8?B?ZCswcnlqMUo4ZTJhTkhwWFdZQTVsazNDVU15d0pXUHFocjBZQmlhQjVQbGlQ?=
 =?utf-8?B?WkdtOUlqLzdCYUc3TmhQR05IdFIyTG9aY3YyS0xSTlhJNUpoRVFneFc1R05p?=
 =?utf-8?B?cDVwTW9QUVFMZ2w5RWFFWFdNbDBwQlZzUWtEdHBzZVhOck9mTGJkelFoUjNE?=
 =?utf-8?B?YU1HRHdtWGxUQTZXTi8vblVLOWNHVEpteFQ3dm9xcVRHTTJlSDdMa2h3Wkt1?=
 =?utf-8?B?eG1kcW9RL0tidENOQVU5YXdGU0ltMXFnN2pXc3EvemZaVlQrSVBVQkRtWkho?=
 =?utf-8?B?ejh2eGN2RE5KdEk1TUxNdHRMOVhCa3dFbTZ0U2c2UnlaSm5EeVIzalVLR3ND?=
 =?utf-8?B?QVhIT2pBdkhwelZZT0dBT09yRFVaTVI4elVRUGVPR2NpVlc0elh3Y2RNSGxw?=
 =?utf-8?Q?pk8zVvlPov8as04gQ1OAifs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C55664F560E7C74B8A9EB94CA7A1A527@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a975a821-aa9d-4936-3082-08da55a1dc95
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 05:24:50.4893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHrQP48C2M5RLfElaLPgucgo81duZdqdDKaw8Gev5nmAMfNXExnR8i34wIFTENhCmG6AQ012D1sMyDKeQnr60+Rvo7B3NxnNl4p/7+He/DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2882
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <
 monstr@monstr.eu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMgZW5hYmxlcyBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UIG9uIHRoZSBwbGF0Zm9y
bSBhbmQgZXhwb3J0cyBzdGFuZGFyZA0KPiB2bV9nZXRfcGFnZV9wcm90KCkgaW1wbGVtZW50YXRp
b24gdmlhIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVCwgd2hpY2ggbG9va3MNCj4gdXAgYSBwcml2
YXRlIGFuZCBzdGF0aWMgcHJvdGVjdGlvbl9tYXBbXSBhcnJheS4gU3Vic2VxdWVudGx5IGFsbCBf
X1NYWFggYW5kDQo+IF9fUFhYWCBtYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxv
bmdlciBuZWVkZWQuDQoNCkluIHRoaXMgcGF0Y2ggYW5kIGFsbCBmb2xsb3dpbmcgb25lcywgY2Fu
J3QgcHJvdGVjdGlvbl9tYXBbXSBiZSBjb25zdCANCmluc3RlYWQgb2YgX19yb19hZnRlcl9pbml0
ID8NCg0KPiANCj4gQ2M6IE1pY2hhbCBTaW1layA8bW9uc3RyQG1vbnN0ci5ldT4NCj4gQ2M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hh
bmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvbWljcm9i
bGF6ZS9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgYXJjaC9taWNyb2JsYXplL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9taWNy
b2JsYXplL21tL2luaXQuYyAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvS2NvbmZpZyBiL2FyY2gvbWljcm9ibGF6
ZS9LY29uZmlnDQo+IGluZGV4IDhjZjQyOWFkMWM4NC4uMTVmOTFiYThhMGM0IDEwMDY0NA0KPiAt
LS0gYS9hcmNoL21pY3JvYmxhemUvS2NvbmZpZw0KPiArKysgYi9hcmNoL21pY3JvYmxhemUvS2Nv
bmZpZw0KPiBAQCAtNyw2ICs3LDcgQEAgY29uZmlnIE1JQ1JPQkxBWkUNCj4gICAJc2VsZWN0IEFS
Q0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZP
Ul9DUFUNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UNCj4gKwlzZWxl
Y3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJDSF9NSUdIVF9IQVZF
X1BDX1BBUlBPUlQNCj4gICAJc2VsZWN0IEFSQ0hfV0FOVF9JUENfUEFSU0VfVkVSU0lPTg0KPiAg
IAlzZWxlY3QgQlVJTERUSU1FX1RBQkxFX1NPUlQNCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWljcm9i
bGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20v
cGd0YWJsZS5oDQo+IGluZGV4IDBjNzI2NDYzNzBlMS4uYmEzNDhlOTk3ZGJiIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gv
bWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTIwNCwyMyArMjA0LDYgQEAg
ZXh0ZXJuIHB0ZV90ICp2YV90b19wdGUodW5zaWduZWQgbG9uZyBhZGRyZXNzKTsNCj4gICAgKiBX
ZSBjb25zaWRlciBleGVjdXRlIHBlcm1pc3Npb24gdGhlIHNhbWUgYXMgcmVhZC4NCj4gICAgKiBB
bHNvLCB3cml0ZSBwZXJtaXNzaW9ucyBpbXBseSByZWFkIHBlcm1pc3Npb25zLg0KPiAgICAqLw0K
PiAtI2RlZmluZSBfX1AwMDAJUEFHRV9OT05FDQo+IC0jZGVmaW5lIF9fUDAwMQlQQUdFX1JFQURP
TkxZX1gNCj4gLSNkZWZpbmUgX19QMDEwCVBBR0VfQ09QWQ0KPiAtI2RlZmluZSBfX1AwMTEJUEFH
RV9DT1BZX1gNCj4gLSNkZWZpbmUgX19QMTAwCVBBR0VfUkVBRE9OTFkNCj4gLSNkZWZpbmUgX19Q
MTAxCVBBR0VfUkVBRE9OTFlfWA0KPiAtI2RlZmluZSBfX1AxMTAJUEFHRV9DT1BZDQo+IC0jZGVm
aW5lIF9fUDExMQlQQUdFX0NPUFlfWA0KPiAtDQo+IC0jZGVmaW5lIF9fUzAwMAlQQUdFX05PTkUN
Cj4gLSNkZWZpbmUgX19TMDAxCVBBR0VfUkVBRE9OTFlfWA0KPiAtI2RlZmluZSBfX1MwMTAJUEFH
RV9TSEFSRUQNCj4gLSNkZWZpbmUgX19TMDExCVBBR0VfU0hBUkVEX1gNCj4gLSNkZWZpbmUgX19T
MTAwCVBBR0VfUkVBRE9OTFkNCj4gLSNkZWZpbmUgX19TMTAxCVBBR0VfUkVBRE9OTFlfWA0KPiAt
I2RlZmluZSBfX1MxMTAJUEFHRV9TSEFSRUQNCj4gLSNkZWZpbmUgX19TMTExCVBBR0VfU0hBUkVE
X1gNCj4gICANCj4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPiAgIC8qDQo+IGRpZmYgLS1naXQg
YS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jIGIvYXJjaC9taWNyb2JsYXplL21tL2luaXQuYw0K
PiBpbmRleCBmNGU1MDM0NjFkMjQuLjMxNWZkNTAyNGYwMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9t
aWNyb2JsYXplL21tL2luaXQuYw0KPiArKysgYi9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jDQo+
IEBAIC0yODUsMyArMjg1LDIzIEBAIHZvaWQgKiBfX3JlZiB6YWxsb2NfbWF5YmVfYm9vdG1lbShz
aXplX3Qgc2l6ZSwgZ2ZwX3QgbWFzaykNCj4gICANCj4gICAJcmV0dXJuIHA7DQo+ICAgfQ0KPiAr
DQo+ICtzdGF0aWMgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5pdCA9
IHsNCj4gKwlbVk1fTk9ORV0JCQkJCT0gUEFHRV9OT05FLA0KPiArCVtWTV9SRUFEXQkJCQkJPSBQ
QUdFX1JFQURPTkxZX1gsDQo+ICsJW1ZNX1dSSVRFXQkJCQkJPSBQQUdFX0NPUFksDQo+ICsJW1ZN
X1dSSVRFIHwgVk1fUkVBRF0JCQkJPSBQQUdFX0NPUFlfWCwNCj4gKwlbVk1fRVhFQ10JCQkJCT0g
UEFHRV9SRUFET05MWSwNCj4gKwlbVk1fRVhFQyB8IFZNX1JFQURdCQkJCT0gUEFHRV9SRUFET05M
WV9YLA0KPiArCVtWTV9FWEVDIHwgVk1fV1JJVEVdCQkJCT0gUEFHRV9DT1BZLA0KPiArCVtWTV9F
WEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQkJCT0gUEFHRV9DT1BZX1gsDQo+ICsJW1ZNX1NIQVJF
RF0JCQkJCT0gUEFHRV9OT05FLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9SRUFEXQkJCQk9IFBBR0Vf
UkVBRE9OTFlfWCwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fV1JJVEVdCQkJCT0gUEFHRV9TSEFSRUQs
DQo+ICsJW1ZNX1NIQVJFRCB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JCT0gUEFHRV9TSEFSRURfWCwN
Cj4gKwlbVk1fU0hBUkVEIHwgVk1fRVhFQ10JCQkJPSBQQUdFX1JFQURPTkxZLA0KPiArCVtWTV9T
SEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRF0JCQk9IFBBR0VfUkVBRE9OTFlfWCwNCj4gKwlbVk1f
U0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFXQkJPSBQQUdFX1NIQVJFRCwNCj4gKwlbVk1fU0hB
UkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JPSBQQUdFX1NIQVJFRF9YDQo+ICt9
Ow0KPiArREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9U
