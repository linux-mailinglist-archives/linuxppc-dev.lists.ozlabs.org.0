Return-Path: <linuxppc-dev+bounces-15757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD2D22301
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 03:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds6sz1fWMz2xrC;
	Thu, 15 Jan 2026 13:50:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768445431;
	cv=fail; b=DYnk5EoQ9mu8Pp13sE1FQksV0L9gBAslNJnYL1/Xt4YjPk3MgBmbuX3DfFtoRghecNsinVbsVLbDGYD1gMmujz6nfgs0ZEX4jIKR+yoged4BTvUCy34ptva2nPfz7dciHWNUvRg4kF/P0/8yILih5i/mkZXCiy95Nxh/ypJXwgrBjscmfUaoVybSBUwaKKfqr2Y4rGgpr8M9NMWrDHBwvAHIsNcpbekCLT8cZxth1SfwvQCI2Y4uYxnoYYvzFmtc0hSMTbQzNGMImqm4ybB5jCL3eyNwFNn65wW7me1BGzlLj+fpZo8J5VmJhHB6Ovu2/5IErICen4suHrX91qJhVw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768445431; c=relaxed/relaxed;
	bh=EdNzBJlv5Hxv77JY+xjq93AaGwHHZ2WbZnb5DVRwRJQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hS2EmFwEY/p/HwLUj6m4TmBNstRv7LCvGXHZFViSePtP6ISvTMfzQYkdrJdhHavie6naGZYcNwx5g9Bcot25FOMZtkgb5RmYmmPiRC9C08xgqKudsaS6hFLNoPcxbaK6bSLKOOPOLfxzhlG+di8O3sR33BGprXU9EsDlUPvFob5lFa+8a6vXhI/yE/R/Ce8DJMgmSUzGQxSSjSNM9wOmQ4XRZzZKPt2rrv6czQaMch9R/UbZ9A4AEVZQdddDIlJe/kHAv/4UC7qiUUjwY6JA4u/uHNwRfehIas0i2VNluWGuL5IwPG8CogvU4fqD4PhWfJ4lHAaMLX7RZH90Zc3mUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBmF98WY; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBmF98WY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds6sx6jdsz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 13:50:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768445430; x=1799981430;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n59jOk49gEwcF4s8GxYCYYMqWUxbSyOmW0YoeKl/4PM=;
  b=fBmF98WYElSiNyfzPSF66tf7bWPNb81sqL/JyiBiYF2xWffkIeiKCKRB
   F+CXgu5grsSxaypgujY3sw9sgVpCQ4O7WRwWnQdlyxmNdsztRWmoDlfUu
   HmL+gpp63sw/LdPRRBWobgE5kXNz6k3HVpyYbSbAtxJn3+jyYc9OL9R/g
   Xy8NghzIbXAmHv9QAeTTl08Wngf/MMgZfJP+fSKpecHDmVEPQlTpgozrW
   EYaXoMhxtHCnTicK14iPf1GTIYMofk43ZFmnSllKwHLT/aB0PMY+nbn/t
   JOtyaGXzh9GFdyzw9cOxQvSBj62AzgKipMfyxGD5guCChjn1rbWTt+jXF
   w==;
X-CSE-ConnectionGUID: ahxjq5HOTNqxNmlvUVddPw==
X-CSE-MsgGUID: dTQc3rwNQ9W47VFJ8x8wZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73605244"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73605244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:50:27 -0800
X-CSE-ConnectionGUID: zjM9vBgeTsqVhHKMvtg7MQ==
X-CSE-MsgGUID: u1auPx1nQDKT3Um8lDLPPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205119703"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:50:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:50:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 18:50:27 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVVTsgfJNxn9KcoMS0IKkxK7ZhDsoy45LkxMF2H2HUkA5Vb45a7s8EIzOyaAr8NOYp+uOxrn164VhGJAbwfehYDfWLgiiZb+gm3YRtQ+ILiwufML0Tk8jSnIgZqHQDQcCDz+37zwEvoQqojBFLgsYCk2h9XLIap+vLxpElqQ4Y5petx2cuAsN286gne4zMNR/Ccy4dcoJ2LAw6Z8PNpoMH774xR00PsYU7++ioLhuUkEPcEruwYupC5iR0WrDHOtWSGbNeWNccENyLMgPUS7W3tLcR2UmX+dgA2ptWgzCBqz4HIzAKK0vhsOUox30SBptqnvEXdl+fG+3vi4cV8O7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdNzBJlv5Hxv77JY+xjq93AaGwHHZ2WbZnb5DVRwRJQ=;
 b=TpDRRvZcPmPPObsbtc2X9PhQwvRZINnQo2JiG2jVqmzPWQbqhKsu7X4NwA/jPlhCKSpPLw8RYBpWe1hpTBgzifZ6rw4O0zZwFtLHdg4ZhzHXuaB5UdyAzetCALy/utX5G7p0tX03DTga69viqaK4ewK5gCj2o4wMm+V0MYVOmDG/1Nl/F8mYM8UeK0gYuwKrZ/byFsAOHScAVZ6eoiZgayPq9nA+P2J6TDmqsU0wRr4fCj2kPvdpuDNDt41ZUZkLJfGiUeMCNcDfF1qId6jyliM+JxtWCDx2dXjbKrME3epPHU9YzCg7Lz9lS84wqQQb7vOHqv+xGQ4/a67Imp0GsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 02:50:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 02:50:13 +0000
Date: Wed, 14 Jan 2026 18:50:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Francois Dugast <francois.dugast@intel.com>,
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
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Balbir
 Singh" <balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWhV4n/YgjmmpMWB@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
 <aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
 <aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
 <20260114184042.64fc3df3e43e6e62870bb705@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114184042.64fc3df3e43e6e62870bb705@linux-foundation.org>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1372e2-82fd-4476-de88-08de53e0cea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjJUOEd2aUhBbEhCODF5cC8ySHRWTlRUTWtaamlVVE5yN1piK2NQMG8zTjRR?=
 =?utf-8?B?b0RjZCtsRDUxNGZsbmd6TkhnOEtkT2VuUnBNTEtSaVl0cjY4RUF3SVl5UUpQ?=
 =?utf-8?B?SDNyWXh0SFpqZisrYWRIeWN5bVZGV1p6bEZydlY1aDRDTnJtSit6Q3J3ODgy?=
 =?utf-8?B?RDBKQ3B2ZTQ5M3gyakFBZ3lFYVRiY0pEZkZLcEtNcytsYkFrZ2I2Z0tmZjZJ?=
 =?utf-8?B?Z0hoNmprdmNwSWlETTlia1BNMlFKZ201NjQxWVRUNGhpK1lDa1F3T25MU1Zm?=
 =?utf-8?B?QnFCdHFNeWdYOXdkVEl6UEtzekw2d3pCcGFFekFUVWpCNy9aZzhGdUxZR0lD?=
 =?utf-8?B?WnFuTkRzd1NwQ2dKREV2Q0dSWmd2YmkzanUvYlkwUGh3OVNBMnFnTkJQMktW?=
 =?utf-8?B?UTA3YnpTZVVwOVpmR0Zrd1l1Nys4eE5iTlVsN2VoRmFXajVlbWJsdlNzS1d5?=
 =?utf-8?B?YXd5SHdhWmFCclhobEFSdk5yQWZ6QXRaUE5JOWdaaEJXMUE2djNPUFB6UHNT?=
 =?utf-8?B?Q2g1dTZpdVpMN2IvSkI2YjQxUWFKc0xaV1ViQWpiUTltVDN2NzhuQ3U2NW5a?=
 =?utf-8?B?eVRNZzV3emtuU1EzeU1xY2k4VW8yZkZWOTRzVmhaVUtDWUpHdXFOaTdGdE53?=
 =?utf-8?B?T05BbGhad2I4ZTZDYVYrL0NPRmExY1NoQ2lWa0tuQ25haUdvd0h1YllTRGdp?=
 =?utf-8?B?OThnakVUNUpRWDJQMGhnTnFER3paWEQvZmE3d21VdWlPZjdDRGdQWDg2azlo?=
 =?utf-8?B?b0NaTTVPMWMyamVBOGlrZVRVL25oc0l1YVJxTDZLZkI5WUMzWmpmRklvbUtH?=
 =?utf-8?B?UHBGSzJLMmZNd0xjZTJNdW1UUlJxMEJMT0V6dWtQdzZjWkdZbjh5b0x6ZFR4?=
 =?utf-8?B?S01ZR0RDTHRrb29nK0N5Mll1eFQwYmsra3owTm1OMU9vMXNLRS9SM1U4c1lF?=
 =?utf-8?B?R0ZMbzlHQWJ3NURIZEpoRzdtU2FyaTJYTGp0aHg5TURVc01GODFDMUVnb1lp?=
 =?utf-8?B?eXVuZUIyclNEd2R3Z20vRG5FZUkxdUIrZFNFelhJN2lDWHFyNWFTYTBack5W?=
 =?utf-8?B?QTNhRlVIYmNzWkZ1ME5CZVBXeXdXWkVaNWZ4K3lRcTVmRXcwTkwrSzczS296?=
 =?utf-8?B?blRyYmJmM3htK0FSOVNnWEcrT0RIZmp0S3pHcVQ2cVYycFduY0V5clk1Umcz?=
 =?utf-8?B?d3NmWmFDWVhUSk9wUGo4V3ZGTVQrUDZpd3VkMCs4ZVh0OTlLNG5ubWMzRWMz?=
 =?utf-8?B?NGN4Wk9uYUdtcjdiK0pvNG1lSHQrTlZTTnlhWlArSTAra2JmU3JBRVhxT3lG?=
 =?utf-8?B?a2k1VmxUV2xYK3VWM2U1MkF1TTVMcmtuOGpMMWFsVWRnejFmamZkejdRbGpo?=
 =?utf-8?B?Nnk2Y1l0b0Zzd3VBWFA5cnhXNHFQQjM2N0h1YStDOUZIRXJwYmR1NXBzSG0x?=
 =?utf-8?B?U3lEMHFsQndwMGtCWUVqM2wyUTREWTlYVzVzbzhZdzJwcGtOT2h2WWhsMjBs?=
 =?utf-8?B?dU9lTkwyaUhkTitVRFlLQ0FLWXBuSDB6RnJlQjZKaFFKQUdBWHRRZFVsc3M3?=
 =?utf-8?B?Z0x0WnN4VThmSlc3aUY5NXVodk9tUDlUTFgrRG44Zm5ORWp1UFl0M1lqZEJu?=
 =?utf-8?B?RWk1MUpTRTB5V0FMcGMxVVdkanB0Y1BteWJnRkFTWFlJc3RPeFkyMVdhRmFr?=
 =?utf-8?B?bTd5TkFqVFFjL09VVmNreFZXYk0xeVpvWUEwaUwyam5LQTYxTVdOK1JXczBr?=
 =?utf-8?B?cStxZFp1cVEvbVAxelpNWks5eXpkZFQ2c3VsWDN1WWtHSytudGlWYjdKdGVP?=
 =?utf-8?B?WENlZGxTamwvL1Y1LzJreGdFcWZZWXFsNXB2aW4zWWtuWkRoVlp4NWloWUVG?=
 =?utf-8?B?VkR1ekpQek5pQ0hHQXY5RURzaTMzOVFQS3pIQnAzc0RIU0VQQjlFU3o1YldT?=
 =?utf-8?B?eFc2QnRFNFJtVUZuajd3MVJxWHM4bUtyVnBydlJscm15OUZkZmowUjEyTmVC?=
 =?utf-8?B?ejFWaGNLaEtydnBUcSs1aWx4S1M4S2kvUUlKUU1WS2I2SU5ZZU94WGx0dkdt?=
 =?utf-8?B?NDhEODIzNHdqU1VFcjBVdTEyYVRhb0tMSTZ5UEg1SU94R1ZoRWNZeEF4b25o?=
 =?utf-8?Q?tCTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWM4RGhld1BnM0hGcUkwNzNldk5NZGJqcTZRRXpvLzJMaXdaVjJlY0RJbkpG?=
 =?utf-8?B?NWxtV1ZLM3MyNHQ3RnNaSUZmRFBka0dwdVdJUUFnRWJaYm5SRXZrbGEvTUdG?=
 =?utf-8?B?TkxVKzNnZVAzTEJuT2Y0b3doZUovTXphOXBGU0FxZTdtWVVoUjJveG9qRm5G?=
 =?utf-8?B?Nk1URXB1WHBWc1VyRkZYUmJ5NlpCZFBqWTQ4UzRRdFJtUm9UdmFQa1B6dU1Y?=
 =?utf-8?B?Y0gxMkFxalkyZWlXSjAxUCtNaG1NeWxIS0gxb0twUWN3dmFwVWpUS2luV3BE?=
 =?utf-8?B?aGw4SXVPWFlFSzJKQ0YyNmp3VzFTYTVnQWRocUR4N3A1L0RrdWJVbGs5MDRN?=
 =?utf-8?B?NTBaOWdpQVpIOGxQOEdWVGJNNWFpQk1DbzZiOGZLdWUybHphakF1d3BycVdY?=
 =?utf-8?B?YndjWTJTcVIra1R3R0FvM0QycUpHMUdlMnhMeWlOZmJ5aTd3UmdXRUp6dFVa?=
 =?utf-8?B?UkVVb1NiZmE2czdTMnhXVWVST3B1bFQyTUJhczFaTmpFdXlvSGJORFdpdTFn?=
 =?utf-8?B?K3Q2dmZ5eTVnWXk3Wit2T0N1MXNtZnJDb0RlSzVWcWxCU09ENE40NnhMTFQ5?=
 =?utf-8?B?Q2lOa2wrK1NWUTdoUnNSZEExKyt4QWhMakNMVUpkd0RlOVBVN05SN0FEWFZs?=
 =?utf-8?B?ejhoRTAyaURZaTZYd28vRGR1UmtsRHJwQllIa3h6dUJmQ1RaN0NPTVdEOWdM?=
 =?utf-8?B?ZmZYYzc4bjlMckkzTzBzM3REbHp6emNidUtxSzI4VHlGU0plcDNENi9lVzZY?=
 =?utf-8?B?RjNZdXpIV1VmdmpkRkkyRzRYaU9jN1JXSjV5TjVxeFBFaGExK1NNSjhKQmFG?=
 =?utf-8?B?M0VGbFIzQmRvbW9yT0J6eGpPaysrSllmZGUyV29ub01hWkdsWTMyd1pVQ3Nm?=
 =?utf-8?B?cGZUU1RoNmJ6cTM0SisxS1dlbThJaVU4SFdCSk41OEprNTJvRGdFdXJtM2p1?=
 =?utf-8?B?dmllQ3duZkFaWDhKbDhTWXduOW5MaFhhTjlLckZ3WUFjUit5aUMzcldQOGRv?=
 =?utf-8?B?bGNTREtzeVZEWmdqZTBlVWkvWllVM080WjVIQzdNWjJkMHhjdm9kYnZobHZm?=
 =?utf-8?B?RklQWEhXcVA2S3UwQUVOYUZMNGszd2c0Q2xSa2g1TFBxUitQTlNLb1ZST1Mz?=
 =?utf-8?B?L2hmOFNtTDZkWVdZdTFaRzV6RzgvY3FLd3pmZGF4NTlCVDVxODVrK0MxVE5p?=
 =?utf-8?B?THF0bzdWcDE4WDdGbDIreWl2RTRkT3hhVjJJR2M5dHVsc3EyK1BKK0k3N1cw?=
 =?utf-8?B?SGRmaGI2QkZ1QkhwSE02L0tMbHJZemN6Sk5jclJNaXZMQ3pmSnRhUHdRNEd5?=
 =?utf-8?B?WFhQU25lWmc2VmFTZDhaYmFWWGMwcG5qZzVXV0ZjYlo4Y1B1L0lUdE9wVVdp?=
 =?utf-8?B?S1k5ekw1Q2c0Q2ZUK1ZHTGF5NHFaaVIwTUNzbTIxeW94dDNwSDN0QWRxdTdN?=
 =?utf-8?B?cVo0cTB4T05Ud2t4Z2dNZlkrKzlvdmw0T28yTnMzUFZKQ3VGQk5tTE5kb2pO?=
 =?utf-8?B?U2M1VGJwWGVZYTdOam4rUDlpdWk4blhNc1Q3NEEvTktLNzl2SjNnNDUrWDR3?=
 =?utf-8?B?TTg5RXBJSUtGOUlZU25vYXBodVQwNzNXVHVyb3VSZzU5azNDS1NSc3Y3cGJR?=
 =?utf-8?B?dUUrclp3V2dvbnVyRGJicHQxeTRla2h4YTRLejlGU2dMYTBNL3IzWVgyaWVV?=
 =?utf-8?B?ajkwZ0tIUXRiajlkNUkyRFd0eE5VZU5RU3c5T2xPcHk5bndmeHBBNzMyQlVo?=
 =?utf-8?B?NFY1L25NT3FOSkZmM1JVV3Vmc2dEN1JtOVUxcVJ1N0ZwQ3hvLzgvQ3ZvWmts?=
 =?utf-8?B?K04rUkRCUlh4TDc3UktMQkEwUFRIc1dEYW5abHk0ckEvam5KQlN3NjQ5UkFC?=
 =?utf-8?B?Y2dza01ZN203a0t3YWwxMTFWa2RKOUVYSlBpZExLei8vb1hQR09POXNoZXVW?=
 =?utf-8?B?L2FlMk9TMGliNkpUUzNrNlZ2blZiT2J4dXJtNS8yamgrcTlZZXFiS0dQalpJ?=
 =?utf-8?B?K3RBeEpCb1p3RGJ4d2RlYkpCcjFPby9aZytsbUU2UFB0azBGaUdnVFpJQVlN?=
 =?utf-8?B?RWxPZ0E3N2I4RnlsTHVLN0VoMVpNbjJOYXVIK1NwWE1PcCs4Um8zMldraVV6?=
 =?utf-8?B?ajlwWEozdWlnME5nR1plWkhzV2d5aGx3NmVINFJWMVVHOE4wUnlDQkRxMjdk?=
 =?utf-8?B?ZUlFaDU4eTBta1pXd2lNb0E4MzcrSmhHYlZiUlBBL1l5VUYvMm9ZZlpzNW5W?=
 =?utf-8?B?SC9JWE9SUlBRemM0YUd5RWJuQVUyakRJSjRlTjh5NkNDVWR6d3BtejlKMUw2?=
 =?utf-8?B?SnB3UE4vU25sRzFpekRjNjZTaHdNTjY0MEpwYUI0bFBiVEhzeGcxNDNJVnA4?=
 =?utf-8?Q?YlrePHDRTgMWRqLA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1372e2-82fd-4476-de88-08de53e0cea2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:50:13.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viipiazlUmtnfeZPwcu7t0dkm3F5VNOO1FsUo+QCC6YPEUKfnoXa/b/Js8zdpiOy3YcoUfrxSA9kesd4Qju5TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 06:40:42PM -0800, Andrew Morton wrote:
> On Wed, 14 Jan 2026 15:51:16 -0800 Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Wed, Jan 14, 2026 at 03:34:21PM -0800, Matthew Brost wrote:
> > > On Wed, Jan 14, 2026 at 01:48:25PM -0800, Andrew Morton wrote:
> > > > On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> > > > 
> > > > > Reinitialize metadata for large zone device private folios in
> > > > > zone_device_page_init prior to creating a higher-order zone device
> > > > > private folio. This step is necessary when the folio’s order changes
> > > > > dynamically between zone_device_page_init calls to avoid building a
> > > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > > must be passed in from the caller because the pgmap stored in the folio
> > > > > page may have been overwritten with a compound head.
> > > > 
> > > > Thanks.  What are the worst-case userspace-visible effects of the bug?
> > > 
> > > If you reallocate a subset of pages from what was originally a large
> > > device folio, the pgmap mapping becomes invalid because it was
> > > overwritten by the compound head, and this can crash the kernel.
> > > 
> > > Alternatively, consider the case where the original folio had an order
> > > of 9 and _nr_pages was set. If you then reallocate the folio plus one as
> > 
> > s/_nr_pages/the order was encoded the page flags.
> > 
> > ...
> >
> > s/best to have kernel/best to not have kernels
> > 
> 
> Great, thanks.  I pasted all the above into the changelog to help
> explain our reasons.  I'll retain the patch in mm-hotfixes, targeting
> 6.19-rcX.  The remainder of the series is DRM stuff, NotMyProblem.  I
> assume that getting this into 6.19-rcX is helpful to DRM - if not, and
> if taking this via the DRM tree is preferable then let's discuss.
> 

I would prefer to take this through DRM since our window for 7.0 closes
earlier than the rest of Linux (typically this Friday), which makes it
easier for me to merge the other four patches and include them in the
next PR. If we can't take it through DRM, I'm sure we can figure
something out - new as a maintainer here, so still figuring out all DRM
flows.

> Can reviewers please take a look at this reasonably promptly?
> 
> 
> btw, this patch uses
> 
> +		struct folio *new_folio = (struct folio *)new_page;
> 
> Was page_folio() unsuitable?
>

The compound head might be pointing somewhere else here, and we are
trying to clear the metadata from new_page up to order << 1. So we
explictly do not want to use page_folio here.

Matt

