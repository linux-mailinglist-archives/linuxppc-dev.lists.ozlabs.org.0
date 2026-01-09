Return-Path: <linuxppc-dev+bounces-15480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A9D0C3D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 22:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnvRP6kDLz2xGY;
	Sat, 10 Jan 2026 08:04:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.52 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767992689;
	cv=pass; b=RGxloW/OjhYxKG0zzebJAK4ynCNK3f1Gha7K2W2tjN+7wlE5EVnhbafnWxBi6H3Ux0/aM/r5W7dNYJjj35ydxupqop/zalqWia3qM37y2ZEp8/l6NNSIRkZaHp0m3r+D+6EUfSWIM/2yAWhs9TtBOhw5QyaiMXD6e4dNP0eripXQPlkI7S91F65ljNYxVpCrYaIiG2LkvLlU7NLpitJxK7JbDmrzv8ef3Pr3pwTVUhgMFSS37p7+8tP0SB2nGrVXmE8DeBzSnkQQzdsdPVRTdKJifkEYnd2QPVykdvAx0dw08cr+k2ip5aLhEFMn9k5Z5dLS+Rrvo9UUie7DMAl0SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767992689; c=relaxed/relaxed;
	bh=987WG82/4fdgilMdN2ubVOrpRs2w7yq7m26XNRwtGH8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=avdLZcRTcOuDYX9feNG3lnUVJqgxg1HAvUcDlQJwXd4YGeJQWJVIIzcBQaOGwddIW8imn/LB4twIqTfNP9HhWZkhvWdTir06inrNnVwJCwWdde5N8d0Xh/2bqsokPSyi4+jVDc2LTDqBSoDspw70P4ZyMrhTj872yO0heBC3DcH/7R1EIf3JwVBKX5tMqZhveOyD5GDmTiRfgvIJ5hN4iPbjojtEi/0EHc5LkA9YjTQ72Vm4XNplMGsMyCstc1ODDVJq6T8aN6TY40ozdiNeMynuwwuwSoYWxp4KLxYpFI/qUxOT6lpNe1TeVAEF6Cof+rLV2JBSqgUmXrY6vDxuCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2Iqn0nWe; dkim-atps=neutral; spf=pass (client-ip=52.101.193.52; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2Iqn0nWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=52.101.193.52; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnvRN0Q5rz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 08:04:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuBdyDosKNpyoafZpgVZ14yUIEP0rD9XmnzTB9UrnQgNlUP9nz5fp52XyBmxEw3r0hKZ3HsVkQ8p92Xwx2jEDQzfrm2a5hec7mSaDlmylPaSpICl4rTvjJBJ3umFLWnxdBxI8mLNTz/5Qh2P0dGtNfSSLtAHZHnWn7T2Ytpu6U6sfDsN4QAlR5jOhqiijrOUh4cGX90TD092Ex9UiOGAuBi9OaBKPLBIYfPqyTHYq5IVY9Zd8Qv1VneVhy+E28ggEIY8OjrMqn2NveSCiCnkB4GFW2Sz7YTYxL+E6Nt52sKPJxgoEVeQTT15KUs9OHPiCGcIDpKqjuGCifSTlOxQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=987WG82/4fdgilMdN2ubVOrpRs2w7yq7m26XNRwtGH8=;
 b=Sm3/QkkzJ1YtgyZzMG8zQIeWPEUy/zIuypkH+gSMt9B3b00LYZFy7cQjoiKknBqz+I4l6VdwLp+2K68M+Gtc68O6duvt8TSgJZni8yh3/EnR313BHwnqhWju2epbUBN78Og9uo3sI1NLrH6NwRC8kpAbrbY4hFwAKMeNFtmTbzIJ33BzzOFWviw3dH1/neaRt3fu2gPGAZP+HBY0xX5Z7kgp8KfQ4Nzf5YSuKkCLvl7sOJl4VnikUj/vsn5xxyBdYmmZMCdVj2XOz8QIM8316LuydZpYKzzjTDsDJoO6dOd5j9JUJ5VMHAByw7TfOKPP68KNGx9jqTzr6euID6yQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=987WG82/4fdgilMdN2ubVOrpRs2w7yq7m26XNRwtGH8=;
 b=2Iqn0nWez6B39EBMzfT8gdmzd/jawMA+sRT9pX2Gwq2WpT5xeZ9fAyOVi29DNT9quc2Jhhh0XJJmwdZ08Y3qG4D/gSZ/E65ZFTyRYjZ/GeTFdPw1uZ7qx/8pCHEqTOm0HmbW5lAeERrG1yMFqwoZ+o4d6EWizce9myjXUC0AtMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 21:04:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 21:04:02 +0000
Message-ID: <3334cea8-dbaf-4dce-8b6f-e22350f642b2@amd.com>
Date: Fri, 9 Jan 2026 16:03:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-2-jniethe@nvidia.com>
 <10a8c08d-38f8-4d91-8f4e-f6140f5f260d@amd.com>
 <ebc909f1-ab70-4659-b037-bb82806fa159@nvidia.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <ebc909f1-ab70-4659-b037-bb82806fa159@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0205.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::27) To BN9PR12MB5115.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 492c87db-ab9f-407d-cdd2-08de4fc29d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTByUnA5cE5WSXJsME45RWpQc3JnQ3ZCQlh4MG8yU1M2OEoyem9aUjM3K0hl?=
 =?utf-8?B?U2ZjYnZqSWhxanBCNkg5c0JMYTN5WGdWTUoweGFoTEdSS3B1Mm5sdllYM1Vm?=
 =?utf-8?B?RGRSUXc1Zy9NT09lbjZkN2o4UlZpaEx6TXNOMVNaYkNpdDNkaFdFRGlFMGwy?=
 =?utf-8?B?WENDaDlxR2xJbzFzdjBGckcvVGxLVUNCR3JRN1YzYncyLzZEcEs0KzQ2YmVa?=
 =?utf-8?B?VjlmU20yQWZoVkNFc2h1RGhaK2tESEprT3FFbEh4ZkE3YXlSaVA5dmdOdWV1?=
 =?utf-8?B?UlQvRGdlYXJRMnhUZUVyZGRIbTE0M3g4RWgrNHIybENWZjllc1d6eGVyeDF0?=
 =?utf-8?B?eEdqU3Q0M1IrSWNaSjJ2Zmg2NDNRalNFeVdZbXpKejloMEVvZzFYMUVQa2Jv?=
 =?utf-8?B?a1lBdDVNNXpmb3JHY3dtL3FYSVFlbStNc0toVGU2c3B6NXFPRGtjUFcrL1d2?=
 =?utf-8?B?dHZ1ejlNbWJaS21ZVTBvd0NnWTFTNSt1RmErZTRCaG1CS09EUnJocXNmMzNu?=
 =?utf-8?B?Rk1YcGFQNnRVYWJCK2ZkWFlOZ1lwOGVzRFUrSkt0R0hEZFptRlpMbkdYRytB?=
 =?utf-8?B?czFnVGdBUjdLT3hxcE15VTBoTk0wbURYT0Q4MThtQ2c3bXRKN0E4SW1hSDRP?=
 =?utf-8?B?d2YxZFdteVBOTyszVUQxbGxTdVRUaDJXNUVzamduTkpGNWV4MG8xcldjeWdh?=
 =?utf-8?B?QnJlY1hldEJwSHRDWTZ1aGxGbll5dEsyaE5OcE9WeFBZemhlWmE1Tjk2T01R?=
 =?utf-8?B?elNXUTk4S0NTQllVd2lScy93dnNSUDE1N25Xd2ViTmJnMGlyYy9XOWNuWTFy?=
 =?utf-8?B?M2hEQzR1eTdKYkQ3ck1aWkR0RUJZZ3Y5c3M3ZWNOd2QzcEF1TVRYdUw1cC85?=
 =?utf-8?B?OHpyTUJUeWs4cE84VEF1RHJNSVVtWjgwVVUvYVNETU05SXpEMk5Pb280dWd2?=
 =?utf-8?B?bmEzTVNHUVlrbmo0OURlaHVWdjN4WjZ2TFFvNXZ5RmhhcWd0ajExN2tMMGNJ?=
 =?utf-8?B?RWR4Y3JuZmpKSUhJNGt3QytHQnREaURnL2hNQkZkQ0JWSllONU5ZRzVEVlho?=
 =?utf-8?B?R05qMmV0NWpEVWxxVFdwUlBiRzV4dEw2QjArSEFhSEpPWkF4R2lONDgwazFZ?=
 =?utf-8?B?cG16SVN3RG8yaVVKdDMyZnBYaWJSbURCSm9YVFhORjhJM1R0QlBMOGFiZEdl?=
 =?utf-8?B?dG10QjgzcDdMNEpjSVVtNkJYdnljekxDc0NMcWxrTGl6WHU3U2VSZDBUQTYy?=
 =?utf-8?B?ODJidEhoUWxoQkRyaHphcnc4UjR3M21Fb0t0UERpb2pDRC9ES1ZEV2cra3BI?=
 =?utf-8?B?dlBNVzBsWlFhYzRqbExBY0xiV2IyREZnZFlQQkNlcHpFZDhxalR5MXBLeGhC?=
 =?utf-8?B?b2R2OWNMREpEbTcwNmt1bllCQ0pCenlWWkM5NURXL1pZc2ZmU1pyQ3VyQnJq?=
 =?utf-8?B?aG1PK0tkdzVzV2p6ekJBbzNlQklzbEJia1ZITWNRUlh4RnNLRmp5Y1Q0TGsx?=
 =?utf-8?B?aDhybGtHMHQzQy84OXNYUHJpZnNTVjVrUjNoL2RERUJtZHB1eU14ZnRTM3BR?=
 =?utf-8?B?TFlqcXdHbU80enJqRVgyYm5BYTJXQ2tPSENDRDdiM0pIWCtBYkVEM1p3R3NI?=
 =?utf-8?B?TUNWUmE4dCtWWGYyN25CaUxTbVAzVTYvK1ZsUS8wakxNdUNDRFpKMHZSS04v?=
 =?utf-8?B?cFNJemxCemNEQjFydlFDUnVXUmdKc1Rtc2FJeXJWS3JUdDFVekdyTzdtUmdq?=
 =?utf-8?B?VVMrZGJRVlhYVjZtbG5INU5yTzRNRlZrbG5ZNmNlejdGajRDQ2U5YzRHeWls?=
 =?utf-8?B?cEVVRGpwUGROZ2dWQ0YxNGlyV2pGVXZGbDFuWXVrQjNXY0VjanJ0ZzBVRDl0?=
 =?utf-8?B?eG9Cd3Zwd251czY2aCt3dkx0Y3lQVENVbVNYT3JUNkNMaldjdjh2bHRUbHRV?=
 =?utf-8?Q?9+wIhs2Akvz/BlJQWY6p5VXDna56minm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHJCaEJRZWhxeTByYjdTSU1EZi9ZczV6bW5CYXRMcHdEMFZ5bzR0Q0JBRm9F?=
 =?utf-8?B?YjJIKzVyTHJtbU5ESnR5aGU1c1Nnd0lvK0dLd2lSOVdqRWU3WSsvMXg0ZUds?=
 =?utf-8?B?TGwwVmZQbmEyK2ZWc3dVNzJGWlRuTXlVRjlLZmxHUVh2WTV6OTEzN2RhQ0pS?=
 =?utf-8?B?b215cmZ3OVhEZDBGUU1QSHJYb29BWExLdHZWajdvQ2FpMWlmUWd0WmlkS0Ur?=
 =?utf-8?B?THVZT0tNTlRCNiswekJOTjhnZ3UySm1GYU9VNEVBMmZSMzhRRFdXd1NyczRU?=
 =?utf-8?B?YTVIZklzaDRlL2tueFBiQklBQkhOOGh5Ujk4a0o4OXZRWEdLR1NTRkdrMlhn?=
 =?utf-8?B?RUFERTFZMXJ3c3lnTkxDQ3pvcEpUdGtxSXQwTS95Ly9NWTVRQjJKdmN1bW8v?=
 =?utf-8?B?Q3FuV2tTQTRBd1RXRUhxdStwS0Q1Vm1jTzU0a09MMjdMc28zUU9tQUNIb3JD?=
 =?utf-8?B?Rms0TllMWXZtd1hJVU9UUkNuVWRIOE9tV21BVDRYQzExMWVVSU95QjlvQUlT?=
 =?utf-8?B?WngrNDdTZ1VvMkVtQWZRMW0yQWl3b28wdDRENmVDZStzNzVtV2ZBdEdRNWVG?=
 =?utf-8?B?bXlCMm9OcTAyZUxzNVFSdFllejVTNXhiSUdJMWN3OWRKSG43TlVDdUN2NEV3?=
 =?utf-8?B?bmlQUStOK1BGTUtITmE0elRucFJNdkFFdVhIQm9UbWlURXdsTklVN0djSk03?=
 =?utf-8?B?bTVpa1BaY29OR2RxaEk1WGdVMG51Lzd5QTI0MkgvZERlSW9UaDZGSkM2aDdB?=
 =?utf-8?B?OUJkaFZ0UVZ6Yi9GNlQ5cFF1RGR5aFlocTJBcHRJRE1FQUl5Y1hMbU8vTVFU?=
 =?utf-8?B?ZllXVnFLelBWaVdpRVN3L1BjNTVDTmxCZFhWVVJkZHlkamRPVHVmVXQxaStj?=
 =?utf-8?B?enFrYUtaakRZNWpYV0FSZUw5Uk9kTTlnRjViRFVBc0JlbmVNd3NzRklaUUpk?=
 =?utf-8?B?Z042ZTk3aVR5dUtvVEh2TjJvUW9vbEcxcVN3bjlSRy9kSk96TG9sejRuNnR0?=
 =?utf-8?B?QW42TTRsVko2SE1QMkJqanVkWXJjTElPUDdXSkxUZkYwSEY2RTBSRW13SlZ0?=
 =?utf-8?B?U2EvK3BBME5TdTlQaWhReFc3VTl5bTNnRXpSV2pFK0lCYXhDZ2NrZTFvM25N?=
 =?utf-8?B?alF1RGp1NS8zdy81MmpzT1p6U25JRmUxeWpXdWNyVUZIdnFLSEZ1ck5kZzlv?=
 =?utf-8?B?WmtSWjBqSEdLbkhRams0OHA2UFRtUitjdUdkWExGNXVKNXRnQVlvVk1FMDlY?=
 =?utf-8?B?Q2xwZVl2WFdXZnd6dS8xWmdaWFJPY3N0THFyS0d0UTNyanQ2cnhjalo4SFZ5?=
 =?utf-8?B?OTRGWUJDZnhnaHRqeDVZT0VZR0o2cGtJekNpOHBPVk1VUTBvZ1FmVnJqUEwv?=
 =?utf-8?B?dlpvclRvSk1wYTllV1BERUw2NGJjdUhEMHJiR0crSkZVb3FXTU5FN2dqR1l4?=
 =?utf-8?B?MDl5R1QyQzM2N2ZSUzcxcmJtLzlzT0NzYWZ0SVBBZEg4elRsSkVnR0puTTNk?=
 =?utf-8?B?ZFB2dWlnRk0rVzZWNUV3dDVIM0VwTnllRTdyTlUxOE51VVJINnRFMkRCWXRN?=
 =?utf-8?B?WlFRbmRSMTBUaWovd0xVbldYNHN2Y1JKS2JlNDZYUHRnaEtkdEZTbEZHeFVz?=
 =?utf-8?B?bXRSNHF2allHTkpUc0dvZEVNZkw5MFpPajBZZDB5Z2drU2NkRzBwR0Rxa1NM?=
 =?utf-8?B?cktGQlF0WDZMellpOVo3a0NmNXEvUEZ0eWl3VTlhVGozK05NTG9KNDlaeUYz?=
 =?utf-8?B?WDNTZHlXRExmaXRTQXdwN016Y0lZMklNbjdlYng5S01XWE4vUm9JWHkyOU4y?=
 =?utf-8?B?SUlXeWdCZHJNRFc4SWhUOFQzc2tjVVorRnE3VlF4VXBNMVQyeGs1b2NySXBx?=
 =?utf-8?B?RjM2MU5EQUZ0cnlNYm1XSTdIYUM1cWZYa2dLajRrQkkyREdSbkt0b0NMVmhu?=
 =?utf-8?B?MzFza2JzdHMrNTh0RmxJK2pEd2ZZeERuRzVEQU8zOXZxTDFSb0VPdWc4WHU0?=
 =?utf-8?B?cUhUc2FwazFCZFNuVWpBeENiTjZNSVZMYjkzRjFnQjF0UHJqNmZtZ1lpNENW?=
 =?utf-8?B?dXF0QVVtTnNIWWpUd3JZam5aSU1XbXRCU1JmYnFlNjUzSmVNSTNlaHdrUlJY?=
 =?utf-8?B?MTJoSld6ZUhRKzQ0bk9XUDlvbGNaY1dBcTBNSTV6TlVIdmZFcDBNVVVCZUJn?=
 =?utf-8?B?OXp3YmZkOUZLYzIxVzNUdVRnODZMZUdHUEdPTitCeGdnNlRDQjNwL3hwZ3BE?=
 =?utf-8?B?MmNheXFXR2puNy9mRzVkOU1BVXE0ZTB0eU5DcTZ5RmNmS29iTEY2cnhJZEI2?=
 =?utf-8?B?bE9oYUNZNnMvbldOWFBoeElCc0VvZTJQa0lrKzhQL3RGQjFvMU5lZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492c87db-ab9f-407d-cdd2-08de4fc29d7a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:04:01.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGTQzawwGC3XTiwOXQ8Ty75V+NhLKKoFLKNL05+Djd5gcrhK10VIWdVWVHZR4Ed1VDZzvHb4uy5HSVNlF+/pTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 2026-01-08 18:49, Jordan Niethe wrote:
> Hi,
>
> On 9/1/26 07:03, Felix Kuehling wrote:
>>
>>> @@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device 
>>> *adev, struct svm_range *prange,
>>>           pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 
>>> 0x%lx\n",
>>>                        dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>>> -        migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
>>> +        migrate->dst[i] = migrate_pfn_from_page(dpage);
>>
>> You missed another instance of this in svm_migrate_copy_to_vram.
>
> I might be missing something, but is there call to migrate_pfn() in
> svm_migrate_copy_to_vram()? 

I see what's happening. You removed that call in patch 2. Never mind.

Regards,
   Felix


> I'm seeing svm_migrate_copy_to_vram() calls
> svm_migrate_addr_to_mpfn() - that should be handled already.
>
> Thanks for reviewing,
> Jordan.
>
>>
>> Regards,
>>    Felix
>>
>>

