Return-Path: <linuxppc-dev+bounces-13239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8154C03A99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 00:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct0qD2lYBz3bd0;
	Fri, 24 Oct 2025 09:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.19 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761258056;
	cv=pass; b=IzPDQ5RsGaFiamFZAgb40J+BQccLN5U62damlWp8CmXRi7RiHkqdYe0teN2q5dgB9dxt93N0N9HjlI/JzpOgRUW+JiIs7xB4txriVpcBcqr1o+LeXtYFujFfXHRbKSFF/TjDDIo7WZD0iC9H9aAbnNipFBEBy8uZudGTI0n6Rv7NWgipS0Kvq29EBl6AjS8l4VKovdSRFiUfjgjndt6ClKQL66DhI+WvIPgn6ApS6T5t6nu3bkO9hH9BhvZPezLrBPDPQg3yO6r1tThC1VvxRRpaHRrIDr/xi9lgoaIpkptmgg/JuOrkguAyDRpO+PYOBKYPUnASraiwaDzLGV9zdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761258056; c=relaxed/relaxed;
	bh=C0X6fVk0Lyfk5iDQCbJG/fRqcL/et4xfVqf3ivMscok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J8hl3phOd8RZbbygsZuw4BakGZfLpTXvbP41u9a+6PKpj5nqBywFsPlV2bgQYJxIB4P5zyHICEgCkMuYVCafcsSFWlEl5/P6TUf76X48WvfTXkem7a9z8Y3YT0ejYlLcBQ2xJxjFvVNCWYkz3CgJoLVTW9AzRFIvelzbnjNyW7UGD0mfyNb1blcPrE2Z56U9xBtvMbXzJFhxAQtXb1WGfCyb/+kjqGoi262ZMlszRIfwwnX3/QD/RLI4AsdJ6Y/h+kqgEu6zl/SpfKF8gLk2A5wSeIzFYoOr7LKyukCYhDtmJGVe70tWWcMCVoA2vs7T9k4jO7A2AFgV6YOhMS94OA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VNijDrRM; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VNijDrRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct0q95wpzz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 09:20:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761258054; x=1792794054;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=C0X6fVk0Lyfk5iDQCbJG/fRqcL/et4xfVqf3ivMscok=;
  b=VNijDrRMPAbDcqeGix5/Sru48lYos587h3B+B7p/45sno8Yd61QGQ8x5
   rcyRN1P/jWICF03y7Eel/LX0xwKFiTSjinch+RdWBnM3AdcMMNd3X2cof
   ipmEP6aiuEUmkvr22knh49TBS8eqrenDV6ZIfO1D3QfSkdbe+zgwuXIAT
   LOlkjwaMt2Ryn/ZyHcnXSEwBd6VlSuUJCk0YAcsO2QQoFvOUfLnltxm8B
   ooF8X9UVXyd+Q/T8Dl4wOV4THSxx7M/BNkhmHvUXkkfcGBTGocyJdfCnn
   BSS8rXROVCHZYg1tzU0/iQhIZI3tNB/gB0rwlpMfHewklRLSd36pWuYE2
   w==;
X-CSE-ConnectionGUID: DQUsC0F4RBin2r2OXPQyEQ==
X-CSE-MsgGUID: 3Frz+BD2QW+WXbg4obi3qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63332246"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63332246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:20:49 -0700
X-CSE-ConnectionGUID: WGJSjZkdTmySbhxrehufFA==
X-CSE-MsgGUID: RtglXEVtSBywKjBgZkzNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="214928280"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:20:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:20:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:20:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv+1trIdZmgG6YTiLdwtSPkZ6z8hm4KIw6eOTRZ3fO/djGCai+M90O3J8NuPjPlTH/vnjd9hVs1x1fbkMwqk8a7vF13J6YA8q7+jTWiki+tR0jYjl52tBlGcja0FwQm6k5KXMa9H7SRylIOprSt2vj4PEPnDAo2r+cBWdO02XVpG0tOXSQytxcu8jC/+O9xruxtvA2QDoNsDQlnBIPTl+uuDTyl3yHnjR2T4/s30s9JlCYjkF5dB7psXWDtA+zKxDvPKlYGYA1S/A+Y40HZINioa4SOjcGPdyN5/G0iEh7N/pXOo+jqy+aGeJWkEsVxaIc2Xz1o52m4fypUGBm3lVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0X6fVk0Lyfk5iDQCbJG/fRqcL/et4xfVqf3ivMscok=;
 b=bszZ4mey8lJvil0uAuGGO/f3eLB7S13MLYKoZ/DGOtaPHC1fZT19spBH+4ufCJJJLA1MWJQmO53MAoGB0BEZDsw1X5+8JwLrPqXiILJyITMPCJvnxQZ9LaZDvQO+/ha60jXNKmkzbZ7x4kApOqcPNsJY//igVK6p9EHSrr4Fuy1SqPDVL9zFT0WX9f3Z5zAQCfyYjxkKMsdegHsF8YWFuAdDD/Is7w6WtvXeUYNee1ZnOa2YquBNeMHhmxdxXbo1HJqzBv5Kmr2L5mFjthyJuklL0tm3cB7duKPURd3rFPjmktPhqnrgxqd0utSAZPcoFdqHfW23SbRhrL/AprL0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:20:45 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:20:45 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "x86@kernel.org"
	<x86@kernel.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>
Subject: Re: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte() into
 tdx_sept_remove_private_spte()
Thread-Topic: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte()
 into tdx_sept_remove_private_spte()
Thread-Index: AQHcPv2gLm0PphD5f0WVfdqHF7sfHrTPmGoAgABFAACAAHskAA==
Date: Thu, 23 Oct 2025 22:20:45 +0000
Message-ID: <4c2e498be574c9e0e75aa0e8d4f10229d0373785.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-10-seanjc@google.com>
	 <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
	 <aPpC7mt3CwWuhv1p@google.com>
In-Reply-To: <aPpC7mt3CwWuhv1p@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB7445:EE_
x-ms-office365-filtering-correlation-id: 44dd29d9-021a-43af-c48b-08de12826910
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ekFVMzMzYjAvNElFSkpVTElZMDBFQmtGWnpXQkh1V0FWVXZFeEZteHYycDVs?=
 =?utf-8?B?Y3dLM2xlK1QrVlVQaHZDdkFCYjJLbXpNTEY5ZVNGTXZJSTVEdjRXQkExdXdR?=
 =?utf-8?B?VmQxS0xrWVBQUFVpRDNTV2g0U0svc0tFd3hBNXdPRTJIdUJ3ZkU4czhteWN6?=
 =?utf-8?B?YmpiQ0JwQVFic200SCt5d240Nld6NTAyV09INEtMMXg1U2MySmxQNHE5d09L?=
 =?utf-8?B?T2pyandyd29RbDhhSlhuNUxhMy95Mm9HUUViT1NPUUJGV1hhSG5WZ2FnM2Qr?=
 =?utf-8?B?VFVtRmh3UUl4emZrVFB0N3Vib0o5QzFaSTNtbGtKVGw3Zk1hSUluKy8ybGl5?=
 =?utf-8?B?ZXR1MlorbUhDWXFyNFhrajhQU1k3M0RqRlRNZzE2Ni8vUWkyZmFLSjV1L1BR?=
 =?utf-8?B?aTdDaG1Xc24xeGVKRXJ3QWRoVVlhREZ1aG5LLytiMzFGZldQcHYyejZHWkpv?=
 =?utf-8?B?ZlZKZDNPUmZNTVdmUHMwZTR1VXN1bFR3YkkyZGE4YURwMVBtTm5KNk90WTUz?=
 =?utf-8?B?cS9sUzlwZXA1ZTIzRmFpR0hMWmcxeURWeDBuNVZHa1hGVlJKdGdlemhiU0Jv?=
 =?utf-8?B?THpkTVZtOXlFTjFvaDdhUDZ6VlVVbE1POUcySWNIY2FBek1sTVY1eVlLaUg2?=
 =?utf-8?B?ektmUVE1Y2NWS3JQRDRnQTFpMFJ2RTVRNFJFYU1vd1Q5Qkg5REpaN0JpbHNt?=
 =?utf-8?B?RmxTL3V5VkljbzM2VU9BV1Zkd3puOTdkVUdVWEZ0ZVJCYU1MY1BJTEMrdHc2?=
 =?utf-8?B?MDNLNTgwS0cxWGpqUEhVS2I1VTJackEyY2l5b1ZCeTJIT25LcStNejRsMVl0?=
 =?utf-8?B?THlNRG01and3T21TTEExc3ZkcHdjZG9jQzlTL1Ixa0I2eU9GbkRWR2llbjZo?=
 =?utf-8?B?RWVkRUhiUEt2b0RBRERvWVFVY3dUbzJydkRBbXpRYTI5TkthRGRzZ2tSempt?=
 =?utf-8?B?S3lPM0kxd09ZY0xVZDRPdWgvaTlmQXVNZUhqcU9NWU9sWllTc2NPVjNjTmlT?=
 =?utf-8?B?aU5yOEtIN1dJTisyOGc1WnF6WkVYbVY5ekNJQ0I3Q2Q3OHdnOWdoVUNLUmVI?=
 =?utf-8?B?ekFhRnFFdVA2cFV6ZWVWRnlYaW8vRzdaaUZ2SWJhektlcUtwU1Y2dWsvL3Js?=
 =?utf-8?B?ak1ucEl2eFhXSFhRbk9lZUFJQU1RYjdIWjB1eklCdjZBcGxTME1idFNTMlZj?=
 =?utf-8?B?YkZaN3QxZElTUzIwdkJqcnlhMVFWeVU4MFBPWFVEQzlZV0pJanJrZWZQdUVL?=
 =?utf-8?B?MWlhQjdrWWVXWm5WT1RFTTA0RFBNSFFJSGpRTWVDdVBzckh3a3V6ZGxxQlEv?=
 =?utf-8?B?QndocHlCT2F5d2FRRG5iVlpPbkR4S0NDQ1BLSnhuUUF6SGJHLzRBQWY4RVY5?=
 =?utf-8?B?VVdxSmpZc1VONVZaS01BQUo4UlE1dnBObHI4bHAzSlFZK1FZNkRucW1BK2Vy?=
 =?utf-8?B?SUZXTTFCQ2x4SEpWTzhhN2R4RjVMRHhlU3pEWHI4NC9Yays5YWFIVzloSFU1?=
 =?utf-8?B?eisyNHFOSURGWnhoZGxYZlg4K1ZtL1JpYkg5eGJEb1lLOE5oeTREbnkyMmw3?=
 =?utf-8?B?U28rQ0lLRnlkM0FQY0k1b0FGdEZxRG1KRHRrcGNyZ2k4K0RyOUU0ZkVlR243?=
 =?utf-8?B?RHFLb0NGQnp5ZXhycENSdGFqMncyYThCd2xoUmNEZlhyeEtoUU5UcUlRYkVs?=
 =?utf-8?B?QnJLRUhQOEgwMENNaHJDNHNmYjdVTC95eTBxRGFsMnN1blV6T3pNK2MvTStV?=
 =?utf-8?B?d3gvTWZCNTNnWmtQL1BBM2FELzJ2Qkx4aG5rQm1wdkxHODlVTnV0ZjlXMG5O?=
 =?utf-8?B?dVVOWllPSHYwUWkwSkNBZ1ZJSDRya1AzL2Ixblp0WFZqdzhqQzBiNHhvcHhT?=
 =?utf-8?B?eFovdmM1eVg0ckp0OHp0cFhuQnJsYkRSSkliajVRYzI1SmZGVlM1WVppRVRG?=
 =?utf-8?B?U3IzL3NtS3c5VjROUmRwc2IzbWFQNU5XNnlZaGtNbHJURDIvZkkyVE40R3Bm?=
 =?utf-8?B?Wnczc3loemlvS2R0MzhsVW9ZR2wxRzVqV0RCdWZxTHFHRlg4RFNaOHYrYVR2?=
 =?utf-8?Q?GQrT6f?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzlpbmxYNkxhcWJDUkJaQjZLVTlIeUZTbkZ4SXkwNVVKTkk1WDJWVHBnc2JM?=
 =?utf-8?B?cmZmVjZUV3pLcWxnazdNQ3ZEOXhBenh4OVhxazZYY3d2bkdBSFJEak9hZzNp?=
 =?utf-8?B?SXVHTE9JdEFpOTV1VDBRK0RFdXJrSmx4Y0gyZDRIdXRNMVRXbGQ2bDBaUm91?=
 =?utf-8?B?OEZBeVd1L3p0Qnc3Sit4WFpUUVVVYnBYWTE3RkVIMmRZYjZNS2U2QTdLb2xT?=
 =?utf-8?B?Q3hMOHpFeXBWYVRtK2VyWVNZQ3FqeEdMc3JBYTdjUElVV2Z5bFN2R09sRFdi?=
 =?utf-8?B?ajlFZGQvTi9meEdpWHpxVHJVOTFiV3Z5clQ0Vmo0T3pIbVJ3MDNFeGNpRmFR?=
 =?utf-8?B?OUFQZldiK1RWdi9oc0o0SEZuNGhrRTRacXFYMnVuU25KUFFPSWlxWStSNnds?=
 =?utf-8?B?Y2RqMFRrcVBleHBiT0pBUlg0K1lZNG1oOWQ0MlQyaGJxcmVRaTNlWHpnMWs1?=
 =?utf-8?B?L2IrN3pBcS9mZ0xXZUsxckFhVGQ1d2t2Z3ArUFNCanZ4VGl2a2E5c2JDTE16?=
 =?utf-8?B?RzdtQSt4SWVMbndPeEtmZThaNCt6QS9BUk1XU1JyV3F5MVRoWmZGZHVPM0FC?=
 =?utf-8?B?b1ByajVoVk9xZ0UzZ0R4MHpKcGNyQ3A1dU1OcEhiLzFBQnJhWEF1emdzQkw4?=
 =?utf-8?B?ak1pMytSZXhWdGVITlFDemNDREpNVUFRT1JScVBQZzhLY0lhUk5ySXBpWWd4?=
 =?utf-8?B?cWhKT0F5eFBpaVBUT0FXQWFYd2FVUlNtUTUrRW90TEo1MncwclozZnUvSkE5?=
 =?utf-8?B?Umo0aWRXNWVxZEZLdXVQcTltM3pERFp2aGt3d0FjQkhiM25mNkhDeHhlblJ5?=
 =?utf-8?B?RU5JQ2FQUHVVaEpmZ21meWpOSm5ibkg2Z0MyS2J1OFh4SG1VbTRRVnNqSVNH?=
 =?utf-8?B?NzVMMW9mV01FTzl4T3RFbzlzeGwrWU0xekFEUWlPb1VRa0RDdzN6MUhzZE5y?=
 =?utf-8?B?Zjh3SW5kWGdkVDQ0S3RTZ2ZCSEw1TEJ0aUVhSDJIQ3BtWFlNSE9DaFhaNnI2?=
 =?utf-8?B?ZDBZU3p1YVJjNmJkeC9ESTA5bGtrQjhvUkFuKzhiOW9VeWtwOGowa2tqdlBL?=
 =?utf-8?B?K2Z2SXNrWVZKSS9aUmVHd0dTMUtVY21VLzlxcTFJWHVZZmwyVDdIVGxSZjg2?=
 =?utf-8?B?Zm5peFFSUmtJT0FVS0xUa1JsQWpTSjJVQnBjNEQ5T3ZkSjluWVFxczFmUTBj?=
 =?utf-8?B?NUU2M3MyQVg1bWpLNmoxdHlDOUJSeU84KzA3WHFROHJRMTFZd0U5U09tem41?=
 =?utf-8?B?aE4vWVBNakZYMmlyZWJJaDE5UUY1U25WbXFMcVQ1a1FCWmloeFlncGpEdWx1?=
 =?utf-8?B?S2FuT1Q3alR3bVlKSmp2M0RDcko1QU5LSkxja01OeFNFSFNLZDd3WmFVZWJt?=
 =?utf-8?B?Ynh2WFRBbVpXQ05SeDFTbEdIM1Z2Mm5pU0t3SmRMeHhjMk1LcmpYS1NZZXVQ?=
 =?utf-8?B?UEdWeUl5cndSQ1dTbHBnL2lMdlV0OThqMW9CejZieU0xaVFHeVpXUjlDZkJG?=
 =?utf-8?B?MkxRbzJmSi9ONzl4ZVF4QnduVlBxK05oa21JSzBRb2hhVEZVazErdFU0SDhG?=
 =?utf-8?B?aVdTUDhUSC8wZ1J3dDFFbldXQUMxajdlTW5TQ3ZnTnZvb1pIQXoreUVGWmZv?=
 =?utf-8?B?WU93S1c1SXYzM3Y5bUkrTHJEQWlBMCtqQmVXUXQwRm9MTk85NTJ4NTFPUTBj?=
 =?utf-8?B?dDNoQk0rUDBHc3NISC8vamRQdkNLTWU1NXpSZ0FKY3Z6ZWJjTXMvdmFPTENF?=
 =?utf-8?B?bG93Q3krRmlwYThCVC9KQVdiVWQ1dm5MbFYxLzhhR25KTVJpOWRaTmtySHhm?=
 =?utf-8?B?Q3VMR2d1WEEwWTFsLy9ZYlJETzJyU1Btck9UZzlENEZCUUF1ZHJEYnBXRTNQ?=
 =?utf-8?B?c01GY3cyTnpnWFJmSG90N1JEczdTa1VpMVF6NmluZEFzVXByeU1JUm9Jcm1u?=
 =?utf-8?B?LzgxWGo0VldPSy9wcy9hekllNFhCOUtSakZoTVU5YjFsVTc3TEdWY09uTkdn?=
 =?utf-8?B?SHVuWkFNMUtnYnZDRkxxOEVGOWI0UWlGU0sySFFNSVhnRjVHMnN0L3VYdjFW?=
 =?utf-8?B?OFRGRjlRZFcxMXpyWUtiMVNHRjBYK0lJOG1XYXAyeVRiOUpaL0dTd3h0aUZl?=
 =?utf-8?Q?9yIC6LLPjBXAZOfjQSAdCRUuu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC69F26A20AAA54F86BEA02E783B0DCA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dd29d9-021a-43af-c48b-08de12826910
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 22:20:45.0651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mh2bOMDJz8Qtky5uKaaSalIbmowY8b9lEpJyrYGEPu3r4uUusDuIEKPFQ/Zm0rGM19AfKp36vlKjV1zZakTV1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTIzIGF0IDA3OjU5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBUaHUsIE9jdCAyMywgMjAyNSwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyNS0xMC0xNiBhdCAxNzozMiAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToN
Cj4gPiA+IEZvbGQgdGR4X3NlcHRfZHJvcF9wcml2YXRlX3NwdGUoKSBpbnRvIHRkeF9zZXB0X3Jl
bW92ZV9wcml2YXRlX3NwdGUoKSB0bw0KPiA+ID4gYXZvaWQgaGF2aW5nIHRvIGRpZmZlcm5hdGlh
dGUgYmV0d2VlbiAiemFwIiwgImRyb3AiLCBhbmQgInJlbW92ZSIsIGFuZCB0bw0KPiA+IAkJICBe
DQo+ID4gCQkgIGRpZmZlcmVudGlhdGUNCj4gPiANCj4gPiBOaXQ6IGl0J3MgYSB3ZWUgYml0IGNv
bmZ1c2luZyB0aGF0IHlvdSBtZW50aW9uZWQgInphcCIsIGJlY2F1c2UgYWZ0ZXIgdGhpcw0KPiA+
IHBhdGNoIHRkeF9zZXB0X3phcF9wcml2YXRlX3NwdGUoKSBpcyBzdGlsbCB0aGVyZS4gIEJ1dCBp
dCBtYXkgYmUgb25seSBtZQ0KPiA+IGZlZWxpbmcgdGhhdCB3YXkuDQo+IA0KPiBIbW0sIHllYWgs
IEkgYWdyZWUgdGhhdCdzIGEgY29uZnVzaW5nL21pc2xlYWRpbmcuICBIb3cgYWJvdXQgdGhpcz8N
Cj4gDQo+ICAgS1ZNOiBURFg6IEZvbGQgdGR4X3NlcHRfZHJvcF9wcml2YXRlX3NwdGUoKSBpbnRv
IHRkeF9zZXB0X3JlbW92ZV9wcml2YXRlX3NwdGUoKQ0KPiAgIA0KPiAgIEZvbGQgdGR4X3NlcHRf
ZHJvcF9wcml2YXRlX3NwdGUoKSBpbnRvIHRkeF9zZXB0X3JlbW92ZV9wcml2YXRlX3NwdGUoKSBh
cyBhDQo+ICAgc3RlcCB0b3dhcmRzIGhhdmluZyAicmVtb3ZlIiBiZSB0aGUgb25seSBhbmQgb25s
eSBmdW5jdGlvbiB0aGF0IGRlYWxzIHdpdGgNCj4gICByZW1vdmluZy96YXBwaW5nL2Ryb3BwaW5n
IGEgU1BURSwgZS5nLiB0byBhdm9pZCBoYXZpbmcgdG8gZGlmZmVyZW50aWF0ZQ0KPiAgIGJldHdl
ZW4gInphcCIsICJkcm9wIiwgYW5kICJyZW1vdmUiLiAgRWxpbWluYXRpbmcgdGhlICJkcm9wIiBo
ZWxwZXIgYWxzbw0KPiAgIGdldHMgcmlkIG9mIHdoYXQgaXMgZWZmZWN0aXZlbHkgZGVhZCBjb2Rl
IGR1ZSB0byByZWR1bmRhbnQgY2hlY2tzLCBlLmcuIG9uDQo+ICAgYW4gSEtJRCBiZWluZyBhc3Np
Z25lZC4NCj4gICANCj4gICBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCg0KWWVhaCBM
R1RNLiBUaGFua3MuDQo=

