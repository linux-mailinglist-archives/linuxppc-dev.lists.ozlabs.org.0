Return-Path: <linuxppc-dev+bounces-5203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC851A0FDFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 02:22:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXBFX0Cc9z2yDS;
	Tue, 14 Jan 2025 12:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736817759;
	cv=fail; b=bMc3UIsZNpKoOXH1ozrItUEOG0vdnN2WDT4BbMAisJo1ExvHf3hkU+VENwmswQhLN4/N/l636EnXH277uZKMbrTnHMxWoqtOm8eC+Z9lFpLmGwFP/kGy/D6Z/KOxKM1+Us6QrABA3dL0z5NUgq8eLWiklDNvnGyzg8PmME7GlyOCw31mdKo7r/s4ot9ycfcMFa2tawlD1CMlKqvwSAsANF+5+Og8ajlF7FznO9TOU4Qw3IkPSWOLROtjTwIi0U5rWd4Zihwoup6xv+y8pVT4S6g5x5spFRXSbGHQ3863/+PHcbW+Ezd1bJ7kHQ6OjhVdWCHePPdv1CoXwTGI0sr/Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736817759; c=relaxed/relaxed;
	bh=hzg3wXd7HbtSkbrQQqPMhYeIqiWoRyRcJjBeA6vmaDs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mrLO29OoL1DnMcElbaksYiufr+i5mSawORExO927uZGEIva5v/dG6Ax/7tcVMd6A52lUWYZlM8jQfu/cXRTY+l2n4Hh3NA6vFXVanZkGUFR4fv6x3ePFFWUpL4WLDXm/m9ofVpijWeboOSVdFSuCAA+FKuDvzbGCppLXnD9qACONduGtXPGFaTqfjJ8Jg6UpSs7tPYam0ImFIOnGzUFvlQNqjl5nU5GFdso/Yb0o4t4wiu7RfvGf6mAtL+1CWVjog5jQBj0r9/Vvgk0nmJtmyr2PhZh4igIer/7g4oJcaiyx0ErrW2/qfrXsS4tCjgf3O01+QJANxR4DkDDF4tA1Pg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flG9z+fH; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flG9z+fH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXBFV2r2lz2y8P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 12:22:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736817758; x=1768353758;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+2nEF3HC1uTx2WLAGJ3O+lAK7hIQEEdDthKTWPofEwM=;
  b=flG9z+fHrgHWw5vl4LR2DuOvgQHGxQd12TTJ69g1aVQ3pEu1N1fmFJC3
   MPQZsFRuZAo/1gO63sn6egBKiSfdeOSS/byfMS/7HHXS2WmSnZmT/rpsq
   se6BtvD17xMH56zw6qzHUqDSzgaZMmJE5az12Vl+Mnm7N6E/qJNIrsGq9
   6yXj+mhXXmGACjtmPVpJh+5HNP7weo0pN6qrpm2msug/ZWJ+/T0czf3wD
   AYPA5IdkPYedp8YsSACnWPldvPjuG458WRkRFvHNMYRQv+d8NPNva3yYb
   dZnMWW/qEjJoyzjUgsw9zAHXozMvxLZh+uLXE1SRuW8i3OqhrunlSXsL+
   w==;
X-CSE-ConnectionGUID: wmZtteumQoiIRzTZUguxIA==
X-CSE-MsgGUID: GA234kcnQgiy+w1z4VKcMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36989653"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36989653"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 17:22:34 -0800
X-CSE-ConnectionGUID: V8DJCkdBTSG9G6VVR8Ksdw==
X-CSE-MsgGUID: QuqdcOQ1Tza0PPhFFwXQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109781994"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 17:22:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 17:22:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 17:22:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 17:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0eXa8sNi1Uut20zXSrLnEYxau0JeL8xdJYVxv9F8axpxxq2aNEeNufbk5HcGR1Rh1Jx10rQqN83kZ4DQ2z+KrtVcUh16s8cSZa+ee36ZNjbIRlXBQ6l+ldKyj9PbCsY5Ho1Ud4gPBa2MF8ok2Id7tPLrsVS2HqSB8J1vjN+YDs0taaw/AS2TxRobkuYy52UnCpej/m5lBMdJeE8zt4+O8DtfcSgjZadozQXz3i3g9m+h9a7SN/pWo0Gu8DloNEBr7oC8LOiffYr1lCR/lgFtQl+7YBAd7qXAj3ywuZk2WDeLz3rziYXXPyrRBUVymX2xmKTFRGggyBXYvhITt87EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzg3wXd7HbtSkbrQQqPMhYeIqiWoRyRcJjBeA6vmaDs=;
 b=JbsoMR6REWVK36fzMW0HdderSYH1PTBOqmNBMDCZRLJ8z3H/B7E7E3vlCFDyIV18lpMEfdbq+2z/fy33It8qLOErzaoZ19eoKVY6Eb71i/zIgfIhz21sFcX4py9jGU3xme1SYXYk0TdW7JQ6H9w8Ek+IpQyYxZ5wY8DnQJca72n2uSvuZW6iEy/xlNR0sleF1QH0aeFJJkMGVex2C9R6fru6+GIGZw+Jtph9jQiFz0mBSCX6HazScdTyNHsR3xrS8NA0RPfw0OxcbW84icrDdZ8cn4GT9XTYrnvVTOYf2OrpHKqOw5jF7W0+ZjnS1c/e6sBeMv2qu4cpx+4Sx3sNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 01:21:44 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Tue, 14 Jan 2025
 01:21:44 +0000
Date: Mon, 13 Jan 2025 17:21:40 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, Alistair Popple <apopple@nvidia.com>,
	<lina@asahilina.net>, <zhang.lyra@gmail.com>,
	<gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 14/26] rmap: Add support for PUD sized mappings to rmap
Message-ID: <6785bc243cd6f_20fa29423@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <b70574dd75a9bf800bae1202f37fef203fd670b5.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b70574dd75a9bf800bae1202f37fef203fd670b5.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0389.namprd04.prod.outlook.com
 (2603:10b6:303:81::34) To PH8PR11MB8107.namprd11.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: e78f74bd-9e0f-4a48-fe88-08dd3439cedb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?twxFQwUnKYtjLmEh2XZ5bKgcEuVIetr0TQeQQ9IsFX0s0jbrqW1fvzez0t+V?=
 =?us-ascii?Q?2U/1Jgb4JurJtMU7gptiG9cbaVB24s3OiYwIJ9K2Gp8tDjQ7DKC8pfv8N9yR?=
 =?us-ascii?Q?OlYnlr8H0k9O9RW642MJqeRFh33wJvgPQTuZloqZetp2o+nKg2TJ88ItYOKE?=
 =?us-ascii?Q?icr9KfDSWD7nrwOKrVv5GBG0YC/wHyleS2hOR2Gg1lfaVgrb344OTAX6S6j6?=
 =?us-ascii?Q?pFCYXhtAjsYUlRnyzaGFsDMWE7EPV8G2qPqeQMoK5/4YWjL0GtvRMoCYx88U?=
 =?us-ascii?Q?Ki3LZrm93tg8rLG6Q7+uS6aW0NwzroYAEKqspStclfwnoR3h+jsatcn/3AvJ?=
 =?us-ascii?Q?2WYBI9FbVgOln+1ua6PvSsTVhf47yEMFaJ0l1ZIIbxT2ZCpOWZlxJBgesBoB?=
 =?us-ascii?Q?nSzBq5whkIf0jOGUhlKIHFutEg1R+hFjGN4mlDahRjcyy/3+TBfjIKA52/Cv?=
 =?us-ascii?Q?yT2API7PEd4vqMDfS9vg0gyJDO3u/hfHE2SwT5nmj5XuwIhg1uCkHbsY+zTX?=
 =?us-ascii?Q?bhuFp6aT6BY4J8tnsA3aWpCoUOcUrhXbbI3HMEnH3of//Un1rcHu7cri9Hho?=
 =?us-ascii?Q?lZKzzRvAGTMZvopu5Jnc/+upl8POCjSLxKkykO2hfg+QrCpfSrhRo9fkDR4d?=
 =?us-ascii?Q?m7U+IIfxOu2adylN8iSJ2CTFmbWv6+EO4hsw6WltpPWInrrIPkdmBQV9c49y?=
 =?us-ascii?Q?YQU3yKV4Own34Jl2Qi/Ws2Re5vou+5yZlNac7LDyFnraSA88syjU8ELVwlBP?=
 =?us-ascii?Q?1j+FDdnvc3ll61H9H2/6mcnLxG6Y2ITXoXAT8otep1ezdKrxYFQweXVWx7c/?=
 =?us-ascii?Q?N65BIBkTsOiuhVoAy74CEms3N1aLrX/Vz06JDoH0Bt+mKjDHDYJ2veuiP6GA?=
 =?us-ascii?Q?N/vQz4h8kBT1x6eo7P0j0yP/kBoBFk7ZDE+HAcWPvNvqaYQMqNnfx4BPWRBK?=
 =?us-ascii?Q?RvGF+NnpODTXoKBROFQeEYuLH4EsdQ+G9uongOc9tjKs9+DmaSIQdYG2+GOs?=
 =?us-ascii?Q?9fAKlB0i9p4rHcn874GRJI50t8GUHOrq1aYVXFPb9SOVtmnF2zL17HoUa51U?=
 =?us-ascii?Q?7x6bdT3kAVxzkYGtiDqAPclyiJTbDu9VWjrnhJHwMlNwcHvSH4vQ8NDzhz+7?=
 =?us-ascii?Q?UhHF32590NzAApCZ9XGmats+jSP/wjZgQrSd0+b6Uiynh7gZ2cPYy2W1dfBs?=
 =?us-ascii?Q?Axm2lVCgkGOoZGnmKsmp4M9mdwdBmDy6h5WA+tT92NrXsfTIli3nccdiQOzu?=
 =?us-ascii?Q?7eCON/uSJML3pSE0jp+zBiTo+hK+ZJRzKsQZq/K69jrwD2O+7z4VgeMO2Gsy?=
 =?us-ascii?Q?q5W1VwmvvYnqxPY1yD/bMGVnyWUjoJoGoEwX3x8S++jDN7Zg1+yni6gnmzn0?=
 =?us-ascii?Q?2v7kBzMTtL089rIdEAIYydvLxz2l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tvrnbj50+BUWdeyWuWDRJ1qN1p2s/MVf0Ji+KJB+m5qlfHbGmZV9ufFZ7bfQ?=
 =?us-ascii?Q?stNxhFnS6BWf1oe9lDKpuHSq1MsK+XGGNq8YzZpqb0huKAUbQSH08KnFC1Tu?=
 =?us-ascii?Q?W2ClKMzS1QEuKyMDo530jL7RcOT/XpinKDfOMBDEIPKkP5qa9BT2j2gSzgEj?=
 =?us-ascii?Q?M6VIEQLG5/1dQmjOkj2O3WqqTyVAAPfJtyUZtcT3i75PA4AnEJSAdknxo+nU?=
 =?us-ascii?Q?ht/V/ME7QwsR0ugfg9nD2XNY0rov7SqlmNZma1B3jBdk0gl5JyRHW7X4T565?=
 =?us-ascii?Q?k/HuyIeY6TDcMC4wa/xdNE7dPxh9CK/ql+ou18y2j770TVwJClzLKl3pFpo6?=
 =?us-ascii?Q?CcQhosQeB/PmdVjCDJnuE0AGd+Kr140nuI9SbRP0kvKbg3NLGdepYRpzo/yP?=
 =?us-ascii?Q?tXf/RlM4h7QXtbc1fpE31IDWRgvEisx0YxkWPTlXeO5JaT+h2ZcJbEtGLG+b?=
 =?us-ascii?Q?t1bEu4a73l4aWBiWyf0JA9SwC1um8J7JkLhtrDj/D0lrjruq+1uJosBefW3K?=
 =?us-ascii?Q?n5A3T2B62/4Zj82UELvI7nV8DJjfBHUHylN6Y4EtWM8Z7NWIDSnB+tcabKAp?=
 =?us-ascii?Q?3BdELN1yeVeTDFKuGxfIjgGXBcU16X6MpiOQuYtZKojizFtjrwoauK8RqXuW?=
 =?us-ascii?Q?NhMtJoEuDHkSKHjkyqFJ7ci3F/jneBRsXG751WBR4LUnFhV+pJ5glVj+JIf1?=
 =?us-ascii?Q?kNHmpE58krYn1EHQCf2bzSbZcmcJ3G3YaubXYbFURbdqSx7I+pQ22fJOa2qa?=
 =?us-ascii?Q?rOfVXI8evdpj17PNQqd9KNv4sIrhBVqmIRxxY2DJhkB+3Dk+Q1ljaJ7AuBSn?=
 =?us-ascii?Q?4/uUK7xPOAFyNhR9Lxl0C7Q4soWnKjiiMqXUsSmSEn5WHdoJK+bgU3BjfUAf?=
 =?us-ascii?Q?HvCpLi2VON7XwghMEFGBaY5IyAWuq28k31uh0mADwXajdDZhrYJN0ZFP8JUb?=
 =?us-ascii?Q?QT8yySKccQ2Y9f2WBqVtrVNWv+ODGbhb6CXD7sBcJZKfkQau5d65eKophcfP?=
 =?us-ascii?Q?exPpgX4Y3+4bv00dRt7jcS0QpSbYXkfpgSsuQGfF2u22XsnYSiPaipfF1GNM?=
 =?us-ascii?Q?AHyPJ7fQwUHvA8ZYBWozqr1ji9C9lF6X5DcIM0wZ8h+D/4kdlBnQKnblDJiL?=
 =?us-ascii?Q?L34DcqNGEbjnutsaM4B2enSNbYjRutX8LWfKm6ArAcp4GaC52A32w3dG9lYz?=
 =?us-ascii?Q?Yk1dYb4IpJElZwO34BaUiS4VNRgjcT0G1hzHE9EnpSMKohKCBug8FRCFO2O/?=
 =?us-ascii?Q?IF1fiCbFyesA2c97cEeOlCbnoM4bg9MUqu5YETJGT4rdPJlK+0g7MEd8pTaR?=
 =?us-ascii?Q?xagNwg+pVtkIc8AuQ10JBOamR/C5Y4eypnfbhsrJ8C7DAvvbStX041bgX1iP?=
 =?us-ascii?Q?zYFM1zI1UV1sp+D+cuUlFvfIRopX9uVKa9vEllgZgRLz0ImdAGHTqWr7X281?=
 =?us-ascii?Q?/c2zpCQcFVLxatZ7bqORinm6uQQL9q7qcy450WPHJGQhKtU/KgBZJa42zZTP?=
 =?us-ascii?Q?6TBIhOh2xKbCb5zpdEKS8riP/69AtzNHgQIIofPG9wkjq8GPTjQAx+SK+HIl?=
 =?us-ascii?Q?U8YO2ZHLMQ5T3Sf/xyFN/nmFzpvya/HOZXf7yNNQATUyDzVoIXo9cqFXyNAz?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e78f74bd-9e0f-4a48-fe88-08dd3439cedb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 01:21:44.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scezxpiG0VV0FQRkIeVAdsvLKIngi3g9AkQYuMA/PsyPwZn9OpDn8JJPqKDqdr799fnB0tZU0vNeS/erPiobf3A0fLcMDb2fjpO3HqdVUUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> The rmap doesn't currently support adding a PUD mapping of a
> folio. This patch adds support for entire PUD mappings of folios,
> primarily to allow for more standard refcounting of device DAX
> folios. Currently DAX is the only user of this and it doesn't require
> support for partially mapped PUD-sized folios so we don't support for
> that for now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> ---
> 
> Changes for v6:
> 
>  - Minor comment formatting fix
>  - Add an additional check for CONFIG_TRANSPARENT_HUGEPAGE to fix a
>    build breakage when CONFIG_PGTABLE_HAS_HUGE_LEAVES is not defined.
> 
> Changes for v5:
> 
>  - Fixed accounting as suggested by David.
> 
> Changes for v4:
> 
>  - New for v4, split out rmap changes as suggested by David.
> ---
>  include/linux/rmap.h | 15 ++++++++++-
>  mm/rmap.c            | 67 ++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 78 insertions(+), 4 deletions(-)

Looks mechanically correct to me.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

