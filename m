Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCF604F25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 19:46:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsypX57wYz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 04:46:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NeFF/ADO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NeFF/ADO;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsynX2zKMz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 04:45:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666201552; x=1697737552;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=U1d+4ZECpZ/x5zaGXgTJBuusdQNG2yhtoNcG5S0NZCY=;
  b=NeFF/ADONHsGKCVLvvMjNpy2WkAV2VDeUF3O2cDQpaUdhyVeGcth+wn4
   K0ERg6zs0XqSfrQVyYWmoFN8G9AcEUXrsbqlzLb8fQ9ENCs7yvR5CtGRr
   CxQBGGOXmFAY36MHmvrv3kvTmkL2mA9FlyQXdXgzacy3/wTTyqzjD73YR
   NAbZl/Ov1g2HrYgcmF673jF+1nU+vDj7nrhbr/mgTqo9+/xWwG6orZSEZ
   a64SD+54G0O93CQB549w+jia9A1p1kOMHSFpXqh/lRhcnULSAlT3Gi2ta
   hiCP5/BVL0viSEhy3Nln3qjHNQ95ExcAj/xECeQfzwu6K2z99IH9sXNl0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="308171196"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="308171196"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 10:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="580453921"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="580453921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 19 Oct 2022 10:45:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:45:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:45:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 10:45:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 10:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFkCfREs/Ktyg7hvQiZNLSAVZpHHmCD4fE7kHmcfcSd4+MmfcsgRMuDNw32ud4AJ+66chAKEc0BIOTp5cchDZTN3RXc7YTyUi4fKCbyZu5X5iBv+yXWN3eF5+4PF+IslkyTDs0EESR4zCvOHOV22g55r/96jdvug/DPBo18urwCJ7FDEJ+yFsI333v75zjtzbNVRccZPjGAK+AxR34m6ZmsZW9SB+KV7MQaQG4Gg4RlPONA7BqNUxf/98xWBPWtn721RBGmRE5yy5H61eyAv6F1jsVT3/B5RYqR9eQB8RfD3JymWs3O7s2Uy4e+4BGOigYt95gYCAkuiNukC0pVhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnTw6H8ZZI6cvzZLhdjkB78rGQ0KSOogAkQo/FqtG/Q=;
 b=G4Y0oTibU4MklnUY8XFm/Ts8oFtQDmfehlLTFyne1N07O2dahts6WlDVCDSad9+kMiu24MG0vUCKUFmSEJ4dcNKKqd7pWAgy7ZnYD2bluZKn1mxLnwXMaJP6RIq/2/xGv42etoubwg/ONMJ6JscSmxx+Ig/IglwBD4jcd5JAa29JBEQ4QrC3u9f6UzVYCsIULhGkl/bJR5WrBL11Xm13eDkFny7hsAP2uWUR7yENMbmZaTSaCMX0uBJxmVHrIfWUBCX1VnQfTPYwk/qdrU+rNRfQYfzOwNnV9t+ctpz0xbgPuHiLhahHqVHhHehcqh+QX4QjsxjFW9PfrRpsVGMIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by PH7PR11MB6721.namprd11.prod.outlook.com
 (2603:10b6:510:1ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 17:45:41 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83%12]) with mapi id 15.20.5723.034; Wed, 19 Oct
 2022 17:45:41 +0000
Date: Wed, 19 Oct 2022 10:45:38 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Tony Luck <tony.luck@intel.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Message-ID: <635037c26bafa_24ac294c7@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019170835.155381-1-tony.luck@intel.com>
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b6de3d-4409-4a5e-3c59-08dab1f9bd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xaZWyKcfSX6jP3BlQz4/mkZwCq25KbDDaSs7zDLrW7T1V9/oEoXf1p7fGunQVVR2g7JcVOQH8whLv7e38nt8SML0bzAFrcDsjSEjTv8vTCEjiUH+pdlLsGUMA072hoqJEERHxVxc1Z1QJOf7L3VrA0KHH2FC6++QLnvA9keXJBvTzyfvrn46kMKPhwl8lGknxc+DKIjJ/R4gvnnsA4mX3aG2dAGcmk5MmqJq68GKzCBEfzXtNsM0RoD5afhi4R8WWB9uoGmEjqh3M5uWFtLZEDvjtNdi3PLUecnjljZdDFVYGVRM/+BvncoAIK/ND8p0sN/5NCILZBtySGpblM52Zb4lzZ7i65FagviQ2rADB1vZkpcGJR/Xn8CjK/R1DoinaHdO6c2/qMQOp4Dwt21Nwp7NhuMxKXhva55eIOvFqj6wRmIZIkM+omuCVfpCcaYQUBqbUbye6PM0cVOJpaBSvcpJuNrw2cc6PfXvcNQ6hv3EK01qgzOg4ot3iUqN3/aOYtoAmM5j7nG+ElDO0p5tyDxILk23FoehRva0q7d1MjxlQgcCzXzUf0mkC6r08Zjwxd19ZH7il0REBjxGISuKHOx8rTG2HzMhWO8vOPp+XXZon6sLAk2x/Pu8jPmJJ82vRCpbWwpJ2yeyf/T6uDVBcZtEmNPa0AKRbG0swze9CoufwQoxg5FO02JecCp77XZu3XVtcvDxUfttsFbMeSSn2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(86362001)(6486002)(38100700002)(110136005)(478600001)(316002)(54906003)(66556008)(4326008)(8676002)(66476007)(66946007)(83380400001)(6506007)(5660300002)(66899015)(41300700001)(6512007)(9686003)(26005)(82960400001)(7416002)(186003)(6666004)(107886003)(2906002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ngXzd8hxK/Bmm9WuLnjPvonkXiYTXeKwlfNO/fVQkFeMwa/Oed7tTCHi/5h2?=
 =?us-ascii?Q?8PnVPPqrCHVsDcv5e7FlBeYkh1QQzKjj0+wwng0sZMB71J+IxcY5k4qWxvj1?=
 =?us-ascii?Q?DQssFnGt1DPX3TOtVJAZ9RBK8ZRVW5HBNfESDZV1mKpTnuRHR3fU87TAl6cw?=
 =?us-ascii?Q?Kr64sxDwhaRkjJcIvXgIXMQO0au7vej1ztv55mY5XCYCV4HmpyoJngb4uMSQ?=
 =?us-ascii?Q?7TxMrFh5y/WDUV6yuXJxq2m6dWdm/hT162sJxuK6MuGSXDTTDmOE5BJ6tF1K?=
 =?us-ascii?Q?yWuuIepVADghiId3gxeqAeczt6O1IC5X7psGLfNFoT3c/DlylBdkyKTt9f7K?=
 =?us-ascii?Q?UbRxcCGfJvUu0FWq+KEybeWI893kY+8V8poCrTjadl5BDJ1HcDRHVE6+EXaq?=
 =?us-ascii?Q?lenfXBmJkfnkRyn2x6ECgh2uyFlAn94wcKrTJFwTaSWRW7RnKgoUX5/iGqqL?=
 =?us-ascii?Q?Hr/CEmGnQh3DGMzrIgqjNKuHWRPT7W19uTshzHYW7zXoJ3J5TbOLK5EvRv93?=
 =?us-ascii?Q?JElKFZPgszpMuQYsuE5L4MUeUnrClRiS/XlaNcQ9EheWFNXy+syuiaZ3BaxI?=
 =?us-ascii?Q?nkDB6F19YiPj+TOg8Gb2tzo/UVVC1aBwP87megr5z8IlKmFPUGAYBIOuc+aq?=
 =?us-ascii?Q?sbakl8SGkPqXPn4z7r8BKAnx//USX1g8Yj1+Mn+qVWgsyD97LCp8QfTLC81H?=
 =?us-ascii?Q?g7EAQaixdUNRxQnV/elzbdEUkn9lbOJa9e7NvSWDbKO/Z1t0TOpW4IAvBN7H?=
 =?us-ascii?Q?7rJbo1xMawPYvYXu0ENgD0tq/6Okf+t+PiXKE6GaY0AWuky50Sx8wkur/fA6?=
 =?us-ascii?Q?7WeN2suDukyay4EP8/jl36vkJ/Dx0JY2Z4j1Rbqninzo6zjfUJwlMVTxGbww?=
 =?us-ascii?Q?ocqHIV1ypqUQyUyg1yj0EZ/gBo7yagCWwwu7UqyreB5rTw0a9J4DR/GYgliw?=
 =?us-ascii?Q?FqhoEdT22g0wHFfI44lVAldzSiBAImwL312UTQOr15ScTJYZ7PsZ4ow59rDR?=
 =?us-ascii?Q?XvsLnkjPUMxy4F+EYOuETLf8i+erpmlQpfYU0plF2Y7lZfnmQviy51lNRtZC?=
 =?us-ascii?Q?EQl9PGLkCLkvjDShOBDMaoi5OkesaBB6XX2y5lHhpw+/RMW/MKoShOrRaNEc?=
 =?us-ascii?Q?UYgS847iTpfUu7PbgVgFYfbYx6wDyD4DmFlARCPyEMsl9+QjteMi2xU0klO/?=
 =?us-ascii?Q?q1wgKJwSSYMn1qNj1XMNBdJGN5lCPbljGJJyIXfSLR+tsnlBQUMIoRqfeZre?=
 =?us-ascii?Q?D5nQ5ajsAtxhPr7HqxopAHrN/Bd7P3EqbJusRCCYhEomZEty5t7zQTUlb7XZ?=
 =?us-ascii?Q?HGFx3KHUB8zwOMFnb5XcS2P9z8kBeVje+h2BCWXLoFrONA/iAW5xwK81mp/y?=
 =?us-ascii?Q?3aue6o0NzfE5RTCdzixaJcZpB5mJa/T4dCMSEPEbsKXDDgjoKdBMP/ovszU8?=
 =?us-ascii?Q?WkBPa79OpmoAGdgXkZudY5M1XgPFujKRwVKgNwufKwzu/ZeZqgctWTHlS7ho?=
 =?us-ascii?Q?qf8DWGeqb7+iIQILIc+gCnWdUBJBEdiua8T4Tu3SPVAQDuwAIk521sUGOKfE?=
 =?us-ascii?Q?Ad5zB25xn/YwXbZWNMrT0maSeAFZJ9AAfRU+1nbSomaOjYgSp7YIhKwjqWC+?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b6de3d-4409-4a5e-3c59-08dab1f9bd6f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 17:45:41.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9mHMHd7pQcBYdJ6qXXbAzAZbSA91Z84HCpkqST+xWZHMyyv0rNUOzPOZ4ocBG4R81ANbvQTxfxx0wKgTdLEIGMLOo0Ao/t95V+UDvPg63U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, Nicholas
 Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Tony Luck <tony.luck@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tony Luck wrote:
> If the kernel is copying a page as the result of a copy-on-write
> fault and runs into an uncorrectable error, Linux will crash because
> it does not have recovery code for this case where poison is consumed
> by the kernel.
> 
> It is easy to set up a test case. Just inject an error into a private
> page, fork(2), and have the child process write to the page.
> 
> I wrapped that neatly into a test at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/aegl/ras-tools.git
> 
> just enable ACPI error injection and run:
> 
>   # ./einj_mem-uc -f copy-on-write
> 
> Add a new copy_user_highpage_mc() function that uses copy_mc_to_kernel()
> on architectures where that is available (currently x86 and powerpc).
> When an error is detected during the page copy, return VM_FAULT_HWPOISON
> to caller of wp_page_copy(). This propagates up the call stack. Both x86
> and powerpc have code in their fault handler to deal with this code by
> sending a SIGBUS to the application.
> 
> Note that this patch avoids a system crash and signals the process that
> triggered the copy-on-write action. It does not take any action for the
> memory error that is still in the shared page. To handle that a call to
> memory_failure() is needed. But this cannot be done from wp_page_copy()
> because it holds mmap_lock(). Perhaps the architecture fault handlers
> can deal with this loose end in a subsequent patch?
> 
> On Intel/x86 this loose end will often be handled automatically because
> the memory controller provides an additional notification of the h/w
> poison in memory, the handler for this will call memory_failure(). This
> isn't a 100% solution. If there are multiple errors, not all may be
> logged in this way.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Just some minor comments below, but you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

> 
> ---
> Changes in V2:
>    Naoya Horiguchi:
> 	1) Use -EHWPOISON error code instead of minus one.
> 	2) Poison path needs also to deal with old_page
>    Tony Luck:
> 	Rewrote commit message
> 	Added some powerpc folks to Cc: list
> ---
>  include/linux/highmem.h | 19 +++++++++++++++++++
>  mm/memory.c             | 28 +++++++++++++++++++---------
>  2 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index e9912da5441b..5967541fbf0e 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -319,6 +319,25 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
>  
>  #endif
>  
> +static inline int copy_user_highpage_mc(struct page *to, struct page *from,
> +					unsigned long vaddr, struct vm_area_struct *vma)
> +{
> +	unsigned long ret = 0;
> +#ifdef copy_mc_to_kernel
> +	char *vfrom, *vto;
> +
> +	vfrom = kmap_local_page(from);
> +	vto = kmap_local_page(to);
> +	ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
> +	kunmap_local(vto);
> +	kunmap_local(vfrom);
> +#else
> +	copy_user_highpage(to, from, vaddr, vma);
> +#endif
> +
> +	return ret;
> +}
> +

There is likely some small benefit of doing this the idiomatic way and
let grep see that there are multiple definitions of
copy_user_highpage_mc() with an organization like:

#ifdef copy_mc_to_kernel
static inline int copy_user_highpage_mc(struct page *to, struct page *from,
                                        unsigned long vaddr,
                                        struct vm_area_struct *vma)
{    
        unsigned long ret = 0;
        char *vfrom, *vto;
     
        vfrom = kmap_local_page(from);
        vto = kmap_local_page(to);
        ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
        kunmap_local(vto);
        kunmap_local(vfrom);
     
        return ret;
}
#else
static inline int copy_user_highpage_mc(struct page *to, struct page *from,
                                        unsigned long vaddr,
                                        struct vm_area_struct *vma)
{       
        copy_user_highpage(to, from, vaddr, vma);
        return 0;
}
#endif

Per the copy_mc* discussion with Linus I would have called this function
copy_mc_to_user_highpage() to clarify that hwpoison is handled from the
source buffer of the copy.

>  #ifndef __HAVE_ARCH_COPY_HIGHPAGE
>  
>  static inline void copy_highpage(struct page *to, struct page *from)
> diff --git a/mm/memory.c b/mm/memory.c
> index f88c351aecd4..a32556c9b689 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2848,8 +2848,14 @@ static inline int pte_unmap_same(struct vm_fault *vmf)
>  	return same;
>  }
>  
> -static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
> -				       struct vm_fault *vmf)
> +/*
> + * Return:
> + *	-EHWPOISON:	copy failed due to hwpoison in source page
> + *	0:		copied failed (some other reason)
> + *	1:		copied succeeded
> + */
> +static inline int __wp_page_copy_user(struct page *dst, struct page *src,
> +				      struct vm_fault *vmf)
>  {
>  	bool ret;
>  	void *kaddr;
> @@ -2860,8 +2866,9 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  	unsigned long addr = vmf->address;
>  
>  	if (likely(src)) {
> -		copy_user_highpage(dst, src, addr, vma);
> -		return true;
> +		if (copy_user_highpage_mc(dst, src, addr, vma))
> +			return -EHWPOISON;

Given there is no use case for the residue value returned by
copy_mc_to_kernel() perhaps just return EHWPOISON directly from
copyuser_highpage_mc() in the short-copy case?

> +		return 1;
>  	}
>  
>  	/*
> @@ -2888,7 +2895,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  			 * and update local tlb only
>  			 */
>  			update_mmu_tlb(vma, addr, vmf->pte);
> -			ret = false;
> +			ret = 0;

What do you think about just making these 'false' cases also return a
negative errno? (rationale below...)

>  			goto pte_unlock;
>  		}
>  
> @@ -2913,7 +2920,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>  			/* The PTE changed under us, update local tlb */
>  			update_mmu_tlb(vma, addr, vmf->pte);
> -			ret = false;
> +			ret = 0;
>  			goto pte_unlock;
>  		}
>  
> @@ -2932,7 +2939,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  		}
>  	}
>  
> -	ret = true;
> +	ret = 1;
>  
>  pte_unlock:
>  	if (locked)
> @@ -3104,6 +3111,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  	pte_t entry;
>  	int page_copied = 0;
>  	struct mmu_notifier_range range;
> +	int ret;
>  
>  	delayacct_wpcopy_start();
>  
> @@ -3121,19 +3129,21 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		if (!new_page)
>  			goto oom;
>  
> -		if (!__wp_page_copy_user(new_page, old_page, vmf)) {
> +		ret = __wp_page_copy_user(new_page, old_page, vmf);
> +		if (ret <= 0) {

...this would become a typical '0 == success' and 'negative errno ==
failure', where all but EHWPOISON are retried.

>  			/*
>  			 * COW failed, if the fault was solved by other,
>  			 * it's fine. If not, userspace would re-fault on
>  			 * the same address and we will handle the fault
>  			 * from the second attempt.
> +			 * The -EHWPOISON case will not be retried.
>  			 */
>  			put_page(new_page);
>  			if (old_page)
>  				put_page(old_page);
>  
>  			delayacct_wpcopy_end();
> -			return 0;
> +			return ret == -EHWPOISON ? VM_FAULT_HWPOISON : 0;
