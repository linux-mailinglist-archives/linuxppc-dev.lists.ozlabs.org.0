Return-Path: <linuxppc-dev+bounces-15931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7072D38C00
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 04:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtNF13cfcz309P;
	Sat, 17 Jan 2026 14:56:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768622181;
	cv=fail; b=KCwIRqM7HWuXWlU6bN2DOBOsldYs+lhoVI5ufBwnjbFEpqU8nqZAZX9wIDVVxVaC5oSfECMCjUvMK+yjn64vVODm03/rlw/m3jZ99u5PQ2VeF7jZI6NRsOfgm+V4C3XTuOOZ6BY/7L7roiDws3oVlcWS1+QiXLK2ZlIPMNe8mi59O39MzZgr1/L2uhc4ZYT9G5fU7bbvyUUH1Tb7NTe1ID4yzHavwWQLwVNEx3Po1E+UI8FPR1+lKrc0GRC7naAna1VehkE6HB1HIWUAy75azwafBk4LpejNTt7zdCxSm0Zf8Mk4eaPz8LsbLAMzWDg240OSQP0y4eRK2P6jFXhs0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768622181; c=relaxed/relaxed;
	bh=gi1mmy0FMdw+wL+no/4kQWWdDfMyftFA7KvgghxqqTs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NNlFM3gj2ziOLb39ZyMiu80lFZcrlMswXBpZrA8WwsHMUIgrbFMIdoMLutXBWB33mVFVGAiGv8Q8KOwxasyiZKdINHzd74ec/HPjwsVFU4VKDVn90BWVPnvOUgL+01zkGWaMcTJMI8/BRLVHVLZtD/h5VOd8nGki0Up//eGPvFx3DhpA4P9TqR7iWwn/sO5wliaDun7rRup7XHvWN82kdci+6SSOrh2JX+GTaQMO8/Diy/vriTMJ5t0c1lGTx2woVHAJ/dzL5Q4Ofewvla9LTCtmye0OayljGKSfGGkVR9QI0vx2XHM+V25/dsA0gA2cTuIVvpWb7nhPebHQj9d3BA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PTvUKCt6; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PTvUKCt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtNDz1CBQz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 14:56:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768622179; x=1800158179;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=D3li7GO18rFL5TEXF/6ABW2ZpRWsh4PTRTGFC0VysPM=;
  b=PTvUKCt6LueV1rutF3yyG8BDUkQLSTvjQ8gpTg5xu6WTrjwFSsRS4MpJ
   WZph5ISMP81SZk3H9+M71hBs9zNfMYYR1LqJLmGmw+HlEISzdZaMaqX1f
   aXH3l2QLzTFlj8sE8VnN2HEigrw5foHDdKGxR1lptAM/muZPBN91VIwEg
   PINmDkWHWS0fM46ePgzOhjSuOcKzcl9naOtIYnvM7BP3GaGTt5nDphrzh
   Rt12jEN0Mipi5o35PcKarWv4ZvDbWpgJOtWlaLw1H6etwBA6d3X3tBEVN
   y+yFxgkm9Cq3wMZOpf56yR1W6+TBZCApA8HfZKJzYsby6u2sMIdkOu0J0
   A==;
X-CSE-ConnectionGUID: ifU0gUOgTPWuPVrEsFPOJA==
X-CSE-MsgGUID: gcooWgagSkSZidhQAVFY4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="70019083"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="70019083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:56:14 -0800
X-CSE-ConnectionGUID: RxZwMw/JRluZQn2Yuiko3w==
X-CSE-MsgGUID: gViun4ZFRXymboR/fNh4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205456569"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:56:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 19:56:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 19:56:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 19:56:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZqVRaTzVpzRRmtsLMG59jEGygu+ydiQCNtx/rzeCWzH2kt3pzs7Q16LDAnIsZg1T2de6Fe5CdUi5TQ8aiQHIHVpYLVw5xU+Z6tOZS6bC+3olnJIq9TY56ieygZA/XlL1HKrzcaKi3YP8YWoAaixWn/LSOKSwV6h6oKFZiDipJax7PBDYmRN/ZJBnf2CX3UA4o3p2tQMYbVFL+zB8AbVQreDh3yQtT1vtbv8X0lqod3aT0+2mbz5Wz1ZrPGEh23FV9uCtFq+MEONcYHIGVJ8JRjIEHO0WIsZver7zuhsb61Vu+rBgl/XKRL32ULeaU5QKF+AalQg5VaI1sq6nsEfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi1mmy0FMdw+wL+no/4kQWWdDfMyftFA7KvgghxqqTs=;
 b=k52U9e8p0FKC4Kb0wx9sSo/ohb2N4y4H/rGyT6jqwk92+kkIa5yf1X3mFgAAITizfvGyWW5zay1f2i6fzlXgf1DBvICSO826eMNo4RtInAqTFkwaGC+rtrnbfRPdhgv2GontI6BKcHTDf0JMkLcpaRIFj6v9dFuU/dSSmiAYQ1pUr+0OESndGExjHu8jOkCKHD0IvmJzNeabMARp/UoCGmLbSoZlLoWxE/1FEgLKnbpoDgpR2YuenNA2rZ5nRva9ZzJHSW39Sg5lrm4jff8M9ahSPFExepkqQDHb6+7uI8InZMt3FQq0xcAZ/sGPNXrk8KwHNFkIAz2f25qXOgKFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 03:56:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Sat, 17 Jan 2026
 03:56:03 +0000
Date: Fri, 16 Jan 2026 19:55:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Vlastimil Babka <vbabka@suse.cz>, Francois Dugast
	<francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, Zi Yan <ziy@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, "Nicholas
 Piggin" <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Balbir
 Singh" <balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260117005114.GC1134360@nvidia.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: d1533163-9761-4370-6668-08de557c557b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0hLazBjeU9MNi9POFoxdUFkK2xWcFovZ3drQWhqUmlUMXdWTE4yeDgyOHND?=
 =?utf-8?B?TWhHR0grSmp2a253SzY5K3orcXNuOUM5YW1MUkxoYXVuWDZicVFTUTBWS3pa?=
 =?utf-8?B?MDA2SjRlOHdPVFFYeGxyTjdDYnZqRmhIcS9WRHhBdEREVUVIdFJ0dzFieEx0?=
 =?utf-8?B?Skg2VmdLOUxTT3VOQ0g5RHR2MGFlWmVzT2d0REdqZ0xJWnkwbTl2K0lEYVNL?=
 =?utf-8?B?alJGRTErOFlQbTJDckJIY2pJbENld3hySW5wclVjcHF6Ym5VRnBCdnVEUHJp?=
 =?utf-8?B?UC8wUFBGMjQ1c1FHbTZnalJwNjkvWm1XK1VaWTBZOWxUUGQzSmJKN1VvcE9H?=
 =?utf-8?B?akRqQm91MlNxdkNkOXFSeXlKekhHNFdDSmZGMk9TWHR0ZEJXN1NORUNpQVZC?=
 =?utf-8?B?bEJlamxxOHA2M2ROcVRVTWxOaVczTXVkTDRXRENxakczTWp4ZndnVEZzck10?=
 =?utf-8?B?RXpJRFJiVUI4eUs4Q0N6dXIvWEdEclg2aEpmMzBacWJDeGZWMzJPY3d1NU1V?=
 =?utf-8?B?cytnbWhVc0ZKODBRUUJsT2hwNlVRU05jUURwOHRjdnNicklvNzZpNDdTZW5o?=
 =?utf-8?B?WkpUSCtFNFQyUTFVUHNLczArZGRaczgzTXZHMjRzeWd1Ky9mRk9taTN0bTdu?=
 =?utf-8?B?VllFN1NBQlFGMnRrR3R4R2QycE4yYUpBWWFaMlNDT25vZU5CTE1qU1Z6Z3VZ?=
 =?utf-8?B?UEw4b0k3WEY5cDFKVjE5OGtCOWo5dzRpa2VoN2tlZWVQZlIzd1JPREdMYTQ0?=
 =?utf-8?B?SWMydTNpZXl6RVl3MlZvY0dzMWJIam1kbnpXaUc1VkJyYkQ0dFpUMFVwSU5M?=
 =?utf-8?B?YjFvcG1lbWF3c3hCZEZaSXJnT2dyU1RvQy9GYXBQR1lMTUJVVGxURThUVk8x?=
 =?utf-8?B?RHJYUkYxMTd1Z1Vrdm9uenIwM1QxY1FUMDd5SEZKbTVXM0ZsWWlRUDlBWUlY?=
 =?utf-8?B?ekRNUmZDVGEzSlZoU1J6eTFZSHZib1Y3Umo2UHJDNFVmemR0ZDBzRFBHWFho?=
 =?utf-8?B?QUhaVkxweGVnNWZxOVArTTRBYUdaNUJIWkM1OG04R3dmc0hzcWtDN0E4bFVZ?=
 =?utf-8?B?K3JpVkNaNEhlOVNQbUNETmNLUVhaSWhVUnloS0lMUm5WYzVIZnMwVlpxM3B4?=
 =?utf-8?B?M1ljWHFUamRMVWh5MkZlb1F1TVV5cDdCQXdiTDdTMjR0dkNhQ0ZiZmxIODBS?=
 =?utf-8?B?ZkdjejhlN3RveUNLRUs3RER1c2w0VlFvVlJ4U3VaRlgzZGczSERoSzcrWkFM?=
 =?utf-8?B?aTFoUmczbWQycTJidFdsQVk0RUwzR29yN2xGQjhybFYrUGozWCt6SmlNd09D?=
 =?utf-8?B?MFNVYWxpaW5ib1ZJa2lQN0VKc0JFYXRHd1VMT0RpSHh4NmkrZjdUdk1qS0J0?=
 =?utf-8?B?NzVhcno5cC91M0dwcjZpNnNSUjVmZ0ZJTlhkWDU2T25jTHIwTzdybjQ1a1Bh?=
 =?utf-8?B?U0tiQjUzcTRSUzk1aStwMlRSZks3QzNMVUtVNmFuSlVwV0RFeDRyR1d1RGE2?=
 =?utf-8?B?ZTJlclljVDZhUGN0SWN3d3luZEEwYmhQVkVaaHg0eUZXUC81VzFBWStZT2xm?=
 =?utf-8?B?dG84bnI5SjR1dzN3ei9QMmhiU2FRckk5MGlMUUpxSExmZVJDRFlScjBSV2E5?=
 =?utf-8?B?bzgyeFdvQVpFZ2ZBVWoxYzA0TUFHU0cyUmdiWVh3a1ArMG9QeG0vQVdubENk?=
 =?utf-8?B?Mzd0YVhWaGZQLzJPaWJJZmtNUEdoSlFHSVFQWTc3akN4ZnIvSXEreUhYNDdM?=
 =?utf-8?B?V3FuUEJGOGhHMUc2eXBtMHB1RElrenUvTjlRbWFRWG9pN2NBS3JicDYwMUw5?=
 =?utf-8?B?QzZlQ3lyNFpRNy9sNGpCbElJUjRSRGU2YlhSeDBLU0x3bkR4dXhZQTdVY1BV?=
 =?utf-8?B?eEo4dlp6NGxlZ0R5bnVqV0FMRDFIZ3ptVFFSMGFhd0Ntd1NlZG41UHNmY1Rp?=
 =?utf-8?B?aDNsRkVVTnlOVENIK0duM2ZBdXFyVVdiUDJGci85V05VMXUwU1RVR0VZV09B?=
 =?utf-8?B?dVdCSVdMaFh2VmdCSDhTUk96SVZMSnFPMWNNYjIyTGZoNkZmLytaT21mOXVR?=
 =?utf-8?B?WVZnSStuUVZ1M081amNJSjRPY3FYRmtoRG56REdjQ3Y3bTN3aUovSlk0OHFv?=
 =?utf-8?Q?2lxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGZ5Ym00TDUyREpsdmV5SnlWOU8wL2lkK0xlL25XMGVzaVp0TEFnalRJVkFu?=
 =?utf-8?B?aEtwREtvVHp1SkFBeEd3cnppOXFwd1N2QTdjbVV5d2FacGV6NUkzeDNOWUtW?=
 =?utf-8?B?T29NWjV2NWpoaGJRKy9vYUt1UTF3cU4rNkw3M3h5bUthNnZMSzliT2s0ZGdt?=
 =?utf-8?B?Q3FMdmdjR3VJamFLZmFubmxmT2U3cEhhVlhLOXJmcXBvUWhkdXMvT2NtZFFE?=
 =?utf-8?B?K2NQbVVjcVE3RlFoMFV1WVdwTXBQTWxJNDVyQk01WTYxMEE0aWlBbXlxT2d3?=
 =?utf-8?B?cEdCMW80N1RwblEwOXRzME40bWhTWUJtTkRBZ0VDTk4wMHVNYTA0bXhVTnRZ?=
 =?utf-8?B?aDMyRVVhWXVzRGhHcDJpS3RtQTdUTEh5OTB5ZlZJZWMvSlcyU3V4TE9CNGZ1?=
 =?utf-8?B?WG41eTF3MWNra1FrZUpCNzh0WW1ITlN5S2Y3SUcrVXU0TjBZVnlwa3NnU01x?=
 =?utf-8?B?eTVaU1dSckR5NHFWd0VsWUdISmN6djNZUzB6eG5OcUlnQ1ZLbWE1eEs0SVpa?=
 =?utf-8?B?NzVDeUdiOEdNMDBRRUtwanM3Qyt0WmhZd1NjM0xSR2ZISlBxcDRCRTg3SG95?=
 =?utf-8?B?blhIeWRyMnA4cjVKdDRwUVM4YUFQd3R1aS9CanVWSElUQXFJdnJKMzlzSjdD?=
 =?utf-8?B?T0Rma0VzSHBGL2NUL0I1Ui9SYzRRK3g3NnBPamdsUWxHZEJIL0RmWHR6eHFw?=
 =?utf-8?B?QjNiV0krMzdvSitXWFVqNk00WWswNWRKWmI2TnppS3crY291aFVYUGhxcWJV?=
 =?utf-8?B?Qlc3TC9DOTI3VFBUVzZzdlBEblZZcXUzTTN1YUNKQkJnZFkxU00wUXAyOWlo?=
 =?utf-8?B?NGxrN2s0UkF5SmNKemtGbzFUK1YzTURpQXhCSFVvVjNZYnZBV24wSGFtRUo0?=
 =?utf-8?B?MzlldnhQTG1VcVJJNzJXdnZ0N2craU51Qk1BcHBQdFpmVk5IWjZVa0dZMnlk?=
 =?utf-8?B?bjhmSU5BdHdFSnlwVHZXMVo5TFJ6N3VpUmo1dUgxNWZxZ3NoNjhMQll6UFhy?=
 =?utf-8?B?TG1JNTRSb3o2ZVJXSml4cWZSS2xJL1FxT1NLaGVrNWVPaFZqVWxvYlI2Z1Nn?=
 =?utf-8?B?MFhUYnVHVHpJbk5nWHcxSG8rTElsZTVDNHFIcngrazZnWXNvY3IzUENNdnRJ?=
 =?utf-8?B?VGcreU5lMlA4c0o5b0NZa1dqV2Z2RmlpMGJsRWlwd1JQQXczTUlMUmVtZllk?=
 =?utf-8?B?QUlQdCtvdGRRRDNqb0RhU3FlemNTcVU2bTVFRnRmSmNMbXJmajg5UDA1REla?=
 =?utf-8?B?N1pjQzN1d0lMK2FuR245WXg0YUcwZkRvY1UycCs4WExnU0t6Z3VaOTRYOCt6?=
 =?utf-8?B?SUpMV1N1L0JoUVdvK2oyTnc3NjNYOXRUeXVBYUtyVENielptaWdvR0xESlFp?=
 =?utf-8?B?SElLWEJmeW9ZZ2VOcEQxQ01xNFZZZUs0SDhYekpFNVhoaGYrQ2R5N29zak0y?=
 =?utf-8?B?WnR1em94Ym0xbDg5NXlEMlhnUVZDOUJ2Z1JXMVpYNVNXcDVJRUd0aVl1ckRx?=
 =?utf-8?B?UjNZVm9iUjBUbmpCT3pMdHJrTFBFcUkvU3dKREQ1UlRDdnV3bzRwcTV2dllV?=
 =?utf-8?B?Z2g5Y1pmbWlEMUNRZ0kyVlFwM1pCdndpSENzQzIxV1g0VjNvY2FrdGx6bXJ0?=
 =?utf-8?B?OU1MN2J5Y0hGVkM4bjQrNGoreFN2TW9Kb0Y3OGxEeWp1MDdYTjZtRENYL2ZK?=
 =?utf-8?B?REM3Z2dHdTJQTHRXVWltUUd0bGlIY25mTnN5OThLQUJTZE4vTDI0NFQ3T01G?=
 =?utf-8?B?U29HRzVETDB1SmUrNUh3V3Z3YWs2b0xTMlJkYXhBdHFDdG1XdEZaOHFQMC9i?=
 =?utf-8?B?cVV0K2dxUHBBVUdmUDRkTHRFNHB2VkdvYzF0M3NxeXhkZ2lCQWZubFpqZ3Na?=
 =?utf-8?B?WFExVGYvSEFabktJNG0xSk82MmswM1J5V2VpRExWVnIzdTZ3VFZoQnlOR01H?=
 =?utf-8?B?VE9zeWZqY0lBNUY2WTkrUU9KaXNFVGVpckQzRHM3bEJDZzM3dVJabXhBVWww?=
 =?utf-8?B?Y2piYWRwTEt4TmFDM1hzY2Jsa0JYb2NpSERVdUM3d2REdVBYc1N3UHR5dnJE?=
 =?utf-8?B?a1JtalhEMnhoMU1EazVxQVFEazJUQU92OVI3c0JoWjN1c2xSOUtNVGl5czRQ?=
 =?utf-8?B?bEdVVm4xbG9KVzFkM2NOOEk5eS9OL292TGRlSE5ySXJwS1pLMW03TlkxdW1m?=
 =?utf-8?B?WGNyVHRMdTFseU9XeDFtUUl0VVo4WkFLdzFucTRuRU44czhLN3pkd0VSY0gw?=
 =?utf-8?B?MzNNWGlkV2JoM2d0NzY5bUlWclNDSmFmYW5rVWtoamtFL29hVmZwT3V1R0Qy?=
 =?utf-8?B?VFdRZWlXd0tKVkFKTGNxTFVtRjJ6UFQxNksrUFR6Um1Wd3l3R3Z5ZWdHSjBQ?=
 =?utf-8?Q?vZcKoA24R7jH3/0o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1533163-9761-4370-6668-08de557c557b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 03:56:03.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxymx/dQOOKMp/54ZtX+PHrQlNcmsd79MBg2p/92OAwU2UdkyRjrYVi14RA3ZerQaoe89LCvz/V3/XbqrZFX+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
> > > I suppose we could be getting say an order-9 folio that was previously used
> > > as two order-8 folios? And each of them had their _nr_pages in their head
> > 
> > Yes, this is a good example. At this point we have idea what previous
> > allocation(s) order(s) were - we could have multiple places in the loop
> > where _nr_pages is populated, thus we have to clear this everywhere. 
> 
> Why? The fact you have to use such a crazy expression to even access
> _nr_pages strongly says nothing will read it as _nr_pages.
> 
> Explain each thing:
> 
> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> 
> OK, the tail page flags need to be set right, and prep_compound_page()
> called later depends on them being zero.
> 
> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> 
> Can't see a reason, nothing reads _nr_pages from a random tail
> page. _nr_pages is the last 8 bytes of struct page so it overlaps
> memcg_data, which is also not supposed to be read from a tail page?
> 
> 		new_folio->mapping = NULL;
> 
> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;
> 
> 		new_folio->pgmap = pgmap;	/* Also clear compound head */
> 
> Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);
> 
> 		new_folio->share = 0;   /* fsdax only, unused for device private */
> 
> Not sure, certainly share isn't read from a tail page..
> 
> > > > Why can't this use the normal helpers, like memmap_init_compound()?
> > > > 
> > > >  struct folio *new_folio = page
> > > > 
> > > >  /* First 4 tail pages are part of struct folio */
> > > >  for (i = 4; i < (1UL << order); i++) {
> > > >      prep_compound_tail(..)
> > > >  }
> > > > 
> > > >  prep_comound_head(page, order)
> > > >  new_folio->_nr_pages = 0
> > > > 
> > > > ??
> > 
> > I've beat this to death with Alistair, normal helpers do not work here.
> 
> What do you mean? It already calls prep_compound_page()! The issue
> seems to be that prep_compound_page() makes assumptions about what
> values are in flags already?
> 
> So how about move that page flags mask logic into
> prep_compound_tail()? I think that would help Vlastimil's
> concern. That function is already touching most of the cache line so
> an extra word shouldn't make a performance difference.
> 
> > An order zero allocation could have _nr_pages set in its page,
> > new_folio->_nr_pages is page + 1 memory.
> 
> An order zero allocation does not have _nr_pages because it is in page
> +1 memory that doesn't exist.
> 
> An order zero allocation might have memcg_data in the same slot, does
> it need zeroing? If so why not add that to prep_compound_head() ?
> 
> Also, prep_compound_head() handles order 0 too:
> 
> 	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
> 		atomic_set(&folio->_pincount, 0);
> 		atomic_set(&folio->_entire_mapcount, -1);
> 	}
> 	if (order > 1)
> 		INIT_LIST_HEAD(&folio->_deferred_list);
> 
> So some of the problem here looks to be not calling it:
> 
> 	if (order)
> 		prep_compound_page(page, order);
> 
> So, remove that if ? Also shouldn't it be moved above the
> set_page_count/lock_page ?
> 

I'm not addressing each comment, some might be valid, others are not.

Ok, can I rework this in a follow-up - I will commit to that? Anything
we touch here is extremely sensitive to failures - Intel is the primary
test vector for any modification to device pages for what I can tell.

The fact is that large device pages do not really work without this
patch, or prior revs. I’ve spent a lot of time getting large device
pages stable — both here and in the initial series, commiting to help in
follow on series touch SVM related things.

I’m going to miss my merge window with this (RB’d) patch blocked for
large device pages. Expect my commitment to helping other vendors to
drop if this happens. I’ll maybe just say: that doesn’t work in my CI,
try again.

Or perhaps we just revert large device pages in 6.19 if we can't get a
consensus here as we shouldn't ship a non-functional kernel.

Matt

> Jason

