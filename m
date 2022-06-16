Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9F54EA1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 21:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPBx83B1Nz3btB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 05:26:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJwcaith;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=sohil.mehta@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJwcaith;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPBwL5glRz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 05:25:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655407539; x=1686943539;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6twCxiI3rX+qklTjPdvlqZpQu3HEuSp7DydIRm1CAvA=;
  b=lJwcaithtHUt3b0QUV6yg7ZhjklImICe6oUrrqF6tQGslK5kecTY7JD4
   HrPIvJnm2AMJQWTXlaQy3bJcDpU3HJuotqwNmcwXphfBrJ9YvYpEBpKpG
   48mSXsmzMIHcA3zxNJdBy5z6dxeBHIzsVITE6vzS/qVgevJbzKZPc31Gw
   qBMb1jHC1T4tsOdGWVWai0rCyRkyV2XQl69aby6USHMPCl8poNS/CHcBq
   3UL4SlIiQWX/ACyxX8DPolVyhBr6I8vC4OEs0FYqrnUdwP5TcASvjR4kJ
   7K2ecEAo1XfvLb1dZmSUzvRI+PuGSjJz7HFK5AwRa7/reX9lx3j9b+nRz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365685763"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="365685763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 12:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="687957474"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2022 12:25:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 12:25:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 12:25:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 16 Jun 2022 12:25:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 16 Jun 2022 12:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKtswqSQ5d3Pkwd4Ha5AHeGmlv3tPD9oNrBoywZZe4sV7oQGWfP/cJQARFoJKyAKmqM/JX0/2GXsB5vwlg6zIAfmHtBNDCU9U2x0NMRBQ4QXaPrepQXAYdT4NqY8QRIRUy4ZPAO3ex5z0dZ0U2KcoBFJp+VAXq+I1y1FdIr6kSEoijJmB6U6Nw6K6skrNjUH1q63Q7yawNdWa7bvPuNXALsHuf9AnhXEZTYMaZMRSX4SjqQpSHw4wHvIXGGLImhKDdkJkkbMlOaUhYLGKarYsZeGq9qpuy/g4P5nkz1JK7FG974cR2sVyFvDps4nQOnOck+3jwp6HSm1zAecPhSYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU4zdvtqOu0G1TWHVMJuQ4aV1q63Bnul+I+LXeEg4ZE=;
 b=O1kNVfMq52tBG4d2QuXfmJmXDYpF8UneIL0DT91C8T46Pkg+xMDLdETwdRncLux1qKv6aeB6Jz2zekxx+zN0NvGLPRqpXrHncbXAGav4CRYgRWpXWa2T018uAMyP6ksofd4vNzKWTihRaJUsF1i0b7X6ldkPYyC0P9ImTl1wQyqVOXBDSqT/RARZMIzekcQjSudgZbBng6TFiQycl6mDQN5pzHTN0DReb4L4nt0HFud952oXU0+WBjKIUersPFHzb38pcM+h13nRfXCBOW+ZZDMcOOapFxadgFGvRAbOU4Ny6SlnQqSC2erayeTWOlj/dqj713QdWk43atncT6lWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by BYAPR11MB3176.namprd11.prod.outlook.com (2603:10b6:a03:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 19:25:23 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::a4e0:2e7e:45de:a62]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::a4e0:2e7e:45de:a62%6]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 19:25:22 +0000
Message-ID: <b4f8ca28-f24a-d619-3682-d92fb35db56d@intel.com>
Date: Thu, 16 Jun 2022 12:25:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 3/6] testing/pkeys: Add additional test for
 pkey_alloc()
Content-Language: en-US
To: <ira.weiny@intel.com>, <linux-api@vger.kernel.org>
References: <20220610233533.3649584-1-ira.weiny@intel.com>
 <20220610233533.3649584-4-ira.weiny@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20220610233533.3649584-4-ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f164fa-ae3e-444e-360f-08da4fcdf51d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3176:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB3176FCE0BB53FA164706FB54E5AC9@BYAPR11MB3176.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OqvCkT4ghm2UQmf2yXcOsImUylWlijbF8OCj9kJcoTGLcQ1IPhMFVCIwBA02NfNS+xXcT9obzuM88QkNAxgT7Is3me12MqPpTKYrQHzFqbC+GvFQsi1Zpf0dXEGSfwZWhVtFtJ7N9VoggpQUWZwY+HGDoEYnAnoHAvXa5k9lJCgZ6QMHv6AFTlZkkqNqID6R5KQ+j57AFBpewbdIoF6vMCmVIt3916/FJ6Mtw5CYdkCDem7+Wd4Eusq22B+OmwKxyFvAu8grGANV+0dTkeIea9cXPTdjstRoZFJKqJl4m1HVY4fNLzmiz4fmoE+3SUnDyiy7KnsPn43PqPEiRQNg5syGPFAHnkVZRR5LYvl7PHD6TBWy+50pXLLxafZGpHOHF/+G1ial6xUKVppq3HhtrAXOzU5bYim7iBdldmWGWcfswgeogpFM6M1jPp9SUrgyJLpscLGCq/1wR3aMNFp5dAxW8ulHiFpe13fAa1bgKUZ73AUIYeUaAhGRkVKxbwDKvHhGTh3TxNSwVfFpxzofOKIw8HN91DIgyai5sv3waLx3fkQ86SnusipyIqDM+2DWdra7txKee1OGfavv/nnHi9+LXVbM4zCnX/8K+ossN2SkqDnHozvP05+kWizOA6+r3inLi5TOhULsu/ZAp2ebHeNS9hq8D5BED9z1ucMklSf03gJbO/EtMxx952fAIh2JkiDSZ/qtavWBZ0nJR/gfIZlTmPzT/0/4FnAkZMnUie/oYZTcPhSnSXg4YvHmtZHC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(5660300002)(4744005)(86362001)(508600001)(31686004)(6512007)(44832011)(316002)(66556008)(6506007)(54906003)(8676002)(186003)(36756003)(2616005)(6486002)(31696002)(4326008)(26005)(8936002)(83380400001)(66946007)(38100700002)(66476007)(2906002)(53546011)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhEMTc2S1BzZTZpZ29VaTV3NXNVaWFYRmhCQ2taYzB4WWwrNzgrUzJGMDBz?=
 =?utf-8?B?RENQdXFhZ25JN3hyd0R4TCtBc0pmY2hPM1VMczNyYW1CZ0Jhbk41MWJlSUdz?=
 =?utf-8?B?eDB1UDFMUTRqdjIxQ1ZGZVdJTTNOZCtzby9MZCtTK0pGQmpSWnA1bHN5bHpm?=
 =?utf-8?B?dDVLS3Z4S1puWDh6R2FyeVBRNmNoa2x2VlNyMFg5YTlHN0RYNEh2UjN6SXdF?=
 =?utf-8?B?U1pFcVdveklHY2UxWGYxOEtXSENBR3hIZGQxMzdQK1ZtUTM0SEs5cXVHRjNy?=
 =?utf-8?B?STFRWUZKekFhbUhjSHJwZjVqZkJZczRNWUR2cjV0UksrQmN3ZUNHTnNqRlhm?=
 =?utf-8?B?Z0JhMk01OS9OUi9mVUxYQklrVHFmeDdubFgyU2VFNEo1S1JWeElTYkRCSWZy?=
 =?utf-8?B?b1pRbzBSVHlXYU9NSW5rS3hzWStZa2lDajFOYWhPTmt4c0RYZGFGcm95aVZ6?=
 =?utf-8?B?RTRzZEM2RzJJdmZhQ1Rpa3VlV0dCanRDbE4wZEFYKzRRa3p3M29PR1lQZ050?=
 =?utf-8?B?ZDQrbFRiUEVGaklnVWdTR25TUUZobFRWc1gyWmNtR3hRZHFUM3RYMXZUVEIr?=
 =?utf-8?B?dG9EdGgyeVhaSlN4aVpJNDhxWExGMW1KaFpLMTNtckR5aVVGQ1BGcnVKTWcv?=
 =?utf-8?B?RTJIeVNkMmNVZFZlc2ZidE1kcm9JWjFwOU14dzJ2QjBZRERnOXduZW9sbFFq?=
 =?utf-8?B?U0diYXlQNk5IRDVaWDlLMHdOelp1enQvYzNLRTR6b09aT2h0MENoVUtnZkZ0?=
 =?utf-8?B?V1NML1gwNVJDT296Y3FncTVMczA5NHp1dFl5TExnZmFiWFI3djFGVy9zWE82?=
 =?utf-8?B?RkFaMkQrbHIrZXJrQWhITURuMi9ES2orNzA4UjA3ZnNDdTJXQ0p4TVBjNHhu?=
 =?utf-8?B?UG1rS3VEZ01Bc1dybjQrY3hkRlN0WGhidU13eUFxTkdZSEkxL05ZVkJyQXV2?=
 =?utf-8?B?RDQ2WWNzdDc0TGRiYVhoSmtzc0ptd0pMazE3U0FBWlh4TWxVYWlRY2xVVmwz?=
 =?utf-8?B?YW12emRFUnlFMjE2ZGgxdHg5b0lJczBuSFg2MHVCTHZYSVcyeXIyYVdpT2pC?=
 =?utf-8?B?SDZmTUEwQW51akI5NTdxajF0VjJZeTY2RTkzRVNCaDZpS1dPckN2ZEozdlh4?=
 =?utf-8?B?R2l2VnNwVURpMFJIZy9DTDN5b2VKbTg1T0hKa2o5ZlRibTNQM014NklxRktJ?=
 =?utf-8?B?bU81ZG96ZXNpZjBPSzNTdnJvTGNvM0l0WXFhTlQzSVB0V2JETFFjZXZvdHRM?=
 =?utf-8?B?bW9pNi9pMGpWZ3VsQmVENm1UTG8xYVNDa3FBbk82akZBb0FGTGg4YzNQSkhv?=
 =?utf-8?B?OE5GWEJYdXVtekZhMzhFNjFLeUFFNkJRT2IvY0IrUi9tS2t0RHFFZXYzTGZr?=
 =?utf-8?B?RDd1TzdTWFZ4Z2syK1BGTjRpdFQ1RWl5OTc0Uk5UenZ3M0JscmNZOTNvbFU5?=
 =?utf-8?B?VlNrcmoveURaUlllOFlnYjVWa0JHeUtoZDB2a1JzV2gxMWRrOHdSYTBEc3Br?=
 =?utf-8?B?QmNMTVpvMVFqbTU3akVTZUU0OCtVOGtXdlIvelEyd2RBMmhDK2owdXFXWTlr?=
 =?utf-8?B?K3FqYjJrazJNYkRROE1PWXp1L2czUHhub3llSXRhU2JNM2pMVXA1eGU4ZFdE?=
 =?utf-8?B?RUJzeXlwQVhoUFd2eTg4d3pGVnpGb0JEQTlSOXltN0xrRG05ZlR4M1pDL1NJ?=
 =?utf-8?B?YitKNmlFa2JGeWR2by9qR1Q3S2F6Y0lxbnF6a0FwVHUvTi9FWFBsN3piZndE?=
 =?utf-8?B?a2hzaXlnK3YxcHJXSE5GRktEK2lVVDYwVzk2Zm9VeTZMdFBXU3ltZHhVRTA3?=
 =?utf-8?B?OVRvNEI1UGhSTkZnazNWMEtzb0ErY2xONTlSQ2llOU1ScFBYM252TWhsbDFi?=
 =?utf-8?B?ODNCdVRBMzY5bUVLaFlxSkcvNTEvbVNaWHhWNEhaSUlaTk5Mb3l4UXdnZmFa?=
 =?utf-8?B?bmk5Sy9Ob0Q0RmdUREJkemFhNG1tQUowWEJ5ZFV0R1NzUlR3Y1cvM1dpNkNx?=
 =?utf-8?B?VzRjbXcyeVJUQmVZU1RhbWI0NStIdVJNVGEvMG9rUEV2a0hDaHJwU0E1OEFM?=
 =?utf-8?B?SmU1TTFhR09ka3l1M0thN2lGVW4vVG9IRFNTeVpWK1ZlZlFBdjFLbHN6Z3JB?=
 =?utf-8?B?R1lJUmRZeXdvMmdyQjJKbVlwU1dhWDRGY0JGdVlmRE45UGF4SWRwVkRwZEpV?=
 =?utf-8?B?VXRGNCtDZFBnSjdYOFptakpMKys0SzJoajVqTXBwMllqYUxkSnZNM2xMUDlF?=
 =?utf-8?B?YUs4VFhiU1prYWpDMTBGVHErdmhHMnpVZTQvZEZjQ2E5TTlSenZJa0p2bkRr?=
 =?utf-8?B?TjBvUEdSTHJNaW9QNGZpOHZJMUlxREdFTUExUkUreTN5YjByU2poejhpNlF0?=
 =?utf-8?Q?7zk9OxDmtaig+J9A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f164fa-ae3e-444e-360f-08da4fcdf51d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 19:25:22.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zsEOGgYSKS5rxDXdwVM2I4Ttt7V7UG4FqtHB0ZRjzXgXH4ezqqiDfrQVZogMv+3nXgh2Y5OE5edWAq5TOVm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3176
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
Cc: x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/10/2022 4:35 PM, ira.weiny@intel.com wrote:
>   
> +void test_pkey_alloc_on_unsupported_cpu(void)
> +{
> +	int test_pkey = sys_pkey_alloc(0, 0);
> +
> +	dprintf1("pkey_alloc: %d (%d %s)\n", test_pkey, errno,
> +		 strerror(errno));
> +	pkey_assert(test_pkey < 0);
> +	pkey_assert(errno == ENOSPC);

This assert fails on a kernel with 
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS disabled.

Since pkey_alloc() is an architecture dependent syscall, ENOSYS is 
returned instead of ENOSPC when support is disabled at compile time.
See kernel/sys_ni.c

This brings us to an interesting question.

Should we have different return error codes when compile support is 
disabled vs when runtime support is missing?

Here is the current behavior for pkey_alloc():

No compile time support -> return ENOSYS
No runtime support (but compile time support present) -> return ENOSPC

I would think applications would prefer the same error code. But, I am 
not sure if we can achieve this now due to ABI reasons.


> +}
> +
