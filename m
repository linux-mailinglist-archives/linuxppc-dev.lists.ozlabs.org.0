Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6A943165
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 15:52:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJfhiZJo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYtnx27yXz3clp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 23:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJfhiZJo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYtn94WG4z3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 23:51:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722433918; x=1753969918;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H0/hmV8ABabI5XOjYPz6F19lJ37Bos2wJ6N4hmRgZ54=;
  b=IJfhiZJoTBGPSAntt/LpmJ0cZCfaPPpmbr0QobeRaOXK85iPuFVNTxXz
   jciQOSP7Vuh1ZuPatBrVOVEB9z9PtqX0GggK+Q+Ozf3wPPZLwiyNzj+A1
   qXUCK05h8dRdwWefHwknJUfeXHKBzCskVkuBFRfXUS1UxfRLSwx2hDka/
   jXSuCptlY6ip20iae7m7bLknntHIC0xjAiogcj/GYmrruvcSerNJstE73
   sV3Nmrtq4TMhIz4iiLofXg3WKV4ZpUEcb7SedAVC/+kmM45L230iev1zY
   7jvlFa9lPRY6V0ObFuBGUeVFgD1eoUPBcWbctLZPxCFHeyCTCz/Fa7PRp
   w==;
X-CSE-ConnectionGUID: OCE+N+cHRwi8wrtfreLJJA==
X-CSE-MsgGUID: F5no74R6QeC2btN7npwnqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20008153"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20008153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 06:51:31 -0700
X-CSE-ConnectionGUID: josvrzEhRy618R5ejcL/RA==
X-CSE-MsgGUID: abnYhBgaTOOevcnGGr5KAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59011041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jul 2024 06:51:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 06:51:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 06:51:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 06:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxpBaIs1XZxI3ACkFzfb6R9lar04ThvCTpNSsaqs+7HdN5vV8TbnV7SSMNw8jUlWmdjnI+7c11rhFk1fs7eGsySdox3r72m/xvXcsdcrCLvDsWxu0f9s6PEYTtlHLn6D5/oj2rXaUPpoekaGTSEL0D5/1lCZYnUDa82AGZ2u4sPQBkhe0dkgTazcy+mkr7gnFmeDuWqjP7l9YuAOvVSghmz0VeXgbCVSqpE1Bi4n5iCRaxZ5wKqXiOjHRdiMDs0KQc6h7ZbY6EWRisiC5+IeKErpfJQBqhs07wZ9ZI1RjgsHBWsBFOlXe1g73VDH0j24lLq7bIPG3X0Tcqyv6/RpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR3kcq48CrtC/ZoI1VfuOTFfFTOyJwUzhf8JcWfeZ1I=;
 b=e2XtBSiA+xD3Xshh+qDGKXoKean5yO+F6ZhBBDPMi9b60DWKBcr2mc6Hc9BRjl8hznSH3gciYB1EZUr984FZqpHhptuZg5BQJxQfmmL0qQD4oizWzThrvi/jwoLDMUQfSNO35s1OJkFK3Un7DyvCDc8SEGyRqt1Gu2PNzBFFfVl4z1RCmxJbbCRGwXNIVk3C9+EmYijBcEROYulXvziZZCBvt+GOMg/6CR4dgGBq0xThZdHr9G6KEuOoDBrISrgq/4ZeomDOPOaReKHYzuuwJR2I/A+2BPe4r44a8FfHnaaYvLpN5xGmRfYnmaG/j/43FEmXJpigBX0/GcHo0aoeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 13:51:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 13:51:28 +0000
Date: Wed, 31 Jul 2024 21:51:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V8 14/15] tools/perf: Add support to use libcapstone in
 powerpc
Message-ID: <202407312114.ee900833-oliver.sang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718084358.72242-15-atrajeev@linux.vnet.ibm.com>
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 1355b378-5b57-4fb2-5f32-08dcb167e023
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHhFKzAxZDBoMDBHWXY4YkMrNmd2bGtiYTRGaVd1ZzdIZ0VBUkxUbk1wSkdk?=
 =?utf-8?B?blU0SmUvTHJhNlk2bjlLejdZOWxGekVWbm9WRndBNENqaGV2WTl3dTFrdWpx?=
 =?utf-8?B?MEdDWFMySnllZXFJcUdMYlZESm9IMVNHNy85dElqZnpPSVBTM1J2SUVkK09n?=
 =?utf-8?B?bHpnS1pvWUFVSG96TVZqK1FML3QwQWZTejJ2QTdGMXowV21PaDVUODV6SExz?=
 =?utf-8?B?bENEV0dkSkVzWHVpdkRpSnViakVSc1dmQzdsVmdUQllFYUpaSnBaVElQS2xG?=
 =?utf-8?B?TzdoUk0yRUhKMGJNbm9ya25HSlowb3UzaXpOLzNJaE5OUnB2WXU2UGtBanBx?=
 =?utf-8?B?SUtIWTdnV3B0cGlhUzdOYnFKUEJsVWN0SC9SR0pzNkFXK2h0amRzMXNIajJK?=
 =?utf-8?B?U21aNFhaOTBicWIyTmRrV3AxZzFvUnN1dDNnMThnUm8rcWxHb1dTeFUwZGxw?=
 =?utf-8?B?Mll4TTd0Zkg3VWN4bmlhQXljUWE1dDNxa1orbzNtc1BNeFNMZDZaYUIyU3h1?=
 =?utf-8?B?M2lvV2lsWkdCN05pMW5CVmMwZUk2RzRmc2JYdllIbmFpZFh0REluQTdGY1pm?=
 =?utf-8?B?SDdGRHdtTWhKRzE0TklRbEdJanhBU1dkM3NjaHQ4aitFQmhPVjF6RkpSeEpn?=
 =?utf-8?B?M05HYUxaMXIrVlgyMHVsNzJOaUNodFJKM3VzVGxWQ25kR01MamYxOW84SzFK?=
 =?utf-8?B?WHR0RS9WV1JiZ2ZpYXIrZ2toYjFPT3pHWFlQUXJkb3V4SEEyTnBwb2NjbUUr?=
 =?utf-8?B?SlluUlFmUk5xazJobzdVU2xhVFZtaGcvTHRHMGVPTXI4YVRHK05GWUZEekRT?=
 =?utf-8?B?WnRHajcyZWRUeG5BdDZuMUQ3OGx2bHFjZzlmcno0WjBqMEovUDZNaWU1R0lQ?=
 =?utf-8?B?YXJvZmFSNXlBMEIwODRJV2JVQ1QzSXNwK0w1T0YvL0tNVEhuSVJlZ3N3RFZp?=
 =?utf-8?B?aTlFQVhYU2NwcitUZmt4bXJxRTk3M2taTHE1K3hvQ00xbWRIK2c2UjJwSjZU?=
 =?utf-8?B?T01Eck5NOXZmZnNEdmZ4ekhRSStPbFA2bmNWTngyV21YNC8xRmJPaWFqOUNL?=
 =?utf-8?B?cmdma3E4K04zZ292SmNjWU10bU9yVWRPMnRHU25FNHZpMVk0MW0xQ1Q4aTA2?=
 =?utf-8?B?L1NpeTEvOTRsSlBwbXBzSmtxM3RoMC9Vd0RqdUFkeFFobVI3L3VEaStoUWcz?=
 =?utf-8?B?bGRoRXkxYzZ0N3hkK3M0NzV3a1FocU5Qa3VyMmU5ZG5HbzhmcmgyNWdoRldm?=
 =?utf-8?B?aCtralFMcittaUY2UGFLWnFFeEFjdnF6MUdidFZYanhDN2YrUWFNaEJVVlNK?=
 =?utf-8?B?Ny9BbGhDMnNaZXl0amdoN3kwVGhhV0UyVm54WFh5Qk02dW5sWWpwU1N0THRO?=
 =?utf-8?B?TlBYNXpYbkR4bVFYQzQwYng3OUxqSThTUGptN3hFZlZnZFZOcmdKem9PcGQr?=
 =?utf-8?B?N3JNZVZaeEFoaUFxYWhmelF1NHV0d2Q4MjhJaVVSNVpSamZkb1dwdDZVZlF5?=
 =?utf-8?B?dWdzNVBsOWR4cm1RYTZvMzlOK3VXTWJMR3N4ejNJSVhTeTlQVlFNNnZGRkpt?=
 =?utf-8?B?cCtGK2dzaWlSbVRDQWVjYklqTVdVelR4VGd0QTRzVjBsbGxvRytRQ2l2ZDVp?=
 =?utf-8?B?Sk1wd2VDM1o3UEZiQ0tQVlYza0FjcTZDM3k4MTVkTTVlellleUs1TS81VEpZ?=
 =?utf-8?B?MldaanJETjFCNUk5RUorTnVva3Iwb1VoWUVya2RLSms5eU92L3FhMmFhd1dr?=
 =?utf-8?Q?EvsyHxfGf+q4X6FnC9NFml1QLmy31b6RVBrF+LZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXZFbUphY2xhQkxOY1NabzNvUTdYZ3JPMGNkTGVDU29ZV01IUVd1RDV1c1JD?=
 =?utf-8?B?Tmw4NzRieWpHTk10MFd6ZUJmclJEYjJtZkpBUkZZZ1B2elJGQUl4QjIxcWg2?=
 =?utf-8?B?THpQOHBsTDVjblRTRDJ5dnREN3NNcHJNd0ZNaDNYeVlkY0g4KzFRbVBsQnBo?=
 =?utf-8?B?a3FEeHhTelJFT241ZWlRMU51NzlyNjZEWE5zZXQwc0J1SmtjMWxGQmVmYXR2?=
 =?utf-8?B?ajZRWGRNSlUxMmJPTVNaQXkxUjdJUk9WYi8zNHE0T1N3VHpQam9EdlpCNmg4?=
 =?utf-8?B?bU40RkVHWTRtOS9rTWhHUGlpVEh5SVBEdFgzNEZWdU1vS1dVNTFtREJGTTRS?=
 =?utf-8?B?dWQ5Ny9XNmFkTk1JK3Q2UEZvNmJ1UHZoaHJzSEVyMG56eENYdTJxNnMrMlhy?=
 =?utf-8?B?bS8zTFcwMElkQzdXQXBPWFRZQmNWbVVYdHJCSnNlYVpPd2JJOXk5bk9LRER2?=
 =?utf-8?B?TlZqcm9ZaXpYQnlvU2doY3YwZ3VSWGxoRTZPQ2NveHRldmlKb0E1cytGeEd3?=
 =?utf-8?B?Z1Q1dklIeFVoOEU4Ujc0aVdnL1gvdFhNSW9qVmdZYy95UlZIaml1ZkdlRUpn?=
 =?utf-8?B?MXR1eVhvSkNEcHZIU3VneWRKaWR1YnN0Ky9wSjQ1VFFSdGN0NzFJZm1CcHBR?=
 =?utf-8?B?RDh0eG43WXhjWXh4ZGhtNUdTZlN2TStjSVVDRGg3N1ltb1FZbndiZnJTRVRU?=
 =?utf-8?B?cXdwQmJpQlZMdkpjYjFObGw5MFdxU3pmTXh6U0ljeXhRdmMxS0YyRzV2cllZ?=
 =?utf-8?B?RWdNL1NRdXA2N1VPd3E3bnFlYUxZUEtYZ1NRTGVzTHJvNGdOcW8xRC9NWTJ2?=
 =?utf-8?B?L1pDU0xxVEJQOGYzUEdnOFl0WlE3Q3hyN3EvN2R1cm5reTJWaUNRL0xJNE83?=
 =?utf-8?B?OVR1NTRKSmVLTHRwaEhteVVnZWpVWFE4WXZqVkpTTHVSdzZNOEVET0NBbHR6?=
 =?utf-8?B?aGZjbE1ja1NveWxqc3BzVjcwam01Zk5QS25IMmkyVGp2TG1wR1F1R1NzdXRr?=
 =?utf-8?B?Z3JoZHB1cGIzaDJJdXQ5K0dUL1JVa0FtRmhKZGViNDZRaVYyZ2c4S0R0NStu?=
 =?utf-8?B?bm1XQlQxTW1WbnhnUUc4Z0RhU1hzTmhzQVBXY1hsTEZ5R1JkRG1ibHJHQUdS?=
 =?utf-8?B?dGpHdkxwQjNLRHNQenFkTjUvdEcrQ3NhbUpENzQvVy9XcVhNcEdGTTRBcFlL?=
 =?utf-8?B?S056emh4TlVoSi9zbVljenh1cGtkdWl5R1gzVDZGc29wcXZFT1NQM2gyWTNO?=
 =?utf-8?B?VUxnWGlEcjZmR0NQa1ZKR09QSTdlaXFEUmgvVmpseE14bmxaSW1HQXNGRzJR?=
 =?utf-8?B?TnpPcndvNC93S3JJcStzRnpJTDh2OUpXcS9EUXBuWXNLOHNNMXAvcGtJMzdn?=
 =?utf-8?B?QlJUbjhvQ1NjS1RPWm1yeWI5anVqZUtlOVFRMWtKVkQ1dUYrTHdUWW9RWTRM?=
 =?utf-8?B?MkVFelY4ZVk0bXlicElhYXFqWDlFMFBVZDBadXBETTljaGtFNzI3UHF5MllU?=
 =?utf-8?B?bVRYNWdnL1pZWFBBVkdOaDlTMnVsL1RsUjRoK3N2UjMwOVVVY0NuS3pOVm9n?=
 =?utf-8?B?QkY0bFZCZHNVdUpYaG4zczI0Q1AxM3FuQVJxSktPZkY2NXNaK3ZGZU1CNFVY?=
 =?utf-8?B?M0Foek1aTWRnbmdDMTRoRXZtU3BHaGF4Nmdxc3ZKMDdMZG1pVHRZSkY5N1I5?=
 =?utf-8?B?RmtRS3Y2RWxkQUp2MEJYbm5VU2ZGRnhhelJsMnRVTFM3OWh0N0dnZWlUbGti?=
 =?utf-8?B?R09YOWpLQUs2UnF5b21zSzVCRkV2UElxWVBVQzJPK2tJbHlUb1hOUlpDY3RK?=
 =?utf-8?B?R2N3YUlHa3ZqeEpVbFJ0WGY2QmMrU3R4TUNpTVRlWFZsQXZ1NCtDb050c1p3?=
 =?utf-8?B?eHNyT1dsYndQdGk2WHJoRklQbGpUeThrR250aDdRZHFrbzk2dU4yd0IwNFdO?=
 =?utf-8?B?UUwvbjJ6SVlwam8xMkhCK0x1TWk5eXZzbFdENmdyKzhCU3lpVzR5anRDTnZJ?=
 =?utf-8?B?dHV3TmtpYmJKMjd5WWlxSll6QjB6clAxeVNBbU5vTjdOeU85L0JpRkxzUzFG?=
 =?utf-8?B?OTlFeitlUkg1VEIzZVQ1ZFJtUnd1ejg1UVR6TklHcTdoeTN2QVdhdWJwUm9B?=
 =?utf-8?B?NHRVUHdtalZHVENMcEdPOVhZZnNCalBDNjBZTWpVQ3g4T05JY25NZ3UyYUQ2?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1355b378-5b57-4fb2-5f32-08dcb167e023
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 13:51:28.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2s/QTjpZZW+0IAztPXaIqHK/8YXX63TyrX2Ov7xjls1WEdjYuLVAyS2syU2tk2e9auMJqT7/hsVCPcOwp1uPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, lkp@intel.com, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, acme@kernel.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, oliver.sang@intel.com, christophe.leroy@csgroup.eu, jolsa@kernel.org, oe-lkp@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Hello,

kernel test robot noticed "perf-stat-tests.perf.make.fail" on:

commit: bcda270a3f755557316ac08c0b53c2fa23731ecc ("[PATCH V8 14/15] tools/perf: Add support to use libcapstone in powerpc")
url: https://github.com/intel-lab-lkp/linux/commits/Athira-Rajeev/tools-perf-Move-the-data-structures-related-to-register-type-to-header-file/20240718-170432
base: https://git.kernel.org/cgit/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link: https://lore.kernel.org/all/20240718084358.72242-15-atrajeev@linux.vnet.ibm.com/
patch subject: [PATCH V8 14/15] tools/perf: Add support to use libcapstone in powerpc

in testcase: perf-stat-tests
version: 
with following parameters:




compiler: gcc-13
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407312114.ee900833-oliver.sang@intel.com



Makefile.config:699: Warning: Disabled BPF skeletons as clang (clang) is missing
  PERF_VERSION = 6.10.0-rc3
util/disasm.c: In function ▒~@~Xsymbol__disassemble_capstone_powerpc▒~@~Y:
util/disasm.c:1615:34: error: ▒~@~Xstruct dso▒~@~Y has no member named ▒~@~Xnsinfo▒~@~Y
 1615 |         nsinfo__mountns_enter(dso->nsinfo, &nsc);
      |                                  ^~
make[4]: *** [/usr/src/perf_selftests-x86_64-rhel-8.3-bpf-bcda270a3f755557316ac08c0b53c2fa23731ecc/tools/build/Makefile.build:105: util/disasm.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/usr/src/perf_selftests-x86_64-rhel-8.3-bpf-bcda270a3f755557316ac08c0b53c2fa23731ecc/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:762: perf-util-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile.perf:265: sub-make] Error 2
make: *** [Makefile:70: all] Error 2



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240731/202407312114.ee900833-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

