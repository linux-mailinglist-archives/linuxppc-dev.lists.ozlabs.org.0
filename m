Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF062F3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 12:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDFQn4QRvz3f34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 22:48:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1B1iWDBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1B1iWDBL;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDFPm6wN8z3blt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 22:47:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUMeUofJ1HnjD6xkFIUQHIEtITvYL9vDkGpWqWJHuHJQemajAxkpsmtCL/ld87VkNiEnTWM5BxYSM0fGH75TuaRV0WQLHBUWuyk9YReaHnK4blbb2fD77RPBIOlYuDvXUugHndNx287itSDF6bTgRuWbY2OBwZa2x1DuidsNtXsLH0cbsUxmPAqhsh27X2L6X95fCSitscSewO5Xasmq/RedHmK0keEG60Cp6AyHmASic8Ve91hQLZ/PmDpeW9Wq6Dyvsx+7D4ZgkOnbS653NJwnRIss7yHTZMIZS4P2WuadVkrDQsqkiMviVGsna9Bom85pQNz0g4A6Wn4DP9Bu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE2/e0BvNTRng0RAzY0f9UBabSEoDuqhb/et9dJCpwU=;
 b=oUxH1nYkkzgtCzUrJD7HiZ1R4fq7ndhGeqwLNEkHhZMjJoKncz4O3K60mhipv7XYN4QL/MnBD8Yc1oSgtcfx6SYwGgW+Rb9N1dObZMDulymeduwEVZSAwGsuDo3RQurge07XY6JjHPFCUNXQRAIdS73kJqPfLfJ5ZThnkE93gVP7FnM8jNfeTJozqPmnnWU2B9bz+Yqv3nEx6NXS8XVKDs2MpV7/o33/g7bZrz3q9/pUViV8DHUsQGUMevJawIJhuzew4jq2fZVwH1bfp8jqH+s/en7bL3m+FsNNj8+9EiaC74F0d6Okj8b158G+cf3CueZiBJ/HdPApxGjeFdjw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE2/e0BvNTRng0RAzY0f9UBabSEoDuqhb/et9dJCpwU=;
 b=1B1iWDBLAiHW2HNg74txh83ek9Fp7IOpeAfPeB3qhGa1vYialI5hg4wEEXlfJDr+Pf8mEcErNcdBgn32t0hqg+YtB//UDIPcuev/b64ML9mIbGcbM7/Yo+HsIp7jFBf13GMwIjw2+62uzzcJVOBByPMjJfYQYGxbAgx4WF4/OgzTiD/rdaeTvxrLKPglS45chMxYugS0E2C9R8CTGYnVBV4HCCkdLjskGNpQinqQ9dhOOmeZKNTMPhMoCiLuVEz9cjRJ8VNMzwEnlzj8pyH7Y8fEKcFJFFt0HF593FNl0VDzRck8HK4bD4LN+xE3f+K4hEdT6NUetxrhw28GmqlrPQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1788.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:46:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 11:46:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index:  AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcAgATvboCAACzCgIABp7yAgAF1qQCAAOn5gIABrkOAgAADd4CAAA1jAIAAI5EA
Date: Fri, 18 Nov 2022 11:46:44 +0000
Message-ID: <b2a8589d-3272-4c82-8481-9fcb6d8f9bfc@csgroup.eu>
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
In-Reply-To: <548de735-52d7-f5bb-5c85-370a1c233a08@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1788:EE_
x-ms-office365-filtering-correlation-id: 731ca713-cec3-4511-10a9-08dac95a9129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  puNwb5WRIUPnx4/WqlRph8aCfoMY/pnsr02Di27qh6SL971x+TE1NJG3OYalnpuNG+u3McW0enZkfl2O0L0j1g07so9Wi/dZMEMA4ZAmUhUtisYBCMas4WI6mcMGwxMEL3xAM7tSXbpmTcCZV96Z98LrbEuVF7Kx0M8XKpZHnf6qlQpwgQqocHEW+gKHqhND4ohYcNxTzrV72CLtcawmUrQu4G5DEWjerC7DGj1sbko8hTDaffPqm3hm65gRrzUHaBYZzq0rwU+FSG4sszanCjIIdsU8JEqmG/tOomzugc4hNmn0WlhYD/s+N8HTGR28/RBRYiwdYxo2twdVDR7aWOs7QHZkSm/GlwUgCy2+QcfhXZoc5qBkQSx32Xrfe6I2WQy9b7P5PTq0qnuMt+pND6uTkzWPeNUcJhjqy1DQgzOTGVnqVabSW9uaVWrk/B7qwb0dq8sm/mXB8ZcS6LCIqp1/P6XvgNSTvt6OG2ugqqyj8buw2DsTZriw8u/UEmI0iMPoHa8lO6xvWaZQ7brG3AT4q2aoXZUgnpZ3o3laPcpCluCd6POMEMA8guyqpuPEOINWc6oLlnd90vVMaMJcUAxUWnXoVEsJd42cppSJULLVXZLOmwcO1Tv6/qZ3sHQcWX+2uuRcb6CcWwRBW98UZPmDZS08HBaRbK7mZai44/B0R35ohgvLZ88CP+6P8JvqTHeA7FizCnuGeqwCPvf0PEJXNR2oPovnk/Grtj+mv37zlMBpaefZ6v5jjo3cAUh4
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39850400004)(396003)(376002)(451199015)(122000001)(53546011)(31696002)(6512007)(26005)(316002)(8676002)(38100700002)(66556008)(4326008)(66446008)(64756008)(91956017)(66946007)(76116006)(66476007)(86362001)(83380400001)(44832011)(2906002)(66574015)(36756003)(2616005)(41300700001)(5660300002)(186003)(8936002)(31686004)(71200400001)(478600001)(6486002)(6506007)(54906003)(38070700005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UzRvUUY1VXhxMGllRXpDcmtQbEQ5TmlaTWUrcXo1YXFLY1hGM2Y1Qld2T1pk?=
 =?utf-8?B?YmdzTEhYM2U3dmxCR0t0NjRhKzEzRzYvSVZZNXZiZHRnaThxLzhFRW50Q0U0?=
 =?utf-8?B?bGFRZGhiVU52d3RrRFVIKzhuUnlPMTBWVHdQcnJwWFd3dWZ6b2UwZlArS2x5?=
 =?utf-8?B?T1QzbDI4RjZJVTYrRE1sWEJ2eFFEQUZUOS82ZDJiVzJoWW1pSmpSeHI0cm0v?=
 =?utf-8?B?dDQ4eVNkT0t2RnVTeFI1dDE0VENKODNrNXdXQUIxcTZxdi9RUnI0WlpCQTBw?=
 =?utf-8?B?RXUyY1VOVXpQbjVMbFNsTzJTd2t6STFKYlg3dG9mVFoxUUhtR1hyZG9wRmlX?=
 =?utf-8?B?ZTR5Q0lhZHVkeFcvSUpmSTVFYmNuaUEyakRWL3ZHemxEb3JGcmZad2F6ckhE?=
 =?utf-8?B?Y0xhWStNTzZORngwc1pXZ1ZIN25xL24zZVFQYUlReVZLMGZ4cVNnc0ZKSlc2?=
 =?utf-8?B?eXNxcUk2d1RUVjdMa09uSTBsZ0Jkb0pvZThmcEtlZWhFRm5YenN1bUtkeHpo?=
 =?utf-8?B?UzVUbGZ6WWVlcUwvbUVCcEVNYUtZL0thUlJERUxyeWlMYTZxc2FyM25iSUJD?=
 =?utf-8?B?OTk1M09vL2VLN0FCNk5ZVGtsc1UrVTFtWkJKTFY3KzhDL2lQRnhoTjFSdm9r?=
 =?utf-8?B?UFRkbEtuRXFhRnNGUEZsNTRNSXYxK094Q2tmcjFuZjM1SnhBR1BYZmxkY3c3?=
 =?utf-8?B?MisvU3JWTGpPcmU0bzBSN0owb1A1NU92MXJQbGFjNFZxS0QzVUJRREl5bFdR?=
 =?utf-8?B?YnJjVUFhN1hKSmcwNTVadFpBMFlQaCtWcUx6dHAxbGEwY3M0eXI5cnA4K2J2?=
 =?utf-8?B?RjVNVHE5UUF6eGNVZUVRajRhdkM5YnRuMkZBZnlrY0xqalEzTkhpdncyL2dC?=
 =?utf-8?B?WU1OWmorL2lZRCsxVUUwRi8rMGV3V1pjWjBsRDBwcTFWTmZOZzRXL1FxeHFo?=
 =?utf-8?B?ZnRTdklzWlBEZTVHNkhubXdaZitnYXV4dzBUTU5tZnQyc290SVhpM3lpZGNk?=
 =?utf-8?B?SDVRUGVXRXdQczRaUWdvVnRNVmE5TEtrVmJrZXZBRk1TdlFvU3Z5WlFFaHRQ?=
 =?utf-8?B?SFNCQ0RwMzc0RjFEdmJ0R2Z6REZUTVhaeHNJdnhjYmk0amdQYjZsZTNZVVJ0?=
 =?utf-8?B?MmhNY1dqNmxtbU1FRitrSERnanh3d2cxMjZ6UlVGQzEyZlM1dWRzYU44TWxT?=
 =?utf-8?B?Y2xrNTQ4SW1nNXhETU1jeDJHWWwwckdmOFJGQ2FBSDFUaEx3NS8rZFVoVjVo?=
 =?utf-8?B?d3pJdHZNa2t0MnlrMmZDMWNadGM0OEVKbFkyaVVmODIzZWN0RWo2V1RBdUlk?=
 =?utf-8?B?OEwzTVh6ZHIrRlZ3M2hWcnFsZ2dSOTJoZ2FJclRMcnZZR1hnSlE5dGpRNXFU?=
 =?utf-8?B?UDR2VmZnblVNcjhVcnRwMEFMUmllRUc0b252Y1JESTkzdzQzSGFscHQzUHF0?=
 =?utf-8?B?YzJWT0kyY0JZeGxEWWVkMDF3dSthaTdMYS9sN0Z4Um84VVpTd0tuM1hYL1Vm?=
 =?utf-8?B?OG8xaTNZK3lQWXZKWlZjV2pIeWNWdUhGNEEyWDFGalIwUzFKaHkwTElsRGt6?=
 =?utf-8?B?b3dWY1FSOGhTaFRaVUVTQ3NXRU1xbzJsMlIvVmJtTGFEbDd2bmVTWDZ4MzVW?=
 =?utf-8?B?WExoZ1hXZEgxTXJrWkRDdjcwN2NzeFlGVG4vY01LZk5tSFNEc1pneUt4QjJ3?=
 =?utf-8?B?Q3NpZXRsS0xZWkVOamlNN3VscE9iVUZ2ay9XQVFxK1UrZ1ZxVGwrbWpnbHQ3?=
 =?utf-8?B?RFppY2tQVFpycUNyVUdVdXFuM0Qyb3haSmh0L3N0UnNoTG9kckJScE4zNFJX?=
 =?utf-8?B?MkpzTXlWcjJhak5yZi8yRTJjYU85bC9sekw4UnN3L09TU0dPMGI2cldHL0h5?=
 =?utf-8?B?SVhRTmFuc3JvdWMwUWluRjRzT2haeXhROUpGYmsybWp1bHNKWVUxUFFmRCt2?=
 =?utf-8?B?RTc3VnllY1ZVRE1Za3YxZVlXUDBjTnVIS2IrT0l6MlVmOUhJRllIdDZqNytX?=
 =?utf-8?B?c3ZRbG8waVdOYzZqWnJaT0ZRdUE1NE5XYmhnbFN5cDdRMEJKeksyS29ZT1Zw?=
 =?utf-8?B?UGh2YzVtdkp0cHl2LzlKYXdhaVhxbUNPM2VadUJ3cVhndDdTVEJGTXZhVmJ3?=
 =?utf-8?Q?9sv1WBpiTegIHArJFOnWlv/ee?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F0D4631398B884C902A1CF711363E5F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 731ca713-cec3-4511-10a9-08dac95a9129
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 11:46:44.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRIbs62Tsq9J7xewhPf5HPRBBZ830Y1guNf2qf+E+cr5aUH0Umq2futJiK1NHZ9C6Vn6nO6DEOEcL9UWQcwVlQcqfiI+Ob99T4KQvR3RYXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1788
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzExLzIwMjIgw6AgMTA6MzksIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDE4LzExLzIyIDI6MjEgcG0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6ID4+Pj4+
DQo+Pj4+PiBJIGhhZCB0aGUgc2FtZSBjb25maWcgYnV0IGhpdCB0aGlzIHByb2JsZW06DQo+Pj4+
Pg0KPj4+Pj4gwqDCoCDCoMKgwqDCoCMgZWNobyAxID4gL3Byb2Mvc3lzL25ldC9jb3JlL2JwZl9q
aXRfZW5hYmxlOyBtb2Rwcm9iZSB0ZXN0X2JwZg0KPj4+Pj4gwqDCoCDCoMKgwqDCoHRlc3RfYnBm
OiAjMCBUQVgNCj4+Pj4+IMKgwqAgwqDCoMKgwqAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS0NCj4+Pj4+IMKgwqAgwqDCoMKgwqBXQVJOSU5HOiBDUFU6IDAgUElEOiA5NiBhdCBh
cmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jOjM2Nw0KPj4+Pj4gYnBmX2ludF9qaXRfY29t
cGlsZSsweDhhMC8weDlmOA0KPj4+Pg0KPj4+PiBJIGdldCBubyBzdWNoIHByb2JsZW0sIG9uIFFF
TVUsIGFuZCBJIGNoZWNrZWQgdGhlIC5jb25maWcgaGFzOg0KPj4+DQo+Pj4+IENPTkZJR19TVFJJ
Q1RfS0VSTkVMX1JXWD15DQo+Pj4+IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWD15DQo+Pj4NCj4+
PiBZZWFoLiBUaGF0IGRpZCB0aGUgdHJpY2suDQo+Pg0KPj4gSW50ZXJlc3RpbmcuIEkgZ3Vlc3Mg
d2UgaGF2ZSB0byBmaW5kIG91dCB3aHkgaXQgZmFpbHMgd2hlbiB0aG9zZSBjb25maWcNCj4+IGFy
ZSBtaXNzaW5nLg0KPj4NCj4+IE1heWJlIG1vZHVsZSBjb2RlIHBsYXlzIHdpdGggUk8gYW5kIE5Y
IGZsYWdzIGV2ZW4gaWYNCj4+IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCBpcyBub3Qgc2VsZWN0
ZWQgPw0KPiANCj4gTmVlZCB0byBsb29rIGF0IHRoZSBjb2RlIGNsb3NlbHkgYnV0IGZ3aXcsIG9i
c2VydmluZyBzYW1lIGZhaWx1cmUgb24NCj4gNjQtYml0IGFzIHdlbGwgd2l0aCAhU1RSSUNUX1JX
WC4uLg0KDQpUaGUgcHJvYmxlbSBpcyBpbiBicGZfcHJvZ19wYWNrX2FsbG9jKCkgYW5kIGluIGFs
bG9jX25ld19wYWNrKCkgOiBUaGV5IA0KZG8gc2V0X21lbW9yeV9ybygpIGFuZCBzZXRfbWVtb3J5
X3goKSB3aXRob3V0IHRha2luZyBpbnRvIGFjY291bnQgDQpDT05GSUdfU1RSSUNUX01PRFVMRV9S
V1guDQoNCldoZW4gQ09ORklHX1NUUklDVF9NT0RVTEVfUldYIGlzIHNlbGVjdGVkLCBwb3dlcnBj
IG1vZHVsZV9hbGxvYygpIA0KYWxsb2NhdGVzIFBBR0VfS0VSTkVMIG1lbW9yeSwgdGhhdCBpcyBS
VyBtZW1vcnksIGFuZCBleHBlY3RzIHRoZSB1c2VyIHRvIA0KY2FsbCBkbyBzZXRfbWVtb3J5X3Jv
KCkgYW5kIHNldF9tZW1vcnlfeCgpLg0KDQpCdXQgd2hlbiBDT05GSUdfU1RSSUNUX01PRFVMRV9S
V1ggaXMgbm90IHNlbGVjdGVkLCBwb3dlcnBjIA0KbW9kdWxlX2FsbG9jKCkgYWxsb2NhdGVzIFBB
R0VfS0VSTkVMX1RFWFQgbWVtb3J5LCB0aGF0IGlzIFJXWCBtZW1vcnksIA0KYW5kIGV4cGVjdHMg
dG8gYmUgYWJsZSB0byBhbHdheXMgd3JpdGUgaW50byBpdC4NCg0KQ2hyaXN0b3BoZQ0K
