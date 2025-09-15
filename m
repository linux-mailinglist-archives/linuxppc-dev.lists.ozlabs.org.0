Return-Path: <linuxppc-dev+bounces-12234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D35B57FF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:08:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQT1t6TMMz3dkm;
	Tue, 16 Sep 2025 01:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757948914;
	cv=fail; b=fCbYymf+URnfn+G21va597DkVXxdnJngZ117Lgvsj/eo21NuBz3F9PG+UCmEyAEMo21hd1BKPC4YaJcOYfOJS4l8IxFUYa6Jd7YK8pvdDLbgiH2/1+D9J6Mt8OehsvtOWALbe3EnoH73gVp2voBZ0xXeACW7EVLCe/NpMI5SA+nPyoowh3PbzTGny0ZLubRwhlXHSjfQx8gB6z0U9fuUr7jJKPYylg22M7l59PJpNNl/Xa3lOnS5ULdhlk41rdGU39uSrODPv1/Oj9rGpeb25hSfa1gbVSj9A0jpGj+3hpnaIk0+juj02K5Ek412AE5C1OJcx2OhFh7mMITURzzsmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757948914; c=relaxed/relaxed;
	bh=qZ9v9t/fiAMnuEzWIZbTRLip8yZIWc038rtrV0XPeTk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TtfZ3SzOUd3TTE+qRz7/fMhzH/Dr4y6899zMKogL98WBFH8Ib8kHMEjphXL0D/AtT9cL81kaMXBxk2EG+PCTYuzwErseSETtqCK2RPAtDJsPaM2sS+b6nfmNdmRFWm4KK7tzy6sDnKcCN7PHy6XyzMxrsYzKRheDMPrY3stt9d8CV79iG9BXsAZl/pPV1I1aZ4+3Wsm4l+6xgrKT23FcG57gnfm3X/jXX0IlClVVeGteElWNm31E8FrILCeAjcvwFGqyTJaQthlEgr82JTfJYa85xh0AdXsw+J+sPTfnfqbZAeGedXAsdTIgnKHZmzuoHG3zhTnjVezGgFHyRaFf7g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl0z2czk; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl0z2czk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQT1s70pnz3dSW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:08:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948914; x=1789484914;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t9VYVmHrPFxT0myMzAeZJoxR+axwKCGNhLWwoHFfWjM=;
  b=Tl0z2czkS8NQvNDQkfwIKJ4bEZRwAp7sD0kVmuHSpqzhPVh15J8dTdLo
   ricJtfwrLAOXH5cbU6fVMK4V9QVSqx2HLiBPqqDbfA3Spkf+Hb+DS6jZ2
   eK8/QAAS4kSKqIQ6L0+D8dC/l2aQf64InayFQoKbbcqR5lWOpt6BWfylR
   JeWTfWXv/Yq/IAAc1HPn0lxbQQHXbO2glBvSBXVQ1+zjdgGr2IllXsXYg
   4CuaWAGJMTXjCW9CY/xYGM/nUZlaQ9OzlnE6ox4P/CbVx/7p0vtyQB3sj
   Z/ODBRpZ7iXO/qYywJNgNIe0+nuNqWW6vV+eL32Wy7VCub0H3qHx956YH
   w==;
X-CSE-ConnectionGUID: q7qdi6U9Ts+nruaemVZSnA==
X-CSE-MsgGUID: BoHJ9npRQhKHGeLVuzZOQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85642795"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="85642795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:31 -0700
X-CSE-ConnectionGUID: Mpi8C6IjTwCSRKCuvw8f9g==
X-CSE-MsgGUID: X1L6DwOsQ+KLWheFmCO41A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="211838729"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:08:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GseXsf9WrNid4DhLDM9M2OuBxu1OyUWRRUTMFyLu8P0x+ZGEbJgAg/yLd1g3/W+OxZ69OJI/6/Ue5fhqyOMLIg0m88+t+ViuXtOdzLPN0ujxukLJuK5ojf2Gg3RJfK8Wnl4qPhKQ2Fk6NK7xtSg6mqz2oG7Nk/zw0AO9kEFM4UsNw2P7Iam8bClKqXrkDHJV3358eGA4FPfSzpoqgeARcaiYUvQOPSLap99No/hRHHBF8NU9wFr9C46TLSK8xNgekJClbxLBRFVEK1/cyKt8EfIpyx3sD5jSjOpScoAFKhmczSxuCM/EdfJex2btygEg/3B1VA8/kKDEFo28vBlZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ9v9t/fiAMnuEzWIZbTRLip8yZIWc038rtrV0XPeTk=;
 b=PzO6CdXU3ehwavx2dp9BcjCcrG6uq3XGpKKEWE9575QWps+KA9Kf57wr5z5jEg04N6ZikdKBv+eL12eneT0t86pu4KS2cw9tDYHtMRDg/n1MhdO+MdL8xhpqSp+RZCKB8hsd3e3R6ZLAnKkJA/bwccDvhFchZJRdsKdWgv+/WTFZfKVKIJG+Y4O9jTD9BOw9USYF1OSCWwUHI4iUKQPXZSGPp5M7+npvzfbTWiR2AFA7YSdI+4CMCjg/T+2gHQ/Wo/x9aRzHQjuLzcd6LJqsJ+6xoafFt9jfwOR6GMqAl78VmfoMD7qU1gDihEuqriqV+7rydtYUibJU/LKH9/tf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 15:08:27 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:08:27 +0000
Message-ID: <3a294b79-165e-4922-b4fc-8d85d65c8004@intel.com>
Date: Mon, 15 Sep 2025 18:08:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/6] tools/perf: Allocate and setup aux buffer queue to
 help co-relate with other events across CPU's
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-5-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250915072754.99850-5-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 094161f0-dcd2-4ff8-58f3-08ddf469b907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUxSQjlOamtSR0dZY1JMdERLcXM5TFJqU3VrU2xmMnFJejZnNGFkNHlSZ0NY?=
 =?utf-8?B?QlNDc2hTN1crd3YxNWY5L29mem0zRVloa2QxcUlyMTJYL2l4QVJLZUZuRkNV?=
 =?utf-8?B?RjFMcWp3Wkt3UWZSWEtaMTlKNTFvMjMzYUk4b29pVjF4dzhFWGVpb0tPbVFQ?=
 =?utf-8?B?akNHYndLcm51ZEo2eEg1RjlhbXRteWw3NFN3ZTRHZ3l2RlliUDN0QzhJVHN2?=
 =?utf-8?B?YkFrNld4WTUyOUNhbk05OXpSTjFlZmh4NzdzTUlKbmo0Wldab2ExcVdLL1Qx?=
 =?utf-8?B?SEQ3b3h3dzBjRWpEVlN5eko1NHNKaVJkajBQaFdsRnhyc25xM2VwdTE0S0t0?=
 =?utf-8?B?YVZHZUgzVUpUVXBCS2xsTGNmK1NvNE5Zd0NCVkVQU1NwUmNMZHVvd3ZZb2Z3?=
 =?utf-8?B?QmZvQzFQSDdQTHdLZThuWiszcXI5d2JMclY3cWYrZUdwOTRtTGZIbzhidTlO?=
 =?utf-8?B?eFJ2eE9RS2IzeHMvOG0yZENpZ1A0ZmFveUdXYUNXaFpIUmcvK3g3MHRaeUda?=
 =?utf-8?B?QXN5SFhGU2E5Q1hvS1p4bnA3MWU3YndRRSsrZC9qbHhyYmdiQW1GNTN0b3pk?=
 =?utf-8?B?OGEzUmhUclNEcG1oLzQzVEFKSGEwb2F2enRmOGdoc2FPMGl6UEpyaDhodmEz?=
 =?utf-8?B?OHp1TU9hY2VneXJSdUFWdGR2SUw1K2Q4a1gxM2FGVzZZVzBBS1VZYTZLOUgx?=
 =?utf-8?B?UUZXSnRvSnVLR0xIRmdtbjdmYWF5eExFM01YYUgwcWdYUFJhbU9CdFRpMnVJ?=
 =?utf-8?B?MWN4bkdEcVFDNjhyRTYyNitIeWs5TXNINWt5U1lWWmxIOU8wRm8vNWFDeWt6?=
 =?utf-8?B?S0IrM0tvdXY1NWNhVjlINWVCd3d1YmJCY29PV2lrU2FtY3BxWUlzK0FHSk0v?=
 =?utf-8?B?a1hDM0V3VXdCUGp4anp4RkM0Y1hxOFFRRzVLY3J2UGVpT1l5R3o5SmFwZzNC?=
 =?utf-8?B?ZEdrNVNmUmRqTWJmS0h5ZThETW0venVWSTl3amRHUFliZ3Q5Q2hpNlN4MDR2?=
 =?utf-8?B?empPOW96OHd6N2dYQWVBTks3bCswa0tVcXVMWXZqRzJWbmRMMytHRUxNay9U?=
 =?utf-8?B?RWpyNzlQVTI2LzRsaU9ZNmtDTjRkQjFKYTA5WE9OeGpnYU9nb2VXMWpXSGNR?=
 =?utf-8?B?NzFsYjdST0R3UXlHVEMzVVJIaEFzNUpZRnptWTRkQkp1dFNPQzA2Y3BWMWNt?=
 =?utf-8?B?NlN1R0pjcDRoeERTY0lVVmxGMldXRWlJTXgwcjBxdDZZanNWNzZNcnFqeTBJ?=
 =?utf-8?B?V25XSEZVQjJyL3ArOXhvUHZpRHl6OWdpU2NQMTdLbVhrcUxJRnJmazM0dkh6?=
 =?utf-8?B?YkFNaktub0t0RUpJZjlyZzZWWlJQb2RjNUNxQjVEZ3dzVHlXQ3R5VCt6ands?=
 =?utf-8?B?QVhBdXl4VzZHSGdCRTZHbjZOaXFRYTlndDhISFBWOXpkb28zTmNJaEVQRlJZ?=
 =?utf-8?B?Tll1M2ppdlVTYXd0TzBsYVRyamgrMTJLVThlQkNjUk43RjNkSWpDdVlsTGc5?=
 =?utf-8?B?VXhKN0FwOFM5U3NKVml3a25JVUhhblB6M1RwWFlhKzBsbUdSeW0rcldrWmpo?=
 =?utf-8?B?cVlTcGQzQzNpcTBuelJoaU1TSlFDd1A3RURsTGJtdmE5dWdWSGRWdWV2SnBk?=
 =?utf-8?B?UWpwWVNncmtWSjJoVk1LcmlxNlU3RXR3a3g5MFp3NTZscElzSWFNRkF3SVJm?=
 =?utf-8?B?R0NweU9WM1BiekVReEtxNUVqbHhwOVRaQUI3ZjZMeUlSczNGdWpJT214Tnp5?=
 =?utf-8?B?b2JaSmJKb2lrMEd1UGFGQnZKNlJOOWU0Q0kza0wreWV2Y3NNRHRMajNyYlRV?=
 =?utf-8?B?REdwblg2OGpMMWlmS2c0V2V4aGdZbVh3Wlh3cm12Tm1TajIxdlR6YXgrcndJ?=
 =?utf-8?B?RXA0YzRxL1hPa1o4Z0FEaTZZSlB3NDVYbVpOWmUrQzJJY2oyUmkydUVGU2FQ?=
 =?utf-8?Q?2maxr1eQW0o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZ3MUEyQ05xQmhWRjcrRTRCaWZ2UzBNWkMvVmVWKzNucFRGaTlJSndNR3V4?=
 =?utf-8?B?am5tTVc1eWM5NEdCWndqL0t5andlYTh4WVk0MGU3QzJhZHE2YjF2dHNtQUcx?=
 =?utf-8?B?SjJxTFREMjZITlRmMWl1OXpCUEthYXZtMkk0U1lLUklxSTNDclJabzdqSmdo?=
 =?utf-8?B?cm96d2hHV1JPemdxcjZ2QjZOZnFTQjVMbEd2bnM1cGxxcDVkcHJteFJSeUhI?=
 =?utf-8?B?TWtBK2dka3N0Wk96ZG1ndmVuMUV3QnQveDBPT3JBVG9IeTVrZGVFNlZPSFd4?=
 =?utf-8?B?UkJXZEhteXhIcWZZWDQzUnZDemU5NGI0NWcrNjFPMTJLQnpOZU5FOTl1WCtJ?=
 =?utf-8?B?MlF5TEtpL2ZrZFNRcE5RUlluQkk0bGRMUHVXZDVMeUVTaXgzOGV5NXFBVnZE?=
 =?utf-8?B?eDd4a1NZdlZBbHFEeTJ1U213TlhjWFJyQ1BFUks5QmdpUjFxRkhnM2xxL282?=
 =?utf-8?B?UEZjZ2VmZ0xtSWRGN1ZHcTVFVE9Ta041ZGtSQ3NlSGtOVTFxQ0ZiMUU2ZnhX?=
 =?utf-8?B?cHRRTE1hMGlGTldzVGNxbGhrUzVCRGtFcFBrb0c3SjRvaHVGVlBWRkMxZXhN?=
 =?utf-8?B?VzNhOUhpSkFOMWNwUGlRbjRYblB0UnBuRy9FeEZlNnAyYXI4dWppbHJoOGgw?=
 =?utf-8?B?azFOT0UrU1IyS24wT3NacGpJeXdPYWRmUGRjNEdqSFRkV0RnK1pvV28zVFNz?=
 =?utf-8?B?LytGUENNOFIwM1J3QmJha0NnSjJZZ2FWTklDZVVxTDJ4ejFvR3ViRWI2Q1RS?=
 =?utf-8?B?aG80TVR3bkxoUVNoeG83M1V1ajdjNkVkU3lBT2VFU21lMEVxbjJ6eGU1VTIw?=
 =?utf-8?B?TXRWQW5oRHJsTnVwUk4zLzBQWG03WWNMbmw5cmVOdzByd1hMVlQ1ZDVJaXM5?=
 =?utf-8?B?ZkpPSjBQOGFKcjB5WWhiakFmNU9UaVU2Ym4rSHdYV0duclJHS0FhYysvd3dV?=
 =?utf-8?B?Tkt5Y1lBazE1RGJyNjBtQmhham92S2VzVDBNME1yVXlSbis2SHVPeHhabVlv?=
 =?utf-8?B?WUhKb2psUVRuSGNGd2J4b1Jmc2orbmFYNmxSNHpLOHJTWkozZU9uQWxQOFRo?=
 =?utf-8?B?eXZjdWoyeU9rWkFxMnRES0xCMmpISTJCdGNPTXVFWTdMbTlhaWhPR2FROEN2?=
 =?utf-8?B?N0ZCQXFxc0hsT0pLb252R2toM3ErNzlqenpxeWRUYVVuVXZhMldRc05RdVJz?=
 =?utf-8?B?eWFGOTZlRWEvRmUwYTNWWWM4bjh1bzBETXJHclVXOGNuUmRwQ05Zc2RTN2dI?=
 =?utf-8?B?enplLzdRVEVranVCejBUbEQzbVlZZVNwN21DQkFNVWhDbU52SmpSdGlRbGRq?=
 =?utf-8?B?RHN0TlJxUHVGZlBtbkp3d3JBblh4aGdjdnpNQzh3dWUrb3ZIcFRsOXhsR3Jo?=
 =?utf-8?B?d3FQMzBIam9zYWZidEhoK3Bmc0lVeFlyeGUzMU5wNlFzWGRHYUtDSlZJNTdD?=
 =?utf-8?B?czlncTQybzhWYWNtN2lYdUpCZTB2Qnk0eGU0ZXk2Y2dDdGJ2cXBNRWxadyt6?=
 =?utf-8?B?YmhsK2ZOU0ZNSnFWUW1sSTRjb3RMWmQ5a1pkWk1RcGNWaUhyUFdWUHRONmF6?=
 =?utf-8?B?R3orRnBDeEJzcGRSd2xIbmtydnVaczNCVlVHOEFtT2NUY2VESW9DV0NxOEpx?=
 =?utf-8?B?V3BJeU9nZi8wSk5JZ01USlVld1RRRGoxakVpbU1TU1BGZ2dhL1ZWY01oZC9W?=
 =?utf-8?B?c2d4UDcybi9ORTJGRm5ZRWxZUVRyTEIyOVh3MDZEYW5QQkt0ZXRKb2NTMEVa?=
 =?utf-8?B?Z3RjMGpteXlvemRUZ3hGNWxTZk9pZTQ3amw0dmxOYys3aktNbkYrTmFveUNF?=
 =?utf-8?B?MSthUmRvYVYzOUNqcGlCS2lHVFo2anhkWlY5YU5QdFhrT1JPRXlZWEtvcGlF?=
 =?utf-8?B?SEZSSHlVQzNZSnROSDR4bFNjL2swOEtkU0M0NS9Kdkoza0FTellnUmZwbWQw?=
 =?utf-8?B?QURoQW9xSnM4bGNtaHpoY0NSb1QvOHhpNGlsYVh6UWNUQUYwam91V1BWREty?=
 =?utf-8?B?Zko4S2tDTlhUTHVKalRmbXdBMXIrbDlZVGFPR1gvUXFPbGZqZFZ1K2NFYzkw?=
 =?utf-8?B?dkdIejlkR080WWgra0piYk9uRHNlWk9ZeWtNUllnRHVJbFhlY1F2OGpKc3RC?=
 =?utf-8?B?MjFjVm5vTjh4YUVHT3Fhdm1MSkU3SlJQSXprNkVWb3FjZlljd21hL25Iby82?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 094161f0-dcd2-4ff8-58f3-08ddf469b907
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:08:27.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkqn8WnL0W/dihZeW3OwWEUGweHFL6EAJ2nsN6mColiwSESVAG3+MIxtLsi613fknqk0SjJMqh4cnxB//JlwwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 10:27, Athira Rajeev wrote:
> When the Dispatch Trace Log data is collected along with other events
> like sched tracepoint events, it needs to be correlated and present
> interleaved along with these events. Perf events can be collected
> parallely across the CPUs. Hence it needs to be ensured events/dtl
> entries are processed in timestamp order.
> 
> An auxtrace_queue is created for each CPU. Data within each queue is in
> increasing order of timestamp. Each auxtrace queue has a array/list of
> auxtrace buffers. When processing the auxtrace buffer, the data is
> mmapp'ed. All auxtrace queues is maintained in auxtrace heap. Each queue
> has a queue number and a timestamp. The queues are sorted/added to head
> based on the time stamp. So always the lowest timestamp (entries to be
> processed first) is on top of the heap.
> 
> The auxtrace queue needs to be allocated and heap needs to be populated
> in the sorted order of timestamp. The queue needs to be filled with data
> only once via powerpc_vpadtl__update_queues() function.
> powerpc_vpadtl__setup_queues() iterates through all the entries to
> allocate and setup the auxtrace queue. To add to auxtrace heap, it is
> required to fetch the timebase of first entry for each of the queue.
> 
> The first entry in the queue for VPA DTL PMU has the boot timebase,
> frequency details which are needed to get timestamp which is required to
> correlate with other events. The very next entry is the actual trace data
> that provides timestamp for occurrence of DTL event. Formula used to get
> the timestamp from dtl entry is:
> 
> ((timbase from DTL entry - boot time) / frequency) * 1000000000
> 
> powerpc_vpadtl_decode() adds the boot time and frequency as part of
> powerpc_vpadtl_queue structure so that it can be reused. Each of the
> dtl_entry is of 48 bytes size. Sometimes it could happen that one buffer
> is only partially processed (if the timestamp of occurrence of another
> event is more than currently processed element in queue, it will move on
> to next event). In order to keep track of position of buffer, additional
> fields is added to powerpc_vpadtl_queue structure.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> Addressed review comments from Adrian
> - Moved time calculation to separate function
> 
>  tools/perf/util/powerpc-vpadtl.c | 226 ++++++++++++++++++++++++++++++-
>  1 file changed, 223 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 9098cbe00bfd..637abde60f44 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -10,6 +10,8 @@
>  #include "session.h"
>  #include "debug.h"
>  #include "powerpc-vpadtl.h"
> +#include "sample.h"
> +#include "tool.h"
>  
>  /*
>   * Structure to save the auxtrace queue
> @@ -38,6 +40,14 @@ struct powerpc_vpadtl_queue {
>  	struct auxtrace_buffer	*buffer;
>  	struct thread		*thread;
>  	bool			on_heap;
> +	struct powerpc_vpadtl_entry	*dtl;
> +	u64			timestamp;
> +	unsigned long		pkt_len;
> +	unsigned long		buf_len;
> +	u64			boot_tb;
> +	u64			tb_freq;
> +	unsigned int		tb_buffer;
> +	unsigned int		size;
>  	bool			done;
>  	pid_t			pid;
>  	pid_t			tid;
> @@ -112,6 +122,33 @@ static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa __maybe_unused,
>  	}
>  }
>  
> +static unsigned long long powerpc_vpadtl_timestamp(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	struct powerpc_vpadtl_entry *record = vpaq->dtl;
> +	double result, div;
> +	double boot_freq;
> +	unsigned long long boot_tb;
> +	unsigned long long diff;
> +	unsigned long long timestamp = 0;

Prettier in descending line length e.g.

	struct powerpc_vpadtl_entry *record = vpaq->dtl;
	unsigned long long timestamp = 0;
	unsigned long long boot_tb;
	unsigned long long diff;
	double result, div;
	double boot_freq;

> +
> +	/*
> +	 * Formula used to get timestamp that can be co-related with
> +	 * other perf events:
> +	 * ((timbase from DTL entry - boot time) / frequency) * 1000000000
> +	 */
> +	if (record->timebase) {
> +		boot_tb = vpaq->boot_tb;
> +		boot_freq = vpaq->tb_freq;
> +		diff = be64_to_cpu(record->timebase) - boot_tb;
> +		div = diff / boot_freq;
> +		result = div;
> +		result = result * 1000000000;
> +		timestamp = result;
> +	}
> +
> +	return timestamp;
> +}
> +
>  static struct powerpc_vpadtl *session_to_vpa(struct perf_session *session)
>  {
>  	return container_of(session->auxtrace, struct powerpc_vpadtl, auxtrace);
> @@ -124,12 +161,195 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
>  	powerpc_vpadtl_dump(vpa, buf, len);
>  }
>  
> +static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	struct auxtrace_buffer *buffer = vpaq->buffer;
> +	struct auxtrace_queues *queues = &vpaq->vpa->queues;
> +	struct auxtrace_queue *queue;
> +
> +	queue = &queues->queue_array[vpaq->queue_nr];
> +	buffer = auxtrace_buffer__next(queue, buffer);
> +
> +	if (!buffer)
> +		return 0;
> +
> +	vpaq->buffer = buffer;
> +	vpaq->size = buffer->size;
> +
> +	/* If the aux_buffer doesn't have data associated, try to load it */
> +	if (!buffer->data) {
> +		/* get the file desc associated with the perf data file */
> +		int fd = perf_data__fd(vpaq->vpa->session->data);
> +
> +		buffer->data = auxtrace_buffer__get_data(buffer, fd);
> +		if (!buffer->data)
> +			return -ENOMEM;
> +	}
> +
> +	vpaq->buf_len = buffer->size;
> +
> +	if (buffer->size % dtl_entry_size)
> +		vpaq->buf_len = buffer->size - (buffer->size % dtl_entry_size);
> +
> +	if (vpaq->tb_buffer != buffer->buffer_nr) {
> +		vpaq->pkt_len = 0;
> +		vpaq->tb_buffer = 0;
> +	}
> +
> +	return 1;
> +}
> +
> +/*
> + * The first entry in the queue for VPA DTL PMU has the boot timebase,
> + * frequency details which are needed to get timestamp which is required to
> + * correlate with other events. Save the boot_tb and tb_freq as part of
> + * powerpc_vpadtl_queue. The very next entry is the actual trace data to
> + * be returned.
> + */
> +static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	int ret;
> +	char *buf;
> +	struct boottb_freq *boottb;
> +
> +	ret = powerpc_vpadtl_get_buffer(vpaq);
> +	if (ret <= 0)
> +		return ret;
> +
> +	boottb = (struct boottb_freq *)vpaq->buffer->data;
> +	if (boottb->timebase == 0) {
> +		vpaq->boot_tb = boottb->boot_tb;
> +		vpaq->tb_freq = boottb->tb_freq;
> +		vpaq->pkt_len += dtl_entry_size;
> +	}
> +
> +	buf = vpaq->buffer->data;
> +	buf += vpaq->pkt_len;
> +	vpaq->dtl = (struct powerpc_vpadtl_entry *)buf;
> +
> +	vpaq->tb_buffer = vpaq->buffer->buffer_nr;
> +	vpaq->buffer = NULL;
> +	vpaq->buf_len = 0;
> +
> +	return 1;
> +}
> +
> +static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
> +						unsigned int queue_nr)
> +{
> +	struct powerpc_vpadtl_queue *vpaq;
> +
> +	vpaq = zalloc(sizeof(*vpaq));
> +	if (!vpaq)
> +		return NULL;
> +
> +	vpaq->vpa = vpa;
> +	vpaq->queue_nr = queue_nr;
> +
> +	return vpaq;
> +}
> +
> +/*
> + * When the Dispatch Trace Log data is collected along with other events
> + * like sched tracepoint events, it needs to be correlated and present
> + * interleaved along with these events. Perf events can be collected
> + * parallely across the CPUs.
> + *
> + * An auxtrace_queue is created for each CPU. Data within each queue is in
> + * increasing order of timestamp. Allocate and setup auxtrace queues here.
> + * All auxtrace queues is maintained in auxtrace heap in the increasing order
> + * of timestamp. So always the lowest timestamp (entries to be processed first)
> + * is on top of the heap.
> + *
> + * To add to auxtrace heap, fetch the timestamp from first DTL entry
> + * for each of the queue.
> + */
> +static int powerpc_vpadtl__setup_queue(struct powerpc_vpadtl *vpa,
> +		struct auxtrace_queue *queue,
> +		unsigned int queue_nr)
> +{
> +	struct powerpc_vpadtl_queue *vpaq = queue->priv;
> +
> +	if (list_empty(&queue->head) || vpaq)
> +		return 0;
> +
> +	vpaq = powerpc_vpadtl__alloc_queue(vpa, queue_nr);
> +	if (!vpaq)
> +		return -ENOMEM;
> +
> +	queue->priv = vpaq;
> +
> +	if (queue->cpu != -1)
> +		vpaq->cpu = queue->cpu;
> +
> +	if (!vpaq->on_heap) {
> +		int ret;
> +retry:
> +		ret = powerpc_vpadtl_decode(vpaq);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret < 0)
> +			goto retry;
> +
> +		vpaq->timestamp = powerpc_vpadtl_timestamp(vpaq);
> +
> +		ret = auxtrace_heap__add(&vpa->heap, queue_nr, vpaq->timestamp);
> +		if (ret)
> +			return ret;
> +		vpaq->on_heap = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int powerpc_vpadtl__setup_queues(struct powerpc_vpadtl *vpa)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < vpa->queues.nr_queues; i++) {
> +		ret = powerpc_vpadtl__setup_queue(vpa, &vpa->queues.queue_array[i], i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int powerpc_vpadtl__update_queues(struct powerpc_vpadtl *vpa)
> +{
> +	if (vpa->queues.new_data) {
> +		vpa->queues.new_data = false;
> +		return powerpc_vpadtl__setup_queues(vpa);
> +	}
> +
> +	return 0;
> +}
> +
>  static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unused,

session is not __maybe_unused

>  				 union perf_event *event __maybe_unused,
> -				 struct perf_sample *sample __maybe_unused,
> -				 const struct perf_tool *tool __maybe_unused)
> +				 struct perf_sample *sample,
> +				 const struct perf_tool *tool)
>  {
> -	return 0;
> +	struct powerpc_vpadtl *vpa = session_to_vpa(session);
> +	int err = 0;
> +
> +	if (dump_trace)
> +		return 0;
> +
> +	if (!tool->ordered_events) {
> +		pr_err("VPA requires ordered events\n");
> +		return -EINVAL;
> +	}
> +
> +	if (sample->time) {
> +		err = powerpc_vpadtl__update_queues(vpa);
> +		if (err)
> +			return err;
> +	}
> +
> +	return err;
>  }
>  
>  /*


