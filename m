Return-Path: <linuxppc-dev+bounces-15442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E7D06A85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 01:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnNc64vqSz2xPL;
	Fri, 09 Jan 2026 11:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767918714;
	cv=fail; b=bh68zIEPn72wDvR/Iro+Zrb8rrRMJCiE+NzMtGdo843btyx4mtTGZRos6B0IQ7grryD15X1XOJS/GtLiZddNiw2Pm52PRbkpxIiNX0bQaqfXlnyef77DT3VHgwM+m408kBgnpOg7IUM+ATg+VuK1f4HxqoxUH1OdHE2nEIzDxEDrcTYqyMOVbh1TvsfTY+UOt4lhcOFRy5n6oj+tKQy1YEijZmcS0451NchghZdCsq0OESBmyOehM4pGUAiKBeeCpQGL6TpByCw8FNlK7dcfZ1+6n3bZOmj71UzGpMv1IcZLdm5JKrzKSpiQVCIOm+7Ep1z4zFcIz1wyGs7IOcb/Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767918714; c=relaxed/relaxed;
	bh=wcoJhXRbWXUEj06rw/RzJG9JYUY6e+jLITIfNzNbmjc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ot9IMUw8yQX53F62Os4NN54vvEruXqUwT7DSp3BvYrYvN9u5zTMCLO4f5ewJjRs5/Ojnaq1CaUEo6PXmMnkRmN5ivrnbUoUEOGPuhYyzq6OplK7sZI3+2wH1/f/h/r1sOPGUNqK3HJ0uHc9r4+3nxKe32NORqto3RwNY3RLyp3w4GC8YxS8J7wAITUideqSlYYzMC1uKI4Z3XKYhelxNG/xoZTsGCI4Q6CLUM157JJqpQgefTogQPiHXM2iTeqpjkHLIKiWyMGmnzrL0Xurkfdhnrav5CdNbd6f4fQziPLS76fU0C9/GTAbYOJNLm6L+sj87lw+kUZNBvtSh4FbycQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLrIJw/4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLrIJw/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnN4m2nsXz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 11:31:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767918712; x=1799454712;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ll5ZL1Dsgl3u8TfWRO9J5EPkKE5tgG6z5YEKRipD10M=;
  b=nLrIJw/4dk18imGrugAriCyLwtiU1f70mHU5TwLZVB7nQP3UfA2EF+LM
   M1RGI4vyOrg2i/v7ch67ZMHeU8ETHETixYxdDvIbM379PfTXQ0lbd/lf9
   d2kdKIBhxBzktOxmZEqqjxuTgOzZ70qmiLHEfW377ortdNO7sPzpR4lY/
   6i1b2wE40rk5DY5/wZy7huFBVaK3m27eTrdfRiY+Q1/9raSPX6BkoV+EE
   1m+3ZR/2NtU/CHiYNuyX4kvsFjJpsFF7XRqnrItvHBp9ZjRsWvA3v0ta0
   3B7RKzi/tezyHUhkzj6uoONwzSBuFInW6Ewr5YuqsfN03axxbq18OHHfG
   g==;
X-CSE-ConnectionGUID: /4H6cLVeRQe7hIz3tjJTag==
X-CSE-MsgGUID: UEgAHolFRzu4Zw6uSFIRZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69350214"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69350214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 16:31:47 -0800
X-CSE-ConnectionGUID: mijFVALhT9WcweDAlU1Img==
X-CSE-MsgGUID: qLAuO+XHTBKJMWF4nxZqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="234512412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 16:31:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 16:31:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 16:31:45 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 16:31:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQvHeVHnX/c+GPpbbQOWEcJRyk09eVEVwPWhvwlZn2oJ8DnebQ4fdh7bKnPQahcYj0zYOzCrxg85stBrevRSh12bP8+M/Kir5ZuEZ9NwNr6pHWMPEIHghBN89J986BLcQ3X5tjPf7NZU3irh9hsNbTM50FO9RSEm4vAMPWwCx1rNyRvHg12S2wVfxh1CGE2YtYd8crQpGFQrsOa8Z0BgnzBUNkiWgfUOsxH8ghHYoQSpMRMZVpTFB6tE7ydlHVd34Ok0EhTVSXZ0qMGkzxlf3EjltwX708TTgL/eW7Xg8l6yBxenE0zfW0P7jsDpKX8oaVchksjWYqU3+kC+Ore+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcoJhXRbWXUEj06rw/RzJG9JYUY6e+jLITIfNzNbmjc=;
 b=gHIIDb5Y7PzotheB5g7FPTLDts8kBv0XHoasTiSFesOQaeI9eYu8lls2UMCadm0oQONJA0yMyKRD2U40yhUhNiAsTGknlCUC6W6PDRn74ROVyUVD7vPp3iKtngy0TYZGnlV/LNNW1FOXEfsrHloWDsdx2qCVAcopGvwNTXxfJO3tLy+vdo82bqfuSThnNKfLcVErJK+0wcPvaZp85R30etPVl1N/8s+gMKLSINpfj+veiPctYmBGp+KmB4Q3xmp4HAykDGva4pdUii+b4+bwOHiyzjN5nngrbW6k2nkTSwQmcRu2EWXMMyZRoeOC29k3sI9IxiX6lIbQf0+THczVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 00:31:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 00:31:43 +0000
Date: Thu, 8 Jan 2026 16:31:40 -0800
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
Message-ID: <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
 <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f5005e-b1bd-44a6-44d6-08de4f1676bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zHN/8Yi9debhYUIEQcZwcl/VaASTT9trAsb8ub25fureQCmX64p9w84MdMb6?=
 =?us-ascii?Q?K/8VzTzoO3xWvkEQKaiqgvL744+xF2awURYXVtBXFsmEw6ZAY3knpJbnYpzv?=
 =?us-ascii?Q?313kmcyf6pKK3Bpb9mlF6PzxPm3RBhD8Bi1b5Ay9DaOdugRCaylNS0X308Y5?=
 =?us-ascii?Q?+ldz/KPYKm7k41Xx5PQWdaYu4M2vtHcRGGetkKh+CUjtD0AOXDOBU1N70SlQ?=
 =?us-ascii?Q?uff0DUGirIV2ZUTY5ojLaMmGzYRTRIt/mJmjUOx1MZd+AGXpNvj5t0M2Pgfp?=
 =?us-ascii?Q?OnKm0pD8xMXBrEi3ZM2/WutlJTL/hlYuuIJG0lEdmdjKCh58Kal5SnmldjUK?=
 =?us-ascii?Q?+cNmReVRkEao/i5YCVNEOsdb1i+L/dA+YYDmxEA88tJ6FuWtbgP3oWKxdOjy?=
 =?us-ascii?Q?rM/ZpZoIgew+WjKbLDmUycBrx0FdruztfRQVCp+cnDfTC8AOncH66SK/peOi?=
 =?us-ascii?Q?5yoh9bFeb5Jf17CSyVPILmk5enqGe11XqCxmutswITk9EgCGaGoonFLQXDt9?=
 =?us-ascii?Q?LJdUWt/8Vvl+Ny+VKLcwo1f1ZmLBp/PykAEPy9cNcgylHgh8eejMvlulibGW?=
 =?us-ascii?Q?Iau5Wl90qumsD4plyySJa3EfckZbOVlnC9kviwNNskbp3up1wiW+/mN3RvIq?=
 =?us-ascii?Q?BLixqJGeV2l+k3KZnLTMnZMW+wjxhp5DXX5KsHUHrXfU7+OF6rLvKKHuia6z?=
 =?us-ascii?Q?8tAzad40RUnYkAukI3RQy/ygc6W/Mbjpq94mL0LdTZAfAhSpLF9/QBbmU6ft?=
 =?us-ascii?Q?EupK8iuwDYbPeW1VmfsKjY17YALeM9XMuEL5zPdq+254RLGiieBtjTWsd13I?=
 =?us-ascii?Q?LQzEPGL1gC6xvHzjPzzObKxhu/n/97+BQgHaZC/2sDIsggbRth5JUSU8FBeP?=
 =?us-ascii?Q?Pfe3y3qTWQHxqQf1D16D9uVqCXqlzgi1R6ZOOLCeEN2R2bbMc9vY0+Uazx7K?=
 =?us-ascii?Q?VmsxHggak5O17GofzFTdGc+LG++AM4Mwoy//WxADoEvLZE8E7UgeI1ZVv+FE?=
 =?us-ascii?Q?CnFzfSoohmCa6Xu3qK+QUhXm+dWsgwlGdzIR7dsW3GTY2LcV+XpF9nrr8dlj?=
 =?us-ascii?Q?sCCv8uqvF/5RRqkBZpzMXExQOVCx4JXd5XnTGG+LHJLgrl2UVO0ZgNZKLJAl?=
 =?us-ascii?Q?5lRSN9p64MMR3we8ZtVSPfnHMbZKo7EkpLjkDs6NEmhoNhPmmp3nNOnwmH9M?=
 =?us-ascii?Q?D5jAXBRiBRUSv6eNu2pB+uvkl+rc+/IYJd21lCnIjqsowHGNl1cKaBRvpUv9?=
 =?us-ascii?Q?gc1OVhIJWY5ry5duY+xg9S3vf1ErpvxdoDuNUideiMxeRF5a3lqJGWWWKxsL?=
 =?us-ascii?Q?QrecJVd1HfaEremusSb8IN6eFRxSrTaVuRKtlaTZCEXSYB30C2MrinViZX6/?=
 =?us-ascii?Q?Q+QGH7Wt97S2SXq/ErNYNMT4k4w7rRORsjbptnx57VEiSphlDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lgQCQ4aCV5IIxw7eanSmn7eo98S51IEK63AqYV6+qA1VX2wJ3ZbzoqHLwtpX?=
 =?us-ascii?Q?pSEPmLSs5bRKbAaxuacGojpYjcx4MKzFE0X43JrYiIPcZzlfKKXz375f1ZuI?=
 =?us-ascii?Q?0mrw1Arzi3r50Tihcdo5ug6WyGXljg8YPk3ckHQ6bnNTczkiBtry8iwp4D3g?=
 =?us-ascii?Q?yARbOm9Xy39HfIt9VNzoPefEsMO0VimmT2/WdumVtAN1VQUXgDDkY1G8e7IX?=
 =?us-ascii?Q?ndMN2KpfzHyxUee+mNlIHmoSncCUmGQh43zzYb9pygnpnDDazFzgSAviZ1J4?=
 =?us-ascii?Q?SKLOsZBBSB6go2YaZQDpCXxNaky7/HFIRnImBIu8iB5jeLqrS+il0Db94z5Q?=
 =?us-ascii?Q?RYWp/N6HqUnkaChEo3G0AAVpzeJexUslUx+IexvsaRJp5cZkPC/7UMtnBJVD?=
 =?us-ascii?Q?vgX2AbfUnFy5bzmESPOKPtw7EJL3PN1qLlwQmG7oFG67fSPh25meoLRX8t/J?=
 =?us-ascii?Q?nSrBg5A11JwYu2tub57fanlvRVsWfeyP7SdhUVeKGFTxDyVcGLwjJRhgDQLl?=
 =?us-ascii?Q?ZoK/UnMIsmafhfbrkClvxpj4uqrcKcwKkJyx13WaqvUUWnq8Ph3WtFJStnZa?=
 =?us-ascii?Q?TimjUDwajLaJl32PN57MBR/cCozF2CVR2ExZbzXfy4W9PgGvtMfeMRuJxKqv?=
 =?us-ascii?Q?+d8309dsHrDyUCjYExV4uC6mLN/EngOj/AXVAx71sD7A3CO/bHIq6AXau9Bo?=
 =?us-ascii?Q?XzNCYjrEmjDG5bBYZXlvXvo4bZvf4NNTfjTFwpMPxsfS8l2RNwC9wKsvw87E?=
 =?us-ascii?Q?JRve5xWHJvw0s9dPJEF9VaTPgZQTd6N4PrdAUo1G94FRsoO+0X3xrxf18xiX?=
 =?us-ascii?Q?HDBQ3O9KMhajIO8ubv2LCPU4pLJgwLo+6XaVnY7Lumg6kysw99kHs/IIBopK?=
 =?us-ascii?Q?jdgy/UFzVwzJbFES807zyov4E5fRKOMaK0rJ6ycfDnocPMvcslu/0zkezNy5?=
 =?us-ascii?Q?+gBbkVbD0+QHSt0qKxECH85DmLmu4Swmqya1RLRnSaNaMYfctXAGZcoyh/+M?=
 =?us-ascii?Q?rAFQtg9o2wgClHHPEr+hKYkz7mwiY83gAPJv5DmJGig+uvz/MqlqbTCtY6SL?=
 =?us-ascii?Q?PtpOdlOcYI+op8cuib+rggHxUORfCF0P1P1q85vqAy2bRcI0QU0Ih6xwMsEa?=
 =?us-ascii?Q?7KF8gYDZz9bANHK7zEsSJx06NNDk3yTSueOCABRWjg10s4nHPNx/kXTV5VrG?=
 =?us-ascii?Q?TYAv0VmuhHUayQVW8eFwo60A7SLqzle9nCMWCK5hTGnRdme8Kq4gyFegrWkE?=
 =?us-ascii?Q?zgeeYwxRaO4SnaSgC9kWyAPKhLGDj4VOjwRCcKgT/89BJcPMxfs/XaFdD4nJ?=
 =?us-ascii?Q?WF6DNvf9fC05sl4t5+O0bYHyXt+2i9sSGjc0dEIMbH949zeE/lAhhRLM7Z55?=
 =?us-ascii?Q?tL+mDd/+fDrqRgoWG0Vfelj4Bweuc5JYfh5f0hbVP1Kd4OONspXm3F/AFaBc?=
 =?us-ascii?Q?chnXzeWX75c1xHHIg4D7fVDIPaM/qli7+VylWal8vc5HNBjQDXXfdVvO3pJG?=
 =?us-ascii?Q?rvFxPjgNTbAPv1ILVanQgUXikhHFmjjNrpe6c7VTukC5kslV3Ds25hhrQ09l?=
 =?us-ascii?Q?mNpTWo68IfU0z4Xtf/9Xx9D54n9Gqa0NsEUi97/opuWgNCM7epECc9zMdy6t?=
 =?us-ascii?Q?jvoA2a9nlNnbOYpOZJGiULxJmwXNt6sjEOS1c5h+9TfFvfUZlMcKvfUP6TEz?=
 =?us-ascii?Q?S8LMDup5ntvATOIXVRTKwFBf7sr/M56ZPuUsgYDQnsSmO9o/JAUCL14Kjmf0?=
 =?us-ascii?Q?vsh9vfTCsOwr4RfxbftkVa6ihhAEim0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f5005e-b1bd-44a6-44d6-08de4f1676bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 00:31:43.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4BJbeostnNl3HsUFunY/Mn8Pb78LwnFOJFb00tQWg1srTNim9SQL1rBdepCW0OXFtL+3PrErlvcg4Le3jpnyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8465
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 11:01:13AM +1100, Jordan Niethe wrote:
> Hi,
> 
> On 8/1/26 16:42, Jordan Niethe wrote:
> > Hi,
> > 
> > On 8/1/26 13:25, Jordan Niethe wrote:
> > > Hi,
> > > 
> > > On 8/1/26 05:36, Matthew Brost wrote:
> > > > 
> > > > Thanks for the series. For some reason Intel's CI couldn't apply this
> > > > series to drm-tip to get results [1]. I'll manually apply this
> > > > and run all
> > > > our SVM tests and get back you on results + review the changes here. For
> > > > future reference if you want to use our CI system, the series must apply
> > > > to drm-tip, feel free to rebase this series and just send to intel-xe
> > > > list if you want CI
> > > 
> > > Thanks, I'll rebase on drm-tip and send to the intel-xe list.
> > 
> > For reference the rebase on drm-tip on the intel-xe list:
> > 
> > https://patchwork.freedesktop.org/series/159738/
> > 
> > Will watch the CI results.
> 
> The series causes some failures in the intel-xe tests:
> https://patchwork.freedesktop.org/series/159738/#rev4
> 
> Working through the failures now.
> 

Yea, I saw the failures. I haven't had time look at the patches on my
end quite yet. Scrabling to get a few things in 6.20/7.0 PR, so I may
not have bandwidth to look in depth until mid next week but digging is
on my TODO list.

Matt 

> Thanks,
> Jordan.
> 
> > 
> > Thanks,
> > Jordan.
> > 
> > > 
> > > Jordan.
> > > 
> > > > 
> > > > I was also wondering if Nvidia could help review one our core MM patches
> > > > [2] which is gating enabling 2M device pages too?
> > > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/159738/
> > > > [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
> > > 
> > > 
> > 
> 

