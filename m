Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7D68CDD09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 00:51:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QM402RIB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vljt70p2Cz880C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 08:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QM402RIB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 24 May 2024 08:44:17 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VljsF2lTPz3gLd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 08:44:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716504258; x=1748040258;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vP5VTNWxMWU+dqPUvCCqgALGGrhy1jOOcuJKSvRYYS8=;
  b=QM402RIBSl8II+s96YOctLX3v18/sIBO90vMebiino7pC7gYTUzwg301
   C8Mc/DhAYbV0Dz3yuFOQYBFrYCvoqw2dhsLB7HFw9pIbzJSTFdTkLpFV7
   y+3M9bXje5QaGrE5AGFrpYCHkaXi7OIwmnTkm/ipDEtKG++Xj5M/xhfJa
   EbmkXbaJgwKj7qPsN+VHW8Qezo75aSgaFkAckxf5SZiypEeszSB0uZQW2
   OCuQrCl8655ZNjUz0IjUsGDjHuHKFKiadZhUgRURLWidvqtRSwuY/rulf
   oNzh7rVm33gvC5yZBzkq4aFqGjiQm3J1DWKyHkZhw3Nn0b+/bOojZLj/G
   Q==;
X-CSE-ConnectionGUID: 3lhSbXExT92FEzJfUK+3jQ==
X-CSE-MsgGUID: vtdgq8hLTSilv3fnNGz3+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12795375"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12795375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 15:43:07 -0700
X-CSE-ConnectionGUID: GcgnXloDS02fOQjVF64e2Q==
X-CSE-MsgGUID: 9tPJ2+yMSZadXIeefKI0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33937486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 May 2024 15:43:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 15:43:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 15:43:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 15:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BltDMPz69gnheFe2ifCvud/DWnYOYS+a/r4clhUNeqB8bT2rmBIxqCOBm3QW666L1oz1NfcbObIWRF8XTdiNiQvpwTheaEgPuJ7QrKPDwYQmhsBCEP3GOy7iT+eM6lZkyWJVBi8SyQ3pgHYpye/ZEQAyeyR7bVs60BLKym2QZfbT2P8Fw9mRv5BGXfZdiLnjXbFt8VQ0qNvd8z3Uf7G8cnYLOP8tJnDsuN2yPcl5zDyZXLU3dY6e0olwhQVXkq9bPmNQ9kf2K3B1q1I0F+AtXLv18Yb393ysIWr6G+627Y0RsO1GLrvEF745FfhOr6aHSGjJOJAw+y66ijl19chHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k74A7fvBlJogyE/VybHU2YykU87MFsWyTND/pjtecmU=;
 b=D198Za+Lk3eBZbeR+8IeDihMYGeUfGUuYRaUO5D+oLwdOEeOIeXpOPm3PfUlernNDbXPWxJEn6BwcakqqbM4ZuwbAduhSlwIB/FoVebt1jKjqZv8/iEqUowqAycymCSYlnnZdym7v3nXF8LvuBSRUPJ8kgcbB1BX0u1ihr17krS0vL8cSBt0CfoB1rMpk4A5dN+I+waj4FOfwGbZj3XxlDhXuBxL8oao+CpeKx1A74yYVTZEfXo18pBrWLavRRwI5tqv/1k6ffc+iWrY/9TOEOdSF+gQ1ufyFgiQZ3miKhG6L4GI6/IDlGPkza/cj6EPLAt2sA/Ss1Mq/WcCkRnKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 22:43:03 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 22:43:03 +0000
Message-ID: <7a7a94db-9019-44bb-95b0-dd3ef3560178@intel.com>
Date: Fri, 24 May 2024 10:42:50 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d
 during vCPU load
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
 <20240522014013.1672962-6-seanjc@google.com>
Content-Language: en-US
From: "Huang, Kai" <kai.huang@intel.com>
In-Reply-To: <20240522014013.1672962-6-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: be9cd3fe-8843-49aa-7d96-08dc7b79b472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|7416005|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzNvZEtaMFFFNnAxQmJnN2Z5c0VPczkzTWVkYTkvWlZwOGdWaWpncWhLaUxo?=
 =?utf-8?B?Nk1VV1QrZm5ObTV1OW92cGhuU2hZM2c1Q0hBeXYzYUJhazF0U25Ub0ZoSGlD?=
 =?utf-8?B?RUVuYjl2VVYxWEp6STU0elBGMFlEUW83WStWdE91Z3JmU3ZQVzlYQVJEbzRT?=
 =?utf-8?B?T0xwSjBUbUJqME1GTnR2RWlHYU1mbzhxU0dXeW5sc3FjU3QwZXZNY1Nvcy82?=
 =?utf-8?B?V1Fzc0hnRjdlYW9LNmZUQzFjMU1HRmdHc1NQVVUxcEtPVWZTUUo1ZngxellX?=
 =?utf-8?B?amR4VEpNY3BQQWp3ZnE4cEFpcFhOMXBEUnUrdlZ3cyt0eTZPcW1lL08rZDYx?=
 =?utf-8?B?TGM4Wk9PSG5oeHpUR3hyb1JWeXBpUEdyV0RvVWNVd1dpRGF0Z3BUOUlaYlZk?=
 =?utf-8?B?bE9GRUJGRjVkUHRxbGRCSlVZTDRpSFVYYzIxdlpzQXpyL003bkd2clZWTXVB?=
 =?utf-8?B?R2FKV29PbDU4bjF0clEveU02MmpZODhXNlFCY254aVRWNzBBdktjUmV6aWJW?=
 =?utf-8?B?eHR2anRZNlRGTitDMGRhQzRCRllTYmpvNmIwbzUvRkExdE9Zc2o1Z205L2l4?=
 =?utf-8?B?TUpSaWtqSG8vRWZvcGx3c2JGbG1zeGZjUXN4MjdMbjJyWnRsZVd5K1crM0g0?=
 =?utf-8?B?YXVvc3R4QUs4TjhTQTducDZCOGVPSlM3SHgyV1lGNFBpT1EwTlFRVFVSU0tw?=
 =?utf-8?B?eWtLQkcvcDQ5cmNSaHVWUzl4d1JqWXk2VjlieHYxc1hVT1lTU3RuUkxqbmF6?=
 =?utf-8?B?QWRaRlpMSUFNb1puaHQ4OGZ1OHMreXp3d1lQSDk2ZnJMYk1IRS9YZU1nNGlW?=
 =?utf-8?B?dGE5MXd3ejVJcEJ0VUxiejdUWUsrQ1M1NVNwV0JIK3NEcHFrWmRVWkt2NFAr?=
 =?utf-8?B?cEFtZXJwamd5QVBBYzVncDZUUVJja1c1TW1TRFR2aFUwcmVyZGJYUnJaYkdu?=
 =?utf-8?B?d3FESm1DOHc1OGJVTEgzYUw3aEhCVzNCdDNIVTM1ZUVCa3Y2NXdmZ0t5UVQ3?=
 =?utf-8?B?dU9xTzR6UWtUWmFEOHc1YWlOY3ZGUGV5eU43eGU5eEREYUZEdklBVXpadFV3?=
 =?utf-8?B?NjVKK3JmbUtHNnliMnVZejFqd2UvVWRqcW1NbFVsVTc5bnhucXEzUDRIY29W?=
 =?utf-8?B?MGpGTis0NmhNSDFLWVh4NHJTTE1jdUdIS0Z2MUhDMGFDT2JyejFUT2t4dVd4?=
 =?utf-8?B?THlqV3hPVWRXWmU4TUV2UmZoOTRpeUFBbDdwRW9LaUY0Q0E5N2I5dis0cFZ2?=
 =?utf-8?B?bHY2L01qM2lKdEtPNTY4a3Y2RjcybzJZSHFrckh6bXAySVZZZDVqMGRaSFhP?=
 =?utf-8?B?aEFCS1NHbVpVSzVXRDdQMWptTmYveEg3Q01EYjNYaDRaM08yWWhVcHp1UXds?=
 =?utf-8?B?VTQ2cWVvTCtqSmV5dHloZ2RHT1RjWUJTbWh1U0M0cUkraUZYYlNzM2c3UXJx?=
 =?utf-8?B?cVduY2NCNEo5UysySjJwQUc3VGpadm1RWTZSc2JjbEtEZ1VxbWJMV2twSEtE?=
 =?utf-8?B?MUtvRkMzTDc4RHhhZnBiMjlwWFdWUHNpUzNCalhSdUdRL2FyUzludVFqd0xp?=
 =?utf-8?B?NzVnd1JhUVowZnI2Y2ZEc3hjUzYvZm5LbEdEQWlaWFhnZW9UaDFEamp4eklS?=
 =?utf-8?B?a3FUNVB1N2l6OUhDaUprNXNFT2kxN2J5M095YTZrUGF4TlJ4a01tc1RiYm5W?=
 =?utf-8?B?UnZqaDRVV1dUejZUSGcvNi9RdEN0emlVenRmL3Frem9wOTZmdFVaUlgvZFNV?=
 =?utf-8?Q?2cQQMGexz7612mXS0W3V3TNTQm1tQtygV7nErZ4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ZXb0h4bGs2KytsUXhVMWFPR25YVGFGZmp6bFJmMVhlWEY5eDU2aWZJTnE0?=
 =?utf-8?B?SzEzZGdGNUhMTHpRRlRBNTB5SWwwd0tSYnB6QmJYUzluNzIrUUNUMGlLakdR?=
 =?utf-8?B?enlDN3R6QTVHYlhQMUZzUFE4NjVHRkVlejdOVkpsbTJuRzJrcnJFL0VuaEJB?=
 =?utf-8?B?ZFJtNUsycnBZZ3FGejhzaUt4NGtDNXc4S2tacDRuNG1BMXQ1N3VBaVRxODFL?=
 =?utf-8?B?MlBqcG9sUEJhQkRRK0RPb1NwL2FOczJsdFI3MWpEWStBMEdHSlNzM3ZCdVRJ?=
 =?utf-8?B?TFQ3UFJpRGl1NEZRVk51R2hvaFNEOFNzZ2xqeFBKZkM5eUV4TC90Z05tNURl?=
 =?utf-8?B?c0R3NFVodVBsUmFYT2tXMWROcHhnZkJ0WXowa21Hd0VrSmgwUUptRXA3TkRt?=
 =?utf-8?B?aTlhQlk4djY2d1pnRDIwdnZHNmx1SHUvQktER2pNZVErMTE3RkQxWCsrNFlH?=
 =?utf-8?B?MWZWS2UvdHMwNFFqYmh1QW0yQWx5Q01Tc1k1M0dBOG1jRVhLdHdIdWIwOEky?=
 =?utf-8?B?MElxT2xVa1lka0Y5Z29QYkJkWU8vL2x5cHVNL0ZOdlAzQmJUZVFnOHB6c001?=
 =?utf-8?B?RXZGWVd1V0sydkpUNzBLam1jcTBBNVE0OTJFVGE3Rlp4WFBpVk9aQ3BEUnlK?=
 =?utf-8?B?NVR3RUU1b0h1dituYlRFRk9sUXpxeldoN2EyWHNNZllxWDhzMUxzQm1uS3dD?=
 =?utf-8?B?b2x6T2lXSmhaNHd2N0xSbFJ5Zzh0YTJVaFJiOS9rUGI0VXZDcUtUUStIS0Fm?=
 =?utf-8?B?V3BNSm1iU0hQalZ3U2pTYUNBbnllSGQxWkd3d1J5bFhpc3VFZnY0TUR1emUy?=
 =?utf-8?B?aDZpTGZ0cjEzV3FockovUnVVYUxxalFIcUZzM25LZ2lBTmc2NDRObW5nbkJB?=
 =?utf-8?B?dHpDU3lMUGl3S3gxWWQra0YrY21lK2paWTlmbEFYRVpQTk1JUEx2OVF5YzBX?=
 =?utf-8?B?OTNWcGhwUXJVc2RiVlhSV2xlL3p4T25IRm1mTURaVlJ3eHdTL0pDV1UyK2Za?=
 =?utf-8?B?Qk5vN05KQkVkWUtwdVo0blh4cHlQMzQzbG9DT2Z6QjF4eXo5YTd3b2ZjeURL?=
 =?utf-8?B?ang0VFBRR1RvNTNwOUwvTm5oVkdHbXBmS2dhN1ROY1BJaG9SQ011TVdZWmoy?=
 =?utf-8?B?a3U2cG1uRys4STN3ZktnWE42SW5NY2NQeTFPejNFOVpUVmhIbDBPamxDVFI2?=
 =?utf-8?B?eVkreWp1a0pwMHRKMDYva280bTFMZlltTVlBYkRRWTI4OVZEZ2RCWVhKRm5v?=
 =?utf-8?B?ZTF4Zi82TUp6UzNZdEZWT2NYdWpYK05GSXNDSCtVTHRvSFo4ejdsalZMb2JY?=
 =?utf-8?B?ejlhNmUzWUQzZTJZZVpqWEhrWC8wcjZZMC8wUzNjKzdlWTN3b0RtNWRjcU03?=
 =?utf-8?B?MHVJeDF6NDNIODFkWmNGd0tpOEtKVHY4Rzg0cmRhdjNaUTh2MUpGWncxbDBY?=
 =?utf-8?B?YW50MnFOZVN2ZnVIakU3SitQZGVHRFVWR2pZTDVNTVA2UktrU3dvWjZTbUho?=
 =?utf-8?B?b3A2RWNrUUphclZhL0p4ODlZeWsxWFladWZuWkhKWXJSTFAyUmxQN3RacXlL?=
 =?utf-8?B?aDF2RENuMTZCMWJaejVodVUzQW5uODN5SUszejRIek5EY0p3VTlyM2lteFd0?=
 =?utf-8?B?MkltNjhpTUhjaU4rSlVENzV2NDFLR3ZoNHlNSFcrQng5cUROWHUxNmFDL1Jw?=
 =?utf-8?B?NUY0RFdXNDBYbzh1TC9CMHJtZ1N5RXBqdjZCdWVtYStwczlEK0dCUlFvOGRv?=
 =?utf-8?B?V2hHOEZkNkZIQ2VmU3UvTnRUQitVTjI1MGgzaU1ydnZWZ3hJdmo2TVZCc052?=
 =?utf-8?B?d1NFdzVZcFN2QkQ1N1pjUXpxUnd1NGM4VGgzdDRHd2o4Q2xOdW1vK1BaQS9B?=
 =?utf-8?B?c1FXY1RPMEd0QkoxRHhGcVZUdkpUMmtudGd0dStXWjZEZldjclN3Mm9ERVRw?=
 =?utf-8?B?U3pzYUh5dm5YbS83cWxHYzBBdzAwQ3ZQUGFaSzkwL293cUVaZTRXZCtORUtx?=
 =?utf-8?B?ZEk4TkZqby8wdER5RVdSaTZkdnFxZklDUzI4MWRaZUlka1NXMVNObVlBVkQ0?=
 =?utf-8?B?N3VnVi9mMit2dVU2eFhQUWJxOGl1WXBvZG1OZS9LWTE4c3VLOHdRb3ZQVnFy?=
 =?utf-8?Q?A0+D+llZK6ckhQQ0hQWfwRBR8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be9cd3fe-8843-49aa-7d96-08dc7b79b472
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 22:43:03.0290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUtgevdcadRemJRGGODK62Pb1RDpA/XzcxctB8TajOuZi8EiUC2y5fRBXLouBXNHWGE+mIaLVHRAeI5z2TkJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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
> Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
> it only when the vCPU is being scheduled back in.  The flag is processed
> only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
> before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
> meaningful value.  I.e. the flag _will_ be set either way, it's simply a
> matter of when.

Seems reasonable.

> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Kai Huang <kai.huang@intel.com>

>   arch/x86/kvm/x86.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 59aa772af755..60fea297f91f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>   
> -	if (vcpu->scheduled_out) {
> -		vcpu->arch.l1tf_flush_l1d = true;
> -		if (pmu->version && unlikely(pmu->event_count)) {
> -			pmu->need_cleanup = true;
> -			kvm_make_request(KVM_REQ_PMU, vcpu);
> -		}
> +	vcpu->arch.l1tf_flush_l1d = true;
> +
> +	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
> +		pmu->need_cleanup = true;
> +		kvm_make_request(KVM_REQ_PMU, vcpu);
>   	}

Nit, the unlikely() is lost, but I guess it is OK?
