Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CDD63B8D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 04:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLp3s0XRdz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 14:39:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpoP+pDZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=russell.h.weight@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpoP+pDZ;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLkxj6S05z3cS4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 12:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669684730; x=1701220730;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5dlYjQQzNJXVEELBzBTuWoXT7rRAuOKO7yAwUrOMsOA=;
  b=CpoP+pDZlgj5P4WD/IS8Ahjjct9d7Z9Nj3xiHAMMxWzUgpbzt3fX6Wlz
   8QShLseje/fMgq/DfZK346Jy0bQtIfZb2kB6kG8i/MmaVT3Hwv7MoEKfe
   RtrZMJldIvn4/O9xZAZEYptaRueYNa+Epdk4fMfxUyUypcCIPD18hftMj
   3Bpb3TvwtHzxfgh4x2ZQnKGBEpssT75N0MviOwaypoWxqovwhFqopBd9q
   R2IRskNEzE5Cm5ezblOWWeab91QDS4uz2OcmZ/IzumF2bJ4S/yXNxZJty
   L1u3995QBXV8cFgQFPhlMGe0vj1sjjPT5Lt5r1xnDCY7q5VPWwBGtGDLc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="379252978"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="379252978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 17:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="768254530"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="768254530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 28 Nov 2022 17:18:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 17:18:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 17:18:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 17:18:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ/6b1e1ieg5W49u60DFLsxP0r0zlLvAOALPf8hYVcmRcgu2JRnQ4v7GoBzzARPDIJUB6xi0Ma/JFG+hDO2uWOaaDvDMip1BYFIVRJLa3SSnkDTH1XtkIA/TFFQkbdc312HCEjCDkkvakYWfTERAB0VAtT+WlO66HqzfXvOPujYVdDeuz1WJlUbHu4Zf0kLKWld4VqHvP72sg4RT1it7rNPGj72eaohWOIryvUFIp2K/yL1ZFqiIOGdDQCo75S8YkUd/YaHxPpgtnzTVFfteKPx9Y/sYS/SxmifY+MJ8vOjAXXa3iovfVO3/Abosl48Jd2OjMRrcHqGCohzpkMfEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mInJWijbVAc50E01sjRMA2D89MgAnVmXKynACLpPeZ8=;
 b=BI4KW+K6wwSyNu1PkG/dQaRl1iHTWWrZbLns0ewW8EJ+vujtU4OCUmoI1buKlobSTdjrZ8484/CEeWQVUov1IYUd5NdzfuESBkW3vfF/mH9BqXHeAAWPVYL2BkRI63VISj6a6f/DMU/1sSWBKYX0aLOLAS1U42YLlW43eNParxnu8U5DKF7FGFNoL2s21yZhFhTtVujDfLKHQv9Z9zO2ZUx9uRapmU8p2FSx9N9dqMsWcmU03G2n0M/o2wqCi15b/5tpWNe/jDcZpp+UAGPDo4p0nMmZ9rlAFyN3loQMnFpyRSsVB8YAx8nwTX0CvttqvBsIeLvZ070B7890urTKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.6; Tue, 29 Nov
 2022 01:18:43 +0000
Received: from DM5PR11MB1899.namprd11.prod.outlook.com
 ([fe80::eead:b901:ac48:7680]) by DM5PR11MB1899.namprd11.prod.outlook.com
 ([fe80::eead:b901:ac48:7680%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 01:18:43 +0000
Message-ID: <6dc8ce0d-6587-5f39-d8cc-e4626ebfaf41@intel.com>
Date: Mon, 28 Nov 2022 17:18:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] firmware_loader: remove #include
 <generated/utsrelease.h>
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>, Luis Chamberlain
	<mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20221126051002.123199-1-linux@weissschuh.net>
From: Russ Weight <russell.h.weight@intel.com>
In-Reply-To: <20221126051002.123199-1-linux@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To DM5PR11MB1899.namprd11.prod.outlook.com
 (2603:10b6:3:10b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d9669a-7e84-458d-6067-08dad1a7a7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3N4GbxNAfgRQon0lQP0Bzl//4qRfFfvIhyVKuccfZlWxxXC/+ngbfubAPuaW5LMm0p2LyuNRYinxhjwpVy0GWg7dhbD8RFE72g5Lp3Y9LN6OsY86o6unySrn+y2PdTUAPAjrbIEekHnPVMPZM7/X5d7rGxcuF1POaC5klo8SQnTLWSJQI5kr/LZK8EzdYPcFiMvVq7fzI6vWLsUBRE9dvi7Zvetp6RMshEpgKZQx95kBbxIY1+SV48FnW+07au7rrzFu5TGUQQVWYydJNhSKXKY7KS8F2uBYgLWoJs0VH238QGhtCOTYAS7jgVeSN3mvWRgYJjoBacj/M/htIVHfuyVqYYaz9WTGAWk5ZyugSgKB1NiI1Kv0gxh3oZhWMko6hjeX4HMfOYMCpro47gimg+LveEOE6SO2macTsGRYs6fjNDbP7w3rn8eE5X6y2vIcZGSD/N1xDWi6NjKlFhZrcRknMPksHt8eMrF8lpSBX95DBaodzUbOBTQdtFbXBhrrItJxXimTyFvCuMz9v1PAyNiZ1jYqwdO8nXUaQjnf98UfGajIKG0HUYP9Xf/gix37vuTVFRFjnIGVzZ+V/zfH1dMdRvgA9cGMuHNrBCBixDddomxy4Qx+QGj+niJ7qVKFZ/EU3CQhFgW9m2xRNkaWwjiJWvsFf7mR6JsWNlfhACQx3MZgvoByuLCx7U0mAW799fECysuu1/qeJP/tFZYD9qBdDfG7aiP9C2liygFAPWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(186003)(26005)(6512007)(2616005)(110136005)(6506007)(53546011)(478600001)(6486002)(36756003)(82960400001)(86362001)(31696002)(83380400001)(38100700002)(31686004)(4744005)(2906002)(66556008)(66476007)(4326008)(8676002)(66946007)(41300700001)(8936002)(316002)(54906003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVnMUZBS0hwOGVzMk9PRU5wTGVNbnVnbm1TM0Y4M3VvdExnWXRwK3ZOdUxL?=
 =?utf-8?B?K2hGcXNFNUZZRDUrRWFjeWNJVnNMZlRlcEpzYnU4Q2pWd2JGdW5xQm9VbG9n?=
 =?utf-8?B?NGxhMDZtMnl2UXhKYk93UGY5ME9NZUxNaVQvUGV6bFRiSnlRYXJXa1JVaXJE?=
 =?utf-8?B?WjdFQ2tLUHZrWUp4OEpvQ3JkL2QyZzdzOTZSVDZjbGFMbXVqbDdTNWhUQUFv?=
 =?utf-8?B?Y2wweUlkUityUEd6ZEdLQ2JEcVNjUTNMWU0vOE0xVGtCekg5OVVLWFNHMFVQ?=
 =?utf-8?B?S1JGVzFDT3NoemlCN05qaW9scGlKR0g2VE01NEtFU0VZYlB5YTE5TERjbFd3?=
 =?utf-8?B?clBFR0VFb2ZRbTJZU1RIbUF2NEFXZ2pzbHRxOW9BeVhDL0hRRkVVN1F3d2hs?=
 =?utf-8?B?U1ljK0gxQVpQdktnbHR5amxiZjhtcGNZeTVOcldhRnZUQkUvWXJ2M24yM2lY?=
 =?utf-8?B?RHg1dzk3VjJHYkhZTXRQQ1MxdXRPbE1PWnlJRUd4cUNyaStrVSsrcEJZR0pm?=
 =?utf-8?B?VHlVY2MrMlZSUG1LS1BXMGdFRTZqTVJsQUk2N2R5Vi9OUkxEc1VZRms4Rk5u?=
 =?utf-8?B?bk8vSFJSYlpzc2Rxc0NCa3hENGRjUUVjRWhaVXJDa1FHUm12dXUvQXpJS0Yw?=
 =?utf-8?B?R3B2NzhmRjlhUmZPeFp6WUFZL0w3NVZ3N0VRU21UcHZvUTFTcHUzdVV1b0VP?=
 =?utf-8?B?UncrNU5KQVRySC9HRWhPNjlEakZHYlM0dTVYT2hQcjI5d0M5bEdEdi9mbm1q?=
 =?utf-8?B?bWkvWGxzWHJtSS9SRnVkOVN2TThFYmw4WHF3SmhPd3VHaXRvMEY4WTlVc2JZ?=
 =?utf-8?B?Y1phbkwrQ3ptc2JWK0FOWnNJakdCb3NaK2NrTk9seSsrcHYxYWZhVHMwMFRs?=
 =?utf-8?B?VWVDZjl3Y1dZYWJ5RS93aWQ0SGNnVmE0TWJHRCt1cm0walVaZmh4VDdJejJC?=
 =?utf-8?B?bWxVdFBZdGVqWCtPMDY2Z2NyN1laQzdHZWhDdkk2OGhvN3ZvUFZVNytrQXU2?=
 =?utf-8?B?K1JodXU0VWJqQ3hzRk95SXo2am1BTkIzTjZUSU1WcHhZbzVkMFlLcDlJVXZV?=
 =?utf-8?B?SmkycmRORE91QW8rVy9lTjJQMVpTNjJMc1dkQ3NZaE4wbnJhdEZzeUZJN0R2?=
 =?utf-8?B?TFRlbFp0NVlnT05PYmMwa0tFRTlxRHk5NlQwajRwak9vRkE2aFdkT1FyTnpp?=
 =?utf-8?B?SS8zeUF5cUxWRlRJV0FSYlUrZ0NMOEpTWTFuejl5cFBacUV4UWpMUVNPa0Zx?=
 =?utf-8?B?NHFGOFlVZENFanY3Z1hHdXdrdHpQR0pldTJFVGl3d29QQUJ6WUhWQi8xT0JR?=
 =?utf-8?B?UDN5SlBpdVNDV3dwa3loUjYvVGVUMVk3R0FVUEp5dzVIVnF5cVlTOGg4cmZ5?=
 =?utf-8?B?Tzc4TWwyRXhQZnJpNStJU0NEWWNnNTZRTUJMc1JXK0xYNVJ3ekhXNkdnK1RB?=
 =?utf-8?B?N21CcWpkTXFXTFl4U2dnWm1HajJYbFZ3bXk4S2ZNdGZ4T3VIZmtLYWlDZC9t?=
 =?utf-8?B?N09tREkyQ25abzdHVC9IYkxIeU8wMlpSSzFKa2VnREFoN25zaUFsajZudmRv?=
 =?utf-8?B?RVg5cEpzUVZaWjhEMWRYY0JlZVBEYlp2NG5oK2hMcDFXdmg3eDFuWXI3TjNJ?=
 =?utf-8?B?bkxybitQUWxLbnMwcjVYcUNJSytmRi83ZFFaSUd6a2RHTm5SeDdSWkxQODRj?=
 =?utf-8?B?alpvanozazcrM2JCdHFQd3RydTZJRGFYYy9xaDl1TktISmdoV2VBaU10dDNo?=
 =?utf-8?B?dkJtQmR6T1JtQzVsd240U1pBZ0ZwMGhnY0w2TTRZV254VzMrMmhkdXJWTUsr?=
 =?utf-8?B?VXRVZlpFWkVxRGRuTk93TjQ5QmJzNER4ZHJPNVRRYTFGUlc3WHU5d1IvV1N4?=
 =?utf-8?B?SkZNMXAyT09lK1pYOThkb2lXZk1FSG56WUlaMlhUKzBjWCs4RlgvTzRyNjNB?=
 =?utf-8?B?M2hlNU83WmFmbkYrRWVreWw0RmJBNTM4am50QnlTQkVFU01kMkJFN0prR21M?=
 =?utf-8?B?L0s0NUxPcFNibEJMUEFxU0tST1MrYXE3cWRtL3Zjd2lJM1B0cTc3N2dkWnB6?=
 =?utf-8?B?S2l5YmF3eXF2cVZ2ajBLRHJFUWM3OXdNUjNPdXEwUEtLNXlPL05YbXgyOFFJ?=
 =?utf-8?B?WGtEWUZ0S09OU2tBZ1BiZjlFS0JZbHc3Z2o4Y1h5ZG8rUjFYRktUZnYzdWlO?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d9669a-7e84-458d-6067-08dad1a7a7b8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 01:18:43.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gvmpef/0ICPjYL+dzuPVLsBvoObjGZu0Yt7ICrb6ym2eDtEVOnBS1A+KtWQCMklFOfgaYF31XmORsdb8q+enacEn7rd86sRUz4QalXAbu3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 29 Nov 2022 14:38:31 +1100
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/25/22 21:09, Thomas Weißschuh wrote:
> utsrelease.h is potentially generated on each build.
> By removing this unused include we can get rid of some spurious
> recompilations.
Reviewed-by: Russ Weight <russell.h.weight@intel.com>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/base/firmware_loader/firmware.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
> index fe77e91c38a2..bf549d6500d7 100644
> --- a/drivers/base/firmware_loader/firmware.h
> +++ b/drivers/base/firmware_loader/firmware.h
> @@ -9,8 +9,6 @@
>  #include <linux/list.h>
>  #include <linux/completion.h>
>  
> -#include <generated/utsrelease.h>
> -
>  /**
>   * enum fw_opt - options to control firmware loading behaviour
>   *
>
> base-commit: 0b1dcc2cf55ae6523c6fbd0d741b3ac28c9f4536

