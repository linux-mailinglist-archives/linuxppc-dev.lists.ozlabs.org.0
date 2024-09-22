Return-Path: <linuxppc-dev+bounces-1514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A597E191
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 14:39:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBQgH2Sr2z2xpx;
	Sun, 22 Sep 2024 22:39:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726966923;
	cv=fail; b=OiUPJiMV5JYWqttdR4pDCKiLPXh5Zx0ISZfQyjGVYc5JsrXJAYetlBZICfPVFTcHxUqZGSyH3z0cN4iR6fdGHqYxTEzLS69k+gtV5DKPCAz9ZmNk2l7xCrs+lLFjjaLE232fZ77wsYxjA3JYueghfT8ccfmff461VCwitJromlOxXmEd3Vul8QA7urAckRW/0mPPp3x3e9VyxXiaygZqu991rkZClZ4QhSXMzGgn18tXcmTsvqADp0JVxiZcJH8BKAvNsc6VLK9WV7c3IGEsjbIeY5IswXoHPl0x473ohnpm8vY2KTifKyrYsR9GF9yMn4SYEiCwEeAjfYe9+E93FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726966923; c=relaxed/relaxed;
	bh=HBwLTRHmjMGj8knW1yJfOClDk15E2fNTJtOrWycMx48=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BR5FilBqRjORafpif3cF9Ibq0UiVQTZAeEX8DrIyvjpwPZFTBZO5rOetyFY00/GeiMiz1ICYpoOz8/PfJ2h+6bK/RFxEaGKHsuTJCyESz5Rw8xF2sbT++zrmjGsnm7y9S/mrhJPPCmTeo5iuLs76QRJNrRtTvEjjOttFiozaSF2zi7e0QCcKWMVvk1+rCYjTYV8Bg7mcyLAhhAO2I9wqTYzfSSk/MO4TS4PeCigQlxAr3d4goOhzupPyqjzovJeLZDQOdIupQT97XRWH5wUZaxG88DKsUd15++yz6PitHCyXU9K+Dv0G0s3a+gAZdt/HdbZC+zm399PztJn6RZUyig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJaKEZnT; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJaKEZnT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XB7BL6mwDz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 11:02:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726966923; x=1758502923;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FLCB1dfYoLZPfE+WYvMRkRCVSt7PIYELiB0VKgcYo2k=;
  b=OJaKEZnTLyRGbDSTZ2TBz5Bp6kf7zorSb7kho6rT4yBXAYpxPrPLiMkH
   zlh/FL+5dyRj7Q/F4oMbYL253gF0K4wpCBKDoVUxF6Es2Fy1Mdp3neyYR
   18oGBlmn7wYMfKnVbwv1SqLGm2SW6bSRPuIno1lwkvxaqf08s44UGGtc1
   8Ajnmn6zjM6uFYJzjoK9v4rm6ToNImMPgAcN3c8UgoSNPBsOT1S93HJ3C
   hC7iPjtIExTDu4i/6FewNfs0Q7D0RY8xYZ/en69AYfYE328I9QhfWLqXr
   zOzuxY0vcaTO0idcTy13aokaJeov0MrZr/qIicSXAyDsMXQI1pcgoqvhl
   A==;
X-CSE-ConnectionGUID: cerCwwMdRfGrhwcPav23Cg==
X-CSE-MsgGUID: mBJ9nQi8TbeRNlj+oRJE/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48465898"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="48465898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:00:58 -0700
X-CSE-ConnectionGUID: zhTsFrp0ShSkwWz8RVvyaQ==
X-CSE-MsgGUID: iEC3Q+8qRLyEfjBZHCAhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75243351"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2024 18:00:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 21 Sep 2024 18:00:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 21 Sep 2024 18:00:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 21 Sep 2024 18:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2rzQ192AWZGjrDygcBVB8PbSWukvyBOBZlNUk///PvONwIkMN5kxyFcM7l1DaRkVa6qpj853wliUKVCfbxyfuBm1nNNJ5iAsbzox3jtlpF8RKVDV3WWI/d218wkK4U1FkaznByNvTlodJMB1DgAHmzucx8Qz04jTx6q7Fe/KRIR3xO0H2b1/f3flFT4kVwnO/5R5sZMrI2nMTPJs5SwLkpJnb3hMI6PHpIrCL87bydhYvNOSx3u10kLttYm+dq/9sef8PqYyzwZnVm7DObks5i+9/Ilpbys60oLhHeuCrmj4J+sRIiAK/92tV97qSN5v8GAmssB5nZ9FDIaLFGRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBwLTRHmjMGj8knW1yJfOClDk15E2fNTJtOrWycMx48=;
 b=SZHTXGV7EBVt0tZUNWchhzDGACbUombK+u6A/OuGPtut5NQEOScwG0vo+wC9ApHfqFGxjdZdyaGM+SUybiX0pgTeDRjJfquZpRxiMFNPiDPt6/KGA9UBeqFy+Sa7FDIiPT2jP1P12U+Ghebe+Q8qBQXkI6i+9C1P3lVhTUOmchUWpV9oOWBqOH0sMH+FpA4j8z6hVkWpfsWhTUY41B3ffzUf018ZUrlts/EdSwsAkGfzd3e62OFUGKndfznqc/Mwt7FO6G3nMqdB9XobB5owvlskGpYapsaJUsEL/EXw6+hvxrU5Rzmp6xvOdbR9R0ifbuNT5ATg2Zhx+LAg1BPwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Sun, 22 Sep
 2024 01:00:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%7]) with mapi id 15.20.7962.027; Sun, 22 Sep 2024
 01:00:54 +0000
Date: Sun, 22 Sep 2024 03:00:50 +0200
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <dan.j.williams@intel.com>,
	<linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <vishal.l.verma@intel.com>,
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
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>
Subject: Re: [PATCH 02/12] pci/p2pdma: Don't initialise page refcount to one
Message-ID: <66ef6c41eeb4f_10422294fb@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:303:8e::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4258af-e9e9-4249-a679-08dcdaa20290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vTMcuNTgxlj76lwzUlSXaVM8dFG2obg7uwU4ut+j2okO5QP0OJQX0DJE9R5K?=
 =?us-ascii?Q?3Ecgbab01YkmciBnuxPd88JN1hoeYrbaPclQrK8fCw6kH1OpbZEZD2zetw6T?=
 =?us-ascii?Q?nFEsRwehOFGRnU3n2ZnMMwVvZS6FZJQQIvmpkqytRadllJglIGzK1CT3tExk?=
 =?us-ascii?Q?yXmuPCG44/Q6OT49LuF1fV3m23rMQ2niOUrP0eZAepEs4Ez2QsOLq0YNgnWG?=
 =?us-ascii?Q?GPgcW2g/oIBPFqNUC43rc19PaUmLMkflvGRylEh5wFIef350AR4S75Isv6WI?=
 =?us-ascii?Q?8SE5MwWghhuvUD1aXd0LcD7A51iY21Wu80YgqdmUtmvsIuOwaiPqK3ixItAi?=
 =?us-ascii?Q?SggDN2evv8BG5RcfQ5+MkVHuNCtu8lDsYf0wiL3Jjc07E9aqMUARrsbPgeJj?=
 =?us-ascii?Q?l6h7GXW45xzkcy3u4ytKPwFXR/R6Zajb+NzhVNn2XaRtYFaIg6M2H+RzLuhH?=
 =?us-ascii?Q?YvT9WJzYilFIotM2tVyQ5jkGKchjkdyWqAbTMbGGtPhnBpi11v5ZIHfndsLT?=
 =?us-ascii?Q?e/dWMvytk7kg4PPKH5rqZrBHUups1r2gpWlgQxT9c4d/3ASdxE2YSTSGrlSm?=
 =?us-ascii?Q?3zBWMoJgVXjHW3mQ9nE8yqbjmEKPMSoqRMWtMaU5WLSMqJxwaBB1zKqi7yVV?=
 =?us-ascii?Q?2lRXHw7Hy6U/qFnoe2VMz+hE/liPbFJrL+GpBunOmUJZT5bJ45PjknpOvs36?=
 =?us-ascii?Q?JfNaJPgyKxAmb3hcNp0jQxydHSx7QTxc3lFYygKfGx9PlaTSvSneAM4avJFR?=
 =?us-ascii?Q?RxBhvvI+LioKaflArFTIPmhYs8gm9HJ7d6hjO9afFOPzWpn9aFfNn+tOj2Sc?=
 =?us-ascii?Q?L+doGPh4CEA1E2XCh1YWMJCS+HFlR1jGfh1WQY/q1FjXA86v3JxpL17nGh8R?=
 =?us-ascii?Q?jxh0ow9V02sGJBZt6My5bKK42oiEidyujFdPKUEAlf3gJ0ZV/7ROm5mXVANA?=
 =?us-ascii?Q?oJcnmGR8acaUaMNdkeBbquOcfyWJcmGQcG5lFI+fDdkG/hCC6jpvNW44ZFeG?=
 =?us-ascii?Q?T0P4Z4mHpw+SNk7+/r3cYhjHThhpAl2vVW3h3I4qyLZhQeb2kob1XogWxDad?=
 =?us-ascii?Q?Z3Gcs3GAlUQFOYPlZgSm/GBGDnEKjWVAV6ADGEVZ+qVFf0R3dUSOevOLqai6?=
 =?us-ascii?Q?yN/2Dk5MgrDFVIyBOR3e4hl0MLzEbLRDX9Zt57DJudIHKzK5z1g8qfPlShbe?=
 =?us-ascii?Q?FPhw5p3eRTuWLWh329Omd1TRTjEwByrjS6w3sCcqTP88mjo6NciKL59zRXLE?=
 =?us-ascii?Q?gtUDxhsHWX4AtHOLhKbZngH+Fg4nm5qkkWBJws7uaS6AGthawm2A29iXv9EU?=
 =?us-ascii?Q?xfA5a3aKq+VQb04k26jt/6cGPOHDcTI2nSBP+ZiZ/IOmFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OFdyn0ZTXIsQo6U5nA1dCEBPBxF4urDXVVJiFLFl/oI7GgikkNtM3TT7X2TD?=
 =?us-ascii?Q?Nky2mLs4LCbeu8J8IrvaBly7JY1+TaGo9UiBoH3BHqEUzDfcH73/lpfwq5q6?=
 =?us-ascii?Q?KXSFrE54U0MWvy48PtDAAL0jyAc3IGCHvrl3VREnbLsmwgtqBmmtTQQeQ+ye?=
 =?us-ascii?Q?KfcnFfqHxQgpudwlDDtHIZBI4q9tnAVuXukv/Puacn9/z0+eO72xei4rkO7G?=
 =?us-ascii?Q?Qiz5pWWYNjcZNKZ4p6BHvXxh2D4I3lyCRTd9i+xZ9YxPj3NQApAxyrU4eYZD?=
 =?us-ascii?Q?SieHPd/gp77VQFy6fIr+3aDkOoNHK9e6pSwBeQEXQUSoqoB2GSD0yLhtB8HS?=
 =?us-ascii?Q?PbA/B65htdUaOsW8D6vvN7gl2DhkgcTLaQx5YRlCf8nFHJNM/bS/QqQH/9jj?=
 =?us-ascii?Q?6S6zmp09dEipM7ze8q9bqJTjrl0dQi90IPdrZMvszE1gAu9XxdeqglT2yzSj?=
 =?us-ascii?Q?u2WSWl3Z9yE1kx/9vhdDElCO94IwidhgUMCrAC2T75VIihMPIkljY+4VkzOM?=
 =?us-ascii?Q?fnJErQYiciskFHwpjpXTf5bgp9lVnJf2AeA91sVHDDxFx8dvXaVSkkEAunmY?=
 =?us-ascii?Q?j6/MVbvMcxBSDJT/fAn3CQc2cV6DIsA1zZdewMEVB+8MXAt5qWOAgXgm01iw?=
 =?us-ascii?Q?NhTCjR/ysrj330/KXFttMqJS2tEsrs1wgmwFGRjJuNi83J6o8eYVhr4I/suG?=
 =?us-ascii?Q?fZ5Gg0NXDwbNVSvnjdcV58GkusoIlm6eycnAnmcSPorWUw9Nw3vLP/zpx1Cu?=
 =?us-ascii?Q?DPowhzMi+9D1gLlIGNcBPimXfT40QaUyIEkrkkiBOOdOf9aO8j8GRIt2FOQV?=
 =?us-ascii?Q?JeGS4eGf1uBWGRegIH14wHir/u7iXAar+mnIS55CwJ1Zbs10mc9epRuBA1vp?=
 =?us-ascii?Q?VfVKTZOihfJklKMcbBTKrRKNzMIbnN1mVPZ4yBbLsFvU0/m3w0Mn0RcYU80n?=
 =?us-ascii?Q?1qEYCFe64Xhi28/tKVeHN4SWA68om3CJrlMDNKnv8HU8TW4Ojg8YsMxpr8CM?=
 =?us-ascii?Q?pa/OqDRvz7kfQYNRh1+yxgaXtVWxFE2TbNFHNRmffUNiEFaNzfr8EIKzFjtR?=
 =?us-ascii?Q?hGuXurFUhFQCTGq1H9isI7Fi26pUfTbvXbzskdPAKVppGRB4XY0W65ocgB+C?=
 =?us-ascii?Q?d7ypYJraDdh7sBRMWp7rKIAdIJAdw1c0R2h5/imsA1hezbMJajQDq2FWNnko?=
 =?us-ascii?Q?xFxzgN9MXWIR+P11oSYUTLldklokcnQuehWp5ZJk92XCqR05EXVqNgOqoqHC?=
 =?us-ascii?Q?PQcUL98CWCXGJsYSH/eKAgM0QAzfdfOOc5fpHqZjcStkrnoKJFLV4xNMVdJE?=
 =?us-ascii?Q?ffrkRNf2Q39SLb+iS67wmKn8DJgYBDqp5XKH2d3JVZ0ufbPEyj3Y9BEqJGUF?=
 =?us-ascii?Q?GWUZBraIYFck/P4N5FPcj6fPiZljRqve6Q4Dh0n0AkUuU+XJOeIVv7+TFWNr?=
 =?us-ascii?Q?uU+mIt6Gi1Hb81lUiiVR7iJRpleO7CMQXDRcF92w7jBaCEWgz1xUyt+G0+bv?=
 =?us-ascii?Q?9/LRzDhQUmewV0kGo0i2lW/J//TYgjmd2fuZIxam7ZtcKZe/fmfwtjozZQQb?=
 =?us-ascii?Q?QeBBnrkUSBzlICGhIIfZbZchYphpKEoY+HlASKyR0jTouN9WeefuHD+YSkzp?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4258af-e9e9-4249-a679-08dcdaa20290
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 01:00:54.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y9WnaWA5fGI5kkoNdvmdwmsmEp5tOyV1B0Q3ohKU1ezhsh3aQW/G5rEOei2WkcQO2fXgKn02kGmUwBYU0gqwqkIjLUuY0XA3a1o8z1FqN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
X-OriginatorOrg: intel.com

Alistair Popple wrote:
> The reference counts for ZONE_DEVICE private pages should be
> initialised by the driver when the page is actually allocated by the
> driver allocator, not when they are first created. This is currently
> the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
> but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/pci/p2pdma.c |  6 ++++++
>  mm/memremap.c        | 17 +++++++++++++----
>  mm/mm_init.c         | 22 ++++++++++++++++++----
>  3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 4f47a13..210b9f4 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -129,6 +129,12 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>  	}
>  
>  	/*
> +	 * Initialise the refcount for the freshly allocated page. As we have
> +	 * just allocated the page no one else should be using it.
> +	 */
> +	set_page_count(virt_to_page(kaddr), 1);

Perhaps VM_WARN_ONCE to back up that assumption?

I also notice that there are multiple virt_to_page() lookups in this
routine, so maybe time for a local @page variable.

> +
> +	/*
>  	 * vm_insert_page() can sleep, so a reference is taken to mapping
>  	 * such that rcu_read_unlock() can be done before inserting the
>  	 * pages
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 40d4547..07bbe0e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -488,15 +488,24 @@ void free_zone_device_folio(struct folio *folio)
>  	folio->mapping = NULL;
>  	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
>  
> -	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
> -	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
> +	switch (folio->page.pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
> +		put_dev_pagemap(folio->page.pgmap);
> +		break;
> +
> +	case MEMORY_DEVICE_FS_DAX:
> +	case MEMORY_DEVICE_GENERIC:
>  		/*
>  		 * Reset the refcount to 1 to prepare for handing out the page
>  		 * again.
>  		 */
>  		folio_set_count(folio, 1);
> -	else
> -		put_dev_pagemap(folio->page.pgmap);
> +		break;
> +
> +	case MEMORY_DEVICE_PCI_P2PDMA:
> +		break;

A follow on cleanup is that either all implementations should be
put_dev_pagemap(), or none of them. Put the onus on the implementation
to track how many pages it has handed out in the implementation
allocator.

> +	}
>  }
>  
>  void zone_device_page_init(struct page *page)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 4ba5607..0489820 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1015,12 +1015,26 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  	}
>  
>  	/*
> -	 * ZONE_DEVICE pages are released directly to the driver page allocator
> -	 * which will set the page count to 1 when allocating the page.
> +	 * ZONE_DEVICE pages other than MEMORY_TYPE_GENERIC and
> +	 * MEMORY_TYPE_FS_DAX pages are released directly to the driver page
> +	 * allocator which will set the page count to 1 when allocating the
> +	 * page.
> +	 *
> +	 * MEMORY_TYPE_GENERIC and MEMORY_TYPE_FS_DAX pages automatically have
> +	 * their refcount reset to one whenever they are freed (ie. after
> +	 * their refcount drops to 0).

I'll send some follow on patches to clean up device-dax.

For this one:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

