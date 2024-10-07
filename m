Return-Path: <linuxppc-dev+bounces-1799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50D992FFC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 16:52:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMhv5399dz2yVT;
	Tue,  8 Oct 2024 01:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728312721;
	cv=fail; b=Q6NNRuF//e0zILVj6YCyeWAQK+bF2vSYcJ+H+h/1K2DNPeZQiPkRtPI/n/1OI8R34VX50y365l0ZtIJFZgfjhpx4Ml6TMwpCqIPTn6po47EVhKy0s1nBumFXYm/Rk0mYxAxsBVBY6n7aTtZydn2VcauF3Wq8PRWvx88Agm5ItYcKxCPPrGUnr6l6jRpeukPhoKUa+ebu7eTK/wT/xDtA8ZZHa1MqKkrJ31b6e/Kb+9j0oo6ii9JgoaNMURrNlDO9UIwG6Xv/mVbfzQ8c1mwZFBWzg0HDEJirgcsw+c4kr/V1S7+grAXg8q2udtvYvLBfgpzaWZBKC7gNkuPVpEZKXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728312721; c=relaxed/relaxed;
	bh=GDGkHWDDs45O+xh37RsWNxN1qd0aPGLeaRzDIacSw94=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jyCGX9TMkwFLUwLnIoGGrVbs69johoDC+bh03ia/W9UOKU6Z1vPvUNhTNWbHQY9zVJuC2ZPSD9yJ3Sq2eGR3xNfipcyLQTnad1iBLtmhDsQ6+3vzqUHnwj76n2ghkXQhlhQCyQ/cA+KQrFBJ/IkiSHx9sxctgEpekkQdxGpNJ+gmFseVu0IFY0I3JdulB2pyN1MHx5yK6S3tdpTXA3tnZ+uVhlBSI0UnINBIEx/9xAfaZu+oCE4keCaQCoNnZIr37h7FGvypYTqOYqS2L81IGvNixBV5xHGvfm1glxjorUVjn/zEv1QlzgGzJvy/nUW6VK64UcZ5q6iNZ4AIH4JZlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guoGawyK; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guoGawyK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 08 Oct 2024 01:51:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMhv21Gcmz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 01:51:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728312719; x=1759848719;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=3A9YSKL7htku69uXhnHVjUX4lNvCF4E9FP+ksbeWfHU=;
  b=guoGawyKuVwCX62Rdq1kJAN4gpAE5o8v0pfsLLKR+XAzuYTCwabV8YU+
   C2lPIuy1KOQ8XdOXgC+tNk5FhT+N7AS2EpRxrCCxgeCbXovUpJlsvujny
   yOcHFuRkfyBZp21Iklhg01q9UzLdCEeu9M3jcR4/Onzbr59YvIscNj6kQ
   I+KvvgTd3Bn5cm9B9YNGnDsmNFVn97Tk76Iz6dYgWbaTeWwxtOuxqxe4t
   23xZiiYojGCi5vnh+IpleVcp4oAFaHBSvImdOaJTWQN/YQdpinB9haUeq
   TdkRGYDtsMOjXXnUJzk3p7wpFj/Ei02PGCg5vhHECsRtmJ4SwgUiSXAOm
   Q==;
X-CSE-ConnectionGUID: mWDduWn6RNmfKONoht86/Q==
X-CSE-MsgGUID: MPTzRyPGSc21sAcadm509Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27405549"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27405549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 07:50:48 -0700
X-CSE-ConnectionGUID: O7fOJzwKQ46UA09kW3t4JA==
X-CSE-MsgGUID: Sg05UiHZR4O0bWG00VCvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75613655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 07:50:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:50:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:50:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 07:50:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 07:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQTnhIF4dqZE4aWBZsStoUiDOKfRF5uB6SljL3oJ1QW0as0g1WG1hL760a0W2ClgBzGleinQC+X80XHpzj77zF9vmg7Y8V9ltu8DUMtvrhZs8oflohGrMtzqq82c0zhBtgYncwBZE3pV7qZFQbTnyc1wvWz/+F8YwVLD3fCEM/OQewwPz6OB+6eQ943AwSOQBNbiXVCzrl7EZF2v4n8YlDP6xsd9fku8eEsGFARdJ4Df6xOCkfhIp2hpzZoSoq4I2SQpS03KPlbm5I39NmKJjU+FHxmbhKp2RlOjFZ/d1LNOuMk4K0XHVrDRpXivBYsxZoAN9s4DBccinugiXCwXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDGkHWDDs45O+xh37RsWNxN1qd0aPGLeaRzDIacSw94=;
 b=j9iJlOcYKjAINlHN4BjC/o63I7HC6ZP/yRcsu5zPJHO+8l597jY/imHWnNB8zpgnBeWqoi6vN6OzUpnS8WeBkHDXHlDMtgUPj7laLnyvtd+RlNKt0uAq3Ay62MumA8mT7JUg/u5b8mDQNtfFo97CjbeDp8VZ9U+O+idk1pX9VcBPwmmICjTh3jT1MhZAYKdAqjsJQWv//CAj4tZ0dZQnsisoQ2u7LRQISh3nIj1yL5kaaf0NQZWVjqFHOhTD67DLcf4Ti8Y+npRKihqwikiVrvE+upl4quxlDdojDgiakhpFTWmtOktVbssgNscNFpNmKZW6K8HpB8qArEjGWxE5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 14:50:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:50:41 +0000
Date: Mon, 7 Oct 2024 22:50:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Nicholas Piggin
	<npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon
	<will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
	<boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, John Stultz
	<jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, Andrew Morton
	<akpm@linux-foundation.org>, Frederic Weisbecker <frederic@kernel.org>, "Joel
 Fernandes" <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Mateusz Guzik <mjguzik@gmail.com>, "Jonas
 Oberhauser" <jonas.oberhauser@huaweicloud.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mm@kvack.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<maged.michael@gmail.com>, <rcu@vger.kernel.org>, <lkmm@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: [RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy
 active mm existence
Message-ID: <202410072229.18756716-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241004182734.1761555-5-mathieu.desnoyers@efficios.com>
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c6ed8b-5c6b-408f-e4e5-08dce6df6a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sRsm/F66TRQ8G5+5L+7FCRrl1NA6rzW4SLqrK6m80LLzqX6ui3IXZ10QBL6C?=
 =?us-ascii?Q?Wnx03Dl12smPs36saG8c0UBzoKjfTeAlaKu06kM9ruj4GH4Ru/rXlvU3CTFn?=
 =?us-ascii?Q?ew57VpHHvqL+jqP4Pb8n6SmFj1fZQcYxDtRFQpdSEhvIYm9B+D82w5twXeoL?=
 =?us-ascii?Q?VJiiUeD10FS0zgqJR09JOHYMOj23GZo3ulpjay6V47Nk8v7jBMmkRM7VolgW?=
 =?us-ascii?Q?JluFXCzks2T1X4BiIC8fhWUqTnFz9sVyr+i0eUCIu/GnboVpZ0I6wAuTi8J5?=
 =?us-ascii?Q?POt1VpeU2IPrDnHqs+GyrckTZCHyCb7gVyvhUQgblQw/QMIkvjO1dx2N4Ibq?=
 =?us-ascii?Q?0nVbqVhEBVXo81tVij6/W2/r5i4zjGGm+mTZFTNb4BDxmeA2wftFz0VlU15Z?=
 =?us-ascii?Q?BaFmKDJKrIaPWGwXEmNboTeYe0IHDHMjlIdlXlA6bQcWyM1tg9ctJWHCYLlb?=
 =?us-ascii?Q?9IMVVmZDQFC7iYeVZAm9It6otbtT0uXumNisUceN1ENbGa/TI0RBMSzRNUJD?=
 =?us-ascii?Q?Oa5xUQep1Fe76x7LvQp/TDtAi2adHPypSc+xkaHzdTE017N3CGa/kEhNE0Z0?=
 =?us-ascii?Q?2pgz6nnvzntqr07/njgzN+CafjIuG87Xqo7vJfUNakkbiTV075u/7x8qkxha?=
 =?us-ascii?Q?YarII+g5084tqvKuoQqX6QyE4STAWLBvFrtrcmK0tleGblE4FNYe18ciq6+U?=
 =?us-ascii?Q?DgkNbc76+s1WAfAheSNV0MwMwvHuR6PQofXMGlHgAYniRABNK7BT6/4ZXW5B?=
 =?us-ascii?Q?h5mJt03LQrWtYbuRBiOcRrhvT0dkU258nMgOq+wKIwX3LQWYjcL13AkWlSgX?=
 =?us-ascii?Q?ry6haFyWb78dkaMFaRFdtfVniexV0v6l8SuI+/e3SLRhsLaaAaAR2TZypxNy?=
 =?us-ascii?Q?3w5YF+w/95WFqLuVn/odXsFVsaWORucyiRoKlKuZVCqMjQNZxnuFGxFlnT2Y?=
 =?us-ascii?Q?+GJHC6HyM/fwmtrwyD3tFMYWHh6wtV74KkDGA4/q9t24FgyOpH3ZjS3awuc+?=
 =?us-ascii?Q?wLPe7Y4LsTdvdLpZCH9vhTYAdi/ykNqdlOdSM2LpIS9p7pLWibCGqzTin6yw?=
 =?us-ascii?Q?06N3q8glUYUc+91j8k3Yfni/P//NIMOr/xrRievt0qAxs75MKtD5aGp3//14?=
 =?us-ascii?Q?2Kw5kZvcnntoU7uSReDcWFBt3J6kue+YxH/Ng0VP7KvXqP3aqUvPXx5h21rH?=
 =?us-ascii?Q?T4HVALQcl+cz6kWyKNN5hIL9s0mawfIS3u1C1gry6peRSFJgqJ/owqqLFyQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iSidgc5pCRc0Pl/K5VPGQzIHgvz9Q/zEL57Nfjs8+sUvsgH2K1Qb4M+4tUH3?=
 =?us-ascii?Q?MOJHZcogjOEH18sdoWkzWTS8dPBufo1eD3BQufzw57hVxzL4DsIKkSmxPW4z?=
 =?us-ascii?Q?1oSGcbhKY03JUlxPSqvs289Ci5VFB7vvsT0mCIi349A1UO5dbk5Huj2fSFC8?=
 =?us-ascii?Q?EOXEUfDvYsZ8KMnyip1FgGddBb1v1mQY4uLEWYOJ/QtYqWLKB79PF8d88VhG?=
 =?us-ascii?Q?tbQRiZNcih4ik5ZMTsHm47thB16CqPVSMSMb90MdHg9d9kQMkYjkDCmUT3xt?=
 =?us-ascii?Q?9JX3ov0hytQgOALfQDhfwI6sK2fA5JhvRLhq11pJ4y4EQydYxsbHd37lYN7T?=
 =?us-ascii?Q?QTmVzb6V6YBgrMWXJYUHuFI5yvW7yNFFWgLUuwKtBBmU7cOeCKutYUc3x3bD?=
 =?us-ascii?Q?V7+nDpMZvkuBMmfSyfziAQcNWVdzvpKdJGEeXp0qkmTGe0g3htjxdQ22jXIR?=
 =?us-ascii?Q?UPmIPBnyyoZBApP6lL2XUdE7hhDsqpWV1s1612K/4j6fYvSMZRjRMHCfrjVA?=
 =?us-ascii?Q?a8fybkS5D6rts6G16NuGDtjSxQJQTrG7bWGr0BLiyst80btnxA15AIh5qcUR?=
 =?us-ascii?Q?6TAgtNYW2JbwhQ1WGdT5+wj1vfXIESLbX8lPUZxm43Vwl6vaITMg0SFbBYup?=
 =?us-ascii?Q?KxFYueWyMfrU5Mu61xXDjiOzlJjb4FGVyfM+prFcanPZ8EJJpxL15AY0q9ua?=
 =?us-ascii?Q?0TVlOXQRKK0i/vwkmwWZkrk93GpkQD2jt0/wmp3GVH6irnf7hexexBZlvWxK?=
 =?us-ascii?Q?cvB7tdsmNh3u3i41emZ9Rz2cg+ogEOwW2/8rS//OW/jp9BQrNOQv6FyG7xKc?=
 =?us-ascii?Q?QxoHORzGLFlqQTNQUijvd0+rJ3MM6iHDWS9lVu/OKbLBchDjmDx4aOHN0wDx?=
 =?us-ascii?Q?XdpNsKSt6BJruWoCkPoL7gcFlhG6LmAm+5GoQ6GBG27zgpD9hNe2J3UkO4gH?=
 =?us-ascii?Q?sBtbKcuP0Jvz84laY7xfEXiaeLiIKguv8yFXYsxQCbzS7fgSFTlaT6LfNVlI?=
 =?us-ascii?Q?JYa+cH3UTaSWoq3SyCTXMQM3mfktpZG9c30twzdZn/+WLAhwk5M8ZMjsru9B?=
 =?us-ascii?Q?QqE5JW9151SJ/uZQ/HQ7f35tF6fqt9am2PhznIljKnx7vr0bZmeBxsxBobzp?=
 =?us-ascii?Q?/+Hd/8DYHSr88TfFbRDELGKUi9TyM9Nf8o1ePMpsIxRegL4yxNWLduvPaGAg?=
 =?us-ascii?Q?+BMro3NvfoLoHLDZp0hN8c0H3x7++bmBI+q+Q599E6foemtSrJXDukOxD/Tv?=
 =?us-ascii?Q?4np77ItvUsxQd3Cui77SDOjYMZ5kxMB8RaYB8HEcFK4JhGc+JnGkCqNKGpg7?=
 =?us-ascii?Q?ILMEjG/7Y8H9QLiG4N49eM8vzHJydYhRPmvOIPmU4hRTzy8+9os2FwGX8EBn?=
 =?us-ascii?Q?q+RAIclkouSIwY7+zX60ydi0rqGLK5B9WGGDWm0aN+LhAdoHna5xsmPGTY4H?=
 =?us-ascii?Q?6sg/CPLPo9/shsn5tG/zYDywzXlkVt1zBJjnw6XmgXEdGikqUIp6uWnXTu7g?=
 =?us-ascii?Q?x8irWb91SVHMAO/jkH02yLr1ql7qUkbkAE7CZ30wi+11zthJRcsmxDyTrAJx?=
 =?us-ascii?Q?vZJVSoNPnL6w7oPe8qcR+ddzIOq8zuQtQpWOX8pqpS4N/KlRBQ7WpjzSd+T1?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c6ed8b-5c6b-408f-e4e5-08dce6df6a2e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 14:50:41.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3LQK6N6/vE0WmWzU1vg1s8z3LunDVskiexYrHEtpiwDvUfuxf+Yd9TqzIJDKK9ZFbvcZyhmIQmSDie2g0MkKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Hello,

kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:

commit: efef4da3b19cadf4beb45079a05643a77821de79 ("[RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy active mm existence")
url: https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/compiler-h-Introduce-ptr_eq-to-preserve-address-dependency/20241005-023027
base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
patch link: https://lore.kernel.org/all/20241004182734.1761555-5-mathieu.desnoyers@efficios.com/
patch subject: [RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy active mm existence

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------+------------+------------+
|                                            | 75b478bf10 | efef4da3b1 |
+--------------------------------------------+------------+------------+
| BUG:using_smp_processor_id()in_preemptible | 0          | 12         |
+--------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410072229.18756716-oliver.sang@intel.com


[    6.336856][   T48] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u10:1/48
[ 6.338102][ T48] caller is debug_smp_processor_id (lib/smp_processor_id.c:61) 
[    6.338809][   T48] CPU: 0 UID: 0 PID: 48 Comm: kworker/u10:1 Not tainted 6.12.0-rc1-00004-gefef4da3b19c #5
[    6.339929][   T48] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    6.341119][   T48] Call Trace:
[ 6.341504][ T48] dump_stack_lvl (lib/dump_stack.c:123) 
[ 6.342057][ T48] dump_stack (lib/dump_stack.c:130) 
[ 6.342065][ T48] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 lib/smp_processor_id.c:53) 
[ 6.342065][ T48] debug_smp_processor_id (lib/smp_processor_id.c:61) 
[ 6.342065][ T48] exec_mmap (include/linux/sched/mm.h:91 fs/exec.c:1017) 
[ 6.342065][ T48] ? would_dump (fs/exec.c:1409) 
[ 6.342065][ T48] begin_new_exec (fs/exec.c:1280) 
[ 6.342065][ T48] ? load_elf_phdrs (fs/binfmt_elf.c:534) 
[ 6.342065][ T48] load_elf_binary (fs/binfmt_elf.c:996) 
[ 6.342065][ T48] ? get_lock_stats (kernel/locking/lockdep.c:339) 
[ 6.342065][ T48] ? search_binary_handler (fs/exec.c:1752) 
[ 6.342065][ T48] search_binary_handler (fs/exec.c:1752) 
[ 6.342065][ T48] exec_binprm (fs/exec.c:1795) 
[ 6.342065][ T48] bprm_execve (fs/exec.c:1846 fs/exec.c:1821) 
[ 6.342065][ T48] kernel_execve (fs/exec.c:2012) 
[ 6.342065][ T48] call_usermodehelper_exec_async (kernel/umh.c:110) 
[ 6.342065][ T48] ? umh_complete (kernel/umh.c:65) 
[ 6.342065][ T48] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 6.342065][ T48] ? umh_complete (kernel/umh.c:65) 
[ 6.342065][ T48] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 6.342065][ T48] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    6.352140][    T1] ppdev: user-space parallel port driver
[    6.353841][    T1] HSI/SSI char device loaded
[    6.354238][    T1] e1000: Intel(R) PRO/1000 Network Driver
[    6.354673][    T1] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    6.650009][    T1] ACPI: _SB_.LNKC: Enabled at IRQ 11
[    6.968868][    T1] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
[    6.969500][    T1] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
[    6.970506][   T49] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u10:1/49
[ 6.971191][ T49] caller is debug_smp_processor_id (lib/smp_processor_id.c:61) 
[    6.971650][   T49] CPU: 0 UID: 0 PID: 49 Comm: kworker/u10:1 Not tainted 6.12.0-rc1-00004-gefef4da3b19c #5
[    6.972365][   T49] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    6.973115][   T49] Call Trace:
[ 6.973356][ T49] dump_stack_lvl (lib/dump_stack.c:123) 
[ 6.973686][ T49] dump_stack (lib/dump_stack.c:130) 
[ 6.973983][ T49] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 lib/smp_processor_id.c:53) 
[ 6.974328][ T49] debug_smp_processor_id (lib/smp_processor_id.c:61) 
[ 6.974328][ T49] exec_mmap (include/linux/sched/mm.h:91 fs/exec.c:1017) 
[ 6.974328][ T49] ? would_dump (fs/exec.c:1409) 
[ 6.974328][ T49] begin_new_exec (fs/exec.c:1280) 
[ 6.974328][ T49] ? load_elf_phdrs (fs/binfmt_elf.c:534) 
[ 6.974328][ T49] load_elf_binary (fs/binfmt_elf.c:996) 
[ 6.974328][ T49] ? get_lock_stats (kernel/locking/lockdep.c:339) 
[ 6.974328][ T49] ? search_binary_handler (fs/exec.c:1752) 
[ 6.974328][ T49] search_binary_handler (fs/exec.c:1752) 
[ 6.974328][ T49] exec_binprm (fs/exec.c:1795) 
[ 6.974328][ T49] bprm_execve (fs/exec.c:1846 fs/exec.c:1821) 
[ 6.974328][ T49] kernel_execve (fs/exec.c:2012) 
[ 6.974328][ T49] call_usermodehelper_exec_async (kernel/umh.c:110) 
[ 6.974328][ T49] ? umh_complete (kernel/umh.c:65) 
[ 6.974328][ T49] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 6.974328][ T49] ? umh_complete (kernel/umh.c:65) 
[ 6.974328][ T49] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 6.974328][ T49] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241007/202410072229.18756716-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


