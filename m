Return-Path: <linuxppc-dev+bounces-11114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E67B2B73C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 04:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Yr00WfXz3cl0;
	Tue, 19 Aug 2025 12:46:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755571583;
	cv=fail; b=cLAXZSj2vdCIf6lpVdbhsG8+H0bUJMkwJtQpPGB0OCRFeovV9Ya7CvAhH8sddoz9a56DeO7GVfKKj/rr1tvy7aWPgIFCnbHqMbipivby2OyKpeLylyuJuCX06fsh2GzjKRRWxFomYAVlFQHhrYY46PZz5FXz2IX8zB1sICV/E4KVlx/qkc/O/10n/I6KwwOLH0Jl+Zk5NmnUgtpby4cifnmkDbtV9r/xKEZBn6IgLf0H9ebXN8haMIDIjhSHDuR/DzOA88YbrpsSQAUaUHVMYSjGvVNFmaNGDKBPA63yLOIjW4TqTBw4MGo796aY2p407OqXkdnLiwl7EL8RgdNkng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755571583; c=relaxed/relaxed;
	bh=LVmDpGKhzFy7+qtiUB7NCMogCLhINPZStbkOSeJvbAY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lsJsWbkgYeLKgVmDvs6aGGGROmhz7hoes2FTv+DaeNF21yQ6Gx/wZQo1QtHqSblIu9m9YzgW/3EV5jtQ07YGv2kq0VUYey17i0ssCIQO2D8gD47JE91iUA/koKl4A9R1c6SU/VZDkNXbMCgnySoJRfGHkRMexCK+m6euJF+M4AZ/rK/SFzHdgt12rDXDZh9XWbsVI6O6DloQQBfTxNAlovhKj36QO7IOJPlWXSrKv3+FBX+3hdh/D2B/ofcVuR+GV5tIaHWWTUmqmA7ITLWKq4F9mKpuqdqBu7whsajvRfSVOBqrTdhh1aAzB6EhKks2rYDNuP+uCiqPxCJPmVAsiQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5zxWd7W; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5zxWd7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 19 Aug 2025 12:46:21 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5Yqx0531z3ck9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 12:46:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755571581; x=1787107581;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=CayFT9s7VcOTxRjlaOoNz2kqxx2ROPV3p/+xFr8rw7c=;
  b=P5zxWd7Wii6Z9sBefGiioMqS7t1zdHl/5Nvv9+7n1EzoHobIZSnY9gEu
   nehU3YsR1MGw+fBMHx/Nz+O5vMe6JTqSsnHSRFgbvY2B39v+Kfusm5d43
   UFL+pCEFn84CIRAw2B6FUqeA90xDXgkwxZceJgONwPzoaQj2zOXAvrecP
   rtqvsdipq2obXdinWP8l/YVUszs2tkkuUJGvK22mevtTvOn5Z85qUJC2Z
   u6ePZlARJZ0j2JY5qHG8bj8WkiW8qnGdcohHW5IV1HJJLzgDFg8Otd7t/
   eRTa2/aBtRCenOScNL1ZZ6FVV9WRvqoecIPI/IaZDGIfPylaCV91FDWFa
   g==;
X-CSE-ConnectionGUID: LN9v45k2QMONqWG3z3hY1Q==
X-CSE-MsgGUID: TND8/xcfQkOTMQnVTQGX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57876442"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57876442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 19:45:12 -0700
X-CSE-ConnectionGUID: iOm5DksPTjitZ/uJ3IHZ0Q==
X-CSE-MsgGUID: zafEqcEGRxeY97/srj4f4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167241211"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 19:45:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 19:45:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 19:45:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 19:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y06oIgppVj+2q+BvvxBOmAI/+xT66KGAlZ3iKcgrSBfA1q0ydZrzPRQ8KCltaEfE3CfGKDz/IT5IkgdyiomjPtluR//wsvosdSzwBwmxLzPrctGZC84sHinZX2L74LDT4W49rfUIl/KTI/5NYZdmBrnk61qHIpaqkGK1d5lTIbAaO1+vlJ9Dp+NcI4iN+0xIcRLxEE1wtrj/W4GJRqLAPJz98nuMdm6rAuLrYRYHkpRjVWmhKUU0tno5injzeftie7Ih/Inhasm4FS4hocS7vS82rEHp5FzbY8eCKDptfwQOLAnO7+On8UtuvUIkfDgNDiNQ2haEI68NVXk4BmgzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVmDpGKhzFy7+qtiUB7NCMogCLhINPZStbkOSeJvbAY=;
 b=udmJ5ywDr/Gymo9O6q2+95WBjX7SB/4SmMDgh66nQwBmbJUsOc9KXYFIJx8Xjde2XCBaTb7x6izOtW1JlLVTcge8bSOmBPocirsk4cHWyXgzURFLJSbtyW2K1V0RexrQEzOem5HdLCBm6waLEVLu2M6ExnRgjcnxUo5hGc9TY/JnUhxr/vEj8qzz4GX2OjAT7VnjEWVFg0PQJegtlMnjecf2PJIr+qFePehAh1pBDkxuO5vZ69AaDWIDazZ3Frcumjff1DDWPlcmDhS1X9NP62W8k/Xlh9lMVjvlsmqS4AKtjc1g+eV1VlE7N8dRC954BvyLbBbjCIQVBYJ5PHJHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 02:45:08 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 02:45:08 +0000
Date: Tue, 19 Aug 2025 10:44:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-s390@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<dmaengine@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>, <coresight@lists.linaro.org>,
	<iommu@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<kan.liang@linux.intel.com>, <linux-alpha@vger.kernel.org>,
	<linux-snps-arc@lists.infradead.org>, <imx@lists.linux.dev>,
	<linux-csky@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-riscv@lists.infradead.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
Message-ID: <202508190403.33c83ece-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 990ffba7-1ed5-4d51-0157-08dddeca68dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OmFKav8wQFOde57dm0yYAgE8GZOyNjuefmLcq/DNhAJ4D4nQn8NGjnNdmYz+?=
 =?us-ascii?Q?6biijlP8EYpqaZ8PGh3A0LPSIAmvOA+E02bp11e8w+T4ug54gUKKkI34rMWV?=
 =?us-ascii?Q?JNC5sUecRPVXhMUnTVSWmaFCvZooncJCmAaXeny1EW64jJpRcjSzQw+5nMxo?=
 =?us-ascii?Q?UeUydE6uZKT1Pq144OAf8yu6dP8ENtgFSD3/0WDWwwApk9UVrsIaKZrAf7O8?=
 =?us-ascii?Q?Tjjzhl0quYJzhShibEAvbwHMM0bIOl0sj/LkShLKNDXRb2nV/mbe/fIPoARG?=
 =?us-ascii?Q?VDp4E8RQdubEShPTdiA78xi9v55mo/ibz8VmzB1Ryb/sI3rbnAFBp8TUXxN1?=
 =?us-ascii?Q?YmLXuJ66b+xuzhovfHELmf+ksqHzn93t8Hk71xKst8ERueBoPMimUQdRNgXX?=
 =?us-ascii?Q?G25xGhsn7eajt2RQzXuFffLwthct14UlPN+Xqr7IG6jYNocabZzsYGA10gjo?=
 =?us-ascii?Q?6TZC5WYy1+vP0lJsymkPrruLjam+BURk9eaw8XwTwvSZZKLBsE5SsaG885Fo?=
 =?us-ascii?Q?L6FIUbQP8kZgJrmu/UjTskzncd1JnSfjm1JlLPmCtRwCNwDodJeNdFKxno2j?=
 =?us-ascii?Q?vNzIw7JFoGwU152XykoQv8MhRJ9snYWmA20GbgIEu+C+wyt30nafMz3W7waV?=
 =?us-ascii?Q?5FKo2xUwwS0VMZ6qZ9x0uKi8zJSalyeRR+Qj6l0tXb3Y+qqym0l7YMYnHUvH?=
 =?us-ascii?Q?IwCUmZGJwsa22lgniuRjzHm5/Bl8PulPmNBqKRvC9VCorB9jPyoQnA9DrXrb?=
 =?us-ascii?Q?P+HMXlY7b2K2XkQ+hE2QCN0A1ag0/vtCIFMA809wZPbeB4GQjgpwtU9iBkd3?=
 =?us-ascii?Q?9rWKVcMr1pBmPBTQnePeH9pJ7VQKGWd0C0Cy4WRQCzlPQFfFiwNCvmZCxjCh?=
 =?us-ascii?Q?rEKJJN7Seg6lq3ddmwY+VZzAmntgSfeDI7rIsrTb8VI+U4m9kLUCe/j/jZ1b?=
 =?us-ascii?Q?ixioSq/gZdgDpb9/60m4DQgOvuWp+LahfXffqeNXHJVpqnEVHDyMXVRZSo49?=
 =?us-ascii?Q?oTV992XkV4921pu9NW7wxALDMdsj4iGKUwjDncDgy09pvEpEFlesF1cnykj3?=
 =?us-ascii?Q?39oGyHdiys1JnAXJAKOM8B1gJ70QpgJ4EfjtNgEBSXNtKt5Oxc5aT6seJqy1?=
 =?us-ascii?Q?hoA9KG5TgTW2xblhaS1rqqeDwyegpfo2WmcWgROh0iAjpsYYmwS2PgBOg6BE?=
 =?us-ascii?Q?TRKbsLJwO9s/NkaEoH2eqcBRFTG9pHn0sKcOnrFaplZGmCwfa2lCWg/xu6P2?=
 =?us-ascii?Q?nQys1VpQONtSUlxXqpSLXcmYuH/rX273178KiLSok1DVAnfvSZdAprjMGkBx?=
 =?us-ascii?Q?4XQeU/AZBYiA5HyNac0ip2S8AzuZGZzg6YT/c5pYqNgdRmskEGROtK9wOlo1?=
 =?us-ascii?Q?Xu+vXKPEwsfROdJPSoUmoTLgxoKU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/mpHyvf05tpQykGbkuSMQ2VkpxiauNaLbC126L4MJEq9Q2kmzp84kAZxujZW?=
 =?us-ascii?Q?AJx1tpBCnUbtE3gaXZ0L2YVLdftafkH3zOSTGLMs9G4FYoSbcqGT40ktzdIi?=
 =?us-ascii?Q?pa5m/QHTpMm19D1wUg1nhKOVoYJd8WkkuHyEKociBKx+B5T6c6A7h+AEv1k4?=
 =?us-ascii?Q?Mz7L1J6Sc8u3yTY90DwCWWELY6Kx4/BSoeH7IVJXQeruiqIJUi/kI2wOjZxf?=
 =?us-ascii?Q?Q6pm6H6zgVtH8LgEMXacI+nu6pDinajahV9VHjrLoKctRCh6QsMNPNGCK8sU?=
 =?us-ascii?Q?ha6EOiEcMFBcjSnoGlap9+QPkG8QrhBIu7vHiLSOKaLo3RTc3yC8VZDFR6Xz?=
 =?us-ascii?Q?cXWu77uo5TILMV/zH7dOA4nVYLbWnoswJn6ADRsbcuSo8rSI6rANT8QM+Z18?=
 =?us-ascii?Q?odhRr+GL84BQfeQFb4XcK3hvojGynqIo8BA9xFVGF79H/JB9jWHeqX9IuJKN?=
 =?us-ascii?Q?Ju5vSdDZT+hmbyQHTEC167QLL/9Ac1aZOuDRnUA0KdC448q/8kDpcK/HukG7?=
 =?us-ascii?Q?bmwfCGNlhjuvScwrtwzcORPmZQ8flWvCvUj95vaiujQg6OHuTYmCUfUKkPlT?=
 =?us-ascii?Q?FBiSxbPicgHLuh6wHQtOF8eeIK7WxGGkqmVbbRGUGdRTppEaW83tuwB6X4Rm?=
 =?us-ascii?Q?q7c18PXEEwyAS7ckqd3ah14MJKkGlxnlz16Yayp8vPJmF0iC0L3AQUMANYl1?=
 =?us-ascii?Q?UWXyP+YOu42Pq97t/vz5fe6ZPuI4ujJSiSvNEvJNjmN3Fkvy0NhuGRmPTKD6?=
 =?us-ascii?Q?SPRWs+vMu+AER306dQxvupSl/OXEtSqjz/JB2nYMv+aJ06z3in252eLAuNLo?=
 =?us-ascii?Q?BXdMT6agn5b5xbZNdmkpCvyYuR8e1gGEI+myf0QrLc9UWDzU9omkHaWhhEhB?=
 =?us-ascii?Q?+unHXMo+YgbEtu+5awJJvmQF94Bqycpur0uciTOjjf19qI76G2vzXyyZ3iia?=
 =?us-ascii?Q?b+tCwnOcR/Oc/SWL5Wpx44Sd7yLqqv2v9NuLmEruk9nsMUUfJQ4ZwonDdHY2?=
 =?us-ascii?Q?xGcLJJClqS4fHhSO/PzjmepKmKbZUy2ZXNfEnHYT9tW26copR0PQZaFmaM21?=
 =?us-ascii?Q?5uclX8x4ITeOnMhATdLVyV5gsMKeeEesZZauMOci6Yg0hqpzJ6C1qTFH4f9l?=
 =?us-ascii?Q?cZIDNZkFMKJcqPl+RnbstMg5+lsLZ/b1Kr3ynbHnwDnLaWoNYkU3E8FXPq6D?=
 =?us-ascii?Q?tOJiBVvZX9hmbBo5s32ZqXYjYSR5PZXUTfmnZ+gy4R/Y6e4EUGth9kf5rxhv?=
 =?us-ascii?Q?Z+rAnm5TKHeZDuNQHLOS4oe++hVa9K4rG6Hy56a+tu7SX3uUDMFU6IJXl+4l?=
 =?us-ascii?Q?BLnsnoVFL29/HXA++owPrjtj7pc6m4rvaUDwaakzx+W8zBJ8V0UMmJwvA7vO?=
 =?us-ascii?Q?750FYEAv01rKYdyRrRMzS1m9EsWiRM0PgO9rpB27rEMUbKgr56Wk4LgU/r1s?=
 =?us-ascii?Q?DrJAsJsJfR7xVCSYlSAzTt480Vmb8FvTlzoV/a0wacb+y7MTdYbYC6/g4oYb?=
 =?us-ascii?Q?ibViziihw5pjVox5CuWD+tHskwr8sMZLYg5ZHxftn/x9T318DgVCKDzf84Uc?=
 =?us-ascii?Q?6N9W/G0LQ6ypScDLhOPbPYMsrYIhth1BdBgTDt//qqbl5G6JwputhmPKTrOW?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 990ffba7-1ed5-4d51-0157-08dddeca68dc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 02:45:08.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8feBY7qIgCEGcJymNGsn9WNMbmY8eePw8STRyuMn+tEuKRyUGaEgAayeYeo5hBQ1RxRlz3ZZN77XBQTViut1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 1ba20479196e5af3ebbedf9321de6b26f2a0cdd3 ("[PATCH 19/19] perf: Garbage-collect event_init checks")
url: https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-event-validation/20250814-010626
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 91325f31afc1026de28665cf1a7b6e157fa4d39d
patch link: https://lore.kernel.org/all/ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com/
patch subject: [PATCH 19/19] perf: Garbage-collect event_init checks

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: clang
	group: group-02



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508190403.33c83ece-lkp@intel.com


[  307.132412][ T7614] BUG: unable to handle page fault for address: ffffffff8674015c
[  307.140048][ T7614] #PF: supervisor read access in kernel mode
[  307.145926][ T7614] #PF: error_code(0x0000) - not-present page
[  307.151801][ T7614] PGD 819477067 P4D 819477067 PUD 819478063 PMD 1002c3063 PTE 800ffff7e48bf062
[  307.160663][ T7614] Oops: Oops: 0000 [#1] SMP KASAN PTI
[  307.165931][ T7614] CPU: 0 UID: 0 PID: 7614 Comm: perf Tainted: G          I         6.17.0-rc1-00048-g1ba20479196e #1 PREEMPT(voluntary)
[  307.178456][ T7614] Tainted: [I]=FIRMWARE_WORKAROUND
[  307.183459][ T7614] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 12/22/2016
[ 307.191609][ T7614] RIP: 0010:uncore_pmu_event_init (arch/x86/events/intel/uncore.c:141 arch/x86/events/intel/uncore.c:739) intel_uncore 
[ 307.198867][ T7614] Code: c1 4c 63 ab 0c 03 00 00 4a 8d 3c ed a0 3e c8 83 e8 17 de 3a c1 4e 03 24 ed a0 3e c8 83 49 8d bc 24 fc 00 00 00 e8 a2 dc 3a c1 <45> 8b a4 24 fc 00 00 00 44 3b 25 03 3d 35 00 0f 83 5b 04 00 00 48
All code
========
   0:	c1 4c 63 ab 0c       	rorl   $0xc,-0x55(%rbx,%riz,2)
   5:	03 00                	add    (%rax),%eax
   7:	00 4a 8d             	add    %cl,-0x73(%rdx)
   a:	3c ed                	cmp    $0xed,%al
   c:	a0 3e c8 83 e8 17 de 	movabs 0xc13ade17e883c83e,%al
  13:	3a c1 
  15:	4e 03 24 ed a0 3e c8 	add    -0x7c37c160(,%r13,8),%r12
  1c:	83 
  1d:	49 8d bc 24 fc 00 00 	lea    0xfc(%r12),%rdi
  24:	00 
  25:	e8 a2 dc 3a c1       	call   0xffffffffc13adccc
  2a:*	45 8b a4 24 fc 00 00 	mov    0xfc(%r12),%r12d		<-- trapping instruction
  31:	00 
  32:	44 3b 25 03 3d 35 00 	cmp    0x353d03(%rip),%r12d        # 0x353d3c
  39:	0f 83 5b 04 00 00    	jae    0x49a
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	45 8b a4 24 fc 00 00 	mov    0xfc(%r12),%r12d
   7:	00 
   8:	44 3b 25 03 3d 35 00 	cmp    0x353d03(%rip),%r12d        # 0x353d12
   f:	0f 83 5b 04 00 00    	jae    0x470
  15:	48                   	rex.W
[  307.218475][ T7614] RSP: 0018:ffff8881b30ef8d8 EFLAGS: 00010246
[  307.224450][ T7614] RAX: 0000000000000000 RBX: ffff8881193547b8 RCX: dffffc0000000000
[  307.232353][ T7614] RDX: 0000000000000007 RSI: ffffffffc05230ae RDI: ffffffff8674015c
[  307.240255][ T7614] RBP: ffff88810468d000 R08: 0000000000000000 R09: fffffbfff0ae31b4
[  307.248151][ T7614] R10: ffffffff85718da7 R11: 0000000067e9e64c R12: ffffffff86740060
[  307.256042][ T7614] R13: ffffffffffffffff R14: ffff888119354890 R15: ffffffff81727da9
[  307.263933][ T7614] FS:  00007f54bdb88880(0000) GS:ffff8887a24e8000(0000) knlGS:0000000000000000
[  307.272787][ T7614] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  307.279279][ T7614] CR2: ffffffff8674015c CR3: 00000002e3e06003 CR4: 00000000003726f0
[  307.287168][ T7614] Call Trace:
[  307.290337][ T7614]  <TASK>
[ 307.293157][ T7614] ? perf_init_event (include/linux/rcupdate.h:331 include/linux/rcupdate.h:841 include/linux/rcupdate.h:1155 kernel/events/core.c:12690) 
[ 307.298005][ T7614] perf_try_init_event (kernel/events/core.c:12579) 
[ 307.303538][ T7614] ? perf_init_event (include/linux/rcupdate.h:331 include/linux/rcupdate.h:841 include/linux/rcupdate.h:1155 kernel/events/core.c:12690) 
[ 307.308370][ T7614] perf_init_event (kernel/events/core.c:12697) 
[ 307.313031][ T7614] perf_event_alloc (kernel/events/core.c:12972) 
[ 307.317862][ T7614] ? __pfx_perf_event_output_forward (kernel/events/core.c:8496) 
[ 307.323919][ T7614] ? __lock_release+0x5d/0x160 
[ 307.329194][ T7614] __do_sys_perf_event_open (kernel/events/core.c:13492) 
[ 307.334732][ T7614] ? __pfx___do_sys_perf_event_open (kernel/events/core.c:13374) 
[ 307.340702][ T7614] ? trace_contention_end (include/trace/events/lock.h:122 (discriminator 21)) 
[ 307.345808][ T7614] ? lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870 kernel/locking/lockdep.c:5825) 
[ 307.350379][ T7614] ? find_held_lock (kernel/locking/lockdep.c:5350) 
[ 307.354947][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.359623][ T7614] do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94) 
[ 307.364020][ T7614] ? __do_sys_perf_event_open (include/linux/srcu.h:167 include/linux/srcu.h:375 include/linux/srcu.h:479 kernel/events/core.c:13454) 
[ 307.369726][ T7614] ? __lock_release+0x5d/0x160 
[ 307.375006][ T7614] ? __do_sys_perf_event_open (include/linux/srcu.h:167 include/linux/srcu.h:375 include/linux/srcu.h:479 kernel/events/core.c:13454) 
[ 307.380713][ T7614] ? lock_release (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5891) 
[ 307.385194][ T7614] ? __srcu_read_unlock (kernel/rcu/srcutree.c:770) 
[ 307.390112][ T7614] ? __do_sys_perf_event_open (include/linux/srcu.h:377 include/linux/srcu.h:479 kernel/events/core.c:13454) 
[ 307.395823][ T7614] ? __pfx___do_sys_perf_event_open (kernel/events/core.c:13374) 
[ 307.401798][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.406455][ T7614] ? trace_irq_enable+0xac/0xe0 
[ 307.412248][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.416904][ T7614] ? trace_irq_enable+0xac/0xe0 
[ 307.422698][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.427355][ T7614] ? trace_irq_enable+0xac/0xe0 
[ 307.433149][ T7614] ? do_syscall_64 (arch/x86/entry/syscall_64.c:113) 
[ 307.437808][ T7614] ? handle_mm_fault (include/linux/rcupdate.h:341 include/linux/rcupdate.h:871 include/linux/memcontrol.h:981 include/linux/memcontrol.h:987 mm/memory.c:6229 mm/memory.c:6390) 
[ 307.442652][ T7614] ? __lock_release+0x5d/0x160 
[ 307.447923][ T7614] ? find_held_lock (kernel/locking/lockdep.c:5350) 
[ 307.452491][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.457151][ T7614] ? trace_irq_enable+0xac/0xe0 
[ 307.462954][ T7614] ? do_syscall_64 (arch/x86/entry/syscall_64.c:113) 
[ 307.467631][ T7614] ? lock_release (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5891) 
[ 307.472122][ T7614] ? do_user_addr_fault (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:949 include/linux/atomic/atomic-instrumented.h:401 include/linux/refcount.h:389 include/linux/refcount.h:432 include/linux/mmap_lock.h:143 include/linux/mmap_lock.h:267 arch/x86/mm/fault.c:1338) 
[ 307.477225][ T7614] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751) 
[ 307.481892][ T7614] ? trace_irq_enable+0xac/0xe0 
[ 307.487692][ T7614] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4351 kernel/locking/lockdep.c:4410) 
[ 307.493487][ T7614] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[  307.499281][ T7614] RIP: 0033:0x7f54c9b4d719
[ 307.503585][ T7614] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250819/202508190403.33c83ece-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


