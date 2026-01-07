Return-Path: <linuxppc-dev+bounces-15390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAECFFC7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 20:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmdb41g8Jz2xpg;
	Thu, 08 Jan 2026 06:37:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767811019;
	cv=fail; b=Q7uHNe0Ai1XuFIvE/rOHmzH9IRMXQrSjwB49FwTe2YnZ02V505K3xSAfYFTTEun5dINw4kD1LMUd9SE72GN/a2o7y01C3ONKJNwlpVwvBuu6IqTDvkyZ2Pu5epB8XbMxkH/D2byebYWgwvQqu7wgw/B87YrKKNABMT923spgJomAeLccSVRFpet4O4a5Qn6CP4atHvT6kzHdAkDFI6sCzi4g+F3U+krLNB2vTECMwJ4F33CJuf1ZfsJEag6Y3Ky4L/670Yc0E4YmOJxtFSoGIMYbuGYbjFKBo0pD8B3SW//Gy35WdxnSH4YwZamtpiZXbnkJQRKiAZuSr/YKMe80ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767811019; c=relaxed/relaxed;
	bh=2qwI7t+LEaKi0O9lhIrEOAhZqdPRZhchHFxCtBz5I64=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HPkv4Q5LGASIDCFJk/MR1FxAdmI/L2nT/IC/kWqEZuGPtagiMSz3rn2LZ5kiIfNLRy2Ti0rSm6RG8+orcIBvXCXGJOfDBm8yOk8jUO6+/cI9e4Aou8UfMY0l9HUC2JDJDw6U9nDjcLe1xY8UTWHZr3RMj+cvAqTUw8qmEP7mDjo0l1jsGhMgmRFJJxn9j0WrwlKDHacvVtgzINRXGkXHwwU9mXcgBIIdyY9Xlhllb90B4kGXe95qiPIQcChhGEkDEShuG5I2I9cn4RKEeNaS2+8rieCzYlYxmahnC4tsOcKWOOQhhuuhUzgD74NCGOvL+AUgPIi7rDfl2NalcrF+/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nhvd+ZVn; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nhvd+ZVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmcFh6Vhzz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 05:36:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767811017; x=1799347017;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yv53AyZwfymVQH9oUFoaF45wQszI+T9bl5ftwuYdjfQ=;
  b=Nhvd+ZVn+6TkuEmG/QRBv9lwipYZNnAT7yiwrISj1Nns7cHOJ2MqxGmA
   +5C2c2FkFMQcUObNK0DIGmVLgOs4cR3z832dkE0o+4RVAh9u1IB5a5s8N
   ke1Mdcta//GxjrHoizO2jE02Kdx6QJPBp0UVW6EDwm5ypXdDAZmBEzi+J
   BDzWoUJ9oRdPxjSi83c1ykPxP/8F4NgYDEgMKq8vlX4C1rfyPwnPLIAWD
   v09FnA34/3CPFQSNqMlLSNdbp75rNV9kCQ6XfqdglNJTFZqQrqWd456Xw
   NpbeIsTJL4xaIno61s9NGCVCNtPRUcISxcHzWDWKPTkVdky1QGiQ3VRb5
   w==;
X-CSE-ConnectionGUID: DwXyM+SpSISaPneYmfHJkQ==
X-CSE-MsgGUID: wIq2yQNkRNeYP5xJqLZ2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69101412"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69101412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:36:50 -0800
X-CSE-ConnectionGUID: em62HFJIQP6wexB2HnPO/Q==
X-CSE-MsgGUID: of8f5z7uRvij/wDvyCP+kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="240476538"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:36:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:36:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 10:36:50 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:36:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeSAKziGeVzeE1NnercFcjBErjwXheIMpY5EpXWq6U1OjLV88d4yaZ1mQJX37nKDCd3CkMi+x2iUZ4+wAzIcmioJyIuoFv9gBTPbE+ysyFhnuw37ahHUIsmGx5EgDSXuY128Y1/hfqZ/5OTBrJe+yKubpQyUu5OnznfxlxBfw45Wkwur1875bJfS9X+gw8dstJMXNXBE7Y44NiJAULAWd5P3FbXvS18R7o2UjcHdIU92nIxru1JhuwDkxgUCCq+jBWTp3O0e0txnFJkfxABlmh6s6QVoAUyLmRTpOGkebejRVzeHvD9shkSbcJU3QD3yQMjm66qfvdQQlFMXz7d9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qwI7t+LEaKi0O9lhIrEOAhZqdPRZhchHFxCtBz5I64=;
 b=dqveOexk8UACEaKD1vEKkkdv7sIMDkMCsHKNteet+uBebTXxJbeLV0F8Y6JLWO3Q40qaHLc+HUYlutWRtbdul3OComnPQmHOdtNYG4Yupj1dPlruRze0JXEY7BkB3Rcg7/CV9UBX7RsHSa3Xqvp1a0IIXpUF5ExnZ3o6fyYqVLLXZszM8a0Ab/6orwBbU9x1AQ9Q0GAacLrwPhxrP7+pwB4GVVsbLz4xagwKC2HHNJXQj6W45kkzvAmnji7yDLDaIZM7IGuY9QqyGd1or2ca/3Gfsuw0Hyr9fug1KEGmY9dA7kiIPgt3PXfnr/VWXn11IwFEQNYGDbzQ/yRCHO1wEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 18:36:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 18:36:46 +0000
Date: Wed, 7 Jan 2026 10:36:44 -0800
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
Message-ID: <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b079fd7-40d0-464e-43e7-08de4e1bb682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RqJNx+k1swnpYDf39jaoU9hyxAmdxfx+AiHJiuK0nu+5ooyl1xfb1HR6+v0u?=
 =?us-ascii?Q?LQ76XM8EkvNddC4QkGneNSNalguC1uopmqwhvQ5zYZQScOkfBqU+uw3cQQRm?=
 =?us-ascii?Q?ICLrHnKnX/pHdVsIpmmE1cEJJwX2gQazCwPAAUslaS2YWw2JPIZmargRC8FM?=
 =?us-ascii?Q?ochotri6AyYk3Y6Tuflq+skdshO8s/nydoXlSn5p5ckDm9aJLovubcCcKT8z?=
 =?us-ascii?Q?vJjcSgXhsnO6g9E+Wd2m9oraMjk3QJhugL4GkjvR3d/ySXLmsyj5MVw0I0rM?=
 =?us-ascii?Q?wS61pK1h4N+14PUu37Sm3k/w41Q+lqvR7ERLs1+DbIwoia/WI4jFYvH9Wl0g?=
 =?us-ascii?Q?pSUNYG/B4CauMsu2fYw4o4z+L0z5o4PjEsENh13CohiDanSqV3W/4AOA69DP?=
 =?us-ascii?Q?esFg1P3rKGTLLcPNmCbdtXrKv/6vZQa2fHUvAu4pTqVAqEAOE73LmxGMrPoG?=
 =?us-ascii?Q?d8iyjMnUBs3Xu1I7BNKt+DqM4UU+gqj/nSg6vd4YC06UZPdKzpz7zmDv3aNC?=
 =?us-ascii?Q?GBA8TLHwp5N9f9WC0Nc+YIzw/G4RJi1LRy5Yxf6dutjDz3dPNJECq+cv2wYe?=
 =?us-ascii?Q?PtOHuhf2wkc/mb/5x5R0d8zy9C1xsePy+OX+2L08yYt3rpxfswkeEfLx6U/8?=
 =?us-ascii?Q?JSiCOTJIqIwqOZuDFRJSzaDkXPIyHrlG0lklR9Z8BlblVKctfPAU/e2MqzB1?=
 =?us-ascii?Q?U34cXxdocFh5xax2PwxxME5gHCkBIAlXGlRKnT6nOojL6GN6SMvdzL4Lf3NR?=
 =?us-ascii?Q?GR9Nji6YZJAYQYbC9kV2Oa0CU/RO6JNMcKGlH8c1U5Rbk+0D5OfU6FIKwwS/?=
 =?us-ascii?Q?6N3GWp9gJZRe1su32lUeM9ngtFPkHq1Gf/0lkustOPHcfwydibyoJpUN1l11?=
 =?us-ascii?Q?3EKW1/1yfWL0ui2AtcN7SCb+A9x5Db4ibxehwM2QkKEYA3+TSFI3xRKGE87X?=
 =?us-ascii?Q?gSG7W7yucTkLoTRwSsM6DDa7BZEIZxqIAX8COtZ702U9jkzLMeFLsDW4909g?=
 =?us-ascii?Q?qJgSUf2ycKmzLth7L57q/0AF+Pua95Fn+EV7RAVFUyzPRvRBvOC7l3blVP1W?=
 =?us-ascii?Q?SgIx76MZ2Z3tK7HwXXc1D0on7HOdWOh6ikdVQhExnpQ1fTwuN1rfm2xs7pir?=
 =?us-ascii?Q?ojGrUJhlFQBm1G/RL9WaamIKDEE74gNT+rEY9TKGdK1igq8QoWC59eUsEyvn?=
 =?us-ascii?Q?zC25sUYBpT/JlEg2MpUMK8g6ESNhwF+3UHikqD1ew/3yvqxMJXiM9bMMw3GH?=
 =?us-ascii?Q?PAOjz/mGKjwAucfERX4SaUKT2RpFWFT+zkz8Lo5geaAnUQNwck7hWxv5Jl9X?=
 =?us-ascii?Q?gmL6HvBfZ6bVB3N+hFqN82sFP4PDu+oyuHVgaAVQTRcQHjQktQ6OzI1ll9i/?=
 =?us-ascii?Q?/1ZQzBoWUsUm5LxpQ23ZFENmXpC7D6BgTz83rT7AArCA1Y7tyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3zhGnp73HGLBCM0fH+0Jfgkrptdlr1RNz2rmv6LO8ATFzDZISCcEIGyaFkgW?=
 =?us-ascii?Q?5/m8hNLOe9GPxDPcxvi/QnKsu5ug7EU0LUN2XeOjlz6xHgDQO1+a6EvbJ3iD?=
 =?us-ascii?Q?Tmmq9xztU51Fo2quphIROUF8lv4RdlY4fZ8la7O7PH7F/S+bzlQaaXC4r1+4?=
 =?us-ascii?Q?kuc1n/EQDSg4DB8EHMbrMD7UptqpPjC6r6ohSklF/WgM3c62hD2CUmd3a0b3?=
 =?us-ascii?Q?FxWcZOKnlV8yrbIUYx2EUln61IRkO0ylIcAVdh438/MQHvXUOZhh/BW7oh7w?=
 =?us-ascii?Q?skzirRXzSe32l5W+wrqXAcT4nG+OEnJJ1ef1jLt7Aiz58gJwnwdpI50Vd63L?=
 =?us-ascii?Q?A9/yHUxoCySNgHLfnDQII89nWGjpLUpVJBBm6snICPs5aOPKbbAfpkKJlM6m?=
 =?us-ascii?Q?M0Edaz3rM69ZqvVYA5HcpeCiiriiERPEP5BKRC9IQeznYYKwBpH0x98UQAfH?=
 =?us-ascii?Q?GgHQ/7TKCRRTt9Ag4dpDZsi89Unv8KQPHKBCm9KOgdjRESnOR8z9CFyjtzRY?=
 =?us-ascii?Q?UrmOB6ewTxJ+rOLd7jJ4hn8GeCeKVZjPU+lhc+tADWwvFu3kESla/n/fLfYs?=
 =?us-ascii?Q?hH3xd40tfZZ/6PKbMt7LB68FTfa27tktmSoTmv0p3yhJCqiDgshM29QoOq5q?=
 =?us-ascii?Q?2GbfBD37vv8bACmsS7zStBR7N+YsrHh8qClzQET1jE9Pa+xa6kAvAUqesrwI?=
 =?us-ascii?Q?hGFXvePx/LJq3zTOMBt6pxltrxcxeaaDeKHJ+VYF7JsWV9tXdP7Y8gPlfzqj?=
 =?us-ascii?Q?jRKjBtH61IjsF/KCJVdJ5w3++S4ukg1UuSPQuBrLhXGKLzfdenDMvqRoxSHS?=
 =?us-ascii?Q?nNiulvDzfFf5AnTYdoU/lOpRypPrj6hLE5ggjtFNMv8Ozrjt+Z2eeiHWlC+7?=
 =?us-ascii?Q?KRWVDj0XeAp0tOEegng7fKE1Rrq8WmpZGDFne2UWhcA+m+SbXOUqQIP3z2M7?=
 =?us-ascii?Q?cv68EMwRTnDwGj6lNvY6owaVp9XgvT1ojKeO3fXBtp5VNW12FaT840EQ8MlW?=
 =?us-ascii?Q?wQgRn5Ut0oNpDBTY6asQOnnVLOIF8k+znqiNNC0AaRQo+C//Q9Ll6UDoQl2/?=
 =?us-ascii?Q?tM1wwD14NEgfJNWBBc/GsCRdKfLfooUQSD66T8KulbXBtJ+5MplvPSKw9TQP?=
 =?us-ascii?Q?FKGsa6bC+BaWeS0B7BQW7abIKHgsEZ97k4vKp3IP4B2nikF16dBsYjtPAjP0?=
 =?us-ascii?Q?SiW2lQ1K1IDXZahmkCLqHod4/8Zc8l/kqhe2/Rm2bkryt7RzPB9RUtIGCZAO?=
 =?us-ascii?Q?hDhP+PGxB/IzRB1+5DRj8HyamJ5iDaHkgVgSmtgqk3/vgDt54fsDWKZK7HX7?=
 =?us-ascii?Q?WunDT4wTkEFftYZhURjdPUSUVO2wRw6bVEJq1Z+QEKX6RkqPTGw0w0ggW80e?=
 =?us-ascii?Q?+Ju/cbt9ouqRAX2kEr4I2l3Old1YgFqc+22eDjeeExQR+1hTEQJ7rsrDvdxp?=
 =?us-ascii?Q?GyCB49XmNHD8TpGds3GmjA4vVC3EEABXpGEb9GVWYMAHlRNKjavcIacac/u4?=
 =?us-ascii?Q?Zj/A1uHaEv9BP4/P1vqvWtBfjpKvNMiykOWxi71PNXsMNUw39qdQN5fCRmJj?=
 =?us-ascii?Q?VYXa7j0sxRYxJsUAUvHqF84bRxLZcp+klfqilQkmAEp/5oj8dCozA1AmMEkb?=
 =?us-ascii?Q?Eqr/z7+nX+5vmXmLj4ZOgwwZfyoTm3W9XySQs2Luiayww+zS39zJbwok9SHq?=
 =?us-ascii?Q?MXvprvx7/3krUiJB6XlQpVM1ycKvnZ0pP1PezsmifVdLlK1De7WggGGC1qkK?=
 =?us-ascii?Q?cAF/Oej7uF3SAua0QMOa9Vj2lbMmyVo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b079fd7-40d0-464e-43e7-08de4e1bb682
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:36:46.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP84Sx9qmbdPFgzKgSgV9zak3rTla4C4J6aUgJ5pAvCy4NhFvFU43IWYDQcLylxkE5WGVmXyVVCWtq6lZ0/zeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 08:18:12PM +1100, Jordan Niethe wrote:
> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.
> 
> Needing allocation of physical address space has some problems:
> 
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. This
>      has been observed to prevent device private from being initialized.  
> 
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64  - meaning the feature does not work there [0].
> 
> This series changes device private memory so that it does not require
> allocation of physical address space and these problems are avoided.
> Instead of using the physical address space, we introduce a "device
> private address space" and allocate from there.
> 
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. Instead of a
> PFN, device private pages use an offset into this device private address
> space to look up device private struct pages.
> 
> The problem that then needs to be addressed is how to avoid confusing
> these device private offsets with PFNs. It is the inherent limited usage
> of the device private pages themselves which make this possible. A
> device private page is only used for userspace mappings, we do not need
> to be concerned with them being used within the mm more broadly. This
> means that the only way that the core kernel looks up these pages is via
> the page table, where their PTE already indicates if they refer to a
> device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
> use this information to determine if the PTE contains a PFN which should
> be looked up in the page map, or a device private offset which should be
> looked up elsewhere.
> 
> This applies when we are creating PTE entries for device private pages -
> because they have their own type there are already must be handled
> separately, so it is a small step to convert them to a device private
> PFN now too.
> 
> The first part of the series updates callers where device private
> offsets might now be encountered to track this extra state.
> 
> The last patch contains the bulk of the work where we change how we
> convert between device private pages to device private offsets and then
> use a new interface for allocating device private pages without the need
> for reserving physical address space.
> 
> By removing the device private pages from the physical address space,
> this series also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.
> 
> *** Changes in v2 ***
> 
> The most significant change in v2 is addressing code paths that are
> common between MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.
> 
> This had been overlooked in previous revisions.
> 
> To do this we introduce a migrate_pfn_from_page() helper which will call
> device_private_offset_to_page() and set the MIGRATE_PFN_DEVICE_PRIVATE
> flag if required.
> 
> In places where we could have a device private offset
> (MEMORY_DEVICE_PRIVATE) or a pfn (MEMORY_DEVICE_COHERENT) we update to
> use an mpfn to disambiguate.  This includes some users in the drivers
> and migrate_device_{pfns,range}().
> 
> Seeking opinions on using the mpfns like this or if a new type would be
> preferred.
> 
>   - mm/migrate_device: Introduce migrate_pfn_from_page() helper
>     - New to series
> 
>   - drm/amdkfd: Use migrate pfns internally
>     - New to series
> 
>   - mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
>     - New to series
> 
>   - mm/migrate_device: Add migrate PFN flag to track device private pages
>     - Update for migrate_pfn_from_page()
>     - Rename to MIGRATE_PFN_DEVICE_PRIVATE
>     - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
>     - lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE
> 
>   - mm: Add helpers to create migration entries from struct pages
>     - Add a flags param
> 
>   - mm: Add a new swap type for migration entries of device private pages
>     - Add softleaf_is_migration_device_private_read()
> 
>   - mm: Add helpers to create device private entries from struct pages
>     - Add a flags param
> 
>   - mm: Remove device private pages from the physical address space
>     - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
> 
> Testing:
> - selftests/mm/hmm-tests on an amd64 VM
> 
> * NOTE: I will need help in testing the driver changes *
> 

Thanks for the series. For some reason Intel's CI couldn't apply this
series to drm-tip to get results [1]. I'll manually apply this and run all
our SVM tests and get back you on results + review the changes here. For
future reference if you want to use our CI system, the series must apply
to drm-tip, feel free to rebase this series and just send to intel-xe
list if you want CI results.

I was also wondering if Nvidia could help review one our core MM patches
[2] which is gating enabling 2M device pages too?

Matt

[1] https://patchwork.freedesktop.org/series/159738/
[2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1 

> Revisions:
> - RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvidia.com/
> - v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidia.com/
> 
> [0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/
> 
> Jordan Niethe (11):
>   mm/migrate_device: Introduce migrate_pfn_from_page() helper
>   drm/amdkfd: Use migrate pfns internally
>   mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
>   mm/migrate_device: Add migrate PFN flag to track device private pages
>   mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
>     device private pages
>   mm: Add helpers to create migration entries from struct pages
>   mm: Add a new swap type for migration entries of device private pages
>   mm: Add helpers to create device private entries from struct pages
>   mm/util: Add flag to track device private pages in page snapshots
>   mm/hmm: Add flag to track device private pages
>   mm: Remove device private pages from the physical address space
> 
>  Documentation/mm/hmm.rst                 |  11 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  11 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
>  drivers/gpu/drm/xe/xe_svm.c              |  37 ++---
>  fs/proc/page.c                           |   6 +-
>  include/drm/drm_pagemap.h                |   8 +-
>  include/linux/hmm.h                      |   7 +-
>  include/linux/leafops.h                  | 116 ++++++++++++--
>  include/linux/memremap.h                 |  64 +++++++-
>  include/linux/migrate.h                  |  23 ++-
>  include/linux/mm.h                       |   9 +-
>  include/linux/rmap.h                     |  33 +++-
>  include/linux/swap.h                     |   8 +-
>  include/linux/swapops.h                  | 136 ++++++++++++++++
>  lib/test_hmm.c                           |  86 ++++++----
>  mm/debug.c                               |   9 +-
>  mm/hmm.c                                 |   5 +-
>  mm/huge_memory.c                         |  43 ++---
>  mm/hugetlb.c                             |  15 +-
>  mm/memory.c                              |   5 +-
>  mm/memremap.c                            | 193 ++++++++++++++++++-----
>  mm/migrate.c                             |   6 +-
>  mm/migrate_device.c                      |  76 +++++----
>  mm/mm_init.c                             |   8 +-
>  mm/mprotect.c                            |  10 +-
>  mm/page_vma_mapped.c                     |  32 +++-
>  mm/rmap.c                                |  59 ++++---
>  mm/util.c                                |   8 +-
>  mm/vmscan.c                              |   2 +-
>  32 files changed, 822 insertions(+), 339 deletions(-)
> 
> 
> base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
> -- 
> 2.34.1
> 

