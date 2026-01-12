Return-Path: <linuxppc-dev+bounces-15596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0AD15C7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqpLw0rzYz2yFw;
	Tue, 13 Jan 2026 10:22:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768260151;
	cv=fail; b=eFq6V+CZDr5wyxPpE44yfSmN8Ta19iyaiYKjddEH276qwKHF1FmvFmVXw5EYuzfA+Q/lSn+dyvt4u3bAw8jnliRjpOKsayNxaefK5KXPoP6W8Z2DWnHnTGstw+EmTtbZoK3nL1CTvpsrilzZXOlTH8Ly3xotUDBEW2gvlzV2gLEEpFPCd+Xn1LeGDPmEHY8Xd8IR8J0nyxAwJBVTwR8lutZm7vMO6YbVICnRI+GQoR7OIkfB7GGBRB3UWWOOaFd/PiRKHSISTJ1CvmlnvgRlGi97/yetLqzLc274DoKlfz0x4LpwWFpmHcMinFAICSLGdTlxIR3uJyKDTB8DZd3Ezw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768260151; c=relaxed/relaxed;
	bh=mZqgfQFQQpWaLWqUKw1aDDC2BFMdBnyrtnoARslf3yM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IPvE4dZfuYiMo+Zr0IRYh5BQM9HT6ekkhAKS+aMfi4Y/SEaZFkblB+gWP6q2Yhsi0Db6yvcyn/Kkk3lXEOHAtZ5UrvA+zoEkZyRVpBVmFJhQEsNxzQb15qw0DoaPF8ZbM9LJfH14e1bqJbPnQtylHZD8If+B6iTUWzBwHjOHG45xYETy68Q6qwYyk1WWku6VNFI5OTpOumvJB3qhajmXspc4LQS0xJPqQYFc3xlOnKBNKkqx1O0NrTGelEc/zyp3cgUr9P150pyzgaBzcTlAGZtlLCpAyqeZhfssQ9KpEP9KhDqJCQFoPaHUZgW484J18D5zVrcM46V2IAFtY1ydbg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jELpQX4M; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jELpQX4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqpLt56y9z2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:22:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768260151; x=1799796151;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jPQpakIAcsMPh1RqnFwJNTqvDhUDTOQRF4RkeBMmK1E=;
  b=jELpQX4M3cXsybS/6B6+Bzmbxv37QMh+OlMNPmGlo/ct1wO+TVwuZaS1
   YWGBmgXKPWDZjWX3n4YNp+gg1NRcYHll4RIqsN+nUs/p6qYF4u9ApAfLj
   qwqSCWuVFDwqRMaGVFNauBHk1EdTCMqlAz+GawJwcCtCLlSOOmO1Jlije
   WCKBXceTpr+NHUQRVTtnUIOOBCuKKV2odX6bGhSKUTMHIp4TFabfGX0q+
   IN8vb3Ywew0BKGN3W3Y/pDParjBubIRwtB+gQ17rhx1fPCl/IJUbp3+Rw
   oH0xahikFQPeDuWdRYdHS6fneLOjufZa0kfN4qILZivNEFrEL5i/oO0Qz
   Q==;
X-CSE-ConnectionGUID: CIJ43KPkTG6CxFUrXCVYIQ==
X-CSE-MsgGUID: w49s0mPkTXCbZn1/4Z7EZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73385072"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73385072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:22:28 -0800
X-CSE-ConnectionGUID: hltryyidTQqLZc/5stwY6g==
X-CSE-MsgGUID: 3oOfHsJzSFuMDtvbqF6q4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204619022"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:22:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:22:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 15:22:26 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHZNBzxdNQqQRU3RMj2v2HMDPueBeKngkd99eVLpWIvxyP71lAk6WqGdZ63EsaintAuSCrJUYabJrchPznUWacgi2H3D3e0Xub4fG2a73TkRSZ4pjnjhzmd6VdlryclclXR0KWi4jMVq34z+rULgvyc31WYgnOjHpV2n3lT2G7G2pio1PiZvAcVJlj3RHU+JOq+NbRTCYQWEF8Zd4RrZ/af3FKEghIgn5qz1xwJ0hdKZw4WBpTYJfVut6Hi9AKd00nuaBVn7PIpgCqv3aHPGA4t/xedNTSLbnCxNLtcIfMOLm2sIRj8qq2O7l7U9AnrzVGyaNHNolwFPIshuWGSrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZqgfQFQQpWaLWqUKw1aDDC2BFMdBnyrtnoARslf3yM=;
 b=CyIMnPqw9O1mkhRjn4gnoImRzOWxWMj+Dx3f+E6HFDKp7BSo9Ag+G1inP0ipMDVOqRpHqJzDPYvAZJbMubGmHp37k7AKHCmNswuXAdTsmfnLs/gq8qa5xVSy9b11jZOGI7UAbUGyM7qTQb+q+BbWGFOPjQ+WA/hoL3gVz6tCza3HYJbzi4DWeZfGBblGVDJkKIEzRgHzVJz+yPRr5syKKSpxrHGzc7f4g/xkFTdG5xULW1EuDoKkumhnfbyTI5n6TkiRjtt5TsM/g2xzEgg9TDAftbXeZxoE3XfiZR/eaAW/Vo+PYZ5dhbVAtQHY1ioqFSzBPT1xlEH6NdEO5e1lcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 23:22:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 23:22:22 +0000
Date: Mon, 12 Jan 2026 15:22:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
	Balbir Singh <balbirs@nvidia.com>, Francois Dugast
	<francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Alistair Popple <apopple@nvidia.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWWCK0C23CUl9zEq@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 844eaee4-0801-4498-b2ab-08de5231702e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19052099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3UzSklzMFFOSEtDblJHd3pFR0NRKzNnc2FYdU5RbUVxMGMybHJaNlBSK0gv?=
 =?utf-8?B?N3dzeTlYZmI0T1hhcW1nNnhLUlBBbXF6K2RzQ3ZnWUNNTkVyY2YwVEhqbEtn?=
 =?utf-8?B?UTcwZ1F4anNldVFqblYyK3R3V0tpNnJLdmo5dERselJZSm5KdjhjN1dkc1lJ?=
 =?utf-8?B?bytNL29WK1JkTXlzZEdIMFEzTmdCTHdyRnpsWVhOcGlQd21CQ2xHRlpEKzgz?=
 =?utf-8?B?djFCbDM1QWNKQWNpVThQVnIzemNBU25KZng5S0g4eFFOcWRabm9QVHd6VmFy?=
 =?utf-8?B?OTAzM3pEOE5FcXhlMnpTQWFTUGw0d25vTVBrckY0VDdoL0ZSNlpOSGh5UXpj?=
 =?utf-8?B?a1VpaVBFdnNDb3dubE01OG5XNzZIUDhyemZicVlMcFkzckZTLzNVZXora0dO?=
 =?utf-8?B?dzFhSjJib3J0dXh3QTFERFA0Z1RSMW0rODdEL3N3aHpmR0dzTS95M2VpSlU5?=
 =?utf-8?B?TnlkMDBqZkpjdnhZbDc3UlZnMGtjQ0hqTm5VQjZaQWNzRGVNd20zaTQ4a2NT?=
 =?utf-8?B?ZjNIOFVhV2tqZ3VGZFNwaXI5ZXhTVzZpSnhkalZqRGEwcm1vNXoxaFM5SXpJ?=
 =?utf-8?B?bmpXOFJBSXMxeVF5SDBrS29mR1dMb21jUU4rRkJxbVFSTjhoNU52UGpsMXpT?=
 =?utf-8?B?SUtuMzNjYjdJTHhGQjJrTDE3NUVBbjV5MDJQbGpEMm9YbXlPcjExK1FXWERO?=
 =?utf-8?B?K0d4RExCdjN1bk1IVHNNd0xNQlVlUnF6RWtJSmlMWG9wem1ySmNhVXdKU1lM?=
 =?utf-8?B?ZnFRdHlnbm9TSGZZcGFvTkNnOEdDcE1nRjhubkE3QlpiaXFBWm5YRGVuUEhE?=
 =?utf-8?B?VHFoMFNIVUV4ZGV2K0pDYjFZR3N3dVFlSEt2UDQ4Z1Q5azNSRTlZNFBWY1A5?=
 =?utf-8?B?S3F6ekU2cHVGbzN5UnlKZ01LQnVyREJ3UWhXSVA0cmRtalJDQi9XNTJBdGkv?=
 =?utf-8?B?Skl0M1M1QWlzYWJIMkg1VnBldUI0b0NObjE3NS9JbEJlK29VeG5SZTBOUUpP?=
 =?utf-8?B?L1dMQVBVU2lGZWtVUGF4eHpTYzFpTVFka0d6U3krSXZWbXNFN0hRQ2doSlRV?=
 =?utf-8?B?Q3pJOEZxZnA4Nlhuc2FndkNsUVZiRFVZM0o0VWFweXlCM0ovb2s5Y29vYUh1?=
 =?utf-8?B?L2pvMnpDaC85eDNmU0tWZStkdStnWW9WUmNXRmlpalBZNit2NUpjSGhEK1Zi?=
 =?utf-8?B?U3gvYk1rNnYzYTNnZ1hkc1BvL0FJWXhabnE1YVp3NDJVekZiOE9SbW9MZWFt?=
 =?utf-8?B?dHN6ZWo2RzRRWmhsU21MbnlBQWlRUmJsem1NOGNBSXp5QWt0VjB0SnhoVm9E?=
 =?utf-8?B?elZMWVRXZ01IYnFwUkdyVzZ0VWUrdG9wZ2RsYko0R2VIdlpvTnVLYmFNZk9h?=
 =?utf-8?B?N1dnN2tnUktERjBtNnM1bWs4SDJNUndUUk1FNXpuYjR2OU9Ja1U0QXQzR24v?=
 =?utf-8?B?MHQrT2s0b3Z0YVVwNklsV3ZIQ2NCaFBJQjEybmw5YXZlUFdxRHhFVkc5a1dM?=
 =?utf-8?B?SUM1R3B0b0ZDUC93V05ucDEzQ0p5MS9mVmVzZ0RLQkw2RDZmY2dnaWVvTU8w?=
 =?utf-8?B?Mkp5N2t4WEVKQ1JVQnloV2ZadU9NZ0ptWDVyQ1BDWENJVy9BQkhaeEVzVjRv?=
 =?utf-8?B?c2dwR0lTc0pGdUlUWGFlVnpiQzAybzVINElYK2RMUmJvVitzdDNKVWdKNXVX?=
 =?utf-8?B?VHdMZTk3YVdZVDNvVks2aWYza1pWeDhtaTRNYmRvWnh2WnpIVU02SjhFK1VS?=
 =?utf-8?B?alV3YjJoU1lXN3ZPR2RtOHB6ZlpuTU5CNDJyYWcwbFBzNW1BbFUwYXBYeDNu?=
 =?utf-8?B?b2gyMVJ5VHd3OWRrNE5qVHJmVk11Q3Fqck9wQ2FKcDVVb2dSaXhIK3Rpb0Nl?=
 =?utf-8?B?eG0vc1FpOHVLaE5LUWpOcDErTGVuNkY5MkFmSG95T2M3TGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkE1THRPTUMrMFBQNTJnT1FTZWRlU1BucTEvZzFMT0crOElSQUsyMEtvalkr?=
 =?utf-8?B?WW05RW9LSGdoRWtDNU54TlNoMEFSNlhDMytsY2VHakZ6bW9GbHY3czZDSUY2?=
 =?utf-8?B?ckNhbmh5N1VGNHBJMUV4V1pmdVhxWDh2djdJNXFFVWFpUStyanhPL085anNh?=
 =?utf-8?B?OURKMTMwQ3NJUVlBUnhWbFkxL0JZYWZyRUZDdWErcHRiR0ZTNnhYR21QZDZW?=
 =?utf-8?B?c3JKb3A2L3VLeUFwTlM5UG5WNU1HcitaWVNESVp3alhDbVE3bVBGR2JoTDY5?=
 =?utf-8?B?Vzk2Y3NmRzZWSy9kNlRLV05pSHFURG5SUHNpcnVEcGplazN6NTN2YjBNV05O?=
 =?utf-8?B?dkpSd0RuR01wUVdxOGdpNWVaVTc2MkN5NmlTcXNzci9kTEFjZmNiQjZlWEpk?=
 =?utf-8?B?blcxNllaTFBpTm5YcjIwMXVUeXhuMFRWUXhZa2w2bmEvZW5kSzlSd2oxcW1x?=
 =?utf-8?B?dWNPbE9RYzlLUktML3pqNXc3cHJSLzFaQjZOTHFEcklIamRLN0tSa3N4TUd2?=
 =?utf-8?B?R09pZjRMMzY5cUF0Z3NSREtwM3RDKzB1NzQ5djd0d3BhbkR5OWNwWHQzWmFW?=
 =?utf-8?B?LzVDWllOVSsrVkd6elppME5EZW9RUGNkZXVGT0dKREtsZ2NyWVE0WWhxUFY3?=
 =?utf-8?B?ZlF4emtxaitvc1BNdDg4NEtwUWVHaFE2M1pNWmZaWVFSeHhBOVhvMSs1UDJl?=
 =?utf-8?B?ZWhYZDlCZHlIRFBTL0pDa2poZVpWZU00cUwwQUZDby94WWRzMGFKRm53eFdD?=
 =?utf-8?B?S2lZYjZ0RUJLZ2ZETDYwUkdCVk5qMnc5S2tRaUVjSXMwMmpoMGxKcVlqYXFz?=
 =?utf-8?B?SjVwZ3BMVlQ1TlZpQ2t4RFhXc0xQZmtnU3czSzRnL1RKOGRGN2g3QXZQeWJl?=
 =?utf-8?B?SkpJTk40a2crTS9lbjlVRjhmL2hwR1hCV2xNdUpWeXB3L3FjVDA3K2FEdnpG?=
 =?utf-8?B?SnE1b1M3VkRWNzArelMrWmlVOXE4UUNpTlpnaGFEdHdpQ0VLdzgrQ2k2VXVn?=
 =?utf-8?B?cWhYMXRqK2lqUEtYbDkzQ0o5QWpwZHZqZTlUTWxGT0ZIMmoyMEo2azVZNFNs?=
 =?utf-8?B?aHd3LzJmUXk3NFpCektrMjN1bzhRM2RJNFkxTndwbXAwUldoZTdhT0VpbU9u?=
 =?utf-8?B?blhDdlR6SVErSGxKaUUzMGhVaE4rM09vbVpoN3UxZVFJT3hkYmFTTlFkZ2RH?=
 =?utf-8?B?Rkp0N2ZXUnhtaWp6T3VEUE95RFVVN1IyZlNPMnJOcGtlcXpuYU5wTzVROFh4?=
 =?utf-8?B?K2t4UnFHbXpHdmFScFI0MlVnQXc0RGw1NVhhZlNMbHZPcnpRTWRuTzNMWktU?=
 =?utf-8?B?SDUxUFRvV1dEU05CRkJsVkkvVytWc2lKckR0QVBkN2xyaUFPUG5idFovSkRt?=
 =?utf-8?B?eG9Mdlc1UyszUU1pdmFZN2tDTHhKcDZyaUZmd0JIY2JLRVVqaFIrbDNkVkYr?=
 =?utf-8?B?U3gvbHByZUQxSEdLWi9VSTBzaGwwQUcwM3pTN0ZHUXpWUGZXVkV2K0NQMGlk?=
 =?utf-8?B?eUt1eWVoN2xuL3JmczN6a1lKRHc1T2FUa3kzVVVYN3J2RkVLUkxNL20rYTV3?=
 =?utf-8?B?cE45Yks1T2NQMlFpd3BmdGwycTMwcm1JKzRHZks5b2hlK2JBMVR5SDcxT2pG?=
 =?utf-8?B?MjgzYWx2R0kySDZKeWFpcmxXcUdoSGV5MFdTenUwWlZxR2ZyaWZ3bGZ4dk5I?=
 =?utf-8?B?YzFYV0FRU2hlSWM2dzVRa1ljcHd4SlBYZS9UY1B6MkNuVHV4dm9xaTNFQk9G?=
 =?utf-8?B?MG9KNWpGUHNITE0zME5YcnU1SDZybVMrT3BSdmRZOWdxZXBVSXJMRkRQeGp6?=
 =?utf-8?B?YkszTUd5S2pjRXBzSEl2enBnM3pKNUt3Sk5aZlZVWnNCMVkyWVAxWXhreW9x?=
 =?utf-8?B?QS9tMXYrYXZBWHQ4VzJoZThDWFc3UFJ2T3lOT1MyWkF4b1BUTi9mbkFkYjdP?=
 =?utf-8?B?YzBvYUNDcjZlZU1BMFZnNW5qQmlaSzNPaGhCNG0vaTlNcHBRRSs3UXBlV2FK?=
 =?utf-8?B?T0Q0bkZJaC96M216OWpNU01zWm5tUXJzRnFuL1NYeG45bHI0alpwY09MSExx?=
 =?utf-8?B?bG9SSFVHUGxmKytISmxEbXlWbjJmK3JiZnBPaklXREU1dlRzNmJxUU1WTWFU?=
 =?utf-8?B?TDI3Rm9qTnRxTzRCMlpxRUtnVW1iNlpvOFdMYXVlRWhqU0p1anFubGhLa1kr?=
 =?utf-8?B?UUJVby9md2oyYjhHTTZKOFdNSEIxblBHUGxCUnIzM1pqTTFuRHB1cjRENkNM?=
 =?utf-8?B?UDBDMXB3emxrRVNNNGlza0lMZ1piYzYvZFArSyttWXYwK0NXVTczOTgveXVk?=
 =?utf-8?B?dXA3TXZpNkFCcWJnMWRBNnRZRHMyMHB6RVp3MG1lMkE2VDU3SDlWQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 844eaee4-0801-4498-b2ab-08de5231702e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:22:22.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvkY9WQ+9x05XiPdQH4D0rlyC0PPkasaFgudw/3GCaVC+1YUCySY41PQuD6OxcmKI6T0MutqprDD38QcGBRbiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 06:15:26PM -0500, Zi Yan wrote:
> On 12 Jan 2026, at 16:49, Matthew Brost wrote:
> 
> > On Mon, Jan 12, 2026 at 09:45:10AM -0400, Jason Gunthorpe wrote:
> >
> > Hi, catching up here.
> >
> >> On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> >>> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> >>>
> >>>> On 1/12/26 08:35, Matthew Wilcox wrote:
> >>>>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> >>>>>> The core MM splits the folio before calling folio_free, restoring the
> >>>>>> zone pages associated with the folio to an initialized state (e.g.,
> >>>>>> non-compound, pgmap valid, etc...). The order argument represents the
> >>>>>> folio’s order prior to the split which can be used driver side to know
> >>>>>> how many pages are being freed.
> >>>>>
> >>>>> This really feels like the wrong way to fix this problem.
> >>>>>
> >>>
> >>> Hi Matthew,
> >>>
> >>> I think the wording is confusing, since the actual issue is that:
> >>>
> >>> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> >>> 2. but free_zone_device_folio() never reverse the course,
> >>> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
> >>>    be done before driver callback ->folio_free(), since once ->folio_free()
> >>>    is called, the folio can be reallocated immediately,
> >>> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
> >>>    the original order information, thus, folio_free() needs that for proper
> >>>    device side ref manipulation.
> >>
> >> There is something wrong with the driver if the "folio can be
> >> reallocated immediately".
> >>
> >> The flow generally expects there to be a driver allocator linked to
> >> folio_free()
> >>
> >> 1) Allocator finds free memory
> >> 2) zone_device_page_init() allocates the memory and makes refcount=1
> >> 3) __folio_put() knows the recount 0.
> >> 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >>    actually need to undo prep_compound_page() because *NOTHING* can
> >>    use the page pointer at this point.
> >
> > Correct—nothing can use the folio prior to calling folio_free(). Once
> > folio_free() returns, the driver side is free to immediately reallocate
> > the folio (or a subset of its pages).
> >
> >> 5) Driver puts the memory back into the allocator and now #1 can
> >>    happen. It knows how much memory to put back because folio->order
> >>    is valid from #2
> >> 6) #1 happens again, then #2 happens again and the folio is in the
> >>    right state for use. The successor #2 fully undoes the work of the
> >>    predecessor #2.
> >>
> >> If you have races where #1 can happen immediately after #3 then the
> >> driver design is fundamentally broken and passing around order isn't
> >> going to help anything.
> >>
> >
> > The above race does not exist; if it did, I agree we’d be solving
> > nothing here.
> >
> >> If the allocator is using the struct page memory then step #5 should
> >> also clean up the struct page with the allocator data before returning
> >> it to the allocator.
> >>
> >
> > We could move the call to free_zone_device_folio_prepare() [1] into the
> > driver-side implementation of ->folio_free() and drop the order argument
> > here. Zi didn’t particularly like that; he preferred calling
> > free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> > which is why this patch exists.
> 
> On a second thought, if calling free_zone_device_folio_prepare() in
> ->folio_free() works, feel free to do so.
> 

+1, testing this change right now and it does indeed work.

Matt

> >
> > FWIW, I do not have a strong opinion here—either way works. Xe doesn’t
> > actually need the order regardless of where
> > free_zone_device_folio_prepare() is called, but Nouveau does need the
> > order if free_zone_device_folio_prepare() is called before
> > ->folio_free().
> >
> > [1] https://patchwork.freedesktop.org/patch/697877/?series=159120&rev=4
> > [2] https://patchwork.freedesktop.org/patch/697709/?series=159120&rev=3#comment_1282405
> >
> >> I vaugely remember talking about this before in the context of the Xe
> >> driver.. You can't just take an existing VRAM allocator and layer it
> >> on top of the folios and have it broadly ignore the folio_free
> >> callback.
> >>
> >
> > We are definitely not ignoring the ->folio_free callback—that is the
> > point at which we tell our VRAM allocator (DRM buddy) it is okay to
> > release the allocation and make it available for reuse.
> >
> > Matt
> >
> >> Jsaon
> 
> 
> Best Regards,
> Yan, Zi

