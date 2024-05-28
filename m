Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E29108D1CE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 15:26:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z6DC3aAE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpY2K3c92z79rT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 23:16:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z6DC3aAE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpY1b25wLz3dSk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 23:16:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo/77d1sGNGdXRXxgUDzSgPtoNJmAFjc3nX+jqocngaEcSnp/Fcy6ScAue0d/2QIKVj0UlKqUg5FGT++PQU6oM+e3hSr8X5sY5wg04Wz/cBcosB4AOMSF2gDZRg6pFp7mZw7Y7eS2n0TmH2pfZahE0zYw5ye1UaB/RrD2tJ+Qj0sotywUL1VqCr031is5BP/cl8GQtrPJREtk98GmiTGKo0oXY+6oJTjgNlQpToTV/eesx1uv1MsYZrEzA3YKYLwnnoElnJhw3Ph67MnwTzpHb5L7NLxORn8Sy2bjXRtxrpZaFM1KH2NQX1ErArqfQ77Ooc3OwP/fLxrUcvxmGQCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1L94pQH/S9p6TE6QlvgzZmbL5qjuUVGX2OxySL6n3s=;
 b=LGsRsmf226gDZtq2CB3CtdjnIIEBY7tShzzXsWlN6ApDRE2uig2GpA8FVq1bAl3CahrvEYie9aB91CiqpcoDnAYZaFDjjPoGZHUJTZL8XNEXS9jfrsvPNWp4a/FofRQyfk/YV+eCo3XQd2yLisr98piGnvhOP6qW+o+B9qDlycVnO3E1q3EaIAEI5R+55aFbrtOlgwYSrFRUMgeFjD9Qh2sCWzUoZu1+y4LuD7TzCElW11sKZW6ttzVX0jcpiwkcgTKyYAb2eLYTAwHMCJcBa/8N10FGN61SsIEFI0ghQHm85Sk4TLXyoWTK2fC/bFaZln57Av2SfCbZ8HeERME/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1L94pQH/S9p6TE6QlvgzZmbL5qjuUVGX2OxySL6n3s=;
 b=Z6DC3aAEmL1yI5JfOSfM8u7gKyDekATZevBQfRuDNh9jhRcSegwEM36yQkxfKAATkYYdOlucO9vgwQpQkzIivQ2Pme5RWAozouMYdUxDgYNM543nI2q4aDKDZ/6p4A3VXXNa7otzydcq9sQnDB/E7z2j/KoCvlFkOqNlQokAIbhxB2HegStFy7Wfe2C4k/O/JufeVbHontwbtLGBZOe3KHpZcg3XvP7hw7Z7Z8Y9VtFOBcGEVf03wo20mz/LuP6xB78EYjNMvk2DJViB1by+OWWAFedO8wEN4BCVqUP2thSHxwtGkg13yp3XVD5oVVfp327RLyPtMFqsm3hqEP8IKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2808.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 13:15:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 13:15:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Esben Haabendal <esben@geanix.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Thread-Topic: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Thread-Index: AQHasPqmMfqmVewhqEGlyZE91CA3pLGsoFoA
Date: Tue, 28 May 2024 13:15:51 +0000
Message-ID: <eb911c50-2f66-43dd-a1ff-398a3e7c56a2@csgroup.eu>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
 <20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
In-Reply-To: <20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2808:EE_
x-ms-office365-filtering-correlation-id: a64545ed-eced-4f33-5da6-08dc7f184c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009|921011;
x-microsoft-antispam-message-info:  =?utf-8?B?S3gxSmM4cm9xV3Z3T25mU3J5d0RUN0JmemY0UXZId2V2Z2ozSFYxVnBxanJj?=
 =?utf-8?B?N3paMGJtRytWcmZkUmgyMWdibm44R2xaK2lzbGlQZzVkRkpHWHFsZFNWYVZG?=
 =?utf-8?B?NmNyazNCQWZQZllNR0lLTk9YZW1ZTDhpSlcxbFNoMHRHYUtCTzBPVjRLZ0FD?=
 =?utf-8?B?SUpTOWh2MWtjVG44S25KVE01YWdsZUZRTlVPWndlQjNLeWkwcEZxNWtCZDNh?=
 =?utf-8?B?dER3YzBId0NKTkxZMjVMd2VCVGhGR2hmL1FCcGZqS1BkcVJhY29HSmtxWU1n?=
 =?utf-8?B?RktWOGpHZGVWNWJmV3ZJT2pDTm50bXpCNm51eVYxUC9yOFB0WmN5dHVsU0No?=
 =?utf-8?B?c2dwTDM1UFBqL0ZpUnNORnpQeWxFeEVlUjgzS1lpNmUxaVl1aExWeDRMYk9j?=
 =?utf-8?B?dGZUaXl6c0pnNmhVSUpuN0hNRzBHKzBRZThSTXRhcm52SE01bnFFaFNVaFll?=
 =?utf-8?B?dy9mRnBMem5JR0NXNnZYQ0RJNXVsL3ZtcjkvUXJVOWl6UzBiK3dXOXhlaGNu?=
 =?utf-8?B?NG02UEsxMVVzNjNiZTJtaVU2UzRPaDlSeFNMcHpuT2M4Y2hpdmVySUpmaEpo?=
 =?utf-8?B?ckY4a3o3dDlPa0xlWVlEUVBWMkFMSGRnb0YxMzZoVWljZ2JJZHY2ZE5BSTUy?=
 =?utf-8?B?cUhic2pyVnZOZGpJSTAwN29ZcVRpRGcxbG8zUmhPSUFMQ25CZ3NOUWtXbFdG?=
 =?utf-8?B?YzIyNVlKSlFQbDN5aFNadmc2eTRkemZTVEhyQmsyaWcwcmtNNiszWXhnbzJW?=
 =?utf-8?B?SVMxU3FSVzdTY2U2d2E1SzAwelJVSzFxSnJUOElpUnRORHFIaGZrUFE5dkNL?=
 =?utf-8?B?eTRyY3MyWXFLcUMrRkZDYWRsd2ZERndCY3FCdU90VGc2bThaRHAzUlYzaVh6?=
 =?utf-8?B?aS9oc3BxY3pndlhSbU8weGNUbnJreklYcGY0RWR1T0ZZQXZTVVowREc5Q0li?=
 =?utf-8?B?RG1XY3RPTGRJOUdJb3lFZEwrNEdWaWdOeHBUeFlQMkJJRGRGNVVJMk5ENFV0?=
 =?utf-8?B?amU3c2N4UFBYblZNUzJUZnYra1pmOEVLdDdramd5a2JJMTIvMlE4YXByd0c5?=
 =?utf-8?B?YVM2YjNYb2NqcTR4bHBrNHZwUGViQ2MxaXFnRUhPN1Z4VDVQclBrZEpsZE9E?=
 =?utf-8?B?dUNFUzRWaWl6TEZaRTNlOTZUamZhOHlFWWs3bUU0MFFLMk9meG5RN0syeHZE?=
 =?utf-8?B?WWMxbFVyNDYwK1VvNFNMVSthc1pFWlljM1B4Ymo0Z2d5VVQwWnM5djI3anBh?=
 =?utf-8?B?TC9TVXdzWUY2TmR4dkRWd3dVV2VzbVV1cXAzeGw5TGdFckhhQzBKNWYzUDdS?=
 =?utf-8?B?cG1KK0g0cVZtUjFGRDd6c2xxYi9Hai9JV1lGNTZoQWJlNHcrMDBvTnd6UEFN?=
 =?utf-8?B?NVJkSFpHY25rOE9YbG1RTUFBam5jWUVqdlJEWWdHZGtwalVkV0JyVmRXdHFN?=
 =?utf-8?B?bzJ0SlVLZVJCcXZKRENWeGd2WVNqc1hnWERHbkREbldLVEQyUUlHeGI0WTJi?=
 =?utf-8?B?cmxFVXBpcWFNVlkvTzJwZjRFQ2tIdGxuTFZvOWxucitCSXFKajRJTzh6R1pL?=
 =?utf-8?B?VnFaZWZaN3VUQ1FVRXdNK0wydFkvT243a1dkdjBDMUUvYmU0N1hpNVQ0QXpz?=
 =?utf-8?B?dVl2aVJEeDJGMHFqbzNZT0tJOEEwekRPdFkydkUyL29PSEI5SkhDSi8xYWM0?=
 =?utf-8?B?Sy9OZEtacjBXUWU0cS9xSmpMZW0wQXR5QW50OVpFd2lEYUo1bzNWVE8wbFE2?=
 =?utf-8?B?K1p5SERuazhqRGc1QVZDZXlBZ1hNalBHRGFwNVRxMzlmQ0pnMmZzbnlRVklt?=
 =?utf-8?Q?YtrtmGeYwHNLc7hAD5IaNqavwpXQFOv19Cot8=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SzNrL3ZpNytPK21TUSsybDRNYkplNDNqRU1CK0NpcGZBVlA0L2hORGNWbDIv?=
 =?utf-8?B?RTFaeWIxdVZ2UDJPbjcyS3crSWlkSnJEYUtseENMS0FaZHpVWVlEQzRnZzFK?=
 =?utf-8?B?U0g0TXE5ZE1na3pOTGVqVHhoR0dtNCtJZFI0NUZ6RW4weWo0SEZmaGhTdWIz?=
 =?utf-8?B?UEFyc2ZldG1oM1NWY2NVbGxVVSs3KzBXS3lVNlc4R3N1bnRUWWhTSzJPUGRs?=
 =?utf-8?B?b2sxYWxMaUNja3lRTnlOTUR1OVBWdUYzTzBVRXo3WElyYjY5N0k1RVFkOXBv?=
 =?utf-8?B?OTVnTEMwZWNOWlZhUXhTY1dnUVNKaWcyUWUyNDZZVDArdG91NDhPZ2JaSlJp?=
 =?utf-8?B?SEJwQ2xNTVBxU3daRlRNYThKQm8rYXBaNmtHd3VreERneVVwN3RVYzZnYUts?=
 =?utf-8?B?citQdjB3aEtCUHRsSEsyUzI4L1k4eXhodGRFUnNQbEZ4R2ZCdGQ0WmtoY0tq?=
 =?utf-8?B?MGR2dmtxaVdSYzgxTUxHZXJLY0NSYUo0M1dxZng4ZWY2M3pQVFRIU0xJa2Vh?=
 =?utf-8?B?eUlrWVdxd2RDNThGN0xIakJTSkY1Z3QxcmRQcmV4OFZHSDB3SWNsdklVMytU?=
 =?utf-8?B?eXJ0MEJrR3dqVVVRUFgvb2l6bHZMUzl4QmEyaDlOaUlOY1lKajlTbXlhVTBN?=
 =?utf-8?B?MDJGakxVMU9aUEI5N2JQa1lrSWJxc0lhNGdId3VVYmhNd0NtNXgrV0lXZjBu?=
 =?utf-8?B?TkVsNzVrNmpLNnN5T1RDRVQ0bFhPVmlBNVJYZkRFYWtvWjM1Mnkwc2s4K0U4?=
 =?utf-8?B?T1BjU0N6MnNhdHowcFZ3ajBKZlpTQ0ZVKytHV3pYMmZCcEhRYXlqVXRUK2Fl?=
 =?utf-8?B?T1V6NzZDc1Q3SzFBblBrYTd6eWFZM3dXY01xNm5EUkhzTzc1dDBUN2ZBMVVz?=
 =?utf-8?B?SjVSOExKUmkvWWplVlk0NnJPTUhxM1kvTTlFQTI3bVlwNVdSWmZaa25WNEZI?=
 =?utf-8?B?L3YzTk91SVZ5OFdIREt4ZzRBcHZtdzBsbDFacnZHL2VmdiswRXZ5NTdIWjZ0?=
 =?utf-8?B?Z1h4MmlxN0J1cGNFR2hJS1A2ejNMUVkrd0NIdFp1M3RibEpFYkRGTzhXTThQ?=
 =?utf-8?B?dy9tRzRlZndJaFRNTjUxSm4xMWh0emtBRlRSWXhZOXlQTmhhU2FnMngwOVIz?=
 =?utf-8?B?WEFPMDdmdCtrNmpQemdUQzI0V2lOV0lwUjFBUy9BSUhWVVd5ZXZKaTZNek0w?=
 =?utf-8?B?cDNsZmt2dld2cUY3WFlDOGd3ZUVubWd1aFdWTEtycFo3U1RKYjBpMEJqSkND?=
 =?utf-8?B?NkhDTGh1aU96RXNoTHZDcmlHaENNdmtFK1Vtdi85Wmt5aXVuekxUOFFadmVn?=
 =?utf-8?B?Vk5aZmpMQXI4VFhHcVlPd0Zyc1pOZGJLckoyVzdnUmFuSXVtR3NZVE9XV1Ns?=
 =?utf-8?B?V1hJeUg1YnE2c0lhN1hJc1c0NWdrYWptdjRudDdUd0xqeWpML2sxcytYQmpv?=
 =?utf-8?B?TGo1dWljZForMkhqYUczNFl3RHM3ZnF6M1BhNUFuVFZ1WXZSczAweElIclZC?=
 =?utf-8?B?cm5EamJrUEx1WG1HV2ppRHZST3FObUg1UTR4MTZmMWZCWjNMT0M5aGxEeGxk?=
 =?utf-8?B?b1d6VnVVRTBJblZ2clNVdUpvNXNZdW9VY1NMNEFzMDcxazVPYU1jWHhhMHp6?=
 =?utf-8?B?Y2ZQcFRhRG5lODRaSTFSdzNja2hnS2Z2Zm9MaU5ZWjV4QmFzOHJsSW1GcW9Y?=
 =?utf-8?B?RlN4TGlVc3BuUXNJdDFwNnhyall6WU5HdU5xcVU2NUJnRHBueExZU3RKVmhv?=
 =?utf-8?B?VU01U2ZINlFsQi9Zd1lQK0U5a1lQaVpLRUtrcnQvZEcrcitzM3h5NEZiWitL?=
 =?utf-8?B?emllcGszK1Q4TURTMWFlbXJ1RCt0NlNRbHFZVU9ETmxNRDJaWFlYLzNhbk1V?=
 =?utf-8?B?bUFRVkhPZHpVSVVtWVRycE9DR0NMZnpCdENiUkxTN0FpNFV2SlJQSkU2VTFy?=
 =?utf-8?B?a25DeGNtWVRROUxvZHFEKzZWT2JmMkhOeWRqU2p4ZXQvbkI2TXNCMXhuUWVI?=
 =?utf-8?B?VjJRSW9LUURldU5TeEIxUlZxdUd0YUVQQzNIaGx6VWIrQUJOeU5TL01kN2F5?=
 =?utf-8?B?cHR5NkhramI5RndNZkU0S3BmeUhZYi9OSGVJMXg5STZsMHhhRjFVcTN6Z2Zw?=
 =?utf-8?B?YjhjR0NveWJxZldVQ0tmaHhsK3RjdTlBSGRrcGVRc09PZDVYSjJGSTM3NDVQ?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65A7491B0AA47E4BB7BEF6AC684371E9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a64545ed-eced-4f33-5da6-08dc7f184c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 13:15:51.1452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOtbTEVMlgQdQbnk6fqMj8Nx/D2bkMcXK5yYyyR3m15jUbiIUQkYmnWq+pxYF01VqbBS0xudmth6HZTDnzlWLV/0WawU56TsXryIgclm9Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2808
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA1LzIwMjQgw6AgMTQ6MjgsIEVzYmVuIEhhYWJlbmRhbCBhIMOpY3JpdMKgOg0K
PiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBlc2JlbkBnZWFu
aXguY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gV2hpbGUgdXNl
IG9mIGZzbF9pZmMgZHJpdmVyIHdpdGggTkFORCBmbGFzaCBpcyBmaW5lLCBhcyB0aGUgZnNsX2lm
Y19uYW5kDQo+IGRyaXZlciBzZWxlY3RzIEZTTF9JRkMgYXV0b21hdGljYWxseSwgd2UgbmVlZCB0
aGUgQ09ORklHX0ZTTF9JRkMgb3B0aW9uIHRvDQo+IGJlIHNlbGVjdGFibGUgZm9yIHBsYXRmb3Jt
cyB1c2luZyBmc2xfaWZjIHdpdGggTk9SIGZsYXNoLg0KDQpJIGRvbid0IHVuZGVyc3RhbmQuDQoN
ClNoYWxsIEkgdW5kZXJzdGFuZCA6DQoNCldoaWxlIHVzZSBvZiBmc2xfaWZjIGRyaXZlciB3aXRo
IE5BTkQgZmxhc2ggaXMgZmluZSBhcyB0aGUgZnNsX2lmY19uYW5kIA0KZHJpdmVyIHNlbGVjdHMg
RlNMX0lGQyBhdXRvbWF0aWNhbGx5LCAuLi4uDQoNCm9yDQoNCi4uLiwgYXMgdGhlIGZzbF9pZmNf
bmFuZCBkcml2ZXIgc2VsZWN0cyBGU0xfSUZDIGF1dG9tYXRpY2FsbHkgd2UgbmVlZCANCnRoZSBD
T05GSUdfRlNMX0lGQyBvcHRpb24gdG8gYmUgc2VsZWN0YWJsZSBmb3IgcGxhdGZvcm1zIHVzaW5n
IGZzbF9pZmMgDQp3aXRoIE5PUiBmbGFzaA0KDQoNCg0KSSdtIGZpbmUgd2l0aCB0aGUgZmFjdCB0
aGF0IHlvdSB3YW50IHRvIGJlIGFibGUgdG8gc2VsZWN0IGl0IHdoZW4geW91IA0KdXNlIE5PUiBm
bGFzaGVzLCBhbGx0aG91Z2ggSSBjYW4ndCBzZWUgd2h5LCBidXQgd2h5IGRvIHlvdSBuZWVkIHRv
IA0KY2hhbmdlIHRoZSAic2VsZWN0IiB0byBhICJkZXBlbmQiID8gWW91IHNob3VsZCBiZSBhYmxl
IHRvIGxlYXZlIGl0IGFzIGEgDQoic2VsZWN0IiBpbiB3aGljaCBjYXNlIHBhdGNoIDIgd291bGRu
J3QgYmUgbmVjZXNzYXJ5Lg0KDQpDaHJpc3RvcGhlDQoNCg0KDQo+IA0KPiBGaXhlczogZWEwYzBh
ZDZiNmViICgibWVtb3J5OiBFbmFibGUgY29tcGlsZSB0ZXN0aW5nIGZvciBtb3N0IG9mIHRoZSBk
cml2ZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogRXNiZW4gSGFhYmVuZGFsIDxlc2JlbkBnZWFuaXgu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL21lbW9yeS9LY29uZmlnICAgICAgIHwgMiArLQ0KPiAg
IGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgfCAzICstLQ0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVtb3J5L0tjb25maWcgYi9kcml2ZXJzL21lbW9yeS9LY29uZmlnDQo+IGluZGV4IDhl
ZmRkMWY5NzEzOS4uYzgyZDhkOGExNmVhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9L
Y29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L0tjb25maWcNCj4gQEAgLTE2Nyw3ICsxNjcs
NyBAQCBjb25maWcgRlNMX0NPUkVORVRfQ0YNCj4gICAgICAgICAgICByZXByZXNlbnRzIGEgY29o
ZXJlbmN5IHZpb2xhdGlvbi4NCj4gDQo+ICAgY29uZmlnIEZTTF9JRkMNCj4gLSAgICAgICBib29s
ICJGcmVlc2NhbGUgSUZDIGRyaXZlciIgaWYgQ09NUElMRV9URVNUDQo+ICsgICAgICAgYm9vbCAi
RnJlZXNjYWxlIElGQyBkcml2ZXIiDQo+ICAgICAgICAgIGRlcGVuZHMgb24gRlNMX1NPQyB8fCBB
UkNIX0xBWUVSU0NBUEUgfHwgU09DX0xTMTAyMUEgfHwgQ09NUElMRV9URVNUDQo+ICAgICAgICAg
IGRlcGVuZHMgb24gSEFTX0lPTUVNDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcNCj4gaW5kZXggY2Jm
OGFlODVlMWFlLi42MTQyNTczMDg1MTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZw0KPiBAQCAt
MjM0LDggKzIzNCw3IEBAIGNvbmZpZyBNVERfTkFORF9GU0xfSUZDDQo+ICAgICAgICAgIHRyaXN0
YXRlICJGcmVlc2NhbGUgSUZDIE5BTkQgY29udHJvbGxlciINCj4gICAgICAgICAgZGVwZW5kcyBv
biBGU0xfU09DIHx8IEFSQ0hfTEFZRVJTQ0FQRSB8fCBTT0NfTFMxMDIxQSB8fCBDT01QSUxFX1RF
U1QNCj4gICAgICAgICAgZGVwZW5kcyBvbiBIQVNfSU9NRU0NCj4gLSAgICAgICBzZWxlY3QgRlNM
X0lGQw0KPiAtICAgICAgIHNlbGVjdCBNRU1PUlkNCj4gKyAgICAgICBkZXBlbmRzIG9uIEZTTF9J
RkMNCj4gICAgICAgICAgaGVscA0KPiAgICAgICAgICAgIFZhcmlvdXMgRnJlZXNjYWxlIGNoaXBz
IGUuZyBQMTAxMCwgaW5jbHVkZSBhIE5BTkQgRmxhc2ggbWFjaGluZQ0KPiAgICAgICAgICAgIHdp
dGggYnVpbHQtaW4gaGFyZHdhcmUgRUNDIGNhcGFiaWxpdGllcy4NCj4gDQo+IC0tDQo+IDIuNDUu
MQ0KPiANCg==
