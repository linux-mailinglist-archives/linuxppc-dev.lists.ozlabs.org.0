Return-Path: <linuxppc-dev+bounces-15759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE5D223F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 04:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds7GV52c5z2xrC;
	Thu, 15 Jan 2026 14:08:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768446498;
	cv=fail; b=IR6qBTMGAMJhGCGFAIuP51MjKNO/uQ3xtYtTl37GZIuHGVYokombomx+71TsEbOhr0I3fI+mrDG4iRFGzbBBHlZ+MGUf4AydujHGtfdCB7sdqGJdLLWQdnzPdO9DEZQYW2vpKRXKTzEomAcdEDnvROe5h1AE0uOjFtXzrqn4oWaiizbpe4IGAU7zxdg2omQCN3NPonoiWluaXwcTZvMBGhV4e9u4z34Q8ewKl7v61SmpnUFhuwU8XBH3X9qQZkone23kPtIh6coE8gwCVUaR/EQ82eX2nLoPZmi0gb6qsrE+XT3le+u1QUoUyiyq7osJXhI439Lc75IOsi60O1rpkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768446498; c=relaxed/relaxed;
	bh=E23lywpoOmVr6gXuG1SD8JTVMqItivsJAude19JYDw4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ggTEx19dmCA6rvtLZBdfjOPbkQvE9/kwHI4Ul1MUqW62sxOQHTPDS2RPG7d7QCGbjiTVsjx7YA33DaoXv3N+pXM1j6rgHY/sGCFXz9U85bbaz0ikBl2mgnhspdUsautE6JCu6GYb2zm01WgpB9HpPpQ80zVJGD0sKTZeXIRamlgQawVwjTn7mGV1ddErZXXwpi45mzij2EEAlIlZMHah5MfQJ/VbcWBP9G60sN2qrI2ObRsgDLismEA0xQMbVFn/OPutrV11OsY0BrTOFNX8wqmLyPIdtrPURyqRgrITf/ekOioD609iR36wuxGwFeBjR9iUOMr3yZw/TQXCikJNcw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVefGVR1; dkim-atps=neutral; spf=temperror (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVefGVR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds7GQ5rtjz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 14:07:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768446495; x=1799982495;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4jgoPE4wzBEkUzKafNaWuMuuajX+TC7OaeFY+SJuv8Y=;
  b=dVefGVR1v2kRnbVJ90xHtOQwEugjm6KzVVpQxj+Ww/XsZT8J+6Q7nujz
   /etnd+an+dmiLdChJmahP5pcGigDXlZq7UdZjS5D7gRMfDOSd40e/VsOi
   VlazDBK01qwRgT40ktek4LGkxvlmCbFjcmjISnkl2+vEBC/AuGXZqUmvY
   uWE2oAcp24tS+LVIdO9qu2RAMS8dIMn+Hcq5h3ZEM1QcGpgkMIr6PztSB
   Uu8o4gUrnDMrFayClS7yCLh5PlvS7s/QSCIAaxNPI3xpKk3vBed2vuYFc
   KCHL2sMdQQdusjaad0Y5Z++rfVMrpqGMFDDMQw6NSs3iFtPJ0yZSIvkRY
   g==;
X-CSE-ConnectionGUID: j7ygw/XYQE6x/HAv0mje4w==
X-CSE-MsgGUID: aykpc0BLTL266at77cet6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73595605"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73595605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:07:51 -0800
X-CSE-ConnectionGUID: mmMXr+SMRhy/FMhXJszDjg==
X-CSE-MsgGUID: 5Yn+CapXSCybrq2EOcolbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204633044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:07:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 19:07:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 19:07:50 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 19:07:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyMBcHfCcQ8rwOcI6kD7D2kOOQO2SGOCmDGJJXrf9STPbrVSeEzL1Kqdl/FCvDiGp3Dikudu7JfGpphBm4kko0wl1mCSxLP+Np7HsSAN5yqwQ/YflkZXyr8tou/Xi4LUUQrEeBIFFcmQc66ek5QadrvhwZs8frkm5T0AJkRBQ+hitYxSKdMJGf85lkpAd65teAmcmzEp+fXCch+UMUV9wIQghGxB7AtVKtu+LYWhMgIPvdkh2XkTDhY5Gpcz/F6QbAhEmYDOr8RdV8tBi+MWo3SD31BI21X6G1U8ix6oAEOSgAO1udSTBp/MUXvpgqwmWm+p3MAhGR+2dqvoQmtgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E23lywpoOmVr6gXuG1SD8JTVMqItivsJAude19JYDw4=;
 b=iYynMPzzEiZfeURJCw5TxYab2CKLUV8u1rmtAt+OIwOsKgYdnwGHXGlyRVxbq9GOBvYLzpZR5LBL1TNg9UzpOgf6RqtspBQaqhZBXTbsInpJ2K50urGok59Vkk/Qc6FiKVpF6W9Nj6DXfRtSgQyIEHmo+SFjGqa8dOtSDa6xQB18tKxjmQ1JEakY2CpjWBXdHFCPLfbc/yYDk/4ZqEo6JS0erbged77LNmFoYNAwbEQGY2fDE4mhJuSwYwAfNy2RHtKdmrKkcUSLjCxU+VhvEuZTZmQl7dNW76D305x9G0fYTjlVbCgm0EevS5fFFsTdaWBWTXrv0vtQZNje0RO1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFE5BD61D44.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:07:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 03:07:41 +0000
Date: Wed, 14 Jan 2026 19:07:37 -0800
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
Message-ID: <aWhZ+eVZQ5oHMK0u@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFE5BD61D44:EE_
X-MS-Office365-Filtering-Correlation-Id: 16acbd5c-edbf-4142-a4ee-08de53e33f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm5IVEMzT3ZXUWdjTzN3VVU5em5SbE15YTI4dnNlSkkzVGdXMTlKOWNjWm9l?=
 =?utf-8?B?YVdWYnN6eFlMU2lGUk9yOWNmT2NKWVZZUkRFK1J1bkVHT1ErTFBOd0xCL1NH?=
 =?utf-8?B?OEt0M3BmVzZycHdjK2pmSTFRd2FaYm1KMmV1Mml4Mkljd0Y0a0Vpd1M5a2xn?=
 =?utf-8?B?Y0o4ejZUWEZXZE05V0lFcmJ1c2tNekhxVURDSGkwT3NydW5vU0dhR2czd3JH?=
 =?utf-8?B?YUNtQTVNUlo1Ym8vT1RMaDZjT01NcnVxRWR4OU1URFRLRXArdHRHMTJyYmVs?=
 =?utf-8?B?MElCRUMxYWZwOUFtMExmUFdJWG9KRXliWlQvRHBoUTd6Z296WDhDc1RKWEZ0?=
 =?utf-8?B?TmpiUVpkSjV5OTFiNjF6L2NVSXlncjIrNnZpWDNzem5QUkg0enNMZkNMcFFk?=
 =?utf-8?B?M3k1SG9sWXVUMXM2R2NQK0VaMk1hRFcvK1gxQlUzeVNZZ0JseGtqUGdEckJj?=
 =?utf-8?B?U1lSeTU1c244bzJIMGZBaC9zRm1taDdnYngzcE1haGRXZC9UelF1elFmMzV4?=
 =?utf-8?B?THpWYmkrTm84L3pjYTRWQ3p3U0tZTldHemNTV2NYM1BnQjNaSzRxOHhhMWRj?=
 =?utf-8?B?VDRLRm9CRGV4emdQWldmNXVnZ1h0cXpSZzJXUXc4ODdHVEJydTZMQVRPQ1dz?=
 =?utf-8?B?bXU3RFB3Ym9NNXViQlpDMWRENGdLY1pPZW1yUEt4UEhsbHltcTdmaUZFMktx?=
 =?utf-8?B?bzdRTzZydTFLMEkxdWRVMWI5Z0ZWdDUyb2dWYVh1dTVMbFpWWnFXVG1ybm5m?=
 =?utf-8?B?cHRsT3l0RjU5ZlNHdmxCUVhOanZLeE80TDFsMGIvUWdOanY3dHplVFBlNDl3?=
 =?utf-8?B?ZWxublIzSFBtNm9IYWxqTDliUXRuKzNveldiRXM1ek82SEhQYW41U1F1ZGNP?=
 =?utf-8?B?TWFSWDlNVmhOd0ZRbWkwQ3BTUXpKQThVV0F3cXRJK2V0NFV2d094b1I4WER6?=
 =?utf-8?B?eFEyTS9mekJ4U0FEczlTUzZPZWhya29yZlVjTHE2aGtydFJlVS9nYnE2Sm5O?=
 =?utf-8?B?UGtOMDBHcno1YlRDQTJJNUJrcXJEYXJOdklvTEdxUUJ3YjdnSSt3Z2lkY2Rw?=
 =?utf-8?B?bzZ3MHBGRkt6Z09XYVdwWlhCdFNGTWh6eHFSTHJpYUUyclU3aEpEOHdNZ0M3?=
 =?utf-8?B?RDRDUE9rTG9YMGlET3h2RzlpbUFzNkVMODRuOHZsOGJaVTQxalpYNzBnSjFo?=
 =?utf-8?B?VmxlZ0c4dTU1N1dJcVBVbEs4S3NKUHQzUVNXVTBUM0phZVd1RUFobWFSTm1r?=
 =?utf-8?B?b3J3Z2JQUFRxbGp4ZFpKeWcwTWxpcENPTnNabnlCOHpEZXpreVB6alYvNVVU?=
 =?utf-8?B?QnJvdy8vUkRaZ3BDMXF0RXZoSWIrVkI0MXd4ZSthNXRtZUZFNFQyR0t3dUFw?=
 =?utf-8?B?UmNRdTA0amhVRys4MEVwQW8ySGx4d0VKdWpZaFNnM1g5UThDKzZXNW9RY0JY?=
 =?utf-8?B?bFJPT3I1UUZ3K1NlK1pjUXdjZ0ZNWk1OVmJxSVJpK0ZobVArRW9GUGZQcit4?=
 =?utf-8?B?TGNoV28vRmo4dUFVSHVRalFXaWhPc2x4STBvR1VCTUhwUzNkckRUWUJYSjZF?=
 =?utf-8?B?dmZUNVltVWJRUXR1OVZLbXdvaEJCUUFJQVFOVXlwbFhaN3dIcFRJQngxeCtR?=
 =?utf-8?B?bG1SMFJ6bXdvMWdhdG55bTFQTGNBRmNUOTY1ZmVselBrek82QkJzemtVQkNa?=
 =?utf-8?B?VFhmZFNmVzA0V3FSOHNtQll3bUpaVHpCd2xab0I5RGltQXhva1A4dzRzcjZO?=
 =?utf-8?B?NnBSYlFXVEFzTHJIb0Vrd3hnc05ITU9xMm9TSmdUdkp5R25xRmtpMml1cXB3?=
 =?utf-8?B?S1d5Q1c1MDZmdks4cmxMbzBZUE41M0haK0xPTTJROG1TRGRGeHVENktwKzNO?=
 =?utf-8?B?N3BTbEpCb2FMWHhjdEZXTUZ0TXZyR0tGVmhPMHo4SjBNV0JYa3lIVVBDRDB2?=
 =?utf-8?B?cXBZN2MwcEJPUkFiTHJBRTV0SkhYTFZWT0NtakppVEJDZ05NSm9SZm5Ma2Zx?=
 =?utf-8?B?eVNzTy94UFNlZUJzOHBuM0toWDlmWGlablBlajVya3cxTFhlMGFJK2VOWU9R?=
 =?utf-8?B?N3VaVFM4TFFHbFNPTHFHZnhra1BzeGU0YW9jRVJHVlJubUdMbGhGc1pPY092?=
 =?utf-8?Q?4txc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VElyN1NWYWNwcmE2MVZuaEJ5a2toYUFpVzUyRkpYczFENUczQ3hVOEY2TXlk?=
 =?utf-8?B?SmJaRWRNb0J2SzRBOTV4NUFudHFDVldMcmRUeUljWnFYK0Q2UTVtSU0yUkJq?=
 =?utf-8?B?UHA5UlhtWDVDSXlYWDdxTlgwV1dzZG41ZEFkS2NFS3BMNWtldUczdm5zNFFP?=
 =?utf-8?B?bWVMTkhvWWQxVXNhSHZGV2V5SkVLMWQyUmJyaU5lUG8veGNwQnlGTnlTSERK?=
 =?utf-8?B?ZlRzRCsvZ284UXZZaGxhOXBpN3pvYng1T3FPMW94SnBlQklCdEowUk9tNUdv?=
 =?utf-8?B?WnJrajZlc3FKcEpTSGNFSnZTUGVvSExqVHRSZ3l6cDd2bWU2dWVhdjVUSjAv?=
 =?utf-8?B?aDRuS3RGRFFtcC90V0prU0ZlTFFlMC9KVlpuUHFUR2t2N1QrOG9ETjk4MkhF?=
 =?utf-8?B?ZGNBaVoyUnJPVDF5VW42bE4wUVJMODBvOEhmUEV1aDlFMDJsYndDTjdxZ091?=
 =?utf-8?B?anFIdTgvWm5WSWVSNU53bVl1cVA1a09sdG0wU0hYRGhJU3lqc0J5UDYzQ0xo?=
 =?utf-8?B?V25SMCs0NWd3NThyck5naHpQN0NHUDA3cmthU1JBWFZYYlJpdXBabmZDTURG?=
 =?utf-8?B?a3I2YzZBT1J4R1QzK3N6alVQY2NaRmZ2Vld2a3V3Q2dNZDJTWllUTlk4RkxS?=
 =?utf-8?B?dmkwNU9KTlhHQjRva3U0aVpsYUJYM2JNSVJTRjZlSE94eHZHbWZWeUlERS9l?=
 =?utf-8?B?RG1LUTdNOWNadmJVanZ1LzVkY0J3clF0SVZiZndzL3IrUmYzOGNkUDdpTzdQ?=
 =?utf-8?B?NXZnTE1Oc2tWM1c3TW9IOGVjeDJaeUNEcDROcE11bk1tLzd4TG1IS1huVHZr?=
 =?utf-8?B?T3ZFZ3JtSEdJM3Q1MFNHNThGcU9uSUZ3K1Rsck9OT25pSWNwaWhwekpuZXQv?=
 =?utf-8?B?RS9RcnRyVUU0akYvai92bEhpNUhiaW5Td3VyVStUbHoyNlIvN0FPQkNZRVdJ?=
 =?utf-8?B?QTM0ZmdPblhoYVFBVEN6NFEvb29ubE5qOVhXTjZZM3JFRWVZaVBiZ1RoYVNy?=
 =?utf-8?B?MVF3QjN2SHpBb04zNVF1VGlmUzQrV0tqcHUvSk1HMUtWV1Y2TUtDeGVQT0hS?=
 =?utf-8?B?dS8wREd6elFGcEVXcEgrRHdBeVYzYm82Y0dhNXdFaXpneWZMU1o2aU5KcnFw?=
 =?utf-8?B?MDZBUWJ0aUp0S0Q2UXAzbENwK2hLcjYrWG5zcG9OWFY5SG1MaDRQRWVaOS9n?=
 =?utf-8?B?ZWh1cE90dUJuTDdUMkE2ZWZYcS9hek0zaEJ1TXpiRzNzRStCVE9wZnRXTzNv?=
 =?utf-8?B?MXB1K2U0T1dlSzIwZzQ0WmxXbXN4RlRWc09rWVEzWGlNeG1RUCt5dlRrR3Bz?=
 =?utf-8?B?YXBNVE1tcEZlbFJud2xhbmhoYXBlQW5BTUdRM3JUc3N2M2M2bTBjaWsvRXhW?=
 =?utf-8?B?QTU4dStOdlI4bnhZa0dlOXFQcTNZNUVJWWlibWY5RTZKVjFDcnZwbGtaeDRG?=
 =?utf-8?B?aksrc0huWXV0UG5rT0FxdEdoN08rWkd3dWtwUE1WNFluMU56anBqSVJJL0RE?=
 =?utf-8?B?SFJIOWhVakwzSFIzQ1RsNURoTXc0bHhYVER1VEE2bHZFOXpadnpDaCtmRXE2?=
 =?utf-8?B?aktMMjNXRGs3NEFleHJXNnVWWlZBbnpZVENweVFVckJ3Q2RTdFhDREZCbWVs?=
 =?utf-8?B?U1ZZSXZVeVA0SFVCazM1cmgvYkxTbEpZZndISWVqQmhqUExtZ2lWY2JkL3ZT?=
 =?utf-8?B?dmxJTEVIM241OXBlai9ydHN5Yk1ZbkhWTTZlSHdSNlFBeWIrcXNSS2pZQUdP?=
 =?utf-8?B?b09JSjAxa2NOYWwyVlNNUHc1cERlclVaWDZRcUhOZi9lSktzaVFZWWpGM21y?=
 =?utf-8?B?Skh5UHl6Vm1kT2lXRmZMSmR3RWFqWG5XVkp2TDZBNHZyRit5UDArZnVTbDhv?=
 =?utf-8?B?clJlTzc3N1QwY2RyQ3IxM1hDQ0Y4NUpqNldOOG9YeGwxSUtOK0ZLMWJBS1pk?=
 =?utf-8?B?ZlhvSTMxVEY5cXBsb0I4SUhCcUljNnNxZ3oxejg2Z1JXbjBVRE5iNXhGMDBR?=
 =?utf-8?B?WVZyZzFYZkg0Y1pPa2FBTTMvRVV6azg3V3RRVk53U25LaktuOWJpS09Ydkha?=
 =?utf-8?B?L3J1VmJOMmxQTUZ0QTRjZHJ5NmdTL2ZuekxlM1pvY1B0eFRzOGZjckoyK2JP?=
 =?utf-8?B?Zy93Y011d2k1c1NPNHhZNTVRZE1mYkU2NGg4cCtVWTBmU2FuMGlOdW9mRW04?=
 =?utf-8?B?QUFBcjFYZ3FPNi9veTdxcEkxMmFHWFN0SkZvWDg4V2tiUXZoNVVGY1pCMXBt?=
 =?utf-8?B?TitZeW1mRnBveStTelZJRG1QcEtKOGh5dmxscWQrVkJTNkhqMWVSRG5DSHhl?=
 =?utf-8?B?N28vWmVvREpOdzM1ZUVBV2tvNE8vVjd5dXk1SExyUXg1eG9SR2VCV1UxNG84?=
 =?utf-8?Q?3hu/wpDGG3DauTPY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16acbd5c-edbf-4142-a4ee-08de53e33f10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:07:41.5523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNEaIYVvLSrxr2X0idMoPPkIumXNj6OhZY+RARnhXGd0ooS4iRq6nfAfZoq7OtrEN8VWXK7J83OXsSkmtGSIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE5BD61D44
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 07:01:54PM -0800, Andrew Morton wrote:
> On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> 
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reinitialize metadata for large zone device private folios in
> > zone_device_page_init prior to creating a higher-order zone device
> > private folio. This step is necessary when the folio’s order changes
> > dynamically between zone_device_page_init calls to avoid building a
> > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > must be passed in from the caller because the pgmap stored in the folio
> > page may have been overwritten with a compound head.
> > 
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >  					struct drm_pagemap_zdd *zdd)
> >  {
> >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > -	zone_device_page_init(page, 0);
> > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> >  }
> 
> drivers/gpu/drm/drm_pagemap.c:200:40: error: 'struct drm_pagemap_zdd' has no member named 'dpagemap'
> 
> I guess this was accidentally fixed in a later patch?
> 

Ah, no. This is because we merged some in drm-tip which is not 6.19,
this is based on the drm-tip branch.

> Please let's decide whether to fast-track the [1/N] fix into mainline
> and if so, prepare something which compiles!

Maybe we just take this through the MM repo then? I suppose I should
send out patch which applies to the MM repo? I just cloned that repo.

Matt

