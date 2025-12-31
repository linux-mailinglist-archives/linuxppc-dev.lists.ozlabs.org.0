Return-Path: <linuxppc-dev+bounces-15108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899FCEC4F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 18:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhGXC2jHNz2xWJ;
	Thu, 01 Jan 2026 04:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.208.51 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767200667;
	cv=pass; b=jLjRC2ESWFmqLYL1I44If/QQlTe0VDxzpfG6+so3uNQbpSL6oGjnAa5lZxuQhyOVkfSIff4Oq1qCb3t/QEGXDumS+aEpYi9Z695yoN2mjsG94TUsGBztvndT9ZbJShnGuyLpcGG2F1rv07l+E6bNUjlNy5a11cVIVTi9J3+C7Vk+B5bOShYLvEHMKC5z4HCFXLRVP6hlk8jzPm28QHDHdLbkEDANxlZnDewlVCHG+bgDVOMhYb4K6Q2+wxBbPyZHcJ0Hw6EqrdWhqyx33hi+Hc1wf8f5p3p8Gq4fSp9pZ/IJlrM+1jFU3MW2SPB55OP7MRiFf4ScoqGJ7LE2HpzpJA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767200667; c=relaxed/relaxed;
	bh=iS8t6yKIjPtbhakV7RG7h6kXVh/HaGNDnuA9vrFFUAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dZyz4ceOtjfzevKiwKND2CTfGLHP7zPiYItwmObx6+916euOL4RnE6P4aigRwAl4QOGDJoaAB86IxHVRiMx2RRtToifWVetyJSle6z+ywhZMYFHyP7DCmBqDEw2MhSzzXx9MTi12hLNERHeHg/42VWfkEp7H74uYBoTS6+7zW/IFRqCUYWRqBOA5zevsJGJsigEJJmQmq9m+RxVry7jAAqerTOM8A+0v3NoEMw/cZPauTucC6rggBfdrOrDmFatRDaGSpprWQT2NWEJDzxl8eW/VeaGIOe+t0NjC8edY8cNNk7JQTQc3vioPO8ix5u2RnbT0u4Cls8EaUP5WK40ovA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fo+Vhx8j; dkim-atps=neutral; spf=pass (client-ip=40.107.208.51; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fo+Vhx8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.208.51; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhGX81F59z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jan 2026 04:04:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQtv3rfVJMW8QGoDHsHuf5f+Bf5FuAxexALyhVV1H/4PyPTfmktNhursZRfK72yaTJKWN1eVRSOy7YzyLRwe+2myLfBfaisN+2Q2Lom2HVV/39c5eORhiTR36CJgakeoVRvQVLaMyxq9aveKZ1GNL71lMuRugxd0NcXOZn0tCTaIxrMf9ITKqtR4KR/FpwFuwHkxHTarWXIALFuWJw5NFHWD4HnsYIMOA1hmoxSYLvtIjjPNN8uBFwMvmDvrd3Ns93LLPCa+bO8O+mmpNRNAvE4YVcoyE0mvg6EnNz0C9MRkZ3AgClfemyXEEsSYfpgbVklWh6wpiT1wPvoGKQEgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS8t6yKIjPtbhakV7RG7h6kXVh/HaGNDnuA9vrFFUAc=;
 b=CMYpzR8Xdo/OALg1PVHTK19T4+MPNUPUCaSRxKt6pMxtevBQmPUhFf6u6YWDBJsfebJcXHfQlXph10Aef2i0p7AsXsPtrYf9srqBZp6M2mMFAPxFCmWRlB9gqty6ZDhIntQsK0gJ5QyA6e4kFR4tbOoG30PrjMj4v+nS7TISU6uTSeyEkRIT7JAhDIR67FyV4TKFL2tgbqZvW0XpLZNQaqZNj9+fM3s90a6wS5LoCxZk31OFAW+8y953qxYSSJj8UObNXD9xoLWj7pdniA2YcUOVzfHggAZvUPr9Xr1i+VCqssXKJoHkgxTncrevtxvUE3Mqvtj1Zup7D2/hY2BIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS8t6yKIjPtbhakV7RG7h6kXVh/HaGNDnuA9vrFFUAc=;
 b=fo+Vhx8jzmwIc6QadjpYERhRbncc3QdHEv7xiN1rCimOBHa6KUokBV/kny8g9SbvSimd/Ws1RZoKXbS/CbWvtVDVSv+nqHwd4BU4uFWYR1DuToSEVppHSloqVsY9OhbUppCXPaIG6IpAbk+rmbkphtFFeAvQGj6OthEsut9Pbgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:03:41 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 17:03:40 +0000
Message-ID: <d489ebb2-89c7-44e7-80eb-53b5fde8cd39@amd.com>
Date: Wed, 31 Dec 2025 12:03:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] mm/migrate_device: Add migrate PFN flag to track
 device private pages
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-2-jniethe@nvidia.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20251231043154.42931-2-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcd6cd1-136e-449d-cef9-08de488e8c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sm11QWZWRTlDU2dKcmluQWMwNmplNmxZQXNGYWJrZkY3MXlHdmFnbXhpOW41?=
 =?utf-8?B?TzV5aWNxd2d4ZFhmalBPSGdiakhlWEE5d2NmcnVJSEJ3TGo4UlJZWUhtYW9G?=
 =?utf-8?B?RGZqVEJwQWtYSWkzbnFFNDduRzNHQlZZOVdUY0FpdlZXbTR4bmZHS1NWUmlH?=
 =?utf-8?B?cThuTGZsYWVUeEhJUHFDQkJLWHZ6eWtYdW05b0ZUOXRzVzRicnJxQ24xMVVQ?=
 =?utf-8?B?dUltL0dzb3dTZFUxbUtBdGZEd2lVOGNKQmlFN3YwWDFXVmJuYUhMRmtEZjNX?=
 =?utf-8?B?M2NLTFFENlQrbFcxVGVGaVdPaDVSd2VYcS96UTNDWHJWWjUzNGRVd1cra01O?=
 =?utf-8?B?TEhVUHNKRUtpazNuZmVZdXQ5SVRiemtOK0w0Z3VjMnpacUdEOFZEaUI2alMx?=
 =?utf-8?B?MVI4ck9sWVpqNDdMNXp5aDFOVnZIeG1zdmJTK244NDlEQmROblJUcTBUR1lM?=
 =?utf-8?B?OU5laU4ya1lTVHJPNll3dkdxQ2xZcm9hR2FzYzNhblRPM0hkVWhCQzF6aVpq?=
 =?utf-8?B?akVlV2w3dUZabnRENVVhZ0MrWlNRYjFUb0lRVFBKODZxelZjSE44eWEwdVpB?=
 =?utf-8?B?c05kbThRWVRJMGxJNVZqcFdjaFNNVGJrd0Mra2w4UUxML1A1Z2wwbTMwRzhk?=
 =?utf-8?B?TllPeWUwRCtFaGpFZlZtSUtndTdVUDY2OW1Wa3ozUDNNYnlvWVNqTVpVRmZB?=
 =?utf-8?B?UDF0RzV6dTlEODkrU0g2SkVxNmJXYUw0cUNQeHA1WmE3d3pWMUNrVXFrMEFZ?=
 =?utf-8?B?TVlGTUJBUEIzUG1UZDlRenBDNmdSd3lsSGdDcVV5TjJ6czNwYkRVZEFDaUtw?=
 =?utf-8?B?TlRrelk1VlVIa1AvUlhTQXA5Wi9XeUIva3VnaHh5NFpiR0lUMko5elFHcTls?=
 =?utf-8?B?NGhtMFJFU21xUTU1Znk4N29qY3dqK1hyc2JVbk5jUUJmY0QzTUozK2w5bnVM?=
 =?utf-8?B?QU1YVGFyUVNJUHBQa3JnYjhPUk1pbnRGUGRsMzNGcFgwWVl6TVo2VG8rUktF?=
 =?utf-8?B?djdqUUJtMkRxc3Fwb2JFRUZRTDFBc1NZRHdJRUh3ZEpUQlVkU0pRQmc4dEFQ?=
 =?utf-8?B?NmZjYU9YNFdsandlN20wZ0NjUkhGY0IvOUlFbnpjS0JSZmhLT09xNW5vcy9Y?=
 =?utf-8?B?WGE1V2hVdXRIcmg3eWlOOVlHRUs2VVljd3A4VVA4UVBUTDVST2xMYll2VCsy?=
 =?utf-8?B?MGhoNDhLRWNkOHZKbHkwZ3BZMjNKYlFHaSt3aTdqYXdNNGRKRE9IcFE4cWh2?=
 =?utf-8?B?d2h4SmJpaWZ4eW5IalNHT1BkYVd6VW9EQTA0R3NTMEcwc3VQZSs5ZEFpOVRa?=
 =?utf-8?B?QWJpbDRoWHAzTjBmSzdjWUk2aEdMRlh0d3VCSURnZTRXTEVGcDY4R3h6ZHln?=
 =?utf-8?B?MG0vdmtpSGhNdGE0Y0NNMmJUV3VQcnp1RGVkb0ZwMEhibnNGTzBPbkNJc0RX?=
 =?utf-8?B?K01FTkQ4R3dSTVB0ZWdBV0Y5Wjc5NXc3U1U4aXdUQTAvZWVhYUU2cG5LYS9M?=
 =?utf-8?B?dElMUEZCK1MydGJQNmJzQVl0UVk5MVp2TzQzeVJEVkRXOUJsT1pTWjAzQTh3?=
 =?utf-8?B?NWdNL2t2cWltb2F3ZFc1M1Z0UlhiM2ZjN0swakFCd284ZEY5U0c0NWtjQndu?=
 =?utf-8?B?bEdhTE5jd2NsZm81ZDZwdStGeDJQZGZPbWxxL2lpeW50TklpL0hLWHNXWHZn?=
 =?utf-8?B?eUx2MWl6WUQzY083bXhja2w3M1ViK1dsSGQxdldzNnRvOXpHeXpoSVdFb2RZ?=
 =?utf-8?B?cDBJem42QzNXQTBxMzMybjNzL2YwaGpUekJNN3VadDVLeFliUVJWMStsS2NM?=
 =?utf-8?B?blArenlzZlZraStvNzhBajl2ZmlIdEowbU4vS1MrQUFCeTZFek9NbUNGY01Y?=
 =?utf-8?B?TWxvMlpsWXp0NVpQYlNCaFFHRC9JNVduYlRWampMZ29nemlwZFpsS251aEVO?=
 =?utf-8?Q?x4KMwFowRX1C7iK7pCiTo5liOn3ae5XK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3FWYU5GbXJBQ0ZZbll4UnpSS3JZSjI3SmpVNm14S3pzSkZPSDhIenRzQWwv?=
 =?utf-8?B?VWY4T2dPYW4yVVB0ckp1NFZuaTkvMHJGUml5bTFUOHFhYkpuRUhCV09FNEcr?=
 =?utf-8?B?eHpnN2s4ZnpFaEQwSHNhdE8yRkhSSnp0bStybU9tQitEUlpzUWFDSjdVdSsr?=
 =?utf-8?B?ZzRwdXpFL3M5c3g1aVpHam9acnIyd1NGcjR6OTdpd3ZkVFB0NGZQMytibG54?=
 =?utf-8?B?REVNcXp5ZTFNeEZ1amppWlJtZ2tua0lleThMNVczbk51Z3ZhSDgvaHErTmc4?=
 =?utf-8?B?NmxLajBxT2VFZjEyS1UzMDc1cy9haURBUHFVQnpYbHJLM1pRaGFXQ2FGb3ND?=
 =?utf-8?B?TUdGTWNjeWRmbHhnVS94RXNzd1ZnUmRxek9GNzZxRGNENW51YUZGVnFOY05I?=
 =?utf-8?B?VmNvREVjNDgyNWZZZU5VWk0xNUh1L3o1VWZ0OEE2bG5kRktmbUliRmxuZlZB?=
 =?utf-8?B?ZGhKWkFHVG5jS1IwNXVtK0JuQUl2cGpQTDFacmpNU3RaQkFhZHUvMjRqczVE?=
 =?utf-8?B?WTg4L0cwRDRTRUhFY1BPYkhzVmRsekFJQTlWa0hoVnZ3R0pVVkJYaHQwV0E0?=
 =?utf-8?B?M29aQXFTbHJNUTljVzRLTlo2QzJmTFFPbzIvZG5rZjA0b0FwejEzWlMvOCtU?=
 =?utf-8?B?eDkrT0FHM1ZiUm1zc0ZwVDZiR1BYRGhaNWRvakp1YXJnTUY4dTR5dm9ocWh2?=
 =?utf-8?B?UGxjVE8ySm4wSjJJcmpkWWpuYVFtVmF4a1N0eERCTStKZFFVNVc5WmJhSEdB?=
 =?utf-8?B?VHlEQlp2cjBiUStuTE1ya2d6dXRyR3lxT1NFTnFqUlFER0NTeUd1Q3FnZDFP?=
 =?utf-8?B?WmZKQ3FEVjV3OFUrQW5WQkJFYURYajJ2UWpOMFZpUC9DTDlWdHRKWDd4Ukpp?=
 =?utf-8?B?dWNrYjVsMGFmMFcwWmJEZG5rOUlNcHlVYTVlVk52c2hDNnE3VmQvWCt3YUZQ?=
 =?utf-8?B?a043b2dVb1BWajkyOUtjRGdOUkxBWFNYclFNUmhiN0k3V3M2c2JtMG5RaEpI?=
 =?utf-8?B?NDh2TnMzZzBKc0NpOTF2ZUZnMmZFSlpPT0VyRWpYOFZJTDd4UkpRc1V5QlFQ?=
 =?utf-8?B?UVhhRFd3T3Z1bmwzWjQ5eElULzV3SVJBVWxXZ1hXbHZ1L1dUdHJRZDJsZm1H?=
 =?utf-8?B?Mk5wOXR1T2ZucmVZUmRQbzd3Q0tvTnN3Q3dzTGlJN2JpdHo4eVBFYXF3cjl3?=
 =?utf-8?B?d1M0YXpvaU41RE12Tm5QVDBOVHhCOVFpODFnd0FjYWxXOU9Mcm9Gdm9VOWZp?=
 =?utf-8?B?ZVRDalFCUkV3YWY2dWE3OUlPMlVvY3JGUUJaR0E0Sk9hemZDV1NjZjFpNkhz?=
 =?utf-8?B?bjFBN1I4b2U1NDVaUXJNTmhLZjVDWE54NFZJdGhsYVBxWU1mYXBQT0c2Y1l2?=
 =?utf-8?B?QXRUS1VQRWhyZmxJZnpmOHR3Yy84clJBOFRQMm5EWFU0WExEVUc3bmZreDM0?=
 =?utf-8?B?YzlKRFZoVnBjTWdkdTFGVVFlSGpUaTJMajJQUkJ5Wml1WDV3eU9jVFZVUFYr?=
 =?utf-8?B?amNFYVZoSHVESno5QVg5MSs1SmNuNm1XWjY4djlpanYyeVltbVRmLzFSVmNo?=
 =?utf-8?B?YnVMWFh6NW81UUxiWUlaSWg0OVVnWUxSdjY2TzYzL05PK0dCZCs2S3AxTlVB?=
 =?utf-8?B?SUt0cUJieHE2Qk9kTWtvNVVLS04ydExFL1NudFB3RDhXekpZSDRQdDIvb0My?=
 =?utf-8?B?Y1pncnEweTlETjJONnVwcFlqWTZOdzQ4OGh6NjY0NXpzTFBqdmduUU5BV0Vl?=
 =?utf-8?B?Y0ZacHVkelZzQ0djbUwwQVlLOFdCMXhWOWpuOVloOGw3dURsOE5MeWRqWnd4?=
 =?utf-8?B?MmJaQmQraS9QSkxTNUdSb3ZzVDJJY0dud3N1ekt6aHlCc2xHdHY1c1F5aUkr?=
 =?utf-8?B?VDdYa3VJRldzVWVFZkh0Z2YwVmIyVFFmQ0Vub3dlMjFtTWZZak4yc2pQVWlu?=
 =?utf-8?B?bW42cjhXTS82dWZKZzhsZU5SRVhyQ2VIazl0R3h4NEd6N1pnMG5sanVKc2xM?=
 =?utf-8?B?K2k5QjdUd3NaWFRqS3F1dzVjRVgyRy9Ua2QzNkFmZ1RNYXNCbU52Vjg2L2N0?=
 =?utf-8?B?NnJLRTFMMFM4bkN1M3FvWWFCaUFUS0w2eEt0K09FMUZDNENncmVPNlo3TEhk?=
 =?utf-8?B?ZStRVXBuY1lsNlorOVVmdFA4VTFWdHdQZGZtREpLQUI4RjFmTkpsbmZBbnZH?=
 =?utf-8?B?SmRIakp1Q2JraGtONyt0NTdFclZYSXF5RXRwTU9ZWlpZd2dsejdCL3Y0YjlK?=
 =?utf-8?B?QWlrTjZHQ3ZFaFE5WFhnbWVRYWtjMlBGQ1dwK0lwbUlNVTY1N2FhZW41eFVQ?=
 =?utf-8?B?ZUljeFJOZ3E4K0g4U0VNQVdpZTdYQmh3cVVISkVTRHhkbGNBdG8ydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcd6cd1-136e-449d-cef9-08de488e8c22
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:03:40.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvCsX6rSjwOcBLxMpX4p7yLWhNZl87j91oe2HaRLZS0kX7d7NLaUHCyjhs9Vzm6/No6EK+VKLtpcJoRdlecCrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-12-30 23:31, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
>
> Prepare for this by adding a MIGRATE_PFN_DEVICE flag to indicate
> that a migrate pfn contains a PFN for a device private page.

Thanks for doing this. Some comments inline regarding DEVICE_COHERENT 
pages. I suspect this will have ripple effects on the rest of the patch 
series, at least in patch 8, but I haven't looked at that in detail yet.


>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
> v1:
> - Update for HMM huge page support
> - Update existing drivers to use MIGRATE_PFN_DEVICE
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 ++-
>   drivers/gpu/drm/drm_pagemap.c            |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>   include/linux/migrate.h                  |  1 +
>   lib/test_hmm.c                           |  4 ++--
>   mm/migrate_device.c                      | 11 ++++++++---
>   7 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..dac5d6454920 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>   		}
>   	}
>   
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> +	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>   	migrate_vma_pages(&mig);
>   out_finalize:
>   	migrate_vma_finalize(&mig);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..0257c6e7f680 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -303,7 +303,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
>   			dst[i] = cursor.start + (j << PAGE_SHIFT);
>   			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
>   			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> -			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
> +			migrate->dst[i] = migrate_pfn(migrate->dst[i]) |
> +					  MIGRATE_PFN_DEVICE;

On some of our GPUs we use DEVICE_COHERENT pages. These are pages that 
are coherently accessible by the CPU and peer devices in the system 
physical address space. Therefore, this needs to be conditional. Maybe 
add something like adev->kfd.migrate_pfn_flag that gets initialized 
conditionally in kgd2kfd_init_zone_device. Then add ... | 
adev->kfd.migrate_pfn_flag here.


>   			mpages++;
>   		}
>   		spage = migrate_pfn_to_page(migrate->src[i]);
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..0c756d73419f 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>   		struct page *page = pfn_to_page(migrate.dst[i]);
>   
>   		pages[i] = page;
> -		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]) | MIGRATE_PFN_DEVICE;
>   		drm_pagemap_get_devmem_page(page, zdd);
>   	}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..2bd80c6f5bcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
>   		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	mpfn = migrate_pfn(page_to_pfn(dpage));
> +	mpfn = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>   	if (folio_order(page_folio(dpage)))
>   		mpfn |= MIGRATE_PFN_COMPOUND;
>   	return mpfn;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..52f65cd5c932 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -126,6 +126,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>   #define MIGRATE_PFN_WRITE	(1UL << 3)
>   #define MIGRATE_PFN_COMPOUND	(1UL << 4)
> +#define MIGRATE_PFN_DEVICE	(1UL << 5)
>   #define MIGRATE_PFN_SHIFT	6
>   
>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..19681904a666 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -727,7 +727,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   				rpage = BACKING_PAGE(dpage);
>   				rpage->zone_device_data = dmirror;
>   
> -				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +				*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;

This needs to be conditional on dmirror->mdevice->zone_device_type.


>   				src_page = pfn_to_page(spfn + i);
>   
>   				if (spage)
> @@ -754,7 +754,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
>   			 page_to_pfn(spage), page_to_pfn(dpage));
>   
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;

Same here.


>   
>   		if (is_large) {
>   			int i;
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..5d108ddf1a97 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -199,6 +199,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>   		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>   		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>   		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> +		unsigned long device_private = 0;
>   
>   		struct page_vma_mapped_walk pvmw = {
>   			.ptl = ptl,
> @@ -208,10 +209,13 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>   		};
>   
>   		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> +		if (folio_is_device_private(folio))
> +			device_private = MIGRATE_PFN_DEVICE;
>   
>   		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>   						| MIGRATE_PFN_MIGRATE
> -						| MIGRATE_PFN_COMPOUND;
> +						| MIGRATE_PFN_COMPOUND
> +						| device_private;
>   		migrate->dst[migrate->npages++] = 0;
>   		migrate->cpages++;
>   		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
> @@ -329,7 +333,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   			}
>   
>   			mpfn = migrate_pfn(page_to_pfn(page)) |
> -					MIGRATE_PFN_MIGRATE;
> +					MIGRATE_PFN_MIGRATE |
> +					MIGRATE_PFN_DEVICE;

I think this also needs to be conditional to distinguish DEVICE_COHERENT 
pages.


>   			if (softleaf_is_device_private_write(entry))
>   				mpfn |= MIGRATE_PFN_WRITE;
>   		} else {
> @@ -1368,7 +1373,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
>   		return 0;
>   	}
>   
> -	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> +	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE | MIGRATE_PFN_DEVICE;

Same here.

Regards,
   Felix


>   }
>   
>   /**

