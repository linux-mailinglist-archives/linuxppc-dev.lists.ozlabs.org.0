Return-Path: <linuxppc-dev+bounces-3874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785699E9B64
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 17:17:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6Rpt25Hrz2xMQ;
	Tue, 10 Dec 2024 03:17:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733756642;
	cv=fail; b=Lo7Lcr2PxzCVFuFYwNybWvt6O92iZLjl09MlKuD8aQ6O9GjwjDNb7lvu4GaK3UG9DQWEsInpVo37fLaIXL6q2qyS//0mmLNCfRhCY2jThDq8XdGjwvYV7vc9GwRVAPyVoShV48+iEdBHPFF2DftNXQkfmIvejuNxpIFlyWaKimIteyzc+DVHy04a8XOBBcTrejrFLK9BmLPBY8plL+tT/fTCbWJI0r+cOvoIBCiejqowImvrsVqII/GI55e/VCCWAXJ+33iP1NIfhFb4jMVDiFmbpzCHlfKClIJAaABWGOvcxHZ8RdWfW8X3f23KnwD6pAexp3cV9+Ia6f1ZZflLnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733756642; c=relaxed/relaxed;
	bh=F4B11m+j+SDYKHTWgiQ51I/BvybU5Pv0AqswYdCIzeM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z6ybK8uMjinx4jLxVPidNBabY4V5FDsaQrypOADIefBxSR33rbtWguwu8+sx4yM00z42T5lzu7EXZ1So28HbIDWsu7DOqS4CnmeyPFjklU1FHN8X/9DRmSd+WBbRDolWIG0kDXz2Znyw7qDx7+tg9Hc7ft+y+9SGS1iWaZbu/A9Zxq2UqsHCPj+p3JR4UdDBUdazofUpdB3oC8ae37S0tN16R/bD8v7wOoU90HeaawMjQzDfWFKp82Yo66ZBT7dvEQ2YAqJr7NJvSJ8ixHHksaDzZ9Rqm93VG/eLAGoT5US09J5Puz1vzvjwFlhjumShmqtiBXkuKaEg/vuVMi5/+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=clX22Jfl; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=clX22Jfl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6Q9q5b8dz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 02:03:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733756640; x=1765292640;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ojKY8VGrB0NUTTNKW1dlZ7YLMt791JXzjtxlmEN2aZU=;
  b=clX22JflXYKfAfT3rs2qCEcyovfqotbAi2ng5OfsI0CFyulTWZO+KbjK
   Y6ptmkzLAdA1f9p01T23X9n1tQPaHv1g/3EQeq/0sUjrDondsI0AJLCdx
   PosgZifRQ4PwaUsWiFQe8Orl7FlXyILT9huXqym1rTJKGuQEem9NIgOlw
   G3deDEETJM1igFpd3e+jx8L9A1huiLl7RhIS6uo4HP+ZND4CCOSK/58v1
   rAfPvVOnxXBArpxJorbnh+aBAL0VIR0EQ0fEc8ZeOWtSDVk9wnqvFVjOz
   OKPdtCiZEZefDgava9uo4E7Sl5W+YY5Scc/rkEnzmrNV1xdyJ7HaKKHfc
   Q==;
X-CSE-ConnectionGUID: mshRbiTCQ5C0vY3y0/GJMw==
X-CSE-MsgGUID: E+kMRl/pS0yjrVcKEqQadA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37740433"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="37740433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 07:03:45 -0800
X-CSE-ConnectionGUID: HvJiLP3vSLae+wV9LKUE0Q==
X-CSE-MsgGUID: 4qvw0x78RcOcXc7SMhO5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95297421"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Dec 2024 07:03:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 07:03:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 07:03:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 07:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEvqP/svuQHePq6kDJJha03hfHB1suI+0GkfdhwThGQ6lFfV58msKNuvw+o5ZTgpkLC6Z5/WQiSuaE9mMJ5JrF1Mk1RNY0Sujclvn8JEfeMlx4WpEqj0CqEe/qqBsgvG96TUQxMDVlSvS0/hRiwnSGEnBTlY8Q4crO0de30XvBmNpRgLAh/C/BcQzK4zxc5GjwNCP8DnWeVL6yZ5vs9hiPgIpIZFJcjza+zZGRZoDeFlREpnNUtBCvdvZ2D0+tlrh9rHIy9foG6CqaFR52O+iaUSws5a7Uk56X2ExeHRJ6bjswTCjGgOWxlt4F5ePn9c3wN15WrhEYtH2fgiJ9Djcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4B11m+j+SDYKHTWgiQ51I/BvybU5Pv0AqswYdCIzeM=;
 b=yyGziDgGY3FQmopWALJEw4Iw8huHU9Iv6XqVZWe+cfsCqQwK3N1ZZwk+KXCOKa2VaX6vsGPqr0l+0lJhb5xq2i4UmuEMXXMsjMyB7druSe6IkQpjZNMwEQ5WG9w0jUSzyt6tG5dO8Ol3HwLsJAapsMmMlzkcBCMDViNeSRBwK3/c6W05/PsgrM22aEQT1T8XbDVJY2l1TwtpK1S2np9a+c1bJQQCnQvTvIdwMfkwpSXwWJ6SO4bklmimnteI6nwn1a6LWukzsJ3mkGth+SBMqfKkGIH41gP3v0dU7jYWjlmdod7kjepgCLHnEnvvKNKALvUT6m+hC/yo98t8nml8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 15:03:39 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 15:03:39 +0000
Message-ID: <3113d4f4-4f8b-41d6-af89-f82cbc89da75@intel.com>
Date: Mon, 9 Dec 2024 16:03:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Easwar Hariharan
	<eahariha@linux.microsoft.com>
CC: <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<linux-scsi@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<ath11k@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-bluetooth@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<ceph-devel@vger.kernel.org>, <live-patching@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <etnaviv@lists.freedesktop.org>,
	<oss-drivers@corigine.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
 <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
 <72c8eb66-eb67-4f8b-b0c0-13f1aa001698@intel.com>
 <95a461ca-3ed6-4380-ad1a-da12e1109675@csgroup.eu>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <95a461ca-3ed6-4380-ad1a-da12e1109675@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::29) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 19376c7c-35e3-4a5d-6282-08dd1862aa15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dERZaitoL0pnZEQ4aWhRMnd6b1BqY2lkQW54U3lxKzZ5RjExZXkrWEVMV1Jw?=
 =?utf-8?B?RTRrVkgwZjcvMGFFYXJkNjFtUXJmMm5LM0tWY3pTbE5uUytJc3VCdUhwT1Uy?=
 =?utf-8?B?Ym0wZ010TXNNY2UzbW8zVXBXL1MycE0wQTg2eHJuL2hKTWFUNmdaTVhBNHVR?=
 =?utf-8?B?Mk1BN2o5YXBYd3hudTZDN1RCOUMyN0ZSR1ZENlF4UFZOUG5ROHlJNE1GekRE?=
 =?utf-8?B?RTBjNlB3WUZuV256SHY0R1h4MlFHeTN1aFRMcTNucnZEaGYrRzFJMFRNZUNE?=
 =?utf-8?B?SFU1WTZ0SCtHR1gvc0RBdXJURzNkQzV0eG82eVJFNjNSM2FTZEs5S1FYNzJV?=
 =?utf-8?B?ZjVUU3hiZGN5VWRTNDQxaCtIQVR4ZjdkSjVDVndkOERyemJyWnlHNDZvQlFl?=
 =?utf-8?B?OFRxVytXUmFjelMvRTI4WE9jRk5abHRTcHZWRzRJWDRwSDhQNkJaVUw3am9L?=
 =?utf-8?B?eWZyWGlEbXBnUm5Zaytwbk92MjF0K09FUmlvY0FCcnRzSXhUNUo3djNyejBh?=
 =?utf-8?B?SmpuRjRLQVRCZWR0bXVtbGRJRmdxVzlKSURDb2ViMzN3SHNtVTZlc0ZsVGlp?=
 =?utf-8?B?S09LWVp0eXVCNE45aVBWOGs1QnM3NXltRldGdDJFSFk4RnVFaC9Zd3J0WVp6?=
 =?utf-8?B?RnRhcUE1OFV1TkxTU21DMTFIemc1THp6YkRsQmlmZjM2aitsaEhtN1JGY1dB?=
 =?utf-8?B?bVQ2cEtOS2NkQ3c5RHlDUWkycUg2bzZwT20xemFQMW9aam1OdU9GWXZ0SU9j?=
 =?utf-8?B?M29GWm5mRHdpR3p0ZGRreTlHc2ttSkpvQWdwOFpIUTRYcUpvUzh3NXFCTC9X?=
 =?utf-8?B?RUlKMWNCd0dFdmN2YlQ5WDZNR3BiVkVVdkpFbFRkS01pWkl5ZFFTeGxBMlkv?=
 =?utf-8?B?d2I3T1ZIS0c3UkQ1YnUvaWFtbTBqa0h2Rm9MdGUvSW5WMGVsNGFlVmtJems2?=
 =?utf-8?B?YkMrdnQ2OEN0SUNFTzRPM05CT3hpMkEvT0dRd29oUDAzZ09NakV0YzBrZmVN?=
 =?utf-8?B?c1VDdDJzdmFiRXdjODlmazhTNUZ2dER3Y1B1N1BEQ0FPWGFsTWVwN1BHUnVR?=
 =?utf-8?B?MzAvbnJSNG13dXZTYUdsdzJBSXZzTEMxOVhEYUl2SFBheStwZXROQXh1RnYw?=
 =?utf-8?B?aFZzanhNRVNDaGJCdTRXeENNbW80NklMOUwyR2hoOFBYKzZOWEpsY3RQc1NB?=
 =?utf-8?B?S0NXSmhvNzdSZXhGQjA0ZXZ1Tm1BN054Ukd4Y3pnRFM0Z1ZmRzBiWVU3SmF1?=
 =?utf-8?B?TmpDL1lROGVkOXFVK1hEWDBsQ0h3L21nalVvV2U0VVdzRlAyYmFCRjdqWUFF?=
 =?utf-8?B?M1c3WHkwd0t5NXZTanZ6YmF5djc0VzczdFhQL1JvVENwdW5adFgzcW9CVUhr?=
 =?utf-8?B?NVdzcjJNUm9IWE9xUWxCUnVzOFFpMTNhbWhHZHAvTnp4NmlTUTFiYXg1eWlz?=
 =?utf-8?B?TDF2SzkzbkNnZ2pQWlJrSkpzNUVaUWRFL2ZDdDAzcnhaUEpyUXJUU3NPSnlS?=
 =?utf-8?B?RjFMenpsN1RNL1R3blV5OVovaWM1WUNPanV5U1BOaWREKzBRWnY1RERPdVVu?=
 =?utf-8?B?L0N0bXhqd1FlbzZjZ0VPY1BKTDhtVFREWitvZHUzM0ptdnplTFVERW13Wlph?=
 =?utf-8?B?Q1dVdG5yWTJYSDZocGo1aHZ6ekV5YmlGZzV5Nk9Fd29WYVRjSFRjd01yTy9y?=
 =?utf-8?B?cWV0SHZxckNwZm9ha1ErNDVmakdnRzhwVmp5YXA0N1kzNWVMT3NBcUlNVksy?=
 =?utf-8?Q?wEL9oZQB6wix6G1QjQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJoTjRHL0s2QmFqVDNvRGtIMFhRaVIzd21tTG9VTVJpSW1zdDl5QjRDUW02?=
 =?utf-8?B?d3FnMjJnSUtxS2FmcitLT1RuNzdaYThaZFJMWE93TnhmVW05dDRNdERva0gv?=
 =?utf-8?B?a0F1dEtSb0hSRUZKYmxSaGIzbzVIanVwNXRZSHFac1JTOUtLS3pxQWtoci9n?=
 =?utf-8?B?d3dGY1czWEdLL2tIanpwK1pQdGNKN1FVcWxpb0hmME45aTNnTTVHSTRZUjNN?=
 =?utf-8?B?UnV3OFFWcGd4ZTBBWENkRytDc3ZnVTZqWGJ0MXZXOVlySTJCRDI0R3RQVUNq?=
 =?utf-8?B?QUpYOVdwQXorRkJLSGNISDRpSjU0OUFoa1I3TklEeTJGY3FTbG9WUk9sUmcw?=
 =?utf-8?B?L3dyZmJQZ3YyL211RFZLZW1zdE1xN0xyai82cjdHZ25LUkc5Z3B0cnhOZnpG?=
 =?utf-8?B?RS9pbElJdHZZVDJKMitsSE0xRitKdXlhelRzNEZWcnp5YXRNSjlZcU1WZUV3?=
 =?utf-8?B?c0ZXUlRrTE80Q1NVcUszWStFbm91TmpvWlp0NVhndjRVajk4S0NuNzdVODRT?=
 =?utf-8?B?T2FZZmIrRE1oMDJQdWwvUHFqditUWDhyWEZidjJkdHBFTnRQNk0xVVRvT093?=
 =?utf-8?B?a3l2cmFieUtHL3pRRkxjN1NVR0RuWS9HN1FvanFXUzIyaTZqTkR5SzkxUWFn?=
 =?utf-8?B?VEJ6V1QrNXBZZHRhdkQzd005SXZwY2Z3bWNoc3NPcng0T3kwcDBkRGtEKzV1?=
 =?utf-8?B?RlJRdytOWmllTzg4ZkpCU2xISVpMdm5oUDZHYXB5UTRwVmYwTGRzWDcvYXRr?=
 =?utf-8?B?bUVMczZGeS9seWMzMnp4RFNYZnZ4b09Jby9URzE5WmRNeWF4REZFN3RBazRM?=
 =?utf-8?B?ckYxOGJxdXczWFNCYUliN01VclBuRkpua0VxbFRlLy9ydHRycUJRM2Z5ZW0w?=
 =?utf-8?B?V1ROd2VZSHJuSm1STVJhMXNKRTI1QlVhTVR1R1RvdEw0UEJXWitxK0ZzWFhU?=
 =?utf-8?B?Zi9vS0lGekIvMzlHMVNFN2V0OW5Ka2JrR0ZQOWRRVXlEcTVlYU5wdjJ1RTR5?=
 =?utf-8?B?aDl3YVF6Zi9IUFhjM2lDOW9WeldPL3lHdnpEdkpwdTFDU1FJSnUza1IzK0Zi?=
 =?utf-8?B?WGpRbFFMLzhFbTEzNmJPWFRvQXhQcUY1R1hFdnA4ZytXU1F0cXV3cUpIdStG?=
 =?utf-8?B?M1Zmd1AvTzNsWFZBWDJoMmxPOTdmQUExL005SmxhS2dXQ0h1SWU5QXlEbnFH?=
 =?utf-8?B?eGtMVERzckVIbTBtZ2F1MmVVcy9SL1o5ZHNGeS9NbHFEUzdIUVZZek9nMkc3?=
 =?utf-8?B?aFFUdndzMFBsTW5pNjN0cC8wRHhRaEhVcllYays1NndzblR6N2ZxbVB4RlRm?=
 =?utf-8?B?a3RtUUpZc0JuM0srZkc3djJZOUs4ZW5OVkYyT2VRTFljVkdWcFg5eXppMzQy?=
 =?utf-8?B?bVp5S1o3OGhFNk1VMXIyMFVjdGIveHNsaDdad0ZybGxXUlE2NVVpR2ZjaFE1?=
 =?utf-8?B?TDZDRnBEZGhSL2Rid0lWQThuZENNWENDQ3hvSFhFbFV2YjZlK0hNR0RhbkhS?=
 =?utf-8?B?TXkxdUdPV0NDOFJvMzdETi8wU3JCK1ZuSjh1R2xESWtOZk1rVUd3ZXZxN0hl?=
 =?utf-8?B?OHhKZGJkSW4vdVovTEF4WjZmd1luNFd5Q0NSZWI2SDZDMmVpSWtTYnZXaTdP?=
 =?utf-8?B?WERvWHJxUFFSRlg4OXUySkVJRlFWY1ZqbEExUXBVN00zQ212SVp5QmJ6YTBH?=
 =?utf-8?B?cHloUVdUMkN0UTlIVFJRbkUwMzh2S1RIckhyNll6Z3NXbVlGaG1FUEdZSFgx?=
 =?utf-8?B?ZnlucFlnN3FKemNQSTlRRUtXYWN0SC8yTmtrcjNURWQxTXk1SFRiWGN6MjNS?=
 =?utf-8?B?RytPR3pseHBSMzBqeWFmSHBmMkpnTXMzTmIzQlJhdmdtWjBNVWgzRGUyUFcv?=
 =?utf-8?B?N3RleTZQWjFhNWpnN0IzSUM5aVZtTzNFelR1b0Y5Nnc5MlI4UzlVNHNsSDRV?=
 =?utf-8?B?S2pLQUZzdzNTQ1lUNHdOekhRYnoyMmdwTEJZTGQwY0VEbDhVbEpmcjh3S1Zr?=
 =?utf-8?B?ODFyMDhpMXk4R2VLVjIySTBGRkJMbm5xYWMrTVRNMHllNGdHVEI5UTFNenBh?=
 =?utf-8?B?UW96ak9xdm1RdTcxY3BmY1NBRExKL1IvNkVIQ3oyejh1RXpraWwvUjllOWY0?=
 =?utf-8?B?TC9mMnlkYjF4ZmVrWFVKZVU2NzVVdlZpT0JMZVVJMjBZU0lUUm8xRGgzNWli?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19376c7c-35e3-4a5d-6282-08dd1862aa15
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 15:03:39.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAwfYO53ax7O0HgtzbNHxDg4y4YIgk0CrCzgBW8cnkbVLdYnV/IAJaOB+cPgAGabZY4dGCuNoZovPhZ6+A3TkCFPUHvIA+3RncA26GujG54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/9/24 1:45 PM, Christophe Leroy wrote:
> 
> 
> Le 09/12/2024 à 13:01, Przemek Kitszel a écrit :
>> On 12/6/24 9:58 PM, Easwar Hariharan wrote:
>>> On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
>>>>
>>>> [removed most non-list recipients, it's just too much]
>>>>
>>>> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
>>> <snip>
>>
>>>>
>>>> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
>>>> there are 10 that are greppable.

Thanks to Christope, I re-examined those ~10 cases, and that should be
refactored by just dropping msec_to_jiffies() part, not replacing
by sec_to_jiffies().

>>>>
>>>
>>> Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
>>> being passed to msecs_to_jiffies() which will treat it as a
>>> millisecond-denominated timeout resulting in an excessively long
>>> timeout. I suppose that's better than a too-short timeout, and
>>> apparently it's been working fine all along since hardware responds
>>> before the too-long timeout expires. Half of them are in
>>> drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
>>> there since 2010.
>>
>> my point was that, the default value of HZ is 1000, and most of the code
>> that is just `$value*HZ` was meant as "$value seconds, in ms unit".
> 
> I can't follow you here. The default value of HZ is 250 as far as I can 
> see.

as default I understand "the value that is effective for those that
don't tweak", not necessarily "the fallback that will be used when not
set by any other means". On my RedHat and Fedora boxes it's 1000.

> 
> Regardless, HZ is the number of jiffies per second, nothing else.

That is true. But the name is wrong.

> 
>>
>> Same for HZ/const, HZ/2 being 500ms.
>>
>> HZ is awful in that it is not 1s but 1/s, but it was easy to abuse the
>> value in simple context.
> 
> Why is that awful ?

so, 1Hertz = 1/1s == once per second,
something happening twice per second, with freq of 2Hz, repeats
each HZ/2 jiffies
https://en.wikipedia.org/wiki/Hertz

the #define name should be really JHZ -> JIFFIES_PER_SECOND

> 
> HZ is a nice macro that gives you the number of ticks per second, so 
> that you are able to easily calculate the number of ticks for a given 
> duration, regardless of the configured number of ticks per second.

Again, technically true, but default being eq to number of msec in sec,
causes it to bite.


