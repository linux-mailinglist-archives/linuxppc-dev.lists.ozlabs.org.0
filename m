Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 055808CDD0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 00:56:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob6yEkSk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vljzp1bWtz78h3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 08:49:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob6yEkSk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vljz060Zyz78Rw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 08:49:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716504557; x=1748040557;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9QdRnUPqmumazAtw8c0b9WNKcPqbFZolJZXer2hSDp8=;
  b=Ob6yEkSkWvMO7/hLPzRUlwsDimeN2+KoCUNMlOlmGKibs+W8MmIN7Wly
   Cl/5lZjOPi1wu6dAPARRFoh8L2lu0+eIWOHfQFwMR56LPb/I63xW6lPLs
   GK53KNmc4pEqfDWPB6ZeRfVPuv3ETuMV9ibS2nIb6r5Xe3yr0sLwHkovI
   HrN040QkbJeLuAUkrnrqOI4w0Y/TP3vsxkcTxPTYxJEV3w07v1axfLoxB
   DjuwOdlYEzlv/UsbilnduF2zHCO0YRxeda/BxiQWxHGxtHEh12dnNozET
   vtHu01R4BUVACq8chScutLXNbuHSSCTIcbHzuZLeGZtnUpemMW/hDck+C
   Q==;
X-CSE-ConnectionGUID: TkzZnotyRSOW3SHp708SwQ==
X-CSE-MsgGUID: vap0xFkETI2y4CooYPOW+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12976846"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12976846"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 15:49:13 -0700
X-CSE-ConnectionGUID: +66bjl0QTC+2pZfcK2ZBDA==
X-CSE-MsgGUID: PoU/BE9CSFqt6t74kY9fjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33806904"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 May 2024 15:49:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 15:49:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 15:49:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 15:49:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 15:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzQxp8pYPz9VaBtWHKh2frbRsQiTfFilWNeOJv4zgv0Ep2hI1zvElUiIlZIDTqO+Co/ghdzOEzzWijJ2VdSC84GC8dd0tjeJm3fA+InQpC102Kw37d/tMSzTOkHlLUZGGqVKAmKD6pAcqUo9WlObpQo7VXa4MGgXmazwyBag4febpLZYL7baoHtpntt+zCmf3ofjePvhCfMSDyVTSavCPQsJIA2thHUjSBNni5XJputBHIpRkr8MuWjWPuFcZsj/1JoXwyPrcxkUmhqpQn4oKWAlQojjjR8edpphSK+7yyqcHTk6R1VhWeLK9WoOs7Mj/dQtldLpx2aiqyQQ0xiOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhNj/HeClY1JmbmDRCD8PokaFxatNqVnL3Av1RIV1OQ=;
 b=jnQSshZzJDpGMVvyjZJem4TdC+9UgQFarK5zBxfG/7TGYczJ/gRK99+qurxQGOmjbZ6Lloq2BwtT2Nte6HN+x8WSlXHFAxD8ha6iy3NvpdFSBoGl9Iy4rJpJmEcu25Qv0jt8vPkziWm2mRg99MaKSdgh7X2GfY3XaKyZ5ICa5vAEGwcq+RC7u3wr8008dVABAbKKsodyORpXCq2Mm0M+BGyimFHyI9hvGLO/QHk3aPDHFp5dztEXBeIMQtBM4l506/G3oTVie6qxhssJucKmbG76syJmL1KTr6FfVwah75vkMihU909Gt9HsV2K8ZNoRp0KMGNTb1YT7BPXL6zkVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 22:49:10 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 22:49:09 +0000
Message-ID: <0a295336-c211-4d4c-abbf-a552e6f0a94c@intel.com>
Date: Fri, 24 May 2024 10:48:55 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
References: <20240522014013.1672962-1-seanjc@google.com>
Content-Language: en-US
From: "Huang, Kai" <kai.huang@intel.com>
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: e8711fe7-5b39-4a73-6b58-08dc7b7a8f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01NUENGMFVzSkRyS010cFZnK2pja3EyazhiaW1ZZ1E0Yy9uOFEreFcwbnpP?=
 =?utf-8?B?ODFJdFcwblRxNWlYdTJ3VDVzYjJ3VEUyUjYwZFJ1bmUxeStRM0I3dTlRalVh?=
 =?utf-8?B?ZmFBTFcwTDQ1MWlVZC9NZEtsYjBueG5udXpMQlpIc2RvVEpZUTVmTnAyc0lC?=
 =?utf-8?B?TXdmWkFocHdBVFlEbWE1ZXJ1NzMwOVgwaWIwSFI0elpzaXBpZDI2TTg3a1JL?=
 =?utf-8?B?UTNLMjZjalpqd3ZsSFZ0RGhiQ1loY1J2cVZHZzduT3RiWmNLTDhyMFdnNG5n?=
 =?utf-8?B?NFBQeDZmR2QxMGZUamFlWGlHSkFXdEVOOXRVendqbVYyaXBkMWFsVFRxQVU5?=
 =?utf-8?B?MDlkUEd6QmFRamtXRUE3L1lweGV4dVJrakNDbjJjS1hiMENYbFdRYXJBVjd2?=
 =?utf-8?B?c25admFPd240K0FWS3AzUUJ4OGUyWHlTb1d0Q0dlYUtNa3VYc0VlMVF4b2s2?=
 =?utf-8?B?K1pFSGxzc0ZwT295czc4T2FzV014TUxwc2l5anIyN3AxVitpNE9QdG82M1ZR?=
 =?utf-8?B?UzM2ZHpQazA4c1ZPK0I0dGhZbTV0WVNiazZIUFZEekxpRjVPVkZFMUUrS0ZE?=
 =?utf-8?B?NGFzOVUvSGtReE1JbDB1UXQ0bnc5QU43WHBaYk1pb0dSTHF4LzBscTRSSGUx?=
 =?utf-8?B?L2VXNTh0TG5ha1pTdlkyb01uYUU4b3d0RWJWZVlia1p6U0NEQ042UXJUaFVZ?=
 =?utf-8?B?WE53MFhmdzdraUhjYUVOcWVOYWJleTFGbHE5cFcrSjBMWnNPeFNxbE5XM2xr?=
 =?utf-8?B?ZE5CSlVrckFXc1NzeXN0ZFBPa2NISjRvbFlpckxla3FBbzhNaFdIZzJ2djZ3?=
 =?utf-8?B?VVN1Y1NyWXBRQ3ZEdE8zczNDNWh2RFJsUncydVBrUzhyZUd2M3pOSlpKYmhZ?=
 =?utf-8?B?cENJTFBVTVJrbVZHK05kOTYwdXArR0xUVWREUnp4Mkpib3RLK2g5NE11YlRL?=
 =?utf-8?B?VVRRa0Z2NGtXQmhzQkw3aG5idHBPa21obHNzd3ozbFZXVy9uVWhGUEI3a1Qx?=
 =?utf-8?B?Y1lqa2R4QUVNQWtuMm02OE5Mdy9BWXhWc0c5Rms4bTVmN1phU3k5V0YxLy9R?=
 =?utf-8?B?ZFpoSlNCN1pOcVdzT281L1lmdE9kUUV5Wmh1VFRmQSs4ajZGUDRnY2k0Sk9J?=
 =?utf-8?B?a0RGdThjem1HU2wyU0I0WEhWN2U1MGpOejVyb1FaUTJPYWZCd3JnRngvdGFk?=
 =?utf-8?B?OUN5YTQ2Q05IN0FzbTVFR0lNcW5qeHBFMk9iT2l4WlhnbnduNUVubWtSQjFh?=
 =?utf-8?B?NUc5UmJycE9XZ1VESHJGNGlObjRHTURwVXNsVjUwdTZyYk5uMVgxVkJMeUhm?=
 =?utf-8?B?YXYzQUxPTHpmUzRQWGhkd0FNSTdtSWtWT0lYbUdmZzVheWpvcGNHUXFSREw5?=
 =?utf-8?B?T29JVjhJNmdJUVJKWVFNbkEyZHZZa0IrclVRY0g5NXhOY3lhMHh5RWhudllv?=
 =?utf-8?B?T2JPTDV3NWdKYVJYNnoyUGl0eDI3bExaVi84WU9MemdqM0JCdlpBMGdtSDYv?=
 =?utf-8?B?THJhLzBPOEdyLzdkQjRieVg3K0orTjVsOUVua25Oak1lYmN1Z2liSXJVRU9F?=
 =?utf-8?B?YXJaZldMQm1iMVJ0MExrOTV2TkY4NnByN3FKSXBJQWU4cE81ZytvdmZEU3ZB?=
 =?utf-8?B?STZUcHRPYngvb0tRVTZGVHRITUNLZ3pPT1N2SnZxdmtZNkZaSE1iT0tiRzN4?=
 =?utf-8?B?c0ZYL3VRZHFwaTRBdkI4dS93bXdnYitFRGRSKzZrVkJ4Q0NJS2gyWUJyZ2po?=
 =?utf-8?Q?2ULMPVO16Lkbs961ANxsC/zZyHdX5PL6go0rMmh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clY2ZmZBMElOclF2bTlhL09sK1JXSXNPWm5sSGQ5K2FpTnI2UVVPNWNOS0NX?=
 =?utf-8?B?QmJwbS9tYXJCbVdIS2Vkdk1EUy96NFJXNzd1eFpzalpRSjBJSDdVaTRieXNk?=
 =?utf-8?B?TUtLNVArcXZ0d2x5TGlJYm00UmduNHRKK0xHQ3dpa1VkTHkxZXVFaFplY0VT?=
 =?utf-8?B?d0I2b3FoZndsWTNBUU00Mi8wZmlmaEd3TUR5aFFDVFgwS0tnbU1RU2gxSDR4?=
 =?utf-8?B?TkQxUUpDU3B0amNSaUovMzJXSkZJd3RRd2JkWVhxRzNmSTU1YTA2S1oyQTN1?=
 =?utf-8?B?NzVxZXllV0RPSTQ2ek91cjcwaFZkQjBIVzFVZkVTZ2E1cUZtZlhPbTRmTGtz?=
 =?utf-8?B?eUZMSVJyQ2JHeWxUNW1lS1YyeDNZYkdzb1kxU0pXUnFleUdlTkZwbnVod1dZ?=
 =?utf-8?B?dldpSjFZQUlFcjN3cEZwbW1tV1c0ckRPd1pHaHU0cmFMOHpwbVNRb2MzMzl6?=
 =?utf-8?B?K2VheTc5T0o5Wm9NeWRhMFB4amZZY0ZpT2lOZkZ6WUZZNnFtdUJUTGM3L1Ba?=
 =?utf-8?B?aVFsTWRQZnZDMmtOT1NldFZBaGxNQnpRdlY0TWY5SjQ0U1pQZEsyYTB0TXpW?=
 =?utf-8?B?RFFob2J2Ym96TzhKRmtDWmx1eHp5SG5FdWZsOG1Xd2x3WWNLUDltTFBQQlhr?=
 =?utf-8?B?RWhQSTlUQ3ZCeHFONTc1ZWw4RkdrOS9JNzRjV1pZUDd5N0d3dzNqUkpKMlQr?=
 =?utf-8?B?OG41Uk01bVp6bThzcVR5UkEybzV3eno2QWx5Nlp2OVVGRE5YaWNuTlAveU5Y?=
 =?utf-8?B?SFlxT1g4L3dzNGxzVGRySTdnM2lrTVM3N2xFRXpyaGxMaFMzMnJsa05MWG9Q?=
 =?utf-8?B?R0RSVjE1aS9vOXNoUDZqM2R3dllXR1h0aFZUemcwU3JxbHBQRTU0MFA5YUNr?=
 =?utf-8?B?MExyWVNUeUZpblVPVmJ1ZnA5S0hWSTBSbTQxeTNkckUxVzRDVVEwallHamdK?=
 =?utf-8?B?bUZnZ0V4ME0wUGFUd3JIdUZLWSs1S3EvRmVEUmx3ZXZaTTZyaFFEbGNyRjlR?=
 =?utf-8?B?K0s3bzMwK1BVays2amdZRVdjTVRQbFlUR0FsQmg5NTN5YmxldmFiZGVxcnpI?=
 =?utf-8?B?MFRxRGp0cnpLaC9mS0hoeGFPdm5reGZoeEZQekJ0UmtrZTBWT0o1YlEzbEs5?=
 =?utf-8?B?SGJmSCtyUUdjWWd0ekNzSHhKcEdDZ0FwN0NRSmZDOG8xSzlNRXhNeWpWbW5L?=
 =?utf-8?B?WG5hWkpyclVnaTBTekptc2dSNldidVVXTVdIZE4vL0NmTGlCc3B1NFRUc2FZ?=
 =?utf-8?B?R0ZIV0UrQk81QXlaZFBmMG02YmtUTW1WTmpDUStBTExHT0JHaXdVR0FHeXdU?=
 =?utf-8?B?eEZlQXFPU3BQRnBrcnowVnQwTGVxV1hYNko4blJpaDI4TzR3b2hzWm5vMlp3?=
 =?utf-8?B?a0dIYzhUOFBYaXpWSm1wU0kwRkM1TklkTFB0eFhtcEJnSHhEVzZyaVdna3Zt?=
 =?utf-8?B?dGhnUVZXNDlsMDFIWklReGw4dkpzZGxiSjVZQVFiRkgzd2JaV0J1MHVQQ1ZB?=
 =?utf-8?B?WjJYOWh0OHJxR1c3MzhQNzlMVFEzU0hsV1lWM2VrYlpXenhFdjZtL0VpYVdY?=
 =?utf-8?B?ZEdqYi9pWXh6NURadVhlaXdZaVdvZC80UVVNWVhYTnpRNnBGbWxuUGlIV0I5?=
 =?utf-8?B?L3V5TU1aMlg4NFpCVEhCYTNDZitLbGVlajFBQ1B1Zzl2REdRS2RnR21DNUZ6?=
 =?utf-8?B?S0h3WTFQODJqb1d3WEVDbFlYclM5ZXFhaEwxR0V3ZDFDVXpZcVlJY0YwcU1j?=
 =?utf-8?B?QlpVL3lEMS9JS0NaMTRQNFR1QVBGNGtJdWVFZVgwb0VPZEplRDcrbjZWVEJF?=
 =?utf-8?B?Z2pjTmJlNE9COHlCRlJaMXk1T0NrSE82RFVnSWpwZWZvV2djQ0xrRnkxUnRy?=
 =?utf-8?B?Q0Z1R2FxSCtRUzVnM09VTGJtNFp0RkRpUEJUZ016Y3Y5VGxqZzZuZFFlVito?=
 =?utf-8?B?dU9ZYThyZkJZeVBUa3V0cHkwbG1FbE90dnlUNTltd1FpbVpFTmRTdHp5enlP?=
 =?utf-8?B?cEp0RzhIMm9FbGE0eEdHTktnZHVpeGtNSG0wRkhQR3phL2xpL0VxbERVSjBo?=
 =?utf-8?B?WWVpT0xiNVVqZjJZRzFKZDRMTnYrQlM4SVltanBnd3RWY1hQeTJ3dkpxeWto?=
 =?utf-8?Q?+cac2mGDjTAdcALqaaMgU7wTg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8711fe7-5b39-4a73-6b58-08dc7b7a8f23
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 22:49:09.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTYBzwtFPGKu3307roVZh+Jk/bwjakV/J0Y3wdFy7kItuW3KXdKHQXU8ayLaOyxxTOTb+sc2c9Ymm1cDyCqeYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/05/2024 1:40 pm, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
> to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
> back in.
> 

For this series,

Acked-by: Kai Huang <kai.huang@intel.com>
