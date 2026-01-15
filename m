Return-Path: <linuxppc-dev+bounces-15765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D66D22865
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 07:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsCVL1fJkz2xrC;
	Thu, 15 Jan 2026 17:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768457930;
	cv=fail; b=R2e0rfzK3MSsg7Qc7aurM0VJbox02NMMYbyDBzrxDypDFActWIJW5UJGEK+FQlSwC4xDdI7kmj6fmrAVwzIqyRWhdYfSxhIY9raIeFXBqaBTeIVqxp5e2HUIR8r5R6VBCR2j324dYaQz++RG6fn9Am7Dry/kSyOfcGYl+O8t9vYcCzDy/J1asr8oSLI8GiKsmqyxQ8E3IKcYdkWVMKTJBlM5niHDMcmSk7X6D1PcZJ989fB+USpFJaUOoDzh388EPQGjCOP9WDo6x0i/Fo911LfLdlbB/GsHxlfvUHiOvsV1Q5Y82KNAOe5EqfmJdeOvxb6iNRX8THlPs1liWFOjow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768457930; c=relaxed/relaxed;
	bh=HbHItWup/RRXoaCY27KPQ7sJiy4jTLj9qx0rPveuAHE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lwa52CdgMs+2vsFwoDUin7k/KMujTMZ5L9glzCSDlBbZJtR18+E/TJNhFkLSaDKbJYTS+HBKsiSdHc378aEdxhBWaZ+qRVE59IO8PRo2gqcwzAxM0RB+b8fXetpP5NBx1Zd/NZ62G0rBU5RURpLd8nrVhO4iUyrkwiS++Yaik5WG87tmSkKGZ8nd0ZIgMaBoQRPbcpd0O1GwQn9x3NbsXX2H1GJKS2q14G3k2PCSImD3/0HlCYb4TgoKrW77qw4rtJc2Ec5uLRmNNrHTmVDQ8O+zygduQfb/h8paHmh+ZAUl5fCcSLgAHtaflgSzF5xgmX6A1JX0noA1M0bLEcJJzg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E9G08BzL; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E9G08BzL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsCVH22xzz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 17:18:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768457927; x=1799993927;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C1wwCFKEbd7oq7gtV7p+/p8SbsD1zFTs3eVDEgo0m9k=;
  b=E9G08BzLpGaC8vUcwjUTT3OhOkinIo2E7ydwYVWs7kOLv2nbfmFUeepJ
   aLv2WNB5orlfanxhI4dn0p+VP+NCxbAH+6Md870UeZtw8YOFGT+GfRt+D
   m4moRJGPBKGuYbtDxNzU0BS5MFhXByVGgXAKIn9z8V5kkvD2qx88YlZDv
   fJoK9ck9emXmpz/D/eoMqfVPGkL3mWOwoTPk6Y414o4R/X2ELq/Ld91ax
   c/0+UI6ivVUg7i/GzvdeSrOcVzTqN71IG5WaLyRuXL6HDjKs+IXAKqGeE
   KoGrR9AdDksu4jZpygtD8XBdxC0gvMPThndl1/WhPgwrB272nnmBNkua8
   A==;
X-CSE-ConnectionGUID: OZ04XVmPQ+CfVqtsiCeGAQ==
X-CSE-MsgGUID: 34g/jEeUQdGjwDWh+UtjWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81206829"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="81206829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:18:42 -0800
X-CSE-ConnectionGUID: aV59PU2vRVSgwdJIWEBZEg==
X-CSE-MsgGUID: JUy+odj0ThiQ46um/JADHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="227962956"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:18:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 22:18:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 22:18:41 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 22:18:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvLfDfUejTmdxCRYsLWeZ3tHhYRa+iHhp/i6p7bbgVlCF6nxwVq3d9L206LL/CafKRnIkev/XGrgXxdpBrGPbWF7PYymYf4sAVqwjkRq/11Z8fm30ek8moJMegcZbCRtUBdGKfxpwsfk47NM9EEvt4L4OcWH3PCo8GhIdkJd2oCWxZtmZa2DeWM4V/v3bWIdaQiUiFS8oMSRZntSvLq63d8ivZP+0ZfUF9CNqjHjgDEKxC0LyHHOBiWA1VeTm0n2AGMY995Nhy39LIQAutjBkmZr7JIlyQG2ch00jc5PJg6sqiN2p8wEzgdwWzK17soH48movV0rj3F6BzfYPNE9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbHItWup/RRXoaCY27KPQ7sJiy4jTLj9qx0rPveuAHE=;
 b=KOXIIiwMz3PFQucckSlAwWnvQTakhewknWYgVnaLqb5f3/XMhn//LWOWJ/GPQ3uf28aaYcve02W5/acsV6pJD4uAPD/CXiFlxhmGNLCFCf3HhkkKmz/6H0tM2rTaDpwANkXrnlI3B2I4c7o94h4sVQ5GXUWEzCLbh2X2jQcxBKfJEPglvT73FFGu13KcA3z0flh92bpYNjO6Lrbqf6kmWp2/kY0brQHslJUbBQLuMl5fT17qgF5x7VZ93GzaLOBgdwyEcSaRuvwYyHm89M6beQahPO74N5goZnK2+6ld5Paely/uW1NrsR6P/sxy7uT0rW6FJD6K1Rp1g1VoX9pGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 06:18:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 06:18:33 +0000
Date: Wed, 14 Jan 2026 22:18:30 -0800
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
Message-ID: <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 6557f931-04eb-4354-f428-08de53fde8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2JtS3NNQ0RRbDJwQmhxYVVKWjN6WW1mQkN5MlpBMzZoMStaL0cySnl4Y3Ri?=
 =?utf-8?B?dk1McldsdVZxVmx5WWZLTlBCUERVU0dIZ2c4TnFpcElvcUJWc21QZHFicnFC?=
 =?utf-8?B?M0pPelZveWVxWjRMVHJRc3doczhVUVkrcThqVzlwbmNEQ2NBMVphQncxYTFl?=
 =?utf-8?B?bnA3ZUZPQ0k3UmlpcDdpZVh1NDJzNEN1OGRlRlNlRUtBY2IxUUpEZDZVME92?=
 =?utf-8?B?OEcxOXhpTnR3TURZazJnYjZEcEFjZFNUdU9VbTNhakluYWVnWjQ1OGcrSVQz?=
 =?utf-8?B?bGdRN29RYzM0Q0JzSUt1bXBOcG83aUIzNE9XK3loUGNSMExLM1FOOUttcWk3?=
 =?utf-8?B?MnZTZ3FuMlZrMkE0cStFeGsvUEowdFIxM2MzaGttMzR6VjIxeFIxVC93dWxZ?=
 =?utf-8?B?SlJSVkZRZUdKM0lvZHJHbDBOaXFjSVJhNWtPTWhHTURBbkdJb3UreU13RHZs?=
 =?utf-8?B?TVp2eWdTMWZGNVJVamtzdlVjZGQwRU1Tb0doYktUL0xpemhNSkkwTk9hWENk?=
 =?utf-8?B?L1dKeGN2K3o1WlprYUtDbzEwajZZdEFHWmxYZXVEemFBUVNYQmZlWC92UVhJ?=
 =?utf-8?B?bnk2N2dVS3hOYzZIZmMvSXZCK21KV2lFVXB4akhXQmYzaUtqSEE3UUlzUzBn?=
 =?utf-8?B?eUo4UmNQZkhWQzJ1YWk2T1dmMlVCVVZxdGVrdldQNmNpNjJBd3EzanI5T0li?=
 =?utf-8?B?cXBlakl2MjQ4QTZMcVIwS0JEZUxiaGs3S0FyVm51U04rYmlDczVUUm1Nd1JN?=
 =?utf-8?B?ZVNEMVZaVEFlU1pDeXpvMWRpS3lMbHZBdVVYLzlTdGttSlR6UjRBQjBlYWdV?=
 =?utf-8?B?MUd3czk5aGxpTFBaTTdqZmxqZ0xpRE1aa0c4aHJUb0FOQTgzQU5XOXhDWHRj?=
 =?utf-8?B?VmljTjFhdVpzRlFUekhSRFFrdTcxbHhSSHBEL0thbDlQRFl1cEREZVJ3aXVa?=
 =?utf-8?B?MCszay9yUXBnUXAyTjJjTUNURHRkZGsyZ0dQOFJaTnJUS1FUcnU4ZFBuWnRx?=
 =?utf-8?B?WXFvTURpOU1wVmxqMDFvOTE4UW1pMUxWeHdnK0REVk8wcVVlMkhSVlVYU3BI?=
 =?utf-8?B?SzVNNkNJREZFaGtjVFJpaVhKUFRYVUticlprcVVHb1FDUmI1bmtOVUZSaG54?=
 =?utf-8?B?OFFRQ2VQT3VDUng2UEZtTWRlWE5jb29NeFZjOXFJV2FVYVc4ZFMzWElUdnRp?=
 =?utf-8?B?blVrZzVhcmdoWGlhelNaYlpiU1Qyb0Nmb2QxRU5SQkV0aVdHUU95QXFmY2J4?=
 =?utf-8?B?ZG1HMUdoQW1idko1ZEl0RHlJWUFNc3lIRitBUkRYbkVvK3pXN05kVDdoMnlF?=
 =?utf-8?B?WTMvTk9tNUFLRFJ2RDNEZ1Z5QWExd3V2OHhKWlpLMjY3ZTVWOTAwS2NZOG91?=
 =?utf-8?B?N0NwMFpjaGhIT2VjeUZmTHFnVGlFUmo4L25XcUdPQ3hzWk1ZY1J5WEwxTWhF?=
 =?utf-8?B?V2RubnJ6MXU0MnpwMHVJR2FqZUVwbjc5TzhXTkR2RStjOEdrMEJQTDg0YnRl?=
 =?utf-8?B?dDFSNmh3S1IzYW9uUkl2dSs0VnhmT3Nmc21wenZPUHNEWmdrYVNLSEtYTEY0?=
 =?utf-8?B?cTZmU21rWGRzN21pMUdqU0kwNE1CNjAwSlNVWjFlV1N3ZDIyanVJL0tpWHpy?=
 =?utf-8?B?Q25jSDhjRWkzZFBjVzkyYktpY2h1SEUxcmJGWFh1dSsrbXp3eEZWcm81blgr?=
 =?utf-8?B?dnE5UU5nQmJpQXFaRkVmSmx4eTE2dHIxU2RteXNCVlByb0FQRTBOMXVwQUtU?=
 =?utf-8?B?WHM5bXZ0dUFGc1VwU3lIM0ozcndQYkd0VHZwdGxDbmhRUDA0dnBBTlhCN1Zu?=
 =?utf-8?B?MUhxeEswekg4VHRoV24vS0ZDczhGUWZHQjQySmZqRndCVXJ3M3BQb084K0VD?=
 =?utf-8?B?YU9pNVhlVGdnemMycTZXbUtxcU1EWnRIOVlTRFEvMklta2JvL1QwblF3czdS?=
 =?utf-8?B?VEc1aTh6RFBKTDdheW9VZEFSa3g4cG9PekExaG5aMHN0M3NvUzFlQWIvOFI5?=
 =?utf-8?B?bzdRZjZxVTlGTjJJTE1BWkhDSmRqTjd3QjZOYUJYTXd6d1k4NU1QcWdxVDda?=
 =?utf-8?Q?YaVxUF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW15MXg2emZoYXFNc1FjRWpuSE9ueTZ0QXRWOCtjSFpyaVU4V3FMTmtOVVJI?=
 =?utf-8?B?QjZ2YmZCY2Y3RXhkK1NMQ3VnSDFPUWtOQ0NvMEdPVmF3QjhIaVNQSklwQUl3?=
 =?utf-8?B?NWQ5RlRncWxEVjA3MnErWitRUGJhbmNMNkdqWWRtWCt3cE56cVB4UFNjbFFI?=
 =?utf-8?B?TnkrelRJaHNOUEtIb2JFVmhXcnV5TzROVnBRbmo2YXhTL2d3Ym9YZi81T24x?=
 =?utf-8?B?b1dHVW1qdjY5NytOK3BjVGkydXB4NlN1OU0wTG1RM29WSHZlcDR3bHlDWGRD?=
 =?utf-8?B?ckQvZmQrU2tFdno4QS83ZGNYZXYza1g5Q1Q1MnlLbUVwdU8wR1RkdEM3MGhG?=
 =?utf-8?B?WTZjOHZGT3B3UVAwTndmRjJwVitMMWZySEwzNFRTMjlFWE83TzVXTnM0cmky?=
 =?utf-8?B?K1ZxcktPK3JtYWx3Ni80ckdYSGJFYVFnZGNnM3lURXlNRVFvMFVGUG9iUm9R?=
 =?utf-8?B?M0RsWGg4TWVvekhiRXNLaGpPZXNqTkJCZ2NZMEdQU3dQNmt1VmFqekpRQ1BG?=
 =?utf-8?B?d0hXamp1REFXbVV2NEMvckhmdk52WmdqV2F1ZGU3dzRNRE5DMEpVTEd0d0pX?=
 =?utf-8?B?UVhaeWJUUnZqczUrL1JpNnd4Ui90UjZ0cXhYMnNSNUNVWmlReGtjaVExbjhr?=
 =?utf-8?B?OFJ1ZW9ieEZFWGFTWnhGb1dkUVlyWENMUkdEWHhIQkl6SkpVbjBrRDk3L1Z6?=
 =?utf-8?B?bXp6VFJ2d2I5TllMSUhQSXRleVE2NjBpNlZHRHVxUUdlNFpNUEdrS0x2RzV1?=
 =?utf-8?B?ZnZkQXVpckZJTVN1MWg2czVVWVRPZGxDaWZQV0haL0dnRTBHbTFhUllpaEN3?=
 =?utf-8?B?SzFoZG96d0t6dkZqZDgrdDJJQ2V0a3gyL3E5ODJnbmVpOFhyYkxvYTgrczlp?=
 =?utf-8?B?dlZIMk4yYjArcXRvNFBIRWQzK3g4ckxaejFWc05WYllGMTY1NkFXOElNS3lG?=
 =?utf-8?B?Z2o1UE95OHhMTUNaNWkrNTd3MHoxZnpsT2lHclI4aktNWEVhTEhaZ3YxUkwx?=
 =?utf-8?B?dWE0T0pBQWJaaWFzeDdWZGxibVphZVphNDZhN3VvT3NrMWhUendYUEc3Tm5p?=
 =?utf-8?B?dGU5U2VaUi9SdkY1NmRVcWNSTkdkTTFzeGFMVkxxY3RPY2dwSEtTK0NpWGlP?=
 =?utf-8?B?STVQQWFNaUVKYW1SaTB3Mi85NHoweU9DSW1WOHJ0bW9BckxQMEpRKzIrZi9q?=
 =?utf-8?B?dDdqcTdKTm1xOCt3TjZQMGNTTUdIV0hEZjREMWN3SVl2RmVxZUFUZXI0UkJr?=
 =?utf-8?B?WUsrZkQ5R054YTh6WmhxRWgycWV3MzBZZmxCektlZHR2cjlnb2JDU3V6ZzBF?=
 =?utf-8?B?aklrZmhGN1dQTzdxbWd0TnR6OUUraHIyL1Q0eDZXSTNmWk5YekJSV3IxRWZS?=
 =?utf-8?B?RUJxODA2SVVUOHJ0N3RJZSs3TzliQkg2dVIzZ0dHemVUeVB1TzM4UzVMbi9l?=
 =?utf-8?B?aXlLVjVWTWJCN2JPV21nZ2MrY2FKSzlPaUtmTW5yRHB0RVJ3L3JXaHVqdFlr?=
 =?utf-8?B?WkJnQ2lJL210TEZ2S3hWbjQ4V3BUTlpBQkl4QS9vazN4ZlVTYjRuMVpDV0Vm?=
 =?utf-8?B?T2ZVd1dLYS9DV05IMEJwYjdiUkUvTzBud1F5SXh5ZUdzRGpwL09tenpyUE1S?=
 =?utf-8?B?bHFpTVJldzRlSmk1UVFhQzJqeVMxYkxVbFZYZzQvWUtQbTkzeWJFSWpHUFI1?=
 =?utf-8?B?TzdxdlQ3MkxQMlhUZ0lmWnhTaHY5bUZoU1BBODB5UDZxM2FQVWw1M2JMUEEz?=
 =?utf-8?B?VUZQNVU5ajRMRDdoZ054ZjVnMENCenFobERFK0MyUUlXR2FzR1F2T3hhdFNH?=
 =?utf-8?B?VUNCeGRYWFFpL0N4UGRxMDhwTUw2NTRyZWJVU0FpUjU5MUlCUUFvSU9pSnUz?=
 =?utf-8?B?UXRDc1dWL0pUZk1QNnBLTWZEOUVjRGczN3ZiL1R0dGQ0ZytSRU9hUWptQzNr?=
 =?utf-8?B?MEJNUVM1bWc2aHNWZzc5ZlFBbCtiRS9SSnE1YXREWkp2Zk92MEJJYnZWazBM?=
 =?utf-8?B?WE1iVXVocWJhR0xvWDZrVGx2WGxUZGV2RWdZSmJBZWxyUXR4WVEyejdUN2JJ?=
 =?utf-8?B?NXBBTUo1a3ZKandJNkVHK1NWbThpOGVrUU5uZ3BISC9iU3UyU2dHVzlKbVFJ?=
 =?utf-8?B?ZlBJMzdscGxIY2ppT1V1ZkNRT2dHbWRla3JhWnMydDRpNThWbFZsUVdsclV4?=
 =?utf-8?B?MFlKZTRTd1BQUzdPakJXRld1TndXMXZFdS9uaXJ1L1hRMHl4Y3VKWW15dlJO?=
 =?utf-8?B?bjZZa2h0bzcrZk1Dajh4akxPdkN4bHVDSmpIZkdlUU0zRjVzY1V6L1ZaMkJX?=
 =?utf-8?B?N2VVUTUxMHd2eXVJRHlxUTJ3amwva1VrUy9tYzk0eEpsOFllaUo3K21FbGI1?=
 =?utf-8?Q?8wODi/HwlPjsd+i8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6557f931-04eb-4354-f428-08de53fde8e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 06:18:33.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF2PulZYF12FOyeTecPzHCdLaFGGKWI4ziRnUmbrDKEBXsd8X2k198meu1m3YiEWXQW8BV0CZhdrE96MIv71AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > From: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Reinitialize metadata for large zone device private folios in
> > > zone_device_page_init prior to creating a higher-order zone device
> > > private folio. This step is necessary when the folio’s order changes
> > > dynamically between zone_device_page_init calls to avoid building a
> > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > must be passed in from the caller because the pgmap stored in the folio
> > > page may have been overwritten with a compound head.
> > 
> > Thanks for fixing, a couple of minor comments below.
> > 
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: David Hildenbrand <david@kernel.org>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Mike Rapoport <rppt@kernel.org>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Michal Hocko <mhocko@suse.com>
> > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: kvm@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-cxl@vger.kernel.org
> > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > >  include/linux/memremap.h                 |  9 ++++++---
> > >  lib/test_hmm.c                           |  4 +++-
> > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > index e5000bef90f2..7cf9310de0ec 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > >  
> > >  	dpage = pfn_to_page(uvmem_pfn);
> > >  	dpage->zone_device_data = pvt;
> > > -	zone_device_page_init(dpage, 0);
> > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > >  	return dpage;
> > >  out_clear:
> > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > index af53e796ea1b..6ada7b4af7c6 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > >  	page = pfn_to_page(pfn);
> > >  	svm_range_bo_ref(prange->svm_bo);
> > >  	page->zone_device_data = prange->svm_bo;
> > > -	zone_device_page_init(page, 0);
> > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > >  }
> > >  
> > >  static void
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > index 03ee39a761a4..c497726b0147 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > >  					struct drm_pagemap_zdd *zdd)
> > >  {
> > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > -	zone_device_page_init(page, 0);
> > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > index 58071652679d..3d8031296eed 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > >  	}
> > >  
> > > -	zone_device_folio_init(folio, order);
> > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > >  	return page;
> > >  }
> > >  
> > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > index 713ec0435b48..e3c2ccf872a8 100644
> > > --- a/include/linux/memremap.h
> > > +++ b/include/linux/memremap.h
> > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > >  }
> > >  
> > >  #ifdef CONFIG_ZONE_DEVICE
> > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > +			   unsigned int order);
> > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > >  
> > >  unsigned long memremap_compat_align(void);
> > >  
> > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > +static inline void zone_device_folio_init(struct folio *folio,
> > > +					  struct dev_pagemap *pgmap,
> > > +					  unsigned int order)
> > >  {
> > > -	zone_device_page_init(&folio->page, order);
> > > +	zone_device_page_init(&folio->page, pgmap, order);
> > >  	if (order)
> > >  		folio_set_large_rmappable(folio);
> > >  }
> > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > index 8af169d3873a..455a6862ae50 100644
> > > --- a/lib/test_hmm.c
> > > +++ b/lib/test_hmm.c
> > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > >  			goto error;
> > >  	}
> > >  
> > > -	zone_device_folio_init(page_folio(dpage), order);
> > > +	zone_device_folio_init(page_folio(dpage),
> > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > +			       order);
> > >  	dpage->zone_device_data = rpage;
> > >  	return dpage;
> > >  
> > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > --- a/mm/memremap.c
> > > +++ b/mm/memremap.c
> > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > >  	}
> > >  }
> > >  
> > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > +			   unsigned int order)
> > >  {
> > > +	struct page *new_page = page;
> > > +	unsigned int i;
> > > +
> > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > >  
> > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > +		struct folio *new_folio = (struct folio *)new_page;
> > > +
> > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > 
> > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > the flags entirely? Or at least explicitly just clear the flags you care about
> > which would remove the need for the comment and  should let you use the proper
> > PageFlag functions.
> > 
> 
> I'm copying this from folio_reset_order [1]. My paranoia about touching
> anything related to struct page is high, so I did the same thing
> folio_reset_order does here.
> 
> [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> 

This immediately hangs my first SVM test...

diff --git a/mm/memremap.c b/mm/memremap.c
index 6f46ab14662b..ef8c56876cf5 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
        for (i = 0; i < (1UL << order); ++i, ++new_page) {
                struct folio *new_folio = (struct folio *)new_page;

-               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
+               new_page->flags.f = 0;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
                ((struct folio *)(new_page - 1))->_nr_pages = 0;
 #endif

I can walk through exactly which flags need to be cleared, but my
feeling is that likely any flag that the order field overloads and can
possibly encode should be cleared—so bits 0–7 based on the existing
code.

How about in a follow-up we normalize setting / clearing the order flag
field with a #define and an inline helper?

Matt

> > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > +#endif
> > > +		new_folio->mapping = NULL;
> > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > 
> > It would be nice if the FS DAX code actually used this as well. Is there a
> > reason that change was dropped from the series?
> > 
> 
> I don't have a test platform for FS DAX. In prior revisions, I was just
> moving existing FS DAX code to a helper, which I felt confident about.
> 
> This revision is slightly different, and I don't feel comfortable
> modifying FS DAX code without a test platform. I agree we should update
> FS DAX, but that should be done in a follow-up with coordinated testing.
> 
> Matt 
> 
> > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > +	}
> > > +
> > >  	/*
> > >  	 * Drivers shouldn't be allocating pages after calling
> > >  	 * memunmap_pages().
> > > -- 
> > > 2.43.0
> > > 

