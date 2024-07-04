Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADD2927597
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 13:57:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kpWo+L2T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFFWd6HKcz3fTK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 21:57:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kpWo+L2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFFVv5RH4z3fQb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 21:56:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSclwcWa+yOL+Y7f0spuxT6G6ffqWYpJ5dz1bOaDvNxJd/vmL3kPp81tWNx5U7IuOuLR4zi0Zi3ps1E3d/vVWRQq/m5Ir9UcniZSujFGdmvMYPH6CVIQe36p/4xvHHTGifEc7OoXRRwDkucFlGS4FXvCroY/MPKroo4sw1hp3rZwij6Oj/OidCNH/WGqEklWsntPkZ5/jmP77QlLluR2k0AY0pcdKGbEGGXGRsUp+HP/toIxn1ISxMhjzgpM5wpfke27d0Mo515txg22jtyaBPeSSF4bUuk+GTcS6YNWjK/jk5pDnt46VIri3xYfIKpfg8aI4t6Vhk2AePOfsf+SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Nj8ylJiAK4PaC05sjG/G9aUfCyDoaMH5FJUWNxbC9E=;
 b=Fk0IH1V8QXV+LQus2q/t7vSKPkK72+ApXlcw5nwq8ivX12r5hecorDyxYokZEYFaZ1AYN/IvvCev6Me/IDq3zNsLR8Nx0StWMJkkxDu1ouVFPtx5MVa3smxDufMbm/TMToSCdFLVtnITZY/5A0obVrwapvxXSlTimoGngHrFHKwbriGy2AvBMPpS8jYCR4kJqDkLfhWmAnG6YadLjiRnC/QSPy1uZhtRrV3/G628zlpx8os5F0X4I/W+3Cv6rE/cwYrkH8XOdxMFzYw3q6jvd1YSvxa3qzZjGdajMmfll8OEhWmltplU59S34dTGmo0yR/P8W068NpmEqLTMorBPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Nj8ylJiAK4PaC05sjG/G9aUfCyDoaMH5FJUWNxbC9E=;
 b=kpWo+L2TJh6yg5jtsSiZjJOem9P1wVZqlonZuu7TI4hee+jslJFts1FZC3Pac8bsUxzn90zDWaoTblWPPrfPgQ/jrz0AEIcutZTc4ppjmXDSLGCvM1IvQI+TZA0KAK6cv9+kkuNN+TDNElMhzyQEv8QOTVXs5YGrwaZ272CKTnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.26; Thu, 4 Jul
 2024 11:56:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 11:56:29 +0000
Message-ID: <11b57ff8-91a9-42d8-acbb-ea618157d655@amd.com>
Date: Thu, 4 Jul 2024 06:56:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Len Brown <lenb@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:806:d2::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d45e0ab-be42-48ff-49de-08dc9c205719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?UzYvTUFQWDhuaEtwOG9lRnB5UEl4UHowaVNNZzR6UlQwaHpUWkluNkE0RVZI?=
 =?utf-8?B?TFRFMlp1c2NHaXRBZy96UzlId1VsYWV1M1hqRlRSdC8rS01JSHhEYlJWTGd5?=
 =?utf-8?B?L1FDYUtCYmkyR3YrQmJEZ1F2VnNRQjVIWStnaDF4dWthMkluR2EycGZYVnFX?=
 =?utf-8?B?MFA4OTFyZms2WVB6NnhkdWdsOTJiWWMzUDhRQ3JRcG4xKzRxZjdjQUdrS0lG?=
 =?utf-8?B?RlR0Rzd6aER0TExmWVI3aDlVWTljblF6T3hBZ1kyT1FnOG92UHF1bkR2eGVy?=
 =?utf-8?B?VjJGSHlrRFFLSHh4T0RzTnZpNCtIVW8rQWl5M0JGTTYyNmc3SHVtUkFDUVBE?=
 =?utf-8?B?b2k3QWJlZGxPa0hoTVJVbkRNNjN5RlV1RDBCNmxYUkZoOUlmb1JGS2xLUlBS?=
 =?utf-8?B?Q0dmL2hzRWxRaXRJWXhpOXZEeEgwbDVRakMzeEE1WEpsUVRENmtvenBPM2Y1?=
 =?utf-8?B?VjVqQWU2ZkZveEZUOUxvMHJSTGVtS0FmMlZEcVB6YXE3YjNIdHEyY1dLL1dQ?=
 =?utf-8?B?OW9yWHlZTHlqcUdnU3B6UlN5bWxzZVFRZzV4dG9GY3VCc2RWUGU0bUNGNndk?=
 =?utf-8?B?Z0pORVhxS044STQrUTRxMEtteXMySkhTcTFEYmw1LzZrRU53clgxR3g1VEZP?=
 =?utf-8?B?ODRucjlHWXg5azAySXVZV1l5VUMzOG41akhtb3A4eWN4cDRMSlRxclBPOXZt?=
 =?utf-8?B?R1ZhYVlQVFhGcjlUc24zU2plUnhWekh3RVdKYU1neDBmZ0pWRTkzOTJhY2da?=
 =?utf-8?B?VzlVNDBjUUpoWERYZmpDRmFuWTV3bzhpVG5DOCswTjFuUmZEMjd5TGFQdFhJ?=
 =?utf-8?B?S0FWREpDRXNzanF0S0JpcjFoU3BJVlpySCtEQzk1eHhLb3FBaGxkMloyU093?=
 =?utf-8?B?N2FpM0FFa0NBU3NpeUFtUCtod1RWNDlZREVOY01nNU9qVm9VYmR6NTlBa1lH?=
 =?utf-8?B?RTFPRENNWXNodDVJcTl0VjU3dWdwR091c1VKY1AzRGcxM2hIWWh3dHk1Nkpp?=
 =?utf-8?B?ODJBMHlVOGNiZ1plL0pENmd3VkJPa1ZUMjlFa3hkeVl3VWVUejF5cUlYR1cz?=
 =?utf-8?B?aUsvOWRjSUYzdUNhWnQvZVluN0lYaXkyQ3pQNG5vbU1ydFRSam5QbTdtRitB?=
 =?utf-8?B?ak5uU1dlazEyQ2trL3NMMWdZSTFGaTZLT3hCNnU2R1RzRWtSbXFNT3RCWkYy?=
 =?utf-8?B?bjNrMS9oYldXeDd1RVBrQWNkTSs5K3pLRGUxckp1Q05KNWNZeklKRERFOVJi?=
 =?utf-8?B?M3dZUFM3YXVOK1JDWTlEckI2WTNPZ3J2NTNwbUYwR2VwUU5Fckt3MUJVNGJp?=
 =?utf-8?B?UWRBdWRTSUNtOFFrTlRsczcrRGU5TlBzNEEvSHh6NHhQWjZDSjE2U3puNDA0?=
 =?utf-8?B?TzRWc25CU2lZcHRlTVhrZmhPS25TVStCenZVUUxqdHZIZ3NVS2tKbmh6TXJk?=
 =?utf-8?B?U2g2OEg3Mk1UdEtVMHEwTG8reHNOYzRraE5kRVJrWk1waCtncU04WnNSZ1pn?=
 =?utf-8?B?SDVHby9wejNlV2F4NFU0anhVdkV5cDhQbDFGQmtqQ09sVmFFTHdLOWU1K21R?=
 =?utf-8?B?NloyWTcrRFFDcUVUalQzNjVldVFxZUVBcFcyRlYrbzU2SUlrNjFmaGZQMVZp?=
 =?utf-8?B?cHFSQ1JqLzZnODQ0V0V6L3V0bW5zOVBVa0lHVWhGTWZ5YWJEYnJyY2hsNVE2?=
 =?utf-8?B?NzdXa3JlNGRoWm5qbi9hdUhiL215NjdSQ3p3cWs3MGkwVExyNXV5dEhFaEJO?=
 =?utf-8?B?djAyUDBwcURGTVdPSHdxb3VEQXRxTlN2R1RGMHpDODg3TEFIVmhTZDkrRi9n?=
 =?utf-8?B?eDRaalc2cVFlbDR0Sjk2UHpMR082MWJpRnQwWUdnTzN1TUtWWDc4VWt3MlEw?=
 =?utf-8?Q?l15JoDHqahDdw?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z2p1ckFwVEsvcE12QUFTMERCS3JoYjY1K0lkWEErcDIzS2tVTDdQY3VnbmU1?=
 =?utf-8?B?cEFIcDdoV3pPVVZncUdvdXNKaHRicWxxR0tQdkVOdTZUczJJK1k1UDR4OW9K?=
 =?utf-8?B?RGIrakFLMUhhRWoyNEJ3UGRic0FVeHF3L2FpdlpJampQcHNXV1gwWW1lT0Jm?=
 =?utf-8?B?SnlocExsRzVnN2FINFdrM2tOV2VTT2oyYUdNSjZvT1c5d2JrNEFvdG1jSlRs?=
 =?utf-8?B?elB3UG12bnA1S0VTdElEcFovekdLbHhmZWdqMFZ5R2MzOUh6SXcrbEtWbDh4?=
 =?utf-8?B?SkZiRVVLRTU2TDQ4d3pZaVBmVTl5ZHI2eW9EaDhKU044aGoySzZSeVF4WXAw?=
 =?utf-8?B?WisvWG5RaHFtcGFTTjJDTnlhVCswQU1OUk8rQTllU2srWVJwZUZRQzgyUm83?=
 =?utf-8?B?TkgxM2hjckdXZGRWRXdNRTZxV2J0U0owU0R4bHhNTkE0MzVwZ0YzY3o1WU9L?=
 =?utf-8?B?U0R5eFAxaVFOV0NKc3QwUEMrNGlPRk9kZVZHMXhuYlZZdnV3TTlOKzM3aFFx?=
 =?utf-8?B?bnVabUFFWlRDZWpMZDhHU1R5RjdGdUQ4Tlo1RmFZSzRaMjZsbFBCY0kxbVdT?=
 =?utf-8?B?YUVBQ2NuQWRQZXQ5bVhlU2hlQkdXclBMdklrUmRlS05KRng5dUVlUjJJNFdD?=
 =?utf-8?B?U0Z0VHBnU1hzV2N2STJWcGp6U0VVa3BwdDVhbHJjQ1pncFI3MVRXaG5JWFBv?=
 =?utf-8?B?bmVXd2NEczhjM1N3TW5kV3NDdHdBZzhOV1hsQTdCVFZuWjlTbUJza0cvYlJq?=
 =?utf-8?B?QitLSjNnVWloU0JzTURnZE9LakFuMFNYdG1kNzUxdXRReGFOSXBoZjZpSUZ6?=
 =?utf-8?B?NU1JMnBaL1puUTFtQk52MXVPSEEyOHd2RnRaR21EcFE4RmphSDNRZWc5RFVU?=
 =?utf-8?B?SFhDSGVMNjdCY2IrVDVHOVAzbEFJOEgvN1RLMU5FU1daeDJ1MUpxMmtlbktz?=
 =?utf-8?B?Rmh0VlV1Vllqd3J5ZEt3aDdES2pHUjRtTzBRN3RUKzhoV3pySXcrMTBIU3Q0?=
 =?utf-8?B?bjVQNVc4SWxoaS96MUlqVkVONk5zNTM3OXhVU2J6bTB1R1JxVnNsTWNSSSs4?=
 =?utf-8?B?cDRCUE9LQXp1T21pcHZqbVM4M2VyV1EvamltLzBhdEhPRWxKQzN6Yi9memNH?=
 =?utf-8?B?S1E3eUhuWEpwamdnb2VyNVRBcGMyUkJ3SXpjdm1yaEZxV1QvVVRLRTFEb1py?=
 =?utf-8?B?UmRRSnJhdE9TcDZROXp4MzkrUHpybTE0VUZ3eUlmWS96eEQwNG1QOTVEcHRy?=
 =?utf-8?B?Uk03RWNPQWc0Y2tyL0VScjk0b2FyMDZ6NHZqSzJVSVRXUkRFOXhTSUR5bFFa?=
 =?utf-8?B?ZDV0MkN6ekh3WnVkcllXOXFoZVFpc2lnRHpCemJtbmxqMDAwN00wWnIxL0Y0?=
 =?utf-8?B?c04zNFRpSmhmUWRBVHlVODJMalpTR2NkYXRSMzhIYkQyQTN5YXlrYTdQSlNw?=
 =?utf-8?B?TkFXazVKU2NPVDVNaWtSZ2VmcXZxeERBRVJsL3FFdzNwQ3QyWVo3Nkc4Uklw?=
 =?utf-8?B?M3FhWnZDOFNxbmJwNEN3TldOdjVTSlZoLzZIQVdkbnRydkRlc0JhWTZyb3Y2?=
 =?utf-8?B?WmJaVVBDb2lFQ1ZJMVVlTVlBNnpkVHQzaHlCdyt2SDhiK2JNS1BST0JpM29B?=
 =?utf-8?B?VFRmVUNtT3lOaThvMXdwYUZuclplclVwVU9sYng5ZGFGT29uZWlad2k1VHdI?=
 =?utf-8?B?cW9jM3NnREQ1S2dqRDllSXFmTVU3R3M5TUp6TzNTS0QweVZRK2wxbDlUbjly?=
 =?utf-8?B?bGpXSGdPcjhMOEZQNDJvTS9uQ2NkRXY5WWo1dEcvRzZ2dnVaTHkybVFxcWVZ?=
 =?utf-8?B?RVRSZ0FPNk4wMU9ZenJtU0VNT1M2WWpqQ0d0OTN5eUZBU1pueFVLMnlqWE9k?=
 =?utf-8?B?K3hYR0ZJTjV5SkJFQWhXYm9PNURwZ1hiLzB3b09sNjF3cFFieEdoQzVQS0Zh?=
 =?utf-8?B?WFcvcVErdTNrZmp6K0xnN0tLb0JwNktld3E2L0JQdzhIQ0dONnZvNHViV1lS?=
 =?utf-8?B?YklOT3NvUUEzQm4vWi9hcGJ5c2t5YmkraE9Uc3I2VjhMMzJ3clRUQ2dBQTZG?=
 =?utf-8?B?OWVHYzhZTTNlZ3pyODhlb0l1Z3VqVFVPYVV1UFk3SkhiVGJmc1BLVEhTcHdQ?=
 =?utf-8?Q?FYxajcg53TcY7zbB42KbjizF/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d45e0ab-be42-48ff-49de-08dc9c205719
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 11:56:29.5669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niRj7KYRpM3UUg+fcmUQe8DDJAewM+qvNSVarbAZ/vqCNPSpDUIO0a/OHBI44NAqN+TPLAS1dUZenEWSxU1kTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/4/2024 1:53, Viresh Kumar wrote:
> From: Lizhe <sensor1010@163.com>
> 
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   drivers/cpufreq/acpi-cpufreq.c         |  4 +---
>   drivers/cpufreq/amd-pstate.c           |  7 ++-----
>   drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
>   drivers/cpufreq/bmips-cpufreq.c        |  4 +---
>   drivers/cpufreq/cppc_cpufreq.c         |  3 +--
>   drivers/cpufreq/cpufreq-dt.c           |  3 +--
>   drivers/cpufreq/e_powersaver.c         |  3 +--
>   drivers/cpufreq/intel_pstate.c         |  8 +++-----
>   drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
>   drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
>   drivers/cpufreq/omap-cpufreq.c         |  3 +--
>   drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
>   drivers/cpufreq/powernow-k6.c          |  5 ++---
>   drivers/cpufreq/powernow-k7.c          |  3 +--
>   drivers/cpufreq/powernow-k8.c          |  6 ++----
>   drivers/cpufreq/powernv-cpufreq.c      |  4 +---
>   drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
>   drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
>   drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
>   drivers/cpufreq/scmi-cpufreq.c         |  4 +---
>   drivers/cpufreq/scpi-cpufreq.c         |  4 +---
>   drivers/cpufreq/sh-cpufreq.c           |  4 +---
>   drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
>   drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
>   drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
>   drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
>   drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
>   include/linux/cpufreq.h                |  2 +-
>   28 files changed, 37 insertions(+), 84 deletions(-)

Acked-by: Mario Limonciello <mario.limonciello@amd.com> # 
drivers/cpufreq/amd-pstate.c


