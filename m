Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2128BDF50
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 12:04:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JTjt+jVS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYlQ6MrLz3fSc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 20:04:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JTjt+jVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYkj0ptNz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 20:03:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGWT4oa1OChSD7upnqiDPQbzybeQ4fpi1+ZsShoqcvKLVvoBzpgkF20cYcAmbbi1vO6t8odRr+dflgXn4uXYZfPWMp8/DxZBkwY9o4g+Iw3KuyNsr5PhQBLG39ap6RCSquNWFBsg2PFPxdJAcVChD4S1hzaJPwIU1JE9/oBLLPlYAOY+QE66L4umUY9CzSRKF2Kh/lZ0kTFEfR9DEfVXhz7vTml5Hu11cRtFhiOafPpE9R57u6dv+SWuF4RTBMFJCF+CsPoyVfjrVk2CsD03YndhF+WtR285bNjePJoGasEzckGeBQZZDcCao9Ns1gv/o9BcKPP41VzTWxgxzw1HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzphqq1NG8B9HmZpkMmC4ohjtJaIR+36j1HBMk6Edpk=;
 b=dAWjPwNBo9i0CPWlRXJdJLs2bXYluTJzoqeVKgSvUQYYZ45NkV8gficASQt3fZ0iycMz3rI5UNTX2BHfpUQ2+iMF10TuUbQpgakICaITyJw1tsS8z//epWPF16lCVL0ISq4Jg1VilQ+hf1KePJfJeiFHQtJ9H+OfFesCk394bYB40i+sYpcd39E++VInu3+wXiRd9uPtG+l45C8Q8iYG0QtQilSSFBVRcNHMDQQzFEzH/uKO7u0T5w21kliouGy/k3xYR3me1hU6ltqKGTz2Mb7A5iqh0h4fwyZPc5n85Iygrn9IHyV6+16Xe9BMxGOR9FLHlanbgB2YWhCif/rn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dzphqq1NG8B9HmZpkMmC4ohjtJaIR+36j1HBMk6Edpk=;
 b=JTjt+jVS7nFpudzZEODHExJ9b7sjND5g90p1plwifGv+1OenrGdG93rQKZCJi5KO4S7ts6ADYxG3HjQ+oYg7Rb9IRidnH+isUPWUxqR4a9j5+MO9TLMNKDOYo3GwNxTaRr+gE4yEQSe0knkfozpsaSibaLL/+KjdrGraxS/JbMO35eYpan+Aad1K7VN8SPcQj6i1fgyXuwSlWMrlyISfT8Gai50C950ApiMbV1ebbbFtqQKh1YHrpNuOcpDcnyA6YrnNsul0up3O97f05nFi5yl5YW4DXhsrZySeVObyXB+rbY0IbiZkIaMUEqF327+fMgEBWK8w2+UesC21Hl58lw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3659.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 10:03:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 10:03:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: [PATCH V2 8/9] tools/perf: Add support to find global register
 variables using find_data_type_global_reg
Thread-Topic: [PATCH V2 8/9] tools/perf: Add support to find global register
 variables using find_data_type_global_reg
Thread-Index: AQHan6+0Y0VouNVKREyFpHtxv5S0fbGLjB4A
Date: Tue, 7 May 2024 10:03:02 +0000
Message-ID: <05213684-d45b-4a6c-82ef-6ec7fd2653b2@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-9-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-9-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3659:EE_
x-ms-office365-filtering-correlation-id: a3488be4-64a2-462c-52d0-08dc6e7ce1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|7416005|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?a1FrblFxa1NWU1NwS3lQS0d4bFVWd1oybkQvVUlueFZzYlhRK0JzNTJyZmNT?=
 =?utf-8?B?dkdUemhsTzVQYTZjZjBvcFp5UExoNVAxaHZLQnVtVlVCRkJEak5RV3RQRmk3?=
 =?utf-8?B?dUJEUy92Tms1dnFMbXVJd2pIZUlPK1dwajY3U1cyZHY2a3BzWHZkWUZHbTlx?=
 =?utf-8?B?SDVpSDJGb0NadzBKL0taeVZGSnNrWlhqRnJ2V01WeUtlaG5xTWd0SWg1Q1B0?=
 =?utf-8?B?Vk52Mm82dHBGcTZuUm1XQ1NXcy9UNVpSYmwvYlFDSU9hNm9vNjdBcHc4WHFT?=
 =?utf-8?B?cDRxV2xkRlFYQ3h5MmJIbEZ1V3dFUStCU2RRQlg2Zm1NUmdqTlRBV3hBb3dS?=
 =?utf-8?B?Q1MvbngwVHFQb0dVdVJuWUpMenRIZmM4N0dvcTlRaCtQT1RaZnNuYnE2UUNz?=
 =?utf-8?B?b3E1WlFDZTIzWG1XTmdtdmJhQWJYOUdaSDRla0dqUDlLWER1K2dlRTRaUUZm?=
 =?utf-8?B?Qk1xb1l0VkpreUhxdlQyNnJvY1V2SStReFlRNnZ3V2JmcjRNRXRJYUZqU2Jn?=
 =?utf-8?B?cUpDcGlXNitCVkp5L1c1QWJCR2wzdXRRaE5FQkJwaHgvTHkvZDFOaGlsb3Qy?=
 =?utf-8?B?VHVHd2xQcFVPWGZYNmszcVVWMmxmT2dmZHBmVEdNaVBzSHdLbzJldm9ESU9R?=
 =?utf-8?B?RzhXUkgwNE1mdVRlKzJwSGovcklFSndIa3NQcWJYdlJ5T0J2K0NGZHQyOXNO?=
 =?utf-8?B?K2RvazZFUTVRb2J0WFhNMXJzV1hMWi9PRUlrbnVCdlBDM2ZLOU5lVk5XSmJi?=
 =?utf-8?B?ZDg0RjdZZ2lHTWxNemdRVEt4VUQyT3dCVkVMNysxaDhkdHhoVjQyOEcrbUYx?=
 =?utf-8?B?YkhwbXo1bHRBYnRpajJ0eEo5QWYySDhtUTIrY0N0VzQxOTFSOHhuZk1FWEt6?=
 =?utf-8?B?YkJoOElNMUdpOWpHV0hsTkV5OXRoeXNFOGN5bTVnM2JBcDg0Y1YyMzhybHVT?=
 =?utf-8?B?Y1F1OEt0V04rWnBuRWdwMWlTT3FDb1dmamN0NVFpTmZuUGV4TnNLemZvS3E3?=
 =?utf-8?B?VXF6VjZDTEFLWldHUVQ3L2pnNHVGVytzTDJZVlpyY1Zpd0pnNGJYSFFKVlZW?=
 =?utf-8?B?RXRmV0JydXc5NzA0bzdLN3F3aTh0bEhXTzh4MDZDNEdSb0RmN0VrMWxZQzRS?=
 =?utf-8?B?VTIwbXczVGlGSmp1dUg0b3BiZEUrVWVpbm1VYUhMNmpuRmpWRHFDQ2RrK1cx?=
 =?utf-8?B?Um56NW56U3I3SE53SU1KMDVYRHc5UEt5ZWRYM2Q5Ulh1L0J1YWJGQ29jNno3?=
 =?utf-8?B?SWRlL0JwbUhmUUgvbW5vUDdpR3NyZzZZbTVpNEFHVTJpeVdvVDR5NFYwQ3lk?=
 =?utf-8?B?QWd0UTBONERmUWNldGI2ZVlYVUIwSHhqU0JWR1FpZ2pNTzhTaEpmY1RKdVVh?=
 =?utf-8?B?WlBMMGlSRzdVTzRURHhROHQzQ0RGZVdHYzY2YU9rS09yMUJKdnNnZVp1ZGpZ?=
 =?utf-8?B?YlhtM3N2ZWZ4bDZTSk1OeHNDMjc0QW1zWVlJejRuUmUyYVc2aHVyT3ZDU0lP?=
 =?utf-8?B?eVlPZk5VYktpYjJkYXZ5UEVWQjIvenY5bDlzV1lXVVVndm5ITGk3UkxEamtJ?=
 =?utf-8?B?MWZmbjZ2cmNpS1pvNVFGWklsTUUvZHovWUxWM2hzMTVoTmgyRFVLbFBIREV1?=
 =?utf-8?B?WmhvNXpVUjZOWHU2RnhwY3ROY0dxR1BMRk9qN0Q3aUlwK0RqYkFkNVN0RG9z?=
 =?utf-8?B?MXY5RzFTNTRDbE55SEpCcSszQURFMExjajlwN2gvMEk2TjNEY3dXbUxPejVz?=
 =?utf-8?B?RzN6R2ZmUmtIbCt4OWxMWisvdmI3Wit2Z0ZxYktDaFpLZTU0WFpreVJYTTYv?=
 =?utf-8?B?SDlvY1BLN0ZicEZNb0hDUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NCtQRXVuV3RIbi9sK01oNldnZ3llcUNpN01VejBmczFWa1dieC9oQmhWakpH?=
 =?utf-8?B?SFRXaVAveUc0RmZCcEczQ2g4S3dISEF4RFdZYkcvamswZ2NVRGU4WSthTVQ5?=
 =?utf-8?B?Z0F1ajZzNDdnS01NLzh4SUFtWUVma203Wm5FU0RYcVZYUnhQUzJKc2REVDhK?=
 =?utf-8?B?NnRtaTVmM2k3eWVsTE5MeDRZWkZZT3JLRWlSNjJYckZGVS9FbGU5OTRvbzJV?=
 =?utf-8?B?ODhBVk9RZDl4bXg0dXJoYktYZ2lHRC9qTnhWUzY1K3NEeUFxNnUxOFdJMUgy?=
 =?utf-8?B?RjViNlA4K0krbm5wdGJvRXRIYjZRM2JGMGl6ZUpTUHg5TmFqc0ZBRWFYNXlU?=
 =?utf-8?B?eUZiNTNwZjdJNTV2VEUwTWNKMFlXblNlVWF5Y1lNdC96Q09vNG96bzh1NlNX?=
 =?utf-8?B?RFVtSVdDdzdWV2NtVnZyY1hVQTBEUHYrMml3bDFGRWNEZHR3MFNYaFBMMHlu?=
 =?utf-8?B?MkZVcDlnSmhROS9IY0E0VW5ibThjdzFtYnpOaXh5RThxQmNPTktmR0xxcjE2?=
 =?utf-8?B?MHBVL3FVNWtxYURmQlZLS2s3enhlWlFQUDdsN1lLY1N5SWJnNENZbjErZVhH?=
 =?utf-8?B?OFp4SzRabllNNlFNWmVqTlVMNHhlTjNVdWhhOUVWZXh6NlRBTi9lL3kyUFk1?=
 =?utf-8?B?NjFPdlhESU1HaFVDNENwTUh1TWg1L2FySHFrSnBJWWJRL0pZUy90czljZFNL?=
 =?utf-8?B?MUphMytnc01BM2VYWWxjWitpb0M5VW45cnRDTjFpRm5hdkFOTWxSTnZYWVNR?=
 =?utf-8?B?YzNwVzFsUStKaE1ySTkyUXo0R3F6d3UvbCtGSFE5VzQwYzhTb3l0NnBxb0c4?=
 =?utf-8?B?cU1mSDU2cEt6eXp6bDNmejBSWm9Zc2FVaXNCTFZsMnFXZVBzWUtyT0NQalpY?=
 =?utf-8?B?WFA3RXFBbTR3QlBUWjRpb0JRakhuMFlrNzQyazY5VW54bm1NeFh2cm90MGh0?=
 =?utf-8?B?ZHZuWEJjRzJRRDNlS2ZvSmNQejg2dTFjc3M4bkdoN3lkMUFVMnlOYXNZNzUr?=
 =?utf-8?B?Y2JydEZnNWpUWTJuT0ZxVE1wY0xFUkhJMDQ3L1B3RXlHamg4UERXYnViQ09r?=
 =?utf-8?B?NW11ZE1kTWdCTDl3bDRVQ0VYNXJxa3NlNDRlUHBtQmJ5RndkcXp6aFN6blNu?=
 =?utf-8?B?YnFRZVZTMjdSb1p0S0JLMFR2cnRNR3NGeTYwRXl3RFdmR0hFYmhTTHVBZUs3?=
 =?utf-8?B?cG1oeFJxZVNOSncwa00wS2xpeVdSSW1tTjcyMHByUzcxTlJtRm9IWU5sc2hS?=
 =?utf-8?B?TzJ3Y1BERVBDRnJFUlB2aTRDL1dJL01VdVRQT0x4eWlGUXg0WHhlb2JrTXBh?=
 =?utf-8?B?cm5nR2NJbE9JTzczOHM1V1pROUZnRVAyOEhycXZCWEJ6MllCU0FpSUZjRzdF?=
 =?utf-8?B?c1hVUnVBVHZtRFF6aHNTaEZIM3k1Q3ZlL1ZaTllBSTJrWXFad00zOFRwYXlE?=
 =?utf-8?B?NGxReHpyS1IvdEt4N1BQbmo2OTJwTnFzNXd4bHVoSHZGTzBaZnRZakFQT1Nu?=
 =?utf-8?B?OUF5aGRwd2JVMEV2b1hYZXVTTk5DVS80aWZqTkl6SnU4ZVlMb1hQSllSL1Js?=
 =?utf-8?B?c0h1dVFOa2t2Nm1ybVNkdHdiYUtRVVMyb043NVF5YXF1ZnN3VW93SDBKdFpa?=
 =?utf-8?B?NVBmZSttcXpaQm43RitHUTM4Q1JuVWhNNmsxK1pGME01WjNlUFM4Wk50MU5x?=
 =?utf-8?B?N3Q4SFZPTDN1QkRRaTliVzV5UWhrMlBoMnZxZEdNYXZIZVZDb3ZlK2NVdTJQ?=
 =?utf-8?B?bmFPN1FOZXhoRTdxa3lqWFVkUEllTlUvYW9CNUhxTW1EZWlQSWd4bG5aQ3pU?=
 =?utf-8?B?dzNrRGRMVnlzMnRTdTZadmtiY3Z1RkI1LzdJUkljMmJXR0RFeDZUS1U4N3Bl?=
 =?utf-8?B?eXlJdXltMUNqc2RWelpVQkFBL1ZsbGc1TThGOGkxQXY5OFFJckhaNnVhejRL?=
 =?utf-8?B?Y0NtWEZRM0sxQUNVYSswYnhkMG5vdnZtOExoQUhkNXJZOFdFemd2NWovNStk?=
 =?utf-8?B?UVlqUms3bUdjb2pHNE50QUpuMGhjNWRZZ1JHSU0zVWhUTVRBcWZrd05jMWRZ?=
 =?utf-8?B?QWF4ZmlMc2Q0RCtJaFZKRGsvdTJsaEJKTUZuR1JsZUUyQUFBQW5VdVVTeDFJ?=
 =?utf-8?B?THdLQUFKcXdLSmROK3BjYkpJcURwdFlmV2I3L1NEVnNhUWFma2RBMTRRYXBv?=
 =?utf-8?B?VUpHblpmSEZONERrdmx5UTFFVlN4ZGVBbkFUeWVlbXVBMU9TVkwrTHZrbEtY?=
 =?utf-8?B?UlAyUFpNUFdMZmQrNXUvallTRnh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3E42B8B0A11514EA8AAA2D8872C3298@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3488be4-64a2-462c-52d0-08dc6e7ce1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 10:03:02.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlQ2LB0D2+7KocL9I8l25n3ehUT4mMM9wQMJ1dnOzP2jEDI21P4RHoNn4wT6ImY6npzY1ErNUgedSzUiXKbi4WwOwIJzelBPL1tRIIBMljk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3659
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
Cc: "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA1LzIwMjQgw6AgMTQ6MTksIEF0aGlyYSBSYWplZXYgYSDDqWNyaXTCoDoNCj4g
VGhlcmUgYXJlIGNhc2VzIHdoZXJlIGRlZmluZSBhIGdsb2JhbCByZWdpc3RlciB2YXJpYWJsZSBh
bmQgYXNzb2NpYXRlIGl0DQo+IHdpdGggYSBzcGVjaWZpZWQgcmVnaXN0ZXIuIEV4YW1wbGUsIGlu
IHBvd2VycGMsIHR3byByZWdpc3RlcnMgYXJlDQo+IGRlZmluZWQgdG8gcmVwcmVzZW50IHZhcmlh
YmxlOg0KPiAxLiByMTM6IHJlcHJlc2VudHMgbG9jYWxfcGFjYQ0KPiByZWdpc3RlciBzdHJ1Y3Qg
cGFjYV9zdHJ1Y3QgKmxvY2FsX3BhY2EgYXNtKCJyMTMiKTsNCj4gDQo+IDIuIHIxOiByZXByZXNl
bnRzIHN0YWNrX3BvaW50ZXINCj4gcmVnaXN0ZXIgdm9pZCAqX19zdGFja19wb2ludGVyIGFzbSgi
cjEiKTsNCg0KV2hhdCBhYm91dCByMjoNCg0KcmVnaXN0ZXIgc3RydWN0IHRhc2tfc3RydWN0ICpj
dXJyZW50IGFzbSAoInIyIik7DQoNCj4gDQo+IFRoZXNlIHJlZ3MgYXJlIHByZXNlbnQgaW4gZHdh
cmYgZGVidWcgYXMgRFdfT1BfcmVnIGFzIHBhcnQgb2YgdmFyaWFibGVzDQo+IGluIHRoZSBjdV9k
aWUgKGNvbXBpbGUgdW5pdCkuIFRoZXNlIGFyZSBub3QgcHJlc2VudCBpbiBkaWUgc2VhcmNoIGRv
bmUNCj4gaW4gdGhlIGxpc3Qgb2YgbmVzdGVkIHNjb3BlcyBzaW5jZSB0aGVzZSBhcmUgZ2xvYmFs
IHJlZ2lzdGVyIHZhcmlhYmxlcy4NCj4gDQo=
