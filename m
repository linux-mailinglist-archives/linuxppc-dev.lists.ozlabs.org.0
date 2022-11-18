Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B198662FC2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 19:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDPqs3drmz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 05:06:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ec/U0aKL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::622; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ec/U0aKL;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDPps5cN8z3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 05:05:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKobMkDrXajVJLc9yAVVZwXAoIHJiCLP+CaCfz1/8VDxTLfrAhn3NnmjdD49ldmnOh56wY+g8asHoECD4IHTHxA2rG/0evcsas6SYkyAurDJ84UAylvfQyvdoZRFTz4saghX475+dYYK8HfRopXNSE1fe5kjXmSP+vhdRPM2hNll4js4t2wsqjL1GjGr6FwQsejsA1MvceW46MSVEIUUnxB+e/j26TL6TqK4RIhqu3lDRHVql0qdMjmaQTK9lX5hapTe8Npns6YhK5eMOovy/rviq5VOkGjNJkbxVSBewIDXbjtecIPana7/IoGgiYEKJMQok+N/enhQcTDaB+FKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZUXtO0ltnNZzoUCdKhTOIgFlO02fPF2RcJe5KvafdQ=;
 b=IwtxmBC4V8r86XUpBKZ6gr4fLTZAgzt66bA/Ht83BKIkzzABEaZWhQ3LFpIwNnCf8+ZIJkTf/32cy3JTNjJVuHLwzkiPdnVZZ0AH1JWfcN2rmVRn0VuriQOsdhUhAqjsDFXiXZI/RB1GWIZJxAqtPMBPZ5AQQnMyB5yacpPMl6J069Y6BtCCpT6sdMWC4tCkXU/XIipJT0fEHUMQjsnkkA3B7res7prrn8nvrER5DNhoNkLeL0ZAyyGL/PYGyrkSQyqmTDOvcDuTUmJ+mI/eYbvn0tes3TgHqjc6ZEdyrB5EOidmWFrSHCNiDYD2GgeK13Fca/MQ/wsquT8Fq6zuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZUXtO0ltnNZzoUCdKhTOIgFlO02fPF2RcJe5KvafdQ=;
 b=Ec/U0aKLv7nNaWyOoz5eadyFJLvpk7UVLsqpw1G3Q3mIgaVmzmMP2YL0rOQ/bBzkjx/MdyKE0GkWtNJ+C1Nvs6k996x2CW9enhtF1i0J1k9sQrgDgpEu0zkyz5yH1/0LQJwFHRXEL1MFZO55VfpN6BX2hVrv0xFrcDGYVqaQgYhOY7L8gcY90TOihq1fn/MEQ9ePULA5eU8bdxrN8U8JY/yHc5WxZThzTz8QeN1gGRHiimRho1IeveYD0NOobWdSQ+j1MPwWu2RBIiAK6mou3ec2WjEs/Cv78ieafnwojK/lPUHW5X+fo17Hz0P3gxkpwXM5jWLh68+mdSMIFO5WNw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1702.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 18:05:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 18:05:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index:  AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcAgATvboCAACzCgIABp7yAgAF1qQCAAOn5gIABrkOAgAADd4CAAA1jAIAAI5EAgABfhoCAAApSAA==
Date: Fri, 18 Nov 2022 18:05:33 +0000
Message-ID: <23b50497-dc75-d0dc-ae7c-5ea55ab596e5@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
 <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu>
 <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
 <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
 <02496f7a-51d8-4fc0-161d-b29d5e657089@csgroup.eu>
 <9d5c390a-31db-4f93-203d-281b0831d37f@linux.ibm.com>
 <c651bd44-d0ca-e3cf-0639-6b42b33f4666@csgroup.eu>
 <548de735-52d7-f5bb-5c85-370a1c233a08@linux.ibm.com>
 <b2a8589d-3272-4c82-8481-9fcb6d8f9bfc@csgroup.eu>
 <CAPhsuW7uytWgsrv+y5qjqbxri-AgvrP9-EMnWyR48z6GhfHgfQ@mail.gmail.com>
In-Reply-To:  <CAPhsuW7uytWgsrv+y5qjqbxri-AgvrP9-EMnWyR48z6GhfHgfQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1702:EE_
x-ms-office365-filtering-correlation-id: 178acaea-8173-4f77-0ae5-08dac98f7ced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6WZSiTL+yGwhKmPVyhRh7likEP07iTyl7IPCRW5tGCJh2LKp2dMwG0Hfj0m9DXKL3QxJk9OSAn8bbZpPDJrew6VIa3O2eZhcMDEXg+vorfCv7mmBioLXFhd+kuQOPIjf6BREXI9BlCsx4UwXc+5fA3J65qy51TiD1DrGv3kQN4woAgsQj0L99iCBQHth4PCa60UfAnjDSdie9Udz8eLt+4LDUr/nZSbsT59DwEv7cVi/aswYRn/T78E1tW6vUQPyXzAiqkcfV9mKh44ZtX19i9VMKiGoxeStxlGBTopFHMFz23KCUQBiFvtS8Dz0+1H1BjWSSkyqJaHB/xGTxfebf7sG4UdZVpTUCZBJj1575n27RQHzTPDVXl3gBks1o5Sf17r/DnYJBol+J14ogjMOdo7tlEDEQj9Dw3sLfs3yd9Zg79alh2hJ2tOQX7MC2dEPe8IxMqbqvRbNnUJTGIghOWMsRh7VUtTp7KEB2flV7EGkf91YvK+Q/SSn2aNm4QAEwXyL61RZ4HsA9cw9+78sSCpPQB6Hb1c0cxplURgip+o79QHIreXiu560yofaErEbCQlNG3dZqQA7DlpKnujkwe+iriP1N9ANcUlIwF4nnRZfpU4Vgy42SW9yfR/Wti9NGcwFKfwjo1BVoWeE3GnBobKsVUOrxwqyMv+rvJzu4TViqMVqeZiUeLkrQGH3CilEtDsTEuqrB4wiB5znl5MWDatp996Bnl/asHvPE3EdcjP46vlKfv1CLnVwYo2dbkr7P4OE87xPZZNQXyU8gT10rw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(86362001)(478600001)(38100700002)(6486002)(31686004)(71200400001)(44832011)(122000001)(6506007)(83380400001)(316002)(186003)(2616005)(36756003)(8936002)(2906002)(26005)(110136005)(54906003)(53546011)(41300700001)(91956017)(31696002)(66574015)(76116006)(66446008)(38070700005)(6512007)(8676002)(66946007)(66476007)(5660300002)(64756008)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TVkvSUVQV3htUFhZVmJnNEFKOVVXckoyaDBBOTE5MkdORUlpU1U4eGFLMzJD?=
 =?utf-8?B?Y0dEQ05ESE0zVjhXS1F0aWZ1LzZ0QjlJTzdMZDE2RGVXWkJzcnIreXU2NUFz?=
 =?utf-8?B?UEh5VXBuamJuM3I4emk4RUpUMXhFeDdRaUhib2lFa0xPT0IvNlZCdXJ4aXNm?=
 =?utf-8?B?V0NDZHBDTTJrdXpKRCt6aUhCdlA2amE1QnNNc2xxbWxGb1NMYWdXakNpUyt5?=
 =?utf-8?B?QStIZm10K1BUNHdmY0VNMW9Fa1BvUUdzNFhaQlA2bkIxQXdELytpbGxKNXRz?=
 =?utf-8?B?U1lKRkw1eGYweVFRN21qSndLbjBzMmhyRWlqLy80aVZYQzl3dkVleHc1RHdi?=
 =?utf-8?B?Vmd6M21xSU1hQWM0US9RQTc3ODFCbHBOb2o3dWhud3BCQmdDYUVVa1NzcVFT?=
 =?utf-8?B?TExFbzNIWElSZmJGWWI3aWZ6TU5TR2pBZFMxbWhtMFFScmRqdFVzQ214eXhj?=
 =?utf-8?B?Rll2bEJlZURzQWdJVnNJNGRtWjdVNjdIbFFFQ1NJODZDU1dBSUIyNFVFSU85?=
 =?utf-8?B?UVVkenZUeU5vZlRtMHNBMWtUZHcxb0MzS0lZcU1uT0JkK1FRZFJSSW9od1Rw?=
 =?utf-8?B?RnpPMHplQlduR0h3Q3BXTTd1N1dPRi8rMEQyRVpmd3NaZlRrb0NReVBDWjFu?=
 =?utf-8?B?ejF4QXA5ZDZFNllRSEpRT1VxNm45STh4RWU5V2Y1dlFnN0hvdzYzODcrZGtB?=
 =?utf-8?B?MUpHc0V3QlVhRldGbXZpN0d1WEJEMzZQTGVjTWtBM0RpczdsRUJCejdNVGUv?=
 =?utf-8?B?NmJETzZUL3QySlo1aXl6OG1pWlh2aENhUFdibk13SG9kcVlzenhDUGFiKytp?=
 =?utf-8?B?eUZEQU1qaGpPMk43V2F2aXlyQk82WVlIRWI2WldDN25tbG03Vk94UjhaNkpm?=
 =?utf-8?B?ZmYyalRISjBRK0VhTUkxRW02NE90UnpLRW5oZnp4SDNkeklkQnNjc0lyMnlH?=
 =?utf-8?B?cFQ2c0NrNGZSb0pWZFIwZzM5OFFTNkFIV2tXK3EvT0U5aE0zM3lNNVA4Vmhl?=
 =?utf-8?B?dlFMS2tiZXFzdy9scXhsRVByNmJDTmlkNUpVSGlaU00xLzhrd2xTUUdiZ2ky?=
 =?utf-8?B?SFB2MEMzYnJwOWJXVk5iVzZ3TUcvc1Q0R1M5ZGZ4RUJFUVVpdGJzanZCNnA5?=
 =?utf-8?B?Q1VpYmY1QlNEZm9PekI4cFVSTDJlYlBSVm9xYWxVNDNHdXpVc2MvWURJbkJ1?=
 =?utf-8?B?RXAyS25lNVlnZEozWk9FVGhqMTNPNE13RDN0UDYxYUh3NGIzZndwazVhRkkr?=
 =?utf-8?B?b1JXZ3FnNUFQQVV1eVhqUzlrRnRCdXdjeDBjN0lOcnBjZHU0YnI4UG1FRkY0?=
 =?utf-8?B?NmdwYjQ1ZnNnMWUyVmljR3krUXBWU3ZTbjlNUk5QRDBhdEl2Wld1ZWhJM045?=
 =?utf-8?B?K0o0aTlvN2t5aTEwNHZBeDM0bzh4eUhSbWpSL0U2T2tqSEVRSjJGUGwzTUNz?=
 =?utf-8?B?Y0RDUTZtRU5sWDBiRVkvYmJiMGhHRUN6ODBkWmtLYjQ5dUU5aDErWVZPZVlj?=
 =?utf-8?B?enluSzRxZGpzbVA3VjdBWGxITjJXbitVb21jSkdQWklCbWIxRWpoNXFsZTdW?=
 =?utf-8?B?Z0J3VXp5M1JydXlFVnFBRGpZMy9pMjJEZG5VdFpoWnE5RC85R2xaWkFjbDJk?=
 =?utf-8?B?NGhlMkdTTFVQdGlJVVJtd04wSndYVEZVUVJOeWRVeURqWERvZXdZNFd4VWdC?=
 =?utf-8?B?WlNxZUlsODFXaDA1RzdITG1NOEUrVWRUbHNuT2FHVVU1bmdLd091cUhKMVZH?=
 =?utf-8?B?eHNnR3F4UlZOTkVldE5oUTlCNXcwR1dKYmhTY2VqWlczVDBBMkprZDNwejA0?=
 =?utf-8?B?RC83WDg1Vnc4T0xaWGdKQnNyUWNZaG1hMm9UUGs5S2FjWDZsZXJNeG54WUZ0?=
 =?utf-8?B?NytlMUtwbHpJUzRJN2ZIeDE4eFNTaWhpL0JXNmZsTDREUmgrNVFqWG96SWx5?=
 =?utf-8?B?VEV6R2UydStCUU42WU9tQ2FxNWJTL3pvN285V1ZJTmdRbmlHN29vQ1lKU1RH?=
 =?utf-8?B?TnlaeEdXbndvVEE5aDE0UjEwckJ6ZE5oTjdJNVJSaTJIbUNNTEFHeE0rTzlW?=
 =?utf-8?B?ZTNWbm9zSitkVExkM3pxWkV2OG9TVy83ZzdCQTUwR3ZJQ0ZMamQ5c2xjdFJC?=
 =?utf-8?Q?gY2Xn5raPYJWSksYOTmRnZ6XS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36818E4A5BF0EF458FDA16731425380D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 178acaea-8173-4f77-0ae5-08dac98f7ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 18:05:33.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AjOuxuaq6MKGf+bpxCtolQ67EhtTZG6jSCPW1HVsggbAcIW7PApmfomDNsS0wfZO/t6yrxdugV+pXYvXOxqxFd16Dyj88RtgBlahr/Hmdu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1702
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzExLzIwMjIgw6AgMTg6MjgsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgTm92IDE4LCAyMDIyIGF0IDM6NDcgQU0gQ2hyaXN0b3BoZSBMZXJveQ0KPiA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+IExlIDE4LzExLzIwMjIg
w6AgMTA6MzksIEhhcmkgQmF0aGluaSBhIMOpY3JpdCA6DQo+Pj4NCj4+Pg0KPj4+IE9uIDE4LzEx
LzIyIDI6MjEgcG0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6ID4+Pj4+DQo+Pj4+Pj4+IEkgaGFk
IHRoZSBzYW1lIGNvbmZpZyBidXQgaGl0IHRoaXMgcHJvYmxlbToNCj4+Pj4+Pj4NCj4+Pj4+Pj4g
ICAgICAgICAjIGVjaG8gMSA+IC9wcm9jL3N5cy9uZXQvY29yZS9icGZfaml0X2VuYWJsZTsgbW9k
cHJvYmUgdGVzdF9icGYNCj4+Pj4+Pj4gICAgICAgICB0ZXN0X2JwZjogIzAgVEFYDQo+Pj4+Pj4+
ICAgICAgICAgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+Pj4+Pj4+ICAg
ICAgICAgV0FSTklORzogQ1BVOiAwIFBJRDogOTYgYXQgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0
X2NvbXAuYzozNjcNCj4+Pj4+Pj4gYnBmX2ludF9qaXRfY29tcGlsZSsweDhhMC8weDlmOA0KPj4+
Pj4+DQo+Pj4+Pj4gSSBnZXQgbm8gc3VjaCBwcm9ibGVtLCBvbiBRRU1VLCBhbmQgSSBjaGVja2Vk
IHRoZSAuY29uZmlnIGhhczoNCj4+Pj4+DQo+Pj4+Pj4gQ09ORklHX1NUUklDVF9LRVJORUxfUldY
PXkNCj4+Pj4+PiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1g9eQ0KPj4+Pj4NCj4+Pj4+IFllYWgu
IFRoYXQgZGlkIHRoZSB0cmljay4NCj4+Pj4NCj4+Pj4gSW50ZXJlc3RpbmcuIEkgZ3Vlc3Mgd2Ug
aGF2ZSB0byBmaW5kIG91dCB3aHkgaXQgZmFpbHMgd2hlbiB0aG9zZSBjb25maWcNCj4+Pj4gYXJl
IG1pc3NpbmcuDQo+Pj4+DQo+Pj4+IE1heWJlIG1vZHVsZSBjb2RlIHBsYXlzIHdpdGggUk8gYW5k
IE5YIGZsYWdzIGV2ZW4gaWYNCj4+Pj4gQ09ORklHX1NUUklDVF9NT0RVTEVfUldYIGlzIG5vdCBz
ZWxlY3RlZCA/DQo+Pj4NCj4+PiBOZWVkIHRvIGxvb2sgYXQgdGhlIGNvZGUgY2xvc2VseSBidXQg
Zndpdywgb2JzZXJ2aW5nIHNhbWUgZmFpbHVyZSBvbg0KPj4+IDY0LWJpdCBhcyB3ZWxsIHdpdGgg
IVNUUklDVF9SV1guLi4NCj4+DQo+PiBUaGUgcHJvYmxlbSBpcyBpbiBicGZfcHJvZ19wYWNrX2Fs
bG9jKCkgYW5kIGluIGFsbG9jX25ld19wYWNrKCkgOiBUaGV5DQo+PiBkbyBzZXRfbWVtb3J5X3Jv
KCkgYW5kIHNldF9tZW1vcnlfeCgpIHdpdGhvdXQgdGFraW5nIGludG8gYWNjb3VudA0KPj4gQ09O
RklHX1NUUklDVF9NT0RVTEVfUldYLg0KPj4NCj4+IFdoZW4gQ09ORklHX1NUUklDVF9NT0RVTEVf
UldYIGlzIHNlbGVjdGVkLCBwb3dlcnBjIG1vZHVsZV9hbGxvYygpDQo+PiBhbGxvY2F0ZXMgUEFH
RV9LRVJORUwgbWVtb3J5LCB0aGF0IGlzIFJXIG1lbW9yeSwgYW5kIGV4cGVjdHMgdGhlIHVzZXIg
dG8NCj4+IGNhbGwgZG8gc2V0X21lbW9yeV9ybygpIGFuZCBzZXRfbWVtb3J5X3goKS4NCj4+DQo+
PiBCdXQgd2hlbiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1ggaXMgbm90IHNlbGVjdGVkLCBwb3dl
cnBjDQo+PiBtb2R1bGVfYWxsb2MoKSBhbGxvY2F0ZXMgUEFHRV9LRVJORUxfVEVYVCBtZW1vcnks
IHRoYXQgaXMgUldYIG1lbW9yeSwNCj4+IGFuZCBleHBlY3RzIHRvIGJlIGFibGUgdG8gYWx3YXlz
IHdyaXRlIGludG8gaXQuDQo+IA0KPiBBaCwgSSBzZWUuIHg4Nl82NCByZXF1aXJlcyBDT05GSUdf
U1RSSUNUX01PRFVMRV9SV1gsIHNvIHRoaXMgaGFzbid0DQo+IGJlZW4gYSBwcm9ibGVtIHlldC4N
Cj4gDQoNCkluIGZhY3QgaXQgc2hvdWxkbid0IGJlIGEgcHJvYmxlbSBmb3IgQlBGIG9uIHBvd2Vy
cGMgZWl0aGVyLiBCZWNhdXNlIA0KcG93ZXJwYyBCUEYgZXhwZWN0cyBSTyBhdCBhbGwgdGltZSBh
bmQgdG9kYXkgdXNlcyBicGZfaml0X2JpbmFyeV9sb2NrX3JvKCkuDQoNCkl0IGp1c3QgbWVhbnMg
dGhhdCB3ZSBjYW4ndCB1c2UgcGF0Y2hfaW5zdHJ1Y3Rpb24oKSBmb3IgdGhhdC4gQW55d2F5LCAN
CnVzaW5nIHBhdGNoX2luc3RydWN0aW9uKCkgd2FzIHN1Yi1vcHRpbWFsLg0KDQpBbGwgd2UgaGF2
ZSB0byBkbyBJIHRoaW5rIGlzIHNldCBhIG1pcnJvciBvZiB0aGUgcGFnZSB1c2luZyB2bWFwKCkg
dGhlbiANCnBlcmZvcm0gYSBtZW1jcHkoKSBvZiB0aGUgY29kZSB0aGVuIHZ1bm1hcCgpIGl0LiBN
YXliZSBhIGNhbGwgdG8gDQpmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgd2lsbCBiZSBhbHNvIG5l
ZWRlZCwgdW5sZXNzIEJQRiBhbHJlYWR5IGRvZXMgaXQuDQoNCkNocmlzdG9waGUNCg==
