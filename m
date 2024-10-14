Return-Path: <linuxppc-dev+bounces-2195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73699C32B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 10:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRr3M0jTMz3bkp;
	Mon, 14 Oct 2024 19:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728894511;
	cv=fail; b=U3I6+s+2lwMQjcynzoHj5ZNZXvsyLVvvQ0w4e5AS68D4/p/QlMPZUXjL+z9qT3ALZeNOJGRZgH/seVby6YPeoQrUVf5HMc6DzK+HPBRg/D4NM6ytaTJeq1QrYy2tRX6RlnjJkOBzJgFdBiMi7OrMGyqqv1TGvQo6j4Y3ngc1J2eJfsDr53o6DEJyMPdImR61BXGkxPbDjDzV4Edo9+/eaxx1Pr6Dff+txLOInh9nNr/nNDZ00pveA9OmVBWS/bkoLryrfRhH5DHeieqyw+ZDsywb8NSz0HQ0V+b1wyyaXxyn1D+wy7SkJVd3iWEnyiTLC5TCgCJUBBm1AiWshvfqqw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728894511; c=relaxed/relaxed;
	bh=wdIHAujbv7MpYbWhsDDk81ueIDEBHddW1fPt4pD2VYI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CcdbuDZ6Nnk3mG77Hto/otYM61roZ2bivK/iPeqPjHkc7miFBS5JpDJLfjKTZGETSFW8dJ1ydXN50NWCsZHfe8LyjpYZi6Fahxf/6eeP58pkdfYh4eMCZcklrnKDTQerdKT9AwD/49pcI/Rpa/OiaJ8MuKWJjIcWvj4G/QTDRoNC/01W3OGWHfg2cYdz3+jbt8CWqF7uZWFbOZtLYhTCND5FDO8q+Wgpcl6NJJBz5Pr70K6EH2VwK/Gl9wGbjh/gVgMJNwKD4tH1n3fExen7YRBIUeiFXiE3M3OtEdWgL76hr189M2eRLJEAFny6egg9ye7MWSCYGGm5CDQPmQoFgQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9hXoP+d; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9hXoP+d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRr3H5PZDz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 19:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728894508; x=1760430508;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=WBSvAzrKK3tD1rsrWLLBwBD3ywmu/P90L6Qdz5ckulg=;
  b=K9hXoP+dqpBjGWTCyNHAN8lmA7G9m5SlhBI7bkIoiwk1tNcSPHoLWDnY
   9cXWrDjLJEIiOFGG4s/iA3OF5LpmUkQgcm6rYucA4G0OoVUh6kQ2w+b26
   BqUrB9t3a7OQW4hbiZTWjqixrd2Eo/LjM6ANkBNnvMlKcPImFt20vgMFH
   2mV8bjwY11x9ztCCKL2PzA5uIMZV2JOCzzK8W/tiIKpcT47Enn7WPUqzo
   nvNPWhS8le2zFpflPA1DrnGfau33Wa+lSee12kkR1yuwRvItFrNFANsrV
   mOJpQ5Y23jskZGsPT2CsLd8nniVYqy/KpNMGD8fDopEw+fl2dF2UV4c/e
   w==;
X-CSE-ConnectionGUID: ePRHTTRdQ96SBml3YgydRQ==
X-CSE-MsgGUID: Ati9JL8XTVe2pWUWAi5muQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32028738"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32028738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:28:20 -0700
X-CSE-ConnectionGUID: nqqYs9V8T7+FAri5o4lzuQ==
X-CSE-MsgGUID: o2zhUBxYTeG//1jEBEmekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77161462"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Oct 2024 01:28:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:28:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:28:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:28:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:28:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3xVpyWt+i3MNFvl9eg/fA2MhHpRKSsGq9H3mCe/eLEFjHM9DO4KljhIPdUqq0wOJHJuQuJFk16wY6YXgEy1UxcTsiuZlUt8PRZ2QcRxPmmcrv0BGSFtb6nVwzaYJtI9Bm6I3Vbh0gDImpRw8Lh2cvau9T5wVLSHSb6lIHJhDXWr5d2wIkdN/n2JsLzKidEf4G+NoW9ZoW66NQNYub5fyyjbqOcWXSoOUtm+f28x21cHX213LFi/Mns9pdaPh+ci+aAz7Uf9sSCGGgPtU2e30W113hmyXCkhXmgFqkIMqKX+K9hmRpRmkZCY1E69WgQxC8DurmJqjhhsKjS42jwRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdIHAujbv7MpYbWhsDDk81ueIDEBHddW1fPt4pD2VYI=;
 b=EYbor9Ts7JIxsvtB7Pj50bfph/FEipSMTwqGAmetAahwkkSUfFOsLdj3DNwVwTWfit7NguGCfXnle6Bexp+DJvHiD9nI+Ds4K8w0JFvmLWdeggVziUutaOLGuwESN8zCMfwyLdl7Qlw+G9oZVljbxQwhc7gOv+FfWX5axjVbxVUiiBcV4KlRS37k5rokJY5go0z54ivfZYum9pFIN0KGCkc2grkD7RZIOWzO/9P4lyqMbOePUdMRxqAxTlOPmq8AgCzGvH1qhU+BAtTHVARipeA148Up/MsZoa+sxEUcTdrZWNSuQQCLyi/+m0rGjHNyuflxAlSrfnla5A1CGrj52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 08:28:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:28:16 +0000
Date: Mon, 14 Oct 2024 16:27:57 +0800
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
Subject: Re: [RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy
 active mm existence
Message-ID: <202410141617.612a0f5b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008135034.1982519-5-mathieu.desnoyers@efficios.com>
X-ClientProxiedBy: KL1PR0401CA0027.apcprd04.prod.outlook.com
 (2603:1096:820:e::14) To LV3PR11MB8603.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c258db2-b9a0-46b2-823e-08dcec2a26a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xUkaHujL+rz/hE5291QSZ21DzKM/VAXM6oohZBb3TAGFTxpw1XQB9iVZofRD?=
 =?us-ascii?Q?pPh0WX91aXnI6wYmZDGEczdu1aTL7+62EmmdGAJI82JvkClj1oMEAd0SpvgA?=
 =?us-ascii?Q?CTlW/dK+mFUj34vAnUtJafTLbwS/kkRUoWaGapZGRw3pUi5LlN6753sNz0jH?=
 =?us-ascii?Q?IdHrbu/TZuBVjdvwPemlLW/AUfUCDAwAyzq0uv3GMdmdtH6xdqBDgDZLOgln?=
 =?us-ascii?Q?5F6WbilizSHbgHJrIEU75+qNKwp3/4vHIZVRZCdgyIYm0JIm8VPaYUoYjyOx?=
 =?us-ascii?Q?6FABiQ6i+d4it/B0sIBbYYlFl7nqGJ6uscZqlcZ412/P/r4D6zpYkQ3n0OhN?=
 =?us-ascii?Q?kARAAOBGi8Rojmj8wvO09abrjJXjj6NMREvMAzq5pRZOuq6zb3xoAZ4w2vpU?=
 =?us-ascii?Q?Axpn0GlU9Bkhw7PTHxK0kBGWcOI9rvTcqOIx5UGvCIsXBN9+yy/LRX4Axgdl?=
 =?us-ascii?Q?qjY+3JUZl5u7MHBGCwT2bUJXEpKZL0W85U1Tk6VfcWqM8Peu0B3LEpOa9QsT?=
 =?us-ascii?Q?LFwJJgCiIVMUX2zIwbeDsFqPC/ja/YI65ekdIysPaOb081Id07OpsrW7Oay7?=
 =?us-ascii?Q?3NQvJVp1+/bxMyLKWrarXc6xa/S+SToyLiTmDRhw8DyVIZ6MP0ZHhTBu6qdL?=
 =?us-ascii?Q?60j4q0KsMBRKNkroTL0/rJ6YOGfXTnRiQrO87YZD/4X/kYEPrbHwSg1cu9x2?=
 =?us-ascii?Q?YQo7Es5vUKSbJx1InNOwKgtri8mI7222B0jjdSoVZ0rKV/BGL3M5j0gnWtLS?=
 =?us-ascii?Q?e43KBwCqO0S0pPqa/XOGg/ww9WuXxym6f5kGRwZ7dmEDN/W6SUoM71irAhte?=
 =?us-ascii?Q?0GjAyyv5Yj3T8RD8yMVK10bMCbpRfjSWnLq7HHubcLG12F8dtulydriKBM6e?=
 =?us-ascii?Q?9zLHsYcwE1KfS7vH0/3Pb5mA4pS688ceXCxJHWJCSipvaAgI2vsCSZZHBqyO?=
 =?us-ascii?Q?mu14A3yJp7gG1P9/v9H2Mujczqh+wSqPvop0O6rSCzG/RwkjC9BKTq5uH7DM?=
 =?us-ascii?Q?h/slo1zrcf8WUlxE45cP3rmVR9pcxk7HZiG7as47nStscb58YIdiWpf0KSoq?=
 =?us-ascii?Q?3gZkJ+9I99SHqGDF7Zz2ywTclk0HiW2DiuLmBn5n6rgys5cWCEb0IUt5ZqSg?=
 =?us-ascii?Q?VQ4TmqZNzmFabwSqnm3+LO3Hl+WiWJuNrQumfjXVT2Ea1fGigfAj1bp37Ylg?=
 =?us-ascii?Q?q3QMEOpe/XsC///SG2qCC6EfGDcN1xh823cUuBnMaA+P/Ik/lgGEMUL11IM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eVxgTH0lGgb0Q70Dyf2dA6Vp23wvtd6eit/gDtZqZ3JXmlLgkismLpFRjy8?=
 =?us-ascii?Q?N4djgATPNNO4jY8FDewJv4HGkRx5zaTI+geBUe4AF3saR03w29evbax1pF0V?=
 =?us-ascii?Q?C/WZG2vnn1G8VpEYIvEPsbqmDiS2BBg9IlU4PkHRqAsCwU7nu1vpdz5f/vt0?=
 =?us-ascii?Q?4ELa3KzTOnkbf2o7h7IGvvULy2dPOUEykc7qAo8FUVn0/ZKvtdDGZRqkp+ZQ?=
 =?us-ascii?Q?K/vWtwNwOb7/obBxA+h9EaLGbtOMABqaabjl6635klV7n3yO0i8oUTwVMRl7?=
 =?us-ascii?Q?Zsnc0eEBqaagnDIdj2EVOfnW3tvv5zP+CFYnmZ488wb9m0jqdwgqurxxFZot?=
 =?us-ascii?Q?afaNMVWwYuXFyqVCU4TmzWG6Sa6FNug9ps5wRUdYSW73Xg9GccIweLHP6BkP?=
 =?us-ascii?Q?WemkyWmZtpXYhvaW3iZqfU5dF6YjnzHROnDNiEDxIwBpW9C8fxHtCTTU3pG9?=
 =?us-ascii?Q?YlGxHdL7rnzQA1XOYXLRnSrCmegosFW4b7rNQp61ISHfA5tuKieyfL5N5EFZ?=
 =?us-ascii?Q?HqjXM680KMHMYVWoj48Sddmm8wRjge6JSCr0otV4i5ja4TD3K/uyotleq/VJ?=
 =?us-ascii?Q?ETGjEZ8HPSbRzXEYm9wKu/2XuPhCsENpFrkViImI3nO4py30o37wSJ42EZp8?=
 =?us-ascii?Q?asoq8IalisykWoA/bCsSoiv0yLjpKDlY0q9/BfHjEDGp6bGz0ksulLvg+IKT?=
 =?us-ascii?Q?HvcJfGvOs6gZcwY6QrFIKT4ik//k5RLdaiwBfh4WmOR0BpYypn2kMQs3pM1Q?=
 =?us-ascii?Q?Gzub9fhZTeHESSEPjXEeMh7ux9nDTTfmrW36a/ok83gUA+hmR/X3M0UV5OSp?=
 =?us-ascii?Q?WoJPTSJMZ3KOLFliZT4lp+A+5Y6dHNIEX6l0UTsubqgxI+CAETHI3hREJqqG?=
 =?us-ascii?Q?kjP7u4DkmUWrrUiUpXIUWLx/15TkkLhFaapGz0p/pCRTXRTOnqvRjonUo7IR?=
 =?us-ascii?Q?XkoSmaGwxD+261Gzdl4Td88KmPKJI1NTVAx7wuDs6BWN+Fi3mNCirLLhrIND?=
 =?us-ascii?Q?csaUIu1ACtksM6qAivcDM3T+ekhanL2dXmtHZ4pJ9s8T4Lquz6IdijRBnLOf?=
 =?us-ascii?Q?/JJzGquulsexVIlqQlRoJHge+94cuPl0q2H052Wfh1X0bxCzocJi04L2nxgJ?=
 =?us-ascii?Q?83cUFnhjPE6uRYgisYVwvZh/ZzdexWs4zN/JDU/rm6AORmRlia1L+9mXF7iM?=
 =?us-ascii?Q?UqDZILvuMhj8h8HuUMljaguDvvdnaeqkOxFI/kbB/Jj6yzAJkE32YA+KW9Dm?=
 =?us-ascii?Q?taPncK3qRNLAiU0Q5h6BvHfDoUKD0AzFO9ufjo4iGic9yv4XgdWtgMmxU40d?=
 =?us-ascii?Q?EH0lt5M86RKhZAI50cvgnABONmmJVhoLyCkyzFOzNvysdFrG1ILnrwYBfMw3?=
 =?us-ascii?Q?8WoVu2Bjcsik3MR4XyBUHCcM9UCUF0ccMeRf6yqORXRih2imjQ0D6fs+DN99?=
 =?us-ascii?Q?8ysSuuoEea7uuxAix66ZKz5cqTeXuvd4n6IdyiY3ozc/JMxrSKPCyfFc7Prg?=
 =?us-ascii?Q?GztDkkoDOOym4LeyABqCQ8J//oGnZWo4Yar2uXspiQDhNDZ23gPEQc9SZYzf?=
 =?us-ascii?Q?z2ivtXlH6T/cf6kFaLgeGw9cIYYbOh9TpfOdf4iwAt3bVaflTrNquLHFK3yV?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c258db2-b9a0-46b2-823e-08dcec2a26a0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:28:16.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCt1ztcLhLWPi9RWXDYGzfdWRWCKl1U+5uRdXsbl/UXFSXbV0JMTz76y6V9tNR4Ns/YKVQ7yOkVrHHv3sQMuJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Hello,

kernel test robot noticed "WARNING:at_kernel/hazptr.c:#hazptr_scan" on:

commit: c1508707268498a6fd3ca5853ad65f9482c12374 ("[RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy active mm existence")
url: https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/compiler-h-Introduce-ptr_eq-to-preserve-address-dependency/20241008-215353
base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
patch link: https://lore.kernel.org/all/20241008135034.1982519-5-mathieu.desnoyers@efficios.com/
patch subject: [RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy active mm existence

in testcase: boot

config: i386-randconfig-013-20241011
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------+------------+------------+
|                                         | b62696cacd | c150870726 |
+-----------------------------------------+------------+------------+
| WARNING:at_kernel/hazptr.c:#hazptr_scan | 0          | 5          |
| EIP:hazptr_scan                         | 0          | 5          |
+-----------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410141617.612a0f5b-lkp@intel.com


[    6.951355][   T22] ------------[ cut here ]------------
[ 6.951920][ T22] WARNING: CPU: 0 PID: 22 at kernel/hazptr.c:28 hazptr_scan (kernel/hazptr.c:28) 
[    6.952580][   T22] Modules linked in:
[    6.952880][   T22] CPU: 0 UID: 0 PID: 22 Comm: khugepaged Not tainted 6.12.0-rc1-00004-gc15087072684 #10
[ 6.953685][ T22] EIP: hazptr_scan (kernel/hazptr.c:28) 
[ 6.954087][ T22] Code: c0 74 0a 85 db 8b 0a 74 45 39 c8 74 21 5b 5e 5d 31 c0 31 d2 31 c9 c3 8d b4 26 00 00 00 00 f7 05 a4 18 34 c3 ff ff ff 7f 74 14 <0f> 0b eb d1 89 c1 31 c0 ff d3 5b 5e 5d 31 c0 31 d2 31 c9 c3 8b 0d
All code
========
   0:	c0 74 0a 85 db       	shlb   $0xdb,-0x7b(%rdx,%rcx,1)
   5:	8b 0a                	mov    (%rdx),%ecx
   7:	74 45                	je     0x4e
   9:	39 c8                	cmp    %ecx,%eax
   b:	74 21                	je     0x2e
   d:	5b                   	pop    %rbx
   e:	5e                   	pop    %rsi
   f:	5d                   	pop    %rbp
  10:	31 c0                	xor    %eax,%eax
  12:	31 d2                	xor    %edx,%edx
  14:	31 c9                	xor    %ecx,%ecx
  16:	c3                   	ret
  17:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  1e:	f7 05 a4 18 34 c3 ff 	testl  $0x7fffffff,-0x3ccbe75c(%rip)        # 0xffffffffc33418cc
  25:	ff ff 7f 
  28:	74 14                	je     0x3e
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb d1                	jmp    0xffffffffffffffff
  2e:	89 c1                	mov    %eax,%ecx
  30:	31 c0                	xor    %eax,%eax
  32:	ff d3                	call   *%rbx
  34:	5b                   	pop    %rbx
  35:	5e                   	pop    %rsi
  36:	5d                   	pop    %rbp
  37:	31 c0                	xor    %eax,%eax
  39:	31 d2                	xor    %edx,%edx
  3b:	31 c9                	xor    %ecx,%ecx
  3d:	c3                   	ret
  3e:	8b                   	.byte 0x8b
  3f:	0d                   	.byte 0xd

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb d1                	jmp    0xffffffffffffffd5
   4:	89 c1                	mov    %eax,%ecx
   6:	31 c0                	xor    %eax,%eax
   8:	ff d3                	call   *%rbx
   a:	5b                   	pop    %rbx
   b:	5e                   	pop    %rsi
   c:	5d                   	pop    %rbp
   d:	31 c0                	xor    %eax,%eax
   f:	31 d2                	xor    %edx,%edx
  11:	31 c9                	xor    %ecx,%ecx
  13:	c3                   	ret
  14:	8b                   	.byte 0x8b
  15:	0d                   	.byte 0xd
[    6.955564][   T22] EAX: c6087680 EBX: c1061470 ECX: 00000000 EDX: c2e104e8
[    6.956135][   T22] ESI: c2e104e4 EDI: 00000001 EBP: c42ade88 ESP: c42ade80
[    6.956665][   T22] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010202
[    6.957266][   T22] CR0: 80050033 CR2: 0819cd10 CR3: 04033d80 CR4: 000406b0
[    6.957807][   T22] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    6.958380][   T22] DR6: fffe0ff0 DR7: 00000400
[    6.958747][   T22] Call Trace:
[ 6.959005][ T22] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 6.959362][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.959694][ T22] ? __warn (kernel/panic.c:748) 
[ 6.959974][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.960361][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.960695][ T22] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 6.961083][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.961427][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 6.961778][ T22] ? handle_bug (arch/x86/kernel/traps.c:260) 
[ 6.962157][ T22] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 6.962549][ T22] ? thread_stack_free_rcu (kernel/fork.c:867) 
[ 6.962955][ T22] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 6.963399][ T22] ? thread_stack_free_rcu (kernel/fork.c:867) 
[ 6.963801][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 6.964203][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.964544][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 6.964895][ T22] ? hazptr_scan (kernel/hazptr.c:28) 
[ 6.965279][ T22] __mmdrop (kernel/fork.c:895 (discriminator 3)) 
[ 6.965599][ T22] collect_mm_slot (mm/khugepaged.c:1455) 
[ 6.965952][ T22] khugepaged_scan_mm_slot+0x210/0x60c 
[ 6.966493][ T22] ? khugepaged (mm/khugepaged.c:2511 mm/khugepaged.c:2571) 
[ 6.966865][ T22] khugepaged (mm/khugepaged.c:2515 mm/khugepaged.c:2571) 
[ 6.967239][ T22] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 6.967684][ T22] ? __kthread_parkme (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/kthread.c:280) 
[ 6.968102][ T22] kthread (kernel/kthread.c:389) 
[ 6.968400][ T22] ? khugepaged_scan_mm_slot+0x60c/0x60c 
[ 6.968896][ T22] ? kthread_park (kernel/kthread.c:342) 
[ 6.969286][ T22] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 6.969628][ T22] ? kthread_park (kernel/kthread.c:342) 
[ 6.969961][ T22] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 6.970383][ T22] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    6.970758][   T22] irq event stamp: 4719
[ 6.971117][ T22] hardirqs last enabled at (4729): __up_console_sem (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:97 (discriminator 1) arch/x86/include/asm/irqflags.h:155 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 6.971790][ T22] hardirqs last disabled at (4736): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 6.972475][ T22] softirqs last enabled at (4708): handle_softirqs (kernel/softirq.c:401 kernel/softirq.c:582) 
[ 6.973162][ T22] softirqs last disabled at (4695): __do_softirq (kernel/softirq.c:589) 
[    6.973771][   T22] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241014/202410141617.612a0f5b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


