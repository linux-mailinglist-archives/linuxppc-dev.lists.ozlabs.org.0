Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E67878C3E96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 12:07:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EWE6Dmn8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdFXT3QZyz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 20:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EWE6Dmn8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdFWg5NJRz30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2024 20:06:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAx00E+dxHH6h6nJxDGp2RbV9ZxQy7/lyLkHPjF8C8UxrxaVdzd8G6OmrYx/YpzQh7VwTt5FAGfyD1YkRo9bwLKegPzGB1Sbge5NfFctQE6jsj/Pfch8N+cVlg6wFTVYWvgMtXXoPOOAktK7g3HgE4sNI8gVdR/eE+pn0tnhRKit0VGi85IneBuN1vabcmQSgdXaN9BbWpDlC719WO5uLx36Ck90OzeN34WnG9E4Y9cXg1LFByhayInGL3WkVQT5wx9dzY5djzud82slAOd9gQ9M39pT6z/+nHR32mv9+Ma1NTRzZzQuTzFBgKv6H5qJ/Z3KfFSsb8n9jUOIgeuhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sRZ4EroGg1vE10VoDsl9eIzp7bBhT13U+hwbSlynPg=;
 b=T2v18EDrqzgmkDU0mFJoj3KPT6hzTdRdO8Oshv1dXuqpqVTYYWm1K5mtvgjSjMxxkvPaLJZ4b4mlJpDBJPuwh699G27uFhLtQAsm/1aCvt7P7Ew+5hi65vWL+y/q5Cw0ytMofgl/7XuownHTWG31vPPpFnXFEv1UehbfmDdYnh4zYoRca53UCRdogPHPz8KxAzeFuDGi/j3wmc8hOftE6B87avM8cJmowrMLFJ2VnyCurSrKUnKVj1PSPqI7ucl2OsTYKtYHd6B4btTK+pgKBQl0bWMGUvlSmSkkGoubLQmwxU2sV9cSJwXiWFV0SFFdQhlSJ+/Lc/99HBm/2w8+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sRZ4EroGg1vE10VoDsl9eIzp7bBhT13U+hwbSlynPg=;
 b=EWE6Dmn8FM7Zpd5obwcPuOys4cG1H9grZNyWVNau+N8Huw/Ql5iAy/Gb/eUaQEczeltDZRfPtXuF+NVLNQGYZhiwtVvjJSEeL8gFr4AzLXhB+Mp+KtqQjyMThFVufkKiP8Qdz94IvTXlJ/HKWRem0QX4KUNEWYHG/x41/TIe8YXme9YbbXgKAXGfqFNHPcdLqD31EXEKYat+BD4GWhI7bezwNdcS1FFumGJHO7azvx2qjQQmF1GqmsqvGCj3qkop1HVUqGt6qqEP0e3Pz4nRQscqebZ2EyjWsSCOaDIf9+bjCSrdGlge9TGWzKd52pjIHY20S75WTq+wlUhgnq0OTA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2741.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:06:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 10:06:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
	<eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>, Hari
 Bathini <hbathini@linux.ibm.com>, "bpf@vger.kernel.org"
	<bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paulmck@kernel.org" <paulmck@kernel.org>
Subject: Re: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Thread-Topic: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Thread-Index: AQHapRzS5V6CS6/VaEeDDenad6RLJLGU8BuA
Date: Mon, 13 May 2024 10:06:05 +0000
Message-ID: <5763f25b-e9b9-4651-a401-4ea79b6db955@csgroup.eu>
References: <20240513100248.110535-1-puranjay@kernel.org>
In-Reply-To: <20240513100248.110535-1-puranjay@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2741:EE_
x-ms-office365-filtering-correlation-id: a78a605f-4f6d-42f3-52d9-08dc73344dbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|7416005|1800799015|366007|376005|38070700009|921011;
x-microsoft-antispam-message-info:  =?utf-8?B?ZXo4elY3TkEyZ3d2UTFrOVlSdG5SSkZQMTdMMWw0ZDhOL3R1R3oyQ0ExRUJB?=
 =?utf-8?B?dDhuT2NhKzVqQ1h6UEhJcnFvTldxVEd3U1RZSUVsSDhTRFBGa21rQkFwZyti?=
 =?utf-8?B?UTlzMWpuRUhETHZJSDNCeXdmYjhING1iMG04K1o0bUliT2dVcUtrNkFZSldE?=
 =?utf-8?B?eTMzYzNOOWlaRzhNVFNYY3RTU3dBU1Axd0JabG02bDcvb01wT3IrRDJydTJq?=
 =?utf-8?B?T2tXK3hSem1nWXJTUlZvTUlZY0FvSEhuanhnM01taUhMcVpMbkM3eXJuY0x3?=
 =?utf-8?B?ckNvV2xMc0U2MVpLMFZjL0VXVjVPYi9xZGJRRTZZeUZGZCs0SzNETUNFSm5n?=
 =?utf-8?B?T3VLeFZNOG1tK2o2ZUhnSmtQdzlra0lWZjZheWVYZDl6ZnhvWjVtbkhrdWVB?=
 =?utf-8?B?VTZCT1BJOCtlWUVBRUtHVk4yUjMxcjV2bjU0Z3pRZ1dYQlhVUXJTR0Vyc2NC?=
 =?utf-8?B?MkV1VmJxOWVoNjhKNGxnb1hkMFAyeTM4dnRmQlEyTzllMnFaSTlnMElVZVg0?=
 =?utf-8?B?VFVYMFRlellJelFnakNpcWVBdUVwd2szTHJYVURPS2pQc0sydWIyQ0pCdHZY?=
 =?utf-8?B?SVhDdm4xZzU3T1luNlc5aWVVSE5DWWtKeStROUFtK3ZqNjBkbXRiVFRxb0dp?=
 =?utf-8?B?Sit3S2hhQy9Ua3l2a042VTNrNVpIOWczeTIvVFdZT3RFeFBLVHY1blZjZ0d3?=
 =?utf-8?B?aGp6YlRFamR3OVJhWXlrRk9tWGJDeUo0NGpsem9Ubms0WjZQYktqUUxTVFRQ?=
 =?utf-8?B?Rm5VclFhMVZHUVM3VjlmcWJPOHdEWWphZVBCR2VyNVd6cnhDaUl1THNZMklz?=
 =?utf-8?B?dHViTXI2eTduNExpS0hxd0preW5ER0p3aDdFanhEMlpjTHh6RXB4OHV6THVx?=
 =?utf-8?B?Z0lHeG1OQ3lLVlo0d3Y4Q0FlWDZDaW42d2cxL3RyUG94NmdXKy9IY2kwQlFO?=
 =?utf-8?B?TVpDVFpQVGQyeUh0Q29ZWGpDem1FZVpkR2tiZDdCT25Eb2UxSURsZ25QVEM0?=
 =?utf-8?B?V3VETk9kSVNINStoWkFFUEM3YWs2djhRZGYzQ2xobUc1RlFLNmkvRXNaVnox?=
 =?utf-8?B?aTUvanZUd0pNbktrazBDb1AvMWNJTEduTUNvTDg1bVMrQmVwREVvamJTMnpJ?=
 =?utf-8?B?RnhwNUZQLzhHNFU3M2plSlUybFpMaFJsU01rbFMyMHF3QXNsT3ZRbU5NYmRT?=
 =?utf-8?B?cFBrOFB1VWx5Qmc1SERmdHZ6WlBzdk04MGRURkY4MkJBaW5Fd0NVaUxYNHpv?=
 =?utf-8?B?SFoxaXNRc3JHd1pkVEZLdFFuSEdlbk5CSWp1cnc0bXRqMEwzT25zN2FKa3lP?=
 =?utf-8?B?RFdNeDgwREdHT0NxeXNHQ3p4b1dUeWdJNm42OFMrN0FJWjlYWXZpY3VwU2Zt?=
 =?utf-8?B?dTBGMkNaWXlCQ1o1dERzOTdtSTV4NndsOTRISlJ4RXRIbEtoTWdqWGlxbUsz?=
 =?utf-8?B?S3JpSk96aE5iZFlZWDRiSmxacVBtdVdYamV5TXFxcDF6NGJOb1V0RUdlVTRW?=
 =?utf-8?B?UDMzYkZhOEtBRnd2a3NvNysvZk1lUEVxSmdiUnBFYUZPb1EwckVDOXh3dXpi?=
 =?utf-8?B?YWNERXRtcGdjK0x6R3lTcWNPTWhsejJPSmxhaFkzMzlGaEtxYVZLZDlGdFA4?=
 =?utf-8?B?QmlNMWtNZWQwWEFRMkVkdXNIS3MxZXlqU25tbFZTVm5XR25uSExXVXpUNGZq?=
 =?utf-8?B?eHNnd2JPc1k1UVdsR2E0TTRXa0YzY0Q5MENEODVVcVpJemRoaEJuYXRxN0xJ?=
 =?utf-8?Q?IGYDNwVvLNOg0wZQNA=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RCtmdi9jZVlSVmp4YmhBM2xDR2ZEQlZCSktOSDU5dUQ4ZUdQdWU5Q216eXVL?=
 =?utf-8?B?TFYvbEpXZUdzRXhrMVZpZzUvSjlRdFova2oza3RsbUEyWjFYVXRjQ2FMUHVH?=
 =?utf-8?B?citiK2JpYW52VlcxYnFyckZUZStpdHlpNDdGTnFMajlUSDRxOVFqRTFuQnFx?=
 =?utf-8?B?cys5ZUJtbWx2R3k4NmxDOVZodWtJRTZHbEwvbGtvd1ZmWGtQekpzc09GclhM?=
 =?utf-8?B?cnNNS284RmpBUnc3bUlTVFBDYm4xQ3BkUmRuYjN5bzZJaDVaWUtJUDYxTENt?=
 =?utf-8?B?cUFVVWtXckw3OXdHc05LendGUEpMZ0RXNXdBRjRCR05pTjVPdndqQTQ1RGQw?=
 =?utf-8?B?Zmhjbm1PNjg2NTR4cXhvcUVlQU8rNUtCaUttQVB0cjdYZXpURFgrSy9tM0tu?=
 =?utf-8?B?Mko4VndxNXdHZlpRUkFCSHJocElqa1NaelRpM3R4c2t6ZExsbFBMYWlvMERE?=
 =?utf-8?B?TisvV01MY3h1U1gxbjNSbHcxSFo0eHA5YnJ1ODN1bFZmeHRZOElmUEsyS1JO?=
 =?utf-8?B?bUhFQUNETUhBaURyd1BGQnFoMnAvQ0tNSmhDYllMTCtXaVFHcWUyNTVlQkZS?=
 =?utf-8?B?ZkwyWENraHkyVFpWQURvOFRQUUt0bm90YlB4NnZVQWo3VUxFUXUyQXllaE0v?=
 =?utf-8?B?RVk0THNiWmlEcExlaDE4NnJocXkwYlVMT2tsMUJJMDBQUnN2OS9adk1GZGNO?=
 =?utf-8?B?NzQvNmhLeEhLVjNPSTZ2OFF0d1ZTUmpnMEU3VXRkR0M2ZXZISStJaEphMUky?=
 =?utf-8?B?eFVzb3huWGVPK2RnL0xURTRPTmM1d3QvUjNRcExPcnJIYm1KOEJmcVhadFZo?=
 =?utf-8?B?eXJPQWNkOTVoaktNbUs5aTV1TWN2S2tQVHFKQm5XbThDRFFvK0tkcXdqQ0dR?=
 =?utf-8?B?S0cvY3AyUHllSHA4V3dXdUlzTktmUUZqWEZEU2VzVTVudyt6ekJxTFRmcU9X?=
 =?utf-8?B?cWRiVHdWTzkwbk5weGJFbUxQWXJnYjFaQVk4aEg4Y1NzV0F1bHFzWEQ5c0lx?=
 =?utf-8?B?VXFtZ0cxTllZQzVXY1B4WUxlY2dVaVVEZ1A4MFB3WFZxMWwyWEkwbWVSM0Nt?=
 =?utf-8?B?Y1hWN25ZNWFaRGpmN1VDUVpwZmVneEtxcmpoK3ZoeWhyZ2EyZThFek1zN2pX?=
 =?utf-8?B?dTg0emZ0Wlk3N2pnUCs3U1BiQXAzdVNoaTNiVG1SRUpNMUFHM3Y0bGhidzhZ?=
 =?utf-8?B?VjlRM1RRM2hLbmFQSjc1OCtlV01UWXJjVUdIajUxcHRjemd4NFh6ZFBvWmxF?=
 =?utf-8?B?bFRKb0Qyci96Wm9iYmthUU56M2RoT1hZWmdnc0pIVjNFSFhrRkZXaEM1Z3pv?=
 =?utf-8?B?NUNIaVlESmlDaUZ4VVA0L1lqbjJUNjkzUjVjZm43bk40WW9mZVpzVzFQZU52?=
 =?utf-8?B?VTl3OHFxL2RsZ0FLY0hTTzZ6RHZEY2NCYk9NYStlck90azd2UUltc1dmZU1E?=
 =?utf-8?B?OGxsYzZkL0FsZkNEaHlVa2YwcEpnWEN5UmxBTm5GTFNYb1RtUzMxMHRmNGFE?=
 =?utf-8?B?TXloREJUOHcvRWdDQVNKM1BiSjZQeU1kT0NWSUViVGpuQnhjTVZkcnk0dWV4?=
 =?utf-8?B?MHNock1QTTMxK2ZUYzh2aDByZ0tJNFJna1pqQmZEaVVBZFdmaFlmclh4RURP?=
 =?utf-8?B?T2J0RXpPQzFYaUlQMVpqRU4vYXFXaDR3ZEVZYm5YTDBVbGxiM1AwRWVTSkYv?=
 =?utf-8?B?VjlDZmhWUzdWYUk5cldIY3N5TXV1LzUzK3R6SVduRzFvUmQ0OFBXVzk4Z252?=
 =?utf-8?B?aFpXdzduTGx2WTFtNHNab201cWZmbC84dE5xKzIvL2pudU1sL3VEM1FOVXEz?=
 =?utf-8?B?WEt0VWcyN0pweDlKcytvODFSdSs3dHhiTndHcVNuMGY1T0pTblVJTm5tekNT?=
 =?utf-8?B?aGk2d2M3d2t5NHg5NlhPYUhzTHQ1bUQwc1g0cEFDMTJZamhnUjh2NGlVQTI0?=
 =?utf-8?B?R0JjUkh0dmtOTnArdllQTmpxc2gzRDdwR2lDRHFXbWtPM2RHTnVrOWVBelhp?=
 =?utf-8?B?V0ZQa1NBS2M5Uy9RbU82dXlFQlRxdEVzc2Vnc002cXhhVnBEVHNuK2wrblEx?=
 =?utf-8?B?a0pkN2xhb3ZPdmpEUmUvM3cwUDNvY3paNnczcmM2YjgzbUVDWlNBdzVkNUxQ?=
 =?utf-8?Q?GQDEOoigQKvqxwNuM0o7/magB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A13959FCC300D9438D2B3BC96B722DCD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a78a605f-4f6d-42f3-52d9-08dc73344dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:06:05.8989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9M/Ubit/jKWrjzq+mOAJ6OVOspaKmCSIebnN/n6hjEI1k94EX82i5EO/Q5O0xwdXggKyqRqQY9YN60C2gVd6CbWqG1LT3y6Kz2vfHPYaKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2741
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
Cc: "puranjay12@gmail.com" <puranjay12@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA1LzIwMjQgw6AgMTI6MDIsIFB1cmFuamF5IE1vaGFuIGEgw6ljcml0wqA6DQo+
IFRoZSBMaW51eCBLZXJuZWwgTWVtb3J5IE1vZGVsIFsxXVsyXSByZXF1aXJlcyBSTVcgb3BlcmF0
aW9ucyB0aGF0IGhhdmUgYQ0KPiByZXR1cm4gdmFsdWUgdG8gYmUgZnVsbHkgb3JkZXJlZC4NCj4g
DQo+IEJQRiBhdG9taWMgb3BlcmF0aW9ucyB3aXRoIEJQRl9GRVRDSCAoaW5jbHVkaW5nIEJQRl9Y
Q0hHIGFuZA0KPiBCUEZfQ01QWENIRykgcmV0dXJuIGEgdmFsdWUgYmFjayBzbyB0aGV5IG5lZWQg
dG8gYmUgSklUZWQgdG8gZnVsbHkNCj4gb3JkZXJlZCBvcGVyYXRpb25zLiBQT1dFUlBDIGN1cnJl
bnRseSBlbWl0cyByZWxheGVkIG9wZXJhdGlvbnMgZm9yDQo+IHRoZXNlLg0KPiANCj4gV2UgY2Fu
IHNob3cgdGhpcyBieSBydW5uaW5nIHRoZSBmb2xsb3dpbmcgbGl0bXVzLXRlc3Q6DQo+IA0KPiBQ
UEMgU0IrYXRvbWljX2FkZCtmZXRjaA0KPiANCj4gew0KPiAwOnIwPXg7ICAoKiBkc3QgcmVnIGFz
c3VtaW5nIG9mZnNldCBpcyAwICopDQo+IDA6cjE9MjsgICgqIHNyYyByZWcgKikNCj4gMDpyMj0x
Ow0KPiAwOnI0PXk7ICAoKiBQMCB3cml0ZXMgdG8gdGhpcywgUDEgcmVhZHMgdGhpcyAqKQ0KPiAw
OnI1PXo7ICAoKiBQMSB3cml0ZXMgdG8gdGhpcywgUDAgcmVhZHMgdGhpcyAqKQ0KPiAwOnI2PTA7
DQo+IA0KPiAxOnIyPTE7DQo+IDE6cjQ9eTsNCj4gMTpyNT16Ow0KPiB9DQo+IA0KPiBQMCAgICAg
ICAgICAgICAgICAgICAgICB8IFAxICAgICAgICAgICAgOw0KPiBzdHcgICAgICAgICByMiwgMChy
NCkgICB8IHN0dyAgcjIsMChyNSkgOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgIDsNCj4gbG9vcDpsd2FyeCAgcjMsIHI2LCByMCAgfCAgICAgICAgICAgICAgIDsN
Cj4gbXIgICAgICAgICAgcjgsIHIzICAgICAgfCAgICAgICAgICAgICAgIDsNCj4gYWRkICAgICAg
ICAgcjMsIHIzLCByMSAgfCBzeW5jICAgICAgICAgIDsNCj4gc3R3Y3guICAgICAgcjMsIHI2LCBy
MCAgfCAgICAgICAgICAgICAgIDsNCj4gYm5lICAgICAgICAgbG9vcCAgICAgICAgfCAgICAgICAg
ICAgICAgIDsNCj4gbXIgICAgICAgICAgcjEsIHI4ICAgICAgfCAgICAgICAgICAgICAgIDsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICA7DQo+IGx3YSAgICAgICAg
IHI3LCAwKHI1KSAgIHwgbHdhICByNywwKHI0KSA7DQo+IA0KPiB+ZXhpc3RzKDA6cjc9MCAvXCAx
OnI3PTApDQo+IA0KPiBXaXRuZXNzZXMNCj4gUG9zaXRpdmU6IDkgTmVnYXRpdmU6IDMNCj4gQ29u
ZGl0aW9uIH5leGlzdHMgKDA6cjc9MCAvXCAxOnI3PTApDQo+IE9ic2VydmF0aW9uIFNCK2F0b21p
Y19hZGQrZmV0Y2ggU29tZXRpbWVzIDMgOQ0KPiANCj4gVGhpcyB0ZXN0IHNob3dzIHRoYXQgdGhl
IG9sZGVyIHN0b3JlIGluIFAwIGlzIHJlb3JkZXJlZCB3aXRoIGEgbmV3ZXINCj4gbG9hZCB0byBh
IGRpZmZlcmVudCBhZGRyZXNzLiBBbHRob3VnaCB0aGVyZSBpcyBhIFJNVyBvcGVyYXRpb24gd2l0
aA0KPiBmZXRjaCBiZXR3ZWVuIHRoZW0uIEFkZGluZyBhIHN5bmMgYmVmb3JlIGFuZCBhZnRlciBS
TVcgZml4ZXMgdGhlIGlzc3VlOg0KPiANCj4gV2l0bmVzc2VzDQo+IFBvc2l0aXZlOiA5IE5lZ2F0
aXZlOiAwDQo+IENvbmRpdGlvbiB+ZXhpc3RzICgwOnI3PTAgL1wgMTpyNz0wKQ0KPiBPYnNlcnZh
dGlvbiBTQithdG9taWNfYWRkK2ZldGNoIE5ldmVyIDAgOQ0KPiANCj4gWzFdIGh0dHBzOi8vd3d3
Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vbWVtb3J5LWJhcnJpZXJzLnR4dA0KPiBbMl0g
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9hdG9taWNfdC50eHQNCj4g
DQo+IEZpeGVzOiA2NTExMjcwOTExNWYgKCJwb3dlcnBjL2JwZi82NDogYWRkIHN1cHBvcnQgZm9y
IEJQRl9BVE9NSUMgYml0d2lzZSBvcGVyYXRpb25zIikNCj4gU2lnbmVkLW9mZi1ieTogUHVyYW5q
YXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+DQo+IEFja2VkLWJ5OiBQYXVsIEUuIE1jS2Vu
bmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95
IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+IENoYW5nZXMgaW4gdjIg
LT4gdjM6DQo+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MDgxMTU0MDQu
NzQ4MjMtMS1wdXJhbmpheUBrZXJuZWwub3JnLw0KPiAtIEVtaXQgdGhlIHN5bmMgb3V0c2lkZSB0
aGUgbG9vcCBzbyBpdCBkb2Vzbid0IGdldCBleGVjdXRlZCBldmVyeXRpbWUuDQo+IC0gTWlub3Ig
Y29kaW5nIHN0eWxlIGNoYW5nZXMuDQo+IA0KPiBDaGFuZ2VzIGluIHYxIC0+IHYyOg0KPiB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNTA3MTc1NDM5LjExOTQ2Ny0xLXB1cmFu
amF5QGtlcm5lbC5vcmcvDQo+IC0gRG9uJ3QgZW1pdCBgc3luY2AgZm9yIG5vbi1TTVAga2VybmVs
cyBhcyB0aGF0IGFkZHMgdW5lc3NlbnRpYWwgb3ZlcmhlYWQuDQo+IC0tLQ0KPiANCj4gYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jIHwgMTIgKysrKysrKysrKysrDQo+ICAgYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jIHwgMTIgKysrKysrKysrKysrDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXAzMi5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAz
Mi5jDQo+IGluZGV4IDJmMzljNTBjYTcyOS4uMzVmNjRkY2ZhNjhlIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAzMi5jDQo+IEBAIC04NTIsNiArODUyLDE1IEBAIGludCBicGZfaml0X2J1
aWxkX2JvZHkoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwgdTMyICpmaW1hZ2UsIHN0
cnVjdCBjb2RlDQo+ICAgDQo+ICAgCQkJLyogR2V0IG9mZnNldCBpbnRvIFRNUF9SRUcgKi8NCj4g
ICAJCQlFTUlUKFBQQ19SQVdfTEkodG1wX3JlZywgb2ZmKSk7DQo+ICsJCQkvKg0KPiArCQkJICog
RW5mb3JjZSBmdWxsIG9yZGVyaW5nIGZvciBvcGVyYXRpb25zIHdpdGggQlBGX0ZFVENIIGJ5IGVt
aXR0aW5nIGEgJ3N5bmMnDQo+ICsJCQkgKiBiZWZvcmUgYW5kIGFmdGVyIHRoZSBvcGVyYXRpb24u
DQo+ICsJCQkgKg0KPiArCQkJICogVGhpcyBpcyBhIHJlcXVpcmVtZW50IGluIHRoZSBMaW51eCBL
ZXJuZWwgTWVtb3J5IE1vZGVsLg0KPiArCQkJICogU2VlIF9fY21weGNoZ191MzIoKSBpbiBhc20v
Y21weGNoZy5oIGFzIGFuIGV4YW1wbGUuDQo+ICsJCQkgKi8NCj4gKwkJCWlmICgoaW1tICYgQlBG
X0ZFVENIKSAmJiBJU19FTkFCTEVEKENPTkZJR19TTVApKQ0KPiArCQkJCUVNSVQoUFBDX1JBV19T
WU5DKCkpOw0KPiAgIAkJCXRtcF9pZHggPSBjdHgtPmlkeCAqIDQ7DQo+ICAgCQkJLyogbG9hZCB2
YWx1ZSBmcm9tIG1lbW9yeSBpbnRvIHIwICovDQo+ICAgCQkJRU1JVChQUENfUkFXX0xXQVJYKF9S
MCwgdG1wX3JlZywgZHN0X3JlZywgMCkpOw0KPiBAQCAtOTA1LDYgKzkxNCw5IEBAIGludCBicGZf
aml0X2J1aWxkX2JvZHkoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwgdTMyICpmaW1h
Z2UsIHN0cnVjdCBjb2RlDQo+ICAgDQo+ICAgCQkJLyogRm9yIHRoZSBCUEZfRkVUQ0ggdmFyaWFu
dCwgZ2V0IG9sZCBkYXRhIGludG8gc3JjX3JlZyAqLw0KPiAgIAkJCWlmIChpbW0gJiBCUEZfRkVU
Q0gpIHsNCj4gKwkJCQkvKiBFbWl0ICdzeW5jJyB0byBlbmZvcmNlIGZ1bGwgb3JkZXJpbmcgKi8N
Cj4gKwkJCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfU01QKSkNCj4gKwkJCQkJRU1JVChQUENfUkFX
X1NZTkMoKSk7DQo+ICAgCQkJCUVNSVQoUFBDX1JBV19NUihyZXRfcmVnLCBheF9yZWcpKTsNCj4g
ICAJCQkJaWYgKCFmcC0+YXV4LT52ZXJpZmllcl96ZXh0KQ0KPiAgIAkJCQkJRU1JVChQUENfUkFX
X0xJKHJldF9yZWcgLSAxLCAwKSk7IC8qIGhpZ2hlciAzMi1iaXQgKi8NCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBm
X2ppdF9jb21wNjQuYw0KPiBpbmRleCA3OWYyMzk3NGEzMjAuLjg4NGVlZjFiMzk3MyAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wNjQuYw0KPiBAQCAtODAzLDYgKzgwMywxNSBAQCBpbnQg
YnBmX2ppdF9idWlsZF9ib2R5KHN0cnVjdCBicGZfcHJvZyAqZnAsIHUzMiAqaW1hZ2UsIHUzMiAq
ZmltYWdlLCBzdHJ1Y3QgY29kZQ0KPiAgIA0KPiAgIAkJCS8qIEdldCBvZmZzZXQgaW50byBUTVBf
UkVHXzEgKi8NCj4gICAJCQlFTUlUKFBQQ19SQVdfTEkodG1wMV9yZWcsIG9mZikpOw0KPiArCQkJ
LyoNCj4gKwkJCSAqIEVuZm9yY2UgZnVsbCBvcmRlcmluZyBmb3Igb3BlcmF0aW9ucyB3aXRoIEJQ
Rl9GRVRDSCBieSBlbWl0dGluZyBhICdzeW5jJw0KPiArCQkJICogYmVmb3JlIGFuZCBhZnRlciB0
aGUgb3BlcmF0aW9uLg0KPiArCQkJICoNCj4gKwkJCSAqIFRoaXMgaXMgYSByZXF1aXJlbWVudCBp
biB0aGUgTGludXggS2VybmVsIE1lbW9yeSBNb2RlbC4NCj4gKwkJCSAqIFNlZSBfX2NtcHhjaGdf
dTY0KCkgaW4gYXNtL2NtcHhjaGcuaCBhcyBhbiBleGFtcGxlLg0KPiArCQkJICovDQo+ICsJCQlp
ZiAoKGltbSAmIEJQRl9GRVRDSCkgJiYgSVNfRU5BQkxFRChDT05GSUdfU01QKSkNCj4gKwkJCQlF
TUlUKFBQQ19SQVdfU1lOQygpKTsNCj4gICAJCQl0bXBfaWR4ID0gY3R4LT5pZHggKiA0Ow0KPiAg
IAkJCS8qIGxvYWQgdmFsdWUgZnJvbSBtZW1vcnkgaW50byBUTVBfUkVHXzIgKi8NCj4gICAJCQlp
ZiAoc2l6ZSA9PSBCUEZfRFcpDQo+IEBAIC04NjUsNiArODc0LDkgQEAgaW50IGJwZl9qaXRfYnVp
bGRfYm9keShzdHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCB1MzIgKmZpbWFnZSwgc3Ry
dWN0IGNvZGUNCj4gICAJCQlQUENfQkNDX1NIT1JUKENPTkRfTkUsIHRtcF9pZHgpOw0KPiAgIA0K
PiAgIAkJCWlmIChpbW0gJiBCUEZfRkVUQ0gpIHsNCj4gKwkJCQkvKiBFbWl0ICdzeW5jJyB0byBl
bmZvcmNlIGZ1bGwgb3JkZXJpbmcgKi8NCj4gKwkJCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfU01Q
KSkNCj4gKwkJCQkJRU1JVChQUENfUkFXX1NZTkMoKSk7DQo+ICAgCQkJCUVNSVQoUFBDX1JBV19N
UihyZXRfcmVnLCBfUjApKTsNCj4gICAJCQkJLyoNCj4gICAJCQkJICogU2tpcCB1bm5lY2Vzc2Fy
eSB6ZXJvLWV4dGVuc2lvbiBmb3IgMzItYml0IGNtcHhjaGcuDQo=
