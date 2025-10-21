Return-Path: <linuxppc-dev+bounces-13081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91405BF4936
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 06:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crJhQ4vd4z3020;
	Tue, 21 Oct 2025 15:09:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761019750;
	cv=fail; b=WxON3dg5XEmcqzJHOs82884bEq72WTYXkXlp6UdOysC1J/f6Lp6p7qOBC0cyLWgtlLdb8b9sT2vmOdms9XmDzZ+Pe6rHI31knRT22DA8CIaMMU+HBvLusLVJVpqPS1bYLr6zzVXbNN15wrXGU8R/igPZMJHvKOZT4Ih4gFuczRLKBlzjE6MKWRC+WMmo2b5WGNq1EU8YYVnQDHFQOAYW6zSfYPgW6MBvL/cJk90e2Uy5j3XvE/suBhu3d/z1mR8+2uV51rbfSa2xf7J5xKty+I4QSSEOE+L+JAjE0j/zGF36musozQ3O3ILCYtBUEUvm0aIZCbHIe5y84poXOlWXoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761019750; c=relaxed/relaxed;
	bh=Ifi6FzgI1ycRclmmJV790rJS8TJHTSfD7Ay0MVnruqc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i0OTqaXkm7C0WnaCaWcQmoQisNLg0LQm1+RN9l/xCCtn5/zlGF2+uAIHMvN4WqTkFY8o1VgwnHOht1AKxYqZHSjYcIlrnfq3Jzez67PhmX2f7cX014gOKpWXyULlNgOo+2r32kCC0o4eOwz7ta09eSE3hSB3QXEd2akHSeRX/1/6PkDQD34VKBezK43ks/mUEG0Xp0K+l+mQW1KJmZWkm0pf3qi6K5SdhExXn37QiCN3X0keYVPn9Uam+lnVP7a4X57Y4HRe+MU6D8YTDWDrfJN4Hn3Xi8ixZsqfhLJ31YFJ31tpaxoQzYtHLTxnbaIjuQn84lNwzDmhzXFdwBbQlg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gd6xALCP; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gd6xALCP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crJhL1hYHz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 15:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761019746; x=1792555746;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=L47OiHBXBe380poBuH7nuFhhF9IJ4xFdGbem4KTP6kU=;
  b=Gd6xALCPFJU3mD+XJ18LjQTeLct96GvCh3CZE1LdTgmbn41CLpd86AsX
   myiJ+J55FfJO9UgORnQ3GFCuRHI62RaknGQhs4Uak4yyy75mbCDzzwCTh
   BhZbF3tnAF75YedtxNsQ57j3kV+UzS3dzRCVVIALjx2Q3aY2TsNyB15uE
   G7FBJqv5HU0wsFxlNfsoSQsUx+NWYXRgMUW/8X7Rg7puM8aBCSja0fs+5
   CUxqvC3p94wHrxJA3Y5gbE0YK1XTTRwRb6qK7bHxPnlzYg6xMto3BzBWy
   2VfeTOdpHCWCp/jmGFl3wQq6B8hQkx3lhSED1+IV5DFx+uHDlE2PXa2Sl
   g==;
X-CSE-ConnectionGUID: GtWxIhF+Sy6r1pQRore1kw==
X-CSE-MsgGUID: 3NtnzcerQz6CA5yayyyPFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62842572"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62842572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 21:09:00 -0700
X-CSE-ConnectionGUID: yYcYeic1R/OkMsuLATu+Mw==
X-CSE-MsgGUID: as9fsLapSv+kr41LIkc3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="214116142"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 21:09:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 21:08:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 21:08:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 21:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqs5RhdgTwSrpaebHs2/v1dZMfAoxZDlfw+P41AbrAtpFHgZxZV48x5Sv8QR11D8eIxeRbdOncJWH5gZ9ox0m9p+4lgHnDef/7l6r58vBigcBFgOijA0yGxJqtsKMq6puAaMPPmDUD+EZiKIGAC5ZHsF8jOWon4p3zolJh9JBLP/nMWggTBgBbFTLGVNe7EBOXJ8KeJnvrudHsleXAHeX8Sa4ECESgW0nG+rhxYRG4fy14v11o/oFHuwXmftjYmjAWyLIgjpEsXmoQxdUplFcvIz2RidM6cUtWLZbXqSA0quIPTUxblIaeKKSs1Kk+B2AopVAusliFasv95uBljWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifi6FzgI1ycRclmmJV790rJS8TJHTSfD7Ay0MVnruqc=;
 b=AkS3k7LJxKZEv+vGbzhRR/gD1c/g7ZjHdY2w76Nxy4JLiyDsL+0AzYTUkCUqpHrHDzEXoWBpiFeopmfGQAFvcN3pnA6/e2wNTVLL3MK07dHKj/gwTnqAAnIQAfjkuZ2SSfo2IHz1rkgsUkigug7QNjt1C2jv985XApmhVyEuKX7EwcKnt7FLHEfgpPikSmEX28l6/53BIYUmmGrlchouJ2E0NyN3bRdZbQMV3oQs6bQ/NlNXLxa9Bkn3+tIJqT8IbdVRKCfun9b7MB0ZPvjv3+xNZXbHwgp92kEF5DJ0iCURFjdoqJLsoU4x7pG2JDx0Iz/OMuTlIvuLYz1LXvhoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 04:08:51 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 04:08:50 +0000
Date: Tue, 21 Oct 2025 12:06:52 +0800
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
Message-ID: <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-5-seanjc@google.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e098889-4d24-46e9-dd08-08de10578a8d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9sN25FzY8AbMpnLOAmcJOzpeqUzJLs9uEPXvTkWoonORC5cFeIWH0s49W1Ck?=
 =?us-ascii?Q?xO/ssu0tL/fYPcB4+Hb9pcc2IqZ/Xke6RZB04IHLx/RpaHdS0ybvrMBnc5K0?=
 =?us-ascii?Q?B6oxsc/m/UB1s0Eh7N9Nyzy3CtZwhkm/b+rdH2ooG6jOOBRpi8kqhiEjO55E?=
 =?us-ascii?Q?8ljhJ8ABlK54Ub8mitNKB5fxu/INUS/tPBeBO58o2SWNf1cR1ccYct9Q+AGk?=
 =?us-ascii?Q?4IOYucMsFpqprJnCb9jTqrFRlJm3a3Gv5KBcRa/mlOFyCJZgrF3ADHAd2ze6?=
 =?us-ascii?Q?q5AUL7b288B7zYJHL3tAu388V2cue0X+fRyog1q/pEy1kyqPY0Q/X5MOtHwu?=
 =?us-ascii?Q?MVLbCeF7p/25AFYlqPmsp+5nDJqH96xI2CJdU3Kza23ltDt0jCmlKTQdj7fc?=
 =?us-ascii?Q?x/QfYV+FyXGPHzMYKS3VhEsPmQvIs/u6V+3MCLhpkDEAxzgRND0r6IoliXCw?=
 =?us-ascii?Q?lbvaI+gEb2AguLUcgy4lFjBrYNlywNP/51QvYjU3oCoXLxpGg6/lJroNc/8E?=
 =?us-ascii?Q?riJEFvr3KZmf+V503B/W8NF0InFe4t7tcmiYr/pbedhKCuzYj+FR0PeQr9Dc?=
 =?us-ascii?Q?KGG2z6rQwQWx0ef719BOy//lk/UCP8QRKIVtrLLzgy/lVXD8prHjyVrg952O?=
 =?us-ascii?Q?8zgngJAja8G3gIm+dZKWfqjYYZDIJfwroDZ7hQLks27uWKbaOuEE5i7zbhnR?=
 =?us-ascii?Q?FpYX2ZoUNFohLCuN0HoHVIPteXyFiZhd6EOOWpge3PaBByskUh3yK0GpOPdL?=
 =?us-ascii?Q?XLObogB4MrpmGU5iUJrVvgJAsxJ3RIn8UYkIW2GwA2JRpqEkpq2LbeAMN/yE?=
 =?us-ascii?Q?jCVeFQTTU87nsC3PcbwXrAXeIhgucb1BVwJCzIUL2ETuCPEPsOwiM7YQUkY5?=
 =?us-ascii?Q?yNHG/i+8PtMwqCcJhYePm22DYlthfCM1vvAxYwvFuI2MgxF5MJMR/MgzrFqj?=
 =?us-ascii?Q?vNoIJ0oEBqb/M5oh65Yx89rKWN9n2Ix4mWHYQICy7je61IoNWBc0swkmhtqV?=
 =?us-ascii?Q?2OAnUcfIc4C5FZsbzrfvHpRmhssZzVDvP3LWJTAHc/x4z+cJu4odo5aqsa+2?=
 =?us-ascii?Q?z0RhUFv1MrJMnLOYtGQJQT2llFNvMrPpBOiY4W18SkNDE5ROXX1OCh5cEs2T?=
 =?us-ascii?Q?EY/Lf7QIbkbFwGAblhcAAPS7OYiA4AliYYI3bmCwFkwqDprAsNtOibvf+KKh?=
 =?us-ascii?Q?9D8l/vSPbwapkygD7ndqU2MX8Mw3GCJ1O6WKC+K3wcV/3UPKQ8MLcuOR3Qcq?=
 =?us-ascii?Q?/sWRmUF/8PoaETkw//XEyqs8qf17veg5roR+t83JLUJOCihAEPFZPxWtOz0a?=
 =?us-ascii?Q?qHD1uygVhLnESYXn6gXjpkdRVEkO5R6JFP/533VDLJLWu4qbLeaP8SQg3XBA?=
 =?us-ascii?Q?O6+NSEDdYv5L3e3JhbfisLwRk6EDsEb6M8jsYpeIodZhvW3QUJcdo7h7yE9n?=
 =?us-ascii?Q?4MwXxpLcTcuBVngkc3Ug2ZQzN/uyPtNC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uJq0KgsCSwPiWHhRJka5L8dtnu4YIHpKDcGb+fnavfoE6z2lFGl1WTn3g2He?=
 =?us-ascii?Q?MoN/J2luVeo/A/kCUrPpj3C4EQp3SJC0n7ueJa+y5x+9uJ5IeXd3e6b5WRny?=
 =?us-ascii?Q?Gu9WX5Rd1/YNA59xAL8KAwun57kcLdPtq6not/IIMU2YmpsKkQEzthz5RACf?=
 =?us-ascii?Q?g1SdRrU++DZqYQh7frE09dAzl3PiR4xeYFB7lDBUC8EESPrb2QvHOMUp1WbU?=
 =?us-ascii?Q?oFaVCe/8OFJZKn0lMasfrDVg01jIQArwyizWAGTkwnOjOekhxU96JNE/laqj?=
 =?us-ascii?Q?1+/KutmikBy1rQVcf4ZkBnT+NnExlRZxadPQmpnjApMv26pSt2j8+I7yreb+?=
 =?us-ascii?Q?6vUTqYPa8vViKta8KGdEAAC1v77NrvBS/iea57tgLzfVcoaZtxiqmKuadTr0?=
 =?us-ascii?Q?EYu6XZ69wIICg2nrtOZRiF4M8otAgUicVB4BQIKidjJKQIIpKCbBOhOYBzWI?=
 =?us-ascii?Q?4Pw3V/6IbzgeZ4gSNpjJ2SmFsUZeC93S2155EqI1+h19g3wqpylg0VXlgJKB?=
 =?us-ascii?Q?DKDfRw0mxmT5dBBGl2ZQziQVNGAuI+sAZ9N6AaKd6wv8LLt4yHcmETElUz8N?=
 =?us-ascii?Q?CqjVF2rV6f1Bd81jfhd3DDAGTU/XZGkhrKxI0wY6cLP7ubZItq2CkXagUaMm?=
 =?us-ascii?Q?pD6JmPOETa0Y96dgM97bEk4+hmBWjn88clKQE6k7V3NJDu/LlHpczRLHM0YQ?=
 =?us-ascii?Q?QmO/SThLYPfjhox0iRkzIkBZjMJAVRzpyz9gg/r3GbsHDgiIqx0YcXp4n7Pn?=
 =?us-ascii?Q?1z1nC9Ckt66Jfv7fYMJvBaLgh+wEpJo74dCqLcUDlJwBOOTDcCmwwVQFbSu+?=
 =?us-ascii?Q?ZZCM29EEXRRdLklgDeTycyePJrrtU3C1n5DadeDyHtfNm9dBiUlKFsFLKL0y?=
 =?us-ascii?Q?QWvSl8Kf6CJw0fq5kMq2mNpEWvSR5HHKddMU7jKiep1p8L1wuD/YfijY3/Ip?=
 =?us-ascii?Q?T29oAdIQFZueL5HIcbbU/+pEdZvQWFWqxMI9FenkaCqyYpnSkWukE1kQY2Av?=
 =?us-ascii?Q?7MkrnnTumZW6jowgJweIy/Za/UUqRTEnh+0XVe5lVQi6U87CxIAGCKjGY0rj?=
 =?us-ascii?Q?NC7vRveMWY7N7mgRXu2fNpOqcnouKSPkeVkvhDTH5+ouHSmaM+vkA9HmNL0+?=
 =?us-ascii?Q?k1h9ELY7z9tc9nWjuLWaN2HAtvDIMH++e4QAO7qzD+YDIwLreFtNAEHt+JxQ?=
 =?us-ascii?Q?tgNTcIAguO/igMArgP2n326PmNuMcNFLcHFgkGVFqBjp80Y5gPKAdTASQA+b?=
 =?us-ascii?Q?I2JnZsH8ltmolkMNzxttYIaRpjJAvY2FM6xoI7ASOzWnqDtX3MvtSI+rSSnt?=
 =?us-ascii?Q?D+hLPTsuByfo9Fnjws171K3tNyt+48wMKtXJ7RZz4L9ZfYDjSZtL7xzSnlp0?=
 =?us-ascii?Q?MnCCwvjZFlA5dDtSNi1MytgcjQJSMFeHU9KihTUl8O+SF0oLv4IjfIUXP6Ko?=
 =?us-ascii?Q?SG/TfLLTGZWXPHBhi36lBMo0YRR3FuCnXJC6v//WLISK4YYXkQZW6G4dvFmJ?=
 =?us-ascii?Q?lOUQvSoOblMQmSmuG00oFroB8xz9teH0SFZgBmmOlFGWcVrj2Nn647pOr4tp?=
 =?us-ascii?Q?B1xrOLztuO9XH9LewZJ48qq2OVjNl5GrmaQC6u5U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e098889-4d24-46e9-dd08-08de10578a8d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 04:08:50.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0leKKKNfpe3FOF2Wyg8kBZyGFOtR6A9rZGsI/YixEjygwwFaO8QMIcxZJ2hstsPAkG1TInbvdNRU448SeZSyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> Add and use a new API for mapping a private pfn from guest_memfd into the
> TDP MMU from TDX's post-populate hook instead of partially open-coding the
> functionality into the TDX code.  Sharing code with the pre-fault path
> sounded good on paper, but it's fatally flawed as simulating a fault loses
> the pfn, and calling back into gmem to re-retrieve the pfn creates locking
> problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
> lock.
> 
> Providing a dedicated API will also removing several MMU exports that
> ideally would not be exposed outside of the MMU, let alone to vendor code.
> On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
> kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
> kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.
> 
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/mmu.h     |  1 +
>  arch/x86/kvm/mmu/mmu.c | 60 +++++++++++++++++++++++++++++++++++++++++-
>  arch/x86/kvm/vmx/tdx.c | 10 +++----
>  3 files changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> index f63074048ec6..2f108e381959 100644
> --- a/arch/x86/kvm/mmu.h
> +++ b/arch/x86/kvm/mmu.h
> @@ -259,6 +259,7 @@ extern bool tdp_mmu_enabled;
>  
>  bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa);
>  int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level);
> +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
>  
>  static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
>  {
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 18d69d48bc55..ba5cca825a7f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  	return min(range->size, end - range->gpa);
>  }
>  
> +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> +{
> +	struct kvm_page_fault fault = {
> +		.addr = gfn_to_gpa(gfn),
> +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> +		.prefetch = true,
> +		.is_tdp = true,
> +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> +
> +		.max_level = PG_LEVEL_4K,
> +		.req_level = PG_LEVEL_4K,
> +		.goal_level = PG_LEVEL_4K,
> +		.is_private = true,
> +
> +		.gfn = gfn,
> +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> +		.pfn = pfn,
> +		.map_writable = true,
> +	};
> +	struct kvm *kvm = vcpu->kvm;
> +	int r;
> +
> +	lockdep_assert_held(&kvm->slots_lock);
Do we need to assert that filemap_invalidate_lock() is held as well?
Otherwise, a concurrent kvm_gmem_punch_hole(), which does not hold slots_lock,
could make the pfn stale.

Or check for stale mapping?
> +
> +	if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
> +		return -EIO;
> +
> +	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
> +		return -EPERM;
> +
> +	r = kvm_mmu_reload(vcpu);
> +	if (r)
> +		return r;
> +
> +	r = mmu_topup_memory_caches(vcpu, false);
> +	if (r)
> +		return r;
> +
> +	do {
> +		if (signal_pending(current))
> +			return -EINTR;
> +
> +		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
> +			return -EIO;
> +
> +		cond_resched();
> +
> +		guard(read_lock)(&kvm->mmu_lock);
> +
> +		r = kvm_tdp_mmu_map(vcpu, &fault);
> +	} while (r == RET_PF_RETRY);
> +
> +	if (r != RET_PF_FIXED)
> +		return -EIO;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_map_private_pfn);
> +
>  static void nonpaging_init_context(struct kvm_mmu *context)
>  {
>  	context->page_fault = nonpaging_page_fault;
> @@ -5997,7 +6056,6 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
>  out:
>  	return r;
>  }
> -EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_load);
>  
>  void kvm_mmu_unload(struct kvm_vcpu *vcpu)
>  {
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 4c3014befe9f..29f344af4cc2 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3157,15 +3157,12 @@ struct tdx_gmem_post_populate_arg {
>  static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  				  void __user *src, int order, void *_arg)
>  {
> -	u64 error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS;
> -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
>  	struct tdx_gmem_post_populate_arg *arg = _arg;
> -	struct kvm_vcpu *vcpu = arg->vcpu;
> +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> +	u64 err, entry, level_state;
>  	gpa_t gpa = gfn_to_gpa(gfn);
> -	u8 level = PG_LEVEL_4K;
>  	struct page *src_page;
>  	int ret, i;
> -	u64 err, entry, level_state;
>  
>  	/*
>  	 * Get the source page if it has been faulted in. Return failure if the
> @@ -3177,7 +3174,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  	if (ret != 1)
>  		return -ENOMEM;
>  
> -	ret = kvm_tdp_map_page(vcpu, gpa, error_code, &level);
> +	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
>  	if (ret < 0)
>  		goto out;
>  
> @@ -3240,7 +3237,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>  	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_SHIFT) - 1))
>  		return -EINVAL;
>  
> -	kvm_mmu_reload(vcpu);
>  	ret = 0;
>  	while (region.nr_pages) {
>  		if (signal_pending(current)) {
> -- 
> 2.51.0.858.gf9c4a03a3a-goog
> 

