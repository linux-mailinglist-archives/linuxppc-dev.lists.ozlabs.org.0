Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB88BDF01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:53:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S/6HuyeV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYWg739Cz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S/6HuyeV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYVy527pz2yvf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:53:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7rKjD8LUylFcZ5BuXh83WgbMGVe5QX1Ck/EevxnH/4IX5ZB68f/hiDnIHz2hTLfmtJx6PV8JRN4kIp862tEQDkSbM8QDdm9sz0ZjcB2x4tC7EJX7l06ZiAoq55WvluXWVanviRlLP33VWSSttOyGF2H+zipf0PzmahfXt8LFWVcqQWenmpPnTXFGqka15HranKk5GJhlH7ycl8Uymbg90MRe53KtAElmVMPu05jrKnTAAeoLbddxY1aK/HSa/mlQuDF2zosU8vaexng4PZNJmuDM62LIUL7ZLDaKcg+df/YbGXxfKya1KMuVMxlsu7xA9bDTLec+j3THZURJacNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h9uHMObv32pQrphe+M3TpQD5OFoaOlkOJCGSrfRJQ8=;
 b=WQ3RSlJI4wlKyRhrqj20CIg/bSRRsTqNbLbNAgF6LkTkxdNj2Hg7RZv4hBZtZPAzPMPEVGRMKj+hei/dXzVjjSXFT2KjOklI1L+RC1SaRmn7hCUWqNUjwb7Fth8GpulouS8cfzald8S6FGs/eEpwbJe3gOLz/LLXPMgsoeR8l4i0oJM8IjXLSgOezJbbTGgZtgUund3HRUOHo3bPYqSVukGWyhetiWSFUZ7ZWyImi6qXMZaoyQm8jT8/9Y29+vn8FU+KyRGMgN0rtqXbOhsOZKVG8OCEEiCL+WQDkuqQIABGcOS4vM2qYoS8tBWwuqdxhJk2ooYiwm52h5Fw+Tjscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h9uHMObv32pQrphe+M3TpQD5OFoaOlkOJCGSrfRJQ8=;
 b=S/6HuyeVFE90e97+hhbvoLVxI6mMI39wJHNSnXDXfXEse8k6GqYty+ML2Yk3MH85aC9YL3ZDP7cH3X+C+xWsSMq8ZD2lkuEDXA6dGQ3tLntkiOLp9PGY2zRyO9b/fTkEz77Frbg4uH3FiqSHnT6hWq6i70C0ZP3jNGQ7Nzu+DocaTA+E7WUiYMdGM+n/LwDvqmkpZJUvwfH/xnwPEB6Njm5b2kFwqxr4b0rLlwewAEgvzo5KZ6SgUgpjuvf8eFK99PfLaSxCCBw2YQ9sDTvEUJ8sxbMHvQO1CPmYmp/jk5qUXts1uW1Pw8PAzDwQsF/F71pcWdKH2ebXqIDS69rISg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1815.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:52:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:52:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: [PATCH V2 6/9] tools/perf: Update instruction tracking for
 powerpc
Thread-Topic: [PATCH V2 6/9] tools/perf: Update instruction tracking for
 powerpc
Thread-Index: AQHan6+wyDVpwViFIUKDkLYmKEf3CbGLiUUA
Date: Tue, 7 May 2024 09:52:50 +0000
Message-ID: <d26d353b-2f89-42fc-a247-4c0a072990de@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-7-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-7-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1815:EE_
x-ms-office365-filtering-correlation-id: 38a72959-6b87-4fbe-a461-08dc6e7b7565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|7416005|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?aUJxdlhXSU1kWCtaUEV1cDRUSXlsaExuYmVpWVZXcjRxKzBMSTJPdFQ0MTV0?=
 =?utf-8?B?UFNlc2Uya1U3YkhRWDdzUnhZMy91RFBKd01UbGxtdjh0SXdBSXIycGZycXhz?=
 =?utf-8?B?YkVLVkdmRDV6bnM5OFN2dEdZc1NzaGtYdFpIWEZyQml0QUpIWFNSelp0VlRO?=
 =?utf-8?B?dHZ2bnVMV0txNUc3dTFuSzE4K2M1R3h1UDExOVpub1NzVmZwOWpScFZhTDFP?=
 =?utf-8?B?Q2R4U3VyYk9laURkallPWU5WeU9CZWtWSWt5N0tWM1JGRVFQZy9nWm91c3hn?=
 =?utf-8?B?Qncwa2pzUVZHQy80RnIzK2JadWw2ekpNZm1rWjQ3d2tsT3Z1ay9QRWtMZTNU?=
 =?utf-8?B?UVdCWjg2NW8zaTd3RVZYdHhITkJGd3JReklvREg3dGtrMVdlS2M2ODNwVFBD?=
 =?utf-8?B?ODN6OVFHWkdzdXRmWmhic2dyRWRVdHZVQjhIWVF5a2I3Y0ZMN01XV2YvUk41?=
 =?utf-8?B?cWZPR2dRNmU3Tis0M0pOUHlKaG84M0NTenZQdmdoS2VkSG5weUg2Q2V0bkxs?=
 =?utf-8?B?ejhYaTd6SzYrb1VTYThSRFB4Vm5qRUgrUzROV3U1NXpOU1B2WkZ4cFUvU2pZ?=
 =?utf-8?B?ZVBQTXROelkySjBPUEFYK0hiVFdtK1RERVNSMWZLSWlIUSt1RVNQQjBjSEsr?=
 =?utf-8?B?VTFVbEQrYmpxOE5jYzY0R3Zuc1U1bDZ3akdHV01lRFFUWjRPcU5QdTZkQm5I?=
 =?utf-8?B?Z21ya1V4enRzOWpsWFJYZENKSCsrSnYraWFjamZvd2NRanlWazJsZ3l3UE5r?=
 =?utf-8?B?Yy8vSS8rQ1hUaTNTQjRvUUQrVmxJVGtpczI4MklUYmlQek1nREVTbmltTUlr?=
 =?utf-8?B?TGR2cnhsRjg0dm9VSDhDRzUzQWZrTjRlSUNmN3J3N05OQVN2amh5NTlVNVdx?=
 =?utf-8?B?U3ZQVVRkbkMxRlpOQ29pVXA1K2ZXM1MvQXpGUWVzbG81Q0tOSkJncXN4YWw5?=
 =?utf-8?B?SU1zT1BrLzdwQnJncjkvRmpxWTdzeGplS0NLQ2VITkVhaTlFL3JSNlV4WWVi?=
 =?utf-8?B?VVNCZERmODUxMWt2MmpyNno0UmI1bkxXMEZUaWVwamVPUjh3SGgraUR0eFh6?=
 =?utf-8?B?ckdmSnRXaklXWHcyajhQa0FCY1JRYXNQYlFrU1BGQzJDT3JHR0lWN1U1SmZD?=
 =?utf-8?B?QkVwWmh5R3ZuaExPN0V1UlBacTJuU1djeXY2RDAxMUV3cUNDeUZCUzFqQnA1?=
 =?utf-8?B?RG84amxPZFM4cktVZnp5VWlQWnE5dVpacVBtdmE3aG1hakQzc2lXMmhNMFJl?=
 =?utf-8?B?L1NCQVhGbUlTMzJFa2xtK3czei90ckxvaHRYcUVPc1ozWXdsaWJKRE9peitN?=
 =?utf-8?B?bnovcUN5ZHg5OXlyenZyZ2xReURybVVod2Fta2MyQzVKS0xCbk5nTzV6cngw?=
 =?utf-8?B?SVlNb01vN1VQbUxZbUUxRUlrdFZSZVIyVzlxRGJJVHllME53VU4xU1lLNEFV?=
 =?utf-8?B?dkZIdDM4Qk1JYmNZS2FpZWZ1L1VQdnFpWkkzL1hRa01uYSt3RnZaV2FZZU8z?=
 =?utf-8?B?WmJ6NHlIMTZyK2tVM2FpSlVnSWVhekM5aFVJVHlKVkN1eDhibFJLL0wrRUJC?=
 =?utf-8?B?TkVzTmhWdm5FeFNCNVI1TVNWWWFRK0gyR3h0eFJnU1daU2ljQ1prL1NuZFRq?=
 =?utf-8?B?UU01azFuMkhjQXgxcDluQVJQckZhemVQNUtsZ3N2MERJczBUSXBSRDhEbGQ5?=
 =?utf-8?B?R0RMcG1jL3ZpVkFscXQxbldPWmhGZzNtRjlqd3FaaTRFaDluUVpiYUlCVU5R?=
 =?utf-8?B?UVZBbVd5bFpwTVphTlRUNWFsY3RjRHFwa1pPYWNFVHg0QUE0eU1MMThadE0w?=
 =?utf-8?B?Z2ZNb1lMMndiZU9PSGN1QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b1BtRWYrMmh0cU5jbnJnRURXN3VFZFJXZ3ptcEExSkdsVGJtZEJyTzhqZXYz?=
 =?utf-8?B?N3JFNmhadEZWckZzaVFmNU5XT3JWMDYzU05pZXNxK2Z0Z2JUWW9CU1VFT1BK?=
 =?utf-8?B?cVR1TGIxWDU2L0xVM21zS29yTU4rcWpUd2RxR0JkbWExUmdSOE4vS1NPblVV?=
 =?utf-8?B?TjZuc1R0QjlISk5xenIrYWR0cmFUc2pQd1VkT09TWXNRalRtVC9xdEhXVVYr?=
 =?utf-8?B?eGE0N3IybzVDaFB1YmFMNktYQ2V3cEkyK0lRUG4yN1FTclgrWlRsYWl3bGM2?=
 =?utf-8?B?WjYxSk5hVjQwSFZyMEtKcXZtL3V2Sjdtd29qTGJUK3BzSlRHZ3dxQWpHVUFM?=
 =?utf-8?B?bURoMU1KQy8yaHdqY2VmWCtvODFtRVdLRXdOZGZoUENRRW1rMngwTHlLK0Mz?=
 =?utf-8?B?REtwbzZlbFhBalo2TzVvTWdOV2hucTc3eUtleU85TmxDVEx2dHozdGdERVZN?=
 =?utf-8?B?eFhtZmMwN0lNekZPalZ3dGROWEJTZ2RFazZQbDlaUFFOMW5nWTFsWGRvRVBU?=
 =?utf-8?B?S2hwbGV1RzRhVVdSeHhNS3FnVHNzRkxhellFQXVJSm8zM2ZPTVhnTnU5dFRh?=
 =?utf-8?B?b1RxWDlIcU56Rm1GN1Jsa2NxT1lBL3FnU3FxQjlHcG5Xd1JGeGFXanViTEdt?=
 =?utf-8?B?eE43cERQWnpmcnRvVVFMQ2J6RkZ5bHRBSHBrZW1tU05zU2hZSWNkSElUNDF3?=
 =?utf-8?B?c3g0RnM3dDV1MEpmUXUxQzJ4ZUN5VWpZdUZXSFJ4MldWOHdtVHJDcHR1VXR1?=
 =?utf-8?B?V3FZd08rdDNUOTk3VmxKbVpPRDBBcWw1SGtUZXJLVHJCYUlVRHRENVBiODJs?=
 =?utf-8?B?SDlBdXlhdFZrWnJuZXMxV1huRXZxZm9xUkU1R1hBQW9rQzdIaGdxZnJoazF4?=
 =?utf-8?B?eWw2YjZta1VxcVMzeThjTE83eDVJdnpwdzQ2aDhiUVF6RFFlKzVnWTBESVM1?=
 =?utf-8?B?aHNhd1FCK0I3MXVXbnZRTFNST1dNdjluTnlsczM0VFV2TE9HVElBQzNqSkV5?=
 =?utf-8?B?aWxJVlk1Z3N6SVovaXZYT3hNd2NNb2JOT3FpeGdValFyclkvWVQzaE0vNXpx?=
 =?utf-8?B?bjFpeFRTa1BzWDVOYnVQZGRDU0t0TTBST0tJaklSVkxjZk1BL2xoUk56eG9j?=
 =?utf-8?B?OE5HNDMwZnpBMk1ud25qc1lPdUM2dVpjUUNqdFdRK1FidnhTVkRHOGJDOW1L?=
 =?utf-8?B?TXA4eVVRZURqb0txd2NPc0Y1amJLckxpVkNSL2NmYURHT0VWbkZTSGJoVTlv?=
 =?utf-8?B?UEs2SFYyaUJHUjAzYklSbHB1UkdVckg5d013Wkxoc2tmUi9hWVBjQzZIS0dB?=
 =?utf-8?B?Ri8zMVlBa0Q3bFhML1hBK1JHc0ZtOUk1blcrU3M1M3psbXVuQk14bzZoSE9M?=
 =?utf-8?B?bTVTUE5hTVVHeVFua2FZWnduVVdlMWZsVG91SWp3N2xFdC83d1ptMXVsOWIz?=
 =?utf-8?B?TFZDeWRaZWlmbjFsWkg5N0dnanpCQk55NU9LUjZieG5rTU9MQWJmWWhMS29Y?=
 =?utf-8?B?bFpmRy92ZkF5aTlIVDZURkg3d05ET2N6cVo1MzVOYmZSTm5jR3BvbFpQWVdn?=
 =?utf-8?B?RXBORjJvd040c1hhKzc5M2dMZEtUdlRkSVFtVEFVWW03T3dHRFFDYWgrZ1dX?=
 =?utf-8?B?M2FMc2Jrc3lTY3d2ZTJiNHZUT0RxbWUvRTlndkpLaDdJSkhWaWFSQ2MrUUtW?=
 =?utf-8?B?dzZuYkREMmNGNFJFS3RRS1d5cmFIMHh0SzBvM2NSTjdSSnprM2s3NHBuQ3lu?=
 =?utf-8?B?ZmxwY3ZMWEJ6UDVLazdTd3k2RDNpZ3RVUnpJbUZma3hKZ0g5U2tyK2NKZ1Rx?=
 =?utf-8?B?KzVhazVVdVQrMU5iT2haVFNhc1MrZ0ltUTZXQkwveDcrem5TbTNtU3h3aFNF?=
 =?utf-8?B?MVhrcU00YlhTbjN1S2pjUzI4eTJpWS9COWY4Y3g3V0h1cXMrMHdsR1hJS09l?=
 =?utf-8?B?U3NyaUVKck1DaVpyZzJvOEpVMW5wbWo3Vk5rYUVNZmZhR2d4VDNEL0N2TXhX?=
 =?utf-8?B?VHlKNXhibTVSUlRSU2hxT0xtTjNxZUE0SFVud09CbkQwWjZtUVpVUkkvQWtr?=
 =?utf-8?B?ZHdyeW12cE1TdTVCMG1NRWlQblNLQXJmUTQwYnoyK05HZmx0WFQySzlsZHpx?=
 =?utf-8?B?aTh6WnNlN29ESWRXVW5OZ3RYSzI4emJxc2t0eTlyWHo0WUZPYU91Y1JYS1kr?=
 =?utf-8?B?dDhGb2NKSG81Uk5Ed1VHUzNPRUVBalpDKzN1dEJVc0hPSkRJd3A3MjN6dWhK?=
 =?utf-8?B?aXlwN2tpZ0g0R1JqWHBJMUIrVkRBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AAC78FAF585B543A5D67ABC89E280CE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a72959-6b87-4fbe-a461-08dc6e7b7565
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 09:52:50.9043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6CPeJJN1rFgyK1ONaNCJ4pq4ozfrnaqZV/WGB4tciqqpKRjGvZahqf02onkBzniUt460fque6AgTXe+E7cbCrIjvkb0UA8c+qkYpFt9TB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1815
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
QWRkIGluc3RydWN0aW9uIHRyYWNraW5nIGZ1bmN0aW9uICJ1cGRhdGVfaW5zbl9zdGF0ZV9wb3dl
cnBjIiBmb3INCj4gcG93ZXJwYy4gRXhhbXBsZSBzZXF1ZW5jZSBpbiBwb3dlcnBjOg0KPiANCj4g
bGQgICAgICByMTAsMjY0KHIzKQ0KPiBtciAgICAgIHIzMSxyMw0KPiA8PGFmdGVyIHNvbWUgc2Vx
dWVuY2U+DQo+IGxkICAgICAgcjksMzEyKHIzMSkNCg0KWW91ciBhcHByb2FjaCBsb29rcyBmcmFn
aWxlLg0KDQptciBpcyBhIHNpbXBsaWZpZWQgaW5zdHJ1Y3Rpb24gd2hpY2ggaW4gZmFjdCBpcyAg
Im9yIHIzMSwgcjMsIHIzIg0KDQpCeSB0aGUgd2F5LCB0aGUgY29tcGlsZXIgc29tZXRpbWVzIGRv
ZXMgaXQgZGlmZmVyZW50LCBsaWtlIGJlbG93Og0KDQpsd3oJcjEwLDI2NChyMykNCmFkZGkJcjMx
LCByMywgMzEyDQpsd3oJcjksIDAocjMxKQ0KDQpBbmQgd2hhdCBhYm91dCBzZXF1ZW5jZXMgd2l0
aCBsd3p1ID8NCg0KPiANCj4gQ29uc2lkZXIgaXRoZSBzYW1wbGUgaXMgcG9pbnRpbmcgdG86ICJs
ZCByOSwzMTIocjMxKSIuDQo+IEhlcmUgdGhlIG1lbW9yeSByZWZlcmVuY2UgaXMgaGl0IGF0ICIz
MTIocjMxKSIgd2hlcmUgMzEyIGlzIHRoZSBvZmZzZXQNCj4gYW5kIHIzMSBpcyB0aGUgc291cmNl
IHJlZ2lzdGVyLiBQcmV2aW91cyBpbnN0cnVjdGlvbiBzZXF1ZW5jZSBzaG93cyB0aGF0DQo+IHJl
Z2lzdGVyIHN0YXRlIG9mIHIzIGlzIG1vdmVkIHRvIHIzMS4gU28gdG8gaWRlbnRpZnkgdGhlIGRh
dGEgdHlwZSBmb3IgcjMxDQo+IGFjY2VzcywgdGhlIHByZXZpb3VzIGluc3RydWN0aW9uICgibXIi
KSBuZWVkcyB0byBiZSB0cmFja2VkIGFuZCB0aGUNCj4gc3RhdGUgdHlwZSBlbnRyeSBoYXMgdG8g
YmUgdXBkYXRlZC4gQ3VycmVudCBpbnN0cnVjdGlvbiB0cmFja2luZyBzdXBwb3J0DQo+IGluIHBl
cmYgdG9vbHMgaW5mcmFzdHJ1Y3R1cmUgaXMgc3BlY2lmaWMgdG8geDg2LiBQYXRjaCBhZGRzIHRo
aXMgZm9yDQo+IHBvd2VycGMgYW5kIGFkZHMgIm1yIiBpbnN0cnVjdGlvbiB0byBiZSB0cmFja2Vk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXRoaXJhIFJhamVldiA8YXRyYWplZXZAbGludXgudm5l
dC5pYm0uY29tPg0K
