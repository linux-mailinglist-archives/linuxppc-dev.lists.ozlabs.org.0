Return-Path: <linuxppc-dev+bounces-13137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D8BFA030
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 06:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crxjG5wYtz2yrb;
	Wed, 22 Oct 2025 15:57:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761109026;
	cv=fail; b=JrqIsB5L5gNiPC3cpr0nU15J8gvpfFv2VVYyJa1nAbeubLuismbu277GlQ+X2Xmdq+yJcYVBYmNMbYLJivMOo2dCoOk7Zk1Xq3msEmjjwvwzYlCOh7j73ljDx4DIu9ZVmk6gYTAUd5MUP+fmMoQRE8sapE210exZcfbprbpuXv5iEC+iRo3FXu14trE6I0IuLszNfc0Qg/BVzFYlyew8SKob1rM6tbvvMLU/CPcIgsaVvzNGm0uat1wnDeyZemxDkFdbELOpbEnDyMnYMLXtx4G5CgZ6YIbXUIyALIWaPyiM2MUXZ8w7kRLpIPn82jTW9uIM43DM0ODYDCinFKxolg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761109026; c=relaxed/relaxed;
	bh=8KsYw4eNwDK6NuBzU22r1MIZXsX191wCc0VjBcny+5A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gr4+oPAr1yjBQ5NtEQv+Cu9gKvAN5vft4pgrUTiYRfy6MoazAlBPopriRJuD1wdcuSl26FXMLncj/7Y+OrlxU0RSIPBcaQ08aE2WL1t2ijnu0CU02ANDBvxXCO1yYnA9NvxpBCUtHbmxhmvKeHbJKy6IrTBLFNQiQv9fswVk3SrGCvg+FS5O/PTBuNSM2VjB1HjVnE8kxEBachZMNOhAQGMSF6HBgGJ3B9jKZ+rfDm6pWWJExYgFzJLtQv12u/2wpbr/JqXsXqYYKG5aHqABqGa1tOMRxDK1IZWrj1DLHwDuCq9GS6ZX5lF9JGnJWO/N95/U67aS+SPRLpjBQ+X8ew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLARWIzN; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLARWIzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 22 Oct 2025 15:57:04 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crxjD2t25z2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 15:57:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761109024; x=1792645024;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=yV8eI1/W0/93kd6W1AutV+6OucS9l5bXbwMlM0d5tYk=;
  b=bLARWIzNt1tVyKRlVSIx37oYVGyEnjrlbgeoNehsNH9/i2SmtNlYMZo/
   QYDCTUBReU8/bkGeS0L4cURyH1pUn66j9W/sBB7xA77XSuKPDD2CqH0Oc
   jQUWo+6OviHCeVBI6kQ6hpBn+5A16UTAjsW5momzwqZ7OFb8jkS8pR8i6
   DM1NeDhzxlpwOozWsmFtH6vwdWmSeC5PhejPYx8qhoTYnVM7bVqxt2rg2
   eaSiz21zj3QEwIraJLdiy0hfRcrAM/rwLqLEwnegElNTP+jt0ZLJv+we9
   u3E52ggNDGrqADve/5Ykqg3J1SCMXqHB/OZsBrynQIF3fBRIuZnb0fqOW
   A==;
X-CSE-ConnectionGUID: fJWG4X7QQtKEqZIfI3gkdQ==
X-CSE-MsgGUID: IDvAf9KARGyXSUpGVuwgTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66887844"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="66887844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 21:55:52 -0700
X-CSE-ConnectionGUID: raK3MswxRO2D9IvLClB45A==
X-CSE-MsgGUID: OqpW8qU5TeG2H/I2S8Kd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183346041"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 21:55:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 21:55:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 21:55:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 21:55:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/Cx0tZB6XMeruZousUVN3QoHWW0PUuvm3XWMga5PK3gEB1WfuGxQz+OjSblVc/Vig+D77czBQOc/o6ft89oLab75/pzsDRThu842Gnif69K90ala55VbPtHpn3ihdn1b25O2zzOFGERfLLOHVI/+pAUcjCZI6oCTLQZCrzc9SOLe4IxL+zALKoY2ESm1AqecEPKN8bfVlXttjKD5V5iTkiEYLuPxjy6fiNkIrKiygxvtqwg54Hv5PekZyGE1gbVycg45TDTZPJOaQvCs7bqTFhJxFiwQ6eo/Mv7gJJmFohtBEFELsOQpL0WDG8wfV0EYVwhWmRMlUSaYeZzLIXmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KsYw4eNwDK6NuBzU22r1MIZXsX191wCc0VjBcny+5A=;
 b=cWgNl81yBBpPXxKcoSGC7splZdH9Y51JLUoox27jAjexUFcrj7UzgSwAfF0bdeu4YMFd5RG1TffChqwCkAnFwkFV3N6FBvr+pXAVNmWO3/u2m7PlTVBHtAlI8WBlSEx0dqliz87XGK/5srS0Y9V/bzGOs6BXqcydVK5AZKCT+0V9oQo3Gd31/yICaJIdmFL2e9hk6VVGMUSbfsct9innPVNKn8EEcjGL14IKtAutEgPGK+j1FlRW5WOuNVlOxoY5P9rOMsYY3t8oM77CSCUzuNNNthOa/Fe4pzx8ybSHLlbO+HGRFgGWufzteYe8ZL5crnyJxZc9D7zGUILb4nTmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 04:55:48 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 04:55:48 +0000
Date: Wed, 22 Oct 2025 12:53:53 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Message-ID: <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-5-seanjc@google.com>
X-ClientProxiedBy: PSBPR02CA0018.apcprd02.prod.outlook.com (2603:1096:301::28)
 To DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ac32bf-f29b-4685-e6dc-08de1127448d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nZbIC+T1bbfWXXqXdRGOQou2D93zkMOB1qb5hOohmJCsXs5qP9SsTBwPxR9k?=
 =?us-ascii?Q?APWaoTKBrsW9Q9Ig3qYy+NZqvNSUt1o8DzQtBQqCWdRQ1+3UI4bzUC0D3xIr?=
 =?us-ascii?Q?8LuskM3Ixi1vjIHfIAii7Nl8EGdrlbnp//kw610CeGu9RsuAQYr2U/Wl2v6X?=
 =?us-ascii?Q?p54oeGp5fyCMgWfCkfLCnjmX3UmeNZzOMYy4HHVDFzdmQRRxjyTwpTGdCKSz?=
 =?us-ascii?Q?M+17fHFVkWUchoRkg8RdwjrvAMd/UI3O0ZJWVRWGr7xaItzfHfUVrMvvKTLP?=
 =?us-ascii?Q?re13Z7JgM9p2zoMFB4hWc0PHSgtqBpcXDP+Q1y3TVEDKnnLbQSZns2JDyvWy?=
 =?us-ascii?Q?hRVpoADZLjhsa04sP4ZrZSbXT7uZNVGVuI2EAAqyuQjpAb1HU9z6CwieGISj?=
 =?us-ascii?Q?dXFRA6aap0xL4BNZkUzbeOqA9fNSq4SmVQr5mUOshX89tKb1ZPU1JYXd2ZyJ?=
 =?us-ascii?Q?arDLfMOFBAdZnHtW0ovYeSd345oAbI02UkUoxGU46DaNRCFvPBGI8GT25LuY?=
 =?us-ascii?Q?M4c3Wl/81Bmu2LEVKYIYZn6uKnrEa1Uty5gX0tcFmiWOyRSk1KaTGl7FoaIh?=
 =?us-ascii?Q?xoV/rrSINxqPQs9KrVFug2ulKEjJ10WhGuoDM0JCNZbHN/rcpKE4uwW1YxRm?=
 =?us-ascii?Q?nFbnvQ4zJAOFeIs9zhRzIF+08a86fZUre0o3ju/dc7g1wQOPxbkIkiG+a5yT?=
 =?us-ascii?Q?kajFw8AMt6v+rx7CsvfUlCV5qGNwMJkKHSw2endW7uHEUsb2GLww7wCca9Yw?=
 =?us-ascii?Q?e55dxb6DKJWG27peQGKGF2hE9rtm+1HPBdUATJXFCiQJGLDLW1wf6Majv9ov?=
 =?us-ascii?Q?dxjTU4BpB+esyT2LSRKPhtQB9VSu/CrJ2t8xkBSpOuZUhUIp/d2DGFLVkh5M?=
 =?us-ascii?Q?8CxdLGX+iKDT2B3evZZjHIML9mHxaTAgkT1Kp7DSLG7n3H9HuDQuYw7lTtJE?=
 =?us-ascii?Q?TJFHqNdldIU4LSrhIuyb/61vD1EXIY9p4zoDctQdjoYInfksNW2KHKhQFpaz?=
 =?us-ascii?Q?kMwVpyAe93CNiGRJC46gsDwDQwlVzoPfDREswMCbPdLXla3hTBQBwTA3DlR0?=
 =?us-ascii?Q?5F4fqj2f0dC/K5pINeA6owxXCNXSKl8/1M8shIuopUvGkE/WtS/KZrtptyK4?=
 =?us-ascii?Q?MSgooljRma1ckBR+X0ANaQQ/d2pvXNy4He4/eVbem4zaslmv7WKzUvIVQ7xa?=
 =?us-ascii?Q?lQ/mHvDcJAZ53oLfol39OKM5Q6APpV9c4Z4LYJLRbtHzGt191Pr78scM65ij?=
 =?us-ascii?Q?TThwuMna7viQ8LQ2DNlTY1x+jrFd6yR/WHRVSQNRzxwDG8puP+hFXJ7U2Jre?=
 =?us-ascii?Q?NT6QRfpV+cJ7oTYyjRgoiwDhYtmY+VO1YmRzVyTj5TGSoJSqpz/rlZDErWd7?=
 =?us-ascii?Q?lSKa3jN7ywAR+P3/vb6LKLvNDFk5ze9TNfMEoPyOwB5Tvd9Im9kiSEvHsBZQ?=
 =?us-ascii?Q?oocw/mIfKPS726H2Ztuo/5OI7Uo6O4AnNvfmA60DdBvksOH0/AGLfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4GIgj9jvNn/wgozm9vwmPtvJKG2Svixf5gW7Q/eTPHWXfg6F1yRjokXwQwZy?=
 =?us-ascii?Q?bwI5VPuLOjwJTlPU7Dy5OBSo+la0fcrN+5X7o3Kxz0rF5BTerYu7ZTO2jZg7?=
 =?us-ascii?Q?W05J7Ma1+s//ALXgHZv/YeH56Uh/lqbVanCdmlYhjSDU33/Drsvb3TM5YGL3?=
 =?us-ascii?Q?cqTXBe2BQKM9zDKw15g1DpiYka7eO1wC+LaRWqSuxARKaPyxtfqtqmqUc/77?=
 =?us-ascii?Q?Dd+bytLpe98FNx0xxtOPJUyduh2dj4Q4V/Y0Y7UjfXTZH+Hcr9Vc0aXSkZq0?=
 =?us-ascii?Q?16/QRIz3+j4JfSd68CvE/GseKstUh3ypA0sH6lp+dXLCq7HTNE/yyQGU/Wyz?=
 =?us-ascii?Q?ngJVhZN6Azl6+F4Xmqcl0h2YQfCZgVjIUokNwlptVT/Mk639Yra4zgGWlVxp?=
 =?us-ascii?Q?AefTD0XYAATceWCDijepUqwOu2X4CynfCFxlTcW0/fuOti0HPY2KwNOQviWb?=
 =?us-ascii?Q?gdUXs/OeKqYU5y8R89ceG2FfjjB3M9fvU29i7kp3TLmdvVEz2N3KK0pq5fPk?=
 =?us-ascii?Q?3zXwqO73L+Tp6x8rBSWCZEBcv7hmaYJkuMF+fkLc+Hq+sw7L+xVA069nzdwm?=
 =?us-ascii?Q?Z3MCNxSYG1KqwPHQ58lN0OjfUB+M2FDQtsG/i9OH/+5L754PmmnzEs73jjLb?=
 =?us-ascii?Q?zygRoIWx5O9VfSSP4uIUGrWvlPrmact8vwhVCfhVxYTyZy895lhdMZou3p7A?=
 =?us-ascii?Q?1HKZVgCdKVBWpJOKit3kkvPb18MzchZVvJb5LiCqr3mry+b4938WT6PkORlu?=
 =?us-ascii?Q?ex94sILuJjw9E72AYLSFbpLu3nL7q1lukC/hGbdmveu7f6qBjsAo4qzhY2gK?=
 =?us-ascii?Q?7K18BjrqRsFowZQPB0ZLXpYgqATfzzxCJD98umN6UnSEjXF8bU+BS2yw7Rss?=
 =?us-ascii?Q?ib58J4J3v1wjtEIOUzl4Nun0XX0d4J6aDhdO+2pWexxJKjPPSvTaxdzXIbUl?=
 =?us-ascii?Q?aQ5r/9+w6WNJ99OPTqtK8H1s6o+o2rPKCbwxmHDm6mmsk1cCC/4AFIQQJIEk?=
 =?us-ascii?Q?ICKBulMoRNGYFzTWZBAEmFvRt/NusIZUCN0SMB+W++8tjUcCev7phG3uJHth?=
 =?us-ascii?Q?ms935wI0IW9yotjY72e201TVQ6bz4cWedGc6oWDyySLzXyzTau/BqFhJu6ev?=
 =?us-ascii?Q?m98d0cjDwY3ywP9pf8zGExpqNAIJJM6KdlP99ZC+XSPHJVFdNSVBSm/PuOT2?=
 =?us-ascii?Q?tin2iDX+SZvXW09Vsh6A7ekxwG69+Xz6/nHAckq4gDilqkPSlkuW5kaoW8wY?=
 =?us-ascii?Q?L+r5Gs8S1w2bPjFt5C2d1qoZpCGl+rstHmK1x8twbLBP/XYdNKw1r6xlaIVj?=
 =?us-ascii?Q?cufja76wkJjegS3138J+3TGCB0eEsoGsgrv/ri2zEktpvYyfwpvLLBWYTV+X?=
 =?us-ascii?Q?PNjRzkR9pvUmjWMDIWySvDsdoy/3xT35lBfxXSVlORNMlgwVAEnTK1xElC3I?=
 =?us-ascii?Q?5IFpM36ghMuesu0T/DlrASCtYfTQqbkMuksUlBruyPiEXfW3SGSuQLtkZ1At?=
 =?us-ascii?Q?PVx6gPfytqJYnPF9+arRr64r5s4+RvnkXgSNIGKEQdPrbcBOv1ScLJ3pZEaO?=
 =?us-ascii?Q?HMc3f3Bzdkx8pNXsKGRYKZpZHX2J0+oaxyJ5NQRz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ac32bf-f29b-4685-e6dc-08de1127448d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:55:48.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYKrAOk29VkfThsSaUOndnntFJgVEN6XwSMpB0FLPrp/0P6TZlshZX07QfpP5el8t7x/NZBuPNZWvs7IZaN4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com

Hi Sean,                                                                         

Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
conversion as well?

Without it, the "WARNING: possible circular locking dependency detected" would
still appear due to

- lock(mapping.invalidate_lock#4) --> lock(&mm->mmap_lock)
  for init mem on non-in-place-conversion guest_memfd
- rlock(&mm->mmap_lock) --> rlock(mapping.invalidate_lock#4)
  for faulting shared pages on in-place-convertion guest_memfd

[1] https://lore.kernel.org/all/aHEwT4X0RcfZzHlt@google.com/                     
                                                                                 
Thanks                                                                           
Yan 
 

