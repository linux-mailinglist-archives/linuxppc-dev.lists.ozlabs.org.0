Return-Path: <linuxppc-dev+bounces-15916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDCD3389F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 17:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt5DM6P5wz2xnj;
	Sat, 17 Jan 2026 03:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768581587;
	cv=fail; b=AvQLH44mZUw5DDIBiC54OHvNFWq7Xkwywum7sa6cnAw9gDLCYA+J8d5QlfsDfjXoTCVfj923ImLHp4NJ+KrrySJTsB6gYVN8izO9FA00anjlBpkZXxkOo8sIz0WiBzkOup84xfSRiqvc8wb+uRbpO4rzCTIxl3Wf3+Gdz692rTlqFJVzRzpaj/XfryE1X+ZuDeZq8BevOBK+Zk4ra6Uk7XueQ8hJxSvrNmDDYAJhN8cQ+ikkVCEze3pTae7AHSp4sDW9K+GlDlBmGZY9oZ8TtZE/mOR9qd/LWmWvmjHrAODqzYW8lvf2M1kcqPLZqveBHGw3HA03Sz8LEG4ib4lPFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768581587; c=relaxed/relaxed;
	bh=RXRdpMugAREP/SUOV315Ldq9v5w2KGH44Gb455boAWg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JLC08nAyUn5oi5vOvCoBp0qp7bAMPU6vfRScsZvq565+LhS99+tMQdOXZJbbitl/6NKEWkBx1AO+8B8Os9iIdbGyU7EddJ+wz1j5a5tQvgFJyRDK+NmV3oCprqmz/OLr7o7bu0BqraXatlnwYGGIuADG5fFtBhyJwDf6KAf8RImS59IZsZ4GMg8PXWwEWsDlirkPGX6XGbusyTqAJh7nCZvVRj0VsQDf0QdEJiprH2+2IDXPD33LKhdam/8MVp+bNq+/Rs/ZJ2m67H/0pRDY8+sGkTsH5Xc+X8e46W0OfN1YNP2aET0Hr/+CioLbziiGfI/nNaW423I2xU1LVQoACg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/BbsYvJ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rodrigo.vivi@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/BbsYvJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rodrigo.vivi@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt5DJ36Cgz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 03:39:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768581585; x=1800117585;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=17a6IqgXLpWuRukLOtQc2eh+64giN8ve6TAW80Z1H8Q=;
  b=E/BbsYvJ/MfhOWchOTyFq0vphqTdihLSem1YXg5/gHV9La5ssNSWjbDj
   g3HC1PrWX/flZap3ikln1QHTaJXh5YjM4M56inU9rdcNaYCPSZVGP8V1o
   KSOiRXmcbmOgbujNlfiT9y3IOdlgeRn5vyG2vr1rK3wwvpe82gr/pgn3C
   35YZJcJNy+A4CDT0n9jGtq1b8ZCzr3ySrEIcCG0FHCZ6d9uYlI6riRTiC
   Yt5m6Ed+EgWYIliGQAjOKTIsXMZie7Xtj0BAsujiSXw9o0CxcdFs0HUTW
   s20gfcIao/3IkUTM01oWVzbuescfqiEytIz9CnE92bQ7cyJNFcFLd8rM8
   w==;
X-CSE-ConnectionGUID: U9i0Pmn7QKqeaUEzalz7cw==
X-CSE-MsgGUID: Gv63YdAWQhKZZFF0n/TwUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69630757"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69630757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:39:39 -0800
X-CSE-ConnectionGUID: 22MPCfbQT1G+5I+ODZ7a6A==
X-CSE-MsgGUID: Wta4XjIoQGGuzTQKNR8OAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="210145543"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:39:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:39:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 08:39:37 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:39:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwPf1F0BxEMkG5Cp0Mx+sMNSiib96q9/cwYml+LuQ78i2Mkvf4ghb/hnziyUbge8Y4VhBtHewm1PP0lbdIYvxuNGJmeHLwWGGFbiTogufs3aogksK4EdlJqJyA5THshbywRH5pPl+9h8ftMQCV+5dLbZ3wp8bgPqAjM26o5EA/GhqQN8ZWBGtgRwVjbIrcdx/HlVIqwLvSUcThzl27zqO38LY1RzVHQCqd2MZYmqy2+AstfzOcUI7VuOh47reeooJ/D20cHFVACBmQx+73QwbBN+x4kEfSOJ3Eh9ETClbU3PYjTzvXD/SSPY9wcWjFEreL5S3X1FDUf1Gps0teM6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXRdpMugAREP/SUOV315Ldq9v5w2KGH44Gb455boAWg=;
 b=yqdnSi5i0AF3DLCw//jRePqkEzyW2ZipjXZSdljaHwsE2gDTBPqF+FImTwMMHFv+MdnE09H92EmJsslEPSLo5Kt8zq58wN1xeEXbjvAquw0/v61G3swjmYECQdB9Zv29U/2VBYbxT2jBn8NPugFSh1EnNsR6uI/bRaDQgtoTzPU2BPb6idkiFRvbG+vmJCiq1BCMhiMxlbF0hR+5xJqBX+EnAMwdmmXyHDZElCQici9uU4qdFc3V4EIUPCIMIVSvOP4u5POv1fBqTvRxYIGf5LLquMjEOFvPpwHGmYishlyjg8/j7v5Z9QsmVC5oYluDJQEYi1od2whqdHkAqlqtqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:39:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:39:31 +0000
Date: Fri, 16 Jan 2026 11:39:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
	<mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, David Hildenbrand <david@kernel.org>, "Oscar
 Salvador" <osalvador@suse.de>, <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
	<leon@kernel.org>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
	<tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Alistair Popple <apopple@nvidia.com>, Francois Dugast
	<francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, Zi Yan <ziy@nvidia.com>, "adhavan
 Srinivasan" <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
	<alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
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
Message-ID: <aWpptcor29vqLqiJ@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
 <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
 <aWiall34yq5Eupkf@lstrano-desk.jf.intel.com>
 <nvhjddzmdf34cbjnxmka6ir6smkokn7dlp2aa36ymvofmbo3qh@lugxvx5xlvud>
 <aWncTBPaYuQ0nAAm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWncTBPaYuQ0nAAm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
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
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 25066a7f-9568-489c-bee2-08de551dd2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtSQURlbmZGRmhSTG96OG1nR0RmVVp5SDFneGJBWlQzY0JOd2Y4Rm1uT3Nl?=
 =?utf-8?B?WDZtZHR6Um9DanhlRjFqcmRER04vWGJkUUZYMEZLbzVTeEJWSzhsOGM2V1VY?=
 =?utf-8?B?enZweWxuRnF4U3FEbDY3OGRORXNxTTIxRnZiYytUSWxSMTVPd1orNjdHaFFz?=
 =?utf-8?B?RVZzSGFRSGpwRWg3ZFlWT2c2VDFva2M3LzNMYVlSUFpHS1dnSXU3TzUxZjdN?=
 =?utf-8?B?bGN0YktkU25lVW5qNWNta3MyQjhqUklnM0w0Z0owMU9yRDFGU1N6Z0ZYbFVl?=
 =?utf-8?B?Ly81QnNiVWdNc2F3V2dwVENrT1NaWlE4c3NPMzNGZURWVHNHOWNSQjdpRnFo?=
 =?utf-8?B?Skg0emNCdVVJTDlqSFBWMUd3UjR1Z016NUp0SlJzM3FFSXA3UmpRcHdicTNK?=
 =?utf-8?B?NDFlRkQ4S1IySHFZSVhSYmI0eUlaRENyQXpsYy9LV2d4eVdIeDJ1Wllnb1l1?=
 =?utf-8?B?eVZpcXZwQkRWejM5ekNURVNPVDJrUG9VL0poNW9uSDBub1l0dG9QOHdBRmp5?=
 =?utf-8?B?aFMxWXFzbGVPT1BCRXB4Tyt6OVJFZlRiMGwrbFU3WExVVUpaSnAvSUNxT2NX?=
 =?utf-8?B?S084Z1JoRENzNFBxN01sK0Z6R21CdTlUd0NRUGtIOGZpTm1MRU5vOTVtZ05m?=
 =?utf-8?B?dlVOL2hHZWtOOEpQZytXaU9QRDBWWnhrZVBmK1ZONWswd0dUdEV4TEU5VG54?=
 =?utf-8?B?S1ZncG5CVkYxd0o0TW1kbmc5YkhPTXRHaCtaNGczNldMc21IelpjR1BLSnRn?=
 =?utf-8?B?dWhoMzlUREZPaFRoSEtMVUYzZnF4R1c0dFNobVZRWHgwdHZRS0R4SGFMckdp?=
 =?utf-8?B?RUlCc2lBR3JLRWkrWWNyVWM5TUVjR21XREl1OHB4WDIvZ0xxcHhOWENrNG80?=
 =?utf-8?B?OHdrNWNuY2RQZWtlU05IKzZOUDJoWTZmMGhCTDFRR0VqUnZ4Y1lPTUpFNjdu?=
 =?utf-8?B?U09XK3J0OG5EZDBnQ1pjWDdXbG1sVjl6Y3BCQ0kvTEw0bmxzbkwrbzdNV3kv?=
 =?utf-8?B?dElEdGNJbDdObWVCRlJFVzZwQWhrSjFISEtiM0xvZUthM1gyNGZVY2hSdTl0?=
 =?utf-8?B?TXdGSzM0c2M2Z3VTMC9hdXJaamlxc2h3aDNvTDNkZTFxdXNhbGxhNmxsd0lO?=
 =?utf-8?B?ZzFZZnZoNHlzd2E3VnYyWE1kUHhTcUVZN1QwWlhDanBaRlN4VGZ0WWZ6NWYz?=
 =?utf-8?B?T29OaElkZEZLRm5wdmVmQUVSQUFmbVQ2SURaK1RHUW5QRWZtYXJRTVQwY2Q3?=
 =?utf-8?B?VDhubnRQaG5nM1J6WklSQldDVUVxSGhJWStvLzdVbjFHOURmTW9vREpRM1pN?=
 =?utf-8?B?bmZLNm03RklPZHlxdDBoU0FzbWF1UTFNUXRMWWtYSU5wRy91MzFNb2ptSzJY?=
 =?utf-8?B?cUwvM3FsNnBkSHBGdllodkYwMitpZ3k5b0YwK0NWeUtzcFRIbDNzVTgvUTJp?=
 =?utf-8?B?MTlhWitWcTYvbkNaTDR2bGVqTVZwSWViUUpqYnh4akhkZ2luTzd5UnZsR2xy?=
 =?utf-8?B?ZWI3OVlBRUpRb2VIWU13QnZKS0EyTDF3VzcrdlZUQnpJMGVjck5UZ2JvZlZK?=
 =?utf-8?B?RE8zZGxOajhSdWs1cmE1cDBzS1doT0NvWVFkM1ZNRXFuOGx3MHVCUVpteUkv?=
 =?utf-8?B?UlBOOGtiNU5xZmNKQXlrWnhaYlFVdG1FSEFpbzhtUkdtcmFUM0Jnc25wb1Ji?=
 =?utf-8?B?eDNwempoV0xEK2t0Vk1CUXhmV1hNRkd1bysxVVJCQ2V6K1BUZ2txcUNWc3NW?=
 =?utf-8?B?NTZQbHJhbDhaVVNJenhNVTFxdlZ1THRYV1lma3NVbHRjS1l4WWRUK3k0R2Y2?=
 =?utf-8?B?L0M4RUpQbHhrNzJNSFVoT2R6cGk0OStYbzZaTy8vSEg3WU84KzM0bHZ3em15?=
 =?utf-8?B?a1FEVFhDLzVGSWpUUEE5NGZqN2JZWXA1RDYzL3FQWXdPTHZObktwQUd6Snc4?=
 =?utf-8?B?NUlPb3h0emtVWGFxV1poZTh0WUZXaVZLRVYwRVBqeHhYdWZnRk05ZEw3YVcx?=
 =?utf-8?B?bDV5L0YrQ2Y2ek80UTQyMjFMNFVoTldkbWJsL3BEcVJzMlRBM3FIamdsV0Vv?=
 =?utf-8?B?dzN1Z20xTFpiVCtBRGtLZ3ZabWdqUkxBRzVqR2c2dXpuWm54QS9oNjFVd1Rx?=
 =?utf-8?Q?4vjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampLM2E2blNibldzUS85eUdQbmJpdzlYZFpaaGwzTkg5V3NnRmhRajNISHZM?=
 =?utf-8?B?S2RzMHZpc2puL2lFaHZFRmViVmN6c2dUeXVDUTBkcHJDcnp0ODdTbzlkNkdB?=
 =?utf-8?B?UEhJYnhkbHFUenRrR0w0SEZaS203MWcrOHU5VjdXTGh5cjZFaVJwaWk2Wjdu?=
 =?utf-8?B?blNVZlh4dnhWb2VZSFc5dElObWhCTHRtQmZJT1ZLQjRxdk4zRTk0UjdlNmdU?=
 =?utf-8?B?UVJRcHE1bUxRaTB1Q09kNEo0VjVkb0VFT21lbm1ncFNaN3llODN0cjF4dWdl?=
 =?utf-8?B?anJvY09FVzB0ejFVVEw4OGFHUEU3SkpkMmd3RnN2anYvUUJBT01PZmdGOFMr?=
 =?utf-8?B?SGJWczQ3T1JjdnZIS2dWd3BoSGxjeHJWdnBPMCtaNTZxR0tqZDQ2TEo2Nk1q?=
 =?utf-8?B?MXJ0clZQSm5Ick83SXRtKzNRYmkwMVBZRGljcm9ZZzFLNmJYUEVPV2Q1TDhF?=
 =?utf-8?B?RUN4K1RNWTZtb2NnclJmL1YxTzhRNnNteWpuS3paaUlzU1ppUFlUZ25wNkNn?=
 =?utf-8?B?T1NLZW4vSTVYaWI3VUVQVnYydUV1aWZsdTFYeTRmTHlvK1RvaSt2cVZBZ0Fk?=
 =?utf-8?B?NjFjdWRIL2N1ek5ubWhZenpSMEF2eWtRUnB2eE5hRmNrVjV5SGV6eGhCeFR5?=
 =?utf-8?B?ZlphUHhkTEh6MVFucmUzL2tRVHdFUkhiZFd6ZDg1b1BzWkQxRGc5NlJrZEMz?=
 =?utf-8?B?dkFHY1RhckZXVVBEVXdha1UrREVCQWp3RUgvNmg4eUJpcnlNbjNMVDlkTUlB?=
 =?utf-8?B?U3lHQTlhWUNreks5bUZHcFd3ZHRBWVdRbmFTWnhWQjJ4bElKUXR1dDZlQkhU?=
 =?utf-8?B?dUZOWGFONGxZVkhOQU92clg4dnIyU0V1a3J1OWZiVGNRZklZNUdmUStNVldh?=
 =?utf-8?B?MFNWSmhreXM0RmptQTA5QUVIL2NxQStXVFlrV0t4TnV6cVV6VC96SGlaU1B2?=
 =?utf-8?B?RzE1dVJoeUdyTDNJb1FTSUIwZWJ2NWlaandCTExqSjlZWDl0S3JJNU14Umdr?=
 =?utf-8?B?QVFxME8zSDBJM3JtbFVyQlhqbWpOY2NUM2xnOEptekhNb2o4czh0b1VLYVVr?=
 =?utf-8?B?dDR4VTIvQTFvS0gwbVNkbzQwZDRTNFpSeGJNQXpIcmhGdzM5cEhiaVg2NkpG?=
 =?utf-8?B?TCtVRmVmc09VcXZqQ0NGRlE5NWlrMC85SlJoV2R1ejAweGRRTUluWTBKZU83?=
 =?utf-8?B?US83ZWpZdkErcDcvMmJOL0RwT2g2eDl4UEY5N213WlZUWUx2bWQzb2FvWmFq?=
 =?utf-8?B?M2xwbVYyN0Z4VlkwanVZWU4zMm5taTRWanVKaDdwdzkxaWVCZ0N4MzRsSWRK?=
 =?utf-8?B?VG80bWxyMTdtZGdsaUpqR3pNSEd4UHFwK3h5Njkvb3B5TWczZjdLbTdYR2hv?=
 =?utf-8?B?WXVicnVYQTdFQWNBTkU0L0ZWQ2UrTCtLU05XbjBvRzNLK3F6TXduRjFKbmlq?=
 =?utf-8?B?NVJEaEZJc2NyblJGOG8yUnpweDF3bGZzZFJBYWcxaXFMUklYb1BCYWFNa0lr?=
 =?utf-8?B?eEpFYkZGaUZnOFYwY1d2dGN4cXNTSjdzS1VMZitaQ0c5RmZ5dllkaGJaM0or?=
 =?utf-8?B?ZnhQL2Q1aEJHaUs0YTEzU3QyM0ppQi9SeklmdXRtcjRBS0VZL1V0YUdzeU5n?=
 =?utf-8?B?UGxiWDlrRjE1ZTBmRlBuUXlXOCtEOXZGVHY2ZEFjaUV6VVdTZzJUL0xoVmJj?=
 =?utf-8?B?Z0RtankxK2U1dzQ4aXhoc3h6SGxvbklIL1dCZm5Yc0VVekdiVjY2TVdzK0xq?=
 =?utf-8?B?clZCVXJiZGRQSHljU1hrUVliUkNwNFJOMmU5dE9hRGhueHphaC93aWVLd2to?=
 =?utf-8?B?T04rU2V2eSs1UlBxd05BYjhlQndRbTZHOTg3ZmlnY0R5WkVPblVzZ0o2RWZp?=
 =?utf-8?B?M2M5MEhJTlB3T3VhQ2gzbTh5L1RuL0VzTDF0K0JNUmxmY01ndEtFLzVVVWRy?=
 =?utf-8?B?akE1TkdsNlg1b2tBMmJSQ0hlcGthdnZieURFSEZuNmtxcjJ5Zk4rVy9ZRTBY?=
 =?utf-8?B?SjR3OEpoOHpWcGVid0N1U0RETjkyaU1QcGI1NWxBbGwvK0t2dCt4azZBbWdu?=
 =?utf-8?B?VndnQXcyalkvVnhKb2tVTnFLSzFtbko2RmNmZjlCc1F2WVdjdE5SNmF2WkRo?=
 =?utf-8?B?VDh1TEdMdWhtZDhlcXczMko5aG9iUy9MMXEva2RNQjhsRlZtbkJiY1pxMVcw?=
 =?utf-8?B?ZlM3cGlHaEpmbHJZSFBwMkgycmtPUzZVZ3FVVjMrbndpajVlTVAxVmdhSjNa?=
 =?utf-8?B?QjNMdXZ4aVFNYjdlT1ZKVngvd3NwRmVZVE9uYnc0T3JrV2xJZmNmb3lTNlhz?=
 =?utf-8?B?bk1jY0FkTFRJVDFNTlF1YVIzdDg2U3o1K3g0SlBNV1IzMTFlMnB3QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25066a7f-9568-489c-bee2-08de551dd2e0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:39:31.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9xOQ+lygfJVW3GSK2p/8ppsHXrdO3WBJen9kNincqkONsQBN8f7qtuSYERu3CeY9M3ZWW0fEQMmyb2atxPssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:35:56PM -0800, Matthew Brost wrote:
> On Thu, Jan 15, 2026 at 10:05:00PM +1100, Alistair Popple wrote:
> > On 2026-01-15 at 18:43 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > On Thu, Jan 15, 2026 at 06:07:08PM +1100, Alistair Popple wrote:
> > > > On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> > > > > > On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > > > > > > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > 
> > > > > > > > Reinitialize metadata for large zone device private folios in
> > > > > > > > zone_device_page_init prior to creating a higher-order zone device
> > > > > > > > private folio. This step is necessary when the folio’s order changes
> > > > > > > > dynamically between zone_device_page_init calls to avoid building a
> > > > > > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > > > > > must be passed in from the caller because the pgmap stored in the folio
> > > > > > > > page may have been overwritten with a compound head.
> > > > > > > 
> > > > > > > Thanks for fixing, a couple of minor comments below.
> > > > > > > 
> > > > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > > > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > > > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > > > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > > > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > > > > > Cc: kvm@vger.kernel.org
> > > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > Cc: nouveau@lists.freedesktop.org
> > > > > > > > Cc: linux-mm@kvack.org
> > > > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > ---
> > > > > > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > > > > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > > > > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > > > > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > > > > > >  include/linux/memremap.h                 |  9 ++++++---
> > > > > > > >  lib/test_hmm.c                           |  4 +++-
> > > > > > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > > > > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > > > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > > > > > >  
> > > > > > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > > > > > >  	dpage->zone_device_data = pvt;
> > > > > > > > -	zone_device_page_init(dpage, 0);
> > > > > > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > > > > > >  	return dpage;
> > > > > > > >  out_clear:
> > > > > > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > > > > > >  	page = pfn_to_page(pfn);
> > > > > > > >  	svm_range_bo_ref(prange->svm_bo);
> > > > > > > >  	page->zone_device_data = prange->svm_bo;
> > > > > > > > -	zone_device_page_init(page, 0);
> > > > > > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  static void
> > > > > > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > > > > > index 03ee39a761a4..c497726b0147 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > > > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > > > > > >  					struct drm_pagemap_zdd *zdd)
> > > > > > > >  {
> > > > > > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > > > > > -	zone_device_page_init(page, 0);
> > > > > > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > > index 58071652679d..3d8031296eed 100644
> > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > > > > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > > > > > >  	}
> > > > > > > >  
> > > > > > > > -	zone_device_folio_init(folio, order);
> > > > > > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > > > > > >  	return page;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > > > > > --- a/include/linux/memremap.h
> > > > > > > > +++ b/include/linux/memremap.h
> > > > > > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > > > +			   unsigned int order);
> > > > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > > > > > >  
> > > > > > > >  unsigned long memremap_compat_align(void);
> > > > > > > >  
> > > > > > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > > > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > > > > > +					  struct dev_pagemap *pgmap,
> > > > > > > > +					  unsigned int order)
> > > > > > > >  {
> > > > > > > > -	zone_device_page_init(&folio->page, order);
> > > > > > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > > > > > >  	if (order)
> > > > > > > >  		folio_set_large_rmappable(folio);
> > > > > > > >  }
> > > > > > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > > > > > index 8af169d3873a..455a6862ae50 100644
> > > > > > > > --- a/lib/test_hmm.c
> > > > > > > > +++ b/lib/test_hmm.c
> > > > > > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > > > > > >  			goto error;
> > > > > > > >  	}
> > > > > > > >  
> > > > > > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > > > > > +	zone_device_folio_init(page_folio(dpage),
> > > > > > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > > > > > +			       order);
> > > > > > > >  	dpage->zone_device_data = rpage;
> > > > > > > >  	return dpage;
> > > > > > > >  
> > > > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > > > > > --- a/mm/memremap.c
> > > > > > > > +++ b/mm/memremap.c
> > > > > > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > > > > > >  	}
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > > > +			   unsigned int order)
> > > > > > > >  {
> > > > > > > > +	struct page *new_page = page;
> > > > > > > > +	unsigned int i;
> > > > > > > > +
> > > > > > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > > > > > >  
> > > > > > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > > > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > > > > > +
> > > > > > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > > > > > 
> > > > > > > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > > > > > > the flags entirely? Or at least explicitly just clear the flags you care about
> > > > > > > which would remove the need for the comment and  should let you use the proper
> > > > > > > PageFlag functions.
> > > > > > > 
> > > > > > 
> > > > > > I'm copying this from folio_reset_order [1]. My paranoia about touching
> > > > > > anything related to struct page is high, so I did the same thing
> > > > > > folio_reset_order does here.
> > > > 
> > > > So why not just use folio_reset_order() below?
> > > > 
> > > > > > 
> > > > > > [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> > > > > > 
> > > > > 
> > > > > This immediately hangs my first SVM test...
> > > > > 
> > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > index 6f46ab14662b..ef8c56876cf5 100644
> > > > > --- a/mm/memremap.c
> > > > > +++ b/mm/memremap.c
> > > > > @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > >         for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > >                 struct folio *new_folio = (struct folio *)new_page;
> > > > > 
> > > > > -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> > > > > +               new_page->flags.f = 0;
> > > > >  #ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > >                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > 
> > > > This seems wrong to me - I saw your reply to Balbir but for an order-0 page
> > > > isn't this going to access a completely different, possibly already allocated,
> > > > page?
> > > > 
> > > 
> > > No — it accesses itself (new_page). It just uses some odd memory tricks
> > > for this, which I agree isn’t the best thing I’ve ever written, but it
> > > was the least-worst idea I had. I didn’t design the folio/page field
> > > aliasing; I understand why it exists, but it still makes my head hurt.
> > 
> > And obviously mine, because I (was) still not getting it and had typed up a
> > whole response and code walk through to show what was wrong, in the hope it
> > would help settle the misunderstanding. Which it did, because I discovered
> > where I was getting things wrong. But I've left the analysis below because it's
> > probably useful for others following along:
> > 
> > Walking through the code we have:
> > 
> > void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > 			   unsigned int order)
> > {
> > 
> > The first argument, page, is the first in a set of 1 << order contiguous
> > struct page. In the simplest case order == 0, meaning this function should only
> > initialise (ie. touch) a single struct page pointer which is passed as the first
> > argument to the function.
> 
> Yes.
> 
> > 
> > 	struct page *new_page = page;
> > 
> > So now *new_page points to the single struct page we should touch.
> > 	
> > 	unsigned int i;
> > 
> > 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > 
> > 	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > 
> > order == 0, so this loop will only execute once.
> > 
> 
> Yes.
> 
> > 		struct folio *new_folio = (struct folio *)new_page;
> > 
> > new_page still points to the single page we're initialising, and new_folio
> > points to the same page. Ie: &new_folio->page == new_page. There is a hazard
> > here because new_folio->__page_1, __page_2, etc. all point to pages we shouldn't
> > touch.
> > 
> 
> Yes.
> 
> > 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > 
> > Clears the flags, makes sense.
> > 
> 
> +1
> 
> > #ifdef NR_PAGES_IN_LARGE_FOLIO
> > 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > 
> > If we break this down we have:
> > 
> > struct page *tmp_new_page = new_page - 1;
> > 
> > Which is the page before the one we're initialising and shouldn't be touched.
> > Then we cast to a folio:
> > 
> > struct folio *tmp_new_folio = (struct folio *) tmp_new_page;
> > 
> > And reset _nr_pages:
> > 
> > tmp_new_folio->_nr_pages = 0
> > 
> > And now I can see where I was confused - &tmp_new_folio->_nr_pages == &tmp_new_folio->__page_1->memcg_data == &new_page->memcg_data
> > 
> 
> Not 100% right, as _nr_pages is 4 bytes and memcg_data is 8, but the
> pointer base address is the same.
> 
> > So after both Balbir, probably yourself, and definitely myself scratching our
> > heads for way too long over this change I think we can conclude that the code as
> > is is way too confusing to merge without a lot more comments :-)
> > 
> 
> I think more comments is the way to go. More below.
> 
> > However why go through all this magic in the first place? Why not just treat
> > everything here as a page and just do
> > 
> > 	new_page->memcg_data = 0
> > 
> 
> Well, memcg_data is 8 bytes and _nr_pages is 4. They also have different
> #ifdef conditions around each field, etc.
> 
> I’ve also seen failures in our testing, and so has François, with the
> memcg_data change. I wish I had a stack trace to share or explain, but
> the times I hit the error I didn’t capture the dmesg, and I’ve been
> having issues with my dev machine today. If I catch the error again,
> I’ll reply with a stack trace and analysis.
> 
> > directly? That seems like the more straight forward approach. In fact given
> > all the confusion I wonder if it wouldn't be better to just do
> > memset(new_page, 0, sizeof(*new_page)) and reinitialise everything from
> > scratch.
> 
> I had considered this option too, but I’d be a little concerned about
> the performance. Reinitializing a zone page/folio is a hot path, as this
> is typically done in a GPU fault handler. I think adding verbose
> comments explaining why this works, plus some follow-up helpers, might
> be the better option.
> 
> > 
> > > folio->_nr_pages is page + 1 for reference (new_page after this math).
> > > Again, if I touched this memory directly in new_page, it’s most likely
> > > memcg_data, but that is hidden behind a Kconfig.
> > > 
> > > This just blindly implementing part of folio_reset_order which clears
> > > _nr_pages.
> > 
> > Yeah, I get it now. But I think just clearing memcg_data would be the easiest to
> > understand approach, especially if it had a comment explaining that it may have
> > previously been used for _nr_pages.
> > 
> 
> See above — the different sizes, the failure I’m seeing, and the
> conflicting #ifdefs are why this is not my preferred option.
> 
> > > > >  #endif
> > > > > 
> > > > > I can walk through exactly which flags need to be cleared, but my
> > > > > feeling is that likely any flag that the order field overloads and can
> > > > > possibly encode should be cleared—so bits 0–7 based on the existing
> > > > > code.
> > > > > 
> > > > > How about in a follow-up we normalize setting / clearing the order flag
> > > > > field with a #define and an inline helper?
> > > > 
> > > > Ie: Would something like the following work:
> > > > 
> > > > 		ClearPageHead(new_page);
> > > 
> > > Any of these bit could possibly be set the order field in a folio, which
> > > modifies page + 1 flags field.
> > > 
> > > 	PG_locked,		/* Page is locked. Don't touch. */
> > > 	PG_writeback,		/* Page is under writeback */
> > > 	PG_referenced,
> > > 	PG_uptodate,
> > > 	PG_dirty,
> > > 	PG_lru,
> > > 	PG_head,		/* Must be in bit 6 */
> > > 	PG_waiters,		/* Page has waiters, check its waitqueue. Must be bit #7 and in the same byte as "PG_locked" */
> > > 
> > > So a common order-9 (2MB) folio would have PG_locked | PG_uptodate set.
> > > Now we get stuck on the next page lock because PG_locked is set.
> > > Offhand, I don’t know if different orders—which set different bits—cause
> > > any nasty issues either. So I figured the safest thing was clear any
> > > bits which folio order can set within subsequent page's memory flags
> > > like folio_reset_order does.
> > 
> > Oh, I get the above. I was thinking folio_reset_order() below would clear the
> > flags, but I see the folly there - that resets the flags for the next page.
> > 
> 
> Correct.
> 
> > > 
> > > > 		clear_compound_head(new_page);
> > > > 		folio_reset_order(new_folio);
> > > > 
> > > > Which would also deal with setting _nr_pages.
> > > >
> > > 
> > > folio_reset_order(new_folio) would set _nr_pages in the memory that is
> > > new_page + 1. So let's say that page has a ref count + memcg_data, now
> > > that memory is corrupted and will crash the kernel.
> > 
> > Yep, I just noticed that. Thanks for pointing that out.
> > 
> > > All of the above is why is took me multiple hours to write 6 lines of
> > > code :).
> > 
> > And to review :) Good thing we don't get paid per SLOC of code right?
> >
> 
> I don’t think anyone would touch core MM if pay were based on SLOC — it
> would be a terrible career choice. :)
> 
> All joking aside, I think the next revision should use this version,
> plus more comments and helpers/defines in a follow-up—which I’ll commit
> to—along with fixing the branch mismatch Andrew pointed out between
> drm-tip (which this series is based on) and 6.19 (where this patch needs
> to apply).

I believe the best branch for this series would be drm-misc-next indeed.

But this patch in particular needs multiple acks to get through drm trees.
At least one from each block:

## arch/powerpc/kvm/book3s_hv_uvmem.c
Madhavan Srinivasan <maddy@linux.ibm.com> (maintainer:KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc))
Nicholas Piggin <npiggin@gmail.com> (reviewer:KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc))
Michael Ellerman <mpe@ellerman.id.au> (maintainer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))

## include/linux/memremap.h
David Hildenbrand <david@kernel.org> (maintainer:MEMORY HOT(UN)PLUG)
Oscar Salvador <osalvador@suse.de> (maintainer:MEMORY HOT(UN)PLUG)

## lib/test_hmm.c
Andrew Morton <akpm@linux-foundation.org> (maintainer:LIBRARY CODE)
Jason Gunthorpe <jgg@ziepe.ca> (maintainer:HMM - Heterogeneous Memory Management)
Leon Romanovsky <leon@kernel.org> (maintainer:HMM - Heterogeneous Memory Management)

## mm/memremap.c
David Hildenbrand <david@kernel.org> (maintainer:MEMORY HOT(UN)PLUG)
Oscar Salvador <osalvador@suse.de> (maintainer:MEMORY HOT(UN)PLUG)
Andrew Morton <akpm@linux-foundation.org> (maintainer:MEMORY MANAGEMENT)


On the other hand we would also need Max to do one extra last pull-request
towards 7.0 after we get this merged. Because our window in drm closed
earlier.

Or this patch goes to any regular mm tree, and we hold the drm ones
after we backmerge 7.0-rc1

> 
> Matt
> 
> >  - Alistair
> > 
> > > > > Matt
> > > > > 
> > > > > > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > > > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > > > > > +#endif
> > > > > > > > +		new_folio->mapping = NULL;
> > > > > > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > > > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > > > > > 
> > > > > > > It would be nice if the FS DAX code actually used this as well. Is there a
> > > > > > > reason that change was dropped from the series?
> > > > > > > 
> > > > > > 
> > > > > > I don't have a test platform for FS DAX. In prior revisions, I was just
> > > > > > moving existing FS DAX code to a helper, which I felt confident about.
> > > > > > 
> > > > > > This revision is slightly different, and I don't feel comfortable
> > > > > > modifying FS DAX code without a test platform. I agree we should update
> > > > > > FS DAX, but that should be done in a follow-up with coordinated testing.
> > > > 
> > > > Fair enough, I figured something like this might be your answer :-) You
> > > > could update it and ask people with access to such a system to test it though
> > > > (unfortunately my setup has bit-rotted beyond repair).
> > > > 
> > > > But I'm ok leaving to for a future change.
> > > >
> > > 
> > > I did a quick grep in fs/dax.c and don’t see zone_device_page_init
> > > called there. It probably could be used if it’s creating compound pages
> > > and drop the open-coded reinit when shared == 0, but yeah, that’s not
> > > something I can blindly code without testing.
> > > 
> > > I can try to put something together for people to test soonish.
> > > 
> > > Matt
> > > 
> > > > > > 
> > > > > > Matt 
> > > > > > 
> > > > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > >  	/*
> > > > > > > >  	 * Drivers shouldn't be allocating pages after calling
> > > > > > > >  	 * memunmap_pages().
> > > > > > > > -- 
> > > > > > > > 2.43.0
> > > > > > > > 

