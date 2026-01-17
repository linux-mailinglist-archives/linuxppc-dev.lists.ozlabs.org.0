Return-Path: <linuxppc-dev+bounces-15933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F9D38C78
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 06:27:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtQGX2mnGz309P;
	Sat, 17 Jan 2026 16:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768627668;
	cv=fail; b=UkBEsitytu7A8V7ur3x6zlXpsE7Kit+22OnWBi58+ojaoehCnQOQkYQkxos+g3A0I0LN/U41IO7qoPdKUcAsuF1e1SMf6lfTw12yLReHdAH37QFv3+dgOpSJfdgA1ZLd6N6xnUCiwHqTmIY5+ZVlzfcArr/T2kRdtVXWHSGAXEO6FgAtI+OTqrZIKc3eQkqiHe+imav4e1IbaBPikqdVRwEylpNy1+zjNJdWlCjVQTKCz+XrXqsE6bvOV6BNZ3VW3NTmysTJE0xi9lOHdzFzikIFACIT4uPZ085NEkEi42yODFSxaRY8uAc+nZJZnfxsY5pnomMCJNJ5dYyVqm7SbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768627668; c=relaxed/relaxed;
	bh=tAp9IivUAff1PGBcGTGRA+y67Z1HLPFVlP9rHij12HQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZd5jSmNXH8npxedPA6uRNnK35rshokblce0L/HjybDGD+v/Oqohs2inD/UiV2Gq0e6rUvwWluYokpjo9IyJW6bmqhbZbf2YAKrvUnhlGqzqILkFYtK7dPVYmW85973qGuRffxYY2SILEEQSgEM7B8F62JphaWbSgSzmnaUXiwAzgwKnJOcc/UZ1K5CTA77rIohqLLva9x4Yg1SwX3BO2ina20BD9iI21/mfThnlAYJ/R4L7CBYDnEpdusoxqYcOoZ3icYDZDda4GBdEuPBWQ0/6ELAsVrO1f/PnFS6D+FaJC4uYSs802QfESHRbNX1jmKgEmBQ6FkkZuTGcB8MVDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKW+DyUl; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKW+DyUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtQGT4jZrz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 16:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768627666; x=1800163666;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wY2zJgjNis7aty7bmKzsCTkgtavG9RsMmfRYXkP1/P8=;
  b=lKW+DyUlE+cg3uL/KEoMWpgYpKa0/zU4yeSGjbZ5faRIJ/sSDDt+BVg6
   cz4jhuHHzSaVu/QfjMOD94T5tiwvhm2Cefs/CgOgoZ1DsAg00lJMjhcnS
   ar6rZBXiOGRFLS5SCuUTBhKPLj9HwDOwguqetn02tsA9yjao4BjqcomS8
   bSzb9GBaH60C4m/Hpxt9nDTbRE0QdJdvnL3xceO9pI2MxW+DXKzUwWjOk
   51ajBM3gNkYAbhT6ZYpVEffZI4gnA+xc4EJ4Mi8sl/b0hqgjvJreP31e3
   objGxdtQOFsXku12lJOqlAat96eJ1b3lfWwGWYI5vSN85ZiNzh4tc9SEM
   Q==;
X-CSE-ConnectionGUID: HAaQVln4QPCAbsW6B+1Aog==
X-CSE-MsgGUID: tsukbfmTT+O2m0ua/4h6cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="72523688"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="72523688"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 21:27:40 -0800
X-CSE-ConnectionGUID: ub+/TZwITfWQHrqtrSTsuA==
X-CSE-MsgGUID: z/XgN/NPSxqshZbPRvNavQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="204650111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 21:27:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 21:27:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 21:27:39 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 21:27:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUnpljZ9tMJubehw0uItvBIxabTW7ZpLNGKJKd1H5QNCrK9wkpioOfQHVgVpLBzz0UVRXd/Az3r0PNGfY6R2MObkrG7XcQyV2KQBuEBDmopKEH+zrzarTjCdRxJ3Jf9BbaSolItplgs+8NcGjY3khSSGCM5WOHECSkeZW8i0Mh/oINqkAFGwSXZp2MUaDeXsjEvNzteYkRUM1QH0A5r+0V2XsNrUK040e3gW4kMC1qnJ75yPvs9tKDBhNL5yG+GLt8/v7ID5ixo5SLkQs/43ckRg1bECBiVkzhZcbqyJg3Cbo6P0+ekbJjt/0kLLp2TYjwyOvCAxjHIGBl3moGljug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAp9IivUAff1PGBcGTGRA+y67Z1HLPFVlP9rHij12HQ=;
 b=wAvEgOUuVvHdMxh7CoJnjTewX/MZiNglCpfvGf+Ldwpk+4tgC6+wHOlt+QGfP8DciulKqbakf93NN3YgqtCOMh7ivTIVerCfhLVKVtKOiUV3jbRMjcuUDo04cIJwBN8De9KqdiTaUqv+mi0vqrg3hghDZSGc5jiZdGAr57mLjQFbLSKC1xQO3PIjuMpxVUlIEw4IrvfpW/frdcIsyS2XQZA04waewtZKpQSKoVBDGIF9WSbl6wb1avQib5UoREnk4JF2wSY0anEo4S32N5Ka+AMsl+WaGtspilLXdckHE/nx4VeK93fMDedFcZ7gk1fkXJnDOn0KkTqNF3TxAxE+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 05:27:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Sat, 17 Jan 2026
 05:27:30 +0000
Date: Fri, 16 Jan 2026 21:27:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
	<ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>, adhavan Srinivasan
	<maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
	<mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
	<alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: c60c5741-db25-4258-ea4e-08de55891c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWEyd081ZmxBQVp0QVVnKzlsTU5QeXpySjdpdXBMRlp3T0ZaV0xwdjdKSWs0?=
 =?utf-8?B?Z2QyZXM1bHJnRk9RVDJmNjc3S0doWlc3L3RWbnIzd3FWWndweFJPcUZleFd4?=
 =?utf-8?B?akk1ZUFWSVYyVmU1OERaeG1EZitqaTAvM01Qa0d4N00rbTE1eUYrUENvYS84?=
 =?utf-8?B?UDdrTWN4MWZhRnl0cUx3LzdVSEVHSG44OTYvT3JPUzlDeno0cGs0SmF0ZnZy?=
 =?utf-8?B?SUdyeUZucnU4cm1SdFZjRHZyb28vdk5RWE52UlU2MmZxM29SN0RDTC9KVXVG?=
 =?utf-8?B?THROTWNsSGI2UFNUbHZqWWdxTjU1dVVyenVUWFEzbjluN1BvZ2JYdTRLMlFj?=
 =?utf-8?B?MFdJOE5XWnNYNm9YbVFrenNyckdCSVNxQ0svNmtZbDQ3R1BEbjBEZE5wS0dV?=
 =?utf-8?B?RlVJaGlmb1NieFBGUVZNS2NBNURGUitpMjBESXhPSDExWnRvTDRKd0tGVjRr?=
 =?utf-8?B?WW9HdjdzZGo1VWUyZFozcTc2d3Zaam1jVzl1aVdxV1BUa2dnMTlKUmh5WS94?=
 =?utf-8?B?MW84SDdUQlJaakRKZ2o2VTlkcmFmVGh5SGdMWk5pd1QxOC9pNlpvMHd3TVVq?=
 =?utf-8?B?L2JrSC9WNHMrdEVwOFd1czNLc202RnRnZ29ObGhRSUZOQUxTMnNYZmlPWFZy?=
 =?utf-8?B?UE83bWtJdzZ6Uk1PZ1AxY2ZURzRXUFpyWGZ0WnR2SXBVQWE1NjZkMU5IOHZN?=
 =?utf-8?B?bG83d3lRN1lYL2lRaitrNlJMNjRFRmRNeXE5K2U5a0RTR2p5N3NkZ01xR0Zl?=
 =?utf-8?B?S1AyYVR5UHdYUmJZNW9NMUt1SlJCcEtRYXFjUVZOdmkvZXlOZ1VySDdlWHcv?=
 =?utf-8?B?WGF5c0VTdmZPOTJZVUpQYisraTI5WVc0clpPTW5VazMyVk1CQXdsdi8rdENm?=
 =?utf-8?B?T1cxc2VvV3NSZDdhK25mZVpBSGZjTkFPcXJiYUVPb05hT284WndjcEl6M2t2?=
 =?utf-8?B?Lzl2N21EYWJrUFMvTlROczNUTzRRRi9BOW0vMGx3ZWliRmdyTVF2dWQxU29B?=
 =?utf-8?B?Yzc0RlRYenFvTkxicTkyWGhxYWVHQ0dvRTN4VllmR1p1cm8yVzJCSW1Nci85?=
 =?utf-8?B?cWVzNFhuTDVmY1dPTHozWDdwTGdXazhoT3dQSjFsOFNvRGdVbzBJZVF4UEw3?=
 =?utf-8?B?bFZvdHEvQVUvTWUzaFRhdHA4bGZtei9ldDZpTEQ2Uy9DeFNMMHBrYVcyaTZ6?=
 =?utf-8?B?R0pzSS9obytYMWgxcHBNcGFYdS82ZWh6VENJaFUxNUl5VlFFZHZNTno3TENh?=
 =?utf-8?B?TXlYd0NJQThzVWU2WUhlcmNOZDkzaVFBQWhmM3RmVGxmZEdoZVh1SlpXaVYw?=
 =?utf-8?B?YmtERWhYS1pmbHVpditSZVZIa2t1bGlrL09TMms2Q09JMjAxYjVQRllIOUoz?=
 =?utf-8?B?N2VzdnByNE1rc09vY0VEWnkzTnZBeGtWcjR6QWFQM2hlNFZRajIzR01SWjRm?=
 =?utf-8?B?NWtFdXRZRE81ZWZ3ZlJZU1dOcEFlcUVsMDgzRWo0S3dtTWtjL3RKRWFha2E3?=
 =?utf-8?B?ZGloRC94SUZXTnJTbml3MnZFNEtzcncwSTdNeGYyYXVwUFZLb3lmcStmT3Jx?=
 =?utf-8?B?S1FidXRLNzdNb3hpTHZrVllxOEdvSGJicmk2RitsWDkwb2g5UUdFaXh1SUND?=
 =?utf-8?B?ZDQvNmdITUJ0T05QYmwwN1MxUTFEK2JYUFZlbUhFUTVPcGNJbjFxY09CTUla?=
 =?utf-8?B?eDFqOXFmREVMb2EyekUyWnVZbnFncURnVWM0cytieGpZTUhlQlZCdDJaV1Fo?=
 =?utf-8?B?SFExK2tWZ3RsTmRoRm8yQ2g4VTd3Z3hkRWJBbEV3L0N6VUt0MVAvc2tzUEt0?=
 =?utf-8?B?M1gzeHNHdFJVb3hGRTlVL0QrT3pyZ3N5dTBxVkJJVjRFV1JIMGoxOGgwaWZK?=
 =?utf-8?B?RDdtVWxzcnlKdDJtZjlvUmd0OTBsanlBV0FCRWVRMll3RHlYRWVXMVpDdTB2?=
 =?utf-8?B?M2FFb0xYcGZCTDBGYXJJbWE4N2JBMFRJUEprbm1FSnRhbTVPdjJORzdPb05R?=
 =?utf-8?B?Umx0clRza2FNQWlaSTRBMXE4Wjdza3NkaGdTdEhXeFhOaWFsQmorRDI0Y3k3?=
 =?utf-8?B?em5kKzZsVU0xdERvMHF1TW0zUXloZW9tbVRqSnBTRkI1VWxERzF4L2luaVds?=
 =?utf-8?Q?QaBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3FvUHNOWXhtOFY5SWY5THd0UDBpbmxJNktLem5YSDF0SlM5bVBJWkZCdnUw?=
 =?utf-8?B?a05yTXg2Mkw1VVNiR1ZoS0hPcmtWVUltQzJsekhJZEhNdGl0azQ4b2cwMytK?=
 =?utf-8?B?bWd6SEZBaEF0cWFSVzFwWGU1TVdQekRoa1ZPek9Dcit3dVNFK2UrQTJOWWw2?=
 =?utf-8?B?eGE4SGIvaTJERmNEN2xBWk85L1RvczRGUlNXOTdXKzBOemdnUVFvelRma2dY?=
 =?utf-8?B?aHA5VmVaRHFkdytmYnJuc0YxRGZ0V3U4VStPVHA5dy8vSmVuMFVqc01kQ2ZX?=
 =?utf-8?B?QVpnNklXZUVrUy9DMDhGMk9LM3Jza0I4Tnk4M2VjL3RuQVNhaXJSVjZPU2Fa?=
 =?utf-8?B?VXdCbUFjSzZ1S3cxT1ZuTnNQb0lreXJmejNwelVpWmNCMG10cW5ZRnNsaWZB?=
 =?utf-8?B?M3RuK1d1eWMrRW9WcGN2TlZVZXZoc2ltcGhUTlhxTktwdGNqVDZEbUYvcXlh?=
 =?utf-8?B?Rzl2RktiNTBJTXRVcnRPSjNwUjVXSzZaNFlFK1FuN0xrSFM0N0pNTGM5U2JM?=
 =?utf-8?B?UktxcEdDdUJjWi9zR1ZPS2ZqMXp1Nk9XVkRSZkpsdlRSTEZRV0Z1VWdoNzhw?=
 =?utf-8?B?VVArUEkvbzZ0YTlmR0p4K2U4RHZLMDhRNFJHTEZPeDk3cmIxUnRCaUFmNTIy?=
 =?utf-8?B?YVV2NEJJSFJtU1FxcGprbkliNEFyWUVmRGNqTHZiWFZZbmYxNmdlZU9EbjNV?=
 =?utf-8?B?cG1hV0dEMnNCdkw1QjhFYjVybGcrbHhld1ZYNnFoMDZPTS9oMWVON2FSL3ht?=
 =?utf-8?B?L1ZNa0pWc0hwYmhNcDdNbSsyWVVqQ2p0QlhVSVQvVFRialBJMXUxcmRraDVu?=
 =?utf-8?B?NjBuRkY3RmpUTmFFVFhaMGprMWZoS2dueFVLQk5jNENrVnY4NmpDb0FJY1hB?=
 =?utf-8?B?SUZML2FoVjRDbzRSRnIrQVJGbU1KSUZXVy9HN0pwZWM3K1VMeitRNDlMaHJH?=
 =?utf-8?B?cVp0ODRsWWxmbnpWNjVOcjZqNHVEVlhqT1p2TjlNWWtDcnFjYkRXcnVHZUx5?=
 =?utf-8?B?d2NTRkdhZjBPQzVIcDVoVEo0TmMrc0hESWt5NmZYZ21TVHRhUHB0aERqVTNM?=
 =?utf-8?B?MnNNT2IwbWNlRFI1Y1cxYVJ1WmZYSitia1FBUDdyQ3BHS1QvT2h3ME5WeTlZ?=
 =?utf-8?B?MjJBZHZYYk03M2Q3N0Z1bWQ2RHZnSHFYdW14RkxsRi9lK2JMZlc3WS9WRVA4?=
 =?utf-8?B?SlUyOGNpNHZrMnpMRm1LT29qWVdmcm4ycGRwaDREQnFrNmNIZmdXeGtWNlhk?=
 =?utf-8?B?T1R3cUMrQzZMWmFRZFIzU0h4NjRBU3FzMlRtampQVTdqTW1xaGlDdXVnYVhD?=
 =?utf-8?B?RWNTRGpYWi9LVUM2NldUaGMxTGxmZWRHSVJ4Q2o3UzluSzkrTlVKQVRETk8z?=
 =?utf-8?B?cmNDeDlnMmxMWWJaYm1EczRpNkhkMHFZOWJNWTdBNlNLd0p0bWJLU3BQbkZ2?=
 =?utf-8?B?dlVzUlRpVXFiSGFaUG9VVFdqT09RTDlIUkpnRE1pVmZRNDVjdXF5WHNMYjN2?=
 =?utf-8?B?dGN1Zkx6RlVqUUE1N2g5LzhKaVdNS1o0clZFVEppVDlocGNIYTJnWC9BeHdk?=
 =?utf-8?B?bGZXUUJwWitxb0Vud3ROb2lrSmhETG5SZjVERE5EYjJoY3M1UEpQUVh4Y2V2?=
 =?utf-8?B?amxMalhBTFBENExjQnBZSDFkSkhYM2xOUS9KRkJIMGp0NjRBVGZQY3k0VHBt?=
 =?utf-8?B?ZnF5OGRzeTJoUkdSc2tlSzdkQjF1M0l2QWxjQnREcjdOa005R2ZVbTRXMlpN?=
 =?utf-8?B?MWFESmVhbjNQQkNSTndDaUxXUjV6cFlDMGc1ZTE2ZENPS1kxUEdFMnpBR25l?=
 =?utf-8?B?U05wcmd5UCt6UnVKQktOMHU0OHRMUVg3ODJBOHZ6M3VkMVhYZ1ZXSUtGQnpy?=
 =?utf-8?B?SzVrQTZZa3ZLaWxsVGs5Mi9BcmE0MkNLOGNxRjM5dzhLZU9sSUIzWEtVbGgr?=
 =?utf-8?B?bW9lUS9xSGRudmhVVzBjTURnaldIaVBKWWowY00yc1RzT09vWTlKWnh6MWpV?=
 =?utf-8?B?TzVNWDlNTXNmNDNkWCsrRGZEb01Va1R4a3dGQU9TOHVRYWtnNE40MjM3aW1S?=
 =?utf-8?B?NEp6VGl4QU04cUxFaU9MZ2JvcnlTZnBZWG5VMEdUOGNsU3A4clNIRFYwYkMy?=
 =?utf-8?B?VkVMejNLV0d6WnNsT1JBNTNxWEZvbGdYTkpYWExpTm95a2Z4SGJlcUY3a0Nw?=
 =?utf-8?B?TXFQc0UxbzdETGt3ZTA5bys0aStleUlhUmY4TURVYXR4Sko1SFdyLzRJY2NJ?=
 =?utf-8?B?SEVhcnhQLy9CTFl5Tlc1UVk4Tm5mM1IrNSt1MzZ6UzU5azFldHArNDgrclFW?=
 =?utf-8?B?UHlKbUdkblFidlZWSUMxLzExaEN4K0xHd0JRTmhaOHZwdFd6NmpLTVJaVjht?=
 =?utf-8?Q?Zd7j+7oF5V0bze0k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c60c5741-db25-4258-ea4e-08de55891c45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 05:27:30.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbjMoX8sbUexK9+i4dDrSTLbdtkbc4VztoX2c2jffMTlEccbVUThCOHzTkasmVfWHSKayqC55ug1HrhqhlbXaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6609
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jan 17, 2026 at 03:42:16PM +1100, Balbir Singh wrote:
> On 1/17/26 14:55, Matthew Brost wrote:
> > On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
> >> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
> >>>> I suppose we could be getting say an order-9 folio that was previously used
> >>>> as two order-8 folios? And each of them had their _nr_pages in their head
> >>>
> >>> Yes, this is a good example. At this point we have idea what previous
> >>> allocation(s) order(s) were - we could have multiple places in the loop
> >>> where _nr_pages is populated, thus we have to clear this everywhere. 
> >>
> >> Why? The fact you have to use such a crazy expression to even access
> >> _nr_pages strongly says nothing will read it as _nr_pages.
> >>
> >> Explain each thing:
> >>
> >> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> >>
> >> OK, the tail page flags need to be set right, and prep_compound_page()
> >> called later depends on them being zero.
> >>
> >> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> >>
> >> Can't see a reason, nothing reads _nr_pages from a random tail
> >> page. _nr_pages is the last 8 bytes of struct page so it overlaps
> >> memcg_data, which is also not supposed to be read from a tail page?
> >>
> >> 		new_folio->mapping = NULL;
> >>
> >> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;
> >>
> >> 		new_folio->pgmap = pgmap;	/* Also clear compound head */
> >>
> >> Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);
> >>
> >> 		new_folio->share = 0;   /* fsdax only, unused for device private */
> >>
> >> Not sure, certainly share isn't read from a tail page..
> >>
> >>>>> Why can't this use the normal helpers, like memmap_init_compound()?
> >>>>>
> >>>>>  struct folio *new_folio = page
> >>>>>
> >>>>>  /* First 4 tail pages are part of struct folio */
> >>>>>  for (i = 4; i < (1UL << order); i++) {
> >>>>>      prep_compound_tail(..)
> >>>>>  }
> >>>>>
> >>>>>  prep_comound_head(page, order)
> >>>>>  new_folio->_nr_pages = 0
> >>>>>
> >>>>> ??
> >>>
> >>> I've beat this to death with Alistair, normal helpers do not work here.
> >>
> >> What do you mean? It already calls prep_compound_page()! The issue
> >> seems to be that prep_compound_page() makes assumptions about what
> >> values are in flags already?
> >>
> >> So how about move that page flags mask logic into
> >> prep_compound_tail()? I think that would help Vlastimil's
> >> concern. That function is already touching most of the cache line so
> >> an extra word shouldn't make a performance difference.
> >>
> >>> An order zero allocation could have _nr_pages set in its page,
> >>> new_folio->_nr_pages is page + 1 memory.
> >>
> >> An order zero allocation does not have _nr_pages because it is in page
> >> +1 memory that doesn't exist.
> >>
> >> An order zero allocation might have memcg_data in the same slot, does
> >> it need zeroing? If so why not add that to prep_compound_head() ?
> >>
> >> Also, prep_compound_head() handles order 0 too:
> >>
> >> 	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
> >> 		atomic_set(&folio->_pincount, 0);
> >> 		atomic_set(&folio->_entire_mapcount, -1);
> >> 	}
> >> 	if (order > 1)
> >> 		INIT_LIST_HEAD(&folio->_deferred_list);
> >>
> >> So some of the problem here looks to be not calling it:
> >>
> >> 	if (order)
> >> 		prep_compound_page(page, order);
> >>
> >> So, remove that if ? Also shouldn't it be moved above the
> >> set_page_count/lock_page ?
> >>
> > 
> > I'm not addressing each comment, some might be valid, others are not.
> > 
> > Ok, can I rework this in a follow-up - I will commit to that? Anything
> > we touch here is extremely sensitive to failures - Intel is the primary
> > test vector for any modification to device pages for what I can tell.
> > 
> > The fact is that large device pages do not really work without this
> > patch, or prior revs. I’ve spent a lot of time getting large device
> > pages stable — both here and in the initial series, commiting to help in
> > follow on series touch SVM related things.
> > 
> 
> Matthew, I feel your frustration and appreciate your help.
> For the current state of 6.19, your changes work for me, I added a
> Reviewed-by to the patch. It affects a small number of drivers and makes
> them work for zone device folios. I am happy to maintain the changes
> sent out as a part of zone_device_page_init()
> 

+1

> We can rework the details in a follow up series, there are many ideas
> and ways of doing this (Jason, Alistair, Zi have good ideas as well).
> 

I agree we can rework this in a follow-up — the core MM is hard, and for
valid reasons, but we can all work together on cleaning it up.

Matt

> > I’m going to miss my merge window with this (RB’d) patch blocked for
> > large device pages. Expect my commitment to helping other vendors to
> > drop if this happens. I’ll maybe just say: that doesn’t work in my CI,
> > try again.
> > 
> > Or perhaps we just revert large device pages in 6.19 if we can't get a
> > consensus here as we shouldn't ship a non-functional kernel.
> > 
> > Matt
> > 
> >> Jason
> 

