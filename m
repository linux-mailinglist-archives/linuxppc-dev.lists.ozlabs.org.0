Return-Path: <linuxppc-dev+bounces-15594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BBD15BC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqp235sjqz2yG0;
	Tue, 13 Jan 2026 10:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768259275;
	cv=fail; b=EYNWh+fLHO9h3Bouw8UzU1oWptt/yyPz1nQSEGqIKTwDzbY/W+q8N+twzGNI9ZRYE7oZxLbPNovsw+nK9ijd5PLWLy9d0RGfopJa7Eio83SoYyymzVFkzV8NNBh2WShbgNTAxWIEs83GJrEFikgTrVFaK+H2OEQglTgbsyMSdMTwgy71iLjacmOsojS+HyMaTcWTCcdmvo1SNn5jEOBrP1o392vt0rcwLquXcqq8STclyu6zaxqj8mkEk1JRrXU2iKQE1lNudRGSJHiuCoZoSBESp0cWomOKWga6Aro8m9GcB2upBYqwoSnOEgzhNIj+Kn9jNxjvC8VexAzGWmv4ug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768259275; c=relaxed/relaxed;
	bh=OsCEeHzixQq/jJGKBfSuALnMO45i9828Rit/pT28dck=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RUHO6CLVWAvnXCpk2UoOHMB6fY0cbW7u718vErgsxm9QorkN8uqy1Q5hbp1FqCXIuoGfhZJqKzmcWKZlju92P2EgH5CJUT1A0w+NRxokxeT74BP7hea4YCJsHzbfRSlolSZ49dkRmWbPzhD88VP+q8bl0P12V/ldcwBzbnidEANRx5kQ/p4LvUGNiWuz1B1imwFMFhJx6xY0JOHHPElJrd7ASKCNNG1Bv4X2XB3HEMwrxOh/KRaPvVn9iHOAlTpOms9MpS68ybraR/cJhWZR/ED2FzV89Zhe1/jp6heybF1UWeBEH3FbIMmD3LDFRva0X6oc5rIK6/e2MEz0z83BcA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ot40sXLD; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ot40sXLD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqp2042Fmz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:07:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768259272; x=1799795272;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TY9PdHZd1pZv1622LgGxftKNJ53j+MSo1XXf/SCzxHo=;
  b=Ot40sXLD3gpKlmI+rS2I1sqgyvMu22sC4caGw8X6nGo6qBKOp8KkHXbb
   57u+Cij8zrp+zjx9UMqutv/HWVONH3nHL8o7Z5FFul/MQb5LB1JVuUNQN
   r/GYG538ogjPG3WHsDGl8X4IX+kKVAb3AICnw7qrXmUDpprnqM4ckpUQd
   OHaj8iTw6trElJzPdvrHspe71qqV4jY6PzGAQR7NyAW39ECxkWbarmaYy
   7Qrz4M7dKfJj8eqpOxaPBx4bC7uY/BDR5SbhxGBfu/E8iLzzNSsXqaE1i
   kjkufHEhlST163Kxjp1XeMa8GhYWTUNUrJEjWZO8t2H9C+j9My9AnGwUy
   A==;
X-CSE-ConnectionGUID: ucYHyfX2TKK5euv/sETYJQ==
X-CSE-MsgGUID: 54p7lhpHTY6WU3pm6gHhTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69593382"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69593382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:07:23 -0800
X-CSE-ConnectionGUID: 3bDnGGmCSWCWmdEgDFFz0A==
X-CSE-MsgGUID: ge7jWs1HRO2LWwnmuyN5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208734757"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:07:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:07:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 15:07:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1jvUOqs8B0bWQNMgITQRga/rUSbNwn0qbrFtylM3/OHmfqZ5xdK92peUo5h2X18c7HbZtufcMPoCQj36Yc85ABFC9uJKF6G0u7XM4rVFdTBY+7RIHUuBEqin9EY4y08sCyPTdqdaNbHjbtV1MPhLpfWqV2WyutNUBe2HdTvxmyqoz9b6nkryha8aztRt21ku8/R9Hbim3jp1Vk2C0A4eEzRrO2HWN6J8zSbxykrndZbRuS2L+xx3COUs5iKUokzSliPCTFGu+UT3g8fm/mCKiT1Kcl7TBg+hTJslud+AlKQts3ooGB6cZaFulylbAQzyQ1AH0uBI916CDBHmDxt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsCEeHzixQq/jJGKBfSuALnMO45i9828Rit/pT28dck=;
 b=tm/2NgiNVbCowBs8LMxhiOIg1b+0rtkoyrvE30mnTOj7s9TmJctdoEOlM0CYyU0VQ5M1VceZVf4xdTV6n3sZQO/Np6JauEiRZ8qgMQC90sLSZqyDtMjQH25kTsOLq/QwjJzt0KwEE5/xUMjNdepLJIYow5WVJlKftdu8d2qF/BT3S/A9XJSjsjTJWa2MJB7i7DD4wyBcG/bLvM9rENjirk/LN8AWxDuaCrihQ8/XL575OANcKGhs6H3UVJuRonPooH3gmXjPWCUhgr24UygHEnlHRsYoa+YG5PtG+a5pZCoS4gGDJJQvvJK2pZFfFx8+MzDNMG5T3Or0VkcBx5Kq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 23:07:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 23:07:20 +0000
Date: Mon, 12 Jan 2026 15:07:16 -0800
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
Message-ID: <aWV+pIBkDlgvnPrr@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112165001.GG745888@ziepe.ca>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 400f3175-9aeb-4a22-36a1-08de522f567f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1dCNzUyZSs4ZTZtay9UVmlTNEdvbytSbS9zeTJ2cDhDWHJnd2ZBSGx2bWl3?=
 =?utf-8?B?NkVFanZJZFdEcGxEMDJ5TjJwdnlHRm9iYnhMV0JERUlqNXJDSW95TnFRK296?=
 =?utf-8?B?dlZwL1Y3ZGZNeE5PNUVJM0MwcmdHLzhPckdvRjZXZ2VuQTNlU3lrRjFUWVJy?=
 =?utf-8?B?MFUrcTBwTXAwN3VXemR5L0pUaEhZMzVMcitQUGt3TURodzU4SldCWmZWRXRJ?=
 =?utf-8?B?OGVWVFRFcW0zMFJuS3hCRTlSQVkxRytrQTJXTVFtRk9ZUmxuODY4QWZQcHRZ?=
 =?utf-8?B?eTB0eVhuY2RDUGZEaExZekZuMStjM01lRnJTSnlkV3QwTnlRZmhCOWtQNFFH?=
 =?utf-8?B?NXhaT3pXSHpaV2lFUWhFNXp4WjBHSlBiTW8wbnJURVpISWVoaGIwbUpHWWVH?=
 =?utf-8?B?dTRIam1EZnJhMTdHbnJHOE9KZ0tvOVZSQ1gwMis2eWdSRFY3T2d4RVdMRTRP?=
 =?utf-8?B?TFpKa0hLVGlqeS8wVk0vR2xuSk1tbVkyMi9GRTlMd1ZGbk1KSisvWVUvWGZP?=
 =?utf-8?B?Tlp0ZW1jeWhuNUtROFExZ0pSWE1DRmtBQnFUcm5BZ1VDUzM5RDFFcXpsZ2Ft?=
 =?utf-8?B?Smt1NjgydEdUcU9Pbkh5bmszRDJJQXZBQ0N5RnRrdEwrVFFuaUhGMTNjNG5y?=
 =?utf-8?B?eWJzcC8zUzNqY3lhSVpLbCt5ZVJnMHpZTUlUWkhHMGFwSlVMamFnY01RbjNG?=
 =?utf-8?B?bzFHNU12LytJVDl0M1ZxN1BBRXB3aXk3T0UxODhHNmtnNDlSbVUveHE2RHNy?=
 =?utf-8?B?U2JYNXMrZ0xCdUNQOTZNUVlyaU9kcFJ6NTJGam5QUGtPOWhTZVh5dUJFOC9N?=
 =?utf-8?B?OVRsRUM1ak1JUEZUTlBOdVBHY2tnYUJ0Nmc3RjU4eEkxTnAwSkVsN1ZFOUd0?=
 =?utf-8?B?KzJPaThNNmRLK3R5YUJZMi9OakpHYXV3SS9qanhYd0RtMksySjhzL202RkRw?=
 =?utf-8?B?b3kzV1lRMlhyWDhXbFNsb2xmT1g1a3YxNU9zUDYwWU9waUtaZ0MvRDZUUmJN?=
 =?utf-8?B?aWFBQ3RXdVYrZGlBSnk5bXcrK1VMT1JqYmFFS0diUG5xb05NQWlHZmZkSGIr?=
 =?utf-8?B?K1R4SlJ6OW80UlFsY3k2TlN6VTd5NVhjQ2hYeE9zaXlSVllIMGdqV3l6RlFj?=
 =?utf-8?B?V3d1cXpWdVdpKzRKMGgvVFBXQkxzclpPZ0pnWi9XcXRaWHVBeEhLM0dHWkw2?=
 =?utf-8?B?R0JPaUZPekdJS21kRmg4bTI4eU9SeEVhT3JPb1FwZjUxL0lQa2hLZks5NVdC?=
 =?utf-8?B?M1k2MjRCOGkwRUtVcDdJdWN2YTNxWXYyMmxDNHpYQ1RPUzRJMnhvQWZKeWZm?=
 =?utf-8?B?VUMyWS81aFRrT1pEMlVMNEdBL3VDUmM5S0tVclhMU0dKLzk1Uk9jSWsyOGxn?=
 =?utf-8?B?d3MzeUZjSEFxemh5RERRTWtIMUNzSitEQ3pubTVneVFTVnZLbk9JZmw1VlRU?=
 =?utf-8?B?S0RxdFlVSW1BS1JQSTFyYUY5anNFMmhia3g4eE1UaUxHMWpDMzVpWC9YQkox?=
 =?utf-8?B?SzMreVQ0UUM1VU45OHNwOXcrNHl1ZTJMclhqZThmcU0rSEZab1hkeU9JWjZn?=
 =?utf-8?B?UFM4YUVEeWJ2UUczczhNbnVhMkphMjFNdUtjeUkwaUNOSGtaWTE0S29EK0s5?=
 =?utf-8?B?SlF3S2JCUG1pK0Zsb0lVR0FRZWFjSU9DR09TcXdNL0REZitFUzJOeWJPaWdJ?=
 =?utf-8?B?dEJpeFdKMnYwVDMzQ3E3SUxqa3FKRjFVb01RM0J0VW1sQU5XVThKK1M3aGJM?=
 =?utf-8?B?N0hVclEySDk4SUwra1ErcjJTRXNBWnB0dEgzMEVFWkRVN0t2ZC8zRmhwbVgy?=
 =?utf-8?B?QVVIK0crYnB3NFg3VG5nOTNzWmx2bFIzSUZ3c3BrVGtNeVg1bW9VZ09LSU9P?=
 =?utf-8?B?cW1sSEtJZm9UUFZiK2ZYdkZ4djEzSUtzWm4vZkljc0hlYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlczMTdTR082dTVkSDBsNTNEc2hEK0RCVFo0eDN6MTFyTU1mNWlFcFppczBV?=
 =?utf-8?B?YjhPYnZ3cG44b2ZEK3JDbmxEeHJGWUxVUUduVjczc3c1VzdrYzVXVVhVcVhx?=
 =?utf-8?B?eFZZcW9kWkRxZ2g5bHJNMUhtMWdrazY2NW1VSEdZSkFvQ25sVWROU2JTaUs4?=
 =?utf-8?B?TzdpclVpU0kyMkY0WVhZNG50MXd0cjhKZ1BleldoTy8yV2ZJdU9lb1Bkd3N4?=
 =?utf-8?B?WmphWHdkaGdxckYydnpUdDljUnFvL2hSaUdldG5LMm9xNG85NVN3d2R3WENX?=
 =?utf-8?B?eWFiS3RmdGNSNkRsV0cwZjBsNkVKQ3BKWEJtcDJEdktqNkpyMG9BRms5ai9w?=
 =?utf-8?B?YW14bkFac1hCaWtkdHhPRWFzZ09jU0taTkdGK3BJcGpSZmU4MUpVNTF2ZjhM?=
 =?utf-8?B?Y05UdXR0cjRKSlRjcmhBZXVqSWtGdWtkbnU0RHFOdHExSm0zNHR2d2hoTnZT?=
 =?utf-8?B?U3FWVS8xdmt1STNhVXMwemxRTzRKb1ZvV0JSMUMyNmlrbFVxVTMzQlJSZ3Va?=
 =?utf-8?B?alZmTFk2UmdnWFFqa0xCN1c3N3MrWlhPZlpvMDc1bXcybEh2TUFUaTc1K0Ji?=
 =?utf-8?B?aWszQmpCbTF5bjNJYkl2OWNCaWlGYjB0aGQ4Vm1DRFVvTWI3UWdyaUFoNk5L?=
 =?utf-8?B?OXFUWUREbTg2TWhqSng2Zm1PMmVLbzRzRlQyaVdSa21rT3NFZ3Brak1FN2h6?=
 =?utf-8?B?d0ZGeHY0K20rN3NXd25oTVRKUHVzZ3huY01VVDRVaHNEa0hRSkhDZnRYZmY3?=
 =?utf-8?B?QzFrTTBjbm5tclhBN3FoY1k2VHR4Z2p0Q2IxeExaNUhzVGdoZlVkTkx1c0Vl?=
 =?utf-8?B?QjVacTF0akJZYm4wWW5yQ3ZBZlkrMmpxU0V6UHpObGtzNS8xNEVlK2tMZ3I1?=
 =?utf-8?B?b0R4dlVkdlVYYmxETDhtckJsK3NGc0ZZejR0Yk1KSjFGc3NTOGcrWklGWVVP?=
 =?utf-8?B?bHduWm94RFZMei9WbnhDdUFUb0ZjeFNSSVJUbGdlOFU0RjVEM1FwdTlSbHRO?=
 =?utf-8?B?alZZMWd3QzFJdUlXdzM1dnRzcEZEYm4rWXFKc0ZjcGtmTjNpUGJzRGJ3a2Yv?=
 =?utf-8?B?QzRhZ1FvK2U1WkxsZUt2Rzg2VFpRSVpzaVZSWmNNK0p4WTBUZXJqWTQ3WERx?=
 =?utf-8?B?bFNuNE1kcmpGRUZsWmZ3b2JtcUNSWFREaHRvMWRzTmw3N3ppekttUzQ1bjFV?=
 =?utf-8?B?bVI5WlpRNUU5ZFpCUU9KRjNuTkVEQmZNSnhDNFkySEU3d2xQVmphWWhQTXEw?=
 =?utf-8?B?RmtUUnhDUTJvRTE5US9XTk5zb3lSdDhmZkFna0Ywd1RYZndLK2JUSWp3RWZL?=
 =?utf-8?B?TENhN0FPM21TSkxvVjZmMHVyQVVtdXR6SHZrczc5VnYrZGI3UGNTZ082YWVz?=
 =?utf-8?B?RDhUNW1LNTQ2eVBTWWpXeGc2TWNSQVI0RGYrN3dlR01YM1Qrb1pMNHg5UFRL?=
 =?utf-8?B?TFZ5MVQ3SUo5cXlPakRyNG1zZHcrc053czRxUzBSbTA4ZHU0ejRuUFBwbmJp?=
 =?utf-8?B?eW1DcFVUOUVhKzBORUZaYjZUMm9RcC9JYlF1NjJRV2w2bGdNN1h2NlNCajlZ?=
 =?utf-8?B?WGMzSnNNRUVsSGJCYUtCTFBwN1FaRGZjdE9ab3hzYTJjUjI2NWdybVBQTzNO?=
 =?utf-8?B?L3JOSmZnTnhZRmppWmpCSWE4d3lmSXFPbzFYMk9ncFFOVE9EanVlMGV6cXdq?=
 =?utf-8?B?LzZEcTNSVmptUWpObHpsUWZ4RTZhRXZrSEpiNkw3NDNqRnVXVEdmeE8zeXRk?=
 =?utf-8?B?NWlBWVczRVBBa1NQdnE1M3dlaHNVZGo0TUUyczc1VmhnY2pEaEYzeDVjMDAw?=
 =?utf-8?B?emhlN1laTWZXRFNOOXJOd1IwekQreXBLelVnSzl2ZnNDcmZ1YVhTQXluYUwy?=
 =?utf-8?B?aUQ4QXZ6azY1UFZ3UGhnYk95Y25tL0ZpbWY0cFQrYml6enNnUG9pdGt6UXZt?=
 =?utf-8?B?dUpQdnpLanZhL3UyUVpDRGh1ZnBZbUpqbW82TjFzcnFpaUNlYWxGQ2xJSkZi?=
 =?utf-8?B?R0dSSXVqdjN1Z20zYjl5c0NKY21ldjdoSDdBb3E4WXQ0UVZEdlllbmp2RDZ6?=
 =?utf-8?B?NlJiSGFqb3M3RnVuZDk4Y2pYNmczTVVlOHpjeWlZQ2c5Yndrb3NwczdtYVlG?=
 =?utf-8?B?c2VMUk9pTms2b0xXM25vVkxZWHFLc2Y5S0ZmV1FrUmo2NTI0NzBLV1NCdW53?=
 =?utf-8?B?bGU0a2NtdlhnNEs1OVFvQ0NDY09xODFzNGZtZFBpQW5XYVdSTktTYk9RaWlm?=
 =?utf-8?B?OENTTytZcVRoRHpDOWdXSVpYc0gxbU4zN1J4QVRCTnlkK3U4aFA5RmdFTG5s?=
 =?utf-8?B?U1VWRGxqUHBZT0Yyc1IwSWY1Z0pVVk5Ddm54cFk5U25ZUlBkQUJnWHFJclJv?=
 =?utf-8?Q?qu8W5bYnhq73JDHQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f3175-9aeb-4a22-36a1-08de522f567f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:07:20.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rOsCvGWBmuq+axcLVOa8aAWLUomYaurPjdnpq6Cx6/X0DpQKYx+hpNcFjjGkHmFSs65XvFqsu4Q7qqSamsijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 12:50:01PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> > > folio_free()
> > >
> > > 1) Allocator finds free memory
> > > 2) zone_device_page_init() allocates the memory and makes refcount=1
> > > 3) __folio_put() knows the recount 0.
> > > 4) free_zone_device_folio() calls folio_free(), but it doesn't
> > >    actually need to undo prep_compound_page() because *NOTHING* can
> > >    use the page pointer at this point.
> > > 5) Driver puts the memory back into the allocator and now #1 can
> > >    happen. It knows how much memory to put back because folio->order
> > >    is valid from #2
> > > 6) #1 happens again, then #2 happens again and the folio is in the
> > >    right state for use. The successor #2 fully undoes the work of the
> > >    predecessor #2.
> > 
> > But how can a successor #2 undo the work if the second #1 only allocates
> > half of the original folio? For example, an order-9 at PFN 0 is
> > allocated and freed, then an order-8 at PFN 0 is allocated and another
> > order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> > without corrupting each other’s data?
> 
> What do you mean? The fundamental rule is you can't read the folio or
> the order outside folio_free once it's refcount reaches 0.
> 
> So the successor #2 will write updated heads and order to the order 8
> pages at PFN 0 and the ones starting at PFN 256 will remain with
> garbage.
> 
> This is OK because nothing is allowed to read them as their refcount
> is 0.
> 
> If later PFN256 is allocated then it will get updated head and order
> at the same time it's refcount becomes 1.
> 
> There is corruption and they don't corrupt each other's data.
> 
> > > If the allocator is using the struct page memory then step #5 should
> > > also clean up the struct page with the allocator data before returning
> > > it to the allocator.
> > 
> > Do you mean ->folio_free() callback should undo prep_compound_page()
> > instead?
> 
> I wouldn't say undo, I was very careful to say it needs to get the
> struct page memory into a state that the allocator algorithm expects,
> whatever that means.
> 

Hi Jason,

A lot of back and forth with Zi — if I’m understanding correctly, your
suggestion is to just call free_zone_device_folio_prepare() [1] in
->folio_free() if required by the driver. This is the function that puts
struct page into a state my allocator expects. That works just fine for
me.

Matt

[1] https://patchwork.freedesktop.org/patch/697877/?series=159120&rev=4

> Jason

