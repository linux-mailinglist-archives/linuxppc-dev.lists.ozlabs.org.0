Return-Path: <linuxppc-dev+bounces-15760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2549D2259A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 05:05:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds8Xw4Fq9z2xrC;
	Thu, 15 Jan 2026 15:05:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768449952;
	cv=fail; b=G1PfL5w5tfbds/C7LFOk8cpWqvkWsNvyMyyt3yt9vs21iyyk1th6lQshTRN6Fv7iXJBYhvQQgLSNhhmfOsQ9MVKX7MCZYiQdJdytfFIx/JiEbKEJMPjIVLy9LZbOZAfoa/BAvlaRvCoj6L6ZPqMsdj4P7e1E74D7Qr6haPAQwtF4AE0KZJSfkrVahkPKYJJrKEmEaSxKUV7WHDHfshYy6g23AC+vGLI07dh6tjcK91xwDXhPhIi3fERfEUfJv0stnNmrj2TAymLKqiO6gGEVi05X84nychn+Yoashdyr4fkfU8Fk7bDBvbFbzgqyeTZlLEnECm7JJxlxdqgcWP0WSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768449952; c=relaxed/relaxed;
	bh=NgUl5R1q7q4noZVC/b5/CXDeXBSKSumIfbRUXgDrQ74=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c1pGb41f7hEGHRvdrBllcWJz/mtq2AevnxgB/FDtiyXp7fhATizXDN1TGD/vTrc9QXsElf/0JAdMVvCqglkzONeM0ySfp/Bk2EJxKMRzt5FAPNW0ek+8DFYWm1Azpfo4FRw40AaqJmgi7aT6bwCS/QdYcpI4gvMY7C8M+g4tYkoNRVmLNBpR1M1Q6AhltahswJAqIG7I6RZyOJhfLYHOslOS346zZmak+dCJHx+U995H6tpyV8fyrSFO/gGZV+UdNyg5/IuwD64TQYyjSAGSedwNVjbONNBZkTa9LZSMPEjZGPdM47wK4XPrkqMrpemTtgrEqUULIccHAqQO0Lrt4w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ETIhyIaJ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ETIhyIaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds8Xs50NCz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 15:05:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768449949; x=1799985949;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5OjXwXvrPCFd+bH7mLfue4ei69ycx3nIsP/Y6eCnB4E=;
  b=ETIhyIaJiDM8HH47aPfGMTKuL06H+4vAK7JZjze5FncvCLL8xyMPMjsl
   KZBtz7MF/HA5VAoFJoNAnihlTqkhy5nLV3lqzvsWK0b2WQG483G/yF0or
   7hC1/xmX7sd/yQvOuPiC7w4HCwOoBPKdjt/vFiA+np3WoZ0wO5koAUQwB
   e+cHDXNdal1+Ka6KhCsh6EWwfRUbUKfNM7PyZBmxpBQsWG+OHW0Qqi1Tc
   5RHrkTo/+NUT8Yozh7J1TN3ZBNhu1kDMMEDtrcpp0dLJkyK5a1ZQZWrx6
   6E+rquCrA09ZkjMb9335xRi45Ktbqn3xruFAOQmgq0zk9OIA1nRNmU4j1
   A==;
X-CSE-ConnectionGUID: DTkTiRk0S9CFeoQWZAwqgQ==
X-CSE-MsgGUID: X6KI/b1TSPmFHiMaZ8spYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69842389"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69842389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 20:05:44 -0800
X-CSE-ConnectionGUID: HDdg4VNURWS4d2uNkMsE7A==
X-CSE-MsgGUID: Fixxdf+CQ/yQaaeKkX2srQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 20:05:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 20:05:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 20:05:44 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 20:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGrab6N8PkDWfZ+s0u2pNaQHArs8Lujdasm6W1q43K5IzaYNmoT8yn21LX4gVTmmBT4e2z0m98EzX1BUt6d94rD+dk25sTBoWyyrLQcQ1p7rI5fDwjNLY4RjAwvkLRRnPzO9//I/3jRAt5+oJQEIgvnQ6GxCgT2K2pSHJWl/frBFcIpwWH1MKma+VTYZetTEtcGnR2GXrH5Chil+wvSdXq0MR7T/7SSGv6b1feW8w3y45Qks3mblvUHidYL9whzVxiaBrCPmkQhos6QQiLVVxpmcT6pGXtf8rMalnt+IusLlSuh9CtlN/+RKsGtsktWULW/gDb/3OitAWzlcRpgnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgUl5R1q7q4noZVC/b5/CXDeXBSKSumIfbRUXgDrQ74=;
 b=NAv6BiMgEHtXpNMIxZIxgGa2CKBHkvQ7k58t2fF642v3GR1qJQ8MUqM5RB+UxytjU4ZD4bUqW9GR8cqGfIJGsmtXgka4micDfNMRPYc1Gj+WGe+eVYbjfk0tnK0yukxmOWzDLc18PnjFMJ74Z3XTKvNWqN/z2eddvyVfeZ6KsI289DNM+fAg2MJYybokTPHZ7lzahBOEhPCMAHq5b/DXfj2lfpom0i1ueEtV0SI+u7wD+6GL3KuZYP0DZ6FcqIabVAyHEmtEDi4nNs4W8cD1cl/IXlyjza6cpRvWmXySfHGbTrOvyY19CK0RA6XDq3nvcS9BkibBC4NcFz4UgMLtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 04:05:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 04:05:41 +0000
Date: Wed, 14 Jan 2026 20:05:38 -0800
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
Message-ID: <aWhnkg2em6pVXgcZ@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
 <aWhZ+eVZQ5oHMK0u@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWhZ+eVZQ5oHMK0u@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 59682660-739a-4ade-3c2c-08de53eb595a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkZoV203SVNMSk5SbjN1WS94anhWM0FuYXFNM3A1R2g3ODNKb0YrRlVQN1VW?=
 =?utf-8?B?dGhpemJkamtrdkx6Q20yZzNPMTRPbjY5U3B0TDJLM3NPclBoRnB0djBUdlJm?=
 =?utf-8?B?QytMc0wvY1hTR0VOSDdva3ROeFNSZEdINWNqcGVBNHFHWTBKTlA4bW9VOHd4?=
 =?utf-8?B?T1dYck9BL2MrS2NGQzZKQ2IxUERxenZzL1ptTnlFTzB2d2pJSU11TFhTVzY5?=
 =?utf-8?B?REI5OVlZczF4RDdsWnFEN09xNXIwcTZwTHdIY0VPNzlXdmQ2M0dLV1BCdHNC?=
 =?utf-8?B?Y1pjekRFVWVtQThpZkZFSE5xbjF4NmdmKzdIeHlPSmYwbEZnbXFrcWFFWnM1?=
 =?utf-8?B?QVdmUllTM0N4TUduWTh5TnJ6bC9LYWVlVUdBMnRJcWF6cDFJcHZ3MlQ3RGpW?=
 =?utf-8?B?TVdHalZkRnppV3VyUkpSUEFXdnEwRE0vbHVSNXFNUXVJK0NpQ2FFUmhrcjFz?=
 =?utf-8?B?RXh4L0xpSExsaTgxL1pnalViTllZMWwydTdkZjFPMFpLdVVoREZYaXFoVDZk?=
 =?utf-8?B?dWFMUExCQ3VXNTlZYlJkbzBBM1NnR1kwUDFrNUsyaVpZV3NpMmtEMXJsQ21y?=
 =?utf-8?B?cFUvYmhvUFR0T1NhY1FEMmM0MFg0b1FGaERtT3RPcXkvZlpmMXkra2Mzd3Zv?=
 =?utf-8?B?NHpjN1B3VkRXZWZPcGtZVmlNL05xdTkzSGtGT0pzcWkwYjFUaUpLTEZIWXU5?=
 =?utf-8?B?UWF6bmEwMkdiV0xxMWpqZmJrR0w3UGJuSEhEaU9RR2dHSk4yMnFyYnlUUElP?=
 =?utf-8?B?Mko5S21wTFhMcGE4TGR0cnRTYjN0dG1vZkpHNHRIZmNueE5USlpsME5aUmRE?=
 =?utf-8?B?UG9ycGg2MVpGOWEyK3pCdFFKaUhnTlJDR1pBcXR4VDN3bzltTkxzZ2pEd1Fp?=
 =?utf-8?B?MUZhdUFWZ2grKzBxZHh2Zk9NQXRtWjFWTFlyM2NpUGdWZDVCdHpZRlQrVG4x?=
 =?utf-8?B?SEVNNk9kbjRKYys3K1YxK212aUxQM3FtcEIzRUVPdHh6L0poWDZDdzFib1pI?=
 =?utf-8?B?WUptSmI5UGJIV2tZTEVhRmpyQlBiekthRHVzRm1MWTdQNC9LR3d3MWptWUo2?=
 =?utf-8?B?Z1diTmtiV1NMaG9WSTZtSFRpaldOQ21ZaEg3UUIxRnRGUkQ2Z00vR1VxWjFk?=
 =?utf-8?B?dnlEMk43TSthWnJyajk5SzZKZ21hRGw0YTRKZUhQQmdaTWsxTi9zdDJKTXdr?=
 =?utf-8?B?QldZbGxwQ2p3c3pmTkhDa1UxU1A2czBBdkpURGdjcmkybzltZklqeU5qK2hp?=
 =?utf-8?B?QUFyYzcrcnU1QUtBNVovNDBnSWJPQ052c1JCQzVZVWQrSnAyZmF0Tm5UN2lJ?=
 =?utf-8?B?VjNxREg1anl6Wk9EY0lTbkRSSDJmemxVZ3BtL2pzNnJBekFQRlkxSlh2djEx?=
 =?utf-8?B?OTVTM3ZpVVFzV3lDdmhGVU9hcFZIRXc2RFZuMnE3UEVVL1ZpalRPa2NvbnVU?=
 =?utf-8?B?Y2tlUGx1alloNnc0djliejFqZEVpOHJTelcvQldaeUJNQXpDTUdZMGFtZHY2?=
 =?utf-8?B?YURGdU1xSmtYZkRTblJNdlRrQlIvNDkzdHRaZVlmenhyeWMwMHRjVnJsbk0v?=
 =?utf-8?B?cWJZUXNpY2tWTk96dko1K1lVRFYvaXRnWFc3b3JzZm8reW4rNy9vWTJBRFdJ?=
 =?utf-8?B?MThMSnBPMG13b0VhYnd6RjF4VExPZDVoZlV0Rzc3cGRoM21tU0ZWT3FDUWR3?=
 =?utf-8?B?SzBYZ0xFbEdtaC9KVVRGdmxOR0RJSWN0SjZxZDBzV2NCNExEV0tYWWkzVm8z?=
 =?utf-8?B?NGhkajNObklyYzZPbnZ3ZHlyOExET0cvTmtQM3BNWDg5V0NRbDYvbFYrSVpD?=
 =?utf-8?B?WEhuSmdUK3hNOUNWa1RrMDdhNFE2ZlYyM01rNlYyMENJa3kzQ2VUbDhzYU84?=
 =?utf-8?B?RkxVTkExYkQwUUl2bGNraFFaY2tKOXZ6WUxUYUxYbXFxcUhxVVRkTlFNOHRJ?=
 =?utf-8?B?cHlQVUxUekZhb3JLeENRREYwakNOKzhhMUJFRnN4dCt6RVFhdDg1ellHbTBt?=
 =?utf-8?B?OTgzZEJQQmZ2azZPKzlycWlwMG5yZnRqRjFkVDZzbEpUbC9vcHFJbHpxUjdx?=
 =?utf-8?B?eWhwV1NyOVZETEhneTIvYjliTURpRnRRR1hrYWo2ZkMxU0hZS0FoeHFFeFAx?=
 =?utf-8?Q?95EE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtVN2UrU1VXRzFzekNjTjR2QVBQV0d0NTdQVi9RcEJia1N4Z0JzUWt4YmUz?=
 =?utf-8?B?Q1FNSzRNL1VuSHV0cmh0dUpXcnk3bFlqak1ZM2YyVHY4MFRZRXgzeDN3NnRM?=
 =?utf-8?B?NmRqZmhvUVRQU3RFQjdjZ0ZBaWxxOVV1RXhvaWJFSU8xQmtrVWtHRE5ySllZ?=
 =?utf-8?B?d3FicUVEeExZMm5kRS92WThUTlVCRENrL1ZWQnJwMUR2SlJ3TlRHSkRRTm0z?=
 =?utf-8?B?bnduT0lMYjRUdDZDTG1zSjV0dUVqZjJWN215cEt6SlFlalFQbXE2Umhud1N6?=
 =?utf-8?B?QmRLd3BBSGdSS25scFp5ZWhKejl4d1NBdHR2a0N1TXIxMWh2dXA2SEczME91?=
 =?utf-8?B?OUE1MlIwb1lLZnhFZU1zQU5kRHhTQ0VDY2FQeWl1V3kwU0xlQUQvakxSa00w?=
 =?utf-8?B?RWhLc2U1YVBIQ0QyRGpOWk1yZTNkRjE5ei9JQjRINlk4WENoWnFtQWV5ZWtF?=
 =?utf-8?B?dVZuME95ZWt2YndVNzYremUwWXlvVldKYWN2amRNaEJBSkM4YzA3TmN0WEkv?=
 =?utf-8?B?SUtxVHpDb2gxZVBzQUlUOG9ZK01aV2ZKQTdWbHhmVnIrSU11a1k4YzRhWHVx?=
 =?utf-8?B?SEE2V3QvUmN6K0NJSlVLS254MVBRZUQ3V3NldWR2MG9zbG5HMWFybUxnU0Ir?=
 =?utf-8?B?M1hsUlRBdWtWd2ZlTmFSUVFvcER5QjlYekl0c3pCSmVON1l3NTFsVFlzelJt?=
 =?utf-8?B?eXdqVkMyM2NMeVByNDFwaWw4MkhIMUJLOW1qZHZNVFhQbkZKVmVQbUFMMFp4?=
 =?utf-8?B?SjllSEl5NGhUNEEyMURRN0wvQUUydWh0Ky94bXdrLzJsQkNrNHNaWER2K2lJ?=
 =?utf-8?B?N2VtNVJmR1JWdmlxYkQ2K0pNbk5mRWJWaVdRbHNONXpCVlRWaHhPVXJ0bTRj?=
 =?utf-8?B?ZTM4b2xGLzJMdGh5NnRCSitXQU04TXhHbUJMa28xdlA3UFREVkl2RlprZmxH?=
 =?utf-8?B?ZWkzMUtnci9Lb0luSGErcjNVZHphWTE3VDBhcUR0K2dLZDJsLzBDc1N2bGJ2?=
 =?utf-8?B?VnRBVGpUYlNXZ0VwaHBML3pxK3VRaGdDRGpQc043aGV0Sk9QQ3JmbitHVkVh?=
 =?utf-8?B?VWJZWEt6VWFRcmJ2eVVwc1d1eWxDRFduRTNqOTByYUljQmRjd0t5T2NwUk83?=
 =?utf-8?B?Q0JLMVdpcEtZTnVCcVE0WVFLSy9MUWlRd1N0K0pXN0ZuSXE0OVNRNjZCWUdU?=
 =?utf-8?B?N0NTQmliTnB5dTJLZTRtODZVRnRQSnEwaEQxOXU3YjBHUWc1amMvbkgwSXBP?=
 =?utf-8?B?OWJhZlBHK2hFaWJ6ZFkvd2JlMm5WRGJVcTFQam9RTGZuVUFyZko4c3pXSVJw?=
 =?utf-8?B?MDM2YVg0UTJ2NU9KYVM1dEhKU3YvYTFEN1F3MGliUDZkUVZ0c21PeEczb1ZH?=
 =?utf-8?B?akNXb1YraHRrWnZpNVphZk9OdHVRVklRTDNGdWJvZVVQUFNXcS9jbzdRSDU4?=
 =?utf-8?B?czM2cDA3U3c2cG5tVDdlSlpzSjZFQ1JqQW1uaE9qdVFHOEwzZ1BvN2NGZThn?=
 =?utf-8?B?VjZIOHBIemY1SWZqUCttUjZhaGZjZlBhNWlIUjRJNUhQQ09PTFRsZzRsdXVa?=
 =?utf-8?B?cWZua1ZxU0ExM3hra2Q4SnhvMGtJcUV0ZGJLRmp5QTNkaktJUmsvVVMwbGFM?=
 =?utf-8?B?NWlxQVlsWUtuSzRLUFBnZjN5TmRTUSt6VmZ5c2N0UmxMWUg5U05PZUx6UHZS?=
 =?utf-8?B?WXMxV1AwUFliUDJuNldZcmdKaDF1UENoQngrYW80VStuaGZWWG1CaGhXaWk1?=
 =?utf-8?B?TkQ2WnU2U3lRR0szZEJDWGNEM05HR2pYZllDUHR1eHFzdmZDRjlLRTJqVExN?=
 =?utf-8?B?L3ZPRjdXMWJZZ1JydFBCSHZKdlhYdFYveVJrOXZsbjUvZ3F2YUQwU2hHMk9Q?=
 =?utf-8?B?UzJxVmdYRUY2YWU1anVEdGNDQVZ3SHF0WFliVURwdGwyaHl0YmV4R3dEMFll?=
 =?utf-8?B?bzdsamYvL0hTd0xsNDh0N3RHTlovcUd4cW9GbjVkWGZFY0N1cVNubEFVQ0Z2?=
 =?utf-8?B?QVRTY1VYWFdGOGI4TnZyeTNEK3dyV0drOWpadUdOV01HdHJlM1pRd0xJS1dj?=
 =?utf-8?B?cklKTVJnaGFjTzZjNStZUGdCQU8rRWRMTGlqYjhXSTJFeG9Sa2dKL3F6VFcx?=
 =?utf-8?B?Sml5Z1NqMFJqQm5uQ2RKZEhiRkZhVHIvK0NTWEZzMmdxczhOcFNkUVF3Nmk1?=
 =?utf-8?B?WWk0S3M3QXpyUXN2R015c0VvSVY3Y2NBU0NwU3lMbWc3OGtHd3RVVkd0Zzda?=
 =?utf-8?B?Wjd2bVF5NE9oMHBvSHFxRFZTNmMxbVl6Y3NCMktqUWQ3OHplcUJxVjdqM0g4?=
 =?utf-8?B?aVVuSG9sb05TS0FCd00vVHlTVkhGdzB5ckl0ZHFPK210TlRjbGcxck5QVWJN?=
 =?utf-8?Q?EvCkf06yxBzIKUyI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59682660-739a-4ade-3c2c-08de53eb595a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 04:05:41.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lme+dIHR8Xdv8KYk8lZAWnZjqho9LeZpq8JRh3o53q3YE1iffoRYQaiUbglpZlpXDtx72FIgF4o6ouEKyPqhuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 07:07:37PM -0800, Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 07:01:54PM -0800, Andrew Morton wrote:
> > On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> > 
> > > From: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Reinitialize metadata for large zone device private folios in
> > > zone_device_page_init prior to creating a higher-order zone device
> > > private folio. This step is necessary when the folio’s order changes
> > > dynamically between zone_device_page_init calls to avoid building a
> > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > must be passed in from the caller because the pgmap stored in the folio
> > > page may have been overwritten with a compound head.
> > > 
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > >  					struct drm_pagemap_zdd *zdd)
> > >  {
> > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > -	zone_device_page_init(page, 0);
> > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > >  }
> > 
> > drivers/gpu/drm/drm_pagemap.c:200:40: error: 'struct drm_pagemap_zdd' has no member named 'dpagemap'
> > 
> > I guess this was accidentally fixed in a later patch?
> > 
> 
> Ah, no. This is because we merged some in drm-tip which is not 6.19,
> this is based on the drm-tip branch.
> 
> > Please let's decide whether to fast-track the [1/N] fix into mainline
> > and if so, prepare something which compiles!
> 
> Maybe we just take this through the MM repo then? I suppose I should
> send out patch which applies to the MM repo? I just cloned that repo.
> 

Sorry, typing to fast. I believe have a patch structure that applies to
6.19, MM branches, and drm-tip. Just need to run CI on 3 branches :).

Matt

> Matt

