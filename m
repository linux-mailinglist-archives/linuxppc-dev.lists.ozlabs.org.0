Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C601569516A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:10:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwRt4zn2z3cGy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:10:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CjBVEt69;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe16::605; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CjBVEt69;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwQx1nnSz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:09:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJptuvVieIq81/aB21I0Jif9Mn/lQBSopE5K/tDsPYDTRIuII5ZsHUQCntm35T9Jjte9MRfF4PXebChk870a+3iXxl1vnXRkDqBoJIm6HUxb7hpCh0OV9uwwuwbMqp18xSOndRUquVYlYbbU921q8/IVUqMcvOr9Of/+i4Ch8azuvX6TWvNdWibqVD2XQAPlvcXGKr3ve1U8Ch7yOU+DvegVgT8TXMw/FZIM6f4AVYoreWVIGUvNLExwb5Rhx0X5R/bJGbW7sx9xF2SlNPIqZh2PfwB7xqYaJbM6jkNqm89ZAu1bV6mm46ksRp8gxhsfxXlbgvv/3Dga97rkUWo11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwBp9E8Hp4Wqw9BpPbMyqmpC8CTAUJlGrhHASE/NRvk=;
 b=EJYcoatk75QkPmU060qQqdsBy5zR27ZG9nnQDLui2ZLd/SyLIzK0F5uo7yWjt8okb1c1ZMWwxo7J+1EtATMihxCMQKEEkNhVFABkoDejdptPBwspE2eVbxGkKyAzmbuJdX06ko5epPpO2DOB+69e9gtdwR577Vux4IQgtlFOKqpqjrrMLl13mMNxKgmPa5BdQna7vT1iIeXZtAOn3hj8+o+shkxSNRPDxy4O8Eez3qcCawy9Cj+Fbfm/JaqAb9Y8hCtdC0J8+2OsRaLmKB0ci3AHxy0wkkM4M2RD3IUgn7XM1yWxWUA1+2/NJ9Nj2jMKHzeRhYnve6O8ymjmPkn3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwBp9E8Hp4Wqw9BpPbMyqmpC8CTAUJlGrhHASE/NRvk=;
 b=CjBVEt69aq1KPw8grU7GlChaCANdrUCFUyLb1N0rlZNuqFfFwtmrJKG9eiLRhMcPAPpvfdAtdFai6RGfitjPc+IYOt21vUlQYtkwIJuOsI+NXz8WG6ca5p4KUdthajn0+YfxHmU2t2pxDd7RyZ43fIMGX7/yXYY33+q29uDWCwqlEY0Ps4KU7BFbcZxa7Qtgyj6WEdy3ydnyhaK4Z977IbIQ0GnkmXusXdB/vVfs6ORVpnU9OIeS7FUbCg8BGWNUoMpjVwVXPuB73kxQE/Gk1ZFjw8mRWKASzG8a3Bh46MWkODMtxFeejR8d6APe+D4wzz1RRYSZZ4OWc5DGWI5VRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3380.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 20:08:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 20:08:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood
	<oss@buserror.net>, Sinan Akman <sinan@writeme.com>, Martin Kennedy
	<hurricos@gmail.com>
Subject: Re: [PATCH v2 6/8] powerpc/85xx: p2020: Define just one machine
 description
Thread-Topic: [PATCH v2 6/8] powerpc/85xx: p2020: Define just one machine
 description
Thread-Index: AQHZF90vVsaFVrhLUk2WtCNuG0HiD67NnkEA
Date: Mon, 13 Feb 2023 20:08:52 +0000
Message-ID: <fc688761-5854-a171-c5e9-fae9eb25e798@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20221224211425.14983-7-pali@kernel.org>
In-Reply-To: <20221224211425.14983-7-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3380:EE_
x-ms-office365-filtering-correlation-id: 3278e2e7-df22-4e8b-f01d-08db0dfe210a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eeXRt5DGrlwk2SUu/JMryxkXHsX1XrrdgC9enJ2cIC4Ev6IvBqpLGEK+bungeQgOcIBGjOlyN96M0AKsRUqOPxgTgLFIcPAOe23F0HWbhMP2lOdujvUJNRCThLXQaF/B9YGnE19Pfj9LsDm3qkg0RG+zPJru336QXfDPTsf/ne4YEaRUvyoIDv+yywvJdJeesBH3J7vEV6hWWgbB6g/nP2/eIaJgsRqwWJGKJz8+TV+PRgbAEQ8JJzBoZoblHDpeXV3zrLeJSeAAw2a8vfPMfRsGhR6eTBZ8ywbHpxRbJfMLIgoK+hWJo+YSCFnvODEJPTYfSXrxCUqtk+EozMiaD//ZgOQppSyTDTRDA5QuOABKM7xcQuJgMjYd+q8ED75qKuZ+cVqb3TJd4zqhcbAwxw91c6WmZ+HeRc8zQy4XItH/sEOs2VLAErQwD7FF2YHNSTs7/1C8HsXAC9d7WwOPhVd96Xl/Y2f3XjOujAI8etPMKWfJj+Y6JH6uMhcUecDJhFyYunKHNPD0GMvb1rceAPrbUW5JjU0VlCbfoSOZKqKbQfE6WwLK/ZUVLAPMN+ND94VCdLn98cFtGVY923JnRX4Pqsk7ovfmcpuk5XPmpvqFfojHRU4tG7uBMQ5jHg8HmEANpbaqHjBdmBWG3LsyUWUqVtU7Y3wiSkJ2ck0DgTlJwBRkvVh0X+hrxswXlZduoaese+Ec4vEUPV84Ozq/rzkXI+hzxPFFQes5ML0xiCq1wivGzHfPuslqKfedM4VI3W/2L2VkYxOohFviQl0VQEG6/jDRDifarYpauaGcj+M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199018)(31686004)(36756003)(4326008)(41300700001)(54906003)(110136005)(64756008)(316002)(91956017)(76116006)(66476007)(8676002)(66556008)(66946007)(66446008)(38070700005)(38100700002)(31696002)(86362001)(122000001)(71200400001)(26005)(6512007)(6506007)(186003)(5660300002)(2906002)(44832011)(8936002)(2616005)(478600001)(6486002)(83380400001)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RUN3REFJbWgvcFdiczhFS0VReTQ0VXd1SkNPaVVuM0s5WEFrMFh3M3BvRFpl?=
 =?utf-8?B?NFhTSFpLcXhWUjI3c2NtRjEzNEx1NUJITTgrS3dwSSt0TTEyUDZxYUNIc3Vl?=
 =?utf-8?B?czE2UXNVZDVHcklPK2JlOXVkbDV1N3ZRMldUS3JvZTU5SE9JelRIQWtGUGZo?=
 =?utf-8?B?SEx4L3hYSEZSVkgrSUpsL0lyQzBQdTJ1Y1p5bGZ5TXhSczB6WUpSTlZGV3JF?=
 =?utf-8?B?NTNSdGM5bW5MUXRYRjJTb2RDWVZFaHN0dTA3RmZWUjBqZndaeUFSajc0ZGho?=
 =?utf-8?B?Z2ZNNndweHZGUDV5U1BDcWlzWEJ1TDhGQXFZY1hSMzdIcWpSZ0xHcTV0Zndl?=
 =?utf-8?B?Z2U3clBFM3FBaTgzenVxakVUOUxMWDlKTncrQXJkaXdldHhJZkIreUxGcDFM?=
 =?utf-8?B?YmROUlI2dmU4U1hnb3FReVVrUDUzNUZmY0xVMEF0K0JraVBpQlorSUNja3ZF?=
 =?utf-8?B?RFdlZVVNSXVCcDJ4S3RLa1Y3OE5tS2NFVTNEQ29ERml5b0NHbU0wdjZ2SnVP?=
 =?utf-8?B?VFoyR0laYWZCbURzWnF3QlplVEdOVjJWT2M4QVJ1YzFLdElKdm50Q0w4cTcy?=
 =?utf-8?B?VFdPbVMwN0lOTjFFRW16R1BrVXRubzY0QkNDK05RMDVIa05pWkpnWWs0bG9S?=
 =?utf-8?B?SDNvSVNjOWkxb3A0Ly9xYysyWXhIbDVIQnFibmNady9vMndCcFY4SEc4cUJL?=
 =?utf-8?B?c0tFR1NFQ2Yyc1RZNTBpRlhOWkV3bFdYSDdBVzluNnpWd1djMGpJaWJXTDAv?=
 =?utf-8?B?YVNJZ2JuZTJiV2QzbitkbGdIU0MwU1BBSmpXcG96OS9zTEltT3hRVytiMi9Y?=
 =?utf-8?B?OEl4bWNPYkRMdThlVmtBYW1RdWxneDlJMzJSS0Y2NlRvRS9QWFh0R1Jub3Z5?=
 =?utf-8?B?VUpLaHpRWDl0WTc1UGVBOW0wT2ZYWFA2U1hUZy9vQjdyenpxdEZVcWQ1blhk?=
 =?utf-8?B?MVFQSEtwTnR4K1ZSenZ2dUhaVVk5R0ZCUXV5emliK0tLeVcrb0Y5Z0M3U1dC?=
 =?utf-8?B?RVdIQWQzaitNUTlXQ1R6UWZSZDAzcFhZMHhDRzdzdFUwUTlqMjBTTlJWWkxa?=
 =?utf-8?B?cVNRVkZCOGVVQjF2eDY2cytsQmM4QUJrSXMyMC93SXFPMTgzMVJRSFRua3pU?=
 =?utf-8?B?NEN2Vmh2Q3dwdFkvNWViMVRsU0hQeElKeldaV01YUnlBeDg1Mm5LSFhPVG5L?=
 =?utf-8?B?eS82blNMalJWMkZ0RVdjempmdDVCNDU1bXBiVnNiZzFQeWVibTVoWDdLVW9a?=
 =?utf-8?B?b2hPSnVXRjVmNC9jZ3UzT0JVR2RJRk9oamRlZ1UweWo5c2NmWVFPaHoxSWlr?=
 =?utf-8?B?VlZuYkNtNEVhYmZWei9iUElaYjZGK1BaSjR5M3orR0N1MVEvL0pnTTdvY0NH?=
 =?utf-8?B?ZXpPTFVkaG1aY3pYd3ZzU29mQzJGZExBeTE4QmxQWkZMU0ZNQU1OWFd2RWV3?=
 =?utf-8?B?Q2M3eVdNYTIveW5NRGl3WjZ4NUM1aDdNWVN2OUJjNXhhbmtqOWJITFdNZzJu?=
 =?utf-8?B?K0p1TEFLVDhFcUZQejhQQzNMWXFzMWpHbi9GUzBaSEx5SCtXVjN6bUdVUStD?=
 =?utf-8?B?Z3pPZ1lDSDk2WkVXYU9EZXByT1Z2RUV5K1Vab2I0V2NRM1pYQ0pORVdSbG1W?=
 =?utf-8?B?bzk4dUh5U1c0M1BDSk5vTVRjTCtrU3A0NHVuRjRRTlJ5ZDFEeGpZbUtWWjRJ?=
 =?utf-8?B?Q1YzVzRhcitYaG1KeWRTdjhRZlQ5Z01teGNlMG4wU1NjMGg5TWdpbFZjeGFj?=
 =?utf-8?B?Rlk2Tmdqb2MzbkpjWmNCRzg0M2N3bGlZKzdIV0tseFk4WUNMcTJINjI4SG1G?=
 =?utf-8?B?Unk4dlc4SkRKN0ZKL3dKNElFN1M4K3NQek1CeGRSUXJwVVNLK2lKRGtlY3Z5?=
 =?utf-8?B?MllHVWR3SllLakIxNERQQmtSZHhQcEtCSDBHdEo0STFlZzNxQVdrTytpWnBM?=
 =?utf-8?B?MCtOanNkV1hJSjEvMTZZYTRLdmVyTVNHRVB2dTd5cVJ4cEZoZnliNW4rQ0dv?=
 =?utf-8?B?VDJlbmxCMHlrQTB6VjNSZm5BYXFab0d5SzVtQ3QzQ3hTaVVXc0U3dm1ld3g2?=
 =?utf-8?B?Sk5UM3YwTnhKUElpaHhjWXZoaU4wK1NEdkROY2hiL205cTFoNnJHQU5vOHhN?=
 =?utf-8?B?ZUVhakp1ZGZoVE5nTTQ2bkZNc0VhYU9NZFhxS3BHbUJGR3RmNXdvaE12ZGcx?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A13587AF480CC546A317AC2B12BB38CD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3278e2e7-df22-4e8b-f01d-08db0dfe210a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 20:08:52.9339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmPfe+NQNyRrPCzdlrnfFGqaeS02aQm63lD1Tg07O7o6vbzZm5or+ypqQ0yY/e0lTyOkdy3Fo4AZTaI+TkRcSshNebjABTWSkXISPZAvVTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3380
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

DQoNCkxlIDI0LzEyLzIwMjIgw6AgMjI6MTQsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IENv
bWJpbmUgbWFjaGluZSBkZXNjcmlwdGlvbnMgYW5kIGNvZGUgb2YgYWxsIFAyMDIwIGJvYXJkcyBp
bnRvIGp1c3Qgb25lDQo+IGdlbmVyaWMgdW5pZmllZCBQMjAyMCBtYWNoaW5lIGRlc2NyaXB0aW9u
LiBUaGlzIGFsbG93cyBrZXJuZWwgdG8gYm9vdCBvbg0KPiBhbnkgUDIwMjAtYmFzZWQgYm9hcmQg
d2l0aCBQMjAyMCBEVFMgZmlsZSB3aXRob3V0IG5lZWQgdG8gcGF0Y2gga2VybmVsIGFuZA0KPiBk
ZWZpbmUgYSBuZXcgbWFjaGluZSBkZXNjcmlwdGlvbiBpbiA4NXh4IHBvd2VycGMgcGxhdGZvcm0g
ZGlyZWN0b3J5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVs
Lm9yZz4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMgfCA4
MyArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4
eC9wMjAyMC5jDQo+IGluZGV4IGFkZjM3NTBhYmVmOS4uYjNmYjYwMGUxZDgzIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYw0KPiBAQCAtMTU2LDgzICsxNTYsMzggQEAgc3Rh
dGljIHZvaWQgX19pbml0IHAyMDIwX3NldHVwX2FyY2godm9pZCkNCj4gICAjZW5kaWYNCj4gICB9
DQo+ICAgDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhfRFMNCj4gLW1hY2hpbmVfYXJjaF9pbml0
Y2FsbChwMjAyMF9kcywgbXBjODV4eF9jb21tb25fcHVibGlzaF9kZXZpY2VzKTsNCj4gLSNlbmRp
ZiAvKiBDT05GSUdfTVBDODV4eF9EUyAqLw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhf
UkRCDQo+IC1tYWNoaW5lX2FyY2hfaW5pdGNhbGwocDIwMjBfcmRiLCBtcGM4NXh4X2NvbW1vbl9w
dWJsaXNoX2RldmljZXMpOw0KPiAtbWFjaGluZV9hcmNoX2luaXRjYWxsKHAyMDIwX3JkYl9wYywg
bXBjODV4eF9jb21tb25fcHVibGlzaF9kZXZpY2VzKTsNCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBD
ODV4eF9SREIgKi8NCj4gK21hY2hpbmVfYXJjaF9pbml0Y2FsbChwMjAyMCwgbXBjODV4eF9jb21t
b25fcHVibGlzaF9kZXZpY2VzKTsNCj4gICANCj4gICAvKg0KPiAgICAqIENhbGxlZCB2ZXJ5IGVh
cmx5LCBkZXZpY2UtdHJlZSBpc24ndCB1bmZsYXR0ZW5lZA0KPiAgICAqLw0KPiAtI2lmZGVmIENP
TkZJR19NUEM4NXh4X0RTDQo+IC1zdGF0aWMgaW50IF9faW5pdCBwMjAyMF9kc19wcm9iZSh2b2lk
KQ0KPiAtew0KPiAtCXJldHVybiAhIW9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiZnNsLFAyMDIw
RFMiKTsNCj4gLX0NCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBDODV4eF9EUyAqLw0KPiAtDQo+IC0j
aWZkZWYgQ09ORklHX01QQzg1eHhfUkRCDQo+IC1zdGF0aWMgaW50IF9faW5pdCBwMjAyMF9yZGJf
cHJvYmUodm9pZCkNCj4gLXsNCj4gLQlpZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJmc2ws
UDIwMjBSREIiKSkNCj4gLQkJcmV0dXJuIDE7DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4g
LXN0YXRpYyBpbnQgX19pbml0IHAyMDIwX3JkYl9wY19wcm9iZSh2b2lkKQ0KPiArc3RhdGljIGlu
dCBfX2luaXQgcDIwMjBfcHJvYmUodm9pZCkNCj4gICB7DQo+IC0JaWYgKG9mX21hY2hpbmVfaXNf
Y29tcGF0aWJsZSgiZnNsLFAyMDIwUkRCLVBDIikpDQo+IC0JCXJldHVybiAxOw0KPiAtCXJldHVy
biAwOw0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcDIwMjBfY3B1Ow0KPiArDQo+ICsJLyoNCj4g
KwkgKiBUaGVyZSBpcyBubyBjb21tb24gY29tcGF0aWJsZSBzdHJpbmcgZm9yIGFsbCBQMjAyMCBi
b2FyZHMuDQo+ICsJICogVGhlIG9ubHkgY29tbW9uIHRoaW5nIGlzICJQb3dlclBDLFAyMDIwQDAi
IGNwdSBub2RlLg0KPiArCSAqIFNvIGNoZWNrIGZvciBQMjAyMCBib2FyZCB2aWEgdGhpcyBjcHUg
bm9kZS4NCj4gKwkgKi8NCj4gKwlwMjAyMF9jcHUgPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiL2Nw
dXMvUG93ZXJQQyxQMjAyMEAwIik7DQo+ICsJaWYgKCFwMjAyMF9jcHUpDQo+ICsJCXJldHVybiAw
Ow0KPiArDQo+ICsJb2Zfbm9kZV9wdXQocDIwMjBfY3B1KTsNCg0Kb2Zfbm9kZV9wdXQoKSBhbHJl
YWR5IGNoZWNrcyBmb3IgbnVsbGl0eSBvZiBpdHMgcGFyYW1ldGVyLCBzbyB5b3UgY2FuIA0Kc2lt
cGxpZnkgc3R1ZmYgaGVyZSwgc29tZXRoaW5nIGxpa2UNCg0KCXAyMDIwX2NwdSA9IG9mX2ZpbmRf
bm9kZV9ieV9wYXRoKCIvY3B1cy9Qb3dlclBDLFAyMDIwQDAiKTsNCglvZl9ub2RlX3B1dChwMjAy
MF9jcHUpOw0KDQoJcmV0dXJuICEhcDIwMjBfY3B1Ow0KDQo+ICsJcmV0dXJuIDE7DQo+ICAgfQ0K
PiAtI2VuZGlmIC8qIENPTkZJR19NUEM4NXh4X1JEQiAqLw0KPiAtDQo+IC0jaWZkZWYgQ09ORklH
X01QQzg1eHhfRFMNCj4gLWRlZmluZV9tYWNoaW5lKHAyMDIwX2RzKSB7DQo+IC0JLm5hbWUJCQk9
ICJQMjAyMCBEUyIsDQo+IC0JLnByb2JlCQkJPSBwMjAyMF9kc19wcm9iZSwNCj4gLQkuc2V0dXBf
YXJjaAkJPSBwMjAyMF9zZXR1cF9hcmNoLA0KPiAtCS5pbml0X0lSUQkJPSBwMjAyMF9waWNfaW5p
dCwNCj4gLSNpZmRlZiBDT05GSUdfUENJDQo+IC0JLnBjaWJpb3NfZml4dXBfYnVzCT0gZnNsX3Bj
aWJpb3NfZml4dXBfYnVzLA0KPiAtCS5wY2liaW9zX2ZpeHVwX3BoYiAgICAgID0gZnNsX3BjaWJp
b3NfZml4dXBfcGhiLA0KPiAtI2VuZGlmDQo+IC0JLmdldF9pcnEJCT0gbXBpY19nZXRfaXJxLA0K
PiAtCS5jYWxpYnJhdGVfZGVjcgkJPSBnZW5lcmljX2NhbGlicmF0ZV9kZWNyLA0KPiAtCS5wcm9n
cmVzcwkJPSB1ZGJnX3Byb2dyZXNzLA0KPiAtfTsNCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBDODV4
eF9EUyAqLw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhfUkRCDQo+IC1kZWZpbmVfbWFj
aGluZShwMjAyMF9yZGIpIHsNCj4gLQkubmFtZQkJCT0gIlAyMDIwIFJEQiIsDQo+IC0JLnByb2Jl
CQkJPSBwMjAyMF9yZGJfcHJvYmUsDQo+IC0JLnNldHVwX2FyY2gJCT0gcDIwMjBfc2V0dXBfYXJj
aCwNCj4gLQkuaW5pdF9JUlEJCT0gcDIwMjBfcGljX2luaXQsDQo+IC0jaWZkZWYgQ09ORklHX1BD
SQ0KPiAtCS5wY2liaW9zX2ZpeHVwX2J1cwk9IGZzbF9wY2liaW9zX2ZpeHVwX2J1cywNCj4gLQku
cGNpYmlvc19maXh1cF9waGIgICAgICA9IGZzbF9wY2liaW9zX2ZpeHVwX3BoYiwNCj4gLSNlbmRp
Zg0KPiAtCS5nZXRfaXJxCQk9IG1waWNfZ2V0X2lycSwNCj4gLQkuY2FsaWJyYXRlX2RlY3IJCT0g
Z2VuZXJpY19jYWxpYnJhdGVfZGVjciwNCj4gLQkucHJvZ3Jlc3MJCT0gdWRiZ19wcm9ncmVzcywN
Cj4gLX07DQo+ICAgDQo+IC1kZWZpbmVfbWFjaGluZShwMjAyMF9yZGJfcGMpIHsNCj4gLQkubmFt
ZQkJCT0gIlAyMDIwUkRCLVBDIiwNCj4gLQkucHJvYmUJCQk9IHAyMDIwX3JkYl9wY19wcm9iZSwN
Cj4gK2RlZmluZV9tYWNoaW5lKHAyMDIwKSB7DQo+ICsJLm5hbWUJCQk9ICJGcmVlc2NhbGUgUDIw
MjAiLA0KPiArCS5wcm9iZQkJCT0gcDIwMjBfcHJvYmUsDQo+ICAgCS5zZXR1cF9hcmNoCQk9IHAy
MDIwX3NldHVwX2FyY2gsDQo+ICAgCS5pbml0X0lSUQkJPSBwMjAyMF9waWNfaW5pdCwNCj4gICAj
aWZkZWYgQ09ORklHX1BDSQ0KPiAgIAkucGNpYmlvc19maXh1cF9idXMJPSBmc2xfcGNpYmlvc19m
aXh1cF9idXMsDQo+IC0JLnBjaWJpb3NfZml4dXBfcGhiICAgICAgPSBmc2xfcGNpYmlvc19maXh1
cF9waGIsDQo+ICsJLnBjaWJpb3NfZml4dXBfcGhiCT0gZnNsX3BjaWJpb3NfZml4dXBfcGhiLA0K
PiAgICNlbmRpZg0KPiAgIAkuZ2V0X2lycQkJPSBtcGljX2dldF9pcnEsDQo+ICAgCS5jYWxpYnJh
dGVfZGVjcgkJPSBnZW5lcmljX2NhbGlicmF0ZV9kZWNyLA0KPiAgIAkucHJvZ3Jlc3MJCT0gdWRi
Z19wcm9ncmVzcywNCj4gICB9Ow0KPiAtI2VuZGlmIC8qIENPTkZJR19NUEM4NXh4X1JEQiAqLw0K
