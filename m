Return-Path: <linuxppc-dev+bounces-15892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7ED3194D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 14:11:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt0c50h5pz2xnj;
	Sat, 17 Jan 2026 00:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768569092;
	cv=pass; b=ai/d53kit8rOABmx3Mggmi6JZ4DASWQW3cGXTS/OHwItClweugYab7UmwoTNdu6fEYRsh0wU9ecpR+GQ7y/fpZtHF/v6FcRdQQXVK7bp+EsH3kvTzCs3Gz/3Du4rSu0CtFe3qnPSwybUWWJ4dhyORJTtOnjoyC305EmfjZlEmi6DmSMXt3QEcnj8fNolRViHxLZ40EGd1D6rTRDkrWOSAsRmLUeh8OEJhEzNQTshU/rLJDLcUZKU0HxnxAI/Tvk1DDy0keU4dmR7WpokjpBnUi9rTzAXzZk6hCdNUV4YImCSwHS4ekWxsF9BBhtlUhU4Fo9NqeM2NouLQH6yFZbxMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768569092; c=relaxed/relaxed;
	bh=o1Iju7T7/UF+4QUVeYpAPtTbl7Nq0wZsW1U7vDjFgNw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=faVs69SOhuuMlypafYhRYzLtVuVtx9gGZOYs25ySmrbnJ0cAXhfql7qMdi1/MHo5Fc3dH96M+dKxYNkD3xWNX18kPYKJ379fmzbS3G8IHk0HoQQ71GAe67RDcAftJFkZr1/3XO7CHJnIMSm8+nmIujS0ehP52CpDmxN2XlXiWciszpsIfXCiHZ+ipeaUJbTWfXKZnG6GlG7fwC2o7bizmfxj4KlWleWWZrlPm0i9+y7CnyofLMF6kA9kUcyEj2tyDg/qIWjxGSFtPbM5hsoDGvtYHJ6Uwo6vzRRZsOimckjyJ02ICbUYHZeHpliET8nuCf9n31scmw3cEuboE1cwIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EiZZBl15; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EiZZBl15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt0c317w6z2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 00:11:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKf3R0tglJvXG8+uvEWgS5t2+MV5eqFq7s5gjuVT7mXesn8VHxz5Zb2U9ZFlUXbvWiAkG+doJQRR1oerkwQhn5wjGWFdI7M2b7UaaAhgLIgptCPVu4RWF+Sn1wBxbedxzNc4mJHG/SfQ2ptCDbDcEk9yL+I3ItwsuG2XHXfNA+8BgixjN9HtnWEv8Ea8Ln8hXGuo+Rtjt+3/zgisTvcocLfAiAlOaueoOzJODR/bO52d9NTgDDUF5NauDlncc4vlslb4uprEe4QI7SC2yBM/EjERQuyHNJ+MKjV5V5C1QZrwyPBrgnNCKexfzWBidYR78cH8dI80HqaeZ1WfKQ12cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1Iju7T7/UF+4QUVeYpAPtTbl7Nq0wZsW1U7vDjFgNw=;
 b=M7wIUxlymNMeHAxZ9Einv+Tcou8uf+C845Su0fPNc6NeMGfKufyC2PgnAYZG5lArbLIkDtCFakwVEiOPUl7y+g/8X09hL2RrS27dWqAj1nSLq0t1cAJoQLqpB9p8xxmBK7A/TATIZLyliQ934WOVMKBEcEiNvHQOrysrpnNL6Xlv4sycfFO+F55eB5k4i1n99fUUNRNZWtoOh3VfLMMqVdE/5zu3yFI20eWc8br/fV560/O67p/LzPLiJ5K/jRn7PBDm8MYZbd3HUmAIOLJOCscYHBmMGe4d4haeWw107L7POlki+vKiq7WRG3a7RXSpmX8JFoSOMNhsC7LBLPleTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1Iju7T7/UF+4QUVeYpAPtTbl7Nq0wZsW1U7vDjFgNw=;
 b=EiZZBl15idnfltWDm16cbBUz5t5Mc8IDr/ejDwszP4paY6KSxxHhouvn6xv3ck3u/0tYzN3dwwCgdVLdwkKvzJfuEf5g6A6pciL/YMHUEUXPobd8DEpZFPoVZkm3W4PeDIeUpWbezKlmzRWvh6cc1a0alxyJJId5Yo1O6ojiiYCsMY25/8vHjq7NgfTyR7kwNOsNcLw27niBVOuJwUAt/fHNFpzY7ykleqlGZuPjHuEAfaSwQBZWfL7MKZ+dYREvVzlb0ihzUPDGiitaUT+apmEcfcYbrc3nnpw/ZnbtTrEIL+oWTxVxrfXYDecEWxnaWtr3ATEsb+YW9yLDaB5UeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS5PPF016FC81DF.namprd12.prod.outlook.com (2603:10b6:f:fc00::644) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 13:11:01 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 13:11:00 +0000
Message-ID: <e500fbb1-f480-445b-b36d-1a02a384c3af@nvidia.com>
Date: Sat, 17 Jan 2026 00:10:51 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260116111325.1736137-2-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS5PPF016FC81DF:EE_
X-MS-Office365-Filtering-Correlation-Id: d96e2ca8-8ef2-4b04-723a-08de5500b1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NForeVI1UWNCemhHcTYzZ2tTYW9JTUpseW00YnZrUm5SL2cxNHp0aFJZbjdz?=
 =?utf-8?B?YXl2bmtnMGRydDhSTWxHY1FEUTY3bnZJQWQ0TXh5MkJjaTZSYTdJKzBaMTF6?=
 =?utf-8?B?QnhyTjQ3NnNocDBiUkJKMmpyL1JOODhzMWhuSWo2SEt4MElYWTJ0S0FkSmlk?=
 =?utf-8?B?UmpBS0ZSQTZHQzdXdnBIVWtLRmt5VG5OQ0Q3SmJXdEhUeW1VSk8yUnFGaHlz?=
 =?utf-8?B?L0luZFo0ZGdkVzJDQkpDU1ZuR01LRzFwajJ2ZVJYYlE4WnF2VGJBaTRnVGxn?=
 =?utf-8?B?citIbUVyekpMczYzZ1I3TjhQa0VkTjVDOXJTL2k5Z3NlOFVURjg3YThIT3Nl?=
 =?utf-8?B?L213aVZvKzFGbC9KTm5tU0I2b0ptYVBrUmNyYmpsbjFWalpNbi9zK2dNT080?=
 =?utf-8?B?ODFWOXNURXdjRUFOQ3RlWGtlZHNlVTRqbHBWb2RqNWFScklQRkFudTRhWDZk?=
 =?utf-8?B?OGlHWWtBWGpsUURVQ1oxNWZTMzEzOFA4OTZselBVLzJNTUxSMEl4ODZUNmJY?=
 =?utf-8?B?aHczVEc2OVFhRjQzM0ZnTitUSEplY1haSGdCMi95Tkc3bStpRmdFdXY3VXdl?=
 =?utf-8?B?QU9pTmplQ1hIYXgvb3ZtS2Nmbk1peERDUmExSHM2NDlRWFp5T3R5RnF6cXd4?=
 =?utf-8?B?cTgyM3Yyb1dNV1RLckhZRzFsSG1Ja0hkTnQxWFMzcVFFR0xWbE9TTUdxT2d3?=
 =?utf-8?B?VkIzdDllRi9PMlJXeWxlSTg4RTI3VytQeHRZUXJ3V1lpR0R5RDVnRHFOai9X?=
 =?utf-8?B?Ri9PdW1WSFpPMStDMXZwYVVWVEVXVUNNVExadlc0ZFNqdXhwVDhLSS81d0dK?=
 =?utf-8?B?UktMS0FqZ3d4QTNnSWNBQ0k4K0MyWTR3b0UwbGRpdE1uS2dza3NqMWVBYzFM?=
 =?utf-8?B?TGJmVG8vU1pmdFlRRE8ycldabjNoeDRzV3JJL3JyZkx4UVZRKytDL2w0NVVC?=
 =?utf-8?B?Q0J1SDh4M01qN25nUnBaVEV1VDZDRTZvdXpnekU1SHhpY043bm1OYlZ3bERx?=
 =?utf-8?B?NE5IcE1vNVk4R2wraE1SVkNJOE9JbWtuSWJ0MXQzQksyY2NDeDBheWg0bHds?=
 =?utf-8?B?Zkhhb2pnQ0M2USsvS1ExRHhNRkl1aUhaeEZXamhFVk82Rm15aFhsczNCVmdt?=
 =?utf-8?B?T0VrY0J1MDlEU3krNjRtbkJudEdERllTSmJ4VndkcHFXZ1puSzA1ZllTMlFL?=
 =?utf-8?B?VThVZVJ6Ym11MFdCQmljV2R4QU1jQVBISVpGa0llSFB3cGxYViswc2dKN1dM?=
 =?utf-8?B?NlRXU3psNU40cCs4YWRhT2NVZnpVOEU1WnRwbk5UQ2tQdVVGemRFVjlwUERY?=
 =?utf-8?B?Y0N0akNxamdDODh3Zm5BQ1pMQXRnL1BmYUw3OVc2QTVrR2ZiSkFNSmFyeFRM?=
 =?utf-8?B?TTI5b2toemZpVk5kbmRYSlIxR3lZZ0Y0N0E3WlF4cFg1aFlvL25sK0tRN1kr?=
 =?utf-8?B?SG11c2djL3RaMDZGd2tTWUZDS2lkSGZXTGlZS05LZGhua3c4K2RLVGRxbVY2?=
 =?utf-8?B?bjlqMzU1Z0h6SnBpUEo4MkJiVlBocGF1aE1YTzdRSW5wNDcyL0RWcGFDL3BU?=
 =?utf-8?B?LzBUQk1Wd1ByUXoxUnltSWUvclN2QmkxeDJLY0FUSkVtQjl1STZ1YnhldXFk?=
 =?utf-8?B?SCtPbWtGZWFtRDdvak5hekh2MTdlT3NtUGhwa3pPSWt3dE5RVTFHNFpTM1dv?=
 =?utf-8?B?K2RDOHBKYVlqUWJmY2o0bmNLYVRnaTNNRTJ5NTVrSUw0dnNWME5XeDNtdmpm?=
 =?utf-8?B?SzBqVzUyWFhzYUZPQ2hCaG9paW0xSWxLZ2wwRlVXN21KaEEwV1hLV0UzRC9w?=
 =?utf-8?B?Q0xOTlZ4ejNtWmNPMUJFMXRRUVRxZXhJVGxXcWNOU0JwNmQwTzA5TzZHV0k1?=
 =?utf-8?B?Q2lROE53aDU1dXkrRXBJL0FSSEQ3c0ZXQm4xeDR2bTI0M2xZTHVHRWFGSnpZ?=
 =?utf-8?B?UmFaVmdCZnowUTlsY0NwRDByYTN4bFpiOVZpYmpkL0tVY2RXWXpCRVM4V1ZL?=
 =?utf-8?B?dVV0eVFqczdWWk0vWVp3VVFwbU9qVUNBcVZSR3lIMU44RzJ3RVFXWVFIdnpz?=
 =?utf-8?B?MTAwVzMvYlR5TS9XR01pa3VHK0VuMSswTmJCWU9rcTFwSUEvVUxFVlpoN2Ev?=
 =?utf-8?Q?Oh1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFI2TGlsSkRHTU9QNDdQK2VUdVVTSUtwanl1VEtDZmJKQnVCZ3N3S2tlMU93?=
 =?utf-8?B?LzNTcFJWNXFrNzRWc3hRcUNxQTJtdEdnWXpmTXg4YlU2OHFmVGwraDhPNDM1?=
 =?utf-8?B?QW83UEJTcG5yU2xxVUp1R1Q3R0VaYTZaZ0pPa2ZmZkptZnczQTkwVEluTGRv?=
 =?utf-8?B?WGY5NWRMOXA1YTQ2SmJxV00yU3N4cGJMMEJ3R2ZTTVlSdlpBazBWNGJNbXpY?=
 =?utf-8?B?Nk5aUFgwa1RMNzBXM210SXVhLzUycStFVnVXRlhPaWs0Rnh2bU9nbjZZbXZW?=
 =?utf-8?B?bGNHVjd0UlpLSU8yYnBPSHZPK2ozUkdpRVZzMm5VU0pNOEl2cUE1VjFJNUt2?=
 =?utf-8?B?YmFNRmhtVHdzVXVSMFBKaGVOYlVYeTQ3ZnZMVTQxbUhzSDFIS3ZnMnFUVFlI?=
 =?utf-8?B?dmhvVU1ackFGVXozNmI3OUN0ZFZNdmVydDhBT05KMm41SWlnVWlNeFV5U1E4?=
 =?utf-8?B?NFNmM0VBSmlJWjZwRXd6blVMYkZWcDZTWU4xU3hPTDNmVlhDMkIvMTJ1Mytw?=
 =?utf-8?B?Ykw1RnZ6SVJVR2NleTBBVEY3em12MnFzT0w5WHcrR0FGUmZJa3pKRGM5bUVt?=
 =?utf-8?B?M0l5Tm1oZlR6aXpHdC9yaHhZbEk2RkZnRnNMWC8xZFIyK25Vd0xBaUx0NTA4?=
 =?utf-8?B?QUI1bmk1d0tIVUhUQUdLNVJYeExCVnVEODRyVUhrQ3AyOE9PVFZqRUhYVzhT?=
 =?utf-8?B?SnRXYWovWFJlb0xlVmkvQ1p4VC9RUlFjYWttcjA3Q1J5N0FsUjl0L240bE91?=
 =?utf-8?B?eGVrZTV0eVRQS2lvWGcrVUtOZ0Zxaytqb1M1QWxqY3E2dDBTdUpMZzFiMEtF?=
 =?utf-8?B?a2NvNksyR2lNelNPMGJ6VDZvOWtqOGFFTTRxQVdlZjVXQlVqRnh6OHNaOGNY?=
 =?utf-8?B?TzV1QjZpRjZjWVU5dXhuV24yVFp6TEtHb1RTamdENUNSd25zZ3JuODcwbUVC?=
 =?utf-8?B?bzl6UGhSU2x4VzQ4RWxQdXE5WlZFcEZoMzQrT0NMMGdGN2ZxT21aWm5UbGh0?=
 =?utf-8?B?RE1Uam1BNXNBYnJpR2x4MEsyWTZnVmRsZkE1K3djNFNZWXNQVnVKRFl5SWFR?=
 =?utf-8?B?TjRkOU8rQVhYT0NPMU9WYXlvd0xzUmtDdHJ3RnNpbWc1S01VZWNuZ3hkTXdP?=
 =?utf-8?B?NEVQTE5kTUVidk9RZ1Q5djRmV2RvdTVvTVhUZVFLcmJNZW4xUzB1d1cyemVS?=
 =?utf-8?B?MEtXRWFNUVY2MkcwbnRoS0szOHJ5RGM2VFRURXAycVdIbEVYSnNaVkN3VEth?=
 =?utf-8?B?aVNOWkxOeUViSUxSdGFhN0hWRUs2d0pRV3ZRNUpZR3NtWDF1aDZ2RjlNOWZp?=
 =?utf-8?B?MWpoU3BiUms4amZGd3laaGFpOXQzYVViYU1QN2FlN2RDS29odjBtaVlQdUxn?=
 =?utf-8?B?TGxuRGxML01VVnFFSnYyVXpzREdDaEV1STBKSHlIS1lWenZOSHdieVlzS2hO?=
 =?utf-8?B?ZVdCVFRWSkZNMDViSEJSMVNYRityS0U1YlorT2ZxdTRlNEE0bnd6WWNZb1hV?=
 =?utf-8?B?aUh5VjYyWS8vTFlrcVM5bFJaMUZNMG5NUFRpWkd1WEphK0lCa2ZSS2JHWCtC?=
 =?utf-8?B?MHhrK3RkS1RncDhJSDNJVXY4Tk1NZUpTc1VxWFIxaG82bHFRMzhDK0ZCczUz?=
 =?utf-8?B?Tk1oVzI5K3VTN3dFcGU3bExrZ1FwYitVTW5xNEtHYThqc1NxL1lmRzhONDFG?=
 =?utf-8?B?NkMwQjhqNTBuUmVWNURVK3BIVU1PSWFxUS9VVUFjWlFLU1BTYmJJaHJ4d3Zi?=
 =?utf-8?B?dkhNMnR2QU9samhUcjNheExRVmZQQzlHMGh2WmZjTGx4YzQ3d1J2eFV6cXVP?=
 =?utf-8?B?amx0T01kR2pFRnI0NS9KMzJrUk4zYXlsc1dIdUlXeVlxZEZsUjFFR1dOQTBF?=
 =?utf-8?B?K0RsUmExb2llTFloNDNBT1NLVW5HRU5xdUlSZERHSHdCWjdFcFd6bStsN1Jh?=
 =?utf-8?B?VWcrTVg5eHVucjFkazVvNnByQ0J0Vi92aVZQT2lIbm1ub1FqeFljdjM2M0VW?=
 =?utf-8?B?MTZlTThCU1RPeVZ4TUxIbjVGdjBRSVJ3cE92Yk9EeUxZS3FwYXYwZllRTkJl?=
 =?utf-8?B?eEtBZFRqOXNVTEVJalU5TW1mVnFSa05RL3cyZG00VVJJK3ZvaG8xc3VYNkNx?=
 =?utf-8?B?aFNuTFNLMVBzN2FKaFdMZWt3UnhodjllbkFvTEpUeHJZbGp3bk5yUnRYTktw?=
 =?utf-8?B?UTJ3V0s3ajRVRE5wMUJpRDd6L3ZyejhVcHZycGVBNXVDMnVOZjZRV0c3T3Zl?=
 =?utf-8?B?dEllVW5zeWZsZlpaOGdtWGxCYUZvWE5ZSWtlc2g1NnZlSXdzOFVBY3NSOXl3?=
 =?utf-8?B?QXcxVXgwTU9QaDJCYnlQVExBQzRBS2ZWSTlaMEc4MitySkx2TWlhVFpiUGN5?=
 =?utf-8?Q?JB1j4jEcLie8nkh5tgjJWLjicv47BYHjH6AhMswZjpaoS?=
X-MS-Exchange-AntiSpam-MessageData-1: jiSa1eRsHjCg2A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96e2ca8-8ef2-4b04-723a-08de5500b1e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:11:00.7896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96P5HSEY/bD3snaTsI9qkfXntQED8NJyhQrNe9CVwSC8/5I78JnOht4WlEUmFlpkEKiTIDk2EtiwrCsRp8ZZoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF016FC81DF
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/16/26 22:10, Francois Dugast wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> Without this fix, individual pages could have invalid pgmap fields and
> flags (with PG_locked being notably problematic) due to prior different
> order allocations, which can, and will, result in kernel crashes.
> 
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> ---
> 
> The latest revision updates the commit message to explain what is broken
> prior to this patch and also restructures the patch so it applies, and
> works, on both the 6.19 branches and drm-tip, the latter in which includes
> patches for the next kernel release PR. Intel CI passes on both the 6.19
> branches and drm-tip at point of the first patch in this series and the
> last (drm-tip only given subsequent patches in the series require in
> patches drm-tip but not present 6.19).
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>  include/linux/memremap.h                 |  9 ++++--
>  lib/test_hmm.c                           |  4 ++-
>  mm/memremap.c                            | 35 +++++++++++++++++++++++-
>  7 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..7cf9310de0ec 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  
>  	dpage = pfn_to_page(uvmem_pfn);
>  	dpage->zone_device_data = pvt;
> -	zone_device_page_init(dpage, 0);
> +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>  	return dpage;
>  out_clear:
>  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..6ada7b4af7c6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>  	page = pfn_to_page(pfn);
>  	svm_range_bo_ref(prange->svm_bo);
>  	page->zone_device_data = prange->svm_bo;
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, page_pgmap(page), 0);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..38eca94f01a1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, page_pgmap(page), 0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..3d8031296eed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>  			order = ilog2(DMEM_CHUNK_NPAGES);
>  	}
>  
> -	zone_device_folio_init(folio, order);
> +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>  	return page;
>  }
>  
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 713ec0435b48..e3c2ccf872a8 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page, unsigned int order);
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>  
>  unsigned long memremap_compat_align(void);
>  
> -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> +static inline void zone_device_folio_init(struct folio *folio,
> +					  struct dev_pagemap *pgmap,
> +					  unsigned int order)
>  {
> -	zone_device_page_init(&folio->page, order);
> +	zone_device_page_init(&folio->page, pgmap, order);
>  	if (order)
>  		folio_set_large_rmappable(folio);
>  }
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..455a6862ae50 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>  			goto error;
>  	}
>  
> -	zone_device_folio_init(page_folio(dpage), order);
> +	zone_device_folio_init(page_folio(dpage),
> +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> +			       order);
>  	dpage->zone_device_data = rpage;
>  	return dpage;
>  
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..ac7be07e3361 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -477,10 +477,43 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page, unsigned int order)
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order)
>  {
> +	struct page *new_page = page;
> +	unsigned int i;
> +
>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>  
> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> +		struct folio *new_folio = (struct folio *)new_page;
> +
> +		/*
> +		 * new_page could have been part of previous higher order folio
> +		 * which encodes the order, in page + 1, in the flags bits. We
> +		 * blindly clear bits which could have set my order field here,
> +		 * including page head.
> +		 */
> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> +
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		/*
> +		 * This pointer math looks odd, but new_page could have been
> +		 * part of a previous higher order folio, which sets _nr_pages
> +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> +		 * correctly locate the _nr_pages bits within new_page which
> +		 * could have modified by previous higher order folio.
> +		 */
> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> +#endif
> +
> +		new_folio->mapping = NULL;
> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> +		new_folio->share = 0;   /* fsdax only, unused for device private */

It could use a

BUILD_BUG_ON(offsetof(struct folio, pgmap) > sizeof(struct page));
BUILD_BUG_ON(offsetof(struct folio, share) > sizeof(struct page));

> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> +	}
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().


Very subtle, I wonder if from a new page perspective if memset of new_page to 0
is cleaner, but I guess it does touch more bytes.

Reviewed-by: Balbir Singh <balbirs@nvidia.com>

