Return-Path: <linuxppc-dev+bounces-15752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FED21CB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 00:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds2vZ1VFsz2xS3;
	Thu, 15 Jan 2026 10:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768434698;
	cv=fail; b=gJBE4pdYsNRQ/KWKU7DaIRwS65q0E2srCyPCq8ldQ38lvsUCVC/aa/glAJmFS+gNUeJ8zTnXJtVG5r52kDV6Dpgd/K8YaVI+QylXvLdOaM5h1uq8s5CRCciHg6nm5m7op3EkCz0/bXUcRX84E6R9kGKaFqfiSe1F65mb6ySxrILXfkUWCsmUjQFyn1ZDtYwYAgyRhBrjkHpf/ANdXJ4ceVScBGommBRNGVtNjydv4HCHgHDF6o/el5CYbvM/rOgueoEIOtgXx2yjpVa/mhBPpP6lk5jwyOUmtCF2COtfjBHAv18mjWOYOyz80NeByTUd3Md7/iMDpw0+6RTY5sp/Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768434698; c=relaxed/relaxed;
	bh=G7n0GD4vskBV4uZ5XKLmIpS8Wy9noTZ87ZQvr4tng9Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j4qPbbcfzj5YVGYHq4Srdw7LSX01IrGz36mcMsJwWtc5SzinAt74fLHi6X8A2evC8ePL4OmWwjglJ7TT+v4hYXJs/KoC28chAYHm7XHTfCwB1OzlMGOaglwB70ajffkLFc9q2YJjyrTallq6v/vIdlJ7CV4lI8x/3qJNRWq6SUssirudlWLkgjqWwemzh1yjMYoZRRzrinbJ2XC1QRiTK8OX6IUDOEfZyZAahbQxGN6axCJU3xWnd6sAFuQxyuy1wPRDH2v/XDmh3GUvaFKiEdKGHpJrknNNgx3CPaO5cedisNI/DGKfExWlXHp7VbNxFoOJO8tfbo/mXd6eS29OBw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IX0NzrAD; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IX0NzrAD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds2vW36gGz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 10:51:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768434695; x=1799970695;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RSHtL2IVsWfSWQz/HURV6vT7mdg6jKwj7p+aZQCh38g=;
  b=IX0NzrAD7wUKXy1xnPn6a2AA+yGOJm8tZ4ZLcUud2goSMsqDGw8NHxrN
   3bow6qvTzHMVcJPFK5zyXw+mnvdi6g+hdLIX5sU88Ra08GmDLdxKKCOyD
   aQjIm+6mEgcqoVtyQZJC/y+KdaqCGuHfEzV4TIG0zeU5Lb1p6SdFME+9I
   CgaNbvTDVk5ysKFpEoXZAilzyRpFtT1ZpxFEczc20QhyGK0hHngjzhWWK
   lnncm1vmZOk63TlK6R9RQ6JLCuOLUhg4ch5VRq2VNfaA1cZajq2nvG/8w
   26KWAhgND5gMN5gvaNQaRa5E1Q06GtPIRpPBZPBrTsJe2K1reI64o03rZ
   A==;
X-CSE-ConnectionGUID: 31vxms0dRg2kSsRYN9HDEA==
X-CSE-MsgGUID: ERP4u2QxQ9CNZGZVTeDvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68950620"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="68950620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:51:29 -0800
X-CSE-ConnectionGUID: T5JgkYtuQjmoqBByqnj6+g==
X-CSE-MsgGUID: t9JFJ52qTjuFuGl8wCa5iQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:51:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:51:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:51:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:51:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa1U7u1NYksEim8Cus9r+dGM7rl2YE6ZOtdXpjamA6Wkh/5LfChYImVYSOFY3UVVPltZiB57glKAOqY9NPwf/+ad3XrAwQ0YgbF3wtH7YqPRmSsTOdBKVoBQK8plFleTdUBbgQrwlxuP72zCt8+11+qH9zJSveVaFR1Fi2tyTrxk6NJ/YhX0kbcoSUMeTtaFH4bi/z9HzisnIk46h0BFzZ4WPeBa5FrKWJRLwBf453v9NB5IcpYnyB205KX6jU6bfIQ8RklcujDdE/1+bKOE1VOTv3KDJkJwlAP4ydbL54EBox+oDWBLhIDOFe5aFRohbKrGJ9RCEwoX+2z5v+DJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7n0GD4vskBV4uZ5XKLmIpS8Wy9noTZ87ZQvr4tng9Y=;
 b=cH99+FZMMUO3zu3Z6TIV1I7Cx1WSWoDOEH1cNC2ddTqJLxAZ0WTrceLSc8ldm50jMpkqacOpttxFueT+dCXKt80x4zSmjDXKMWwsCogJUIE5T8/dnEeLXAq3k2fu/vZ3WuD6a9nZtWzHb2hyZb3wTdpmkKgUD3azGH1aa+GK/aYSaAdDzI213ERPPA7fuf2mJ/nuau0e9dpeuw0sYzCiEab9Xu/xEco4sky4cWjosx2fgZYpOVY3SV7ePKvmZF3B8aZHDv3tOI9S1B3py1hzsCQJWXQ6FohVSJ1YU3Wei/jY8Wx/lhyi/MvlnLtnoBPrLprdSrXHHvQQZXB5zlMuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 23:51:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 23:51:19 +0000
Date: Wed, 14 Jan 2026 15:51:16 -0800
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
Message-ID: <aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
 <aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b5003e-13df-436e-8938-08de53c7d069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmlEWVc2M25wbGhwZFU4U3kzYW9Bc3gwZGhhRVdWSEhVVWcwN3c2R0Z6MlFi?=
 =?utf-8?B?NTh2dkFnT0s3b0JXWm43S3FsVFZQYS8zN1k2TC9Ndng0a0t1OTUrUnVmUGJQ?=
 =?utf-8?B?b1hBeGtVcUF1S2hXeEpRVkJHYk1ZdWtMWTkxWWZiM1J2NytudWFSQW5CY1E0?=
 =?utf-8?B?bFQ1UmVheHVoUXJTcFhvYWk1UnJqdTEyZzdrSGRhc2Y0QzZpcXVESHlvbVgz?=
 =?utf-8?B?Y0NETnNxdFk0Vzg4NXBFMEcreHBpV3NodXhMSXg3SEpLS3EzY01Edi9OZFE0?=
 =?utf-8?B?eVNiTTRnR3hTZUhzTk01YVF6QWtOdmQxNUVBazNtT2h6SzVScEJDVmJYOEZw?=
 =?utf-8?B?c2pvTmg2Uk1mT1ppS1dWS2RlZUJPVSszdENPeE5ZSThuWFRXYmNOODdBN1V1?=
 =?utf-8?B?dmt2aldTTDdSdXdvcTI1YVVlZDZSZGhUSHlhYXkyU2U1dkszM1RsenA0K2Zx?=
 =?utf-8?B?ZlBuODN3QVlxeDFDNC9oRk5pNmNiMnZ2Ykh6RGhsQVM0VnRrOXI4eFllb2Rj?=
 =?utf-8?B?OVlHL21kMEVjR3FtaW5Lc0xFNUE2cnFvVkY0bkFxcGhLUHhXOUl5MisySmdk?=
 =?utf-8?B?TEpQVVdjVGlPMHZjdUd0NU84MUJJZzI0MUdjcHlsSVMxWWE2b0Z3a2xoWUhj?=
 =?utf-8?B?QVUvbEtCR1hsTXBoODZSeFRKVjd0MndHbmhKR3Ywdzg0dlJBRjlQOUl6YWtE?=
 =?utf-8?B?eUI0ZzJqajd6NDhHMWhFUkRmc3RTcGgxcTZMWFRZRURtODhqUjFuSnhTMWFT?=
 =?utf-8?B?UzQ1STluWFpXOGZBWFdWZGIwdzJ1QzY0Sms5NlIrMmxnWUtRRCt3SDlqRUhR?=
 =?utf-8?B?bis1MExWOFBKV0tNRWtvcjROcXhKT1JjWk5OWjQwR2NublRCRWFqWWhCbkhG?=
 =?utf-8?B?c1RHN1Q0ZXNTNUc4N1Yxd2hkN09rS1I0dkoyc0drTWdobnp6b1FJODZhUTND?=
 =?utf-8?B?NUtvZVJleUxWa2F4WUJJcVhVZmxVR2VBdDJVWE1nZFJpa3NrUWpUZ3g0Tmx2?=
 =?utf-8?B?RlRBNlpidnM5K2dROHgxS3hJalFSa3ZLWGtCUzhpbEoyMEFITk5XTG5YUWQr?=
 =?utf-8?B?bC9DVmIvbXFyZW9XNDJmWmQxZDdJZ1gxMnlobXFXTnR2eEZWK0ZRMFNlRkJI?=
 =?utf-8?B?MHFTa09BU0p2bHpkWkMvQkcxTWtwSkdlU1NaLzZteGlIT2JXdTZrM1dDaFNk?=
 =?utf-8?B?Z0dPL2VFUWREa2tMK2JtblMzWEVOZlNQeUpyYjZIRktNcjN3N0d5VGtwRzFB?=
 =?utf-8?B?eEp1R2tGbWVNSE1JY1phRzd0VkJkclVWSHZBNFNLOEhPRSt1UythWDZMVXl3?=
 =?utf-8?B?TVk0VU92a2ZzWWQxdUZwVm5sc0paTFZqK0p2OWY1Tk45dDZLZUdUTHI3cTVW?=
 =?utf-8?B?eEViRjllajdib0x1RzI4bHFCaU1BVXpwb3Uvd2QvOGUyYUZzalQzaDdGMzg4?=
 =?utf-8?B?ZC9EWEJIRzRsN21ZSmhGeTliSXFyYlJ6TVFWeEVzTnM0L2h2L1A1ZEhmbUJ1?=
 =?utf-8?B?ODNtbFFRWExIblMyUmhzQWE0TE12d2x6eVJsMjdCU2NKUjQvMlA4SkM3OURP?=
 =?utf-8?B?ejh1MWhmRmZZZGVMemM5SmlRZW05cjRBTitoZUo0YmoweTFLc1R5eVBBaTI0?=
 =?utf-8?B?bFZvb09uTXJsUnh0azl2NG81OUpQbUtnQ3Nrbi8yRkpIL3pRRW5nNmhWZEFW?=
 =?utf-8?B?cGpUZmthR2p5UVIycFgwbHpmZmU5clp5Q1FMNjgvZlJ4UmQ3VmplVW9Pd1pm?=
 =?utf-8?B?VHJiQSt5WVIxQkJsMW5hNmRGT1kybFFzRnAxR1RROUxwcWpDVnQvMFkwTnhQ?=
 =?utf-8?B?NU50WFlEUWhnelB1N01xUVdrVGRkeUNtMm1XL1dnRXNEdHBQdWJ4MzQ0SWFL?=
 =?utf-8?B?Tk5yY0JCRFdKNkk2UXl1TStIOUR6M1lYMjFpUVE5UllJblIybkdLTmhYTm45?=
 =?utf-8?B?SEpybG1md2VqVTZCYnk5YWJNRkU4bHhzWHg5ZXJxaHR6bkFYT05mQWtKS3g2?=
 =?utf-8?B?ZjFrV0w3cWxyY0RNRDd1eEx5VHdTakQ2TmZkc0ZOc0pYWENtVHgwd1YwT3Zl?=
 =?utf-8?B?cUJlMVRuV08xRHEvNVBicXBIVEV5bFEzWTRzMThKeXhSNlV3Ti82c1lJOS9T?=
 =?utf-8?Q?q6Z8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUFIOUdDYW9QdWpMOUxaZHNBajlUK01FajR5cXNmYWdSTHlVWXM1bDBJZEVs?=
 =?utf-8?B?WWQ3ZTBocnZMU014K2xpejE4ckgveW5UdmVxVi9oS1A2c3VOVHNubUxLZTJ0?=
 =?utf-8?B?ZFJzaWRzWkZ4M2tLMnhRWmJIYzR1SzVqOEVISzVpOVVKNmovek11eEE2dEs5?=
 =?utf-8?B?MDIwaU44N3EwZE9DUE52a21rbnBxdFNHMGl0ZkRLRlp2c1FTdnpGejZ6U0ZT?=
 =?utf-8?B?QlY4YmQ2MWkwamdTRmtmVkEyUW9jNVpUejF3T0lwNVllZWtVR0RleWVJdWJy?=
 =?utf-8?B?dnczUGZXWVVzNFlvL21uSEhnVHZiOGVHN2VKNTRwcDFxV3laNGlMM3hLV0xN?=
 =?utf-8?B?cUtLUEtiSk9QT2llK1RxRWhtWkF3anZWakhZUWtERW5pYUFhOGE2VTZZV01H?=
 =?utf-8?B?MGl5bTlSbHp6TzduNWt5TkV5S01WamJUVWZwMTlEb2Q3N3lmdWVvVndra2pK?=
 =?utf-8?B?b2pqZERVVjR4QkM2TEtsRjZoN2RoSDd4RGp3SzMxRDdBRFFmc2pNeDlYelRt?=
 =?utf-8?B?YVJ4NXRnUWVxL1BiTjdGM3lIQkRRWDQ0SnVGR01xNWl2amZUZE55eDRtU3I1?=
 =?utf-8?B?M1ZzK1dvYzNEUlI4SUQ0RFFvU3Z0TXVRVkRwUUJvaXVVbjZybndLeVhuUVJv?=
 =?utf-8?B?RlE1K21OWDVhU0I2TDJCNXBqaUQzeU0rNjRsdlNsQjl1OUJSTXFKN0xVa3Nr?=
 =?utf-8?B?dUw5SWhlNkpLazh3Z2V3dlBHSDJPUzQyQTJsV1hsSWJjUEZDZHFSa1ovMEEw?=
 =?utf-8?B?YTYzRE53QlVzR0dZd2FrQnpQUmVhTUhQa0p4cTBldW5lZCtsd3RoWStxbGdm?=
 =?utf-8?B?UFhQN0NGeE5xUVRCUk5xcEFNTnZxRHBtY3o0Q0gzczczc3pJVkt6MkUxTFRL?=
 =?utf-8?B?QVgxaEJ4ancwRGJqM2dIUTd1NmplNktUUDhLeWs4Z3RqYVRjMnphQmlMSllX?=
 =?utf-8?B?UVB0bi95V2p1V2I0cHJOYXdFYzRudXFvQ3dKODkzMjJveDg4V01EdUhqRTVC?=
 =?utf-8?B?M1ZtcmFmQWM5ai9EVnRZd2o0MG0xb0crUlZLT2ZmQ3FWT1J5bllPZlhRbzVC?=
 =?utf-8?B?cGVSS05henQwVGdXS2REb2FVTm9UcGlKVXBTR1NYQmtpOWZBcGhUQ1JYcmNz?=
 =?utf-8?B?ZlVBRU1yL1JBSHZ1UitUQU5RaWdRcmk0YXNUcFV5SG01SzlJa2Z5NlF3aWJJ?=
 =?utf-8?B?MlQ4ZW9YaEZkYkpQWkVmUGR3ZjFaa3ptTG0rVmF5QkZLMkZyRWlBRnd3TGdx?=
 =?utf-8?B?VUphWlk3TElteTl0K2ZLbGY5VUJwMTBOZEg3Q0hoQmRIbm5mdlprcUVCUE9F?=
 =?utf-8?B?c29hSk9nZUlLcis0OFF6dUVPMjV5WDJFcjhNWWxPMUJiN1Q2V0FLSmNoaUl6?=
 =?utf-8?B?OTFBUm9RcWlwUW5EMFZ6VmhNT0ppUEFEWUYySTM2Q2cweEQvM25uSXZTeDJp?=
 =?utf-8?B?QmJYbEkzekova01pOG11Q1VXL1liWXZVNXcvRzA3UWVvU0ZwMFVES0xzYW5X?=
 =?utf-8?B?QVZpMUc2RzZIYkxveHRxaUZveUFYalFUc0lpMkt6TGR1WjNrVG1mOENUNkwr?=
 =?utf-8?B?MU1KanR4VWF2RHB5emVyQlUvQnE4U1N0OTAya1dSRHFkRGQ4YUFBaVhqN0Vo?=
 =?utf-8?B?K1NxckJkYnZ3TzBqdUdFRWdYQU91LzBxdlVJM2V1b0E5VU54WWY0KzFkSFYx?=
 =?utf-8?B?b3VvNlhOTHdMREtxRk5VWmJuQkRLUWNHaGE1UjdrK25NeGxSWDJ5bVlxVjBW?=
 =?utf-8?B?SHJMTndmM21FSDRBYmRXKzh0TzVxVVQvT2dWbk1ncnZSV1BpSk92SkpYczFG?=
 =?utf-8?B?Zi93cHpXQkY2YmlXYnVZMkdsaWw3S0UzUStzNXBjNzBwY3Bld1ovZW1PQXhD?=
 =?utf-8?B?WnBRSWZTelZwM1pkbVFtR1VyaWxZV2J4K0U1SzNKY1Z4QTE0Y1hKc2hRQUFE?=
 =?utf-8?B?Sy8wNmtrTDk0V0wyeEFBcEZWYlRDcUQvVE5NUHBQTWx3Q2ZjRXFQY1pZL0dC?=
 =?utf-8?B?OXNHMHIwaVgwM2phZVhqenhkd2JMblM2dEUrT0FMdGNLUGJ5bjFiQXRPOTFF?=
 =?utf-8?B?Q3JQMGRjTWRhSlJMTXVIU0lyeDJxNUdkbEZuTWVZVHEzU0FpdWRKK0lUZ05Q?=
 =?utf-8?B?VzkxZ2NhYStTVml2MDhDdTlRVmVwTmtCS1U3S0VPaytIOC9SQTB1Mm9SZi9M?=
 =?utf-8?B?K1NPTlZsNVhsUWpSNE1YVUpCdU9WallPSDFqanFDWjZ6ZXNnZnRnWGNBWktt?=
 =?utf-8?B?bzRkNjJxK0NxSTNhS21sd2xQRHgyQ3hHdzRkMk9FR2RqL0pMa0tFT0s2Zngv?=
 =?utf-8?B?dURtUnQ4bDFUNDBpL1hGZmp6YWJjS1BhdEJWMmVTd1dUekRsTWwycDZkd1I4?=
 =?utf-8?Q?C5028yi6b8vnG9sM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b5003e-13df-436e-8938-08de53c7d069
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 23:51:19.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIQ194zIB1rI9qRl8zQWVcQUQp6CkhoONlGgmsYQk/nqc03h38d2D8MCfTtKKn9qSfOqAqHGhnsq1iKOXNB5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 03:34:21PM -0800, Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 01:48:25PM -0800, Andrew Morton wrote:
> > On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> > 
> > > Reinitialize metadata for large zone device private folios in
> > > zone_device_page_init prior to creating a higher-order zone device
> > > private folio. This step is necessary when the folio’s order changes
> > > dynamically between zone_device_page_init calls to avoid building a
> > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > must be passed in from the caller because the pgmap stored in the folio
> > > page may have been overwritten with a compound head.
> > 
> > Thanks.  What are the worst-case userspace-visible effects of the bug?
> 
> If you reallocate a subset of pages from what was originally a large
> device folio, the pgmap mapping becomes invalid because it was
> overwritten by the compound head, and this can crash the kernel.
> 
> Alternatively, consider the case where the original folio had an order
> of 9 and _nr_pages was set. If you then reallocate the folio plus one as

s/_nr_pages/the order was encoded the page flags.

Not clearing _nr_pages is probably bad too, not sure what the side
affect of that is, but it can't be good. 

> an individual page, the flags would still have PG_locked set, causing a
> hang the next time you try to lock the page.
> 
> This is pretty bad if drivers implement a buddy allocator for device
> pages (Xe does; Nouveau doesn’t, which is why they haven’t hit this
> issue). Only Nouveau enables large device pages in 6.19 but probably
> best to have kernel flying around with known issues.

s/best to have kernel/best to not have kernels

Matt

> 
> Matt

