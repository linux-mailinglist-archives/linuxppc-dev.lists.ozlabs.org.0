Return-Path: <linuxppc-dev+bounces-13148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DEBFAF8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2r54PSQz30Ff;
	Wed, 22 Oct 2025 19:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761122901;
	cv=fail; b=f39GomAAKtnvKF+8hlvqFJLtI2oSam34f94ncBFGWd0RRNBA1FhGP5u9jBBkz+kUX++2KFBR7ZYiemHCYXdQDleri5g5WLyq9U61+m8dSrQAWHGLz3hgIXQFnRJmEJ8ZmT7ouIJBsEyHglZjlkf/JdRwt6vEycWmHlEgktsIJtaIUSfQnCijPVg+2ecP9Y96McEJIuf5nMt/dAGBUe5PwSMEss+BUxEUfoh/ECHqUfWoyAxw2H/YcTP9fuHrsp6VpxbDAMhtdzpelaBgCf9ZNT1vHeGL131k0rB1oBkE3luTbmNVuC6WcvrdF8VczUzC2aWAuVMr/8b5Dgn6HNp8Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761122901; c=relaxed/relaxed;
	bh=2CF3j9IDfanOoUj6MJ4RXqDdQyt1YBEgMgXuC+4yGTw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ib/bIWtPW8PT+z79D4wr6BhK9eKnkPyQ56e9+buM/xVJ1l9vHw7WvAiakMCsTsGBj07tWbiELWFOAba1y5iLJ8cpusWdsM0D2VcC5TmpijI2rxOSmjNHtSK7lG1aQ3JKYFWALH7fjB6oCoRynALfTmYID94VZYOo7Tcfckf9TKNOnUmGNwmhMtWARBesA5ZX5/L3nDXBo8zyF5jsoMTQoBkGIoRVvLfJYWSupeQxyWVlecjahumay/bDbj60ztP9r63Q7xI7chejrZwQru08bd8Z0vt2CPzJDUc7gMdS8MhFeTrnGOw9IOy+MUvA4jNZYoQa5EOw8GeFA8FS4ocaZw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SrHNlv0N; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SrHNlv0N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2r327Wxz2yrb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:48:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761122899; x=1792658899;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=tpoLRRGotezLojgU/KsjfCu7fHYfodSaASGSTxYVAho=;
  b=SrHNlv0NEGcqUo6JwPEMAd16P/Cjlj8S/E28CwsJU7pgaSO9ch3tPw3S
   hKrlr37twIqM+u+K3qia9nIT7H7nyF8xEZsY5OVXOLfBtqSAWb+EUZN8V
   bUx8liJlNofKSSI63SjfyobNIdmkJGBhbIFBRPxBQiBhewnH75Na5YsZ2
   /LbkZ1EzZb1nZMNUcRwOipob71nKD5ODUP/O7UYC4yO3JJs9wBhOINFeR
   51Pk66hwOFsUCpiozDutfUIzbj+KNowFsPUIvjRDMfBTEeuQ643SgxsxR
   ucn/sRypsqWb/hn73HpIVoMeRSCL8XV/a7QHA85crypyStRdZvzZ3V8zi
   g==;
X-CSE-ConnectionGUID: x7c+cUNoRde1miWm3VF/2w==
X-CSE-MsgGUID: XODSvEOcRQmaryx44tERFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67101209"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67101209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:48:15 -0700
X-CSE-ConnectionGUID: dEXOs9L4SMKbGH8oPazRQA==
X-CSE-MsgGUID: Ngk6H6drTwSiLuD4Q0QXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="189097325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:48:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:48:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 01:48:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVYjtSvbkE6wdm49/b1I4D6hi4PvHXQqtymeesbWc84R1LuuIi/CuZYfBfGOK5ki8ulFHCwkcqsagct+DyTK2TsSvKnPhsTUivEiOl9xe3dilMolpq5YSpDQRwgfIYg06zq/LcIwvBzp3IvItoC0mntDJnGVMIprRQP463sStXEgFDBKhrxM4F+eT5FzX6Q8Xt47xQxOLM3PR0aRJyQ/6mM043UF7eh+3ANebTfRpfhEyLjM8j7N10SCd9OgA8cMR6SD1377xabjqMqZy3702Q1GSxT//ATXVmaSP78AgtIFBuxEDHGWSPWsKbM45jE0DyyTD41Q+LXnfVUzcrQoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CF3j9IDfanOoUj6MJ4RXqDdQyt1YBEgMgXuC+4yGTw=;
 b=Bz5ikREeRBRehYgqd5aIk99dTn6cJGlwatfAdh/DSVVkVSuGdEQwPAuppe1qTkImS9tVq0CRQUiCID9XAoKxhFQA6/wq9oqUxKxTr+S5iabrYF6oma89ffcUWOwpsZdU0aN7sFaqsPJhHHkBEtiCWXLey2imIc9idCbY+xMpudCwtnMCF9n0uJJEdFhUgZG348VogzSw1U7VBMhqNmz0xp1LdTENA3ZB/P9jL34DILsipxPZZkUhqWU6MuT+KMLJRxNVc4WLlK6WmsUa4XUyYLwk2gjNRnG1we2cM2hcuisvdxu1H20paN+W4pQ9DjP0Sf6b7tYFDGCrtCuUH+KGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 08:48:11 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:48:11 +0000
Date: Wed, 22 Oct 2025 16:46:16 +0800
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
Subject: Re: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from
 kvm_x86_ops.remove_external_spte()
Message-ID: <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-11-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-11-seanjc@google.com>
X-ClientProxiedBy: PS2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:300:59::19) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2436652f-1d90-43e6-fc19-08de1147bb2b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZioBAm7bbsHKt6rHA/h9fdRze7fJKQu+n2WLO0b/ellmmEKrAAFuG6MTfxa?=
 =?us-ascii?Q?93vD/SkyQKu57ggrN4cv3wkEzJoI3esrnZ72Xz7sfn95xkw3cTeK0SIdK/rE?=
 =?us-ascii?Q?49oXLvUf6BaYkzcIvIo03Qp/ix2VYZolTr2N48RVNnWacbsrgonVLOZEMUcj?=
 =?us-ascii?Q?wMWhRYk1ENXjnvNoQ6T3BEu4TO2TRaGoCFOVm0vmMP8atAkA0E6jXVj0KaEm?=
 =?us-ascii?Q?oJNYWdpW3Q+govARKOYRIw8FVvaL8dYeOOWqSQe0N/bWIaKe1TwNPrN/L0c5?=
 =?us-ascii?Q?ZpqdvdQ6e1f2k36uLqf9vgAxY3CKenQy/qirD7Hn1PWClBLfmGrI4CH3ur3A?=
 =?us-ascii?Q?BVck3UUvOZp0suYv03WvsivzW6EjIlYrlegl5F67dJfaMcmyzkq2HBLdvY0Q?=
 =?us-ascii?Q?KZlgcuon0gDXc+GNR8R55MUuX+RkLPgElGMUCqDPjqqHc0z3aegqpuyxeJQS?=
 =?us-ascii?Q?pjTCju8VmlrarARBSUy+37SaacomN0IyARke6ltYr7WjoKZf0fXR5LL9wqnI?=
 =?us-ascii?Q?QmwIDypJ3LsgrxrxodVd7rHyOlHD78aU1HKtC3OaK1Qu/VyXIB0XRaim0YNV?=
 =?us-ascii?Q?c19uXqb8XlmsMlT1FJJId4ORM9rlWI6utrgKoDWoIdYPWXGyV14DO+eEKlsm?=
 =?us-ascii?Q?imXxvrwKeYL9uMWkZrO9aAyurine6QLkWRsaVwjAAHpQlMnn344Fx5d3ucRZ?=
 =?us-ascii?Q?Y3+QyD4ZyfJSZTViRd7MG9Fs2MXGBy0NZgIBWu4zMN2/0XNbRWl/kYPASt2T?=
 =?us-ascii?Q?faB3ieCayYEo6dk8e0LXAzIsmPCB4BhgfhDb07UO18BDm0V+baQt1Bwlip0h?=
 =?us-ascii?Q?yc0lz23Lbb5dbRQvFvB7aKzJerWU9qQfqjw5s99znlFxYhBwvkMUvqrbTrwJ?=
 =?us-ascii?Q?glvgL5I3iJ9fRvQS7BCMpD/2BVHbew2gQAa9Z/AnyzBjlZYCicQ+c8YKGtvP?=
 =?us-ascii?Q?0MSlCV4WrKF0QgiJeiF+HbiZafF9E3YWX4CFZIyBKg4tWcGJd3XG9eRpE6kz?=
 =?us-ascii?Q?8P/+GIfkMd9KylVB1S3nznmCQNjVLLxZMwbI35bCtdUFfo8ztu/z534BaVKR?=
 =?us-ascii?Q?BBDs4d5lx7zR5BZdZcSeVzFL/TQqvaUSFQnRd7WUK2ovxh3Zp6bnnVx1aPBe?=
 =?us-ascii?Q?vrpiKexFWqngoVIxw9ymkGLyvWINwOGMxKdUXMOMFOlpyTOXzdKZY4/e4QNs?=
 =?us-ascii?Q?gwy7puQiED/WR3+lZMamREQ+0Hsv1nk5PYa7Upz/8pCR4p0CUQqecrYRbyDu?=
 =?us-ascii?Q?S10tEmVZ1MIOG98uPxbHjbzytgRq0Qz47f5L1djeMV+cQS81YPTHyBB7owTS?=
 =?us-ascii?Q?hGg9hjmK+i7qnnlk+nu+/nF7NzoZsb1oQnx7EVlvhXZGUXPS6mVYjFAkEnq0?=
 =?us-ascii?Q?gQ+TXUDv9P0VQ9bApMRLQU4/Z8goD+R5+V8pKhSLynCbr+nuapaAAvYxQ/6Q?=
 =?us-ascii?Q?MwHh9vPSYHMrc89LDXton7ZxNsHsQH4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i59JZYiUMqd6ltU8KNcxYrwE/SpwuyY3dtuFjR6uUz/ue6LKgwCSi5b8Qvaq?=
 =?us-ascii?Q?jevnGVuq3+JLmuc7kX7rYOBU4M28+WuL8zeOy5B2y/049e5Jj9qy0v/z4rBn?=
 =?us-ascii?Q?ca2+e3ggxRPEbCbaQvRAFSgh/nYBWNb8r0ij/T3cEb0mC1UeubmrNAQPAE/v?=
 =?us-ascii?Q?cHqm8LswLIT+dShvPoDK4Xl6QbeBwGGZhoyE+OQ6wFyWFd8fLfXoQgU4MriN?=
 =?us-ascii?Q?fB6w1ix6JbPSrf5eUm3L/88Mf8R+r6sLUPOtg/UxvmvEMs9ubcLx3z07un6r?=
 =?us-ascii?Q?x5xY7H0oCthjKIB7oDzx/p1B9O9yWg6cr2YUuT7IuMBR+34su5lioZPumzhH?=
 =?us-ascii?Q?qXcOP6LJKCT3/WFXMX5vMvGNoZV+o6DBJYczBPf0ocEEG8nWfbeE2pMiMeq9?=
 =?us-ascii?Q?+7UFPOfnZofWDf/kttcEb9LZ2BXu00J32mMT5BsAlSpDz3NAR5T6ksIB/MXk?=
 =?us-ascii?Q?1BCatDknQwjH0FUM8sRemc8Y09tSqTvdmKg4tWl1OA+cFh4wByBtHmAigxb7?=
 =?us-ascii?Q?j8/QOtsBN7t9gBxhG3jUFh/ZLuaHWY5gFnzv5/3uOtC7R52OFlQZ6nI4th4G?=
 =?us-ascii?Q?AYt2hXBdTqbqZuAVzTk1R07L+mL7EaAVUshQdbRqR5LajsCNGmt1kK6bbD/C?=
 =?us-ascii?Q?zGKcj4rDoYShXE0+iWb4knPLc7r1AWbcf/VjuKTSYvC60JqNYM1pwC4PjFmr?=
 =?us-ascii?Q?+OnMMB7QhZx6e8Lwc4B9OJjT/EzCyTs1w6R9u4aGZcN54XNE7zvBzakU6AlG?=
 =?us-ascii?Q?LjrioukLipRSahCJzozKk2+S1Ut78uVNVMCRHnLh8ckVdEis4IiW4hhmSPhV?=
 =?us-ascii?Q?gx+AsC0OR194LM+b7cYXHfPLWFa/SyarW7QBviNgeWAtHWhLJNq6MitttT+o?=
 =?us-ascii?Q?dJFWMYNi2JGxBHnROeQFCCe3H80tHaMm46hp+2ZJZSKWErTK8yo1Q5tV4CSt?=
 =?us-ascii?Q?dprWBRe5F2pQgDrk3xhKWW/ZWEL+lla6dg4P3dhhIU4PmESJnwsJ7lg/qiJr?=
 =?us-ascii?Q?A0zso1D3bgUUP+KoL/rK387VEt8rxkx77zR63TSgAO0MKcsUAwBY7ECHaoiM?=
 =?us-ascii?Q?3A8WVj3qrHJXwO02hYh2oapTNR2JJHMquKkILMDUqZTHbOmmII4uEVsmIEk5?=
 =?us-ascii?Q?y6T8Lsmhzll93oD00Vf4LCApHUT3BdxNHa+TDqIzvPSAOTvpGMH1k1TnV/D6?=
 =?us-ascii?Q?2/b5UMoniEEHouPtRE8jboz6890RUp6sM63pTiK2KUSOmDF4AQgH50zHwqb+?=
 =?us-ascii?Q?vsTK2YYsRtolGDeA6MnW0KYpmvA9w3HIcX+AQ8taU934uemMoFFgXRcc74FW?=
 =?us-ascii?Q?SvjkD+qWagwg4lsI/0euT2TWh6DK9apSpXRpLOnAbn3RzBv+NlImc+ne/qc6?=
 =?us-ascii?Q?owj+wCyRWm5xwZh189t4Kx1BaVcUSnURuGubzTfahMUzUjq5o0PSsxc/8o+5?=
 =?us-ascii?Q?p5OikOMSQBnqwFQSE2GjL31apHteL+8Iv8Omb+cnpvZ8r+A9CcRUkK74VVBv?=
 =?us-ascii?Q?PT9v8jZlAkswhZoQFx1C7aP8wxog70pEefjmN8WiFkJzF1MRD89TaOBJgFZH?=
 =?us-ascii?Q?j1mCJZqABPxaonHgj60w2T5o4FImJ9/yb93Z7JM8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2436652f-1d90-43e6-fc19-08de1147bb2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:48:11.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3IGt4AlXV+ST532hjcGKNFDGG2L1nlJrLdJb0+rq1uAXCei59bzqRTkm99MqVOzA8b+sqBKPfFTlgH25/p3PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 05:32:28PM -0700, Sean Christopherson wrote:
> Opportunistically pass the spte instead of the pfn, as the API is clearly
> about removing an spte.
From my perspective, "remove_external_spte" means removing an external SPTE (not
a mirror SPTE). So passing in pfn_for_gfn seems reasonable as well.

Additionally, passing in the pfn eliminates potential concerns about incorrect
spte content.

> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 48598d017d6f..7e92aebd07e8 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
>  				 void *external_spt);
>  
>  	/* Update external page table from spte getting removed, and flush TLB. */
> -	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> -				    kvm_pfn_t pfn_for_gfn);
> +	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> +				     u64 spte);
Also update set_external_spte?

        /* Update the external page table from spte getting set. */                
        int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
                                 kvm_pfn_t pfn_for_gfn);


