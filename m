Return-Path: <linuxppc-dev+bounces-13631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51802C23CF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZ1n0zPYz2yrZ;
	Fri, 31 Oct 2025 19:30:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761899453;
	cv=fail; b=nawGoMMkEY/dIpdKq7UpOTQfbLu+9fPWEeT9CwA4dh7S0R/ClDhJXQMqnCPun++j0zH1Q70HvdoExYUoyTbNvOQiRDhqL7RCRtEqNf14DaWuZ2uykAUdqX9JetdzN43qS5J7OD/rzn60TNA9F8Rtd3lC3JFc0457OzBbU2vQferNjHW+YvhsEKyyb9HMYLOLjLId0i3HqWiZSaRx8q8l7yp5iUuux7BTU94Y+3wopFhWAcfpvJzLWz2UHUIKU0VZSYmqmDvoZ/4jFv6BiFzCLnXi3JJmHUfFwGMm/LxY0ZNqMyxI/8BTf9mPbQndTTeVoDoLvtSdVMu2qGzg5Jz3Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761899453; c=relaxed/relaxed;
	bh=+EF9Xr9zzkOS9n+jVhnEHU8uxgj5gFXSLoTryD6d/Wc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=caxtgE4shBGszlafZVmhe82orjbUHnsvEgU2lhRj/Auh/7udxg5dpG1x987cWXEYtIVEzKUE/evjabPXkgqoiUoV0E7SCpxoAQZrgEuV/xAmj57wFLcT6kahLaTSJaSVlmVEX5swYKh/hDbkWnrhg0zx561oMIPkM4/SGSTFUH2ljiz7ZgHxq77uO4g8nYwvOeK4irHlxPFF2oZdjPI4rzB1eWbiX4ZjXqVy6BGLDqdRQDfXa6+DzBwAvlKkr4oSeShkwLX5L3p1fKWHoUNDM1+oAIAtgcKvbYrsK1b7lNiuqgv03p1qOhOHxefCvf4bPV94NLCfIEcP7BDE8n5YWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDtal6r8; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDtal6r8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZ1l6MYpz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:30:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761899453; x=1793435453;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=SwSUIsLkf1bb0G6j/gYXjbbhuzp3bjyAhquwCNNeMYM=;
  b=iDtal6r8sSkmAgpr5kMbC6ilFcqKVvDAG1+clfak+PQd2ayuQIUOTz89
   DPMtOQR/FDFuaAtvtBrLazyTaNL2I1Q2kkNTlIChh3Wi2AnOxEm1kIyle
   2GZUVsGcKRbDUZ9IYgFYv1nC5JWenUP1WkMYjfzQavaAqP/DlttI1UaIp
   5cPjOVZDRa5Qeezrs8OLj6yxG6J1xHdOcQynx3MlhoM5UAuY2R9yJUiHd
   NRMDWeGLCh3KHxjxaICeAN1Latkfa6Cpl95E/dTsTPrWx0e4ZOMcFA4/g
   M4a98eWaQGnghXraH+cP5IhdUrYIjpEoyvxSXIRF5sMA8073AcL387D3k
   w==;
X-CSE-ConnectionGUID: bqMn4X1XSwWjzEzJd62VYg==
X-CSE-MsgGUID: OPHGkY0vT6a3H9EQkptB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75504851"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="75504851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:30:50 -0700
X-CSE-ConnectionGUID: ZbuwHgFORlaIgWiM3ym1cw==
X-CSE-MsgGUID: pW6sXiYqRs+i0XjbMS97dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190259139"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:30:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:30:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 01:30:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+4d1XwPAkFEMvyDDkoco60IjQOYXVjrLnOwv0EhSJCbStZ/YnSxkmynC/H4c0eu3O5mHCQL0trOXqRy6p+TPSKCHGnPz9V8qT5sRzyPZZBl0RZw8RplEv2CDuM27sS0Wisg+j1Fy6Wg1dZ8vBUqRO1aSYPJ2afMn0tiuS/UXnRJ/no05yrT04uUUA5g3cvBKUuClv9p9rk0Z/DJzdc5nf5J62lCRH+Jzhkjt+q0+QvN/Fl0DfFZG3rdmqo4iru3krZmqRWBNPn3HMTYGNvEqyM3uePSwk4LD67eR+k8ZXntbT0gn5cU9lIzds5ifL3+g5w+B65crfitSmSAQfmSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EF9Xr9zzkOS9n+jVhnEHU8uxgj5gFXSLoTryD6d/Wc=;
 b=KeIzfV/bBw5FGkVhJ5UevllgWnSFhvP9PFyD9XH3sE7X5UQgO/5uZ5dharquv1Ivz/TOAmXJBZHiZ9XzJHqQr97l7GIJ3mpZ/LAE7qh+soXzr8B4ZoeOS3aU2kOXzLhP03KED1NUSezJ4h0h8SB+by6kjQYKuER6dRP4FZ3i4dzo6MIhnj4trmYnNnL67Qp/3Lwx4P5Grvk1heRL2hWXS7EawUqM6D0+QuiksOsi60iDs0oczzdlRgEYe1caqOtulEgPk9TW6vJqGgZaikdmMNzM6j4KrM/13VEDKhP0J5F0G5mZoe+ihAVj0kgICchoaziVyVnkBf0VL1c/tw0cCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 08:30:45 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:30:45 +0000
Date: Fri, 31 Oct 2025 16:29:13 +0800
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
	<kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth
	<michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Ackerley Tng
	<ackerleytng@google.com>
Subject: Re: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in
 S-EPT management
Message-ID: <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-9-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030200951.3402865-9-seanjc@google.com>
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3592603b-3d74-44b8-985e-08de1857c94b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSKjGK2/0htILDOmL4r7qmGzPEZSe+OJs9BDEeo4K3/Ng+UkNwy5gan+ibCD?=
 =?us-ascii?Q?tw+257GeCjaVtbJG2hxDkE1LTou4J4MR7Yw2i+yFEU2GvqMwW3LCH/D8frfD?=
 =?us-ascii?Q?JE4bsiywyGI2QVKNTHWZ8IuiF7m37NbjA6493DChAHY+lJSYSgldgu9+JDq9?=
 =?us-ascii?Q?E5U4Q/elulGAbl6B4/qE8I51pYxXt37PeA7OfYtuTVyNHYx+eLseBCQh/Pv0?=
 =?us-ascii?Q?Nsd+Ja0CTX6mWcHQQC5hYkr0OcsKOClUrnSlCSyGtqJgjAZGF4Co6vT1/Vhd?=
 =?us-ascii?Q?qffYK4WVzX+RGCZ5fnhnX/64/szl0ajT2N6T6rwyy+5DtwiLE7OxuacF/YTY?=
 =?us-ascii?Q?D0D2o42y+/1RxajZfenH7tvppD9Wtah9GZp2VyOcLGsKnWwbwQPjj7gl3um4?=
 =?us-ascii?Q?wAjiHfyaNxaS64Lsbk0D61N+6QgCfjpqZYpVM8wRDQO3uzrOIKuHC1/Foyff?=
 =?us-ascii?Q?c3neRvtcVIc5lx6LlssLGC++86AVYxnIgHtyxH/bMgxNSgnkn/2AzwQstplc?=
 =?us-ascii?Q?uORhnPpA3tjS+wMQrEK+U2KbBZPRc/KiAXNak5XBWPel0AEGADmUKnWxL8A0?=
 =?us-ascii?Q?DibfQTt2wtwXq2W3g5uvlATV7LfQz0An1zvmPdXGAuxbzpnMvuoWhxktK3AG?=
 =?us-ascii?Q?6TZBmlLsWpqoLySYIhXjWh7xZzsa/kW7jRNmBGQ6OmzINGunB4UN76cc1WOf?=
 =?us-ascii?Q?W4anrxNSq2eL1QVdc2qO2bzr60A8UfDizKM33j+UcY/l1jKtWdNwCs0qkHcV?=
 =?us-ascii?Q?QPvXLLNCrxjlu9aL6KsGw+PwFYZh/+RfJ5olGYlmFXwWI35XmqZIARfoPP/S?=
 =?us-ascii?Q?Vodb0BAeZbouqqx/02X4hW/Va8VRbwR78Td/gFXcnQ1DhlVwfxpjgLITuu4f?=
 =?us-ascii?Q?VABJ/YA9Xf1fHtLJF1wUjcObNrekpWhAB/+E0B9GoLvgtYr+sfX/s+u5D/jb?=
 =?us-ascii?Q?WFQzf1YNjykK31HMaoNF/jo7XV1ChNWQcnuFiFT5ypHqa9RZqUPsvW9o3m+M?=
 =?us-ascii?Q?rp6l2PlrTo/xQQYERFRSBSSoCdpWiRauQCq3Efup0fXkBhb0JaLnQwG61xMS?=
 =?us-ascii?Q?XyWGnev/4cVVXFq6H9wZ+7SGssW2NlGHew+3VK/UB4brTli5EmidGTELq/UJ?=
 =?us-ascii?Q?rGkyHH6Lpx1rXhlmdDGoaJpZExiMplAFpv565JdaTKHJx6j8xPbDY7KQ66Lh?=
 =?us-ascii?Q?QPcWQ4uHXijOVXbp/FjHP7rKVoaY9JCZJYUTrr3llY+fzVEqz01kVVe5Hmt+?=
 =?us-ascii?Q?gxLD+oYSh51XTxTLpH6CcieKs+CQaN+7T95yzYtpmVM9QuvUw0UF0dyHCwPp?=
 =?us-ascii?Q?ClC5Wgj7fhrybZ2QiGX+omaKHkAL/pS8irHrJPqvtp9h0qU84LjaSZqNLZWt?=
 =?us-ascii?Q?rspo191jcvAkvP6vxE7Q/7Uwe5sqzaFz339k/f7zPecDaN3nQrvYTMelqm0U?=
 =?us-ascii?Q?KMmdm6d+Lgptc5ZiL8C5jzc9w5kPR+Sx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEIX5JlRAn60ZKzDs/96YGDz0tB8fN3W7eD28RuEbrKtJbCHiN8V4mOWMipI?=
 =?us-ascii?Q?8C02Hl4P7jxHdAr/xEw2OovpzxcmyYc1VCtRFSH45ziJQ6/s6Kuyiu4qPi2L?=
 =?us-ascii?Q?KtfGxT0YAz2JdTHoE4RNAdMW6ie4Kj0OrbznZXB3rjRnkLPq+c6J4hacF8x/?=
 =?us-ascii?Q?jOc68v2HlYcGqwqvukbdW3YTtrBi9jiqeg3tVYQXpJN5W/UD1PVzIBqz+o8Y?=
 =?us-ascii?Q?otV+c2ujiE/PFpVXCx9f1AsL0TNDga4dSTDy7BRVptQorZH8YOOCnBuBZzCT?=
 =?us-ascii?Q?LWdJNm8D59qPUDI7Zgho+i/ShuFAGQ8Pu3bbTnsYh4lcqSUe7xZ2bW9rkWLC?=
 =?us-ascii?Q?4O1PS8D6gtyuSjS+h7xyqexq/YBGTTXebn9moS1TmFMrLlt3DSYml5CxWXKF?=
 =?us-ascii?Q?Op28PO13sN+wlRPlXw3VdiKFHwP1nHxMlVt2uv1dDASxRgB4BxuCgCuJHd/2?=
 =?us-ascii?Q?xGI+WPccidkugm/sivVLFVpBV9uTldNenX4RI18rpscaCDE6sMZpSMm9K8sP?=
 =?us-ascii?Q?Bjq/oavGBbmY1BIS+KpohIgec8KDL6zvvYhZLrjB1j3dQ7bbNg2J0+0ATNAV?=
 =?us-ascii?Q?PCXAM6+Rx1IMplqydmuUC2smgoyhy5XCz7IA0KBBr6yBxATNj87f+d8JEiNh?=
 =?us-ascii?Q?DLgNUNeC4v8vSXvBCdZg7taOuHVbkH5inLJvQ30Vir393li13XwGfL8buzAk?=
 =?us-ascii?Q?I9ShzzBQDc64Px0LjhrythdUb9hMQGXTswne/PdCGfY/2CI2I8mw7XGKf1Uv?=
 =?us-ascii?Q?3uayxAJtdYSRed3kR7ox9gdkCsf3AQ1b4ISHcGiPIobTmK3Wf1wFanysYde6?=
 =?us-ascii?Q?m/FHDVB98B6APAv8j5rMo+UA7hBYc1znEnkXeElmCsOrA/+Invg/V88CZjEB?=
 =?us-ascii?Q?xeYNX01yJ4lTV/elHea4Zj90zb2xMbIuPf+IAieiaK/IfsFYgJ9JZUtRj1Od?=
 =?us-ascii?Q?uA6CCm5Sh06MUrE2bGqMUkJxWOrdRxPxMFufOa0cl7acFWg5yPAJzV3bv4h3?=
 =?us-ascii?Q?pPRsbQXTFA5qLq9/DEgFbWO/H1ur+1qaQVwCche0UFFv1+3C67IayHNSeadS?=
 =?us-ascii?Q?hTpqIy80UzCfRCpwzEyc/igMtVAa9xjYiB+OPAS2DI3pJng8qLSAvVaC8KW6?=
 =?us-ascii?Q?PA96nyza8hHsoWp/gaRMlKeWySOBjFyDDlIWe691EOzhjDEJNcCywF9eeohz?=
 =?us-ascii?Q?2B4dO4JGE73SEllH/kU3bfYLBkTyYJeqqvTHFmVglTLar318sAtbnu1R04T8?=
 =?us-ascii?Q?fUnXCwii077iR9uPbEDGwvmv/tCIrK0My/2uEHobQz9/rK2fmy4ChrPVqnXZ?=
 =?us-ascii?Q?Dab7b41R2VnxLZMvAIirD93sX6SOfrzt4QuBGyQ+gruNDAJ2rcooMFOXLPfb?=
 =?us-ascii?Q?dv2v4ISOjxE5kyMJKMo4+AK+P89O3uU91qBTwJouSkTTVZ3s5j8hs8tSf9xw?=
 =?us-ascii?Q?PE1TxVH524X+ko/NPi2RO61Y/qpzlZMlgr7GD+58GDqUCuT1f1q0SosTNvkP?=
 =?us-ascii?Q?P2N61jLQgfDnAlOnEn9XlZCiNbnEu/mlQTTRk8rncYk1yb691UwG2hx6oMQc?=
 =?us-ascii?Q?q+Xq9qIA0YebHGrApnuRfN3WsjSiRFjIT2PDpK4A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3592603b-3d74-44b8-985e-08de1857c94b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:30:45.3067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipXxTVHrOHMtZUHBMvUUwJ5XLfU81QTuswH5FtDuFmhJMftqlwddWpxorKo2ma4q7O8YS/CM/Z9Ny/p1H72ycw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>   - Increasing the folio reference count only upon S-EPT zapping failure[5].
Nit: There's a warning:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
 

