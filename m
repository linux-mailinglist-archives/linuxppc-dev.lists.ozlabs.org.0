Return-Path: <linuxppc-dev+bounces-15770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897ECD22F7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 08:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsFhr5Nb7z2yFm;
	Thu, 15 Jan 2026 18:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768463884;
	cv=fail; b=T2kzIQFt0rSatWcFoDXp2mBsb2PvbpHRXGXBgYSIt1SeSbx8ir6lvLn7jDRcV2s9bVfTCvXzesN7M/ZDvdmWaiEConIakwUhdGmQo9EHy++4tW3o8Ot9Ie+BaHMON9cfE944mPm1LSzgYRgrOKvZj7dHtnc2icqD19Z7orERFS5mmRgzx7LQRWFFs9TCj7qqqVNmASmPX5BCVcuWCkExWAnnDyisL4wZMAhZRzbWnkzq3ZCBtfAsaGpu5DmZn23rNJOMDvbqGFKoFyMVP6p0AVvRjHs+ELioa8/9/8BF9rbQa+8IBZCaGB7uPyzdQ3GTxk0PycXGo5ngOMKfXswCug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768463884; c=relaxed/relaxed;
	bh=LxFkfqfqOTcbhnYzoDaunaaLMveA2QGXUz1sv8YUiTQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EUg/FOujodPYQQ6bUMf9BYnswb+0+rDi9oU6NedDyoHoNh9RDmcCuPR+RNrRVzyUMzED5ekcfRfHnkx5SKBqcGfWEdTnGIrWFkfrVrvU5qUf72mqMpeIKSt4AheDusGxt0F+Dz91teEGtoo1MDutIi3FYVYJrFSJNXl1AE7AuPDmo2b9b14QD1oC3fj27r7LX53hRqa4XDXYkNX4nYc/gWFzmQQ2XcQApc72baKncr6O1Vx3Qtj1inbqre90IRyWpU+OKZY1VrLsT6GIVFZmeqHwSZK+5akVXk73vxRDT5UJGuiG6uyX/D569cB9q40kGzqV88NF1z56cuSR4z08TA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7w8DNud; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7w8DNud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsFhp6kdMz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 18:58:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768463883; x=1799999883;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pUGbflTKQC/BJVFanjLBSlinEyzJwa/j71TndeMqIO4=;
  b=b7w8DNudmIKB2cUxnSyRi9GhUqH48jFNiHqcP+ndX4/tMFtjH2gF0M6p
   AQFw9bgTTdWqtR7afpspFhrj1euj0+HFXlQgQc9MQscN+zdINq1u9LQvF
   RVQFWs03h1FdOpTuONWkX1pUQedLglqFpTb/NoHfNB4OJwUAY5UJWqcOW
   x74143eYsh1Iiw3GUnN6kZfgysskVCUOdt6frNxlmj3ftWpOIMZEKhJzR
   gEWClo3ujkbGisDrrlTBkO/omrGMCf8UxHi2zhRabeerZ7wgXl+2rvvSA
   1R0ivooqeKyxfwKbinDBxecU4yKudgfO+hDvkJ0pZlCdttRW+4PkiEdws
   g==;
X-CSE-ConnectionGUID: YUmGRIYUR4mkrD4Gux2Fmg==
X-CSE-MsgGUID: aLnnO7/GTkq48iXN7rEevA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81212393"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="81212393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:58:00 -0800
X-CSE-ConnectionGUID: ejILirPsQYCfG23pvvJeww==
X-CSE-MsgGUID: pZ3MkHzRSvOerjN3HscExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209358978"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:57:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:57:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 23:57:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:57:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SunHax+5vEDxlDF0gKUwLX7/5Gc3m898vq01VYhB8sGbE6goQKndfPO2LuBb5MaRukIH/vRsjQCbkTTgcz7xBsqqJQ70I4TgAVxShB8/1XZXCj7chMvABMgRxSlxXlpJK5k4WBhuAqGkPIeXoirs74+8TVHziU7IPUJqzKokuhjIseKtbX0agH3jDiD0ltWLV2XdzM5oS9iHDYV8zmH8DAyAPU9r8ywt6gHgkr/S1Nj+kkK8wcC1CzZ+fzIz2PdBjJkbEKPqHYKrIjPbdJ8cAgF9+MzvDXOUKxD8Ukq1pdrJ4D58zn2sCuvMJPCo/wiwpN303gFa17jctNPsjh9ZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxFkfqfqOTcbhnYzoDaunaaLMveA2QGXUz1sv8YUiTQ=;
 b=auy6YwM0Ta8gVLwWYMQ0sieIdhJCg+v55VhZdem+BhaPbrQeSvhH2M13nIkQ/sKb+SrclHgPDjnyE+a8jiKGMFnhGQeNun2DOL3rhIsWpi/eZUP6gO/w+m43y/c0YMJWKdmraZLEH134g0Ol7eB486F4UtSSdsjSzJFh1iMfcUv3LIBJcHAYqH0xfVT8KXWSsdvdOrkNAd7A8e9+S9ZXcR3NojQSqjb1Oi1iEwrVTWNvBxxWsM2btyZ2EicWjkqbxYcnfNgypiz30n01RSWLYErC/nJwkz/nnQo+8/mKdAHJe1Z53Pu/DocfFOV6NXAbrFotsQ8s6TnJGvUlwAbtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:57:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 07:57:55 +0000
Date: Wed, 14 Jan 2026 23:57:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Balbir Singh <balbirs@nvidia.com>, Francois Dugast
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
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWieAOZx4Ghua6Bv@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <4cd42f41-660d-40a6-8365-e06fa4fca6a1@nvidia.com>
 <aWhT6i3lFxkqnbST@lstrano-desk.jf.intel.com>
 <5in4ndnpn2lwohjyxhibwxf7hidmens6twi7x2jtgwrnhye3jb@yuvuwph44fpv>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5in4ndnpn2lwohjyxhibwxf7hidmens6twi7x2jtgwrnhye3jb@yuvuwph44fpv>
X-ClientProxiedBy: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdff4de-a435-4d48-fad0-08de540bcac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29hVUtQNnBYMlNYN2RWR2loaHIreHN0cXJ2QVd3bWFIWDNmdmZKSjEvalJO?=
 =?utf-8?B?eUdtRGNHbE0wdGJvOXNJUEprbndaelVMclIvc1hZWmRSVnlNbHlydUsydFE1?=
 =?utf-8?B?empOUWdySllZSTJEYWkrSGtlb2VLT3JpakVuSE0vMDhqL0FGcVc5TTlOcWxW?=
 =?utf-8?B?VlpRRVoxVWxkd3lUaURsTWVWTTZxd2NNOVA4clRsMmJQYWdsQkF2ck9oM211?=
 =?utf-8?B?bVhXSkRLTml0WTArSmYvZUdTVGI5TUdCd2JWRElkUE1oODhaTWNOb21INUt4?=
 =?utf-8?B?TG5rMGhaSmNBN2RYaGRTSndMblNibW1JWEM1ai9ncDZGUnZWeXdYNkZZTDFG?=
 =?utf-8?B?NTNFZ3pjUSttTFNHTU5hcFZ6R0NxS0tBekd3WnZBZGt0cXBHRDRTeDBSVXZw?=
 =?utf-8?B?Ym1ZNWo2Tk5XRkV3U21mSEIyVE4rTXRKZUYxblpxY3dYQ2FJU2tYV3dNdDYx?=
 =?utf-8?B?Z2VoenpMTWZkalVkM1NuOG5mcndZZDdUY2J2TEVvZTJoWWZpTnVCYWdneFFn?=
 =?utf-8?B?QTdWSWVINCtDT1Z0eEtGcHUwaFJYQ1p3dWN6dUQyN3IxdmRsU3JCT3NDNGo5?=
 =?utf-8?B?S1dlRUdONjltY2tEb0k4S2k1K1FDbGNnOXVOK21TOEJLZDRWNUdkckdrSkdX?=
 =?utf-8?B?WmZRcDRWQ0J1YUwyQlFMeE03Nlo3M2V6ZWdseWtvZnNjWmxraUxaYk1IUHFZ?=
 =?utf-8?B?UlFvUkRJblFTRnJoc0xkbTg0SkE5OWVYZGJZQVBEOGwzbHM5QndKVVBuYm9m?=
 =?utf-8?B?UTRNbDVmcXhLcGc1UEJDNi9id3VEUU94cW1lWTEzMG9yVXhMRkx6eVcwdGFW?=
 =?utf-8?B?eEV3Q0dqWml4U1Mwelo5NCtaUzhEWm1nNVhXRWhDQmVhbU54UHpnNjhVSFVV?=
 =?utf-8?B?ais5U3dlc29Ia2IxM1pRYlM2NHJZZUppQXZaWkNBTmNOa3NmK2dZZDlsUVhZ?=
 =?utf-8?B?dGFFYXpORDU0MGdqVmpxcWEwQnQzRXZSWVpGMnozWXUzUk5UdVEwLzY1NVQz?=
 =?utf-8?B?b21oVXJzSDBNWE1UMVlidnpualo0bUVPcHY5bVhvRWQ3Q2plYXVDNFVpckJS?=
 =?utf-8?B?UHVabXdsS3MrVEVGWk9SWmV4L1MrVFNGeXZKMXdrdzdzVnErY1k4a2VJS3dx?=
 =?utf-8?B?WDF2ZExMQVUzNkdUZ3VsQTQ3UGQ5T3B0MmZodjV3Mi9RNGh6dERoQmRub0hW?=
 =?utf-8?B?bG5DZWdpTFhvdUppOFBwdlBBRmlid2ZySUVUMC9ndGxHcThZOC9WeS9YeFZm?=
 =?utf-8?B?cDFCMWowcDI3UWluTVhDNk90SC91bnMwSDVTNHpFRXNoM2VpdldYZ3lzYmcz?=
 =?utf-8?B?dDNvOC9EMnNmMGhPeVgra1lCNXk1TGI5NjVlK2xYTmpLNTZSZVY1U3hzbExj?=
 =?utf-8?B?dW1Vb3lUR1lVSGJ4WG9WdXgwcjBteVBiSUVhQ1JadGtMakh4VGRHanlTM0Jp?=
 =?utf-8?B?ODBRVDA1QWNGb1VwRy9RcS9PSWxvZ1JpL05QOXZlK2hkQlBkUFFhQlZzYnpr?=
 =?utf-8?B?YitSRUx1bVFyZGFValljZ085dE9Ma1E5WWRMc2hjVmxkdUJiVXd1clM2dGUw?=
 =?utf-8?B?MnRZY0xnb05ZVGtLZnUyQkRUeVRtbkpiOXR0L0ZvQXJTQkRZUWYvWVZIN2lw?=
 =?utf-8?B?bUNyMTBJQnpmT05EVVNDeHg4SkovTmdLeE9iQ1JFcmtvc2VDUUNRU01Gb1RW?=
 =?utf-8?B?OXJjK04rR2c5eVpjOVRhMXJ5SDRtdWEwNHllUWl0dkl5UmkwbGpUalpyRjQ1?=
 =?utf-8?B?azJnUTg0MGd3b0JHem04eWFWVHp2ZlladFNVaGNqeGExb1ducjYxQ1NMdmRU?=
 =?utf-8?B?K1haUjZ2YlJtTGpodmtvVDJRbHZ4Y1F6YWpFVlZLWG8wM0FpbUQ1SkEzQkVm?=
 =?utf-8?B?YWh0dnk5UUo0Z1FMeCszYXhtclZuN0VicWhYUkdOZFp6eHMwL2o2WmJ4eUhJ?=
 =?utf-8?B?c1BmWHRJcVB3dXo5OVBEdm14dkQ1T1NZUk9ZVllHSU96N3pXNVduV3J4OWxo?=
 =?utf-8?B?YTF2bFNSd1E2cThmMUpCQ0xSNjlGUERvYWowbWNIa1F0R3JjT3VpZmpnTHdH?=
 =?utf-8?B?U1VCd2U2em1xOE1aakNOc3NZTllzMHNkVm90SitZQXhyemR1R0F5YVVwYnli?=
 =?utf-8?Q?yGsI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlFvVnViVzZxNVFPbmJnS3hiTlVOcE9VNlY0TVhscGxqVDN3V2hXS2xGYjBs?=
 =?utf-8?B?M2QyVkNkRmthVE81Rk42M1Q1Q0NYU3JqSUxaOEZSRTI2akYrWDljZkVuTlV0?=
 =?utf-8?B?NE9aYVdtRXNuVkpXb05hT09IV1BUckVxdzlTSzRpTmFlZWZQaUowbi9rM3ZK?=
 =?utf-8?B?aTY0QnV6SVgxWG9zRXR1YnptTEhGb3I1NGVHZlZralhUT0FsSzVPb1E0UkZ4?=
 =?utf-8?B?dTI2a3JUV3VRcVRMZVlPcWZzT1ltbC9PeW5obFpyMFo5WkxGbVRsV2c1U2VM?=
 =?utf-8?B?RzczQkswTzR2QUdRb3QvZ3gxUW9wcWZnNTFndHRUN3dnQWxZNmhpRndyN3RP?=
 =?utf-8?B?OSs5YXFHQ0M0VlllOTh0S2htdll5a2d4bHF1aCtqYkZvWUluT282TDBpUnF2?=
 =?utf-8?B?UWhBVW5sekowbHRNck5CSUovaTcybzU5cVc1ei9pK3Y0a0IzL0I5NENETEo4?=
 =?utf-8?B?R001ZzFzRWJibUVEU1ovNUQ3UUJrbWt4Q1hzM0F4MDFkc0xvZlM2SUVSV1Ns?=
 =?utf-8?B?K2IrdjczY3h6UHhka3NxZ1JVbms5Qm9RWURHalU4dkVHcVpIOUR3NVN3WDQ4?=
 =?utf-8?B?bG5qRHg2VTZFMWo1SGpjc2R1QXVrWGs3YzFBdXBRWDc1OWhPQnNxR0lyOVAr?=
 =?utf-8?B?NlVIMFFKNHZVU2tKQksyaVdVRCtlbllWQXdGa3kyRE95YTU4NjUyUFVZcmEw?=
 =?utf-8?B?T005ZFNyWlN5M1NSWEMwQUw3UHlEU0VEUnNDM2FKY3d5L2lKK0w4SlpCdFY4?=
 =?utf-8?B?NVhnY3RVb0dFbkgvbFlFL3FCQmtveFY4UjRBOGJyUWR3RUVSbHAyUUcva2w1?=
 =?utf-8?B?MkQzNjdKQVViZ042MHBPcllINFRHTWsxQ2tEbUwzMGZJMVF6ZU5NSnpzMzJJ?=
 =?utf-8?B?RVRQQm14cWEvQ0VLNDFsUXowcThyVWFOK1habGd1aXhkRGhTWnVMRUVuaHpk?=
 =?utf-8?B?bXRKV3Z5UmpMdkoraUxwZTZ2eTUzb3dWY1htRHVpbTN2T0VDZlJSK29FRjhj?=
 =?utf-8?B?c240UUVQc3ZDenF1N1dMWld2WHc0Sks0cERXSGdkWENUKytFdUlkRlNPRWRr?=
 =?utf-8?B?em5mRkdUTGFNSEIyM3BpenR1M2k1WHdLdTlzc3FlNkw2Q0V3bzJqRXo1c1Ax?=
 =?utf-8?B?M0FkWlJwM3dEYTUzckpNMWpmbHRiVnpZYWF0Yk5OZHg5YVpuSTBrU1ZGK2pt?=
 =?utf-8?B?dFZaSWpmUE9HK2VsN3VVWlpQVitYSFdjbHBJdFRKOWxXZzBkZnNVMzdiQm0w?=
 =?utf-8?B?QlBoOWIxVU1COVdCVzM1T3VTUkNKd3l5MDZGSytjLzloMFJlVXlyaThTcDJZ?=
 =?utf-8?B?WWdLTlZ0SWRlUngwdjRNWGpHY004TkJKa211dEhuSVp2aUw4TFJuOTRBRnhG?=
 =?utf-8?B?M1hLVFZaSHVIQ2NHWC8rYWphL3hLQ0V6dnZZNU9UU01ZWVVEODE0OVZrc1JC?=
 =?utf-8?B?QWk5Slk3bFg1bExjQWtOMEhBMjV2TmFlYUVmTlcvMVFBSlV5dlN4dkZRamY2?=
 =?utf-8?B?bkxKeGZJZE01cERkRS94TTQ0ckZnZDRiakJlMkNsUHlDTDVDc1BGd3dYWEJV?=
 =?utf-8?B?dS85TDhVOUptVzgyN01SUmF0MWtKV1JVc3N4VWlkMU5mbWZ2ZGl0TnNyTDBH?=
 =?utf-8?B?OHdBWSs5SzVJcjQwWDgrUDc3M3BrQ3RKRVUzekQ2czNMSDZ0enFKalJ4S1Jh?=
 =?utf-8?B?aGdPTUY1N3JxT3JEcVJ6QUgxd3F3bzRrbWZqN1JZNDQ2NXNJS2NueDllbWND?=
 =?utf-8?B?Tk8zNkpZSG9mNmlpYXZKaDFwYVRFd0ZQRzAvMU9CUmZPTVNjNjQ5S1g1VmhG?=
 =?utf-8?B?MmpxZWdiaEc5bGJweHNzMks5NjZPWDBtZDVWNlBrbCtjY2JjQTltc0grNVdC?=
 =?utf-8?B?MXFrQ1B5dG5zSm1qS2VWMThtbW9kdUVWUGplcnR6cm9KbVdBcVJCUFBlMUE4?=
 =?utf-8?B?bjIwc05sNnkwQnhvV0t4cjMrSEVPeWR4UFJOcjVTWUs4b1doV1JGVUpocEVm?=
 =?utf-8?B?L1lkcHdacWx0L1pqN1lqV2o5c2ViWlR5OFUwbVJiSDFEM3E0NVFCUkZxTm5V?=
 =?utf-8?B?MGZEQ3piOVA0V0dKcG4xV29KN2pmNHVpTVhOQ1dsYnRzUXVhbGdiaFowSXhX?=
 =?utf-8?B?Q0hBTXZmaUlLZ043ekV5RmRBaTRNcVpORUlyVEZRWmk1eGwrYkhOU1NtbFBr?=
 =?utf-8?B?Mnh1ZTdGeHFqcGsvclliTytLOUFZTVZjRHQrOHJhMU1GNXNITDVrZ1p3Q3k4?=
 =?utf-8?B?akZmY0FwNjhNZVUveS94QnExeHU3eWUyNU94b3M2NmVnNDdhdlBETTcxNUxh?=
 =?utf-8?B?SVJKcFdFWUNNQWo4YUkySlpZSmNOY1RVUjlXMVhXeUtzcmtwaTZNQTBORk1X?=
 =?utf-8?Q?78AZk1uXGQSY55Fw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdff4de-a435-4d48-fad0-08de540bcac9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:57:55.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7R2wWnHhJrYlDt5Bxnayg8vtn1Sj8vkM1whymJ/2pUTvs5BcuYrjtS1tFIRX0B+ERak/aX249vyDEpm1N3GmOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 06:13:15PM +1100, Alistair Popple wrote:
> On 2026-01-15 at 13:41 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Thu, Jan 15, 2026 at 01:36:11PM +1100, Balbir Singh wrote:
> > > On 1/15/26 06:19, Francois Dugast wrote:
> > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Reinitialize metadata for large zone device private folios in
> > > > zone_device_page_init prior to creating a higher-order zone device
> > > > private folio. This step is necessary when the folio’s order changes
> > > > dynamically between zone_device_page_init calls to avoid building a
> > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > must be passed in from the caller because the pgmap stored in the folio
> > > > page may have been overwritten with a compound head.
> > > > 
> > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > Cc: kvm@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-cxl@vger.kernel.org
> > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > >  include/linux/memremap.h                 |  9 ++++++---
> > > >  lib/test_hmm.c                           |  4 +++-
> > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > >  
> > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > >  	dpage->zone_device_data = pvt;
> > > > -	zone_device_page_init(dpage, 0);
> > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > >  	return dpage;
> > > >  out_clear:
> > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > >  	page = pfn_to_page(pfn);
> > > >  	svm_range_bo_ref(prange->svm_bo);
> > > >  	page->zone_device_data = prange->svm_bo;
> > > > -	zone_device_page_init(page, 0);
> > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > >  }
> > > >  
> > > >  static void
> > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > index 03ee39a761a4..c497726b0147 100644
> > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > >  					struct drm_pagemap_zdd *zdd)
> > > >  {
> > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > -	zone_device_page_init(page, 0);
> > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > >  }
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > index 58071652679d..3d8031296eed 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > >  	}
> > > >  
> > > > -	zone_device_folio_init(folio, order);
> > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > >  	return page;
> > > >  }
> > > >  
> > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > --- a/include/linux/memremap.h
> > > > +++ b/include/linux/memremap.h
> > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > >  }
> > > >  
> > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > +			   unsigned int order);
> > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > >  
> > > >  unsigned long memremap_compat_align(void);
> > > >  
> > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > +					  struct dev_pagemap *pgmap,
> > > > +					  unsigned int order)
> > > >  {
> > > > -	zone_device_page_init(&folio->page, order);
> > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > >  	if (order)
> > > >  		folio_set_large_rmappable(folio);
> > > >  }
> > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > index 8af169d3873a..455a6862ae50 100644
> > > > --- a/lib/test_hmm.c
> > > > +++ b/lib/test_hmm.c
> > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > >  			goto error;
> > > >  	}
> > > >  
> > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > +	zone_device_folio_init(page_folio(dpage),
> > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > +			       order);
> > > >  	dpage->zone_device_data = rpage;
> > > >  	return dpage;
> > > >  
> > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > --- a/mm/memremap.c
> > > > +++ b/mm/memremap.c
> > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > >  	}
> > > >  }
> > > >  
> > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > +			   unsigned int order)
> > > >  {
> > > > +	struct page *new_page = page;
> > > > +	unsigned int i;
> > > > +
> > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > >  
> > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > +
> > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > +#endif
> > > 
> > > Not sure I follow the new_page - 1? What happens when order is 0?
> > > 
> > 
> > This is just to get _nr_pages in the new_page as folio->_nr_pages is in
> > the folio's second page. So it just modifying itself. I agree this is a
> > bit goofy but couldn't think of a better way to do this. In the page
> > structure this is the memcg_data field on most builds.
> 
> I still don't follow - page == new_page == new_folio so isn't
> &new_page->_nr_pages the same as &new_folio->_nr_pages? I don't understand why
> we would care about the a second page here.
> 

I just replied to another email—this is quite confusing, but let me try
here...

Memory layout of a folio:

page0
page1 <-- this is where _nr_pages is
...

So ((struct folio *)(new_page - 1))->_nr_pages is pointing to memory at
new_page but using casting to determine the _nr_pages location.

At this point, we have no idea if _nr_pages in new_page was set by a
prior larger folio, so we just blindly clear it, which is safe. This is
no different than what folio_reset_order() does; we just do it for every
single page’s memory within the orderi passed in.

Matt

>  - Alistair
> 
> > 
> > Matt
> > 
> > > > +		new_folio->mapping = NULL;
> > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > +	}
> > > > +
> > > >  	/*
> > > >  	 * Drivers shouldn't be allocating pages after calling
> > > >  	 * memunmap_pages().
> > > 
> > > I wish we did not have to pass in the pgmap, but I can see why
> > > we can't rely on the existing pgmap
> > > 
> > > Balbir
> > > 

