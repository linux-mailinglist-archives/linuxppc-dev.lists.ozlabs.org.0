Return-Path: <linuxppc-dev+bounces-13078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F80BF41F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 02:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crCR019fPz3069;
	Tue, 21 Oct 2025 11:12:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761005532;
	cv=pass; b=N1JbKauWdVbKshgdC2x4IrkwAVvFki47wEyPg8n/H/VcsyjT/0DwcrOi5KEpEZZ+AzJNbBV1kxzK6rXGVs1gp2+mec8DU5JGDsH9EOrMvE1ThxpzT7ErlQryHxyEXfWZu/R0vFDdMbWVzYr/67BqAYauXY5hCxNIfe1Bd7TAuCfW/XnXMs/zDNbK3MPa+wWsG2bVsztSlvTv+f1/y+OcKGjz0NAvUZjjMXyooLWb+ECvW6OlYK2jzcge5ILQXyHiLXfwuQXG8YQJGX8fxINF5YvD856CVFInlpTaoVG1PH10Jzh3y5c/nEl2MqHh2ufJAYRzcTn+r+xzZKqKNscN+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761005532; c=relaxed/relaxed;
	bh=qm6Q4boZVg+lnYBdkS66VV3rQG+Xi9oEr4Vmih8DRLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oZDVNjwHW69ZTSzFSbYv7avthK7vXZjtH5kNhD5lgMUDefEbBRiMpJu1zKSjHSneQGihBTI8UsN1EP6kd1MvCGe0iisHPFbEp1tdjADrXO7qHs3LCbCX3c5gELH5QShXHCUCdx0yq6OR6CUa4PlYzlpCCeEGSkBEP0wVbjee0nEsIxpsTLyWYE6ATMejR1gWNK1cNigKhAi4xE+Elkac2jGFkzmOHaW/WQxifiTMwBO8U5HjkgXeGPqHaWJNcnMMjRBNZ+3GPz+71/BP7dllVLGlJXSkcPtNg5LdoVwJ6RYzcxq6V2o6Tl+nWTZH/h/KVU3QPTkCW7Fhi68z9e6mmg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gosPIXI8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gosPIXI8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crCQy751Qz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 11:12:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761005531; x=1792541531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qm6Q4boZVg+lnYBdkS66VV3rQG+Xi9oEr4Vmih8DRLg=;
  b=gosPIXI8iKm7zvOma9p3UwiCUIOn8+UU1s9BbjUVn1baBiJ10GN2sowo
   QUgzILNo3ep8+ZwL7vFZ4gruqUeRueGO+GyxnUJ+qzLOf6ONrDJG/FKWL
   iEpEXdHY+gsTH1Rqm/XGOqmzgr9p+SfIA/8hUTWbeV0R+bnNqqwUNmzdu
   Qn8Xc7x0zoJxIIAd1rLpoZSSoSaG9RX9SSRcOncdggcPT5Y8/AX2R1RJk
   /mfRgWo8fC3C9x+JoOIk/ZkDZ++mEO3/3RjZPV5TDXsrfIF7+0tMJhNbr
   XJScaUMxVU3XL0/s3j95snfrF8obGNBEnT876Zt5MaTg77KjOKYYo+PaK
   g==;
X-CSE-ConnectionGUID: 3PE1fkhXR/KfWM29eLBDfA==
X-CSE-MsgGUID: zHt4d/TkTXWLxGvZVUMtmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50701077"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="50701077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:12:09 -0700
X-CSE-ConnectionGUID: U9jHE/pQSUSeOBk5BqWKzQ==
X-CSE-MsgGUID: +nf7vWoFTni0I/8jbD8p/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187482247"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:12:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:12:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:12:08 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1ORhB4rFk/Ci6AVrGeqZf+byOFhMIiNH27d6TOpVy8dOeDeObHDHdZ1QifFNEAccpTl1QFKM9lT7sk0fMkqvZZYXCslm+7CiMKtskRjXmSe2DKL5ShPVs93JoxumRPj5mMQ3GKWjsGUB8ubPC7NBYrAxWBP4R+H7GkQ2JFb3nYauoJ7liXetdsNIrvZHIKW8QdwKtsvH4P2YUOhtG4VWnkhge621rcdCuQL5zzk8mEbg8yE/7X8u6FGMEgwEFJ6qaaCg7r/i2v8g39+QgyY60d1hjzkY/nJSP1pDPRwnQzByqtRqEE5ViSZpPeiY1F5FTj4DLTR8a6ndY0KKBdCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm6Q4boZVg+lnYBdkS66VV3rQG+Xi9oEr4Vmih8DRLg=;
 b=ia+sVCuSbjN978KydeGxTsFFnRHDaRkHuwTOKqlYlTBGZCBQD44xDPC9QydCzQ/+RJq85SYydLIzXI4CAfekr8NG7YmH/Z56dcRMdiwxQx58IFNyZQPIHYIWHYVybmPVcHKo87V2/N6gDzzCCuX+vdNy/rUP3C5KiJr1CZSZ8mPYr8/Jn6/X4Xi4hfqH26MOcpQAz8nVceU/gspizVL+4lzZxMUt5PXPw7lPO/DJXug0yKquTmoF536aaVMKr1cpeztENpEPc62G2/8IHiGflw9IgLVgkZH6rUgC3zermJ78hs5WW4i23o16bhpNXuKC9qDEd/CsB/kk+mueXlzmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:12:04 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:12:04 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan
 Y" <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira"
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"Annapurve, Vishal" <vannapurve@google.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
Thread-Topic: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
Thread-Index: AQHcPv2uU4IsKDWNoEGs6xzwZDj1ULTLwKyA
Date: Tue, 21 Oct 2025 00:12:04 +0000
Message-ID: <3a9125b9721aa00d247ee88c7134806d1664e5df.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-22-seanjc@google.com>
In-Reply-To: <20251017003244.186495-22-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH7PR11MB7607:EE_
x-ms-office365-filtering-correlation-id: cde86219-221a-48d1-ca92-08de103676d8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZGNORnVjZllLMWljYzNBdUpnZkwwYXhIaFN2ZnplZzd0SEJiWjJRMmd5eVNW?=
 =?utf-8?B?QWs4UVZPWkVNdDg0MThWd2xDWkdDcXoySzJ3TDFreHF1clBMMTJlNjNqRlpK?=
 =?utf-8?B?TmhpUmd5L3hOUTRwTHlkMGdjNVpOWjFTbWs0dThOWkhQSGhPUGJiSVNOZ1pP?=
 =?utf-8?B?ajdvazJmbFEwMzFQKzBHYjU2SHcyRWtwRGJjd1B2M3p5NGZyRnJYOUNuQzlX?=
 =?utf-8?B?aUpaaGduaEo1bWlpT0xlVW1Jc0lhZDVVMEkyS3pxeU5WUVNWbGlEMlNZUHgx?=
 =?utf-8?B?SGd6TzNiWEEvYUkxZDI1YThSaVNDb0xwdmRCN0VITnI3eENoaHNMcmFGRU0y?=
 =?utf-8?B?S3ZpQm1WNG1YUEF6MTZGY3RjUXhwZ3cwby9rNmRqdVZ5OGVjNloyNXlKb0hL?=
 =?utf-8?B?N2kxQjZFZVVFb1FaVTlPejAwaWszRzhqNzVSTnFQNy9jZ2dKZWV0YldFNXJ0?=
 =?utf-8?B?TDdJVmFrcjZkRENsMWpVL0hLaVJwTk9rcmFCRXM2S1BHclV6eGFnZ0VtS28r?=
 =?utf-8?B?Zis1NVZxRUFJcTNJbU55alBsRU9HVmxaRFZKRWd6YVpldWlWOEk3bFNScElX?=
 =?utf-8?B?VEpsYlVKcFBuejZ6STBWcnZUakNVdk5QRytkOEIveUhlR1ZCREoyMDV5eUhl?=
 =?utf-8?B?VzhqR0E4azZuSENTNmtKUDg4TS9UcGdLMXRxVDhqSVd1UUxSV0d0cVBwMi9j?=
 =?utf-8?B?WnJWSVU2YUJqTWxzNFQvT0JtamdIM2ZXcE10OElVUmpVelNmTUp5WSsza0JI?=
 =?utf-8?B?THB3MHJuZFhFZVZTbkVmRHZwcUpEajc3MXRtcTdnd3gydmJ5L0lSSE9CQ0VB?=
 =?utf-8?B?QU45cVVGdjlJMUxHWGZvNFZ1elkyQmI4a3g0alJQNzFCdDVuMk5YNFVvaGFq?=
 =?utf-8?B?bnlCWWRBdkxVbTZac1cwK3VDQ0FSN0s1YXMxaUVuU3dCRGdmSlcrdU1mVTlu?=
 =?utf-8?B?ZFpvNExJOWJjR0o1S1Ztc1RueXhBRzhsSXNPMzVRdjZKM2tTT1NlSWFBT0FK?=
 =?utf-8?B?cnhyTDFRaGViaDVBUmZGSWUvaW54OStIcm96UktMR3ZZM1ljSWprNnFrcHVv?=
 =?utf-8?B?QTVScnpZVmdLOEJReUdkNml3Z2FMZlhlQUNabkVnN3BtTW82ZEpZTDZjZGYz?=
 =?utf-8?B?aVIrcXZXUWVxS2hXZGFqT1k0MUFKa1pzcGpJNzZyQmRDN1ZjbjB0MHBTdVQx?=
 =?utf-8?B?ZEdXb0xvdDB0YkNJZE9mS2VPZVBlNU9rMEM4NVBHL0lEN0Q0bDRmRWovN20z?=
 =?utf-8?B?bm5FSURyU2FXakZqZ3VtcWNuM1VtR3BCV0hlL1FvRElzQjQvaHRUMFJTTElC?=
 =?utf-8?B?dUkrYVFlMEtIOXIzUkcwOUtzZTM2dGw2WkdxL0xFSjBHOTJiNkorTitlTHhY?=
 =?utf-8?B?amZsckFmaHpDL29QelBaZGNkNVA2d1VudjBUUzdDY0JZbis4VW5CUmlqMC9W?=
 =?utf-8?B?UGE5dlAxWTVONzBoWU53Q0F2NVVmT1hyUGdwalBmblJCK0ZzWmtEVTBmc1d4?=
 =?utf-8?B?d1QyNmFkTzJrMWlmbnJnV0lQWURmVGo3VGNvOGhHUEVBOXRudURRdXVXdmJU?=
 =?utf-8?B?ZzBpMmFJUWg4Q0JsSUJ5K1FtVS82YmZHRUFIc3VkejBidUlHeXFCM25SaFpm?=
 =?utf-8?B?UUkyNjUwUStPVEFUNVE2RUJJTTAwV1Azdzl3NGo3TjdqaDdYdkwvQ0FNVklw?=
 =?utf-8?B?UngycExwN2VLMVl3Q1J6WGI1am0zbFB6eGFCSnJPREcxWkVPekF0ZXFkQWlN?=
 =?utf-8?B?dVJFM2UxZ3doVGd4L1RwZTg2SllTMDNKd2pzUVpDODJ6SGNWQkN3WHE3Zzhp?=
 =?utf-8?B?eGh2S20vTHpRcUFHU25ZMEZUQkVZQ2tJb3B6Q3I4eHZvbzJNVzdIQ1RZTFp0?=
 =?utf-8?B?ajErNUQ4amhnc01LSlBMK0Q3TC9CZHc4ejRyMmVGekppRFo4UnY4YUllcFZw?=
 =?utf-8?B?UEFpVXNDVEpXUmVKYzhsWWpDZTNMQXdjOVBFU1FoQ1RWMGYxZysyaEo3ODFz?=
 =?utf-8?B?T3hiYWRGdjJPTFBiSUV4eWNJU2FUbnhVQTZlRUxSS0VpNGFPWDJZLzZLcmZP?=
 =?utf-8?B?THpST1Y2R3JNdWtmVHZzeEZuUTlGdHdBR091QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWJIc05UYjNMd1QzUDd3SEN2aFhoeHlKOEVZL0ZpbHRRUUlvQmhYZm90c2kw?=
 =?utf-8?B?SDIzbTZjd2NaUStsVG56Z2F4dW1xUFRrTjJFUWdMZzE0c3hwbk9TRDlnMW9h?=
 =?utf-8?B?N2hqcXd5MG1tMFR3dUJWU1lNcGNVZEJOTlo5c3lVQ2x6VU9pT3ZnQzN6ZVVT?=
 =?utf-8?B?WkxWT1Ztd2hVU1pIWHNKWGVUaWxYMzZ1eEJLcjFOdm1BOFI4TUdvZklYYVF1?=
 =?utf-8?B?S3NJT3dpR2hFclRxUklWMXk4alo3N202MlRFRmlsc1AzdjM0S0paNHMwZmcv?=
 =?utf-8?B?TkhHWG9ZdGpyNS9tZ21HTmxwK1hDcmJ3U3JKejdNdkd3TGVGd29OamdsSUFE?=
 =?utf-8?B?THBzZkJ6UDRQM1B6MS9HVjZMRXFYSG8vcm5lNTRRQWdNL3RvT1NqZWNNVSsw?=
 =?utf-8?B?eUtMQkRFcGlIaHI5Y1Fwb3h1Nzd0Z3QycmdpREYzOWFxOW5JMDJVeE1FcXcy?=
 =?utf-8?B?b0UxSkFOcm1vSlZOQ1Z3ZW83Q1VZdkxZL2RDSFQ0SE1xYnpaRUFoaTZRaEVO?=
 =?utf-8?B?aGVWY1B0NnNzbmJFNXJmcHp6QWhidFN3V0ZwYS9uRURzS2FPN0hVWGlQNk5J?=
 =?utf-8?B?Um41RFhZUGFHdnBTOFdtSDIveS9RNFpxS2lreXhKSFFuZ1k5eUdia25VV0do?=
 =?utf-8?B?c3Z6QmtuQTF6ODE5c01oV0hjUUV3bzRGRXJzaWFhUElGTzE1c25vZnRTVXE0?=
 =?utf-8?B?SXl6L0J0MkN0UFQyT0JmWlViK25WTHhjV0RhUDZ5WGpWL2FHRU5ieUh0VzBL?=
 =?utf-8?B?b2J1TWU1YVJnRzhkb21sRTdoTEM5RTVhQmo0R1FsYUhkSFQvS1V6eHNDS0pM?=
 =?utf-8?B?QW51cW12b0s2ckdLWmhEK2g4RGpwWHNWVHV4Q1pyUW1mQk9aUUQvNkJSZ04r?=
 =?utf-8?B?eW1LR29OR2I3ckcxNGhocmdpTldONVZxcHBFb2wvNFVJbjVpMDdrMkJXZVpU?=
 =?utf-8?B?YjBwd1FBOEEzOTJJRlU5UHVGRXMzY2JOcTZ0T0ZLczBlRVJaRTVmcUxoeDZw?=
 =?utf-8?B?cE0vTm1PeElRaW1rQkxXMHVNMVJhVXdmM2pyN2VXRVV3ZXdUOGlCcjhkUkdB?=
 =?utf-8?B?ZDF3Zm9xVnd0dkN6elgrYml0QkRnUm9oMlZtTnZMS21hMzdBSXRFK1F1aXR0?=
 =?utf-8?B?MzRFcjVjMlVsSXlmNHR1R3pHcGxMRnkvQ0NpUm9aMm9sNy8wSWRoWnhhZ3JV?=
 =?utf-8?B?WVF5RkJZYW02RVRyc2xOWmorS3VEeG82d2ZjUDVwWXB3TFZ6clVjTUhjdUNV?=
 =?utf-8?B?eGR2b2tKK0xhaFZOb1FRc29uM1ZuRUtjN3hUUVpON0RKenQ3cmZDN1hSQm1S?=
 =?utf-8?B?aURnWlNkc1NqNm5tcVJqL3VyNHdENVZJWW5xNmdyN3BGYm9ZaG1rYnNzYmJu?=
 =?utf-8?B?dE12dkVwL3JyNkF6OUR1Yy9QZ2FaSTBmWnZIeWdZd0hhcFB2Y3ZQeUlmbTM1?=
 =?utf-8?B?N0JUbzhMaWNmOEpoMjJhVUg2bUh3UTJjT1V6bUdDUUg3NWJwU3Rxd0lGWGJz?=
 =?utf-8?B?bDE5TkpTUGpseW5ydEk2c1JZaHFQaEVkdFExdmhWdjVObVhkTnY3VDV1VjJ0?=
 =?utf-8?B?aCt5QkEvbUtSdjNDNkVkUGhzM2dGWWsrU2VqTHE4MlZqdkU4M0RSR3lHQ1ha?=
 =?utf-8?B?RmJCMExPdW5KVkhTV2NRNW55TmY0bitHbEhpYVEwMmFTNUxiVW8vcWJpc0NL?=
 =?utf-8?B?MHJZTDhqNlFSOFdLQW9qNHJ5WXgralp6WVR0TGxtSmpKSFhVc1Q5NnVNM3Ri?=
 =?utf-8?B?dWhGM3RKQTBnNDFWY3B5Um0rM3dUUWg1bWNvaEh6Tm0yN3IvNDJFa0dLdUFN?=
 =?utf-8?B?QU9yeHBsSE9LcFpINzJyYzdGUUgxZmJvTlhXNmpZV0xZQ0FobnNxYTRhVW5F?=
 =?utf-8?B?aDZqOXFvSU9BS1o2N1dBekg5MlZ6anlsOERzbXEvWVNYeGZBU3pkS2M5blBQ?=
 =?utf-8?B?TFVHeHhqbTRqTEpRaWZKVnp3eDZJS2hXRTBqZEZ6clJXNEE0bTRkTHI5VzVL?=
 =?utf-8?B?VEZwZ2w2bXpmbTk5YUVjVExVSnllSDJiZFh6bURQVmlleG1FTEUrVWxkbWVy?=
 =?utf-8?B?eWg5NXVGNUtPK2gyTk5GWUpScnlKWVIxeVpNWitPdk9tLzR0SVVUN2JJZit5?=
 =?utf-8?B?cWlZZkEzNXF5dWdlUXZNUDFMd1AzUHJKdkpYQlJKUlg2V0IvaklWMG5BUVlm?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73CC6B973EEE0F469227D8BCD516D8F6@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde86219-221a-48d1-ca92-08de103676d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 00:12:04.0971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oe37kzJ8/3HmLIrZwoJTakYE0TlzXqIuXIzmXSPt9aZqeQgS9dpgtk3OS0IbQyCjt98mJFLuu28Xkxbqi2kFPJKmXg62VHTJG6fW7TNPvV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBZGQgYSBoZWxwZXIgdG8gY29weSBhIGt2bV90ZHhfY21kIHN0cnVjdHVyZSBmcm9t
IHVzZXJzcGFjZSBhbmQgdmVyaWZ5DQo+IHRoYXQgbXVzdC1iZS16ZXJvIGZpZWxkcyBhcmUgaW5k
ZWVkIHplcm8uDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KPiAt
LS0NCg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVs
LmNvbT4NCg==

