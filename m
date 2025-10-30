Return-Path: <linuxppc-dev+bounces-13549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F1C1F01E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 09:36:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxyBg3sJkz30V1;
	Thu, 30 Oct 2025 19:36:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761813387;
	cv=fail; b=Ko+VJakW+c90VJlC4hSjkilbR2VGwKsMpYSvROQcKsMSKYqAcMTdu1iGzgYw5LiBtgR2qKUJUh9LvMsN0esQ2OsSgOCNkh4Ru/QragL5wLknClRTrcoGJ7a0CdHBZ4nKzAzPnoDiqTIRslBbXguc8twCx2gmXHx721ZrQQQwnKtRhnmbZieO/yVQpiuRtarJEpv2qZm6rk8xrjfnifZPcJJHjUW6KOsIlxnHIWfwJF4xd/a1zQ87szSCPUDUr7l2SAoRKGLvw/t7+wuyMHU1B53N1cXS09D8f44iwLhQ1C6gcHbYnTMhnj0/EeyYV8Sj2RHetzrOxeOfE94xU/P1Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761813387; c=relaxed/relaxed;
	bh=J7JKrpSQNngh4Cj+kL4RuQKwh5mKy2/JvAG++u6DOAo=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BpRNDvOcI1frohnaBex3JlV7EcJtJxZybdUkiOb7XQfqe1lwsWFO3Ae+Fp1zuMVVWqk86PrqFDpzzan+7a1ki4ZU+oUiFknFauChRhWh52/KmxTZO9KkcKP/3sCp/Ufg/tTISWQn0lMHIBB4vJwBttqPlx2MawcEBOA59YU4dJ+1y8tBBtyHmnp/IEF4SPqUmDVA5wUuOFlgu5hcTfsxAJhgYtPTwqlfXtViEaeWOwAr7UL5bDvHTj60sPAqJm0VGVIcgo42q7Bm8m9w6870Vzxbjq/xucYfZaCxycuN2GhaOkBcqocC4GKGoB90rs47LMvJv2aeup3ip4w12VCrCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPy60TSf; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPy60TSf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxyBc4zKTz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 19:36:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761813384; x=1793349384;
  h=date:from:to:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=iO/7C/f+PAaU4gzdHEg/d705hAE1OgDakFwBXWNwHqI=;
  b=jPy60TSfP8+/tOH38mBmZZ2fU/YgNUuV+T3WUM+cAe/Z/66VP7tdGx0q
   2eKV5FLlWuYszUGiCFC2SOMLJRnIYO3B8cJvzldn0T7PT7ptlQ9NqSKMQ
   sbJfjlO7S5842Z6lAHw+civ/1a58x9khsAGYLuaV2PRfZhB5S3V1tDTdR
   T0CTQnE2kZB1ggILsx2VOX3LugFzFlcI56VJDlRK8FfyBbItLTP7cpTgO
   IcNKsd1ohnDQgIRRFob3dlFn/6mWCGtRIOxMQaZCOWuBs3vlgE14GKiNR
   IL9HuwYPwKpR68TG2uc+6RGvUyg4Po6BE9xtEyWS/dpqfpf23ZiEHmslf
   w==;
X-CSE-ConnectionGUID: 4bTK78rFTsicOjoPXfqNzg==
X-CSE-MsgGUID: zTkmT6VJQHiLHgoS0ds0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74546993"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="74546993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:36:19 -0700
X-CSE-ConnectionGUID: DJpFX/AtQKiN5abQ1pvNjQ==
X-CSE-MsgGUID: 4CH/1xuiTViZOPs+EeE74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="189967771"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:36:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:36:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 01:36:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHvisy+TJMHC0sU7IzW4ss3bEucmJLHrwXsBfI6xjc/3UeCJ1VTH83PI9BAubxqFucFe3yyjFfGbRCXdJdSENhs/+o77v4G27BwsQ4/RwGRzC7lbvl0nVSqmDDkIQ9nJCRs8La0f8Iftr2eTT9XPuwIUM+IAQK2VBwFHpiUkM+nbxYwMh3UJdpaFuvbbCliHy0X+GTbWtDB9IpoiJV7lB4VDNmBV4V9TK9E8GMr4I7jy+ZZcGzUva1cTC/n3rAwD4wwEl1a8oo001iBuHMe9jRmugr441XA3Wah+9dgLe+5TBCgqsQLOQ1ek5H0uDx8dvn/xz3IIZDHB2Bc+C5kIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7JKrpSQNngh4Cj+kL4RuQKwh5mKy2/JvAG++u6DOAo=;
 b=qfRvP3/ZwwyjnOial6U3uUVN4RRuLEUVvBhcSIZfgS6ZdgNNaqUUKFR4TwKyBVzc9yJ0OvDZhkjcZrglsWV4gz9slkEqRUPuq7ya29qv8LNrsJj/GGYXzgKl97tiiMqfX+knn6fo2f909YQbkyuFplrz0qePtZdUQKVyn7Oa/htNskHpnz3wnnYddRau0T8dFGl0t1I5VMbVizPEqgMYpPfYrWceWLexKbivS7cjkpnhvh8L8rY9vzBUE9G6BOfLcD433SbUF6567Re/B9rZf4m01tWGKTs3B3FtmYdONG3BadvvScuLYITY06HOxMOTa08FupiKLloyf4PUBATkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 08:36:11 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 08:36:11 +0000
Date: Thu, 30 Oct 2025 16:34:06 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Anup
 Patel" <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Message-ID: <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: KL1P15301CA0056.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::9) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|PH7PR11MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: b9dbd303-f947-4e8a-effb-08de178f60f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v8qLTVAD80A2IPrh4sCXBDsUGytAq/YurDXLXHVj52wbeOJ/jSEueS8b50XS?=
 =?us-ascii?Q?b9b9wh/9dULo06lsvaed1p5cMT9FJOEdWUeGRGKiHsQvXktluRa0QgZqOFgN?=
 =?us-ascii?Q?VRw2Ee/wRG8GRYWDVeIFR4mDl8ju3SUzYI2xJ8jkjxsDc7Gjb+4GpYcWS0zG?=
 =?us-ascii?Q?osvPO9L/puF84wbqgWS59NwE/zPvIPqJR6p3d72hNH6gdQiJfhNAOJAggvpw?=
 =?us-ascii?Q?L6IeSq8fI3Tzyg6Gw4xfMJwx8KC+fES9zcGTKqGnoT+FDSk8MRScVG960nWd?=
 =?us-ascii?Q?AjrxeuJpJTt2iWcW5f/42E+YrkmIDrU6e70U6f1c4W/+1+MMwKFxgXa8tTNl?=
 =?us-ascii?Q?9lup53Gx+dVVKZTGMrDfdlOiwC5XnlvtFWMhBjfOQZdnkmHrj1mjXb2VJu0E?=
 =?us-ascii?Q?XRlQIuV9bjWObtFBe/aPkjz0GOYSFX/FyJ6AHGYN1gwDj+m+WuCZzeTVoOtH?=
 =?us-ascii?Q?oHeCe0u2hczwcf5v/RoCm9g3cB6Smmu0/c1JZIiD0+3g7KdVzYHAZZGlH2pv?=
 =?us-ascii?Q?FKXKSKM+EQ7pBVuBNItFeQxnCMyVyvho5df1Y/cH0HAMQatAay3wYXbonyLW?=
 =?us-ascii?Q?sUmBRUe+QCmz9q3jUzNlaYvq1rCqWL2GUW7HTFg2/EA+vqaMUQ/EGFtKCaWq?=
 =?us-ascii?Q?WG7YQPAYVUTGnXKaYBRWSTqfATXHFpSs/UVWG/oDhlWhV4XMTSPuAPzqz3Yx?=
 =?us-ascii?Q?GcUH+8VEUDX+pLxHkiH/B3BIPX5bXfVjTUTFGrNWPxQruqVfqqFFKtLiStDZ?=
 =?us-ascii?Q?JMX+1iqflVcBaKqk0xgtshW7RV3UW5zXJZ7KHclPrEMBLy4ufdryNkkNmnCH?=
 =?us-ascii?Q?ATKhz8h7Doo/dFBpQ2A6Ivrwi4j3HGeLR3DZ+i3bQTsHwlaQbf5833/BW2zq?=
 =?us-ascii?Q?tIQumI1RN/F/6lUWE7BtAablcGwRv2GEaLRPQ++2yzjCKogzriN9hZDZGkUq?=
 =?us-ascii?Q?6DlIs2wTWWcZSohNQ1aEemqzbGWKxe90g91YczC/Jx2uBpHG90s0iJGzqflu?=
 =?us-ascii?Q?0mP9ijsbaTkqnHmArdeedF6DysrhIXtYIBAOQZJ0gZG33r//xgWYh773dwW/?=
 =?us-ascii?Q?1zbFgj0XOSYsdsVrVbor/mptR1HA+u9YItLTDZMdF6AJG7BMQvprNvOGQRs0?=
 =?us-ascii?Q?XYh/heZnR0H2fDGr6+X3hAHdeHdRCfPveLKXDp96+pDsY8X7joKPRvNGmVvM?=
 =?us-ascii?Q?PfuZdVIsjZrDK1J+5ytsu/XWr8FWmpEVCM9dJ+zbbHPXEYXKdCDKTzv41r+5?=
 =?us-ascii?Q?MjzIXFX7z/VObQOOWqp+PSM1o/8v3OAGC5QA/2H+kMvc/WHVECuakIuA6cip?=
 =?us-ascii?Q?aj8H/3+OguCCOilZP96pvxusVtaMhHH4oDa0keBd/AuKt3MS9WeJQmy29IYW?=
 =?us-ascii?Q?xJneC/oFYFluqX6swKK8oOAHDqvbRp4e6L8Y7gbcr8nNfm4AMGyyGY6NLLT1?=
 =?us-ascii?Q?5VbbEIpISg3fjfQocqRldKsDCFnDoCZo9WXaD90WxjLCEJRVBfcM4CuaAhj8?=
 =?us-ascii?Q?qZmD5v4vA+8lcoU+I84aBgm3rcR2aRtZLwae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9BhiO+iOf0kj1MoblCkHkK2hz7/XskuUEi7D6FuDA3H81Qh0aNbomo/sSE+y?=
 =?us-ascii?Q?uEPFlgoCMMzvTq9DmGUOa+kM2jzuL+xh7hNscy8y0PSDEsw/RXB8vkWdR0uH?=
 =?us-ascii?Q?6jYXMeKi36XKcQ6V6hMz/b0H9dH4Un2eJu7oWEvFOe3rDZwwc7vEGn913vdk?=
 =?us-ascii?Q?itVbxONXXJkUXWbt60/zQemK/rJzbutX9/kYLV7VfQ0q9yxmGl2XGaPikSnN?=
 =?us-ascii?Q?ecmB6uOptUzyVpwPe5ztTJeMPI9SBu9vi1xvzqeZapbV/CcS64UI7E4Z2ieR?=
 =?us-ascii?Q?ZhCO+Mqeqp5xVW4s5kyNG2+IkhQojImt5HsgN5ptrj4lEyTv0Bzoh75kEw3u?=
 =?us-ascii?Q?14NoKy7tvQnYMGm+PpG9bZMHNNBbmJFJ8XEc9eJGYqeGzxVoY1H2SjwHMMAi?=
 =?us-ascii?Q?HW+2psZl+iz9UuvPgIr/C3mNOoIO19CIi41RPqvP2p8Anoox9AT1bBhSkxL9?=
 =?us-ascii?Q?NB519ZWOCajMQEiVBkTWfcUBMs1zp/rFCw29+5LyZgTxRH+rhcQYajt4u43Q?=
 =?us-ascii?Q?GOLmYwnD+crIFanr1yeY47GyeYqxCqgtOMWF7XR4xlSuAsxf+7AlqxsqAztv?=
 =?us-ascii?Q?oFWs22dO39bj5o0UxbUShFusocKJNM4BpjK6+SKe1Regof87mRj8v1txi+B8?=
 =?us-ascii?Q?9+21RHbx7GHU5uJgNEitd3MJ8LI2wqn5zU6i5UEJIvNn/KQA5wpG2nJaA4mG?=
 =?us-ascii?Q?IuzR4R0LtgU3QsoVkVG1plWioT7OPBUz3lMK0Hhx/BGs518GjYqixCO2oGv+?=
 =?us-ascii?Q?jWtTVqHb8yHfh7c3LPvCE6uEFLBatQhJ+Wg91t985N36lB/eNX8olBhNFkNC?=
 =?us-ascii?Q?HqobmoK0WDmkep4+KvQ0g0Bc/5yIWpEyk6kEXpJKuJIg9jOopHipGyZpoThB?=
 =?us-ascii?Q?p0kS2Ke8C3mOa4RUrU9DNB21iPFtjY4VdVKMrApvmzAnr4HoxRYOHbgjAEPS?=
 =?us-ascii?Q?gFzGsrGJ0DzIdFDQOHf7FwWpwdkkPNmvl+Qa/QhZTW9OytTUmQW3E+trmp6W?=
 =?us-ascii?Q?UxABe1xmD8QlxuP1I/21c6BM3Gc1LmGF1bmUZSGwW9LI/3hNVbPd3vjN/y5w?=
 =?us-ascii?Q?52Sf4LyA7j9PMfk49HxaJlYe3IfiXUfO8Mn+OUxIfnVgSS/TUSorzxIPgHSb?=
 =?us-ascii?Q?ICz6HFkAg/c24iDVydPTdw/Rd+7iylR8Cw4p9JIdO1WGgDEeZ4nWbTpiK+rE?=
 =?us-ascii?Q?cWRs+DoblF1XBLL4npnG37141hDQxHOyEQR2P2+Xww6oz8wOUgsAbBUGGSN2?=
 =?us-ascii?Q?bcSr4pYrQh1xsKspg6mHuCUNtFM2hfndEE1YeZQBUz8U3JFkDzcGOTXwV9Xk?=
 =?us-ascii?Q?cshQlOuReq0bnGIYBNj7ehZhT6LtHVCBskZJzRQnl37Yk52UQPyQhZJ33gta?=
 =?us-ascii?Q?or1MCytME1Kr7aW87awXxenPK9FHAYGGPMneDztzeAWVkgBXAG+httjMRudl?=
 =?us-ascii?Q?gA3MARL/rFxTOoJaib7VSweZVvLtuTeqHc1s6bKHCMnAwf0umF0pwBEHGHFH?=
 =?us-ascii?Q?/hx9EvF9aBQcYsZBAjMXjtu/4WqPOHIDnKogXXRLb0pnloUGLhAr/J2/Neb8?=
 =?us-ascii?Q?T6B2wDbDGXOAcgxwk+EyRnUgPKwQXR2GJFMwcaL3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dbd303-f947-4e8a-effb-08de178f60f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 08:36:10.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyjUpW/V0PAW6z6UY1RMlvYGKf3Z7ZSL0tGxh1wq3GcMIY4Cgi5boYq9zNGW4IxlurezEXKTS3ttUkZJuqqYXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> 
> Hi Sean,                                                                         
> 
> Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> conversion as well?
> 
> Without it, the "WARNING: possible circular locking dependency detected" would
> still appear due to
> 
> - lock(mapping.invalidate_lock#4) --> lock(&mm->mmap_lock)
>   for init mem on non-in-place-conversion guest_memfd
> - rlock(&mm->mmap_lock) --> rlock(mapping.invalidate_lock#4)
>   for faulting shared pages on in-place-convertion guest_memfd
> 
> [1] https://lore.kernel.org/all/aHEwT4X0RcfZzHlt@google.com/
[2] https://lore.kernel.org/all/cover.1760731772.git.ackerleytng@google.com/

Note: [1] is still required even with [2].

Consider the following scenario (assuming vm_memory_attributes=Y):

1. Create a TDX VM with non-in-place-conversion guest_memfd.

   In the init mem path, the lock sequence is
   lock(mapping.invalidate_lock#4) --> lock(&mm->mmap_lock)

2. Create a normal VM with in-place-conversion guest_memfd, with guest_memfd
   memory defaulting to shared by specifying flags
   GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED.
   (Since kvm_arch_supports_gmem_init_shared() returns true for normal VMs due
    to kvm->arch.has_private_mem == false, GUEST_MEMFD_FLAG_INIT_SHARED is a
    valid flag).

   Accessing the mmap'ed VA of this guest_memfd invokes
   kvm_gmem_fault_user_mapping().
   
   The lock sequence in this path is
   rlock(&mm->mmap_lock) --> rlock(mapping.invalidate_lock#4)

Running 1 & 2 in the same process would trigger a circular locking warning:

[  297.090165][ T3469] ======================================================
[  297.099976][ T3469] WARNING: possible circular locking dependency detected
[  297.109830][ T3469] 6.17.0-rc7-upstream+ #109 Tainted: G S
[  297.119825][ T3469] ------------------------------------------------------
[  297.129795][ T3469] tdx_vm_huge_pag/3469 is trying to acquire lock:
[  297.139032][ T3469] ff110004a0625c70 (mapping.invalidate_lock#4){++++}-{4:4}, at: kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm]
[  297.156463][ T3469]
[  297.156463][ T3469] but task is already holding lock:
[  297.169168][ T3469] ff110004db628d80 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x2d/0x520
[  297.184330][ T3469]
[  297.184330][ T3469] which lock already depends on the new lock.
[  297.184330][ T3469]
[  297.202954][ T3469]
[  297.202954][ T3469] the existing dependency chain (in reverse order) is:
[  297.217582][ T3469]
[  297.217582][ T3469] -> #1 (&mm->mmap_lock){++++}-{4:4}:
[  297.230618][ T3469]        __lock_acquire+0x5ba/0xa20
[  297.238730][ T3469]        lock_acquire.part.0+0xb4/0x240
[  297.247200][ T3469]        lock_acquire+0x60/0x130
[  297.254942][ T3469]        gup_fast_fallback+0x1fb/0x390
[  297.263269][ T3469]        get_user_pages_fast+0x8f/0xd0
[  297.271610][ T3469]        tdx_gmem_post_populate+0x163/0x640 [kvm_intel]
[  297.281603][ T3469]        kvm_gmem_populate+0x53b/0x960 [kvm]
[  297.290663][ T3469]        tdx_vcpu_init_mem_region+0x33b/0x530 [kvm_intel]
[  297.300978][ T3469]        tdx_vcpu_unlocked_ioctl+0x16f/0x250 [kvm_intel]
[  297.311245][ T3469]        vt_vcpu_mem_enc_unlocked_ioctl+0x6b/0xa0 [kvm_intel]
[  297.322045][ T3469]        kvm_arch_vcpu_unlocked_ioctl+0x50/0x80 [kvm]
[  297.332167][ T3469]        kvm_vcpu_ioctl+0x27b/0xf30 [kvm]
[  297.341084][ T3469]        __x64_sys_ioctl+0x13c/0x1d0
[  297.349416][ T3469]        x64_sys_call+0x10ee/0x20d0
[  297.357566][ T3469]        do_syscall_64+0xc9/0x400
[  297.365507][ T3469]        entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  297.375053][ T3469]
[  297.375053][ T3469] -> #0 (mapping.invalidate_lock#4){++++}-{4:4}:
[  297.389364][ T3469]        check_prev_add+0x8b/0x4c0
[  297.397442][ T3469]        validate_chain+0x367/0x440
[  297.405580][ T3469]        __lock_acquire+0x5ba/0xa20
[  297.413664][ T3469]        lock_acquire.part.0+0xb4/0x240
[  297.422123][ T3469]        lock_acquire+0x60/0x130
[  297.429836][ T3469]        down_read+0x9f/0x540
[  297.437187][ T3469]        kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm]
[  297.446895][ T3469]        __do_fault+0xf8/0x690
[  297.454304][ T3469]        do_shared_fault+0x8a/0x3b0
[  297.462205][ T3469]        do_fault+0xf0/0xb80
[  297.469355][ T3469]        handle_pte_fault+0x499/0x9a0
[  297.477294][ T3469]        __handle_mm_fault+0x98d/0x1100
[  297.485449][ T3469]        handle_mm_fault+0x1e2/0x500
[  297.493288][ T3469]        do_user_addr_fault+0x4f3/0xf20
[  297.501419][ T3469]        exc_page_fault+0x5d/0xc0
[  297.509027][ T3469]        asm_exc_page_fault+0x27/0x30
[  297.517003][ T3469]
[  297.517003][ T3469] other info that might help us debug this:
[  297.517003][ T3469]
[  297.534317][ T3469]  Possible unsafe locking scenario:
[  297.534317][ T3469]
[  297.546565][ T3469]        CPU0                    CPU1
[  297.554486][ T3469]        ----                    ----
[  297.562385][ T3469]   rlock(&mm->mmap_lock);
[  297.569203][ T3469]                                lock(mapping.invalidate_lock#4);
[  297.579871][ T3469]                                lock(&mm->mmap_lock);
[  297.589429][ T3469]   rlock(mapping.invalidate_lock#4);
[  297.597345][ T3469]
[  297.597345][ T3469]  *** DEADLOCK ***
[  297.597345][ T3469]
[  297.611988][ T3469] 1 lock held by tdx_vm_huge_pag/3469:
[  297.619863][ T3469]  #0: ff110004db628d80 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x2d/0x520
[  297.634775][ T3469]
[  297.634775][ T3469] stack backtrace:
[  297.645161][ T3469] CPU: 7 UID: 0 PID: 3469 Comm: tdx_vm_huge_pag Tainted: G S                  6.17.0-rc7-upstream+ #109 PREEMPT(voluntary)  cdf4eff053c68cc34a4de47b373cdf3e020105d7
[  297.645166][ T3469] Tainted: [S]=CPU_OUT_OF_SPEC
[  297.645167][ T3469] Hardware name: Intel Corporation ArcherCity/ArcherCity, BIOS EGSDCRB1.SYS.0101.D29.2303301937 03/30/2023
[  297.645168][ T3469] Call Trace:
[  297.645170][ T3469]  <TASK>
[  297.645171][ T3469]  dump_stack_lvl+0x81/0xe0
[  297.645176][ T3469]  dump_stack+0x10/0x20
[  297.645178][ T3469]  print_circular_bug+0xf3/0x120
[  297.645181][ T3469]  check_noncircular+0x135/0x150
[  297.645186][ T3469]  check_prev_add+0x8b/0x4c0
[  297.645189][ T3469]  validate_chain+0x367/0x440
[  297.645192][ T3469]  __lock_acquire+0x5ba/0xa20
[  297.645196][ T3469]  lock_acquire.part.0+0xb4/0x240
[  297.645198][ T3469]  ? kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm 92b56a1aeace799385454e64f4d853f860f01956]
[  297.645279][ T3469]  lock_acquire+0x60/0x130
[  297.645281][ T3469]  ? kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm 92b56a1aeace799385454e64f4d853f860f01956]
[  297.645360][ T3469]  down_read+0x9f/0x540
[  297.645363][ T3469]  ? kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm 92b56a1aeace799385454e64f4d853f860f01956]
[  297.645441][ T3469]  ? __pfx_down_read+0x10/0x10
[  297.645444][ T3469]  ? __this_cpu_preempt_check+0x13/0x20
[  297.645447][ T3469]  kvm_gmem_fault_user_mapping+0xfc/0x4c0 [kvm 92b56a1aeace799385454e64f4d853f860f01956]
[  297.645527][ T3469]  __do_fault+0xf8/0x690
[  297.645530][ T3469]  do_shared_fault+0x8a/0x3b0
[  297.645532][ T3469]  do_fault+0xf0/0xb80
[  297.645534][ T3469]  ? __this_cpu_preempt_check+0x13/0x20
[  297.645537][ T3469]  handle_pte_fault+0x499/0x9a0
[  297.645541][ T3469]  ? __pfx_handle_pte_fault+0x10/0x10
[  297.645545][ T3469]  __handle_mm_fault+0x98d/0x1100
[  297.645547][ T3469]  ? mt_find+0x3e3/0x5d0
[  297.645552][ T3469]  ? __pfx___handle_mm_fault+0x10/0x10
[  297.645557][ T3469]  ? __this_cpu_preempt_check+0x13/0x20
[  297.645560][ T3469]  handle_mm_fault+0x1e2/0x500
[  297.645563][ T3469]  ? __pfx_handle_mm_fault+0x10/0x10
[  297.645566][ T3469]  ? down_read_trylock+0x49/0x60
[  297.645571][ T3469]  do_user_addr_fault+0x4f3/0xf20
[  297.645575][ T3469]  exc_page_fault+0x5d/0xc0
[  297.645577][ T3469]  asm_exc_page_fault+0x27/0x30
[  297.645579][ T3469] RIP: 0033:0x41fba0
[  297.645581][ T3469] Code: f8 41 89 f0 48 8d 3c 17 48 89 c1 48 85 d2 74 2a 48 89 fa 48 29 c2 83 e2 01 74 0f 48 8d 48 01 40 88 71 ff 48 39 cf 74 13 66 90 <44> 88 01 48 83 c1 02 44 88 41 ff 48 39 cf 75 f0 c3 c3 66 66 2e 0f
[  297.645583][ T3469] RSP: 002b:00007ffc8037f1c8 EFLAGS: 00010246
[  297.645585][ T3469] RAX: 00007f604ee9d000 RBX: 00007f604ee906a8 RCX: 00007f604ee9d000
[  297.645587][ T3469] RDX: 0000000000000000 RSI: 00000000000000aa RDI: 00007f604ee9e000
[  297.645588][ T3469] RBP: 00007f604ee9d000 R08: 00000000000000aa R09: 0000000000426886
[  297.645589][ T3469] R10: 0000000000000001 R11: 0000000000000246 R12: 000000003b5502a0
[  297.645591][ T3469] R13: 0000000000001000 R14: 0000000000000200 R15: 00007f604eee4000
[  297.645595][ T3469]  </TASK>


