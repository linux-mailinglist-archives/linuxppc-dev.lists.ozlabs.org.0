Return-Path: <linuxppc-dev+bounces-15879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202BD2C9D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 07:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsqr85WLRz2xSN;
	Fri, 16 Jan 2026 17:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768545384;
	cv=fail; b=mRO8jhMjRk83mPl4yfWds3Q7wwzRtTOUcC9ivBH7Qv+qjhwPxl8vKQQTr+S2iXmbT7lYFF/e5YbBvfy2ldHhaDEQnT/VqNb5+oN97B2JBkRrmypOuRkXxhorKjNiZGqb+JdpZ8P297hf6/LxP6I0NRGXz62c+xulitiBvvLQHprV4QKA8cMIqgGFLJ5cTOEMrsa6Ee+sjIp/+9pkoF17LFPz39KXcXbs+j4BWj0GiMd7Gvtx6/HimYtq67eiarvLSspuPyih2Ev93dHCa3u+nr3E7aYRF6cO1mwTxhNbuqPp8tGECd7bKCnJpyIwfMmN/1L/rXqZIguJEAQ8Jmrolw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768545384; c=relaxed/relaxed;
	bh=kdSUlmX+2T2HCaBJoDWUYG69tf2ofwB305bn7puP47U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZeHkv0uCt6tOaeaJw+LNgHyynB9yn+WY03SzuSh7dr/MLJveteHUa3CxvsfZWjxxOk+/CEAxM4sKUaGa83b23i53sOTDfkP33qFNybQIBxgUi8rpL79KGLb3b2rB3QwGLmIL/PyMHKLNFwgDniRn/ZeoA7x/Gu7UGAk+YfBXQWHMAI4VAr1TPKjgXgBUQf7VpO3LM14Gn4SEYZv8ZNvLBRuoW4cep5hm+ET+QPXBy9l+ujj1at7o9mwBDz+nisWjAsxBCFYc28o+XzVPHVjSAuNXuj9xbMIoxhiYGqyurrg57zQtvGYLbjfgZdOuj2YnaGKuJIqlkrVCQX4gFJ3QUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m477RKIF; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m477RKIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsqr53N6Wz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 17:36:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768545382; x=1800081382;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JFzvPMG+JHEOWSr1B3MkgGrP4mBqmcQdC+OfIX9ElpU=;
  b=m477RKIFhcE6dh8Rk2XqWSBi4pHR5ZfiJ1L+DhyA+YbRXcT/saar905I
   QVcJ6bCntB1/XgXyp2+DGZBLKHC1xzi+cENK50/nJO+DCsEHV5aIi/XR7
   3byX4nfiss2tzLqDwJi5X7WBc98oaGJeKBD+2ElsoZvEWx4st8TAEOmSP
   OkbH9fQQjIj5wrFeqvXwaiyPB4VJx1vspqWVEiIVhoBmufNyG/RPgkqO+
   AI/SpL4k9mpX65LD9wOHHAqn/dg/O+KkGfvbGN71ecE8h1qAHL0NVDt4X
   89OGC+yK+knxJzxq5GXFhX0iMGUrDF+E6rlYWkarqW+kCFJ7sjVrg9coV
   w==;
X-CSE-ConnectionGUID: /5k6oOCxTSqEIRV7Dmajdw==
X-CSE-MsgGUID: kjFizRkESziuQii5ECex+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87276454"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87276454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:36:17 -0800
X-CSE-ConnectionGUID: e6F4Uv89QrWorZ3c09TCLQ==
X-CSE-MsgGUID: veAwUEA3QWm2Dj3TTo1yIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204956619"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:36:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 22:36:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 22:36:15 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 22:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tsiw4xATlYuNzjzlz3VZt9KsDu2bM3qmOw+B5xfmsGf4hl9Fnsis9dmGH2/Q9JuO2DjINSPp+vO91gl9soV5vzYaBRG2YS4Wkp+wiWLUrxu2lxnTKxDe7KNmZx3c6fJOlmBz6o9eK5MGhneOhFKgP2YjXXK7YlOyau7F22TUPXBsFHeG38VTizT2P5fxhRnXQPoP9YZvfS8kBDdmqfEfoTuSmyLXqnSwFM4NQ+5clgFVN9mgEv1NJgyZNf929c7wHWa+RleEjCIGFjQd0hCGLukFyp0J5u2b4uJM6GeRSoLysMY6PnKSgO5IMyKf60Rul5P1Y0QiTdo3n9YtXy6H7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdSUlmX+2T2HCaBJoDWUYG69tf2ofwB305bn7puP47U=;
 b=tR6VoqtoS+TpUBCez5dm4BfNyarjEPD8bZg8C1aAjpH/O4oaEEtRUpCdf1/o/aKeQky5sqZdAH1/uS2RqBfKK27OxK851/rYHiRHgkuIk/2jlDFq0pTKPoiRehBHkmThvR6wDdZc++hS+02cdl9CN10BS0g9mibu8hFyM2SfHj/LpVSTrWjyU1feMiWJDVuvvH8HuxMkwp4F5jq/iOtun93W6vRnNAwSHhdAO6x/20VFeY+AVcV8PGXuWVZIwY9N1N96Np6uGBzQP6wBWi0SxXbIEumzJF2UFRkCg4rMPEZ6a8RnFcyaJKUdh72zmWDaLO8er36HAWDfgUNTx0lZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 06:36:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 06:36:01 +0000
Date: Thu, 15 Jan 2026 22:35:56 -0800
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
Message-ID: <aWncTBPaYuQ0nAAm@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
 <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
 <aWiall34yq5Eupkf@lstrano-desk.jf.intel.com>
 <nvhjddzmdf34cbjnxmka6ir6smkokn7dlp2aa36ymvofmbo3qh@lugxvx5xlvud>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nvhjddzmdf34cbjnxmka6ir6smkokn7dlp2aa36ymvofmbo3qh@lugxvx5xlvud>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bf3a17-42cc-4def-5df6-08de54c983ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGxNZHhmSmYrNVNPUEhlWFEzUzB3TDlxUEhGbG1HS2lMbjY0aEd3WkJPZlp5?=
 =?utf-8?B?S252ZFl2dkN3ZWVVQnhnM28wc0RhTjhQVmdQM1lnaVFpbnhraUgwUmpxTGlP?=
 =?utf-8?B?TVQ1Lzd5WS9mS1hVZmw1bnVXN3BEZXhueTRZc2ZNaFJseTRINERXODJSS0dR?=
 =?utf-8?B?V28xZ0RkWklmenZVWGZ2Z2dFTlVpZjA1M3JZSGZCTlR3cHJuWFpCM1FxOFdB?=
 =?utf-8?B?Vk0rY2srUUZkWUdkSyt0VzFtVE9IMUdySFZuVmFMU3h5aXcvL0dlU3VLdDBl?=
 =?utf-8?B?dWFSQkRrdWVhNmZ4bTluRFg5RFpueXVQVHhjQzdpb1hZTlYzcmhPSHRtMnh1?=
 =?utf-8?B?MUFhWVZvQkJGNXcveXdNT3JJZ05QM2l3djdvampTSGhDempENGhzdUk3TXhi?=
 =?utf-8?B?Z0NpQkNqbE42a2tHUDlvZUdGb3dzbUtYYzNiNmlIZkEyNk9PV0g2YXA2eFd5?=
 =?utf-8?B?M0xFLzJVZDRJL0EvYmsveElkaEVtMEFoUm85blFCSjFhMTJmdTZVTFdsR3gr?=
 =?utf-8?B?MkRGN2duR0lwNm5zUzNLeURhWUlrcUJhTGxlNVhUV29pa01OK2ZxYVhvbVg5?=
 =?utf-8?B?VkZ6M01OWUhpSmNhV2VYUVZydHQrTGhSakg0RjdiYklBWlZMT0liUUMyaHhs?=
 =?utf-8?B?NEo3S2ZNWWszczVOSTRjb3RJUHhSWXU1WkFMbzZVTzZTNUtLUUQwMHcxMStO?=
 =?utf-8?B?Mi92WjJJYTZSaWhJODB0YzV6YjVDRFhvSWFQU3ZPalN6MUlxWWt1K0JoNUdQ?=
 =?utf-8?B?bGQ3cUx2eHZINm54akNIZW1pem94anc2Qmc2N0xDM2VGNWNCV09MNWhoUGti?=
 =?utf-8?B?Z3A1WTNycGlCUzl0ZEFJbHFsM1duQVpoZEpuLzJnMjJjZXhGTHY1RzNMMkpH?=
 =?utf-8?B?S1RVeVlNekZaTlR1VmZUMXZ6eXhpNWRWRVF3RmtlNkV6MzZkTFpCSWV6S2FN?=
 =?utf-8?B?d0pBV01wa0xrbW9GdTU2dUluN1k5RGJNTDN0NDFGYXNldENCYVFLMTMzVUZj?=
 =?utf-8?B?WitVai9xTENxakxac0FQNjc0VkV3ZVlMdTc5SVdhQXNWdVQ3akFRRVJ1YzM5?=
 =?utf-8?B?eVptSzZXWmNHa2wwSTJaRy8wdCszNnRqSW1uNjBSS3A1eTNxYU1wYmp2QnBV?=
 =?utf-8?B?SGpzRUUzZThMSnp0ZHhMT2orOUtqWUVadGFrUnlwYkdQSVdxVzFYT0c3T1hK?=
 =?utf-8?B?ZVRKZ1hibkgxZllqZHMrb3J0ZHdYU2pCVjZoa3hCcmpReEZjWURtNEs2RzJs?=
 =?utf-8?B?ODBGZE1DaTV6ck9wMzI4RkMxMndaenVZRzc1d2U1cGNZNTRUVEtXdFBBRDZC?=
 =?utf-8?B?NGQvd20rdjc4WWNRU3A3RW5WVFQySFNsNHpsL3FXOGhDYUllZlJ0ak1uYXZj?=
 =?utf-8?B?M2pidjh4V2ViaDNQakdvWU9ycWN4OUhQd2FKTHJEOU96aU9PSm5RZ3E5QnFm?=
 =?utf-8?B?eGxvUUoxV3FYbWpsaEVDanhOZ0hjWUoyNVUwaFlneTh0Mytzd3hqM2gyb3g1?=
 =?utf-8?B?TmEzVEp6L0JwREk1cU84UkVvdERPeVlTMURTUFlJWW5ITFNENWwwaUozaTF4?=
 =?utf-8?B?VUFMeElRTXBzYnFubEllRHB0OG5CL0swRzAwblVCSVdZV0M3bzMrMW50S0ZM?=
 =?utf-8?B?ZzIwN1d3bWZDQzZVdkRPNGprWnQvYjVOVnRyb3dXalRDQVgwMDIwQ2UxbTda?=
 =?utf-8?B?MExiUm80MWJ6dDBXZ0U4eURkaFplQ2NLRGdGSVhjOUhpdk1qdXBmQ1dJSEZh?=
 =?utf-8?B?UnBJdVFRTFdINEtuZVBPaTEwaWR2dm9ZZzl6OVRUbklwZTZ4RkdwMUgrcGtt?=
 =?utf-8?B?Z0E0REtQRk1iUHJvU1BRcG9vZW1xcHBLWnhZY2o0TjdLY3dQWUk0MFFJVXJU?=
 =?utf-8?B?ZXIyKyt3Q3p4RDhJVWV2aDI5blEyeERIT29pdU9OY2ZkQ1VzbS9BdlNpRG1V?=
 =?utf-8?B?Q2ZQNnBkb0x3QnFvSWNWaVIrTHpRblUyYjB4YzcxbEh0ak43VTFwUFBMTWJt?=
 =?utf-8?B?L3pyWGtJSWJhUm9MSjNJcUdTTXgrMXp6WXl2Y2YxTWxsekRWQlU2aU81aTBV?=
 =?utf-8?Q?ul6om4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjBadGIyQzBBZmJCcmtTVFltUytFR3dzVlhQL045Rk51T0Vnek9vUW9SSWV3?=
 =?utf-8?B?YW92eDVSU0JGaXBzTnZIZkpqWXpPclE1Z0tFOFphc3lVZWZNS3YrMTZNVTI1?=
 =?utf-8?B?WWl0cXpkdmtYbVk3dExpSkRaSE1QL3A4QzZodzV4SWt1K2VYd0lnZ1UyRHlS?=
 =?utf-8?B?SitTUGVhcnVEc3dCN0xOVWRyclo1dkhFeXkwb1ROdFlyUXc4TStPazg0K0tH?=
 =?utf-8?B?czI2ZXZuQjZaY0N0cDAzdkwvZUpCRjZaQzBVVDVDSEE3aTBtQkxUNVRuNVhj?=
 =?utf-8?B?SERldGM5YWROWFhSR3NWZDRUMVFLeEZQZkhMVXBjTFZxNHV1U1hqRzduNWNC?=
 =?utf-8?B?ZmdjaEpzUlVaZUNmVUJZVWpkMzdJQkFhS0EzVGFmazVhSkc2a2xnZU9WbE9T?=
 =?utf-8?B?VEROS3ZDZmpBN0k3OW4xRUY2aWEwUmliN282cnhJNEEyaUVMS090c0pYYWtt?=
 =?utf-8?B?UEtsVGdBUE5xSU1VT1FzbmNneWRDRVFSS05EeE1OeDZ3aU1ZUVVIWWZsekRW?=
 =?utf-8?B?YnJxcjh5Zk9MZlBqN0xsNjJOMFRNQklLc0pzYWs1MkRDbnJqMkpMc3VuSkFM?=
 =?utf-8?B?ZmVoVHdOYWVyUWtUVEcyNld1V0VFZ2IvZ1ZSSWJiVDhiOUlOUlNJTnNKMk9k?=
 =?utf-8?B?OHhuSDBJK245UUNzcVJiZzkwVi9kNVJBMlhsQ0xRa0c3ZHZSclFES1M4OSsr?=
 =?utf-8?B?MXJCNEtXVUhlbGVBcmJ6RU5HbU1mbFllWGRvNmRKNGZxUHRDK3I4NUNNK3Z5?=
 =?utf-8?B?Y2ovZk16NHZWZy9BcmRWM2hseEhBaVJOSHJaWFVocm5Rek52V3Fnb29zOE5K?=
 =?utf-8?B?aVUwU1kwakkycko3QlcyRUk0UnZLL1ZDUVhvVUtlSVY3am5uaUZWM3pPckI0?=
 =?utf-8?B?NnNFNmxpOTNZMHBCbTJibVVpVWt2U3F1M21UM2JBNGp1L2F5MFlpV2ZFOGw0?=
 =?utf-8?B?bVlucHd6K3J1RFNKK3pKTEhZZWxsbm1qTHVJZDFXcFl5TWYvRmUwUWFmTE9h?=
 =?utf-8?B?YTM1c1pkZC9pc0YvRWcvSVRuWjY0VjBsTnpjS1dubVlpWmRmOTAybFRvVWtG?=
 =?utf-8?B?aXN6djlSVG1FUU1hNlNrMVNmaUNUdFdFVWFpL3JvYTBQS3NZdjFadFBBY0xC?=
 =?utf-8?B?aXg3YnpjbkZnajlKRXgrQmZ0UHAra1haWVREMm5QcjFhY0dwcERhU1Vvcnoy?=
 =?utf-8?B?c2szck5BY1pJL21Rb01UV01oRU13L3Q1SXFCenNCL1YwclRleTI1Y0xybjhX?=
 =?utf-8?B?S3NuRnhOTmx6SXJJTWs0a3VhTXdoTzZLc2N2WEtMQnkvVFEyN1ZGRnZxTXJo?=
 =?utf-8?B?VFJvak5QWVJMWXU1L1V2ZDViOE9nTGU5VjFhTXFIemlXbW5oc2FlSTZPdWh0?=
 =?utf-8?B?Umtsc3FSRC9IV2UrY2crcUQ3eVlmVHRCV3IwNXVwRXBid0ZQK1l1bDYxSkxs?=
 =?utf-8?B?UkVWMVdiUnVpM0ZhSG54elphNGdZdVUwVTFkazBtNTVPRWFXTE5wUkZGNTdB?=
 =?utf-8?B?Ym9DVFY3MWZiaWhPOGUwYmlKNHF4OW5nTjc2WEsrTmJsbkhlUm5iQzdpWFp4?=
 =?utf-8?B?UUZUdnFnenVYWVZLV3JmMDlGMXFKcGhzLzk1MnZBWWhFNm1kazFjOHhuZkI1?=
 =?utf-8?B?a2ZQREFLbW1GWDVnM1ZrdE1qdjgwM2tEdWs2VmJXL1hjL054aDB5K2VIUnV4?=
 =?utf-8?B?Q0NyNFR1eXhRMXIydFZ4eEo2bkJLWlBKNjZtRmxoa2JHV2dMam0xcFFOTG1W?=
 =?utf-8?B?M3FNTnd4djVlWFgyTmZWbGxoandvc1ZsMmV5cFNQb29mVHhhK1BIVlRHS01q?=
 =?utf-8?B?ZW1pcjlJWUpHRFZTOWY5MkYxODNnV0pVMEk3OG9paEw4TWZ5RUV0UGRQMkd1?=
 =?utf-8?B?aFNRdU1xK3pxZk0xT2lFUEdJYTdoUVc5bFlDK1pMZjFzT2sxM2NacGRkS1Z2?=
 =?utf-8?B?K1R1eFlUWVMyQkN5dE5ocmNPQ1B2NHBpQTI4Q1IveEFIcXpubzNlSkdZUGlQ?=
 =?utf-8?B?dTdPQUt3S3VNUlhqZC9oeEFjeU1zaHdiV1hlRFUwZ1J4TnU4RVhpN0wrbDFq?=
 =?utf-8?B?bm5jdUZXc3dzdm9oSHNBb1FSc0FwTzh6SXZzQjFhTVNJcWt1VXlyMDJJSFAz?=
 =?utf-8?B?Qm04OFhYdzIvbGxTY3krT3JNdkJCMUQxY2pMZnpkVU9oL0JNcDVLVjhTcjB1?=
 =?utf-8?B?UUdKV2ZhckxEN3pWY2w1enFUWk1ISWRkK1d5TmE5N1BIK2FmL01BYnF4R29q?=
 =?utf-8?B?NjRBR29UL2NoUDlOOXFmb3ROYmNMSDZrNWlOOFd2bUw3bGR6cnlnZW94NlJp?=
 =?utf-8?B?M0t6UkVrWmVJaE5DL3hMQWNwMTh0K2NxdWpCV2llMjZOTkpLbHpDQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bf3a17-42cc-4def-5df6-08de54c983ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 06:36:01.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeLJrFkTO/6HqgyGuyZhXZAapoay7fv0tHUBj7p3criRG7Bhsv7u6aFR+uCqGPpttcw7Zqfxz5hX48i7jOvULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:05:00PM +1100, Alistair Popple wrote:
> On 2026-01-15 at 18:43 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Thu, Jan 15, 2026 at 06:07:08PM +1100, Alistair Popple wrote:
> > > On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> > > > > On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > > > > > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > 
> > > > > > > Reinitialize metadata for large zone device private folios in
> > > > > > > zone_device_page_init prior to creating a higher-order zone device
> > > > > > > private folio. This step is necessary when the folio’s order changes
> > > > > > > dynamically between zone_device_page_init calls to avoid building a
> > > > > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > > > > must be passed in from the caller because the pgmap stored in the folio
> > > > > > > page may have been overwritten with a compound head.
> > > > > > 
> > > > > > Thanks for fixing, a couple of minor comments below.
> > > > > > 
> > > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > > > > Cc: kvm@vger.kernel.org
> > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Cc: nouveau@lists.freedesktop.org
> > > > > > > Cc: linux-mm@kvack.org
> > > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > ---
> > > > > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > > > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > > > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > > > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > > > > >  include/linux/memremap.h                 |  9 ++++++---
> > > > > > >  lib/test_hmm.c                           |  4 +++-
> > > > > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > > > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > > > > >  
> > > > > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > > > > >  	dpage->zone_device_data = pvt;
> > > > > > > -	zone_device_page_init(dpage, 0);
> > > > > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > > > > >  	return dpage;
> > > > > > >  out_clear:
> > > > > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > > > > >  	page = pfn_to_page(pfn);
> > > > > > >  	svm_range_bo_ref(prange->svm_bo);
> > > > > > >  	page->zone_device_data = prange->svm_bo;
> > > > > > > -	zone_device_page_init(page, 0);
> > > > > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > > > > >  }
> > > > > > >  
> > > > > > >  static void
> > > > > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > > > > index 03ee39a761a4..c497726b0147 100644
> > > > > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > > > > >  					struct drm_pagemap_zdd *zdd)
> > > > > > >  {
> > > > > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > > > > -	zone_device_page_init(page, 0);
> > > > > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > > > > >  }
> > > > > > >  
> > > > > > >  /**
> > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > index 58071652679d..3d8031296eed 100644
> > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > > > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > > > > >  	}
> > > > > > >  
> > > > > > > -	zone_device_folio_init(folio, order);
> > > > > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > > > > >  	return page;
> > > > > > >  }
> > > > > > >  
> > > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > > > > --- a/include/linux/memremap.h
> > > > > > > +++ b/include/linux/memremap.h
> > > > > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > > >  }
> > > > > > >  
> > > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > > +			   unsigned int order);
> > > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > > > > >  
> > > > > > >  unsigned long memremap_compat_align(void);
> > > > > > >  
> > > > > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > > > > +					  struct dev_pagemap *pgmap,
> > > > > > > +					  unsigned int order)
> > > > > > >  {
> > > > > > > -	zone_device_page_init(&folio->page, order);
> > > > > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > > > > >  	if (order)
> > > > > > >  		folio_set_large_rmappable(folio);
> > > > > > >  }
> > > > > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > > > > index 8af169d3873a..455a6862ae50 100644
> > > > > > > --- a/lib/test_hmm.c
> > > > > > > +++ b/lib/test_hmm.c
> > > > > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > > > > >  			goto error;
> > > > > > >  	}
> > > > > > >  
> > > > > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > > > > +	zone_device_folio_init(page_folio(dpage),
> > > > > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > > > > +			       order);
> > > > > > >  	dpage->zone_device_data = rpage;
> > > > > > >  	return dpage;
> > > > > > >  
> > > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > > > > --- a/mm/memremap.c
> > > > > > > +++ b/mm/memremap.c
> > > > > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > > > > >  	}
> > > > > > >  }
> > > > > > >  
> > > > > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > > +			   unsigned int order)
> > > > > > >  {
> > > > > > > +	struct page *new_page = page;
> > > > > > > +	unsigned int i;
> > > > > > > +
> > > > > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > > > > >  
> > > > > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > > > > +
> > > > > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > > > > 
> > > > > > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > > > > > the flags entirely? Or at least explicitly just clear the flags you care about
> > > > > > which would remove the need for the comment and  should let you use the proper
> > > > > > PageFlag functions.
> > > > > > 
> > > > > 
> > > > > I'm copying this from folio_reset_order [1]. My paranoia about touching
> > > > > anything related to struct page is high, so I did the same thing
> > > > > folio_reset_order does here.
> > > 
> > > So why not just use folio_reset_order() below?
> > > 
> > > > > 
> > > > > [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> > > > > 
> > > > 
> > > > This immediately hangs my first SVM test...
> > > > 
> > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > index 6f46ab14662b..ef8c56876cf5 100644
> > > > --- a/mm/memremap.c
> > > > +++ b/mm/memremap.c
> > > > @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > >         for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > >                 struct folio *new_folio = (struct folio *)new_page;
> > > > 
> > > > -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> > > > +               new_page->flags.f = 0;
> > > >  #ifdef NR_PAGES_IN_LARGE_FOLIO
> > > >                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > 
> > > This seems wrong to me - I saw your reply to Balbir but for an order-0 page
> > > isn't this going to access a completely different, possibly already allocated,
> > > page?
> > > 
> > 
> > No — it accesses itself (new_page). It just uses some odd memory tricks
> > for this, which I agree isn’t the best thing I’ve ever written, but it
> > was the least-worst idea I had. I didn’t design the folio/page field
> > aliasing; I understand why it exists, but it still makes my head hurt.
> 
> And obviously mine, because I (was) still not getting it and had typed up a
> whole response and code walk through to show what was wrong, in the hope it
> would help settle the misunderstanding. Which it did, because I discovered
> where I was getting things wrong. But I've left the analysis below because it's
> probably useful for others following along:
> 
> Walking through the code we have:
> 
> void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> 			   unsigned int order)
> {
> 
> The first argument, page, is the first in a set of 1 << order contiguous
> struct page. In the simplest case order == 0, meaning this function should only
> initialise (ie. touch) a single struct page pointer which is passed as the first
> argument to the function.

Yes.

> 
> 	struct page *new_page = page;
> 
> So now *new_page points to the single struct page we should touch.
> 	
> 	unsigned int i;
> 
> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> 
> 	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> 
> order == 0, so this loop will only execute once.
> 

Yes.

> 		struct folio *new_folio = (struct folio *)new_page;
> 
> new_page still points to the single page we're initialising, and new_folio
> points to the same page. Ie: &new_folio->page == new_page. There is a hazard
> here because new_folio->__page_1, __page_2, etc. all point to pages we shouldn't
> touch.
> 

Yes.

> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> 
> Clears the flags, makes sense.
> 

+1

> #ifdef NR_PAGES_IN_LARGE_FOLIO
> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> 
> If we break this down we have:
> 
> struct page *tmp_new_page = new_page - 1;
> 
> Which is the page before the one we're initialising and shouldn't be touched.
> Then we cast to a folio:
> 
> struct folio *tmp_new_folio = (struct folio *) tmp_new_page;
> 
> And reset _nr_pages:
> 
> tmp_new_folio->_nr_pages = 0
> 
> And now I can see where I was confused - &tmp_new_folio->_nr_pages == &tmp_new_folio->__page_1->memcg_data == &new_page->memcg_data
> 

Not 100% right, as _nr_pages is 4 bytes and memcg_data is 8, but the
pointer base address is the same.

> So after both Balbir, probably yourself, and definitely myself scratching our
> heads for way too long over this change I think we can conclude that the code as
> is is way too confusing to merge without a lot more comments :-)
> 

I think more comments is the way to go. More below.

> However why go through all this magic in the first place? Why not just treat
> everything here as a page and just do
> 
> 	new_page->memcg_data = 0
> 

Well, memcg_data is 8 bytes and _nr_pages is 4. They also have different
#ifdef conditions around each field, etc.

I’ve also seen failures in our testing, and so has François, with the
memcg_data change. I wish I had a stack trace to share or explain, but
the times I hit the error I didn’t capture the dmesg, and I’ve been
having issues with my dev machine today. If I catch the error again,
I’ll reply with a stack trace and analysis.

> directly? That seems like the more straight forward approach. In fact given
> all the confusion I wonder if it wouldn't be better to just do
> memset(new_page, 0, sizeof(*new_page)) and reinitialise everything from
> scratch.

I had considered this option too, but I’d be a little concerned about
the performance. Reinitializing a zone page/folio is a hot path, as this
is typically done in a GPU fault handler. I think adding verbose
comments explaining why this works, plus some follow-up helpers, might
be the better option.

> 
> > folio->_nr_pages is page + 1 for reference (new_page after this math).
> > Again, if I touched this memory directly in new_page, it’s most likely
> > memcg_data, but that is hidden behind a Kconfig.
> > 
> > This just blindly implementing part of folio_reset_order which clears
> > _nr_pages.
> 
> Yeah, I get it now. But I think just clearing memcg_data would be the easiest to
> understand approach, especially if it had a comment explaining that it may have
> previously been used for _nr_pages.
> 

See above — the different sizes, the failure I’m seeing, and the
conflicting #ifdefs are why this is not my preferred option.

> > > >  #endif
> > > > 
> > > > I can walk through exactly which flags need to be cleared, but my
> > > > feeling is that likely any flag that the order field overloads and can
> > > > possibly encode should be cleared—so bits 0–7 based on the existing
> > > > code.
> > > > 
> > > > How about in a follow-up we normalize setting / clearing the order flag
> > > > field with a #define and an inline helper?
> > > 
> > > Ie: Would something like the following work:
> > > 
> > > 		ClearPageHead(new_page);
> > 
> > Any of these bit could possibly be set the order field in a folio, which
> > modifies page + 1 flags field.
> > 
> > 	PG_locked,		/* Page is locked. Don't touch. */
> > 	PG_writeback,		/* Page is under writeback */
> > 	PG_referenced,
> > 	PG_uptodate,
> > 	PG_dirty,
> > 	PG_lru,
> > 	PG_head,		/* Must be in bit 6 */
> > 	PG_waiters,		/* Page has waiters, check its waitqueue. Must be bit #7 and in the same byte as "PG_locked" */
> > 
> > So a common order-9 (2MB) folio would have PG_locked | PG_uptodate set.
> > Now we get stuck on the next page lock because PG_locked is set.
> > Offhand, I don’t know if different orders—which set different bits—cause
> > any nasty issues either. So I figured the safest thing was clear any
> > bits which folio order can set within subsequent page's memory flags
> > like folio_reset_order does.
> 
> Oh, I get the above. I was thinking folio_reset_order() below would clear the
> flags, but I see the folly there - that resets the flags for the next page.
> 

Correct.

> > 
> > > 		clear_compound_head(new_page);
> > > 		folio_reset_order(new_folio);
> > > 
> > > Which would also deal with setting _nr_pages.
> > >
> > 
> > folio_reset_order(new_folio) would set _nr_pages in the memory that is
> > new_page + 1. So let's say that page has a ref count + memcg_data, now
> > that memory is corrupted and will crash the kernel.
> 
> Yep, I just noticed that. Thanks for pointing that out.
> 
> > All of the above is why is took me multiple hours to write 6 lines of
> > code :).
> 
> And to review :) Good thing we don't get paid per SLOC of code right?
>

I don’t think anyone would touch core MM if pay were based on SLOC — it
would be a terrible career choice. :)

All joking aside, I think the next revision should use this version,
plus more comments and helpers/defines in a follow-up—which I’ll commit
to—along with fixing the branch mismatch Andrew pointed out between
drm-tip (which this series is based on) and 6.19 (where this patch needs
to apply).

Matt

>  - Alistair
> 
> > > > Matt
> > > > 
> > > > > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > > > > +#endif
> > > > > > > +		new_folio->mapping = NULL;
> > > > > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > > > > 
> > > > > > It would be nice if the FS DAX code actually used this as well. Is there a
> > > > > > reason that change was dropped from the series?
> > > > > > 
> > > > > 
> > > > > I don't have a test platform for FS DAX. In prior revisions, I was just
> > > > > moving existing FS DAX code to a helper, which I felt confident about.
> > > > > 
> > > > > This revision is slightly different, and I don't feel comfortable
> > > > > modifying FS DAX code without a test platform. I agree we should update
> > > > > FS DAX, but that should be done in a follow-up with coordinated testing.
> > > 
> > > Fair enough, I figured something like this might be your answer :-) You
> > > could update it and ask people with access to such a system to test it though
> > > (unfortunately my setup has bit-rotted beyond repair).
> > > 
> > > But I'm ok leaving to for a future change.
> > >
> > 
> > I did a quick grep in fs/dax.c and don’t see zone_device_page_init
> > called there. It probably could be used if it’s creating compound pages
> > and drop the open-coded reinit when shared == 0, but yeah, that’s not
> > something I can blindly code without testing.
> > 
> > I can try to put something together for people to test soonish.
> > 
> > Matt
> > 
> > > > > 
> > > > > Matt 
> > > > > 
> > > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > > +	}
> > > > > > > +
> > > > > > >  	/*
> > > > > > >  	 * Drivers shouldn't be allocating pages after calling
> > > > > > >  	 * memunmap_pages().
> > > > > > > -- 
> > > > > > > 2.43.0
> > > > > > > 

