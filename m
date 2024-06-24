Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E87C9144C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 10:27:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFlWafDd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W71KG6bWYz3cXN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFlWafDd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W71JV4tjNz30TF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 18:26:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719217581; x=1750753581;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=fGhZO2FmE8nE29RUwQ5tssL6/n/FksubW9qRWYQIPYE=;
  b=kFlWafDdSlGW1IIkS1upWyOAjN/j3xp+mHZHKeFmUGhihLHGf8cjj523
   P8whSpRcn/8cn1X6ZLUdZKG4cF8Ha6sFHVrIm2ULGoHV3IF7GlgFSYUtW
   QSMBr9gtGYwbhY566eE6E5Tvqwi3Lp7U/b72BO6sj174vkIAg9qxKJuq9
   3xB95lqj6ZXMZ9uS0jWFeuqsnFkGmhwOOElOFP4X6M9IbphRzqyJPbDe6
   of9Or3VTLEq1FE2QsMbhZlrB0fmbs+7N844tFHplSmzGmcicNFwIwzFvg
   NEAPWf6NMzWuI9HlvEWiSfgls6pTBkje+UGL6Yx5FxgXcHbp5x20S+Klg
   w==;
X-CSE-ConnectionGUID: h5u4fKDMRNyjhrWWOHBCsg==
X-CSE-MsgGUID: 4fdv37GiQS69IA5ldZ5fEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26765437"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="26765437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 01:26:11 -0700
X-CSE-ConnectionGUID: Bx13QGr0TyeIl9N6cpzLDw==
X-CSE-MsgGUID: 4BMncUgvRYS9iGVr3ZiD5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43035911"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jun 2024 01:26:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 01:26:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmJDppupfMahxXcPUuAOePZ2ectfuCcnhp3Cp7IPDANxTBkapRr0yhPJnZBHEmhoj+GoiRuqD5O7r9Kdrm2jNxiW9PV0Pj8nAK5BoRWAGwSjIdW+Zaz4sZj4TCDNvhBfNgw3qj842WlSIz+d+W513WfAe3aMb92q2WIQHZNyi7i18k9aVmRROolYYjNzaeEHJAjJGcgm8CPejwnZpM2bhuJgfyluPUOx/Bv7IPsgdjSXlcV6SA4xrQzAnPQSGV9Jqs73NcPaV9YJjCLTIgpHNP4AqyitCjaDfnnZ+KKc8vEh+BFFf9DNGfhxY2GZoBeqHAn1EFItA/NOuVD+PL7AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag/dNuxDxMpGNJjZ5/rdH7paw2w6rRWw/btotE8n6oo=;
 b=lVKvvOXa4WuNIaW4xj5/Qm3PAjJ6m5StURH11t2ym+k39u7QU/dfPWSJd8CWcBfxDpgalSUiXDTtn+wx9vlTKnnT1rU0BDD9e/TUdMbcP2HHAmC5cgfneBQMSgNdOp9O3FqKB9DYBubrsL64Ri0YIiKTwgOtkp1tml5mSs2kF6El6CgJf3aKeFCcE6H6O4U9KcZe5pSo+6kK1HR38iaYuhbPkgiWpHquPp8LSIAz8CAlm/A8PvhszcMNfF0/ryN9fu0/GZqHCvRhDyG69uiwLDfVtjUNWC6VaDulrJMdNRfTYJH/oMqq1tJTiC3wQB+3Hlb75pvUAmbLdDc6uTzkyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Mon, 24 Jun
 2024 08:26:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 08:26:05 +0000
Date: Mon, 24 Jun 2024 16:25:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: [axboe-block:for-next] [block]  bd4a633b6f:  fsmark.files_per_sec
 -64.5% regression
Message-ID: <202406241546.6bbd44a7-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: c2345f79-9682-4c4c-7189-08dc94274a04
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|7416011|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ISgO9TcVw3b2S1YGeqXvIUmn8liNmawT+wyVQPqq50YLy07N9BJ6/mxWDr?=
 =?iso-8859-1?Q?7OQxMGXg7Q8EFMgZQb7hfIkoNn9opf82oJYkjQMoYmhwDYm0A/6apn1/xq?=
 =?iso-8859-1?Q?D3oUgZFhpY86dNnP4t/ZMqxm0qIJ3mR69ZgkJRzRjXwDZ6x9VrRhp36976?=
 =?iso-8859-1?Q?qdJMUC46nvzR4s49RP0krzW7Iq/x6U14BBUTZoMHYOivZF+OJTPBOs5XTT?=
 =?iso-8859-1?Q?0Yu+umvjAdkbWyzyLY9INBjoJiyUGKZZonhz9jw+ASvB74DqEqRwMMujjl?=
 =?iso-8859-1?Q?estJkYHmLrxlp20IJrIgCvUz92AckfE82Cx1exGAQ9/xV4bQSm2yhZZ4bX?=
 =?iso-8859-1?Q?35R3T07c+HlaXkRfYqyY70j3TdZKbF63tSHlfrys1dI1/tUsfJ+jSFNz2c?=
 =?iso-8859-1?Q?Ee/E1GZktZQMepihghPwqiBgKvGOAjUxK6I2F0t2LH5kFAAo4xmPgM3Fdu?=
 =?iso-8859-1?Q?f7mQTteNFgawhzbGSNQPn8INgh4GwaDy4KBr8lKWtnSkSywrHPtJT+Mw6K?=
 =?iso-8859-1?Q?ltB3q41onqUr9TM+0PUODmiCe3qgb15W6lCO/Q/F5aMfNL5YAiL/KaYBSj?=
 =?iso-8859-1?Q?3xQFJfGSyaNIyjE2CfYg+L/TTZbb91qxCXFtPjvgqLhIPtVa74WSqBBp1W?=
 =?iso-8859-1?Q?OBrCg8xtQ5mWgxj6Aft9N0Iwozk4/pcn4Y55TEj27G3tfMMEWRroPwgiCY?=
 =?iso-8859-1?Q?bzN22xFq6VsdflyK72od6McTfu2dCasRGjB+yaFo18pr9ew5cl2XgzQOFf?=
 =?iso-8859-1?Q?/Rknnt2Gu8i0FSQjBeO0NrOormWXRJRtpyehjh6CJOHC09Bg+tWBtYef5H?=
 =?iso-8859-1?Q?lFhx4bom/JDaAoaUHovSN6COCqbZY6NyXqRT8bdl4YjMVVbJ+g1JxuFpzf?=
 =?iso-8859-1?Q?FoZprsTg55xUznMHV8QzW3j35p/nbn17hF3KbmA9qpW2Q4BZjX6tPDWJK7?=
 =?iso-8859-1?Q?TT6M3N+8z6d7edIQ2guUz9ONgms5nvylzjT0LVsn+nWQ25RFdQ0zmOy38J?=
 =?iso-8859-1?Q?ZQQWJrD8b9Zf5Uer/fXabadrNvt8B5wo7Sug3l5jI3OC6yQOzAvCe9b0xb?=
 =?iso-8859-1?Q?CzRBwzyCjGnvXfpZJOjLLqNALYyz3gqD+OKi3u/PcNYPgEVo3ppK1aJ+5O?=
 =?iso-8859-1?Q?ehNyJtPVG6kcRD94RKOTUSMLbqUJ8zVdtPnZSgvbdgVqWyG4jnt/EOGNQr?=
 =?iso-8859-1?Q?45W6pifxYrhzcYe1AvUaML4pj50VxUpsn7SzpmS/XQ70rbgcLDzKCRLPO0?=
 =?iso-8859-1?Q?PuuNbn6a842qn72x9N0dzg6MFrymuCt1VlfDKppjbKbrHIstD/jV2+w4WT?=
 =?iso-8859-1?Q?L3KypFWdbXcVmqp0vt2EEeJNdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SSSc+j6be/IS4cJnPSFipnuHvhRcZ0Q0YRDXd50EobTaIxbSl7FYJqRvU+?=
 =?iso-8859-1?Q?9FzUAqctgbckJO2BlsoJZWvVWPokd7zrkW2i6pvz6PQy/6EukGIMVcufXT?=
 =?iso-8859-1?Q?ej5NMA9OuvWu0yIW4cIOjUPVTqLC+yWQGhtTrskfnwVawCSRT78Fzmlp0y?=
 =?iso-8859-1?Q?jJDAlZfFaHX4kBwyhA+T+F9E7bchGqWU6D2H2g1pSM8h3u9JTr5wWqBrtt?=
 =?iso-8859-1?Q?SB+UIuiALWMf4xmRfu08fODr4wVNj/xb23mPLEUKeCQSuSdZcxfzBsK96g?=
 =?iso-8859-1?Q?DKO1b7xTwSIaQgrLy3NphpnHPlGQgBktEJB8e7XuWbMv/Rp7JDtGxevdFa?=
 =?iso-8859-1?Q?4i7wpn3G3NvhR3KXZYI+nlzhk9yWqx645tghy1DVYs1WwCbKTmdF5dwWX/?=
 =?iso-8859-1?Q?df8WvHEp1caQRVRV/RQ/3ilQ4RgpdMfH9dgVPWA908bZEvGZC4qBE/rLGP?=
 =?iso-8859-1?Q?AZpgg1weePIpjKZ0SBDIiCHyyYVNFCVzP2qT1rGUTR3J1WWQy5BfweM7vI?=
 =?iso-8859-1?Q?n5WPg2DuFhY57s0CsfVzFoh74FDI/JORact57Ri8bsi2k+GCq7M5HORO3A?=
 =?iso-8859-1?Q?rslZx86InaCCY9pquxPbSp0By2ubQkKduYiUfbnbtBsW1l9jTnysrLoThG?=
 =?iso-8859-1?Q?y7pIDO4Psugj56/m9N+Pkwrnk7JHYxghzi4DPL24qgtcvEkCRxYUZ7ryRq?=
 =?iso-8859-1?Q?jPuz34L1HxsaLUB/xkIld/uBmkGC5podoQ5WTpWZdBZqvwOuu1y3NklnN9?=
 =?iso-8859-1?Q?1/m+JYsopjypyf5JMh/pDF6cnwo7Vm07Wb3hSqxd+cxzDO+/U7xa1+JMmA?=
 =?iso-8859-1?Q?a5eFU9Fs+nuCr0kT7ZCFCjsX1g5PqcrVptaO4R7g9iO94uutKMLOGYDSHS?=
 =?iso-8859-1?Q?H7z4T0l6YrPcXWaIisP64VVR1/smV1fkR79BfUNMTjPIC5fdOzbKwZXpgF?=
 =?iso-8859-1?Q?JDVgcavN9pF96TNKNM8lEhCNCVvRy6PEn/n7l9wVHrEmcJPLxkx/Xtoe0K?=
 =?iso-8859-1?Q?sIi2GwvTdmZG9Iok9121R04Su3Nyoz+mFiDIYmFoJtTMaLgT2NkTJ0JzR0?=
 =?iso-8859-1?Q?04Fqca74zXF6kqRjhXAO1tBLFJmhQHKP9BMjzaGvCnlnuzU0zyf6QG5H33?=
 =?iso-8859-1?Q?frsFQsdq5d2UTEV/SDDxEQyBhqLG3FVVDbI3XyxP2iI/Vzhh98A+cpKBu3?=
 =?iso-8859-1?Q?7aHaY/ieT9vI3dGCwZj850EzsOIQS8jKKEd/znuDw3Y74WM8ZxesMRB4ZE?=
 =?iso-8859-1?Q?LDR2Du0wXU3zH2xoXZ0h7DZvhCcpKmNtdV05EKjbvh45KfJRWNctXm1wWM?=
 =?iso-8859-1?Q?OI1a7BgiMtlJE3VspFNqSffdEQ8YGxzk5zBR1fPqMBulNFXhb86+eo+qLf?=
 =?iso-8859-1?Q?o06wHvGAL06UxX6/g17+jYCUwbifdnnliR+amwwCYdbfVmz40rUBrCPMdb?=
 =?iso-8859-1?Q?5EOzKW6BV0b+Mc/F16jrmIrJGw/yrIehuWidg3uL/5RB//1w+sfPV6E5Nw?=
 =?iso-8859-1?Q?egwf1bt7ZW1xH3o9zu8cRyzJ2wWQzFv7Q0EDkRUpDLtEuTu9GIYBuOfL1m?=
 =?iso-8859-1?Q?doMV9u/mJCSqnJyOJvkjnulAAeryVdmUpE8axkMej7ig3Pnq7ZvEt7aO8C?=
 =?iso-8859-1?Q?kCLKJs3ndneUm31IQYT1dWHwLxqpM2gUDa1Ya9TAReTDdliFtSObFIPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2345f79-9682-4c4c-7189-08dc94274a04
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 08:26:05.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gp3etjs7JOufrTzb8Lrtgh2xiE06tVjjkgOFR5Mymtun16sgWRsEmUHEu/+u4F2kvbt1du++C1xIjYkJDK+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org, fengwei.yin@intel.com, linux-mtd@lists.infradead.org, linux-bcache@vger.kernel.org, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, oliver.sang@intel.com, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Hello,

kernel test robot noticed a -64.5% regression of fsmark.files_per_sec on:


commit: bd4a633b6f7c3c6b6ebc1a07317643270e751a94 ("block: move the nonrot flag to queue_limits")
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next

testcase: fsmark
test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
parameters:

	iterations: 1x
	nr_threads: 32t
	disk: 1SSD
	fs: btrfs
	fs2: nfsv4
	filesize: 9B
	test_size: 400M
	sync_method: fsyncBeforeClose
	nr_directories: 16d
	nr_files_per_directory: 256fpd
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fsmark: fsmark.files_per_sec -54.0% regression                                                 |
| test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | disk=1SSD                                                                                      |
|                  | filesize=8K                                                                                    |
|                  | fs2=nfsv4                                                                                      |
|                  | fs=btrfs                                                                                       |
|                  | iterations=1x                                                                                  |
|                  | nr_directories=16d                                                                             |
|                  | nr_files_per_directory=256fpd                                                                  |
|                  | nr_threads=32t                                                                                 |
|                  | sync_method=fsyncBeforeClose                                                                   |
|                  | test_size=400M                                                                                 |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_btrfs_DWSL_4_directio.works/sec -75.6% regression                           |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory  |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=directio                                                                              |
|                  | disk=1SSD                                                                                      |
|                  | fstype=btrfs                                                                                   |
|                  | media=ssd                                                                                      |
|                  | test=DWSL                                                                                      |
|                  | thread_nr=4                                                                                    |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_btrfs_MWUM_4_directio.works/sec -45.9% regression                           |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory  |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=directio                                                                              |
|                  | disk=1SSD                                                                                      |
|                  | fstype=btrfs                                                                                   |
|                  | media=ssd                                                                                      |
|                  | test=MWUM                                                                                      |
|                  | thread_nr=4                                                                                    |
+------------------+------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406241546.6bbd44a7-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_directories/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-13/performance/1SSD/9B/nfsv4/btrfs/1x/x86_64-rhel-8.3/16d/256fpd/32t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-ivb-2ep2/400M/fsmark

commit: 
  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.189e+09          +176.5%  3.288e+09        cpuidle..time
   4069531           +40.7%    5726734        cpuidle..usage
    107.82           +41.5%     152.62        uptime.boot
      4541           +31.7%       5979        uptime.idle
      1347 ± 34%   +7052.8%      96367 ± 17%  numa-meminfo.node1.Active(anon)
      9671 ±129%    +152.0%      24367 ± 58%  numa-meminfo.node1.Mapped
      1517 ± 33%   +7000.6%     107767 ± 17%  numa-meminfo.node1.Shmem
     70.27            -3.0%      68.16        iostat.cpu.idle
     22.10           +21.9%      26.93        iostat.cpu.iowait
      5.28 ±  4%     -45.2%       2.89        iostat.cpu.system
      2.35           -14.1%       2.02        iostat.cpu.user
    337.03 ± 34%   +7041.0%      24067 ± 17%  numa-vmstat.node1.nr_active_anon
      2492 ±127%    +150.1%       6233 ± 58%  numa-vmstat.node1.nr_mapped
    379.71 ± 33%   +6989.5%      26919 ± 16%  numa-vmstat.node1.nr_shmem
    337.03 ± 34%   +7041.0%      24067 ± 17%  numa-vmstat.node1.nr_zone_active_anon
     23.59            +4.1       27.67        mpstat.cpu.all.iowait%
      0.56            -0.3        0.27        mpstat.cpu.all.soft%
      4.71 ±  5%      -2.3        2.37        mpstat.cpu.all.sys%
      2.35            -0.3        2.02        mpstat.cpu.all.usr%
     11.14 ±  2%     -25.0%       8.35        mpstat.max_utilization_pct
      7.33 ± 71%    +297.7%      29.17 ± 11%  perf-c2c.DRAM.local
     12.83 ± 13%   +3977.9%     523.33 ±  9%  perf-c2c.DRAM.remote
      1.83 ± 37%   +3063.6%      58.00 ± 16%  perf-c2c.HIT.remote
      6.67 ± 47%   +7842.5%     529.50        perf-c2c.HITM.local
      8.50 ± 17%   +5262.7%     455.83 ±  8%  perf-c2c.HITM.remote
    113674           -75.2%      28217        vmstat.io.bo
     12.73 ±  6%     +21.5%      15.47 ±  3%  vmstat.procs.b
      4.93 ±  7%     -37.2%       3.10        vmstat.procs.r
    222679           -59.0%      91356        vmstat.system.cs
     53879           -15.5%      45537        vmstat.system.in
 1.347e+08          +150.3%  3.371e+08        fsmark.app_overhead
      4148           -64.5%       1471        fsmark.files_per_sec
     25.21          +179.6%      70.48        fsmark.time.elapsed_time
     25.21          +179.6%      70.48        fsmark.time.elapsed_time.max
     46.67           -60.7%      18.33 ±  2%  fsmark.time.percent_of_cpu_this_job_got
    580573            +2.3%     593720        fsmark.time.voluntary_context_switches
      0.54 ±142%      +1.8        2.36 ± 45%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      2.30 ± 26%      +1.9        4.24 ± 17%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin
      2.30 ± 26%      +1.9        4.24 ± 17%  perf-profile.children.cycles-pp.perf_mmap__push
      2.00 ± 52%      +2.0        3.98 ± 21%  perf-profile.children.cycles-pp.write
      1.76 ± 55%      +2.0        3.75 ± 25%  perf-profile.children.cycles-pp.writen
      0.54 ±142%      +2.1        2.60 ± 38%  perf-profile.children.cycles-pp.do_anonymous_page
      2798         +3767.9%     108260 ±  2%  meminfo.Active(anon)
    293199           -34.5%     192046        meminfo.Active(file)
    224570 ±  2%     +15.3%     258927 ±  4%  meminfo.AnonHugePages
   1029143           +12.2%    1154431        meminfo.Committed_AS
     13542 ±  2%     -14.4%      11598 ±  2%  meminfo.Dirty
     32982           +49.1%      49184 ±  4%  meminfo.Mapped
      3406         +3452.4%     121025        meminfo.Shmem
    699.76         +3768.6%      27071 ±  2%  proc-vmstat.nr_active_anon
     73394           -34.5%      48087        proc-vmstat.nr_active_file
    599442           -23.8%     456690        proc-vmstat.nr_dirtied
      3372 ±  2%     -14.0%       2899 ±  2%  proc-vmstat.nr_dirty
   1054218            -1.1%    1042135        proc-vmstat.nr_file_pages
    192999            +2.2%     197338        proc-vmstat.nr_inactive_anon
    195427            -8.3%     179255        proc-vmstat.nr_inactive_file
      8470           +48.6%      12584 ±  4%  proc-vmstat.nr_mapped
    852.97         +3451.5%      30293        proc-vmstat.nr_shmem
     55125            +2.4%      56454        proc-vmstat.nr_slab_reclaimable
    598942           -24.0%     455415        proc-vmstat.nr_written
    699.76         +3768.6%      27071 ±  2%  proc-vmstat.nr_zone_active_anon
     73394           -34.5%      48087        proc-vmstat.nr_zone_active_file
    192999            +2.2%     197338        proc-vmstat.nr_zone_inactive_anon
    195427            -8.3%     179255        proc-vmstat.nr_zone_inactive_file
      2992 ±  2%      -7.0%       2783 ±  2%  proc-vmstat.nr_zone_write_pending
   1701597            +6.4%    1810757        proc-vmstat.numa_hit
   1651924            +6.6%    1760989        proc-vmstat.numa_local
    145673            +4.1%     151618        proc-vmstat.pgactivate
   2171880            +6.0%    2302217        proc-vmstat.pgalloc_normal
    173881 ±  3%    +101.2%     349830 ±  2%  proc-vmstat.pgfault
   1649733            +9.4%    1804327        proc-vmstat.pgfree
   3257714           -36.4%    2070947        proc-vmstat.pgpgout
      8901 ±  2%     +78.8%      15912 ± 18%  proc-vmstat.pgreuse
      1779 ± 15%     +94.2%       3455 ± 21%  sched_debug.cfs_rq:/.avg_vruntime.avg
    233.79 ± 29%    +200.6%     702.80 ± 30%  sched_debug.cfs_rq:/.avg_vruntime.min
      5950 ± 51%    +121.6%      13187 ± 54%  sched_debug.cfs_rq:/.load.avg
     59.42 ± 13%     -41.0%      35.07 ± 22%  sched_debug.cfs_rq:/.load_avg.avg
      1779 ± 15%     +94.2%       3455 ± 21%  sched_debug.cfs_rq:/.min_vruntime.avg
    233.79 ± 29%    +200.6%     702.80 ± 30%  sched_debug.cfs_rq:/.min_vruntime.min
     38.83 ± 16%     -60.1%      15.48 ± 42%  sched_debug.cfs_rq:/.removed.load_avg.avg
    104.34 ± 10%     -44.4%      58.00 ± 29%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      1198 ± 12%    +919.1%      12211 ± 93%  sched_debug.cpu.avg_idle.min
     25961 ±  9%     +81.8%      47185 ± 21%  sched_debug.cpu.clock.avg
     25962 ±  9%     +81.7%      47186 ± 21%  sched_debug.cpu.clock.max
     25960 ±  9%     +81.8%      47184 ± 21%  sched_debug.cpu.clock.min
     25888 ±  9%     +81.6%      47021 ± 21%  sched_debug.cpu.clock_task.avg
     25956 ±  9%     +81.6%      47137 ± 21%  sched_debug.cpu.clock_task.max
     24234 ±  9%     +84.7%      44760 ± 21%  sched_debug.cpu.clock_task.min
    737.62 ± 10%    +100.2%       1476 ± 21%  sched_debug.cpu.curr->pid.max
    727.72 ± 10%   +3446.7%      25810 ± 20%  sched_debug.cpu.nr_switches.avg
      3502 ± 18%    +922.9%      35827 ± 21%  sched_debug.cpu.nr_switches.max
    111.99 ± 25%   +6551.9%       7449 ± 55%  sched_debug.cpu.nr_switches.min
    703.85 ± 11%    +669.7%       5417 ± 17%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 79%   +2728.2%       0.18 ± 19%  sched_debug.cpu.nr_uninterruptible.avg
      5.50 ± 28%    +186.2%      15.74 ± 28%  sched_debug.cpu.nr_uninterruptible.max
     -5.24         +1329.2%     -74.83        sched_debug.cpu.nr_uninterruptible.min
      1.82 ± 17%    +622.8%      13.16 ± 29%  sched_debug.cpu.nr_uninterruptible.stddev
     81285           -42.0%      47184 ± 21%  sched_debug.cpu_clk
 4.295e+09           -57.5%  1.825e+09 ± 21%  sched_debug.jiffies
     80731           -41.8%      46949 ± 21%  sched_debug.ktime
     81773           -42.0%      47392 ± 21%  sched_debug.sched_clk
      1.00           -57.5%       0.42 ± 21%  sched_debug.sched_clock_stable()
      3.00           -57.5%       1.28 ± 21%  sched_debug.sysctl_sched.sysctl_sched_base_slice
   6237751           -57.5%    2651044 ± 21%  sched_debug.sysctl_sched.sysctl_sched_features
      1.00           -57.5%       0.42 ± 21%  sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      1.29 ±  6%     +24.0%       1.60 ±  2%  perf-stat.i.MPKI
 1.822e+09           -33.5%  1.211e+09        perf-stat.i.branch-instructions
      5.38            +1.1        6.49        perf-stat.i.branch-miss-rate%
  97326318           -19.2%   78633918        perf-stat.i.branch-misses
      6.81 ±  5%      +2.3        9.12        perf-stat.i.cache-miss-rate%
  11262919 ±  6%     -38.0%    6977426        perf-stat.i.cache-misses
 1.747e+08           -55.8%   77188971        perf-stat.i.cache-references
    247420           -62.0%      94049        perf-stat.i.context-switches
      1.55            +5.5%       1.64        perf-stat.i.cpi
  1.37e+10           -41.0%  8.085e+09        perf-stat.i.cpu-cycles
      1644 ±  2%     -54.4%     750.14        perf-stat.i.cpu-migrations
 8.908e+09           -33.7%  5.904e+09        perf-stat.i.instructions
      0.65            +5.3%       0.69        perf-stat.i.ipc
      5.22           -61.9%       1.99        perf-stat.i.metric.K/sec
      5046 ±  4%     -14.7%       4303 ±  3%  perf-stat.i.minor-faults
      5046 ±  4%     -14.7%       4304 ±  3%  perf-stat.i.page-faults
      5.34            +1.2        6.49        perf-stat.overall.branch-miss-rate%
      6.44 ±  6%      +2.6        9.04        perf-stat.overall.cache-miss-rate%
      1.54           -11.0%       1.37        perf-stat.overall.cpi
      0.65           +12.3%       0.73        perf-stat.overall.ipc
 1.754e+09           -31.9%  1.195e+09        perf-stat.ps.branch-instructions
  93653136           -17.2%   77575731        perf-stat.ps.branch-misses
  10836125 ±  6%     -36.5%    6879585        perf-stat.ps.cache-misses
 1.681e+08           -54.7%   76107773        perf-stat.ps.cache-references
    238085           -61.1%      92729        perf-stat.ps.context-switches
     46200            +2.4%      47330        perf-stat.ps.cpu-clock
 1.318e+10           -39.5%  7.973e+09        perf-stat.ps.cpu-cycles
      1582 ±  2%     -53.3%     739.58        perf-stat.ps.cpu-migrations
 8.571e+09           -32.0%  5.824e+09        perf-stat.ps.instructions
      4847 ±  4%     -12.5%       4240 ±  3%  perf-stat.ps.minor-faults
      4847 ±  4%     -12.5%       4241 ±  3%  perf-stat.ps.page-faults
     46200            +2.4%      47330        perf-stat.ps.task-clock
 2.282e+11           +83.0%  4.175e+11        perf-stat.total.instructions


***************************************************************************************************
lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_directories/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-13/performance/1SSD/8K/nfsv4/btrfs/1x/x86_64-rhel-8.3/16d/256fpd/32t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-ivb-2ep2/400M/fsmark

commit: 
  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 8.362e+08          +108.9%  1.747e+09        cpuidle..time
   2413903           +25.3%    3024126        cpuidle..usage
     99.38           +19.6%     118.85        uptime.boot
      4236           +14.7%       4859        uptime.idle
     24.94 ±  2%      +9.5%      27.30        iostat.cpu.iowait
      4.47           -55.7%       1.98 ±  2%  iostat.cpu.system
      2.36            +4.1%       2.46        iostat.cpu.user
      0.27 ±  2%      -0.0        0.25 ±  2%  mpstat.cpu.all.irq%
      0.48 ±  4%      -0.2        0.30        mpstat.cpu.all.soft%
      3.99 ±  3%      -2.5        1.46 ±  4%  mpstat.cpu.all.sys%
     10.39           -26.3%       7.65 ±  2%  mpstat.max_utilization_pct
    774882 ± 12%     -24.8%     582410 ± 19%  numa-numastat.node0.local_node
    808526 ± 12%     -25.3%     604191 ± 17%  numa-numastat.node0.numa_hit
    349212 ± 26%     +54.4%     539297 ± 21%  numa-numastat.node1.local_node
    365300 ± 28%     +55.3%     567307 ± 18%  numa-numastat.node1.numa_hit
    123433           -63.1%      45597        vmstat.io.bo
      5.09 ± 14%     -27.9%       3.67 ± 11%  vmstat.procs.r
    176044           -50.8%      86694        vmstat.system.cs
     52141           -18.2%      42673        vmstat.system.in
  74993100 ±  3%    +108.8%  1.566e+08 ±  5%  fsmark.app_overhead
      3060           -54.0%       1408        fsmark.files_per_sec
     17.10          +115.2%      36.80        fsmark.time.elapsed_time
     17.10          +115.2%      36.80        fsmark.time.elapsed_time.max
     36.67 ±  2%     -48.2%      19.00        fsmark.time.percent_of_cpu_this_job_got
    254561 ±  2%     -24.9%     191102        meminfo.Active
      2679          +314.6%      11108 ± 19%  meminfo.Active(anon)
    251882 ±  2%     -28.5%     179993        meminfo.Active(file)
    148758           +12.9%     167936 ±  2%  meminfo.AnonHugePages
     15112           -23.0%      11635 ±  2%  meminfo.Dirty
     32981           +77.1%      58414 ±  7%  meminfo.Mapped
      3295          +838.4%      30926        meminfo.Shmem
    200691 ± 18%     -48.8%     102702 ± 28%  numa-meminfo.node0.Active
      1010 ± 28%    +159.8%       2626 ± 80%  numa-meminfo.node0.Active(anon)
    199680 ± 18%     -49.9%     100076 ± 30%  numa-meminfo.node0.Active(file)
     11897 ± 19%     -48.2%       6167 ± 30%  numa-meminfo.node0.Dirty
    405731 ± 10%     -26.9%     296744 ± 15%  numa-meminfo.node0.Inactive(file)
      1370 ± 16%    +183.3%       3882 ±101%  numa-meminfo.node0.Shmem
      1668 ± 17%    +409.3%       8495 ± 21%  numa-meminfo.node1.Active(anon)
      1929 ± 11%   +1307.1%      27148 ± 15%  numa-meminfo.node1.Shmem
    252.78 ± 28%    +160.3%     657.99 ± 80%  numa-vmstat.node0.nr_active_anon
     50066 ± 18%     -50.5%      24802 ± 30%  numa-vmstat.node0.nr_active_file
    330634 ± 12%     -37.2%     207678 ± 20%  numa-vmstat.node0.nr_dirtied
      2979 ± 19%     -48.1%       1545 ± 30%  numa-vmstat.node0.nr_dirty
    101630 ± 10%     -27.2%      74010 ± 15%  numa-vmstat.node0.nr_inactive_file
      6210 ± 44%     +65.8%      10299 ± 12%  numa-vmstat.node0.nr_mapped
    342.90 ± 16%    +186.3%     981.88 ±103%  numa-vmstat.node0.nr_shmem
    324012 ± 12%     -36.1%     206943 ± 19%  numa-vmstat.node0.nr_written
    252.78 ± 28%    +160.3%     657.99 ± 80%  numa-vmstat.node0.nr_zone_active_anon
     50066 ± 18%     -50.5%      24802 ± 30%  numa-vmstat.node0.nr_zone_active_file
    101629 ± 10%     -27.2%      74010 ± 15%  numa-vmstat.node0.nr_zone_inactive_file
      2718 ± 17%     -47.0%       1439 ± 27%  numa-vmstat.node0.nr_zone_write_pending
    808122 ± 12%     -25.3%     603704 ± 17%  numa-vmstat.node0.numa_hit
    774479 ± 12%     -24.9%     581923 ± 19%  numa-vmstat.node0.numa_local
    417.60 ± 17%    +309.6%       1710 ± 48%  numa-vmstat.node1.nr_active_anon
    482.47 ± 11%   +1244.3%       6485 ± 16%  numa-vmstat.node1.nr_shmem
    417.60 ± 17%    +309.6%       1710 ± 48%  numa-vmstat.node1.nr_zone_active_anon
    364919 ± 27%     +55.1%     566146 ± 18%  numa-vmstat.node1.numa_hit
    348831 ± 26%     +54.3%     538135 ± 21%  numa-vmstat.node1.numa_local
    669.84          +252.2%       2359 ± 41%  proc-vmstat.nr_active_anon
     63068 ±  2%     -29.2%      44622        proc-vmstat.nr_active_file
    177070            +1.1%     178960        proc-vmstat.nr_anon_pages
    465975           -18.7%     378719        proc-vmstat.nr_dirtied
      3780           -22.5%       2928 ±  2%  proc-vmstat.nr_dirty
   1004574            -2.7%     977058        proc-vmstat.nr_file_pages
    177173            +3.8%     183958        proc-vmstat.nr_inactive_anon
    155978            -9.9%     140569        proc-vmstat.nr_inactive_file
      8469           +77.0%      14989 ±  7%  proc-vmstat.nr_mapped
    825.02          +796.6%       7397 ±  7%  proc-vmstat.nr_shmem
     43851            +2.8%      45074        proc-vmstat.nr_slab_reclaimable
    457971           -17.6%     377565        proc-vmstat.nr_written
    669.84          +252.2%       2359 ± 41%  proc-vmstat.nr_zone_active_anon
     63068 ±  2%     -29.2%      44622        proc-vmstat.nr_zone_active_file
    177173            +3.8%     183958        proc-vmstat.nr_zone_inactive_anon
    155978            -9.9%     140569        proc-vmstat.nr_zone_inactive_file
      3373 ±  5%     -16.1%       2832 ±  4%  proc-vmstat.nr_zone_write_pending
    157270 ±  3%     +57.2%     247258        proc-vmstat.pgfault
   2488450           -26.5%    1829243        proc-vmstat.pgpgout
      7922 ±  4%     +23.0%       9742 ±  2%  proc-vmstat.pgreuse
      1.94 ± 36%      +1.4        3.32 ± 22%  perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin.main
      1.65 ± 14%      +1.7        3.32 ± 22%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin
      0.00            +1.7        1.69 ±  7%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      2.80 ± 35%      +1.7        4.50 ± 18%  perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.run_builtin.main
      2.80 ± 35%      +1.7        4.50 ± 18%  perf-profile.calltrace.cycles-pp.cmd_record.run_builtin.main
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp._Fork
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      1.42 ± 47%      +1.9        3.32 ± 22%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen.record__pushfn
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write.writen.record__pushfn.perf_mmap__push
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.write.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.calltrace.cycles-pp.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record
      1.94 ± 36%      +1.4        3.32 ± 22%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      1.65 ± 14%      +1.7        3.32 ± 22%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +1.7        1.69 ±  7%  perf-profile.children.cycles-pp.dup_mm
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.children.cycles-pp._Fork
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.children.cycles-pp.__do_sys_clone
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.children.cycles-pp.copy_process
      0.27 ±223%      +1.7        1.98 ± 33%  perf-profile.children.cycles-pp.kernel_clone
      1.42 ± 47%      +1.9        3.32 ± 22%  perf-profile.children.cycles-pp.ksys_write
      1.42 ± 47%      +1.9        3.32 ± 22%  perf-profile.children.cycles-pp.vfs_write
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.children.cycles-pp.generic_perform_write
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.children.cycles-pp.record__pushfn
      1.15 ± 72%      +2.2        3.32 ± 22%  perf-profile.children.cycles-pp.shmem_file_write_iter
      1.15 ± 72%      +2.5        3.62 ±  7%  perf-profile.children.cycles-pp.writen
      1.42 ± 47%      +2.5        3.92 ± 17%  perf-profile.children.cycles-pp.write
 1.799e+09           -23.0%  1.386e+09        perf-stat.i.branch-instructions
      5.46            +1.0        6.50        perf-stat.i.branch-miss-rate%
  97222174            -9.3%   88136147        perf-stat.i.branch-misses
      6.96 ±  8%      +2.5        9.49 ±  3%  perf-stat.i.cache-miss-rate%
   9472265 ± 10%     -19.3%    7648380 ±  3%  perf-stat.i.cache-misses
 1.463e+08           -43.9%   82019846        perf-stat.i.cache-references
    199745           -53.6%      92597        perf-stat.i.context-switches
      1.46            -9.4%       1.32        perf-stat.i.cpi
 1.265e+10           -30.4%  8.795e+09        perf-stat.i.cpu-cycles
      1465 ±  9%     -51.9%     705.40 ±  2%  perf-stat.i.cpu-migrations
      1373 ±  9%     -15.7%       1158 ±  3%  perf-stat.i.cycles-between-cache-misses
 8.814e+09           -23.1%   6.78e+09        perf-stat.i.instructions
      0.70            +9.4%       0.76        perf-stat.i.ipc
      4.27           -53.5%       1.98        perf-stat.i.metric.K/sec
      6615 ±  6%     -16.4%       5530        perf-stat.i.minor-faults
      6615 ±  6%     -16.4%       5530        perf-stat.i.page-faults
      5.40            +1.0        6.36        perf-stat.overall.branch-miss-rate%
      6.47 ±  8%      +2.9        9.32 ±  3%  perf-stat.overall.cache-miss-rate%
      1.43            -9.6%       1.30        perf-stat.overall.cpi
      1347 ±  8%     -14.6%       1151 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.70           +10.6%       0.77        perf-stat.overall.ipc
   1.7e+09           -20.7%  1.348e+09        perf-stat.ps.branch-instructions
  91873961            -6.6%   85777312        perf-stat.ps.branch-misses
   8951075 ± 10%     -16.9%    7442424 ±  3%  perf-stat.ps.cache-misses
 1.382e+08           -42.3%   79820635        perf-stat.ps.cache-references
    188782           -52.3%      90114        perf-stat.ps.context-switches
     45375            +3.0%      46719        perf-stat.ps.cpu-clock
 1.195e+10           -28.4%   8.56e+09        perf-stat.ps.cpu-cycles
      1385 ±  9%     -50.5%     686.49 ±  2%  perf-stat.ps.cpu-migrations
 8.328e+09           -20.8%  6.598e+09        perf-stat.ps.instructions
      6239 ±  6%     -13.8%       5375        perf-stat.ps.minor-faults
      6239 ±  6%     -13.8%       5376        perf-stat.ps.page-faults
     45375            +3.0%      46719        perf-stat.ps.task-clock
  1.52e+11           +63.0%  2.477e+11        perf-stat.total.instructions



***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-13/performance/directio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-csl-2sp7/DWSL/fxmark/4

commit: 
  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   2711233           -49.2%    1378365        cpuidle..usage
    113.67 ± 32%     -77.0%      26.17 ± 15%  perf-c2c.HITM.local
     68.36           +32.7%      90.69        iostat.cpu.idle
     16.62           -85.0%       2.49 ±  3%  iostat.cpu.iowait
     14.20 ±  2%     -57.2%       6.08 ±  3%  iostat.cpu.system
     33.33 ±111%     -33.3        0.00        perf-profile.calltrace.cycles-pp.folio_remove_rmap_ptes.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
     41.67 ± 82%     -41.7        0.00        perf-profile.children.cycles-pp.folio_remove_rmap_ptes
     25.00 ±100%     -25.0        0.00        perf-profile.self.cycles-pp.folio_remove_rmap_ptes
   1494783 ±  2%     -68.3%     473712 ±  4%  numa-numastat.node0.local_node
   1516920           -64.6%     537707 ±  5%  numa-numastat.node0.numa_hit
    114515 ± 25%     +38.9%     159043 ± 14%  numa-numastat.node1.local_node
     77985 ± 18%     -53.4%      36364 ± 53%  numa-numastat.node1.other_node
     67.69           +22.9       90.61        mpstat.cpu.all.idle%
     17.08           -14.5        2.56 ±  3%  mpstat.cpu.all.iowait%
      1.46 ±  3%      -0.2        1.23 ±  2%  mpstat.cpu.all.irq%
      0.93 ±  2%      -0.6        0.33 ±  2%  mpstat.cpu.all.soft%
     12.01 ±  2%      -7.5        4.49 ±  5%  mpstat.cpu.all.sys%
   1045438           -85.4%     152557 ±  3%  numa-meminfo.node0.Active
     75557 ± 13%     -71.3%      21669        numa-meminfo.node0.Active(anon)
    969881           -86.5%     130887 ±  3%  numa-meminfo.node0.Active(file)
    869623 ±  4%     -56.8%     375494 ± 16%  numa-meminfo.node0.Inactive
    653865 ±  2%     -71.4%     186796 ±  3%  numa-meminfo.node0.Inactive(file)
     92743 ± 11%     -63.3%      33993 ±  3%  numa-meminfo.node0.Shmem
     68.29           +32.8%      90.72        vmstat.cpu.id
     16.68           -84.7%       2.55 ±  6%  vmstat.cpu.wa
    116067           -85.7%      16600 ±  2%  vmstat.io.bo
   4660813           -29.0%    3309839        vmstat.memory.cache
      0.52 ± 15%     -80.0%       0.10 ± 39%  vmstat.procs.b
      1.58 ±  9%     -21.0%       1.25 ± 10%  vmstat.procs.r
     41812 ±  3%     -73.0%      11271 ±  2%  vmstat.system.cs
     27419           -31.7%      18726        vmstat.system.in
      0.10 ±119%     -56.9%       0.04 ±  5%  perf-stat.i.MPKI
     43412 ±  3%     -74.3%      11165 ±  3%  perf-stat.i.context-switches
      1457 ±  5%     -71.2%     419.29 ±  2%  perf-stat.i.cpu-migrations
    129.81 ± 13%     +15.6%     150.07        perf-stat.i.cycles-between-cache-misses
      0.13 ± 42%     -86.8%       0.02 ±115%  perf-stat.i.major-faults
     61.60 ± 34%     -33.0%      41.27 ±  6%  perf-stat.i.metric.K/sec
     42626 ±  3%     -74.3%      10965 ±  3%  perf-stat.ps.context-switches
      1431 ±  5%     -71.2%     411.72 ±  2%  perf-stat.ps.cpu-migrations
      0.13 ± 42%     -86.7%       0.02 ±114%  perf-stat.ps.major-faults
   1046381           -85.4%     152689 ±  3%  meminfo.Active
     75958 ± 13%     -70.7%      22233        meminfo.Active(anon)
    970423           -86.6%     130455 ±  3%  meminfo.Active(file)
   4602998           -29.7%    3237382        meminfo.Cached
   1062713           -44.5%     590084        meminfo.Inactive
    654829 ±  2%     -71.5%     186936 ±  2%  meminfo.Inactive(file)
   6405282           -22.1%    4991953        meminfo.Memused
    185977           -10.1%     167119        meminfo.SUnreclaim
     94548 ± 11%     -61.3%      36622        meminfo.Shmem
    268307            -9.1%     243941        meminfo.Slab
   6936784           -21.5%    5447420 ±  2%  meminfo.max_used_kB
     75.00 ±  2%     -12.9%      65.33        turbostat.Avg_MHz
      2.86 ±  2%      -0.4        2.50        turbostat.Busy%
    633581           -75.7%     154084 ±  3%  turbostat.C1
      0.62 ±  2%      -0.3        0.36 ±  3%  turbostat.C1%
   1019660           -75.2%     252730 ±  2%  turbostat.C1E
      1.80            -0.6        1.21 ±  2%  turbostat.C1E%
   1946276           -32.6%    1312590        turbostat.IRQ
    191212 ± 15%     -87.9%      23221        turbostat.POLL
      0.03            -0.0        0.00        turbostat.POLL%
     10.25 ±  4%    +295.1%      40.50        turbostat.Pkg%pc2
    117.35           -11.0%     104.45        turbostat.PkgWatt
     18889 ± 13%     -71.3%       5417        numa-vmstat.node0.nr_active_anon
    242499           -86.5%      32724 ±  3%  numa-vmstat.node0.nr_active_file
   1759926           -87.0%     228849 ±  2%  numa-vmstat.node0.nr_dirtied
    163471 ±  2%     -71.4%      46702 ±  3%  numa-vmstat.node0.nr_inactive_file
     23187 ± 11%     -63.3%       8499 ±  3%  numa-vmstat.node0.nr_shmem
   1759571           -87.0%     228761 ±  2%  numa-vmstat.node0.nr_written
     18889 ± 13%     -71.3%       5417        numa-vmstat.node0.nr_zone_active_anon
    242499           -86.5%      32724 ±  3%  numa-vmstat.node0.nr_zone_active_file
    163471 ±  2%     -71.4%      46702 ±  3%  numa-vmstat.node0.nr_zone_inactive_file
   1516890           -64.6%     537657 ±  5%  numa-vmstat.node0.numa_hit
   1494751 ±  2%     -68.3%     473662 ±  4%  numa-vmstat.node0.numa_local
    114346 ± 25%     +38.9%     158813 ± 14%  numa-vmstat.node1.numa_local
     77985 ± 18%     -53.4%      36365 ± 53%  numa-vmstat.node1.numa_other
    115.07           +55.1%     178.53        fxmark.ssd_btrfs_DWSL_4_directio.idle_sec
     59.45           +55.0%      92.14        fxmark.ssd_btrfs_DWSL_4_directio.idle_util
     46.68           -85.2%       6.89 ±  3%  fxmark.ssd_btrfs_DWSL_4_directio.iowait_sec
     24.12           -85.3%       3.56 ±  3%  fxmark.ssd_btrfs_DWSL_4_directio.iowait_util
      3.35           -20.3%       2.67 ±  2%  fxmark.ssd_btrfs_DWSL_4_directio.irq_sec
      1.73           -20.3%       1.38 ±  2%  fxmark.ssd_btrfs_DWSL_4_directio.irq_util
      2.49           -66.1%       0.84        fxmark.ssd_btrfs_DWSL_4_directio.softirq_sec
      1.29           -66.1%       0.44        fxmark.ssd_btrfs_DWSL_4_directio.softirq_util
     25.18 ±  3%     -82.9%       4.32 ± 12%  fxmark.ssd_btrfs_DWSL_4_directio.sys_sec
     13.01 ±  2%     -82.9%       2.23 ± 12%  fxmark.ssd_btrfs_DWSL_4_directio.sys_util
      0.80 ± 10%     -37.2%       0.50 ±  8%  fxmark.ssd_btrfs_DWSL_4_directio.user_sec
      0.41 ± 10%     -37.3%       0.26 ±  8%  fxmark.ssd_btrfs_DWSL_4_directio.user_util
    226633           -75.6%      55335 ±  3%  fxmark.ssd_btrfs_DWSL_4_directio.works
      4532           -75.6%       1106 ±  3%  fxmark.ssd_btrfs_DWSL_4_directio.works/sec
   4143236 ±  5%     -87.7%     508948 ±  4%  fxmark.time.file_system_outputs
      1228 ± 47%     -81.9%     222.17 ± 15%  fxmark.time.involuntary_context_switches
     11.33 ±  4%     -64.7%       4.00        fxmark.time.percent_of_cpu_this_job_got
    269631 ±  7%     -75.9%      64948 ±  3%  fxmark.time.voluntary_context_switches
     18991 ± 13%     -70.9%       5527        proc-vmstat.nr_active_anon
    242399           -86.5%      32827 ±  3%  proc-vmstat.nr_active_file
   1759926           -87.0%     228849 ±  2%  proc-vmstat.nr_dirtied
   1150679           -29.6%     809855        proc-vmstat.nr_file_pages
    163806           -71.3%      47029 ±  3%  proc-vmstat.nr_inactive_file
     23665 ± 11%     -61.4%       9139        proc-vmstat.nr_shmem
     20589            -6.7%      19203        proc-vmstat.nr_slab_reclaimable
     46538           -10.3%      41763        proc-vmstat.nr_slab_unreclaimable
   1759571           -87.0%     228761 ±  2%  proc-vmstat.nr_written
     18991 ± 13%     -70.9%       5527        proc-vmstat.nr_zone_active_anon
    242399           -86.5%      32827 ±  3%  proc-vmstat.nr_zone_active_file
    163806           -71.3%      47029 ±  3%  proc-vmstat.nr_zone_inactive_file
   1711454           -57.1%     735022        proc-vmstat.numa_hit
   1611324           -60.6%     634659        proc-vmstat.numa_local
    583094           -90.6%      54844 ±  2%  proc-vmstat.pgactivate
   1786453           -55.2%     799914        proc-vmstat.pgalloc_normal
   1682791           -57.0%     724247        proc-vmstat.pgfree
   8394850           -85.8%    1195219 ±  2%  proc-vmstat.pgpgout
      0.01 ± 17%    +190.9%       0.02 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ±128%     -99.1%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page
      0.01 ± 13%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.01 ± 49%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
      0.00 ± 18%    +120.7%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.00 ± 14%     +55.0%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      0.00 ± 60%     -94.4%       0.00 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.00 ± 82%    +630.0%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 33%    +266.7%       0.01 ± 22%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      0.00 ± 83%    +238.9%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_tree_read_lock_nested
      0.01 ± 13%    +163.9%       0.02 ± 15%  perf-sched.sch_delay.avg.ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.00 ± 17%    +200.0%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      0.01 ± 10%     +66.7%       0.01 ± 15%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ± 11%     +35.0%       0.01        perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.02 ± 14%     +69.9%       0.03 ±  7%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±  6%     +64.9%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.63 ± 26%     -82.4%       0.29 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.barrier_all_devices.write_all_supers.btrfs_sync_log
      0.00 ±178%    +693.8%       0.02 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs_lookup_csum
      0.04 ± 22%     +51.5%       0.07 ± 13%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_bit.lock_extent
      0.02 ± 31%    +240.8%       0.08 ± 18%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.30 ±169%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page
      0.01 ± 33%    -100.0%       0.00        perf-sched.sch_delay.max.ms.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.01 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
      0.10 ± 51%     -94.4%       0.01 ±129%  perf-sched.sch_delay.max.ms.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
     11.97 ±117%     -93.7%       0.75 ± 43%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      1.07 ± 37%     -64.5%       0.38 ± 75%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      0.01 ± 86%     -96.3%       0.00 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.00 ±104%   +2221.7%       0.09 ± 35%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.05 ± 56%     -84.2%       0.01 ±179%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.start_log_trans
      0.04 ±113%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      0.96 ± 51%     -54.4%       0.44 ± 38%  perf-sched.sch_delay.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      0.01 ± 19%    +113.3%       0.01 ±  4%  perf-sched.total_sch_delay.average.ms
      1.73 ± 12%    +266.3%       6.32 ±  2%  perf-sched.total_wait_and_delay.average.ms
    158630 ± 12%     -72.8%      43138 ±  2%  perf-sched.total_wait_and_delay.count.ms
      1.72 ± 12%    +266.7%       6.31 ±  2%  perf-sched.total_wait_time.average.ms
      3.19          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.27 ±  3%    +445.1%       1.46 ±  3%  perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.06 ±  2%     +18.1%       0.07        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
    171.54 ±  8%    +127.3%     389.88 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.43 ±  3%    +466.1%       2.44 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.06 ± 15%     +77.5%       0.11 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      2.32 ±  4%     +20.8%       2.80        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1.17 ±  4%    +379.8%       5.63 ±  4%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     15.00 ± 47%     -86.7%       2.00 ±125%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     35.83 ± 25%     +67.4%      60.00 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
     17297 ±  7%     -88.0%       2070 ±  2%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
     10087 ±  5%     -84.7%       1539 ±  2%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
     94.33 ± 10%     -58.3%      39.33        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    120.33 ±100%   +1865.5%       2365 ±  2%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs_tree_lock_nested
     20315 ±  5%     -71.5%       5784 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
     10088 ±  5%     -84.7%       1539 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      2141 ±  5%     -28.8%       1524        perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     20219 ±  5%     -78.4%       4371 ±  2%  perf-sched.wait_and_delay.count.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
     41448 ±  5%     -78.1%       9088 ±  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.19          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      1019 ±  4%     +46.3%       1492 ± 31%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     54.34 ± 96%     -84.7%       8.32 ±120%  perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      2.31 ± 36%     -62.1%       0.87 ± 58%  perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      1321 ± 55%     -77.3%     300.07 ± 35%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_tree_read_lock_nested
      2.08 ± 47%     -48.5%       1.07 ± 22%  perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      1437 ± 27%     -31.3%     988.15 ±  5%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.19 ±149%    +615.1%       1.36 ± 73%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs_lookup_csum
      0.04 ±131%  +11801.2%       5.08 ±134%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.add_delayed_ref.btrfs_drop_extents.insert_reserved_file_extent
      0.47 ± 67%    +471.0%       2.66 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_bit.lock_extent
      0.42 ± 20%     -98.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page
     78.12 ±101%    -100.0%       0.00        perf-sched.wait_time.avg.ms.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.05 ± 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
      0.26 ±  3%    +450.9%       1.45 ±  3%  perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.05 ±  2%     +16.5%       0.06        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
     11.37 ±142%     -99.9%       0.01 ±150%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
    171.54 ±  8%    +127.3%     389.87 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.67 ±  9%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      3.35 ± 72%     -85.6%       0.48 ± 39%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs_tree_lock_nested
      0.43 ±  3%    +470.0%       2.43 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.06 ± 15%     +73.6%       0.10 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
      2.31 ±  4%     +20.8%       2.79        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ±174%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_current_trans.start_transaction.btrfs_attach_transaction_barrier.btrfs_sync_file
      0.06 ±  3%     -44.4%       0.03 ± 25%  perf-sched.wait_time.avg.ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      1.17 ±  4%    +381.5%       5.62 ±  4%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.79 ± 24%     -75.6%       0.44 ± 47%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.barrier_all_devices.write_all_supers.btrfs_sync_log
      0.19 ±149%   +1796.9%       3.62 ± 54%  perf-sched.wait_time.max.ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs_lookup_csum
      0.04 ±132%  +22425.6%       9.84 ±139%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.add_delayed_ref.btrfs_drop_extents.insert_reserved_file_extent
      1.04 ± 47%   +4402.5%      46.83 ± 57%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_bit.lock_extent
      0.84 ± 53%     -99.3%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page
    281.64 ± 99%    -100.0%       0.00        perf-sched.wait_time.max.ms.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.06 ± 16%    -100.0%       0.00        perf-sched.wait_time.max.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
      1019 ±  4%     +46.3%       1492 ± 31%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     49.01 ±107%     -83.8%       7.96 ±128%  perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      1.67 ± 64%     -69.6%       0.51 ± 49%  perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
    333.41 ±141%    -100.0%       0.03 ±146%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      2.02 ± 88%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      1321 ± 55%     -77.3%     300.06 ± 35%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_tree_read_lock_nested
    533.71 ± 48%     -71.8%     150.40 ± 48%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs_tree_lock_nested
      1.47 ±  5%     -24.6%       1.11 ±  5%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.14 ± 45%     -43.7%       0.64 ±  9%  perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
    532.05 ± 88%     -99.8%       1.28 ±163%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.07 ±174%    -100.0%       0.00        perf-sched.wait_time.max.ms.wait_current_trans.start_transaction.btrfs_attach_transaction_barrier.btrfs_sync_file
      2.02 ± 17%    +345.2%       9.00 ±129%  perf-sched.wait_time.max.ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      1437 ± 27%     -31.3%     988.14 ±  5%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-13/performance/directio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-csl-2sp7/MWUM/fxmark/4

commit: 
  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 2.176e+09           +11.4%  2.423e+09 ±  3%  cpuidle..time
    132.33 ± 20%     -36.4%      84.17 ± 10%  perf-c2c.HITM.local
    291.11           +31.8%     383.72 ±  5%  uptime.boot
     56.19            +7.6%      60.45        iostat.cpu.idle
     18.23           -27.6%      13.19 ±  6%  iostat.cpu.iowait
     25.05            +3.4%      25.89        iostat.cpu.system
   2507993           -14.9%    2134516        meminfo.Active
   2144083           -18.4%    1750586 ±  2%  meminfo.Active(file)
     77605           -25.4%      57872 ±  5%  meminfo.Dirty
     18.37            -5.1       13.27 ±  6%  mpstat.cpu.all.iowait%
      0.84            -0.1        0.70 ±  4%  mpstat.cpu.all.irq%
      1.16            -0.3        0.90 ±  6%  mpstat.cpu.all.soft%
    297906           -18.3%     243394 ±  5%  vmstat.io.bo
      0.89 ±  3%     -29.8%       0.63 ±  9%  vmstat.procs.b
     47364           -21.4%      37209 ±  5%  vmstat.system.cs
     12792           -18.5%      10428 ±  3%  vmstat.system.in
      2.47 ± 13%     -30.3%       1.72 ± 40%  perf-sched.sch_delay.max.ms.__cond_resched.btrfs_alloc_path.btrfs_async_run_delayed_root.btrfs_work_helper.process_one_work
      1184 ± 25%     +26.6%       1499 ± 31%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.68 ±217%   +6285.5%      43.38 ±121%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.workqueue_set_max_active
      1.34 ±220%   +5568.8%      75.81 ±138%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.workqueue_set_max_active
      1183 ± 25%     +26.6%       1498 ± 31%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.80            -0.2        1.61        turbostat.Busy%
      2952            +3.5%       3055        turbostat.Bzy_MHz
      0.60            -0.1        0.48 ±  6%  turbostat.C1%
      1.98            -0.2        1.80 ±  4%  turbostat.C1E%
   1175575           +13.6%    1335284 ±  5%  turbostat.C6
      6.37            -1.4        5.01 ±  3%  turbostat.C6%
     11.16           -10.5%       9.99        turbostat.CPU%c1
      0.31           +12.8%       0.35        turbostat.IPC
   3186943           +11.3%    3548214 ±  2%  turbostat.IRQ
   2505849           -14.8%    2134079        numa-meminfo.node0.Active
   2142339           -18.3%    1750535 ±  2%  numa-meminfo.node0.Active(file)
     72152 ±  4%     -25.9%      53438 ±  5%  numa-meminfo.node0.Dirty
   5805800 ± 13%     -36.0%    3718257 ± 24%  numa-meminfo.node0.FilePages
   9182123 ±  8%     -20.8%    7276407 ± 12%  numa-meminfo.node0.MemUsed
   2447576 ± 33%     -70.1%     731851 ±123%  numa-meminfo.node0.Unevictable
     15180 ± 80%    +197.2%      45112 ± 40%  numa-meminfo.node1.KReclaimable
      3231 ±172%    +524.0%      20162 ± 58%  numa-meminfo.node1.Mapped
     15180 ± 80%    +197.2%      45112 ± 40%  numa-meminfo.node1.SReclaimable
    444470 ±182%    +386.0%    2160224 ± 41%  numa-meminfo.node1.Unevictable
    535497           -18.3%     437654 ±  2%  numa-vmstat.node0.nr_active_file
  18593647           +11.3%   20701921 ±  2%  numa-vmstat.node0.nr_dirtied
     18026 ±  4%     -25.9%      13355 ±  5%  numa-vmstat.node0.nr_dirty
   1451371 ± 13%     -36.0%     929593 ± 24%  numa-vmstat.node0.nr_file_pages
    611894 ± 33%     -70.1%     182962 ±123%  numa-vmstat.node0.nr_unevictable
  18583823           +11.3%   20690513 ±  2%  numa-vmstat.node0.nr_written
    535497           -18.3%     437654 ±  2%  numa-vmstat.node0.nr_zone_active_file
    611894 ± 33%     -70.1%     182962 ±123%  numa-vmstat.node0.nr_zone_unevictable
     18182 ±  5%     -26.1%      13429 ±  5%  numa-vmstat.node0.nr_zone_write_pending
    807.93 ±172%    +524.4%       5044 ± 58%  numa-vmstat.node1.nr_mapped
      3795 ± 80%    +197.2%      11277 ± 40%  numa-vmstat.node1.nr_slab_reclaimable
    111117 ±182%    +386.0%     540056 ± 41%  numa-vmstat.node1.nr_unevictable
    111117 ±182%    +386.0%     540056 ± 41%  numa-vmstat.node1.nr_zone_unevictable
    107.60           +11.1%     119.54 ±  2%  fxmark.ssd_btrfs_MWUM_4_directio.idle_sec
     54.11           +10.7%      59.91 ±  2%  fxmark.ssd_btrfs_MWUM_4_directio.idle_util
     45.57           -31.6%      31.18 ± 12%  fxmark.ssd_btrfs_MWUM_4_directio.iowait_sec
     22.92           -31.8%      15.63 ± 12%  fxmark.ssd_btrfs_MWUM_4_directio.iowait_util
      1.76           -22.1%       1.37 ±  8%  fxmark.ssd_btrfs_MWUM_4_directio.irq_sec
      0.89           -22.4%       0.69 ±  8%  fxmark.ssd_btrfs_MWUM_4_directio.irq_util
      2.62           -27.4%       1.90 ± 10%  fxmark.ssd_btrfs_MWUM_4_directio.softirq_sec
      1.32           -27.7%       0.95 ± 10%  fxmark.ssd_btrfs_MWUM_4_directio.softirq_util
     40.98           +10.3%      45.20 ±  3%  fxmark.ssd_btrfs_MWUM_4_directio.sys_sec
     20.61            +9.9%      22.65 ±  3%  fxmark.ssd_btrfs_MWUM_4_directio.sys_util
      1373           -45.7%     745.50 ±  9%  fxmark.ssd_btrfs_MWUM_4_directio.works
     27.39           -45.9%      14.82 ±  9%  fxmark.ssd_btrfs_MWUM_4_directio.works/sec
    250.17           +37.0%     342.71 ±  5%  fxmark.time.elapsed_time
    250.17           +37.0%     342.71 ±  5%  fxmark.time.elapsed_time.max
   4153888           -19.1%    3360997        fxmark.time.file_system_outputs
      8.50 ±  5%     -29.4%       6.00        fxmark.time.percent_of_cpu_this_job_got
     59437 ± 10%     +34.9%      80200 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.avg
     77362 ± 12%     +28.6%      99496 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.max
     49777 ± 14%     +41.4%      70377 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.min
     59437 ± 10%     +34.9%      80200 ±  8%  sched_debug.cfs_rq:/.min_vruntime.avg
     77362 ± 12%     +28.6%      99496 ±  9%  sched_debug.cfs_rq:/.min_vruntime.max
     49777 ± 14%     +41.4%      70377 ± 10%  sched_debug.cfs_rq:/.min_vruntime.min
     70.10 ± 28%     +69.8%     119.03 ± 24%  sched_debug.cfs_rq:/.util_est.avg
    387.03 ± 19%     +36.5%     528.40 ± 18%  sched_debug.cfs_rq:/.util_est.max
    111.66 ± 27%     +63.4%     182.43 ± 23%  sched_debug.cfs_rq:/.util_est.stddev
    159901           +21.8%     194738 ±  5%  sched_debug.cpu.clock.avg
    159904           +21.8%     194739 ±  5%  sched_debug.cpu.clock.max
    159899           +21.8%     194736 ±  5%  sched_debug.cpu.clock.min
    156754           +22.0%     191297 ±  5%  sched_debug.cpu.clock_task.avg
    159016           +21.8%     193608 ±  5%  sched_debug.cpu.clock_task.max
    151859           +23.0%     186807 ±  5%  sched_debug.cpu.clock_task.min
    571773 ±  2%      -9.3%     518561 ±  3%  sched_debug.cpu.max_idle_balance_cost.max
      8586 ± 10%     -76.2%       2040 ± 87%  sched_debug.cpu.max_idle_balance_cost.stddev
      1547 ±  7%     +39.1%       2152 ± 12%  sched_debug.cpu.nr_uninterruptible.max
     -3680           +35.1%      -4971        sched_debug.cpu.nr_uninterruptible.min
      2008 ± 13%     +44.5%       2902 ± 13%  sched_debug.cpu.nr_uninterruptible.stddev
    159901           +21.8%     194737 ±  5%  sched_debug.cpu_clk
    159291           +21.9%     194110 ±  5%  sched_debug.ktime
    160432           +21.7%     195278 ±  5%  sched_debug.sched_clk
     90977            +5.5%      95982        proc-vmstat.nr_active_anon
    535809           -18.3%     437696 ±  2%  proc-vmstat.nr_active_file
     80075            -3.3%      77402        proc-vmstat.nr_anon_pages
  18810399 ±  2%     +11.4%   20960968 ±  2%  proc-vmstat.nr_dirtied
     19409           -25.5%      14469 ±  5%  proc-vmstat.nr_dirty
   1570377            -6.0%    1476623        proc-vmstat.nr_file_pages
     82770            -3.8%      79660        proc-vmstat.nr_inactive_anon
     18954            -1.0%      18765        proc-vmstat.nr_kernel_stack
      9590            -2.2%       9375        proc-vmstat.nr_mapped
     95937            +4.8%     100509        proc-vmstat.nr_shmem
  18800573 ±  2%     +11.4%   20949542 ±  2%  proc-vmstat.nr_written
     90977            +5.5%      95982        proc-vmstat.nr_zone_active_anon
    535809           -18.3%     437696 ±  2%  proc-vmstat.nr_zone_active_file
     82770            -3.8%      79660        proc-vmstat.nr_zone_inactive_anon
     19688 ±  2%     -25.3%      14712 ±  5%  proc-vmstat.nr_zone_write_pending
      7670 ± 50%     +96.4%      15061 ± 26%  proc-vmstat.numa_hint_faults
      3803 ± 88%    +157.4%       9788 ± 21%  proc-vmstat.numa_hint_faults_local
  10950682 ±  2%      +6.6%   11668450 ±  2%  proc-vmstat.numa_hit
  10849707 ±  2%      +6.6%   11566304 ±  2%  proc-vmstat.numa_local
   1356796           +32.4%    1796173        proc-vmstat.pgactivate
  11864099            +5.9%   12565956 ±  2%  proc-vmstat.pgalloc_normal
    791491           +24.6%     986144 ±  4%  proc-vmstat.pgfault
  11653607            +6.8%   12444134 ±  2%  proc-vmstat.pgfree
  75424328 ±  2%     +11.4%   84002300 ±  2%  proc-vmstat.pgpgout
     42955           +22.0%      52397 ±  3%  proc-vmstat.pgreuse
  40751111 ±  2%     -28.4%   29162586 ±  8%  perf-stat.i.branch-instructions
      0.16 ±  3%      -0.0        0.12 ±  5%  perf-stat.i.branch-miss-rate%
   1966173 ±  3%     -28.9%    1398795 ±  8%  perf-stat.i.branch-misses
      0.56 ±  5%      -0.1        0.41 ±  5%  perf-stat.i.cache-miss-rate%
    338469 ±  4%     -26.6%     248405 ±  6%  perf-stat.i.cache-misses
   1788163 ±  4%     -26.4%    1315825 ±  7%  perf-stat.i.cache-references
     47778           -21.6%      37457 ±  5%  perf-stat.i.context-switches
      0.04           -25.2%       0.03 ±  8%  perf-stat.i.cpi
      8075           -13.9%       6951 ±  2%  perf-stat.i.cpu-clock
 2.255e+08           -28.1%  1.622e+08 ±  7%  perf-stat.i.cpu-cycles
      2754           -11.1%       2447 ±  7%  perf-stat.i.cpu-migrations
     45.89 ±  3%     -31.3%      31.53 ±  7%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  4%      -0.0        0.00 ± 13%  perf-stat.i.dTLB-load-miss-rate%
     62240 ±  7%     -26.9%      45496 ±  9%  perf-stat.i.dTLB-load-misses
  44048882 ±  2%     -28.0%   31716199 ±  8%  perf-stat.i.dTLB-loads
      0.00 ±  4%      -0.0        0.00 ± 13%  perf-stat.i.dTLB-store-miss-rate%
      7368 ±  7%     -27.7%       5326 ±  9%  perf-stat.i.dTLB-store-misses
  15972047 ±  2%     -27.8%   11527820 ±  8%  perf-stat.i.dTLB-stores
      1.71            -0.4        1.27 ±  6%  perf-stat.i.iTLB-load-miss-rate%
     22267           -24.7%      16768 ±  6%  perf-stat.i.iTLB-load-misses
     19977 ±  4%     -27.0%      14589 ±  5%  perf-stat.i.iTLB-loads
 2.026e+08 ±  2%     -28.4%  1.451e+08 ±  9%  perf-stat.i.instructions
    286.78 ±  3%     -30.7%     198.87 ±  8%  perf-stat.i.instructions-per-iTLB-miss
      0.03 ±  3%     -27.5%       0.02 ±  6%  perf-stat.i.ipc
      0.18 ± 43%     +96.5%       0.35 ± 31%  perf-stat.i.major-faults
      0.00           -28.0%       0.00 ±  7%  perf-stat.i.metric.GHz
     31.38 ±  4%     -24.9%      23.56 ±  6%  perf-stat.i.metric.K/sec
      1.04 ±  2%     -28.1%       0.75 ±  8%  perf-stat.i.metric.M/sec
      2330            -3.1%       2257        perf-stat.i.minor-faults
      1.87 ± 15%      -0.6        1.24 ± 15%  perf-stat.i.node-load-miss-rate%
     32809 ±  8%     -24.0%      24936 ± 12%  perf-stat.i.node-loads
      1.60 ±  8%      -0.4        1.17 ± 15%  perf-stat.i.node-store-miss-rate%
     42947 ±  3%     -26.9%      31405 ±  6%  perf-stat.i.node-stores
      2330            -3.1%       2258        perf-stat.i.page-faults
      8075           -13.9%       6951 ±  2%  perf-stat.i.task-clock
  41085549 ±  2%     -28.6%   29351633 ±  9%  perf-stat.ps.branch-instructions
   1980226 ±  3%     -28.9%    1407007 ±  8%  perf-stat.ps.branch-misses
    341317 ±  4%     -26.7%     250339 ±  6%  perf-stat.ps.cache-misses
   1802785 ±  4%     -26.5%    1324804 ±  7%  perf-stat.ps.cache-references
     47554           -21.5%      37337 ±  5%  perf-stat.ps.context-switches
      8089           -14.0%       6956 ±  2%  perf-stat.ps.cpu-clock
 2.274e+08           -28.2%  1.633e+08 ±  7%  perf-stat.ps.cpu-cycles
      2740           -11.0%       2438 ±  7%  perf-stat.ps.cpu-migrations
     62712 ±  7%     -27.0%      45790 ±  9%  perf-stat.ps.dTLB-load-misses
  44441011 ±  2%     -28.1%   31931957 ±  8%  perf-stat.ps.dTLB-loads
      7430 ±  6%     -27.8%       5362 ±  9%  perf-stat.ps.dTLB-store-misses
  16118579 ±  2%     -28.0%   11611258 ±  8%  perf-stat.ps.dTLB-stores
     22459 ±  2%     -24.8%      16880 ±  6%  perf-stat.ps.iTLB-load-misses
     20158 ±  5%     -27.1%      14693 ±  5%  perf-stat.ps.iTLB-loads
 2.042e+08 ±  2%     -28.5%  1.461e+08 ±  9%  perf-stat.ps.instructions
      0.18 ± 43%     +96.8%       0.35 ± 31%  perf-stat.ps.major-faults
      2321            -3.0%       2251        perf-stat.ps.minor-faults
     32976 ±  8%     -23.8%      25135 ± 12%  perf-stat.ps.node-loads
     43093 ±  3%     -26.7%      31604 ±  5%  perf-stat.ps.node-stores
      2321            -3.0%       2252        perf-stat.ps.page-faults
      8089           -14.0%       6956 ±  2%  perf-stat.ps.task-clock
     29.41 ±  2%     -16.0       13.44 ± 45%  perf-profile.calltrace.cycles-pp.loop_process_work.process_one_work.worker_thread.kthread.ret_from_fork
     19.06 ±  3%     -11.3        7.73 ± 45%  perf-profile.calltrace.cycles-pp.btrfs_sync_file.loop_process_work.process_one_work.worker_thread.kthread
     24.03 ±  3%     -10.6       13.47 ±  6%  perf-profile.calltrace.cycles-pp.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marked_extents
     23.72 ±  3%     -10.5       13.24 ±  6%  perf-profile.calltrace.cycles-pp.submit_eb_page.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
     22.11 ±  3%      -9.7       12.38 ±  6%  perf-profile.calltrace.cycles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page.btree_write_cache_pages.do_writepages
     22.11 ±  3%      -9.7       12.38 ±  6%  perf-profile.calltrace.cycles-pp.btrfs_submit_bio.submit_eb_page.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wbc
     21.55 ±  3%      -9.5       12.08 ±  6%  perf-profile.calltrace.cycles-pp.btree_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page.btree_write_cache_pages
     20.06 ±  3%      -8.9       11.16 ±  4%  perf-profile.calltrace.cycles-pp.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page
     19.94 ±  3%      -8.8       11.09 ±  5%  perf-profile.calltrace.cycles-pp.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio
     19.56 ±  4%      -7.0       12.60 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space.process_one_work
     19.18 ±  4%      -6.9       12.32 ±  7%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_space
     19.32 ±  4%      -6.9       12.46 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
     19.16 ±  4%      -6.8       12.32 ±  7%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrfs_commit_transaction
     19.13 ±  4%      -6.8       12.30 ±  7%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_write_and_wait_transaction
     12.86 ±  4%      -5.9        6.99 ±  4%  perf-profile.calltrace.cycles-pp.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk
     13.52 ±  7%      -5.0        8.56 ±  8%  perf-profile.calltrace.cycles-pp.common_startup_64
     10.90 ± 12%      -4.7        6.19 ± 12%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     10.90 ± 12%      -4.7        6.20 ± 12%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     10.89 ± 12%      -4.7        6.19 ± 12%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     10.15 ±  3%      -4.6        5.60 ± 45%  perf-profile.calltrace.cycles-pp.lo_write_simple.loop_process_work.process_one_work.worker_thread.kthread
      9.98 ±  3%      -4.5        5.52 ± 45%  perf-profile.calltrace.cycles-pp.vfs_iter_write.lo_write_simple.loop_process_work.process_one_work.worker_thread
      9.86 ±  3%      -4.4        5.46 ± 44%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.vfs_iter_write.lo_write_simple.loop_process_work.process_one_work
      9.79 ±  3%      -4.4        5.43 ± 44%  perf-profile.calltrace.cycles-pp.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write.lo_write_simple.loop_process_work
      9.70 ±  3%      -4.3        5.36 ± 44%  perf-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write.lo_write_simple
      9.84 ± 12%      -4.2        5.62 ± 13%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      5.35 ±  4%      -4.2        1.17 ± 45%  perf-profile.calltrace.cycles-pp.btrfs_sync_log.btrfs_sync_file.loop_process_work.process_one_work.worker_thread
     11.34 ±  8%      -4.2        7.19 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      9.33 ± 12%      -4.0        5.36 ± 13%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      4.93 ±  4%      -3.9        1.00 ± 44%  perf-profile.calltrace.cycles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.loop_process_work.process_one_work
      4.92 ±  4%      -3.9        1.00 ± 44%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.loop_process_work
     12.68 ±  5%      -3.7        8.94 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_work_helper.process_one_work.worker_thread.kthread.ret_from_fork
      4.92 ±  4%      -3.7        1.18 ±  4%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file
      4.91 ±  3%      -3.7        1.18 ±  4%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_sync_log
     12.65 ±  5%      -3.7        8.92 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_finish_one_ordered.btrfs_work_helper.process_one_work.worker_thread.kthread
      7.36 ±  4%      -3.6        3.74 ± 46%  perf-profile.calltrace.cycles-pp.start_ordered_ops.btrfs_sync_file.loop_process_work.process_one_work.worker_thread
      6.28 ±  5%      -3.6        2.66 ± 45%  perf-profile.calltrace.cycles-pp.btrfs_log_dentry_safe.btrfs_sync_file.loop_process_work.process_one_work.worker_thread
      6.27 ±  5%      -3.6        2.66 ± 45%  perf-profile.calltrace.cycles-pp.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_file.loop_process_work.process_one_work
      6.27 ±  5%      -3.6        2.66 ± 45%  perf-profile.calltrace.cycles-pp.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_file.loop_process_work
      7.27 ±  4%      -3.5        3.72 ± 46%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.loop_process_work.process_one_work
      7.27 ±  4%      -3.5        3.72 ± 46%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.loop_process_work
      8.76 ±  4%      -3.3        5.44 ±  4%  perf-profile.calltrace.cycles-pp.check_extent_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio
      8.24 ±  4%      -3.3        4.92 ± 14%  perf-profile.calltrace.cycles-pp.extent_write_cache_pages.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      7.38 ±  4%      -3.1        4.27 ± 17%  perf-profile.calltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc
      7.27 ±  4%      -3.0        4.26 ± 15%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file
      7.26 ±  4%      -3.0        4.26 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops
      6.00 ±  4%      -3.0        3.04 ±  6%  perf-profile.calltrace.cycles-pp.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_file
      5.81 ±  5%      -2.9        2.89 ±  6%  perf-profile.calltrace.cycles-pp.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_safe
      4.50 ±  9%      -2.7        1.82 ± 11%  perf-profile.calltrace.cycles-pp.alloc_reserved_tree_block.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
      4.30 ± 10%      -2.7        1.65 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_insert_empty_items.alloc_reserved_tree_block.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs
      6.97 ±  6%      -2.6        4.39 ±  8%  perf-profile.calltrace.cycles-pp.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space.process_one_work
      2.75 ± 10%      -2.3        0.41 ± 71%  perf-profile.calltrace.cycles-pp.btrfs_search_slot.btrfs_insert_empty_items.alloc_reserved_tree_block.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head
      8.18 ±  7%      -2.0        6.14 ±  9%  perf-profile.calltrace.cycles-pp.insert_reserved_file_extent.btrfs_finish_one_ordered.btrfs_work_helper.process_one_work.worker_thread
      2.48 ±  7%      -2.0        0.49 ± 45%  perf-profile.calltrace.cycles-pp.check_extent_data_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio
      4.26 ±  9%      -1.9        2.37 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space.process_one_work
      4.24 ±  9%      -1.9        2.36 ± 10%  perf-profile.calltrace.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
      4.10 ±  9%      -1.8        2.29 ± 11%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space
      3.72 ±  7%      -1.7        2.00 ±  8%  perf-profile.calltrace.cycles-pp.btrfs_get_32.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk
      2.54 ±  6%      -1.7        0.84 ± 53%  perf-profile.calltrace.cycles-pp.btrfs_cow_block.btrfs_search_slot.lookup_inline_extent_backref.lookup_extent_backref.__btrfs_free_extent
      2.54 ±  6%      -1.7        0.84 ± 53%  perf-profile.calltrace.cycles-pp.btrfs_force_cow_block.btrfs_cow_block.btrfs_search_slot.lookup_inline_extent_backref.lookup_extent_backref
      7.29 ±  4%      -1.7        5.60 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_drop_extents.insert_reserved_file_extent.btrfs_finish_one_ordered.btrfs_work_helper.process_one_work
      3.75 ±  7%      -1.6        2.12 ± 28%  perf-profile.calltrace.cycles-pp.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.btrfs_writepages.do_writepages
      3.30 ±  5%      -1.6        1.74 ±  4%  perf-profile.calltrace.cycles-pp.btrfs_drop_extents.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_parent
      3.61 ±  5%      -1.4        2.21 ±  3%  perf-profile.calltrace.cycles-pp.btrfs_get_64.check_extent_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf
      3.09 ± 11%      -1.4        1.74 ± 28%  perf-profile.calltrace.cycles-pp.lookup_extent_backref.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
      3.08 ± 11%      -1.4        1.73 ± 28%  perf-profile.calltrace.cycles-pp.lookup_inline_extent_backref.lookup_extent_backref.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs
      2.91 ±  6%      -1.3        1.60 ± 30%  perf-profile.calltrace.cycles-pp.btrfs_search_slot.lookup_inline_extent_backref.lookup_extent_backref.__btrfs_free_extent.btrfs_run_delayed_refs_for_head
      2.40 ± 11%      -1.3        1.09 ±  9%  perf-profile.calltrace.cycles-pp.log_extent_csums.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_parent
      1.83 ± 17%      -1.3        0.53 ± 73%  perf-profile.calltrace.cycles-pp.asm_common_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.82 ± 18%      -1.3        0.53 ± 73%  perf-profile.calltrace.cycles-pp.common_interrupt.asm_common_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      3.32 ± 10%      -1.3        2.07 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups.btrfs_commit_transaction
      2.45 ±  6%      -1.2        1.20 ± 11%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.worker_thread
      3.43 ± 10%      -1.2        2.19 ± 10%  perf-profile.calltrace.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space
      2.44 ±  6%      -1.2        1.20 ± 11%  perf-profile.calltrace.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_metadata_space.process_one_work
      3.43 ± 10%      -1.2        2.19 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
      1.57 ± 30%      -1.2        0.34 ±100%  perf-profile.calltrace.cycles-pp.blk_complete_reqs.handle_softirqs.irq_exit_rcu.common_interrupt.asm_common_interrupt
      2.38 ±  5%      -1.2        1.16 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_metadata_space
      1.53 ± 30%      -1.2        0.33 ±100%  perf-profile.calltrace.cycles-pp.scsi_end_request.scsi_io_completion.blk_complete_reqs.handle_softirqs.irq_exit_rcu
      1.53 ± 30%      -1.2        0.33 ±100%  perf-profile.calltrace.cycles-pp.scsi_io_completion.blk_complete_reqs.handle_softirqs.irq_exit_rcu.common_interrupt
      2.85 ±  2%      -1.2        1.68 ±  8%  perf-profile.calltrace.cycles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_pages.btrfs_writepages.do_writepages
      1.41 ± 30%      -1.1        0.31 ±100%  perf-profile.calltrace.cycles-pp.blk_update_request.scsi_end_request.scsi_io_completion.blk_complete_reqs.handle_softirqs
      2.54 ±  8%      -1.0        1.52 ± 35%  perf-profile.calltrace.cycles-pp.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.btrfs_writepages
      2.30 ±  2%      -1.0        1.30 ±  8%  perf-profile.calltrace.cycles-pp.cow_file_range.btrfs_run_delalloc_range.writepage_delalloc.__extent_writepage.extent_write_cache_pages
      2.31 ±  2%      -1.0        1.31 ±  8%  perf-profile.calltrace.cycles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_writepage.extent_write_cache_pages.btrfs_writepages
      2.24 ±  9%      -1.0        1.25 ± 49%  perf-profile.calltrace.cycles-pp.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages
      2.23 ±  9%      -1.0        1.25 ± 49%  perf-profile.calltrace.cycles-pp.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage
      2.23 ±  9%      -1.0        1.25 ± 49%  perf-profile.calltrace.cycles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io
      1.86 ±  9%      -1.0        0.90 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_csum_file_blocks.log_csums.log_extent_csums.log_one_extent.btrfs_log_changed_extents
      1.88 ±  9%      -1.0        0.91 ±  9%  perf-profile.calltrace.cycles-pp.log_csums.log_extent_csums.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode
      1.96 ± 11%      -1.0        1.00 ±  9%  perf-profile.calltrace.cycles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction
      1.28 ± 18%      -0.9        0.34 ±100%  perf-profile.calltrace.cycles-pp.handle_softirqs.irq_exit_rcu.common_interrupt.asm_common_interrupt.cpuidle_enter_state
      1.28 ± 18%      -0.9        0.34 ±100%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.common_interrupt.asm_common_interrupt.cpuidle_enter_state.cpuidle_enter
      5.08 ±  7%      -0.9        4.16 ± 12%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.09 ±  4%      -0.9        1.18 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_csum_file_blocks.btrfs_finish_one_ordered.btrfs_work_helper.process_one_work.worker_thread
      1.49 ± 12%      -0.9        0.58 ± 47%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.43 ±  5%      -0.9        1.54 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_get_32.check_extent_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf
      1.26 ± 17%      -0.9        0.38 ± 71%  perf-profile.calltrace.cycles-pp.btrfs_create_common.lookup_open.open_last_lookups.path_openat.do_filp_open
      1.52 ± 19%      -0.9        0.66 ± 21%  perf-profile.calltrace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.06 ± 12%      -0.9        1.21 ± 12%  perf-profile.calltrace.cycles-pp.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction
      1.39 ± 15%      -0.8        0.55 ± 47%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      3.06 ±  7%      -0.8        2.24 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write
      3.04 ±  7%      -0.8        2.23 ±  9%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev
      1.35 ± 14%      -0.7        0.62 ± 12%  perf-profile.calltrace.cycles-pp.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups
      2.15 ±  7%      -0.7        1.44 ±  6%  perf-profile.calltrace.cycles-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write
      2.09 ± 11%      -0.7        1.39 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_write_out_cache.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
      2.06 ± 10%      -0.7        1.37 ±  6%  perf-profile.calltrace.cycles-pp.__btrfs_write_out_cache.btrfs_write_out_cache.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space
      1.75 ±  8%      -0.7        1.08 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_del_items.btrfs_drop_extents.insert_reserved_file_extent.btrfs_finish_one_ordered.btrfs_work_helper
      1.84 ±  7%      -0.6        1.23 ± 11%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.10 ± 31%      -0.6        0.49 ± 47%  perf-profile.calltrace.cycles-pp.setup_items_for_insert.btrfs_insert_empty_items.alloc_reserved_tree_block.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head
      2.08 ± 16%      -0.6        1.49 ± 11%  perf-profile.calltrace.cycles-pp.open64
      2.06 ± 16%      -0.6        1.48 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.06 ± 16%      -0.6        1.48 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      2.04 ± 15%      -0.6        1.47 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.03 ± 15%      -0.6        1.47 ± 11%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.01 ± 16%      -0.6        1.45 ± 11%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.01 ± 16%      -0.6        1.45 ± 11%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      1.22 ±  7%      -0.5        0.67 ± 10%  perf-profile.calltrace.cycles-pp.btrfs_del_items.btrfs_drop_extents.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode
      1.95 ± 16%      -0.5        1.41 ± 12%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.87 ± 17%      -0.5        1.34 ±  8%  perf-profile.calltrace.cycles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups
      1.63 ± 10%      -0.5        1.10 ± 11%  perf-profile.calltrace.cycles-pp.blk_complete_reqs.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      0.92 ± 10%      -0.5        0.39 ± 71%  perf-profile.calltrace.cycles-pp.cache_save_setup.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
      0.81 ±  9%      -0.5        0.28 ±100%  perf-profile.calltrace.cycles-pp.btrfs_comp_cpu_keys.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk
      1.66 ± 10%      -0.5        1.13 ± 11%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.66 ± 10%      -0.5        1.14 ± 11%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.54 ±  9%      -0.5        1.05 ± 12%  perf-profile.calltrace.cycles-pp.blk_mq_end_request.blk_complete_reqs.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      1.49 ± 11%      -0.5        1.00 ± 12%  perf-profile.calltrace.cycles-pp.blk_update_request.blk_mq_end_request.blk_complete_reqs.handle_softirqs.run_ksoftirqd
      1.10 ± 15%      -0.4        0.66 ± 14%  perf-profile.calltrace.cycles-pp.write_one_eb.submit_eb_page.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wbc
      1.06 ± 10%      -0.4        0.62 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write
      1.24 ± 10%      -0.4        0.84 ±  9%  perf-profile.calltrace.cycles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space
      0.67 ± 12%      -0.4        0.28 ±100%  perf-profile.calltrace.cycles-pp.btrfs_set_extent_delalloc.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev
      1.14 ± 13%      -0.4        0.75 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_setup_item_for_insert.btrfs_drop_extents.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode
      1.13 ± 13%      -0.4        0.75 ±  9%  perf-profile.calltrace.cycles-pp.setup_items_for_insert.btrfs_setup_item_for_insert.btrfs_drop_extents.log_one_extent.btrfs_log_changed_extents
      0.86 ± 24%      -0.4        0.48 ± 46%  perf-profile.calltrace.cycles-pp.btrfs_get_8.check_extent_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf
      1.00 ±  9%      -0.3        0.68 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_fdatawrite_range.__btrfs_write_out_cache.btrfs_write_out_cache.btrfs_start_dirty_block_groups.btrfs_commit_transaction
      1.00 ±  9%      -0.3        0.68 ± 21%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.btrfs_fdatawrite_range.__btrfs_write_out_cache.btrfs_write_out_cache.btrfs_start_dirty_block_groups
      0.98 ± 10%      -0.3        0.67 ± 21%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_fdatawrite_range.__btrfs_write_out_cache
      0.98 ± 11%      -0.3        0.67 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_fdatawrite_range
      0.00            +0.9        0.87 ± 12%  perf-profile.calltrace.cycles-pp.btrfs_search_slot.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
      0.00            +1.4        1.43 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_truncate_item.truncate_one_csum.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delayed_refs
      0.00            +1.5        1.48 ±  6%  perf-profile.calltrace.cycles-pp.truncate_one_csum.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
     79.39            +1.9       81.32        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.2        3.16 ±  5%  perf-profile.calltrace.cycles-pp.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction
      0.00            +3.8        3.77 ±  6%  perf-profile.calltrace.cycles-pp.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction.transaction_kthread
      0.00            +4.3        4.32 ±  7%  perf-profile.calltrace.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction.transaction_kthread.kthread
      0.00            +4.3        4.32 ±  7%  perf-profile.calltrace.cycles-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.transaction_kthread.kthread.ret_from_fork
      0.00            +5.2        5.22 ±  8%  perf-profile.calltrace.cycles-pp.btrfs_commit_transaction.transaction_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +5.2        5.22 ±  8%  perf-profile.calltrace.cycles-pp.transaction_kthread.kthread.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     36.06 ±  3%     +19.8       55.84 ±  3%  perf-profile.calltrace.cycles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker_thread.kthread.ret_from_fork
     36.05 ±  3%     +19.8       55.84 ±  3%  perf-profile.calltrace.cycles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.worker_thread.kthread
     33.17 ±  3%     +21.3       54.45 ±  3%  perf-profile.calltrace.cycles-pp.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.worker_thread
      0.09 ±223%     +30.0       30.06 ±  9%  perf-profile.calltrace.cycles-pp._find_next_zero_bit.steal_from_bitmap.__btrfs_add_free_space.unpin_extent_range.btrfs_finish_extent_commit
      0.82 ± 22%     +33.0       33.84 ±  9%  perf-profile.calltrace.cycles-pp.btrfs_finish_extent_commit.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space.process_one_work
      0.52 ± 74%     +33.2       33.74 ±  9%  perf-profile.calltrace.cycles-pp.unpin_extent_range.btrfs_finish_extent_commit.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
      0.37 ±100%     +33.3       33.66 ±  9%  perf-profile.calltrace.cycles-pp.__btrfs_add_free_space.unpin_extent_range.btrfs_finish_extent_commit.btrfs_commit_transaction.flush_space
      0.29 ±100%     +33.8       34.11 ±  9%  perf-profile.calltrace.cycles-pp.steal_from_bitmap.__btrfs_add_free_space.unpin_extent_range.btrfs_finish_extent_commit.btrfs_commit_transaction
     29.41 ±  2%     -16.0       13.44 ± 45%  perf-profile.children.cycles-pp.loop_process_work
     32.80 ±  2%     -13.9       18.92 ±  8%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
     32.77 ±  2%     -13.9       18.91 ±  8%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
     32.72 ±  2%     -13.8       18.87 ±  8%  perf-profile.children.cycles-pp.do_writepages
     24.60 ±  2%     -10.7       13.89 ±  9%  perf-profile.children.cycles-pp.btrfs_submit_chunk
     24.60 ±  2%     -10.7       13.90 ±  9%  perf-profile.children.cycles-pp.btrfs_submit_bio
     24.25 ±  3%     -10.6       13.68 ±  6%  perf-profile.children.cycles-pp.btrfs_write_marked_extents
     24.03 ±  3%     -10.5       13.50 ±  6%  perf-profile.children.cycles-pp.btree_write_cache_pages
     23.73 ±  3%     -10.5       13.27 ±  6%  perf-profile.children.cycles-pp.submit_eb_page
     19.06 ±  3%     -10.0        9.08 ±  8%  perf-profile.children.cycles-pp.btrfs_sync_file
     21.55 ±  3%      -9.4       12.11 ±  6%  perf-profile.children.cycles-pp.btree_csum_one_bio
     20.06 ±  3%      -8.9       11.19 ±  4%  perf-profile.children.cycles-pp.__btrfs_check_leaf
     20.06 ±  3%      -8.9       11.19 ±  4%  perf-profile.children.cycles-pp.btrfs_check_leaf
     19.56 ±  4%      -6.9       12.63 ±  7%  perf-profile.children.cycles-pp.btrfs_write_and_wait_transaction
     12.97 ±  4%      -5.9        7.07 ±  4%  perf-profile.children.cycles-pp.check_leaf_item
     14.34 ±  4%      -5.3        9.08 ±  4%  perf-profile.children.cycles-pp.btrfs_search_slot
     13.52 ±  7%      -5.0        8.56 ±  8%  perf-profile.children.cycles-pp.common_startup_64
     13.52 ±  7%      -5.0        8.56 ±  8%  perf-profile.children.cycles-pp.cpu_startup_entry
     13.51 ±  7%      -5.0        8.56 ±  8%  perf-profile.children.cycles-pp.do_idle
      8.41 ±  5%      -4.8        3.58 ± 10%  perf-profile.children.cycles-pp.btrfs_cow_block
      8.40 ±  5%      -4.8        3.58 ± 10%  perf-profile.children.cycles-pp.btrfs_force_cow_block
     10.90 ± 12%      -4.7        6.20 ± 12%  perf-profile.children.cycles-pp.start_secondary
     10.15 ±  3%      -4.6        5.60 ± 45%  perf-profile.children.cycles-pp.lo_write_simple
     12.09 ±  7%      -4.4        7.65 ± 10%  perf-profile.children.cycles-pp.cpuidle_idle_call
     11.44 ±  8%      -4.2        7.27 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter
     11.42 ±  8%      -4.2        7.26 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter_state
      9.96 ±  7%      -4.1        5.88 ±  9%  perf-profile.children.cycles-pp.btrfs_run_delayed_refs_for_head
      5.35 ±  4%      -4.0        1.40 ±  5%  perf-profile.children.cycles-pp.btrfs_sync_log
     12.68 ±  5%      -3.7        8.94 ±  7%  perf-profile.children.cycles-pp.btrfs_work_helper
     12.65 ±  5%      -3.7        8.92 ±  7%  perf-profile.children.cycles-pp.btrfs_finish_one_ordered
      5.14 ±  6%      -3.5        1.65 ±  9%  perf-profile.children.cycles-pp.btrfs_alloc_tree_block
      9.08 ±  5%      -3.4        5.67 ±  4%  perf-profile.children.cycles-pp.check_extent_item
      9.99 ±  3%      -3.3        6.66 ±  4%  perf-profile.children.cycles-pp.vfs_iter_write
      8.67 ±  4%      -3.3        5.36 ± 13%  perf-profile.children.cycles-pp.extent_write_cache_pages
      8.67 ±  4%      -3.3        5.36 ± 13%  perf-profile.children.cycles-pp.btrfs_writepages
      7.59 ±  4%      -3.3        4.28 ±  6%  perf-profile.children.cycles-pp.btrfs_get_32
      9.86 ±  3%      -3.3        6.59 ±  4%  perf-profile.children.cycles-pp.do_iter_readv_writev
     10.64 ±  4%      -3.2        7.39 ±  6%  perf-profile.children.cycles-pp.btrfs_drop_extents
      9.72 ±  3%      -3.2        6.48 ±  4%  perf-profile.children.cycles-pp.btrfs_buffered_write
      9.79 ±  3%      -3.2        6.56 ±  4%  perf-profile.children.cycles-pp.btrfs_do_write_iter
      6.28 ±  5%      -3.1        3.18 ±  5%  perf-profile.children.cycles-pp.btrfs_log_dentry_safe
      6.27 ±  5%      -3.1        3.18 ±  5%  perf-profile.children.cycles-pp.btrfs_log_inode_parent
      6.27 ±  5%      -3.1        3.18 ±  5%  perf-profile.children.cycles-pp.btrfs_log_inode
      7.36 ±  4%      -3.1        4.29 ± 15%  perf-profile.children.cycles-pp.start_ordered_ops
      6.05 ±  9%      -3.0        3.03 ± 10%  perf-profile.children.cycles-pp.btrfs_insert_empty_items
      3.69 ±  7%      -3.0        0.68 ± 17%  perf-profile.children.cycles-pp.btrfs_reserve_extent
      7.74 ±  4%      -3.0        4.78 ± 14%  perf-profile.children.cycles-pp.__extent_writepage
      6.00 ±  4%      -3.0        3.04 ±  6%  perf-profile.children.cycles-pp.btrfs_log_changed_extents
      3.57 ±  7%      -2.9        0.62 ± 13%  perf-profile.children.cycles-pp.find_free_extent
      5.81 ±  5%      -2.9        2.89 ±  6%  perf-profile.children.cycles-pp.log_one_extent
      6.97 ±  6%      -2.5        4.46 ±  8%  perf-profile.children.cycles-pp.btrfs_start_dirty_block_groups
      5.24 ±  5%      -2.5        2.75 ±  4%  perf-profile.children.cycles-pp.btrfs_get_64
      4.58 ±  9%      -2.5        2.12 ±  9%  perf-profile.children.cycles-pp.alloc_reserved_tree_block
      4.58 ±  9%      -2.5        2.13 ±  9%  perf-profile.children.cycles-pp.run_delayed_tree_ref
      8.27 ±  7%      -2.1        6.20 ±  9%  perf-profile.children.cycles-pp.insert_reserved_file_extent
      2.53 ±  7%      -1.9        0.59 ± 10%  perf-profile.children.cycles-pp.check_extent_data_item
      4.20 ± 14%      -1.9        2.26 ± 13%  perf-profile.children.cycles-pp.handle_softirqs
      3.00 ± 21%      -1.9        1.12 ± 30%  perf-profile.children.cycles-pp.asm_common_interrupt
      3.96 ±  4%      -1.9        2.08 ± 11%  perf-profile.children.cycles-pp.btrfs_csum_file_blocks
      2.99 ± 21%      -1.9        1.12 ± 30%  perf-profile.children.cycles-pp.common_interrupt
      5.13 ±  9%      -1.7        3.43 ±  8%  perf-profile.children.cycles-pp.__btrfs_free_extent
      3.66 ± 11%      -1.7        1.98 ± 14%  perf-profile.children.cycles-pp.blk_complete_reqs
      4.22 ±  7%      -1.6        2.62 ± 23%  perf-profile.children.cycles-pp.__extent_writepage_io
      3.34 ± 13%      -1.5        1.82 ± 15%  perf-profile.children.cycles-pp.blk_update_request
      3.94 ±  7%      -1.5        2.46 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock
      2.57 ± 21%      -1.4        1.14 ± 22%  perf-profile.children.cycles-pp.irq_exit_rcu
      4.62 ±  4%      -1.4        3.22 ±  9%  perf-profile.children.cycles-pp.setup_items_for_insert
      2.40 ± 11%      -1.3        1.09 ±  9%  perf-profile.children.cycles-pp.log_extent_csums
      3.38            -1.3        2.08 ±  7%  perf-profile.children.cycles-pp.writepage_delalloc
      4.58 ±  6%      -1.2        3.34 ±  5%  perf-profile.children.cycles-pp.btrfs_del_items
      3.12 ± 11%      -1.2        1.90 ± 11%  perf-profile.children.cycles-pp.lookup_extent_backref
      3.12 ± 11%      -1.2        1.90 ± 11%  perf-profile.children.cycles-pp.lookup_inline_extent_backref
      2.88 ±  6%      -1.1        1.77 ± 29%  perf-profile.children.cycles-pp.submit_extent_page
      2.62 ±  2%      -1.1        1.52 ±  8%  perf-profile.children.cycles-pp.btrfs_run_delalloc_range
      2.00 ± 12%      -1.1        0.91 ± 16%  perf-profile.children.cycles-pp.intel_idle_irq
      1.85 ± 20%      -1.1        0.78 ± 31%  perf-profile.children.cycles-pp.scsi_end_request
      1.85 ± 20%      -1.1        0.78 ± 31%  perf-profile.children.cycles-pp.scsi_io_completion
      1.70 ± 11%      -1.0        0.69 ±  9%  perf-profile.children.cycles-pp.btrfs_lookup_csum
      2.30 ±  3%      -1.0        1.30 ±  8%  perf-profile.children.cycles-pp.cow_file_range
      2.50 ±  7%      -1.0        1.50 ± 32%  perf-profile.children.cycles-pp.submit_one_bio
      2.58 ± 10%      -1.0        1.61 ± 11%  perf-profile.children.cycles-pp.memcpy_orig
      1.88 ±  9%      -1.0        0.91 ±  9%  perf-profile.children.cycles-pp.log_csums
      5.10 ±  7%      -0.9        4.18 ± 11%  perf-profile.children.cycles-pp.poll_idle
      2.06 ±  8%      -0.9        1.17 ± 10%  perf-profile.children.cycles-pp.btrfs_init_new_buffer
      2.60 ±  4%      -0.9        1.73 ± 47%  perf-profile.children.cycles-pp.crc_pcl
      1.79 ±  7%      -0.9        0.93 ± 18%  perf-profile.children.cycles-pp.intel_idle
      1.90 ± 19%      -0.9        1.04 ± 23%  perf-profile.children.cycles-pp.__btrfs_bio_end_io
      3.49 ±  6%      -0.8        2.66 ± 11%  perf-profile.children.cycles-pp.btrfs_get_token_32
      2.80 ±  9%      -0.8        1.97 ± 14%  perf-profile.children.cycles-pp.btrfs_setup_item_for_insert
      3.06 ±  7%      -0.8        2.24 ± 10%  perf-profile.children.cycles-pp.btrfs_copy_from_user
      3.32 ± 10%      -0.8        2.50 ±  6%  perf-profile.children.cycles-pp.do_syscall_64
      3.32 ± 10%      -0.8        2.50 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.90 ± 13%      -0.8        1.08 ± 14%  perf-profile.children.cycles-pp.folio_end_writeback
      3.05 ±  6%      -0.8        2.24 ± 10%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      1.74 ± 18%      -0.8        0.94 ± 23%  perf-profile.children.cycles-pp.end_bbio_data_write
      2.41 ±  7%      -0.8        1.62 ±  5%  perf-profile.children.cycles-pp.btrfs_dirty_pages
      1.50 ± 12%      -0.8        0.73 ±  8%  perf-profile.children.cycles-pp.btrfs_get_8
      1.39 ± 15%      -0.8        0.63 ± 18%  perf-profile.children.cycles-pp.lookup_open
      1.26 ± 17%      -0.7        0.52 ± 18%  perf-profile.children.cycles-pp.btrfs_create_common
      1.66 ±  9%      -0.7        0.93 ±  7%  perf-profile.children.cycles-pp.alloc_extent_buffer
      2.14 ±  7%      -0.7        1.42 ±  8%  perf-profile.children.cycles-pp.__clear_extent_bit
      1.88 ± 11%      -0.7        1.16 ± 12%  perf-profile.children.cycles-pp.copy_extent_buffer_full
      3.03 ±  7%      -0.7        2.32 ±  8%  perf-profile.children.cycles-pp.btrfs_write_out_cache
      0.87 ±  7%      -0.7        0.16 ± 24%  perf-profile.children.cycles-pp.btrfs_find_space_for_alloc
      3.02 ±  6%      -0.7        2.32 ±  8%  perf-profile.children.cycles-pp.__btrfs_write_out_cache
      1.31 ±  7%      -0.7        0.61 ± 28%  perf-profile.children.cycles-pp.btrfs_extend_item
      1.78 ±  6%      -0.7        1.08 ± 10%  perf-profile.children.cycles-pp.add_delayed_ref
      1.16 ± 20%      -0.7        0.46 ± 17%  perf-profile.children.cycles-pp.btrfs_create_new_inode
      1.45 ±  8%      -0.7        0.76 ± 16%  perf-profile.children.cycles-pp.write_one_eb
      1.48 ± 11%      -0.7        0.82 ± 18%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.98 ± 22%      -0.7        0.33 ± 36%  perf-profile.children.cycles-pp.__common_interrupt
      0.98 ± 22%      -0.7        0.33 ± 36%  perf-profile.children.cycles-pp.handle_edge_irq
      0.98 ± 22%      -0.6        0.33 ± 36%  perf-profile.children.cycles-pp.handle_irq_event
      0.94 ± 22%      -0.6        0.31 ± 37%  perf-profile.children.cycles-pp.__handle_irq_event_percpu
      0.93 ± 22%      -0.6        0.31 ± 38%  perf-profile.children.cycles-pp.ahci_single_level_irq_intr
      1.84 ±  7%      -0.6        1.23 ± 11%  perf-profile.children.cycles-pp.smpboot_thread_fn
      2.15 ± 15%      -0.6        1.56 ± 10%  perf-profile.children.cycles-pp.__x64_sys_openat
      2.08 ± 16%      -0.6        1.49 ± 11%  perf-profile.children.cycles-pp.open64
      1.25 ± 14%      -0.6        0.66 ± 12%  perf-profile.children.cycles-pp.submit_bio_noacct_nocheck
      2.14 ± 15%      -0.6        1.56 ± 10%  perf-profile.children.cycles-pp.do_sys_openat2
      1.13 ± 13%      -0.6        0.56 ± 12%  perf-profile.children.cycles-pp.__folio_start_writeback
      1.21 ± 15%      -0.6        0.64 ± 11%  perf-profile.children.cycles-pp.__submit_bio
      1.67 ± 12%      -0.6        1.10 ±  8%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      2.10 ± 16%      -0.6        1.54 ± 10%  perf-profile.children.cycles-pp.do_filp_open
      2.10 ± 16%      -0.6        1.54 ± 10%  perf-profile.children.cycles-pp.path_openat
      2.12 ±  9%      -0.6        1.55 ±  2%  perf-profile.children.cycles-pp.__set_extent_bit
      1.12 ±  9%      -0.6        0.56 ±  7%  perf-profile.children.cycles-pp.attach_eb_folio_to_filemap
      1.23 ±  5%      -0.6        0.67 ± 12%  perf-profile.children.cycles-pp.btrfs_comp_cpu_keys
      1.71 ±  8%      -0.6        1.16 ± 12%  perf-profile.children.cycles-pp.blk_mq_end_request
      1.06 ± 17%      -0.6        0.50 ± 15%  perf-profile.children.cycles-pp.blk_mq_submit_bio
      1.26 ±  9%      -0.6        0.71 ± 12%  perf-profile.children.cycles-pp.filemap_dirty_folio
      1.96 ± 16%      -0.5        1.43 ± 12%  perf-profile.children.cycles-pp.open_last_lookups
      1.66 ± 10%      -0.5        1.14 ± 11%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.99 ±  9%      -0.5        0.48 ± 13%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      1.08 ±  9%      -0.5        0.57 ± 13%  perf-profile.children.cycles-pp.end_bbio_meta_write
      0.77 ± 27%      -0.5        0.29 ± 24%  perf-profile.children.cycles-pp.insert_with_overflow
      0.79 ± 25%      -0.5        0.32 ± 23%  perf-profile.children.cycles-pp.btrfs_add_link
      0.78 ± 26%      -0.5        0.31 ± 22%  perf-profile.children.cycles-pp.btrfs_insert_dir_item
      1.42 ±  4%      -0.5        0.96 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.69 ± 26%      -0.4        0.25 ± 36%  perf-profile.children.cycles-pp.ahci_handle_port_intr
      0.94 ±  7%      -0.4        0.50 ± 20%  perf-profile.children.cycles-pp.__folio_mark_dirty
      1.06 ± 10%      -0.4        0.62 ± 15%  perf-profile.children.cycles-pp.btrfs_delalloc_reserve_metadata
      1.31 ±  9%      -0.4        0.87 ± 46%  perf-profile.children.cycles-pp.crc32c_pcl_intel_update
      1.70 ±  6%      -0.4        1.27 ±  7%  perf-profile.children.cycles-pp.__schedule
      0.73 ± 21%      -0.4        0.30 ± 24%  perf-profile.children.cycles-pp.btrfs_finish_ordered_extent
      1.00 ±  9%      -0.4        0.58 ± 15%  perf-profile.children.cycles-pp.cache_save_setup
      1.06 ±  8%      -0.4        0.64 ±  9%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.69 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.irq_work_run_list
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp._printk
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.irq_work_run
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.irq_work_single
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.vprintk_emit
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.console_flush_all
      0.68 ± 35%      -0.4        0.28 ± 71%  perf-profile.children.cycles-pp.console_unlock
      0.67 ± 35%      -0.4        0.27 ± 71%  perf-profile.children.cycles-pp.serial8250_console_write
      0.93 ± 13%      -0.4        0.53 ± 14%  perf-profile.children.cycles-pp.add_delayed_ref_head
      0.51 ± 20%      -0.4        0.11 ± 36%  perf-profile.children.cycles-pp.find_free_space
      1.21 ±  8%      -0.4        0.81 ± 13%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.86 ± 31%      -0.4        0.46 ±  8%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.92 ±  3%      -0.4        0.52 ± 12%  perf-profile.children.cycles-pp.set_extent_buffer_dirty
      0.88 ± 10%      -0.4        0.48 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.36 ±  2%      -0.4        0.96 ±  9%  perf-profile.children.cycles-pp.schedule
      0.65 ± 36%      -0.4        0.26 ± 71%  perf-profile.children.cycles-pp.wait_for_lsr
      1.24 ± 14%      -0.4        0.85 ±  8%  perf-profile.children.cycles-pp.btrfs_bin_search
      1.26 ± 11%      -0.4        0.88 ± 12%  perf-profile.children.cycles-pp.__lookup_extent_mapping
      0.50 ± 36%      -0.4        0.12 ± 42%  perf-profile.children.cycles-pp.btrfs_lookup_csums_list
      1.99 ±  8%      -0.4        1.62 ± 10%  perf-profile.children.cycles-pp.__memmove
      0.87 ± 12%      -0.4        0.51 ±  9%  perf-profile.children.cycles-pp.__reserve_bytes
      1.06 ±  5%      -0.4        0.70 ±  9%  perf-profile.children.cycles-pp.lock_extent
      0.80 ± 15%      -0.4        0.45 ± 11%  perf-profile.children.cycles-pp.btrfs_set_range_writeback
      0.85 ± 22%      -0.4        0.50 ±  8%  perf-profile.children.cycles-pp.alloc_extent_state
      1.42 ±  8%      -0.3        1.08 ± 11%  perf-profile.children.cycles-pp.kmem_cache_free
      0.76 ±  8%      -0.3        0.43 ±  8%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.70 ± 10%      -0.3        0.38 ± 12%  perf-profile.children.cycles-pp.down_read
      0.71 ± 10%      -0.3        0.39 ±  9%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.53 ± 18%      -0.3        0.21 ± 29%  perf-profile.children.cycles-pp.queue_work_on
      1.44 ±  7%      -0.3        1.13 ± 13%  perf-profile.children.cycles-pp.btrfs_fdatawrite_range
      0.94 ± 12%      -0.3        0.64 ± 45%  perf-profile.children.cycles-pp.csum_tree_block
      0.97 ±  7%      -0.3        0.66 ± 14%  perf-profile.children.cycles-pp.clear_state_bit
      0.74 ± 12%      -0.3        0.44 ± 12%  perf-profile.children.cycles-pp.btrfs_reserve_metadata_bytes
      0.78 ±  7%      -0.3        0.48 ± 10%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.70 ± 12%      -0.3        0.42 ±  6%  perf-profile.children.cycles-pp.filemap_add_folio
      0.54 ±  5%      -0.3        0.26 ± 21%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.67 ±  8%      -0.3        0.40 ± 22%  perf-profile.children.cycles-pp.filemap_get_entry
      0.47 ± 17%      -0.3        0.20 ± 22%  perf-profile.children.cycles-pp.__blk_mq_sched_dispatch_requests
      0.47 ± 17%      -0.3        0.20 ± 22%  perf-profile.children.cycles-pp.blk_mq_sched_dispatch_requests
      0.80 ± 13%      -0.3        0.53 ±  9%  perf-profile.children.cycles-pp.pagecache_get_page
      0.96 ± 16%      -0.3        0.69 ± 12%  perf-profile.children.cycles-pp.btrfs_get_extent
      0.73 ± 13%      -0.3        0.46 ± 18%  perf-profile.children.cycles-pp.xas_load
      0.67 ±  9%      -0.3        0.40 ± 16%  perf-profile.children.cycles-pp.btrfs_truncate_free_space_cache
      0.56 ± 10%      -0.3        0.29 ± 21%  perf-profile.children.cycles-pp.update_block_group_item
      0.98 ±  5%      -0.3        0.72 ±  9%  perf-profile.children.cycles-pp.read_extent_buffer
      0.51 ±  7%      -0.3        0.25 ± 23%  perf-profile.children.cycles-pp.__btrfs_check_node
      0.51 ±  7%      -0.3        0.25 ± 23%  perf-profile.children.cycles-pp.btrfs_check_node
      0.46 ± 23%      -0.3        0.21 ± 23%  perf-profile.children.cycles-pp.__queue_work
      0.53 ± 11%      -0.2        0.29 ± 18%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.42 ± 18%      -0.2        0.18 ± 28%  perf-profile.children.cycles-pp.__blk_mq_do_dispatch_sched
      0.52 ± 11%      -0.2        0.28 ± 17%  perf-profile.children.cycles-pp.__cond_resched
      1.16 ± 14%      -0.2        0.93 ±  9%  perf-profile.children.cycles-pp.read_block_for_search
      0.40 ± 19%      -0.2        0.17 ± 31%  perf-profile.children.cycles-pp.__btrfs_run_delayed_items
      0.68 ±  9%      -0.2        0.46 ± 13%  perf-profile.children.cycles-pp.lock_and_cleanup_extent_if_need
      0.93 ± 16%      -0.2        0.70 ± 13%  perf-profile.children.cycles-pp.find_extent_buffer
      0.49 ±  8%      -0.2        0.27 ± 18%  perf-profile.children.cycles-pp.btrfs_write_check
      0.55 ± 15%      -0.2        0.34 ± 16%  perf-profile.children.cycles-pp.blk_mq_flush_plug_list
      0.44 ± 17%      -0.2        0.24 ± 15%  perf-profile.children.cycles-pp.calc_available_free_space
      0.74 ± 19%      -0.2        0.53 ± 17%  perf-profile.children.cycles-pp.find_extent_buffer_nolock
      0.35 ±  8%      -0.2        0.14 ± 24%  perf-profile.children.cycles-pp.up_read
      0.26 ± 32%      -0.2        0.06 ± 84%  perf-profile.children.cycles-pp.blk_mq_run_work_fn
      0.36 ± 16%      -0.2        0.16 ± 26%  perf-profile.children.cycles-pp.blk_mq_dispatch_rq_list
      0.43 ± 13%      -0.2        0.23 ± 17%  perf-profile.children.cycles-pp.__blk_flush_plug
      0.50 ± 12%      -0.2        0.30 ± 15%  perf-profile.children.cycles-pp.menu_select
      1.08 ± 17%      -0.2        0.88 ±  9%  perf-profile.children.cycles-pp.set_extent_bit
      0.32 ±  6%      -0.2        0.13 ± 15%  perf-profile.children.cycles-pp.btrfs_reduce_alloc_profile
      0.72 ±  9%      -0.2        0.53 ±  9%  perf-profile.children.cycles-pp.find_lock_delalloc_range
      0.53 ±  9%      -0.2        0.34 ± 18%  perf-profile.children.cycles-pp.truncate_pagecache
      0.52 ±  9%      -0.2        0.34 ± 18%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.69 ± 13%      -0.2        0.50 ± 11%  perf-profile.children.cycles-pp.btrfs_set_extent_delalloc
      0.28 ± 12%      -0.2        0.10 ± 60%  perf-profile.children.cycles-pp.__rq_qos_throttle
      0.33 ± 16%      -0.2        0.15 ± 33%  perf-profile.children.cycles-pp.scsi_queue_rq
      0.36 ± 19%      -0.2        0.18 ± 22%  perf-profile.children.cycles-pp.__btrfs_wait_marked_extents
      0.47 ±  9%      -0.2        0.29 ± 21%  perf-profile.children.cycles-pp.btrfs_replace_extent_map_range
      0.56 ±  4%      -0.2        0.38 ± 15%  perf-profile.children.cycles-pp.check_dir_item
      0.54 ± 12%      -0.2        0.37 ± 31%  perf-profile.children.cycles-pp.btrfs_alloc_reserved_file_extent
      0.33 ± 19%      -0.2        0.16 ± 17%  perf-profile.children.cycles-pp.insert_state
      0.27 ± 12%      -0.2        0.10 ± 60%  perf-profile.children.cycles-pp.wbt_wait
      0.23 ± 16%      -0.2        0.06 ± 76%  perf-profile.children.cycles-pp.ahci_handle_port_interrupt
      0.32 ± 11%      -0.2        0.15 ± 14%  perf-profile.children.cycles-pp.io_schedule
      0.23 ± 16%      -0.2        0.06 ± 76%  perf-profile.children.cycles-pp.sata_async_notification
      0.22 ± 19%      -0.2        0.06 ± 76%  perf-profile.children.cycles-pp.ahci_scr_read
      0.33 ± 10%      -0.2        0.16 ± 18%  perf-profile.children.cycles-pp.file_remove_privs_flags
      0.28 ± 42%      -0.2        0.12 ± 26%  perf-profile.children.cycles-pp.ahci_qc_complete
      0.57 ±  7%      -0.2        0.41 ± 22%  perf-profile.children.cycles-pp.__slab_free
      0.26 ± 22%      -0.2        0.10 ± 20%  perf-profile.children.cycles-pp.btrfs_put_block_group
      0.36 ±  9%      -0.2        0.20 ± 20%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.28 ± 19%      -0.2        0.12 ± 17%  perf-profile.children.cycles-pp.btrfs_lookup_inode
      0.30 ± 13%      -0.2        0.14 ± 20%  perf-profile.children.cycles-pp.security_inode_need_killpriv
      0.26 ± 20%      -0.2        0.10 ± 32%  perf-profile.children.cycles-pp.btrfs_insert_delayed_item
      0.36 ± 12%      -0.2        0.21 ± 13%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.46 ± 16%      -0.2        0.31 ± 23%  perf-profile.children.cycles-pp.prepare_pages
      0.23 ± 21%      -0.1        0.08 ± 61%  perf-profile.children.cycles-pp.rq_qos_wait
      0.27 ±  9%      -0.1        0.13 ± 19%  perf-profile.children.cycles-pp.cap_inode_need_killpriv
      0.42 ± 12%      -0.1        0.28 ± 11%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.31 ± 22%      -0.1        0.17 ± 26%  perf-profile.children.cycles-pp.blk_mq_dispatch_plug_list
      0.34 ± 24%      -0.1        0.20 ± 19%  perf-profile.children.cycles-pp.btrfs_leaf_free_space
      0.23 ± 29%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.xas_clear_mark
      0.35 ± 16%      -0.1        0.22 ± 28%  perf-profile.children.cycles-pp.btrfs_drop_extent_map_range
      0.24 ± 26%      -0.1        0.11 ±  7%  perf-profile.children.cycles-pp.__wake_up
      0.26 ± 11%      -0.1        0.13 ± 20%  perf-profile.children.cycles-pp.__vfs_getxattr
      0.16 ± 27%      -0.1        0.03 ±101%  perf-profile.children.cycles-pp.btrfs_wait_tree_log_extents
      0.34 ± 15%      -0.1        0.21 ± 25%  perf-profile.children.cycles-pp.btrfs_invalidate_folio
      0.32 ± 24%      -0.1        0.19 ± 17%  perf-profile.children.cycles-pp.need_preemptive_reclaim
      0.35 ± 15%      -0.1        0.22 ± 25%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.26 ± 26%      -0.1        0.14 ± 31%  perf-profile.children.cycles-pp.rcu_core
      0.40 ± 19%      -0.1        0.28 ± 22%  perf-profile.children.cycles-pp.free_extent_state
      0.26 ± 28%      -0.1        0.13 ± 16%  perf-profile.children.cycles-pp.btrfs_can_overcommit
      0.39 ± 13%      -0.1        0.27 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.16 ± 48%      -0.1        0.04 ±110%  perf-profile.children.cycles-pp.__irqentry_text_start
      0.30 ± 12%      -0.1        0.19 ± 19%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.23 ± 31%      -0.1        0.11 ± 27%  perf-profile.children.cycles-pp.btrfs_calculate_inode_block_rsv_size
      0.22 ± 74%      -0.1        0.10 ± 21%  perf-profile.children.cycles-pp.push_leaf_right
      0.28 ± 14%      -0.1        0.16 ± 19%  perf-profile.children.cycles-pp.__xa_clear_mark
      0.31 ± 18%      -0.1        0.20 ± 15%  perf-profile.children.cycles-pp.btrfs_update_inode_item
      0.32 ± 15%      -0.1        0.20 ± 23%  perf-profile.children.cycles-pp.btrfs_update_block_group
      0.33 ± 12%      -0.1        0.22 ± 22%  perf-profile.children.cycles-pp.unpin_extent_cache
      0.34 ± 12%      -0.1        0.23 ± 21%  perf-profile.children.cycles-pp.io_ctl_prepare_pages
      0.34 ± 13%      -0.1        0.24 ± 12%  perf-profile.children.cycles-pp.activate_task
      0.22 ± 26%      -0.1        0.12 ± 32%  perf-profile.children.cycles-pp.btrfs_map_block
      0.16 ± 33%      -0.1        0.06 ± 78%  perf-profile.children.cycles-pp.blk_finish_plug
      0.29 ± 14%      -0.1        0.19 ± 11%  perf-profile.children.cycles-pp.enqueue_entity
      0.24 ± 16%      -0.1        0.14 ± 48%  perf-profile.children.cycles-pp.loop_queue_rq
      0.31 ±  8%      -0.1        0.22 ± 20%  perf-profile.children.cycles-pp.run_delalloc_nocow
      0.13 ± 36%      -0.1        0.04 ±105%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.14 ± 27%      -0.1        0.05 ± 46%  perf-profile.children.cycles-pp.mod_zone_page_state
      0.19 ± 20%      -0.1        0.10 ± 47%  perf-profile.children.cycles-pp.btrfs_delalloc_release_extents
      0.17 ± 23%      -0.1        0.08 ± 51%  perf-profile.children.cycles-pp.__switch_to
      0.20 ± 19%      -0.1        0.11 ± 25%  perf-profile.children.cycles-pp.__btrfs_prealloc_file_range
      0.28 ± 23%      -0.1        0.19 ± 20%  perf-profile.children.cycles-pp.btrfs_block_rsv_release
      0.12 ± 26%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.btrfs_update_root
      0.13 ± 10%      -0.1        0.04 ±111%  perf-profile.children.cycles-pp.strcmp
      0.14 ± 22%      -0.1        0.05 ± 55%  perf-profile.children.cycles-pp.btrfs_get_chunk_map
      0.18 ± 18%      -0.1        0.10 ± 32%  perf-profile.children.cycles-pp.prepare_task_switch
      0.13 ± 19%      -0.1        0.05 ± 75%  perf-profile.children.cycles-pp.scsi_dispatch_cmd
      0.19 ± 17%      -0.1        0.11 ± 48%  perf-profile.children.cycles-pp.loop_queue_work
      0.31 ± 16%      -0.1        0.23 ± 16%  perf-profile.children.cycles-pp.lock_delalloc_pages
      0.19 ± 19%      -0.1        0.11 ± 23%  perf-profile.children.cycles-pp.extent_clear_unlock_delalloc
      0.14 ± 25%      -0.1        0.06 ± 52%  perf-profile.children.cycles-pp.___perf_sw_event
      0.24 ± 17%      -0.1        0.16 ± 20%  perf-profile.children.cycles-pp.blk_mq_plug_issue_direct
      0.23 ± 16%      -0.1        0.16 ± 19%  perf-profile.children.cycles-pp.__blk_mq_issue_directly
      0.19 ± 29%      -0.1        0.12 ± 25%  perf-profile.children.cycles-pp.rcu_do_batch
      0.12 ± 20%      -0.1        0.04 ± 75%  perf-profile.children.cycles-pp.ata_scsi_queuecmd
      0.22 ±  5%      -0.1        0.14 ± 23%  perf-profile.children.cycles-pp.__process_pages_contig
      0.12 ± 41%      -0.1        0.04 ± 77%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.24 ± 16%      -0.1        0.16 ± 17%  perf-profile.children.cycles-pp.__switch_to_asm
      0.14 ± 14%      -0.1        0.07 ± 54%  perf-profile.children.cycles-pp.btrfs_xattr_handler_get_security
      0.10 ± 27%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.__ata_scsi_queuecmd
      0.28 ± 18%      -0.1        0.21 ± 18%  perf-profile.children.cycles-pp.folios_put_refs
      0.11 ± 20%      -0.1        0.04 ± 77%  perf-profile.children.cycles-pp.__kmalloc_noprof
      0.09 ± 19%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.sbitmap_find_bit
      0.24 ± 11%      -0.1        0.18 ± 13%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.23 ± 10%      -0.1        0.17 ± 13%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.09 ± 14%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.__blk_mq_end_request
      0.15 ± 28%      -0.1        0.08 ± 22%  perf-profile.children.cycles-pp.__btrfs_qgroup_release_data
      0.10 ± 29%      -0.1        0.04 ±106%  perf-profile.children.cycles-pp.folio_mapping
      0.13 ± 20%      -0.1        0.07 ± 62%  perf-profile.children.cycles-pp.btrfs_wait_ordered_range
      0.14 ± 18%      -0.1        0.08 ± 21%  perf-profile.children.cycles-pp.btrfs_reserve_data_bytes
      0.10 ± 10%      -0.1        0.05 ± 77%  perf-profile.children.cycles-pp.__memcpy
      0.18 ± 19%      -0.1        0.12 ± 29%  perf-profile.children.cycles-pp.alloc_ordered_extent
      0.16 ± 13%      -0.1        0.11 ± 20%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.22 ± 13%      -0.0        0.18 ± 12%  perf-profile.children.cycles-pp.vfs_read
      0.10 ± 22%      -0.0        0.07 ± 18%  perf-profile.children.cycles-pp.put_cpu_partial
      0.00            +0.1        0.08 ± 34%  perf-profile.children.cycles-pp.btrfs_set_item_key_safe
      0.00            +0.1        0.10 ± 36%  perf-profile.children.cycles-pp.btrfs_alloc_from_cluster
      0.14 ± 29%      +0.1        0.27 ± 13%  perf-profile.children.cycles-pp.memcpy_extent_buffer
      0.03 ±100%      +0.1        0.16 ± 43%  perf-profile.children.cycles-pp.run_delayed_data_ref
      0.02 ±141%      +0.1        0.16 ± 42%  perf-profile.children.cycles-pp.alloc_reserved_file_extent
      0.01 ±223%      +0.1        0.16 ± 23%  perf-profile.children.cycles-pp.find_free_extent_clustered
      0.02 ±149%      +0.2        0.18 ± 26%  perf-profile.children.cycles-pp.btrfs_select_ref_head
      0.08 ± 75%      +0.2        0.32 ± 18%  perf-profile.children.cycles-pp.pin_down_extent
      0.18 ± 40%      +0.7        0.87 ± 10%  perf-profile.children.cycles-pp.memmove_extent_buffer
      0.44 ± 23%      +0.8        1.26 ±  6%  perf-profile.children.cycles-pp.__write_extent_buffer
      0.00            +1.5        1.52 ±  7%  perf-profile.children.cycles-pp.btrfs_truncate_item
      0.00            +1.5        1.54 ±  7%  perf-profile.children.cycles-pp.truncate_one_csum
     79.40            +1.9       81.32        perf-profile.children.cycles-pp.process_one_work
      0.10 ± 11%      +3.2        3.32 ±  6%  perf-profile.children.cycles-pp.btrfs_del_csums
      0.17 ± 26%      +3.8        3.93 ±  7%  perf-profile.children.cycles-pp.cleanup_ref_head
      0.00            +5.2        5.22 ±  8%  perf-profile.children.cycles-pp.transaction_kthread
     82.15            +6.1       88.22        perf-profile.children.cycles-pp.kthread
     82.16            +6.1       88.22        perf-profile.children.cycles-pp.ret_from_fork
     82.16            +6.1       88.22        perf-profile.children.cycles-pp.ret_from_fork_asm
     36.06 ±  3%     +19.8       55.84 ±  3%  perf-profile.children.cycles-pp.btrfs_async_reclaim_metadata_space
     36.05 ±  3%     +19.8       55.84 ±  3%  perf-profile.children.cycles-pp.flush_space
     33.17 ±  3%     +26.5       59.67 ±  3%  perf-profile.children.cycles-pp.btrfs_commit_transaction
      0.41 ± 36%     +29.8       30.19 ±  9%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.82 ± 22%     +33.8       34.61 ±  9%  perf-profile.children.cycles-pp.btrfs_finish_extent_commit
      0.66 ± 30%     +33.8       34.48 ±  9%  perf-profile.children.cycles-pp.unpin_extent_range
      0.39 ± 49%     +33.8       34.23 ±  9%  perf-profile.children.cycles-pp.steal_from_bitmap
      0.56 ± 31%     +33.8       34.41 ±  9%  perf-profile.children.cycles-pp.__btrfs_add_free_space
      7.28 ±  3%      -3.1        4.16 ±  6%  perf-profile.self.cycles-pp.btrfs_get_32
      5.00 ±  5%      -2.4        2.61 ±  4%  perf-profile.self.cycles-pp.btrfs_get_64
      3.51 ±  9%      -1.4        2.12 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock
      2.57 ±  4%      -1.0        1.62 ± 45%  perf-profile.self.cycles-pp.crc_pcl
      2.38 ±  7%      -0.9        1.51 ±  6%  perf-profile.self.cycles-pp.check_extent_item
      2.43 ±  4%      -0.9        1.56 ± 12%  perf-profile.self.cycles-pp.memcpy_orig
      1.79 ±  7%      -0.9        0.93 ± 18%  perf-profile.self.cycles-pp.intel_idle
      3.01 ±  7%      -0.8        2.20 ± 10%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      1.44 ± 12%      -0.7        0.70 ±  8%  perf-profile.self.cycles-pp.btrfs_get_8
      3.26 ±  4%      -0.7        2.58 ± 11%  perf-profile.self.cycles-pp.btrfs_get_token_32
      1.20 ±  6%      -0.5        0.65 ± 12%  perf-profile.self.cycles-pp.btrfs_comp_cpu_keys
      1.11 ± 11%      -0.4        0.67 ± 13%  perf-profile.self.cycles-pp.__btrfs_check_leaf
      1.22 ± 14%      -0.4        0.84 ±  8%  perf-profile.self.cycles-pp.btrfs_bin_search
      1.24 ± 10%      -0.4        0.87 ± 13%  perf-profile.self.cycles-pp.__lookup_extent_mapping
      0.80 ± 10%      -0.4        0.44 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.97 ±  9%      -0.4        1.62 ±  9%  perf-profile.self.cycles-pp.__memmove
      0.75 ± 15%      -0.3        0.41 ± 17%  perf-profile.self.cycles-pp.add_delayed_ref_head
      0.79 ±  6%      -0.3        0.48 ± 21%  perf-profile.self.cycles-pp.intel_idle_irq
      0.92 ±  5%      -0.3        0.61 ± 10%  perf-profile.self.cycles-pp.read_extent_buffer
      0.71 ± 14%      -0.3        0.42 ± 22%  perf-profile.self.cycles-pp.check_leaf_item
      0.83 ±  4%      -0.3        0.57 ± 11%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.37 ± 14%      -0.3        0.11 ± 35%  perf-profile.self.cycles-pp.down_read
      0.68 ±  7%      -0.3        0.43 ± 12%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.54 ± 10%      -0.2        0.30 ± 20%  perf-profile.self.cycles-pp.setup_items_for_insert
      0.62 ± 13%      -0.2        0.38 ± 16%  perf-profile.self.cycles-pp.xas_load
      0.30 ± 17%      -0.2        0.09 ± 22%  perf-profile.self.cycles-pp.up_read
      0.26 ± 25%      -0.2        0.06 ± 75%  perf-profile.self.cycles-pp.check_extent_data_item
      0.76 ± 13%      -0.2        0.57 ± 17%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.30 ± 19%      -0.2        0.12 ± 27%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.48 ± 16%      -0.2        0.30 ± 23%  perf-profile.self.cycles-pp.btrfs_del_items
      0.23 ± 19%      -0.2        0.05 ± 74%  perf-profile.self.cycles-pp.ahci_single_level_irq_intr
      0.39 ± 15%      -0.2        0.22 ± 25%  perf-profile.self.cycles-pp.filemap_get_entry
      0.22 ± 19%      -0.2        0.06 ± 76%  perf-profile.self.cycles-pp.ahci_scr_read
      0.58 ± 12%      -0.2        0.41 ±  8%  perf-profile.self.cycles-pp.__set_extent_bit
      0.26 ± 23%      -0.2        0.10 ± 21%  perf-profile.self.cycles-pp.btrfs_put_block_group
      0.34 ± 14%      -0.2        0.18 ± 31%  perf-profile.self.cycles-pp.__folio_end_writeback
      0.69 ± 13%      -0.2        0.54 ± 13%  perf-profile.self.cycles-pp.kmem_cache_free
      0.22 ± 46%      -0.1        0.07 ± 49%  perf-profile.self.cycles-pp.ahci_qc_complete
      0.28 ± 12%      -0.1        0.14 ± 34%  perf-profile.self.cycles-pp.__cond_resched
      0.29 ± 22%      -0.1        0.15 ± 15%  perf-profile.self.cycles-pp.__folio_start_writeback
      0.34 ± 15%      -0.1        0.20 ± 18%  perf-profile.self.cycles-pp.folio_end_writeback
      0.28 ± 11%      -0.1        0.15 ± 22%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.38 ± 23%      -0.1        0.25 ± 23%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.19 ± 15%      -0.1        0.06 ± 49%  perf-profile.self.cycles-pp.btrfs_reduce_alloc_profile
      0.39 ± 21%      -0.1        0.26 ± 24%  perf-profile.self.cycles-pp.free_extent_state
      0.18 ± 31%      -0.1        0.05 ± 85%  perf-profile.self.cycles-pp.ahci_handle_port_intr
      0.22 ± 27%      -0.1        0.09 ± 11%  perf-profile.self.cycles-pp.xas_clear_mark
      0.34 ± 15%      -0.1        0.22 ± 17%  perf-profile.self.cycles-pp.menu_select
      0.30 ± 12%      -0.1        0.18 ± 21%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.31 ± 15%      -0.1        0.20 ± 20%  perf-profile.self.cycles-pp.folio_clear_dirty_for_io
      0.13 ± 27%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.mod_zone_page_state
      0.26 ± 23%      -0.1        0.16 ± 31%  perf-profile.self.cycles-pp.block_group_cache_tree_search
      0.19 ± 18%      -0.1        0.10 ± 33%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.17 ± 22%      -0.1        0.08 ± 49%  perf-profile.self.cycles-pp.__switch_to
      0.13 ± 10%      -0.1        0.04 ±115%  perf-profile.self.cycles-pp.strcmp
      0.27 ± 25%      -0.1        0.18 ± 18%  perf-profile.self.cycles-pp.find_extent_buffer_nolock
      0.12 ± 21%      -0.1        0.03 ±111%  perf-profile.self.cycles-pp.btrfs_calculate_inode_block_rsv_size
      0.19 ± 20%      -0.1        0.11 ± 16%  perf-profile.self.cycles-pp.insert_state
      0.24 ± 16%      -0.1        0.16 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.10 ± 23%      -0.1        0.03 ±106%  perf-profile.self.cycles-pp.folio_account_dirtied
      0.14 ±  7%      -0.1        0.07 ± 52%  perf-profile.self.cycles-pp.lo_write_simple
      0.16 ± 12%      -0.1        0.10 ± 27%  perf-profile.self.cycles-pp.filemap_dirty_folio
      0.12 ± 22%      -0.1        0.07 ± 47%  perf-profile.self.cycles-pp.__filemap_get_folio
      0.09 ± 17%      -0.1        0.03 ±103%  perf-profile.self.cycles-pp.__memcpy
      0.08 ± 16%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.10 ± 21%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.put_cpu_partial
      0.09 ± 20%      +0.1        0.14 ± 15%  perf-profile.self.cycles-pp.__write_extent_buffer
      0.00            +0.2        0.16 ± 29%  perf-profile.self.cycles-pp.btrfs_truncate_item
      0.05 ± 74%      +4.0        4.05 ± 10%  perf-profile.self.cycles-pp.steal_from_bitmap
      0.40 ± 38%     +29.7       30.14 ±  9%  perf-profile.self.cycles-pp._find_next_zero_bit





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

