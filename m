Return-Path: <linuxppc-dev+bounces-15592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDAD157AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 22:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqmHW6sNfz2xQ1;
	Tue, 13 Jan 2026 08:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768254567;
	cv=fail; b=omrgev0OPk0hSCvbuUvfJoAATfTReKQLvSKUji6s1iPJH11BY9LmH6Gj/xqJGcK8ZbsjuicZIErMTHanVpLifG7TCamtYHmKL7R9OODsyhAyyMY5lWWCL6wmhzI+vBKqfWDfFNZGWbFRAC95ej6LhRmOu+s/ji9261VHPASNiPACJq+1WN+eNgbcAfSqXiN8z20qmLwQ1rvoDYin2VPncLIypTzWuZq0xYY9YoMFrMwyoH+7JmL0dkqNIE194SCnEDeY0Sq/krnVjSFF3KKUyomDg1SdAjCSRG6ILLCYZ9tcyvdLUb/UZo8PlKarlXiG98D5ugrTka0WPQfkbeMahg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768254567; c=relaxed/relaxed;
	bh=3gf7gS8MN78DTwNkidfk8NCAjqjq7LgpocC4fEYsTWE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g9+x5qh+NYluWuPMhm9xd3urswIOlvm2wIv34REzFPxyV152Ljgcb8voLZ4rpqNrFe+g95tvu9VCtVdSBa17AmVPIwwJ37qEUDsy1cnSC7zWCy5W0DEHPXi8BriVbQj/4g9tjWhrNANh+lCUldedEZAGmxVQW3zUGVqByWBX8ZveYNQ4RQbt7IDkqYUeN6kwR4fzNJFVQrurb1KLcQLHe4m7F3Z8aEkuHc8P+maeEaLVWIvRSRpl1rnqn65854tvCB4u2YLbQojNi6XjWhdgATF/RItoMc5DNjhV/XWCgnW5chM71hR+nDkylVoYxq3thfnw4pfqI/+DQK7Vkf2cRQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JG4MADHX; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JG4MADHX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqmHT0YrHz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 08:49:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768254566; x=1799790566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lJUDYuifFDOp0nTavawJ9jkmIRDNWv73e2nvefKaNIQ=;
  b=JG4MADHXmVUN7uOnfSkgJr6f/WwRELqa1OsiIA9+e9zry/y1gynJk4TM
   WHKj5NMoNfplCPsMi5W6W1Y53qsz1Gz6E6vt8qXDqtPJcPtb2bXMMvwsT
   ASteV8+6hBoz2N6W9QHuI20GeNUzOhkS+6BYeCsleHJE3Y8c/BA93N5cL
   pryqLQKxGgoN5YH0hFMvg3jO88yahTNCOpsasbIp/AY0K2wPDjxYk1cAK
   a5klaSsuvrmvCoDbV04bTL+cbjHZ7FnHnlbUjl86qpU9x0MOX+ewl+s1V
   SVThQbomlBNC7GtJJ5aiEm5Oy7VTTVg3F9828bvjzjH4kHMGyN9UO557x
   A==;
X-CSE-ConnectionGUID: Hr8H5I2hRayTrYRgANE5BQ==
X-CSE-MsgGUID: iWcFQhGPTjWnOrJRUoe5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80644258"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80644258"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:49:20 -0800
X-CSE-ConnectionGUID: gWGb4r7gTDahwTxss8fvAQ==
X-CSE-MsgGUID: j/CkvE4JQSO44HS5oDl9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204488313"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:49:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:49:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 13:49:18 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/LByUaV83xF8WwvZ6BIn1nP3YADMEVr8YI+N7rQj0zXklN5XhjvxX39L0Y0qkPUEO5zBhUnIaX4rQWpXxHx4cVGvJdjKRTuHddeaAKiKgaLeNTlbG6nDMB9I6XqGFeuP1N966IU4S9e0HQzJLelCVdKk0qcvgDgLI3e4JsuovAlNAes1mF6qEkK2T//pmBo5jbYPFnTKcKzutkp42FiWlaBuiO7k9FBeIbYkltpozkm9fwLC2Spm4R+kUMav2kbqWy/2bG5RkR7q8/DsYjwbZpXfncxcLGBpymuz7U/OR+l826c9zTfgOLWZE2TGP/DGmCbOflUSggAVi8DIMScLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gf7gS8MN78DTwNkidfk8NCAjqjq7LgpocC4fEYsTWE=;
 b=i0ZNDuBzSTFOmyIT46lFMcWiodgttThGIrrE5ZjRXQ2ki31rfB8ORE2spTEaVtq+SB9WOIDM/Z4xjrByYcaMMoMV3SrcGMDXWvolh8dKaLEIyyRWGWUhp0QgTGWtxnG5cLNTmtq/2hnDyQhHjZZWj310yekPw+Yp3HeaVgmhELE4CYIcKJ5tHn8YyF3hDD7WoGJS4yx+pUKAWkvDh8oTDyzGJkrSksRNBhqvgogGhlynMLYI7uTg9v0Np0iUpNotBeLdzMjBg2noDoLMvVOp/BGCBFP35fuoaBD7Q/fL0gnwfZkt2GsZWnWLcg9Y+HChioUgQjLUfljqBXZKEEXd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 21:49:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 21:49:10 +0000
Date: Mon, 12 Jan 2026 13:49:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Zi Yan <ziy@nvidia.com>, Matthew Wilcox <willy@infradead.org>, "Balbir
 Singh" <balbirs@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	"Madhavan Srinivasan" <maddy@linux.ibm.com>, Nicholas Piggin
	<npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Alistair Popple <apopple@nvidia.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112134510.GC745888@ziepe.ca>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: e49691ec-661c-4b70-be61-08de52246b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19052099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU8vb1U2SFlHUk84RG12TUZHM3BUKzdkNUh1dnZEbVZZT01CNzVNZXQreFFY?=
 =?utf-8?B?UmZNbXhsWm01dVpNYmdSbWprOE1RYlZaYlR2NlFiNWJKSWt4ZlY5cjRjOStY?=
 =?utf-8?B?QzJ0MTZVOHpSUmEvWEE5Ri82QkJmbVhqSXN5Vy9xOWV1eEtqOURicGFVS1B4?=
 =?utf-8?B?OVJFb2VETm1FZXQyOUs2Tjc2YkRoU3ZnSkdVeUZzRlR1cnQ0bFIrVjg5aEZw?=
 =?utf-8?B?NGlXdUQ5U2NLd2NpKzlwVmZISjA5bUhOa3ZJa1pZQzBGYlpuUmFBbXZUdW84?=
 =?utf-8?B?QkdwdFNLUkRZUnJBN3ZMbzJ4cy9qMWhWN1hXQSsxb2FlcTBMbXRhNWU0WE5p?=
 =?utf-8?B?MlJmc0w0N2syVWRQU2k3bzNwU2lWZEY0Q0xLYnNIM3U4S2FDTlRVVmprK3R5?=
 =?utf-8?B?a2crMlRyQkZkcEFNOVlOVU44c0dGREdVbHVPVkRMZUpmVG5XdkNtWkNyaHpS?=
 =?utf-8?B?c2wyRDVFclhqbU1yVFJKNVVXY3ZtcWVLcllvSmZwSERDM1poYy9NWm9nSXQy?=
 =?utf-8?B?RFNiMUlaOU1CMjJpMzNUOE5kS1lvN0xxeUZ3VUJIZVJwTTl5Mm80SloxNnc5?=
 =?utf-8?B?VUhZeWMzWmlDV2pTeTVldGMxcVlQbllmakVDYUlSaFhyTndkUVkvWDloSlFJ?=
 =?utf-8?B?bHFteGN4ZnNEaEZwN3FaK3c5NXZJQ1JBVS8yYjhmTnFValNMNXg5aTRrOUQx?=
 =?utf-8?B?MVRWVGRMa2tYeEZiaytrUzFuNzZhbnMzQnlJaDZTcWF4a25RVWYzTVZnRVAy?=
 =?utf-8?B?dFpJOTRGblVmZ21QcitNL0JnTE1mcysydS9Vd1MzSW54S1g1SG1CTGs0aFcw?=
 =?utf-8?B?Z1d4cmdiN0d5ZHVET3VodTRoMVVYWkpMRlJqbTcrcjlCRFJXTEpmUGNER0JP?=
 =?utf-8?B?UTJrSHBuclNrL2h4ZkUwMGtDMi9kcTF0QWwrNGg4MmFCZjNtejBHK3R2ckZ2?=
 =?utf-8?B?ODBTL1JhYVFoMTBVQjl3R1BlYkJObTFNL2FJSXF1aVhpWHQ4OUg2SVRBVlZ3?=
 =?utf-8?B?eS9RYXEyL1MyMXRBYy9VSEpkY0xKOWQwaFRVVnlwZVJUOWszT1hIdnAvdUNX?=
 =?utf-8?B?R0lYS1hPUXM0c0VXUTQwcDRjVlNheXNlR3pJdmZMRGxjT1JFNHV6K3JQMFRv?=
 =?utf-8?B?c3VLRGlJRFAwU1BURUpXZ28yWW9UL3QwWW5mVVBsbElNR2o4T1pFMEVGc2xJ?=
 =?utf-8?B?YXlEQnpDZ3lxY2UxbGlNZHVLSVdubmhyK1BENXB2SFhZZHl1eHk3OXUrcm1Q?=
 =?utf-8?B?NjEvRldjSTdpVmM2UmFVbUExYndwc1g3aHhnakZlZmZjSmdmaXlsRm5laHpt?=
 =?utf-8?B?MUtBbm5aSFBtdXErWnpvL2RwOTZpbFJkU1NDR3poWmRlTExBd3llUk5LaVZ0?=
 =?utf-8?B?QUsxRWlXeTB4RWJEejZ0bzZKYW5IUmhhQk1kM2VYRkx2c3hQNDB2T0NnRVpF?=
 =?utf-8?B?NmNnaldpMFhOZnV0MVNpQ202cTl6K3dVZHVnaWZTNFdubzNWYkExQmtBcDhJ?=
 =?utf-8?B?SVJWWHE0dkxWZmRPd2NGbXM3bUk0QlRUN3NQU2JRNEo3dm1zT1dSbG9qcXZn?=
 =?utf-8?B?MVVOVlNDaFlMZ0toTU95UUl0ZDhLN1hnQW14VXJObStlNXc4d25lN01EYW1o?=
 =?utf-8?B?OEcrOUlvTVJMdzFjdWpZbFdUZmxXMmtQaEJnK041NEcwM3RtK01vZnZoLzNC?=
 =?utf-8?B?SGdQL1hlMDUrQWRpVTJsS2ltYkNnR2dCZTZFRVY3dUFHL3gzN2VwcFBhUW5X?=
 =?utf-8?B?alBqUWFNbFNONGVuRW5zbmFiR1EzakxNbEdLc0NEdnlaalYyWHdXYVdaQlRX?=
 =?utf-8?B?a2xJQk5DRnMvL2szK3J4TkpkNzN3MFkycjBvcjhEZEV2ZTR0enJqRzFSeFNa?=
 =?utf-8?B?NWtyeFVmbHdZTGZEVTdySmhtT2k2M3ZUNWRvZ3Zyc21Qbnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpLczUxNzh0Q1llQm16c1BYdGd6alhia3RxbldyY21vMjU2Z1pIaUxCdmtZ?=
 =?utf-8?B?QjJlcW54L0VmWkNoMDBEcTFZdllYUm16bDQzeDErazR3UGx2c04xTVRqckhD?=
 =?utf-8?B?ODdUcExBRnN5U3NkcEJlODlXVjJISktrODVnblhMS05iM2h1SDFTckZ5dnkx?=
 =?utf-8?B?a1BwWFJ5OTNoeHI0aVo1LzJxMWhkb0FqNEpLMENpbFY3cy94MDlsclptM1Rw?=
 =?utf-8?B?OWJNWmhlMXk5UmpWdTRNVldyQ0tvc2N1bThOZUxjSkRhc1M3K09DTjd5MXpB?=
 =?utf-8?B?ZmZoSUMzQjlJa2YxUG10Q1FTTm5mYTNvMXhaWE1YK05GSjRiZDlUODhCMllh?=
 =?utf-8?B?alN5QmdTbE9veFFIWlpPam96dDZvUlF6bEd4ZXVJRlZDRDFYQTMxa1FBMUpx?=
 =?utf-8?B?MDM4ZHVRMWFRWmdydFRYd1lOYUJ2cFZHWnRYWHR6Um44aDFEQzhDODdLcFFR?=
 =?utf-8?B?MkdYL2ZQZU9jQWNKRU40SDNnektqeWhWbUVaWmdWV3JidE5lUUp2S2ZNcG9x?=
 =?utf-8?B?UElDRzk2V093dmtiSmx2MGpVZWI0VmNlN3RJN2x5Uy9Ob1ZUcGZjektPcXRK?=
 =?utf-8?B?SWw5bUVWTVJBeHkzbXRmNGRUb3RYcVgrR3FMY3N5K09hREFhUElpb1JGd296?=
 =?utf-8?B?YlA5RFZxcjRwLzBYbHRVRFFoUjd4TXZINnNQUDBCTi9LR0xGczg1c1YvTFoy?=
 =?utf-8?B?OVpHckM1RUEwbHBBTytkdGpQWno3UWxGdzJwY3Fya0hENE9xSnBNSmFxcFBU?=
 =?utf-8?B?MERINjVWbE9renZQSmdYc1FIZ3NWUXhpTGR2TUp4QzM1VDdJZDJjU3VLMytq?=
 =?utf-8?B?b2l4SkdSNVZnYitha0tXZi91Y1VTc1V4V0NNcEwvMDM4Qk5ZRWdoZElLWXF6?=
 =?utf-8?B?RlMvc2FSRkRWbUl6TEhyY0wwYzVPRDZ3eTMxSVBlN29YUkYydThpbzFyaXky?=
 =?utf-8?B?SkFVMWlXU21EMkVObjdmbUw5Y01KR1VsdnZJZGNJS1J5V1kwTU5GTC9KS21X?=
 =?utf-8?B?b1ByQnBaRHNGSVFieWZxLzI0UFd2UitWTkE2dXNKdXVGbndlSHdEVGZvWjBm?=
 =?utf-8?B?c3pqc0FwQzFQdmN1akIyNTQvbWFCOWdzdVhpMkorWHNaZmZkb2tBZURnVDda?=
 =?utf-8?B?SWZ6amx4emswdzFwT1hqTTZMdC9GOW90b1dJU2F5L2FVclljR0czRkV3Q1RQ?=
 =?utf-8?B?U2lFamUzYzVqZE9ibGdzQzVvU0VvZnp1amhQWkV3L1NPZ2EvYk1jTkFodmZa?=
 =?utf-8?B?OWkwdzErYnFwSk1nUnl3OUtiMXJORWcvL0o4cHkvTERCQXNkTVIvWW1OUkVP?=
 =?utf-8?B?MVF4d0NqM0NBdVM5QzRZVVA2eUI1MmoxdHBUOFB5aU5WLy9TdlVBRnlTUDR3?=
 =?utf-8?B?b1RVQmIrbTVDWUlKZjR4aDdUU1UyUWFCNitwcGxpUGl4NmNtNFlhU3RvTC9p?=
 =?utf-8?B?RjFOeHVIWklCWTFyN1pOU25RYkNWdVBjenVxbG5ieGg0cnNDRFh6Q0VjcTg4?=
 =?utf-8?B?MSt6dTNMOHBnZWxPemhtbkxtbCszR1NwYjhzTlZwSXZCdWV4ZTBQaDhXa29B?=
 =?utf-8?B?WG1zVW93MXhGV1pvTXZ5MDZNZS9JZDJpaUxRdnh3bkVLeGsxMUR0WHJZbkRY?=
 =?utf-8?B?NXV2SDlyZUVJZ1E0WFZZUndRWlRCdWZkbmJzRVlDTzB5Vk9RSWV1Skt2bDdX?=
 =?utf-8?B?ekc5WkpYOWhXcUZUVWx5UklkaGRLbFVnWWltVkI2TG85ZUUwNWphTGRUUlBE?=
 =?utf-8?B?N2xZYkNqQ0pKUmFxOVNwcUQ5VVhwQldyd2VVRlpvRlhCdkNNeFV4UktzV1N6?=
 =?utf-8?B?K3NNYnQySVhrY3lFTndocWVrb0lUZ1oyNE5kMHJxZFJWV0R4SUxYbVVrTC92?=
 =?utf-8?B?ZnQwQXplQ3hKNENMdE91VlMvVi81NSs2QUdwT0lTRkovVDB2Q1hpQ2V4OXBj?=
 =?utf-8?B?OFdZOXhOdDM2ZUdXV1VobXgvb3Z0YTNiTjE3UFdOKy90a29yeVR4SnIxVVdk?=
 =?utf-8?B?SjFRV1ZmajBSMUFMR1gyT3Q1L2tNSWI4aVZnZGNvbHIvQXN6VkdqT1hQVmNo?=
 =?utf-8?B?VHp6Uk5PTVplMUJPcjJyOWVYc25wK1dQei9HRVhpV3dPUHlBMHdzN2NmYlBt?=
 =?utf-8?B?U0dNMk4vZmhyL0Q1ekV0Z1F3MHFnVEVRNlZKVFBVdU1zTk5LdzhlMkd6bDJE?=
 =?utf-8?B?cUI5L2FPU3l6eWZsL0FUeTVlQzhvWTh4amFFSXBBd2xVeDBPaDJMcjIxMlRr?=
 =?utf-8?B?QkhJY1FraDBjd0l4WE5wK3VaYi9aQjEvSjRUb3ZuZjY3b09VSndFWnRmK0Qy?=
 =?utf-8?B?VWdLazRGTmk1L28ySkJLV0Iza3dodlVZOGJmV0dlVXNYM095TEdrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e49691ec-661c-4b70-be61-08de52246b00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 21:49:10.2517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDQvTYLPJYofYPPZOUw7s423yNg5zgwKhyJVMa1HYyhimEfbahqrW3USfvDyHV3hhuIQLgWCqowgPvkRPGLl4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 09:45:10AM -0400, Jason Gunthorpe wrote:

Hi, catching up here.

> On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> > On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> > 
> > > On 1/12/26 08:35, Matthew Wilcox wrote:
> > >> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> > >>> The core MM splits the folio before calling folio_free, restoring the
> > >>> zone pages associated with the folio to an initialized state (e.g.,
> > >>> non-compound, pgmap valid, etc...). The order argument represents the
> > >>> folio’s order prior to the split which can be used driver side to know
> > >>> how many pages are being freed.
> > >>
> > >> This really feels like the wrong way to fix this problem.
> > >>
> > 
> > Hi Matthew,
> > 
> > I think the wording is confusing, since the actual issue is that:
> > 
> > 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> > 2. but free_zone_device_folio() never reverse the course,
> > 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
> >    be done before driver callback ->folio_free(), since once ->folio_free()
> >    is called, the folio can be reallocated immediately,
> > 4. after the undo of prep_compound_page(), folio_order() can no longer provide
> >    the original order information, thus, folio_free() needs that for proper
> >    device side ref manipulation.
> 
> There is something wrong with the driver if the "folio can be
> reallocated immediately".
> 
> The flow generally expects there to be a driver allocator linked to
> folio_free()
> 
> 1) Allocator finds free memory
> 2) zone_device_page_init() allocates the memory and makes refcount=1
> 3) __folio_put() knows the recount 0.
> 4) free_zone_device_folio() calls folio_free(), but it doesn't
>    actually need to undo prep_compound_page() because *NOTHING* can
>    use the page pointer at this point.

Correct—nothing can use the folio prior to calling folio_free(). Once
folio_free() returns, the driver side is free to immediately reallocate
the folio (or a subset of its pages).

> 5) Driver puts the memory back into the allocator and now #1 can
>    happen. It knows how much memory to put back because folio->order
>    is valid from #2
> 6) #1 happens again, then #2 happens again and the folio is in the
>    right state for use. The successor #2 fully undoes the work of the
>    predecessor #2.
> 
> If you have races where #1 can happen immediately after #3 then the
> driver design is fundamentally broken and passing around order isn't
> going to help anything.
>

The above race does not exist; if it did, I agree we’d be solving
nothing here.
 
> If the allocator is using the struct page memory then step #5 should
> also clean up the struct page with the allocator data before returning
> it to the allocator.
> 

We could move the call to free_zone_device_folio_prepare() [1] into the
driver-side implementation of ->folio_free() and drop the order argument
here. Zi didn’t particularly like that; he preferred calling
free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
which is why this patch exists.

FWIW, I do not have a strong opinion here—either way works. Xe doesn’t
actually need the order regardless of where
free_zone_device_folio_prepare() is called, but Nouveau does need the
order if free_zone_device_folio_prepare() is called before
->folio_free().

[1] https://patchwork.freedesktop.org/patch/697877/?series=159120&rev=4
[2] https://patchwork.freedesktop.org/patch/697709/?series=159120&rev=3#comment_1282405

> I vaugely remember talking about this before in the context of the Xe
> driver.. You can't just take an existing VRAM allocator and layer it
> on top of the folios and have it broadly ignore the folio_free
> callback.
> 

We are definitely not ignoring the ->folio_free callback—that is the
point at which we tell our VRAM allocator (DRM buddy) it is okay to
release the allocation and make it available for reuse.

Matt

> Jsaon

