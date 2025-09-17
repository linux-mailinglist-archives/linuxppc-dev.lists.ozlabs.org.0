Return-Path: <linuxppc-dev+bounces-12300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F2B7EE44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 15:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSkX13Bcz3bqP;
	Wed, 17 Sep 2025 15:58:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088724;
	cv=fail; b=GqDA9K84HiCaDlqbjwTxSL9wXEJyIgpT94/bXoMNm7Q45+gDlTakGqoe19cl7bLDPVWGrQX4RkWm+3Q1lYkMSQa9h1oz3A1aEQIFVcEsJuUeZ0eIlaKrzSHD4PXO561GTN9bmi0r94BEmdlpZbKqcXTFIzG7NbCDE7xS0/5Owk92b+ThyJ9qXJ2afnu0UW0IDzE7jOWRviXs3x3lCPESJFTJSXeIPbNKspAOsM1pR/166UG+FnM1OqGn5Ca7aB+B7EKfBx9Z+/ks73jqptDJXk/JRMEPfuaKz/QFS0iMSE6/pvz0DBSaWQ9GtYjcd7417cgi4UUmiZ98WCKbrLEStA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088724; c=relaxed/relaxed;
	bh=uop7CRHMvyY5gBcldb6nr63cnxv5NJwsGV5OEkeuOOE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R3XX20oWKLCK/8i0r5TtSIBOQJ6SOYWWMUoCR6QLgOzJdE+YQhqykFT8vjPeKlHq+VDsEjqP/N1/ysZgKovGj+QIWdvkAnNic2jRClZdUNAwbfbHwrp+5xGiN8KNWW9AZIkUZbDtZjhhSK2EifsKSAY8c5ZqIR0ufjzhaUnKaNO2BQgEeAOXXHX+qzMvhP4xxRZAcyS0T4W8+ox/XTPhQ1hbkjsf1yzl3wxOfxfKruNTl0Uc8+QSctjqI+TrlsvRQu1VTIe6jp5NTa2N5m13uakA58RjfO2CwE7jYb9+RnPUBRG70q4dMx9dHpbcW4PTUsWPmZERDW51ABGs1lbLpQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHyVOpUI; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHyVOpUI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSkT4fzGz30BW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 15:58:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758088722; x=1789624722;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QlbYuV9y77EvQ1j3yBPgNc5JfQaSqiX1EuTrPk4ntkQ=;
  b=bHyVOpUIetWWrAFuIc7OM59I2/H7ELLwbg/TYRnPsXK9kLHUeonr5ctO
   HQ3woXjOieYEdeH2MID2YT3g4I+gBq8EtnJD5wJlfj1/TM/AuXxXO1t7C
   VKk6KtS9TkMHop8Ft8k581R9z7csRAOWVoV0RbErJOA/WKmUnfcjITJ8v
   YZG16+a+ZSIqyCuJlZ2jJMSMNBfyIsJstCxMZ6DmMNvW2tBmZrgJnIoT+
   ovzQWKza//mXO5tmrVAOsuWVelITZ2pnDNBYNsS0WKQkih8DRaFEVX9lN
   kMMMb7Ob/11dZmXwqAZio9p7+GARF6nQt+ELp8w4vYbEVfQ5LMLsQrWAP
   A==;
X-CSE-ConnectionGUID: Drgxv39MRlCXN3lnrZy6Sg==
X-CSE-MsgGUID: jq5JaXyESSG0NwivMGK8QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70634471"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="70634471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 22:58:37 -0700
X-CSE-ConnectionGUID: XZeBt8Y3RbaXXvFtuEw5SA==
X-CSE-MsgGUID: zlfQJ2FkTEClwnAhEc70sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="175548790"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 22:58:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:58:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 22:58:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxUKVOqxhuplWPMTR3nHeIDnTGostPI+MYJeS0inZsJ3Rek99R1lPBk44C0Vub6gd25VCxJhy+h3VuMXGR//Mm5tEHA/6tiDn01aui9fqKu2s783GzyMpnGWAL7UjyzkOSUp7M63qoStx6dotH3Mo0i+xUPTPtoaUP8tKCJNhCwD8mRdP1MiO+iWUDCSzDvAWQ/slMRqMbFzpQiKgHbnUFVVJciXxSFOaZzrCWIeF6JqDOfI2pBcaJYny6wrDSgt8lbhJ7+e1yGwjwOHUa0k7lFXCHVwoZbnRySiPii1TPw+I8gtjlg840Ql7FI6trd4I/+e3IJfN/+ND2Ig/ghmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uop7CRHMvyY5gBcldb6nr63cnxv5NJwsGV5OEkeuOOE=;
 b=vWukW0Rs3PiBnuiguMrgpoRwu8Epc6iB4zOXBCL/1XoF/greIGe88YtoArnadY3/yK963/4IBzOkHwLwnHzPNbbsAaUTO5vZgz/Pmuy7nZePiqRqWKhsusRjHgm3RaewPqlT3X3wyXeysTXuZwkDcn7ckVadHzq8wBkTMCsFiOet/K8cENt4t/b289e6SJQ0fqxtbTXvCBmkZ2o696yarkof5Qi8HSm1/7t+Lm1qZMb7lpgnYCsMntJVZ+gujGQEBuaC/3HsjhT4KNjI5rqItNkEQtIniHvvhaH5IM1DPyG9sbY6FcaB5hXUPaag53XgCdmM/xVr0b3vQ4WuGzUc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 05:58:32 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:58:32 +0000
Message-ID: <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
Date: Wed, 17 Sep 2025 08:58:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>, <Tejas.Manhas1@ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250916052536.93911-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f66924b-7fe0-402d-b5b3-08ddf5af3ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFRhWDk1UXhYUHpmcHcvaU56anZ1RWJkUmg2VE1ma2NXT2RBYkZHMWlOdUg0?=
 =?utf-8?B?OWxzcTRmSlpOZ0x3ZnVReHRGUjM4YlhjQkI4NVhPM2crcjdtSUZYdUQwb2Qz?=
 =?utf-8?B?aDFUOXlORVZrdUxDNzlMV2RJOU90aWpEMFFpRzlxRGUzVzlYZDc4VDZuTFdE?=
 =?utf-8?B?dGJiNlRLa2UySVE3UnNBMEM3Rnc2YkplK1RWSlFCbmRWOTZSemhxQ1BVS2tr?=
 =?utf-8?B?a1djRFB2byt0NGpOVGtKQW96Wk9uOFNhbis3UTVzM25kdWI0OWlFNFRtdXZU?=
 =?utf-8?B?SXB2cmpRK0IxSUVWNHYzYnRJSmM4aDRidWZkais4ZlVjVExJZ05kTU1wVDdB?=
 =?utf-8?B?KzJldktLSHV4cFRGaHJSMFlaRTJ2d0R6VmFzdHlRNDVZd1g1bEZlM2Nlb0ZR?=
 =?utf-8?B?eWQxV1pTZGhUS1lFU3FJYkpTMkpoMDQ3UkRQVW1peSt4TEFMRlZJMmxwVEtz?=
 =?utf-8?B?RFYrcFExL2tvNno2UGg4TVYxT2swN01wOERJdE1wSkhPRjcwam1tcXRLSVhj?=
 =?utf-8?B?WDZkWWNtcVgwZE1FUjBOaHZlcGkrdTZKUEFrbDZMZ2JsZmh2eUR5WmphOWlN?=
 =?utf-8?B?aGg4ZXlsV2FyemFvdzJ1SFVrKzRWSm5TbUFGMFRHblRGa3pVV3d6eFYzaEtU?=
 =?utf-8?B?NTNMUnRmNFJrSDRMZndyTmZHMlV6TCsvMzRxanM1Z2EwWE9Xb0QvaWdMdjVa?=
 =?utf-8?B?b2ZnT3EwdEJyUEh3aW1EWUdoVjdzWnVnVGFURndJOVhkYkdRYytJVWRxT280?=
 =?utf-8?B?Tm44UFVmZktEODJlRGdKb0FKMWg4cHU3czFVRzFwaDZpMXVWNW1vbFJkR1dl?=
 =?utf-8?B?dnpOMUwxczZ3NkV6d1lVTC9JQ1c3VU1uVDhVSTNuNzJiM1VFWlRrclZNMEhT?=
 =?utf-8?B?TGVHSmlJMkppL0VncmJ0SXVSUUdpa0lrS0lBTlQ3WVduVEdDTWFZbTBMd0th?=
 =?utf-8?B?M1VtaVVjaGJLWUVBd0lmMndiVzZ1OE95d3g2aGRJTWZkWFJidGZkblRLUTg4?=
 =?utf-8?B?NkhmRGtHbnNLMXlEaXlHSVpad0tMZkNKWng0b3hIdW1LNUtWbzZ0S29xZHpI?=
 =?utf-8?B?bERWTWhFYlJmQ3UvTWtva1RNMDhkbE1jVEV4UjVmandYSnV5d2Y1WVFob1dY?=
 =?utf-8?B?UG1RaGFaZUwxcVZ2N2pGSXBvSXdJTG51bTZDTkJOSWkxK3gyQURsclpuVHh3?=
 =?utf-8?B?amNRdkFxUVB2REdjeHlkdGxTblRhY1NIaytLY25HR2FDMCsxY1JJSkxtNGVY?=
 =?utf-8?B?aU84ZWVvYmRmZjQreTNMVTBUaDNtNXJoVEplOVBQOVlDYm0zSmFwS1Nxb1JP?=
 =?utf-8?B?aUxaZkpoN3JMQS9EeG1jbkVJdGxjUHg4ZjNJRVpTaittZjJ3eWM5eTk4K09E?=
 =?utf-8?B?TmoxVGs3SGlHZGxuZEJHb1Jza3F5bmFSeVYzb3EwWWZZQ3VJaGszWElNSzA0?=
 =?utf-8?B?eUh6MWR3U0pBcHFTR3Jpd1pCdjlhbHNuTU5FYzZzQU9Vc2RBVnNUbSs3UFZR?=
 =?utf-8?B?M2dRS2FqSWduWjlrdGhibVIySHdiUG1xbkhHWTFtM3oyY1c2am1lZ2hSaVRk?=
 =?utf-8?B?ZTd3V2ErOEg3NEhBWjc0dDFSQ0kwbGpaMDVpRlVVVHU2RnZDR0RnUGpkY0tv?=
 =?utf-8?B?djBRLzFQeUQvOHZldjRtVWZwRjA4REk0UkphdnZ5c05DQVVuZ1NZU2JhVE1E?=
 =?utf-8?B?eWo2U2lHOStoQlhBOVZpbStoM3hadll3TkxEcHNDTVRUT0wrS2VtajhGd0hz?=
 =?utf-8?B?OUd4YkREYUhZL2Y2YUVoQVhQdUp5Q3R1SFRkODI2dTV1NDU5d0lRZXRvWDFx?=
 =?utf-8?B?cnBVWExueDBPd1hWVEFPRFBkZ2dwa3JEY21PZklJKzRpaElPU2M0eVViVGNO?=
 =?utf-8?B?bW41UEg2WEFKR05vdDg3N2hjenUwSGJlSEg4bXJiTXh3K0VrdGxOa2F0dVB6?=
 =?utf-8?Q?yauouaaYKR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0llYldLcURCUEU5UjhscEptbmY2Vlp0UU12QkNURDk3RWV0Zm5rZUR0L25n?=
 =?utf-8?B?bHFucHNHVEhZZmdTRkc2aVhpVTcyc1VwOWEzcnpGUHhIZTVRNHgxc2tUc3hv?=
 =?utf-8?B?N1d2M2FOcGZUTWh2SW1uczBvbkk4cWd2bXVLaDdjNmZmM1lROG1JeCttRytX?=
 =?utf-8?B?eU96SnBrNXluVkh3WGRqZmJVQ2o5RWg2Z0VrNE1ZZ3NPL2dMaUw5RkJ4Rkxr?=
 =?utf-8?B?NGVNSlNaUDAxaHNBVFk0ejdCUk9xVk1mak9VZEFidkFSL2NMcHltZzM1cUpW?=
 =?utf-8?B?MEJoOXBQRTAvNDhkbFkzOWphS0xQSFRDa1A5TFBuMkdHQ2M5WE1tcUNLb2JX?=
 =?utf-8?B?dVM1dGRtRlA4cVNVZklCSXQrMndhLzJoNmE3YlNybTJVbHJPS0NpTGJvMGRk?=
 =?utf-8?B?TnZPYjFMcFh4RmU1OTdxQXhxMmllYnJHbDNzbFQrZlhDS2NMczh6RGo1VUd6?=
 =?utf-8?B?QnB4NTBtZGptVnJ2NVV3UWIrZmtpL2lwMGRVdEVVU0UwVXhwQ0FKRGFRazFx?=
 =?utf-8?B?bm5MWkZqSktVcExFcjh1ak1SUzdZYXJ0Y1lXREJUYjVzQVpPQkJDd1dNS0NL?=
 =?utf-8?B?Q2RwTjA3U1d4d0IzcVFVQ0RHY3ljRkZjQjBJV1kycHF4MGZlZGwrOFBEOE51?=
 =?utf-8?B?OGUwVWVyalhoZWxhalAwUmc4N21MZkoybUdzV0x6RVlBWXluSXlUeC9Yb3Zp?=
 =?utf-8?B?NHVFQWVrQWJuSHlydElCR2VydDl5RlVPV0V5eWlSQ2JIeEI3Y1QyR1VjdVFN?=
 =?utf-8?B?N3hSdWdleXRQaXJqcXV4aXJsenI2elMzNGR3My9DZlVZUVZwSDFLVjJYWW05?=
 =?utf-8?B?Rk5NaysvcWRYVFRIZ2kyUlRvMmhncmNQYm5ua1FOYWNRU2ZXdlEvOGViRTlR?=
 =?utf-8?B?N29Sek5FOU5TcFhMQ1kwMktHd0VpSHBkOFFVT1o3UmR1cngyRWhIanYraGFR?=
 =?utf-8?B?VlBwUk5pNEszVlBkTlVNRDhvdktMdTBZNVo2WUIwa1Y1Nm02QTNsOFM5VnRi?=
 =?utf-8?B?WlcwYi9EdXl5azdKOHg0WVdxMk9TY3laOUUxK0RUbjRBRUh6SmF2SXhEd3lI?=
 =?utf-8?B?UFlwb05zUGlBd2lWRG83SUs2SHF0WkJQdWxXWHJHQkl5eUVrSkRTQjFicVYx?=
 =?utf-8?B?dUhCbVEzbHBHazZFeDlLZmUyc2lEbGgxb3NMRFhIM0p2aG5ZOWdKMEdrZTFC?=
 =?utf-8?B?aXRHZzBpUUJUYkRJSEk0ZkVmRHcwRzJ3TzFaTkE2KzFidlh3bGkzTnAxZ3R0?=
 =?utf-8?B?RzI1L2tuN0x0a1ZsanZ3OVFvYlVyeWl3S0xjM1RMS3RDdTRiWWtPMXlyc1dh?=
 =?utf-8?B?RFdlR2d1ZzczZ0kwR0kvTC9aOUVPNHNvYVJFUmJHbVV4bEppYzZicFJIUlVL?=
 =?utf-8?B?alpYdHlHUjF6ckhNNVVtV1J6M2xCZHhVczVsTmdWMjE4NjNzR1lWZWt0Skcy?=
 =?utf-8?B?ckJIOS9sUDhLSXdESFUvY04rSEtxQzZJeUtmNWk4OC9TREE3elc3T3o1Mmg4?=
 =?utf-8?B?RGY1Wnh3anBNNkE4ejIwWlJQeFdjTXVLQ3VGcVVxUHhXS01YVXFubTNFTDhi?=
 =?utf-8?B?VDNqVzdXaXJoNEEwMkVpWDczcG4vSTluNlVpVG03YnB3Sm9wanFsWkFSNnV0?=
 =?utf-8?B?eGZ5RGFwTUphbE1sVldJRnB3Q2toN0d4WTFucjNZK0xOdTFuSGdscW9RRktr?=
 =?utf-8?B?OElPdmVOaWtsOEdpN1lzeGg2NGpxUG11MVI4elRjMlF2VHBEMTh6MDhHcytw?=
 =?utf-8?B?bjBCdCtzVnkvWlRJQmVZWldwSi9NVnMxYmFRRjlyNGNhSlp5K2VwNEdmVEFM?=
 =?utf-8?B?bURJbjdEZ1lkVW9WeGltT2d1elVQSmVFNlBVUGRGcmdFeXp4MW9hTkZkZElC?=
 =?utf-8?B?dWpYeHBZR3YrbTdNem1zSTVZdStTUXpYNlkvU1Nsd0FzMkdrMUNPL2NFcXVD?=
 =?utf-8?B?dXFhTlhJOEVRRUJrN0p5NTNlYTZySzBFVmlXelRuR1dhaHgxREdiendxRWkw?=
 =?utf-8?B?VVcrQ0lNVEdzWDgxMENyb0FxNExmdGs5YU9IZnF1NGk2bUh2SzlnQWlON09T?=
 =?utf-8?B?RFhQeWgvYlNGL3ZrRTNIWWJDUE5nVWVoaENRVEVoT29SQ0w5OGVrQ2pOcGRK?=
 =?utf-8?B?NnJGd0ROVjErc1h3VjEySmU2SEtER0ZEYnZoYjUrdkV4TWRiN2kzRGRIZEUr?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f66924b-7fe0-402d-b5b3-08ddf5af3ba0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:58:32.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oje5XkPwPm56purylz0rnnFzXu2IxJsCDm9v6XtHFIo7T+vmbZtI0iCYanIJPO1dOfX8rMEUVC+REoYmOrxysQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16/09/2025 08:25, Athira Rajeev wrote:
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
> 
> - Patch 1 to 6 is perf tools side code changes to enable perf
>   report/script on perf.data file

For all patches 1 to 6:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>


