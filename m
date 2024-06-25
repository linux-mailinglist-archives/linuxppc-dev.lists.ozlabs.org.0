Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A636915C37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 04:30:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d35Cxdsb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7TLx3xS7z3cxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 12:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d35Cxdsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7TL962Ngz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 12:29:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719282563; x=1750818563;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=V11zIKqk/6wupkP1AL+HaUeiYuY0nVFIKfm6Rg0OkQI=;
  b=d35Cxdsb21X0RRCQ+hLDqvQw7iCy2JNM2kOvfR7IoUUnz86xW3UIfw9C
   gF2lT8zQVlHeORQAu80nBtRBVkPeo7k1ubhWTBp6ZWoYyQF6C7hqktXBr
   h7Ox9jQpXrzxeYQ7LHRup+s9COLoJALCX7gZXQEBsMzBDlxvLwUhd/7bc
   aDi2N8CW5pdgt8o9gxUNBD88n1S7sh3pQB7/kYeGoPR0mPJstvd8dqZUk
   c/KNB8BSy2+MyyPPrIoUEDy3CQWJ8FMNBovjaa96N78kknl1NzTU52jjm
   XevYcC6TUF6TKm36AlxWcUjfa7eZc+g9uxFg7NYA0yULjot0OdWO1vPQa
   g==;
X-CSE-ConnectionGUID: 4uD1c9W3SoWn9PDXAR2BFQ==
X-CSE-MsgGUID: X8zgTcdNSyOvLI9DsIX10g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16243608"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16243608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 19:29:15 -0700
X-CSE-ConnectionGUID: AsAxO2tPRv6jk8yJ0kSNsQ==
X-CSE-MsgGUID: bX47Fp3gRPaL8p0eVze4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43476889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jun 2024 19:29:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 19:29:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 19:29:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 19:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9h8R6hzcnzhx4/2SvQorNvgdOcdkKvE0PLwksN7GPqMDbJF+VQw0p/0Fm/PCK6i7IMZeSQCBsLXgLBfZHdqr4TKJIdtx/LhSD3RiEjVQoQhz0kWPtfPOL/RH7oprc8Q418pLxlGNjF0I5qs86ckctHeyh59TOTIbQFM89ifuBbcbvUDYfdyZIxYkpgZ0g2hvBs4hoaOqUZrh5kxe8xWDMED2kV4ELERa/lXUJ/4mx/BzbudsxEVShYqelMvNIapixWiHQVA829BOFIgbyXhC7MnwHnfOpc29x16kitTJqLVlR+oP1doxcZLzU2EljTu2HCT5ChLvqdtkkADVZMwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwpKITPhZdY8rBpmX/A9w8AtI8ycz5+NsEaqwbLR1AM=;
 b=BRhf6AKDZEbWZkJctacnPUO1XrMuzfSzMhrA0783U9cwcQxkhCfM8pmENquiRBLuYhaTtL93JuwnG55xHWIai1kHfiFoOS4bCJ6O/FpyRst4grWyn7ZknvGsk/x7zNjdVxkUmMOAwaTN/xFpyHnVDVHoL1OB2gM2Mi7BY/AVkYI6/z57W+2d+H3znbzBV02VlZPSmoDFGTuFNRLJT2G3c0CYheLMLTqcMSWy3mCsGeTIfAKYhpkuOiT7j10asiOa2LpbzQoQm4W2L9U9HWjQ1sZJzCU+DRjO5GJFi+49imD6MpPDx5gYcRyxwIW4vJqQkgkl1woqAwHSNPj38HFxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 25 Jun
 2024 02:29:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 02:29:11 +0000
Date: Tue, 25 Jun 2024 10:28:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min 22.6%
 improvement
Message-ID: <202406250948.e0044f1d-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8ede53-74eb-4dff-a384-08dc94be98a9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PIIgtCnwHZoc/HDZapjTLstCsf2vJA7dqGuvyDdI+BFfAm9aBdaewcOf34?=
 =?iso-8859-1?Q?Jooffxj7oiw8pKHAv17Sq4mUOjtkpSUV/tcs5vj1nkiKk3Q++QlO/JO/Gh?=
 =?iso-8859-1?Q?8tlONGWUxgY47PMxma4El1ngJwEU7Oc+3op87+IezaceDVmIGXdJptjDdP?=
 =?iso-8859-1?Q?iIVg2eGYFpKwr2pfoXlMtUZcAeWbMDBcVEccd5U2rKljURimKIe2NV+TZl?=
 =?iso-8859-1?Q?Q9rX0DyRwPjhFB6V5l5qPpkO3wAxzzOiTB+KPPpYFhEALw2Rd2pAX8+KBW?=
 =?iso-8859-1?Q?epVTj44l2NewRbspVVAqRajF785U3k6g3U/mZVnvgaTkx85He0SypHAuDr?=
 =?iso-8859-1?Q?6Y6eHYfkZWl5QB6V41AnB1Y4aFKAltJcM1hkvNgujDRGn28R7G9PhV68cG?=
 =?iso-8859-1?Q?xEOVHyrYDmm2RNFwwdiZOef6WgAg5isxrDK6uQ2+jgx2GlAOpPLtFpbZQF?=
 =?iso-8859-1?Q?IqxHMUMJXvRzSoEbTBqgbgTfobyNrwnYCgY8tAyD8GpHwIP2ff4FCFMWe4?=
 =?iso-8859-1?Q?jC3nKsIXZycbbfIc+8u7GpXMJN16hTbeqQXaAGFdVwu6U4Jyt7zM8fCKbD?=
 =?iso-8859-1?Q?/h4a4Bh5rClpKoNWhUU94vav++fqm/6cp73Yu8r3T3KtVUmIyDh8jGAOrV?=
 =?iso-8859-1?Q?wB9vpx8ebFCakwWbPdIdDT37Tc/6z+5tJm5dZ0U2PZF1vU3CfSTvZTdSXd?=
 =?iso-8859-1?Q?4xRIsAdP99TG1gAluRlLdUU0bchgP8rcexw/UllnPGqidY9np58WrtM9au?=
 =?iso-8859-1?Q?nD4jSn5gH+OPJKP5Pm+BtloYFaHluH+BYzgDk/8KwUaok1PVv5NYQykuuB?=
 =?iso-8859-1?Q?sR90Poe9tnBPpaUpZM0F/M/Tl6SCsepytiKPgpVkI3kFKCo9lv3QCrgL3S?=
 =?iso-8859-1?Q?KwtKafjHocGu7VorMLvNpY6zGNQSaySLlJRppuiLQ8SU6nus/bPUllCGr0?=
 =?iso-8859-1?Q?4BkqhMcXzal3fErmbMPMETqxWRNSoVldhIrOTH0Ve2ial7vAZcg0A14cmW?=
 =?iso-8859-1?Q?8spKsHUVkqX+xoNJDCn2jkSMc12Iw9Lh8IpodGdXep+K8GuFgtMogOjKJV?=
 =?iso-8859-1?Q?ZRbDDwRQ0nb54bIjcrPoxI8FUgiKrHJDn3NzxclmH/ikJ4SHpKxPOJEHNX?=
 =?iso-8859-1?Q?Dz4PoKFuiGpKYXirLXeiiFMCP/OolpA8h+tOaWZyMpoX6CyC1r07mNivV0?=
 =?iso-8859-1?Q?/yvDYDb84NmdI02GnJMv+Jydn0E2cd4db84d61nKPt86rfNdCPsQNGwDtS?=
 =?iso-8859-1?Q?BppUGS2/6QMIIzj+/tylz0apPhWRVTcqpGWp/o1Fsrz/ZlCSSegdy56VT4?=
 =?iso-8859-1?Q?lONpg/ZuYe5jMybgDLAOcIgpzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a2eBOImJcv9EUqqAdM8+K8Sx2DYwG3JU+3AgvaMH5Y9h+UewAjTEgUqvLH?=
 =?iso-8859-1?Q?+O3U7SLWDyeVMNg16Bhdpbs2pUshRwXhsE3H2xcOLINxGV65wpjjwKcGlg?=
 =?iso-8859-1?Q?FT3ZbeLkalts+157JmiNEya3cIzAJZ2jNT/h50EYtR5IFGLxc2EPg1669S?=
 =?iso-8859-1?Q?yqQUnfnJ+ySx/XyBAtlcakbuXFKHVn4StmPSyvdHEBmXILHoC4kgJ+vTS1?=
 =?iso-8859-1?Q?os5l85/9nGv5jpPO8zKOAmyGeuOhsToOQAF0J/m6TNi7CAQQyMdkhaDRle?=
 =?iso-8859-1?Q?o0tkhlZror8Wq78cGXZ6P/aLAJ6uZtPv8pzcwp7GoWmK+fKwB5Pw8qnQNh?=
 =?iso-8859-1?Q?xRISnEz3xUQEdX84SJs8Wliubv/r5SHRRHkPpxiE10INEeVsg9HlEBwVma?=
 =?iso-8859-1?Q?Hk9lMLebXIc04/8wgltIt0ubrzxw0JOkCv1lHSSdtr9+thDoC3vcqKTvK+?=
 =?iso-8859-1?Q?+ZoxeR1NeTUZoBAiQptrIaKDn3iFkn3ksfo7aa59NUn/HJ5njz7MOvuHIq?=
 =?iso-8859-1?Q?YXjzdI8tJztF3OIu+8I1HE0WeYhxESwQiN6EOFHKg3TvE1GSQdKo/rxTRp?=
 =?iso-8859-1?Q?GZOdDX5ZxUcorUXZAlqocczlCpTMMS/T5tuqERry+PSGd/KUORLtAP2zpA?=
 =?iso-8859-1?Q?YugVmhWwiA36p7ZtzqV/14Nl4FnLhVRPTIekbVhZ+V4dcVBbbR5JLMv63C?=
 =?iso-8859-1?Q?BHBad851pqVlkxI1anKxI/P+9W23qifsT71mqEu1LsI0+aR18HsfviUB07?=
 =?iso-8859-1?Q?W+kf8kLK4SR38dVzA7Ek9v+B3JJzqy/+a2J5j9zND3kAG/WmDgXGsJebBF?=
 =?iso-8859-1?Q?FZm1oIEQAAgD6caN6uD2jHxXbwlkDLedzNnajIRn49zT1lQbeqnr6wY5wk?=
 =?iso-8859-1?Q?QnE6jDseNZXU7+SLoEeCv5bdFpgJt466kcS1uZ0Ci7GCzHxq7y/Sl/l1gj?=
 =?iso-8859-1?Q?227wuuHzhXE2+ADXTxSBBd4vuBPqxo5eFIo08xHhpIKDlBWbEXn02XyH/+?=
 =?iso-8859-1?Q?6lZuWo4hAcEsHZoekesn9i2hwbQEg3f2Hu4QklGeDKmy8GcvbfbSKygrrA?=
 =?iso-8859-1?Q?MeuFOQUF0W1DtG1yJ7YKgYml/nXBnv6r/M6EvRy8rDv+0X4J8mIaK9PBTm?=
 =?iso-8859-1?Q?YrObpua6oP1Pe1QRpdeyN85CiEWYCUQl5wSvM8jVeTsPFK7tU+rbi+tF56?=
 =?iso-8859-1?Q?bJRz7LDmCsuTxpbtBSyFrgZbTrNSQwfwqcTqDp5nSzfDJg1O366ZTL1NgQ?=
 =?iso-8859-1?Q?qoBZVtwsfmwPZWQ+zWRz18g66g8HyyrJVKdJLXavldaMnVIrbjNDjxA6fo?=
 =?iso-8859-1?Q?miH9183wvA7rkwqya2SqBHoFmay/0RQYU835d/zRIRf3DFNTMb2trmWZKG?=
 =?iso-8859-1?Q?FtsdKW2FE9ybmB4WnjsiMPBmOXGDvI55r1JCUn23c5K/dBFP7UUl/y+3O6?=
 =?iso-8859-1?Q?WXM2Ks4C7RgpdT98LWt88LpjkoiQDr9hV+kVWikPYNHVIc7kVOHEBXy1ck?=
 =?iso-8859-1?Q?cvor5rxLsgNRM3dtfWpIRhd6dU0zZoV2IRBhIG+vY0HtzXYiqJbZgDe0n3?=
 =?iso-8859-1?Q?LSszv7iifTKphqYTy6EnRcRm+XT77QB0AXjIrYmlKtgoKmMBWfiVHvrdEt?=
 =?iso-8859-1?Q?/qlwyfKtu33jTIZ+KHY2DF2n0p0RlySTXQQG6B4jdYTxOIKO0/FCzezg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8ede53-74eb-4dff-a384-08dc94be98a9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 02:29:10.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kxJ5gKgNkwM5s9fmrlour0cJ/y8l5AOLx8gfJoGmkeKSBi0NVGkj+TFuyayyHymlrUKN1zDxX8yNoipbVI70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
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



Hello,

kernel test robot noticed a 22.6% improvement of aim7.jobs-per-min on:


commit: 1122c0c1cc71f740fa4d5f14f239194e06a1d5e7 ("block: move cache control settings out of queue->flags")
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next

testcase: aim7
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
parameters:

	disk: 4BRD_12G
	md: RAID0
	fs: xfs
	test: sync_disk_rw
	load: 300
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240625/202406250948.e0044f1d-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/testcase:
  gcc-13/performance/4BRD_12G/xfs/x86_64-rhel-8.3/300/RAID0/debian-12-x86_64-20240206.cgz/lkp-csl-2sp3/sync_disk_rw/aim7

commit: 
  70905f8706 ("block: remove blk_flush_policy")
  1122c0c1cc ("block: move cache control settings out of queue->flags")

70905f8706b62113 1122c0c1cc71f740fa4d5f14f23 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    153.19           -13.3%     132.81        uptime.boot
   2.8e+09           -11.9%  2.466e+09        cpuidle..time
  21945319 ±  2%     -40.4%   13076160        cpuidle..usage
     29.31            +7.8%      31.58 ±  2%  iostat.cpu.idle
     69.87            -3.6%      67.35        iostat.cpu.system
      0.04 ±  4%      +0.0        0.08 ±  5%  mpstat.cpu.all.iowait%
      0.78 ±  2%      +0.2        0.99 ±  2%  mpstat.cpu.all.usr%
     52860 ± 49%     -78.2%      11536 ± 78%  numa-numastat.node0.other_node
     46804 ± 56%     +88.4%      88190 ± 10%  numa-numastat.node1.other_node
    955871 ± 10%     -43.3%     542216 ± 14%  numa-meminfo.node1.Active
    955871 ± 10%     -43.3%     542216 ± 14%  numa-meminfo.node1.Active(anon)
   1015354 ± 10%     -34.7%     662696 ± 13%  numa-meminfo.node1.Shmem
      6008           -14.3%       5146 ±  2%  perf-c2c.DRAM.remote
      7889           -12.4%       6908 ±  2%  perf-c2c.HITM.local
      3839           -16.5%       3203 ±  2%  perf-c2c.HITM.remote
     11728           -13.8%      10112 ±  2%  perf-c2c.HITM.total
    695109           +20.5%     837625        vmstat.io.bo
    105.99 ±  7%     -23.7%      80.83 ± 11%  vmstat.procs.r
    803244           -30.9%     555360        vmstat.system.cs
    209736           -12.9%     182626        vmstat.system.in
      1448 ± 89%    +207.9%       4459 ±  6%  numa-vmstat.node0.nr_page_table_pages
     52860 ± 49%     -78.2%      11536 ± 78%  numa-vmstat.node0.numa_other
    239214 ± 10%     -43.6%     134883 ± 13%  numa-vmstat.node1.nr_active_anon
    254124 ± 10%     -34.9%     165421 ± 13%  numa-vmstat.node1.nr_shmem
    239214 ± 10%     -43.6%     134883 ± 13%  numa-vmstat.node1.nr_zone_active_anon
     46805 ± 56%     +88.4%      88190 ± 10%  numa-vmstat.node1.numa_other
     17374           +22.6%      21299        aim7.jobs-per-min
    103.64           -18.4%      84.58        aim7.time.elapsed_time
    103.64           -18.4%      84.58        aim7.time.elapsed_time.max
   4641240           -83.4%     770073        aim7.time.involuntary_context_switches
     32705            -4.3%      31289 ±  2%  aim7.time.minor_page_faults
      6562            -3.1%       6359        aim7.time.percent_of_cpu_this_job_got
      6775           -21.0%       5351 ±  2%  aim7.time.system_time
  49095202           -38.3%   30299361        aim7.time.voluntary_context_switches
   1297567           -37.0%     817692        meminfo.Active
   1297567           -37.0%     817692        meminfo.Active(anon)
     97760 ±  5%     -23.4%      74859 ± 20%  meminfo.AnonHugePages
   2390317           -15.3%    2024905        meminfo.Committed_AS
    884407           +11.9%     989723        meminfo.Inactive
    743152 ±  2%     +14.8%     853331        meminfo.Inactive(anon)
    159265 ±  8%     +38.6%     220668 ±  3%  meminfo.Mapped
   1382079           -27.1%    1007445        meminfo.Shmem
    324534           -37.2%     203663 ±  2%  proc-vmstat.nr_active_anon
   1165686            -8.2%    1070277        proc-vmstat.nr_file_pages
    185928 ±  2%     +14.9%     213697        proc-vmstat.nr_inactive_anon
     35436            -2.9%      34420        proc-vmstat.nr_inactive_file
     40463 ±  8%     +38.2%      55918 ±  3%  proc-vmstat.nr_mapped
    345824           -27.3%     251424        proc-vmstat.nr_shmem
     28871            -1.4%      28477        proc-vmstat.nr_slab_reclaimable
    324534           -37.2%     203663 ±  2%  proc-vmstat.nr_zone_active_anon
    185928 ±  2%     +14.9%     213697        proc-vmstat.nr_zone_inactive_anon
     35436            -2.9%      34420        proc-vmstat.nr_zone_inactive_file
   5120744            -2.4%    4996195        proc-vmstat.numa_hit
   5020486            -2.5%    4896473        proc-vmstat.numa_local
    207026 ± 10%     +50.2%     310941        proc-vmstat.pgactivate
   5196440            -2.7%    5057618        proc-vmstat.pgalloc_normal
    763396 ±  6%     -11.8%     673464        proc-vmstat.pgfault
  74254490            -1.3%   73292473        proc-vmstat.pgpgout
     11.25 ± 24%     -60.0%       4.50 ± 29%  sched_debug.cfs_rq:/.h_nr_running.max
      1.59 ± 20%     -42.7%       0.91 ± 13%  sched_debug.cfs_rq:/.h_nr_running.stddev
    968.29 ±  5%     -13.2%     840.04 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
      5533 ± 21%     -47.1%       2925 ± 21%  sched_debug.cfs_rq:/.runnable_avg.max
    798.88 ± 13%     -38.3%     492.63 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    578.50 ±  5%      -9.9%     521.30 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
      3120 ± 20%     -40.3%       1862 ± 19%  sched_debug.cfs_rq:/.util_avg.max
    479.36 ± 12%     -30.4%     333.40 ±  8%  sched_debug.cfs_rq:/.util_avg.stddev
      4592 ± 24%     -51.8%       2215 ± 31%  sched_debug.cfs_rq:/.util_est.max
    615.47 ± 21%     -35.7%     395.64 ± 15%  sched_debug.cfs_rq:/.util_est.stddev
     11.33 ± 24%     -58.8%       4.67 ± 26%  sched_debug.cpu.nr_running.max
      1.62 ± 20%     -42.6%       0.93 ± 11%  sched_debug.cpu.nr_running.stddev
    224323           -28.2%     161088        sched_debug.cpu.nr_switches.avg
    242363 ±  2%     -27.9%     174695 ±  2%  sched_debug.cpu.nr_switches.max
    197870 ±  2%     -27.6%     143186        sched_debug.cpu.nr_switches.min
      7911 ± 19%     -33.1%       5295 ± 10%  sched_debug.cpu.nr_switches.stddev
      1.23            -4.8%       1.17        perf-stat.i.MPKI
 1.105e+10            +5.6%  1.167e+10        perf-stat.i.branch-instructions
      1.20 ±  2%      +0.1        1.29 ±  2%  perf-stat.i.branch-miss-rate%
    820863           -30.7%     569230        perf-stat.i.context-switches
      3.79           -10.2%       3.41        perf-stat.i.cpi
 2.176e+11            -3.2%  2.106e+11        perf-stat.i.cpu-cycles
    212040           -27.8%     153137        perf-stat.i.cpu-migrations
 5.416e+10            +6.8%  5.785e+10        perf-stat.i.instructions
      0.32           +11.8%       0.36        perf-stat.i.ipc
      0.05 ± 77%    +233.9%       0.17 ± 50%  perf-stat.i.major-faults
     10.74           -30.2%       7.50        perf-stat.i.metric.K/sec
      1.28            -4.3%       1.22        perf-stat.overall.MPKI
      4.02            -9.4%       3.64        perf-stat.overall.cpi
      3145            -5.3%       2979        perf-stat.overall.cycles-between-cache-misses
      0.25           +10.3%       0.27        perf-stat.overall.ipc
 1.094e+10            +5.4%  1.153e+10        perf-stat.ps.branch-instructions
    812563           -30.8%     562343        perf-stat.ps.context-switches
 2.156e+11            -3.4%  2.082e+11        perf-stat.ps.cpu-cycles
    209965           -28.0%     151248        perf-stat.ps.cpu-migrations
 5.365e+10            +6.6%  5.717e+10        perf-stat.ps.instructions
 5.641e+12           -13.1%  4.905e+12 ±  2%  perf-stat.total.instructions
     14.88 ±  5%     -14.9        0.00        perf-profile.calltrace.cycles-pp.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write
     14.86 ±  5%     -14.9        0.00        perf-profile.calltrace.cycles-pp.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_write.vfs_write
     14.77 ±  5%     -14.8        0.00        perf-profile.calltrace.cycles-pp.__submit_bio_noacct.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_write
     14.76 ±  5%     -14.8        0.00        perf-profile.calltrace.cycles-pp.__submit_bio.__submit_bio_noacct.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync
     14.74 ±  5%     -14.7        0.00        perf-profile.calltrace.cycles-pp.md_handle_request.__submit_bio.__submit_bio_noacct.submit_bio_wait.blkdev_issue_flush
     14.72 ±  5%     -14.7        0.00        perf-profile.calltrace.cycles-pp.raid0_make_request.md_handle_request.__submit_bio.__submit_bio_noacct.submit_bio_wait
     14.71 ±  5%     -14.7        0.00        perf-profile.calltrace.cycles-pp.md_flush_request.raid0_make_request.md_handle_request.__submit_bio.__submit_bio_noacct
     13.32 ±  5%     -13.3        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.md_flush_request.raid0_make_request.md_handle_request.__submit_bio
     13.25 ±  5%     -13.3        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.md_flush_request.raid0_make_request.md_handle_request
      9.70 ±  3%      -1.1        8.61 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      9.70 ±  3%      -1.1        8.61 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      9.70 ±  3%      -1.1        8.61 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      9.80 ±  3%      -1.1        8.71 ±  3%  perf-profile.calltrace.cycles-pp.common_startup_64
      9.12 ±  3%      -1.0        8.15 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      8.95 ±  3%      -0.9        8.01 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      8.95 ±  3%      -0.9        8.02 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      2.21            -0.4        1.78 ±  2%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 ±  2%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      2.08            -0.4        1.68 ±  2%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.09            -0.2        2.86 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_log_force_seq
      3.10            -0.2        2.87 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync
      3.10            -0.2        2.87 ±  2%  perf-profile.calltrace.cycles-pp.remove_wait_queue.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write
      3.44            -0.2        3.23 ±  4%  perf-profile.calltrace.cycles-pp.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write
      0.95            +0.1        1.04        perf-profile.calltrace.cycles-pp.mutex_spin_on_owner.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq
      0.57            +0.1        0.71 ±  2%  perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.58 ±  2%      +0.3        0.84 ±  3%  perf-profile.calltrace.cycles-pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
      0.59 ±  2%      +0.3        0.85 ±  2%  perf-profile.calltrace.cycles-pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
      0.90 ±  2%      +0.4        1.27 ±  3%  perf-profile.calltrace.cycles-pp.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages.do_writepages
      0.88 ±  2%      +0.4        1.26 ±  3%  perf-profile.calltrace.cycles-pp.__submit_bio.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages
      0.92 ±  3%      +0.4        1.30 ±  3%  perf-profile.calltrace.cycles-pp.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc
      0.57 ±  3%      +0.4        0.95 ±  6%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.64 ±  3%      +0.4        1.03 ±  6%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      6.90 ±  2%      +0.5        7.40 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.92 ±  4%      +0.5        1.43 ±  6%  perf-profile.calltrace.cycles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.complete.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq
      0.94 ±  4%      +0.5        1.46 ±  6%  perf-profile.calltrace.cycles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write
      0.96 ±  4%      +0.5        1.48 ±  6%  perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread
      0.00            +0.5        0.55 ±  2%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      0.00            +0.6        0.56 ± 10%  perf-profile.calltrace.cycles-pp.__folio_start_writeback.iomap_writepage_map.iomap_writepages.xfs_vm_writepages.do_writepages
      0.00            +0.6        0.57 ±  6%  perf-profile.calltrace.cycles-pp.__folio_end_writeback.folio_end_writeback.iomap_finish_ioend.md_end_clone_io.__submit_bio
      0.00            +0.6        0.58 ±  7%  perf-profile.calltrace.cycles-pp.folio_end_writeback.iomap_finish_ioend.md_end_clone_io.__submit_bio.__submit_bio_noacct
      0.00            +0.6        0.60 ±  6%  perf-profile.calltrace.cycles-pp.iomap_finish_ioend.md_end_clone_io.__submit_bio.__submit_bio_noacct.iomap_submit_ioend
      0.08 ±223%      +0.6        0.72 ±  5%  perf-profile.calltrace.cycles-pp.md_end_clone_io.__submit_bio.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages
      1.45 ±  4%      +0.7        2.15 ±  4%  perf-profile.calltrace.cycles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      1.46 ±  4%      +0.7        2.16 ±  4%  perf-profile.calltrace.cycles-pp.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range
      1.48 ±  4%      +0.7        2.18 ±  4%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync
      1.51 ±  4%      +0.7        2.22 ±  4%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write
      1.51 ±  3%      +0.7        2.23 ±  4%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write.vfs_write
      0.00            +0.7        0.72 ±  7%  perf-profile.calltrace.cycles-pp.iomap_writepage_map.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc
      1.60 ±  3%      +0.8        2.36 ±  4%  perf-profile.calltrace.cycles-pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write
     85.48            +0.8       86.24        perf-profile.calltrace.cycles-pp.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
     87.06            +1.4       88.49        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     87.18            +1.5       88.64        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.36            +1.5       88.82        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.19            +1.5       88.65        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.36            +1.5       88.82        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     87.62            +1.5       89.10        perf-profile.calltrace.cycles-pp.write
     56.74           +13.7       70.42        perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq
     57.89           +13.8       71.74        perf-profile.calltrace.cycles-pp.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq
     60.36           +14.6       74.96        perf-profile.calltrace.cycles-pp.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync
     61.48           +14.6       76.09        perf-profile.calltrace.cycles-pp.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write
     68.74           +14.8       83.60        perf-profile.calltrace.cycles-pp.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write
     64.97           +15.1       80.03        perf-profile.calltrace.cycles-pp.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write
     14.86 ±  5%     -14.9        0.00        perf-profile.children.cycles-pp.submit_bio_wait
     14.96 ±  5%     -14.8        0.12 ±  4%  perf-profile.children.cycles-pp.md_handle_request
     14.94 ±  5%     -14.8        0.11 ±  3%  perf-profile.children.cycles-pp.raid0_make_request
     14.83 ±  5%     -14.8        0.00        perf-profile.children.cycles-pp.md_flush_request
     14.88 ±  5%     -14.8        0.06 ±  6%  perf-profile.children.cycles-pp.blkdev_issue_flush
     15.82 ±  5%     -14.5        1.32 ±  3%  perf-profile.children.cycles-pp.__submit_bio_noacct
     15.81 ±  5%     -14.5        1.31 ±  3%  perf-profile.children.cycles-pp.__submit_bio
     13.86 ±  5%     -13.6        0.29 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_irq
     22.32 ±  3%     -13.1        9.23 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.96 ±  9%      -1.5        0.49 ±  4%  perf-profile.children.cycles-pp.intel_idle_irq
      9.70 ±  3%      -1.1        8.61 ±  3%  perf-profile.children.cycles-pp.start_secondary
      9.80 ±  3%      -1.1        8.71 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      9.80 ±  3%      -1.1        8.71 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      9.79 ±  3%      -1.1        8.71 ±  3%  perf-profile.children.cycles-pp.do_idle
      9.20 ±  3%      -1.0        8.25 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      9.04 ±  3%      -0.9        8.11 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      9.04 ±  3%      -0.9        8.11 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      2.21            -0.4        1.78 ±  2%  perf-profile.children.cycles-pp.worker_thread
      2.22            -0.4        1.79 ±  2%  perf-profile.children.cycles-pp.kthread
      2.22            -0.4        1.79 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      2.22            -0.4        1.79 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      2.08            -0.4        1.68 ±  2%  perf-profile.children.cycles-pp.process_one_work
      0.57            -0.3        0.24        perf-profile.children.cycles-pp.__wake_up
      0.63            -0.3        0.32 ±  2%  perf-profile.children.cycles-pp.__wake_up_common
      1.26            -0.3        0.99        perf-profile.children.cycles-pp.try_to_wake_up
      3.56 ±  2%      -0.2        3.34 ±  4%  perf-profile.children.cycles-pp.xlog_wait_on_iclog
      0.46 ±  2%      -0.1        0.36 ±  2%  perf-profile.children.cycles-pp.select_task_rq
      0.86 ±  3%      -0.1        0.75 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.43 ±  2%      -0.1        0.33 ±  2%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.64            -0.1        0.55 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.71 ±  3%      -0.1        0.62 ±  3%  perf-profile.children.cycles-pp.activate_task
      0.57            -0.1        0.48        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.17 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.xlog_state_release_iclog
      0.48            -0.1        0.41 ±  2%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.61 ±  3%      -0.1        0.54 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.28 ±  3%      -0.1        0.21 ±  3%  perf-profile.children.cycles-pp.select_idle_sibling
      0.19            -0.1        0.13 ±  2%  perf-profile.children.cycles-pp.schedule_idle
      0.22 ±  3%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.select_idle_cpu
      0.47 ±  4%      -0.1        0.41 ±  5%  perf-profile.children.cycles-pp.update_load_avg
      0.35 ±  2%      -0.1        0.29 ±  2%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.42 ±  3%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      0.11 ±  6%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.finish_task_switch
      0.18 ±  5%      -0.0        0.13 ±  5%  perf-profile.children.cycles-pp.available_idle_cpu
      0.33            -0.0        0.28        perf-profile.children.cycles-pp.xlog_write
      0.12 ±  3%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.xlog_write_partial
      0.30 ±  3%      -0.0        0.25 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.12 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.xlog_write_get_more_iclog_space
      0.37 ±  5%      -0.0        0.32 ±  8%  perf-profile.children.cycles-pp.dequeue_entity
      0.08            -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.__cond_resched
      0.46            -0.0        0.41        perf-profile.children.cycles-pp.xlog_cil_push_work
      0.27 ±  3%      -0.0        0.23 ±  3%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.08 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.select_idle_core
      0.26 ±  2%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.12 ±  3%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.queue_work_on
      0.14 ±  3%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.prepare_task_switch
      0.12 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.26 ±  5%      -0.0        0.23 ±  6%  perf-profile.children.cycles-pp.update_curr
      0.12            -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.13 ±  3%      -0.0        0.11        perf-profile.children.cycles-pp.wake_affine
      0.08 ±  4%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.set_next_entity
      0.10 ±  5%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.kick_pool
      0.11 ±  4%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__queue_work
      0.10 ±  3%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__switch_to_asm
      0.10 ±  4%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.07            -0.0        0.05        perf-profile.children.cycles-pp.__smp_call_single_queue
      0.11            -0.0        0.09        perf-profile.children.cycles-pp.xlog_cil_set_ctx_write_state
      0.10            -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.task_h_load
      0.08 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.08 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.set_task_cpu
      0.07 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.__switch_to
      0.13 ±  4%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.menu_select
      0.13 ±  6%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.reweight_entity
      0.11            -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.xlog_cil_write_commit_record
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.___perf_sw_event
      0.08 ±  5%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.avg_vruntime
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.perf_tp_event
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.place_entity
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.sched_clock
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.rep_movs_alternative
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.kfree
      0.06            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.xfs_inode_item_format_data_fork
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.xfs_btree_lookup_get_block
      0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.filemap_get_entry
      0.09 ±  5%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.memcpy_orig
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.xlog_state_clean_iclog
      0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.07            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.writeback_get_folio
      0.07            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.xfs_end_bio
      0.06 ±  9%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.io_schedule
      0.10            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      0.09            +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.xfs_btree_lookup
      0.10 ±  3%      +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.writeback_iter
      0.09            +0.0        0.11        perf-profile.children.cycles-pp.xfs_trans_committed_bulk
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.flush_workqueue_prep_pwqs
      0.10            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.07 ±  7%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.folio_wait_bit_common
      0.16 ±  3%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.xfs_inode_item_format
      0.08 ±  5%      +0.0        0.11        perf-profile.children.cycles-pp.__filemap_fdatawait_range
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.wake_page_function
      0.07 ±  7%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.folio_wait_writeback
      0.12 ±  4%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.iomap_writepage_map_blocks
      0.07 ±  6%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.folio_wake_bit
      0.13 ±  2%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.llseek
      0.03 ± 70%      +0.0        0.06        perf-profile.children.cycles-pp.get_jiffies_update
      0.12 ±  3%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.iomap_iter
      0.14 ±  5%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.__mutex_unlock_slowpath
      0.03 ± 70%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.04 ± 44%      +0.0        0.07        perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.14 ±  2%      +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.iomap_write_end
      0.04 ± 45%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.xfs_trans_alloc_inode
      0.03 ± 70%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_map_blocks
      0.15 ±  3%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.iomap_write_begin
      0.11 ±  5%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.wake_up_q
      0.14 ±  3%      +0.0        0.17 ±  3%  perf-profile.children.cycles-pp.xlog_cil_committed
      0.14 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.xlog_cil_process_committed
      0.03 ± 70%      +0.0        0.07 ±  8%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.22            +0.0        0.26 ±  2%  perf-profile.children.cycles-pp.xlog_cil_insert_format_items
      0.15 ±  2%      +0.0        0.19 ±  5%  perf-profile.children.cycles-pp.xfs_bmap_add_extent_unwritten_real
      0.16 ±  2%      +0.0        0.20 ±  5%  perf-profile.children.cycles-pp.xfs_bmapi_convert_unwritten
      0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.children.cycles-pp.xlog_grant_push_threshold
      0.28 ±  4%      +0.0        0.32 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.15            +0.0        0.19        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.32 ±  3%      +0.0        0.36 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.18 ±  2%      +0.0        0.23 ±  4%  perf-profile.children.cycles-pp.xfs_bmapi_write
      0.27 ±  2%      +0.0        0.32        perf-profile.children.cycles-pp.xlog_ioend_work
      0.36 ±  4%      +0.0        0.41 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.26 ±  2%      +0.0        0.31        perf-profile.children.cycles-pp.xlog_state_do_callback
      0.26 ±  2%      +0.0        0.31        perf-profile.children.cycles-pp.xlog_state_do_iclog_callbacks
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.xa_load
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.02 ±141%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.up_write
      0.31 ±  2%      +0.1        0.38 ±  2%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.41 ±  4%      +0.1        0.47 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.41 ±  3%      +0.1        0.48 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.13 ± 12%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.xfs_log_ticket_ungrant
      0.30            +0.1        0.38 ±  3%  perf-profile.children.cycles-pp.copy_to_brd
      0.56 ±  3%      +0.1        0.64 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.35            +0.1        0.43 ±  3%  perf-profile.children.cycles-pp.brd_submit_bio
      0.95            +0.1        1.04        perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.11 ± 11%      +0.1        0.21 ± 12%  perf-profile.children.cycles-pp.xlog_grant_add_space
      0.44            +0.1        0.55 ±  2%  perf-profile.children.cycles-pp.iomap_write_iter
      0.19 ±  5%      +0.1        0.30 ±  6%  perf-profile.children.cycles-pp.iomap_finish_ioends
      0.21 ± 11%      +0.1        0.35 ± 12%  perf-profile.children.cycles-pp.xfs_log_reserve
      0.22 ± 11%      +0.1        0.36 ± 11%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.40 ±  2%      +0.1        0.54 ±  2%  perf-profile.children.cycles-pp.xfs_iomap_write_unwritten
      0.57            +0.1        0.71 ±  2%  perf-profile.children.cycles-pp.iomap_file_buffered_write
      0.25 ± 10%      +0.1        0.39 ± 10%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.13 ± 11%      +0.2        0.32 ± 16%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.23 ± 13%      +0.2        0.46 ± 12%  perf-profile.children.cycles-pp.sb_mark_inode_writeback
      0.25 ± 12%      +0.2        0.50 ± 12%  perf-profile.children.cycles-pp.sb_clear_inode_writeback
      0.59 ±  2%      +0.3        0.85 ±  2%  perf-profile.children.cycles-pp.xfs_end_io
      0.58 ±  2%      +0.3        0.84 ±  3%  perf-profile.children.cycles-pp.xfs_end_ioend
      0.46 ±  6%      +0.3        0.72 ±  6%  perf-profile.children.cycles-pp.md_end_clone_io
      0.30 ± 10%      +0.3        0.57 ±  9%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.11 ± 11%      +0.3        0.38 ± 13%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.43 ±  7%      +0.3        0.72 ±  7%  perf-profile.children.cycles-pp.iomap_writepage_map
      0.16 ±  9%      +0.3        0.46 ± 11%  perf-profile.children.cycles-pp.down_read
      0.44 ±  8%      +0.3        0.76 ±  7%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.52 ±  7%      +0.4        0.88 ±  6%  perf-profile.children.cycles-pp.folio_end_writeback
      0.54 ±  7%      +0.4        0.90 ±  6%  perf-profile.children.cycles-pp.iomap_finish_ioend
      0.92 ±  2%      +0.4        1.30 ±  3%  perf-profile.children.cycles-pp.iomap_submit_ioend
      0.72 ±  3%      +0.4        1.16 ±  5%  perf-profile.children.cycles-pp.xlog_cil_commit
      0.82 ±  3%      +0.5        1.28 ±  5%  perf-profile.children.cycles-pp.__xfs_trans_commit
      0.92 ±  4%      +0.5        1.43 ±  6%  perf-profile.children.cycles-pp.xfs_vn_update_time
      0.94 ±  4%      +0.5        1.46 ±  6%  perf-profile.children.cycles-pp.kiocb_modified
      0.96 ±  4%      +0.5        1.48 ±  6%  perf-profile.children.cycles-pp.xfs_file_write_checks
      6.96 ±  2%      +0.5        7.49 ±  3%  perf-profile.children.cycles-pp.intel_idle
      1.45 ±  4%      +0.7        2.15 ±  5%  perf-profile.children.cycles-pp.iomap_writepages
      1.46 ±  4%      +0.7        2.16 ±  4%  perf-profile.children.cycles-pp.xfs_vm_writepages
      1.48 ±  4%      +0.7        2.18 ±  4%  perf-profile.children.cycles-pp.do_writepages
      1.51 ±  4%      +0.7        2.22 ±  4%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      1.51 ±  3%      +0.7        2.23 ±  4%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      1.61 ±  3%      +0.8        2.36 ±  4%  perf-profile.children.cycles-pp.file_write_and_wait_range
     85.48            +0.8       86.24        perf-profile.children.cycles-pp.xfs_file_fsync
     87.06            +1.4       88.49        perf-profile.children.cycles-pp.xfs_file_buffered_write
     87.19            +1.5       88.65        perf-profile.children.cycles-pp.vfs_write
     87.20            +1.5       88.66        perf-profile.children.cycles-pp.ksys_write
     87.66            +1.5       89.14        perf-profile.children.cycles-pp.write
     87.50            +1.5       88.98        perf-profile.children.cycles-pp.do_syscall_64
     87.50            +1.5       88.99        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     56.76           +13.7       70.44        perf-profile.children.cycles-pp.osq_lock
     57.89           +13.9       71.74        perf-profile.children.cycles-pp.__mutex_lock
     60.36           +14.6       74.96        perf-profile.children.cycles-pp.__flush_workqueue
     61.49           +14.6       76.10        perf-profile.children.cycles-pp.xlog_cil_push_now
     68.74           +14.8       83.60        perf-profile.children.cycles-pp.xfs_log_force_seq
     64.98           +15.1       80.03        perf-profile.children.cycles-pp.xlog_cil_force_seq
     22.30 ±  3%     -13.1        9.22 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.91 ±  9%      -1.4        0.46 ±  5%  perf-profile.self.cycles-pp.intel_idle_irq
      0.24 ±  2%      -0.1        0.18 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.18 ±  4%      -0.1        0.12 ±  6%  perf-profile.self.cycles-pp.available_idle_cpu
      0.37 ±  2%      -0.0        0.32 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.20 ±  3%      -0.0        0.17 ±  4%  perf-profile.self.cycles-pp.update_load_avg
      0.14 ±  3%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.__schedule
      0.09 ±  4%      -0.0        0.07 ±  8%  perf-profile.self.cycles-pp.prepare_task_switch
      0.10            -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.task_h_load
      0.10 ±  5%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.__switch_to_asm
      0.08 ±  4%      -0.0        0.06        perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.07 ±  5%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.menu_select
      0.09 ±  5%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.06 ±  7%      -0.0        0.05        perf-profile.self.cycles-pp.__switch_to
      0.07 ±  7%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.enqueue_entity
      0.10 ±  4%      -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.update_curr
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.rep_movs_alternative
      0.06            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.xas_load
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.__flush_workqueue
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.iomap_set_range_uptodate
      0.08 ±  5%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.memcpy_orig
      0.05 ±  7%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.down_read
      0.08 ±  5%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__mutex_lock
      0.09 ±  4%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.xlog_cil_insert_items
      0.03 ± 70%      +0.0        0.06        perf-profile.self.cycles-pp.get_jiffies_update
      0.02 ± 99%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.__folio_end_writeback
      0.15            +0.0        0.19        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.10 ± 12%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.xfs_log_ticket_ungrant
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.30 ±  2%      +0.1        0.37 ±  2%  perf-profile.self.cycles-pp.copy_to_brd
      0.95            +0.1        1.03        perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.11 ± 11%      +0.1        0.20 ± 14%  perf-profile.self.cycles-pp.xlog_grant_add_space
      6.96 ±  2%      +0.5        7.49 ±  3%  perf-profile.self.cycles-pp.intel_idle
     56.27           +13.5       69.81        perf-profile.self.cycles-pp.osq_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

