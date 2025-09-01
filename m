Return-Path: <linuxppc-dev+bounces-11543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C172B3D6F7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 05:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFYgD1s85z2yrm;
	Mon,  1 Sep 2025 13:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756695992;
	cv=pass; b=Jx/kzfud+uBU6IaND2b8c5MoDgh3+svxdRgTQHHNQFEUNPG8nF3B8/hANuUUS/qyAlAfbqsMYcUruZnwQNwySyo3Qss8/yAWzbH5WNoRgCqn9WNCXnJHuDvF7jN+EcHn5b822OVEhGIErc1XjApzFMd7mHD+pjYZ0amhzDHUwTr6vFb5qvZaN5WNG8MiRH0HSt5xGDYCo11QyS4KLZriHYpxdOwVp+8ncQ/1ELE5V+Hz77FtchDpW5jYSIkr868w21mo9Fw4mJtd4pRSul2D4wgBkK9nQ1xLgbxonvJTIgC3DP8apSZi2yA+fd06EN9flU9YLC3Qg+rW2Hv6FAKVeA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756695992; c=relaxed/relaxed;
	bh=/nsJiv7TC0chEXNwwEw6Sfwb0ejQrrVOZ8ZfJLBAw0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C2iPYLmzNRSDcD1M1+kWDc++3C2zngrOZp1Rz9aVHV5F/DidoDXw36VSsKUuAXnRNlfF3yogM6bcBd9rxiDyDl1zsvUwUygO0mfHzLETscmF4BlARnST7XYP4qwMo22Dst1aGkYeI28nBCczh+w4L7tdO6hjj0UMv73gUGE0H4SI0YuTijKuGZPSoiNqCuXETLKZ4Af1feAiis+Md4ZKsjyZ/wpPQ80N1FUB/xX05LAD4yYEM5VwePUBec96oPq60ZMSiLYIWD381x0ANr6vc70dJ8Ti/0zLUUOOjYUkRGLpoi87HC1Z5mO0N6H6mrXMtRUDkH0wywGEgG1NCsUB9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ojtRgT5W; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::624; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ojtRgT5W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::624; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFYgB3BVNz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 13:06:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LstCB4tKc8i68DzFosfBqokOwMMOQbMbGlJnE6/I9J/iqSqbbBgyE36Cw5ReLNUjESMcTkuOY2rpgaWhsYGEcDzR/WYvF8iCMshDU41sbNyQEUZ0KgQmv9opl9JW6/vb4ztlnF41wdvv4BFPx9qXjGX5sYn1VKRVSc6aArrMtqd29Bw4QU5jBU5Vw7D9mGYtwkzLSIjjFf9gg78QdNN4+HW/RV2aues1WmvVc/ccN0mfraYkuURU/IXrhTsSJa+MPDqFzDCGj/I92JyxCC7YCrusN+W3XTTc9OU/MSMk2VK29KO7tlQy5KXwSppErvTocig856n+3K2IQQp1nDyaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nsJiv7TC0chEXNwwEw6Sfwb0ejQrrVOZ8ZfJLBAw0w=;
 b=WFER8R7URhixtRZBn4TNq0j83tCj+t8b0OUxgHjtaIHQJguZhtIn52b9wJRbWjGMgvqBixA+xPmX2PotRcy74eupRNYd+nwgZR+9LReZQrUrHZlSvnT9JPIiESDpYLfEyrPkDmQy1d8ltT05kzETcRod7nqAoUaexNLPqSzkJTrbg7YDkD7dA0vGRqf25914FavPOerBJQ+CqCt+9R8nwExoRDnFCUk/OwfONeHfDuePt41kJASUKfxFvr7KyEsu6h7TQjIbXUmTVlUEMPttKVREExca72YPE82jOwFhle7TTlFc0OxWChHyEfC83RKmxRTp6tNxuRcaBI+x8radTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=csgroup.eu smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nsJiv7TC0chEXNwwEw6Sfwb0ejQrrVOZ8ZfJLBAw0w=;
 b=ojtRgT5W1ZM3t5tQ/SJgB7EHEIcPwdD1NfW6ccNWWGMDDVvjA+XzsL//OyPTP1A3gZ6ZduTN14RGlVlADDGpmGvX/qlrsUFJz/eyujbEzLX2iAU5bJX56fdqI/PSnDhL9gN3fXWv917vbfAP+9wGIfzf4SO6PbCS7jnS7i6IXOE=
Received: from SN1PR12CA0080.namprd12.prod.outlook.com (2603:10b6:802:21::15)
 by CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Mon, 1 Sep
 2025 03:06:05 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:802:21:cafe::f6) by SN1PR12CA0080.outlook.office365.com
 (2603:10b6:802:21::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 03:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 03:06:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 22:06:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 20:06:01 -0700
Received: from [10.136.36.137] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 22:05:49 -0500
Message-ID: <6898bb1e-311f-4a71-aef0-e15e75c43b50@amd.com>
Date: Mon, 1 Sep 2025 08:35:43 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] powerpc/smp: Rename cpu_corgroup_* to cpu_corgrp_*
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<thomas.weissschuh@linutronix.de>, Li Chen <chenl311@chinatelecom.cn>, "Bibo
 Mao" <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>, Tobias Huschle
	<huschle@linux.ibm.com>, Easwar Hariharan
	<easwar.hariharan@linux.microsoft.com>, Guo Weikang
	<guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
	<patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Vinicius Costa Gomes <vinicius.gomes@intel.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-3-kprateek.nayak@amd.com>
 <6e197065-a782-4e24-bf38-5e423d0509ff@csgroup.eu>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <6e197065-a782-4e24-bf38-5e423d0509ff@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CH2PR12MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dd897a-ec6d-4d9b-4c2e-08dde9047d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2VqUE5sZ2lXMW1zbGhqR3lnTThtNFhnS3VSME0rZWwwV0VGYzJHSGRQcHd1?=
 =?utf-8?B?T3ZUK2piZHlXcHo4K0FXYzJoSHZCbEs1dy9PSkkxQTRjQUovajlzOHlTK3Vn?=
 =?utf-8?B?RUU0L29za2FZVVJUa09wMlZJbS9YenRNODhIb0paT0xiaUkrWnhPVTRaZTRh?=
 =?utf-8?B?UFoybmM3dGgwMElyU1RpNVNZdVFRUUczcWxicTVSRmdVODZqellvTDQrYmJp?=
 =?utf-8?B?ZERtYVRGWnMra09MTGE2bXdjZmFqeVJvaWVwbUhDZEpoYkJFZlVYaHExNGxN?=
 =?utf-8?B?bUZPdHArUVdzdzhaS3JSVC9XQXM5NnZSUXBSRko0emJidjAxRjFGUTJtb1pD?=
 =?utf-8?B?RUZVWUtQVElpUWV5ZUEzUC9DSUplN3BHS2xDSzhNbFpQYVlzU1R1Q0dTNk5G?=
 =?utf-8?B?YkRuQ2ljeUI0dDBVUGFMOHBrY1Y2Q0syQndnRHpZSW1TSUo4T1hPYSsxMm5F?=
 =?utf-8?B?dC9QN3ZZUmlwT2NORnRtUjR3RVROWXhDbitXb21iVHdkQUpQUDYxMWtkbXFN?=
 =?utf-8?B?eUZnZklQU1VORHNQWjhIVEtMQytEbDdqekpsQnNnY1VlUXNwTkw4MkdXSGR2?=
 =?utf-8?B?V0tkb0FobWxIL2lBdzRJeTI3aDNEdUJlTVJ2UUNFWWFPU01GNFZ3cEJzWVRm?=
 =?utf-8?B?ek9nV2FTUmJYWi9HbENkQkxCV3htcHB3aUhaZXcwcFhFOFE4WGI3N3hJZEFp?=
 =?utf-8?B?UXdYQm5uL0J2a3JCNnNpMDBPdFNJN0dUb3VHaWJqYTdHNmlRSzhwbkJlU25K?=
 =?utf-8?B?M01CMTNWTmg3QlFFeFEwSUpEZ3V4OWtUM043RFdYZEpnakxQWGhydzVFR2xD?=
 =?utf-8?B?QzVjaDRQMFRnL0pqZmR2QmQwRmxkWTNiTVNyd1JRWUwxNzd2V3ZSaXRPT1NN?=
 =?utf-8?B?eUZ3bWFvOFczV3pJaHpsajhHYlNkZktwSmNEb0pIUWtmTGFFQXpOcHFHRXhi?=
 =?utf-8?B?K1k2Skpma3V1UE5wbXpXSGQrNUkxM0FpTmxtZHJVclNrWVJGSFVZMGpQUXV0?=
 =?utf-8?B?TDZnVXpzcTNuSm5KNitFSmxqRjBYWlo4NXRpSnRIa1grQzBSaVRZWFZhTTk2?=
 =?utf-8?B?UE1aM1hLVWdsQWY2U292Q3owcHQ3WWlkYk9jRUdJL3I2ZE1EYWc1YkpETXVq?=
 =?utf-8?B?Zzh3V0t0N24wQlI5R3F5N0RKWmF5TTZQNTdOaTBTSVhzNU9nZllRUkQ1aFE4?=
 =?utf-8?B?aFlVdU56cHNIL2hoTDg3bEhpWXMwTWd1OFZBK3ZBTllLVk42cXhaSk1Rb21B?=
 =?utf-8?B?Ynh0Yk8ySmxLa1dGZmE1NldvUkFoM0ZZc0hVVSs1SmdEa3hmVXRGQkl1anBO?=
 =?utf-8?B?dVIvT1lGR0xXSEVnVWdGcFBrT2R3RzVnaHh5UTlmVmlKZktacWFZK0paZEdE?=
 =?utf-8?B?aWRzYzc1Y1hPNHdNL1lidzFMd0FCNG1mN1ROSE5yL3Z1ODBoZm9uMzd4Rm1Y?=
 =?utf-8?B?Y0lRM2lna0habnA4VnNDTHhkaDZ1VnlLdjFhVWNrWUlkUzhCS1FrTjZJb3dS?=
 =?utf-8?B?R1pRWDJ0cU1uT0RmWWVmWnJwSVNFcmJsS2xUN3NGQ2IyS2gzZHdHNWl4S3JM?=
 =?utf-8?B?SlpTbWZaNEducE4yK0lObWJMNkdCNlROV3RLMkY1WUpudlFaeC9EYll6MmxD?=
 =?utf-8?B?dHhyKytVcWprU0Q4dGk3M3g4R2UxcW5kTHJpcE5aMDBxWWUwbEtMVlZMNS8r?=
 =?utf-8?B?dWFhZ25qNGh6aU1ERGhrNnI3YThCb2g2aXpwVHR6Vk9EMkhFZGJOam5ZRkFm?=
 =?utf-8?B?OEEvNmxmREtlaDl5OG1IRFNxUURqWWRCTzYzZ3NtMzYwSnhZOEVzY2pTNFB2?=
 =?utf-8?B?WDFiRmRia1JTT0JCMmUvU2JRTEFuaHBaZzJLZktxTCtDS29vRE1EWTNWTml1?=
 =?utf-8?B?LytjZEFCTlpDN250eTFTZit3dEp2S0w5Q09LM1JqdVlIcnZ6ak10RldiZXBQ?=
 =?utf-8?B?UjlSTXJrRExmc2UvSTF1Yy9wZGxrSDk0cS9ia201ME1QNUJhRXdBY29TNDl6?=
 =?utf-8?B?bWJMaktWbktEOGQ3Q05zbTMrN3NrZHBLZCttWGMyUlpzYjJoVVJVV2hWRUlO?=
 =?utf-8?B?MFdSaVNlQVcwdW9wT0hBbUhWQzFvbVA0VUdmQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 03:06:05.2078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dd897a-ec6d-4d9b-4c2e-08dde9047d99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4278
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Christophe,

On 8/26/2025 10:32 AM, Christophe Leroy wrote:
> 
> 
> Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
>> Rename cpu_corgroup_{map,mask} to cpu_corgrp_{map,mask} to free up the
>> cpu_corgroup_* namespace. cpu_corgroup_mask() will be added back in the
>> subsequent commit for CONFIG_SCHED_MC enablement.
> 
> This renaming seems odd and uncomplete. For instance update_coregroup_mask() should probably be renamed as well shoudln't it ?

So this was a bad copypasta on my part! It should have been
s/cpu_coregroup_*/cpu_coregrp_*/

> 
> When you say cpu_corgroup_mask() will be added back, you mean the same function or a completely different function but with the same name ?
> 
> What's really the difference between corgrp and coregroup ?
> 
> Shouldn't also has_coregroup_support() now be renamed has_corgrp_support() ?


The main intention was that kernel/sched/topology.c uses the
cpu_coregroup_mask() as the default function for to derive the mask for
MC domain in the default topology and PPC uses it internally for this
file only.

Peter just exposed the cpu_coregroup_mask() as is in
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/core&id=6e890353ce7e983a621d30413d4fc6d228ae1b4f
which should be fine too since the PPC side overrides the default
topology and can decide to add or ommit the MC bits.

I was erring on the side of caution and allowing cpu_coregroup_mask() to
return the node mask if has_coregroup_support() returns false but given
the MC domain is never added when has_coregroup_support() returns false,
we don't need all this.

-- 
Thanks and Regards,
Prateek


