Return-Path: <linuxppc-dev+bounces-15751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD14D21C5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 00:35:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds2Xd3yQPz2xS3;
	Thu, 15 Jan 2026 10:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768433713;
	cv=fail; b=HkVwnA/Vr5bpm/4i8yxs2vQSFZve7DkOGGDQe7LUVjFuRZqeK66l15EWb2x/p9WAaj1oZjA5DbWriKe4uhciSpDVPxG+nEW4bLsJFR9kzkRhF130zMUKH0nVhxO5x9T2sQ5I+VsoTh40/koB1jzSS3xOgqHxDTPF0cgoGLandwGcUc4LNK+Mx4fBvj97HyY0Svs0bUca9pEVw4oi3H11K58nOipXl0F9WZA28oa+9715V8RWf+ssnVPG8XMJlL9yxIvWGalIvbbTaluLceLM4LzpQ5ll7UznNzWlweGtNRUGXcrBrdSDpBwq2dzPJH7CJMqQZmuuCMbFmKzh+EIpYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768433713; c=relaxed/relaxed;
	bh=ovaDhem9RfUk3RAV5bk7tNTaHBHZ7a7a21ExXE14uvg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nT3jdvXNFSib6Xd5FQMedrUKrqe0VQiztNxiFyiwNpdMKi3c6y7AtxKgo7uassxmV/9u5OdaSYEF+OnghHwS5LF6XqxmCD9ubONzQbQAZoEZ6OVOAW3oS6qejZXQKhY1mWj2ll6ttGmfAbAykSrTaxsRL1YznN+qzkNIL1ZYiUEwNY7oNbpjUmAg+EYEXDfpQgdf2Ax38jTnvixe11Yf+ZiF8YnMpAvUTXBz75pcwpWMI3H8wLP2kaXJ+7tyBYPYy2r9J6zkPutAqqd37JfCz5Z77+QIdUsgrQO2Ch7KLD96VK5i6+ikD4rPyjP1LuA1BSW6pZrccywwE9cqx1d1+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G8+weJRz; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G8+weJRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds2XZ6PTxz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 10:35:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768433711; x=1799969711;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RyYbB2uq7zAceRge+5vonDlsmjYwFL56nlxHnzDbdy4=;
  b=G8+weJRzbFuEI7qXYN9VWcIzJEy+53+3AredjY8tSv9d8mOoIEyEF6H6
   HI0LQKHFtRTMKgY298VtQWnx4N8CHLDgxBDEXnIofgRRqZtAAdL+jyjGh
   ucvosNnDfGSjfeUASbRxA2nlCKWkGQcfWxRQvyhLhGoqbH+wonNwgQQ7z
   tdfJifWeVLhIqbrQLahXj6r/YUIMSnLD0Ttc2akN0gXDN67h0ArTAECGU
   HmmEShMZqvLJozRRID5ZLGqBMPdszpqnfpOd8pinTSG4/awrqEXMsAOWB
   Ac4SCBNcIn4YNlUntlFdfRV+C7oIPWwRvGHietBkJnC3BJ+eRbtOtufmp
   A==;
X-CSE-ConnectionGUID: xYhXBbB+Th6W3Eqg1W6HfQ==
X-CSE-MsgGUID: TWXz4aYvR5ynaxTE7ShSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87320841"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="87320841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:34:55 -0800
X-CSE-ConnectionGUID: CmCjwDc2TL28+yBMJhejNg==
X-CSE-MsgGUID: 2W17jTd2T0GdRRG/+0YxoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209664990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:34:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:34:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:34:28 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCYrXZpmOJLs/n8xKjSuPZQXvQYg95Ib53UlZDYd5em79fZYhTJD8HDyxnws1rTvsXn/iPaUmF9i3JM1vCm99w56r/F+FkCgCymg2hPvDKUPfev0VcGTKoDj0rcdUGTdu9t4ERhyZWidSLgBglbuJBf4UU7Hjmyfyb69GJKrOfP3akT3J6sELScw7475sJydz6Yr8qc8JaRQLxNQRWaGtT/Tc9RRPySycy9uqXhBkPYKQmRhCsR9/GJPC5b0Ve14VOnZS9YTaH7vl0ZRhKySFoM7G99boC+SsEh++b1Lg6ka3TU5SgGWjV0ZeJmg2PQnOVt1qsrNzZ73C2nluLzIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovaDhem9RfUk3RAV5bk7tNTaHBHZ7a7a21ExXE14uvg=;
 b=dfuqZzUuQ1SFJeNVLSjeeEouD11ymGSE88pw1bUSymmI8rfjT15tIBdqmELYFbQRmMD+dXmf6vyjzADajw+XYQlB+VZR6I6W5OkOE3infTywW57gwaWxDQatQfMW7hvS8cOEVMKQfv4YCPhwukuVa3eu+hqVcr135v6qOa2LepBkJvbC2YQ6hr9tyz7vW9NAf27Zs6qV2PuP369qRWwGbWBuJCAQSLAsj5+EspvKk7G8k4eJbpJlAN1PIv2cOKNU9XeCKw2AAb6iWlGH4Ci+/PL2eM3kuA0TRKNzRpNwlpezaUHeRG8BhpZ92+wHN+Z+3lPHOo4kOm3pP3bsSBj8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Wed, 14 Jan 2026 23:34:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 23:34:25 +0000
Date: Wed, 14 Jan 2026 15:34:21 -0800
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
Message-ID: <aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: aa94c84f-066e-41c1-5a23-08de53c573d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkJQSU44cXNvSnIvLzJGUUhzSW1RdmFkSGorUEtuaWxDQ0hLOWl3VTc4cGww?=
 =?utf-8?B?VGlxczc2ayt1MHU0Y005czZTb05UeFFYNTJ0a3ZJanMrdVhZNWFsVFVxOWRS?=
 =?utf-8?B?aGF4WTE4c1RORmlKUGx3TzYrc29LUytiL2lPTjMxTTFVMUhMeG5JTFRMWXln?=
 =?utf-8?B?bWppQ1g3SDhVelZPaFdGKzNzdWt4NkY3b0t2ZnVyMlJyTE5YTDV2S1JaOFlL?=
 =?utf-8?B?QlBaek9pSzE2YTVSS1ZGUFduL2FDZ1RVcFVaNytYZ2k0U2xIb2sydzM5MjJm?=
 =?utf-8?B?bndUYVhZZTZzbHhzNkltbVJ0VFNQelgvU2pHRmZqNHpTeTF0TWNXQWI4bnYv?=
 =?utf-8?B?VnA2WkNEa1RzR01jcHhaK2lLQkIrTjZTeGNXNEJvVjNMSEdNWTZBNUltR0dZ?=
 =?utf-8?B?ZFFNcC85OFVEOThtM0Rmb0tpcnVueSsvTk9MT21QR3FuVFNONzQ3OVMxcUxH?=
 =?utf-8?B?UFExNUFVU3R6RW82TjJZblg1MDc4YzFhSGhzRWZUaEs4bVFKR25HZVZJbXlZ?=
 =?utf-8?B?aDdLc3daelNoL013OHFZallZUTJ5UDlYbERQVisvZHBkems0U3JSZENaZmN2?=
 =?utf-8?B?UnVPQmxQYmJUZEIzRklMR2ZZWURhS1VaMzJaV3RFUisvSUt4anVqVmhGQldn?=
 =?utf-8?B?MjdDVjF2V2t2VU1XK1BvWm5nQmxLUUZsQ0YzUkM4aXRvWFRtM1NuUlA3M3dk?=
 =?utf-8?B?bURvbnNHSC8vWk56aGtJUENLSXVmR0JPSkZEd05vb0ZRNGRkUEM5U2cwRVU3?=
 =?utf-8?B?N3g5cHM3NFVsNWJWcUo0eXBEeVF6WU1mRkhUeGUvNjJBQmpsbFhxOEl6Zldx?=
 =?utf-8?B?bEVlcUxoSmplNVdDbmlhbTYxbHRYZlpYWktPNDlZZHRtNnFNeGJXSVNQN0pq?=
 =?utf-8?B?SGowK1RrQWJJdTF4Ui9ONXBUc2tXcXo1ZWZtRXRkaXJhbWJKNU1LUnhjNW5Q?=
 =?utf-8?B?OVU1dVI0VWVCalVRRXNFREpZL0ozdzJUcGJCRlVnbHZHNHhQcmpmVDZtRS9Y?=
 =?utf-8?B?WXQwQlhkUjhuNkpXZFVLcDJvdE9UNzR5Rm1nUlBxWDU5RUgrb2ZXQVUrZEpm?=
 =?utf-8?B?UnNmaCtzYkNMS0lCcytVZUE5Q0I1MTNKMEdmMzZma0pqcnRSbEdWZUwxWWtv?=
 =?utf-8?B?SFFSS0ViRXdsUkhsU2Y2Y1lGTXV3K3N5SzEzRlVhQURpRThka1dQQXMzMUZv?=
 =?utf-8?B?YTF1VWhkVFZPVlN1SU1vL2UwQkhsZGJTNkgybnV0alVwZ0NRQ1ZkU1JkNEJE?=
 =?utf-8?B?WWdqeitsTnRKRGZ6akxJcTNnaXh4MVhEanRabWhjb0h4WW12VUpJMHdrN1pY?=
 =?utf-8?B?QVRvYjBRR0ZnSVBaUFdqS3JCQnlJWUFnN2R3dm80S09lcFMycndCMVhqSHQv?=
 =?utf-8?B?bDZ2cjkzVFJlQ2lZMmxTNS81cDRJTjJXa1lXUElGNTg0ZHl6TDZaWG40anl4?=
 =?utf-8?B?MGlkVXNIV29IdzI1a0xYek1IUlhUeDVPa3M2OCtBNmpsRTdtU0F5V2ZzOG1U?=
 =?utf-8?B?dHA5Y3h5Smx1YTAvZU9XQUNpYlUrVE9yQmxJMjhXR202bXcyTGM1YVMybURs?=
 =?utf-8?B?S05QK1lmQTlSY2FQZ0FzTVlkUHFRdU1jOCtkNzFoMkFFMU5ZbyswN2NRM1pw?=
 =?utf-8?B?T3poRkF6dk5zSm10TmEvU1cyK3ZBZTNWVmtldG1DWWpqTVJZSUgyZElwc1lr?=
 =?utf-8?B?SnVmMGZqWC90OHVOcENXWjdTY1ZzTTRVU1FDcWpPd2J0Q1pHV3kwNkkzamF0?=
 =?utf-8?B?UXJNdHB4RzFlMUR3Yi9SU1RWaWlXaFF6TE5OVHhkK2FYeWV4V09ZWVJvTTE3?=
 =?utf-8?B?dllLTE5NTExkU08wR3dXcW9tOVhoMUwrdUFXeDhZTVB0ZHRUd1JvQzdRRG03?=
 =?utf-8?B?RDVINGhUZGxSUzRSTDJ5d2ZQWnZabWhNVlJGV0RtY0pQUHNjbDZxeGo1OFdX?=
 =?utf-8?B?b1JBNS90TkNwV3dZaVFJZE85UXdCNXFSbXZJWGwxdnpQbnpqS2JzWVh5MmxI?=
 =?utf-8?B?T3FnTHFPMmkwb1J5YkpKdEc2eDFTSTRSS0JsK1lqVFNiZktXRUVENXY5bEFF?=
 =?utf-8?B?UC9wWW1QTDVNc3lFejR2OXpDTWZ4dnUxRlBJZ2xab1FBQVFxcDBHdW5ROUUz?=
 =?utf-8?Q?q+DA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9XbmFoR0NHc28rTmUzL0tPMFNWdUkrQzhuTURObjJVWHFJTFF3UytLU3JQ?=
 =?utf-8?B?bDVwTElmU3dCZU5lWWk0OFNyZm1IT1czNmtqUHZVQkdaUjhZbnNBeDBjMW14?=
 =?utf-8?B?RDRCMzBmbWNWNnA1SU9CZUFtQUVJS3FYazQyVGp2MnFUckRzazhMbk5XbC8x?=
 =?utf-8?B?OGRnZmNueHRHOThGczFVR2NjSzJSU2Y5M1NJSUhJS0dvNTJmRGlMM0Q0VFBV?=
 =?utf-8?B?V2g3alBzWS9pcnU5TzZTMUpBVG4vMWsvWUNiei9NWW5RME9QZW5KQlVXZ0NF?=
 =?utf-8?B?Z2dtT0tVRk90ay85a0N6bDNXcDhWUU0wa1NtNTZzUXArTnd4WGhBYk5JRHFP?=
 =?utf-8?B?eDhsT0tuVzBzUkh2dUpOL0ZiQlNZVFhXclFUc2VGbGpUNnhCSlAyMUN3L1hH?=
 =?utf-8?B?QzVQWXFkd20zYmc1QlU2eWN1b0Y0MzlCU0hRN2s0VGhpcjhqSnlOL2x6RUNB?=
 =?utf-8?B?bm9GU01tTWJoUytlQWxGbUNUOUJ6VmxIczRTV2YyK0hMOEMvS0lkS01QdUxt?=
 =?utf-8?B?U0UwNzFGbnJJU1BPZHdMRFRzSzFCYnRuNUVNM1dQV2FBeGtoSlFNSTZDTVE0?=
 =?utf-8?B?Y0hmRi9FUHFkRXJwVitCK1ZXeFpmbjNORkpFMlJOcDdWT2o0dzhiZTExMlha?=
 =?utf-8?B?eEdocWlTWVBnQkYwdXYzaVNYa1JiZk56enlwd092UG9uZ2lXbkYrM2k5MnBa?=
 =?utf-8?B?TEZJYTN1Qk5KZTd6S0I0UVRwQ2Zaa0pGT3Y5ekFGTmp2RGk3M2FnajFuejdB?=
 =?utf-8?B?T2dNT2FNNUNxS0pRUWoxVnJ6citpZFdUT0VvbFpHbGladk96WkhpMmEwVFQy?=
 =?utf-8?B?MURmTll4d3lPaGtHUW9KSUZLZVNpbDNPK2NuNW5xaEN1U0E4T25GcHRsZ0hv?=
 =?utf-8?B?cDFOMElFWWZSWkZHOFNOUVZxNXVYRWV2MENOd0ZsakdMVTFhTHJ2ZFhXU1M0?=
 =?utf-8?B?TnF2eUI1ZU5jeEljWis1UnFscDFQclhLTUh2YXJCYmpJNVNTMjJBSk0vR0kw?=
 =?utf-8?B?OE5jYXA0N1F0QlRJYWxPdFlXdGZnMnJiZkJyMkhyeHEvcEpoWUFWT3F2K0sx?=
 =?utf-8?B?WFpMUjdRall0MDNBYUJLenh1UmVWb2pBS3hDSHA3M3BVUTFQaGp6bDdqQmNh?=
 =?utf-8?B?c245SW5kdHJwT2htOHloVWRIeDNMT3BkbEloU2tKLytrRmFqdW85Q3NmWFZJ?=
 =?utf-8?B?VmlEZERteUsxYmh0eXhCN21RS2k1cS9XSnJXMEFjNDlZN0x6UUJHMU1hOXNM?=
 =?utf-8?B?UkVmUnQwbzErbkNLNkMwRG9QbjZUTmlMVUxpb1p2YjhFZDlVK1lWRVJlbHA1?=
 =?utf-8?B?cldVYUgvOTFVblJaZ0k0Qkt1Yy92VEtCRldNTGdKb2Y4TDNObDVENFRsbFJw?=
 =?utf-8?B?YUtiUkdtVDNhQnp6R2o2T1hRZmY0d2xCbWxHSlM0M0hCK2p5UGpLbnY0d1p3?=
 =?utf-8?B?WHI4eEYyd1BtY2NtcFliZitrU1pRRlpBSW9JclZPS3N5K0lOckxxbFIvSVRJ?=
 =?utf-8?B?ZTUrV0ZiWEtLRndqczZra0lNT255UXUra2lqTjFUTUNiOFdjSm9zU24rNTZ0?=
 =?utf-8?B?d2Y5T3hSNGwySjdxek9yY2s2UE81cERKWjJTQkRDMzc4UGlxWHRLV2cvS2xN?=
 =?utf-8?B?OE9Fakl4bWRQcTM1NjBUSGRGWnZVd09qZmw3Wk5DVFZYWkV3OXlTUWxRTVND?=
 =?utf-8?B?VERYbmY2OW1aNkJZdi8yVHhMbWw0aHZwNFBwZVJHZldoTWdQNURNMmJxMFFx?=
 =?utf-8?B?S2FnREwyRWp0Ty9jYmZRckFUbSs5K1FmdkVLR2Z3Z2tuU1h1YXZNRGdvUGFI?=
 =?utf-8?B?TFFTYldub1JGNDl2Zi9ac2xucEFLOWtWMmZ4M3h1SkVZRVRuT0tvaTljQ2xO?=
 =?utf-8?B?Nk82Mlh1aWQ3czAzRThRL0JjVjVMQkhYOXhMenpkejRCaFFEN0x4OGxGMUc5?=
 =?utf-8?B?ZmdMOXpGdGVsdlVIR2h2bzVENFFmMlQvN2xiWWN5cTZTdHVxVlJONFpkMDhu?=
 =?utf-8?B?SmVzUTR2YjAyTjNwb2JVSjkyVU9XeTIxVWo3b3VvVkJxVVZzWnNpdUpkYUR3?=
 =?utf-8?B?cmliSzdRTXZPZ0FxZ3lPZm85RmZrckxSWTlJY1hpWXlPZnFIM0tFQVh2b3pK?=
 =?utf-8?B?ZEErK1g5ZmxublIyK0Z5UEhTZTlab0hyY0cwd1VHYmRHb0NYZ09OLzBUU0J6?=
 =?utf-8?B?ZnBaLzJRN1VpTGlSajJpU2FaUFdiZ0JSNlVEYjRkbDQzV1hPWGtaSmdNTG93?=
 =?utf-8?B?UEExbCtadThNbURtWEFZRkJHRlJ3WnBqS2ZtN2FQSmlHRk12MEppdVR1NkJZ?=
 =?utf-8?B?SUNqeVd0ZnRUZmxEZEZQaUhLT0IxSm4yOVdrbmlwMTVmdklJeEZEbE9yeUd2?=
 =?utf-8?Q?wzMFe5FE+rjl/IaQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa94c84f-066e-41c1-5a23-08de53c573d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 23:34:25.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyDMEZB73ndGm1F4looedSCsL3EqSokjyCzKvOKye+nFQdyNLHz9G/bLiBTV00oi0Wvc64VfYMtkyp0Bs3YqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:48:25PM -0800, Andrew Morton wrote:
> On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> 
> > Reinitialize metadata for large zone device private folios in
> > zone_device_page_init prior to creating a higher-order zone device
> > private folio. This step is necessary when the folio’s order changes
> > dynamically between zone_device_page_init calls to avoid building a
> > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > must be passed in from the caller because the pgmap stored in the folio
> > page may have been overwritten with a compound head.
> 
> Thanks.  What are the worst-case userspace-visible effects of the bug?

If you reallocate a subset of pages from what was originally a large
device folio, the pgmap mapping becomes invalid because it was
overwritten by the compound head, and this can crash the kernel.

Alternatively, consider the case where the original folio had an order
of 9 and _nr_pages was set. If you then reallocate the folio plus one as
an individual page, the flags would still have PG_locked set, causing a
hang the next time you try to lock the page.

This is pretty bad if drivers implement a buddy allocator for device
pages (Xe does; Nouveau doesn’t, which is why they haven’t hit this
issue). Only Nouveau enables large device pages in 6.19 but probably
best to have kernel flying around with known issues.

Matt

