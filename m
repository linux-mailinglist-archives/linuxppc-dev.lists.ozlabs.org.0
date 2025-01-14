Return-Path: <linuxppc-dev+bounces-5266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162BA110EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 20:11:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdz62rCrz3bhs;
	Wed, 15 Jan 2025 06:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736881906;
	cv=fail; b=ORvQ5PvTf/05ukVW03j+En5K5hqnFqlNyF8H0B27m9Nezb0ueCHmZNojRrCC0IGrLkBqjPvgikgtqzdU25+yVoj40r07OdBgZb1wNo5QcuPYV7oktDJcevNQXPlRaImArjkNubdDOLb9PehKn7rOGKL7B5nSQrl1SOkHLowtH6tVAbOA11akjaHYq6xmm+aqaSX1UknIxRB9cEMEZ2ZnY6yIbRio8JPlKOY2uSrjtF3dHRwFNX6CcqkblbWrup0EdJWUviV6kH9TnqrA8bthXqY8FJDCISernz6GFm1urtCG+sPXCpttIfUhJqMeeLXDUwGOmbGl4L0t3xVnA03dvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736881906; c=relaxed/relaxed;
	bh=GosC8ev9Dre2NLrhIrY9GiZoU/WeVVwbFZa2DMrQp9I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JooqL/E66LJtF3U+hnz952u3upD7PhCUpIqeVAiCoJPcH37PLAHrd8Vk6wI7UNojQ+IizpzwqQk3rmy5npFUqQjjx7/TJ4OH5hRJMF247y5zDdg6FMCvOM6CuxQ2hYTO60qEiLgeRFKJuJlo554K/UUtxGU5GpYaclK6ihXcDo+Xpl7OdSZDBlnbFO1fLY5qBoHI6yY17f7zJMP2uUMnFqL6rAtcZSxIo7w4Ri9QCRd8l7Gph1tBNnFL3BBI5oBzOwoKUx8jT4dycZL7lzbRUrpyXrvNm+pIMpROkYZ1mZS4bmSjAWV7ZjnhW5t77mFnaC+bVOrWUTxl1GJtiZAR6w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRpkojJY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRpkojJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdz35CvNz3bhg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 06:11:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736881904; x=1768417904;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x96bTXS8F+aB1rla7loASjmyzVz5XNs0swP7HCQFz9s=;
  b=BRpkojJYfxjB+1Y1XybkjBT+qGGIhVYdmfichakSvtKWMPPODe2TSwSa
   3X4n7KZb4t/dyWIXNliTqZRyHNuTvlC/tqtzPZ579NEVhL5WH+gRlLjiT
   EI+C4Ldk8fGjbe12mDWjs5O/mEs1oyYC33D3Gdc5AWbpcMOv0bx/leco5
   9DLV8nMixc/bCd+qQmb5zjJ6KmIRkIg56Phwy50Z4xbeKFIfSTtgNzeNn
   ymH6s3Wx0qKl2YWOYOnpf+BFZahSN2QxCfdlcnMOuOC2QUpjYrvKdU2YF
   UVCWejwqsr8b6Iehg2hxUxCYAh3iioK/GwUBIVYDQKRL92U1B+j4JYgru
   w==;
X-CSE-ConnectionGUID: 3dHGud+GRb63NstRNMrElQ==
X-CSE-MsgGUID: 0oP6uT7jSue+oOMEmRaEVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48196265"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="48196265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 11:11:24 -0800
X-CSE-ConnectionGUID: WIwNKjpWQNSAvnHyqzlD2A==
X-CSE-MsgGUID: aY8unT4QTeyQ7n/HyCyfxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105388487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2025 11:11:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 11:11:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 11:11:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 11:11:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y60f158+vhBLCVlYeEzUsjtCdCpyyxwTd0GNU4W8uz3Sm+ushax9WrRviG+nKqrw6D9qpSnU4KrAZDVC0OgZJJHfSHxPkIaANgWHwfzyKf5XE0RMRYLd8lo7jJdVdiQmlYDiOK90xKL+Q8uXR6jOc48aavp7vnQVtSJNAkKdFhKQNL7bkPq5KGEx04M4Kbl9xKfpRb6vPC69RxNZHDdfQVdvbMwzG9lNFU3NtkbjuItOijVjpmGipAMgzQIDUltX3fqQk3vu/nAggp0enzB2u4KKpyIGojX6ZeAdD8xLMRFG0GOaRR8Sm7ABS9YRvClI7qJH6TEs2mrUtn//j34X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myNyQUFBnItbIxoD/JtjDu/z6+OEkDpryaIDUw3V398=;
 b=kgDugOIGJSSxbPCnlXj1trS6hlafdN5+3nYftrdcG+g3pK+ytvS0qFlshN92PS1Sz0kFaSvpn/b4XRNzE2ZN7CVHrWolPgv1H+QC7XlXgYLxFUKSAsrcgZqo8l01KogWFVNfPc/RELt9e/rXSvdhRNsfBSRaxs4TxRlEsy3cqaMsMVNvJSCMUv/OUnXEsf9CNVl5zje6EmSikoGUwwkefY+psh7ITpJn1s+/5eNs3+thM6E25OeC1M4nE0a/Yz7xdnffakUso9DtUCOH/TRn6pDOg0GY2IekQuMViQ3LbuqYz5l92mn4gA19wOkC1VhS0RBgJa3cGjdLsJa49HaxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 19:11:20 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 19:11:20 +0000
Date: Tue, 14 Jan 2025 11:11:16 -0800
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
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v6 25/26] Revert "riscv: mm: Add support for ZONE_DEVICE"
Message-ID: <6786b6d426b83_20f32940@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <4983dede0d60686508513b3d9cfd26aed983fb7d.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4983dede0d60686508513b3d9cfd26aed983fb7d.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 010ebd39-2ccf-4f16-cd98-08dd34cf3a9d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qEUFFyL+aGwOZWp03EiYMKARO02g4//k/XDdBxbznhpOjWlYMs05sWE8p0?=
 =?iso-8859-1?Q?DJi8V4hUpAZHcjEaXTWzXaquG/mF9UNIzmExfjtdKgbytqg0H9540dHdQl?=
 =?iso-8859-1?Q?V2VCHzbBD7d2iQoeiU7kfRkIp6MMAB8CKpXRTkhdN4Vj4nDpc68k/7WuZs?=
 =?iso-8859-1?Q?iipHWN1nuToyC6efa/WkMWtGl91P7L+qDvN8Xhrreu32RvS8sbHztdd2ug?=
 =?iso-8859-1?Q?NGMFQpg4bj0L3WKUUEuZxUkc+MSoYeMz7KmUHWsR2BmbFSy9WNbm1dX7L6?=
 =?iso-8859-1?Q?HgBNeB1bCwK7oJRYrZN7pohc/+A96Vxm9X9TYZdQpNsXhyJ0eWUv7zZwhy?=
 =?iso-8859-1?Q?+n8tyNIbDAPB2GpKtJ3NJVBZft/C6hGlvAaUkRukKC5nqPld9+he4dDUb4?=
 =?iso-8859-1?Q?fxWMuno2i4/CGlAWSgYeVUrNw7653tBCER4zo1UsaPqlGD4dgeYJMEZJdR?=
 =?iso-8859-1?Q?xzRk41iu/3+6mDR3F2HZo+lAjJqoGsPpfkxEaVNXpmTw2FfSXKdpKM/O8D?=
 =?iso-8859-1?Q?7RofJ4DPFZHo5BVazWSlze1BOfUIxUOsuAtDVed4XUI/7GLkAdYCNoTfda?=
 =?iso-8859-1?Q?wtagXWdwijITuk0i04Sk10ydIFxdYy5r+InCime0Kgb9QMQArDo492KPR4?=
 =?iso-8859-1?Q?yxPsumk+Vw488DJpbq/8waiW3Kw0dW1A1Kjh1VVOahwwdwgzc5kM8VPBx7?=
 =?iso-8859-1?Q?EzWhxQ0KM8wpvUMdrIzzkg7OzGH1we5n6Nk6iq0kgfPEmi8PXtosAZfFON?=
 =?iso-8859-1?Q?fhl5pg3IG/fJ60VTy+cN/7Guk8rqfBgy0axLHUaYi5anZ/DYAjKgqI49ed?=
 =?iso-8859-1?Q?c6czUNsX6fzGXzp9iUPMVe2qv8zo5OLoc4HEowAjUhpER02x1XB+hiox9+?=
 =?iso-8859-1?Q?Q/4yMnOGZJblrt94FQsNYnEcIDppzq2PRD0AkOcxqDWMonzbLe3fGsaW3V?=
 =?iso-8859-1?Q?rBg6xKEivvAxXlGsxeUMSWCBlSJZCIh62uSRXZyTVjx/7WN+zm9reckoZ3?=
 =?iso-8859-1?Q?953xiCDAu4aAW+Q1uJKX7vfAchxouorjAmXD8EVKdQO4yPph++F27dfUad?=
 =?iso-8859-1?Q?Kqa7IQQhwWXc9K3IoX/xCBqHXop+8viaH1/GyIE0EZsqJm381MczkwG1Xy?=
 =?iso-8859-1?Q?xYKu+7Xh71VyRI4wKFEN+pA49eX/OODcZ2rhshHKO0tyVnNIniw0lz4NbG?=
 =?iso-8859-1?Q?/wdT3abbuofgkj4teNCkgARpsHs5mU1G66/1Zy9WNnex+lbonDf3xWA1s5?=
 =?iso-8859-1?Q?Zq/IRal1N2UUiuvqVxtoSPY3vRt4LeVPf/Xx27bfJ9lfmKrGfvke2MtLR2?=
 =?iso-8859-1?Q?418XyCB4mmrQ2JS+4AR9uI4zH0n6OzPk9CNMvmSJKeOoQDZQu+H6tpmC1p?=
 =?iso-8859-1?Q?VoeKn/NMdig53ddYwlv0o1ssRrcMkg0j/DYXtisne4tBU6z9pyOkg7kL6N?=
 =?iso-8859-1?Q?HfhPtHgdY5bIwyGy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7b4ZyheY3kiOC3epwTLh5YapdnnHXLtRl+DckpY2b6zeMsEZ8FkWCtdFiX?=
 =?iso-8859-1?Q?J6RiuRJZWVxX2n7SOTNTJJ0PBLbHf3LrBfFUEC1xy6QODAaGStRjFqcA4E?=
 =?iso-8859-1?Q?FBkko0KwbbUGUwFU6YOo8yDOsysuKPkE7YsEg7KCJ3vaV9OLbU+62LpoM7?=
 =?iso-8859-1?Q?LmEWBUfkcNfG32Qpo4uF5jpqFv03yC+PxM9uT9JvHtvF/2wAGXpicfZPOp?=
 =?iso-8859-1?Q?cIl4CKx0g5nm5vSPh2uIzO9Fs532e/ezX33/Qf2Q0yuveuiqDR7/zWdsMW?=
 =?iso-8859-1?Q?j1g7wIIzNcN8pGzSziWi07CvlCAxgmNctApfwRSODTYxKP81n/pHmaBSL9?=
 =?iso-8859-1?Q?Acfiw9B10asTix2ExoT39M/91QED6pVLVBr5aah7nyVUlq+0AAXabZiZME?=
 =?iso-8859-1?Q?BkB+IyA3R7Hg8IaYt4PHOZvBBAMaeK8kUPdHa9lNF5WqkDfrkGeQe1gEEo?=
 =?iso-8859-1?Q?slOsak9kj/ZVIBvp/aLPyYCSdWLB4HeT/48aHo2qH4cTYJFfucqu9OTGxH?=
 =?iso-8859-1?Q?ivKnzFMnzFDxUruSqhxcNZARM4dkqZP6U1mIOt1bzWktjhhHE+KeDp+ZkE?=
 =?iso-8859-1?Q?f+75Hf7kr6FHEUWEOGXDx3Gl37kyh3Epe3Zm1Y831hLge37P9iBRATxjcQ?=
 =?iso-8859-1?Q?4YwhFwhb+cuEyDBYEqIKAlYMZ4Jht71W5dqcoxKcZx/6nmvOhf3VOQLjyv?=
 =?iso-8859-1?Q?JQZM2/mr1eQHT9gI9C9QmARNhY3GcdbiYszwapv/LRh1UIHfRTPJ01RmxF?=
 =?iso-8859-1?Q?KS2E9b62GxWHOBB+72LcRSej6T6IvOGGjwz7Mx9I/6Rk7Pu8AM7WovkpcG?=
 =?iso-8859-1?Q?RdcvzsThLEgtEGhww6upnvYqdcywFACeCm9yGw/Ck6h7BDUb9zD92ZvV9Q?=
 =?iso-8859-1?Q?qetAzXGeorohSvRjeyOmmJtIuohDok6uP9Qnoi/np5ZO7xMW3Ldw67KMet?=
 =?iso-8859-1?Q?7TlhCI9lvwUuw4mpVlBD+zPqrQulLLWuwCxMJGS6s4kiHsE8UXqfT1bhQd?=
 =?iso-8859-1?Q?+azRWH3Si/pWYo2A2bt6OJ+q8wUeapAmHrpw4uPoAGjxwj0HebPwCOKBo0?=
 =?iso-8859-1?Q?zFiLPwQLfyU7+w5689NvXE+/2DP0ZOYXH7M+MC76rGbIRvby7M4YVkw+sq?=
 =?iso-8859-1?Q?Vkj87Z7Olyr6RWn2st6y6BVSvciZBbcd71vwMrsVhxDdW7F5Oq8cxaQDs1?=
 =?iso-8859-1?Q?dT7b3Qg5tsfK5nFvo9wvFi2E4Sw5EWO4fsj0bxAJFvWAAjfx3YDnCrSZQm?=
 =?iso-8859-1?Q?68LhHKwEO2IV+zSKdEV1+B0wIeb9b3K6kZXXYx8V6e+yGC6G7881kboGmR?=
 =?iso-8859-1?Q?kQs8z5fMSz0Bg3vRT/cRypWMS0vxqtcxR+ydcZDP9kyYf/SZm6Jrn2SXnA?=
 =?iso-8859-1?Q?fbuKhpEAEZOZtYc8vyB2UmRw15WYh+SH8uSWJSMdUbJpnUGeHkgQRK8uJv?=
 =?iso-8859-1?Q?2D/lXUBb4EF4+o4o4DoMXVreO4c5Qp0iT+zDQQe/iQThRuwI7K8LuutMpg?=
 =?iso-8859-1?Q?BaXsXwMk43kJVP8uyfqArTguqe8zYP4nqNt36AM3AXD6qDLecDVXojBYg0?=
 =?iso-8859-1?Q?YkguVD2PXE7oB8yfM2ohliqmU/kI34TJ+gDdXgChjKUSAOluQK82q5wNdS?=
 =?iso-8859-1?Q?QbXtZe1tiR+gpwk9/NSAU0grVlEhfhTrh+QzTyjYtAM7P3XT0Xxf3Tcg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 010ebd39-2ccf-4f16-cd98-08dd34cf3a9d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 19:11:20.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9wDK9JijPeeh0TuZkbMVO4+3QjbazE82bM0VjDLXF1SQ7MeHenAFPjZDsKBfuB8KaF8pRPbY4gRpCH5Y1f4+kCQZkKnTyBHyw43PgDR3j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> DEVMAP PTEs are no longer required to support ZONE_DEVICE so remove
> them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>

This and the next are candidates to squash into the previous remove
patch, right? ...and I am not sure a standalone "Revert" commit is
appropriate when other archs get an omnibus "Remove" cleanup with a
longer explanation in the changelog.

Patch looks good though and you can preserve my Reviewed-by on the
squash.

