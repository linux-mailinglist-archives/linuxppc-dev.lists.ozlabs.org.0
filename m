Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E761991D9DF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 10:23:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hO3sDfXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCJvw4fj4z3cTP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hO3sDfXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCJvC2Vhwz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719822168; x=1751358168;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MFcVXUwoUwE+MZo1Atwoe6rRlxKOPawCw+svxWuKTtk=;
  b=hO3sDfXTqvHIo7fbAnbOSjlEj1ZPgBREISBtULm518oH/OBvhkspjpcO
   AVwqU3Md2t3SVI7kPYY8pyMiPOnglNq+zI8M2JG+jSdoBMUmEY6wlf6Zl
   3FNju86WXMzTaisyfHCC4MHYDr9y1L/fB+YGLEf+JbC7udt3/gXIYmbKe
   d+swPWbhvhjygNiyip7F9KIUcYDBWmWiObNrus3XCrMfQTMfebIFvhwNS
   kiVGFa85igj8rThmfGAqaj1svqN0Dq8Ph9OmCSTkM718DK5UTdG+8wwIh
   PZE8mfpsYhMTGo8o7tPfE/8LKovwgRr1SKi7YxU4VNf+8XycqgNiKGTiG
   Q==;
X-CSE-ConnectionGUID: Thl9Gk9iSFODhbLVC5VVEA==
X-CSE-MsgGUID: 4uzVneBzQtaIppFB0ASGpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="39439703"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="39439703"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 01:22:42 -0700
X-CSE-ConnectionGUID: 1q7LWps/TdKknyhkLjxNYA==
X-CSE-MsgGUID: 0/zSkuBlTrqDtIZdaV2zlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="50321254"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Jul 2024 01:22:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 01:22:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 01:22:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 01:22:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 01:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXin0o5m2b3EmPrOtdqn3BtydlwQJZtcO7HEtW/Wz9tqIUviLn9XO8Sf0W2DTxT4G2YxsNOIJ52ARhofhxFGNsV3mKohFXiC4WOy10E5bi9vKxhxx8zYe+dSbEPYxvbjoTsaL/u4gM5LouF2LxpyXPxdDTxTKcNOcUkXlbt3EnRYr3oFec9ZtOrFXETSfrDlZxjjfBPdRuM7V2Kgl5xuXmqoWMjDrHvjqS7ebDK85gi205XZapOejPrDF9MRZznABvrzzBr2OBqoY5O6coQI5ILxm6rN4PVZRhAKlLp3HOsiPZyQG4TKylXMdB+PrhAF3F62YiEzFtGNCWAgh3vmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo4XGzN3eeUO9cndA08KgF2hORIOMKadIdOFygq1Lhg=;
 b=H187AIGhdgC0dLBOgJmfLf0cAPL5e+UIP/grUyvyG50L0wlMxfEb7cg3PztvX4ti6T5TLevO8mCIoDv/Z1n3Wg/8oYfD2GzdFGfutI6mwDucFE/b6BUlk0B2B4NtqQN5DOsKFay0edq4W3azc4Iua6IlzWpebciZCWlJHQZgdvqHveAgSrSs2zD4ld+UgSYaB6Z12hBIsN2yoiYKBGf7JXTjP9qDDairqHg3ItrjafB7Gam4WlWntK9rLTzWK1YrZewavHP5YBvFfTgUulTeognT+HHWws/shea3FXRja+FT0ZqIJejdYjOOERBD2/fBA5HaAEf+vR1u7CeWFbPzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 08:22:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 08:22:35 +0000
Date: Mon, 1 Jul 2024 16:22:19 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
 <ZnzwbYSaIlT0SIEy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnzwbYSaIlT0SIEy@infradead.org>
X-ClientProxiedBy: SG2PR01CA0196.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: f8750f7a-deaa-4246-f7e0-08dc99a6f60f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lAbrgDi/pIjh+6U0H0ujoJ9UWRpXetFUz8NjAWECuvih3NlawwHt5+kWIuLL?=
 =?us-ascii?Q?XAn5GTLeOmqnwDwCLMQeA1ZcS73SQorY6WteoB3CaEhJPqDB80FqP/yLjRAA?=
 =?us-ascii?Q?mXCiN1gRcNre58Z9Bq6EadccYUC7yV2qqbFd2v5e1dt9YcrUdEugVm2kZifb?=
 =?us-ascii?Q?u99Fu6SvFGdg3XPd2JUDNQVpyZi7R44skrlOYEbuEVjwauVqkLaixKpZ5qTY?=
 =?us-ascii?Q?pIsEKuzQvSMToijPpZ3JRZoBwAnAnjFzz/m2FsartjUvleDTIDDnft7gDSt2?=
 =?us-ascii?Q?n8I83IphqNcsxK5k5c8/l5sMm2r4Pqhv/a3Kfd6FWYfYWzGUV/yxCRI4gD+l?=
 =?us-ascii?Q?9ojyf5FarqIlRvL+N9P59MR6Pw7zqpta2XNz2usQLT5sqdFc+BfuVymmlpFQ?=
 =?us-ascii?Q?A3O9KpplVKh+0YJFOSLnJXgq9Kk4SVeGFkOp/Zt6spQGKSA7cLfZgflWyhDZ?=
 =?us-ascii?Q?0mYsv82HPe43ExpLg5/hxSksez64RtXvYr/g/+yTYn4UZJDR9/6Q3S5+D+Y3?=
 =?us-ascii?Q?jC/icAUn93mlWIMqtHGZtNwaeHwWuWYz6RePXoQqKVwfTIPIZM4epbtX7fkG?=
 =?us-ascii?Q?qAzfP7aRyzglOKvpp9K1NTWoMhcJ5VUVtivxxZbQoeYyUKDbMJgiqU97il+z?=
 =?us-ascii?Q?vEx0b8/P3cRroEWloqTaXcPZEGMPGXrHz1FZXc8RiJcjk2rPlpYx7Rz1HDoh?=
 =?us-ascii?Q?8K3ehq/dvz9L1x07ILHlktkpC6Z8+5sV4BoJeIdrDOlV7Omq9VKkoDoAH2Um?=
 =?us-ascii?Q?1YTE/VY6+7L2bmCUlvH7MPBUFYibw9k5KNV1FxKZG8eAEMhAJGe5ynpcNAbI?=
 =?us-ascii?Q?9Jm12D/Xsh98FO/xvT4FXcG3wFvZfxp0nZBIsJDTR2KzYXxbbWrSizA95bQ1?=
 =?us-ascii?Q?RnJ99+O6y9cglp9ZNZqHtZASoDsvUk/ct0hSgk8RlPnHsqDCJsLDQLBhfMqN?=
 =?us-ascii?Q?zzQJE3oKLgF4nnJn/mV+1ViLGMykVdGckkgkMUdwzVrZ2en33wVBYA5XZo0u?=
 =?us-ascii?Q?Qof6QSzZlHjV2dxu2VsUFN+sxb6vJrOrg7AFcsjZnqE0+vcLFpGWUTbE8eyC?=
 =?us-ascii?Q?DV1nyYT4oIjn1/3n+MVCIE6YHGbHr7d8ix2p01tGznvZQV1d3smR6Q0CO32I?=
 =?us-ascii?Q?iUwZ1jehJ/WP4uRIze+1rzzCV0yTMLQPPhCiJXD1sUeiZkvYJnLw5tNMPaiS?=
 =?us-ascii?Q?aV6y6T/tQ9aOjSQwfTydyQUVsEjriyDN1SPqAx2Y449KKThc5RdRO0DKAYAn?=
 =?us-ascii?Q?ppE1voNOEN9fBJ9+VvbCqCFNL//7T/E35AQ2JWdREwMw6nEwOmAljHDIo/zh?=
 =?us-ascii?Q?bys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHXQ0tud/VLmoZu5Vh1R4afLEky2csE+fU7LE6wcyUHCFuk7QS4lCXVCIJbW?=
 =?us-ascii?Q?cJUL3/2rT98nOQxKO0TLPdriSuEcvRENm5+yDBA3/TP8MCRKkYsXBwnsxOpe?=
 =?us-ascii?Q?9IvZUITlj9PRis6MEutJcF0tSzVKNS+2MqdQxpAnt+ELytYcSszyaTTd2UTP?=
 =?us-ascii?Q?G1IWtmLt1vZ71kpdi5qFrPNc/lOYJLZcP/KrHOucvR8hse2Go4+fm+gKEkVS?=
 =?us-ascii?Q?DgQwWYwft33PVnUy7faLgNQ4vS4SFptp1fHD1gjNeCZnSX75ilawGPQ4jUsd?=
 =?us-ascii?Q?Mk97MoJt+/HVCnVDbQW3WT9NdaM0R6xLgj6spfWcIPnC1RHGT1172GiLph1T?=
 =?us-ascii?Q?SH1vM/3ZQPW3/NpiBBDuBijofnVqzeetITH+Nd2vywzHqtnZ4nC+MR9S/r+x?=
 =?us-ascii?Q?EG16H5E0s8sDnxhbYvUl+DNvIqyXFtT3TMi8sYJkOKC1rnsSDyNpUpcCcmfc?=
 =?us-ascii?Q?VO8UYhi4GrdKykGKJ4rsT3IJIj6Xgu5/xo34KQPLC3UuUbbl0CxPnilDJMrA?=
 =?us-ascii?Q?mPEgPz1xZGYLwSj8cyPItS+NGuXkY5UrSu/ON3sh8JqqOix8o3nPLcwcm3L/?=
 =?us-ascii?Q?kzewfuuNag+8Q6jFKtBVdii3s2yXEM+jExUJhdEEL0EZASc2cDVFK2uyIfrw?=
 =?us-ascii?Q?Ge36ZvJJpK7QgrScAlElGtK72KcNlI3sc5jDz336d92xyY/hpHpAn7yENtqe?=
 =?us-ascii?Q?z5NTJITAr4c2ptB36ggWqfQBDoN9J6ou+Te9ImeqAV6iWV6mUMAcXOKOpb8l?=
 =?us-ascii?Q?1FTGHroZJttb/we3E75WdTpG+PYB7fa8woiCRqN4RF42eXlvsniH7lKI/77z?=
 =?us-ascii?Q?fs5DAv6pR+pExPY8MdAZpNb0StQmxhHL/nAV24qbIbL6CUsujrxe4bocKMRl?=
 =?us-ascii?Q?8EDcpwFuZMYJUIvbwQ9rSvPGS4x5VN1y+bjFZeHIZJBAwbNRgtRwFFDMU5wR?=
 =?us-ascii?Q?90fAuhomphD2qE61jEA0adJR1VBuOzvbRsbQHOyZ037sVtjF7VMYfgr25SMm?=
 =?us-ascii?Q?r+xyCqmC8I56cFe0uQTpPjZBfUUNjGubzshElE7He+9kxiLV65azqnFvoa1M?=
 =?us-ascii?Q?tFIT3ZMvH5mPDU1wR1C4/fH/8nX7UF4LA0yz3QBsOIS7QZfPQ+YC+TXulUND?=
 =?us-ascii?Q?ID2rZ26eG+cOi/T31m9+PN+BTdK1w1xrwAy9sDMF2D/UHTxoIFG2OaJBPNJD?=
 =?us-ascii?Q?jycK5CWedEGQ4WSCuPzA1q+xg3R09glCVGdftvhGDT2kAbbcrmFsV5NMi9MC?=
 =?us-ascii?Q?hRchM4pmUWLVstTOFGO2q6NKzANuabta2qKcaeQUxwOnjU7WqgfmzBI0ug0X?=
 =?us-ascii?Q?LLr1yHB3+XN4DdHhFTe8hKZznmU76zyn6NUm2vK2mVkWg4p0nVGvBAUzsVcQ?=
 =?us-ascii?Q?1FlQgfNcfiDs1FQ2Bz73vKvm1C4ZyKM+IE9hjvwmD+/D19q6GdambGd2Ov7y?=
 =?us-ascii?Q?MNyn5VVgwKS7jnGiBAWnKtETxKNLRLywot3xIjjs3kbFVOWiYO8TOUKeJgs2?=
 =?us-ascii?Q?zyG7CLeRoXeUexNriW3BgXJ8oW5GQD+/lxNDCuXvAr/n4YdTVOFiHKXX4jFZ?=
 =?us-ascii?Q?72W47yPvvx7fBOKnpIEPPg1OjHEeYenNd0gALkkHw5cD06pOl/V6eDt+B9sr?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8750f7a-deaa-4246-f7e0-08dc99a6f60f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 08:22:35.6234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoAUe/v3DmtzV8cKInT0I62Jy+Kv79UMUXBa+5EQZ/S/Plwbvm1L4f9nXoa5Aa4Vfqw0JjFtv85N3J3C3ZYjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, feng.tang@intel.com, linux-nvme@lists.infradead.org, linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, fengwei.yin@intel.com, oliver.sang@intel.com, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi, Christoph Hellwig,

On Wed, Jun 26, 2024 at 09:54:05PM -0700, Christoph Hellwig wrote:
> On Thu, Jun 27, 2024 at 10:35:38AM +0800, Oliver Sang wrote:
> > 
> > I failed to apply patch in your previous reply to 1122c0c1cc or current tip
> > of axboe-block/for-next:
> > c1440ed442a58 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next
> 
> That already includes it.

for the patch in your previous reply [1]
the bot applied it automatically as:
* 5c683739f6c2f patch in [1]
* 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625

for patch set [2], the bot applied it as:
* 6490f979767736 block: move dma_pad_mask into queue_limits
* 278817f42e219b block: remove the fallback case in queue_dma_alignment
* 81afb19d619a04 block: remove disk_update_readahead
* 037d85402b8b83 block: conding style fixup for blk_queue_max_guaranteed_bio
* 4fe67425ae31a8 block: convert features and flags to __bitwise types
* e3c2d2ad4136f2 block: rename BLK_FLAG_MISALIGNED
* 33ead159243d1c block: correctly report cache type
* 6725109120e0ba md: set md-specific flags for all queue limits
*   e6d130064a02f5 Merge branch 'for-6.11/block' into for-next


but both build failed with the error:
  - "ERROR: modpost: \"md_init_stacking_limits\" [drivers/md/raid456.ko] undefined!"
  - "ERROR: modpost: \"md_init_stacking_limits\" [drivers/md/raid1.ko] undefined!"
  - "ERROR: modpost: \"md_init_stacking_limits\" [drivers/md/raid0.ko] undefined!"
  - "ERROR: modpost: \"md_init_stacking_limits\" [drivers/md/raid10.ko] undefined!"


since you mentioned the axboe-block/for-next branch has already includes the
patch-set, I got a snapshot of the branch as below several days ago:

*   bc512ae8cb934 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next   <-----------
|\
| * 18048c1af7836 (axboe-block/for-6.11/block) loop: Fix a race between loop detach and loop open
| * 63db4a1f795a1 block: Delete blk_queue_flag_test_and_set()
* | e21d05740862c Merge branch 'for-6.11/block' into for-next
|\|
| * e269537e491da block: clean up the check in blkdev_iomap_begin()
* | 9c6e1f8702d51 Merge branch 'for-6.11/block' into for-next
|\|
| * 69b6517687a4b block: use the right type for stub rq_integrity_vec()
* | c1440ed442a58 Merge branch 'for-6.11/block' into for-next
|\|
| * e94b45d08b5d1 block: move dma_pad_mask into queue_limits          <----------------
| * abfc9d810926d block: remove the fallback case in queue_dma_alignment
| * 73781b3b81e76 block: remove disk_update_readahead
| * 3302f6f090522 block: conding style fixup for blk_queue_max_guaranteed_bio
| * fcf865e357f80 block: convert features and flags to __bitwise types
| * ec9b1cf0b0ebf block: rename BLK_FEAT_MISALIGNED
| * 78887d004fb2b block: correctly report cache type
| * 573d5abf3df00 md: set md-specific flags for all queue limits       <----------------
* | 72e9cd924fccc Merge branch 'for-6.11/block' into for-next
|\|
| * cf546dd289e0f block: change rq_integrity_vec to respect the iterator  <-------------

from below, it seems the patchset doesn't introduce any performance improvement
but a regression now. is this expected?

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/testcase:
  gcc-13/performance/4BRD_12G/xfs/x86_64-rhel-8.3/300/RAID0/debian-12-x86_64-20240206.cgz/lkp-csl-2sp3/sync_disk_rw/aim7

cf546dd289e0f6d2 573d5abf3df00c879fbd25774e4 e94b45d08b5d1c230c0f59c3eed bc512ae8cb934ac31470bc825fa
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
     21493           -19.6%      17278           -19.2%      17371           -19.7%      17264        aim7.jobs-per-min



[1] https://lore.kernel.org/all/ZnqGf49cvy6W-xWf@infradead.org/
[2] https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/

> 
> > 
> > but it's ok to apply upon next:
> > * 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625
> > 
> > I've already started the test based on this applyment.
> > is the expectation that patch should not introduce performance change comparing
> > to 0fc4bfab2cd45?
> > 
> > or if this applyment is not ok, please just give me guidance. Thanks!
> 
> The expectation is that the latest block branch (and thus linux-next)
> doesn't see this performance change.
> 
