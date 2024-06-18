Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571490C18D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 03:43:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kvw9/6by;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W38fH1FbTz798H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kvw9/6by;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::616; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chaitanyak@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W38dQ1CdSz3w9v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 11:42:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz6BEx4CprwjUxnx0wQGmK6ABnqQWoGDgcRu/HJcZVFncWnK6kkJMxQwJgzNmkGBgJDxs1C5pfHJIJlJNxLkKUoHRhe55E9KBNgN4T8l3DdIRdurQsiEsoDU/8yCvyXv23fPA0C5hoQIfAPsbdLbOMaG0Vp1c1umIALwICbm7LsGSEyqcgarrbIB+KRK46DDD6isw4/YQcIKk+QvaLzvn/YsaxUxwmP9cMUGcdyCMTnUnoIkRxn8t2oIu+I5q5XFgUCKJXDVUOq9O842RKlRfO/liTF57I5HbpvEOBejQwm3kQhlcvnsheVMTbxxhgYbh1x8KvpyqFFJGcg5w3m/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvqBCrHLxrSkVI4/ya++JVzMGTBvamOk/ZlCrkTQ4C8=;
 b=iUD50X4pidXQFI7huAOAJe87IqTyF/Ec9wz+31dsQNX1kwzoDQwj20XfhW3EwHvi+aHGlWohHu4c9v6YkpknXy7zcopHJfGnCLMIqyKdZmxW2GOCO3ZQh+vUdfy1Dj1JIunF++ZK/4x6Z3h+Xkt1rI6mN/OkoxoujCMs+TYq1xsdJiLHUuDJodIzcaOlGiOwOTcdZFoRXz66OwfAhxkJi/5GY0bwUfrU22Vf0dLd9vhBHjnpj8fRAB2dcYDqSJQXIhOuWj4SE4PflMDWQtVEUG5xsCzJ9bH0D7sYzTfgPaJZ5CbZjjAbBMlAjwUYWqWWChvyqyBpkvqdMc3gtg2CTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvqBCrHLxrSkVI4/ya++JVzMGTBvamOk/ZlCrkTQ4C8=;
 b=Kvw9/6byNcgTDwCWHNJ8GC7jvqIfi3Ip1Pk/zNEco5FhrEdCCo15nbxxXFeZVMEIqEVwn5h3OCG4k8T7SMW72s6r/MD3i3OdZo7Fs2PG+lJoACJMG0Sl6ro0JsTSO7OaQXovekeU3RfCe8URm2SAbsB2G3sQ17t1oPiXUYi1ajWBqSi2yOKH/M3Q3k8Jp1EV+bGDZ6Q4mg+tldO0d3ugw9IU1/dnD7+Vpx4fCYJKfldOKXD3qpZ859mRFvvCGUlEtVQU87Z3Sc53cm6zfBidI3VyJkqFWr1jGgngBPEknDtk612To35RVbnnUvcaT5U3jM3ZhTIErcNTXZ+etRhkAg==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 01:42:13 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 01:42:13 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/26] block: remove blk_flush_policy
Thread-Topic: [PATCH 12/26] block: remove blk_flush_policy
Thread-Index: AQHawHz28nZoEIRw00+RUjxGUtmA5LHMwIGA
Date: Tue, 18 Jun 2024 01:42:13 +0000
Message-ID: <1060c01c-febc-40d0-95ad-0be879c05545@nvidia.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-13-hch@lst.de>
In-Reply-To: <20240617060532.127975-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|LV3PR12MB9143:EE_
x-ms-office365-filtering-correlation-id: 52b9fe8e-a740-4958-c050-08dc8f37e0ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230037|376011|7416011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:  =?utf-8?B?K0pRL3ZxUVBESk5qNlErZms4MytiZmxGcDNTSU04SUhsNUJNQTAxaURMNnVp?=
 =?utf-8?B?V1YvT2RxNlhmMWZESGFtQTJXdGQ1QXNMdjFRMVhYUlNmQjliU215WXFKSU94?=
 =?utf-8?B?T0J1UVFiLzAyaEdlNTZYeXpxd0IwRUJrSWF5Wk40TXp6SWhYZGtMMU5zbWdP?=
 =?utf-8?B?T2p1aEJrcG1XYjlZWVM3Z1h3OHpxZ1VvVE9UcVA2UlhjcnFWeU9ZbDBTclFO?=
 =?utf-8?B?VUV3bGQ4L1h3VlF5NlpOa0d2VysrNEc4YjdVU1VnK3MrWkFXL2pIUURuMGhM?=
 =?utf-8?B?K0d5TUFNUDNsVWR0K0w5N0pOQ1ovdDkyT0QxQkd1dGh1NlAza016bktORlM2?=
 =?utf-8?B?cGpqYjg3QmZCSnE2RDVHTFdmZXBwc0YzaklhS0lRVVpzLzFRbGRzMzFKUkU3?=
 =?utf-8?B?ZngzZmtQeDdzQWNyZ0tYNG8vR05WSmNMRWFjWDRvU2NFTVllVXRveTBPaU5X?=
 =?utf-8?B?cUpIRzA4Ym5HRnlHMGRmTFUxSHFkMUkvMHdlbEU4dEQ2NHNuc2NEWVpmdTFu?=
 =?utf-8?B?RUFHcy9PcWsyUW83Z2tMRCtvUlJiNm5ORGUzbXFGVmR2Uk9hYTc1Nnozd1d0?=
 =?utf-8?B?KzFZOWNIRkRnMnRKeGRuRkpQdE54REZ4ZmE3Y3NERlNibENPaFFRL2QyWFFP?=
 =?utf-8?B?YU05V2MxUnRMT05mQ2tpVXE3TEhFMVBCK1V0aVNVUWN1V0pGQzFid2RJTFVI?=
 =?utf-8?B?Qy9yZ1RObmxhOWgwWjVDeDNteGFJK2lrajBFeFN6bDJwdjNoSGhNelZDdm1B?=
 =?utf-8?B?Q3pIR1ErcC9tb1RBb1FMcENTSk9xQ1pkYUdkWWU1SEFELzhrSWp5dFZKcHBY?=
 =?utf-8?B?QTduckxkV3BpVmpEMElXMDlBUjVhMnNweWovMTBaOHQxUWl4UVZFLzgzUXZF?=
 =?utf-8?B?cmdFendlRnRMdHlHdG9HOWVvaUpMeUVBQlVleVF5M0dYbTVycC9oMFlmTUJs?=
 =?utf-8?B?NGd5MEJnaWFnOU0wZFBaWWR1OUk1UWIraHMrTzRiYzk0RHB3YWgyTmZpbmFB?=
 =?utf-8?B?RTNRdXVhN0JXdTdJRmZUY1p6bnFBYlpjZG5ESnlDZTFybm1HeCtjTUZ4bE5k?=
 =?utf-8?B?YTM3SjVQOFRMUG85N0FlaWFsdDBpVDd6NW1nOUZ6M2tNOE95bElKWHFiUFln?=
 =?utf-8?B?YzhiSCsvLzFHdDhGVUVNWTZZMWRNTlh4Z0tFREhoUm44Skc0YlMvdStWeFJN?=
 =?utf-8?B?Y0pEOUsxaWFXVCs3dWk2VVdtU0dmTVlqclNvU2xOS0pmZHV2eUc0T0dyajc0?=
 =?utf-8?B?alNJZnpTRkV1Y0xBRERzZlZUVUl3bFBSYklpWnU2Q2hDak5tZVhrSk9sVzhP?=
 =?utf-8?B?QnJsOTBUQVRQeGhmSDU4aExUUnd2VG1reElqRjNsZHpBWTQvWWVxSWVUaVRS?=
 =?utf-8?B?TzJYTGZMaGxmQ1VWTFpwd1BiZ250YzZnWXRueEk2c1d1U3l6L1Z3QU5qSDRZ?=
 =?utf-8?B?WHRHZ1lCZzlwRFNHbkNSS3hjWTFCVUoyWHRyOERaS2hDTUxPMUI3ZGF5U3VB?=
 =?utf-8?B?WHFqQTZxdlZuM2ZwMU92bmZoYmppQVFOR2E1aVVLaFJsOHAwb2hlWDNwN3NF?=
 =?utf-8?B?RTExc2lScHlKZE03aVcrUWtZN0dBbm1qQ0xHSXY5Rk1NRUhuVGVjYnBGN2lV?=
 =?utf-8?B?NEN5RjdwaURiK0FwY05FNTRmL2dRMUVtd2pSSzlsVDZwaXgxYkg4aGM4RjZS?=
 =?utf-8?B?aWF1bUQ1cFBpZjFPdVk4TDJiTy84ZFB2QW02amgzKzZVcWRIdGdkYWNZbmpw?=
 =?utf-8?B?TlJUKzQ1Tng2b1ZkbGJQSTJNK21PMFhGeW9xYXBIQm5YUldSbG5wTDlwRld5?=
 =?utf-8?Q?49GHNv/izdmHdk+Cr3zKjy9gUkccNSGAIcySk=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q0RwQ2hVVWprSzY0c0Q3TS9YMTdpZ2Y1SmxMbVVXek51aDgxVkZZTDNldkVJ?=
 =?utf-8?B?NnVBTHhWK1c2R2tNb0pxMUMxMWJZdEQxeVFrZjBpdkJHNUNRbkI5MnN2OW0v?=
 =?utf-8?B?SWNvc3lydzBYVGZ0eVplYzEyTlZxN1RTQU9qZEFoNHhzQkRtajQ5bWdZWUNs?=
 =?utf-8?B?b2NSUnpiSzR4eEJTaHR2Y0RCUGZGTnlDKzVDVUk0T3J0dlpmQ28wd1ZEdWZv?=
 =?utf-8?B?US8yZDJYREErVGJja2NUbUxzd3J3ekNCeVVBYUtuSWZNYkxyMThab05uSHZs?=
 =?utf-8?B?czJGQmdQV2Zzdml0bVJKeW1ZZ0dyaVZuTzdmamh3c1BTNXNWR2hzK3E0S0JF?=
 =?utf-8?B?RUJ6S1RnUFRoOTdxZWlBTjBETUhzYXM2RHRjSTdNVW8yNTk1a2psOUpPOTJ0?=
 =?utf-8?B?WDBIMEFncDdnanJMc3ErVkZVMFgzaWFUU0pWNGsrenlmN3NZNTFqYzk4SGpV?=
 =?utf-8?B?aStrL2ZQREFoV0lNNkFpazhaK1cyS25XZEpOdXZlQXZtVDI1WGF3ejhRZFZO?=
 =?utf-8?B?U3BBRTlKcnl5Q29yMFpNemxlWG1Zd3FwRFVvajViM2VoYmZOZlVpMlRiUzBj?=
 =?utf-8?B?RTBJam43Qzg5Z043U0k4RDJ0TExSb1JKUjlJQ3dVM2RPbmlVOWFxRUtFYzEv?=
 =?utf-8?B?am1lendYWWZlSldJZkluOW01aEVuZ2FoZzVSLzRNaXV5OUJReWEva1U1ekxs?=
 =?utf-8?B?bkJydHJDTGxyTml6b3VjWEtXUkh0MGFTcWtvRVlia05KRDZTektEREFNYnAx?=
 =?utf-8?B?QUNHNU1JaUFwVmZ3bGg4a2Z1OHU5RnJab2xzM3ZmazFmdVdFV3dVajhZOTVw?=
 =?utf-8?B?L0NtRGRvc2JsTDRDSE9VMjJxTk9iQzIrdzVuakUrRkFMNXMwRGUwcnRSZ211?=
 =?utf-8?B?dEFnbTNJVk1nNG9KZVpWVnI5RWJXVUFQbkpYWlJpSlVXeVdKZ0pwVUZaNzdu?=
 =?utf-8?B?SzZYVmc0S05HTUlkTEltNmVmQVd5cnFuT1hTVUw1YnRqUHc3VTVuM2NlUjdU?=
 =?utf-8?B?Z21Bd1E1ZFpUV25CaU05OUgxUjFGQW81RmVIRHQ3bUozUVBVVml6NnlBd01t?=
 =?utf-8?B?ekJPakJIYlEzK2VlbjdZY2lRTEFNUjFscG9yTnY4aExQV0tZU2dsbWxtTnFL?=
 =?utf-8?B?SnEybzJjMnNwTGJ6RlpzUHJpYUNMRi92NWtFMGdhZzBpWElYUFVJaWh6VGdk?=
 =?utf-8?B?dFdCUU9hSDRnL1hjOG14U1EwZkZmVUxSYlZ3MlQzMFU2Ymk5cU1NRVd0cnFP?=
 =?utf-8?B?ejNIbGprZENqTDZxM0JvNjNOZnIzT29Eazl3cXhiQkErdllkUkltWnRocHlV?=
 =?utf-8?B?dHlxOVpwNDMzdG1GUTNMVVNwT3RJTzFuK1NnS0l6cGxWWUNKdVdtTi9Fcmhm?=
 =?utf-8?B?YVV6NmNMNTFwV3FwSlZ1c3BMRUt3S3hTbHRFdjNzRENCUUxGaElhR3g5MUhn?=
 =?utf-8?B?dzN2MWkwWlVkOUpmaWdLejhvbHNGL2M5Q1E5Vnp5YWNKY05zejI5RitrS2NB?=
 =?utf-8?B?WFhueEd3ajUyb1VaZThRS3JXcGlaZldoZEF5cm8zUU1EdERGQ1pwN1JtRk9o?=
 =?utf-8?B?ejd5SDlzWjZiV0R3VUZlY0VLTFZVREpUcHM1NThBWnZzY1JjbENVOVBtZUxp?=
 =?utf-8?B?VzlFR0Nzc0xRSXJ3SUtvdkhYdVNNbnF6eVl4ZVZjU1lBOTg2UStaWEp2S0Jp?=
 =?utf-8?B?TXYyL09QTko5bmVhRG5xSzIrakZIanJ5Q2tpREJnRGoxdUk1d2pKaXpQbWp6?=
 =?utf-8?B?aWd0KzF1ZkNnRFEzMm14SWFadXBtN0ZFU2JTYU5DTTdRUlVONVBZdkx5eG5n?=
 =?utf-8?B?MDJDMnNvMnQ1bjVvajVqS0lKaFRDRzVXMStrNkI5RVRLQ1lQODVqcVVoR1hk?=
 =?utf-8?B?R0pQYk9BbkRMUDkwaFNYaDFSbUtmeXlZZWJMQmxVc282RzNTQ09CUysydDVz?=
 =?utf-8?B?WEFhMnlSS2FadW0rNzVxRS9aVGNyL2R6Y1A5MU5JeTZESWFaWGZZQjc0S2JC?=
 =?utf-8?B?cDdUUzJycjM5bHl0L3J5OGpWc0lQNnpVcTgvaFNmNUE4aFVBOEJESzhwT1lM?=
 =?utf-8?B?d2VIem9vOFlPYm0xTGRiTjlCd3BnSWZ3TlNEYzRGTUo3bm9kL2JURFBaRnkv?=
 =?utf-8?B?eUMzTlZmR2FxZURUQXpYN3ZuVktudFRsc3g1M2ZmVUUvOEVsb1BldUNnNHh3?=
 =?utf-8?Q?Zf/7lYEfeRH45bcTQWT3N7HCUIX1kADFhrRsQhhvTqW/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C038F52BEFB8F419B64CC739CDBAAE2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b9fe8e-a740-4958-c050-08dc8f37e0ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 01:42:13.5830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o6WqYsOoZkowW1dtrOjCSGbhd3lBCoC6MtH/Y9tz3WCPrl1k9cYw2gR+RauMyHkz5ngZPKhagSHPfMHoDmZi+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, Song Liu <song@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, "nbd@other.debian.org" <nbd@other.debian.org>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>, =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>, "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Lars Ellenberg <lars.ellenberg@linbit.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNi8xNi8yNCAyMzowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEZvbGQgYmxrX2Zs
dXNoX3BvbGljeSBpbnRvIHRoZSBvbmx5IGNhbGxlciB0byBwcmVwYXJlIGZvciBwZW5kaW5nIGNo
YW5nZXMNCj4gdG8gaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPg0KPiBSZXZpZXdlZC1ieTogQmFydCBWYW4gQXNzY2hlIDxidmFuYXNzY2hlQGFj
bS5vcmc+DQo+IFJldmlld2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGxlbW9hbEBrZXJuZWwub3Jn
Pg0KPiBSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+DQo+IC0tLQ0K
PiAgIA0KDQoNCkxvb2tzIGdvb2QuDQoNClJldmlld2VkLWJ5OiBDaGFpdGFueWEgS3Vsa2Fybmkg
PGtjaEBudmlkaWEuY29tPg0KDQotY2sNCg0KDQo=
