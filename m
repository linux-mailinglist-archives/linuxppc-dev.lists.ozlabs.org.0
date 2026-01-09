Return-Path: <linuxppc-dev+bounces-15483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23613D0D2BF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9SZ0PXPz2yKr;
	Sat, 10 Jan 2026 18:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767939772;
	cv=fail; b=QtNmnwutk4QYnHPv62NT54cHAh3mARILVQwHjMuGsC/HP1VkU03ZCM5sfSN/mYnYx3YrV7FEqg6bJLO0rlZIoeGBjVksFcUE10OaIpR+0uGN1at7jll1wQi5KPFb0ZyBaJpm2ppzpq0eo3lj7JrcibunbCNPxV+EFG9wxFSqAdqcsv/frOMzYojdCVUDyGe4tdxfMtQSlLY5JLDbp3jPYGcEZ2esm3mI0V5OI/AGKvRheQ0jw9IlcT4ZntUxL8R/g7soAcXX2bD0xNirmrHqm86ZXBFIsxUXFUQ4l9jaoxCjeWSrvYxANrTWmDr3hnsyAmGzZsAW3uCGlFP4Iq6/kg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767939772; c=relaxed/relaxed;
	bh=Rkvi2kCY83EILh+91N1X2y3l/OVVifhh4YWgv8VKHU8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AckkzIOqjvezP63Ir51UWX9uk5trr/Dc4KjHgwyy3frkOovfmT3GTXtqO4feyWELrYeWEvRpQ7wqDIpDVwwTpF7Y3tVGsVPfMXemDuSgrESwwGRPehEIpiEdVnSGXida6hOZCzQIUHRv1cmJj1WpSbwDh/b1AatI2eXU1xAlJWX50x3Y8BKsJQraoOErVls9sjXVn1m6AjV6e1mlJIQ7Cw7gg5/Ott2598RT0d9TcIzVYokGyOYeiHxREO+B2YJGQiK56FfEXFd3fHSbBhJFKXheIfzauZ9MWl6ZymrFfiVA3mAa/K0yrGvJqQ/iIiFD2V+epTBJfR3hkLua2RFI0w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DhJnTnG8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DhJnTnG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWsj5XWZz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 17:22:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767939770; x=1799475770;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n1gon94OqzvgrdoVNiYxNDXp2qaZdwEnUKHvIpC5WFA=;
  b=DhJnTnG8sYoDqo7Op+koP8FfQGCAKKDvli8uSEFD/2ZWKj7h5x6/iJhK
   x/DduSwqJGXomaJ/8P2AadaAivgCUlF9xtKb2D2qm3ZgGiqCSQGTu6m7s
   EspG/iffxDjliJISsjQGjj82QsNeJaCeoMe6PHlCrOXwLzgOgJPgLfGlJ
   razslsy3oCjdNNgAVv1nSu93KlI6tHZlMoH34Hn4U4xIP5NPznviMrX4c
   Ova7kTF2FDN9wx8aB1N87qkST8R1QGwAWP742NOkKHL3LS+K6WO3ETdf6
   KGfhYTeTvqgJ/DLp63mrJZoR2TzRsgeZDhHMqA6MCH/BtgiNNaQM0QhLI
   g==;
X-CSE-ConnectionGUID: 2Rl3JA7LQdWBlKe1D8CU2A==
X-CSE-MsgGUID: 3iIthF7GQCOTOiaj5GeOaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69368227"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69368227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:22:44 -0800
X-CSE-ConnectionGUID: FWHa15EPSp2Al+6+GoSr9Q==
X-CSE-MsgGUID: UECvbG0YT3iUq6p5TwkMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="204223380"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:22:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 22:22:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 22:22:42 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 22:22:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajyolgpW9c4kH5XIuzQ/rxH1RYGNl/Helq5XjdtmzqE+GGrnbq6T2TvAo/WN5rTvHpw72By6OfrxCnuFOJ6Usn6YPXEmgPCKkPdWpbLCaDrHGBTweWDUsln7xFwtMrbd/76tAmZ28PczrAUaIX0QGyLpKzF/qr81uOt9eENarRUESXpWjKysPHlUg4zJ/WlU2mQbNJy6bR4O77sazEOw41mrWtQj29CYP4pJZwfsqwO/o+jQ51Vz4h392uCVRB/XepOpYzaKXmaNy6AkoeH9ZPWnzfTJLMvKE55wJrC2+35ZLNM8HgLk4lIf89DWAztUTFg+M2T0bSt7jx0VlUCZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rkvi2kCY83EILh+91N1X2y3l/OVVifhh4YWgv8VKHU8=;
 b=iGMO1fGF+H1SLtrbTIDh+sQ9F6Bmqxm02u7D7V8HPv2iUN9dzAQLX2q5ztWPxBd8FPQiTyUHY/EDF7CE6YIr8aPxEehvmBYd2CBlbjLqNwYx26rtwgjfObp/034tSAhS2NZd4bn3KYHC8zTrUeC+/21ejXvP0QhOLdbQEnhu+BaD18U+WSwPIOtmwS5Sy/YRop8I6/1quiLrkAafhTJvzIdoxC6onn4gmDz43vZ/GPmXcSmKBlGfpZ1Ny24PEiE/jLx3hIemlL9C51gzzaDx+Z+sx4vYCAxSwzrhOP4LSYDYQ0su+EoSEX2sbEx+KmfBXhAdk5ebsWBGdS9VWgJYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 06:22:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 06:22:40 +0000
Date: Thu, 8 Jan 2026 22:22:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>
CC: <linux-mm@kvack.org>, <balbirs@nvidia.com>, <akpm@linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<david@redhat.com>, <ziy@nvidia.com>, <apopple@nvidia.com>,
	<lorenzo.stoakes@oracle.com>, <lyude@redhat.com>, <dakr@kernel.org>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <rcampbell@nvidia.com>,
	<mpenttil@redhat.com>, <jgg@nvidia.com>, <willy@infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <intel-xe@lists.freedesktop.org>,
	<jgg@ziepe.ca>, <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Message-ID: <aWCerW4QP0t7CrC8@lstrano-desk.jf.intel.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
 <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
 <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
 <ad2a0fe8-6d00-46a8-8f4c-fd7fb6aac8b1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad2a0fe8-6d00-46a8-8f4c-fd7fb6aac8b1@nvidia.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dd662d-6634-490d-67f5-08de4f477d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkI1MXRZTUp2SE9qZFIvVjdwOVJzT2plTmlSaW9BVUJxbmEvTDBkTkd5WCtz?=
 =?utf-8?B?c0tsQ2phbjFOUmY4aVdTZFpJQVRWVmVMMEFhbVJkM0VrYm5hcUNxZWJvc1V0?=
 =?utf-8?B?OWtZc3ZmaFJBMEZzb3NNeUhwbExTN21Nb2F1bTFldWgrK0JJTlk1N0hTTTIw?=
 =?utf-8?B?QmVqQjVLL0hLN3l3NXdBYTNLbE9zQ1ZaRUVocjA3S1lVSXdSZ3JHTUlNaGFK?=
 =?utf-8?B?YVNtb3lFUVZ2elVMblJTOVV0eUMwMTVUWFA3eHhaaGJDWXNZTGYrajZ2ZEht?=
 =?utf-8?B?WmFoc1Q1eXZDNU1ySlU2MUUzcnlSLzl1ZjBUNm1OUXVFejhSVzJNSXB5cTFt?=
 =?utf-8?B?aFRic1QvQ0RWRzlQcjNvdjBvZWN2REUwMHJIa0g3NWpvdVpvRFg0eHM0VWVv?=
 =?utf-8?B?UUdFd2VKNkZBV0d4aE1NdWdTYXpETk96VDdNYXFtbVpxcW1vbjI3aDRHMWFv?=
 =?utf-8?B?NGtmV2tkajBya1FZSjlNakhmSkc3ZnlXdVp6cEJqbnpLT0gvTnBMckNpbE9q?=
 =?utf-8?B?WkpKK2ErcW5xWjZIMnZSb3ljbkM1YzVRL1JKelgydWFCeUtkb0JqWWhOUWhS?=
 =?utf-8?B?MG05OUVSOHlXRTJDcDloNUNLcXV6MXNPaTcyemZxcWFOc2tNdi9OVUdQSVNw?=
 =?utf-8?B?Vm83ZHZTWFlzeWVDMWR1QXBoeUx3K09TbEdQL1NXdGxQNkhtcWovNStSSUVn?=
 =?utf-8?B?aGNtYWJQbHhQYzVKTFRkMElmOUQweTI4M29qOW5jSFkvY1dvTWsvZFFWT0xo?=
 =?utf-8?B?L292eDhlT0dBVUFKYktyTmdNK3ArQXFUMi9ycm1kY3l0YmZhdW1JcCtYMXNR?=
 =?utf-8?B?aWpSaGhSUDFGWUoxTllSa3JmZm5XQmt5TTRzWmp2TjAzSWgxemVnaGtNbitV?=
 =?utf-8?B?U1hTaTZ0U1Y0bzBpaE1DT25nZlFnQ3Z0cEx1QytjU3d1dUF1cW5xSUoycDhr?=
 =?utf-8?B?b2xtOU5NWDlvWk16bThlSlRkNlRvRk5Wd3doWUVJRHVOcGU0V0RpUXpweGN6?=
 =?utf-8?B?RWZaNVg5Y1l1dm4vVmpOaEJ3QnBPWHcwcDd5ZmEva2JBa0wwTHdGekIvZDE1?=
 =?utf-8?B?Zmd1R0FzU0VGeCtWSTc1bW10WHBORk15RTFPZDNzZWErNWVQWlBMUXgrQ0xK?=
 =?utf-8?B?RVRXRmdkVU5XYkFSUk1DQm9uN0Rqam1QRlEzeU5xcmgwUnRNdEVSeTBvU04w?=
 =?utf-8?B?ZmlUWWpsTmREbm15bUdYLzhiQndhbnJHTXFOSmIwUk0xQzFVTHI4ZDg5S3JE?=
 =?utf-8?B?V0h4eWZFWGlWdTFvVG93Uy9seCthUzBlS3VvSXBSb25VY1picW56WXVpVUY4?=
 =?utf-8?B?UTlMTVV1V0laRXhXWlc3OFV4UDBCOXkxSlJPOWtyc21MZHJ0anpOeTY4cHcy?=
 =?utf-8?B?REt2bi91YUMraHZiUm5EemxsWmVna0hkOTUzQ0gwTTYrYmZWSkd0dTFkemRW?=
 =?utf-8?B?MFNUZGl1SHFQR2pGV1IvcGw0WG9Dazc4ekRuVzQ0UUlyQlZwdlMvbU96dDlt?=
 =?utf-8?B?Q3poWFVJUFY1UU0wZ1JIMGE1VXVjYlYxK25Sb3BtcG92U1dRc0Ewb01XMVhk?=
 =?utf-8?B?akl0cGdiTXovSWtab2hRbXo4ZGVHeHVhUE1TNVR5b0FWbzE1TzBteGhpbFZ5?=
 =?utf-8?B?NENJWURIdXRMc2tINUlqMHlNd3hPQkhuTFkxdVR6dFdVV3FNZVl1Q0p2TDBD?=
 =?utf-8?B?bjFNL1VlMVZyQkRVM3hPUGRhWXdtWHZ5SlB2SHZFRVFzK25pRFo2Ykp1ZWpv?=
 =?utf-8?B?cXhWSDFqNksxM0E5c2RLVE91UE15VEZwWVh6RDNoZ1hFZVhOQ3dVWkswTjJl?=
 =?utf-8?B?TnpsT0E1bUFia1hwYlpSN0c3aHFPaEU0akk5L0poQkYzb3NzV0M3TkxvcVlv?=
 =?utf-8?B?RE9DSDNETkwwc3k1cWxmQVgyR1J5Q0lzaDhmVnlxTWhWWUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1JiWWlSeXFUam5vdWZEbGEyaVJ2eDVOM3M3WUh2UFc3bndrVmU0Y2NESzVR?=
 =?utf-8?B?TUpEWG96UHNDMXZEazVtN08rMHFuSndWMWxsZUl6RE13MC81ZmROdTZBTkdY?=
 =?utf-8?B?OFJpZXBKSE80SzJIK2F4aUdYVzJDTWgrbWU0Nm14SnRnMndNTmtSTWU4UXNL?=
 =?utf-8?B?cFRNay90L0diU2Zpb0UrdktBeUlUNUdZMUJTOFQwZVhqWEpjSEtwYzIvUjE5?=
 =?utf-8?B?VUNxOWh5bTBKRk1LclBHa3NueFg1Wksyb0MyWTRnM2phNjFtU0JSakZxekRo?=
 =?utf-8?B?Q09naFpWanovUFIrUURRWXpiVEthTW5heFJhR3dBTERRSnNzdlJ0OVNwQXBn?=
 =?utf-8?B?UGZwUnhnemQ5YWJyTTZWQ3JCaytJT2Q3R0NqNEpEYlQ0clZiNXp0UndhakRR?=
 =?utf-8?B?a0tJTXhmQXQ4NDdqajBEWXl2bDlNSFdVOTRLSktsckJrNGlUTElXaHh6RTA2?=
 =?utf-8?B?b2FiVWZmd214dC96UXlOUU9HcnNIemFYU1E4UDczaXM4dmR5cEp5WlJqa1Rn?=
 =?utf-8?B?WDZscW9VVTQvajdVUUlQMTI0OUJPSUxBMCtPeWFIYVNteXZWbjR1WjF1bE5D?=
 =?utf-8?B?V0p5QkphWmxCakVYU3l0a216a0R0ZUkvNVh5N2lzS0RuL20xZmtWdUxtaWZK?=
 =?utf-8?B?MXMyZmxBREwvWUYrS2NGR0FEL0t2ZXlHMHIzMkFSSzlZMHZxZFhnSlAvSmg0?=
 =?utf-8?B?QTBzMlJMY0x2Q3FyNVZvTGYrOEVHeG5OelRiUHdPYmErc2RDMWJJUjY2UEps?=
 =?utf-8?B?REVWS3FZcUNwdGxnMDBmZnVDRk9LWVRrYit0ckR0TnVIbjA5cHYxL0JwNXpw?=
 =?utf-8?B?bkQzTE5HdXRQN0RyYkZFVm90QWh5cnhkT0VRYnN1eVdKT2lFU3lXV0U4Szhm?=
 =?utf-8?B?b3JVcTBtZWtiTUZsTWw0czEzeVRrYkFwa25WUlU2YlpUQkFwS0dIZENRKzhH?=
 =?utf-8?B?QXhUWitUZ2MxaVorc1cydUQ4VGdPOE5Ja1RBNlViVWtFVVcyaTFUOWpwV2Nu?=
 =?utf-8?B?MUFnRjRsMTZsaExmRW9HM2Nselg0Q2RCekNLM0N5NiszblJRS281U0sxU1g3?=
 =?utf-8?B?VzAyVWZLY3RtY2I4YkxKbGg1SU11aU9iTkw0R1ZvaHo3Y29rVUhNWWRxMkhW?=
 =?utf-8?B?VS9wV3NNMCtPbXZRYkE0a0xKeXo1cGhiZjdTN0xqTWxNRmR3NnpCWHZkYUh5?=
 =?utf-8?B?TDZYcUFpVGRwSVE5RXZPWDZXVDUxWUZLNTVOOVlQT1ZGbHl1ZW1uVlU4VGpp?=
 =?utf-8?B?OTJ2THlPTDlzczJCc2huMkk3MndRZlN0YndHM2VWd08wamkvTTJkZ0duQUlU?=
 =?utf-8?B?T1hpVmttK2xxZThadHl5cGYrdXJlNlEwMnpuQytzYzRvTjdTdW0vRnRXRDFP?=
 =?utf-8?B?ZWxzbkthTWlaTVoySlg3eTVKOHczRkw1S2l4S3JrZ0RiTk8vMzJrbWR3NzI0?=
 =?utf-8?B?dElOTG94SHQ5K0xtVmhCaFowQVZWMTRicU5ZaGVrZ2t4TFVOMmxuWG1QQ05o?=
 =?utf-8?B?R1dkWWdNd2JIaFc0QnpJWFFyN2RVMkxkaG9pd2VlSFVYdUFKekFjMXhUbkQ2?=
 =?utf-8?B?eGtWb2ZCZEV1VWV3TnRWTDlML01XYURHNkFCUnpOcDN2cWdlN2ZuTUwvS3ZM?=
 =?utf-8?B?Zkg4Y2ZpZTZBWlJTc3duYmcrakxSbGRjcXc2VS9rK2c4LytYRUN3ZzhKcEh5?=
 =?utf-8?B?SDJpcW80YStSTHJxckc4YU9xZGtWQnFwbzV6U0trcmEvODdoUE5kY05OUVlM?=
 =?utf-8?B?RjIrY0ZVSDF0RkpibnBOcW9paVRkQXRwcys2MXdKbXpvWlJ1QncxbG94OTg5?=
 =?utf-8?B?SUxnWmNBMGNpOWRjdFF1VTFVcVRqK0tiOWo3bUx2bHlMVGQ0NlNGUTlZTm5z?=
 =?utf-8?B?Y2VlaDJnaFl4dEtEOEl2cUQyRTEvd1Q1R0o4bXI3QUp2MHV3K2tOckdOck5w?=
 =?utf-8?B?bzRRYmJmVlJaOEZOd3VmMExoUlRjaW9qY2NtbkFmM3FibXhVNTZTdFlLWStB?=
 =?utf-8?B?Tjg4ZWlsZzdoU2orTllrbTFqRG1mb0dGRjdjTVlsL1JCc29nb3JGallPZWta?=
 =?utf-8?B?d0pXUktxN2tNTHd4OTA4aVBsWGY1YWdzZVY4Y0gwT3c5VUIzT3JYMGxDaWhQ?=
 =?utf-8?B?cTNmQlpOM1JJcGZoYVowYnhsNDZVQVJNV3JwNVNvcms2QmFNTStpMW9YTHoy?=
 =?utf-8?B?NVNWemhQZW5ZZ0M5akVETU5Tc0ZNQmpteGh0STJQNE5oVE50c0FabHhCYXRl?=
 =?utf-8?B?Zm4zemEzOHdLZGVsM0hobC9ta3JTK1NVK1Q1NG9hSUNhM1lVZmU1YVpkblk4?=
 =?utf-8?B?NHhqN3VYY2ZOYnZ6SHJid3k4UHNiczJ3clFDc0ZJTXRvaTRJRVZnVC9uc2Fp?=
 =?utf-8?Q?8P0nioBBL21z0wLE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dd662d-6634-490d-67f5-08de4f477d97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:22:40.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59GKni88QIpfijgT8o9teiGDhf6fzFUdqtOY+eXC52RRLFew2nSRGmM8XMQkEKk/27zXSscTT0JyCbRrNqsemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 12:27:50PM +1100, Jordan Niethe wrote:
> Hi
> On 9/1/26 11:31, Matthew Brost wrote:
> > On Fri, Jan 09, 2026 at 11:01:13AM +1100, Jordan Niethe wrote:
> > > Hi,
> > > 
> > > On 8/1/26 16:42, Jordan Niethe wrote:
> > > > Hi,
> > > > 
> > > > On 8/1/26 13:25, Jordan Niethe wrote:
> > > > > Hi,
> > > > > 
> > > > > On 8/1/26 05:36, Matthew Brost wrote:
> > > > > > 
> > > > > > Thanks for the series. For some reason Intel's CI couldn't apply this
> > > > > > series to drm-tip to get results [1]. I'll manually apply this
> > > > > > and run all
> > > > > > our SVM tests and get back you on results + review the changes here. For
> > > > > > future reference if you want to use our CI system, the series must apply
> > > > > > to drm-tip, feel free to rebase this series and just send to intel-xe
> > > > > > list if you want CI
> > > > > 
> > > > > Thanks, I'll rebase on drm-tip and send to the intel-xe list.
> > > > 
> > > > For reference the rebase on drm-tip on the intel-xe list:
> > > > 
> > > > https://patchwork.freedesktop.org/series/159738/
> > > > 
> > > > Will watch the CI results.
> > > 
> > > The series causes some failures in the intel-xe tests:
> > > https://patchwork.freedesktop.org/series/159738/#rev4
> > > 
> > > Working through the failures now.
> > > 
> > 
> > Yea, I saw the failures. I haven't had time look at the patches on my
> > end quite yet. Scrabling to get a few things in 6.20/7.0 PR, so I may
> > not have bandwidth to look in depth until mid next week but digging is
> > on my TODO list.
> 
> Sure, that's completely fine. The failures seem pretty directly related to
> the
> series so I think I'll be able to make good progress.
> 
> For example https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html
> 
> It looks like I missed that xe_pagemap_destroy_work() needs to be updated to
> remove the call to devm_release_mem_region() now we are no longer reserving
> a mem
> region.

+1

So this is the one I’d be most concerned about [1].
xe_exec_system_allocator is our SVM test, which does almost all the
ridiculous things possible in user space to stress SVM. It’s blowing up
in the core MM—but the source of the bug could be anywhere (e.g., Xe
SVM, GPU SVM, migrate device layer, or core MM). I’ll try to help when I
have bandwidth.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html

> 
> 
> Thanks,
> Jordan.
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Jordan.
> > > 
> > > > 
> > > > Thanks,
> > > > Jordan.
> > > > 
> > > > > 
> > > > > Jordan.
> > > > > 
> > > > > > 
> > > > > > I was also wondering if Nvidia could help review one our core MM patches
> > > > > > [2] which is gating enabling 2M device pages too?
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/series/159738/
> > > > > > [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
> > > > > 
> > > > > 
> > > > 
> > > 
> 

