Return-Path: <linuxppc-dev+bounces-13258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEBC05796
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 12:04:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctJR901lJz30RJ;
	Fri, 24 Oct 2025 21:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761300276;
	cv=fail; b=Cf1YgtAKUOU9GMLwMDzUNY8NyhRajb6a2EOzocFwxX29O8DyigbDUwXiboPKsNQ1JzrFACXd1XX0L6d7LPJ3uoDGsde7MPV6MveaiMYzGArMRhfQLSqnIECHujk0YM7HUpiTrbjiv3XlJphJEHRPHEFVvIEDFWt0eHS4ZavY5kRKIepy7DJYFweN42E0Cp8o+AjKOn2AlpTbOpGr+DDn3ALk+5FZnUs0bPJT+NetCwZv1MFIjV8+3GzvuHZpSRPvAGpU8sDqM4Pw/r0hH/znB0op5+AJGzVO4ZTy+qG7Ukt1SE2lseQLwa4OCaTvclapHr4Xt4im7Pz57OvL7OsMJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761300276; c=relaxed/relaxed;
	bh=SwIEDK6kNCu19XS/i7vYrZ5imbc5sPwRUL2chGIoZV0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m3aogqbFlAHRbgmzW09a6PeowKnxwxMUTEOtYW+L2qJprhtMYOxEw16hg0RnNFu+fDQwBmcpHac5f5cyb8rlvFfPs/UWhkkxCoXUi2UQd7DarWd6sn7CIFmJWF9bq1L7avL/efZnTY/p5Tw4HdKAv8HTidwDfoU1CVBV9gJWV9uR/JIRzVKFfCfWcCLL96DGAxbXcL3zP8e3TvtX+XC1jgIhf+HfdND7pvYbjMbdMXoty+pICvl1ehNGvub5xhRrLqZEQXU2JlFsS3IPr19CJDgs6Y2IvW+hg5vXdYVPNy72udSOQN5bhSBMIpBPQ6TeBOEEhhyLAbrot05J8zvuxA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RImWxVu8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RImWxVu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctJR73sZVz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 21:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761300276; x=1792836276;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=e9gaf2ckmpS0Xxr2OsqSA8l2+UlXTINfVoV3/ZlAxRs=;
  b=RImWxVu84OP04gVeYxIUsIcIRsuaqmoEmlKB76mnMPwUhW0tBoGB0AaU
   IJAcfda4MPcPlkgPiubgU2utpEHOjo5btJCslmis0OkarNm13c+VvhTf5
   hd0wIqrOVfCrN+uTcsIDvSHneC1JnQzzOng+gvbFDwvzfzJ9ut0DInsUb
   w97UARCqv9MJj2D4Rn4Woric0z6UDXs96qp8CSrpHqNiy+oM3vLqhZYXa
   oPiIOAR//XeDVyJUsoklpYQS9lIy3qSUGYPjtCRnxGN9TMmDdjskvYG5o
   yLjX+dUFnWpDo7rBStkA5zwrCF9wi6CISteHsJaaPp87qOW3fybIMdGB5
   g==;
X-CSE-ConnectionGUID: u6AE3D28TR2z/GIwZE8DhQ==
X-CSE-MsgGUID: v+D9PxG2ROKwnnZEYO4KrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88948248"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="88948248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:04:33 -0700
X-CSE-ConnectionGUID: GPOVkr6jQsSPx8TvIReg0g==
X-CSE-MsgGUID: r+uGsP6UTiSBkV7uw4dHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184288694"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:04:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:04:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:04:32 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C85nUz9Q630UoSpi/eA586DohRRouLmsoUhRxD9OVRWY6I+bXDH8vqZ88S69iM/Gtmkp8346NTr7giC2s02OOTY5burHLgs18o45IM9qgz+XhOEXT3nA5q7hxozLvlzfTQLNJJzsydxXVdHoHwkFi2XxlQ6vzxjF+viE12rYZ2ccMV4OLpXLMX07vA1aRS4NBUoyMKL2QJ5T0rXxeoOGcaPdyTC45rLMsDhO6YjtfIy2I14kXGAHJxM0m+sYHmQ+IOQEaXknzCAni04gJ1Ux8Fo7OHsCmFv8MtI0b00IElTAdpcamOovdizBnnYaPVTGkS2TNYe+N0+m9yvHHV8S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwIEDK6kNCu19XS/i7vYrZ5imbc5sPwRUL2chGIoZV0=;
 b=ld7QqUAUqD/MycmXQW9AnU4vQeKeMmrwXmHNV0IT9y5onuFoH6eqX+uEWa/a/TedfhvRwnvFdqnDHWBXVETC1w56kTDs0RyaajO+1g9ZCvz4QDVo0qa8SmyX+eN8KO5Qz4edg/60gHP6PbjjsXIoPtNc8oUj8siEvbZRLdKey55d7tIQybs2fV82gb4XXfc8qFfQHgnHKE8XyaIkpPeCnbpTh6PwHZgVNQnCxKXcPqT+8Z71laz958LDbugnZTyGWhT1s15FdaLMHTJmdqUZ3J2Xn18sNtGjLGRcMmBWK4t/e4IInfi55Ba2xo8RaJOVy+uhQYGF40WTAeZxwpboRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:04:29 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:04:29 +0000
Date: Fri, 24 Oct 2025 18:02:31 +0800
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
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Message-ID: <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-25-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-25-seanjc@google.com>
X-ClientProxiedBy: KL1PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:820:1::22) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f453ef-b787-49d5-d1f6-08de12e4b8a3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CKTOxtdEN1qHNFX4KW+jtPkICSlGZ2QncWc/HtmXG/6camyP1CQ9R3NbTcxb?=
 =?us-ascii?Q?UE553T2iDIsO42sJjta+wniNLX2uxZfj/KHGS29JMlaQYH9+LokvohDyuTXv?=
 =?us-ascii?Q?of4DVTV1Rgbe7ZJHHwZNnAmS77hQXKJmADJVzA5TB7Y/FROoyrg/dm73GNBQ?=
 =?us-ascii?Q?TrRtdjt/U8cO2vMTbZJpa2fLE6yDu5Puyd0p2R5Bi7eGNmPqcRinSm8NQFdS?=
 =?us-ascii?Q?RI/jXqqsHIwjbk2ozUL1eEd9+aIRXR29UcoBNOWo/D4KMGNmvGrDN14TiUeq?=
 =?us-ascii?Q?cFTgc4Od/D2qj2pSJrkgznIrRYHAIoXwpU+hWkfjNyxOKIAxYYT1uAQc/u5M?=
 =?us-ascii?Q?QSaFLrXNaKbTY7JxfhvNgGybfMq7QLIrjl0Vwkv3Ss9le7A8EYwABIjvU2ss?=
 =?us-ascii?Q?fFJ+okTJu3vk+0GUgDDqhXLhRclUx8d3gAODsQ+4XdqAQir8m+/mxif6xvso?=
 =?us-ascii?Q?EriTCOAFjUwBwBklt3Q0Zc+JAnekklaoVuj/wJCNkBv3Bowuk0PD7+B7kTWv?=
 =?us-ascii?Q?BX77489XjGA9YSUE5cITn9xFlZ466qi+l8voUf9o7qwCHxk2kOfGMq59zyXO?=
 =?us-ascii?Q?TzyMTjPEygu7nsafb0IqFwLQ94idM/TD0U8N5nHngPcpM9D4yttxMGAwQm7W?=
 =?us-ascii?Q?noVPrUU4/CqdtT8r+pp1JoYW54o5SCZBpsbsfZVYKDwdgz+makd4p6shNYMq?=
 =?us-ascii?Q?6FckTaHoC14OCaWpQsPeveRfG31hIgcPtBCRuC7cGYFFKgsXTOajz6kM2Ef9?=
 =?us-ascii?Q?BfG8ZT7VdPSnqw57kkfo8RndujXfvrYy09hzlLiGxO8TqRhwYjMRLm/Q4SmR?=
 =?us-ascii?Q?GVQUgPbUY6pvRPwTM12dzmcdTpsHq+4WisjTR3NCp1G4Nf9XETyVu7Ird9wK?=
 =?us-ascii?Q?iPJLcRv2i6bgcLt7or0FiFX5NbU7jQS8iAv582LHWLrNdvd13RmNXABn/6ie?=
 =?us-ascii?Q?VGJEDhAiiFIZd49ev2HHJeJNSEsYIsN21fuSqW+8Pi8HKgnpfrNoY8GS8NlY?=
 =?us-ascii?Q?gn6XUOVavx+X/Np0MRpemZeTB59QPMcJdawA5FeyUi8QejaKj3hhJb/jB0Zo?=
 =?us-ascii?Q?UgIYsRekLjzS9NhqatGl+nP4hBSB/bJIJd+Hxg8SVMG/VeLxpkZnVS6eB40L?=
 =?us-ascii?Q?otzs4KES+4u4Y7A1dIAClqlyBRU+eerz5OfS/AeRuWuU+1Rz3qvWEWm9DA2j?=
 =?us-ascii?Q?jl2fdCIhOcn72ckOdxyQYoXh0aWTKz6jJSvegSr/Om9HJd4OMRxkhzY0dpcC?=
 =?us-ascii?Q?44RjGsGdu0k78qvv/T3AiS4q6Y0tFbfOoiNQPjjh9SyqbsNphZhmZYXN4nDB?=
 =?us-ascii?Q?iC7xWHAN/RuvoDcRW4bPRQ22gWXK1IDzc7roMjRbUFEw93Q2aFY3qbqLJV/U?=
 =?us-ascii?Q?183opRqJHO8VvAtNezseLmN3H/CsHTSbhVWdeULReGyXwntkiqqDfkBwmgwP?=
 =?us-ascii?Q?y7ozpRXj+zvEAk6tx7CfOt8QcVfMbmvA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJt80yILVMwD4YRmQZuVbDgzlaUtneXsVB5w67uOF3Ws4OUp6eVhBzyoeroj?=
 =?us-ascii?Q?9jE7hZdSwnltuUL7e6ZfE/q3xHhg8hnDL4S5spAU+z+dk6AltHk/OjM1anuF?=
 =?us-ascii?Q?L9GIXX2jFHZnjQmroh/G0FrXW/KuNgWRS38rLviq9hMqnPigWm4CXxkeQDHJ?=
 =?us-ascii?Q?tu1podTSTxaY7fBhA0Ze6rc7s7h+dTXaTCL8AaOiXn4IlIsY00/HDIALqHLd?=
 =?us-ascii?Q?1u7TFdUp+bQ/NO+PylcUs18dv0E5djWeEcUOnqlUcoEXfap4DeVXPE07jO6l?=
 =?us-ascii?Q?l8f5BfVucdVTjZLZSGP+nRFZZ/7+2Ti/RJU/4EG8CVi7p+0fKpwReyo36HO+?=
 =?us-ascii?Q?zts0b4xb0BQ7eRgTnAPDtPaNTD1aoi3V/s8ilQkcMkI0r6FR5OCVtW4XdiRv?=
 =?us-ascii?Q?+7wQjinfnmCk1+Tu8rRuLFUZECMQEfgSwoDkwgcMkxInj+O89E8PZywStvIM?=
 =?us-ascii?Q?0fyyp5AFQ1P09SywxGJrNFP0q3TsKhZCYS9xE14CQQP5hLMcO3VVs2W4t/fa?=
 =?us-ascii?Q?43WwP5cteNSr0N97vWkskKZ6YkavADN96VcA8ubdt9jGHPahScg+bceOMoSa?=
 =?us-ascii?Q?Qo9Kl0RetlKpb0iRXqCQpDh9H8PApj6knfN7S4ywRyhNr9HcS3tSKb5NGtL8?=
 =?us-ascii?Q?Jv3FbElKmw7SS5c/EH8elaVmObBKFW4hu0Ntq+5Wmaa544wwy8CBQi0KRyUr?=
 =?us-ascii?Q?EpaXS80qu74VGDuKakwg8RUfaZmvkl7SpUuBj11D4+6NYr8gjr4ICQBDjBbi?=
 =?us-ascii?Q?AG9/WAq9mWsmTWh7r5rtf48OHxEaDSNWtwAPT0Ol2i3+Rqrq0TxV7vJHsNQ3?=
 =?us-ascii?Q?ojsGV1KNljQ3CIY3G5VVU4ay53S4gMXrUyLr1FGRNMiMie/HRiK4q8sh9vO4?=
 =?us-ascii?Q?arQL7FKu2+Lx0JWABP4Pnb27ghTMWQE+svGC7cSwoHfUJefbj+fJ+K2tskiW?=
 =?us-ascii?Q?7BU7JfByvYSleaGfBU8CAU9MJ/SJvvdz4s48fPY4PuidgSaMeEtAmomNuLB8?=
 =?us-ascii?Q?vddvCeOGWYjy7VMkqjliQRq9NdUrtsiOmQqxryKmrouKK3So8GW0KZ1pWetI?=
 =?us-ascii?Q?IP9fn5qyXl9tRPK29Hy6ujOUn9b2e3+uRf3t7m5/t+RZg2HRhPmTSdPy0uPc?=
 =?us-ascii?Q?XunW1IUCTVp6hjBKNxBhfSLI6tQWXAnZjvPywynRbdUfJn+St/aq2eP3M2mb?=
 =?us-ascii?Q?vLUuJhS3wML9ttgTxZTEesk1taDlTjyodR28uF7rxo7glHlWiHFnxbvEFxYk?=
 =?us-ascii?Q?UonImG3CVen6ZWKWZJ817q7MgMP715p6qHctnX6F2z0E2xl8EcKk/TgTTLdS?=
 =?us-ascii?Q?7RJS+JM3/5BzgWq97CZPRp84gmKqohYM2df4JG10GPfC1YscWJyOC8sJWLMO?=
 =?us-ascii?Q?F3SPp8URQgGWnsWqu/uQaT6FCe9C9sGc8USrs77+TTpnkEafucUJXdzn05qJ?=
 =?us-ascii?Q?/PWCktkodCCggGMCkqbSnUZ9/0tpfNc7zL7oo1934VEdVuWlQNKhupsAvfg8?=
 =?us-ascii?Q?0OtpyDSA5e12TOfWa+ihYc4XnVOfK+DIcM/EVIQHSfqycKqNAVskM2PVvH+k?=
 =?us-ascii?Q?d1GcAvvE7GRHgXxSY6QpkUuFDhKsrygyg0R2x3Cu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f453ef-b787-49d5-d1f6-08de12e4b8a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:04:29.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8AGm7XfqsmdLk5FHHb1UHLA6jCeI0NDxXhBWBVAsbJoTdQKd6b6QPNyNS1qnJg7zWAoCfyqSkVXN+VumEfAjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 05:32:42PM -0700, Sean Christopherson wrote:
> Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> servicing ioctls that (a) transition the TD to a new state, i.e. when
> doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> due to racing actions, e.g. if tdh_vp_create() contends with either
> tdh_mr_extend() or tdh_mr_finalize().
> 
> For all intents and purposes, the paths in question are fully serialized,
> i.e. there's no reason to try and allow anything remotely interesting to
> happen.  Smack 'em with a big hammer instead of trying to be "nice".
> 
> Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
slots_lock to prevent kvm_mmu_zap_memslot()?
kvm_mmu_zap_all_fast() does not operate on the mirror root.

We may have missed a zap in the guest_memfd punch hole path:

The SEAMCALLs tdh_mem_range_block(), tdh_mem_track() tdh_mem_page_remove()
in the guest_memfd punch hole path are only protected by the filemap invaliate
lock and mmu_lock, so they could contend with v1 version of tdh_vp_init().
(I'm writing a selftest to verify this, haven't been able to reproduce
tdh_vp_init(v1) returning BUSY yet. However, this race condition should be
theoretically possible.)

Resources              SHARED  users              EXCLUSIVE users
------------------------------------------------------------------------
(1) TDR                tdh_mng_rdwr               tdh_mng_create
                       tdh_vp_create              tdh_mng_add_cx
                       tdh_vp_addcx               tdh_mng_init
                       tdh_vp_init(v0)            tdh_mng_vpflushdone
                       tdh_vp_enter               tdh_mng_key_config
                       tdh_vp_flush               tdh_mng_key_freeid
                       tdh_vp_rd_wr               tdh_mr_extend
                       tdh_mem_sept_add           tdh_mr_finalize
                       tdh_mem_sept_remove        tdh_vp_init(v1)
                       tdh_mem_page_aug           tdh_mem_page_add
                       tdh_mem_page_remove
                       tdh_mem_range_block
                       tdh_mem_track
                       tdh_mem_range_unblock
                       tdh_phymem_page_reclaim

Do you think we can acquire the mmu_lock for cmd KVM_TDX_INIT_VCPU?

> @@ -3155,12 +3198,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  	if (r)
>  		return r;
>  
> +	CLASS(tdx_vm_state_guard, guard)(kvm);
Should we move the guard to inside each cmd? Then there's no need to acquire the
locks in the default cases. 

