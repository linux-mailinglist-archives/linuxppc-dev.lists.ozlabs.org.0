Return-Path: <linuxppc-dev+bounces-11392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E9B388AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:31:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs515Vxxz30WF;
	Thu, 28 Aug 2025 03:31:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315861;
	cv=fail; b=kPeFxOUZ+89p/3HaqnCiNAFP63lf+7B9gmm2MPSfqd6zTSv4Ztgp++9RLRb1461gK4Zn0XO8OpLwRghNeCuWSc/azAP5jD99iSgZNg6F5RnX4HseB3QLWsa5IKIv3SbzFuiNQzmSz79Rl8y61Okc/Mq8Gf8LgVJpdtZIIZ5JUuLptiST9ghummS3z1kFnnAvg+COYJtN0mKXeinaqR7QpKD7sraQW1wlKRoP0tYjZIorIqcMaP95BOnASTsFS4YH/FFi7W+sOJ+KJluxo6nCP+QVGkqkslKAd5mlfB0OaF7/GWaMZ64p+a9Q39MkA/NWVgdWa2fySqGMDh5+YaIB4g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315861; c=relaxed/relaxed;
	bh=ZbEFnCckFnjdfMGwiBcSEadmdV/F3CKV+IOXDc6xOGY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RSpesKg98GvaE6kSDVF8qdvnHI4HcYDTldMq4MjVIsA+aRxqlmHs8ubkOjY/TKTqE8Re7lIyspH066JnxCDAABDKwg85ncGf6Az6rFheT9wXAicfOAtyspx2KnEvYcPQERzChh4Fzy0yv39P+0cQfVYRCFcvHYoxaQfyTTENoUpOO496aaiPSmUpSQ9Z46o9EX9ZjuRz31BGIBjD4jdGzlKbYEtq4xiA1Y0YIvOyqq/M1x9uGuyyeOfe5zGy/98utDeZ6EQ4KWQ2JeuwSysfewo6Dvo71UZLV6K8KubL771hLMhp73dpcCwtknaH/d+Se98tX8rmEKQXEwFW5PUQ2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cTIH5f5N; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cTIH5f5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs505QDVz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:31:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315861; x=1787851861;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+LBFgEJL2R1W7sNWDnD2+L7sooD6O3N1OFdmGz3froE=;
  b=cTIH5f5NRbGMpZGeAXN9cm3lKo3gs9e1XVNAIj+/jyvsPyutC4MgfDg0
   sb2u2uCdLWpk0lrEyFZVi68LxtT4whT/baBHjNWWHFCpkBoNT3UUkDHq9
   EBRYfDCCk8wfU1tazHGmJu9X8k1XiZjjUBloKnSMLjQx8K1xqAtVM/R88
   N0rxSecNGTl2ALM/JgZSy9nlwqwboFyYE+V6MeAdL/VEBW+5YzCUWfcRJ
   DgFxhIr3G14B7qhbnR9DeRqU3WvXWO7Jac3p1FdXmFnPdx6VPZiiL8EoU
   wb/Co55rAq4VlF1RewPRJxF0m7Ir9+ibRdRpi1FUULzLwqGlwSPpPT0wV
   Q==;
X-CSE-ConnectionGUID: gTmdfUo7SpOL2JbXiblJnQ==
X-CSE-MsgGUID: m4+CQClJQd+XI1zSOprNmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69286426"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69286426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:30:58 -0700
X-CSE-ConnectionGUID: Jdf0krVNTre51UKMdF+ptA==
X-CSE-MsgGUID: UKXIHwjgR+6yKev8b9Xkrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174282312"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:30:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:30:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:30:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpoo7IYc9OK5IzSZX0xuIBHZa+SGoLO1DCwH9JDIU29e+wZwilH6q3nThJFawUXVV9s7mMmq+RXstUOagsp1Ahyn2TvKcnT2+EDvsl9HyhkNd23XcXKZnnZ4Y7hnAKLKYnPQb7shRLdFO0fD3maWVQP8uzFg5QA5lRDDDDCJEURVrTk8T+//dtnlqKd1lboSKSUwlNVkxomtVQXdImTE8apOcM7QUvnbkG1NZ/aU/69dFTZKSN7giG9/T7iJa0Vm7ddENhFdx84vHG7EoDUe7GohZYzn1WDCD/WS15+ReeFJTMD4WhVZIzhtL93CqgPQGdpzDjQ9BD6rPEXx8GTZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbEFnCckFnjdfMGwiBcSEadmdV/F3CKV+IOXDc6xOGY=;
 b=MA1ore9eh/k7pBqvr2Gt+QnQs4QtUM7vrFIDViRVYYp1fSePAfGDCpeaj7zf7/r8x7bicgrmr6uLrUicTTkjGCDHMVU9byG248p86nTKZWnKIC+/O4jyj4OIBbP8tRwyyrUjz314zQy/LYkoat9PBBTJrUWxk/OZfxJUzF3v/Kizd1TVT6rBvDEGUdCL3F869HnlWuEstKwHelaBvHz6V+ufNZl0onTgcScSCQGE0Z17bWSTzMWkel1gyFann9VChwyiVCCt/bO0C9/PlabFHwSnwibOwQ/WrfOCxOoVmqyScgMaIbISFy6+Y3oto52sJzDBgFr1FZu+TXSHV/1WVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:30:43 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:30:43 +0000
Message-ID: <4adc8413-e2c8-4c5b-9bb4-f425a6bed875@intel.com>
Date: Wed, 27 Aug 2025 20:30:38 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] tools/perf: Enable perf script to present the DTL
 entries
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-14-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-14-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0255.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::20) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: a73d10b1-b171-495d-c27f-08dde58f7333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUV4V3E0MlNhVGFIZVZ3dHg4eEUrVSttRnZZaXIvT1pDT01DMDUzNVQ4cFhu?=
 =?utf-8?B?RG5NS2JrSFZpQlF4TkRFcjEzWllSU3hpRkc5SFFscDB2Q0ZSNUFIU0RRSFFZ?=
 =?utf-8?B?blVPZjhqdnhXS24vOVpiQlhZYktvRnVqaGJxV3U5ang4RUZ4dlBCKzdhTm82?=
 =?utf-8?B?SExtUWYyTjQyaFNUMXRUdmZ2dW1TT0dvWG92Ukk5K2d6eC9QaTIwQkhzQzJr?=
 =?utf-8?B?bVd1dTI4YWhtVWtYUGsrdEZkZzNucDJKZ2NJeTlsUVk3UVpmamxFaUZjWVdX?=
 =?utf-8?B?RkhoVmQ5S0hMcUNrcXJva044NE5YT0VEcTBmZGNoZW5yaUtGWHFEVDBCL3BK?=
 =?utf-8?B?eCtMUmdmaU9tQkpQbE5NYTZQQmV4MWdpVFl0RXcwNDV1MTJHczZUOXdxYnB2?=
 =?utf-8?B?bXNzamF2cU1keUpPcU0wanBLdVhWZ2NnWXdCSVlKMTNpT1c2emhMMldIZVFo?=
 =?utf-8?B?cElPRW5KRnRrWHBwVGU1VkNodVJBSmlGV1ZmUEF4dmhuSVQ2WUpMZGxTMVo3?=
 =?utf-8?B?aXlQTGpGbldVVG1VQlRUMHdaL0dXVXRjaXNZU2JRNC91b3pzbTBvSHhzQ3Ex?=
 =?utf-8?B?U0ZrbWJHcDZQZFEzMGI3b21kVzBzVlhGeFZhRThxZ0xFSHBjbEVvT2ZJWVJh?=
 =?utf-8?B?cm1ta3NlanJJanQwWXAzZDZROCsvKzE5ZC8rZ1l0TFQxa2xoNGF1VXQ4YjNY?=
 =?utf-8?B?ZnNwQ2xITDNzM0I0L0t1aERJaVI1VUFFU0MrdE02MWJFZGMycnYwOVhCd1dQ?=
 =?utf-8?B?NHJxTDFaMG5OZVBkMkVNZjFLUmxzUWw1Y0R5YXZCU2JYUm9sNkNoNVFXRnVU?=
 =?utf-8?B?N1pEeWlWUFcrMnVIdEh3d3JGMzFpZWtObFFPUk5wS0g0d3R2Mk11dnhxY29H?=
 =?utf-8?B?b3c5QUZ0SmtiQllGcXJIcXlESkozTkdzU0txNjNjQ1gyc2g0QjJBN2haTVBZ?=
 =?utf-8?B?L2R5RC9sd3poTDFvMFVMRGx3L0Raa1ViMGU0VlB2NHlBRktmY00zLzJUMlhi?=
 =?utf-8?B?S2M0TnhYN1ZReXh3azNOSkNsSUVqYzU0SVlFWWpqSk1vQWt1aGdYTWN5RXpR?=
 =?utf-8?B?OW0xMUtDKyt2K0tCMUVHSUJJVGdjYzJiWkhHWGRUb0h5QmVBcHlsVFJITUQ3?=
 =?utf-8?B?cjgrOWdhQWhOeEZXOHdzVVlLSVY4MmhnOTBobmZjeVpPaVMzZE5JZ0JnS2NN?=
 =?utf-8?B?ZURsMEQzV0dROU80emY0czNBRFlDc0FWZFpmYTR6cGVqaUNIaUdUbGpTbmUz?=
 =?utf-8?B?K0gwSGNtYmRXL2RRZEdFTU02TkF2blZrbEJ2TWlQNTQ2eThIbzJ3V1FEUmJl?=
 =?utf-8?B?RUpCdjkxQlBGVGhrQTNGL3E1YmRkUmhpQllNV1k3Q3hVRjRtcjZoc2NqMUdo?=
 =?utf-8?B?VXZyVVZlWnk0ZnZST0xtdVhYQ1BmMVRQMHIvVUFpVDR5MmEvZlpRUmRtNkJu?=
 =?utf-8?B?SVA2U3pVNHF1a1RVUVZVdVY1N2VuN1loZks1ZThzWXpQaFZEWU5vaGZqRGRl?=
 =?utf-8?B?bFRGRkFoTm1EUHN5Q0hiQnhxenNVYi94WjcvL0doZEFPVjZzWGpSVjM1OFBs?=
 =?utf-8?B?YmZaTlFCUGlVVWN2dml3OEsyNHZlVVc1NDFtUTBRTnNYR1NNcThYQ2crZWVT?=
 =?utf-8?B?T2ovcjFPMTE0VmtNRmNGOFppY09LcUdWaHFwZk1iQTZMN3hQY25DZTVEMVk5?=
 =?utf-8?B?T05qeTR3VWkvQW15L2VoTzRIZW95MkY5U2hTQkMxN0pKOWxSWGNiR1lvNkE3?=
 =?utf-8?B?THpVOGZzeVhSc3Y2U1ZFMnZZSWtjZnhIVDdqTVlBREdLL1lkZk9VL1BVWXJU?=
 =?utf-8?B?VEUydGtra2E5Mi85ZExOT0xKbXp5dlpERGREU2VQNVd2elJMVEkzMi9OQUdu?=
 =?utf-8?B?eFFMSHZoNWEvTldlRHFaUWRzVnp3WXlHdDI0aU9GUHplVnlFbUhEdnk5aGFl?=
 =?utf-8?Q?F083t3HhdSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU56VTI3RkFRalZqMWYvcWdYc3pGNXROeGowb3RqTkFFNGxCcXdHL08yKy9C?=
 =?utf-8?B?MnJ1WS9RK2k2cFFlNlU0UW1PbWphWFgwMTVSZ0xEd1JLN0dPVDR4dytBcEFX?=
 =?utf-8?B?Zk5DaXczdGpGREtvcEQrVk1SOVhUaHBnbTA1TmZPMUNGdHdEZjFBbUFEbkd5?=
 =?utf-8?B?VXdnbFZNTFpRSTBEeE03Y3UwRVpCUTNyTHJjaE9qSjIzOEMvSk5lUnZyN3h2?=
 =?utf-8?B?MVV0OEt3NnBxQllqY1k4Zi9pRzlCQ05vcmhxMzlTam5PUGdnSlR5SVl3aEo5?=
 =?utf-8?B?cVNFTElVczBwbnNGK211SmhLQlZubTI1ODJkd2JwVEd1ZThPRTFDQ1hBTkRI?=
 =?utf-8?B?ZGh5MHJmS1M3MXFESldzZ01mUnZvZnBpYVlYNCtnNHR5aUEwUGUxWHZPTHRM?=
 =?utf-8?B?ZlAwMSt4SllEaUdyWjBhRldZTDlqODE5TVBIb3E5T2t5RFFXeU1ZbkcyNU96?=
 =?utf-8?B?Zm92bnFIemxFc1daKzVzb2lYbHRqVnpKc2tMR0k3QWZIZk1JMjJocEltakZF?=
 =?utf-8?B?ODlCVTV2YXF0aGVlNUVTYWRmbnp4cFNFZU91M2cxV1p1NDVIZTh4U2FFMHN1?=
 =?utf-8?B?K25lWmpBdUZmQkJsa0hqSVIwM2NadWZJd0ZyOHdFcWVLSGorWGRXU1IwTXFW?=
 =?utf-8?B?UjVWSzVEVGd0cnJWK2xETC8xUG9sZ2Ywem1kV3pVR0ZVOUNLd0s3NnhpaTJ5?=
 =?utf-8?B?RFNuMHUvQUdyYUgva1NsdFBWQ3ppdlVBbVQ1bUNPWTdPeExoS29ZM1owbXBS?=
 =?utf-8?B?M0lncElnNitieERjdkErbkt2SjlOckxvUzY3UUgzMUxueG9WcHBhdlA0Skxh?=
 =?utf-8?B?a0swUHNFeUpnckpyT0ljZFdxVFl4UEFNanpRTVpWdG5XVGtZNUwvUWV2N0dG?=
 =?utf-8?B?WFA3ZVJ2V3hsbnhOOTN1K2E2SjZVT0hkYkExT09YSnJpMEYvbnVhWURPRFFR?=
 =?utf-8?B?MmxFNzl3SlRWYi9jNzBMbjRHT3dEWU01Q01adXVMNkxFdmYwbmlvdDZvVVBD?=
 =?utf-8?B?Q0I1bXBTWER6RHpDdjkvN2ZtdTlodXRhcWgrdytwQmdXODFxSlNZVFJIM3pM?=
 =?utf-8?B?VGc1YWFJSWtBOU9iT0FsRWdTTVBpeFJkWlBhVHRqSnBod0RDdjd0azFZeFQw?=
 =?utf-8?B?OFNZcWdnUk1YU1VDSFlublYrNUc5S2FoM0JtUmZiV2NTeGZVQWgzVEdFWitv?=
 =?utf-8?B?d1ZWOUYxSk9xaDV0NXNSLzNiYWNuWVc1N0RxTHlpQkVpeU90WGVGMlFrek00?=
 =?utf-8?B?V3hRVzl5UFVLZy90WWxrblhpOUg4S3F6Z05oaEF1WG5nbUxleHVLMGY1TWlQ?=
 =?utf-8?B?R05PN3owdjJVSWdpVk9WMktWa0tUQW9zZzFuZm8ybTZXemdYVUNXZUlDUFZP?=
 =?utf-8?B?am9FZnNCWmsyOUxmY3dPT0V3MGQxaGRGK0pjeWJOOXg0ZTE1bDk3UjdpaitJ?=
 =?utf-8?B?L2JKRVN4VlZXY1czMGVDYjRreXFYaHkzaXQ0Uk5HS0ZBNHVENERoWDZOT0tP?=
 =?utf-8?B?TUJsQTEyR01LNVRGNlVQZ243VDF0N1RxdFEwTkNKNFZVVFQzYXdDM2pDTTIv?=
 =?utf-8?B?Mmo4RG1RYzE2RTBXb2NiOHRKSnJ6RlBTMFhGeTQ0Mm82YlNQWW5hd2lFcTd2?=
 =?utf-8?B?REs0MEtSQnU2QnpjNXpHTFRSRkpiOWhwcnNJQmY1b015SzBUck9JNnVKbUh0?=
 =?utf-8?B?OUtZZzc2Y1hRUXo3YXkrSXZQREEwQUMzbXJGK2VUbnpzQjRnQk9ZSVpRWlFx?=
 =?utf-8?B?NncvKzl3Z1k5Y0VLMTVuZWNXb3BnWTVJTE15V0hMazVFKzBxdmQ0T0piZytM?=
 =?utf-8?B?THdHeGhNUTBzdWxITE9FQWVVaGtiODRxTEhYRnZPeGM2dkhIYjh0SkZiVjNB?=
 =?utf-8?B?eFZUM09XK2RYczQrQkxTUkhYWE50R1U5S0wzM2NiTCtMUmJVamM0TEUwTGtI?=
 =?utf-8?B?OEZWcjh2anlMQ0EvYVZITURIbVR3cWFWbHlZUXRybGV6Z2FybmtPeGljSWVs?=
 =?utf-8?B?eE9sR3VrSXBISWxEWnZFY05RamhhWXFYRW5CSWcwVWxvQkVUM3gwTjVaUEIw?=
 =?utf-8?B?OGhOYnUwL2NZaEpaMmhvNFQwMEhGWWNKQW1sTTlHVDdxOEJtSWRsRGJrRnhY?=
 =?utf-8?B?THVRVUk0dUhiNlp3TDUzRDZRdWpHNmtaSXR0R0J4ZGNpOGRhWmdseUhzZ08x?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73d10b1-b171-495d-c27f-08dde58f7333
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:30:43.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doMhruiidAN5ua7u9u56JrYQMaWmtk43bf8Mu8lcqzzE29f64+d61rjlpXfb5NIo3ttPCTMdvdLRndez7jL3FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
> Enable perf script to present the DTL entries. Process the
> dispatch trace log details in arch_perf_sample__fprintf_synth_evt()
> defined in buiultin-script.c file for config value:
> PERF_SYNTH_POWERPC_VPA_DTL.
> 
> Sample output:
> 
>    ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>    [ perf record: Woken up 1 times to write data ]
>    [ perf record: Captured and wrote 0.300 MB perf.data ]
> 
>    ./perf script
>             perf   13322 [002]   233.835807:                     sched:sched_switch: perf:13322 [120] R ==> migration/2:27 [0]
>      migration/2      27 [002]   233.835811:               sched:sched_migrate_task: comm=perf pid=13322 prio=120 orig_cpu=2 dest_cpu=3
>      migration/2      27 [002]   233.835818:               sched:sched_stat_runtime: comm=migration/2 pid=27 runtime=9214 [ns]
>      migration/2      27 [002]   233.835819:                     sched:sched_switch: migration/2:27 [0] S ==> swapper/2:0 [120]
>          swapper       0 [002]   233.835822:                                vpa-dtl: timebase: 338954486062657 dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:435,			ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: 202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>          swapper       0 [001]   233.835886:                                vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,			ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: 201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/builtin-script.c      | 23 +++++++++++++++++++++--
>  tools/perf/util/powerpc-vpadtl.c | 16 ----------------
>  tools/perf/util/powerpc-vpadtl.h | 19 +++++++++++++++++++
>  3 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index eff584735980..a0faadaadc4d 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -66,6 +66,7 @@
>  #include "util/cgroup.h"
>  #include "util/annotate.h"
>  #include "perf.h"
> +#include "util/powerpc-vpadtl.h"
>  
>  #include <linux/ctype.h>
>  #ifdef HAVE_LIBTRACEEVENT
> @@ -2004,8 +2005,26 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
>  }
>  
>  static void arch_perf_sample__fprintf_synth_evt(struct perf_sample *data __maybe_unused,
> -		 FILE *fp __maybe_unused, u64 config __maybe_unused)
> +		 FILE *fp __maybe_unused, u64 config __maybe_unused, struct perf_env *env)
>  {
> +	const char *arch = perf_env__arch(env);
> +
> +	if (!strcmp("powerpc", arch)) {

Not needed.  PERF_SYNTH_POWERPC_VPA_DTL is unique.

> +		struct dtl_entry *dtl = (struct dtl_entry *)data->raw_data;
> +
> +		if (config != PERF_SYNTH_POWERPC_VPA_DTL)
> +			return;
> +		fprintf(fp, "timebase: %" PRIu64 "dispatch_reason:%s, preempt_reason:%s, enqueue_to_dispatch_time:%d,\
> +				ready_to_enqueue_time:%d, waiting_to_ready_time:%d, processor_id: %d",\
> +				be64_to_cpu(dtl->timebase),

If the output were ever to be injected into another
perf.data file (by adding support in perf inject) then it
would be aligned to 4 bytes not 8, so for 64-bit access it
would be safer to use get_unaligned_be64()

> +				dispatch_reasons[dtl->dispatch_reason],
> +				preempt_reasons[dtl->preempt_reason],
> +				be32_to_cpu(dtl->enqueue_to_dispatch_time),
> +				be32_to_cpu(dtl->ready_to_enqueue_time),
> +				be32_to_cpu(dtl->waiting_to_ready_time),
> +				be16_to_cpu(dtl->processor_id));
> +	}
> +
>  	return;
>  }
>  
> @@ -2032,7 +2051,7 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
>  	case PERF_SYNTH_INTEL_IFLAG_CHG:
>  		return perf_sample__fprintf_synth_iflag_chg(sample, fp);
>  	default:
> -		arch_perf_sample__fprintf_synth_evt(sample, fp, evsel->core.attr.config);
> +		arch_perf_sample__fprintf_synth_evt(sample, fp, evsel->core.attr.config, evsel__env(evsel));
>  		break;
>  	}
>  
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 370c566f9ac2..482ddf1a2d51 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -30,22 +30,6 @@
>  #include "symbol.h"
>  #include "tool.h"
>  
> -/*
> - * The DTL entries are of below format
> - */
> -struct dtl_entry {
> -	u8      dispatch_reason;
> -	u8      preempt_reason;
> -	u16     processor_id;
> -	u32     enqueue_to_dispatch_time;
> -	u32     ready_to_enqueue_time;
> -	u32     waiting_to_ready_time;
> -	u64     timebase;
> -	u64     fault_addr;
> -	u64     srr0;
> -	u64     srr1;
> -};
> -
>  /*
>   * Structure to save the auxtrace queue
>   */
> diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
> index 625172adaba5..497f704787a5 100644
> --- a/tools/perf/util/powerpc-vpadtl.h
> +++ b/tools/perf/util/powerpc-vpadtl.h
> @@ -20,6 +20,25 @@ union perf_event;
>  struct perf_session;
>  struct perf_pmu;
>  
> +/*
> + * The DTL entries are of below format
> + */
> +struct dtl_entry {
> +	u8      dispatch_reason;
> +	u8      preempt_reason;
> +	u16     processor_id;
> +	u32     enqueue_to_dispatch_time;
> +	u32     ready_to_enqueue_time;
> +	u32     waiting_to_ready_time;
> +	u64     timebase;
> +	u64     fault_addr;
> +	u64     srr0;
> +	u64     srr1;
> +};

As mentioned for patch 8, maybe call it vpadtl_entry or powerpc_vpadtl_entry and
put it in perf/util/event.h

> +
> +extern const char *dispatch_reasons[11];
> +extern const char *preempt_reasons[10];

These are in perf/util/powerpc-vpadtl.c which is conditionally compiled
depending on CONFIG_AUXTRACE.  So this happens when building with
NO_AUXTRACE=1 :

  usr/bin/ld: perf-in.o: in function `process_sample_event':
  builtin-script.c:(.text+0x379a6): undefined reference to `preempt_reasons'
  /usr/bin/ld: builtin-script.c:(.text+0x379d5): undefined reference to `dispatch_reasons

> +
>  int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
>  				  struct perf_session *session);
>  


