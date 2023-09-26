Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA87AE643
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:52:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FYo2TRgB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvr5p2X2Mz3cbc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 16:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FYo2TRgB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvr4w2dstz30hR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 16:51:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vmp94+7wyW2SjuTdwUIUBUy8liLLfgDhog/3WVCEpu+tXW8YpNu/Vnfnh94DpXcRhVLVtSPhfoFXSsZFs+BE3hePh8q5ASROXnQcSwHSO5QgUhXWUvNUNCdh+J8cX3oci5PPQTZH5Kh8ZwKcVy1cAhGiLSRxMaj28/hT4C1r9N34/yX5AP8rDiB6lvy5YcRNGANXR9AGd/HxPg1vIo4MOw21ExUqSPKdSv/gIInPimVbAybNyUhu9tMDfKNgeUAKwHpJbPUuwVJTliEq94ZOFZA/SCE4cw5xgEnSGGhJYZi6WE0T9dxUIU6+PYswi/iUO89/txpeU9O1z2LSu7aFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwNawc5UJW84q7fv0FTDB+2UjXdHjEW7faQIik4oBsg=;
 b=Ui3V2+l+nOOVkI+4gYj13Z5r2+dMhYQP1BuwquxJNpSL1vs9g6fVjugdMN9sEi5ksFIdKmRGOJoof7g/L9psQ5pKJj3vfXRDUS2XGg0Y2/SzMWesxAJQSwjTHBFq//fTP2S7HA3t8L/elQU+Jkw2vxbt+sU/H8VeXyHmPFMrNxMG1mmqynnjCQyv1WRtC8QckjB0IRCXiVTxzs7l9/pvncASqLmS01Q84jGNyLTyAOJsDuxF2e/09pqR7wv6jGDhhviQO/thhVGiSSCclAIcE0n82+dEzP1G1cZJYlCOZLoDwMrr0AwDfuItOCKSS/N+J59CB5GbdDJpe5IrTL5ikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwNawc5UJW84q7fv0FTDB+2UjXdHjEW7faQIik4oBsg=;
 b=FYo2TRgBeyTeUPZnPlFLiX7+AJxic6lMhc+D1Nag2nGaUdLD3AXWC8yR0ZDj3O1lX34gUgLBYVot9vXYFQ+QRan19aFhPp2Y2xpzONBL4F5OD5uNiZJyHPa+5jjOzd2YCCf51LR60Qc0Gjor5CzO1IB+gTtq4SRFVKyRBsDon1CW0/5VTbmfV6k2UUuSt2yHvhzHnXH2e+Gv4vj/ExEyQ8HUb1mJR9FPU223/dMRlCXapfz/aFY/dHLaPfLmNTxtnZh+o2DynQqARp1irIyntbvgYm2BX8gO3KMKZ70qd5cEnwVxoY4m6X83SRhkoGlTtFmOWdnLc0QeJsTwbcAtfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1751.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 06:51:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:51:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 4/5] powerpc/code-patching: introduce
 patch_instructions()
Thread-Topic: [PATCH v4 4/5] powerpc/code-patching: introduce
 patch_instructions()
Thread-Index: AQHZ4lhKzs/8i3YWzEafisPPNhJ88LAsQK0AgACGVQA=
Date: Tue, 26 Sep 2023 06:51:18 +0000
Message-ID: <2dffb52c-39f5-4d27-8a51-e5af643c1be4@csgroup.eu>
References: <20230908132740.718103-1-hbathini@linux.ibm.com>
 <20230908132740.718103-5-hbathini@linux.ibm.com>
 <CAPhsuW6p1+mqG_soSS8q_FFio7iHGtUyyDfH5cyXs_Py8f-Pmg@mail.gmail.com>
In-Reply-To:  <CAPhsuW6p1+mqG_soSS8q_FFio7iHGtUyyDfH5cyXs_Py8f-Pmg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1751:EE_
x-ms-office365-filtering-correlation-id: 86959fa9-417e-4602-3f85-08dbbe5cfc68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  S3l2TtAY/l1JVGsF3OG/ZlmY4G/IOmx90UkRc/8Fh0KIdWdMTb6WtPldJrFa46c6B9vIFZoVwwd4g37D9RF4PWbQuf9n3XYRxPe41B27Gk3Pd33zGSuhp1UkDGI2OkYUkSGsRzZj1Vfdyyo7P+E+Isx0AXb5AbeSxFpj+sASvRNgZaZD1h1UReYdBSkl3d1eL9PmXH92XJzCv0ymwjgH7xDb8VvOWSbi0E9LG3KDOTuxeB0QdB3X1GHC2Yff0i22HTgvtp4vxbQvcYRXFkkISq7I2LdUAlQzHR1bDbPiP6PixM1cmPwFJLuoEvejh36hqL6G5MVfhXEKz93W9NZWbvZlcGjUHIzeLwJGPDGyXCHwHAxIa4fE8/ux5FGga8Z+htChiG2GTqzvxzwe+PQFrmRUzt9NksiEVMKo/W6BbZwoJG+f/oUtLP4RR0VR+ICsTq86e1/DDsrRZFd6UryoKLzBH76Ip/GiBLJhQplAPFEhBEcsXVLzanakGCyso9u8tznDs1TNAR/jNLZLK7wLHrr1P9N+iEPZd1e5HRVRLpvEaHDyyl1OUDcb5oAuqMKsTD1mrEpiYp3tLQHzdYBmHMpVNTh6AiHs3PjBWwHxAuYgiCpnjGH+udEMwn2CXi5hm5fhfBu1HRHwgoLdfG/Rd9McoKipVdCcFAsmbV4u1EBZb6pzS9bcZel5egx23uF3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(4326008)(26005)(8936002)(8676002)(76116006)(66556008)(316002)(478600001)(41300700001)(110136005)(91956017)(64756008)(7416002)(66946007)(66446008)(54906003)(6512007)(53546011)(66476007)(2616005)(5660300002)(2906002)(6486002)(71200400001)(6506007)(122000001)(44832011)(36756003)(38070700005)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SnJIM2tOSjJBbkVnWVBnQ3RvVTNFckp3Tk9zTVROaTNld0F6RnZyOVRpZFRu?=
 =?utf-8?B?Zkt3NjVHOW9wNDhnVnIwRFJtMkRvR1UydktCaUlVOHlia25XUk96RHFkcXRz?=
 =?utf-8?B?aUFBUEpkYzY0SzlWWjkyWEpEdGNzK3E5YzRGSVRwWHJkWDgySG0rNjg0OEc2?=
 =?utf-8?B?ZnNzTFB6THJhNFYwYk03OStpb2VEcUZvYktISmZqZ0ltdHU2MmFSeWpNSklz?=
 =?utf-8?B?aUJmSTZuKzVoc3hiSk9DZU1JVmxKTlljQWRlclNXYWZJdnh2dUFrNjJkSkpz?=
 =?utf-8?B?TWRaK1d1RXdxaFdEdUMxeER0dTFjd2F5aTArQXByU1BwNjNEcU92MW00ZS9m?=
 =?utf-8?B?eHBNVmVwZDZOTGR0NmY0cHo3OC9rb1Z0a1lnUEhycGY4ak96dS9KMFd5bE5k?=
 =?utf-8?B?MStGbnVscUdiZDV0cy9EdlJsbFJrak4wc0RteEozMEhKU0VCQ3JMRVNneGRO?=
 =?utf-8?B?U1M5a0ZHa2gzNHVWc01TS0ZHSFoxS0l3TzJCQmpUeDRzMG42aU5VTHhJWHJD?=
 =?utf-8?B?NDFjK2RleHVkZFMraDZtUXQ4azlMWTM1YXBadE9GNmRIdVgrOGVZdDVLOE9m?=
 =?utf-8?B?ZEtGNEp2cTNtV0NuYWVoNmg2eE1vRWoxM1B0dk5wdWVNMTZZUGZteFQxYWNq?=
 =?utf-8?B?S1JSV1p4QkpUSzhKWWtqUU1BRmFVUHIzMW5WRW53ZnF6RlJaWFRCV2crLzhO?=
 =?utf-8?B?YlFjUEE0ZDV1R1JueFZZMXF0d1lXWW5NVnBxN2lFSnZsRjZyS0FNdE80cXpj?=
 =?utf-8?B?bFVNeHgzNG4vaC80UGNiNUZSZlViK29Mb0cvTVM0V294R2tHOVBEelBjTXYz?=
 =?utf-8?B?Wkpra2d2MnFadlQrWTJPOFBwcGlFWkdvV2ZpMUZqZ1FkbUFlNUpQNERBMExB?=
 =?utf-8?B?MU5yTjJvVVJvMjMzVno0U1BYbWhDRHY1NGNLL3ZieGQyWkE1MVZDK2cxQUs3?=
 =?utf-8?B?TitIakUxVDhCTDNvSVFiRjNFcFlGWDRSUlFFcm9PbUZiQTRnNDB4dnZVazd2?=
 =?utf-8?B?TEZmSm5XVW50alBjU1djR2lCV1Z1SmtQZ0I2b1hEbkExK3g3eUo3cWV3eVJv?=
 =?utf-8?B?N3pFWWUwVHExNnhjWFh0dU9YMEFPMkZLS2tYb1dVdWd6bEZLeGEwQk83Y1ps?=
 =?utf-8?B?bithcmUwV3RyeXpiRlhKbVBSeUF3dFNCUmh3blFnTzYwQldVTzAyNGJVaW5O?=
 =?utf-8?B?L2dCMXVEbHZ2TFhoUGhodkRvWWdvVC9wbWRkVjRSVzNPQlJYOXp6NmFIV2tC?=
 =?utf-8?B?VnBreDRibVNRV0I0VjdTSHRReExlQnp6MzUyZEFiWmxpQWMrY3I3d3Q3OXg5?=
 =?utf-8?B?ays3YTNRdzdWNlN4bm5uaUZrRWVRelBaK0hEV1ZXaC9oNG1iUXFlckx4WEV0?=
 =?utf-8?B?VWhzRXJuUHlRV2Q5R2t5SFRSTXVxS3kxSWtTNkV4TGxTY1JjQkpTbHNORjVT?=
 =?utf-8?B?ejErZWhmKyt3b2hHckh0c3JsaGVCUWxFV0tIV2puU2JGWHVQM3ZJTTc0cGlp?=
 =?utf-8?B?dTNxQlo0ZXBZRi9NYVhlZ1k1c2ZMenp0aE1sWFRtNGVBd2t5bjhPcGVhb2x0?=
 =?utf-8?B?RklSOFFEa1J5RnZlaFNNVWl2RXUwMWhDdFQ0MnJMbjBWcFM3SU5taTdmc0R0?=
 =?utf-8?B?VXpBUXlIRjFRM2NPem5saG9LMDJlZ3BNdGNXVlAzNlBSRjZLamo2U3BNUlgz?=
 =?utf-8?B?MlFRQi9sR3N6UlQ4T2QxS3dsMFdjRjh4RFg0QkJCUlJ5ZGRBTVZKUzhNNmM2?=
 =?utf-8?B?bXdzbGMzeG5TUzk2VEFORmJaNSs4WitlU2pHZDNIaEU2RG9hV1doQ0VHa3RI?=
 =?utf-8?B?TTlKeE5aQzkrT2lMVER2WVdSZ1JqNFVQTTk0YWtZM1BKRWhzYU1Dd1VYdU0r?=
 =?utf-8?B?TnVHdEtEZzZ5elBzZU5ScUQ1cXdFYXVrcngraHFHUTdpemtEdW9JOXFkQm5m?=
 =?utf-8?B?SkZlaldsbGtOemswN3NFL1BobXJDY3E1OXNEY3YyNEpJVjF0TFcvZXc0QndP?=
 =?utf-8?B?RzlOYVA1eWVtV3BtbjJKSzRjNnlmcVNZQ21jVGJEdkRhMkNVdENQY3hKaVl1?=
 =?utf-8?B?eVZlMTlFQTI5SlltUGRCNUpwSXhBOVk5QkVNQXVPV0N0SkV4YjFDWkZIMjAr?=
 =?utf-8?B?NDl6TW1PTXQxLzZnbitEcVJObEkvT3hycmlGZWVLdjJRSWdxamtiS3ZzdVcz?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5674AAD5521EAB4A85812E653BAB5568@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86959fa9-417e-4602-3f85-08dbbe5cfc68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 06:51:18.3999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSmliPkGG1D675NUSG41kj67q0Zm61g+fSyVrX4aKrWjjIAWF91hEsyMOsoJG1uZvhqgDSfRK2rSnxyeyQxNAy056n2jXgpI9biBoHo7iAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1751
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

DQoNCkxlIDI2LzA5LzIwMjMgw6AgMDA6NTAsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgU2VwIDgsIDIwMjMgYXQgNjoyOOKAr0FNIEhhcmkgQmF0aGluaSA8aGJhdGhpbmlAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gcGF0Y2hfaW5zdHJ1Y3Rpb24oKSBlbnRhaWxzIHNldHRp
bmcgdXAgcHRlLCBwYXRjaGluZyB0aGUgaW5zdHJ1Y3Rpb24sDQo+PiBjbGVhcmluZyB0aGUgcHRl
IGFuZCBmbHVzaGluZyB0aGUgdGxiLiBJZiBtdWx0aXBsZSBpbnN0cnVjdGlvbnMgbmVlZA0KPj4g
dG8gYmUgcGF0Y2hlZCwgZXZlcnkgaW5zdHJ1Y3Rpb24gd291bGQgaGF2ZSB0byBnbyB0aHJvdWdo
IHRoZSBhYm92ZQ0KPj4gZHJpbGwgdW5uZWNlc3NhcmlseS4gSW5zdGVhZCwgaW50cm9kdWNlIGZ1
bmN0aW9uIHBhdGNoX2luc3RydWN0aW9ucygpDQo+PiB0aGF0IHNldHMgdXAgdGhlIHB0ZSwgY2xl
YXJzIHRoZSBwdGUgYW5kIGZsdXNoZXMgdGhlIHRsYiBvbmx5IG9uY2UgcGVyDQo+PiBwYWdlIHJh
bmdlIG9mIGluc3RydWN0aW9ucyB0byBiZSBwYXRjaGVkLiBUaGlzIGFkZHMgYSBzbGlnaHQgb3Zl
cmhlYWQNCj4+IHRvIHBhdGNoX2luc3RydWN0aW9uKCkgY2FsbCB3aGlsZSBpbXByb3ZpbmcgdGhl
IHBhdGNoaW5nIHRpbWUgZm9yDQo+PiBzY2VuYXJpb3Mgd2hlcmUgbW9yZSB0aGFuIG9uZSBpbnN0
cnVjdGlvbiBuZWVkcyB0byBiZSBwYXRjaGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhhcmkg
QmF0aGluaSA8aGJhdGhpbmlAbGludXguaWJtLmNvbT4NCj4gDQo+IEkgZGlkbid0IHNlZSB0aGlz
IG9uZSB3aGVuIEkgcmV2aWV3ZWQgMS81LiBQbGVhc2UgaWdub3JlIHRoYXQgY29tbWVudC4NCg0K
SWYgSSByZW1lbWJlciBjb3JyZWN0cnksIHBhdGNoIDEgaW50cm9kdWNlcyBhIGh1Z2UgcGVyZm9y
bWFuY2UgDQpkZWdyYWRhdGlvbiwgd2hpY2ggZ2V0cyB0aGVuIGltcHJvdmVkIHdpdGggdGhpcyBw
YXRjaC4NCg0KQXMgSSBzYWlkIGJlZm9yZSwgSSdkIGV4cGVjdCBwYXRjaCA0IHRvIGdvIGZpcnN0
IHRoZW4gZ2V0IA0KYnBmX2FyY2hfdGV4dF9jb3B5KCkgYmUgaW1wbGVtZW50ZWQgd2l0aCBwYXRj
aF9pbnN0cnVjdGlvbnMoKSBkaXJlY3RseS4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBbLi4uXQ0K
PiANCj4+IEBAIC0zMDcsMTEgKzMxMiwyMiBAQCBzdGF0aWMgaW50IF9fZG9fcGF0Y2hfaW5zdHJ1
Y3Rpb25fbW0odTMyICphZGRyLCBwcGNfaW5zdF90IGluc3RyKQ0KPj4NCj4+ICAgICAgICAgIG9y
aWdfbW0gPSBzdGFydF91c2luZ190ZW1wX21tKHBhdGNoaW5nX21tKTsNCj4+DQo+PiAtICAgICAg
IGVyciA9IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgaW5zdHIsIHBhdGNoX2FkZHIpOw0KPj4g
KyAgICAgICB3aGlsZSAobGVuID4gMCkgew0KPj4gKyAgICAgICAgICAgICAgIGluc3RyID0gcHBj
X2luc3RfcmVhZChjb2RlKTsNCj4+ICsgICAgICAgICAgICAgICBpbGVuID0gcHBjX2luc3RfbGVu
KGluc3RyKTsNCj4+ICsgICAgICAgICAgICAgICBlcnIgPSBfX3BhdGNoX2luc3RydWN0aW9uKGFk
ZHIsIGluc3RyLCBwYXRjaF9hZGRyKTsNCj4gDQo+IEl0IGFwcGVhcnMgd2UgYXJlIHN0aWxsIHJl
cGVhdGluZyBhIGxvdCBvZiB3b3JrIGhlcmUuIEZvciBleGFtcGxlLCB3aXRoDQo+IGZpbGxfaW5z
biA9PSB0cnVlLCB3ZSBkb24ndCBuZWVkIHRvIHJlcGVhdCBwcGNfaW5zdF9yZWFkKCkuDQo+IA0K
PiBDYW4gd2UgZG8gdGhpcyB3aXRoIGEgbWVtY3B5IG9yIG1lbXNldCBsaWtlIGZ1bmN0aW9ucz8N
Cj4gDQo+PiArICAgICAgICAgICAgICAgLyogaHdzeW5jIHBlcmZvcm1lZCBieSBfX3BhdGNoX2lu
c3RydWN0aW9uIChzeW5jKSBpZiBzdWNjZXNzZnVsICovDQo+PiArICAgICAgICAgICAgICAgaWYg
KGVycikgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWIoKTsgIC8qIHN5bmMgKi8NCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgICAgIH0NCj4+
DQo+PiAtICAgICAgIC8qIGh3c3luYyBwZXJmb3JtZWQgYnkgX19wYXRjaF9pbnN0cnVjdGlvbiAo
c3luYykgaWYgc3VjY2Vzc2Z1bCAqLw0KPj4gLSAgICAgICBpZiAoZXJyKQ0KPj4gLSAgICAgICAg
ICAgICAgIG1iKCk7ICAvKiBzeW5jICovDQo+PiArICAgICAgICAgICAgICAgbGVuIC09IGlsZW47
DQo+PiArICAgICAgICAgICAgICAgcGF0Y2hfYWRkciA9IHBhdGNoX2FkZHIgKyBpbGVuOw0KPj4g
KyAgICAgICAgICAgICAgIGFkZHIgPSAodm9pZCAqKWFkZHIgKyBpbGVuOw0KPj4gKyAgICAgICAg
ICAgICAgIGlmICghZmlsbF9pbnNuKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29kZSA9
IGNvZGUgKyBpbGVuOw0KPiANCj4gSXQgdG9vayBtZSBhIHdoaWxlIHRvIGZpZ3VyZSBvdXQgd2hh
dCAiZmlsbF9pbnNuIiBtZWFucy4gTWF5YmUgY2FsbCBpdA0KPiAicmVwZWF0X2lucHV0IiBvciBz
b21ldGhpbmc/DQo+IA0KPiBUaGFua3MsDQo+IFNvbmcNCj4gDQo+PiArICAgICAgIH0NCj4+DQo+
PiAgICAgICAgICAvKiBjb250ZXh0IHN5bmNocm9uaXNhdGlvbiBwZXJmb3JtZWQgYnkgX19wYXRj
aF9pbnN0cnVjdGlvbiAoaXN5bmMgb3IgZXhjZXB0aW9uKSAqLw0KPj4gICAgICAgICAgc3RvcF91
c2luZ190ZW1wX21tKHBhdGNoaW5nX21tLCBvcmlnX21tKTsNCj4+IEBAIC0zMjgsMTYgKzM0NCwy
MSBAQCBzdGF0aWMgaW50IF9fZG9fcGF0Y2hfaW5zdHJ1Y3Rpb25fbW0odTMyICphZGRyLCBwcGNf
aW5zdF90IGluc3RyKQ0KPj4gICAgICAgICAgcmV0dXJuIGVycjsNCj4+ICAgfQ0KPj4NCg==
