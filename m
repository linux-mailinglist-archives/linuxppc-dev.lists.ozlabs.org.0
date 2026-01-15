Return-Path: <linuxppc-dev+bounces-15762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 583C7D22792
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 06:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsC2837fxz2xrC;
	Thu, 15 Jan 2026 16:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768456672;
	cv=fail; b=gIbT1N7b91lHyHRJQmCVWQzg5AoS88eXVGZcRqlZSsEU1QCwWaNA9QGsjkOtUEKk+fu6J9Ro21EhW6I0WJ/kcl8O8uMs+J/zN2sI8zoUv2XUnl/Sh32naPVtf+mYwZVakZAvC7H5MOxc0UBJyGwY8v45BI+Wo/oCLeTG7bt8WLFy4bhvgQrMqkp50doYl5G+/ZBkDbzzl8ZbFkBgRIbxiTSKK3uvvXejcwNxw9eUsaJVuoefDN4A9nsVlqcIW4RU3kDz+6kP2uJFHZC8W03Al8YEg05Ic7JOP0ULl5Z/vbkyMMutK6QxVICP+9PZkaR1PIQ58quZDtrYsCyPNb8a8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768456672; c=relaxed/relaxed;
	bh=c6KVJzV7Bjo3xmTQLVb8bClLPS4LLGCAjkl8myFOGvA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IcI3jx+jogJ/eemKkcldBZLuKgocQEgzLcDFkjj+enFtMLzctz+sFmD7KdQrbVNVh/+bf89MlWrQ0iZdyjm1j+GpIaiIYYZX+hgKSXqAnwiPgxfq7BaklmRR1Japxu/ChNJ0Pzdz+ADUSxI9xAYBirQ9s8cUVRsezvPilb96g+3SL4oueSVw1guycfGyiB82V5+VlmiTMwv1RHxmBwh2xftnGmUyE7L3L/4nZ49+dq7oty0CtliJaWBO4QN/hLYloE2F97A8xIhxx19vYaGPIluEzajsr5nVp5RuqCied2bMd1+2fIGbS0i+jp7C1U1zcjX2h9u5GsxeogG7ZqmSrA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqLupSNn; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqLupSNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsC252DJ7z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 16:57:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768456669; x=1799992669;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PftL85kinyeBVQStwd7XJLUQ3ybZ5Yw4rZY6VLcb3zA=;
  b=fqLupSNnOqKkVp2rhhpK60eUUGqdfermLKrOC6b+FZIW8IBo5wUuYVDJ
   BPtHIXcZFAmBTmlSoManxMNUCt+HyGxgQdqODH/fO4vQ1hW1Read3pCCt
   bOGNk5Xlm01EmY6FoRTStDoIe5WgmfAX1EiIcf+VXqaMKPaha1jM0PhXY
   bY4l1sCEVgwW6aupR2FzvhP5IxoQn2EB56MboyIOC/8C7cv8lItgyrG6V
   zoKCzoUGjs0RvUWAWEKRVHCT+d5zH2calxXoJWAsTqeFcr7JtSbYIWZDD
   NVUZ3C6a6ZJ/OpDl2p6cFl2EZlbtD3BL232sj1xXHwlpgdTxJisi5IsDr
   Q==;
X-CSE-ConnectionGUID: I1+KskMPThuFQhcnRar7bQ==
X-CSE-MsgGUID: AHnsWHADQPycZ5uXp5ESDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73601593"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73601593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:57:43 -0800
X-CSE-ConnectionGUID: 35y0mN+CSNOuX8K1u5VRiw==
X-CSE-MsgGUID: bI12jFYVTriPoG3bjMqv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205285594"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:57:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 21:57:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 21:57:42 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 21:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKjEyeGxrt3kQ/cTPg0zTzYV8eK1tqih4jmV0imNJbLELD3WL5AIHbqzGUx8cWRfkf0Aj3LVPbaZTI7gnqMzcVbZ66vqQHBLlV14bUuvSEpkvxufWInQ/ThqgGzSzC0WyAcxNzhiCFuw6qrg7vhUuwbdK/cWYAOJqsap7bfG/sN1A66XrKAm8e/DSxeIoRfsZk96sS1zDzExJflnGOLehU14HQj9wnqPB2wZYdGRq7pA9UBzoF1qJk5LDzQyziwehdjs+++pjBhmUUx4u/gpg94nCBsmU+nQsoC5MXnYcqC8wdVdP6O8NDK9LBgwTBBXzhKwUgpqKk9TEO/qFKpYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6KVJzV7Bjo3xmTQLVb8bClLPS4LLGCAjkl8myFOGvA=;
 b=BSwWa2p9gR1EhXw9+rfaiwMfTcqutiejOrqkimro9CHGPtVGc3N1qdeMmWvM6IaQ08bVduchrn2f3ZVKv2EXm4m1uN76SeBGiDW0+nGyUQyX+ZjuB4ylJeFEog+AdBWQ7KtLcLTGs1rRhEHXAetCCeExxQ9vd9KAAi2lahvNevP4umykz0Tobug9oG8qJulpJQxmIIJs4pS9u9XbEwIr3cAw8iCH2nXQ3J+IXZRa72d4XqEJ1V2EcKGXGaxqMI+XadNY//zPQKHmxSMNFJy6hlQY/FdshXCwx2qpS1ZoFQ0z50E1Z2mjU7pL0f+qCwXkeNw6tX6PxIp771mrJB3Mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 05:57:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 05:57:34 +0000
Date: Wed, 14 Jan 2026 21:57:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
	<ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
	<npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Leon
 Romanovsky" <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>, Balbir Singh
	<balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 848c2dea-7df9-4b0e-dd76-08de53fafaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnpJVmxPY2VDYnFoNDErVmp5bGoydDdUb3RWd1lyQnJLTmN1SEplS0hxWVZn?=
 =?utf-8?B?YUhBcVlIbkZJY0ZkNVY4NVNsWXdBZmpKOGEwRm5DVDRJUkFyRy9UNmxpRjcv?=
 =?utf-8?B?L3lpMmY1b1dLNVlnZDNuZlg0NTJKNFByTXNadWROeTVJbnZkamNzOHFjVGJt?=
 =?utf-8?B?VjN4dGl6d0xuY1RUVGliWE55djhlNGhsK1lrZXJCMEZyeXRiRnIzUVVTd3dJ?=
 =?utf-8?B?bjVTUW10NkkreEg1UkgraXlwT29vRnhmdEY0aHovTHdTZk55YisvOElDT3ZP?=
 =?utf-8?B?TzJoT0J6MXRuSDBhTlpESWNiSDJBV1kvV1hLNHl6dUJBMnNZK2ZaeUtmdEpu?=
 =?utf-8?B?QzA4R1gzMVVzMzhoZ04vWFl0T3FBRnVzblE1UVBjNVRkZnp2ZnJtTkNXMlBG?=
 =?utf-8?B?b2NsZXlTcGc4U0haM0U2dVVmTVJKZjhJdkQyT1g5YXpBK0M2Z3lZVG5kS09h?=
 =?utf-8?B?L2ZXSElwM0FsNkNCOXJkektGNUJ4cG1hekt0bTBVMEd1enlnS09NbnBSNnVH?=
 =?utf-8?B?Wkd2djF0ODJscnpKbFZhb090OUFPZFFrYi9PR3lqSi9xdmp6QlQ0TDhDU2pU?=
 =?utf-8?B?R254VUsyMDQza3p6aktPUlM4SWNjYkl4UGsyOU9EbnFMWi9Zc3k2ajE2K0lp?=
 =?utf-8?B?V2VuaWRWWjhtRmVpQ1VUd2ZxMVNSSEdpaXExdk45M2dNdk5sUzJxZWtDOTNj?=
 =?utf-8?B?bmJRQlZEZktIT0MzZEk1OHBIc1Q1OC9pZkd3YmZyQ3plMUgvNmFTOWtFM0sw?=
 =?utf-8?B?MWhLOC9tRTFMOTlUam9lUWdvNFR6LzU2T1VMVHhseW84Q05QVjBQb1BpVUtr?=
 =?utf-8?B?eVZWbGFNRGNHT2xyK1J1UURFUmFyK0lOU0JHR2w3UlZZTVhUaU4ySGJWU25u?=
 =?utf-8?B?QXJhQmJ2WTdnV0dOc0VIZTZhd3dNRnVQUWdVM3ltYitoNTN5UUdodzhGb3Ix?=
 =?utf-8?B?L1YyYjRVZ0NyYllWWktLL3pUdHZDRExSRXg0YjJ5elZHRWJKMmIrZnRxcjZH?=
 =?utf-8?B?WjdUVXY1TjlCVTRiOGd1VUFTN1RDSU11VFBQMzljOG5SNW5oc0hKN3ZqSmZZ?=
 =?utf-8?B?SmdIYWU3WTJxTWVGWWFINzhnQXZ3c3lHMy9ldzlUS1V3NnNoRFRRSU0wQzFt?=
 =?utf-8?B?eWxQdjVlN0hLKzFIWWNDeFU2TFlkRVAzTnhqbThCK2tSSSt1WGZrVWVxUzZt?=
 =?utf-8?B?U1lIdnhpQUlQQUlOOEZ2bnlLSnJLS2lkMGxjSVJRek5vMHorL3V2RDFnNGdO?=
 =?utf-8?B?Y05ydVU1U0I0cUZXRXMyQWkrQXZ6dHBmYUVyY0Zza3kxdnpGZ2RUY1BkeGZ2?=
 =?utf-8?B?bXpveVpubFJYNG1FZEp4L0Rldlk0aTV6SU5nRjFyUUVkQnFnZmxzUERDdUZH?=
 =?utf-8?B?RkdhdHZmUnZpL014bVd2SmozSUwxdm1XcVdVak0vYi80OFVJdXBkRTFORzRG?=
 =?utf-8?B?cTA2Z0RnM2Rpa3F4OEFrNUNJb3RNWGlIQ3V5Rm1lN3ZZTDhoOTRhRm8xYitD?=
 =?utf-8?B?MDVxbnlnd1pLOW9Ubm05eU1qN2grOTdGNWsxcC9PcDJQYmJ4UmJ6VzNxNlph?=
 =?utf-8?B?aFVOZFJqbGgrU1FXeWpMT0tYQ3lYK1ErUUJZcTFZdXEzUnBVTmtkZzA4cEFY?=
 =?utf-8?B?VGdRQWRjVy9HeFNFb1R3UXlSTmhuRUdTLy9FMm9DMjg0YW5CNm1IZVZ3dkxk?=
 =?utf-8?B?dTV6TTUvcXMycktOQ0xTdlVEYTFHQ2hSS3RmNVlsMXpUcElEalhQNUpmWE5R?=
 =?utf-8?B?TUFLNFhLMFVESGxYZCtFNTIvNGdqclBKZGdEUUkzRi9DdHlDT0VFNVpMOWc4?=
 =?utf-8?B?eXdTR2lmaFZkNzVYZ2UxQVM1VFJUcy9GMEc4REVpeWVVOGl4SXRiaHdBRU9V?=
 =?utf-8?B?QlRYS0dGSDBFQXR3WWNvQkJSY2NEeElsTWovVmViRW0zdjUvcWpoTW5Uek50?=
 =?utf-8?B?WGdmZDkySGtHOFdvV2R0UFE5Q25vVjd4eTJCcVZ0bVNrMm5lZUZhZWVSYzV0?=
 =?utf-8?B?WTlWY2drakp4UTEvYStSR1dpbEtsNG5JM2wxM1lFbGlMd1lwSWhPb3ZycE5I?=
 =?utf-8?Q?PK3HhQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGQ1VWppa0hEdkVlZFZUZFA0V1Z1Ymd1SGJKTWIzbm5CaG1WbGlXV0JZb1M4?=
 =?utf-8?B?WDlLSndxZnd2QTJwaC84YXVBZFYrZExyRE1wNUtIS1VXZ3E2Nm5mTk92NDFO?=
 =?utf-8?B?SWdPT2VXQUt0dkdFclZBd0Q3RExaQVE1K1lZOUc4UnFCQnpkYlovNjc0Nmln?=
 =?utf-8?B?VGZFQVhwejFmK1R1NVd5bWFQeUkzSnpHRXFaLzMzUjh0UE9zMGdkOTNmVVA3?=
 =?utf-8?B?b3BWNy9FblFaNjVQaFZqMklTbGVmem10S1hib2VzTjBvNDRnb2pMblhabGhN?=
 =?utf-8?B?SDhkaGJBMzZLMFZaL2g3c3Z5d0hYd09sK1Y2SDlTMU1zS0lCbWNzcXlNZEh3?=
 =?utf-8?B?YmQza29QQlZNaEdRR2h4Z1Z4RlZINDR0Njc4Zi8rdE9KalI2ekJQdkFlNmVm?=
 =?utf-8?B?dUtEQmdGNE8yajVWTGZlaUJEcTkxdWh1Qll0RG9qSnR0dkRpNHdYWTVUUHZH?=
 =?utf-8?B?c1l2czJaU2x0cFZxam44WGExSkR1MDYwbHdQWUNnd2xoV1hXQzVURkZqR1dW?=
 =?utf-8?B?Mk5iRG1Ub0RVQUZiVzRsK2FiZVI1T1lqeWtCUXN5M2ZVNTE5Y2NJdGI3OFZN?=
 =?utf-8?B?Wlhka3k3ZVFBNmtkTi9rWW9kUWtDVFhubTIzK2lxQTFlRVBmc1pNdjN0MUR1?=
 =?utf-8?B?T081eXhIdXBXWUtISnFXbXVxUDh5K0hLUE9NMlpTOHhzbVNCdHZjNWY3ZXln?=
 =?utf-8?B?djdya3NaZnd1dzEweHFVNTBtcStTYU51RnFCK29QNzFza3JjTFhsT2xrN3h6?=
 =?utf-8?B?bUduT2lqKzl1cTh4cU1nVFBHWTZpRExuV2hDZ050dzVFNTQraHlwc0FSeEk5?=
 =?utf-8?B?cHNPcWZ1dGhLZFQvVE5rSENBRTUvbUZNbDgyUkRlbFZlRHd2cGlKbjJjRnpy?=
 =?utf-8?B?eGlzc2xxYldyT2xleG8xV21MYXF0QmRFT2duRHMySEVVaUZqa0pWSlhaOFpa?=
 =?utf-8?B?M3VGMFQ5ZTc2dW4wRUNDaXNFQ3IzMWYzSlF0Nm9PaENvQjJRYU0rbExKSFU1?=
 =?utf-8?B?UWR6aDNyWFFaVi83aWRVZk9JakgwM21Fd05CeCtFWlpmaTZTNlZwdHFXYWR2?=
 =?utf-8?B?ZEhZb3RUUzBNQmxLamI1cThSUjUwalA3aWRTRzZpNU5ZQWNVVndOVkxxUWk5?=
 =?utf-8?B?bEc2WmU4N1VCS01QSSt4Zi9KZk9MWi92SlZLRnpTS2lTR1JsMHZDWHgyUVF4?=
 =?utf-8?B?MDY2Q1ZTQWlhSUhUWjJGTFBxVzBpRUZkL3dLc1EzN1M3YXArL2J4OHBlbnFk?=
 =?utf-8?B?eStkT2JLTGkzVml3Rmc4OXh4bmlyY3BEOWsxcE9nc2pGS0V0U2R0Y2RXUVFl?=
 =?utf-8?B?YmVubXBibnpUQU1WR1RybWV3dVVqR1RDWE9LTTlkWkYyZXdyNnlURExPbFpV?=
 =?utf-8?B?WHhDZ3RRM0JrL0ZCUEU0SFJQczdBSDZSN1luYThPTWs5ckVkQlhRdWdxN0Q0?=
 =?utf-8?B?RU1MRlRraXBsTGVSb0FhVmhEYW43bzBHSmx2WTNSeWI4bEFLdTJlZDdGOXln?=
 =?utf-8?B?Qm5RUVRzeEV3V2dwZitqb1pTSXYvM1JybUZzODZjNm1ieGxjLzJwaVAxZG1X?=
 =?utf-8?B?Mmtra2pqMjBrVWtWZlI0ZFZ6VkFlaUhJN09jSWtWMmlIc0UzSlVaVm1oWFQ4?=
 =?utf-8?B?NTgzYThHMnlRQ1p6ekNRbTRwRkZyUzJaRU1NOUpFYTY2WU4xUGhZUmY4amdO?=
 =?utf-8?B?aGFoVjVFenRva1BTVmlOZUJ0RlRiMzIrMXpwZXlsTmlFa3QxcTZMVmxtRmdI?=
 =?utf-8?B?Z3J2SHNpYkl1SnZxOGhZQ0tyeGQwNGdYb1h0aHVSREFIQ09uY3dMbUZFZEhX?=
 =?utf-8?B?WkxYNS9kMks2TUl5TjZHbTFxd0NBVThGd0FHWUNkd3JkOHVMOUJZandIeEZJ?=
 =?utf-8?B?YmhXZTlpZkF1TWhWU2RIZDJ1U2YzVWMyV3IxY1NBVTlGbXkxL0Y2Q2JNN1Fh?=
 =?utf-8?B?R3RmUFUyUk50OWNXby81bEJkSnR3OXAraDVzQlZ1aFNnMUgxR1BMcUtMdDdP?=
 =?utf-8?B?TnRMd3ZoMDNVOThUVzlhSlZYRk1COUp4c1ZLKzdhY0NUSVRUZ1lxRTI5L3NF?=
 =?utf-8?B?a2p3TUg4VjZKZTA0cEl0eUNURm9CZGtXNU5vQlpacDN6V1l1aVVPSEsvMU94?=
 =?utf-8?B?aVpDWDk4ZzVkSDM2Y3BJaXNnZmNiNmhwajUxRHpNTEowZkxMd3JKL2dPclRX?=
 =?utf-8?B?a3IxeEdubzZ4b3h6ZzdtQ1k2MmhpRW14b1JBdy9CclNCN04xdzZWQXVBaW50?=
 =?utf-8?B?bXJ4RzZJdndkQzkwWXY3MXZGM0dQWU9mbVl3N1lUYTR3OXAzbi9VVW1aVU84?=
 =?utf-8?B?WUs3YjZuYm5zeGo1RUgxcDFWTFVlV25NQ1ZoUndjZlY2MU5WRjRObXFSRXNB?=
 =?utf-8?Q?tRLQ9Qz55xXimpHk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 848c2dea-7df9-4b0e-dd76-08de53fafaa9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:57:34.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdgbaQwlesAzxUro4Xz7Pds6CvNVvLcDtRsJCe3Xeypqxfm0kutZFW8I7kHYdqEW2YXKOrXQZ9V6A6pxHJy9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reinitialize metadata for large zone device private folios in
> > zone_device_page_init prior to creating a higher-order zone device
> > private folio. This step is necessary when the folio’s order changes
> > dynamically between zone_device_page_init calls to avoid building a
> > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > must be passed in from the caller because the pgmap stored in the folio
> > page may have been overwritten with a compound head.
> 
> Thanks for fixing, a couple of minor comments below.
> 
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: kvm@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Cc: linux-mm@kvack.org
> > Cc: linux-cxl@vger.kernel.org
> > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> >  include/linux/memremap.h                 |  9 ++++++---
> >  lib/test_hmm.c                           |  4 +++-
> >  mm/memremap.c                            | 20 +++++++++++++++++++-
> >  7 files changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > index e5000bef90f2..7cf9310de0ec 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> >  
> >  	dpage = pfn_to_page(uvmem_pfn);
> >  	dpage->zone_device_data = pvt;
> > -	zone_device_page_init(dpage, 0);
> > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> >  	return dpage;
> >  out_clear:
> >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > index af53e796ea1b..6ada7b4af7c6 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> >  	page = pfn_to_page(pfn);
> >  	svm_range_bo_ref(prange->svm_bo);
> >  	page->zone_device_data = prange->svm_bo;
> > -	zone_device_page_init(page, 0);
> > +	zone_device_page_init(page, page_pgmap(page), 0);
> >  }
> >  
> >  static void
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 03ee39a761a4..c497726b0147 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >  					struct drm_pagemap_zdd *zdd)
> >  {
> >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > -	zone_device_page_init(page, 0);
> > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > index 58071652679d..3d8031296eed 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> >  			order = ilog2(DMEM_CHUNK_NPAGES);
> >  	}
> >  
> > -	zone_device_folio_init(folio, order);
> > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> >  	return page;
> >  }
> >  
> > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > index 713ec0435b48..e3c2ccf872a8 100644
> > --- a/include/linux/memremap.h
> > +++ b/include/linux/memremap.h
> > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> >  }
> >  
> >  #ifdef CONFIG_ZONE_DEVICE
> > -void zone_device_page_init(struct page *page, unsigned int order);
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order);
> >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >  void memunmap_pages(struct dev_pagemap *pgmap);
> >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >  
> >  unsigned long memremap_compat_align(void);
> >  
> > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > +static inline void zone_device_folio_init(struct folio *folio,
> > +					  struct dev_pagemap *pgmap,
> > +					  unsigned int order)
> >  {
> > -	zone_device_page_init(&folio->page, order);
> > +	zone_device_page_init(&folio->page, pgmap, order);
> >  	if (order)
> >  		folio_set_large_rmappable(folio);
> >  }
> > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > index 8af169d3873a..455a6862ae50 100644
> > --- a/lib/test_hmm.c
> > +++ b/lib/test_hmm.c
> > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> >  			goto error;
> >  	}
> >  
> > -	zone_device_folio_init(page_folio(dpage), order);
> > +	zone_device_folio_init(page_folio(dpage),
> > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > +			       order);
> >  	dpage->zone_device_data = rpage;
> >  	return dpage;
> >  
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..6f46ab14662b 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> >  	}
> >  }
> >  
> > -void zone_device_page_init(struct page *page, unsigned int order)
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order)
> >  {
> > +	struct page *new_page = page;
> > +	unsigned int i;
> > +
> >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >  
> > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > +		struct folio *new_folio = (struct folio *)new_page;
> > +
> > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> 
> This seems odd to me, mainly due to the "magic" number. Why not just clear
> the flags entirely? Or at least explicitly just clear the flags you care about
> which would remove the need for the comment and  should let you use the proper
> PageFlag functions.
> 

I'm copying this from folio_reset_order [1]. My paranoia about touching
anything related to struct page is high, so I did the same thing
folio_reset_order does here.

[1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075

> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > +#endif
> > +		new_folio->mapping = NULL;
> > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> 
> It would be nice if the FS DAX code actually used this as well. Is there a
> reason that change was dropped from the series?
> 

I don't have a test platform for FS DAX. In prior revisions, I was just
moving existing FS DAX code to a helper, which I felt confident about.

This revision is slightly different, and I don't feel comfortable
modifying FS DAX code without a test platform. I agree we should update
FS DAX, but that should be done in a follow-up with coordinated testing.

Matt 

> > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > +	}
> > +
> >  	/*
> >  	 * Drivers shouldn't be allocating pages after calling
> >  	 * memunmap_pages().
> > -- 
> > 2.43.0
> > 

