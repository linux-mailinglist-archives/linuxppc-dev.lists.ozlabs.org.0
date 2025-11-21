Return-Path: <linuxppc-dev+bounces-14412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EBC7828B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 10:30:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCVMM3bgfz2yFq;
	Fri, 21 Nov 2025 20:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763713130;
	cv=pass; b=FXfdXqZ5uYeGDExaL85jDQZgZBUzSNdxuGzZk4TaN/m4d9RiJIbEk+0njwbHiMfYlFVItLuHiB7ZysAiBabrrcPOfX19jD4vXSlBlliZ4nzpCvHpNsPqtWo5CGthDFj5roN1IRKBSoi+S3KFNOkwj0VyzAzS9zXdMKvPPnJMhpmasck6zuhy0Q3ADARR0bjm6y/tJM/kqMWoER5wECTmlHAd1ejYANWcC0Dw/TZHpdDD0Z2t9flloHlHf2wuLQIqvUhiCVjnmSWMq+z/g6N9+CFrdcG3eYh+whkpBcN1A/rKwbssdK233T07bp36T0qVXEDcUKR/AiH4J2oCWVDyoA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763713130; c=relaxed/relaxed;
	bh=InNng6IapEqjuR0Z+zs7HEUA0T18Z0nYsDw6o2QO1do=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C2XBNSGDo3ZMBZI7lmvZpQrM1i0hXCBxkzyVztG4gytuRWNqvvMmeKDGCVAiVpyiod4TnJCv+nH50XG4FPfNjFOnELQFsdWouZKEuQeAzCIjpwb/rIhDymwFy8UWxQ3fNmixg++BaTznkcbeFEO7hcNjHLiWkZnMy1pjf5UqyTje1YTJCE3t3iK6Sj/h6d+afsPocw4ZjbucLRd5ledEUyElpRaldFBI6n2x+iJqs6piIEJ/I0sXIRSVepjHP6vzM/jAnivbvJS4lI46dprMPauFKRmrMBlgNRLiPU3Ij9L/N7Ch7vNHK0YhK0rl9agFoXR/loLdzW2tPwdWtoU39A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fXv8Rni8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=vasant.hegde@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fXv8Rni8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=vasant.hegde@amd.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCSm81cx4z2y5T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 19:18:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwHCWTTNSFytQjystORxuOXjwP7amKoYIBS6cf9NIW9WasAh+V/MRipFBiB/tsvEx6VnwWtQDbORTMRSoIy7CKd/nNRa+DBA+Gd8zlk2AjYhQfiy6oPRMOx0RHbcbzhmgQiJnkVdajYdgkgzOhxUA7IeERj1JICBMsFOt5RwthJC1Lp5r4LkUbPs1Wj69ogltZ8jDNGTDtURgMw+VniNs2YbfPO97BEmE9KdP9J82ZYTLM0MOmJwtlRej3V8HHAQSs+xCd4YnxBFuwohkLUfXw1fCAetub4ERLAMOmagD1+gt6K4RoUG8CfN1XS57z3Y/U0U4lzq51igBexqAQ9fdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InNng6IapEqjuR0Z+zs7HEUA0T18Z0nYsDw6o2QO1do=;
 b=xZv7A/W1E9oO7dGtNRHgN5tVn43XsnQcH0wgIdmU99U23BHLXPpeDvkITw+LXXYK7I4C8pRUf1sGcvS4pxT/snuQyFHyXsm/PRQUrDIXZeyN4hXBv9Ujv3aQxfXWSwn/joBJLdKlu+/UvXgw8e4r1RWUhzomE14T1BQAIFbWYS1N6XsAvrzX4D29Ju9gaAfoYNWGDI8s/pL5ICRL18MThX/Y1dL+QORRV0F6c2mHaCwdeP2QH8LIYqW9fUsFKNPEqUaloezW9z+tnfwC0k19j37WYDe6YjXF7DwAJDMbE+ZlSAxR+c5hiZu+neH6z9K0g0cNcC3fJAY2ee93dMTPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InNng6IapEqjuR0Z+zs7HEUA0T18Z0nYsDw6o2QO1do=;
 b=fXv8Rni8btQh7MHwxxV2A74BnIiMV3RWpcK70WuZKJyfvcXM/03Mvi22idMac4LFXC5/rsfvnNdfnMBXGZHZPQKzuHRStyW/Ns0DimgOyJ02E0/huCT9+zmSMfxscSn0Tf9VD0JUaZixhAGk/f+ieGtEidyO1SvvjNnCPpE/2g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.12; Fri, 21 Nov 2025 08:18:24 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::a5e0:9d7e:d941:c74d]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::a5e0:9d7e:d941:c74d%7]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:18:24 +0000
Message-ID: <038ff750-db4b-40bd-be12-bc85cee5abe6@amd.com>
Date: Fri, 21 Nov 2025 13:48:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/svm: Make mem_encrypt.h self contained
To: Jason Gunthorpe <jgg@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Joerg Roedel <joerg.roedel@amd.com>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, kernel test robot <lkp@intel.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev
References: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: 95506f7f-ab05-459b-f429-08de28d689fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEJ6TlJxdkNlU2ZBOUdRNHJwY29wWWtwQXoxYVhJeUQ2aEFWWDc2dXBNdEQ0?=
 =?utf-8?B?ZjZLcnNLS0h4L1Z5ZnpYcmFpQzRnRlNzOHlEZmJTQ2gyTm5IVjNZWTYxVnJQ?=
 =?utf-8?B?dnRGakg4Z3JZVW5pQ3R1SWFDUlplTXowNWoweGs1OEVYVS95cTFOeGhpQmIr?=
 =?utf-8?B?eWF1T3J3MUovTVZwTGluaXcrd2tXK3MvYkJhZWNNdi9EejB6SjMybTJ2UVVW?=
 =?utf-8?B?WnVxQUlWanhDamFnZkhCODBxS01kdWZ5ano1V01TcjIwVzd4Q3phdWI3Tlcw?=
 =?utf-8?B?YTdwMVA2VGNpTU5sbVlVUUMzTm5zY2ttR1IrQlQwVW5oOTBOTmNNQXFTSnA2?=
 =?utf-8?B?Vnh3REZCcTkwZ2dRTzB1N0NwN0phbDlPOUowQWNQREVrU25IYkNsajg0Wnhk?=
 =?utf-8?B?dG9DaUdKTWcvYWNTSHhrb0ozMG51Wk5oOGtJdEVNaE8rVmxMSU5HVml6OHlk?=
 =?utf-8?B?WGtCZEpKQVhoREZKTWZLeEkrQnZ3MmZ0M0ZUQ2Z3dzdxVVhaR1g0S21aOGZU?=
 =?utf-8?B?VjZXazhhY0drcks5UTZ1S2s3RzRGZVh0VjBYM1FJNWRwUFJJYkVZOVpOc3du?=
 =?utf-8?B?U2NSRDFONm1TVndCdFV2OXc3dStQalZkSHhwdk80SngxOVZ2ZUhOYXc1NGVP?=
 =?utf-8?B?Q0FvZGo1eS95NVVyY1liRytkaHRLVUxqYldKckRLT09VUE1jSlFaSmx2ZXk1?=
 =?utf-8?B?R3NxSGtOUThVNzVIVHRjUS9yb0dNZUZGQlEwSm54OER0d2lycytmbnFTTzBT?=
 =?utf-8?B?NUZPZkpmQ1YxNzlzaGQyaTFSdE8wYndKNDdyd21GeVJnQmdoZytnWmppb0di?=
 =?utf-8?B?aVJzZE1RTFpVZmp5cDczSVhRb1JJcXRFSXNJUy9FTW14Y0VMbkdKUG1SOGhG?=
 =?utf-8?B?ZEpXZmp3S3NaUDcvSUE3WXdvTWNNZ0JTWExGV1dNdXF0ZktEUjM5c294eS9G?=
 =?utf-8?B?RGpRNzN6UWQ4QW1wVWFBQ2V0clpxUjkwSStDYkYzbjJ4OXVXSUdla1N1a3Rl?=
 =?utf-8?B?Vk44bnZ5a21XM0I2VEozbmNjNHhJQ0trSm5BQjladW43RWw2aHljVkcyTFhW?=
 =?utf-8?B?WkkzMzE0NEtmSGNOTkRubUV5eWtaLzZCZmVINGpTNEdTVkNTYkg0cGhQOGtX?=
 =?utf-8?B?UEE0dGp2RHV6RHI1QUZ1cnhNTEVVRW96V2VvNjBrMGlxTDdvejA0dW10OHhG?=
 =?utf-8?B?VVJnOWtCS21Wd3NwMU5pVkJIMnYwaWI5ZGRqVlhPZ0dDTm1ieHhYaEdLRmZo?=
 =?utf-8?B?bVhIS1pGSEJtVGx3R0k0WU5WRU9oOE1LL3ZXWGVQdjhxSG51TWlYbVNVRm9o?=
 =?utf-8?B?aU05ajR5Um41akE4NXJLNjkyTTJmWldLcTNkMVBKVmhzTTdOcGxmamhKTFln?=
 =?utf-8?B?bVptL2t1UkZIY0NNRmU2T2J4TUl6MUF6eUFVSnJYRENaK01IcDZZR3ZFNUZm?=
 =?utf-8?B?M2Q2NTRueC9pc1EwdEtKNXVoNEJsYlE2c3RpZUpiY2hPMnp3SUplaStVc1dx?=
 =?utf-8?B?aDlyM0dYSnZTNTBRTERuRXFWMUNyV2RzRXFxSUFySzlRRlppZEZPQzNWUDUr?=
 =?utf-8?B?bjlPU1ZJYWJaQmR5K3JYalZ3MEdNTFp3QTJCbFFoSHVnTzlqMlc3MXV6ZndE?=
 =?utf-8?B?N3VObkFHL0ZlYTRuU1ZNUGlFQzJFUnpNYURXdWRWRXZGZ1RFNytWWEM3RW5N?=
 =?utf-8?B?VFMwREZ1YnBkRWlVblJTRVRkOVBFclNhVGZuM3VmRjJ4YTlhWWh4RHR5VjA5?=
 =?utf-8?B?b01QS1hBNDYzSHBPNElJSXJyVFJXeEhHanU2WXZHNXRWR1RYam1VWlVHM25r?=
 =?utf-8?B?QVlrRktZeWJUWUFmSXpsaTVHMlV3RzVoS1BVcFpmNmdSZHlIcWd5RjdoWTFW?=
 =?utf-8?B?bkZTWllxaGY2RGtYV2JTbzF1TmVmMUU5b1dDOXdnUHIzaFNGRDd6UFJwQkFV?=
 =?utf-8?Q?SmCEa0OSlkxNwL+JiGgF0NuTQnKVFHqW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6048.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JXS0ZHSGMwcTZBOW05L0xFdzBxMTIzT1FSK2JQcERSQ0NMNTFlbVRoUHBB?=
 =?utf-8?B?NXBUSGc2Sk5iNHlxR1ltWFUzZXBMWHp5eTlWSDdqa1F2L2RaZjA4VytMc0lG?=
 =?utf-8?B?YUM3bEJ1a0w1RDZlQmxOaE85RmVSTGU1d3RFQ0RtbTFya0hXKzNBdUlyRnFJ?=
 =?utf-8?B?RFZEcjNUNU4vWklkbW10elFQb0JuaWIrc0NQa29MRTY1eUliM3pEL243K0th?=
 =?utf-8?B?M2Y4YTEzenNjZ2J1eHR5STlhbmlBNEtyU3NEK0pMY2tkRWNXbHNCWUkyUU84?=
 =?utf-8?B?WWx4NWVWYTN4UjVCSWM3Y0laL0k1QWJBWWYrNmdPM2N3Z3ltSVVLSEZRQUlS?=
 =?utf-8?B?aHJ5Ni9nQlBuNHhRajlaNFlXYjE5ek9JRGwyemR5MWhjZGoxanArY3I4Z25E?=
 =?utf-8?B?YjA2QURuSzB3M1VKTll3T2IyWUp4d2tVS01JMlNkaS8xeTN0VGY1cktjY3ls?=
 =?utf-8?B?ZWxtUlo3ci9ib2NjOS9iK3ZpelR2WjRxYWdudnd5YWxQbGx0bXBmOEltWUd3?=
 =?utf-8?B?ME9kYWFmd1pjUThNejVNOTgrK2xtNVJSM0ZjWG14UHlXZjBDZGJBbml2V08w?=
 =?utf-8?B?WnVEMnVKc0w3dXRSVkcvb1NKSVdjbzRjZm1ZODExQ2JkZm04K0NaSVNaY3Bt?=
 =?utf-8?B?dU9RazVFWDhHRlJRbGl2Z0dzT2Y2VTBhbmhnT010c1NEbFRVUDYvRkJGdzd6?=
 =?utf-8?B?Y3RtcGZXRzdLTTNES3NYOWUyRHpqSnFIalBJcE5kdW1aaFlmLzdxbngrZ2J3?=
 =?utf-8?B?TWl6K1BMY3ZaZlFtQUtubVRTRkdBWkVzLy9ZMXNMNlVNVjZxeUs4eUZVcy9B?=
 =?utf-8?B?VkRzNXdtYXVVRm53L09MK2QzTjJBUUNRdWJSYWUwelJDYWpVbUhBRlQxbENk?=
 =?utf-8?B?dkw1Z09iakhWVmo1bm5nRnlJeUNPU1FPYlJ3WGVBMk1vb2hoUllZWTN3amps?=
 =?utf-8?B?NEY3M1dyVzI0Y0ZoaS9NS01mQkJ1UkxWbDNsN05jVnZhTk5YWVFlQWw2WXZX?=
 =?utf-8?B?RnZhdjdzOTlSZFdEWENxQWJKTHNkRWs2OVQ2Y0dwVWxjOExURkwvYjBSMnh4?=
 =?utf-8?B?UngwM0NkaEtCdmt2bWpzZzdoc09mUnU4dzdLMW9IQlFtRG5UWDBoaFlFSmtH?=
 =?utf-8?B?aFI2Nk42RGtkcDdCcDFnbGM5bTNlNmk5VzJXcHhKeSt4Ulk3QUlhZEoxMGwx?=
 =?utf-8?B?Y1UySXJrUnVKa3dLMS9vQTl0VldXZmdtVUc2Y0ZuRC9hZE9BNGI2diszZ3Rv?=
 =?utf-8?B?Uzh1bzZsS3o2djE5V2p5dTZObDlzSzZveGhjU0NBeVF0TlB1OGpHUjl4ZkU0?=
 =?utf-8?B?M0h3Yk5kakE3Y3BkU0RFdmQ2TXhJUnhFVG0yTTl5QXVMNDZBeG5BaFRCS1Ri?=
 =?utf-8?B?emFRc004TGlUK1orWnBvUFJYWEtwdXhNTGljWGlNNVBoQ1EzK3VORWo5REJP?=
 =?utf-8?B?amF4ZVVqcVBJajN4cW50bFdDQy8vcmgyRk9CU2pQTTNUcmRlNmlWV29jbkRD?=
 =?utf-8?B?S3RGTmpGMG1aWnlmazVGa0dleVdiWGxJWE4wSEluOWl6Rk5ablc0emFmQVZr?=
 =?utf-8?B?Zys2T0F6dHU1ZTByQVg4ZHh3NzZQaDgzUHlyK3FFYjJrd0RLWkhhcU81cmM0?=
 =?utf-8?B?VnlRaVlISmt4VXRBYlZEU0wyT0NKYTVvNlBTVXJ4Q2RwRkNhTm1VeXhuTTFj?=
 =?utf-8?B?T0ViMVc1Q01QZzZ5YnhTa0pvODIwMkF4OEF0UDdUNEljbjVHczFuaG85SU81?=
 =?utf-8?B?NlZMVHd2cUtZUklvRVVjQzFSTWMzSStEcGtPZElydmlBWWFxem1qSHlJRmVw?=
 =?utf-8?B?c2s3T0p0YmdrK2lvZm9RZnp0QmpYUXBIbGlVMy9rN0pRTldweldiT3c0Yisv?=
 =?utf-8?B?TnZrZG9HZUwwSkxYTXE2NC9xVHBIVzkydHlvZEh4ODdNd2VkckpCQXhqcjRS?=
 =?utf-8?B?Q0JTQ2NhT2d3SkJ2aDZmMHQ2bHAwUElVVGNwMlV5SGdodzEralQ5NHBYU2hx?=
 =?utf-8?B?NkhhTDNNUno2VHFFbWM1K1I3aU96NnY5NUF0K0YwTGlKbFJiUE14WjV6Yy85?=
 =?utf-8?B?eXVPakxsZklUejNJUmFVaWl0TFlLd2xEaXBTblhyQ1R4OGFQRTR3OEVZVk5o?=
 =?utf-8?Q?9JxVD11G8PWU7CYntk4zGEkqB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95506f7f-ab05-459b-f429-08de28d689fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:18:24.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AacwE2qC8VdrcT+JFICZvUdnD9Z7/ben1XSWc1++Xx3rVtzDma3YHjJ8f+hm70p25X6cDbTUdFuEXlMEuEtkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/20/2025 8:36 PM, Jason Gunthorpe wrote:
> Add the missing forward declarations and includes so it does not have
> implicit dependencies. mem_encrypt.h is a public header imported by
> drivers. Users should not have to guess what include files are needed.
> 
> Resolves a kbuild splat:
> 
>    In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
>    In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>    In file included from drivers/iommu/generic_pt/fmt/amdv1.h:23:
>    In file included from include/linux/mem_encrypt.h:17:
>>> arch/powerpc/include/asm/mem_encrypt.h:13:49: warning: declaration of 'struct device' will not be visible outside of this function [-Wvisibility]
>       13 | static inline bool force_dma_unencrypted(struct device *dev)
> 
> Fixes: 879ced2bab1b ("iommupt: Add the AMD IOMMU v1 page table format")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511161358.rS5pSb3U-lkp@intel.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>

-Vasant


