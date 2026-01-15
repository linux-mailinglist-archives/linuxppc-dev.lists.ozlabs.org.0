Return-Path: <linuxppc-dev+bounces-15754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E571D2224D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 03:36:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds6Z75f5wz2xqj;
	Thu, 15 Jan 2026 13:36:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768444607;
	cv=pass; b=fGf50/aJxO0GlbrzQazlKDe9xXq5Mj8WNe+5+RQ7QBevjVf5+gGSvbtYV/jmeGNb2GAJbQ0Ei7x14WWwrQEceUiDaWt6Qx1JMb9bQngzAQgjVcpA4IJSqP8jLjFXnxWlzAXDJzAUfjgWF1UF5E+JA9EtpjRJz0aOMsGPjgMKo4WOFn+Ice/TL79ZG79zZOd+v0zp1V9kv/ChdvvL9NYgWLGEF5ApLP7PV0hRRzTd0OfLWFh46m8ZvJvMHuvfnLf8riScL0+LMvwAy6hcojX3fmuOjNZLpQ6wfMrTGtcTG6bVKTd+fbgKxOmw/KQJoOUHGi4QfqXkVsFpcOZ2dqCiMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768444607; c=relaxed/relaxed;
	bh=rjxl5v3e0z6QQN3XBc8cY9WYnT7mdnQZG1vqgtP3fuo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nPrXznsNgACeGV/3zwNMwWejIm0aQTEHyrhrzqDe/RaEpMK6LacAvA8SRvHKdhap0FXZ5mJbfTpSfWUejjYY2CdAsUvehec6421E8YJst2/o53m4zf+YMy5Dys6hD33FQUUErbnzfF9GiVU5nttIRUyDTeybyZt4OBEq87u7S5CRA0iN7iHw+5OdhpG7nuR2bQ4B5DdE3r0ajsvNaCKBcNgz64oY/iIt2Fquo3efYUxM8w6LDgq8OVQK2lCQ0JraUfX0il2clbwhMQEO2wRcK9U2UtcgUAopKEh4pxqCXkxsG7smJjuUMm0LlGBkjvqpWF/LWuVS901HOBd+se5Byw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kswGyr/S; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kswGyr/S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds6Z63pLCz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 13:36:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E01GYE/mgEX0mIIwV/wqi1keZ+JW5h2vwhyrDrWR7ESCq7F6YmvOw5DGdtglHH/iJ9C4JNjb/YhjHuL9k6O2sDr2DecketOBdmPQ12Ux65udn+42xCmera2fIF2Mfp8lXyMt0CbG4jqCUYOsHAaVuB9JZ7jKxM5jmVJxQP5ax035gU5/VloBZh4yAGj2scrWhngBN8UOcOT4OuS73Qof+vkb0z/Ltubt4CzTB+Z2Patp4cSFFvvKzSUDuLxRpO6cn49ApaA9NTFEqenT2ksmmcOxk/8Fq0TKjiWH4mS7YIbfohNxQFkRiazb2aS0WDlkQMw9Bt6smDZN8CbBnCqNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjxl5v3e0z6QQN3XBc8cY9WYnT7mdnQZG1vqgtP3fuo=;
 b=val9SrurPnVmJM9bIeacgaXaNOzec9HO0Rmq5yiPOYXD4rZ/yZ5ZGhR5NpttYobTnh7UZt3FLdRuM9MoScIfZKBS61vzs23EkrtlQPbO9VA1opXYb+rEGLTRrkUe1OloU73oa5tSWgJnL1kehiznSulJPpeBSIelsdSlp0XW9VGqWDDFH1zkPYZgLp3V0om+W6LfJnTElScRgVsXwQH8hihe63bDQYYz++D3ypWfoxnkngEzzcfibBzvWZ4YrLqz2VZVfVaK6Pl1QMcBWteL4ou95DUlR5Okuj+6mA1+VDwlImLzQjEErhk87EEWbM3f9KYnDK/1ORvFdtbhszgiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjxl5v3e0z6QQN3XBc8cY9WYnT7mdnQZG1vqgtP3fuo=;
 b=kswGyr/S2i8A9bOJ/5KtDMd2Em6yEo5tT70RRcqWVBLInv/1YO/gkZr+8/FYpneXPi8Epdzn4aMOTWFhpnKPz+vaXyTlExqQBOBfSZBpUUBRSmsB+J8G8R0+JJ1jsvlrqBIm/KzT9VNeleQ+cZCGDo77rbqgYWNTLLfh7te2YqVblI6X582xIk0oCf6jq4Bf3laqm9Mw5i+lgYCLrm2FC9M8tfpkJ4Xvowq/Q9rvrXs7hhwUVWfCOPDDZS7lg6Xg1XQ8GHm7gnaAzwD18PFMqKFGPWR8B0YjX3N7MAmc8ZK+DEQsvcVZ+vAuNygi8Kn0FnusstpGwpE1Ho/RCLeMNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 02:36:21 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 02:36:21 +0000
Message-ID: <4cd42f41-660d-40a6-8365-e06fa4fca6a1@nvidia.com>
Date: Thu, 15 Jan 2026 13:36:11 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
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
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: c4cda27c-e526-44f7-c499-08de53dedea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVh2dFdUN2VYSUpXVWxubnR4WlpVcGtQdnMzYWNxQTg3anJQSUo4ZHo0NTR6?=
 =?utf-8?B?WHhkUHMvRFYrd2VwK2FkTjNHSGxKMDhOSEgvMU9JUTBRVnFGY0VnQ2J6RWln?=
 =?utf-8?B?MmowN1FMUHI1bkUxZ1RFNjVhZmdvei9BQkRTeU9obVZueVVVUElyY2pZSDFh?=
 =?utf-8?B?ZWMzTWgyQVdqR0NrYXRXaVc3WjI0aFMxSnFpSThQQVFkRkFSZ244SHNrMG9R?=
 =?utf-8?B?VnU2SWtkRkVxaGU5eUd1S1oxSlFDeXdGSTFJTi92L2JsZlN6NFlHMlFLcHBk?=
 =?utf-8?B?WTk4SVBkb2xnY3NZMjA4b2tBRkxpSFoweEZ5bDEyaWRxT2Y4cGcybzZ4UjVV?=
 =?utf-8?B?Yi95eWxTQzBlNDhpNGpPcEc2UTZpYVNTbXY0ajBnNXB1RFZqNlc0Z2Y5akhS?=
 =?utf-8?B?cE9TMktyNTVPL3NPUkcyNzFMR1hoVjNIWUtyUVhVaStBa0NKUjAzTUg3d1hm?=
 =?utf-8?B?VnRhVklsVnA3dWREZWNSY3FIcG1VN21BVnNNWmhRMXNxcndxVEhIU2krcTBi?=
 =?utf-8?B?QmhDWnJpVTZVRndMa3lFaGtTREJHUXdiY1RvcytsUFFzL0E5L0ZxYWgzTUFk?=
 =?utf-8?B?WHBqY1ZFZHhWV2YwMVVLK0pEdFZoeWpvbVRXRGl2amxlUDE4V3hqN0ZraGJP?=
 =?utf-8?B?aWk1M3lRY0NTSkFUYlVFU0ljZW1Mb1BMd0dUYkhHaXAwYWJKOW5RRVpyRTZr?=
 =?utf-8?B?SEs3VmFlMkZISWQzL1JyVUMzeWwzYm1vSjNNOERrbjArVW8xVndrbk8vTVhQ?=
 =?utf-8?B?K3pRVHROWXBRZi9KeUhQbGhjZVZuQnp2R3BObkp4ZTFFTUxaTlQ2OGpLRVh6?=
 =?utf-8?B?cnk4V1g4MG40UU0rY2RKN3NlM2ZnR2FpYTIvSzhQYU1BVnNUOU9BV0ZVK1J1?=
 =?utf-8?B?UFlTTXhML2IrNHlqcDRXMVRJaVRUSWk1TlJEYTNwWGhQcW0vZFRqeVNYRWZN?=
 =?utf-8?B?S01ySG91QWMzTVBmbmpnWUlHM0dTUm5nTitwUGVSWDVnZ054cEk3bm9lckZv?=
 =?utf-8?B?S2xodzVpaW5JVTNZdjlSY1MrVW5ZenlOczNISDZIdisrZU9xL0tPUjlNNnRQ?=
 =?utf-8?B?Z3c5S2VkQWk1NlI3anlVcXdaOUlNVkYxZlEyRFF0TVlPQUljZmRTVTZGMzRu?=
 =?utf-8?B?L09PNk04TGswb0xlbmg0OVlUemljdG1mSmNxZThMajFkdno2WERlNklIYmgz?=
 =?utf-8?B?aU5BVDduL252Y0huTDduTHRaNGordXoyR3c4aXkrWUtBTHFNR1ArZmJod0Q1?=
 =?utf-8?B?QzhFSUo0cTNXOUdsYTF4bGd1RllYRFNJTTFraTREa0RZRXI3UGFpYzJxSTVm?=
 =?utf-8?B?cktBRm1UOTlsV2ZoR0VvTGFIQXJsV2VRRUhlSWFnZmNTWlp3SllKeGVId2pl?=
 =?utf-8?B?dGQzRHRsK3ZsVit6MTNRSWIyRHJ1eStWK3V2NW9vVWFjR2Z1TEZ3ajVxcFh3?=
 =?utf-8?B?TUFwNGJ2R25xWXVLemc3ZmtGV1ZNZ0FjalZ2dER2MXU5cG41YkpkTE9YNCtC?=
 =?utf-8?B?SDlNQ0VzWG1VOC9QRzRtWGxxcG1UbUFDY0lTaUluVGx0bEdiRkNYVVRzaUo0?=
 =?utf-8?B?TDd4V1RIM0l1SUpsUlJxdm1OVnFiWkN3Vkk2RHBSQTVBMVVxYTV5a01vOW9N?=
 =?utf-8?B?V0piNW5ZT1RoMGdPb1FWZmZ0eUNTOUtjTSt4VFErdnViNVFiUzBRT2d6KzMz?=
 =?utf-8?B?UFE3b1I0Um5nUlk1ZkZrbkhuaWFJVjFVSnU5UDZ0TkFhT29pREYvR2N5L3Zo?=
 =?utf-8?B?STVRdTVYQU5XY0lDMGdtVGdJNVdIWVdvelRia1ExSUFMTW15YmxJb3RrZzVI?=
 =?utf-8?B?cTNUMVBOdGRlWkE2YjZGUjZmeWtOZTRUVzdOZWtVVm1zVnVRVDB5cU9weExD?=
 =?utf-8?B?OCt6K0FxVlBicTQ2N3k1OXN3Mnh6ZmI2UVI0VFlUa0w5T21VcnRiYzNzUzdi?=
 =?utf-8?B?bmVpY0x5RUNwMWdvVUpWQlRKdldqQTdDRk9USXlUV3Znbm9PSlhOd0JQcGV5?=
 =?utf-8?B?MGVkM21XbFRNdDJFd0hOU2RXT1JFeUorVFMvMmJmMkpoYUNaM3EzRjFKQjlW?=
 =?utf-8?B?aXp4cUFhdTRyY3J3ek1aV2RCUFQvSWNGcVVuQmFlRmJqTHhLZG80VWR5MjB5?=
 =?utf-8?Q?VunA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czQrbjIxTll2eVROeE9WUzdoUytnWWlXRS94SUVkRklidDN6VWVHT3BTYTJz?=
 =?utf-8?B?ODlWU1BzQUdFQllIR0N4Y0JIVTNGZDNiOWdnTWtPMFhLRW03Yk5keWZrZ2pD?=
 =?utf-8?B?RFBMY2lTdldjY0ZzVVpOVy9DS1JSRXpZQnZiYlZVM3FUT3pSMGRIKzM4cWUw?=
 =?utf-8?B?dmU3Sm1BOExBcHkvYk1SU3J0bnp5dUlMcEFQdjV4VDhsQk9pL0hmY2laM1Z5?=
 =?utf-8?B?Y0dkK3loejU5OWY5ZEZ1OU1HN29pVFR3QXFER2dGVlFOeFJPQlNMWDlMeGpy?=
 =?utf-8?B?dCtRU0gwR2dySGZXNEtvbHJCTldmcUpKT2d1YlQ4MkRXMFkrYWRoM3dXeEFY?=
 =?utf-8?B?TVptaUVBemNrUmlNN2ZxSUpvK29nSnpnR3R2bjNDR05YZmxQV2QyUGdqWVlq?=
 =?utf-8?B?dXZCMFhKR1FhZ1diVzVvcXBBQ00ydFhYZllJSDRuUGxLcmtIcmpxY1hyNkFh?=
 =?utf-8?B?VmxpZXRNbDY2bEl4Z2N5bk1FbTNKVDFoTUh5Ukg4K2R2UWRqeWttOU93Ly9n?=
 =?utf-8?B?Tnd1SmV5L1BlbUNHSXhyMXBpRHZONVVsbUpxOHJXUWpWVEpEeUlsL2hCc1Rn?=
 =?utf-8?B?WTVucDJpRWhUeEtvTFlxY3NSU0dGSUlYTGo5dkViU1BCdUEwWFA2RVJtcDV1?=
 =?utf-8?B?MTFFcTZ2NCtUU3RSSkJGdE4vRUVERFhsNjhER1d4ajNuRkFUYko3RlpPY2tT?=
 =?utf-8?B?RldMaWVSakZMaXo5T2dUcWRIWGFacElzcktsdE12dUVTUE5xMjc0bmYzWlM3?=
 =?utf-8?B?aUlUNmpDcGwwM3dLanNvT2NWQUdqZHJzaGpCR1QybkxSNlRHOXI5VG5mcVZ6?=
 =?utf-8?B?WGRvbW9zdTFnaElSTkh0a2R6a0JiZ0JhVFNJS080MjdlNFJDdUdwTTlWck1a?=
 =?utf-8?B?RjV3UDlBWW5qOUdRK2s0RmtsNnoxQThOM2Vaa2I0R1NlR2xmanNzVzl5UVFS?=
 =?utf-8?B?dlhTWVErMWdweGtxVmxLS3RhTGlzVU1uYlVmZnphSmo3SHJTcG0vVUdiV2dM?=
 =?utf-8?B?dDIxbG1TVkZQcVE2cTY3YnFTMnoxSzNQWElHYXRreEpBWUpERHg1d1kycjV0?=
 =?utf-8?B?VERXSUYrQ1JPT2p5U3RLNHFDWUF1djR2N05UY1c1eXFoMTU2VGx4RGp5T1cx?=
 =?utf-8?B?RkIxVC9YbW9EUENybkVzejJyNEdoK0JuMjlRU1ZFd0d0VjdtbmpDOW95SVNS?=
 =?utf-8?B?bC9WcnJCRy9JdmE1TTFyL3dTUlIvZXVJa1Bpem13eHI2WkJHYlRadVpWZHNF?=
 =?utf-8?B?eWJFaWpHNjlaaEdxcmVQWjhhNEVLVExqVE1JYUpLV2RLZWJIdEpPamorcDUr?=
 =?utf-8?B?YVoyWHJ3TDlBcGJGc3VHRm40TWc2c2JaRjl0Y29YWUJwcXZpWGl2M1hEWHVM?=
 =?utf-8?B?cSsyMG9vRFQ3ajlJVTVXNWUxQmllNElRMldZMlVuZUtoYURIeFkxcGV3WFBE?=
 =?utf-8?B?OUZHYlFDcXQ3QldWWGVRVTdOWjAxNHNtZzhRQWU0U0x2WUN0amdmRUxvcHZB?=
 =?utf-8?B?VjhWM2pGQ2pBWW1WMGIzWEFOVHFDczdxRXhjQ0JUTkFjZ3VaK3NnOGoyRVNE?=
 =?utf-8?B?NENTRzN6TGVzejgrQm53NXhCSndLeEVWKzFIa0l2SnVMRUU1TTdUZVp5WVgx?=
 =?utf-8?B?NTVKbkNEMi9TekVzZzUrRHZwVUo3VUgrOVB5SWJkbitSTFdxWklEa0F1OWNo?=
 =?utf-8?B?TGg0Z3RCZFNxSGRkV0g1R1IzSDFzWUdScTBGbWpDRHpPUnVMQkw5Vk95LzdF?=
 =?utf-8?B?TG9NcENHVHEycDlaOVJPbEhDODZJaHRGV1VkbitwN2tMM0lRaVZEemNXWTcr?=
 =?utf-8?B?R1BEYXpZUzVVUFVJaXZMY2FqbGh0WmZ5WEx1UWZ0dU05aDJ0UjZHSjE4Ymdo?=
 =?utf-8?B?bmx4MU9DN0I3RzlFdEg5MVhTdWYweTlTaGRiR3Eya3VNR0tMQS82SDlQNWZG?=
 =?utf-8?B?aUs2ektwMjNHemtTR01kbDhPU3dzWHRBdjJxd2MzWHZNeEFqaTFjcnkwckhF?=
 =?utf-8?B?OUcvRGk3bXpPTnhPT2hvUlZXdEluTVh4L0NhOXd3ajczMGhSMDVMQSswcHR3?=
 =?utf-8?B?VlBEdDA0d2JUbjQvNWNKbE5QMnFGYmxUb1IrUFNhemVydVlsdGwzNFU3UUgr?=
 =?utf-8?B?MWJGdzVoV3RJY1VYZk53NCtUTHhvcGVPeENZQmRVUkFrRVhXeWUxQXk1dDhW?=
 =?utf-8?B?OXZEV2g1TnZBSVEwOHNKdlNvb1FCMDFvaUcwcDRWRVZ6L2xtamxTTFJIOE9a?=
 =?utf-8?B?eXhBZEpkWisrdE0zWkloZHY3dTRxTU9iRVp1cWVxN2h4aUZ2M2dMUU5TTEdI?=
 =?utf-8?B?dG5lS1c5aFZyZWx2d3VnSFh1S1VlVVNrV1FvalJqL0hUcjRmeElOd0hIdlpG?=
 =?utf-8?Q?rXx8JSRvHR7sNKy6psePeqbAS2Jo85twL/wPPCwTWZUc3?=
X-MS-Exchange-AntiSpam-MessageData-1: fQ88yMc5t3rd/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cda27c-e526-44f7-c499-08de53dedea6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:36:21.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz/X5ifBsKZrtDjUuX7qSvhRrVvaZuW3qhYWAjLxySdGUXxuTw0irs5Ok8+B0qF4sw6kTZITg4qQlYYBXGAD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/15/26 06:19, Francois Dugast wrote:
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
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>  include/linux/memremap.h                 |  9 ++++++---
>  lib/test_hmm.c                           |  4 +++-
>  mm/memremap.c                            | 20 +++++++++++++++++++-
>  7 files changed, 32 insertions(+), 9 deletions(-)
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
> index 03ee39a761a4..c497726b0147 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
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
> index 63c6ab4fdf08..6f46ab14662b 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
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
> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> +#endif

Not sure I follow the new_page - 1? What happens when order is 0?

> +		new_folio->mapping = NULL;
> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> +		new_folio->share = 0;   /* fsdax only, unused for device private */
> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> +	}
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().

I wish we did not have to pass in the pgmap, but I can see why
we can't rely on the existing pgmap

Balbir


