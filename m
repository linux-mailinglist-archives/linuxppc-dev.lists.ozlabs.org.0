Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA53F912DF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 21:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SUnik321;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5SMR26wNz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 05:38:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SUnik321;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 22 Jun 2024 05:37:46 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5SLf34Mzz3cWD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 05:37:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718998668; x=1750534668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WDmfYXjxPdpK1b36JFy/gxX4wCI1nlGCbZQaQCKJ31g=;
  b=SUnik321QqmEYqvGdB3msJwHw5wfSjcZqMf8Bkrspa/pX9sOMJoqlt6z
   Llct4vOc2XhxH6DxFCpaCIuEbx1iPD30pHXxduSL5zHyG3LAoJTbFL3Is
   M0V665ts4c+PaAKbG4JTgmrC3Haagu9dN8BMQ+tNrgz/cgkwdGRLU4OUo
   SPR+/6yhANZ1drZiCWnrCCetomLOPfuRyFsKJ/tCvlr/acPHRi60Hgguv
   wiJkGq5TMMT0hfY3A4ZOz00bbcqXykm2Dl/A5uygB0lLxukDIGBwcdlo1
   VvuFmZLh7BrUKoVEtqb5GT2HA+74sIS3P3xeHbTMzXvw5fxIrpo193lfO
   Q==;
X-CSE-ConnectionGUID: iB+j/F+MRMSoE5Zly9W6LQ==
X-CSE-MsgGUID: XcURQrUnSW6HYjOHFeSJFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27448959"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="27448959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 12:36:38 -0700
X-CSE-ConnectionGUID: Fp9LMDIkRtmNOuIOQeDUXQ==
X-CSE-MsgGUID: uPDHLtS5T9KR08kaV1cDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="42593257"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 12:36:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 12:36:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 12:36:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 12:36:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 12:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZQWseDa8WvoE0FAwRPyI81a529Rb4gUt9OoDxrD2dvdGIotTEOmlxkOdZlbv04fWCtz29StRGgBWOQGk5/S6iuZ6s124tD/RgOsggzHIcGSJwkYkfC5IZltRWVC2MvDf6w/kLPuus/ShI6kVGh6weBZYfGLqZWj/Y9RRdv4P2FC2ef66Mo23hpF+DBA/t6hFpMsxH1XVfXG2dVxMwDOlGxp1khh+JkP/WwMa1Wz1KPOsJ/dWq9sW/ms/nBOD2P1aun/BFZXVaeLe0wQixfChuaigpVzuyvSNG2EGkV8LlphMX6SgWDzi2K/kt7+gEBzYQQEuWrCMsnq1qNs5KVLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDmfYXjxPdpK1b36JFy/gxX4wCI1nlGCbZQaQCKJ31g=;
 b=NhhFWIc5xCdSMKEkwk1u3rXjnsAKMRBj1D59yy8yUBG6FUT1S5Be2frr57vV88x1+gis5YNNXv99LIOtp6I7OqaXfIAWW8cf5YB2N7TQiYHhY9eBw/ucJ82wKnIJKMgorRWw4TAq6YYKJtF1HmChCBR6kLFXAfmkEGn+7QNaSnfEqxLVEQDG83LJ0VZnq3zvT62nuDF5gsBiFzpZW0cI0lgU66tltcP00hSYTWIecapbGPSJOGQmZ5Q39PoD1e9RIyPfJRX8GPfMvGm6cynUifqcI27dSLrBMfmsL+9A/+U4yHeCEUMgFnVAgpWJ2cnphKlu2ZzjJ4Yp4ROUXyiGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.40; Fri, 21 Jun
 2024 19:36:31 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 19:36:30 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-mm@kvack.org" <linux-mm@kvack.org>, "peterx@redhat.com"
	<peterx@redhat.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
Thread-Topic: [PATCH 6/7] mm/x86: Add missing pud helpers
Thread-Index: AQHaw+qENzALlsOIS0itRHIdMvvnfbHSnMqA
Date: Fri, 21 Jun 2024 19:36:30 +0000
Message-ID: <db95c7abea9cd252a791d15359a4d940d91524e3.camel@intel.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
	 <20240621142504.1940209-7-peterx@redhat.com>
	 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
In-Reply-To: <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MN0PR11MB6009:EE_
x-ms-office365-filtering-correlation-id: 0de9ef67-643c-4cac-1e41-08dc9229737e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?a3hyakxIdzB1Y1ZrQitDQ2V5YW41cmYvWWdBRE9SaUg1dDNWNnRVcUttSHRt?=
 =?utf-8?B?R3Q5R2RxYkp0VDUwUnU4L2RGczlXNUR4dThKMU1YbStCTysyeHBoQmwzTzFC?=
 =?utf-8?B?OTN1ajVZVnVFVmxwcXQxMmxxbnkzUEZ1b3RxWE9iUElpMmlQb1BwRkRBYWdK?=
 =?utf-8?B?eDZWY2NZZUVDbGEzaUVjQ3R3UU5ZZjIrTEdrWmpTTXNFZ1puckZtMVUxNjE2?=
 =?utf-8?B?ZFF2V0xTTzFZM3FhcWZ2azAwYlVodDh3U0ZSNCt3c2JmcXVrbnJJYjNzQnNR?=
 =?utf-8?B?d1k0TTNEMXpWMmFnU2lIV1BIUmxCNjQvZnZISTRTbzl6amtRZVZCc21aYk00?=
 =?utf-8?B?YzZYMWVnLzJOTm5OZ3loc2RGUTJURURnZ1VCYWNNdm9HRHlUKzA1ZnV1UU14?=
 =?utf-8?B?RXlhRzFCWkpVMGxEdEtFVXJjM3FIL3JDazczN1Y1VDVCaXBUYXlBTXpPNk1r?=
 =?utf-8?B?QUREMVB4WGFrOUtoZ0QyVnBLZkcxTmlZdFI4VUFSWGtaZnVZM2FHdGZkcFFa?=
 =?utf-8?B?UklseGRXbzJnT3pxTG02MDg2eHN1OWdCK2pqcHBOeXFGRGFRYVlVUEs3elpp?=
 =?utf-8?B?dzZ2bGpIaWRWTlZtcjJWYUVXclJqNW9uRmZKeDAxbHZaaVJ5amliYlRSbThm?=
 =?utf-8?B?VGRTQW1CMDYvYmIrN0FVaEpCZDF2OEV3ZDlzN2lhakQ1eHk5dGVlWFpmTEwr?=
 =?utf-8?B?eE50R0k0YnNNU3pHcWFnM2FMbDNYdlNtR2ZvaXo0TWNNd3NYYWthSE1LVmN4?=
 =?utf-8?B?ckVqVng0YTVFL09qZzZJVjRYM0VGdE4yb2FYZVZ2b3RTYVdSem8wYTVQQnk2?=
 =?utf-8?B?UnJuTExuRnNMV09Wb2lpblhyS1l6cGRWeTM5K0VtMjIyWTVuSFoxaFdrZ0o1?=
 =?utf-8?B?bjlXZjI5cDI0a1VlR3BSaXFDc0gvV3Rid2YrMUg4ZXFOa2tNV3VFME5LM1Vs?=
 =?utf-8?B?NW9UUjA1enROaVYxU21oYTJWc2hxRm1DUHd4YktVeTF0a3k0SSt6MDNROGZH?=
 =?utf-8?B?Y2JTRkQ2UCtHRFFmb2NEb1djNng3Vlh0ZUNEWkxLYXlqcE1LRFJLRUswZWtN?=
 =?utf-8?B?OFVDaFlVeW8wUTlaTHFJZmZXQ3FIbnVxVkFwcWFiRms0S29rYSswQ24xQ0Ri?=
 =?utf-8?B?Rm9udHVBY3NwRytuUlUrbVlYWmdBd1pZaHk0VUg0M2Q2em1DeDZGbFd0Uks5?=
 =?utf-8?B?YzcwSmc2d0dUeHhhN0VuRHVTU0ZIcVQ2WkhoVXFUOC82eGZCZUVsSGVJSHpF?=
 =?utf-8?B?cTBINGZNUUJiNStBME1VQjJTZzU5eEZ4STMzVEZNWDliSTYvRkhzSzU3bTZK?=
 =?utf-8?B?Q0x1Q1JpYnh5WllxVDNXYURyYmpVL3RJZXhXd3VaU3ZjYVRLS2JBVlJUWDJk?=
 =?utf-8?B?OUJ3WDJFNFFhZmNVK01wMk9XWTZJa3kyUGdDNTQ3Rk5HRjZsdWFqdlZoam5R?=
 =?utf-8?B?MTMxMkpoYXh3bXNCVmoyb1BXWDZUNVZ0eEpDUmY0TzMzVnFUbU9ZR1NEVklP?=
 =?utf-8?B?bkxQMkd3TEVpbFE4T1RIMlRmYTFzWGtFcEJZNWNkSFdPY2RlNWF3R1Zxb0Ry?=
 =?utf-8?B?VnhHSEFXaG5KNFJsblhMUE5KWUl4eEtVU0U4WXNKbHRROXNBa085TFNCSUhS?=
 =?utf-8?B?NUlha1U1MmJGKzUxdGV5Q01vdjdPQmJLTXdMc3FJanJQREZiOC81SEhWR3ZG?=
 =?utf-8?B?ZE83K3NTUHE5RVpmODYwM3Y3eGh5Z0x0VlBhVXVqaEhuWThkVHJPOW44bTVp?=
 =?utf-8?B?eVRYNzVOS0xYU2swSWVLZW5teXJrOTBxMFZkRkhKQlBuZ3NJcFEvd1RTeU9Q?=
 =?utf-8?Q?sVKvynGdtGMaBfxF09BG79bgzAvvxecgMwUIg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXAvRmtOeVVKSzF4VEl4dXBHRVhCRUxPSkFSR0JSRXl3Y3F6QURDK3QxOFZl?=
 =?utf-8?B?aXZ5R1BwSzY2TGQyMmZqdDFJTDNyNkhXZzBYKzVWSStkRXZkUk13ZG1lT1I4?=
 =?utf-8?B?cVlMSTU0NUNGaWhETk1iUDBtMitUenlDS0ZMNE1kNHFUVTVpQmE0MmRVZG5O?=
 =?utf-8?B?UWhlcFdiWjdtMVdEbUoyS0lUT3hZOEI4QXkrbHBONWFMYXdFWC93S0lEdlIv?=
 =?utf-8?B?SWtUNndXNmtmcm9NdHQvdU5XTHBabWhPRkxaRGRJUGduYnZyU29OUkwwK3h3?=
 =?utf-8?B?VUExTmZPUDBqaWZTdkZUUGFmN1VBS0R2c3Bldjcxa082dlcrN0w4RHNjL2Yr?=
 =?utf-8?B?UW03amdkOFl0YVA2SXlDRHp3QXBKZzkrbnpZZlVOeGs4UFRDaHBuZDlvcDhP?=
 =?utf-8?B?bEUxOUE5Sm5pQjlrWmpxL3hXOHYzblNBaStKNlh2SkxIQVI4M2kzUEhwNitH?=
 =?utf-8?B?SkxQU2hOek0wOW8zZkJzKzE2R0NqOGkxV2FURnNnUldhVnMyaHBTeTU1VHdz?=
 =?utf-8?B?RForRnpHZ3BJVWlqWVUwdTluamxqSEpLRVc0RDZTa0NTaHFRbDEybjJlUVRo?=
 =?utf-8?B?Y2VJV1NwL1JCNllNOUFiVjlhUzk3M3NBdld0SmpsYWlLYkpFWFJkM3YxR1My?=
 =?utf-8?B?RW9xMzFlR0FEMVRjYVBWS1F2dW5RNmxvVUJ0aHBsVmJ5a1V6ckI2SDNCdnRt?=
 =?utf-8?B?bWJ4RTZVRHJBTW95RTdjUi8zWEdCd0d4amc0anoxa09hUVAzRWxOSmFDSkhB?=
 =?utf-8?B?TVdwK0xQUVdOZVBETFF1V1NaZGRZOUtINDdvVTIwVHpDQUhRQVRhRVIzaDNO?=
 =?utf-8?B?bjVsVzBjOGZUYnVKU2kvM1RrTFRNRTJrNTAvbzJUUlVZVlkxUFUwR01JNjJ1?=
 =?utf-8?B?d2pXcWhPMTR0Tzg3SUV6Q0gwNWpDK1RLVVBRd3JkWk5FZnZMeGNwSzdUeGFI?=
 =?utf-8?B?ckpSL21ZQ3haVVdnVzRWTTdRWmJpUndwaEpmVStiZ2Z0Wjh3WmxMZkhMTE1C?=
 =?utf-8?B?dTZKMDJGdS9XbVQxdkVRWFB2aEdJYnB1K2FTSFFmcThIaXlYbFovQnRrcERl?=
 =?utf-8?B?dEhyNG1Fa01MS3h0Mk9BN00xeU1PRG5RM3I5enBpUHNObFJBOFlkSmFPUW9C?=
 =?utf-8?B?czkrUXBHUFZseUlqSDRhcnJPdzkzNngwcDNXVVB3UWYxWlN3Z2FOY04rYnJh?=
 =?utf-8?B?bDJtcTUzSlltK3ZudDQvbjdZVldHalZlZzdrSllHenpoeHZ3NnlVZFZrVjNp?=
 =?utf-8?B?dFJSQ3M2ZVZqVVNxZlRiRmt0TWNrS2l2YmRDdW5icEYzSHVHR0g4Yi8wR1ZX?=
 =?utf-8?B?UmJDNTc1Q3FxcVRSMHF6QmpOSzZMUTJ2OXcwODZnWkZETy9iVFg5VjlYZzdr?=
 =?utf-8?B?amoyaWtnV1o4VHNtb3d5STh4bSs3WVBsNmh2NGdGcnhObmRDWnV1NUxiSis3?=
 =?utf-8?B?Z2RqalBmVUhma0ZwTTdPZDI1NFZHenN1cjJhV21BdlZEeHBlVUp4UFNZL0Fm?=
 =?utf-8?B?dnhyRnlvWkszM2dYT0JuUU5uTlJiMW9xWEpUNUZHaXlmdmZHZzd5c3BQbVIr?=
 =?utf-8?B?b0h2cFFDZUlwM242c2lhUG9vYWl4cWgxL2hXYU5mSjR3RE56c1ZUcTZpWHAx?=
 =?utf-8?B?djBPeHBHQmF2ci9DRnhpY2FMN0hqaGhUMlFSbkNOSTNhVmYrMndudTFyLy85?=
 =?utf-8?B?RzVuUlROd0lwd2VzN0thcTVUd3VMRHlHbGFXZWJNSUwwdGlPTmtYZXR4WHU2?=
 =?utf-8?B?bHc2RTJPOWkva3IyTnRpSkZ1ZmpDZmJ6b2J5L3JJakQxUTEyYzZwZ1ZYZm5v?=
 =?utf-8?B?TzBmTngyQVR1RjczUDM1ekJvRlZySEpNdjl2c2VoS3JQcHNXSGpZWmtlaWUw?=
 =?utf-8?B?eEwxeXgyTXVaeTB3elNBZzJyZ282d0NHWk8xZGE2Qk5zYXBpemY3QlpOaW1B?=
 =?utf-8?B?ejZmdkV0K0drSHo1R2prMDRNckp3dDNHSDJPR0dUTlI0L05wVExCQTZXSWVm?=
 =?utf-8?B?QWgyTDNkWHZNbGtoSmlxQUZGVFdlQ0lORytkRmtpQXR1dHM5TGhPellJMWlW?=
 =?utf-8?B?ZGlHbDdWdU02OC9aeENGUjdGS3JtR0RySU91Q0tzU2lqcDA5RFdvVHM1SzRn?=
 =?utf-8?B?Vm0wcTdkRlRpNXZGNnBqQ3E2NTRqaGY2UXg1QlAyWGVHeHpHQkVFdUxKMEpT?=
 =?utf-8?Q?oSv2+GrAfpBrVlxBBlwvZM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF470C8D28E809489AC20AA648EAA397@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de9ef67-643c-4cac-1e41-08dc9229737e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 19:36:30.8375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U1diBXhatS1nlsbyyAFZ0mhO/Bhm5LPskjr7B2+jVa41AOFUlmFurPXgTpry5/2YlB/DMWBY4GgxZV1+m+utPLt7l+R9Jdi5t4v2o1MzvWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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
Cc: "Huang, Ying" <ying.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>, "Jiang, Dave" <dave.jiang@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "riel@surriel.com" <riel@surriel.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hughd@google.com" <hughd@google.com>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "willy@infradead.org" <willy@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "kirill@shutemov.name" <kirill@shutemov.name>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "vbabka@suse.cz" <vbabka@suse.cz>, "osalvador@suse.de" <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDI0LTA2LTIxIGF0IDA3OjUxIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
DQo+IEJ1dCwgc3RpbGwsIHdoYXQgaWYgeW91IHRha2UgYSBEaXJ0eT0xLFdyaXRlPTEgcHVkIGFu
ZCBwdWRfbW9kaWZ5KCkgaXQNCj4gdG8gbWFrZSBpdCBEaXJ0eT0xLFdyaXRlPTA/wqAgV2hhdCBw
cmV2ZW50cyB0aGF0IGZyb20gYmVpbmcNCj4gbWlzaW50ZXJwcmV0ZWQgYnkgdGhlIGhhcmR3YXJl
IGFzIGJlaW5nIGEgdmFsaWQgMUcgc2hhZG93IHN0YWNrIG1hcHBpbmc/DQoNCkhtbSwgaXQgbG9v
a3MgbGlrZSB3ZSBjb3VsZCB1c2UgYW4gYXJjaF9jaGVja196YXBwZWRfcHVkKCkgdGhhdCBkb2Vz
IGEgd2FybmluZw0KbGlrZSBhcmNoX2NoZWNrX3phcHBlZF9wdGUvcG1kKCkgdG9vLiBOb3QgdGhh
dCB3ZSBoYWQgbm8gdXNlIGZvciBvbmUgYmVmb3JlDQp0aGlzLg0K
