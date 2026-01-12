Return-Path: <linuxppc-dev+bounces-15527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21332D1044F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 02:37:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqFNz2yhmz2yps;
	Mon, 12 Jan 2026 12:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768181843;
	cv=fail; b=AqwXCwB+7o/p1A62sbXsnGXdU5NcJSVhDIU4rCdNBEz1qo/VJSFNstk2XjLuBspmdaeJupkx6OFB0Od9u3yaW2jiRFjUkcVshWe66ektY3/p9iJOsaaT8noSERC5psoITdRjW4JdLjJBYjJxIuKfH5ZeB+Cpde7gGylWAuXOCYjI5psTpiSP/sHZtH0WI5C6/lQAQLawhPKi9ewIFcpOsZtGd5ropwjXLiRHASzHA6/xEROOuOsrERA02tySCS5i1sjsE6Egd93k0DxMVqoc/h+520DjsanMXGFpnkoAgSn0qfJvh4q+Ms9d/oaYszlEbHWTOG7NyPvFNVK9sna02Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768181843; c=relaxed/relaxed;
	bh=fKiuIkVUWocTlml1ph9fZVzEIa62kZGhU4b2pmeLwx0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JvvasulI7P3CYdivrhgA5fZOxg75AuZ+Rn5bH3129E+my2a4rcLpNlEhDn0rSss+LOnifURcB+QB2Ou2OjnORiZtHDV1wFrEnNOnY3L1GAmxklGss2e4adzyR8hTjXxLVM/zudbojEX9eC90ZFZSAPjYDv5+Rjv6UgIer3MVbUPqK2vU6GnGeW1WTz2oaLvkzj636ACQGd2ZxyuYZD5SK8jZ9ja+krshVJIuREUg8zHGPVLIwMa6DIrgoqrmGpHpS7M/9ENEbpEv7xbXwKyjd+EAkd2lUbeVK2/WxwC5q/TRjP8rXY7BqAoOfKd6PvIpGXuDiU84CGGkikpyaIxUhg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvsqh8Ii; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvsqh8Ii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqFNw2VfPz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 12:37:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768181841; x=1799717841;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OHSLaMopdyW4jwuOos94UG6fkLZJ4B+5pHRmeiaqeBI=;
  b=Qvsqh8IisbKUViTaP8sk9w0tLJ/Vij1vJ2DunB1aCgjPyBfCRCbxzjZt
   xBoHJeXTpesoNKGWJU6jrHynsjfdA7ZjPuRjgIIrSDxZnp98Ju+nSMqWF
   Tq91w2FySy6GDd8dWE6OsI9cD7ZeRYRir5rnH9OuScPt9lWovcPkywnEi
   g+vkrdMD06sZSWkLon8L9LEfUMhcHul7+yLqpcclruFR5ZH8J9RZrfb6s
   lcqy4mW5l5NI+svjd8U6rJIXXH/8XI/CfZIjg1D59s/6L1dBKgIAa8qK9
   bLN27jAbZ2R0H2WsN8Hz0hXhRSkIyU2bx6ZHeCrvzSXhGC1IzaOsvf1KT
   w==;
X-CSE-ConnectionGUID: a6tLL6HBQU2qu18PBi8N+w==
X-CSE-MsgGUID: mG3k/wdzR6Kzi/1/l+MUJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="92123161"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="92123161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:37:15 -0800
X-CSE-ConnectionGUID: sD8gkpGPT+m7AvzAv4izKA==
X-CSE-MsgGUID: DFvxbuSrTf6A68eFN/Nhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203175424"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:37:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 17:37:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 17:37:14 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 17:37:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBe0sISNMk+6MqudxgMAwJfqsUJMMjG/WxaFBHweui3prBPktFlBY7M8IN3Izuey8eBAFa1H+pO5NddDFl7aulQIAPoUqHwroALwfbkKAPtNcHFBCIFno6OgxXACogBWDAiQFnS9QyLWkCypNr0k4Fu2JnSd+sKUDubHQkDydlkXRxY0dDN2n8usF7ZB6yP1NBV0rw23nRDnrHBMkymE7Da1rbm0ezAfGf1st7w/6ghO6WxlNtl9rBcYwJ7Ah/zO4R1EyZcSW+b+Y32CTnqnj9WpKtWvfjJfcoDwW3lx4m03gFhX8RDPWem7Sxy+r6DvjSMAVFF2Mi2s6FIXtV5Jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKiuIkVUWocTlml1ph9fZVzEIa62kZGhU4b2pmeLwx0=;
 b=Ya18HGI2fSOUBWodC9nEz9d3rskTeTX0J0kHny0S3xjQtg3Rvu/P3c23vBmdcaJct5Yh9LobKaYzxxe2rcw3Dkx6YeDTIHn8HBxJEYrIPNPHqyXd4F/uglEoIBi0bWv80edMqMskugUcjPjmJy+Ttl1np1nvJGwupfE+wIOU11jG3AusAbs3AoD8Z2TeH7AJJ+IDQ9TF/whvGDyJIE7MxsEm/o7HRodk50wgAPZthn6NeY8uoiGxrzXuMm15+8EzbCMg/e3xgT71fNmfKYDgRf4MT8V36Aoo5I3KlVn7wbCgKd19slgr+ZB+NHV6k9eiO5rRRyMq+h10GVwcmdJMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:37:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 01:37:12 +0000
Date: Sun, 11 Jan 2026 17:37:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
	Francois Dugast <francois.dugast@intel.com>,
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
 Morton" <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Leon
 Romanovsky" <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>, Alistair Popple
	<apopple@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWRQRHjYz/rVDnln@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7738e6-33a6-424c-c9e0-08de517b1be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R09GK1haUFZtQkU0T2IvYXIzL2ZXSVY3OGlRaFFwb3dnWFA0YVY1R2duVjNJ?=
 =?utf-8?B?Z2ZnZk9ScUpBSzVrQ25oWmlnc1AvTDFJdkFCbFQ1YnVQRVdaR1pEdDgzc1JD?=
 =?utf-8?B?WW5TVEpJaGw3VTdLRmUxRWcwQjFnY2JVcFZ4dkUxMEVDZzJJOFprcG1JRC8y?=
 =?utf-8?B?MUc5bUxXTDZmRFBuTHNCYU1CeHdTeGxHN1p0RDJReDdJK0d6TGJDYkZ3KzNj?=
 =?utf-8?B?Q0tPbFVXUTc1WjJHTEhZcGM1M3VDbDVCUEdEVTRCTnkzTjRIQjNXNzlHeVpE?=
 =?utf-8?B?MzJjanZkL2RhaXl5d1c4R2NrMUJWU3BVZDVwT3VOelAwOVk5djk0T3A0ZDV0?=
 =?utf-8?B?NmpabGZHZHVwUXRXd1JNNWJwV1grdlZpK3NkcUxIYnB3ZzB5MU1PVjQycFNH?=
 =?utf-8?B?M0kxckEybDIrYmxITjU2NVNPdEJLWEgvL3pOb0loUUwwUFVEdkhMQ0NqbEQ5?=
 =?utf-8?B?aWZlUmUrYjdMSWZpUWo1aDZBa1FDWC9VVE96VUcxWUZlZlplNE9SbGkvM241?=
 =?utf-8?B?ZnV6Vi9FY1I1ZjNUZDczN3BSWURKOWpBTC9meThyUXgvQjc5Zm9BUjhnNVgw?=
 =?utf-8?B?NFlmVWszNEZ3RzBsbzFyc0pqbGRsNmhJTmM3dlRYVWxCY0pXL3pSeDN3VGhz?=
 =?utf-8?B?VFA5NEhpK3lacjM2V01RckhmRHZLeWltRWtVbC9YcDd2M2RqRU5wbGRaWmlp?=
 =?utf-8?B?Mi9XN1NYRnpkM1RpNXhDWjV0dXdUejI4QzZhVm9ldkxwaWZQSFJJMHFtRUoy?=
 =?utf-8?B?c094RnROcXNjTVpXMllzTWFzcEo2N1NleHpTd2Q3dUJ6anNET1duY1FVaHly?=
 =?utf-8?B?NlBXYXZhbkZFLzM5WWdwcUdUMnRtSW43VHE5cjV6R0hWRmE1VlRvUytGamdx?=
 =?utf-8?B?VCsxdkpzTlhzaG5lK2t2TWFrYlZGVjBlN2xaOVFia0dUSVl2ZkVFWmNVZHpH?=
 =?utf-8?B?ajVRM2JsTkRRR1Q3UGl2NlY5dEQyZmYzbFplYkNVYlZIU0ZibXR6RHZOOFli?=
 =?utf-8?B?ZFcxZHNXQUhMQldITTRKekw3TTQvTFQyM0xLTlBPeUx2RVdPUDU3TjVEZXkw?=
 =?utf-8?B?eXZZSlc0a3dXNTVBekdLVGFBbnFROUM4VS9VaTY1VUJhMzlvY3JUVTR3ZWVi?=
 =?utf-8?B?cE1aZm12VmFYV0dVWmt4cExubVcvSnR1R1F4UG5PMVlQUmllNThNQ0MydGpp?=
 =?utf-8?B?ZkV2d29uTVpESmEyM2M2VFZNN1AzR0RWdDNxbXRINk9VYWNlSHJicExHcnUw?=
 =?utf-8?B?bndhZFJVZTFFU2tlSHZ5dENieGl6cFVod3ZrTXB1UTVjUWpZY0JEQUtpK3ZT?=
 =?utf-8?B?SUdiamRWQVFFbmhnVG9DcHp3QXhPaXZraHEzNzJOZWVrVlZUdHBwM2NtamFh?=
 =?utf-8?B?bXFIQXBhTlMyaG1MbWF3bWpMbFFBZzV4WW44Qlh6Smd0L1g0KzZRU0lYeklx?=
 =?utf-8?B?ZG9CVWxxVTYwckM1Z3M3dHlCQ1JiNlVRWmYzcFJ1dlVUVHhrbXpFK3JKMHVX?=
 =?utf-8?B?Z2VTa04wWkFEZWJXM3J2S0RZd3BENXFhV28zNElnOHRWZ2xtcUcyMHF6cE5k?=
 =?utf-8?B?VEl0YUl1ZjA1RlFMYXcyOTRSLzNOc0xYZVVlOUdSMVRzNnNWMXJNeStlOXNC?=
 =?utf-8?B?RDhqQU40OGxtdnlWVTk0Qno3bGV6Z3llTDFWRHR4bHJnRWxIV3ZUeUl3K05V?=
 =?utf-8?B?YkdYdjRza3BvMXJjSERqRUwvRWdiN01aMlY0R1NyU0JDclhpZThRMlFYQkp5?=
 =?utf-8?B?SUNqdnJ3RWpPS0tmYU1zR2NZZzN4UnoxK0pQZS9wREJRUFJGZjY3N3lOVWxG?=
 =?utf-8?B?Qy8zUnZMZGpnWk5JMUZISXpYMFczTG9WbnptQlVZb3dUd1lYQ1JuTUVnWG5L?=
 =?utf-8?B?Yzl4cjBLaVc0OWp2RUJQckxUUm9IemE5NFFkbnZQbHlld3F5K2Y1UklROGxE?=
 =?utf-8?Q?zlho09rB1LhmB5x145I+j/zXB7wLQXtf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWs4WjhKTDZGZC96aEFmS3ZYTXdXcHZhZGxoaDVtRWlxdHJROXVlVWdnS3Bv?=
 =?utf-8?B?d1I0aWZ5UFQ1TFBmSkRLdTJFMVhzeGNnWUVZKytGSlNhNnczUElXR3I5bVFO?=
 =?utf-8?B?RFBNNDc2eEptNFJ2YnFlTlJxQzJjb2dkc1JsQVkxNS9pWWFZSlNZdlNPMzBP?=
 =?utf-8?B?ZG8rTjZLQzN5aE5CTStXWjhUb3IyWUZsd2ZxMTVmeS9yYXFzaVUyR2xXWXA1?=
 =?utf-8?B?UW9POFY1Uk9tUEt4Z2RmV0lRKzNHbEhQdGtVTlVTYzBDZXhJUTlUNmFIL0dJ?=
 =?utf-8?B?VCt2eVJxZ1l6VFpVZmlhMlUrZGFaZWNsWUNUMVphT1Rhb0VRU29pV2pNZlRx?=
 =?utf-8?B?VEhNOFZ2bW90Q24zOGJvQ25RanlSQzBpZTQrNXZRbnV1dm5QL091OW05MERs?=
 =?utf-8?B?K1NoMGxYRVo1UkFxNWlHUFNhQUpIaXAwWW0ySlJKNnBKZUJPa3BFd0c2V1lT?=
 =?utf-8?B?TlAxSUdYVkk5TkpLNWc1MVIyaFBjN2dMSEJkeGVLQ1ZCZTcyei9xT2toak5B?=
 =?utf-8?B?Mm9wUTQ2aXFiR1BxMFk0dGtsL0QycjYvZTlqeGVPV2Joa2IrbjNIelRNejZM?=
 =?utf-8?B?bDloeDQ3cWx6dWdpVjdQTWk2Q3NEWG9JZDRSemFsd050YjJzUDNIUXp6eFJG?=
 =?utf-8?B?S1dGZUFJT1ljbVVjMlc3VzNqL0cvZmd2MjZEbHNYQUlmUFhNcnZLOEJxdkpK?=
 =?utf-8?B?OXRXWlRLb1pkTTVNZU91UmEzNE5uMUdUeTlWZ0NFQWZLUU9uWUd5cEYyd1VJ?=
 =?utf-8?B?RGNlWUNJeU9sVmM2ZzZMZERkQmV5T2hIWXhoQjgzOGZOZUs3cnpqRWhkM2l6?=
 =?utf-8?B?cnYvbXVrakFIUzh5WmR6dDFNay9OMzBvdFp0STF1OG0wd1NVck9HOWxuVmlX?=
 =?utf-8?B?VE1SV1pzOGpwVkpPVGV0cXBaZWUxbVRTRVVlbVBQejc5ZjEwb1lkdGNTbUtv?=
 =?utf-8?B?Q2V2WjM2Q3ZpV3dFSWRIQ0M5T2dGQjZMZjRQSndGMjJjUkk2Vk1UMURMRUY3?=
 =?utf-8?B?SFR0U1p3SElmMFJOcTkxZFVIMUU1eHBDTXZTRWZkS3ZiUkNGUDdKaWsrWXh3?=
 =?utf-8?B?VHpKQVZIK2tKbnN3MUFnNmZIc0Z2cU1VWi9GUkFCQnk1VGRoZStSVUtVZEJt?=
 =?utf-8?B?QWlZQlJTN1VZdmZTaEE1MGJqb0MrdHgrNkRmYXUvS2FSZFdKc1RTVWVmajVT?=
 =?utf-8?B?UStXTlZhVHFaOXkyYkN6TnVNd1Y0Z3gxN1BTS1p5dlhTQjNTRUpsRWtmTzBD?=
 =?utf-8?B?TmJxYy9QTkpPaCsveWk2UEZXTDZzRFloZncyUWRSUFNDd3ZscnhocGZuc25W?=
 =?utf-8?B?UmxFY2RPdG9jbnViMitTN1FtRVdSbDlJVDg1WFFrV05leThvSndmQ3ZpUFg5?=
 =?utf-8?B?NWgyNitvZXJrYll2NUx6dmI1MjJHSjdLWGhBQ3BuTWdINTFKRElGalF0b05O?=
 =?utf-8?B?TDJseG9RRGpvanptbnZxL3BlWjV5dG55YVE4Sk1yRUJxa1dCZmdYQlovazN0?=
 =?utf-8?B?bENWeVE2L2tuQ2xCZzRRUW56dytDYy8vQmpOU2tMNStDajFLRStWM2QweVVE?=
 =?utf-8?B?VFVTdXEyQlhnTTVlcFRnN0ZmN0FWUm5hdENEUFE0WHlJNEVwVnVGT0t6VnRQ?=
 =?utf-8?B?R25UNTZOQTVMTkZwN0JmYXhEK2p2OGFuNkNDNkFtOXhuT2VYWE43Y1U5Sk42?=
 =?utf-8?B?MXFVSG04QjF0SUpENitiNDNwWEx5NHZQMnlsVEozazAzV0tLMEJaUWIwSVdU?=
 =?utf-8?B?ZWZSU2pVcUVZQTBLWFUvUWRBNWNUQkZPc0xKYmtqVnovMUVjLzBLYmI2VE80?=
 =?utf-8?B?T2pBcGRndS9OVXZOYXRGZU5SdXcvUm9pZEtHWXZDM0NLMHJJM2pIV1p4SnVX?=
 =?utf-8?B?dWdCT2J2ZnVPcmZWRGd4cFBRVmt2TTN6eTYvMk5MNkw2aGNweGpxV1dTVEVw?=
 =?utf-8?B?dFljUDJLMVpWcUxES0R4M0R2a2tKQk1DYmljdkRhYmVSZzVDSUtqbU9UTHhk?=
 =?utf-8?B?dWthd1ZTNE93NkZUek9IaGxHTGs3WnE0VHZ3UEkxNlZvbENiTjM3U3lwQVcv?=
 =?utf-8?B?M0RqbW5Qalh5VWhla1kyelRvWEd3UUtYY3ExOFVFS1ppVUNKYzhNTjJOeDQv?=
 =?utf-8?B?V3lqaGpYbU5ac245dldER2R4UGxEamRsYXhyNVdVRy9UQk1WY3NUckFhS2tr?=
 =?utf-8?B?ejRZaFk0cHdDME9pMFF6RENZUk91MU1VQ0hBT1d0U254TkpaeXovOGhXa1lZ?=
 =?utf-8?B?SUJ5NFVZdXlZa2UzeERiaTRkNGVYV2o4bDJlaW5hMVpBSUYyeWpEZ1BxbkxP?=
 =?utf-8?B?WE1NYUtFcVljbnhqVEhrck5Mcy9VdDRJQk50RlBXb2R0S2tJc2R2azNnMGFR?=
 =?utf-8?Q?h1P/reZEeZ3NuDRI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7738e6-33a6-424c-c9e0-08de517b1be9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 01:37:12.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWFiFmKm90X3zCi/eX6i9yAf0h1WiDI1T80jxUVhSaR82d1BVCcan5aUd2XA7TROY8cUv7lqKQpSHdqJgSKapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> 
> > On 1/12/26 08:35, Matthew Wilcox wrote:
> >> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> >>> The core MM splits the folio before calling folio_free, restoring the
> >>> zone pages associated with the folio to an initialized state (e.g.,
> >>> non-compound, pgmap valid, etc...). The order argument represents the
> >>> folio’s order prior to the split which can be used driver side to know
> >>> how many pages are being freed.
> >>
> >> This really feels like the wrong way to fix this problem.
> >>
> 
> Hi Matthew,
> 
> I think the wording is confusing, since the actual issue is that:
> 
> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> 2. but free_zone_device_folio() never reverse the course,
> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>    be done before driver callback ->folio_free(), since once ->folio_free()
>    is called, the folio can be reallocated immediately,
> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>    the original order information, thus, folio_free() needs that for proper
>    device side ref manipulation.
> 
> So this is not used for "split" but undo of prep_compound_page(). It might
> look like a split to non core MM people, since it changes a large folio
> to a bunch of base pages. BTW, core MM has no compound_page_dctor() but
> open codes it in free_pages_prepare() by resetting page flags, page->mapping,
> and so on. So it might be why the undo prep_compound_page() is missed
> by non core MM people.
> 

Let me try to reword this while avoiding the term “split” and properly
explaining the problem.

> >
> > This stems from a special requirement, freeing is done in two phases
> >
> > 1. Free the folio -> inform the driver (which implies freeing the backing device memory)
> > 2. Return the folio back, split it back to single order folios
> 
> Hi Balbir,
> 
> Please refrain from using "split" here, since it confuses MM people. A folio
> is split when it is still in use, but in this case, the folio has been freed
> and needs to be restored to "free page" state.
> 

Yeah, “split” is a bad term. We are reinitializing all zone pages in a
folio upon free.

> >
> > The current code does not do 2. 1 followed by 2 does not work for
> > Francois since the backing memory can get reused before we reach step 2.
> > The proposed patch does 2 followed 1, but doing 2 means we've lost the
> > folio order and thus the old order is passed in. Although, I wonder if the
> > backing folio's zone_device_data can be used to encode any order information
> > about the device side allocation.
> >
> > @Francois, I hope I did not miss anything in the explanation above.

Yes, correct. The pages in the folio must be reinitialized before
calling into the driver to free them, because once that happens, the
pages can be immediately reallocated.

> >
> >> I think someone from the graphics side really needs to take the lead on
> >> understanding what the MM is doing (both currently and in the future).
> >> I'm happy to work with you, but it feels like there's a lot of churn right
> >> now because there's a lot of people working on this without understanding
> >> the MM side of things (and conversely, I don't think (m)any people on the
> >> MM side really understand what graphics cards are trying to accomplish).

I can’t disagree with anything you’re saying. The core MM is about as
complex as it gets, and my understanding of what’s going on isn’t
great—it’s basically just reverse engineering until I reach a point
where I can fix a problem, think it’s correct, and hope I don’t get
shredded.

Graphics/DRM is also quite complex, but that’s where I work...
> >>
> >
> > I suspect you are referring to folio specialization and/or downsizing?
> >
> >> Who is that going to be?  I'm happy to get on the phone with someone.
> >
> > Happy to work with you, but I am not the authority on graphics, I can speak
> > to zone device folios. I suspect we'd need to speak to more than one person.
> >

Also happy to work with you, but I agree with Zi—graphics isn’t
something one company can speak as an authority on, much less one
person.

Matt

> 
> --
> Best Regards,
> Yan, Zi

