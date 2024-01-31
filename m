Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3288433B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 03:22:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4GSLyPq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPm5k61cpz3c4M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 13:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4GSLyPq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=fengwei.yin@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 31 Jan 2024 13:21:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPm4v6t8Xz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 13:21:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706667712; x=1738203712;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EIF+z2bRzkM3jeOnSmOrh7dSn9whF3jBpZj+554MxXw=;
  b=n4GSLyPqgnPtVtGzedFqP/i1FYTjo61677iPRi5L+pdHXu+20a3geVwy
   Q3vN3fq46RtW7S09aLLbtE6j2+bV8nIHBurV9HBKCfDl8h+9oGPWebcU9
   viKGvXOiurdqdRK/U5P/1+Sk+qM66QZl0MTOEs9KJr+xI63bF9Fu9c7cX
   mPo2RmfOPCBpq+N+YjoGYsc1oaMQhTY5aF5OKjRiH3RmreMbcu9ntpAH6
   082LldNytkl7eeWZxoIFxqe2AknfPmFd4salswMRSH4NMju+fBnKdwkcW
   vnZyOn2Dig5hP5nqu6Z2QUD/qcHewRK9XhNgs+wRNy0fULKZjTqrVSIXU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16992351"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="16992351"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961461227"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="961461227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 18:20:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 18:20:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 18:20:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 18:20:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 18:20:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye7e9QoTRdAibPwGxz4mgckjrpIeJiSmZpKSOIzFF9HPqMzpaOvU0+Y/jFr0/27InjBBV9Nyps91hLtAPd/lyZNDQEkfhJsrkYym6f+uFq8v1e4vgGD2GEMgyHiX18Aiub47Z2/Skig6+RA6xzk2Xhdx4Ls22knHT4EhoAFbvy/xUWunigpOfzXpNHGq0UMrh36VnsgEq3zyxChgjGrC6MhlwHuKQozVYQ8IyVbvTVfSCUYvxK1WlM454S0Xv7DpOnJlTNqi4/tFZ02Lx+nAlfjAKqQqCVtpBdEsKezyr+0Ufjqo6DR9NYWCfrvDlt1c0edG0XelfHv0W5JIvFBsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjo/5AKenQvR57mE2rxFGzuXdbpl+wVcy8npun+5+bc=;
 b=M8QxhZEnYtHQvP56DK3c5MRC6tOm7F+CxPv2DX0nOBQ9DE8o3lTTPb/RmC1y2IsVjIuG3IkRA3NSesTOXx8uS7t1M17uUdgU/jWtIKSn1Q0GvaWq6OxS5J8MCZts/UbjUolqrv9H7I1GcwA04eUMgNMpnxaEP6zp6DKALd5kXcM8nftYlBX9txNAMecn7UYju4yHINP9w664xVy+0GArnpukSEhbP+zo7MHyADC4tE2m4R5yAuGhqJrKUHvleeGkqYJG3INjYJGijOLu0pvGYmOOzO1cJwFqEOXa+hSVxpSUDIvYvDWVAHNI07y0JEPvUwvoFkLE0tdjBjfJPtQv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 02:20:35 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::4647:3802:133d:8fc]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::4647:3802:133d:8fc%6]) with mapi id 15.20.7249.017; Wed, 31 Jan 2024
 02:20:35 +0000
Message-ID: <4ef64fd1-f605-4ddf-82e6-74b5e2c43892@intel.com>
Date: Wed, 31 Jan 2024 10:20:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] mm/memory: optimize unmap/zap with PTE-mapped THP
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20240129143221.263763-1-david@redhat.com>
From: Yin Fengwei <fengwei.yin@intel.com>
In-Reply-To: <20240129143221.263763-1-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|MN2PR11MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: 34800384-6fb1-40df-3231-08dc22033545
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfBguG4YbA1P23Q5GrGZLSqYMFosiKl4T6Hl6HlhhoJB2l5+HP1iBGjKaI+0xL1HZNWtfC0Sk8yNBkzMjpQ9EYPne0D96eOv7viYMfO4/rDQmzVx35IBKVlyWPfIVY/EA2UUf6aghqOqlIk8QILW+HOczlRLniWkHb5wlMDpeCQx97QUmOmzupBiRu2kJ8IRQgnWwihpfdYmLWlk0Pzyo/ED9obEoZ/Gm6hF89vmbg2VHBLxZDVbrF2irGbVk88PPaN2lNucDER/4jlFagYblADSo4ipSWq7ZrGWYZydD68fwVF8fGPhoeWqd/ixVDUt6jITTHU4yTQRVmGkO7Dh/sq+QLeaDBGQNhIcenIZGgSO0nxKR8x3nE0iqlBOUcXTQ8rnwrck7kaM4FSBXId/c/Ys6KHv72c+YNCrG3ks182UNuHvf30Gl0qOYBu9mICIgOJzwVOTF92ByGnwRczcenjlMesZ0hBeD6R/EFeJ2Hy7MJwZ6LScJ7Y2TYu/gU5u1d3t0A4qg/SRBUlzNMQxAt5rJxM67Xy69xrwK9U0nqp0ksNNc5nnByPL9hGVYGejFW9W9BT0hssukIHq/B/VnNxvkc365KYo6D7n1DwlqAxIkazfPLMBeJAIGWcm6+ArCnvntvW6T9yeQCyfhQ+eow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(2616005)(107886003)(83380400001)(478600001)(53546011)(6486002)(41300700001)(6506007)(6666004)(6512007)(36756003)(8936002)(8676002)(4326008)(82960400001)(316002)(66946007)(66556008)(66476007)(54906003)(2906002)(31686004)(5660300002)(7416002)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGM5bU15d2Z3cmFTWkZEdGhSM0hkVUVQTFdtSUpMN000Y0tpdUxlU1ViTi9a?=
 =?utf-8?B?cFlYRTVaVUJhTkR0V1J2b3lvdVZ0ckxPSGtOQzQzM0hpLzFjS25xbTNXZ2pi?=
 =?utf-8?B?bWZLR3pZV29rY2tWSnBBNHVsZEliZDZLb3RXSlJ6NGR4K0tJWi9walcxS1Ri?=
 =?utf-8?B?MlNOdWNTdnNmY1N1UEdub09zenMvd3EvUEhJNnhHbFBBOGsvTEQ5eWZNd0xw?=
 =?utf-8?B?a3UxbTQ4RENpNUc1SUtHa1htYUF6ZTdwOGlmY2pwaHhhTkwzSkN1am14bkoy?=
 =?utf-8?B?VWl0dVJQOEk3THorN3BZbUg5cDdyUlhmalRieE9lUEFhRE9pYTJOMWp0dlpm?=
 =?utf-8?B?NXV0SWMrMUlCMFR3akhaOTlxTHcrd3psZTBSV2Yrck5IcmVtaVdHdkRWYlZ0?=
 =?utf-8?B?a1ltK0p6UDRxQ21nYTJKQ20vNEh6VGxjenplUU5raGRmSmJOUytqT3JEeUxF?=
 =?utf-8?B?M1d3QVJCZWwxNW03RFFZT0U5L2REcnhtdGgvNFp5R3FQZFJ5dVkrTmNPT1Rs?=
 =?utf-8?B?dG5ockxyaDU0NE4xQ2NsUmM3dWNPYVJ4OUxNYlRtdkJNWnh0eE5PV2gwd3VT?=
 =?utf-8?B?Qkx0V0gwQzl0eEFQY295cm94Y296bXhDR2FScHlUT3RGa2dTQTNUbjlPNTk4?=
 =?utf-8?B?alIydmhRTXBNN0Jma3ZwcW04OXFkemQxejNZOTVCTUo5SGJGZnNSQVJJYUpk?=
 =?utf-8?B?YTZnMW91bllnL2U3SHo0ekZpcVMxYWNiNyt4UkRxcjZtZjNtZVBMTzVQOXRp?=
 =?utf-8?B?RTVnZlJUMXUrR0taTzJ3dEh0a3ZQY0piT05RRjlLNjA2dk1vK0JTTFNsSStY?=
 =?utf-8?B?TFcrR3VvSlQwK0VqanQ0NjdtME0rbis2ZHZoM3JhQm8wMGxLR2RNZXg4b3hK?=
 =?utf-8?B?MjVnWTBKMmJCRFNqYUo4TGdkdEsvTDJwSGdEL1J1UWwyV1FZbTA3b3NUSmg0?=
 =?utf-8?B?VHN3MmdKNmp6VnY2dFhxOVI4cnNCdDhRa25kaWxpVDNEMG8zSEJpZGJPVzln?=
 =?utf-8?B?aWUvdWZwZXRYeXhJWVJpZlNGOWxWQTcrNkhRM0JoaWd3ZTFvSFhXWGNCTUF0?=
 =?utf-8?B?eHBEbHF3V3dzRkk3MmJUVENMMStmdmx2VGZ6V1ZKMnVtY2N1cDkweEl6V2Y3?=
 =?utf-8?B?WndnZ3I5R21udnY3UlNxN3ptR1JSS2Q3WkFZZG1Tck83cG5CZ3Q1R0RLb1RN?=
 =?utf-8?B?S3ZoWitkY1VEdURxWWV2VmFrSWRyQzZOQUV6MStKSmQ1RDdWbnRLRkJkbk1B?=
 =?utf-8?B?RWlCS2RNSFBVMnFYcXhmY1hVa1N0cU9IcVZlbU9KQlBmTVJHaVZnc2xHRzE4?=
 =?utf-8?B?TVZoOXJ0dTNPbktTejA4OHBmVjNlMS9mYS9saEVxcnJydEJtaWtqU3paWkky?=
 =?utf-8?B?NmEyZ3ZmWm5yUWgwMHhtMXNyTFpsSzAvSnc1RnF3UUhvM3AxL3pjdU9jQmlX?=
 =?utf-8?B?YnFKWmVKaUhpdVdVQlFOaUEzYndvcUUwMDlCeS92eWxnUnVPdk5VbUNxRS9v?=
 =?utf-8?B?dkdzcVdkcFMza3lPdUNRUWwwaytOaVlyRlUyenNac2FZeVA4SlJpZkFjc0Zk?=
 =?utf-8?B?TFFweGJobzlyRWNGUFlNdW1oOGRmZ2Uzc01DMGd1Z2owRnlFK0ZKUlErcW5v?=
 =?utf-8?B?MmNodGdLTnpiYVpna0dIcWgvdmhEdDVnT2xrVlpsZWEwUWlNVng1TGcvc3Ru?=
 =?utf-8?B?Q1Z1cGVPbjdNU3pZN2hveEpldm4za2pzOXFjM0lJWG54blVCamUzVENwdFBX?=
 =?utf-8?B?WjZVMzZ1Rm1KS0pJZjZpVGZLWUMzY3RIZ0NmTjdLT0dMSGdhY2NrRGN1WnEw?=
 =?utf-8?B?QW16aWQyeVcxMWwzUWYzaVFKRWhBcDMrdndOcHAra1Q0MUI3UnNnM01SSnNS?=
 =?utf-8?B?OExCV290SXBCSUlkUVJxZ0ZNZmc4Q1FURG4wNFVUMnVPODJMMmN5dVJ0MHVR?=
 =?utf-8?B?WjhYdllXY3VwcG96REpsVCtYeFVPaXhZUWZvUVJUc01ubVJSV3cxOWhmTjRk?=
 =?utf-8?B?TkQvZ2tlNDRhVnRtUSszbWEvSWNWZnpMcmQxcFhGM1l3YVVZUDl3L2ZyRk5n?=
 =?utf-8?B?RXZYSUhCZDhsYkkvVzh6a29GdTZvVi9lTHIxbUNFUUhDaThXNGE5YWFwYW1U?=
 =?utf-8?Q?ejcrAVHk1iivokXMB6p/rldxi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34800384-6fb1-40df-3231-08dc22033545
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 02:20:35.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5b1OpTZEVgJS22Q/ezWAvFl25ehjA6b+DS4JkjE80SoFucAI+bg9osltQoEmvF+Gm4iTJHzim+CCoBU6sVwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin
 Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily
 Gorbik <gor@linux.ibm.com>, Matthew
 Wilcox <willy@infradead.org>, "Huang, Ying" <ying.huang@intel.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh
 Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/29/24 22:32, David Hildenbrand wrote:
> This series is based on [1] and must be applied on top of it.
> Similar to what we did with fork(), let's implement PTE batching
> during unmap/zap when processing PTE-mapped THPs.
> 
> We collect consecutive PTEs that map consecutive pages of the same large
> folio, making sure that the other PTE bits are compatible, and (a) adjust
> the refcount only once per batch, (b) call rmap handling functions only
> once per batch, (c) perform batch PTE setting/updates and (d) perform TLB
> entry removal once per batch.
> 
> Ryan was previously working on this in the context of cont-pte for
> arm64, int latest iteration [2] with a focus on arm6 with cont-pte only.
> This series implements the optimization for all architectures, independent
> of such PTE bits, teaches MMU gather/TLB code to be fully aware of such
> large-folio-pages batches as well, and amkes use of our new rmap batching
> function when removing the rmap.
> 
> To achieve that, we have to enlighten MMU gather / page freeing code
> (i.e., everything that consumes encoded_page) to process unmapping
> of consecutive pages that all belong to the same large folio. I'm being
> very careful to not degrade order-0 performance, and it looks like I
> managed to achieve that.

One possible scenario:
If all the folio is 2M size folio, then one full batch could hold 510M memory.
Is it too much regarding one full batch before just can hold (2M - 4096 * 2)
memory?


Regards
Yin, Fengwei

