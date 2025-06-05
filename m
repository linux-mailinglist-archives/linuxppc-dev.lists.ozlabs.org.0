Return-Path: <linuxppc-dev+bounces-9173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C4ACF41B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 18:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCqVt5xJZz2yLB;
	Fri,  6 Jun 2025 02:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749140582;
	cv=fail; b=RSvASOD83ND5pZPxAov+UP5LSbpdP+HlhppOPClR+AQVuqyqy/YbfX8EHfwrnQ+GBQ4H61nSc5STxtu0AJLF15DjJa8iWhhBzYR/YwxsNcRKOxtLZ9Zg/huh7h6qtzEv3+Vjll6TMfs1Q2dsQ7KinhTzbvd9gP1x8m11M7EvHQ3Om7ZV3Ov80afy1Xs7tApgGmjNP6dqTyXt28CBXizCRiIGhm+En0GRrVKQDT00TdPR5FsF2mlBD+zo06wGJkQX0az1mHb3wdboJQueTQIVS6TinFrfZaNPDN76q6HAOWIorMn9ypHS3OCVDAJalABxwSS4Hl+dzF9/igPhE93Pgw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749140582; c=relaxed/relaxed;
	bh=6MHdH6NxRwuO8sLiEdgfzKL4hQC/FGLIPtUJOHFCaHk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d1JQ7QZddCJ7bT0B/6Ih5B2ebNKwhP+AJuUS797ulaQ8Ph0jKgesfY4XKPJ2yr1J26Skr81BASwXFe6T3HqaiRgbaUc3lFuEadkowXUJi5nm8nM0nxRxhLTJ+8Y+5bBF9gAJFQXJvN3ZyWO62ZJltjejGdD3OpjDbIimY/3t0G+c6Fs8yC6uUvfdxSGPpeA21AwYUQp9JFyN/KNUPtHCY1jhlG6nkli203UNt1mtsR7CcfMq1IlJ1zUulOMX7ozL0583TMZp9KfHqZSHPSwEYQcoYAUjhEnFp3Cfymqcmg4k0JNfS8OU9+mxQPEqF9sZFR2PVNB7Gq9AaKdZjD7Qcw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAX3fPmj; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAX3fPmj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCqVs6KTNz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jun 2025 02:23:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749140583; x=1780676583;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wUsWjZmOok3iuFa+KxwWxif/djrYI0+O41l1/U/5vXw=;
  b=OAX3fPmj0KecQoi5Sy+L+7bx+bKCZr7QTIf2iPrUUUU1fA+DmdQxIkQ1
   mMv3+BcfgUBy9qfISntNAzhCXnx12mQqravDUwg/OiVRjTHbDzcvvtlUd
   6VNB5DPtayy03/YKOsG8xyjmEpWeA2hbgpPYcQR+w54KLB3ZOpLDmWqSA
   X9B0lWyRAq9OYv+cSuRpNJCfSRzzM/+6yeIaB2QB8BC0g01/tOrMhlzOA
   Z7BTyS5MWoKS1Rp/qRwv8jOLoCl7LJASTOpz+6vYOvDCq1VbPF6CdRZjT
   y+D5S5o+l1YSCjud96jROi27hy/gHLY1YDSwju/5Jtr/fZAsmNZ8fiaAo
   g==;
X-CSE-ConnectionGUID: FHTL6ic8QmWPVvLJSC4zoQ==
X-CSE-MsgGUID: ZKgBW6nnQbCcJaUs+xXRrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55076174"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="55076174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 09:22:59 -0700
X-CSE-ConnectionGUID: zmEocG5nT/azS7Svenz24w==
X-CSE-MsgGUID: lonqYo0CRWKAUKLBRsCHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145527358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 09:22:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:22:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:22:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xo1AX/qRUM/mJ+TTll32IOI0AKU+FZIb5k7Atjnf9HFnj6I9QM/u/OBSILWCxE9WZNF6EA9uVJgdweVffNMEF7i3qtoo+hvOudoFMY0WsY6frtbqWl5dfR95DVRlaHANMhD3P+vi2O7oVRSK/YcCp70pDzpFA0dZLcWnuzI1A9V2UZpR2cxU6Xqstv059TpwIpChl2LImzg0/EKIHhn9kSTEF0S/O17d73Nm0fL720KxPmiTdfaUtURUG363HSD8BELcEOH6n8j8c8wYmMQxfhEG82ANXgPgYRa7ZVhjFUG4VEpg6ZVsTakSpI6Gbod28NR3WxjFT1Tyj6Qnwx6/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MHdH6NxRwuO8sLiEdgfzKL4hQC/FGLIPtUJOHFCaHk=;
 b=Sr+qBkgVwwlP4Sfn5+iOcb32UfGZtGfpYBUHwL0+M28o9wkMb03tUmmssoOKw1+BmEcEGo0NcFX/a2XgYVeQuYxndFRCnM62u2fAnLw3UNGPgDTWtUqDm9Zr43U+GJosH7+jzLVB4QXzqvbwQqpxPOMNWOYWQhjgVObNdprSYZJQUaj8odHLlEzpO7cT4hrUoD14Qq9eQpPKTG8xutnNn7rrz0sy2jls7BzV4MC0eWVDxJfFxU+akfZjabqloGUx9qi5sDXzqyEBH6wegcBaqbjuK99L37xCPTXS8vH5swdyHDt7kHy4mOR4PAOnQCY7mnwJj0sB0N9PPSBvS7K7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 16:22:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8813.021; Thu, 5 Jun 2025
 16:22:55 +0000
Date: Thu, 5 Jun 2025 09:22:52 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>
CC: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
	<gerald.schaefer@linux.ibm.com>, <willy@infradead.org>, <david@redhat.com>,
	<linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
	<balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<John@groves.net>
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <6841c45c490e3_2491100c2@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605120909.GA44681@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250605120909.GA44681@ziepe.ca>
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: f56a9f7c-8f08-42d0-ecc6-08dda44d39fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rCBGIz0ngrR0DOfNbxV1IjVa4hDRApy4ssmNcqNgbH5iiWDGWB9Peec/YHX1?=
 =?us-ascii?Q?BdeAcAeuaDJK56Ne/DZZw5coyw2T5EzQCW86V7DCh+zsMxxvWTC3YlHAIFC2?=
 =?us-ascii?Q?2PlxyyjNAqJH6jJqUEthQxelq18CwFrxnkHMLGCaLNQ6RUiourd5Guc8DiFQ?=
 =?us-ascii?Q?gBY0WBjUqSw7REPmdhh8X4uQRMu2lAI3GfbvV1ehVv1NatyRAZqSZMWZqXQJ?=
 =?us-ascii?Q?ufpHHLkj3T0POO47nhvzpbJZ9pZRodBUYBca26YYOJqelPjkU8z98FSyqPkx?=
 =?us-ascii?Q?T276QgFJ22QE/7I58YC5D+DbeQDBRnyBLnZUb/TNx2QaRR3TzehX3UlZpvD7?=
 =?us-ascii?Q?2jgrvLXTbCkS4PyJHypridr00Uv5ivjI/U9o/QfRjZ2K8b5pOPoCK1FZg9Fv?=
 =?us-ascii?Q?vu7/anmnIytNC1GEiBqBmlGtj6ejKoxX7n1332xAIRL+HypsBYnVvPWYQ93u?=
 =?us-ascii?Q?Qpa+Q1k/Ej0CSKLipgraCkuWQzI0AtNhgotZ1vFgC8Me6Fu1A4bL7Yr+5AVU?=
 =?us-ascii?Q?RR595loQQmz2tGjcCW3N3XU4aJi6y5DWUyd5OLaPjKxm70wFNXk9N6IsOrPK?=
 =?us-ascii?Q?QWW++2CxlwUTAb85UxqsJFBCeWLaKy329L/9LHyAorEptu+FH5fRTlX1+R5U?=
 =?us-ascii?Q?AxYOlfPVHM+0c5pa+aQ5pE3syLC5APSl/Lk9PX6KHvMZICJsXc0vgs8csrs9?=
 =?us-ascii?Q?cXtWXJb1zVjmivtI0IaDULtC+RYttpQ4+vAoCBso0JbnlTf4idw/cOcH8LuF?=
 =?us-ascii?Q?jQEhjPDvsUeINy6acRn4ZME02mhq1/wpj+e+UC+CDnVCTlga0VQn2FgbaOiO?=
 =?us-ascii?Q?ZhwEAx9hc3GALBj83PHCI2zeF7Z/Wgkpr3LJKPO0iJJOJMpYwvdm7EcfDejO?=
 =?us-ascii?Q?LpqIO3fLMfBXWbJaFPXNQ8GHLpOor9eFk2xg//d9ENZ3AblCri+1W75ZbrWf?=
 =?us-ascii?Q?34LY8OwMx5Qky1SRJvaucZjN5wm5V8QjpWn17TNy6kqt9ISsWEo4fwoSwLnA?=
 =?us-ascii?Q?oDQvgpTarIeGe7ZdLM9t3bne4vlWNUy1oAc6qGDrVDX0CkLvXjVAYGB5wSJT?=
 =?us-ascii?Q?Rk2hR4oRr5SNDS8FFMUG2DKng/IEOLQ5Qr6raQi0KfCRJw0p3UwZZI3V+bS+?=
 =?us-ascii?Q?kayE2nqXS2x9eiBZA7XWvDyi5axvGdFARIyLN7byIv3gQGE6UFbAfCguBPbQ?=
 =?us-ascii?Q?an1Bue3awqzC7mL1nukwxBTDWw+zCnM6I0/DP0oshEBubAD2K3UuVs3zmuhs?=
 =?us-ascii?Q?j8l48SJYqLFP9uaIFXXP5FvJA9BMVp2cDmgMb0s2z5I9SjPIR9EWtJ/b9PpF?=
 =?us-ascii?Q?qR9586/mqpOIF+QCAw8FGH/iqv0guzbNeIt6Bn6c0shaE6V6flAk6M3bJjUk?=
 =?us-ascii?Q?BCZArSXNfZovoeQ/LzkD2b7ORVZNNWIQq+nx6r2vgXCvvZiScUSdVqJUnc9F?=
 =?us-ascii?Q?mtiHXxFIlLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ux3pmE6iWgE8BENFjYkQFIU705oR+xVn2l1M1KGMnUEH+76NnSCRhyD0AjcL?=
 =?us-ascii?Q?n3oKEZzcATmm3zfXhusmKRTeez8afBbUePTR+0Ftc9d4EhSW1uWTpsYvXCB8?=
 =?us-ascii?Q?B2ma/7Tdxwu8xClILPov8XKKSfCPla0pxwwd7/uxs1zyFcR4zum6LjLySBoL?=
 =?us-ascii?Q?IYMLnS1LpEs+n3MxBu+WtcbkDZCC14h6uprLNRkgrDILPcz/Ln1LAM4kT+s/?=
 =?us-ascii?Q?PR6jrN/DVBlNqM8h+1Ze2d+BVwIV1VFyxxJCXqafLCvX/S5yPRRFrf3zmwz6?=
 =?us-ascii?Q?NJ5jJkpqmcRc8P/9qs7zeUrHqJefmz12pAlGJ5KqDwLuM6rthmdMU1rJViro?=
 =?us-ascii?Q?l5XQ2PBmj40LiZYa/CtOnODt2uDWQDf736uVdGgsG3tOW+6V2ZPb52WJWkse?=
 =?us-ascii?Q?/zgpVDX4OawSV5WAGM36JmNisi1vcMfBGPxYflK6gtxQH2usQnehM8GADxTP?=
 =?us-ascii?Q?WPCLylOSDNywVBGIWSz1eczdZOCZmL1r7xcFBdSuxQ+Oc4CuZ1zuRfU3XhNq?=
 =?us-ascii?Q?jXiQ1VQGnEx/i+GzKfgCHh6/bTJ6syGRQouWrrSdpTAoiqU5zxINZ6JXEFwl?=
 =?us-ascii?Q?+ta12XIRziZfQ1CzvScye2onFPPny+1H5Fz9xwoZHaB56geLH5g9Y7nWwrh8?=
 =?us-ascii?Q?JVH4KoppXB0h9BAnpF0Er16/RI3ABG5vMG0mbonk9Wq2iBS4KofrtqtISIgs?=
 =?us-ascii?Q?wSqeHaOGp5fghq//BoeW9FdPsMPsyGmSVqrB3NPpwGuqnjAa4pU7vQsnrh/1?=
 =?us-ascii?Q?YhZzwhm/2Lh2txirzTzGXakm6oHCZbJti7Bo7ESx97gBLXyfCH/tYJnggyZS?=
 =?us-ascii?Q?xEKdaNxJ5OFemwEZXTcFZed2ufHe0geFScfEjKBI/zazT4PXFbOztHXAPW0B?=
 =?us-ascii?Q?8qCsQ9C/EJ3epQ4Ez3rrTP1YH9qHQqnmievrVqM3uB3aYQkG8n3FOXrtmE6P?=
 =?us-ascii?Q?yKBhlYehu2TERmhrvJafxrc7eP+5Xcraoy9V+EY7VPqIJr2BAB5+/WwU5rkA?=
 =?us-ascii?Q?0kwu3RxRFtObyTdDfy8Y4IxeBoAGiFPwnB6IgA4i27f04gtYhpwxlqKJgHeb?=
 =?us-ascii?Q?xJctycDHwKLdZQELy0mEZNNv63yXy9NcDjbb4Tu6+s4rMV1Z4qUWToMwBcFj?=
 =?us-ascii?Q?XmcZVSIhfe9HFCpnrQY68vd9k1WX/N7j6tAxWHShM2QZuuEkt0t+ffG28hVv?=
 =?us-ascii?Q?Q15s8nbyCjzJ9VQgLpuCwrM5UEO3vsrhaC0TE3aWtm1XaCbkqQ0TZ6BxLURH?=
 =?us-ascii?Q?GEyfBiOJGlea14qkK2aWCDre6/Lw/MN93YhllxQm20xGhZwaxn8vdUJeQRA1?=
 =?us-ascii?Q?0X9r0K0vNJd612M692cjVIkXtEHJtSTRgPVUkAkd2+BqcGLsqb7qbjbV0WGe?=
 =?us-ascii?Q?QlxoZBTrqEGkL7jntcyRGnDeeqDfmBz6ut9FIZIJThbYVaR3CbS1Xt+bnnip?=
 =?us-ascii?Q?M3Rwa+lpTGF7igGy4/ZjsgZzgtPm8Nq5HzHFLUGeYTHw3nczvPYL+HY4KTVe?=
 =?us-ascii?Q?rgy3icWXgFnchfuCaMj1w+Nj2PfQETyj2vYM5MO/GH9Bf4KmSVWpKPtJ6VDT?=
 =?us-ascii?Q?X6KNjru3JR0bKF0NR+aErXQl6kdA68GsI1vQtnVuyZtY7Rf+pF2+gFTWoHwD?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56a9f7c-8f08-42d0-ecc6-08dda44d39fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:22:55.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLuuWAvNq65ImFwzeK+EKmmfEe1kD+ebprHrTRcKvs0h/PHdypTh7XgY4SDDrjBdcSJDaLoGSu3pL919rU1W5YZu2VAxw6eRsGqoyzAvYVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:
> 
> > If all dax pages are special, then vm_normal_page() should never find
> > them and gup should fail.
> > 
> > ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> > 'special' is not set in the pte path.
> 
> That seems really suboptimal?? Why would pmd and pte be different?
> 
> > I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> > 'special', right?
> 
> There should be dedicated functions for installing pages and PFNs,
> only the PFN one would set the special bit.
> 
> And certainly your tests *should* be failing as special entries should
> never ever be converted to struct page.

That's the point, the pmd and pud special bit is not considered for gup.
So fixing that requires making it not break dax, but looks like David
has a cleanup for that.

