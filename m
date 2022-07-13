Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157C572A8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 02:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjK5h3PZdz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 10:59:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YDpGvESB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YDpGvESB;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjK4s3gYsz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 10:58:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657673933; x=1689209933;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZZQFQmvsIAGQ3UeDOUpIvXJfdtLUjvb57iRxFpMRUfw=;
  b=YDpGvESBh2BaLlSiXg3ndn3ClcYuIlw38nPy2ZZq0G0iukrujvMWcvw0
   XitD3AjjFYjddOxeL9obwqaczJHsbSJj5nXbRGqSPyx1zB3tyk/okweeI
   gGiZYmmM4iz7ng2gWCpFAkIUzqjR9aPnZqrrqLbV43LbC/Adqbnxq+KSW
   SGFFy5J4v0FEgQoa1UZFLZTliNfFfLoUd7j9g+I4aNk4ml/DUZ1urEBSf
   gFAQT82J/07GlS5ylJsGvihtYm2G2BNhKTSnT1lT+VP0r0rW/8X+qbfaO
   7lxFWwkOjzYyzMVaaiRFnmdBHWpAdizKJLNRS4B9V7RkhvaSW1RuS8c58
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="264865925"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="264865925"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 17:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="922425150"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2022 17:58:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 17:58:24 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 17:58:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 17:58:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 17:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRfUr3DQvkzNC7aBGJ9/FPLNNzBalaEH2PiHHNZ9bzzCtfTGO9szNLCgvFR2RmojyB6a6k/9QqfqeICtMZwONoTpicWdA6FPaVFj9c8zZ1aYgCTO0MW905ioJrT8KD8+mJ/0qZfRT+/RVNLC78W3pOs464baAslm50zSN/mM6lEMLByqPoGYxjpE3l/7hPb0GSVWPRVF+Ri/Uw+UNV6jQ7O6PAKlOVizwfSkHIT0gnNDYHimk7BjclmkcFC2uLX3V8g+qruBjw8R0SsuN9SUoInvxgrEglgDkAvrqDIG7gGKPPQsq+F/irmCUr9pXqHjFlzYMdt1p8wHbzhbJwoAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anGBHMpkRNS3irf0xtD7/V9+3wgjpOdhm92BhWy0Jd0=;
 b=fJgZpTZjwuPIfaMaU6x3QzNzPIp8oz/6u95lxF244O3fOoLaWKdXjibuYoafBC7jAg8DzKxj3b9/1AMiLguUfxoYniU8Ke80MlmEd+8PJDWy/YITn3jpB2r3FC4AFq5kw6Ad1MpCWraDUKZhV0IYko3BfN1kBKy3XLg0UKQ5NZQwfaZbNR3V2ClUE9Kb3x+OXPPevyWz51yb9reKab2qiKGPoKfevBBu576mkZnh1F+7gSLMnvnzbS5UAyOuHM2U0sdFLTQ8IWq4Xwy1tDYMt6jzp3U/RuMGGHR3UcCEehnIm5Y1nMNTNqPnokQt5sW88iUIiOr/WrarFAGbZvob8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by CO1PR11MB5122.namprd11.prod.outlook.com
 (2603:10b6:303:95::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 00:58:23 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::6466:20a6:57b4:1edf]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::6466:20a6:57b4:1edf%11]) with mapi id 15.20.5417.026; Wed, 13 Jul
 2022 00:58:22 +0000
Date: Tue, 12 Jul 2022 17:58:20 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, <nvdimm@lists.linux.dev>
Subject: RE: [REPOST PATCH] ndtest: Cleanup all of blk namespace specific code
Message-ID: <62ce18ac7164d_6070c294ce@dwillia2-xfh.jf.intel.com.notmuch>
References: <165763940218.3501174.7103619358744815702.stgit@ltc-boston123.aus.stglabs.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <165763940218.3501174.7103619358744815702.stgit@ltc-boston123.aus.stglabs.ibm.com>
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d59f970b-5c07-4239-367c-08da646ac8f0
X-MS-TrafficTypeDiagnostic: CO1PR11MB5122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEn2yhHCBaGtjMkvLqgHZAR2k4jUN3rEjqUQPFkdqFbL8EOGdNAjJLlSNXwluHeGevkYYTIWsJl8XRZn42Y3qYMuGR5Xt1ZkOx97F5sfjliWJpbsasK1Rvt92rknpFDPASKc9IX86a1l8DEJijNDD4VJ/H6CyMCNhJOQ0Y2o5RUUal6HHN73c0+xnrOWb1QDoFoFNG5XE4ZBPq3gs/O83bWaOX1i0ISQL6d1dGeYu8VywHMV4/Ujz4hRHcqDk+WKy3hmY6D5IW9/3VjLmfibHbj136f3pvgSViEku7C93liZZ6MDZFdVjjxQU5bityI7THFO6n2+AZdbCO16bpba/2YW6Nscg50B4BWZXAHHLgGGeys+WS0/96rqdidwyGR8S5YHJVbplI0fxMEOxsm6VbtWFEmH3ggso2qeUNRT8dsrkVUk6cNRQzVdfaQi/FAPxOqcUY/nKksId1hkP6K5eVKN6zJX6W+NweT7ng34Q/JJfBKBw5sIM7yPbjm00Glqv+aexAxzg4/vO07L6VoKJmrr5+Xs7L0bHBzX0khXC+Qy/3NBWLJ7Wo7GgsfIonR8eS0/DGkiTmeUvyD6Rshbzsuri+xcGgjKKJ/8FT+2X5X9G5SYv6b7QjXfyqerGBGPu8kOtLWitA2lzfO7CgQOh/q+ROlfDKG2jdjRYW5IxbhHUIqSobho9fcTed3xXIpEVTpBITctoF4vxB+D7Zc8txPJF3VZ73ovmvSXJHcSpkIi7ve59sLZHIlcS4rEqZFPlQdiCer8ksprVKHDuG3nPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(346002)(39860400002)(5660300002)(66556008)(8676002)(66946007)(41300700001)(478600001)(6486002)(316002)(66476007)(4326008)(9686003)(2906002)(26005)(6506007)(6512007)(86362001)(186003)(8936002)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hFTStqclRuSk9MNEs5VFhGUkR2WVR5N1JHNmtCYmNMQWl2RkppdzlmK05G?=
 =?utf-8?B?ajk2YlpIT3B1c2dteFNOV0dhT1NyNmNLM25nTnBUWGU4elMrTlhSVnB0amhl?=
 =?utf-8?B?ZklVcjJkRFpScXRvbUttUzR0WHBIZzNKK051NTNyL1FNRE1panYrcWNZeU9T?=
 =?utf-8?B?aDErK2pJcGU2L3BVbHpPTXZlKzEycGpzL2pjMy9sTUtGN1FFbTFWb2dVZHFJ?=
 =?utf-8?B?c2Z5d2lheUNINUJ3emZDZUJ1WEE5U3I1djJMK2J6aGswMm51TVN0bFZTdmhn?=
 =?utf-8?B?YkFpbnV3ZDJ0OTFtWCtlSURZcWpQalNYYzhPMDFya2ZST3ZRbkJXMktwdERX?=
 =?utf-8?B?SHRKN1o3ZmhEcGIxcUphU0ZITDJ5d3BHcElaS2pXWW5SMzVQMjAvRmJWUTFo?=
 =?utf-8?B?Y1lOU1RCM1huSHpzajFJRk4wNC9kd1BLUjNLTHNOOVhjTFVFbkV2L2VsdEZU?=
 =?utf-8?B?Q2FGOXJucXZMQis2OVZSWG42ZWNkUFNqZWt6SEpoRkpuNWJWYmR2YzIwT3Mx?=
 =?utf-8?B?Rk1oejFYclZ4VUxMQ2JzTFhybXVuR1cyQmM3dStaL3RyUmNvSkY1bno0MDdM?=
 =?utf-8?B?SCt0UTZ4bHJzMnA5OE0xTkN4OVdDVUN3eEVDV29VSFJ3OEZraVJRTUZCN0pF?=
 =?utf-8?B?TjZsYzZkNlBDS0hnUzJLRk04eDEzYTduVHR3S05jQTIrZWI2ck5zTE1PTE1s?=
 =?utf-8?B?MUZSMXU1bUhDcEVONHh5MVhpZktKZ1F1WDdmR0JDQ2pTYks2R2doVjRFQ3Nr?=
 =?utf-8?B?VldNbGNpYWVkOEFZQk9XSC9TSHhIaGZvL2xCbENmMmVBMHY1c3FrcGhSdXhs?=
 =?utf-8?B?ci9FVCs5OHlOWHQ4c2taWnpiQ0p3WXpoclFNbENTQU9HRDhZYWFzekRubk5X?=
 =?utf-8?B?UHhaTldOeEt5Ylh4aHU1RGFlVnp2MXZ0ZWFURWNSTnJrdUNzcHRjTCtyNUIx?=
 =?utf-8?B?dlBxTm1VczFGNXNZamtPS2VObFJSbFVsVm5RRlFaR2c1SlluMzZHTU5Jb1Rq?=
 =?utf-8?B?dDVwSnBtMm5yRlhRRitKdDg4MDVvUC9MRDVjK2ZCSUJUeDRnQytxdjhDdU8w?=
 =?utf-8?B?cURLZ2MxbzQ0eW54Y3dNeDFkS3BiVEcwMGpVOFRzN0x2RjVhREFjbDFiL3k3?=
 =?utf-8?B?UDhjbjEyTUZseXFtektaS0hGWnIwSTdKSisrakJ6MWxkQ1E4ZSt0eDd5N25L?=
 =?utf-8?B?SjRMa0Y3QUJVTlZhVlN3a2pqU1JyaERFR1BIazMwR2RwNXZSOWY1VUZ5YVpx?=
 =?utf-8?B?QmxuNHBqZkg3Mjl4aFkvc1QxUTQ4YnpEVkcwMm5mZTRTaE5oTmZhaUJTVHlU?=
 =?utf-8?B?UE1oR2N6d0VhdEdVVVZ1QU9JTFI0Ym5QOEdzNDdxbmd4ZlB1OEQvSEJmZXl6?=
 =?utf-8?B?NEV0QmlMSE82eUcyMFVsL2tlYVVZbTFwUG50bm5uazN5OCtVejVPbGRocEVm?=
 =?utf-8?B?d0ltQjk2SGNBQUFtdEhvQkVZbG90ZUdHZUd4QnAya0Y3UDRoRjdhZHVoYVE4?=
 =?utf-8?B?U29LQ0lYdlVRTjVmS3dqRGFldG4zZlhJb3JvSEdvZ1prREw3dHFVV3RrUXYz?=
 =?utf-8?B?dEhCQXEvVjVzMTRZV3Y5MnBHTThTamVDaTJkNHcvUUVKN2EwbDFGanlOU2FQ?=
 =?utf-8?B?cnpOSG5iRzhPVkNIbzVjVGN6bjJ6SktDemhLbTFhZ1ZSZmRmdHg3VUQ3aDlN?=
 =?utf-8?B?RFh5OWhoYzJaVWw2NmRNRUdLa1NHT2ZJU2pOT1ZSOFNidHA4VFdXeFg0azE3?=
 =?utf-8?B?VmlFMDdsZmMvbFY2SUkwT3h1UXorWURRNk8rOEFpTm5LVVkyRklQa1FNMERr?=
 =?utf-8?B?RHRidTRCc1JwQ2VRRENZZktnOUZzRnhKcS9sUzg5QVQ2K3VkYjBBWkg2WkxJ?=
 =?utf-8?B?Umt3cEF6cmlrSFM5WktFK09tcjBzeWlGcExnYjlSRHc0cGowS2FhZGsvZHlG?=
 =?utf-8?B?NEM5NXplZlhydEVRS0JvL1V1NElnTjd0UjJ1bmdGekZuRC9GcklFcnBHMEdk?=
 =?utf-8?B?Ykk2UWNzM0NWUWdSejVPMTQwQ3cwZjZoT0JTUkJ3UThWclFiV3RrbG0vRDFL?=
 =?utf-8?B?SUNPc1grSUx5Zi9hOG9KWlRYT1F3U1NRSjdaeEJXMjhyWEZCVFpYZ0R4ODNF?=
 =?utf-8?B?ZFQ2K1FmZTJHZDFFRmJXYnNXTzJIeE9TNkhnMzA0R2V2TFU1SEpCUXpLTFhh?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f970b-5c07-4239-367c-08da646ac8f0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 00:58:22.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmvBFVJWD3XKlTOAEokYjkas8PEvK1c+QZvzXxqKA6WqXeiYP+m/C04zA+il3yNDQCqe5+98ImZQs9QcFEN2d4u/4aaFzDAfb8yvc5unLus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
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
Cc: ira.weiny@intel.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shivaprasad G Bhat wrote:
> With the nd_namespace_blk and nd_blk_region infrastructures being removed,
> the ndtest still has some references to the old code. So the
> compilation fails as below,
> 
> ../tools/testing/nvdimm/test/ndtest.c:204:25: error: ‘ND_DEVICE_NAMESPACE_BLK’ undeclared here (not in a function); did you mean ‘ND_DEVICE_NAMESPACE_IO’?
>   204 |                 .type = ND_DEVICE_NAMESPACE_BLK,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~
>       |                         ND_DEVICE_NAMESPACE_IO
> ../tools/testing/nvdimm/test/ndtest.c: In function ‘ndtest_create_region’:
> ../tools/testing/nvdimm/test/ndtest.c:630:17: error: ‘ndbr_desc’ undeclared (first use in this function); did you mean ‘ndr_desc’?
>   630 |                 ndbr_desc.enable = ndtest_blk_region_enable;
>       |                 ^~~~~~~~~
>       |                 ndr_desc
> ../tools/testing/nvdimm/test/ndtest.c:630:17: note: each undeclared identifier is reported only once for each function it appears in
> ../tools/testing/nvdimm/test/ndtest.c:630:36: error: ‘ndtest_blk_region_enable’ undeclared (first use in this function)
>   630 |                 ndbr_desc.enable = ndtest_blk_region_enable;
>       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
> ../tools/testing/nvdimm/test/ndtest.c:631:35: error: ‘ndtest_blk_do_io’ undeclared (first use in this function); did you mean ‘ndtest_blk_mmio’?
>   631 |                 ndbr_desc.do_io = ndtest_blk_do_io;
>       |                                   ^~~~~~~~~~~~~~~~
>       |                                   ndtest_blk_mmio
> 
> The current patch removes the specific code to cleanup all obsolete
> references.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>

Looks good, applied.
